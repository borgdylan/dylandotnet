//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Parser

	field public Flags PFlags
	
	method public void Parser()
		me::ctor()
		PFlags = new Flags()
	end method
	
//	method public void Parser(var assemstate as boolean)
//		me::ctor()
//		PFlags = new Flags()
//		PFlags::AssemFlg = assemstate
//	end method

	method public void Parser(var pf as Flags)
		me::ctor()
		PFlags = pf
	end method

	method public StmtSet Parse(var stms as StmtSet)
		var i as integer = -1
		var so as StmtOptimizer = null
		PFlags::CurPath = stms::Path
		
		do until i = (stms::Stmts[l] - 1)
			i = i + 1
			so = new StmtOptimizer(PFlags)
			stms::Stmts[i] = so::Optimize(stms::Stmts[i])
		end do
		
		return stms
	end method

end class
