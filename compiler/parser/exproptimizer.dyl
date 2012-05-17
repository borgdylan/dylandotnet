//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi ExprOptimizer

	method public Expr procType(var stm as Expr, var i as integer)

		var lpt as Type = gettype LAParen
		var rpt as Type = gettype RAParen
		var oft as Type = gettype OfTok
		var ct as Type = gettype Comma
		var ttt as Type = gettype TypeTok
		var ampt as Type = gettype Ampersand
		var lrspt as Type = gettype LRSParen

		var isgeneric as boolean = false
		var j as integer = i
		var tt as TypeTok

		if i < (stm::Tokens[l] - 2) then
			isgeneric = lpt::IsInstanceOfType(stm::Tokens[i + 1]) and oft::IsInstanceOfType(stm::Tokens[i + 2])
		end if

		if isgeneric then

			var gtt as GenericTypeTok = new GenericTypeTok(stm::Tokens[i]::Value)
			i = i + 1
			stm::RemToken(i)
			stm::RemToken(i)
			i = i - 1

			var ep2 as Expr = new Expr()
			var lvl as integer = 1
			var len as integer = stm::Tokens[l] - 1

			do until i = len
				i = i + 1
				if lpt::IsInstanceOfType(stm::Tokens[i]) then
					ep2::AddToken(stm::Tokens[i])
					stm::RemToken(i)
					lvl = lvl + 1
					i = i - 1
					len = len - 1
				elseif ct::IsInstanceOfType(stm::Tokens[i]) then
					if lvl > 1 then
						ep2::AddToken(stm::Tokens[i])
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl <= 1 then
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens[0])
						ep2 = new Expr()
					end if
					i = i - 1
				elseif rpt::IsInstanceOfType(stm::Tokens[i]) then
					lvl = lvl - 1
					if lvl > 0 then
						ep2::AddToken(stm::Tokens[i])
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl = 0 then
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens[0])
						break
					end if
					i = i - 1
				else
					ep2::AddToken(stm::Tokens[i])
					stm::RemToken(i)
					i = i - 1
					len = len - 1
				end if
			end do
			tt = gtt
		else
			if ttt::IsInstanceOfType(stm::Tokens[i]) == false then
				tt = new TypeTok(stm::Tokens[i]::Value)
				tt::Line = stm::Tokens[i]::Line
			else
				tt = stm::Tokens[i]
			end if
		end if

		i = j
		var c as integer = 0

		do until c = 2
			c = c + 1
			if i < (stm::Tokens[l] - 1) then
				i = i + 1
				if lrspt::IsInstanceOfType(stm::Tokens[i]) then
					tt::IsArray = true
					stm::RemToken(i)
					i = i - 1
				elseif ampt::IsInstanceOfType(stm::Tokens[i]) then
					tt::IsByRef = true
					stm::RemToken(i)
					i = i - 1
				else
					break
				end if
			end if
		end do

		stm::Tokens[j] = tt

		return stm
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

	method public Expr procMtdName(var stm as Expr, var i as integer)

		var lpt as Type = gettype LAParen
		var rpt as Type = gettype RAParen
		var oft as Type = gettype OfTok
		var ct as Type = gettype Comma
		var ttt as Type = gettype MethodNameTok

		var isgeneric as boolean = false
		var j as integer = i
		var tt as MethodNameTok

		if i < (stm::Tokens[l] - 2) then
			isgeneric = lpt::IsInstanceOfType(stm::Tokens[i + 1]) and oft::IsInstanceOfType(stm::Tokens[i + 2])
		end if

		if isgeneric then

			var gtt as GenericMethodNameTok = new GenericMethodNameTok()
			gtt = IdentToMNTok($Ident$stm::Tokens[i], gtt)
			i = i + 1
			stm::RemToken(i)
			stm::RemToken(i)
			i = i - 1

			var ep2 as Expr = new Expr()
			var lvl as integer = 1
			var len as integer = stm::Tokens[l] - 1

			do until i = len
				i = i + 1
				if lpt::IsInstanceOfType(stm::Tokens[i]) then
					ep2::AddToken(stm::Tokens[i])
					stm::RemToken(i)
					lvl = lvl + 1
					i = i - 1
					len = len - 1
				elseif ct::IsInstanceOfType(stm::Tokens[i]) then
					if lvl > 1 then
						ep2::AddToken(stm::Tokens[i])
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl <= 1 then
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens[0])
						ep2 = new Expr()
					end if
					i = i - 1
				elseif rpt::IsInstanceOfType(stm::Tokens[i]) then
					lvl = lvl - 1
					if lvl > 0 then
						ep2::AddToken(stm::Tokens[i])
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl = 0 then
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens[0])
						break
					end if
					i = i - 1
				else
					ep2::AddToken(stm::Tokens[i])
					stm::RemToken(i)
					i = i - 1
					len = len - 1
				end if
			end do
			tt = gtt
		else
			if ttt::IsInstanceOfType(stm::Tokens[i]) == false then
				tt = new MethodNameTok()
				tt = IdentToMNTok($Ident$stm::Tokens[i],tt)
			else
				tt = $MethodNameTok$stm::Tokens[i]
			end if
		end if

		stm::Tokens[j] = tt

		return stm
	end method

	method public Expr checkVarAs(var stm as Expr, var b as boolean&)
		var typ as Type = gettype VarTok
		b = typ::IsInstanceOfType(stm::Tokens[0])
		var vars as VarExpr = new VarExpr()

		if b then
			stm = procType(stm,3)

			vars::Tokens = stm::Tokens
			vars::Line = stm::Line
			vars::VarName = stm::Tokens[1]

			//var typ2 as Type = gettype TypeTok

			//if typ2::IsInstanceOfType(stm::Tokens[3]) = false then
				//var t as Token = stm::Tokens[3]
				//var tt as TypeTok = new TypeTok()
				//tt::Line = t::Line
				//tt::Value = t::Value
				//vars::VarTyp = tt
			//else
				vars::VarTyp = stm::Tokens[3]
			//end if
		end if
		return vars
	end method

	method public Expr procMethodCall(var stm as Expr, var i as integer)
	
		var mn as MethodNameTok = new MethodNameTok()
		var mct as MethodCallTok = new MethodCallTok()
		var mntkt as Type = gettype MethodNameTok
		var ep2 as Expr = new Expr()
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		var ltyp2 as Type = gettype LAParen
		var rtyp2 as Type = gettype RAParen

		i = i - 1
		if mntkt::IsInstanceOfType(stm::Tokens[i]) then
			mn = $MethodNameTok$stm::Tokens[i]
		else
			mn = IdentToMNTok($Ident$stm::Tokens[i], mn)
		end if

		j = i
		i = i + 1

		var typ2 as Type
		var len as integer = stm::Tokens[l] - 1

		stm::RemToken(i)
		len = stm::Tokens[l] - 1
		i = i - 1

		label fin

		do until i = len

			//get parameters
			i = i + 1
	
			typ2 = gettype RParen
			if typ2::IsInstanceOfType(stm::Tokens[i]) or rtyp2::IsInstanceOfType(stm::Tokens[i]) then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					if ep2::Tokens[l] > 0 then
						mct::AddParam(ep2)
					end if
					stm::RemToken(i)
					len = stm::Tokens[l] - 1
					i = i - 1
					break
				else
					d = true
					goto fin
				end if
				goto fin
			end if

			typ2 = gettype LParen
			if typ2::IsInstanceOfType(stm::Tokens[i]) or ltyp2::IsInstanceOfType(stm::Tokens[i]) then
				lvl = lvl + 1
				d = true
				//stm::RemToken(i)
				len = stm::Tokens[l] - 1
				//i = i - 1
				goto fin
			end if

			typ2 = gettype Comma
			if typ2::IsInstanceOfType(stm::Tokens[i]) then
				if lvl = 1 then
					d = false
					if ep2::Tokens[l] > 0 then
						mct::AddParam(ep2)
					end if
					ep2 = new Expr()
					stm::RemToken(i)
					len = stm::Tokens[l] - 1
					i = i - 1
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
			
			if d then
				ep2::AddToken(stm::Tokens[i])
				stm::RemToken(i)
				len = stm::Tokens[l] - 1
				i = i - 1
			end if
	
		end do
	
		mct::Name = mn
		mct::Line = mn::Line
		stm::Tokens[j] = mct
	
		return stm
	
	end method

