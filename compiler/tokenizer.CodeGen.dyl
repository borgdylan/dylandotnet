//The Code Generator for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v. 11.3.1.5 or later

//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refstdasm "System.Core.dll"

#if CLR_2 then
#refasm "build/2.0/C5.Mono.dll"
#refasm "build/2.0/System.Interactive.dll"
#refasm "build/2.0/tokenizer.AST.dll"
#refasm "build/2.0/tokenizer.Lexer.dll"
#refasm "build/2.0/tokenizer.Parser.dll"
#refasm "build/2.0/IKVM.Reflection.dll"
#refasm "build/2.0/dnu.dll"
#refasm "build/2.0/dnr.dll"
#else
#refasm "build/4.0/C5.Mono.dll"
#refasm "build/4.0/System.Interactive.dll"
#refasm "build/4.0/tokenizer.AST.dll"
#refasm "build/4.0/tokenizer.Lexer.dll"
#refasm "build/4.0/tokenizer.Parser.dll"
#refasm "build/4.0/IKVM.Reflection.dll"
#refasm "build/4.0/dnu.dll"
#refasm "build/4.0/dnr.dll"
end #if

import System
import System.IO
import System.Linq
import System.Threading
import System.Diagnostics
import System.Diagnostics.SymbolStore
import System.Collections
import System.Collections.Generic
//import System.Reflection
//import System.Reflection.Emit
import System.Runtime.InteropServices
import dylan.NET
import dylan.NET.Utils
import dylan.NET.Reflection
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.AST
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
import IKVM.Reflection
import IKVM.Reflection.Emit

import dylan.NET.Tokenizer.CodeGen

#include "cflags.dyl"
#if DEBUG then
	#debug on
end #if

#include "codegen/assemblyinfo.dyl"

assembly tokenizer.CodeGen dll
ver 11.3.2.2

namespace dylan.NET.Tokenizer.CodeGen
	#include "codegen/varitem.dyl"
	#include "codegen/fielditem.dyl"
	#include "codegen/propertyitem.dyl"
	#include "codegen/eventitem.dyl"
	//#include "codegen/filambdas.dyl"
	#include "codegen/methoditem.dyl"
	#include "codegen/milambdas.dyl"
	#include "codegen/ctoritem.dyl"
	#include "codegen/cilambdas.dyl"
	#include "codegen/typeitem.dyl"
	//tilambdas included in typeitem file
	#include "codegen/collectionitem.dyl"
	#include "codegen/typelist.dyl"
	#include "codegen/labelitem.dyl"
	#include "codegen/loopitem.dyl"
	#include "codegen/ifitem.dyl"
	#include "codegen/lockitem.dyl"
	#include "codegen/tryitem.dyl"
	#include "codegen/usingitem.dyl"
	#include "codegen/typeparamitem.dyl"
	#include "codegen/pinvokeinfo.dyl"
	#include "codegen/constinfo.dyl"
	//#include "codegen/typearr.dyl"
	#include "codegen/symtable.dyl"
	#include "codegen/helpers.dyl"
	#include "codegen/opstack.dyl"
	#include "codegen/eval.dyl"
	#include "codegen/stmtreader.dyl"
	#include "codegen/codegenerator.dyl"
end namespace
