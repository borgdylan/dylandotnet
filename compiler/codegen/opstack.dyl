//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi OpStack

	field public Expr Stack

	method public void OpStack()
		me::ctor()
		Stack = new Expr()
	end method

	method public void PushOp(var optok as Token)
		Stack::AddToken(optok)
	end method

	method public void PopOp()
		if Stack::Tokens[l] != 0 then
			Stack::RemToken(Stack::Tokens[l] - 1)
		end if
	end method

	method public Token TopOp()
		if Stack::Tokens[l] = 0 then
			return null
		else
			return Stack::Tokens[Stack::Tokens[l] - 1]
		end if
	end method

	method public integer getLength()
		return Stack::Tokens[l]
	end method

end class
