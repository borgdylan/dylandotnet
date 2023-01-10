//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens

class public abstract Attribute extends NonExprToken
end class

class public abstract VisibilityAttr extends Attributes.Attribute
end class

// hidebysig
class public sealed HideBySigAttr extends Attributes.Attribute
	method public override string ToString() => "hidebysig"
end class

// specialname
class public sealed SpecialNameAttr extends Attributes.Attribute
	method public override string ToString() => "specialname"
end class

// private
class public sealed PrivateAttr extends VisibilityAttr
	method public override string ToString() => "private"
end class

// family
class public sealed FamilyAttr extends VisibilityAttr
	method public override string ToString() => "family"
end class

// public
class public sealed PublicAttr extends VisibilityAttr
	method public override string ToString() => "public"
end class

// static
class public sealed StaticAttr extends Attributes.Attribute
	method public override string ToString() => "static"
end class

// virtual
class public sealed VirtualAttr extends Attributes.Attribute
	method public override string ToString() => "virtual"
end class

// abstract
class public sealed AbstractAttr extends Attributes.Attribute
	method public override string ToString() => "abstract"
end class

// prototype
class public sealed PrototypeAttr extends Attributes.Attribute
	method public override string ToString() => "prototype"
end class

// partial
class public sealed PartialAttr extends Attributes.Attribute
	method public override string ToString() => "partial"
end class

// newslot
class public sealed NewSlotAttr extends Attributes.Attribute
	method public override string ToString() => "newslot"
end class

//pinvokeimpl
class public sealed PinvokeImplAttr extends Attributes.Attribute
	method public override string ToString() => "pinvokeimpl"
end class

//// hasdefault
//class public sealed HasDefaultAttr extends Attributes.Attribute
//	method public override string ToString()
//		return "hasdefault"
//	end method
//end class

// none
class public sealed NoneAttr extends Attributes.Attribute
	method public override string ToString() => "none"
end class

// autochar
class public sealed AutoClassAttr extends Attributes.Attribute
	method public override string ToString() => "autochar"
end class

// ansi
class public sealed AnsiClassAttr extends Attributes.Attribute
	method public override string ToString()
		return "ansi"
	end method
end class

// beforefieldinit
class public sealed BeforeFieldInitAttr extends Attributes.Attribute
	method public override string ToString() => "beforefieldinit"
end class

// sealed
class public sealed SealedAttr extends Attributes.Attribute
	method public override string ToString() => "sealed"
end class

// interface
class public sealed InterfaceAttr extends Attributes.Attribute
	method public override string ToString() => "interface"
end class

// initonly
class public sealed InitOnlyAttr extends Attributes.Attribute
	method public override string ToString() => "initonly"
end class

// literal
class public sealed LiteralAttr extends Attributes.Attribute
	method public override string ToString() => "literal"
end class

// final
class public sealed FinalAttr extends Attributes.Attribute
	method public override string ToString() => "final"
end class

// assembly
class public sealed AssemblyAttr extends VisibilityAttr
	method public override string ToString() => "assembly"
end class

// famandassem
class public sealed FamANDAssemAttr extends VisibilityAttr
	method public override string ToString() => "famandassem"
end class

// famorassem
class public sealed FamORAssemAttr extends VisibilityAttr
	method public override string ToString() => "famorassem"
end class

// sequential
class public sealed SequentialLayoutAttr extends Attributes.Attribute
	method public override string ToString() => "sequential"
end class

// serializable
class public sealed SerializableAttr extends Attributes.Attribute
	method public override string ToString() => "serializable"
end class

// notserializable
class public sealed NotSerializedAttr extends Attributes.Attribute
	method public override string ToString() => "notserialized"
end class

// auto
class public sealed AutoLayoutAttr extends Attributes.Attribute
	method public override string ToString() => "auto"
end class

// autogen
class public sealed AutoGenAttr extends Attributes.Attribute
	method public override string ToString() => "autogen"
end class

// override
class public sealed OverrideAttr extends Attributes.Attribute
	method public override string ToString() => "override"
end class