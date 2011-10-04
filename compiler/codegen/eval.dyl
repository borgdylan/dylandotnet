//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit Evaluator

field public OpStack Stack
field public Token InstToken

method public void ctor0()
me::ctor()
Stack = null
InstToken = new Token()
end method

method public integer RetPrec(var tok as Token)
var typ as System.Type = null
var b as boolean = false 
var prec as integer = 0

label fin

typ = gettype Op
b = typ::IsInstanceOfType($object$tok)

if b = true then
var optok as Op = tok
prec = optok::PrecNo
goto fin
end if

typ = gettype LParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
prec = -1
goto fin
end if

typ = gettype RParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
prec = 0
goto fin
end if

place fin

return prec

end method

method public boolean isLParen(var tok as Token)
var typ as System.Type = gettype LParen
return typ::IsInstanceOfType($object$tok)
end method

method public boolean isOp(var tok as Token)
var typ as System.Type = gettype Op
return typ::IsInstanceOfType($object$tok)
end method

method public Expr ConvToRPN(var exp as Expr)

Stack = new OpStack()
var exp2 as Expr = new Expr()
var i as integer = -1
var len as integer = exp::Tokens[l] - 1
var int1 as integer = 0
var int2 as integer = 0
var tok as Token = null
var tok2 as Token = null
var typ as System.Type = null
var b as boolean = false
var orflg as boolean = false

exp2::Line = exp::Line

label cont
label loop
label fin

place loop

i++

tok = exp::Tokens[i]

orflg = isOp(tok)
b = isLParen(tok)
orflg = orflg or b
typ = gettype RParen
b = typ::IsInstanceOfType($object$tok)
orflg = orflg or b

if orflg = false then
exp2::AddToken(tok)
goto fin
end if

b = isOp(tok)

if b = true then
int1 = Stack::getLength()
if int1 <> 0 then
tok2 = Stack::TopOp()
int1 = RetPrec(tok)
int2 = RetPrec(tok2)
if int1 <= int2 then
exp2::AddToken(tok2)
Stack::PopOp()
end if
end if
Stack::PushOp(tok)
goto fin
end if

b = isLParen(tok)

if b = true then
Stack::PushOp(tok)
goto fin
end if

typ = gettype RParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
int1 = Stack::getLength()
if int1 <> 0 then
tok2 = Stack::TopOp()
b = isLParen(tok2)
if b = false then
exp2::AddToken(tok2)
Stack::PopOp()
int1 = Stack::getLength()
if int1 <> 0 then
tok2 = Stack::TopOp()
b = isLParen(tok2)
if b = true then
Stack::PopOp()
end if
end if
end if
else
tok2 = Stack::TopOp()
b = isLParen(tok2)
if b = true then
Stack::PopOp()
end if
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

label loop2
label cont2

int1 = Stack::getLength()
if int1 = 0 then
goto cont2
end if

place loop2

tok2 = Stack::TopOp()
b = isLParen(tok2)

if b = false then
exp2::AddToken(tok2)
end if

Stack::PopOp()

int1 = Stack::getLength()
if int1 = 0 then
goto cont2
else
goto loop2
end if

place cont2

return exp2

end method

method public Expr ConvToAST(var exp as Expr)

var tokf as Token
var i as integer = -1
var j as integer = 0
var len as integer = exp::Tokens[l]
var tok as Token = null
var tok2 as Token = null
var typ as System.Type = null
var b as boolean = false
var optok as Op

label cont
label loop
label fin

if len = 1 then
tokf = exp::Tokens[0]
goto cont
end if

len--

place loop

i++

tok = exp::Tokens[i]

b = isOp(tok)

if b = true then
if i >= 2 then
optok = tok

j = i - 1
tok2 = exp::Tokens[j]
exp::RemToken(j)
len--
j--
tok = exp::Tokens[j]
exp::RemToken(j)
len--
optok::LChild = tok
optok::RChild = tok2
exp::Tokens[j] = optok
i = j
end if
goto fin
end if

