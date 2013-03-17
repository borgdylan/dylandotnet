//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class private auto ansi CILambdas

	field assembly IKVM.Reflection.Type[] Params

	method assembly void CILambdas()
		me::ctor()
		Params = null
	end method

	method assembly void CILambdas(var params as IKVM.Reflection.Type[])
		me::ctor()
		Params = params
	end method

	method assembly boolean CmpTyps(var arra as IKVM.Reflection.Type[], var arrb as IKVM.Reflection.Type[])
		if arra[l] = arrb[l] then
			if arra[l] = 0 then
				return true
			end if
			var i as integer = -1
			do until i = (arra[l] - 1)
				i++
				if !arra[i]::IsAssignableFrom(arrb[i]) then
					return false
				end if
			end do
		else
			return false
		end if
		return true
	end method

	method assembly boolean DetermineIfCandidate(var ci as CtorItem)
		return CmpTyps(ci::ParamTyps,Params)
	end method

	method assembly integer CalcDeriveness(var t as IKVM.Reflection.Type)
		var d as integer = 1
		do while t::get_BaseType() != null
			d = d + 1
			t = t::get_BaseType()
		end do
		return d
	end method

	method assembly static integer[] ExtractDeriveness(var ci as CtorItem)
		var deriv as integer[] = new integer[ci::ParamTyps[l]]
		var i as integer = -1
		do until i = --deriv[l]
			i++
			deriv[i] = CalcDeriveness(ci::ParamTyps[i])
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
			i = i + 1
			if d1[i] < d2[i] then
				f = false
				break
			end if
		end do
		return #ternary{f ? d1, d2}
	end method

end class
