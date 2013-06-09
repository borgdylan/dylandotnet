//The pkg-config helper for the dylan.NET language
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.3 or later

//    pc2cd.exe dylan.NET.PkgConfig.PC2CD Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
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

#if DEBUG then
[assembly: System.Reflection.AssemblyConfiguration("DEBUG")]
#else
[assembly: System.Reflection.AssemblyConfiguration("RELEASE")]
end #if
[assembly: System.Reflection.AssemblyTitle("dylan.NET.PkgConfig.PC2CD")]
[assembly: System.Reflection.AssemblyCopyright("Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>")]

assembly pc2cd exe
ver 11.3.1.4

namespace dylan.NET.PkgConfig.PC2CD

	class public auto ansi Program
	
		method public static void CopyFile(var s as string)
			
			if !Path::IsPathRooted(s) then
				s = Path::Combine(RuntimeEnvironment::GetRuntimeDirectory(), s)
			end if
			
			File::Copy(s, Path::GetFileName(s), true)
			
		end method
	
		method public static void ConvToDYL(var path as string)
			//Console::WriteLine(path)
			
			var sr as StreamReader = new StreamReader(path)
			var sb as StringBuilder = new StringBuilder()
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
						
						CopyFile(s)
						
					end if
					
					sb = new StringBuilder()
				else	
					sb::Append($char$sr::Read())
				end if
			while sr::Peek() != -1
			
			CopyFile(sb::ToString()::Trim())
			
			sr::Close()
			sr::Dispose()
			
		end method
		
		[method: STAThread()]
		method public static void main(var args as string[])
		
			Console::WriteLine("dylan.NET Pkg-Config Helper v. 11.3.1.4 Beta")
			Console::WriteLine("This program is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
			Console::WriteLine("Copyright (C) 2012 Dylan Borg")
			if args[l] < 1 then
				Console::WriteLine("Usage: pc2dylandotnet [options] <file-name>")
			else
				for i = 0 upto --args[l]
					if args[i] == "-h" then
						Console::WriteLine("")
						Console::WriteLine("Usage: pc2dylandotnet [options] <file-name>")	
						Console::WriteLine("Options:")
						Console::WriteLine("   -h : View this help message")
					else
						ConvToDYL(args[i])
					end if
				end for
			end if
		
		end method
	
	end class

end namespace
