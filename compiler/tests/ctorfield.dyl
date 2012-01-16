#refstdasm "mscorlib.dll"

//Field and Constructor test
import System
import ctorfield

#debug on

assembly ctorfield exe
ver 1.2.0.0

class public auto ansi Test

	field public string teststr
	field public integer testnum1
	field public double testnum2

	method public void Test(var prompt as string)
		me::ctor()
		Console::WriteLine(prompt)
		teststr = ""
		testnum1 = 1
		testnum2 = 1.0
	end method

	method public void Test()
		var tinst as Test = new Test("Hello from Test's Constructor")
	end method
	
end class

class public auto ansi beforefieldinit Module1

	field public static string str

	method public static void ctor0()
		str = ""
		Console::WriteLine("The constructor for Module1 has been executed")
	end method

	method public static void main()
		Console::WriteLine("Calling the default Constructor")
		var a as Test = new Test()
		Console::WriteLine("Calling the Constructor with a Parameter")
		var b as Test = new Test("This param was passed to the Constructor")

		Console::Write("The value of b::teststr before reset is ")
		Console::WriteLine(b::teststr)

		Console::Write("The value of b::testnum1 before reset is ")
		Console::WriteLine(b::testnum1)

		Console::Write("The value of b::testnum2 before reset is ")
		Console::WriteLine(b::testnum2)


		b::teststr = "Hello World"
		b::testnum1 = 11
		b::testnum2 = 11.0

		Console::Write("The value of b::teststr now is ")
		Console::WriteLine(b::teststr)

		Console::Write("The value of b::testnum1 now is ")
		Console::WriteLine(b::testnum1)

		Console::Write("The value of b::testnum2 now is ")
		Console::WriteLine(b::testnum2)

		Console::Write("The value of str before reset is ")
		Console::WriteLine(str)

		str = "I use dylan.NET"

		Console::Write("The value of str now is ")
		Console::WriteLine(str)

		Console::ReadKey()

	end method

end class
