//The Compiler for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.4 or later

//    dnc.exe dylan.NET.Compiler Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm mscorlib.dll
#refstdasm System.dll

#if CLR_2 then
#refasm "build/2.0/tokenizer.AST.dll"
#refasm "build/2.0/tokenizer.Lexer.dll"
#refasm "build/2.0/tokenizer.Parser.dll"
#refasm "build/2.0/tokenizer.CodeGen.dll"
#refasm "build/2.0/dnu.dll"
#refasm "build/2.0/dnr.dll"
#else
#refasm "build/4.0/tokenizer.AST.dll"
#refasm "build/4.0/tokenizer.Lexer.dll"
#refasm "build/4.0/tokenizer.Parser.dll"
#refasm "build/4.0/tokenizer.CodeGen.dll"
#refasm "build/4.0/dnu.dll"
#refasm "build/4.0/dnr.dll"
end #if

import System
import System.IO
import System.Reflection
import System.Runtime.InteropServices
import dylan.NET.Utils
import dylan.NET.Reflection
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.Parser
import dylan.NET.Tokenizer.CodeGen

#include "cflags.dyl"
#if DEBUG then
	#debug on
end #if

#if NET_4_0 then
import System.Threading.Tasks
end #if

#include "dnc/assemblyinfo.dyl"

assembly dnc exe
ver 11.3.1.4

namespace dylan.NET.Compiler
	#include "dnc/Program.dyl"
end namespace
