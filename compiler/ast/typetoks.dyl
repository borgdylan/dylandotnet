//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi TypeTok extends Token

	field public boolean IsArray
	field public boolean IsByRef
	field public Type RefTyp
	field public string OrdOp

	method public void TypeTok()
		me::ctor()
		IsArray = false
		IsByRef = false
		RefTyp = null
		OrdOp = ""
	end method

	method public void TypeTok(var value as string)
		me::ctor(value)
		IsArray = false
		IsByRef = false
		RefTyp = null
		OrdOp = ""
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

class public auto ansi GenericTypeTok extends TypeTok

	field public TypeTok[] Params

	method public void GenericTypeTok()
		me::ctor()
		Params = new TypeTok[0]
	end method

	method public void GenericTypeTok(var value as string)
		me::ctor(value)
		Params = new TypeTok[0]
	end method

	method public static void AddParam(var param as TypeTok)

		var i as integer = -1
		var destarr as TypeTok[] = new TypeTok[Params[l] + 1]

		do until i = Params[l] - 1
			i = i + 1
			destarr[i] = Params[i]
		end do

		destarr[Params[l]] = param
		Params = destarr

	end method

end class


class public auto ansi StringTok extends TypeTok

	method public void StringTok()
		me::ctor()
		RefTyp = gettype string
	end method

	method public void StringTok(var value as string)
		me::ctor(value)
		RefTyp = gettype string
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

class public auto ansi IntegerTok extends TypeTok

	method public void IntegerTok()
		me::ctor()
		RefTyp = gettype integer
	end method

	method public void IntegerTok(var value as string)
		me::ctor(value)
		RefTyp = gettype integer
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

class public auto ansi DoubleTok extends TypeTok

	method public void DoubleTok()
		me::ctor()
		RefTyp = gettype double
	end method

	method public void DoubleTok(var value as string)
		me::ctor(value)
		RefTyp = gettype double
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

class public auto ansi BooleanTok extends TypeTok

	method public void BooleanTok()
		me::ctor()
		RefTyp = gettype boolean
	end method

	method public void BooleanTok(var value as string)
		me::ctor(value)
		RefTyp = gettype boolean
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

class public auto ansi CharTok extends TypeTok

	method public void CharTok()
		me::ctor()
		RefTyp = gettype char
	end method

	method public void CharTok(var value as string)
		me::ctor(value)
		RefTyp = gettype char
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

class public auto ansi DecimalTok extends TypeTok

	method public void DecimalTok()
		me::ctor()
		RefTyp = gettype decimal
	end method

	method public void DecimalTok(var value as string)
		me::ctor(value)
		RefTyp = gettype decimal
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

class public auto ansi LongTok extends TypeTok

	method public void LongTok()
		me::ctor()
		RefTyp = gettype long
	end method

	method public void LongTok(var value as string)
		me::ctor(value)
		RefTyp = gettype long
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

class public auto ansi SByteTok extends TypeTok

	method public void SByteTok()
		me::ctor()
		RefTyp = gettype sbyte
	end method

	method public void SByteTok(var value as string)
		me::ctor(value)
		RefTyp = gettype sbyte
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

class public auto ansi ShortTok extends TypeTok

	method public void ShortTok()
		me::ctor()
		RefTyp = gettype short
	end method

	method public void ShortTok(var value as string)
		me::ctor(value)
		RefTyp = gettype short
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

class public auto ansi SingleTok extends TypeTok

	method public void SingleTok()
		me::ctor()
		RefTyp = gettype single
	end method

	method public void SingleTok(var value as string)
		me::ctor(value)
		RefTyp = gettype single
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

class public auto ansi ObjectTok extends TypeTok

	method public void ObjectTok()
		me::ctor()
		RefTyp = gettype object
	end method

	method public void ObjectTok(var value as string)
		me::ctor(value)
		RefTyp = gettype object
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

class public auto ansi VoidTok extends TypeTok

	method public void VoidTok()
		me::ctor()
		RefTyp = gettype void
	end method

	method public void VoidTok(var value as string)
		me::ctor(value)
		RefTyp = gettype void
	end method
	
	method public hidebysig virtual string ToString()
		return "void"
	end method

end class

class public auto ansi UIntegerTok extends TypeTok

	method public void UIntegerTok()
		me::ctor()
		RefTyp = gettype uinteger
	end method

	method public void UIntegerTok(var value as string)
		me::ctor(value)
		RefTyp = gettype uinteger
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

class public auto ansi ULongTok extends TypeTok

	method public void ULongTok()
		me::ctor()
		RefTyp = gettype ulong
	end method

	method public void ULongTok(var value as string)
		me::ctor(value)
		RefTyp = gettype ulong
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

class public auto ansi ByteTok extends TypeTok

	method public void ByteTok()
		me::ctor()
		RefTyp = gettype byte
	end method

	method public void ByteTok(var value as string)
		me::ctor(value)
		RefTyp = gettype byte
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

class public auto ansi UShortTok extends TypeTok

	method public void UShortTok()
		me::ctor()
		RefTyp = gettype UInt16
	end method

	method public void UShortTok(var value as string)
		me::ctor(value)
		RefTyp = gettype UInt16
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

class public auto ansi IntPtrTok extends TypeTok

	method public void IntPtrTok()
		me::ctor()
		RefTyp = gettype IntPtr
	end method

	method public void IntPtrTok(var value as string)
		me::ctor(value)
		RefTyp = gettype IntPtr
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
