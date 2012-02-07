//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi InstructionHelper

method public static boolean compStr(var s1 as string, var s2 as string)
var num as integer = String::Compare(s1,s2)
if num = 0 then
return true
else
return false
end if
end method

method public static OpCode getOPCode(var code as string)

var b as boolean = false
label fin

b = compStr(code, "add")
if b = true then
return OpCodes::Add
goto fin
end if

b = compStr(code, "add.ovf")
if b = true then
return OpCodes::Add_Ovf
goto fin
end if

b = compStr(code, "and")
if b = true then
return OpCodes::And
goto fin
end if

b = compStr(code, "beq")
if b = true then
return OpCodes::Beq
goto fin
end if

b = compStr(code, "bge")
if b = true then
return OpCodes::Bge
goto fin
end if

b = compStr(code, "bgt")
if b = true then
return OpCodes::Bgt
goto fin
end if

b = compStr(code, "ble")
if b = true then
return OpCodes::Ble
goto fin
end if

b = compStr(code, "blt")
if b = true then
return OpCodes::Blt
goto fin
end if

b = compStr(code, "box")
if b = true then
return OpCodes::Box
goto fin
end if

b = compStr(code, "br")
if b = true then
return OpCodes::Br
goto fin
end if

b = compStr(code, "break")
if b = true then
return OpCodes::Break
goto fin
end if

b = compStr(code, "brfalse")
if b = true then
return OpCodes::Brfalse
goto fin
end if

b = compStr(code, "brtrue")
if b = true then
return OpCodes::Brtrue
goto fin
end if

b = compStr(code, "call")
if b = true then
return OpCodes::Call
goto fin
end if

b = compStr(code, "callvirt")
if b = true then
return OpCodes::Callvirt
goto fin
end if

b = compStr(code, "castclass")
if b = true then
return OpCodes::Castclass
goto fin
end if

b = compStr(code, "ceq")
if b = true then
return OpCodes::Ceq
goto fin
end if

b = compStr(code, "clt")
if b = true then
return OpCodes::Clt
goto fin
end if

b = compStr(code, "cgt")
if b = true then
return OpCodes::Cgt
goto fin
end if

b = compStr(code, "constrained.")
if b = true then
return OpCodes::Constrained
goto fin
end if

b = compStr(code, "conv.i")
if b = true then
return OpCodes::Conv_I
goto fin
end if

b = compStr(code, "conv.i1")
if b = true then
return OpCodes::Conv_I1
goto fin
end if

b = compStr(code, "conv.i2")
if b = true then
return OpCodes::Conv_I2
goto fin
end if

b = compStr(code, "conv.i4")
if b = true then
return OpCodes::Conv_I4
goto fin
end if

b = compStr(code, "conv.i8")
if b = true then
return OpCodes::Conv_I8
goto fin
end if

b = compStr(code, "conv.u")
if b = true then
return OpCodes::Conv_U
goto fin
end if

b = compStr(code, "conv.u1")
if b = true then
return OpCodes::Conv_U1
goto fin
end if

b = compStr(code, "conv.u2")
if b = true then
return OpCodes::Conv_U2
goto fin
end if

b = compStr(code, "conv.u4")
if b = true then
return OpCodes::Conv_U4
goto fin
end if

b = compStr(code, "conv.u8")
if b = true then
return OpCodes::Conv_U8
goto fin
end if

b = compStr(code, "conv.ovf.i")
if b = true then
return OpCodes::Conv_Ovf_I
goto fin
end if

b = compStr(code, "conv.ovf.i1")
if b = true then
return OpCodes::Conv_Ovf_I1
goto fin
end if

b = compStr(code, "conv.ovf.i2")
if b = true then
return OpCodes::Conv_Ovf_I2
goto fin
end if

b = compStr(code, "conv.ovf.i4")
if b = true then
return OpCodes::Conv_Ovf_I4
goto fin
end if

b = compStr(code, "conv.ovf.i8")
if b = true then
return OpCodes::Conv_Ovf_I8
goto fin
end if

b = compStr(code, "conv.ovf.u")
if b = true then
return OpCodes::Conv_Ovf_U
goto fin
end if

b = compStr(code, "conv.ovf.u1")
if b = true then
return OpCodes::Conv_Ovf_U1
goto fin
end if

b = compStr(code, "conv.ovf.u2")
if b = true then
return OpCodes::Conv_Ovf_U2
goto fin
end if

b = compStr(code, "conv.ovf.u4")
if b = true then
return OpCodes::Conv_Ovf_U4
goto fin
end if

