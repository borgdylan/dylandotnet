//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

struct public IdentSegment

	field public string Value
	field public integer Line
	field public integer Column

	method public void IdentSegment(var val as string, var lin as integer, var col as integer)
		Value = val
		Line = lin
		Column = col
	end method

	method public override string ToString() => i"{Value} ({Line},{Column})"

end struct

class public Ident extends ValueToken implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable

	field public boolean IsRef
	field public boolean IsValInRef
	field family boolean _Conv
	field family TypeTok _TTok
	field public boolean IsArr
	field public Expr ArrLoc
	field family boolean _DoNeg
	field family boolean _DoNot
	field family boolean _DoInc
	field family boolean _DoDec
	field family string _OrdOp
	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public TypeTok ExplType

	property public virtual autogen string OrdOp
	property public virtual autogen boolean Conv
	property public virtual autogen TypeTok TTok
	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot
	property public virtual autogen boolean DoInc
	property public virtual autogen boolean DoDec

	method public void Ident(var value as string)
		mybase::ctor(value)
		_TTok = new TypeTok()
		ArrLoc = new Expr()
		_OrdOp = string::Empty
		MemberToAccess = new Token()
	end method

	method public void Ident()
		ctor(string::Empty)
	end method

	method public IdentSegment[] GetSegments()

		if string::IsNullOrEmpty(Value) then
			return Array::Empty<of IdentSegment>()
		end if

		var arr as C5.IList<of IdentSegment> = new C5.LinkedList<of IdentSegment>()
		var ch as char
		var acc = new System.Text.StringBuilder()
		var len as integer = --Value::get_Length()
		var col as integer = 0

		for i = 0 upto len
			ch = Value::get_Chars(i)

			if ch == ':' then
				if acc::get_Length() != 0 then
					arr::Add(new IdentSegment(acc::ToString(), Line, Column + col))
					acc::Clear()
				end if
				col = ++i
			else
				acc::Append(ch)
			end if

			if i == len then
				if acc::get_Length() != 0 then
					arr::Add(new IdentSegment(acc::ToString(), Line, Column + col))
					acc::Clear()
				end if
			end if

		end for

		return arr::ToArray()
	end method

end class