//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

// class Attrs ClassName extends InhClass implements ImplInterafaces
class public auto ansi ClassStmt extends Stmt

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public Ident ClassName
	field public TypeTok InhClass
	field public C5.LinkedList<of TypeTok> ImplInterfaces

	method public void ClassStmt()
		me::ctor()
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		ClassName = new Ident()
		InhClass = new TypeTok()
		ImplInterfaces = new C5.LinkedList<of TypeTok>()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
	end method

	method public void AddInterface(var interftoadd as TypeTok)
		ImplInterfaces::Add(interftoadd)
	end method

end class

class public auto ansi EndClassStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end class"
	end method
end class
