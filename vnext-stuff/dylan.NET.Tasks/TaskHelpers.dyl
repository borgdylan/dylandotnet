//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2017 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.Threading

//await with continuations
class public static TaskHelpers

    #if NET40 orelse PORTABLESHIM then
	method public static Task<of TResult> FromResult<of TResult>(var result as TResult)
    	var tcs as TaskCompletionSource<of TResult> = new TaskCompletionSource<of TResult>()
		tcs::SetResult(result)
        return tcs::get_Task()
	end method
	end #if

	#region "Code from TaskHelpers.Sources/ASP.NET"
		//The code in this region was ported from code in ASP.NET WebStack which is under the Apache License
		//Original code was: Copyright (c) Microsoft Open Technologies, Inc. All rights reserved. See COPYING.TaskHelpers.Sources
		//Optimization for .NET 4.6 done by the library author.

		#if !NET46 andalso !CORE50 then
			field private static initonly Task _defaultCompleted
		end #if

		field private static initonly Task<of object> _completedTaskReturningNull

		method private static void TaskHelpers()
			#if NET40 orelse PORTABLESHIM then
				_defaultCompleted = FromResult<of AsyncVoid>(default AsyncVoid)
				_completedTaskReturningNull = FromResult<of object>(null)
			#else
				#if !NET46 andalso !CORE50 then
				_defaultCompleted = Task::FromResult<of AsyncVoid>(default AsyncVoid)
				end #if
				_completedTaskReturningNull = Task::FromResult<of object>(null)
			end #if
		end method

        method public static Task<of TResult> FromError<of TResult>(var exception as Exception)
			#if NET46 orelse CORE50 then
				return Task::FromException<of TResult>(exception)
			#else
				var tcs as TaskCompletionSource<of TResult> = new TaskCompletionSource<of TResult>()
            	tcs::SetException(exception)
            	return tcs::get_Task()
			end #if
        end method

        method public static Task FromError(var exception as Exception)
            #if NET46 orelse CORE50 then
				return Task::FromException<of AsyncVoid>(exception)
			#else
				return FromError<of AsyncVoid>(exception)
			end #if
        end method

        method public static Task Completed()
			#if NET46 orelse CORE50 then
				return Task::get_CompletedTask()
			#else
				return _defaultCompleted
			end #if
        end method

        method public static Task<of object> NullResult()
            return _completedTaskReturningNull
        end method

	end #region

	//try
	//	await t
	//	do f
	//catch
	//	do cat
	//finally
	// do fin
	//end try

	//cancel variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
		var tcs = new TaskCompletionSource<of U>()
		var ac = new AwaitClosure<of T, U>(f, cat, fin) {_t = a, _tcs = tcs, _token = token}
		if a::get_IsCompleted() then
			ac::DoLogic()
		else
			a::OnCompleted(new Action(ac::DoLogic))
		end if
		return tcs::get_Task()
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
		var tcs = new TaskCompletionSource<of U>()
		var ac = new AwaitClosure<of U>(f, cat, fin) {_t = a, _tcs = tcs, _token = token}
		if a::get_IsCompleted() then
			ac::DoLogic()
		else
			a::OnCompleted(new Action(ac::DoLogic))
		end if
		return tcs::get_Task()
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
		var tcs = new TaskCompletionSource<of AsyncVoid>()
		var ac = new AwaitClosure2<of T>(f, cat, fin) {_t = a, _tcs = tcs, _token = token}
		if a::get_IsCompleted() then
			ac::DoLogic()
		else
			a::OnCompleted(new Action(ac::DoLogic))
		end if
		return tcs::get_Task()
	end method

	method public static Task Await(var a as IAwaiter, var f as Action, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
		var tcs = new TaskCompletionSource<of AsyncVoid>()
		var ac = new AwaitClosure2(f, cat, fin) {_t = a, _tcs = tcs, _token = token}
		if a::get_IsCompleted() then
			ac::DoLogic()
		else
			a::OnCompleted(new Action(ac::DoLogic))
		end if
		return tcs::get_Task()
	end method

	#if !NET40 andalso !PORTABLESHIM then
		method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
			return Await<of T, U>(new TaskAwaiterWrapper<of T>(t::GetAwaiter()), f, cat, fin, token)
		end method

		method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
			return Await<of U>(new TaskAwaiterWrapper(t::GetAwaiter()), f, cat, fin, token)
		end method

		method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
			return Await<of T>(new TaskAwaiterWrapper<of T>(t::GetAwaiter()), f, cat, fin, token)
		end method

		method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
			return Await(new TaskAwaiterWrapper(t::GetAwaiter()), f, cat, fin, token)
		end method
	#elseif NET40 then
		method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
			return Await<of T, U>(new TaskAwaiterWrapper<of T>(AwaitExtensions::GetAwaiter<of T>(t)), f, cat, fin, token)
		end method

		method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
			return Await<of U>(new TaskAwaiterWrapper(AwaitExtensions::GetAwaiter(t)), f, cat, fin, token)
		end method

		method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
			return Await<of T>(new TaskAwaiterWrapper<of T>(AwaitExtensions::GetAwaiter<of T>(t)), f, cat, fin, token)
		end method

		method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
			return Await(new TaskAwaiterWrapper(AwaitExtensions::GetAwaiter(t)), f, cat, fin, token)
		end method
	#else
		method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
			var ac = new AwaitClosure<of T, U>(f, cat, fin)
			if t::get_IsCompleted() then
				try
					return FromResult<of U>(ac::DoLogic(t))
				catch
					return FromError<of U>(ex)
				end try
			else
				return t::ContinueWith<of U>(new Func<of Task<of T>, U>(ac::DoLogic), token)
			end if
		end method

		method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
			var ac = new AwaitClosure<of U>(f, cat, fin)
			if t::get_IsCompleted() then
				try
					return FromResult<of U>(ac::DoLogic(t))
				catch
					return FromError<of U>(ex)
				end try
			else
				return t::ContinueWith<of U>(new Func<of Task, U>(ac::DoLogic), token)
			end if
		end method

		method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
			var ac = new AwaitClosure2<of T>(f, cat, fin)
			if t::get_IsCompleted() then
				try
					ac::DoLogic(t)
					return Completed()
				catch
					return FromError(ex)
				end try
			else
				return t::ContinueWith(new Action<of Task<of T> >(ac::DoLogic), token)
			end if
		end method

		method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
			var ac = new AwaitClosure2(f, cat, fin)
			if t::get_IsCompleted() then
				try
					ac::DoLogic(t)
					return Completed()
				catch
					return FromError(ex)
				end try
			else
				return t::ContinueWith(new Action<of Task>(ac::DoLogic), token)
			end if
		end method
	end #if

	//normal variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action)
		return Await<of T, U>(a, f, cat, fin, CancellationToken::get_None())
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action)
		return Await<of U>(a, f, cat, fin, CancellationToken::get_None())
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>, var cat as Action<of Exception>, var fin as Action)
		return Await<of T>(a, f, cat, fin, CancellationToken::get_None())
	end method

	method public static Task Await(var a as IAwaiter, var f as Action, var cat as Action<of Exception>, var fin as Action)
		return Await(a, f, cat, fin, CancellationToken::get_None())
	end method


	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action)
		return Await<of T, U>(t, f, cat, fin, CancellationToken::get_None())
	end method

	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action)
		return Await<of U>(t, f, cat, fin, CancellationToken::get_None())
	end method

	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>, var fin as Action)
		return Await<of T>(t, f, cat, fin, CancellationToken::get_None())
	end method

	method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>, var fin as Action)
		return Await(t, f, cat, fin, CancellationToken::get_None())
	end method

	//await t
	//do f

	//cancel variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>, var token as CancellationToken)
		return Await<of T, U>(a, f, $Func<of Exception, U>$null, $Action$null, token)
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>, var token as CancellationToken)
		return Await<of U>(a, f, $Func<of Exception, U>$null, $Action$null, token)
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>, var token as CancellationToken)
		return Await<of T>(a, f, $Action<of Exception>$null, $Action$null, token)
	end method

	method public static Task Await(var a as IAwaiter, var f as Action, var token as CancellationToken)
		return Await(a, f, $Action<of Exception>$null, $Action$null, token)
	end method

	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var token as CancellationToken)
		return Await<of T, U>(t, f, $Func<of Exception, U>$null, $Action$null, token)
	end method

	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var token as CancellationToken)
		return Await<of U>(t, f, $Func<of Exception, U>$null, $Action$null, token)
	end method

	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var token as CancellationToken)
		return Await<of T>(t, f, $Action<of Exception>$null, $Action$null, token)
	end method

	method public static Task Await(var t as Task, var f as Action, var token as CancellationToken)
		return Await(t, f, $Action<of Exception>$null, $Action$null, token)
	end method

	//normal variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>)
		return Await<of T,U>(a, f, $Func<of Exception, U>$null, $Action$null)
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>)
		return Await<of U>(a, f, $Func<of Exception, U>$null, $Action$null)
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>)
		return Await<of T>(a, f, $Action<of Exception>$null, $Action$null)
	end method

	method public static Task Await(var a as IAwaiter, var f as Action)
		return Await(a, f, $Action<of Exception>$null, $Action$null)
	end method

	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>)
		return Await<of T,U>(t, f, $Func<of Exception, U>$null, $Action$null)
	end method

	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>)
		return Await<of U>(t, f, $Func<of Exception, U>$null, $Action$null)
	end method

	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>)
		return Await<of T>(t, f, $Action<of Exception>$null, $Action$null)
	end method

	method public static Task Await(var t as Task, var f as Action)
		return Await(t, f, $Action<of Exception>$null, $Action$null)
	end method

	//try
	//	await t
	//	do f
	//finally
	//	do fin
	//end try

	//cancel variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>, var fin as Action, var token as CancellationToken)
		return Await<of T, U>(a, f, $Func<of Exception, U>$null, fin, token)
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>, var fin as Action, var token as CancellationToken)
		return Await<of U>(a, f, $Func<of Exception, U>$null, fin, token)
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>, var fin as Action, var token as CancellationToken)
		return Await<of T>(a, f, $Action<of Exception>$null, fin, token)
	end method

	method public static Task Await(var a as IAwaiter, var f as Action, var fin as Action, var token as CancellationToken)
		return Await(a, f, $Action<of Exception>$null, fin, token)
	end method

	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var fin as Action, var token as CancellationToken)
		return Await<of T, U>(t, f, $Func<of Exception, U>$null, fin, token)
	end method

	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var fin as Action, var token as CancellationToken)
		return Await<of U>(t, f, $Func<of Exception, U>$null, fin, token)
	end method

	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var fin as Action, var token as CancellationToken)
		return Await<of T>(t, f, $Action<of Exception>$null, fin, token)
	end method

	method public static Task Await(var t as Task, var f as Action, var fin as Action, var token as CancellationToken)
		return Await(t, f, $Action<of Exception>$null, fin, token)
	end method

	//normal variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>, var fin as Action)
		return Await<of T, U>(a, f, $Func<of Exception, U>$null, fin)
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>, var fin as Action)
		return Await<of U>(a, f, $Func<of Exception, U>$null, fin)
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>, var fin as Action)
		return Await<of T>(a, f, $Action<of Exception>$null, fin)
	end method

	method public static Task Await(var a as IAwaiter, var f as Action, var fin as Action)
		return Await(a, f, $Action<of Exception>$null, fin)
	end method

	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var fin as Action)
		return Await<of T, U>(t, f, $Func<of Exception, U>$null, fin)
	end method

	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var fin as Action)
		return Await<of U>(t, f, $Func<of Exception, U>$null, fin)
	end method

	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var fin as Action)
		return Await<of T>(t, f, $Action<of Exception>$null, fin)
	end method

	method public static Task Await(var t as Task, var f as Action, var fin as Action)
		return Await(t, f, $Action<of Exception>$null, fin)
	end method

	//try
	//	await t
	//	do f
	//catch
	//	do cat
	//end try

	//cancel variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var token as CancellationToken)
		return Await<of T, U>(a, f, cat, $Action$null, token)
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>, var cat as Func<of Exception, U>, var token as CancellationToken)
		return Await<of U>(a, f, cat, $Action$null, token)
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>, var cat as Action<of Exception>, var token as CancellationToken)
		return Await<of T>(a, f, cat, $Action$null, token)
	end method

	method public static Task Await(var a as IAwaiter, var f as Action, var cat as Action<of Exception>, var token as CancellationToken)
		return Await(a, f, cat, $Action$null, token)
	end method

	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var token as CancellationToken)
		return Await<of T, U>(t, f, cat, $Action$null, token)
	end method

	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>, var token as CancellationToken)
		return Await<of U>(t, f, cat, $Action$null, token)
	end method

	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>, var token as CancellationToken)
		return Await<of T>(t, f, cat, $Action$null, token)
	end method

	method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>, var token as CancellationToken)
		return Await(t, f, cat, $Action$null, token)
	end method

	//normal variants
	method public static Task<of U> Await<of T, U>(var a as IAwaiter<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>)
		return Await<of T, U>(a, f, cat, $Action$null)
	end method

	method public static Task<of U> Await<of U>(var a as IAwaiter, var f as Func<of U>, var cat as Func<of Exception, U>)
		return Await<of U>(a, f, cat, $Action$null)
	end method

	method public static Task Await<of T>(var a as IAwaiter<of T>, var f as Action<of T>, var cat as Action<of Exception>)
		return Await<of T>(a, f, cat, $Action$null)
	end method

	method public static Task Await(var a as IAwaiter, var f as Action, var cat as Action<of Exception>)
		return Await(a, f, cat, $Action$null)
	end method

	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>)
		return Await<of T, U>(t, f, cat, $Action$null)
	end method

	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>)
		return Await<of U>(t, f, cat, $Action$null)
	end method

	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>)
		return Await<of T>(t, f, cat, $Action$null)
	end method

	method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>)
		return Await(t, f, cat, $Action$null)
	end method

end class
