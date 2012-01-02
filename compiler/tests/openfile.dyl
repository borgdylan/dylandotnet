#refasm "/usr/lib/mono/2.0/mscorlib.dll"
#refasm "/usr/lib/mono/gac/System.Xml.Linq/3.5.0.0__b77a5c561934e089/System.Xml.Linq.dll"


import System
import System.IO

#debug on

assembly openfile exe
ver 1.2.0.0

class public auto ansi module1

	method public static void main()
	
		var str as string = File::ReadAllText("testfile.txt")
		Console::Write(str)
		Console::ReadKey()
	
	end method

end class
