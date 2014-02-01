//    dnu.dll dylan.NET.Utils Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi static ParseUtils

//	method private static string[] addelem(var srcarr as string[], var eltoadd as string)
//
//		var i as integer = -1
//		var destarr as string[] = new string[++srcarr[l]]
//
//		do until i = --srcarr[l]
//			i++
//			destarr[i] = srcarr[i]
//		end do
//
//		destarr[srcarr[l]] = eltoadd
//
//		return destarr
//	end method
//
//	method private static string[] remelem(var srcarr as string[])
//		var i as integer = -1
//		var destarr as string[] = new string[--srcarr[l]]
//
//		do while (srcarr[l] - 2) >= i
//			i++
//			destarr[i] = srcarr[i]
//		end do
//	
//		return destarr
//	end method

	[method: ComVisible(false)]
	method public static string[] StringParser(var StringToParse as string, var DelimeterChar as string)
		var arr as C5.IList<of string> = new C5.LinkedList<of string>()
		
		if StringToParse == null then
			return arr::ToArray()
		end if
		
		var ins as boolean = false
		var ch as string = string::Empty
		var acc as string = string::Empty
		var len as integer = --StringToParse::get_Length()
	
		for i = 0 upto len
			ch = $string$StringToParse::get_Chars(i)
	
			if ch = c"\q" then
				ins = !ins
			end if
	
			if ch = DelimeterChar then
				if !ins then
					if acc::get_Length() != 0 then
						arr::Add(acc)
					end if
					acc = string::Empty
				end if
				if ins then
					acc = acc + ch
				end if
			else
				acc = acc + ch
			end if
	
			if i = len then
				if acc::get_Length() != 0 then
					arr::Add(acc)
				end if
				acc = String::Empty
			end if

		end for
		
		return arr::ToArray()
	end method
	
	[method: ComVisible(false)]
	method public static C5.IList<of string> StringParserL(var StringToParse as string, var DelimeterChar as string)
		var arr as C5.IList<of string> = new C5.LinkedList<of string>()
		
		if StringToParse == null then
			return arr
		end if
		
		var ins as boolean = false
		var ch as string = string::Empty
		var acc as string = string::Empty
		var len as integer = --StringToParse::get_Length()
	
		for i = 0 upto len
			ch = $string$StringToParse::get_Chars(i)
	
			if ch = c"\q" then
				ins = !ins
			end if
	
			if ch = DelimeterChar then
				if !ins then
					if acc::get_Length() != 0 then
						arr::Add(acc)
					end if
					acc = string::Empty
				end if
				if ins then
					acc = acc + ch
				end if
			else
				acc = acc + ch
			end if
	
			if i = len then
				if acc::get_Length() != 0 then
					arr::Add(acc)
				end if
				acc = string::Empty
			end if

		end for
		
		return arr
	end method
	
	[method: ComVisible(false)]
	method public static string[] StringParser2ds(var StringToParse as string, var DelimeterChar as string, var DelimeterChar2 as string)

		var arr as C5.IList<of string> = new C5.LinkedList<of string>()
		var ins as boolean = false
		var ch as string = string::Empty
		var acc as string = string::Empty
		var len as integer = --StringToParse::get_Length()
		
		for i = 0 upto len
			ch = $string$StringToParse::get_Chars(i)

			if ch = c"\q" then
				ins = !ins
			end if

			if (ch == DelimeterChar) or (ch == DelimeterChar2) then
				if !ins then
					if acc::get_Length() != 0 then
						arr::Add(acc)
					end if
					acc = string::Empty
				end if
				if ins then
					acc = acc + ch
				end if
			else
				acc = acc + ch
			end if

			if i = len then
				if acc::get_Length() != 0 then
					arr::Add(acc)
				end if
				acc = string::Empty
			end if

		end for

		return arr::ToArray()
	end method

	[method: ComVisible(false)]
	method public static boolean LikeOP(var str as string, var pattern as string)
		return str like pattern
	end method

	[method: ComVisible(false)]
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

	[method: ComVisible(false)]
	method public static string ProcessMSYSPath(var p as string, var pid as PlatformID)
		var arr as string[]
		var str as string
	
		if pid == PlatformID::Win32NT then
			if p::Contains("/") then
				p = p::Replace('/',c'\\')
				if File::Exists(p) = false then
					arr = StringParser(p, c"\\")
					str = arr[0]
					if str::get_Length() = 1 then
						arr[0] = str + ":"
					end if
					p = string::Join(c"\\",arr)
				end if
			end if
		end if
		return p
	end method

	[method: ComVisible(false)]
	method public static string ProcessMSYSPath(var p as string)
		return ProcessMSYSPath(p, Environment::get_OSVersion()::get_Platform())
	end method
	
	[method: ComVisible(false)]
	method public static boolean IsHexDigit(var c as char)
		if char::IsDigit(c) then
			return true
		else
			c = char::ToLower(c)
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
	
	[method: ComVisible(false)]
	method public static string ProcessString(var escstr as string)
		var sb as StringBuilder = new StringBuilder()
		var i as integer = -1
		var cc as char = 'a'
		var len as integer = --escstr::get_Length()
		var buf as string = string::Empty
		
		do until i >= len
			i++
			cc = escstr::get_Chars(i)
			if cc == c'\\' then
				if i < len then
					i++
					cc = escstr::get_Chars(i)
					if cc == 's' then
						sb::Append(c'\s')
					elseif cc == 'q' then
						sb::Append(c'\q')
					elseif cc == c'\\' then
						sb::Append(c'\\')
					elseif cc == '0' then
						sb::Append(c'\0')
					elseif cc == 'a' then
						sb::Append(c'\a')
					elseif cc == 'b' then
						sb::Append(c'\b')
					elseif cc == 'f' then
						sb::Append(c'\f')
					elseif cc == 'n' then
						sb::Append(c'\n')
					elseif cc == 'r' then
						sb::Append(c'\r')
					elseif cc == 't' then
						sb::Append(c'\t')
					elseif cc == 'v' then
						sb::Append(c'\v')
					elseif cc == 'x' then
						if i < (len - 3) then
							i++
							if IsHexDigit(escstr::get_Chars(i)) and IsHexDigit(escstr::get_Chars(++i)) and IsHexDigit(escstr::get_Chars(i + 2)) and IsHexDigit(escstr::get_Chars(i + 3)) then
								buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(++i) + $string$escstr::get_Chars(i + 2) + $string$escstr::get_Chars(i + 3)
								sb::Append($char$integer::Parse(buf,NumberStyles::HexNumber))
								i = i + 3
							elseif IsHexDigit(escstr::get_Chars(i)) and IsHexDigit(escstr::get_Chars(++i)) then
								buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(++i)
								sb::Append($char$integer::Parse(buf,NumberStyles::HexNumber))
								i++
							else
								i--
							end if
						elseif i < --len then
							i++
							if IsHexDigit(escstr::get_Chars(i)) and IsHexDigit(escstr::get_Chars(++i)) then
								buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(++i)
								sb::Append($char$integer::Parse(buf,NumberStyles::HexNumber))
								i++
							else
								i--
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
