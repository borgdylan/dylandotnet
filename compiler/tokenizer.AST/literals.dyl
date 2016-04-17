//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public abstract Literal extends ValueToken implements IUnaryOperatable, IConvable

	field public TypeTok LitTyp
	field family boolean _Conv
	field family TypeTok _TTok
	field family string _OrdOp

	method family void Literal(var value as string)
		mybase::ctor(value)
		_OrdOp = string::Empty
	end method
	
	method family void Literal()
		ctor(string::Empty)
	end method
	
	property public virtual autogen string OrdOp
	property public virtual autogen boolean Conv
	property public virtual autogen TypeTok TTok
	
end class

class public NullLiteral extends Literal

	field public object NullVal

	method public void NullLiteral(var value as string)
		mybase::ctor(value)
		NullVal = null
		LitTyp = new ObjectTok()
	end method
	
	method public void NullLiteral()
		ctor(string::Empty)
	end method

	method public override string ToString() => "null"
	
end class

class public ConstLiteral extends Literal

	field public object ConstVal
	field public IKVM.Reflection.Type ExtTyp
	field public IKVM.Reflection.Type IntTyp

	method public void ConstLiteral(var value as object)
		mybase::ctor()
		ConstVal = value
		LitTyp = new ObjectTok()
	end method
	
	method public void ConstLiteral()
		ctor(null)
	end method

end class

class public StringLiteral extends Literal

	field public boolean MemberAccessFlg
	field public Token MemberToAccess

	method public void StringLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new StringTok()
		MemberToAccess = new Token()
	end method
	
	method public void StringLiteral()
		ctor(string::Empty)
	end method

	method public override string ToString() => c"\q" + Value + c"\q"

end class

class public InterpolateLiteral extends Literal

	method public void InterpolateLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new StringTok()
	end method
	
	method public void InterpolateLiteral()
		ctor(string::Empty)
	end method

	method public override string ToString() => c"i\q" + Value + c"\q"

end class

class public FormattableLiteral extends Literal

	method public void FormattableLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new StringTok()
	end method
	
	method public void FormattableLiteral()
		ctor(string::Empty)
	end method

	method public override string ToString() => c"f\q" + Value + c"\q"

end class

class public CharLiteral extends Literal

	field public char CharVal

	method private void CharLiteral(var values as string, var value as char)
		mybase::ctor(values)
		CharVal = value
		LitTyp = new CharTok()
	end method
	
	method public void CharLiteral()
		ctor(string::Empty, c'\0')
	end method

	method public void CharLiteral(var value as string)
		ctor(value, c'\0')
		var c as char = c'\0'
		if char::TryParse(value,ref c) then
			CharVal = c
		end if
	end method
	
	method public void CharLiteral(var value as char)
		ctor($string$value, value)
	end method

	method public override string ToString() => "'" + $string$CharVal + "'"

end class

class public BooleanLiteral extends Literal implements INegatable

	field public boolean BoolVal
	field private boolean _DoNeg

	method public void BooleanLiteral()
		mybase::ctor()
		BoolVal = false
		LitTyp = new BooleanTok()
	end method

	method public void BooleanLiteral(var value as string)
		mybase::ctor(value)
		BoolVal = false
		LitTyp = new BooleanTok()
		if (value == "True") or (value == "true") then
			BoolVal = true
		elseif (value == "False") or (value == "false") then
			BoolVal = false
		end if
	end method
	
	method public void BooleanLiteral(var value as boolean)
		mybase::ctor()
		BoolVal = value
		LitTyp = new BooleanTok()
		Value = #ternary {value ? "true", "false"}
	end method

	method public override string ToString() => #ternary {BoolVal ? "true", "false"}

	property public virtual autogen boolean DoNeg

end class

class public abstract NumberLiteral extends Literal

	method family void NumberLiteral()
		mybase::ctor()
	end method

	method family void NumberLiteral(var value as string)
		mybase::ctor(value)
	end method

end class

class public abstract NumberLiteral<of T> extends NumberLiteral where T as {struct}

	field public T NumVal

	method family void NumberLiteral()
		mybase::ctor()
		NumVal = default T
	end method

	method family void NumberLiteral(var value as string)
		mybase::ctor(value)
		NumVal = default T
	end method

end class

class public IntLiteral extends NumberLiteral<of integer> implements INegatable, INotable

	field private boolean _DoNeg
	field private boolean _DoNot

	method public void IntLiteral()
		mybase::ctor()
		LitTyp = new IntegerTok()
	end method

	method public void IntLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new IntegerTok()
		var n as integer = 0
		if integer::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void IntLiteral(var value as integer)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new IntegerTok()
	end method

	method public override string ToString() => $string$NumVal + "i"
	
	method public string ToStringNoI() => $string$NumVal

	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot

end class

class public DoubleLiteral extends NumberLiteral<of double> implements INegatable

	field private boolean _DoNeg

	method public void DoubleLiteral()
		mybase::ctor()
		LitTyp = new DoubleTok()
		//_DoNeg = false
	end method

	method public void DoubleLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new DoubleTok()
		var n as double = 0d
		if double::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void DoubleLiteral(var value as double)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new DoubleTok()
	end method

	method public override string ToString() => $string$NumVal + "d"

	property public virtual autogen boolean DoNeg

