//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens

class public abstract AttrStmt extends Stmt

	field public NewCallTok Ctor
	field public C5.ArrayList<of AttrValuePair> Pairs

	method family void AttrStmt()
		mybase::ctor()
		Pairs = new C5.ArrayList<of AttrValuePair>()
	end method

end class

class public sealed MethodAttrStmt extends AttrStmt
	method public override boolean ValidateContext(var ctx as ContextType) => _
		ctx == ContextType::Class orelse ctx == ContextType::Interface orelse _
		ctx == ContextType::Event orelse ctx == ContextType::Property orelse _
		ctx == ContextType::AbstractEvent orelse ctx == ContextType::AbstractProperty
end class

class public sealed FieldAttrStmt extends AttrStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Class
end class

class public sealed ClassAttrStmt extends AttrStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly orelse ctx == ContextType::Class
end class

class public sealed AssemblyAttrStmt extends AttrStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly
end class

class public sealed PropertyAttrStmt extends AttrStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Class orelse ctx == ContextType::Interface
end class

class public sealed EventAttrStmt extends AttrStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Class orelse ctx == ContextType::Interface
end class

class public sealed EnumAttrStmt extends AttrStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly
end class

class public sealed ParameterAttrStmt extends AttrStmt

	field public integer Index

	method public void ParameterAttrStmt()
		mybase::ctor()
		Index = 0
	end method

	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Class orelse ctx == ContextType::Interface

end class