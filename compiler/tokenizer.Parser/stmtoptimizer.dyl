//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtOptimizer

	field public Flags PFlags
	
	method public void StmtOptimizer(var pf as Flags)
		me::ctor()
		PFlags = pf
	end method
	
	method public void StmtOptimizer()
		ctor(new Flags())
	end method

	method private Stmt checkRefasm(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is RefasmTok
		if b then
			return new RefasmStmt() {Line = stm::Line, AsmPath = stm::Tokens::get_Item(1)}
		end if
		return null
	end method

	method private Stmt checkSign(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is SignTok
		if b then
			return new SignStmt() {Line = stm::Line, KeyPath = stm::Tokens::get_Item(1)}
		end if
		return null
	end method

	method private Stmt checkEmbed(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is EmbedTok
		if b then
			return new EmbedStmt() {Line = stm::Line, Path = stm::Tokens::get_Item(1)}
		end if
		return null
	end method

	method private Stmt checkRefstdasm(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is RefstdasmTok
		if b then
			return new RefstdasmStmt() {Line = stm::Line, AsmPath = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkInclude(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is IncludeTok
		if b then
			return new IncludeStmt() {Line = stm::Line, Path = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkError(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ErrorTok
		if b then
			return new ErrorStmt() {Line = stm::Line, Msg = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkWarning(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is WarningTok
		if b then
			return new WarningStmt() {Line = stm::Line, Msg = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is IfTok
		
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count()
			
			do until i = len
				i++
				var tok as Token = stm::Tokens::get_Item(i)		
				
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new IfStmt() {Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkHIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HIfTok
		
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count()
			
			do until i = len
				i++
				var tok as Token = stm::Tokens::get_Item(i)	
				
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new HIfStmt() {Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkWhile(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is WhileTok
		
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			
			do until i = --stm::Tokens::get_Count() 
				i++
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
			
			return new WhileStmt(){Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
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
				
				do until i = --stm::Tokens::get_Count() 
					i++
					exp::AddToken(stm::Tokens::get_Item(i))
				end do
				
				return new DoWhileStmt() {Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
			end if
		end if
		
		return null
	end method
	
	method private Stmt checkUntil(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is UntilTok
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			
			do until i = --stm::Tokens::get_Count() 
				i++
				exp::AddToken(stm::Tokens::get_Item(i))	
			end do
			
			return new UntilStmt() {Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
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

				do until i = --stm::Tokens::get_Count() 
					i++
					exp::AddToken(stm::Tokens::get_Item(i))
				end do
				
				return new DoUntilStmt() {Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
			end if	
		end if
	
		return null
	end method
	
	method private Stmt checkForeach(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ForeachTok
		if b then
			var iter = stm::Tokens::get_Item(1) as Ident
			if iter == null then
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an identifier after a 'foreach'!")
			end if
			
			var exp as Expr = new Expr() {Line = stm::Line}
			var i as integer = 2
			var typ as TypeTok = null
			
			if stm::Tokens::get_Item(i) is InTok then
			elseif stm::Tokens::get_Item(i) is AsTok then
				stm::Tokens = new ExprOptimizer()::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, 3)::Tokens
				typ = $TypeTok$stm::Tokens::get_Item(3)
				i = 4
				if !#expr(stm::Tokens::get_Item(i) is InTok) then
					StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an 'in' after 'as <type>' instead of '" + stm::Tokens::get_Item(i)::Value + "'!")
				end if
			else 
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an 'as' or an 'in' instead of '" + stm::Tokens::get_Item(i)::Value + "'!")
			end if
			
			do until i = --stm::Tokens::get_Count() 
				i++
				exp::AddToken(stm::Tokens::get_Item(i))	
			end do
			
			return new ForeachStmt() {Line = stm::Line, Iter = iter, Typ = typ, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkFor(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ForTok
		if b then
			var iter = stm::Tokens::get_Item(1) as Ident
			if iter == null then
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an identifier after a 'for'!")
			end if
			
			var startexp as Expr = new Expr() {Line = stm::Line}
			var endexp as Expr = new Expr() {Line = stm::Line}
			var stepexp as Expr = null
			var direction as boolean = true
			var status as integer = 1
			
			var i as integer = 2
			var typ as TypeTok = null
			
			if stm::Tokens::get_Item(i) is AssignOp2 then
			elseif stm::Tokens::get_Item(i) is AsTok then
				stm::Tokens = new ExprOptimizer()::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, 3)::Tokens
				typ = $TypeTok$stm::Tokens::get_Item(3)
				i = 4
				if !#expr(stm::Tokens::get_Item(i) is AssignOp2) then
					StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an '=' after 'as <type>' instead of '" + stm::Tokens::get_Item(i)::Value + "'!")
				end if
			else 
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an 'as' or an '=' instead of '" + stm::Tokens::get_Item(i)::Value + "'!")
			end if
			
			do until i = --stm::Tokens::get_Count() 
				i++
				var curtok as Token = stm::Tokens::get_Item(i)
				
				if curtok is UptoTok then
					if status == 1 then
						status = 2
						direction = true
						continue
					elseif status == 2 then
						StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Did not expect an 'upto' after another 'upto'/'downto' was met!")
						break
					elseif status == 3 then
						StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Did not expect an 'upto' after a 'step' was met!")
						break
					end if
				elseif curtok is DowntoTok then
					if status == 1 then
						status = 2
						direction = false
						continue
					elseif status == 2 then
						StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Did not expect a 'downto' after another 'upto'/'downto' was met!")
						break
					elseif status == 3 then
						StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Did not expect a 'downto' after a 'step' was met!")
						break
					end if
				elseif curtok is StepTok then
					if status == 1 then
						StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Did not expect a 'step' before an 'upto'/'downto' wasn't even met!")
						break
					elseif status == 2 then
						status = 3
						stepexp = new Expr() {Line = stm::Line}
						continue
					elseif status == 3 then
						StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Did not expect a 'step' after another 'step' was met!")
						break
					end if
				end if
				
				if status == 1 then
					startexp::AddToken(curtok)
				elseif status == 2 then
					endexp::AddToken(curtok)
				elseif status == 3 then
					stepexp::AddToken(curtok)
				end if
			end do
			
			if status < 2 then
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "For loops require the use of a 'downto'/'upto' clause!")
			end if
			
			var eopt = new ExprOptimizer(PFlags)
			return new ForStmt() {Line = stm::Line, Iter = iter, Typ = typ, _
				StartExp = eopt::Optimize(startexp), EndExp = eopt::Optimize(endexp), Direction = direction, _
				StepExp = #ternary {stepexp == null ? $Expr$null, eopt::Optimize(stepexp)} }
		end if
		
		return null
	end method
	
	method private Stmt checkElseIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ElseIfTok
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count() 
			
			do until i = len
				i++
				var tok as Token = stm::Tokens::get_Item(i)
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new ElseIfStmt() {Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkHElseIf(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HElseIfTok
		if b then
			var exp as Expr = new Expr()
			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count() 
			
			do until i = len
				i++
				var tok as Token = stm::Tokens::get_Item(i)
				if tok is ThenTok then
					break
				else
					exp::AddToken(tok)
				end if
			end do
			
			return new HElseIfStmt() {Line = stm::Line, Exp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		
		return null
	end method
	
	method private Stmt checkLabel(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is LabelTok
		if b then
			return new LabelStmt() {Line = stm::Line, LabelName = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkPlace(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is PlaceTok
		if b then
			return new PlaceStmt() {Line = stm::Line, LabelName = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkGoto(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is GotoTok
		if b then
			return new GotoStmt() {Line = stm::Line, LabelName = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkHDefine(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HDefineTok
		if b then
			return new HDefineStmt() {Line = stm::Line, Symbol = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkHUndef(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is HUndefTok
		if b then
			return new HUndefStmt() {Line = stm::Line, Symbol = $Ident$stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkDebug(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is DebugTok
		if b then	
			return new DebugStmt() {Line = stm::Line, Opt = $SwitchTok$stm::Tokens::get_Item(1), setFlg()}
		end if
		return null
	end method
	
	method private Stmt checkScope(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ScopeTok
		if b then
			return new ScopeStmt() {Line = stm::Line, Opt = $SwitchTok$stm::Tokens::get_Item(1), setFlg()}
		end if
		return null
	end method
	
	method private Stmt checkImport(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ImportTok
		if b then
			var imps as ImportStmt = new ImportStmt() {Line = stm::Line}
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
			return new NSStmt() {Line = stm::Line, NS = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkLocimport(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is LocimportTok
		if b then
			return new LocimportStmt() {Line = stm::Line, NS = stm::Tokens::get_Item(1)}
		end if
		return null
	end method
	
	method private Stmt checkReturn(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is ReturnTok
		if b then
			var rets as ReturnStmt = new ReturnStmt() {Line = stm::Line}
			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count() 
			
			if stm::Tokens::get_Count() = 1 then
				rets::RExp = null
			elseif stm::Tokens::get_Count() >= 2 then
				var exp as Expr = new Expr()
				do
					i++
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
			var len as integer = --stm::Tokens::get_Count() 
			var exp as Expr = new Expr()
			
			do until i = len
				i++
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
	
			return new ThrowStmt() {Line = stm::Line, RExp = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		return null
	end method
	
	method private Stmt checkLock(var stm as Stmt, var b as boolean&)
		b = (stm::Tokens::get_Item(0) is LockTok) and (stm::Tokens::get_Count() >= 2)
		if b then

			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count() 
			var exp as Expr = new Expr()
			
			do until i = len
				i++
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
			
			return new LockStmt() {Line = stm::Line, Lockee = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		return null
	end method
		
	method private Stmt checkTryLock(var stm as Stmt, var b as boolean&)
		b = (stm::Tokens::get_Item(0) is TryLockTok) and (stm::Tokens::get_Count() >= 2)
		if b then

			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count() 
			var exp as Expr = new Expr()
			
			do until i = len
				i++
				exp::AddToken(stm::Tokens::get_Item(i))
			end do
			
			return new TryLockStmt() {Line = stm::Line, Lockee = new ExprOptimizer(PFlags)::Optimize(exp)}
		end if
		return null
	end method

	method private Stmt checkCmt(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is CommentTok
		if b then
			return new CommentStmt() {Line = stm::Line}
		end if
		return null
	end method
	
	method private Stmt checkElse(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is ElseTok
			if b then
				return new ElseStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkHElse(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is HElseTok
			if b then
				return new HElseStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkDo(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then
			b = stm::Tokens::get_Item(0) is DoTok
			if b then
				return new DoStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkTry(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then
			b = stm::Tokens::get_Item(0) is TryTok
			if b then
				return new TryStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method

	method private Stmt checkFinally(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then
			b = stm::Tokens::get_Item(0) is FinallyTok
			if b then
				return new FinallyStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkBreak(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is BreakTok
			if b then
				return new BreakStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkContinue(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() < 2 then	
			b = stm::Tokens::get_Item(0) is ContinueTok
			if b then
				return new ContinueStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	
	method private Stmt checkEnd(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = stm::Tokens::get_Item(0) is EndTok
			
			if b then
				b = stm::Tokens::get_Item(1) is IfTok
				if b then
					return new EndIfStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is HIfTok
				if b then
					return new EndHIfStmt() {Line = stm::Line}
				end if
				
				b = (stm::Tokens::get_Item(1) is DoTok) or (stm::Tokens::get_Item(1) is ForTok)
				if b then
					return new EndDoStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is PropertyTok
				if b then
					return new EndPropStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is EventTok
				if b then
					return new EndEventStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is MethodTok
				if b then
					return new EndMethodStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is NamespaceTok
				if b then
					return new EndNSStmt() {Line = stm::Line}
				end if
				
				b = (stm::Tokens::get_Item(1) is ClassTok) or (stm::Tokens::get_Item(1) is StructTok)
				if b then
					return new EndClassStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is EnumTok
				if b then
					return new EndEnumStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is TryTok
				if b then
					return new EndTryStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is LockTok
				if b then
					return new EndLockStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is UsingTok
				if b then
					return new EndUsingStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is SetTok
				if b then
					return new EndSetStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is GetTok
				if b then
					return new EndGetStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is RemoveTok
				if b then
					return new EndRemoveStmt() {Line = stm::Line}
				end if
				
				b = stm::Tokens::get_Item(1) is AddTok
				if b then
					return new EndAddStmt() {Line = stm::Line}
				end if
				
				StreamUtils::WriteError(stm::Line, PFlags::CurPath, c"\nUnexpected token '" + stm::Tokens::get_Item(1)::ToString() + "' after 'end'!.")
			end if
		end if
		return null
	end method
	
	method private AttrStmt parseCustAttr(var mas as AttrStmt, var stm as Stmt)
		var eopt as ExprOptimizer = new ExprOptimizer(PFlags)
		var tempexp as Expr = eopt::procNewCall(eopt::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens},2),2)
		
		mas::Tokens = tempexp::Tokens
		mas::Ctor = $NewCallTok$tempexp::Tokens::get_Item(2)
		mas::Line = stm::Line
		
		for j = 0 upto --mas::Ctor::Params::get_Count()
			mas::Ctor::Params::set_Item(j,eopt::Optimize(mas::Ctor::Params::get_Item(j)))
		end for
		
		var lp as C5.ArrayList<of AttrValuePair> = new C5.ArrayList<of AttrValuePair>()
		var curvp as AttrValuePair = null
		var eqf as boolean = false
		
		for i = 3 upto --mas::Tokens::get_Count()
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
				curvp = new AttrValuePair() {ValueExpr = new Expr()}
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
		end for

		mas::Tokens = new C5.ArrayList<of Token>(0)
		mas::Pairs = lp
		return mas
	end method
	
	method private Stmt checkMetAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is MethodCTok)

			if b then
				return parseCustAttr(new MethodAttrStmt(), stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkEnumAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is EnumCTok)

			if b then
				return parseCustAttr(new EnumAttrStmt(), stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkFldAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is FieldCTok)

			if b then
				return parseCustAttr(new FieldAttrStmt(), stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkClsAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is ClassCTok)

			if b then
				return parseCustAttr(new ClassAttrStmt(), stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkAsmAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is AssemblyCTok)

			if b then
				return parseCustAttr(new AssemblyAttrStmt(), stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkEventAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is EventCTok)

			if b then
				return parseCustAttr(new EventAttrStmt(), stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkPropAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is PropertyCTok)

			if b then
				return parseCustAttr(new PropertyAttrStmt(), stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkParamAttr(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is LSParen) and (stm::Tokens::get_Item(1) is ParameterCTok)

			if b then
				var pct as ParameterCTok = $ParameterCTok$stm::Tokens::get_Item(1)
				return parseCustAttr(new ParameterAttrStmt() {Index = $integer$pct::Value::Substring(9,pct::Value::get_Length() - 10)}, stm)
			end if
		end if
		return null
	end method
	
	method private Stmt checkAssembly(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is AssemblyTok
		if b then
			return new AssemblyStmt() {Line = stm::Line, AsmName = $Ident$stm::Tokens::get_Item(1), Mode = stm::Tokens::get_Item(2)}
		end if
		return null
	end method
	
	method private Stmt checkVer(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is VerTok
		if b then
			var vers as VerStmt = new VerStmt() {Line = stm::Line}
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
			var clss as ClassStmt = new ClassStmt() {Line = stm::Line}		
			if stm::Tokens::get_Item(0) is StructTok then
				stflg = true
				clss::InhClass = new TypeTok("System.ValueType")
			end if
			
			var i as integer = 0
	
			do until i >= --stm::Tokens::get_Count() 
				i++
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					clss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					if stm::Tokens::get_Item(i) is ExtendsTok then
						i++
						stm::Tokens = eopt::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
						if !stflg then
							clss::InhClass = $TypeTok$stm::Tokens::get_Item(i)
						end if
					elseif stm::Tokens::get_Item(i) is ImplementsTok then
						do until i = --stm::Tokens::get_Count() 
							i++
							if (stm::Tokens::get_Item(i) is Comma) = false then
								stm::Tokens = eopt::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
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
			var flss as FieldStmt = new FieldStmt() {Line = stm::Line}
			var i as integer = 0
			
			do while i <= --stm::Tokens::get_Count()
				i++
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					flss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i--
					break
				end if
			end do
			
			i++
			stm::Tokens = eop::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
			flss::FieldTyp = $TypeTok$stm::Tokens::get_Item(i)
			i++
			flss::FieldName = $Ident$stm::Tokens::get_Item(i)
			
			if i < --stm::Tokens::get_Count() then
				i++
				if !#expr(stm::Tokens::get_Item(i) is AssignOp2) then
					StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an '=' or nothing at all after the field name instead of '" + stm::Tokens::get_Item(i)::Value + "'!")
				end if
				
				var cexp as Expr = new Expr()
				do until i == --stm::Tokens::get_Count()
					i++
					cexp::AddToken(stm::Tokens::get_Item(i))
				end do
				flss::ConstExp = eop::Optimize(cexp)
			end if
			
			return flss
		end if
		
		return null
	end method
	
	method private Stmt checkEnum(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is EnumTok
		
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var flss as EnumStmt = new EnumStmt() {Line = stm::Line}
			var i as integer = 0
			
			do while i <= --stm::Tokens::get_Count()
				i++
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					flss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i--
					break
				end if
			end do
			
			i++
			stm::Tokens = eop::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
			flss::EnumTyp = $TypeTok$stm::Tokens::get_Item(i)
			i++
			flss::EnumName = $Ident$stm::Tokens::get_Item(i)
			
			return flss
		end if
		
		return null
	end method
	
	method private Stmt checkProperty(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is PropertyTok
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var prss as PropertyStmt = new PropertyStmt() {Line = stm::Line}
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 3
			
			do until i = len
				i++
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					prss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i--
					break
				end if
			end do
			
			i++
			stm::Tokens = eop::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
			prss::PropertyTyp = $TypeTok$stm::Tokens::get_Item(i)
			i++
			prss::PropertyName = $Ident$stm::Tokens::get_Item(i)

			//process parameters for indexers
			len = --stm::Tokens::get_Count()
			if i < len then
				i++

				var exp as Expr = null
				var d as boolean = false
				var bl as boolean = false
				var lvl as integer = 0

				if stm::Tokens::get_Item(i) is LParen then
					exp = null
					do until i = len
				
						//get parameters
						i++
					
						if stm::Tokens::get_Item(i) is RParen then
							if d then
								exp = new ExprOptimizer(PFlags)::checkVarAs(exp,ref bl)
								if bl then
									prss::AddParam(exp)
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
							lvl++
						end if
						
						if stm::Tokens::get_Item(i) is RAParen then
							d = true
							lvl--
						end if
				
						if (stm::Tokens::get_Item(i) is Comma) and (lvl == 0) then
							exp = new ExprOptimizer(PFlags)::checkVarAs(exp,ref bl)
							if bl then
								prss::AddParam(exp)
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

			return prss
		end if
		
		return null
	end method
	
	method private Stmt checkEvent(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is EventTok
		if b then
			var eop as ExprOptimizer = new ExprOptimizer(PFlags)
			var evss as EventStmt = new EventStmt() {Line = stm::Line}
			var i as integer = 0
			var len as integer = stm::Tokens::get_Count() - 3
			
			do until i = len
				i++
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					evss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i--
					break
				end if
			end do
			
			i++
			stm::Tokens = eop::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
			evss::EventTyp = $TypeTok$stm::Tokens::get_Item(i)
			i++
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
			mtss = new MethodStmt() {Line = stm::Line}
			var lvl as integer = 0
			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count() 
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i++
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					mtss::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i--
					break
				end if
			end do
			
			//get return type and name
			i++
			
			stm::Tokens = eop::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
			mtss::RetTyp = $TypeTok$stm::Tokens::get_Item(i)
			
			len = --stm::Tokens::get_Count() 
			i++
			
			stm::Tokens = eop::procMtdName(new Expr() {Tokens = stm::Tokens}, i)::Tokens
			mtss::MethodName = $MethodNameTok$stm::Tokens::get_Item(i)
			
			i++
			
			if stm::Tokens::get_Item(i) is LParen then
				exp = null
				do until i = len
			
					//get parameters
					i++
				
					if stm::Tokens::get_Item(i) is RParen then
						if d then
							exp = new ExprOptimizer(PFlags)::checkVarAs(exp,ref bl)
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
						lvl++
					end if
					
					if stm::Tokens::get_Item(i) is RAParen then
						d = true
						lvl--
					end if
			
					if (stm::Tokens::get_Item(i) is Comma) and (lvl == 0) then
						exp = new ExprOptimizer(PFlags)::checkVarAs(exp,ref bl)
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
		if b then
			var exp as Expr = null
			var d as boolean = false
			var dels as DelegateStmt = new DelegateStmt() {Line = stm::Line}
			var lvl as integer = 0	
			var i as integer = 0
			var len as integer = --stm::Tokens::get_Count() 
			var bl as boolean = false
			
			//loop to get attributes
			do until i = len
				i++
				if stm::Tokens::get_Item(i) is Attributes.Attribute then
					dels::AddAttr($Attributes.Attribute$stm::Tokens::get_Item(i))
				else
					i--
					break
				end if
			end do
			
			//get return type and name
			i++
			stm::Tokens = new ExprOptimizer(PFlags)::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, i)::Tokens
			dels::RetTyp = $TypeTok$stm::Tokens::get_Item(i)
			len = --stm::Tokens::get_Count() 
			i++
			
			if stm::Tokens::get_Item(i) is Ident then
				dels::DelegateName = $Ident$stm::Tokens::get_Item(i)
			end if
			
			i++
			if stm::Tokens::get_Item(i) is LParen then
				
				exp = null
				do until i = len
			
					//get parameters
					i++
				
					if stm::Tokens::get_Item(i) is RParen then
						if d then
							exp = new ExprOptimizer(PFlags)::checkVarAs(exp,ref bl)
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
						lvl++
					end if
					
					if stm::Tokens::get_Item(i) is RAParen then
						d = true
						lvl--
					end if
					
					if (stm::Tokens::get_Item(i) is Comma) and (lvl == 0) then
						exp = new ExprOptimizer(PFlags)::checkVarAs(exp,ref bl)
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
			return dels
		end if
		return null
	end method
	
	method private Stmt checkIncDec(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			var t = stm::Tokens::get_Item(--stm::Tokens::get_Count())
			b = (stm::Tokens::get_Item(0) is Ident) and ((t is IncOp) or (t is DecOp))
			if b then
				stm::RemToken(--stm::Tokens::get_Count())
				var nv = new ExprOptimizer(PFlags)::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})::Tokens::get_Item(0)
				if t is IncOp then
					return new IncStmt() {Line = stm::Line, NumVar = $Ident$nv}
				else
					return new DecStmt() {Line = stm::Line, NumVar = $Ident$nv}
				end if
			end if
		end if
		return null
	end method
	
	method private Stmt checkMethodCall(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() > 2 then
			b = (stm::Tokens::get_Item(0) is Ident) or (stm::Tokens::get_Item(0) is NewTok)
			if b then
				return new MethodCallStmt() {Line = stm::Line, MethodToken = new ExprOptimizer(PFlags)::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})::Tokens::get_Item(0)}
			end if
		end if
		return null
	end method
	
	method private Stmt checkGet(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is GetTok) and (stm::Tokens::get_Item(1) is Ident)
			if b then
				var prgs as PropertyGetStmt = new PropertyGetStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var exp as Expr = new ExprOptimizer(PFlags)::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
				if exp::Tokens::get_Item(1) is MethodCallTok then
					prgs::Getter = #expr($MethodCallTok$exp::Tokens::get_Item(1))::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					prgs::Getter = $Ident$exp::Tokens::get_Item(1)
				end if
				return prgs
			end if
		elseif stm::Tokens::get_Count() == 1 then
			b = stm::Tokens::get_Item(0) is GetTok
			if b then
				return new PropertyGetStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkSet(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is SetTok) and (stm::Tokens::get_Item(1) is Ident)
			if b then
				var prss as PropertySetStmt = new PropertySetStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var exp as Expr = new ExprOptimizer(PFlags)::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
				if exp::Tokens::get_Item(1) is MethodCallTok then
					prss::Setter = #expr($MethodCallTok$exp::Tokens::get_Item(1))::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					prss::Setter = $Ident$exp::Tokens::get_Item(1)
				end if
				return prss
			end if
		elseif stm::Tokens::get_Count() == 1 then
			b = stm::Tokens::get_Item(0) is SetTok
			if b then
				return new PropertySetStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkRemove(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is RemoveTok) and (stm::Tokens::get_Item(1) is Ident)
			if b then
				var evrs as EventRemoveStmt = new EventRemoveStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var exp as Expr = new ExprOptimizer(PFlags)::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
				if exp::Tokens::get_Item(1) is MethodCallTok then
					evrs::Remover = #expr($MethodCallTok$exp::Tokens::get_Item(1))::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					evrs::Remover = $Ident$exp::Tokens::get_Item(1)
				end if
				return evrs
			end if
		elseif stm::Tokens::get_Count() == 1 then
			b = stm::Tokens::get_Item(0) is RemoveTok
			if b then
				return new EventRemoveStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkAdd(var stm as Stmt, var b as boolean&)
		b = false
		if stm::Tokens::get_Count() >= 2 then
			b = (stm::Tokens::get_Item(0) is AddTok) and (stm::Tokens::get_Item(1) is Ident)	
			if b then
				var evas as EventAddStmt = new EventAddStmt() {Line = stm::Line, Tokens = stm::Tokens}
				var exp as Expr = new ExprOptimizer(PFlags)::Optimize(new Expr() {Line = stm::Line, Tokens = stm::Tokens})
				if exp::Tokens::get_Item(1) is MethodCallTok then
					evas::Adder = #expr($MethodCallTok$exp::Tokens::get_Item(1))::Name
				elseif exp::Tokens::get_Item(1) is Ident then
					evas::Adder = $Ident$exp::Tokens::get_Item(1)
				end if
				return evas
			end if
		elseif stm::Tokens::get_Count() == 1 then
			b = stm::Tokens::get_Item(0) is AddTok	
			if b then
				return new EventAddStmt() {Line = stm::Line}
			end if
		end if
		return null
	end method
	
	method private Stmt checkVarAs(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is VarTok
		if b then
			var tempexp as Expr = new ExprOptimizer(PFlags)::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, 3)
			return new VarStmt() {Line = stm::Line, VarName = $Ident$tempexp::Tokens::get_Item(1), VarTyp = $TypeTok$tempexp::Tokens::get_Item(3)}
		end if
		return null
	end method
	
	method private Stmt checkCatch(var stm as Stmt, var b as boolean&)
		b = stm::Tokens::get_Item(0) is CatchTok
		if b then
			var tempexp as Expr = new ExprOptimizer(PFlags)::procType(new Expr() {Line = stm::Line, Tokens = stm::Tokens}, 3)
			return new CatchStmt() {Line = stm::Line, ExName = $Ident$tempexp::Tokens::get_Item(1), ExTyp = $TypeTok$tempexp::Tokens::get_Item(3)}
		end if
		return null
	end method
	
	method private Stmt AssOpt(var stm as Stmt)
		var asss as AssignStmt = $AssignStmt$stm
		var le as Expr = asss::LExp
		var eop as ExprOptimizer = new ExprOptimizer(PFlags)
		
		if le::Tokens::get_Count() >= 4 then
			if ((le::Tokens::get_Item(0) is VarTok) or (le::Tokens::get_Item(0) is UsingTok)) and (le::Tokens::get_Item(2) is AsTok) then
				le::Tokens = eop::procType(new Expr() {Line = stm::Line, Tokens = le::Tokens}, 3)::Tokens		
				return new VarAsgnStmt() {Line = asss::Line, VarName = $Ident$le::Tokens::get_Item(1), VarTyp = $TypeTok$le::Tokens::get_Item(3), _
					RExpr = eop::Optimize(asss::RExp), IsUsing = le::Tokens::get_Item(0) is UsingTok}
			else
				return stm
			end if
		elseif le::Tokens::get_Count() >= 2 then
			if (le::Tokens::get_Item(0) is VarTok) or (le::Tokens::get_Item(0) is UsingTok) then
				return new InfVarAsgnStmt() {Line = asss::Line, VarName = $Ident$le::Tokens::get_Item(1), _
					RExpr = eop::Optimize(asss::RExp), IsUsing = le::Tokens::get_Item(0) is UsingTok}
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
		var len as integer = --stm::Tokens::get_Count() 
		var assind as integer = 0
		
		do until i = len
			i++
			if stm::Tokens::get_Item(i) is AssignOp then
				assind = i
				break
			end if
		end do
		
		if assind != 0 then
			i = -1
			len = --assind
			
			do until i = len
				i++
				le::AddToken(stm::Tokens::get_Item(i))
			end do
			
			i = assind
			len = --stm::Tokens::get_Count() 
			
			do until i = len
				i++
				re::AddToken(stm::Tokens::get_Item(i))
			end do
			
			b = true
			var asss as AssignStmt = new AssignStmt() {Line = stm::Line, LExp = le, RExp = re}
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
		var lenx as integer = --stm::Tokens::get_Count() 
		var to as TokenOptimizer = new TokenOptimizer(PFlags)
		var tmpstm as Stmt = null
		var compb as boolean = false
		
		PFlags::IfFlag = false
		PFlags::CmtFlag = false
		PFlags::NoOptFlag = false
		PFlags::AsFlag = false
		PFlags::ForFlag = false
		
		if stm::Tokens::get_Count() = 0 then
			return stm
		end if
		
		do until i = lenx
			i++
			if PFlags::CmtFlag then
				break
			elseif PFlags::NoOptFlag then
				break
			end if
			if i != lenx then
				stm::Tokens::set_Item(i,to::Optimize(stm::Tokens::get_Item(i),stm::Tokens::get_Item(++i)))
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
		do until i = --stm::Tokens::get_Count() 
			i++
			tok = stm::Tokens::get_Item(i)
			if tok is LParen then
				pcnt++
			elseif tok is RParen then
				pcnt--
			elseif tok is LAParen then
				acnt++
			elseif tok is RAParen then
				acnt--
			elseif tok is LSParen then
				scnt++
			elseif tok is RSParen then
				scnt--
			elseif tok is LCParen then
				ccnt++
			elseif tok is RCParen then
				ccnt--
			end if
		end do
		if pcnt != 0 then
			StreamUtils::WriteLine(string::Empty)
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing parentheses do not match!.")
		elseif acnt != 0 then
			StreamUtils::WriteLine(string::Empty)
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing angle parentheses do not match!.")
		elseif scnt != 0 then
			StreamUtils::WriteLine(string::Empty)
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "The amount of opening and closing square parentheses do not match!.")
		elseif ccnt != 0 then
			StreamUtils::WriteLine(string::Empty)
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
		
		tmpstm = checkEnumAttr(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if
		
		tmpstm = checkEnum(stm, ref compb)
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

		tmpstm = checkTryLock(stm, ref compb)
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
		
		tmpstm = checkEnd(stm, ref compb)	
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
		
//		tmpstm = checkScope(stm, ref compb)
//		if compb then
//			stm = tmpstm
//			return stm
//		end if
		
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

		tmpstm = checkSign(stm, ref compb)
		if compb then
			stm = tmpstm
			return stm
		end if

		tmpstm = checkEmbed(stm, ref compb)
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
		
		tmpstm = checkFor(stm, ref compb)
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
		
		tmpstm = checkIncDec(stm, ref compb)
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