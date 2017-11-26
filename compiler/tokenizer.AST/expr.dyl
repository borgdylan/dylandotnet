//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import System.Collections.Generic
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Stmts

class public Expr

	field public C5.ArrayList<of Token> Tokens
	field public integer Line
	field public integer EndLine
	field public integer Column
	field public integer EndColumn
	field public Type ResultTyp

	method public void Expr()
		mybase::ctor()
		Tokens = new C5.ArrayList<of Token>(3, C5.MemoryType::Normal)
	end method

	method public void PosFromExpr(var exp as Expr)
		Line = exp::Line
		EndLine = exp::EndLine
		Column = exp::Column
		EndColumn = exp::EndColumn
	end method

	method public void PosFromStmt(var exp as Stmt)
		Line = exp::Line
		EndLine = exp::EndLine
		Column = exp::Column
		EndColumn = exp::EndColumn
	end method

	method public void AddToken(var toktoadd as Token)
		if Tokens::get_Count() == 0 then
			Line = toktoadd::Line
			Column = toktoadd::Column
		end if
		Tokens::Add(toktoadd)
		EndLine = toktoadd::EndLine
		EndColumn = toktoadd::EndColumn
	end method

	method public void AddTokens(var tokstoadd as IEnumerable<of Token>)
		foreach tok in tokstoadd
			AddToken(tok)
		end for
	end method

	method public void RemToken(var ind as integer)
		Tokens::RemoveAt(ind)
	end method

end class