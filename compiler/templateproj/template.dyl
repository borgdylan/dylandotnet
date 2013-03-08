//dylan.NET test code

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refstdasm "System.Core.dll"
#refstdasm "System.Numerics.dll"
#refstdasm "System.Xml.Linq.dll"
#refasm "C5.Mono.dll"

import System
import System.IO
import System.Xml
import System.Linq
import System.Numerics
import System.Security.Permissions
import System.Xml.Linq
import System.Xml.Xpath
import System.Reflection
import System.Collections
import System.Collections.Generic
import SCGIE = System.Collections.Generic.IEnumerable
import SCG = System.Collections.Generic
import System.Threading
import System.Threading.Tasks
import template

#debug on

#warning "This is personal test code and is not a sample that should be followed."

#if DEBUG then
[assembly: System.Reflection.AssemblyConfiguration("DEBUG")]
#else
[assembly: System.Reflection.AssemblyConfiguration("RELEASE")]
end #if
[assembly: System.Reflection.AssemblyTitle("template")]
[assembly: System.Reflection.AssemblyCopyright("Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>")]
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

class public auto ansi BaseTest

	field private BaseTest F1
	field private template.BaseTest F2

	//[method: Obsolete("Test Custom Attribute")]
	//[method: SecurityPermissionAttribute(SecurityAction::Assert), SkipVerification = true]
	method public void CallTS1()
		Console::WriteLine(ToString())
	end method
	
	method public hidebysig virtual string ToString()
		return "Test " + mybase::ToString()
	end method
	
	method public void CallTS2()
		Console::WriteLine(ToString())
	end method
	
	method public void CallTS3()
		Console::WriteLine(mybase::ToString())
	end method
	
	method public void CallTS4(var o as object)
		Console::WriteLine(o)
	end method
	
	method public void CallTS4(var o as BaseTest)
		Console::WriteLine(o)
	end method
	
	method public void CallTS5()
		CallTS4(me)
	end method

end class

class public auto ansi beforefieldinit ROTest

	field public static initonly integer X
	
	method public static void ROTest()
		X = 11
	end method
	
	method public static void Modifier()
		var xc as integer = X
		//X = xc * 2
	end method

end class

class public auto ansi OTTEnumerator implements IEnumerator<of integer>, IEnumerator, IDisposable

	field private integer _Current
	
	method public void OTTEnumerator()
		_Current = 0
	end method
	
	method public hidebysig virtual newslot final boolean MoveNext()
		if _Current < 10 then
			_Current = _Current + 1
			return true
		else
			return false
		end if
	end method
	
	method public hidebysig virtual newslot final void Reset()
		_Current = 0
	end method
	
	method public hidebysig virtual newslot final void Dispose()
	end method
	
	method public hidebysig virtual newslot final specialname integer get_Current()
		return _Current
	end method
	
	method public hidebysig virtual newslot final specialname object IEnumerator.get_Current()
		return $object$_Current
	end method
	
	property none integer Current
		get get_Current()
	end property
	
	property none object IEnumerator.Current
		get get_Current()
	end property

end class

class public auto ansi partial Program
	field public static integer Z
	method public prototype void ProtoMethod(var x as integer, var y as integer)
end class

class public auto ansi OTT implements IEnumerable<of integer>, IEnumerable

	method public hidebysig virtual newslot final IEnumerator<of integer> GetEnumerator()
		return new OTTEnumerator()
	end method

	method public hidebysig virtual newslot final IEnumerator IEnumerable.GetEnumerator()
		return new OTTEnumerator()
	end method
	
end class

class public auto ansi ObjInit
	
	field public integer A
	field public integer B
	field public ObjInit C
	field private string _Msg
	
	method public void ABC()
		Console::WriteLine("hello")
	end method
	
	method public integer XYZ(var s as string)
		Console::WriteLine(s)
		return s::GetHashCode()
	end method
	
	method public hidebysig specialname string get_Msg()
		return _Msg
	end method
	
	method public hidebysig specialname void set_Msg(var m as string)
		_Msg = m
	end method

	property none string Msg
		get get_Msg()
		set set_Msg()
	end property
	
end class

