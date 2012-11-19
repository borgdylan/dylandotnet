//    dnc.exe dylan.NET.Compiler Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static Program
	
	method private static void OutputVersion()
		StreamUtils::WriteLine("dylan.NET Version Info:")
		StreamUtils::WriteLine(Assembly::GetExecutingAssembly()::ToString())
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype Loader)::ToString())
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype XmlUtils)::ToString())
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype CodeGenerator)::ToString())
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype Parser)::ToString())
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype Lexer)::ToString())
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype StmtSet)::ToString())

		StreamUtils::WriteLine("")
		StreamUtils::WriteLine("Runtime & OS Version Info:")
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype string)::ToString())
		StreamUtils::Write("Runtime Version: ")
		StreamUtils::WriteLine(Environment::get_Version()::ToString())
		StreamUtils::Write("OS: ")
		StreamUtils::WriteLine(Environment::get_OSVersion()::ToString())
	end method
	
	method private static void OutputHelp()
		StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
		StreamUtils::WriteLine("Options:")
		StreamUtils::WriteLine("   -V : View Version Nrs. for all dylan.NET assemblies")
		StreamUtils::WriteLine("   -h : View this help message")
	end method
	
	[method: STAThread()]
	[method: ComVisible(false)]
	method private static void main(var args as string[])

		StreamUtils::WriteLine("dylan.NET Compiler v. 11.2.9.8 Beta for Microsoft (R) .NET Framework (R) v. 3.5 SP1 / 4.0 / 4.5")
		StreamUtils::WriteLine("                           and Xamarin Mono v. 2.x.y/v. 3.x.y")
		StreamUtils::WriteLine("This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
		#if NET_4_0 or NET_4_5 then
			StreamUtils::WriteLine("Currently Targeting the 4.0/4.5 Profile!!")
		#else
			StreamUtils::WriteLine("Currently Targeting the 3.5 Profile!!")
		end #if
		StreamUtils::WriteLine("Copyright (C) 2012 Dylan Borg")

		if args = null then
			StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
		elseif args[l] < 1 then
			StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
		else
			//try
				var i as integer = -1

				do until i = (args[l] - 1)
					i = i + 1
					StreamUtils::WriteLine("")
					if args[i] = "-V" then
						OutputVersion()
					elseif args[i] = "-h" then
						OutputHelp()
					else
						ILEmitter::Init()
						AsmFactory::Init()
						Importer::Init()
						var lx as Lexer = new Lexer()
						StreamUtils::Write("Now Lexing: ")
						StreamUtils::Write(args[i])
						var pstmts as StmtSet = lx::Analyze(args[i])
						StreamUtils::WriteLine("...Done.")
						var ps as Parser = new Parser()
						StreamUtils::Write("Now Parsing: ")
						StreamUtils::Write(args[i])
						var ppstmts as StmtSet = ps::Parse(pstmts)
						StreamUtils::WriteLine("...Done.")
						var cg as CodeGenerator = new CodeGenerator()
						cg::EmitMSIL(ppstmts, args[i])
					end if
				end do
			//catch ex as Exception
			//	StreamUtils::WriteLine(ex::ToString())
			//	Environment::Exit(2)
			//end try

		end if

	end method
	
	[method: ComVisible(false)]
	method public static void Invoke(var args as string[])
		main(args)
	end method

end class
