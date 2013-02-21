//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static SymTable

	field private static C5.LinkedList<of C5.HashDictionary<of string, VarItem> > VarLst
	field public static C5.IList<of CustomAttributeBuilder> MethodCALst
	field public static C5.IList<of CustomAttributeBuilder> FieldCALst
	field public static C5.IList<of CustomAttributeBuilder> ClassCALst
	field public static C5.IList<of CustomAttributeBuilder> AssemblyCALst
	field public static C5.IList<of CustomAttributeBuilder> EventCALst
	field public static C5.IList<of CustomAttributeBuilder> PropertyCALst
	field public static C5.IDictionary<of integer, C5.LinkedList<of CustomAttributeBuilder> > ParameterCALst

	field public static TypeList TypeLst
	field public static TypeItem CurnTypItem

	field private static FieldItem[] NestedFldLst
	field private static MethodItem[] NestedMetLst
	field private static CtorItem[] NestedCtorLst
	
	field private static C5.LinkedList<of IfItem> IfLst
	field private static C5.LinkedList<of LockItem> LockLst
	field private static C5.LinkedList<of LoopItem> LoopLst
	
	field assembly static C5.TreeSet<of string> DefSyms
	
	field private static LabelItem[] LblLst
	field private static TypeArr[] TypLst
	field public static boolean StoreFlg
	
	method private static void SymTable()
		TypeLst = new TypeList()
		VarLst = new C5.LinkedList<of C5.HashDictionary<of string, VarItem> >()
		VarLst::Push(new C5.HashDictionary<of string, VarItem>())
		NestedFldLst = new FieldItem[0]
		NestedMetLst = new MethodItem[0]
		NestedCtorLst = new CtorItem[0]
		IfLst = new C5.LinkedList<of IfItem>()
		LockLst = new C5.LinkedList<of LockItem>()
		LoopLst = new C5.LinkedList<of LoopItem>()
		LblLst = new LabelItem[0]
		TypLst = new TypeArr[0]
		StoreFlg = false
		MethodCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		FieldCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		ClassCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		AssemblyCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		PropertyCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		EventCALst = new C5.LinkedList<of CustomAttributeBuilder>()
		ParameterCALst = new C5.HashDictionary<of integer, C5.LinkedList<of CustomAttributeBuilder> >()
		DefSyms = new C5.TreeSet<of string>()
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

//	method public static void ResetFld()
//		FldLst::Clear()
//	end method

	[method: ComVisible(false)]
	method public static void ResetNestedFld()
		NestedFldLst = new FieldItem[0]
	end method

//	method public static void ResetMet()
//		MetLst::Clear()
//	end method

	[method: ComVisible(false)]
	method public static void ResetMetCAs()
		MethodCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetFldCAs()
		FieldCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetClsCAs()
		ClassCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetAsmCAs()
		AssemblyCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetPropCAs()
		PropertyCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetEventCAs()
		EventCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetParamCAs()
		ParameterCALst::Clear()
	end method
	
	[method: ComVisible(false)]
	method public static void ResetNestedMet()
		NestedMetLst = new MethodItem[0]
	end method

