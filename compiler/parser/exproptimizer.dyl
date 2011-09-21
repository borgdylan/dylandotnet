//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi ExprOptimizer

method public Expr checkVarAs(var stm as Expr, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype VarTok
valinref|b = typ::IsInstanceOfType($object$tok)
var vars as VarExpr = new VarExpr()

if valinref|b = true then
vars::Tokens = stm::Tokens
vars::Line = stm::Line
vars::VarName = stm::Tokens[1]

var tok2 as Token = stm::Tokens[3]
var typ2 as System.Type = gettype TypeTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

if b2 <> true then
var t as Token = stm::Tokens[3]
var tt as TypeTok = new TypeTok()
tt::Line = t::Line
tt::Value = t::Value
vars::VarTyp = tt
else
vars::VarTyp = stm::Tokens[3]
end if

end if
return vars
end method

method public MethodNameTok IdentToMNTok(var idt as Ident, var mnt as MethodNameTok)

mnt::DoNeg = idt::DoNeg
mnt::DoNot = idt::DoNot
mnt::Conv = idt::Conv
mnt::IsArr = idt::IsArr
mnt::ArrLoc = idt::ArrLoc
mnt::IsRef = idt::IsRef
mnt::IsValInRef = idt::IsValInRef
mnt::IsRefInst = idt::IsRefInst
mnt::IsValInRefInst = idt::IsValInRefInst
mnt::TTok = idt::TTok
mnt::OrdOp = idt::OrdOp
mnt::Value = idt::Value
mnt::Line = idt::Line

return mnt
end method

method public Expr procMethodCall(var stm as Expr, var i as integer)

var mn as MethodNameTok = new MethodNameTok()
var mct as MethodCallTok = new MethodCallTok()
var idt as Ident = null
var ep2 as Expr = new Expr()
var lvl as integer = 1
var d as boolean = true
var j as integer = 0

i--
idt = stm::Tokens[i]
mn = IdentToMNTok(idt, mn)
j = i
i++

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean
var len as integer = stm::Tokens[l] - 1

stm::RemToken(i)
len = stm::Tokens[l] - 1
i--

label loop2
label cont2
label fin

place loop2

//get parameters
i++

tok2 = stm::Tokens[i]
typ2 = gettype RParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl--
if lvl = 0 then
d = false
if ep2::Tokens[l] > 0 then
mct::AddParam(ep2)
end if
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
goto cont2
else
d = true
goto fin
end if
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype LParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl++
d = true
//stm::RemToken(i)
len = stm::Tokens[l] - 1
//i--
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype Comma
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
if lvl = 1 then
d = false
if ep2::Tokens[l] > 0 then
mct::AddParam(ep2)
end if
ep2 = new Expr()
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
goto fin
else
d = true
goto fin
end if
else
d = true
goto fin
end if

place fin

if d = true then
ep2::AddToken(stm::Tokens[i])
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
end if

if i = len then
goto cont2
else
goto loop2
end if

place cont2

mct::Name = mn
mct::Line = mn::Line
stm::Tokens[j] = mct

return stm

end method

method public Expr procNewCall(var stm as Expr, var i as integer)

var nct as NewCallTok = new NewCallTok()
var tt as TypeTok
var ep2 as Expr = new Expr()
var lvl as integer = 1
var d as boolean = true
var j as integer = 0

tt = stm::Tokens[i]
nct::Name = tt
j = i
i++

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean
var len as integer = stm::Tokens[l] - 1

stm::RemToken(i)
len = stm::Tokens[l] - 1
i--

label loop2
label cont2
label fin

place loop2

//get parameters
i++

tok2 = stm::Tokens[i]
typ2 = gettype RParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl--
if lvl = 0 then
d = false
if ep2::Tokens[l] > 0 then
nct::AddParam(ep2)
end if
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
goto cont2
else
d = true
goto fin
end if
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype LParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl++
d = true
//stm::RemToken(i)
len = stm::Tokens[l] - 1
//i--
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype Comma
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
if lvl = 1 then
d = false
if ep2::Tokens[l] > 0 then
nct::AddParam(ep2)
end if
ep2 = new Expr()
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
goto fin
else
d = true
goto fin
end if
else
d = true
goto fin
end if

place fin

if d = true then
ep2::AddToken(stm::Tokens[i])
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
end if

if i = len then
goto cont2
else
goto loop2
end if

place cont2

nct::Line = tt::Line
stm::Tokens[j] = nct

return stm

end method

method public Expr procIdentArrayAccess(var stm as Expr, var i as integer)

var idt as Ident = null
var ep2 as Expr = new Expr()
var lvl as integer = 1
var d as boolean = true
var j as integer = 0

i--
idt = stm::Tokens[i]
j = i
i++

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean
var len as integer = stm::Tokens[l] - 1

stm::RemToken(i)
len = stm::Tokens[l] - 1
i--

label loop2
label cont2
label fin

place loop2

//get parameters
i++

tok2 = stm::Tokens[i]
typ2 = gettype RSParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl--
if lvl = 0 then
d = false
//mct::AddParam(ep2)
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
goto cont2
else
d = true
goto fin
end if
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype LSParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl++
d = true
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype Comma
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
else
d = true
goto fin
end if

place fin

if d = true then
ep2::AddToken(stm::Tokens[i])
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
end if

if i = len then
goto cont2
else
goto loop2
end if

place cont2

idt::ArrLoc = ep2
idt::IsArr = true
stm::Tokens[j] = idt

return stm

end method

method public Expr procMtdArrayAccess(var stm as Expr, var i as integer)

var mtd as MethodCallTok = null
var idt as MethodNameTok = null
var ep2 as Expr = new Expr()
var lvl as integer = 1
var d as boolean = true
var j as integer = 0

i--
mtd = stm::Tokens[i]
idt = mtd::Name
j = i
i++

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean
var len as integer = stm::Tokens[l] - 1

stm::RemToken(i)
len = stm::Tokens[l] - 1
i--

label loop2
label cont2
label fin

place loop2

//get parameters
i++

tok2 = stm::Tokens[i]
typ2 = gettype RSParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl--
if lvl = 0 then
d = false
//mct::AddParam(ep2)
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
goto cont2
else
d = true
goto fin
end if
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype LSParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl++
d = true
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype Comma
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
else
d = true
goto fin
end if

place fin

if d = true then
ep2::AddToken(stm::Tokens[i])
stm::RemToken(i)
len = stm::Tokens[l] - 1
i--
end if

if i = len then
goto cont2
else
goto loop2
end if

place cont2

idt::ArrLoc = ep2
idt::IsArr = true
mtd::Name = idt
stm::Tokens[j] = mtd

return stm

end method

method public Expr Optimize(var exp as Expr)

var len as integer = exp::Tokens[l] - 1
var i as integer = -1
var j as integer = -1
var identtrnoff as boolean = false
var mcbool as boolean = false
var mcflgc as boolean = false
var iflgc as boolean = false
var sflgc as boolean = false
var mctok as Token = null
var nctok as Token = null
var ncttok as TypeTok = null
var gtctok as Token = null
var gtcttok as TypeTok = null
var mctok2 as Token = null
var mcident as Ident = null
var mcmetcall as MethodCallTok = null
var mcmetname as MethodNameTok = null
var mcstr as StringLiteral = null
var mcint as integer = 0


label loop
label cont


if len < 0 then
goto cont
end if

place loop

if ParserFlags::MetChainFlag = false then

i++

label fin

var tok as Token = exp::Tokens[i]
var typ as System.Type
var b as boolean
var str as string

typ = gettype LRSParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
typ = gettype TypeTok
exp::RemToken(i)
i--
len = exp::Tokens[l] - 1
tok = exp::Tokens[i]
b = typ::IsInstanceOfType($object$tok)

if b <> true then
var tk as Token = exp::Tokens[i]
var ttk as TypeTok = new TypeTok()
ttk::Line = tk::Line
ttk::Value = tk::Value
ttk::IsArray = true
else
ttk = exp::Tokens[i]
ttk::IsArray = true
end if
exp::Tokens[i] = ttk
goto fin
end if

typ = gettype Ampersand
b = typ::IsInstanceOfType($object$tok)

if b = true then
typ = gettype TypeTok
exp::RemToken(i)
i--
len = exp::Tokens[l] - 1
tok = exp::Tokens[i]
b = typ::IsInstanceOfType($object$tok)

if b <> true then
var tk2 as Token = exp::Tokens[i]
var ttk2 as TypeTok = new TypeTok()
ttk2::Line = tk2::Line
ttk2::Value = tk2::Value
ttk2::IsByRef = true
else
ttk2 = exp::Tokens[i]
ttk2::IsByRef = true
end if
exp::Tokens[i] = ttk2
goto fin
end if

if ParserFlags::ProcessTTokOnly = false then

typ = gettype DollarSign
b = typ::IsInstanceOfType($object$tok)

if b = true then
ParserFlags::DurConvFlag = ParserFlags::DurConvFlag nor ParserFlags::DurConvFlag
ParserFlags::isChanged = true
if ParserFlags::DurConvFlag <> false then
ParserFlags::ConvFlag = true
ParserFlags::OrdOp = String::Concat("conv ", ParserFlags::OrdOp)
str = ParserFlags::OrdOp
str = str::Trim()
ParserFlags::OrdOp = str
end if
exp::RemToken(i)
i--
len = exp::Tokens[l] - 1
goto fin
end if

typ = gettype TypeTok
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::DurConvFlag <> false then
var tt1 as TypeTok = exp::Tokens[i]
ParserFlags::ConvTyp = tt1
exp::RemToken(i)
i--
len = exp::Tokens[l] - 1
else
end if
goto fin
end if

typ = gettype Ident
b = typ::IsInstanceOfType($object$tok)

if b = true then
b = ParserFlags::MetCallFlag or ParserFlags::IdentFlag or ParserFlags::StringFlag
if b = true then
mcbool = true
end if
ParserFlags::IdentFlag = true
if ParserFlags::isChanged = true then
var id1 as Ident = exp::Tokens[i]
exp::Tokens[i] = ParserFlags::UpdateIdent(id1)
ParserFlags::SetUnaryFalse()
j = i
end if
goto fin
end if

typ = gettype CharLiteral
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::isChanged = true then
var cl1 as CharLiteral = exp::Tokens[i]
exp::Tokens[i] = ParserFlags::UpdateCharLit(cl1)
ParserFlags::SetUnaryFalse()
j = i
end if
goto fin
end if

typ = gettype NullLiteral
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::isChanged = true then
var nul1 as NullLiteral = exp::Tokens[i]
exp::Tokens[i] = ParserFlags::UpdateNullLit(nul1)
ParserFlags::SetUnaryFalse()
j = i
end if
goto fin
end if

typ = gettype StringLiteral
b = typ::IsInstanceOfType($object$tok)

if b = true then
ParserFlags::StringFlag = true
if ParserFlags::isChanged = true then
var sl1 as StringLiteral = exp::Tokens[i]
exp::Tokens[i] = ParserFlags::UpdateStringLit(sl1)
ParserFlags::SetUnaryFalse()
j = i
end if
goto fin
end if

typ = gettype BooleanLiteral
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::isChanged = true then
var bl1 as BooleanLiteral = exp::Tokens[i]
exp::Tokens[i] = ParserFlags::UpdateBoolLit(bl1)
ParserFlags::SetUnaryFalse()
j = i
end if
goto fin
end if

typ = gettype NumberLiteral
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::isChanged = true then
var nl1 as NumberLiteral = exp::Tokens[i]
exp::Tokens[i] = ParserFlags::UpdateNumLit(nl1)
ParserFlags::SetUnaryFalse()
j = i
end if
goto fin
end if

typ = gettype NewTok
b = typ::IsInstanceOfType($object$tok)

if b = true then

exp::RemToken(i)
len--

nctok = exp::Tokens[i]

typ = gettype TypeTok
b = typ::IsInstanceOfType($object$nctok)

if b <> true then
ncttok = new TypeTok()
ncttok::Line = nctok::Line
ncttok::Value = nctok::Value
exp::Tokens[i] = ncttok
end if

exp = procNewCall(exp, i)
len = exp::Tokens[l] - 1

var nctoken as NewCallTok = exp::Tokens[i]
var ncprs as Expr[] = nctoken::Params
var ncln2 as integer = ncprs[l] - 1

var nci2 as integer = -1
label ncloop2
label nccont2

if ncln2 < 0 then
goto nccont2
end if

place ncloop2
nci2++
ncprs[nci2] = Optimize(ncprs[nci2])

if nci2 = ncln2 then
goto nccont2
else
goto ncloop2
end if

place nccont2

nctoken::Params = ncprs

goto fin
end if

typ = gettype GettypeTok
b = typ::IsInstanceOfType($object$tok)

if b = true then

exp::RemToken(i)
len--

gtctok = exp::Tokens[i]

typ = gettype TypeTok
b = typ::IsInstanceOfType($object$gtctok)

if b <> true then
gtcttok = new TypeTok()
gtcttok::Line = gtctok::Line
gtcttok::Value = gtctok::Value
exp::Tokens[i] = gtcttok
end if

var gtctoken as GettypeCallTok = new GettypeCallTok
gtctoken::Name = exp::Tokens[i]
exp::Tokens[i] = gtctoken

goto fin
end if


typ = gettype LParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
b = ParserFlags::MetCallFlag or ParserFlags::StringFlag or ParserFlags::IdentFlag
if ParserFlags::IdentFlag = true then
ParserFlags::IdentFlag = false
if b = true then
mcbool = true
end if
ParserFlags::MetCallFlag = true
exp = procMethodCall(exp, i)
i--
len = exp::Tokens[l] - 1

var mct as MethodCallTok = exp::Tokens[i]
var prs as Expr[] = mct::Params
var ln2 as integer = prs[l] - 1

mcflgc = ParserFlags::MetCallFlag
iflgc = ParserFlags::IdentFlag
sflgc = ParserFlags::StringFlag

var i2 as integer = -1
label loop2
label cont2

if ln2 < 0 then
goto cont2
end if

place loop2
i2++
ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
ParserFlags::StringFlag = false
prs[i2] = Optimize(prs[i2])

if i2 = ln2 then
goto cont2
else
goto loop2
end if

place cont2

end if

ParserFlags::MetCallFlag = mcflgc
ParserFlags::IdentFlag = iflgc
ParserFlags::StringFlag = sflgc

goto fin
end if

//if i > j then
//ParserFlags::IdentFlag = false
//end if

//-------------------------------------------------------------------------------------
typ = gettype LSParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::IdentFlag = true then
ParserFlags::IdentFlag = false
exp = procIdentArrayAccess(exp, i)
i--
len = exp::Tokens[l] - 1

var aidt as Ident = exp::Tokens[i]
var arriloc as Expr = aidt::ArrLoc
arriloc = Optimize(arriloc)

else

if ParserFlags::MetCallFlag = true then
ParserFlags::MetCallFlag = false
exp = procMtdArrayAccess(exp, i)
i--
len = exp::Tokens[l] - 1

mcflgc = ParserFlags::MetCallFlag
iflgc = ParserFlags::IdentFlag
sflgc = ParserFlags::StringFlag

var amtd as MethodCallTok = exp::Tokens[i]
var amtdn as MethodNameTok = amtd::Name
arriloc = amtdn::ArrLoc
ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
ParserFlags::StringFlag = false
arriloc = Optimize(arriloc)

ParserFlags::MetCallFlag = mcflgc
ParserFlags::IdentFlag = iflgc
ParserFlags::StringFlag = sflgc

end if

end if
goto fin
end if

if i > j then
ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
ParserFlags::StringFlag = false
end if

//-------------------------------------------------------------------------------------


end if

place fin

if i >= len then
goto cont
else
goto loop
end if

else

//method chain code

i--


label fin2

mctok = exp::Tokens[i]

typ = gettype Ident
b = typ::IsInstanceOfType($object$mctok)

if b = true then
mcident = mctok
b = ParserFlags::MetCallFlag or ParserFlags::IdentFlag
if b = true then
ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
mcint = i + 1
mctok2 = exp::Tokens[mcint]
mcident::MemberAccessFlg = true
mcident::MemberToAccess = mctok2
exp::RemToken(mcint)
exp::Tokens[i] = mcident
end if
str = mcident::Value
b = ParseUtils::LikeOP(str, "::*")
if b = true then
ParserFlags::IdentFlag = true
end if
goto fin2
end if

typ = gettype MethodCallTok
b = typ::IsInstanceOfType($object$mctok)

if b = true then
mcmetcall = mctok
mcmetname = mcmetcall::Name
b = ParserFlags::MetCallFlag or ParserFlags::IdentFlag
if b = true then
ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
mcint = i + 1
mctok2 = exp::Tokens[mcint]
mcmetname::MemberAccessFlg = true
mcmetname::MemberToAccess = mctok2
exp::RemToken(mcint)
mcmetcall::Name = mcmetname
exp::Tokens[i] = mcmetcall
end if
str = mcmetname::Value
b = ParseUtils::LikeOP(str, "::*")
if b = true then
ParserFlags::MetCallFlag = true
end if
goto fin2
end if

typ = gettype StringLiteral
b = typ::IsInstanceOfType($object$mctok)

if b = true then
mcstr = mctok
b = ParserFlags::MetCallFlag or ParserFlags::IdentFlag
if b = true then
ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
mcint = i + 1
mctok2 = exp::Tokens[mcint]
mcstr::MemberAccessFlg = true
mcstr::MemberToAccess = mctok2
exp::RemToken(mcint)
exp::Tokens[i] = mcstr
end if
goto fin2
end if

place fin2

if i <= 0 then
goto cont
else
goto loop
end if

end if

place cont

if ParserFlags::MetChainFlag = false then
if mcbool = true then
ParserFlags::MetChainFlag = true
len = exp::Tokens[l]
i = len
mcbool = false
ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
ParserFlags::StringFlag = false
//if len > 1 then
goto loop
//end if
end if
else
ParserFlags::MetChainFlag = false
end if

ParserFlags::MetCallFlag = false
ParserFlags::IdentFlag = false
ParserFlags::StringFlag = false

return exp
end method

end class
