//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public beforefieldinit Token

	field public string Value
	field public integer Line
	field private static char[] q

	method private static void Token()
		q = new char[] {c'\q'}
	end method

	method public void Token(var value as string)
		mybase::ctor()
		Value = value
		//Line = 0
	end method
	
	method public void Token()
		ctor(string::Empty)
	end method
	
	method public hidebysig virtual string ToString()
		return #ternary {Value === null ? string::Empty , Value}
	end method

	property public string UnquotedValue
		get
			if string::IsNullOrEmpty(Value) then
				return string::Empty
			end if
			return #ternary { Value like c"^\q(.)*\q$" ? Value::Trim(q) , Value}
		end get
	end property

end class

class public NonExprToken extends Token

	method public void NonExprToken(var value as string)
		mybase::ctor(value)
	end method
	
	method public void NonExprToken()
		ctor(string::Empty)
	end method

end class

class public ValueToken extends Token

	method public void ValueToken(var value as string)
		mybase::ctor(value)
	end method
	
	method public void ValueToken()
		ctor(string::Empty)
	end method

end class