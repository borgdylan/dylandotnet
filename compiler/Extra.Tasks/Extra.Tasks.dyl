//The MSBuild tasks for the dylan.NET language

//    Extra.Tasks.dll Extra.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
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
//import System.Collections
import System.Collections.Generic
import System.Linq
//import System.Xml
//import System.Xml.Linq
//import System.Text.RegularExpressions
//import Microsoft.Build.Tasks
import Microsoft.Build.Framework
import Microsoft.Build.Utilities
import dylan.NET.Utils
import dylan.NET.Compiler
import dylan.NET.ResProc

//#include "ErrorWarnTask.dyl"
#include "DncTask.dyl"
#include "ResProcTask.dyl"
#include "FindResProcOuts.dyl"

//#warning "This is an warning"
//#error "This is an error"