//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi ParseUtils

	field public static string[] stack

	method public static void ParseUtils()
		stack = new string[0]
	end method

	method private static string[] addelem(var srcarr as string[], var eltoadd as string)

		var i as integer = -1
		var destarr as string[] = new string[srcarr[l] + 1]

		do until i = (srcarr[l] - 1)
			i = i + 1
			destarr[i] = srcarr[i]
		end do

		destarr[srcarr[l]] = eltoadd

		return destarr
	end method

	method private static string[] remelem(var srcarr as string[])
		var i as integer = -1
		var destarr as string[] = new string[srcarr[l] - 1]

		do while (srcarr[l] - 2) >= i
			i = i + 1
			destarr[i] = srcarr[i]
		end do
	
		return destarr
	end method


	method public static string[] StringParser(var StringToParse as string, var DelimeterChar as string)
		var arr as string[] = new string[0]
		var ins as boolean = false
		var ch as string = ""
		var acc as string = ""
		var i as integer = -1
		var len as integer = StringToParse::get_Length() - 1
	
		do
			i = i + 1
			ch = $string$StringToParse::get_Chars(i)
	
			if ch = Utils.Constants::quot then
				if ins = false then
					ins = true
				elseif ins = true then
					ins = false
				end if
			end if
	
			if ch = DelimeterChar then
				if ins = false then
					if acc <> "" then
						arr = addelem(arr, acc)
					end if
					acc = ""
				end if
				if ins = true then
					acc = acc + ch
				end if
			else
				acc = acc + ch
			end if
	
			if i = len then
				if acc <> "" then
					arr = addelem(arr, acc)
				end if
				acc = ""
			end if

		until i = len
		
		return arr
	end method

	method public static string[] StringParser2ds(var StringToParse as string, var DelimeterChar as string, var DelimeterChar2 as string)

		var arr as string[] = new string[0]
		var ins as boolean = false
		var ch as string = ""
		var acc as string = ""
		var i as integer = -1
		var len as integer = StringToParse::get_Length() - 1
		var ic as string = Utils.Constants::quot
		
		do
			i = i + 1
			ch = $string$StringToParse::get_Chars(i)

			if ch = ic then
				if ins = false then
					ins = true
				elseif ins = true then
					ins = false
				end if
			end if

			if (ch = DelimeterChar) or (ch = DelimeterChar2) then
				if ins = false then
					if acc <> "" then
						arr = addelem(arr, acc)
					end if
					acc = ""
				end if
				if ins = true then
					acc = acc + ch
				end if
			else
				acc = acc + ch
			end if

			if i = len then
				if acc <> "" then
					arr = addelem(arr, acc)
				end if
				acc = ""
			end if

		until i = len

		return arr
	end method

	method public static boolean LikeOP(var str as string, var pattern as string)
		return str like pattern
	end method

	method public static integer RetPrec(var chr as string)
		if chr = "(" then
			return -1
		elseif (chr = "*") or  (chr = "/") or (chr = "%") then
			return 8
		elseif (chr = "+") or  (chr = "-") then
			return 6
		elseif chr = ")" then
			return 0
		else
			return 0
		end if
	end method

	method public static string ProcessMSYSPath(var p as string)

		var platf as PlatformID = Environment::get_OSVersion()::get_Platform()
		var arr as string[]
		var str as string
	
		if platf = PlatformID::Win32NT then
			if p::Contains("/") then
				p = p::Replace('/','\')
				if File::Exists(p) = false then
					arr = StringParser(p, "\")
					str = arr[0]
					if str::get_Length() = 1 then
						str = str + ":"
						arr[0] = str
					end if
					p = String::Join("\",arr)
				end if
			end if
		end if
		return p
	end method

end class