//	method public static void ResetCtor()
//		CtorLst::Clear()
//	end method

	[method: ComVisible(false)]
	method public static void ResetNestedCtor()
		NestedCtorLst = new CtorItem[0]
	end method

	[method: ComVisible(false)]
	method public static void AddVar(var nme as string, var la as boolean, var ind as integer, var typ as IKVM.Reflection.Type, var lin as integer)
		if VarLst::get_Last()::Contains(nme) then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Variable '" + nme + "' is already declared in the current scope!")
		else
			VarLst::get_Last()::Add(nme, new VarItem(nme, la, ind, typ, lin))
		end if
	end method

	[method: ComVisible(false)]
	method public static integer AddTypArr(var arr as IKVM.Reflection.Type[])

		var vr as TypeArr = new TypeArr() {Arr = arr}
		var i as integer = -1
		var destarr as TypeArr[] = new TypeArr[TypLst[l] + 1]

		do until i = (TypLst[l] - 1)
			i = i + 1
			destarr[i] = TypLst[i]
		end do

		destarr[TypLst[l]] = vr
		TypLst = destarr
		return TypLst[l] - 1
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type[] PopTypArr()

		var b as TypeArr = TypLst[0]
		var i as integer = 0
		var j as integer
		var destarr as TypeArr[] = new TypeArr[TypLst[l] - 1]

		do until i >= (TypLst[l] - 1)
			j = i
			i = i + 1
			destarr[j] = TypLst[i]
		end do

		TypLst = destarr

		return b::Arr

	end method

	[method: ComVisible(false)]
	method public static void AddFld(var nme as string, var typ as IKVM.Reflection.Type, var fld as FieldBuilder)
		CurnTypItem::AddField(new FieldItem(nme, typ, fld))
	end method
	
	[method: ComVisible(false)]
	method public static void AddMtdCA(var ca as CustomAttributeBuilder)
		MethodCALst::Add(ca)
	end method
	
	[method: ComVisible(false)]
	method public static void AddFldCA(var ca as CustomAttributeBuilder)
		FieldCALst::Add(ca)
	end method
	
	[method: ComVisible(false)]
	method public static void AddClsCA(var ca as CustomAttributeBuilder)
		ClassCALst::Add(ca)
	end method
	
	[method: ComVisible(false)]
	method public static void AddAsmCA(var ca as CustomAttributeBuilder)
		AssemblyCALst::Add(ca)
	end method
	
	[method: ComVisible(false)]
	method public static void AddEventCA(var ca as CustomAttributeBuilder)
		EventCALst::Add(ca)
	end method
	
	[method: ComVisible(false)]
	method public static void AddPropCA(var ca as CustomAttributeBuilder)
		PropertyCALst::Add(ca)
	end method
	
	[method: ComVisible(false)]
	method public static void AddParamCA(var ind as integer,var ca as CustomAttributeBuilder)
		if Enumerable::Contains<of integer>(ParameterCALst::get_Keys(),ind) == false then
			ParameterCALst::Add(ind, new C5.LinkedList<of CustomAttributeBuilder>())
		end if
		ParameterCALst::get_Item(ind)::Add(ca)
	end method
	
	[method: ComVisible(false)]
	method public static void AddNestedFld(var nme as string, var typ as IKVM.Reflection.Type, var fld as FieldBuilder)

		var i as integer = -1
		var destarr as FieldItem[] = new FieldItem[NestedFldLst[l] + 1]

		do until i = NestedFldLst[l] - 1
			i = i + 1
			destarr[i] = NestedFldLst[i]
		end do

		destarr[NestedFldLst[l]] = new FieldItem(nme, typ, fld)
		NestedFldLst = destarr

	end method

	[method: ComVisible(false)]
	method public static void AddMet(var nme as string, var typ as IKVM.Reflection.Type, var ptyps as IKVM.Reflection.Type[], var met as MethodBuilder)
		CurnTypItem::AddMethod(new MethodItem(nme, typ, ptyps, met))
	end method

	[method: ComVisible(false)]
	method public static void AddNestedMet(var nme as string, var typ as IKVM.Reflection.Type, var ptyps as IKVM.Reflection.Type[], var met as MethodBuilder)

		var i as integer = -1
		var destarr as MethodItem[] = new MethodItem[NestedMetLst[l] + 1]

		do until i = (NestedMetLst[l] - 1)
			i = i + 1
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
		var destl as integer = len + 1
		var stopel as integer = len - 1
		var i as integer = -1
		var destarr as CtorItem[] = new CtorItem[destl]

		do until i = stopel
			i = i + 1
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
	method public static void AddLoop()
		LoopLst::Push(new LoopItem(ILEmitter::DefineLbl(), ILEmitter::DefineLbl(), ILEmitter::LineNr))
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
	method public static Emit.Label ReadLoopEndLbl()
		return LoopLst::get_Last()::EndLabel
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
		var destarr as LabelItem[] = new LabelItem[LblLst[l] + 1]

		do until i = (LblLst[l] - 1)
			i = i + 1
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
				if StoreFlg == false then
					v::Used = true
				end if
				return v
			end if
		end for
		return null
	end method

	[method: ComVisible(false)]
	method public static void ResetUsed(var nam as string)
		foreach s in VarLst::Backwards()
			if s::Contains(nam) then
				var v = s::get_Item(nam)
				v::Used = false
			end if
		end for
	end method

	[method: ComVisible(false)]
	method public static void CheckUnusedVar()
		var hm = VarLst::get_Last()
		foreach k in hm::get_Keys()
			var vlec = hm::get_Item(k)
			if (vlec::Used = false) and vlec::LocArg then
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
		do until i = (LblLst[l] - 1)
			i = i + 1
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
			do until i = (arra[l] - 1)
				i = i + 1
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
		return CurnTypItem::GetMethod(nam,paramst)
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
