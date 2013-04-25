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
		if char::TryParse(value,ref c) then
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
		Value = #ternary {value ? "true", "false"}
	end method

	method public hidebysig virtual string ToString()
		return #ternary {BoolVal ? "true", "false"}
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

end class


class public auto ansi asbtract NumberLiteral extends Literal implements IUnaryOperatable, IConvable

	method family void NumberLiteral()
		me::ctor()
	end method

	method family void NumberLiteral(var value as string)
		me::ctor(value)
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

end class

class public auto ansi IntLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable, INotable

	field public integer NumVal
	field private boolean _DoNeg
	field private boolean _DoNot

	method public void IntLiteral()
		me::ctor()
		NumVal = 0i
		LitTyp = new IntegerTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public void IntLiteral(var value as string)
		me::ctor(value)
		NumVal = 0i
		LitTyp = new IntegerTok()
		var n as integer
		if integer::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
		_DoNot = false
	end method
	
	method public void IntLiteral(var value as integer)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new IntegerTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "i"
	end method
	
	method public string ToStringNoI()
		return $string$NumVal
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
		if double::TryParse(value,ref n) then
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
		if decimal::TryParse(value,ref n) then
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

end class

class public auto ansi SByteLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable, INotable

	field public sbyte NumVal
	field private boolean _DoNeg
	field private boolean _DoNot

	method public void SByteLiteral()
		me::ctor()
		NumVal = 0b
		LitTyp = new SByteTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public void SByteLiteral(var value as string)
		me::ctor(value)
		NumVal = 0b
		LitTyp = new SByteTok()
		var n as sbyte
		if sbyte::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
		_DoNot = false
	end method
	
	method public void SByteLiteral(var value as sbyte)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new SByteTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "b"
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

end class


class public auto ansi ShortLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable, INotable

	field public short NumVal
	field private boolean _DoNeg
	field private boolean _DoNot

	method public void ShortLiteral()
		me::ctor()
		NumVal = 0s
		LitTyp = new ShortTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public void ShortLiteral(var value as string)
		me::ctor(value)
		NumVal = 0s
		LitTyp = new ShortTok()
		var n as short
		if short::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
		_DoNot = false
	end method
	
	method public void ShortLiteral(var value as short)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ShortTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "s"
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

end class

class public auto ansi LongLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable, INotable

	field public long NumVal
	field private boolean _DoNeg
	field private boolean _DoNot

	method public void LongLiteral()
		me::ctor()
		NumVal = 0l
		LitTyp = new LongTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public void LongLiteral(var value as string)
		me::ctor(value)
		NumVal = 0l
		LitTyp = new LongTok()
		var n as long
		if long::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNeg = false
		_DoNot = false
	end method
	
	method public void LongLiteral(var value as long)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new LongTok()
		_DoNeg = false
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "l"
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
		if single::TryParse(value,ref n) then
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

end class

class public auto ansi UIntLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INotable

	field public uinteger NumVal
	field private boolean _DoNot

	method public void UIntLiteral()
		me::ctor()
		NumVal = 0ui
		LitTyp = new UIntegerTok()
		_DoNot = false
	end method

	method public void UIntLiteral(var value as string)
		me::ctor(value)
		NumVal = 0ui
		LitTyp = new UIntegerTok()
		var n as uinteger
		if uinteger::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNot = false
	end method
	
	method public void UIntLiteral(var value as uinteger)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new UIntegerTok()
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ui"
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
	
	property public hidebysig virtual final newslot boolean DoNot
		get
			return _DoNot
		end get
		set
			_DoNot = value
		end set
	end property

end class

class public auto ansi ByteLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INotable

	field public byte NumVal
	field private boolean _DoNot

	method public void ByteLiteral()
		me::ctor()
		NumVal = 0ub
		LitTyp = new ByteTok()
		_DoNot = false
	end method

	method public void ByteLiteral(var value as string)
		me::ctor(value)
		NumVal = 0ub
		LitTyp = new ByteTok()
		var n as byte
		if byte::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNot = false
	end method
	
	method public void ByteLiteral(var value as byte)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ByteTok()
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ub"
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
	
	property public hidebysig virtual final newslot boolean DoNot
		get
			return _DoNot
		end get
		set
			_DoNot = value
		end set
	end property

end class

class public auto ansi UShortLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INotable

	field public ushort NumVal
	field private boolean _DoNot

	method public void UShortLiteral()
		me::ctor()
		NumVal = 0us
		LitTyp = new UShortTok()
		_DoNot = false
	end method

	method public void UShortLiteral(var value as string)
		me::ctor(value)
		NumVal = 0us
		LitTyp = new UShortTok()
		var n as ushort
		if ushort::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNot = false
	end method
	
	method public void UShortLiteral(var value as ushort)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new UShortTok()
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "us"
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
	
	property public hidebysig virtual final newslot boolean DoNot
		get
			return _DoNot
		end get
		set
			_DoNot = value
		end set
	end property

end class

class public auto ansi ULongLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INotable

	field public UInt64 NumVal
	field private boolean _DoNot

	method public void ULongLiteral()
		me::ctor()
		NumVal = 0ul
		LitTyp = new ULongTok()
		_DoNot = false
	end method

	method public void ULongLiteral(var value as string)
		me::ctor(value)
		NumVal = 0ul
		LitTyp = new ULongTok()
		var n as ulong
		if ulong::TryParse(value,ref n) then
			NumVal = n
		end if
		_DoNot = false
	end method
	
	method public void ULongLiteral(var value as ulong)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ULongTok()
		_DoNot = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ul"
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
	
	property public hidebysig virtual final newslot boolean DoNot
		get
			return _DoNot
		end get
		set
			_DoNot = value
		end set
	end property

end class

class public auto ansi IntPtrLiteral extends NumberLiteral implements IUnaryOperatable, IConvable, INegatable, INotable

	field public IntPtr NumVal
	field private boolean _DoNot
	field private boolean _DoNeg
	
	method public void IntPtrLiteral()
		me::ctor()
		NumVal = new IntPtr(0)
		LitTyp = new IntPtrTok()
		_DoNot = false
		_DoNeg = false
	end method

	method public void IntPtrLiteral(var value as string)
		me::ctor(value)
		NumVal = new IntPtr(0)
		LitTyp = new IntPtrTok()
		_DoNot = false
		_DoNeg = false
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ip"
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
	
	property public hidebysig virtual final newslot boolean DoNot
		get
			return _DoNot
		end get
		set
			_DoNot = value
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

end class
