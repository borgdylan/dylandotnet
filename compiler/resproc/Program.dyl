//    resproc.exe dylan.NET.ResProc Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

namespace dylan.NET.ResProc

	class public static ResProc

		field private static integer Mode
		field private static Action<of Msg> _WarnH
		field private static List<of string> Outs
		field private static string NS

		method public static void Init()
			Mode = 0
			Outs = new List<of string>()
			NS = string::Empty
		end method

		method private static void ResProc()
			Init()
			//_WarnH = null
		end method

		method public static void WarnInit()
			_WarnH = null
		end method

		event public static Action<of Msg> WarnH
			add
				_WarnH = #ternary {_WarnH is null ? value, _WarnH + value}
			end add
			remove
				if _WarnH isnot null then
					_WarnH = _WarnH - value
				end if
			end remove
		end event

		[method: ComVisible(false)]
		method private static string[] StringParser(var StringToParse as string)
			var arr as List<of string> = new List<of string>()
			
			if StringToParse is null then
				return arr::ToArray()
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
		
				if ch == ' ' then
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
		method public static boolean IsHexDigit(var c as char)
			if char::IsDigit(c) then
				return true
			else
				c = char::ToLower(c)
				return c >= 'a' andalso c <= 'f'
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
								if IsHexDigit(escstr::get_Chars(i)) andalso IsHexDigit(escstr::get_Chars(++i)) andalso IsHexDigit(escstr::get_Chars(i + 2)) andalso IsHexDigit(escstr::get_Chars(i + 3)) then
									buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(++i) + $string$escstr::get_Chars(i + 2) + $string$escstr::get_Chars(i + 3)
									sb::Append($char$integer::Parse(buf,NumberStyles::HexNumber))
									i = i + 3
								elseif IsHexDigit(escstr::get_Chars(i)) andalso IsHexDigit(escstr::get_Chars(++i)) then
									buf = $string$escstr::get_Chars(i) + $string$escstr::get_Chars(++i)
									sb::Append($char$integer::Parse(buf,NumberStyles::HexNumber))
									i++
								else
									i--
								end if
							elseif i < --len then
								i++
								if IsHexDigit(escstr::get_Chars(i)) andalso IsHexDigit(escstr::get_Chars(++i)) then
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
			if _WarnH isnot null then
				_WarnH::Invoke(new Msg(line,file,msg))
			end if
		end method

		method private static void EmitResource(var pth as string)
			if File::Exists(pth) then
				using rr = #ternary{Mode == 0 ? $IResourceWriter$#expr(new ResXResourceWriter(Path::ChangeExtension(pth, ".resx"))), new ResourceWriter(Path::ChangeExtension(pth, ".resources"))}
					using sr = new StreamReader(pth,true)
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
					Outs::Add(#ternary{Mode == 0 ? Path::ChangeExtension(pth, ".resx"), Path::ChangeExtension(pth, ".resources")})
				end using
			else
				WriteWarn(0, pth, string::Format("File '{0}' does not exist, ignored!!!", pth))
			end if
		end method

		method private static void EmitDesigner(var pth as string)
			if File::Exists(pth) then
				using sw = new StreamWriter(Path::ChangeExtension(pth, ".designer.dyl"))
					using sr = new StreamReader(pth,true)
						var lin as integer = 0
						var cls = pth::Split(new char[] {'.'})[0]

						sw::WriteLine("namespace " + #ternary {NS == string::Empty ? "Resources" , NS})
						sw::WriteLine(c"\n	class private static " + cls)

						sw::WriteLine(c"\n		field private static System.Resources.ResourceManager resman")
						sw::WriteLine(c"\n		method private static void " + cls + "()")
						sw::WriteLine("			resman = new System.Resources.ResourceManager(gettype " + cls + ")")
						sw::WriteLine(c"		end method\n")

						do while !sr::get_EndOfStream()
							var line as string[] = StringParser(sr::ReadLine())
							lin++
							if line[l] >= 3 then
								if line[0] notlike "//(.)*" then
									line[2] = #ternary {line[2]::StartsWith("c") ? ProcessString(line[2]::TrimStart(new char[] {'c'})::Trim(new char[] {c'\q'})), line[2]::Trim(new char[] {c'\q'})}

									if line[1] == "string" then
										sw::WriteLine(c"		property assembly static string " + line[0])
										sw::WriteLine("			get")
										sw::WriteLine(c"				return resman::GetString(\q" + line[0] + c"\q)")
										sw::WriteLine("			end get")
										sw::WriteLine(c"		end property\n")
									elseif line[1] == "file" then
										if File::Exists(line[2]) then
											sw::WriteLine(c"		property assembly static byte[] " + line[0])
											sw::WriteLine("			get")
											sw::WriteLine(c"				return $byte[]$resman::GetObject(\q" + line[0] + c"\q)")
											sw::WriteLine("			end get")
											sw::WriteLine(c"		end property\n")
										else
											WriteWarn(lin, pth, string::Format("File '{0}' does not exist, ignored!!!", line[2]))
										end if
									elseif line[1] == "stream" then
										if File::Exists(line[2]) then
											sw::WriteLine(c"		property assembly static System.IO.Stream " + line[0])
											sw::WriteLine("			get")
											sw::WriteLine(c"				return resman::GetStream(\q" + line[0] + c"\q)")
											sw::WriteLine("			end get")
											sw::WriteLine(c"		end property\n")
										else
											WriteWarn(lin, pth, string::Format("File '{0}' does not exist, ignored!!!", line[2]))
										end if
									elseif line[1] == "image" then
										if File::Exists(line[2]) then
											sw::WriteLine(c"		property assembly static System.Drawing.Bitmap " + line[0])
											sw::WriteLine("			get")
											sw::WriteLine(c"				return $System.Drawing.Bitmap$resman::GetObject(\q" + line[0] + c"\q)")
											sw::WriteLine("			end get")
											sw::WriteLine(c"		end property\n")
										else
											WriteWarn(lin, pth, string::Format("File '{0}' does not exist, ignored!!!", line[2]))
										end if
									else
										WriteWarn(lin, pth, string::Format("Resource type '{0}' was not recognized, ignored!!!", line[1]))
									end if
								end if
							end if
						end do

						sw::WriteLine("	end class")
						sw::WriteLine(c"\nend namespace")
					end using
					Outs::Add(Path::ChangeExtension(pth, ".designer.dyl"))
				end using
			else
				WriteWarn(0, pth, string::Format("File '{0}' does not exist, ignored!!!", pth))
			end if
		end method

		method public static IEnumerable<of string> Invoke(var args as string[])
		
			Console::WriteLine("dylan.NET Resource Processor v. 11.6.1.1 RC")
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
						Console::WriteLine("   -designer : Emit a dylan.NET class for resource access")
						Console::WriteLine("   -resources : Emit resources in .resources format")
						Console::WriteLine("   -ns : Set root namespace")
						Console::WriteLine("   -h : View this help message")
					elseif args[i] == "-resx" then
						Mode = 0
					elseif args[i] == "-resources" then
						Mode = 1
					elseif args[i] == "-designer" then
						Mode = 2
					elseif args[i] == "-ns" then
						i++
						NS = args[i]
					else
						if Mode == 2 then
							EmitDesigner(args[i])
						else
							EmitResource(args[i])
						end if
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