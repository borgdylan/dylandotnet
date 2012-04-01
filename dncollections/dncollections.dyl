//dylan.NET Collections...please use dylandotnet4 >= 11.2.8.8 to compile
//An addition to the NEW dylan.NET Compiler

//    dncollections.dll dylan.NET.Collections Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

#refstdasm "mscorlib.dll"

import System
import System.Text
import dylan.NET
import dylan.NET.Collections

#debug on

assembly dncollections dll
ver 11.2.8.9

namespace dylan.NET.Collections
	#include "dncollections/searchdelegate.dyl"
	#include "dncollections/item.dyl"
	#include "dncollections/allist.dyl"
	#include "dncollections/alstack.dyl"
	#include "dncollections/alqueue.dyl"
end namespace
