#refstdasm "mscorlib.dll"

import System
import template

#debug on

assembly template exe
ver 1.1.0.0

delegate public auto ansi void MyDelegate(var x as integer)

class public auto ansi beforefieldinit sealed SC
end class

class public auto ansi Program

	field public static integer X

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
		exthrow()
		var a as string = "z"
		var b as boolean = "a" like "^(.)*$"
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
	end method

end class