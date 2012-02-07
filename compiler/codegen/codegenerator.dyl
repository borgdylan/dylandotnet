//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi CodeGenerator

method public void EmitMSIL(var stmts as StmtSet, var fpath as string)

var i as integer = -1
var len as integer = stmts::Stmts[l] - 1
var stm as Stmt = null
var typ as System.Type
var b as boolean
var tmpstr as string = ""

ILEmitter::CurSrcFile = fpath
ILEmitter::AddSrcFile(fpath)

if ILEmitter::DocWriters[l] > 0 then
var mdlbldbg as ModuleBuilder = AsmFactory::MdlB
fpath = Path::GetFullPath(fpath)
var docw as ISymbolDocumentWriter = mdlbldbg::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
ILEmitter::DocWriter = docw
ILEmitter::AddDocWriter(docw)
end if

label loop
label cont

place loop

i++

stm = stmts::Stmts[i]
typ = gettype IncludeStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then

var inclustm as IncludeStmt = stm
var p as Token = inclustm::Path

tmpstr = String::Concat("^",Utils.Constants::quot,"(.)*",Utils.Constants::quot)
tmpstr = String::Concat(tmpstr, "$")
var compb as boolean = Utils.ParseUtils::LikeOP(p::Value, tmpstr)

if compb = true then
tmpstr = p::Value
var tmpchrarr as char[] = newarr char 1
tmpchrarr[0] = $char$Utils.Constants::quot
tmpstr = tmpstr::Trim(tmpchrarr)
p::Value = tmpstr
end if

p::Value = ParseUtils::ProcessMSYSPath(p::Value)
var lx as Lexer = new Lexer()
StreamUtils::Write("Now Lexing: ")
StreamUtils::Write(p::Value)
var pstmts as StmtSet = lx::Analyze(p::Value)
StreamUtils::WriteLine("...Done.")
var ps as Parser = new Parser()
StreamUtils::Write("Now Parsing: ")
StreamUtils::Write(p::Value)
var ppstmts as StmtSet = ps::Parse(pstmts)
StreamUtils::WriteLine("...Done.")
EmitMSIL(ppstmts, p::Value)

else

var sr as StmtReader = new StmtReader()
sr::Read(stm, fpath)

end if

if i = len then
goto cont
else
goto loop
end if

place cont

ILEmitter::PopSrcFile()
i = ILEmitter::SrcFiles[l] - 1
if i >= 0 then
ILEmitter::CurSrcFile = ILEmitter::SrcFiles[i]
end if

i = ILEmitter::DocWriters[l] - 1
if i >= 0 then
ILEmitter::PopDocWriter()
i = ILEmitter::DocWriters[l] - 1
if i >= 0 then
ILEmitter::DocWriter = ILEmitter::DocWriters[i]
end if
end if

if ILEmitter::SrcFiles[l] = 0 then

StreamUtils::Write("Writing Assembly to Disk")
var ab as AssemblyBuilder = AsmFactory::AsmB
ab::DefineVersionInfoResource()
ab::Save(AsmFactory::AsmFile)
StreamUtils::WriteLine("...Done.")

end if

end method

end class
