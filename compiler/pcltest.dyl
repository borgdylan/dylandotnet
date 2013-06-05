#refasm "./pcl/System.Runtime.dll"

import System

assembly pcltest dll
ver 1.1.0.0

class public auto ansi static TestClass extends Object

	method public static void Test()
		var x = String::Empty
	end method

end class
