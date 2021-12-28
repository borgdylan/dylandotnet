//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2021 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public ConfiguredTaskAwaiterWrapper implements IAwaiter, INotifyCompletion

	field private ConfiguredTaskAwaitable\ConfiguredTaskAwaiter _awaiter

	method public void ConfiguredTaskAwaiterWrapper(var awaiter as ConfiguredTaskAwaitable\ConfiguredTaskAwaiter)
		mybase::ctor()
		_awaiter = awaiter
	end method

	property public final virtual boolean IsCompleted
		get
			return _awaiter::get_IsCompleted()
		end get
	end property

	method public final virtual void GetResult()
		_awaiter::GetResult()
	end method

	method public final virtual void OnCompleted(var continuation as Action)
		_awaiter::OnCompleted(continuation)
	end method

end class

class public ConfiguredTaskAwaitableWrapper implements IAwaitable

	field private ConfiguredTaskAwaitable _awaitable

	method public void ConfiguredTaskAwaitableWrapper(var awaitable as ConfiguredTaskAwaitable)
		mybase::ctor()
		_awaitable = awaitable
	end method

	method public final virtual IAwaiter GetAwaiter()
		return new ConfiguredTaskAwaiterWrapper(_awaitable::GetAwaiter())
	end method

end class
