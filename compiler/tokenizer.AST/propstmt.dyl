//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public EndPropStmt extends EndStmt
	method public override string ToString() => "end property"
end class

class public EndSetStmt extends EndStmt
	method public override string ToString() => "end set"
end class

class public EndGetStmt extends EndStmt
	method public override string ToString()
		return "end get"
	end method
end class

class public PropertyStmt extends BlockStmt implements IExprBodyable

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public Ident PropertyName
	field public TypeTok PropertyTyp
	field public C5.LinkedList<of Expr> Params

	property public virtual autogen Expr ExprBody

	method public void PropertyStmt()
		mybase::ctor(ContextType::Property)
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		PropertyName = new Ident()
		PropertyTyp = new TypeTok()
		Params = new C5.LinkedList<of Expr>()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
		if attrtoadd is AbstractAttr then
			_Context = ContextType::AbstractProperty
		end if
	end method

	method public void AddParam(var paramtoadd as Expr)
		Params::Add(paramtoadd)
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer)
		if get_ExprBody() isnot null then
			return true
		end if

		foreach a in Attrs
			if a is AutoGenAttr then
				return true
			end if
		end for

		return false
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndPropStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Class orelse ctx == ContextType::Interface

end class

class public PropertySetStmt extends BlockStmt

	field public Ident Setter
	field public VisibilityAttr Visibility

	method public void PropertySetStmt()
		mybase::ctor(ContextType::Method)
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer)
		return Setter isnot null orelse ctx::get_Context() == ContextType::AbstractProperty orelse _
			ctx::get_Parent()::get_Context() == ContextType::Interface
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndSetStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Property orelse ctx == ContextType::AbstractProperty

end class

class public PropertyGetStmt extends BlockStmt

	field public Ident Getter
	field public VisibilityAttr Visibility

	method public void PropertyGetStmt()
		mybase::ctor(ContextType::Method)
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer) => _
		Getter isnot null orelse ctx::get_Context() == ContextType::AbstractProperty orelse _
		ctx::get_Parent()::get_Context() == ContextType::Interface

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndGetStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Property orelse ctx == ContextType::AbstractProperty

end class