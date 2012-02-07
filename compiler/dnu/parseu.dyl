//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi ParseUtils

field public static string[] stack

method public static void ctor0()
stack = newarr string 0
end method

method private static string[] addelem(var srcarr as string[], var eltoadd as string)

var len as integer = srcarr[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as string[] = newarr string destl

label loop
label cont

place loop

i = i + 1

if len > 0 then

destarr[i] = srcarr[i]

end if

if i = stopel then
goto cont
else
if stopel <> -1 then
goto loop
else
goto cont
end if
end if

place cont

destarr[len] = eltoadd

return destarr

end method

method private static string[] remelem(var srcarr as string[])

var len as integer = srcarr[l]
var destl as integer = len - 1
var stopel as integer = len - 2
var i as integer = -1

var destarr as string[] = newarr string destl

label loop
label cont

place loop

i = i + 1

if len > 0 then

destarr[i] = srcarr[i]

end if

if i = stopel then
goto cont
else
if stopel <> -1 then
goto loop
else
goto cont
end if
end if

place cont

return destarr

end method


method public static string[] StringParser(var StringToParse as string, var DelimeterChar as string)
var arr as string[] = newarr string 0

var ins as boolean = false
var ch as string = ""
var acc as string = ""
var i as integer = -1
var len as integer = StringToParse::get_Length() - 1

label cont
label loop

place loop

i = i + 1

ch = $string$StringToParse::get_Chars(i)

var ic as string = Utils.Constants::quot

var comp as integer = String::Compare(ch, ic)

if comp = 0 then

label fin1

if ins = false then
ins = true
goto fin1
end if
if ins = true then
ins = false
goto fin1
end if

place fin1

end if

comp = String::Compare(ch, DelimeterChar)

if comp = 0 then
if ins = false then

comp = String::Compare(acc, "")

if comp <> 0 then
arr = addelem(arr, acc)
end if
acc = ""
end if
if ins = true then
acc = String::Concat(acc, ch)
end if
else
acc = String::Concat(acc, ch)
end if

comp = String::Compare(acc, "")

if i = len then
if comp <> 0 then
arr = addelem(arr, acc)
end if
acc = ""
end if

if i = len then
goto cont
else
goto loop
end if

place cont

return arr
end method

method public static string[] StringParser2ds(var StringToParse as string, var DelimeterChar as string, var DelimeterChar2 as string)

var arr as string[] = newarr string 0

var ins as boolean = false
var ch as string = ""
var acc as string = ""
var i as integer = -1
var len as integer = StringToParse::get_Length() - 1

label cont
label loop

place loop

i = i + 1

ch = $string$StringToParse::get_Chars(i)

var ic as string = Utils.Constants::quot

var comp as integer = String::Compare(ch, ic)
var comp2 as integer = 0

if comp = 0 then

label fin1

if ins = false then
ins = true
goto fin1
end if
if ins = true then
ins = false
goto fin1
end if

place fin1

end if

var comps as integer = 1

comp = String::Compare(ch, DelimeterChar)
comp2 = String::Compare(ch, DelimeterChar2)

label fin2

if comp = 0 then
comps = 0
goto fin2
end if

if comp2 = 0 then
comps = 0
goto fin2
end if

place fin2

if comps = 0 then
if ins = false then

comp = String::Compare(acc, "")

if comp <> 0 then
arr = addelem(arr, acc)
end if
acc = ""
end if
if ins = true then
acc = String::Concat(acc, ch)
end if
else
acc = String::Concat(acc, ch)
end if

comp = String::Compare(acc, "")

if i = len then
if comp <> 0 then
arr = addelem(arr, acc)
end if
acc = ""
end if

if i = len then
goto cont
else
goto loop
end if

place cont

return arr
end method

method public static boolean LikeOP(var str as string, var pattern as string)

var likefunc as boolean = Regex::IsMatch(str, pattern)

return likefunc

end method

method public static integer RetPrec(var chr as string)
label fin

var comp as integer = 0
var b1 as boolean = true
var b2 as boolean = true
var b3 as boolean = true

comp = String::Compare(chr,"(")
if comp = 0 then
return -1
goto fin
end if

comp = String::Compare(chr,"*")
if comp = 0 then
b1 = true
else
b1 = false
end if

comp = String::Compare(chr,"/")
if comp = 0 then
b2 = true
else
b2 = false
end if

comp = String::Compare(chr,"%")
if comp = 0 then
b3 = true
else
b3 = false
end if

b1 = b1 or b2 or b3
if b1 = true then
return 8
goto fin
end if

comp = String::Compare(chr,"+")
if comp = 0 then
b1 = true
else
b1 = false
end if

comp = String::Compare(chr,"-")
if comp = 0 then
b2 = true
else
b2 = false
end if

b1 = b1 or b2

if b1 = true then
return 6
goto fin
end if

comp = String::Compare(chr,")")
if comp = 0 then
return 0
goto fin
else
return 0
goto fin
end if


place fin
end method

method public static string ProcessMSYSPath(var p as string)

var os as OperatingSystem = Environment::get_OSVersion()
var platf as PlatformID = os::get_Platform()
var winnt as PlatformID = 2
var b as boolean = false
var arr as string[]
var str as string
var num as integer = 0

if platf = winnt then

b = p::Contains("/")

if b = true then

p = p::Replace('/','\')

b = File::Exists(p)

if b = false then

arr = StringParser(p, "\")

str = arr[0]
num = str::get_Length()

if num = 1 then
str = String::Concat(str,":")
arr[0] = str
end if

p = String::Join("\",arr)

end if

end if

end if

return p
end method

end class
