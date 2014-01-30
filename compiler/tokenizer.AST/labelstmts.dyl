//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi LabelStmt extends Stmt

	field public Ident LabelName

	method public void LabelStmt()
		me::ctor()
		LabelName = new Ident()
	end method
	
	method public hidebysig virtual string ToString()
		return "label " + LabelName::Value
	end method

end class

class public auto ansi PlaceStmt extends Stmt

	field public Ident LabelName

	method public void PlaceStmt()
		me::ctor()
		LabelName = new Ident()
	end method
	
	method public hidebysig virtual string ToString()
		return "place " + LabelName::Value
	end method

end class

class public auto ansi GotoStmt extends Stmt

	field public Ident LabelName

	method public void GotoStmt()
		me::ctor()
		LabelName = new Ident()
	end method
	
	method public hidebysig virtual string ToString()
		return "goto " + LabelName::Value
	end method

end class
