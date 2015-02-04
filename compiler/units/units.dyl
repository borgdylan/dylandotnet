﻿//The unit tests for the dylan.NET Compiler
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.2.9.8 or later

//    unit.dll dylan.NET.UnitTests Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
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
import NUnit.Framework
import dylan.NET.UnitTests
import dylan.NET.Utils

//[class: TestFixture()]
//class public auto ansi Dummy
//
//	[method: Test()]
//  [method: Description("Dummy Test")]
//	method public void TestDummy()
//		Assert::AreEqual(1,1)
//	end method
//
//end class

namespace dylan.NET.UnitTests
	#include "parseutests.dyl"
	#include "streamutests.dyl"
end namespace
