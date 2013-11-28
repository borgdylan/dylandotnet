//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static SymTable

	field private static C5.LinkedList<of C5.HashDictionary<of string, VarItem> > VarLst
	field public static C5.HashDictionary<of string, TypeParamItem> MetGenParams
	field public static C5.IList<of CustomAttributeBuilder> MethodCALst
	field public static C5.IList<of CustomAttributeBuilder> FieldCALst
	field public static C5.IList<of CustomAttributeBuilder> ClassCALst
	field public static C5.IList<of CustomAttributeBuilder> AssemblyCALst
	field public static C5.IList<of CustomAttributeBuilder> EventCALst
	field public static C5.IList<of CustomAttributeBuilder> PropertyCALst
	field public static C5.IList<of CustomAttributeBuilder> EnumCALst
	field public static C5.IDictionary<of integer, C5.LinkedList<of CustomAttributeBuilder> > ParameterCALst

	field public static TypeList TypeLst
	field public static TypeItem CurnTypItem
	field public static PropertyItem CurnProp
	field public static EventItem CurnEvent
	field public static PInvokeInfo PIInfo

	field private static FieldItem[] NestedFldLst
	field private static MethodItem[] NestedMetLst
	field private static CtorItem[] NestedCtorLst
	
	field private static C5.LinkedList<of IfItem> IfLst
	field private static C5.LinkedList<of LockItem> LockLst
	field private static C5.LinkedList<of UsingItem> UsingLst
	field private static C5.LinkedList<of LoopItem> LoopLst
	
	field assembly static C5.TreeSet<of string> DefSyms
	
	field private static LabelItem[] LblLst
	field public static boolean StoreFlg
	
	method public static void Init()()
		TypeLst = new TypeList()
		VarLst = new C5.LinkedList<of C5.HashDictionary<of string, VarItem> >()
		MetGenParams = new C5.HashDictionary<of string, TypeParamItem>()
		VarLst::Push(new C5.HashDictionary<of string, VarItem>())
		NestedFldLst = new FieldItem[0]
		NestedMetLst = new MethodItem[0]
		NestedCtorLst = new CtorItem[0]
		IfLst = new C5.LinkedList<of IfItem>()
		LockLst = new C5.LinkedList<of LockItem>()
		UsingLst = new C5.LinkedList<of UsingItem>()
		LoopLst = new C5.LinkedList<of LoopItem>()
		LblLst = new LabelItem[0]
		StoreFlg = false
		MethodCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		FieldCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		ClassCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		AssemblyCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		PropertyCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		EventCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		EnumCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		ParameterCALst = new C5.HashDictionary<of integer, C5.LinkedList<of CustomAttributeBuilder> >()
		DefSyms = new C5.TreeSet<of string>()
		CurnProp = null
		CurnEvent = null
		PIInfo = null
	end method

	method private static void SymTable()
		Init()
	end method

	[method: ComVisible(false)]
	method public static void ResetIf()
		IfLst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetLock()
		LockLst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetUsing()
		UsingLst::Clear()
	end method

	[method: ComVisible(false)]
	method public static void ResetLoop()
		LoopLst::Clear()
	end method

	[method: ComVisible(false)]
	method public static void ResetLbl()
		LblLst = new LabelItem[0]
	end method
	
	[method: ComVisible(false)]
	method public static void ResetVar()
		VarLst::Clear()
		VarLst::Push(new C5.HashDictionary<of string, VarItem>())
	end method
	
	[method: ComVisible(false)]
	method public static void ResetMetGenParams()
		MetGenParams = new C5.HashDictionary<of string, TypeParamItem>()
	end method
	
	[method: ComVisible(false)]
	method public static void SetMetGenParams(var names as string[], var actuals as GenericTypeParameterBuilder[])
		for i = 0 upto --names[l]
			MetGenParams::Add(names[i], new TypeParamItem(names[i], actuals[i]))
		end for
	end method
	
	[method: ComVisible(false)]
	method public static void ResetNestedFld()
		NestedFldLst = new FieldItem[0]
	end method
	
	[method: ComVisible(false)]
	method public static void ResetNestedMet()
		NestedMetLst = new MethodItem[0]
	end method

	[method: ComVisible(false)]
	method public static void ResetNestedCtor()
		NestedCtorLst = new CtorItem[0]
	end method

	[method: ComVisible(false)]
	method public static void AddVar(var nme as string, var la as boolean, var ind as integer, var typ as IKVM.Reflection.Type, var lin as integer)
		
		var flg = false
		foreach s in VarLst::Backwards()
			if s::Contains(nme) then
				if !flg then
					StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable '" + nme + "' is already declared in the current scope!")
					return
				else
					StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable '" + nme + "' will hide a variable in an outer scope!")
					break
				end if
			end if
			flg = true
		end for
		var vr = new VarItem(nme, la, ind, typ, lin)
		if StoreFlg then
			vr::Stored = true
		end if
		VarLst::get_Last()::Add(nme, vr)
	end method

	[method: ComVisible(false)]
	method public static void AddFld(var nme as string, var typ as IKVM.Reflection.Type, var fld as FieldBuilder, var litval as object)
		CurnTypItem::AddField(new FieldItem(nme, typ, fld, litval))
	end method
	
	[method: ComVisible(false)]
	method public static void AddMtdCA(var ca as CustomAttributeBuilder)
		if ca != null then
			MethodCALst::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddFldCA(var ca as CustomAttributeBuilder)
		if ca != null then
			FieldCALst::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddClsCA(var ca as CustomAttributeBuilder)
		if ca != null then
			ClassCALst::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddAsmCA(var ca as CustomAttributeBuilder)
		if ca != null then
			AssemblyCALst::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddEventCA(var ca as CustomAttributeBuilder)
		if ca != null then
			EventCALst::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddEnumCA(var ca as CustomAttributeBuilder)
		if ca != null then
			EnumCALst::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddPropCA(var ca as CustomAttributeBuilder)
		if ca != null then
			PropertyCALst::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddParamCA(var ind as integer,var ca as CustomAttributeBuilder)
		if ca != null then
			if !Enumerable::Contains<of integer>(ParameterCALst::get_Keys(),ind) then
				ParameterCALst::Add(ind, new C5.LinkedList<of CustomAttributeBuilder>())
			end if
			ParameterCALst::get_Item(ind)::Add(ca)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void AddNestedFld(var nme as string, var typ as IKVM.Reflection.Type, var fld as FieldBuilder)

		var i as integer = -1
		var destarr as FieldItem[] = new FieldItem[++NestedFldLst[l]]

		do until i = --NestedFldLst[l]
			i++
			destarr[i] = NestedFldLst[i]
		end do

		destarr[NestedFldLst[l]] = new FieldItem(nme, typ, fld, null)
		NestedFldLst = destarr

	end method

	[method: ComVisible(false)]
	method public static void AddMet(var nme as string, var typ as IKVM.Reflection.Type, var ptyps as IKVM.Reflection.Type[], var met as MethodBuilder, var nrgenparams as integer)
		CurnTypItem::AddMethod(new MethodItem(nme, typ, ptyps, met) {NrGenParams = nrgenparams})
	end method

	[method: ComVisible(false)]
	method public static void AddNestedMet(var nme as string, var typ as IKVM.Reflection.Type, var ptyps as IKVM.Reflection.Type[], var met as MethodBuilder)

		var i as integer = -1
		var destarr as MethodItem[] = new MethodItem[++NestedMetLst[l]]

		do until i = --NestedMetLst[l]
			i++
			destarr[i] = NestedMetLst[i]
		end do

		destarr[NestedMetLst[l]] = new MethodItem(nme, typ, ptyps, met)
		NestedMetLst = destarr

	end method
	
	[method: ComVisible(false)]
	method public static void AddCtor(var ptyps as IKVM.Reflection.Type[], var met as ConstructorBuilder)
		CurnTypItem::AddCtor(new CtorItem(ptyps, met))
	end method
	
	[method: ComVisible(false)]
	method public static void AddNestedCtor(var ptyps as IKVM.Reflection.Type[], var met as ConstructorBuilder)
		var vr as CtorItem = new CtorItem(ptyps, met)
		var len as integer = NestedCtorLst[l]
		var destl as integer = ++len
		var stopel as integer = --len
		var i as integer = -1
		var destarr as CtorItem[] = new CtorItem[destl]

		do until i = stopel
			i++
			destarr[i] = NestedCtorLst[i]
		end do

		destarr[len] = vr
		NestedCtorLst = destarr
	end method

	[method: ComVisible(false)]
	method public static void AddIf()
		IfLst::Push(new IfItem(ILEmitter::DefineLbl(), ILEmitter::DefineLbl(), ILEmitter::LineNr))
	end method
	
	[method: ComVisible(false)]
	method public static void AddLock(var loc as integer)
		LockLst::Push(new LockItem(loc, ILEmitter::LineNr))
	end method
	
	[method: ComVisible(false)]
	method public static void AddUsing(var loc as string)
		UsingLst::Push(new UsingItem(loc, ILEmitter::LineNr))
	end method

	[method: ComVisible(false)]
	method public static void AddLoop()
		LoopLst::Push(new LoopItem(ILEmitter::DefineLbl(), ILEmitter::DefineLbl(), ILEmitter::LineNr))
	end method
	
	[method: ComVisible(false)]
	method public static void AddForLoop(var iter as string, var _step as Expr, var dir as boolean, var t as TypeTok)
		LoopLst::Push(new ForLoopItem(ILEmitter::DefineLbl(), ILEmitter::DefineLbl(), iter, _step, dir, t, ILEmitter::LineNr))
	end method

	[method: ComVisible(false)]
	method public static void PopIf()
		IfLst::Pop()
	end method
	
	[method: ComVisible(false)]
	method public static void PopLock()
		LockLst::Pop()
	end method
	
	[method: ComVisible(false)]
	method public static void PopUsing()
		UsingLst::Pop()
	end method

	[method: ComVisible(false)]
	method public static void PopLoop()
		LoopLst::Pop()
	end method
	
	[method: ComVisible(false)]
	method public static void AddDef(var sym as string)
		DefSyms::Add(sym)
	end method

	[method: ComVisible(false)]
	method public static void UnDef(var sym as string)
		DefSyms::Remove(sym)
	end method
	
	[method: ComVisible(false)]
	method public static boolean EvalDef(var sym as string)
		return DefSyms::Find(ref sym)
	end method
	
	[method: ComVisible(false)]
	method public static Emit.Label ReadIfEndLbl()
		return IfLst::get_Last()::EndLabel
	end method

	[method: ComVisible(false)]
	method public static Emit.Label ReadIfNxtBlkLbl()
		return IfLst::get_Last()::NextBlkLabel
	end method
	
	[method: ComVisible(false)]
	method public static integer ReadLockeeLoc()
		return LockLst::get_Last()::LockeeLoc
	end method
	
	[method: ComVisible(false)]
	method public static string ReadUseeLoc()
		return UsingLst::get_Last()::UseeLoc
	end method

	[method: ComVisible(false)]
	method public static Emit.Label ReadLoopEndLbl()
		return LoopLst::get_Last()::EndLabel
	end method
	
	[method: ComVisible(false)]
	method public static LoopItem ReadLoop()
		return LoopLst::get_Last()
	end method

	[method: ComVisible(false)]
	method public static Emit.Label ReadLoopStartLbl()
		return LoopLst::get_Last()::StartLabel
	end method

	[method: ComVisible(false)]
	method public static boolean ReadIfElsePass()
		return IfLst::get_Last()::ElsePass
	end method

	[method: ComVisible(false)]
	method public static void SetIfElsePass()
		var ifi as IfItem = IfLst::get_Last()
		ifi::ElsePass = true
	end method

	[method: ComVisible(false)]
	method public static void SetIfNxtBlkLbl()
		var ifi as IfItem = IfLst::get_Last()
		ifi::NextBlkLabel = ILEmitter::DefineLbl()
	end method

	[method: ComVisible(false)]
	method public static void AddLbl(var nam as string)
		var i as integer = -1
		var destarr as LabelItem[] = new LabelItem[++LblLst[l]]

		do until i = --LblLst[l]
			i++
			destarr[i] = LblLst[i]
		end do

		destarr[LblLst[l]] = new LabelItem(nam, ILEmitter::DefineLbl())
		LblLst = destarr
	end method

	[method: ComVisible(false)]
	method public static VarItem FindVar(var nam as string)
		foreach s in VarLst::Backwards()
			if s::Contains(nam) then
				var v = s::get_Item(nam)
				if !StoreFlg then
					v::Used = true
					if !v::Stored and v::LocArg and !AsmFactory::ForcedAddrFlg then
						StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "The variable " + v::Name + " might not have been initialized.")
					end if
				end if
				return v
			end if
		end for
		return null
	end method

	[method: ComVisible(false)]
	method public static void CheckUnusedVar()
		var hm = VarLst::get_Last()
		foreach k in hm::get_Keys()
			var vlec = hm::get_Item(k)
			if !vlec::Used and vlec::LocArg then
				if vlec::Stored then
					StreamUtils::WriteWarn(vlec::Line, ILEmitter::CurSrcFile, "The variable " + vlec::Name + " was initialised but then not used.")
					foreach line in vlec::StoreLines
						if line != vlec::Line then
							StreamUtils::WriteWarn(line, ILEmitter::CurSrcFile, "The variable " + vlec::Name + " was initialised but then not used.")
						end if
					end for
				else
					StreamUtils::WriteWarn(vlec::Line, ILEmitter::CurSrcFile, "The variable " + vlec::Name + " was declared but never used.")
				end if
			end if
		end for
	end method
	
	[method: ComVisible(false)]
	method public static void CheckCtrlBlks()
		if IfLst::get_Count() != 0 then
			foreach ifite in IfLst
				StreamUtils::WriteError(ifite::Line, ILEmitter::CurSrcFile, "This If statement is unterminated.")
			end for
		elseif LoopLst::get_Count() != 0 then
			foreach lpite in LoopLst
				StreamUtils::WriteError(lpite::Line, ILEmitter::CurSrcFile, "This looping statement is unterminated.")
			end for
		elseif LockLst::get_Count() != 0 then
			foreach lckite in LockLst
				StreamUtils::WriteError(lckite::Line, ILEmitter::CurSrcFile, "This lock statement is unterminated.")
			end for
		elseif UsingLst::get_Count() != 0 then
			foreach usite in UsingLst
				StreamUtils::WriteError(usite::Line, ILEmitter::CurSrcFile, "This using statement is unterminated.")
			end for
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void PushScope()
		ILEmitter::BeginScope()
		VarLst::Push(new C5.HashDictionary<of string, VarItem>())
	end method
	
	[method: ComVisible(false)]
	method public static void PopScope()
		ILEmitter::EndScope()
		CheckUnusedVar()
		VarLst::Pop()
	end method

	[method: ComVisible(false)]
	method public static LabelItem FindLbl(var nam as string)

		var i as integer = -1
		do until i = --LblLst[l]
			i++
			if nam = LblLst[i]::LblName then
				return LblLst[i]
			end if
		end do

		return null
	end method

	[method: ComVisible(false)]
	method public static FieldInfo FindFld(var nam as string)
		return CurnTypItem::GetField(nam)
	end method

	[method: ComVisible(false)]
	method public static boolean CmpTyps(var arra as IKVM.Reflection.Type[], var arrb as IKVM.Reflection.Type[])
		if arra[l] = arrb[l] then
			if arra[l] = 0 then
				return true
			end if
			var i as integer = -1
			do until i = --arra[l]
				i++
				if arra[i]::IsAssignableFrom(arrb[i]) = false then
					return false
				end if
			end do
		else
			return false
		end if
		return true
	end method

	[method: ComVisible(false)]
	method public static MethodInfo FindMet(var nam as string, var paramst as IKVM.Reflection.Type[])
		return CurnTypItem::GetMethod(nam, paramst)
	end method
	
	[method: ComVisible(false)]
	method public static MethodInfo FindGenMet(var nam as string, var genparams as IKVM.Reflection.Type[], var paramst as IKVM.Reflection.Type[])
		return CurnTypItem::GetGenericMethod(nam, genparams, paramst)
	end method
	
	[method: ComVisible(false)]
	method public static MethodItem FindProtoMet(var nam as string, var paramst as IKVM.Reflection.Type[])
		return CurnTypItem::GetProtoMethod(nam,paramst)
	end method

	[method: ComVisible(false)]
	method public static MethodItem FindMetNoParams(var nam as string)
		foreach met in CurnTypItem::Methods
			if nam = met::Name then
				return met
			end if
		end for
		return null
	end method

	[method: ComVisible(false)]
	method public static ConstructorInfo FindCtor(var paramst as IKVM.Reflection.Type[])
		return CurnTypItem::GetCtor(paramst)
	end method

end class
