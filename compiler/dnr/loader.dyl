//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static Loader

	field public static boolean FldLitFlag
	field public static boolean ProtectedFlag
	field public static object FldLitVal
	field public static boolean EnumLitFlag
	field public static IKVM.Reflection.Type EnumLitTyp
	field public static IKVM.Reflection.Type FldLitTyp
	field public static IKVM.Reflection.Type MemberTyp
	field public static IKVM.Reflection.Type PreProcTyp
	field public static boolean MakeArr
	field public static boolean MakeRef

	method private static void Loader()
		ProtectedFlag = false
		FldLitFlag = false
		FldLitVal = null
		EnumLitFlag = false
		FldLitTyp = null
		MemberTyp = null
		MakeArr = false
		MakeRef = false
		PreProcTyp = null
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type LoadClass(var name as string) 

		var typ as IKVM.Reflection.Type = null
		var nest as boolean = false
		var asmb as IKVM.Reflection.Emit.AssemblyBuilder

		var na as string[] = ParseUtils::StringParser(name,"\")
		name = na[0]
		if na[l] > 1 then
			nest = true
		end if
		
		foreach curasm in Importer::Asms
			
			foreach alias in Importer::AliasMap::get_Keys()
				if name = alias then
					name = Importer::AliasMap::get_Item(alias)
					break
				elseif name like ("^" + alias + "`\d+$") then
					name = Importer::AliasMap::get_Item(alias) + name::Substring(alias::get_Length())
					break
				elseif name::StartsWith(alias + ".") then
					name = Importer::AliasMap::get_Item(alias) + name::Substring(alias::get_Length())
					break
				end if
			end for
			
			if curasm = AsmFactory::AsmB then
				asmb = $IKVM.Reflection.Emit.AssemblyBuilder$curasm
				typ = asmb::GetType(name,false,false)
				if typ != null then
					if nest then
						typ = typ::GetNestedType(na[1])
					end if
					break
				end if
			else
				typ = curasm::GetType(name)
				if typ != null then
					if nest then
						typ = typ::GetNestedType(na[1])
					end if
					break
				end if
			end if

			name = na[0]
			foreach curns in Importer::Imps
				if curasm = AsmFactory::AsmB then
					asmb = $IKVM.Reflection.Emit.AssemblyBuilder$curasm
					typ = asmb::GetType(curns + "." + name,false,false)
					if typ != null then
						if nest then
							typ = typ::GetNestedType(na[1])
						end if
						break
					end if
				else
					typ = curasm::GetType(curns + "." + name)
					if typ != null then
						if nest then
							typ = typ::GetNestedType(na[1])
						end if
						break
					end if
				end if
			end for
			
			if typ != null then
				break
			end if
			
		end for
		
		PreProcTyp = typ

		if typ != null then
			if MakeArr then
				typ = typ::MakeArrayType()
			end if
			if MakeRef then
				typ = typ::MakeByRefType()
			end if
		end if

		MakeArr = false
		MakeRef = false

		return typ

	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type ProcessType(var typ as IKVM.Reflection.Type)
		if typ != null then
			if MakeArr then
				typ = typ::MakeArrayType()
			end if
			if MakeRef then
				typ = typ::MakeByRefType()
			end if
		end if
		
		MakeArr = false
		MakeRef = false
		
		return typ
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type[] ParamsToTyps(var t as IKVM.Reflection.ParameterInfo[])

		var arr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[t[l]]
		var i as integer = -1

		if t[l] = 0 then
			return IKVM.Reflection.Type::EmptyTypes
		end if

		do until i = (t[l] - 1)
			i = i + 1
			arr[i] = t[i]::get_ParameterType()
		end do

		return arr
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.MethodInfo LoadMethodWithoutParams(var typ as IKVM.Reflection.Type, var name as string)

		var ints as IKVM.Reflection.Type[] = null
		var i as integer = -1
		var mtdinfo as IKVM.Reflection.MethodInfo = null

		mtdinfo = typ::GetMethod(name)

		if mtdinfo = null then
			ints = typ::GetInterfaces()
			if ints <> null then
				do until i = (ints[l] - 1)
					i = i + 1
					mtdinfo = ints[i]::GetMethod(name)
					if mtdinfo != null then
						break
					end if
				end do

			end if
		end if

		if mtdinfo != null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if
		
		return mtdinfo

	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type[] GetDelegateInvokeParams(var typ as IKVM.Reflection.Type)
		return ParamsToTyps(LoadMethodWithoutParams(typ, "Invoke")::GetParameters())
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.MethodInfo LoadMethod(var typ as IKVM.Reflection.Type, var name as string, var typs as IKVM.Reflection.Type[])

		var ints as IKVM.Reflection.Type[] = null
		var mtdinfo as IKVM.Reflection.MethodInfo = null

		if typ::get_IsArray() then
			typ = ILEmitter::Univ::Import(gettype Array)
		end if
		
		mtdinfo = typ::GetMethod(name,typs)

		if mtdinfo = null then
			ints = typ::GetInterfaces()

			if ints != null then
				foreach interf in ints
					mtdinfo = interf::GetMethod(name,typs)

					if mtdinfo != null then
						break
					end if
				end for
			end if

		end if

		if mtdinfo != null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if

		if mtdinfo = null then
			mtdinfo = typ::GetMethod(name,IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public or IKVM.Reflection.BindingFlags::NonPublic, $IKVM.Reflection.Binder$null, typs, new IKVM.Reflection.ParameterModifier[0])

			if mtdinfo != null then
				//filter out private members
				if mtdinfo::get_IsPrivate() = false then
					var asmn as IKVM.Reflection.AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as IKVM.Reflection.AssemblyName = AsmFactory::AsmNameStr
					var havinternal as boolean = false
					if asmnc != null then
						havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) and (asmn::get_Name() == asmnc::get_Name())
					end if

					if (mtdinfo::get_IsFamilyAndAssembly() and ProtectedFlag and havinternal) = false then
						if (mtdinfo::get_IsFamilyOrAssembly() and (ProtectedFlag or havinternal)) = false then
							if (mtdinfo::get_IsFamily() and ProtectedFlag) = false then
								if (mtdinfo::get_IsAssembly() and havinternal) = false then
									mtdinfo = null
								end if
							end if
						end if
					end if
				else
					mtdinfo = null
				end if
			end if

			if mtdinfo != null then
				MemberTyp = mtdinfo::get_ReturnType()
			end if

		end if

		return mtdinfo

	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.ConstructorInfo LoadCtor(var typ as IKVM.Reflection.Type, var typs as IKVM.Reflection.Type[])

		var ctorinf as IKVM.Reflection.ConstructorInfo = typ::GetConstructor(typs)

		if ctorinf != null then
			MemberTyp = typ
		end if

		if ctorinf = null then
			ctorinf = typ::GetConstructor(IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public or IKVM.Reflection.BindingFlags::NonPublic, $IKVM.Reflection.Binder$null, typs, new IKVM.Reflection.ParameterModifier[0])

			if ctorinf != null then
				//filter out private members
				if ctorinf::get_IsPrivate() = false then
				
					var asmn as IKVM.Reflection.AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as IKVM.Reflection.AssemblyName = AsmFactory::AsmNameStr
					var havinternal as boolean = false
					if asmnc != null then
						havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) and (asmn::get_Name() == asmnc::get_Name())
					end if
				
					if (ctorinf::get_IsFamilyAndAssembly() and ProtectedFlag and havinternal) = false then
						if (ctorinf::get_IsFamilyOrAssembly() and (ProtectedFlag or havinternal)) = false then
							if (ctorinf::get_IsFamily() and ProtectedFlag) = false then
								if (ctorinf::get_IsAssembly() and havinternal) = false then
									ctorinf = null
								end if
							end if
						end if
					end if
				else
					ctorinf = null
				end if
			end if

			if ctorinf != null then
				MemberTyp = typ
			end if
		end if

		return ctorinf

	end method

	[method: ComVisible(false)]
	method public static MethodInfo[] addelemmtdinfo(var srcarr as MethodInfo[], var eltoadd as MethodInfo)

		var i as integer = -1
		var destarr as MethodInfo[] = new MethodInfo[srcarr[l] + 1]

		do until i = (srcarr[l] - 1)
			i = i + 1
			destarr[i] = srcarr[i]
		end do

		destarr[srcarr[l]] = eltoadd
		return destarr

	end method

	[method: ComVisible(false)]
	method public static IEnumerable<of IKVM.Reflection.MethodInfo> LoadSpecMtds(var typ as IKVM.Reflection.Type)
		return Enumerable::Where<of IKVM.Reflection.MethodInfo>(typ::GetMethods(), new Func<of IKVM.Reflection.MethodInfo,boolean>(MILambdas::IsSpecial()))
	end method

	[method: ComVisible(false)]
	method public static IEnumerable<of IKVM.Reflection.MethodInfo> LoadGenericMtdOverlds(var typ as IKVM.Reflection.Type, var name as string, var paramlen as integer)
		var asmn as IKVM.Reflection.AssemblyName = typ::get_Assembly()::GetName()
		var asmnc as IKVM.Reflection.AssemblyName = AsmFactory::AsmNameStr
		var havinternal as boolean = false
		if asmnc != null then
			havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) and (asmn::get_Name() == asmnc::get_Name())
		end if
					
		var mil as MILambdas = new MILambdas(name,paramlen, havinternal, ProtectedFlag)
		return Enumerable::Where<of IKVM.Reflection.MethodInfo>(typ::GetMethods(IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public or IKVM.Reflection.BindingFlags::NonPublic), new Func<of IKVM.Reflection.MethodInfo,boolean>(mil::GenericMtdFilter()))
	end method

	[method: ComVisible(false)]
	method public static boolean CompareParamsToTyps(var t1 as ParameterInfo[],var t2 as Type[])
		if t1[l] = t2[l] then
			var i as integer = -1
			if t1[l] = 0 then
				return true
			end if
			do until i = (t1[l] - 1)
				i = i + 1
				if t1[i]::get_ParameterType()::Equals(t2[i]) = false then
					return false
				end if
			end do
			return true
		else
			return false
		end if
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.MethodInfo LoadBinOp(var typ as IKVM.Reflection.Type, var name as string, var typa as IKVM.Reflection.Type, var typb as IKVM.Reflection.Type)
		var mil as MILambdas = new MILambdas(name)
		var matches as IKVM.Reflection.MethodInfo[]		
		matches = Enumerable::ToArray<of IKVM.Reflection.MethodInfo>(Enumerable::Where<of IKVM.Reflection.MethodInfo>(LoadSpecMtds(typ), new Func<of IKVM.Reflection.MethodInfo,boolean>(mil::IsSameName())))

		if matches[l] = 0 then
			return null
		else
			var bind as IKVM.Reflection.Binder = IKVM.Reflection.Type::get_DefaultBinder()
			var bf as IKVM.Reflection.BindingFlags = IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public
			return $IKVM.Reflection.MethodInfo$bind::SelectMethod(bf,matches,new IKVM.Reflection.Type[] {typa, typb},new IKVM.Reflection.ParameterModifier[0])
		end if
	end method
	
	[method: ComVisible(false)]
	method public static IKVM.Reflection.MethodInfo LoadUnaOp(var typ as IKVM.Reflection.Type, var name as string, var typa as IKVM.Reflection.Type)
		var mil as MILambdas = new MILambdas(name)
		var matches as IKVM.Reflection.MethodInfo[]		
		matches = Enumerable::ToArray<of IKVM.Reflection.MethodInfo>(Enumerable::Where<of IKVM.Reflection.MethodInfo>(LoadSpecMtds(typ), new Func<of IKVM.Reflection.MethodInfo,boolean>(mil::IsSameName())))

		if matches[l] = 0 then
			return null
		else
			var bind as IKVM.Reflection.Binder = IKVM.Reflection.Type::get_DefaultBinder()
			var bf as IKVM.Reflection.BindingFlags = IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public
			return $IKVM.Reflection.MethodInfo$bind::SelectMethod(bf,matches,new IKVM.Reflection.Type[] {typa},new IKVM.Reflection.ParameterModifier[0])
		end if
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.MethodInfo LoadGenericMethod(var typ as IKVM.Reflection.Type, var name as string, var genparams as IKVM.Reflection.Type[], var paramst as IKVM.Reflection.Type[])

		var mtdinfo as IKVM.Reflection.MethodInfo = null
		var mil as MILambdas = new MILambdas(genparams)
	
		var matches as IKVM.Reflection.MethodInfo[]
		matches = Enumerable::ToArray<of IKVM.Reflection.MethodInfo>(Enumerable::Select<of IKVM.Reflection.MethodInfo,IKVM.Reflection.MethodInfo>(LoadGenericMtdOverlds(typ, name, genparams[l]), new Func<of IKVM.Reflection.MethodInfo,IKVM.Reflection.MethodInfo>(mil::InstGenMtd())))
		
		if matches[l] = 0 then
			mtdinfo = null
		else
			var bind as IKVM.Reflection.Binder = IKVM.Reflection.Type::get_DefaultBinder()
			var bf as IKVM.Reflection.BindingFlags = IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public
			mtdinfo =  $IKVM.Reflection.MethodInfo$bind::SelectMethod(bf,matches,paramst,new IKVM.Reflection.ParameterModifier[0])
		end if

		if mtdinfo != null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if

		return mtdinfo
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.MethodInfo LoadConvOp(var typ as IKVM.Reflection.Type, var name as string, var src as IKVM.Reflection.Type, var snk as IKVM.Reflection.Type)
		var mil as MILambdas = new MILambdas(name,snk)
		
		var matches as IKVM.Reflection.MethodInfo[]
		matches = Enumerable::ToArray<of IKVM.Reflection.MethodInfo>(Enumerable::Where<of IKVM.Reflection.MethodInfo>(LoadSpecMtds(typ), new Func<of IKVM.Reflection.MethodInfo,boolean>(mil::IsSameNameAndReturn())))
		
		if matches[l] = 0 then
			return null
		else
			var bind as IKVM.Reflection.Binder = IKVM.Reflection.Type::get_DefaultBinder()
			var bf as IKVM.Reflection.BindingFlags = IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public
			return $IKVM.Reflection.MethodInfo$bind::SelectMethod(bf,matches,new IKVM.Reflection.Type[] {src},new IKVM.Reflection.ParameterModifier[0])
		end if

	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.FieldInfo LoadField(var typ as IKVM.Reflection.Type, var name as string)

		var fldinfo as IKVM.Reflection.FieldInfo = null

		fldinfo = typ::GetField(name)
		
		if fldinfo = null then
			fldinfo = typ::GetField(name,IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public or IKVM.Reflection.BindingFlags::NonPublic)

			if fldinfo != null then
				//filter out private members
				if fldinfo::get_IsPrivate() = false then
			
					var asmn as IKVM.Reflection.AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as IKVM.Reflection.AssemblyName = AsmFactory::AsmNameStr
					var havinternal as boolean = false
					if asmnc != null then
						havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) and (asmn::get_Name() == asmnc::get_Name())
					end if
					
					if (fldinfo::get_IsFamilyAndAssembly() and ProtectedFlag and havinternal) = false then
						if (fldinfo::get_IsFamilyOrAssembly() and (ProtectedFlag or havinternal)) = false then
							if (fldinfo::get_IsFamily() and ProtectedFlag) = false then
								if (fldinfo::get_IsAssembly() and havinternal) = false then
									fldinfo = null
								end if
							end if
						end if
					end if
				else
					fldinfo = null
				end if
			end if
		end if

		if fldinfo != null then
			MemberTyp = fldinfo::get_FieldType()
			FldLitFlag = fldinfo::get_IsLiteral()
			EnumLitFlag = typ::get_IsEnum()
			if FldLitFlag then
				FldLitVal = fldinfo::GetRawConstantValue()
				FldLitTyp = fldinfo::get_FieldType()
			end if
			if EnumLitFlag then
				EnumLitTyp = typ::GetEnumUnderlyingType()
			end if
		end if
		return fldinfo

	end method
	
	[method: ComVisible(false)]
	method public static IKVM.Reflection.PropertyInfo LoadProperty(var typ as IKVM.Reflection.Type, var name as string)

		var propinfo as IKVM.Reflection.PropertyInfo = null

		propinfo = typ::GetProperty(name)
		
