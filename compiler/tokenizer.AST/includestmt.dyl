//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens

class public sealed IncludeStmt extends Stmt

	field public Token Path
	field public StmtSet SSet
	field public boolean HasError

	method public void IncludeStmt()
		mybase::ctor()
		Path = new Token()
	end method

	method public override string ToString()
		var temp as string = Path::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = i"\q{temp}\q"
		end if
		return i"#include {temp}"
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly

end class
