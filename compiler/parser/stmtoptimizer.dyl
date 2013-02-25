//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
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
		if b then
			return new RefasmStmt() {Line = stm::Line, Tokens = stm::Tokens, AsmPath = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkRefstdasm(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is RefstdasmTok
		if b then
			return new RefstdasmStmt() {Line = stm::Line, Tokens = stm::Tokens, AsmPath = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkInclude(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is IncludeTok
		if b then
			return new IncludeStmt() {Line = stm::Line, Tokens = stm::Tokens, Path = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkError(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ErrorTok
		if b then
			return new ErrorStmt() {Line = stm::Line, Tokens = stm::Tokens, Msg = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkWarning(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is WarningTok
		if b then
			return new WarningStmt() {Line = stm::Line, Tokens = stm::Tokens, Msg = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is IfTok
		
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				var tok as Token = stm::Tokens::get_Item(i)		
				
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new IfStmt() {Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkHIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HIfTok
		
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				var tok as Token = stm::Tokens::get_Item(i)	
				
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new HIfStmt() {Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkWhile(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is WhileTok
		
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			
			do until i = (stm::Tokens::get_Count() - 1)
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
			
			return new WhileStmt(){Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkDoWhile(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then	
			b = (stm::Tokens::get_Item(0) is DoTok) and (stm::Tokens::get_Item(1) is WhileTok)
			
			if b then
				var exp as Expr = new Expr()
				var i as integer = 1
				
				do until i = (stm::Tokens::get_Count() - 1)
					i = i + 1
					exp::AddToken(stm::Tokens::get_Item(i))
				end do
				
				return new DoWhileStmt() {Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
			end if
		end if
		
		return null
	end method
	
	method private Stmt checkUntil(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is UntilTok
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			
			do until i = (stm::Tokens::get_Count() - 1)
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))	
			end do
			
			return new UntilStmt() {Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkDoUntil(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is DoTok) and (stm::Tokens::get_Item(1) is UntilTok)
			
			if b then
				var exp as Expr = new Expr()
				var i as integer = 1

				do until i = (stm::Tokens::get_Count() - 1)
					i = i + 1
					exp::AddToken(stm::Tokens::get_Item(i))
				end do
				
				return new DoUntilStmt() {Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
			end if	
		end if
	
		return null
	end method
	
	method private Stmt checkForeach(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ForeachTok
		if b then
			var exp as Expr = new Expr()
			var i as integer = 2
			
			do until i = (stm::Tokens::get_Count() - 1)
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))	
			end do
			
			return new ForeachStmt() {Line = stm::Line, Tokens = stm::Tokens, Iter = $Ident$stm::Tokens::get_Item(1), Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkElseIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ElseIfTok
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				var tok as Token = stm::Tokens::get_Item(i)
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new ElseIfStmt() {Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkHElseIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HElseIfTok
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			
			do until i = len
				i = i + 1
				var tok as Token = stm::Tokens::get_Item(i)
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new HElseIfStmt() {Line = stm::Line, Tokens = stm::Tokens, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkLabel(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is LabelTok
		if b then
			return new LabelStmt() {Line = stm::Line, Tokens = stm::Tokens, LabelName = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkPlace(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is PlaceTok
		if b then
			return new PlaceStmt() {Line = stm::Line, Tokens = stm::Tokens, LabelName = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkGoto(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is GotoTok
		if b then
			return new GotoStmt() {Line = stm::Line, Tokens = stm::Tokens, LabelName = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkHDefine(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HDefineTok
		if b then
			return new HDefineStmt() {Line = stm::Line, Tokens = stm::Tokens, Symbol = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkHUndef(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HUndefTok
		if b then
			return new HUndefStmt() {Line = stm::Line, Tokens = stm::Tokens, Symbol = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkDebug(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is DebugTok
		if b then	
			return new DebugStmt() {Line = stm::Line, Tokens = stm::Tokens, Opt = $SwitchTok$stm::Tokens::get_Item(1), setFlg()}
		end if
		return null
	end method
	
	method private Stmt checkScope(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ScopeTok
		if b then
			return new ScopeStmt() {Line = stm::Line, Tokens = stm::Tokens, Opt = $SwitchTok$stm::Tokens::get_Item(1), setFlg()}
		end if
		return null
	end method
	
	method private Stmt checkImport(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ImportTok
		if b then
			var imps as ImportStmt = new ImportStmt() {Line = stm::Line, Tokens = stm::Tokens}
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
			return imps
		end if
		return null
	end method
	
	method private Stmt checkNS(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is NamespaceTok
		if b then
			return new NSStmt() {Line = stm::Line, Tokens = stm::Tokens, NS = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkLocimport(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is LocimportTok
		if b then
			return new LocimportStmt() {Line = stm::Line, Tokens = stm::Tokens, NS = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkReturn(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ReturnTok
		if b then
			var rets as ReturnStmt = new ReturnStmt() {Line = stm::Line, Tokens = stm::Tokens}
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
				rets::RExp = new ExprOptimizer(PFlags)::Optimize(exp)
			end if
			return rets
		end if
		
		return null
	end method
	
	method private Stmt checkThrow(var stm as Stmt, var b as boolean&)
		b = (stm::Tokens::get_Item(0) is ThrowTok) and (stm::Tokens::get_Count() >= 2)
		if b then
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			var exp as Expr = new Expr()
			
			do until i = len
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
	
			return new ThrowStmt() {Line = stm::Line, Tokens = stm::Tokens, RExp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		return null
	end method
	
	method private Stmt checkLock(var stm as Stmt, var b as boolean&)
		b = (stm::Tokens::get_Item(0) is LockTok) and (stm::Tokens::get_Count() >= 2)
		if b then

			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			var exp as Expr = new Expr()
			
			do until i = len
				i = i + 1
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
			
			return new LockStmt() {Line = stm::Line, Tokens = stm::Tokens, Lockee = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		return null
	end method
		
	
	method private Stmt checkCmt(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is CommentTok
		if b then
			return new CommentStmt() {Line = stm::Line, Tokens = stm::Tokens}
		end if
		return null
	end method
	
	method private Stmt checkElse(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is ElseTok
			if b then
				return new ElseStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkHElse(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is HElseTok
			if b then
				return new HElseStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkDo(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then
			b = stm::Tokens::get_Item(0) is DoTok
			if b then
				return new DoStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkTry(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then
			b = stm::Tokens::get_Item(0) is TryTok
			if b then
				return new TryStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method

	method private Stmt checkFinally(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then
			b = stm::Tokens::get_Item(0) is FinallyTok
			if b then
				return new FinallyStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkBreak(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is BreakTok
			if b then
				return new BreakStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkContinue(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is ContinueTok
			if b then
				return new ContinueStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	
	method private Stmt checkEndIf(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is IfTok)
			if b then
				return new EndIfStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndHIf(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is HIfTok)
			if b then
				return new EndHIfStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndProp(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is PropertyTok)
			if b then
				return new EndPropStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndEvent(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is EventTok)
			if b then
				return new EndEventStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndMtd(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is MethodTok)
			if b then
				return new EndMethodStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndNS(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is NamespaceTok)
			if b then
				return new EndNSStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	
	method private Stmt checkEndCls(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and ((stm::Tokens::get_Item(1) is ClassTok) or (stm::Tokens::get_Item(1) is StructTok))
			if b then
				return new EndClassStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndDo(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and ((stm::Tokens::get_Item(1) is DoTok) or (stm::Tokens::get_Item(1) is ForTok))
			if b then
				return new EndDoStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndTry(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is TryTok)
			if b then
				return new EndTryStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkEndLock(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is EndTok) and (stm::Tokens::get_Item(1) is LockTok)
			if b then
				return new EndLockStmt() {Line = stm::Line, Tokens = stm::Tokens}
			end if
		end if
		return null
	end method
	
	method private Stmt checkMetAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is MethodCTok)

			if b then
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var tempexp as Expr = eopt::procNewCall(eopt::procType(new Expr() {Tokens = stm::Tokens},2),2)
				var mas as MethodAttrStmt = new MethodAttrStmt() {Tokens = tempexp::Tokens, Ctor = $NewCallTok$tempexp::Tokens::get_Item(2), Line = stm::Line}
				
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
		return null
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
		b = stm::Tokens::get_Item(0) is AssemblyTok
		if b then
			return new AssemblyStmt() {Line = stm::Line, Tokens = stm::Tokens, AsmName = $Ident$stm::Tokens::get_Item(1), Mode = stm::Tokens::get_Item(2)}
		end if
		return null
	end method
	
	method private Stmt checkVer(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is VerTok
		if b then
			var vers as VerStmt = new VerStmt() {Line = stm::Line, Tokens = stm::Tokens}
			var ars as string[] = ParseUtils::StringParser(stm::Tokens::get_Item(1)::Value,".")
			vers::VersionNos = new IntLiteral[] {new IntLiteral($integer$ars[0]),new IntLiteral($integer$ars[1]),new IntLiteral($integer$ars[2]),new IntLiteral($integer$ars[3])}
			return vers
		end if
		return null
	end method

	method private Stmt checkClass(var stm as Stmt, var b as boolean&)
		b = (stm::Tokens::get_Item(0) is ClassTok) or (stm::Tokens::get_Item(0) is StructTok)
		var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
		var stflg as boolean = false

		if b then
			var clss as ClassStmt = new ClassStmt() {Line = stm::Line, Tokens = stm::Tokens}		
			if stm::Tokens::get_Item(0) is StructTok then
				stflg = true
				clss::InhClass = new TypeTok(ILEmitter::Univ::Import(gettype ValueType))
			end if
			
			var i as integer = 0
	
			do until i >= (stm::Tokens::get_Count() - 1)
				i = i + 1
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					clss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					if stm::Tokens::get_Item(i) is ExtendsTok then
						i = i + 1
						stm::Tokens = eopt::procType(new Expr() {Tokens = stm::Tokens}, i)::Tokens
						if stflg = false then
							clss::InhClass = $TypeTok$stm::Tokens::get_Item(i)
						end if
					elseif stm::Tokens::get_Item(i) is ImplementsTok then
						do until i = (stm::Tokens::get_Count() - 1)
							i = i + 1
							if (stm::Tokens::get_Item(i) is Comma) = false then
								stm::Tokens = eopt::procType(new Expr() {Tokens = stm::Tokens}, i)::Tokens
								clss::AddInterface($TypeTok$stm::Tokens::get_Item(i))
							end if
						end do
					else
						clss::ClassName = $Ident$stm::Tokens::get_Item(i)
					end if
				end if
			end do
			return clss
		end if
		
		return null
	end method
	
	method private Stmt checkField(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is FieldTok
		
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var flss as FieldStmt = new FieldStmt() {Line = stm::Line, Tokens = stm::Tokens}
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
			stm::Tokens = eop::procType(new Expr() {Tokens = stm::Tokens}, i)::Tokens
			flss::FieldTyp = $TypeTok$stm::Tokens::get_Item(i)
			i = i + 1
			flss::FieldName = $Ident$stm::Tokens::get_Item(i)
			return flss
		end if
		
		return null
	end method
	
	method private Stmt checkProperty(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is PropertyTok
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var prss as PropertyStmt = new PropertyStmt() {Line = stm::Line, Tokens = stm::Tokens}
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
			stm::Tokens = eop::procType(new Expr() {Tokens = stm::Tokens}, i)::Tokens
			prss::PropertyTyp = $TypeTok$stm::Tokens::get_Item(i)
			i = i + 1
			prss::PropertyName = $Ident$stm::Tokens::get_Item(i)
			return prss
		end if
		
		return null
	end method
	
	method private Stmt checkEvent(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is EventTok
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var evss as EventStmt = new EventStmt() {Line = stm::Line, Tokens = stm::Tokens}
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
			stm::Tokens = eop::procType(new Expr() {Tokens = stm::Tokens}, i)::Tokens
			evss::EventTyp = $TypeTok$stm::Tokens::get_Item(i)
			i = i + 1
			evss::EventName = $Ident$stm::Tokens::get_Item(i)
			return evss
		end if
		
		return null
	end method
	
	method private Stmt checkMethod(var stm as Stmt, var b as boolean&)
	
		b = stm::Tokens::get_Item(0) is MethodTok
		var mtss as MethodStmt = null
		var exp as Expr = null
		var d as boolean = false
		
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			mtss = new MethodStmt() {Line = stm::Line, Tokens = stm::Tokens}
			var lvl as integer = 0
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i = i + 1
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					mtss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i = i - 1
					break
				end if
			end do
			
			//get return type and name
			i = i + 1
			
			stm::Tokens = eop::procType(new Expr() {Tokens = stm::Tokens}, i)::Tokens
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
		b = stm::Tokens::get_Item(0) is DelegateTok
		var dels as DelegateStmt = null
		var exp as Expr = null
		var d as boolean = false
		
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			dels = new DelegateStmt() {Line = stm::Line, Tokens = stm::Tokens}
			var lvl as integer = 0	
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 1
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i = i + 1
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					dels::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i = i - 1
					break
				end if
			end do
			
			//get return type and name
			i = i + 1
			stm::Tokens = eop::procType(new Expr() {Tokens = stm::Tokens}, i)::Tokens
			dels::RetTyp = $TypeTok$stm::Tokens::get_Item(i)
			len = stm::Tokens::get_Count() - 1
			i = i + 1
			
			if stm::Tokens::get_Item(i) is Ident then
				dels::DelegateName = $Ident$stm::Tokens::get_Item(i)
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
								dels::AddParam(exp)
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
		b = false
		if stm::Tokens::get_Count() > 2 then
			b = (stm::Tokens::get_Item(0) is Ident) or (stm::Tokens::get_Item(0) is NewTok)
			if b then
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				return new MethodCallStmt() {Line = stm::Line, Tokens = stm::Tokens, MethodToken = eopt::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})::Tokens::get_Item(0)}
			end if
		end if
		return null
	end method
	
	method private Stmt checkGet(var stm as Stmt, var b as boolean&)
		var prgs as PropertyGetStmt = null
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is GetTok) and (stm::Tokens::get_Item(1) is Ident)
			
			if b then
				prgs = new PropertyGetStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = eopt::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
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
				prss = new PropertySetStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = eopt::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
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
				evrs = new EventRemoveStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = eopt::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
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
				evas = new EventAddStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
				var exp as Expr = eopt::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
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
		b = stm::Tokens::get_Item(0) is VarTok
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var tempexp as Expr = eop::procType(new Expr() {Tokens = stm::Tokens}, 3)
			return new VarStmt() {Tokens = tempexp::Tokens, Line = stm::Line, VarName = $Ident$tempexp::Tokens::get_Item(1), VarTyp = $TypeTok$tempexp::Tokens::get_Item(3)}
		end if
		return null
	end method
	
	method private Stmt checkCatch(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is CatchTok
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var tempexp as Expr = eop::procType(new Expr() {Tokens = stm::Tokens}, 3)
			return new CatchStmt() {Tokens = tempexp::Tokens, Line = stm::Line, ExName = $Ident$tempexp::Tokens::get_Item(1), ExTyp = $TypeTok$tempexp::Tokens::get_Item(3)}
		end if
		return null
	end method
	
	method private Stmt AssOpt(var stm as Stmt)
		var asss as AssignStmt = $AssignStmt$stm
		var le as Expr = asss::LExp
		var eop as ExprOptimizer = new ExprOptimizer(PFlags)
		
		if le::Tokens::get_Count() >= 4 then
			if (le::Tokens::get_Item(0) is VarTok) and (le::Tokens::get_Item(2) is AsTok) then
				le::Tokens = eop::procType(new Expr() {Tokens = le::Tokens}, 3)::Tokens		
				return new VarAsgnStmt() {Line = asss::Line, VarName = $Ident$le::Tokens::get_Item(1), Tokens = asss::Tokens, VarTyp = $TypeTok$le::Tokens::get_Item(3), RExpr = eop::Optimize(asss::RExp)}
			else
				return stm
			end if
		elseif le::Tokens::get_Count() >= 2 then
			if le::Tokens::get_Item(0) is VarTok then
				return new InfVarAsgnStmt() {Line = asss::Line, Tokens = asss::Tokens, VarName = $Ident$le::Tokens::get_Item(1), RExpr = eop::Optimize(asss::RExp)}
			else
				return stm
			end if
		else
			return stm
		end if
	end method
	
	method private Stmt checkAssign(var stm as Stmt, var b as boolean&)
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
			
			b = true
			var asss as AssignStmt = new AssignStmt() {Line = stm::Line, Tokens = stm::Tokens, LExp = le, RExp = re}
			var asss2 as Stmt = AssOpt(asss)
			if (asss2 is VarAsgnStmt) or (asss2 is InfVarAsgnStmt) then
				return asss2
			else
				var eop as ExprOptimizer = new ExprOptimizer(PFlags)
				asss::LExp = eop::Optimize(le)
				asss::RExp = eop::Optimize(re)
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
		
		if stm::Tokens::get_Count() = 0 then
			return stm
		end if
		
		do until i = lenx
			i = i + 1
			if PFlags::CmtFlag then
				break
			elseif PFlags::NoOptFlag then
				break
			end if
			if i != lenx then
				stm::Tokens::set_Item(i,to::Optimize(stm::Tokens::get_Item(i),stm::Tokens::get_Item(i + 1)))
			else
				stm::Tokens::set_Item(i,to::Optimize(stm::Tokens::get_Item(i),$Token$null))
			end if
		end do
		
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
		
		tmpstm = checkCmt(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkImport(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkLocimport(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkAsmAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkAssembly(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkVer(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkNS(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkClsAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkClass(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkDelegate(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkFldAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkField(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkPropAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkProperty(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEventAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEvent(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkGet(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkSet(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkAdd(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkRemove(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkMetAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkParamAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkMethod(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkAssign(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkVarAs(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkCatch(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkReturn(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkLock(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkThrow(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkTry(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkFinally(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndLock(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndTry(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndMtd(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndProp(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndEvent(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndNS(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndCls(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkDebug(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkHDefine(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkHUndef(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkScope(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkInclude(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkError(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkWarning(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkRefasm(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkRefstdasm(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkLabel(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkPlace(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkGoto(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkIf(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkHIf(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkWhile(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkUntil(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkForeach(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkDoWhile(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkDoUntil(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkElseIf(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkHElseIf(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkElse(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkHElse(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkDo(stm, ref compb)	
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkBreak(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkContinue(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndIf(stm, ref compb)	
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndHIf(stm, ref compb)	
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEndDo(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkMethodCall(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		return stm
	end method

end class
