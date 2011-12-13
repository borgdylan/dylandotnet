#refasm "/usr/lib/mono/2.0/mscorlib.dll"
#refasm "mathematics.dll"

import System
import mathematics

#debug on

assembly mathstest exe
ver 1.2.0.0

class public auto ansi Module1

	method public static void main()

		var alg as Algebra = new Algebra()
		var arit as Arithmetic = new Arithmetic()

		var str as string = ""
		var num as double

		Console::WriteLine("enter Num1")
		var Num1 as double = $double$Console::ReadLine()

		Console::WriteLine("enter Num2")
		var Num2 as double = $double$Console::ReadLine()

		Console::WriteLine("The program will now compute +,-,* and / on the numbers entered")

		Console::WriteLine("+")
		Console::WriteLine($string$arit::Add(Num1, Num2))

		Console::WriteLine("-")
		Console::WriteLine($string$arit::Subtract(Num1, Num2))
	
		Console::WriteLine("*")
		Console::WriteLine($string$arit::Multiply(Num1, Num2))
	
		Console::WriteLine("/")
		Console::WriteLine($string$arit::Divide(Num1, Num2))
	
		Console::ReadKey()

	end method

end class
