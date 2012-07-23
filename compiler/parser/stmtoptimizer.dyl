//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtOptimizer

	field public ParserFlags PFlags
	
	method public void StmtOptimizer()
		me::ctor()
		PFlags = new ParserFlags()
	end method
	
	method public void StmtOptimizer(var pf as ParserFlags)
		me::ctor()
		PFlags = pf
	end method

	method public Stmt checkRefasm(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype RefasmTok
	b = typ::IsInstanceOfType(tok)
	var refasms as RefasmStmt = new RefasmStmt()
	if b then
	refasms::Line = stm::Line
	refasms::Tokens = stm::Tokens
	refasms::AsmPath = stm::Tokens[1]
	end if
	return refasms
	end method
	
	method public Stmt checkRefstdasm(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype RefstdasmTok
	b = typ::IsInstanceOfType(tok)
	var refsasms as RefstdasmStmt = new RefstdasmStmt()
	if b then
	refsasms::Line = stm::Line
	refsasms::Tokens = stm::Tokens
	refsasms::AsmPath = stm::Tokens[1]
	end if
	return refsasms
	end method
	
	method public Stmt checkInclude(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype IncludeTok
	b = typ::IsInstanceOfType(tok)
	var inclus as IncludeStmt = new IncludeStmt()
	if b then
	inclus::Line = stm::Line
	inclus::Tokens = stm::Tokens
	inclus::Path = stm::Tokens[1]
	end if
	return inclus
	end method
	
	
	method public Stmt checkIf(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype IfTok
	b = typ::IsInstanceOfType(tok)
	var ifs as IfStmt = new IfStmt()
	var exp as Expr = new Expr()
	
	if b then
	
	ifs::Line = stm::Line
	ifs::Tokens = stm::Tokens
	
	var i as integer = 0
	var len as integer = stm::Tokens[l] - 1
	var b2 as boolean
	
	label cont
	label loop
	
	place loop
	
	i = i + 1
	
	tok = stm::Tokens[i]
	typ = gettype ThenTok
	b2 = typ::IsInstanceOfType(tok)
	
	
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
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eop::Optimize(exp)
	ifs::Exp = exp
	
	end if
	
	return ifs
	end method
	
	method public Stmt checkWhile(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype WhileTok
	b = typ::IsInstanceOfType(tok)
	var whis as WhileStmt = new WhileStmt()
	var exp as Expr = new Expr()
	
	if b then
	
	whis::Line = stm::Line
	whis::Tokens = stm::Tokens
	
	var i as integer = 0
	var len as integer = stm::Tokens[l] - 1
	
	label cont
	label loop
	
	place loop
	
	i = i + 1
	
	tok = stm::Tokens[i]
	exp::AddToken(tok)
	
	if i = len then
	goto cont
	else
	goto loop
	end if
	
	place cont
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eop::Optimize(exp)
	whis::Exp = exp
	
	end if
	
	return whis
	end method
	
	method public Stmt checkDoWhile(var stm as Stmt, var b as boolean&)
	
	var whis as DoWhileStmt = null
	
	if stm::Tokens[l] >= 2 then
	
	var typ1 as Type = gettype DoTok
	var typ2 as Type = gettype WhileTok
	
	b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])
	
	whis = new DoWhileStmt()
	var exp as Expr = new Expr()
	var tok as Token
	
	if b then
	
	whis::Line = stm::Line
	whis::Tokens = stm::Tokens
	
	var i as integer = 1
	var len as integer = stm::Tokens[l] - 1
	
	label cont
	label loop
	
	place loop
	
	i = i + 1
	
	tok = stm::Tokens[i]
	exp::AddToken(tok)
	
	if i = len then
	goto cont
	else
	goto loop
	end if
	
	place cont
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eop::Optimize(exp)
	whis::Exp = exp
	
	end if
	
	end if
	
	return whis
	end method
	
	method public Stmt checkUntil(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype UntilTok
	b = typ::IsInstanceOfType(tok)
	var unts as UntilStmt = new UntilStmt()
	var exp as Expr = new Expr()
	
	if b then
	
	unts::Line = stm::Line
	unts::Tokens = stm::Tokens
	
	var i as integer = 0
	var len as integer = stm::Tokens[l] - 1
	
	label cont
	label loop
	
	place loop
	
	i = i + 1
	
	tok = stm::Tokens[i]
	exp::AddToken(tok)
	
	if i = len then
	goto cont
	else
	goto loop
	end if
	
	place cont
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eop::Optimize(exp)
	unts::Exp = exp
	
	end if
	
	return unts
	end method
	
	method public Stmt checkDoUntil(var stm as Stmt, var b as boolean&)
	
	var unts as DoUntilStmt = null
	
	if stm::Tokens[l] >= 2 then
	
	var typ1 as Type = gettype DoTok
	var typ2 as Type = gettype UntilTok
	
	b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])
	
	unts = new DoUntilStmt()
	var exp as Expr = new Expr()
	
	if b then
	
	unts::Line = stm::Line
	unts::Tokens = stm::Tokens
	
	var i as integer = 1
	var len as integer = stm::Tokens[l] - 1
	var tok as Token
	
	label cont
	label loop
	
	place loop
	
	i = i + 1
	
	tok = stm::Tokens[i]
	exp::AddToken(tok)
	
	if i = len then
	goto cont
	else
	goto loop
	end if
	
	place cont
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eop::Optimize(exp)
	unts::Exp = exp
	
	end if
	
	end if
	
	return unts
	end method
	
	method public Stmt checkElseIf(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype ElseIfTok
	b = typ::IsInstanceOfType(tok)
	var ifs as ElseIfStmt = new ElseIfStmt()
	var exp as Expr = new Expr()
	
	if b then
	
	ifs::Line = stm::Line
	ifs::Tokens = stm::Tokens
	
	var i as integer = 0
	var len as integer = stm::Tokens[l] - 1
	var b2 as boolean
	
	label cont
	label loop
	
	place loop
	
	i = i + 1
	
	tok = stm::Tokens[i]
	typ = gettype ThenTok
	b2 = typ::IsInstanceOfType(tok)
	
	
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
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eop::Optimize(exp)
	ifs::Exp = exp
	
	end if
	
	return ifs
	end method
	
	method public Stmt checkLabel(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype LabelTok
	b = typ::IsInstanceOfType(tok)
	var lbls as LabelStmt = new LabelStmt()
	if b then
	lbls::Line = stm::Line
	lbls::Tokens = stm::Tokens
	lbls::LabelName = stm::Tokens[1]
	end if
	return lbls
	end method
	
	method public Stmt checkPlace(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype PlaceTok
	b = typ::IsInstanceOfType(tok)
	var lbls as PlaceStmt = new PlaceStmt()
	if b then
	lbls::Line = stm::Line
	lbls::Tokens = stm::Tokens
	lbls::LabelName = stm::Tokens[1]
	end if
	return lbls
	end method
	
	method public Stmt checkGoto(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype GotoTok
	b = typ::IsInstanceOfType(tok)
	var lbls as GotoStmt = new GotoStmt()
	if b then
	lbls::Line = stm::Line
	lbls::Tokens = stm::Tokens
	lbls::LabelName = stm::Tokens[1]
	end if
	return lbls
	end method
	
	
	method public Stmt checkDebug(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype DebugTok
	b = typ::IsInstanceOfType(tok)
	var dbgs as DebugStmt = new DebugStmt()
	if b then
	dbgs::Line = stm::Line
	dbgs::Tokens = stm::Tokens
	dbgs::Opt = stm::Tokens[1]
	dbgs::setFlg()
	end if
	return dbgs
	end method
	
	method public Stmt checkScope(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype ScopeTok
	b = typ::IsInstanceOfType(tok)
	var scps as ScopeStmt = new ScopeStmt()
	if b then
	scps::Line = stm::Line
	scps::Tokens = stm::Tokens
	scps::Opt = stm::Tokens[1]
	scps::setFlg()
	end if
	return scps
	end method
	
	method public Stmt checkImport(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype ImportTok
	b = typ::IsInstanceOfType(tok)
	var imps as ImportStmt = new ImportStmt()
	if b then
	imps::Line = stm::Line
	imps::Tokens = stm::Tokens
	imps::NS = stm::Tokens[1]
	end if
	return imps
	end method
	
	method public Stmt checkNS(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype NamespaceTok
	b = typ::IsInstanceOfType(tok)
	var nss as NSStmt = new NSStmt()
	if b then
	nss::Line = stm::Line
	nss::Tokens = stm::Tokens
	nss::NS = stm::Tokens[1]
	end if
	return nss
	end method
	
	method public Stmt checkLocimport(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype LocimportTok
	b = typ::IsInstanceOfType(tok)
	var limps as LocimportStmt = new LocimportStmt()
	if b then
	limps::Line = stm::Line
	limps::Tokens = stm::Tokens
	limps::NS = stm::Tokens[1]
	end if
	return limps
	end method
	
	method public Stmt checkReturn(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype ReturnTok
	b = typ::IsInstanceOfType(tok)
	var rets as ReturnStmt = new ReturnStmt()
	if b then
	
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
	
	i = i + 1
	
	exp::AddToken(stm::Tokens[i])
	
	if i = len then
	goto cont
	else
	goto loop
	end if 
	
	place cont
	
	var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eopt::Optimize(exp)
	rets::RExp = exp
	
	end if
	
	place fin
	
	end if
	
	return rets
	end method
	
		method public Stmt checkThrow(var stm as Stmt, var b as boolean&)
	
			var tok as Token = stm::Tokens[0]
			var typ as Type = gettype ThrowTok
			b = typ::IsInstanceOfType(tok)
			var tros as ThrowStmt = new ThrowStmt()
	
			if b then
	
				tros::Line = stm::Line
				tros::Tokens = stm::Tokens
	
				var i as integer = 0
				var len as integer = stm::Tokens[l] - 1
				var exp as Expr = null
			
				if stm::Tokens[l] >= 2 then
					exp = new Expr()
					do until i = len
						i = i + 1
						exp::AddToken(stm::Tokens[i])
					end do
			
					var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
					tros::RExp = eopt::Optimize(exp)
				end if
		
			end if
	
			return tros
		end method
		
	
	method public Stmt checkCmt(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype CommentTok
	b = typ::IsInstanceOfType(tok)
	var cmts as CommentStmt = new CommentStmt()
	if b then
	cmts::Line = stm::Line
	cmts::Tokens = stm::Tokens
	end if
	return cmts
	end method
	
	method public Stmt checkElse(var stm as Stmt, var b as boolean&)
	var els as ElseStmt = null
	
	if stm::Tokens[l] < 2 then
	
	var typ1 as Type = gettype ElseTok
	
	b = typ1::IsInstanceOfType(stm::Tokens[0])
	
	els = new ElseStmt()
	if b then
	els::Line = stm::Line
	els::Tokens = stm::Tokens
	end if
	end if
	return els
	end method
	
	method public Stmt checkDo(var stm as Stmt, var b as boolean&)
	var ds as DoStmt = null
	
	if stm::Tokens[l] < 2 then
	
	var typ1 as Type = gettype DoTok
	
	b = typ1::IsInstanceOfType(stm::Tokens[0])
	
	ds = new DoStmt()
	if b then
	ds::Line = stm::Line
	ds::Tokens = stm::Tokens
	end if
	end if
	return ds
	end method
	
		method public Stmt checkTry(var stm as Stmt, var b as boolean&)
			var ts as TryStmt = null
	
			if stm::Tokens[l] < 2 then
				var typ1 as Type = gettype TryTok
				b = typ1::IsInstanceOfType(stm::Tokens[0])
				ts = new TryStmt()
	
				if b then
					ts::Line = stm::Line
					ts::Tokens = stm::Tokens
				end if
			end if
			return ts
		end method
	
		method public Stmt checkFinally(var stm as Stmt, var b as boolean&)
			var ts as FinallyStmt = null
	
			if stm::Tokens[l] < 2 then
				var typ1 as Type = gettype FinallyTok
				b = typ1::IsInstanceOfType(stm::Tokens[0])
				ts = new FinallyStmt()
	
				if b then
					ts::Line = stm::Line
					ts::Tokens = stm::Tokens
				end if
			end if
			return ts
		end method
	
	
	method public Stmt checkBreak(var stm as Stmt, var b as boolean&)
	var bs as BreakStmt = null
	
	if stm::Tokens[l] < 2 then
	
	var typ1 as Type = gettype BreakTok
	
	b = typ1::IsInstanceOfType(stm::Tokens[0])
	
	bs = new BreakStmt()
	if b then
	bs::Line = stm::Line
	bs::Tokens = stm::Tokens
	end if
	end if
	return bs
	end method
	
	method public Stmt checkContinue(var stm as Stmt, var b as boolean&)
	var cs as ContinueStmt = null
	
	if stm::Tokens[l] < 2 then
	
	var typ1 as Type = gettype ContinueTok
	
	b = typ1::IsInstanceOfType(stm::Tokens[0])
	
	cs = new ContinueStmt()
	if b then
	cs::Line = stm::Line
	cs::Tokens = stm::Tokens
	end if
	end if
	return cs
	end method
	
	
	method public Stmt checkEndIf(var stm as Stmt, var b as boolean&)
		var eifs as EndIfStmt = null
	
		if stm::Tokens[l] >= 2 then

			var typ1 as Type = gettype EndTok
			var typ2 as Type = gettype IfTok
	
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])
	
			if b then
				eifs = new EndIfStmt()
				eifs::Line = stm::Line
				eifs::Tokens = stm::Tokens
			end if
		end if
		return eifs
	end method
	
	
	method public Stmt checkEndMtd(var stm as Stmt, var b as boolean&)
		var ems as EndMethodStmt = null
	
		if stm::Tokens[l] >= 2 then
	
			var typ1 as Type = gettype EndTok
			var typ2 as Type = gettype MethodTok
	
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])
	
			if b then
				ems = new EndMethodStmt()
				ems::Line = stm::Line
				ems::Tokens = stm::Tokens
			end if
		end if
		return ems
	end method
	
	method public Stmt checkEndNS(var stm as Stmt, var b as boolean&)
		var ens as EndNSStmt = null
	
		if stm::Tokens[l] >= 2 then

			var typ1 as Type = gettype EndTok	
			var typ2 as Type = gettype NamespaceTok
				
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])
	
			if b then
				ens = new EndNSStmt()
				ens::Line = stm::Line
				ens::Tokens = stm::Tokens
			end if
		end if
		return ens
	end method
	
	
	method public Stmt checkEndCls(var stm as Stmt, var b as boolean&)
		var ecs as EndClassStmt = null
	
		if stm::Tokens[l] >= 2 then
	
			var typ1 as Type = gettype EndTok
			var typ2 as Type = gettype ClassTok
			var typ3 as Type = gettype StructTok
	
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and (typ2::IsInstanceOfType(stm::Tokens[1]) or typ3::IsInstanceOfType(stm::Tokens[1]))
	
			if b then
				ecs = new EndClassStmt()
				ecs::Line = stm::Line
				ecs::Tokens = stm::Tokens
			end if
		end if
		return ecs
	end method
	
	method public Stmt checkEndDo(var stm as Stmt, var b as boolean&)
		var eds as EndDoStmt = null
	
		if stm::Tokens[l] >= 2 then

			var typ1 as Type = gettype EndTok
			var typ2 as Type = gettype DoTok
	
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])
	
			if b then
				eds = new EndDoStmt()
				eds::Line = stm::Line
				eds::Tokens = stm::Tokens
			end if
		end if
		return eds
	end method
	
	method public Stmt checkEndTry(var stm as Stmt, var b as boolean&)
		var ets as EndTryStmt = null

		if stm::Tokens[l] >= 2 then
			var typ1 as Type = gettype EndTok
			var typ2 as Type = gettype TryTok
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])

			if b then
				ets = new EndTryStmt()
				ets::Line = stm::Line
				ets::Tokens = stm::Tokens
			end if
		end if
		return ets
	end method
	
	
	method public Stmt checkAssembly(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype AssemblyTok
	b = typ::IsInstanceOfType(tok)
	var asms as AssemblyStmt = new AssemblyStmt()
	if b then
	asms::Line = stm::Line
	asms::Tokens = stm::Tokens
	asms::AsmName = stm::Tokens[1]
	asms::Mode = stm::Tokens[2]
	end if
	return asms
	end method
	
	method public Stmt checkVer(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype VerTok
		var vers as VerStmt = new VerStmt()
		b = typ::IsInstanceOfType(stm::Tokens[0])
		if b then
			vers::Line = stm::Line
			vers::Tokens = stm::Tokens
			var ars as string[] = ParseUtils::StringParser(stm::Tokens[1]::Value,".")
			var intla as IntLiteral[] = new IntLiteral[4]
			var intl as IntLiteral = null
			intl = new IntLiteral($integer$ars[0])
			intl::Line = stm::Line
			intla[0] = intl
			intl = new IntLiteral($integer$ars[1])
			intl::Line = stm::Line
			intla[1] = intl
			intl = new IntLiteral($integer$ars[2])
			intl::Line = stm::Line
			intla[2] = intl
			intl = new IntLiteral($integer$ars[3])
			intl::Line = stm::Line
			intla[3] = intl
			vers::VersionNos = intla
			stm = vers
		end if
		return vers
	end method

	method public Stmt checkClass(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype ClassTok
		var sttyp as Type = gettype StructTok
		b = typ::IsInstanceOfType(stm::Tokens[0]) or sttyp::IsInstanceOfType(stm::Tokens[0])
		var clss as ClassStmt = new ClassStmt()
		var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
		var tempexp as Expr
		var stflg as boolean = false

		if b then
		
			if sttyp::IsInstanceOfType(stm::Tokens[0]) then
				stflg = true
				clss::InhClass = new TypeTok(gettype ValueType)
			end if

			clss::Line = stm::Line
			clss::Tokens = stm::Tokens
			var i as integer = 0
	
			do until i >= (stm::Tokens[l] - 1)
	
				i = i + 1
				typ = gettype Attributes.Attribute
	
				if typ::IsInstanceOfType(stm::Tokens[i]) then
					clss::AddAttr($Attributes.Attribute$stm::Tokens[i])
				else
					var typ2 as Type = gettype ExtendsTok
					typ = gettype ImplementsTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						i = i + 1
						tempexp = new Expr()
						tempexp::Tokens = stm::Tokens
						tempexp = eopt::procType(tempexp,i)
						stm::Tokens = tempexp::Tokens
						
						if stflg = false then
							clss::InhClass = $TypeTok$stm::Tokens[i]
						end if
					
					elseif typ::IsInstanceOfType(stm::Tokens[i]) then
						typ2 = gettype TypeTok
						typ = gettype Comma
						do until i = (stm::Tokens[l] - 1)
							i = i + 1
							if typ::IsInstanceOfType(stm::Tokens[i]) = false then
								tempexp = new Expr()
								tempexp::Tokens = stm::Tokens
								tempexp = eopt::procType(tempexp,i)
								stm::Tokens = tempexp::Tokens
								clss::AddInterface($TypeTok$stm::Tokens[i])
							end if
						end do
					else
						clss::ClassName = stm::Tokens[i]
					end if

				end if
			end do
		end if
		
		return clss
	end method
	
	method public Stmt checkField(var stm as Stmt, var b as boolean&)
	
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype FieldTok
	b = typ::IsInstanceOfType(tok)
	var flss as FieldStmt = new FieldStmt()
	var att as Attributes.Attribute = null
	
	if b then
	
	var tempexp as Expr = new Expr()
	tempexp::Tokens = stm::Tokens
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	
	flss::Line = stm::Line
	flss::Tokens = stm::Tokens
	
	label loop
	label cont
	
	var i as integer = 0
	var len as integer = stm::Tokens[l] - 3
	var bl as boolean = false
	
	place loop
	
	i = i + 1
	tok = stm::Tokens[i]
	typ = gettype Attributes.Attribute
	bl = typ::IsInstanceOfType(tok)
	
	if bl then
	att = tok
	flss::AddAttr(att)
	else
	i = i - 1
	goto cont
	end if
	
	if i = len then
	goto cont
	else
	goto loop
	end if
	
	place cont
	
	i = i + 1
	
	tempexp = eop::procType(tempexp,i)
	stm::Tokens = tempexp::Tokens
	flss::FieldTyp = stm::Tokens[i]
	
	i = i + 1
	flss::FieldName = stm::Tokens[i]
	
	end if
	
	return flss
	end method
	
	method public Stmt checkMethod(var stm as Stmt, var b as boolean&)
	
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype MethodTok
	b = typ::IsInstanceOfType(tok)
	var mtss as MethodStmt = new MethodStmt()
	var att as Attributes.Attribute = new Attributes.Attribute()
	//var mn as Ident = new Ident()
	var exp as Expr = null
	var d as boolean = false
	
	if b then
	
	var tempexp as Expr = new Expr()
	tempexp::Tokens = stm::Tokens
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	
	mtss::Line = stm::Line
	mtss::Tokens = stm::Tokens
	
	var lvl as integer = 0
	var lpt as Type = gettype LAParen
	var rpt as Type = gettype RAParen
	
	label loop
	label cont
	label jumpl
	
	var i as integer = 0
	var len as integer = stm::Tokens[l] - 1
	var bl as boolean = false
	
	//loop to get attributes
	place loop
	
	i = i + 1
	tok = stm::Tokens[i]
	typ = gettype Attributes.Attribute
	bl = typ::IsInstanceOfType(tok)
	
	if bl = true then
	att = tok
	mtss::AddAttr(att)
	else
	i = i - 1
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
	i = i + 1
	
	var tok2 as Token = stm::Tokens[i]
	var typ2 as Type
	var b2 as boolean
	
	tempexp = eop::procType(tempexp,i)
	stm::Tokens = tempexp::Tokens
	mtss::RetTyp = stm::Tokens[i]
	
	len = stm::Tokens[l] - 1
	
	i = i + 1
	
	tok2 = stm::Tokens[i]
	typ2 = gettype Ident
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	mtss::MethodName = tok2
	end if
	
	label loop2
	label cont2
	
	i = i + 1
	tok2 = stm::Tokens[i]
	typ2 = gettype LParen
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	
	place loop2
	
	//get parameters
	i = i + 1
	
	tok2 = stm::Tokens[i]
	typ2 = gettype RParen
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	if d then
	var eopt2 as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eopt2::checkVarAs(exp,ref|bl)
	if bl then
	mtss::AddParam(exp)
	end if
	end if
	d = false
	goto cont2
	end if
	
	tok2 = stm::Tokens[i]
	typ2 = gettype VarTok
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	d = true
	exp = new Expr()
	end if
	
	if lpt::IsInstanceOfType(stm::Tokens[i]) then
		d = true
		lvl = lvl + 1
	end if
	
	if rpt::IsInstanceOfType(stm::Tokens[i]) then
		d = true
		lvl = lvl - 1
	end if
	
	tok2 = stm::Tokens[i]
	typ2 = gettype Comma
	if typ2::IsInstanceOfType(tok2) and (lvl == 0) then
	var eopt1 as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eopt1::checkVarAs(exp,ref|bl)
	if bl then
	mtss::AddParam(exp)
	end if
	d = false
	end if
	
	if d then
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
	var typ as Type = gettype DelegateTok
	b = typ::IsInstanceOfType(tok)
	var dels as DelegateStmt = new DelegateStmt()
	var att as Attributes.Attribute = new Attributes.Attribute()
	//var deln as Ident = new Ident()
	var exp as Expr = null
	var d as boolean = false
	
	if b then
	
	var tempexp as Expr = new Expr()
	tempexp::Tokens = stm::Tokens
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	
	dels::Line = stm::Line
	dels::Tokens = stm::Tokens
	
	var lvl as integer = 0
	var lpt as Type = gettype LAParen
	var rpt as Type = gettype RAParen
	
	label loop
	label cont
	label jumpl
	
	var i as integer = 0
	var len as integer = stm::Tokens[l] - 1
	var bl as boolean = false
	
	//loop to get attributes
	place loop
	
	i = i + 1
	tok = stm::Tokens[i]
	typ = gettype Attributes.Attribute
	bl = typ::IsInstanceOfType(tok)
	
	if bl then
	att = tok
	dels::AddAttr(att)
	else
	i = i - 1
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
	i = i + 1
	
	var tok2 as Token = stm::Tokens[i]
	var typ2 as Type
	var b2 as boolean

	tempexp = eop::procType(tempexp,i)
	stm::Tokens = tempexp::Tokens
	dels::RetTyp = stm::Tokens[i]

	len = stm::Tokens[l] - 1
	
	i = i + 1
	
	tok2 = stm::Tokens[i]
	typ2 = gettype Ident
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	dels::DelegateName = tok2
	end if
	
	label loop2
	label cont2
	
	i = i + 1
	tok2 = stm::Tokens[i]
	typ2 = gettype LParen
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	
	place loop2
	
	//get parameters
	i = i + 1
	
	tok2 = stm::Tokens[i]
	typ2 = gettype RParen
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	if d then
	var eopt2 as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eopt2::checkVarAs(exp,ref|bl)
	if bl then
	dels::AddParam(exp)
	end if
	end if
	d = false
	goto cont2
	end if
	
	tok2 = stm::Tokens[i]
	typ2 = gettype VarTok
	b2 = typ2::IsInstanceOfType(tok2)
	if b2 then
	d = true
	exp = new Expr()
	end if
	
	if lpt::IsInstanceOfType(stm::Tokens[i]) then
		d = true
		lvl = lvl + 1
	end if
	
	if rpt::IsInstanceOfType(stm::Tokens[i]) then
		d = true
		lvl = lvl - 1
	end if
	
	tok2 = stm::Tokens[i]
	typ2 = gettype Comma
	if typ2::IsInstanceOfType(tok2) and (lvl == 0) then
	var eopt1 as ExprOptimizer = new ExprOptimizer(PFlags)
	exp = eopt1::checkVarAs(exp,ref|bl)
	if bl then
	dels::AddParam(exp)
	end if
	d = false
	end if
	
	if d then
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
	var typ as Type = gettype Ident
	//var tokb as Token = stm::Tokens[1]
	//var typb as Type = gettype LParen
	var ba as boolean = typ::IsInstanceOfType(tok)
	//var bb as boolean = typb::IsInstanceOfType(tokb)
	
	b = ba
	
	var mtcss as MethodCallStmt = new MethodCallStmt()
	
	if b then
	
	mtcss::Line = stm::Line
	mtcss::Tokens = stm::Tokens
	
	var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
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
	var typ as Type = gettype VarTok
	b = typ::IsInstanceOfType(tok)
	var vars as VarStmt = new VarStmt()
	
	if b then
	vars::Tokens = stm::Tokens
	var tempexp as Expr = new Expr()
	tempexp::Tokens = vars::Tokens
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	tempexp = eop::procType(tempexp,3)
	vars::Tokens = tempexp::Tokens
	stm::Tokens = tempexp::Tokens
	vars::Line = stm::Line
	vars::VarName = stm::Tokens[1]
	
	vars::VarTyp = vars::Tokens[3]

	
	end if
	return vars
	end method
	
		method public Stmt checkCatch(var stm as Stmt, var b as boolean&)
			var typ as Type = gettype CatchTok
			b = typ::IsInstanceOfType(stm::Tokens[0])
			var cs as CatchStmt = new CatchStmt()
	
			if b then
				cs::Tokens = stm::Tokens
				var tempexp as Expr = new Expr()
				tempexp::Tokens = cs::Tokens
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				cs::Tokens = tempexp::Tokens
				stm::Tokens = tempexp::Tokens
				cs::Line = stm::Line
				cs::ExName = stm::Tokens[1]
	
				tempexp = eop::procType(tempexp,3)
				cs::Tokens = tempexp::Tokens
				cs::ExTyp = cs::Tokens[3]
					
			end if
			return cs
		end method
	
	method public Stmt AssOpt(var stm as Stmt)
	
	var asss as AssignStmt = $AssignStmt$stm
	var le as Expr = asss::LExp
	var tok as Token = le::Tokens[0]
	var typ as Type = gettype VarTok
	var b as boolean = typ::IsInstanceOfType(tok)
	var vass as VarAsgnStmt = new VarAsgnStmt()
	if b  then
	vass::Tokens = asss::Tokens
	vass::Line = asss::Line
	vass::VarName = le::Tokens[1]
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	
	var tempexp as Expr = new Expr()
	tempexp::Tokens = le::Tokens
	tempexp = eop::procType(tempexp,3)
	le::Tokens = tempexp::Tokens
	
	vass::VarTyp = le::Tokens[3]
		
	vass::RExpr = asss::RExp
	vass::RExpr = eop::Optimize(vass::RExpr)
	
	return vass
	else
	return stm
	end if
	
	end method
	
	method public Stmt checkAssign(var stm as Stmt, var b as boolean&)
	var tok as Token = null
	var typ as Type = gettype AssignOp
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
	
	i = i + 1
	
	tok = stm::Tokens[i]
	c = typ::IsInstanceOfType(tok)
	
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
	
	i = i + 1
	
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
	
	i = i + 1
	
	re::AddToken(stm::Tokens[i])
	
	if i = len then
	goto cont3
	else
	goto loop3
	end if
	
	place cont3
	
	asss::Line = stm::Line
	asss::Tokens = stm::Tokens
	asss::LExp = le
	asss::RExp = re
	
	b = true
	
	asss = AssOpt(asss)
	var vasst as Type = gettype VarAsgnStmt
	if vasst::IsInstanceOfType(asss) = false then
		var eop as ExprOptimizer = new ExprOptimizer(PFlags)
		re = eop::Optimize(re)
		le = eop::Optimize(le)
	end if
	
	return asss
	
	else
	b = false
	return stm
	
	end if
	
	end method
	
	method public Stmt Optimize(var stm as Stmt)
	
	var i as integer = -1
	var lenx as integer = stm::Tokens[l] - 1
	var to as TokenOptimizer = new TokenOptimizer(PFlags)
	var tmpstm as Stmt = null
	var compb as boolean = false
	
	PFlags::IfFlag = false
	PFlags::CmtFlag = false
	PFlags::NoOptFlag = false
	
	label loop
	label cont
	label fin
	
	if stm::Tokens[l] = 0 then
	goto fin
	end if
	
	place loop
	
	i = i + 1
	
	if PFlags::CmtFlag then
		goto cont
	end if
	
	
	if PFlags::NoOptFlag then
		goto cont
	end if
	
	if i != lenx then
		stm::Tokens[i] = to::Optimize(stm::Tokens[i],stm::Tokens[i + 1])
	else
		stm::Tokens[i] = to::Optimize(stm::Tokens[i],$Token$null)
	end if
	
	if i = lenx then
		goto cont
	else
		goto loop
	end if
	
	place cont
	
	if stm::Tokens[l] = 0 then
		goto fin
	else
		i = -1
		var tok as Token
		var pcnt as integer = 0
		var acnt as integer = 0
		var scnt as integer = 0
		var pltyp as Type = gettype LParen
		var altyp as Type = gettype LAParen
		var sltyp as Type = gettype LSParen
		var prtyp as Type = gettype RParen
		var artyp as Type = gettype RAParen
		var srtyp as Type = gettype RSParen
		do until i = (stm::Tokens[l] - 1)
			i = i + 1
			tok = stm::Tokens[i]
			if pltyp::IsInstanceOfType(tok) then
				pcnt = pcnt + 1
			elseif prtyp::IsInstanceOfType(tok) then
				pcnt = pcnt - 1
			elseif altyp::IsInstanceOfType(tok) then
				acnt = acnt + 1
			elseif artyp::IsInstanceOfType(tok) then
				acnt = acnt - 1
			elseif sltyp::IsInstanceOfType(tok) then
				scnt = scnt + 1
			elseif srtyp::IsInstanceOfType(tok) then
				scnt = scnt - 1
			end if
		end do
		if pcnt != 0 then
			StreamUtils::WriteLine("")
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing parentheses do not match!.")
		elseif acnt != 0 then
			StreamUtils::WriteLine("")
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing angle parentheses do not match!.")
		elseif scnt != 0 then
			StreamUtils::WriteLine("")
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing square parentheses do not match!.")
		end if
	end if
	
	tmpstm = checkCmt(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkImport(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkLocimport(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkAssembly(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkVer(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkNS(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkClass(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDelegate(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkField(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkMethod(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkAssign(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkVarAs(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkCatch(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkReturn(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkThrow(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkTry(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkFinally(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndTry(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndMtd(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndNS(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndCls(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDebug(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkScope(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkInclude(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkRefasm(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkRefstdasm(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkLabel(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkPlace(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkGoto(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkIf(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkWhile(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkUntil(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDoWhile(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDoUntil(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkElseIf(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkElse(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDo(stm, ref|compb)	
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkBreak(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkContinue(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndIf(stm, ref|compb)	
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndDo(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkMethodCall(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	
	place fin
	
	return stm
	end method

end class
