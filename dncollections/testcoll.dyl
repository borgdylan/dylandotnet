#refstdasm "mscorlib.dll"
#refasm "dncollections.dll"

import System
import dylan.NET.Collections

#debug on

assembly testcoll exe
ver 1.1.0.0

class public auto ansi Program

	method public static void main()
		var coll as ALList = new ALList()
		var i as integer = 0
		
		do until i = 12
			i = i + 1
			coll = coll + $object$i	
		end do
		
		coll::Remove(5)
		coll::Remove(0)
		coll::Remove(coll::Length - 1)
		
		Console::WriteLine(coll::ToString())
		
	end method

end class
