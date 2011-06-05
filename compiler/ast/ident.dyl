//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Ident extends Token

field public boolean IsRef
field public boolean IsValInRef
field public boolean IsRefInst
field public boolean IsValInRefInst
field public boolean Conv
field public TypeTok TTok
field public boolean IsArr
field public Expr ArrLoc
field public boolean DoNeg
field public boolean DoNot
field public string OrdOp
field public boolean MemberAccessFlg
field public Token MemberToAccess

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
IsRef = false
IsValInRef = false
IsRef = false
IsValInRef = false
Conv = false
TTok = new TypeTok()
IsArr = false
ArrLoc = new Expr()
DoNeg = false
DoNot = false
OrdOp = ""
MemberAccessFlg = false
MemberToAccess = new Token()
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
IsRef = false
IsValInRef = false
IsRef = false
IsValInRef = false
Conv = false
TTok = new TypeTok()
IsArr = false
ArrLoc = new Expr()
DoNeg = false
DoNot = false
OrdOp = ""
MemberAccessFlg = false
MemberToAccess = new Token()
end method

end class
