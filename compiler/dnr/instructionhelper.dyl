//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class private auto ansi static InstructionHelper

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Emit.OpCode getOPCode(var code as string)
		
		if code = "add" then
			return IKVM.Reflection.Emit.OpCodes::Add
		elseif code = "add.ovf" then
			return IKVM.Reflection.Emit.OpCodes::Add_Ovf
		elseif code = "add.ovf.un" then
			return IKVM.Reflection.Emit.OpCodes::Add_Ovf_Un
		elseif code = "and" then
			return IKVM.Reflection.Emit.OpCodes::And
		elseif code = "beq" then
			return IKVM.Reflection.Emit.OpCodes::Beq
		elseif code = "bge" then
			return IKVM.Reflection.Emit.OpCodes::Bge
		elseif code = "bgt" then
			return IKVM.Reflection.Emit.OpCodes::Bgt
		elseif code = "ble" then
			return IKVM.Reflection.Emit.OpCodes::Ble
		elseif code = "blt" then
			return IKVM.Reflection.Emit.OpCodes::Blt
		elseif code = "box" then
			return IKVM.Reflection.Emit.OpCodes::Box
		elseif code = "br" then
			return IKVM.Reflection.Emit.OpCodes::Br
		elseif code = "break" then
			return IKVM.Reflection.Emit.OpCodes::Break
		elseif code = "brfalse" then
			return IKVM.Reflection.Emit.OpCodes::Brfalse
		elseif code = "brtrue" then
			return IKVM.Reflection.Emit.OpCodes::Brtrue
		elseif code = "call" then
			return IKVM.Reflection.Emit.OpCodes::Call
		elseif code = "callvirt" then
			return IKVM.Reflection.Emit.OpCodes::Callvirt
		elseif code = "castclass" then
			return IKVM.Reflection.Emit.OpCodes::Castclass
		elseif code = "ceq" then
			return IKVM.Reflection.Emit.OpCodes::Ceq
		elseif code = "clt" then
			return IKVM.Reflection.Emit.OpCodes::Clt
		elseif code = "clt.un" then
			return IKVM.Reflection.Emit.OpCodes::Clt_Un
		elseif code = "cgt" then
			return IKVM.Reflection.Emit.OpCodes::Cgt
		elseif code = "cgt.un" then
			return IKVM.Reflection.Emit.OpCodes::Cgt_Un
		elseif code = "constrained." then
			return IKVM.Reflection.Emit.OpCodes::Constrained
		elseif code = "conv.i" then
			return IKVM.Reflection.Emit.OpCodes::Conv_I
		elseif code = "conv.i1" then
			return IKVM.Reflection.Emit.OpCodes::Conv_I1
		elseif code = "conv.i2" then
			return IKVM.Reflection.Emit.OpCodes::Conv_I2
		elseif code = "conv.i4" then
			return IKVM.Reflection.Emit.OpCodes::Conv_I4
		elseif code = "conv.i8" then
			return IKVM.Reflection.Emit.OpCodes::Conv_I8
		elseif code = "conv.u" then
			return IKVM.Reflection.Emit.OpCodes::Conv_U
		elseif code = "conv.u1" then
			return IKVM.Reflection.Emit.OpCodes::Conv_U1
		elseif code = "conv.u2" then
			return IKVM.Reflection.Emit.OpCodes::Conv_U2
		elseif code = "conv.u4" then
			return IKVM.Reflection.Emit.OpCodes::Conv_U4
		elseif code = "conv.u8" then
			return IKVM.Reflection.Emit.OpCodes::Conv_U8
		elseif code = "conv.ovf.i" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I
		elseif code = "conv.ovf.i1" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I1
		elseif code = "conv.ovf.i2" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I2
		elseif code = "conv.ovf.i4" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I4
		elseif code = "conv.ovf.i8" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_I8
		elseif code = "conv.ovf.u" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_U
		elseif code = "conv.ovf.u1" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_U1
		elseif code = "conv.ovf.u2" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_U2
		elseif code = "conv.ovf.u4" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_U4
		elseif code = "conv.ovf.u8" then
			return IKVM.Reflection.Emit.OpCodes::Conv_Ovf_U8
		elseif code = "conv.r4" then
			return IKVM.Reflection.Emit.OpCodes::Conv_R4
		elseif code = "conv.r8" then
			return IKVM.Reflection.Emit.OpCodes::Conv_R8
		elseif code = "div" then
			return IKVM.Reflection.Emit.OpCodes::Div
		elseif code = "div.un" then
			return IKVM.Reflection.Emit.OpCodes::Div_Un
		elseif code = "dup" then
			return IKVM.Reflection.Emit.OpCodes::Dup
		elseif code = "isinst" then
			return IKVM.Reflection.Emit.OpCodes::Isinst
		elseif code = "ldarg" then
			return IKVM.Reflection.Emit.OpCodes::Ldarg
		elseif code = "ldarga" then
			return IKVM.Reflection.Emit.OpCodes::Ldarga
		elseif code = "ldarg.s" then
			return IKVM.Reflection.Emit.OpCodes::Ldarg_S
		elseif code = "ldarga.s" then
			return IKVM.Reflection.Emit.OpCodes::Ldarga_S
		elseif code = "ldarg.0" then
			return IKVM.Reflection.Emit.OpCodes::Ldarg_0
		elseif code = "ldarg.1" then
			return IKVM.Reflection.Emit.OpCodes::Ldarg_1
		elseif code = "ldarg.2" then
			return IKVM.Reflection.Emit.OpCodes::Ldarg_2
		elseif code = "ldarg.3" then
			return IKVM.Reflection.Emit.OpCodes::Ldarg_3
		elseif code = "ldc.i4" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4
		elseif code = "ldc.i4.0" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_0
		elseif code = "ldc.i4.1" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_1
		elseif code = "ldc.i4.2" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_2
		elseif code = "ldc.i4.3" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_3
		elseif code = "ldc.i4.4" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_4
		elseif code = "ldc.i4.5" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_5
		elseif code = "ldc.i4.6" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_6
		elseif code = "ldc.i4.7" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_7
		elseif code = "ldc.i4.8" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_8
		elseif code = "ldc.i4.m1" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_M1
		elseif code = "ldc.i4.s" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I4_S
		elseif code = "ldc.i8" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_I8
		elseif code = "ldc.r4" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_R4
		elseif code = "ldc.r8" then
			return IKVM.Reflection.Emit.OpCodes::Ldc_R8
		elseif code = "ldelem" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem
		elseif code = "ldelem.i" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_I
		elseif code = "ldelem.i1" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_I1
		elseif code = "ldelem.i2" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_I2
		elseif code = "ldelem.i4" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_I4
		elseif code = "ldelem.i8" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_I8
		elseif code = "ldelem.r4" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_R4
		elseif code = "ldelem.r8" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_R8
		elseif code = "ldelem.u1" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_U1
		elseif code = "ldelem.u2" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_U2
		elseif code = "ldelem.u4" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_U4
		elseif code = "ldelem.ref" then
			return IKVM.Reflection.Emit.OpCodes::Ldelem_Ref
		elseif code = "ldelema" then
			return IKVM.Reflection.Emit.OpCodes::Ldelema
		elseif code = "ldfld" then
			return IKVM.Reflection.Emit.OpCodes::Ldfld
		elseif code = "ldflda" then
			return IKVM.Reflection.Emit.OpCodes::Ldflda
		elseif code = "ldftn" then
			return IKVM.Reflection.Emit.OpCodes::Ldftn
		elseif code = "ldind.i" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_I
		elseif code = "ldind.i1" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_I1
		elseif code = "ldind.i2" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_I2
		elseif code = "ldind.i4" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_I4
		elseif code = "ldind.i8" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_I8
		elseif code = "ldind.r4" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_R4
		elseif code = "ldind.r8" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_R8
		elseif code = "ldind.u1" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_U1
		elseif code = "ldind.u2" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_U2
		elseif code = "ldind.u4" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_U4
		elseif code = "ldind.ref" then
			return IKVM.Reflection.Emit.OpCodes::Ldind_Ref
		elseif code = "ldlen" then
			return IKVM.Reflection.Emit.OpCodes::Ldlen
		elseif code = "ldloc" then
			return IKVM.Reflection.Emit.OpCodes::Ldloc
		elseif code = "ldloc.s" then
			return IKVM.Reflection.Emit.OpCodes::Ldloc_S
		elseif code = "ldloca" then
			return IKVM.Reflection.Emit.OpCodes::Ldloca
		elseif code = "ldloca.s" then
			return IKVM.Reflection.Emit.OpCodes::Ldloca_S
		elseif code = "ldloc.0" then
			return IKVM.Reflection.Emit.OpCodes::Ldloc_0
		elseif code = "ldloc.1" then
			return IKVM.Reflection.Emit.OpCodes::Ldloc_1
		elseif code = "ldloc.2" then
			return IKVM.Reflection.Emit.OpCodes::Ldloc_2
		elseif code = "ldloc.3" then
			return IKVM.Reflection.Emit.OpCodes::Ldloc_3
		elseif code = "ldnull" then
			return IKVM.Reflection.Emit.OpCodes::Ldnull
		elseif code = "ldobj" then
			return IKVM.Reflection.Emit.OpCodes::Ldobj
		elseif code = "ldsfld" then
			return IKVM.Reflection.Emit.OpCodes::Ldsfld
		elseif code = "ldsflda" then
			return IKVM.Reflection.Emit.OpCodes::Ldsflda
		elseif code = "ldstr" then
			return IKVM.Reflection.Emit.OpCodes::Ldstr
		elseif code = "ldtoken" then
			return IKVM.Reflection.Emit.OpCodes::Ldtoken
		elseif code = "ldvirtftn" then
			return IKVM.Reflection.Emit.OpCodes::Ldvirtftn
		elseif code = "ldftn" then
			return IKVM.Reflection.Emit.OpCodes::Ldftn
		elseif code = "leave" then
			return IKVM.Reflection.Emit.OpCodes::Leave
		elseif code = "mul" then
			return IKVM.Reflection.Emit.OpCodes::Mul
		elseif code = "mul.ovf" then
			return IKVM.Reflection.Emit.OpCodes::Mul_Ovf
		elseif code = "mul.ovf.un" then
			return IKVM.Reflection.Emit.OpCodes::Mul_Ovf_Un
		elseif code = "neg" then
			return IKVM.Reflection.Emit.OpCodes::Neg
		elseif code = "newarr" then
			return IKVM.Reflection.Emit.OpCodes::Newarr
		elseif code = "newobj" then
			return IKVM.Reflection.Emit.OpCodes::Newobj
		elseif code = "nop" then
			return IKVM.Reflection.Emit.OpCodes::Nop
		elseif code = "not" then
			return IKVM.Reflection.Emit.OpCodes::Not
		elseif code = "or" then
			return IKVM.Reflection.Emit.OpCodes::Or
		elseif code = "pop" then
			return IKVM.Reflection.Emit.OpCodes::Pop
		elseif code = "rem" then
			return IKVM.Reflection.Emit.OpCodes::Rem
		elseif code = "rem.un" then
			return IKVM.Reflection.Emit.OpCodes::Rem_Un
		elseif code = "ret" then
			return IKVM.Reflection.Emit.OpCodes::Ret
		elseif code = "rethrow" then
			return IKVM.Reflection.Emit.OpCodes::Rethrow
		elseif code = "shl" then
			return IKVM.Reflection.Emit.OpCodes::Shl
		elseif code = "shr" then
			return IKVM.Reflection.Emit.OpCodes::Shr
		elseif code = "shr.un" then
			return IKVM.Reflection.Emit.OpCodes::Shr_Un
		elseif code = "sizeof" then
			return IKVM.Reflection.Emit.OpCodes::Sizeof
		elseif code = "starg" then
			return IKVM.Reflection.Emit.OpCodes::Starg
		elseif code = "starg.s" then
			return IKVM.Reflection.Emit.OpCodes::Starg_S
		elseif code = "stelem" then
			return IKVM.Reflection.Emit.OpCodes::Stelem
		elseif code = "stelem.i" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_I
		elseif code = "stelem.i1" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_I1
		elseif code = "stelem.i2" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_I2
		elseif code = "stelem.i4" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_I4
		elseif code = "stelem.i8" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_I8
		elseif code = "stelem.r4" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_R4
		elseif code = "stelem.r8" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_R8
		elseif code = "stelem.ref" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_Ref
		elseif code = "stfld" then
			return IKVM.Reflection.Emit.OpCodes::Stfld
		elseif code = "stind.i" then
			return IKVM.Reflection.Emit.OpCodes::Stind_I
		elseif code = "stind.i1" then
			return IKVM.Reflection.Emit.OpCodes::Stind_I1
		elseif code = "stind.i2" then
			return IKVM.Reflection.Emit.OpCodes::Stind_I2
		elseif code = "stind.i4" then
			return IKVM.Reflection.Emit.OpCodes::Stind_I4
		elseif code = "stind.i8" then
			return IKVM.Reflection.Emit.OpCodes::Stind_I8
		elseif code = "stind.r4" then
			return IKVM.Reflection.Emit.OpCodes::Stind_R4
		elseif code = "stind.r8" then
			return IKVM.Reflection.Emit.OpCodes::Stelem_R8
		elseif code = "stind.ref" then
			return IKVM.Reflection.Emit.OpCodes::Stind_Ref
		elseif code = "stloc" then
			return IKVM.Reflection.Emit.OpCodes::Stloc
		elseif code = "stloc.s" then
			return IKVM.Reflection.Emit.OpCodes::Stloc_S
		elseif code = "stloc.0" then
			return IKVM.Reflection.Emit.OpCodes::Stloc_0
		elseif code = "stloc.1" then
			return IKVM.Reflection.Emit.OpCodes::Stloc_1
		elseif code = "stloc.2" then
			return IKVM.Reflection.Emit.OpCodes::Stloc_2
		elseif code = "stloc.3" then
			return IKVM.Reflection.Emit.OpCodes::Stloc_3
		elseif code = "stobj" then
			return IKVM.Reflection.Emit.OpCodes::Stobj
		elseif code = "stsfld" then
			return IKVM.Reflection.Emit.OpCodes::Stsfld
		elseif code = "sub" then
			return IKVM.Reflection.Emit.OpCodes::Sub
		elseif code = "sub.ovf" then
			return IKVM.Reflection.Emit.OpCodes::Sub_Ovf
		elseif code = "sub.ovf.un" then
			return IKVM.Reflection.Emit.OpCodes::Sub_Ovf_Un
		elseif code = "throw" then
			return IKVM.Reflection.Emit.OpCodes::Throw
		elseif code = "unbox" then
			return IKVM.Reflection.Emit.OpCodes::Unbox
		elseif code = "unbox.any" then
			return IKVM.Reflection.Emit.OpCodes::Unbox_Any
		elseif code = "xor" then
			return IKVM.Reflection.Emit.OpCodes::Xor
		else
			return IKVM.Reflection.Emit.OpCodes::Nop
		end if
	end method

end class
