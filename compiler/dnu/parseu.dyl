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
		var arr as List<of string> = new List<of string>()
		var ins as boolean = false
		var ch as string = ""
		var acc as string = ""
		var i as integer = -1
		var len as integer = StringToParse::get_Length() - 1
	
		do
			i = i + 1
			ch = $string$StringToParse::get_Chars(i)
	
			if ch = c"\q" then
				ins = ins == false
			end if
	
			if ch = DelimeterChar then
				if ins = false then
					if acc <> "" then
						arr::Add(acc)
					end if
					acc = ""
				end if
				if ins then
					acc = acc + ch
				end if
			else
				acc = acc + ch
			end if
	
			if i = len then
				if acc <> "" then
					arr::Add(acc)
				end if
				acc = ""
			end if

		until i = len
		
		return Enumerable::ToArray<of string>(arr)
	end method

	method public static string[] StringParser2ds(var StringToParse as string, var DelimeterChar as string, var DelimeterChar2 as string)

		var arr as string[] = new string[0]
		var ins as boolean = false
		var ch as string = ""
		var acc as string = ""
		var i as integer = -1
		var len as integer = StringToParse::get_Length() - 1
		
		do
			i = i + 1
			ch = $string$StringToParse::get_Chars(i)

			if ch = c"\q" then
				ins = ins == false
			end if

			if (ch = DelimeterChar) or (ch = DelimeterChar2) then
				if ins = false then
					if acc <> "" then
						arr = addelem(arr, acc)
					end if
					acc = ""
				end if
				if ins then
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
	
	method public static boolean IsHexDigit(var c as char)
		if Char::IsDigit(c) then
			return true
		else
			c = Char::ToLower(c)
			if c = 'a' then
				return true
			elseif c = 'b' then
				return true
			elseif c = 'c' then
				return true
			elseif c = 'd' then
				return true
			elseif c = 'e' then
				return true
			elseif c = 'f' then
				return true
			else
				return false
			end if
		end if
		
	end method
	
	method public static string ProcessString(var escstr as string)
		var sb as StringBuilder = new StringBuilder()
		var i as integer = -1
		var cc as char = 'a'
		var len as integer = escstr::get_Length() - 1
		var buf as string = ""
		
		do until i >= len
			i = i + 1
			cc = escstr::get_Chars(i)
			if cc = '\' then
				if i < len then
					i = i + 1
					cc = escstr::get_Chars(i)
					if cc = 's' then
						sb::Append($char$39)
					elseif cc = 'q' then
						sb::Append($char$34)
					elseif cc = '\' then
						sb::Append('\')
					elseif cc = '0' then
						sb::Append($char$0)
					elseif cc = 'a' then
						sb::Append($char$7)
					elseif cc = 'b' then
						sb::Append($char$8)
					elseif cc = 'f' then
						sb::Append($char$12)
					elseif cc = 'n' then
						sb::Append($char$10)
					elseif cc = 'r' then
						sb::Append($char$13)
					elseif cc = 't' then
						sb::Append($char$9)
					elseif cc = 'v' then
						sb::Append($char$11)
					elseif cc = 'x' then
						if i < (len - 3) then
							i = i + 1
							if IsHexDigit(escstr::get_Chars(i)) and IsHexDigit(escstr::get_Chars(i + 1)) and IsHexDigit(escstr::get_Chars(i + 2)) and IsHexDigit(escstr::get_Chars(i + 3)) then
								buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(i + 1) + $string$escstr::get_Chars(i + 2) + $string$escstr::get_Chars(i + 3)
								sb::Append($char$Int32::Parse(buf,NumberStyles::HexNumber))
								i = i + 3
							elseif IsHexDigit(escstr::get_Chars(i)) and IsHexDigit(escstr::get_Chars(i + 1)) then
								buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(i + 1)
								sb::Append($char$Int32::Parse(buf,NumberStyles::HexNumber))
								i = i + 1
							else
								i = i - 1
							end if
						elseif i < (len - 1) then
							i = i + 1
							if IsHexDigit(escstr::get_Chars(i)) and IsHexDigit(escstr::get_Chars(i + 1)) then
								buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(i + 1)
								sb::Append($char$Int32::Parse(buf,NumberStyles::HexNumber))
								i = i + 1
							else
								i = i - 1
							end if
						end if
					else
						sb::Append(cc)
					end if
				end if
			else
				sb::Append(cc)
			end if
		end do
		
		return sb::ToString()
	end method

end class