//		if propinfo = null then
//			propinfo = typ::GetProperty(name,IKVM.Reflection.BindingFlags::Instance or IKVM.Reflection.BindingFlags::Static or IKVM.Reflection.BindingFlags::Public or IKVM.Reflection.BindingFlags::NonPublic)
//
//			if propinfo != null then
//				//filter out private members
//				if propinfo::get_IsPrivate() = false then
//			
//					var asmn as IKVM.Reflection.AssemblyName = typ::get_Assembly()::GetName()
//					var asmnc as IKVM.Reflection.AssemblyName = AsmFactory::AsmNameStr
//					var havinternal as boolean = false
//					if asmnc != null then
//						havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) and (asmn::get_Name() == asmnc::get_Name())
//					end if
//					
//					if (propinfo::get_IsFamilyAndAssembly() and ProtectedFlag and havinternal) = false then
//						if (propinfo::get_IsFamilyOrAssembly() and (ProtectedFlag or havinternal)) = false then
//							if (propinfo::get_IsFamily() and ProtectedFlag) = false then
//								if (propinfo::get_IsAssembly() and havinternal) = false then
//									prpoinfo = null
//								end if
//							end if
//						end if
//					end if
//				else
//					propinfo = null
//				end if
//			end if
//		end if

		if propinfo != null then
			MemberTyp = propinfo::get_PropertyType()
		end if
		return propinfo

	end method

end class
