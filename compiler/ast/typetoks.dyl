//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi TypeTok extends Token implements ICloneable

	field public boolean IsArray
	field public boolean IsByRef
	field public IKVM.Reflection.Type RefTyp

	method public void TypeTok()
		me::ctor()
		IsArray = false
		IsByRef = false
		RefTyp = null
	end method

	method public void TypeTok(var value as string)
		me::ctor(value)
		IsArray = false
		IsByRef = false
		RefTyp = null
	end method

	method public void TypeTok(var value as IKVM.Reflection.Type)
		me::ctor()
		IsByRef = value::get_IsByRef()
		if IsByRef then
			value = value::GetElementType()
		end if
		IsArray = value::get_IsArray()
		if IsArray then
			value = value::GetElementType()
		end if
		RefTyp = value
		Value = value::ToString()
	end method
	
	method public hidebysig virtual TypeTok CloneTT()
		return new TypeTok(Value) {IsArray = IsArray, IsByRef = IsByRef, RefTyp = RefTyp}
	end method
	
	method public hidebysig virtual final newslot object Clone()
		return CloneTT()
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return Value + "[]&"
		elseif IsArray then
			return Value + "[]"
		elseif IsByRef then
			return Value + "&"
		else
			return Value
		end if
	end method

end class

class public auto ansi GenericTypeTok extends TypeTok implements ICloneable

	field public TypeTok[] Params

	method public void GenericTypeTok()
		me::ctor()
		Params = new TypeTok[0]
	end method

	method public void GenericTypeTok(var value as string)
		me::ctor(value)
		Params = new TypeTok[0]
	end method
	
	method public hidebysig virtual TypeTok CloneTT()
		var tt as GenericTypeTok = new GenericTypeTok(Value) {IsArray = IsArray, IsByRef = IsByRef, RefTyp = RefTyp, Params = new TypeTok[Params[l]]}
		var i as integer = -1
		do until i = (Params[l] - 1)
			i = i + 1
			tt::Params[i] = Params[i]::CloneTT()
		end do
		return tt
	end method
	
	method public hidebysig virtual final newslot object Clone()
		return CloneTT()
	end method

	method public void AddParam(var param as TypeTok)
		var i as integer = -1
		var destarr as TypeTok[] = new TypeTok[Params[l] + 1]
		do until i = Params[l] - 1
			i = i + 1
			destarr[i] = Params[i]
		end do
		destarr[Params[l]] = param
		Params = destarr
	end method

	method public hidebysig virtual string ToString()
		var sw as StringWriter = new StringWriter()
		sw::Write(Value)
		if Params[l] > 0 then
			sw::Write("<of ")
			var i as integer = -1
			do until i = (Params[l] - 1)
				i = i + 1
				sw::Write(Params[i]::ToString())
				if i < (Params[l] - 1) then
					sw::Write(", ")
				end if
			end do
			sw::Write("> ")
		end if
		if IsArray and IsByRef then
			sw::Write("[]&")
		elseif IsArray then
			sw::Write("[]")
		elseif IsByRef then
			sw::Write("&")
		end if
		return sw::ToString()
	end method

end class


class public auto ansi beforefieldinit StringTok extends TypeTok

	field private static initonly IKVM.Reflection.Type strtyp

	method private static void StringTok()
		strtyp = ILEmitter::Univ::Import(gettype string)
	end method

	method public void StringTok()
		me::ctor("string")
		RefTyp = strtyp
	end method

	method public void StringTok(var value as string)
		me::ctor(value)
		RefTyp = strtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "string[]&"
		elseif IsArray then
			return "string[]"
		elseif IsByRef then
			return "string&"
		else
			return "string"
		end if
	end method

end class

class public auto ansi beforefieldinit IntegerTok extends TypeTok

	field private static initonly IKVM.Reflection.Type inttyp

	method private static void IntegerTok()
		inttyp = ILEmitter::Univ::Import(gettype integer)
	end method

	method public void IntegerTok()
		me::ctor("integer")
		RefTyp = inttyp
	end method

	method public void IntegerTok(var value as string)
		me::ctor(value)
		RefTyp = inttyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "integer[]&"
		elseif IsArray then
			return "integer[]"
		elseif IsByRef then
			return "integer&"
		else
			return "integer"
		end if
	end method

