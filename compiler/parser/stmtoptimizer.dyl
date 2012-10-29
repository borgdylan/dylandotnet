//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtOptimizer

	field public Flags PFlags
	
	method public void StmtOptimizer()
		me::ctor()
		PFlags = new Flags()
	end method
	
	method public void StmtOptimizer(var pf as Flags)
		me::ctor()
		PFlags = pf
	end method

	method private Stmt checkRefasm(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkRefstdasm(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkInclude(var stm as Stmt, var b as boolean&)
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
	
	
	method private Stmt checkIf(var stm as Stmt, var b as boolean&)
		var tok as Token = stm::Tokens[0]
		b = tok is IfTok
		var ifs as IfStmt = new IfStmt()
		var exp as Expr = new Expr()
		
		if b then
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens[l] - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens[i]		
				
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			ifs::Exp = exp
		end if
		
		return ifs
	end method
	
	method private Stmt checkHIf(var stm as Stmt, var b as boolean&)
		var tok as Token = stm::Tokens[0]
		b = tok is HIfTok
		var ifs as HIfStmt = new HIfStmt()
		var exp as Expr = new Expr()
		
		if b then
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens[l] - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens[i]		
				
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			ifs::Exp = exp
		end if
		
		return ifs
	end method
	
	method private Stmt checkWhile(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype WhileTok
		b = typ::IsInstanceOfType(stm::Tokens[0])
		var whis as WhileStmt = new WhileStmt()
		var exp as Expr = new Expr()
		
		if b then
			whis::Line = stm::Line
			whis::Tokens = stm::Tokens
			var i as integer = 0
			
			do until i = (stm::Tokens[l] - 1)
				i = i + 1
				exp::AddToken(stm::Tokens[i])
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			whis::Exp = exp
		end if
		
		return whis
	end method
	
	method private Stmt checkDoWhile(var stm as Stmt, var b as boolean&)
	
		var whis as DoWhileStmt = null
		
		if stm::Tokens[l] >= 2 then
		
			var typ1 as Type = gettype DoTok
			var typ2 as Type = gettype WhileTok
			
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])
			
			whis = new DoWhileStmt()
			var exp as Expr = new Expr()
			
			if b then
				whis::Line = stm::Line
				whis::Tokens = stm::Tokens
				var i as integer = 1
				
				do until i = (stm::Tokens[l] - 1)
					i = i + 1
					exp::AddToken(stm::Tokens[i])
				end do
				
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				exp = eop::Optimize(exp)
				whis::Exp = exp
			end if
		end if
		
		return whis
	end method
	
	method private Stmt checkUntil(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype UntilTok
		b = typ::IsInstanceOfType(stm::Tokens[0])
		var unts as UntilStmt = new UntilStmt()
		var exp as Expr = new Expr()
		
		if b then
			unts::Line = stm::Line
			unts::Tokens = stm::Tokens
			var i as integer = 0
			
			do until i = (stm::Tokens[l] - 1)
				i = i + 1
				exp::AddToken(stm::Tokens[i])	
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			unts::Exp = exp
		end if
		
		return unts
	end method
	
	method private Stmt checkDoUntil(var stm as Stmt, var b as boolean&)
	
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

				do until i = (stm::Tokens[l] - 1)
					i = i + 1
					exp::AddToken(stm::Tokens[i])
				end do
								
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				exp = eop::Optimize(exp)
				unts::Exp = exp
			end if	
		end if
	
		return unts
	end method
	
	method private Stmt checkForeach(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype ForeachTok
		b = typ::IsInstanceOfType(stm::Tokens[0])
		var fes as ForeachStmt = new ForeachStmt()
		var exp as Expr = new Expr()
		
		if b then
			fes::Line = stm::Line
			fes::Tokens = stm::Tokens
			fes::Iter = $Ident$stm::Tokens[1]
			
			var i as integer = 2
			
			do until i = (stm::Tokens[l] - 1)
				i = i + 1
				exp::AddToken(stm::Tokens[i])	
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			fes::Exp = exp
		end if
		
		return fes
	end method
	
	method private Stmt checkElseIf(var stm as Stmt, var b as boolean&)
		var tok as Token = stm::Tokens[0]
		b = tok is ElseIfTok
		var ifs as ElseIfStmt = new ElseIfStmt()
		var exp as Expr = new Expr()
		
		if b then
		
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens[l] - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens[i]
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			ifs::Exp = exp
		
		end if
		
		return ifs
	end method
	
	method private Stmt checkHElseIf(var stm as Stmt, var b as boolean&)
		var tok as Token = stm::Tokens[0]
		b = tok is HElseIfTok
		var ifs as HElseIfStmt = new HElseIfStmt()
		var exp as Expr = new Expr()
		
		if b then
		
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens[l] - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens[i]
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			ifs::Exp = exp
		
		end if
		
		return ifs
	end method
	
	method private Stmt checkLabel(var stm as Stmt, var b as boolean&)
		b = stm::Tokens[0] is LabelTok
		var lbls as LabelStmt = new LabelStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::LabelName = $Ident$stm::Tokens[1]
		end if
		return lbls
	end method
	
	method private Stmt checkPlace(var stm as Stmt, var b as boolean&)
		b = stm::Tokens[0] is PlaceTok
		var lbls as PlaceStmt = new PlaceStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::LabelName = $Ident$stm::Tokens[1]
		end if
		return lbls
	end method
	
	method private Stmt checkGoto(var stm as Stmt, var b as boolean&)
		b = stm::Tokens[0] is GotoTok
		var lbls as GotoStmt = new GotoStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::LabelName = $Ident$stm::Tokens[1]
		end if
		return lbls
	end method
	
	method private Stmt checkHDefine(var stm as Stmt, var b as boolean&)
		b = stm::Tokens[0] is HDefineTok
		var lbls as HDefineStmt = new HDefineStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::Symbol = $Ident$stm::Tokens[1]
		end if
		return lbls
	end method
	
	method private Stmt checkHUndef(var stm as Stmt, var b as boolean&)
		b = stm::Tokens[0] is HUndefTok
		var lbls as HUndefStmt = new HUndefStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::Symbol = $Ident$stm::Tokens[1]
		end if
		return lbls
	end method
	
	method private Stmt checkDebug(var stm as Stmt, var b as boolean&)
		b = stm::Tokens[0] is DebugTok
		var dbgs as DebugStmt = new DebugStmt()
		if b then
			dbgs::Line = stm::Line
			dbgs::Tokens = stm::Tokens
			dbgs::Opt = $SwitchTok$stm::Tokens[1]
			dbgs::setFlg()
		end if
		return dbgs
	end method
	
	method private Stmt checkScope(var stm as Stmt, var b as boolean&)
		b = stm::Tokens[0] is ScopeTok
		var scps as ScopeStmt = new ScopeStmt()
		if b then
			scps::Line = stm::Line
			scps::Tokens = stm::Tokens
			scps::Opt = $SwitchTok$stm::Tokens[1]
			scps::setFlg()
		end if
		return scps
	end method
	
	method private Stmt checkImport(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype ImportTok
		b = typ::IsInstanceOfType(stm::Tokens[0])
		var imps as ImportStmt = new ImportStmt()
		if b then
			imps::Line = stm::Line
			imps::Tokens = stm::Tokens
			if stm::Tokens[l] >= 4 then
				if stm::Tokens[2]::Value = "=" then
					imps::Alias = stm::Tokens[1]
					imps::NS = stm::Tokens[3]
				else
					imps::NS = stm::Tokens[1]
				end if
			else
				imps::NS = stm::Tokens[1]
			end if
		end if
		return imps
	end method
	
	method private Stmt checkNS(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkLocimport(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkReturn(var stm as Stmt, var b as boolean&)
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
	
		method private Stmt checkThrow(var stm as Stmt, var b as boolean&)
	
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
		
	
	method private Stmt checkCmt(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkElse(var stm as Stmt, var b as boolean&)
		var els as ElseStmt = null
		if stm::Tokens[l] < 2 then	
			b = stm::Tokens[0] is ElseTok
			els = new ElseStmt()
			if b then
				els::Line = stm::Line
				els::Tokens = stm::Tokens
			end if
		end if
		return els
	end method
	
	method private Stmt checkHElse(var stm as Stmt, var b as boolean&)
		var els as HElseStmt = null
		if stm::Tokens[l] < 2 then	
			b = stm::Tokens[0] is HElseTok
			els = new HElseStmt()
			if b then
				els::Line = stm::Line
				els::Tokens = stm::Tokens
			end if
		end if
		return els
	end method
	
	method private Stmt checkDo(var stm as Stmt, var b as boolean&)
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
	
		method private Stmt checkTry(var stm as Stmt, var b as boolean&)
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
	
		method private Stmt checkFinally(var stm as Stmt, var b as boolean&)
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
	
	
	method private Stmt checkBreak(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkContinue(var stm as Stmt, var b as boolean&)
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
	
	
	method private Stmt checkEndIf(var stm as Stmt, var b as boolean&)
		var eifs as EndIfStmt = null
	
		if stm::Tokens[l] >= 2 then
	
			b = (stm::Tokens[0] is EndTok) and (stm::Tokens[1] is IfTok)
	
			if b then
				eifs = new EndIfStmt()
				eifs::Line = stm::Line
				eifs::Tokens = stm::Tokens
			end if
		end if
		return eifs
	end method
	
	method private Stmt checkEndHIf(var stm as Stmt, var b as boolean&)
		var eifs as EndHIfStmt = null
	
		if stm::Tokens[l] >= 2 then
	
			b = (stm::Tokens[0] is EndTok) and (stm::Tokens[1] is HIfTok)
	
			if b then
				eifs = new EndHIfStmt()
				eifs::Line = stm::Line
				eifs::Tokens = stm::Tokens
			end if
		end if
		return eifs
	end method
	
	
	method private Stmt checkEndMtd(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkEndNS(var stm as Stmt, var b as boolean&)
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
	
	
	method private Stmt checkEndCls(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkEndDo(var stm as Stmt, var b as boolean&)
		var eds as EndDoStmt = null
	
		if stm::Tokens[l] >= 2 then

			var typ1 as Type = gettype EndTok
			var typ2 as Type = gettype DoTok
			var typ3 as Type = gettype ForTok
	
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and (typ2::IsInstanceOfType(stm::Tokens[1]) or typ3::IsInstanceOfType(stm::Tokens[1]))
	
			if b then
				eds = new EndDoStmt()
				eds::Line = stm::Line
				eds::Tokens = stm::Tokens
			end if
		end if
		return eds
	end method
	
	method private Stmt checkEndTry(var stm as Stmt, var b as boolean&)
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
	
	method private Stmt checkMetAttr(var stm as Stmt, var b as boolean&)
		var mas as MethodAttrStmt = null

		if stm::Tokens[l] >= 2 then
			var typ1 as Type = gettype LSParen
			var typ2 as Type = gettype MethodCTok
			
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])

			if b then
				mas = new MethodAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens[2]
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params[l] - 1)
					j = j + 1
					mas::Ctor::Params[j] = eopt::Optimize(mas::Ctor::Params[j])
				end do
				
				var et as Type = gettype RSParen
				var ct as Type = gettype Comma
				var eqt as Type = gettype AssignOp
				var lp as List<of AttrValuePair> = new List<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens[l] - 1)
					i = i + 1
					if et::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif ct::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif eqt::IsInstanceOfType(mas::Tokens[i]) then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens[i])
						else
							curvp::Name = $Ident$mas::Tokens[i]
						end if
					end if
				end do
				
				mas::Pairs = Enumerable::ToArray<of AttrValuePair>(lp)
				
			end if
		end if
		return mas
	end method
	
	method private Stmt checkFldAttr(var stm as Stmt, var b as boolean&)
		var mas as FieldAttrStmt = null

		if stm::Tokens[l] >= 2 then
			var typ1 as Type = gettype LSParen
			var typ2 as Type = gettype FieldCTok
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])

			if b then
				mas = new FieldAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens[2]
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params[l] - 1)
					j = j + 1
					mas::Ctor::Params[j] = eopt::Optimize(mas::Ctor::Params[j])
				end do
				
				var et as Type = gettype RSParen
				var ct as Type = gettype Comma
				var eqt as Type = gettype AssignOp
				var lp as List<of AttrValuePair> = new List<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens[l] - 1)
					i = i + 1
					if et::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif ct::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif eqt::IsInstanceOfType(mas::Tokens[i]) then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens[i])
						else
							curvp::Name = $Ident$mas::Tokens[i]
						end if
					end if
				end do
				
				mas::Pairs = Enumerable::ToArray<of AttrValuePair>(lp) 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkClsAttr(var stm as Stmt, var b as boolean&)
		var mas as ClassAttrStmt = null

		if stm::Tokens[l] >= 2 then
			var typ1 as Type = gettype LSParen
			var typ2 as Type = gettype ClassCTok
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])

			if b then
				mas = new ClassAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens[2]
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params[l] - 1)
					j = j + 1
					mas::Ctor::Params[j] = eopt::Optimize(mas::Ctor::Params[j])
				end do
				
				var et as Type = gettype RSParen
				var ct as Type = gettype Comma
				var eqt as Type = gettype AssignOp
				var lp as List<of AttrValuePair> = new List<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens[l] - 1)
					i = i + 1
					if et::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif ct::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif eqt::IsInstanceOfType(mas::Tokens[i]) then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens[i])
						else
							curvp::Name = $Ident$mas::Tokens[i]
						end if
					end if
				end do
				
				mas::Pairs = Enumerable::ToArray<of AttrValuePair>(lp) 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkAsmAttr(var stm as Stmt, var b as boolean&)
		var mas as AssemblyAttrStmt = null

		if stm::Tokens[l] >= 2 then
			var typ1 as Type = gettype LSParen
			var typ2 as Type = gettype AssemblyCTok
			b = typ1::IsInstanceOfType(stm::Tokens[0]) and typ2::IsInstanceOfType(stm::Tokens[1])

			if b then
				mas = new AssemblyAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens[2]
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params[l] - 1)
					j = j + 1
					mas::Ctor::Params[j] = eopt::Optimize(mas::Ctor::Params[j])
				end do
				
				var et as Type = gettype RSParen
				var ct as Type = gettype Comma
				var eqt as Type = gettype AssignOp
				var lp as List<of AttrValuePair> = new List<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens[l] - 1)
					i = i + 1
					if et::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif ct::IsInstanceOfType(mas::Tokens[i]) then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif eqt::IsInstanceOfType(mas::Tokens[i]) then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens[i])
						else
							curvp::Name = $Ident$mas::Tokens[i]
						end if
					end if
				end do
				
				mas::Pairs = Enumerable::ToArray<of AttrValuePair>(lp) 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkAssembly(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype AssemblyTok
	b = typ::IsInstanceOfType(tok)
	var asms as AssemblyStmt = new AssemblyStmt()
	if b then
	asms::Line = stm::Line
	asms::Tokens = stm::Tokens
	asms::AsmName = $Ident$stm::Tokens[1]
	asms::Mode = stm::Tokens[2]
	end if
	return asms
	end method
	
	method private Stmt checkVer(var stm as Stmt, var b as boolean&)
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

	method private Stmt checkClass(var stm as Stmt, var b as boolean&)
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
				clss::InhClass = new TypeTok(ILEmitter::Univ::Import(gettype ValueType))
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
						clss::ClassName = $Ident$stm::Tokens[i]
					end if

				end if
			end do
		end if
		
		return clss
	end method
	
	method private Stmt checkField(var stm as Stmt, var b as boolean&)
	
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
	att = $Attributes.Attribute$tok
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
	flss::FieldTyp = $TypeTok$stm::Tokens[i]
	
	i = i + 1
	flss::FieldName = $Ident$stm::Tokens[i]
	
	end if
	
	return flss
	end method
	
	method private Stmt checkMethod(var stm as Stmt, var b as boolean&)
	
		var tok as Token = stm::Tokens[0]
		var typ as Type = gettype MethodTok
		b = typ::IsInstanceOfType(tok)
		var mtss as MethodStmt = new MethodStmt()
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
			
			var i as integer = 0
			var len as integer = stm::Tokens[l] - 1
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i = i + 1
				//tok = stm::Tokens[i]
				typ = gettype Attributes.Attribute
				if typ::IsInstanceOfType(stm::Tokens[i]) then
					mtss::AddAttr($Attributes.Attribute$stm::Tokens[i])
				else
					i = i - 1
					break
				end if
			end do
			
			//get return type and name
			i = i + 1
			
			var typ2 as Type
			
			tempexp = eop::procType(tempexp,i)
			stm::Tokens = tempexp::Tokens
			mtss::RetTyp = $TypeTok$stm::Tokens[i]
			
			len = stm::Tokens[l] - 1
			i = i + 1
			
			typ2 = gettype Ident
			if typ2::IsInstanceOfType(stm::Tokens[i]) then
				mtss::MethodName = $Ident$stm::Tokens[i]
			end if
			
			i = i + 1
			typ2 = gettype LParen
			
			if typ2::IsInstanceOfType(stm::Tokens[i]) then
				exp = null
				do until i = len
			
					//get parameters
					i = i + 1
				
					typ2 = gettype RParen
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						if d then
							var eopt2 as ExprOptimizer = new ExprOptimizer(PFlags)
							exp = eopt2::checkVarAs(exp,ref|bl)
							if bl then
								mtss::AddParam(exp)
							end if
						end if
						d = false
						break
					end if
				
					typ2 = gettype VarTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype InTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype InOutTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype OutTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					if lpt::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						lvl = lvl + 1
					end if
					
					if rpt::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						lvl = lvl - 1
					end if
					
					typ2 = gettype Comma
					if typ2::IsInstanceOfType(stm::Tokens[i]) and (lvl == 0) then
						var eopt1 as ExprOptimizer = new ExprOptimizer(PFlags)
						exp = eopt1::checkVarAs(exp,ref|bl)
						if bl then
							mtss::AddParam(exp)
						end if
						d = false
						exp = null
					end if
					
					if d then
						exp::AddToken(stm::Tokens[i])
					end if
				end do
			end if

		end if
		return mtss
	end method
	
	method private Stmt checkDelegate(var stm as Stmt, var b as boolean&)
	
		var tok as Token = stm::Tokens[0]
		var typ as Type = gettype DelegateTok
		b = typ::IsInstanceOfType(tok)
		var dels as DelegateStmt = new DelegateStmt()
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
			
			var i as integer = 0
			var len as integer = stm::Tokens[l] - 1
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i = i + 1
				tok = stm::Tokens[i]
				typ = gettype Attributes.Attribute
			
				if typ::IsInstanceOfType(stm::Tokens[i]) then
					dels::AddAttr($Attributes.Attribute$stm::Tokens[i])
				else
					i = i - 1
					break
				end if
			end do
			
			//get return type and name
			i = i + 1
			
			var typ2 as Type

			tempexp = eop::procType(tempexp,i)
			stm::Tokens = tempexp::Tokens
			dels::RetTyp = $TypeTok$stm::Tokens[i]

			len = stm::Tokens[l] - 1
			
			i = i + 1
			
			typ2 = gettype Ident
			if typ2::IsInstanceOfType(stm::Tokens[i]) then
				dels::DelegateName = $Ident$stm::Tokens[i]
			end if
			
			i = i + 1
			typ2 = gettype LParen
			if typ2::IsInstanceOfType(stm::Tokens[i]) then
				
				exp = null
				do until i = len
			
					//get parameters
					i = i + 1
				
					typ2 = gettype RParen
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						if d then
							var eopt2 as ExprOptimizer = new ExprOptimizer(PFlags)
							exp = eopt2::checkVarAs(exp,ref|bl)
							if bl then
								dels::AddParam(exp)
							end if
						end if
						d = false
						break
					end if
				
					typ2 = gettype VarTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype InTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype InOutTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype OutTok
					if typ2::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					if lpt::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						lvl = lvl + 1
					end if
					
					if rpt::IsInstanceOfType(stm::Tokens[i]) then
						d = true
						lvl = lvl - 1
					end if
					
					typ2 = gettype Comma
					if typ2::IsInstanceOfType(stm::Tokens[i]) and (lvl == 0) then
						var eopt1 as ExprOptimizer = new ExprOptimizer(PFlags)
						exp = eopt1::checkVarAs(exp,ref|bl)
						if bl then
							dels::AddParam(exp)
						end if
						d = false
						exp = null
					end if
					
					if d then
						exp::AddToken(stm::Tokens[i])
					end if
				end do
			end if
		
		end if
		return dels
	end method
	
	method private Stmt checkMethodCall(var stm as Stmt, var b as boolean&)
	
	var mtcss as MethodCallStmt = new MethodCallStmt()
	
	if stm::Tokens[l] > 2 then
	var tok as Token = stm::Tokens[0]
	var typ as Type = gettype Ident
	//var tokb as Token = stm::Tokens[1]
	//var typb as Type = gettype LParen
	var ba as boolean = typ::IsInstanceOfType(tok)
	//var bb as boolean = typb::IsInstanceOfType(tokb)
	
	b = ba
	
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
	
	method private Stmt checkVarAs(var stm as Stmt, var b as boolean&)
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
	vars::VarName = $Ident$stm::Tokens[1]
	
	vars::VarTyp = $TypeTok$vars::Tokens[3]

	
	end if
	return vars
	end method
	
		method private Stmt checkCatch(var stm as Stmt, var b as boolean&)
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
				cs::ExName = $Ident$stm::Tokens[1]
	
				tempexp = eop::procType(tempexp,3)
				cs::Tokens = tempexp::Tokens
				cs::ExTyp = $TypeTok$cs::Tokens[3]
					
			end if
			return cs
		end method
	
	method private Stmt AssOpt(var stm as Stmt)
	
	var asss as AssignStmt = $AssignStmt$stm
	var le as Expr = asss::LExp
	var tok as Token = le::Tokens[0]
	var typ as Type = gettype VarTok
	var b as boolean = typ::IsInstanceOfType(tok)
	var vass as VarAsgnStmt = new VarAsgnStmt()
	if b  then
	vass::Tokens = asss::Tokens
	vass::Line = asss::Line
	vass::VarName = $Ident$le::Tokens[1]
	
	var eop as ExprOptimizer = new ExprOptimizer(PFlags)
	
	var tempexp as Expr = new Expr()
	tempexp::Tokens = le::Tokens
	tempexp = eop::procType(tempexp,3)
	le::Tokens = tempexp::Tokens
	
	vass::VarTyp = $TypeTok$le::Tokens[3]
		
	vass::RExpr = asss::RExp
	vass::RExpr = eop::Optimize(vass::RExpr)
	
	return vass
	else
	return stm
	end if
	
	end method
	
	method private Stmt checkAssign(var stm as Stmt, var b as boolean&)
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
	
	if c then
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
	
	var asss2 as Stmt = AssOpt(asss)
	var vasst as Type = gettype VarAsgnStmt
	if vasst::IsInstanceOfType(asss2) = false then
		var eop as ExprOptimizer = new ExprOptimizer(PFlags)
		re = eop::Optimize(re)
		le = eop::Optimize(le)
		asss::LExp = le
		asss::RExp = re
		return asss
	else
		return asss2
	end if
	
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
	PFlags::AsFlag = false
	
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
			StreamUtils::WriteLine(String::Empty)
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing parentheses do not match!.")
		elseif acnt != 0 then
			StreamUtils::WriteLine(String::Empty)
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing angle parentheses do not match!.")
		elseif scnt != 0 then
			StreamUtils::WriteLine(String::Empty)
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
	
	tmpstm = checkAsmAttr(stm, ref|compb)
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
	
	tmpstm = checkClsAttr(stm, ref|compb)
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
	
	tmpstm = checkFldAttr(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkField(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkMetAttr(stm, ref|compb)
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
	
	tmpstm = checkHDefine(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkHUndef(stm, ref|compb)
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
	
	tmpstm = checkHIf(stm, ref|compb)
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
	
	tmpstm = checkForeach(stm, ref|compb)
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
	
	tmpstm = checkHElseIf(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkElse(stm, ref|compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkHElse(stm, ref|compb)
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
	
	tmpstm = checkEndHIf(stm, ref|compb)	
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
