//The NuGet helper for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.3 or later

//    nuget2dn.exe dylan.NET.NuGet Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"

import System
import System.IO
import System.Runtime.InteropServices
import System.Text
import System.Collections.Generic

#if DEBUG then
[assembly: System.Reflection.AssemblyConfiguration("DEBUG")]
#else
[assembly: System.Reflection.AssemblyConfiguration("RELEASE")]
end #if
[assembly: System.Reflection.AssemblyTitle("dylan.NET.NuGet")]
[assembly: System.Reflection.AssemblyCopyright("Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>")]

assembly nuget2dn exe
ver 11.3.1.4

namespace dylan.NET.NuGet

	class public auto ansi Program
		
		method private static integer MakeKey(var dir as string)
			dir = dir::ToLowerInvariant()
			if dir like "^\d+$" then
				return $integer$dir
			elseif dir like "^net\d+$" then
				return $integer$dir::Substring(3)
			else
				return integer::MaxValue
			end if
		end method
		
		[method: STAThread()]
		method public static void main(var args as string[])
		
			Console::WriteLine("dylan.NET NuGet Helper v. 11.3.1.4 Beta")
			Console::WriteLine("This program is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
			Console::WriteLine("Copyright (C) 2012 Dylan Borg")
			if args[l] < 1 then
				Console::WriteLine("Usage: nuget2dylandotnet [options] <folder-name>")
			else
				var allow45 as boolean = true
				foreach arg in args
					if arg == "-h" then
						Console::WriteLine("")
						Console::WriteLine("Usage: nuget2dylandotnet [options] <file-name>")	
						Console::WriteLine("Options:")
						Console::WriteLine("   -h : View this help message")
						Console::WriteLine("   -no45 : Prefer .NET 4.0 libraries over .NET 4.5 ones")
					elseif arg == "-no45" then
						allow45 = false
					else
						if Directory::Exists(arg) then
							if Directory::Exists(arg + $string$Path::DirectorySeparatorChar + "lib") then
								var di as DirectoryInfo = new DirectoryInfo(arg + $string$Path::DirectorySeparatorChar + "lib")
								var dict as Dictionary<of integer, LinkedList<of DirectoryInfo> > = new Dictionary<of integer, LinkedList<of DirectoryInfo> >()
								var sw as StreamWriter = new StreamWriter(arg + ".dyl")
								foreach dir in di::GetDirectories()
									var k as integer = MakeKey(dir::get_Name())
									if dict::ContainsKey(k) == false then
										dict::Add(k, new LinkedList<of DirectoryInfo>())
									end if
									dict::get_Item(k)::Add(dir)
								end for
								var applyc2 as boolean = false
								if dict::ContainsKey(45) and allow45 then
									applyc2 = true
									foreach dir in dict::get_Item(45)
										sw::WriteLine("#if CLR_4 then")
										foreach file in dir::GetFiles()
											if file::get_Extension()::ToLowerInvariant() == ".dll" or file::get_Extension()::ToLowerInvariant() == ".exe" then
												sw::WriteLine(c"#refasm \q" + arg + "/lib/" + dir::get_Name() + "/" + file::get_Name() + c"\q")
											end if
										end for
										sw::WriteLine("end #if")
									end for
								elseif dict::ContainsKey(40) then
									applyc2 = true
									foreach dir in dict::get_Item(40)
										sw::WriteLine("#if CLR_4 then")
										foreach file in dir::GetFiles()
											if file::get_Extension()::ToLowerInvariant() == ".dll" or file::get_Extension()::ToLowerInvariant() == ".exe" then
												sw::WriteLine(c"#refasm \q" + arg + "/lib/" + dir::get_Name() + "/" + file::get_Name() + c"\q")
											end if
										end for
										sw::WriteLine("end #if")
									end for
								end if
								if dict::ContainsKey(35) then
									foreach dir in dict::get_Item(35)
										if applyc2 then
											sw::WriteLine("#if CLR_2 then")
										end if
										foreach file in dir::GetFiles()
											if file::get_Extension()::ToLowerInvariant() == ".dll" or file::get_Extension()::ToLowerInvariant() == ".exe" then
												sw::WriteLine(c"#refasm \q" + arg + "/lib/" + dir::get_Name() + "/" + file::get_Name() + c"\q")
											end if
										end for
										if applyc2 then
											sw::WriteLine("end #if")
										end if
									end for
								elseif dict::ContainsKey(20) then
									foreach dir in dict::get_Item(20)
										if applyc2 then
											sw::WriteLine("#if CLR_2 then")
										end if
										foreach file in dir::GetFiles()
											if file::get_Extension()::ToLowerInvariant() == ".dll" or file::get_Extension()::ToLowerInvariant() == ".exe" then
												sw::WriteLine(c"#refasm \q" + arg + "/lib/" + dir::get_Name() + "/" + file::get_Name() + c"\q")
											end if
										end for
										if applyc2 then
											sw::WriteLine("end #if")
										end if
									end for
								else
									foreach file in di::GetFiles()
										if file::get_Extension()::ToLowerInvariant() == ".dll" or file::get_Extension()::ToLowerInvariant() == ".exe" then
											sw::WriteLine(c"#refasm \q" + arg + "/lib/" + file::get_Name() + c"\q")
										end if
									end for
								end if
								sw::Flush()
								sw::Close()
								sw::Dispose()
								Console::WriteLine(arg + ".dyl")
							else
								Console::WriteLine("The directory '" + arg + "' does not contain a 'lib' directory!!!")
							end if
						else
							Console::WriteLine("The directory '" + arg + "' does not exist!!!")
						end if
					end if
				end for
				
			end if
		
		end method
	
	end class

end namespace

