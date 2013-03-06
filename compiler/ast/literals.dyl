//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract Literal extends Token implements IUnaryOperatable, IConvable

	field public TypeTok LitTyp
	field family boolean _Conv
	field family TypeTok _TTok
	field family string _OrdOp

	method family void Literal()
		me::ctor()
		LitTyp = null
		_Conv = false
		_TTok = null
		_OrdOp = string::Empty
	end method

	method family void Literal(var value as string)
		me::ctor(value)
		LitTyp = null
		_Conv = false
		_TTok = null
		_OrdOp = string::Empty
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi NullLiteral extends Literal implements IUnaryOperatable, IConvable

	field public object NullVal

	method public void NullLiteral()
		me::ctor()
		NullVal = null
		LitTyp = new ObjectTok()
	end method

	method public void NullLiteral(var value as string)
		me::ctor(value)
		NullVal = null
		LitTyp = new ObjectTok()
	end method

	method public hidebysig virtual string ToString()
		return "null"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi ConstLiteral extends Literal

	field public object ConstVal
	field public IKVM.Reflection.Type ExtTyp
	field public IKVM.Reflection.Type IntTyp

	method public void ConstLiteral()
		me::ctor()
		ConstVal = null
		LitTyp = new ObjectTok()
		ExtTyp = null
		IntTyp = null
	end method

	method public void ConstLiteral(var value as object)
		me::ctor()
		ConstVal = value
		LitTyp = new ObjectTok()
		ExtTyp = null
		IntTyp = null
	end method

end class

class public auto ansi StringLiteral extends Literal implements IUnaryOperatable, IConvable

	field public boolean MemberAccessFlg
	field public Token MemberToAccess

	method public void StringLiteral()
		me::ctor()
		LitTyp = new StringTok()
		MemberAccessFlg = false
		MemberToAccess = new Token()
	end method

	method public void StringLiteral(var value as string)
		me::ctor(value)
		LitTyp = new StringTok()
		MemberAccessFlg = false
		MemberToAccess = new Token()
	end method

	method public hidebysig virtual string ToString()
		return c"\q" + Value + c"\q"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi CharLiteral extends Literal implements IUnaryOperatable, IConvable

	field public char CharVal

	method public void CharLiteral()
		me::ctor()
		CharVal = ' '
		LitTyp = new CharTok()
	end method

	method public void CharLiteral(var value as string)
		me::ctor(value)
		CharVal = ' '
		LitTyp = new CharTok()
		var c as char
		if Char::TryParse(value,ref c) then
			CharVal = c
		end if
	end method
	
	method public void CharLiteral(var value as char)
		me::ctor($string$value)
		CharVal = value
		LitTyp = new CharTok()
	end method

	method public hidebysig virtual string ToString()
		return "'" + $string$CharVal + "'"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi BooleanLiteral extends Literal implements IUnaryOperatable, IConvable, INegatable

	field public boolean BoolVal
	field private boolean _DoNeg

	method public void BooleanLiteral()
		me::ctor()
		BoolVal = false
		LitTyp = new BooleanTok()
		_DoNeg = false
	end method

	method public void BooleanLiteral(var value as string)
		me::ctor(value)
		BoolVal = false
		LitTyp = new BooleanTok()
		_DoNeg = false
		if (value = "True") or (value = "true") then
			BoolVal = true
		elseif (value = "False") or (value = "false") then
			BoolVal = false
		end if
	end method
	
	method public void BooleanLiteral(var value as boolean)
		me::ctor()
		BoolVal = value
		LitTyp = new BooleanTok()
		_DoNeg = false
		if value then
			Value = "true"
		else
			Value = "false"
		end if
	end method

	method public hidebysig virtual string ToString()
		if BoolVal then
			return "true"
		else
			return "false"
		end if
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class


class public auto ansi asbtract NumberLiteral extends Literal implements IUnaryOperatable, IConvable

	field public boolean DoNot

	method family void NumberLiteral()
		me::ctor()
		DoNot = false
	end method

	method family void NumberLiteral(var value as string)
		me::ctor(value)
		DoNot = false
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi IntLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable

	field public integer NumVal
	field private boolean _DoNeg

	method public void IntLiteral()
		me::ctor()
		NumVal = 0i
		LitTyp = new IntegerTok()
		_DoNeg = false
	end method

	method public void IntLiteral(var value as string)
		me::ctor(value)
		NumVal = 0i
		LitTyp = new IntegerTok()
		var n as integer
		if Int32::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
	end method
	
	method public void IntLiteral(var value as integer)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new IntegerTok()
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "i"
	end method
	
	method public string ToStringNoI()
		return $string$NumVal
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class

class public auto ansi DoubleLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable

	field public double NumVal
	field private boolean _DoNeg

	method public void DoubleLiteral()
		me::ctor()
		NumVal = 0d
		LitTyp = new DoubleTok()
		_DoNeg = false
	end method

	method public void DoubleLiteral(var value as string)
		me::ctor(value)
		NumVal = 0d
		LitTyp = new DoubleTok()
		var n as double
		if Double::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
	end method
	
	method public void DoubleLiteral(var value as double)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new DoubleTok()
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "d"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class

