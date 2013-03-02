//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract ConditionalOp extends Op

	method family void ConditionalOp()
		me::ctor()
	end method

end class

// =
// ==
class public auto ansi EqOp extends ConditionalOp

	method public void EqOp()
		me::ctor()
		PrecNo = 8
	end method
	
	method public hidebysig virtual string ToString()
		return "=="
	end method

end class

// is
class public auto ansi IsOp extends ConditionalOp

	method public void IsOp()
		me::ctor()
		PrecNo = 8
	end method
	
	method public hidebysig virtual string ToString()
		return "is"
	end method

end class

// like
class public auto ansi LikeOp extends ConditionalOp

	method public void LikeOp()
		me::ctor()
		PrecNo = 8
	end method
	
	method public hidebysig virtual string ToString()
		return "like"
	end method

end class


// <>
// !=
class public auto ansi NeqOp extends ConditionalOp

	method public void NeqOp()
		me::ctor()
		PrecNo = 8
	end method
	
	method public hidebysig virtual string ToString()
		return "!="
	end method

end class

// notlike
class public auto ansi NLikeOp extends ConditionalOp

	method public void NLikeOp()
		me::ctor()
		PrecNo = 8
	end method
	
	method public hidebysig virtual string ToString()
		return "notlike"
	end method

end class


// >
class public auto ansi GtOp extends ConditionalOp

	method public void GtOp()
		me::ctor()
		PrecNo = 9
	end method
	
	method public hidebysig virtual string ToString()
		return ">"
	end method

end class

// <
class public auto ansi LtOp extends ConditionalOp

	method public void LtOp()
		me::ctor()
		PrecNo = 9
	end method
	
	method public hidebysig virtual string ToString()
		return "<"
	end method

end class

// >=
class public auto ansi GeOp extends ConditionalOp

	method public void GeOp()
		me::ctor()
		PrecNo = 9
	end method
	
	method public hidebysig virtual string ToString()
		return ">="
	end method

end class

// <=
class public auto ansi LeOp extends ConditionalOp

	method public void LeOp()
		me::ctor()
		PrecNo = 9
	end method
	
	method public hidebysig virtual string ToString()
		return "<="
	end method

end class
