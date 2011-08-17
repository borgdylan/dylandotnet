//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
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

label loop
label cont

place loop

i++

stm = stmts::Stmts[i]
typ = gettype IncludeStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
else

var sr as StmtReader = new StmtReader()
sr::Read(stm, fpath)

end if

if i = len then

Console::Write("Writing Assembly to Disk")
var ab as AssemblyBuilder = AsmFactory::AsmB
ab::DefineVersionInfoResource()
ab::Save(AsmFactory::AsmFile)
COnsole::WriteLine("...Done.")

goto cont
else
goto loop
end if

place cont

end method

end class
