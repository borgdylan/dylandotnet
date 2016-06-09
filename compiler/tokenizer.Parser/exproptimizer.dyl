//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public ExprOptimizer

	field public Flags PFlags
	
	method public void ExprOptimizer(var pf as Flags)
		mybase::ctor()
		PFlags = pf
	end method
	
	method public void ExprOptimizer()
		ctor(new Flags())
	end method
	
	method public prototype Expr Optimize(var exp as Expr)
	method public prototype Expr procType(var stm as Expr, var i as integer)
	method public prototype TypeTok procType2(var stm as Expr, var i as integer)

	method public TypeTok procTypeCore(var stm as Expr, var i as integer)
		var isgeneric as boolean = false
		var tt as TypeTok

		if i < (stm::Tokens::get_Count() - 2) then
			isgeneric = (stm::Tokens::get_Item(++i) is LAParen) andalso (stm::Tokens::get_Item(i + 2) is OfTok)
		end if

		if isgeneric then
			
			var gttarg = stm::Tokens::get_Item(i)
			if !#expr((gttarg is Ident) orelse (gttarg is TypeTok)) then
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, string::Format("Expected an identifier instead of '{0}'!", gttarg::Value))
			end if
			
			var gtt as GenericTypeTok = new GenericTypeTok(gttarg::Value)
			stm::RemToken(++i)
			stm::RemToken(++i)

			var ep2 as Expr = new Expr() {Line = stm::Line}
			var lvl as integer = 1
			var len as integer = --stm::Tokens::get_Count()

			do until i == len
				i++
				if stm::Tokens::get_Item(i) is LAParen then
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					lvl++
					i--
					len--
				elseif stm::Tokens::get_Item(i) is Comma then
					if lvl > 1 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len--
					if lvl <= 1 then
						gtt::AddParam(procType2(ep2, 0))
						ep2 = new Expr() {Line = stm::Line}
					end if
					i--
				elseif stm::Tokens::get_Item(i) is RAParen then
					lvl--
					if lvl > 0 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len--
					if lvl == 0 then
						gtt::AddParam(procType2(ep2, 0))
						break
					end if
					i--
				else
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					i--
					len--
				end if
			end do

			if i < stm::Tokens::get_Count() then
				if stm::Tokens::get_Item(i) is NestedAccessToken then
					stm::Tokens::set_Item(i, new Ident(#expr($NestedAccessToken$stm::Tokens::get_Item(i))::get_ActualValue()))
					gtt::NestedType = procTypeCore(stm, i)
					stm::RemToken(i)
				end if
			end if

			tt = gtt
		else
			if i < stm::Tokens::get_Count() then
				if stm::Tokens::get_Item(i) is TypeTok then
					tt = $TypeTok$stm::Tokens::get_Item(i)
				elseif stm::Tokens::get_Item(i) is Ident then
					tt = new TypeTok(stm::Tokens::get_Item(i)::Value) {Line = stm::Tokens::get_Item(i)::Line}	
				else
					StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, string::Format("Expected an identifier instead of '{0}'!", stm::Tokens::get_Item(i)::Value))
				end if
			else
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, "Expected an identifier instead of ''!")
			end if
		end if
	
		return tt
	end method

	method public Expr procType(var stm as Expr, var i as integer)
		var tt as TypeTok = procTypeCore(stm, i)
		var j = i

		var c as integer = 0
		do until c = 3
			c++
			if i < --stm::Tokens::get_Count() then
				i++
				if stm::Tokens::get_Item(i) is QuestionMark then
					stm::RemToken(i)
					i--
					tt = new GenericTypeTok("System.Nullable") { AddParam(tt) }
				elseif stm::Tokens::get_Item(i) is LRSParen then
					tt::IsArray = true
					stm::RemToken(i)
					i--
				elseif stm::Tokens::get_Item(i) is Ampersand then
					tt::IsByRef = true
					stm::RemToken(i)
					i--
				else
					break
				end if
			end if
		end do

		stm::Tokens::set_Item(j,tt)

		return stm
	end method

	method public TypeTok procType2(var stm as Expr, var i as integer)
		var tt as TypeTok = procTypeCore(stm, i)
		var c as integer = 0

		do until c = 3
			c++
			if i < --stm::Tokens::get_Count() then
				i++
				if stm::Tokens::get_Item(i) is QuestionMark then
					stm::RemToken(i)
					i--
					tt = new GenericTypeTok("System.Nullable") { AddParam(tt) }
				elseif stm::Tokens::get_Item(i) is LRSParen then
					tt::IsArray = true
					stm::RemToken(i)
					i--
				elseif stm::Tokens::get_Item(i) is Ampersand then
					tt::IsByRef = true
					stm::RemToken(i)
					i--
				else
					break
				end if
			end if
		end do

		return tt
	end method

	method public Expr procMtdName(var stm as Expr, var i as integer)

		var isgeneric as boolean = false
		var j as integer = i
		var tt as MethodNameTok

		if i < (stm::Tokens::get_Count() - 2) then
			isgeneric = (stm::Tokens::get_Item(++i) is LAParen) andalso (stm::Tokens::get_Item(i + 2) is OfTok)
		end if

		if isgeneric then

			var gtt as GenericMethodNameTok = new GenericMethodNameTok($Ident$stm::Tokens::get_Item(i))
			stm::RemToken(++i)
			stm::RemToken(++i)

			var ep2 as Expr = new Expr() {Line = stm::Line}
			var lvl as integer = 1
			var len as integer = --stm::Tokens::get_Count()

			do until i = len
				i++
				if stm::Tokens::get_Item(i) is LAParen then
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					lvl++
					i--
					len--
				elseif stm::Tokens::get_Item(i) is Comma then
					if lvl > 1 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len--
					if lvl <= 1 then
						gtt::AddParam(procType2(ep2, 0))
						ep2 = new Expr() {Line = stm::Line}
					end if
					i--
				elseif stm::Tokens::get_Item(i) is RAParen then
					lvl--
					if lvl > 0 then
						ep2::AddToken(stm::Tokens::get_Item(i))
					end if
					stm::RemToken(i)
					len--
					if lvl = 0 then
						gtt::AddParam(procType2(ep2, 0))
						break
					end if
					i--
				else
					ep2::AddToken(stm::Tokens::get_Item(i))
					stm::RemToken(i)
					i--
					len--
				end if
			end do
			tt = gtt
		else
			if stm::Tokens::get_Item(i) is MethodNameTok then
				tt = $MethodNameTok$stm::Tokens::get_Item(i)
			elseif stm::Tokens::get_Item(i) is Ident then
				tt = new MethodNameTok($Ident$stm::Tokens::get_Item(i))
			else
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, string::Format("Expected an identifier instead of '{0}'!", stm::Tokens::get_Item(i)::Value))
			end if
		end if

		stm::Tokens::set_Item(j,tt)

		return stm
	end method

	method public Expr procMtdNameDecl(var stm as Expr, var i as integer)
		procMtdName(stm, i)
		var mn1 = $MethodNameTok$stm::Tokens::get_Item(i)

		if (i < --stm::Tokens::get_Count()) andalso (stm::Tokens::get_Item(++i) is ExplImplAccessToken) then
			//in this case mn1 was the explicit interface name
			//get the actual method name
			i++
			stm::Tokens::set_Item(i, new Ident(#expr($ExplImplAccessToken$stm::Tokens::get_Item(i))::get_ActualValue()) {Line = mn1::Line} )
			procMtdName(stm, i)
			var mn2 = $MethodNameTok$stm::Tokens::get_Item(i)
			stm::RemToken(i)
			i--
			//convert mn1 to a type token and put in mn2
			var tt as TypeTok
			var gmn = mn1 as GenericMethodNameTok
			if gmn isnot null then
				tt = new GenericTypeTok() {Params = gmn::Params}
			else
				tt = new TypeTok()
			end if
			tt::Line = mn1::Line
			tt::Value = mn1::Value
			mn2::ExplType = tt
			stm::Tokens::set_Item(i, mn2)
		else
			//check mn1 for explicit interface name within the value
			var mtssnamarr = ParseUtils::StringParserL(mn1::Value, '.')
			if mtssnamarr::get_Count() > 1 then
				mn1::Value = mtssnamarr::get_Last()
				mn1::ExplType = new TypeTok(string::Join(".", mtssnamarr::View(0,--mtssnamarr::get_Count())::ToArray()))
			end if
		end if

		return stm
	end method

	method assembly Expr checkVarAs(var stm as Expr,out var b as boolean&)
		var bs as integer = 0
		var bst as Token = null

		if stm is null then
			b = false
			return null
		elseif stm::Tokens::get_Count() < 2 then
			b = false
			return null
		end if

		if stm::Tokens::get_Item(0) is VarTok then
			b = true
		elseif (stm::Tokens::get_Item(0) is InTok) andalso (stm::Tokens::get_Item(1) is VarTok) then
			b = true
			bs = 1
			bst = stm::Tokens::get_Item(0)
		elseif (stm::Tokens::get_Item(0) is OutTok) andalso (stm::Tokens::get_Item(1) is VarTok) then
			b = true
			bs = 1
			bst = stm::Tokens::get_Item(0)
		elseif (stm::Tokens::get_Item(0) is InOutTok) andalso (stm::Tokens::get_Item(1) is VarTok) then
			b = true
			bs = 1
			bst = stm::Tokens::get_Item(0)
		else
			b = false
		end if

		if stm::Tokens::get_Count() < (bs + 4) then
			b = false
			return null
		end if

		if b then
			if !#expr(stm::Tokens::get_Item(++bs) is Ident) then
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, string::Format("Expected an identifier instead of '{0}'!", stm::Tokens::get_Item(++bs)))
			elseif !#expr(stm::Tokens::get_Item(bs + 2) is AsTok) then
				StreamUtils::WriteErrorLine(stm::Line, PFlags::CurPath, string::Format("Expected an 'as' instead of '{0}'!", stm::Tokens::get_Item(bs + 2)::Value))
			end if
			var vtt = procType2(stm,bs + 3)

			if stm::Tokens::get_Count() > (bs + 4) then
				StreamUtils::WriteWarnLine(stm::Line, PFlags::CurPath, "Unexpected token at end of parameter declaration!")	
			end if

			return new VarExpr() {Tokens = stm::Tokens, Line = stm::Line, VarName = $Ident$stm::Tokens::get_Item(++bs), VarTyp = vtt, Attr = bst}
		end if
		
		return null
	end method

	method public Expr procMethodCall(var stm as Expr, var i as integer)
		var ep2 as Expr = new Expr() {Line = stm::Line}
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0
		var cc as integer = 0

		i--
		var mn as MethodNameTok = #ternary { stm::Tokens::get_Item(i) is MethodNameTok ? $MethodNameTok$stm::Tokens::get_Item(i), _
			new MethodNameTok($Ident$stm::Tokens::get_Item(i)) }
		
		var mct as MethodCallTok = new MethodCallTok() {Name = mn, Line = mn::Line}
		
		j = i
		i++

		var len as integer = --stm::Tokens::get_Count()

		stm::RemToken(i)
		len = --stm::Tokens::get_Count()
		i--
		
		var flgc as boolean[] = new boolean[] {PFlags::MetCallFlag, PFlags::IdentFlag, PFlags::StringFlag, PFlags::CtorFlag}
				
		do until i = len

			//get parameters
			i++
	
			if (stm::Tokens::get_Item(i) is RParen) orelse (stm::Tokens::get_Item(i) is RAParen) orelse (stm::Tokens::get_Item(i) is RCParen) then
				lvl--
				if lvl = 0 then
					d = false
					if (ep2::Tokens::get_Count() > 0) orelse (cc > 0) then
						PFlags::ResetMCISFlgs()
						mct::AddParam(Optimize(ep2))
					end if
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) orelse (stm::Tokens::get_Item(i) is LAParen) orelse (stm::Tokens::get_Item(i) is LCParen) then
				lvl++
				d = true
				len = --stm::Tokens::get_Count()
			elseif (stm::Tokens::get_Item(i) is Comma) then
				if lvl = 1 then
					cc++
					d = false
					//if ep2::Tokens::get_Count() > 0 then
						PFlags::ResetMCISFlgs()
						mct::AddParam(Optimize(ep2))
					//end if
					ep2 = new Expr() {Line = stm::Line}
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
			end if
		end do
		
		PFlags::MetCallFlag = flgc[0]
		PFlags::IdentFlag = flgc[1]
		PFlags::StringFlag = flgc[2]
		PFlags::CtorFlag = flgc[3]
		
		stm::Tokens::set_Item(j,mct)
		return stm
	
	end method
	
	method private Token ObjInitHelper(var e as Expr)
		e = Optimize(e)
		if e::Tokens::get_Count() > 2 andalso e::Tokens::get_Item(1) is AssignOp2 then
			var e2 as Expr = new Expr() {Line = e::Line}
			e2::Tokens::AddAll(e::Tokens::View(2,e::Tokens::get_Count() - 2))
			return new AttrValuePair() {Name = $Ident$e::Tokens::get_Item(0), ValueExpr = e2}
		end if
		if e::Tokens::get_Count() > 0 andalso e::Tokens::get_Item(0) is MethodCallTok then
			return e::Tokens::get_Item(0)
		end if
		return null
	end method
	
	method public Expr procObjInitCall(var stm as Expr, var i as integer)
		var ct as NewCallTok = $NewCallTok$stm::Tokens::get_Item(i)
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = i
		var lp as C5.ArrayList<of Token> = new C5.ArrayList<of Token>()
		var ep as Expr = new Expr() {Line = stm::Line}
		
		i++
		stm::RemToken(i)
		var len as integer = --stm::Tokens::get_Count()
		i--

		do until i = len
			i++
	
			if (stm::Tokens::get_Item(i) is RParen) orelse (stm::Tokens::get_Item(i) is RAParen) orelse (stm::Tokens::get_Item(i) is RCParen) then
				lvl--
				if lvl = 0 then
					d = false
					lp::Add(ObjInitHelper(ep))
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) orelse (stm::Tokens::get_Item(i) is LAParen) orelse (stm::Tokens::get_Item(i) is LCParen) then
				lvl++
				d = true
			elseif stm::Tokens::get_Item(i) is Comma then
				if lvl = 1 then
					d = false
					lp::Add(ObjInitHelper(ep))
					ep = new Expr() {Line = stm::Line}
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				ep::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
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
		
		i++
		stm::RemToken(i)
		var len as integer = --stm::Tokens::get_Count()
		i--

		do until i = len
			i++
			
			if (stm::Tokens::get_Item(i) is RParen) orelse (stm::Tokens::get_Item(i) is RAParen) orelse (stm::Tokens::get_Item(i) is RCParen) then
				lvl--
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) orelse (stm::Tokens::get_Item(i) is LAParen) orelse (stm::Tokens::get_Item(i) is LCParen) then
				lvl++
				d = true
			elseif stm::Tokens::get_Item(i) is Comma then
				if lvl = 1 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					stg = 2
				else
					d = true
				end if
			elseif stm::Tokens::get_Item(i) is QuestionMark then
				if lvl = 1 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					stg = 1
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				if stg == 0 then
					ct::Condition::AddToken(stm::Tokens::get_Item(i))
				elseif stg == 1 then
					ct::TrueExpr::AddToken(stm::Tokens::get_Item(i))
				elseif stg == 2 then
					ct::FalseExpr::AddToken(stm::Tokens::get_Item(i))
				end if
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
			end if
		end do
		
		ct::Condition = Optimize(ct::Condition)
		ct::TrueExpr = Optimize(ct::TrueExpr)
		ct::FalseExpr = Optimize(ct::FalseExpr)
		stm::Tokens::set_Item(j, ct)
		return stm
	end method
	
	method public Expr procExprCall(var stm as Expr, var i as integer)
		var e as Expr = new Expr() {Line = stm::Tokens::get_Item(i)::Line}
		var ecc as ExprCallTok = $ExprCallTok$stm::Tokens::get_Item(i)
		var lvl as integer = 1
		var d as boolean = true
		
		i++
		stm::RemToken(i)
		var len as integer = --stm::Tokens::get_Count()
		i--

		do until i = len
			i++
			
			if (stm::Tokens::get_Item(i) is RParen) orelse (stm::Tokens::get_Item(i) is RAParen) orelse (stm::Tokens::get_Item(i) is RCParen) then
				lvl--
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) orelse (stm::Tokens::get_Item(i) is LAParen) orelse (stm::Tokens::get_Item(i) is LCParen) then
				lvl++
				d = true
			else
				d = true
			end if
			
			if d then
				e::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
			end if
		end do
		
		ecc::Exp = Optimize(e)
		return stm
	end method

	method public Expr procNullCondCall(var stm as Expr, var i as integer)
		var e as Expr = new Expr() {Line = stm::Tokens::get_Item(i)::Line}
		var ecc as NullCondCallTok = $NullCondCallTok$stm::Tokens::get_Item(i)
		var lvl as integer = 1
		var d as boolean = true
		
		i++
		stm::RemToken(i)
		var len as integer = --stm::Tokens::get_Count()
		i--

		do until i = len
			i++
			
			if (stm::Tokens::get_Item(i) is RParen) orelse (stm::Tokens::get_Item(i) is RAParen) orelse (stm::Tokens::get_Item(i) is RCParen) then
				lvl--
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) orelse (stm::Tokens::get_Item(i) is LAParen) orelse (stm::Tokens::get_Item(i) is LCParen) then
				lvl++
				d = true
			else
				d = true
			end if
			
			if d then
				e::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
			end if
		end do
		
		ecc::Exp = Optimize(e)
		return stm
	end method

	method public Expr procNewCall(var stm as Expr, var i as integer)

		var nct as NewCallTok = new NewCallTok()
		var nact as NewarrCallTok = new NewarrCallTok()
		var aict as ArrInitCallTok = new ArrInitCallTok()
		var tt as TypeTok
		var ep2 as Expr = new Expr() {Line = stm::Line}
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0
		//flag for array creation using length
		var nab as boolean = false
		//flag for array creation using initializer
		var nai as boolean = false

		var cc as integer = 0
		
		//no need to call the next line as its done before this method is used
		//stm = procType(stm, i)
		tt = $TypeTok$stm::Tokens::get_Item(i)
		j = i
		i++
		
		var tok2 as Token = stm::Tokens::get_Item(i)
		var len as integer = --stm::Tokens::get_Count()
		
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
		len = --stm::Tokens::get_Count()
		i--
		
		do until i = len
		
			//get parameters/members/length
			i++
			
			if (stm::Tokens::get_Item(i) is RParen) orelse (stm::Tokens::get_Item(i) is RSParen) orelse (stm::Tokens::get_Item(i) is RAParen) orelse (stm::Tokens::get_Item(i) is RCParen) then
				lvl--
				if lvl = 0 then
					d = false
					if (ep2::Tokens::get_Count() > 0) orelse (cc > 0) then
						if nab then
							nact::ArrayLen = Optimize(ep2)
						elseif nai then
							aict::AddElem(Optimize(ep2))
						else
							nct::AddParam(Optimize(ep2))
						end if
					end if
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif (stm::Tokens::get_Item(i) is LParen) orelse (stm::Tokens::get_Item(i) is LSParen) orelse (stm::Tokens::get_Item(i) is LAParen) orelse (stm::Tokens::get_Item(i) is LCParen) then
				lvl++
				d = true
				//stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				//i--
			elseif stm::Tokens::get_Item(i) is Comma then
				if lvl = 1 then
					d = false
					cc++
					//if ep2::Tokens::get_Count() > 0 then
						if nai then
							aict::AddElem(Optimize(ep2))
							ep2 = new Expr() {Line = stm::Line}
						elseif nab = false then
							nct::AddParam(Optimize(ep2))
							ep2 = new Expr() {Line = stm::Line}
						end if
					//end if
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
				else
					d = true
				end if
			else
				d = true
			end if
			
			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
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
		var ep2 as Expr = new Expr() {Line = stm::Line}
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i--
		var idt as Ident = $Ident$stm::Tokens::get_Item(i)
		j = i
		i++

		var len as integer = --stm::Tokens::get_Count()
		stm::RemToken(i)
		len = --stm::Tokens::get_Count()
		i--

		do until i == len
			//get parameters
			i++

			if stm::Tokens::get_Item(i) is RSParen then
				lvl--
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif stm::Tokens::get_Item(i) is LSParen then
				lvl++
				d = true
			elseif !#expr(stm::Tokens::get_Item(i) is Comma) then
				d = true
			end if

			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
			end if
		end do

		idt::ArrLoc = Optimize(ep2)
		idt::IsArr = true
		stm::Tokens::set_Item(j,idt)

		return stm
	end method

	method public Expr procNullCondArrayAccess(var stm as Expr, var i as integer)
		var ep2 as Expr = new Expr() {Line = stm::Line}
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i--
		var idt as NullCondCallTok = $NullCondCallTok$stm::Tokens::get_Item(i)
		j = i
		i++

		var len as integer = --stm::Tokens::get_Count()
		stm::RemToken(i)
		len = --stm::Tokens::get_Count()
		i--

		do until i == len
			//get parameters
			i++

			if stm::Tokens::get_Item(i) is RSParen then
				lvl--
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif stm::Tokens::get_Item(i) is LSParen then
				lvl++
				d = true
			elseif !#expr(stm::Tokens::get_Item(i) is Comma) then
				d = true
			end if

			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
			end if
		end do

		idt::ArrLoc = Optimize(ep2)
		idt::IsArr = true
		stm::Tokens::set_Item(j,idt)

		return stm
	end method

	method public Expr procMtdArrayAccess(var stm as Expr, var i as integer)
		var ep2 as Expr = new Expr() {Line = stm::Line}
		var lvl as integer = 1
		var d as boolean = true
		var j as integer = 0

		i--
		var mtd as MethodCallTok = $MethodCallTok$stm::Tokens::get_Item(i)
		var idt as MethodNameTok = mtd::Name
		j = i
		i++

		var len as integer = --stm::Tokens::get_Count()

		stm::RemToken(i)
		len = --stm::Tokens::get_Count()
		i--

		var flgc as boolean[] = new boolean[] {PFlags::MetCallFlag, PFlags::IdentFlag, PFlags::StringFlag, PFlags::CtorFlag}

		do until i = len
			//get parameters
			i++

			if stm::Tokens::get_Item(i) is RSParen then
				lvl--
				if lvl = 0 then
					d = false
					stm::RemToken(i)
					len = --stm::Tokens::get_Count()
					i--
					break
				else
					d = true
				end if
			elseif stm::Tokens::get_Item(i) is LSParen then
				lvl++
				d = true
			elseif !#expr(stm::Tokens::get_Item(i) is Comma) then
				d = true
			end if

			if d then
				ep2::AddToken(stm::Tokens::get_Item(i))
				stm::RemToken(i)
				len = --stm::Tokens::get_Count()
				i--
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
		PFlags::CtorFlag = flgc[3]
		
		return stm
	end method

	method public Expr procInterpolate(var stm as Expr, var i as integer, var formattable as boolean)
		var ir = ParseUtils::Interpolate(stm::Tokens::get_Item(i)::Value)

		if ir::get_Expressions()[l] == 0 then
			//error out
			StreamUtils::WriteLine(string::Empty)
			StreamUtils::WriteError(stm::Line, PFlags::CurPath, "Interpolated strings should have at least one interpolation!")

			return stm
		end if

		var exps as C5.ArrayList<of Expr> = new C5.ArrayList<of Expr>()
		var pf as Flags = new Flags()
		var to as TokenOptimizer = new TokenOptimizer(pf)
		var eo as ExprOptimizer = new ExprOptimizer(pf)

		var k = 0
		foreach e in ir::get_Expressions()
			k++
			var ss = new Line()::Analyze(new Stmt() {Line = stm::Line}, e)
			var lenx as integer = --ss::Tokens::get_Count()

			var j = -1
			var pcnt as integer = 0
			var acnt as integer = 0
			var scnt as integer = 0
			var ccnt as integer = 0

			do until j = lenx
				j++
			
				if j != lenx then
					ss::Tokens::set_Item(j,to::Optimize(ss::Tokens::get_Item(j),ss::Tokens::get_Item(++j)))
				else
					ss::Tokens::set_Item(j,to::Optimize(ss::Tokens::get_Item(j),$Token$null))
				end if

				var tok = ss::Tokens::get_Item(j)
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

			//assert that bracket counts are ok
			if pcnt != 0 then
				StreamUtils::WriteLine(string::Empty)
				StreamUtils::WriteError(stm::Line, PFlags::CurPath, string::Format("The amount of opening and closing parentheses do not match in sub-expression {0}!", $object$k))
			elseif acnt != 0 then
				StreamUtils::WriteLine(string::Empty)
				StreamUtils::WriteError(stm::Line, PFlags::CurPath, string::Format("The amount of opening and closing angle parentheses do not match in sub-expression {0}!", $object$k))
			elseif scnt != 0 then
				StreamUtils::WriteLine(string::Empty)
				StreamUtils::WriteError(stm::Line, PFlags::CurPath, string::Format("The amount of opening and closing square parentheses do not match in sub-expression {0}!", $object$k))
			elseif ccnt != 0 then
				StreamUtils::WriteLine(string::Empty)
				StreamUtils::WriteError(stm::Line, PFlags::CurPath, string::Format("The amount of opening and closing curly parentheses do not match in sub-expression {0}!", $object$k))
			end if

			exps::Add(eo::Optimize(new Expr() {Line = stm::Line, Tokens = ss::Tokens}))
		end for
			

		var res as MethodCallTok

		if formattable then
			res = new MethodCallTok() {Line = stm::Line, Name = new MethodNameTok("System.Runtime.CompilerServices.FormattableStringFactory::Create")}
		else
			res = new MethodCallTok() {Line = stm::Line, Name = new MethodNameTok("System.String::Format")}
		end if

		res::AddParam(new Expr() {Line = stm::Line, AddToken(new StringLiteral(ir::get_Format()) {Line = stm::Line})})

		if formattable orelse (exps::get_Count() > 3) then
			var aic = new ArrInitCallTok() {Line = stm::Line, ArrayType = new ObjectTok()}
			res::AddParam(new Expr() {Line = stm::Line, AddToken(aic)})
			foreach ex in exps
				aic::AddElem(new Expr() {Line = stm::Line, AddToken(new ExprCallTok() {Line = stm::Line, _
					Exp = ex, set_OrdOp("conv"), set_TTok(new ObjectTok()), set_Conv(true)})})
			end for
		else
			foreach ex in exps
				res::AddParam(new Expr() {Line = stm::Line, AddToken(new ExprCallTok() {Line = stm::Line, _
					Exp = ex, set_OrdOp("conv"), set_TTok(new ObjectTok()), set_Conv(true)})})
			end for
		end if

		stm::Tokens::set_Item(i, res)
		return stm
	end method

	method public void Verify(var exp as Expr, var i as integer, var j as integer)
		//true - expect valuetoken, false expect an operator
		var statef as boolean = true

		for k = i upto j
			//StreamUtils::WriteWarn(exp::Line, PFlags::CurPath, "Expressions should not be empty!")
			var tok = exp::Tokens::get_Item(k)
			if statef then
				if tok is ValueToken then
				elseif tok is LParen then
					var iprime = ++k
					var jprime = iprime
					var lvl = 1

					do until jprime == j
						if exp::Tokens::get_Item(jprime) is LParen then
							lvl++
						elseif exp::Tokens::get_Item(jprime) is RParen then
							lvl--
							if lvl == 0 then
								break
							end if
						end if
						jprime++
					end do 

					if (jprime - k) == 1 then
						StreamUtils::WriteError(exp::Line, PFlags::CurPath, "Subexpressions should not be empty!")
					else
						Verify(exp, iprime, --jprime)
					end if

					k = jprime
				else
					StreamUtils::WriteError(exp::Line, PFlags::CurPath, string::Format("Expected a value token or expression in parentheses instead of '{0}'!", tok::ToString()))
				end if
			else
				if tok is Op then
					if k == j then
						StreamUtils::WriteError(exp::Line, PFlags::CurPath, "Expressions should not end with an operator!")
					end if
				else
					StreamUtils::WriteError(exp::Line, PFlags::CurPath, string::Format("Expected a binary operator instead of '{0}'!", tok::ToString()))
				end if		
			end if
			statef = !statef
		end for

	end method

	method public void Verify(var exp as Expr)
		Verify(exp, 0, --exp::Tokens::get_Count())
	end method

	method public Expr Optimize(var exp as Expr)
		var i as integer = -1
		var j as integer = -1
		var mcbool as boolean = false
		var mctok as Token = null
		//var newavtok as Token = null
		var mcident as Ident = null
		var mcmetcall as MethodCallTok = null
		var mcmetname as MethodNameTok = null
		var mcstr as StringLiteral = null
		
		if exp is null then
			return null
		end if

		if exp::Tokens::get_Count() == 0 then
			StreamUtils::WriteLine(string::Empty)
			StreamUtils::WriteError(exp::Line, PFlags::CurPath, "Expressions should not be empty!")
		end if
		
		var len as integer = --exp::Tokens::get_Count() 

		do
			//non-method chain i.e. normal code
			i++

			var tok as Token = exp::Tokens::get_Item(i)
			if tok is NonExprToken then
				StreamUtils::WriteLine(string::Empty)
				StreamUtils::WriteError(exp::Line, PFlags::CurPath, string::Format("The token '{0}' is not allowed in expressions!", tok::Value))
			end if

			if tok is DollarSign then
				PFlags::isChanged = true
				PFlags::ConvFlag = true
				PFlags::OrdOp = #expr("conv " + PFlags::OrdOp)::Trim()
				exp::RemToken(i)
				PFlags::ConvTyp = procType2(exp,i)
				exp::RemToken(i)

				if !#expr(i < exp::Tokens::get_Count()) then
					StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, "Expected '$' instead of nothing!")
				elseif exp::Tokens::get_Item(i) isnot DollarSign then
					StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, string::Format("Expected '$' instead of {0}!", exp::Tokens::get_Item(i)::Value))
				else
					exp::RemToken(i)
					i--
					len = --exp::Tokens::get_Count()
				end if 
			elseif tok is NegOp then
				PFlags::isChanged = true
				PFlags::NegFlag = true
				PFlags::OrdOp = #expr("neg " + PFlags::OrdOp)::Trim()
				exp::RemToken(i)
				i--
				len = --exp::Tokens::get_Count() 
			elseif tok is NotOp then
				PFlags::isChanged = true
				PFlags::NotFlag = true
				PFlags::OrdOp = #expr("not " + PFlags::OrdOp)::Trim()
				exp::RemToken(i)
				i--
				len = --exp::Tokens::get_Count() 
			elseif tok is IncOp then
				PFlags::isChanged = true
				PFlags::IncFlag = true
				PFlags::OrdOp = #expr("inc " + PFlags::OrdOp)::Trim()
				exp::RemToken(i)
				i--
				len = --exp::Tokens::get_Count() 
			elseif tok is DecOp then
				PFlags::isChanged = true
				PFlags::DecFlag = true
				PFlags::OrdOp = #expr("dec " + PFlags::OrdOp)::Trim()
				exp::RemToken(i)
				i--
				len = --exp::Tokens::get_Count() 
			elseif tok is Pipe then
				exp::RemToken(i)
				i--
				len = --exp::Tokens::get_Count() 
			elseif tok is RefTok then
				PFlags::isChanged = true
				PFlags::RefFlag = true
				exp::RemToken(i)
				i--
				len = --exp::Tokens::get_Count() 
			elseif tok is ValInRefTok then
				PFlags::isChanged = true
				PFlags::ValinrefFlag = true
				exp::RemToken(i)
				i--
				len = --exp::Tokens::get_Count() 
			elseif tok is Ident then
				if PFlags::MetCallFlag orelse PFlags::IdentFlag orelse PFlags::StringFlag orelse PFlags::CtorFlag then
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
					if (exp::Tokens::get_Item(++i) is LAParen) andalso (exp::Tokens::get_Item(i + 2) is OfTok) then
						exp = procMtdName(exp, i)
						len = --exp::Tokens::get_Count() 
					end if
				end if
			elseif tok is CharLiteral then
				if PFlags::isChanged then
					exp::Tokens::set_Item(i,PFlags::UpdateCharLit($CharLiteral$exp::Tokens::get_Item(i)))
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is NullLiteral then
				if PFlags::isChanged then
					exp::Tokens::set_Item(i,PFlags::UpdateNullLit($NullLiteral$exp::Tokens::get_Item(i)))
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is MeTok then
				if PFlags::isChanged then
					exp::Tokens::set_Item(i,PFlags::UpdateMeTok($MeTok$exp::Tokens::get_Item(i)))
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is StringLiteral then
				PFlags::StringFlag = true
				if PFlags::isChanged then
					exp::Tokens::set_Item(i,PFlags::UpdateStringLit($StringLiteral$exp::Tokens::get_Item(i)))
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is InterpolateLiteral then
				PFlags::MetCallFlag = true
				procInterpolate(exp, i, false)
				if PFlags::isChanged then
					PFlags::UpdateIdent(#expr($MethodCallTok$exp::Tokens::get_Item(i))::Name)
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is FormattableLiteral then
				PFlags::MetCallFlag = true
				procInterpolate(exp, i, true)
				if PFlags::isChanged then
					PFlags::UpdateIdent(#expr($MethodCallTok$exp::Tokens::get_Item(i))::Name)
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is BooleanLiteral then
				if PFlags::isChanged then
					exp::Tokens::set_Item(i,PFlags::UpdateBoolLit($BooleanLiteral$exp::Tokens::get_Item(i)))
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is NumberLiteral then
				if PFlags::isChanged then
					exp::Tokens::set_Item(i,PFlags::UpdateNumLit($NumberLiteral$exp::Tokens::get_Item(i)))
					PFlags::SetUnaryFalse()
					j = i
				end if
			elseif tok is NewTok then
				exp::RemToken(i)
				exp = procNewCall(procType(exp, i), i)
				len = --exp::Tokens::get_Count() 
				if exp::Tokens::get_Item(i) is NewCallTok then
					//if output is newcall
					if i < len then
						if exp::Tokens::get_Item(++i) is LCParen then
							exp = procObjInitCall(exp, i)
							len = --exp::Tokens::get_Count() 
						end if
						PFlags::CtorFlag = true
					end if
				end if
			elseif tok is GettypeTok then
				exp::RemToken(i)
				var n = procType2(exp,i)
				len = --exp::Tokens::get_Count() 
				exp::Tokens::set_Item(i,new GettypeCallTok() {Name = n})
			elseif tok is DefaultTok then
				exp::RemToken(i)
				var n = procType2(exp,i)
				len = --exp::Tokens::get_Count() 
				exp::Tokens::set_Item(i,new DefaultCallTok() {Name = n})
			elseif (tok is IsOp) orelse (tok is IsNotOp) then
				i++
				if exp::Tokens::get_Item(i) isnot NullLiteral then
					exp = procType(exp,i)
				end if
				len = --exp::Tokens::get_Count()
			elseif tok is AsOp then
				i++
				exp = procType(exp,i)
				len = --exp::Tokens::get_Count()
			elseif tok is TernaryTok then
				if i < len then
					if exp::Tokens::get_Item(++i) is LCParen then
						//call ternary processor
						exp = procTernaryCall(exp, i)
						len = --exp::Tokens::get_Count() 
					else
						StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, "Expected a '{' after a '#ternary'!")
					end if
				else
					StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, "Expected a '{' after a '#ternary'!")
				end if
			elseif tok is ExprTok then
				if i < len then
					if exp::Tokens::get_Item(++i) is LParen then
						exp::Tokens::set_Item(i, new ExprCallTok() {Line = exp::Line})
						if PFlags::isChanged then
							PFlags::UpdateToken($IUnaryOperatable$exp::Tokens::get_Item(i))
							PFlags::SetUnaryFalse()
							j = i
						end if
						exp = procExprCall(exp, i)
						len = --exp::Tokens::get_Count()
						PFlags::CtorFlag = true
					else
						StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, "Expected a '(' after a '#expr'!")
					end if 
				else
					StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, "Expected a '(' after a '#expr'!")
				end if
			elseif tok is NullCondTok then
				if i < len then
					if exp::Tokens::get_Item(++i) is LParen then
						exp::Tokens::set_Item(i, new NullCondCallTok() {Line = exp::Line})
						if PFlags::isChanged then
							PFlags::UpdateToken($IUnaryOperatable$exp::Tokens::get_Item(i))
							PFlags::SetUnaryFalse()
							j = i
						end if
						exp = procNullCondCall(exp, i)
						len = --exp::Tokens::get_Count()
						PFlags::NullCondFlag = true
					else
						StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, "Expected a '(' after a '#nullcond'!")
					end if 
				else
					StreamUtils::WriteErrorLine(exp::Line, PFlags::CurPath, "Expected a '(' after a '#nullcond'!")
				end if
