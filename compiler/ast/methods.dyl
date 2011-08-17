//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi MethodNameTok extends Ident

end class

class public auto ansi MethodCallTok extends Token

field public MethodNameTok Name
field public Expr[] Params
field public boolean PopFlg

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
Name = new MethodNameTok()
PopFlg = false
Params = newarr Expr 0
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
Name = new MethodNameTok()
PopFlg = false
Params = newarr Expr 0
end method

method public void AddParam(var paramtoadd as Expr)

var len as integer = Params[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as Expr[] = newarr Expr destl

label loop
label cont

place loop

i = i + 1

if len > 0 then

destarr[i] = Params[i]

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
me::Line = paramtoadd::Line
end if

destarr[len] = paramtoadd

Params = destarr

end method


end class
