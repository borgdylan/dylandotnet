//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi EventStmt extends Stmt

	field public Attributes.Attribute[] Attrs
	field public Ident EventName
	field public TypeTok EventTyp

	method public void EventStmt()
		me::ctor()
		Attrs = new Attributes.Attribute[0]
		EventName = new Ident()
		EventTyp = new TypeTok()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		
		var i as integer = -1
		var destarr as Attributes.Attribute[] = new Attributes.Attribute[Attrs[l] + 1]

		do until i = (Attrs[l] - 1)
			i = i + 1
			destarr[i] = Attrs[i]
		end do

		destarr[Attrs[l]] = attrtoadd
		Attrs = destarr

	end method

end class

class public auto ansi EventAddStmt extends Stmt

	field public Ident Adder

	method public void EventAddStmt()
		me::ctor()
		Adder = new Ident()
	end method

end class

class public auto ansi EventRemoveStmt extends Stmt

	field public Ident Remover

	method public void EventRemoveStmt()
		me::ctor()
		Remover = new Ident()
	end method

end class

class public auto ansi EndEventStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end event"
	end method
end class
