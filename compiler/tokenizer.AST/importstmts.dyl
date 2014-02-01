//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi ImportStmt extends Stmt

	field public Token NS
	field public Token Alias

	method public void ImportStmt()
		me::ctor()
		NS = new Token()
		Alias = new Token()
	end method
	
	method public hidebysig virtual string ToString()
		var temp as string = NS::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		var temp2 as string = Alias::Value
		if temp2::get_Length() != 0 then
			if temp2 notlike c"^\q(.)*\q$" then
				temp2 = c"\q" + temp2 + c"\q"
			end if
		end if
		return #ternary{temp2::get_Length() == 0 ? "import " + temp, "import " + temp2 + " = " + temp}
	end method

end class

class public auto ansi LocimportStmt extends Stmt

	field public Token NS

	method public void LocimportStmt()
		me::ctor()
		NS = new Token()
	end method
	
	method public hidebysig virtual string ToString()
		var temp as string = NS::Value
		if temp notlike c"^\q(.)*\q$" then
			temp = c"\q" + temp + c"\q"
		end if
		return "locimport " + temp
	end method

end class