//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Literal extends Token

	field public TypeTok LitTyp
	field public boolean Conv
	field public TypeTok TTok

	method public void ctor0()
		me::ctor()
		LitTyp = null
		Conv = false
		TTok = null
	end method

	method public void Literal(var value as string)
		me::ctor(value)
		LitTyp = null
		Conv = false
		TTok = null
	end method

end class

class public auto ansi NullLiteral extends Literal

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

end class

class public auto ansi ConstLiteral extends Literal

	field public object ConstVal
	field public System.Type ExtTyp
	field public System.Type IntTyp

	method public void ConstLiteral()
		me::ctor()
		ConstVal = null
		LitTyp = new ObjectTok()
		ExtTyp = null
		IntTyp = null
	end method

	method public void ConstLiteral(var value as string)
		me::ctor(value)
		ConstVal = null
		LitTyp = new ObjectTok()
		ExtTyp = null
		IntTyp = null
	end method

end class

class public auto ansi StringLiteral extends Literal

	field public string OrdOp
	field public boolean MemberAccessFlg
	field public Token MemberToAccess

	method public void StringLiteral()
		me::ctor()
		LitTyp = new StringTok()
		OrdOp = ""
		MemberAccessFlg = false
		MemberToAccess = new Token()
	end method

	method public void StringLiteral(var value as string)
		me::ctor(value)
		LitTyp = new StringTok()
		OrdOp = ""
		MemberAccessFlg = false
		MemberToAccess = new Token()
	end method

	method public hidebysig virtual string ToString()
		return Constants::quot + Value + Constants::quot
	end method

end class

class public auto ansi CharLiteral extends Literal

	field public char CharVal
	field public string OrdOp

	method public void CharLiteral()
		me::ctor()
		CharVal = 'a'
		LitTyp = new CharTok()
		OrdOp = ""
	end method

	method public void CharLiteral(var value as string)
		me::ctor(value)
		CharVal = 'a'
		LitTyp = new CharTok()
		OrdOp = ""
	end method
	
	method public void CharLiteral(var value as char)
		me::ctor($string$value)
		CharVal = value
		LitTyp = new CharTok()
		OrdOp = ""
	end method

	method public hidebysig virtual string ToString()
		return "'" + $string$CharVal + "'"
	end method

end class

class public auto ansi BooleanLiteral extends Literal

	field public boolean BoolVal
	field public string OrdOp
	field public boolean DoNot

	method public void BooleanLiteral()
		me::ctor()
		BoolVal = false
		LitTyp = new BooleanTok()
		OrdOp = ""
		DoNot = false
	end method

	method public void BooleanLiteral(var value as string)
		me::ctor(value)
		BoolVal = false
		LitTyp = new BooleanTok()
		OrdOp = ""
		DoNot = false
	end method
	
	method public void BooleanLiteral(var value as boolean)
		me::ctor()
		BoolVal = value
		LitTyp = new BooleanTok()
		OrdOp = ""
		DoNot = false
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

end class


class public auto ansi NumberLiteral extends Literal

	field public string OrdOp
	field public boolean DoNot
	field public boolean DoNeg

	method public void NumberLiteral()
		me::ctor()
		OrdOp = ""
		DoNot = false
		DoNeg = false
	end method

	method public void NumberLiteral(var value as string)
		me::ctor(value)
		OrdOp = ""
		DoNot = false
		DoNeg = false
	end method

end class

class public auto ansi IntLiteral extends NumberLiteral

	field public integer NumVal

	method public void IntLiteral()
		me::ctor()
		NumVal = 0i
		LitTyp = new IntegerTok()
	end method

	method public void IntLiteral(var value as string)
		me::ctor(value)
		NumVal = 0i
		LitTyp = new IntegerTok()
	end method
	
	method public void IntLiteral(var value as integer)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new IntegerTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "i"
	end method

end class

class public auto ansi DoubleLiteral extends NumberLiteral

	field public double NumVal

	method public void DoubleLiteral()
		me::ctor()
		NumVal = 0d
		LitTyp = new DoubleTok()
	end method

	method public void DoubleLiteral(var value as string)
		me::ctor(value)
		NumVal = 0d
		LitTyp = new DoubleTok()
	end method
	
	method public void DoubleLiteral(var value as double)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new DoubleTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "d"
	end method

end class

class public auto ansi DecimalLiteral extends NumberLiteral

	field public decimal NumVal

	method public void DecimalLiteral()
		me::ctor()
		NumVal = new Decimal(0)
		LitTyp = new DecimalTok()
	end method

	method public void DecimalLiteral(var value as string)
		me::ctor(value)
		NumVal = new Decimal(0)
		LitTyp = new DecimalTok()
	end method
	
	method public void DecimalLiteral(var value as decimal)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new DecimalTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "m"
	end method

end class

class public auto ansi SByteLiteral extends NumberLiteral

	field public sbyte NumVal

	method public void SByteLiteral()
		me::ctor()
		NumVal = 0b
		LitTyp = new SByteTok()
	end method

	method public void SByteLiteral(var value as string)
		me::ctor(value)
		NumVal = 0b
		LitTyp = new SByteTok()
	end method
	
	method public void SByteLiteral(var value as sbyte)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new SByteTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "b"
	end method

end class

class public auto ansi ShortLiteral extends NumberLiteral

	field public short NumVal

	method public void ShortLiteral()
		me::ctor()
		NumVal = 0s
		LitTyp = new ShortTok()
	end method

	method public void ShortLiteral(var value as string)
		me::ctor(value)
		NumVal = 0s
		LitTyp = new ShortTok()
	end method
	
	method public void ShortLiteral(var value as short)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ShortTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "s"
	end method

end class

class public auto ansi LongLiteral extends NumberLiteral

	field public long NumVal

	method public void LongLiteral()
		me::ctor()
		NumVal = 0l
		LitTyp = new LongTok()
	end method

	method public void LongLiteral(var value as string)
		me::ctor(value)
		NumVal = 0l
		LitTyp = new LongTok()
	end method
	
	method public void LongLiteral(var value as long)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new LongTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "l"
	end method

end class

class public auto ansi FloatLiteral extends NumberLiteral

	field public single NumVal

	method public void FloatLiteral()
		me::ctor()
		NumVal = 0f
		LitTyp = new SingleTok()
	end method

	method public void FloatLiteral(var value as string)
		me::ctor(value)
		NumVal = 0f
		LitTyp = new SingleTok()
	end method
	
	method public void FloatLiteral(var value as single)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new SingleTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "f"
	end method

end class

class public auto ansi UIntLiteral extends NumberLiteral

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
	end method
	
	method public void UIntLiteral(var value as uinteger)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new UIntegerTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ui"
	end method

end class

class public auto ansi ByteLiteral extends NumberLiteral

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
	end method
	
	method public void ByteLiteral(var value as byte)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ByteTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ub"
	end method

end class

class public auto ansi UShortLiteral extends NumberLiteral

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
	end method
	
	method public void UShortLiteral(var value as ushort)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new UShortTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "us"
	end method

end class

class public auto ansi ULongLiteral extends NumberLiteral

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
	end method
	
	method public void ULongLiteral(var value as ulong)
		me::ctor($string$value)
		NumVal = value
		LitTyp = new ULongTok()
	end method

	method public hidebysig virtual string ToString()
		return $string$NumVal + "ul"
	end method

end class

class public auto ansi IntPtrLiteral extends NumberLiteral

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

end class
