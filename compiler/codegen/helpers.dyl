//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit Helpers

field public static boolean StringFlg
field public static boolean OpCodeSuppFlg
field public static System.Type LeftOp
field public static System.Type RightOp

method public static void ctor0()
StringFlg = false
OpCodeSuppFlg = false
LeftOp = null
RightOp = null
end method

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

typ = gettype Attributes.SpecialNameAttr
b = typ::IsInstanceOfType($object$curattr)

if b = true then
temp = 2048
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
var comp as integer = 0
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
comp = String::Compare(AsmFactory::CurnTypName, tt::Value)
if comp = 0 then
typ = AsmFactory::CurnTypB
else
typ = Loader::LoadClass(tt::Value)
end if
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

method public static integer getCodeFromType(var typ as System.Type)
var cod as integer = 0
var b as boolean = false
var typ2 as System.Type

label fin

typ2 = gettype boolean
b = typ::Equals(typ2)
if b = true then
cod = 101
goto fin
end if

typ2 = gettype Byte
b = typ::Equals(typ2)
if b = true then
cod = 8
goto fin
end if

typ2 = gettype UInt16
b = typ::Equals(typ2)
if b = true then
cod = 16
goto fin
end if

typ2 = gettype UInt32
b = typ::Equals(typ2)
if b = true then
cod = 32
goto fin
end if

typ2 = gettype UIntPtr
b = typ::Equals(typ2)
if b = true then
cod = 40
goto fin
end if

typ2 = gettype UInt64
b = typ::Equals(typ2)
if b = true then
cod = 64
goto fin
end if

typ2 = gettype sbyte
b = typ::Equals(typ2)
if b = true then
cod = 108
goto fin
end if

typ2 = gettype short
b = typ::Equals(typ2)
if b = true then
cod = 116
goto fin
end if

typ2 = gettype integer
b = typ::Equals(typ2)
if b = true then
cod = 132
goto fin
end if

typ2 = gettype IntPtr
b = typ::Equals(typ2)
if b = true then
cod = 140
goto fin
end if

typ2 = gettype char
b = typ::Equals(typ2)
if b = true then
cod = 150
goto fin
end if

typ2 = gettype long
b = typ::Equals(typ2)
if b = true then
cod = 164
goto fin
end if

typ2 = gettype single
b = typ::Equals(typ2)
if b = true then
cod = 232
goto fin
end if

typ2 = gettype double
b = typ::Equals(typ2)
if b = true then
cod = 264
goto fin
end if

typ2 = gettype string
b = typ::Equals(typ2)
if b = true then
cod = 270
goto fin
end if

place fin
return cod
end method

method public static System.Type getTypeFromCode(var cod as integer)
var typ2 as System.Type = gettype object

label fin

if cod = 101 then
typ2 = gettype boolean
goto fin
end if

if cod = 8 then
typ2 = gettype Byte
goto fin
end if

if cod = 16 then
typ2 = gettype UInt16
goto fin
end if

if cod = 32 then
typ2 = gettype UInt32
goto fin
end if

if cod = 40 then
typ2 = gettype UIntPtr
goto fin
end if

if cod = 64 then
typ2 = gettype UInt64
goto fin
end if

if cod = 108 then
typ2 = gettype sbyte
goto fin
end if

if cod = 116 then
typ2 = gettype short
goto fin
end if

if cod = 132 then
typ2 = gettype integer
goto fin
end if

if cod = 140 then
typ2 = gettype IntPtr
goto fin
end if

if cod = 150 then
typ2 = gettype char
goto fin
end if

if cod = 164 then
typ2 = gettype long
goto fin
end if

if cod = 232 then
typ2 = gettype single
goto fin
end if

if cod = 264 then
typ2 = gettype double
goto fin
end if

if cod = 270 then
typ2 = gettype string
goto fin
end if

place fin
return typ2
end method

method public static void EmitLiteral(var lit as Literal)

label fin
var typ as System.Type
var b as boolean

typ = gettype StringLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var slit as StringLiteral = lit
ILEmitter::EmitLdstr(slit::Value)
goto fin
end if

typ = gettype SByteLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var sblit as SByteLiteral = lit
ILEmitter::EmitLdcI1(sblit::NumVal)
goto fin
end if

typ = gettype ShortLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var shlit as ShortLiteral = lit
ILEmitter::EmitLdcI2(shlit::NumVal)
goto fin
end if

typ = gettype IntLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var ilit as IntLiteral = lit
ILEmitter::EmitLdcI4(ilit::NumVal)
goto fin
end if

typ = gettype LongLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var llit as LongLiteral = lit
ILEmitter::EmitLdcI8(llit::NumVal)
goto fin
end if

