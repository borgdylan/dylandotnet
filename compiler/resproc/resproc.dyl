﻿//The resource processor helper for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.5 or later

//    resproc.exe dylan.NET.ResProc Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
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
import System.Runtime.InteropServices
import System.Collections.Generic
import System.Text
import System.Resources
import System.Globalization

#if NET5_0_OR_GREATER then
import System.Resources.NetStandard
end #if

#include "Msg.dyl"
#include "Program.dyl"