place fin

if i = len then
tokf = exp::Tokens[0]
goto cont
else
goto loop
end if

place cont

return tokf

end method

method public void ASTEmit(var tok as Token, var emt as boolean)

var isop as boolean = isOp(tok)
var optok as Op = new Op()
var rc as Token = new Token()
var lc as Token = new Token()
var lcint as integer = 0
var rcint as integer = 0
var lctyp as System.Type = null
var rctyp as System.Type = null
var typ as System.Type
var b as boolean = false
var tt as TypeTok = null
var i as integer = -1
var j as integer = 0
var len as integer = 0
var instflg as boolean = false

label fin

if isop = true then

optok = tok
rc = optok::RChild
lc = optok::LChild
ASTEmit(lc, emt)
lctyp = AsmFactory::Type02
ASTEmit(rc, emt)
rctyp = AsmFactory::Type02

if emt = true then
typ = gettype string
b = lctyp::Equals(typ)
Helpers::StringFlg = b
end if

b = lctyp::Equals(rctyp)
if b = true then
Helpers::OpCodeSuppFlg = lctyp::get_IsPrimitive()
else
Helpers::OpCodeSuppFlg = false
end if

//if b = true then

typ = gettype ConditionalOp
b = typ::IsInstanceOfType($object$optok)

if b = true then
AsmFactory::Type02 = gettype boolean
else
AsmFactory::Type02 = lctyp
end if

if emt = true then
Helpers::LeftOp = lctyp
Helpers::RightOp = rctyp
Helpers::EmitOp(optok, true)
Helpers::StringFlg = false
Helpers::OpCodeSuppFlg = false
end if

//else
//lcint = Helpers::getCodeFromType(lctyp)
//rcint = Helpers::getCodeFromType(rctyp)
//end if

else

var src1 as System.Type
var snk1 as System.Type

typ = gettype StringLiteral
b = typ::IsInstanceOfType($object$tok)

if b = true then
var slit as StringLiteral = tok
if slit::Conv = false then
//no conv
tt = slit::LitTyp
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
Helpers::EmitLiteral(slit)
end if

if slit::MemberAccessFlg = true then
ASMFactory::ChainFlg = true
ASTEmit(slit::MemberToAccess, emt)
end if

goto fin

else
//yes conv
tt = slit::LitTyp
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
Helpers::EmitLiteral(slit)
end if

if slit::MemberAccessFlg = true then
ASMFactory::ChainFlg = true
ASTEmit(slit::MemberToAccess, emt)
end if

if emt = true then
src1 = AsmFactory::Type02
end if

tt = slit::TTok
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
snk1 = AsmFactory::Type02
Helpers::EmitConv(src1, snk1)
end if


goto fin
end if
end if

typ = gettype Literal
b = typ::IsInstanceOfType($object$tok)

if b = true then
var lit as Literal = tok
if lit::Conv = false then
//no conv
tt = lit::LitTyp
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
Helpers::EmitLiteral(lit)
end if

goto fin

else
//yes conv

if emt = true then
Helpers::EmitLiteral(lit)
end if

tt = lit::LitTyp
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
src1 = AsmFactory::Type02
end if

tt = lit::TTok
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
snk1 = AsmFactory::Type02
Helpers::EmitConv(src1, snk1)
end if


goto fin
end if
end if

typ = gettype Ident
b = typ::IsInstanceOfType($object$tok)

var idtnam as string
var vr as VarItem
var fldr as FieldItem
var idtfldinf as FieldInfo
var idtb1 as boolean = false
var idtb2 as boolean = false
var idt as Ident
var idtcomp as integer = 0
var idttyp as System.Type
var idtisstatic as boolean = false
var arrlocexpr as Expr
var idtarrloc as Ident
var idtnamarr as string[]


if b = true then
idt = tok
idtnam = idt::Value
idtnamarr = ParseUtils::StringParser(idtnam, ":")
i = -1
len = idtnamarr[l] - 1

