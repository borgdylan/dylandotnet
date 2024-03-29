//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

class public sealed MethodCallTok extends ValueToken

	field public MethodNameTok Name
	field public C5.ArrayList<of Expr> Params
	field public boolean PopFlg
	field public boolean CondFlg
	field public boolean CondAvailable
	field public boolean CondFlgValue
	field public Managed.Reflection.Type[] TypArr

	method public void MethodCallTok(var value as string)
		mybase::ctor(value)
		Name = new MethodNameTok()
		Params = new C5.ArrayList<of Expr>()
		TypArr = Managed.Reflection.Type::EmptyTypes
	end method

	method public void MethodCallTok()
		ctor(string::Empty)
	end method

	method public void AddParam(var paramtoadd as Expr)
		Params::Add(paramtoadd)
		if Params::get_Count() == 0 then
			//TODO: need Expr to provide richer metadata
			Line = paramtoadd::Line
			EndLine = paramtoadd::Line
		end if
	end method

end class

class public sealed GettypeCallTok extends ValueToken

	field public TypeTok Name

	method public void GettypeCallTok()
		mybase::ctor()
		Name = new TypeTok()
	end method

	method public void GettypeCallTok(var value as string)
		mybase::ctor(value)
		Name = new TypeTok()
	end method

end class

class public sealed DefaultCallTok extends ValueToken

	field public TypeTok Name

	method public void DefaultCallTok()
		mybase::ctor()
		Name = new TypeTok()
	end method

	method public void DefaultCallTok(var value as string)
		mybase::ctor(value)
		Name = new TypeTok()
	end method

end class

class public sealed TupleCallTok extends ValueToken

	field public C5.ArrayList<of Expr> Params

	method public void TupleCallTok()
		mybase::ctor(string::Empty)
		Params = new C5.ArrayList<of Expr>()
	end method

	method public void AddParam(var paramtoadd as Expr)
		Params::Add(paramtoadd)
		if Params::get_Count() == 0 then
			//TODO: need Expr to provide richer metadata
			Line = paramtoadd::Line
			EndLine = paramtoadd::Line
		end if
	end method

end class
