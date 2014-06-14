//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi MethodNameTok extends Ident implements IHasConstraints

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

	property public hidebysig virtual newslot boolean HasConstraints
		get
			return false
		end get
	end property

end class

class public auto ansi GenericMethodNameTok extends MethodNameTok implements IHasConstraints, IConstrainable

	field public C5.LinkedList<of TypeTok> Params
	field private C5.HashDictionary<of string, C5.LinkedList<of Token> > _Constraints

	method public void GenericMethodNameTok()
		me::ctor()
		Params = new C5.LinkedList<of TypeTok>()
		_Constraints = new C5.HashDictionary<of string, C5.LinkedList<of Token> >()
	end method

	method public void GenericMethodNameTok(var value as string)
		me::ctor(value)
		Params = new C5.LinkedList<of TypeTok>()
		_Constraints = new C5.HashDictionary<of string, C5.LinkedList<of Token> >()
	end method
	
	method public void GenericMethodNameTok(var idt as Ident)
		me::ctor(idt::Value)
		Params = new C5.LinkedList<of TypeTok>()
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
		_Constraints = new C5.HashDictionary<of string, C5.LinkedList<of Token> >()
	end method
	
	method public static specialname GenericMethodNameTok op_Implicit(var idt as Ident)
		return #ternary {idt is GenericMethodNameTok ? $GenericMethodNameTok$idt, new GenericMethodNameTok(idt)}
	end method

	method public void AddParam(var param as TypeTok)
		Params::Add(param)
	end method

	method public hidebysig virtual newslot void AddConstraint(var param as string, var ctr as Token)
		if !_Constraints::Contains(param) then
			_Constraints::Add(param, new C5.LinkedList<of Token>())
		end if
		_Constraints::get_Item(param)::Add(ctr)
	end method

	property public hidebysig virtual newslot boolean HasConstraints
		get
			return true
		end get
	end property

	property public hidebysig virtual newslot C5.HashDictionary<of string, C5.LinkedList<of Token> > Constraints
		get
			return _Constraints
		end get
	end property

end class