//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static Helpers

	field public static boolean StringFlg
	field public static boolean NullExprFlg
	field public static boolean DelegateFlg
	field public static boolean OpCodeSuppFlg
	field public static boolean EqSuppFlg
	field public static boolean BaseFlg
	field public static IKVM.Reflection.Type LeftOp
	field public static IKVM.Reflection.Type RightOp

	method private static void Helpers()
		StringFlg = false
		DelegateFlg = false
		OpCodeSuppFlg = false
		EqSuppFlg = false
		BaseFlg = false
		NullExprFlg = false
		LeftOp = null
		RightOp = null
	end method
	
	//uses NullExprFlag as input
	[method: ComVisible(false)]
	method public static void CheckAssignability(var t1 as IKVM.Reflection.Type, var t2 as IKVM.Reflection.Type)
		if t1::IsAssignableFrom(t2) == false then
			if NullExprFlg and (t1::IsAssignableFrom(ILEmitter::Univ::Import(gettype ValueType)) == false) then
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Slots of type '" + t1::ToString() + "' cannot be assigned values of type '" + t2::ToString() +"'.")
			end if
		end if
	end method

	[method: ComVisible(false)]
	method public static TypeAttributes ProcessClassAttrs(var attrs as Attributes.Attribute[])
		
		var ta as TypeAttributes
		var temp as TypeAttributes
		var i as integer = -1
		var fir as boolean = true
		var flg as boolean
		var absf as boolean = false
		var sldf as boolean = false
		
		var t as Type[] = new Type[9]
		t[0] = gettype Attributes.PublicAttr
		t[1] = gettype Attributes.PrivateAttr
		t[2] = gettype Attributes.AutoLayoutAttr
		t[3] = gettype Attributes.AnsiClassAttr
		t[4] = gettype Attributes.SealedAttr
		t[5] = gettype Attributes.BeforeFieldInitAttr
		t[6] = gettype Attributes.AbstractAttr
		t[7] = gettype Attributes.InterfaceAttr
		t[8] = gettype Attributes.StaticAttr
		
		do until i = (attrs[l] - 1)
			i = i + 1
			flg = true
			
			if t[0]::IsInstanceOfType(attrs[i]) then
				if AsmFactory::isNested = false then
					temp = TypeAttributes::Public
				else
					temp = TypeAttributes::NestedPublic
				end if
			elseif t[1]::IsInstanceOfType(attrs[i]) then
				if AsmFactory::isNested = false then
					temp = TypeAttributes::NotPublic
				else
					temp = TypeAttributes::NestedPrivate
				end if
			elseif t[2]::IsInstanceOfType(attrs[i]) then
				temp = TypeAttributes::AutoLayout
			elseif t[3]::IsInstanceOfType(attrs[i]) then
				temp = TypeAttributes::AnsiClass
			elseif t[4]::IsInstanceOfType(attrs[i]) then
				temp = TypeAttributes::Sealed
				sldf = true
			elseif t[5]::IsInstanceOfType(attrs[i]) then
				temp = TypeAttributes::BeforeFieldInit
			elseif t[6]::IsInstanceOfType(attrs[i]) then
				temp = TypeAttributes::Abstract
				absf = true
			elseif t[7]::IsInstanceOfType(attrs[i]) then
				temp = TypeAttributes::Interface
				ILEmitter::InterfaceFlg = true
			elseif t[8]::IsInstanceOfType(attrs[i]) then
				temp = TypeAttributes::Abstract or TypeAttributes::BeforeFieldInit or TypeAttributes::Sealed
				ILEmitter::StaticCFlg = true
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attrs[i]::Value + "' is not a valid attribute for a class or delegate.")
			end if
			
			if flg then
				if fir then
					fir = (fir == false)
					ta = temp
				else
					ta = temp or ta
				end if
			end if
			
		end do
		
		if absf and sldf then
			ILEmitter::StaticCFlg = true
		end if

		return ta
	end method

	[method: ComVisible(false)]
	method public static MethodAttributes ProcessMethodAttrs(var attrs as Attributes.Attribute[])
		
		var ta as MethodAttributes
		var temp as MethodAttributes
		var i as integer = -1
		var fir as boolean = true
		var flg as boolean
		var fam as boolean = false
		var assem as boolean = false
		var foa as boolean = false
		var faa as boolean = false

		var t as Type[] = new Type[13]
		t[0] = gettype Attributes.PublicAttr
		t[1] = gettype Attributes.StaticAttr
		t[2] = gettype Attributes.SpecialNameAttr
		t[3] = gettype Attributes.VirtualAttr
		t[4] = gettype Attributes.HideBySigAttr
		t[5] = gettype Attributes.PrivateAttr
		t[6] = gettype Attributes.FamilyAttr
		t[7] = gettype Attributes.FinalAttr
		t[8] = gettype Attributes.AssemblyAttr
		t[9] = gettype Attributes.FamORAssemAttr
		t[10] = gettype Attributes.FamANDAssemAttr
		t[11] = gettype Attributes.AbstractAttr
		t[12] = gettype Attributes.NewSlotAttr

		do until i = (attrs[l] - 1)
			i = i + 1
			flg = true

			if t[0]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Public
			elseif t[1]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Static
				ILEmitter::StaticFlg = true
			elseif t[2]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::SpecialName
			elseif t[3]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Virtual
			elseif t[4]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::HideBySig
			elseif t[5]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Private
			elseif t[6]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Family
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				fam = true
			elseif t[7]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Final
			elseif t[8]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Assembly
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				assem = true
			elseif t[9]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::FamORAssem
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				foa = true
			elseif t[10]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::FamANDAssem
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				faa = true
			elseif t[11]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::Abstract
				ILEmitter::AbstractFlg = true
			elseif t[12]::IsInstanceOfType(attrs[i]) then
				temp = MethodAttributes::NewSlot
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attrs[i]::Value + "' is not a valid attribute for a method.")
			end if
			
			if flg then
				if fir then
					fir = (fir == false)
					ta = temp
				else
					ta = temp or ta
				end if
			end if
			
		end do

		return ta
	end method

	[method: ComVisible(false)]
	method public static FieldAttributes ProcessFieldAttrs(var attrs as Attributes.Attribute[])
		
		var ta as FieldAttributes
		var temp as FieldAttributes
		var i as integer = -1
		var fir as boolean = true
		var flg as boolean
		var fam as boolean = false
		var assem as boolean = false
		var foa as boolean = false
		var faa as boolean = false
		
		var t as Type[] = new Type[8]
		t[0] = gettype Attributes.PublicAttr
		t[1] = gettype Attributes.StaticAttr
		t[2] = gettype Attributes.InitOnlyAttr
		t[3] = gettype Attributes.PrivateAttr
		t[4] = gettype Attributes.FamilyAttr
		t[5] = gettype Attributes.AssemblyAttr
		t[6] = gettype Attributes.FamORAssemAttr
		t[7] = gettype Attributes.FamANDAssemAttr
		
		do until i = (attrs[l] - 1)
			i = i + 1
			flg = true

			if t[0]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::Public
			elseif t[1]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::Static
			elseif t[2]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::InitOnly
			elseif t[3]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::Private
			elseif t[4]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::Family
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				fam = true
			elseif t[5]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::Assembly
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				assem = true
			elseif t[6]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::FamORAssem
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				foa = true
			elseif t[7]::IsInstanceOfType(attrs[i]) then
				temp = FieldAttributes::FamANDAssem
				if assem or fam or foa or faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Only one of family, assembly, famorassem, famandassem can be used in an attribute list.")
				end if
				faa = true
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attrs[i]::Value + "' is not a valid attribute for a field.")
			end if

			if flg then
				if fir then
					fir = (fir == false)
					ta = temp
				else
					ta = temp or ta
				end if
			end if

		end do

		return ta
	end method

	[method: ComVisible(false)]
	method public static boolean CheckUnsigned(var t as IKVM.Reflection.Type)
		return t::Equals(ILEmitter::Univ::Import(gettype byte)) or t::Equals(ILEmitter::Univ::Import(gettype ushort)) or t::Equals(ILEmitter::Univ::Import(gettype uinteger)) or t::Equals(ILEmitter::Univ::Import(gettype ulong)) or t::Equals(ILEmitter::Univ::Import(gettype UIntPtr))
	end method
	
	[method: ComVisible(false)]
	method public static boolean CheckSigned(var t as IKVM.Reflection.Type)
		return t::Equals(ILEmitter::Univ::Import(gettype sbyte)) or t::Equals(ILEmitter::Univ::Import(gettype short)) or t::Equals(ILEmitter::Univ::Import(gettype integer)) or t::Equals(ILEmitter::Univ::Import(gettype long)) or t::Equals(ILEmitter::Univ::Import(gettype IntPtr))
	end method
	
	[method: ComVisible(false)]
	method public static boolean IsPrimitiveIntegralType(var t as IKVM.Reflection.Type)
		if CheckSigned(t) then
			return true
		elseif CheckUnsigned(t) then
			return true
		else
			return false
		end if
	end method
	
	[method: ComVisible(false)]
	method public static boolean IsPrimitiveFPType(var t as IKVM.Reflection.Type)
		if t::Equals(ILEmitter::Univ::Import(gettype double)) then
			return true
		elseif t::Equals(ILEmitter::Univ::Import(gettype single)) then
			return true
		else
			return false
		end if
	end method
	
	[method: ComVisible(false)]
	method public static boolean IsPrimitiveNumericType(var t as IKVM.Reflection.Type)
		if CheckSigned(t) then
			return true
		elseif IsPrimitiveFPType(t) then
			return true
		elseif CheckUnsigned(t) then
			return true
		else
			return false
		end if
	end method
	
	[method: ComVisible(false)]
	method public static integer GetPrimitiveNumericSize(var t as IKVM.Reflection.Type)
		if t::Equals(ILEmitter::Univ::Import(gettype boolean)) then
			return 1
		elseif t::Equals(ILEmitter::Univ::Import(gettype sbyte)) or t::Equals(ILEmitter::Univ::Import(gettype byte)) then
			return 8
		elseif t::Equals(ILEmitter::Univ::Import(gettype short)) or t::Equals(ILEmitter::Univ::Import(gettype ushort)) or t::Equals(ILEmitter::Univ::Import(gettype char)) then
			return 16
		elseif t::Equals(ILEmitter::Univ::Import(gettype integer)) or t::Equals(ILEmitter::Univ::Import(gettype uinteger)) or t::Equals(ILEmitter::Univ::Import(gettype single)) then
			return 32
		elseif t::Equals(ILEmitter::Univ::Import(gettype long)) or t::Equals(ILEmitter::Univ::Import(gettype ulong)) or t::Equals(ILEmitter::Univ::Import(gettype double)) then
			return 64
		else
			return 0
		end if
	end method

	//note that this method returns void and leaves a result in AsmFactory::Type01
	[method: ComVisible(false)]
	method public static void EvalTTok(var tt as TypeTok)

		//var tarr as IKVM.Reflection.Type[]
		var typ as IKVM.Reflection.Type
		var temptyp as IKVM.Reflection.Type
		var gtt as GenericTypeTok
		var pttoks as TypeTok[] = new TypeTok[0]
		var i as integer = -1
		var tstr as string = " "

		var ttyp as Type = gettype GenericTypeTok

		if ttyp::IsInstanceOfType(tt) then

			gtt = $GenericTypeTok$tt
			pttoks = gtt::Params

			var lop as List<of IKVM.Reflection.Type> = new List<of IKVM.Reflection.Type>()
			
			if gtt::RefTyp = null then
				tstr = gtt::Value + "`" + $string$pttoks[l]
				typ = Loader::LoadClass(tstr)
				gtt::RefTyp = Loader::PreProcTyp
			else
				typ = gtt::RefTyp
			end if

			if typ = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Generic Type " + tstr + " could not be found!!")
			end if

			do until i = (pttoks[l] - 1)
				i = i + 1
				EvalTTok(pttoks[i])
				temptyp = AsmFactory::Type01
				if temptyp = null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Generic Argument " + pttoks[i]::ToString() + " meant for Generic Type " + typ::ToString() + " could not be found!!")
				end if
				lop::Add(temptyp)
			end do
			
			//typ = typ::GetGenericTypeDefinition()
			typ = typ::MakeGenericType(Enumerable::ToArray<of IKVM.Reflection.Type>(lop))
			Loader::MakeArr = gtt::IsArray
			Loader::MakeRef = gtt::IsByRef
			typ = Loader::ProcessType(typ)
		else
			if tt::RefTyp = null then
				Loader::MakeArr = tt::IsArray
				Loader::MakeRef = tt::IsByRef
				typ = SymTable::TypeLst::GetType(tt::Value)
				if typ != null  then
					tt::RefTyp = typ
					typ = Loader::ProcessType(typ)
				else
					typ = Loader::LoadClass(tt::Value)
					tt::RefTyp = Loader::PreProcTyp
				end if
			else
				Loader::MakeArr = tt::IsArray
				Loader::MakeRef = tt::IsByRef
				typ = Loader::ProcessType(tt::RefTyp) 
			end if
		end if

		AsmFactory::Type01 = typ

	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type CommitEvalTTok(var tt as TypeTok)
		EvalTTok(tt)
		return AsmFactory::Type01
	end method

	[method: ComVisible(false)]
	method public static void ProcessParams(var ps as Expr[])

		var i as integer = -1
		var curp as VarExpr = null
		var typ as IKVM.Reflection.Type = null

		do until i = (ps[l] - 1)
			i = i + 1
			curp = $VarExpr$ps[i]
			typ = CommitEvalTTok(curp::VarTyp)
			if typ = null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curp::VarTyp::Value + "' is not defined or is not accessible.")
			end if

			if typ != null then
				AsmFactory::AddTyp(typ)
			end if

		end do
		
	end method

	[method: ComVisible(false)]
	method public static void PostProcessParams(var ps as Expr[])

		var i as integer = -1
		var curp as VarExpr = null
		var typ2 as Type = gettype InTok
		var typ3 as Type = gettype OutTok
		var typ4 as Type = gettype InOutTok
		
		do until i = (ps[l] - 1)
			i = i + 1
			curp = $VarExpr$ps[i]
			var pa as ParameterAttributes = ParameterAttributes::None
			
			if curp::Attr != null then
				if typ2::IsInstanceOfType(curp::Attr) then
					pa = ParameterAttributes::In
				elseif typ3::IsInstanceOfType(curp::Attr) then
					pa = ParameterAttributes::Out
				elseif typ4::IsInstanceOfType(curp::Attr) then
					pa = ParameterAttributes::In or ParameterAttributes::Out
				end if	
			end if
			
			ILEmitter::Met::DefineParameter(i + 1, pa, curp::VarName::Value)
			ILEmitter::ArgInd = ILEmitter::ArgInd + 1
			SymTable::AddVar(curp::VarName::Value, false, ILEmitter::ArgInd, CommitEvalTTok(curp::VarTyp),ILEmitter::LineNr)
		end do
		
	end method

	[method: ComVisible(false)]
	method public static void PostProcessParamsConstr(var ps as Expr[])

		var i as integer = -1
		var curp as VarExpr = null
		var typ2 as Type = gettype InTok
		var typ3 as Type = gettype OutTok
		var typ4 as Type = gettype InOutTok
		
		do until i = (ps[l] - 1)
			i = i + 1
			curp = $VarExpr$ps[i]
			var pa as ParameterAttributes = ParameterAttributes::None
			
			if curp::Attr != null then
				if typ2::IsInstanceOfType(curp::Attr) then
					pa = ParameterAttributes::In
				elseif typ3::IsInstanceOfType(curp::Attr) then
					pa = ParameterAttributes::Out
				elseif typ4::IsInstanceOfType(curp::Attr) then
					pa = ParameterAttributes::In or ParameterAttributes::Out
				end if	
			end if
			
			ILEmitter::Constr::DefineParameter(i + 1, pa, curp::VarName::Value)
			ILEmitter::ArgInd = ILEmitter::ArgInd + 1
			SymTable::AddVar(curp::VarName::Value, false, ILEmitter::ArgInd, CommitEvalTTok(curp::VarTyp),ILEmitter::LineNr)
		end do
		
	end method

	[method: ComVisible(false)]
	method public static void EmitLiteral(var lit as Literal)
	
		var t as Type[] = new Type[15]
		t[0] = gettype StringLiteral
		t[1] = gettype SByteLiteral
		t[2] = gettype ShortLiteral
		t[3] = gettype IntLiteral
		t[4] = gettype LongLiteral
		t[5] = gettype FloatLiteral
		t[6] = gettype DoubleLiteral
		t[7] = gettype BooleanLiteral
		t[8] = gettype CharLiteral
		t[9] = gettype NullLiteral
		t[10] = gettype ByteLiteral
		t[11] = gettype UShortLiteral
		t[12] = gettype UIntLiteral
		t[13] = gettype ULongLiteral
		t[14] = gettype DecimalLiteral

		if t[0]::IsInstanceOfType(lit) then
			var slit as StringLiteral = $StringLiteral$lit
			ILEmitter::EmitLdstr(slit::Value)
		elseif t[1]::IsInstanceOfType(lit) then
			var sblit as SByteLiteral = $SByteLiteral$lit
			ILEmitter::EmitLdcI1(sblit::NumVal)
		elseif t[2]::IsInstanceOfType(lit) then
			var shlit as ShortLiteral = $ShortLiteral$lit
			ILEmitter::EmitLdcI2(shlit::NumVal)
		elseif t[3]::IsInstanceOfType(lit) then
			var ilit as IntLiteral = $IntLiteral$lit
			ILEmitter::EmitLdcI4(ilit::NumVal)
		elseif t[4]::IsInstanceOfType(lit) then
			var llit as LongLiteral = $LongLiteral$lit
			ILEmitter::EmitLdcI8(llit::NumVal)
		elseif t[5]::IsInstanceOfType(lit) then
			var flit as FloatLiteral = $FloatLiteral$lit
			ILEmitter::EmitLdcR4(flit::NumVal)
		elseif t[6]::IsInstanceOfType(lit) then
			var dlit as DoubleLiteral = $DoubleLiteral$lit
			ILEmitter::EmitLdcR8(dlit::NumVal)
		elseif t[7]::IsInstanceOfType(lit) then
			var bllit as BooleanLiteral = $BooleanLiteral$lit
			ILEmitter::EmitLdcBool(bllit::BoolVal)
		elseif t[8]::IsInstanceOfType(lit) then
			var clit as CharLiteral = $CharLiteral$lit
			ILEmitter::EmitLdcChar(clit::CharVal)
		elseif t[9]::IsInstanceOfType(lit) then
			ILEmitter::EmitLdnull()
		elseif t[10]::IsInstanceOfType(lit) then
			var blit as ByteLiteral = $ByteLiteral$lit
			ILEmitter::EmitLdcU1(blit::NumVal)
		elseif t[11]::IsInstanceOfType(lit) then
			var uslit as UShortLiteral = $UShortLiteral$lit
			ILEmitter::EmitLdcU2(uslit::NumVal)
		elseif t[12]::IsInstanceOfType(lit) then
			var uilit as UIntLiteral = $UIntLiteral$lit
			ILEmitter::EmitLdcU4(uilit::NumVal)
		elseif t[13]::IsInstanceOfType(lit) then
			var ullit as ULongLiteral = $ULongLiteral$lit
			ILEmitter::EmitLdcU8(ullit::NumVal)
		elseif t[14]::IsInstanceOfType(lit) then
			var declit as DecimalLiteral = $DecimalLiteral$lit
			ILEmitter::EmitLdcDec(declit::NumVal)
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Loading of literals of type '" + CommitEvalTTok(lit::LitTyp)::ToString() + "' is not yet supported.")
		end if

	end method
	
	[method: ComVisible(false)]
	method public static object LiteralToConst(var lit as Literal)
	
		var t as Type[] = new Type[14]
		t[0] = gettype StringLiteral
		t[1] = gettype SByteLiteral
		t[2] = gettype ShortLiteral
		t[3] = gettype IntLiteral
		t[4] = gettype LongLiteral
		t[5] = gettype FloatLiteral
		t[6] = gettype DoubleLiteral
		t[7] = gettype BooleanLiteral
		t[8] = gettype CharLiteral
		t[9] = gettype NullLiteral
		t[10] = gettype ByteLiteral
		t[11] = gettype UShortLiteral
		t[12] = gettype UIntLiteral
		t[13] = gettype ULongLiteral

		if t[0]::IsInstanceOfType(lit) then
			var slit as StringLiteral = $StringLiteral$lit
			return slit::Value
		elseif t[1]::IsInstanceOfType(lit) then
			var sblit as SByteLiteral = $SByteLiteral$lit
			return $object$sblit::NumVal
		elseif t[2]::IsInstanceOfType(lit) then
			var shlit as ShortLiteral = $ShortLiteral$lit
			return $object$shlit::NumVal
		elseif t[3]::IsInstanceOfType(lit) then
			var ilit as IntLiteral = $IntLiteral$lit
			return $object$ilit::NumVal
		elseif t[4]::IsInstanceOfType(lit) then
			var llit as LongLiteral = $LongLiteral$lit
			return $object$llit::NumVal
		elseif t[5]::IsInstanceOfType(lit) then
			var flit as FloatLiteral = $FloatLiteral$lit
			return $object$flit::NumVal
		elseif t[6]::IsInstanceOfType(lit) then
			var dlit as DoubleLiteral = $DoubleLiteral$lit
			return $object$dlit::NumVal
		elseif t[7]::IsInstanceOfType(lit) then
			var bllit as BooleanLiteral = $BooleanLiteral$lit
			return $object$bllit::BoolVal
		elseif t[8]::IsInstanceOfType(lit) then
			var clit as CharLiteral = $CharLiteral$lit
			return $object$clit::CharVal
		elseif t[9]::IsInstanceOfType(lit) then
			return null
		elseif t[10]::IsInstanceOfType(lit) then
			var blit as ByteLiteral = $ByteLiteral$lit
			return $object$blit::NumVal
		elseif t[11]::IsInstanceOfType(lit) then
			var uslit as UShortLiteral = $UShortLiteral$lit
			return $object$uslit::NumVal
		elseif t[12]::IsInstanceOfType(lit) then
			var uilit as UIntLiteral = $UIntLiteral$lit
			return $object$uilit::NumVal
		elseif t[13]::IsInstanceOfType(lit) then
			var ullit as ULongLiteral = $ULongLiteral$lit
			return $object$ullit::NumVal
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Literals of type '" + CommitEvalTTok(lit::LitTyp)::ToString() + "' are not suitable for constants.")
			return null
		end if
	end method

	method public static Literal ProcessConst(var lit as ConstLiteral)

		var t as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[14]
		t[0] = ILEmitter::Univ::Import(gettype string)
		t[1] = ILEmitter::Univ::Import(gettype sbyte)
		t[2] = ILEmitter::Univ::Import(gettype short)
		t[3] = ILEmitter::Univ::Import(gettype integer)
		t[4] = ILEmitter::Univ::Import(gettype long)
		t[5] = ILEmitter::Univ::Import(gettype single)
		t[6] = ILEmitter::Univ::Import(gettype double)
		t[7] = ILEmitter::Univ::Import(gettype boolean)
		t[8] = ILEmitter::Univ::Import(gettype char)
		t[9] = ILEmitter::Univ::Import(gettype object)
		t[10] = ILEmitter::Univ::Import(gettype byte)
		t[11] = ILEmitter::Univ::Import(gettype ushort)
		t[12] = ILEmitter::Univ::Import(gettype uinteger)
		t[13] = ILEmitter::Univ::Import(gettype ulong)
		
		if t[0]::Equals(lit::IntTyp) then
			return new StringLiteral($string$lit::ConstVal)
		elseif t[1]::Equals(lit::IntTyp) then
			return new SByteLiteral($sbyte$lit::ConstVal)
		elseif t[2]::Equals(lit::IntTyp) then
			return new ShortLiteral($short$lit::ConstVal)
		elseif t[3]::Equals(lit::IntTyp) then
			return new IntLiteral($integer$lit::ConstVal)
		elseif t[4]::Equals(lit::IntTyp) then
			return new LongLiteral($long$lit::ConstVal)
		elseif t[5]::Equals(lit::IntTyp) then
			return new FloatLiteral($single$lit::ConstVal)
		elseif t[6]::Equals(lit::IntTyp) then
			return new DoubleLiteral($double$lit::ConstVal)
		elseif t[7]::Equals(lit::IntTyp) then
			return new BooleanLiteral($boolean$lit::ConstVal)
		elseif t[8]::Equals(lit::IntTyp) then
			return new CharLiteral($char$lit::ConstVal)
		elseif t[9]::Equals(lit::IntTyp) then
			return new NullLiteral()
		elseif t[10]::Equals(lit::IntTyp) then
			return new ByteLiteral($byte$lit::ConstVal)
		elseif t[11]::Equals(lit::IntTyp) then
			return new UShortLiteral($ushort$lit::ConstVal)
		elseif t[12]::Equals(lit::IntTyp) then
			return new UIntLiteral($uinteger$lit::ConstVal)
		elseif t[13]::Equals(lit::IntTyp) then
			return new ULongLiteral($ulong$lit::ConstVal)
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Loading of constants of internal type '" + lit::IntTyp::ToString() + "' is not yet supported.")
			return null
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitOp(var op as Op, var s as boolean)

		var mtd as MethodInfo = null
		var t as Type[] = new Type[19]
		t[0] = gettype AddOp
		t[1] = gettype MulOp
		t[2] = gettype SubOp
		t[3] = gettype DivOp
		t[4] = gettype ModOp
		t[5] = gettype OrOp
		t[6] = gettype AndOp
		t[7] = gettype XorOp
		t[8] = gettype NandOp
		t[9] = gettype NorOp
		t[10] = gettype XnorOp
		t[11] = gettype GtOp
		t[12] = gettype LtOp
		t[13] = gettype GeOp
		t[14] = gettype LeOp
		t[15] = gettype EqOp
		t[16] = gettype NeqOp
		t[17] = gettype LikeOp
		t[18] = gettype NLikeOp

		if t[0]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_Addition", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif StringFlg then
				ILEmitter::EmitStrAdd()
			elseif DelegateFlg then
				ILEmitter::EmitDelegateAdd()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitAdd(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The + operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[1]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_Multiply", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitMul(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The * operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[2]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_Subtraction", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif DelegateFlg then
				ILEmitter::EmitDelegateSub()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitSub(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The - operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[3]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_Division", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitDiv(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The / operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[4]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_Modulus", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitRem(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The % operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[5]::IsInstanceOfType(op) then
			ILEmitter::EmitOr()
		elseif t[6]::IsInstanceOfType(op) then
			ILEmitter::EmitAnd()
		elseif t[7]::IsInstanceOfType(op) then
			ILEmitter::EmitXor()
		elseif t[8]::IsInstanceOfType(op) then
			ILEmitter::EmitNand()
		elseif t[9]::IsInstanceOfType(op) then
			ILEmitter::EmitNor()
		elseif t[10]::IsInstanceOfType(op) then
			ILEmitter::EmitXnor()
		elseif t[11]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_GreaterThan", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitCgt(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The > operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[12]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_LessThan", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitClt(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The < operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[13]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_GreaterThanOrEqual", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitCge(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The >= operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[14]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_LessThanOrEqual", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif OpCodeSuppFlg then
				ILEmitter::EmitCle(s)
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The <= operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[15]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_Equality", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif StringFlg then
				ILEmitter::EmitStrCeq()
			elseif EqSuppFlg then
				ILEmitter::EmitCeq()
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The == operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[16]::IsInstanceOfType(op) then
			mtd = Loader::LoadBinOp(LeftOp, "op_Inequality", LeftOp, RightOp)
			if mtd != null then
				ILEmitter::EmitCall(mtd)
				AsmFactory::Type02 = mtd::get_ReturnType()
			elseif StringFlg then
				ILEmitter::EmitStrCneq()
			elseif EqSuppFlg then
				ILEmitter::EmitCneq()
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The != operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[17]::IsInstanceOfType(op) then
			if StringFlg then
				ILEmitter::EmitLike()
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The like operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		elseif t[18]::IsInstanceOfType(op) then
			if StringFlg then
				ILEmitter::EmitNLike()
			else
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The notlike operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
			end if
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitLocLd(var ind as integer, var locarg as boolean)
		var typ as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype ValueType)
		var t2 as IKVM.Reflection.Type

		if AsmFactory::Type04::get_IsByRef() then
			t2 = AsmFactory::Type04::GetElementType()
		else
			t2 = AsmFactory::Type04
		end if

		if (AsmFactory::AddrFlg and typ::IsAssignableFrom(t2)) or AsmFactory::ForcedAddrFlg then
			if AsmFactory::Type04::get_IsByRef() then
				if locarg then
					ILEmitter::EmitLdloc(ind)
				else
					ILEmitter::EmitLdarg(ind)
				end if
			else
				if locarg then
					ILEmitter::EmitLdloca(ind)
				else
					ILEmitter::EmitLdarga(ind)
				end if
			end if
		else
			if locarg then
				ILEmitter::EmitLdloc(ind)
			else
				ILEmitter::EmitLdarg(ind)
			end if
			if AsmFactory::Type04::get_IsByRef() then
				ILEmitter::EmitLdind(AsmFactory::Type04::GetElementType())
			end if
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitElemLd(var t as IKVM.Reflection.Type)
		var typ as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype ValueType)
		if (AsmFactory::AddrFlg and typ::IsAssignableFrom(AsmFactory::Type04)) or AsmFactory::ForcedAddrFlg then
			ILEmitter::EmitLdelema(t)
		else
			ILEmitter::EmitLdelem(t)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLocSt(var ind as integer, var locarg as boolean)
		if locarg then
			ILEmitter::EmitStloc(ind)
		else
			ILEmitter::EmitStarg(ind)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitConv(var source as IKVM.Reflection.Type, var sink as IKVM.Reflection.Type)

		var convc as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype Convert)
		var typ as IKVM.Reflection.Type
		var m1 as MethodInfo
		//var c1 as ConstructorInfo
		var arr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[1]
	
		if source::Equals(sink) then
			StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Converting from '" + source::ToString() + "' to '" + sink::ToString() + "' is redundant.")
			return
		end if

		if source::get_IsEnum() then
			if source::GetEnumUnderlyingType()::Equals(sink) then
				return
			end if
		end if
		
		//begin conv overload block
		if (source::get_IsPrimitive() and sink::get_IsPrimitive()) = false then
			if (sink::Equals(AsmFactory::CurnTypB) = false) and (sink::get_IsInterface() = false) then
				m1 = Loader::LoadConvOp(sink, "op_Implicit", source, sink)
				if m1 != null then
					ILEmitter::EmitCall(m1)
					return
				end if
				m1 = Loader::LoadConvOp(sink, "op_Explicit", source, sink)
				if m1 != null then
					ILEmitter::EmitCall(m1)
					return
				end if
			end if
			if (source::Equals(AsmFactory::CurnTypB) = false) and (source::get_IsInterface() = false) then
				m1 = Loader::LoadConvOp(source, "op_Implicit", source, sink)
				if m1 != null then
					ILEmitter::EmitCall(m1)
					return
				end if
				m1 = Loader::LoadConvOp(source, "op_Explicit", source, sink)
				if m1 != null then
					ILEmitter::EmitCall(m1)
					return
				end if
			end if
		end if
		//end conv overload block

		if sink::Equals(ILEmitter::Univ::Import(gettype object)) then
			typ = ILEmitter::Univ::Import(gettype ValueType)
			if typ::IsAssignableFrom(source) then
				ILEmitter::EmitBox(source)
				return
			else
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Converting from '" + source::ToString() + "' to '" + sink::ToString() + "' is redundant.")
				return
			end if
		end if

		if source::Equals(ILEmitter::Univ::Import(gettype object)) then
			typ = ILEmitter::Univ::Import(gettype ValueType)
			if typ::IsAssignableFrom(sink) then
				ILEmitter::EmitUnboxAny(sink)
				return
			end if
		end if

		typ = ILEmitter::Univ::Import(gettype ValueType)
		if (typ::IsAssignableFrom(sink) or typ::IsAssignableFrom(source)) = false then
			if sink::IsAssignableFrom(source) then
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Converting from '" + source::ToString() + "' to '" + sink::ToString() + "' is redundant.")
				return
			end if
			if source::IsAssignableFrom(sink) then
				ILEmitter::EmitCastclass(sink)
				return
			end if
		end if

		if source::Equals(ILEmitter::Univ::Import(gettype IntPtr)) then
			typ = ILEmitter::Univ::Import(gettype IntPtr)
			m1 = typ::GetMethod("ToInt64", IKVM.Reflection.Type::EmptyTypes)
			ILEmitter::EmitCallvirt(m1)
			source = ILEmitter::Univ::Import(gettype long)
		end if
		
		if sink::Equals(ILEmitter::Univ::Import(gettype string)) then
			arr[0] = source
			m1 = convc::GetMethod("ToString", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype char)) then
			arr[0] = source
			m1 = convc::GetMethod("ToChar", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype decimal)) then
			arr[0] = source
			m1 = convc::GetMethod("ToDecimal", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype double)) then
			arr[0] = source
			m1 = convc::GetMethod("ToDouble", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype single)) then
			arr[0] = source
			m1 = convc::GetMethod("ToSingle", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype long)) then
			arr[0] = source
			m1 = convc::GetMethod("ToInt64", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype ulong)) then
			arr[0] = source
			m1 = convc::GetMethod("ToUInt64", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype integer)) then
			arr[0] = source
			m1 = convc::GetMethod("ToInt32", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype uinteger)) then
			arr[0] = source
			m1 = convc::GetMethod("ToUInt32", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype short)) then
			arr[0] = source
			m1 = convc::GetMethod("ToInt16", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype ushort)) then
			arr[0] = source
			m1 = convc::GetMethod("ToUInt16", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype sbyte)) then
			arr[0] = source
			m1 = convc::GetMethod("ToSByte", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype byte)) then
			arr[0] = source
			m1 = convc::GetMethod("ToByte", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(ILEmitter::Univ::Import(gettype boolean)) then
			arr[0] = source
			m1 = convc::GetMethod("ToBoolean", arr)
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No conversion from '" + source::ToString() + "' to '" + sink::ToString() + "' exists.")
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitMetCall(var met as MethodInfo, var stat as boolean)
		if stat or BaseFlg then
			ILEmitter::EmitCall(met)
		else
			var typ as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype ValueType)
			if typ::IsAssignableFrom(AsmFactory::Type05) then
				if met::get_IsVirtual() then
					//ILEmitter::EmitConstrained(AsmFactory::Type05)
					ILEmitter::EmitCall(met)
				else
					ILEmitter::EmitCallvirt(met)
				end if
			else
				ILEmitter::EmitCallvirt(met)
			end if
		end if
		if AsmFactory::PopFlg then
			var rt as IKVM.Reflection.Type = met::get_ReturnType()
			if rt::Equals(ILEmitter::Univ::Import(gettype void)) == false then
				ILEmitter::EmitPop()
			end if
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitPtrLd(var met as MethodInfo, var stat as boolean)
		if stat then
			ILEmitter::EmitLdftn(met)
		else
			ILEmitter::EmitLdvirtftn(met)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitFldLd(var fld as FieldInfo, var stat as boolean)
		var typ as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype ValueType)
		if (AsmFactory::AddrFlg and typ::IsAssignableFrom(AsmFactory::Type04)) or AsmFactory::ForcedAddrFlg then
			if stat then
				ILEmitter::EmitLdsflda(fld)
			else
				ILEmitter::EmitLdflda(fld)
			end if
		else
			if stat then
				ILEmitter::EmitLdsfld(fld)
			else
				ILEmitter::EmitLdfld(fld)
			end if
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitFldSt(var fld as FieldInfo, var stat as boolean)
		if stat then
			ILEmitter::EmitStsfld(fld)
		else
			ILEmitter::EmitStfld(fld)
		end if
	end method

	[method: ComVisible(false)]
	method public static ConstructorInfo GetLocCtor(var t as IKVM.Reflection.Type, var typs as IKVM.Reflection.Type[])
		if t::Equals(AsmFactory::CurnTypB) then
			return SymTable::FindCtor(typs)
		else
			return Loader::LoadCtor(t, typs)
		end if
	end method

	[method: ComVisible(false)]
	method public static FieldInfo GetLocFld(var nam as string)
		var fldinf as FieldInfo = null
		var fldi as FieldInfo = SymTable::FindFld(nam)

		if fldi != null then
			fldinf = fldi
		else
			Loader::ProtectedFlag = true
			var f as FieldInfo = SymTable::TypeLst::GetField(AsmFactory::CurnInhTyp,nam)
			if f != null then
				fldinf = f
			else
				fldinf = Loader::LoadField(AsmFactory::CurnInhTyp, nam)
			end if
			Loader::ProtectedFlag = false
		end if

		return fldinf
	end method

	[method: ComVisible(false)]
	method public static MethodInfo GetLocMet(var nam as string, var typs as IKVM.Reflection.Type[])
		var metinf as MethodInfo = null
		var meti as MethodInfo = SymTable::FindMet(nam, typs)

		if (meti != null) and (BaseFlg == false) then
			metinf = meti
		else
			Loader::ProtectedFlag = true
			var m as MethodInfo = SymTable::TypeLst::GetMethod(AsmFactory::CurnInhTyp,nam,typs)
			if m != null then
				metinf = m
			else
				metinf = Loader::LoadMethod(AsmFactory::CurnInhTyp, nam, typs)
			end if
			Loader::ProtectedFlag = false
		end if

		return metinf
	end method

	[method: ComVisible(false)]
	method public static MethodInfo GetLocMetNoParams(var nam as string)
		var metinf as MethodInfo = null
		var meti as MethodItem = SymTable::FindMetNoParams(nam)

		if meti <> null then
			metinf = meti::MethodBldr
		end if

		return metinf
	end method

	[method: ComVisible(false)]
	method public static Emit.Label GetLbl(var nam as string)
		var lbl as Emit.Label
		var lbli as LabelItem = SymTable::FindLbl(nam)

		if lbli <> null then
			lbl = lbli::Lbl
		end if

		return lbl
	end method

	[method: ComVisible(false)]
	method public static MethodNameTok StripDelMtdName(var t as Token)
		var typ1 as Type = gettype Ident
		var typ2 as Type = gettype MethodCallTok
		if typ1::IsInstanceOfType(t) then
			var idt as Ident = $Ident$t
			return $MethodNameTok$idt
		elseif typ2::IsInstanceOfType(t) then
			var mct as MethodCallTok = $MethodCallTok$t
			return mct::Name
		else
			return null
		end if
	end method

	[method: ComVisible(false)]
	method public static Token SetPopFlg(var t as Token)

		var t2 as Token = t
		var t3 as MethodCallTok = null
		var typ1 as Type = gettype MethodCallTok
		var typ2 as Type = gettype Ident

		do while true
			if typ1::IsInstanceOfType(t2) then
				var mct as MethodCallTok = $MethodCallTok$t2
				t3 = mct
				if mct::Name::MemberAccessFlg then
					t2 = mct::Name::MemberToAccess
					continue
				else
					break
				end if
			elseif typ2::IsInstanceOfType(t2) then
				var idt as Ident = $Ident$t2
				if idt::MemberAccessFlg then
					t2 = idt::MemberToAccess
					continue
				else
					break
				end if
			end if
		end do

		if t3 != null then
			t3::PopFlg = true
			if t3::Name::MemberAccessFlg then
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "MethodCall statements should end their chain with a method call and not a field load!!")
			end if
			t3::Name::MemberAccessFlg = false
			return t
		else
			return null
		end if

	end method

	[method: ComVisible(false)]
	method public static boolean CheckIfArrLen(var ind as Expr)
		var typ as Type
		if ind::Tokens[l] = 1 then
			typ = gettype Ident
			if typ::IsInstanceOfType(ind::Tokens[0]) then
				return ind::Tokens[0]::Value == "l"
			else
				return false
			end if
		else
			return false
		end if
	end method

	[method: ComVisible(false)]
	method public static MethodInfo GetExtMet(var t as IKVM.Reflection.Type, var mn as MethodNameTok, var paramtyps as IKVM.Reflection.Type[])
		var gmntt as Type = gettype GenericMethodNameTok
		var mnstrarr as string[] = ParseUtils::StringParser(mn::Value, ":")
		var name as string = mnstrarr[mnstrarr[l] - 1]
		if gmntt::IsInstanceOfType(mn) then
			var gmn as GenericMethodNameTok = $GenericMethodNameTok$mn
			var genparams as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[gmn::Params[l]]
			var i as integer = -1
			do until i = (genparams[l] - 1)
				i = i + 1
				genparams[i] = CommitEvalTTok(gmn::Params[i])
			end do
			return Loader::LoadGenericMethod(t, name, genparams, paramtyps)
		else
			var m as MethodInfo = SymTable::TypeLst::GetMethod(t,name,paramtyps)
			if m != null then
				return m
			else
				return Loader::LoadMethod(t, name, paramtyps)
			end if
		end if
	end method
	
	[method: ComVisible(false)]
	method public static FieldInfo GetExtFld(var t as IKVM.Reflection.Type, var fld as string)
		var f as FieldInfo = SymTable::TypeLst::GetField(t,fld)
		if f != null then
			return f
		else
			return Loader::LoadField(t,fld)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static PropertyInfo GetExtProp(var t as IKVM.Reflection.Type, var prop as string)
		//var f as FieldInfo = SymTable::TypeLst::GetField(t,fld)
		//if f != null then
		//	return f
		//else
			return Loader::LoadProperty(t,prop)
		//end if
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyMetAttrs()
		foreach ca in SymTable::MethodCALst
			if AsmFactory::InCtorFlg then
				AsmFactory::CurnConB::SetCustomAttribute(ca)
			else
				AsmFactory::CurnMetB::SetCustomAttribute(ca)
			end if
		end for
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyFldAttrs()
		foreach ca in SymTable::FieldCALst
			AsmFactory::CurnFldB::SetCustomAttribute(ca)
		end for
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyClsAttrs()
		foreach ca in SymTable::ClassCALst
			AsmFactory::CurnTypB::SetCustomAttribute(ca)
		end for
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyAsmAttrs()	
		foreach ca in SymTable::AssemblyCALst
			AsmFactory::AsmB::SetCustomAttribute(ca)
		end for
	end method
	
	[method: ComVisible(false)]
	method public static MethodInfo[] ProcessForeach(var t as IKVM.Reflection.Type)
		var arr as MethodInfo[] = new MethodInfo[3]
		var ie as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype IEnumerable`1)
		var ie2 as IKVM.Reflection.Type = ILEmitter::Univ::Import(gettype IEnumerable)
		var ie3 as IKVM.Reflection.Type = null
		var flgs as boolean[] = new boolean[2]
		flgs[0] = false
		flgs[1] = false
		
		if t::get_IsGenericType() then
			if ie::Equals(t::GetGenericTypeDefinition()) then
				flgs[0] = true
				ie3 = t
			end if
		else
			if ie2::Equals(t) then
				flgs[1] = true
			end if
		end if
		
		if flgs[0] then
		elseif flgs[1] then
			ie3 = ie2
		else
			foreach interf in t::GetInterfaces()
				if interf::get_IsGenericType() then
					if ie::Equals(interf::GetGenericTypeDefinition()) then
						flgs[0] = true
						ie3 = interf
					end if
				else
					if ie2::Equals(interf) then
						flgs[1] = true
					end if
				end if
			end for
			
			if flgs[0] then
			elseif flgs[1] then
				ie3 = ie2
			else
				return null
			end if
		end if
		
		arr[0] = Loader::LoadMethod(ie3, "GetEnumerator", IKVM.Reflection.Type::EmptyTypes)
		arr[1] = Loader::LoadMethod(arr[0]::get_ReturnType(), "MoveNext", IKVM.Reflection.Type::EmptyTypes)
		arr[2] = Loader::LoadMethod(arr[0]::get_ReturnType(), "get_Current", IKVM.Reflection.Type::EmptyTypes)
		
		return arr
	end method

end class
