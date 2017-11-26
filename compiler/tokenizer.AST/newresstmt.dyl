//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import System.IO
import System.Collections.Generic
import System.Linq

//import dylan.NET.Utils
//import dylan.NET.Reflection
//import dylan.NET.Tokenizer.AST
import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Stmts
//import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Literals
import dylan.NET.Tokenizer.AST.Tokens.Attributes
//import dylan.NET.Tokenizer.AST.Tokens.Chars
//import IKVM.Reflection
//import IKVM.Reflection.Emit

class public NewresStmt extends Stmt

	field public Token Path
	field public Token ResType

	method public void NewresStmt()
		me::ctor()
		Path = new Token()
		ResType = new Token()
	end method

end class
