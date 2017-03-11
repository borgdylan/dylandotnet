//    dnu.dll dylan.NET.Utils Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public sealed CompilerMsg

	property public autogen integer Line
	property public autogen integer Column
	property public autogen string File
	property public autogen string Msg

	method public void CompilerMsg(var line as integer, var col as integer, var file as string, var msg as string)
		mybase::ctor()
		_Line = line
		_Column = col
		_File = file
		_Msg = msg
	end method

	method public void CompilerMsg(var line as integer, var file as string, var msg as string)
		ctor(line, 0, file, msg)
	end method

	method public void CompilerMsg()
	    mybase::ctor()
	    _File = string::Empty
	    _Msg = string::Empty
	end method

end class