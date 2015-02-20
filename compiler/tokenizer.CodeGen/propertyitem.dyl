//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public PropertyItem

	field public string Name
	field public IKVM.Reflection.Type PropertyTyp
	field public PropertyBuilder PropertyBldr
	field public string ExplImplType
	field public TypeTok ExplType
	field public IEnumerable<of Attributes.Attribute> Attrs
	field public IKVM.Reflection.Type[] ParamTyps
	field public C5.LinkedList<of Expr> Params

	method public void PropertyItem(var nme as string, var typ as IKVM.Reflection.Type, var bld as PropertyBuilder, var attr as IEnumerable<of Attributes.Attribute>, var expl as string)
		mybase::ctor()
		Name = nme
		PropertyTyp = typ
		PropertyBldr = bld
		ExplImplType = string::Empty
		Attrs = attr
		ExplImplType = expl
		ParamTyps = IKVM.Reflection.Type::EmptyTypes
		Params = new C5.LinkedList<of Expr>()
	end method
	
	method public void PropertyItem()
		ctor(string::Empty, $IKVM.Reflection.Type$null, $PropertyBuilder$null, $IEnumerable<of Attributes.Attribute>$null, string::Empty)
	end method

	method public override string ToString()
		return Name + " : " + PropertyTyp::ToString()
	end method

end class
