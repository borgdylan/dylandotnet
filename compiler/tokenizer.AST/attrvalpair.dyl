//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public AttrValuePair extends Token

	field public Ident Name
	field public Expr ValueExpr
	
	method public void AttrValuePair(var nme as Ident, var exp as Expr)
		mybase::ctor()
		Name = nme
		ValueExpr = exp
	end method
	
	method public void AttrValuePair()
		mybase::ctor()
		//ctor($Ident$null, $Expr$null)
	end method

end class
