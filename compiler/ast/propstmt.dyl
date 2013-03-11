//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi PropertyStmt extends Stmt

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public Ident PropertyName
	field public TypeTok PropertyTyp

	method public void PropertyStmt()
		me::ctor()
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		PropertyName = new Ident()
		PropertyTyp = new TypeTok()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
	end method

end class

class public auto ansi PropertySetStmt extends Stmt

	field public Ident Setter

	method public void PropertySetStmt()
		me::ctor()
		Setter = new Ident()
	end method

end class

class public auto ansi PropertyGetStmt extends Stmt

	field public Ident Getter

	method public void PropertyGetStmt()
		me::ctor()
		Getter = new Ident()
	end method

end class

class public auto ansi EndPropStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end property"
	end method
end class