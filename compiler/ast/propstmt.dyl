//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi PropertyStmt extends Stmt

	field public Attributes.Attribute[] Attrs
	field public Ident PropertyName

	method public void PropertyStmt()
		me::ctor()
		Attrs = new Attributes.Attribute[0]
		PropertyName = new Ident()
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

class public auto ansi PropertySetStmt extends Stmt

	field public MethodNameTok Setter

	method public void PropertySetStmt()
		me::ctor()
		Setter = new MethodNameTok()
	end method

end class

class public auto ansi PropertyGetStmt extends Stmt

	field public MethodNameTok Getter

	method public void PropertyGetStmt()
		me::ctor()
		Getter = new MethodNameTok()
	end method

end class
