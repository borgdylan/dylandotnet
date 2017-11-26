//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Attributes

class public EndClassStmt extends EndStmt

	field public Token EndToken

	method public void EndClassStmt(var endtok as Token)
		mybase::ctor()
		EndToken = endtok
	end method

	method public void EndClassStmt()
		ctor(new ClassTok() {Line = me::Line})
	end method

	method public override string ToString() => i"end {EndToken::ToString()}"
end class

// class Attrs ClassName extends InhClass implements ImplInterafaces
class public ClassStmt extends BlockStmt implements IMayHaveConstraints, IConstrainable

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public TypeTok ClassName
	field public TypeTok InhClass
	field public C5.LinkedList<of TypeTok> ImplInterfaces
	field private C5.HashDictionary<of string, C5.LinkedList<of Token> > _Constraints

	method public void ClassStmt()
		mybase::ctor(ContextType::Class)
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		ClassName = new TypeTok()
		InhClass = new TypeTok()
		ImplInterfaces = new C5.LinkedList<of TypeTok>()
		_Constraints = new C5.HashDictionary<of string, C5.LinkedList<of Token> >(C5.MemoryType::Normal)
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
		if attrtoadd is InterfaceAttr then
			_Context = ContextType::Interface
		end if
	end method

	method public void AddInterface(var interftoadd as TypeTok)
		ImplInterfaces::Add(interftoadd)
	end method

	method public virtual void AddConstraint(var param as string, var ctr as Token)
		if !_Constraints::Contains(param) then
			_Constraints::Add(param, new C5.LinkedList<of Token>())
		end if
		_Constraints::get_Item(param)::Add(ctr)
	end method

	property public virtual boolean MayHaveConstraints => ClassName is GenericTypeTok
	property public virtual C5.HashDictionary<of string, C5.LinkedList<of Token> > Constraints => _Constraints

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndClassStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Assembly orelse ctx == ContextType::Class

end class