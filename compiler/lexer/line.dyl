//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 


class public auto ansi Line

field public string PrevChar
field public boolean InStr
field public boolean InChar

method public void ctor0()
me::ctor()
PrevChar = ""
InStr = false
InChar = false
end method

method public boolean isSep(var cc as string, var lc as string, var sca as boolean&, var scla as boolean&)

var comp as integer = 0
var orflg as boolean = false
var ob as boolean = false
var tc as char = 'a'
var tb as boolean = false
if lc = null then
lc = " "
end if

label fin

comp = String::Compare(cc, Utils.Constants::quot)
if comp = 0 then
InStr = InStr nand InStr
if InStr = false then
InChar = false
end if
end if

comp = String::Compare(cc, "'")
if comp = 0 then
InChar = InChar nand InChar
end if

orflg = InStr or InChar

if orflg = false then

//----------------------------------
comp = String::Compare(cc, ":")
if comp = 0 then
comp = String::Compare(PrevChar, Utils.Constants::quot)
if comp = 0 then
if orflg = false then
ob = true
valinref|scla = false
valinref|sca = true
goto fin
end if
end if
end if
//----------------------------------


comp = String::Compare(cc, "(")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, ")")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "[")

if comp = 0 then
comp = String::Compare(lc, "]")
if comp = 0 then
valinref|sca = true
valinref|scla = false
ob = true
goto fin
else
valinref|sca = true
ob = true
end if
goto fin
end if

comp = String::Compare(cc, "]")

if comp = 0 then
comp = String::Compare(PrevChar, "[")
if comp = 0 then
ob = false
valinref|sca = true
else
valinref|sca = true
ob = true
end if
goto fin
end if

comp = String::Compare(cc, ",")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "&")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "*")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "/")

if comp = 0 then
comp = String::Compare(lc, "/")
if comp <> 0 then
valinref|sca = true
comp = String::Compare(PrevChar, "/")
if comp = 0 then
ob = false
else
ob = true
end if
goto fin
else
comp = String::Compare(PrevChar, "/")
if comp = 0 then
ob = false
goto fin
else
valinref|sca = true
valinref|scla = false
ob = true
goto fin
end if
end if
end if

comp = String::Compare(cc, "|")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "$")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "&")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "~")

if comp = 0 then
valinref|sca = true
ob = true
goto fin
end if

comp = String::Compare(cc, "=")

if comp = 0 then
comp = String::Compare(lc, "=")
if comp <> 0 then
valinref|sca = true
comp = String::Compare(PrevChar, ">")
if comp = 0 then
ob = false
else
comp = String::Compare(PrevChar, "<")
if comp = 0 then
ob = false
else
comp = String::Compare(PrevChar, "!")
if comp = 0 then
ob = false
else
comp = String::Compare(PrevChar, "=")
if comp = 0 then
ob = false
else
ob = true
end if
end if
end if
end if
goto fin
else
valinref|sca = true
valinref|scla = false
ob = true
goto fin
end if
end if

comp = String::Compare(cc, "!")

if comp = 0 then
comp = String::Compare(lc, "=")
if comp <> 0 then
valinref|sca = true
ob = true
goto fin
else
valinref|sca = true
valinref|scla = false
ob = true
goto fin
end if
end if

comp = String::Compare(cc, "<")

if comp = 0 then
comp = String::Compare(lc, "=")
if comp = 0 then
valinref|sca = true
valinref|scla = false
ob = true
goto fin
else
comp = String::Compare(PrevChar, "<")
if comp = 0 then
ob = false
else
comp = String::Compare(lc, "<")
if comp = 0 then
valinref|sca = true
valinref|scla = false
ob = true
goto fin
else
comp = String::Compare(lc, ">")
if comp = 0 then
valinref|sca = true
valinref|scla = false
ob = true
goto fin
else
valinref|sca = true
ob = true
goto fin
end if
end if
end if
end if
end if

comp = String::Compare(cc, ">")

if comp = 0 then
comp = String::Compare(lc, "=")
if comp <> 0 then
valinref|sca = true
comp = String::Compare(PrevChar, "<")
if comp = 0 then
ob = false
else
comp = String::Compare(PrevChar, ">")
if comp = 0 then
ob = false
else
comp = String::Compare(lc, ">")
if comp = 0 then
valinref|sca = true
valinref|scla = false
ob = true
goto fin
else
ob = true
end if
end if
end if
goto fin
else
valinref|sca = true
valinref|scla = false
ob = true
goto fin
end if
end if

comp = String::Compare(cc, "-")

if comp = 0 then
comp = String::Compare(lc, "-")
if comp <> 0 then
valinref|sca = true
comp = String::Compare(PrevChar, "-")
if comp = 0 then
ob = false
else
ob = true
end if
tc = $char$lc
tb = Char::IsDigit(tc)
if tb = true then
valinref|scla = false
end if
goto fin
else
valinref|sca = true
valinref|scla = false
ob = true
goto fin
end if
end if

comp = String::Compare(cc, "+")

if comp = 0 then
comp = String::Compare(lc, "+")
if comp <> 0 then
valinref|sca = true
comp = String::Compare(PrevChar, "+")
if comp = 0 then
ob = false
else
ob = true
end if
tc = $char$lc
tb = Char::IsDigit(tc)
if tb = true then
valinref|scla = false
end if
goto fin
else
valinref|sca = true
valinref|scla = false
ob = true
goto fin
end if
end if

var tabchr as char = $char$9
comp = String::Compare(cc, $string$tabchr)

if comp = 0 then
valinref|sca = false
ob = true
goto fin
else
valinref|sca = false
ob = false
end if

var spchr as char = $char$32
comp = String::Compare(cc, $string$spchr)

if comp = 0 then
valinref|sca = false
ob = true
goto fin
else
valinref|sca = false
ob = false
end if

else
valinref|sca = false
ob = false
end if

place fin

PrevChar = cc
return ob

end method

method public Stmt Analyze(var stm as Stmt, var str as string)

var curchar as string = ""
var lachar as string = ""
var curtok as Token = null
var len as integer = str::get_Length()
var comp as integer = 0
len--

var buf as string = ""
var cuttok as boolean = false
var sc as boolean = false
var scl as boolean = false
var i as integer = -1
var j as integer = 0
label loop
label cont

if len = -1 then
goto cont
end if

place loop

i++
j = i + 1
cuttok = false

if scl = false then
sc = false
end if

if sc = true then
comp = String::Compare(buf, "")
if comp <> 0 then
curtok = new Token()
curtok::Value = buf
curtok::Line = stm::Line
stm::AddToken(curtok)
end if
buf = ""
end if

sc = false
scl = true

curchar = $string$str::get_Chars(i)

if i < len then
lachar = $string$str::get_Chars(j)
else
lachar = null
end if

cuttok = isSep(curchar, lachar, ref|sc, ref|scl)

if cuttok = true then
comp = String::Compare(buf, "")
if comp <> 0 then
curtok = new Token()
curtok::Value = buf
curtok::Line = stm::Line
stm::AddToken(curtok)
end if
buf = ""
if sc = true then
buf = String::Concat(buf, curchar)
end if
else
buf = String::Concat(buf, curchar)
end if

if i = len then
goto cont
else
goto loop
end if

place cont

comp = String::Compare(buf, "")
if comp <> 0 then
curtok = new Token()
curtok::Value = buf
curtok::Line = stm::Line
stm::AddToken(curtok)
end if
buf = ""

return stm

end method

end class
