//    dncollections.dll dylan.NET.Collections Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi ALList
	
	field public Item Head
	field public Item Tail
	field public Item[] ItemArray
	field public integer Length
	field public integer Capacity
	
	method public void ALList()
		 me::ctor()
		 Head = null
		 Tail = null
		 Length = 0
		 ItemArray = new Item[10]
		 Capacity = ItemArray[l]
	end method
	
	method public void Add(var ite as Item)
		
		if Length = Capacity then
		
			var na as Item[] = new Item[ItemArray[l] + 10]
			var i as integer = -1
			
			label loop
			label cont
			
			place loop
			
			i = i + 1
			
			na[i] = ItemArray[i]
			
			if i = (Length - 1) then
				goto cont
			else
				goto loop
			end if
			
			place cont
			
			ItemArray = na
			Capacity = ItemArray[l]
			
		
		end if
		
		if Head = null then
			Head = ite
			Tail = Head
			Head::Previous = null
			Head::Next = null
			ItemArray[Length] = ite
			Head::Index = Length
			Length = Length + 1
		else
			Tail::Next = ite
			ite::Previous = Tail
			ite::Next = null
			Tail = ite
			ItemArray[Length] = ite
			ite::Index = Length
			Length = Length + 1
		end if
		
	end method
	
	method public void Add(var o as object)
		Add(new Item(o))
	end method
	
	method public void AddAll(var al1 as ALList)
		
		var ite as Item = null
		
		if al1::Length > 0 then
			label loop
			label cont
			
			place loop
			
			if ite = null then
				ite = al1::Head
				Add(ite)
			else
				ite = ite::GoNext()
				Add(ite)
			end if
			
			if ite::HasNext() then
				goto loop
			else
				goto cont
			end if
			
			place cont
			
		end if
				
	end method
	
	method public static specialname ALList op_Addition(var lis as ALList, var ite as Item)
		lis::Add(ite)
		return lis
	end method
	
	method public static specialname ALList op_Addition(var lis as ALList, var o as object)
		lis::Add(o)
		return lis
	end method
	
	method public Item GetItem(var i as integer)
		if (i <= (Length - 1)) and (i >= 0) then
			var ite as Item =  ItemArray[i]
			ite::Index = i
			return ite
		else
			return null
		end if
	end method
	
	method public object GetItemValue(var i as integer)
		if (i <= (Length - 1)) and (i >= 0) then
			return ItemArray[i]::Value
		else
			return null
		end if
	end method
	
	method public boolean Remove(var ind as integer)
	
		if (ind <= (Length - 1)) and (ind >= 0) then
			var ite as Item = ItemArray[ind]
			if ite::HasPrevious() then
				ite::Previous::Next = ite::Next
			else
				Head = ite::Next
			end if
			if ite::HasNext() then
				ite::Next::Previous = ite::Previous
			else
				Tail = ite::Previous
			end if
			
			label loop
			label cont
			
			var i as integer = ind - 1
			
			place loop
			
			if ind = Length - 1 then
				goto cont
			end if
			
			i = i + 1
			ite = ItemArray[i + 1]
			ite::Index = ite::Index - 1
			ItemArray[i] = ite
			
			
			if i = (Length - 2) then
				goto cont
			else
				goto loop
			end if
			
			place cont
			
			Length = Length - 1
			ItemArray[Length] = null
			return true
		else
			return false
		end if
		
	end method
	
	method public boolean SwapValues(var i as integer, var j as integer)
		if (i <= (Length - 1)) and (j <= (Length - 1))  and (i >= 0)  and (j >= 0) then
			var temp as object = ItemArray[i]::Value
			var itei as Item = ItemArray[i]
			var itej as Item = ItemArray[j]
			itei::Value = itej::Value
			itej::Value = temp
			return true
		else
			return false
		end if
	end method
	
	method public boolean CopyValue(var src as integer, var dest as integer)
		if (src <= (Length - 1)) and (dest <= (Length - 1)) and (src >= 0)  and (dest >= 0) then
			var temp as object = ItemArray[src]::Value
			var ited as Item = ItemArray[dest]
			ited::Value = temp
			return true
		else
			return false
		end if
	end method
	
	method public Item FindItem(var sd as SearchDelegate)
		
		if Length > 0 then
		
			label loop
			label cont
			
			var i as integer = -1
			
			place loop
			
			i = i + 1
			
			if sd::Invoke(ItemArray[i]::Value) then
				return ItemArray[i]
			end if
			
			if i = (Length - 1) then
				goto cont
			else
				goto loop
			end if
			
			place cont
		
		else
			return null
		end if
		
		return null
		
	end method
	
	method public boolean Remove(var o as object)
		
		if Length > 0 then
		
			label loop
			label cont
			
			var i as integer = -1
			
			place loop
			
			i = i + 1
			
			if ItemArray[i]::Value = o then
				Remove(i)
				return true
			end if
			
			if i = (Length - 1) then
				goto cont
			else
				goto loop
			end if
			
			place cont
		
		else
			return false
		end if
		
		return false
		
	end method
	
	method public static specialname ALList op_Subtraction(var lis as ALList, var ind as integer)
		lis::Remove(ind)
		return lis
	end method
	
	method public static specialname ALList op_Subtraction(var lis as ALList, var o as object)
		lis::Remove(o)
		return lis
	end method
	
	
	method public object FindItemValue(var sd as SearchDelegate)
		
		var ite as Item = FindItem(sd)
		if ite = null then
			return null
		else
			return ite::Value
		end if
		
	end method
	
	method public ALList FindItems(var sd as SearchDelegate)
		
		var al1 as ALList = new ALList()
		
		if Length > 0 then
		
			label loop
			label cont
			
			var i as integer = -1
			
			place loop
			
			i = i + 1
			
			if sd::Invoke(ItemArray[i]::Value)
				al1::Add(ItemArray[i]::Value)
			end if
			
			if i = (Length - 1) then
				goto cont
			else
				goto loop
			end if
			
			place cont
		
		end if
		
		return al1
		
	end method

end class