end class

class public auto ansi beforefieldinit DoubleTok extends TypeTok

	field private static initonly IKVM.Reflection.Type dbltyp

	method private static void DoubleTok()
		dbltyp = ILEmitter::Univ::Import(gettype double)
	end method

	method public void DoubleTok()
		me::ctor("double")
		RefTyp = dbltyp
	end method

	method public void DoubleTok(var value as string)
		me::ctor(value)
		RefTyp = dbltyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "double[]&"
		elseif IsArray then
			return "double[]"
		elseif IsByRef then
			return "double&"
		else
			return "double"
		end if
	end method

end class

class public auto ansi beforefieldinit BooleanTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type bltyp

	method private static void BooleanTok()
		bltyp = ILEmitter::Univ::Import(gettype boolean)
	end method
	
	method public void BooleanTok()
		me::ctor("boolean")
		RefTyp = bltyp
	end method

	method public void BooleanTok(var value as string)
		me::ctor(value)
		RefTyp = bltyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "boolean[]&"
		elseif IsArray then
			return "boolean[]"
		elseif IsByRef then
			return "boolean&"
		else
			return "boolean"
		end if
	end method

end class

class public auto ansi beforefieldinit CharTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type chrtyp

	method private static void CharTok()
		chrtyp = ILEmitter::Univ::Import(gettype char)
	end method
	
	method public void CharTok()
		me::ctor("char")
		RefTyp = chrtyp
	end method

	method public void CharTok(var value as string)
		me::ctor(value)
		RefTyp = chrtyp
	end method

	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "char[]&"
		elseif IsArray then
			return "char[]"
		elseif IsByRef then
			return "char&"
		else
			return "char"
		end if
	end method

end class

class public auto ansi beforefieldinit DecimalTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type dectyp

	method private static void DecimalTok()
		dectyp = ILEmitter::Univ::Import(gettype decimal)
	end method
	
	method public void DecimalTok()
		me::ctor("decimal")
		RefTyp = dectyp
	end method

	method public void DecimalTok(var value as string)
		me::ctor(value)
		RefTyp = dectyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "decimal[]&"
		elseif IsArray then
			return "decimal[]"
		elseif IsByRef then
			return "decimal&"
		else
			return "decimal"
		end if
	end method

end class

class public auto ansi beforefieldinit LongTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type lngtyp

	method private static void LongTok()
		lngtyp = ILEmitter::Univ::Import(gettype long)
	end method
	
	method public void LongTok()
		me::ctor("long")
		RefTyp = lngtyp
	end method

	method public void LongTok(var value as string)
		me::ctor(value)
		RefTyp = lngtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "long[]&"
		elseif IsArray then
			return "long[]"
		elseif IsByRef then
			return "long&"
		else
			return "long"
		end if
	end method

end class

class public auto ansi beforefieldinit SByteTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type sbtyp

	method private static void SByteTok()
		sbtyp = ILEmitter::Univ::Import(gettype sbyte)
	end method
	
	method public void SByteTok()
		me::ctor("sbyte")
		RefTyp = sbtyp
	end method

	method public void SByteTok(var value as string)
		me::ctor(value)
		RefTyp = sbtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "sbyte[]&"
		elseif IsArray then
			return "sbyte[]"
		elseif IsByRef then
			return "sbyte&"
		else
			return "sbyte"
		end if
	end method

end class

class public auto ansi beforefieldinit ShortTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type shtyp

	method private static void ShortTok()
		shtyp = ILEmitter::Univ::Import(gettype short)
	end method
	
	method public void ShortTok()
		me::ctor("short")
		RefTyp = shtyp
	end method

	method public void ShortTok(var value as string)
		me::ctor(value)
		RefTyp = shtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "short[]&"
		elseif IsArray then
			return "short[]"
		elseif IsByRef then
			return "short&"
		else
			return "short"
		end if
	end method

end class

class public auto ansi beforefieldinit SingleTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type sngtyp

	method private static void SingleTok()
		sngtyp = ILEmitter::Univ::Import(gettype single)
	end method
	
	method public void SingleTok()
		me::ctor("single")
		RefTyp = sngtyp
	end method

	method public void SingleTok(var value as string)
		me::ctor(value)
		RefTyp = sngtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "short[]&"
		elseif IsArray then
			return "short[]"
		elseif IsByRef then
			return "short&"
		else
			return "short"
		end if
	end method

