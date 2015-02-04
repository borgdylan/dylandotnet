//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public EndEventStmt extends EndStmt
	method public override string ToString()
		return "end event"
	end method
end class

class public EndAddStmt extends EndStmt
	method public override string ToString()
		return "end add"
	end method
end class

class public EndRemoveStmt extends EndStmt
	method public override string ToString()
		return "end remove"
	end method
end class

class public EventStmt extends BlockStmt

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public Ident EventName
	field public TypeTok EventTyp

	method public void EventStmt()
		mybase::ctor(ContextType::Event)
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		EventName = new Ident()
		EventTyp = new TypeTok()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
		if attrtoadd is AbstractAttr then
			_Context = ContextType::AbstractEvent
		end if
	end method

	method public override boolean ValidateEnding(var stm as Stmt)
		return stm is EndEventStmt
	end method

	method public override boolean ValidateContext(var ctx as ContextType)
		return ctx == ContextType::Class orelse ctx == ContextType::Interface
	end method

end class

class public EventAddStmt extends BlockStmt

	field public Ident Adder

	method public void EventAddStmt()
		mybase::ctor(ContextType::Method)
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer)
		return Adder isnot null orelse ctx::get_Context() == ContextType::AbstractEvent orelse _
			ctx::get_Parent()::get_Context() == ContextType::Interface
	end method

	method public override boolean ValidateEnding(var stm as Stmt)
		return stm is EndAddStmt
	end method

	method public override boolean ValidateContext(var ctx as ContextType)
		return ctx == ContextType::Event orelse ctx == ContextType::AbstractEvent
	end method

end class

class public EventRemoveStmt extends BlockStmt

	field public Ident Remover

	method public void EventRemoveStmt()
		mybase::ctor(ContextType::Method)
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer)
		return Remover isnot null orelse ctx::get_Context() == ContextType::AbstractEvent orelse _
			ctx::get_Parent()::get_Context() == ContextType::Interface
	end method

	method public override boolean ValidateEnding(var stm as Stmt)
		return stm is EndRemoveStmt
	end method

	method public override boolean ValidateContext(var ctx as ContextType)
		return ctx == ContextType::Event orelse ctx == ContextType::AbstractEvent
	end method

end class