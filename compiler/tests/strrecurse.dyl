#refstdasm "mscorlib.dll"

import System

#debug on

assembly strrecurse exe
ver 1.2.0.0

class public auto ansi Program

	method public static string palindrome(var s as string)
		if s::get_Length() == 1 then
			return s
		else
			return palindrome(s::Substring(1)) + $string$s::get_Chars(0)
		end if
	end method
	
	method public static void main()
		Console::WriteLine(palindrome("Hello"))
	end method

end class
