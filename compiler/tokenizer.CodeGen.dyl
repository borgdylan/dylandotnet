//The Parser for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.9.9 or later

//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"
#refasm "tokenizer.AST.dll"
#refasm "tokenizer.Lexer.dll"
#refasm "tokenizer.Parser.dll"
#refasm "dnu.dll"
#refasm "dnr.dll"

import System
import System.Diagnostics
import System.Diagnostics.SymbolStore
import System.IO
import System.Reflection
import System.Reflection.Emit
import System.Runtime.InteropServices
import dylan.NET
import dylan.NET.Utils
import dylan.NET.Reflection
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.AST
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Literals
import dylan.NET.Tokenizer.AST.Tokens.Attributes
import dylan.NET.Tokenizer.AST.Tokens.Chars
import dylan.NET.Tokenizer.Parser

import dylan.NET.Tokenizer.CodeGen

#debug on

assembly tokenizer.CodeGen dll
ver 11.2.8.9

namespace dylan.NET.Tokenizer.CodeGen
	#include "codegen/varitem.dyl"
	#include "codegen/fielditem.dyl"
	#include "codegen/methoditem.dyl"
	#include "codegen/ctoritem.dyl"
	#include "codegen/labelitem.dyl"
	#include "codegen/loopitem.dyl"
	#include "codegen/ifitem.dyl"
	#include "codegen/typearr.dyl"
	#include "codegen/symtable.dyl"
	#include "codegen/helpers.dyl"
	#include "codegen/constldr.dyl"
	#include "codegen/opstack.dyl"
	#include "codegen/eval.dyl"
	#include "codegen/stmtreader.dyl"
	#include "codegen/codegenerator.dyl"
end namespace
