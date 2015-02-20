//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public StmtReader
	
	field private CodeGenerator cg
	field private boolean ReturnFlg

	method public void StmtReader(var cgen as CodeGenerator)
		mybase::ctor()
		cg = cgen
	end method

	method public prototype boolean Read(var stm as Stmt, var fpath as string)

	method public CustomAttributeBuilder AttrStmtToCAB(var stm as AttrStmt)
		var typ as IKVM.Reflection.Type = null
		if !stm::Ctor::Name::Value::EndsWith("Attribute") then
			typ = Helpers::CommitEvalTTok(new TypeTok(stm::Ctor::Name::Value + "Attribute"))
		end if
		if typ is null then
			typ = Helpers::CommitEvalTTok(stm::Ctor::Name)
		end if
		if typ is null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("The Attribute Class '{0}' was not found.", stm::Ctor::Name::ToString()))
		end if

		var dia = Loader::CachedLoadClass("System.Runtime.InteropServices.DllImportAttribute")
		if dia isnot null then
			if typ::Equals(dia) then
				SymTable::PIInfo = new PInvokeInfo() {LibName = $string$Helpers::LiteralToConst($Literal$stm::Ctor::Params::get_Item(0)::Tokens::get_Item(0))}
				return null
			end if
		end if

		//if typ::get_Name() == "AssemblyNeutralAttribute" then
		//	ILEmitter::ANIFlg = true
		//end if
		
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
			if tempprop isnot null then
				piarr::Add(tempprop)
			else
				tempfld = Helpers::GetExtFld(typ,curpair::Name::Value)
				if tempfld isnot null then
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

		var ctorinf = Helpers::GetLocCtor(typ,tarr)
		if ctorinf is null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("The Constructor with the given parameter types is not defined/accessible for the class '{0}'.", typ::ToString()))
		end if

		return new CustomAttributeBuilder(ctorinf, oarr, piarr::ToArray(), poarr::ToArray(), fiarr::ToArray(), foarr::ToArray())
	end method
	
	method public void ReadClass(var clss as ClassStmt, var fpath as string)
		ILEmitter::StructFlg = false
		ILEmitter::PartialFlg = false
		ILEmitter::InterfaceFlg = false
		ILEmitter::StaticCFlg = false
		ILEmitter::AbstractCFlg = false

		SymTable::ResetTypGenParams()

		var inhtyp as IKVM.Reflection.Type = null
		var interftyp as IKVM.Reflection.Type = null
		var reft as IKVM.Reflection.Type = clss::InhClass::RefTyp
		var nrgenparams = 0

		if clss::ClassName is GenericTypeTok then
			var gmn = $GenericTypeTok$clss::ClassName
			nrgenparams = gmn::Params::get_Count()
		end if

		var ti2 as TypeItem = SymTable::TypeLst::GetTypeItem(AsmFactory::CurnNS + "." + clss::ClassName::Value, nrgenparams)

		if AsmFactory::inClass then
			AsmFactory::isNested = true
		end if
		if !AsmFactory::isNested then
			AsmFactory::inClass = true
		end if
			
		var clssparams as TypeAttributes = TypeAttributes::Class
		
		if ti2 is null then
			clssparams = Helpers::ProcessClassAttrs(clss::Attrs)
		else
			ILEmitter::InterfaceFlg = ti2::TypeBldr::get_IsInterface()
			ILEmitter::AbstractCFlg = ti2::TypeBldr::get_IsAbstract()
			ILEmitter::StaticCFlg = ti2::IsStatic
			//ILEmitter::ANIFlg = ti2::IsANI
			foreach attr in clss::Attrs
				if attr is Attributes.PartialAttr then
					ILEmitter::PartialFlg = true
					break
				end if
			end for
		end if

		var asmb as AssemblyBuilder = AsmFactory::AsmB

		if ti2 is null then
			if ILEmitter::InterfaceFlg andalso (clss::ClassName::Value notlike "^I(.)*$") then
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Interface class names should start with the letter 'I'!")
			end if

			if !AsmFactory::isNested then
				AsmFactory::CurnTypName = clss::ClassName::Value
				var typname = AsmFactory::CurnNS + "." + clss::ClassName::Value +  #ternary {nrgenparams > 0 ? "`" + $string$nrgenparams, string::Empty}

				var mdlb = AsmFactory::MdlB

				//if ILEmitter::ANIFlg then
				//	var asmn = new AssemblyName(typname) {set_Version(new Version(0,0,0,0))}
				//	asmb = ILEmitter::Univ::DefineDynamicAssembly(asmn, AssemblyBuilderAccess::Save)
				//	mdlb = asmb::DefineDynamicModule(typname + ".dll", typname + ".dll", false)
				//end if

				AsmFactory::CurnTypB = mdlb::DefineType(typname, clssparams)
				StreamUtils::WriteLine(string::Format("Adding Class: {0}.{1}" , AsmFactory::CurnNS, clss::ClassName::Value))

				if clss::ClassName is GenericTypeTok then
					var gmn = $GenericTypeTok$clss::ClassName
					var paramdefs = gmn::Params
					var genparams = new string[paramdefs::get_Count()]
					var i = -1
					foreach pd in paramdefs
						i++
						genparams[i] = pd::Value
					end for
					SymTable::SetTypGenParams(genparams, AsmFactory::CurnTypB::DefineGenericParameters(genparams))
					nrgenparams = paramdefs::get_Count()
				end if

			else
				AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
				AsmFactory::CurnTypName2 = AsmFactory::CurnTypName
				AsmFactory::CurnTypName = clss::ClassName::Value
				SymTable::CurnTypItem2 = SymTable::CurnTypItem

				StreamUtils::WriteLine(string::Format("Adding Nested Class: {0}", clss::ClassName::Value))
				AsmFactory::CurnTypB = AsmFactory::CurnTypB2::DefineNestedType(clss::ClassName::Value +  _
					#ternary {nrgenparams > 0 ? "`" + $string$nrgenparams, string::Empty}, clssparams)

				if clss::ClassName is GenericTypeTok then
					var gmn = $GenericTypeTok$clss::ClassName
					var paramdefs = gmn::Params
					var genparams = new string[paramdefs::get_Count()]
					var i = -1
					foreach pd in paramdefs
						i++
						genparams[i] = pd::Value
					end for
					SymTable::SetTypGenParams(genparams, AsmFactory::CurnTypB::DefineGenericParameters(genparams))
					nrgenparams = paramdefs::get_Count()
				end if

			end if
		else
			AsmFactory::CurnTypName = clss::ClassName::Value
			SymTable::CurnTypItem = ti2
			AsmFactory::CurnTypB = ti2::TypeBldr
			StreamUtils::WriteLine(string::Format("Continuing Class: {0}.{1}", AsmFactory::CurnNS, clss::ClassName::Value))

			if clss::ClassName is GenericTypeTok then
				var gmn = $GenericTypeTok$clss::ClassName
				var paramdefs = gmn::Params
				var genparams = new string[paramdefs::get_Count()]
				var i = -1
				foreach pd in paramdefs
					i++
					genparams[i] = pd::Value
				end for
				SymTable::SetTypGenParams(genparams, AsmFactory::CurnTypB::DefineGenericParameters(genparams))
				nrgenparams = paramdefs::get_Count()
			end if
		end if
		
		Helpers::ApplyClsAttrs()

		var ti as TypeItem = null

		if ti2 is null then
			ti = new TypeItem(#ternary{AsmFactory::isNested ? string::Empty, AsmFactory::CurnNS + "."} + clss::ClassName::Value, AsmFactory::CurnTypB) _
				{ IsStatic = ILEmitter::StaticCFlg, NrGenParams = nrgenparams, TypGenParams = SymTable::TypGenParams, AsmB = asmb}
			SymTable::CurnTypItem = ti
		
			inhtyp = reft ?? #ternary {clss::InhClass::Value::get_Length() == 0 ? _
					Loader::CachedLoadClass("System.Object"), Helpers::CommitEvalTTok(clss::InhClass)}
			if inhtyp is null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Base Class '{0}' is not defined or is not accessible.", clss::InhClass::Value))
			end if
			if inhtyp isnot null then
				if inhtyp::get_IsSealed() then
					inhtyp = null
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not inheritable.", clss::InhClass::Value))
				end if
			end if

			if !ILEmitter::InterfaceFlg then
				AsmFactory::CurnTypB::SetParent(inhtyp)
			end if

			ti::InhTyp = inhtyp
		else
			inhtyp = ti2::InhTyp
		end if

		AsmFactory::CurnInhTyp = inhtyp
		ILEmitter::StructFlg = inhtyp::Equals(Loader::CachedLoadClass("System.ValueType"))

		if ti2 is null then
			foreach k in clss::get_Constraints()::get_Keys()
				if !SymTable::TypGenParams::Contains(k) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("This class does not have a generic type parameter named {0}.", k))
					continue
				end if

				var tpi = SymTable::TypGenParams::get_Item(k)
				var bld = tpi::Bldr
				var gpa = GenericParameterAttributes::None

				foreach c in clss::get_Constraints()::get_Item(k)
					if c is StructTok then
						gpa = gpa or GenericParameterAttributes::NotNullableValueTypeConstraint
					elseif c is ClassTok then
						gpa = gpa or GenericParameterAttributes::ReferenceTypeConstraint
					elseif c is OutTok then
						if ILEmitter::InterfaceFlg then
							gpa = gpa or GenericParameterAttributes::Covariant
						else
							StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Covariance should only be used in generic interfaces or delegates")
						end if
					elseif c is InTok then
						if ILEmitter::InterfaceFlg then
							gpa = gpa or GenericParameterAttributes::Contravariant
						else
							StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Contravariance should only be used in generic interfaces or delegates")
						end if
					elseif c is NewTok then
						gpa = gpa or GenericParameterAttributes::DefaultConstructorConstraint
						tpi::HasCtor = true
					elseif c is TypeTok
						var tout = Helpers::CommitEvalTTok($TypeTok$c)
						if tout is null then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", c::ToString()))
						end if
						if tout::get_IsInterface() then
							tpi::Interfaces::Add(tout)
						else
							bld::SetBaseTypeConstraint(tout)
							tpi::BaseType = tout
						end if
					end if
				end for

				bld::SetGenericParameterAttributes(gpa)
				bld::SetInterfaceConstraints(tpi::Interfaces::ToArray())
			end for

			if !AsmFactory::isNested then
				SymTable::TypeLst::AddType(ti)
			else
				SymTable::CurnTypItem2::AddType(ti)
			end if

			foreach interf in clss::ImplInterfaces
				interftyp = Helpers::CommitEvalTTok(interf)
				if interftyp is null then
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

		//ILEmitter::ANIFlg = false
		cg::Process(clss, fpath)
	end method
	
	method public void ReadEnum(var clss as EnumStmt, var fpath as string)
		//if AsmFactory::inClass then
		//	AsmFactory::isNested = true
		//end if
		AsmFactory::inEnum = true
		
		var enumtyp = Helpers::CommitEvalTTok(clss::EnumTyp)
		if enumtyp is null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", clss::EnumTyp::Value))
		end if

		var asmb as AssemblyBuilder = AsmFactory::AsmB
		var clssparams as TypeAttributes = Helpers::ProcessClassAttrsE(clss::Attrs) or TypeAttributes::Sealed		
		var mdlb = AsmFactory::MdlB
		var typname = AsmFactory::CurnNS + "." + clss::EnumName::Value

		//if ILEmitter::ANIFlg then
		//	var asmn = new AssemblyName(typname) {set_Version(new Version(0,0,0,0))}
		//	asmb = ILEmitter::Univ::DefineDynamicAssembly(asmn, AssemblyBuilderAccess::Save)
		//	mdlb = asmb::DefineDynamicModule(typname + ".dll", typname + ".dll", false)
		//end if

		//if !AsmFactory::isNested then
			AsmFactory::CurnTypName = clss::EnumName::Value
			AsmFactory::CurnEnumB = mdlb::DefineEnum(typname, clssparams, enumtyp)
			StreamUtils::WriteLine(string::Format("Adding Enum: {0}.{1}" , AsmFactory::CurnNS, clss::EnumName::Value))
		//else
		//	AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
		//	StreamUtils::WriteLine(string::Format("Adding Nested Enum: {0}", clss::EnumName::Value))
		//	AsmFactory::CurnTypName = clss::EnumName::Value
		//	AsmFactory::CurnEnumB = AsmFactory::CurnTypB2::DefineEnum(clss::EnumName::Value, clssparams, enumtyp)
		//end if
		
		Helpers::ApplyEnumAttrs()

		var ti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + clss::EnumName::Value, AsmFactory::CurnEnumB) _
			{InhTyp = enumtyp, AsmB = asmb}
		
		//ILEmitter::ANIFlg = false

		SymTable::CurnTypItem = ti
		SymTable::TypeLst::AddType(ti)
		cg::Process(clss, fpath)
	end method
	
	method public void ReadDelegate(var dels as DelegateStmt)
		ILEmitter::StructFlg = false
		ILEmitter::InterfaceFlg = false
		ILEmitter::StaticCFlg = false

		SymTable::ResetTypGenParams()

		if AsmFactory::inClass then
			AsmFactory::isNested = true
		end if
		if !AsmFactory::isNested then
			AsmFactory::inClass = true
		end if

		var nrgenparams = 0

		if dels::DelegateName is GenericMethodNameTok then
			var gmn = $GenericMethodNameTok$dels::DelegateName
			nrgenparams = gmn::Params::get_Count()
		end if

		var dta as TypeAttributes = Helpers::ProcessClassAttrs(dels::Attrs) or TypeAttributes::AnsiClass or TypeAttributes::Sealed or TypeAttributes::AutoClass
		var dinhtyp as IKVM.Reflection.Type = Loader::CachedLoadClass("System.MulticastDelegate")
		AsmFactory::CurnInhTyp = dinhtyp

		if !AsmFactory::isNested then
			AsmFactory::CurnTypName = dels::DelegateName::Value
			AsmFactory::CurnTypB = AsmFactory::MdlB::DefineType(AsmFactory::CurnNS + "." + dels::DelegateName::Value +  _
					#ternary {nrgenparams > 0 ? "`" + $string$nrgenparams, string::Empty}, dta, dinhtyp)
			StreamUtils::Write("Adding Delegate: ")
			StreamUtils::WriteLine(AsmFactory::CurnNS + "." + dels::DelegateName::Value)
		else
			AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
			AsmFactory::CurnTypName2 = AsmFactory::CurnTypName
			SymTable::CurnTypItem2 = SymTable::CurnTypItem

			StreamUtils::Write("Adding Nested Delegate: ")
			StreamUtils::WriteLine(dels::DelegateName::Value)
			AsmFactory::CurnTypName = dels::DelegateName::Value
			AsmFactory::CurnTypB = AsmFactory::CurnTypB2::DefineNestedType(dels::DelegateName::Value +  _
					#ternary {nrgenparams > 0 ? "`" + $string$nrgenparams, string::Empty}, dta, dinhtyp)
		end if
		
		Helpers::ApplyClsAttrs()

		SymTable::ResetVar()
		SymTable::ResetIf()
		SymTable::ResetTry()
		SymTable::ResetLoop()
		SymTable::ResetLbl()

		if dels::DelegateName is GenericMethodNameTok then
			var gmn = $GenericMethodNameTok$dels::DelegateName
			var paramdefs = gmn::Params
			var genparams = new string[paramdefs::get_Count()]
			var i = -1
			foreach pd in paramdefs
				i++
				genparams[i] = pd::Value
			end for
			SymTable::SetTypGenParams(genparams, AsmFactory::CurnTypB::DefineGenericParameters(genparams))
			nrgenparams = paramdefs::get_Count()

			foreach k in gmn::get_Constraints()::get_Keys()
				if !SymTable::TypGenParams::Contains(k) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("This delegate does not have a generic type parameter named {0}.", k))
					continue
				end if

				var tpi = SymTable::TypGenParams::get_Item(k)
				var bld = tpi::Bldr
				var gpa = GenericParameterAttributes::None

				foreach c in gmn::get_Constraints()::get_Item(k)
					if c is StructTok then
						gpa = gpa or GenericParameterAttributes::NotNullableValueTypeConstraint
					elseif c is ClassTok then
						gpa = gpa or GenericParameterAttributes::ReferenceTypeConstraint
					elseif c is OutTok then
						gpa = gpa or GenericParameterAttributes::Covariant
					elseif c is InTok then
						gpa = gpa or GenericParameterAttributes::Contravariant
					elseif c is NewTok then
						gpa = gpa or GenericParameterAttributes::DefaultConstructorConstraint
						tpi::HasCtor = true
					elseif c is TypeTok
						var tout = Helpers::CommitEvalTTok($TypeTok$c)
						if tout is null then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", c::ToString()))
						end if
						if tout::get_IsInterface() then
							tpi::Interfaces::Add(tout)
						else
							bld::SetBaseTypeConstraint(tout)
							tpi::BaseType = tout
						end if
					end if
				end for

				bld::SetGenericParameterAttributes(gpa)
				bld::SetInterfaceConstraints(tpi::Interfaces::ToArray())
			end for
		end if

		var dti as TypeItem = new TypeItem(AsmFactory::CurnNS + "." + dels::DelegateName::Value,AsmFactory::CurnTypB) _
			{InhTyp = dinhtyp, NrGenParams = nrgenparams, TypGenParams = SymTable::TypGenParams}
		SymTable::CurnTypItem = dti

		var dtarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[] {Loader::LoadClass("System.Object"), Loader::LoadClass("System.IntPtr")}
		AsmFactory::CurnConB = AsmFactory::CurnTypB::DefineConstructor(MethodAttributes::HideBySig or MethodAttributes::Public _
			, CallingConventions::Standard, dtarr)
		AsmFactory::InitDelConstr()

		SymTable::CurnTypItem::AddCtor(new CtorItem(dtarr,AsmFactory::CurnConB))

		var dema as MethodAttributes = MethodAttributes::HideBySig or MethodAttributes::Public or MethodAttributes::NewSlot or MethodAttributes::Virtual
		dtarr = #ternary {dels::Params::get_Count() == 0 ? IKVM.Reflection.Type::EmptyTypes, Helpers::ProcessParams(dels::Params)}
		
		var drettyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(dels::RetTyp)
		
		if drettyp is null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + dels::RetTyp::Value + "' is not defined or is not accessible.")
		end if

		AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod("Invoke", dema, drettyp, dtarr)
		AsmFactory::InitDelMet()
		Helpers::PostProcessParams(dels::Params)

		SymTable::CurnTypItem::AddMethod(new MethodItem("Invoke",drettyp,dtarr,AsmFactory::CurnMetB))

		var dtarr2 as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[dtarr[l] + 2]
		Array::Copy(dtarr,dtarr2,$long$dtarr[l])
		dtarr2[dtarr2[l] - 2] = Loader::CachedLoadClass("System.AsyncCallback")
		dtarr2[--dtarr2[l]] = Loader::CachedLoadClass("System.Object")

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
		dtarr3[--dtarr3[l]] = Loader::CachedLoadClass("System.IAsyncResult")

		AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod("EndInvoke", dema, drettyp, dtarr3)
		AsmFactory::InitDelMet()

		SymTable::CurnTypItem::AddMethod(new MethodItem("EndInvoke",drettyp,dtarr3,AsmFactory::CurnMetB))

		SymTable::TypeLst::AddType(dti)

		AsmFactory::CreateTyp()
		if AsmFactory::isNested then
			AsmFactory::CurnTypB = AsmFactory::CurnTypB2
			AsmFactory::CurnTypName = AsmFactory::CurnTypName2
			SymTable::CurnTypItem = SymTable::CurnTypItem2
			AsmFactory::isNested = false
		else
			AsmFactory::inClass = false
		end if
	end method
	
	method public void ReadMethod(var mtss as MethodStmt, var fpath as string)
		ILEmitter::StaticFlg = false
		ILEmitter::AbstractFlg = false
		ILEmitter::ProtoFlg = false
		ILEmitter::PInvokeFlg = false
		ILEmitter::OverrideFlg = false

		SymTable::ResetVar()
		SymTable::ResetIf()
		SymTable::ResetLbl()
		SymTable::ResetTry()
		SymTable::ResetLoop()

		SymTable::ResetMetGenParams()

		var mtssnamstr as string = mtss::MethodName::Value
		var typ as IKVM.Reflection.Type = null
		
		//var mtssnamarr as C5.IList<of string>
		var overldnam as string = String::Empty
		var overldmtd as MethodInfo = null
		var mipt as MethodItem = null
		var fromproto as boolean = false
		var rettyp as IKVM.Reflection.Type = null

		if (mtssnamstr == AsmFactory::CurnTypName) orelse (mtssnamstr like "^ctor\d*$") then
			StreamUtils::WriteLine("	Adding Constructor: " + mtssnamstr)
			rettyp = Loader::CachedLoadClass("System.Void")
			var paramstyps as IKVM.Reflection.Type[] = #ternary {mtss::Params::get_Count() == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}			
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
			
