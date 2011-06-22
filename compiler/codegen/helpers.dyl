//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Helpers

method public static TypeAttributes ProcessClassAttrs(var attrs as Attributes.Attribute[])
var ta as TypeAttributes
var temp as TypeAttributes

label loop
label cont
label fin

var len as integer = attrs[l] - 1
var i as integer = -1
var b as boolean = false
var typ as System.Type
var curattr as Attributes.Attribute = null
var fir as boolean = true

place loop

i++

curattr = attrs[i]

typ = gettype Attributes.PublicAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
if AsmFactory::isNested = false then
temp = 1
else
temp = 2
end if
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

typ = gettype Attributes.AutoLayoutAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 0
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

typ = gettype Attributes.AnsiClassAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 0
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

place fin

if i = len then
goto cont
else
goto loop
end if


place cont


return ta
end method

method public static MethodAttributes ProcessMethodAttrs(var attrs as Attributes.Attribute[])
var ta as MethodAttributes
var temp as MethodAttributes

label loop
label cont
label fin

var len as integer = attrs[l] - 1
var i as integer = -1
var b as boolean = false
var typ as System.Type
var curattr as Attributes.Attribute = null
var fir as boolean = true

place loop

i++

curattr = attrs[i]

typ = gettype Attributes.PublicAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 6
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

typ = gettype Attributes.StaticAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 16
ILEmitter::StaticFlg = true
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

place fin

if i = len then
goto cont
else
goto loop
end if


place cont


return ta
end method


method public static FieldAttributes ProcessFieldAttrs(var attrs as Attributes.Attribute[])
var ta as FieldAttributes
var temp as FieldAttributes

label loop
label cont
label fin

var len as integer = attrs[l] - 1
var i as integer = -1
var b as boolean = false
var typ as System.Type
var curattr as Attributes.Attribute = null
var fir as boolean = true

place loop

i++

curattr = attrs[i]

typ = gettype Attributes.PublicAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 6
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

typ = gettype Attributes.StaticAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 16
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

typ = gettype Attributes.InitOnlyAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 32
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if

typ = gettype Attributes.PrivateAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 1
if fir = true then
fir = fir nand fir
ta = temp
else
ta = temp or ta
end if
goto fin
end if


place fin

if i = len then
goto cont
else
goto loop
end if


place cont


return ta
end method



// note that this method returns void and leaves a result in AsmFactory::Type01
method public static void EvalTTok(var tt as TypeTok)

var tarr as System.Type[]
var typ as System.Type
var temptyp as System.Type
var gtt as GenericTypeTok
var pttoks as TypeTok[] = newarr TypeTok 0
var curpttok as TypeTok = new TypeToK()
var i as integer = -1
var len as integer = 0
var n as integer = 0
var tstr as string = " "

var ttyp as System.Type = gettype GenericTypeTok
var b as boolean = ttyp::IsInstanceOfType($object$tt)

label cont
label loop

if b <> false then

gtt = tt
pttoks = gtt::Params
n = pttoks[l]
len = n - 1

tarr = AsmFactory::TypArr
AsmFactory::TypArr = newarr System.Type 0

Loader::MakeArr = gtt::IsArray
Loader::MakeRef = gtt::IsByRef
tstr = String::Concat(gtt::Value, "`", $string$n)
typ = Loader::LoadClass(tstr)

place loop

i++

curpttok = pttoks[i]
EvalTTok(curpttok)
temptyp = AsmFactory::Type01
AsmFactory::AddTyp(temptyp)

if i = len then
goto cont
else
goto loop
end if

place cont

//typ = typ::GetGenericTypeDefinition()
typ = typ::MakeGenericType(AsmFactory::TypArr)
AsmFactory::TypArr = tarr

else

label fin2

if tt::RefTyp = null then
Loader::MakeArr = tt::IsArray
Loader::MakeRef = tt::IsByRef
typ = Loader::LoadClass(tt::Value)
goto fin2
end if

Loader::MakeArr = tt::IsArray
Loader::MakeRef = tt::IsByRef
typ = Loader::ProcessType(tt::RefTyp) 

place fin2

end if

AsmFactory::Type01 = typ

end method

method public static System.Type CommitEvalTTok(var tt as TypeTok)
EvalTTok(tt)
return AsmFactory::Type01
end method

method public static void ProcessParams(var ps as Expr[])

var len as integer = ps[l] - 1
var i as integer = -1
var curp as VarExpr = null
var typtok as TypeTok
var nam as Ident
var typ as System.Type = null
//var reft as System.Type


label loop
label cont

place loop

i++

curp = ps[i]
typtok = curp::VarTyp
//reft = typtok::RefTyp

//if reft = null then
//Loader::MakeArr = typtok::IsArray
//Loader::MakeRef = typtok::IsByRef
//typ = Loader::LoadClass(typtok::Value)
//else
//Loader::MakeArr = typtok::IsArray
//Loader::MakeRef = typtok::IsByRef
//typ = Loader::ProcessType(reft) 
//end if

typ = CommitEvalTTok(typtok)

if typ <> null then
AsmFactory::AddTyp(typ)
end if

if i = len then
goto cont
else
goto loop
end if

place cont

end method

method public static void PostProcessParams(var ps as Expr[])

var len as integer = ps[l] - 1
var i as integer = -1
var curp as VarExpr = null
var nam as Ident
var typtok as TypeTok
var typ as System.Type = null
var reft as System.Type


label loop
label cont

place loop

i++

curp = ps[i]

var mb as MethodBuilder = ILEmitter::Met
var non as ParameterAttributes = 0
nam = curp::VarName
var ind as integer = i + 1
mb::DefineParameter(ind, non, nam::Value)

typtok = curp::VarTyp
//reft = typtok::RefTyp

//if reft = null then
//Loader::MakeArr = typtok::IsArray
//Loader::MakeRef = typtok::IsByRef
//typ = Loader::LoadClass(typtok::Value)
//else
//Loader::MakeArr = typtok::IsArray
//Loader::MakeRef = typtok::IsByRef
//typ = Loader::ProcessType(reft) 
//end if

typ = CommitEvalTTok(typtok)

ILEmitter::ArgInd = ILEmitter::ArgInd + 1
SymTable::AddVar(nam::Value, false, ILEmitter::ArgInd, typ)

if i = len then
goto cont
else
goto loop
end if

place cont

end method

method public static void PostProcessParamsConstr(var ps as Expr[])

var len as integer = ps[l] - 1
var i as integer = -1
var curp as VarExpr = null
var nam as Ident
var typtok as TypeTok
var typ as System.Type = null
//var reft as System.Type

label loop
label cont

place loop

i++

curp = ps[i]

var cb as ConstructorBuilder = ILEmitter::Constr
var non as ParameterAttributes = 0
nam = curp::VarName
var ind as integer = i + 1
cb::DefineParameter(ind, non, nam::Value)

typtok = curp::VarTyp
//reft = typtok::RefTyp

//if reft = null then
//Loader::MakeArr = typtok::IsArray
//Loader::MakeRef = typtok::IsByRef
//typ = Loader::LoadClass(typtok::Value)
//else
//Loader::MakeArr = typtok::IsArray
//Loader::MakeRef = typtok::IsByRef
//typ = Loader::ProcessType(reft) 
//end if

typ = CommitEvalTTok(typtok)

ILEmitter::ArgInd = ILEmitter::ArgInd + 1
SymTable::AddVar(nam::Value, false, ILEmitter::ArgInd, typ)

if i = len then
goto cont
else
goto loop
end if

place cont

end method


end class

