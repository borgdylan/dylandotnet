//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static ILEmitter

	field public static IKVM.Reflection.Emit.MethodBuilder Met
	field public static IKVM.Reflection.Emit.ConstructorBuilder Constr
	field public static IKVM.Reflection.Emit.ILGenerator ILGen
	field public static ISymbolDocumentWriter DocWriter
	field public static boolean StaticFlg
	field public static boolean AbstractFlg
	field public static boolean StructFlg
	field public static boolean InterfaceFlg
	field public static boolean StaticCFlg
	field public static boolean DebugFlg
	field public static integer LocInd
	field public static integer ArgInd
	field public static integer LineNr
	field public static string CurSrcFile
	field public static string[] SrcFiles
	field public static ISymbolDocumentWriter[] DocWriters
	field public static Universe Univ

	[method: ComVisible(false)]
	method public static void Init()
		Univ = new Universe()
		Met = null
		Constr = null
		ILGen = null
		StaticFlg = false
		AbstractFlg = false
		StructFlg = false
		InterfaceFlg = false
		StaticCFlg = false
		DebugFlg = false
		LocInd = 0
		ArgInd = 0
		LineNr = 0
		CurSrcFile = String::Empty
		SrcFiles = new string[0]
		DocWriters = new ISymbolDocumentWriter[0]
	end method

	method private static void ILEmitter()
		Init()
	end method

	[method: ComVisible(false)]
	method public static void AddSrcFile(var srcf as string)
		var i as integer = -1
		var destarr as string[] = new string[SrcFiles[l] + 1]
		do until i = (SrcFiles[l] - 1)
			i = i + 1
			destarr[i] = SrcFiles[i]
		end do
		destarr[SrcFiles[l]] = srcf
		SrcFiles = destarr
	end method

	[method: ComVisible(false)]
	method public static void PopSrcFile()
		var i as integer = -1
		var destarr as string[] = new string[SrcFiles[l] - 1]
		do until i >= (destarr[l] - 1)
			i = i + 1
			destarr[i] = SrcFiles[i]
		end do
		SrcFiles = destarr
	end method

	[method: ComVisible(false)]
	method public static void AddDocWriter(var srcf as ISymbolDocumentWriter)
		var i as integer = -1
		var destarr as ISymbolDocumentWriter[] = new ISymbolDocumentWriter[DocWriters[l] + 1]
		do until i = (DocWriters[l] - 1)
			i = i + 1
			destarr[i] = DocWriters[i]
		end do
		destarr[DocWriters[l]] = srcf
		DocWriters = destarr
	end method

	[method: ComVisible(false)]
	method public static void PopDocWriter()
		var i as integer = -1
		var destarr as ISymbolDocumentWriter[] = new ISymbolDocumentWriter[DocWriters[l] - 1]
		do until i >= (destarr[l] - 1)
			i = i + 1
			destarr[i] = DocWriters[i]
		end do
		DocWriters = destarr
	end method

	[method: ComVisible(false)]
	method public static void EmitRet()
		ILGen::Emit(InstructionHelper::getOPCode("ret"))
	end method

	[method: ComVisible(false)]
	method public static void EmitDup()
		ILGen::Emit(InstructionHelper::getOPCode("dup"))
	end method

	[method: ComVisible(false)]
	method public static void EmitPop()
		ILGen::Emit(InstructionHelper::getOPCode("pop"))
	end method

	[method: ComVisible(false)]
	method public static void EmitLdlen()
		ILGen::Emit(InstructionHelper::getOPCode("ldlen"))
	end method

	[method: ComVisible(false)]
	method public static void EmitBox(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("box"), t)
	end method

	[method: ComVisible(false)]
	method public static void EmitUnbox(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("unbox"), t)
	end method

	[method: ComVisible(false)]
	method public static void EmitUnboxAny(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("unbox.any"), t)
	end method

	[method: ComVisible(false)]
	method public static void EmitCastclass(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("castclass"), t)
	end method

	[method: ComVisible(false)]
	method public static void EmitIsinst(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("isinst"), t)
	end method

	[method: ComVisible(false)]
	method public static void EmitIs(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("isinst"), t)
		ILGen::Emit(InstructionHelper::getOPCode("ldnull"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitConstrained(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("constrained."), t)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdloc(var num as integer)		
		if num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldloc.0"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldloc.1"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldloc.2"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldloc.3"))
		elseif (num >= 0) and (num <= 255) then
			ILGen::Emit(InstructionHelper::getOPCode("ldloc.s"), Convert::ToByte(num))
		elseif num >= 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldloc"), $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdloca(var num as integer)
		if (num >= 0) and (num <= 255) then
			ILGen::Emit(InstructionHelper::getOPCode("ldloca.s"), Convert::ToByte(num))
		elseif num >= 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldloca"), $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdarg(var num as integer)
		if num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldarg.0"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldarg.1"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldarg.2"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldarg.3"))
		elseif (num >= 0) and (num <= 255) then
			ILGen::Emit(InstructionHelper::getOPCode("ldarg.s"), Convert::ToByte(num))
		elseif num >= 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldarg"), $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdarga(var num as integer)
		if (num >= 0) and (num <= 255) then
			ILGen::Emit(InstructionHelper::getOPCode("ldarga.s"), Convert::ToByte(num))
		elseif num >= 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldarga"), $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStloc(var num as integer)
		if num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("stloc.0"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("stloc.1"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("stloc.2"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("stloc.3"))
		elseif (num >= 0) and (num <= 255) then
			ILGen::Emit(InstructionHelper::getOPCode("stloc.s"), Convert::ToByte(num))
		elseif num >= 0 then
			ILGen::Emit(InstructionHelper::getOPCode("stloc"), $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStarg(var num as integer)
		if (num >= 0) and (num <= 255) then
			ILGen::Emit(InstructionHelper::getOPCode("starg.s"), Convert::ToByte(num))
		elseif num >= 0 then
			ILGen::Emit(InstructionHelper::getOPCode("starg"), $short$num)
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitStfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(InstructionHelper::getOPCode("stfld"), fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitStsfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(InstructionHelper::getOPCode("stsfld"), fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitStelem(var typ as IKVM.Reflection.Type)

		var t as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[9] 
		t[0] = Univ::Import(gettype intptr)
		t[1] = Univ::Import(gettype sbyte)
		t[2] = Univ::Import(gettype short)
		t[3] = Univ::Import(gettype integer)
		t[4] = Univ::Import(gettype long)
		t[5] = Univ::Import(gettype single)
		t[6] = Univ::Import(gettype double)
		t[7] = Univ::Import(gettype ValueType)
		t[8] = Univ::Import(gettype object)
				
		if t[0]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.i"))
		elseif t[1]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.i1"))
		elseif t[2]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.i2"))
		elseif t[3]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.i4"))
		elseif t[4]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.i8"))
		elseif t[5]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.r4"))
		elseif t[6]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.r8"))
		elseif t[7]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem"), typ)
		elseif t[8]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stelem.ref"))
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitStind(var typ as IKVM.Reflection.Type)

		var t as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[9] 
		t[0] = Univ::Import(gettype intptr)
		t[1] = Univ::Import(gettype sbyte)
		t[2] = Univ::Import(gettype short)
		t[3] = Univ::Import(gettype integer)
		t[4] = Univ::Import(gettype long)
		t[5] = Univ::Import(gettype single)
		t[6] = Univ::Import(gettype double)
		t[7] = Univ::Import(gettype ValueType)
		t[8] = Univ::Import(gettype object)
				
		if t[0]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.i"))
		elseif t[1]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.i1"))
		elseif t[2]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.i2"))
		elseif t[3]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.i4"))
		elseif t[4]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.i8"))
		elseif t[5]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.r4"))
		elseif t[6]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.r8"))
		elseif t[7]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stobj"), typ)
		elseif t[8]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("stind.ref"))
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitLdelem(var typ as IKVM.Reflection.Type)

		var t as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[12]
		t[0] = Univ::Import(gettype intptr)
		t[1] = Univ::Import(gettype sbyte)
		t[2] = Univ::Import(gettype short)
		t[3] = Univ::Import(gettype integer)
		t[4] = Univ::Import(gettype long)
		t[5] = Univ::Import(gettype single)
		t[6] = Univ::Import(gettype double)
		t[7] = Univ::Import(gettype ValueType)
		t[8] = Univ::Import(gettype object)
		t[9] = Univ::Import(gettype Byte)
		t[10] = Univ::Import(gettype UInt16)
		t[11] = Univ::Import(gettype UInt32)
		
		if t[0]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.i"))
		elseif t[1]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.i1"))
		elseif t[2]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.i2"))
		elseif t[3]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.i4"))
		elseif t[9]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.u1"))
		elseif t[10]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.u2"))
		elseif t[11]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.u4"))
		elseif t[4]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.i8"))
		elseif t[5]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.r4"))
		elseif t[6]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.r8"))
		elseif t[7]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem"), typ)
		elseif t[8]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldelem.ref"))
		end if

	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdind(var typ as IKVM.Reflection.Type)

		var t as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[12]
		t[0] = Univ::Import(gettype intptr)
		t[1] = Univ::Import(gettype sbyte)
		t[2] = Univ::Import(gettype short)
		t[3] = Univ::Import(gettype integer)
		t[4] = Univ::Import(gettype long)
		t[5] = Univ::Import(gettype single)
		t[6] = Univ::Import(gettype double)
		t[7] = Univ::Import(gettype ValueType)
		t[8] = Univ::Import(gettype object)
		t[9] = Univ::Import(gettype Byte)
		t[10] = Univ::Import(gettype UInt16)
		t[11] = Univ::Import(gettype UInt32)
		
		if t[0]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.i"))
		elseif t[1]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.i1"))
		elseif t[2]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.i2"))
		elseif t[3]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.i4"))
		elseif t[9]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.u1"))
		elseif t[10]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.u2"))
		elseif t[11]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.u4"))
		elseif t[4]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.i8"))
		elseif t[5]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.r4"))
		elseif t[6]::Equals(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.r8"))
		elseif t[7]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldobj"), typ)
		elseif t[8]::IsAssignableFrom(typ) then
			ILGen::Emit(InstructionHelper::getOPCode("ldind.ref"))
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitLdelema(var typ as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("ldelema"), typ)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI8(var n as long)

		if n = -1l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.m1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 0l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 1l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 2l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 3l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 4l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 5l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 6l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 7l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif n = 8l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		elseif (n >= $long$Int32::MinValue) and (n <= $long$Int32::MaxValue) then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), $integer$n)
			ILGen::Emit(InstructionHelper::getOPCode("conv.i8"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i8"), n)
		end if
		
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcU8(var n as ulong)

		if n = $ulong$0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$4 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$5 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$6 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$7 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n = $ulong$8 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n <= $ulong$Int32::MaxValue then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), $integer$n)
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		elseif n <= $ulong$Int64::MaxValue then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i8"), $long$n)
			ILGen::Emit(InstructionHelper::getOPCode("conv.u8"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldstr"), $string$n)
			var arr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[1]
			arr[0] = Univ::Import(gettype string)
			var convc as IKVM.Reflection.Type = Univ::Import(gettype Convert)
			ILGen::Emit(InstructionHelper::getOPCode("call"), convc::GetMethod("ToUInt64", arr))
		end if
		
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI4(var num as integer)
	
		if num = -1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.m1"))
		elseif num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
		elseif num = 4 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
		elseif num = 5 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
		elseif num = 6 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
		elseif num = 7 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
		elseif num = 8 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), num)
		end if
	
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcU4(var n as uinteger)
		
		var num as long = $long$n		
			
		if num = 0l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 1l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 2l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 3l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 4l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 5l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 6l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 7l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num = 8l then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		elseif num <= $long$Int32::MaxValue then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), $integer$num)
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i8"), num)
			ILGen::Emit(InstructionHelper::getOPCode("conv.u4"))
		end if
	
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcI2(var n as short)
		var num as integer = $integer$n

		if num = -1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.m1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 4 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 5 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 6 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 7 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		elseif num = 8 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), num)
			ILGen::Emit(InstructionHelper::getOPCode("conv.i2"))
		end if
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcU2(var n as ushort)
		var num as integer = $integer$n

		if num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 4 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 5 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 6 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 7 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		elseif num = 8 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), num)
			ILGen::Emit(InstructionHelper::getOPCode("conv.u2"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcI1(var n as sbyte)
		var num as integer = $integer$n

		if num = -1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.m1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 4 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 5 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 6 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 7 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		elseif num = 8 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), num)
			ILGen::Emit(InstructionHelper::getOPCode("conv.i1"))
		end if

	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdcU1(var n as byte)
		var num as integer = $integer$n

		if num = 0 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 1 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 2 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.2"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 3 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.3"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 4 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.4"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 5 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.5"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 6 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.6"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 7 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.7"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		elseif num = 8 then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.8"))
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), num)
			ILGen::Emit(InstructionHelper::getOPCode("conv.u1"))
		end if

	end method

	[method: ComVisible(false)]
	method public static void EmitThrow()
		ILGen::Emit(InstructionHelper::getOPCode("throw"))
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
		ILGen::Emit(InstructionHelper::getOPCode("ldc.r4"), num)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcR8(var num as double)
		ILGen::Emit(InstructionHelper::getOPCode("ldc.r8"), num)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcDec(var n as decimal)
		var arr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[1]
		var dec as IKVM.Reflection.Type = Univ::Import(gettype decimal)
		var temps as single
		var tempd as double
		if (Math::Ceiling(n) = n) and ($decimal$Int32::MinValue <= n) and (n <= $decimal$Int32::MaxValue) then
			EmitLdcI4($integer$n)
			arr[0] = Univ::Import(gettype integer)
			ILGen::Emit(InstructionHelper::getOPCode("newobj"), dec::GetConstructor(arr))
		elseif (Math::Ceiling(n) = n) and ($decimal$Int64::MinValue <= n) and (n <= $decimal$Int64::MaxValue) then
			EmitLdcI8($long$n)
			arr[0] = Univ::Import(gettype long)
			ILGen::Emit(InstructionHelper::getOPCode("newobj"), dec::GetConstructor(arr))
		elseif Single::TryParse($string$n, ref|temps) then
			EmitLdcR4($single$n)
			arr[0] = Univ::Import(gettype single)
			ILGen::Emit(InstructionHelper::getOPCode("newobj"), dec::GetConstructor(arr))
		elseif Double::TryParse($string$n, ref|tempd) then
			EmitLdcR8($double$n)
			arr[0] = Univ::Import(gettype double)
			ILGen::Emit(InstructionHelper::getOPCode("newobj"), dec::GetConstructor(arr))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldstr"),$string$n)
			arr[0] = Univ::Import(gettype string)
			ILGen::Emit(InstructionHelper::getOPCode("call"), dec::GetMethod("Parse",arr))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitCallvirt(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(InstructionHelper::getOPCode("callvirt"), met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitCallCtor(var met as IKVM.Reflection.ConstructorInfo)
		ILGen::Emit(InstructionHelper::getOPCode("call"), met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitCall(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(InstructionHelper::getOPCode("call"), met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdftn(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(InstructionHelper::getOPCode("ldftn"), met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdvirtftn(var met as IKVM.Reflection.MethodInfo)
		ILGen::Emit(InstructionHelper::getOPCode("ldvirtftn"), met)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(InstructionHelper::getOPCode("ldfld"), fld)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdsfld(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(InstructionHelper::getOPCode("ldsfld"), fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdflda(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(InstructionHelper::getOPCode("ldflda"), fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdsflda(var fld as IKVM.Reflection.FieldInfo)
		ILGen::Emit(InstructionHelper::getOPCode("ldsflda"), fld)
	end method
	
	[method: ComVisible(false)]
	method public static void EmitLdstr(var str as string)
		ILGen::Emit(InstructionHelper::getOPCode("ldstr"), str)
	end method

	[method: ComVisible(false)]
	method public static void EmitAdd(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("add"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("add.ovf.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitDiv(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("div"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("div.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitMul(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("mul"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("mul.ovf.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitSub(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("sub"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("sub.ovf.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitRem(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("rem"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("rem.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitShl()
		ILGen::Emit(InstructionHelper::getOPCode("shl"))
	end method

	[method: ComVisible(false)]
	method public static void EmitShr(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("shr"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("shr.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitAnd()
		ILGen::Emit(InstructionHelper::getOPCode("and"))
	end method

	[method: ComVisible(false)]
	method public static void EmitOr()
		ILGen::Emit(InstructionHelper::getOPCode("or"))
	end method

	[method: ComVisible(false)]
	method public static void EmitXor()
		ILGen::Emit(InstructionHelper::getOPCode("xor"))
	end method

	[method: ComVisible(false)]
	method public static void EmitNot()
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitNeg()
		ILGen::Emit(InstructionHelper::getOPCode("neg"))
	end method

	[method: ComVisible(false)]
	method public static void EmitNand()
		ILGen::Emit(InstructionHelper::getOPCode("and"))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitNor()
		ILGen::Emit(InstructionHelper::getOPCode("or"))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitXnor()
		ILGen::Emit(InstructionHelper::getOPCode("xor"))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitCeq()
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitCneq()
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitCgt(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("cgt"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("cgt.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitClt(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("clt"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("clt.un"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitCle(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("cgt"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("cgt.un"))
		end if
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitCge(var s as boolean)
		if s then
			ILGen::Emit(InstructionHelper::getOPCode("clt"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("clt.un"))
		end if
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitLike()
		var lotyp as IKVM.Reflection.Type = Univ::Import(gettype Regex)
		var params as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
		params[0] = Univ::Import(gettype string)
		params[1] = Univ::Import(gettype string)
		ILGen::Emit(InstructionHelper::getOPCode("call"), lotyp::GetMethod("IsMatch",params))
	end method

	[method: ComVisible(false)]
	method public static void EmitNLike()
		var lotyp as IKVM.Reflection.Type = Univ::Import(gettype Regex)
		var params as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
		params[0] = Univ::Import(gettype string)
		params[1] = Univ::Import(gettype string)
		ILGen::Emit(InstructionHelper::getOPCode("call"), lotyp::GetMethod("IsMatch",params))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitStrCeq()
		var strtyp as IKVM.Reflection.Type = Univ::Import(gettype string)
		var params as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
		params[0] = Univ::Import(gettype string)
		params[1] = Univ::Import(gettype string)
		ILGen::Emit(InstructionHelper::getOPCode("call"), strtyp::GetMethod("Compare",params))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitStrCneq()
		var strtyp as IKVM.Reflection.Type = Univ::Import(gettype string)
		var params as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
		params[0] = Univ::Import(gettype string)
		params[1] = Univ::Import(gettype string)
		ILGen::Emit(InstructionHelper::getOPCode("call"), strtyp::GetMethod("Compare",params))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		ILGen::Emit(InstructionHelper::getOPCode("ceq"))
	end method

	[method: ComVisible(false)]
	method public static void EmitStrAdd()
		var strtyp as IKVM.Reflection.Type = Univ::Import(gettype string)
		var params as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
		params[0] = strtyp
		params[1] = strtyp
		ILGen::Emit(InstructionHelper::getOPCode("call"), strtyp::GetMethod("Concat",params))
	end method

	[method: ComVisible(false)]
	method public static void EmitDelegateAdd()
		var deltyp as IKVM.Reflection.Type = Univ::Import(gettype Delegate)
		var params as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
		params[0] = deltyp
		params[1] = deltyp
		ILGen::Emit(InstructionHelper::getOPCode("call"), deltyp::GetMethod("Combine",params))
	end method

	[method: ComVisible(false)]
	method public static void EmitDelegateSub()
		var deltyp as IKVM.Reflection.Type = Univ::Import(gettype Delegate)
		var params as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[2]
		params[0] = deltyp
		params[1] = deltyp
		ILGen::Emit(InstructionHelper::getOPCode("call"), deltyp::GetMethod("Remove",params))
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcBool(var b as boolean)
		if b then
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.1"))
		else
			ILGen::Emit(InstructionHelper::getOPCode("ldc.i4.0"))
		end if
	end method

	[method: ComVisible(false)]
	method public static void EmitLdcChar(var c as char)
		ILGen::Emit(InstructionHelper::getOPCode("ldc.i4"), $integer$c)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdnull()
		ILGen::Emit(InstructionHelper::getOPCode("ldnull"))
	end method

	[method: ComVisible(false)]
	method public static void EmitNewobj(var c as IKVM.Reflection.ConstructorInfo)
		ILGen::Emit(InstructionHelper::getOPCode("newobj"), c)
	end method

	[method: ComVisible(false)]
	method public static void EmitBr(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::Emit(InstructionHelper::getOPCode("br"), lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitBrfalse(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::Emit(InstructionHelper::getOPCode("brfalse"), lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitBrtrue(var lbl as IKVM.Reflection.Emit.Label)
		ILGen::Emit(InstructionHelper::getOPCode("brtrue"), lbl)
	end method

	[method: ComVisible(false)]
	method public static void EmitLdtoken(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("ldtoken"), t)
	end method

	[method: ComVisible(false)]
	method public static void EmitConvU()
		ILGen::Emit(InstructionHelper::getOPCode("conv.u"))
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI()
		ILGen::Emit(InstructionHelper::getOPCode("conv.i"))
	end method

	[method: ComVisible(false)]
	method public static void EmitConvI4()
		ILGen::Emit(InstructionHelper::getOPCode("conv.i4"))
	end method

	[method: ComVisible(false)]
	method public static void EmitNewarr(var t as IKVM.Reflection.Type)
		ILGen::Emit(InstructionHelper::getOPCode("newarr"), t)
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

end class