b = compStr(code, "conv.ovf.u8")
if b = true then
return OpCodes::Conv_Ovf_U8
goto fin
end if
b = compStr(code, "conv.r4")
if b = true then
return OpCodes::Conv_R4
goto fin
end if

b = compStr(code, "conv.r8")
if b = true then
return OpCodes::Conv_R8
goto fin
end if

b = compStr(code, "div")
if b = true then
return OpCodes::Div
goto fin
end if

b = compStr(code, "dup")
if b = true then
return OpCodes::Dup
goto fin
end if

b = compStr(code, "isinst")
if b = true then
return OpCodes::Isinst
goto fin
end if

b = compStr(code, "ldarg")
if b = true then
return OpCodes::Ldarg
goto fin
end if

b = compStr(code, "ldarga")
if b = true then
return OpCodes::Ldarga
goto fin
end if

b = compStr(code, "ldarg.s")
if b = true then
return OpCodes::Ldarg_S
goto fin
end if

b = compStr(code, "ldarga.s")
if b = true then
return OpCodes::Ldarga_S
goto fin
end if

b = compStr(code, "ldarg.0")
if b = true then
return OpCodes::Ldarg_0
goto fin
end if

b = compStr(code, "ldarg.1")
if b = true then
return OpCodes::Ldarg_1
goto fin
end if

b = compStr(code, "ldarg.2")
if b = true then
return OpCodes::Ldarg_2
goto fin
end if

b = compStr(code, "ldarg.3")
if b = true then
return OpCodes::Ldarg_3
goto fin
end if

b = compStr(code, "ldc.i4")
if b = true then
return OpCodes::Ldc_I4
goto fin
end if

b = compStr(code, "ldc.i4.0")
if b = true then
return OpCodes::Ldc_I4_0
goto fin
end if

b = compStr(code, "ldc.i4.1")
if b = true then
return OpCodes::Ldc_I4_1
goto fin
end if

b = compStr(code, "ldc.i4.2")
if b = true then
return OpCodes::Ldc_I4_2
goto fin
end if

b = compStr(code, "ldc.i4.3")
if b = true then
return OpCodes::Ldc_I4_3
goto fin
end if

b = compStr(code, "ldc.i4.4")
if b = true then
return OpCodes::Ldc_I4_4
goto fin
end if

b = compStr(code, "ldc.i4.5")
if b = true then
return OpCodes::Ldc_I4_5
goto fin
end if

b = compStr(code, "ldc.i4.6")
if b = true then
return OpCodes::Ldc_I4_6
goto fin
end if

b = compStr(code, "ldc.i4.7")
if b = true then
return OpCodes::Ldc_I4_7
goto fin
end if

b = compStr(code, "ldc.i4.8")
if b = true then
return OpCodes::Ldc_I4_8
goto fin
end if

b = compStr(code, "ldc.i4.m1")
if b = true then
return OpCodes::Ldc_I4_M1
goto fin
end if

b = compStr(code, "ldc.i4.s")
if b = true then
return OpCodes::Ldc_I4_S
goto fin
end if

b = compStr(code, "ldc.i8")
if b = true then
return OpCodes::Ldc_I8
goto fin
end if

b = compStr(code, "ldc.r4")
if b = true then
return OpCodes::Ldc_R4
goto fin
end if

b = compStr(code, "ldc.r8")
if b = true then
return OpCodes::Ldc_R8
goto fin
end if

b = compStr(code, "ldc.r8")
if b = true then
return OpCodes::Ldc_R8
goto fin
end if

b = compStr(code, "ldelem")
if b = true then
return OpCodes::Ldelem
goto fin
end if

b = compStr(code, "ldelem.i")
if b = true then
return OpCodes::Ldelem_I
goto fin
end if

b = compStr(code, "ldelem.i1")
if b = true then
return OpCodes::Ldelem_I1
goto fin
end if

b = compStr(code, "ldelem.i2")
if b = true then
return OpCodes::Ldelem_I2
goto fin
end if

b = compStr(code, "ldelem.i4")
if b = true then
return OpCodes::Ldelem_I4
goto fin
end if

b = compStr(code, "ldelem.i8")
if b = true then
return OpCodes::Ldelem_I8
goto fin
end if

b = compStr(code, "ldelem.r4")
if b = true then
return OpCodes::Ldelem_R4
goto fin
end if

b = compStr(code, "ldelem.r8")
if b = true then
return OpCodes::Ldelem_R8
goto fin
end if

b = compStr(code, "ldelem.u1")
if b = true then
return OpCodes::Ldelem_U1
goto fin
end if

b = compStr(code, "ldelem.u2")
if b = true then
return OpCodes::Ldelem_U2
goto fin
end if

