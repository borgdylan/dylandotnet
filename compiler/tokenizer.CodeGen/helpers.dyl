//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public static Helpers

	field public static boolean StringFlg
	field public static boolean BoolFlg
	field public static boolean NullExprFlg
	field public static boolean DelegateFlg
	field public static boolean OpCodeSuppFlg
	field public static boolean EqSuppFlg
	field public static boolean BaseFlg
	field public static IKVM.Reflection.Type LeftOp
	field public static IKVM.Reflection.Type RightOp

	//uses NullExprFlag as input
	[method: ComVisible(false)]
	method public static void CheckAssignability(var t1 as IKVM.Reflection.Type, var t2 as IKVM.Reflection.Type)
		if !t1::IsAssignableFrom(t2) andalso #expr(!NullExprFlg orelse Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(t1)) then
			//StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("'{0}','{1}'.", t1::get_AssemblyQualifiedName(), t2::get_AssemblyQualifiedName()))
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Slots of type '{0}' cannot be assigned values of type '{1}'.", t1::ToString(), t2::ToString()))
		end if
	end method

	[method: ComVisible(false)]
	method public static ObsoleteAttribute GetObsolete(var m as MemberInfo)
		try
			var lcad = m::__GetCustomAttributes(Loader::CachedLoadClass("System.ObsoleteAttribute"), false)
			if lcad::get_Count() == 0 then
				return null
			else
				var params = lcad::get_Item(0)::get_ConstructorArguments()
				if params::get_Count() == 0 then
					return new ObsoleteAttribute()
				elseif params::get_Count() == 1 then
					return new ObsoleteAttribute($string$params::get_Item(0)::get_Value())
				elseif params::get_Count() == 2 then
					return new ObsoleteAttribute($string$params::get_Item(0)::get_Value(), $boolean$params::get_Item(1)::get_Value())
				end if
			end if
		catch ex as Exception
		end try
		return null
	end method

	[method: ComVisible(false)]
	method public static TypeAttributes ProcessClassAttrs(var attrs as IEnumerable<of Attributes.Attribute>)
		
		var ta as TypeAttributes
		var temp as TypeAttributes
		var fir as boolean = true
		var flg as boolean
		//abstract flag
		var absf as boolean = false
		//sealed flag
		var sldf as boolean = false
		//sequential flag
		var isseq as boolean = false
		
		foreach attr in attrs
			flg = true
			
			if attr is Attributes.PublicAttr then
				temp = #ternary{AsmFactory::isNested ? TypeAttributes::NestedPublic, TypeAttributes::Public}
			elseif attr is Attributes.PrivateAttr then
				temp = #ternary{AsmFactory::isNested ? TypeAttributes::NestedPrivate, TypeAttributes::NotPublic}
			elseif attr is Attributes.AutoLayoutAttr then
				temp = TypeAttributes::AutoLayout
			elseif attr is Attributes.AnsiClassAttr then
				temp = TypeAttributes::AnsiClass
			elseif attr is Attributes.SequentialLayoutAttr then
				temp = TypeAttributes::SequentialLayout
				isseq = true
			elseif attr is Attributes.SealedAttr then
				temp = TypeAttributes::Sealed
				sldf = true
			elseif attr is Attributes.BeforeFieldInitAttr then
				temp = TypeAttributes::BeforeFieldInit
			elseif attr is Attributes.AbstractAttr then
				temp = TypeAttributes::Abstract
				ILEmitter::AbstractCFlg = true
				absf = true
			elseif attr is Attributes.InterfaceAttr then
				temp = TypeAttributes::Interface or TypeAttributes::Abstract
				ILEmitter::InterfaceFlg = true
				ILEmitter::AbstractCFlg = true
				absf = true
			elseif attr is Attributes.StaticAttr then
				temp = TypeAttributes::Abstract or TypeAttributes::BeforeFieldInit or TypeAttributes::Sealed
				ILEmitter::StaticCFlg = true
			elseif attr is Attributes.PartialAttr then
				ILEmitter::PartialFlg = true
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attr::Value + "' is not a valid attribute for a class or delegate.")
			end if
			if flg then
				if fir then
					fir = false
					ta = temp
				else
					ta = temp or ta
				end if
			end if
		end for
		if absf andalso sldf then
			ILEmitter::StaticCFlg = true
		end if

		if !isseq then
			ta = ta or TypeAttributes::AutoLayout
		end if

		return ta or TypeAttributes::AnsiClass
	end method
	
	[method: ComVisible(false)]
	method public static TypeAttributes ProcessClassAttrsE(var attrs as IEnumerable<of Attributes.Attribute>)
		
		var ta as TypeAttributes
		var temp as TypeAttributes
		var fir as boolean = true
		var flg as boolean
		
		foreach attr in attrs
			flg = true
			
			if attr is Attributes.PublicAttr then
				temp = #ternary{AsmFactory::isNested ? TypeAttributes::NestedPublic, TypeAttributes::Public}
			elseif attr is Attributes.PrivateAttr then
				temp = #ternary{AsmFactory::isNested ? TypeAttributes::NestedPrivate, TypeAttributes::NotPublic}
			elseif attr is Attributes.AutoLayoutAttr then
				temp = TypeAttributes::AutoLayout
			elseif attr is Attributes.AnsiClassAttr then
				temp = TypeAttributes::AnsiClass
			elseif attr is Attributes.SealedAttr then
				temp = TypeAttributes::Sealed
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attr::Value + "' is not a valid attribute for an enum.")
			end if
			if flg then
				if fir then
					fir = false
					ta = temp
				else
					ta = temp or ta
				end if
			end if
		end for
		return ta or TypeAttributes::AutoLayout or TypeAttributes::AnsiClass
	end method

	[method: ComVisible(false)]
	method public static MethodAttributes ProcessMethodAttrs(var attrs as IEnumerable<of Attributes.Attribute>)
		
		var ta as MethodAttributes
		var temp as MethodAttributes
		var fir as boolean = true
		var flg as boolean
		var fam as boolean = false
		var assem as boolean = false
		var foa as boolean = false
		var faa as boolean = false
		var errs as string = "Only one of family, assembly, famorassem, famandassem can be used in an attribute list."

		foreach attr in attrs
			flg = true

			if attr is Attributes.PublicAttr then
				temp = MethodAttributes::Public
			elseif attr is Attributes.StaticAttr then
				temp = MethodAttributes::Static
				ILEmitter::StaticFlg = true
			elseif attr is Attributes.SpecialNameAttr then
				temp = MethodAttributes::SpecialName or MethodAttributes::HideBySig
			elseif attr is Attributes.OverrideAttr then
				temp = MethodAttributes::Virtual or MethodAttributes::HideBySig
				ILEmitter::OverrideFlg = true
			elseif attr is Attributes.VirtualAttr then
				temp = MethodAttributes::Virtual or MethodAttributes::HideBySig or MethodAttributes::NewSlot
			elseif attr is Attributes.PrivateAttr then
				temp = MethodAttributes::Private
			elseif attr is Attributes.FamilyAttr then
				temp = MethodAttributes::Family
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				fam = true
			elseif attr is Attributes.FinalAttr then
				temp = MethodAttributes::Final
			elseif attr is Attributes.AssemblyAttr then
				temp = MethodAttributes::Assembly
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				assem = true
			elseif attr is Attributes.FamORAssemAttr then
				temp = MethodAttributes::FamORAssem
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				foa = true
			elseif attr is Attributes.FamANDAssemAttr then
				temp = MethodAttributes::FamANDAssem
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				faa = true
			elseif attr is Attributes.AbstractAttr then
				temp = MethodAttributes::Abstract or MethodAttributes::Virtual or MethodAttributes::HideBySig or MethodAttributes::NewSlot
				ILEmitter::AbstractFlg = true
			elseif attr is Attributes.PrototypeAttr then
				ILEmitter::ProtoFlg = true
			elseif attr is Attributes.PinvokeImplAttr then
				ILEmitter::PInvokeFlg = true
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attr::Value + "' is not a valid attribute for a method.")
			end if
			if flg then
				if fir then
					fir = false
					ta = temp
				else
					ta = temp or ta
				end if
			end if		
		end for
		return ta
	end method

	[method: ComVisible(false)]
	method public static FieldAttributes ProcessFieldAttrs(var attrs as IEnumerable<of Attributes.Attribute>)
		
		var ta as FieldAttributes
		var temp as FieldAttributes
		var fir as boolean = true
		var flg as boolean
		var fam as boolean = false
		var assem as boolean = false
		var foa as boolean = false
		var faa as boolean = false
		var errs as string = "Only one of family, assembly, famorassem, famandassem can be used in an attribute list."
		
		foreach attr in attrs
			flg = true

			if attr is Attributes.PublicAttr then
				temp = FieldAttributes::Public
			elseif attr is Attributes.StaticAttr then
				temp = FieldAttributes::Static
			elseif attr is Attributes.InitOnlyAttr then
				temp = FieldAttributes::InitOnly
			elseif attr is Attributes.PrivateAttr then
				temp = FieldAttributes::Private
			elseif attr is Attributes.LiteralAttr then
				temp = FieldAttributes::Literal or FieldAttributes::Static
			elseif attr is Attributes.FamilyAttr then
				temp = FieldAttributes::Family
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				fam = true
			elseif attr is Attributes.AssemblyAttr then
				temp = FieldAttributes::Assembly
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				assem = true
			elseif attr is Attributes.FamORAssemAttr then
				temp = FieldAttributes::FamORAssem
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				foa = true
			elseif attr is Attributes.FamANDAssemAttr then
				temp = FieldAttributes::FamANDAssem
				if assem orelse fam orelse foa orelse faa then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, errs)
				end if
				faa = true
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attr::Value + "' is not a valid attribute for a field.")
			end if
			if flg then
				if fir then
					fir = false
					ta = temp
				else
					ta = temp or ta
				end if
			end if
		end for
		return ta
	end method
	
	[method: ComVisible(false)]
	method public static PropertyAttributes ProcessPropAttrs(var attrs as IEnumerable<of Attributes.Attribute>)
		
		var ta as PropertyAttributes
		var temp as PropertyAttributes
		var fir as boolean = true
		var flg as boolean
		
		foreach attr in attrs
			flg = true

			if attr is Attributes.NoneAttr then
				temp = PropertyAttributes::None
			elseif attr is Attributes.SpecialNameAttr then
				temp = PropertyAttributes::SpecialName
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attr::Value + "' is not a valid attribute for a property.")
			end if
			if flg then
				if fir then
					fir = false
					ta = temp
				else
					ta = temp or ta
				end if
			end if
		end for
		return ta
	end method
	
	[method: ComVisible(false)]
	method public static EventAttributes ProcessEventAttrs(var attrs as IEnumerable<of Attributes.Attribute>)
		
		var ta as EventAttributes
		var temp as EventAttributes
		var fir as boolean = true
		var flg as boolean
		
		foreach attr in attrs
			flg = true
			if attr is Attributes.NoneAttr then
				temp = EventAttributes::None
			elseif attr is Attributes.SpecialNameAttr then
				temp = EventAttributes::SpecialName
			else
				flg = false
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "'" + attr::Value + "' is not a valid attribute for a property.")
			end if
			if flg then
				if fir then
					fir = false
					ta = temp
				else
					ta = temp or ta
				end if
			end if
		end for
		return ta
	end method


	[method: ComVisible(false)]
	method public static boolean CheckUnsigned(var t as IKVM.Reflection.Type)
		return t::Equals(Loader::CachedLoadClass("System.UInt32")) orelse _
			t::Equals(Loader::CachedLoadClass("System.UInt64")) orelse _
			t::Equals(Loader::CachedLoadClass("System.Char")) orelse _
			t::Equals(Loader::CachedLoadClass("System.Byte")) orelse _
			t::Equals(Loader::CachedLoadClass("System.UInt16")) orelse _
			t::Equals(Loader::CachedLoadClass("System.UIntPtr"))
	end method
	
	[method: ComVisible(false)]
	method public static boolean CheckSigned(var t as IKVM.Reflection.Type)
		return t::Equals(Loader::CachedLoadClass("System.SByte")) orelse _
			t::Equals(Loader::CachedLoadClass("System.Int16")) orelse _
			t::Equals(Loader::CachedLoadClass("System.Int32")) orelse _
			t::Equals(Loader::CachedLoadClass("System.Int64")) orelse _
			t::Equals(Loader::CachedLoadClass("System.IntPtr"))
	end method
	
	[method: ComVisible(false)]
	method public static boolean CheckSHLRLHS(var t as IKVM.Reflection.Type)
		return t::Equals(Loader::CachedLoadClass("System.Int32")) orelse t::Equals(Loader::CachedLoadClass("System.UInt32")) _
			orelse t::Equals(Loader::CachedLoadClass("System.Int64")) orelse t::Equals(Loader::CachedLoadClass("System.UInt64")) _
		 	orelse t::Equals(Loader::CachedLoadClass("System.IntPtr")) orelse t::Equals(Loader::CachedLoadClass("System.UIntPtr"))
	end method
	
	[method: ComVisible(false)]
	method public static boolean CheckSHLRRHS(var t as IKVM.Reflection.Type, var accepti64 as boolean)
		return t::Equals(Loader::CachedLoadClass("System.Int32")) orelse _
			(accepti64 andalso t::Equals(Loader::CachedLoadClass("System.Int64"))) _
			orelse t::Equals(Loader::CachedLoadClass("System.IntPtr"))
	end method
	
	[method: ComVisible(false)]
	method public static boolean IsPrimitiveIntegralType(var t as IKVM.Reflection.Type)
		return CheckSigned(t) orelse CheckUnsigned(t)
	end method
	
	[method: ComVisible(false)]
	method public static boolean IsPrimitiveFPType(var t as IKVM.Reflection.Type)
		return t::Equals(Loader::CachedLoadClass("System.Double")) orelse t::Equals(Loader::CachedLoadClass("System.Single"))
	end method
	
	[method: ComVisible(false)]
	method public static boolean IsPrimitiveNumericType(var t as IKVM.Reflection.Type)
		return CheckSigned(t) orelse IsPrimitiveFPType(t) orelse CheckUnsigned(t)
	end method
	
	[method: ComVisible(false)]
	method public static integer GetPrimitiveNumericSize(var t as IKVM.Reflection.Type)
		if t::Equals(Loader::CachedLoadClass("System.Boolean")) then
			return 1
		elseif t::Equals(Loader::CachedLoadClass("System.SByte")) orelse t::Equals(Loader::CachedLoadClass("System.Byte")) then
			return 8
		elseif t::Equals(Loader::CachedLoadClass("System.Int16")) orelse t::Equals(Loader::CachedLoadClass("System.Char")) orelse t::Equals(Loader::CachedLoadClass("System.UInt16")) then
			return 16
		elseif t::Equals(Loader::CachedLoadClass("System.Int32")) orelse t::Equals(Loader::CachedLoadClass("System.UInt32")) orelse t::Equals(Loader::CachedLoadClass("System.Single")) then
			return 32
		elseif t::Equals(Loader::CachedLoadClass("System.Int64")) orelse t::Equals(Loader::CachedLoadClass("System.UInt64")) orelse t::Equals(Loader::CachedLoadClass("System.Double")) then
			return 64
		elseif t::Equals(Loader::CachedLoadClass("System.IntPtr")) orelse t::Equals(Loader::CachedLoadClass("System.UIntPtr")) then
			return 64
		else
			return 0
		end if
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type CommitEvalTTok(var tt as TypeTok)
		
		if tt == null then
			return null
		end if
		
		var typ as IKVM.Reflection.Type = null
		var temptyp as IKVM.Reflection.Type
		var gtt as GenericTypeTok
		var pttoks as C5.LinkedList<of TypeTok> = new C5.LinkedList<of TypeTok>()

		if tt is GenericTypeTok then

			gtt = $GenericTypeTok$tt
			pttoks = gtt::Params

			var lop as C5.IList<of IKVM.Reflection.Type> = new C5.LinkedList<of IKVM.Reflection.Type>()
			
			var tstr = gtt::Value + "`" + $string$pttoks::get_Count()

			if gtt::RefTyp == null then
				typ = SymTable::TypeLst::GetType(gtt::Value, pttoks::get_Count())
				
				if typ == null then
					typ = Loader::LoadClass(tstr)
					gtt::RefTyp = Loader::PreProcTyp
				else
					gtt::RefTyp = typ
				end if
			else
				typ = gtt::RefTyp
			end if

			if typ == null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Generic Type " + tstr + " could not be found!!")
			end if

			foreach pt in pttoks
				temptyp = CommitEvalTTok(pt)
				if temptyp == null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Generic Argument " + pt::ToString() + " meant for Generic Type " + typ::ToString() + " could not be found!!")
				end if
				lop::Add(temptyp)
			end for
			
			typ = typ::MakeGenericType(lop::ToArray())

			//process any nested access
			if gtt::NestedType != null then
				typ = typ::GetNestedType(gtt::NestedType::Value)
				if typ == null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Nested Type " + gtt::NestedType::Value + " could not be found!")
				else
					if gtt::NestedType is GenericTypeTok then
						var pttoks2 = #expr($GenericTypeTok$gtt::NestedType)::Params
						var lop2 as C5.IList<of IKVM.Reflection.Type> = new C5.LinkedList<of IKVM.Reflection.Type>()

						foreach pt in pttoks2
							temptyp = CommitEvalTTok(pt)
							if temptyp == null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Generic Argument " + pt::ToString() + " meant for Generic Type " + typ::ToString() + " could not be found!!")
							end if
							lop2::Add(temptyp)
						end for
			
						typ = typ::MakeGenericType(lop2::ToArray())
					end if
				end if
			end if

			Loader::MakeArr = gtt::IsArray
			Loader::MakeRef = gtt::IsByRef
			typ = Loader::ProcessType(typ)
		else
			
			var isgenparamm = SymTable::MetGenParams::Contains(tt::Value)
			var isgenparamt = false
			if SymTable::CurnTypItem != null then
				isgenparamt = SymTable::CurnTypItem::TypGenParams::Contains(tt::Value)
			end if

			if !#expr(isgenparamm orelse isgenparamt) then
				if tt::RefTyp != null then
					Loader::MakeArr = tt::IsArray
					Loader::MakeRef = tt::IsByRef
					typ = Loader::ProcessType(tt::RefTyp)
				elseif tt is SpecialTypeTok
					Loader::MakeArr = tt::IsArray
					Loader::MakeRef = tt::IsByRef

					typ = Loader::CachedLoadClass(tt::Value)
					tt::RefTyp = Loader::PreProcTyp
				else
					Loader::MakeArr = tt::IsArray
					Loader::MakeRef = tt::IsByRef

					if (ParseUtils::StringParser(tt::Value, c'\\')[l] > 0) andalso !tt::Value::Contains(".") then
						if AsmFactory::inClass then
							var tti = #ternary { AsmFactory::isNested ? SymTable::CurnTypItem2 , SymTable::CurnTypItem}
							if tti != null then
								typ = tti::GetType(tt::Value)
							end if
						end if
					end if  

					if typ == null  then
						typ = SymTable::TypeLst::GetType(tt::Value, 0)
					end if

					if typ == null  then
						typ = Loader::LoadClass(tt::Value)
						tt::RefTyp = Loader::PreProcTyp
					else
						tt::RefTyp = typ
						typ = Loader::ProcessType(typ)						
					end if 
				end if
			else
				Loader::MakeArr = tt::IsArray
				Loader::MakeRef = tt::IsByRef

				if isgenparamm then
					typ = SymTable::MetGenParams::get_Item(tt::Value)::Bldr
				elseif isgenparamt
					typ = SymTable::CurnTypItem::TypGenParams::get_Item(tt::Value)::Bldr
				end if

				tt::RefTyp = typ
				typ = Loader::ProcessType(typ)
			end if
		end if

		return typ
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type[] ProcessParams(var ps as IEnumerable<of Expr>)
		var curp as VarExpr = null
		var typ as IKVM.Reflection.Type = null
		
		var lt = new C5.LinkedList<of IKVM.Reflection.Type>()
		
		foreach p in ps
			curp = $VarExpr$p
			typ = CommitEvalTTok(curp::VarTyp)

			if typ == null then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Class '" + curp::VarTyp::Value + "' is not defined or is not accessible.")
			else
				lt::Add(typ)
			end if

		end for
		return lt::ToArray()
	end method

	[method: ComVisible(false)]
	method public static void PostProcessParams(var ps as IEnumerable<of Expr>)

		var i as integer = -1
		var curp as VarExpr = null
		
		foreach p in ps
			i++
			curp = $VarExpr$p
			var pa as ParameterAttributes = ParameterAttributes::None
			
			if curp::Attr != null then
				if curp::Attr is InTok then
					pa = ParameterAttributes::In
				elseif curp::Attr is OutTok then
					pa = ParameterAttributes::Out
				elseif curp::Attr is InOutTok then
					pa = ParameterAttributes::In or ParameterAttributes::Out
				end if	
			end if
			
			var pb as ParameterBuilder = ILEmitter::Met::DefineParameter(++i, pa, curp::VarName::Value)
			
			if Enumerable::Contains<of integer>(SymTable::ParameterCALst::get_Keys(),++i) then
				foreach ca in SymTable::ParameterCALst::get_Item(++i)
					pb::SetCustomAttribute(ca)
				end for
			end if
			
			ILEmitter::ArgInd++
			SymTable::StoreFlg = true
			SymTable::AddVar(curp::VarName::Value, false, ILEmitter::ArgInd, CommitEvalTTok(curp::VarTyp),ILEmitter::LineNr)
			SymTable::StoreFlg = false
		end for
		
		SymTable::ParameterCALst::Clear()
	end method

	[method: ComVisible(false)]
	method public static void PostProcessParamsConstr(var ps as IEnumerable<of Expr>)

		var i as integer = -1
		var curp as VarExpr = null
		
		foreach p in ps
			i++
			curp = $VarExpr$p
			var pa as ParameterAttributes = ParameterAttributes::None
			
			if curp::Attr != null then
				if curp::Attr is InTok then
					pa = ParameterAttributes::In
				elseif curp::Attr is OutTok then
					pa = ParameterAttributes::Out
				elseif curp::Attr is InOutTok then
					pa = ParameterAttributes::In or ParameterAttributes::Out
				end if	
			end if
			
			var pb as ParameterBuilder = ILEmitter::Constr::DefineParameter(++i, pa, curp::VarName::Value)
			
			if Enumerable::Contains<of integer>(SymTable::ParameterCALst::get_Keys(),++i) then
				foreach ca in SymTable::ParameterCALst::get_Item(++i)
					pb::SetCustomAttribute(ca)
				end for
			end if
			
			ILEmitter::ArgInd++
			SymTable::StoreFlg = true
			SymTable::AddVar(curp::VarName::Value, false, ILEmitter::ArgInd, CommitEvalTTok(curp::VarTyp),ILEmitter::LineNr)
			SymTable::StoreFlg = false
		end for
		
		SymTable::ParameterCALst::Clear()
	end method

	[method: ComVisible(false)]
	method public static void EmitLiteral(var lit as Literal)
		if lit is StringLiteral then
			ILEmitter::EmitLdstr(#expr($StringLiteral$lit)::Value)
		elseif lit is SByteLiteral then
			ILEmitter::EmitLdcI1(#expr($SByteLiteral$lit)::NumVal)
		elseif lit is ShortLiteral then
			ILEmitter::EmitLdcI2(#expr($ShortLiteral$lit)::NumVal)
		elseif lit is IntLiteral then
			ILEmitter::EmitLdcI4(#expr($IntLiteral$lit)::NumVal)
		elseif lit is LongLiteral then
			ILEmitter::EmitLdcI8(#expr($LongLiteral$lit)::NumVal)
		elseif lit is FloatLiteral then
			ILEmitter::EmitLdcR4(#expr($FloatLiteral$lit)::NumVal)
		elseif lit is DoubleLiteral then
			ILEmitter::EmitLdcR8(#expr($DoubleLiteral$lit)::NumVal)
		elseif lit is BooleanLiteral then
			ILEmitter::EmitLdcBool(#expr($BooleanLiteral$lit)::BoolVal)
		elseif lit is CharLiteral then
			ILEmitter::EmitLdcChar(#expr($CharLiteral$lit)::CharVal)
		elseif lit is NullLiteral then
			ILEmitter::EmitLdnull()
		elseif lit is ByteLiteral then
			ILEmitter::EmitLdcU1(#expr($ByteLiteral$lit)::NumVal)
		elseif lit is UShortLiteral then
			ILEmitter::EmitLdcU2(#expr($UShortLiteral$lit)::NumVal)
		elseif lit is UIntLiteral then
			ILEmitter::EmitLdcU4(#expr($UIntLiteral$lit)::NumVal)
		elseif lit is ULongLiteral then
			ILEmitter::EmitLdcU8(#expr($ULongLiteral$lit)::NumVal)
		elseif lit is DecimalLiteral then
			ILEmitter::EmitLdcDec(#expr($DecimalLiteral$lit)::NumVal)
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Loading of literals of type '" + CommitEvalTTok(lit::LitTyp)::ToString() + "' is not yet supported.")
		end if
	end method
	
	[method: ComVisible(false)]
	method public static object LiteralToConst(var lit as Literal)
		if lit is StringLiteral then
			return #expr($StringLiteral$lit)::Value
		elseif lit is SByteLiteral then
			return $object$#expr($SByteLiteral$lit)::NumVal
		elseif lit is ShortLiteral then
			return $object$#expr($ShortLiteral$lit)::NumVal
		elseif lit is IntLiteral then
			return $object$#expr($IntLiteral$lit)::NumVal
		elseif lit is LongLiteral then
			return $object$#expr($LongLiteral$lit)::NumVal
		elseif lit is FloatLiteral then
			return $object$#expr($FloatLiteral$lit)::NumVal
		elseif lit is DoubleLiteral then
			return $object$#expr($DoubleLiteral$lit)::NumVal
		elseif lit is BooleanLiteral then
			return $object$#expr($BooleanLiteral$lit)::BoolVal
		elseif lit is CharLiteral then
			return $object$#expr($CharLiteral$lit)::CharVal
		elseif lit is NullLiteral then
			return null
		elseif lit is ByteLiteral then
			return $object$#expr($ByteLiteral$lit)::NumVal
		elseif lit is UShortLiteral then
			return $object$#expr($UShortLiteral$lit)::NumVal
		elseif lit is UIntLiteral then
			return $object$#expr($UIntLiteral$lit)::NumVal
		elseif lit is ULongLiteral then
			return $object$#expr($ULongLiteral$lit)::NumVal
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Literals of type '" + CommitEvalTTok(lit::LitTyp)::ToString() + "' are not suitable for constants.")
			return null
		end if
	end method

	method public static Literal ProcessConst(var lit as ConstLiteral)		
		if Loader::CachedLoadClass("System.String")::Equals(lit::IntTyp) then
			return new StringLiteral($string$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.SByte")::Equals(lit::IntTyp) then
			return new SByteLiteral($sbyte$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Int16")::Equals(lit::IntTyp) then
			return new ShortLiteral($short$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Int32")::Equals(lit::IntTyp) then
			return new IntLiteral($integer$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Int64")::Equals(lit::IntTyp) then
			return new LongLiteral($long$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Single")::Equals(lit::IntTyp) then
			return new FloatLiteral($single$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Double")::Equals(lit::IntTyp) then
			return new DoubleLiteral($double$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Boolean")::Equals(lit::IntTyp) then
			return new BooleanLiteral($boolean$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Char")::Equals(lit::IntTyp) then
			return new CharLiteral($char$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.Object")::Equals(lit::IntTyp) then
			return new NullLiteral()
		elseif Loader::CachedLoadClass("System.Byte")::Equals(lit::IntTyp) then
			return new ByteLiteral($byte$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.UInt16")::Equals(lit::IntTyp) then
			return new UShortLiteral($ushort$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.UInt32")::Equals(lit::IntTyp) then
			return new UIntLiteral($uinteger$lit::ConstVal)
		elseif Loader::CachedLoadClass("System.UInt64")::Equals(lit::IntTyp) then
			return new ULongLiteral($ulong$lit::ConstVal)
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Loading of constants of internal type '" + lit::IntTyp::ToString() + "' is not yet supported.")
			return null
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitOp(var op as Op, var s as boolean, var emt as boolean)

		var mtd1 as MethodInfo = null
		var mtd3 as MethodInfo = null
		var isgenparam = (LeftOp is GenericTypeParameterBuilder) orelse (RightOp is GenericTypeParameterBuilder)

		if op is AddOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_Addition", LeftOp, RightOp)
			end if
			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if StringFlg then
					ILEmitter::EmitStrAdd()
				elseif DelegateFlg then
					ILEmitter::EmitDelegateAdd()
				elseif OpCodeSuppFlg then
					ILEmitter::EmitAdd(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '+' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is MulOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_Multiply", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if OpCodeSuppFlg then
					ILEmitter::EmitMul(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '*' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is SubOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_Subtraction", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if DelegateFlg then
					ILEmitter::EmitDelegateSub()
				elseif OpCodeSuppFlg then
					ILEmitter::EmitSub(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '-' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is DivOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_Division", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if OpCodeSuppFlg then
					ILEmitter::EmitDiv(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '/' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is ModOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_Modulus", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if OpCodeSuppFlg then
					ILEmitter::EmitRem(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '%' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is OrOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_BitwiseOr", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if EqSuppFlg then
					ILEmitter::EmitOr()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'or' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is AndOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_BitwiseAnd", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if EqSuppFlg then
					ILEmitter::EmitAnd()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'and' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is XorOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_ExclusiveOr", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if EqSuppFlg then
					ILEmitter::EmitXor()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'xor' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is NandOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_BitwiseAnd", LeftOp, RightOp)
			end if

			if mtd1 != null then
				mtd3 = Loader::LoadUnaOp(mtd1::get_ReturnType(), "op_OnesComplement", mtd1::get_ReturnType())
			end if
			
			if mtd3 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
					ILEmitter::EmitCall(mtd3)
				end if
				AsmFactory::Type02 = mtd3::get_ReturnType()
			elseif emt then
				if BoolFlg then
					ILEmitter::EmitNand()
				elseif EqSuppFlg then
					ILEmitter::EmitNandOther()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'nand' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is NorOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_BitwiseOr", LeftOp, RightOp)
			end if

			if mtd1 != null then
				mtd3 = Loader::LoadUnaOp(mtd1::get_ReturnType(), "op_OnesComplement", mtd1::get_ReturnType())
			end if
			
			if mtd3 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
					ILEmitter::EmitCall(mtd3)
				end if
				AsmFactory::Type02 = mtd3::get_ReturnType()
			elseif emt then
				if BoolFlg then
					ILEmitter::EmitNor()
				elseif EqSuppFlg then
					ILEmitter::EmitNorOther()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'nor' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is XnorOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_ExclusiveOr", LeftOp, RightOp)
			end if

			if mtd1 != null then
				mtd3 = Loader::LoadUnaOp(mtd1::get_ReturnType(), "op_OnesComplement", mtd1::get_ReturnType())
			end if
			
			if mtd3 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
					ILEmitter::EmitCall(mtd3)
				end if
				AsmFactory::Type02 = mtd3::get_ReturnType()
			elseif emt then
				if BoolFlg then
					ILEmitter::EmitXnor()
				elseif EqSuppFlg then
					ILEmitter::EmitXnorOther()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'xnor' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is GtOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_GreaterThan", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if OpCodeSuppFlg then
					ILEmitter::EmitCgt(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '>' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is LtOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_LessThan", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if OpCodeSuppFlg then
					ILEmitter::EmitClt(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '<' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is GeOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_GreaterThanOrEqual", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if OpCodeSuppFlg then
					ILEmitter::EmitCge(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '>=' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is LeOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_LessThanOrEqual", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if OpCodeSuppFlg then
					ILEmitter::EmitCle(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '<=' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is EqOp then
			var lo = #ternary {LeftOp::get_IsConstructedGenericType() ? LeftOp::GetGenericTypeDefinition(), LeftOp}

			if !#expr(lo::Equals(AsmFactory::CurnTypB) orelse isgenparam) then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_Equality", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if StringFlg then
					ILEmitter::EmitStrCeq()
				elseif EqSuppFlg then
					ILEmitter::EmitCeq()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '==' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is StrictEqOp then
			if emt then
				if EqSuppFlg then
					ILEmitter::EmitCeq()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '===' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is NeqOp then
			var lo = #ternary {LeftOp::get_IsConstructedGenericType() ? LeftOp::GetGenericTypeDefinition(), LeftOp}

			if !#expr(lo::Equals(AsmFactory::CurnTypB) orelse isgenparam) then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_Inequality", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if StringFlg then
					ILEmitter::EmitStrCneq()
				elseif EqSuppFlg then
					ILEmitter::EmitCneq()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '!=' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is StrictNeqOp then
			if emt then
				if EqSuppFlg then
					ILEmitter::EmitCneq()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '!==' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is LikeOp then
			if emt then
				if StringFlg then
					ILEmitter::EmitLike()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'like' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is NLikeOp then
			if emt then
				if StringFlg then
					ILEmitter::EmitNLike()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The 'notlike' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is ShlOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_LeftShift", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if CheckSHLRLHS(LeftOp) and CheckSHLRRHS(RightOp, false) then
					ILEmitter::EmitShl()
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '<<' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		elseif op is ShrOp then
			if !isgenparam then
				mtd1 = Loader::LoadBinOp(LeftOp, "op_RightShift", LeftOp, RightOp)
			end if

			if mtd1 != null then
				if emt then
					ILEmitter::EmitCall(mtd1)
				end if
				AsmFactory::Type02 = mtd1::get_ReturnType()
			elseif emt then
				if CheckSHLRLHS(LeftOp) and CheckSHLRRHS(RightOp, false) then
					ILEmitter::EmitShr(s)
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '>>' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
				end if
			end if
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '" + op::ToString() + "' operation is undefined for '" + LeftOp::ToString() + "' and '" + RightOp::ToString() + "'.")
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitLocLd(var ind as integer, var locarg as boolean)
		if (AsmFactory::AddrFlg and Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom( _
			#ternary{AsmFactory::Type04::get_IsByRef() ? AsmFactory::Type04::GetElementType(), AsmFactory::Type04}) andalso (AsmFactory::Type04 isnot GenericTypeParameterBuilder) ) _
			 orelse AsmFactory::ForcedAddrFlg then
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
		if (AsmFactory::AddrFlg andalso Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(AsmFactory::Type04) andalso (AsmFactory::Type04 isnot GenericTypeParameterBuilder) ) _
		 orelse AsmFactory::ForcedAddrFlg then
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
	method public static void EmitConv(var source as IKVM.Reflection.Type, var sink as IKVM.Reflection.Type, var isNull as boolean)
		var isgenparam = (source is GenericTypeParameterBuilder) orelse (sink  is GenericTypeParameterBuilder)
		var convc as IKVM.Reflection.Type = Loader::LoadClass("System.Convert")
		var typ as IKVM.Reflection.Type
		var m1 as MethodInfo
		//var c1 as ConstructorInfo
	
		if source::Equals(sink) then
			//StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Converting from '" + source::ToString() + "' to '" + sink::ToString() + "' is redundant.")
			return
		end if

		if source::get_IsEnum() then
			if source::GetEnumUnderlyingType()::Equals(sink) then
				return
			end if
		elseif sink::get_IsEnum() then
			if source::Equals(sink::GetEnumUnderlyingType()) then
				return
			end if
		end if
		
		if !isgenparam then
			//begin conv overload block
			if !#expr(source::get_IsPrimitive() andalso sink::get_IsPrimitive()) then
				if !sink::Equals(AsmFactory::CurnTypB) andalso !sink::get_IsInterface() then
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
				if !source::Equals(AsmFactory::CurnTypB) andalso !source::get_IsInterface() then
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
		end if

		if sink::Equals(Loader::CachedLoadClass("System.Object")) then
			if Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(source) then
				ILEmitter::EmitBox(source)
			elseif (sink::get_BaseType() == null) andalso !sink::Equals(Loader::CachedLoadClass("System.Object")) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + source::ToString() + "' 's object/valuetype state could not be determined.")
			elseif source is GenericTypeParameterBuilder then
				ILEmitter::EmitBox(source)
			//else
				//StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Converting from '" + source::ToString() + "' to '" + sink::ToString() + "' is redundant.")
			end if
			return
		end if
		
		if sink::get_IsInterface() then
			if Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(source) andalso sink::IsAssignableFrom(source) then
				ILEmitter::EmitBox(source)
			elseif !Loader::CachedLoadClass("System.Object")::IsAssignableFrom(source) then
				StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Type '" + source::ToString() + "' 's object/valuetype state could not be determined.")
			end if
			return
		end if

		if source::Equals(Loader::CachedLoadClass("System.Object")) then
			if Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(sink) then
				ILEmitter::EmitUnboxAny(sink)
			elseif !Loader::CachedLoadClass("System.Object")::IsAssignableFrom(sink) then
				ILEmitter::EmitUnboxAny(sink)
			end if
			return
		end if

		typ = Loader::CachedLoadClass("System.ValueType")
		if !#expr(typ::IsAssignableFrom(sink) orelse typ::IsAssignableFrom(source)) then
			if sink::IsAssignableFrom(source) then
				if !sink::get_IsInterface() then
					StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Converting from '" + source::ToString() + "' to '" + sink::ToString() + "' is redundant.")
				end if
			elseif source::IsAssignableFrom(sink) then
				if !isNull then
					ILEmitter::EmitCastclass(sink)
				end if
			elseif source::get_IsInterface() orelse sink::get_IsInterface() then
				ILEmitter::EmitCastclass(sink)
			end if
			return
		end if
		
		if isgenparam then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No conversion from '" + source::ToString() + "' to '" + sink::ToString() + "' exists.")
			return
		end if
		
		if source::Equals(Loader::CachedLoadClass("System.IntPtr")) then
			typ = Loader::CachedLoadClass("System.IntPtr")
			m1 = typ::GetMethod("ToInt64", IKVM.Reflection.Type::EmptyTypes)
			ILEmitter::EmitCallvirt(m1)
			source = Loader::CachedLoadClass("System.Int64")
		end if
		
		if sink::Equals(Loader::CachedLoadClass("System.String")) then
			m1 = convc::GetMethod("ToString", new IKVM.Reflection.Type[] {source})
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Char")) then
			m1 = convc::GetMethod("ToChar", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				if (GetPrimitiveNumericSize(source) <= 16) and CheckUnsigned(source) then
					ILEmitter::EmitConvU2()
				else
					ILEmitter::EmitConvOvfU2(CheckSigned(source))
				end if
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Decimal")) then
			m1 = convc::GetMethod("ToDecimal", new IKVM.Reflection.Type[] {source})
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Double")) then
			m1 = convc::GetMethod("ToDouble", new IKVM.Reflection.Type[] {source})
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Single")) then
			m1 = convc::GetMethod("ToSingle", new IKVM.Reflection.Type[] {source})
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Int64")) then
			m1 = convc::GetMethod("ToInt64", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				if GetPrimitiveNumericSize(source) <= 32 then
					ILEmitter::EmitConvI8(CheckSigned(source))
				else
					ILEmitter::EmitConvOvfI8(CheckSigned(source))
				end if
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.UInt64")) then
			m1 = convc::GetMethod("ToUInt64", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				ILEmitter::EmitConvU8(CheckSigned(source))
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Int32")) then
			m1 = convc::GetMethod("ToInt32", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				if GetPrimitiveNumericSize(source) <= 16 then
					ILEmitter::EmitConvI4()
				else
					ILEmitter::EmitConvOvfI4(CheckSigned(source))
				end if
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::LoadClass("System.UInt32")) then
			m1 = convc::GetMethod("ToUInt32", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				ILEmitter::EmitConvOvfU4(CheckSigned(source))
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Int16")) then
			m1 = convc::GetMethod("ToInt16", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				if GetPrimitiveNumericSize(source) <= 8 then
					ILEmitter::EmitConvI2()
				else
					ILEmitter::EmitConvOvfI2(CheckSigned(source))
				end if
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.UInt16")) then
			m1 = convc::GetMethod("ToUInt16", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				ILEmitter::EmitConvOvfU2(CheckSigned(source))
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.SByte")) then
			m1 = convc::GetMethod("ToSByte", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				ILEmitter::EmitConvOvfI1(CheckSigned(source))
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Byte")) then
			m1 = convc::GetMethod("ToByte", new IKVM.Reflection.Type[] {source})
			if IsPrimitiveIntegralType(source) then
				ILEmitter::EmitConvOvfU1(CheckSigned(source))
			elseif m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		elseif sink::Equals(Loader::CachedLoadClass("System.Boolean")) then
			m1 = convc::GetMethod("ToBoolean", new IKVM.Reflection.Type[] {source})
			if m1 != null then
				ILEmitter::EmitCall(m1)
			end if
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "No conversion from '" + source::ToString() + "' to '" + sink::ToString() + "' exists.")
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitConv(var source as IKVM.Reflection.Type, var sink as IKVM.Reflection.Type)
		EmitConv(source, sink, false)
	end method

	[method: ComVisible(false)]
	method public static void EmitMetCall(var met as MethodInfo, var stat as boolean)
		if stat orelse BaseFlg then
			ILEmitter::EmitCall(met)
		else
			if AsmFactory::Type05 is GenericTypeParameterBuilder then
				ILEmitter::EmitConstrained(AsmFactory::Type05)
				ILEmitter::EmitCallvirt(met)
			elseif met::get_IsVirtual() then
				if Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(AsmFactory::Type05) then
					ILEmitter::EmitCall(met)
				else
					ILEmitter::EmitCallvirt(met)
				end if
			else
				ILEmitter::EmitCallvirt(met)
			end if
		end if
		if AsmFactory::PopFlg then
			if !met::get_ReturnType()::Equals(Loader::CachedLoadClass("System.Void")) then
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
		if (AsmFactory::AddrFlg andalso Loader::CachedLoadClass("System.ValueType")::IsAssignableFrom(AsmFactory::Type04) andalso (AsmFactory::Type04 isnot GenericTypeParameterBuilder) ) _
			 orelse AsmFactory::ForcedAddrFlg then
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
			return SymTable::TypeLst::GetCtor(t, typs, t) ?? Loader::LoadCtor(t, typs)
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
			fldinf = SymTable::TypeLst::GetField(AsmFactory::CurnInhTyp,nam, AsmFactory::CurnInhTyp) ?? Loader::LoadField(AsmFactory::CurnInhTyp, nam)
			Loader::ProtectedFlag = false
		end if

		return fldinf
	end method

	[method: ComVisible(false)]
	method public static Emit.Label GetLbl(var nam as string)
		var lbl as Emit.Label
		var lbli as LabelItem = SymTable::FindLbl(nam)

		if lbli != null then
			lbl = lbli::Lbl
		end if

		return lbl
	end method

	[method: ComVisible(false)]
	method public static MethodNameTok StripDelMtdName(var t as Token)
		if t is Ident then
			return $MethodNameTok$#expr($Ident$t)
		elseif t is MethodCallTok then
			return #expr($MethodCallTok$t)::Name
		end if
		return null
	end method

	[method: ComVisible(false)]
	method public static Token SetPopFlg(var t as Token)

		var t2 as Token = t
		var t3 as MethodCallTok = null
		var t4 as NewCallTok = null
		var t5 as ObjInitCallTok = null

		do while true
			if t2 is MethodCallTok then 
				t3 = $MethodCallTok$t2
				if t3::Name::MemberAccessFlg then
					t2 = t3::Name::MemberToAccess
					continue
				else
					break
				end if
			elseif t2 is NewCallTok then
				t4 = $NewCallTok$t2
				if t4::MemberAccessFlg then
					t2 = t4::MemberToAccess
					continue
				else
					break
				end if
			elseif t2 is ObjInitCallTok then
				t5 = $ObjInitCallTok$t2
				if t5::MemberAccessFlg then
					t2 = t5::MemberToAccess
					continue
				else
					break
				end if
			elseif t2 is Ident then
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
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "MethodCall/NewCall/ObjInitCall statements should end their chain with a method call etc. and not a field load!!")
			end if
			t3::Name::MemberAccessFlg = false
			return t
		elseif t4 != null then
			t4::PopFlg = true
			if t4::MemberAccessFlg then
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "MethodCall/NewCall/ObjInitCall statements should end their chain with a method call etc. and not a field load!!")
			end if
			t4::MemberAccessFlg = false
			return t
		elseif t5 != null then
			t5::PopFlg = true
			if t5::MemberAccessFlg then
				StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "MethodCall/NewCall/ObjInitCall statements should end their chain with a method call etc. and not a field load!!")
			end if
			t5::MemberAccessFlg = false
			return t
		else
			return null
		end if

	end method

	[method: ComVisible(false)]
	method public static boolean CheckIfArrLen(var ind as Expr)
		return ind::Tokens::get_Count() == 1 andalso ind::Tokens::get_Item(0) is Ident andalso ind::Tokens::get_Item(0)::Value == "l"
	end method

	[method: ComVisible(false)]
	method public static TypeParamItem GetTPI(var name as string)
		if SymTable::MetGenParams::Contains(name) then
			return SymTable::MetGenParams::get_Item(name)
		elseif SymTable::CurnTypItem != null andalso SymTable::CurnTypItem::TypGenParams::Contains(name) then
				return SymTable::CurnTypItem::TypGenParams::get_Item(name)
		end if
		return null
	end method

	[method: ComVisible(false)]
	method public static IEnumerable<of IKVM.Reflection.Type> GetTypeInterfaces(var t as IKVM.Reflection.Type)
		if t is GenericTypeParameterBuilder then
			return GetTPI(t::get_Name())::Interfaces
		end if

		var ti as TypeItem = SymTable::TypeLst::GetTypeItem(t)
		if ti != null then
			return ti::Interfaces
		else
			return t::GetInterfaces()
		end if
	end method

	[method: ComVisible(false)]
	method public static MethodInfo GetExtMet(var t as IKVM.Reflection.Type, var mn as MethodNameTok, var paramtyps as IKVM.Reflection.Type[])
		if t == null then
			return null
		end if

		if t is GenericTypeParameterBuilder then
			var tpi = GetTPI(t::get_Name())
			var res = GetExtMet(tpi::BaseType, mn, paramtyps)

			if res != null then
				return res
			else
				foreach interf in tpi::Interfaces
					res = GetExtMet(interf, mn, paramtyps)
					if res != null then
						return res
					end if
				end for
			end if
			return null
		end if
		
		var mnstrarr as string[] = ParseUtils::StringParser(mn::Value, ':')
		var name as string = mnstrarr[--mnstrarr[l]]
		
		var m as MethodInfo = SymTable::TypeLst::GetMethod(t,mn,paramtyps, t)
		if m != null then
			return m
		else		
			if mn is GenericMethodNameTok then
				var gmn as GenericMethodNameTok = $GenericMethodNameTok$mn
				var genparams as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[gmn::Params::get_Count()]
				var i = -1
				foreach gp in gmn::Params
					i++
					genparams[i] = CommitEvalTTok(gp)
					if genparams[i] == null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Generic Argument {0} meant for Generic Method {1} could not be found!!", gp::ToString(), name))
					end if
				end for
				return Loader::LoadGenericMethod(t, name, genparams, paramtyps)
			else
				m = Loader::LoadMethod(t, name, paramtyps)
				if m != null then
					return m
				else
					if t::get_IsInterface() then
						return Loader::LoadMethod(Loader::CachedLoadClass("System.Object"), name, paramtyps)
					end if
				end if
			end if
		end if
		return null
	end method

	[method: ComVisible(false)]
	method public static MethodInfo GetExtMet(var ts as IEnumerable<of IKVM.Reflection.Type>, var mn as MethodNameTok, var paramtyps as IKVM.Reflection.Type[])
		foreach t in ts
			var res = GetExtMet(t, mn, paramtyps)
			if res != null then
				return res
			end if
		end for

		return null
	end method

	[method: ComVisible(false)]
	method public static MethodInfo GetLocMet(var mn as MethodNameTok, var typs as IKVM.Reflection.Type[])
		var mnstrarr as string[] = ParseUtils::StringParser(mn::Value, ':')
		var nam as string = mnstrarr[--mnstrarr[l]]
		var metinf as MethodInfo = null
		var meti as MethodInfo = null

		if mn is GenericMethodNameTok then
			var gmn as GenericMethodNameTok = $GenericMethodNameTok$mn
			var genparams as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[gmn::Params::get_Count()]
			var i = -1
			foreach gp in gmn::Params
				i++
				genparams[i] = CommitEvalTTok(gp)
				if genparams[i] == null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Generic Argument {0} meant for Generic Method {1} could not be found!!", gp::ToString(), nam))
				end if
			end for
			meti = SymTable::FindGenMet(nam, genparams, typs)
		else
			meti = SymTable::FindMet(nam, typs)
		end if
		
		if !BaseFlg andalso (meti != null) then
			metinf = meti
		else
			Loader::ProtectedFlag = true
			metinf = GetExtMet(AsmFactory::CurnInhTyp, mn, typs)
			Loader::ProtectedFlag = false
		end if

		return metinf
	end method
	
	[method: ComVisible(false)]
	method public static FieldInfo GetExtFld(var t as IKVM.Reflection.Type, var fld as string)
		if t == null then
			return null
		end if

		return SymTable::TypeLst::GetField(t, fld, t) ?? Loader::LoadField(t, fld)
	end method
	
	[method: ComVisible(false)]
	method public static PropertyInfo GetExtProp(var t as IKVM.Reflection.Type, var prop as string)
		if t == null then
			return null
		end if

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
		SymTable::MethodCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyFldAttrs()
		foreach ca in SymTable::FieldCALst
			AsmFactory::CurnFldB::SetCustomAttribute(ca)
		end for
		SymTable::FieldCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyClsAttrs()
		foreach ca in SymTable::ClassCALst
			AsmFactory::CurnTypB::SetCustomAttribute(ca)
		end for
		SymTable::ClassCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyAsmAttrs()	
		foreach ca in SymTable::AssemblyCALst
			AsmFactory::AsmB::SetCustomAttribute(ca)
		end for
		SymTable::AssemblyCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyPropAttrs()	
		foreach ca in SymTable::PropertyCALst
			AsmFactory::CurnPropB::SetCustomAttribute(ca)
		end for
		SymTable::PropertyCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyEventAttrs()	
		foreach ca in SymTable::EventCALst
			AsmFactory::CurnEventB::SetCustomAttribute(ca)
		end for
		SymTable::EventCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ApplyEnumAttrs()	
		foreach ca in SymTable::EnumCALst
			AsmFactory::CurnEnumB::SetCustomAttribute(ca)
		end for
		SymTable::EnumCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static CollectionItem ProcessCollection(var t as IKVM.Reflection.Type, var forcearr as boolean)
		
		if forcearr then
			return null
		end if
		
		var ci as CollectionItem = new CollectionItem()
		var ie as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Collections.Generic.ICollection`1")
		var ie2 as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Collections.ICollection")
		var ie3 as IKVM.Reflection.Type = null
		var flgs as boolean[] = new boolean[] {false, false}
		
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
			ci::ElemType = ie3::GetGenericArguments()[0]
		elseif flgs[1] then
			ie3 = ie2
			ci::ElemType = Loader::CachedLoadClass("System.Object")
		else
			foreach interf in GetTypeInterfaces(t)
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
				ci::ElemType = ie3::GetGenericArguments()[0]
			elseif flgs[1] then
				ie3 = ie2
				ci::ElemType = Loader::CachedLoadClass("System.Object")
			else
				return null
			end if
		end if
		
		ci::AddMtd = Loader::LoadMethod(ie3, "Add", new IKVM.Reflection.Type[] {ci::ElemType})
		ci::Ctor = GetLocCtor(t, IKVM.Reflection.Type::EmptyTypes)
		
		return ci
	end method
	
	
	//for IEnumerable<of T>
	[method: ComVisible(false)]
	method public static MethodInfo[] ProcessForeach(var t as IKVM.Reflection.Type)
		var arr as MethodInfo[] = new MethodInfo[3]
		var ie as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Collections.Generic.IEnumerable`1")
		var ie2 as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Collections.IEnumerable")
		var ie3 as IKVM.Reflection.Type = null
		var flgs as boolean[] = new boolean[] {false, false}
		
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
			foreach interf in GetTypeInterfaces(t)
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

				if !#expr(flgs[0] orelse flgs[1]) then
					var res = ProcessForeach(interf)
					if res != null then
						return res
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
	
	//for IEnumerator<of T>
	[method: ComVisible(false)]
	method public static MethodInfo[] ProcessForeach2(var t as IKVM.Reflection.Type)
		var ie as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Collections.Generic.IEnumerator`1")
		var ie2 as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Collections.IEnumerator")
		var ie3 as IKVM.Reflection.Type = null
		var flgs as boolean[] = new boolean[] {false, false}
		
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
			foreach interf in GetTypeInterfaces(t)
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

				if !#expr(flgs[0] orelse flgs[1]) then
					var res = ProcessForeach2(interf)
					if res != null then
						return res
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
		
		return new MethodInfo[] {Loader::LoadMethod(ie3, "MoveNext", IKVM.Reflection.Type::EmptyTypes), Loader::LoadMethod(ie3, "get_Current", IKVM.Reflection.Type::EmptyTypes)}
	end method

	//for Nullable<of T>
	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type ProcessNullable(var t as IKVM.Reflection.Type)
		var nult as IKVM.Reflection.Type = Loader::CachedLoadClass("System.Nullable`1")

		if t::get_IsGenericType() then
			if nult::Equals(t::GetGenericTypeDefinition()) then
				return t::GetGenericArguments()[0]
			end if
		end if

		return null
	end method

	[method: ComVisible(false)]
	method public static IEnumerable<of IKVM.Reflection.Type> GetInhHierarchy(var t as IKVM.Reflection.Type)
		var l = new C5.LinkedList<of IKVM.Reflection.Type> {t}
		do while t::get_BaseType() != null
			t = t::get_BaseType()
			l::Add(t)
		end do
		return l::Backwards()
	end method
	
	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type CheckCompat(var ta as IKVM.Reflection.Type,var tb as IKVM.Reflection.Type)
		if ta::Equals(tb) then
			return ta
		else
			if ta::get_IsEnum() andalso ta::GetEnumUnderlyingType()::Equals(tb) then
				return tb
			elseif tb::get_IsEnum() andalso tb::GetEnumUnderlyingType()::Equals(ta) then
				return ta
			end if
		
			var typ = Loader::CachedLoadClass("System.ValueType")
			if typ::IsAssignableFrom(ta) orelse typ::IsAssignableFrom(tb) then
				return null
			elseif ta::IsAssignableFrom(tb) then
				return ta
			elseif tb::IsAssignableFrom(ta) then
				return tb
			end if
			
			var la = GetInhHierarchy(ta)::GetEnumerator()
			var lb = GetInhHierarchy(tb)::GetEnumerator()
			var curans as IKVM.Reflection.Type = null
			do while la::MoveNext() and lb::MoveNext()
				if la::get_Current()::Equals(lb::get_Current()) then
					curans = la::get_Current()
				else
					return curans
				end if
			end do
			return curans
			
		end if
		//return null
	end method
	
	[method: ComVisible(false)]
	method public static void EmitNeg(var t as IKVM.Reflection.Type)
		var oo = Loader::LoadUnaOp(t, "op_UnaryNegation", t)
		if oo != null then
			ILEmitter::EmitCall(oo)
			AsmFactory::Type02 = oo::get_ReturnType()
		elseif t::Equals(Loader::CachedLoadClass("System.Boolean")) then
			ILEmitter::EmitNot()
		elseif CheckSigned(t) then
			ILEmitter::EmitNeg()
		elseif IsPrimitiveFPType(t) then
			ILEmitter::EmitNeg()
		elseif !t::get_IsValueType() then
			ILEmitter::EmitNotRef()
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '!' operation is undefined for '" + t::ToString() + "'.")
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void EmitNot(var t as IKVM.Reflection.Type)
		var oo = Loader::LoadUnaOp(t, "op_OnesComplement", t)
		if oo != null then
			ILEmitter::EmitCall(oo)
			AsmFactory::Type02 = oo::get_ReturnType()
		elseif IsPrimitiveIntegralType(t) then
			ILEmitter::EmitNotOther()
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '~' operation is undefined for '" + t::ToString() + "'.")
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void EmitInc(var t as IKVM.Reflection.Type)
		var oo = Loader::LoadUnaOp(t, "op_Increment", t)
		if oo != null then
			ILEmitter::EmitCall(oo)
			AsmFactory::Type02 = oo::get_ReturnType()
		elseif t::Equals(Loader::CachedLoadClass("System.Char")) then
			ILEmitter::EmitLdcChar(c'\x01')
			ILEmitter::EmitAdd(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Int32")) then
			ILEmitter::EmitLdcI4(1)
			ILEmitter::EmitAdd(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Int64")) then
			ILEmitter::EmitLdcI8(1l)
			ILEmitter::EmitAdd(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Int16")) then
			ILEmitter::EmitLdcI2(1s)
			ILEmitter::EmitAdd(true)
		elseif t::Equals(Loader::CachedLoadClass("System.SByte")) then
			ILEmitter::EmitLdcI1(1b)
			ILEmitter::EmitAdd(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Single")) then
			ILEmitter::EmitLdcR4(1f)
			ILEmitter::EmitAdd(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Double")) then
			ILEmitter::EmitLdcR8(1d)
			ILEmitter::EmitAdd(true)
		elseif t::Equals(Loader::CachedLoadClass("System.UInt32")) then
			ILEmitter::EmitLdcU4(1ui)
			ILEmitter::EmitAdd(false)
		elseif t::Equals(Loader::CachedLoadClass("System.UInt64")) then
			ILEmitter::EmitLdcU8(1ul)
			ILEmitter::EmitAdd(false)
		elseif t::Equals(Loader::CachedLoadClass("System.UInt16")) then
			ILEmitter::EmitLdcU2(1us)
			ILEmitter::EmitAdd(false)
		elseif t::Equals(Loader::CachedLoadClass("System.Byte")) then
			ILEmitter::EmitLdcU1(1ub)
			ILEmitter::EmitAdd(false)
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '++' operation is undefined for '" + t::ToString() + "'.")
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void EmitDec(var t as IKVM.Reflection.Type)
		var oo = Loader::LoadUnaOp(t, "op_Decrement", t)
		if oo != null then
			ILEmitter::EmitCall(oo)
			AsmFactory::Type02 = oo::get_ReturnType()
		elseif t::Equals(Loader::CachedLoadClass("System.Char")) then
			ILEmitter::EmitLdcChar(c'\x01')
			ILEmitter::EmitSub(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Int32")) then
			ILEmitter::EmitLdcI4(1)
			ILEmitter::EmitSub(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Int64")) then
			ILEmitter::EmitLdcI8(1l)
			ILEmitter::EmitSub(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Int16")) then
			ILEmitter::EmitLdcI2(1s)
			ILEmitter::EmitSub(true)
		elseif t::Equals(Loader::CachedLoadClass("System.SByte")) then
			ILEmitter::EmitLdcI1(1b)
			ILEmitter::EmitSub(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Single")) then
			ILEmitter::EmitLdcR4(1f)
			ILEmitter::EmitSub(true)
		elseif t::Equals(Loader::CachedLoadClass("System.Double")) then
			ILEmitter::EmitLdcR8(1d)
			ILEmitter::EmitSub(true)
		elseif t::Equals(Loader::CachedLoadClass("System.UInt32")) then
			ILEmitter::EmitLdcU4(1ui)
			ILEmitter::EmitSub(false)
		elseif t::Equals(Loader::CachedLoadClass("System.UInt64")) then
			ILEmitter::EmitLdcU8(1ul)
			ILEmitter::EmitSub(false)
		elseif t::Equals(Loader::CachedLoadClass("System.UInt16")) then
			ILEmitter::EmitLdcU2(1us)
			ILEmitter::EmitSub(false)
		elseif t::Equals(Loader::CachedLoadClass("System.Byte")) then
			ILEmitter::EmitLdcU1(1ub)
			ILEmitter::EmitSub(false)
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The '--' operation is undefined for '" + t::ToString() + "'.")
		end if
	end method
	
	[method: ComVisible(false)]
	method public static ConstInfo ProcessConstExpr(var exp as Expr)
		if exp::Tokens::get_Count() > 0 then
			if exp::Tokens::get_Item(0) is Literal then
				var lit as Literal = $Literal$exp::Tokens::get_Item(0)
				return new ConstInfo() {Typ = CommitEvalTTok(lit::LitTyp), Value = LiteralToConst(lit)}
			elseif exp::Tokens::get_Item(0) is Ident then
				var idtnamarr as string[] = ParseUtils::StringParser(#expr($Ident$exp::Tokens::get_Item(0))::Value, ':')
				var typ as IKVM.Reflection.Type = CommitEvalTTok(new TypeTok(idtnamarr[0]))
				if typ != null then
					if  GetExtFld(typ, idtnamarr[1]) != null then
						if Loader::FldLitFlag then
							return new ConstInfo() {Typ = Loader::FldLitTyp, Value = Loader::FldLitVal}
						else	
							StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Field '{0}' of the class '{1}' is not a constant.", idtnamarr[1], typ::ToString()))
						end if
					else
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Field '{0}' is not defined/accessible for the class '{1}'.", idtnamarr[1], typ::ToString()))
					end if
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", idtnamarr[0]))
				end if
			elseif exp::Tokens::get_Item(0) is GettypeCallTok then
				var val = Helpers::CommitEvalTTok(#expr($GettypeCallTok$exp::Tokens::get_Item(0))::Name)
				if val != null then
					return new ConstInfo() {Typ = Loader::CachedLoadClass("System.Type"), Value = val}
				else
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Class '{0}' is not defined.", #expr($GettypeCallTok$exp::Tokens::get_Item(0))::Name))
				end if
			elseif exp::Tokens::get_Item(0) is ArrInitCallTok then
				var aictok as ArrInitCallTok = $ArrInitCallTok$exp::Tokens::get_Item(0)
				var typ2 = CommitEvalTTok(aictok::ArrayType)
				if typ2 == null then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("The Class '{0}' is not defined.",aictok::ArrayType::ToString()))
				end if

				var val = Array::CreateInstance(gettype object, aictok::Elements::get_Count())
				var i = -1
				foreach elem in aictok::Elements
					i++
					var res = ProcessConstExpr(elem)

					NullExprFlg = res::Value == null
					CheckAssignability(typ2, res::Typ)

					val::SetValue(res::Value, i)
				end for

				return new ConstInfo() {Typ = typ2::MakeArrayType(), Value = val}
			end if			
		else
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Unexpected empty constant expression.")
		end if
		return null
	end method

end class