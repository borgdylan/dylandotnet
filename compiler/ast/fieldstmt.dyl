//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi FieldStmt extends Stmt

field public Attribute[] Attrs
field public Ident FieldName
field public TypeTok FieldTyp

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
Attrs = newarr Attribute 0
FieldName = new Ident()
FieldTyp = new TypeTok()
end method

method public void AddAttr(var attrtoadd as Attribute)

var len as integer = Attrs[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as Attribute[] = newarr Attribute destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = Attrs[i]

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

destarr[len] = attrtoadd

Attrs = destarr

end method

end class
