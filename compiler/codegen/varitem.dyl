//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi VarItem

field public string Name
// t for loc f for arg
field public boolean LocArg
field public integer Index
field public System.Type VarTyp

method public void ctor0()
me::ctor()
Name = ""
LocArg = false
Index = -1
VarTyp = null
end method

method public void ctor1(var nme as string, var la as boolean, var ind as integer, var typ as System.Type)
me::ctor()
Name = nme
LocArg = la
Index = ind
VarTyp = typ
end method

end class