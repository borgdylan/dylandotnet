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
				tt = $TypeTok$stm::Tokens[i]
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

			var gtt as GenericMethodNameTok = new GenericMethodNameTok($Ident$stm::Tokens[i])
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
				tt = new MethodNameTok($Ident$stm::Tokens[i])
			else
				tt = $MethodNameTok$stm::Tokens[i]
			end if
		end if

		stm::Tokens[j] = tt

		return stm
	end method

	method assembly Expr checkVarAs(var stm as Expr,out var b as boolean&)
		var typ as Type = gettype VarTok
		var typ2 as Type = gettype InTok
		var typ3 as Type = gettype OutTok
		var typ4 as Type = gettype InOutTok
		var bs as integer = 0
		var bst as Token = null
		
		if typ::IsInstanceOfType(stm::Tokens[0]) then
			b = true
		elseif typ2::IsInstanceOfType(stm::Tokens[0]) and typ::IsInstanceOfType(stm::Tokens[1]) then
			b = true
			bs = 1
			bst = stm::Tokens[0]
		elseif typ3::IsInstanceOfType(stm::Tokens[0]) and typ::IsInstanceOfType(stm::Tokens[1]) then
			b = true
			bs = 1
			bst = stm::Tokens[0]
		elseif typ4::IsInstanceOfType(stm::Tokens[0]) and typ::IsInstanceOfType(stm::Tokens[1]) then
			b = true
			bs = 1
			bst = stm::Tokens[0]
		else
			b = false
		end if
		
		var vars as VarExpr = null

		if b then
			vars = new VarExpr()
			stm = procType(stm,bs + 3)
			vars::Tokens = stm::Tokens
			vars::Line = stm::Line
			vars::VarName = $Ident$stm::Tokens[bs + 1]
			vars::VarTyp = $TypeTok$stm::Tokens[bs + 3]
			vars::Attr = bst
		end if
		
		return vars
	end method

	method public Expr procMethodCall(var stm as Expr, var i as integer)
	
		var mn as MethodNameTok = null
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
			mn = new MethodNameTok($Ident$stm::Tokens[i])
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
		
		tt = $TypeTok$stm::Tokens[i]
		j = i
		i = i + 1
		
		var tok2 as Token = stm::Tokens[i]
		var typ2 as Type
		var len as integer = stm::Tokens[l] - 1
		
		typ2 = gettype LParen
		if typ2::IsInstanceOfType(tok2) then
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
		
		if rtyp::IsInstanceOfType(stm::Tokens[i]) or rtyp2::IsInstanceOfType(stm::Tokens[i]) then
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
		
		if ltyp::IsInstanceOfType(stm::Tokens[i]) or ltyp2::IsInstanceOfType(stm::Tokens[i]) then
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
		
		if d then
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
		idt = $Ident$stm::Tokens[i]
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
		b2 = typ2::IsInstanceOfType(tok2)
		if b2 then
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
		b2 = typ2::IsInstanceOfType(tok2)
		if b2 then
			lvl = lvl + 1
			d = true
			goto fin
		end if

		tok2 = stm::Tokens[i]
		typ2 = gettype Comma
		b2 = typ2::IsInstanceOfType(tok2)
		if b2 == false then
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
		mtd = $MethodCallTok$stm::Tokens[i]
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
		b2 = typ2::IsInstanceOfType(tok2)
		if b2 then
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
		b2 = typ2::IsInstanceOfType(tok2)
		if b2 then
			lvl = lvl + 1
			d = true
			goto fin
		end if

		tok2 = stm::Tokens[i]
		typ2 = gettype Comma
		b2 = typ2::IsInstanceOfType(tok2)
		if b2 == false then
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
		var lpt as Type = gettype LAParen
		var oft as Type = gettype OfTok


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

			var tok as Token = exp::Tokens[i]
			var typ as Type

			typ = gettype LRSParen

			if typ::IsInstanceOfType(tok) then
				typ = gettype TypeTok
				exp::RemToken(i)
				i = i - 1
				len = exp::Tokens[l] - 1
				tok = exp::Tokens[i]
				
				var ttk as TypeTok = new TypeTok()
				if typ::IsInstanceOfType(tok) = false then
					var tk as Token = exp::Tokens[i]
					ttk::Line = tk::Line
					ttk::Value = tk::Value
					ttk::IsArray = true
				else
					ttk = $TypeTok$exp::Tokens[i]
					ttk::IsArray = true
				end if
				exp::Tokens[i] = ttk
				goto fin
			end if

			typ = gettype Ampersand

			if typ::IsInstanceOfType(tok) then
				typ = gettype TypeTok
				exp::RemToken(i)
				i = i - 1
				len = exp::Tokens[l] - 1
				tok = exp::Tokens[i]
				
				var ttk2 as TypeTok = new TypeTok()
				if typ::IsInstanceOfType(tok) = false then
					var tk2 as Token = exp::Tokens[i]
					ttk2::Line = tk2::Line
					ttk2::Value = tk2::Value
					ttk2::IsByRef = true
				else
					ttk2 = $TypeTok$exp::Tokens[i]
					ttk2::IsByRef = true
				end if
				exp::Tokens[i] = ttk2
				goto fin
			end if

			if PFlags::ProcessTTokOnly = false then

				typ = gettype DollarSign

				if typ::IsInstanceOfType(tok) then
					PFlags::DurConvFlag = PFlags::DurConvFlag nor PFlags::DurConvFlag
					PFlags::isChanged = true
					if PFlags::DurConvFlag then
						PFlags::ConvFlag = true
						PFlags::OrdOp = "conv " + PFlags::OrdOp
						PFlags::OrdOp = PFlags::OrdOp::Trim()
					end if
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens[l] - 1
					goto fin
				end if

				typ = gettype Pipe

				if typ::IsInstanceOfType(tok) then
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens[l] - 1
					goto fin
				end if

				typ = gettype RefTok

				if typ::IsInstanceOfType(tok) then
					PFlags::isChanged = true
					PFlags::RefFlag = true
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens[l] - 1
					goto fin
				end if

				typ = gettype ValInRefTok

				if typ::IsInstanceOfType(tok) then
					PFlags::isChanged = true
					PFlags::ValinrefFlag = true
					exp::RemToken(i)
					i = i - 1
					len = exp::Tokens[l] - 1
					goto fin
				end if

				typ = gettype TypeTok

				if typ::IsInstanceOfType(tok) then
					if PFlags::DurConvFlag then
						PFlags::ConvTyp = $TypeTok$exp::Tokens[i]
						exp::RemToken(i)
						i = i - 1
						len = exp::Tokens[l] - 1
					end if
					goto fin
				end if

				typ = gettype Ident

				if typ::IsInstanceOfType(tok) then
					if PFlags::DurConvFlag = false then
						if PFlags::MetCallFlag or PFlags::IdentFlag or PFlags::StringFlag then
							mcbool = true
						end if
						PFlags::IdentFlag = true
						if PFlags::isChanged then
							exp::Tokens[i] = PFlags::UpdateIdent($Ident$exp::Tokens[i])
							PFlags::SetUnaryFalse()
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
						exp = procType(exp,i)
						PFlags::ConvTyp = $TypeTok$exp::Tokens[i]
						exp::RemToken(i)
						i = i - 1
						len = exp::Tokens[l] - 1
					end if
					goto fin
				end if

				typ = gettype CharLiteral

				if typ::IsInstanceOfType(tok) then
					if PFlags::isChanged then
						var cl1 as CharLiteral = $CharLiteral$exp::Tokens[i]
						exp::Tokens[i] = PFlags::UpdateCharLit(cl1)
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				typ = gettype NullLiteral

				if typ::IsInstanceOfType(tok) then
					if PFlags::isChanged then
						var nul1 as NullLiteral = $NullLiteral$exp::Tokens[i]
						exp::Tokens[i] = PFlags::UpdateNullLit(nul1)
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				typ = gettype MeTok

				if typ::IsInstanceOfType(tok) then
					if PFlags::isChanged then
						var metk1 as MeTok = $MeTok$exp::Tokens[i]
						exp::Tokens[i] = PFlags::UpdateMeTok(metk1)
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				typ = gettype StringLiteral

				if typ::IsInstanceOfType(tok) then
					PFlags::StringFlag = true
					if PFlags::isChanged then
						var sl1 as StringLiteral = $StringLiteral$exp::Tokens[i]
						exp::Tokens[i] = PFlags::UpdateStringLit(sl1)
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				typ = gettype BooleanLiteral

				if typ::IsInstanceOfType(tok) then
					if PFlags::isChanged then
						var bl1 as BooleanLiteral = $BooleanLiteral$exp::Tokens[i]
						exp::Tokens[i] = PFlags::UpdateBoolLit(bl1)
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				typ = gettype NumberLiteral

				if typ::IsInstanceOfType(tok) then
					if PFlags::isChanged then
						var nl1 as NumberLiteral = $NumberLiteral$exp::Tokens[i]
						exp::Tokens[i] = PFlags::UpdateNumLit(nl1)
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				typ = gettype NewTok

				if typ::IsInstanceOfType(tok) then

					exp::RemToken(i)
					len = len - 1

					exp = procType(exp, i)
					len = exp::Tokens[l] - 1

					exp = procNewCall(exp, i)
					len = exp::Tokens[l] - 1

					typ = gettype NewCallTok

					if typ::IsInstanceOfType(exp::Tokens[i]) then
						//if output is newcall
						var nctoken as NewCallTok = $NewCallTok$exp::Tokens[i]

						var nci2 as integer = -1
						do until nci2 = (nctoken::Params[l] - 1)
							nci2 = nci2 + 1
							nctoken::Params[nci2] = Optimize(nctoken::Params[nci2])
						end do
					else
						//if output is newarrcall
						var nactoken as NewarrCallTok = $NewarrCallTok$exp::Tokens[i]
						nactoken::ArrayLen = Optimize(nactoken::ArrayLen)
					end if

					goto fin
				end if

				typ = gettype GettypeTok

				if typ::IsInstanceOfType(tok) then

					exp::RemToken(i)
					len = len - 1

					exp = procType(exp,i)
					len = exp::Tokens[l] - 1

					var gtctoken as GettypeCallTok = new GettypeCallTok()
					gtctoken::Name = $TypeTok$exp::Tokens[i]
					exp::Tokens[i] = gtctoken

					goto fin
				end if

				typ = gettype NewarrTok

				if typ::IsInstanceOfType(tok) then

					exp::RemToken(i)
					len = len - 1

					tok = exp::Tokens[i]

					exp::RemToken(i)
					len = len - 1

					typ = gettype TypeTok

					if typ::IsInstanceOfType(tok) = false then
						newattok = new TypeTok()
						newattok::Line = tok::Line
						newattok::Value = tok::Value
					else
						newattok = $TypeTok$tok
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

				if typ::IsInstanceOfType(tok) then

					exp::RemToken(i)
					len = len - 1

					ptrmntok = new MethodNameTok($Ident$exp::Tokens[i])

					var ptrctoken as PtrCallTok = new PtrCallTok()
					ptrctoken::MetToCall = ptrmntok
					exp::Tokens[i] = ptrctoken

					//outer check for (
					i = i + 1
					if i <= len then
						tok = exp::Tokens[i]
						typ = gettype LParen
						if typ::IsInstanceOfType(tok) then
							exp::RemToken(i)
							len = len - 1
							//inner check for )
							//-----------------
							if i <= len then
								tok = exp::Tokens[i]
								typ = gettype RParen
								if typ::IsInstanceOfType(tok) then
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

				if typ::IsInstanceOfType(tok) then
					if PFlags::IdentFlag then
						PFlags::IdentFlag = false
						if PFlags::MetCallFlag or PFlags::StringFlag or PFlags::IdentFlag then
							mcbool = true
						end if
						PFlags::MetCallFlag = true
						exp = procMethodCall(exp, i)
						i = i - 1
						len = exp::Tokens[l] - 1

						var mct as MethodCallTok = $MethodCallTok$exp::Tokens[i]

						mcflgc = PFlags::MetCallFlag
						iflgc = PFlags::IdentFlag
						sflgc = PFlags::StringFlag

						var i2 as integer = -1
						do until i2 = (mct::Params[l] - 1)
							i2 = i2 + 1
							PFlags::MetCallFlag = false
							PFlags::IdentFlag = false
							PFlags::StringFlag = false
							mct::Params[i2] = Optimize(mct::Params[i2])
						end do
					end if

					PFlags::MetCallFlag = mcflgc
					PFlags::IdentFlag = iflgc
					PFlags::StringFlag = sflgc

					goto fin
				end if

				//if i > j then
				//PFlags::IdentFlag = false
				//end if

				//-------------------------------------------------------------------------------------
				typ = gettype LSParen

				if typ::IsInstanceOfType(tok) then
					var arriloc as Expr
					if PFlags::IdentFlag then
						PFlags::IdentFlag = false
						exp = procIdentArrayAccess(exp, i)
						i = i - 1
						len = exp::Tokens[l] - 1

						var aidt as Ident = $Ident$exp::Tokens[i]
						arriloc = aidt::ArrLoc
						arriloc = Optimize(arriloc)

						PFlags::IdentFlag = true
						j = i
					elseif PFlags::MetCallFlag then
						PFlags::MetCallFlag = false
						exp = procMtdArrayAccess(exp, i)
						i = i - 1
						len = exp::Tokens[l] - 1

						mcflgc = PFlags::MetCallFlag
						iflgc = PFlags::IdentFlag
						sflgc = PFlags::StringFlag

						var amtd as MethodCallTok = $MethodCallTok$exp::Tokens[i]
						var amtdn as MethodNameTok = amtd::Name
						arriloc = amtdn::ArrLoc
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						PFlags::StringFlag = false
						arriloc = Optimize(arriloc)

						PFlags::MetCallFlag = mcflgc
						PFlags::IdentFlag = iflgc
						PFlags::StringFlag = sflgc

						PFlags::MetCallFlag = true
						j = i
					end if
					goto fin
				end if

				if i > j then
					PFlags::MetCallFlag = false
					PFlags::IdentFlag = false
					PFlags::StringFlag = false
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

			mctok = exp::Tokens[i]
			var t2 as Type[] = new Type[3]
			t2[0] = gettype Ident
			t2[1] = gettype MethodCallTok
			t2[2] = gettype StringLiteral
			
			if t2[0]::IsInstanceOfType(mctok) then
				mcident = $Ident$mctok
				if PFlags::MetCallFlag or PFlags::IdentFlag then
					PFlags::MetCallFlag = false
					PFlags::IdentFlag = false
					mctok2 = exp::Tokens[i + 1]
					mcident::MemberAccessFlg = true
					mcident::MemberToAccess = mctok2
					exp::RemToken(i + 1)
					exp::Tokens[i] = mcident
				end if
				if mcident::Value like "^::(.)*$" then
					PFlags::IdentFlag = true
				end if
			elseif t2[1]::IsInstanceOfType(mctok) then
				mcmetcall = $MethodCallTok$mctok
				mcmetname = mcmetcall::Name
				if PFlags::MetCallFlag or PFlags::IdentFlag then
					PFlags::MetCallFlag = false
					PFlags::IdentFlag = false
					mctok2 = exp::Tokens[i + 1]
					mcmetname::MemberAccessFlg = true
					mcmetname::MemberToAccess = mctok2
					exp::RemToken(i + 1)
					mcmetcall::Name = mcmetname
					exp::Tokens[i] = mcmetcall
				end if
				if mcmetname::Value like "^::(.)*$" then
					PFlags::MetCallFlag = true
				end if
			elseif t2[2]::IsInstanceOfType(mctok) then
				mcstr = $StringLiteral$mctok
				if PFlags::MetCallFlag or PFlags::IdentFlag then
					PFlags::MetCallFlag = false
					PFlags::IdentFlag = false
					mctok2 = exp::Tokens[i + 1]
					mcstr::MemberAccessFlg = true
					mcstr::MemberToAccess = mctok2
					exp::RemToken(i + 1)
					exp::Tokens[i] = mcstr
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
				len = exp::Tokens[l]
				i = len
				mcbool = false
				PFlags::MetCallFlag = false
				PFlags::IdentFlag = false
				PFlags::StringFlag = false
				goto loop
			end if
		else
			PFlags::MetChainFlag = false
		end if

		PFlags::MetCallFlag = false
		PFlags::IdentFlag = false
		PFlags::StringFlag = false

		return exp
	end method

end class
