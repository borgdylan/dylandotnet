//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

delegate public auto ansi void ASTEmitDelegate(var t as Token, var emt as boolean)

class public auto ansi beforefieldinit Evaluator

	field public OpStack Stack
	field public Token InstToken

	method public void Evaluator()
		me::ctor()
		Stack = null
		InstToken = new Token()
	end method

	method public integer RetPrec(var tok as Token)
		
		var t as Type[] = new Type[3]
		t[0] = gettype Op
		t[1] = gettype LParen
		t[2] = gettype RParen
		
		if t[0]::IsInstanceOfType(tok) then
			var optok as Op = $Op$tok
			return optok::PrecNo
		elseif t[1]::IsInstanceOfType(tok) then
			return -1		
		elseif t[2]::IsInstanceOfType(tok) then
			return 0
		else
			return 0		
		end if

	end method

	method public boolean isLParen(var tok as Token)
		var typ as Type = gettype LParen
		return typ::IsInstanceOfType(tok)
	end method
	
	method public boolean isRParen(var tok as Token)
		var typ as Type = gettype RParen
		return typ::IsInstanceOfType(tok)
	end method

	method public boolean isOp(var tok as Token)
		var typ as Type = gettype Op
		return typ::IsInstanceOfType(tok)
	end method

	method public Expr ConvToRPN(var exp as Expr)
		
		if (exp::Tokens[l] = 0) or (exp::Tokens[l] = 1) then
			return exp
		end if
		
		Stack = new OpStack()
		var exp2 as Expr = new Expr()
		var i as integer = -1
		var tok as Token = null
		
		exp2::Line = exp::Line

		do until i = (exp::Tokens[l] - 1)

			i = i + 1
			tok = exp::Tokens[i]

			if (isOp(tok) or isLParen(tok) or isRParen(tok)) = false then
				exp2::AddToken(tok)
			elseif isOp(tok) then
				if Stack::getLength() != 0 then
					if RetPrec(tok) <= RetPrec(Stack::TopOp()) then
						exp2::AddToken(Stack::TopOp())
						Stack::PopOp()
					end if
				end if
				Stack::PushOp(tok)
			elseif isLParen(tok) then
				Stack::PushOp(tok)
			elseif isRParen(tok) then
				if Stack::getLength() != 0 then
					if isLParen(Stack::TopOp()) = false then
						exp2::AddToken(Stack::TopOp())
						Stack::PopOp()
						if Stack::getLength() != 0 then
							if isLParen(Stack::TopOp()) then
								Stack::PopOp()
							end if
						end if
					end if
				else
					if isLParen(Stack::TopOp()) then
						Stack::PopOp()
					end if
				end if
			end if
		end do

		if Stack::getLength() = 0 then
			return exp2
		end if

		do
			if isLParen(Stack::TopOp()) = false then
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

		if exp::Tokens[l] = 1 then
			return exp::Tokens[0]
		elseif exp::Tokens[l] = 0 then
			return null
		end if
		var len as integer = exp::Tokens[l] - 1
		do until i = len
			i = i + 1
			tok = exp::Tokens[i]
			if isOp(tok) then
				if i >= 2 then
					optok = $Op$tok
					j = i - 1
					tok2 = exp::Tokens[j]
					exp::RemToken(j)
					len = len - 1
					j = j - 1
					tok = exp::Tokens[j]
					exp::RemToken(j)
					len =  len - 1
					optok::LChild = tok
					optok::RChild = tok2
					exp::Tokens[j] = optok
					i = j
				end if
			end if
			if i = len then
				tokf =  exp::Tokens[0]
			end if
		end do
		
		return tokf

	end method

	method public void ASTEmitIdent(var idt as Ident, var emt as boolean, var aed as ASTEmitDelegate)
	
		var i as integer = -1
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var vr as VarItem
		var idtfldinf as FieldInfo
		var idtisstatic as boolean = false
		var typ as Type
		var src1 as Type
		var snk1 as Type
		var idtnamarr as string[] = ParseUtils::StringParser(idt::Value, ":")
		var pushaddr as boolean = idt::IsRef and idt::MemberAccessFlg

		if pushaddr then
			idt::IsRef = false
		end if
		if idtnamarr[0] = "me" then
			i = i + 1
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
			if pushaddr = false then
				idt::IsRef = true
			end if
		end if

		do until i = (idtnamarr[l] - 1)
			i = i + 1
			AsmFactory::AddrFlg = (i != (idtnamarr[l] - 1))
			AsmFactory::ForcedAddrFlg = (i == (idtnamarr[l] - 1)) and idt::IsRef and (idt::IsArr == false)
			
			if idtb2 = false then
				if idtb1 = false then
					vr = SymTable::FindVar(idtnamarr[i])
					if vr != null then
						if emt then
							AsmFactory::Type04 = vr::VarTyp
							Helpers::EmitLocLd(vr::Index, vr::LocArg)
						end if
						typ = vr::VarTyp
						if AsmFactory::ForcedAddrFlg and (typ::get_IsByRef() == false) then
							typ = typ::MakeByRefType()
						elseif (AsmFactory::ForcedAddrFlg == false) and typ::get_IsByRef() then
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
					if idtisstatic = false then
						if emt then
							ILEmitter::EmitLdarg(0)
						end if
					end if
					if emt then
						AsmFactory::Type04 = idtfldinf::get_FieldType()
						Helpers::EmitFldLd(idtfldinf, idtisstatic)
					end if
					typ = idtfldinf::get_FieldType()
					if AsmFactory::ForcedAddrFlg then
						typ = typ::MakeByRefType()
					end if
					AsmFactory::Type02 = typ
					idtb2 = true
					continue
				end if
				//----------------------
				
				typ = Loader::LoadClass(idtnamarr[i])
				idtisstatic = true

				if typ = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Class '" + idtnamarr[i] + "' is not defined.")
				end if
				
			else
				if typ::Equals(AsmFactory::CurnTypB) = false then
					idtfldinf = Loader::LoadField(typ, idtnamarr[i])
					if idtfldinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + typ::ToString() + "'.")
					end if
					typ = Loader::MemberTyp
					if AsmFactory::ForcedAddrFlg then
						typ = typ::MakeByRefType()
					end if
					AsmFactory::Type02 = typ
					if emt then
						if Loader::FldLitFlag = false then
							AsmFactory::Type04 = Loader::MemberTyp
							Helpers::EmitFldLd(idtfldinf, idtisstatic)
						else
							var constlit as ConstLiteral = new ConstLiteral()
							constlit::ConstVal = Loader::FldLitVal
							constlit::ExtTyp = Loader::FldLitTyp
							if Loader::EnumLitFlag then
								constlit::IntTyp = Loader::EnumLitTyp
							else
								constlit::IntTyp = Loader::FldLitTyp
							end if
							Helpers::EmitLiteral(Helpers::ProcessConst(constlit))
							typ = Loader::FldLitTyp
							AsmFactory::Type02 = typ
						end if
					end if
				else
					idtfldinf = Helpers::GetLocFld(idtnamarr[i])
					if idtfldinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + idtnamarr[i] + "' is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
					end if
					if emt then
						AsmFactory::Type04 = idtfldinf::get_FieldType()
						Helpers::EmitFldLd(idtfldinf, idtisstatic)
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

		//array handling code
		//-----------------------------------------
		if idt::IsArr then
			if Helpers::CheckIfArrLen(idt::ArrLoc) then
				if emt then
					ILEmitter::EmitLdlen()
					ILEmitter::EmitConvI4()
				end if
				AsmFactory::Type02 = gettype integer
			else
				typ = AsmFactory::Type02
				aed::Invoke(ConvToAST(ConvToRPN(idt::ArrLoc)), emt)
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
		//-----------------------------------------

		if idt::MemberAccessFlg then
			AsmFactory::ChainFlg = true
			AsmFactory::RefChainFlg = pushaddr
			aed::Invoke(idt::MemberToAccess, emt)
		end if

		if idt::Conv then
			if emt then
				src1 = AsmFactory::Type02
			end if
			AsmFactory::Type02 = Helpers::CommitEvalTTok(idt::TTok)
			if emt then
				snk1 = AsmFactory::Type02
				Helpers::EmitConv(src1, snk1)
			end if
		end if
	end method
	
	method public void ASTEmitMethod(var mctok as MethodCallTok, var emt as boolean, var aed as ASTEmitDelegate)
		var mcparenttyp as Type
		var mnstrarr as string[]
		var mcmetinf as MethodInfo
		var mntok as MethodNameTok = mctok::Name
		var typarr1 as Type[] = new Type[0]
		var typarr2 as Type[]
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
		var src1 as Type
		var snk1 as Type
		var pushaddr as boolean = mntok::IsRef and mntok::MemberAccessFlg

		mnstrarr = ParseUtils::StringParser(mntok::Value, ":")
		mcparenttyp = AsmFactory::CurnTypB
		mcmetinf = null
		mcfldinf = null
		mectorflg = mntok::Value == "me::ctor"

		i = -1
		mnstrarr = ParseUtils::StringParser(mntok::Value, ":")
		var len as integer = mnstrarr[l] - 2

		if pushaddr then
			mntok::IsRef = false
		end if
		if mnstrarr[0] = "me" then
			i = i + 1
			idtb1 = true
			mcrestrord = 3
		end if

		if mectorflg = false then
			if AsmFactory::ChainFlg then
				AsmFactory::ChainFlg = false
				mcparenttyp = AsmFactory::Type02
				idtb2 = true
				mcisstatic = false
			end if
			if AsmFactory::RefChainFlg then
				AsmFactory::RefChainFlg = false
				pushaddr = mntok::MemberAccessFlg
				if pushaddr = false then
					mntok::IsRef = true
				end if
			end if

			if mnstrarr[l] >= mcrestrord then
				AsmFactory::AddrFlg = true

				do until i = len
					i = i + 1

					if idtb2 = false then
						if idtb1 = false then
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
							if idtisstatic = false then
								if emt then
									ILEmitter::EmitLdarg(0)
								end if
							end if
							if emt then
								AsmFactory::Type04 = mcfldinf::get_FieldType()
								Helpers::EmitFldLd(mcfldinf, idtisstatic)
							end if
							mcparenttyp = mcfldinf::get_FieldType()
							AsmFactory::Type02 = mcparenttyp
							idtb2 = true
							continue
						end if
						//----------------------------------
				
						mcparenttyp = Loader::LoadClass(mnstrarr[i])
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
							mcfldinf = Loader::LoadField(mcparenttyp, mnstrarr[i])
							if mcfldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
							end if
							mcparenttyp = Loader::MemberTyp
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

		i = i + 1
		//instance load for local methods of current isntance

		if mectorflg = false then
			if idtb2 = false then
				if emt then
					mcmetinf = Helpers::GetLocMet(mnstrarr[i], mctok::TypArr)
					mcisstatic = mcmetinf::get_IsStatic()
					if mcisstatic = false then
						ILEmitter::EmitLdarg(0)
					end if
				end if
			end if
		end if
				
		j = i
		AsmFactory::Type03 = AsmFactory::Type02

		i = -1
		typarr1 = new Type[0]

		if mctok::Params[l] = 0 then
			typarr1 = Type::EmptyTypes
		end if

		do until i = (mctok::Params[l] - 1)
			i = i + 1
			aed::Invoke(ConvToAST(ConvToRPN(mctok::Params[i])), emt)
			typarr2 = AsmFactory::TypArr
			AsmFactory::TypArr = typarr1
			AsmFactory::AddTyp(AsmFactory::Type02)
			typarr1 = AsmFactory::TypArr
			AsmFactory::TypArr = typarr2
		end do

		if emt = false then
			mctok::TypArr = typarr1
		end if

		AsmFactory::Type02 = AsmFactory::Type03
		i = j
		AsmFactory::Type05 = mcparenttyp

		if mectorflg = false then
			if idtb2 and (mcparenttyp::Equals(AsmFactory::CurnTypB) = false) then
				mcmetinf = Helpers::GetExtMet(mcparenttyp, mntok, typarr1)
				if mcmetinf = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
				end if
				AsmFactory::Type02 = Loader::MemberTyp
			else
				mcmetinf = Helpers::GetLocMet(mnstrarr[i], typarr1)
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

			if mctok::PopFlg = false then
				//array handling code
				//-----------------------------------------
				if mntok::IsArr = true then
					if Helpers::CheckIfArrLen(mntok::ArrLoc) then
						if emt then
							ILEmitter::EmitLdlen()
							ILEmitter::EmitConvI4()
						end if
						AsmFactory::Type02 = gettype integer
					else
						mcparenttyp = AsmFactory::Type02
						aed::Invoke(ConvToAST(ConvToRPN(mntok::ArrLoc)), emt)
						mcparenttyp = mcparenttyp::GetElementType()
						if mntok::IsRef then
							AsmFactory::ForcedAddrFlg = true
						end if
						if emt then
							ILEmitter::EmitConvI()
							if mntok::MemberAccessFlg then
								AsmFactory::AddrFlg = true
								AsmFactory::Type04 = mcparenttyp
							end if
							Helpers::EmitElemLd(mcparenttyp)
						end if
						if AsmFactory::ForcedAddrFlg then
							mcparenttyp = mcparenttyp::MakeByRefType()
						end if
						AsmFactory::Type02 = mcparenttyp
						AsmFactory::AddrFlg = false
						AsmFactory::ForcedAddrFlg = false
					end if
				end if
				//-----------------------------------------
			end if

			if mntok::MemberAccessFlg then
				AsmFactory::ChainFlg = true
				AsmFactory::RefChainFlg = pushaddr
				aed::Invoke(mntok::MemberToAccess, emt)
			end if
		else
			mcparenttyp = AsmFactory::CurnInhTyp
			Loader::ProtectedFlag = true
			ncctorinf = Loader::LoadCtor(mcparenttyp, typarr1)
			Loader::ProtectedFlag = false

			if ncctorinf = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Base Class Constructor with the given parameter types is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
			end if

			if emt then
				ILEmitter::EmitCallCtor(ncctorinf)
			end if
		end if

		if mntok::Conv then
			if emt then
				src1 = AsmFactory::Type02
			end if
			AsmFactory::Type02 = Helpers::CommitEvalTTok(mntok::TTok)
			if emt then
				snk1 = AsmFactory::Type02
				Helpers::EmitConv(src1, snk1)
			end if
		end if
	end method

	method public void ASTEmitNew(var nctok as NewCallTok, var emt as boolean, var aed as ASTEmitDelegate)
		//constructor call section
		var delparamarr as Type[]
		var delmtdnam as string
		var nctyp as Type = Helpers::CommitEvalTTok(nctok::Name)
		var mcparams as Expr[] = nctok::Params
		var delcreate as boolean = false
		var typarr1 as Type[] = new Type[0]
		var typarr2 as Type[]
		var ncctorinf as ConstructorInfo
		var i as integer = -1
		var mnstrarr as string[]
		var len as integer
		var mcparenttyp as Type = null
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

		if nctyp::IsSubclassOf(gettype MulticastDelegate) then
			delcreate = true
			delparamarr = Loader::GetDelegateInvokeParams(nctyp)
			delmtdnam = Helpers::StripDelMtdName(nctok::Params[0]::Tokens[0])
		else
			if nctok::Params[l] = 0 then
				typarr1 = Type::EmptyTypes
			else
				typarr1 = new Type[0]
			end if

			do until i = (nctok::Params[l] - 1)
				i = i + 1
				aed::Invoke(ConvToAST(ConvToRPN(mcparams[i])), emt)
				typarr2 = AsmFactory::TypArr
				AsmFactory::TypArr = typarr1
				AsmFactory::AddTyp(AsmFactory::Type02)
				typarr1 = AsmFactory::TypArr
				AsmFactory::TypArr = typarr2
			end do
		end if

		if delcreate then
			typarr1 = new Type[2]
			typarr1[0] = gettype object
			typarr1[1] = gettype IntPtr

			//delegate pointer loading section
			mnstrarr = ParseUtils::StringParser(delmtdnam, ":")
			var mcrestrord as integer = 2
			i = -1
			len = mnstrarr[l] - 2

			if mnstrarr[0] = "me" then
				i = i + 1
				idtb1 = true
				mcrestrord = 3
			end if

			if mnstrarr[l] >= mcrestrord then
				AsmFactory::AddrFlg = true

				do until i = len
					i = i + 1
					if idtb2 = false then
						if idtb1 = false then
							mcvr = SymTable::FindVar(mnstrarr[i])
							if mcvr <> null then
								if emt then
									AsmFactory::Type04 = mcvr::VarTyp
									Helpers::EmitLocLd(mcvr::Index, mcvr::LocArg)
								end if
								mcparenttyp = mcvr::VarTyp
								AsmFactory::Type02 = mcparenttyp
								idtb2 = true
								continue
							else
								mcfldinf = Helpers::GetLocFld(mnstrarr[i])
								if mcfldinf <> null then
									idtisstatic = mcfldinf::get_IsStatic()
									if idtisstatic = false then
										if emt then
											ILEmitter::EmitLdarg(0)
										end if
									end if
									if emt then
										AsmFactory::Type04 = mcfldinf::get_FieldType()
										Helpers::EmitFldLd(mcfldinf, idtisstatic)
									end if
									mcparenttyp = mcfldinf::get_FieldType()
									AsmFactory::Type02 = mcparenttyp
									idtb2 = true
									continue
								end if
							end if
						else
							mcfldinf = Helpers::GetLocFld(mnstrarr[i])
							if mcfldinf <> null then
								idtisstatic = mcfldinf::get_IsStatic()
								if idtisstatic = false then
									if emt then
										ILEmitter::EmitLdarg(0)
									end if
								end if
								if emt then
									AsmFactory::Type04 = mcfldinf::get_FieldType()
									Helpers::EmitFldLd(mcfldinf, idtisstatic)
								end if
								AsmFactory::Type02 = mcfldinf::get_FieldType()
								mcparenttyp = mcfldinf::get_FieldType()
								idtb2 = true
								continue
							end if
						end if
						mcparenttyp = Loader::LoadClass(mnstrarr[i])
						mcisstatic = true

						if mcparenttyp = null then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Class '" + mnstrarr[i] + "' is not defined.")
						end if
					else
						if mcparenttyp::Equals(AsmFactory::CurnTypB) = false then
							mcfldinf = Loader::LoadField(mcparenttyp, mnstrarr[i])
							if mcfldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
							end if
							mcparenttyp = Loader::MemberTyp
							AsmFactory::Type02 = mcparenttyp
							AsmFactory::Type04 = mcparenttyp
						else
							mcfldinf = Helpers::GetLocFld(mnstrarr[i])
							if mcfldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + mnstrarr[i] + "' is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
							end if
							mcparenttyp = mcfldinf::get_FieldType()
							AsmFactory::Type02 = mcparenttyp
							AsmFactory::Type04 = mcparenttyp
						end if

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

			i = i + 1
			//instance load for local methods of current isntance
			if idtb2 = false then
				if emt then
					mcmetinf = Helpers::GetLocMet(mnstrarr[i], delparamarr)
					mcisstatic = mcmetinf::get_IsStatic()
					if mcisstatic = false then
						ILEmitter::EmitLdarg(0)
					end if
				end if
			end if
			//----------------------------------------------------------

			if idtb2 then
				if mcparenttyp::Equals(AsmFactory::CurnTypB) = false then
					mcmetinf = Loader::LoadMethod(mcparenttyp, mnstrarr[i], delparamarr)
					if mcmetinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + mcparenttyp::ToString() + "'.")
					end if
				else
					mcmetinf = Helpers::GetLocMet(mnstrarr[i], delparamarr)
					if mcmetinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
					end if
					mcisstatic = mcmetinf::get_IsStatic()
				end if
			else
				mcmetinf = Helpers::GetLocMet(mnstrarr[i], delparamarr)
				if mcmetinf = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + mnstrarr[i] + "' with the given parameter types is not defined/accessible for the class '" + AsmFactory::CurnTypB::ToString() + "'.")
				end if
				//AsmFactory::Type02 = mcmetinf::get_ReturnType()
				mcisstatic = mcmetinf::get_IsStatic()
			end if

			if emt then
				if mcisstatic  then
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

		if emt  then
			ILEmitter::EmitNewobj(ncctorinf)
		end if

		AsmFactory::Type02 = nctyp
	end method
	
	method public void ASTEmit(var tok as Token, var emt as boolean)c

		var optok as Op = new Op()
		var rc as Token = new Token()
		var lc as Token = new Token()
		var lctyp as Type = null
		var rctyp as Type = null
		var typ as Type

		if isOp(tok) then
			optok = $Op$tok
			rc = optok::RChild
			lc = optok::LChild
			ASTEmit(lc, emt)
			lctyp = AsmFactory::Type02
			ASTEmit(rc, emt)
			rctyp = AsmFactory::Type02

			if emt then
				typ = gettype string
				Helpers::StringFlg = lctyp::Equals(typ) and lctyp::Equals(rctyp)
			end if

			if emt then
				typ = gettype Delegate
				if lctyp::Equals(rctyp) then
					Helpers::DelegateFlg = lctyp::IsSubclassOf(typ)
				end if
			end if

			if lctyp::Equals(rctyp) then
				Helpers::OpCodeSuppFlg = lctyp::get_IsPrimitive()
			else
				Helpers::OpCodeSuppFlg = false
			end if

			typ = gettype ValueType
			Helpers::EqSuppFlg = ((typ::IsAssignableFrom(lctyp) or typ::IsAssignableFrom(rctyp)) == false) or Helpers::OpCodeSuppFlg
			typ = gettype Enum
			Helpers::EqSuppFlg = Helpers::EqSuppFlg or (lctyp::Equals(rctyp) and typ::IsAssignableFrom(lctyp))

			typ = gettype ConditionalOp
			if typ::IsInstanceOfType($object$optok) then
				AsmFactory::Type02 = gettype boolean
			else
				AsmFactory::Type02 = lctyp
			end if

			if emt then
				Helpers::LeftOp = lctyp
				Helpers::RightOp = rctyp
				Helpers::EmitOp(optok, Helpers::CheckUnsigned(lctyp) == false)
				Helpers::StringFlg = false
				Helpers::OpCodeSuppFlg = false
				Helpers::EqSuppFlg = false
				Helpers::DelegateFlg = false
			end if
		else
			var src1 as Type
			var snk1 as Type

			var mcmetinf as MethodInfo
			var typarr1 as Type[] = new Type[0]
			var typarr2 as Type[]
			var mcisstatic as boolean = false
			var td as Type[] = new Type[10]
			td[0] = gettype StringLiteral
			td[1] = gettype Literal
			td[2] = gettype Ident
			td[3] = gettype MethodCallTok
			td[4] = gettype NewCallTok
			td[5] = gettype GettypeCallTok
			td[6] = gettype MeTok
			td[7] = gettype NewarrCallTok
			td[8] = gettype PtrCallTok

			if td[0]::IsInstanceOfType(tok) then
				var slit as StringLiteral = $StringLiteral$tok
				AsmFactory::Type02 = Helpers::CommitEvalTTok(slit::LitTyp)
				
				if emt then
					Helpers::EmitLiteral(slit)
				end if

				if slit::MemberAccessFlg then
					AsmFactory::ChainFlg = true
					ASTEmit(slit::MemberToAccess, emt)
				end if

				if slit::Conv then
					if emt then
						src1 = AsmFactory::Type02
					end if
					AsmFactory::Type02 = Helpers::CommitEvalTTok(slit::TTok)
					if emt then
						snk1 = AsmFactory::Type02
						Helpers::EmitConv(src1, snk1)
					end if
				end if
			elseif td[1]::IsInstanceOfType(tok) then
				var lit as Literal = $Literal$tok
				
				if emt then
					Helpers::EmitLiteral(lit)
				end if
				AsmFactory::Type02 = Helpers::CommitEvalTTok(lit::LitTyp)
				
				if lit::Conv then
					if emt then
						src1 = AsmFactory::Type02
					end if
					AsmFactory::Type02 = Helpers::CommitEvalTTok(lit::TTok)
					if emt then
						snk1 = AsmFactory::Type02
						Helpers::EmitConv(src1, snk1)
					end if
				end if
			elseif td[2]::IsInstanceOfType(tok) then
				ASTEmitIdent($Ident$tok,emt,new ASTEmitDelegate(ASTEmit()))
			elseif td[3]::IsInstanceOfType(tok) then
				ASTEmitMethod($MethodCallTok$tok,emt,new ASTEmitDelegate(ASTEmit()))
			elseif td[4]::IsInstanceOfType(tok) then
				ASTEmitNew($NewCallTok$tok,emt,new ASTEmitDelegate(ASTEmit()))
			elseif td[5]::IsInstanceOfType(tok) then
				if emt then
					//gettype section
					var gtctok as GettypeCallTok = $GettypeCallTok$tok
					typ = Helpers::CommitEvalTTok(gtctok::Name)
					if typ = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + gtctok::Name::Value + "' is not defined.")
					end if
					ILEmitter::EmitLdtoken(typ)
					typarr1 = new Type[0]
					typarr2 = AsmFactory::TypArr
					AsmFactory::TypArr = typarr1
					typ = gettype RuntimeTypeHandle
					AsmFactory::AddTyp(typ)
					typarr1 = AsmFactory::TypArr
					AsmFactory::TypArr = typarr2
					typ = gettype Type
					ILEmitter::EmitCall(typ::GetMethod("GetTypeFromHandle", typarr1))
				end if
				AsmFactory::Type02 = gettype Type
			elseif td[6]::IsInstanceOfType(tok) then
				var metk1 as MeTok = $MeTok$tok

				if emt then
					ILEmitter::EmitLdarg(0)
				end if

				AsmFactory::Type02 = AsmFactory::CurnTypB

				if metk1::Conv then
					if emt then
						src1 = AsmFactory::Type02
					end if
					AsmFactory::Type02 = Helpers::CommitEvalTTok(metk1::TTok)
					if emt then
						snk1 = AsmFactory::Type02
						Helpers::EmitConv(src1, snk1)
					end if
				end if
			elseif td[7]::IsInstanceOfType(tok) then
				//array creation section
				var newactok as NewarrCallTok = $NewarrCallTok$tok
				typ = Helpers::CommitEvalTTok(newactok::ArrayType)
				ASTEmit(ConvToAST(ConvToRPN(newactok::ArrayLen)), emt)
				if emt then
					ILEmitter::EmitConvI()
					ILEmitter::EmitNewarr(typ)
				end if
				AsmFactory::Type02 = typ::MakeArrayType()
			elseif td[8]::IsInstanceOfType(tok) then
				//ptr load section - obsolete
				if emt then
					var ptrctok as PtrCallTok = $PtrCallTok$tok
					mcmetinf = Helpers::GetLocMetNoParams(ptrctok::MetToCall::Value)
					mcisstatic = mcmetinf::get_IsStatic()
					if mcisstatic = false then
						ILEmitter::EmitLdarg(0)
					end if
					Helpers::EmitPtrLd(mcmetinf, mcisstatic)
				end if
				AsmFactory::Type02 = gettype IntPtr
			end if

		end if
	end method

	method public void Evaluate(var exp as Expr)
		var asttok as Token = ConvToAST(ConvToRPN(exp))
		ASTEmit(asttok, false)
		ASTEmit(asttok, true)
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
		var idttyp as Type
		var fldinf as FieldInfo
		var restrord as integer = 2
		var isbyref as boolean = false
	
		if idtnamarr[0] = "me" then
			i = i + 1
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
		if (idtnamarr[l] = 1) and (idt::IsArr = false) then
			SymTable::StoreFlg = true
			vr = SymTable::FindVar(idtnamarr[0])
			SymTable::StoreFlg = false
			if vr != null then
				ASTEmit(ConvToAST(ConvToRPN(exp)),false)
				isbyref = vr::VarTyp::get_IsByRef() and (AsmFactory::Type02::get_IsByRef() == false)
			end if
		end if

		if idt::IsArr or isbyref then
			restrord = restrord - 1
			len = len + 1
		end if

		vr = null
		if idtnamarr[l] >= restrord then
			AsmFactory::AddrFlg = true
	
			do until i = len
				i = i + 1
	
				if idtb2 = false then
					if idtb1 = false then
						vr = SymTable::FindVar(idtnamarr[i])
						if vr <> null then
							AsmFactory::Type04 = vr::VarTyp
							if isbyref then
								AsmFactory::ForcedAddrFlg = true
							end if
							Helpers::EmitLocLd(vr::Index, vr::LocArg)
							if isbyref then
								AsmFactory::ForcedAddrFlg = false
							end if
							idttyp = vr::VarTyp
							if idttyp::get_IsByRef() and (isbyref = false) then
								idttyp = idttyp::GetElementType()
							end if
							idtb2 = true
							continue
						end if
					end if

					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf <> null then
						idtisstatic = fldinf::get_IsStatic()
						if idtisstatic = false then
							ILEmitter::EmitLdarg(0)
						end if
						idttyp = fldinf::get_FieldType()
						AsmFactory::Type04 = idttyp
						Helpers::EmitFldLd(fldinf, idtisstatic)
						idtb2 = true
						continue
					end if

					idttyp = Loader::LoadClass(idtnamarr[i])
					idtisstatic = true

					if idttyp = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable or Class '" + idtnamarr[i] + "' is not defined.")
					end if

				else
					if idttyp::Equals(AsmFactory::CurnTypB) = false then
						fldinf = Loader::LoadField(idttyp, idtnamarr[i])
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
		if (idt::IsArr = false) and (isbyref = false) then
			//this pointer load in case of instance local field store
			i = i + 1
			if idtb2 = false then
				if idtb1 = false then
					SymTable::StoreFlg = true
					vr = SymTable::FindVar(idtnamarr[i])
					SymTable::StoreFlg = false
					if vr = null then
						fldinf = Helpers::GetLocFld(idtnamarr[i])
						if fldinf <> null then
							idtisstatic = fldinf::get_IsStatic()
							if idtisstatic = false then
								ILEmitter::EmitLdarg(0)
							end if
						end if
					end if
				else
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf <> null then
						idtisstatic = fldinf::get_IsStatic()
						if idtisstatic = false then
							ILEmitter::EmitLdarg(0)
						end if
					end if
				end if
			end if
		end if

		//in case of array store load index
		//-------------------------------------------
		if idt::IsArr then
			Evaluate(idt::ArrLoc)
			ILEmitter::EmitConvI()
		end if
		//--------------------------------------------
	
		//--------------------------------------------------------------
		//loading of value to store
		Evaluate(exp)
		//--------------------------------------------------------------
	
		if idt::IsArr then
			idttyp = idttyp::GetElementType()
			ILEmitter::EmitStelem(idttyp)
		elseif isbyref then
			idttyp = idttyp::GetElementType()
			ILEmitter::EmitStind(idttyp)
		else
			if idtb2 = false then
				vr = null
				if idtb1 = false then
					SymTable::StoreFlg = true
					vr = SymTable::FindVar(idtnamarr[i])
					SymTable::StoreFlg = false
					if vr <> null then
						Helpers::EmitLocSt(vr::Index, vr::LocArg)
						vr::Stored = true
						vr::Line = ILEmitter::LineNr
					end if
				end if
				if vr = null then
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf <> null then
						idtisstatic = fldinf::get_IsStatic()
						Helpers::EmitFldSt(fldinf, idtisstatic)
					end if
				end if
			else
				if idttyp::Equals(AsmFactory::CurnTypB) = false then
					fldinf = Loader::LoadField(idttyp, idtnamarr[i])
				else
					fldinf = Helpers::GetLocFld(idtnamarr[i])
				end if
				Helpers::EmitFldSt(fldinf, idtisstatic)
			end if
		end if
	end method

end class
