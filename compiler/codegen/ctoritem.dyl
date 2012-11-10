//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi CtorItem

	field public IKVM.Reflection.Type[] ParamTyps
	field public ConstructorBuilder CtorBldr

	method public void CtorItem()
		me::ctor()
		CtorBldr = null
		ParamTyps = new IKVM.Reflection.Type[0]
	end method

	method public void CtorItem(var ptyps as IKVM.Reflection.Type[], var bld as ConstructorBuilder)
		me::ctor()
		CtorBldr = bld
		ParamTyps = ptyps
	end method

	method public hidebysig virtual string ToString()
		return "ctor : " + $string$ParamTyps[l]
	end method

end class
