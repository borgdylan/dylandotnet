//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs

class public sealed AssignStmt extends Stmt

	field public Expr LExp
	field public Expr RExp

	method public void AssignStmt()
		mybase::ctor()
		LExp = new Expr()
		RExp = new Expr()
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop orelse ctx == ContextType::Enum

end class

class public sealed IncStmt extends Stmt

	field public Ident NumVar

	method public void IncStmt()
		mybase::ctor()
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed DecStmt extends Stmt

	field public Ident NumVar

	method public void DecStmt()
		mybase::ctor()
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed ReturnStmt extends Stmt

	field public Expr RExp

	method public void ReturnStmt()
		mybase::ctor()
		RExp = new Expr()
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed MethodCallStmt extends Stmt

	field public Token MethodToken

	method public void MethodCallStmt()
		mybase::ctor()
		MethodToken = new Token()
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed EndLockStmt extends EndStmt
	method public override string ToString()
		return "end lock"
	end method
end class

class public sealed CommentStmt extends Stmt
	method public override boolean ValidateContext(var ctx as ContextType) => true
end class

class public sealed ErrorStmt extends Stmt

	field public Token Msg

	method public void ErrorStmt()
		mybase::ctor()
		Msg = new Token()
	end method

	method public override string ToString()
		var temp as string = Msg::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = i"\q{temp}\q"
		end if
		return i"#error {temp}"
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => true

end class

class public sealed WarningStmt extends Stmt

	field public Token Msg

	method public void WarningStmt()
		mybase::ctor()
		Msg = new Token()
	end method

	method public override string ToString()
		var temp as string = Msg::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = i"\q{temp}\q"
		end if
		return i"#warning {temp}"
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => true

end class

class public sealed SignStmt extends Stmt

	field public Token KeyPath

	method public void SignStmt()
		mybase::ctor()
		KeyPath = new Token()
	end method

	method public override string ToString()
		var temp as string = KeyPath::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = i"\q{temp}\q"
		end if
		return i"#sign {temp}"
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly

end class

class public sealed EmbedStmt extends Stmt

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
			temp = i"\q{temp}\q"
		end if
		var temp2 as string = LogicalName::Value
		if temp2::get_Length() != 0 then
			if temp2 notlike c"^\q(.)*\q$" then
				temp2 = i"\q{temp2}\q"
			end if
		end if
		return #ternary{temp2::get_Length() == 0 ? i"#embed {temp}", i"#embed {temp2} = {temp}" }
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly

end class

class public sealed LockStmt extends BlockStmt

	field public Expr Lockee

	method public void LockStmt()
		mybase::ctor()
		Lockee = new Expr()
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndLockStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class

class public sealed TryLockStmt extends BlockStmt

	field public Expr Lockee

	method public void TryLockStmt()
		mybase::ctor()
		Lockee = new Expr()
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndLockStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Method orelse ctx == ContextType::Loop

end class