idtcomp = String::Compare(idtnamarr[0], "me")
if idtcomp = 0 then
i++
idtb1 = true
end if

label loop3
label cont3
label idtfin

place loop3
i++

if idtb2 = false then

if idtb1 = false then
vr = SymTable::FindVar(idtnamarr[i])
if vr <> null then
if emt = true then
Helpers::EmitLocLd(vr::Index, vr::LocArg)
end if
AsmFactory::Type02 = vr::VarTyp
typ = vr::VarTyp
goto idtfin
end if
end if

typ = Loader::LoadClass(idtnamarr[i])
idtisstatic = true

else

idtfldinf = Loader::LoadField(typ, idtnamarr[i])
AsmFactory::Type02 = Loader::MemberTyp
typ = Loader::MemberTyp
if emt = true then

if Loader::FldLitFlag = false then
Helpers::EmitFldLd(idtfldinf, idtisstatic)
else

var constlit as ConstLiteral = new ConstLiteral()
constlit::ConstVal = Loader::FldLitVal
constlit::ExtTyp = Loader::FldLitTyp
if Loader::EnumLitFlag = true then
constlit::IntTyp = Loader::EnumLitTyp
else
constlit::IntTyp = Loader::FldLitTyp
end if

var constl as Literal = Helpers::ProcessConst(constlit)
Helpers::EmitLiteral(constl)
AsmFactory::Type02 = Loader::FldLitTyp
typ = Loader::FldLitTyp

end if

end if

if idtisstatic = true then
idtisstatic = false
end if

end if

place idtfin

idtb2 = true

if i = len then
goto cont3
else
goto loop3
end if

place cont3


if idt::Conv = true then

if emt = true then
src1 = AsmFactory::Type02
end if

tt = idt::TTok
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
snk1 = AsmFactory::Type02
Helpers::EmitConv(src1, snk1)
end if

end if

goto fin
end if

typ = gettype MethodCallTok
b = typ::IsInstanceOfType($object$tok)

if b = true then
var mcparenttyp as System.Type
var mnstrarr as string[]
var mcmetinf as MethodInfo
var nctyp as System.Type
var mctok as MethodCallTok = tok
var mntok as MethodNameTok = mctok::Name
var mnstr as string = ""
var mcparams as Expr[]
var typarr1 as System.Type[] = newarr System.Type 0
var typarr2 as System.Type[]
var paramlen as integer
var curexpr as Expr
var rpnparam as Expr
var astparam as Token
var ncctorinf as ConstructorInfo
var mcfldinf as FieldInfo
var mcvr as VarItem
var mcisstatic as boolean = false

mnstr = mntok::Value
mnstrarr = ParseUtils::StringParser(mnstr, ":")
mcparams = mctok::Params
paramlen = mcparams[l] - 1
idtb1 = false
idtb2 = false

//if AsmFactory::ChainFlg = true then
//yes chaining no conv

//AsmFactory::ChainFlg = false
//mcparenttyp = AsmFactory::Type02

//i = -1

//label loop
//label cont

//if mcparams[l] = 0 then
//typarr1 = System.Type::EmptyTypes
//goto cont
//end if

//place loop

//i++
//curexpr = mcparams[i]

//if curexpr::Tokens[l] = 1 then
//rpnparam = curexpr
//else
//if curexpr::Tokens[l] >= 3 then
//rpnparam = ConvToRPN(curexpr)
//end if
//end if

//astparam = ConvToAST(rpnparam)
//ASTEmit(astparam, emt)

//typarr2 = AsmFactory::TypArr
//AsmFactory::TypArr = typarr1
//AsmFactory::AddTyp(AsmFactory::Type02)
//typarr1 = AsmFactory::TypArr
//AsmFactory::TypArr = typarr2

//if i = paramlen then
//goto cont
//else
//goto loop
//end if

//place cont

//if mnstrarr[l] >= 2 then

