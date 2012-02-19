#refstdasm "mscorlib.dll"

import System
import arraytest

assembly arraytest exe
ver 2.2.0.0

//this is a test of array functionalty within dylan.NET by using arrays
//adapted from the old arraytest code

class public auto ansi instc

	field public string[] arr

	method public void instc()
		me::ctor()
		arr = new string[2]
		var latearr as string[] = new string[2]
		latearr[0] = "I"
		latearr[1] = "C"
		
		arr = latearr

	end method

	method public void test(var paramarr as string[])
	
		var i as integer = -1
	
		label loop
		label cont
	
		place loop
	
		i = i + 1
	
		Console::WriteLine(paramarr[i])
	
		if i = (paramarr[l] - 1) then
			goto cont
		else
			goto loop
		end if
	
		place cont
	
	end method

end class

class public auto ansi statc

	field public static string[] arr
	
	method public static void statc()
		arr = new string[2]
		var latearr as string[] = new string[2]
		latearr[0] = "S"
		latearr[1] = "C"
	
		arr = latearr

	end method
	
	method public static void test(var paramarr as string[])

		var i as integer = -1
		
		label loop
		label cont
		
		place loop
		
		i = i + 1
		
		Console::WriteLine(paramarr[i])
		
		if i = (paramarr[l] - 1) then
			goto cont
		else
			goto loop
		end if
		
		place cont
		
	end method

end class

class public auto ansi beforefieldinit Module1

	field public static string[] fldarr

	method public static void Module1()
		fldarr = newarr string 2
	end method

	method public static string[] addelem(var srcarr as string[], var eltoadd as string)

		var len as integer = srcarr[l]
		var destl as integer = len + 1
		var stopel as integer = len - 1
		var i as integer = -1
	
		var destarr as string[] = new string[destl]

		label loop
		label cont
		
		place loop
		
		i = i + 1
	
		destarr[i] = srcarr[i]
	
		if i = stopel then
			goto cont
		else
			goto loop
		end if

		place cont
		
		destarr[len] = eltoadd

		return destarr

	end method


	method public static void test(var paramarr as string[])

		var i as integer = -1
		
		label loop
		label cont
		
		place loop
		
		i = i + 1

		Console::WriteLine(paramarr[i])
		
		if i = (paramarr[l] - 1) then
			goto cont
		else
			goto loop
		end if
		
		place cont

	end method

	method public static void main()

		var numarr as integer[] = new integer[3]
		numarr[0] = 1
		numarr[1] = 2
		numarr[2] = 3

		var numarr2 as double[] = new double[3]
		numarr2[0] = 10.0
		numarr2[1] = 20.0
		numarr2[2] = 30.0
		
		var strarr as string[] = new string[3]
		strarr[0] = "a"
		strarr[1] = "b"
		strarr[2] = "c"
	
		Console::WriteLine($double$numarr[0] + numarr2[0]) 
		Console::WriteLine($double$numarr[1] + numarr2[1]) 
		Console::WriteLine($double$numarr[2] + numarr2[2]) 

		Console::WriteLine(String::Concat(strarr))

		var arrofstr as string[] = new string[3]
		arrofstr[0] = "This"
		arrofstr[1] = "is"
		arrofstr[2] = "dylan.NET"
		
		Console::WriteLine(arrofstr[l])
		test(arrofstr)

		arrofstr = addelem(arrofstr, "on .NET/Mono")
		Console::WriteLine(arrofstr[l])
		test(arrofstr)

		var latearr as string[] = new string[2]
		Console::WriteLine($string$latearr[l])
		latearr[0] = "dylan"
		latearr[1] = ".NET"

		fldarr = latearr
		Console::WriteLine(fldarr[0])
		Console::WriteLine(fldarr[1])
		Console::WriteLine(fldarr[l])
		test(fldarr)

		fldarr[0] = "Mono"
		fldarr[1] = "2.10.x"
		Console::WriteLine(fldarr[0])
		Console::WriteLine(fldarr[1])
		Console::WriteLine(fldarr[l])
		test(fldarr)
		
		var instv as instc = new instc()
		Console::WriteLine(instv::arr[0])
		Console::WriteLine(instv::arr[1])
		Console::WriteLine(instv::arr[l])
		test(instv::arr)
		instv::test(instv::arr)
		
		instv::arr[0] = "Instance"
		instv::arr[1] = "Arrays"
		Console::WriteLine(instv::arr[0])
		Console::WriteLine(instv::arr[1])
		Console::WriteLine(instv::arr[l])
		test(instv::arr)
		instv::test(instv::arr)
		
		Console::WriteLine(statc::arr[0])
		Console::WriteLine(statc::arr[1])
		Console::WriteLine(statc::arr[l])
		test(statc::arr)
		statc::test(statc::arr)
	
		statc::arr[0] = "Static"
		statc::arr[1] = "Arrays"
		Console::WriteLine(statc::arr[0])
		Console::WriteLine(statc::arr[1])
		Console::WriteLine(statc::arr[l])
		test(statc::arr)
		statc::test(statc::arr)
	
		Console::ReadKey()

	end method

end class
