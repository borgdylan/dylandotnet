//    unit.dll dylan.NET.UnitTests Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

//unit tests for ParseUtils
[class: TestFixture()]
class public auto ansi TestParseUtils

	[method: Test()]
	[parameter1: Range(0,255,1)]
	method public void TestProcessStringExtASCII(var charcode as integer)
		var hs as string = "\x" + charcode::ToString("x2")
		var c as char = $char$charcode
		Assert::AreEqual($string$c, ParseUtils::ProcessString(hs),"'" + hs + "' should evaluate to '" + $string$c + "'")
	end method
	
	[method: Test()]
	[parameter1: Random(0,65535,500)]
	method public void TestProcessStringUTF16(var charcode as integer)
		var hs as string = "\x" + charcode::ToString("x4")
		var c as char = $char$charcode
		Assert::AreEqual($string$c, ParseUtils::ProcessString(hs),"'" + hs + "' should evaluate to '" + $string$c + "'")
	end method
	
	[method: Test()]
	method public void TestProcessStringX1()
		Assert::AreEqual("+1", ParseUtils::ProcessString("\x2b1"), "'\x2b1' should evaluate to '+1'")
	end method
	
	[method: Test()]
	method public void TestProcessStringX2()
		Assert::AreEqual("", ParseUtils::ProcessString("\x"), "'\x' should evaluate to ''")
	end method
	
	[method: Test()]
	method public void TestProcessStringX3()
		Assert::AreEqual("2", ParseUtils::ProcessString("\x2"), "'\x2' should evaluate to '2'")
	end method
	
	[method: Test()]
	method public void TestProcessStringX4()
		Assert::AreEqual("yu", ParseUtils::ProcessString("\xyu"), "'\xyu' should evaluate to 'yu'")
	end method
	
	[method: Test()]
	method public void TestProcessStringNUL()
		Assert::AreEqual($string$Convert::ToChar(0), ParseUtils::ProcessString("\0"), "'\0' should evaluate to a null char.")
	end method
	
	[method: Test()]
	method public void TestProcessStringTAB()
		Assert::AreEqual($string$Convert::ToChar(9), ParseUtils::ProcessString("\t"), "'\t' should evaluate to a tab.")
	end method
	
	[method: Test()]
	method public void TestProcessStringCR()
		Assert::AreEqual($string$Convert::ToChar(13), ParseUtils::ProcessString("\r"), "'\r' should evaluate to a carriage return.")
	end method
	
	[method: Test()]
	method public void TestProcessStringLF()
		Assert::AreEqual($string$Convert::ToChar(10), ParseUtils::ProcessString("\n"), "'\n' should evaluate to a line feed.")
	end method
	
	[method: Test()]
	method public void TestProcessStringVT()
		Assert::AreEqual($string$Convert::ToChar(11), ParseUtils::ProcessString("\v"), "'\v' should evaluate to a vertical tab.")
	end method
	
	[method: Test()]
	method public void TestProcessStringA()
		Assert::AreEqual($string$Convert::ToChar(7), ParseUtils::ProcessString("\a"), "'\a' should evaluate to a bell.")
	end method
	
	[method: Test()]
	method public void TestProcessStringBS()
		Assert::AreEqual($string$Convert::ToChar(8), ParseUtils::ProcessString("\b"), "'\b' should evaluate to a backspace.")
	end method
	
	[method: Test()]
	method public void TestProcessStringFF()
		Assert::AreEqual($string$Convert::ToChar(12), ParseUtils::ProcessString("\f"), "'\f' should evaluate to a form feed.")
	end method
	
	[method: Test()]
	method public void TestProcessStringS()
		Assert::AreEqual("'", ParseUtils::ProcessString("\s"), "'\s' should evaluate to a single quote.")
	end method
	
	[method: Test()]
	method public void TestProcessStringQ()
		Assert::AreEqual($string$Convert::ToChar(34), ParseUtils::ProcessString("\q"), "'\q' should evaluate to a double quote.")
	end method
	
	[method: Test()]
	method public void TestProcessStringBSL()
		Assert::AreEqual(c"\\", ParseUtils::ProcessString(c"\\\\"), "'\\' should evaluate to a backslash.")
	end method
	
	[method: Test()]
	method public void TestStringParserQ()
		Assert::AreEqual(1, ParseUtils::StringParser(c"\qI am a Test Case\q"," ")[l], "The string should only be one token long.")
	end method
	
	[method: Test()]
	method public void TestStringParserNoQ()
		Assert::AreEqual(5, ParseUtils::StringParser("I am a Test Case"," ")[l], "The string should be 5 tokens long.")
	end method
	
	[method: Test()]
	method public void TestStringParserEmpty()
		Assert::AreEqual(0, ParseUtils::StringParser(""," ")[l], "The string should be 0 tokens long.")
	end method
	
	[method: Test()]
	method public void TestStringParserCQ()
		Assert::AreEqual(4, ParseUtils::StringParser(c"I,am,a,\qTest,Case\q",",")[l], "The string should be 4 tokens long.")
	end method
	
	[method: Test()]
	method public void TestStringParser2dsCQ()
		Assert::AreEqual(5, ParseUtils::StringParser2ds(c"I,am,a great,\qTest,Case Example\q",","," ")[l], "The string should be 5 tokens long.")
	end method

	[method: Test()]
	method public void TestProcessMSYSPathUnix()
		Assert::AreEqual("/a/unix/path", ParseUtils::ProcessMSYSPath("/a/unix/path",PlatformID::Unix), "The strings should be equal.")
	end method
		
end class
