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
	end method
	
	method public void MethodNameTok(var value as string)
		me::ctor(value)
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
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNot()
		return _DoNot
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNot(var dn as boolean)
		_DoNot = dn
	end method
	
	property none boolean DoNot
		get get_DoNot()
		set set_DoNot()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoInc()
		return _DoInc
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoInc(var inc as boolean)
		_DoInc = inc
	end method
	
	property none boolean DoInc
		get get_DoInc()
		set set_DoInc()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoDec()
		return _DoDec
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoDec(var dec as boolean)
		_DoDec = dec
	end method
	
	property none boolean DoDec
		get get_DoDec()
		set set_DoDec()
	end property

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
	
	method public hidebysig virtual specialname final newslot string get_OrdOp()
		return _OrdOp
	end method
	
	method public hidebysig virtual specialname final newslot void set_OrdOp(var oo as string)
		_OrdOp = oo
	end method
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_Conv()
		return _Conv
	end method
	
	method public hidebysig virtual specialname final newslot void set_Conv(var c as boolean)
		_Conv = c
	end method
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname final newslot TypeTok get_TTok()
		return _TTok
	end method
	
	method public hidebysig virtual specialname final newslot void set_TTok(var tt as TypeTok)
		_TTok = tt
	end method
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNeg()
		return _DoNeg
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNeg(var dn as boolean)
		_DoNeg = dn
	end method
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoNot()
		return _DoNot
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoNot(var dn as boolean)
		_DoNot = dn
	end method
	
	property none boolean DoNot
		get get_DoNot()
		set set_DoNot()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoInc()
		return _DoInc
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoInc(var inc as boolean)
		_DoInc = inc
	end method
	
	property none boolean DoInc
		get get_DoInc()
		set set_DoInc()
	end property
	
	method public hidebysig virtual specialname final newslot boolean get_DoDec()
		return _DoDec
	end method
	
	method public hidebysig virtual specialname final newslot void set_DoDec(var dec as boolean)
		_DoDec = dec
	end method
	
	property none boolean DoDec
		get get_DoDec()
		set set_DoDec()
	end property

end class