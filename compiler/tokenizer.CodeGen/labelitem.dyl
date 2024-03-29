//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import Managed.Reflection

class public sealed LabelItem

	field public Emit.Label Lbl
	field public string LblName

	method public void LabelItem()
		mybase::ctor()
		LblName = string::Empty
	end method

	method public void LabelItem(var ln as string, var l as Emit.Label)
		mybase::ctor()
		LblName = ln
		Lbl = l
	end method

end class
