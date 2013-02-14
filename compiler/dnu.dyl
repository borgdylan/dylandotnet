//The utility library for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.2.9.7 or later

//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refstdasm "System.Core.dll"
#refstdasm "System.Xml.Linq.dll"
#refasm "C5.Mono.dll"

import System
import System.IO
import System.Globalization
import System.Xml
import System.Text
import System.Linq
import System.Xml.Linq
import System.Xml.XPath
import System.Collections.Generic
import System.Text.RegularExpressions
import System.Runtime.InteropServices

import dylan.NET.Utils
import dylan.NET

#include "cflags.dyl"
#if DEBUG then
	#debug on
end #if

#if RX and NET_4_5 then
	#refstdasm "System.Reactive.Core.dll"
	#refstdasm "System.Reactive.Linq.dll"
	import System.Reactive
	import System.Reactive.Linq
end #if

#include "dnu/assemblyinfo.dyl"

assembly dnu dll
ver 11.3.1.1

namespace dylan.NET.Utils
	#include "dnu/consts.dyl"
	#include "dnu/xmlu.dyl"
	#include "dnu/parseu.dyl"
	#include "dnu/keyboard.dyl"
	#include "dnu/compilermsg.dyl"
	#include "dnu/streamu.dyl"
	//#include "dnu/winapi.txt"
end namespace
