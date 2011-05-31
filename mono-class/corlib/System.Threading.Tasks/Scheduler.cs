// Scheduler.cs
//
// Copyright (c) 2008 Jérémie "Garuma" Laval
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//

#if NET_4_0 || BOOTSTRAP_NET_4_0
using System;
using System.Collections.Concurrent;

namespace System.Threading.Tasks
{
	internal class Scheduler: TaskScheduler, IScheduler
	{
		readonly IProducerConsumerCollection<Task> workQueue;
		readonly ThreadWorker[]        workers;
		readonly ManualResetEvent      pulseHandle = new ManualResetEvent (false);

		public Scheduler ()
			: this (Environment.ProcessorCount, ThreadPriority.Normal)
		{
			
		}
		
		public Scheduler (int maxWorker, ThreadPriority priority)
		{
			workQueue = new ConcurrentQueue<Task> ();
			workers = new ThreadWorker [maxWorker];
			
			for (int i = 0; i < maxWorker; i++) {
				workers [i] = new ThreadWorker (this, workers, i, workQueue, priority, pulseHandle);
				workers [i].Pulse ();
			}
		}
		
		public void AddWork (Task t)
		{
			// Add to the shared work pool
			workQueue.TryAdd (t);
			// Wake up some worker if they were asleep
			PulseAll ();
		}

		public void ParticipateUntil (Task task)
		{
			if (task.IsCompleted)
				return;
			
			ParticipateUntil (() => task.IsCompleted);
		}
		
		public bool ParticipateUntil (Task task, Func<bool> predicate)
		{
			if (task.IsCompleted)
				return false;
			
			bool isFromPredicate = false;
			
			ParticipateUntil (delegate {
				if (predicate ()) {
					isFromPredicate = true;
					return true;
				}
				return task.IsCompleted;
			});
				
			return isFromPredicate;
		}
		
		// Called with Task.WaitAll(someTasks) or Task.WaitAny(someTasks) so that we can remove ourselves
		// also when our wait condition is ok
		public void ParticipateUntil (Func<bool> predicate)
		{	
			ThreadWorker.WorkerMethod (predicate, workQueue, workers, pulseHandle);
		}
		
		public void PulseAll ()
		{
			pulseHandle.Set ();
		}
		
		public void Dispose ()
		{
			foreach (ThreadWorker w in workers)
				w.Dispose ();
		}
		#region Scheduler dummy stubs
		protected override System.Collections.Generic.IEnumerable<Task> GetScheduledTasks ()
		{
			throw new System.NotImplementedException();
		}

		protected internal override void QueueTask (Task task)
		{
			throw new System.NotImplementedException();
		}

		protected internal override bool TryDequeue (Task task)
		{
			throw new System.NotImplementedException();
		}

		protected override bool TryExecuteTaskInline (Task task, bool taskWasPreviouslyQueued)
		{
			task.Execute (null);
			return true;
		}
		
		public override int MaximumConcurrencyLevel {
			get {
				return base.MaximumConcurrencyLevel;
			}
		}
		#endregion
	}
}
#endif