//			elseif tok is NewarrTok then
//				exp::RemToken(i)
//				len--
//				tok = exp::Tokens::get_Item(i)
//				exp::RemToken(i)
//				len--
//				newavtok = exp::Tokens::get_Item(i)
//				exp::Tokens::set_Item(i, new NewarrCallTok() {ArrayType = #ternary {tok is TypeTok ? $TypeTok$tok , new TypeTok() {Line = tok::Line, Value = tok::Value}}, ArrayLen = new Expr() {Line = exp::Line, AddToken(newavtok)}})
			elseif tok is LParen then
				if PFlags::IdentFlag then
					PFlags::IdentFlag = false
					if PFlags::MetCallFlag orelse PFlags::StringFlag orelse PFlags::IdentFlag orelse PFlags::CtorFlag orelse PFlags::NullCondFlag then
						mcbool = true
					end if
					PFlags::MetCallFlag = true
					exp = procMethodCall(exp, i)
					i--
					len = --exp::Tokens::get_Count() 
				end if
			elseif tok is LSParen then
				if PFlags::IdentFlag then
					PFlags::IdentFlag = false
					exp = procIdentArrayAccess(exp, i)
					i--
					len = --exp::Tokens::get_Count() 
					PFlags::IdentFlag = true
					j = i
				elseif PFlags::MetCallFlag then
					PFlags::MetCallFlag = false
					exp = procMtdArrayAccess(exp, i)
					i--
					len = --exp::Tokens::get_Count() 
					PFlags::MetCallFlag = true
					j = i
				elseif PFlags::NullCondFlag then
					PFlags::NullCondFlag = false
					exp = procNullCondArrayAccess(exp, i)
					i--
					len = --exp::Tokens::get_Count() 
					PFlags::NullCondFlag = true
					j = i
				end if
			else
				if i > j then
					PFlags::ResetMCISFlgs()
				end if
			end if
		until i >= len

		if mcbool then
			len = exp::Tokens::get_Count()
			i = len
			mcbool = false
			PFlags::ResetMCISFlgs()

			do
				//method chain code
				i--
				mctok = exp::Tokens::get_Item(i)
				
				if mctok is GenericMethodNameTok then
					var mct = $GenericMethodNameTok$mctok
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						var conseq as Token = exp::Tokens::get_Item(++i)
						if conseq is Ident then
							mcident = $Ident$conseq
							mcident::ExplType = new GenericTypeTok(mct::Value, mct::Params)
						elseif conseq is MethodCallTok then
							mcident = #expr($MethodCallTok$conseq)::Name
							mcident::ExplType = new GenericTypeTok(mct::Value, mct::Params)
						end if	
						exp::RemToken(i)
					end if
				elseif mctok is Ident then
					mcident = $Ident$mctok
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						mcident::MemberAccessFlg = true
						mcident::MemberToAccess = exp::Tokens::get_Item(++i)
						exp::RemToken(++i)
						exp::Tokens::set_Item(i,mcident)
					end if
					if mcident::Value like "^::(.)*$" then
						PFlags::IdentFlag = true
					end if
				elseif mctok is NewCallTok then
					var mcnct = $NewCallTok$mctok
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						mcnct::MemberAccessFlg = true
						mcnct::MemberToAccess = exp::Tokens::get_Item(++i)
						exp::RemToken(++i)
						exp::Tokens::set_Item(i,mcnct)
					end if
				elseif mctok is ObjInitCallTok then
					var mcnct = $ObjInitCallTok$mctok
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						mcnct::MemberAccessFlg = true
						mcnct::MemberToAccess = exp::Tokens::get_Item(++i)
						exp::RemToken(++i)
						exp::Tokens::set_Item(i,mcnct)
					end if
				elseif mctok is ExprCallTok then
					var mcnct = $ExprCallTok$mctok
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						mcnct::MemberAccessFlg = true
						mcnct::MemberToAccess = exp::Tokens::get_Item(++i)
						exp::RemToken(++i)
						exp::Tokens::set_Item(i,mcnct)
					end if
				elseif mctok is NullCondCallTok then
					var mcnct = $NullCondCallTok$mctok
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						mcnct::MemberAccessFlg = true
						mcnct::MemberToAccess = exp::Tokens::get_Item(++i)
						exp::RemToken(++i)
						exp::Tokens::set_Item(i,mcnct)
					end if
				elseif mctok is MethodCallTok then
					mcmetcall = $MethodCallTok$mctok
					mcmetname = mcmetcall::Name
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						mcmetname::MemberAccessFlg = true
						mcmetname::MemberToAccess = exp::Tokens::get_Item(++i)
						exp::RemToken(++i)
						mcmetcall::Name = mcmetname
						exp::Tokens::set_Item(i,mcmetcall)
					end if
					if mcmetname::Value like "^::(.)*$" then
						PFlags::MetCallFlag = true
					end if
				elseif mctok is StringLiteral then
					mcstr = $StringLiteral$mctok
					if PFlags::MetCallFlag orelse PFlags::IdentFlag then
						PFlags::MetCallFlag = false
						PFlags::IdentFlag = false
						mcstr::MemberAccessFlg = true
						mcstr::MemberToAccess = exp::Tokens::get_Item(++i)
						exp::RemToken(++i)
						exp::Tokens::set_Item(i,mcstr)
					end if
				end if
			until i <= 0
		end if

		PFlags::ResetMCISFlgs()

		Verify(exp)
		return exp
	end method

end class