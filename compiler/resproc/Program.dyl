namespace dylan.NET.ResProc

	class public auto ansi static ResProc

		field private static boolean UseResx
		field private static Action<of Msg> _WarnH
		field private static List<of string> Outs

		method public static void Init()
			UseResx = true
			Outs = new List<of string>()
		end method

		method private static void ResProc()
			Init()
			_WarnH = null
		end method

		method public static void WarnInit()
			_WarnH = null
		end method

		event public static Action<of Msg> WarnH
			add
				_WarnH = #ternary {_WarnH == null ? value, _WarnH + value}
			end add
			remove
				if _WarnH != null then
					_WarnH = _WarnH - value
				end if
			end remove
		end event

		[method: ComVisible(false)]
		method private static string[] StringParser(var StringToParse as string)
			var arr as List<of string> = new List<of string>()
			
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
		
				if string::IsNullOrWhiteSpace(ch) then
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
		method private static boolean IsHexDigit(var c as char)
			if char::IsDigit(c) then
				return true
			else
				c = char::ToLower(c)
				if c == 'a' then
					return true
				elseif c == 'b' then
					return true
				elseif c == 'c' then
					return true
				elseif c == 'd' then
					return true
				elseif c == 'e' then
					return true
				elseif c == 'f' then
					return true
				else
					return false
				end if
			end if
			
		end method
		
		[method: ComVisible(false)]
		method private static string ProcessString(var escstr as string)
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
						if cc = 's' then
							sb::Append(c'\s')
						elseif cc = 'q' then
							sb::Append(c'\q')
						elseif cc = c'\\' then
							sb::Append(c'\\')
						elseif cc = '0' then
							sb::Append(c'\0')
						elseif cc = 'a' then
							sb::Append(c'\a')
						elseif cc = 'b' then
							sb::Append(c'\b')
						elseif cc = 'f' then
							sb::Append(c'\f')
						elseif cc = 'n' then
							sb::Append(c'\n')
						elseif cc = 'r' then
							sb::Append(c'\r')
						elseif cc = 't' then
							sb::Append(c'\t')
						elseif cc = 'v' then
							sb::Append(c'\v')
						elseif cc = 'x' then
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

		[method: ComVisible(false)]
		method public static void WriteWarn(var line as integer, var file as string, var msg as string)
			Console::WriteLine("WARNING: " + msg + " at line " + $string$line + " in file: " + file)
			if _WarnH != null then
				_WarnH::Invoke(new Msg(line,file,msg))
			end if
		end method

		method private static void EmitResource(var pth as string)
			if File::Exists(pth) then
				using rr = #ternary{UseResx ? $IResourceWriter$#expr(new ResXResourceWriter(Path::ChangeExtension(pth, ".resx"))), $IResourceWriter$#expr(new ResourceWriter(Path::ChangeExtension(pth, ".resources")))}
					using sr = new StreamReader(pth)
						var sentinel = false
						var lin as integer = 0
						do while !sr::get_EndOfStream()
							var line as string[] = StringParser(sr::ReadLine())
							lin++
							if line[l] >= 3 then
								if line[0] notlike "//(.)*" then
									line[2] = #ternary {line[2]::StartsWith("c") ? ProcessString(line[2]::TrimStart(new char[] {'c'})::Trim(new char[] {c'\q'})), line[2]::Trim(new char[] {c'\q'})}

									if line[1] == "string" then
										rr::AddResource(line[0], line[2])
										sentinel = true
							
									elseif line[1] == "file" then
										if File::Exists(line[2]) then
											rr::AddResource(line[0], File::ReadAllBytes(line[2]))
											sentinel = true
										else
											WriteWarn(lin, pth, string::Format("File '{0}' does not exist, ignored!!!", line[2]))
										end if
									elseif line[1] == "stream" then
										if File::Exists(line[2]) then
											var fs = new FileStream(line[2], FileMode::Open)
											var ms as Stream = new MemoryStream()
											fs::CopyTo(ms)
											rr::AddResource(line[0], ms)
											fs::Close()
											sentinel = true
										else
											WriteWarn(lin, pth, string::Format("File '{0}' does not exist, ignored!!!", line[2]))
										end if
									elseif line[1] == "image" then
										if File::Exists(line[2]) then
											rr::AddResource(line[0], new System.Drawing.Bitmap(line[2]))
											sentinel = true
										else
											WriteWarn(lin, pth, string::Format("File '{0}' does not exist, ignored!!!", line[2]))
										end if
									else
										WriteWarn(lin, pth, string::Format("Resource type '{0}' was not recognized, ignored!!!", line[1]))
									end if
								end if
							end if
						end do
						if !sentinel then
							rr::AddResource("$empty$", string::Empty)
						end if
					end using
					Outs::Add(#ternary{UseResx ? Path::ChangeExtension(pth, ".resx"), Path::ChangeExtension(pth, ".resources")})
				end using
			else
				WriteWarn(0, pth, string::Format("File '{0}' does not exist, ignored!!!", pth))
			end if
		end method

		method public static IEnumerable<of string> Invoke(var args as string[])
		
			Console::WriteLine("dylan.NET Resource Processor v. 11.3.3.1 Beta")
			Console::WriteLine("This program is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
			Console::WriteLine("Copyright (C) 2014 Dylan Borg")
			if args[l] < 1 then
				Console::WriteLine("Usage: resproc ([options] <input-file-name>+)*")
			else
				Init()
				for i = 0 upto --args[l]
					if args[i] == "-h" then
						Console::WriteLine(string::Empty)
						Console::WriteLine("Usage: resproc ([options] <input-file-name>+)*")	
						Console::WriteLine("Options:")
						Console::WriteLine("   -resx : Emit resources in .resx format")
						Console::WriteLine("   -resources : Emit resources in .resources format")
						Console::WriteLine("   -h : View this help message")
					elseif args[i] == "-resx" then
						UseResx = true
					elseif args[i] == "-resources" then
						UseResx = false
					else
						EmitResource(args[i])
					end if
				end for
			end if
			return Outs
		end method

		[method: STAThread()]
		method private static void main(var args as string[])
			Invoke(args)
		end method
	
	end class

end namespace	