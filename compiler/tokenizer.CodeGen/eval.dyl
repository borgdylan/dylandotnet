//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

//delegate public void ASTEmitDelegate(var t as Token, var emt as boolean)

class public Evaluator

	method public prototype void ASTEmit(var tok as Token, var emt as boolean)

	method public prototype boolean ASTEmit(var tok as Token, var emt as boolean, var bo as BranchOptimisation, var lab as Emit.Label)

	method private void ASTEmitValueFilter(var emt as boolean)
		if emt then
			if AsmFactory::Type02 isnot GenericTypeParameterBuilder then
				if Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(AsmFactory::Type02) then

					var loc as integer
					if SymTable::TempVTMap::Contains(AsmFactory::Type02) then
						loc = SymTable::TempVTMap::get_Item(AsmFactory::Type02)
					else
					    ILEmitter::LocInd++
						ILEmitter::DeclVar(i"__temp_{ILEmitter::LocInd}", AsmFactory::Type02)
						loc = ILEmitter::LocInd
						SymTable::TempVTMap::Add(AsmFactory::Type02, loc)
					end if

					ILEmitter::EmitStloc(loc)
					ILEmitter::EmitLdloca(loc)
				end if
			end if
		end if
	end method

	method private void ASTEmitArrayLoad(var idt as Ident, var emt as boolean)
		if idt::IsArr then
			var typ as Managed.Reflection.Type = null
			if Helpers::CheckIfArrLen(idt::ArrLoc) then
				typ = AsmFactory::Type02
				if !typ::get_IsArray() then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("'{0}' is not an Array Type.", typ::ToString()))
				end if
				if emt then
					ILEmitter::EmitLdlen()
					ILEmitter::EmitConvI4()
				end if
				AsmFactory::Type02 = Loader::CachedLoadClass("System.Int32")
			else
				typ = AsmFactory::Type02
				ASTEmit(ConvToAST(ConvToRPN(idt::ArrLoc)), emt)

				if !Helpers::IsPrimitiveIntegralType(AsmFactory::Type02) then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Array Indices should be of a Primitive Integer Type.")
				elseif !typ::get_IsArray() then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("'{0}' is not an Array Type.", typ::ToString()))
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

	method public boolean ASTEmitUnary(var iuo as IUnaryOperatable, var emt as boolean, var bo as BranchOptimisation, var lab as Emit.Label)
		var ops = ParseUtils::StringParser(iuo::get_OrdOp(), ' ')
		var i = 0
		var ans = false
		foreach s in ops
			i++
			if (s == "conv") andalso (iuo is IConvable) then
				var idt = $IConvable$iuo
				if idt::get_Conv() then
					var	src1 = AsmFactory::Type02
					AsmFactory::Type02 = Helpers::CommitEvalTTok(idt::get_TTok())
					if AsmFactory::Type02 is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.", idt::get_TTok()::Value))
					end if
					if emt then
						Helpers::EmitConv(src1, AsmFactory::Type02, idt is NullLiteral)
					end if
				end if
			end if
			if (s == "neg") andalso (iuo is INegatable) then
				if #expr($INegatable$iuo)::get_DoNeg() then
					ans = Helpers::EmitNeg(AsmFactory::Type02, emt, #ternary { i == ops[l] ? bo, BranchOptimisation::None}, lab)
				end if
			end if
			if (s == "not") andalso (iuo is INotable) then
				if #expr($INotable$iuo)::get_DoNot() then
					if emt then
						Helpers::EmitNot(AsmFactory::Type02)
					end if
				end if
			end if
			if (s == "inc") andalso (iuo is IIncDecable) then
				if #expr($IIncDecable$iuo)::get_DoInc() then
					if emt then
						Helpers::EmitInc(AsmFactory::Type02)
					end if
				end if
			end if
			if (s == "dec") andalso (iuo is IIncDecable) then
				if #expr($IIncDecable$iuo)::get_DoDec() then
					if emt then
						Helpers::EmitDec(AsmFactory::Type02)
					end if
				end if
			end if
		end for
		return ans
	end method

	method public void ASTEmitUnary(var iuo as IUnaryOperatable, var emt as boolean)
		ASTEmitUnary(iuo, emt, BranchOptimisation::None, default Emit.Label)
	end method

	method public boolean ASTEmitIdent(var idt as Ident, var emt as boolean, var bo as BranchOptimisation, var lab as Emit.Label)

		var i as integer = -1
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var vr as VarItem
		var idtfldinf as FieldInfo
		var idtisstatic as boolean = false
		var typ as Managed.Reflection.Type
		var idtnamarr as string[] = ParseUtils::StringParser(idt::Value, ':')
		var pushaddr as boolean = idt::IsRef and idt::MemberAccessFlg

		if pushaddr then
			idt::IsRef = false
		elseif idtnamarr[0] == "me" then
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

		if idt::ExplType isnot null then
			typ = Helpers::CommitEvalTTok(idt::ExplType)
			idtisstatic = true
			idtb2 = true

			if typ is null then
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.", idt::ExplType))
			end if
		end if

		do until i = --idtnamarr[l]
			i++
			AsmFactory::AddrFlg = i != --idtnamarr[l]
			AsmFactory::ForcedAddrFlg = (i == --idtnamarr[l]) andalso idt::IsRef andalso !idt::IsArr

			if !idtb2 then
				if !idtb1 then
					vr = SymTable::FindVar(idtnamarr[i])
					if vr isnot null then
						if emt then
							AsmFactory::Type04 = vr::VarTyp
							Helpers::EmitLocLd(vr::Index, vr::LocArg)
						end if
						typ = vr::VarTyp
						if AsmFactory::ForcedAddrFlg andalso !typ::get_IsByRef() then
							typ = typ::MakeByRefType()
						elseif !AsmFactory::ForcedAddrFlg andalso typ::get_IsByRef() then
							typ = typ::GetElementType()
						end if
						AsmFactory::Type02 = typ
						idtb2 = true
						continue
					end if
				end if

				//local field check
				idtfldinf = Helpers::GetLocFld(idtnamarr[i])
				if idtfldinf isnot null then
					idtisstatic = idtfldinf::get_IsStatic()

					if !idtisstatic andalso ILEmitter::StaticFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is an instance field and cannot be used from a static method without an instance being provided.", idtnamarr[i]))
					end if

					if !idtisstatic then
						if emt then
							ILEmitter::EmitLdarg(0)
						end if
					end if
					if emt then
						if Loader::FldLitFlag then
							Helpers::EmitLiteral(Helpers::ProcessConst( _
								new ConstLiteral() {ConstVal = Loader::FldLitVal, ExtTyp = Loader::FldLitTyp, IntTyp = #ternary {Loader::EnumLitFlag ? Loader::EnumLitTyp, Loader::FldLitTyp}}))
							typ = Loader::FldLitTyp
							AsmFactory::Type02 = typ
						else
							AsmFactory::Type04 = idtfldinf::get_FieldType()
							Helpers::EmitFldLd(idtfldinf, idtisstatic)
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
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, i"Variable or Class '{idtnamarr[i]}' is not defined.")
				end if

			else
				if !typ::Equals(AsmFactory::CurnTypB) then
					idtfldinf = Helpers::GetExtFld(typ, idtnamarr[i])
					if idtfldinf = null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, i"Field '{idtnamarr[i]}' is not defined/accessible for the class '{typ::ToString()}'.")
					end if

					if idtisstatic != idtfldinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' defined for the class '{1}' " _
							,idtnamarr[i], typ::ToString()) + #ternary {idtisstatic andalso !idtfldinf::get_IsStatic() ? "is an instance field.", "is static."})
					end if

					typ = Loader::MemberTyp
					if AsmFactory::ForcedAddrFlg then
						typ = typ::MakeByRefType()
					end if
					AsmFactory::Type02 = typ

					if emt then
						if Loader::FldLitFlag then
							Helpers::EmitLiteral(Helpers::ProcessConst( _
								new ConstLiteral() {ConstVal = Loader::FldLitVal, ExtTyp = Loader::FldLitTyp, IntTyp = #ternary {Loader::EnumLitFlag ? Loader::EnumLitTyp, Loader::FldLitTyp}}))
							typ = Loader::FldLitTyp
							AsmFactory::Type02 = typ
						else
							AsmFactory::Type04 = Loader::MemberTyp
							Helpers::EmitFldLd(idtfldinf, idtisstatic)
						end if
					end if
				else
					idtfldinf = Helpers::GetLocFld(idtnamarr[i])
					if idtfldinf is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", idtnamarr[i], AsmFactory::CurnTypB::ToString()))
					end if

					if idtisstatic != idtfldinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' defined for the class '{1}' " _
							,idtnamarr[i], AsmFactory::CurnTypB::ToString()) + #ternary {idtisstatic andalso !idtfldinf::get_IsStatic() ? "is an instance field.", "is static."})
					end if

					if emt then
						if Loader::FldLitFlag then
							Helpers::EmitLiteral(Helpers::ProcessConst( _
								new ConstLiteral() {ConstVal = Loader::FldLitVal, ExtTyp = Loader::FldLitTyp, IntTyp = #ternary {Loader::EnumLitFlag ? Loader::EnumLitTyp, Loader::FldLitTyp}}))
							typ = Loader::FldLitTyp
							AsmFactory::Type02 = typ
						else
							AsmFactory::Type04 = idtfldinf::get_FieldType()
							Helpers::EmitFldLd(idtfldinf, idtisstatic)
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
			if AsmFactory::AutoChainFlg then
				ASTEmit(idt::MemberToAccess, emt)
			end if
		end if
		if AsmFactory::AutoChainFlg then
			return ASTEmitUnary(idt, emt, bo, lab)
		end if
		return false
	end method

	method public boolean ASTEmitMethod(var mctok as MethodCallTok, var emt as boolean, var bo as BranchOptimisation, var lab as Emit.Label)
		var mcmetinf as MethodInfo = null
		var mntok as MethodNameTok = mctok::Name
		var mcfldinf as FieldInfo = null
		var mcisstatic as boolean = false
		var mcrestrord as integer = 2
		var i as integer = -1
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var idtisstatic as boolean = false
		var pushaddr as boolean = mntok::IsRef andalso mntok::MemberAccessFlg
		var baseflg as boolean = false
		var mcparenttyp as Managed.Reflection.Type = AsmFactory::CurnTypB
		var mectorflg as boolean = (mntok::Value == "mybase::ctor") orelse (mntok::Value == "me::ctor")

		if emt andalso (mntok::Value == "me::ctor") then
			StreamUtils::WriteWarn(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Using mybase::ctor is preferred over the use of me::ctor!")
		end if

		var ctorflg as boolean = mntok::Value == "ctor"
		var mnstrarr as string[] = ParseUtils::StringParser(mntok::Value, ':')
		var len as integer = mnstrarr[l] - 2
		var iterflg = false
		var mtt as TypeTok = null

		if pushaddr then
			mntok::IsRef = false
		end if
		if (mnstrarr[0] == "me") orelse (mnstrarr[0] == "mybase") then
			i++
			idtb1 = true
			mcrestrord = 3
			baseflg = mnstrarr[0] == "mybase"
		end if

		if mectorflg orelse ctorflg then
			if emt then
				ILEmitter::EmitLdarg(0)
			end if
		else
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

			if mntok::ExplType isnot null then
				mcparenttyp = Helpers::CommitEvalTTok(mntok::ExplType)
				mcisstatic = true
				idtb2 = true

				if mcparenttyp is null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.", mntok::ExplType))
				end if
			end if

			if mnstrarr[l] >= mcrestrord then
				AsmFactory::AddrFlg = true

				do until i == len
					i++
					iterflg = true
					if !idtb2 then
						if !idtb1 then
							var mcvr as VarItem = SymTable::FindVar(mnstrarr[i])
							if mcvr isnot null then
								if emt then
									AsmFactory::Type04 = mcvr::VarTyp
									if (i == len) andalso (mcvr::VarTyp is GenericTypeParameterBuilder) then
										AsmFactory::ForcedAddrFlg = true
									end if
									Helpers::EmitLocLd(mcvr::Index, mcvr::LocArg)
									AsmFactory::ForcedAddrFlg = false
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
						if mcfldinf isnot null then
							idtisstatic = mcfldinf::get_IsStatic()

							if !idtisstatic andalso ILEmitter::StaticFlg then
								StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is an instance field and cannot be used from a static method without an instance being provided.", mnstrarr[i]))
							end if

							if emt then
								if !idtisstatic then
									ILEmitter::EmitLdarg(0)
								end if
								AsmFactory::Type04 = mcfldinf::get_FieldType()
								if (i == len) andalso (mcfldinf::get_FieldType() is GenericTypeParameterBuilder) then
									AsmFactory::ForcedAddrFlg = true
								end if
								Helpers::EmitFldLd(mcfldinf, idtisstatic)
								AsmFactory::ForcedAddrFlg = false
							end if

							mcisstatic = false
							mcparenttyp = mcfldinf::get_FieldType()
							AsmFactory::Type02 = mcparenttyp
							idtb2 = true
							continue
						end if
						//----------------------------------

						mtt = new TypeTok(mnstrarr[i])
						mcparenttyp = Helpers::CommitEvalTTok(mtt)
						mcisstatic = true

						if mcparenttyp is null then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Variable or Class '{0}' is not defined.", mnstrarr[i]))
						end if
					else
						mcfldinf = #ternary {mcparenttyp::Equals(AsmFactory::CurnTypB) ? Helpers::GetLocFld(mnstrarr[i]) , Helpers::GetExtFld(mcparenttyp, mnstrarr[i])}
						if mcfldinf is null then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", mnstrarr[i], mcparenttyp::ToString()))
						end if
						mcparenttyp = Loader::MemberTyp

						if mcisstatic != mcfldinf::get_IsStatic() then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' defined for the class '{1}' {2}.", _
								mnstrarr[i], mcfldinf::get_DeclaringType()::ToString(), #ternary {mcisstatic andalso !mcfldinf::get_IsStatic() ? "is an instance field", "is static"}))
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
		end if

		i++
		//instance load for local methods of current isntance

		if !mectorflg and !ctorflg then
			if !idtb2 then
				if emt then
					Helpers::BaseFlg = baseflg
					mcmetinf = Helpers::GetLocMet(mntok, mctok::TypArr)
					Helpers::BaseFlg = false
					mcisstatic = mcmetinf::get_IsStatic()

					if !mcisstatic andalso ILEmitter::StaticFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' is an instance method and cannot be called from a static method without an instance being provided.", mnstrarr[i]))
					end if

					if !mcisstatic then
						ILEmitter::EmitLdarg(0)
					end if
				end if
			end if
		end if

		AsmFactory::Type03 = AsmFactory::Type02

		var lt = new C5.LinkedList<of Managed.Reflection.Type>()
		foreach param in mctok::Params
			ASTEmit(ConvToAST(ConvToRPN(param)), emt)
			lt::Add(AsmFactory::Type02)
		end for
		var typarr1 as Managed.Reflection.Type[] = lt::ToArray()

		if !emt then
			mctok::TypArr = typarr1
		end if

		AsmFactory::Type02 = AsmFactory::Type03
		AsmFactory::Type05 = mcparenttyp

		if mectorflg then
			mcparenttyp = AsmFactory::CurnInhTyp
			Loader::ProtectedFlag = true
			var ncctorinf as ConstructorInfo = Helpers::GetLocCtor(mcparenttyp, typarr1)
			Loader::ProtectedFlag = false

			if ncctorinf is null then
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Base Class Constructor with the given parameter types is not defined/accessible for the class '{0}'.", mcparenttyp::ToString()))
			end if

			if emt then
				ILEmitter::EmitCallCtor(ncctorinf)
			end if
		elseif ctorflg then
			mcparenttyp = AsmFactory::CurnTypB
			Loader::ProtectedFlag = true
			var ncctorinf as ConstructorInfo = Helpers::GetLocCtor(mcparenttyp, typarr1)
			Loader::ProtectedFlag = false

			if ncctorinf is null then
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class Constructor with the given parameter types is not defined/accessible for the class '{0}'.", mcparenttyp::ToString()))
			end if

			if emt then
				ILEmitter::EmitCallCtor(ncctorinf)
			end if
		else
			if idtb2 and !mcparenttyp::Equals(AsmFactory::CurnTypB) then
				mcmetinf = Helpers::GetExtMet(mcparenttyp, mntok, typarr1)

				if mcisstatic andalso (mcmetinf is null) then
					mcmetinf = Helpers::GetExtMet(Loader::LoadClasses(mtt::Value), mntok, typarr1)
				end if

				if mcmetinf is null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' with the given parameter types is not defined/accessible for the class '{1}'.", mnstrarr[i], mcparenttyp::ToString()))
				end if
				AsmFactory::Type02 = Loader::MemberTyp
				baseflg = false

				if mcisstatic != mcmetinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' defined for the class '{1}' {2}", _
							mnstrarr[i], mcparenttyp::ToString(), #ternary {mcisstatic andalso !mcmetinf::get_IsStatic() ? "is an instance method.", "is static."}))
				end if

			else
				if !idtb2 then
					Helpers::BaseFlg = baseflg
				end if
				mcmetinf = Helpers::GetLocMet(mntok, typarr1)
				if mcmetinf == null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' with the given parameter types is not defined/accessible for the class '{1}'.", mnstrarr[i], AsmFactory::CurnTypB::ToString()))
				end if
				AsmFactory::Type02 = mcmetinf::get_ReturnType()
				mcisstatic = mcmetinf::get_IsStatic()
			end if

			if emt then
				if !iterflg andalso (AsmFactory::Type05 is GenericTypeParameterBuilder) then
					ILEmitter::LocInd++
					ILEmitter::DeclVar(i"__temp_{ILEmitter::LocInd}", AsmFactory::Type05)
					ILEmitter::EmitStloc(ILEmitter::LocInd)
					ILEmitter::EmitLdloca(ILEmitter::LocInd)
				end if
				AsmFactory::PopFlg = mctok::PopFlg
				Helpers::EmitMetCall(mcmetinf, mcisstatic)
				AsmFactory::PopFlg = false

				var oa as ObsoleteAttribute = Helpers::GetObsolete(mcmetinf)
				if oa isnot null then
					if oa::get_IsError() then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' in the class '{1}' is obsolete: {2}.", mcmetinf::get_Name(), mcmetinf::get_DeclaringType()::ToString(), oa::get_Message()))
					else
						StreamUtils::WriteWarn(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' in the class '{1}' is obsolete: {2}.", mcmetinf::get_Name(), mcmetinf::get_DeclaringType()::ToString(), oa::get_Message()))
					end if
				end if
			else
				//conditional call support
				if mctok::CondFlg then
					if mcisstatic andalso Loader::CachedLoadClass("System.Void")::Equals(mcmetinf::get_ReturnType()) then
						var condattrs = Helpers::GetConditional(mcmetinf)
						if condattrs isnot null then
							mctok::CondAvailable = true
							var acc = false
							foreach condattr in condattrs
								acc = acc orelse SymTable::EvalDef(condattr::get_ConditionString())
								if acc then
									break
								end if
							end for
							mctok::CondFlgValue = acc
						end if
					end if
				end if
			end if
			Helpers::BaseFlg = false
			if !mctok::PopFlg then
				ASTEmitArrayLoad(mntok, emt)
				if !mntok::IsArr and mntok::MemberAccessFlg then
					ASTEmitValueFilter(emt)
				end if
			end if

			if mntok::MemberAccessFlg then
				AsmFactory::ChainFlg = true
				AsmFactory::RefChainFlg = pushaddr
				if AsmFactory::AutoChainFlg then
					ASTEmit(mntok::MemberToAccess, emt)
				end if
			end if
		end if

		if AsmFactory::AutoChainFlg then
			return ASTEmitUnary(mntok, emt, bo, lab)
		end if
		return false
	end method

	method public void ASTEmitNew(var nctok as NewCallTok, var emt as boolean)
		//constructor call section
		var delparamarr as Managed.Reflection.Type[]
		var delmtdnam as MethodNameTok
		var nctyp as Managed.Reflection.Type = Helpers::CommitEvalTTok(nctok::Name)
		var delcreate as boolean = false
		var typarr1 as Managed.Reflection.Type[] = Managed.Reflection.Type::EmptyTypes
		var ncctorinf as ConstructorInfo
		var i as integer = -1
		var mnstrarr as string[]
		var len as integer
		var mcparenttyp as Managed.Reflection.Type = null
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var mcvr as VarItem
		var mcfldinf as FieldInfo = null
		var idtisstatic as boolean = false
		var mcisstatic as boolean = false
		var mcmetinf as MethodInfo = null

		if nctyp is null then
			StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.", nctok::Name::ToString()))
		end if

		if nctyp::IsSubclassOf(Loader::CachedLoadClass("System.MulticastDelegate")) then
			delcreate = true
			delparamarr = Loader::GetDelegateInvokeParams(nctyp)
			delmtdnam = Helpers::StripDelMtdName(nctok::Params::get_Item(0)::Tokens::get_Item(0))
		else
			var lt = new C5.LinkedList<of Managed.Reflection.Type>()
			foreach param in nctok::Params
				ASTEmit(ConvToAST(ConvToRPN(param)), emt)
				lt::Add(AsmFactory::Type02)
			end for
			typarr1 = lt::ToArray()
		end if

		if delcreate then
			typarr1 = new Managed.Reflection.Type[] {Loader::CachedLoadClass("System.Object"), Loader::CachedLoadClass("System.IntPtr")}

			//-------------------------------------------------------------------------------------------
			//delegate pointer loading section
			mnstrarr = ParseUtils::StringParser(delmtdnam::Value, ':')
			var mcrestrord as integer = 2
			i = -1
			len = mnstrarr[l] - 2

			if mnstrarr[0] == "me" then
				i++
				idtb1 = true
				mcrestrord = 3
			end if

			if delmtdnam::ExplType isnot null then
				mcparenttyp = Helpers::CommitEvalTTok(delmtdnam::ExplType)
				mcisstatic = true
				idtb2 = true

				if mcparenttyp is null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.", delmtdnam::ExplType))
				end if
			end if

			if mnstrarr[l] >= mcrestrord then
				AsmFactory::AddrFlg = true

				do until i = len
					i++

					if !idtb2 then
						if !idtb1 then
							mcvr = SymTable::FindVar(mnstrarr[i])
							if mcvr isnot null then
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
						if mcfldinf isnot null then
							idtisstatic = mcfldinf::get_IsStatic()

							if !idtisstatic andalso ILEmitter::StaticFlg then
								StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is an instance field and cannot be used from a static method without an instance being provided.", mnstrarr[i]))
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

						if mcparenttyp is null then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Variable or Class '{0}' is not defined.", mnstrarr[i]))
						end if
					else
						if mcparenttyp::Equals(AsmFactory::CurnTypB) then
							mcfldinf = Helpers::GetLocFld(mnstrarr[i])
							if mcfldinf is null then
								StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", mnstrarr[i], AsmFactory::CurnTypB::ToString()))
							end if
							mcparenttyp = mcfldinf::get_FieldType()
						else
							mcfldinf = Helpers::GetExtFld(mcparenttyp, mnstrarr[i])
							if mcfldinf is null then
								StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", mnstrarr[i], mcparenttyp::ToString()))
							end if
							mcparenttyp = Loader::MemberTyp
						end if

						if mcisstatic != mcfldinf::get_IsStatic() then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' defined for the class '{1}' " _
								,mnstrarr[i], mcfldinf::get_DeclaringType()::ToString()) + #ternary {mcisstatic andalso !mcfldinf::get_IsStatic() ? "is an instance field.", "is static."})
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

			i++
			//instance load for local methods of current instance
			if !idtb2 then
				if emt then
					mcmetinf = Helpers::GetLocMet(delmtdnam, delparamarr)
					mcisstatic = mcmetinf::get_IsStatic()

					if !mcisstatic andalso ILEmitter::StaticFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' is an instance method and cannot be called from a static method without an instance being provided.", mnstrarr[i]))
					end if

					if !mcisstatic then
						ILEmitter::EmitLdarg(0)
					end if
				end if
			end if
			//----------------------------------------------------------

			if idtb2 then
				if mcparenttyp::Equals(AsmFactory::CurnTypB) then
					mcmetinf = Helpers::GetLocMet(delmtdnam, delparamarr)
					if mcmetinf is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' with the given parameter types is not defined/accessible for the class '{1}'.", mnstrarr[i], AsmFactory::CurnTypB::ToString()))
					end if
				else
					mcmetinf = Helpers::GetExtMet(mcparenttyp, delmtdnam, delparamarr)
					if mcmetinf is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' with the given parameter types is not defined/accessible for the class '{1}'.", mnstrarr[i], mcparenttyp::ToString()))
					end if
				end if
				if mcisstatic != mcmetinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' defined for the class '{1}' " _
							,mnstrarr[i], mcparenttyp::ToString()) + #ternary {mcisstatic andalso !mcmetinf::get_IsStatic() ? "is an instance method.", "is static."})
				end if
			else
				mcmetinf = Helpers::GetLocMet(delmtdnam, delparamarr)
				if mcmetinf is null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Method '{0}' with the given parameter types is not defined/accessible for the class '{1}'.", mnstrarr[i], AsmFactory::CurnTypB::ToString() ))
				end if
				mcisstatic = mcmetinf::get_IsStatic()
			end if
			//-------------------------------------------------------------------------------------------

			if emt then
				if mcisstatic then
					ILEmitter::EmitLdnull()
				else
					ILEmitter::EmitDup()
				end if
				Helpers::EmitPtrLd(mcmetinf, mcisstatic)
			end if

			//delegate pointer loading section
		end if

		if nctyp is GenericTypeParameterBuilder then
			var tpi = Helpers::GetTPI(nctyp::get_Name())
			if tpi::HasCtor andalso (typarr1[l] == 0) then
				if emt then
					mcmetinf = Loader::LoadGenericMethod(Loader::CachedLoadClass("System.Activator"), "CreateInstance", new Managed.Reflection.Type[] {tpi::Bldr}, typarr1)
					Helpers::EmitMetCall(mcmetinf, true)
					if nctok::PopFlg then
						ILEmitter::EmitPop()
					end if
				end if
			else
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Constructor with the given parameter types is not defined/accessible for the class '{0}'.", nctyp::ToString()))
			end if
		else
			ncctorinf = Helpers::GetLocCtor(nctyp, typarr1)
			if ncctorinf is null then
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Constructor with the given parameter types is not defined/accessible for the class '{0}'.", nctyp::ToString()))
			end if

			if emt then
				ILEmitter::EmitNewobj(ncctorinf)
				if nctok::PopFlg then
					ILEmitter::EmitPop()
				end if
			end if
		end if

		AsmFactory::Type02 = nctyp

		if nctok::MemberAccessFlg andalso !nctok::PopFlg then
			ASTEmitValueFilter(emt)
			AsmFactory::ChainFlg = true
			if AsmFactory::AutoChainFlg then
				ASTEmit(nctok::MemberToAccess, emt)
			end if
		end if
	end method

	method public boolean ASTEmit(var tok as Token, var emt as boolean, var bo as BranchOptimisation, var lab as Emit.Label)
		Helpers::NullExprFlg = tok is NullLiteral
		var optok as Op = null
		var rc as Token = null
		var lc as Token = null
		var lctyp as Managed.Reflection.Type = null
		var rctyp as Managed.Reflection.Type = null
		var ans = false

		if tok is Op then
			optok = $Op$tok
			var isflg as boolean = optok is IsOp
			var asflg as boolean = optok is AsOp
			var coalflg as boolean = optok is CoalesceOp
			var sandflg as boolean = optok is AndAlsoOp
			var sorflg as boolean = optok is OrElseOp
			var isnflg as boolean = optok is IsNotOp

			rc = optok::RChild
			lc = optok::LChild

			if !#expr(sandflg orelse sorflg) then
				ASTEmit(lc, emt)
				lctyp = AsmFactory::Type02
			end if

			if !#expr(isflg orelse isnflg orelse asflg orelse sandflg orelse sorflg orelse coalflg) then
				ASTEmit(rc, emt)
				rctyp = AsmFactory::Type02

				if emt then
					Helpers::StringFlg = lctyp::Equals(rctyp) andalso lctyp::Equals(Loader::CachedLoadClass("System.String"))
					Helpers::BoolFlg = lctyp::Equals(rctyp) andalso lctyp::Equals(Loader::CachedLoadClass("System.Boolean"))
					if lctyp::Equals(rctyp) then
						Helpers::DelegateFlg = lctyp::IsSubclassOf(Loader::CachedLoadClass("System.Delegate"))
					end if
				end if

				Helpers::OpCodeSuppFlg = #ternary{lctyp::Equals(rctyp) ? lctyp::get_IsPrimitive(), false}
				var typ2 = Loader::CachedLoadClass("System.ValueType")
				Helpers::EqSuppFlg = !#expr(typ2::IsAssignableFrom(lctyp) orelse typ2::IsAssignableFrom(rctyp)) orelse Helpers::OpCodeSuppFlg
				Helpers::EqSuppFlg = Helpers::EqSuppFlg orelse (lctyp::Equals(rctyp) andalso Loader::CachedLoadClass("System.Enum")::IsAssignableFrom(lctyp))
			end if

			AsmFactory::Type02 = #ternary {optok is ConditionalOp ? Loader::CachedLoadClass("System.Boolean"), lctyp}

			if isflg then
				if emt then
					if rc is NullLiteral then
						ILEmitter::EmitNotRef(bo, lab)
						ans = bo != BranchOptimisation::None
					else
						var istyp as Managed.Reflection.Type = Helpers::CommitEvalTTok(rc as TypeTok)
						if istyp is null then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is undefined.", rc::Value))
						else
							ILEmitter::EmitIs(istyp, bo, lab)
							ans = bo != BranchOptimisation::None
						end if
					end if
				end if
			elseif isnflg then
				if emt then
					if rc is NullLiteral then
						ILEmitter::EmitIsNotRef(bo, lab)
						ans = bo != BranchOptimisation::None
					else
						var istyp as Managed.Reflection.Type = Helpers::CommitEvalTTok(rc as TypeTok)
						if istyp is null then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is undefined.", rc::Value))
						else
							ILEmitter::EmitIsNot(istyp, bo, lab)
							ans = bo != BranchOptimisation::None
						end if
					end if
				end if
			elseif asflg then
				var astyp as Managed.Reflection.Type = Helpers::CommitEvalTTok(rc as TypeTok)
				if astyp is null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{1}' was not found.", rc::Value))
				else
					if emt then
						ILEmitter::EmitIsinst(astyp)
					end if
				end if
				AsmFactory::Type02 = astyp
			elseif coalflg then
				var rt as Managed.Reflection.Type = null
				ASTEmit(rc, false)
				rctyp = AsmFactory::Type02
				var n1 = Helpers::ProcessNullable(lctyp)
				var n2 = Helpers::ProcessNullable(rctyp)

				//validate cases: either two compat ref types, T? and T? (yield T?), T? and T (yields T) where T is a struct
				if !lctyp::get_IsValueType() andalso !rctyp::get_IsValueType() then
					rt = Helpers::CheckCompat(lctyp, rctyp)
					if rt is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Original and Null-handling cases for Null-Coalescing should evaluate to compatible types.")
					end if
				elseif n1 isnot null andalso n2 isnot null then
					if !n1::Equals(n2) then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Original and Null-handling cases for Null-Coalescing should evaluate to compatible types.")
					else
						rt = lctyp
					end if
				elseif n1 isnot null then
					if !n1::Equals(rctyp) then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Original and Null-handling cases for Null-Coalescing should evaluate to compatible types.")
					else
						rt = rctyp
					end if
				else
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Original and Null-handling cases for Null-Coalescing should evaluate to a supported case.")
				end if

				if n1 isnot null then
					if emt then
						SymTable::AddIf()
						ILEmitter::EmitDup()
						//convert T? to object
						AsmFactory::Type02 = lctyp
						ASTEmitValueFilter(true)
						ILEmitter::EmitCall(Loader::LoadMethod(lctyp, "get_HasValue", Managed.Reflection.Type::EmptyTypes))
						ILEmitter::EmitBrfalse(SymTable::ReadIfEndLbl())
						if n2 is null then
							//unpack T from T?
							AsmFactory::Type02 = lctyp
							ASTEmitValueFilter(true)
							ILEmitter::EmitCall(Loader::LoadMethod(lctyp, "get_Value", Managed.Reflection.Type::EmptyTypes))
						end if
						ILEmitter::EmitBr(SymTable::ReadIfNxtBlkLbl())
						ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
						ILEmitter::EmitPop()
					end if

					ASTEmit(rc, emt)

					if emt then
						ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
						SymTable::PopIf()
					end if
				else
					if emt then
						SymTable::AddIf()
						ILEmitter::EmitDup()
						ILEmitter::EmitBrtrue(SymTable::ReadIfEndLbl())
						ILEmitter::EmitPop()
					end if
					ASTEmit(rc, emt)

					if emt then
						ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
						SymTable::PopIf()
					end if
				end if

				AsmFactory::Type02 = rt
			elseif sandflg then
				ASTEmit(new TernaryCallTok() {Condition = new Expr() {AddToken(lc)} _
					, TrueExpr = new Expr() {AddToken(rc)}, FalseExpr = new Expr() {AddToken(new BooleanLiteral(false))} } ,emt)
			elseif sorflg then
				ASTEmit(new TernaryCallTok() {Condition = new Expr() {AddToken(lc)} _
					, FalseExpr = new Expr() {AddToken(rc)}, TrueExpr = new Expr() {AddToken(new BooleanLiteral(true))} } ,emt)
			else
				Helpers::LeftOp = lctyp
				Helpers::RightOp = rctyp
				ans = Helpers::EmitOp(optok, !Helpers::CheckUnsigned(lctyp), emt, bo, lab)
			end if

			if emt then
				Helpers::StringFlg = false
				Helpers::OpCodeSuppFlg = false
				Helpers::EqSuppFlg = false
				Helpers::DelegateFlg = false
			end if
		else
			var typ2 as Managed.Reflection.Type

			if tok is StringLiteral then
				var slit as StringLiteral = $StringLiteral$tok
				AsmFactory::Type02 = Helpers::CommitEvalTTok(slit::LitTyp)

				if emt then
					if slit::Value == string::Empty then
						StreamUtils::WriteWarn(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, c"It is more efficient to use 'string::Empty' instead of ' \q\q '.")
					end if

					Helpers::EmitLiteral(slit)
				end if

				if slit::MemberAccessFlg then
					AsmFactory::ChainFlg = true
					ASTEmit(slit::MemberToAccess, emt)
				end if

				ans = ASTEmitUnary(slit, emt, bo, lab)
			elseif tok is Literal then
				var lit as Literal = $Literal$tok

				if emt then
					Helpers::EmitLiteral(lit)
				end if
				AsmFactory::Type02 = Helpers::CommitEvalTTok(lit::LitTyp)

				ans = ASTEmitUnary(lit, emt, bo, lab)
			elseif tok is Ident then
				ans = ASTEmitIdent($Ident$tok, emt, bo, lab)
			elseif tok is MethodCallTok then
				ans = ASTEmitMethod($MethodCallTok$tok, emt, bo, lab)
			elseif tok is NewCallTok then
				ASTEmitNew($NewCallTok$tok,emt)
			elseif tok is GettypeCallTok then
				if emt then
					//gettype section
					var gtctok as GettypeCallTok = $GettypeCallTok$tok
					typ2 = Helpers::CommitEvalTTok(gtctok::Name)
					if typ2 = null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.", gtctok::Name::Value))
					end if
					ILEmitter::EmitLdtoken(typ2)
					ILEmitter::EmitCall(Loader::CachedLoadClass("System.Type")::GetMethod("GetTypeFromHandle", new Managed.Reflection.Type[] {Loader::LoadClass("System.RuntimeTypeHandle")}))
				end if
				AsmFactory::Type02 = Loader::CachedLoadClass("System.Type")
			elseif tok is DefaultCallTok then
				var dftok as DefaultCallTok = $DefaultCallTok$tok
				typ2 = Helpers::CommitEvalTTok(dftok::Name)
				if typ2 is null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.", dftok::Name::Value))
				end if

				if emt then
					//default section
					var loc as integer
					if SymTable::TempVTMap::Contains(typ2) then
						loc = SymTable::TempVTMap::get_Item(typ2)
					else
						ILEmitter::LocInd++
						ILEmitter::DeclVar(i"__temp_{ILEmitter::LocInd}", typ2)
						loc = ILEmitter::LocInd
						SymTable::TempVTMap::Add(typ2, loc)
					end if

					ILEmitter::EmitLdloca(loc)
					ILEmitter::EmitInitobj(typ2)
					ILEmitter::EmitLdloc(loc)
				end if

				AsmFactory::Type02 = typ2
			elseif tok is MeTok then
				if emt then
					ILEmitter::EmitLdarg(0)
				end if
				var ti = SymTable:::CurnTypItem
				if ti::NrGenParams > 0 then
					var tps = new Managed.Reflection.Type[ti::NrGenParams]
					var i = -1
					foreach tpi in ti::GenParams
						i++
						tps[i] = tpi
					end for

					AsmFactory::Type02 = AsmFactory::CurnTypB::MakeGenericType(tps)
				else
					AsmFactory::Type02 = AsmFactory::CurnTypB
				end if
				ASTEmitUnary($MeTok$tok, emt)
			elseif tok is NewarrCallTok then
				//array creation section
				var newactok as NewarrCallTok = $NewarrCallTok$tok
				typ2 = Helpers::CommitEvalTTok(newactok::ArrayType)
				ASTEmit(ConvToAST(ConvToRPN(newactok::ArrayLen)), emt)
				if !Helpers::IsPrimitiveIntegralType(AsmFactory::Type02) then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Array Lengths should be of a Primitive Integer Type.")
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
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.",aictok::ArrayType::ToString()))
				end if

				var ci as CollectionItem = Helpers::ProcessCollection(typ2,aictok::ForceArray)

				if ci is null then
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
					if el2 isnot null then
						if el2 is AttrValuePair then
							var el as AttrValuePair = $AttrValuePair$el2
							if emt then
								ILEmitter::EmitDup()
							end if
							ASTEmit(ConvToAST(ConvToRPN(el::ValueExpr)), emt)
							var fldinf as FieldInfo = Helpers::GetExtFld(ctyp, el::Name::Value)
							if fldinf = null then
								StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", el::Name::Value, ctyp::ToString()))
							elseif fldinf::get_IsInitOnly() then
								StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is declared as readonly and may not be set from this context.", el::Name::Value))
							elseif fldinf::get_IsStatic() then
								StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is declared as static and may not be set from object initializers.", el::Name::Value))
							end if
							Helpers::CheckAssignability(fldinf::get_FieldType(), AsmFactory::Type02)
							if emt then
								Helpers::EmitFldSt(fldinf, fldinf::get_IsStatic())
							end if
						elseif el2 is MethodCallTok then
							var el as MethodCallTok = $MethodCallTok$el2
							if Helpers::SetPopFlg(el) isnot null then
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
					if AsmFactory::AutoChainFlg then
						ASTEmit(oictok::MemberToAccess, emt)
					end if
				end if
			elseif tok is TernaryCallTok then
				var tcc as TernaryCallTok = $TernaryCallTok$tok
				if emt then
					SymTable::AddIf()
				end if

				if emt then
					if !#expr(ASTEmit(ConvToAST(ConvToRPN(tcc::Condition)), true, BranchOptimisation::Inverted, SymTable::ReadIfNxtBlkLbl())) then
						ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
					end if
				else
					ASTEmit(ConvToAST(ConvToRPN(tcc::Condition)), false)
				end if

				if !AsmFactory::Type02::Equals(Loader::CachedLoadClass("System.Boolean")) then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Conditions for Ternary Expressions should evaluate to boolean.")
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
				if AsmFactory::Type02 is null then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "True and False Cases for Ternary Expressions should evaluate to compatible types.")
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
					ASTEmitValueFilter(emt)
					AsmFactory::ChainFlg = true
					if AsmFactory::AutoChainFlg then
						ASTEmit(ecc::MemberToAccess, emt)
					end if
				end if
				if AsmFactory::AutoChainFlg then
					ans = ASTEmitUnary(ecc, emt, bo, lab)
				end if
			elseif tok is NullCondCallTok then
				var ecc as NullCondCallTok = $NullCondCallTok$tok
				ASTEmit(ConvToAST(ConvToRPN(ecc::Exp)), emt)

				if ecc::MemberAccessFlg then
					//test inner expression for nullability
					var innerType = AsmFactory::Type02
					var n1 = Helpers::ProcessNullable(innerType)

					//validate: either a ref type, or T? where T is a struct
					if !innerType::get_IsValueType() orelse n1 isnot null then
						//T?
						if n1 isnot null then
							//StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "NYI: null conditionals")
							AsmFactory::ChainFlg = true
							ASTEmit(ecc::MemberToAccess, false)
							var chainType = AsmFactory::Type02
							var n2 = Helpers::ProcessNullable(chainType)
							var retType = Helpers::MakeNullable(chainType)

							if emt then
								SymTable::AddIf()
								ILEmitter::EmitDup()
								AsmFactory::Type02 = innerType
								ASTEmitValueFilter(true)
								ILEmitter::EmitCall(Loader::LoadMethod(innerType, "get_HasValue", Managed.Reflection.Type::EmptyTypes))
								ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
							end if

							//chain if not null
							AsmFactory::Type02 = innerType
							//chaining is assured
							ASTEmitValueFilter(emt)
							AsmFactory::ChainFlg = true
							if AsmFactory::AutoChainFlg then
								ASTEmit(ecc::MemberToAccess, emt)
							end if

							if emt then
								if retType::get_IsValueType() andalso n2 is null then
									//convert T to T? if T is a non nullable struct
									ILEmitter::EmitNewobj(Helpers::GetLocCtor(retType, new Managed.Reflection.Type[] {chainType}))
								end if

								if !innerType::Equals(retType) then
									ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
								end if
								ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
								//handle null case
								if !innerType::Equals(retType) then
									ILEmitter::EmitBox(innerType)
									if retType::get_IsValueType() then
										//do conversions of null T? to U? if needed
										ILEmitter::EmitUnboxAny(retType)
									end if
									ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
								end if
								SymTable::PopIf()
							end if

							AsmFactory::Type02 = retType
						//ref
						else
							AsmFactory::ChainFlg = true
							ASTEmit(ecc::MemberToAccess, false)
							var chainType = AsmFactory::Type02
							var n2 = Helpers::ProcessNullable(chainType)
							var retType = Helpers::MakeNullable(chainType)

							if emt then
								SymTable::AddIf()
								ILEmitter::EmitDup()
								ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
							end if

							//chain if not null
							AsmFactory::Type02 = innerType
							//chaining is assured
							ASTEmitValueFilter(emt)
							AsmFactory::ChainFlg = true
							if AsmFactory::AutoChainFlg then
								ASTEmit(ecc::MemberToAccess, emt)
							end if

							if emt then
								if retType::get_IsValueType() andalso n2 is null then
									//convert T to T? if T is a non nullable struct
									ILEmitter::EmitNewobj(Helpers::GetLocCtor(retType, new Managed.Reflection.Type[] {chainType}))
								end if

								if retType::get_IsValueType() then
									ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
								end if
								ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
								//handle null case
								if retType::get_IsValueType() then
									//do conversions of null to T? if needed
									ILEmitter::EmitUnboxAny(retType)
									ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
								end if
								SymTable::PopIf()
							end if

							AsmFactory::Type02 = retType
						end if
					else
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, i"The type {innerType::ToString()} is not nullable!")
					end if
				end if

				if AsmFactory::AutoChainFlg then
					ans = ASTEmitUnary(ecc, emt, bo, lab)
				end if

			//elseif tok is PtrCallTok then
				//ptr load section - obsolete
				//if emt then
				//	StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Using 'ptr' is considered an obsolete practice.")
				//	var ptrctok as PtrCallTok = $PtrCallTok$tok
				//	mcmetinf = Helpers::GetLocMetNoParams(ptrctok::MetToCall::Value)
				//	mcisstatic = mcmetinf::get_IsStatic()
				//	if !mcisstatic then
				//		ILEmitter::EmitLdarg(0)
				//	end if
				//	Helpers::EmitPtrLd(mcmetinf, mcisstatic)
				//end if
				//AsmFactory::Type02 = Loader::CachedLoadClass("System.IntPtr")
			else
				StreamUtils::WriteWarn(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, i"Using '{tok::GetType()}' is not supported.")
			end if

		end if
		return ans
	end method

	method public void ASTEmit(var tok as Token, var emt as boolean)
		ASTEmit(tok, emt, BranchOptimisation::None, default Emit.Label)
	end method

	method public void Evaluate(var exp as Expr)
		var asttok as Token = ConvToAST(ConvToRPN(exp))
		ASTEmit(asttok, false)
		ASTEmit(asttok, true)
	end method

	method public boolean Evaluate(var exp as Expr, var bo as BranchOptimisation, var lab as Emit.Label)
		var asttok as Token = ConvToAST(ConvToRPN(exp))
		ASTEmit(asttok, false)
		return ASTEmit(asttok, true, bo, lab)
	end method

	method public Managed.Reflection.Type EvaluateType(var exp as Expr)
		ASTEmit(ConvToAST(ConvToRPN(exp)), false)
		return AsmFactory::Type02
	end method

	method public void StoreEmit(var tok as Token, var exp as Expr)

		var i as integer = -1
		var idt as Ident = $Ident$tok
		var idtnamarr as string[] = ParseUtils::StringParser(idt::Value, ':')
		var len as integer = idtnamarr[l] - 2
		var vr as VarItem = null
		var idtb1 as boolean = false
		var idtb2 as boolean = false
		var idtisstatic as boolean = false
		var idttyp as Managed.Reflection.Type
		var fldinf as FieldInfo
		var restrord as integer = 2
		var isbyref as boolean = false

		if idtnamarr[0] == "me" then
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
		if (idtnamarr[l] == 1) andalso !idt::IsArr then
			SymTable::StoreFlg = true
			vr = SymTable::FindVar(idtnamarr[0])
			SymTable::StoreFlg = false
			if vr isnot null then
				ASTEmit(ConvToAST(ConvToRPN(exp)),false)
				isbyref = vr::VarTyp::get_IsByRef() and !AsmFactory::Type02::get_IsByRef()
			end if
		end if

		if idt::IsArr orelse isbyref then
			restrord--
			len++
		end if

		vr = null
		if idtnamarr[l] >= restrord then
			AsmFactory::AddrFlg = true

			do until i == len
				i++

				if !idtb2 then
					if !idtb1 then
						vr = SymTable::FindVar(idtnamarr[i])
						if vr isnot null then
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
					if fldinf isnot null then
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

					if idttyp is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Variable or Class '{0}' is not defined.", idtnamarr[i]))
					end if

				else
					if idttyp::Equals(AsmFactory::CurnTypB) then
						fldinf = Helpers::GetLocFld(idtnamarr[i])
						if fldinf is null then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", idtnamarr[i], AsmFactory::CurnTypB::ToString()))
						end if
						idttyp = fldinf::get_FieldType()
						AsmFactory::Type04 = idttyp
					else
						fldinf = Helpers::GetExtFld(idttyp, idtnamarr[i])
						if fldinf is null then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", idtnamarr[i], idttyp::ToString()))
						end if
						idttyp = Loader::MemberTyp
						AsmFactory::Type04 = idttyp
					end if

					if idtisstatic != fldinf::get_IsStatic() then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' defined for the class '{1}' " _
							,idtnamarr[i], fldinf::get_DeclaringType()::ToString()) + #ternary {idtisstatic andalso !fldinf::get_IsStatic() ? "is an instance field.", "is static."})
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
				if idtb1 then
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf isnot null then
						idtisstatic = fldinf::get_IsStatic()
						if !idtisstatic then
							ILEmitter::EmitLdarg(0)
						end if
					end if
				else
					SymTable::StoreFlg = true
					vr = SymTable::FindVar(idtnamarr[i])
					SymTable::StoreFlg = false
					if vr == null then
						fldinf = Helpers::GetLocFld(idtnamarr[i])
						if fldinf isnot null then
							idtisstatic = fldinf::get_IsStatic()
							if !idtisstatic then
								ILEmitter::EmitLdarg(0)
							end if
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
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, "Array Indices should be of a Primitive Integer Type.")
			end if

			ILEmitter::EmitConvI()
		end if
		//--------------------------------------------

		//--------------------------------------------------------------
		//loading of value to store
		Evaluate(exp)
		//--------------------------------------------------------------

		var outt as Managed.Reflection.Type = AsmFactory::Type02

		if idt::IsArr then
			if !idttyp::get_IsArray() then
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("'{0}' is not an Array Type.", idttyp::ToString()))
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
					if vr isnot null then
						Helpers::CheckAssignability(vr::VarTyp, outt)
						Helpers::EmitLocSt(vr::Index, vr::LocArg)
						vr::Stored = true
						vr::StoreLines::Add(ILEmitter::LineNr)
					end if
				end if
				if vr is null then
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Variable or Field '{0}' is not defined for the current class/method.", idtnamarr[i]))
					else
						if fldinf::get_IsInitOnly() andalso !AsmFactory::InCtorFlg then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is declared as readonly and may only be set from constructors.", idtnamarr[i]))
						elseif fldinf::get_IsLiteral() then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is declared as a constant and may not be set again.", idtnamarr[i]))
						end if
						idtisstatic = fldinf::get_IsStatic()

						if !idtisstatic andalso ILEmitter::StaticFlg then
							StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is an instance field and cannot be used from a static method without an instance being provided.", idtnamarr[i]))
						end if

						Helpers::CheckAssignability(fldinf::get_FieldType(), outt)
						Helpers::EmitFldSt(fldinf, idtisstatic)
					end if
				end if
			else
				if idttyp::Equals(AsmFactory::CurnTypB) then
					fldinf = Helpers::GetLocFld(idtnamarr[i])
					if fldinf is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", idtnamarr[i], AsmFactory::CurnTypB::ToString()))
					end if
				else
					fldinf = Helpers::GetExtFld(idttyp, idtnamarr[i])
					if fldinf is null then
						StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", idtnamarr[i], idttyp::ToString()))
					end if
				end if
				if fldinf::get_IsInitOnly() then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' is declared as readonly and may not be set from this context.", idtnamarr[i]))
				elseif idtisstatic != fldinf::get_IsStatic() then
					StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Field '{0}' defined for the class '{1}' " _
						,idtnamarr[i], idttyp::ToString()) + #ternary {idtisstatic andalso !fldinf::get_IsStatic() ? "is an instance field.", "is static."})
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
				return EvaluateHIf(o::LChild) orelse EvaluateHIf(o::RChild)
			elseif o is AndOp then
				return EvaluateHIf(o::LChild) andalso EvaluateHIf(o::RChild)
			elseif o is OrElseOp then
				return EvaluateHIf(o::LChild) orelse EvaluateHIf(o::RChild)
			elseif o is AndAlsoOp then
				return EvaluateHIf(o::LChild) andalso EvaluateHIf(o::RChild)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("The operator '{0}' is not supported when using #if and #elseif.", o::ToString()))
			end if
		elseif rt is Ident then
			var b = SymTable::EvalDef(rt::Value)
			return #ternary{#expr($Ident$rt)::get_DoNeg() ? !b, b}
		elseif rt is BooleanLiteral then
			var bl as BooleanLiteral = $BooleanLiteral$rt
			return #ternary{bl::get_DoNeg() ? !bl::BoolVal, bl::BoolVal}
		else
			StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, string::Format("Tokens of type '{0}' are not supported when using #if and #elseif.", rt::GetType()::ToString()))
		end if
		return false
	end method

	method public boolean EvaluateHIf(var exp as Expr) => EvaluateHIf(ConvToAST(ConvToRPN(exp)))

end class
