//    dnu.dll dylan.NET.Utils Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static XmlUtils
	
	[method: ComVisible(false)]
	method public static XName MakeName(var name as string)
		return XName::Get(name, string::Empty)
	end method
	
	[method: ComVisible(false)]
	method public static XElement MakeNode(var name as string)
		return new XElement(XName::Get(name, string::Empty))
	end method
	
	[method: ComVisible(false)]
	method public static XAttribute MakeAttr(var name as string, var value as string)
		return new XAttribute(XName::Get(name, string::Empty), value)
	end method

	[method: ComVisible(false)]
	method public static XContainer AddAttr(var el as XContainer, var attr as XAttribute)
		el::Add(attr)
		return el
	end method

	[method: ComVisible(false)]
	method public static XContainer AddAttrArr(var el as XContainer, var attrs as XAttribute[])
		var i as integer = -1
		do
			i = i + 1
			el::Add(attrs[i])
		until i = (attrs[l] - 1)
		return el
	end method

	[method: ComVisible(false)]
	method public static XContainer AddNode(var el as XContainer, var node as XElement)
		el::Add(node)
		return el
	end method

	[method: ComVisible(false)]
	method public static XContainer AddNodeArr(var el as XContainer, var nodes as XElement[])
		var i as integer = -1
		do
			i = i + 1
			el::Add(nodes[i])
		until i = (nodes[l] - 1)
		return el
	end method

	[method: ComVisible(false)]
	method public static XElement SetVal(var el as XElement, var value as string)
		el::set_Value(value)
		return el
	end method

	[method: ComVisible(false)]
	method public static string GetVal(var el as XElement)
		return el::get_Value()
	end method

	[method: ComVisible(false)]
	method public static XElement XPathSelectEl(var el as XNode, var XPathQuery as string)
		return XPath.Extensions::XPathSelectElement(el, XPathQuery)
	end method

	[method: ComVisible(false)]
	method public static IEnumerable<of XElement> XPathSelectEls(var el as XNode, var XPathQuery as string)
		return XPath.Extensions::XPathSelectElements(el, XPathQuery)
	end method

end class
