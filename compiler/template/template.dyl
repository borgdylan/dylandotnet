//dylan.NET test code

#include "msbuild.dyl"
#include "Properties/AssemblyInfo.dyl"

import System
import System.IO
import System.Xml
//import System.Text
import System.Linq
import System.Numerics
//import System.Security.Permissions
import System.Xml.Linq
//import System.Xml.Xpath
//import System.Reflection
import System.Collections
import System.Collections.Generic
import SCGIE = System.Collections.Generic.IEnumerable
import SCG = System.Collections.Generic
import System.Threading
import System.Threading.Tasks
import System.Runtime.InteropServices
import System.Diagnostics
//import System.Runtime.CompilerServices
//import template

#warning "This is personal test code and is not a sample that should be followed."

delegate public void MyDelegate(var x as integer)
delegate public U MyDelegate<of T, U>(var t as T)

struct public sequential point
	field public integer x
	field public integer y
end struct

class public beforefieldinit sealed SC
end class

interface public IHello
	method public void Hello()

	property public autogen integer MyInt
	property public initonly autogen integer MyInt2
end interface

interface public IHello2
	method public void Hello2()
end interface

class public interface IHello3
	method public void Hello()
end class

interface public IEvent<of T>
	event public T MyEvent
		add
		remove
	end event
end interface

class public HelloClass implements IHello, IHello2, IHello3, IEvent<of integer>

	property public autogen integer MyInt
	property public initonly autogen integer MyInt2

	method public virtual void IHello.Hello()
		Console::WriteLine("I Implement Hello")
	end method

	method public virtual void IHello3.Hello()
		Console::WriteLine("I Implement Hello3")
	end method

	method public virtual void Hello2()
		Console::WriteLine("I Implement Hello2")
	end method

	event public virtual integer IEvent<of integer>.MyEvent
		add
			throw new NotImplementedException()
		end add
		remove
			throw new NotImplementedException()
		end remove
	end event

end class

class public Container

	class public Sibling
	end class

	delegate public void MyDelegate(var x as integer)
	delegate public U MyDelegate<of T, U>(var t as T)

	class public Nested

		field public integer X
		field public literal integer C = 6 + 5
		property public autogen Container Parent

		method public void Nested(var p as Container)
			mybase::ctor()
			_Parent = p
			X = 0
		end method

		method public void Nested()
			mybase::ctor()
			X = 0
		end method

		method public string M()
			return $string$ new Nested()::X
		end method

		method public object N()
			return new Sibling()
		end method

	end class

	field public Nested Child

end class

class public BaseTest

	field private BaseTest F1
	field private template.BaseTest F2

	property public string ClassName => "BaseTest"

	//[method: Obsolete("Test Custom Attribute")]
	//[method: SecurityPermissionAttribute(SecurityAction::Assert), SkipVerification = true]
	method public void CallTS1()
		Console::WriteLine(ToString())
	end method

	method public override string ToString() => "Test " + mybase::ToString()

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

class public beforefieldinit ROTest

	field public static initonly integer X

	method public static void ROTest()
		X = 11
	end method

	method public static void Modifier()
		var xc as integer = X
		//X = xc * 2
	end method

end class

class public OTTEnumerator implements IEnumerator<of integer>, IEnumerator, IDisposable

	field private integer _Current

	method public void OTTEnumerator()
		_Current = 0
	end method

	method public virtual boolean MoveNext()
		if _Current < 10 then
			_Current++
			return true
		else
			return false
		end if
	end method

	method public virtual void Reset()
		_Current = 0
	end method

	method public virtual void Dispose()
	end method

	property public virtual integer IEnumerator<of integer>.Current
		get
			return _Current
		end get
	end property

	property public virtual object IEnumerator.Current
		get
			return $object$_Current
		end get
	end property

end class

//[class: Obsolete("This class is only fakely obsolete")]
class public OTT implements IEnumerable<of integer>, IEnumerable

	method public virtual IEnumerator<of integer> IEnumerable<of integer>.GetEnumerator()
		return new OTTEnumerator()
	end method

	method public virtual IEnumerator IEnumerable.GetEnumerator()
		return new OTTEnumerator()
	end method

end class

