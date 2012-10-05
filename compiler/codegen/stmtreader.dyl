//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtReader

	method public CustomAttributeBuilder AttrStmtToCAB(var stm as AttrStmt)
		var typ as IKVM.Reflection.Type = null
		if stm::Ctor::Name::Value::EndsWith("Attribute") == false then
			typ = Helpers::CommitEvalTTok(new TypeTok(stm::Ctor::Name::Value + "Attribute"))
		end if
		if typ == null then
			typ = Helpers::CommitEvalTTok(stm::Ctor::Name)
		end if
		if typ == null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Attribute Class '" + stm::Ctor::Name::ToString() +"' was not found.")
		end if
		var tarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[stm::Ctor::Params[l]]
		var oarr as object[] = new object[stm::Ctor::Params[l]]
		
		var litt as Type = gettype Literal
		var idtt as Type = gettype Ident
		var gtct as Type = gettype GettypeCallTok
		
		var i as integer = -1
		do until i = (stm::Ctor::Params[l] - 1)
			i = i + 1
			if litt::IsInstanceOfType(stm::Ctor::Params[i]::Tokens[0]) then
				var lit as Literal = $Literal$stm::Ctor::Params[i]::Tokens[0]
				tarr[i] = Helpers::CommitEvalTTok(lit::LitTyp)
				oarr[i] = Helpers::LiteralToConst(lit)
			elseif idtt::IsInstanceOfType(stm::Ctor::Params[i]::Tokens[0]) then
				var idt as Ident = $Ident$stm::Ctor::Params[i]::Tokens[0]
				var idtnamarr as string[] = ParseUtils::StringParser(idt::Value, ":")
				var constcls as IKVM.Reflection.Type = Helpers::CommitEvalTTok(new TypeTok(idtnamarr[0]))
				var fldinf as FieldInfo = Helpers::GetExtFld(constcls, idtnamarr[1])
				if Loader::FldLitFlag and (fldinf != null) then
					tarr[i] = Loader::FldLitTyp
					oarr[i] = Loader::FldLitVal
				end if
			elseif gtct::IsInstanceOfType(stm::Ctor::Params[i]::Tokens[0]) then
				var gtc as GettypeCallTok = $GettypeCallTok$stm::Ctor::Params[i]::Tokens[0]
				tarr[i] = ILEmitter::Univ::Import(gettype Type)
				oarr[i] = Helpers::CommitEvalTTok(gtc::Name)
			end if
		end do
		
		var piarr as List<of PropertyInfo> = new List<of PropertyInfo>()
		var poarr as List<of object> = new List<of object>()
		var fiarr as List<of FieldInfo> = new List<of FieldInfo>()
		var foarr as List<of object> = new List<of object>()
		var tempprop as PropertyInfo = null
		var tempfld as FieldInfo = null
		
		i = -1
		do until i = (stm::Pairs[l] - 1)
			i = i + 1
			var multflg as boolean = true
			tempprop = Helpers::GetExtProp(typ,stm::Pairs[i]::Name::Value)
			if tempprop != null then
				piarr::Add(tempprop)
			else
				tempfld = Helpers::GetExtFld(typ,stm::Pairs[i]::Name::Value)
				if tempfld != null then
					fiarr::Add(tempfld)
					multflg = false
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Property or Field " + stm::Pairs[i]::Name::Value + " does not exist in the attribute class " + typ::ToString())
				end if
			end if
				
			if litt::IsInstanceOfType(stm::Pairs[i]::ValueExpr::Tokens[0]) then
				var lit2 as Literal = $Literal$stm::Pairs[i]::ValueExpr::Tokens[0]
				if multflg then
					poarr::Add(Helpers::LiteralToConst(lit2))
				else
					foarr::Add(Helpers::LiteralToConst(lit2))
				end if
			elseif idtt::IsInstanceOfType(stm::Pairs[i]::ValueExpr::Tokens[0]) then
				var idt2 as Ident = $Ident$stm::Pairs[i]::ValueExpr::Tokens[0]
				var idtnamarr2 as string[] = ParseUtils::StringParser(idt2::Value, ":")
				var constcls2 as IKVM.Reflection.Type = Helpers::CommitEvalTTok(new TypeTok(idtnamarr2[0]))
				var fldinf2 as FieldInfo = Helpers::GetExtFld(constcls2, idtnamarr2[1])
				if Loader::FldLitFlag and (fldinf2 != null) then
					if multflg then
						poarr::Add(Loader::FldLitVal)
					else
						foarr::Add(Loader::FldLitVal)
					end if
				end if
			elseif gtct::IsInstanceOfType(stm::Pairs[i]::ValueExpr::Tokens[0]) then
				var gtc2 as GettypeCallTok = $GettypeCallTok$stm::Pairs[i]::ValueExpr::Tokens[0]
				if multflg then
					poarr::Add(Helpers::CommitEvalTTok(gtc2::Name))
				else
					foarr::Add(Helpers::CommitEvalTTok(gtc2::Name))
				end if
			end if
		end do
		
		var ctor as ConstructorInfo = Helpers::GetLocCtor(typ,tarr)
		return new CustomAttributeBuilder(ctor, oarr, Enumerable::ToArray<of PropertyInfo>(piarr), Enumerable::ToArray<of object>(poarr), Enumerable::ToArray<of FieldInfo>(fiarr), Enumerable::ToArray<of object>(foarr))
	end method

	method public void Read(var stm as Stmt, var fpath as string)

		var t as Type[] = new Type[46]
		t[0] = gettype RefasmStmt
		t[1] = gettype RefstdasmStmt
		t[2] = gettype ImportStmt
		t[3] = gettype LocimportStmt
		t[4] = gettype AssemblyStmt
		t[5] = gettype VerStmt
		t[6] = gettype DebugStmt
		t[7] = gettype ClassStmt
		t[8] = gettype DelegateStmt
		t[9] = gettype FieldStmt
		t[10] = gettype EndClassStmt
		t[11] = gettype MethodStmt
		t[12] = gettype EndMethodStmt
		t[13] = gettype ReturnStmt
		t[14] = gettype VarStmt
		t[15] = gettype VarAsgnStmt
		t[16] = gettype NSStmt
		t[17] = gettype EndNSStmt
		t[18] = gettype AssignStmt
		t[19] = gettype MethodCallStmt
		t[20] = gettype IfStmt
		t[21] = gettype DoStmt
		t[22] = gettype BreakStmt
		t[23] = gettype ContinueStmt
		t[24] = gettype UntilStmt
		t[25] = gettype WhileStmt
		t[26] = gettype DoUntilStmt
		t[27] = gettype DoWhileStmt
		t[28] = gettype ElseIfStmt
		t[29] = gettype ElseStmt
		t[30] = gettype EndIfStmt
		t[31] = gettype EndDoStmt
		t[32] = gettype LabelStmt
		t[33] = gettype PlaceStmt
		t[34] = gettype GotoStmt
		t[35] = gettype CommentStmt
		t[36] = gettype ThrowStmt
		t[37] = gettype TryStmt
		t[38] = gettype EndTryStmt
		t[39] = gettype FinallyStmt
		t[40] = gettype CatchStmt
		t[41] = gettype MethodAttrStmt
		t[42] = gettype FieldAttrStmt
		t[43] = gettype ClassAttrStmt
		t[44] = gettype AssemblyAttrStmt
		t[45] = gettype ForeachStmt
		
		var tmpchrarr as char[]
		var vtyp as IKVM.Reflection.Type = null
		var typ as IKVM.Reflection.Type = null
		var eval as Evaluator = null
		var i as integer

		AsmFactory::ChainFlg = false
		ILEmitter::LineNr = stm::Line
		ILEmitter::CurSrcFile = fpath
		SymTable::StoreFlg = false

		if AsmFactory::DebugFlg then
			if AsmFactory::InMethodFlg then
				ILEmitter::MarkDbgPt(stm::Line)
			end if
		end if

		if t[0]::IsInstanceOfType(stm) then
			var rastm as RefasmStmt = $RefasmStmt$stm
			if rastm::AsmPath::Value like  c"^\q(.)*\q$" then
				tmpchrarr = new char[1]
				tmpchrarr[0] = c'\q'
				rastm::AsmPath::Value = rastm::AsmPath::Value::Trim(tmpchrarr)
			end if
			rastm::AsmPath::Value = ParseUtils::ProcessMSYSPath(rastm::AsmPath::Value)
			StreamUtils::Write("Referencing Assembly: ")
			StreamUtils::WriteLine(rastm::AsmPath::Value)
			Importer::AddAsm(ILEmitter::Univ::LoadFile(rastm::AsmPath::Value))
		elseif t[1]::IsInstanceOfType(stm) then
			var rsastm as RefstdasmStmt = $RefstdasmStmt$stm
			if rsastm::AsmPath::Value like c"^\q(.)*\q$" then
				tmpchrarr = new char[1]
				tmpchrarr[0] = c'\q'
				rsastm::AsmPath::Value = rsastm::AsmPath::Value::Trim(tmpchrarr)
			end if
			rsastm::AsmPath::Value = ParseUtils::ProcessMSYSPath(rsastm::AsmPath::Value)
			rsastm::AsmPath::Value = Path::Combine(RuntimeEnvironment::GetRuntimeDirectory(), rsastm::AsmPath::Value)
			StreamUtils::Write("Referencing Assembly: ")
			StreamUtils::WriteLine(rsastm::AsmPath::Value)
			Importer::AddAsm(ILEmitter::Univ::LoadFile(rsastm::AsmPath::Value))
		elseif t[2]::IsInstanceOfType(stm) then
			var istm as ImportStmt = $ImportStmt$stm
			if istm::NS::Value like c"^\q(.)*\q$" then
				tmpchrarr = new char[1]
				tmpchrarr[0] = c'\q'
				istm::NS::Value = istm::NS::Value::Trim(tmpchrarr)
			end if
			if istm::Alias::Value::get_Length() != 0 then
				if istm::Alias::Value like c"^\q(.)*\q$" then
					tmpchrarr = new char[1]
					tmpchrarr[0] = c'\q'
					istm::Alias::Value = istm::Alias::Value::Trim(tmpchrarr)
				end if
			end if
			if istm::Alias::Value::get_Length() == 0 then
				StreamUtils::Write("Importing Namespace: ")
				StreamUtils::WriteLine(istm::NS::Value)
				Importer::AddImp(istm::NS::Value)
			else
				StreamUtils::WriteLine("Aliasing '" + istm::Alias::Value + "' to Namespace: " + istm::NS::Value)
				Importer::RegisterAlias(istm::Alias::Value,istm::NS::Value)
			end if
		elseif t[3]::IsInstanceOfType(stm) then
			var listm as LocimportStmt = $LocimportStmt$stm
			if listm::NS::Value like c"^\q(.)*\q$" then
				tmpchrarr = new char[1]
				tmpchrarr[0] = c'\q'
				listm::NS::Value = listm::NS::Value::Trim(tmpchrarr)
			end if
			
			StreamUtils::Write("Importing Namespace: ")
			StreamUtils::WriteLine(listm::NS::Value)
			Importer::AddLocImp(listm::NS::Value)
		elseif t[4]::IsInstanceOfType(stm) then
			var asms as AssemblyStmt = $AssemblyStmt$stm
			AsmFactory::AsmNameStr = new AssemblyName(asms::AsmName::Value)
			AsmFactory::AsmMode = asms::Mode::Value
			AsmFactory::DfltNS = asms::AsmName::Value
			AsmFactory::CurnNS = asms::AsmName::Value
			StreamUtils::Write("Beginning Assembly: ")
			StreamUtils::WriteLine(asms::AsmName::Value)
		elseif t[5]::IsInstanceOfType(stm) then
			var asmv as VerStmt = $VerStmt$stm
			AsmFactory::AsmNameStr::set_Version(new Version(asmv::VersionNos[0]::NumVal, asmv::VersionNos[1]::NumVal, asmv::VersionNos[2]::NumVal, asmv::VersionNos[3]::NumVal))
			var aasv as AssemblyBuilderAccess = AssemblyBuilderAccess::Save
			AsmFactory::AsmB = ILEmitter::Univ::DefineDynamicAssembly(AsmFactory::AsmNameStr, aasv, Directory::GetCurrentDirectory())
			AsmFactory::MdlB = AsmFactory::AsmB::DefineDynamicModule(AsmFactory::AsmNameStr::get_Name() + "." + AsmFactory::AsmMode, AsmFactory::AsmNameStr::get_Name() + "." + AsmFactory::AsmMode, AsmFactory::DebugFlg)

			if AsmFactory::DebugFlg then
				fpath = Path::GetFullPath(fpath)
				//Console::WriteLine(fpath)
				var docw as ISymbolDocumentWriter = AsmFactory::MdlB::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
				ILEmitter::DocWriter = docw
				ILEmitter::AddDocWriter(docw)
			end if

			// --------------------------------------------------------------------------------------------------------
			if AsmFactory::DebugFlg then
				var dtyp as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype DebuggableAttribute)
				var debugattr as DebuggableAttribute\DebuggingModes = DebuggableAttribute\DebuggingModes::Default or DebuggableAttribute\DebuggingModes::DisableOptimizations
				var oattr as object = $object$debugattr
				var dattyp as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype DebuggableAttribute\DebuggingModes)
				var tarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[1]
				tarr[0] = dattyp
				var oarr as object[] = new object[1]
				oarr[0] = oattr
				AsmFactory::AsmB::SetCustomAttribute(new CustomAttributeBuilder(dtyp::GetConstructor(tarr), oarr))
			end if
			// --------------------------------------------------------------------------------------------------------
			
			Helpers::ApplyAsmAttrs()
			SymTable::ResetAsmCAs()
			
			AsmFactory::AsmFile = AsmFactory::AsmNameStr::get_Name() + "." + AsmFactory::AsmMode
			Importer::AddAsm(AsmFactory::AsmB)
		elseif t[6]::IsInstanceOfType(stm) then
			var dbgs as DebugStmt = $DebugStmt$stm
			AsmFactory::DebugFlg = dbgs::Flg
		elseif t[7]::IsInstanceOfType(stm) then
			var clss as ClassStmt = $ClassStmt$stm
			ILEmitter::StructFlg = false
			ILEmitter::InterfaceFlg = false
			ILEmitter::StaticCFlg = false
			
			if AsmFactory::inClass then
				AsmFactory::isNested = true
			end if
			if AsmFactory::isNested = false then
				AsmFactory::inClass = true
			end if

			var inhtyp as IKVM.Reflection.Type = null
			var interftyp as IKVM.Reflection.Type = null
			var reft as IKVM.Reflection.Type  = clss::InhClass::RefTyp

			if reft = null then
				if clss::InhClass::Value::get_Length() = 0 then
					inhtyp = ILEmitter::Univ::Import(gettype object)
				else
					inhtyp = Helpers::CommitEvalTTok(clss::InhClass)
				end if
			else
				inhtyp = reft 
			end if
			if inhtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Base Class '" + clss::InhClass::Value + "' is not defined or is not accessible.")
			end if
			if inhtyp != null then
				if inhtyp::get_IsSealed() then
					inhtyp = null
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + clss::InhClass::Value + "' is not inheritable.")
				end if
			end if
			ILEmitter::StructFlg = inhtyp::Equals(ILEmitter::Univ::Import(gettype ValueType))
			var clssparams as TypeAttributes = Helpers::ProcessClassAttrs(clss::Attrs)
			
			if ILEmitter::InterfaceFlg then
				inhtyp = null
			end if
			
			AsmFactory::CurnInhTyp = inhtyp
			if AsmFactory::isNested = false then
				AsmFactory::CurnTypName = clss::ClassName::Value
				AsmFactory::CurnTypB = AsmFactory::MdlB::DefineType(AsmFactory::CurnNS + "." + clss::ClassName::Value, clssparams, inhtyp)
				StreamUtils::Write("Adding Class: ")
				StreamUtils::WriteLine(AsmFactory::CurnNS + "." + clss::ClassName::Value)
			else
				AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
				StreamUtils::Write("Adding Nested Class: ")
				StreamUtils::WriteLine(clss::ClassName::Value)
				AsmFactory::CurnTypName = clss::ClassName::Value
				AsmFactory::CurnTypB = AsmFactory::CurnTypB2::DefineNestedType(clss::ClassName::Value, clssparams, inhtyp)
			end if
			
			Helpers::ApplyClsAttrs()
			SymTable::ResetClsCAs()

			var ti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + clss::ClassName::Value,AsmFactory::CurnTypB)
			ti::InhTyp = inhtyp
			SymTable::CurnTypItem = ti
			SymTable::TypeLst::AddType(ti)

			i = -1
			do until i = (clss::ImplInterfaces[l] - 1)
				i = i + 1
				interftyp = Helpers::CommitEvalTTok(clss::ImplInterfaces[i])
				if interftyp = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + clss::InhClass::Value + "' is not defined or is not accessible.")
				end if
				AsmFactory::CurnTypB::AddInterfaceImplementation(interftyp)

				ti::AddInterface(interftyp)
			end do

		elseif t[8]::IsInstanceOfType(stm) then
			var dels as DelegateStmt = $DelegateStmt$stm
			
			ILEmitter::StructFlg = false
			ILEmitter::InterfaceFlg = false
			ILEmitter::StaticCFlg = false
			
			if AsmFactory::inClass then
				AsmFactory::isNested = true
			end if
			if AsmFactory::isNested = false then
				AsmFactory::inClass = true
			end if

			var dta as TypeAttributes = Helpers::ProcessClassAttrs(dels::Attrs)
			dta = dta or TypeAttributes::AnsiClass or TypeAttributes::Sealed or TypeAttributes::AutoClass
			var dinhtyp as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype MulticastDelegate)
			AsmFactory::CurnInhTyp = dinhtyp

			if AsmFactory::isNested = false then
				AsmFactory::CurnTypName = dels::DelegateName::Value
				AsmFactory::CurnTypB = AsmFactory::MdlB::DefineType(AsmFactory::CurnNS + "." + dels::DelegateName::Value, dta, dinhtyp)
				StreamUtils::Write("Adding Delegate: ")
				StreamUtils::WriteLine(AsmFactory::CurnNS + "." + dels::DelegateName::Value)
			else
				AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
				StreamUtils::Write("Adding Nested Delegate: ")
				StreamUtils::WriteLine(dels::DelegateName::Value)
				AsmFactory::CurnTypName = dels::DelegateName::Value
				AsmFactory::CurnTypB = AsmFactory::CurnTypB2::DefineNestedType(dels::DelegateName::Value, dta, dinhtyp)
			end if
			
			Helpers::ApplyClsAttrs()
			SymTable::ResetClsCAs()

			var dti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + dels::DelegateName::Value,AsmFactory::CurnTypB)
			dti::InhTyp = dinhtyp
			SymTable::CurnTypItem = dti

			SymTable::ResetVar()
			SymTable::ResetIf()
			SymTable::ResetLoop()
			SymTable::ResetLbl()

			var dema as MethodAttributes = MethodAttributes::HideBySig or MethodAttributes::Public
			var stdcc as CallingConventions = CallingConventions::Standard
			var dtarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
			dtarr[0] = ILEmitter::Univ::Import(gettype object)
			dtarr[1] = ILEmitter::Univ::Import(gettype IntPtr)
			
			AsmFactory::CurnConB = AsmFactory::CurnTypB::DefineConstructor(dema, stdcc, dtarr)
			AsmFactory::InitDelConstr()

			SymTable::CurnTypItem::AddCtor(new CtorItem(dtarr,AsmFactory::CurnConB))

			AsmFactory::TypArr = new IKVM.Reflection.Type[0]
			dema = MethodAttributes::HideBySig or MethodAttributes::Public or MethodAttributes::NewSlot or MethodAttributes::Virtual
			if dels::Params[l] = 0 then
				dtarr = IKVM.Reflection.Type::EmptyTypes
			else
				Helpers::ProcessParams(dels::Params)
				dtarr = AsmFactory::TypArr
			end if
			
			var drettyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(dels::RetTyp)
			
			if drettyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + dels::RetTyp::Value + "' is not defined or is not accessible.")
			end if

			AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod("Invoke", dema, drettyp, dtarr)
			AsmFactory::InitDelMet()
			Helpers::PostProcessParams(dels::Params)

			SymTable::CurnTypItem::AddMethod(new MethodItem("Invoke",drettyp,dtarr,AsmFactory::CurnMetB))

			var dtarr2 as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[dtarr[l] + 2]
			Array::Copy(dtarr,dtarr2,$long$dtarr[l])
			dtarr2[dtarr2[l] - 2] = ILEmitter::Univ::Import(gettype AsyncCallback)
			dtarr2[dtarr2[l] - 1] = ILEmitter::Univ::Import(gettype object)

			AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod("BeginInvoke", dema, ILEmitter::Univ::Import(gettype IAsyncResult), dtarr2)
			AsmFactory::InitDelMet()

			SymTable::CurnTypItem::AddMethod(new MethodItem("BeginInvoke",ILEmitter::Univ::Import(gettype IAsyncResult),dtarr2,AsmFactory::CurnMetB))

			var iter as integer = -1
			var lis as IList<of IKVM.Reflection.Type> = new List<of IKVM.Reflection.Type>()
			do until iter = (dtarr[l] - 1)
				iter = iter + 1
				if dtarr[iter]::get_IsByRef() then
					lis::Add(dtarr[iter])
				end if
			end do
			dtarr = Enumerable::ToArray<of IKVM.Reflection.Type>(lis)

			var dtarr3 as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[dtarr[l] + 1]
			Array::Copy(dtarr,dtarr3,$long$dtarr[l])
			dtarr3[dtarr3[l] - 1] = ILEmitter::Univ::Import(gettype IAsyncResult)

			AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod("EndInvoke", dema, drettyp, dtarr3)
			AsmFactory::InitDelMet()

			SymTable::CurnTypItem::AddMethod(new MethodItem("EndInvoke",drettyp,dtarr3,AsmFactory::CurnMetB))

			SymTable::TypeLst::AddType(dti)

			AsmFactory::CreateTyp()
			if AsmFactory::isNested then
				AsmFactory::CurnTypB = AsmFactory::CurnTypB2
				AsmFactory::isNested = false
				SymTable::ResetNestedMet()
				SymTable::ResetNestedCtor()
				SymTable::ResetNestedFld()
			else
				AsmFactory::inClass = false
			end if
		elseif t[9]::IsInstanceOfType(stm) then
			
			var flss as FieldStmt = $FieldStmt$stm
			var ftyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(flss::FieldTyp)
			
			if ftyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + flss::FieldTyp::Value + "' is not defined.")
			end if
			
			AsmFactory::CurnFldB = AsmFactory::CurnTypB::DefineField(flss::FieldName::Value, ftyp, Helpers::ProcessFieldAttrs(flss::Attrs))
			
			Helpers::ApplyFldAttrs()
			SymTable::ResetFldCAs()
			
			if AsmFactory::isNested then
				SymTable::AddNestedFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB)
			else
				SymTable::AddFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB)
			end if

			StreamUtils::Write("	Adding Field: ")
			StreamUtils::WriteLine(flss::FieldName::Value)

		elseif t[10]::IsInstanceOfType(stm) then
			SymTable::TypeLst::EnsureDefaultCtor(AsmFactory::CurnTypB)
			AsmFactory::CreateTyp()
			if AsmFactory::isNested then
				AsmFactory::CurnTypB = AsmFactory::CurnTypB2
				AsmFactory::isNested = false
				SymTable::ResetNestedMet()
				SymTable::ResetNestedCtor()
				SymTable::ResetNestedFld()
			else
				AsmFactory::inClass = false
			end if
		elseif t[11]::IsInstanceOfType(stm) then
			var mtss as MethodStmt = $MethodStmt$stm
			ILEmitter::StaticFlg = false
			ILEmitter::AbstractFlg = false
			SymTable::ResetVar()
			SymTable::ResetIf()
			SymTable::ResetLbl()

			var mtssnamstr as string = mtss::MethodName::Value
			var rettyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(mtss::RetTyp)
			
			if rettyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + mtss::RetTyp::Value + "' is not defined or is not accessible.")
			end if

			AsmFactory::TypArr = new IKVM.Reflection.Type[0]

			if mtss::Params[l] != 0 then
				Helpers::ProcessParams(mtss::Params)
			end if

			var paramstyps as IKVM.Reflection.Type[] = AsmFactory::TypArr
			var mtssnamarr as C5.IList<of string>
			var overldnam as string = String::Empty
			var overldmtd as MethodInfo = null

			if (mtssnamstr = AsmFactory::CurnTypName) or (mtssnamstr like "^ctor\d*$") then
				StreamUtils::Write("	Adding Constructor: ")
				StreamUtils::WriteLine(mtssnamstr)
				var stdcallconv as CallingConventions = CallingConventions::Standard
				AsmFactory::CurnConB = AsmFactory::CurnTypB::DefineConstructor(Helpers::ProcessMethodAttrs(mtss::Attrs), stdcallconv, AsmFactory::TypArr)
				AsmFactory::InitConstr()
				if AsmFactory::isNested then
					SymTable::AddNestedCtor(AsmFactory::TypArr, AsmFactory::CurnConB)
				else
					SymTable::AddCtor(AsmFactory::TypArr, AsmFactory::CurnConB)
				end if
				if mtss::Params[l] != 0 then
					Helpers::PostProcessParamsConstr(mtss::Params)
				end if
				AsmFactory::InCtorFlg = true
			else
				StreamUtils::Write("	Adding Method: ")
				StreamUtils::WriteLine(mtssnamstr)

				mtssnamarr = ParseUtils::StringParserL(mtssnamstr, ".")
				if mtssnamarr::get_Count() > 1 then
					//Console::WriteLine(mtssnamarr::get_Count())
					overldnam = mtssnamarr::get_Last()
					typ = Helpers::CommitEvalTTok(new TypeTok(String::Join(".", mtssnamarr::View(0,mtssnamarr::get_Count() - 1)::ToArray())))
					mtssnamstr = typ::ToString() + "." + overldnam
				end if

				AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod(mtssnamstr, Helpers::ProcessMethodAttrs(mtss::Attrs), rettyp, AsmFactory::TypArr)
				AsmFactory::InitMtd()

				if mtssnamarr::get_Count() > 1 then
					overldmtd = Helpers::GetExtMet(typ, new MethodNameTok(overldnam), paramstyps)
					AsmFactory::CurnTypB::DefineMethodOverride(AsmFactory::CurnMetB, overldmtd)
				end if

				if AsmFactory::isNested then
					SymTable::AddNestedMet(mtssnamstr, rettyp, AsmFactory::TypArr, AsmFactory::CurnMetB)
				else
					SymTable::AddMet(mtssnamstr, rettyp, AsmFactory::TypArr, AsmFactory::CurnMetB)
				end if
				if mtss::Params[l] != 0 then
					Helpers::PostProcessParams(mtss::Params)
				end if
			end if
			
			Helpers::ApplyMetAttrs()
			SymTable::ResetMetCAs()
			
			if ILEmitter::AbstractFlg = false then
				AsmFactory::InMethodFlg = true
			end if
			AsmFactory::CurnMetName = mtssnamstr
			
		elseif t[12]::IsInstanceOfType(stm) then
			AsmFactory::InMethodFlg = false
			AsmFactory::InCtorFlg = false
			if ILEmitter::AbstractFlg = false then
				ILEmitter::EmitRet()
				SymTable::CheckUnusedVar()
				if AsmFactory::CurnMetName = "main" then
					if AsmFactory::AsmMode = "exe" then
						AsmFactory::AsmB::SetEntryPoint(ILEmitter::Met)
					end if
				end if
			end if
		elseif t[13]::IsInstanceOfType(stm) then
			var retstmt as ReturnStmt = $ReturnStmt$stm
			if retstmt::RExp != null then
				eval = new Evaluator()
				eval::Evaluate(retstmt::RExp)
				Helpers::CheckAssignability(AsmFactory::CurnMetB::get_ReturnType(), AsmFactory::Type02)
			end if
			ILEmitter::EmitRet()
		elseif t[14]::IsInstanceOfType(stm) then
			var curv as VarStmt = $VarStmt$stm
			vtyp = Helpers::CommitEvalTTok(curv::VarTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curv::VarTyp::Value + "' is not defined.")
			end if
			ILEmitter::DeclVar(curv::VarName::Value, vtyp)
			ILEmitter::LocInd = ILEmitter::LocInd + 1
			SymTable::AddVar(curv::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
		elseif t[15]::IsInstanceOfType(stm) then
			var curva as VarAsgnStmt = $VarAsgnStmt$stm
			vtyp = Helpers::CommitEvalTTok(curva::VarTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curva::VarTyp::Value + "' is not defined.")
			end if
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd = ILEmitter::LocInd + 1
			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			eval = new Evaluator()
			eval::StoreEmit(curva::VarName, curva::RExpr)
			//SymTable::ResetUsed(curva::VarName::Value)
		elseif t[16]::IsInstanceOfType(stm) then
			var nss as NSStmt = $NSStmt$stm
			if nss::NS::Value like c"^\q(.)*\q$" then
				tmpchrarr = new char[1]
				tmpchrarr[0] = c'\q'
				nss::NS::Value = nss::NS::Value::Trim(tmpchrarr)
			end if
			AsmFactory::CurnNS = nss::NS::Value
		elseif t[17]::IsInstanceOfType(stm) then
			AsmFactory::CurnNS = AsmFactory::DfltNS
		elseif t[18]::IsInstanceOfType(stm) then
			var asgnstm as AssignStmt = $AssignStmt$stm
			eval = new Evaluator()
			eval::StoreEmit(asgnstm::LExp::Tokens[0], asgnstm::RExp)
		elseif t[19]::IsInstanceOfType(stm) then
			var mcstmt as MethodCallStmt = $MethodCallStmt$stm
			var mcstmtexp as Expr = new Expr()
			if Helpers::SetPopFlg(mcstmt::MethodToken) != null then
				mcstmtexp::AddToken(mcstmt::MethodToken)
				eval = new Evaluator()
				eval::Evaluate(mcstmtexp)
			else
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No variable/field loads are allowed without a destination being specified")
			end if
		elseif t[20]::IsInstanceOfType(stm) then
			var ifstm as IfStmt = $IfStmt$stm
			SymTable::AddIf()
			SymTable::PushScope()
			eval = new Evaluator()
			eval::Evaluate(ifstm::Exp)
			ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
		elseif t[21]::IsInstanceOfType(stm) then
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
		elseif t[22]::IsInstanceOfType(stm) then
			ILEmitter::EmitBr(SymTable::ReadLoopEndLbl())
		elseif t[23]::IsInstanceOfType(stm) then
			ILEmitter::EmitBr(SymTable::ReadLoopStartLbl())
		elseif t[24]::IsInstanceOfType(stm) then
			var unstm as UntilStmt = $UntilStmt$stm
			eval = new Evaluator()
			eval::Evaluate(unstm::Exp)
			ILEmitter::EmitBrfalse(SymTable::ReadLoopStartLbl())
			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif t[25]::IsInstanceOfType(stm) then
			var whstm as WhileStmt = $WhileStmt$stm
			eval = new Evaluator()
			eval::Evaluate(whstm::Exp)
			ILEmitter::EmitBrtrue(SymTable::ReadLoopStartLbl())
			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif t[26]::IsInstanceOfType(stm) then
			var dustm as DoUntilStmt = $DoUntilStmt$stm
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
			eval = new Evaluator()
			eval::Evaluate(dustm::Exp)
			ILEmitter::EmitBrtrue(SymTable::ReadLoopEndLbl())
		elseif t[27]::IsInstanceOfType(stm) then
			var dwstm as DoWhileStmt = $DoWhileStmt$stm
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
			eval = new Evaluator()
			eval::Evaluate(dwstm::Exp)
			ILEmitter::EmitBrfalse(SymTable::ReadLoopEndLbl())
		elseif t[28]::IsInstanceOfType(stm) then
			ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
			ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			SymTable::SetIfNxtBlkLbl()
			var elifstm as ElseIfStmt = $ElseIfStmt$stm
			SymTable::PopScope()
			SymTable::PushScope()
			eval = new Evaluator()
			eval::Evaluate(elifstm::Exp)
			ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
		elseif t[29]::IsInstanceOfType(stm) then
			ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
			ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			SymTable::SetIfElsePass()
			SymTable::PopScope()
			SymTable::PushScope()
		elseif t[30]::IsInstanceOfType(stm) then
			if SymTable::ReadIfElsePass() = false then
				ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			end if
			ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
			SymTable::PopIf()
			SymTable::PopScope()
		elseif t[31]::IsInstanceOfType(stm) then
			ILEmitter::EmitBr(SymTable::ReadLoopStartLbl())
			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif t[32]::IsInstanceOfType(stm) then
			var lblstm as LabelStmt = $LabelStmt$stm
			SymTable::AddLbl(lblstm::LabelName::Value)
		elseif t[33]::IsInstanceOfType(stm) then
			var plcstm as PlaceStmt = $PlaceStmt$stm
			ILEmitter::MarkLbl(Helpers::GetLbl(plcstm::LabelName::Value))
		elseif t[34]::IsInstanceOfType(stm) then
			var gtostm as GotoStmt = $GotoStmt$stm
			ILEmitter::EmitBr(Helpers::GetLbl(gtostm::LabelName::Value))
		elseif t[35]::IsInstanceOfType(stm) then
		elseif t[36]::IsInstanceOfType(stm) then
			var trostmt as ThrowStmt = $ThrowStmt$stm
			if trostmt::RExp != null then
				eval = new Evaluator()
				eval::Evaluate(trostmt::RExp)
				ILEmitter::EmitThrow()
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No exception to throw specified")
			end if
		elseif t[37]::IsInstanceOfType(stm) then
			SymTable::PushScope()
			ILEmitter::EmitTry()
		elseif t[38]::IsInstanceOfType(stm) then
			ILEmitter::EmitEndTry()
			SymTable::PopScope()
		elseif t[39]::IsInstanceOfType(stm) then
			SymTable::PopScope()
			SymTable::PushScope()
			ILEmitter::EmitFinally()
		elseif t[40]::IsInstanceOfType(stm) then
			SymTable::PopScope()
			SymTable::PushScope()
			var cats as CatchStmt = $CatchStmt$stm
			vtyp = Helpers::CommitEvalTTok(cats::ExTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + cats::ExTyp::Value + "' is not defined.")
			end if
			ILEmitter::DeclVar(cats::ExName::Value, vtyp)
			ILEmitter::LocInd = ILEmitter::LocInd + 1
			SymTable::AddVar(cats::ExName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			ILEmitter::EmitCatch(vtyp)
			ILEmitter::EmitStloc(SymTable::FindVar(cats::ExName::Value)::Index)
		elseif t[41]::IsInstanceOfType(stm) then
			SymTable::AddMtdCA(AttrStmtToCAB($MethodAttrStmt$stm))
		elseif t[42]::IsInstanceOfType(stm) then
			SymTable::AddFldCA(AttrStmtToCAB($FieldAttrStmt$stm))
		elseif t[43]::IsInstanceOfType(stm) then
			SymTable::AddClsCA(AttrStmtToCAB($ClassAttrStmt$stm))
		elseif t[44]::IsInstanceOfType(stm) then
			SymTable::AddAsmCA(AttrStmtToCAB($AssemblyAttrStmt$stm))
		elseif t[45]::IsInstanceOfType(stm) then
			var festm as ForeachStmt = $ForeachStmt$stm
			SymTable::PushScope()
			eval = new Evaluator()
			eval::Evaluate(festm::Exp)
			var mtds as MethodInfo[] = Helpers::ProcessForeach(AsmFactory::Type02)
			if mtds = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class " + AsmFactory::Type02::ToString() + " is not an IEnumerable or IEnumerable<of T>.")
			end if
			ILEmitter::EmitCallvirt(mtds[0])
			ILEmitter::DeclVar(String::Empty, mtds[0]::get_ReturnType())
			ILEmitter::LocInd = ILEmitter::LocInd + 1
			var ien as integer = ILEmitter::LocInd
			ILEmitter::EmitStloc(ien)
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
			ILEmitter::EmitLdloc(ien)
			ILEmitter::EmitCallvirt(mtds[1])
			ILEmitter::EmitBrfalse(SymTable::ReadLoopEndLbl())
			ILEmitter::DeclVar(festm::Iter::Value, mtds[2]::get_ReturnType())
			ILEmitter::LocInd = ILEmitter::LocInd + 1
			SymTable::AddVar(festm::Iter::Value, true, ILEmitter::LocInd, mtds[2]::get_ReturnType(), ILEmitter::LineNr)
			ILEmitter::EmitLdloc(ien)
			ILEmitter::EmitCallvirt(mtds[2])
			ILEmitter::EmitStloc(ILEmitter::LocInd)
		else
			StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Processing of this type of statement is not supported.")
		end if
		return
	end method

end class
