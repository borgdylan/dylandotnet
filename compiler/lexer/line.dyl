//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 


class public auto ansi Line

	field public string PrevChar
	field public boolean InStr
	field public boolean InChar

	method public void Line()
		me::ctor()
		PrevChar = String::Empty
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

	method private boolean isSep(var cc as string, var lc as string, var sca as boolean&, var scla as boolean&)

		var ob as boolean = false
		if lc = null then
			lc = " "
		end if

		label fin

		if cc = c"\q" then
			InStr = InStr == false
			if InStr = false then
				InChar = false
			end if
		end if

		if cc = "'" then
			InChar = InChar == false
		end if

		if (InStr or InChar) = false then
			//----------------------------------
			if cc = ":" then
				if PrevChar = c"\q" then
					if (InStr or InChar) = false then
						ob = true
						scla = false
						sca = true
						goto fin
					end if
				end if
			end if
			//----------------------------------

			if cc = "(" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = ")" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "[" then
				if lc = "]" then
					sca = true
					scla = false
					ob = true
					goto fin
				else
					sca = true
					ob = true
				end if
				goto fin
			end if

			if cc = "]" then
				if PrevChar = "[" then
					ob = false
					sca = true
				else
					sca = true
					ob = true
				end if
				goto fin
			end if

			if cc = "," then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "&" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "*" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "/" then
				if lc != "/" then
					sca = true
					if PrevChar = "/" then
						ob = false
					else
						ob = true
					end if
					goto fin
				else
					if PrevChar = "/" then
						ob = false
						goto fin
					else
						sca = true
						scla = false
						ob = true
						goto fin
					end if
				end if
			end if

			if cc = "|" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "$" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "&" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "~" then
				sca = true
				ob = true
				goto fin
			end if

			if cc = "=" then
				if lc != "=" then
					sca = true
					if PrevChar = ">" then
						ob = false
					else
						if PrevChar = "<" then
							ob = false
						else
							if PrevChar = "!" then
								ob = false
							else
								if PrevChar = "=" then
									ob = false
								else
									ob = true
								end if
							end if
						end if
					end if
					goto fin
				else
					sca = true
					scla = false
					ob = true
					goto fin
				end if
			end if

			if cc = "!" then
				if lc != "=" then
					sca = true
					ob = true
					goto fin
				else
					sca = true
					scla = false
					ob = true
					goto fin
				end if
			end if

			if cc = "<" then
				if lc = "=" then
					sca = true
					scla = false
					ob = true
					goto fin
				else
					if PrevChar = "<" then
						ob = false
					else
						if lc = "<" then
							sca = true
							scla = false
							ob = true
							goto fin
						else
							if lc = ">" then
								sca = true
								scla = false
								ob = true
								goto fin
							else
								sca = true
								ob = true
								goto fin
							end if
						end if
					end if
				end if
			end if

			if cc = ">" then
				if lc != "=" then
					sca = true
					if PrevChar = "<" then
						ob = false
					else
						if PrevChar = ">" then
							ob = false
						else
							if lc = ">" then
								sca = true
								scla = false
								ob = true
								goto fin
							else
								ob = true
							end if
						end if
					end if
					goto fin
				else
					sca = true
					scla = false
					ob = true
					goto fin
				end if
			end if

			if cc = "-" then
				if lc != "-" then
					sca = true
					if PrevChar = "-" then
						ob = false
					else
						ob = true
					end if
					if Char::IsDigit($char$lc) then
						scla = false
					end if
					goto fin
				else
					sca = true
					scla = false
					ob = true
					goto fin
				end if
			end if

			if cc = "+" then
				if lc != "+" then
					sca = true
					if PrevChar = "+" then
						ob = false
					else
						ob = true
					end if
					if Char::IsDigit($char$lc) then
						scla = false
					end if
					goto fin
				else
					sca = true
					scla = false
					ob = true
					goto fin
				end if
			end if

			if cc = c"\t" then
				sca = false
				ob = true
				goto fin
			else
				sca = false
				ob = false
			end if

			if cc = " " then
				sca = false
				ob = true
				goto fin
			else
				sca = false
				ob = false
			end if
		else
			sca = false
			ob = false
		end if

		place fin

		PrevChar = cc
		return ob

	end method

	method public Stmt Analyze(var stm as Stmt, var str as string)
	
		var curchar as string = String::Empty
		var lachar as string = String::Empty
		var curtok as Token = null
		var len as integer = str::get_Length()
		len = len - 1
		
		var buf as string = String::Empty
		var cuttok as boolean = false
		var sc as boolean = false
		var scl as boolean = false
		var i as integer = -1
		var j as integer = 0
		label loop
		label cont
		
		if len = -1 then
			goto cont
		end if
		
		place loop
		
		i = i + 1
		j = i + 1
		cuttok = false
		
		if scl = false then
			sc = false
		end if
		
		if sc then
			if buf::get_Length() != 0 then
				curtok = new Token()
				curtok::Value = buf
				curtok::Line = stm::Line
				stm::AddToken(curtok)
			end if
			buf = String::Empty
		end if
		
		sc = false
		scl = true
		
		curchar = $string$str::get_Chars(i)
		
		if i < len then
			lachar = $string$str::get_Chars(j)
		else
			lachar = null
		end if
		
		cuttok = isSep(curchar, lachar, ref|sc, ref|scl)
		
		if cuttok then
			if buf::get_Length() != 0 then
				curtok = new Token()
				curtok::Value = buf
				curtok::Line = stm::Line
				stm::AddToken(curtok)
			end if
			buf = String::Empty
			if sc then
				buf = buf + curchar
			end if
		else
			buf = buf + curchar
		end if
		
		if i = len then
			goto cont
		else
			goto loop
		end if
		
		place cont
		
		if buf::get_Length() != 0 then
			curtok = new Token()
			curtok::Value = buf
			curtok::Line = stm::Line
			stm::AddToken(curtok)
		end if
		buf = String::Empty
		
		return stm
	
	end method

end class
