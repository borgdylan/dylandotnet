//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public EndMethodStmt extends EndStmt
	method public override string ToString()
		return "end method"
	end method
end class

class public MethodStmt extends BlockStmt implements IExprBodyable

	field public C5.LinkedList<of Attributes.Attribute> Attrs
	field public MethodNameTok MethodName
	field public TypeTok RetTyp
	field public C5.LinkedList<of Expr> Params

	property public virtual autogen Expr ExprBody

	method public void MethodStmt()
		mybase::ctor(ContextType::Method)
		Attrs = new C5.LinkedList<of Attributes.Attribute>()
		MethodName = new MethodNameTok()
		Params = new C5.LinkedList<of Expr>()
		RetTyp = new TypeTok()
	end method

	method public void AddAttr(var attrtoadd as Attributes.Attribute)
		Attrs::Add(attrtoadd)
	end method

	method public void AddParam(var paramtoadd as Expr)
		Params::Add(paramtoadd)
	end method

	method public override boolean IsOneLiner(var ctx as IStmtContainer)
		if ctx::get_Context() == ContextType::Interface orelse get_ExprBody() isnot null then
			return true
		end if

		foreach a in Attrs
			if a is PinvokeImplAttr then
				return true
			elseif a is AbstractAttr then
				return true
			elseif a is PrototypeAttr then
				return true
			end if
		end for

		return false
	end method

	method public override boolean ValidateEnding(var stm as Stmt) => stm is EndMethodStmt
	method public override boolean ValidateContext(var ctx as ContextType) => ctx == ContextType::Class orelse ctx == ContextType::Interface

end class