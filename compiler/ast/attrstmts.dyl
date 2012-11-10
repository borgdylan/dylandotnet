//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi AttrStmt extends Stmt
	
	field public NewCallTok Ctor
	field public AttrValuePair[] Pairs

	method public void AttrStmt()
		me::ctor()
		Ctor = null
		Pairs = new AttrValuePair[0]
	end method

end class

class public auto ansi MethodAttrStmt extends AttrStmt
end class

class public auto ansi FieldAttrStmt extends AttrStmt
end class

class public auto ansi ClassAttrStmt extends AttrStmt
end class

class public auto ansi AssemblyAttrStmt extends AttrStmt
end class

class public auto ansi ParameterAttrStmt extends AttrStmt

	field public integer Index
	
	method public void ParameterAttrStmt()
		me::ctor()
		Index = 0
	end method
	
end class