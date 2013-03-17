#refstdasm "mscorlib.dll"
#refstdasm "System.Xml.Linq.dll"

//XML Library of functions
//compile with dylan.NET v.11.3.1.2

import System
import System.Xml.Linq

#debug on

assembly xmllib exe
ver 1.2.0.0

class public auto ansi Mod1

	method public static XElement makenode(var name as string)
		return new XElement($XName$name)
	end method

	method public static XAttribute makeattr(var name as string, var value as string)
		return new XAttribute($XName$name, value)
	end method

	method public static XElement addattr(var el as XElement, var attr as XAttribute)
		el::Add(attr)
		return el
	end method

	method public static XElement addnode(var el as XElement, var node as XElement)
		el::Add(node)
		return el
	end method

	method public static XElement setval(var el as XElement, var value as string)
		el::set_Value(value)
		return el
	end method

	method public static void main()
		var root as XElement = new XElement($XName$"Names", new object[] { _
			new XElement($XName$"Name", new object[] { _
				new XElement($XName$"Name", new object[] {"Dylan", _
					new XAttribute($XName$"id", "1") _
				}) , _
				new XElement($XName$"Surname", new object[] {"Borg", _
					new XAttribute($XName$"id", "1") _
				}) _
			}) , _
			new XElement($XName$"Counter", _
				new XElement($XName$"Count", "1") _
			) _ 
		})

		Console::WriteLine(root::ToString())
		Console::ReadKey()
	end method

end class
