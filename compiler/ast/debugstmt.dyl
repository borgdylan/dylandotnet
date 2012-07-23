//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 


// #debug Opt
class public auto ansi DebugStmt extends Stmt

	field public SwitchTok Opt
	field public boolean Flg

	method public void DebugStmt()
		me::ctor()
		Opt = new SwitchTok()
		Flg = false
	end method

	method public void setFlg()

		var t as Type[] = new Type[2]
		t[0] = gettype OnTok
		t[1] = gettype OffTok

		if t[0]::IsInstanceOfType(Opt) then
			Flg = true
		elseif t[1]::IsInstanceOfType(Opt) then
			Flg = false
		end if

	end method
	
	method public hidebysig virtual string ToString()
		return "#debug " + Opt::ToString()
	end method

end class
