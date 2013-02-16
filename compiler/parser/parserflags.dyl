//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Flags

	field public boolean IfFlag
	//field public boolean AssemFlg
	field public boolean CmtFlag
	field public boolean NoOptFlag
	field public boolean AsFlag
	field public boolean NegFlag
	field public boolean NotFlag
	field public boolean ConvFlag
	field public boolean ArrFlag
	field public Expr ArrSlot
	field public boolean RefFlag
	field public boolean ValinrefFlag
	field public TypeTok ConvTyp
	field public string OrdOp
	field public boolean isChanged
	field public boolean ProcessTTokOnly
	field public boolean DurConvFlag
	field public boolean IdentFlag
	field public boolean MetCallFlag
	field public boolean MetChainFlag
	field public boolean StringFlag
	field public string CurPath

	method public void Flags()
		me::ctor()
		//true only for first parser
		//AssemFlg = false
		//--------------------------
		IfFlag = false
		CmtFlag = false
		NoOptFlag = false
		AsFlag = false
		NegFlag = false
		NotFlag = false
		ConvFlag = false
		ArrFlag = false
		ArrSlot = null
		RefFlag = false
		ValinrefFlag = false
		ConvTyp = null
		OrdOp = String::Empty
		isChanged = false
		DurConvFlag = false
		IdentFlag = false
		MetCallFlag = false
		MetChainFlag = false
		ProcessTTokOnly = false
		StringFlag = false
		CurPath = String::Empty
	end method

	method public void SetUnaryFalse()
		NegFlag = false
		NotFlag = false
		ConvFlag = false
		ArrFlag = false
		ArrSlot = null
		RefFlag = false
		ValinrefFlag = false
		ConvTyp = null
		OrdOp = String::Empty
		isChanged = false
		DurConvFlag = false
	end method
	
	method public Ident UpdateIdent(var id as Ident)
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

	method public NullLiteral UpdateNullLit(var id as NullLiteral)
		id::Conv = ConvFlag
		id::TTok = ConvTyp
		return id
	end method
	
	method public MeTok UpdateMeTok(var id as MeTok)
		id::Conv = ConvFlag
		id::TTok = ConvTyp
		return id
	end method
	
	method public CharLiteral UpdateCharLit(var id as CharLiteral)
		id::Conv = ConvFlag
		id::TTok = ConvTyp
		id::OrdOp = OrdOp
		return id
	end method

	method public StringLiteral UpdateStringLit(var id as StringLiteral)
		id::Conv = ConvFlag
		id::TTok = ConvTyp
		id::OrdOp = OrdOp
		return id
	end method
	
	method public BooleanLiteral UpdateBoolLit(var id as BooleanLiteral)
		id::DoNot = NotFlag
		id::Conv = ConvFlag
		id::TTok = ConvTyp
		id::OrdOp = OrdOp
		return id
	end method

	method public NumberLiteral UpdateNumLit(var id as NumberLiteral)
		id::DoNeg = NegFlag
		id::DoNot = NotFlag
		id::Conv = ConvFlag
		id::TTok = ConvTyp
		id::OrdOp = OrdOp
		return id
	end method
	
	method public void ResetMCISFlgs()
		MetCallFlag = false
		IdentFlag = false
		StringFlag = false
	end method

end class
