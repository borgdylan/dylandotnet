//dylan.NET IDE...please use dylandotnet4 >= 11.2.8.3 to compile
//An addition to the NEW dylan.NET Compiler

//    dnide.exe dylan.NET.IDE Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#include "libs/dylandotnet-collections4.dyl"
#include "libs/gtk-sharp.dyl"
#include "libs/dylandotnet4.dyl"

import System
import System.IO
import System.Reflection
import System.Threading
import System.Collections
import Gtk
import dylan.NET
import dylan.NET.Utils
import dylan.NET.Collections
import dylan.NET.Compiler
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.Parser
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.IDE

#debug off

assembly dnide exe
ver 11.2.8.3

namespace dylan.NET.IDE
	#include "dnide/mainwindow.dyl"
	#include "dnide/program.dyl"
end namespace
