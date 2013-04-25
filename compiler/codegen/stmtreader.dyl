//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtReader

	method public CustomAttributeBuilder AttrStmtToCAB(var stm as AttrStmt)
		var typ as IKVM.Reflection.Type = null
		if !stm::Ctor::Name::Value::EndsWith("Attribute") then
			typ = Helpers::CommitEvalTTok(new TypeTok(stm::Ctor::Name::Value + "Attribute"))
		end if
		if typ == null then
			typ = Helpers::CommitEvalTTok(stm::Ctor::Name)
		end if
		if typ == null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The Attribute Class '" + stm::Ctor::Name::ToString() + "' was not found.")
		end if
		
		if typ::Equals(ILEmitter::Univ::Import(gettype DllImportAttribute)) then
			SymTable::PIInfo = new PInvokeInfo() {LibName = $string$Helpers::LiteralToConst($Literal$stm::Ctor::Params::get_Item(0)::Tokens::get_Item(0))}
			return null
		end if
		
		var tarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[stm::Ctor::Params::get_Count()]
		var oarr as object[] = new object[stm::Ctor::Params::get_Count()]
		
		var i as integer = -1
		foreach param in stm::Ctor::Params
			i++
			if param::Tokens::get_Item(0) is Literal then
				var lit as Literal = $Literal$param::Tokens::get_Item(0)
				tarr[i] = Helpers::CommitEvalTTok(lit::LitTyp)
				oarr[i] = Helpers::LiteralToConst(lit)
			elseif param::Tokens::get_Item(0) is Ident then
				var idtnamarr as string[] = ParseUtils::StringParser(#expr($Ident$param::Tokens::get_Item(0))::Value, ":")
				if  Helpers::GetExtFld(Helpers::CommitEvalTTok(new TypeTok(idtnamarr[0])), idtnamarr[1]) != null then
					if Loader::FldLitFlag then
						tarr[i] = Loader::FldLitTyp
						oarr[i] = Loader::FldLitVal
					end if
				end if
			elseif param::Tokens::get_Item(0) is GettypeCallTok then
				tarr[i] = ILEmitter::Univ::Import(gettype Type)
				oarr[i] = Helpers::CommitEvalTTok(#expr($GettypeCallTok$param::Tokens::get_Item(0))::Name)
			end if
		end for
		
		var piarr as C5.IList<of PropertyInfo> = new C5.LinkedList<of PropertyInfo>()
		var poarr as C5.IList<of object> = new C5.LinkedList<of object>()
		var fiarr as C5.IList<of FieldInfo> = new C5.LinkedList<of FieldInfo>()
		var foarr as C5.IList<of object> = new C5.LinkedList<of object>()
		var tempprop as PropertyInfo = null
		var tempfld as FieldInfo = null
		
		i = -1
		foreach curpair in stm::Pairs
			i++
			var multflg as boolean = true
			tempprop = Helpers::GetExtProp(typ,curpair::Name::Value)
			if tempprop != null then
				piarr::Add(tempprop)
			else
				tempfld = Helpers::GetExtFld(typ,curpair::Name::Value)
				if tempfld != null then
					fiarr::Add(tempfld)
					multflg = false
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Property or Field " + curpair::Name::Value + " does not exist in the attribute class " + typ::ToString())
				end if
			end if
				
			if curpair::ValueExpr::Tokens::get_Item(0) is Literal then
				var lit2 as Literal = $Literal$curpair::ValueExpr::Tokens::get_Item(0)
				if multflg then
					poarr::Add(Helpers::LiteralToConst(lit2))
				else
					foarr::Add(Helpers::LiteralToConst(lit2))
				end if
			elseif curpair::ValueExpr::Tokens::get_Item(0) is Ident then
				var idtnamarr2 as string[] = ParseUtils::StringParser(#expr($Ident$curpair::ValueExpr::Tokens::get_Item(0))::Value, ":")
				if Helpers::GetExtFld(Helpers::CommitEvalTTok(new TypeTok(idtnamarr2[0])), idtnamarr2[1]) != null then
					if Loader::FldLitFlag then
						if multflg then
							poarr::Add(Loader::FldLitVal)
						else
							foarr::Add(Loader::FldLitVal)
						end if
					end if
				end if
			elseif curpair::ValueExpr::Tokens::get_Item(0) is GettypeCallTok then
				var gtc2 as GettypeCallTok = $GettypeCallTok$curpair::ValueExpr::Tokens::get_Item(0)
				if multflg then
					poarr::Add(Helpers::CommitEvalTTok(gtc2::Name))
				else
					foarr::Add(Helpers::CommitEvalTTok(gtc2::Name))
				end if
			end if
		end for
		
		return new CustomAttributeBuilder(Helpers::GetLocCtor(typ,tarr), oarr, piarr::ToArray(), poarr::ToArray(), fiarr::::ToArray(), foarr::ToArray())
	end method

	method public void Read(var stm as Stmt, var fpath as string)
		
		var vtyp as IKVM.Reflection.Type = null
		var typ as IKVM.Reflection.Type = null
		var eval as Evaluator = null

		AsmFactory::ChainFlg = false
		ILEmitter::LineNr = stm::Line
		ILEmitter::CurSrcFile = fpath
		SymTable::StoreFlg = false

		if AsmFactory::DebugFlg then
			if AsmFactory::InMethodFlg then
				ILEmitter::MarkDbgPt(stm::Line)
			end if
		end if

		if stm is RefasmStmt then
			var rastm as RefasmStmt = $RefasmStmt$stm
			if rastm::AsmPath::Value like  c"^\q(.)*\q$" then
				rastm::AsmPath::Value = rastm::AsmPath::Value::Trim(new char[] {c'\q'})
			end if
			rastm::AsmPath::Value = ParseUtils::ProcessMSYSPath(rastm::AsmPath::Value)
			
			if !File::Exists(rastm::AsmPath::Value) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Assembly File '" + rastm::AsmPath::Value + "' does not exist.")
			end if
			
			StreamUtils::Write("Referencing Assembly: ")
			StreamUtils::WriteLine(rastm::AsmPath::Value)
			Importer::AddAsm(ILEmitter::Univ::LoadFile(rastm::AsmPath::Value))
		elseif stm is RefstdasmStmt then
			var rsastm as RefstdasmStmt = $RefstdasmStmt$stm
			if rsastm::AsmPath::Value like c"^\q(.)*\q$" then
				rsastm::AsmPath::Value = rsastm::AsmPath::Value::Trim(new char[] {c'\q'})
			end if
			rsastm::AsmPath::Value = Path::Combine(RuntimeEnvironment::GetRuntimeDirectory(), ParseUtils::ProcessMSYSPath(rsastm::AsmPath::Value))
			
			if !File::Exists(rsastm::AsmPath::Value) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Assembly File '" + rsastm::AsmPath::Value + "' does not exist.")
			end if
			
			StreamUtils::Write("Referencing Assembly: ")
			StreamUtils::WriteLine(rsastm::AsmPath::Value)
			Importer::AddAsm(ILEmitter::Univ::LoadFile(rsastm::AsmPath::Value))
		elseif stm is ImportStmt then
			var istm as ImportStmt = $ImportStmt$stm
			if istm::NS::Value like c"^\q(.)*\q$" then
				istm::NS::Value = istm::NS::Value::Trim(new char[] {c'\q'})
			end if
			if istm::Alias::Value::get_Length() != 0 then
				if istm::Alias::Value like c"^\q(.)*\q$" then
					istm::Alias::Value = istm::Alias::Value::Trim(new char[] {c'\q'})
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
		elseif stm is LocimportStmt then
			var listm as LocimportStmt = $LocimportStmt$stm
			if listm::NS::Value like c"^\q(.)*\q$" then
				listm::NS::Value = listm::NS::Value::Trim(new char[] {c'\q'})
			end if
			
			StreamUtils::Write("Importing Namespace: ")
			StreamUtils::WriteLine(listm::NS::Value)
			Importer::AddImp(listm::NS::Value)
		elseif stm is AssemblyStmt then
			var asms as AssemblyStmt = $AssemblyStmt$stm
			AsmFactory::AsmNameStr = new AssemblyName(asms::AsmName::Value)
			AsmFactory::AsmMode = asms::Mode::Value
			AsmFactory::DfltNS = asms::AsmName::Value
			AsmFactory::CurnNS = asms::AsmName::Value
			StreamUtils::Write("Beginning Assembly: ")
			StreamUtils::WriteLine(asms::AsmName::Value)
			SymTable::TypeLst = new TypeList()
		elseif stm is VerStmt then
			var asmv as VerStmt = $VerStmt$stm
			AsmFactory::AsmNameStr::set_Version(asmv::ToVersion())
			AsmFactory::AsmB = ILEmitter::Univ::DefineDynamicAssembly(AsmFactory::AsmNameStr, AssemblyBuilderAccess::Save, Directory::GetCurrentDirectory())
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
				var dattyp as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype DebuggableAttribute\DebuggingModes)
				AsmFactory::AsmB::SetCustomAttribute(new CustomAttributeBuilder(dtyp::GetConstructor(new IKVM.Reflection.Type[] {dattyp}), new object[] {$object$debugattr}))
			end if
			// --------------------------------------------------------------------------------------------------------
			
			Helpers::ApplyAsmAttrs()
			SymTable::ResetAsmCAs()
			
			AsmFactory::AsmFile = AsmFactory::AsmNameStr::get_Name() + "." + AsmFactory::AsmMode
			Importer::AddAsm(AsmFactory::AsmB)
		elseif stm is DebugStmt then
			var dbgs as DebugStmt = $DebugStmt$stm
			AsmFactory::DebugFlg = dbgs::Flg
			if dbgs::Flg then
				SymTable::AddDef("DEBUG")
			end if
		elseif stm is ClassStmt then
			var clss as ClassStmt = $ClassStmt$stm
			ILEmitter::StructFlg = false
			ILEmitter::PartialFlg = false
			ILEmitter::InterfaceFlg = false
			ILEmitter::StaticCFlg = false
			ILEmitter::AbstractCFlg = false
			
			if AsmFactory::inClass then
				AsmFactory::isNested = true
			end if
			if AsmFactory::isNested = false then
				AsmFactory::inClass = true
			end if

			var inhtyp as IKVM.Reflection.Type = null
			var interftyp as IKVM.Reflection.Type = null
			var reft as IKVM.Reflection.Type  = clss::InhClass::RefTyp
			
			var ti2 as TypeItem = SymTable::TypeLst::GetTypeItem(AsmFactory::CurnNS + "." + clss::ClassName::Value)
			
			if ti2 == null then
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
			else
				inhtyp = ti2::InhTyp
			end if
			
			ILEmitter::StructFlg = inhtyp::Equals(ILEmitter::Univ::Import(gettype ValueType))
			var clssparams as TypeAttributes = TypeAttributes::Class
			
			if ti2 == null then
				clssparams = Helpers::ProcessClassAttrs(clss::Attrs)
				if ILEmitter::InterfaceFlg then
					inhtyp = null
				end if
			else
				ILEmitter::InterfaceFlg = ti2::TypeBldr::get_IsInterface()
				ILEmitter::AbstractCFlg = ti2::TypeBldr::get_IsAbstract()
				ILEmitter::StaticCFlg = ti2::IsStatic
				foreach attr in clss::Attrs
					if attr is Attributes.PartialAttr then
						ILEmitter::PartialFlg = true
						break
					end if
				end for
			end if
			
			AsmFactory::CurnInhTyp = inhtyp
			
			if ti2 == null then
				if !AsmFactory::isNested then
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
			else
				SymTable::CurnTypItem = ti2
				AsmFactory::CurnTypB = ti2::TypeBldr
				AsmFactory::CurnTypName = clss::ClassName::Value
				StreamUtils::Write("Continuing Class: ")
				StreamUtils::WriteLine(AsmFactory::CurnNS + "." + clss::ClassName::Value)
			end if
			
			Helpers::ApplyClsAttrs()
			SymTable::ResetClsCAs()

			if ti2 == null then
				var ti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + clss::ClassName::Value, AsmFactory::CurnTypB) {InhTyp = inhtyp, IsStatic = ILEmitter::StaticCFlg}
				SymTable::CurnTypItem = ti
				SymTable::TypeLst::AddType(ti)

				foreach interf in clss::ImplInterfaces
					interftyp = Helpers::CommitEvalTTok(interf)
					if interftyp = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + interf::Value + "' is not defined or is not accessible.")
					elseif !interftyp::get_IsInterface() then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + interftyp::ToString() + "' is not an interface.")
					end if
					AsmFactory::CurnTypB::AddInterfaceImplementation(interftyp)

					ti::AddInterface(interftyp)
					foreach interfa in Helpers::GetTypeInterfaces(interftyp)
						ti::AddInterface(interfa)
					end for
				end for
				ti::NormalizeInterfaces()
			end if

		elseif stm is DelegateStmt then
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

			var dta as TypeAttributes = Helpers::ProcessClassAttrs(dels::Attrs) or TypeAttributes::AnsiClass or TypeAttributes::Sealed or TypeAttributes::AutoClass
			var dinhtyp as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype MulticastDelegate)
			AsmFactory::CurnInhTyp = dinhtyp

			if !AsmFactory::isNested then
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

			var dti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + dels::DelegateName::Value,AsmFactory::CurnTypB) {InhTyp = dinhtyp}
			SymTable::CurnTypItem = dti

			SymTable::ResetVar()
			SymTable::ResetIf()
			SymTable::ResetLoop()
			SymTable::ResetLbl()

			var dema as MethodAttributes = MethodAttributes::HideBySig or MethodAttributes::Public
			var stdcc as CallingConventions = CallingConventions::Standard
			var dtarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[] {ILEmitter::Univ::Import(gettype object), ILEmitter::Univ::Import(gettype IntPtr)}
			AsmFactory::CurnConB = AsmFactory::CurnTypB::DefineConstructor(dema, stdcc, dtarr)
			AsmFactory::InitDelConstr()

			SymTable::CurnTypItem::AddCtor(new CtorItem(dtarr,AsmFactory::CurnConB))

			dema = MethodAttributes::HideBySig or MethodAttributes::Public or MethodAttributes::NewSlot or MethodAttributes::Virtual
			dtarr = #ternary {dels::Params[l] == 0 ? IKVM.Reflection.Type::EmptyTypes, Helpers::ProcessParams(dels::Params)}
			
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
			dtarr2[--dtarr2[l]] = ILEmitter::Univ::Import(gettype object)

			AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod("BeginInvoke", dema, ILEmitter::Univ::Import(gettype IAsyncResult), dtarr2)
			AsmFactory::InitDelMet()

			SymTable::CurnTypItem::AddMethod(new MethodItem("BeginInvoke",ILEmitter::Univ::Import(gettype IAsyncResult),dtarr2,AsmFactory::CurnMetB))

			var iter as integer = -1
			var lis as IList<of IKVM.Reflection.Type> = new List<of IKVM.Reflection.Type>()
			do until iter = --dtarr[l]
				iter = ++iter
				if dtarr[iter]::get_IsByRef() then
					lis::Add(dtarr[iter])
				end if
			end do
			dtarr = Enumerable::ToArray<of IKVM.Reflection.Type>(lis)

			var dtarr3 as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[++dtarr[l]]
			Array::Copy(dtarr,dtarr3,$long$dtarr[l])
			dtarr3[--dtarr3[l]] = ILEmitter::Univ::Import(gettype IAsyncResult)

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
		elseif stm is FieldStmt then
			var flss as FieldStmt = $FieldStmt$stm
			var ftyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(flss::FieldTyp)
			
			if ftyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + flss::FieldTyp::Value + "' is not defined.")
			end if
			
			AsmFactory::CurnFldB = AsmFactory::CurnTypB::DefineField(flss::FieldName::Value, ftyp, Helpers::ProcessFieldAttrs(flss::Attrs))
			
			if ILEmitter::InterfaceFlg then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Interfaces should not have Fields!")
			elseif !AsmFactory::CurnFldB::get_IsStatic() and ILEmitter::StaticCFlg then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Fields!")
			end if
			
			Helpers::ApplyFldAttrs()
			SymTable::ResetFldCAs()
			
			if AsmFactory::isNested then
				SymTable::AddNestedFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB)
			else
				SymTable::AddFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB)
			end if

			StreamUtils::Write("	Adding Field: ")
			StreamUtils::WriteLine(flss::FieldName::Value)
		elseif stm is EndClassStmt then
			if AsmFactory::isNested then
				SymTable::TypeLst::EnsureDefaultCtor(AsmFactory::CurnTypB)
				AsmFactory::CreateTyp()
				AsmFactory::CurnTypB = AsmFactory::CurnTypB2
				AsmFactory::isNested = false
				SymTable::ResetNestedMet()
				SymTable::ResetNestedCtor()
				SymTable::ResetNestedFld()
			else
				if !ILEmitter::PartialFlg then
					SymTable::TypeLst::EnsureDefaultCtor(AsmFactory::CurnTypB)
					AsmFactory::CreateTyp()
				end if
				AsmFactory::inClass = false
			end if
		elseif stm is MethodStmt then
			var mtss as MethodStmt = $MethodStmt$stm
			ILEmitter::StaticFlg = false
			ILEmitter::AbstractFlg = false
			ILEmitter::ProtoFlg = false
			ILEmitter::PInvokeFlg = false
			SymTable::ResetVar()
			SymTable::ResetIf()
			SymTable::ResetLbl()

			var mtssnamstr as string = mtss::MethodName::Value
			var rettyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(mtss::RetTyp)
			
			if rettyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + mtss::RetTyp::Value + "' is not defined or is not accessible.")
			end if

			var paramstyps as IKVM.Reflection.Type[] = #ternary {mtss::Params[l] == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}			
			var mtssnamarr as C5.IList<of string>
			var overldnam as string = String::Empty
			var overldmtd as MethodInfo = null
			var mipt as MethodItem = null
			var fromproto as boolean = false

			if (mtssnamstr = AsmFactory::CurnTypName) or (mtssnamstr like "^ctor\d*$") then
				StreamUtils::Write("	Adding Constructor: ")
				StreamUtils::WriteLine(mtssnamstr)
				AsmFactory::CurnConB = AsmFactory::CurnTypB::DefineConstructor(Helpers::ProcessMethodAttrs(mtss::Attrs), CallingConventions::Standard, paramstyps)
				AsmFactory::InitConstr()
				
				if ILEmitter::InterfaceFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Interfaces should not have Constructors!")
				elseif AsmFactory::CurnConB::get_IsPublic() and ILEmitter::AbstractCFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Abstract Classes should not have Publicly Visible Constructors!")
				elseif !ILEmitter::StaticFlg and ILEmitter::StaticCFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Constructors but only Type Initializers!")
				elseif ILEmitter::StaticFlg and (paramstyps[l] != 0) then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type Initializers should NOT have any Parameters!")
				end if
				
				if AsmFactory::isNested then
					SymTable::AddNestedCtor(paramstyps, AsmFactory::CurnConB)
				else
					SymTable::AddCtor(paramstyps, AsmFactory::CurnConB)
				end if
				if mtss::Params[l] != 0 then
					Helpers::PostProcessParamsConstr(mtss::Params)
				end if
				AsmFactory::InCtorFlg = true
			else
				mtssnamarr = ParseUtils::StringParserL(mtssnamstr, ".")
				if mtssnamarr::get_Count() > 1 then
					//Console::WriteLine(mtssnamarr::get_Count())
					overldnam = mtssnamarr::get_Last()
					typ = Helpers::CommitEvalTTok(new TypeTok(string::Join(".", mtssnamarr::View(0,--mtssnamarr::get_Count())::ToArray())))
					mtssnamstr = typ::ToString() + "." + overldnam
				end if
				
				mipt = SymTable::FindProtoMet(mtssnamstr, paramstyps)
				fromproto = mipt != null
				
				if fromproto then
					StreamUtils::Write("	Continuing Method: ")
					StreamUtils::WriteLine(mtssnamstr)
					AsmFactory::CurnMetB = mipt::MethodBldr
					ILEmitter::StaticFlg = AsmFactory::CurnMetB::get_IsStatic()
					ILEmitter::AbstractFlg = AsmFactory::CurnMetB::get_IsAbstract()
				else
					StreamUtils::Write("	Adding Method: ")
					StreamUtils::WriteLine(mtssnamstr)
					var ma = Helpers::ProcessMethodAttrs(mtss::Attrs)
					var pinfo = SymTable::PIInfo
					AsmFactory::CurnMetB = #ternary {ILEmitter::PInvokeFlg ? _
						AsmFactory::CurnTypB::DefinePInvokeMethod(mtssnamstr, pinfo::LibName, ma, CallingConventions::Standard, rettyp, paramstyps, pinfo::CallConv, pinfo::CSet), _
						AsmFactory::CurnTypB::DefineMethod(mtssnamstr, ma, rettyp, paramstyps)}
				end if
				
				if !ILEmitter::ProtoFlg then
					var pbrv as ParameterBuilder = AsmFactory::CurnMetB::DefineParameter(0, IKVM.Reflection.ParameterAttributes::Retval, $string$null)
					if Enumerable::Contains<of integer>(SymTable::ParameterCALst::get_Keys(), 0) then
						foreach ca in SymTable::ParameterCALst::get_Item(0)
							pbrv::SetCustomAttribute(ca)
						end for
					end if
					
					if ILEmitter::PInvokeFlg then
						AsmFactory::InitPInvokeMtd()
					else
						AsmFactory::InitMtd()
					end if
					
					if ILEmitter::InterfaceFlg and !ILEmitter::AbstractFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Methods in Interfaces should all be Abstract!")
					elseif ILEmitter::InterfaceFlg and ILEmitter::StaticFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Methods in Interfaces should not be Static!")
					elseif !ILEmitter::StaticFlg and ILEmitter::StaticCFlg then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Methods!")
					end if

					if mtssnamarr::get_Count() > 1 then
						overldmtd = Helpers::GetExtMet(typ, new MethodNameTok(overldnam), paramstyps)
						AsmFactory::CurnTypB::DefineMethodOverride(AsmFactory::CurnMetB, overldmtd)
					end if
				end if
				
				if !fromproto then
					if AsmFactory::isNested then
						SymTable::AddNestedMet(mtssnamstr, rettyp, paramstyps, AsmFactory::CurnMetB)
					else
						SymTable::AddMet(mtssnamstr, rettyp, paramstyps, AsmFactory::CurnMetB)
					end if
				end if
				
				if !ILEmitter::ProtoFlg then
					if mtss::Params[l] != 0 then
						Helpers::PostProcessParams(mtss::Params)
					end if
				end if
			end if
			
			Helpers::ApplyMetAttrs()
			SymTable::ResetMetCAs()
			
			if !#expr(ILEmitter::AbstractFlg or ILEmitter::ProtoFlg or ILEmitter::PInvokeFlg) then
				AsmFactory::InMethodFlg = true
			end if
			AsmFactory::CurnMetName = mtssnamstr
			
		elseif stm is EndMethodStmt then
			AsmFactory::InMethodFlg = false
			AsmFactory::InCtorFlg = false
			if !#expr(ILEmitter::AbstractFlg or ILEmitter::ProtoFlg or ILEmitter::PInvokeFlg) then
				ILEmitter::EmitRet()
				SymTable::CheckUnusedVar()
				SymTable::CheckCtrlBlks()
				if AsmFactory::CurnMetName == "main" then
					if AsmFactory::AsmMode == "exe" then
						AsmFactory::AsmB::SetEntryPoint(ILEmitter::Met)
					end if
				end if
			end if
		elseif stm is ReturnStmt then
			var retstmt as ReturnStmt = $ReturnStmt$stm
			if retstmt::RExp != null then
				new Evaluator()::Evaluate(retstmt::RExp)
				Helpers::CheckAssignability(AsmFactory::CurnMetB::get_ReturnType(), AsmFactory::Type02)
			end if
			ILEmitter::EmitRet()
		elseif stm is VarStmt then
			var curv as VarStmt = $VarStmt$stm
			vtyp = Helpers::CommitEvalTTok(curv::VarTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curv::VarTyp::ToString() + "' is not defined.")
			end if
			ILEmitter::DeclVar(curv::VarName::Value, vtyp)
			ILEmitter::LocInd = ++ILEmitter::LocInd
			SymTable::AddVar(curv::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
		elseif stm is VarAsgnStmt then
			var curva as VarAsgnStmt = $VarAsgnStmt$stm
			vtyp = Helpers::CommitEvalTTok(curva::VarTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curva::VarTyp::ToString() + "' is not defined.")
			end if
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd = ++ILEmitter::LocInd
			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			new Evaluator()::StoreEmit(curva::VarName, curva::RExpr)
		elseif stm is InfVarAsgnStmt then
			var curva as InfVarAsgnStmt = $InfVarAsgnStmt$stm
			eval = new Evaluator()
			vtyp = eval::EvaluateType(curva::RExpr)
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd = ++ILEmitter::LocInd
			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			eval::StoreEmit(curva::VarName, curva::RExpr)
		elseif stm is NSStmt then
			var nss as NSStmt = $NSStmt$stm
			if nss::NS::Value like c"^\q(.)*\q$" then
				nss::NS::Value = nss::NS::Value::Trim(new char[] {c'\q'})
			end if
			AsmFactory::CurnNS = nss::NS::Value
		elseif stm is EndNSStmt then
			AsmFactory::CurnNS = AsmFactory::DfltNS
		elseif stm is AssignStmt then
			var asgnstm as AssignStmt = $AssignStmt$stm
			new Evaluator()::StoreEmit(asgnstm::LExp::Tokens::get_Item(0), asgnstm::RExp)
		elseif stm is MethodCallStmt then
			var mcstmt as MethodCallStmt = $MethodCallStmt$stm
			if Helpers::SetPopFlg(mcstmt::MethodToken) != null then
				new Evaluator()::Evaluate(new Expr() {AddToken(mcstmt::MethodToken)})
			else
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No variable/field loads are allowed without a destination being specified")
			end if
		elseif stm is IfStmt then
			var ifstm as IfStmt = $IfStmt$stm
			SymTable::AddIf()
			SymTable::PushScope()
			new Evaluator()::Evaluate(ifstm::Exp)
			if !AsmFactory::Type02::Equals(ILEmitter::Univ::Import(gettype boolean)) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for If Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
		elseif stm is DoStmt then
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
		elseif stm is BreakStmt then
			ILEmitter::EmitBr(SymTable::ReadLoopEndLbl())
		elseif stm is ContinueStmt then
			ILEmitter::EmitBr(SymTable::ReadLoopStartLbl())
		elseif stm is UntilStmt then
			var unstm as UntilStmt = $UntilStmt$stm
			new Evaluator()::Evaluate(unstm::Exp)
			if !AsmFactory::Type02::Equals(ILEmitter::Univ::Import(gettype boolean)) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Until Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrfalse(SymTable::ReadLoopStartLbl())
			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif stm is WhileStmt then
			var whstm as WhileStmt = $WhileStmt$stm
			new Evaluator()::Evaluate(whstm::Exp)
			if !AsmFactory::Type02::Equals(ILEmitter::Univ::Import(gettype boolean)) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for While Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrtrue(SymTable::ReadLoopStartLbl())
			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif stm is DoUntilStmt then
			var dustm as DoUntilStmt = $DoUntilStmt$stm
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
			new Evaluator()::Evaluate(dustm::Exp)
			if !AsmFactory::Type02::Equals(ILEmitter::Univ::Import(gettype boolean)) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Do Until Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrtrue(SymTable::ReadLoopEndLbl())
		elseif stm is DoWhileStmt then
			var dwstm as DoWhileStmt = $DoWhileStmt$stm
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
			new Evaluator()::Evaluate(dwstm::Exp)
			if !AsmFactory::Type02::Equals(ILEmitter::Univ::Import(gettype boolean)) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Do While Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrfalse(SymTable::ReadLoopEndLbl())
		elseif stm is ElseIfStmt then
			ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
			ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			SymTable::SetIfNxtBlkLbl()
			var elifstm as ElseIfStmt = $ElseIfStmt$stm
			SymTable::PopScope()
			SymTable::PushScope()
			new Evaluator()::Evaluate(elifstm::Exp)
			if !AsmFactory::Type02::Equals(ILEmitter::Univ::Import(gettype boolean)) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for ElseIf Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
		elseif stm is ElseStmt then
			ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
			ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			SymTable::SetIfElsePass()
			SymTable::PopScope()
			SymTable::PushScope()
		elseif stm is EndIfStmt then
			if !SymTable::ReadIfElsePass() then
				ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			end if
			ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
			SymTable::PopIf()
			SymTable::PopScope()
		elseif stm is EndDoStmt then
			ILEmitter::EmitBr(SymTable::ReadLoopStartLbl())
			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif stm is LabelStmt then
			SymTable::AddLbl(#expr($LabelStmt$stm)::LabelName::Value)
		elseif stm is PlaceStmt then
			ILEmitter::MarkLbl(Helpers::GetLbl(#expr($PlaceStmt$stm)::LabelName::Value))
		elseif stm is GotoStmt then
			ILEmitter::EmitBr(Helpers::GetLbl(#expr($GotoStmt$stm)::LabelName::Value))
		elseif stm is CommentStmt then
		elseif stm is ThrowStmt then
			var trostmt as ThrowStmt = $ThrowStmt$stm
			if trostmt::RExp != null then
				new Evaluator()::Evaluate(trostmt::RExp)
				if !ILEmitter::Univ::Import(gettype Exception)::IsAssignableFrom(AsmFactory::Type02) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + AsmFactory::Type02::ToString() + "' is not an Exception Type.")
				end if
				ILEmitter::EmitThrow()
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No exception to throw specified")
			end if
		elseif stm is TryStmt then
			SymTable::PushScope()
			ILEmitter::EmitTry()
		elseif stm is EndTryStmt then
			ILEmitter::EmitEndTry()
			SymTable::PopScope()
		elseif stm is FinallyStmt then
			SymTable::PopScope()
			SymTable::PushScope()
			ILEmitter::EmitFinally()
		elseif stm is CatchStmt then
			SymTable::PopScope()
			SymTable::PushScope()
			var cats as CatchStmt = $CatchStmt$stm
			vtyp = Helpers::CommitEvalTTok(cats::ExTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + cats::ExTyp::Value + "' is not defined.")
			end if
			ILEmitter::DeclVar(cats::ExName::Value, vtyp)
			ILEmitter::LocInd++
			SymTable::StoreFlg = true
			SymTable::AddVar(cats::ExName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			SymTable::StoreFlg = false
			ILEmitter::EmitCatch(vtyp)
			ILEmitter::EmitStloc(SymTable::FindVar(cats::ExName::Value)::Index)
		elseif stm is MethodAttrStmt then
			SymTable::AddMtdCA(AttrStmtToCAB($MethodAttrStmt$stm))
		elseif stm is FieldAttrStmt then
			SymTable::AddFldCA(AttrStmtToCAB($FieldAttrStmt$stm))
		elseif stm is ClassAttrStmt then
			SymTable::AddClsCA(AttrStmtToCAB($ClassAttrStmt$stm))
		elseif stm is AssemblyAttrStmt then
			SymTable::AddAsmCA(AttrStmtToCAB($AssemblyAttrStmt$stm))
		elseif stm is ForeachStmt then
			var festm as ForeachStmt = $ForeachStmt$stm
			SymTable::PushScope()
			new Evaluator()::Evaluate(festm::Exp)
			var mtds as MethodInfo[] = Helpers::ProcessForeach(AsmFactory::Type02)
			var ttu = Helpers::CommitEvalTTok(festm::Typ)
			if (ttu == null) and (festm::Typ != null) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + festm::Typ::ToString() + "' is not defined.")
			end if
			var ttu2 as IKVM.Reflection.Type
			if mtds != null then
				ILEmitter::EmitCallvirt(mtds[0])
				ILEmitter::DeclVar(string::Empty, mtds[0]::get_ReturnType())
				ILEmitter::LocInd++
				var ien as integer = ILEmitter::LocInd
				ILEmitter::EmitStloc(ien)
				SymTable::AddLoop()
				ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
				ILEmitter::EmitLdloc(ien)
				ILEmitter::EmitCallvirt(mtds[1])
				ILEmitter::EmitBrfalse(SymTable::ReadLoopEndLbl())
				ttu2 = #ternary {ttu == null ? mtds[2]::get_ReturnType(), ttu}
				ILEmitter::DeclVar(festm::Iter::Value, ttu2)
				ILEmitter::LocInd++
				SymTable::StoreFlg = true
				SymTable::AddVar(festm::Iter::Value, true, ILEmitter::LocInd, ttu2, ILEmitter::LineNr)
				SymTable::StoreFlg = false
				ILEmitter::EmitLdloc(ien)
				ILEmitter::EmitCallvirt(mtds[2])
				if ttu != null then
					Helpers::EmitConv(mtds[2]::get_ReturnType(), ttu)
				end if
				ILEmitter::EmitStloc(ILEmitter::LocInd)
			else
				mtds = Helpers::ProcessForeach2(AsmFactory::Type02)
				if mtds != null then
					ILEmitter::DeclVar(string::Empty, AsmFactory::Type02)
					ILEmitter::LocInd++
					var ien as integer = ILEmitter::LocInd
					ILEmitter::EmitStloc(ien)
					SymTable::AddLoop()
					ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
					ILEmitter::EmitLdloc(ien)
					ILEmitter::EmitCallvirt(mtds[0])
					ILEmitter::EmitBrfalse(SymTable::ReadLoopEndLbl())
					ttu2 = #ternary {ttu == null ? mtds[1]::get_ReturnType(), ttu}
					ILEmitter::DeclVar(festm::Iter::Value, ttu2)
					ILEmitter::LocInd++
					SymTable::StoreFlg = true
					SymTable::AddVar(festm::Iter::Value, true, ILEmitter::LocInd, ttu2, ILEmitter::LineNr)
					SymTable::StoreFlg = false
					ILEmitter::EmitLdloc(ien)
					ILEmitter::EmitCallvirt(mtds[1])
					if ttu != null then
						Helpers::EmitConv(mtds[1]::get_ReturnType(), ttu)
					end if
					ILEmitter::EmitStloc(ILEmitter::LocInd)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class " + AsmFactory::Type02::ToString() + " is not an IEnumerable/IEnumerator or IEnumerable<of T>/IEnumerator<of T>.")
				end if
			end if
		elseif stm is HDefineStmt then
			SymTable::AddDef(#expr($HDefineStmt$stm)::Symbol::Value)
		elseif stm is HUndefStmt then
			SymTable::UnDef(#expr($HUndefStmt$stm)::Symbol::Value)
		elseif stm is WarningStmt then
			var wstm as WarningStmt = $WarningStmt$stm
			if wstm::Msg::Value like c"^\q(.)*\q$" then
				wstm::Msg::Value = wstm::Msg::Value::Trim(new char[] {c'\q'})
			end if
			StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, wstm::Msg::Value)
		elseif stm is ErrorStmt then
			var wstm as ErrorStmt = $ErrorStmt$stm
			if wstm::Msg::Value like c"^\q(.)*\q$" then
				wstm::Msg::Value = wstm::Msg::Value::Trim(new char[] {c'\q'})
			end if
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, wstm::Msg::Value)
		elseif stm is ParameterAttrStmt then
			var pas as ParameterAttrStmt = $ParameterAttrStmt$stm
			SymTable::AddParamCA(pas::Index,AttrStmtToCAB(pas))
		elseif stm is PropertyStmt then
			var prss as PropertyStmt = $PropertyStmt$stm
			var ptyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(prss::PropertyTyp)
			AsmFactory::CurnExplImplType = string::Empty
			
			if ptyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + prss::PropertyTyp::Value + "' is not defined.")
			end if
			
			var prssnamstr as string = prss::PropertyName::Value
			var prssnamarr as C5.IList<of string> = ParseUtils::StringParserL(prssnamstr, ".")
			var propoverldnam as string = string::Empty
			var propnam = prssnamstr
			if prssnamarr::get_Count() > 1 then
				propoverldnam = prssnamarr::get_Last()
				propnam = propoverldnam
				typ = Helpers::CommitEvalTTok(new TypeTok(string::Join(".", prssnamarr::View(0,--prssnamarr::get_Count())::ToArray())))
				AsmFactory::CurnExplImplType = typ::ToString()
				prssnamstr = typ::ToString() + "." + propoverldnam
			end if
			
			AsmFactory::CurnPropB = AsmFactory::CurnTypB::DefineProperty(prssnamstr,PropertyAttributes::None, ptyp, IKVM.Reflection.Type::EmptyTypes)
			SymTable::CurnProp = new PropertyItem(propnam, ptyp, AsmFactory::CurnPropB, prss::Attrs, AsmFactory::CurnExplImplType)
			
			Helpers::ApplyPropAttrs()
			SymTable::ResetPropCAs()
			
			//if AsmFactory::isNested then
				//SymTable::AddNestedProp(prss::PropertyName::Value, ptyp, AsmFactory::CurnPropB)
			//else
				//SymTable::AddProp(prss::PropertyName::Value, ptyp, AsmFactory::CurnPropB)
			//end if

			StreamUtils::Write("	Adding Property: ")
			StreamUtils::WriteLine(prss::PropertyName::Value)
		elseif stm is PropertyGetStmt then
			var prgs as PropertyGetStmt = $PropertyGetStmt$stm
			
			if prgs::Getter != null then
				if SymTable::CurnProp::ExplImplType::get_Length() > 0 then
					prgs::Getter::Value = SymTable::CurnProp::ExplImplType + "." + prgs::Getter::Value
				end if
				
				var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(prgs::Getter::Value, IKVM.Reflection.Type::EmptyTypes)
				if mb != null then
					AsmFactory::CurnPropB::SetGetMethod(mb)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + prgs::Getter::Value + "' with the required signature is not defined.")
				end if
				StreamUtils::Write("		Setting Property Getter: ")
				StreamUtils::WriteLine(prgs::Getter::Value)
			else
				var cprop = SymTable::CurnProp
				var metname = #ternary{cprop::ExplImplType::get_Length() > 0 ? cprop::ExplImplType + ".get_", "get_"}  + cprop::Name
				Read(new MethodStmt() {MethodName = new Ident(metname), RetTyp = new TypeTok(cprop::PropertyTyp), Line = prgs::Line, _
					 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cprop::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}},fpath)
				cprop::PropertyBldr::SetGetMethod(AsmFactory::CurnMetB)
			end if
		elseif stm is EndGetStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif stm is PropertySetStmt then
			var prss as PropertySetStmt = $PropertySetStmt$stm
			if prss::Setter != null then
				if SymTable::CurnProp::ExplImplType::get_Length() > 0 then
					prss::Setter::Value = SymTable::CurnProp::ExplImplType + "." + prss::Setter::Value
				end if
				
				var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(prss::Setter::Value, new IKVM.Reflection.Type[] {SymTable::CurnProp::PropertyTyp})
				if mb != null then
					AsmFactory::CurnPropB::SetSetMethod(mb)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + prss::Setter::Value + "' with the required signature is not defined.")
				end if
				StreamUtils::Write("		Setting Property Setter: ")
				StreamUtils::WriteLine(prss::Setter::Value)
			else
				var cprop = SymTable::CurnProp
				var metname = #ternary{cprop::ExplImplType::get_Length() > 0 ? cprop::ExplImplType + ".set_", "set_"}  + cprop::Name
				var mets = new MethodStmt() {MethodName = new Ident(metname), RetTyp = new VoidTok(), Line = prss::Line,  _
					 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cprop::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}}
				mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cprop::PropertyTyp)})
				Read(mets,fpath)
				cprop::PropertyBldr::SetSetMethod(AsmFactory::CurnMetB)
			end if
		elseif stm is EndSetStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif (stm is EndPropStmt) or (stm is EndEventStmt) then
		elseif stm is EventStmt then
			var evss as EventStmt = $EventStmt$stm
			var etyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(evss::EventTyp)
			AsmFactory::CurnExplImplType = string::Empty
			
			if etyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + evss::EventTyp::Value + "' is not defined.")
			end if
			
			var evssnamstr as string = evss::EventName::Value
			var evssnamarr as C5.IList<of string> = ParseUtils::StringParserL(evssnamstr, ".")
			var evoverldnam as string = string::Empty
			var evnam = evssnamstr
			if evssnamarr::get_Count() > 1 then
				evoverldnam = evssnamarr::get_Last()
				evnam = evoverldnam
				typ = Helpers::CommitEvalTTok(new TypeTok(string::Join(".", evssnamarr::View(0,--evssnamarr::get_Count())::ToArray())))
				AsmFactory::CurnExplImplType = typ::ToString()
				evssnamstr = typ::ToString() + "." + evoverldnam
			end if
			
			AsmFactory::CurnEventB = AsmFactory::CurnTypB::DefineEvent(evssnamstr,EventAttributes::None, etyp)
			SymTable::CurnEvent = new EventItem(evnam, etyp, AsmFactory::CurnEventB, evss::Attrs, AsmFactory::CurnExplImplType)
			AsmFactory::CurnEventType = etyp
			
			Helpers::ApplyEventAttrs()
			SymTable::ResetEventCAs()
			
			//if AsmFactory::isNested then
				//SymTable::AddNestedProp(prss::PropertyName::Value, ptyp, AsmFactory::CurnPropB)
			//else
				//SymTable::AddProp(prss::PropertyName::Value, ptyp, AsmFactory::CurnPropB)
			//end if

			StreamUtils::Write("	Adding Event: ")
			StreamUtils::WriteLine(evss::EventName::Value)
		elseif stm is EventAddStmt then
			var evas as EventAddStmt = $EventAddStmt$stm
			
			if evas::Adder != null then
				if SymTable::CurnEvent::ExplImplType::get_Length() > 0 then
					evas::Adder::Value = SymTable::CurnEvent::ExplImplType + "." + evas::Adder::Value
				end if
				
				var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(evas:Adder::Value, new IKVM.Reflection.Type[] {SymTable::CurnEvent::EventTyp})
				if mb != null then
					AsmFactory::CurnEventB::SetAddOnMethod(mb)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + evas::Adder::Value + "' with the required signature is not defined.")
				end if
				StreamUtils::Write("		Setting Event Adder: ")
				StreamUtils::WriteLine(evas::Adder::Value)
			else
				var cevent = SymTable::CurnEvent
				var metname = #ternary{cevent::ExplImplType::get_Length() > 0 ? cevent::ExplImplType + ".add_", "add_"}  + cevent::Name
				var mets = new MethodStmt() {MethodName = new Ident(metname), RetTyp = new VoidTok(), Line = evas::Line,  _
					 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cevent::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}}
				mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cevent::EventTyp)})
				Read(mets,fpath)
				cevent::EventBldr::SetAddOnMethod(AsmFactory::CurnMetB)
			end if
		elseif stm is EndAddStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif stm is EventRemoveStmt then
			var evas as EventRemoveStmt = $EventRemoveStmt$stm
			
			if evas::Remover != null then
				if SymTable::CurnEvent::ExplImplType::get_Length() > 0 then
					evas::Remover::Value = SymTable::CurnEvent::ExplImplType + "." + evas::Remover::Value
				end if
				
				var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(evas:Remover::Value, new IKVM.Reflection.Type[] {SymTable::CurnEvent::EventTyp})
				if mb != null then
					AsmFactory::CurnEventB::SetRemoveOnMethod(mb)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + evas::Remover::Value + "' with the required signature is not defined.")
				end if
				StreamUtils::Write("		Setting Event Remover: ")
				StreamUtils::WriteLine(evas::Remover::Value)
			else
				var cevent = SymTable::CurnEvent
				var metname = #ternary{cevent::ExplImplType::get_Length() > 0 ? cevent::ExplImplType + ".remove_", "remove_"}  + cevent::Name
				var mets = new MethodStmt() {MethodName = new Ident(metname), RetTyp = new VoidTok(), Line = evas::Line,  _
					 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cevent::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}}
				mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cevent::EventTyp)})
				Read(mets,fpath)
				cevent::EventBldr::SetRemoveOnMethod(AsmFactory::CurnMetB)
			end if
		elseif stm is EndRemoveStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif stm is PropertyAttrStmt then
			SymTable::AddPropCA(AttrStmtToCAB($PropertyAttrStmt$stm))
		elseif stm is EventAttrStmt then
			SymTable::AddEventCA(AttrStmtToCAB($EventAttrStmt$stm))
		elseif stm is LockStmt then
			var lstm as LockStmt = $LockStmt$stm
			SymTable::PushScope()
			new Evaluator()::Evaluate(lstm::Lockee)
			if ILEmitter::Univ::Import(gettype ValueType)::IsAssignableFrom(AsmFactory::Type02) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Locks should only be taken on Objects and not Valuetypes.")
			end if
			ILEmitter::DeclVar(String::Empty, ILEmitter::Univ::Import(gettype object))
			ILEmitter::LocInd = ++ILEmitter::LocInd
			var lockee as integer = ILEmitter::LocInd
			ILEmitter::EmitStloc(lockee)
			SymTable::AddLock(lockee)
			ILEmitter::EmitLdloc(lockee)
			ILEmitter::EmitCall(ILEmitter::Univ::Import(gettype Monitor)::GetMethod("Enter",new IKVM.Reflection.Type[] {ILEmitter::Univ::Import(gettype object)}))
			ILEmitter::EmitTry()
		elseif stm is EndLockStmt then
			ILEmitter::EmitFinally()
			ILEmitter::EmitLdloc(SymTable::ReadLockeeLoc())
			ILEmitter::EmitCall(ILEmitter::Univ::Import(gettype Monitor)::GetMethod("Exit",new IKVM.Reflection.Type[] {ILEmitter::Univ::Import(gettype object)}))
			ILEmitter::EmitEndTry()
			SymTable::PopLock()
			SymTable::PopScope()
		elseif stm is IncStmt then
			var ic as IncStmt = $IncStmt$stm
			ic::NumVar::set_OrdOp("inc")
			ic::NumVar::set_DoInc(true)
			new Evaluator()::StoreEmit(ic::NumVar, new Expr() {AddToken(ic::NumVar)})
		elseif stm is DecStmt then
			var dc as DecStmt = $DecStmt$stm
			dc::NumVar::set_OrdOp("dec")
			dc::NumVar::set_DoDec(true)
			new Evaluator()::StoreEmit(dc::NumVar, new Expr() {AddToken(dc::NumVar)})
		else
			StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Processing of this type of statement is not supported.")
		end if
	end method

end class
