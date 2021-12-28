//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2021 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tasks
#if NETSTANDARD1_3 then
	import System.Reflection
end #if

class public ReflectAwaiterWrapper<of TResult> implements IAwaiter<of TResult>, INotifyCompletion

	field private object _awaiter

	method public void ReflectAwaiterWrapper(var awaiter as object)
		mybase::ctor()
		_awaiter = awaiter
	end method

	property public virtual boolean IsCompleted
		get
			var aw = _awaiter as IAwaiter<of TResult>
			if aw isnot null then
				return aw::get_IsCompleted()
			else
				#if NETSTANDARD1_3 then
					var prop = TypeExtensions::GetProperty(_awaiter::GetType(), "IsCompleted")
				#else
					var prop = _awaiter::GetType()::GetProperty("IsCompleted")
				end #if

				if prop isnot null then
					var val = prop::GetValue(_awaiter)
					if val::GetType()::Equals(gettype boolean) then
						return $boolean$val
					else
						throw new ArgumentException(ExceptionMessages::get_NotBoolean(), "flag")
					end if
				else
					throw new ArgumentException(ExceptionMessages::get_IsCompletedNotFound(), "awaiter")
				end if
			end if
		end get
	end property

	method public virtual TResult GetResult()
		var aw = _awaiter as IAwaiter<of TResult>
		if aw isnot null then
			return aw::GetResult()
		else
			#if NETSTANDARD1_3 then
				var met = TypeExtensions::GetMethod(_awaiter::GetType(), "GetResult", Type::EmptyTypes)
			#else
				var met = _awaiter::GetType()::GetMethod("GetResult", Type::EmptyTypes)
			end #if

			if met isnot null then
				#if NET46 or NET471 then
					var val = met::Invoke(_awaiter, Array::Empty<of object>())
				#else
					var val = met::Invoke(_awaiter, new object[0])
				end #if

				if val::GetType()::Equals(gettype TResult) then
					return $TResult$val
				else
					throw new ArgumentException(string::Format(ExceptionMessages::get_NotTResult(), #expr(gettype TResult)::ToString()), "result")
				end if
			else
				throw new ArgumentException(ExceptionMessages::get_GetResultNotFound(), "awaiter")
			end if
		end if
	end method

	method public virtual void OnCompleted(var continuation as Action)
		var inc = _awaiter as INotifyCompletion
		if inc isnot null then
			inc::OnCompleted(continuation)
		else
			#if NETSTANDARD1_3 then
				var met = TypeExtensions::GetMethod(_awaiter::GetType(), "OnCompleted", new Type[] {gettype Action})
			#else
				var met = _awaiter::GetType()::GetMethod("OnCompleted", new Type[] {gettype Action})
			end #if

			if met isnot null then
				met::Invoke(_awaiter, new object[] {continuation})
			else
				throw new ArgumentException(ExceptionMessages::get_OnCompletedNotFound(), "awaiter")
			end if
		end if
	end method

end class

class public ReflectWrapper<of TResult> implements IAwaitable<of TResult>

	field private object _awaitable

	method public void ReflectWrapper(var awaitable as object)
		mybase::ctor()
		_awaitable = awaitable
	end method

	method public virtual IAwaiter<of TResult> GetAwaiter()
		var aw = _awaitable as IAwaitable<of TResult>
		if aw isnot null then
			return aw::GetAwaiter()
		else
			#if NETSTANDARD1_3 then
				var met = TypeExtensions::GetMethod(_awaitable::GetType(), "GetAwaiter", Type::EmptyTypes)
			#else
				var met = _awaitable::GetType()::GetMethod("GetAwaiter", Type::EmptyTypes)
			end #if

			if met isnot null then
				#if NETSTANDARD2_0_OR_GREATER orelse NET46_OR_GREATER then
					return new ReflectAwaiterWrapper<of TResult>(met::Invoke(_awaitable, Array::Empty<of object>()))
				#else
					return new ReflectAwaiterWrapper<of TResult>(met::Invoke(_awaitable, new object[0]))
				end #if
			else
				throw new ArgumentException(ExceptionMessages::get_GetAwaiterNotFound(), "awaitable")
			end if
		end if
	end method

end class
