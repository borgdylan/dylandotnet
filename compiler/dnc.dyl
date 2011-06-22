//The Compiler for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.9.9 or later

//    dnc.exe dylan.NET.Compiler Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
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
#refasm E:\Code\dylannet\compiler\tokenizer.Parser.dll
#refasm E:\Code\dylannet\compiler\tokenizer.CodeGen.dll
#refasm E:\Code\dylannet\compiler\dnu.dll
#refasm E:\Code\dylannet\compiler\dnr.dll

import Microsoft.VisualBasic
import System
import System.Reflection
import System.Collections
import System.Collections.Generic
import System.Data
import System.Diagnostics
import System.Linq
import System.Xml
import System.Xml.Linq
import dylan.NET.Utils
import dylan.NET.Reflection
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.Parser
import dylan.NET.Tokenizer.CodeGen

assembly dnc exe
ver 11.2.7.1

namespace dylan.NET.Compiler
#include E:\Code\dylannet\compiler\dnc\Mod1.dyl
end namespace
