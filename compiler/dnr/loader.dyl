//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public static Loader

	field public static boolean FldLitFlag
	field public static boolean ProtectedFlag
	field public static object FldLitVal
	field public static boolean EnumLitFlag
	field public static Managed.Reflection.Type EnumLitTyp
	field public static Managed.Reflection.Type FldLitTyp
	field public static Managed.Reflection.Type MemberTyp
	field public static Managed.Reflection.Type PreProcTyp
	field public static boolean MakeArr
	field public static boolean MakeRef
	field private static C5.HashDictionary<of string, Managed.Reflection.Type> TypeCache

	method public static void Init()
		ProtectedFlag = false
		FldLitFlag = false
		FldLitVal = null
		EnumLitFlag = false
		FldLitTyp = null
		MemberTyp = null
		MakeArr = false
		MakeRef = false
		PreProcTyp = null
		TypeCache = new C5.HashDictionary<of string, Managed.Reflection.Type>(C5.MemoryType::Normal)
	end method

	method private static void Loader()
		Init()
	end method

	method public static Managed.Reflection.Type LoadClass(var name as string)
		var typ as Managed.Reflection.Type = null
		var nest as boolean = false
		//var asmb as Managed.Reflection.Emit.AssemblyBuilder

		var na as string[] = ParseUtils::StringParser(name, c'\\')
		name = na[0]
		if na[l] > 1 then
			nest = true
		end if

		foreach alias in Importer::AliasMap::get_Keys()
			if name == alias then
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

		foreach curnsrec in EnumerableEx::StartWith<of ImportRecord>(EnumerableEx::Concat<of ImportRecord>( _
			Enumerable::ToArray<of C5.LinkedList<of ImportRecord> >(Importer::ImpsStack::Backwards())), _
				new ImportRecord[] {new ImportRecord(string::Empty), new ImportRecord(AsmFactory::CurnNS)})

			var curns = curnsrec::Namespace ?? string::Empty
			var typname = #ternary{curns::get_Length() == 0 ? name , i"{curns}.{name}"}

			#if VTUP_HACK then
			if (typname == "System.ValueTuple" orelse typname like "^System.ValueTuple`\d+$") andalso (Importer::ValueTupleAsm isnot null) then
				typ = Importer::ValueTupleAsm::Asm::GetType(typname)
				if typ isnot null then
					break
				end if
			elseif typname == "System.TupleExtensions" andalso (Importer::ValueTupleAsm isnot null) then
				typ = Importer::ValueTupleAsm::Asm::GetType(typname)
				if typ isnot null then
					break
				end if
			end if
			end #if

			foreach curasmrec in Importer::Asms::get_Values()
				var curasm = curasmrec::Asm
				try
//					if curasm == AsmFactory::AsmB then
//						//asmb = $Managed.Reflection.Emit.AssemblyBuilder$curasm
//						typ = curasm::GetType(typname)
//						//,false,false)
//						if typ isnot null then
//							if nest then
//								typ = typ::GetNestedType(na[1])
//							end if
//							break
//						end if
//					else
						typ = curasm::GetType(typname)
						if typ isnot null then
							curasmrec::Used = true
							curnsrec::Used = true
							if nest then
								typ = typ::GetNestedType(na[1])
							end if
							break
						end if
