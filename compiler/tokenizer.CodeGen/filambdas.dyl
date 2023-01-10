//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import System.IO
import System.Linq
import System.Threading
import System.Diagnostics
//import System.Diagnostics.SymbolStore
//import System.Collections
import System.Collections.Generic
//import System.Reflection
//import System.Reflection.Emit
import System.Runtime.InteropServices
//import dylan.NET
import dylan.NET.Utils
import dylan.NET.Reflection
import dylan.NET.Tokenizer.Lexer
//import dylan.NET.Tokenizer.AST
import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Literals
import dylan.NET.Tokenizer.AST.Tokens.Attributes
import dylan.NET.Tokenizer.AST.Tokens.Chars
import dylan.NET.Tokenizer.Parser
import Managed.Reflection
import Managed.Reflection.Emit
import System.Runtime.Versioning

import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

class private sealed FILambdas

	field assembly string Name

	method assembly void FILambdas()
		me::ctor()
		Name = string::Empty
	end method

	method assembly void FILambdas(var name as string)
		me::ctor()
		Name = name
	end method

	method assembly boolean DetermineIfCandidate(var fi as FieldItem) => fi::Name == Name

end class
