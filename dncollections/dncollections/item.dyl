//    dncollections.dll dylan.NET.Collections Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace dylan.NET.Collections

	class public auto ansi Item<of T>
		
		field public T Value
		field public Item<of T> Next
		field public Item<of T> Previous
		field public integer Index
		
		method public void Item()
			me::ctor()
			Next = null
			Previous = null
			Index = -1
			Value = default T
		end method
		
		method public void Item(var o as T)
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
		
		method public Item<of T> GoNext()
			if HasNext() then
				Next::Index = ++Index
			end if
			return Next
		end method
		
		method public Item<of T> GoPrevious()
			if HasPrevious() then
				Previous::Index = --Index
			end if
			return Previous
		end method
		
		method public hidebysig virtual Item<of T> MakeCopy()
			return new Item<of T>(Value)
		end method
		
		method public hidebysig virtual string ToString()
			return $string$Index + #ternary {$object$Value == null ? ":null", ":" + Value::ToString()}
		end method

	end class

	class public auto ansi Item
		
		method public static Item<of T> MakeCopy<of T>(var ite as Item<of T>)
			return ite::MakeCopy()
		end method
	
	end class
	
end namespace