[class: System.Reflection.DefaultMember("Item")]
class public ObjInit

	field public integer A
	field public integer B
	field public ObjInit C
	field private string _Msg

	method public void ObjInit(var a as integer, var b as integer, var msg as string)
		mybase::ctor()
		A = a
		B = b
		_Msg = msg
	end method

	method public void ObjInit()
		ctor(0,0,string::Empty)
	end method

	method public void ABC()
		Console::WriteLine("hello")
	end method

	method public integer XYZ(var s as string)
		Console::WriteLine(s)
		return s::GetHashCode()
	end method

	property public string Msg
		get
			return _Msg
		end get
		set
			_Msg = value
		end set
	end property

	property public integer Item(var index as integer)
		get
			return index
		end get
		set
			Console::WriteLine("[{0}] = {1}", $object$index, $object$value)
		end set
	end property

	property public integer PS
		get
			return 0
		end get
		set private
			Console::WriteLine("You have private access")
		end set
	end property


	property public integer? PSN
		get
			return new integer?(0)
		end get
	end property

end class

#region genericfuncs

	class public GenType<of T>
		field public T Fld

		class public GenNest<of X, Y> extends List<of X>
		end class

		method public void GenType(var f as T)
			mybase::ctor()
			Fld = f
		end method

		method public T Met(var t as T)
			return t
		end method

		method public V Met<of V>(var v as V)
			return v
		end method

		method public U Met<of U>(var u as U, var t as T)
			var d = new Func<of U, U>(Met<of U>)
			var e = new MyDelegate<of U, U>(Met<of U>)
			return d::Invoke(u)
		end method

	end class

	class public GenType<of T, U> extends List<of T>

	end class

	class public static Generics

		class public GenNest<of T, U> extends List<of T>
		end class

		method public static U[] Func<of T, U>(var o as T) where T as {ICollection<of U>}, U as {out}
			foreach u in o
				Console::WriteLine(u::ToString())
			end for

			return Enumerable::ToArray<of U>(o)
		end method

		method public static T Func<of T>(var o as T)
			return o
		end method

		method public static T Clone<of T>(var o as T) where T as {ICloneable}
			return $T$o::Clone()
		end method

		method public static T New<of T>() where T as {new}
			//new T()
			return new T()
		end method

		method public static Tuple<of T, U> Func<of T, U>(var o as T, var o2 as U)
			return Tuple::Create<of T, U>(o, o2)
		end method

		method public static T[] Func2<of T>(var ie as IEnumerable<of T>)
			return Enumerable::ToArray<of T>(ie)
		end method

		//[method: Obsolete("Fake Obsolete", true)]
		method public static T[] addelem<of T>(var srcarr as T[], var eltoadd as T)
			var destarr as T[] = new T[++srcarr[l]]

			for i = 0 upto --srcarr[l]
				destarr[i] = srcarr[i]
			end for

			destarr[srcarr[l]] = eltoadd

			return destarr
		end method

		method public static T[] remelem<of T>(var srcarr as T[], var ind as integer)
			var destarr as T[] = new T[--srcarr[l]]

			for i = 0 upto --ind
				destarr[i] = srcarr[i]
			end for
			for i = ++ind upto --srcarr[l]
				destarr[--i] = srcarr[i]
			end for

			return destarr
		end method

		method public static T[] addelem<of T>(var srcarr as T[], var eltoadd as T, var eltoadd2 as T )
			return addelem<of T>(addelem<of T>(srcarr, eltoadd), eltoadd2)
		end method

		method public static T[] addremelem<of T>(var srcarr as T[], var eltoadd as T, var ind as integer)
			return remelem<of T>(addelem<of T>(srcarr, eltoadd), ind)
		end method

		method public static T[] addremelem<of T>(var srcarr as T[], var eltoadd as T, var eltoadd2 as T, var ind as integer)
			return remelem<of T>(addelem<of T>(srcarr, eltoadd, eltoadd2), ind)
		end method

		method public static void exch<of T>(var p1 as T&, var p2 as T&)
			var temp = p1
			p1 = p2
			p2 = temp
		end method

		method public static T getdefault<of T>()
			return default T
		end method

		method public static string ToString<of T>(var t as T)
			return Func<of T>(t)::ToString()
		end method

		method public static Type GetType<of T>(var t as T)
			return t::GetType()
		end method

	end class

end #region

class public static partial Program
	field public static integer Z
	method public static prototype void ProtoMethod(var x as integer, var y as integer)
end class

[enum: Flags()]
enum public integer MyEnum
	None = 0
	A = 1
	B = 2
	C = 4
