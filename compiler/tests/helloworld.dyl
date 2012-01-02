#refasm "/usr/lib/mono/2.0/mscorlib.dll"
#refasm "/usr/lib/mono/gac/System.Xml.Linq/3.5.0.0__b77a5c561934e089/System.Xml.Linq.dll"


import System

#debug on

assembly helloworld exe
ver 1.2.0.0

class public auto ansi Module1

	method public static void main()

		Console::WriteLine("Hello World")
		var a as integer = 2
		var b as integer = 3
		var ans as integer = a + b
		Console::WriteLine(ans)

	end method

end class