//					end if
				catch ex as Exception
					typ = null
				end try
			end for

			if typ isnot null then
				break
			end if
		end for

		PreProcTyp = typ

		if typ isnot null then
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

	method public static IEnumerable<of Managed.Reflection.Type> LoadClasses(var name as string)
		var typ as Managed.Reflection.Type = null
		var typs as C5.LinkedList<of Managed.Reflection.Type> = new C5.LinkedList<of Managed.Reflection.Type>()
		var nest as boolean = false

		var na as string[] = ParseUtils::StringParser(name, c'\\')
		name = na[0]
		if na[l] > 1 then
			nest = true
		end if

		foreach alias in Importer::AliasMap::get_Keys()
			if name == alias then
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

		foreach curnsrec in EnumerableEx::StartWith<of ImportRecord>(EnumerableEx::Concat<of ImportRecord>( _
			Enumerable::ToArray<of C5.LinkedList<of ImportRecord> >(Importer::ImpsStack::Backwards())), _
				new ImportRecord[] {new ImportRecord(string::Empty), new ImportRecord(AsmFactory::CurnNS)})

			var curns = curnsrec::Namespace ?? string::Empty
			foreach curasmrec in Importer::Asms::get_Values()
				var curasm = curasmrec::Asm
				try
					typ = curasm::GetType(#ternary{curns::get_Length() == 0 ? name , curns + "." + name})
					if typ isnot null then
						if nest then
							typ = typ::GetNestedType(na[1])
						end if
						if typ isnot null then
							curnsrec::Used = true
							typs::Add(typ)
						end if
					end if
				catch ex as Exception
					typ = null
				end try
			end for

			if typ isnot null then
				typs::Add(typ)
			end if
		end for

//		PreProcTyp = typ

//		if typ isnot null then
//			if MakeArr then
//				typ = typ::MakeArrayType()
//			end if
//			if MakeRef then
//				typ = typ::MakeByRefType()
//			end if
//		end if

//		MakeArr = false
//		MakeRef = false

		return typs
	end method

	method public static Managed.Reflection.Type CachedLoadClass(var name as string)
		if TypeCache::Contains(name) then
			var typ = TypeCache::get_Item(name)
			PreProcTyp = typ

			if typ isnot null then
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
		else
			var t = LoadClass(name)
			if t isnot null then
				TypeCache::Add(name, PreProcTyp)
			end if
			return t
		end if
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.Type ProcessType(var typ as Managed.Reflection.Type)
		if typ isnot null then
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
	method public static Managed.Reflection.Type[] ParamsToTyps(var t as Managed.Reflection.ParameterInfo[])
		var arr as Managed.Reflection.Type[] = new Managed.Reflection.Type[t[l]]

		if t[l] == 0 then
			return Managed.Reflection.Type::EmptyTypes
		end if

		for i = 0 upto --t[l]
			arr[i] = t[i]::get_ParameterType()
		end for

		return arr
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.MethodInfo LoadMethodWithoutParams(var typ as Managed.Reflection.Type, var name as string)

		var ints as Managed.Reflection.Type[] = null
		var mtdinfo as Managed.Reflection.MethodInfo = typ::GetMethod(name)

		if mtdinfo is null then
			ints = typ::GetInterfaces()
			if ints isnot null then
				for i = 0 upto --ints[l]
					mtdinfo = ints[i]::GetMethod(name)
					if mtdinfo isnot null then
						break
					end if
				end for

			end if
		end if

		if mtdinfo isnot null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if

		return mtdinfo

	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.Type[] GetDelegateInvokeParams(var typ as Managed.Reflection.Type) => _
		ParamsToTyps(LoadMethodWithoutParams(typ, "Invoke")::GetParameters())

	[method: ComVisible(false)]
	method public static IEnumerable<of Managed.Reflection.MethodInfo> LoadNormalMtdOverlds(var typ as Managed.Reflection.Type, var name as string)
		var asmn as Managed.Reflection.AssemblyName = typ::get_Assembly()::GetName()
		var asmnc as Managed.Reflection.AssemblyName = AsmFactory::AsmNameStr
		var havinternal as boolean = false
		if asmnc isnot null then
			havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) andalso (asmn::get_Name() == asmnc::get_Name())
		end if

		var mil as MILambdas = new MILambdas(name, 0, havinternal, ProtectedFlag)
		return Enumerable::Where<of Managed.Reflection.MethodInfo>(typ::GetMethods(Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public or Managed.Reflection.BindingFlags::NonPublic), new Func<of Managed.Reflection.MethodInfo,boolean>(mil::NormalMtdFilter))
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.MethodInfo LoadMethod(var typ as Managed.Reflection.Type, var name as string, var typs as Managed.Reflection.Type[])

		if typ is null then
			return null
		end if

		var ints as Managed.Reflection.Type[] = null
		var mtdinfo as Managed.Reflection.MethodInfo = null

		if typ::get_IsArray() then
			typ = Loader::CachedLoadClass("System.Array")
		end if

		var matches = Enumerable::ToArray<of Managed.Reflection.MethodInfo>(LoadNormalMtdOverlds(typ, name))

		if matches[l] = 0 then
			mtdinfo = null
		else
			var bind as Managed.Reflection.Binder = Managed.Reflection.Type::get_DefaultBinder()
			var bf as Managed.Reflection.BindingFlags = Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public or Managed.Reflection.BindingFlags::NonPublic
			mtdinfo =  $Managed.Reflection.MethodInfo$bind::SelectMethod(bf,matches,typs,new Managed.Reflection.ParameterModifier[0])
		end if

		if mtdinfo is null andalso typ::get_IsInterface() then
			ints = typ::GetInterfaces()

			if ints isnot null andalso !typ::get_IsValueType() then
				foreach interf in ints
					mtdinfo = LoadMethod(interf, name,typs)

					if mtdinfo isnot null then
						break
					end if
				end for
			end if

		end if

		if mtdinfo isnot null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if

