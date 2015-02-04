#refstdasm "mscorlib.dll"

import System

#debug on

//declaring the assembly Person.dll
assembly Person dll
ver 1.2.0.0

//beginning the Person Class
class public Person

	//the field declarations
	field private string name
	field private string address
	field private integer age
	
	//the constructor
	method public void Person(var fullname as string, var fulladdress as string, var age as integer)
		mybase::ctor()
		name = fullname
		address = fulladdress
		me::age = age
	end method
	
	method public string getName()
		return name
	end method
	
	method public string getAddress()
		return address
	end method
	
	method public integer getAge()
		//age = 20
		return age
	end method

	//$string$age means convert age to string, age is not changed
	method public void print()
		var str as string = name + " " +  address + " " + $string$age
		Console::WriteLine(str)
	end method

end class
