#refstdasm "mscorlib.dll"

import System

#debug on

assembly boxobj exe
ver 1.3.0.1

class public Module1

	method public static void main()

		var obj1 as object = $object$123
		var num as integer = $integer$obj1
		Console::WriteLine($string$num)

		var obj2 as object = "12"
		var obj2s as string = $string$obj2
		var num3 as integer = $integer$obj2s
		Console::WriteLine($string$num3)

		var numobj as integer = 120
		var obj3 as object = $object$numobj
		Console::WriteLine($integer$obj3)
		Console::WriteLine(obj3)
	
		Console::WriteLine(Environment::get_StackTrace())
		Console::ReadKey()

	end method

end class
