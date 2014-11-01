#refstdasm "mscorlib.dll"

import System

#debug on

assembly numloops exe
ver 1.1.0.0

class public Module1

	method public static void main()
		var dnum1 as double = 23.4
		Console::WriteLine($string$dnum1)
		var dnum2 as double = 24.67d
		Console::WriteLine($string$dnum2)
		var fnum1 as single = 28.123f
		Console::WriteLine($string$fnum1)
		var bnum as sbyte = 23b
		Console::WriteLine($string$bnum)
		var snum as short = 456s
		Console::WriteLine($string$snum)
		var inum1 as integer = 289387
		Console::WriteLine($string$inum1)
		var inum2 as integer = 748589i
		Console::WriteLine($string$inum2)
		var lnum as long = 3894958840l
		Console::WriteLine($string$lnum)
		var dnum3 as double = 237389d
		Console::WriteLine($string$dnum3)
		var fnum2 as single = 324f
		Console::WriteLine($string$fnum2)
		var mdnum1 as double = -23.4
		Console::WriteLine($string$mdnum1)
		var mdnum2 as double = -24.67d
		Console::WriteLine($string$mdnum2)
		var mfnum1 as single = -28.123f
		Console::WriteLine($string$mfnum1)
		var mbnum as sbyte = -23b
		Console::WriteLine($string$mbnum)
		var msnum as short = -456s
		Console::WriteLine($string$msnum)
		var minum1 as integer = -289387
		Console::WriteLine($string$minum1)
		var minum2 as integer = -748589i
		Console::WriteLine($string$minum2)
		var mlnum as long = -3894958840l
		Console::WriteLine($string$mlnum)
		var mdnum3 as double = -237389d
		Console::WriteLine($string$mdnum3)
		var mfnum2 as single = -324f
		Console::WriteLine($string$mfnum2)
		Console::ReadKey()
	end method

end class
