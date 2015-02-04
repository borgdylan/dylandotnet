//dylan.NET Collections...please use dylandotnet >= 11.3.5.1 to compile
//An addition to the NEW dylan.NET Compiler

//    dncollections.dll dylan.NET.Collections Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

#include "msbuild.dyl"
#include "Properties/AssemblyInfo.dyl"

import System
import System.Collections
import System.Collections.Generic
import System.Linq
import System.Xml
import System.Xml.Linq
import System.Linq.Expressions
import System.Text
import dylan.NET
import dylan.NET.Collections


#include "item.dyl"

namespace dylan.NET.Collections
	//#include "searchdelegate.dyl"
	#include "allist.dyl"
	#include "alstack.dyl"
	#include "alqueue.dyl"
end namespace
