//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

interface public IUnaryOperatable
	property public autogen string OrdOp
end interface

interface public IConvable implements IUnaryOperatable
	property public autogen boolean Conv
	property public autogen TypeTok TTok
end interface

interface public INegatable implements IUnaryOperatable
	property public autogen boolean DoNeg
end interface

interface public INotable implements IUnaryOperatable
	property public autogen boolean DoNot
end interface

interface public IIncDecable implements IUnaryOperatable
	property public autogen boolean DoInc
	property public autogen boolean DoDec
end interface

interface public IMayHaveConstraints
	property public boolean MayHaveConstraints
		get
	end property
end interface

interface public IConstrainable implements IMayHaveConstraints
	property public autogen initonly C5.HashDictionary<of string, C5.LinkedList<of Token> > Constraints

	method public void AddConstraint(var param as string, var ctr as Token)
end interface

interface public IExprBodyable

	property public autogen Expr ExprBody

end interface