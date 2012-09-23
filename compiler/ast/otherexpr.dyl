//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi AritExpr extends Expr
end class

class public auto ansi LogicExpr extends Expr
end class

class public auto ansi VarExpr extends Expr

	field public TypeTok VarTyp
	field public Ident VarName
	field public Token Attr

	method public void VarExpr()
		me::ctor()
		VarTyp = new TypeTok()
		VarName = new Ident()
		Attr = null
	end method

end class
