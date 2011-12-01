//    dnr.dll dylan.NET.Reflection Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit ILEmitter

field public static MethodBuilder Met
field public static ConstructorBuilder Constr
field public static ILGenerator ILGen
field public static ISymbolDocumentWriter DocWriter
field public static boolean StaticFlg
field public static boolean DebugFlg
field public static integer LocInd
field public static integer ArgInd

method public static void ctor0()
Met = null
Constr = null
ILGen = null
StaticFlg = false
DebugFlg = false
LocInd = 0
ArgInd = 0
end method

method public static void EmitRet()
var op as OpCode = InstructionHelper::getOPCode("ret")
ILGen::Emit(op)
end method

method public static void EmitPop()
var op as OpCode = InstructionHelper::getOPCode("pop")
ILGen::Emit(op)
end method

method public static void EmitBox(var t as System.Type)
var op as OpCode = InstructionHelper::getOPCode("box")
ILGen::Emit(op, t)
end method

method public static void EmitUnbox(var t as System.Type)
var op as OpCode = InstructionHelper::getOPCode("unbox")
ILGen::Emit(op, t)
end method

method public static void EmitUnboxAny(var t as System.Type)
var op as OpCode = InstructionHelper::getOPCode("unbox.any")
ILGen::Emit(op, t)
end method

method public static void EmitConstrained(var t as System.Type)
var op as OpCode = InstructionHelper::getOPCode("constrained.")
ILGen::Emit(op, t)
end method

method public static void EmitLdloc(var num as integer)
var op as OpCode
var b1 as boolean = false
var b2 as boolean = false
var n8 as System.Byte
var n16 as short

label fin

if num = 0 then
op = InstructionHelper::getOPCode("ldloc.0")
ILGen::Emit(op)
goto fin
end if

if num = 1 then
op = InstructionHelper::getOPCode("ldloc.1")
ILGen::Emit(op)
goto fin
end if

if num = 2 then
op = InstructionHelper::getOPCode("ldloc.2")
ILGen::Emit(op)
goto fin
end if

if num = 3 then
op = InstructionHelper::getOPCode("ldloc.3")
ILGen::Emit(op)
goto fin
end if

if num >= 0 then
b1 = true
end if
if num <= 255 then
b2 = true
end if
b2 = b1 and b2

if b2 = true then
op = InstructionHelper::getOPCode("ldloc.s")
n8 = Convert::ToByte(num)
ILGen::Emit(op, n8)
goto fin
end if

if b1 = true then
op = InstructionHelper::getOPCode("ldloc")
n16 = $short$num
ILGen::Emit(op, n16)
goto fin
end if

place fin
end method

method public static void EmitLdloca(var num as integer)
var op as OpCode
var b1 as boolean = false
var b2 as boolean = false
var n8 as System.Byte
var n16 as short

label fin

if num >= 0 then
b1 = true
end if
if num <= 255 then
b2 = true
end if
b2 = b1 and b2

if b2 = true then
op = InstructionHelper::getOPCode("ldloca.s")
n8 = Convert::ToByte(num)
ILGen::Emit(op, n8)
goto fin
end if

if b1 = true then
op = InstructionHelper::getOPCode("ldloca")
n16 = $short$num
ILGen::Emit(op, n16)
goto fin
end if

place fin
end method

method public static void EmitLdarg(var num as integer)
var op as OpCode
var b1 as boolean = false
var b2 as boolean = false
var n8 as System.Byte
var n16 as short

label fin

if num = 0 then
op = InstructionHelper::getOPCode("ldarg.0")
ILGen::Emit(op)
goto fin
end if

if num = 1 then
op = InstructionHelper::getOPCode("ldarg.1")
ILGen::Emit(op)
goto fin
end if

if num = 2 then
op = InstructionHelper::getOPCode("ldarg.2")
ILGen::Emit(op)
goto fin
end if

if num = 3 then
op = InstructionHelper::getOPCode("ldarg.3")
ILGen::Emit(op)
goto fin
end if

if num >= 0 then
b1 = true
end if
if num <= 255 then
b2 = true
end if
b2 = b1 and b2

if b2 = true then
op = InstructionHelper::getOPCode("ldarg.s")
n8 = Convert::ToByte(num)
ILGen::Emit(op, n8)
goto fin
end if