class public auto ansi DecimalLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable

	field public decimal NumVal
	field private boolean _DoNeg

	method public void DecimalLiteral()
		me::ctor()
		NumVal = new Decimal(0)
		LitTyp = new DecimalTok()
		_DoNeg = false
	end method

	method public void DecimalLiteral(var value as string)
		me::ctor(value)
		NumVal = new Decimal(0)
		LitTyp = new DecimalTok()
		var n as decimal
		if Decimal::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
	end method
	
	method public void DecimalLiteral(var value as decimal)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new DecimalTok()
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "m"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class

class public auto ansi SByteLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable

	field public sbyte NumVal
	field private boolean _DoNeg

	method public void SByteLiteral()
		me::ctor()
		NumVal = 0b
		LitTyp = new SByteTok()
		_DoNeg = false
	end method

	method public void SByteLiteral(var value as string)
		me::ctor(value)
		NumVal = 0b
		LitTyp = new SByteTok()
		var n as sbyte
		if SByte::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
	end method
	
	method public void SByteLiteral(var value as sbyte)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new SByteTok()
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "b"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class


class public auto ansi ShortLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable

	field public short NumVal
	field private boolean _DoNeg

	method public void ShortLiteral()
		me::ctor()
		NumVal = 0s
		LitTyp = new ShortTok()
		_DoNeg = false
	end method

	method public void ShortLiteral(var value as string)
		me::ctor(value)
		NumVal = 0s
		LitTyp = new ShortTok()
		var n as short
		if Int16::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
	end method
	
	method public void ShortLiteral(var value as short)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ShortTok()
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "s"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class

class public auto ansi LongLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable

	field public long NumVal
	field private boolean _DoNeg

	method public void LongLiteral()
		me::ctor()
		NumVal = 0l
		LitTyp = new LongTok()
		_DoNeg = false
	end method

	method public void LongLiteral(var value as string)
		me::ctor(value)
		NumVal = 0l
		LitTyp = new LongTok()
		var n as long
		if Int64::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
	end method
	
	method public void LongLiteral(var value as long)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new LongTok()
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "l"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class

class public auto ansi FloatLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable

	field public single NumVal
	field private boolean _DoNeg

	method public void FloatLiteral()
		me::ctor()
		NumVal = 0f
		LitTyp = new SingleTok()
		_DoNeg = false
	end method

	method public void FloatLiteral(var value as string)
		me::ctor(value)
		NumVal = 0f
		LitTyp = new SingleTok()
		var n as single
		if Single::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
	end method
	
	method public void FloatLiteral(var value as single)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new SingleTok()
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "f"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property

end class

class public auto ansi UIntLiteral extends NumberLiteral implements IUnaryOperatable, IConvable

	field public uinteger NumVal

	method public void UIntLiteral()
		me::ctor()
		NumVal = 0ui
		LitTyp = new UIntegerTok()
	end method

	method public void UIntLiteral(var value as string)
		me::ctor(value)
		NumVal = 0ui
		LitTyp = new UIntegerTok()
		var n as uinteger
		if UInt32::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void UIntLiteral(var value as uinteger)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new UIntegerTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ui"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi ByteLiteral extends NumberLiteral implements IUnaryOperatable, IConvable

	field public byte NumVal

	method public void ByteLiteral()
		me::ctor()
		NumVal = 0ub
		LitTyp = new ByteTok()
	end method

	method public void ByteLiteral(var value as string)
		me::ctor(value)
		NumVal = 0ub
		LitTyp = new ByteTok()
		var n as byte
		if Byte::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void ByteLiteral(var value as byte)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ByteTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ub"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi UShortLiteral extends NumberLiteral implements IUnaryOperatable, IConvable

	field public ushort NumVal

	method public void UShortLiteral()
		me::ctor()
		NumVal = 0us
		LitTyp = new UShortTok()
	end method

	method public void UShortLiteral(var value as string)
		me::ctor(value)
		NumVal = 0us
		LitTyp = new UShortTok()
		var n as ushort
		if UInt16::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void UShortLiteral(var value as ushort)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new UShortTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "us"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi ULongLiteral extends NumberLiteral implements IUnaryOperatable, IConvable

	field public UInt64 NumVal

	method public void ULongLiteral()
		me::ctor()
		NumVal = 0ul
		LitTyp = new ULongTok()
	end method

	method public void ULongLiteral(var value as string)
		me::ctor(value)
		NumVal = 0ul
		LitTyp = new ULongTok()
		var n as ulong
		if UInt64::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void ULongLiteral(var value as ulong)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ULongTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ul"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class

class public auto ansi IntPtrLiteral extends NumberLiteral implements IUnaryOperatable, IConvable

	field public IntPtr NumVal

	method public void IntPtrLiteral()
		me::ctor()
		NumVal = new IntPtr(0)
		LitTyp = new IntPtrTok()
	end method

	method public void IntPtrLiteral(var value as string)
		me::ctor(value)
		NumVal = new IntPtr(0)
		LitTyp = new IntPtrTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ip"
	end method
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property

end class