end class

class public DecimalLiteral extends NumberLiteral<of decimal> implements INegatable

	field private boolean _DoNeg

	method public void DecimalLiteral()
		mybase::ctor()
		LitTyp = new DecimalTok()
	end method

	method public void DecimalLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new DecimalTok()
		var n as decimal = 0m
		if decimal::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void DecimalLiteral(var value as decimal)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new DecimalTok()
	end method

	method public override string ToString() => $string$NumVal + "m"

	property public virtual autogen boolean DoNeg

end class

class public SByteLiteral extends NumberLiteral<of sbyte> implements INegatable, INotable

	field private boolean _DoNeg
	field private boolean _DoNot

	method public void SByteLiteral()
		mybase::ctor()
		LitTyp = new SByteTok()
	end method

	method public void SByteLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new SByteTok()
		var n as sbyte = 0b
		if sbyte::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void SByteLiteral(var value as sbyte)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new SByteTok()
	end method

	method public override string ToString() => $string$NumVal + "b"

	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot

end class


class public ShortLiteral extends NumberLiteral<of short> implements INegatable, INotable

	field private boolean _DoNeg
	field private boolean _DoNot

	method public void ShortLiteral()
		mybase::ctor()
		LitTyp = new ShortTok()
	end method

	method public void ShortLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new ShortTok()
		var n as short = 0s
		if short::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void ShortLiteral(var value as short)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new ShortTok()
	end method

	method public override string ToString()
		return $string$NumVal + "s"
	end method
	
	property public virtual string OrdOp
		get
			return _OrdOp
		end get
		set
			_OrdOp = value
		end set
	end property

	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot

end class

class public LongLiteral extends NumberLiteral<of long> implements INegatable, INotable

	field private boolean _DoNeg
	field private boolean _DoNot

	method public void LongLiteral()
		mybase::ctor()
		LitTyp = new LongTok()
	end method

	method public void LongLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new LongTok()
		var n as long = 0l
		if long::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void LongLiteral(var value as long)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new LongTok()
	end method

	method public override string ToString() => $string$NumVal + "l"

	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot

end class

class public FloatLiteral extends NumberLiteral<of single> implements INegatable

	field private boolean _DoNeg

	method public void FloatLiteral()
		mybase::ctor()
		LitTyp = new SingleTok()
	end method

	method public void FloatLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new SingleTok()
		var n as single = 0f
		if single::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void FloatLiteral(var value as single)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new SingleTok()
	end method

	method public override string ToString() => $string$NumVal + "f"

	property public virtual autogen boolean DoNeg

end class

class public UIntLiteral extends NumberLiteral<of uinteger> implements INotable

	field private boolean _DoNot

	method public void UIntLiteral()
		mybase::ctor()
		LitTyp = new UIntegerTok()
	end method

	method public void UIntLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new UIntegerTok()
		var n as uinteger = 0ui
		if uinteger::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void UIntLiteral(var value as uinteger)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new UIntegerTok()
	end method

	method public override string ToString() => $string$NumVal + "ui"
		
	property public virtual autogen boolean DoNot

end class

class public ByteLiteral extends NumberLiteral<of byte> implements INotable

	field private boolean _DoNot

	method public void ByteLiteral()
		mybase::ctor()
		LitTyp = new ByteTok()
	end method

	method public void ByteLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new ByteTok()
		var n as byte = 0ub
		if byte::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void ByteLiteral(var value as byte)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new ByteTok()
	end method

	method public override string ToString() => $string$NumVal + "ub"

	property public virtual autogen boolean DoNot

end class

class public UShortLiteral extends NumberLiteral<of ushort> implements INotable

	field private boolean _DoNot

	method public void UShortLiteral()
		mybase::ctor()
		LitTyp = new UShortTok()
	end method

	method public void UShortLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new UShortTok()
		var n as ushort = 0us
		if ushort::TryParse(value,ref n) then
			NumVal = n
		end if
	end method
	
	method public void UShortLiteral(var value as ushort)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new UShortTok()
	end method

	method public override string ToString() => $string$NumVal + "us"

	property public virtual autogen boolean DoNot

end class

class public ULongLiteral extends NumberLiteral<of ulong> implements INotable

	field private boolean _DoNot

	method public void ULongLiteral()
		mybase::ctor()
		LitTyp = new ULongTok()
	end method

	method public void ULongLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new ULongTok()
		var n as ulong = 0ul
		if ulong::TryParse(value,ref n) then
			NumVal = n
		end if
		//_DoNot = false
	end method
	
	method public void ULongLiteral(var value as ulong)
		mybase::ctor($string$value)
		NumVal = value
		LitTyp = new ULongTok()
	end method

	method public override string ToString() => $string$NumVal + "ul"

	property public virtual autogen boolean DoNot

end class

class public IntPtrLiteral extends NumberLiteral<of IntPtr> implements INegatable, INotable

	field private boolean _DoNot
	field private boolean _DoNeg
	
	method public void IntPtrLiteral()
		mybase::ctor()
		LitTyp = new IntPtrTok()
	end method

	method public void IntPtrLiteral(var value as string)
		mybase::ctor(value)
		LitTyp = new IntPtrTok()
	end method

	method public override string ToString() => $string$NumVal + "ip"

	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot

end class
