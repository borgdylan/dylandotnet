//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public Stmt

	field public C5.ArrayList<of Token> Tokens
	field public integer Line

	method public void Stmt()
		mybase::ctor()
		Tokens = new C5.ArrayList<of Token>(5)
		//Line = 0
	end method

	method public void AddToken(var toktoadd as Token)
		Tokens::Add(toktoadd)
	end method
	
	method public void RemToken(var ind as integer)
		Tokens::RemoveAt(ind)
	end method

end class

interface public IStmtContainer

	method public void AddStmt(var stmttoadd as Stmt)

end interface

class public abstract IgnorableStmt extends Stmt
end class

class public BlockStmt extends Stmt implements IStmtContainer

	field public C5.ArrayList<of Stmt> Stmts

	method public void BlockStmt()
		mybase::ctor()
		Stmts = new C5.ArrayList<of Stmt>()
	end method

	method public override newslot void AddStmt(var stmttoadd as Stmt)
		Stmts::Add(stmttoadd)
	end method

end class

class public BranchStmt extends BlockStmt
end class

interface public IBranchContainer

	method public void AddBranch(var stmttoadd as BranchStmt)

end interface

class public StmtSet implements IStmtContainer

	field public C5.ArrayList<of Stmt> Stmts
	field public string Path

	method public void StmtSet()
		mybase::ctor()
		Stmts = new C5.ArrayList<of Stmt>()
		Path = string::Empty
	end method
	
	method public void StmtSet(var p as string)
		mybase::ctor()
		Stmts = new C5.ArrayList<of Stmt>()
		Path = p
	end method

	method public override newslot void AddStmt(var stmttoadd as Stmt)
		Stmts::Add(stmttoadd)
	end method

end class
