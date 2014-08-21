//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 
#region "normal variants"

	class public IfStmt extends BlockStmt implements IBranchContainer

		field public Expr Exp
		field public C5.ArrayList<of BranchStmt> Branches

		method public void IfStmt()
			mybase::ctor()
			Exp = new Expr()
			Branches = new C5.ArrayList<of BranchStmt>()
		end method

		method public override newslot void AddBranch(var stmttoadd as BranchStmt)
			Branches::Add(stmttoadd)
		end method

	end class

	class public ElseIfStmt extends BranchStmt

		field public Expr Exp

		method public void ElseIfStmt()
			mybase::ctor()
			Exp = new Expr()
		end method

	end class

	class public ElseStmt extends BranchStmt
	end class

	class public EndIfStmt extends Stmt
	end class
end #region

#region "conditional compilation variants"
	interface public IHCondCompStmt
	end interface

	class public HIfStmt extends BlockStmt implements IHCondCompStmt, IBranchContainer

		field public Expr Exp
		field public C5.ArrayList<of BranchStmt> Branches

		method public void HIfStmt()
			mybase::ctor()
			Exp = new Expr()
			Branches = new C5.ArrayList<of BranchStmt>()
		end method

		method public override newslot void AddBranch(var stmttoadd as BranchStmt)
			Branches::Add(stmttoadd)
		end method

	end class

	class public HElseIfStmt extends BranchStmt implements IHCondCompStmt

		field public Expr Exp

		method public void HElseIfStmt()
			mybase::ctor()
			Exp = new Expr()
		end method

	end class

	class public HElseStmt extends BranchStmt implements IHCondCompStmt
	end class

	class public EndHIfStmt implements IHCondCompStmt
	end class

	class public HDefineStmt extends Stmt

		field public Ident Symbol

		method public void HDefineStmt()
			mybase::ctor()
			Symbol = new Ident()
		end method

	end class

	class public HUndefStmt extends Stmt

		field public Ident Symbol

		method public void HUndefStmt()
			mybase::ctor()
			Symbol = new Ident()
		end method

	end class
end #region

class public RegionStmt extends IgnorableStmt

	field public Token Name

	method public void RegionStmt()
		mybase::ctor()
		Name = new Token()
	end method

end class

class public EndRegionStmt extends IgnorableStmt
end class