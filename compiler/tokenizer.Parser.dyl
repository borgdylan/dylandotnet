//The Parser for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.9.9 or later

//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refasm mscorlib.dll
#refasm System.dll
#refasm System.Core.dll
#refasm System.Data.dll
#refasm System.Data.DataSetExtensions.dll
#refasm System.Xml.dll 
#refasm System.Xml.Linq.dll
#refasm System.Configuration.dll
#refasm Microsoft.VisualBasic.dll
#refasm E:\Code\dylannet\compiler\tokenizer.AST.dll
#refasm E:\Code\dylannet\compiler\tokenizer.Lexer.dll
#refasm E:\Code\dylannet\compiler\dnu.dll

import Microsoft.VisualBasic
import System
import System.Collections
import System.Collections.Generic
import System.Data
import System.Diagnostics
import System.Linq
import System.Xml
import System.Xml.Linq
import dylan.NET
import dylan.NET.Utils
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

locimport dylan.NET.Tokenizer.Parser

assembly tokenizer.Parser dll
ver 11.2.7.6

namespace dylan.NET.Tokenizer.Parser
#include E:\Code\dylannet\compiler\parser\parserflags.dyl
#include E:\Code\dylannet\compiler\parser\tokenoptimizer.dyl
#include E:\Code\dylannet\compiler\parser\exproptimizer.dyl
#include E:\Code\dylannet\compiler\parser\stmtoptimizer.dyl
#include E:\Code\dylannet\compiler\parser\parser.dyl
end namespace
