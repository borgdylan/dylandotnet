//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

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
	Loop = 10
end enum

class public Stmt
	//field defined in partial class inside expr.dyl

	method public void Stmt()
		mybase::ctor()
		Tokens = new C5.ArrayList<of Token>(5, C5.MemoryType::Normal)
	end method

	method public void PosFromStmt(var stm as Stmt)
		Line = stm::Line
		EndLine = stm::EndLine
		Column = stm::Column
		EndColumn = stm::EndColumn
	end method

	method public void AddToken(var toktoadd as Token)
		if Tokens::get_Count() == 0 then
			Line = toktoadd::Line
			Column = toktoadd::Column
		end if
		Tokens::Add(toktoadd)
		EndLine = toktoadd::EndLine
		EndColumn = toktoadd::EndColumn
	end method
	
	method public void RemToken(var ind as integer)
		Tokens::RemoveAt(ind)
	end method

	method public virtual boolean ValidateContext(var ctx as ContextType) => false

end class

class public abstract EndStmt extends Stmt
end class

interface public IStmtContainer

	method public boolean AddStmt(var stmttoadd as Stmt)
	property public autogen ContextType Context
	property public autogen IStmtContainer Parent
	property public autogen initonly Stmt[] Children
	property public autogen string FilePath	
	method public boolean IsOneLiner(var ctx as IStmtContainer)
	method public boolean ValidateEnding(var stm as Stmt)

end interface

//class public abstract IgnorableStmt extends Stmt
//end class

class public abstract BlockStmt extends Stmt implements IStmtContainer

	field public C5.ArrayList<of Stmt> Stmts
	field family ContextType _Context
	field family IStmtContainer _Parent

	method family void BlockStmt(var ctx as ContextType)
		mybase::ctor()
		Stmts = new C5.ArrayList<of Stmt>()
		_Context = ctx
	end method

	method family void BlockStmt()
		ctor(ContextType::None)
	end method

	method public virtual boolean AddStmt(var stmttoadd as Stmt)
		Stmts::Add(stmttoadd)

		var sc = stmttoadd as IStmtContainer 
		if sc isnot null then
			sc::set_Parent(me)
		end if
		return true
	end method

	property public virtual autogen IStmtContainer Parent
	property public virtual autogen ContextType Context
	property public virtual Stmt[] Children => Stmts::ToArray()
	property public virtual autogen string FilePath

	method public virtual boolean IsOneLiner(var ctx as IStmtContainer) => false
	method public virtual boolean ValidateEnding(var stm as Stmt) => false

end class

class public abstract BranchStmt extends BlockStmt
end class

interface public IBranchContainer implements IStmtContainer

	method public boolean AddBranch(var stmttoadd as BranchStmt)
	property public autogen initonly IStmtContainer CurrentContainer
	property public autogen initonly BranchStmt[] BranchChildren

end interface

class public StmtSet implements IStmtContainer

	field public C5.ArrayList<of Stmt> Stmts
	field public string Path

	property public virtual autogen ContextType Context

	method public void StmtSet(var p as string)
		mybase::ctor()
		Stmts = new C5.ArrayList<of Stmt>()
		Path = p
		_Context = ContextType::Assembly
	end method

	method public void StmtSet()
		ctor(string::Empty)
	end method


	method public virtual boolean AddStmt(var stmttoadd as Stmt)
		Stmts::Add(stmttoadd)

		var sc = stmttoadd as IStmtContainer 
		if sc isnot null then
			sc::set_Parent(me)
		end if
		return true
	end method

	property public virtual IStmtContainer Parent
		get
			return null
		end get
		set
		end set
	end property

	property public virtual string FilePath
		get
			return Path
		end get
		set
			Path = value
		end set
	end property

	property public virtual Stmt[] Children => Stmts::ToArray()
	
	method public virtual boolean IsOneLiner(var ctx as IStmtContainer) => false
	method public virtual boolean ValidateEnding(var stm as Stmt) => false

end class