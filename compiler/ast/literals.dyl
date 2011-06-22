//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Literal extends Token
end class

class public auto ansi StringLiteral extends Literal

field public boolean Conv
field public TypeTok TTok
field public string OrdOp
field public boolean MemberAccessFlg
field public Token MemberToAccess

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
Conv = false
TTok = new StringTok()
OrdOp = ""
MemberAccessFlg = false
MemberToAccess = new Token()
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
Conv = false
TTok = new StringTok()
OrdOp = ""
MemberAccessFlg = false
MemberToAccess = new Token()
end method

end class

class public auto ansi CharLiteral extends Literal

field public boolean Conv
field public TypeTok TTok
field public char CharVal
field public string OrdOp

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
CharVal = 'a'
Conv = false
TTok = new CharTok()
OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
CharVal = 'a'
Conv = false
TTok = new CharTok()
OrdOp = ""
end method

end class

class public auto ansi BooleanLiteral extends Literal

field public boolean Conv
field public TypeTok TTok
field public boolean BoolVal
field public string OrdOp
field public boolean DoNot

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
BoolVal = false
Conv = false
TTok = new BooleanTok()
OrdOp = ""
DoNot = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
BoolVal = false
Conv = false
TTok = new BooleanTok()
OrdOp = ""
DoNot = false
end method

end class


class public auto ansi NumberLiteral extends Literal

field public boolean Conv
field public TypeTok TTok
field public string OrdOp
field public boolean DoNot
field public boolean DoNeg

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
Conv = false
TTok = new TypeTok()
OrdOp = ""
DoNot = false
DoNeg = false
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
Conv = false
TTok = new TypeTok()
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
me::TTok = new IntegerTok()
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
me::TTok = new IntegerTok()
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
me::TTok = new DoubleTok()
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
me::TTok = new DoubleTok()
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
me::TTok = new SByteTok()
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
me::TTok = new SByteTok()
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
me::TTok = new ShortTok()
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
me::TTok = new ShortTok()
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
me::TTok = new LongTok()
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
me::TTok = new LongTok()
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
me::TTok = new SingleTok()
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
me::TTok = new SingleTok()
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
me::TTok = new UIntegerTok()
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
me::TTok = new UIntegerTok()
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
me::TTok = new ByteTok()
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
me::TTok = new ByteTok()
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
me::TTok = new UShortTok()
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
me::TTok = new UShortTok()
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
me::TTok = new ULongTok()
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
me::TTok = new ULongTok()
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
me::TTok = new IntPtrTok()
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
me::TTok = new IntPtrTok()
me::OrdOp = ""
me::DoNot = false
me::DoNeg = false
end method

end class
