//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi XmlUtils

method public static XName MakeName(var name as string)

var n as XName = XName::Get(name, "")
return n

end method

method public static XElement MakeNode(var name as string)

var n as XName = XName::Get(name, "")
var el as XElement = new XElement(n)
return el

end method

method public static XAttribute MakeAttr(var name as string, var value as string)

var n as XName = XName::Get(name, "")
var obj as Object = $object$value
var attr as XAttribute = new XAttribute(n, obj)
return attr

end method

method public static XElement AddAttr(var el as XElement, var attr as XAttribute)

var attrobj as Object = $object$attr
el::Add(attrobj)
return el

end method

method public static XElement AddAttrArr(var el as XElement, var attrs as XAttribute[])

var attrobj as Object
var len as integer = attrs[l] -1
var i as integer = -1

label loop
label cont

place loop

i++

attrobj = $object$attrs[i]
el::Add(attrobj)

if i = len then
goto cont
else
goto loop
end if

place cont

return el

end method

method public static XElement AddNode(var el as XElement, var node as XElement)

var nodeobj as Object = $object$node
el::Add(nodeobj)
return el

end method

method public static XElement AddNodeArr(var el as XElement, var nodes as XElement[])

var nodeobj as Object
var len as integer = nodes[l] -1
var i as integer = -1

label loop
label cont

place loop

i++

nodeobj = $object$nodes[i]
el::Add(nodeobj)

if i = len then
goto cont
else
goto loop
end if

place cont

return el

end method


method public static XElement SetVal(var el as XElement, var value as string)

el::set_Value(value)
return el

end method

method public static string GetVal(var el as XElement)

return el::get_Value()

end method

method public static XElement XPathSelectEl(var el as XElement, var XPathQuery as string)

var tempel as XElement
tempel = XPath.Extensions::XPathSelectElement(el, XPathQuery)

return tempel

end method

end class
