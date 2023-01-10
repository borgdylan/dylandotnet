//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens

class public abstract Op extends Token

	field public integer PrecNo
	field public Token LChild
	field public Token RChild

	method family void Op()
		mybase::ctor()
	end method

end class

interface public IInstanceCheckOp
end interface

//=
class public sealed AssignOp extends Op

	method public void AssignOp()
		mybase::ctor()
		PrecNo = 1
	end method

	method public override string ToString() => "="

end class

//=
class public sealed AssignOp2 extends Op

	method public void AssignOp2()
		mybase::ctor()
		PrecNo = 1
	end method

	method public override string ToString() => "="

end class

//as
class public sealed AsOp extends Op implements IInstanceCheckOp

	method public void AsOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "as"

end class

//??
class public sealed CoalesceOp extends Op

	method public void CoalesceOp()
		mybase::ctor()
		PrecNo = 8
	end method

	method public override string ToString() => "??"

end class