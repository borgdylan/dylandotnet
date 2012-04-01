//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

// LtExpr CondOp RtExpr
class public auto ansi ConditionalExpr extends Expr

	field public Expr LtExpr
	field public Expr RtExpr
	field public ConditionalOp CondOP

	method public void ConditionalExpr()
		me::ctor()
		LtExpr = new Expr()
		RtExpr = new Expr()
		CondOP = new ConditionalOp()
	end method

end class