//i = -1
//len = mnstrarr[l] - 2

//label loop2
//label cont2

//place loop2
//i++

//mcfldinf = Loader::LoadField(mcparenttyp, mnstrarr[i])
//mcparenttyp = mcfldinf::get_FieldType()

//if i = len then
//i++
//goto cont2
//else
//goto loop2
//end if 

//place cont2

//else
//i = 0
//end if

//mcmetinf = Loader::LoadMethod(mcparenttyp, mnstrarr[i], typarr1)
//AsmFactory::Type02 = mcmetinf::get_ReturnType()

//if mntok::MemberAccessFlg = true then
//ASMFactory::ChainFlg = true
//ASTEmit(mntok::MemberToAccess, emt)
//end if

mcparenttyp = null
mcmetinf = null
mcfldinf = null

i = -1
var tstr as string
mnstrarr = ParseUtils::StringParser(mnstr, ":")
len = mnstrarr[l] - 2

idtcomp = String::Compare(mnstrarr[0], "me")
if idtcomp = 0 then
i++
idtb1 = true
end if

label loop7
label cont7
label metfin


if mnstrarr[l] < 2 then
goto cont7
end if

place loop7
i++

if idtb2 = false then

if idtb1 = false then
mcvr = SymTable::FindVar(mnstrarr[i])
if mcvr <> null then
if emt = true then
Helpers::EmitLocLd(mcvr::Index, mcvr::LocArg)
end if
AsmFactory::Type02 = mcvr::VarTyp
mcparenttyp = mcvr::VarTyp
goto metfin
end if
end if

mcparenttyp = Loader::LoadClass(mnstrarr[i])
mcisstatic = true

else

mcfldinf = Loader::LoadField(mcparenttyp, mnstrarr[i])
AsmFactory::Type02 = Loader::MemberTyp
mcparenttyp = Loader::MemberTyp

if emt = true then
Helpers::EmitFldLd(mcfldinf, mcisstatic)
end if

if mcisstatic = true then
mcisstatic = false
end if

end if

place metfin

idtb2 = true

if i = len then
goto cont7
else
goto loop7
end if

place cont7

j = i
AsmFactory::Type03 = AsmFactory::Type02


label loop5
label cont5

i = -1

if mcparams[l] = 0 then
typarr1 = System.Type::EmptyTypes
goto cont5
end if

place loop5

i++
curexpr = mcparams[i]

if curexpr::Tokens[l] = 1 then
rpnparam = curexpr
else
if curexpr::Tokens[l] >= 3 then
rpnparam = ConvToRPN(curexpr)
end if
end if

astparam = ConvToAST(rpnparam)
ASTEmit(astparam, emt)

typarr2 = AsmFactory::TypArr
AsmFactory::TypArr = typarr1
AsmFactory::AddTyp(AsmFactory::Type02)
typarr1 = AsmFactory::TypArr
AsmFactory::TypArr = typarr2

if i = paramlen then
goto cont5
else
goto loop5
end if

place cont5

AsmFactory::Type02 = AsmFactory::Type03
i = j

i++

mcmetinf = Loader::LoadMethod(mcparenttyp, mnstrarr[i], typarr1)
AsmFactory::Type02 = Loader::MemberTyp

if emt = true then
AsmFactory::PopFlg = mctok::PopFlg
Helpers::EmitMetCall(mcmetinf, mcisstatic)
AsmFactory::PopFlg = false
end if

if mntok::MemberAccessFlg = true then
ASMFactory::ChainFlg = true
ASTEmit(mntok::MemberToAccess, emt)
end if


if mntok::Conv = true then

if emt = true then
src1 = AsmFactory::Type02
end if

tt = mntok::TTok
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)

if emt = true then
snk1 = AsmFactory::Type02
Helpers::EmitConv(src1, snk1)
end if

end if

goto fin

end if

typ = gettype NewCallTok
b = typ::IsInstanceOfType($object$tok)

if b = true then

