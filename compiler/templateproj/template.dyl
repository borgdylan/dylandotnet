#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refstdasm "System.Core.dll"
#refstdasm "System.Xml.Linq.dll"

import System
import System.IO
import System.Xml
import System.Linq
import System.Xml.Linq
import System.Xml.Xpath
import System.Reflection
import System.Collections.Generic
import template

#debug on

assembly template exe
ver 1.1.0.0

#include "empty.dyl"

delegate public auto ansi void MyDelegate(var x as integer)

class public auto ansi beforefieldinit sealed SC
end class

class public auto ansi abstract interface IHello
	method public hidebysig virtual abstract newslot void Hello()
end class

class public auto ansi abstract interface IHello2
	method public hidebysig virtual abstract newslot void Hello2()
end class

class public auto ansi abstract interface IHello3
	method public hidebysig virtual abstract newslot void Hello()
end class

class public auto ansi HelloClass implements IHello, IHello2, IHello3

	method public hidebysig virtual final newslot void IHello.Hello()
		Console::WriteLine("I Implement Hello")
	end method

	method public hidebysig virtual final newslot void IHello3.Hello()
		Console::WriteLine("I Implement Hello3")
	end method

	method public hidebysig virtual final newslot void Hello2()
		Console::WriteLine("I Implement Hello2")
	end method

end class


class public auto ansi Program

	field public static integer X
	field public static IEnumerable<of string> Y

	method public static void PrintXElement(var el as XElement)
		Console::Write(el::Attribute(XName::Get("id"))::get_Value()::ToString())
		Console::WriteLine(":" + el::get_Value()::ToString())
	end method

	method public static void gentest()
		var quot as string = Convert::ToString($char$34)
		var sw as StringWriter = new StringWriter()
		sw::WriteLine("<root>")
		sw::WriteLine("    <a id=" + quot + "1" + quot + ">Hello</a>")
		sw::WriteLine("    <a id=" + quot + "2" + quot + ">World</a>")
		sw::WriteLine("    <a id=" + quot + "3" + quot + ">!!</a>")
		sw::WriteLine("</root>")
		var xel as XElement = XElement::Parse(sw::ToString())
		Console::WriteLine(xel::ToString())
		var iexel as IEnumerable<of XElement> = XPath.Extensions::XPathSelectElements(xel,"./a")
		var ienumxel as IEnumerator<of XElement> = iexel::GetEnumerator()
		var pxel as Action<of XElement> = new Action<of XElement>(PrintXElement())
		do while ienumxel::MoveNext()
			pxel::Invoke(ienumxel::get_Current())
		end do
		Console::WriteLine("-------------------")
		var lloi as List<of integer> = new List<of integer>()
		var loi as IList<of integer> = $IList<of integer>$lloi
		loi::Add(23)
		loi::Add(11)
		loi::Add(45)
		//loi::RemoveAt(0)
		var ienumloi as IEnumerator<of integer> = loi::GetEnumerator()
		do while ienumloi::MoveNext()
			Console::WriteLine(ienumloi::get_Current())
		end do
		Console::WriteLine("-------------------")
		Console::WriteLine(Enumerable::Min<of integer>($IEnumerable<of integer>$loi))
		Console::WriteLine("-------------------")
		Console::WriteLine(Enumerable::Max<of integer>($IEnumerable<of integer>$loi))
		Console::WriteLine("-------------------")
		lloi::Sort()
		ienumloi = loi::GetEnumerator()
		do while ienumloi::MoveNext()
			Console::WriteLine(ienumloi::get_Current())
		end do
		Console::WriteLine("-------------------")
		lloi::Reverse()
		ienumloi = loi::GetEnumerator()
		do while ienumloi::MoveNext()
			Console::WriteLine(ienumloi::get_Current())
		end do
	end method

	method public static void nullabletest()
		var a as Nullable<of integer> = $Nullable<of integer>$null
		Console::WriteLine(a::get_HasValue())
		a = $Nullable<of integer>$56
		Console::WriteLine(a::get_HasValue())
		if a::get_HasValue() then
			Console::WriteLine($integer$a)
		end if
		a = new Nullable<of integer>(46)
		Console::WriteLine(a::get_HasValue())
		if a::get_HasValue() then
			Console::WriteLine(a::get_Value())
		end if
	end method

	method public static void exthrow()
		try
			Console::WriteLine("try")
			throw new ArithmeticException("This is a Test Exception")
		catch aex as ArgumentException
			Console::WriteLine("argex")
		catch ex as Exception
			try
				Console::WriteLine(ex::ToString())
				throw ex
			catch ex2 as Exception
			end try
		finally
			Console::WriteLine("finally")
		end try
	end method

	method public static void test(var bp as boolean&)
		var b as boolean = bp
		var bp2 as boolean& = ref|bp
		var str as string = bp::ToString()
		str = b::ToString()
		bp = true
	end method

	method public static void test(var ip as integer&)
		var i as integer = ip
		var ip2 as integer& = ref|ip
		var str as string = ip::ToString()
		str = i::ToString()
		ip = 67
	end method

	method public static void test(var bpa as boolean[]&)
		var ba as boolean[] = bpa
		var bpa2 as boolean[]& = ref|bpa
		var ba0 as boolean = bpa[0]
		var str as string = bpa[0]::ToString()
		test(ref|bpa[0])
		bpa = new boolean[5]
		bpa[0] = true
		var i as integer = bpa::get_Rank()
	end method

	method public static void test(var sp as string&)
		var s as string = sp
		var sp2 as string& = ref|sp
		var str as string = sp::ToString()
		str = s::ToString()
		sp = "Hello, You've been ByRefd"
	end method

	method public static boolean[] test2()
		return new boolean[2]
	end method

	method public static void main()
		gentest()
		var hc as HelloClass = new HelloClass()
		var ih as IHello = $IHello$hc
	    ih::Hello()
		var ih2 as IHello2 = $IHello2$hc
		ih2::Hello2()
		var ih3 as IHello3 = $IHello3$hc
		ih3::Hello()
		hc::Hello2()
		exthrow()
		var a as string = "z"
		var b as boolean = "a" like "^(.)*$"
		b = 10 == $integer$MethodAttributes::Final
		b = new Decimal(4) == new Decimal(78)
		b = (100ui > 67ui) or (100ui >= 67ui) or (100ui < 67ui) or (100ui <= 67ui)
		b = test2()[0]
		test(ref|b)
		test(ref|test2()[0])
		test(ref|a)
		var i as integer = 34
		test(ref|i)
		var ba as boolean[] = new boolean[1]
		ba[0] = false
		test(ref|ba[0])
		test(ref|ba)
		Console::WriteLine('a' + $char$4)
		var ubv as byte = 6ub
		var usv as ushort = 6us
		var uiv as uinteger = 3294967295ui
		Console::WriteLine(Convert::ToString(((((UInt32::MaxValue - 17ui) / 30ui) * 9ui) + 5ui))) % 21ui
		Console::WriteLine(((((Int32::MaxValue - 10) / 20) * 10) + 9) % 20)
		var ulv as ulong = 0ul
		ulv = 6ul
		ulv = 6004ul
		ulv = UInt64::MaxValue
		//Int64::MaxValue
		ulv = 9223372036854775807ul
		var arr as integer[]  = new integer[1]
		arr[0] = 3
		arr[0]::ToString()
		var dv as decimal = 7m
		dv = 9223372036854775802m
		dv = 2.5m
		dv = 14028230000000000000000000006m
		var typ as Type = gettype string[]
		typ = gettype Func<of IEnumerable<of XElement> >
	end method

end class