//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2021 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

//not supported on net40 as it is not an implementor of .NET Standard

class public ConfiguredValueTaskAwaiterWrapper implements IAwaiter, INotifyCompletion

	field private ConfiguredValueTaskAwaitable\ConfiguredValueTaskAwaiter _awaiter

	method public void ConfiguredValueTaskAwaiterWrapper(var awaiter as ConfiguredValueTaskAwaitable\ConfiguredValueTaskAwaiter)
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

class public ConfiguredValueTaskAwaitableWrapper implements IAwaitable

	field private ConfiguredValueTaskAwaitable _awaitable

	method public void ConfiguredValueTaskAwaitableWrapper(var awaitable as ConfiguredValueTaskAwaitable)
		mybase::ctor()
		_awaitable = awaitable
	end method

	method public final virtual IAwaiter GetAwaiter()
		return new ConfiguredValueTaskAwaiterWrapper(_awaitable::GetAwaiter())
	end method

end class