//			if AsmFactory::isNested then
//				SymTable::AddNestedCtor(paramstyps, AsmFactory::CurnConB)
//			else
				SymTable::AddCtor(paramstyps, AsmFactory::CurnConB)
//			end if
			if mtss::Params::get_Count() != 0 then
				Helpers::PostProcessParamsConstr(mtss::Params)
			end if
			AsmFactory::InCtorFlg = true
		else
			//mtssnamarr = ParseUtils::StringParserL(mtssnamstr, '.')
			if mtss::MethodName::ExplType isnot null then
				overldnam = mtssnamstr
				typ = Helpers::CommitEvalTTok(mtss::MethodName::ExplType)
				mtssnamstr = string::Format("{0}.{1}", typ::ToString(), overldnam)
			end if
			
			var paramstyps as IKVM.Reflection.Type[]
			var nrgenparams = 0
			
			if mtss::MethodName isnot GenericMethodNameTok then
				paramstyps = #ternary {mtss::Params::get_Count() == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}
				mipt = SymTable::FindProtoMet(mtssnamstr, paramstyps)
			end if
			
			fromproto = mipt isnot null
			
			if fromproto then
				StreamUtils::WriteLine("	Continuing Method: " + mtssnamstr)
				AsmFactory::CurnMetB = mipt::MethodBldr
				ILEmitter::StaticFlg = AsmFactory::CurnMetB::get_IsStatic()
				ILEmitter::AbstractFlg = AsmFactory::CurnMetB::get_IsAbstract()
				rettyp = AsmFactory::CurnMetB::get_ReturnType()
			else
				StreamUtils::WriteLine("	Adding Method: " + mtssnamstr)

				if ILEmitter::InterfaceFlg then
					mtss::AddAttr(new AbstractAttr())
				end if
				if mtss::MethodName::ExplType isnot null then
					mtss::AddAttr(new FinalAttr())
				end if

				var ma = Helpers::ProcessMethodAttrs(mtss::Attrs)
				var pinfo = SymTable::PIInfo
				
				if ILEmitter::PInvokeFlg then
					
					paramstyps = #ternary {mtss::Params::get_Count() == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}
					rettyp = Helpers::CommitEvalTTok(mtss::RetTyp)
					if rettyp = null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", mtss::RetTyp::Value))
					end if

					AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefinePInvokeMethod(mtssnamstr, pinfo::LibName, ma, CallingConventions::Standard, rettyp, paramstyps, pinfo::CallConv, pinfo::CSet)
				else
					AsmFactory::CurnMetB = AsmFactory::CurnTypB::DefineMethod(mtssnamstr, ma, Loader::CachedLoadClass("System.Void"), IKVM.Reflection.Type::EmptyTypes)
					
					if mtss::MethodName is GenericMethodNameTok then
						var gmn = $GenericMethodNameTok$mtss::MethodName
						var paramdefs = gmn::Params
						var genparams = new string[paramdefs::get_Count()]
						var i = -1
						foreach pd in paramdefs
							i++
							genparams[i] = pd::Value
						end for
						SymTable::SetMetGenParams(genparams, AsmFactory::CurnMetB::DefineGenericParameters(genparams))
						nrgenparams = paramdefs::get_Count()

						foreach k in gmn::get_Constraints()::get_Keys()
							if !SymTable::MetGenParams::Contains(k) then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("This method does not have a generic type parameter named {0}.", k))
								continue
							end if

							var tpi = SymTable::MetGenParams::get_Item(k)
							var bld = tpi::Bldr
							var gpa = GenericParameterAttributes::None

							foreach c in gmn::get_Constraints()::get_Item(k)
								if c is StructTok then
									gpa = gpa or GenericParameterAttributes::NotNullableValueTypeConstraint
								elseif c is ClassTok then
									gpa = gpa or GenericParameterAttributes::ReferenceTypeConstraint
								elseif c is OutTok then
									StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Covariance should not be used in generic methods")
								elseif c is InTok then
									StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Contravariance should not be used in generic methods")
								elseif c is NewTok then
									gpa = gpa or GenericParameterAttributes::DefaultConstructorConstraint
									tpi::HasCtor = true
								elseif c is TypeTok
									var tout = Helpers::CommitEvalTTok($TypeTok$c)
									if tout is null then
										StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", c::ToString()))
									end if
									if tout::get_IsInterface() then
										tpi::Interfaces::Add(tout)
									else
										bld::SetBaseTypeConstraint(tout)
										tpi::BaseType = tout
									end if
								end if
							end for

							bld::SetGenericParameterAttributes(gpa)
							bld::SetInterfaceConstraints(tpi::Interfaces::ToArray())
						end for

					end if
					
					paramstyps = #ternary {mtss::Params::get_Count() == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(mtss::Params)}
					rettyp = Helpers::CommitEvalTTok(mtss::RetTyp)
					if rettyp is null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined or is not accessible.", mtss::RetTyp::Value))
					end if
					AsmFactory::CurnMetB::SetReturnType(rettyp)
					AsmFactory::CurnMetB::SetParameters(paramstyps)

					//overridability check
				end if
			end if
			
			//if ILEmitter::InterfaceFlg and !ILEmitter::AbstractFlg then
			//	StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Methods in Interfaces should all be Abstract!")
			if ILEmitter::InterfaceFlg and ILEmitter::StaticFlg then
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

				if mtss::MethodName::ExplType isnot null then
					overldmtd = Helpers::GetExtMet(typ, mtss::MethodName, paramstyps)
					AsmFactory::CurnTypB::DefineMethodOverride(AsmFactory::CurnMetB, overldmtd)
				end if
			end if
			
			if !fromproto then
