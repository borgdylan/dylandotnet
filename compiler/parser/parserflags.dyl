//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit ParserFlags

field public static boolean IfFlag
field public static boolean AssemFlg
field public static boolean CmtFlag
field public static boolean NoOptFlag
field public static boolean NegFlag
field public static boolean NotFlag
field public static boolean ConvFlag
field public static boolean ArrFlag
field public static Expr ArrSlot
field public static boolean RefFlag
field public static boolean ValinrefFlag
field public static TypeTok ConvTyp
field public static string OrdOp
field public static boolean isChanged
field public static boolean ProcessTTokOnly
field public static boolean DurConvFlag
field public static boolean IdentFlag
field public static boolean MetCallFlag
field public static boolean MetChainFlag
field public static boolean StringFlag

method public static void ctor0()
AssemFlg = true
IfFlag = false
CmtFlag = false
NoOptFlag = false
NegFlag = false
NotFlag = false
ConvFlag = false
ArrFlag = false
ArrSlot = null
RefFlag = false
ValinrefFlag = false
ConvTyp = null
OrdOp = ""
isChanged = false
DurConvFlag = false
IdentFlag = false
MetCallFlag = false
MetChainFlag = false
ProcessTTokOnly = false
StringFlag = false
end method

method public static void SetUnaryFalse()
NegFlag = false
NotFlag = false
ConvFlag = false
ArrFlag = false
ArrSlot = null
RefFlag = false
ValinrefFlag = false
ConvTyp = null
OrdOp = ""
isChanged = false
DurConvFlag = false
end method

method public static Ident UpdateIdent(var id as Ident)
id::DoNeg = NegFlag
id::DoNot = NotFlag
id::Conv = ConvFlag
id::IsArr = ArrFlag
id::ArrLoc = ArrSlot
id::IsRef = RefFlag
id::IsValInRef = ValinrefFlag
id::TTok = ConvTyp
id::OrdOp = OrdOp
return id
end method

method public static NullLiteral UpdateNullLit(var id as NullLiteral)
return id
end method

method public static CharLiteral UpdateCharLit(var id as CharLiteral)
id::Conv = ConvFlag
id::TTok = ConvTyp
id::OrdOp = OrdOp
return id
end method

method public static StringLiteral UpdateStringLit(var id as StringLiteral)
id::Conv = ConvFlag
id::TTok = ConvTyp
id::OrdOp = OrdOp
return id
end method

method public static BooleanLiteral UpdateBoolLit(var id as BooleanLiteral)
id::DoNot = NotFlag
id::Conv = ConvFlag
id::TTok = ConvTyp
id::OrdOp = OrdOp
return id
end method

method public static NumberLiteral UpdateNumLit(var id as NumberLiteral)
id::DoNeg = NegFlag
id::DoNot = NotFlag
id::Conv = ConvFlag
id::TTok = ConvTyp
id::OrdOp = OrdOp
return id
end method

end class
