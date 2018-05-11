//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import System.Runtime.InteropServices
import Managed.Reflection

class public partial static Loader

	[method: ComVisible(false)]
	method public static prototype Managed.Reflection.Type LoadClass(var name as string)

	[method: ComVisible(false)]
	method public static prototype Managed.Reflection.Type CachedLoadClass(var name as string)

end class

enum public integer BranchOptimisation
	None = 0
	Inverted = 1
	Normal = 2
end enum

class public static ILEmitter

	field public static Managed.Reflection.Emit.MethodBuilder Met
	field public static Managed.Reflection.Emit.ConstructorBuilder Constr
	field assembly static Managed.Reflection.Emit.ILGenerator ILGen
	field public static Managed.Reflection.Emit.ISymbolDocumentWriter DocWriter
	field public static boolean StaticFlg
	field public static boolean AbstractFlg
	field public static boolean AbstractCFlg
	field public static boolean StructFlg
	field public static boolean InterfaceFlg
	field public static boolean PartialFlg
	field public static boolean StaticCFlg
	field public static boolean DebugFlg
	field public static boolean ProtoFlg
	field public static boolean PInvokeFlg
	field public static boolean OverrideFlg
	//field public static boolean ANIFlg
	field public static integer LocInd
	field public static integer ArgInd
	field public static integer LineNr
	field public static string CurSrcFile
	field public static C5.LinkedList<of string> SrcFiles
	field public static C5.LinkedList<of Managed.Reflection.Emit.ISymbolDocumentWriter> DocWriters
	field public static Universe Univ

	[method: ComVisible(false)]
	method public static void Init()
		Univ = new Universe(UniverseOptions::MetadataOnly)
		Met = null
		Constr = null
		ILGen = null
		StaticFlg = false
		AbstractFlg = false
		AbstractCFlg = false
		StructFlg = false
		InterfaceFlg = false
		StaticCFlg = false
		DebugFlg = false
		ProtoFlg = false
		PartialFlg = false
		PInvokeFlg = false
		OverrideFlg = false
		LocInd = 0
		ArgInd = 0
		LineNr = 0
		CurSrcFile = string::Empty
		SrcFiles = new C5.LinkedList<of string>()
		DocWriters = new C5.LinkedList<of Managed.Reflection.Emit.ISymbolDocumentWriter>()
		//ANIFlg = false
	end method

	method private static void ILEmitter()
		Init()
	end method

	[method: ComVisible(false)]
	method public static void AddSrcFile(var srcf as string)
		SrcFiles::Push(srcf)
	end method

	[method: ComVisible(false)]
	method public static void PopSrcFile()
		SrcFiles::Pop()
	end method

	[method: ComVisible(false)]
	method public static void AddDocWriter(var srcf as Managed.Reflection.Emit.ISymbolDocumentWriter)
		DocWriters::Push(srcf)
	end method

	[method: ComVisible(false)]
	method public static void PopDocWriter()
		DocWriters::Pop()
	end method

	[method: ComVisible(false)]
	method public static void EmitRet()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ret)
	end method

	[method: ComVisible(false)]
	method public static void EmitDup()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Dup)
	end method

	[method: ComVisible(false)]
	method public static void EmitPop()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Pop)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdlen()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldlen)
	end method

	[method: ComVisible(false)]
	method public static void EmitBox(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Box, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitUnbox(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Unbox, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitUnboxAny(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Unbox_Any, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitCastclass(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Castclass, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitIsinst(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Isinst, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitIs(var t as Managed.Reflection.Type, var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Isinst, t)
		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldnull)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brfalse, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brtrue, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitIsNot(var t as Managed.Reflection.Type, var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Isinst, t)
		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldnull)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brtrue, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brfalse, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitConstrained(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Constrained, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdloc(var num as integer)
		if num > -1 andalso num < 4 then
			switch num
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloc_0)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloc_1)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloc_2)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloc_3)
			end switch
		elseif num <= 255 then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloc_S, $byte$num)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloc, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdloca(var num as integer)
		if num <= 255 then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloca_S, $byte$num)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldloca, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdarg(var num as integer)
		if num > -1 andalso num < 4 then
			switch num
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarg_0)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarg_1)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarg_2)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarg_3)
			end switch
		elseif num <= 255 then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarg_S, $byte$num)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarg, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdarga(var num as integer)
		if num <= 255 then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarga_S, $byte$num)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldarga, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStloc(var num as integer)
		if num > -1 andalso num < 4 then
			switch num
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stloc_0)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stloc_1)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stloc_2)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stloc_3)
			end switch
		elseif num <= 255 then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stloc_S, $byte$num)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stloc, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStarg(var num as integer)
		if num <= 255 then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Starg_S, $byte$num)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Starg, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStfld(var fld as Managed.Reflection.FieldInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stfld, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitStsfld(var fld as Managed.Reflection.FieldInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stsfld, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitStelem(var typ as Managed.Reflection.Type)
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_I4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem_Ref)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stelem, typ)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStind(var typ as Managed.Reflection.Type)
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_I4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stobj, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stind_Ref)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Stobj, typ)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitIsStore(var t as Managed.Reflection.Type, var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label, var num as integer)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Isinst, t)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Dup)
		EmitStloc(num)

		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldnull)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brfalse, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brtrue, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitLdelem(var typ as Managed.Reflection.Type)
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_I4)
		elseif Loader::LoadClass("System.Byte")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_U1)
		elseif Loader::LoadClass("System.UInt16")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_U2)
		elseif Loader::LoadClass("System.UInt32")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_U4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem_Ref)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelem, typ)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdind(var typ as Managed.Reflection.Type)
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_I4)
		elseif Loader::LoadClass("System.Byte")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_U1)
		elseif Loader::LoadClass("System.UInt16")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_U2)
		elseif Loader::LoadClass("System.UInt32")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_U4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldobj, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldind_Ref)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldobj, typ)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdelema(var typ as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldelema, typ)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI8(var n as long)
		if n == -1l then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_M1)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I8)
		elseif n > -1l andalso n < 9l then
			switch n
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_1)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_2)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_3)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_4)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_5)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_6)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_7)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_8)
			end switch
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I8)
		elseif (n >= $long$integer::MinValue) andalso (n <= $long$integer::MaxValue) then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4, $integer$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I8)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I8, n)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcU8(var n as ulong)
		if n >= 0ul andalso n < 9ul then
			switch n
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_1)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_2)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_3)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_4)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_5)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_6)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_7)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_8)
			end switch
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U8)
		elseif n <= $ulong$integer::MaxValue then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4, $integer$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U8)
		elseif n <= $ulong$long::MaxValue then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I8, $long$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U8)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldstr, $string$n)
			var convc as Managed.Reflection.Type = Loader::CachedLoadClass("System.Convert")
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, convc::GetMethod("ToUInt64", new Managed.Reflection.Type[] {Loader::CachedLoadClass("System.String")}))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI4(var n as integer)
		if n == -1 then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_M1)
		elseif n > -1 andalso n < 9 then
			switch n
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_1)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_2)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_3)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_4)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_5)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_6)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_7)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_8)
			end switch
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4, n)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcU4(var n as uinteger)
		var num as long = $long$n
		if num > -1l andalso num < 9l then
			switch num
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_1)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_2)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_3)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_4)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_5)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_6)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_7)
			state
				ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_8)
			end switch
		elseif num <= $long$integer::MaxValue then
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4, $integer$num)
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I8, num)
		end if
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U4)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI2(var n as short)
		EmitLdcI4($integer$n)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I2)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcU2(var n as ushort)
		EmitLdcI4($integer$n)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U2)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI1(var n as sbyte)
		EmitLdcI4($integer$n)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I1)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcU1(var n as byte)
		EmitLdcI4($integer$n)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U1)
	end method

	[method: ComVisible(false)]
	method public static void EmitThrow()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Throw)
	end method

	[method: ComVisible(false)]
	method public static void EmitRethrow()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Rethrow)
	end method

	[method: ComVisible(false)]
	method public static void EmitTry()
		ILGen::BeginExceptionBlock()
	end method

	[method: ComVisible(false)]
	method public static void EmitCatchFilter()
		ILGen::BeginExceptFilterBlock()
	end method

	[method: ComVisible(false)]
	method public static void EmitFinally()
		ILGen::BeginFinallyBlock()
	end method

	[method: ComVisible(false)]
	method public static void EmitCatch(var e as Managed.Reflection.Type)
		ILGen::BeginCatchBlock(e)
	end method

	[method: ComVisible(false)]
	method public static void EmitEndTry()
		ILGen::EndExceptionBlock()
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcR4(var num as single)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_R4, num)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcR8(var num as double)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_R8, num)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcDec(var n as decimal)
		var dec as Managed.Reflection.Type = Loader::CachedLoadClass("System.Decimal")
		var temps as single
		var tempd as double
		if (Math::Ceiling(n) == n) andalso ($decimal$integer::MinValue <= n) andalso (n <= $decimal$integer::MaxValue) then
			EmitLdcI4($integer$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new Managed.Reflection.Type[] {Loader::CachedLoadClass("System.Int32")}))
		elseif (Math::Ceiling(n) == n) andalso ($decimal$long::MinValue <= n) andalso (n <= $decimal$long::MaxValue) then
			EmitLdcI8($long$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new Managed.Reflection.Type[] {Loader::CachedLoadClass("System.Int64")}))
		elseif single::TryParse($string$n, ref temps) then
			EmitLdcR4($single$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new Managed.Reflection.Type[] {Loader::CachedLoadClass("System.Single")}))
		elseif double::TryParse($string$n, ref tempd) then
			EmitLdcR8($double$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new Managed.Reflection.Type[] {Loader::CachedLoadClass("System.Double")}))
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldstr,$string$n)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, dec::GetMethod("Parse",new Managed.Reflection.Type[] {Loader::CachedLoadClass("System.String")}))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitCallvirt(var met as Managed.Reflection.MethodInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Callvirt, met)
	end method

	[method: ComVisible(false)]
	method public static void EmitCallCtor(var met as Managed.Reflection.ConstructorInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, met)
	end method

	[method: ComVisible(false)]
	method public static void EmitCall(var met as Managed.Reflection.MethodInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, met)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdftn(var met as Managed.Reflection.MethodInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldftn, met)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdvirtftn(var met as Managed.Reflection.MethodInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldvirtftn, met)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdfld(var fld as Managed.Reflection.FieldInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldfld, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdsfld(var fld as Managed.Reflection.FieldInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldsfld, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdflda(var fld as Managed.Reflection.FieldInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldflda, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdsflda(var fld as Managed.Reflection.FieldInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldsflda, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdstr(var str as string)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldstr, str)
	end method

	[method: ComVisible(false)]
	method public static void EmitAdd(var s as boolean)
		ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Add, Managed.Reflection.Emit.OpCodes::Add_Ovf_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitDiv(var s as boolean)
		ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Div, Managed.Reflection.Emit.OpCodes::Div_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitMul(var s as boolean)
		ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Mul, Managed.Reflection.Emit.OpCodes::Mul_Ovf_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitSub(var s as boolean)
		ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Sub, Managed.Reflection.Emit.OpCodes::Sub_Ovf_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitRem(var s as boolean)
		ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Rem, Managed.Reflection.Emit.OpCodes::Rem_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitShl()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Shl)
	end method

	[method: ComVisible(false)]
	method public static void EmitShr(var s as boolean)
		ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Shr, Managed.Reflection.Emit.OpCodes::Shr_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitAnd()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::And)
	end method

	[method: ComVisible(false)]
	method public static void EmitOr()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Or)
	end method

	[method: ComVisible(false)]
	method public static void EmitXor()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Xor)
	end method

	[method: ComVisible(false)]
	method public static void EmitNot(var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brtrue, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brfalse, lab)
		end switch
	end method

	//true if null
	[method: ComVisible(false)]
	method public static void EmitNotRef(var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldnull)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brtrue, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brfalse, lab)
		end switch
	end method

	//true if not null
	[method: ComVisible(false)]
	method public static void EmitIsNotRef(var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldnull)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brfalse, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brtrue, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitNotOther()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitNeg()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Neg)
	end method

	[method: ComVisible(false)]
	method public static void EmitNand()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::And)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitNandOther()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::And)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitNor()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Or)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitNorOther()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Or)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitXnor()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Xor)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitXnorOther()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Xor)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitCeq(var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Bne_Un, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Beq, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitCneq(var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Beq, lab)
		state
			//normal
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Bne_Un, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitCgt(var s as boolean, var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Cgt, Managed.Reflection.Emit.OpCodes::Cgt_Un})
		state
			//inverted
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Ble, Managed.Reflection.Emit.OpCodes::Ble_Un}, lab)
		state
			//normal
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Bgt, Managed.Reflection.Emit.OpCodes::Bgt_Un}, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitClt(var s as boolean, var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Clt, Managed.Reflection.Emit.OpCodes::Clt_Un})
		state
			//inverted
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Bge, Managed.Reflection.Emit.OpCodes::Bge_Un}, lab)
		state
			//normal
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Blt, Managed.Reflection.Emit.OpCodes::Blt_Un}, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitCle(var s as boolean, var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Cgt, Managed.Reflection.Emit.OpCodes::Cgt_Un})
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Bgt, Managed.Reflection.Emit.OpCodes::Bgt_Un}, lab)
		state
			//normal
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Ble, Managed.Reflection.Emit.OpCodes::Ble_Un}, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitCge(var s as boolean, var bo as BranchOptimisation, var lab as Managed.Reflection.Emit.Label)
		switch $integer$bo
		state
			//none
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Clt, Managed.Reflection.Emit.OpCodes::Clt_Un})
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		state
			//inverted
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Blt, Managed.Reflection.Emit.OpCodes::Blt_Un}, lab)
		state
			//normal
			ILGen::Emit(#ternary{s ? Managed.Reflection.Emit.OpCodes::Bge, Managed.Reflection.Emit.OpCodes::Bge_Un}, lab)
		end switch
	end method

	[method: ComVisible(false)]
	method public static void EmitLike()
		var lotyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.Text.RegularExpressions.Regex")
		var strtyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.String")
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, lotyp::GetMethod("IsMatch",new Managed.Reflection.Type[] {strtyp, strtyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitNLike()
		var lotyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.Text.RegularExpressions.Regex")
		var strtyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.String")
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, lotyp::GetMethod("IsMatch",new Managed.Reflection.Type[] {strtyp, strtyp}))
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitStrCeq()
		var strtyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.String")
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, strtyp::GetMethod("Compare",new Managed.Reflection.Type[] {strtyp, strtyp}))
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitStrCneq()
		var strtyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.String")
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, strtyp::GetMethod("Compare",new Managed.Reflection.Type[] {strtyp, strtyp}))
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitStrAdd()
		var strtyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.String")
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, strtyp::GetMethod("Concat",new Managed.Reflection.Type[] {strtyp, strtyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitDelegateAdd()
		var deltyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.Delegate")
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, deltyp::GetMethod("Combine",new Managed.Reflection.Type[] {deltyp, deltyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitDelegateSub()
		var deltyp as Managed.Reflection.Type = Loader::CachedLoadClass("System.Delegate")
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Call, deltyp::GetMethod("Remove",new Managed.Reflection.Type[] {deltyp, deltyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcBool(var b as boolean)
		ILGen::Emit(#ternary{b ? Managed.Reflection.Emit.OpCodes::Ldc_I4_1, Managed.Reflection.Emit.OpCodes::Ldc_I4_0})
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcChar(var c as char)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldc_I4, $integer$c)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdnull()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldnull)
	end method

	[method: ComVisible(false)]
	method public static void EmitNewobj(var c as Managed.Reflection.ConstructorInfo)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Newobj, c)
	end method

	[method: ComVisible(false)]
	method public static void EmitBr(var lbl as Managed.Reflection.Emit.Label)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Br, lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitSwitch(var lbls as Managed.Reflection.Emit.Label[])
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Switch, lbls)
	end method

	[method: ComVisible(false)]
	method public static void EmitLeave(var lbl as Managed.Reflection.Emit.Label)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Leave, lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitBrfalse(var lbl as Managed.Reflection.Emit.Label)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brfalse, lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitBrtrue(var lbl as Managed.Reflection.Emit.Label)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Brtrue, lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitInitobj(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Initobj, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdtoken(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Ldtoken, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvU()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI4()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I4)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI2()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_I2)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfI4(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_I4, Managed.Reflection.Emit.OpCodes::Conv_Ovf_I4_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI8(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_I8, Managed.Reflection.Emit.OpCodes::Conv_U8})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvU8(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_U8, Managed.Reflection.Emit.OpCodes::Conv_U8})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfI8(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_I8, Managed.Reflection.Emit.OpCodes::Conv_Ovf_I8_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvU2()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U2)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvU4()
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U4)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvU4(var s as boolean, var size as integer)
		if s orelse size > 32 then
			ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_U4, Managed.Reflection.Emit.OpCodes::Conv_Ovf_U4_Un})
		else
			ILGen::Emit(Managed.Reflection.Emit.OpCodes::Conv_U4)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfU2(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_U2, Managed.Reflection.Emit.OpCodes::Conv_Ovf_U2_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfU4(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_U4, Managed.Reflection.Emit.OpCodes::Conv_Ovf_U4_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfI(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_I, Managed.Reflection.Emit.OpCodes::Conv_Ovf_I_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfI2(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_I2, Managed.Reflection.Emit.OpCodes::Conv_Ovf_I2_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfI1(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_I1, Managed.Reflection.Emit.OpCodes::Conv_Ovf_I1_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitConvOvfU1(var s as boolean)
		ILGen::Emit(#ternary {s ? Managed.Reflection.Emit.OpCodes::Conv_Ovf_U1, Managed.Reflection.Emit.OpCodes::Conv_Ovf_U1_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitNewarr(var t as Managed.Reflection.Type)
		ILGen::Emit(Managed.Reflection.Emit.OpCodes::Newarr, t)
	end method

	[method: ComVisible(false)]
	method public static void DeclVar(var name as string, var typ as Managed.Reflection.Type)
		var lb as Managed.Reflection.Emit.LocalBuilder = ILGen::DeclareLocal(typ)
		if DebugFlg then
			lb::SetLocalSymInfo(name)
		end if
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.Emit.Label DefineLbl()
		return ILGen::DefineLabel()
	end method

	[method: ComVisible(false)]
	method public static void MarkLbl(var lbl as Managed.Reflection.Emit.Label)
		ILGen::MarkLabel(lbl)
	end method

	[method: ComVisible(false)]
	method public static void MarkDbgPt(var line as integer, var col as integer, var eline as integer, var ecol as integer)
		//ok on mono and coreclr
		ILGen::MarkSequencePoint(DocWriter, line, 1, line, 100)
		//ok on mono but coreclr debugger rejects pdbs
		//ILGen::MarkSequencePoint(DocWriter, line, col, eline, ecol)

		//Console::WriteLine(i"{line},{col} -> {eline},{ecol}")
	end method

	[method: ComVisible(false)]
	method public static void BeginScope()
		if DebugFlg then
			ILGen::BeginScope()
		end if
	end method

	[method: ComVisible(false)]
	method public static void EndScope()
		if DebugFlg then
			ILGen::EndScope()
		end if
	end method

end class