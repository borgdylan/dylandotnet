//    dnc.exe dylan.NET.Compiler Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
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

		StreamUtils::WriteLine(c"\nRuntime & OS Version Info:")
		StreamUtils::WriteLine(Assembly::GetAssembly(gettype string)::ToString())
		StreamUtils::WriteLine(string::Format("Runtime Version: {0}", Environment::get_Version()::ToString()))
		StreamUtils::WriteLine(string::Format("OS: {0}", Environment::get_OSVersion()::ToString()))
	end method
	
	method private static void OutputHelp()
		StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
		StreamUtils::WriteLine("Options:")
		StreamUtils::WriteLine("   -V : View Version Nrs. for all dylan.NET assemblies")
		StreamUtils::WriteLine("   -h : View this help message")
		StreamUtils::WriteLine("   -sdk : Set sdk version (2.0/4.0/4.5)")
		StreamUtils::WriteLine("   -pcl : Set retargatable bit")
	end method
	
	[method: STAThread()]
	[method: ComVisible(false)]
	method private static void main(var args as string[])
		
		StreamUtils::WriteLine("dylan.NET Compiler v. 11.3.5.1 RC for Microsoft (R) .NET Framework (R) v. 3.5 SP1 / 4.0 / 4.5")
		StreamUtils::WriteLine("                           and Xamarin Mono v. 2.x.y/v. 3.x.y")
		StreamUtils::WriteLine("This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
		StreamUtils::WriteLine("Copyright (C) 2014 Dylan Borg")

		var lastsdk as string = null

		if args == null then
			StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
		elseif args[l] < 1 then
			StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
		else
			try
				for i = 0 upto --args[l]
					StreamUtils::WriteLine(string::Empty)
					if args[i] == "-V" then
						OutputVersion()
					elseif args[i] == "-h" then
						OutputHelp()
					elseif args[i] == "-pcl" then
						AsmFactory::PCLSet = true
						//i++
						//if i < args[l] then
							//get pcl lookup durectory
						//	args[i] = ParseUtils::ProcessMSYSPath(args[i])
						//	if !Directory::Exists(args[i]) then
						//		StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Directory '" + args[i] + "' does not exist.")
						//	else
						//		Importer::AsmBasePath = args[i]
						//	end if
						//else
						//	StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "PCL Directory path expected.")
						//end if
					elseif args[i] == "-sdk" then
						i++
						if i < args[l] then
							lastsdk = args[i]
						end if
					elseif args[i] == "-cd" then
						i++
						Environment::set_CurrentDirectory(args[i])
					else
						ILEmitter::Init()
						AsmFactory::Init()
						Importer::Init()
						Loader::Init()
						SymTable::Init()

						if lastsdk != null then
							Importer::AsmBasePath = Path::Combine(Path::Combine(RuntimeEnvironment::GetRuntimeDirectory(), ".."), lastsdk)
						end if

						if !File::Exists(args[i]) then
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("File '{0}' does not exist.", args[i]))
						end if
						StreamUtils::Write(string::Format("Now Lexing: {0}", args[i]))
						var pstmts as StmtSet = new Lexer()::Analyze(args[i])
						StreamUtils::Write(string::Format(c"...Done.\nNow Parsing: {0}", args[i]))
						var ppstmts as StmtSet = new Parser()::Parse(pstmts)
						StreamUtils::WriteLine("...Done.")
						new CodeGenerator()::EmitMSIL(ppstmts, args[i])
					end if
				end for	
			catch errex as ErrorException
			
			catch ex as Exception
				StreamUtils::WriteLine(string::Empty)
				try
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, ex::ToString())
				catch errex2 as ErrorException
				end try
			end try

		end if

	end method
	
	[method: ComVisible(false)]
	method public static void Invoke(var args as string[])
		StreamUtils::TerminateOnError = false
		main(args)
	end method
	
	#if NET_4_0 or NET_4_5 then
	
		method private static void InvokeAsyncWrapper(var args as object)
			Invoke($string[]$args)
		end method
	
		[method: ComVisible(false)]
		method public static Task InvokeAsync(var args as string[])
			return Task::get_Factory()::StartNew(new Action<of object>(InvokeAsyncWrapper()),args)
		end method
	
	end #if

end class
