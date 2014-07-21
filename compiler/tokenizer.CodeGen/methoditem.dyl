//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public MethodItem

	field public string Name
	field public IKVM.Reflection.Type MethodTyp
	field public IKVM.Reflection.Type[] ParamTyps
	field public MethodBuilder MethodBldr
	field public integer NrGenParams

	method public void MethodItem(var nme as string, var typ as IKVM.Reflection.Type, var ptyps as IKVM.Reflection.Type[], var bld as MethodBuilder)
		mybase::ctor()
		Name = nme
		MethodTyp = typ
		MethodBldr = bld
		ParamTyps = ptyps
		NrGenParams = 0
	end method
	
	method public void MethodItem()
		ctor(string::Empty, $IKVM.Reflection.Type$null, new IKVM.Reflection.Type[0], $MethodBuilder$null)
	end method

	method public hidebysig virtual string ToString()
		return Name + " : " + $string$ParamTyps[l] + " : " + MethodTyp::ToString()
	end method

end class
