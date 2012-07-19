//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit Loader

	field public static boolean FldLitFlag
	field public static boolean ProtectedFlag
	field public static object FldLitVal
	field public static boolean EnumLitFlag
	field public static Type EnumLitTyp
	field public static Type FldLitTyp
	field public static Type MemberTyp
	field public static boolean MakeArr
	field public static boolean MakeRef

	method public static void Loader()
		ProtectedFlag = false
		FldLitFlag = false
		FldLitVal = null
		EnumLitFlag = false
		FldLitTyp = null
		MemberTyp = null
		MakeArr = false
		MakeRef = false
	end method

	method public static Type LoadClass(var name as string) 

		var typ as Type = null
		var curasm as Assembly = null
		var curns as string = ""
		var nest as boolean = false
		var asmb as AssemblyBuilder

		var na as string[] = ParseUtils::StringParser(name,"\")
		name = na[0]
		if na[l] > 1 then
			nest = true
		end if

		var asms as IList<of Assembly> = Importer::Asms
		var asmse as IEnumerator<of Assembly> = asms::GetEnumerator()
		do while asmse::MoveNext()
			curasm = asmse::get_Current()

			if curasm = AsmFactory::AsmB then
				asmb = $AssemblyBuilder$curasm
				typ = asmb::GetType(name,false,false)
				if typ != null then
					if nest = true then
						typ = typ::GetNestedType(na[1])
					end if
					break
				end if
			else
				typ = curasm::GetType(name)
				if typ != null then
					if nest = true then
						typ = typ::GetNestedType(na[1])
					end if
					break
				end if
			end if

			var imps as IList<of string> = Importer::Imps
			var impse as IEnumerator<of string> = imps::GetEnumerator()
			do while impse::MoveNext()
				curns = impse::get_Current()

				if curasm = AsmFactory::AsmB then
					asmb = $AssemblyBuilder$curasm
					typ = asmb::GetType(curns + "." + name,false,false)
					if typ != null then
						if nest = true then
							typ = typ::GetNestedType(na[1])
						end if
						break
					end if

				else
					typ = curasm::GetType(curns + "." + name)
					if typ != null then
						if nest = true then
							typ = typ::GetNestedType(na[1])
						end if
						break
					end if
				end if
			end do
			
			if typ != null then
				break
			end if
			
		end do

		if typ != null then
			if MakeArr = true then
				typ = typ::MakeArrayType()
			end if
			if MakeRef = true then
				typ = typ::MakeByRefType()
			end if
		end if

		MakeArr = false
		MakeRef = false

		return typ

	end method

	method public static Type ProcessType(var typ as Type)
		if MakeArr then
			typ = typ::MakeArrayType()
		end if
		if MakeRef then
			typ = typ::MakeByRefType()
		end if
		
		MakeArr = false
		MakeRef = false
		
		return typ
	end method

	method public static Type[] ParamsToTyps(var t as ParameterInfo[])

		var arr as Type[] = new Type[t[l]]
		var i as integer = -1

		if t[l] = 0 then
			return Type::EmptyTypes
		end if

		do until i = (t[l] - 1)
			i = i + 1
			arr[i] = t[i]::get_ParameterType()
		end do

		return arr
	end method

	method public static MethodInfo LoadMethodWithoutParams(var typ as Type, var name as string)

		var ints as Type[] = null
		var i as integer = -1
		var mtdinfo as MethodInfo = null

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

	method public static Type[] GetDelegateInvokeParams(var typ as Type)
		return ParamsToTyps(LoadMethodWithoutParams(typ, "Invoke")::GetParameters())
	end method

	method public static MethodInfo LoadMethod(var typ as Type, var name as string, var typs as Type[])

		var ints as Type[] = null
		var i as integer = -1
		var mtdinfo as MethodInfo = null

		if typ::get_IsArray() then
			typ = gettype Array
		end if
		
		mtdinfo = typ::GetMethod(name,typs)

		if mtdinfo = null then
			ints = typ::GetInterfaces()

			if ints != null then
				do until i = (ints[l] - 1)
					i = i + 1
					mtdinfo = ints[i]::GetMethod(name,typs)

					if mtdinfo != null then
						break
					end if
				end do
			end if

		end if

		if mtdinfo != null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if

		if mtdinfo = null then
			mtdinfo = typ::GetMethod(name,BindingFlags::Instance or BindingFlags::Static or BindingFlags::Public or BindingFlags::NonPublic, $Binder$null, typs, new ParameterModifier[0])

			if mtdinfo != null then
				//filter out private members
				if mtdinfo::get_IsPrivate() = false then
					var asmn as AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as AssemblyName = AsmFactory::AsmNameStr
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

	method public static ConstructorInfo LoadCtor(var typ as Type, var typs as Type[])

		var ctorinf as ConstructorInfo = typ::GetConstructor(typs)

		if ctorinf != null then
			MemberTyp = typ
		end if

		if ctorinf = null then
			ctorinf = typ::GetConstructor(BindingFlags::Instance or BindingFlags::Static or BindingFlags::Public or BindingFlags::NonPublic, $Binder$null, typs, new ParameterModifier[0])

			if ctorinf != null then
				//filter out private members
				if ctorinf::get_IsPrivate() = false then
				
					var asmn as AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as AssemblyName = AsmFactory::AsmNameStr
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

	method public static IEnumerable<of MethodInfo> LoadSpecMtds(var typ as Type)
		//var tempie as IEnumerable = typ::GetMethods()
		var mtdinfos as IEnumerable<of MethodInfo> = Enumerable::OfType<of MethodInfo>($IEnumerable$typ::GetMethods())
		return Enumerable::Where<of MethodInfo>(mtdinfos, new Func<of MethodInfo,boolean>(MILambdas::IsSpecial()))
	end method

	method public static IEnumerable<of MethodInfo> LoadGenericMtdOverlds(var typ as Type, var name as string, var paramlen as integer)
		var mtdinfos as IEnumerable<of MethodInfo> = Enumerable::OfType<of MethodInfo>($IEnumerable$typ::GetMethods())
		var mil as MILambdas = new MILambdas(name,paramlen)
		return Enumerable::Where<of MethodInfo>(mtdinfos, new Func<of MethodInfo,boolean>(mil::GenericMtdFilter()))
	end method

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

	method public static MethodInfo LoadBinOp(var typ as Type, var name as string, var typa as Type, var typb as Type)

		var typs as Type[] = new Type[2]
		typs[0] = typa
		typs[1] = typb

		var mtdinfos as IEnumerable<of MethodInfo> = LoadSpecMtds(typ)
		var mil as MILambdas = new MILambdas(name)
		mtdinfos = Enumerable::Where<of MethodInfo>(mtdinfos, new Func<of MethodInfo,boolean>(mil::IsSameName()))
		var matches as MethodInfo[] = Enumerable::ToArray<of MethodInfo>(mtdinfos)

		if matches[l] = 0 then
			return null
		else
			var bind as Binder = Type::get_DefaultBinder()
			var bf as BindingFlags = BindingFlags::Instance or BindingFlags::Static or BindingFlags::Public
			return $MethodInfo$bind::SelectMethod(bf,matches,typs,new ParameterModifier[0])
		end if

	end method

	method public static MethodInfo LoadGenericMethod(var typ as Type, var name as string, var genparams as Type[], var paramst as Type[])

		var mtdinfo as MethodInfo = null
		var mtdinfos as IEnumerable<of MethodInfo> = LoadGenericMtdOverlds(typ, name, genparams[l])
		var mil as MILambdas = new MILambdas(genparams)
		mtdinfos = Enumerable::Select<of MethodInfo,MethodInfo>(mtdinfos, new Func<of MethodInfo,MethodInfo>(mil::InstGenMtd()))
		var matches as MethodInfo[] = Enumerable::ToArray<of MethodInfo>(mtdinfos)

		if matches[l] = 0 then
			mtdinfo = null
		else
			var bind as Binder = Type::get_DefaultBinder()
			var bf as BindingFlags = BindingFlags::Instance or BindingFlags::Static or BindingFlags::Public
			mtdinfo =  $MethodInfo$bind::SelectMethod(bf,matches,paramst,new ParameterModifier[0])
		end if

		if mtdinfo != null then
			MemberTyp = mtdinfo::get_ReturnType()
		end if

		return mtdinfo
	end method

	method public static MethodInfo LoadConvOp(var typ as Type, var name as string, var src as Type, var snk as Type)

		var typs as Type[] = new Type[1]
		typs[0] = src
		var mtdinfos as IEnumerable<of MethodInfo> = LoadSpecMtds(typ)
		var mil as MILambdas = new MILambdas(name,snk)
		mtdinfos = Enumerable::Where<of MethodInfo>(mtdinfos, new Func<of MethodInfo,boolean>(mil::IsSameNameAndReturn()))
		var matches as MethodInfo[] = Enumerable::ToArray<of MethodInfo>(mtdinfos)

		if matches[l] = 0 then
			return null
		else
			var bind as Binder = Type::get_DefaultBinder()
			var bf as BindingFlags = BindingFlags::Instance or BindingFlags::Static or BindingFlags::Public
			return $MethodInfo$bind::SelectMethod(bf,matches,typs,new ParameterModifier[0])
		end if

	end method

	method public static FieldInfo LoadField(var typ as Type, var name as string)

		var fldinfo as FieldInfo = null

		fldinfo = typ::GetField(name)
		
		if fldinfo = null then
			fldinfo = typ::GetField(name,BindingFlags::Instance or BindingFlags::Static or BindingFlags::Public or BindingFlags::NonPublic)

			if fldinfo != null then
				//filter out private members
				if fldinfo::get_IsPrivate() = false then
			
					var asmn as AssemblyName = typ::get_Assembly()::GetName()
					var asmnc as AssemblyName = AsmFactory::AsmNameStr
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
			if FldLitFlag = true then
				FldLitVal = fldinfo::GetValue(null)
				FldLitTyp = FldLitVal::GetType()
			end if
			if EnumLitFlag = true then
				EnumLitTyp = Enum::GetUnderlyingType(typ)
			end if
		end if
		return fldinfo

	end method

end class
