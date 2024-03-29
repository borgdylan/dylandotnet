//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import Managed.Reflection.Emit

class public sealed MethodItem

	field public string Name
	field public Managed.Reflection.Type MethodTyp
	field public Managed.Reflection.Type[] ParamTyps
	field public MethodBuilder MethodBldr
	field public integer NrGenParams

	method public void MethodItem(var nme as string, var typ as Managed.Reflection.Type, var ptyps as Managed.Reflection.Type[], var bld as MethodBuilder)
		mybase::ctor()
		Name = nme
		MethodTyp = typ
		MethodBldr = bld
		ParamTyps = ptyps
		NrGenParams = 0
	end method

	method public void MethodItem()
		ctor(string::Empty, $Managed.Reflection.Type$null, Managed.Reflection.Type::EmptyTypes, $MethodBuilder$null)
	end method

	method public override string ToString() => i"{Name} : {$string$ParamTyps[l]} : {MethodTyp::ToString()}"

end class
