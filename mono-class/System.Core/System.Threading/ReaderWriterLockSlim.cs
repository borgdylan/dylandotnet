//
// System.Threading.ReaderWriterLockSlim.cs
//
// Author:
//       Jérémie "Garuma" Laval <jeremie.laval@gmail.com>
//
// Copyright (c) 2010 Jérémie "Garuma" Laval
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

using System;
using System.Collections;
using System.Collections.Generic;
using System.Security.Permissions;
using System.Diagnostics;
using System.Threading;

namespace System.Threading {

	[HostProtectionAttribute(SecurityAction.LinkDemand, MayLeakOnAbort = true)]
	[HostProtectionAttribute(SecurityAction.LinkDemand, Synchronization = true, ExternalThreading = true)]
	public class ReaderWriterLockSlim : IDisposable
	{
		/* Position of each bit isn't really important 
		 * but their relative order is
		 */
		const int RwReadBit = 3;

		const int RwWait = 1;
		const int RwWaitUpgrade = 2;
		const int RwWrite = 4;
		const int RwRead = 8;

		int rwlock;
		
		readonly LockRecursionPolicy recursionPolicy;

		AtomicBoolean upgradableTaken = new AtomicBoolean ();
#if NET_4_0
		ManualResetEventSlim upgradableEvent = new ManualResetEventSlim (true);
		ManualResetEventSlim writerDoneEvent = new ManualResetEventSlim (true);
		ManualResetEventSlim readerDoneEvent = new ManualResetEventSlim (true);
#else
		ManualResetEvent upgradableEvent = new ManualResetEvent (true);
		ManualResetEvent writerDoneEvent = new ManualResetEvent (true);
		ManualResetEvent readerDoneEvent = new ManualResetEvent (true);
#endif

		int numReadWaiters, numUpgradeWaiters, numWriteWaiters;
		bool disposed;

		static int idPool = int.MinValue;
		readonly int id = Interlocked.Increment (ref idPool);

		[ThreadStatic]
		static IDictionary<int, ThreadLockState> currentThreadState;

		public ReaderWriterLockSlim () : this (LockRecursionPolicy.NoRecursion)
		{
		}

		public ReaderWriterLockSlim (LockRecursionPolicy recursionPolicy)
		{
			this.recursionPolicy = recursionPolicy;
		}

		public void EnterReadLock ()
		{
			TryEnterReadLock (-1);
		}

		public bool TryEnterReadLock (int millisecondsTimeout)
		{
			ThreadLockState ctstate = CurrentThreadState;

			if (CheckState (millisecondsTimeout, LockState.Read)) {
				ctstate.ReaderRecursiveCount++;
				return true;
			}

			// This is downgrading from upgradable, no need for check since
			// we already have a sort-of read lock that's going to disappear
			// after user calls ExitUpgradeableReadLock.
			// Same idea when recursion is allowed and a write thread wants to
			// go for a Read too.
			if (CurrentLockState.Has (LockState.Upgradable)
			    || (recursionPolicy == LockRecursionPolicy.SupportsRecursion && ctstate.LockState.Has (LockState.Write))) {
				Interlocked.Add (ref rwlock, RwRead);
				ctstate.LockState ^= LockState.Read;
				ctstate.ReaderRecursiveCount++;

				return true;
			}
			
			Stopwatch sw = Stopwatch.StartNew ();
			Interlocked.Increment (ref numReadWaiters);
			int val = 0;

			while (millisecondsTimeout == -1 || sw.ElapsedMilliseconds < millisecondsTimeout) {
				if ((rwlock & 0x7) > 0) {
					writerDoneEvent.Wait (ComputeTimeout (millisecondsTimeout, sw));
					continue;
				}

				/* Optimistically try to add ourselves to the reader value
				 * if the adding was too late and another writer came in between
				 * we revert the operation.
				 */
				if (((val = Interlocked.Add (ref rwlock, RwRead)) & 0x7) == 0) {
					/* If we are the first reader, reset the event to let other threads
					 * sleep correctly if they try to acquire write lock
					 */
					if (val >> RwReadBit == 1)
						readerDoneEvent.Reset ();

					ctstate.LockState ^= LockState.Read;
					ctstate.ReaderRecursiveCount++;
					Interlocked.Decrement (ref numReadWaiters);
					return true;
				}

				Interlocked.Add (ref rwlock, -RwRead);

				writerDoneEvent.Wait (ComputeTimeout (millisecondsTimeout, sw));
			}

			Interlocked.Decrement (ref numReadWaiters);
			return false;
		}

		public bool TryEnterReadLock (TimeSpan timeout)
		{
			return TryEnterReadLock (CheckTimeout (timeout));
		}

