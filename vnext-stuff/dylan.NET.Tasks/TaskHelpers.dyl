//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//await with continuations
class public static TaskHelpers
	
	//try
	//	await t
	//	do f
	//catch
	//	do cat
	//finally
	// do fin
	//end try
	
	//cancel variants
	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
		var ac = new AwaitClosure<of T, U>(f, cat, fin)
		if t::get_IsCompleted() then
			#if NET40
				return TaskEx::FromResult<of U>(ac::DoLogic(t))
			#else	
				return Task::FromResult<of U>(ac::DoLogic(t))
			end #if
		else
			return t::ContinueWith<of U>(new Func<of Task<of T>, U>(ac::DoLogic), token)
		end if
	end method
	
	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action, var token as CancellationToken)
		var ac = new AwaitClosure<of U>(f, cat, fin)
		if t::get_IsCompleted() then
			#if NET40
				return TaskEx::FromResult<of U>(ac::DoLogic(t))
			#else	
				return Task::FromResult<of U>(ac::DoLogic(t))
			end #if
		else
			return t::ContinueWith<of U>(new Func<of Task, U>(ac::DoLogic), token)
		end if
	end method
	
	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
		var ac = new AwaitClosure2<of T>(f, cat, fin)
		if t::get_IsCompleted() then
			ac::DoLogic(t)
			#if NET40
				return TaskEx::FromResult<of object>(new object())
			#else	
				return Task::FromResult<of object>(new object())
			end #if
		else
			return t::ContinueWith(new Action<of Task<of T> >(ac::DoLogic), token)
		end if
	end method
	
	method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>, var fin as Action, var token as CancellationToken)
		var ac = new AwaitClosure2(f, cat, fin)
		if t::get_IsCompleted() then
			ac::DoLogic(t)
			#if NET40
				return TaskEx::FromResult<of object>(new object())
			#else	
				return Task::FromResult<of object>(new object())
			end #if
		else
			return t::ContinueWith(new Action<of Task>(ac::DoLogic), token)
		end if
	end method
	
	//normal variants
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
	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>)
		return Await<of T,U>(t, f, CancellationToken::get_None())
	end method
	
	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>)
		return Await<of U>(t, f, CancellationToken::get_None())
	end method
	
	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>)
		return Await<of T>(t, f, CancellationToken::get_None())
	end method
	
	method public static Task Await(var t as Task, var f as Action)
		return Await(t, f, CancellationToken::get_None())
	end method
	
	//try
	//	await t
	//	do f
	//finally
	//	do fin
	//end try
	
	//cancel variants
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
	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var fin as Action)
		return Await<of T, U>(t, f, fin, CancellationToken::get_None())
	end method
	
	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var fin as Action)
		return Await<of U>(t, f, fin, CancellationToken::get_None())
	end method
	
	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var fin as Action)
		return Await<of T>(t, f, fin, CancellationToken::get_None())
	end method
	
	method public static Task Await(var t as Task, var f as Action, var fin as Action)
		return Await(t, f, fin, CancellationToken::get_None())
	end method
	
	//try
	//	await t
	//	do f
	//catch
	//	do cat
	//end try
	
	//cancel variants
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
	method public static Task<of U> Await<of T, U>(var t as Task<of T>, var f as Func<of T, U>, var cat as Func<of Exception, U>)
		return Await<of T, U>(t, f, cat, CancellationToken::get_None())
	end method
	
	method public static Task<of U> Await<of U>(var t as Task, var f as Func<of U>, var cat as Func<of Exception, U>)
		return Await<of U>(t, f, cat, CancellationToken::get_None())
	end method
	
	method public static Task Await<of T>(var t as Task<of T>, var f as Action<of T>, var cat as Action<of Exception>)
		return Await<of T>(t, f, cat, CancellationToken::get_None())
	end method
	
	method public static Task Await(var t as Task, var f as Action, var cat as Action<of Exception>)
		return Await(t, f, cat, CancellationToken::get_None())
	end method
	
end class
