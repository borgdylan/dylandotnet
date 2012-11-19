#refstdasm "mscorlib.dll"
#refasm "dnu.dll"
#include "nunit.dyl"

import System
import System.IO
import NUnit.Framework
import dylan.NET.UnitTests
import dylan.NET.Utils

assembly unit dll
ver 11.2.9.8

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
