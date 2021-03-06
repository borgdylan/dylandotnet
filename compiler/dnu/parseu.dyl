//    dnu.dll dylan.NET.Utils Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public static ParseUtils

	[method: ComVisible(false)]
	method public static string[] StringParser(var StringToParse as string, var DelimeterChar as char)

		if string::IsNullOrEmpty(StringToParse) then
			return Array::Empty<of string>()
		end if

		var arr as C5.IList<of string> = new C5.LinkedList<of string>()
		var ins as boolean = false
		var ch as char
		var acc as StringBuilder = new StringBuilder()
		var len as integer = --StringToParse::get_Length()

		for i = 0 upto len
			ch = StringToParse::get_Chars(i)

			if ch == c'\q' then
				ins = !ins
			end if

			if ch == DelimeterChar then
				if ins then
					acc::Append(ch)
				else
					if acc::get_Length() != 0 then
						arr::Add(acc::ToString())
					end if
					acc::Clear()
				end if
			else
				acc::Append(ch)
			end if

			if i == len then
				if acc::get_Length() != 0 then
					arr::Add(acc::ToString())
				end if
				acc::Clear()
			end if

		end for

		return arr::ToArray()
	end method

	[method: ComVisible(false)]
	method public static C5.IList<of string> StringParserL(var StringToParse as string, var DelimeterChar as char)
		var arr as C5.IList<of string> = new C5.LinkedList<of string>()

		if string::IsNullOrEmpty(StringToParse) then
			return arr
		end if

		var ins as boolean = false
		var ch as char
		var acc as StringBuilder = new StringBuilder()
		var len as integer = --StringToParse::get_Length()

		for i = 0 upto len
			ch = StringToParse::get_Chars(i)

			if ch == c'\q' then
				ins = !ins
			end if

			if ch = DelimeterChar then
				if ins then
					acc::Append(ch)
				else
					if acc::get_Length() != 0 then
						arr::Add(acc::ToString())
					end if
					acc::Clear()
				end if
			else
				acc::Append(ch)
			end if

			if i == len then
				if acc::get_Length() != 0 then
					arr::Add(acc::ToString())
				end if
				acc::Clear()
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

			if ch == c"\q" then
				ins = !ins
			end if

			if (ch == DelimeterChar) orelse (ch == DelimeterChar2) then
				if ins then
					acc = acc + ch
				else
					if acc::get_Length() != 0 then
						arr::Add(acc)
					end if
					acc = string::Empty
				end if
			else
				acc = acc + ch
			end if

			if i == len then
				if acc::get_Length() != 0 then
					arr::Add(acc)
				end if
				acc = string::Empty
			end if

		end for

		return arr::ToArray()
	end method

