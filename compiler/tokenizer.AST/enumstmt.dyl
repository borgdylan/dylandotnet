//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

class public sealed EndEnumStmt extends EndStmt
	method public override string ToString()
		return "end enum"
	end method
end class

class public sealed EnumStmt extends BlockStmt

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public Ident EnumName
	field public TypeTok EnumTyp

	method public void EnumStmt()
		mybase::ctor(ContextType::Enum)
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		EnumName = new Ident()
		EnumTyp = new TypeTok()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndEnumStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly

end class
