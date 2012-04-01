#refstdasm "mscorlib.dll"
#refasm "dnc.exe"
#refasm "dnr.dll"
#refasm "tests/protectedtests.exe"

import System
import System.Reflection
import dylan.NET.Reflection
import dylan.NET.Compiler
import protectedtests

#debug on

assembly test exe
ver 1.1.0.0

class public auto ansi Program

	method public static void main()
		Environment::set_CurrentDirectory("/var/www/Code/dylannet/compiler/tests")
		var arr as string[] = new string[1]
		arr[0] = "protectedtests.dyl"
		Module1::main(arr)
		//Loader::ProtectedFlag = true
		//var mi as MethodInfo = Loader::LoadMethod(gettype ProtectedTest, "ProtMtd", Type::EmptyTypes)
	end method

end class
