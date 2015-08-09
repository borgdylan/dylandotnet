//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

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
				//#if DEBUG then
				//	Console::WriteLine("IsCompleted - short cut")
				//end #if
				return aw::get_IsCompleted()
			else
				//#if DEBUG then
				//	Console::WriteLine("IsCompleted - reflected")
				//end #if
				#if CORE50 then
					var prop = TypeExtensions::GetProperty(_awaiter::GetType(), "IsCompleted")
				#else
					var prop = _awaiter::GetType()::GetProperty("IsCompleted")
				end #if
				
				if prop isnot null then
					var val = prop::GetValue(_awaiter)
					if val::GetType()::Equals(gettype boolean) then
						return $boolean$val
					else
						throw new ArgumentException(c"The given object is not a boolean!", "flag")
					end if
				else
					throw new ArgumentException(c"The given object does not have the \qIsCompleted\q property!", "awaiter")
				end if
			end if
		end get
	end property

	method public virtual TResult GetResult()
		var aw = _awaiter as IAwaiter<of TResult>
		if aw isnot null then
			//#if DEBUG then
			//	Console::WriteLine("GetResult - short cut")
			//end #if
			return aw::GetResult()
		else
			//#if DEBUG then
			//	Console::WriteLine("GetResult - reflected")
			//end #if
			#if CORE50 then
				var met = TypeExtensions::GetMethod(_awaiter::GetType(), "GetResult", Type::EmptyTypes)
			#else
				var met = _awaiter::GetType()::GetMethod("GetResult", Type::EmptyTypes)
			end #if
			
			if met isnot null then
				var val = met::Invoke(_awaiter, new object[0])
				if val::GetType()::Equals(gettype TResult) then
					return $TResult$val
				else
					throw new ArgumentException(i"The given object is not a {#expr(gettype TResult)::ToString()}!", "result")
				end if
			else
				throw new ArgumentException(c"The given object does not have the \qGetResult\q method!", "awaiter")
			end if
		end if
		//return default TResult
	end method
	
	method public virtual void OnCompleted(var continuation as Action)
		var inc = _awaiter as INotifyCompletion
		if inc isnot null then
			//#if DEBUG then
			//	Console::WriteLine("OnCompleted - short cut")
			//end #if
			inc::OnCompleted(continuation)
		else
			//#if DEBUG then
			//	Console::WriteLine("OnCompleted - reflected")
			//end #if
			#if CORE50 then
				var met = TypeExtensions::GetMethod(_awaiter::GetType(), "OnCompleted", new Type[] {gettype Action})
			#else
				var met = _awaiter::GetType()::GetMethod("OnCompleted", new Type[] {gettype Action})
			end #if
			
			if met isnot null then
				met::Invoke(_awaiter, new object[] {continuation})
			else
				throw new ArgumentException(c"The given object does not have the \qOnCompleted(Action)\q method!", "awaiter")
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
			//#if DEBUG then
			//	Console::WriteLine("GetAwaiter - short cut")
			//end #if
			return aw::GetAwaiter()
		else
			//#if DEBUG then
			//	Console::WriteLine("GetAwaiter - reflected")
			//end #if
			#if CORE50 then
				var met = TypeExtensions::GetMethod(_awaitable::GetType(), "GetAwaiter", Type::EmptyTypes)
			#else
				var met = _awaitable::GetType()::GetMethod("GetAwaiter", Type::EmptyTypes)
			end #if
			
			if met isnot null then
				return new ReflectAwaiterWrapper<of TResult>(met::Invoke(_awaitable, new object[0]))
			else
				throw new ArgumentException(c"The given object does not have the \qGetAwaiter\q method!", "awaitable")
			end if
		end if
	end method

end class