//				if AsmFactory::isNested then
//					SymTable::AddNestedMet(mtssnamstr, rettyp, paramstyps, AsmFactory::CurnMetB)
//				else
					SymTable::AddMet(mtssnamstr, rettyp, paramstyps, AsmFactory::CurnMetB, nrgenparams)
//				end if
			end if
			
			if !ILEmitter::ProtoFlg then
				if mtss::Params::get_Count() != 0 then
					Helpers::PostProcessParams(mtss::Params)
				end if
			end if
		end if
		
		Helpers::ApplyMetAttrs()
		
		if !#expr(ILEmitter::AbstractFlg orelse ILEmitter::ProtoFlg orelse ILEmitter::PInvokeFlg) then
			AsmFactory::InMethodFlg = true
		end if
		AsmFactory::CurnMetName = mtssnamstr

		if (mtss::get_Parent() isnot null) andalso !mtss::IsOneLiner(mtss::get_Parent()) then
			var res = cg::Process(mtss, fpath)

			if !rettyp::Equals(Loader::CachedLoadClass("System.Void")) then
				if !res::get_Item1() then
					StreamUtils::WriteWarn(mtss::Line, fpath, "This method may not return/throw in all code paths!")
				end if
			end if
		end if
	end method
	
	method public void ReadForeach(var festm as ForeachStmt, var fpath as string)
		SymTable::PushScope()
		new Evaluator()::Evaluate(festm::Exp)
		var mtds as MethodInfo[] = Helpers::ProcessForeach(AsmFactory::Type02)
		var ttu = Helpers::CommitEvalTTok(festm::Typ)
		if (ttu is null) andalso (festm::Typ isnot null) then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", festm::Typ::ToString()))
		end if
		var ttu2 as IKVM.Reflection.Type
		if mtds isnot null then
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
			if ttu isnot null then
				if !ttu::Equals(mtds[2]::get_ReturnType()) then
					Helpers::EmitConv(mtds[2]::get_ReturnType(), ttu)
				end if
			end if
			ILEmitter::EmitStloc(ILEmitter::LocInd)
		else
			mtds = Helpers::ProcessForeach2(AsmFactory::Type02)
			if mtds isnot null then
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
				if ttu isnot null then
					if !ttu::Equals(mtds[1]::get_ReturnType()) then
						Helpers::EmitConv(mtds[1]::get_ReturnType(), ttu)
					end if
				end if
				ILEmitter::EmitStloc(ILEmitter::LocInd)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class {0} is not an IEnumerable/IEnumerator or IEnumerable<of T>/IEnumerator<of T>.", AsmFactory::Type02::ToString()))
			end if
		end if
		cg::Process(festm, fpath)
	end method
	
	method public void ReadEvent(var evss as EventStmt, var fpath as string)
		var etyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(evss::EventTyp)
		var eit = string::Empty
		var eit2 as TypeTok = null
		var typ as IKVM.Reflection.Type = null
		
		if etyp is null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + evss::EventTyp::Value + "' is not defined.")
		end if
		
		var evssnamstr as string = evss::EventName::Value
		//var evssnamarr as C5.IList<of string> = ParseUtils::StringParserL(evssnamstr, '.')
		var evoverldnam as string = string::Empty
		var evnam = evssnamstr
		if evss::EventName::ExplType isnot null then
			evoverldnam = evss::EventName::Value
			evnam = evoverldnam
			typ = Helpers::CommitEvalTTok(evss::EventName::ExplType)
			eit = typ::ToString()
			eit2 = evss::EventName::ExplType
			evssnamstr = i"{typ::ToString()}.{evoverldnam}"
		end if
		
		AsmFactory::CurnEventB = AsmFactory::CurnTypB::DefineEvent(evssnamstr,EventAttributes::None, etyp)
		SymTable::CurnEvent = new EventItem(evnam, etyp, AsmFactory::CurnEventB, evss::Attrs, eit) {ExplType = eit2}
		AsmFactory::CurnEventType = etyp
		
		Helpers::ApplyEventAttrs()
		
		StreamUtils::WriteLine("	Adding Event: " + evss::EventName::Value)
		cg::Process(evss, fpath)
	end method
	
	method public void ReadEventAdd(var evas as EventAddStmt, var fpath as string)
		if evas::Adder isnot null then
			if SymTable::CurnEvent::ExplImplType::get_Length() > 0 then
				evas::Adder::Value = SymTable::CurnEvent::ExplImplType + "." + evas::Adder::Value
			end if
			
			var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(evas:Adder::Value, new IKVM.Reflection.Type[] {SymTable::CurnEvent::EventTyp})
			if mb isnot null then
				AsmFactory::CurnEventB::SetAddOnMethod(mb)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + evas::Adder::Value + "' with the required signature is not defined.")
			end if
			StreamUtils::Write("		Setting Event Adder: ")
			StreamUtils::WriteLine(evas::Adder::Value)
		else
			var cevent = SymTable::CurnEvent
			var mets = new MethodStmt() {MethodName = new MethodNameTok(new Ident("add_" + cevent::Name)) {ExplType = cevent::ExplType}, RetTyp = new VoidTok(), Line = evas::Line,  _
				 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cevent::Attrs), Add(new SpecialNameAttr())}}
			mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cevent::EventTyp)})
			Read(mets,fpath)
			cevent::EventBldr::SetAddOnMethod(AsmFactory::CurnMetB)
		end if
		cg::Process(evas, fpath)
	end method
	
	method public void ReadEventRemove(var evas as EventRemoveStmt, var fpath as string)
		if evas::Remover isnot null then
			if SymTable::CurnEvent::ExplImplType::get_Length() > 0 then
				evas::Remover::Value = SymTable::CurnEvent::ExplImplType + "." + evas::Remover::Value
			end if
			
			var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(evas:Remover::Value, new IKVM.Reflection.Type[] {SymTable::CurnEvent::EventTyp})
			if mb isnot null then
				AsmFactory::CurnEventB::SetRemoveOnMethod(mb)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + evas::Remover::Value + "' with the required signature is not defined.")
			end if
			StreamUtils::Write("		Setting Event Remover: ")
			StreamUtils::WriteLine(evas::Remover::Value)
		else
			var cevent = SymTable::CurnEvent
			var mets = new MethodStmt() {MethodName = new MethodNameTok(new Ident("remove_" + cevent::Name)) {ExplType = cevent::ExplType}, RetTyp = new VoidTok(), Line = evas::Line,  _
				 Attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cevent::Attrs), Add(new SpecialNameAttr())}}
			mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cevent::EventTyp)})
			Read(mets,fpath)
			cevent::EventBldr::SetRemoveOnMethod(AsmFactory::CurnMetB)
		end if
		cg::Process(evas, fpath)
	end method
	
	method public void ReadVer(var asmv as VerStmt, var fpath as string)
		AsmFactory::AsmNameStr::set_Version(asmv::ToVersion())
		if AsmFactory::PCLSet then
			AsmFactory::AsmNameStr::set_Flags(AssemblyNameFlags::Retargetable)
		end if

		var mods as string = #ternary {AsmFactory::AsmMode == "exe" or AsmFactory::AsmMode == "winexe" ? "exe", "dll" }

		AsmFactory::AsmB = ILEmitter::Univ::DefineDynamicAssembly(AsmFactory::AsmNameStr, AssemblyBuilderAccess::Save, Directory::GetCurrentDirectory())
		AsmFactory::MdlB = AsmFactory::AsmB::DefineDynamicModule(AsmFactory::AsmNameStr::get_Name() + "." + mods, AsmFactory::AsmNameStr::get_Name() + "." + mods, AsmFactory::DebugFlg)

		if AsmFactory::DebugFlg then
			fpath = Path::GetFullPath(fpath)
			var docw as ISymbolDocumentWriter = AsmFactory::MdlB::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
			ILEmitter::DocWriter = docw
			ILEmitter::AddDocWriter(docw)
		end if

		// --------------------------------------------------------------------------------------------------------
		if AsmFactory::DebugFlg then
			var dtyp as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Diagnostics.DebuggableAttribute")
			var debugattr as DebuggableAttribute\DebuggingModes = DebuggableAttribute\DebuggingModes::Default or DebuggableAttribute\DebuggingModes::DisableOptimizations
			var dattyp as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Diagnostics.DebuggableAttribute\DebuggingModes")
			AsmFactory::AsmB::SetCustomAttribute(new CustomAttributeBuilder(dtyp::GetConstructor(new IKVM.Reflection.Type[] {dattyp}), new object[] {$object$debugattr}))
		end if
		// --------------------------------------------------------------------------------------------------------
		
		Helpers::ApplyAsmAttrs()
		
		AsmFactory::AsmFile = AsmFactory::AsmNameStr::get_Name() + "." + mods
