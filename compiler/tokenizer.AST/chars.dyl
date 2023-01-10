//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens

class public Character extends Token

	method public void Character(var value as string)
		mybase::ctor(value)
	end method

	method public void Character()
		ctor(string::Empty)
	end method

end class

class public Paren extends Character

	method public void Paren(var value as string)
		mybase::ctor(value)
	end method

	method public void Paren()
		ctor(string::Empty)
	end method

end class

class public CloseParen extends Paren

	method public void CloseParen(var value as string)
		mybase::ctor(value)
	end method

	method public void CloseParen()
		ctor(string::Empty)
	end method

end class

class public OpenParen extends Paren

	method public void OpenParen(var value as string)
		mybase::ctor(value)
	end method

	method public void OpenParen()
		ctor(string::Empty)
	end method

	method public virtual boolean IsValidCloseParen(var cp as CloseParen) => false

end class

// ]
class public sealed RSParen extends CloseParen
	method public override string ToString() => "]"
end class

// [
class public sealed LSParen extends OpenParen
	method public override string ToString() => "["
	method public override boolean IsValidCloseParen(var cp as CloseParen) => cp is RSParen
end class

// }
class public sealed RCParen extends CloseParen
	method public override string ToString() => "}"
end class

// {
class public sealed LCParen extends OpenParen
	method public override string ToString() => "{"
	method public override boolean IsValidCloseParen(var cp as CloseParen) => cp is RCParen
end class

// []
class public sealed LRSParen extends Character
	method public override string ToString() => "[]"
end class

// >
class public sealed RAParen extends CloseParen
	method public override string ToString() => ">"
end class

// <
class public sealed LAParen extends OpenParen
	method public override string ToString() => "<"
	method public override boolean IsValidCloseParen(var cp as CloseParen) => cp is RAParen
end class

// )
class public sealed RParen extends CloseParen
	method public override string ToString() => ")"
end class

// (
class public sealed LParen extends OpenParen
	method public override string ToString() => "("
	method public override boolean IsValidCloseParen(var cp as CloseParen) => cp is RParen
end class

// ,
class public sealed Comma extends Character
	method public override string ToString() => ","
end class

// \r\n
class public sealed CrLf extends Character
	method public override string ToString() => c"\r\n"
end class

// \r
class public sealed Cr extends Character
	method public override string ToString() => c"\r"
end class

// \n
class public sealed Lf extends Character
	method public override string ToString() => c"\n"
end class

// |
class public sealed Pipe extends Character
	method public override string ToString() => "|"
end class

// &
class public sealed Ampersand extends Character
	method public override string ToString() => "&"
end class

// $
class public sealed DollarSign extends Character
	method public override string ToString() => "$"
end class

// ?
class public sealed QuestionMark extends Character
	method public override string ToString() => "?"
end class

// :
class public sealed Colon extends Character
	method public override string ToString() => ":"
end class

// =>
class public sealed GoesToTok extends Character
	method public override string ToString() => "=>"
end class