//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class private sealed MILambdas

	field assembly string Name
	field assembly integer ParamLen
	field assembly Managed.Reflection.Type[] GenParams
	field assembly Managed.Reflection.Type ConvTyp
	field assembly boolean HaveInternal
	field assembly boolean ProtectedFlag

	method assembly void MILambdas()
		mybase::ctor()
		Name = string::Empty
		//ParamLen = 0
		//GenParams = null
		//ConvTyp = null
		//HaveInternal = false
		//ProtectedFlag = false
	end method

	method assembly void MILambdas(var name as string)
		mybase::ctor()
		Name = name
		//ParamLen = 0
		//GenParams = null
		//ConvTyp = null
		//HaveInternal = false
		//ProtectedFlag = false
	end method

	method assembly void MILambdas(var name as string, var snk as Managed.Reflection.Type)
		mybase::ctor()
		Name = name
		//ParamLen = 0
		//GenParams = null
		ConvTyp = snk
		//HaveInternal = false
		//ProtectedFlag = false
	end method

	method assembly void MILambdas(var genparams as Managed.Reflection.Type[])
		mybase::ctor()
		Name = string::Empty
		//ParamLen = 0
		GenParams = genparams
		//ConvTyp = null
		//HaveInternal = false
		//ProtectedFlag = false
	end method

	method assembly void MILambdas(var name as string,var paramlen as integer, var hvint as boolean, var protf as boolean)
		mybase::ctor()
		Name = name
		ParamLen = paramlen
		//GenParams = null
		//ConvTyp = null
		HaveInternal = hvint
		ProtectedFlag = protf
	end method

	method assembly boolean NormalMtdFilter(var mi as Managed.Reflection.MethodInfo)
		if !mi::get_IsGenericMethod() andalso !mi::get_IsGenericMethodDefinition() then
			if mi::get_Name() != Name then
				return false
			end if
		else
			return false
		end if

		if !mi::get_IsPublic() then
			if !mi::get_IsPrivate() then
				if !#expr(mi::get_IsFamilyAndAssembly() andalso ProtectedFlag andalso HaveInternal) then
					if !#expr(mi::get_IsFamilyOrAssembly() andalso (ProtectedFlag orelse HaveInternal)) then
						if !#expr(mi::get_IsFamily() andalso ProtectedFlag) then
							if !#expr(mi::get_IsAssembly() andalso HaveInternal) then
								return false
							end if
						end if
					end if
				end if
			else
				return false
			end if
		end if

		return true
	end method

	method assembly boolean GenericMtdFilter(var mi as Managed.Reflection.MethodInfo)
		if mi::get_IsGenericMethod() then
			if mi::get_Name() == Name then
				if mi::GetGenericArguments()[l] != ParamLen then
					return false
				end if
			else
				return false
			end if
		else
			return false
		end if

		if !mi::get_IsPublic() then
			if !mi::get_IsPrivate() then
				if !#expr(mi::get_IsFamilyAndAssembly() andalso ProtectedFlag andalso HaveInternal) then
					if !#expr(mi::get_IsFamilyOrAssembly() andalso (ProtectedFlag orelse HaveInternal)) then
						if !#expr(mi::get_IsFamily() andalso ProtectedFlag) then
							if !#expr(mi::get_IsAssembly() andalso HaveInternal) then
								return false
							end if
						end if
					end if
				end if
			else
				return false
			end if
		end if

		return true
	end method

	method assembly boolean IsSameName(var mi as Managed.Reflection.MethodInfo) => mi::get_Name() == Name
	method assembly boolean IsSameNameAndReturn(var mi as Managed.Reflection.MethodInfo) => _
		(mi::get_Name() == Name) andalso mi::get_ReturnType()::Equals(ConvTyp)
	method assembly Managed.Reflection.MethodInfo InstGenMtd(var mi as Managed.Reflection.MethodInfo) => mi::MakeGenericMethod(GenParams)
	method assembly static boolean IsSpecial(var mi as Managed.Reflection.MethodInfo) => mi::get_IsSpecialName()

end class