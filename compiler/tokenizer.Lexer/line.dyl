//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Line

	field private string PrevChar
	field private boolean InStr
	field private boolean InChar

	method public void Line()
		me::ctor()
		PrevChar = string::Empty
		InStr = false
		InChar = false
	end method

	method public boolean isDigit(var c as char)
		if c >= '0' then
			if c <= '9' then
				return true
			end if
		end if
		return false
	end method
	
	//cc - char to be evaluated
	//lc - lookahead char
	//sca/sc - still copy signal (enables copy to buffer)
	//scla/scl - still cut last signal (enables a buffer flush in the cycle after a char is put in buffer)
	//ob/[cuttok] - signal to flush buffer before current char is written to it
	method private boolean isSep(var cc as string, var lc as string, var sca as boolean&, var scla as boolean&)
		//scla is true as set by Analyze i.e. set only if setting to false
		//sca is false as set by Analyze i.e. set only if setting to true
		//scla and sca are considered only if ob is true
		var ob as boolean = false
		if lc = null then
			lc = " "
		end if

		if cc == c"\q" then
			InStr = !InStr
			if InStr == false then
				InChar = false
			end if
		end if

		if cc == "'" then
			InChar = !InChar
		end if

		if !#expr(InStr or InChar) then
			if (cc == ":") and (PrevChar == c"\q") then
				ob = true
				scla = false
				sca = true
			elseif cc = "(" then
				sca = true
				ob = true
			elseif cc = ")" then
				sca = true
				ob = true
			elseif cc = "{" then
				sca = true
				ob = true
			elseif cc = "}" then
				sca = true
				ob = true
			elseif cc = "[" then
				sca = true
				ob = true
				if lc = "]" then
					scla = false
				end if
			elseif cc = "]" then
				sca = true
				ob = PrevChar != "["
			elseif cc = "," then
				sca = true
				ob = true
			elseif cc = "&" then
				sca = true
				ob = true
			elseif cc = "*" then
				sca = true
				ob = true
			elseif cc = "/" then
				if lc != "/" then
					sca = true
					ob = PrevChar != "/"
				else
					if PrevChar = "/" then
						ob = false
					else
						sca = true
						scla = false
						ob = true
					end if
				end if
			elseif cc = "|" then
				sca = true
				ob = true
			elseif cc = "?" then
				sca = true
				if lc == "?" then
					scla = false
					ob = true
				else
					ob = PrevChar != "?"
				end if
			elseif cc = "$" then
				sca = true
				ob = true
			elseif cc = "&" then
				sca = true
				ob = true
			elseif cc = "~" then
				sca = true
				ob = true
			elseif cc = "=" then
				sca = true
				if lc != "=" then
					if PrevChar = ">" then
						ob = false
					elseif PrevChar = "<" then
						ob = false
					elseif PrevChar = "!" then
						ob = false
					elseif PrevChar = "=" then
						ob = false
					else
						ob = true
					end if
				else
					scla = false
					ob = true
				end if
			elseif cc = "!" then
				sca = true
				ob = true
				if lc == "=" then
					scla = false
				end if
			elseif cc = "<" then
				if lc = "=" then
					sca = true
					scla = false
					ob = true
				else
					if PrevChar = "<" then
						ob = false
					elseif lc = "<" then
						sca = true
						scla = false
						ob = true
					elseif lc = ">" then
						sca = true
						scla = false
						ob = true
					else
						sca = true
						ob = true
					end if
				end if
			elseif cc = ">" then
				sca = true
				if lc != "=" then
					if PrevChar = "<" then
						ob = false
					elseif PrevChar = ">" then
						ob = false
					elseif lc = ">" then
						sca = true
						scla = false
						ob = true
					else
						ob = true
					end if
				else
					scla = false
					ob = true
				end if
			elseif cc = "-" then
				sca = true
				if lc == "-" then
					scla = false
					ob = true
				else
					ob = PrevChar != "-"
					if char::IsDigit($char$lc) then
						scla = false
					end if
				end if
			elseif cc = "+" then
				sca = true
				if lc == "+" then
					scla = false
					ob = true
				else
					ob = PrevChar != "+"
					if char::IsDigit($char$lc) then
						scla = false
					end if
				end if
			elseif cc = c"\t" then
				sca = false
				ob = true
			elseif cc = " " then
				sca = false
				ob = true
			else
				sca = false
				ob = false
			end if
		else
			sca = false
			ob = false
		end if

		PrevChar = cc
		return ob

	end method

	method public Stmt Analyze(var stm as Stmt, var str as string)
	
		var curchar as string = string::Empty
		var lachar as string = string::Empty
		var len as integer = --str::get_Length()
		
		var buf as string = string::Empty
		var sc as boolean = false
		var scl as boolean = false
		var i as integer = -1
		var j as integer = 0
		
		if len > -1 then
			do			
				i++
				j = ++i
				
				if !scl then
					sc = false
				end if
				
				if sc then
					if buf::get_Length() != 0 then
						stm::AddToken(new Token() {Value = buf, Line = stm::Line})
					end if
					buf = string::Empty
				end if
				
				sc = false
				scl = true
				
				curchar = $string$str::get_Chars(i)
				lachar = #ternary{i < len ? $string$str::get_Chars(j), null}
				
				if isSep(curchar, lachar, ref sc, ref scl) then
					if buf::get_Length() != 0 then
						stm::AddToken(new Token() {Value = buf, Line = stm::Line})
					end if
					buf = string::Empty
					if sc then
						buf = buf + curchar
					end if
				else
					buf = buf + curchar
				end if
			
			until i == len
		end if
		
		if buf::get_Length() != 0 then
			stm::AddToken(new Token() {Value = buf, Line = stm::Line})
		end if
		buf = string::Empty
		
		return stm
	
	end method

end class