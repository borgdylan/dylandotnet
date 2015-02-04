//    dncollections.dll dylan.NET.Collections Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi ALList<of U>
	
	field public Item<of U> Head
	field public Item<of U> Tail
	field public Item<of U>[] ItemArray
	field public integer Length
	field public integer Capacity
	
	method public void ALList()
		 me::ctor()
		 Head = null
		 Tail = null
		 Length = 0
		 ItemArray = new Item<of U>[10]
		 Capacity = ItemArray[l]
	end method
	
	method public void Add(var ite as Item<of U>)
		
		if Length = Capacity then
			var na = new Item<of U>[ItemArray[l] + 10]
			for i = 0 upto --Length
				na[i] = ItemArray[i]
			end for
			ItemArray = na
			Capacity = ItemArray[l]
		end if
		
		if Head == null then
			Head = ite
			Tail = Head
			Head::Previous = null
			Head::Next = null
			ItemArray[Length] = ite
			Head::Index = Length
		else
			Tail::Next = ite
			ite::Previous = Tail
			ite::Next = null
			Tail = ite
			ItemArray[Length] = ite
			ite::Index = Length
		end if
		Length++

	end method
	
	method public void Add(var o as U)
		Add(new Item<of U>(o))
	end method
	
	method public void AddAll(var al1 as ALList<of U>)
		var ite as Item<of U> = null
		if al1::Length > 0 then
			do
				ite = #ternary {ite == null ? al1::Head, ite::GoNext()}
				Add(ite::MakeCopy())
			while ite::HasNext()
		end if
	end method
	
	method public static specialname ALList<of U> op_Addition(var lis as ALList<of U>, var ite as Item<of U>)
		lis::Add(ite)
		return lis
	end method
	
	method public static specialname ALList<of U> op_Addition(var lis as ALList<of U>, var o as U)
		lis::Add(o)
		return lis
	end method
	
	method public Item<of U> GetItem(var i as integer)
		if (i <= (Length - 1)) and (i >= 0) then
			var ite =  ItemArray[i]
			ite::Index = i
			return ite
		else
			return null
		end if
	end method
	
	method public U GetItemValue(var i as integer)
		if (i <= (Length - 1)) and (i >= 0) then
			return ItemArray[i]::Value
		else
			return default U
		end if
	end method
	
	method public boolean Remove(var ind as integer)
	
		if (ind <= (Length - 1)) and (ind >= 0) then
			var ite = ItemArray[ind]
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
			
			var i as integer = ind - 1
			
			do
				if ind == --Length then
					break
				end if
				i++
				ite = ItemArray[++i]
				ite::Index = --ite::Index
				ItemArray[i] = ite
			until i = (Length - 2)
			
			Length--
			ItemArray[Length] = null
			return true
		else
			return false
		end if
		
	end method
	
	method public boolean SwapValues(var i as integer, var j as integer)
		if (i <= --Length) and (j <= --Length)  and (i >= 0)  and (j >= 0) then
			var temp = ItemArray[i]::Value
			var itei = ItemArray[i]
			var itej = ItemArray[j]
			itei::Value = itej::Value
			itej::Value = temp
			return true
		else
			return false
		end if
	end method
	
	method public boolean CopyValue(var src as integer, var dest as integer)
		if (src <= --Length) and (dest <= --Length) and (src >= 0)  and (dest >= 0) then
			var temp = ItemArray[src]::Value
			var ited = ItemArray[dest]
			ited::Value = temp
			return true
		else
			return false
		end if
	end method
	
	method public Item<of U> FindItem(var sd as Func<of U, boolean>)
		
		if Length > 0 then
			var i as integer = -1
			do until i == --Length
				i++
				if sd::Invoke(ItemArray[i]::Value) then
					return ItemArray[i]
				end if
			end do
		else
			return null
		end if
		
		return null
		
	end method
	
	method public boolean Remove(var o as object)
		
		if Length > 0 then
			var i as integer = -1
			do until i = --Length
				i++
				if ItemArray[i]::Value = o then
					Remove(i)
					return true
				end if
			end do
		else
			return false
		end if
		
		return false
		
	end method
	
	method public static specialname ALList<of U> op_Subtraction(var lis as ALList<of U>, var ind as integer)
		lis::Remove(ind)
		return lis
	end method
	
	method public static specialname ALList<of U> op_Subtraction(var lis as ALList<of U>, var o as object)
		lis::Remove(o)
		return lis
	end method
	
	method public U FindItemValue(var sd as Func<of U, boolean>)	
		var ite = FindItem(sd)
		if ite == null then
			return null
		else
			return ite::Value
		end if
	end method
	
	method public ALList<of U> FindItems(var sd as Func<of U, boolean>)
		
		var al1 as ALList<of U> = new ALList<of U>()
		
		if Length > 0 then
			var i as integer = -1
			do until i == --Length
				i++		
				if sd::Invoke(ItemArray[i]::Value)
					al1::Add(ItemArray[i]::Value)
				end if
			end do
		end if
		
		return al1
		
	end method
	
	method public hidebysig virtual string ToString()
		
		var i as integer = -1
		var sb as StringBuilder = new StringBuilder()
		sb::Append("{")
		
		do until i = --Length
			i++
			if $object$GetItemValue(i) == null then
				sb::Append("null")
			else
				sb::Append(GetItemValue(i)::ToString())
			end if
			if i != --Length then
				sb::Append(",")
			end if
		end do
		
		sb::Append("}")
		return sb::ToString()
	end method

	method private boolean Filter(var cur as Item<of U>)
		return cur != null
	end method

	method private Item<of U> MoveNext(var cur as Item<of U>)
		return cur:GoNext()
	end method

	method private U Extract(var cur as Item<of U>)
		return cur::Value
	end method

	method public IEnumerable<of U> AsEnumerable()
		return EnumerableEx::Generate<of Item<of U>, U>(Head, _
			new Func<of Item<of U>, boolean>(Filter), _
			new Func<of Item<of U>, Item<of U> >(MoveNext), _
			new Func<of Item<of U>, U>(Extract))
	end method

end class