//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

class public sealed ExprCallTok extends ValueToken implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable, IPlusMinusable

	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public Expr Exp

	property public virtual autogen string OrdOp
	property public virtual autogen boolean Conv
	property public virtual autogen TypeTok TTok
	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot
	property public virtual autogen boolean DoInc
	property public virtual autogen boolean DoDec
	property public virtual autogen boolean DoPlus
	property public virtual autogen boolean DoMinus

	method public void ExprCallTok(var value as string)
		mybase::ctor(value)
		_TTok = new TypeTok()
		_OrdOp = string::Empty
		MemberToAccess = new Token()
	end method

	method public void ExprCallTok()
		ctor(string::Empty)
	end method

end class
