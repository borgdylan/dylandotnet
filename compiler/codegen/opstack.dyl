//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi OpStack

	field private Stack<of Token> Stack

	method public void OpStack()
		me::ctor()
		Stack = new Stack<of Token>()
	end method

	method public void PushOp(var optok as Token)
		Stack::Push(optok)
	end method

	method public void PopOp()
		if Stack::get_Count() != 0 then
			Stack::Pop()
		end if
	end method

	method public Token TopOp()
		if Stack::get_Count() = 0 then
			return null
		else
			return Stack::Peek()
		end if
	end method

	method public integer getLength()
		return Stack::get_Count()
	end method

end class
