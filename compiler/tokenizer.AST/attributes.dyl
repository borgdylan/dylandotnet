//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public abstract Attribute extends NonExprToken
end class

class public abstract VisibilityAttr extends Attributes.Attribute
end class

// hidebysig
class public HideBySigAttr extends Attributes.Attribute
	method public override string ToString()
		return "hidebysig"
	end method
end class

// specialname
class public SpecialNameAttr extends Attributes.Attribute
	method public override string ToString()
		return "specialname"
	end method
end class

// private 
class public PrivateAttr extends VisibilityAttr
	method public override string ToString()
		return "private"
	end method
end class

// family
class public FamilyAttr extends VisibilityAttr
	method public override string ToString()
		return "family"
	end method
end class

// public
class public PublicAttr extends VisibilityAttr
	method public override string ToString()
		return "public"
	end method
end class

// static
class public StaticAttr extends Attributes.Attribute
	method public override string ToString()
		return "static"
	end method
end class

// virtual
class public VirtualAttr extends Attributes.Attribute
	method public override string ToString()
		return "virtual"
	end method
end class

// abstract
class public AbstractAttr extends Attributes.Attribute
	method public override string ToString()
		return "abstract"
	end method
end class

// prototype
class public PrototypeAttr extends Attributes.Attribute
	method public override string ToString()
		return "prototype"
	end method
end class

// partial
class public PartialAttr extends Attributes.Attribute
	method public override string ToString()
		return "partial"
	end method
end class

// newslot
class public NewSlotAttr extends Attributes.Attribute
	method public override string ToString()
		return "newslot"
	end method
end class

//pinvokeimpl
class public PinvokeImplAttr extends Attributes.Attribute
	method public override string ToString()
		return "pinvokeimpl"
	end method
end class

//// hasdefault
//class public HasDefaultAttr extends Attributes.Attribute
//	method public override string ToString()
//		return "hasdefault"
//	end method
//end class

// none
class public NoneAttr extends Attributes.Attribute
	method public override string ToString()
		return "none"
	end method
end class

// autochar
class public AutoClassAttr extends Attributes.Attribute
	method public override string ToString()
		return "autochar"
	end method
end class

// ansi
class public AnsiClassAttr extends Attributes.Attribute
	method public override string ToString()
		return "ansi"
	end method
end class

// beforefieldinit
class public BeforeFieldInitAttr extends Attributes.Attribute
	method public override string ToString()
		return "beforefieldinit"
	end method
end class

// sealed
class public SealedAttr extends Attributes.Attribute
	method public override string ToString()
		return "sealed"
	end method
end class

// interface
class public InterfaceAttr extends Attributes.Attribute
	method public override string ToString()
		return "interface"
	end method
end class

// initonly
class public InitOnlyAttr extends Attributes.Attribute
	method public override string ToString()
		return "initonly"
	end method
end class

// literal
class public LiteralAttr extends Attributes.Attribute
	method public override string ToString()
		return "literal"
	end method
end class

// final
class public FinalAttr extends Attributes.Attribute
	method public override string ToString()
		return "final"
	end method
end class


// assembly
class public AssemblyAttr extends VisibilityAttr
	method public override string ToString()
		return "assembly"
	end method
end class

// famandassem
class public FamANDAssemAttr extends VisibilityAttr
	method public override string ToString()
		return "famandassem"
	end method
end class

// famorassem
class public FamORAssemAttr extends VisibilityAttr
	method public override string ToString()
		return "famorassem"
	end method
end class

// sequential
class public SequentialLayoutAttr extends Attributes.Attribute
	method public override string ToString()
		return "sequential"
	end method
end class

// auto
class public AutoLayoutAttr extends Attributes.Attribute
	method public override string ToString()
		return "auto"
	end method
end class

// autogen
class public AutoGenAttr extends Attributes.Attribute
	method public override string ToString()
		return "autogen"
	end method
end class

// override
class public OverrideAttr extends Attributes.Attribute
	method public override string ToString()
		return "override"
	end method
end class