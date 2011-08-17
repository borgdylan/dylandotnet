//    dnc.exe dylan.NET.Compiler Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Module1

method public static void main(var args as string[])

Console::WriteLine("dylan.NET Compiler v. 11.2.7.4 Alpha for Microsoft (R) .NET Framework (R) v. 3.5 SP1")
Console::WriteLine("                           and Xamarin Mono v. 2.6.7/v. 2.10.x")
Console::WriteLine("This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
Console::WriteLine("Copyright (C) 2011 Dylan Borg")
if args[l] < 1 then
Console::WriteLine("Usage: dylandotnet <file-name>")
else

//try

var p as string = args[0]
var lx as Lexer = new Lexer()
Console::Write("Now Lexing: ")
Console::Write(p)
var pstmts as StmtSet = lx::Analyze(p)
Console::WriteLine("...Done.")
var ps as Parser = new Parser()
Console::Write("Now Parsing: ")
Console::Write(p)
var ppstmts as StmtSet = ps::Parse(pstmts)
Console::WriteLine("...Done.")
var cg as CodeGenerator = new CodeGenerator()
cg::EmitMSIL(ppstmts, p)

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
//Console::WriteLine(exstr)
//Console::ReadKey()

//end try

end if

end method

end class
