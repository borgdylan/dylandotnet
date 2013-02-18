//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Character extends Token
end class

// ]
class public auto ansi RSParen extends Character
	method public hidebysig virtual string ToString()
		return "]"
	end method
end class

// [
class public auto ansi LSParen extends Character
	method public hidebysig virtual string ToString()
		return "["
	end method
end class

// {
class public auto ansi RCParen extends Character
	method public hidebysig virtual string ToString()
		return "}"
	end method
end class

// }
class public auto ansi LCParen extends Character
	method public hidebysig virtual string ToString()
		return "{"
	end method
end class

// []
class public auto ansi LRSParen extends Character
	method public hidebysig virtual string ToString()
		return "[]"
	end method
end class

// >
class public auto ansi RAParen extends Character
	method public hidebysig virtual string ToString()
		return ">"
	end method
end class

// <
class public auto ansi LAParen extends Character
	method public hidebysig virtual string ToString()
		return "<"
	end method
end class

// )
class public auto ansi RParen extends Character
	method public hidebysig virtual string ToString()
		return ")"
	end method
end class

// (
class public auto ansi LParen extends Character
	method public hidebysig virtual string ToString()
		return "("
	end method
end class

// ,
class public auto ansi Comma extends Character
	method public hidebysig virtual string ToString()
		return ","
	end method
end class

// \r\n
class public auto ansi CrLf extends Character
	method public hidebysig virtual string ToString()
		return c"\r\n"
	end method
end class

// \r
class public auto ansi Cr extends Character
	method public hidebysig virtual string ToString()
		return c"\r"
	end method
end class

// \n
class public auto ansi Lf extends Character
	method public hidebysig virtual string ToString()
		return c"\n"
	end method
end class

// |
class public auto ansi Pipe extends Character
	method public hidebysig virtual string ToString()
		return "|"
	end method
end class

// &
class public auto ansi Ampersand extends Character
	method public hidebysig virtual string ToString()
		return "&"
	end method
end class

// $
class public auto ansi DollarSign extends Character
	method public hidebysig virtual string ToString()
		return "$"
	end method
end class

// ?
class public auto ansi QuestionMark extends Character
	method public hidebysig virtual string ToString()
		return "?"
	end method
end class

// :
class public auto ansi Colon extends Character
	method public hidebysig virtual string ToString()
		return ":"
	end method
end class

