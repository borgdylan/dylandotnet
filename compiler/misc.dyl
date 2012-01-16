#refasm "/usr/lib/mono/4.0/mscorlib.dll"

import System
import System.Runtime.InteropServices

assembly misc exe
ver 1.1.0.0

class public auto ansi Module1

	method public static void main()
		Console::WriteLine(RuntimeEnvironment::GetRuntimeDirectory())
	end method

end class
