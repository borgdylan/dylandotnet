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

	method public static void main()
		var a as string = "z"
		var b as boolean = "a" like "^(.)*$"
		b = new Decimal(4) == new Decimal(78)
		b = (100ui > 67ui) or (100ui >= 67ui) or (100ui < 67ui) or (100ui <= 67ui)
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
		//var dv as decimal = 7m
	end method

end class