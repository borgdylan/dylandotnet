//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens

class public abstract ConditionalOp extends Op
end class

// =
// ==
class public sealed EqOp extends ConditionalOp

	method public void EqOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "=="

end class

// ===
class public sealed StrictEqOp extends ConditionalOp

	method public void StrictEqOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "==="

end class

// is
class public sealed IsOp extends ConditionalOp implements IInstanceCheckOp

	field public Ident VarName
	field public integer? LocInd

	method public void IsOp()
		mybase::ctor()
		PrecNo = 8
		LocInd = $integer?$null
	end method

	method public override string ToString() => "is"

end class

// isnot
class public sealed IsNotOp extends ConditionalOp implements IInstanceCheckOp

	method public void IsNotOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "isnot"

end class

// like
class public sealed LikeOp extends ConditionalOp

	method public void LikeOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "like"

end class


// <>
// !=
class public sealed NeqOp extends ConditionalOp

	method public void NeqOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "!="

end class

// !=
class public sealed StrictNeqOp extends ConditionalOp

	method public void StrictNeqOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "!=="

end class

// notlike
class public sealed NLikeOp extends ConditionalOp

	method public void NLikeOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "notlike"

end class


// >
class public sealed GtOp extends ConditionalOp

	method public void GtOp()
		mybase::ctor()
		PrecNo = 9
	end method

	method public override string ToString() => ">"

end class

// <
class public sealed LtOp extends ConditionalOp

	method public void LtOp()
		mybase::ctor()
		PrecNo = 9
	end method

	method public override string ToString() => "<"

end class

// >=
class public sealed GeOp extends ConditionalOp

	method public void GeOp()
		mybase::ctor()
		PrecNo = 9
	end method

	method public override string ToString() => ">="

end class

// <=
class public sealed LeOp extends ConditionalOp

	method public void LeOp()
		mybase::ctor()
		PrecNo = 9
	end method

	method public override string ToString() => "<="

end class
