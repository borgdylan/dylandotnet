#refstdasm "mscorlib.dll"

import System

#debug on

assembly dylrecurse exe
ver 1.1.0.0

class public auto ansi Program

	method public static integer recurse(var n as integer, var lim as integer)
		Console::WriteLine("n = " + $string$n)
		if n < lim then
			n = n + 1
			n = recurse(n, lim)
		end if
		return n
	end method
	
	method public static void main()
		Console::WriteLine("returned value = " + $string$recurse(4,20))
	end method

end class
