//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public PropertyStmt extends BlockStmt

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public Ident PropertyName
	field public TypeTok PropertyTyp
	field public C5.LinkedList<of Expr> Params

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
		foreach a in Attrs
			if a is AutoGenAttr then
				return true
			end if
		end for

		return false
	end method

end class

class public PropertySetStmt extends BlockStmt

	field public Ident Setter

	method public void PropertySetStmt()
		mybase::ctor(ContextType::Method)
		//Setter = null
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer)
		return ctx::get_Context() == ContextType::AbstractProperty orelse _
			ctx::get_Parent()::get_Context() == ContextType::Interface
	end method

end class

class public PropertyGetStmt extends BlockStmt

	field public Ident Getter

	method public void PropertyGetStmt()
		mybase::ctor(ContextType::Method)
		//Getter = null
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer)
		return ctx::get_Context() == ContextType::AbstractProperty orelse _
			ctx::get_Parent()::get_Context() == ContextType::Interface
	end method

end class

class public EndPropStmt extends EndStmt
	method public override string ToString()
		return "end property"
	end method
end class

class public EndSetStmt extends EndStmt
	method public override string ToString()
		return "end set"
	end method
end class

class public EndGetStmt extends EndStmt
	method public override string ToString()
		return "end get"
	end method
end class