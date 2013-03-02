//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi IfStmt extends Stmt

	field public Expr Exp

	method public void IfStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi ElseIfStmt extends Stmt

	field public Expr Exp

	method public void ElseIfStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi ElseStmt extends Stmt
end class

class public auto ansi EndIfStmt extends Stmt
end class

//conditional compilation variants

class public auto ansi HCondCompStmt extends Stmt
end class

class public auto ansi HIfStmt extends HCondCompStmt

	field public Expr Exp

	method public void HIfStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi HElseIfStmt extends HCondCompStmt

	field public Expr Exp

	method public void HElseIfStmt()
		me::ctor()
		Exp = new Expr()
	end method

end class

class public auto ansi HElseStmt extends HCondCompStmt
end class

class public auto ansi EndHIfStmt extends HCondCompStmt
end class

class public auto ansi HDefineStmt extends Stmt

	field public Ident Symbol

	method public void HDefineStmt()
		me::ctor()
		Symbol = new Ident()
	end method

end class

class public auto ansi HUndefStmt extends Stmt

	field public Ident Symbol

	method public void HUndefStmt()
		me::ctor()
		Symbol = new Ident()
	end method

end class