b = compStr(code, "ldelem.u4")
if b = true then
return OpCodes::Ldelem_U4
goto fin
end if

b = compStr(code, "ldelem.ref")
if b = true then
return OpCodes::Ldelem_Ref
goto fin
end if

b = compStr(code, "ldelema")
if b = true then
return OpCodes::Ldelema
goto fin
end if

b = compStr(code, "ldfld")
if b = true then
return OpCodes::Ldfld
goto fin
end if

b = compStr(code, "ldflda")
if b = true then
return OpCodes::Ldflda
goto fin
end if

b = compStr(code, "ldftn")
if b = true then
return OpCodes::Ldftn
goto fin
end if

b = compStr(code, "ldind.i")
if b = true then
return OpCodes::Ldind_I
goto fin
end if

b = compStr(code, "ldind.i1")
if b = true then
return OpCodes::Ldind_I1
goto fin
end if

b = compStr(code, "ldind.i2")
if b = true then
return OpCodes::Ldind_I2
goto fin
end if

b = compStr(code, "ldind.i4")
if b = true then
return OpCodes::Ldind_I4
goto fin
end if

b = compStr(code, "ldind.i8")
if b = true then
return OpCodes::Ldind_I8
goto fin
end if

b = compStr(code, "ldind.r4")
if b = true then
return OpCodes::Ldind_R4
goto fin
end if

b = compStr(code, "ldind.r8")
if b = true then
return OpCodes::Ldind_R8
goto fin
end if

b = compStr(code, "ldind.u1")
if b = true then
return OpCodes::Ldind_U1
goto fin
end if

b = compStr(code, "ldind.u2")
if b = true then
return OpCodes::Ldind_U2
goto fin
end if

b = compStr(code, "ldind.u4")
if b = true then
return OpCodes::Ldind_U4
goto fin
end if

b = compStr(code, "ldind.ref")
if b = true then
return OpCodes::Ldind_Ref
goto fin
end if

b = compStr(code, "ldlen")
if b = true then
return OpCodes::Ldlen
goto fin
end if

b = compStr(code, "ldloc")
if b = true then
return OpCodes::Ldloc
goto fin
end if

b = compStr(code, "ldloc.s")
if b = true then
return OpCodes::Ldloc_S
goto fin
end if

b = compStr(code, "ldloca")
if b = true then
return OpCodes::Ldloca
goto fin
end if

b = compStr(code, "ldloca.s")
if b = true then
return OpCodes::Ldloca_S
goto fin
end if

b = compStr(code, "ldloc.0")
if b = true then
return OpCodes::Ldloc_0
goto fin
end if

b = compStr(code, "ldloc.1")
if b = true then
return OpCodes::Ldloc_1
goto fin
end if

b = compStr(code, "ldloc.2")
if b = true then
return OpCodes::Ldloc_2
goto fin
end if

b = compStr(code, "ldloc.3")
if b = true then
return OpCodes::Ldloc_3
goto fin
end if

b = compStr(code, "ldnull")
if b = true then
return OpCodes::Ldnull
goto fin
end if

b = compStr(code, "ldobj")
if b = true then
return OpCodes::Ldobj
goto fin
end if

b = compStr(code, "ldsfld")
if b = true then
return OpCodes::Ldsfld
goto fin
end if

b = compStr(code, "ldsflda")
if b = true then
return OpCodes::Ldsflda
goto fin
end if

b = compStr(code, "ldstr")
if b = true then
return OpCodes::Ldstr
goto fin
end if

b = compStr(code, "ldtoken")
if b = true then
return OpCodes::Ldtoken
goto fin
end if

b = compStr(code, "ldvirtftn")
if b = true then
return OpCodes::Ldvirtftn
goto fin
end if

b = compStr(code, "ldftn")
if b = true then
return OpCodes::Ldftn
goto fin
end if


b = compStr(code, "leave")
if b = true then
return OpCodes::Leave
goto fin
end if

b = compStr(code, "mul")
if b = true then
return OpCodes::Mul
goto fin
end if

b = compStr(code, "mul.ovf")
if b = true then
return OpCodes::Mul_Ovf
goto fin
end if

b = compStr(code, "neg")
if b = true then
return OpCodes::Neg
goto fin
end if


b = compStr(code, "newarr")
if b = true then
return OpCodes::Newarr
goto fin
end if


b = compStr(code, "newobj")
if b = true then
return OpCodes::Newobj
goto fin
end if


b = compStr(code, "nop")
if b = true then
return OpCodes::Nop
goto fin
end if


b = compStr(code, "not")
if b = true then
return OpCodes::Not
goto fin
end if

