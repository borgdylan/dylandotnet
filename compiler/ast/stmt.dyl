//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Stmt

	field public Token[] Tokens
	field public integer Line

	method public void Stmt()
		me::ctor()
		Tokens = new Token[0]
		Line = 0
	end method

	method public void AddToken(var toktoadd as Token)

		var i as integer = -1
		var destarr as Token[] = new Token[Tokens[l] + 1]

		do until i = (Tokens[l] - 1)
			i = i + 1
			destarr[i] = Tokens[i]
		end do

		destarr[Tokens[l]] = toktoadd
		Tokens = destarr

	end method

end class

class public auto ansi StmtSet

	field public Stmt[] Stmts
	field public string Path

	method public void StmtSet()
		me::ctor()
		Stmts = new Stmt[0]
		Path = ""
	end method
	
	method public void StmtSet(var p as string)
		me::ctor()
		Stmts = new Stmt[0]
		Path = p
	end method

	method public void AddStmt(var stmttoadd as Stmt)
		
		var i as integer = -1
		var destarr as Stmt[] = new Stmt[Stmts[l] + 1]

		do until i = (Stmts[l] - 1)
			i = i + 1
			destarr[i] = Stmts[i]
		end do

		destarr[Stmts[l]] = stmttoadd
		Stmts = destarr

	end method

end class
