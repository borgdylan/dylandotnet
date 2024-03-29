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

class public sealed DelegateStmt extends Stmt

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public MethodNameTok DelegateName
	field public TypeTok RetTyp
	field public C5.LinkedList<of Expr> Params

	method public void DelegateStmt()
		mybase::ctor()
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		DelegateName = new MethodNameTok()
		Params = new C5.LinkedList<of Expr>()
		RetTyp = new TypeTok()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
	end method

	method public void AddParam(var paramtoadd as Expr)
		Params::Add(paramtoadd)
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly orelse ctx == ContextType::Class

end class
