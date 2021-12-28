//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2021 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public AsyncValue<of TResult> implements IAsyncValue<of TResult>

	field private TResult _Value
	property public virtual initonly autogen boolean IsAvailable

	property public virtual TResult Value
		get
			return _Value
		end get
		set
			_Value = value
			_IsAvailable = true
		end set
	end property

	method public void AsyncValue()
		mybase::ctor()
	end method

end class
