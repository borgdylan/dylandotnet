//The pkg-config helper for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.2.9.8 or later

//    pc2dn.exe dylan.NET.PkgConfig.PC2DN Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
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
import System.Text

#if DEBUG then
[assembly: System.Reflection.AssemblyConfiguration("DEBUG")]
#else
[assembly: System.Reflection.AssemblyConfiguration("RELEASE")]
end #if
[assembly: System.Reflection.AssemblyTitle("dylan.NET.PkgConfig.PC2DN")]
[assembly: System.Reflection.AssemblyCopyright("Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>")]

assembly pc2dn exe
ver 11.2.9.9

namespace dylan.NET.PkgConfig.PC2DN

	class public auto ansi Program
	
		method public static void PutInFile(var s as string, var sw as StreamWriter)			
			if Path::IsPathRooted(s) then
				sw::WriteLine(c"#refasm \q" + s + c"\q")
			else
				sw::WriteLine(c"#refstdasm \q" + s + c"\q")
			end if
		end method
	
		method public static void ConvToDYL(var path as string)
			
			var sr as StreamReader = new StreamReader(path)
			var sb as StringBuilder = new StringBuilder()
			var sw as StreamWriter = new StreamWriter(Path::ChangeExtension(path,".dyl"))
			var flags as boolean[] = new boolean[3]
			var s as string = null
			
			do
				if $char$sr::Peek() = '-' then
					flags[0] = true
					flags[1] = false
					flags[2] = false
				elseif ($char$sr::Peek() = 'r') and flags[0] then
					flags[1] = true
					flags[2] = false
				elseif ($char$sr::Peek() = ':') and flags[1] then
					flags[2] = true
				end if
				
				if flags[0] and flags[1] and flags[2] then
					sb::Append($char$sr::Read())
					flags[0] = false
					
					if sb::ToString() != "-r:" then
						s = sb::ToString()
						if s like "^(.)*-r:$" then
							s = s::Substring(0, s::get_Length() - 4)
							s = s::Trim()
						end if
						
						PutInFile(s, sw)
						
					end if
					
					sb = new StringBuilder()
				else	
					sb::Append($char$sr::Read())
				end if
			while sr::Peek() != -1
			
			PutInFile(sb::ToString()::Trim(),sw)
			
			sr::Close()
			sw::Close()
			sr::Dispose()
			sw::Dispose()
			
		end method
		
		[method: STAThread()]
		method private static void main(var args as string[])
		
			Console::WriteLine("dylan.NET Pkg-Config Helper v. 11.2.9.9 Beta")
			Console::WriteLine("This program is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
			Console::WriteLine("Copyright (C) 2012 Dylan Borg")
			if args[l] < 1 then
				Console::WriteLine("Usage: pc2dylandotnet [options] <file-name>")
			else
				var i as integer = -1
				var len as integer = args[l] - 1
				
				do
					i = i + 1
					
					if args[i] == "-h" then
						Console::WriteLine("")
						Console::WriteLine("Usage: pc2dylandotnet [options] <file-name>")
						Console::WriteLine("Options:")
						Console::WriteLine("   -h : View this help message")
					else
						ConvToDYL(args[i])
					end if
				until i = len
			end if
		
		end method
	
	end class

end namespace