if b1 = true then
op = InstructionHelper::getOPCode("ldarg")
n16 = $short$num
ILGen::Emit(op, n16)
goto fin
end if

place fin
end method

method public static void EmitLdarga(var num as integer)
var op as OpCode
var b1 as boolean = false
var b2 as boolean = false
var n8 as System.Byte
var n16 as short

label fin

if num >= 0 then
b1 = true
end if
if num <= 255 then
b2 = true
end if
b2 = b1 and b2

if b2 = true then
op = InstructionHelper::getOPCode("ldarga.s")
n8 = Convert::ToByte(num)
ILGen::Emit(op, n8)
goto fin
end if

if b1 = true then
op = InstructionHelper::getOPCode("ldarga")
n16 = $short$num
ILGen::Emit(op, n16)
goto fin
end if

place fin
end method

method public static void EmitStloc(var num as integer)
var op as OpCode
var b1 as boolean = false
var b2 as boolean = false
var n8 as System.Byte
var n16 as short

label fin

if num = 0 then
op = InstructionHelper::getOPCode("stloc.0")
ILGen::Emit(op)
goto fin
end if

if num = 1 then
op = InstructionHelper::getOPCode("stloc.1")
ILGen::Emit(op)
goto fin
end if

if num = 2 then
op = InstructionHelper::getOPCode("stloc.2")
ILGen::Emit(op)
goto fin
end if

if num = 3 then
op = InstructionHelper::getOPCode("stloc.3")
ILGen::Emit(op)
goto fin
end if

if num >= 0 then
b1 = true
end if
if num <= 255 then
b2 = true
end if
b2 = b1 and b2

if b2 = true then
op = InstructionHelper::getOPCode("stloc.s")
n8 = Convert::ToByte(num)
ILGen::Emit(op, n8)
goto fin
end if

if b1 = true then
op = InstructionHelper::getOPCode("stloc")
n16 = $short$num
ILGen::Emit(op, n16)
goto fin
end if

place fin
end method


method public static void EmitStarg(var num as integer)
var op as OpCode
var b1 as boolean = false
var b2 as boolean = false
var n8 as System.Byte
var n16 as short

label fin

if num >= 0 then
b1 = true
end if
if num <= 255 then
b2 = true
end if
b2 = b1 and b2

if b2 = true then
op = InstructionHelper::getOPCode("starg.s")
n8 = Convert::ToByte(num)
ILGen::Emit(op, n8)
goto fin
end if

if b1 = true then
op = InstructionHelper::getOPCode("starg")
n16 = $short$num
ILGen::Emit(op, n16)
goto fin
end if

place fin
end method

method public static void EmitStfld(var fld as FieldInfo)
var lop as OpCode = InstructionHelper::getOPCode("stfld")
ILGen::Emit(lop, fld)
end method

method public static void EmitStsfld(var fld as FieldInfo)
var lsop as OpCode = InstructionHelper::getOPCode("stsfld")
ILGen::Emit(lsop, fld)
end method

method public static void EmitStelem(var typ as System.Type)

var t1 as System.Type
var op as OpCode
var b as boolean = false

label fin

t1 = gettype IntPtr
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.i")
ILGen::Emit(op)
goto fin
end if

t1 = gettype sbyte
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.i1")
ILGen::Emit(op)
goto fin
end if

t1 = gettype short
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.i2")
ILGen::Emit(op)
goto fin
end if

t1 = gettype integer
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.i4")
ILGen::Emit(op)
goto fin
end if

t1 = gettype long
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.i8")
ILGen::Emit(op)
goto fin
end if

t1 = gettype single
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.r4")
ILGen::Emit(op)
goto fin
end if

t1 = gettype double
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.r8")
ILGen::Emit(op)
goto fin
end if

