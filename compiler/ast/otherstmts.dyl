//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi AssignStmt extends Stmt

	field public Expr LExp
	field public Expr RExp

	method public void AssignStmt()
		me::ctor()
		LExp = new Expr()
		RExp = new Expr()
	end method

end class

class public auto ansi IncStmt extends Stmt

	field public Ident NumVar

	method public void IncStmt()
		me::ctor()
		NumVar = new Ident()
	end method

end class

class public auto ansi DecStmt extends Stmt

	field public Ident NumVar

	method public void DecStmt()
		me::ctor()
		NumVar = new Ident()
	end method

end class

class public auto ansi ReturnStmt extends Stmt

	field public Expr RExp

	method public void ReturnStmt()
		me::ctor()
		RExp = new Expr()
	end method

end class

class public auto ansi MethodCallStmt extends Stmt

	field public Token MethodToken

	method public void MethodCallStmt()
		me::ctor()
		MethodToken = new Token()
	end method

end class

class public auto ansi EndMethodStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end method"
	end method
end class

class public auto ansi EndEnumStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end enum"
	end method
end class

class public auto ansi EndClassStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end class"
	end method
end class

class public auto ansi EndNSStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end namespace"
	end method
end class

class public auto ansi EndXmlDocStmt extends Stmt
end class

class public auto ansi EndTryStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end try"
	end method
end class

class public auto ansi EndPropStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end property"
	end method
end class

class public auto ansi CommentStmt extends Stmt
end class

class public auto ansi ErrorStmt extends Stmt

	field public Token Msg

	method public void ErrorStmt()
		me::ctor()
		Msg = new Token()
	end method
	
	method public hidebysig virtual string ToString()
		var temp as string = Msg::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		return "#error " + temp
	end method

end class

class public auto ansi WarningStmt extends Stmt

	field public Token Msg

	method public void WarningStmt()
		me::ctor()
		Msg = new Token()
	end method
	
	method public hidebysig virtual string ToString()
		var temp as string = Msg::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		return "#warning " + temp
	end method

end class
