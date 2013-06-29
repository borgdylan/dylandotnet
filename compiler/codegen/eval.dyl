//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//delegate public auto ansi void ASTEmitDelegate(var t as Token, var emt as boolean)

class public auto ansi beforefieldinit Evaluator

	field public OpStack Stack

	method public void Evaluator()
		me::ctor()
		Stack = null
	end method
	
	method public prototype void ASTEmit(var tok as Token, var emt as boolean)

	method public static integer RetPrec(var tok as Token)
		if tok is Op then
			return #expr($Op$tok)::PrecNo
		elseif tok is LParen then
			return -1		
		elseif tok is RParen then
			return 0
		else
			return 0		
		end if
	end method

	method public Expr ConvToRPN(var exp as Expr)
		if (exp::Tokens::get_Count() == 0) or (exp::Tokens::get_Count() == 1) then
			return exp
		end if
		
		Stack = new OpStack()
		var exp2 as Expr = new Expr() {Line = exp::Line}
		var i as integer = -1
		var tok as Token = null

		do until i == --exp::Tokens::get_Count()

			i++
			tok = exp::Tokens::get_Item(i)

			if !#expr((tok is Op) or (tok is LParen) or (tok is RParen)) then
				exp2::AddToken(tok)
			elseif tok is Op then
				if Stack::getLength() != 0 then
					if RetPrec(tok) <= RetPrec(Stack::TopOp()) then
						exp2::AddToken(Stack::TopOp())
						Stack::PopOp()
					end if
				end if
				Stack::PushOp(tok)
			elseif tok is LParen then
				Stack::PushOp(tok)
			elseif tok is RParen then
				if Stack::getLength() != 0 then
					if !#expr(Stack::TopOp() is LParen) then
						exp2::AddToken(Stack::TopOp())
						Stack::PopOp()
						if Stack::getLength() != 0 then
							if Stack::TopOp() is LParen then
								Stack::PopOp()
							end if
						end if
					end if
				else
					if Stack::TopOp() is LParen then
						Stack::PopOp()
					end if
				end if
			end if
		end do

		if Stack::getLength() == 0 then
			return exp2
		end if

		do
			if !#expr(Stack::TopOp() is LParen) then
				exp2::AddToken(Stack::TopOp())
			end if
			Stack::PopOp()
		until Stack::getLength() = 0

		return exp2
	end method

	method public Token ConvToAST(var exp as Expr)

		var tokf as Token
		var i as integer = -1
		var j as integer = 0
		var tok as Token = null
		var tok2 as Token = null
		var optok as Op

		if exp::Tokens::get_Count() == 1 then
			return exp::Tokens::get_Item(0)
		elseif exp::Tokens::get_Count() = 0 then
			return null
		end if
		var len as integer = --exp::Tokens::get_Count()
		do until i == len
			i++
			tok = exp::Tokens::get_Item(i)
			if tok is Op then
				if i >= 2 then
					optok = $Op$tok
					j = --i
					tok2 = exp::Tokens::get_Item(j)
					exp::RemToken(j)
					len = --len
					j = --j
					tok = exp::Tokens::get_Item(j)
					exp::RemToken(j)
					len = --len
					optok::LChild = tok
					optok::RChild = tok2
					exp::Tokens::set_Item(j,optok)
					i = j
				end if
			end if
			if i == len then
				tokf = exp::Tokens::get_Item(0)
			end if
		end do
		return tokf
	end method
	
	method private void ASTEmitArrayLoad(var idt as Ident, var emt as boolean)
		if idt::IsArr then
			var typ as IKVM.Reflection.Type = null
			if Helpers::CheckIfArrLen(idt::ArrLoc) then
				typ = AsmFactory::Type02
				if !typ::get_IsArray() then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + typ::ToString() + "' is not an Array Type.")
				end if
				if emt then
					ILEmitter::EmitLdlen()
					ILEmitter::EmitConvI4()
				end if
				AsmFactory::Type02 = ILEmitter::Univ::Import(gettype integer)
			else
				typ = AsmFactory::Type02
				ASTEmit(ConvToAST(ConvToRPN(idt::ArrLoc)), emt)
				
				if !Helpers::IsPrimitiveIntegralType(AsmFactory::Type02) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Array Indices should be of a Primitive Integer Type.")
				elseif !typ::get_IsArray() then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + typ::ToString() + "' is not an Array Type.")
				end if
				
				typ = typ::GetElementType()
				if idt::IsRef then
					AsmFactory::ForcedAddrFlg = true
				end if
				if emt then
					ILEmitter::EmitConvI()
					if idt::MemberAccessFlg then
						AsmFactory::AddrFlg = true
						AsmFactory::Type04 = typ
					end if
					Helpers::EmitElemLd(typ)
				end if
				if AsmFactory::ForcedAddrFlg then
					typ = typ::MakeByRefType()
				end if
				AsmFactory::Type02 = typ
				AsmFactory::AddrFlg = false
				AsmFactory::ForcedAddrFlg = false
			end if
		end if
	end method
	
	method public void ASTEmitUnary(var iuo as IUnaryOperatable, var emt as boolean)
		foreach s in ParseUtils::StringParser(iuo::get_OrdOp(), " ")
			if (s == "conv") and (iuo is IConvable) then
				var idt = $IConvable$iuo
				if idt::get_Conv() then
					var	src1 = AsmFactory::Type02
					AsmFactory::Type02 = Helpers::CommitEvalTTok(idt::get_TTok())
					if AsmFactory::Type02 = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Class '" + idt::get_TTok()::Value + "' was not found.")
					end if	
					if emt then
						Helpers::EmitConv(src1, AsmFactory::Type02)
					end if
				end if
			end if
			if (s == "neg") and (iuo is INegatable) then
				if #expr($INegatable$iuo)::get_DoNeg() then
					if emt then
						Helpers::EmitNeg(AsmFactory::Type02)
					end if
				end if
			end if
			if (s == "not") and (iuo is INotable) then
				if #expr($INotable$iuo)::get_DoNot() then
					if emt then
						Helpers::EmitNot(AsmFactory::Type02)
					end if
				end if
			end if
			if (s == "inc") and (iuo is IIncDecable) then
				if #expr($IIncDecable$iuo)::get_DoInc() then
					if emt then
						Helpers::EmitInc(AsmFactory::Type02)
					end if
				end if
			end if
			if (s == "dec") and (iuo is IIncDecable) then
				if #expr($IIncDecable$iuo)::get_DoDec() then
					if emt then
						Helpers::EmitDec(AsmFactory::Type02)
					end if
				end if
			end if
		end for
	end method

	method public void ASTEmitIdent(var idt as Ident, var emt as boolean)
	
		var i as integer = -1
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var vr as VarItem
		var idtfldinf as FieldInfo
		var idtisstatic as boolean = false
		var typ as IKVM.Reflection.Type
		var idtnamarr as string[] = ParseUtils::StringParser(idt::Value, ":")
		var pushaddr as boolean = idt::IsRef and idt::MemberAccessFlg

		if pushaddr then
			idt::IsRef = false
		elseif idtnamarr[0] = "me" then
			i++
			idtb1 = true
		end if
			
		if AsmFactory::ChainFlg then
			AsmFactory::ChainFlg = false
			typ = AsmFactory::Type02
			idtb2 = true
			idtisstatic = false
		end if
		if AsmFactory::RefChainFlg then
			AsmFactory::RefChainFlg = false
			pushaddr = idt::MemberAccessFlg
			if !pushaddr then
				idt::IsRef = true
			end if
		end if

		do until i = --idtnamarr[l]
			i++
			AsmFactory::AddrFlg = i != --idtnamarr[l]
			AsmFactory::ForcedAddrFlg = (i == --idtnamarr[l]) and idt::IsRef and !idt::IsArr
			
			if !idtb2 then
				if !idtb1 then
					vr = SymTable::FindVar(idtnamarr[i])
					if vr != null then
						if emt then
							AsmFactory::Type04 = vr::VarTyp
							Helpers::EmitLocLd(vr::Index, vr::LocArg)
						end if
						typ = vr::VarTyp
						if AsmFactory::ForcedAddrFlg and !typ::get_IsByRef() then
							typ = typ::MakeByRefType()
						elseif !AsmFactory::ForcedAddrFlg and typ::get_IsByRef() then
							typ = typ::GetElementType()
						end if
						AsmFactory::Type02 = typ
						idtb2 = true
						continue
					end if
				end if
				
				//local field check
				idtfldinf = Helpers::GetLocFld(idtnamarr[i])
				if idtfldinf != null then
					idtisstatic = idtfldinf::get_IsStatic()
					
					if !idtisstatic and ILEmitter::StaticFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is an instance field and cannot be used from a static method without an instance being provided.")
					end if
					
					if !idtisstatic then
						if emt then
							ILEmitter::EmitLdarg(0)
						end if
					end if
					if emt then
						if !Loader::FldLitFlag then
							AsmFactory::Type04 = idtfldinf::get_FieldType()
							Helpers::EmitFldLd(idtfldinf, idtisstatic)
						else
							Helpers::EmitLiteral(Helpers::ProcessConst( _
								new ConstLiteral() {ConstVal = Loader::FldLitVal, ExtTyp = Loader::FldLitTyp, IntTyp = #ternary {Loader::EnumLitFlag ? Loader::EnumLitTyp, Loader::FldLitTyp}}))
							typ = Loader::FldLitTyp
							AsmFactory::Type02 = typ
						end if
					end if
					idtisstatic = false
					typ = idtfldinf::get_FieldType()
					if AsmFactory::ForcedAddrFlg then
						typ = typ::MakeByRefType()
					end if
					AsmFactory::Type02 = typ
					idtb2 = true
					continue
				end if
				//----------------------
				
				typ = Helpers::CommitEvalTTok(new TypeTok(idtnamarr[i]))
				idtisstatic = true

				if typ = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Class '" + idtnamarr[i] + "' is not defined.")
				end if
				
			else
				if !typ::Equals(AsmFactory::CurnTypB) then
					idtfldinf = Helpers::GetExtFld(typ, idtnamarr[i])
					if idtfldinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + typ::ToString() + "'.")
					end if
					
					if idtisstatic != idtfldinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' defined for the class '" _
							+ typ::ToString() + #ternary {idtisstatic and !idtfldinf::get_IsStatic() ? "' is an instance field.", "' is static."})
					end if
					
					typ = Loader::MemberTyp
					if AsmFactory::ForcedAddrFlg then
						typ = typ::MakeByRefType()
					end if
					AsmFactory::Type02 = typ
					
					if emt then
						if !Loader::FldLitFlag then
							AsmFactory::Type04 = Loader::MemberTyp
							Helpers::EmitFldLd(idtfldinf, idtisstatic)
						else
							Helpers::EmitLiteral(Helpers::ProcessConst( _
								new ConstLiteral() {ConstVal = Loader::FldLitVal, ExtTyp = Loader::FldLitTyp, IntTyp = #ternary {Loader::EnumLitFlag ? Loader::EnumLitTyp, Loader::FldLitTyp}}))
							typ = Loader::FldLitTyp
							AsmFactory::Type02 = typ
						end if
					end if
				else
					idtfldinf = Helpers::GetLocFld(idtnamarr[i])
					if idtfldinf == null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
					end if
					
					if idtisstatic != idtfldinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' defined for the class '" _
							+ AsmFactory::CurnTypB::ToString() + #ternary {idtisstatic and !idtfldinf::get_IsStatic() ? "' is an instance field.", "' is static."})
					end if
					
					if emt then
						if !Loader::FldLitFlag then
							AsmFactory::Type04 = idtfldinf::get_FieldType()
							Helpers::EmitFldLd(idtfldinf, idtisstatic)
						else
							Helpers::EmitLiteral(Helpers::ProcessConst( _
								new ConstLiteral() {ConstVal = Loader::FldLitVal, ExtTyp = Loader::FldLitTyp, IntTyp = #ternary {Loader::EnumLitFlag ? Loader::EnumLitTyp, Loader::FldLitTyp}}))
							typ = Loader::FldLitTyp
							AsmFactory::Type02 = typ
						end if
					end if
					
					typ = idtfldinf::get_FieldType()
					if AsmFactory::ForcedAddrFlg then
						typ = typ::MakeByRefType()
					end if
					AsmFactory::Type02 = typ
				end if

				if idtisstatic then
					idtisstatic = false
				end if
			end if
			idtb2 = true
		end do
		AsmFactory::ForcedAddrFlg = false

		ASTEmitArrayLoad(idt, emt)

		if idt::MemberAccessFlg then
			AsmFactory::ChainFlg = true
			AsmFactory::RefChainFlg = pushaddr
			ASTEmit(idt::MemberToAccess, emt)
		end if
		ASTEmitUnary(idt, emt)
	end method
	
	method public void ASTEmitMethod(var mctok as MethodCallTok, var emt as boolean)
		var mcparenttyp as IKVM.Reflection.Type
		var mnstrarr as string[]
		var mcmetinf as MethodInfo
		var mntok as MethodNameTok = mctok::Name
		var ncctorinf as ConstructorInfo
		var mcfldinf as FieldInfo
		var mcvr as VarItem
		var mcisstatic as boolean = false
		var mectorflg as boolean = false
		var mcrestrord as integer = 2
		var i as integer = -1
		var j as integer = 0
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var idtisstatic as boolean = false
		var pushaddr as boolean = mntok::IsRef and mntok::MemberAccessFlg
		var baseflg as boolean = false

		mnstrarr = ParseUtils::StringParser(mntok::Value, ":")
		mcparenttyp = AsmFactory::CurnTypB
		mcmetinf = null
		mcfldinf = null
		mectorflg = (mntok::Value == "me::ctor") or (mntok::Value == "mybase::ctor")

		i = -1
		mnstrarr = ParseUtils::StringParser(mntok::Value, ":")
		var len as integer = mnstrarr[l] - 2

		if pushaddr then
			mntok::IsRef = false
		end if
		if mnstrarr[0] = "me" then
			i++
			idtb1 = true
			mcrestrord = 3
		elseif mnstrarr[0] = "mybase" then
			i++
			idtb1 = true
			mcrestrord = 3
			baseflg = true
		end if

		if !mectorflg then
			if AsmFactory::ChainFlg then
				AsmFactory::ChainFlg = false
				mcparenttyp = AsmFactory::Type02
				idtb2 = true
				mcisstatic = false
			end if
			if AsmFactory::RefChainFlg then
				AsmFactory::RefChainFlg = false
				pushaddr = mntok::MemberAccessFlg
				if !pushaddr then
					mntok::IsRef = true
				end if
			end if

			if mnstrarr[l] >= mcrestrord then
				AsmFactory::AddrFlg = true

				do until i = len
					i++

					if !idtb2 then
						if !idtb1 then
							mcvr = SymTable::FindVar(mnstrarr[i])
							if mcvr != null then
								if emt then
									AsmFactory::Type04 = mcvr::VarTyp
									Helpers::EmitLocLd(mcvr::Index, mcvr::LocArg)
								end if
								mcparenttyp = mcvr::VarTyp
								if mcparenttyp::get_IsByRef() then
									mcparenttyp = mcparenttyp::GetElementType()
								end if
								AsmFactory::Type02 = mcparenttyp
								idtb2 = true
								continue
							end if
						end if

						//local field check
						mcfldinf = Helpers::GetLocFld(mnstrarr[i])
						if mcfldinf != null then
							idtisstatic = mcfldinf::get_IsStatic()
							
							if !idtisstatic and ILEmitter::StaticFlg then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is an instance field and cannot be used from a static method without an instance being provided.")
							end if
							
							if !idtisstatic then
								if emt then
									ILEmitter::EmitLdarg(0)
								end if
							end if
							if emt then
								AsmFactory::Type04 = mcfldinf::get_FieldType()
								Helpers::EmitFldLd(mcfldinf, idtisstatic)
							end if
							mcisstatic = false
							mcparenttyp = mcfldinf::get_FieldType()
							AsmFactory::Type02 = mcparenttyp
							idtb2 = true
							continue
						end if
						//----------------------------------
				
						mcparenttyp = Helpers::CommitEvalTTok(new TypeTok(mnstrarr[i]))
						mcisstatic = true

						if mcparenttyp = null then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Class '" + mnstrarr[i] + "' is not defined.")
						end if
					else
						if mcparenttyp::Equals(AsmFactory::CurnTypB) then
							mcfldinf = Helpers::GetLocFld(mnstrarr[i])
							if mcfldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
							end if
							mcparenttyp = mcfldinf::get_FieldType()
						else
							mcfldinf = Helpers::GetExtFld(mcparenttyp, mnstrarr[i])
							if mcfldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
							end if
							mcparenttyp = Loader::MemberTyp
						end if
						
						if mcisstatic != mcfldinf::get_IsStatic() then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' defined for the class '" _
								+ mcfldinf::get_DeclaringType()::ToString() + #ternary {mcisstatic and !mcfldinf::get_IsStatic() ? "' is an instance field.", "' is static."})
						end if
						
						AsmFactory::Type02 = mcparenttyp
						AsmFactory::Type04 = mcparenttyp

						if emt then
							Helpers::EmitFldLd(mcfldinf, mcisstatic)
						end if
						if mcisstatic then
							mcisstatic = false
						end if
					end if

					idtb2 = true
				end do

				AsmFactory::AddrFlg = false
			end if
		else
			if emt then
				ILEmitter::EmitLdarg(0)
			end if
		end if

		i++
		//instance load for local methods of current isntance

		if !mectorflg then
			if !idtb2 then
				if emt then
					Helpers::BaseFlg = baseflg
					mcmetinf = Helpers::GetLocMet(mntok, mctok::TypArr)
					Helpers::BaseFlg = false
					mcisstatic = mcmetinf::get_IsStatic()
					
					if !mcisstatic and ILEmitter::StaticFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' is an instance method and cannot be called from a static method without an instance being provided.")
					end if
					
					if !mcisstatic then
						ILEmitter::EmitLdarg(0)
					end if
				end if
			end if
		end if
				
		j = i
		AsmFactory::Type03 = AsmFactory::Type02

		i = -1
			
		var lt = new C5.LinkedList<of IKVM.Reflection.Type>()
		foreach param in mctok::Params
			ASTEmit(ConvToAST(ConvToRPN(param)), emt)
			lt::Add(AsmFactory::Type02)
		end for
		var typarr1 as IKVM.Reflection.Type[] = lt::ToArray()
		
		if !emt then
			mctok::TypArr = typarr1
		end if

		AsmFactory::Type02 = AsmFactory::Type03
		i = j
		AsmFactory::Type05 = mcparenttyp

		if !mectorflg then
			if idtb2 and !mcparenttyp::Equals(AsmFactory::CurnTypB) then
				mcmetinf = Helpers::GetExtMet(mcparenttyp, mntok, typarr1)
				if mcmetinf = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
				end if
				AsmFactory::Type02 = Loader::MemberTyp
				baseflg = false
				
				if mcisstatic != mcmetinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' defined for the class '" _
							+ mcparenttyp::ToString() + #ternary {mcisstatic and !mcmetinf::get_IsStatic() ? "' is an instance method.", "' is static."})
				end if
				
			else
				if !idtb2 then
					Helpers::BaseFlg = baseflg
				end if
				mcmetinf = Helpers::GetLocMet(mntok, typarr1)
				if mcmetinf = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
				end if
				AsmFactory::Type02 = mcmetinf::get_ReturnType()
				mcisstatic = mcmetinf::get_IsStatic()
			end if
		
			if emt then
				AsmFactory::PopFlg = mctok::PopFlg
				Helpers::EmitMetCall(mcmetinf, mcisstatic)
				AsmFactory::PopFlg = false
			end if
			Helpers::BaseFlg = false
			if !mctok::PopFlg then
				ASTEmitArrayLoad(mntok, emt)
			end if

			if mntok::MemberAccessFlg then
				AsmFactory::ChainFlg = true
				AsmFactory::RefChainFlg = pushaddr
				ASTEmit(mntok::MemberToAccess, emt)
			end if
		else
			mcparenttyp = AsmFactory::CurnInhTyp
			Loader::ProtectedFlag = true
			ncctorinf = Helpers::GetLocCtor(mcparenttyp, typarr1)
			Loader::ProtectedFlag = false

			if ncctorinf = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Base Class Constructor with the given parameter types is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
			end if

			if emt then
				ILEmitter::EmitCallCtor(ncctorinf)
			end if
		end if

		ASTEmitUnary(mntok, emt)
	end method

	method public void ASTEmitNew(var nctok as NewCallTok, var emt as boolean)
		//constructor call section
		var delparamarr as IKVM.Reflection.Type[]
		var delmtdnam as MethodNameTok
		var nctyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(nctok::Name)
		//var mcparams as C5.ArrayList<of Expr> = nctok::Params
		var delcreate as boolean = false
		var typarr1 as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[0]
		var ncctorinf as ConstructorInfo
		var i as integer = -1
		var mnstrarr as string[]
		var len as integer
		var mcparenttyp as IKVM.Reflection.Type = null
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var mcvr as VarItem
		var mcfldinf as FieldInfo = null
		var idtisstatic as boolean = false
		var mcisstatic as boolean = false
		var mcmetinf as MethodInfo = null
		
		if nctyp = null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + nctok::Name::ToString() + "' is not defined.")
		end if

		if nctyp::IsSubclassOf(ILEmitter::Univ::Import(gettype MulticastDelegate)) then
			delcreate = true
			delparamarr = Loader::GetDelegateInvokeParams(nctyp)
			delmtdnam = Helpers::StripDelMtdName(nctok::Params::get_Item(0)::Tokens::get_Item(0))
		else
			var lt = new C5.LinkedList<of IKVM.Reflection.Type>()
			foreach param in nctok::Params
				ASTEmit(ConvToAST(ConvToRPN(param)), emt)
				lt::Add(AsmFactory::Type02)
			end for
			typarr1 = lt::ToArray()
		end if

		if delcreate then
			typarr1 = new IKVM.Reflection.Type[] {ILEmitter::Univ::Import(gettype object), ILEmitter::Univ::Import(gettype IntPtr)}

			//delegate pointer loading section
			mnstrarr = ParseUtils::StringParser(delmtdnam::Value, ":")
			var mcrestrord as integer = 2
			i = -1
			len = mnstrarr[l] - 2

			if mnstrarr[0] = "me" then
				i++
				idtb1 = true
				mcrestrord = 3
			end if

			if mnstrarr[l] >= mcrestrord then
				AsmFactory::AddrFlg = true

				do until i = len
					i++
					
					if !idtb2 then
						if !idtb1 then
							mcvr = SymTable::FindVar(mnstrarr[i])
							if mcvr != null then
								if emt then
									AsmFactory::Type04 = mcvr::VarTyp
									Helpers::EmitLocLd(mcvr::Index, mcvr::LocArg)
								end if
								mcparenttyp = mcvr::VarTyp
								AsmFactory::Type02 = mcparenttyp
								idtb2 = true
								continue
							end if
						end if
						
						//local field check	
						mcfldinf = Helpers::GetLocFld(mnstrarr[i])
						if mcfldinf != null then
							idtisstatic = mcfldinf::get_IsStatic()
							
							if !idtisstatic and ILEmitter::StaticFlg then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is an instance field and cannot be used from a static method without an instance being provided.")
							end if
							
							if !idtisstatic then
								if emt then
									ILEmitter::EmitLdarg(0)
								end if
							end if
							if emt then
								AsmFactory::Type04 = mcfldinf::get_FieldType()
								Helpers::EmitFldLd(mcfldinf, idtisstatic)
							end if
							mcisstatic = false
							mcparenttyp = mcfldinf::get_FieldType()
							AsmFactory::Type02 = mcparenttyp
							idtb2 = true
							continue
						end if
						//----------------------------------
						
						mcparenttyp = Helpers::CommitEvalTTok(new TypeTok(mnstrarr[i]))
						mcisstatic = true
		
						if mcparenttyp = null then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Class '" + mnstrarr[i] + "' is not defined.")
						end if
					else
						if !mcparenttyp::Equals(AsmFactory::CurnTypB) then
							mcfldinf = Helpers::GetExtFld(mcparenttyp, mnstrarr[i])
							if mcfldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
							end if
							mcparenttyp = Loader::MemberTyp
						else
							mcfldinf = Helpers::GetLocFld(mnstrarr[i])
							if mcfldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
							end if
							mcparenttyp = mcfldinf::get_FieldType()
						end if
						
						if mcisstatic != mcfldinf::get_IsStatic() then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' defined for the class '" _
								+ mcfldinf::get_DeclaringType()::ToString() + #ternary {mcisstatic and !mcfldinf::get_IsStatic() ? "' is an instance field.", "' is static."})
						end if
						
						AsmFactory::Type02 = mcparenttyp
						AsmFactory::Type04 = mcparenttyp

						if emt then
							Helpers::EmitFldLd(mcfldinf, mcisstatic)
						end if
						if mcisstatic then
							mcisstatic = false
						end if
					end if
					idtb2 = true
				end if

				AsmFactory::AddrFlg = false
			end do

			i++
			//instance load for local methods of current instance
			if !idtb2 then
				if emt then
					mcmetinf = Helpers::GetLocMet(delmtdnam, delparamarr)
					mcisstatic = mcmetinf::get_IsStatic()
					
					if !mcisstatic and ILEmitter::StaticFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' is an instance method and cannot be called from a static method without an instance being provided.")
					end if
					
					if !mcisstatic then
						ILEmitter::EmitLdarg(0)
					end if
				end if
			end if
			//----------------------------------------------------------

			if idtb2 then
				if !mcparenttyp::Equals(AsmFactory::CurnTypB) then
					mcmetinf = Helpers::GetExtMet(mcparenttyp, delmtdnam, delparamarr)
					if mcmetinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
					end if			
				else
					mcmetinf = Helpers::GetLocMet(delmtdnam, delparamarr)
					if mcmetinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
					end if
					//mcisstatic = mcmetinf::get_IsStatic()
				end if
				if mcisstatic != mcmetinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' defined for the class '" _
							+ mcparenttyp::ToString() + #ternary {mcisstatic and !mcmetinf::get_IsStatic() ? "' is an instance method.", "' is static."})
				end if
			else
				mcmetinf = Helpers::GetLocMet(delmtdnam, delparamarr)
				if mcmetinf = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
				end if
				//AsmFactory::Type02 = mcmetinf::get_ReturnType()
				mcisstatic = mcmetinf::get_IsStatic()
			end if

			if emt then
				if mcisstatic then
					ILEmitter::EmitLdnull()
				else
					ILEmitter::EmitDup()
				end if
				Helpers::EmitPtrLd(mcmetinf,mcisstatic)
			end if

			//delegate pointer loading section
		end if

		ncctorinf = Helpers::GetLocCtor(nctyp, typarr1)

		if ncctorinf = null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Constructor with the given parameter types is not defined/accessible for the class '" + nctyp::ToString() + "'.")
		end if

		if emt then
			ILEmitter::EmitNewobj(ncctorinf)
			if nctok::PopFlg then
				ILEmitter::EmitPop()
			end if
		end if
		AsmFactory::Type02 = nctyp
		
		if nctok::MemberAccessFlg then
			AsmFactory::ChainFlg = true
			ASTEmit(nctok::MemberToAccess, emt)
		end if
	end method
	
	method public void ASTEmit(var tok as Token, var emt as boolean)
		Helpers::NullExprFlg = tok is NullLiteral
		var optok as Op = null
		var rc as Token = null
		var lc as Token = null
		var lctyp as IKVM.Reflection.Type = null
		var rctyp as IKVM.Reflection.Type = null

		if tok is Op then
			optok = $Op$tok
			var isflg as boolean = optok is IsOp
			var asflg as boolean = optok is AsOp
			
			rc = optok::RChild
			lc = optok::LChild
			ASTEmit(lc, emt)
			lctyp = AsmFactory::Type02
	
			if !#expr(isflg or asflg) then
				ASTEmit(rc, emt)
				rctyp = AsmFactory::Type02

				if emt then
					Helpers::StringFlg = lctyp::Equals(ILEmitter::Univ::Import(gettype string)) and lctyp::Equals(rctyp)
					Helpers::BoolFlg = lctyp::Equals(ILEmitter::Univ::Import(gettype boolean)) and lctyp::Equals(rctyp)
					if lctyp::Equals(rctyp) then
						Helpers::DelegateFlg = lctyp::IsSubclassOf(ILEmitter::Univ::Import(gettype Delegate))
					end if
				end if

				Helpers::OpCodeSuppFlg = #ternary{lctyp::Equals(rctyp) ? lctyp::get_IsPrimitive(), false}
				var typ2 = ILEmitter::Univ::Import(gettype ValueType)
				Helpers::EqSuppFlg = !#expr(typ2::IsAssignableFrom(lctyp) or typ2::IsAssignableFrom(rctyp)) or Helpers::OpCodeSuppFlg
				Helpers::EqSuppFlg = Helpers::EqSuppFlg or (lctyp::Equals(rctyp) and ILEmitter::Univ::Import(gettype Enum)::IsAssignableFrom(lctyp))
			end if

			AsmFactory::Type02 = #ternary {optok is ConditionalOp ? ILEmitter::Univ::Import(gettype boolean), lctyp}

			if isflg then
				if emt then
					var istyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(rc as TypeTok)
					if istyp = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Class '" + rc::Value + "' was not found.")
					else
						ILEmitter::EmitIs(istyp)
					end if
				end if
			elseif asflg then
				var astyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(rc as TypeTok)
				if astyp = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Class '" + rc::Value + "' was not found.")
				else
					if emt then
						ILEmitter::EmitIsinst(astyp)
					end if
				end if
				AsmFactory::Type02 = astyp
			else
				Helpers::LeftOp = lctyp
				Helpers::RightOp = rctyp
				Helpers::EmitOp(optok, !Helpers::CheckUnsigned(lctyp), emt)
			end if
				
			if emt then
				Helpers::StringFlg = false
				Helpers::OpCodeSuppFlg = false
				Helpers::EqSuppFlg = false
				Helpers::DelegateFlg = false
			end if
		else
			var typ2 as IKVM.Reflection.Type

			var mcmetinf as MethodInfo
			var mcisstatic as boolean = false

			if tok is StringLiteral then
				var slit as StringLiteral = $StringLiteral$tok
				AsmFactory::Type02 = Helpers::CommitEvalTTok(slit::LitTyp)
				
				if emt then
					Helpers::EmitLiteral(slit)
				end if

				if slit::MemberAccessFlg then
					AsmFactory::ChainFlg = true
					ASTEmit(slit::MemberToAccess, emt)
				end if

				ASTEmitUnary(slit, emt)
			elseif tok is Literal then
				var lit as Literal = $Literal$tok
				
				if emt then
					Helpers::EmitLiteral(lit)
				end if
				AsmFactory::Type02 = Helpers::CommitEvalTTok(lit::LitTyp)
				
				ASTEmitUnary(lit, emt)
			elseif tok is Ident then
				ASTEmitIdent($Ident$tok,emt)
			elseif tok is MethodCallTok then
				ASTEmitMethod($MethodCallTok$tok,emt)
			elseif tok is NewCallTok then
				ASTEmitNew($NewCallTok$tok,emt)
			elseif tok is GettypeCallTok then
				if emt then
					//gettype section
					var gtctok as GettypeCallTok = $GettypeCallTok$tok
					typ2 = Helpers::CommitEvalTTok(gtctok::Name)
					if typ2 = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + gtctok::Name::Value + "' is not defined.")
					end if
					ILEmitter::EmitLdtoken(typ2)
					ILEmitter::EmitCall(ILEmitter::Univ::Import(gettype Type)::GetMethod("GetTypeFromHandle", new IKVM.Reflection.Type[] {ILEmitter::Univ::Import(gettype RuntimeTypeHandle)}))
				end if
				AsmFactory::Type02 = ILEmitter::Univ::Import(gettype Type)
			elseif tok is MeTok then
				if emt then
					ILEmitter::EmitLdarg(0)
				end if
				AsmFactory::Type02 = AsmFactory::CurnTypB
				ASTEmitUnary($MeTok$tok, emt)
			elseif tok is NewarrCallTok then
				//array creation section
				var newactok as NewarrCallTok = $NewarrCallTok$tok
				typ2 = Helpers::CommitEvalTTok(newactok::ArrayType)
				ASTEmit(ConvToAST(ConvToRPN(newactok::ArrayLen)), emt)
				if !Helpers::IsPrimitiveIntegralType(AsmFactory::Type02) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Array Lengths should be of a Primitive Integer Type.")
				end if
				if emt then
					ILEmitter::EmitConvI()
					ILEmitter::EmitNewarr(typ2)
				end if
				AsmFactory::Type02 = typ2::MakeArrayType()
			elseif tok is ArrInitCallTok then
				//array initializer section
				var aictok as ArrInitCallTok = $ArrInitCallTok$tok
				typ2 = Helpers::CommitEvalTTok(aictok::ArrayType)
				if typ2 = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Class '" + aictok::ArrayType::ToString() + "' was not found.")
				end if
				
				var ci as CollectionItem = Helpers::ProcessCollection(typ2,aictok::ForceArray)
				
				if ci == null then
					if emt then
						ILEmitter::EmitLdcI4(aictok::Elements::get_Count())
						ILEmitter::EmitConvI()
						ILEmitter::EmitNewarr(typ2)
					end if
					
					var aii as integer = -1
					foreach elem in aictok::Elements
						aii++
						if emt then
							ILEmitter::EmitDup()
							ILEmitter::EmitLdcI4(aii)
							ILEmitter::EmitConvI()
						end if
						ASTEmit(ConvToAST(ConvToRPN(elem)), emt)
						Helpers::CheckAssignability(typ2,AsmFactory::Type02)
						if emt then
							ILEmitter::EmitStelem(typ2)
						end if	
					end for
					AsmFactory::Type02 = typ2::MakeArrayType()
				else
					if emt then
						ILEmitter::EmitNewobj(ci::Ctor)
					end if
					
					var aii as integer = -1
					foreach elem in aictok::Elements
						aii++
						if emt then
							ILEmitter::EmitDup()
						end if
						ASTEmit(ConvToAST(ConvToRPN(elem)), emt)
						Helpers::CheckAssignability(ci::ElemType,AsmFactory::Type02)
						if emt then
							ILEmitter::EmitCallvirt(ci::AddMtd)
						end if	
					end for
					AsmFactory::Type02 = typ2
				end if
			elseif tok is ObjInitCallTok then
				//object initializer section
				var oictok as ObjInitCallTok = $ObjInitCallTok$tok
				ASTEmitNew(oictok::Ctor,emt)
				var ctyp = AsmFactory::Type02
				foreach el2 in oictok::Elements
					if el2 != null then
						if el2 is AttrValuePair then
							var el as AttrValuePair = $AttrValuePair$el2
							if emt then
								ILEmitter::EmitDup()
							end if
							ASTEmit(ConvToAST(ConvToRPN(el::ValueExpr)), emt)
							var fldinf as FieldInfo = Helpers::GetExtFld(ctyp, el::Name::Value)
							if fldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + el::Name::Value + "' is not defined/accessible for the class '" + ctyp::ToString() + "'.")
							elseif fldinf::get_IsInitOnly() then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + el::Name::Value + "' is declared as readonly and may not be set from this context.")
							elseif fldinf::get_IsStatic() then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + el::Name::Value + "' is declared as static and may not be set from object initializers.")
							end if
							Helpers::CheckAssignability(fldinf::get_FieldType(), AsmFactory::Type02)
							if emt then	
								Helpers::EmitFldSt(fldinf, fldinf::get_IsStatic())
							end if
						elseif el2 is MethodCallTok then
							var el as MethodCallTok = $MethodCallTok$el2
							if Helpers::SetPopFlg(el) != null then
								if emt then
									ILEmitter::EmitDup()
								end if
								AsmFactory::Type02 = ctyp
								AsmFactory::ChainFlg = true
								ASTEmit(el, emt)
							end if
						end if
					end if
				end for
				AsmFactory::Type02 = ctyp
				if emt then
					if oictok::PopFlg then
						ILEmitter::EmitPop()
					end if
				end if
				if oictok::MemberAccessFlg then
					AsmFactory::ChainFlg = true
					ASTEmit(oictok::MemberToAccess, emt)
				end if
			elseif tok is TernaryCallTok then
				var tcc as TernaryCallTok = $TernaryCallTok$tok
				if emt then
					SymTable::AddIf()
				end if
				ASTEmit(ConvToAST(ConvToRPN(tcc::Condition)), emt)
				if !AsmFactory::Type02::Equals(ILEmitter::Univ::Import(gettype boolean)) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Ternary Expressions should evaluate to boolean.")
				end if
				if emt then
					ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
				end if
				ASTEmit(ConvToAST(ConvToRPN(tcc::TrueExpr)), emt)
				var ctyp = AsmFactory::Type02
				if emt then
					ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
					ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
					SymTable::SetIfElsePass()
				end if
				ASTEmit(ConvToAST(ConvToRPN(tcc::FalseExpr)), emt)
				AsmFactory::Type02 = Helpers::CheckCompat(ctyp, AsmFactory::Type02)
				if AsmFactory::Type02 == null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "True and False Cases for Ternary Expressions should evaluate to compatible types.")
				end if
				if emt then
					if !SymTable::ReadIfElsePass() then
						ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
					end if
					ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
					SymTable::PopIf()
				end if
			elseif tok is ExprCallTok then
				var ecc as ExprCallTok = $ExprCallTok$tok
				ASTEmit(ConvToAST(ConvToRPN(ecc::Exp)), emt)
				if ecc::MemberAccessFlg then
					AsmFactory::ChainFlg = true
					ASTEmit(ecc::MemberToAccess, emt)
				end if
				ASTEmitUnary(ecc, emt)
			elseif tok is PtrCallTok then
				//ptr load section - obsolete
				if emt then
					StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Using 'ptr' is considered an obsolete practice.")
					var ptrctok as PtrCallTok = $PtrCallTok$tok
					mcmetinf = Helpers::GetLocMetNoParams(ptrctok::MetToCall::Value)
					mcisstatic = mcmetinf::get_IsStatic()
					if !mcisstatic then
						ILEmitter::EmitLdarg(0)
					end if
					Helpers::EmitPtrLd(mcmetinf, mcisstatic)
				end if
				AsmFactory::Type02 = ILEmitter::Univ::Import(gettype IntPtr)
			end if

		end if
	end method

	method public void Evaluate(var exp as Expr)
		var asttok as Token = ConvToAST(ConvToRPN(exp))
		ASTEmit(asttok, false)
		ASTEmit(asttok, true)
	end method
	
	method public IKVM.Reflection.Type EvaluateType(var exp as Expr)
		ASTEmit(ConvToAST(ConvToRPN(exp)), false)
		return AsmFactory::Type02
	end method

	method public void StoreEmit(var tok as Token, var exp as Expr)

		var i as integer = -1
		var idt as Ident = $Ident$tok
		var idtnamarr as string[] = ParseUtils::StringParser(idt::Value, ":")
		var len as integer = idtnamarr[l] - 2
		var vr as VarItem = null
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var idtisstatic as boolean = false
		var idttyp as IKVM.Reflection.Type
		var fldinf as FieldInfo
		var restrord as integer = 2
		var isbyref as boolean = false
	
		if idtnamarr[0] = "me" then
			i++
			idtb1 = true
			restrord = 3
		end if
	
		//if AsmFactory::ChainFlg = true then
		//AsmFactory::ChainFlg = false
		//mcparenttyp = AsmFactory::Type02
		//idtb2 = true
		//idtisstatic = false
		//end if

		//determination of byref storage mode or not
		if (idtnamarr[l] == 1) and !idt::IsArr then
			SymTable::StoreFlg = true
			vr = SymTable::FindVar(idtnamarr[0])
			SymTable::StoreFlg = false
			if vr != null then
				ASTEmit(ConvToAST(ConvToRPN(exp)),false)
				isbyref = vr::VarTyp::get_IsByRef() and !AsmFactory::Type02::get_IsByRef()
			end if
		end if

		if idt::IsArr or isbyref then
			restrord = --restrord
			len = ++len
		end if

		vr = null
		if idtnamarr[l] >= restrord then
			AsmFactory::AddrFlg = true
	
			do until i = len
				i++
	
				if !idtb2 then
					if !idtb1 then
						vr = SymTable::FindVar(idtnamarr[i])
						if vr != null then
							AsmFactory::Type04 = vr::VarTyp
							if isbyref then
								AsmFactory::ForcedAddrFlg = true
							end if
							Helpers::EmitLocLd(vr::Index, vr::LocArg)
							if isbyref then
								AsmFactory::ForcedAddrFlg = false
							end if
							idttyp = vr::VarTyp
							if idttyp::get_IsByRef() and !isbyref then
								idttyp = idttyp::GetElementType()
							end if
							idtb2 = true
							continue
						end if
					end if

					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf != null then
						idtisstatic = fldinf::get_IsStatic()
						if !idtisstatic then
							ILEmitter::EmitLdarg(0)
						end if
						idttyp = fldinf::get_FieldType()
						AsmFactory::Type04 = idttyp
						Helpers::EmitFldLd(fldinf, idtisstatic)
						idtisstatic = false
						idtb2 = true
						continue
					end if

					idttyp = Helpers::CommitEvalTTok(new TypeTok(idtnamarr[i]))
					idtisstatic = true

					if idttyp = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Class '" + idtnamarr[i] + "' is not defined.")
					end if

				else
					if !idttyp::Equals(AsmFactory::CurnTypB) then
						fldinf = Helpers::GetExtFld(idttyp, idtnamarr[i])
						if fldinf = null then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + idttyp::ToString() + "'.")
						end if
						idttyp = Loader::MemberTyp
						AsmFactory::Type04 = idttyp
					else
						fldinf = Helpers::GetLocFld(idtnamarr[i])
						if fldinf = null then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
						end if
						idttyp = fldinf::get_FieldType()
						AsmFactory::Type04 = idttyp
					end if
					
					if idtisstatic != fldinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' defined for the class '" _
							+ fldinf::get_DeclaringType()::ToString() + #ternary {idtisstatic and !fldinf::get_IsStatic() ? "' is an instance field.", "' is static."})
					end if
					
					Helpers::EmitFldLd(fldinf, idtisstatic)
	
					if idtisstatic then
						idtisstatic = false
					end if
				end if
	
				idtb2 = true
			end do
			AsmFactory::AddrFlg = false
		end if

		//skip this ptr load for array and byref cases
		if !idt::IsArr and !isbyref then
			//this pointer load in case of instance local field store
			i++
			if !idtb2 then
				if !idtb1 then
					SymTable::StoreFlg = true
					vr = SymTable::FindVar(idtnamarr[i])
					SymTable::StoreFlg = false
					if vr = null then
						fldinf = Helpers::GetLocFld(idtnamarr[i])
						if fldinf != null then
							idtisstatic = fldinf::get_IsStatic()
							if !idtisstatic then
								ILEmitter::EmitLdarg(0)
							end if
						end if
					end if
				else
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf != null then
						idtisstatic = fldinf::get_IsStatic()
						if !idtisstatic then
							ILEmitter::EmitLdarg(0)
						end if
					end if
				end if
			end if
		end if

		//in case of array store, load index
		//-------------------------------------------
		if idt::IsArr then
			Evaluate(idt::ArrLoc)
			
			if !Helpers::IsPrimitiveIntegralType(AsmFactory::Type02) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Array Indices should be of a Primitive Integer Type.")
			end if
			
			ILEmitter::EmitConvI()
		end if
		//--------------------------------------------
		
		//--------------------------------------------------------------
		//loading of value to store
		Evaluate(exp)
		//--------------------------------------------------------------
		
		var outt as IKVM.Reflection.Type = AsmFactory::Type02
		
		if idt::IsArr then
			if !idttyp::get_IsArray() then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + idttyp::ToString() + "' is not an Array Type.")
			end if
			idttyp = idttyp::GetElementType()
			Helpers::CheckAssignability(idttyp, outt)
			ILEmitter::EmitStelem(idttyp)
		elseif isbyref then
			idttyp = idttyp::GetElementType()
			Helpers::CheckAssignability(idttyp, outt)
			ILEmitter::EmitStind(idttyp)
		else
			if !idtb2 then
				vr = null
				if !idtb1 then
					SymTable::StoreFlg = true
					vr = SymTable::FindVar(idtnamarr[i])
					SymTable::StoreFlg = false
					if vr != null then
						Helpers::CheckAssignability(vr::VarTyp, outt)
						Helpers::EmitLocSt(vr::Index, vr::LocArg)
						vr::Stored = true
						vr::StoreLines::Add(ILEmitter::LineNr)
					end if
				end if
				if vr = null then
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf != null then
						if fldinf::get_IsInitOnly() and !AsmFactory::InCtorFlg then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is declared as readonly and may only be set from constructors.")
						end if
						if fldinf::get_IsLiteral() then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is declared as a constant and may not be set again.")
						end if
						idtisstatic = fldinf::get_IsStatic()
						
						if !idtisstatic and ILEmitter::StaticFlg then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is an instance field and cannot be used from a static method without an instance being provided.")
						end if
						
						Helpers::CheckAssignability(fldinf::get_FieldType(), outt)
						Helpers::EmitFldSt(fldinf, idtisstatic)
					else
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Field '" + idtnamarr[i] + "' is not defined for the current class/method.")
					end if
				end if
			else
				if !idttyp::Equals(AsmFactory::CurnTypB) then
					fldinf = Helpers::GetExtFld(idttyp, idtnamarr[i])
					if fldinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + idttyp::ToString() + "'.")
					end if
				else
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
					end if
				end if
				if fldinf::get_IsInitOnly() then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is declared as readonly and may not be set from this context.")
				elseif idtisstatic != fldinf::get_IsStatic() then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' defined for the class '" _
						+ idttyp::ToString() + #ternary {idtisstatic and !fldinf::get_IsStatic() ? "' is an instance field.", "' is static."})
				end if
				Helpers::CheckAssignability(fldinf::get_FieldType(), outt)
				Helpers::EmitFldSt(fldinf, idtisstatic)
			end if
		end if
	end method
	
	method public boolean EvaluateHIf(var rt as Token)
		if rt is Op then
			var o as Op = $Op$rt
			if o is EqOp then
				return EvaluateHIf(o::LChild) == EvaluateHIf(o::RChild)
			elseif o is NeqOp then
				return EvaluateHIf(o::LChild) != EvaluateHIf(o::RChild)
			elseif o is OrOp then
				return EvaluateHIf(o::LChild) or EvaluateHIf(o::RChild)
			elseif o is AndOp then
				return EvaluateHIf(o::LChild) and EvaluateHIf(o::RChild)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The operator '" + o::ToString() + "' is not supported when using #if and #elseif.")
			end if
		elseif rt is Ident then
			var b = SymTable::EvalDef(rt::Value)
			return #ternary{#expr($Ident$rt)::get_DoNeg() ? !b, b}
		elseif rt is BooleanLiteral then
			var bl as BooleanLiteral = $BooleanLiteral$rt
			return #ternary{bl::get_DoNeg() ? !bl::BoolVal, bl::BoolVal}
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Tokens of type '" + rt::GetType()::ToString() + "' are not supported when using #if and #elseif.")
		end if
		return false
	end method
	
	method public boolean EvaluateHIf(var exp as Expr)
		return EvaluateHIf(ConvToAST(ConvToRPN(exp)))
	end method

end class
