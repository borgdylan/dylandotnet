//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
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

method public Stmt checkRefstdasm(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype RefstdasmTok
valinref|b = typ::IsInstanceOfType($object$tok)
var refsasms as RefstdasmStmt = new RefstdasmStmt()
if valinref|b = true then
refsasms::Line = stm::Line
refsasms::Tokens = stm::Tokens
refsasms::AsmPath = stm::Tokens[1]
end if
return refsasms
end method

method public Stmt checkInclude(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype IncludeTok
valinref|b = typ::IsInstanceOfType($object$tok)
var inclus as IncludeStmt = new IncludeStmt()
if valinref|b = true then
inclus::Line = stm::Line
inclus::Tokens = stm::Tokens
inclus::Path = stm::Tokens[1]
end if
return inclus
end method


method public Stmt checkIf(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype IfTok
valinref|b = typ::IsInstanceOfType($object$tok)
var ifs as IfStmt = new IfStmt()
var exp as Expr = new Expr()

if valinref|b = true then

ifs::Line = stm::Line
ifs::Tokens = stm::Tokens

var i as integer = 0
var len as integer = stm::Tokens[l] - 1
var b2 as boolean

label cont
label loop

place loop

i++

tok = stm::Tokens[i]
typ = gettype ThenTok
b2 = typ::IsInstanceOfType($object$tok)


if b2 = true then
goto cont
else
exp::AddToken(tok)
end if

if i = len then
goto cont
else
goto loop
end if

place cont

var eop as ExprOptimizer = new ExprOptimizer()
exp = eop::Optimize(exp)
ifs::Exp = exp

end if

return ifs
end method

method public Stmt checkWhile(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype WhileTok
valinref|b = typ::IsInstanceOfType($object$tok)
var whis as WhileStmt = new WhileStmt()
var exp as Expr = new Expr()

if valinref|b = true then

whis::Line = stm::Line
whis::Tokens = stm::Tokens

var i as integer = 0
var len as integer = stm::Tokens[l] - 1

label cont
label loop

place loop

i++

tok = stm::Tokens[i]
exp::AddToken(tok)

if i = len then
goto cont
else
goto loop
end if

place cont

var eop as ExprOptimizer = new ExprOptimizer()
exp = eop::Optimize(exp)
whis::Exp = exp

end if

return whis
end method

method public Stmt checkDoWhile(var stm as Stmt, var b as boolean&)

var whis as DoWhileStmt = null

if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype DoTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype WhileTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

whis = new DoWhileStmt()
var exp as Expr = new Expr()
var tok as Token

if valinref|b = true then

whis::Line = stm::Line
whis::Tokens = stm::Tokens

var i as integer = 1
var len as integer = stm::Tokens[l] - 1

label cont
label loop

place loop

i++

tok = stm::Tokens[i]
exp::AddToken(tok)

if i = len then
goto cont
else
goto loop
end if

place cont

var eop as ExprOptimizer = new ExprOptimizer()
exp = eop::Optimize(exp)
whis::Exp = exp

end if

end if

return whis
end method

method public Stmt checkUntil(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype UntilTok
valinref|b = typ::IsInstanceOfType($object$tok)
var unts as UntilStmt = new UntilStmt()
var exp as Expr = new Expr()

if valinref|b = true then

unts::Line = stm::Line
unts::Tokens = stm::Tokens

var i as integer = 0
var len as integer = stm::Tokens[l] - 1

label cont
label loop

place loop

i++

tok = stm::Tokens[i]
exp::AddToken(tok)

if i = len then
goto cont
else
goto loop
end if

place cont

var eop as ExprOptimizer = new ExprOptimizer()
exp = eop::Optimize(exp)
unts::Exp = exp

end if

return unts
end method

method public Stmt checkDoUntil(var stm as Stmt, var b as boolean&)

var unts as DoUntilStmt = null

if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype DoTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype UntilTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

unts = new DoUntilStmt()
var exp as Expr = new Expr()

if valinref|b = true then

unts::Line = stm::Line
unts::Tokens = stm::Tokens

var i as integer = 1
var len as integer = stm::Tokens[l] - 1
var tok as Token

label cont
label loop

place loop

i++

tok = stm::Tokens[i]
exp::AddToken(tok)

if i = len then
goto cont
else
goto loop
end if

place cont

var eop as ExprOptimizer = new ExprOptimizer()
exp = eop::Optimize(exp)
unts::Exp = exp

end if

end if

return unts
end method

method public Stmt checkElseIf(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype ElseIfTok
valinref|b = typ::IsInstanceOfType($object$tok)
var ifs as ElseIfStmt = new ElseIfStmt()
var exp as Expr = new Expr()

if valinref|b = true then

ifs::Line = stm::Line
ifs::Tokens = stm::Tokens

var i as integer = 0
var len as integer = stm::Tokens[l] - 1
var b2 as boolean

label cont
label loop

place loop

i++

tok = stm::Tokens[i]
typ = gettype ThenTok
b2 = typ::IsInstanceOfType($object$tok)


if b2 = true then
goto cont
else
exp::AddToken(tok)
end if

if i = len then
goto cont
else
goto loop
end if

place cont

var eop as ExprOptimizer = new ExprOptimizer()
exp = eop::Optimize(exp)
ifs::Exp = exp

end if

return ifs
end method

method public Stmt checkLabel(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype LabelTok
valinref|b = typ::IsInstanceOfType($object$tok)
var lbls as LabelStmt = new LabelStmt()
if valinref|b = true then
lbls::Line = stm::Line
lbls::Tokens = stm::Tokens
lbls::LabelName = stm::Tokens[1]
end if
return lbls
end method

method public Stmt checkPlace(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype PlaceTok
valinref|b = typ::IsInstanceOfType($object$tok)
var lbls as PlaceStmt = new PlaceStmt()
if valinref|b = true then
lbls::Line = stm::Line
lbls::Tokens = stm::Tokens
lbls::LabelName = stm::Tokens[1]
end if
return lbls
end method

method public Stmt checkGoto(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype GotoTok
valinref|b = typ::IsInstanceOfType($object$tok)
var lbls as GotoStmt = new GotoStmt()
if valinref|b = true then
lbls::Line = stm::Line
lbls::Tokens = stm::Tokens
lbls::LabelName = stm::Tokens[1]
end if
return lbls
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

method public Stmt checkScope(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype ScopeTok
valinref|b = typ::IsInstanceOfType($object$tok)
var scps as ScopeStmt = new ScopeStmt()
if valinref|b = true then
scps::Line = stm::Line
scps::Tokens = stm::Tokens
scps::Opt = stm::Tokens[1]
scps::setFlg()
end if
return scps
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

method public Stmt checkNS(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype NamespaceTok
valinref|b = typ::IsInstanceOfType($object$tok)
var nss as NSStmt = new NSStmt()
if valinref|b = true then
nss::Line = stm::Line
nss::Tokens = stm::Tokens
nss::NS = stm::Tokens[1]
end if
return nss
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

method public Stmt checkReturn(var stm as Stmt, var b as boolean&)
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype ReturnTok
valinref|b = typ::IsInstanceOfType($object$tok)
var rets as ReturnStmt = new ReturnStmt()
if valinref|b = true then

rets::Line = stm::Line
rets::Tokens = stm::Tokens

label fin
label loop
label cont

var i as integer = 0
var len as integer = stm::Tokens[l] - 1
var exp as Expr = null

if stm::Tokens[l] = 1 then
rets::RExp = null
goto fin
end if

if stm::Tokens[l] >= 2 then

exp = new Expr()

place loop

i++

exp::AddToken(stm::Tokens[i])

if i = len then
goto cont
else
goto loop
end if 

place cont

var eopt as ExprOptimizer = new ExprOptimizer()
exp = eopt::Optimize(exp)
rets::RExp = exp

end if

place fin

end if

return rets
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

method public Stmt checkElse(var stm as Stmt, var b as boolean&)
var els as ElseStmt = null

if stm::Tokens[l] < 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype ElseTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

valinref|b = b1

els = new ElseStmt()
if valinref|b = true then
els::Line = stm::Line
els::Tokens = stm::Tokens
end if
end if
return els
end method

method public Stmt checkDo(var stm as Stmt, var b as boolean&)
var ds as DoStmt = null

if stm::Tokens[l] < 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype DoTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

valinref|b = b1

ds = new DoStmt()
if valinref|b = true then
ds::Line = stm::Line
ds::Tokens = stm::Tokens
end if
end if
return ds
end method

method public Stmt checkBreak(var stm as Stmt, var b as boolean&)
var bs as BreakStmt = null

if stm::Tokens[l] < 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype BreakTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

valinref|b = b1

bs = new BreakStmt()
if valinref|b = true then
bs::Line = stm::Line
bs::Tokens = stm::Tokens
end if
end if
return bs
end method

method public Stmt checkContinue(var stm as Stmt, var b as boolean&)
var cs as ContinueStmt = null

if stm::Tokens[l] < 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype ContinueTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

valinref|b = b1

cs = new ContinueStmt()
if valinref|b = true then
cs::Line = stm::Line
cs::Tokens = stm::Tokens
end if
end if
return cs
end method


method public Stmt checkEndIf(var stm as Stmt, var b as boolean&)

var eifs as EndIfStmt = null

if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype EndTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype IfTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

eifs = new EndIfStmt()
if valinref|b = true then
eifs::Line = stm::Line
eifs::Tokens = stm::Tokens
end if
end if
return eifs
end method


method public Stmt checkEndMtd(var stm as Stmt, var b as boolean&)
var ems as EndMethodStmt = null

if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype EndTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype MethodTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

ems = new EndMethodStmt()
if valinref|b = true then
ems::Line = stm::Line
ems::Tokens = stm::Tokens
end if
end if
return ems
end method

method public Stmt checkEndNS(var stm as Stmt, var b as boolean&)
var ens as EndNSStmt = null

if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype EndTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype NamespaceTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

ens = new EndNSStmt()
if valinref|b = true then
ens::Line = stm::Line
ens::Tokens = stm::Tokens
end if
end if
return ens
end method


method public Stmt checkEndCls(var stm as Stmt, var b as boolean&)
var ecs as EndClassStmt = null

if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype EndTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype ClassTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

ecs = new EndClassStmt()
if valinref|b = true then
ecs::Line = stm::Line
ecs::Tokens = stm::Tokens
end if
end if
return ecs
end method

method public Stmt checkEndDo(var stm as Stmt, var b as boolean&)
var eds as EndDoStmt = null

if stm::Tokens[l] >= 2 then

var tok1 as Token = stm::Tokens[0]
var typ1 as System.Type = gettype EndTok
var b1 as boolean = typ1::IsInstanceOfType($object$tok1)

var tok2 as Token = stm::Tokens[1]
var typ2 as System.Type = gettype DoTok
var b2 as boolean = typ2::IsInstanceOfType($object$tok2)

valinref|b = b1 and b2

eds = new EndDoStmt()
if valinref|b = true then
eds::Line = stm::Line
eds::Tokens = stm::Tokens
end if
end if
return eds
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

method public Stmt checkDelegate(var stm as Stmt, var b as boolean&)

var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype DelegateTok
valinref|b = typ::IsInstanceOfType($object$tok)
var dels as DelegateStmt = new DelegateStmt()
var att as Attributes.Attribute = new Attributes.Attribute()
var deln as Ident = new Ident()
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

dels::Line = stm::Line
dels::Tokens = stm::Tokens

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
dels::AddAttr(att)
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
dels::RetTyp = tt
else
dels::RetTyp = stm::Tokens[i]
end if

i++

tok2 = stm::Tokens[i]
typ2 = gettype Ident
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
dels::DelegateName = tok2
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
dels::AddParam(exp)
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
dels::AddParam(exp)
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
return dels
end method

method public Stmt checkMethodCall(var stm as Stmt, var b as boolean&)

if stm::Tokens[l] > 2 then
var tok as Token = stm::Tokens[0]
var typ as System.Type = gettype Ident
//var tokb as Token = stm::Tokens[1]
//var typb as System.Type = gettype LParen
var ba as boolean = typ::IsInstanceOfType($object$tok)
//var bb as boolean = typb::IsInstanceOfType($object$tokb)

valinref|b = ba

var mtcss as MethodCallStmt = new MethodCallStmt()

if valinref|b = true then

mtcss::Line = stm::Line
mtcss::Tokens = stm::Tokens

var eopt as ExprOptimizer = new ExprOptimizer()
var exp as Expr = new Expr()
exp::Line = stm::Line
exp::Tokens = stm::Tokens
exp = eopt::Optimize(exp)
mtcss::MethodToken = exp::Tokens[0]

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

tmpstm = checkNS(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkClass(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkDelegate(stm, ref|compb)

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

tmpstm = checkReturn(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkEndMtd(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkEndNS(stm, ref|compb)

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

tmpstm = checkScope(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkInclude(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkRefasm(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkRefstdasm(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkLabel(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkPlace(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkGoto(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkIf(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkWhile(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkUntil(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkDoWhile(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkDoUntil(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if


tmpstm = checkElseIf(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkElse(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkDo(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkBreak(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkContinue(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkEndIf(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkEndDo(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if

tmpstm = checkMethodCall(stm, ref|compb)

if compb = true then
stm = tmpstm
goto fin
end if


place fin

return stm
end method

end class
