//    dnr.dll dylan.NET.Reflection Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit Loader

field public static boolean FldLitFlag
field public static object FldLitVal
field public static boolean EnumLitFlag
field public static System.Type EnumLitTyp
field public static System.Type FldLitTyp
field public static System.Type MemberTyp
field public static boolean MakeArr
field public static boolean MakeRef

method public static void ctor0()
FldLitFlag = false
FldLitVal = null
EnumLitFlag = false
FldLitTyp = null
MemberTyp = null
MakeArr = false
MakeRef = false
end method

method public static System.Type LoadClass(var name as string) 

var typ as System.Type = null
var i as integer = -1
var len as integer = Importer::Asms[l] - 1
var curasm as Assembly = null
var j as integer = -1
var len2 as integer = Importer::Imps[l] - 1
var curns as string = ""
var tmpstr as string = ""
var nest as boolean = false

label loop
label cont
label fin
label loop2
label cont2

var na as string[] = ParseUtils::StringParser(name,"\")
name = na[0]
if na[l] > 1 then
nest = true
end if

if Importer::Asms[l] = 0 then
goto fin
end if

place loop
i++

curasm = Importer::Asms[i]

typ = curasm::GetType(name)
if typ = null then
else
if nest = true then
typ = typ::GetNestedType(na[1])
end if
goto fin
end if

place loop2
j++

curns = Importer::Imps[j]

tmpstr = String::Concat(curns, ".", name)
typ = curasm::GetType(tmpstr)
if typ = null then
else
if nest = true then
typ = typ::GetNestedType(na[1])
end if
goto fin
end if

if j = len2 then
j = -1
goto cont2
else
goto loop2
end if

place cont2

if i = len then
goto cont
else
goto loop
end if

place cont
place fin

if typ <> null then
if MakeArr = true then
typ = typ::MakeArrayType()
end if
if MakeRef = true then
typ = typ::MakeByRefType()
end if
end if

MakeArr = false
MakeRef = false

return typ

end method

method public static System.Type ProcessType(var typ as System.Type)
if MakeArr = true then
typ = typ::MakeArrayType()
end if
if MakeRef = true then
typ = typ::MakeByRefType()
end if

MakeArr = false
MakeRef = false

return typ
end method

method public static MethodInfo LoadMethod(var typ as System.Type, var name as string, var typs as System.Type[])

var temptyp as System.Type = null
var ints as System.Type[] = null
var i as integer = -1
var len as integer = 0
var mtdinfo as MethodInfo = null

mtdinfo = typ::GetMethod(name,typs)

if mtdinfo = null then
ints = typ::GetInterfaces()
len = ints[l] - 1

label loop
label cont
label fin

place loop

i++

temptyp = ints[i]
mtdinfo = temptyp::GetMethod(name,typs)

if mtdinfo = null then
else
goto fin
end if

if i = len then
goto cont
else
goto loop
end if

place cont
place fin

end if

if mtdinfo <> null then
MemberTyp = mtdinfo::get_ReturnType()
end if

return mtdinfo

end method

method public static MethodInfo[] addelemmtdinfo(var srcarr as MethodInfo[], var eltoadd as MethodInfo)

var len as integer = srcarr[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as MethodInfo[] = newarr MethodInfo destl

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

method public static MethodInfo[] LoadSpecMtds(var typ as System.Type)

var i as integer = -1
var mtdinfo as MethodInfo = null
var mtdinfos as MethodInfo[] = typ::GetMethods()
var mtdinfog as MethodInfo[] = newarr MethodInfo 0
var len as integer = mtdinfos[l] - 1
var b as boolean = false

if mtdinfos[l] > 0 then

label loop
label cont

place loop

i++

mtdinfo = mtdinfos[i]
b = mtdinfo::get_IsSpecialName()
if b = true then
mtdinfog = addelemmtdinfo(mtdinfog, mtdinfo)
end if


if i = len then
goto cont
else
goto loop
end if

place cont

end if


return mtdinfog

end method

method public static boolean CompareParamsToTyps(var t1 as ParameterInfo[],var t2 as System.Type[])

var ans as boolean = true
var b as boolean = false
var p as ParameterInfo
var ta as System.Type
var tb as System.Type

if t1[l] = t2[l] then

var i as integer = -1
var len as integer = t1[l] - 1

label loop
label cont

place loop

i++

p = t1[i]
ta = p::get_ParameterType()
tb = t2[b]
b = ta::Equals(tb)

if b = false then
ans = false
goto cont
end if

if i = len then
goto cont
else
goto loop
end if

place cont

else
ans = false
end if

return ans
end method

method public static MethodInfo LoadBinOp(var typ as System.Type, var name as string, var typa as System.Type, var typb as System.Type)

var typs as System.Type[] = newarr System.Type 2
typs[0] = typa
typs[1] = typb
var i as integer = -1
var mtdinfo as MethodInfo = null
var mtdinfos as MethodInfo[] = LoadSpecMtds(typ)
var len as integer = mtdinfos[l] - 1
var b as boolean = false
var comp as integer = 0
var nstr as string
var ps as ParameterInfo[]

if mtdinfos[l] > 0 then

label loop
label cont

place loop

i++

mtdinfo = mtdinfos[i]
nstr = mtdinfo::get_Name()
comp = String::Compare(nstr, name)

if comp = 0 then

ps = mtdinfo::GetParameters()
b = CompareParamsToTyps(ps, typs)

if b = true then
goto cont
else
mtdinfo = null
end if

else
mtdinfo = null
end if

if i = len then
goto cont
else
goto loop
end if

place cont

end if


return mtdinfo

end method

method public static MethodInfo LoadConvOp(var typ as System.Type, var name as string, var src as System.Type, var snk as System.Type)

var typs as System.Type[] = newarr System.Type 1
typs[0] = src
var i as integer = -1
var mtdinfo as MethodInfo = null
var mtdinfos as MethodInfo[] = LoadSpecMtds(typ)
var len as integer = mtdinfos[l] - 1
var b as boolean = false
var comp as integer = 0
var nstr as string
var ps as ParameterInfo[]
var rett as System.Type

if mtdinfos[l] > 0 then

label loop
label cont

place loop

i++

mtdinfo = mtdinfos[i]
nstr = mtdinfo::get_Name()
comp = String::Compare(nstr, name)

if comp = 0 then

ps = mtdinfo::GetParameters()
b = CompareParamsToTyps(ps, typs)

if b = true then

rett = mtdinfo::get_ReturnType()
b = rett::Equals(snk)

if b = true then
goto cont
else
mtdinfo = null
end if

else
mtdinfo = null
end if

else
mtdinfo = null
end if

if i = len then
goto cont
else
goto loop
end if

place cont

end if


return mtdinfo

end method



method public static FieldInfo LoadField(var typ as System.Type, var name as string)

var temptyp as System.Type = null
var fldinfo as FieldInfo = null

fldinfo = typ::GetField(name)

if fldinfo <> null then
MemberTyp = fldinfo::get_FieldType()
FldLitFlag = fldinfo::get_IsLiteral()
EnumLitFlag = typ::get_IsEnum()
var nullref as object = null
if FldLitFlag = true then
FldLitVal = fldinfo::GetValue(nullref)
var obj as object = FldLitVal
FldLitTyp = obj::GetType()
end if
if EnumLitFlag = true then
EnumLitTyp = System.Enum::GetUnderlyingType(typ)
end if
end if

return fldinfo

end method

end class
