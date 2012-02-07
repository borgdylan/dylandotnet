//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit ConsolePrinter

field public static StringWriter SW

method public static void ctor0()
SW = null
end method

method public static void PrintString()
var str as string = SW::ToString()
Console::WriteLine(str)
end method

method public static void WriteClass(var typ as System.Type)

SW = new StringWriter()

var isAbstract as boolean = typ::get_IsAbstract()
var isAnsi as boolean = typ::get_IsAnsiClass()
var isAutoChar as boolean = typ::get_IsAutoClass()
var isAuto as boolean = typ::get_IsAutoLayout()
var isEnum as boolean = typ::get_IsEnum()
var isInterface as boolean = typ::get_IsInterface()
var isNestedPrivate as boolean = typ::get_IsNestedPrivate()
var isNestedPublic as boolean = typ::get_IsNestedPublic()
var isPrivate as boolean = typ::get_IsNotPublic()
var isPublic as boolean = typ::get_IsPublic()
var name as string = typ::get_Name()
var bt as System.Type = typ::get_BaseType()
var btstr as string = bt::ToString()

if isEnum = true then
SW::Write("enum ")
else
SW::Write("class ")
end if

if isPublic = true then
SW::Write("public ")
end if

if isPrivate = true then
SW::Write("private ")
end if

if isNestedPublic = true then
SW::Write("public ")
end if

if isNestedPrivate = true then
SW::Write("private ")
end if


if isAbstract = true then
SW::Write("abstract ")
end if

if isAuto = true then
SW::Write("auto ")
end if


if isAutoChar = true then
SW::Write("autochar ")
end if

if isAnsi = true then
SW::Write("ansi ")
end if

if isAutoChar = true then
SW::Write("autochar ")
end if

if isInterface = true then
SW::Write("interface ")
end if

SW::Write(name)
SW::Write(" extends ")
SW::Write(btstr)

end method

end class
