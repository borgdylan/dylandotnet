//    dnc.exe dylan.NET.Compiler Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public static Program

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

        #if NET5_0_OR_GREATER then
        StreamUtils::WriteLine(i"Runtime Version: {RuntimeInformation::get_FrameworkDescription()}")
        StreamUtils::WriteLine(i"OS: {RuntimeInformation::get_OSDescription()}")
        StreamUtils::WriteLine(i"RID: {RuntimeInformation::get_RuntimeIdentifier()}")
        #else
        StreamUtils::WriteLine(i"Runtime Version: {Environment::get_Version()}")
        StreamUtils::WriteLine(i"OS: {Environment::get_OSVersion()}")
        end #if
    end method

    method private static void OutputHelp()
        StreamUtils::WriteLine("Usage: dnc [options] <file-name>")
        StreamUtils::WriteLine("Options:")
        StreamUtils::WriteLine("   -v : View Version Nrs. for all dylan.NET assemblies (aliases are -V and --version)")
        StreamUtils::WriteLine("   -h : View this help message")
        //StreamUtils::WriteLine("   -sdk : Set sdk version (2.0/4.0/4.5)")
        StreamUtils::WriteLine("   -pcl : Set retargatable bit")
    end method

    [method: STAThread()]
    [method: ComVisible(false)]
    method private static void main(var args as string[])

        StreamUtils::WriteLine("dylan.NET Compiler v. 11.10.2.1 RC for Microsoft (R) .NET Framework (R) v. 4.6+,")
        StreamUtils::WriteLine("                           Microsoft (R) .NET (R) v. 5.0+ and Xamarin Mono")
        StreamUtils::WriteLine("This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
        StreamUtils::WriteLine("Copyright (C) 2021 Dylan Borg")

        //var lastsdk as string = null
        var outputFile as string = null
        var inm = false
        var pcl = false

        if args is null then
            StreamUtils::WriteLine("Usage: dnc [options] <file-name>")
        elseif args[l] < 1 then
            StreamUtils::WriteLine("Usage: dnc [options] <file-name>")
        else
            try
                StreamUtils::WriteLine(string::Empty)

                for i = 0 upto --args[l]
                    if args[i]::StartsWith("-") then
                        if args[i] == "-V" orelse args[i] == "-v" orelse args[i] == "--version" then
                            OutputVersion()
                        elseif args[i] == "-h" then
                            OutputHelp()
                        elseif args[i] == "-cd" then
                            i++
                            Environment::set_CurrentDirectory(args[i])
                        elseif args[i] == "-out" then
                            i++
                            outputFile = args[i]
                        elseif args[i] == "-inmemory" then
                            inm = true
                        elseif args[i] == "-pcl" then
                            pcl = true
                        // elseif args[i] == "-sdk" then
                        //     i++
                        //     if i < args[l] then
                        //         lastsdk = args[i]
                        //     end if
                        else
                            //TODO: for now ignoring all bad command line switches by outputting help text
                            OutputHelp()
                        end if
                    else
                        ILEmitter::Init()
                        AsmFactory::Init()
                        Importer::Init()
                        Loader::Init()
                        SymTable::Init()

                        AsmFactory::InMemorySet = inm
                        AsmFactory::PCLSet = pcl
                        AsmFactory::OutputFile = outputFile

                        // if lastsdk isnot null then
                        //     Importer::AsmBasePath = Path::Combine(Path::Combine(RuntimeEnvironment::GetRuntimeDirectory(), ".."), lastsdk)
                        // end if

                        if !File::Exists(args[i]) then
                            StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, i"File '{args[i]}' does not exist.")
                        end if

                        #if DEBUG then
                        StreamUtils::Write(i"Now Lexing: {args[i]}")
                        end #if

                        var pstmts as StmtSet = new Lexer()::Analyze(args[i])

                        #if DEBUG then
                        StreamUtils::Write(i"...Done.\nNow Parsing: {args[i]}")
                        end #if

                        var ppstmts as StmtSet = new Parser()::Parse(pstmts, true)

                        #if DEBUG then
                        StreamUtils::WriteLine("...Done.")
                        end #if

                        new CodeGenerator()::EmitMSIL(ppstmts, Path::GetFullPath(args[i]))
                    end if
                end for
            catch errex as ErrorException

            catch ex as Exception
                StreamUtils::WriteLine(string::Empty)
                try
                    StreamUtils::WriteError(ILEmitter::LineNr, 0, ILEmitter::CurSrcFile, ex::ToString())
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

    #if NET46_OR_GREATER orelse NETSTANDARD2_0 orelse NET5_0_OR_GREATER then
        method private static void InvokeAsyncWrapper(var args as object)
            Invoke($string[]$args)
        end method

        [method: ComVisible(false)]
        method public static Task InvokeAsync(var args as string[]) => Task::get_Factory()::StartNew(new Action<of object>(InvokeAsyncWrapper), args)

    end #if

end class