//	[method: ComVisible(false)]
//	method public static boolean LikeOP(var str as string, var pattern as string)
//		return str like pattern
//	end method
//
//	[method: ComVisible(false)]
//	method public static integer RetPrec(var chr as string)
//		if chr == "(" then
//			return -1
//		elseif (chr == "*") or  (chr == "/") or (chr == "%") then
//			return 8
//		elseif (chr == "+") or  (chr == "-") then
//			return 6
//		elseif chr == ")" then
//			return 0
//		else
//			return 0
//		end if
//	end method

	[method: ComVisible(false)]
	method public static string ProcessMSYSPath(var p as string, var pid as PlatformID)
		var arr as string[]
		var str as string

		if pid == PlatformID::Win32NT then
			if p::Contains("/") then
				p = p::Replace('/',c'\\')
				if File::Exists(p) = false then
					arr = StringParser(p, c'\\')
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
	method public static string ProcessMSYSPath(var p as string) => ProcessMSYSPath(p, Environment::get_OSVersion()::get_Platform())

	[method: ComVisible(false)]
	method public static boolean IsHexDigit(var c as char)
		if char::IsDigit(c) then
			return true
		else
			c = char::ToLower(c)
			return c >= 'a' andalso c <= 'f'
		end if
	end method

	[method: ComVisible(false)]
	method public static string ProcessString(var escstr as string)
		var sb as StringBuilder = new StringBuilder()
		var i as integer = -1
		var cc as char = 'a'
		var len as integer = --escstr::get_Length()

		do until i >= len
			i++
			cc = escstr::get_Chars(i)
			if cc == c'\\' andalso i < len then
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
						if IsHexDigit(escstr::get_Chars(i)) andalso IsHexDigit(escstr::get_Chars(++i)) andalso IsHexDigit(escstr::get_Chars(i + 2)) andalso IsHexDigit(escstr::get_Chars(i + 3)) then
							sb::Append($char$integer::Parse(i"{escstr::get_Chars(i)}{escstr::get_Chars(++i)}{escstr::get_Chars(i + 2)}{escstr::get_Chars(i + 3)}", NumberStyles::HexNumber))
							i = i + 3
						elseif IsHexDigit(escstr::get_Chars(i)) andalso IsHexDigit(escstr::get_Chars(++i)) then
							sb::Append($char$integer::Parse(i"{escstr::get_Chars(i)}{escstr::get_Chars(++i)}", NumberStyles::HexNumber))
							i++
						else
							i--
						end if
					elseif i < --len then
						i++
						if IsHexDigit(escstr::get_Chars(i)) andalso IsHexDigit(escstr::get_Chars(++i)) then
							sb::Append($char$integer::Parse(i"{escstr::get_Chars(i)}{escstr::get_Chars(++i)}", NumberStyles::HexNumber))
							i++
						else
							i--
						end if
					end if
				else
					sb::Append(cc)
				end if
			else
				sb::Append(cc)
			end if
		end do

		return sb::ToString()
	end method

	[method: ComVisible(false)]
	method public static InterpolateResult Interpolate(var input as string)
		var cc as char
		var lc as char
		var len as integer = --input::get_Length()
		var buf as StringBuilder = new StringBuilder(input::get_Length())
		var cbuf as StringBuilder = null
		var j as integer = -1
		var es = new C5.ArrayList<of (integer, string) >()
		//false means copy to format, true means copy to current expression
		var mode as boolean = false
		var exprStart as integer = -1
		var lvl as integer = 0

		for i = 0 upto len
			cc = input::get_Chars(i)
			lc = #ternary {i < len ? input::get_Chars(++i), ' '}

			if cc == '{' then
				if lc == '{' then
					i++
					if mode then
						cbuf::Append('{')
					else
						buf::Append("{{")
					end if
					continue
				else
					mode = true
					lvl = 0
					j++
					buf::Append('{')::Append(j)
					cbuf = new StringBuilder(10)
					//expression starts at ++i, Analyze() needs an offset so we pass in i instead
					exprStart = i
					continue
				end if
			elseif cc == '}' then
				if lc == '}' then
					i++
					if mode then
						cbuf::Append('}')
					else
						buf::Append("}}")
					end if
					continue
				elseif mode then
					mode = false
					es::Add(#tuple(exprStart, cbuf::ToString()))
				end if
			elseif cc == c'\\' andalso lc == 'q' then
				i++
				if mode then
					cbuf::Append(c'\q')
				else
					buf::Append(c'\q')
				end if
				continue
			elseif cc == c'\\' andalso lc == 'n' then
				i++
				if mode then
					cbuf::Append(c'\n')
				else
					buf::Append(c'\n')
				end if
				continue
			elseif cc == c'\\' andalso lc == 'r' then
				i++
				if mode then
					cbuf::Append(c'\r')
				else
					buf::Append(c'\r')
				end if
				continue
			elseif cc == c'\\' andalso lc == c'\\' then
				i++
				if mode then
					cbuf::Append(c'\\')
				else
					buf::Append(c'\\')
				end if
				continue
			elseif mode andalso cc == '(' then
				lvl++
			elseif mode andalso cc == ')' then
				lvl--
			elseif mode andalso cc == ',' andalso lvl == 0 then
				mode = false
				es::Add(#tuple(exprStart, cbuf::ToString()))
			elseif mode andalso cc == ':' then
				if lc == ':' then
					i++
					if mode then
						cbuf::Append("::")
					else
						buf::Append("::")
					end if
					continue
				else
					mode = false
					es::Add(#tuple(exprStart, cbuf::ToString()))
				end if
			end if

			if mode then
				cbuf::Append(cc)
			else
				buf::Append(cc)
			end if
		end for

		return new InterpolateResult(buf::ToString(), es)
	end method

end class
