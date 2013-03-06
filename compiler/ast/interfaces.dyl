//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract interface IUnaryOperatable
	
	method public hidebysig virtual specialname abstract newslot string get_OrdOp()
	method public hidebysig virtual specialname abstract newslot void set_OrdOp(var oo as string)
	
	property none string OrdOp
		get get_OrdOp()
		set set_OrdOp()
	end property
	
end class

class public auto ansi abstract interface IConvable implements IUnaryOperatable
	
	method public hidebysig virtual specialname abstract newslot boolean get_Conv()
	method public hidebysig virtual specialname abstract newslot void set_Conv(var c as boolean)
	
	property none boolean Conv
		get get_Conv()
		set set_Conv()
	end property
	
	method public hidebysig virtual specialname abstract newslot TypeTok get_TTok()
	method public hidebysig virtual specialname abstract newslot void set_TTok(var tt as TypeTok)
	
	property none TypeTok TTok
		get get_TTok()
		set set_TTok()
	end property
	
end class

class public auto ansi abstract interface INegatable implements IUnaryOperatable
	
	method public hidebysig virtual specialname abstract newslot boolean get_DoNeg()
	method public hidebysig virtual specialname abstract newslot void set_DoNeg(var dn as boolean)
	
	property none boolean DoNeg
		get get_DoNeg()
		set set_DoNeg()
	end property
	
end class