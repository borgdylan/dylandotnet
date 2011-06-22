//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi AssignStmt extends Stmt

field public Expr LExp
field public Expr RExp

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
LExp = new Expr()
RExp = new Expr()
end method

end class

class public auto ansi IncStmt extends Stmt

field public Ident NumVar

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
NumVar = new Ident()
end method

end class

class public auto ansi DecStmt extends Stmt

field public Ident NumVar

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
NumVar = new Ident()
end method

end class

class public auto ansi ReturnStmt extends Stmt

field public Expr RExp

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
RExp = new Expr()
end method

end class

class public auto ansi MethodCallStmt extends Stmt

field public MethodCallTok MethodToken

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
MethodToken = new MethodCallTok()
end method

end class

class public auto ansi EndMethodStmt extends Stmt

end class

class public auto ansi EndIfStmt extends Stmt

end class

class public auto ansi EndEnumStmt extends Stmt

end class

class public auto ansi EndClassStmt extends Stmt

end class

class public auto ansi EndNSStmt extends Stmt

end class

class public auto ansi EndXmlDocStmt extends Stmt

end class

class public auto ansi EndTryStmt extends Stmt

end class

class public auto ansi EndPropStmt extends Stmt

end class

class public auto ansi CommentStmt extends Stmt

end class