end enum

class public sealed MyAttribute extends Attribute

	field public single[] Arr

	method public void MyAttribute(var arr as string[])
		mybase::ctor()
	end method

	method public void MyAttribute(var arr as integer[])
		mybase::ctor()
	end method

end class

class public static Program

	property public static autogen integer AutoTest
	property public initonly static autogen integer AutoROTest

	field public static integer X
	field public static IEnumerable<of string> Y
	field private static integer _TestProperty
	field private static Dictionary<of integer, string> _TestIndexer
	field private static EventHandler _TestEvent
	field public literal integer Const = 11
	field public literal integer Const2 = 5
	field public literal integer Const3 = 93
	field public literal string ConstsIntrodIn = "11.3.1.5"
	field public literal double PI2 = Math::PI * 2d
	field public literal AttributeTargets ASClassMethod = AttributeTargets::Class or AttributeTargets::Method

	method private static void Program()
		var xc as integer = ROTest::X
		_TestProperty = 0
		_TestEvent = null
		Z = 12
		//ROTest::X = xc + 12
		_AutoTest = 11
		_AutoROTest = 11
	end method

	method public static void ProtoTest()
		ProtoMethod(12,6)
	end method

	method public static void ProtoMethod(var x as integer, var y as integer)
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
		//var quot as string = Convert::ToString($char$34)
		var sw as StringWriter = new StringWriter()
		sw::WriteLine("<root>")
		sw::WriteLine(c"    <a id=\q1\q>Hello</a>")
		sw::WriteLine(c"    <a id=\q2\q>World</a>")
		sw::WriteLine(c"    <a id=\q3\q>!!</a>")
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
		var a as integer? = $integer?$null
		Console::WriteLine(a::get_HasValue())
		a = $integer?$56
		Console::WriteLine(a::get_HasValue())
		if a::get_HasValue() then
			Console::WriteLine($integer$a)
		end if
		a = new integer?(46)
		Console::WriteLine(a::get_HasValue())
		if a::get_HasValue() then
			Console::WriteLine(a::get_Value())
		end if
		var narr = new integer?[] {new integer?(2), new integer?(4)}
	end method

	method public static void exthrow()
		try
			Console::WriteLine("try")
			throw new ArithmeticException("This is a Test Exception")
		catch aex as ArgumentException
			Console::WriteLine("argex")
		catch
			try
				Console::WriteLine(ex::ToString())
				throw ex
			catch ex2 as Exception
				throw
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

		if true then
			var i as integer
			i = 12
			Console::WriteLine(i)
		end if

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
		for tli = 1 upto 10
			var dt as DateTime = DateTime::get_Now()
			tl::Add(dt::get_Ticks() / TimeSpan::TicksPerMillisecond)
			Thread::Sleep(500)
		end for

		foreach dt as string in tl
			Console::WriteLine(dt)
		end for
		Console::WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~~~")
		foreach dt as string in tl::Backwards()::GetEnumerator()
			Console::WriteLine(dt)
		end for

	end method

	method public static void aliastests()
		Console::WriteLine(string::Empty)
		Console::WriteLine(integer::Parse("23"))
	end method

	property public static integer TestProperty
		get
			return _TestProperty
		end get
		set
			_TestProperty = value
		end set
	end property

	property public static string TestIndexer(var idx as integer)
		get
			return _TestIndexer::get_Item(idx)
		end get
		set
			_TestIndexer::set_Item(idx, value)
		end set
	end property

	method public static void OnTestEvent()
		if _TestEvent != null then
			_TestEvent::Invoke(null,new EventArgs())
		end if
	end method

	[event: Obsolete("Test Custom Attribute")]
	event public static EventHandler TestEvent
		add
			if _TestEvent != null then
				_TestEvent = _TestEvent + value
			else
				_TestEvent = value
			end if
		end add
		remove
			if _TestEvent != null then
				_TestEvent = _TestEvent - value
			end if
		end remove
	end event

	#region "P/Invokes"
		[method: DllImport("libm")]
		method public pinvokeimpl static double sin(var x as double)

		[method: DllImport("libctest")]
		method public pinvokeimpl static integer incr(var x as integer)

		[method: DllImport("libctest")]
		method public pinvokeimpl static double cplxmod(var a as double, var b as double)

		[method: DllImport("libctest")]
		method public pinvokeimpl static void printpt(var p as point)

		[method: DllImport("libctest")]
		method public pinvokeimpl static void incrpt(var p as point&)
	end #region

	method public static integer& RefRet(var b as boolean)
		var x = 12
		// if b then
			return ref X
		// else
		//	//this is a violation of safety
		// 	return ref x
		// end if
	end method

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
//		numerictest()
		Console::WriteLine(true nand true)
		Console::WriteLine(true nor true)
		Console::WriteLine(true xnor true)
		Console::WriteLine(1 nand 2)
		Console::WriteLine(1 nor 2)
		Console::WriteLine(1 xnor 3)

		foreach o in new OTT()
			Console::WriteLine(o)
		end for

