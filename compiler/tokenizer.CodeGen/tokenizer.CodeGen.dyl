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

#include "msbuild.dyl"
#include "Properties/AssemblyInfo.dyl"

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

namespace dylan.NET.Tokenizer.CodeGen
	#include "varitem.dyl"
	#include "fielditem.dyl"
	#include "propertyitem.dyl"
	#include "eventitem.dyl"
	//#include "filambdas.dyl"
	#include "methoditem.dyl"
	#include "milambdas.dyl"
	#include "ctoritem.dyl"
	#include "cilambdas.dyl"
	#include "typeitem.dyl"
	//tilambdas included in typeitem file
	#include "collectionitem.dyl"
	#include "typelist.dyl"
	#include "labelitem.dyl"
	#include "loopitem.dyl"
	#include "ifitem.dyl"
	#include "tryitem.dyl"
	#include "lockitem.dyl"
	#include "usingitem.dyl"
	#include "typeparamitem.dyl"
	#include "pinvokeinfo.dyl"
	#include "constinfo.dyl"
	#include "symtable.dyl"
	#include "helpers.dyl"
	#include "opstack.dyl"
	#include "eval.dyl"
	#include "stmtreader.dyl"
	#include "codegenerator.dyl"
end namespace
