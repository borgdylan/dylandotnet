//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtOptimizer

method public Stmt checkRefasm(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype RefasmTok
valinref|b = typ::IsInstanceOfType($object$tok)
var refasms as RefasmStmt = new RefasmStmt()
if valinref|b = true then
refasms::Line = stm::Line
refasms::Tokens = stm::Tokens
refasms::AsmPath = stm::Tokens[1]
end if
return refasms
end method

method public Stmt checkDebug(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype DebugTok
valinref|b = typ::IsInstanceOfType($object$tok)
var dbgs as DebugStmt = new DebugStmt()
if valinref|b = true then
dbgs::Line = stm::Line
dbgs::Tokens = stm::Tokens
dbgs::Opt = stm::Tokens[1]
dbgs::setFlg()
end if
return dbgs
end method


method public Stmt checkImport(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype ImportTok
valinref|b = typ::IsInstanceOfType($object$tok)
var imps as ImportStmt = new ImportStmt()
if valinref|b = true then
imps::Line = stm::Line
imps::Tokens = stm::Tokens
imps::NS = stm::Tokens[1]
end if
return imps
end method

method public Stmt checkLocimport(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype LocimportTok
valinref|b = typ::IsInstanceOfType($object$tok)
var limps as LocimportStmt = new LocimportStmt()
if valinref|b = true then
limps::Line = stm::Line
limps::Tokens = stm::Tokens
limps::NS = stm::Tokens[1]
end if
return limps
end method

method public Stmt checkCmt(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype CommentTok
valinref|b = typ::IsInstanceOfType($object$tok)
var cmts as CommentStmt = new CommentStmt()
if valinref|b = true then
cmts::Line = stm::Line
cmts::Tokens = stm::Tokens
end if
return cmts
end method

method public Stmt checkEndMtd(var stm as Stmt, var b as boolean&)
if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype EndTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype MethodTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

var ems as EndMethodStmt = new EndMethodStmt()
if valinref|b = true then
ems::Line = stm::Line
ems::Tokens = stm::Tokens
end if
end if
return ems
end method

method public Stmt checkEndCls(var stm as Stmt, var b as boolean&)
if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype EndTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype ClassTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

var ecs as EndClassStmt = new EndClassStmt()
if valinref|b = true then
ecs::Line = stm::Line
ecs::Tokens = stm::Tokens
end if
end if
return ecs
end method

method public Stmt checkAssembly(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype AssemblyTok
valinref|b = typ::IsInstanceOfType($object$tok)
var asms as AssemblyStmt = new AssemblyStmt()
if valinref|b = true then
asms::Line = stm::Line
asms::Tokens = stm::Tokens
asms::AsmName = stm::Tokens[1]
asms::Mode = stm::Tokens[2]
end if
return asms
end method

method public Stmt checkVer(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype VerTok
valinref|b = typ::IsInstanceOfType($object$tok)
var vers as VerStmt = new VerStmt()
if valinref|b = true then
vers::Line = stm::Line
vers::Tokens = stm::Tokens
tok = stm::Tokens[1]
var ars as string[] = Utils.ParseUtils::StringParser(tok::Value,".")
var ari as integer[] = newarr integer 4
ari[0] = $integer$ars[0]
ari[1] = $integer$ars[1]
ari[2] = $integer$ars[2]
ari[3] = $integer$ars[3]
var intla as IntLiteral[] = newarr IntLiteral 4
var intl as IntLiteral = null
intl = new IntLiteral(ars[0])
intl::Line = tok::Line
intl::NumVal = ari[0]
intla[0] = intl
intl = new IntLiteral(ars[1])
intl::Line = tok::Line
intl::NumVal = ari[1]
intla[1] = intl
intl = new IntLiteral(ars[2])
intl::Line = tok::Line
intl::NumVal = ari[2]
intla[2] = intl
intl = new IntLiteral(ars[3])
intl::Line = tok::Line
intl::NumVal = ari[3]
intla[3] = intl
vers::VersionNos = intla
end if
return vers
end method

method public Stmt checkClass(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype ClassTok
valinref|b = typ::IsInstanceOfType($object$tok)
var clss as ClassStmt = new ClassStmt()
var att as Attributes.Attribute = null
if valinref|b = true then

clss::Line = stm::Line
clss::Tokens = stm::Tokens

label loop
label cont

var i as integer = 0
var len as integer = stm::Tokens[l] - 1
var bl as boolean = false

place loop

i++
tok = stm::Tokens[i]
typ = gettype Attributes.Attribute
bl = typ::IsInstanceOfType($object$tok)

if bl = true then
att = tok
clss::AddAttr(att)
else

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type = gettype ExtendsTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

if b2 = true then
i++
tok2 = stm::Tokens[i]
typ2 = gettype TypeTok
b2 = typ2::IsInstanceOfType($object$tok2)

if b2 <> true then
var t as Token = stm::Tokens[i]
var tt as TypeTok = new TypeTok()
tt::Line = t::Line
tt::Value = t::Value
clss::InhClass = tt
else
clss::InhClass = stm::Tokens[i]
end if
else
clss::ClassName = stm::Tokens[i]
end if

end if

if i = len then
goto cont
else
goto loop
end if

place cont

end if

return clss
end method

method public Stmt checkField(var stm as Stmt, var b as boolean&)

var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype FieldTok
valinref|b = typ::IsInstanceOfType($object$tok)
var flss as FieldStmt = new FieldStmt()
var att as Attributes.Attribute = null

if valinref|b = true then

var tempexp as Expr = new Expr()
tempexp::Tokens = stm::Tokens
var eop as ExprOptimizer = new ExprOptimizer()
ParserFlags::ProcessTTokOnly = true
tempexp = eop::Optimize(tempexp)
ParserFlags::ProcessTTokOnly = false
stm::Tokens = tempexp::Tokens

flss::Line = stm::Line
flss::Tokens = stm::Tokens

label loop
label cont

var i as integer = 0
var len as integer = stm::Tokens[l] - 3
var bl as boolean = false

place loop

i++
tok = stm::Tokens[i]
typ = gettype Attributes.Attribute
bl = typ::IsInstanceOfType($object$tok)

if bl = true then
att = tok
flss::AddAttr(att)
end if

if i = len then
goto cont
else
goto loop
end if

place cont

i++
var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type = gettype TypeTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

if b2 <> true then
var t as Token = stm::Tokens[i]
var tt as TypeTok = new TypeTok()
tt::Line = t::Line
tt::Value = t::Value
flss::FieldTyp = tt
else
flss::FieldTyp = stm::Tokens[i]
end if

i++
flss::FieldName = stm::Tokens[i]

end if

return flss
end method

method public Stmt checkMethod(var stm as Stmt, var b as boolean&)

var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype MethodTok
valinref|b = typ::IsInstanceOfType($object$tok)
var mtss as MethodStmt = new MethodStmt()
var att as Attributes.Attribute = new Attributes.Attribute()
var mn as Ident = new Ident()
var exp as Expr = null
var d as boolean = false

if valinref|b = true then

var tempexp as Expr = new Expr()
tempexp::Tokens = stm::Tokens
var eop as ExprOptimizer = new ExprOptimizer()
ParserFlags::ProcessTTokOnly = true
tempexp = eop::Optimize(tempexp)
ParserFlags::ProcessTTokOnly = false
stm::Tokens = tempexp::Tokens

mtss::Line = stm::Line
mtss::Tokens = stm::Tokens

label loop
label cont
label jumpl

var i as integer = 0
var len as integer = stm::Tokens[l] - 1
var bl as boolean = false

//loop to get attributes
place loop

i++
tok = stm::Tokens[i]
typ = gettype Attributes.Attribute
bl = typ::IsInstanceOfType($object$tok)

if bl = true then
att = tok
mtss::AddAttr(att)
else
i--
goto jumpl
end if

if i = len then
goto cont
else
goto loop
end if

place cont

place jumpl

//get return type and name
i++

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean

typ2 = gettype TypeTok
b2 = typ2::IsInstanceOfType($object$tok2)

if b2 <> true then
var t as Token = stm::Tokens[i]
var tt as TypeTok = new TypeTok()
tt::Line = t::Line
tt::Value = t::Value
mtss::RetTyp = tt
else
mtss::RetTyp = stm::Tokens[i]
end if

i++

tok2 = stm::Tokens[i]
typ2 = gettype Ident
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
mtss::MethodName = tok2
end if

label loop2
label cont2

i++
tok2 = stm::Tokens[i]
typ2 = gettype LParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then

place loop2

//get parameters
i++

tok2 = stm::Tokens[i]
typ2 = gettype RParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
if d = true then
var eopt2 as ExprOptimizer = new ExprOptimizer()
exp = eopt2::checkVarAs(exp,ref|bl)
if bl = true then
mtss::AddParam(exp)
end if
end if
d = false
goto cont2
end if

tok2 = stm::Tokens[i]
typ2 = gettype VarTok
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
d = true
exp = new Expr()
end if

tok2 = stm::Tokens[i]
typ2 = gettype Comma
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
var eopt1 as ExprOptimizer = new ExprOptimizer()
exp = eopt1::checkVarAs(exp,ref|bl)
if bl = true then
mtss::AddParam(exp)
end if
d = false
end if

if d = true then
exp::AddToken(stm::Tokens[i])
end if


if i = len then
goto cont2
else
goto loop2
end if

place cont2

end if

end if
return mtss
end method

method public Stmt checkMethodCall(var stm as Stmt, var b as boolean&)

if stm::Tokens[l] > 2 then
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype Ident
var tokb as Token = stm::Tokens[1]
var typb as System.Type = gettype LParen
var ba as boolean = typ::IsInstanceOfType($object$tok)
var bb as boolean = typb::IsInstanceOfType($object$tokb)

valinref|b = ba and bb

var mtcss as MethodCallStmt = new MethodCallStmt()
var mn as MethodNameTok = new MethodNameTok()
var mct as MethodCallTok = new MethodCallTok()
var idt as Ident = null
var exp as Expr = new Expr()
var lvl as integer = 1
var d as boolean = true
var i as integer = 1

if valinref|b = true then

mtcss::Line = stm::Line
mtcss::Tokens = stm::Tokens

idt = stm::Tokens[0]
mn::Line = idt::Line
mn::Value = idt::Value

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean
var len as integer = stm::Tokens[l]
var eopt as ExprOptimizer = new ExprOptimizer()

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
exp = eopt::Optimize(exp)
mct::AddParam(exp)
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
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype Comma
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
if lvl = 1 then
d = false
exp = eopt::Optimize(exp)
mct::AddParam(exp)
exp = new Expr()
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
exp::AddToken(stm::Tokens[i])
end if

if i = len then
goto cont2
else
goto loop2
end if

place cont2

mct::Name = mn
mtcss::MethodToken = mct

end if

end if
return mtcss
end method

method public Stmt checkVarAs(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype VarTok
valinref|b = typ::IsInstanceOfType($object$tok)
var vars as VarStmt = new VarStmt()

if valinref|b = true then
vars::Tokens = stm::Tokens
var tempexp as Expr = new Expr()
tempexp::Tokens = vars::Tokens
var eop as ExprOptimizer = new ExprOptimizer()
tempexp = eop::Optimize(tempexp)
vars::Tokens = tempexp::Tokens
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

method public Stmt AssOpt(var stm as Stmt)

var asss as AssignStmt = stm
var le as Expr = asss::LExp
var tok as Token = le::Tokens[0]
var typ as System.Type = gettype VarTok
var b as boolean = typ::IsInstanceOfType($object$tok)
var vass as VarAsgnStmt = new VarAsgnStmt()
if b = true then
vass::Tokens = asss::Tokens
vass::Line = asss::Line
vass::VarName = le::Tokens[1]

var tok2 as Token = le::Tokens[3]
var typ2 as System.Type = gettype TypeTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

if b2 <> true then
var t as Token = le::Tokens[3]
var tt as TypeTok = new TypeTok()
tt::Line = t::Line
tt::Value = t::Value
vass::VarTyp = tt
else
vass::VarTyp = le::Tokens[3]
end if

vass::RExpr = asss::RExp
var eop as ExprOptimizer = new ExprOptimizer()
vass::RExpr = eop::Optimize(vass::RExpr)

return vass
else
return stm
end if

end method

method public Stmt checkAssign(var stm as Stmt, var b as boolean&)
var tok as Token = null
var typ as System.Type = gettype AssignOp
var asss as AssignStmt = new AssignStmt()
var c as boolean = false
var re as Expr = new Expr()
var le as Expr = new Expr()
var i as integer = -1
var len as integer = stm::Tokens[l] - 1
var assind as integer = 0

label loop
label cont

place loop

i++

tok = stm::Tokens[i]
c = typ::IsInstanceOfType($objecct$tok)

if c = true then
assind = i
goto cont
end if

if i = len then
goto cont
else 
goto loop
end if

place cont

if assind <> 0 then

i = -1
len = assind - 1

label loop2
label cont2

place loop2

i++

le::AddToken(stm::Tokens[i])

if i = len then
goto cont2
else
goto loop2
end if

place cont2


i = assind
len = stm::Tokens[l] - 1

label loop3
label cont3

place loop3

i++

re::AddToken(stm::Tokens[i])

if i = len then
goto cont3
else
goto loop3
end if

place cont3

var eop as ExprOptimizer = new ExprOptimizer()
re = eop::Optimize(re)
le = eop::Optimize(le)

asss::Line = stm::Line
asss::Tokens = stm::Tokens
asss::LExp = le
asss::RExp = re

valinref|b = true

asss = AssOpt(asss)

return asss

else
valinref|b = false
return stm

end if

end method

method public Stmt Optimize(var stm as Stmt)

//Console::WriteLine(stm::Line)

var i as integer = -1
var len as integer = stm::Tokens[l]
var to as TokenOptimizer = null
var tmpstm as Stmt = null
var compb as boolean = false
len--

ParserFlags::IfFlag = false
ParserFlags::CmtFlag = false
ParserFlags::NoOptFlag = false

label loop
label cont
label fin

if len < 0 then
goto cont
end if

place loop

i++

if ParserFlags::CmtFlag = true then
goto cont
end if


if ParserFlags::NoOptFlag = true then
goto cont
end if

to = new TokenOptimizer()
stm::Tokens[i] = to::Optimize(stm::Tokens[i])

if i = len then
goto cont
else
goto loop
end if

place cont

if stm::Tokens[l] = 0 then
goto fin
end if

tmpstm = checkCmt(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkImport(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkLocimport(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkAssembly(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkVer(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkClass(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkField(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkMethod(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkMethodCall(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkAssign(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkVarAs(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkEndMtd(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkEndCls(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkDebug(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkRefasm(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

place fin

return stm
end method

end class