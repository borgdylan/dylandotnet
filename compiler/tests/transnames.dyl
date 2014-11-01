//transformations of names.txt
//by the use of LINQ
//compile with dylan.NET 11.2.9.8

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refstdasm "System.Core.dll"
#refstdasm "System.Xml.Linq.dll"

import System
import System.IO
import System.Linq
import System.Xml.Linq
import System.Collections.Generic

#debug on

assembly transnames exe
ver 2.1.0.0

class public Program

	method public static string[] LineToTuple(var l as string)
		var lar as string[] = l::Split(new char[] {','})
		var lar2 as string[] = new string[] {lar[2], lar[1], lar[0]}
		return lar2
	end method
	
	method public static string TupleToLine(var t as string[])
		return t[0] + "," + t[1] + "," + t[2]
	end method
	
	method public static XElement TupleToXML(var t as string[])
		var rt as XElement = new XElement($XName$"Person")
		rt::Add(new XAttribute($XName$"id",t[0]))
		var n as XElement = new XElement($XName$"Name")
		n::set_Value(t[1])
		var s as XElement = new XElement($XName$"Surname")
		s::set_Value(t[2])
		rt::Add(n)
		rt::Add(s)
		return rt
	end method
	
	method public static string GetTupleKey(var t as string[])
		return t[2]
	end method
	
	method public static string GetTupleKey2(var t as string[])
		return t[1]
	end method
	
	method public static void PrintLines(var lines as IEnumerable<of string>)
		foreach line in lines
			Console::WriteLine(line)
		end for
	end method

	method public static void main()
		var lot as IEnumerable<of string[]> = Enumerable::Select<of string, string[]>(File::ReadAllLines("names.txt"), new Func<of string, string[]>(LineToTuple()))
		var lol as IEnumerable<of string> = Enumerable::Select<of string[], string>(lot, new Func<of string[], string>(TupleToLine()))
		File::WriteAllLines("pass1.txt", Enumerable::ToArray<of string>(lol))
		var slot as IOrderedEnumerable<of string[]> = Enumerable::OrderBy<of string[], string>(lot, new Func<of string[], string>(GetTupleKey()))
		var slot2 as IEnumerable<of string[]> = Enumerable::ThenBy<of string[], string>(slot, new Func<of string[], string>(GetTupleKey2()))
		var slol as IEnumerable<of string> = Enumerable::Select<of string[], string >(slot2, new Func<of string[], string >(TupleToLine()))
		PrintLines(slol)
		File::WriteAllLines("pass2.txt", Enumerable::ToArray<of string>(slol))
		var lox as IEnumerable<of XElement> = Enumerable::Select<of string[], XElement >(slot2, new Func<of string[], XElement >(TupleToXML()))
		var rt as XElement = new XElement($XName$"Persons")
		rt::Add(lox)
		File::WriteAllText("pass3.xml",rt::ToString())
	end method

end class
