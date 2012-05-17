//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class private auto ansi MILambdas

	field assembly string Name
	field assembly integer ParamLen
	field assembly Type[] GenParams
	field assembly Type ConvTyp

	method assembly void MILambdas()
		me::ctor()
		Name = ""
		ParamLen = 0
		GenParams = null
		ConvTyp = null
	end method

	method assembly void MILambdas(var name as string)
		me::ctor()
		Name = name
		ParamLen = 0
		GenParams = null
		ConvTyp = null
	end method

	method assembly void MILambdas(var name as string, var snk as Type)
		me::ctor()
		Name = name
		ParamLen = 0
		GenParams = null
		ConvTyp = snk
	end method

	method assembly void MILambdas(var genparams as Type[])
		me::ctor()
		Name = ""
		ParamLen = 0
		GenParams = genparams
		ConvTyp = null
	end method

	method assembly void MILambdas(var name as string,var paramlen as integer)
		me::ctor()
		Name = name
		ParamLen = paramlen
		GenParams = null
		ConvTyp = null
	end method

	method assembly boolean GenericMtdFilter(var mi as MethodInfo)
		if mi::get_IsGenericMethod() then
			if mi::get_Name() = Name then
				if mi::GetGenericArguments()[l] = ParamLen then
					return true
				end if
			end if
		end if
		return false
	end method

	method assembly boolean IsSameName(var mi as MethodInfo)
		return mi::get_Name() == Name
	end method

	method assembly boolean IsSameNameAndReturn(var mi as MethodInfo)
		return (mi::get_Name() == Name) and mi::get_ReturnType()::Equals(ConvTyp)
	end method

	method assembly MethodInfo InstGenMtd(var mi as MethodInfo)
		return mi::MakeGenericMethod(GenParams)
	end method

	method assembly static boolean IsSpecial(var mi as MethodInfo)
		return mi::get_IsSpecialName()
	end method

end class