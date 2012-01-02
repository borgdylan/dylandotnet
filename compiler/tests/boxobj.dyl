#refasm "/usr/lib/mono/2.0/mscorlib.dll"
#refasm "/usr/lib/mono/gac/System.Xml.Linq/3.5.0.0__b77a5c561934e089/System.Xml.Linq.dll"


import System

#debug on

assembly boxobj exe
ver 1.3.0.0

class public auto ansi Module1

	method public static void main()

		var obj1 as object = $object$123
		var num as integer = $integer$obj1
		Console::WriteLine($string$num)

		var obj2 as object = $object$"12"
		var obj2s as string = obj2
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
