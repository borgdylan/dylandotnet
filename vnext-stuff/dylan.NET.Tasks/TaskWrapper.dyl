//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public TaskAwaiterWrapper implements IAwaiter
	
	field private TaskAwaiter _awaiter
	
	method public void TaskAwaiterWrapper(var awaiter as TaskAwaiter)
		_awaiter = awaiter
	end method
	
	property public virtual boolean IsCompleted
		get
			return _awaiter::get_IsCompleted()
		end get
	end property

	method public virtual void GetResult()
		_awaiter::GetResult()
	end method
	
	method public virtual void OnCompleted(var continuation as Action)
		_awaiter::OnCompleted(continuation)
	end method
	
end class

class public TaskWrapper implements IAwaitable
	
	field private Task _awaitable
	
	method public void TaskWrapper(var awaitable as Task)
		_awaitable = awaitable
	end method
	
	method public virtual IAwaiter GetAwaiter()
		#if NET40 then
			return new TaskAwaiterWrapper(AwaitExtensions::GetAwaiter(_awaitable))
		#else
			return new TaskAwaiterWrapper(_awaitable::GetAwaiter())
		end #if
	end method

end class
