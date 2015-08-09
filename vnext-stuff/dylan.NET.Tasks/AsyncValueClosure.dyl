//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class private AsyncValueClosure<of TResult>

	field private Action _f
	field private IAsyncValue<of TResult> _av

	method assembly void AsyncValueClosure(var f as Action, var av as IAsyncValue<of TResult>)
		mybase::ctor()
		_f = f
		_av = av
	end method

	method assembly void Adapt(var val as TResult)
		_av::set_Value(val)
		_f::Invoke()
	end method

end class
