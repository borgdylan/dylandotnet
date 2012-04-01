//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Importer

	field public static Assembly[] Asms
	field public static string[] Imps
	field public static string[] LocImps

	method public static void Init()
		Asms = new Assembly[0]
		Imps = new string[0]
	end method

	method public static void Importer()
		Init()
	end method

	method public static void AddAsm(var asm as Assembly)
		var i as integer = -1
		var destarr as Assembly[] = new Assembly[Asms[l] + 1]

		do until i = (Asms[l] - 1) 
			i = i + 1
			destarr[i] = Asms[i]
		end do

		destarr[Asms[l]] = asm
		Asms = destarr
	end method

	method public static string[] addelem(var srcarr as string[], var eltoadd as string)
		var i as integer = -1
		var destarr as string[] = new string[srcarr[l] + 1]

		do until i = (srcarr[l] - 1)
			i = i + 1
			destarr[i] = srcarr[i]
		end do

		destarr[srcarr[l]] = eltoadd
		return destarr
	end method

	method public static void AddImp(var imp as string)
		Imps = addelem(Imps,imp)
	end method

	method public static void AddLocImp(var imp as string)
		Imps = addelem(Imps,imp)
	end method

end class
