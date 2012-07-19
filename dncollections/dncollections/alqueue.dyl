//    dncollections.dll dylan.NET.Collections Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi ALQueue extends ALList

	method public void Enqueue(var ite as Item)
		Add(ite)
	end method
	
	method public Item Peek()
		if Length = 0 then
			return null
		else
			return ItemArray[0]
		end if
	end method
	
	method public Item Dequeue()
		if Length = 0 then
			return null
		else
			var ite as Item = Peek()
			Remove(0)
			return ite
		end if
	end method
	
	method public void EnqueueValue(var o as object)
		Add(new Item(o))
	end method
	
	method public object PeekValue()
		if Length = 0 then
			return null
		else
			return ItemArray[0]::Value
		end if
	end method
	
	method public object DequeueValue()
		if Length = 0 then
			return null
		else
			var ite as Item = Peek()
			Remove(0)
			return ite::Value
		end if
	end method
	
end class