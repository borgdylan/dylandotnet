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

enum public integer ContextType
	None = 0
	Assembly = 1
	Class = 2
	Interface = 3
	Enum = 4
	Property = 5
	Event = 6
	Method = 7
	AbstractProperty = 8
	AbstractEvent = 9
end enum

interface public IStmtContainer

	method public void AddStmt(var stmttoadd as Stmt)
	property public autogen ContextType Context
	property public autogen IStmtContainer Parent
	method public boolean IsOneLiner(var ctx as IStmtContainer) 

end interface

class public abstract IgnorableStmt extends Stmt
end class

class public BlockStmt extends Stmt implements IStmtContainer

	field public C5.ArrayList<of Stmt> Stmts
	field family ContextType _Context
	field family IStmtContainer _Parent

	method public void BlockStmt(var ctx as ContextType)
		mybase::ctor()
		Stmts = new C5.ArrayList<of Stmt>()
		_Context = ctx
	end method

	method public void BlockStmt()
		ctor(ContextType::None)
	end method

	method public override newslot void AddStmt(var stmttoadd as Stmt)
		Stmts::Add(stmttoadd)

		var sc = stmttoadd as IStmtContainer 
		if sc != null then
			sc::set_Parent(me)
		end if
	end method

	property public override newslot autogen IStmtContainer Parent
	property public override newslot autogen ContextType Context

	method public override newslot boolean IsOneLiner(var ctx as IStmtContainer)
		return false
	end method

end class

class public BranchStmt extends BlockStmt
end class

interface public IBranchContainer implements IStmtContainer

	method public void AddBranch(var stmttoadd as BranchStmt)

end interface

class public EndStmt extends Stmt
end class

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

		var sc = stmttoadd as IStmtContainer 
		if sc != null then
			sc::set_Parent(me)
		end if
	end method

	property public override newslot ContextType Context
		get
			return ContextType::Assembly
		end get
		set
		end set
	end property

	property public override newslot IStmtContainer Parent
		set
		end set
		get
			return null
		end get
	end property

	method public override newslot boolean IsOneLiner(var ctx as IStmtContainer)
		return false
	end method

end class
