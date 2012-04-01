//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi InstructionHelper

	method public static OpCode getOPCode(var code as string)
		
		if code = "add" then
			return OpCodes::Add
		elseif code = "add.ovf" then
			return OpCodes::Add_Ovf
		elseif code = "add.ovf.un" then
			return OpCodes::Add_Ovf_Un
		elseif code = "and" then
			return OpCodes::And
		elseif code = "beq" then
			return OpCodes::Beq
		elseif code = "bge" then
			return OpCodes::Bge
		elseif code = "bgt" then
			return OpCodes::Bgt
		elseif code = "ble" then
			return OpCodes::Ble
		elseif code = "blt" then
			return OpCodes::Blt
		elseif code = "box" then
			return OpCodes::Box
		elseif code = "br" then
			return OpCodes::Br
		elseif code = "break" then
			return OpCodes::Break
		elseif code = "brfalse" then
			return OpCodes::Brfalse
		elseif code = "brtrue" then
			return OpCodes::Brtrue
		elseif code = "call" then
			return OpCodes::Call
		elseif code = "callvirt" then
			return OpCodes::Callvirt
		elseif code = "castclass" then
			return OpCodes::Castclass
		elseif code = "ceq" then
			return OpCodes::Ceq
		elseif code = "clt" then
			return OpCodes::Clt
		elseif code = "clt.un" then
			return OpCodes::Clt_Un
		elseif code = "cgt" then
			return OpCodes::Cgt
		elseif code = "cgt.un" then
			return OpCodes::Cgt_Un
		elseif code = "constrained." then
			return OpCodes::Constrained
		elseif code = "conv.i" then
			return OpCodes::Conv_I
		elseif code = "conv.i1" then
			return OpCodes::Conv_I1
		elseif code = "conv.i2" then
			return OpCodes::Conv_I2
		elseif code = "conv.i4" then
			return OpCodes::Conv_I4
		elseif code = "conv.i8" then
			return OpCodes::Conv_I8
		elseif code = "conv.u" then
			return OpCodes::Conv_U
		elseif code = "conv.u1" then
			return OpCodes::Conv_U1
		elseif code = "conv.u2" then
			return OpCodes::Conv_U2
		elseif code = "conv.u4" then
			return OpCodes::Conv_U4
		elseif code = "conv.u8" then
			return OpCodes::Conv_U8
		elseif code = "conv.ovf.i" then
			return OpCodes::Conv_Ovf_I
		elseif code = "conv.ovf.i1" then
			return OpCodes::Conv_Ovf_I1
		elseif code = "conv.ovf.i2" then
			return OpCodes::Conv_Ovf_I2
		elseif code = "conv.ovf.i4" then
			return OpCodes::Conv_Ovf_I4
		elseif code = "conv.ovf.i8" then
			return OpCodes::Conv_Ovf_I8
		elseif code = "conv.ovf.u" then
			return OpCodes::Conv_Ovf_U
		elseif code = "conv.ovf.u1" then
			return OpCodes::Conv_Ovf_U1
		elseif code = "conv.ovf.u2" then
			return OpCodes::Conv_Ovf_U2
		elseif code = "conv.ovf.u4" then
			return OpCodes::Conv_Ovf_U4
		elseif code = "conv.ovf.u8" then
			return OpCodes::Conv_Ovf_U8
		elseif code = "conv.r4" then
			return OpCodes::Conv_R4
		elseif code = "conv.r8" then
			return OpCodes::Conv_R8
		elseif code = "div" then
			return OpCodes::Div
		elseif code = "div.un" then
			return OpCodes::Div_Un
		elseif code = "dup" then
			return OpCodes::Dup
		elseif code = "isinst" then
			return OpCodes::Isinst
		elseif code = "ldarg" then
			return OpCodes::Ldarg
		elseif code = "ldarga" then
			return OpCodes::Ldarga
		elseif code = "ldarg.s" then
			return OpCodes::Ldarg_S
		elseif code = "ldarga.s" then
			return OpCodes::Ldarga_S
		elseif code = "ldarg.0" then
			return OpCodes::Ldarg_0
		elseif code = "ldarg.1" then
			return OpCodes::Ldarg_1
		elseif code = "ldarg.2" then
			return OpCodes::Ldarg_2
		elseif code = "ldarg.3" then
			return OpCodes::Ldarg_3
		elseif code = "ldc.i4" then
			return OpCodes::Ldc_I4
		elseif code = "ldc.i4.0" then
			return OpCodes::Ldc_I4_0
		elseif code = "ldc.i4.1" then
			return OpCodes::Ldc_I4_1
		elseif code = "ldc.i4.2" then
			return OpCodes::Ldc_I4_2
		elseif code = "ldc.i4.3" then
			return OpCodes::Ldc_I4_3
		elseif code = "ldc.i4.4" then
			return OpCodes::Ldc_I4_4
		elseif code = "ldc.i4.5" then
			return OpCodes::Ldc_I4_5
		elseif code = "ldc.i4.6" then
			return OpCodes::Ldc_I4_6
		elseif code = "ldc.i4.7" then
			return OpCodes::Ldc_I4_7
		elseif code = "ldc.i4.8" then
			return OpCodes::Ldc_I4_8
		elseif code = "ldc.i4.m1" then
			return OpCodes::Ldc_I4_M1
		elseif code = "ldc.i4.s" then
			return OpCodes::Ldc_I4_S
		elseif code = "ldc.i8" then
			return OpCodes::Ldc_I8
		elseif code = "ldc.r4" then
			return OpCodes::Ldc_R4
		elseif code = "ldc.r8" then
			return OpCodes::Ldc_R8
		elseif code = "ldelem" then
			return OpCodes::Ldelem
		elseif code = "ldelem.i" then
			return OpCodes::Ldelem_I
		elseif code = "ldelem.i1" then
			return OpCodes::Ldelem_I1
		elseif code = "ldelem.i2" then
			return OpCodes::Ldelem_I2
		elseif code = "ldelem.i4" then
			return OpCodes::Ldelem_I4
		elseif code = "ldelem.i8" then
			return OpCodes::Ldelem_I8
		elseif code = "ldelem.r4" then
			return OpCodes::Ldelem_R4
		elseif code = "ldelem.r8" then
			return OpCodes::Ldelem_R8
		elseif code = "ldelem.u1" then
			return OpCodes::Ldelem_U1
		elseif code = "ldelem.u2" then
			return OpCodes::Ldelem_U2
		elseif code = "ldelem.u4" then
			return OpCodes::Ldelem_U4
		elseif code = "ldelem.ref" then
			return OpCodes::Ldelem_Ref
		elseif code = "ldelema" then
			return OpCodes::Ldelema
		elseif code = "ldfld" then
			return OpCodes::Ldfld
		elseif code = "ldflda" then
			return OpCodes::Ldflda
		elseif code = "ldftn" then
			return OpCodes::Ldftn
		elseif code = "ldind.i" then
			return OpCodes::Ldind_I
		elseif code = "ldind.i1" then
			return OpCodes::Ldind_I1
		elseif code = "ldind.i2" then
			return OpCodes::Ldind_I2
		elseif code = "ldind.i4" then
			return OpCodes::Ldind_I4
		elseif code = "ldind.i8" then
			return OpCodes::Ldind_I8
		elseif code = "ldind.r4" then
			return OpCodes::Ldind_R4
		elseif code = "ldind.r8" then
			return OpCodes::Ldind_R8
		elseif code = "ldind.u1" then
			return OpCodes::Ldind_U1
		elseif code = "ldind.u2" then
			return OpCodes::Ldind_U2
		elseif code = "ldind.u4" then
			return OpCodes::Ldind_U4
		elseif code = "ldind.ref" then
			return OpCodes::Ldind_Ref
		elseif code = "ldlen" then
			return OpCodes::Ldlen
		elseif code = "ldloc" then
			return OpCodes::Ldloc
		elseif code = "ldloc.s" then
			return OpCodes::Ldloc_S
		elseif code = "ldloca" then
			return OpCodes::Ldloca
		elseif code = "ldloca.s" then
			return OpCodes::Ldloca_S
		elseif code = "ldloc.0" then
			return OpCodes::Ldloc_0
		elseif code = "ldloc.1" then
			return OpCodes::Ldloc_1
		elseif code = "ldloc.2" then
			return OpCodes::Ldloc_2
		elseif code = "ldloc.3" then
			return OpCodes::Ldloc_3
		elseif code = "ldnull" then
			return OpCodes::Ldnull
		elseif code = "ldobj" then
			return OpCodes::Ldobj
		elseif code = "ldsfld" then
			return OpCodes::Ldsfld
		elseif code = "ldsflda" then
			return OpCodes::Ldsflda
		elseif code = "ldstr" then
			return OpCodes::Ldstr
		elseif code = "ldtoken" then
			return OpCodes::Ldtoken
		elseif code = "ldvirtftn" then
			return OpCodes::Ldvirtftn
		elseif code = "ldftn" then
			return OpCodes::Ldftn
		elseif code = "leave" then
			return OpCodes::Leave
		elseif code = "mul" then
			return OpCodes::Mul
		elseif code = "mul.ovf" then
			return OpCodes::Mul_Ovf
		elseif code = "mul.ovf.un" then
			return OpCodes::Mul_Ovf_Un
		elseif code = "neg" then
			return OpCodes::Neg
		elseif code = "newarr" then
			return OpCodes::Newarr
		elseif code = "newobj" then
			return OpCodes::Newobj
		elseif code = "nop" then
			return OpCodes::Nop
		elseif code = "not" then
			return OpCodes::Not
		elseif code = "or" then
			return OpCodes::Or
		elseif code = "pop" then
			return OpCodes::Pop
		elseif code = "rem" then
			return OpCodes::Rem
		elseif code = "rem.un" then
			return OpCodes::Rem_Un
		elseif code = "ret" then
			return OpCodes::Ret
		elseif code = "rethrow" then
			return OpCodes::Rethrow
		elseif code = "shl" then
			return OpCodes::Shl
		elseif code = "shr" then
			return OpCodes::Shr
		elseif code = "shr.un" then
			return OpCodes::Shr_Un
		elseif code = "sizeof" then
			return OpCodes::Sizeof
		elseif code = "starg" then
			return OpCodes::Starg
		elseif code = "starg.s" then
			return OpCodes::Starg_S
		elseif code = "stelem" then
			return OpCodes::Stelem
		elseif code = "stelem.i" then
			return OpCodes::Stelem_I
		elseif code = "stelem.i1" then
			return OpCodes::Stelem_I1
		elseif code = "stelem.i2" then
			return OpCodes::Stelem_I2
		elseif code = "stelem.i4" then
			return OpCodes::Stelem_I4
		elseif code = "stelem.i8" then
			return OpCodes::Stelem_I8
		elseif code = "stelem.r4" then
			return OpCodes::Stelem_R4
		elseif code = "stelem.r8" then
			return OpCodes::Stelem_R8
		elseif code = "stelem.ref" then
			return OpCodes::Stelem_Ref
		elseif code = "stfld" then
			return OpCodes::Stfld
		elseif code = "stind.i" then
			return OpCodes::Stind_I
		elseif code = "stind.i1" then
			return OpCodes::Stind_I1
		elseif code = "stind.i2" then
			return OpCodes::Stind_I2
		elseif code = "stind.i4" then
			return OpCodes::Stind_I4
		elseif code = "stind.i8" then
			return OpCodes::Stind_I8
		elseif code = "stind.r4" then
			return OpCodes::Stind_R4
		elseif code = "stind.r8" then
			return OpCodes::Stelem_R8
		elseif code = "stind.ref" then
			return OpCodes::Stind_Ref
		elseif code = "stloc" then
			return OpCodes::Stloc
		elseif code = "stloc.s" then
			return OpCodes::Stloc_S
		elseif code = "stloc.0" then
			return OpCodes::Stloc_0
		elseif code = "stloc.1" then
			return OpCodes::Stloc_1
		elseif code = "stloc.2" then
			return OpCodes::Stloc_2
		elseif code = "stloc.3" then
			return OpCodes::Stloc_3
		elseif code = "stobj" then
			return OpCodes::Stobj
		elseif code = "stsfld" then
			return OpCodes::Stsfld
		elseif code = "sub" then
			return OpCodes::Sub
		elseif code = "sub.ovf" then
			return OpCodes::Sub_Ovf
		elseif code = "sub.ovf.un" then
			return OpCodes::Sub_Ovf_Un
		elseif code = "throw" then
			return OpCodes::Throw
		elseif code = "unbox" then
			return OpCodes::Unbox
		elseif code = "unbox.any" then
			return OpCodes::Unbox_Any
		elseif code = "xor" then
			return OpCodes::Xor
		else
			return OpCodes::Nop
		end if
	end method

end class
