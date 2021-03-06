//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import Managed.Reflection

class private MILambdas2

	field assembly string Name
	field assembly integer ParamLen
	field assembly Managed.Reflection.Type[] Params
	field assembly Managed.Reflection.Type Auxt

	method assembly void MILambdas2()
		mybase::ctor()
		Name = string::Empty
	end method

	method assembly void MILambdas2(var name as string, var params as Managed.Reflection.Type[], var auxt as Managed.Reflection.Type)
		mybase::ctor()
		Name = name
		Params = params
		Auxt = auxt
	end method

	method assembly void MILambdas2(var params as Managed.Reflection.Type[], var auxt as Managed.Reflection.Type)
		mybase::ctor()
		Name = string::Empty
		Params = params
		Auxt = auxt
	end method

	method assembly void MILambdas2(var name as string, var pl as integer)
		mybase::ctor()
		Name = name
		ParamLen = pl
	end method

	method assembly MethodInfo Bind(var mi as MethodItem) => $MethodInfo$mi::MethodBldr::BindTypeParameters(Auxt)

	method assembly boolean GenericMtdFilter(var mi as MethodItem)
		if mi::NrGenParams > 0 then
			//no need to check since its implicit in store
			//if mi::Name == Name then
				if mi::NrGenParams != ParamLen then
					return false
				end if
			//else
			//	return false
			//end if
		else
			return false
		end if

//		if !mi::get_IsPublic() then
//			if !mi::get_IsPrivate() then
//				if !#expr(mi::get_IsFamilyAndAssembly() and ProtectedFlag and HaveInternal) then
//					if !#expr(mi::get_IsFamilyOrAssembly() and (ProtectedFlag or HaveInternal)) then
//						if !#expr(mi::get_IsFamily() and ProtectedFlag) then
//							if !#expr(mi::get_IsAssembly() and HaveInternal) then
//								return false
//							end if
//						end if
//					end if
//				end if
//			else
//				return false
//			end if
//		end if
//
		return true
	end method

	method assembly Managed.Reflection.MethodInfo InstGenMtd(var mi as MethodItem) => _
		#expr($MethodInfo$mi::MethodBldr::BindTypeParameters(Auxt))::MakeGenericMethod(Params)

	method assembly boolean CmpTyps(var arra as ParameterInfo[], var arrb as Managed.Reflection.Type[])
		if arra[l] == arrb[l] then
			if arra[l] == 0 then
				return true
			end if
			var i as integer = -1
			do until i = --arra[l]
				i++
				if !arra[i]::get_ParameterType()::IsAssignableFrom(arrb[i]) then
					return false
				end if
			end do
		else
			return false
		end if
		return true
	end method

	method assembly boolean CmpTyps2(var arra as Managed.Reflection.Type[], var arrb as Managed.Reflection.Type[])
		if arra[l] == arrb[l] then
			if arra[l] = 0 then
				return true
			end if
			var i as integer = -1
			do until i = --arra[l]
				i++
				if !arra[i]::Equals(arrb[i]) then
					return false
				end if
			end do
		else
			return false
		end if
		return true
	end method

	method assembly boolean DetermineIfCandidate(var mi as MethodInfo) => _
		#ternary {mi::get_IsGenericMethod() ? false, CmpTyps(mi::GetParameters(),Params)}

	method assembly boolean DetermineIfCandidate2(var mi as MethodInfo) => CmpTyps(mi::GetParameters(),Params)

	method assembly boolean DetermineIfProtoCandidate(var mi as MethodItem)
		//(mi::Name == Name) not needed since its implicit in store
		if mi::NrGenParams == 0 then
			return CmpTyps2(mi::ParamTyps,Params)
		else
			return false
		end if
	end method

	method assembly static integer CalcDeriveness(var t as Managed.Reflection.Type)
		var d as integer = 1
		do while t::get_BaseType() isnot null
			d++
			t = t::get_BaseType()
		end do
		return d
	end method

	method assembly static integer[] ExtractDeriveness(var mi as MethodInfo)
		var pt = mi::GetParameters()
		var deriv as integer[] = new integer[pt[l]]
		var i as integer = -1
		do until i = --deriv[l]
			i++
			deriv[i] = CalcDeriveness(pt[i]::get_ParameterType())
		end do
		return deriv
	end method

	method assembly static integer[] ExtractDeriveness2(var mi as MethodInfo)
		var params = mi::GetParameters()
		var deriv as integer[] = new integer[params[l]]
		var i as integer = -1
		do until i = --deriv[l]
			i++
			deriv[i] = CalcDeriveness(params[i]::get_ParameterType())
		end do
		return deriv
	end method

	method assembly static integer[] ZipDeriveness(var d as integer[],var n as integer)
		var deriv as integer[] = new integer[++d[l]]
		Array::Copy(d,deriv,$long$d[l])
		deriv[--deriv[l]] = n
		return deriv
	end method

	method assembly static integer[] DerivenessMax(var d1 as integer[],var d2 as integer[])
		var i as integer = -1
		var f as boolean = true
		do until i >= (d1[l] - 2)
			i++
			if d1[i] < d2[i] then
				f = false
				break
			end if
		end do
		return #ternary {f ? d1, d2}
	end method

end class