typ = gettype FloatLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var flit as FloatLiteral = lit
ILEmitter::EmitLdcR4(flit::NumVal)
goto fin
end if

typ = gettype DoubleLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var dlit as DoubleLiteral = lit
ILEmitter::EmitLdcR8(dlit::NumVal)
goto fin
end if

typ = gettype BooleanLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var bllit as BooleanLiteral = lit
ILEmitter::EmitLdcBool(bllit::BoolVal)
goto fin
end if

typ = gettype CharLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
var clit as CharLiteral = lit
ILEmitter::EmitLdcChar(clit::CharVal)
goto fin
end if

typ = gettype NullLiteral
b = typ::IsInstanceOfType($object$lit)

if b = true then
ILEmitter::EmitLdnull()
goto fin
end if

place fin

end method

method public static Literal ProcessConst(var lit as ConstLiteral)

label fin
var typ as System.Type
var inttyp as System.Type = lit::IntTyp
var obj as object = lit::ConstVal
var b as boolean

typ = gettype string
b = typ::Equals(inttyp)

if b = true then
var slit as StringLiteral = new StringLiteral()
slit::Value = $string$obj
return slit
goto fin
end if

typ = gettype sbyte
b = typ::Equals(inttyp)

if b = true then
var sblit as SByteLiteral = new SByteLiteral()
sblit::NumVal = $sbyte$obj
return sblit
goto fin
end if

typ = gettype short
b = typ::Equals(inttyp)

if b = true then
var shlit as ShortLiteral = new ShortLiteral()
shlit::NumVal = $short$obj
return shlit
goto fin
end if

typ = gettype integer
b = typ::Equals(inttyp)

if b = true then
var ilit as IntLiteral = new IntLiteral()
ilit::NumVal = $integer$obj
return ilit
goto fin
end if

typ = gettype long
b = typ::Equals(inttyp)

if b = true then
var llit as LongLiteral = new LongLiteral()
llit::NumVal = $long$obj
return llit
goto fin
end if

typ = gettype single
b = typ::Equals(inttyp)

if b = true then
var flit as FloatLiteral = new FloatLiteral()
flit::NumVal = $single$obj
return flit
goto fin
end if

typ = gettype double
b = typ::Equals(inttyp)

if b = true then
var dlit as DoubleLiteral = new DoubleLiteral()
dlit::NumVal = $double$obj
return dlit
goto fin
end if

typ = gettype boolean
b = typ::Equals(inttyp)

if b = true then
var bllit as BooleanLiteral = new BooleanLiteral()
bllit::BoolVal = $boolean$obj
return bllit
goto fin
end if

typ = gettype char
b = typ::Equals(inttyp)

if b = true then
var clit as CharLiteral = new CharLiteral()
clit::CharVal = $char$obj
return clit
goto fin
end if

return null

place fin

end method


method public static void EmitOp(var op as Op, var s as boolean)

label fin
var typ as System.Type
var b as boolean
var mtd as MethodInfo = null

typ = gettype AddOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_Addition", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if StringFlg = true then
ILEmitter::EmitStrAdd()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitAdd(s)
end if
end if
end if
goto fin
end if

typ = gettype MulOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_Multiply", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitMul(s)
end if
end if
goto fin
end if

typ = gettype SubOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_Subtraction", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitSub(s)
end if
end if
goto fin
end if

typ = gettype DivOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_Division", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitDiv(s)
end if
end if
goto fin
end if

typ = gettype ModOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_Modulus", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitRem(s)
end if
end if
goto fin
end if

typ = gettype OrOp
b = typ::IsInstanceOfType($object$op)

if b = true then
ILEmitter::EmitOr()
goto fin
end if

typ = gettype AndOp
b = typ::IsInstanceOfType($object$op)

if b = true then
ILEmitter::EmitAnd()
goto fin
end if

typ = gettype OrOp
b = typ::IsInstanceOfType($object$op)

if b = true then
ILEmitter::EmitOr()
goto fin
end if

typ = gettype XorOp
b = typ::IsInstanceOfType($object$op)

if b = true then
ILEmitter::EmitXor()
goto fin
end if

typ = gettype NandOp
b = typ::IsInstanceOfType($object$op)

if b = true then
ILEmitter::EmitNand()
goto fin
end if

typ = gettype NorOp
b = typ::IsInstanceOfType($object$op)

if b = true then
ILEmitter::EmitNor()
goto fin
end if

typ = gettype XnorOp
b = typ::IsInstanceOfType($object$op)

if b = true then
ILEmitter::EmitXnor()
goto fin
end if

typ = gettype GtOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_GreaterThan", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitCgt(s)
end if
end if
goto fin
end if

typ = gettype LtOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_LessThan", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitClt(s)
end if
end if
goto fin
end if

