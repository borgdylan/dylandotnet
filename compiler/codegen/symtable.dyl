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

method public static void ctor0()
VarLst = newarr VarItem 0
FldLst = newarr FieldItem 0
NestedFldLst = newarr FieldItem 0
MetLst = newarr MethodItem 0
NestedMetLst = newarr MethodItem 0
CtorLst = newarr CtorItem 0
NestedCtorLst = newarr CtorItem 0
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

end class
