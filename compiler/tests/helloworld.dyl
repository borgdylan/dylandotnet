#refstdasm "mscorlib.dll"

import System

#debug on

assembly helloworld exe
ver 1.2.0.1

class public Module1

	method public static void main()

		Console::WriteLine("Hello World")
		var a as integer = 2
		var b as integer = 3
		var ans as integer = a + b
		Console::WriteLine(ans)

	end method

end class