//		var ao as object = new integer[] {1,2,3}
//		var ai = $integer[]$ao
//		var oi = new ObjInit() {A = 1, B = 2, C = new ObjInit() {A = 3, B = 4, C = null, set_Msg("InnerHello")}, set_Msg("Hello")}
//		var ti = #ternary {true or false ? new C5.LinkedList<of string>() , new C5.ArrayList<of string>()}
//		var ci = new ObjInit()::XYZ("hello")
//		ci = new ObjInit(){A = 3, C = null}::A
//		new ObjInit()::ABC()
//		new ObjInit()::XYZ("t")
//		new ObjInit(){C = new ObjInit()}::C::XYZ("u")
//		Console::WriteLine(new ObjInit(){A = 3, B = new ObjInit()::XYZ("q")}::B)
//		Console::WriteLine("Hello from {0} {1}" _
//			, "a continued" _
//			, "line")
//		var x = #expr("abc" + $string$!#expr(12 + 6))::Trim()::get_Length()
//
//		for xi = 1 upto 7
//			for xj = xi downto 1
//				for xz = xj downto 1
//					Console::WriteLine("{0}, {1}, {2}", $object$xi, $object$xj, $object$xz)
//				end for
//			end for
//		end for

		Console::WriteLine(integer::MinValue)
		Console::WriteLine(Const)
		Console::WriteLine(Program::Const2)
		Console::WriteLine(ConstsIntrodIn)
		Console::WriteLine(gettype MyEnum)
		Console::WriteLine($object$#expr(MyEnum::A or MyEnum::B))
		Console::WriteLine(DateTime::get_Now()::ToString())
		Console::WriteLine(new DateTime(1993, 5, 11, 14, 0, 0)::ToString())
		Console::WriteLine(#expr(DateTime::get_Now() - new DateTime(1993, 5, 11, 14, 0, 0))::ToString())
		Console::WriteLine(#expr(11l)::ToString())
		Console::WriteLine(#expr(12l)::ToString())
		Console::WriteLine(#expr(13l)::ToString())
		var arr as IEnumerable<of integer> = Generics::addelem<of integer>(new integer[] {1,2}, 3)

		using ms as MemoryStream = new MemoryStream()
			using sw = new StreamWriter(ms)
				sw::Write("Hello There")
				sw::Flush()
				ms::Seek(0l, SeekOrigin::Begin)
				using sr = new StreamReader(ms)
					Console::WriteLine(sr::ReadToEnd())
				end using
			end using
		end using

		var clko = new object()

		lock clko
			Console::WriteLine("In A Lock")
		end lock

		trylock clko
			Console::WriteLine("In A TryLock")
		end lock

		Console::WriteLine("a" == "a")
		Console::WriteLine("a" === "a")
		Console::WriteLine("a" === $string$'a')

		Console::WriteLine("ab" == "ab")
		Console::WriteLine("ab" === ("a" + "b"))
		Console::WriteLine($object$1 == $object$1)
		Console::WriteLine($object$1 === $object$1)

		new GenType<of object>(null)
		new GenType<of integer, string>()

		Console::WriteLine("a" != null andalso "ab" == "ab" andalso ("a" != null orelse "ab" == "ab"))

		Console::WriteLine("a" is string)
		Console::WriteLine("a" isnot string)

		var xa = new ObjInit[] {new ObjInit()}
		//xa[0]::A = 1

		var sobj as object = "hello"
		var b = true
		Console::WriteLine($string$sobj)

		Console::WriteLine(null ?? "null" ?? c"your CLR thinks \qnull\q is null!!")
		Console::WriteLine("not null" ?? "null")
		Console::WriteLine($integer?$null ?? 4)
		Console::WriteLine($object$#expr(new integer?(2) ?? new integer?(4)))

		//var aw as ConfiguredTaskAwaitable<of string>\ConfiguredTaskAwaiter<of string>
		Console::WriteLine(i"this \qis\q an {{argument}}: {sobj} and this is another: {216:x}. BTW the time is {DateTime::get_Now():t}. Also 30 = {(1 + 2) * 10:x}")

		Console::WriteLine(!b)

		if sobj is null then
			Console::WriteLine(sobj is null)
		elseif sobj isnot null then
			Console::WriteLine(sobj isnot null)
		end if

		Debug::WriteLine("DEBUG is on")
		Trace::WriteLine("TRACE is on")

//		for si = 0 upto 10
//			switch si % 5
//			state
//				Console::WriteLine(0)
//			state
//				Console::WriteLine(1)
//			state
//				Console::WriteLine(2)
//			state
//				Console::WriteLine(3)
//			default
//				Console::WriteLine("default")
//			end switch
//		end for

		var fable = f"This is a formattable date: {DateTime::get_Now(),-22} formatted with a specific culture."
		Console::WriteLine(fable::ToString(new System.Globalization.CultureInfo("en-US")))
		Console::WriteLine(fable::ToString(new System.Globalization.CultureInfo("en-GB")))
		Console::WriteLine(fable::ToString(new System.Globalization.CultureInfo("it-IT")))
		Console::WriteLine(fable::ToString(new System.Globalization.CultureInfo("fr-CA")))
		Console::WriteLine(fable::ToString(new System.Globalization.CultureInfo("en-AU")))

		var discr = 35

		try
			Console::WriteLine("Just testing.")
			throw new Exception()
		catch aex as ArithmeticException
			Console::WriteLine("Caught!")
		catch ex as Exception when discr > 5
			Console::WriteLine(i"Caught 1: {ex::get_Message()}!")
		catch ex2 as Exception when discr < 5 andalso ex2 isnot ArithmeticException
			Console::WriteLine(i"Caught 2: {ex2::get_Message()}!")
		end try

		Console::WriteLine(#nullcond("test")::ToString() ?? "null")
		Console::WriteLine(#nullcond($ObjInit$null)::get_PSN() ?? 11)
		Console::WriteLine(#nullcond(new integer?(1))::ToString() ?? "null")
		Console::WriteLine(#nullcond(new integer?(1))::get_Value() ?? 11)
		Console::WriteLine(#nullcond($integer?$null)::ToString() ?? "null")
		Console::WriteLine(#nullcond($integer?$null)::get_Value() ?? 11)

		X = 69
		var sdtx = ref DateTime::get_Now()
		var xix as integer = RefRet(true)
		Console::WriteLine(xix)
	end method

	[method: My(new integer[] {1, 2})]
	method public static string LeaveMet(var x as integer)
		if x > 0 then
			return "pos"
		else
			try
				return "neg"
			finally
			end try
		end if
	end method

	[method: My(new string[] {"hello", "world", null}), Arr = new single[] {1f, 2f, 3f, 4f}]
	method public static void LeaveMet2(var x as integer)
		if x > 0 then
			return
		else
			try
				return
				x = x
			finally
			end try
		end if
	end method

	method public static string LeaveMet3()
		lock new object()
			return "hello"
		end lock
	end method

	method public static string LeaveMet4()
		using ms = new MemoryStream()
			return "hello"
		end using
	end method

	method public static integer RetMet1()
		return 0
		Console::WriteLine(0)
	end method

	method public static integer RetMet2()
		Console::WriteLine(0)
		return 0
	end method

	method public static integer RetMet3()
		try
			return 0
		finally
		end try
		return -1
	end method

	method public static integer RetMet4()
		try
			return 0
		finally
		end try
	end method

end class

class public abstract AbsClass

	method public abstract void AMet()

	method public virtual void VMet()
		Console::WriteLine("V1")
	end method

end class

class public serializable ConcClass extends AbsClass

	field public notserialized integer MyInt

	method public override void AMet()
		Console::WriteLine("A")
	end method

	method public override void VMet()
		Console::WriteLine("V2")
		mybase::VMet()
	end method

end class

namespace A

	namespace B

		class public D
		end class

	end namespace

	namespace global::C

		class public E
		end class

	end namespace

end namespace

namespace global::A

	class public F
	end class

end namespace