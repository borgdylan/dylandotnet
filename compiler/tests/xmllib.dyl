#refasm "/usr/lib/mono/2.0/mscorlib.dll"
#refasm "/usr/lib/mono/gac/System.Xml.Linq/3.5.0.0__b77a5c561934e089/System.Xml.Linq.dll"

//XML Library of functions

import System
import System.Xml.Linq

#debug on

assembly xmllibrary exe
ver 1.2.0.0

class public auto ansi Mod1

	method public static XElement makenode(var name as string)
		return new XElement(XName::Get(name, ""))
	end method

	method public static XAttribute makeattr(var name as string, var value as string)
		return new System.Xml.Linq.XAttribute(XName::Get(name, ""), $object$value)
	end method

	method public static XElement addattr(var el as XElement, var attr as XAttribute)
		el::Add($object$attr)
		return el
	end method

	method public static XElement addnode(var el as XElement, var node as XElement)
		el::Add($object$node)
		return el
	end method

	method public static XElement setval(var el as XElement, var value as string)
		el::set_Value(value)
		return el
	end method

	method public static void main()
		var root as XElement = makenode("Names")
		var n1 as XElement = makenode("Name")

		var attr as XAttribute = makeattr("id", "1")
		var n1v1 as XElement = makenode("Name")
		n1v1 = addattr(n1v1, attr)
		n1v1 = setval(n1v1, "Dylan")

		var n1v2 as XElement = makenode("Surname")
		n1v2 = addattr(n1v2, attr)
		n1v2 = setval(n1v2, "Borg")

		n1 = addnode(n1, n1v1)
		n1 = addnode(n1, n1v2)
		root = addnode(root, n1)

		var counter as XElement = makenode("Counter")
		var count as XElement = makenode("Count")
		count = setval(count, "1")
		counter = addnode(counter, count)
		root = addnode(root, counter) 

		var rootstr as string = root::ToString()
		Console::WriteLine(rootstr)
		Console::ReadKey()
	end method

end class
