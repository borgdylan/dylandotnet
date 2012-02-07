//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit AsmFactory

field public static boolean DebugFlg
field public static boolean InMethodFlg
field public static boolean ChainFlg
field public static boolean PopFlg
field public static boolean AddrFlg
field public static AssemblyName AsmNameStr
field public static AssemblyBuilder AsmB
field public static System.Type Type01
field public static System.Type Type02
field public static System.Type Type03
field public static System.Type Type04
field public static System.Type Type05
field public static ModuleBuilder MdlB
field public static ISymbolDocumentWriter DocWriter
field public static string CurnNS
field public static string DfltNS
field public static string AsmMode
field public static string AsmFile
field public static string CurnTypName
field public static string CurnMetName
field public static MethodBuilder CurnMetB
field public static ConstructorBuilder CurnConB
field public static FieldBuilder CurnFldB
field public static ILGenerator CurnILGen
field public static System.Type CurnInhTyp
field public static TypeBuilder CurnTypB
field public static TypeBuilder CurnTypB2
field public static TypeBuilder[] CurnTypList
field public static boolean isNested
field public static boolean inClass
field public static System.Type[] TypArr
field public static string[] GenParamNames
field public static GenericTypeParameterBuilder[] GenParamTyps

method public static void ctor0()
DebugFlg = false
ChainFlg = false
PopFlg = false
AddrFlg = false
InMethodFlg = false
CurnNS = ""
DfltNS = ""
AsmMode = ""
AsmFile = ""
CurnTypList = newarr TypeBuilder 0
TypArr = newarr System.Type 0
GenParamNames = newarr string 0
GenParamTyps = newarr System.Type 0
isNested = false
inClass = false
end method

method public static void CreateTyp()
CurnTypB::CreateType()
end method

method public static void InitMtd()
var rv as ParameterAttributes = 8
CurnMetB::DefineParameter(0, rv, "")
CurnILGen = CurnMetB::GetILGenerator()
ILEmitter::Met = CurnMetB
ILEmitter::ILGen = CurnILGen
ILEmitter::DebugFlg = DebugFlg
ILEmitter::LocInd = -1
if ILEmitter::StaticFlg = true then
ILEmitter::ArgInd = -1
else
ILEmitter::ArgInd = 0
end if
end method

method public static void InitConstr()
CurnILGen = CurnConB::GetILGenerator()
ILEmitter::Constr = CurnConB
ILEmitter::ILGen = CurnILGen
ILEmitter::DebugFlg = DebugFlg
ILEmitter::LocInd = -1
if ILEmitter::StaticFlg = true then
ILEmitter::ArgInd = -1
else
ILEmitter::ArgInd = 0
end if
end method

method public static void InitDelConstr()
var non as ParameterAttributes = 0
CurnConB::DefineParameter(1, non, "obj")
CurnConB::DefineParameter(2, non, "ptr")
var ruman as MethodImplAttributes = 3 or 0
CurnConB::SetImplementationFlags(ruman)
end method

method public static void InitDelMet()
ILEmitter::Met = CurnMetB
var ruman as MethodImplAttributes = 3 or 0
CurnMetB::SetImplementationFlags(ruman)
end method

method public static void AddTypB(var typ as TypeBuilder)

var len as integer = CurnTypList[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as TypeBuilder[] = newarr TypeBuilder destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = CurnTypList[i]

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

destarr[len] = typ

CurnTypList = destarr

end method

method public static void AddTyp(var typ as System.Type)

var len as integer = TypArr[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as System.Type[] = newarr System.Type destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = TypArr[i]

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

destarr[len] = typ

TypArr = destarr

end method

method public static void AddGenParamName(var nam as string)

var len as integer = GenParamNames[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as string[] = newarr string destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = GenParamNames[i]

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

destarr[len] = nam

GenParamNames = destarr

end method


end class
