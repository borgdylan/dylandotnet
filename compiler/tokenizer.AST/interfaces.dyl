//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract interface IUnaryOperatable
	property public hidebysig virtual abstract newslot autogen string OrdOp
end class

class public auto ansi abstract interface IConvable implements IUnaryOperatable
	property public hidebysig virtual abstract newslot autogen boolean Conv
	property public hidebysig virtual abstract newslot autogen TypeTok TTok
end class

class public auto ansi abstract interface INegatable implements IUnaryOperatable
	property public hidebysig virtual abstract newslot autogen boolean DoNeg
end class

class public auto ansi abstract interface INotable implements IUnaryOperatable
	property public hidebysig virtual abstract newslot autogen boolean DoNot
end class

class public auto ansi abstract interface IIncDecable implements IUnaryOperatable
	property public hidebysig virtual abstract newslot autogen boolean DoInc
	property public hidebysig virtual abstract newslot autogen boolean DoDec
end class

class public auto ansi abstract interface IHasConstraints
	property public hidebysig virtual newslot abstract boolean HasConstraints
		get
	end property
end class

class public auto ansi abstract interface IConstrainable implements IHasConstraints
	property public hidebysig virtual newslot abstract C5.HashDictionary<of string, C5.LinkedList<of Token> > Constraints
		get
	end property

	method public hidebysig virtual abstract newslot void AddConstraint(var param as string, var ctr as Token)
end class