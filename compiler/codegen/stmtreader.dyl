//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtReader

	method public prototype void Read(var stm as Stmt, var fpath as string)

	method public CustomAttributeBuilder AttrStmtToCAB(var stm as AttrStmt)
		var typ as IKVM.Reflection.Type = null
		if !stm::Ctor::Name::Value::EndsWith("Attribute") then
			typ = Helpers::CommitEvalTTok(new TypeTok(stm::Ctor::Name::Value + "Attribute"))
		end if
		if typ == null then
			typ = Helpers::CommitEvalTTok(stm::Ctor::Name)
		end if
		if typ == null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("The Attribute Class '{0}' was not found.", stm::Ctor::Name::ToString()))
		end if
		
		if typ::Equals(Loader::LoadClass("System.Runtime.InteropServices.DllImportAttribute")) then
			SymTable::PIInfo = new PInvokeInfo() {LibName = $string$Helpers::LiteralToConst($Literal$stm::Ctor::Params::get_Item(0)::Tokens::get_Item(0))}
			return null
		end if
		
		var tarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[stm::Ctor::Params::get_Count()]
		var oarr as object[] = new object[stm::Ctor::Params::get_Count()]
		
		var i as integer = -1
		foreach param in stm::Ctor::Params
			i++
			var ci = Helpers::ProcessConstExpr(param)
			tarr[i] = ci::Typ
			oarr[i] = ci::Value
		end for
		
		var piarr as C5.IList<of PropertyInfo> = new C5.LinkedList<of PropertyInfo>()
		var poarr as C5.IList<of object> = new C5.LinkedList<of object>()
		var fiarr as C5.IList<of FieldInfo> = new C5.LinkedList<of FieldInfo>()
		var foarr as C5.IList<of object> = new C5.LinkedList<of object>()
		var tempprop as PropertyInfo = null
		var tempfld as FieldInfo = null
		
		foreach curpair in stm::Pairs
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
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Property or Field {0} does not exist in the attribute class {1}", curpair::Name::Value, typ::ToString()))
				end if
			end if
			
			var ci = Helpers::ProcessConstExpr(curpair::ValueExpr)
			if multflg then
				poarr::Add(ci::Value)
			else
				foarr::Add(ci::Value)
			end if
		end for
		
		return new CustomAttributeBuilder(Helpers::GetLocCtor(typ,tarr), oarr, piarr::ToArray(), poarr::ToArray(), fiarr::::ToArray(), foarr::ToArray())
	end method
	
	method public void ReadClass(var clss as ClassStmt)
		ILEmitter::StructFlg = false
		ILEmitter::PartialFlg = false
		ILEmitter::InterfaceFlg = false
		ILEmitter::StaticCFlg = false
		ILEmitter::AbstractCFlg = false
		
		if AsmFactory::inClass then
			AsmFactory::isNested = true
		end if
		if !AsmFactory::isNested then
			AsmFactory::inClass = true
		end if

		var inhtyp as IKVM.Reflection.Type = null
		var interftyp as IKVM.Reflection.Type = null
		var reft as IKVM.Reflection.Type  = clss::InhClass::RefTyp
		
		var ti2 as TypeItem = SymTable::TypeLst::GetTypeItem(AsmFactory::CurnNS + "." + clss::ClassName::Value)
		
		if ti2 == null then
			inhtyp = reft ?? #ternary {clss::InhClass::Value::get_Length() == 0 ? _
					Loader::LoadClass("System.Object"), Helpers::CommitEvalTTok(clss::InhClass)}
			if inhtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Base Class '{0}' is not defined or is not accessible.", clss::InhClass::Value))
			end if
			if inhtyp != null then
				if inhtyp::get_IsSealed() then
					inhtyp = null
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not inheritable.", clss::InhClass::Value))
				end if
			end if
		else
			inhtyp = ti2::InhTyp
		end if
		
		ILEmitter::StructFlg = inhtyp::Equals(Loader::LoadClass("System.ValueType"))
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
				StreamUtils::WriteLine(string::Format("Adding Class: {0}.{1}" , AsmFactory::CurnNS, clss::ClassName::Value))
			else
				AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
				StreamUtils::WriteLine(string::Format("Adding Nested Class: {0}", clss::ClassName::Value))
				AsmFactory::CurnTypName = clss::ClassName::Value
				AsmFactory::CurnTypB = AsmFactory::CurnTypB2::DefineNestedType(clss::ClassName::Value, clssparams, inhtyp)
			end if
		else
			SymTable::CurnTypItem = ti2
			AsmFactory::CurnTypB = ti2::TypeBldr
			AsmFactory::CurnTypName = clss::ClassName::Value
			StreamUtils::WriteLine(string::Format("Continuing Class: {0}.{1}", AsmFactory::CurnNS, clss::ClassName::Value))
		end if
		
		Helpers::ApplyClsAttrs()

		if ti2 == null then
			var ti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + clss::ClassName::Value, AsmFactory::CurnTypB) {InhTyp = inhtyp, IsStatic = ILEmitter::StaticCFlg}
			SymTable::CurnTypItem = ti
			SymTable::TypeLst::AddType(ti)

			foreach interf in clss::ImplInterfaces
				interftyp = Helpers::CommitEvalTTok(interf)
				if interftyp = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", interf::Value))
				elseif !interftyp::get_IsInterface() then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not an interface.", interftyp::ToString()))
				end if
				AsmFactory::CurnTypB::AddInterfaceImplementation(interftyp)

				ti::AddInterface(interftyp)
				foreach interfa in Helpers::GetTypeInterfaces(interftyp)
					ti::AddInterface(interfa)
				end for
			end for
			ti::NormalizeInterfaces()
		end if
	end method
	
	method public void ReadEnum(var clss as EnumStmt)
		//if AsmFactory::inClass then
		//	AsmFactory::isNested = true
		//end if
		//if !AsmFactory::isNested then
			AsmFactory::inEnum = true
		//end if

		var enumtyp = Helpers::CommitEvalTTok(clss::EnumTyp)
		if enumtyp == null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", clss::EnumTyp::Value))
		end if
		
		var clssparams as TypeAttributes = Helpers::ProcessClassAttrsE(clss::Attrs) or TypeAttributes::Sealed		
		//if !AsmFactory::isNested then
			AsmFactory::CurnTypName = clss::EnumName::Value
			AsmFactory::CurnEnumB = AsmFactory::MdlB::DefineEnum(AsmFactory::CurnNS + "." + clss::EnumName::Value, clssparams, enumtyp)
			StreamUtils::WriteLine(string::Format("Adding Enum: {0}.{1}" , AsmFactory::CurnNS, clss::EnumName::Value))
		//else
		//	AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
		//	StreamUtils::WriteLine(string::Format("Adding Nested Enum: {0}", clss::EnumName::Value))
		//	AsmFactory::CurnTypName = clss::EnumName::Value
		//	AsmFactory::CurnEnumB = AsmFactory::CurnTypB2::DefineEnum(clss::EnumName::Value, clssparams, enumtyp)
		//end if
		
		Helpers::ApplyEnumAttrs()

		var ti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + clss::EnumName::Value, AsmFactory::CurnEnumB) {InhTyp = enumtyp}
		SymTable::CurnTypItem = ti
		SymTable::TypeLst::AddType(ti)

	end method
	
	method public void ReadDelegate(var dels as DelegateStmt)
		ILEmitter::StructFlg = false
		ILEmitter::InterfaceFlg = false
		ILEmitter::StaticCFlg = false
		
		if AsmFactory::inClass then
			AsmFactory::isNested = true
		end if
		if !AsmFactory::isNested then
			AsmFactory::inClass = true
		end if

		var dta as TypeAttributes = Helpers::ProcessClassAttrs(dels::Attrs) or TypeAttributes::AnsiClass or TypeAttributes::Sealed or TypeAttributes::AutoClass
		var dinhtyp as IKVM.Reflection.Type = Loader::LoadClass("System.MulticastDelegate")
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

		var dti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + dels::DelegateName::Value,AsmFactory::CurnTypB) {InhTyp = dinhtyp}
		SymTable::CurnTypItem = dti

		SymTable::ResetVar()
		SymTable::ResetIf()
		SymTable::ResetUsing()
		SymTable::ResetLock()
		SymTable::ResetTry()
		SymTable::ResetLoop()
		SymTable::ResetLbl()

		var dema as MethodAttributes = MethodAttributes::HideBySig or MethodAttributes::Public
		var stdcc as CallingConventions = CallingConventions::Standard
		var dtarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[] {Loader::LoadClass("System.Object"), Loader::LoadClass("System.IntPtr")}
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
		dtarr2[dtarr2[l] - 2] = Loader::LoadClass("System.AsyncCallback")
		dtarr2[--dtarr2[l]] = Loader::LoadClass("System.Object")

		AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod("BeginInvoke", dema, Loader::LoadClass("System.IAsyncResult"), dtarr2)
		AsmFactory::InitDelMet()

		SymTable::CurnTypItem::AddMethod(new MethodItem("BeginInvoke",Loader::LoadClass("System.IAsyncResult"),dtarr2,AsmFactory::CurnMetB))

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
		dtarr3[--dtarr3[l]] = Loader::LoadClass("System.IAsyncResult")

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
	end method
	
	method public void ReadMethod(var mtss as MethodStmt)
		ILEmitter::StaticFlg = false
		ILEmitter::AbstractFlg = false
		ILEmitter::ProtoFlg = false
		ILEmitter::PInvokeFlg = false

		SymTable::ResetVar()
		SymTable::ResetIf()
		SymTable::ResetLbl()
		SymTable::ResetUsing()
		SymTable::ResetLock()
		SymTable::ResetTry()
		SymTable::ResetLoop()

		SymTable::ResetMetGenParams()

		var mtssnamstr as string = mtss::MethodName::Value
		var typ as IKVM.Reflection.Type = null
		
		var mtssnamarr as C5.IList<of string>
		var overldnam as string = String::Empty
		var overldmtd as MethodInfo = null
		var mipt as MethodItem = null
		var fromproto as boolean = false

		if (mtssnamstr = AsmFactory::CurnTypName) or (mtssnamstr like "^ctor\d*$") then
			StreamUtils::WriteLine("	Adding Constructor: " + mtssnamstr)
			var paramstyps as IKVM.Reflection.Type[] = #ternary {mtss::Params[l] == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}			
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
				overldnam = mtssnamarr::get_Last()
				typ = Helpers::CommitEvalTTok(new TypeTok(string::Join(".", mtssnamarr::View(0,--mtssnamarr::get_Count())::ToArray())))
				mtssnamstr = string::Format("{0}.{1}", typ::ToString(), overldnam)
			end if
			
			var paramstyps as IKVM.Reflection.Type[]
			var rettyp as IKVM.Reflection.Type = null
			var nrgenparams = 0
			
			if !#expr(mtss::MethodName is GenericMethodNameTok) then
				paramstyps = #ternary {mtss::Params[l] == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}
				mipt = SymTable::FindProtoMet(mtssnamstr, paramstyps)
			end if
			
			fromproto = mipt != null
			
			if fromproto then
				StreamUtils::WriteLine("	Continuing Method: " + mtssnamstr)
				AsmFactory::CurnMetB = mipt::MethodBldr
				ILEmitter::StaticFlg = AsmFactory::CurnMetB::get_IsStatic()
				ILEmitter::AbstractFlg = AsmFactory::CurnMetB::get_IsAbstract()
			else
				StreamUtils::WriteLine("	Adding Method: " + mtssnamstr)
				var ma = Helpers::ProcessMethodAttrs(mtss::Attrs)
				var pinfo = SymTable::PIInfo
				
				if ILEmitter::PInvokeFlg then
					
					paramstyps = #ternary {mtss::Params[l] == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}
					rettyp = Helpers::CommitEvalTTok(mtss::RetTyp)
					if rettyp = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", mtss::RetTyp::Value))
					end if

					AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefinePInvokeMethod(mtssnamstr, pinfo::LibName, ma, CallingConventions::Standard, rettyp, paramstyps, pinfo::CallConv, pinfo::CSet)
				else
					AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod(mtssnamstr, ma, Loader::LoadClass("System.Void"), IKVM.Reflection.Type::EmptyTypes)
					
					if mtss::MethodName is GenericMethodNameTok then
						var paramdefs = #expr($GenericMethodNameTok$mtss::MethodName)::Params
						var genparams = new string[paramdefs[l]]
						for i = 0 upto --paramdefs[l]
							genparams[i] = paramdefs[i]::Value
						end for
						SymTable::SetMetGenParams(genparams, AsmFactory::CurnMetB::DefineGenericParameters(genparams))
						nrgenparams = paramdefs[l]
					end if
					
					paramstyps = #ternary {mtss::Params[l] == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}
					rettyp = Helpers::CommitEvalTTok(mtss::RetTyp)
					if rettyp = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", mtss::RetTyp::Value))
					end if
					AsmFactory::CurnMetB::SetReturnType(rettyp)
					AsmFactory::CurnMetB::SetParameters(paramstyps)
				end if
			end if
			
			if ILEmitter::InterfaceFlg and !ILEmitter::AbstractFlg then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Methods in Interfaces should all be Abstract!")
			elseif ILEmitter::InterfaceFlg and ILEmitter::StaticFlg then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Methods in Interfaces should not be Static!")
			elseif !ILEmitter::StaticFlg and ILEmitter::StaticCFlg then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Methods!")
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

				if mtssnamarr::get_Count() > 1 then
					overldmtd = Helpers::GetExtMet(typ, new MethodNameTok(overldnam), paramstyps)
					AsmFactory::CurnTypB::DefineMethodOverride(AsmFactory::CurnMetB, overldmtd)
				end if
			end if
			
			if !fromproto then
				if AsmFactory::isNested then
					SymTable::AddNestedMet(mtssnamstr, rettyp, paramstyps, AsmFactory::CurnMetB)
				else
					SymTable::AddMet(mtssnamstr, rettyp, paramstyps, AsmFactory::CurnMetB, nrgenparams)
				end if
			end if
			
			if !ILEmitter::ProtoFlg then
				if mtss::Params[l] != 0 then
					Helpers::PostProcessParams(mtss::Params)
				end if
			end if
		end if
		
		Helpers::ApplyMetAttrs()
		
		if !#expr(ILEmitter::AbstractFlg or ILEmitter::ProtoFlg or ILEmitter::PInvokeFlg) then
			AsmFactory::InMethodFlg = true
		end if
		AsmFactory::CurnMetName = mtssnamstr
	end method
	
	method public void ReadForeach(var festm as ForeachStmt)
		SymTable::PushScope()
		new Evaluator()::Evaluate(festm::Exp)
		var mtds as MethodInfo[] = Helpers::ProcessForeach(AsmFactory::Type02)
		var ttu = Helpers::CommitEvalTTok(festm::Typ)
		if (ttu == null) and (festm::Typ != null) then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", festm::Typ::ToString()))
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
			ttu2 = ttu ?? mtds[2]::get_ReturnType()
			ILEmitter::DeclVar(festm::Iter::Value, ttu2)
			ILEmitter::LocInd++
			SymTable::StoreFlg = true
			SymTable::AddVar(festm::Iter::Value, true, ILEmitter::LocInd, ttu2, ILEmitter::LineNr)
			SymTable::StoreFlg = false
			ILEmitter::EmitLdloc(ien)
			ILEmitter::EmitCallvirt(mtds[2])
			if ttu != null then
				if !ttu::Equals(mtds[2]::get_ReturnType()) then
					Helpers::EmitConv(mtds[2]::get_ReturnType(), ttu)
				end if
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
				ttu2 = ttu ?? mtds[1]::get_ReturnType()
				ILEmitter::DeclVar(festm::Iter::Value, ttu2)
				ILEmitter::LocInd++
				SymTable::StoreFlg = true
				SymTable::AddVar(festm::Iter::Value, true, ILEmitter::LocInd, ttu2, ILEmitter::LineNr)
				SymTable::StoreFlg = false
				ILEmitter::EmitLdloc(ien)
				ILEmitter::EmitCallvirt(mtds[1])
				if ttu != null then
					if !ttu::Equals(mtds[1]::get_ReturnType()) then
						Helpers::EmitConv(mtds[1]::get_ReturnType(), ttu)
					end if
				end if
				ILEmitter::EmitStloc(ILEmitter::LocInd)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class {0} is not an IEnumerable/IEnumerator or IEnumerable<of T>/IEnumerator<of T>.", AsmFactory::Type02::ToString()))
			end if
		end if
	end method
	
	method public void ReadEvent(var evss as EventStmt, var fpath as string)
		var etyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(evss::EventTyp)
		var eit = string::Empty
		var typ as IKVM.Reflection.Type = null
		
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
			eit = typ::ToString()
			evssnamstr = typ::ToString() + "." + evoverldnam
		end if
		
		AsmFactory::CurnEventB = AsmFactory::CurnTypB::DefineEvent(evssnamstr,EventAttributes::None, etyp)
		SymTable::CurnEvent = new EventItem(evnam, etyp, AsmFactory::CurnEventB, evss::Attrs, eit)
		AsmFactory::CurnEventType = etyp
		
		Helpers::ApplyEventAttrs()
		
		StreamUtils::WriteLine("	Adding Event: " + evss::EventName::Value)
	end method
	
	method public void ReadEventAdd(var evas as EventAddStmt, var fpath as string)
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
			var mets = new MethodStmt() {MethodName = new MethodNameTok(new Ident(metname)), RetTyp = new VoidTok(), Line = evas::Line,  _
				 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cevent::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}}
			mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cevent::EventTyp)})
			Read(mets,fpath)
			cevent::EventBldr::SetAddOnMethod(AsmFactory::CurnMetB)
		end if
	end method
	
	method public void ReadEventRemove(var evas as EventRemoveStmt, var fpath as string)
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
			var mets = new MethodStmt() {MethodName = new MethodNameTok(new Ident(metname)), RetTyp = new VoidTok(), Line = evas::Line,  _
				 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cevent::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}}
			mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cevent::EventTyp)})
			Read(mets,fpath)
			cevent::EventBldr::SetRemoveOnMethod(AsmFactory::CurnMetB)
		end if
	end method
	
	method public void ReadVer(var asmv as VerStmt, var fpath as string)
		AsmFactory::AsmNameStr::set_Version(asmv::ToVersion())
		if AsmFactory::PCLSet then
			AsmFactory::AsmNameStr::set_Flags(AssemblyNameFlags::Retargetable)
		end if
		AsmFactory::AsmB = ILEmitter::Univ::DefineDynamicAssembly(AsmFactory::AsmNameStr, AssemblyBuilderAccess::Save, Directory::GetCurrentDirectory())
		AsmFactory::MdlB = AsmFactory::AsmB::DefineDynamicModule(AsmFactory::AsmNameStr::get_Name() + "." + AsmFactory::AsmMode, AsmFactory::AsmNameStr::get_Name() + "." + AsmFactory::AsmMode, AsmFactory::DebugFlg)
			
		if AsmFactory::DebugFlg then
			fpath = Path::GetFullPath(fpath)
			var docw as ISymbolDocumentWriter = AsmFactory::MdlB::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
			ILEmitter::DocWriter = docw
			ILEmitter::AddDocWriter(docw)
		end if

		// --------------------------------------------------------------------------------------------------------
		if AsmFactory::DebugFlg then
			var dtyp as IKVM.Reflection.Type = Loader::LoadClass("System.Diagnostics.DebuggableAttribute")
			var debugattr as DebuggableAttribute\DebuggingModes = DebuggableAttribute\DebuggingModes::Default or DebuggableAttribute\DebuggingModes::DisableOptimizations
			var dattyp as IKVM.Reflection.Type = Loader::LoadClass("System.Diagnostics.DebuggableAttribute\DebuggingModes")
			AsmFactory::AsmB::SetCustomAttribute(new CustomAttributeBuilder(dtyp::GetConstructor(new IKVM.Reflection.Type[] {dattyp}), new object[] {$object$debugattr}))
		end if
		// --------------------------------------------------------------------------------------------------------
		
		Helpers::ApplyAsmAttrs()
		
		AsmFactory::AsmFile = AsmFactory::AsmNameStr::get_Name() + "." + AsmFactory::AsmMode
		Importer::AddAsm(AsmFactory::AsmB)
	end method
	
	method public void ReadField(var flss as FieldStmt)
		var ftyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(flss::FieldTyp)
			
		if ftyp == null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", flss::FieldTyp::Value))
		end if
		
		AsmFactory::CurnFldB = AsmFactory::CurnTypB::DefineField(flss::FieldName::Value, ftyp, Helpers::ProcessFieldAttrs(flss::Attrs))
		
		if ILEmitter::InterfaceFlg then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Interfaces should not have Fields!")
		elseif !AsmFactory::CurnFldB::get_IsStatic() and ILEmitter::StaticCFlg then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Fields!")
		end if
		
		Helpers::ApplyFldAttrs()
		
		var litval as ConstInfo = null
		if AsmFactory::CurnFldB::get_IsLiteral() then
			if flss::ConstExp == null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Constants should always be initialized in their declaration!")
			else
				litval = Helpers::ProcessConstExpr(flss::ConstExp)
				if litval::Typ::Equals(ftyp) then
					AsmFactory::CurnFldB::SetConstant(litval::Value)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Slots of type '{0}' cannot be assigned values of type '{1}'.", ftyp::ToString(), litval::Typ::ToString()))
				end if
			end if
		end if
		
		if AsmFactory::isNested then
			SymTable::AddNestedFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB)
		else
			SymTable::AddFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB, #ternary{ litval == null ? null, litval::Value})
		end if

		StreamUtils::Write(#ternary{AsmFactory::CurnFldB::get_IsLiteral() ?  "	Adding Constant: ", "	Adding Field: "})
		StreamUtils::WriteLine(flss::FieldName::Value)
	end method
	
	method public void ReadFor(var fstm as ForStmt, var fpath as string)
		var ttu = Helpers::CommitEvalTTok(fstm::Typ)
		if (ttu == null) and (fstm::Typ != null) then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", fstm::Typ::ToString()))
		end if
		SymTable::PushScope()
		
		var eval = new Evaluator()
		eval::Evaluate(fstm::StartExp)
		var ttu2 = ttu ?? AsmFactory::Type02
		ILEmitter::DeclVar(fstm::Iter::Value, ttu2)
		ILEmitter::LocInd++
		SymTable::StoreFlg = true
		SymTable::AddVar(fstm::Iter::Value, true, ILEmitter::LocInd, ttu2, ILEmitter::LineNr)
		SymTable::StoreFlg = false
		if ttu != null then
			if !ttu::Equals(AsmFactory::Type02) then
				Helpers::EmitConv(AsmFactory::Type02, ttu)
			end if
		end if
		ILEmitter::EmitStloc(ILEmitter::LocInd)
		
		SymTable::AddForLoop(fstm::Iter::Value, fstm::StepExp, fstm::Direction, fstm::Typ)
		ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
		var et = eval::ConvToAST(eval::ConvToRPN(fstm::EndExp))
		eval::ASTEmit(et, false)
		if ttu != null then
			if !ttu::Equals(AsmFactory::Type02) then
				et = new ExprCallTok() {Exp = new Expr() {AddToken(et)}, set_Conv(true), set_TTok(fstm::Typ), set_OrdOp("conv")}
			end if
		end if
		
		eval::Evaluate(new Expr() {Line = fstm::Line, AddToken(fstm::Iter), AddToken(#ternary{fstm::Direction ? new GtOp(), new LtOp()}) , _
			AddToken(et)})
		
		ILEmitter::EmitBrtrue(SymTable::ReadLoopEndLbl())
	end method
	
	method public void ReadPropertyGet(var prgs as PropertyGetStmt, var fpath as string)
		var cprop = SymTable::CurnProp
		if prgs::Getter != null then
			if cprop::ExplImplType::get_Length() > 0 then
				prgs::Getter::Value = cprop::ExplImplType + "." + prgs::Getter::Value
			end if
			
			var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(prgs::Getter::Value, cprop::ParamTyps)
			if mb != null then
				AsmFactory::CurnPropB::SetGetMethod(mb)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + prgs::Getter::Value + "' with the required signature is not defined.")
			end if
			StreamUtils::Write("		Setting Property Getter: ")
			StreamUtils::WriteLine(prgs::Getter::Value)
		else
			var metname = #ternary{cprop::ExplImplType::get_Length() > 0 ? cprop::ExplImplType + ".get_", "get_"}  + cprop::Name
			Read(new MethodStmt() {MethodName = new MethodNameTok(new Ident(metname)), RetTyp = new TypeTok(cprop::PropertyTyp), Line = prgs::Line, Params = cprop::Params, _
				 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cprop::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}},fpath)
			cprop::PropertyBldr::SetGetMethod(AsmFactory::CurnMetB)
		end if
	end method
	
	method public void ReadPropertySet(var prss as PropertySetStmt, var fpath as string)
		var cprop = SymTable::CurnProp
		if prss::Setter != null then
			if cprop::ExplImplType::get_Length() > 0 then
				prss::Setter::Value = cprop::ExplImplType + "." + prss::Setter::Value
			end if
			
			var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(prss::Setter::Value, _
				Enumerable::ToArray<of IKVM.Reflection.Type>(Enumerable::Concat<of IKVM.Reflection.Type>(cprop::ParamTyps, new IKVM.Reflection.Type[] {cprop::PropertyTyp})) )
			if mb != null then
				AsmFactory::CurnPropB::SetSetMethod(mb)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + prss::Setter::Value + "' with the required signature is not defined.")
			end if
			StreamUtils::Write("		Setting Property Setter: ")
			StreamUtils::WriteLine(prss::Setter::Value)
		else
			var metname = #ternary{cprop::ExplImplType::get_Length() > 0 ? cprop::ExplImplType + ".set_", "set_"}  + cprop::Name
			var mets = new MethodStmt() {MethodName = new MethodNameTok(new Ident(metname)), RetTyp = new VoidTok(), Line = prss::Line, Params = cprop::Params,  _
				 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cprop::Attrs), Add(new HideBySigAttr()), Add(new SpecialNameAttr())}}
			mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cprop::PropertyTyp)})
			Read(mets,fpath)
			cprop::PropertyBldr::SetSetMethod(AsmFactory::CurnMetB)
		end if
	end method
	
	method public void ReadProperty(var prss as PropertyStmt, var fpath as string)
		var ptyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(prss::PropertyTyp)
		var eit = string::Empty
		var typ as IKVM.Reflection.Type = null
		
		if ptyp == null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + prss::PropertyTyp::Value + "' is not defined.")
		end if

		var paramstyps as IKVM.Reflection.Type[] = #ternary {prss::Params[l] == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(prss::Params)}

		var prssnamstr as string = prss::PropertyName::Value
		var prssnamarr as C5.IList<of string> = ParseUtils::StringParserL(prssnamstr, ".")
		var propoverldnam as string = string::Empty
		var propnam = prssnamstr
		if prssnamarr::get_Count() > 1 then
			propoverldnam = prssnamarr::get_Last()
			propnam = propoverldnam
			typ = Helpers::CommitEvalTTok(new TypeTok(string::Join(".", prssnamarr::View(0,--prssnamarr::get_Count())::ToArray())))
			eit = typ::ToString()
			prssnamstr = typ::ToString() + "." + propoverldnam
		end if
		
		AsmFactory::CurnPropB = AsmFactory::CurnTypB::DefineProperty(prssnamstr, PropertyAttributes::None, ptyp, paramstyps)
		SymTable::CurnProp = new PropertyItem(propnam, ptyp, AsmFactory::CurnPropB, prss::Attrs, eit) {ParamTyps = paramstyps, Params = prss::Params}
		
		Helpers::ApplyPropAttrs()

		StreamUtils::Write("	Adding Property: ")
		StreamUtils::WriteLine(prss::PropertyName::Value)
		
		var isauto as boolean = false
		var isautoind as integer = -1
		var isrdonly as boolean = false
		var isrdonlyind as integer = -1
		var isstatic as boolean = false
		var isabstract as boolean = false
		
		var i as integer = -1
		foreach a in prss::Attrs
			i++
			if a is AutoGenAttr then
				isauto = true
				isautoind = i
			elseif a is InitOnlyAttr then
				isrdonly = true
				isrdonlyind = i
			elseif a is StaticAttr then
				isstatic = true
			elseif a is AbstractAttr then
				isabstract = true
			end if
		end for
		
		if isauto then
			
			//check that params[l] == 0
			if paramstyps[l] > 0 then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Auto generation of Indexers is not supported!")
			end if

			prss::Attrs::RemoveAt(isautoind)
			if isrdonly then
				prss::Attrs::RemoveAt(isrdonlyind)
			end if

			//it is not an error that these are not eval'd in all cases (METHODS HAVE SIMILAR VALIDATION)
			if ILEmitter::InterfaceFlg and !isabstract then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Properties in Interfaces should all be Abstract!")
			elseif ILEmitter::InterfaceFlg and isstatic then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Properties in Interfaces should not be Static!")
			elseif !isstatic and ILEmitter::StaticCFlg then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Properties!")
			end if
			
			//field
			if !isabstract then
				var fld = Helpers::GetLocFld("_" + propnam)
				if fld == null then
					var attrs = new C5.LinkedList<of Attributes.Attribute> {new PrivateAttr()}
					if isstatic then
						attrs::Add(new StaticAttr())
					end if
					ReadField(new FieldStmt() {Line = prss::Line, FieldName = new Ident("_" + propnam), _
						FieldTyp = prss::PropertyTyp, Attrs = attrs})
				else
					if !fld::get_FieldType()::Equals(ptyp) then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Already existing field '_{0}' is not of the required type '{1}'!", propnam, ptyp::ToString()))
					end if
				end if
			end if
			//getter
			ReadPropertyGet(new PropertyGetStmt() {Getter = null, Line = prss::Line}, fpath)
			if !isabstract then
				Read(new ReturnStmt() {Line = prss::Line, RExp = new Expr() {AddToken(new Ident("_" + propnam))} }, fpath)
				Read(new EndMethodStmt() {Line = prss::Line}, fpath)
			end if
			//setter
			if !isrdonly then
				ReadPropertySet(new PropertySetStmt() {Setter = null, Line = prss::Line}, fpath)
				if !isabstract then
					new Evaluator()::StoreEmit(new Ident("_" + propnam), new Expr() {AddToken(new Ident("value"))})
					Read(new EndMethodStmt() {Line = prss::Line}, fpath)
				end if
			end if
			//end
			SymTable::CurnProp = null
		end if
		
	end method
	
	method public void ReadEndDo(var fpath as string)
		var fl = SymTable::ReadLoop() as ForLoopItem
		if fl != null then
			if fl::ContinueFlg then
				ILEmitter::MarkLbl(fl::StepLabel)
			end if
			if fl::StepExp == null then
				Read(#ternary{fl::Direction ? new IncStmt() {Line = fl::Line, NumVar = new Ident(fl::Iter)}, _
					new DecStmt() {Line = fl::Line, NumVar = new Ident(fl::Iter)}},fpath)
			else
				var ttu = Helpers::CommitEvalTTok(fl::Typ)
				if (ttu == null) and (fl::Typ != null) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", fl::Typ::ToString()))
				end if
				
				var eval = new Evaluator()
				var idt = new Ident(fl::Iter) {Line = fl::Line}
				var et = eval::ConvToAST(eval::ConvToRPN(fl::StepExp))	
				eval::ASTEmit(et, false)
				
				if ttu != null then
					if !ttu::Equals(AsmFactory::Type02) then
						et = new ExprCallTok() {Exp = new Expr() {AddToken(et)}, set_Conv(true), set_TTok(fl::Typ), set_OrdOp("conv")}
					end if
				end if
				
				var ee = new Expr() {Line = fl::Line, AddToken(idt), AddToken(#ternary{fl::Direction ? new AddOp(), _
				 new SubOp()}) , AddToken(et)}
				 Read(new AssignStmt() {Line = fl::Line, LExp = new Expr() {Line = fl::Line, AddToken(idt) }, RExp = ee}, fpath)
			end if
		end if
		
		ILEmitter::EmitBr(SymTable::ReadLoopStartLbl())
		ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
		SymTable::PopLoop()
		SymTable::PopScope()
	end method
	
	method public void Read(var stm as Stmt, var fpath as string)
		var vtyp as IKVM.Reflection.Type = null
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
			rsastm::AsmPath::Value = Path::Combine(Importer::AsmBasePath, ParseUtils::ProcessMSYSPath(rsastm::AsmPath::Value))
			
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
			ReadVer($VerStmt$stm, fpath)
		elseif stm is DebugStmt then
			var dbgs as DebugStmt = $DebugStmt$stm
			AsmFactory::DebugFlg = dbgs::Flg
			if dbgs::Flg then
				SymTable::AddDef("DEBUG")
			end if
		elseif stm is ClassStmt then
			ReadClass($ClassStmt$stm)
		elseif stm is EnumStmt then
			ReadEnum($EnumStmt$stm)
		elseif stm is DelegateStmt then
			ReadDelegate($DelegateStmt$stm)
		elseif stm is FieldStmt then
			ReadField($FieldStmt$stm)
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
		elseif stm is EndEnumStmt then
			//if AsmFactory::isNested then
			//	AsmFactory::CreateTyp()
			//	AsmFactory::CurnTypB = AsmFactory::CurnTypB2
			//	AsmFactory::isNested = false
			//	SymTable::ResetNestedMet()
			//	SymTable::ResetNestedCtor()
			//	SymTable::ResetNestedFld()
			//else
			//	if !ILEmitter::PartialFlg then
					SymTable::CurnTypItem::BakedTyp = AsmFactory::CurnEnumB::CreateType()
			//	end if
				AsmFactory::inEnum = false
			//end if
		elseif stm is MethodStmt then
			ReadMethod($MethodStmt$stm)
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
			SymTable::CheckReturnInTry()
			ILEmitter::EmitRet()
		elseif stm is VarStmt then
			var curv as VarStmt = $VarStmt$stm
			vtyp = Helpers::CommitEvalTTok(curv::VarTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curv::VarTyp::ToString() + "' is not defined.")
			end if
			ILEmitter::DeclVar(curv::VarName::Value, vtyp)
			ILEmitter::LocInd++
			SymTable::AddVar(curv::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
		elseif stm is VarAsgnStmt then
			var curva as VarAsgnStmt = $VarAsgnStmt$stm
			vtyp = Helpers::CommitEvalTTok(curva::VarTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curva::VarTyp::ToString() + "' is not defined.")
			end if
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd++
			
			if curva::IsUsing then
				if !Loader::LoadClass("System.IDisposable")::IsAssignableFrom(vtyp) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + vtyp::ToString() + "' is not an IDisposable.")
				end if
				SymTable::PushScope()
			end if
			
			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			new Evaluator()::StoreEmit(curva::VarName, curva::RExpr)
			
			if curva::IsUsing then
				SymTable::AddUsing(curva::VarName::Value)
				ILEmitter::EmitTry()
			end if
		elseif stm is InfVarAsgnStmt then
			var curva as InfVarAsgnStmt = $InfVarAsgnStmt$stm
			eval = new Evaluator()
			vtyp = eval::EvaluateType(curva::RExpr)
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd++
			
			if curva::IsUsing then
				if !Loader::LoadClass("System.IDisposable")::IsAssignableFrom(vtyp) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + vtyp::ToString() + "' is not an IDisposable.")
				end if
				SymTable::PushScope()
			end if
			
			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			eval::StoreEmit(curva::VarName, curva::RExpr)
			
			if curva::IsUsing then
				SymTable::AddUsing(curva::VarName::Value)
				ILEmitter::EmitTry()
			end if
		elseif stm is NSStmt then
			var nss as NSStmt = $NSStmt$stm
			if nss::NS::Value like c"^\q(.)*\q$" then
				nss::NS::Value = nss::NS::Value::Trim(new char[] {c'\q'})
			end if
			AsmFactory::PushNS(nss::NS::Value)
		elseif stm is EndNSStmt then
			AsmFactory::PopNS()
		elseif stm is AssignStmt then
			var asgnstm as AssignStmt = $AssignStmt$stm
			if !AsmFactory::inEnum then
				new Evaluator()::StoreEmit(asgnstm::LExp::Tokens::get_Item(0), asgnstm::RExp)
			else
				//enum members
				var litval as ConstInfo = null
				var name = asgnstm::LExp::Tokens::get_Item(0)::Value
				if asgnstm::RExp::Tokens::get_Count() < 1 then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Enum members should always be initialized in their declaration!")
				else
					litval = Helpers::ProcessConstExpr(asgnstm::RExp)
					if litval::Typ::Equals(SymTable::CurnTypItem::InhTyp) then
						AsmFactory::CurnFldB = AsmFactory::CurnEnumB::DefineLiteral(name, litval::Value)
						SymTable::AddFld(name, SymTable::CurnTypItem::EnumBldr, AsmFactory::CurnFldB, litval::Value)
						Helpers::ApplyFldAttrs()
					else
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Slots of type '{0}' cannot be assigned values of type '{1}'.", SymTable::CurnTypItem::InhTyp::ToString(), litval::Typ::ToString()))
					end if
				end if
			end if
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
			if !AsmFactory::Type02::Equals(Loader::LoadClass("System.Boolean")) then
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
			var fl = SymTable::ReadLoop() as ForLoopItem
			if fl != null then
				if !fl::ContinueFlg then
					fl::ContinueFlg = true
					fl::StepLabel = ILEmitter::DefineLbl()
				end if
				ILEmitter::EmitBr(fl::StepLabel)
			else
				ILEmitter::EmitBr(SymTable::ReadLoopStartLbl())
			end if
		elseif stm is UntilStmt then
			var unstm as UntilStmt = $UntilStmt$stm
			new Evaluator()::Evaluate(unstm::Exp)
			if !AsmFactory::Type02::Equals(Loader::LoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Until Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrfalse(SymTable::ReadLoopStartLbl())
			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif stm is WhileStmt then
			var whstm as WhileStmt = $WhileStmt$stm
			new Evaluator()::Evaluate(whstm::Exp)
			if !AsmFactory::Type02::Equals(Loader::LoadClass("System.Boolean")) then
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
			if !AsmFactory::Type02::Equals(Loader::LoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Do Until Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrtrue(SymTable::ReadLoopEndLbl())
		elseif stm is DoWhileStmt then
			var dwstm as DoWhileStmt = $DoWhileStmt$stm
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
			new Evaluator()::Evaluate(dwstm::Exp)
			if !AsmFactory::Type02::Equals(Loader::LoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Do While Statements should evaluate to boolean.")
			end if
			ILEmitter::EmitBrfalse(SymTable::ReadLoopEndLbl())
		elseif stm is ForStmt then
			ReadFor($ForStmt$stm, fpath)
		elseif stm is ElseIfStmt then
			ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
			ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			SymTable::SetIfNxtBlkLbl()
			var elifstm as ElseIfStmt = $ElseIfStmt$stm
			SymTable::PopScope()
			SymTable::PushScope()
			new Evaluator()::Evaluate(elifstm::Exp)
			if !AsmFactory::Type02::Equals(Loader::LoadClass("System.Boolean")) then
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
			ReadEndDo(fpath)
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
				if !Loader::LoadClass("System.Exception")::IsAssignableFrom(AsmFactory::Type02) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + AsmFactory::Type02::ToString() + "' is not an Exception Type.")
				end if
				ILEmitter::EmitThrow()
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No exception to throw specified")
			end if
		elseif stm is TryStmt then
			SymTable::PushScope()
			ILEmitter::EmitTry()
			SymTable::AddTry()
		elseif stm is EndTryStmt then
			ILEmitter::EmitEndTry()
			SymTable::PopScope()
			SymTable::PopTry()
		elseif stm is FinallyStmt then
			SymTable::PopScope()
			SymTable::PushScope()
			ILEmitter::EmitFinally()
		elseif stm is EndUsingStmt then
			ILEmitter::EmitFinally()
			new Evaluator()::Evaluate(new Expr() {Line = ILEmitter::LineNr, AddToken(new ExprCallTok() {Line = ILEmitter::LineNr, Exp = new Expr() { _
				AddToken(new Ident(SymTable::ReadUseeLoc()) {Line = ILEmitter::LineNr, set_Conv(true), set_TTok(new TypeTok("System.IDisposable")), set_OrdOp("conv") })}, _
				MemberAccessFlg = true, MemberToAccess = new MethodCallTok() {Line = ILEmitter::LineNr, Name = new MethodNameTok("Dispose") {Line = ILEmitter::LineNr} } })})
			ILEmitter::EmitEndTry()
			SymTable::PopScope()
			SymTable::PopUsing()
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
			ReadForeach($ForeachStmt$stm)
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
			ReadProperty($PropertyStmt$stm, fpath)
		elseif stm is PropertyGetStmt then
			ReadPropertyGet($PropertyGetStmt$stm, fpath)
		elseif stm is EndGetStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif stm is PropertySetStmt then
			ReadPropertySet($PropertySetStmt$stm, fpath)
		elseif stm is EndSetStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif stm is EndPropStmt then
			SymTable::CurnProp = null
		elseif stm is EndEventStmt then
			SymTable::CurnEvent = null
		elseif stm is EventStmt then
			ReadEvent($EventStmt$stm, fpath)
		elseif stm is EventAddStmt then
			ReadEventAdd($EventAddStmt$stm, fpath)
		elseif stm is EndAddStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif stm is EventRemoveStmt then
			ReadEventRemove($EventRemoveStmt$stm, fpath)
		elseif stm is EndRemoveStmt then
			Read(new EndMethodStmt() {Line = stm::Line}, fpath)
		elseif stm is PropertyAttrStmt then
			SymTable::AddPropCA(AttrStmtToCAB($PropertyAttrStmt$stm))
		elseif stm is EventAttrStmt then
			SymTable::AddEventCA(AttrStmtToCAB($EventAttrStmt$stm))
		elseif stm is EnumAttrStmt then
			SymTable::AddEnumCA(AttrStmtToCAB($EnumAttrStmt$stm))
		elseif stm is LockStmt then
			var lstm as LockStmt = $LockStmt$stm
			SymTable::PushScope()
			new Evaluator()::Evaluate(lstm::Lockee)
			if Loader::LoadClass("System.ValueType")::IsAssignableFrom(AsmFactory::Type02) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Locks should only be taken on Objects and not Valuetypes.")
			end if
			ILEmitter::DeclVar(String::Empty, Loader::LoadClass("System.Object"))
			ILEmitter::LocInd++
			var lockee as integer = ILEmitter::LocInd
			ILEmitter::EmitStloc(lockee)
			SymTable::AddLock(lockee)
			ILEmitter::EmitLdloc(lockee)
			ILEmitter::EmitCall(Loader::LoadClass("System.Threading.Monitor")::GetMethod("Enter", new IKVM.Reflection.Type[] {Loader::LoadClass("System.Object")}))
			ILEmitter::EmitTry()
		elseif stm is EndLockStmt then
			ILEmitter::EmitFinally()
			ILEmitter::EmitLdloc(SymTable::ReadLockeeLoc())
			ILEmitter::EmitCall(Loader::LoadClass("System.Threading.Monitor")::GetMethod("Exit", new IKVM.Reflection.Type[] {Loader::LoadClass("System.Object")}))
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
