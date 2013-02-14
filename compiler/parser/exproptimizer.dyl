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
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens::get_Item(0))
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
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens::get_Item(0))
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
				tt = new TypeTok(stm::Tokens::get_Item(i)::Value)
				tt::Line = stm::Tokens::get_Item(i)::Line
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
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens::get_Item(0))
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
						ep2 = procType(ep2, 0)
						gtt::AddParam($TypeTok$ep2::Tokens::get_Item(0))
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
		
		var vars as VarExpr = null

		if b then
			vars = new VarExpr()
			stm = procType(stm,bs + 3)
			vars::Tokens = stm::Tokens
			vars::Line = stm::Line
			vars::VarName = $Ident$stm::Tokens::get_Item(bs + 1)
			vars::VarTyp = $TypeTok$stm::Tokens::get_Item(bs + 3)
			vars::Attr = bst
		end if
		
		return vars
	end method

	method public Expr procMethodCall(var stm as Expr, var i as integer)
	
		var mn as MethodNameTok = null
		var mct as MethodCallTok = new MethodCallTok()
		var ep2 as Expr = new Expr()
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i = i - 1
		if stm::Tokens::get_Item(i) is MethodNameTok then
			mn = $MethodNameTok$stm::Tokens::get_Item(i)
		else
			mn = new MethodNameTok($Ident$stm::Tokens::get_Item(i))
		end if

		j = i
		i = i + 1

		var len as integer = stm::Tokens::get_Count() - 1

		stm::RemToken(i)
		len = stm::Tokens::get_Count() - 1
		i = i - 1

		do until i = len

			//get parameters
			i = i + 1
	
			if (stm::Tokens::get_Item(i) is RParen) or (stm::Tokens::get_Item(i) is RAParen) or (stm::Tokens::get_Item(i) is RCParen) then
				lvl = lvl - 1
				if lvl = 0 then
					d = false
					if ep2::Tokens::get_Count() > 0 then
						mct::AddParam(ep2)
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
				//stm::RemToken(i)
				len = stm::Tokens::get_Count() - 1
				//i = i - 1
			elseif (stm::Tokens::get_Item(i) is Comma) then
				if lvl = 1 then
					d = false
					if ep2::Tokens::get_Count() > 0 then
						mct::AddParam(ep2)
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
	
		mct::Name = mn
		mct::Line = mn::Line
		stm::Tokens::set_Item(j,mct)
	
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
							nact::ArrayLen = ep2
						elseif nai then
							aict::AddElem(ep2)
						else
							nct::AddParam(ep2)
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
							aict::AddElem(ep2)
							ep2 = new Expr()
						elseif nab = false then
							nct::AddParam(ep2)
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

		var idt as Ident = null
		var ep2 as Expr = new Expr()
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i = i - 1
		idt = $Ident$stm::Tokens::get_Item(i)
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
					//mct::AddParam(ep2)
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

		idt::ArrLoc = ep2
		idt::IsArr = true
		stm::Tokens::set_Item(j,idt)

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
		mtd = $MethodCallTok$stm::Tokens::get_Item(i)
		idt = mtd::Name
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
					//mct::AddParam(ep2)
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

		idt::ArrLoc = ep2
		idt::IsArr = true
		mtd::Name = idt
		stm::Tokens::set_Item(j,mtd)

		return stm

	end method

	method public Expr Optimize(var exp as Expr)

		var len as integer = exp::Tokens::get_Count() - 1
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
				
				var ttk as TypeTok = new TypeTok()
				if (tok is TypeTok) = false then
					var tk as Token = exp::Tokens::get_Item(i)
					ttk::Line = tk::Line
					ttk::Value = tk::Value
					ttk::IsArray = true
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
				
				var ttk2 as TypeTok = new TypeTok()
				if (tok is TypeTok) = false then
					var tk2 as Token = exp::Tokens::get_Item(i)
					ttk2::Line = tk2::Line
					ttk2::Value = tk2::Value
					ttk2::IsByRef = true
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
						var cl1 as CharLiteral = $CharLiteral$exp::Tokens::get_Item(i)
						exp::Tokens::set_Item(i,PFlags::UpdateCharLit(cl1))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is NullLiteral then
					if PFlags::isChanged then
						var nul1 as NullLiteral = $NullLiteral$exp::Tokens::get_Item(i)
						exp::Tokens::set_Item(i,PFlags::UpdateNullLit(nul1))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is MeTok then
					if PFlags::isChanged then
						var metk1 as MeTok = $MeTok$exp::Tokens::get_Item(i)
						exp::Tokens::set_Item(i,PFlags::UpdateMeTok(metk1))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is StringLiteral then
					PFlags::StringFlag = true
					if PFlags::isChanged then
						var sl1 as StringLiteral = $StringLiteral$exp::Tokens::get_Item(i)
						exp::Tokens::set_Item(i,PFlags::UpdateStringLit(sl1))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is BooleanLiteral then
					if PFlags::isChanged then
						var bl1 as BooleanLiteral = $BooleanLiteral$exp::Tokens::get_Item(i)
						exp::Tokens::set_Item(i,PFlags::UpdateBoolLit(bl1))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is NumberLiteral then
					if PFlags::isChanged then
						var nl1 as NumberLiteral = $NumberLiteral$exp::Tokens::get_Item(i)
						exp::Tokens::set_Item(i,PFlags::UpdateNumLit(nl1))
						PFlags::SetUnaryFalse()
						j = i
					end if
					goto fin
				end if

				if tok is NewTok then

					exp::RemToken(i)
					len = len - 1

					exp = procType(exp, i)
					len = exp::Tokens::get_Count() - 1

					exp = procNewCall(exp, i)
					len = exp::Tokens::get_Count() - 1

					if exp::Tokens::get_Item(i) is NewCallTok then
						//if output is newcall
						var nctoken as NewCallTok = $NewCallTok$exp::Tokens::get_Item(i)

						var nci2 as integer = -1
						do until nci2 = (nctoken::Params::get_Count() - 1)
							nci2 = nci2 + 1
							nctoken::Params::set_Item(nci2,Optimize(nctoken::Params::get_Item(nci2)))
						end do
						
						//if exp::Tokens::get_Item(i + 1) is LCParen then
							//object intitializer code here
						//end if
						
					elseif exp::Tokens::get_Item(i) is ArrInitCallTok then
						//if output is arrinitcall
						var naitoken as ArrInitCallTok = $ArrInitCallTok$exp::Tokens::get_Item(i)

						var naii2 as integer = -1
						do until naii2 = (naitoken::Elements::get_Count() - 1)
							naii2 = naii2 + 1
							naitoken::Elements::set_Item(naii2,Optimize(naitoken::Elements::get_Item(naii2)))
						end do
					else
						//if output is newarrcall
						var nactoken as NewarrCallTok = $NewarrCallTok$exp::Tokens::get_Item(i)
						nactoken::ArrayLen = Optimize(nactoken::ArrayLen)
					end if

					goto fin
				end if

				if tok is GettypeTok then

					exp::RemToken(i)
					len = len - 1

					exp = procType(exp,i)
					len = exp::Tokens::get_Count() - 1

					var gtctoken as GettypeCallTok = new GettypeCallTok()
					gtctoken::Name = $TypeTok$exp::Tokens::get_Item(i)
					exp::Tokens::set_Item(i,gtctoken)

					goto fin
				end if

				if (tok is IsOp) or (tok is AsOp) then
					i = i + 1
					exp = procType(exp,i)
					len = exp::Tokens::get_Count() - 1
					goto fin
				end if

				if tok is NewarrTok then

					exp::RemToken(i)
					len = len - 1

					tok = exp::Tokens::get_Item(i)

					exp::RemToken(i)
					len = len - 1

					if (tok is TypeTok) = false then
						newattok = new TypeTok()
						newattok::Line = tok::Line
						newattok::Value = tok::Value
					else
						newattok = $TypeTok$tok
					end if

					newavtok = exp::Tokens::get_Item(i)

					var newarrtoken as NewarrCallTok = new NewarrCallTok()
					newarrtoken::ArrayType = newattok
					newaexpr = new Expr()
					newaexpr::AddToken(newavtok)
					newarrtoken::ArrayLen = newaexpr

					exp::Tokens::set_Item(i,newarrtoken)

					goto fin
				end if

				if tok is PtrTok then

					exp::RemToken(i)
					len = len - 1

					ptrmntok = new MethodNameTok($Ident$exp::Tokens::get_Item(i))

					var ptrctoken as PtrCallTok = new PtrCallTok()
					ptrctoken::MetToCall = ptrmntok
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

						var mct as MethodCallTok = $MethodCallTok$exp::Tokens::get_Item(i)

						mcflgc = PFlags::MetCallFlag
						iflgc = PFlags::IdentFlag
						sflgc = PFlags::StringFlag

						var i2 as integer = -1
						do until i2 = (mct::Params::get_Count() - 1)
							i2 = i2 + 1
							PFlags::MetCallFlag = false
							PFlags::IdentFlag = false
							PFlags::StringFlag = false
							mct::Params::set_Item(i2,Optimize(mct::Params::get_Item(i2)))
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

				if tok is LSParen then
					var arriloc as Expr
					if PFlags::IdentFlag then
						PFlags::IdentFlag = false
						exp = procIdentArrayAccess(exp, i)
						i = i - 1
						len = exp::Tokens::get_Count() - 1

						var aidt as Ident = $Ident$exp::Tokens::get_Item(i)
						arriloc = aidt::ArrLoc
						arriloc = Optimize(arriloc)

						PFlags::IdentFlag = true
						j = i
					elseif PFlags::MetCallFlag then
						PFlags::MetCallFlag = false
						exp = procMtdArrayAccess(exp, i)
						i = i - 1
						len = exp::Tokens::get_Count() - 1

						mcflgc = PFlags::MetCallFlag
						iflgc = PFlags::IdentFlag
						sflgc = PFlags::StringFlag

						var amtd as MethodCallTok = $MethodCallTok$exp::Tokens::get_Item(i)
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
