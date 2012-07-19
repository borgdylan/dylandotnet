//The Lexer for the dylan.NET tokenizer
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v. 11.2.9.5 or later

//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 


#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refasm "tokenizer.AST.dll"
#refasm "dnu.dll"

import System
import System.IO
import dylan.NET
import dylan.NET.Utils
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Stmts

import dylan.NET.Tokenizer.Lexer

#debug on

assembly tokenizer.Lexer dll
ver 11.2.9.5

namespace dylan.NET.Tokenizer.Lexer
	#include "lexer/line.dyl"
	#include "lexer/lexer.dyl"
end namespace
