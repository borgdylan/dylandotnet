//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi IfStmt extends Stmt

field public Expr Exp

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
Exp = new Expr()
end method

end class

class public auto ansi ElseIfStmt extends Stmt

field public Expr Exp

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
Exp = new Expr()
end method

end class

class public auto ansi ElseStmt extends Stmt

end class

class public auto ansi EndIfStmt extends Stmt

end class