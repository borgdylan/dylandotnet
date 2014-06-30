//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract LogicalOp extends Op
end class

class public auto ansi AndOp extends LogicalOp

	method public void AndOp()
		mybase::ctor()
		PrecNo = 7
	end method
	
	method public override string ToString()
		return "and"
	end method

end class

class public auto ansi OrOp extends LogicalOp

	method public void OrOp()
		mybase::ctor()
		PrecNo = 5
	end method
	
	method public override string ToString()
		return "or"
	end method

end class

class public auto ansi AndAlsoOp extends LogicalOp

	method public void AndAlsoOp()
		mybase::ctor()
		PrecNo = 4
	end method
	
	method public override string ToString()
		return "andalso"
	end method

end class

class public auto ansi OrElseOp extends LogicalOp

	method public void OrElseOp()
		mybase::ctor()
		PrecNo = 3
	end method
	
	method public override string ToString()
		return "orelse"
	end method

end class

class public auto ansi NandOp extends LogicalOp

	method public void NandOp()
		mybase::ctor()
		PrecNo = 7
	end method
	
	method public override string ToString()
		return "nand"
	end method

end class

class public auto ansi NorOp extends LogicalOp

	method public void NorOp()
		mybase::ctor()
		PrecNo = 5
	end method
	
	method public override string ToString()
		return "nor"
	end method

end class

class public auto ansi XorOp extends LogicalOp

	method public void XorOp()
		mybase::ctor()
		PrecNo = 6
	end method
	
	method public override string ToString()
		return "xor"
	end method

end class

class public auto ansi XnorOp extends LogicalOp

	method public void XnorOp()
		mybase::ctor()
		PrecNo = 6
	end method
	
	method public override string ToString()
		return "xnor"
	end method

end class

class public auto ansi NotOp extends LogicalOp

	method public void NotOp()
		mybase::ctor()
		PrecNo = 13
	end method
	
	method public override string ToString()
		return "~"
	end method

end class

class public auto ansi NegOp extends LogicalOp

	method public void NegOp()
		mybase::ctor()
		PrecNo = 13
	end method
	
	method public override string ToString()
		return "!"
	end method

end class
