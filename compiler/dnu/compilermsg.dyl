//    dnu.dll dylan.NET.Utils Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi sealed CompilerMsg

	field private integer _Line
	field private string _File
	field private string _Msg
	
	method public void CompilerMsg()
		_Line = 0
		_File = ""
		_Msg = ""
	end method

	method public void CompilerMsg(var line as integer, var file as string, var msg as string)
		me::_Line = line
		me::_File = file
		me::_Msg = msg
	end method
	
	method public hidebysig specialname integer get_Line()
		return _Line
	end method

	property none integer Line
		get get_Line()
	end property
	
	method public hidebysig specialname string get_File()
		return _File
	end method

	property none string File
		get get_File()
	end property
	
	method public hidebysig specialname string get_Msg()
		return _Msg
	end method

	property none string Msg
		get get_Msg()
	end property
	
end class
