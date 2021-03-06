//    dnu.dll dylan.NET.Utils Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public static XmlUtils
	
	[method: ComVisible(false)]
	method public static XName MakeName(var name as string) => XName::Get(name, string::Empty)
	
	[method: ComVisible(false)]
	method public static XElement MakeNode(var name as string) => new XElement(XName::Get(name, string::Empty))
	
	[method: ComVisible(false)]
	method public static XAttribute MakeAttr(var name as string, var value as string) => new XAttribute(XName::Get(name, string::Empty), value)

	[method: ComVisible(false)]
	method public static XContainer AddAttr(var el as XContainer, var attr as XAttribute)
		el::Add(attr)
		return el
	end method

	[method: ComVisible(false)]
	method public static XContainer AddAttrArr(var el as XContainer, var attrs as XAttribute[])
		var i as integer = -1
		do
			i++
			el::Add(attrs[i])
		until i = --attrs[l]
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
			i++
			el::Add(nodes[i])
		until i = --nodes[l]
		return el
	end method

	[method: ComVisible(false)]
	method public static XElement SetVal(var el as XElement, var value as string)
		el::set_Value(value)
		return el
	end method

	[method: ComVisible(false)]
	method public static string GetVal(var el as XElement) => el::get_Value()

	[method: ComVisible(false)]
	method public static XElement XPathSelectEl(var el as XNode, var XPathQuery as string) => XPath.Extensions::XPathSelectElement(el, XPathQuery)

	[method: ComVisible(false)]
	method public static IEnumerable<of XElement> XPathSelectEls(var el as XNode, var XPathQuery as string) => XPath.Extensions::XPathSelectElements(el, XPathQuery)

end class