#refstdasm "mscorlib.dll"

import System

#debug on

assembly conv exe
ver 1.2.0.0

class public static Module1

	field public static integer numfld

	method private static void Module1()
		numfld = 1
	end method

	method public static void mettest()

		var v1 as string = $string$#expr($integer$#expr($double$1))
		var v2 as integer = $integer$#expr($integer$#expr($double$1))
		var v3 as double = $double$#expr($integer$#expr($double$1))
		var v4 as boolean = $boolean$#expr($integer$#expr($double$1))
		var v5 as char = $char$#expr($integer$#expr($double$1))
		var v6 as decimal = $decimal$#expr($integer$#expr($double$1))
		var v7 as long = $long$#expr($integer$#expr($double$1))
		var v8 as sbyte = $sbyte$#expr($integer$#expr($double$1))
		var v9 as short = $short$#expr($integer$#expr($double$1))
		var v10 as single = $single$#expr($integer$#expr($double$1))

	end method

	method public static void strtest()

		var str as string = "1"
		var v1 as string = $string$"1"
		var v2 as integer = $integer$"1"
		var v3 as double = $double$"1"
		var v4 as boolean = $boolean$"True"
		var v5 as char = $char$"1"
		var v6 as decimal = $decimal$"1"
		var v7 as long = $long$"1"
		var v8 as sbyte = $sbyte$"1"
		var v9 as short = $short$"1"
		var v10 as single = $single$"1"

	end method

	method public static void vartest()

		var num as integer = 1
		var v1 as string = $string$num
		var v2 as integer = $integer$num
		var v3 as double = $double$num
		var v4 as boolean = $boolean$num
		var v5 as char = $char$num
		var v6 as decimal = $decimal$num
		var v7 as long = $long$num
		var v8 as sbyte = $sbyte$num
		var v9 as short = $short$num
		var v10 as single = $single$num

	end method

	method public static void fldtest()

		var v1 as string = $string$numfld
		var v2 as integer = $integer$numfld
		var v3 as double = $double$numfld
		var v4 as boolean = $boolean$numfld
		var v5 as char = $char$numfld
		var v6 as decimal = $decimal$numfld
		var v7 as long = $long$numfld
		var v8 as sbyte = $sbyte$numfld
		var v9 as short = $short$numfld
		var v10 as single = $single$numfld

	end method

	method public static void main()

		var v1 as string = $string$100
		Console::WriteLine($string$v1)

		var v2 as integer = $integer$100
		Console::WriteLine($string$v2)

		var v3 as double = $double$100
		Console::WriteLine($string$v3)

		var v4 as boolean = $boolean$1
		Console::WriteLine($string$v4)

		var v5 as char = $char$45
		Console::WriteLine($string$v5)

		var v6 as decimal = $decimal$100
		Console::WriteLine($string$v6)

		var v7 as long = $long$100
		Console::WriteLine($string$v7)

		var v8 as sbyte = $sbyte$100

		var v9 as short = $short$100

		var v10 as single = $single$100
		Console::WriteLine($string$v10)

		mettest()
		strtest()
		vartest()
		fldtest()

		Console::ReadKey()

	end method

end class
