#refstdasm "mscorlib.dll"
#refasm "Person.dll"

import System
import Person

#debug on

//declaring the assembly PersonProg.exe
assembly PersonProg exe
ver 1.3.0.0

class public PersonInst

	method public static void main()

		var p as Person = new Person("Dylan Borg", "Address Here", 18)
		var name as string = p::getName()
		var address as string = p::getAddress()
		var age as integer = p::getAge()

		Console::WriteLine("Name: "+ name)
		Console::WriteLine("Address: " + address)
		Console::WriteLine("Age: " + $string$age)

		Console::ReadKey()

	end method

end class