method public Expr procNewCall(var stm as Expr, var i as integer)

var nct as NewCallTok = new NewCallTok()
var nact as NewarrCallTok = new NewarrCallTok()
var tt as TypeTok
var ep2 as Expr = new Expr()
var lvl as integer = 1
var d as boolean = true
var j as integer = 0
var ltyp as Type
var rtyp as Type
var nab as boolean = false

tt = stm::Tokens[i]
j = i
i = i + 1

var tok2 as Token = stm::Tokens[i]
var typ2 as Type
var b2 as boolean
var len as integer = stm::Tokens[l] - 1

typ2 = gettype LParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
ltyp = gettype LParen
rtyp = gettype RParen
else
nab = true
ltyp = gettype LSParen
rtyp = gettype RSParen
end if

var ltyp2 as Type = gettype LAParen
var rtyp2 as Type = gettype RAParen

if nab = false then
nct::Name = tt
else
nact::ArrayType = tt
end if

stm::RemToken(i)
len = stm::Tokens[l] - 1
i = i - 1

label loop2
label cont2
label fin

place loop2

//get parameters
i = i + 1

tok2 = stm::Tokens[i]
typ2 = rtyp
b2 = rtyp::IsInstanceOfType($object$tok2) or rtyp2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl = lvl - 1
if lvl = 0 then
d = false
if ep2::Tokens[l] > 0 then
if nab = false then
nct::AddParam(ep2)
else
nact::ArrayLen = ep2
end if
end if
stm::RemToken(i)
len = stm::Tokens[l] - 1
i = i - 1
goto cont2
else
d = true
goto fin
end if
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = ltyp
b2 = ltyp::IsInstanceOfType($object$tok2) or ltyp2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl = lvl + 1
d = true
//stm::RemToken(i)
len = stm::Tokens[l] - 1
//i = i - 1
goto fin
end if

