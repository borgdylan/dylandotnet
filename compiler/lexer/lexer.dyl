//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Lexer

method public StmtSet Analyze(var path as string)

var stmts as StmtSet = new StmtSet()
var curstmt as Stmt = null
var curln as Line = null
//var fs as string = File::ReadAllText(path)
var sr as StreamReader = new StreamReader(path)
var crflag as boolean = false
var lfflag as boolean = false
var andflg as boolean = false
var orflg as boolean = false
var buf as string = ""
var curline as integer = 0
var curstmtlen as integer = -1

//var len as integer = fs::get_Length()
var n as integer = 0
//var i as integer = -1
var ch as string = ""
var chr as char = 'a'
var comp as integer = 0

//len--

label loop
label cont

n = sr::Peek()

if n < 0 then
goto cont
end if

place loop

n = sr::Read()

chr = $char$n
ch = $string$chr
comp = String::Compare(ch, Utils.Constants::cr)

if comp = 0 then
crflag = true
end if

comp = String::Compare(ch, Utils.Constants::lf)

if comp = 0 then
lfflag = true
end if

andflg = crflag and lfflag
orflg = crflag or lfflag

if orflg = false then
buf = String::Concat(buf, ch)
else
if lfflag = true then
curline++
//Console::WriteLine(buf)
curstmt = new Stmt()
curstmt::Line = curline
curln = new Line()
curstmt = curln::Analyze(curstmt, buf)
curstmtlen = curstmt::Tokens[l]

if curstmtlen <> 0 then
stmts::AddStmt(curstmt)
end if

buf = ""
crflag = false
lfflag = false
end if
end if

n = sr::Peek()

if n = -1 then
curline++
//Console::WriteLine(buf)
curstmt = new Stmt()
curstmt::Line = curline
curln = new Line()
curstmt = curln::Analyze(curstmt, buf)
curstmtlen = curstmt::Tokens[l]

if curstmtlen <> 0 then
stmts::AddStmt(curstmt)
end if

goto cont
else
goto loop
end if

place cont

sr::Close()

return stmts
end method

end class
