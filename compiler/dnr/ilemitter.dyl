//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi partial static Loader

	[method: ComVisible(false)]
	method public static prototype IKVM.Reflection.Type LoadClass(var name as string) 

end class

class public auto ansi static ILEmitter

	field public static IKVM.Reflection.Emit.MethodBuilder Met
	field public static IKVM.Reflection.Emit.ConstructorBuilder Constr
	field assembly static IKVM.Reflection.Emit.ILGenerator ILGen
	field public static ISymbolDocumentWriter DocWriter
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
	field public static integer LocInd
	field public static integer ArgInd
	field public static integer LineNr
	field public static string CurSrcFile
	field public static C5.LinkedList<of string> SrcFiles
	field public static C5.LinkedList<of ISymbolDocumentWriter> DocWriters
	field public static Universe Univ

	[method: ComVisible(false)]
	method public static void Init()
		Univ = new Universe(UniverseOptions::MetadataOnly or UniverseOptions::DisableFusion)
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
		LocInd = 0
		ArgInd = 0
		LineNr = 0
		CurSrcFile = String::Empty
		SrcFiles = new C5.LinkedList<of string>()
		DocWriters = new C5.LinkedList<of ISymbolDocumentWriter>()
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
	method public static void AddDocWriter(var srcf as ISymbolDocumentWriter)
		DocWriters::Push(srcf)
	end method

	[method: ComVisible(false)]
	method public static void PopDocWriter()
		DocWriters::Pop()
	end method

	[method: ComVisible(false)]
	method public static void EmitRet()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ret)
	end method

	[method: ComVisible(false)]
	method public static void EmitDup()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Dup)
	end method

	[method: ComVisible(false)]
	method public static void EmitPop()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Pop)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdlen()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldlen)
	end method

	[method: ComVisible(false)]
	method public static void EmitBox(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Box, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitUnbox(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Unbox, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitUnboxAny(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Unbox_Any, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitCastclass(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Castclass, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitIsinst(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Isinst, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitIs(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Isinst, t)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldnull)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitConstrained(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Constrained, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdloc(var num as integer)		
		if num == 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloc_0)
		elseif num == 1 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloc_1)
		elseif num == 2 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloc_2)
		elseif num == 3 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloc_3)
		elseif (num >= 0) and (num <= 255) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloc_S, $byte$num)
		elseif num >= 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloc, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdloca(var num as integer)
		if (num >= 0) and (num <= 255) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloca_S, $byte$num)
		elseif num >= 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldloca, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdarg(var num as integer)
		if num == 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarg_0)
		elseif num == 1 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarg_1)
		elseif num == 2 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarg_2)
		elseif num == 3 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarg_3)
		elseif (num >= 0) and (num <= 255) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarg_S, $byte$num)
		elseif num >= 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarg, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdarga(var num as integer)
		if (num >= 0) and (num <= 255) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarga_S, $byte$num)
		elseif num >= 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldarga, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStloc(var num as integer)
		if num == 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stloc_0)
		elseif num == 1 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stloc_1)
		elseif num == 2 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stloc_2)
		elseif num == 3 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stloc_3)
		elseif (num >= 0) and (num <= 255) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stloc_S, $byte$num)
		elseif num >= 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stloc, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStarg(var num as integer)
		if (num >= 0) and (num <= 255) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Starg_S, $byte$num)
		elseif num >= 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Starg, $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stfld, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitStsfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stsfld, fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitStelem(var typ as IKVM.Reflection.Type)	
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_I4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem_Ref)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stelem, typ)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStind(var typ as IKVM.Reflection.Type)	
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_I4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stobj, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stind_Ref)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Stobj, typ)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdelem(var typ as IKVM.Reflection.Type)
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_I4)
		elseif Loader::LoadClass("System.Byte")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_U1)
		elseif Loader::LoadClass("System.UInt16")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_U2)
		elseif Loader::LoadClass("System.UInt32")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_U4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem_Ref)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelem, typ)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdind(var typ as IKVM.Reflection.Type)
		if Loader::LoadClass("System.IntPtr")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_I)
		elseif Loader::LoadClass("System.SByte")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_I1)
		elseif Loader::LoadClass("System.Int16")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_I2)
		elseif Loader::LoadClass("System.Int32")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_I4)
		elseif Loader::LoadClass("System.Byte")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_U1)
		elseif Loader::LoadClass("System.UInt16")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_U2)
		elseif Loader::LoadClass("System.UInt32")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_U4)
		elseif Loader::LoadClass("System.Int64")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_I8)
		elseif Loader::LoadClass("System.Single")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_R4)
		elseif Loader::LoadClass("System.Double")::Equals(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_R8)
		elseif Loader::LoadClass("System.ValueType")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldobj, typ)
		elseif Loader::LoadClass("System.Object")::IsAssignableFrom(typ) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldind_Ref)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldobj, typ)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdelema(var typ as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldelema, typ)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI8(var n as long)
		if n == -1l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_M1)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 0l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 1l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_1)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 2l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_2)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 3l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_3)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 4l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_4)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 5l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_5)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 6l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_6)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 7l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_7)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif n == 8l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_8)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		elseif (n >= $long$integer::MinValue) and (n <= $long$integer::MaxValue) then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4, $integer$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I8)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I8, n)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcU8(var n as ulong)
		if n == $ulong$0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$1 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_1)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$2 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_2)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$3 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_3)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$4 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_4)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$5 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_5)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$6 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_6)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$7 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_7)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n == $ulong$8 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_8)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n <= $ulong$integer::MaxValue then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4, $integer$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		elseif n <= $ulong$long::MaxValue then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I8, $long$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U8)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldstr, $string$n)
			var convc as IKVM.Reflection.Type = Loader::LoadClass("System.Convert")
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, convc::GetMethod("ToUInt64", new IKVM.Reflection.Type[] {Loader::LoadClass("System.String")}))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI4(var num as integer)
		if num == -1 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_M1)
		elseif num == 0 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		elseif num == 1 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_1)
		elseif num == 2 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_2)
		elseif num == 3 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_3)
		elseif num == 4 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_4)
		elseif num == 5 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_5)
		elseif num == 6 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_6)
		elseif num == 7 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_7)
		elseif num == 8 then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_8)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4, num)
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcU4(var n as uinteger)
		var num as long = $long$n		
		if num == 0l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		elseif num == 1l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_1)
		elseif num == 2l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_2)
		elseif num == 3l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_3)
		elseif num == 4l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_4)
		elseif num == 5l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_5)
		elseif num == 6l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_6)
		elseif num == 7l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_7)
		elseif num == 8l then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_8)
		elseif num <= $long$integer::MaxValue then
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4, $integer$num)
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I8, num)
		end if
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U4)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcI2(var n as short)
		EmitLdcI4($integer$n)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I2)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcU2(var n as ushort)
		EmitLdcI4($integer$n)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U2)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI1(var n as sbyte)
		EmitLdcI4($integer$n)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I1)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcU1(var n as byte)
		EmitLdcI4($integer$n)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U1)
	end method

	[method: ComVisible(false)]
	method public static void EmitThrow()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Throw)
	end method

	[method: ComVisible(false)]
	method public static void EmitTry()
		ILGen::BeginExceptionBlock()
	end method

	[method: ComVisible(false)]
	method public static void EmitFinally()
		ILGen::BeginFinallyBlock()
	end method

	[method: ComVisible(false)]
	method public static void EmitCatch(var e as IKVM.Reflection.Type)
		ILGen::BeginCatchBlock(e)
	end method

	[method: ComVisible(false)]
	method public static void EmitEndTry()
		ILGen::EndExceptionBlock()
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcR4(var num as single)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_R4, num)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcR8(var num as double)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_R8, num)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcDec(var n as decimal)
		var dec as IKVM.Reflection.Type = Loader::LoadClass("System.Decimal")
		var temps as single
		var tempd as double
		if (Math::Ceiling(n) == n) and ($decimal$integer::MinValue <= n) and (n <= $decimal$integer::MaxValue) then
			EmitLdcI4($integer$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new IKVM.Reflection.Type[] {Loader::LoadClass("System.Int32")}))
		elseif (Math::Ceiling(n) == n) and ($decimal$long::MinValue <= n) and (n <= $decimal$long::MaxValue) then
			EmitLdcI8($long$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new IKVM.Reflection.Type[] {Loader::LoadClass("System.Int64")}))
		elseif single::TryParse($string$n, ref temps) then
			EmitLdcR4($single$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new IKVM.Reflection.Type[] {Loader::LoadClass("System.Single")}))
		elseif double::TryParse($string$n, ref tempd) then
			EmitLdcR8($double$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Newobj, dec::GetConstructor(new IKVM.Reflection.Type[] {Loader::LoadClass("System.Double")}))
		else
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldstr,$string$n)
			ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, dec::GetMethod("Parse",new IKVM.Reflection.Type[] {Loader::LoadClass("System.String")}))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitCallvirt(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Callvirt, met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitCallCtor(var met as IKVM.Reflection.ConstructorInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitCall(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdftn(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldftn, met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdvirtftn(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldvirtftn, met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldfld, fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdsfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldsfld, fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdflda(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldflda, fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdsflda(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldsflda, fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdstr(var str as string)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldstr, str)
	end method

	[method: ComVisible(false)]
	method public static void EmitAdd(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Add, IKVM.Reflection.Emit.OpCodes::Add_Ovf_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitDiv(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Div, IKVM.Reflection.Emit.OpCodes::Div_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitMul(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Mul, IKVM.Reflection.Emit.OpCodes::Mul_Ovf_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitSub(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Sub, IKVM.Reflection.Emit.OpCodes::Sub_Ovf_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitRem(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Rem, IKVM.Reflection.Emit.OpCodes::Rem_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitShl()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Shl)
	end method

	[method: ComVisible(false)]
	method public static void EmitShr(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Shr, IKVM.Reflection.Emit.OpCodes::Shr_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitAnd()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::And)
	end method

	[method: ComVisible(false)]
	method public static void EmitOr()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Or)
	end method

	[method: ComVisible(false)]
	method public static void EmitXor()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Xor)
	end method

	[method: ComVisible(false)]
	method public static void EmitNot()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitNotOther()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitNeg()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Neg)
	end method

	[method: ComVisible(false)]
	method public static void EmitNand()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::And)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitNandOther()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::And)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitNor()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Or)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitNorOther()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Or)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitXnor()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Xor)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitXnorOther()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Xor)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Not)
	end method

	[method: ComVisible(false)]
	method public static void EmitCeq()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitCneq()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitCgt(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Cgt, IKVM.Reflection.Emit.OpCodes::Cgt_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitClt(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Clt, IKVM.Reflection.Emit.OpCodes::Clt_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitCle(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Cgt, IKVM.Reflection.Emit.OpCodes::Cgt_Un})
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitCge(var s as boolean)
		ILGen::Emit(#ternary{s ? IKVM.Reflection.Emit.OpCodes::Clt, IKVM.Reflection.Emit.OpCodes::Clt_Un})
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitLike()
		var lotyp as IKVM.Reflection.Type = Loader::LoadClass("System.Text.RegularExpressions.Regex")
		var strtyp as IKVM.Reflection.Type = Loader::LoadClass("System.String")
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, lotyp::GetMethod("IsMatch",new IKVM.Reflection.Type[] {strtyp, strtyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitNLike()
		var lotyp as IKVM.Reflection.Type = Loader::LoadClass("System.Text.RegularExpressions.Regex")
		var strtyp as IKVM.Reflection.Type = Loader::LoadClass("System.String")
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, lotyp::GetMethod("IsMatch",new IKVM.Reflection.Type[] {strtyp, strtyp}))
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitStrCeq()
		var strtyp as IKVM.Reflection.Type = Loader::LoadClass("System.String")
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, strtyp::GetMethod("Compare",new IKVM.Reflection.Type[] {strtyp, strtyp}))
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitStrCneq()
		var strtyp as IKVM.Reflection.Type = Loader::LoadClass("System.String")
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, strtyp::GetMethod("Compare",new IKVM.Reflection.Type[] {strtyp, strtyp}))
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4_0)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ceq)
	end method

	[method: ComVisible(false)]
	method public static void EmitStrAdd()
		var strtyp as IKVM.Reflection.Type = Loader::LoadClass("System.String")
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, strtyp::GetMethod("Concat",new IKVM.Reflection.Type[] {strtyp, strtyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitDelegateAdd()
		var deltyp as IKVM.Reflection.Type = Loader::LoadClass("System.Delegate")
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, deltyp::GetMethod("Combine",new IKVM.Reflection.Type[] {deltyp, deltyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitDelegateSub()
		var deltyp as IKVM.Reflection.Type = Loader::LoadClass("System.Delegate")
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Call, deltyp::GetMethod("Remove",new IKVM.Reflection.Type[] {deltyp, deltyp}))
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcBool(var b as boolean)
		ILGen::Emit(#ternary{b ? IKVM.Reflection.Emit.OpCodes::Ldc_I4_1, IKVM.Reflection.Emit.OpCodes::Ldc_I4_0})
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcChar(var c as char)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldc_I4, $integer$c)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdnull()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldnull)
	end method

	[method: ComVisible(false)]
	method public static void EmitNewobj(var c as IKVM.Reflection.ConstructorInfo)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Newobj, c)
	end method

	[method: ComVisible(false)]
	method public static void EmitBr(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Br, lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitLeave(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Leave, lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitBrfalse(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Brfalse, lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitBrtrue(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Brtrue, lbl)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitInitobj(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Initobj, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdtoken(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Ldtoken, t)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvU()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI4()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_I4)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitConvOvfI4(var s as boolean)
		ILGen::Emit(#ternary {s ? IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I4, IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I4_Un})
	end method
	
	[method: ComVisible(false)]
	method public static void EmitConvI8(var s as boolean)
		ILGen::Emit(#ternary {s ? IKVM.Reflection.Emit.OpCodes::Conv_I8, IKVM.Reflection.Emit.OpCodes::Conv_U8})
	end method
	
	[method: ComVisible(false)]
	method public static void EmitConvOvfI8(var s as boolean)
		ILGen::Emit(#ternary {s ? IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I8, IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I8_Un})
	end method
	
	[method: ComVisible(false)]
	method public static void EmitConvU2()
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Conv_U2)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitConvOvfU2(var s as boolean)
		ILGen::Emit(#ternary {s ? IKVM.Reflection.Emit.OpCodes::Conv_Ovf_U2, IKVM.Reflection.Emit.OpCodes::Conv_Ovf_U2_Un})
	end method

	[method: ComVisible(false)]
	method public static void EmitNewarr(var t as IKVM.Reflection.Type)
		ILGen::Emit(IKVM.Reflection.Emit.OpCodes::Newarr, t)
	end method

	[method: ComVisible(false)]
	method public static void DeclVar(var name as string, var typ as IKVM.Reflection.Type)
		var lb as IKVM.Reflection.Emit.LocalBuilder = ILGen::DeclareLocal(typ)
		if DebugFlg then
			lb::SetLocalSymInfo(name)
		end if
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Emit.Label DefineLbl()
		return ILGen::DefineLabel()
	end method

	[method: ComVisible(false)]
	method public static void MarkLbl(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::MarkLabel(lbl)
	end method
	
	[method: ComVisible(false)]
	method public static void MarkDbgPt(var line as integer)
		ILGen::MarkSequencePoint(DocWriter, line, 1, line, 100)
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