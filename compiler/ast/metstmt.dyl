//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi MethodStmt extends Stmt

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public Ident MethodName
	field public TypeTok RetTyp
	field public Expr[] Params

	method public void MethodStmt()
		me::ctor()
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		MethodName = new Ident()
		Params = new Expr[0]
		RetTyp = new TypeTok()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
	end method

	method public void AddParam(var paramtoadd as Expr)

		var i as integer = -1
		var destarr as Expr[] = new Expr[++Params[l]]

		do until i = --Params[l]
			i++
			destarr[i] = Params[i]
		end do

		destarr[Params[l]] = paramtoadd
		Params = destarr

	end method

end class

class public auto ansi EndMethodStmt extends Stmt
	method public hidebysig virtual string ToString()
		return "end method"
	end method
end class