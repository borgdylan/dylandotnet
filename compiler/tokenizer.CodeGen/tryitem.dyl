//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public TryItem implements ITryLoopItem

	field public integer Line
	field public boolean InCatch
	field public boolean InFinally

	method public void TryItem(var ln as integer)
		mybase::ctor()
		Line = ln
	end method

	method public void TryItem()
		ctor(0)
	end method

	property public virtual TryLoopItemKind Kind => TryLoopItemKind::Try

end class