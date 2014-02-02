//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi MethodNameTok extends Ident implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable

	method public void MethodNameTok()
		me::ctor()
		_OrdOp = string::Empty
	end method
	
	method public void MethodNameTok(var value as string)
		me::ctor(value)
		_OrdOp = string::Empty
	end method

	method public void MethodNameTok(var idt as Ident)
		me::ctor(idt::Value)
		_DoNeg = idt::get_DoNeg()
		_DoNot = idt::get_DoNot()
		_DoDec = idt::get_DoDec()
		_DoInc = idt::get_DoInc()
		_Conv = idt::get_Conv()
		IsArr = idt::IsArr
		ArrLoc = idt::ArrLoc
		IsRef = idt::IsRef
		IsValInRef = idt::IsValInRef
		_TTok = idt::get_TTok()
		_OrdOp = idt::get_OrdOp()
		Line = idt::Line
	end method
	
	method public static specialname MethodNameTok op_Implicit(var idt as Ident)
		return #ternary{idt is MethodNameTok ? $MethodNameTok$idt, new MethodNameTok(idt)}
	end method
	
	property public hidebysig virtual final newslot autogen string OrdOp
	property public hidebysig virtual final newslot autogen boolean Conv
	property public hidebysig virtual final newslot autogen TypeTok TTok
	property public hidebysig virtual final newslot autogen boolean DoNeg
	property public hidebysig virtual final newslot autogen boolean DoNot
	property public hidebysig virtual final newslot autogen boolean DoInc
	property public hidebysig virtual final newslot autogen boolean DoDec

end class

class public auto ansi GenericMethodNameTok extends MethodNameTok implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable

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
		_DoNeg = idt::get_DoNeg()
		_DoNot = idt::get_DoNot()
		_DoDec = idt::get_DoDec()
		_DoInc = idt::get_DoInc()
		_Conv = idt::get_Conv()
		IsArr = idt::IsArr
		ArrLoc = idt::ArrLoc
		IsRef = idt::IsRef
		IsValInRef = idt::IsValInRef
		_TTok = idt::get_TTok()
		_OrdOp = idt::get_OrdOp()
		Line = idt::Line
	end method
	
	method public static specialname GenericMethodNameTok op_Implicit(var idt as Ident)
		return #ternary {idt is GenericMethodNameTok ? $GenericMethodNameTok$idt, new GenericMethodNameTok(idt)}
	end method


	method public void AddParam(var param as TypeTok)
		var i as integer = -1
		var destarr as TypeTok[] = new TypeTok[++Params[l]]
		do until i = --Params[l]
			i++
			destarr[i] = Params[i]
		end do
		destarr[Params[l]] = param
		Params = destarr
	end method
	
	property public hidebysig virtual final newslot autogen string OrdOp
	property public hidebysig virtual final newslot autogen boolean Conv
	property public hidebysig virtual final newslot autogen TypeTok TTok
	property public hidebysig virtual final newslot autogen boolean DoNeg
	property public hidebysig virtual final newslot autogen boolean DoNot
	property public hidebysig virtual final newslot autogen boolean DoInc
	property public hidebysig virtual final newslot autogen boolean DoDec

end class