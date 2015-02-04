//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public abstract AritOp extends Op
end class

// +
class public AddOp extends AritOp

	method public void AddOp()
		mybase::ctor()
		PrecNo = 11
	end method
	
	method public override string ToString()
		return "+"
	end method

end class

// *
class public MulOp extends AritOp

	method public void MulOp()
		mybase::ctor()
		PrecNo = 12
	end method

	method public override string ToString()
		return "*"
	end method

end class

// -
class public SubOp extends AritOp

	method public void SubOp()
		mybase::ctor()
		PrecNo = 11
	end method
	
	method public override string ToString()
		return "-"
	end method

end class


// /
class public DivOp extends AritOp

	method public void DivOp()
		mybase::ctor()
		PrecNo = 12
	end method
	
	method public override string ToString()
		return "/"
	end method

end class

// %
class public ModOp extends AritOp

	method public void ModOp()
		mybase::ctor()
		PrecNo = 12
	end method
	
	method public override string ToString()
		return "%"
	end method

end class

// ++
class public IncOp extends AritOp

	method public void IncOp()
		mybase::ctor()
		PrecNo = 13
	end method
	
	method public override string ToString()
		return "++"
	end method

end class

// --
class public DecOp extends AritOp

	method public void DecOp()
		mybase::ctor()
		PrecNo = 13
	end method
	
	method public override string ToString()
		return "--"
	end method

end class

// <<
class public ShlOp extends AritOp

	method public void ShlOp()
		mybase::ctor()
		PrecNo = 10
	end method
	
	method public override string ToString()
		return "<<"
	end method

end class

// >>
class public ShrOp extends AritOp

	method public void ShrOp()
		mybase::ctor()
		PrecNo = 10
	end method
	
	method public override string ToString()
		return ">>"
	end method

end class