		public void ExitReadLock ()
		{
			ThreadLockState ctstate = CurrentThreadState;

			if (!ctstate.LockState.Has (LockState.Read))
				throw new SynchronizationLockException ("The current thread has not entered the lock in read mode");

			if (--ctstate.ReaderRecursiveCount == 0) {
				ctstate.LockState ^= LockState.Read;
				if (Interlocked.Add (ref rwlock, -RwRead) >> RwReadBit == 0)
					readerDoneEvent.Set ();
			}
		}

		public void EnterWriteLock ()
		{
			TryEnterWriteLock (-1);
		}
		
		public bool TryEnterWriteLock (int millisecondsTimeout)
		{
			ThreadLockState ctstate = CurrentThreadState;

			if (CheckState (millisecondsTimeout, LockState.Write)) {
				ctstate.WriterRecursiveCount++;
				return true;
			}

			Stopwatch sw = Stopwatch.StartNew ();
			Interlocked.Increment (ref numWriteWaiters);
			bool isUpgradable = ctstate.LockState.Has (LockState.Upgradable);

			/* If the code goes there that means we had a read lock beforehand
			 * that need to be suppressed, we also take the opportunity to register
			 * our interest in the write lock to avoid other write wannabe process
			 * coming in the middle
			 */
			if (isUpgradable && rwlock >= RwRead)
				if (Interlocked.Add (ref rwlock, RwWaitUpgrade - RwRead) >> RwReadBit == 0)
					readerDoneEvent.Set ();

			int stateCheck = isUpgradable ? RwWaitUpgrade : RwWait;

			while (millisecondsTimeout < 0 || sw.ElapsedMilliseconds < millisecondsTimeout) {
				int state = rwlock;

				if (state <= stateCheck) {
					if (Interlocked.CompareExchange (ref rwlock, RwWrite, state) == state) {
						writerDoneEvent.Reset ();
						ctstate.LockState ^= LockState.Write;
						ctstate.WriterRecursiveCount++;
						Interlocked.Decrement (ref numWriteWaiters);
						return true;
					}
					state = rwlock;
				}

				// We register our interest in taking the Write lock (if upgradeable it's already done)
				if (!isUpgradable)
					while ((state & RwWait) == 0 && Interlocked.CompareExchange (ref rwlock, state | RwWait, state) == state)
						state = rwlock;

				// Before falling to sleep
				while (rwlock > stateCheck && (millisecondsTimeout < 0 || sw.ElapsedMilliseconds < millisecondsTimeout)) {
					if ((rwlock & RwWrite) != 0)
						writerDoneEvent.Wait (ComputeTimeout (millisecondsTimeout, sw));
					else if ((rwlock >> RwReadBit) > 0)
						readerDoneEvent.Wait (ComputeTimeout (millisecondsTimeout, sw));
				}
			}

			Interlocked.Decrement (ref numWriteWaiters);
			return false;
		}

		public bool TryEnterWriteLock (TimeSpan timeout)
		{
			return TryEnterWriteLock (CheckTimeout (timeout));
		}

		public void ExitWriteLock ()
		{
			ThreadLockState ctstate = CurrentThreadState;

			if (!ctstate.LockState.Has (LockState.Write))
				throw new SynchronizationLockException ("The current thread has not entered the lock in write mode");
			
			if (--ctstate.WriterRecursiveCount == 0) {
				bool isUpgradable = ctstate.LockState.Has (LockState.Upgradable);
				ctstate.LockState ^= LockState.Write;

				int value = Interlocked.Add (ref rwlock, isUpgradable ? RwRead - RwWrite : -RwWrite);
				writerDoneEvent.Set ();
				if (isUpgradable && value >> RwReadBit == 1)
					readerDoneEvent.Reset ();
			}
		}

		public void EnterUpgradeableReadLock ()
		{
			TryEnterUpgradeableReadLock (-1);
		}

		//
		// Taking the Upgradable read lock is like taking a read lock
		// but we limit it to a single upgradable at a time.
		//
		public bool TryEnterUpgradeableReadLock (int millisecondsTimeout)
		{
			ThreadLockState ctstate = CurrentThreadState;

			if (CheckState (millisecondsTimeout, LockState.Upgradable)) {
				ctstate.UpgradeableRecursiveCount++;
				return true;
			}

			if (ctstate.LockState.Has (LockState.Read))
				throw new LockRecursionException ("The current thread has already entered read mode");

			Stopwatch sw = Stopwatch.StartNew ();
			Interlocked.Increment (ref numUpgradeWaiters);

			while (!upgradableEvent.IsSet () || !upgradableTaken.TryRelaxedSet ()) {
				if (millisecondsTimeout != -1 && sw.ElapsedMilliseconds > millisecondsTimeout) {
					Interlocked.Decrement (ref numUpgradeWaiters);
					return false;
				}

				upgradableEvent.Wait (ComputeTimeout (millisecondsTimeout, sw));
			}

			upgradableEvent.Reset ();

			if (TryEnterReadLock (ComputeTimeout (millisecondsTimeout, sw))) {
				ctstate.LockState = LockState.Upgradable;
				Interlocked.Decrement (ref numUpgradeWaiters);
				ctstate.ReaderRecursiveCount--;
				ctstate.UpgradeableRecursiveCount++;
				return true;
			}

			upgradableTaken.Value = false;
			upgradableEvent.Set ();

			Interlocked.Decrement (ref numUpgradeWaiters);

			return false;
		}

