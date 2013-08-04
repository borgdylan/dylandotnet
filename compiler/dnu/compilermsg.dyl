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
		_Line = line
		_File = file
		_Msg = msg
	end method
	
	property public integer Line
		get
			return _Line
		end get
	end property
	
	property public string File
		get
			return _File
		end get
	end property
	
	property public string Msg
		get
			return _Msg
		end get
	end property
	
end class