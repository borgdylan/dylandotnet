﻿//The Parser for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.5 or later

//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

#include "msbuild.dyl"
#include "Properties/AssemblyInfo.dyl"

//import System
//import System.Linq
//import System.Collections
//import System.Collections.Generic
//import System.Runtime.InteropServices
//import dylan.NET
//import dylan.NET.Utils
//import dylan.NET.Reflection
//import dylan.NET.Tokenizer.Lexer
//import dylan.NET.Tokenizer.AST
//import dylan.NET.Tokenizer.AST.Interfaces
//import dylan.NET.Tokenizer.AST.Tokens
//import dylan.NET.Tokenizer.AST.Exprs
//import dylan.NET.Tokenizer.AST.Stmts
//import dylan.NET.Tokenizer.AST.Tokens.Ops
//import dylan.NET.Tokenizer.AST.Tokens.Literals
//import dylan.NET.Tokenizer.AST.Tokens.TypeToks
//import dylan.NET.Tokenizer.AST.Tokens.Attributes
//import dylan.NET.Tokenizer.AST.Tokens.Chars
//import dylan.NET.Tokenizer.Lexer
//import IKVM.Reflection
//import IKVM.Reflection.Emit
//import dylan.NET.Reflection

//import dylan.NET.Tokenizer.Parser

namespace dylan.NET.Tokenizer.Parser
	#include "parserflags.dyl"
	#include "tokenoptimizer.dyl"
	#include "exproptimizer.dyl"
	#include "stmtoptimizer.dyl"
	#include "parser.dyl"
end namespace