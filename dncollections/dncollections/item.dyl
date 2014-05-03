//    dncollections.dll dylan.NET.Collections Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi Item extends Item<of object>

	method public void Item()
		me::ctor()
	end method
	
	method public void Item(var o as object)
		me::ctor(o)
	end method

	method public hidebysig virtual Item<of object> MakeCopy()
		return new Item(Value)
	end method
	
	method public Item<of object> MakeCopy2()
		return Item<of object>::MakeCopy(me)
	end method
	
	method public static Item MakeCopy(var ite as Item)
		return new Item(ite::Value)
	end method
	
end class
