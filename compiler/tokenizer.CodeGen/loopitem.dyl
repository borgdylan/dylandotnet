//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Exprs
import Managed.Reflection
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

class public LoopItem

	field public Emit.Label EndLabel
	field public Emit.Label StartLabel
	field public integer Line

	method public void LoopItem()
		mybase::ctor()
	end method

	method public void LoopItem(var startl as Emit.Label, var endl as Emit.Label, var ln as integer)
		mybase::ctor()
		EndLabel = endl
		StartLabel = startl
		Line = ln
	end method

end class

class public ForLoopItem extends LoopItem

	field public string Iter
	field public Expr StepExp
	field public boolean Direction
	field public Emit.Label StepLabel
	field public boolean ContinueFlg
	field public TypeTok Typ

	method public void ForLoopItem()
		mybase::ctor()
		Iter = string::Empty
		Direction = true
	end method

	method public void ForLoopItem(var startl as Emit.Label, var endl as Emit.Label, var iter as string, var _step as Expr, var dir as boolean, var t as TypeTok, var ln as integer)
		mybase::ctor(endl, startl, ln)
		Iter = iter
		StepExp = _step
		Direction = dir
		Typ = t
	end method

end class
