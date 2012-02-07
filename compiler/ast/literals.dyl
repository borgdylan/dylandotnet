//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Literal extends Token

field public TypeTok LitTyp
field public boolean Conv
field public TypeTok TTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
LitTyp = null
Conv = false
TTok = null
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
LitTyp = null
Conv = false
TTok = null
end method

end class

class public auto ansi NullLiteral extends Literal

field public object NullVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NullVal = null
me::Conv = false
me::LitTyp = new ObjectTok()
me::TTok = null
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NullVal = null
me::Conv = false
me::LitTyp = new ObjectTok()
me::TTok = null
end method

end class

class public auto ansi ConstLiteral extends Literal

field public object ConstVal
field public System.Type ExtTyp
field public System.Type IntTyp

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
ConstVal = null
me::Conv = false
me::LitTyp = new ObjectTok()
me::TTok = null
ExtTyp = null
IntTyp = null
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
ConstVal = null
me::Conv = false
me::LitTyp = new ObjectTok()
me::TTok = null
ExtTyp = null
IntTyp = null
end method

end class

class public auto ansi StringLiteral extends Literal

field public string OrdOp
field public boolean MemberAccessFlg
field public Token MemberToAccess

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::Conv = false
me::LitTyp = new StringTok()
me::TTok = null
OrdOp = ""
MemberAccessFlg = false
MemberToAccess = new Token()
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::Conv = false
me::LitTyp = new StringTok()
me::TTok = null
OrdOp = ""
MemberAccessFlg = false
MemberToAccess = new Token()
end method

end class

class public auto ansi CharLiteral extends Literal

field public char CharVal
field public string OrdOp

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
CharVal = 'a'
me::Conv = false
me::LitTyp = new CharTok()
me::TTok = null
OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
CharVal = 'a'
me::Conv = false
me::LitTyp = new CharTok()
me::TTok = null
OrdOp = ""
end method

end class

class public auto ansi BooleanLiteral extends Literal

field public boolean BoolVal
field public string OrdOp
field public boolean DoNot

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
BoolVal = false
me::Conv = false
me::LitTyp = new BooleanTok()
me::TTok = null
OrdOp = ""
DoNot = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
BoolVal = false
me::Conv = false
me::LitTyp = new BooleanTok()
me::TTok = null
OrdOp = ""
DoNot = false
end method

end class


class public auto ansi NumberLiteral extends Literal

field public string OrdOp
field public boolean DoNot
field public boolean DoNeg

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::Conv = false
me::LitTyp = null
me::TTok = null
OrdOp = ""
DoNot = false
DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::Conv = false
me::LitTyp = null
me::TTok = null
OrdOp = ""
DoNot = false
DoNeg = false
end method

end class

class public auto ansi IntLiteral extends NumberLiteral

field public integer NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = 0i
me::Conv = false
me::LitTyp = new IntegerTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = 0i
me::Conv = false
me::LitTyp = new IntegerTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi DoubleLiteral extends NumberLiteral

field public double NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = 0d
me::Conv = false
me::LitTyp = new DoubleTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = 0d
me::Conv = false
me::LitTyp = new DoubleTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi SByteLiteral extends NumberLiteral

field public sbyte NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = 0b
me::Conv = false
me::LitTyp = new SByteTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = 0b
me::Conv = false
me::LitTyp = new SByteTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi ShortLiteral extends NumberLiteral

field public short NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = 0s
me::Conv = false
me::LitTyp = new ShortTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = 0s
me::Conv = false
me::LitTyp = new ShortTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi LongLiteral extends NumberLiteral

field public long NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = 0l
me::Conv = false
me::LitTyp = new LongTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = 0l
me::Conv = false
me::LitTyp = new LongTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi FloatLiteral extends NumberLiteral

field public single NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = 0f
me::Conv = false
me::LitTyp = new SingleTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = 0f
me::Conv = false
me::LitTyp = new SingleTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi UIntLiteral extends NumberLiteral

field public System.UInt32 NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = Convert::ToUInt32(0i)
me::Conv = false
me::LitTyp = new UIntegerTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = Convert::ToUInt32(0i)
me::Conv = false
me::LitTyp = new UIntegerTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class
class public auto ansi ByteLiteral extends NumberLiteral

field public System.Byte NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = Convert::ToByte(0b)
me::Conv = false
me::LitTyp = new ByteTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = Convert::ToByte(0b)
me::Conv = false
me::LitTyp = new ByteTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi UShortLiteral extends NumberLiteral

field public SYstem.UInt16 NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = Convert::ToUInt16(0s)
me::Conv = false
me::LitTyp = new UShortTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = Convert::ToUInt16(0s)
me::Conv = false
me::LitTyp = new UShortTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi ULongLiteral extends NumberLiteral

field public System.UInt64 NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = Convert::ToUInt64(0l)
me::Conv = false
me::LitTyp = new ULongTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = Convert::ToUInt64(0l)
me::Conv = false
me::LitTyp = new ULongTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class

class public auto ansi IntPtrLiteral extends NumberLiteral

field public IntPtr NumVal

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
NumVal = new IntPtr(0)
me::Conv = false
me::LitTyp = new IntPtrTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
NumVal = new IntPtr(0)
me::Conv = false
me::LitTyp = new IntPtrTok()
me::TTok = null
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class