typ = gettype GeOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_GreaterThanOrEqual", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitCge(s)
end if
end if
goto fin
end if

typ = gettype LeOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_LessThanOrEqual", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if OpCodeSuppFlg = true then
ILEmitter::EmitCle(s)
end if
end if
goto fin
end if

typ = gettype EqOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_Equality", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if StringFlg = true then
ILEmitter::EmitStrCeq()
else
ILEmitter::EmitCeq()
end if
end if
goto fin
end if

typ = gettype NeqOp
b = typ::IsInstanceOfType($object$op)

if b = true then
mtd = Loader::LoadBinOp(LeftOp, "op_Inequality", LeftOp, RightOp)
if mtd <> null then
ILEmitter::EmitCall(mtd)
AsmFactory::Type02 = mtd::get_ReturnType()
else
if StringFlg = true then
ILEmitter::EmitStrCneq()
else
ILEmitter::EmitCneq()
end if
end if
goto fin
end if

typ = gettype LikeOp
b = typ::IsInstanceOfType($object$op)

if b = true then
if StringFlg = true then
ILEmitter::EmitLike()
end if
goto fin
end if

typ = gettype NLikeOp
b = typ::IsInstanceOfType($object$op)

if b = true then

if StringFlg = true then
ILEmitter::EmitNLike()
end if
goto fin
end if

place fin
end method

method public static void EmitLocLd(var ind as integer, var locarg as boolean)
if locarg = true then
ILEmitter::EmitLdloc(ind)
else
ILEmitter::EmitLdarg(ind)
end if
end method

method public static void EmitLocSt(var ind as integer, var locarg as boolean)
if locarg = true then
ILEmitter::EmitStloc(ind)
else
ILEmitter::EmitStarg(ind)
end if
end method

method public static void EmitConv(var source as System.Type, var sink as System.Type)

var typ as System.Type
var convc as System.Type = gettype System.Convert
var b as boolean = false
var b2 as boolean = false
var m1 as MethodInfo
var arr as System.Type[] = newarr System.Type 1

label fin


b = source::get_IsPrimitive()
b2 = sink::get_IsPrimitive()
b = b and b2

//begin conv overload block

if b = false then

m1 = Loader::LoadConvOp(sink, "op_Implicit", source, sink)
if m1 <> null then
ILEmitter::EmitCall(m1)
goto fin
end if

m1 = Loader::LoadConvOp(sink, "op_Explicit", source, sink)
if m1 <> null then
ILEmitter::EmitCall(m1)
goto fin
end if

m1 = Loader::LoadConvOp(source, "op_Implicit", source, sink)
if m1 <> null then
ILEmitter::EmitCall(m1)
goto fin
end if

m1 = Loader::LoadConvOp(source, "op_Explicit", source, sink)
if m1 <> null then
ILEmitter::EmitCall(m1)
goto fin
end if

end if

//end conv overload block

typ = gettype IntPtr
b = source::Equals(typ)

if b = true then
m1 = typ::GetMethod("ToInt64", System.Type::EmptyTypes)
ILEmitter::EmitCallvirt(m1)
source = gettype long
end if

typ = gettype string
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToString", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype char
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToChar", arr)
ILEmitter::EmitCall(m1)
goto fin
end if


typ = gettype decimal
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToDecimal", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype double
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToDouble", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype single
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToSingle", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype long
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToInt64", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype integer
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToInt32", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype short
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToInt16", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype sbyte
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToSByte", arr)
ILEmitter::EmitCall(m1)
goto fin
end if

typ = gettype boolean
b = sink::Equals(typ)

if b = true then
arr[0] = source
m1 = convc::GetMethod("ToBoolean", arr)
ILEmitter::EmitCall(m1)
goto fin
end if


place fin

end method

method public static void EmitMetCall(var met as MethodInfo, var stat as boolean)
if stat = true then
ILEmitter::EmitCall(met)
else
ILEmitter::EmitCallvirt(met)
end if
if AsmFactory::PopFlg = true then
var rt as System.Type = met::get_ReturnType()
var vt as System.Type = gettype void
var b as boolean = rt::Equals(vt)
if b = true then
else
ILEmitter::EmitPop()
end if
end if
end method

method public static void EmitFldLd(var fld as FieldInfo, var stat as boolean)
if stat = true then
ILEmitter::EmitLdsfld(fld)
else
ILEmitter::EmitLdfld(fld)
end if
end method

method public static void EmitFldSt(var fld as FieldInfo, var stat as boolean)
if stat = true then
ILEmitter::EmitStsfld(fld)
else
ILEmitter::EmitStfld(fld)
end if
end method

end class

