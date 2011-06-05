//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 


// #debug Opt
class public auto ansi DebugStmt extends Stmt

field public SwitchTok Opt
field public boolean Flg

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
Opt = new SwitchTok()
Flg = false
end method

method public void setFlg()

label fin

var typ as System.Type
var b as boolean = false

typ = gettype OnTok
b = typ::IsInstanceOfType($object$Opt)

if b = true then
Flg = true
goto fin
end if

typ = gettype OffTok
b = typ::IsInstanceOfType($object$Opt)

if b = true then
Flg = false
goto fin
end if


place fin

end method

end class
