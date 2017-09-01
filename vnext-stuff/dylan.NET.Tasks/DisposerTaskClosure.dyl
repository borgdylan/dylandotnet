//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2017 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public DisposerTaskClosure<of TDisposable> extends DisposerTaskClosure<of AsyncVoid, TDisposable> where TDisposable as {IDisposable, class}

	method public void DisposerTaskClosure(var res as TDisposable)
		mybase::ctor(res)
	end method

	method public void Return()
		Return(default AsyncVoid)
	end method

end class
