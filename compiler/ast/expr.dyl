//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Expr

field public Token[] Tokens
field public integer Line
field public System.Type ResultTyp

method public void ctor0()
me::ctor()
Tokens = newarr Token 0
Line = 0
ResultTyp = null
end method

method public void AddToken(var toktoadd as Token)

var len as integer = Tokens[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as Token[] = newarr Token destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = Tokens[i]

end if

if i = stopel then
goto cont
else
if stopel <> -1 then
goto loop
else
goto cont
end if
end if

place cont

if len = 0 then
Line = toktoadd::Line
end if

destarr[len] = toktoadd

Tokens = destarr

end method

method public void RemToken(var ind as integer)

var len as integer = Tokens[l]
var destl as integer = len - 1
var stopel as integer = destl
var i as integer = -1
var j as integer = -1

var destarr as Token[] = newarr Token destl

label loop
label cont

place loop

i++

if len > 0 then

if i <> ind then
j++
destarr[j] = Tokens[i]
end if

end if

if i = stopel then
goto cont
else
if stopel <> -1 then
goto loop
else
goto cont
end if
end if

place cont

Tokens = destarr

end method


end class
