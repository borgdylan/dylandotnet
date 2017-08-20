//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public abstract LogicalOp extends Op
end class

class public abstract ShortCircuitLogicalOp extends LogicalOp
end class

class public AndOp extends LogicalOp

	method public void AndOp()
		mybase::ctor()
		PrecNo = 7
	end method

	method public override string ToString() => "and"

end class

class public OrOp extends LogicalOp

	method public void OrOp()
		mybase::ctor()
		PrecNo = 5
	end method

	method public override string ToString() => "or"

end class

class public AndAlsoOp extends ShortCircuitLogicalOp

	method public void AndAlsoOp()
		mybase::ctor()
		PrecNo = 4
	end method

	method public override string ToString() => "andalso"

end class

class public OrElseOp extends ShortCircuitLogicalOp

	method public void OrElseOp()
		mybase::ctor()
		PrecNo = 3
	end method

	method public override string ToString() => "orelse"

end class

class public NandOp extends LogicalOp

	method public void NandOp()
		mybase::ctor()
		PrecNo = 7
	end method

	method public override string ToString() => "nand"

end class

class public NorOp extends LogicalOp

	method public void NorOp()
		mybase::ctor()
		PrecNo = 5
	end method

	method public override string ToString() => "nor"

end class

class public XorOp extends LogicalOp

	method public void XorOp()
		mybase::ctor()
		PrecNo = 6
	end method

	method public override string ToString() => "xor"

end class

class public XnorOp extends LogicalOp

	method public void XnorOp()
		mybase::ctor()
		PrecNo = 6
	end method

	method public override string ToString() => "xnor"

end class

class public NotOp extends LogicalOp

	method public void NotOp()
		mybase::ctor()
		PrecNo = 13
	end method

	method public override string ToString() => "~"

end class

class public NegOp extends LogicalOp

	method public void NegOp()
		mybase::ctor()
		PrecNo = 13
	end method

	method public override string ToString() => "!"

end class