var nctok as NewCallTok = tok
tt = nctok::Name
nctyp = Helpers::CommitEvalTTok(tt)
mcparams = nctok::Params
paramlen = mcparams[l] - 1

label ncloop
label nccont

if mcparams[l] = 0 then
typarr1 = System.Type::EmptyTypes
goto nccont
else
typarr1 = newarr System.Type 0
end if

i = -1

place ncloop

i++
curexpr = mcparams[i]

if curexpr::Tokens[l] = 1 then
rpnparam = curexpr
else
if curexpr::Tokens[l] >= 3 then
rpnparam = ConvToRPN(curexpr)
end if
end if

astparam = ConvToAST(rpnparam)
ASTEmit(astparam, emt)

typarr2 = AsmFactory::TypArr
AsmFactory::TypArr = typarr1
AsmFactory::AddTyp(AsmFactory::Type02)
typarr1 = AsmFactory::TypArr
AsmFactory::TypArr = typarr2

if i = paramlen then
goto nccont
else
goto ncloop
end if

place nccont

ncctorinf = nctyp::GetConstructor(typarr1)

if emt = true then
ILEmitter::EmitNewobj(ncctorinf)
end if

AsmFactory::Type02 = nctyp
goto fin
end if

typ = gettype GettypeCallTok
b = typ::IsInstanceOfType($object$tok)

if b = true then

if emt = true then

var gtctok as GettypeCallTok = tok
tt = gtctok::Name
typ = Helpers::CommitEvalTTok(tt)
ILEmitter::EmitLdtoken(typ)

typarr1 = newarr System.Type 0

typarr2 = AsmFactory::TypArr
AsmFactory::TypArr = typarr1
typ = gettype System.RuntimeTypeHandle
AsmFactory::AddTyp(typ)
typarr1 = AsmFactory::TypArr
AsmFactory::TypArr = typarr2

typ = gettype System.Type
mcmetinf = typ::GetMethod("GetTypeFromHandle", typarr1)
ILEmitter::EmitCall(mcmetinf)

end if

AsmFactory::Type02 = gettype System.Type

goto fin
end if

place fin

end if

end method

method public void Evaluate(var exp as Expr)

var len as integer = exp::Tokens[l]
//Console::WriteLine(len)
var rpnexp as Expr

if len = 1 then
rpnexp = exp
else
if len >= 3 then
rpnexp = ConvToRPN(exp)
end if
end if

var asttok as Token = ConvToAST(rpnexp)
ASTEmit(asttok, false)
ASTEmit(asttok, true)

end method

method public void StoreEmit(var idt as Ident)

var idtnam as string
var vr as VarItem
var idtb1 as boolean = false
var idtcomp as integer = 0
var idttyp as System.Type
var arrlocexpr as Expr
var idtarrloc as Ident
var tok as Token
var typ as System.Type
var b as boolean

idtnam = idt::Value
vr = SymTable::FindVar(idtnam)
if vr <> null then
//AsmFactory::Type02 = vr::VarTyp

Helpers::EmitLocSt(vr::Index, vr::LocArg)

//begin array check

//if idt::IsArr = true then
//idttyp = AsmFactory::Type02

//arrlocexpr = idt::ArrLoc
//if arrlocexpr::Tokens[l] = 1 then
//idtb1 = true
//else
//idtb1 = false
//end if

//if idtb1 = true then
//tok = arrlocexpr::Tokens[0]
//typ = gettype Ident
//idtb1 = typ::IsInstanceOfType($object$tok)
//if idtb1 = true then
//idtarrloc = tok
//idtcomp = String::Compare(idtarrloc::Value , "l")
//if idtcomp <> 0 then
//idtb1 = false
//else
//idtb1 = true
//end if
//end if
//end if

//if idtb1 = false then
//idttyp = idttyp::GetElementType()
//AsmFactory::Type02 = idttyp
//else
//AsmFactory::Type02 = gettype integer
//end if

//end if
//end array check

end if

end method

end class
