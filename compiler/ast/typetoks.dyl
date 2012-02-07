//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi TypeTok extends Token

field public boolean IsArray
field public boolean IsByRef
field public Type RefTyp
field public string OrdOp

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
IsArray = false
IsByRef = false
RefTyp = null
OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
IsArray = false
IsByRef = false
RefTyp = null
OrdOp = ""
end method

end class

class public auto ansi GenericTypeTok extends TypeTok

field public TypeTok[] Params

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = null
me::OrdOp = ""
Params = newarr TypeTok 0
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = null
me::OrdOp = ""
Params = newarr TypeTok 0
end method

method public static void AddParam(var param as TypeTok)

var len as integer = Params[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as TypeTok[] = newarr TypeTok destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = Params[i]

end if

if i = stopel then
goto cont
else
if stopel <> -1 then
goto loop
else
goto cont
end if
end if

place cont

destarr[len] = param

Params = destarr

end method

end class


class public auto ansi StringTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype string
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype string
me::OrdOp = ""
end method

end class

class public auto ansi IntegerTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype integer
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype integer
me::OrdOp = ""
end method

end class

class public auto ansi DoubleTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype double
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype double
me::OrdOp = ""
end method

end class

class public auto ansi BooleanTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype boolean
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype boolean
me::OrdOp = ""
end method

end class

class public auto ansi CharTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype char
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype char
me::OrdOp = ""
end method

end class

class public auto ansi DecimalTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype decimal
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype decimal
me::OrdOp = ""
end method

end class

class public auto ansi LongTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype long
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype long
me::OrdOp = ""
end method

end class

class public auto ansi SByteTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype sbyte
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype sbyte
me::OrdOp = ""
end method

end class

class public auto ansi ShortTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype short
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype short
me::OrdOp = ""
end method

end class

class public auto ansi SingleTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype single
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype single
me::OrdOp = ""
end method

end class

class public auto ansi ObjectTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype object
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype object
me::OrdOp = ""
end method

end class

class public auto ansi VoidTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype void
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype void
me::OrdOp = ""
end method

end class

class public auto ansi UIntegerTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype UInt32
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype UInt32
me::OrdOp = ""
end method

end class

class public auto ansi ULongTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype UInt64
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype UInt64
me::OrdOp = ""
end method

end class

class public auto ansi ByteTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype Byte
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype Byte
me::OrdOp = ""
end method

end class

class public auto ansi UShortTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype UInt16
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype UInt16
me::OrdOp = ""
end method

end class

class public auto ansi IntPtrTok extends TypeTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype IntPtr
me::OrdOp = ""
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
me::IsArray = false
me::IsByRef = false
me::RefTyp = gettype IntPtr
me::OrdOp = ""
end method

end class
