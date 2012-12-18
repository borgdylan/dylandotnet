//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi NewCallTok extends Token

	field public TypeTok Name
	field public Expr[] Params

	method public void NewCallTok()
		me::ctor()
		Name = new TypeTok()
		Params = new Expr[0]
	end method

	method public void NewCallTok(var value as string)
		me::ctor(value)
		Name = new TypeTok()
		Params = new Expr[0]
	end method

	method public void AddParam(var paramtoadd as Expr)

		var i as integer = -1
		var destarr as Expr[] = new Expr[Params[l] + 1]

		do until i = (Params[l] - 1)
			i = i + 1
			destarr[i] = Params[i]
		end do
		
		if Params[l] = 0 then
			Line = paramtoadd::Line
		end if
		
		destarr[Params[l]] = paramtoadd
		Params = destarr

	end method

end class

class public auto ansi NewarrCallTok extends Token

	field public TypeTok ArrayType
	field public Expr ArrayLen

	method public void NewarrCallTok()
		me::ctor()
		ArrayType = new TypeTok()
		ArrayLen = new Expr()
	end method

	method public void NewarrCallTok(var value as string)
		me::ctor(value)
		ArrayType = new TypeTok()
		ArrayLen = new Expr()
	end method

end class

class public auto ansi ArrInitCallTok extends Token

	field public TypeTok ArrayType
	field public Expr[] Elements
	field public boolean ForceArray

	method public void ArrInitCallTok()
		me::ctor()
		ArrayType = new TypeTok()
		Elements = new Expr[0]
		ForceArray = false
	end method

	method public void ArrInitCallTok(var value as string)
		me::ctor(value)
		ArrayType = new TypeTok()
		Elements = new Expr[0]
		ForceArray = false
	end method
	
	method public void AddElem(var eltoadd as Expr)

		var i as integer = -1
		var destarr as Expr[] = new Expr[Elements[l] + 1]

		do until i = (Elements[l] - 1)
			i = i + 1
			destarr[i] = Elements[i]
		end do
		
		if Elements[l] = 0 then
			Line = eltoadd::Line
		end if
		
		destarr[Elements[l]] = eltoadd
		Elements = destarr

	end method

end class