t1 = gettype ValueType
b = t1::IsAssignableFrom(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem")
ILGen::Emit(op, typ)
goto fin
end if

t1 = gettype object
b = t1::IsAssignableFrom(typ)
if b = true then
op = InstructionHelper::getOPCode("stelem.ref")
ILGen::Emit(op)
goto fin
end if


place fin

end method

method public static void EmitLdelem(var typ as System.Type)

var t1 as System.Type
var op as OpCode
var b as boolean = false

label fin

t1 = gettype IntPtr
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.i")
ILGen::Emit(op)
goto fin
end if

t1 = gettype sbyte
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.i1")
ILGen::Emit(op)
goto fin
end if

t1 = gettype short
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.i2")
ILGen::Emit(op)
goto fin
end if

t1 = gettype integer
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.i4")
ILGen::Emit(op)
goto fin
end if

t1 = gettype Byte
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.u1")
ILGen::Emit(op)
goto fin
end if

t1 = gettype UInt16
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.u2")
ILGen::Emit(op)
goto fin
end if

t1 = gettype UInt32
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.u4")
ILGen::Emit(op)
goto fin
end if


t1 = gettype long
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.i8")
ILGen::Emit(op)
goto fin
end if

t1 = gettype single
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.r4")
ILGen::Emit(op)
goto fin
end if

t1 = gettype double
b = t1::Equals(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.r8")
ILGen::Emit(op)
goto fin
end if

t1 = gettype ValueType
b = t1::IsAssignableFrom(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem")
ILGen::Emit(op, typ)
goto fin
end if

t1 = gettype object
b = t1::IsAssignableFrom(typ)
if b = true then
op = InstructionHelper::getOPCode("ldelem.ref")
ILGen::Emit(op)
goto fin
end if


place fin

end method


method public static void EmitLdcI8(var n as long)
var op as OpCode
var b1 as boolean = false
var b2 as boolean = false
//var n8 as System.Byte
//var n16 as short

label fin

if n = -1l then
op = InstructionHelper::getOPCode("ldc.i4.m1")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 0l then
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 1l then
op = InstructionHelper::getOPCode("ldc.i4.1")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 2l then
op = InstructionHelper::getOPCode("ldc.i4.2")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 3l then
op = InstructionHelper::getOPCode("ldc.i4.3")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 4l then
op = InstructionHelper::getOPCode("ldc.i4.4")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 5l then
op = InstructionHelper::getOPCode("ldc.i4.5")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 6l then
op = InstructionHelper::getOPCode("ldc.i4.6")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 7l then
op = InstructionHelper::getOPCode("ldc.i4.7")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n = 8l then
op = InstructionHelper::getOPCode("ldc.i4.8")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)
goto fin
end if

if n >= -2147483648l then
b1 = true
end if
if n <= 2147483647l then
b2 = true
end if
b2 = b1 and b2

if b2 = true then
op = InstructionHelper::getOPCode("ldc.i4")
var num as integer = $integer$n
ILGen::Emit(op, num)
op = InstructionHelper::getOPCode("conv.i8")
ILGen::Emit(op)

goto fin
end if

//if b1 = true then
op = InstructionHelper::getOPCode("ldc.i8")
//n16 = $short$num
ILGen::Emit(op, n)
goto fin
//end if

place fin
end method

method public static void EmitLdcI4(var num as integer)
var op as OpCode
//var b1 as boolean = false
//var b2 as boolean = false
//var n8 as System.Byte
//var n16 as short

label fin

if num = -1 then
op = InstructionHelper::getOPCode("ldc.i4.m1")
ILGen::Emit(op)
goto fin
end if

if num = 0 then
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
goto fin
end if

if num = 1 then
op = InstructionHelper::getOPCode("ldc.i4.1")
ILGen::Emit(op)
goto fin
end if

if num = 2 then
op = InstructionHelper::getOPCode("ldc.i4.2")
ILGen::Emit(op)
goto fin
end if

if num = 3 then
op = InstructionHelper::getOPCode("ldc.i4.3")
ILGen::Emit(op)
goto fin
end if

if num = 4 then
op = InstructionHelper::getOPCode("ldc.i4.4")
ILGen::Emit(op)
goto fin
end if

if num = 5 then
op = InstructionHelper::getOPCode("ldc.i4.5")
ILGen::Emit(op)
goto fin
end if

if num = 6 then
op = InstructionHelper::getOPCode("ldc.i4.6")
ILGen::Emit(op)
goto fin
end if

if num = 7 then
op = InstructionHelper::getOPCode("ldc.i4.7")
ILGen::Emit(op)
goto fin
end if

if num = 8 then
op = InstructionHelper::getOPCode("ldc.i4.8")
ILGen::Emit(op)
goto fin
end if

//if num >= 0 then
//b1 = true
//end if
//if num <= 255 then
//b2 = true
//end if
//b2 = b1 and b2

//if b2 = true then
//op = InstructionHelper::getOPCode("ldloc.s")
//n8 = Convert::ToByte(num)
//ILGen::Emit(op, n8)
//goto fin
//end if

//if b1 = true then
op = InstructionHelper::getOPCode("ldc.i4")
//n16 = $short$num
ILGen::Emit(op, num)
goto fin
//end if

place fin
end method

method public static void EmitLdcI2(var n as short)
var op as OpCode
var num as integer = $integer$n
//var b1 as boolean = false
//var b2 as boolean = false
//var n8 as System.Byte
//var n16 as short

label fin

if num = -1 then
op = InstructionHelper::getOPCode("ldc.i4.m1")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 0 then
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 1 then
op = InstructionHelper::getOPCode("ldc.i4.1")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 2 then
op = InstructionHelper::getOPCode("ldc.i4.2")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 3 then
op = InstructionHelper::getOPCode("ldc.i4.3")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 4 then
op = InstructionHelper::getOPCode("ldc.i4.4")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 5 then
op = InstructionHelper::getOPCode("ldc.i4.5")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 6 then
op = InstructionHelper::getOPCode("ldc.i4.6")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 7 then
op = InstructionHelper::getOPCode("ldc.i4.7")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

if num = 8 then
op = InstructionHelper::getOPCode("ldc.i4.8")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
end if

//if num >= 0 then
//b1 = true
//end if
//if num <= 255 then
//b2 = true
//end if
//b2 = b1 and b2

//if b2 = true then
//op = InstructionHelper::getOPCode("ldloc.s")
//n8 = Convert::ToByte(num)
//ILGen::Emit(op, n8)
//goto fin
//end if

//if b1 = true then
op = InstructionHelper::getOPCode("ldc.i4")
//n16 = $short$num
ILGen::Emit(op, num)
op = InstructionHelper::getOPCode("conv.i2")
ILGen::Emit(op)
goto fin
//end if

place fin
end method

method public static void EmitLdcI1(var n as sbyte)
var op as OpCode
var num as integer = $integer$n
//var b1 as boolean = false
//var b2 as boolean = false
//var n8 as System.Byte
//var n16 as short

label fin

if num = -1 then
op = InstructionHelper::getOPCode("ldc.i4.m1")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 0 then
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 1 then
op = InstructionHelper::getOPCode("ldc.i4.1")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 2 then
op = InstructionHelper::getOPCode("ldc.i4.2")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 3 then
op = InstructionHelper::getOPCode("ldc.i4.3")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 4 then
op = InstructionHelper::getOPCode("ldc.i4.4")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 5 then
op = InstructionHelper::getOPCode("ldc.i4.5")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 6 then
op = InstructionHelper::getOPCode("ldc.i4.6")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 7 then
op = InstructionHelper::getOPCode("ldc.i4.7")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

if num = 8 then
op = InstructionHelper::getOPCode("ldc.i4.8")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
end if

//if num >= 0 then
//b1 = true
//end if
//if num <= 255 then
//b2 = true
//end if
//b2 = b1 and b2

//if b2 = true then
//op = InstructionHelper::getOPCode("ldloc.s")
//n8 = Convert::ToByte(num)
//ILGen::Emit(op, n8)
//goto fin
//end if

//if b1 = true then
op = InstructionHelper::getOPCode("ldc.i4")
//n16 = $short$num
ILGen::Emit(op, num)
op = InstructionHelper::getOPCode("conv.i1")
ILGen::Emit(op)
goto fin
//end if

place fin
end method

method public static void EmitCallvirt(var met as MethodInfo)
var cvop as OpCode = InstructionHelper::getOPCode("callvirt")
ILGen::Emit(cvop, met)
end method

method public static void EmitCallCtor(var met as ConstructorInfo)
var cop as OpCode = InstructionHelper::getOPCode("call")
ILGen::Emit(cop, met)
end method

method public static void EmitCall(var met as MethodInfo)
var cop as OpCode = InstructionHelper::getOPCode("call")
ILGen::Emit(cop, met)
end method

method public static void EmitLdftn(var met as MethodInfo)
var op as OpCode = InstructionHelper::getOPCode("ldftn")
ILGen::Emit(op, met)
end method

method public static void EmitLdvirtftn(var met as MethodInfo)
var op as OpCode = InstructionHelper::getOPCode("ldvirtftn")
ILGen::Emit(op, met)
end method

method public static void EmitLdfld(var fld as FieldInfo)
var lop as OpCode = InstructionHelper::getOPCode("ldfld")
ILGen::Emit(lop, fld)
end method

method public static void EmitLdsfld(var fld as FieldInfo)
var lsop as OpCode = InstructionHelper::getOPCode("ldsfld")
ILGen::Emit(lsop, fld)
end method

method public static void EmitLdflda(var fld as FieldInfo)
var lop as OpCode = InstructionHelper::getOPCode("ldflda")
ILGen::Emit(lop, fld)
end method

method public static void EmitLdsflda(var fld as FieldInfo)
var lsop as OpCode = InstructionHelper::getOPCode("ldsflda")
ILGen::Emit(lsop, fld)
end method

method public static void EmitLdstr(var str as string)
var lsop as OpCode = InstructionHelper::getOPCode("ldstr")
ILGen::Emit(lsop, str)
end method

method public static void EmitAdd(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("add")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("add.ovf.un")
ILGen::Emit(op)
end if
end method

method public static void EmitDiv(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("div")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("div.un")
ILGen::Emit(op)
end if
end method

method public static void EmitMul(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("mul")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("mul.ovf.un")
ILGen::Emit(op)
end if
end method

method public static void EmitSub(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("sub")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("sub.ovf.un")
ILGen::Emit(op)
end if
end method

method public static void EmitRem(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("rem")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("rem.un")
ILGen::Emit(op)
end if
end method

method public static void EmitShl()
var op as OpCode
op = InstructionHelper::getOPCode("shl")
ILGen::Emit(op)
end method

method public static void EmitShr(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("shr")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("shr.un")
ILGen::Emit(op)
end if
end method

method public static void EmitAnd()
var op as OpCode
op = InstructionHelper::getOPCode("and")
ILGen::Emit(op)
end method

method public static void EmitOr()
var op as OpCode
op = InstructionHelper::getOPCode("or")
ILGen::Emit(op)
end method

method public static void EmitXor()
var op as OpCode
op = InstructionHelper::getOPCode("xor")
ILGen::Emit(op)
end method

method public static void EmitNot()
var op as OpCode
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitNeg()
var op as OpCode
op = InstructionHelper::getOPCode("neg")
ILGen::Emit(op)
end method

method public static void EmitNand()
var op as OpCode
op = InstructionHelper::getOPCode("and")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitNor()
var op as OpCode
op = InstructionHelper::getOPCode("or")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitXnor()
var op as OpCode
op = InstructionHelper::getOPCode("xor")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("not")
ILGen::Emit(op)
end method

method public static void EmitCeq()
var op as OpCode
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitCneq()
var op as OpCode
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitCgt(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("cgt")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("cgt.un")
ILGen::Emit(op)
end if
end method

method public static void EmitClt(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("clt")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("clt.un")
ILGen::Emit(op)
end if
end method

method public static void EmitCle(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("cgt")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("cgt.un")
ILGen::Emit(op)
end if
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitCge(var s as boolean)
var op as OpCode
if s = true then
op = InstructionHelper::getOPCode("clt")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("clt.un")
ILGen::Emit(op)
end if
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitLike()
var op as OpCode
var lotyp as System.Type = gettype Regex
var params as system.Type[] = newarr System.Type 2
params[0] = gettype string
params[1] = gettype string
var lomet as MethodInfo = lotyp::GetMethod("IsMatch",params)
op = InstructionHelper::getOPCode("call")
ILGen::Emit(op, lomet)
end method

method public static void EmitNLike()
var op as OpCode
var lotyp as System.Type = gettype Regex
var params as system.Type[] = newarr System.Type 2
params[0] = gettype string
params[1] = gettype string
var lomet as MethodInfo = lotyp::GetMethod("IsMatch",params)
op = InstructionHelper::getOPCode("call")
ILGen::Emit(op, lomet)
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)

end method

method public static void EmitStrCeq()
var op as OpCode
var strtyp as System.Type = gettype string
var params as system.Type[] = newarr System.Type 2
params[0] = gettype string
params[1] = gettype string
var met as MethodInfo = strtyp::GetMethod("Compare",params)
op = InstructionHelper::getOPCode("call")
ILGen::Emit(op, met)
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitStrCneq()
var op as OpCode
var strtyp as System.Type = gettype string
var params as system.Type[] = newarr System.Type 2
params[0] = gettype string
params[1] = gettype string
var met as MethodInfo = strtyp::GetMethod("Compare",params)
op = InstructionHelper::getOPCode("call")
ILGen::Emit(op, met)
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
op = InstructionHelper::getOPCode("ceq")
ILGen::Emit(op)
end method

method public static void EmitStrAdd()
var op as OpCode
var strtyp as System.Type = gettype string
var params as system.Type[] = newarr System.Type 2
params[0] = gettype string
params[1] = gettype string
var met as MethodInfo = strtyp::GetMethod("Concat",params)
op = InstructionHelper::getOPCode("call")
ILGen::Emit(op, met)
end method

method public static void EmitLdcR4(var num as single)
var op as OpCode
op = InstructionHelper::getOPCode("ldc.r4")
ILGen::Emit(op, num)
end method

method public static void EmitLdcR8(var num as double)
var op as OpCode
op = InstructionHelper::getOPCode("ldc.r8")
ILGen::Emit(op, num)
end method

method public static void EmitLdcBool(var b as boolean)
var op as OpCode
if b = true then
op = InstructionHelper::getOPCode("ldc.i4.1")
ILGen::Emit(op)
else
op = InstructionHelper::getOPCode("ldc.i4.0")
ILGen::Emit(op)
end if
end method

method public static void EmitLdcChar(var c as char)
var op as OpCode
op = InstructionHelper::getOPCode("ldc.i4")
ILGen::Emit(op, $integer$c)
end method

method public static void EmitLdnull()
var op as OpCode
op = InstructionHelper::getOPCode("ldnull")
ILGen::Emit(op)
end method

method public static void EmitNewobj(var c as ConstructorInfo)
var op as OpCode
op = InstructionHelper::getOPCode("newobj")
ILGen::Emit(op, c)
end method

method public static void EmitBr(var lbl as Emit.Label)
var op as OpCode
op = InstructionHelper::getOPCode("br")
ILGen::Emit(op, lbl)
end method

method public static void EmitBrfalse(var lbl as Emit.Label)
var op as OpCode
op = InstructionHelper::getOPCode("brfalse")
ILGen::Emit(op, lbl)
end method

method public static void EmitBrtrue(var lbl as Emit.Label)
var op as OpCode
op = InstructionHelper::getOPCode("brtrue")
ILGen::Emit(op, lbl)
end method

method public static void EmitLdtoken(var t as System.Type)
var op as OpCode
op = InstructionHelper::getOPCode("ldtoken")
ILGen::Emit(op, t)
end method

method public static void EmitConvU()
var op as OpCode
op = InstructionHelper::getOPCode("conv.u")
ILGen::Emit(op)
end method

method public static void EmitConvI()
var op as OpCode
op = InstructionHelper::getOPCode("conv.i")
ILGen::Emit(op)
end method

method public static void EmitConvI4()
var op as OpCode
op = InstructionHelper::getOPCode("conv.i4")
ILGen::Emit(op)
end method

method public static void EmitNewarr(var t as System.Type)
var op as OpCode
ILGen::Emit(op)
op = InstructionHelper::getOPCode("newarr")
ILGen::Emit(op, t)
end method


method public static void DeclVar(var name as string, var typ as System.Type)
var lb as LocalBuilder = ILGen::DeclareLocal(typ)
if DebugFlg = true then
lb::SetLocalSymInfo(name)
end if
end method

method public static Emit.Label DefineLbl()
return ILGen::DefineLabel()
end method

method public static void MarkLbl(var lbl as Emit.Label)
ILGen::MarkLabel(lbl)
end method

method public static void MarkDbgPt(var line as integer)
ILGen::MarkSequencePoint(DocWriter, line, 1, line, 100)
end method

end class
