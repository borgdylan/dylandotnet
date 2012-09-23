//The dylan.NET Reflection Library
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.2.9.7 or later

//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refstdasm "System.Core.dll"
#refasm "dnu.dll"
#refasm "IKVM.Reflection.dll"

import System
import System.IO
import System.Linq
import System.Collections
import System.Collections.Generic
import System.Diagnostics
import System.Diagnostics.SymbolStore
import System.Reflection
import System.Reflection.Emit
import System.Text.RegularExpressions
import System.Runtime.InteropServices
import dylan.NET
import dylan.NET.Utils
import dylan.NET.Reflection
import IKVM.Reflection
import IKVM.Reflection.Emit

#debug on

#include "dnr/assemblyinfo.dyl"

assembly dnr dll
ver 11.2.9.7

namespace dylan.NET.Reflection
	#include "dnr/milambdas.dyl"
	#include "dnr/instructionhelper.dyl"
	#include "dnr/ilemitter.dyl"
	#include "dnr/asmfactory.dyl"
	#include "dnr/importer.dyl"
	#include "dnr/loader.dyl"
	#include "dnr/consoleprinter.dyl"
end namespace
