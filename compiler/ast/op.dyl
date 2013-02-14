//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract Op extends Token

	field public integer PrecNo
	field public Token LChild
	field public Token RChild

	method family void Op()
		me::ctor()
		PrecNo = 0
		LChild = null
		RChild = null
	end method

end class

//=
class public auto ansi AssignOp extends Op

	method public void AssignOp()
		me::ctor()
		PrecNo = 1
	end method
	
	method public hidebysig virtual string ToString()
		return "="
	end method

end class

//=
class public auto ansi AssignOp2 extends Op

	method public void AssignOp2()
		me::ctor()
		PrecNo = 1
	end method
	
	method public hidebysig virtual string ToString()
		return "="
	end method

end class

//as
class public auto ansi AsOp extends Op

	method public void AsOp()
		me::ctor()
		PrecNo = 8
	end method
	
	method public hidebysig virtual string ToString()
		return "as"
	end method

end class
