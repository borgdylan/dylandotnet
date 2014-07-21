//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public Flags

	field public boolean IfFlag
	//field public boolean AssemFlg
	field public boolean CmtFlag
	field public boolean NoOptFlag
	field public boolean AsFlag
	field public boolean ForFlag
	field public boolean NegFlag
	field public boolean NotFlag
	field public boolean IncFlag
	field public boolean DecFlag
	field public boolean ConvFlag
	field public boolean RefFlag
	field public boolean ValinrefFlag
	field public TypeTok ConvTyp
	field public string OrdOp
	field public boolean isChanged
	field public boolean ProcessTTokOnly
	field public boolean DurConvFlag
	field public boolean IdentFlag
	field public boolean MetCallFlag
	field public boolean CtorFlag
	field public boolean MetChainFlag
	field public boolean StringFlag
	field public string CurPath

	method public void Flags()
		mybase::ctor()
		//true only for first parser
		//AssemFlg = false
		//--------------------------

		//IfFlag = false
		//CmtFlag = false
		//NoOptFlag = false
		//AsFlag = false
		//ForFlag = false
		//NegFlag = false
		//NotFlag = false
		//IncFlag = false
		//DecFlag = false
		//ConvFlag = false
		//RefFlag = false
		//ValinrefFlag = false
		//ConvTyp = null
		OrdOp = string::Empty
		//isChanged = false
		//DurConvFlag = false
		//IdentFlag = false
		//CtorFlag = false
 		//MetCallFlag = false
		//MetChainFlag = false
		//ProcessTTokOnly = false
		//StringFlag = false
		CurPath = string::Empty
	end method

	method public void SetUnaryFalse()
		NegFlag = false
		NotFlag = false
		IncFlag = false
		DecFlag = false
		ConvFlag = false
		RefFlag = false
		ValinrefFlag = false
		ConvTyp = null
		OrdOp = string::Empty
		isChanged = false
		DurConvFlag = false
	end method
	
	method public void UpdateToken(var iuo as IUnaryOperatable)
		iuo::set_OrdOp(OrdOp)
		if iuo is IConvable then
			var id = $IConvable$iuo
			id::set_Conv(ConvFlag)
			id::set_TTok(ConvTyp)
		end if
		if iuo is INegatable then
			var id = $INegatable$iuo
			id::set_DoNeg(NegFlag)
		end if
		if iuo is INotable then
			var id = $INotable$iuo
			id::set_DoNot(NotFlag)
		end if
		if iuo is IIncDecable then
			var id = $IIncDecable$iuo
			id::set_DoInc(IncFlag)
			id::set_DoDec(DecFlag)
		end if
	end method
	
	method public Ident UpdateIdent(var id as Ident)
		id::IsRef = RefFlag
		id::IsValInRef = ValinrefFlag
		UpdateToken(id)
		return id
	end method

	method public NullLiteral UpdateNullLit(var id as NullLiteral)
		UpdateToken(id)
		return id
	end method
	
	method public MeTok UpdateMeTok(var id as MeTok)
		UpdateToken(id)
		return id
	end method
	
	method public CharLiteral UpdateCharLit(var id as CharLiteral)
		UpdateToken(id)
		return id
	end method

	method public StringLiteral UpdateStringLit(var id as StringLiteral)
		UpdateToken(id)
		return id
	end method
	
	method public BooleanLiteral UpdateBoolLit(var id as BooleanLiteral)
		UpdateToken(id)
		return id
	end method

	method public NumberLiteral UpdateNumLit(var id as NumberLiteral)
		UpdateToken(id)
		return id
	end method
	
	method public void ResetMCISFlgs()
		MetCallFlag = false
		IdentFlag = false
		StringFlag = false
		CtorFlag = false
	end method

end class