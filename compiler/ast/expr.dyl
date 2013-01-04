//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Expr

	field public C5.ArrayList<of Token> Tokens
	field public integer Line
	field public Type ResultTyp

	method public void Expr()
		me::ctor()
		Tokens = new C5.ArrayList<of Token>()
		Line = 0
		ResultTyp = null
	end method

	method public void AddToken(var toktoadd as Token)
		Tokens::Add(toktoadd)
//		var i as integer = -1
//		var destarr as Token[] = new Token[Tokens[l] + 1]
//
//		do until i = (Tokens[l] - 1)
//			i = i + 1
//			destarr[i] = Tokens[i]
//		end do

		if Tokens::get_Count() = 0 then
			Line = toktoadd::Line
		end if

//		destarr[Tokens[l]] = toktoadd
//		Tokens = destarr
	end method

	method public void RemToken(var ind as integer)
		Tokens::RemoveAt(ind)
//		var i as integer = -1
//		var j as integer = -1
//		var destarr as Token[] = new Token[Tokens[l] - 1]
//
//		do until i = (Tokens[l] - 1)
//			i = i + 1
//			if i != ind then
//				j = j + 1
//				destarr[j] = Tokens[i]
//			end if
//		end do
//
//		Tokens = destarr
	end method


end class
