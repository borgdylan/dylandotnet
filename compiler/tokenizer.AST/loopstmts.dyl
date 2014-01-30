//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi DoWhileStmt extends Stmt

	field public Expr Exp

	method public void DoWhileStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi DoUntilStmt extends Stmt

	field public Expr Exp

	method public void DoUntilStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi ForeachStmt extends Stmt

	field public Expr Exp
	field public Ident Iter
	field public TypeTok Typ

	method public void ForeachStmt()
		me::ctor()
		Exp = new Expr()
		Iter = new Ident()
		Typ = null
	end method

end class

class public auto ansi ForStmt extends Stmt

	field public Expr StartExp
	field public Expr EndExp
	field public Expr StepExp
	field public Ident Iter
	field public TypeTok Typ
	field public boolean Direction

	method public void ForStmt()
		me::ctor()
		StartExp = new Expr()
		EndExp = new Expr()
		Iter = null
		Typ = null
		StepExp = null
		Direction = true
	end method

end class

class public auto ansi WhileStmt extends Stmt

	field public Expr Exp

	method public void WhileStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi UntilStmt extends Stmt

	field public Expr Exp

	method public void UntilStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi DoStmt extends Stmt
end class

class public auto ansi BreakStmt extends Stmt
end class

class public auto ansi ContinueStmt extends Stmt
end class

class public auto ansi EndDoStmt extends Stmt
end class
