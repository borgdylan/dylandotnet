//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public AssignStmt extends Stmt

	field public Expr LExp
	field public Expr RExp

	method public void AssignStmt()
		mybase::ctor()
		LExp = new Expr()
		RExp = new Expr()
	end method

end class

class public IncStmt extends Stmt

	field public Ident NumVar

	method public void IncStmt()
		mybase::ctor()
		//NumVar = null
	end method

end class

class public DecStmt extends Stmt

	field public Ident NumVar

	method public void DecStmt()
		mybase::ctor()
		//NumVar = null
	end method

end class

class public ReturnStmt extends Stmt

	field public Expr RExp

	method public void ReturnStmt()
		mybase::ctor()
		RExp = new Expr()
	end method

end class

class public MethodCallStmt extends Stmt

	field public Token MethodToken

	method public void MethodCallStmt()
		mybase::ctor()
		MethodToken = new Token()
	end method

end class

class public EndLockStmt extends Stmt
	method public override string ToString()
		return "end lock"
	end method
end class

class public CommentStmt extends IgnorableStmt
end class

class public ErrorStmt extends Stmt

	field public Token Msg

	method public void ErrorStmt()
		mybase::ctor()
		Msg = new Token()
	end method
	
	method public override string ToString()
		var temp as string = Msg::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		return "#error " + temp
	end method

end class

class public WarningStmt extends Stmt

	field public Token Msg

	method public void WarningStmt()
		mybase::ctor()
		Msg = new Token()
	end method
	
	method public override string ToString()
		var temp as string = Msg::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		return "#warning " + temp
	end method

end class

class public SignStmt extends Stmt

	field public Token KeyPath

	method public void SignStmt()
		mybase::ctor()
		KeyPath = new Token()
	end method
	
	method public override string ToString()
		var temp as string = KeyPath::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		return "#sign " + temp
	end method

end class

class public EmbedStmt extends Stmt

	field public Token Path
	field public Token LogicalName

	method public void EmbedStmt()
		mybase::ctor()
		Path = new Token()
		LogicalName = new Token()
	end method
	
	method public override string ToString()
		var temp as string = Path::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		var temp2 as string = LogicalName::Value
		if temp2::get_Length() != 0 then
			if temp2 notlike c"^\q(.)*\q$" then
				temp2 = c"\q" + temp2 + c"\q"
			end if
		end if
		return #ternary{temp2::get_Length() == 0 ? "#embed " + temp, "#embed " + temp2 + " = " + temp}
	end method
end class

class public LockStmt extends BlockStmt

	field public Expr Lockee

	method public void LockStmt()
		mybase::ctor()
		Lockee = new Expr()
	end method

end class

class public TryLockStmt extends BlockStmt

	field public Expr Lockee

	method public void TryLockStmt()
		mybase::ctor()
		Lockee = new Expr()
	end method

end class