//		if mtdinfo == null then
//			mtdinfo = typ::GetMethod(name,Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public or Managed.Reflection.BindingFlags::NonPublic, $Managed.Reflection.Binder$null, typs, new Managed.Reflection.ParameterModifier[0])
//
//			if mtdinfo isnot null then
//				//filter out private members
//				if !mtdinfo::get_IsPrivate() then
//					var asmn as Managed.Reflection.AssemblyName = typ::get_Assembly()::GetName()
//					var asmnc as Managed.Reflection.AssemblyName = AsmFactory::AsmNameStr
//					var havinternal as boolean = false
//					if asmnc isnot null then
//						havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) andalso (asmn::get_Name() == asmnc::get_Name())
//					end if
//
//					if !#expr(mtdinfo::get_IsFamilyAndAssembly() andalso ProtectedFlag andalso havinternal) then
//						if !#expr(mtdinfo::get_IsFamilyOrAssembly() andalso (ProtectedFlag orelse havinternal)) then
//							if !#expr(mtdinfo::get_IsFamily() andalso ProtectedFlag) then
//								if !#expr(mtdinfo::get_IsAssembly() andalso havinternal) then
//									mtdinfo = null
//								end if
//							end if
//						end if
//					end if
//				else
//					mtdinfo = null
//				end if
//			end if
//
//			if mtdinfo isnot null then
//				MemberTyp = mtdinfo::get_ReturnType()
//			end if
//
//		end if

		return mtdinfo

	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.ConstructorInfo LoadCtor(var typ as Managed.Reflection.Type, var typs as Managed.Reflection.Type[])

		var ctorinf as Managed.Reflection.ConstructorInfo = null
		if ctorinf is null then
			ctorinf = typ::GetConstructor(Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Public or Managed.Reflection.BindingFlags::NonPublic or Managed.Reflection.BindingFlags::DeclaredOnly, $Managed.Reflection.Binder$null, typs, new Managed.Reflection.ParameterModifier[0])

			if ctorinf isnot null then
				//filter out private members
				if ctorinf::get_IsPublic() then
				elseif !ctorinf::get_IsPrivate() then

					var asmn as Managed.Reflection.AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as Managed.Reflection.AssemblyName = AsmFactory::AsmNameStr
					var havinternal as boolean = false
					if asmnc isnot null then
						havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) and (asmn::get_Name() == asmnc::get_Name())
					end if

					if !#expr(ctorinf::get_IsFamilyAndAssembly() andalso ProtectedFlag andalso havinternal) then
						if !#expr(ctorinf::get_IsFamilyOrAssembly() andalso (ProtectedFlag orelse havinternal)) then
							if !#expr(ctorinf::get_IsFamily() andalso ProtectedFlag) then
								if !#expr(ctorinf::get_IsAssembly() andalso havinternal) then
									ctorinf = null
								end if
							end if
						end if
					end if
				else
					ctorinf = null
				end if
			end if

			if ctorinf isnot null then
				MemberTyp = typ
			end if
		end if

		return ctorinf

	end method

	[method: ComVisible(false)]
	method public static IEnumerable<of Managed.Reflection.MethodInfo> LoadSpecMtds(var typ as Managed.Reflection.Type) => _
		Enumerable::Where<of Managed.Reflection.MethodInfo>(typ::GetMethods(), new Func<of Managed.Reflection.MethodInfo,boolean>(MILambdas::IsSpecial))

	[method: ComVisible(false)]
	method public static IEnumerable<of Managed.Reflection.MethodInfo> LoadGenericMtdOverlds(var typ as Managed.Reflection.Type, var name as string, var paramlen as integer)
		var asmn as Managed.Reflection.AssemblyName = typ::get_Assembly()::GetName()
		var asmnc as Managed.Reflection.AssemblyName = AsmFactory::AsmNameStr
		var havinternal as boolean = false
		if asmnc isnot null then
			havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) and (asmn::get_Name() == asmnc::get_Name())
		end if

		var mil as MILambdas = new MILambdas(name,paramlen, havinternal, ProtectedFlag)
		return Enumerable::Where<of Managed.Reflection.MethodInfo>(typ::GetMethods(Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public or Managed.Reflection.BindingFlags::NonPublic), new Func<of Managed.Reflection.MethodInfo,boolean>(mil::GenericMtdFilter()))
	end method

	[method: ComVisible(false)]
	method public static boolean CompareParamsToTyps(var t1 as ParameterInfo[],var t2 as Type[])
		if t1[l] == t2[l] then
			if t1[l] == 0 then
				return true
			end if
			for i = 0 upto --t1[l]
				if !t1[i]::get_ParameterType()::Equals(t2[i]) then
					return false
				end if
			end for
			return true
		else
			return false
		end if
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.MethodInfo LoadBinOp(var typ as Managed.Reflection.Type, var name as string, var typa as Managed.Reflection.Type, var typb as Managed.Reflection.Type)
		var mil as MILambdas = new MILambdas(name)
		var matches = Enumerable::ToArray<of Managed.Reflection.MethodInfo>(Enumerable::Where<of Managed.Reflection.MethodInfo>(LoadSpecMtds(typ), new Func<of Managed.Reflection.MethodInfo,boolean>(mil::IsSameName)))

		if matches[l] = 0 then
			return null
		else
			var bind as Managed.Reflection.Binder = Managed.Reflection.Type::get_DefaultBinder()
			var bf as Managed.Reflection.BindingFlags = Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public
			return $Managed.Reflection.MethodInfo$bind::SelectMethod(bf,matches,new Managed.Reflection.Type[] {typa, typb},new Managed.Reflection.ParameterModifier[0])
		end if
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.MethodInfo LoadUnaOp(var typ as Managed.Reflection.Type, var name as string, var typa as Managed.Reflection.Type)
		var mil as MILambdas = new MILambdas(name)
		var matches = Enumerable::ToArray<of Managed.Reflection.MethodInfo>(Enumerable::Where<of Managed.Reflection.MethodInfo>(LoadSpecMtds(typ), new Func<of Managed.Reflection.MethodInfo,boolean>(mil::IsSameName)))

		if matches[l] = 0 then
			return null
		else
			var bind as Managed.Reflection.Binder = Managed.Reflection.Type::get_DefaultBinder()
			var bf as Managed.Reflection.BindingFlags = Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public
			return $Managed.Reflection.MethodInfo$bind::SelectMethod(bf,matches,new Managed.Reflection.Type[] {typa},new Managed.Reflection.ParameterModifier[0])
		end if
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.MethodInfo LoadGenericMethod(var typ as Managed.Reflection.Type, var name as string, var genparams as Managed.Reflection.Type[], var paramst as Managed.Reflection.Type[])
		var mtdinfo as Managed.Reflection.MethodInfo = null
		var mil as MILambdas = new MILambdas(genparams)
		var matches = Enumerable::ToArray<of Managed.Reflection.MethodInfo>(Enumerable::Select<of Managed.Reflection.MethodInfo,Managed.Reflection.MethodInfo>(LoadGenericMtdOverlds(typ, name, genparams[l]), new Func<of Managed.Reflection.MethodInfo,Managed.Reflection.MethodInfo>(mil::InstGenMtd)))

		if matches[l] = 0 then
			mtdinfo = null
		else
			var bind as Managed.Reflection.Binder = Managed.Reflection.Type::get_DefaultBinder()
			var bf as Managed.Reflection.BindingFlags = Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public
			mtdinfo =  $Managed.Reflection.MethodInfo$bind::SelectMethod(bf,matches,paramst,new Managed.Reflection.ParameterModifier[0])
		end if

		if mtdinfo isnot null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if

		return mtdinfo
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.MethodInfo LoadConvOp(var typ as Managed.Reflection.Type, var name as string, var src as Managed.Reflection.Type, var snk as Managed.Reflection.Type)
		var mil as MILambdas = new MILambdas(name,snk)
		var matches = Enumerable::ToArray<of Managed.Reflection.MethodInfo>(Enumerable::Where<of Managed.Reflection.MethodInfo>(LoadSpecMtds(typ), new Func<of Managed.Reflection.MethodInfo,boolean>(mil::IsSameNameAndReturn)))

		if matches[l] = 0 then
			return null
		else
			var bind as Managed.Reflection.Binder = Managed.Reflection.Type::get_DefaultBinder()
			var bf as Managed.Reflection.BindingFlags = Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public
			return $Managed.Reflection.MethodInfo$bind::SelectMethod(bf,matches,new Managed.Reflection.Type[] {src},new Managed.Reflection.ParameterModifier[0])
		end if

	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.FieldInfo LoadField(var typ as Managed.Reflection.Type, var name as string)
		var fldinfo as Managed.Reflection.FieldInfo = typ::GetField(name)

		if fldinfo is null then
			fldinfo = typ::GetField(name,Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public or Managed.Reflection.BindingFlags::NonPublic)

			if fldinfo isnot null then
				//filter out private members
				if !fldinfo::get_IsPrivate() then

					var asmn as Managed.Reflection.AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as Managed.Reflection.AssemblyName = AsmFactory::AsmNameStr
					var havinternal as boolean = false
					if asmnc isnot null then
						havinternal = asmn::get_Version()::Equals(asmnc::get_Version()) andalso (asmn::get_Name() == asmnc::get_Name())
					end if

					if !#expr(fldinfo::get_IsFamilyAndAssembly() andalso ProtectedFlag andalso havinternal) then
						if !#expr(fldinfo::get_IsFamilyOrAssembly() andalso (ProtectedFlag orelse havinternal)) then
							if !#expr(fldinfo::get_IsFamily() andalso ProtectedFlag) then
								if !#expr(fldinfo::get_IsAssembly() andalso havinternal) then
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

		if fldinfo isnot null then
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
	method public static Managed.Reflection.PropertyInfo LoadProperty(var typ as Managed.Reflection.Type, var name as string)

		var propinfo as Managed.Reflection.PropertyInfo = typ::GetProperty(name)

//		if propinfo = null then
//			propinfo = typ::GetProperty(name,Managed.Reflection.BindingFlags::Instance or Managed.Reflection.BindingFlags::Static or Managed.Reflection.BindingFlags::Public or Managed.Reflection.BindingFlags::NonPublic)
//
//			if propinfo isnot null then
//				//filter out private members
//				if propinfo::get_IsPrivate() = false then
//
//					var asmn as Managed.Reflection.AssemblyName = typ::get_Assembly()::GetName()
//					var asmnc as Managed.Reflection.AssemblyName = AsmFactory::AsmNameStr
//					var havinternal as boolean = false
//					if asmnc isnot null then
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

		if propinfo isnot null then
			MemberTyp = propinfo::get_PropertyType()
		end if
		return propinfo

	end method

end class