tok2 = stm::Tokens[i]
typ2 = gettype Comma
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
if lvl = 1 then
d = false
if ep2::Tokens[l] > 0 then
if nab = false then
nct::AddParam(ep2)
ep2 = new Expr()
end if
end if
stm::RemToken(i)
len = stm::Tokens[l] - 1
i = i - 1
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
i = i - 1
end if

if i = len then
goto cont2
else
goto loop2
end if

place cont2

if nab = false then
nct::Line = tt::Line
stm::Tokens[j] = nct
else
nact::Line = tt::Line
stm::Tokens[j] = nact
end if

return stm

end method

method public Expr procIdentArrayAccess(var stm as Expr, var i as integer)

var idt as Ident = null
var ep2 as Expr = new Expr()
var lvl as integer = 1
var d as boolean = true
var j as integer = 0

i = i - 1
idt = stm::Tokens[i]
j = i
i = i + 1

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean
var len as integer = stm::Tokens[l] - 1

stm::RemToken(i)
len = stm::Tokens[l] - 1
i = i - 1

label loop2
label cont2
label fin

place loop2

//get parameters
i = i + 1

tok2 = stm::Tokens[i]
typ2 = gettype RSParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl = lvl - 1
if lvl = 0 then
d = false
//mct::AddParam(ep2)
stm::RemToken(i)
len = stm::Tokens[l] - 1
i = i - 1
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
lvl = lvl + 1
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
i = i - 1
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

i = i - 1
mtd = stm::Tokens[i]
idt = mtd::Name
j = i
i = i + 1

var tok2 as Token = stm::Tokens[i]
var typ2 as System.Type
var b2 as boolean
var len as integer = stm::Tokens[l] - 1

stm::RemToken(i)
len = stm::Tokens[l] - 1
i = i - 1

