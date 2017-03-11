//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public NewCallTok extends ValueToken

	field public TypeTok Name
	field public C5.ArrayList<of Expr> Params
	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public boolean PopFlg

	method public void NewCallTok()
		mybase::ctor()
		Name = new TypeTok()
		Params = new C5.ArrayList<of Expr>()
		MemberToAccess = new Token()
	end method

	method public void NewCallTok(var value as string)
		mybase::ctor(value)
		Name = new TypeTok()
		Params = new C5.ArrayList<of Expr>()
		MemberToAccess = new Token()
	end method

	method public void AddParam(var paramtoadd as Expr)
		Params::Add(paramtoadd)
		if Params::get_Count() = 0 then
			Line = paramtoadd::Line
		end if
	end method

end class

class public NewarrCallTok extends ValueToken

	field public TypeTok ArrayType
	field public Expr ArrayLen

	method public void NewarrCallTok()
		mybase::ctor()
		ArrayType = new TypeTok()
		ArrayLen = new Expr()
	end method

	method public void NewarrCallTok(var value as string)
		mybase::ctor(value)
		ArrayType = new TypeTok()
		ArrayLen = new Expr()
	end method

end class

class public ArrInitCallTok extends ValueToken

	field public TypeTok ArrayType
	field public C5.ArrayList<of Expr> Elements
	field public boolean ForceArray

	method public void ArrInitCallTok()
		mybase::ctor()
		ArrayType = new TypeTok()
		Elements = new C5.ArrayList<of Expr>()
	end method

	method public void ArrInitCallTok(var value as string)
		mybase::ctor(value)
		ArrayType = new TypeTok()
		Elements = new C5.ArrayList<of Expr>()
	end method
	
	method public void AddElem(var eltoadd as Expr)
		Elements::Add(eltoadd)
		if Elements::get_Count() == 0 then
			Line = eltoadd::Line
		end if
	end method

end class

class public ObjInitCallTok extends ValueToken

	field public NewCallTok Ctor
	field public C5.ArrayList<of Token> Elements
	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public boolean PopFlg

	method public void ObjInitCallTok()
		mybase::ctor()
		Elements = new C5.ArrayList<of Token>()
		MemberToAccess = new Token()
	end method

	method public void ObjInitCallTok(var value as string)
		mybase::ctor(value)
		Elements = new C5.ArrayList<of Token>()
		MemberToAccess = new Token()
	end method
	
	method public void AddElem(var eltoadd as Token)
		Elements::Add(eltoadd)
		if Elements::get_Count() = 0 then
			Line = eltoadd::Line
		end if
	end method

end class

class public TernaryCallTok extends ValueToken

	field public Expr Condition
	field public Expr TrueExpr
	field public Expr FalseExpr

	method public void TernaryCallTok()
		mybase::ctor()
		Condition = new Expr()
		TrueExpr = new Expr()
		FalseExpr = new Expr()
	end method

	method public void TernaryCallTok(var value as string)
		mybase::ctor(value)
		Condition = new Expr()
		TrueExpr = new Expr()
		FalseExpr = new Expr()
	end method

end class