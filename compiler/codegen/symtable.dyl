//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit SymTable

field public static VarItem[] VarLst
field public static FieldItem[] FldLst
field public static FieldItem[] NestedFldLst
field public static MethodItem[] MetLst
field public static MethodItem[] NestedMetLst
field public static CtorItem[] CtorLst
field public static CtorItem[] NestedCtorLst
field public static IfItem[] IfLst
field public static TypeArr[] TypLst

method public static void ctor0()
VarLst = newarr VarItem 0
FldLst = newarr FieldItem 0
NestedFldLst = newarr FieldItem 0
MetLst = newarr MethodItem 0
NestedMetLst = newarr MethodItem 0
CtorLst = newarr CtorItem 0
NestedCtorLst = newarr CtorItem 0
IfLst = newarr IfItem 0
TypLst = newarr TypeArr 0
end method

method public static void ResetIf()
IfLst = newarr IfItem 0
end method

method public static void ResetVar()
VarLst = newarr VarItem 0
end method

method public static void ResetFld()
FldLst = newarr FieldItem 0
end method

method public static void ResetNestedFld()
NestedFldLst = newarr FieldItem 0
end method

method public static void ResetMet()
MetLst = newarr MethodItem 0
end method

method public static void ResetNestedMet()
NestedMetLst = newarr MethodItem 0
end method

method public static void ResetCtor()
CtorLst = newarr CtorItem 0
end method

method public static void ResetNestedCtor()
NestedCtorLst = newarr CtorItem 0
end method

method public static void AddVar(var nme as string, var la as boolean, var ind as integer, var typ as System.Type)

var vr as VarItem = new VarItem(nme, la, ind, typ)

var len as integer = VarLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as VarItem[] = newarr VarItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = VarLst[i]

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

destarr[len] = vr

VarLst = destarr

end method

method public static void AddTypArr(var arr as System.Type[])

var vr as TypeArr = new TypeArr()
vr::Arr = arr

var len as integer = TypLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as TypeArr[] = newarr TypeArr destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = TypLst[i]

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

destarr[len] = vr

TypLst = destarr

end method

method public static System.Type[] PopTypArr()

var a as System.Type[] = null
var b as TypeArr = null
var len as integer = TypLst[l]
var destl as integer = len - 1
var stopel as integer = len - 1
var i as integer = 0
var j as integer

var destarr as TypeArr[] = newarr TypeArr destl

label loop
label cont

place loop

i++

if destl > 0 then


if len > 0 then

j = i - 1
destarr[j] = TypLst[i]

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

end if


place cont

b = TypLst[0]
a = b::Arr

TypLst = destarr

return a

end method


method public static void AddFld(var nme as string, var typ as System.Type, var fld as FieldBuilder)

var vr as FieldItem = new FieldItem(nme, typ, fld)

var len as integer = FldLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as FieldItem[] = newarr FieldItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = FldLst[i]

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

destarr[len] = vr

FldLst = destarr

end method

method public static void AddNestedFld(var nme as string, var typ as System.Type, var fld as FieldBuilder)

var vr as FieldItem = new FieldItem(nme, typ, fld)

var len as integer = NestedFldLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as FieldItem[] = newarr FieldItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = NestedFldLst[i]

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

destarr[len] = vr

NestedFldLst = destarr

end method


method public static void AddMet(var nme as string, var typ as System.Type, var ptyps as System.Type[], var met as MethodBuilder)

var vr as MethodItem = new MethodItem(nme, typ, ptyps, met)

var len as integer = MetLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as MethodItem[] = newarr MethodItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = MetLst[i]

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

destarr[len] = vr

MetLst = destarr

end method


method public static void AddNestedMet(var nme as string, var typ as System.Type, var ptyps as System.Type[], var met as MethodBuilder)

var vr as MethodItem = new MethodItem(nme, typ, ptyps, met)

var len as integer = NestedMetLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as MethodItem[] = newarr MethodItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = NestedMetLst[i]

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

destarr[len] = vr

NestedMetLst = destarr

end method


method public static void AddCtor(var ptyps as System.Type[], var met as ConstructorBuilder)

var vr as CtorItem = new CtorItem(ptyps, met)

var len as integer = CtorLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as CtorItem[] = newarr CtorItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = CtorLst[i]

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

destarr[len] = vr

CtorLst = destarr

end method


method public static void AddNestedCtor(var ptyps as System.Type[], var met as ConstructorBuilder)

var vr as CtorItem = new CtorItem(ptyps, met)