end class

class public auto ansi beforefieldinit ObjectTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type objtyp

	method private static void ObjectTok()
		objtyp = ILEmitter::Univ::Import(gettype object)
	end method
	
	method public void ObjectTok()
		me::ctor("object")
		RefTyp = objtyp
	end method

	method public void ObjectTok(var value as string)
		me::ctor(value)
		RefTyp = objtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "object[]&"
		elseif IsArray then
			return "object[]"
		elseif IsByRef then
			return "object&"
		else
			return "object"
		end if
	end method

end class

class public auto ansi beforefieldinit VoidTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type vdtyp

	method private static void VoidTok()
		vdtyp = ILEmitter::Univ::Import(gettype void)
	end method
	
	method public void VoidTok()
		me::ctor("void")
		RefTyp = vdtyp
	end method

	method public void VoidTok(var value as string)
		me::ctor(value)
		RefTyp = vdtyp
	end method
	
	method public hidebysig virtual string ToString()
		return "void"
	end method

end class

class public auto ansi beforefieldinit UIntegerTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type uinttyp

	method private static void UIntegerTok()
		uinttyp = ILEmitter::Univ::Import(gettype uinteger)
	end method
	
	method public void UIntegerTok()
		me::ctor("uinteger")
		RefTyp = uinttyp
	end method

	method public void UIntegerTok(var value as string)
		me::ctor(value)
		RefTyp = uinttyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "uinteger[]&"
		elseif IsArray then
			return "uinteger[]"
		elseif IsByRef then
			return "uinteger&"
		else
			return "uinteger"
		end if
	end method

end class

class public auto ansi beforefieldinit ULongTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type ulngtyp

	method private static void ULongTok()
		ulngtyp = ILEmitter::Univ::Import(gettype ulong)
	end method
	
	method public void ULongTok()
		me::ctor("ulong")
		RefTyp = ulngtyp
	end method

	method public void ULongTok(var value as string)
		me::ctor(value)
		RefTyp = ulngtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "ulong[]&"
		elseif IsArray then
			return "ulong[]"
		elseif IsByRef then
			return "ulong&"
		else
			return "ulong"
		end if
	end method

end class

class public auto ansi beforefieldinit ByteTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type btyp

	method private static void ByteTok()
		btyp = ILEmitter::Univ::Import(gettype byte)
	end method
	
	method public void ByteTok()
		me::ctor("byte")
		RefTyp = btyp
	end method

	method public void ByteTok(var value as string)
		me::ctor(value)
		RefTyp = btyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "byte[]&"
		elseif IsArray then
			return "byte[]"
		elseif IsByRef then
			return "byte&"
		else
			return "byte"
		end if
	end method

end class

class public auto ansi beforefieldinit UShortTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type ushtyp

	method private static void UShortTok()
		ushtyp = ILEmitter::Univ::Import(gettype ushort)
	end method
	
	method public void UShortTok()
		me::ctor("ushort")
		RefTyp = ushtyp
	end method

	method public void UShortTok(var value as string)
		me::ctor(value)
		RefTyp = ushtyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "ushort[]&"
		elseif IsArray then
			return "ushort[]"
		elseif IsByRef then
			return "ushort&"
		else
			return "ushort"
		end if
	end method

end class

class public auto ansi beforefieldinit IntPtrTok extends TypeTok
	
	field private static initonly IKVM.Reflection.Type iptyp

	method private static void IntPtrTok()
		iptyp = ILEmitter::Univ::Import(gettype IntPtr)
	end method
	
	method public void IntPtrTok()
		me::ctor("intptr")
		RefTyp = iptyp
	end method

	method public void IntPtrTok(var value as string)
		me::ctor(value)
		RefTyp = iptyp
	end method
	
	method public hidebysig virtual string ToString()
		if IsArray and IsByRef then
			return "intptr[]&"
		elseif IsArray then
			return "intptr[]"
		elseif IsByRef then
			return "intptr&"
		else
			return "intptr"
		end if
	end method

end class
