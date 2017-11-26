//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs

#region "normal variants"

	class public ElseIfStmt extends BranchStmt

		field public Expr Exp

		method public void ElseIfStmt()
			mybase::ctor()
			Exp = new Expr()
		end method

	end class

	class public ElseStmt extends BranchStmt
	end class

	class public EndIfStmt extends EndStmt
	end class

	class public IfStmt extends BlockStmt implements IBranchContainer

		field public Expr Exp
		field public C5.ArrayList<of BranchStmt> Branches

		method public void IfStmt()
			mybase::ctor()
			Exp = new Expr()
			Branches = new C5.ArrayList<of BranchStmt>()
		end method

		property public virtual IStmtContainer CurrentContainer => #ternary{ Branches::get_Count() == 0 ?  me, Branches::get_Last() }

		method public virtual boolean AddBranch(var stmttoadd as BranchStmt)
			if stmttoadd is ElseIfStmt orelse stmttoadd is ElseStmt then
				var res = get_CurrentContainer() isnot ElseStmt
				Branches::Add(stmttoadd)
				stmttoadd::set_Parent(me)
				return res
			else
				return false
			end if
		end method

		property public virtual BranchStmt[] BranchChildren => Branches::ToArray()

		method public override boolean ValidateEnding(var stm as Stmt) => stm is EndIfStmt
		method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

	end class

end #region

#region "conditional compilation variants"
	interface public IHCondCompStmt
	end interface

	class public HElseIfStmt extends BranchStmt implements IHCondCompStmt

		field public Expr Exp

		method public void HElseIfStmt()
			mybase::ctor()
			Exp = new Expr()
		end method

	end class

	class public HElseStmt extends BranchStmt implements IHCondCompStmt
	end class

	class public EndHIfStmt extends EndStmt implements IHCondCompStmt
	end class

	class public HIfStmt extends BlockStmt implements IHCondCompStmt, IBranchContainer

		field public Expr Exp
		field public C5.ArrayList<of BranchStmt> Branches

		method public void HIfStmt()
			mybase::ctor()
			Exp = new Expr()
			Branches = new C5.ArrayList<of BranchStmt>()
		end method

		property public virtual IStmtContainer CurrentContainer => #ternary{ Branches::get_Count() == 0 ? me, Branches::get_Last()}

		method public virtual boolean AddBranch(var stmttoadd as BranchStmt)
			if stmttoadd is HElseIfStmt orelse stmttoadd is HElseStmt then
				var res =  get_CurrentContainer() isnot HElseStmt
				Branches::Add(stmttoadd)
				stmttoadd::set_Parent(me)
				return res
			else
				return false
			end if
		end method

		property public virtual BranchStmt[] BranchChildren => Branches::ToArray()

		method public override boolean ValidateEnding(var stm as Stmt) => stm is EndHIfStmt
		method public override boolean ValidateContext(var ctx as ContextType) => true

	end class

	class public HDefineStmt extends Stmt

		field public Ident Symbol

		method public void HDefineStmt()
			mybase::ctor()
			Symbol = new Ident()
		end method

		method public override boolean ValidateContext(var ctx as ContextType) => true

	end class

	class public HUndefStmt extends Stmt

		field public Ident Symbol

		method public void HUndefStmt()
			mybase::ctor()
			Symbol = new Ident()
		end method

		method public override boolean ValidateContext(var ctx as ContextType) => true

	end class
end #region

class public EndRegionStmt extends EndStmt
end class

class public RegionStmt extends BlockStmt

	field public Token Name

	method public void RegionStmt()
		mybase::ctor()
		Name = new Token()
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndRegionStmt
	method public override boolean ValidateContext(var ctx as ContextType) => true

end class

#region "switch statements"

	class public StateStmt extends BranchStmt

		method public void StateStmt()
			mybase::ctor()
		end method

	end class

	class public DefaultStmt extends BranchStmt
	end class

	class public EndSwitchStmt extends EndStmt
	end class

	class public SwitchStmt extends BlockStmt implements IBranchContainer

		field public Expr Exp
		field public C5.ArrayList<of BranchStmt> Branches
		field public boolean HasDefault


		method public void SwitchStmt()
			mybase::ctor()
			Exp = new Expr()
			Branches = new C5.ArrayList<of BranchStmt>()
		end method

		property public virtual IStmtContainer CurrentContainer => #ternary{ Branches::get_Count() == 0 ?  me, Branches::get_Last() }

		method public virtual boolean AddBranch(var stmttoadd as BranchStmt)
			if stmttoadd is StateStmt orelse stmttoadd is DefaultStmt then

				if stmttoadd is DefaultStmt then
					HasDefault = true
				end if

				var res = get_CurrentContainer() isnot DefaultStmt
				Branches::Add(stmttoadd)
				stmttoadd::set_Parent(me)
				return res
			else
				return false
			end if
		end method

		method public override boolean AddStmt(var stmttoadd as Stmt)
			return false
		end method

		property public virtual BranchStmt[] BranchChildren => Branches::ToArray()

		method public override boolean ValidateEnding(var stm as Stmt) => stm is EndSwitchStmt
		method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

	end class

end #region