class public auto ansi Program

	field public static integer X
	field public static IEnumerable<of string> Y
	field private static integer _TestProperty
	field private static EventHandler _TestEvent
	
	method public static void Program()
		var xc as integer = ROTest::X
		_TestProperty = 0
		_TestEvent = null
		Z = 12
		//ROTest::X = xc + 12
	end method
	
	method public void ProtoTest()
		ProtoMethod(12,6)
	end method
	
	method public void ProtoMethod(var x as integer, var y as integer)
		Console::WriteLine("ProtoImpl")
	end method
	
	method public static void numerictest()
		var bi as BigInteger = ($BigInteger$12 >> 1) << 2
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 + $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 * $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 - $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 / $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 % $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 and $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 nand $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 or $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 nor $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 xor $BigInteger$5
		Console::WriteLine(bi::ToString())
		bi = $BigInteger$12 xnor $BigInteger$5
		Console::WriteLine(bi::ToString())
		Console::WriteLine(bi == 24l)
		Console::WriteLine(bi != 24l)
		Console::WriteLine(bi < 45l)
		Console::WriteLine(bi > 20l)
		Console::WriteLine(bi <= 45l)
		Console::WriteLine(bi >= 20l)
	end method
	
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
		var iexel as SCGIE<of XElement> = XPath.Extensions::XPathSelectElements(xel,"./a")
		var ienumxel as SCG.IEnumerator<of XElement> = iexel::GetEnumerator()
		var pxel as Action<of XElement> = new Action<of XElement>(PrintXElement())
		do while ienumxel::MoveNext()
			pxel::Invoke(ienumxel::get_Current())
		end do
		Console::WriteLine("-------------------")
		var loi as List<of integer> = new List<of integer>()
		loi::Add(23)
		loi::Add(11)
		loi::Add(45)
		//loi::RemoveAt(0)
		var ienumloi as IEnumerator<of integer> = loi::GetEnumerator()
		do while ienumloi::MoveNext()
			Console::WriteLine(ienumloi::get_Current())
		end do
		Console::WriteLine("-------------------")
		Console::WriteLine(Enumerable::Min<of integer>(loi))
		Console::WriteLine("-------------------")
		Console::WriteLine(Enumerable::Max<of integer>(loi))
		Console::WriteLine("-------------------")
		loi::Sort()
		ienumloi = loi::GetEnumerator()
		do while ienumloi::MoveNext()
			Console::WriteLine(ienumloi::get_Current())
		end do
		Console::WriteLine("-------------------")
		loi::Reverse()
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
		var bp2 as boolean& = ref bp
		var str as string = bp::ToString()
		str = b::ToString()
		bp = true
	end method

	method public static void test(var ip as integer&)
		var i as integer = ip
		var ip2 as integer& = ref ip
		var str as string = ip::ToString()
		str = i::ToString()
		ip = 67
	end method

	method public static void test(var bpa as boolean[]&)
		var ba as boolean[] = bpa
		var bpa2 as boolean[]& = ref bpa
		var ba0 as boolean = bpa[0]
		var str as string = bpa[0]::ToString()
		test(ref bpa[0])
		bpa = new boolean[5]
		bpa[0] = true
		var i as integer = bpa::get_Rank()
	end method

	method public static void test(var sp as string&)
		var s as string = sp
		var sp2 as string& = ref sp
		var str as string = sp::ToString()
		str = s::ToString()
		sp = "Hello, You've been ByRefd"
	end method
	
	method public static boolean[] test2()
		return new boolean[2]
	end method
	
	method public static void intest(in var p as integer&)
	end method
	
	method public static void outtest(out var p as integer&)
	end method
	
	method public static void inouttest(inout var p as integer&)
	end method
	
	method public static void scopingtests()
		var i as integer = 0
		
		do
			var i as integer
			i = 12
			Console::WriteLine(i)
		until true
		
		i = 23
		Console::WriteLine(i)
	end method
	
	method public static void foreachtests()
		
		foreach i in new integer[] {3, 23}
			Console::WriteLine(i)
		end for
		
		foreach i in new C5.LinkedList<of integer> {1,12,23}
			Console::WriteLine(i)
		end for
		
		Console::WriteLine("--------------------------")
		
		foreach i in new string[] {"This", "is", "a", "foreach"}
			Console::WriteLine(i)
		end for
		
		Console::WriteLine("--------------------------")
		
		var tl as C5.IList<of long> = new C5.LinkedList<of long>()
		var tli as integer = 0
		do until tli = 10
			tli = tli + 1
			var dt as DateTime = DateTime::get_Now()
			tl::Add(dt::get_Ticks() / TimeSpan::TicksPerMillisecond)
			Thread::Sleep(500)
		end do
		
		foreach dt in tl
			Console::WriteLine(dt::ToString())
		end for
		Console::WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~~~")
		foreach dt in tl::Backwards()::GetEnumerator()
			Console::WriteLine(dt::ToString())
		end for
		
	end method
	
	method public static void aliastests()
		Console::WriteLine(string::Empty)
		Console::WriteLine(integer::Parse("23"))
	end method
	
	method public static hidebysig specialname integer get_TestProperty()
		return _TestProperty
	end method
	
	method public static hidebysig specialname void set_TestProperty(var i as integer)
		_TestProperty = i
	end method
	
	[property: Obsolete("Test Custom Attribute")]
	property none integer TestProperty
		get get_TestProperty()
		set set_TestProperty()
	end property
	
	method public static hidebysig specialname void add_TestEvent(var eh as EventHandler)
		if _TestEvent != null then
			_TestEvent = _TestEvent + eh
		else
			_TestEvent = eh
		end if
	end method
	
	method public static hidebysig specialname void remove_TestEvent(var eh as EventHandler)
		if _TestEvent != null then
			_TestEvent = _TestEvent - eh
		end if
	end method
	
	method public static void OnTestEvent()
		if _TestEvent != null then
			_TestEvent::Invoke(null,new EventArgs())
		end if
	end method
	
	[event: Obsolete("Test Custom Attribute")]
	event none EventHandler TestEvent
		add add_TestEvent()
		remove remove_TestEvent()
	end event

	[method: STAThread()]
	method public static void main()
