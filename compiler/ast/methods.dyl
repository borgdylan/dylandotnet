//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi MethodNameTok extends Ident

	method public void MethodNameTok()
		me::ctor()
	end method
	
	method public void MethodNameTok(var value as string)
		me::ctor(value)
	end method

	method public void MethodNameTok(var idt as Ident)
		me::ctor(idt::Value)
		DoNeg = idt::DoNeg
		DoNot = idt::DoNot
		Conv = idt::Conv
		IsArr = idt::IsArr
		ArrLoc = idt::ArrLoc
		IsRef = idt::IsRef
		IsValInRef = idt::IsValInRef
		IsRefInst = idt::IsRefInst
		IsValInRefInst = idt::IsValInRefInst
		TTok = idt::TTok
		OrdOp = idt::OrdOp
		Line = idt::Line
	end method
	
	method public static specialname MethodNameTok op_Implicit(var idt as Ident)
		return new MethodNameTok(idt)
	end method

end class

class public auto ansi GenericMethodNameTok extends MethodNameTok

	field public TypeTok[] Params

	method public void GenericMethodNameTok()
		me::ctor()
		Params = new TypeTok[0]
	end method

	method public void GenericMethodNameTok(var value as string)
		me::ctor(value)
		Params = new TypeTok[0]
	end method
	
	method public void GenericMethodNameTok(var idt as Ident)
		me::ctor(idt::Value)
		Params = new TypeTok[0]
		DoNeg = idt::DoNeg
		DoNot = idt::DoNot
		Conv = idt::Conv
		IsArr = idt::IsArr
		ArrLoc = idt::ArrLoc
		IsRef = idt::IsRef
		IsValInRef = idt::IsValInRef
		IsRefInst = idt::IsRefInst
		IsValInRefInst = idt::IsValInRefInst
		TTok = idt::TTok
		OrdOp = idt::OrdOp
		Line = idt::Line
	end method
	
	method public static specialname GenericMethodNameTok op_Implicit(var idt as Ident)
		var gmntt as Type = gettype GenericMethodNameTok
		if gmntt::IsInstanceOfType(idt) then
			return idt
		else
			return new GenericMethodNameTok(idt)
		end if
	end method


	method public void AddParam(var param as TypeTok)
		var i as integer = -1
		var destarr as TypeTok[] = new TypeTok[Params[l] + 1]
		do until i = Params[l] - 1
			i = i + 1
			destarr[i] = Params[i]
		end do
		destarr[Params[l]] = param
		Params = destarr
	end method

end class

class public auto ansi MethodCallTok extends Token

	field public MethodNameTok Name
	field public Expr[] Params
	field public boolean PopFlg
	field public Type[] TypArr

	method public void MethodCallTok()
		me::ctor()
		Name = new MethodNameTok()
		PopFlg = false
		Params = new Expr[0]
		TypArr = Type::EmptyTypes
	end method

	method public void MethodCallTok(var value as string)
		me::ctor(value)
		Name = new MethodNameTok()
		PopFlg = false
		Params = new Expr[0]
		TypArr = Type::EmptyTypes
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

class public auto ansi GettypeCallTok extends Token

	field public TypeTok Name

	method public void GettypeCallTok()
		me::ctor()
		Name = new TypeTok()
	end method

	method public void GettypeCallTok(var value as string)
		me::ctor(value)
		Name = new TypeTok()
	end method

end class

class public auto ansi PtrCallTok extends Token

	field public MethodNameTok MetToCall

	method public void PtrCallTok()
		me::ctor()
		MetToCall = new MethodNameTok()
	end method

	method public void PtrCallTok(var value as string)
		me::ctor(value)
		MetToCall = new MethodNameTok()
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

