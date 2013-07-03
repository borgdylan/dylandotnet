//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi ExprCallTok extends Token implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable

	field family boolean _Conv
	field family TypeTok _TTok
	field family boolean _DoNeg
	field family boolean _DoNot
	field family boolean _DoInc
	field family boolean _DoDec
	field family string _OrdOp
	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public Expr Exp

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
	
	property public hidebysig virtual final newslot string OrdOp
		get
			return _OrdOp
		end get
		set
			_OrdOp = value
		end set
	end property
	
	property public hidebysig virtual final newslot boolean Conv
		get
			return _Conv
		end get
		set
			_Conv = value
		end set
	end property
	
	property public hidebysig virtual final newslot TypeTok TTok
		get
			return _TTok
		end get
		set
			_TTok = value
		end set
	end property
	
	property public hidebysig virtual final newslot boolean DoNeg
		get
			return _DoNeg
		end get
		set
			_DoNeg = value
		end set
	end property
	
	property public hidebysig virtual final newslot boolean DoNot
		get
			return _DoNot
		end get
		set
			_DoNot = value
		end set
	end property
	
	property public hidebysig virtual final newslot boolean DoInc
		get
			return _DoInc
		end get
		set
			_DoInc = value
		end set
	end property
	
	property public hidebysig virtual final newslot boolean DoDec
		get
			return _DoDec
		end get
		set
			_DoDec = value
		end set
	end property

end class
