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
		var i as integer = -1
		var curasm as Assembly = null
		var j as integer = -1
		var curns as string = ""
		var nest as boolean = false
		var asmb as AssemblyBuilder

		var na as string[] = ParseUtils::StringParser(name,"\")
		name = na[0]
		if na[l] > 1 then
			nest = true
		end if

		do until i = (Importer::Asms[l] - 1)
			i = i + 1

			curasm = Importer::Asms[i]

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
			
			j = -1

			do until j = (Importer::Imps[l] - 1)
				j = j + 1
				curns = Importer::Imps[j]

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
		if MakeArr = true then
			typ = typ::MakeArrayType()
		end if
		if MakeRef = true then
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

	method public static MethodInfo[] LoadSpecMtds(var typ as Type)

		var i as integer = -1
		var mtdinfos as MethodInfo[] = typ::GetMethods()
		var mtdinfog as MethodInfo[] = new MethodInfo[0]
	
		do until i = (mtdinfos[l] - 1)
			i = i + 1
			if mtdinfos[i]::get_IsSpecialName() then
				mtdinfog = addelemmtdinfo(mtdinfog, mtdinfos[i])
			end if
		end do

		return mtdinfog

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
		var i as integer = -1
		var mtdinfo as MethodInfo = null
		var mtdinfos as MethodInfo[] = LoadSpecMtds(typ)
	
		do until i = (mtdinfos[l] - 1)
			i = i + 1
			mtdinfo = mtdinfos[i]
			if mtdinfo::get_Name() = name then
				if CompareParamsToTyps(mtdinfo::GetParameters(), typs) then
					return mtdinfo
				else
					mtdinfo = null
				end if
			else
				mtdinfo = null
			end if
		end do
		return mtdinfo
	end method

	method public static MethodInfo LoadConvOp(var typ as Type, var name as string, var src as Type, var snk as Type)

		var typs as Type[] = new Type[1]
		typs[0] = src
		var i as integer = -1
		var mtdinfo as MethodInfo = null
		var mtdinfos as MethodInfo[] = LoadSpecMtds(typ)
	
		do until i = (mtdinfos[l] - 1)
			i = i + 1
			mtdinfo = mtdinfos[i]

			if mtdinfo::get_Name() = name then
				if CompareParamsToTyps(mtdinfo::GetParameters(), typs) then
					if mtdinfo::get_ReturnType()::Equals(snk) then
						return mtdinfo
					else
						mtdinfo = null
					end if
				else
					mtdinfo = null
			end if
			else
				mtdinfo = null
			end if
		end do
		return mtdinfo
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