var len as integer = NestedCtorLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as CtorItem[] = newarr CtorItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = NestedCtorLst[i]

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

destarr[len] = vr

NestedCtorLst = destarr

end method

method public static void AddIf()

var endl as Emit.Label = ILEmitter::DefineLbl()
var nbl as Emit.Label = ILEmitter::DefineLbl()
var vr as IfItem = new IfItem(endl, nbl)

var len as integer = IfLst[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as IfItem[] = newarr IfItem destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = IfLst[i]

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

destarr[len] = vr

IfLst = destarr

end method

method public static void PopIf()

var len as integer = IfLst[l]
var destl as integer = len - 1
var stopel as integer = len - 2
var i as integer = -1

var destarr as IfItem[] = newarr IfItem destl

label loop
label cont

place loop

i++

if stopel >= 0 then

destarr[i] = IfLst[i]

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

IfLst = destarr

end method

method public static Emit.Label ReadIfEndLbl()
var lastel as integer = IfLst[l] - 1
var ifi as IfItem = IfLst[lastel]
return ifi::EndLabel
end method

method public static Emit.Label ReadIfNxtBlkLbl()
var lastel as integer = IfLst[l] - 1
var ifi as IfItem = IfLst[lastel]
return ifi::NextBlkLabel
end method

method public static boolean ReadIfElsePass()
var lastel as integer = IfLst[l] - 1
var ifi as IfItem = IfLst[lastel]
return ifi::ElsePass
end method

method public static void SetIfElsePass()
var lastel as integer = IfLst[l] - 1
var ifi as IfItem = IfLst[lastel]
ifi::ElsePass = true
end method

method public static void SetIfNxtBlkLbl()
var lastel as integer = IfLst[l] - 1
var ifi as IfItem = IfLst[lastel]
ifi::NextBlkLabel = ILEmitter::DefineLbl()
end method

method public static VarItem FindVar(var nam as string)

var len as integer = VarLst[l] - 1
var i as integer = -1
var vr as VarItem = null
var rvr as VarItem = null
var comp as integer = 0

label cont
label loop

if VarLst[l] = 0 then
goto cont
end if

place loop

i++

vr = VarLst[i]
comp = String::Compare(nam, vr::Name)
if comp = 0 then
rvr = vr
goto cont
end if

if i = len then
goto cont
else
goto loop
end if

place cont

return rvr
end method

method public static FieldItem FindFld(var nam as string)

var len as integer = FldLst[l] - 1
var i as integer = -1
var fld as FieldItem = null
var rfld as FieldItem = null
var comp as integer = 0

label cont
label loop

if FldLst[l] = 0 then
goto cont
end if

place loop

i++

fld = FldLst[i]
comp = String::Compare(nam, fld::Name)
if comp = 0 then
rfld = fld
goto cont
end if

if i = len then
goto cont
else
goto loop
end if

place cont

return rfld
end method

method public static boolean CmpTyps(var arra as System.Type[], var arrb as System.Type[])

var b as boolean = true

if arra[l] = arrb[l] then

label loop
label cont


if arra[l] = 0 then
goto cont
end if

var i as integer = -1
var len as integer = arra[l] - 1
var ta as System.Type
var tb as System.Type

place loop
i++

ta = arra[i]
tb = arrb[i]

b = ta::IsAssignableFrom(tb)
if b = false then
goto cont
end if

if i = len then
goto cont
else
goto loop
end if

place cont

else
b = false
end if

return b

end method

method public static MethodItem FindMet(var nam as string, var params as System.Type[])

var len as integer = MetLst[l] - 1
var i as integer = -1
var met as MethodItem = null
var rmet as MethodItem = null
var comp as integer = 0
var b as boolean

label cont
label loop

if MetLst[l] = 0 then
goto cont
end if

place loop

i++

met = MetLst[i]
comp = String::Compare(nam, met::Name)
if comp = 0 then
b = CmpTyps(met::ParamTyps, params)
if b = true then
rmet = met
goto cont
end if
end if

if i = len then
goto cont
else
goto loop
end if

place cont

return rmet
end method

method public static CtorItem FindCtor(var params as System.Type[])

var len as integer = CtorLst[l] - 1
var i as integer = -1
var met as CtorItem = null
var rmet as CtorItem = null
var comp as integer = 0
var b as boolean

label cont
label loop

if CtorLst[l] = 0 then
goto cont
end if

place loop

i++

met = CtorLst[i]
b = CmpTyps(met::ParamTyps, params)
if b = true then
rmet = met
goto cont
end if

if i = len then
goto cont
else
goto loop
end if

place cont

return rmet
end method

end class
