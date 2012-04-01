//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit SymTable

	field public static VarItem[] VarLst
	field public static FieldItem[] FldLst
	field public static FieldItem[] NestedFldLst
	field public static MethodItem[] MetLst
	field public static MethodItem[] NestedMetLst
	field public static CtorItem[] CtorLst
	field public static CtorItem[] NestedCtorLst
	field public static IfItem[] IfLst
	field public static LoopItem[] LoopLst
	field public static LabelItem[] LblLst
	field public static TypeArr[] TypLst
	field public static boolean StoreFlg

	method public static void SymTable()
		VarLst = new VarItem[0]
		FldLst = new FieldItem[0]
		NestedFldLst = new FieldItem[0]
		MetLst = new MethodItem[0]
		NestedMetLst = new MethodItem[0]
		CtorLst = new CtorItem[0]
		NestedCtorLst = new CtorItem[0]
		IfLst = new IfItem[0]
		LoopLst = new LoopItem[0]
		LblLst = new LabelItem[0]
		TypLst = new TypeArr[0]
		StoreFlg = false
	end method

	method public static void ResetIf()
		IfLst = new IfItem[0]
	end method

	method public static void ResetLoop()
		LoopLst = new LoopItem[0]
	end method

	method public static void ResetLbl()
		LblLst = new LabelItem[0]
	end method

	method public static void ResetVar()
		VarLst = new VarItem[0]
	end method

	method public static void ResetFld()
		FldLst = new FieldItem[0]
	end method

	method public static void ResetNestedFld()
		NestedFldLst = new FieldItem[0]
	end method

	method public static void ResetMet()
		MetLst = new MethodItem[0]
	end method

	method public static void ResetNestedMet()
		NestedMetLst = new MethodItem[0]
	end method

	method public static void ResetCtor()
		CtorLst = new CtorItem[0]
	end method

	method public static void ResetNestedCtor()
		NestedCtorLst = new CtorItem[0]
	end method

	method public static void AddVar(var nme as string, var la as boolean, var ind as integer, var typ as Type, var lin as integer)

		var i as integer = -1
		var destarr as VarItem[] = new VarItem[VarLst[l] + 1]

		do until i = (VarLst[l] - 1)
			i = i + 1
			destarr[i] = VarLst[i]
		end do

		destarr[VarLst[l]] = new VarItem(nme, la, ind, typ, lin)
		VarLst = destarr

	end method

	method public static integer AddTypArr(var arr as Type[])

		var vr as TypeArr = new TypeArr()
		vr::Arr = arr
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

	method public static Type[] PopTypArr()

		var b as TypeArr = TypLst[0]
		var i as integer = 0
		var j as integer
		var destarr as TypeArr[] = new TypeArr[TypLst[l] - 1]

		do until i >= (TypLst[l] - 1)
			i = i + 1
			j = i - 1
			destarr[j] = TypLst[i]
		end do

		TypLst = destarr

		return b::Arr

	end method


	method public static void AddFld(var nme as string, var typ as Type, var fld as FieldBuilder)

		var i as integer = -1
		var destarr as FieldItem[] = new FieldItem[FldLst[l] + 1]

		do until i = (FldLst[l] - 1)
			i = i + 1
			destarr[i] = FldLst[i]
		end do

		destarr[FldLst[l]] = new FieldItem(nme, typ, fld)
		FldLst = destarr

	end method

	method public static void AddNestedFld(var nme as string, var typ as Type, var fld as FieldBuilder)

		var i as integer = -1
		var destarr as FieldItem[] = new FieldItem[NestedFldLst[l] + 1]

		do until i = NestedFldLst[l] - 1
			i = i + 1
			destarr[i] = NestedFldLst[i]
		end do

		destarr[NestedFldLst[l]] = new FieldItem(nme, typ, fld)
		NestedFldLst = destarr

	end method

	method public static void AddMet(var nme as string, var typ as Type, var ptyps as Type[], var met as MethodBuilder)

		var i as integer = -1
		var destarr as MethodItem[] = new MethodItem[MetLst[l] + 1]

		do until i = (MetLst[l] - 1)
			i = i + 1
			destarr[i] = MetLst[i]
		end do

		destarr[MetLst[l]] = new MethodItem(nme, typ, ptyps, met)
		MetLst = destarr

	end method

	method public static void AddNestedMet(var nme as string, var typ as Type, var ptyps as Type[], var met as MethodBuilder)

		var i as integer = -1
		var destarr as MethodItem[] = new MethodItem[NestedMetLst[l] + 1]

		do until i = (NestedMetLst[l] - 1)
			i = i + 1
			destarr[i] = NestedMetLst[i]
		end do

		destarr[NestedMetLst[l]] = new MethodItem(nme, typ, ptyps, met)
		NestedMetLst = destarr

	end method

	method public static void AddCtor(var ptyps as Type[], var met as ConstructorBuilder)

		var i as integer = -1
		var destarr as CtorItem[] = new CtorItem[CtorLst[l] + 1]

		do until i = (CtorLst[l] - 1)
			i = i + 1
			destarr[i] = CtorLst[i]
		end do

		destarr[CtorLst[l]] = new CtorItem(ptyps, met)
		CtorLst = destarr

	end method

	method public static void AddNestedCtor(var ptyps as Type[], var met as ConstructorBuilder)

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

	method public static void AddIf()

		var i as integer = -1
		var destarr as IfItem[] = new IfItem[IfLst[l] + 1]

		do until i = (IfLst[l] - 1)
			i = i + 1
			destarr[i] = IfLst[i]
		end do

		destarr[IfLst[l]] = new IfItem(ILEmitter::DefineLbl(), ILEmitter::DefineLbl())
		IfLst = destarr

	end method

	method public static void AddLoop()

		var i as integer = -1
		var destarr as IfItem[] = new LoopItem[LoopLst[l] + 1]

		do until i = (LoopLst[l] - 1)
			i = i + 1
			destarr[i] = LoopLst[i]
		end do

		destarr[LoopLst[l]] = new LoopItem(ILEmitter::DefineLbl(), ILEmitter::DefineLbl())
		LoopLst = destarr

	end method


	method public static void PopIf()

		var i as integer = -1
		var destarr as IfItem[] = new IfItem[IfLst[l] - 1]

		do until i >= (IfLst[l] - 2)
			i = i + 1
			destarr[i] = IfLst[i]
		end do

		IfLst = destarr

	end method

	method public static void PopLoop()

		var i as integer = -1
		var destarr as LoopItem[] = new LoopItem[LoopLst[l] - 1]

		do until i >= (LoopLst[l] - 2)
			i = i + 1
			destarr[i] = LoopLst[i]
		end do

		LoopLst = destarr

	end method

	method public static Emit.Label ReadIfEndLbl()
		return IfLst[IfLst[l] - 1]::EndLabel
	end method

	method public static Emit.Label ReadIfNxtBlkLbl()
		return IfLst[IfLst[l] - 1]::NextBlkLabel
	end method

	method public static Emit.Label ReadLoopEndLbl()
		return LoopLst[LoopLst[l] - 1]::EndLabel
	end method

	method public static Emit.Label ReadLoopStartLbl()
		return LoopLst[LoopLst[l] - 1]::StartLabel
	end method

	method public static boolean ReadIfElsePass()
		return IfLst[IfLst[l] - 1]::ElsePass
	end method

	method public static void SetIfElsePass()
		var ifi as IfItem = IfLst[IfLst[l] - 1]
		ifi::ElsePass = true
	end method

	method public static void SetIfNxtBlkLbl()
		var ifi as IfItem = IfLst[IfLst[l] - 1]
		ifi::NextBlkLabel = ILEmitter::DefineLbl()
	end method

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


	method public static VarItem FindVar(var nam as string)

		var i as integer = -1
		do until i = (VarLst[l] - 1)
			i = i + 1
			if nam = VarLst[i]::Name then
				var vai as VarItem = VarLst[i]
				if StoreFlg == false then
					vai::Used = true
				end if
				return vai
			end if
		end do

		return null
	end method

	method public static void ResetUsed(var nam as string)
		var i as integer = -1
		do until i = (VarLst[l] - 1)
			i = i + 1
			if nam = VarLst[i]::Name then
				var vai as VarItem = VarLst[i]
				vai::Used = false
			end if
		end do
	end method

	method public static void CheckUnusedVar()
		var i as integer = -1
		do until i = (VarLst[l] - 1)
			i = i + 1
			if (VarLst[i]::Used = false) and VarLst[i]::LocArg then
				if VarLst[i]::Stored then
					StreamUtils::WriteWarn(VarLst[i]::Line, ILEmitter::CurSrcFile, "The variable " + VarLst[i]::Name + " was initialised but then not used.")
				else
					StreamUtils::WriteWarn(VarLst[i]::Line, ILEmitter::CurSrcFile, "The variable " + VarLst[i]::Name + " was declared but never used.")
				end if
			end if
		end do
	end method

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

	method public static FieldItem FindFld(var nam as string)

		var i as integer = -1
		do until i = (FldLst[l] - 1)
			i = i + 1
			if nam = FldLst[i]::Name then
				return FldLst[i]
			end if
		end do

		return null
	end method

	method public static boolean CmpTyps(var arra as Type[], var arrb as Type[])

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

	method public static MethodItem FindMet(var nam as string, var params as Type[])

		var i as integer = -1
		do until i = (MetLst[l] - 1)
			i = i + 1
			if nam = MetLst[i]::Name then
				if CmpTyps(MetLst[i]::ParamTyps, params) then
					return MetLst[i]
				end if
			end if
		end do

		return null
	end method

	method public static MethodItem FindMetNoParams(var nam as string)

		var i as integer = -1
		do until i = (MetLst[l] - 1)
			i = i + 1
			if nam = MetLst[i]::Name then
				return MetLst[i]
			end if
		end do

		return null
	end method

	method public static CtorItem FindCtor(var params as Type[])

		var i as integer = -1
		do until i = (CtorLst[l] - 1)
			i = i + 1
			if CmpTyps(CtorLst[i]::ParamTyps, params) then
				return CtorLst[i]
			end if
		end do

		return null
	end method

end class
