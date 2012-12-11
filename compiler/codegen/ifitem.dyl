//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi IfItem

	field public Emit.Label EndLabel
	field public Emit.Label NextBlkLabel
	field public boolean ElsePass
	field public integer Line

	method public void IfItem()
		me::ctor()
		ElsePass = false
		Line = 0
	end method

	method public void IfItem(var endl as Emit.Label, var nbl as Emit.Label, var ln as integer)
		me::ctor()
		EndLabel = endl
		NextBlkLabel = nbl
		ElsePass = false
		Line = ln
	end method

end class
