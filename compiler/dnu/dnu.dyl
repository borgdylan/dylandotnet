//The utility library for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.5 or later

//    dnu.dll dylan.NET.Utils Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
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
import System.Globalization
import System.Xml
import System.Text
import System.Linq
import System.Xml.Linq
//import System.Xml.XPath
import System.Collections.Generic
//import System.Text.RegularExpressions
import System.Runtime.InteropServices
//import System.Reactive
//import System.Reactive.Linq

//import dylan.NET.Utils
//import dylan.NET

//#include "Messages.designer.dyl"

namespace dylan.NET.Utils
	//#include "consts.dyl"
	#include "InterpolateResult.dyl"
	#include "xmlu.dyl"
	#include "parseu.dyl"
	#include "keyboard.dyl"
	#include "compilermsg.dyl"
	#include "streamu.dyl"
	//#include "dnu/winapi.txt"
end namespace

#include "MemoryFS.dyl"