//		Importer::AddAsm(AsmFactory::AsmB)
	end method
	
	method public void ReadField(var flss as FieldStmt)
		var ftyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(flss::FieldTyp)
			
		if ftyp is null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", flss::FieldTyp::Value))
		end if
		
		AsmFactory::CurnFldB = AsmFactory::CurnTypB::DefineField(flss::FieldName::Value, ftyp, Helpers::ProcessFieldAttrs(flss::Attrs))
		
		if ILEmitter::InterfaceFlg then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Interfaces should not have Fields!")
		elseif !AsmFactory::CurnFldB::get_IsStatic() andalso ILEmitter::StaticCFlg then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Fields!")
		end if
		
		Helpers::ApplyFldAttrs()
		
		var litval as ConstInfo = null
		if AsmFactory::CurnFldB::get_IsLiteral() then
			if flss::ConstExp is null then
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
		
//		if AsmFactory::isNested then
//			SymTable::AddNestedFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB)
//		else
			SymTable::AddFld(flss::FieldName::Value, ftyp, AsmFactory::CurnFldB, #ternary{ litval is null ? null, litval::Value})
//		end if

		StreamUtils::Write(#ternary{AsmFactory::CurnFldB::get_IsLiteral() ?  "	Adding Constant: ", "	Adding Field: "})
		StreamUtils::WriteLine(flss::FieldName::Value)
	end method
	
	method public void ReadFor(var fstm as ForStmt, var fpath as string)
		var ttu = Helpers::CommitEvalTTok(fstm::Typ)
		if ttu is null andalso (fstm::Typ isnot null) then
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
		if ttu isnot null then
			if !ttu::Equals(AsmFactory::Type02) then
				Helpers::EmitConv(AsmFactory::Type02, ttu)
			end if
		end if
		ILEmitter::EmitStloc(ILEmitter::LocInd)
		
		SymTable::AddForLoop(fstm::Iter::Value, fstm::StepExp, fstm::Direction, fstm::Typ)
		ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
		var et = eval::ConvToAST(eval::ConvToRPN(fstm::EndExp))
		eval::ASTEmit(et, false)
		if ttu isnot null then
			if !ttu::Equals(AsmFactory::Type02) then
				et = new ExprCallTok() {Exp = new Expr() {AddToken(et)}, set_Conv(true), set_TTok(fstm::Typ), set_OrdOp("conv")}
			end if
		end if

		//allow optimise
		if !#expr(eval::Evaluate(new Expr() {Line = fstm::Line, AddToken(fstm::Iter), AddToken(#ternary{fstm::Direction ? new GtOp(), new LtOp()}) , _
			AddToken(et)}, BranchOptimisation::Normal, SymTable::ReadLoopEndLbl())) then
			ILEmitter::EmitBrtrue(SymTable::ReadLoopEndLbl())
		end if		

		cg::Process(fstm, fpath)
	end method

	method private boolean StripVisibility(var a as Attributes.Attribute)
		return a isnot VisibilityAttr
	end method

	method public void ReadPropertyGet(var prgs as PropertyGetStmt, var fpath as string)
		var cprop = SymTable::CurnProp
		if prgs::Getter isnot null then
			if cprop::ExplImplType::get_Length() > 0 then
				prgs::Getter::Value = cprop::ExplImplType + "." + prgs::Getter::Value
			end if
			
			var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(prgs::Getter::Value, cprop::ParamTyps)
			if mb isnot null then
				AsmFactory::CurnPropB::SetGetMethod(mb)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + prgs::Getter::Value + "' with the required signature is not defined.")
			end if
			StreamUtils::Write("		Setting Property Getter: ")
			StreamUtils::WriteLine(prgs::Getter::Value)
		else
			var attrs as C5.LinkedList<of Attributes.Attribute>
			if prgs::Visibility is null then
				attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cprop::Attrs), Add(new SpecialNameAttr())}
			else
				attrs = new C5.LinkedList<of Attributes.Attribute>() { _
					AddAll(Enumerable::Where<of Attributes.Attribute>(cprop::Attrs, new Func<of Attributes.Attribute, boolean>(StripVisibility))) _
					, Add(prgs::Visibility), Add(new SpecialNameAttr())}
			end if

			Read(new MethodStmt() {MethodName = new MethodNameTok(new Ident("get_" + cprop::Name)) {ExplType = cprop::ExplType}, RetTyp = new TypeTok(cprop::PropertyTyp), Line = prgs::Line, Params = cprop::Params, _
				 Attrs = attrs}, fpath)
			cprop::PropertyBldr::SetGetMethod(AsmFactory::CurnMetB)
		end if
		cg::Process(prgs, fpath)
	end method
	
	method public void ReadPropertySet(var prss as PropertySetStmt, var fpath as string)
		var cprop = SymTable::CurnProp
		if prss::Setter isnot null then
			if cprop::ExplImplType::get_Length() > 0 then
				prss::Setter::Value = cprop::ExplImplType + "." + prss::Setter::Value
			end if
			
			var mb as MethodBuilder = $MethodBuilder$SymTable::FindMet(prss::Setter::Value, _
				Enumerable::ToArray<of IKVM.Reflection.Type>(Enumerable::Concat<of IKVM.Reflection.Type>(cprop::ParamTyps, new IKVM.Reflection.Type[] {cprop::PropertyTyp})) )
			if mb isnot null then
				AsmFactory::CurnPropB::SetSetMethod(mb)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Method '" + prss::Setter::Value + "' with the required signature is not defined.")
			end if
			StreamUtils::Write("		Setting Property Setter: ")
			StreamUtils::WriteLine(prss::Setter::Value)
		else
			var attrs as C5.LinkedList<of Attributes.Attribute>
			if prss::Visibility is null then
				attrs = new C5.LinkedList<of Attributes.Attribute>() {AddAll(cprop::Attrs), Add(new SpecialNameAttr())}
			else
				attrs = new C5.LinkedList<of Attributes.Attribute>() { _
					AddAll(Enumerable::Where<of Attributes.Attribute>(cprop::Attrs, new Func<of Attributes.Attribute, boolean>(StripVisibility))) _
					, Add(prss::Visibility), Add(new SpecialNameAttr())}
			end if

			var mets = new MethodStmt() {MethodName = new MethodNameTok(new Ident("set_" + cprop::Name)) {ExplType = cprop::ExplType}, RetTyp = new VoidTok(), Line = prss::Line, Params = cprop::Params,  _
				 Attrs = attrs}
			mets::AddParam(new VarExpr() {VarName = new Ident("value"), VarTyp = new TypeTok(cprop::PropertyTyp)})
			Read(mets,fpath)
			cprop::PropertyBldr::SetSetMethod(AsmFactory::CurnMetB)
		end if
		cg::Process(prss, fpath)
	end method
	
	method public void ReadProperty(var prss as PropertyStmt, var fpath as string)
		if prss::PropertyName::Value == "IEnumerator" then
			prss = prss
		end if

		var ptyp as IKVM.Reflection.Type = Helpers::CommitEvalTTok(prss::PropertyTyp)
		var eit = string::Empty
		var eit2 as TypeTok = null
		var typ as IKVM.Reflection.Type = null
		
		if ptyp is null then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + prss::PropertyTyp::Value + "' is not defined.")
		end if

		var paramstyps as IKVM.Reflection.Type[] = #ternary {prss::Params::get_Count() == 0 ? IKVM.Reflection.Type::EmptyTypes , Helpers::ProcessParams(prss::Params)}

		var prssnamstr as string = prss::PropertyName::Value
		//var prssnamarr as C5.IList<of string> = ParseUtils::StringParserL(prssnamstr, '.')
		var propoverldnam as string = string::Empty
		var propnam = prssnamstr
		if prss::PropertyName::ExplType isnot null then
			propoverldnam = prss::PropertyName::Value
			propnam = propoverldnam
			typ = Helpers::CommitEvalTTok(prss::PropertyName::ExplType)
			eit2 = prss::PropertyName::ExplType
			eit = typ::ToString()
			prssnamstr = i"{typ::ToString()}.{propoverldnam}"
		end if

		StreamUtils::Write("	Adding Property: ")
		StreamUtils::WriteLine(prss::PropertyName::Value)
		
		var isauto as boolean = false
		var isautoind as integer = -1
		var isrdonly as boolean = false
		var isrdonlyind as integer = -1
		var isstatic as boolean = false
		var isabstract as boolean = false

		if ILEmitter::InterfaceFlg then
			prss::AddAttr(new AbstractAttr())
		end if

		var pattrs = new C5.ArrayList<of Attributes.Attribute>() {AddAll(prss::Attrs)}

		AsmFactory::CurnPropB = AsmFactory::CurnTypB::DefineProperty(prssnamstr, PropertyAttributes::None, ptyp, paramstyps)
		SymTable::CurnProp = new PropertyItem(propnam, ptyp, AsmFactory::CurnPropB, pattrs, eit) {ParamTyps = paramstyps, Params = prss::Params, ExplType = eit2}
		
		Helpers::ApplyPropAttrs()

		var i as integer = -1
		foreach a in prss::Attrs
			i++
			if a is AutoGenAttr then
				isauto = true
				isautoind = i
			elseif a is InitOnlyAttr then
				isrdonly = true
				isrdonlyind = #ternary {isauto ? --i, i}
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

			pattrs::RemoveAt(isautoind)
			if isrdonly then
				pattrs::RemoveAt(isrdonlyind)
			end if

			//it is not an error that these are not eval'd in all cases (METHODS HAVE SIMILAR VALIDATION)
			//if ILEmitter::InterfaceFlg and !isabstract then
			//	StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Properties in Interfaces should all be Abstract!")
			if ILEmitter::InterfaceFlg and isstatic then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Properties in Interfaces should not be Static!")
			elseif !isstatic and ILEmitter::StaticCFlg then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Static Classes should not have Instance Properties!")
			end if
			
			//field
			if !isabstract then
				var fld = Helpers::GetLocFld("_" + propnam)
				if fld is null then
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
		if !prss::IsOneLiner(prss::get_Parent()) then
			cg::Process(prss, fpath)
		end if
	end method
	
	method public void ReadEndDo(var fpath as string)
		var fl = SymTable::ReadLoop() as ForLoopItem
		if fl isnot null then
			if fl::ContinueFlg then
				ILEmitter::MarkLbl(fl::StepLabel)
			end if
			if fl::StepExp is null then
				Read(#ternary{fl::Direction ? new IncStmt() {Line = fl::Line, NumVar = new Ident(fl::Iter)}, _
					new DecStmt() {Line = fl::Line, NumVar = new Ident(fl::Iter)}},fpath)
			else
				var ttu = Helpers::CommitEvalTTok(fl::Typ)
				if (ttu is null) andalso (fl::Typ isnot null) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", fl::Typ::ToString()))
				end if
				
				var eval = new Evaluator()
				var idt = new Ident(fl::Iter) {Line = fl::Line}
				var et = eval::ConvToAST(eval::ConvToRPN(fl::StepExp))	
				eval::ASTEmit(et, false)
				
				if ttu isnot null then
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

	method public void PreRead(var line as integer, var fpath as string)
		AsmFactory::ChainFlg = false
		ILEmitter::LineNr = line
		ILEmitter::CurSrcFile = fpath
		SymTable::StoreFlg = false

		if AsmFactory::DebugFlg andalso AsmFactory::InMethodFlg then
			ILEmitter::MarkDbgPt(line)
		end if
	end method

	method public boolean Read(var stm as Stmt, var fpath as string)
		var vtyp as IKVM.Reflection.Type = null
		var eval as Evaluator = null

		PreRead(stm::Line, fpath)

		if stm is RefasmStmt then
			var rastm as RefasmStmt = $RefasmStmt$stm
			rastm::AsmPath::Value = rastm::AsmPath::get_UnquotedValue()

			if rastm::AsmPath::Value like "^memory:(.)*$" then
				var pth = rastm::AsmPath::Value::Substring(7)

				if !MemoryFS::HasFile(pth) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "In-Memory Assembly File '" + pth + "' does not exist.")
				end if
			
				StreamUtils::Write("Referencing In-Memory Assembly: ")
				StreamUtils::WriteLine(pth)
				Importer::AddAsm(rastm::AsmPath::Value, ILEmitter::Univ::LoadAssembly(ILEmitter::Univ::OpenRawModule(MemoryFS::GetFile(pth), $string$null)))

				//if rastm::EmbedIfUsed then
				//	SymTable::ResLst::Add(Tuple::Create<of string, string, boolean, boolean>(rastm::AsmPath::Value, string::Empty, true, true))
				//end if

			else
				rastm::AsmPath::Value = ParseUtils::ProcessMSYSPath(rastm::AsmPath::Value)
			
				if !File::Exists(rastm::AsmPath::Value) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Assembly File '" + rastm::AsmPath::Value + "' does not exist.")
				end if
			
				StreamUtils::Write("Referencing Assembly: ")
				StreamUtils::WriteLine(rastm::AsmPath::Value)
				Importer::AddAsm(rastm::AsmPath::Value, ILEmitter::Univ::LoadFile(rastm::AsmPath::Value))

				//if rastm::EmbedIfUsed then
				//	SymTable::ResLst::Add(Tuple::Create<of string, string, boolean, boolean>(rastm::AsmPath::Value, string::Empty, true, true))
				//end if
			end if
		elseif stm is RefstdasmStmt then
			var rsastm as RefstdasmStmt = $RefstdasmStmt$stm
			rsastm::AsmPath::Value = Path::Combine(Importer::AsmBasePath, ParseUtils::ProcessMSYSPath(rsastm::AsmPath::get_UnquotedValue()))
			
			if !File::Exists(rsastm::AsmPath::Value) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Assembly File '" + rsastm::AsmPath::Value + "' does not exist.")
			end if
			
			StreamUtils::Write("Referencing Assembly: ")
			StreamUtils::WriteLine(rsastm::AsmPath::Value)
			Importer::AddAsm(rsastm::AsmPath::Value, ILEmitter::Univ::LoadFile(rsastm::AsmPath::Value))
		elseif stm is SignStmt then
			var sstm as SignStmt = $SignStmt$stm
			sstm::KeyPath::Value = ParseUtils::ProcessMSYSPath(sstm::KeyPath::get_UnquotedValue())
			
			if File::Exists(sstm::KeyPath::Value) then
				StreamUtils::Write("Setting Signing Key: ")
				StreamUtils::WriteLine(sstm::KeyPath::Value)
				var fs = new FileStream(sstm::KeyPath::Value, FileMode::Open)
				AsmFactory::StrongKey = new StrongNameKeyPair(fs)
				fs::Close()
			else
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Key File '" + sstm::KeyPath::Value + "' does not exist.")
			end if
		elseif stm is EmbedStmt then
			var sstm as EmbedStmt = $EmbedStmt$stm
			sstm::Path::Value = ParseUtils::ProcessMSYSPath(sstm::Path::get_UnquotedValue())
			
			if File::Exists(sstm::Path::Value) then
				StreamUtils::Write("Adding Resource: ")
				StreamUtils::WriteLine(sstm::Path::Value)
				SymTable::ResLst::Add(Tuple::Create<of string, string, boolean, boolean>(sstm::Path::Value, sstm::LogicalName::get_UnquotedValue(), false, false))
			else
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Resource File '" + sstm::Path::Value + "' does not exist.")
			end if
		elseif stm is ImportStmt then
			var istm as ImportStmt = $ImportStmt$stm
			istm::NS::Value = istm::NS::get_UnquotedValue()
			istm::Alias::Value = istm::Alias::get_UnquotedValue()
			
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
			listm::NS::Value = listm::NS::get_UnquotedValue()
			
			StreamUtils::Write("Importing Namespace: ")
			StreamUtils::WriteLine(listm::NS::Value)
			Importer::AddImp(listm::NS::Value)
		elseif stm is AssemblyStmt then
			var asms as AssemblyStmt = $AssemblyStmt$stm
			AsmFactory::AsmNameStr = new AssemblyName(asms::AsmName::Value)
			if AsmFactory::StrongKey isnot null then
				AsmFactory::AsmNameStr::set_KeyPair(AsmFactory::StrongKey)
			end if
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
			ReadClass($ClassStmt$stm, fpath)
		elseif stm is EnumStmt then
			ReadEnum($EnumStmt$stm, fpath)
		elseif stm is DelegateStmt then
			ReadDelegate($DelegateStmt$stm)
		elseif stm is FieldStmt then
			ReadField($FieldStmt$stm)
		elseif stm is EndClassStmt then
			if AsmFactory::isNested then
				SymTable::TypeLst::EnsureDefaultCtor(AsmFactory::CurnTypB)
				AsmFactory::CreateTyp()

				AsmFactory::CurnTypB = AsmFactory::CurnTypB2
				AsmFactory::CurnTypName = AsmFactory::CurnTypName2
				SymTable::CurnTypItem = SymTable::CurnTypItem2
				SymTable::TypGenParams = SymTable::TypGenParams2

				AsmFactory::isNested = false
			else
				if !ILEmitter::PartialFlg then
					SymTable::TypeLst::EnsureDefaultCtor(AsmFactory::CurnTypB)
					AsmFactory::CreateTyp()

					//var cti = SymTable::CurnTypItem
					//if cti::IsANI then
					//	var ms = new MemoryStream()
					//	cti::AsmB::Save(ms)
					//	ms::Seek(0l, SeekOrigin::Begin)
					//	MemoryFS::AddFile(cti::TypeBldr::get_FullName() + ".dll", ms)
					//	MemoryFS::AddANI(cti::TypeBldr::get_FullName() + ".dll")
					//	SymTable::ResLst::Add(Tuple::Create<of string, string, boolean, boolean>("memory:" + cti::TypeBldr::get_FullName() + ".dll", string::Empty, false, true))
					//end if
				end if
				AsmFactory::inClass = false
			end if
		elseif stm is EndEnumStmt then
			SymTable::CurnTypItem::BakedTyp = AsmFactory::CurnEnumB::CreateType()
			AsmFactory::inEnum = false

			//var cti = SymTable::CurnTypItem
			//if cti::IsANI then
			//	var ms = new MemoryStream()
			//	cti::AsmB::Save(ms)
			//	ms::Seek(0l, SeekOrigin::Begin)
			//	MemoryFS::AddFile(cti::EnumBldr::get_FullName() + ".dll", ms)
			//	MemoryFS::AddANI(cti::EnumBldr::get_FullName() + ".dll")
			//	SymTable::ResLst::Add(Tuple::Create<of string, string, boolean, boolean>("memory:" + cti::EnumBldr::get_FullName() + ".dll", string::Empty, false, true))
			//end if

		elseif stm is MethodStmt then
			ReadMethod($MethodStmt$stm, fpath)
		elseif stm is EndMethodStmt then
			AsmFactory::InMethodFlg = false
			AsmFactory::InCtorFlg = false
			if !#expr(ILEmitter::AbstractFlg orelse ILEmitter::ProtoFlg orelse ILEmitter::PInvokeFlg) then
				var li as LabelItem = SymTable::FindLbl("$leave_ret_label$")
				if li isnot null then
					ILEmitter::MarkLbl(li::Lbl)
					if !AsmFactory::CurnMetB::get_ReturnType()::Equals(Loader::CachedLoadClass("System.Void")) then
						var vr = SymTable::FindVar("$leave_ret_var$")
						vr::Used = true
						ILEmitter::EmitLdloc(vr::Index)
					end if
				end if

				if li isnot null orelse !ReturnFlg then
					ILEmitter::EmitRet()
				end if				

				SymTable::CheckUnusedVar()
				SymTable::CheckCtrlBlks()
				if AsmFactory::CurnMetName == "main" orelse AsmFactory::CurnMetName == "Main" then
					if AsmFactory::AsmMode == "exe" orelse AsmFactory::AsmMode == "winexe" then
						var pef as PEFileKinds = #ternary {AsmFactory::AsmMode == "exe" ? PEFileKinds::ConsoleApplication, _
							#ternary {AsmFactory::AsmMode == "winexe" ? PEFileKinds::WindowApplication, PEFileKinds::Dll} }
						AsmFactory::AsmB::SetEntryPoint(ILEmitter::Met, pef)
					end if
				end if
			end if
		elseif stm is ReturnStmt then
			var retstmt as ReturnStmt = $ReturnStmt$stm
			if retstmt::RExp isnot null then
				new Evaluator()::Evaluate(retstmt::RExp)
				Helpers::CheckAssignability(AsmFactory::CurnMetB::get_ReturnType(), AsmFactory::Type02)
			elseif !AsmFactory::CurnMetB::get_ReturnType()::Equals(Loader::CachedLoadClass("System.Void")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Methods with a return type of 'void' should not return anything!!.")
			end if

			if SymTable::CheckReturnInTry() then
				var lbl = SymTable::GetRetLbl()
				if !AsmFactory::CurnMetB::get_ReturnType()::Equals(Loader::CachedLoadClass("System.Void")) then
					var vr = SymTable::FindVar("$leave_ret_var$")
					ILEmitter::EmitStloc(vr::Index)
				end if
				ILEmitter::EmitLeave(lbl)
			else
				ILEmitter::EmitRet()
				ReturnFlg = true
			end if
			return true
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
			
			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			new Evaluator()::StoreEmit(curva::VarName, curva::RExpr)
		elseif stm is InfVarAsgnStmt then
			var curva as InfVarAsgnStmt = $InfVarAsgnStmt$stm
			eval = new Evaluator()
			vtyp = eval::EvaluateType(curva::RExpr)
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd++
			
			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			eval::StoreEmit(curva::VarName, curva::RExpr)
		elseif stm is UsingAsgnStmt then
			var curva as UsingAsgnStmt = $UsingAsgnStmt$stm
			vtyp = Helpers::CommitEvalTTok(curva::VarTyp)
			if vtyp = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curva::VarTyp::ToString() + "' is not defined.")
			end if
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd++
			
			if !Loader::CachedLoadClass("System.IDisposable")::IsAssignableFrom(vtyp) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + vtyp::ToString() + "' is not an IDisposable.")
			end if
			SymTable::PushScope()

			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			new Evaluator()::StoreEmit(curva::VarName, curva::RExpr)
			
			SymTable::AddUsing(curva::VarName::Value)
			ILEmitter::EmitTry()
			return cg::Process(curva, fpath)::get_Item1()
		elseif stm is InfUsingAsgnStmt then
			var curva as InfUsingAsgnStmt = $InfUsingAsgnStmt$stm
			eval = new Evaluator()
			vtyp = eval::EvaluateType(curva::RExpr)
			ILEmitter::DeclVar(curva::VarName::Value, vtyp)
			ILEmitter::LocInd++
			
			if !Loader::CachedLoadClass("System.IDisposable")::IsAssignableFrom(vtyp) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + vtyp::ToString() + "' is not an IDisposable.")
			end if
			SymTable::PushScope()

			SymTable::AddVar(curva::VarName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
			eval::StoreEmit(curva::VarName, curva::RExpr)
			
			SymTable::AddUsing(curva::VarName::Value)
			ILEmitter::EmitTry()
			return cg::Process(curva, fpath)::get_Item1()
		elseif stm is NSStmt then
			var nss as NSStmt = $NSStmt$stm
			AsmFactory::PushNS(nss::NS::get_UnquotedValue())
			cg::Process(nss, fpath)
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
			if Helpers::SetPopFlg(mcstmt::MethodToken) isnot null then
				var eval2 = new Evaluator()
				var asttok as Token = eval2::ConvToAST(eval2::ConvToRPN(new Expr() {AddToken(mcstmt::MethodToken)}))
				eval2::ASTEmit(asttok, false)
				eval2::ASTEmit(asttok, true)
			else
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No variable/field loads are allowed without a destination being specified")
			end if
		elseif stm is IfStmt then
			var ifstm as IfStmt = $IfStmt$stm
			SymTable::AddIf()
			SymTable::PushScope()

			//allow optimise
			if !#expr(new Evaluator()::Evaluate(ifstm::Exp, BranchOptimisation::Inverted, SymTable::ReadIfNxtBlkLbl())) then
				ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
			end if

			if !AsmFactory::Type02::Equals(Loader::CachedLoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for If Statements should evaluate to boolean.")
			end if
			
			var rtf = cg::Process(ifstm, fpath)::get_Item1()
			var he = false

			foreach b in ifstm::Branches
				if b is ElseIfStmt then
					PreRead(b::Line, fpath)
					ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
					ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
					SymTable::SetIfNxtBlkLbl()
					var elifstm as ElseIfStmt = $ElseIfStmt$b
					SymTable::PopScope()
					SymTable::PushScope()

					if !#expr(new Evaluator()::Evaluate(elifstm::Exp, BranchOptimisation::Inverted, SymTable::ReadIfNxtBlkLbl())) then
						ILEmitter::EmitBrfalse(SymTable::ReadIfNxtBlkLbl())
					end if

					if !AsmFactory::Type02::Equals(Loader::CachedLoadClass("System.Boolean")) then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for ElseIf Statements should evaluate to boolean.")
					end if
					
					rtf = cg::Process(elifstm, fpath)::get_Item1() andalso rtf
				elseif b is ElseStmt then
					he = true
					PreRead(b::Line, fpath)	
					ILEmitter::EmitBr(SymTable::ReadIfEndLbl())
					ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
					SymTable::SetIfElsePass()
					SymTable::PopScope()
					SymTable::PushScope()
					rtf = cg::Process($ElseStmt$b, fpath)::get_Item1() andalso rtf
				end if
			end for

			return rtf andalso he
		elseif stm is DoStmt then
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())
			cg::Process($DoStmt$stm, fpath)
		elseif stm is BreakStmt then
			ILEmitter::EmitBr(SymTable::ReadLoopEndLbl())
		elseif stm is ContinueStmt then
			var fl = SymTable::ReadLoop() as ForLoopItem
			if fl isnot null then
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

			//allow optimise
			if !#expr(new Evaluator()::Evaluate(unstm::Exp, BranchOptimisation::Inverted, SymTable::ReadLoopStartLbl())) then
				ILEmitter::EmitBrfalse(SymTable::ReadLoopStartLbl())
			end if

			if !AsmFactory::Type02::Equals(Loader::CachedLoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Until Statements should evaluate to boolean.")
			end if

			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif stm is WhileStmt then
			var whstm as WhileStmt = $WhileStmt$stm

			//allow optimise
			if !#expr(new Evaluator()::Evaluate(whstm::Exp, BranchOptimisation::Normal, SymTable::ReadLoopStartLbl())) then
				ILEmitter::EmitBrtrue(SymTable::ReadLoopStartLbl())
			end if
				
			if !AsmFactory::Type02::Equals(Loader::CachedLoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for While Statements should evaluate to boolean.")
			end if

			ILEmitter::MarkLbl(SymTable::ReadLoopEndLbl())
			SymTable::PopLoop()
			SymTable::PopScope()
		elseif stm is DoUntilStmt then
			var dustm as DoUntilStmt = $DoUntilStmt$stm
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())

			//allow optimise
			if !#expr(new Evaluator()::Evaluate(dustm::Exp, BranchOptimisation::Normal, SymTable::ReadLoopEndLbl())) then
				ILEmitter::EmitBrtrue(SymTable::ReadLoopEndLbl())
			end if

			if !AsmFactory::Type02::Equals(Loader::CachedLoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Do Until Statements should evaluate to boolean.")
			end if

			cg::Process(dustm, fpath)
		elseif stm is DoWhileStmt then
			var dwstm as DoWhileStmt = $DoWhileStmt$stm
			SymTable::PushScope()
			SymTable::AddLoop()
			ILEmitter::MarkLbl(SymTable::ReadLoopStartLbl())

			//allow optimise
			if !#expr(new Evaluator()::Evaluate(dwstm::Exp, BranchOptimisation::Inverted, SymTable::ReadLoopEndLbl())) then
				ILEmitter::EmitBrfalse(SymTable::ReadLoopEndLbl())
			end if

			if !AsmFactory::Type02::Equals(Loader::CachedLoadClass("System.Boolean")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Conditions for Do While Statements should evaluate to boolean.")
			end if

			cg::Process(dwstm, fpath)
		elseif stm is ForStmt then
			ReadFor($ForStmt$stm, fpath)
		elseif stm is EndIfStmt then
			if !SymTable::ReadIfElsePass() then
				ILEmitter::MarkLbl(SymTable::ReadIfNxtBlkLbl())
			end if
			ILEmitter::MarkLbl(SymTable::ReadIfEndLbl())
			SymTable::PopIf()
			SymTable::PopScope()
		elseif stm is EndDoStmt then
			ReadEndDo(fpath)
//		elseif stm is LabelStmt then
//			SymTable::AddLbl(#expr($LabelStmt$stm)::LabelName::Value)
//		elseif stm is PlaceStmt then
//			ILEmitter::MarkLbl(Helpers::GetLbl(#expr($PlaceStmt$stm)::LabelName::Value))
//		elseif stm is GotoStmt then
//			ILEmitter::EmitBr(Helpers::GetLbl(#expr($GotoStmt$stm)::LabelName::Value))
		elseif stm is ThrowStmt then
			var trostmt as ThrowStmt = $ThrowStmt$stm
			if trostmt::RExp isnot null then
				new Evaluator()::Evaluate(trostmt::RExp)
				if !Loader::CachedLoadClass("System.Exception")::IsAssignableFrom(AsmFactory::Type02) then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + AsmFactory::Type02::ToString() + "' is not an Exception Type.")
				end if
				ILEmitter::EmitThrow()
			else
				if SymTable::GetInCatch() then
					ILEmitter::EmitRethrow()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No exception to throw specified")
				end if
			end if
			return true
		elseif stm is TryStmt then
			SymTable::PushScope()
			ILEmitter::EmitTry()
			SymTable::AddTry()
			var rtf = cg::Process($TryStmt$stm, fpath)::get_Item1()

			foreach b in #expr($TryStmt$stm)::Branches
				if b is FinallyStmt then
					PreRead(b::Line, fpath)
					SymTable::PopScope()
					SymTable::PushScope()
					SymTable::SetInCatch(false)
					ILEmitter::EmitFinally()
					cg::Process($FinallyStmt$b, fpath)
				elseif b is CatchStmt then
					PreRead(b::Line, fpath)
					SymTable::PopScope()
					SymTable::PushScope()
					var cats as CatchStmt = $CatchStmt$b
					vtyp = Helpers::CommitEvalTTok(cats::ExTyp)
					if vtyp is null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + cats::ExTyp::Value + "' is not defined.")
					end if
					SymTable::SetInCatch(true)
					ILEmitter::DeclVar(cats::ExName::Value, vtyp)
					ILEmitter::LocInd++
					SymTable::StoreFlg = true
					SymTable::AddVar(cats::ExName::Value, true, ILEmitter::LocInd, vtyp, ILEmitter::LineNr)
					SymTable::StoreFlg = false
					ILEmitter::EmitCatch(vtyp)
					ILEmitter::EmitStloc(SymTable::FindVar(cats::ExName::Value)::Index)
					rtf = cg::Process(cats, fpath)::get_Item1() andalso rtf
				end if
			end for
			return rtf
		elseif stm is EndTryStmt then
			ILEmitter::EmitEndTry()
			SymTable::PopScope()
			SymTable::PopTry()
		elseif stm is EndUsingStmt then
			ILEmitter::EmitFinally()
			var uv = SymTable::ReadUseeLoc()
			var idisp = Loader::CachedLoadClass("System.IDisposable")
			new Evaluator()::Evaluate(new Expr() {Line = ILEmitter::LineNr, AddToken(new ExprCallTok() {Line = ILEmitter::LineNr, Exp = new Expr() { _
				AddToken(new Ident(uv) {Line = ILEmitter::LineNr, set_Conv(!idisp::Equals(SymTable::FindVar(uv)::VarTyp)), _
				set_TTok(new TypeTok("System.IDisposable") {RefTyp = idisp}), set_OrdOp("conv") })}, _
				MemberAccessFlg = true, MemberToAccess = new MethodCallTok() {Line = ILEmitter::LineNr, Name = new MethodNameTok("Dispose") {Line = ILEmitter::LineNr} } })})
			ILEmitter::EmitEndTry()
			SymTable::PopScope()
			SymTable::PopUsing()
		elseif stm is MethodAttrStmt then
			SymTable::AddMtdCA(AttrStmtToCAB($MethodAttrStmt$stm))
		elseif stm is FieldAttrStmt then
			SymTable::AddFldCA(AttrStmtToCAB($FieldAttrStmt$stm))
		elseif stm is ClassAttrStmt then
			SymTable::AddClsCA(AttrStmtToCAB($ClassAttrStmt$stm))
		elseif stm is AssemblyAttrStmt then
			SymTable::AddAsmCA(AttrStmtToCAB($AssemblyAttrStmt$stm))
		elseif stm is ForeachStmt then
			ReadForeach($ForeachStmt$stm, fpath)
		elseif stm is HDefineStmt then
			SymTable::AddDef(#expr($HDefineStmt$stm)::Symbol::Value)
		elseif stm is HUndefStmt then
			SymTable::UnDef(#expr($HUndefStmt$stm)::Symbol::Value)
		elseif stm is WarningStmt then
			var wstm as WarningStmt = $WarningStmt$stm
			StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, wstm::Msg::get_UnquotedValue())
		elseif stm is ErrorStmt then
			var wstm as ErrorStmt = $ErrorStmt$stm
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, wstm::Msg::get_UnquotedValue())
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
			if Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(AsmFactory::Type02) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Locks should only be taken on Objects and not Valuetypes.")
			end if
			ILEmitter::DeclVar(String::Empty, Loader::CachedLoadClass("System.Object"))
			ILEmitter::LocInd++
			var lockee as integer = ILEmitter::LocInd
			ILEmitter::EmitStloc(lockee)
			SymTable::AddLock(lockee)
			ILEmitter::EmitLdloc(lockee)
			ILEmitter::EmitCall(Loader::CachedLoadClass("System.Threading.Monitor")::GetMethod("Enter", new IKVM.Reflection.Type[] {Loader::LoadClass("System.Object")}))
			ILEmitter::EmitTry()
			return cg::Process(lstm, fpath)::get_Item1()
		elseif stm is TryLockStmt then
			var lstm as TryLockStmt = $TryLockStmt$stm
			SymTable::PushScope()
			new Evaluator()::Evaluate(lstm::Lockee)
			if Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(AsmFactory::Type02) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Locks should only be taken on Objects and not Valuetypes.")
			end if
			ILEmitter::DeclVar(String::Empty, Loader::CachedLoadClass("System.Object"))
			ILEmitter::LocInd++
			var lockee as integer = ILEmitter::LocInd
			ILEmitter::EmitStloc(lockee)
			SymTable::AddTryLock(lockee)
			var li = SymTable::ReadLock()
			ILEmitter::EmitLdloc(lockee)
			ILEmitter::EmitCall(Loader::CachedLoadClass("System.Threading.Monitor")::GetMethod("TryEnter", new IKVM.Reflection.Type[] {Loader::LoadClass("System.Object")}))
			ILEmitter::EmitBrfalse(li::Lbl)
			ILEmitter::EmitTry()
			cg::Process(lstm, fpath)
		elseif stm is EndLockStmt then
			ILEmitter::EmitFinally()
			var li = SymTable::ReadLock()
			ILEmitter::EmitLdloc(li::LockeeLoc)
			ILEmitter::EmitCall(Loader::CachedLoadClass("System.Threading.Monitor")::GetMethod("Exit", new IKVM.Reflection.Type[] {Loader::LoadClass("System.Object")}))
			ILEmitter::EmitEndTry()
			if li::IsTryLock then
				ILEmitter::MarkLbl(li::Lbl)
			end if
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

		if stm isnot ReturnStmt then
			ReturnFlg = false
		end if

		return false
	end method

end class