		public bool TryEnterUpgradeableReadLock (TimeSpan timeout)
		{
			return TryEnterUpgradeableReadLock (CheckTimeout (timeout));
		}
	       
		public void ExitUpgradeableReadLock ()
		{
			ThreadLockState ctstate = CurrentThreadState;

			if (--ctstate.UpgradeableRecursiveCount == 0) {
				upgradableTaken.Value = false;
				upgradableEvent.Set ();

				ctstate.LockState ^= LockState.Upgradable;
				if (Interlocked.Add (ref rwlock, -RwRead) >> RwReadBit == 0)
					readerDoneEvent.Set ();
			}
		}

		public void Dispose ()
		{
			disposed = true;
		}

		public bool IsReadLockHeld {
			get {
				return rwlock >= RwRead && CurrentThreadState.LockState.Has (LockState.Read);
			}
		}
		
		public bool IsWriteLockHeld {
			get {
				return (rwlock & RwWrite) > 0 && CurrentThreadState.LockState.Has (LockState.Write);
			}
		}
		
		public bool IsUpgradeableReadLockHeld {
			get {
				return upgradableTaken.Value && CurrentThreadState.LockState.Has (LockState.Upgradable);
			}
		}

		public int CurrentReadCount {
			get {
				return (rwlock >> RwReadBit) - (upgradableTaken.Value ? 1 : 0);
			}
		}
		
		public int RecursiveReadCount {
			get {
				return CurrentThreadState.ReaderRecursiveCount;
			}
		}

		public int RecursiveUpgradeCount {
			get {
				return CurrentThreadState.UpgradeableRecursiveCount;
			}
		}

		public int RecursiveWriteCount {
			get {
				return CurrentThreadState.WriterRecursiveCount;
			}
		}

		public int WaitingReadCount {
			get {
				return numReadWaiters;
			}
		}

		public int WaitingUpgradeCount {
			get {
				return numUpgradeWaiters;
			}
		}

		public int WaitingWriteCount {
			get {
				return numWriteWaiters;
			}
		}

		public LockRecursionPolicy RecursionPolicy {
			get {
				return recursionPolicy;
			}
		}

		LockState CurrentLockState {
			get {
				return CurrentThreadState.LockState;
			}
			set {
				CurrentThreadState.LockState = value;
			}
		}

		ThreadLockState CurrentThreadState {
			get {
				if (currentThreadState == null)
					currentThreadState = new Dictionary<int, ThreadLockState> ();

				ThreadLockState state;
				if (!currentThreadState.TryGetValue (id, out state))
					currentThreadState[id] = state = new ThreadLockState ();

				return state;
			}
		}

		bool CheckState (int millisecondsTimeout, LockState validState)
		{
			if (disposed)
				throw new ObjectDisposedException ("ReaderWriterLockSlim");

			if (millisecondsTimeout < Timeout.Infinite)
				throw new ArgumentOutOfRangeException ("millisecondsTimeout");

			// Detect and prevent recursion
			LockState ctstate = CurrentLockState;

			if (recursionPolicy == LockRecursionPolicy.NoRecursion)
				if ((ctstate != LockState.None && ctstate != LockState.Upgradable)
				    || (ctstate == LockState.Upgradable && validState == LockState.Upgradable))
					throw new LockRecursionException ("The current thread has already a lock and recursion isn't supported");

			// If we already had right lock state, just return
			if (ctstate.Has (validState))
				return true;

			CheckRecursionAuthorization (ctstate, validState);

			return false;
		}

		static void CheckRecursionAuthorization (LockState ctstate, LockState desiredState)
		{
			// In read mode you can just enter Read recursively
			if (ctstate == LockState.Read)
				throw new LockRecursionException ();				
		}

		static int CheckTimeout (TimeSpan timeout)
		{
			try {
				return checked ((int)timeout.TotalMilliseconds);
			} catch (System.OverflowException) {
				throw new ArgumentOutOfRangeException ("timeout");
			}
		}

		static int ComputeTimeout (int millisecondsTimeout, Stopwatch sw)
		{
			return millisecondsTimeout == -1 ? -1 : (int)Math.Max (sw.ElapsedMilliseconds - millisecondsTimeout, 1);
		}
	}
}
