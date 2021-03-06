//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2017 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.Threading

class public TaskClosure<of T>

	field private TaskCompletionSource<of T> _tcs
	field private CancellationToken? _ctoken

	method public void TaskClosure()
		mybase::ctor()
		_tcs = new TaskCompletionSource<of T>()
		_ctoken = $CancellationToken?$null
	end method

	property public Task<of T> Task
		get
			return _tcs::get_Task()
		end get
	end property

	property public CancellationToken Canceller
		get
			return _ctoken ?? CancellationToken::get_None()
		end get
		set
			_ctoken = new CancellationToken?(value)
		end set
	end property

	method family virtual void Finally()
	end method

	//throw using EDI.Capture.Throw to preserve the stack trace, falling back to wrapping on net40
	method public void Throw(var e as Exception)
		#if NET40 then
		throw new Exception(dylan.NET.Tasks.ExceptionMessages::get_RethrowingEx(), e)
		#else
		System.Runtime.ExceptionServices.ExceptionDispatchInfo::Capture(e)::Throw()
		end #if
	end method

	method family virtual void Catch(var e as Exception)
		Throw(e)
	end method

	method private void CatchOuter(var e as Exception)
		try
			Catch(e)
		catch
			SetHelper::TrySetException<of T>(_tcs, ex)
			Finally()
		end try
	end method

	method public void Return(var result as T)
		_tcs::TrySetResult(result)
		Finally()
	end method

	method public Task<of T> Await<of U>(var t as Task<of U>, var f as Action<of U>)
		TaskHelpers::Await<of U>(t, f, new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U>(var t as Task<of U>, var av as IAsyncValue<of U>, var f as Action)
		var clos2 = new AsyncValueClosure<of U>(f, av)
		TaskHelpers::Await<of U>(t, new Action<of U>(clos2::Adapt), new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await(var t as Task, var f as Action)
		TaskHelpers::Await(t, f, new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U, TException>(var t as Task<of U>, var f as Action<of U>, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		TaskHelpers::Await<of U>(t, f, new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U, TException>(var t as Task<of U>, var av as IAsyncValue<of U>, var f as Action, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		var clos2 = new AsyncValueClosure<of U>(f, av)
		TaskHelpers::Await<of U>(t, new Action<of U>(clos2::Adapt), new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of TException>(var t as Task, var f as Action, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		TaskHelpers::Await(t, f, new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method


	method public Task<of T> Await<of U>(var a as IAwaiter<of U>, var f as Action<of U>)
		TaskHelpers::Await<of U>(a, f, new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U>(var a as IAwaiter<of U>, var av as IAsyncValue<of U>, var f as Action)
		var clos2 = new AsyncValueClosure<of U>(f, av)
		TaskHelpers::Await<of U>(a, new Action<of U>(clos2::Adapt), new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await(var a as IAwaiter, var f as Action)
		TaskHelpers::Await(a, f, new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U, TException>(var a as IAwaiter<of U>, var f as Action<of U>, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		TaskHelpers::Await<of U>(a, f, new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U, TException>(var a as IAwaiter<of U>, var av as IAsyncValue<of U>, var f as Action, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		var clos2 = new AsyncValueClosure<of U>(f, av)
		TaskHelpers::Await<of U>(a, new Action<of U>(clos2::Adapt), new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of TException>(var a as IAwaiter, var f as Action, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		TaskHelpers::Await(a, f, new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method


	method public Task<of T> Await<of U>(var a as IAwaitable<of U>, var f as Action<of U>)
		TaskHelpers::Await<of U>(a::GetAwaiter(), f, new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U>(var a as IAwaitable<of U>, var av as IAsyncValue<of U>, var f as Action)
		var clos2 = new AsyncValueClosure<of U>(f, av)
		TaskHelpers::Await<of U>(a::GetAwaiter(), new Action<of U>(clos2::Adapt), new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await(var a as IAwaitable, var f as Action)
		TaskHelpers::Await(a::GetAwaiter(), f, new Action<of Exception>(CatchOuter), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U, TException>(var a as IAwaitable<of U>, var f as Action<of U>, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		TaskHelpers::Await<of U>(a::GetAwaiter(), f, new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of U, TException>(var a as IAwaitable<of U>, var av as IAsyncValue<of U>, var f as Action, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		var clos2 = new AsyncValueClosure<of U>(f, av)
		TaskHelpers::Await<of U>(a::GetAwaiter(), new Action<of U>(clos2::Adapt), new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method

	method public Task<of T> Await<of TException>(var a as IAwaitable, var f as Action, var c as Action<of TException>) where TException as {Exception}
		var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
		TaskHelpers::Await(a::GetAwaiter(), f, new Action<of Exception>(clos::Catch), get_Canceller())
		return _tcs::get_Task()
	end method

	#if !NET40 then

		method public Task<of T> Await<of U>(var t as ValueTask<of U>, var f as Action<of U>)
			TaskHelpers::Await<of U>(new ValueTaskAwaiterWrapper<of U>(t::GetAwaiter()), f, new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U>(var t as ValueTask<of U>, var av as IAsyncValue<of U>, var f as Action)
			var clos2 = new AsyncValueClosure<of U>(f, av)
			TaskHelpers::Await<of U>(new ValueTaskAwaiterWrapper<of U>(t::GetAwaiter()), new Action<of U>(clos2::Adapt), new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U, TException>(var t as ValueTask<of U>, var f as Action<of U>, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			TaskHelpers::Await<of U>(new ValueTaskAwaiterWrapper<of U>(t::GetAwaiter()), f, new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U, TException>(var t as ValueTask<of U>, var av as IAsyncValue<of U>, var f as Action, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			var clos2 = new AsyncValueClosure<of U>(f, av)
			TaskHelpers::Await<of U>(new ValueTaskAwaiterWrapper<of U>(t::GetAwaiter()), new Action<of U>(clos2::Adapt), new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method


		method public Task<of T> Await<of U>(var cta as ConfiguredValueTaskAwaitable<of U>, var f as Action<of U>)
			TaskHelpers::Await<of U>(new ConfiguredValueTaskAwaiterWrapper<of U>(cta::GetAwaiter()), f, new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U>(var cta as ConfiguredValueTaskAwaitable<of U>, var av as IAsyncValue<of U>, var f as Action)
			var clos2 = new AsyncValueClosure<of U>(f, av)
			TaskHelpers::Await<of U>(new ConfiguredValueTaskAwaiterWrapper<of U>(cta::GetAwaiter()), new Action<of U>(clos2::Adapt), new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U, TException>(var cta as ConfiguredValueTaskAwaitable<of U>, var f as Action<of U>, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			TaskHelpers::Await<of U>(new ConfiguredValueTaskAwaiterWrapper<of U>(cta::GetAwaiter()), f, new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U, TException>(var cta as ConfiguredValueTaskAwaitable<of U>, var av as IAsyncValue<of U>, var f as Action, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			var clos2 = new AsyncValueClosure<of U>(f, av)
			TaskHelpers::Await<of U>(new ConfiguredValueTaskAwaiterWrapper<of U>(cta::GetAwaiter()), new Action<of U>(clos2::Adapt), new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method

	end #if

	#if !PORTABLESHIM then

		method public Task<of T> Await(var ya as YieldAwaitable, var f as Action)
			TaskHelpers::Await(new YieldAwaiterWrapper(ya::GetAwaiter()), f, new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of TException>(var ya as YieldAwaitable, var f as Action, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			TaskHelpers::Await(new YieldAwaiterWrapper(ya::GetAwaiter()), f, new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U>(var cta as ConfiguredTaskAwaitable<of U>, var f as Action<of U>)
			TaskHelpers::Await<of U>(new ConfiguredTaskAwaiterWrapper<of U>(cta::GetAwaiter()), f, new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U>(var cta as ConfiguredTaskAwaitable<of U>, var av as IAsyncValue<of U>, var f as Action)
			var clos2 = new AsyncValueClosure<of U>(f, av)
			TaskHelpers::Await<of U>(new ConfiguredTaskAwaiterWrapper<of U>(cta::GetAwaiter()), new Action<of U>(clos2::Adapt), new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U, TException>(var cta as ConfiguredTaskAwaitable<of U>, var f as Action<of U>, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			TaskHelpers::Await<of U>(new ConfiguredTaskAwaiterWrapper<of U>(cta::GetAwaiter()), f, new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of U, TException>(var cta as ConfiguredTaskAwaitable<of U>, var av as IAsyncValue<of U>, var f as Action, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			var clos2 = new AsyncValueClosure<of U>(f, av)
			TaskHelpers::Await<of U>(new ConfiguredTaskAwaiterWrapper<of U>(cta::GetAwaiter()), new Action<of U>(clos2::Adapt), new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await(var cta as ConfiguredTaskAwaitable, var f as Action)
			TaskHelpers::Await(new ConfiguredTaskAwaiterWrapper(cta::GetAwaiter()), f, new Action<of Exception>(CatchOuter), get_Canceller())
			return _tcs::get_Task()
		end method

		method public Task<of T> Await<of TException>(var cta as ConfiguredTaskAwaitable, var f as Action, var c as Action<of TException>) where TException as {Exception}
			var clos = new CatchClosure<of TException>(c, new Action<of Exception>(CatchOuter))
			TaskHelpers::Await(new ConfiguredTaskAwaiterWrapper(cta::GetAwaiter()), f, new Action<of Exception>(clos::Catch), get_Canceller())
			return _tcs::get_Task()
		end method

	end #if
end class
