//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

class public sealed EndDoStmt extends EndStmt
end class

class public sealed DoWhileStmt extends BlockStmt

	field public Expr Exp

	method public void DoWhileStmt()
		mybase::ctor(ContextType::Loop)
		Exp = new Expr()
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndDoStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed DoUntilStmt extends BlockStmt

	field public Expr Exp

	method public void DoUntilStmt()
		mybase::ctor(ContextType::Loop)
		Exp = new Expr()
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndDoStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed ForeachStmt extends BlockStmt

	field public Expr Exp
	field public Ident Iter
	field public TypeTok Typ

	method public void ForeachStmt()
		mybase::ctor(ContextType::Loop)
		Exp = new Expr()
		Iter = new Ident()
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndDoStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed ForStmt extends BlockStmt

	field public Expr StartExp
	field public Expr EndExp
	field public Expr StepExp
	field public Ident Iter
	field public TypeTok Typ
	field public boolean Direction

	method public void ForStmt()
		mybase::ctor(ContextType::Loop)
		StartExp = new Expr()
		EndExp = new Expr()
		Direction = true
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndDoStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed WhileStmt extends EndStmt

	field public Expr Exp

	method public void WhileStmt()
		mybase::ctor()
		Exp = new Expr()
	end method

end class

class public sealed UntilStmt extends EndStmt

	field public Expr Exp

	method public void UntilStmt()
		mybase::ctor()
		Exp = new Expr()
	end method

end class

class public sealed DoStmt extends BlockStmt

	method public void DoStmt()
		mybase::ctor(ContextType::Loop)
	end method

	method public override boolean ValidateEnding(var stm as Stmt) =>  stm is UntilStmt orelse stm is WhileStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed BreakStmt extends Stmt

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Loop

end class

class public sealed ContinueStmt extends Stmt

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Loop

end class