//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi ExprCallTok extends Token implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable

	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public Expr Exp
	
	property public hidebysig virtual final newslot autogen string OrdOp
	property public hidebysig virtual final newslot autogen boolean Conv
	property public hidebysig virtual final newslot autogen TypeTok TTok
	property public hidebysig virtual final newslot autogen boolean DoNeg
	property public hidebysig virtual final newslot autogen boolean DoNot
	property public hidebysig virtual final newslot autogen boolean DoInc
	property public hidebysig virtual final newslot autogen boolean DoDec
	
	method public void ExprCallTok(var value as string)
		me::ctor(value)
		_Conv = false
		_TTok = new TypeTok()
		_DoNeg = false
		_DoNot = false
		_DoInc = false
		_DoDec = false
		_OrdOp = string::Empty
		MemberAccessFlg = false
		MemberToAccess = new Token()
		Exp = null
	end method
	
	method public void ExprCallTok()
		ctor(string::Empty)
	end method

end class
