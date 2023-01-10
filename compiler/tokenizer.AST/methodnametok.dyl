//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

class public MethodNameTok extends Ident implements IMayHaveConstraints

	method public void MethodNameTok()
		mybase::ctor()
		_OrdOp = string::Empty
	end method

	method public void MethodNameTok(var value as string)
		mybase::ctor(value)
		_OrdOp = string::Empty
	end method

	method public void MethodNameTok(var idt as Ident)
		mybase::ctor(idt::Value)
		_DoNeg = idt::get_DoNeg()
		_DoNot = idt::get_DoNot()
		_DoDec = idt::get_DoDec()
		_DoInc = idt::get_DoInc()
		_DoMinus = idt::get_DoMinus()
		_DoPlus = idt::get_DoPlus()
		_Conv = idt::get_Conv()
		IsArr = idt::IsArr
		ArrLoc = idt::ArrLoc
		IsRef = idt::IsRef
		IsValInRef = idt::IsValInRef
		_TTok = idt::get_TTok()
		_OrdOp = idt::get_OrdOp()
		ExplType = idt::ExplType
		PosFromToken(idt)
	end method

	method public static specialname MethodNameTok op_Implicit(var idt as Ident) => #ternary{idt is MethodNameTok ? $MethodNameTok$idt, new MethodNameTok(idt)}

	property public virtual boolean MayHaveConstraints => false

end class

class public sealed GenericMethodNameTok extends MethodNameTok implements IMayHaveConstraints, IConstrainable

	field public C5.LinkedList<of TypeTok> Params
	field private C5.HashDictionary<of string, C5.LinkedList<of Token> > _Constraints

	method public void GenericMethodNameTok()
		mybase::ctor()
		Params = new C5.LinkedList<of TypeTok>()
		_Constraints = new C5.HashDictionary<of string, C5.LinkedList<of Token> >(C5.MemoryType::Normal)
	end method

	method public void GenericMethodNameTok(var value as string)
		mybase::ctor(value)
		Params = new C5.LinkedList<of TypeTok>()
		_Constraints = new C5.HashDictionary<of string, C5.LinkedList<of Token> >(C5.MemoryType::Normal)
	end method

	method public void GenericMethodNameTok(var idt as Ident)
		mybase::ctor(idt::Value)
		Params = new C5.LinkedList<of TypeTok>()
		_DoNeg = idt::get_DoNeg()
		_DoNot = idt::get_DoNot()
		_DoDec = idt::get_DoDec()
		_DoInc = idt::get_DoInc()
		_DoMinus = idt::get_DoMinus()
		_DoPlus = idt::get_DoPlus()
		_Conv = idt::get_Conv()
		IsArr = idt::IsArr
		ArrLoc = idt::ArrLoc
		IsRef = idt::IsRef
		IsValInRef = idt::IsValInRef
		_TTok = idt::get_TTok()
		_OrdOp = idt::get_OrdOp()
		_Constraints = new C5.HashDictionary<of string, C5.LinkedList<of Token> >(C5.MemoryType::Normal)
		PosFromToken(idt)
	end method

	method public static specialname GenericMethodNameTok op_Implicit(var idt as Ident) => #ternary {idt is GenericMethodNameTok ? $GenericMethodNameTok$idt, new GenericMethodNameTok(idt)}

	method public void AddParam(var param as TypeTok)
		Params::Add(param)
	end method

	method public virtual void AddConstraint(var param as string, var ctr as Token)
		if !_Constraints::Contains(param) then
			_Constraints::Add(param, new C5.LinkedList<of Token>())
		end if
		_Constraints::get_Item(param)::Add(ctr)
	end method

	property public virtual boolean MayHaveConstraints => true
	property public virtual C5.HashDictionary<of string, C5.LinkedList<of Token> > Constraints => _Constraints

end class