label loop2
label cont2
label fin

place loop2

//get parameters
i = i + 1

tok2 = stm::Tokens[i]
typ2 = gettype RSParen
b2 = typ2::IsInstanceOfType($object$tok2)
if b2 = true then
lvl = lvl - 1
if lvl = 0 then
d = false
//mct::AddParam(ep2)
stm::RemToken(i)
len = stm::Tokens[l] - 1
i = i - 1
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
lvl = lvl + 1
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
i = i - 1
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
var mcbool as boolean = false
var mcflgc as boolean = false
var iflgc as boolean = false
var sflgc as boolean = false
var mctok as Token = null
var ptrmntok as MethodNameTok = null
var newavtok as Token = null
var newaexpr as Expr = null
var newattok as TypeTok = null
var mctok2 as Token = null
var mcident as Ident = null
var mcmetcall as MethodCallTok = null
var mcmetname as MethodNameTok = null
var mcstr as StringLiteral = null
var mcint as integer = 0
var lpt as Type = gettype LAParen
var oft as Type = gettype OfTok


label loop
label cont


if len < 0 then
goto cont
end if

place loop

if ParserFlags::MetChainFlag = false then

i = i + 1

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
i = i - 1
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
i = i - 1
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
i = i - 1
len = exp::Tokens[l] - 1
goto fin
end if

typ = gettype Pipe
b = typ::IsInstanceOfType($object$tok)

if b = true then
exp::RemToken(i)
i = i - 1
len = exp::Tokens[l] - 1
goto fin
end if

typ = gettype RefTok
b = typ::IsInstanceOfType($object$tok)

if b = true then
ParserFlags::isChanged = true
ParserFlags::RefFlag = true
exp::RemToken(i)
i = i - 1
len = exp::Tokens[l] - 1
goto fin
end if

typ = gettype ValInRefTok
b = typ::IsInstanceOfType($object$tok)

if b = true then
ParserFlags::isChanged = true
ParserFlags::ValinrefFlag = true
exp::RemToken(i)
i = i - 1
len = exp::Tokens[l] - 1
goto fin
end if

typ = gettype TypeTok
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::DurConvFlag <> false then
ParserFlags::ConvTyp = $TypeTok$exp::Tokens[i]
exp::RemToken(i)
i = i - 1
len = exp::Tokens[l] - 1
else
end if
goto fin
end if

typ = gettype Ident
b = typ::IsInstanceOfType($object$tok)

if b then
if ParserFlags::DurConvFlag = false then
b = ParserFlags::MetCallFlag or ParserFlags::IdentFlag or ParserFlags::StringFlag
if b then
mcbool = true
end if
ParserFlags::IdentFlag = true
if ParserFlags::isChanged then
exp::Tokens[i] = ParserFlags::UpdateIdent($Ident$exp::Tokens[i])
ParserFlags::SetUnaryFalse()
j = i
end if

//genericmethodnametok detector
if i < (exp::Tokens[l] - 2) then
	if lpt::IsInstanceOfType(exp::Tokens[i + 1]) and oft::IsInstanceOfType(exp::Tokens[i + 2]) then
		exp = procMtdName(exp, i)
		len = exp::Tokens[l] - 1
	end if
end if
//-----------------------------

else

//var tt2 as Ident = exp::Tokens[i]
//var tt3 as TypeTok = new TypeTok()
//tt3::Line = tt2::Line
//tt3::Value = tt2::Value

exp = procType(exp,i)
ParserFlags::ConvTyp = exp::Tokens[i]
exp::RemToken(i)
i = i - 1
len = exp::Tokens[l] - 1

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

typ = gettype MeTok
b = typ::IsInstanceOfType($object$tok)

if b = true then
if ParserFlags::isChanged = true then
var metk1 as MeTok = exp::Tokens[i]
exp::Tokens[i] = ParserFlags::UpdateMeTok(metk1)
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
len = len - 1

exp = procType(exp, i)
len = exp::Tokens[l] - 1