//		gentest()
//		var hc as HelloClass = new HelloClass()
//		var ih as IHello = $IHello$hc
//	    ih::Hello()
//		var ih2 as IHello2 = $IHello2$hc
//		ih2::Hello2()
//		var ih3 as IHello3 = $IHello3$hc
//		ih3::Hello()
//		hc::Hello2()
//		exthrow()
//		var a as string = "z"
//		var b as boolean = "a" like "^(.)*$"
//		b = 10 == $integer$MethodAttributes::Final
//		b = new Decimal(4) == new Decimal(78)
//		b = (100ui > 67ui) or (100ui >= 67ui) or (100ui < 67ui) or (100ui <= 67ui)
//		b = test2()[0]
//		test(ref b)
//		test(ref test2()[0])
//		test(ref a)
//		var i as integer = 34
//		test(ref i)
//		var ba as boolean[] = new boolean[1]
//		ba[0] = false
//		test(ref ba[0])
//		test(ref ba)
//		Console::WriteLine('a' + $char$4)
//		var ubv as byte = 6ub
//		var usv as ushort = 6us
//		var uiv as uinteger = 3294967295ui
//		Console::WriteLine(Convert::ToString(((((UInt32::MaxValue - 17ui) / 30ui) * 9ui) + 5ui))) % 21ui
//		Console::WriteLine(((((Int32::MaxValue - 10) / 20) * 10) + 9) % 20)
//		var ulv as ulong = 0ul
//		ulv = 6ul
//		ulv = 6004ul
//		ulv = UInt64::MaxValue
//		//Int64::MaxValue
//		ulv = 9223372036854775807ul
//		var arr as integer[]  = new integer[1]
//		arr[0] = 3
//		arr[0]::ToString()
//		var dv as decimal = 7m
//		dv = 9223372036854775802m
//		dv = 2.5m
//		dv = 14028230000000000000000000006m
//		var typ as Type = gettype string[]
//		typ = gettype Func<of IEnumerable<of XElement> >
//		var xc as integer = ROTest::X
//		//ROTest::X = xc + 12
//		foreachtests()
//		Console::WriteLine("asdf" is List<of object>)
//		Console::WriteLine(("asdf" as List<of object>)  != null)
//		Console::WriteLine("asdf" is string)
//		Console::WriteLine(("asdf" as string) != null)
//		Console::WriteLine(2 << 3)
//		Console::WriteLine(2ui << 3)
//		Console::WriteLine(2l << 3)
//		Console::WriteLine(32 >> 2)
//		Console::WriteLine(32ui >> 2)
//		Console::WriteLine(32l >> 2)
		numerictest()
		Console::WriteLine(true nand true)
		Console::WriteLine(true nor true)
		Console::WriteLine(true xnor true)
		Console::WriteLine(1 nand 2)
		Console::WriteLine(1 nor 2)
		Console::WriteLine(1 xnor 3)
		
		lock new object()
			Console::WriteLine("In A Lock")
		end lock
		
		foreach o in new OTT()
			Console::WriteLine(o)
		end for
		
		var ao as object = new integer[] {1,2,3}
		var ai = $integer[]$ao
		var oi = new ObjInit() {A = 1, B = 2, C = new ObjInit() {A = 3, B = 4, C = null, set_Msg("InnerHello")}, set_Msg("Hello")}
		var ti = #ternary {true or false ? new C5.LinkedList<of string>() , new C5.ArrayList<of string>()}
		var ci = new ObjInit()::XYZ("hello")
		ci = new ObjInit(){A = 3, C = null}::A
		new ObjInit()::ABC()
		new ObjInit()::XYZ("t")
		new ObjInit(){C = new ObjInit()}::C::XYZ("u")
		Console::WriteLine(new ObjInit(){A = 3, B = new ObjInit()::XYZ("q")}::B)
		Console::WriteLine("Hello from " _
			+ "a continued " _
			+ "line")
		var dd = DateTime::get_Now() - DateTime::get_Now()
		var d = 11
		d = ++d
		d = --d
	end method

end class