//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public Ident extends ValueToken implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable

	field public boolean IsRef
	field public boolean IsValInRef
	field family boolean _Conv
	field family TypeTok _TTok
	field public boolean IsArr
	field public Expr ArrLoc
	field family boolean _DoNeg
	field family boolean _DoNot
	field family boolean _DoInc
	field family boolean _DoDec
	field family string _OrdOp
	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public TypeTok ExplType
	
	property public override newslot autogen string OrdOp
	property public override newslot autogen boolean Conv
	property public override newslot autogen TypeTok TTok
	property public override newslot autogen boolean DoNeg
	property public override newslot autogen boolean DoNot
	property public override newslot autogen boolean DoInc
	property public override newslot autogen boolean DoDec
	
	method public void Ident(var value as string)
		mybase::ctor(value)
		_TTok = new TypeTok()
		ArrLoc = new Expr()
		_OrdOp = string::Empty
		MemberToAccess = new Token()
	end method
	
	method public void Ident()
		ctor(string::Empty)
	end method

end class