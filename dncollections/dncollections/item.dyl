//    dncollections.dll dylan.NET.Collections Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi Item

	field public object Value
	field public Item Next
	field public Item Previous
	field public integer Index
	
	method public void Item()
		me::ctor()
		Value = null
		Next = null
		Previous = null
		Index = -1
	end method
	
	method public void Item(var o as object)
		me::ctor()
		Value = o
		Next = null
		Previous = null
		Index = -1
	end method
	
	method public boolean HasNext()
		return Next != null
	end method
	
	method public boolean HasPrevious()
		return Previous != null
	end method
	
	method public Item GoNext()
		if HasNext() then
			Next::Index = Index + 1
		end if
		return Next
	end method
	
	method public Item GoPrevious()
		if HasPrevious() then
			Previous::Index = Index - 1
		end if
		return Previous
	end method
	
	method public Item MakeCopy()
		return new Item(Value)
	end method
	
	method public static Item MakeCopy(var ite as Item)
		return new Item(ite::Value)
	end method
	
end class