b = compStr(code, "or")
if b = true then
return OpCodes::Or
goto fin
end if

b = compStr(code, "pop")
if b = true then
return OpCodes::Pop
goto fin
end if

b = compStr(code, "rem")
if b = true then
return OpCodes::Rem
goto fin
end if

b = compStr(code, "rem.un")
if b = true then
return OpCodes::Rem_Un
goto fin
end if

b = compStr(code, "ret")
if b = true then
return OpCodes::Ret
goto fin
end if

b = compStr(code, "rethrow")
if b = true then
return OpCodes::Rethrow
goto fin
end if

b = compStr(code, "shl")
if b = true then
return OpCodes::Shl
goto fin
end if

b = compStr(code, "shr")
if b = true then
return OpCodes::Shr
goto fin
end if

b = compStr(code, "sizeof")
if b = true then
return OpCodes::Sizeof
goto fin
end if

b = compStr(code, "starg")
if b = true then
return OpCodes::Starg
goto fin
end if

b = compStr(code, "starg.s")
if b = true then
return OpCodes::Starg_S
goto fin
end if

b = compStr(code, "stelem")
if b = true then
return OpCodes::Stelem
goto fin
end if

b = compStr(code, "stelem.i")
if b = true then
return OpCodes::Stelem_I
goto fin
end if

b = compStr(code, "stelem.i1")
if b = true then
return OpCodes::Stelem_I1
goto fin
end if

b = compStr(code, "stelem.i2")
if b = true then
return OpCodes::Stelem_I2
goto fin
end if

b = compStr(code, "stelem.i4")
if b = true then
return OpCodes::Stelem_I4
goto fin
end if

b = compStr(code, "stelem.i8")
if b = true then
return OpCodes::Stelem_I8
goto fin
end if

b = compStr(code, "stelem.r4")
if b = true then
return OpCodes::Stelem_R4
goto fin
end if

b = compStr(code, "stelem.r8")
if b = true then
return OpCodes::Stelem_R8
goto fin
end if

b = compStr(code, "stelem.ref")
if b = true then
return OpCodes::Stelem_Ref
goto fin
end if

b = compStr(code, "stfld")
if b = true then
return OpCodes::Stfld
goto fin
end if

b = compStr(code, "stind.i")
if b = true then
return OpCodes::Stind_I
goto fin
end if

b = compStr(code, "stind.i1")
if b = true then
return OpCodes::Ldind_I1
goto fin
end if

b = compStr(code, "stind.i2")
if b = true then
return OpCodes::Stind_I2
goto fin
end if

b = compStr(code, "stind.i4")
if b = true then
return OpCodes::Stind_I4
goto fin
end if

b = compStr(code, "stind.i8")
if b = true then
return OpCodes::Stind_I8
goto fin
end if

b = compStr(code, "stind.r4")
if b = true then
return OpCodes::Stind_R4
goto fin
end if

b = compStr(code, "stind.r8")
if b = true then
return OpCodes::Stelem_R8
goto fin
end if

b = compStr(code, "stind.ref")
if b = true then
return OpCodes::Stind_Ref
goto fin
end if

b = compStr(code, "stloc")
if b = true then
return OpCodes::Stloc
goto fin
end if

b = compStr(code, "stloc.s")
if b = true then
return OpCodes::Stloc_S
goto fin
end if

b = compStr(code, "stloc.0")
if b = true then
return OpCodes::Stloc_0
goto fin
end if

b = compStr(code, "stloc.1")
if b = true then
return OpCodes::Stloc_1
goto fin
end if

b = compStr(code, "stloc.2")
if b = true then
return OpCodes::Stloc_2
goto fin
end if

b = compStr(code, "stloc.3")
if b = true then
return OpCodes::Stloc_3
goto fin
end if

b = compStr(code, "stobj")
if b = true then
return OpCodes::Stobj
goto fin
end if

b = compStr(code, "stsfld")
if b = true then
return OpCodes::Stsfld
goto fin
end if

b = compStr(code, "sub")
if b = true then
return OpCodes::Sub
goto fin
end if

b = compStr(code, "sub.ovf")
if b = true then
return OpCodes::Sub_Ovf
goto fin
end if

b = compStr(code, "throw")
if b = true then
return OpCodes::Throw
goto fin
end if

b = compStr(code, "unbox")
if b = true then
return OpCodes::Unbox
goto fin
end if

b = compStr(code, "unbox.any")
if b = true then
return OpCodes::Unbox_Any
goto fin
end if

b = compStr(code, "xor")
if b = true then
return OpCodes::Xor
goto fin
end if

return OpCodes::Nop
place fin
end method

end class
