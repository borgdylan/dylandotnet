//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi LockItem extends TryItem

	field public integer LockeeLoc
	field public Emit.Label Lbl
	field public boolean IsTryLock

	method public void LockItem()
		mybase::ctor(0)
		LockeeLoc = 0
		IsTryLock = false
	end method

	method public void LockItem(var loc as integer, var ln as integer)
		mybase::ctor(ln)
		LockeeLoc = loc
		IsTryLock = false
	end method

	method public void LockItem(var loc as integer, var lb as Emit.Label, var ln as integer)
		mybase::ctor(ln)
		LockeeLoc = loc
		IsTryLock = true
		Lbl = lb
	end method

end class