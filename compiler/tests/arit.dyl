#refstdasm "mscorlib.dll"

import System

#debug on

assembly arit exe
ver 1.3.0.0

class public Module1

	method public static double add(var n1 as double, var n2 as double)
		return n1 + n2
	end method

	method public static double subtract(var n1 as double, var n2 as double)
		return n1 - n2
	end method

	method public static double multiply(var n1 as double, var n2 as double)
		return n1 * n2
	end method

	method public static double divide(var n1 as double, var n2 as double)
		return n1 / n2
	end method

	method public static void main()

		Console::WriteLine("Enter num1")
		var num1 as double = $double$Console::ReadLine()

		Console::WriteLine("Enter num2")
		var num2 as double = $double$Console::ReadLine()

		Console::WriteLine($string$add(num1, num2))
		Console::WriteLine($string$subtract(num1, num2))
		Console::WriteLine($string$multiply(num1, num2))
		Console::WriteLine($string$divide(num1, num2))

		Console::ReadKey()
	end method

end class
