//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi ExprOptimizer

	field public Flags PFlags
	
	method public void ExprOptimizer()
		me::ctor()
		PFlags = new Flags()
	end method
	
	method public void ExprOptimizer(var pf as Flags)
		me::ctor()
		PFlags = pf
	end method
	
	method public prototype Expr Optimize(var exp as Expr)

	method public Expr procType(var stm as Expr, var i as integer)

		var isgeneric as boolean = false
		var j as integer = i
		var tt as TypeTok

		if i < (stm::Tokens::get_Count() - 2) then
			isgeneric = (stm::Tokens::get_Item(i + 1) is LAParen) and (stm::Tokens::get_Item(i + 2) is OfTok)
		end if

		if isgeneric then

			var gtt as GenericTypeTok = new GenericTypeTok(stm::Tokens::get_Item(i)::Value)
			i = i + 1
			stm::RemToken(i)
			stm::RemToken(i)
			i = i - 1

			var ep2 as Expr = new Expr()
			var lvl as integer = 1
			var len as integer = stm::Tokens::get_Count() - 1

			do until i = len
				i = i + 1
				if stm::Tokens::get_Item(i) is LAParen then
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					lvl = lvl + 1
					i = i - 1
					len = len - 1
				elseif stm::Tokens::get_Item(i) is Comma then
					if lvl > 1 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl <= 1 then
						gtt::AddParam($TypeTok$procType(ep2, 0)::Tokens::get_Item(0))
						ep2 = new Expr()
					end if
					i = i - 1
				elseif stm::Tokens::get_Item(i) is RAParen then
					lvl = lvl - 1
					if lvl > 0 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl = 0 then
						gtt::AddParam($TypeTok$procType(ep2, 0)::Tokens::get_Item(0))
						break
					end if
					i = i - 1
				else
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					i = i - 1
					len = len - 1
				end if
			end do
			tt = gtt
		else
			if (stm::Tokens::get_Item(i) is TypeTok) == false then
				tt = new TypeTok(stm::Tokens::get_Item(i)::Value) {Line = stm::Tokens::get_Item(i)::Line}
			else
				tt = $TypeTok$stm::Tokens::get_Item(i)
			end if
		end if

		i = j
		var c as integer = 0

		do until c = 2
			c = c + 1
			if i < (stm::Tokens::get_Count() - 1) then
				i = i + 1
				if stm::Tokens::get_Item(i) is LRSParen then
					tt::IsArray = true
					stm::RemToken(i)
					i = i - 1
				elseif stm::Tokens::get_Item(i) is Ampersand then
					tt::IsByRef = true
					stm::RemToken(i)
					i = i - 1
				else
					break
				end if
			end if
		end do

		stm::Tokens::set_Item(j,tt)

		return stm
	end method

	method public Expr procMtdName(var stm as Expr, var i as integer)

		var isgeneric as boolean = false
		var j as integer = i
		var tt as MethodNameTok

		if i < (stm::Tokens::get_Count() - 2) then
			isgeneric = (stm::Tokens::get_Item(i + 1) is LAParen) and (stm::Tokens::get_Item(i + 2) is OfTok)
		end if

		if isgeneric then

			var gtt as GenericMethodNameTok = new GenericMethodNameTok($Ident$stm::Tokens::get_Item(i))
			i = i + 1
			stm::RemToken(i)
			stm::RemToken(i)
			i = i - 1

			var ep2 as Expr = new Expr()
			var lvl as integer = 1
			var len as integer = stm::Tokens::get_Count() - 1

			do until i = len
				i = i + 1
				if stm::Tokens::get_Item(i) is LAParen then
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					lvl = lvl + 1
					i = i - 1
					len = len - 1
				elseif stm::Tokens::get_Item(i) is Comma then
					if lvl > 1 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl <= 1 then
						gtt::AddParam($TypeTok$procType(ep2, 0)::Tokens::get_Item(0))
						ep2 = new Expr()
					end if
					i = i - 1
				elseif stm::Tokens::get_Item(i) is RAParen then
					lvl = lvl - 1
					if lvl > 0 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len = len - 1
					if lvl = 0 then
						gtt::AddParam($TypeTok$procType(ep2, 0)::Tokens::get_Item(0))
						break
					end if
					i = i - 1
				else
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					i = i - 1
					len = len - 1
				end if
			end do
			tt = gtt
		else
			if (stm::Tokens::get_Item(i) is MethodNameTok) == false then
				tt = new MethodNameTok($Ident$stm::Tokens::get_Item(i))
			else
				tt = $MethodNameTok$stm::Tokens::get_Item(i)
			end if
		end if

		stm::Tokens::set_Item(j,tt)

		return stm
	end method

	method assembly Expr checkVarAs(var stm as Expr,out var b as boolean&)
		var bs as integer = 0
		var bst as Token = null
		
		if stm::Tokens::get_Item(0) is VarTok then
			b = true
		elseif (stm::Tokens::get_Item(0) is InTok) and (stm::Tokens::get_Item(1) is VarTok) then
			b = true
			bs = 1
			bst = stm::Tokens::get_Item(0)
		elseif (stm::Tokens::get_Item(0) is OutTok) and (stm::Tokens::get_Item(1) is VarTok) then
			b = true
			bs = 1
			bst = stm::Tokens::get_Item(0)
		elseif (stm::Tokens::get_Item(0) is InOutTok) and (stm::Tokens::get_Item(1) is VarTok) then
			b = true
			bs = 1
			bst = stm::Tokens::get_Item(0)
		else
			b = false
		end if
		
		if b then
			stm = procType(stm,bs + 3)
			return new VarExpr() {Tokens = stm::Tokens, Line = stm::Line, VarName = $Ident$stm::Tokens::get_Item(bs + 1), VarTyp = $TypeTok$stm::Tokens::get_Item(bs + 3), Attr = bst}
		end if
		
		return null
	end method

	method public Expr procMethodCall(var stm as Expr, var i as integer)
		var ep2 as Expr = new Expr()
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i = i - 1
		var mn as MethodNameTok = null
		if stm::Tokens::get_Item(i) is MethodNameTok then
			mn = $MethodNameTok$stm::Tokens::get_Item(i)
		else
			mn = new MethodNameTok($Ident$stm::Tokens::get_Item(i))
		end if
		var mct as MethodCallTok = new MethodCallTok() {Name = mn, Line = mn::Line}
		
		j = i
		i = i + 1

		var len as integer = stm::Tokens::get_Count() - 1

		stm::RemToken(i)
		len = stm::Tokens::get_Count() - 1
		i = i - 1
		
		var flgc as boolean[] = new boolean[] {PFlags::MetCallFlag, PFlags::IdentFlag, PFlags::StringFlag}
				
		do until i = len

			//get parameters
			i = i + 1
	
			if (stm::Tokens::get_Item(i) is RParen) or (stm::Tokens::get_Item(i) is RAParen) or (stm::Tokens::get_Item(i) is RCParen) then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					if ep2::Tokens::get_Count() > 0 then
						PFlags::ResetMCISFlgs()
						mct::AddParam(Optimize(ep2))
					end if
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) or (stm::Tokens::get_Item(i) is LAParen) or (stm::Tokens::get_Item(i) is LCParen) then
				lvl = lvl + 1
				d = true
				len = stm::Tokens::get_Count() - 1
			elseif (stm::Tokens::get_Item(i) is Comma) then
				if lvl = 1 then
					d = false
					if ep2::Tokens::get_Count() > 0 then
						PFlags::ResetMCISFlgs()
						mct::AddParam(Optimize(ep2))
					end if
					ep2 = new Expr()
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				i = i - 1
			end if
		end do
		
		PFlags::MetCallFlag = flgc[0]
		PFlags::IdentFlag = flgc[1]
		PFlags::StringFlag = flgc[2]
	
		stm::Tokens::set_Item(j,mct)
		return stm
	
	end method
	
	method private Token ObjInitHelper(var e as Expr)
		e = Optimize(e)
		if e::Tokens::get_Count() > 2 then
			if e::Tokens::get_Item(1) is AssignOp2 then
				var e2 as Expr = new Expr() {Line = e::Line}
				e2::Tokens::AddAll(e::Tokens::View(2,e::Tokens::get_Count() - 2))
				return new AttrValuePair() {Name = $Ident$e::Tokens::get_Item(0), ValueExpr = e2}
			end if
		end if
		if e::Tokens::get_Count() > 0 then
			if e::Tokens::get_Item(0) is MethodCallTok then
				return e::Tokens::get_Item(0)
			end if
		end if
		return null
	end method
	
	method public Expr procObjInitCall(var stm as Expr, var i as integer)
		var ct as NewCallTok = $NewCallTok$stm::Tokens::get_Item(i)
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = i
		var lp as C5.ArrayList<of Token> = new C5.ArrayList<of Token>()
		var ep as Expr = new Expr()
		
		i = i + 1
		stm::RemToken(i)
		var len as integer = stm::Tokens::get_Count() - 1
		i = i - 1

		do until i = len
			i = i + 1
	
			if (stm::Tokens::get_Item(i) is RParen) or (stm::Tokens::get_Item(i) is RAParen) or (stm::Tokens::get_Item(i) is RCParen) then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					lp::Add(ObjInitHelper(ep))
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) or (stm::Tokens::get_Item(i) is LAParen) or (stm::Tokens::get_Item(i) is LCParen) then
				lvl = lvl + 1
				d = true
			elseif stm::Tokens::get_Item(i) is Comma then
				if lvl = 1 then
					d = false
					lp::Add(ObjInitHelper(ep))
					ep = new Expr()
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				ep::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				i = i - 1
			end if
		end do
		
		stm::Tokens::set_Item(j, new ObjInitCallTok() {Line = ct::Line, Ctor = ct, Elements = lp})
		return stm
	end method
	
	method public Expr procTernaryCall(var stm as Expr, var i as integer)
		var ct as TernaryCallTok = new TernaryCallTok() {Line = stm::Tokens::get_Item(i)::Line}
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = i
		var stg as integer = 0
		
		i = i + 1
		stm::RemToken(i)
		var len as integer = stm::Tokens::get_Count() - 1
		i = i - 1

		do until i = len
			i = i + 1
			
			if (stm::Tokens::get_Item(i) is RParen) or (stm::Tokens::get_Item(i) is RAParen) or (stm::Tokens::get_Item(i) is RCParen) then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) or (stm::Tokens::get_Item(i) is LAParen) or (stm::Tokens::get_Item(i) is LCParen) then
				lvl = lvl + 1
				d = true
			elseif stm::Tokens::get_Item(i) is Comma then
				if lvl = 1 then
					d = false
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					stg = 2
				else
					d = true
				end if
			elseif stm::Tokens::get_Item(i) is QuestionMark then
				if lvl = 1 then
					d = false
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					stg = 1
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				if stg = 0 then
					ct::Condition::AddToken(stm::Tokens::get_Item(i))
				elseif stg = 1 then
					ct::TrueExpr::AddToken(stm::Tokens::get_Item(i))
				elseif stg = 2 then
					ct::FalseExpr::AddToken(stm::Tokens::get_Item(i))
				end if
				stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				i = i - 1
			end if
		end do
		
		ct::Condition = Optimize(ct::Condition)
		ct::TrueExpr = Optimize(ct::TrueExpr)
		ct::FalseExpr = Optimize(ct::FalseExpr)
		stm::Tokens::set_Item(j, ct)
		return stm
	end method

	method public Expr procNewCall(var stm as Expr, var i as integer)

		var nct as NewCallTok = new NewCallTok()
		var nact as NewarrCallTok = new NewarrCallTok()
		var aict as ArrInitCallTok = new ArrInitCallTok()
		var tt as TypeTok
		var ep2 as Expr = new Expr()
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0
		//flag for array creation using length
		var nab as boolean = false
		//flag for array creation using initializer
		var nai as boolean = false
		
		//no need to call the next line as its done before this method is used
		//stm = procType(stm, i)
		tt = $TypeTok$stm::Tokens::get_Item(i)
		j = i
		i = i + 1
		
		var tok2 as Token = stm::Tokens::get_Item(i)
		var len as integer = stm::Tokens::get_Count() - 1
		
		if tok2 is LSParen then
			nab = true
		elseif tok2 is LCParen
			nai = true
		end if
		
		if nab then
			nact::ArrayType = tt
		elseif nai then
			aict::ForceArray = tt::IsArray
			tt::IsArray = false
			aict::ArrayType = tt
		else
			nct::Name = tt
		end if
		
		stm::RemToken(i)
		len = stm::Tokens::get_Count() - 1
		i = i - 1
		
		do until i = len
		
			//get parameters/members/length
			i = i + 1
			
			if (stm::Tokens::get_Item(i) is RParen) or (stm::Tokens::get_Item(i) is RSParen) or (stm::Tokens::get_Item(i) is RAParen) or (stm::Tokens::get_Item(i) is RCParen) then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					if ep2::Tokens::get_Count() > 0 then
						if nab then
							nact::ArrayLen = Optimize(ep2)
						elseif nai then
							aict::AddElem(Optimize(ep2))
						else
							nct::AddParam(Optimize(ep2))
						end if
					end if
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) or (stm::Tokens::get_Item(i) is LSParen) or (stm::Tokens::get_Item(i) is LAParen) or (stm::Tokens::get_Item(i) is LCParen) then
				lvl = lvl + 1
				d = true
				//stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				//i = i - 1
			elseif stm::Tokens::get_Item(i) is Comma then
				if lvl = 1 then
					d = false
					if ep2::Tokens::get_Count() > 0 then
						if nai then
							aict::AddElem(Optimize(ep2))
							ep2 = new Expr()
						elseif nab = false then
							nct::AddParam(Optimize(ep2))
							ep2 = new Expr()
						end if
					end if
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				i = i - 1
			end if
		
		end do
		
		if nab then
			nact::Line = tt::Line
			stm::Tokens::set_Item(j,nact)
		elseif nai then
			aict::Line = tt::Line
			stm::Tokens::set_Item(j,aict)
		else
			nct::Line = tt::Line
			stm::Tokens::set_Item(j,nct)
		end if
		
		return stm
	end method

	method public Expr procIdentArrayAccess(var stm as Expr, var i as integer)
		var ep2 as Expr = new Expr()
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i = i - 1
		var idt as Ident = $Ident$stm::Tokens::get_Item(i)
		j = i
		i = i + 1

		var len as integer = stm::Tokens::get_Count() - 1
		stm::RemToken(i)
		len = stm::Tokens::get_Count() - 1
		i = i - 1

		do until i = len
			//get parameters
			i = i + 1

			if stm::Tokens::get_Item(i) is RSParen then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					break
				else
					d = true
				end if
			elseif stm::Tokens::get_Item(i) is LSParen then
				lvl = lvl + 1
				d = true
			elseif (stm::Tokens::get_Item(i) is Comma) == false then
				d = true
			end if

			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				i = i - 1
			end if
		end do

		idt::ArrLoc = Optimize(ep2)
		idt::IsArr = true
		stm::Tokens::set_Item(j,idt)

		return stm
	end method

	method public Expr procMtdArrayAccess(var stm as Expr, var i as integer)
		var ep2 as Expr = new Expr()
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i = i - 1
		var mtd as MethodCallTok = $MethodCallTok$stm::Tokens::get_Item(i)
		var idt as MethodNameTok = mtd::Name
		j = i
		i = i + 1

		var len as integer = stm::Tokens::get_Count() - 1

		stm::RemToken(i)
		len = stm::Tokens::get_Count() - 1
		i = i - 1

		var flgc as boolean[] = new boolean[] {PFlags::MetCallFlag, PFlags::IdentFlag, PFlags::StringFlag}

		do until i = len
			//get parameters
			i = i + 1

			if stm::Tokens::get_Item(i) is RSParen then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = stm::Tokens::get_Count() - 1
					i = i - 1
					break
				else
					d = true
				end if
			elseif stm::Tokens::get_Item(i) is LSParen then
				lvl = lvl + 1
				d = true
			elseif (stm::Tokens::get_Item(i) is Comma) == false then
				d = true
			end if

			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				i = i - 1
			end if
		end do

		PFlags::ResetMCISFlgs()
		idt::ArrLoc = Optimize(ep2)
		idt::IsArr = true
		mtd::Name = idt
		stm::Tokens::set_Item(j,mtd)
		
		PFlags::MetCallFlag = flgc[0]
		PFlags::IdentFlag = flgc[1]
		PFlags::StringFlag = flgc[2]

		return stm
	end method

	method public Expr Optimize(var exp as Expr)
		var len as integer = exp::Tokens::get_Count() - 1
		var i as integer = -1
		var j as integer = -1
		var mcbool as boolean = false
		var mctok as Token = null
		var newavtok as Token = null
		var mctok2 as Token = null
		var mcident as Ident = null
		var mcmetcall as MethodCallTok = null
		var mcmetname as MethodNameTok = null
		var mcstr as StringLiteral = null

		label loop
		label cont

		if len < 0 then
			goto cont
		end if

		place loop
		
		if PFlags::MetChainFlag = false then
			//non-method chain i.e. normal code
			i = i + 1

			label fin

			var tok as Token = exp::Tokens::get_Item(i)

			if tok is LRSParen then
				exp::RemToken(i)
				i = i - 1
				len = exp::Tokens::get_Count() - 1
				tok = exp::Tokens::get_Item(i)
				
				var ttk as TypeTok = null
				if (tok is TypeTok) = false then
					var tk as Token = exp::Tokens::get_Item(i)
					ttk = new TypeTok() {Line = tk::Line, Value = tk::Value, IsArray = true}
				else
					ttk = $TypeTok$exp::Tokens::get_Item(i)
					ttk::IsArray = true
				end if
				exp::Tokens::set_Item(i,ttk)
				goto fin
			end if

			if tok is Ampersand then
				exp::RemToken(i)
				i = i - 1
				len = exp::Tokens::get_Count() - 1
				tok = exp::Tokens::get_Item(i)
				
				var ttk2 as TypeTok = null
				if (tok is TypeTok) = false then
					var tk2 as Token = exp::Tokens::get_Item(i)
					ttk2 = new TypeTok() {Line = tk2::Line, Value = tk2::Value, IsByRef = true}
				else
					ttk2 = $TypeTok$exp::Tokens::get_Item(i)
					ttk2::IsByRef = true
				end if
				exp::Tokens::set_Item(i,ttk2)
				goto fin
			end if

			if PFlags::ProcessTTokOnly = false then

				if tok is DollarSign then
					PFlags::DurConvFlag = PFlags::DurConvFlag == false
					PFlags::isChanged = true
					if PFlags::DurConvFlag then
						PFlags::ConvFlag = true
						PFlags::OrdOp = "conv " + PFlags::OrdOp
						PFlags::OrdOp = PFlags::OrdOp::Trim()
					end if
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens::get_Count() - 1
					goto fin
				end if

				if tok is Pipe then
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens::get_Count() - 1
					goto fin
				end if

				if tok is RefTok then
					PFlags::isChanged = true
					PFlags::RefFlag = true
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens::get_Count() - 1
					goto fin
				end if

				if tok is ValInRefTok then
					PFlags::isChanged = true
					PFlags::ValinrefFlag = true
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens::get_Count() - 1
					goto fin
				end if

				if tok is TypeTok then
					if PFlags::DurConvFlag then
						exp = procType(exp,i)
						PFlags::ConvTyp = $TypeTok$exp::Tokens::get_Item(i)
						exp::RemToken(i)
						i = i - 1
						len = exp::Tokens::get_Count() - 1
					end if
					goto fin
				end if

				if tok is Ident then
					if PFlags::DurConvFlag = false then
						if PFlags::MetCallFlag or PFlags::IdentFlag or PFlags::StringFlag then
							mcbool = true
						end if
						PFlags::IdentFlag = true
						if PFlags::isChanged then
							exp::Tokens::set_Item(i,PFlags::UpdateIdent($Ident$exp::Tokens::get_Item(i)))
							PFlags::SetUnaryFalse()
							j = i
						end if

						//genericmethodnametok detector
						if i < (exp::Tokens::get_Count() - 2) then
							if (exp::Tokens::get_Item(i + 1) is LAParen) and (exp::Tokens::get_Item(i + 2) is OfTok) then
								exp = procMtdName(exp, i)
								len = exp::Tokens::get_Count() - 1
							end if
						end if
						//-----------------------------
					else
						exp = procType(exp,i)
						PFlags::ConvTyp = $TypeTok$exp::Tokens::get_Item(i)
						exp::RemToken(i)
						i = i - 1
						len = exp::Tokens::get_Count() - 1
					end if
					goto fin
				end if

				if tok is CharLiteral then
					if PFlags::isChanged then
						exp::Tokens::set_Item(i,PFlags::UpdateCharLit($CharLiteral$exp::Tokens::get_Item(i)))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is NullLiteral then
					if PFlags::isChanged then
						exp::Tokens::set_Item(i,PFlags::UpdateNullLit($NullLiteral$exp::Tokens::get_Item(i)))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is MeTok then
					if PFlags::isChanged then
						exp::Tokens::set_Item(i,PFlags::UpdateMeTok($MeTok$exp::Tokens::get_Item(i)))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is StringLiteral then
					PFlags::StringFlag = true
					if PFlags::isChanged then
						exp::Tokens::set_Item(i,PFlags::UpdateStringLit($StringLiteral$exp::Tokens::get_Item(i)))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is BooleanLiteral then
					if PFlags::isChanged then
						exp::Tokens::set_Item(i,PFlags::UpdateBoolLit($BooleanLiteral$exp::Tokens::get_Item(i)))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is NumberLiteral then
					if PFlags::isChanged then
						exp::Tokens::set_Item(i,PFlags::UpdateNumLit($NumberLiteral$exp::Tokens::get_Item(i)))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is NewTok then
					exp::RemToken(i)
					exp = procNewCall(procType(exp, i), i)
					len = exp::Tokens::get_Count() - 1
					if exp::Tokens::get_Item(i) is NewCallTok then
						//if output is newcall
						if i < len then
							if exp::Tokens::get_Item(i + 1) is LCParen then
								exp = procObjInitCall(exp, i)
								len = exp::Tokens::get_Count() - 1
							end if
						end if
					end if
					goto fin
				end if

				if tok is GettypeTok then
					exp::RemToken(i)
					exp = procType(exp,i)
					len = exp::Tokens::get_Count() - 1
					exp::Tokens::set_Item(i,new GettypeCallTok() {Name = $TypeTok$exp::Tokens::get_Item(i)})
					goto fin
				end if

				if (tok is IsOp) or (tok is AsOp) then
					i = i + 1
					exp = procType(exp,i)
					len = exp::Tokens::get_Count() - 1
					goto fin
				end if
				
				if tok is TernaryTok then
					//call ternary processor
					exp = procTernaryCall(exp, i)
					len = exp::Tokens::get_Count() - 1
					goto fin
				end if

				if tok is NewarrTok then
					exp::RemToken(i)
					len = len - 1
					tok = exp::Tokens::get_Item(i)
					exp::RemToken(i)
					len = len - 1
					newavtok = exp::Tokens::get_Item(i)
					exp::Tokens::set_Item(i, new NewarrCallTok() {ArrayType = #ternary {tok is TypeTok ? $TypeTok$tok , new TypeTok() {Line = tok::Line, Value = tok::Value}}, ArrayLen = new Expr() {AddToken(newavtok)}})
					goto fin
				end if

				if tok is PtrTok then

					exp::RemToken(i)
					len = len - 1
					var ptrctoken as PtrCallTok = new PtrCallTok() {MetToCall = new MethodNameTok($Ident$exp::Tokens::get_Item(i))}
					exp::Tokens::set_Item(i,ptrctoken)

					//outer check for (
					i = i + 1
					if i <= len then
						tok = exp::Tokens::get_Item(i)
						if tok is LParen then
							exp::RemToken(i)
							len = len - 1
							//inner check for )
							//-----------------
							if i <= len then
								tok = exp::Tokens::get_Item(i)
								if tok is RParen then
									exp::RemToken(i)
									len = len - 1
								end if
							end if
							//-----------------
						end if
					end if

					goto fin
				end if

				if tok is LParen then
					if PFlags::IdentFlag then
						PFlags::IdentFlag = false
						if PFlags::MetCallFlag or PFlags::StringFlag or PFlags::IdentFlag then
							mcbool = true
						end if
						PFlags::MetCallFlag = true
						exp = procMethodCall(exp, i)
						i = i - 1
						len = exp::Tokens::get_Count() - 1
					end if

					goto fin
				end if

				//if i > j then
				//PFlags::IdentFlag = false
				//end if

				//-------------------------------------------------------------------------------------

				if tok is LSParen then
					if PFlags::IdentFlag then
						PFlags::IdentFlag = false
						exp = procIdentArrayAccess(exp, i)
						i = i - 1
						len = exp::Tokens::get_Count() - 1
						PFlags::IdentFlag = true
						j = i
					elseif PFlags::MetCallFlag then
						PFlags::MetCallFlag = false
						exp = procMtdArrayAccess(exp, i)
						i = i - 1
						len = exp::Tokens::get_Count() - 1
						PFlags::MetCallFlag = true
						j = i
					end if
					goto fin
				end if

				if i > j then
					PFlags::ResetMCISFlgs()
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
			mctok = exp::Tokens::get_Item(i)
			
			if mctok is Ident then
				mcident = $Ident$mctok
				if PFlags::MetCallFlag or PFlags::IdentFlag then
					PFlags::MetCallFlag = false
					PFlags::IdentFlag = false
					mctok2 = exp::Tokens::get_Item(i + 1)
					mcident::MemberAccessFlg = true
					mcident::MemberToAccess = mctok2
					exp::RemToken(i + 1)
					exp::Tokens::set_Item(i,mcident)
				end if
				if mcident::Value like "^::(.)*$" then
					PFlags::IdentFlag = true
				end if
			elseif mctok is MethodCallTok then
				mcmetcall = $MethodCallTok$mctok
				mcmetname = mcmetcall::Name
				if PFlags::MetCallFlag or PFlags::IdentFlag then
					PFlags::MetCallFlag = false
					PFlags::IdentFlag = false
					mctok2 = exp::Tokens::get_Item(i + 1)
					mcmetname::MemberAccessFlg = true
					mcmetname::MemberToAccess = mctok2
					exp::RemToken(i + 1)
					mcmetcall::Name = mcmetname
					exp::Tokens::set_Item(i,mcmetcall)
				end if
				if mcmetname::Value like "^::(.)*$" then
					PFlags::MetCallFlag = true
				end if
			elseif mctok is StringLiteral then
				mcstr = $StringLiteral$mctok
				if PFlags::MetCallFlag or PFlags::IdentFlag then
					PFlags::MetCallFlag = false
					PFlags::IdentFlag = false
					mctok2 = exp::Tokens::get_Item(i + 1)
					mcstr::MemberAccessFlg = true
					mcstr::MemberToAccess = mctok2
					exp::RemToken(i + 1)
					exp::Tokens::set_Item(i,mcstr)
				end if
			end if

			if i <= 0 then
				goto cont
			else
				goto loop
			end if

		end if

		place cont

		if PFlags::MetChainFlag = false then
			if mcbool then
				PFlags::MetChainFlag = true
				len = exp::Tokens::get_Count()
				i = len
				mcbool = false
				PFlags::ResetMCISFlgs()
				goto loop
			end if
		else
			PFlags::MetChainFlag = false
		end if
		PFlags::ResetMCISFlgs()
		return exp
	end method

end class
