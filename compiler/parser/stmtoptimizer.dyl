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
		b = stm::Tokens::get_Item(0) is RefasmTok
		var refasms as RefasmStmt = new RefasmStmt()
		if b then
			refasms::Line = stm::Line
			refasms::Tokens = stm::Tokens
			refasms::AsmPath = stm::Tokens::get_Item(1)
		end if
		return refasms
	end method
	
	method private Stmt checkRefstdasm(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is RefstdasmTok
		var refsasms as RefstdasmStmt = new RefstdasmStmt()
		if b then
			refsasms::Line = stm::Line
			refsasms::Tokens = stm::Tokens
			refsasms::AsmPath = stm::Tokens::get_Item(1)
		end if
		return refsasms
	end method
	
	method private Stmt checkInclude(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is IncludeTok
		var inclus as IncludeStmt = new IncludeStmt()
		if b then
			inclus::Line = stm::Line
			inclus::Tokens = stm::Tokens
			inclus::Path = stm::Tokens::get_Item(1)
		end if
		return inclus
	end method
	
	method private Stmt checkError(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ErrorTok
		var errs as ErrorStmt = new ErrorStmt()
		if b then
			errs::Line = stm::Line
			errs::Tokens = stm::Tokens
			errs::Msg = stm::Tokens::get_Item(1)
		end if
		return errs
	end method
	
	method private Stmt checkWarning(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is WarningTok
		var warns as WarningStmt = new WarningStmt()
		if b then
			warns::Line = stm::Line
			warns::Tokens = stm::Tokens
			warns::Msg = stm::Tokens::get_Item(1)
		end if
		return warns
	end method
	
	method private Stmt checkIf(var stm as Stmt, var b as boolean&)
		var tok as Token = stm::Tokens::get_Item(0)
		b = tok is IfTok
		var ifs as IfStmt = new IfStmt()
		var exp as Expr = new Expr()
		
		if b then
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens::get_Item(i)		
				
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
		var tok as Token = stm::Tokens::get_Item(0)
		b = tok is HIfTok
		var ifs as HIfStmt = new HIfStmt()
		var exp as Expr = new Expr()
		
		if b then
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens::get_Item(i)		
				
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
		b = typ::IsInstanceOfType(stm::Tokens::get_Item(0))
		var whis as WhileStmt = new WhileStmt()
		var exp as Expr = new Expr()
		
		if b then
			whis::Line = stm::Line
			whis::Tokens = stm::Tokens
			var i as integer = 0
			
			do until i = (stm::Tokens::get_Count() - 1)
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			whis::Exp = exp
		end if
		
		return whis
	end method
	
	method private Stmt checkDoWhile(var stm as Stmt, var b as boolean&)
	
		var whis as DoWhileStmt = null
		
		if stm::Tokens::get_Count() >= 2 then
		
			var typ1 as Type = gettype DoTok
			var typ2 as Type = gettype WhileTok
			
			b = typ1::IsInstanceOfType(stm::Tokens::get_Item(0)) and typ2::IsInstanceOfType(stm::Tokens::get_Item(1))
			
			whis = new DoWhileStmt()
			var exp as Expr = new Expr()
			
			if b then
				whis::Line = stm::Line
				whis::Tokens = stm::Tokens
				var i as integer = 1
				
				do until i = (stm::Tokens::get_Count() - 1)
					i = i + 1
					exp::AddToken(stm::Tokens::get_Item(i))
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
		b = typ::IsInstanceOfType(stm::Tokens::get_Item(0))
		var unts as UntilStmt = new UntilStmt()
		var exp as Expr = new Expr()
		
		if b then
			unts::Line = stm::Line
			unts::Tokens = stm::Tokens
			var i as integer = 0
			
			do until i = (stm::Tokens::get_Count() - 1)
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))	
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			unts::Exp = exp
		end if
		
		return unts
	end method
	
	method private Stmt checkDoUntil(var stm as Stmt, var b as boolean&)
	
		var unts as DoUntilStmt = null
		
		if stm::Tokens::get_Count() >= 2 then
		
			var typ1 as Type = gettype DoTok
			var typ2 as Type = gettype UntilTok
			
			b = typ1::IsInstanceOfType(stm::Tokens::get_Item(0)) and typ2::IsInstanceOfType(stm::Tokens::get_Item(1))
			
			unts = new DoUntilStmt()
			var exp as Expr = new Expr()
			
			if b then
			
				unts::Line = stm::Line
				unts::Tokens = stm::Tokens				
				var i as integer = 1

				do until i = (stm::Tokens::get_Count() - 1)
					i = i + 1
					exp::AddToken(stm::Tokens::get_Item(i))
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
		b = typ::IsInstanceOfType(stm::Tokens::get_Item(0))
		var fes as ForeachStmt = new ForeachStmt()
		var exp as Expr = new Expr()
		
		if b then
			fes::Line = stm::Line
			fes::Tokens = stm::Tokens
			fes::Iter = $Ident$stm::Tokens::get_Item(1)
			
			var i as integer = 2
			
			do until i = (stm::Tokens::get_Count() - 1)
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))	
			end do
			
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			exp = eop::Optimize(exp)
			fes::Exp = exp
		end if
		
		return fes
	end method
	
	method private Stmt checkElseIf(var stm as Stmt, var b as boolean&)
		var tok as Token = stm::Tokens::get_Item(0)
		b = tok is ElseIfTok
		var ifs as ElseIfStmt = new ElseIfStmt()
		var exp as Expr = new Expr()
		
		if b then
		
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens::get_Item(i)
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
		var tok as Token = stm::Tokens::get_Item(0)
		b = tok is HElseIfTok
		var ifs as HElseIfStmt = new HElseIfStmt()
		var exp as Expr = new Expr()
		
		if b then
		
			ifs::Line = stm::Line
			ifs::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				tok = stm::Tokens::get_Item(i)
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
		b = stm::Tokens::get_Item(0) is LabelTok
		var lbls as LabelStmt = new LabelStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::LabelName = $Ident$stm::Tokens::get_Item(1)
		end if
		return lbls
	end method
	
	method private Stmt checkPlace(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is PlaceTok
		var lbls as PlaceStmt = new PlaceStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::LabelName = $Ident$stm::Tokens::get_Item(1)
		end if
		return lbls
	end method
	
	method private Stmt checkGoto(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is GotoTok
		var lbls as GotoStmt = new GotoStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::LabelName = $Ident$stm::Tokens::get_Item(1)
		end if
		return lbls
	end method
	
	method private Stmt checkHDefine(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HDefineTok
		var lbls as HDefineStmt = new HDefineStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::Symbol = $Ident$stm::Tokens::get_Item(1)
		end if
		return lbls
	end method
	
	method private Stmt checkHUndef(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HUndefTok
		var lbls as HUndefStmt = new HUndefStmt()
		if b then
			lbls::Line = stm::Line
			lbls::Tokens = stm::Tokens
			lbls::Symbol = $Ident$stm::Tokens::get_Item(1)
		end if
		return lbls
	end method
	
	method private Stmt checkDebug(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is DebugTok
		var dbgs as DebugStmt = new DebugStmt()
		if b then
			dbgs::Line = stm::Line
			dbgs::Tokens = stm::Tokens
			dbgs::Opt = $SwitchTok$stm::Tokens::get_Item(1)
			dbgs::setFlg()
		end if
		return dbgs
	end method
	
	method private Stmt checkScope(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ScopeTok
		var scps as ScopeStmt = new ScopeStmt()
		if b then
			scps::Line = stm::Line
			scps::Tokens = stm::Tokens
			scps::Opt = $SwitchTok$stm::Tokens::get_Item(1)
			scps::setFlg()
		end if
		return scps
	end method
	
	method private Stmt checkImport(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype ImportTok
		b = typ::IsInstanceOfType(stm::Tokens::get_Item(0))
		var imps as ImportStmt = new ImportStmt()
		if b then
			imps::Line = stm::Line
			imps::Tokens = stm::Tokens
			if stm::Tokens::get_Count() >= 4 then
				if stm::Tokens::get_Item(2)::Value = "=" then
					imps::Alias = stm::Tokens::get_Item(1)
					imps::NS = stm::Tokens::get_Item(3)
				else
					imps::NS = stm::Tokens::get_Item(1)
				end if
			else
				imps::NS = stm::Tokens::get_Item(1)
			end if
		end if
		return imps
	end method
	
	method private Stmt checkNS(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens::get_Item(0)
	var typ as Type = gettype NamespaceTok
	b = typ::IsInstanceOfType(tok)
	var nss as NSStmt = new NSStmt()
	if b then
	nss::Line = stm::Line
	nss::Tokens = stm::Tokens
	nss::NS = stm::Tokens::get_Item(1)
	end if
	return nss
	end method
	
	method private Stmt checkLocimport(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens::get_Item(0)
	var typ as Type = gettype LocimportTok
	b = typ::IsInstanceOfType(tok)
	var limps as LocimportStmt = new LocimportStmt()
	if b then
	limps::Line = stm::Line
	limps::Tokens = stm::Tokens
	limps::NS = stm::Tokens::get_Item(1)
	end if
	return limps
	end method
	
	method private Stmt checkReturn(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ReturnTok
		var rets as ReturnStmt = new ReturnStmt()
		if b then
			rets::Line = stm::Line
			rets::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			if stm::Tokens::get_Count() = 1 then
				rets::RExp = null
			elseif stm::Tokens::get_Count() >= 2 then
				var exp as Expr = new Expr()
				
				do
					i = i + 1
					exp::AddToken(stm::Tokens::get_Item(i))
				until i = len
			
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				exp = eopt::Optimize(exp)
				rets::RExp = exp
			end if
		end if
		
		return rets
	end method
	
	method private Stmt checkThrow(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ThrowTok
		var tros as ThrowStmt = new ThrowStmt()

		if b then
			tros::Line = stm::Line
			tros::Tokens = stm::Tokens

			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			var exp as Expr = null
		
			if stm::Tokens::get_Count() >= 2 then
				exp = new Expr()
				do until i = len
					i = i + 1
					exp::AddToken(stm::Tokens::get_Item(i))
				end do
		
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				tros::RExp = eopt::Optimize(exp)
			end if
		end if
		return tros
	end method
	
	method private Stmt checkLock(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is LockTok
		var tros as LockStmt = new LockStmt()

		if b then
			tros::Line = stm::Line
			tros::Tokens = stm::Tokens

			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			var exp as Expr = null
		
			if stm::Tokens::get_Count() >= 2 then
				exp = new Expr()
				do until i = len
					i = i + 1
					exp::AddToken(stm::Tokens::get_Item(i))
				end do
		
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				tros::Lockee = eopt::Optimize(exp)
			end if
		end if
		return tros
	end method
		
	
	method private Stmt checkCmt(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is CommentTok
		var cmts as CommentStmt = new CommentStmt()
		if b then
			cmts::Line = stm::Line
			cmts::Tokens = stm::Tokens
		end if
		return cmts
	end method
	
	method private Stmt checkElse(var stm as Stmt, var b as boolean&)
		var els as ElseStmt = null
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is ElseTok
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
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is HElseTok
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
		if stm::Tokens::get_Count() < 2 then
			b = stm::Tokens::get_Item(0) is DoTok
			if b then
				ds = new DoStmt()
				ds::Line = stm::Line
				ds::Tokens = stm::Tokens
			end if
		end if
		return ds
	end method
	
		method private Stmt checkTry(var stm as Stmt, var b as boolean&)
			var ts as TryStmt = null
	
			if stm::Tokens::get_Count() < 2 then
				var typ1 as Type = gettype TryTok
				b = typ1::IsInstanceOfType(stm::Tokens::get_Item(0))
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
	
			if stm::Tokens::get_Count() < 2 then
				var typ1 as Type = gettype FinallyTok
				b = typ1::IsInstanceOfType(stm::Tokens::get_Item(0))
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
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is BreakTok
			if b then
				bs = new BreakStmt()
				bs::Line = stm::Line
				bs::Tokens = stm::Tokens
			end if
		end if
		return bs
	end method
	
	method private Stmt checkContinue(var stm as Stmt, var b as boolean&)
		var cs as ContinueStmt = null
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is ContinueTok
			if b then
				cs = new ContinueStmt()
				cs::Line = stm::Line
				cs::Tokens = stm::Tokens
			end if
		end if
		return cs
	end method
	
	
	method private Stmt checkEndIf(var stm as Stmt, var b as boolean&)
		var eifs as EndIfStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is IfTok)
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
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is HIfTok)
			if b then
				eifs = new EndHIfStmt()
				eifs::Line = stm::Line
				eifs::Tokens = stm::Tokens
			end if
		end if
		return eifs
	end method
	
	method private Stmt checkEndProp(var stm as Stmt, var b as boolean&)
		var eps as EndPropStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is PropertyTok)
			if b then
				eps = new EndPropStmt()
				eps::Line = stm::Line
				eps::Tokens = stm::Tokens
			end if
		end if
		return eps
	end method
	
	method private Stmt checkEndEvent(var stm as Stmt, var b as boolean&)
		var eps as EndEventStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is EventTok)
			if b then
				eps = new EndEventStmt()
				eps::Line = stm::Line
				eps::Tokens = stm::Tokens
			end if
		end if
		return eps
	end method
	
	method private Stmt checkEndMtd(var stm as Stmt, var b as boolean&)
		var ems as EndMethodStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is MethodTok)
	
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
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is NamespaceTok)
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
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and ((stm::Tokens::get_Item(1) is ClassTok) or (stm::Tokens::get_Item(1) is StructTok))
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
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and ((stm::Tokens::get_Item(1) is DoTok) or (stm::Tokens::get_Item(1) is ForTok))
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
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is TryTok)
			if b then
				ets = new EndTryStmt()
				ets::Line = stm::Line
				ets::Tokens = stm::Tokens
			end if
		end if
		return ets
	end method
	
	method private Stmt checkEndLock(var stm as Stmt, var b as boolean&)
		var els as EndLockStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is LockTok)
			if b then
				els = new EndLockStmt()
				els::Line = stm::Line
				els::Tokens = stm::Tokens
			end if
		end if
		return els
	end method
	
	method private Stmt checkMetAttr(var stm as Stmt, var b as boolean&)
		var mas as MethodAttrStmt = null

		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is MethodCTok)

			if b then
				mas = new MethodAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens::get_Item(2)
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params::get_Count() - 1)
					j = j + 1
					mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
				end do
				
				var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens::get_Count() - 1)
					i = i + 1
					if mas::Tokens::get_Item(i) is RSParen then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif mas::Tokens::get_Item(i) is Comma then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif mas::Tokens::get_Item(i) is AssignOp then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens::get_Item(i))
						else
							curvp::Name = $Ident$mas::Tokens::get_Item(i)
						end if
					end if
				end do
				
				mas::Pairs = lp
				
			end if
		end if
		return mas
	end method
	
	method private Stmt checkFldAttr(var stm as Stmt, var b as boolean&)
		var mas as FieldAttrStmt = null

		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is FieldCTok)

			if b then
				mas = new FieldAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens::get_Item(2)
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params::get_Count() - 1)
					j = j + 1
					mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
				end do
				
				var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens::get_Count() - 1)
					i = i + 1
					if mas::Tokens::get_Item(i) is RSParen then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif mas::Tokens::get_Item(i) is Comma then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif mas::Tokens::get_Item(i) is AssignOp then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens::get_Item(i))
						else
							curvp::Name = $Ident$mas::Tokens::get_Item(i)
						end if
					end if
				end do
				
				mas::Pairs = lp 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkClsAttr(var stm as Stmt, var b as boolean&)
		var mas as ClassAttrStmt = null

		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is ClassCTok)

			if b then
				mas = new ClassAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens::get_Item(2)
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params::get_Count() - 1)
					j = j + 1
					mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
				end do
				
				var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens::get_Count() - 1)
					i = i + 1
					if mas::Tokens::get_Item(i) is RSParen then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif mas::Tokens::get_Item(i) is Comma then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif mas::Tokens::get_Item(i) is AssignOp then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens::get_Item(i))
						else
							curvp::Name = $Ident$mas::Tokens::get_Item(i)
						end if
					end if
				end do
				
				mas::Pairs = lp 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkAsmAttr(var stm as Stmt, var b as boolean&)
		var mas as AssemblyAttrStmt = null

		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is AssemblyCTok)

			if b then
				mas = new AssemblyAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens::get_Item(2)
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params::get_Count() - 1)
					j = j + 1
					mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
				end do
				
				var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens::get_Count() - 1)
					i = i + 1
					if mas::Tokens::get_Item(i) is RSParen then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif mas::Tokens::get_Item(i) is Comma then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif mas::Tokens::get_Item(i) is AssignOp then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens::get_Item(i))
						else
							curvp::Name = $Ident$mas::Tokens::get_Item(i)
						end if
					end if
				end do
				
				mas::Pairs = lp 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkEventAttr(var stm as Stmt, var b as boolean&)
		var mas as EventAttrStmt = null

		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is EventCTok)

			if b then
				mas = new EventAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens::get_Item(2)
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params::get_Count() - 1)
					j = j + 1
					mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
				end do
				
				var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens::get_Count() - 1)
					i = i + 1
					if mas::Tokens::get_Item(i) is RSParen then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif mas::Tokens::get_Item(i) is Comma then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif mas::Tokens::get_Item(i) is AssignOp then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens::get_Item(i))
						else
							curvp::Name = $Ident$mas::Tokens::get_Item(i)
						end if
					end if
				end do
				
				mas::Pairs = lp 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkPropAttr(var stm as Stmt, var b as boolean&)
		var mas as PropertyAttrStmt = null

		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is PropertyCTok)

			if b then
				mas = new PropertyAttrStmt()
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens::get_Item(2)
				mas::Line = stm::Line
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params::get_Count() - 1)
					j = j + 1
					mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
				end do
				
				var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens::get_Count() - 1)
					i = i + 1
					if mas::Tokens::get_Item(i) is RSParen then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif mas::Tokens::get_Item(i) is Comma then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif mas::Tokens::get_Item(i) is AssignOp then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens::get_Item(i))
						else
							curvp::Name = $Ident$mas::Tokens::get_Item(i)
						end if
					end if
				end do
				
				mas::Pairs = lp 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkParamAttr(var stm as Stmt, var b as boolean&)
		var mas as ParameterAttrStmt = null

		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is ParameterCTok)

			if b then
				mas = new ParameterAttrStmt()
				
				var pct as ParameterCTok = $ParameterCTok$stm::Tokens::get_Item(1)
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = new Expr()
				tempexp::Tokens = stm::Tokens
				tempexp = eopt::procNewCall(eopt::procType(tempexp,2),2)
				mas::Tokens = tempexp::Tokens
				mas::Ctor = $NewCallTok$mas::Tokens::get_Item(2)
				mas::Line = stm::Line
				mas::Index = $integer$pct::Value::Substring(9,pct::Value::get_Length() - 10)
				//mas::Tokens = stm::Tokens
				
				var j as integer = -1
				do until j = (mas::Ctor::Params::get_Count() - 1)
					j = j + 1
					mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
				end do
				
				var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
				var curvp as AttrValuePair = null
				var eqf as boolean = false
				
				var i as integer = 2
				do until i = (mas::Tokens::get_Count() - 1)
					i = i + 1
					if mas::Tokens::get_Item(i) is RSParen then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						break
					elseif mas::Tokens::get_Item(i) is Comma then
						if curvp != null then
							curvp::ValueExpr = eopt::Optimize(curvp::ValueExpr)
							lp::Add(curvp)
						end if
						curvp = new AttrValuePair()
						curvp::ValueExpr = new Expr()
						eqf = false
					elseif mas::Tokens::get_Item(i) is AssignOp then
						eqf = true
					else
						if eqf then
							curvp::ValueExpr::AddToken(mas::Tokens::get_Item(i))
						else
							curvp::Name = $Ident$mas::Tokens::get_Item(i)
						end if
					end if
				end do
				
				mas::Pairs = lp 
			end if
		end if
		return mas
	end method
	
	method private Stmt checkAssembly(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens::get_Item(0)
	var typ as Type = gettype AssemblyTok
	b = typ::IsInstanceOfType(tok)
	var asms as AssemblyStmt = new AssemblyStmt()
	if b then
	asms::Line = stm::Line
	asms::Tokens = stm::Tokens
	asms::AsmName = $Ident$stm::Tokens::get_Item(1)
	asms::Mode = stm::Tokens::get_Item(2)
	end if
	return asms
	end method
	
	method private Stmt checkVer(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype VerTok
		var vers as VerStmt = new VerStmt()
		b = typ::IsInstanceOfType(stm::Tokens::get_Item(0))
		if b then
			vers::Line = stm::Line
			vers::Tokens = stm::Tokens
			var ars as string[] = ParseUtils::StringParser(stm::Tokens::get_Item(1)::Value,".")
			vers::VersionNos = new IntLiteral[] {new IntLiteral($integer$ars[0]),new IntLiteral($integer$ars[1]),new IntLiteral($integer$ars[2]),new IntLiteral($integer$ars[3])}
			stm = vers
		end if
		return vers
	end method

	method private Stmt checkClass(var stm as Stmt, var b as boolean&)
		var typ as Type = gettype ClassTok
		var sttyp as Type = gettype StructTok
		b = typ::IsInstanceOfType(stm::Tokens::get_Item(0)) or sttyp::IsInstanceOfType(stm::Tokens::get_Item(0))
		var clss as ClassStmt = new ClassStmt()
		var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
		var tempexp as Expr
		var stflg as boolean = false

		if b then
		
			if sttyp::IsInstanceOfType(stm::Tokens::get_Item(0)) then
				stflg = true
				clss::InhClass = new TypeTok(ILEmitter::Univ::Import(gettype ValueType))
			end if

			clss::Line = stm::Line
			clss::Tokens = stm::Tokens
			var i as integer = 0
	
			do until i >= (stm::Tokens::get_Count() - 1)
	
				i = i + 1
				typ = gettype Attributes.Attribute
	
				if typ::IsInstanceOfType(stm::Tokens::get_Item(i)) then
					clss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					var typ2 as Type = gettype ExtendsTok
					typ = gettype ImplementsTok
					if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						i = i + 1
						tempexp = new Expr()
						tempexp::Tokens = stm::Tokens
						tempexp = eopt::procType(tempexp,i)
						stm::Tokens = tempexp::Tokens
						
						if stflg = false then
							clss::InhClass = $TypeTok$stm::Tokens::get_Item(i)
						end if
					
					elseif typ::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						typ2 = gettype TypeTok
						typ = gettype Comma
						do until i = (stm::Tokens::get_Count() - 1)
							i = i + 1
							if typ::IsInstanceOfType(stm::Tokens::get_Item(i)) = false then
								tempexp = new Expr()
								tempexp::Tokens = stm::Tokens
								tempexp = eopt::procType(tempexp,i)
								stm::Tokens = tempexp::Tokens
								clss::AddInterface($TypeTok$stm::Tokens::get_Item(i))
							end if
						end do
					else
						clss::ClassName = $Ident$stm::Tokens::get_Item(i)
					end if

				end if
			end do
		end if
		
		return clss
	end method
	
	method private Stmt checkField(var stm as Stmt, var b as boolean&)
	
		b = stm::Tokens::get_Item(0) is FieldTok
		var flss as FieldStmt = new FieldStmt()
		
		if b then
		
			var tempexp as Expr = new Expr()
			tempexp::Tokens = stm::Tokens
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			
			flss::Line = stm::Line
			flss::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 3
			
			do until i = len
				i = i + 1
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					flss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i = i - 1
					break
				end if
			end do
			
			i = i + 1
			
			tempexp = eop::procType(tempexp,i)
			stm::Tokens = tempexp::Tokens
			flss::FieldTyp = $TypeTok$stm::Tokens::get_Item(i)
			
			i = i + 1
			flss::FieldName = $Ident$stm::Tokens::get_Item(i)
		
		end if
		
		return flss
	end method
	
	method private Stmt checkProperty(var stm as Stmt, var b as boolean&)
	
		b = stm::Tokens::get_Item(0) is PropertyTok
		var prss as PropertyStmt = new PropertyStmt()
		
		if b then
		
			var tempexp as Expr = new Expr()
			tempexp::Tokens = stm::Tokens
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			
			prss::Line = stm::Line
			prss::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 3
			
			do until i = len
				i = i + 1
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					prss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i = i - 1
					break
				end if
			end do
			
			i = i + 1
			
			tempexp = eop::procType(tempexp,i)
			stm::Tokens = tempexp::Tokens
			prss::PropertyTyp = $TypeTok$stm::Tokens::get_Item(i)
			
			i = i + 1
			prss::PropertyName = $Ident$stm::Tokens::get_Item(i)
		
		end if
		
		return prss
	end method
	
	method private Stmt checkEvent(var stm as Stmt, var b as boolean&)
	
		b = stm::Tokens::get_Item(0) is EventTok
		var evss as EventStmt = new EventStmt()
		
		if b then
		
			var tempexp as Expr = new Expr()
			tempexp::Tokens = stm::Tokens
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			
			evss::Line = stm::Line
			evss::Tokens = stm::Tokens
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 3
			
			do until i = len
				i = i + 1
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					evss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i = i - 1
					break
				end if
			end do
			
			i = i + 1
			
			tempexp = eop::procType(tempexp,i)
			stm::Tokens = tempexp::Tokens
			evss::EventTyp = $TypeTok$stm::Tokens::get_Item(i)
			
			i = i + 1
			evss::EventName = $Ident$stm::Tokens::get_Item(i)
		
		end if
		
		return evss
	end method
	
	method private Stmt checkMethod(var stm as Stmt, var b as boolean&)
	
		b = stm::Tokens::get_Item(0) is MethodTok
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
			
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i = i + 1
				//tok = stm::Tokens::get_Item(i)
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					mtss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i = i - 1
					break
				end if
			end do
			
			//get return type and name
			i = i + 1
			
			tempexp = eop::procType(tempexp,i)
			stm::Tokens = tempexp::Tokens
			mtss::RetTyp = $TypeTok$stm::Tokens::get_Item(i)
			
			len = stm::Tokens::get_Count() - 1
			i = i + 1
			
			if stm::Tokens::get_Item(i) is Ident then
				mtss::MethodName = $Ident$stm::Tokens::get_Item(i)
			end if
			
			i = i + 1
			
			if stm::Tokens::get_Item(i) is LParen then
				exp = null
				do until i = len
			
					//get parameters
					i = i + 1
				
					if stm::Tokens::get_Item(i) is RParen then
						if d then
							var eopt2 as ExprOptimizer = new ExprOptimizer(PFlags)
							exp = eopt2::checkVarAs(exp,ref bl)
							if bl then
								mtss::AddParam(exp)
							end if
						end if
						d = false
						break
					end if
				
					if stm::Tokens::get_Item(i) is VarTok then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					if stm::Tokens::get_Item(i) is InTok then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					if stm::Tokens::get_Item(i) is InOutTok then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					if stm::Tokens::get_Item(i) is OutTok then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					if stm::Tokens::get_Item(i) is LAParen then
						d = true
						lvl = lvl + 1
					end if
					
					if stm::Tokens::get_Item(i) is RAParen then
						d = true
						lvl = lvl - 1
					end if
			
					if (stm::Tokens::get_Item(i) is Comma) and (lvl == 0) then
						var eopt1 as ExprOptimizer = new ExprOptimizer(PFlags)
						exp = eopt1::checkVarAs(exp,ref bl)
						if bl then
							mtss::AddParam(exp)
						end if
						d = false
						exp = null
					end if
					
					if d then
						exp::AddToken(stm::Tokens::get_Item(i))
					end if
				end do
			end if

		end if
		return mtss
	end method
	
	method private Stmt checkDelegate(var stm as Stmt, var b as boolean&)
	
		var tok as Token = stm::Tokens::get_Item(0)
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
			var len as integer = stm::Tokens::get_Count() - 1
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i = i + 1
				tok = stm::Tokens::get_Item(i)
				typ = gettype Attributes.Attribute
			
				if typ::IsInstanceOfType(stm::Tokens::get_Item(i)) then
					dels::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
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
			dels::RetTyp = $TypeTok$stm::Tokens::get_Item(i)

			len = stm::Tokens::get_Count() - 1
			
			i = i + 1
			
			typ2 = gettype Ident
			if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
				dels::DelegateName = $Ident$stm::Tokens::get_Item(i)
			end if
			
			i = i + 1
			typ2 = gettype LParen
			if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
				
				exp = null
				do until i = len
			
					//get parameters
					i = i + 1
				
					typ2 = gettype RParen
					if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						if d then
							var eopt2 as ExprOptimizer = new ExprOptimizer(PFlags)
							exp = eopt2::checkVarAs(exp,ref bl)
							if bl then
								dels::AddParam(exp)
							end if
						end if
						d = false
						break
					end if
				
					typ2 = gettype VarTok
					if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype InTok
					if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype InOutTok
					if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					typ2 = gettype OutTok
					if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						d = true
						if exp = null then
							exp = new Expr()
						end if
					end if
				
					if lpt::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						d = true
						lvl = lvl + 1
					end if
					
					if rpt::IsInstanceOfType(stm::Tokens::get_Item(i)) then
						d = true
						lvl = lvl - 1
					end if
					
					typ2 = gettype Comma
					if typ2::IsInstanceOfType(stm::Tokens::get_Item(i)) and (lvl == 0) then
						var eopt1 as ExprOptimizer = new ExprOptimizer(PFlags)
						exp = eopt1::checkVarAs(exp,ref bl)
						if bl then
							dels::AddParam(exp)
						end if
						d = false
						exp = null
					end if
					
					if d then
						exp::AddToken(stm::Tokens::get_Item(i))
					end if
				end do
			end if
		
		end if
		return dels
	end method
	
	method private Stmt checkMethodCall(var stm as Stmt, var b as boolean&)
		var mtcss as MethodCallStmt = new MethodCallStmt()
		if stm::Tokens::get_Count() > 2 then
			b = stm::Tokens::get_Item(0) is Ident
			
			if b then
				mtcss::Line = stm::Line
				mtcss::Tokens = stm::Tokens
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = new Expr()
				exp::Line = stm::Line
				exp::Tokens = stm::Tokens
				exp = eopt::Optimize(exp)
				mtcss::MethodToken = exp::Tokens::get_Item(0)
			end if
		end if
		return mtcss
	end method
	
	method private Stmt checkGet(var stm as Stmt, var b as boolean&)
		var prgs as PropertyGetStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is GetTok) and (stm::Tokens::get_Item(1) is Ident)
			
			if b then
				prgs = new PropertyGetStmt()
				prgs::Line = stm::Line
				prgs::Tokens = stm::Tokens
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = new Expr()
				exp::Line = stm::Line
				exp::Tokens = stm::Tokens
				exp = eopt::Optimize(exp)
				if exp::Tokens::get_Item(1) is MethodCallTok then
					var mc as MethodCallTok = $MethodCallTok$exp::Tokens::get_Item(1)
					prgs::Getter = mc::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					prgs::Getter = $Ident$exp::Tokens::get_Item(1)
				else
					prgs::Getter = null
				end if
			end if
		end if
		return prgs
	end method
	
	method private Stmt checkSet(var stm as Stmt, var b as boolean&)
		var prss as PropertySetStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is SetTok) and (stm::Tokens::get_Item(1) is Ident)
			
			if b then
				prss = new PropertySetStmt()
				prss::Line = stm::Line
				prss::Tokens = stm::Tokens
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = new Expr()
				exp::Line = stm::Line
				exp::Tokens = stm::Tokens
				exp = eopt::Optimize(exp)
				if exp::Tokens::get_Item(1) is MethodCallTok then
					var mc as MethodCallTok = $MethodCallTok$exp::Tokens::get_Item(1)
					prss::Setter = mc::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					prss::Setter = $Ident$exp::Tokens::get_Item(1)
				else
					prss::Setter = null
				end if
			end if
		end if
		return prss
	end method
	
	method private Stmt checkRemove(var stm as Stmt, var b as boolean&)
		var evrs as EventRemoveStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is RemoveTok) and (stm::Tokens::get_Item(1) is Ident)
			
			if b then
				evrs = new EventRemoveStmt()
				evrs::Line = stm::Line
				evrs::Tokens = stm::Tokens
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = new Expr()
				exp::Line = stm::Line
				exp::Tokens = stm::Tokens
				exp = eopt::Optimize(exp)
				if exp::Tokens::get_Item(1) is MethodCallTok then
					var mc as MethodCallTok = $MethodCallTok$exp::Tokens::get_Item(1)
					evrs::Remover = mc::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					evrs::Remover = $Ident$exp::Tokens::get_Item(1)
				else
					evrs::Remover = null
				end if
			end if
		end if
		return evrs
	end method
	
	method private Stmt checkAdd(var stm as Stmt, var b as boolean&)
		var evas as EventAddStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is AddTok) and (stm::Tokens::get_Item(1) is Ident)
			
			if b then
				evas = new EventAddStmt()
				evas::Line = stm::Line
				evas::Tokens = stm::Tokens
				
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = new Expr()
				exp::Line = stm::Line
				exp::Tokens = stm::Tokens
				exp = eopt::Optimize(exp)
				if exp::Tokens::get_Item(1) is MethodCallTok then
					var mc as MethodCallTok = $MethodCallTok$exp::Tokens::get_Item(1)
					evas::Adder = mc::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					evas::Adder = $Ident$exp::Tokens::get_Item(1)
				else
					evas::Adder = null
				end if
			end if
		end if
		return evas
	end method
	
	method private Stmt checkVarAs(var stm as Stmt, var b as boolean&)
	var tok as Token = stm::Tokens::get_Item(0)
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
	vars::VarName = $Ident$stm::Tokens::get_Item(1)
	
	vars::VarTyp = $TypeTok$vars::Tokens::get_Item(3)

	
	end if
	return vars
	end method
	
		method private Stmt checkCatch(var stm as Stmt, var b as boolean&)
			var typ as Type = gettype CatchTok
			b = typ::IsInstanceOfType(stm::Tokens::get_Item(0))
			var cs as CatchStmt = new CatchStmt()
	
			if b then
				cs::Tokens = stm::Tokens
				var tempexp as Expr = new Expr()
				tempexp::Tokens = cs::Tokens
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				cs::Tokens = tempexp::Tokens
				stm::Tokens = tempexp::Tokens
				cs::Line = stm::Line
				cs::ExName = $Ident$stm::Tokens::get_Item(1)
	
				tempexp = eop::procType(tempexp,3)
				cs::Tokens = tempexp::Tokens
				cs::ExTyp = $TypeTok$cs::Tokens::get_Item(3)
					
			end if
			return cs
		end method
	
	method private Stmt AssOpt(var stm as Stmt)
		var asss as AssignStmt = $AssignStmt$stm
		var le as Expr = asss::LExp
		
		if le::Tokens::get_Count() >= 4 then
			var vass as VarAsgnStmt = new VarAsgnStmt()
			if (le::Tokens::get_Item(0) is VarTok) and (le::Tokens::get_Item(2) is AsTok) then
				vass::Tokens = asss::Tokens
				vass::Line = asss::Line
				vass::VarName = $Ident$le::Tokens::get_Item(1)
				
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				
				var tempexp as Expr = new Expr()
				tempexp::Tokens = le::Tokens
				tempexp = eop::procType(tempexp,3)
				le::Tokens = tempexp::Tokens
				
				vass::VarTyp = $TypeTok$le::Tokens::get_Item(3)
					
				vass::RExpr = asss::RExp
				vass::RExpr = eop::Optimize(vass::RExpr)
				
				return vass
			else
				return stm
			end if
		elseif le::Tokens::get_Count() >= 2 then
			var vass as InfVarAsgnStmt = new InfVarAsgnStmt()
			if le::Tokens::get_Item(0) is VarTok then
				vass::Tokens = asss::Tokens
				vass::Line = asss::Line
				vass::VarName = $Ident$le::Tokens::get_Item(1)
				
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				vass::RExpr = asss::RExp
				vass::RExpr = eop::Optimize(vass::RExpr)
				
				return vass
			else
				return stm
			end if
		else
			return stm
		end if
	end method
	
	method private Stmt checkAssign(var stm as Stmt, var b as boolean&)
		var asss as AssignStmt = new AssignStmt()
		var re as Expr = new Expr()
		var le as Expr = new Expr()
		var i as integer = -1
		var len as integer = stm::Tokens::get_Count() - 1
		var assind as integer = 0
		
		do until i = len
			i = i + 1
			if stm::Tokens::get_Item(i) is AssignOp then
				assind = i
				break
			end if
		end do
		
		if assind != 0 then
		
			i = -1
			len = assind - 1
			
			do until i = len
				i = i + 1
				le::AddToken(stm::Tokens::get_Item(i))
			end do
			
			i = assind
			len = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				re::AddToken(stm::Tokens::get_Item(i))
			end do
			
			asss::Line = stm::Line
			asss::Tokens = stm::Tokens
			asss::LExp = le
			asss::RExp = re
			
			b = true
			
			var asss2 as Stmt = AssOpt(asss)
			if (asss2 is VarAsgnStmt) or (asss2 is InfVarAsgnStmt) then
				return asss2
			else
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				re = eop::Optimize(re)
				le = eop::Optimize(le)
				asss::LExp = le
				asss::RExp = re
				return asss
			end if
		
		else
			b = false
			return stm
		end if
	end method
	
	method public Stmt Optimize(var stm as Stmt)
	
	var i as integer = -1
	var lenx as integer = stm::Tokens::get_Count() - 1
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
	
	if stm::Tokens::get_Count() = 0 then
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
		stm::Tokens::set_Item(i,to::Optimize(stm::Tokens::get_Item(i),stm::Tokens::get_Item(i + 1)))
	else
		stm::Tokens::set_Item(i,to::Optimize(stm::Tokens::get_Item(i),$Token$null))
	end if
	
	if i = lenx then
		goto cont
	else
		goto loop
	end if
	
	place cont
	
	if stm::Tokens::get_Count() = 0 then
		goto fin
	else
		i = -1
		var tok as Token
		var pcnt as integer = 0
		var acnt as integer = 0
		var scnt as integer = 0
		var ccnt as integer = 0
		do until i = (stm::Tokens::get_Count() - 1)
			i = i + 1
			tok = stm::Tokens::get_Item(i)
			if tok is LParen then
				pcnt = pcnt + 1
			elseif tok is RParen then
				pcnt = pcnt - 1
			elseif tok is LAParen then
				acnt = acnt + 1
			elseif tok is RAParen then
				acnt = acnt - 1
			elseif tok is LSParen then
				scnt = scnt + 1
			elseif tok is RSParen then
				scnt = scnt - 1
			elseif tok is LCParen then
				ccnt = ccnt + 1
			elseif tok is RCParen then
				ccnt = ccnt - 1
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
		elseif ccnt != 0 then
			StreamUtils::WriteLine(String::Empty)
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing curly parentheses do not match!.")
		end if
	end if
	
	tmpstm = checkCmt(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkImport(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkLocimport(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkAsmAttr(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkAssembly(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkVer(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkNS(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkClsAttr(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkClass(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDelegate(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkFldAttr(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkField(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkPropAttr(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkProperty(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEventAttr(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEvent(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkGet(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkSet(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkAdd(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkRemove(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkMetAttr(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkParamAttr(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkMethod(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkAssign(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkVarAs(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkCatch(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkReturn(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkLock(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkThrow(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkTry(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkFinally(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndLock(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndTry(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndMtd(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndProp(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndEvent(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndNS(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndCls(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDebug(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkHDefine(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkHUndef(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkScope(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkInclude(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkError(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkWarning(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkRefasm(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkRefstdasm(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkLabel(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkPlace(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkGoto(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkIf(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkHIf(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkWhile(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkUntil(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkForeach(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDoWhile(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDoUntil(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkElseIf(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkHElseIf(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkElse(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkHElse(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkDo(stm, ref compb)	
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkBreak(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkContinue(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndIf(stm, ref compb)	
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndHIf(stm, ref compb)	
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkEndDo(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	tmpstm = checkMethodCall(stm, ref compb)
	if compb then
		stm = tmpstm
		goto fin
	end if
	
	place fin
	
	return stm
	end method

end class