//typ = gettype TypeTok
//b = typ::IsInstanceOfType($object$nctok)

//if b <> true then
//ncttok = new TypeTok()
//ncttok::Line = nctok::Line
//ncttok::Value = nctok::Value
//exp::Tokens[i] = ncttok
//end if

exp = procNewCall(exp, i)
len = exp::Tokens[l] - 1

typ = gettype NewCallTok
b = typ::IsInstanceOfType($object$exp::Tokens[i])

if b = true then
//if output is newcall
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
nci2 = nci2 + 1
ncprs[nci2] = Optimize(ncprs[nci2])

if nci2 = ncln2 then
goto nccont2
else
goto ncloop2
end if

place nccont2

nctoken::Params = ncprs

else
//if output is newarrcall

var nactoken as NewarrCallTok = exp::Tokens[i]
nactoken::ArrayLen = Optimize(nactoken::ArrayLen)

end if

goto fin
end if

typ = gettype GettypeTok
b = typ::IsInstanceOfType($object$tok)

if b then

exp::RemToken(i)
len = len - 1

exp = procType(exp,i)
len = exp::Tokens[l] - 1

//typ = gettype TypeTok
//b = typ::IsInstanceOfType($object$gtctok)

//if b <> true then
//gtcttok = new TypeTok()
//gtcttok::Line = gtctok::Line
//gtcttok::Value = gtctok::Value
//exp::Tokens[i] = gtcttok
//end if

var gtctoken as GettypeCallTok = new GettypeCallTok()
gtctoken::Name = exp::Tokens[i]
exp::Tokens[i] = gtctoken

goto fin
end if


typ = gettype NewarrTok
b = typ::IsInstanceOfType($object$tok)

if b = true then

exp::RemToken(i)
len = len - 1

tok = exp::Tokens[i]

exp::RemToken(i)
len = len - 1

typ = gettype TypeTok
b = typ::IsInstanceOfType($object$tok)

if b <> true then
newattok = new TypeTok()
newattok::Line = tok::Line
newattok::Value = tok::Value
else
newattok = tok
end if

newavtok = exp::Tokens[i]

var newarrtoken as NewarrCallTok = new NewarrCallTok()
newarrtoken::ArrayType = newattok
newaexpr = new Expr()
newaexpr::AddToken(newavtok)
newarrtoken::ArrayLen = newaexpr

exp::Tokens[i] = newarrtoken

goto fin
end if


typ = gettype PtrTok
b = typ::IsInstanceOfType($object$tok)

if b = true then

exp::RemToken(i)
len = len - 1

ptrmntok = new MethodNameTok()
ptrmntok = IdentToMNTok($Ident$exp::Tokens[i] , ptrmntok)

var ptrctoken as PtrCallTok = new PtrCallTok()
ptrctoken::MetToCall = ptrmntok
exp::Tokens[i] = ptrctoken

//outer check for (
i = i + 1
if i <= len then
tok = exp::Tokens[i]
typ = gettype LParen
b = typ::IsInstanceOfType($object$tok)
if b = true then
exp::RemToken(i)
len = len - 1
//inner check for )
//-----------------
if i <= len then
tok = exp::Tokens[i]
typ = gettype RParen
b = typ::IsInstanceOfType($object$tok)
if b = true then
exp::RemToken(i)
len = len - 1
end if
end if
//-----------------
end if
end if

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
i = i - 1
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
i2 = i2 + 1
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
i = i - 1
len = exp::Tokens[l] - 1

var aidt as Ident = exp::Tokens[i]
var arriloc as Expr = aidt::ArrLoc
arriloc = Optimize(arriloc)

ParserFlags::IdentFlag = true
j = i

else

if ParserFlags::MetCallFlag = true then
ParserFlags::MetCallFlag = false
exp = procMtdArrayAccess(exp, i)
i = i - 1
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

ParserFlags::MetCallFlag = true
j = i
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

i = i - 1

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
b = ParseUtils::LikeOP(str, "^::(.)*$")
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
b = ParseUtils::LikeOP(str, "^::(.)*$")
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
