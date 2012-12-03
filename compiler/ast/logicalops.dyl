//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract LogicalOp extends Op

	method family void LogicalOp()
		me::ctor()
	end method

end class

class public auto ansi AndOp extends LogicalOp

	method public void AndOp()
		me::ctor()
		PrecNo = 7
	end method
	
	method public hidebysig virtual string ToString()
		return "and"
	end method

end class

class public auto ansi OrOp extends LogicalOp

	method public void OrOp()
		me::ctor()
		PrecNo = 5
	end method
	
	method public hidebysig virtual string ToString()
		return "or"
	end method

end class

class public auto ansi NandOp extends LogicalOp

	method public void NandOp()
		me::ctor()
		PrecNo = 7
	end method
	
	method public hidebysig virtual string ToString()
		return "nand"
	end method

end class

class public auto ansi NorOp extends LogicalOp

	method public void NorOp()
		me::ctor()
		PrecNo = 5
	end method
	
	method public hidebysig virtual string ToString()
		return "nor"
	end method

end class

class public auto ansi XorOp extends LogicalOp

	method public void XorOp()
		me::ctor()
		PrecNo = 6
	end method
	
	method public hidebysig virtual string ToString()
		return "xor"
	end method

end class

class public auto ansi XnorOp extends LogicalOp

	method public void XnorOp()
		me::ctor()
		PrecNo = 6
	end method
	
	method public hidebysig virtual string ToString()
		return "xnor"
	end method

end class

class public auto ansi NotOp extends LogicalOp

	method public void NotOp()
		me::ctor()
		PrecNo = 13
	end method
	
	method public hidebysig virtual string ToString()
		return "~"
	end method

end class

class public auto ansi NegOp extends LogicalOp

	method public void NegOp()
		me::ctor()
		PrecNo = 13
	end method
	
	method public hidebysig virtual string ToString()
		return "!"
	end method

end class
