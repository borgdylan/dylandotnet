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

class public CatchStmt extends BranchStmt

	field public Ident ExName
	field public TypeTok ExTyp
	field public Expr FilterExp

	method public void CatchStmt()
		mybase::ctor()
		ExName = new Ident()
		ExTyp = new TypeTok()
	end method

	method public override string ToString() => i"catch {ExName::Value} as {ExTyp::ToString()}"

end class

class public FinallyStmt extends BranchStmt
	method public override string ToString() => "finally"
end class

class public EndTryStmt extends EndStmt
	method public override string ToString() => "end try"
end class

class public TryStmt extends BlockStmt implements IBranchContainer

	field public C5.ArrayList<of BranchStmt> Branches

	method public void TryStmt()
		mybase::ctor()
		Branches = new C5.ArrayList<of BranchStmt>()
	end method

	property public virtual IStmtContainer CurrentContainer
		get
			if Branches::get_Count() == 0 then
				return me
			else
				return Branches::get_Last()
			end if
		end get
	end property

	method public virtual boolean AddBranch(var stmttoadd as BranchStmt)
		if stmttoadd is CatchStmt orelse stmttoadd is FinallyStmt then
			var res = get_CurrentContainer() isnot FinallyStmt
			Branches::Add(stmttoadd)
			stmttoadd::set_Parent(me)
			return res
		else
			return false
		end if
	end method

	property public virtual BranchStmt[] BranchChildren => Branches::ToArray()

	method public override string ToString() => "try"
	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndTryStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public ThrowStmt extends Stmt

	field public Expr RExp

	method public void ThrowStmt()
		mybase::ctor()
		RExp = new Expr()
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class
