//    dnc.exe dylan.NET.Compiler Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Module1

method public static void main(var args as string[])

//StreamUtils::InitOutS(StreamUtils::Stdout) 

StreamUtils::WriteLine("dylan.NET Compiler v. 11.2.8.4 Beta for Microsoft (R) .NET Framework (R) v. 3.5 SP1 / 4.0")
StreamUtils::WriteLine("                           and Xamarin Mono v. 2.6.7/v. 2.10.x")
StreamUtils::WriteLine("This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
StreamUtils::WriteLine("Copyright (C) 2012 Dylan Borg")
if args[l] < 1 then
StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
else

//try

var p as string = ""

var len as integer = args[l] - 1
var i as integer = -1
var comp as integer = 0
var curarg as string = ""
var tmpstr as string = ""
var temptyp as System.Type
var asm as Assembly


label loop
label cont
label fin
label ext

place loop

i++

curarg = args[i]

comp = String::Compare(curarg, "-V")
if comp = 0 then

StreamUtils::WriteLine("")
StreamUtils::WriteLine("dylan.NET Version Info:")

asm = Assembly::GetExecutingAssembly()
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

temptyp = gettype Loader
asm = Assembly::GetAssembly(temptyp)
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

temptyp = gettype XmlUtils
asm = Assembly::GetAssembly(temptyp)
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

temptyp = gettype CodeGenerator
asm = Assembly::GetAssembly(temptyp)
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

temptyp = gettype Parser
asm = Assembly::GetAssembly(temptyp)
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

temptyp = gettype Lexer
asm = Assembly::GetAssembly(temptyp)
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

temptyp = gettype StmtSet
asm = Assembly::GetAssembly(temptyp)
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

StreamUtils::WriteLine("")
StreamUtils::WriteLine("Runtime & OS Version Info:")

temptyp = gettype string
asm = Assembly::GetAssembly(temptyp)
tmpstr = asm::ToString()
StreamUtils::WriteLine(tmpstr)

var runver as Version = Environment::get_Version()
var runverstr as string = runver::ToString()

StreamUtils::Write("Runtime Version: ")
StreamUtils::WriteLine(runverstr)

var os as OperatingSystem = Environment::get_OSVersion()
var osverstr as string = os::ToString()

StreamUtils::Write("OS: ")
StreamUtils::WriteLine(osverstr)

goto ext
end if

comp = String::Compare(curarg, "-h")
if comp = 0 then
StreamUtils::WriteLine("")
StreamUtils::WriteLine("Usage: dylandotnet [options] <file-name>")
StreamUtils::WriteLine("Options:")
StreamUtils::WriteLine("   -V : View Version Nrs. for all dylan.NET assemblies")
StreamUtils::WriteLine("   -h : View this help message")
goto ext
end if

p = args[i]

place fin

if i >= len then
goto cont
else
goto loop
end if

place cont

var lx as Lexer = new Lexer()
StreamUtils::Write("Now Lexing: ")
StreamUtils::Write(p)
var pstmts as StmtSet = lx::Analyze(p)
StreamUtils::WriteLine("...Done.")
var ps as Parser = new Parser()
StreamUtils::Write("Now Parsing: ")
StreamUtils::Write(p)
var ppstmts as StmtSet = ps::Parse(pstmts)
StreamUtils::WriteLine("...Done.")
var cg as CodeGenerator = new CodeGenerator()
cg::EmitMSIL(ppstmts, p)

//var dect as System.Type = gettype decimal
//var ops as MethodInfo[] = Loader::LoadSpecMtds(dect)
//var addo as MethodInfo = Loader::LoadBinOp(dect, "op_Addition", dect, dect)
//var typs as System.Type[] = newarr System.Type 2
//typs[0] = gettype string
//typs[1] = gettype string
//var t1 as System.Type = Loader::LoadClass("Type1\NestedType2")
//var t1s as string = t1::ToString()
//Console::WriteLine(t1s)
//var m1 as MethodInfo = Loader::LoadMethod(t1,"Concat",typs)
//var m1s as string = m1::ToString()
//Console::WriteLine(m1s)
//if m1 <> null then
//var t4 as System.Type = Loader::MemberTyp
//var t4s as string = t4::ToString()
//Console::WriteLine(t4s)
//end if
//var f1 as FieldInfo = Loader::LoadField(t1,"Literal")
//var f1s as string = f1::ToString()
//Console::WriteLine(f1s)
//if Loader::FldLitFlag = true then
//var t2 as System.Type = Loader::FldLitTyp
//var t2s as string = t2::ToString()
//Console::WriteLine(t2s)
//Console::WriteLine($string$Loader::FldLitVal)
//if Loader::EnumLitFlag = true then
//var t3 as System.Type = Loader::EnumLitTyp
//var t3s as string = t3::ToString()
//Console::WriteLine(t3s)
//end if
//end if

//var tt4 as TypeTok = new TypeTok("MethodInfo")
//var t4 as System.Type = Helpers::CommitEvalTTok(tt4)
//var t4s as string = t4::ToString()
//Console::WriteLine(t4s)
//var tt5 as GenericTypeTok = new GenericTypeTok("IEnumerable")
//var tt6 as TypeTok = new TypeTok("XElement")
//var ttarr as TypeTok[] = newarr TypeTok 1
//ttarr[0] = tt6
//tt5::Params = ttarr
//var t5 as System.Type = Helpers::CommitEvalTTok(tt5)
//var t5s as string = t5::ToString()
//Console::WriteLine(t5s)
//var tt7 as GenericTypeTok = new GenericTypeTok("IList")
//ttarr[0] = tt6
//tt7::Params = ttarr
//var t7 as System.Type = Helpers::CommitEvalTTok(tt7)
//var t7s as string = t5::ToString()
//ttarr = newarr TypeTok 2
//ttarr[0] = new TypeTok("String")
//ttarr[1] = new TypeTok("String")
//var tt8 as GenericTypeTok = new GenericTypeTok("IDictionary")
//tt8::Params = ttarr
//var t8 as System.Type = Helpers::CommitEvalTTok(tt8)
//var t8s as string = t8::ToString()
//Console::WriteLine(t8s)

//catch ex as Exception

//var exstr as string = ex::ToString()
//StreamUtils::WriteLine(exstr)
//Console::ReadKey()

//end try

end if

place ext

//StreamUtils::CloseOutS()

end method

end class
