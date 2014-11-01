//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public VarItem

	field public string Name
	// t for loc f for arg
	field public boolean LocArg
	field public integer Index
	field public IKVM.Reflection.Type VarTyp
	field public boolean Used
	field public boolean Stored
	field public integer Line
	field public C5.TreeSet<of integer> StoreLines

	method public void VarItem()
		mybase::ctor()
		Name = String::Empty
		Index = -1
		StoreLines = new C5.TreeSet<of integer>()
	end method

	method public void VarItem(var nme as string, var la as boolean, var ind as integer, var typ as IKVM.Reflection.Type)
		mybase::ctor()
		Name = nme
		LocArg = la
		Index = ind
		VarTyp = typ
		StoreLines = new C5.TreeSet<of integer>()
	end method

	method public void VarItem(var nme as string, var la as boolean, var ind as integer, var typ as IKVM.Reflection.Type, var line as integer)
		mybase::ctor()
		Name = nme
		LocArg = la
		Index = ind
		VarTyp = typ
		Line = line
		StoreLines = new C5.TreeSet<of integer>()
	end method
	
	method public override string ToString()
		return Name
	end method

end class
