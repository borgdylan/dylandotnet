//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public abstract TaskClosure<of T>
	
	field private TaskCompletionSource<of T> _tcs
	
	method family void TaskClosure()
		mybase::ctor()
		_tcs = new TaskCompletionSource<of T>()
	end method
	
	property public Task<of T> Task
		get
			return _tcs::get_Task()
		end get
	end property
	
	method family virtual void Finally()
	end method
	
	method family virtual void Catch(var e as Exception)
		_tcs::SetException(e)
		Finally()
	end method
	
	method family void Return(var result as T)
		_tcs::SetResult(result)
		Finally()
	end method
	
	method public Task<of T> Await<of U>(var t as Task<of U>, var f as Action<of U>)
		TaskHelpers::Await<of U>(t, f, new Action<of Exception>(Catch))
		return _tcs::get_Task()
	end method
	
	method public Task<of T> Await(var t as Task, var f as Action)
		TaskHelpers::Await(t, f, new Action<of Exception>(Catch))
		return _tcs::get_Task()
	end method
	
end class
