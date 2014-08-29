//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public TypeTok extends ValueToken implements ICloneable

	field public boolean IsArray
	field public boolean IsByRef
	field public IKVM.Reflection.Type RefTyp

	method public void TypeTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void TypeTok()
		mybase::ctor(string::Empty)
	end method

	method public void TypeTok(var value as IKVM.Reflection.Type)
		mybase::ctor(value::ToString())
		IsByRef = value::get_IsByRef()
		if IsByRef then
			value = value::GetElementType()
		end if
		IsArray = value::get_IsArray()
		if IsArray then
			value = value::GetElementType()
		end if
		RefTyp = value
	end method
	
	method public override TypeTok CloneTT()
		return new TypeTok(Value) {IsArray = IsArray, IsByRef = IsByRef, RefTyp = RefTyp}
	end method
	
	method public override final newslot object Clone()
		return CloneTT()
	end method
	
	method public override string ToString()
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

class public SpecialTypeTok extends TypeTok

	method public void SpecialTypeTok(var value as string)
		mybase::ctor(value)
	end method

end class

class public GenericTypeTok extends TypeTok implements ICloneable

	field public C5.LinkedList<of TypeTok> Params
	
	method public void GenericTypeTok(var value as string, var params as IEnumerable<of TypeTok>)
		mybase::ctor(value)
		Params = new C5.LinkedList<of TypeTok>() {AddAll(params)}
	end method
	
	method public void GenericTypeTok(var value as string)
		ctor(value, new TypeTok[0])
	end method
	
	method public void GenericTypeTok()
		ctor(string::Empty)
	end method

	method private TypeTok CloneFilter(var tt as TypeTok)
		return tt::CloneTT()
	end method

	method public override TypeTok CloneTT()
		return new GenericTypeTok(Value, Enumerable::Select<of TypeTok, TypeTok>(Params, new Func<of TypeTok, TypeTok>(CloneFilter))) _
			 {IsArray = IsArray, IsByRef = IsByRef, RefTyp = RefTyp}
	end method
	
	method public override final newslot object Clone()
		return CloneTT()
	end method

	method public void AddParam(var param as TypeTok)
		Params::Add(param)
	end method

	method public override string ToString()
		var sw as StringWriter = new StringWriter()
		sw::Write(Value)
		var c = Params::get_Count()
		if c > 0 then
			sw::Write("<of ")
			var i as integer = 0
			foreach p in Params
				i++
				sw::Write(p::ToString())
				if i < c then
					sw::Write(", ")
				end if
			end for
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


class public beforefieldinit StringTok extends SpecialTypeTok

	method public void StringTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void StringTok()
		ctor("string")
	end method

				
	method public override string ToString()
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

class public beforefieldinit IntegerTok extends SpecialTypeTok

	method public void IntegerTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void IntegerTok()
		ctor("integer")
	end method
	
	method public override string ToString()
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

class public beforefieldinit DoubleTok extends SpecialTypeTok

	method public void DoubleTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void DoubleTok()
		ctor("double")
	end method
				
	method public override string ToString()
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

class public beforefieldinit BooleanTok extends SpecialTypeTok
	
	method public void BooleanTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void BooleanTok()
		ctor("boolean")
	end method
	
	method public override string ToString()
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

class public beforefieldinit CharTok extends SpecialTypeTok
	
	method public void CharTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void CharTok()
		ctor("char")
	end method
	
	method public override string ToString()
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

class public beforefieldinit DecimalTok extends SpecialTypeTok
	
	method public void DecimalTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void DecimalTok()
		ctor("decimal")
	end method
	
	method public override string ToString()
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

class public beforefieldinit LongTok extends SpecialTypeTok

	method public void LongTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void LongTok()
		ctor("long")
	end method
	
	method public override string ToString()
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

class public beforefieldinit SByteTok extends SpecialTypeTok

	method public void SByteTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void SByteTok()
		ctor("sbyte")
	end method

	
	method public override string ToString()
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

class public beforefieldinit ShortTok extends SpecialTypeTok
	
	method public void ShortTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void ShortTok()
		ctor("short")
	end method
	
	method public override string ToString()
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

class public beforefieldinit SingleTok extends SpecialTypeTok
	
	method public void SingleTok()
		mybase::ctor("single")
	end method

	method public void SingleTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public override string ToString()
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

class public beforefieldinit ObjectTok extends SpecialTypeTok

	method public void ObjectTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void ObjectTok()
		ctor("object")
	end method

	method public override string ToString()
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

class public beforefieldinit VoidTok extends SpecialTypeTok

	method public void VoidTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void VoidTok()
		ctor("void")
	end method
	
	method public override string ToString()
		return "void"
	end method

end class

class public beforefieldinit UIntegerTok extends SpecialTypeTok

	method public void UIntegerTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void UIntegerTok()
		ctor("uinteger")
	end method

	method public override string ToString()
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

class public beforefieldinit ULongTok extends SpecialTypeTok

	method public void ULongTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void ULongTok()
		ctor("ulong")
	end method
	
	method public override string ToString()
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

class public beforefieldinit ByteTok extends SpecialTypeTok

	method public void ByteTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void ByteTok()
		ctor("byte")
	end method
	
	method public override string ToString()
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

class public beforefieldinit UShortTok extends SpecialTypeTok
	
	method public void UShortTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void UShortTok()
		ctor("ushort")
	end method

	method public override string ToString()
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

class public beforefieldinit IntPtrTok extends SpecialTypeTok
	
	method public void IntPtrTok(var value as string)
		mybase::ctor(value)
	end method
	
	method public void IntPtrTok()
		ctor("intptr")
	end method
	
	method public override string ToString()
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
