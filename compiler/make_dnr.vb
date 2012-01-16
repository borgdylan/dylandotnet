Imports dylan.NET.Utils
Imports dylan.NET
Imports System.Text.RegularExpressions
Imports System.Linq
Imports System.Collections.Generic
Imports System.Collections
Imports System.IO
Imports Microsoft.VisualBasic
Imports System.Xml
Imports System.Xml.Linq
Imports System.Data

Imports System
Imports System.Diagnostics
Imports System.Diagnostics.SymbolStore
Imports System.Reflection
Imports System.Resources
Imports System.Reflection.Emit
Module Module1

Public asmName As AssemblyName
Public asm As AssemblyBuilder
Public Typ As Type
Public Typ02 As Type
Public Typ03 As Type
Public Typ04 As Type
Public impstr(-1) As String
Public impasm(-1) As Assembly
Public interfacebool As Boolean
Public mdl As ModuleBuilder
Public resw As IResourceWriter
Public resobj As Object

Dim doc As ISymbolDocumentWriter

Sub addstr(ByVal str As String)
ReDim Preserve impstr(UBound(impstr) + 1)
impstr(UBound(impstr)) = str
End Sub

Sub addasm(ByVal asm As Assembly)
ReDim Preserve impasm(UBound(impasm) + 1)
impasm(UBound(impasm)) = asm
End Sub

Function MakeGetType(ByVal TypeName As String) As Type
Dim attachbrackets As Boolean = False
If TypeName Like "*[[]*]" Then
Dim split As String() = TypeName.Split(New [Char] () {"[","]"})
TypeName = split(0)
attachbrackets = True
End If
Dim ind As Integer = -1
Dim i As Integer = -1
Dim len As Integer = impstr.Length - 1
Do Until i = len
i = i + 1
If TypeName Like impstr(i) & "*" Then
ind = i
End If
Loop
If ind <> -1 Then
Dim assem As Assembly = impasm(ind)
If attachbrackets = True Then
TypeName = TypeName & "[]"
End If
MakeGetType = assem.GetType(TypeName)
Else
If attachbrackets = True Then
TypeName = TypeName & "[]"
End If
MakeGetType = Type.GetType(TypeName)
End If
Return MakeGetType
End Function

Dim doc2 As ISymbolDocumentWriter

Sub InstructionHelper()
Dim InstructionHelper As TypeBuilder = mdl.DefineType("dylan.NET.Reflection" & "." & "InstructionHelper", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass, GetType(System.Object))
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
Dim compStr As MethodBuilder = InstructionHelper.DefineMethod("compStr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Boolean), typ0)
Dim compStrIL As ILGenerator = compStr.GetILGenerator()
Dim compStrparam01 As ParameterBuilder = compStr.DefineParameter(1, ParameterAttributes.None, "s1")
Dim compStrparam02 As ParameterBuilder = compStr.DefineParameter(2, ParameterAttributes.None, "s2")
compStrIL.MarkSequencePoint(doc2, 12, 1, 12, 100)
Dim locbldr0 As LocalBuilder = compStrIL.DeclareLocal(GetType(System.Int32))
locbldr0.SetLocalSymInfo("num")
Dim typ1(-1) As Type
compStrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
compStrIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
compStrIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ1))
Typ = GetType(String).GetMethod("Compare", typ1).ReturnType
compStrIL.Emit(OpCodes.Stloc, 0)
compStrIL.MarkSequencePoint(doc2, 13, 1, 13, 100)
compStrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
compStrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa0 As System.Reflection.Emit.Label = compStrIL.DefineLabel()
Dim tru0 As System.Reflection.Emit.Label = compStrIL.DefineLabel()
Dim cont0 As System.Reflection.Emit.Label = compStrIL.DefineLabel()
compStrIL.Emit(OpCodes.Beq, tru0)
compStrIL.Emit(OpCodes.Br, fa0)
compStrIL.MarkLabel(tru0)
compStrIL.MarkSequencePoint(doc2, 14, 1, 14, 100)
compStrIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
compStrIL.MarkSequencePoint(doc2, 15, 1, 15, 100)
compStrIL.Emit(OpCodes.Br, cont0)
compStrIL.MarkLabel(fa0)
compStrIL.MarkSequencePoint(doc2, 16, 1, 16, 100)
compStrIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
compStrIL.MarkSequencePoint(doc2, 17, 1, 17, 100)
compStrIL.Emit(OpCodes.Br, cont0)
compStrIL.MarkLabel(cont0)
compStrIL.MarkSequencePoint(doc2, 18, 1, 18, 100)
compStrIL.Emit(OpCodes.Ret)
Dim typ2(-1) As Type
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = GetType(System.String)
Dim getOPCode As MethodBuilder = InstructionHelper.DefineMethod("getOPCode", MethodAttributes.Public Or MethodAttributes.Static, GetType(OpCode), typ2)
Dim getOPCodeIL As ILGenerator = getOPCode.GetILGenerator()
Dim getOPCodeparam01 As ParameterBuilder = getOPCode.DefineParameter(1, ParameterAttributes.None, "code")
getOPCodeIL.MarkSequencePoint(doc2, 22, 1, 22, 100)
Dim locbldr1 As LocalBuilder = getOPCodeIL.DeclareLocal(GetType(System.Boolean))
locbldr1.SetLocalSymInfo("b")
getOPCodeIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 23, 1, 23, 100)
Dim label0 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.MarkSequencePoint(doc2, 25, 1, 25, 100)
Dim typ3(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "add")
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 26, 1, 26, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa1 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru1 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont1 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru1)
getOPCodeIL.Emit(OpCodes.Br, fa1)
getOPCodeIL.MarkLabel(tru1)
getOPCodeIL.MarkSequencePoint(doc2, 27, 1, 27, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Add"))
Typ = GetType(OpCodes).GetField("Add").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 28, 1, 28, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 29, 1, 29, 100)
getOPCodeIL.Emit(OpCodes.Br, cont1)
getOPCodeIL.MarkLabel(fa1)
getOPCodeIL.Emit(OpCodes.Br, cont1)
getOPCodeIL.MarkLabel(cont1)
getOPCodeIL.MarkSequencePoint(doc2, 31, 1, 31, 100)
Dim typ4(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "add.ovf")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 32, 1, 32, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa2 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru2 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont2 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru2)
getOPCodeIL.Emit(OpCodes.Br, fa2)
getOPCodeIL.MarkLabel(tru2)
getOPCodeIL.MarkSequencePoint(doc2, 33, 1, 33, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Add_Ovf"))
Typ = GetType(OpCodes).GetField("Add_Ovf").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 34, 1, 34, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 35, 1, 35, 100)
getOPCodeIL.Emit(OpCodes.Br, cont2)
getOPCodeIL.MarkLabel(fa2)
getOPCodeIL.Emit(OpCodes.Br, cont2)
getOPCodeIL.MarkLabel(cont2)
getOPCodeIL.MarkSequencePoint(doc2, 37, 1, 37, 100)
Dim typ5(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "and")
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 38, 1, 38, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa3 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru3 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont3 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru3)
getOPCodeIL.Emit(OpCodes.Br, fa3)
getOPCodeIL.MarkLabel(tru3)
getOPCodeIL.MarkSequencePoint(doc2, 39, 1, 39, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("And"))
Typ = GetType(OpCodes).GetField("And").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 40, 1, 40, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 41, 1, 41, 100)
getOPCodeIL.Emit(OpCodes.Br, cont3)
getOPCodeIL.MarkLabel(fa3)
getOPCodeIL.Emit(OpCodes.Br, cont3)
getOPCodeIL.MarkLabel(cont3)
getOPCodeIL.MarkSequencePoint(doc2, 43, 1, 43, 100)
Dim typ6(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "beq")
Typ = GetType(System.String)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 44, 1, 44, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa4 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru4 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont4 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru4)
getOPCodeIL.Emit(OpCodes.Br, fa4)
getOPCodeIL.MarkLabel(tru4)
getOPCodeIL.MarkSequencePoint(doc2, 45, 1, 45, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Beq"))
Typ = GetType(OpCodes).GetField("Beq").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 46, 1, 46, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 47, 1, 47, 100)
getOPCodeIL.Emit(OpCodes.Br, cont4)
getOPCodeIL.MarkLabel(fa4)
getOPCodeIL.Emit(OpCodes.Br, cont4)
getOPCodeIL.MarkLabel(cont4)
getOPCodeIL.MarkSequencePoint(doc2, 49, 1, 49, 100)
Dim typ7(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "bge")
Typ = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 50, 1, 50, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa5 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru5 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont5 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru5)
getOPCodeIL.Emit(OpCodes.Br, fa5)
getOPCodeIL.MarkLabel(tru5)
getOPCodeIL.MarkSequencePoint(doc2, 51, 1, 51, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Bge"))
Typ = GetType(OpCodes).GetField("Bge").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 52, 1, 52, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 53, 1, 53, 100)
getOPCodeIL.Emit(OpCodes.Br, cont5)
getOPCodeIL.MarkLabel(fa5)
getOPCodeIL.Emit(OpCodes.Br, cont5)
getOPCodeIL.MarkLabel(cont5)
getOPCodeIL.MarkSequencePoint(doc2, 55, 1, 55, 100)
Dim typ8(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "bgt")
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 56, 1, 56, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa6 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru6 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont6 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru6)
getOPCodeIL.Emit(OpCodes.Br, fa6)
getOPCodeIL.MarkLabel(tru6)
getOPCodeIL.MarkSequencePoint(doc2, 57, 1, 57, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Bgt"))
Typ = GetType(OpCodes).GetField("Bgt").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 58, 1, 58, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 59, 1, 59, 100)
getOPCodeIL.Emit(OpCodes.Br, cont6)
getOPCodeIL.MarkLabel(fa6)
getOPCodeIL.Emit(OpCodes.Br, cont6)
getOPCodeIL.MarkLabel(cont6)
getOPCodeIL.MarkSequencePoint(doc2, 61, 1, 61, 100)
Dim typ9(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ble")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 62, 1, 62, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa7 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru7 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont7 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru7)
getOPCodeIL.Emit(OpCodes.Br, fa7)
getOPCodeIL.MarkLabel(tru7)
getOPCodeIL.MarkSequencePoint(doc2, 63, 1, 63, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ble"))
Typ = GetType(OpCodes).GetField("Ble").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 64, 1, 64, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 65, 1, 65, 100)
getOPCodeIL.Emit(OpCodes.Br, cont7)
getOPCodeIL.MarkLabel(fa7)
getOPCodeIL.Emit(OpCodes.Br, cont7)
getOPCodeIL.MarkLabel(cont7)
getOPCodeIL.MarkSequencePoint(doc2, 67, 1, 67, 100)
Dim typ10(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "blt")
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 68, 1, 68, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa8 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru8 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont8 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru8)
getOPCodeIL.Emit(OpCodes.Br, fa8)
getOPCodeIL.MarkLabel(tru8)
getOPCodeIL.MarkSequencePoint(doc2, 69, 1, 69, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Blt"))
Typ = GetType(OpCodes).GetField("Blt").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 70, 1, 70, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 71, 1, 71, 100)
getOPCodeIL.Emit(OpCodes.Br, cont8)
getOPCodeIL.MarkLabel(fa8)
getOPCodeIL.Emit(OpCodes.Br, cont8)
getOPCodeIL.MarkLabel(cont8)
getOPCodeIL.MarkSequencePoint(doc2, 73, 1, 73, 100)
Dim typ11(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ11(UBound(typ11) + 1)
typ11(UBound(typ11)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "box")
Typ = GetType(System.String)
ReDim Preserve typ11(UBound(typ11) + 1)
typ11(UBound(typ11)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 74, 1, 74, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa9 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru9 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont9 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru9)
getOPCodeIL.Emit(OpCodes.Br, fa9)
getOPCodeIL.MarkLabel(tru9)
getOPCodeIL.MarkSequencePoint(doc2, 75, 1, 75, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Box"))
Typ = GetType(OpCodes).GetField("Box").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 76, 1, 76, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 77, 1, 77, 100)
getOPCodeIL.Emit(OpCodes.Br, cont9)
getOPCodeIL.MarkLabel(fa9)
getOPCodeIL.Emit(OpCodes.Br, cont9)
getOPCodeIL.MarkLabel(cont9)
getOPCodeIL.MarkSequencePoint(doc2, 79, 1, 79, 100)
Dim typ12(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "br")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 80, 1, 80, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa10 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru10 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont10 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru10)
getOPCodeIL.Emit(OpCodes.Br, fa10)
getOPCodeIL.MarkLabel(tru10)
getOPCodeIL.MarkSequencePoint(doc2, 81, 1, 81, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Br"))
Typ = GetType(OpCodes).GetField("Br").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 82, 1, 82, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 83, 1, 83, 100)
getOPCodeIL.Emit(OpCodes.Br, cont10)
getOPCodeIL.MarkLabel(fa10)
getOPCodeIL.Emit(OpCodes.Br, cont10)
getOPCodeIL.MarkLabel(cont10)
getOPCodeIL.MarkSequencePoint(doc2, 85, 1, 85, 100)
Dim typ13(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "break")
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 86, 1, 86, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa11 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru11 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont11 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru11)
getOPCodeIL.Emit(OpCodes.Br, fa11)
getOPCodeIL.MarkLabel(tru11)
getOPCodeIL.MarkSequencePoint(doc2, 87, 1, 87, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Break"))
Typ = GetType(OpCodes).GetField("Break").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 88, 1, 88, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 89, 1, 89, 100)
getOPCodeIL.Emit(OpCodes.Br, cont11)
getOPCodeIL.MarkLabel(fa11)
getOPCodeIL.Emit(OpCodes.Br, cont11)
getOPCodeIL.MarkLabel(cont11)
getOPCodeIL.MarkSequencePoint(doc2, 91, 1, 91, 100)
Dim typ14(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "brfalse")
Typ = GetType(System.String)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 92, 1, 92, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa12 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru12 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont12 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru12)
getOPCodeIL.Emit(OpCodes.Br, fa12)
getOPCodeIL.MarkLabel(tru12)
getOPCodeIL.MarkSequencePoint(doc2, 93, 1, 93, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Brfalse"))
Typ = GetType(OpCodes).GetField("Brfalse").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 94, 1, 94, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 95, 1, 95, 100)
getOPCodeIL.Emit(OpCodes.Br, cont12)
getOPCodeIL.MarkLabel(fa12)
getOPCodeIL.Emit(OpCodes.Br, cont12)
getOPCodeIL.MarkLabel(cont12)
getOPCodeIL.MarkSequencePoint(doc2, 97, 1, 97, 100)
Dim typ15(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "brtrue")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 98, 1, 98, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa13 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru13 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont13 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru13)
getOPCodeIL.Emit(OpCodes.Br, fa13)
getOPCodeIL.MarkLabel(tru13)
getOPCodeIL.MarkSequencePoint(doc2, 99, 1, 99, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Brtrue"))
Typ = GetType(OpCodes).GetField("Brtrue").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 100, 1, 100, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 101, 1, 101, 100)
getOPCodeIL.Emit(OpCodes.Br, cont13)
getOPCodeIL.MarkLabel(fa13)
getOPCodeIL.Emit(OpCodes.Br, cont13)
getOPCodeIL.MarkLabel(cont13)
getOPCodeIL.MarkSequencePoint(doc2, 103, 1, 103, 100)
Dim typ16(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ16(UBound(typ16) + 1)
typ16(UBound(typ16)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ16(UBound(typ16) + 1)
typ16(UBound(typ16)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 104, 1, 104, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa14 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru14 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont14 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru14)
getOPCodeIL.Emit(OpCodes.Br, fa14)
getOPCodeIL.MarkLabel(tru14)
getOPCodeIL.MarkSequencePoint(doc2, 105, 1, 105, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Call"))
Typ = GetType(OpCodes).GetField("Call").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 106, 1, 106, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 107, 1, 107, 100)
getOPCodeIL.Emit(OpCodes.Br, cont14)
getOPCodeIL.MarkLabel(fa14)
getOPCodeIL.Emit(OpCodes.Br, cont14)
getOPCodeIL.MarkLabel(cont14)
getOPCodeIL.MarkSequencePoint(doc2, 109, 1, 109, 100)
Dim typ17(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "callvirt")
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 110, 1, 110, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa15 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru15 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont15 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru15)
getOPCodeIL.Emit(OpCodes.Br, fa15)
getOPCodeIL.MarkLabel(tru15)
getOPCodeIL.MarkSequencePoint(doc2, 111, 1, 111, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Callvirt"))
Typ = GetType(OpCodes).GetField("Callvirt").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 112, 1, 112, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 113, 1, 113, 100)
getOPCodeIL.Emit(OpCodes.Br, cont15)
getOPCodeIL.MarkLabel(fa15)
getOPCodeIL.Emit(OpCodes.Br, cont15)
getOPCodeIL.MarkLabel(cont15)
getOPCodeIL.MarkSequencePoint(doc2, 115, 1, 115, 100)
Dim typ18(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "castclass")
Typ = GetType(System.String)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 116, 1, 116, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa16 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru16 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont16 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru16)
getOPCodeIL.Emit(OpCodes.Br, fa16)
getOPCodeIL.MarkLabel(tru16)
getOPCodeIL.MarkSequencePoint(doc2, 117, 1, 117, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Castclass"))
Typ = GetType(OpCodes).GetField("Castclass").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 118, 1, 118, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 119, 1, 119, 100)
getOPCodeIL.Emit(OpCodes.Br, cont16)
getOPCodeIL.MarkLabel(fa16)
getOPCodeIL.Emit(OpCodes.Br, cont16)
getOPCodeIL.MarkLabel(cont16)
getOPCodeIL.MarkSequencePoint(doc2, 121, 1, 121, 100)
Dim typ19(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 122, 1, 122, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa17 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru17 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont17 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru17)
getOPCodeIL.Emit(OpCodes.Br, fa17)
getOPCodeIL.MarkLabel(tru17)
getOPCodeIL.MarkSequencePoint(doc2, 123, 1, 123, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ceq"))
Typ = GetType(OpCodes).GetField("Ceq").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 124, 1, 124, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 125, 1, 125, 100)
getOPCodeIL.Emit(OpCodes.Br, cont17)
getOPCodeIL.MarkLabel(fa17)
getOPCodeIL.Emit(OpCodes.Br, cont17)
getOPCodeIL.MarkLabel(cont17)
getOPCodeIL.MarkSequencePoint(doc2, 127, 1, 127, 100)
Dim typ20(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "clt")
Typ = GetType(System.String)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 128, 1, 128, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa18 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru18 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont18 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru18)
getOPCodeIL.Emit(OpCodes.Br, fa18)
getOPCodeIL.MarkLabel(tru18)
getOPCodeIL.MarkSequencePoint(doc2, 129, 1, 129, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Clt"))
Typ = GetType(OpCodes).GetField("Clt").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 130, 1, 130, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 131, 1, 131, 100)
getOPCodeIL.Emit(OpCodes.Br, cont18)
getOPCodeIL.MarkLabel(fa18)
getOPCodeIL.Emit(OpCodes.Br, cont18)
getOPCodeIL.MarkLabel(cont18)
getOPCodeIL.MarkSequencePoint(doc2, 133, 1, 133, 100)
Dim typ21(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "cgt")
Typ = GetType(System.String)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 134, 1, 134, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa19 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru19 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont19 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru19)
getOPCodeIL.Emit(OpCodes.Br, fa19)
getOPCodeIL.MarkLabel(tru19)
getOPCodeIL.MarkSequencePoint(doc2, 135, 1, 135, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Cgt"))
Typ = GetType(OpCodes).GetField("Cgt").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 136, 1, 136, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 137, 1, 137, 100)
getOPCodeIL.Emit(OpCodes.Br, cont19)
getOPCodeIL.MarkLabel(fa19)
getOPCodeIL.Emit(OpCodes.Br, cont19)
getOPCodeIL.MarkLabel(cont19)
getOPCodeIL.MarkSequencePoint(doc2, 139, 1, 139, 100)
Dim typ22(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "constrained.")
Typ = GetType(System.String)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 140, 1, 140, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa20 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru20 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont20 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru20)
getOPCodeIL.Emit(OpCodes.Br, fa20)
getOPCodeIL.MarkLabel(tru20)
getOPCodeIL.MarkSequencePoint(doc2, 141, 1, 141, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Constrained"))
Typ = GetType(OpCodes).GetField("Constrained").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 142, 1, 142, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 143, 1, 143, 100)
getOPCodeIL.Emit(OpCodes.Br, cont20)
getOPCodeIL.MarkLabel(fa20)
getOPCodeIL.Emit(OpCodes.Br, cont20)
getOPCodeIL.MarkLabel(cont20)
getOPCodeIL.MarkSequencePoint(doc2, 145, 1, 145, 100)
Dim typ23(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.i")
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 146, 1, 146, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa21 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru21 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont21 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru21)
getOPCodeIL.Emit(OpCodes.Br, fa21)
getOPCodeIL.MarkLabel(tru21)
getOPCodeIL.MarkSequencePoint(doc2, 147, 1, 147, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_I"))
Typ = GetType(OpCodes).GetField("Conv_I").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 148, 1, 148, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 149, 1, 149, 100)
getOPCodeIL.Emit(OpCodes.Br, cont21)
getOPCodeIL.MarkLabel(fa21)
getOPCodeIL.Emit(OpCodes.Br, cont21)
getOPCodeIL.MarkLabel(cont21)
getOPCodeIL.MarkSequencePoint(doc2, 151, 1, 151, 100)
Dim typ24(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 152, 1, 152, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa22 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru22 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont22 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru22)
getOPCodeIL.Emit(OpCodes.Br, fa22)
getOPCodeIL.MarkLabel(tru22)
getOPCodeIL.MarkSequencePoint(doc2, 153, 1, 153, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_I1"))
Typ = GetType(OpCodes).GetField("Conv_I1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 154, 1, 154, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 155, 1, 155, 100)
getOPCodeIL.Emit(OpCodes.Br, cont22)
getOPCodeIL.MarkLabel(fa22)
getOPCodeIL.Emit(OpCodes.Br, cont22)
getOPCodeIL.MarkLabel(cont22)
getOPCodeIL.MarkSequencePoint(doc2, 157, 1, 157, 100)
Dim typ25(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 158, 1, 158, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa23 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru23 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont23 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru23)
getOPCodeIL.Emit(OpCodes.Br, fa23)
getOPCodeIL.MarkLabel(tru23)
getOPCodeIL.MarkSequencePoint(doc2, 159, 1, 159, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_I2"))
Typ = GetType(OpCodes).GetField("Conv_I2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 160, 1, 160, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 161, 1, 161, 100)
getOPCodeIL.Emit(OpCodes.Br, cont23)
getOPCodeIL.MarkLabel(fa23)
getOPCodeIL.Emit(OpCodes.Br, cont23)
getOPCodeIL.MarkLabel(cont23)
getOPCodeIL.MarkSequencePoint(doc2, 163, 1, 163, 100)
Dim typ26(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.i4")
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 164, 1, 164, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa24 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru24 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont24 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru24)
getOPCodeIL.Emit(OpCodes.Br, fa24)
getOPCodeIL.MarkLabel(tru24)
getOPCodeIL.MarkSequencePoint(doc2, 165, 1, 165, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_I4"))
Typ = GetType(OpCodes).GetField("Conv_I4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 166, 1, 166, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 167, 1, 167, 100)
getOPCodeIL.Emit(OpCodes.Br, cont24)
getOPCodeIL.MarkLabel(fa24)
getOPCodeIL.Emit(OpCodes.Br, cont24)
getOPCodeIL.MarkLabel(cont24)
getOPCodeIL.MarkSequencePoint(doc2, 169, 1, 169, 100)
Dim typ27(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 170, 1, 170, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa25 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru25 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont25 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru25)
getOPCodeIL.Emit(OpCodes.Br, fa25)
getOPCodeIL.MarkLabel(tru25)
getOPCodeIL.MarkSequencePoint(doc2, 171, 1, 171, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_I8"))
Typ = GetType(OpCodes).GetField("Conv_I8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 172, 1, 172, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 173, 1, 173, 100)
getOPCodeIL.Emit(OpCodes.Br, cont25)
getOPCodeIL.MarkLabel(fa25)
getOPCodeIL.Emit(OpCodes.Br, cont25)
getOPCodeIL.MarkLabel(cont25)
getOPCodeIL.MarkSequencePoint(doc2, 175, 1, 175, 100)
Dim typ28(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.u")
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 176, 1, 176, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa26 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru26 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont26 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru26)
getOPCodeIL.Emit(OpCodes.Br, fa26)
getOPCodeIL.MarkLabel(tru26)
getOPCodeIL.MarkSequencePoint(doc2, 177, 1, 177, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_U"))
Typ = GetType(OpCodes).GetField("Conv_U").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 178, 1, 178, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 179, 1, 179, 100)
getOPCodeIL.Emit(OpCodes.Br, cont26)
getOPCodeIL.MarkLabel(fa26)
getOPCodeIL.Emit(OpCodes.Br, cont26)
getOPCodeIL.MarkLabel(cont26)
getOPCodeIL.MarkSequencePoint(doc2, 181, 1, 181, 100)
Dim typ29(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.u1")
Typ = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 182, 1, 182, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa27 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru27 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont27 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru27)
getOPCodeIL.Emit(OpCodes.Br, fa27)
getOPCodeIL.MarkLabel(tru27)
getOPCodeIL.MarkSequencePoint(doc2, 183, 1, 183, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_U1"))
Typ = GetType(OpCodes).GetField("Conv_U1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 184, 1, 184, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 185, 1, 185, 100)
getOPCodeIL.Emit(OpCodes.Br, cont27)
getOPCodeIL.MarkLabel(fa27)
getOPCodeIL.Emit(OpCodes.Br, cont27)
getOPCodeIL.MarkLabel(cont27)
getOPCodeIL.MarkSequencePoint(doc2, 187, 1, 187, 100)
Dim typ30(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.u2")
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 188, 1, 188, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa28 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru28 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont28 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru28)
getOPCodeIL.Emit(OpCodes.Br, fa28)
getOPCodeIL.MarkLabel(tru28)
getOPCodeIL.MarkSequencePoint(doc2, 189, 1, 189, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_U2"))
Typ = GetType(OpCodes).GetField("Conv_U2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 190, 1, 190, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 191, 1, 191, 100)
getOPCodeIL.Emit(OpCodes.Br, cont28)
getOPCodeIL.MarkLabel(fa28)
getOPCodeIL.Emit(OpCodes.Br, cont28)
getOPCodeIL.MarkLabel(cont28)
getOPCodeIL.MarkSequencePoint(doc2, 193, 1, 193, 100)
Dim typ31(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.u4")
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 194, 1, 194, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa29 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru29 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont29 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru29)
getOPCodeIL.Emit(OpCodes.Br, fa29)
getOPCodeIL.MarkLabel(tru29)
getOPCodeIL.MarkSequencePoint(doc2, 195, 1, 195, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_U4"))
Typ = GetType(OpCodes).GetField("Conv_U4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 196, 1, 196, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 197, 1, 197, 100)
getOPCodeIL.Emit(OpCodes.Br, cont29)
getOPCodeIL.MarkLabel(fa29)
getOPCodeIL.Emit(OpCodes.Br, cont29)
getOPCodeIL.MarkLabel(cont29)
getOPCodeIL.MarkSequencePoint(doc2, 199, 1, 199, 100)
Dim typ32(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.u8")
Typ = GetType(System.String)
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 200, 1, 200, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa30 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru30 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont30 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru30)
getOPCodeIL.Emit(OpCodes.Br, fa30)
getOPCodeIL.MarkLabel(tru30)
getOPCodeIL.MarkSequencePoint(doc2, 201, 1, 201, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_U8"))
Typ = GetType(OpCodes).GetField("Conv_U8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 202, 1, 202, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 203, 1, 203, 100)
getOPCodeIL.Emit(OpCodes.Br, cont30)
getOPCodeIL.MarkLabel(fa30)
getOPCodeIL.Emit(OpCodes.Br, cont30)
getOPCodeIL.MarkLabel(cont30)
getOPCodeIL.MarkSequencePoint(doc2, 205, 1, 205, 100)
Dim typ33(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.i")
Typ = GetType(System.String)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 206, 1, 206, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa31 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru31 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont31 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru31)
getOPCodeIL.Emit(OpCodes.Br, fa31)
getOPCodeIL.MarkLabel(tru31)
getOPCodeIL.MarkSequencePoint(doc2, 207, 1, 207, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_I"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_I").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 208, 1, 208, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 209, 1, 209, 100)
getOPCodeIL.Emit(OpCodes.Br, cont31)
getOPCodeIL.MarkLabel(fa31)
getOPCodeIL.Emit(OpCodes.Br, cont31)
getOPCodeIL.MarkLabel(cont31)
getOPCodeIL.MarkSequencePoint(doc2, 211, 1, 211, 100)
Dim typ34(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.i1")
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 212, 1, 212, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa32 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru32 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont32 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru32)
getOPCodeIL.Emit(OpCodes.Br, fa32)
getOPCodeIL.MarkLabel(tru32)
getOPCodeIL.MarkSequencePoint(doc2, 213, 1, 213, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_I1"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_I1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 214, 1, 214, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 215, 1, 215, 100)
getOPCodeIL.Emit(OpCodes.Br, cont32)
getOPCodeIL.MarkLabel(fa32)
getOPCodeIL.Emit(OpCodes.Br, cont32)
getOPCodeIL.MarkLabel(cont32)
getOPCodeIL.MarkSequencePoint(doc2, 217, 1, 217, 100)
Dim typ35(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.i2")
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 218, 1, 218, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa33 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru33 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont33 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru33)
getOPCodeIL.Emit(OpCodes.Br, fa33)
getOPCodeIL.MarkLabel(tru33)
getOPCodeIL.MarkSequencePoint(doc2, 219, 1, 219, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_I2"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_I2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 220, 1, 220, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 221, 1, 221, 100)
getOPCodeIL.Emit(OpCodes.Br, cont33)
getOPCodeIL.MarkLabel(fa33)
getOPCodeIL.Emit(OpCodes.Br, cont33)
getOPCodeIL.MarkLabel(cont33)
getOPCodeIL.MarkSequencePoint(doc2, 223, 1, 223, 100)
Dim typ36(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.i4")
Typ = GetType(System.String)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 224, 1, 224, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa34 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru34 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont34 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru34)
getOPCodeIL.Emit(OpCodes.Br, fa34)
getOPCodeIL.MarkLabel(tru34)
getOPCodeIL.MarkSequencePoint(doc2, 225, 1, 225, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_I4"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_I4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 226, 1, 226, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 227, 1, 227, 100)
getOPCodeIL.Emit(OpCodes.Br, cont34)
getOPCodeIL.MarkLabel(fa34)
getOPCodeIL.Emit(OpCodes.Br, cont34)
getOPCodeIL.MarkLabel(cont34)
getOPCodeIL.MarkSequencePoint(doc2, 229, 1, 229, 100)
Dim typ37(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.i8")
Typ = GetType(System.String)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 230, 1, 230, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa35 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru35 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont35 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru35)
getOPCodeIL.Emit(OpCodes.Br, fa35)
getOPCodeIL.MarkLabel(tru35)
getOPCodeIL.MarkSequencePoint(doc2, 231, 1, 231, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_I8"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_I8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 232, 1, 232, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 233, 1, 233, 100)
getOPCodeIL.Emit(OpCodes.Br, cont35)
getOPCodeIL.MarkLabel(fa35)
getOPCodeIL.Emit(OpCodes.Br, cont35)
getOPCodeIL.MarkLabel(cont35)
getOPCodeIL.MarkSequencePoint(doc2, 235, 1, 235, 100)
Dim typ38(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.u")
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 236, 1, 236, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa36 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru36 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont36 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru36)
getOPCodeIL.Emit(OpCodes.Br, fa36)
getOPCodeIL.MarkLabel(tru36)
getOPCodeIL.MarkSequencePoint(doc2, 237, 1, 237, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_U"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_U").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 238, 1, 238, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 239, 1, 239, 100)
getOPCodeIL.Emit(OpCodes.Br, cont36)
getOPCodeIL.MarkLabel(fa36)
getOPCodeIL.Emit(OpCodes.Br, cont36)
getOPCodeIL.MarkLabel(cont36)
getOPCodeIL.MarkSequencePoint(doc2, 241, 1, 241, 100)
Dim typ39(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.u1")
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 242, 1, 242, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa37 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru37 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont37 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru37)
getOPCodeIL.Emit(OpCodes.Br, fa37)
getOPCodeIL.MarkLabel(tru37)
getOPCodeIL.MarkSequencePoint(doc2, 243, 1, 243, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_U1"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_U1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 244, 1, 244, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 245, 1, 245, 100)
getOPCodeIL.Emit(OpCodes.Br, cont37)
getOPCodeIL.MarkLabel(fa37)
getOPCodeIL.Emit(OpCodes.Br, cont37)
getOPCodeIL.MarkLabel(cont37)
getOPCodeIL.MarkSequencePoint(doc2, 247, 1, 247, 100)
Dim typ40(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.u2")
Typ = GetType(System.String)
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 248, 1, 248, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa38 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru38 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont38 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru38)
getOPCodeIL.Emit(OpCodes.Br, fa38)
getOPCodeIL.MarkLabel(tru38)
getOPCodeIL.MarkSequencePoint(doc2, 249, 1, 249, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_U2"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_U2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 250, 1, 250, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 251, 1, 251, 100)
getOPCodeIL.Emit(OpCodes.Br, cont38)
getOPCodeIL.MarkLabel(fa38)
getOPCodeIL.Emit(OpCodes.Br, cont38)
getOPCodeIL.MarkLabel(cont38)
getOPCodeIL.MarkSequencePoint(doc2, 253, 1, 253, 100)
Dim typ41(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.u4")
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 254, 1, 254, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa39 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru39 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont39 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru39)
getOPCodeIL.Emit(OpCodes.Br, fa39)
getOPCodeIL.MarkLabel(tru39)
getOPCodeIL.MarkSequencePoint(doc2, 255, 1, 255, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_U4"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_U4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 256, 1, 256, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 257, 1, 257, 100)
getOPCodeIL.Emit(OpCodes.Br, cont39)
getOPCodeIL.MarkLabel(fa39)
getOPCodeIL.Emit(OpCodes.Br, cont39)
getOPCodeIL.MarkLabel(cont39)
getOPCodeIL.MarkSequencePoint(doc2, 259, 1, 259, 100)
Dim typ42(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.ovf.u8")
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 260, 1, 260, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa40 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru40 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont40 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru40)
getOPCodeIL.Emit(OpCodes.Br, fa40)
getOPCodeIL.MarkLabel(tru40)
getOPCodeIL.MarkSequencePoint(doc2, 261, 1, 261, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_Ovf_U8"))
Typ = GetType(OpCodes).GetField("Conv_Ovf_U8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 262, 1, 262, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 263, 1, 263, 100)
getOPCodeIL.Emit(OpCodes.Br, cont40)
getOPCodeIL.MarkLabel(fa40)
getOPCodeIL.Emit(OpCodes.Br, cont40)
getOPCodeIL.MarkLabel(cont40)
getOPCodeIL.MarkSequencePoint(doc2, 264, 1, 264, 100)
Dim typ43(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.r4")
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 265, 1, 265, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa41 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru41 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont41 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru41)
getOPCodeIL.Emit(OpCodes.Br, fa41)
getOPCodeIL.MarkLabel(tru41)
getOPCodeIL.MarkSequencePoint(doc2, 266, 1, 266, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_R4"))
Typ = GetType(OpCodes).GetField("Conv_R4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 267, 1, 267, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 268, 1, 268, 100)
getOPCodeIL.Emit(OpCodes.Br, cont41)
getOPCodeIL.MarkLabel(fa41)
getOPCodeIL.Emit(OpCodes.Br, cont41)
getOPCodeIL.MarkLabel(cont41)
getOPCodeIL.MarkSequencePoint(doc2, 270, 1, 270, 100)
Dim typ44(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "conv.r8")
Typ = GetType(System.String)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 271, 1, 271, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa42 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru42 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont42 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru42)
getOPCodeIL.Emit(OpCodes.Br, fa42)
getOPCodeIL.MarkLabel(tru42)
getOPCodeIL.MarkSequencePoint(doc2, 272, 1, 272, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Conv_R8"))
Typ = GetType(OpCodes).GetField("Conv_R8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 273, 1, 273, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 274, 1, 274, 100)
getOPCodeIL.Emit(OpCodes.Br, cont42)
getOPCodeIL.MarkLabel(fa42)
getOPCodeIL.Emit(OpCodes.Br, cont42)
getOPCodeIL.MarkLabel(cont42)
getOPCodeIL.MarkSequencePoint(doc2, 276, 1, 276, 100)
Dim typ45(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "div")
Typ = GetType(System.String)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 277, 1, 277, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa43 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru43 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont43 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru43)
getOPCodeIL.Emit(OpCodes.Br, fa43)
getOPCodeIL.MarkLabel(tru43)
getOPCodeIL.MarkSequencePoint(doc2, 278, 1, 278, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Div"))
Typ = GetType(OpCodes).GetField("Div").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 279, 1, 279, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 280, 1, 280, 100)
getOPCodeIL.Emit(OpCodes.Br, cont43)
getOPCodeIL.MarkLabel(fa43)
getOPCodeIL.Emit(OpCodes.Br, cont43)
getOPCodeIL.MarkLabel(cont43)
getOPCodeIL.MarkSequencePoint(doc2, 282, 1, 282, 100)
Dim typ46(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "dup")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 283, 1, 283, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa44 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru44 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont44 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru44)
getOPCodeIL.Emit(OpCodes.Br, fa44)
getOPCodeIL.MarkLabel(tru44)
getOPCodeIL.MarkSequencePoint(doc2, 284, 1, 284, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Dup"))
Typ = GetType(OpCodes).GetField("Dup").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 285, 1, 285, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 286, 1, 286, 100)
getOPCodeIL.Emit(OpCodes.Br, cont44)
getOPCodeIL.MarkLabel(fa44)
getOPCodeIL.Emit(OpCodes.Br, cont44)
getOPCodeIL.MarkLabel(cont44)
getOPCodeIL.MarkSequencePoint(doc2, 288, 1, 288, 100)
Dim typ47(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "isinst")
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 289, 1, 289, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa45 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru45 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont45 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru45)
getOPCodeIL.Emit(OpCodes.Br, fa45)
getOPCodeIL.MarkLabel(tru45)
getOPCodeIL.MarkSequencePoint(doc2, 290, 1, 290, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Isinst"))
Typ = GetType(OpCodes).GetField("Isinst").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 291, 1, 291, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 292, 1, 292, 100)
getOPCodeIL.Emit(OpCodes.Br, cont45)
getOPCodeIL.MarkLabel(fa45)
getOPCodeIL.Emit(OpCodes.Br, cont45)
getOPCodeIL.MarkLabel(cont45)
getOPCodeIL.MarkSequencePoint(doc2, 294, 1, 294, 100)
Dim typ48(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarg")
Typ = GetType(System.String)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 295, 1, 295, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa46 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru46 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont46 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru46)
getOPCodeIL.Emit(OpCodes.Br, fa46)
getOPCodeIL.MarkLabel(tru46)
getOPCodeIL.MarkSequencePoint(doc2, 296, 1, 296, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarg"))
Typ = GetType(OpCodes).GetField("Ldarg").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 297, 1, 297, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 298, 1, 298, 100)
getOPCodeIL.Emit(OpCodes.Br, cont46)
getOPCodeIL.MarkLabel(fa46)
getOPCodeIL.Emit(OpCodes.Br, cont46)
getOPCodeIL.MarkLabel(cont46)
getOPCodeIL.MarkSequencePoint(doc2, 300, 1, 300, 100)
Dim typ49(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarga")
Typ = GetType(System.String)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 301, 1, 301, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa47 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru47 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont47 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru47)
getOPCodeIL.Emit(OpCodes.Br, fa47)
getOPCodeIL.MarkLabel(tru47)
getOPCodeIL.MarkSequencePoint(doc2, 302, 1, 302, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarga"))
Typ = GetType(OpCodes).GetField("Ldarga").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 303, 1, 303, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 304, 1, 304, 100)
getOPCodeIL.Emit(OpCodes.Br, cont47)
getOPCodeIL.MarkLabel(fa47)
getOPCodeIL.Emit(OpCodes.Br, cont47)
getOPCodeIL.MarkLabel(cont47)
getOPCodeIL.MarkSequencePoint(doc2, 306, 1, 306, 100)
Dim typ50(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarg.s")
Typ = GetType(System.String)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 307, 1, 307, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa48 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru48 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont48 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru48)
getOPCodeIL.Emit(OpCodes.Br, fa48)
getOPCodeIL.MarkLabel(tru48)
getOPCodeIL.MarkSequencePoint(doc2, 308, 1, 308, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarg_S"))
Typ = GetType(OpCodes).GetField("Ldarg_S").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 309, 1, 309, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 310, 1, 310, 100)
getOPCodeIL.Emit(OpCodes.Br, cont48)
getOPCodeIL.MarkLabel(fa48)
getOPCodeIL.Emit(OpCodes.Br, cont48)
getOPCodeIL.MarkLabel(cont48)
getOPCodeIL.MarkSequencePoint(doc2, 312, 1, 312, 100)
Dim typ51(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarga.s")
Typ = GetType(System.String)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 313, 1, 313, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa49 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru49 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont49 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru49)
getOPCodeIL.Emit(OpCodes.Br, fa49)
getOPCodeIL.MarkLabel(tru49)
getOPCodeIL.MarkSequencePoint(doc2, 314, 1, 314, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarga_S"))
Typ = GetType(OpCodes).GetField("Ldarga_S").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 315, 1, 315, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 316, 1, 316, 100)
getOPCodeIL.Emit(OpCodes.Br, cont49)
getOPCodeIL.MarkLabel(fa49)
getOPCodeIL.Emit(OpCodes.Br, cont49)
getOPCodeIL.MarkLabel(cont49)
getOPCodeIL.MarkSequencePoint(doc2, 318, 1, 318, 100)
Dim typ52(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarg.0")
Typ = GetType(System.String)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 319, 1, 319, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa50 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru50 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont50 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru50)
getOPCodeIL.Emit(OpCodes.Br, fa50)
getOPCodeIL.MarkLabel(tru50)
getOPCodeIL.MarkSequencePoint(doc2, 320, 1, 320, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarg_0"))
Typ = GetType(OpCodes).GetField("Ldarg_0").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 321, 1, 321, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 322, 1, 322, 100)
getOPCodeIL.Emit(OpCodes.Br, cont50)
getOPCodeIL.MarkLabel(fa50)
getOPCodeIL.Emit(OpCodes.Br, cont50)
getOPCodeIL.MarkLabel(cont50)
getOPCodeIL.MarkSequencePoint(doc2, 324, 1, 324, 100)
Dim typ53(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarg.1")
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 325, 1, 325, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa51 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru51 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont51 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru51)
getOPCodeIL.Emit(OpCodes.Br, fa51)
getOPCodeIL.MarkLabel(tru51)
getOPCodeIL.MarkSequencePoint(doc2, 326, 1, 326, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarg_1"))
Typ = GetType(OpCodes).GetField("Ldarg_1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 327, 1, 327, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 328, 1, 328, 100)
getOPCodeIL.Emit(OpCodes.Br, cont51)
getOPCodeIL.MarkLabel(fa51)
getOPCodeIL.Emit(OpCodes.Br, cont51)
getOPCodeIL.MarkLabel(cont51)
getOPCodeIL.MarkSequencePoint(doc2, 330, 1, 330, 100)
Dim typ54(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarg.2")
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 331, 1, 331, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa52 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru52 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont52 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru52)
getOPCodeIL.Emit(OpCodes.Br, fa52)
getOPCodeIL.MarkLabel(tru52)
getOPCodeIL.MarkSequencePoint(doc2, 332, 1, 332, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarg_2"))
Typ = GetType(OpCodes).GetField("Ldarg_2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 333, 1, 333, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 334, 1, 334, 100)
getOPCodeIL.Emit(OpCodes.Br, cont52)
getOPCodeIL.MarkLabel(fa52)
getOPCodeIL.Emit(OpCodes.Br, cont52)
getOPCodeIL.MarkLabel(cont52)
getOPCodeIL.MarkSequencePoint(doc2, 336, 1, 336, 100)
Dim typ55(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldarg.3")
Typ = GetType(System.String)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 337, 1, 337, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa53 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru53 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont53 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru53)
getOPCodeIL.Emit(OpCodes.Br, fa53)
getOPCodeIL.MarkLabel(tru53)
getOPCodeIL.MarkSequencePoint(doc2, 338, 1, 338, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldarg_3"))
Typ = GetType(OpCodes).GetField("Ldarg_3").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 339, 1, 339, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 340, 1, 340, 100)
getOPCodeIL.Emit(OpCodes.Br, cont53)
getOPCodeIL.MarkLabel(fa53)
getOPCodeIL.Emit(OpCodes.Br, cont53)
getOPCodeIL.MarkLabel(cont53)
getOPCodeIL.MarkSequencePoint(doc2, 342, 1, 342, 100)
Dim typ56(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 343, 1, 343, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa54 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru54 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont54 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru54)
getOPCodeIL.Emit(OpCodes.Br, fa54)
getOPCodeIL.MarkLabel(tru54)
getOPCodeIL.MarkSequencePoint(doc2, 344, 1, 344, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4"))
Typ = GetType(OpCodes).GetField("Ldc_I4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 345, 1, 345, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 346, 1, 346, 100)
getOPCodeIL.Emit(OpCodes.Br, cont54)
getOPCodeIL.MarkLabel(fa54)
getOPCodeIL.Emit(OpCodes.Br, cont54)
getOPCodeIL.MarkLabel(cont54)
getOPCodeIL.MarkSequencePoint(doc2, 348, 1, 348, 100)
Dim typ57(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ57(UBound(typ57) + 1)
typ57(UBound(typ57)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ57(UBound(typ57) + 1)
typ57(UBound(typ57)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 349, 1, 349, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa55 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru55 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont55 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru55)
getOPCodeIL.Emit(OpCodes.Br, fa55)
getOPCodeIL.MarkLabel(tru55)
getOPCodeIL.MarkSequencePoint(doc2, 350, 1, 350, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_0"))
Typ = GetType(OpCodes).GetField("Ldc_I4_0").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 351, 1, 351, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 352, 1, 352, 100)
getOPCodeIL.Emit(OpCodes.Br, cont55)
getOPCodeIL.MarkLabel(fa55)
getOPCodeIL.Emit(OpCodes.Br, cont55)
getOPCodeIL.MarkLabel(cont55)
getOPCodeIL.MarkSequencePoint(doc2, 354, 1, 354, 100)
Dim typ58(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 355, 1, 355, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa56 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru56 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont56 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru56)
getOPCodeIL.Emit(OpCodes.Br, fa56)
getOPCodeIL.MarkLabel(tru56)
getOPCodeIL.MarkSequencePoint(doc2, 356, 1, 356, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_1"))
Typ = GetType(OpCodes).GetField("Ldc_I4_1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 357, 1, 357, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 358, 1, 358, 100)
getOPCodeIL.Emit(OpCodes.Br, cont56)
getOPCodeIL.MarkLabel(fa56)
getOPCodeIL.Emit(OpCodes.Br, cont56)
getOPCodeIL.MarkLabel(cont56)
getOPCodeIL.MarkSequencePoint(doc2, 360, 1, 360, 100)
Dim typ59(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 361, 1, 361, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa57 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru57 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont57 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru57)
getOPCodeIL.Emit(OpCodes.Br, fa57)
getOPCodeIL.MarkLabel(tru57)
getOPCodeIL.MarkSequencePoint(doc2, 362, 1, 362, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_2"))
Typ = GetType(OpCodes).GetField("Ldc_I4_2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 363, 1, 363, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 364, 1, 364, 100)
getOPCodeIL.Emit(OpCodes.Br, cont57)
getOPCodeIL.MarkLabel(fa57)
getOPCodeIL.Emit(OpCodes.Br, cont57)
getOPCodeIL.MarkLabel(cont57)
getOPCodeIL.MarkSequencePoint(doc2, 366, 1, 366, 100)
Dim typ60(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ60(UBound(typ60) + 1)
typ60(UBound(typ60)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ60(UBound(typ60) + 1)
typ60(UBound(typ60)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 367, 1, 367, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa58 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru58 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont58 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru58)
getOPCodeIL.Emit(OpCodes.Br, fa58)
getOPCodeIL.MarkLabel(tru58)
getOPCodeIL.MarkSequencePoint(doc2, 368, 1, 368, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_3"))
Typ = GetType(OpCodes).GetField("Ldc_I4_3").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 369, 1, 369, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 370, 1, 370, 100)
getOPCodeIL.Emit(OpCodes.Br, cont58)
getOPCodeIL.MarkLabel(fa58)
getOPCodeIL.Emit(OpCodes.Br, cont58)
getOPCodeIL.MarkLabel(cont58)
getOPCodeIL.MarkSequencePoint(doc2, 372, 1, 372, 100)
Dim typ61(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 373, 1, 373, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa59 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru59 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont59 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru59)
getOPCodeIL.Emit(OpCodes.Br, fa59)
getOPCodeIL.MarkLabel(tru59)
getOPCodeIL.MarkSequencePoint(doc2, 374, 1, 374, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_4"))
Typ = GetType(OpCodes).GetField("Ldc_I4_4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 375, 1, 375, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 376, 1, 376, 100)
getOPCodeIL.Emit(OpCodes.Br, cont59)
getOPCodeIL.MarkLabel(fa59)
getOPCodeIL.Emit(OpCodes.Br, cont59)
getOPCodeIL.MarkLabel(cont59)
getOPCodeIL.MarkSequencePoint(doc2, 378, 1, 378, 100)
Dim typ62(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 379, 1, 379, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa60 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru60 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont60 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru60)
getOPCodeIL.Emit(OpCodes.Br, fa60)
getOPCodeIL.MarkLabel(tru60)
getOPCodeIL.MarkSequencePoint(doc2, 380, 1, 380, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_5"))
Typ = GetType(OpCodes).GetField("Ldc_I4_5").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 381, 1, 381, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 382, 1, 382, 100)
getOPCodeIL.Emit(OpCodes.Br, cont60)
getOPCodeIL.MarkLabel(fa60)
getOPCodeIL.Emit(OpCodes.Br, cont60)
getOPCodeIL.MarkLabel(cont60)
getOPCodeIL.MarkSequencePoint(doc2, 384, 1, 384, 100)
Dim typ63(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 385, 1, 385, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa61 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru61 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont61 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru61)
getOPCodeIL.Emit(OpCodes.Br, fa61)
getOPCodeIL.MarkLabel(tru61)
getOPCodeIL.MarkSequencePoint(doc2, 386, 1, 386, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_6"))
Typ = GetType(OpCodes).GetField("Ldc_I4_6").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 387, 1, 387, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 388, 1, 388, 100)
getOPCodeIL.Emit(OpCodes.Br, cont61)
getOPCodeIL.MarkLabel(fa61)
getOPCodeIL.Emit(OpCodes.Br, cont61)
getOPCodeIL.MarkLabel(cont61)
getOPCodeIL.MarkSequencePoint(doc2, 390, 1, 390, 100)
Dim typ64(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ64(UBound(typ64) + 1)
typ64(UBound(typ64)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ64(UBound(typ64) + 1)
typ64(UBound(typ64)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 391, 1, 391, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa62 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru62 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont62 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru62)
getOPCodeIL.Emit(OpCodes.Br, fa62)
getOPCodeIL.MarkLabel(tru62)
getOPCodeIL.MarkSequencePoint(doc2, 392, 1, 392, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_7"))
Typ = GetType(OpCodes).GetField("Ldc_I4_7").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 393, 1, 393, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 394, 1, 394, 100)
getOPCodeIL.Emit(OpCodes.Br, cont62)
getOPCodeIL.MarkLabel(fa62)
getOPCodeIL.Emit(OpCodes.Br, cont62)
getOPCodeIL.MarkLabel(cont62)
getOPCodeIL.MarkSequencePoint(doc2, 396, 1, 396, 100)
Dim typ65(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ65(UBound(typ65) + 1)
typ65(UBound(typ65)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ65(UBound(typ65) + 1)
typ65(UBound(typ65)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 397, 1, 397, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa63 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru63 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont63 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru63)
getOPCodeIL.Emit(OpCodes.Br, fa63)
getOPCodeIL.MarkLabel(tru63)
getOPCodeIL.MarkSequencePoint(doc2, 398, 1, 398, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_8"))
Typ = GetType(OpCodes).GetField("Ldc_I4_8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 399, 1, 399, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 400, 1, 400, 100)
getOPCodeIL.Emit(OpCodes.Br, cont63)
getOPCodeIL.MarkLabel(fa63)
getOPCodeIL.Emit(OpCodes.Br, cont63)
getOPCodeIL.MarkLabel(cont63)
getOPCodeIL.MarkSequencePoint(doc2, 402, 1, 402, 100)
Dim typ66(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 403, 1, 403, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa64 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru64 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont64 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru64)
getOPCodeIL.Emit(OpCodes.Br, fa64)
getOPCodeIL.MarkLabel(tru64)
getOPCodeIL.MarkSequencePoint(doc2, 404, 1, 404, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_M1"))
Typ = GetType(OpCodes).GetField("Ldc_I4_M1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 405, 1, 405, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 406, 1, 406, 100)
getOPCodeIL.Emit(OpCodes.Br, cont64)
getOPCodeIL.MarkLabel(fa64)
getOPCodeIL.Emit(OpCodes.Br, cont64)
getOPCodeIL.MarkLabel(cont64)
getOPCodeIL.MarkSequencePoint(doc2, 408, 1, 408, 100)
Dim typ67(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i4.s")
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 409, 1, 409, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa65 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru65 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont65 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru65)
getOPCodeIL.Emit(OpCodes.Br, fa65)
getOPCodeIL.MarkLabel(tru65)
getOPCodeIL.MarkSequencePoint(doc2, 410, 1, 410, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I4_S"))
Typ = GetType(OpCodes).GetField("Ldc_I4_S").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 411, 1, 411, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 412, 1, 412, 100)
getOPCodeIL.Emit(OpCodes.Br, cont65)
getOPCodeIL.MarkLabel(fa65)
getOPCodeIL.Emit(OpCodes.Br, cont65)
getOPCodeIL.MarkLabel(cont65)
getOPCodeIL.MarkSequencePoint(doc2, 414, 1, 414, 100)
Dim typ68(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ68(UBound(typ68) + 1)
typ68(UBound(typ68)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.i8")
Typ = GetType(System.String)
ReDim Preserve typ68(UBound(typ68) + 1)
typ68(UBound(typ68)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 415, 1, 415, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa66 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru66 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont66 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru66)
getOPCodeIL.Emit(OpCodes.Br, fa66)
getOPCodeIL.MarkLabel(tru66)
getOPCodeIL.MarkSequencePoint(doc2, 416, 1, 416, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_I8"))
Typ = GetType(OpCodes).GetField("Ldc_I8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 417, 1, 417, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 418, 1, 418, 100)
getOPCodeIL.Emit(OpCodes.Br, cont66)
getOPCodeIL.MarkLabel(fa66)
getOPCodeIL.Emit(OpCodes.Br, cont66)
getOPCodeIL.MarkLabel(cont66)
getOPCodeIL.MarkSequencePoint(doc2, 420, 1, 420, 100)
Dim typ69(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ69(UBound(typ69) + 1)
typ69(UBound(typ69)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.r4")
Typ = GetType(System.String)
ReDim Preserve typ69(UBound(typ69) + 1)
typ69(UBound(typ69)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 421, 1, 421, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa67 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru67 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont67 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru67)
getOPCodeIL.Emit(OpCodes.Br, fa67)
getOPCodeIL.MarkLabel(tru67)
getOPCodeIL.MarkSequencePoint(doc2, 422, 1, 422, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_R4"))
Typ = GetType(OpCodes).GetField("Ldc_R4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 423, 1, 423, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 424, 1, 424, 100)
getOPCodeIL.Emit(OpCodes.Br, cont67)
getOPCodeIL.MarkLabel(fa67)
getOPCodeIL.Emit(OpCodes.Br, cont67)
getOPCodeIL.MarkLabel(cont67)
getOPCodeIL.MarkSequencePoint(doc2, 426, 1, 426, 100)
Dim typ70(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.r8")
Typ = GetType(System.String)
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 427, 1, 427, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa68 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru68 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont68 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru68)
getOPCodeIL.Emit(OpCodes.Br, fa68)
getOPCodeIL.MarkLabel(tru68)
getOPCodeIL.MarkSequencePoint(doc2, 428, 1, 428, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_R8"))
Typ = GetType(OpCodes).GetField("Ldc_R8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 429, 1, 429, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 430, 1, 430, 100)
getOPCodeIL.Emit(OpCodes.Br, cont68)
getOPCodeIL.MarkLabel(fa68)
getOPCodeIL.Emit(OpCodes.Br, cont68)
getOPCodeIL.MarkLabel(cont68)
getOPCodeIL.MarkSequencePoint(doc2, 432, 1, 432, 100)
Dim typ71(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldc.r8")
Typ = GetType(System.String)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 433, 1, 433, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa69 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru69 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont69 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru69)
getOPCodeIL.Emit(OpCodes.Br, fa69)
getOPCodeIL.MarkLabel(tru69)
getOPCodeIL.MarkSequencePoint(doc2, 434, 1, 434, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldc_R8"))
Typ = GetType(OpCodes).GetField("Ldc_R8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 435, 1, 435, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 436, 1, 436, 100)
getOPCodeIL.Emit(OpCodes.Br, cont69)
getOPCodeIL.MarkLabel(fa69)
getOPCodeIL.Emit(OpCodes.Br, cont69)
getOPCodeIL.MarkLabel(cont69)
getOPCodeIL.MarkSequencePoint(doc2, 438, 1, 438, 100)
Dim typ72(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ72(UBound(typ72) + 1)
typ72(UBound(typ72)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem")
Typ = GetType(System.String)
ReDim Preserve typ72(UBound(typ72) + 1)
typ72(UBound(typ72)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 439, 1, 439, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa70 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru70 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont70 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru70)
getOPCodeIL.Emit(OpCodes.Br, fa70)
getOPCodeIL.MarkLabel(tru70)
getOPCodeIL.MarkSequencePoint(doc2, 440, 1, 440, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem"))
Typ = GetType(OpCodes).GetField("Ldelem").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 441, 1, 441, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 442, 1, 442, 100)
getOPCodeIL.Emit(OpCodes.Br, cont70)
getOPCodeIL.MarkLabel(fa70)
getOPCodeIL.Emit(OpCodes.Br, cont70)
getOPCodeIL.MarkLabel(cont70)
getOPCodeIL.MarkSequencePoint(doc2, 444, 1, 444, 100)
Dim typ73(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.i")
Typ = GetType(System.String)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 445, 1, 445, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa71 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru71 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont71 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru71)
getOPCodeIL.Emit(OpCodes.Br, fa71)
getOPCodeIL.MarkLabel(tru71)
getOPCodeIL.MarkSequencePoint(doc2, 446, 1, 446, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_I"))
Typ = GetType(OpCodes).GetField("Ldelem_I").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 447, 1, 447, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 448, 1, 448, 100)
getOPCodeIL.Emit(OpCodes.Br, cont71)
getOPCodeIL.MarkLabel(fa71)
getOPCodeIL.Emit(OpCodes.Br, cont71)
getOPCodeIL.MarkLabel(cont71)
getOPCodeIL.MarkSequencePoint(doc2, 450, 1, 450, 100)
Dim typ74(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.i1")
Typ = GetType(System.String)
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 451, 1, 451, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa72 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru72 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont72 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru72)
getOPCodeIL.Emit(OpCodes.Br, fa72)
getOPCodeIL.MarkLabel(tru72)
getOPCodeIL.MarkSequencePoint(doc2, 452, 1, 452, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_I1"))
Typ = GetType(OpCodes).GetField("Ldelem_I1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 453, 1, 453, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 454, 1, 454, 100)
getOPCodeIL.Emit(OpCodes.Br, cont72)
getOPCodeIL.MarkLabel(fa72)
getOPCodeIL.Emit(OpCodes.Br, cont72)
getOPCodeIL.MarkLabel(cont72)
getOPCodeIL.MarkSequencePoint(doc2, 456, 1, 456, 100)
Dim typ75(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.i2")
Typ = GetType(System.String)
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 457, 1, 457, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa73 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru73 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont73 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru73)
getOPCodeIL.Emit(OpCodes.Br, fa73)
getOPCodeIL.MarkLabel(tru73)
getOPCodeIL.MarkSequencePoint(doc2, 458, 1, 458, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_I2"))
Typ = GetType(OpCodes).GetField("Ldelem_I2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 459, 1, 459, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 460, 1, 460, 100)
getOPCodeIL.Emit(OpCodes.Br, cont73)
getOPCodeIL.MarkLabel(fa73)
getOPCodeIL.Emit(OpCodes.Br, cont73)
getOPCodeIL.MarkLabel(cont73)
getOPCodeIL.MarkSequencePoint(doc2, 462, 1, 462, 100)
Dim typ76(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ76(UBound(typ76) + 1)
typ76(UBound(typ76)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.i4")
Typ = GetType(System.String)
ReDim Preserve typ76(UBound(typ76) + 1)
typ76(UBound(typ76)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 463, 1, 463, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa74 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru74 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont74 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru74)
getOPCodeIL.Emit(OpCodes.Br, fa74)
getOPCodeIL.MarkLabel(tru74)
getOPCodeIL.MarkSequencePoint(doc2, 464, 1, 464, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_I4"))
Typ = GetType(OpCodes).GetField("Ldelem_I4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 465, 1, 465, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 466, 1, 466, 100)
getOPCodeIL.Emit(OpCodes.Br, cont74)
getOPCodeIL.MarkLabel(fa74)
getOPCodeIL.Emit(OpCodes.Br, cont74)
getOPCodeIL.MarkLabel(cont74)
getOPCodeIL.MarkSequencePoint(doc2, 468, 1, 468, 100)
Dim typ77(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ77(UBound(typ77) + 1)
typ77(UBound(typ77)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.i8")
Typ = GetType(System.String)
ReDim Preserve typ77(UBound(typ77) + 1)
typ77(UBound(typ77)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 469, 1, 469, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa75 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru75 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont75 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru75)
getOPCodeIL.Emit(OpCodes.Br, fa75)
getOPCodeIL.MarkLabel(tru75)
getOPCodeIL.MarkSequencePoint(doc2, 470, 1, 470, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_I8"))
Typ = GetType(OpCodes).GetField("Ldelem_I8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 471, 1, 471, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 472, 1, 472, 100)
getOPCodeIL.Emit(OpCodes.Br, cont75)
getOPCodeIL.MarkLabel(fa75)
getOPCodeIL.Emit(OpCodes.Br, cont75)
getOPCodeIL.MarkLabel(cont75)
getOPCodeIL.MarkSequencePoint(doc2, 474, 1, 474, 100)
Dim typ78(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ78(UBound(typ78) + 1)
typ78(UBound(typ78)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.r4")
Typ = GetType(System.String)
ReDim Preserve typ78(UBound(typ78) + 1)
typ78(UBound(typ78)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 475, 1, 475, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa76 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru76 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont76 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru76)
getOPCodeIL.Emit(OpCodes.Br, fa76)
getOPCodeIL.MarkLabel(tru76)
getOPCodeIL.MarkSequencePoint(doc2, 476, 1, 476, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_R4"))
Typ = GetType(OpCodes).GetField("Ldelem_R4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 477, 1, 477, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 478, 1, 478, 100)
getOPCodeIL.Emit(OpCodes.Br, cont76)
getOPCodeIL.MarkLabel(fa76)
getOPCodeIL.Emit(OpCodes.Br, cont76)
getOPCodeIL.MarkLabel(cont76)
getOPCodeIL.MarkSequencePoint(doc2, 480, 1, 480, 100)
Dim typ79(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ79(UBound(typ79) + 1)
typ79(UBound(typ79)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.r8")
Typ = GetType(System.String)
ReDim Preserve typ79(UBound(typ79) + 1)
typ79(UBound(typ79)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 481, 1, 481, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa77 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru77 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont77 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru77)
getOPCodeIL.Emit(OpCodes.Br, fa77)
getOPCodeIL.MarkLabel(tru77)
getOPCodeIL.MarkSequencePoint(doc2, 482, 1, 482, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_R8"))
Typ = GetType(OpCodes).GetField("Ldelem_R8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 483, 1, 483, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 484, 1, 484, 100)
getOPCodeIL.Emit(OpCodes.Br, cont77)
getOPCodeIL.MarkLabel(fa77)
getOPCodeIL.Emit(OpCodes.Br, cont77)
getOPCodeIL.MarkLabel(cont77)
getOPCodeIL.MarkSequencePoint(doc2, 486, 1, 486, 100)
Dim typ80(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ80(UBound(typ80) + 1)
typ80(UBound(typ80)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.u1")
Typ = GetType(System.String)
ReDim Preserve typ80(UBound(typ80) + 1)
typ80(UBound(typ80)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 487, 1, 487, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa78 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru78 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont78 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru78)
getOPCodeIL.Emit(OpCodes.Br, fa78)
getOPCodeIL.MarkLabel(tru78)
getOPCodeIL.MarkSequencePoint(doc2, 488, 1, 488, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_U1"))
Typ = GetType(OpCodes).GetField("Ldelem_U1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 489, 1, 489, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 490, 1, 490, 100)
getOPCodeIL.Emit(OpCodes.Br, cont78)
getOPCodeIL.MarkLabel(fa78)
getOPCodeIL.Emit(OpCodes.Br, cont78)
getOPCodeIL.MarkLabel(cont78)
getOPCodeIL.MarkSequencePoint(doc2, 492, 1, 492, 100)
Dim typ81(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ81(UBound(typ81) + 1)
typ81(UBound(typ81)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.u2")
Typ = GetType(System.String)
ReDim Preserve typ81(UBound(typ81) + 1)
typ81(UBound(typ81)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 493, 1, 493, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa79 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru79 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont79 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru79)
getOPCodeIL.Emit(OpCodes.Br, fa79)
getOPCodeIL.MarkLabel(tru79)
getOPCodeIL.MarkSequencePoint(doc2, 494, 1, 494, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_U2"))
Typ = GetType(OpCodes).GetField("Ldelem_U2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 495, 1, 495, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 496, 1, 496, 100)
getOPCodeIL.Emit(OpCodes.Br, cont79)
getOPCodeIL.MarkLabel(fa79)
getOPCodeIL.Emit(OpCodes.Br, cont79)
getOPCodeIL.MarkLabel(cont79)
getOPCodeIL.MarkSequencePoint(doc2, 498, 1, 498, 100)
Dim typ82(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ82(UBound(typ82) + 1)
typ82(UBound(typ82)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.u4")
Typ = GetType(System.String)
ReDim Preserve typ82(UBound(typ82) + 1)
typ82(UBound(typ82)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 499, 1, 499, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa80 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru80 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont80 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru80)
getOPCodeIL.Emit(OpCodes.Br, fa80)
getOPCodeIL.MarkLabel(tru80)
getOPCodeIL.MarkSequencePoint(doc2, 500, 1, 500, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_U4"))
Typ = GetType(OpCodes).GetField("Ldelem_U4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 501, 1, 501, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 502, 1, 502, 100)
getOPCodeIL.Emit(OpCodes.Br, cont80)
getOPCodeIL.MarkLabel(fa80)
getOPCodeIL.Emit(OpCodes.Br, cont80)
getOPCodeIL.MarkLabel(cont80)
getOPCodeIL.MarkSequencePoint(doc2, 504, 1, 504, 100)
Dim typ83(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ83(UBound(typ83) + 1)
typ83(UBound(typ83)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelem.ref")
Typ = GetType(System.String)
ReDim Preserve typ83(UBound(typ83) + 1)
typ83(UBound(typ83)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 505, 1, 505, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa81 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru81 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont81 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru81)
getOPCodeIL.Emit(OpCodes.Br, fa81)
getOPCodeIL.MarkLabel(tru81)
getOPCodeIL.MarkSequencePoint(doc2, 506, 1, 506, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelem_Ref"))
Typ = GetType(OpCodes).GetField("Ldelem_Ref").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 507, 1, 507, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 508, 1, 508, 100)
getOPCodeIL.Emit(OpCodes.Br, cont81)
getOPCodeIL.MarkLabel(fa81)
getOPCodeIL.Emit(OpCodes.Br, cont81)
getOPCodeIL.MarkLabel(cont81)
getOPCodeIL.MarkSequencePoint(doc2, 510, 1, 510, 100)
Dim typ84(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldelema")
Typ = GetType(System.String)
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 511, 1, 511, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa82 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru82 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont82 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru82)
getOPCodeIL.Emit(OpCodes.Br, fa82)
getOPCodeIL.MarkLabel(tru82)
getOPCodeIL.MarkSequencePoint(doc2, 512, 1, 512, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldelema"))
Typ = GetType(OpCodes).GetField("Ldelema").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 513, 1, 513, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 514, 1, 514, 100)
getOPCodeIL.Emit(OpCodes.Br, cont82)
getOPCodeIL.MarkLabel(fa82)
getOPCodeIL.Emit(OpCodes.Br, cont82)
getOPCodeIL.MarkLabel(cont82)
getOPCodeIL.MarkSequencePoint(doc2, 516, 1, 516, 100)
Dim typ85(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ85(UBound(typ85) + 1)
typ85(UBound(typ85)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldfld")
Typ = GetType(System.String)
ReDim Preserve typ85(UBound(typ85) + 1)
typ85(UBound(typ85)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 517, 1, 517, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa83 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru83 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont83 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru83)
getOPCodeIL.Emit(OpCodes.Br, fa83)
getOPCodeIL.MarkLabel(tru83)
getOPCodeIL.MarkSequencePoint(doc2, 518, 1, 518, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldfld"))
Typ = GetType(OpCodes).GetField("Ldfld").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 519, 1, 519, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 520, 1, 520, 100)
getOPCodeIL.Emit(OpCodes.Br, cont83)
getOPCodeIL.MarkLabel(fa83)
getOPCodeIL.Emit(OpCodes.Br, cont83)
getOPCodeIL.MarkLabel(cont83)
getOPCodeIL.MarkSequencePoint(doc2, 522, 1, 522, 100)
Dim typ86(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldflda")
Typ = GetType(System.String)
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 523, 1, 523, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa84 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru84 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont84 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru84)
getOPCodeIL.Emit(OpCodes.Br, fa84)
getOPCodeIL.MarkLabel(tru84)
getOPCodeIL.MarkSequencePoint(doc2, 524, 1, 524, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldflda"))
Typ = GetType(OpCodes).GetField("Ldflda").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 525, 1, 525, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 526, 1, 526, 100)
getOPCodeIL.Emit(OpCodes.Br, cont84)
getOPCodeIL.MarkLabel(fa84)
getOPCodeIL.Emit(OpCodes.Br, cont84)
getOPCodeIL.MarkLabel(cont84)
getOPCodeIL.MarkSequencePoint(doc2, 528, 1, 528, 100)
Dim typ87(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldftn")
Typ = GetType(System.String)
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 529, 1, 529, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa85 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru85 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont85 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru85)
getOPCodeIL.Emit(OpCodes.Br, fa85)
getOPCodeIL.MarkLabel(tru85)
getOPCodeIL.MarkSequencePoint(doc2, 530, 1, 530, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldftn"))
Typ = GetType(OpCodes).GetField("Ldftn").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 531, 1, 531, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 532, 1, 532, 100)
getOPCodeIL.Emit(OpCodes.Br, cont85)
getOPCodeIL.MarkLabel(fa85)
getOPCodeIL.Emit(OpCodes.Br, cont85)
getOPCodeIL.MarkLabel(cont85)
getOPCodeIL.MarkSequencePoint(doc2, 534, 1, 534, 100)
Dim typ88(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.i")
Typ = GetType(System.String)
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 535, 1, 535, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa86 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru86 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont86 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru86)
getOPCodeIL.Emit(OpCodes.Br, fa86)
getOPCodeIL.MarkLabel(tru86)
getOPCodeIL.MarkSequencePoint(doc2, 536, 1, 536, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_I"))
Typ = GetType(OpCodes).GetField("Ldind_I").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 537, 1, 537, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 538, 1, 538, 100)
getOPCodeIL.Emit(OpCodes.Br, cont86)
getOPCodeIL.MarkLabel(fa86)
getOPCodeIL.Emit(OpCodes.Br, cont86)
getOPCodeIL.MarkLabel(cont86)
getOPCodeIL.MarkSequencePoint(doc2, 540, 1, 540, 100)
Dim typ89(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ89(UBound(typ89) + 1)
typ89(UBound(typ89)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.i1")
Typ = GetType(System.String)
ReDim Preserve typ89(UBound(typ89) + 1)
typ89(UBound(typ89)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 541, 1, 541, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa87 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru87 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont87 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru87)
getOPCodeIL.Emit(OpCodes.Br, fa87)
getOPCodeIL.MarkLabel(tru87)
getOPCodeIL.MarkSequencePoint(doc2, 542, 1, 542, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_I1"))
Typ = GetType(OpCodes).GetField("Ldind_I1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 543, 1, 543, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 544, 1, 544, 100)
getOPCodeIL.Emit(OpCodes.Br, cont87)
getOPCodeIL.MarkLabel(fa87)
getOPCodeIL.Emit(OpCodes.Br, cont87)
getOPCodeIL.MarkLabel(cont87)
getOPCodeIL.MarkSequencePoint(doc2, 546, 1, 546, 100)
Dim typ90(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.i2")
Typ = GetType(System.String)
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 547, 1, 547, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa88 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru88 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont88 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru88)
getOPCodeIL.Emit(OpCodes.Br, fa88)
getOPCodeIL.MarkLabel(tru88)
getOPCodeIL.MarkSequencePoint(doc2, 548, 1, 548, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_I2"))
Typ = GetType(OpCodes).GetField("Ldind_I2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 549, 1, 549, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 550, 1, 550, 100)
getOPCodeIL.Emit(OpCodes.Br, cont88)
getOPCodeIL.MarkLabel(fa88)
getOPCodeIL.Emit(OpCodes.Br, cont88)
getOPCodeIL.MarkLabel(cont88)
getOPCodeIL.MarkSequencePoint(doc2, 552, 1, 552, 100)
Dim typ91(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.i4")
Typ = GetType(System.String)
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 553, 1, 553, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa89 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru89 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont89 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru89)
getOPCodeIL.Emit(OpCodes.Br, fa89)
getOPCodeIL.MarkLabel(tru89)
getOPCodeIL.MarkSequencePoint(doc2, 554, 1, 554, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_I4"))
Typ = GetType(OpCodes).GetField("Ldind_I4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 555, 1, 555, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 556, 1, 556, 100)
getOPCodeIL.Emit(OpCodes.Br, cont89)
getOPCodeIL.MarkLabel(fa89)
getOPCodeIL.Emit(OpCodes.Br, cont89)
getOPCodeIL.MarkLabel(cont89)
getOPCodeIL.MarkSequencePoint(doc2, 558, 1, 558, 100)
Dim typ92(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.i8")
Typ = GetType(System.String)
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 559, 1, 559, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa90 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru90 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont90 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru90)
getOPCodeIL.Emit(OpCodes.Br, fa90)
getOPCodeIL.MarkLabel(tru90)
getOPCodeIL.MarkSequencePoint(doc2, 560, 1, 560, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_I8"))
Typ = GetType(OpCodes).GetField("Ldind_I8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 561, 1, 561, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 562, 1, 562, 100)
getOPCodeIL.Emit(OpCodes.Br, cont90)
getOPCodeIL.MarkLabel(fa90)
getOPCodeIL.Emit(OpCodes.Br, cont90)
getOPCodeIL.MarkLabel(cont90)
getOPCodeIL.MarkSequencePoint(doc2, 564, 1, 564, 100)
Dim typ93(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ93(UBound(typ93) + 1)
typ93(UBound(typ93)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.r4")
Typ = GetType(System.String)
ReDim Preserve typ93(UBound(typ93) + 1)
typ93(UBound(typ93)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 565, 1, 565, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa91 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru91 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont91 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru91)
getOPCodeIL.Emit(OpCodes.Br, fa91)
getOPCodeIL.MarkLabel(tru91)
getOPCodeIL.MarkSequencePoint(doc2, 566, 1, 566, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_R4"))
Typ = GetType(OpCodes).GetField("Ldind_R4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 567, 1, 567, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 568, 1, 568, 100)
getOPCodeIL.Emit(OpCodes.Br, cont91)
getOPCodeIL.MarkLabel(fa91)
getOPCodeIL.Emit(OpCodes.Br, cont91)
getOPCodeIL.MarkLabel(cont91)
getOPCodeIL.MarkSequencePoint(doc2, 570, 1, 570, 100)
Dim typ94(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ94(UBound(typ94) + 1)
typ94(UBound(typ94)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.r8")
Typ = GetType(System.String)
ReDim Preserve typ94(UBound(typ94) + 1)
typ94(UBound(typ94)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 571, 1, 571, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa92 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru92 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont92 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru92)
getOPCodeIL.Emit(OpCodes.Br, fa92)
getOPCodeIL.MarkLabel(tru92)
getOPCodeIL.MarkSequencePoint(doc2, 572, 1, 572, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_R8"))
Typ = GetType(OpCodes).GetField("Ldind_R8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 573, 1, 573, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 574, 1, 574, 100)
getOPCodeIL.Emit(OpCodes.Br, cont92)
getOPCodeIL.MarkLabel(fa92)
getOPCodeIL.Emit(OpCodes.Br, cont92)
getOPCodeIL.MarkLabel(cont92)
getOPCodeIL.MarkSequencePoint(doc2, 576, 1, 576, 100)
Dim typ95(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.u1")
Typ = GetType(System.String)
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 577, 1, 577, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa93 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru93 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont93 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru93)
getOPCodeIL.Emit(OpCodes.Br, fa93)
getOPCodeIL.MarkLabel(tru93)
getOPCodeIL.MarkSequencePoint(doc2, 578, 1, 578, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_U1"))
Typ = GetType(OpCodes).GetField("Ldind_U1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 579, 1, 579, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 580, 1, 580, 100)
getOPCodeIL.Emit(OpCodes.Br, cont93)
getOPCodeIL.MarkLabel(fa93)
getOPCodeIL.Emit(OpCodes.Br, cont93)
getOPCodeIL.MarkLabel(cont93)
getOPCodeIL.MarkSequencePoint(doc2, 582, 1, 582, 100)
Dim typ96(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ96(UBound(typ96) + 1)
typ96(UBound(typ96)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.u2")
Typ = GetType(System.String)
ReDim Preserve typ96(UBound(typ96) + 1)
typ96(UBound(typ96)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 583, 1, 583, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa94 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru94 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont94 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru94)
getOPCodeIL.Emit(OpCodes.Br, fa94)
getOPCodeIL.MarkLabel(tru94)
getOPCodeIL.MarkSequencePoint(doc2, 584, 1, 584, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_U2"))
Typ = GetType(OpCodes).GetField("Ldind_U2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 585, 1, 585, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 586, 1, 586, 100)
getOPCodeIL.Emit(OpCodes.Br, cont94)
getOPCodeIL.MarkLabel(fa94)
getOPCodeIL.Emit(OpCodes.Br, cont94)
getOPCodeIL.MarkLabel(cont94)
getOPCodeIL.MarkSequencePoint(doc2, 588, 1, 588, 100)
Dim typ97(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ97(UBound(typ97) + 1)
typ97(UBound(typ97)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.u4")
Typ = GetType(System.String)
ReDim Preserve typ97(UBound(typ97) + 1)
typ97(UBound(typ97)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 589, 1, 589, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa95 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru95 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont95 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru95)
getOPCodeIL.Emit(OpCodes.Br, fa95)
getOPCodeIL.MarkLabel(tru95)
getOPCodeIL.MarkSequencePoint(doc2, 590, 1, 590, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_U4"))
Typ = GetType(OpCodes).GetField("Ldind_U4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 591, 1, 591, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 592, 1, 592, 100)
getOPCodeIL.Emit(OpCodes.Br, cont95)
getOPCodeIL.MarkLabel(fa95)
getOPCodeIL.Emit(OpCodes.Br, cont95)
getOPCodeIL.MarkLabel(cont95)
getOPCodeIL.MarkSequencePoint(doc2, 594, 1, 594, 100)
Dim typ98(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldind.ref")
Typ = GetType(System.String)
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 595, 1, 595, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa96 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru96 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont96 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru96)
getOPCodeIL.Emit(OpCodes.Br, fa96)
getOPCodeIL.MarkLabel(tru96)
getOPCodeIL.MarkSequencePoint(doc2, 596, 1, 596, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_Ref"))
Typ = GetType(OpCodes).GetField("Ldind_Ref").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 597, 1, 597, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 598, 1, 598, 100)
getOPCodeIL.Emit(OpCodes.Br, cont96)
getOPCodeIL.MarkLabel(fa96)
getOPCodeIL.Emit(OpCodes.Br, cont96)
getOPCodeIL.MarkLabel(cont96)
getOPCodeIL.MarkSequencePoint(doc2, 600, 1, 600, 100)
Dim typ99(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloc")
Typ = GetType(System.String)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 601, 1, 601, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa97 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru97 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont97 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru97)
getOPCodeIL.Emit(OpCodes.Br, fa97)
getOPCodeIL.MarkLabel(tru97)
getOPCodeIL.MarkSequencePoint(doc2, 602, 1, 602, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloc"))
Typ = GetType(OpCodes).GetField("Ldloc").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 603, 1, 603, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 604, 1, 604, 100)
getOPCodeIL.Emit(OpCodes.Br, cont97)
getOPCodeIL.MarkLabel(fa97)
getOPCodeIL.Emit(OpCodes.Br, cont97)
getOPCodeIL.MarkLabel(cont97)
getOPCodeIL.MarkSequencePoint(doc2, 606, 1, 606, 100)
Dim typ100(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ100(UBound(typ100) + 1)
typ100(UBound(typ100)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloc.s")
Typ = GetType(System.String)
ReDim Preserve typ100(UBound(typ100) + 1)
typ100(UBound(typ100)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 607, 1, 607, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa98 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru98 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont98 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru98)
getOPCodeIL.Emit(OpCodes.Br, fa98)
getOPCodeIL.MarkLabel(tru98)
getOPCodeIL.MarkSequencePoint(doc2, 608, 1, 608, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloc_S"))
Typ = GetType(OpCodes).GetField("Ldloc_S").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 609, 1, 609, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 610, 1, 610, 100)
getOPCodeIL.Emit(OpCodes.Br, cont98)
getOPCodeIL.MarkLabel(fa98)
getOPCodeIL.Emit(OpCodes.Br, cont98)
getOPCodeIL.MarkLabel(cont98)
getOPCodeIL.MarkSequencePoint(doc2, 612, 1, 612, 100)
Dim typ101(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ101(UBound(typ101) + 1)
typ101(UBound(typ101)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloca")
Typ = GetType(System.String)
ReDim Preserve typ101(UBound(typ101) + 1)
typ101(UBound(typ101)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 613, 1, 613, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa99 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru99 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont99 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru99)
getOPCodeIL.Emit(OpCodes.Br, fa99)
getOPCodeIL.MarkLabel(tru99)
getOPCodeIL.MarkSequencePoint(doc2, 614, 1, 614, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloca"))
Typ = GetType(OpCodes).GetField("Ldloca").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 615, 1, 615, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 616, 1, 616, 100)
getOPCodeIL.Emit(OpCodes.Br, cont99)
getOPCodeIL.MarkLabel(fa99)
getOPCodeIL.Emit(OpCodes.Br, cont99)
getOPCodeIL.MarkLabel(cont99)
getOPCodeIL.MarkSequencePoint(doc2, 618, 1, 618, 100)
Dim typ102(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloca.s")
Typ = GetType(System.String)
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 619, 1, 619, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa100 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru100 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont100 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru100)
getOPCodeIL.Emit(OpCodes.Br, fa100)
getOPCodeIL.MarkLabel(tru100)
getOPCodeIL.MarkSequencePoint(doc2, 620, 1, 620, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloca_S"))
Typ = GetType(OpCodes).GetField("Ldloca_S").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 621, 1, 621, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 622, 1, 622, 100)
getOPCodeIL.Emit(OpCodes.Br, cont100)
getOPCodeIL.MarkLabel(fa100)
getOPCodeIL.Emit(OpCodes.Br, cont100)
getOPCodeIL.MarkLabel(cont100)
getOPCodeIL.MarkSequencePoint(doc2, 624, 1, 624, 100)
Dim typ103(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ103(UBound(typ103) + 1)
typ103(UBound(typ103)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloc.0")
Typ = GetType(System.String)
ReDim Preserve typ103(UBound(typ103) + 1)
typ103(UBound(typ103)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 625, 1, 625, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa101 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru101 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont101 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru101)
getOPCodeIL.Emit(OpCodes.Br, fa101)
getOPCodeIL.MarkLabel(tru101)
getOPCodeIL.MarkSequencePoint(doc2, 626, 1, 626, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloc_0"))
Typ = GetType(OpCodes).GetField("Ldloc_0").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 627, 1, 627, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 628, 1, 628, 100)
getOPCodeIL.Emit(OpCodes.Br, cont101)
getOPCodeIL.MarkLabel(fa101)
getOPCodeIL.Emit(OpCodes.Br, cont101)
getOPCodeIL.MarkLabel(cont101)
getOPCodeIL.MarkSequencePoint(doc2, 630, 1, 630, 100)
Dim typ104(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ104(UBound(typ104) + 1)
typ104(UBound(typ104)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloc.1")
Typ = GetType(System.String)
ReDim Preserve typ104(UBound(typ104) + 1)
typ104(UBound(typ104)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 631, 1, 631, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa102 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru102 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont102 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru102)
getOPCodeIL.Emit(OpCodes.Br, fa102)
getOPCodeIL.MarkLabel(tru102)
getOPCodeIL.MarkSequencePoint(doc2, 632, 1, 632, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloc_1"))
Typ = GetType(OpCodes).GetField("Ldloc_1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 633, 1, 633, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 634, 1, 634, 100)
getOPCodeIL.Emit(OpCodes.Br, cont102)
getOPCodeIL.MarkLabel(fa102)
getOPCodeIL.Emit(OpCodes.Br, cont102)
getOPCodeIL.MarkLabel(cont102)
getOPCodeIL.MarkSequencePoint(doc2, 636, 1, 636, 100)
Dim typ105(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ105(UBound(typ105) + 1)
typ105(UBound(typ105)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloc.2")
Typ = GetType(System.String)
ReDim Preserve typ105(UBound(typ105) + 1)
typ105(UBound(typ105)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 637, 1, 637, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa103 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru103 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont103 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru103)
getOPCodeIL.Emit(OpCodes.Br, fa103)
getOPCodeIL.MarkLabel(tru103)
getOPCodeIL.MarkSequencePoint(doc2, 638, 1, 638, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloc_2"))
Typ = GetType(OpCodes).GetField("Ldloc_2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 639, 1, 639, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 640, 1, 640, 100)
getOPCodeIL.Emit(OpCodes.Br, cont103)
getOPCodeIL.MarkLabel(fa103)
getOPCodeIL.Emit(OpCodes.Br, cont103)
getOPCodeIL.MarkLabel(cont103)
getOPCodeIL.MarkSequencePoint(doc2, 642, 1, 642, 100)
Dim typ106(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ106(UBound(typ106) + 1)
typ106(UBound(typ106)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldloc.3")
Typ = GetType(System.String)
ReDim Preserve typ106(UBound(typ106) + 1)
typ106(UBound(typ106)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 643, 1, 643, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa104 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru104 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont104 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru104)
getOPCodeIL.Emit(OpCodes.Br, fa104)
getOPCodeIL.MarkLabel(tru104)
getOPCodeIL.MarkSequencePoint(doc2, 644, 1, 644, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldloc_3"))
Typ = GetType(OpCodes).GetField("Ldloc_3").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 645, 1, 645, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 646, 1, 646, 100)
getOPCodeIL.Emit(OpCodes.Br, cont104)
getOPCodeIL.MarkLabel(fa104)
getOPCodeIL.Emit(OpCodes.Br, cont104)
getOPCodeIL.MarkLabel(cont104)
getOPCodeIL.MarkSequencePoint(doc2, 648, 1, 648, 100)
Dim typ107(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ107(UBound(typ107) + 1)
typ107(UBound(typ107)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldnull")
Typ = GetType(System.String)
ReDim Preserve typ107(UBound(typ107) + 1)
typ107(UBound(typ107)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 649, 1, 649, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa105 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru105 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont105 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru105)
getOPCodeIL.Emit(OpCodes.Br, fa105)
getOPCodeIL.MarkLabel(tru105)
getOPCodeIL.MarkSequencePoint(doc2, 650, 1, 650, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldnull"))
Typ = GetType(OpCodes).GetField("Ldnull").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 651, 1, 651, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 652, 1, 652, 100)
getOPCodeIL.Emit(OpCodes.Br, cont105)
getOPCodeIL.MarkLabel(fa105)
getOPCodeIL.Emit(OpCodes.Br, cont105)
getOPCodeIL.MarkLabel(cont105)
getOPCodeIL.MarkSequencePoint(doc2, 654, 1, 654, 100)
Dim typ108(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ108(UBound(typ108) + 1)
typ108(UBound(typ108)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldobj")
Typ = GetType(System.String)
ReDim Preserve typ108(UBound(typ108) + 1)
typ108(UBound(typ108)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 655, 1, 655, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa106 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru106 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont106 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru106)
getOPCodeIL.Emit(OpCodes.Br, fa106)
getOPCodeIL.MarkLabel(tru106)
getOPCodeIL.MarkSequencePoint(doc2, 656, 1, 656, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldobj"))
Typ = GetType(OpCodes).GetField("Ldobj").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 657, 1, 657, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 658, 1, 658, 100)
getOPCodeIL.Emit(OpCodes.Br, cont106)
getOPCodeIL.MarkLabel(fa106)
getOPCodeIL.Emit(OpCodes.Br, cont106)
getOPCodeIL.MarkLabel(cont106)
getOPCodeIL.MarkSequencePoint(doc2, 660, 1, 660, 100)
Dim typ109(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ109(UBound(typ109) + 1)
typ109(UBound(typ109)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldsfld")
Typ = GetType(System.String)
ReDim Preserve typ109(UBound(typ109) + 1)
typ109(UBound(typ109)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 661, 1, 661, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa107 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru107 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont107 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru107)
getOPCodeIL.Emit(OpCodes.Br, fa107)
getOPCodeIL.MarkLabel(tru107)
getOPCodeIL.MarkSequencePoint(doc2, 662, 1, 662, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldsfld"))
Typ = GetType(OpCodes).GetField("Ldsfld").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 663, 1, 663, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 664, 1, 664, 100)
getOPCodeIL.Emit(OpCodes.Br, cont107)
getOPCodeIL.MarkLabel(fa107)
getOPCodeIL.Emit(OpCodes.Br, cont107)
getOPCodeIL.MarkLabel(cont107)
getOPCodeIL.MarkSequencePoint(doc2, 666, 1, 666, 100)
Dim typ110(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ110(UBound(typ110) + 1)
typ110(UBound(typ110)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldsflda")
Typ = GetType(System.String)
ReDim Preserve typ110(UBound(typ110) + 1)
typ110(UBound(typ110)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 667, 1, 667, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa108 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru108 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont108 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru108)
getOPCodeIL.Emit(OpCodes.Br, fa108)
getOPCodeIL.MarkLabel(tru108)
getOPCodeIL.MarkSequencePoint(doc2, 668, 1, 668, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldsflda"))
Typ = GetType(OpCodes).GetField("Ldsflda").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 669, 1, 669, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 670, 1, 670, 100)
getOPCodeIL.Emit(OpCodes.Br, cont108)
getOPCodeIL.MarkLabel(fa108)
getOPCodeIL.Emit(OpCodes.Br, cont108)
getOPCodeIL.MarkLabel(cont108)
getOPCodeIL.MarkSequencePoint(doc2, 672, 1, 672, 100)
Dim typ111(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ111(UBound(typ111) + 1)
typ111(UBound(typ111)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldstr")
Typ = GetType(System.String)
ReDim Preserve typ111(UBound(typ111) + 1)
typ111(UBound(typ111)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 673, 1, 673, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa109 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru109 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont109 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru109)
getOPCodeIL.Emit(OpCodes.Br, fa109)
getOPCodeIL.MarkLabel(tru109)
getOPCodeIL.MarkSequencePoint(doc2, 674, 1, 674, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldstr"))
Typ = GetType(OpCodes).GetField("Ldstr").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 675, 1, 675, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 676, 1, 676, 100)
getOPCodeIL.Emit(OpCodes.Br, cont109)
getOPCodeIL.MarkLabel(fa109)
getOPCodeIL.Emit(OpCodes.Br, cont109)
getOPCodeIL.MarkLabel(cont109)
getOPCodeIL.MarkSequencePoint(doc2, 678, 1, 678, 100)
Dim typ112(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ112(UBound(typ112) + 1)
typ112(UBound(typ112)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldtoken")
Typ = GetType(System.String)
ReDim Preserve typ112(UBound(typ112) + 1)
typ112(UBound(typ112)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 679, 1, 679, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa110 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru110 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont110 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru110)
getOPCodeIL.Emit(OpCodes.Br, fa110)
getOPCodeIL.MarkLabel(tru110)
getOPCodeIL.MarkSequencePoint(doc2, 680, 1, 680, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldtoken"))
Typ = GetType(OpCodes).GetField("Ldtoken").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 681, 1, 681, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 682, 1, 682, 100)
getOPCodeIL.Emit(OpCodes.Br, cont110)
getOPCodeIL.MarkLabel(fa110)
getOPCodeIL.Emit(OpCodes.Br, cont110)
getOPCodeIL.MarkLabel(cont110)
getOPCodeIL.MarkSequencePoint(doc2, 684, 1, 684, 100)
Dim typ113(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ113(UBound(typ113) + 1)
typ113(UBound(typ113)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldvirtftn")
Typ = GetType(System.String)
ReDim Preserve typ113(UBound(typ113) + 1)
typ113(UBound(typ113)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 685, 1, 685, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa111 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru111 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont111 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru111)
getOPCodeIL.Emit(OpCodes.Br, fa111)
getOPCodeIL.MarkLabel(tru111)
getOPCodeIL.MarkSequencePoint(doc2, 686, 1, 686, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldvirtftn"))
Typ = GetType(OpCodes).GetField("Ldvirtftn").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 687, 1, 687, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 688, 1, 688, 100)
getOPCodeIL.Emit(OpCodes.Br, cont111)
getOPCodeIL.MarkLabel(fa111)
getOPCodeIL.Emit(OpCodes.Br, cont111)
getOPCodeIL.MarkLabel(cont111)
getOPCodeIL.MarkSequencePoint(doc2, 690, 1, 690, 100)
Dim typ114(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ114(UBound(typ114) + 1)
typ114(UBound(typ114)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ldftn")
Typ = GetType(System.String)
ReDim Preserve typ114(UBound(typ114) + 1)
typ114(UBound(typ114)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 691, 1, 691, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa112 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru112 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont112 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru112)
getOPCodeIL.Emit(OpCodes.Br, fa112)
getOPCodeIL.MarkLabel(tru112)
getOPCodeIL.MarkSequencePoint(doc2, 692, 1, 692, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldftn"))
Typ = GetType(OpCodes).GetField("Ldftn").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 693, 1, 693, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 694, 1, 694, 100)
getOPCodeIL.Emit(OpCodes.Br, cont112)
getOPCodeIL.MarkLabel(fa112)
getOPCodeIL.Emit(OpCodes.Br, cont112)
getOPCodeIL.MarkLabel(cont112)
getOPCodeIL.MarkSequencePoint(doc2, 697, 1, 697, 100)
Dim typ115(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ115(UBound(typ115) + 1)
typ115(UBound(typ115)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "leave")
Typ = GetType(System.String)
ReDim Preserve typ115(UBound(typ115) + 1)
typ115(UBound(typ115)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 698, 1, 698, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa113 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru113 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont113 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru113)
getOPCodeIL.Emit(OpCodes.Br, fa113)
getOPCodeIL.MarkLabel(tru113)
getOPCodeIL.MarkSequencePoint(doc2, 699, 1, 699, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Leave"))
Typ = GetType(OpCodes).GetField("Leave").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 700, 1, 700, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 701, 1, 701, 100)
getOPCodeIL.Emit(OpCodes.Br, cont113)
getOPCodeIL.MarkLabel(fa113)
getOPCodeIL.Emit(OpCodes.Br, cont113)
getOPCodeIL.MarkLabel(cont113)
getOPCodeIL.MarkSequencePoint(doc2, 703, 1, 703, 100)
Dim typ116(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ116(UBound(typ116) + 1)
typ116(UBound(typ116)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "mul")
Typ = GetType(System.String)
ReDim Preserve typ116(UBound(typ116) + 1)
typ116(UBound(typ116)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 704, 1, 704, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa114 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru114 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont114 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru114)
getOPCodeIL.Emit(OpCodes.Br, fa114)
getOPCodeIL.MarkLabel(tru114)
getOPCodeIL.MarkSequencePoint(doc2, 705, 1, 705, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Mul"))
Typ = GetType(OpCodes).GetField("Mul").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 706, 1, 706, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 707, 1, 707, 100)
getOPCodeIL.Emit(OpCodes.Br, cont114)
getOPCodeIL.MarkLabel(fa114)
getOPCodeIL.Emit(OpCodes.Br, cont114)
getOPCodeIL.MarkLabel(cont114)
getOPCodeIL.MarkSequencePoint(doc2, 709, 1, 709, 100)
Dim typ117(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ117(UBound(typ117) + 1)
typ117(UBound(typ117)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "mul.ovf")
Typ = GetType(System.String)
ReDim Preserve typ117(UBound(typ117) + 1)
typ117(UBound(typ117)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 710, 1, 710, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa115 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru115 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont115 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru115)
getOPCodeIL.Emit(OpCodes.Br, fa115)
getOPCodeIL.MarkLabel(tru115)
getOPCodeIL.MarkSequencePoint(doc2, 711, 1, 711, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Mul_Ovf"))
Typ = GetType(OpCodes).GetField("Mul_Ovf").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 712, 1, 712, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 713, 1, 713, 100)
getOPCodeIL.Emit(OpCodes.Br, cont115)
getOPCodeIL.MarkLabel(fa115)
getOPCodeIL.Emit(OpCodes.Br, cont115)
getOPCodeIL.MarkLabel(cont115)
getOPCodeIL.MarkSequencePoint(doc2, 715, 1, 715, 100)
Dim typ118(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ118(UBound(typ118) + 1)
typ118(UBound(typ118)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "neg")
Typ = GetType(System.String)
ReDim Preserve typ118(UBound(typ118) + 1)
typ118(UBound(typ118)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 716, 1, 716, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa116 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru116 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont116 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru116)
getOPCodeIL.Emit(OpCodes.Br, fa116)
getOPCodeIL.MarkLabel(tru116)
getOPCodeIL.MarkSequencePoint(doc2, 717, 1, 717, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Neg"))
Typ = GetType(OpCodes).GetField("Neg").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 718, 1, 718, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 719, 1, 719, 100)
getOPCodeIL.Emit(OpCodes.Br, cont116)
getOPCodeIL.MarkLabel(fa116)
getOPCodeIL.Emit(OpCodes.Br, cont116)
getOPCodeIL.MarkLabel(cont116)
getOPCodeIL.MarkSequencePoint(doc2, 722, 1, 722, 100)
Dim typ119(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ119(UBound(typ119) + 1)
typ119(UBound(typ119)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "newarr")
Typ = GetType(System.String)
ReDim Preserve typ119(UBound(typ119) + 1)
typ119(UBound(typ119)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 723, 1, 723, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa117 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru117 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont117 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru117)
getOPCodeIL.Emit(OpCodes.Br, fa117)
getOPCodeIL.MarkLabel(tru117)
getOPCodeIL.MarkSequencePoint(doc2, 724, 1, 724, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Newarr"))
Typ = GetType(OpCodes).GetField("Newarr").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 725, 1, 725, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 726, 1, 726, 100)
getOPCodeIL.Emit(OpCodes.Br, cont117)
getOPCodeIL.MarkLabel(fa117)
getOPCodeIL.Emit(OpCodes.Br, cont117)
getOPCodeIL.MarkLabel(cont117)
getOPCodeIL.MarkSequencePoint(doc2, 729, 1, 729, 100)
Dim typ120(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ120(UBound(typ120) + 1)
typ120(UBound(typ120)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "newobj")
Typ = GetType(System.String)
ReDim Preserve typ120(UBound(typ120) + 1)
typ120(UBound(typ120)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 730, 1, 730, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa118 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru118 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont118 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru118)
getOPCodeIL.Emit(OpCodes.Br, fa118)
getOPCodeIL.MarkLabel(tru118)
getOPCodeIL.MarkSequencePoint(doc2, 731, 1, 731, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Newobj"))
Typ = GetType(OpCodes).GetField("Newobj").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 732, 1, 732, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 733, 1, 733, 100)
getOPCodeIL.Emit(OpCodes.Br, cont118)
getOPCodeIL.MarkLabel(fa118)
getOPCodeIL.Emit(OpCodes.Br, cont118)
getOPCodeIL.MarkLabel(cont118)
getOPCodeIL.MarkSequencePoint(doc2, 736, 1, 736, 100)
Dim typ121(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ121(UBound(typ121) + 1)
typ121(UBound(typ121)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "nop")
Typ = GetType(System.String)
ReDim Preserve typ121(UBound(typ121) + 1)
typ121(UBound(typ121)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 737, 1, 737, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa119 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru119 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont119 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru119)
getOPCodeIL.Emit(OpCodes.Br, fa119)
getOPCodeIL.MarkLabel(tru119)
getOPCodeIL.MarkSequencePoint(doc2, 738, 1, 738, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Nop"))
Typ = GetType(OpCodes).GetField("Nop").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 739, 1, 739, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 740, 1, 740, 100)
getOPCodeIL.Emit(OpCodes.Br, cont119)
getOPCodeIL.MarkLabel(fa119)
getOPCodeIL.Emit(OpCodes.Br, cont119)
getOPCodeIL.MarkLabel(cont119)
getOPCodeIL.MarkSequencePoint(doc2, 743, 1, 743, 100)
Dim typ122(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ122(UBound(typ122) + 1)
typ122(UBound(typ122)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "not")
Typ = GetType(System.String)
ReDim Preserve typ122(UBound(typ122) + 1)
typ122(UBound(typ122)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 744, 1, 744, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa120 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru120 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont120 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru120)
getOPCodeIL.Emit(OpCodes.Br, fa120)
getOPCodeIL.MarkLabel(tru120)
getOPCodeIL.MarkSequencePoint(doc2, 745, 1, 745, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Not"))
Typ = GetType(OpCodes).GetField("Not").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 746, 1, 746, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 747, 1, 747, 100)
getOPCodeIL.Emit(OpCodes.Br, cont120)
getOPCodeIL.MarkLabel(fa120)
getOPCodeIL.Emit(OpCodes.Br, cont120)
getOPCodeIL.MarkLabel(cont120)
getOPCodeIL.MarkSequencePoint(doc2, 749, 1, 749, 100)
Dim typ123(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ123(UBound(typ123) + 1)
typ123(UBound(typ123)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "or")
Typ = GetType(System.String)
ReDim Preserve typ123(UBound(typ123) + 1)
typ123(UBound(typ123)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 750, 1, 750, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa121 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru121 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont121 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru121)
getOPCodeIL.Emit(OpCodes.Br, fa121)
getOPCodeIL.MarkLabel(tru121)
getOPCodeIL.MarkSequencePoint(doc2, 751, 1, 751, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Or"))
Typ = GetType(OpCodes).GetField("Or").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 752, 1, 752, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 753, 1, 753, 100)
getOPCodeIL.Emit(OpCodes.Br, cont121)
getOPCodeIL.MarkLabel(fa121)
getOPCodeIL.Emit(OpCodes.Br, cont121)
getOPCodeIL.MarkLabel(cont121)
getOPCodeIL.MarkSequencePoint(doc2, 755, 1, 755, 100)
Dim typ124(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ124(UBound(typ124) + 1)
typ124(UBound(typ124)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "pop")
Typ = GetType(System.String)
ReDim Preserve typ124(UBound(typ124) + 1)
typ124(UBound(typ124)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 756, 1, 756, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa122 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru122 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont122 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru122)
getOPCodeIL.Emit(OpCodes.Br, fa122)
getOPCodeIL.MarkLabel(tru122)
getOPCodeIL.MarkSequencePoint(doc2, 757, 1, 757, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Pop"))
Typ = GetType(OpCodes).GetField("Pop").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 758, 1, 758, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 759, 1, 759, 100)
getOPCodeIL.Emit(OpCodes.Br, cont122)
getOPCodeIL.MarkLabel(fa122)
getOPCodeIL.Emit(OpCodes.Br, cont122)
getOPCodeIL.MarkLabel(cont122)
getOPCodeIL.MarkSequencePoint(doc2, 761, 1, 761, 100)
Dim typ125(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ125(UBound(typ125) + 1)
typ125(UBound(typ125)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "rem")
Typ = GetType(System.String)
ReDim Preserve typ125(UBound(typ125) + 1)
typ125(UBound(typ125)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 762, 1, 762, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa123 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru123 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont123 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru123)
getOPCodeIL.Emit(OpCodes.Br, fa123)
getOPCodeIL.MarkLabel(tru123)
getOPCodeIL.MarkSequencePoint(doc2, 763, 1, 763, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Rem"))
Typ = GetType(OpCodes).GetField("Rem").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 764, 1, 764, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 765, 1, 765, 100)
getOPCodeIL.Emit(OpCodes.Br, cont123)
getOPCodeIL.MarkLabel(fa123)
getOPCodeIL.Emit(OpCodes.Br, cont123)
getOPCodeIL.MarkLabel(cont123)
getOPCodeIL.MarkSequencePoint(doc2, 767, 1, 767, 100)
Dim typ126(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ126(UBound(typ126) + 1)
typ126(UBound(typ126)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "rem.un")
Typ = GetType(System.String)
ReDim Preserve typ126(UBound(typ126) + 1)
typ126(UBound(typ126)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 768, 1, 768, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa124 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru124 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont124 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru124)
getOPCodeIL.Emit(OpCodes.Br, fa124)
getOPCodeIL.MarkLabel(tru124)
getOPCodeIL.MarkSequencePoint(doc2, 769, 1, 769, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Rem_Un"))
Typ = GetType(OpCodes).GetField("Rem_Un").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 770, 1, 770, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 771, 1, 771, 100)
getOPCodeIL.Emit(OpCodes.Br, cont124)
getOPCodeIL.MarkLabel(fa124)
getOPCodeIL.Emit(OpCodes.Br, cont124)
getOPCodeIL.MarkLabel(cont124)
getOPCodeIL.MarkSequencePoint(doc2, 773, 1, 773, 100)
Dim typ127(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ127(UBound(typ127) + 1)
typ127(UBound(typ127)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "ret")
Typ = GetType(System.String)
ReDim Preserve typ127(UBound(typ127) + 1)
typ127(UBound(typ127)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 774, 1, 774, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa125 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru125 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont125 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru125)
getOPCodeIL.Emit(OpCodes.Br, fa125)
getOPCodeIL.MarkLabel(tru125)
getOPCodeIL.MarkSequencePoint(doc2, 775, 1, 775, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ret"))
Typ = GetType(OpCodes).GetField("Ret").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 776, 1, 776, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 777, 1, 777, 100)
getOPCodeIL.Emit(OpCodes.Br, cont125)
getOPCodeIL.MarkLabel(fa125)
getOPCodeIL.Emit(OpCodes.Br, cont125)
getOPCodeIL.MarkLabel(cont125)
getOPCodeIL.MarkSequencePoint(doc2, 779, 1, 779, 100)
Dim typ128(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ128(UBound(typ128) + 1)
typ128(UBound(typ128)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "rethrow")
Typ = GetType(System.String)
ReDim Preserve typ128(UBound(typ128) + 1)
typ128(UBound(typ128)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 780, 1, 780, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa126 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru126 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont126 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru126)
getOPCodeIL.Emit(OpCodes.Br, fa126)
getOPCodeIL.MarkLabel(tru126)
getOPCodeIL.MarkSequencePoint(doc2, 781, 1, 781, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Rethrow"))
Typ = GetType(OpCodes).GetField("Rethrow").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 782, 1, 782, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 783, 1, 783, 100)
getOPCodeIL.Emit(OpCodes.Br, cont126)
getOPCodeIL.MarkLabel(fa126)
getOPCodeIL.Emit(OpCodes.Br, cont126)
getOPCodeIL.MarkLabel(cont126)
getOPCodeIL.MarkSequencePoint(doc2, 785, 1, 785, 100)
Dim typ129(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ129(UBound(typ129) + 1)
typ129(UBound(typ129)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "shl")
Typ = GetType(System.String)
ReDim Preserve typ129(UBound(typ129) + 1)
typ129(UBound(typ129)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 786, 1, 786, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa127 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru127 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont127 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru127)
getOPCodeIL.Emit(OpCodes.Br, fa127)
getOPCodeIL.MarkLabel(tru127)
getOPCodeIL.MarkSequencePoint(doc2, 787, 1, 787, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Shl"))
Typ = GetType(OpCodes).GetField("Shl").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 788, 1, 788, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 789, 1, 789, 100)
getOPCodeIL.Emit(OpCodes.Br, cont127)
getOPCodeIL.MarkLabel(fa127)
getOPCodeIL.Emit(OpCodes.Br, cont127)
getOPCodeIL.MarkLabel(cont127)
getOPCodeIL.MarkSequencePoint(doc2, 791, 1, 791, 100)
Dim typ130(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ130(UBound(typ130) + 1)
typ130(UBound(typ130)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "shr")
Typ = GetType(System.String)
ReDim Preserve typ130(UBound(typ130) + 1)
typ130(UBound(typ130)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 792, 1, 792, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa128 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru128 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont128 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru128)
getOPCodeIL.Emit(OpCodes.Br, fa128)
getOPCodeIL.MarkLabel(tru128)
getOPCodeIL.MarkSequencePoint(doc2, 793, 1, 793, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Shr"))
Typ = GetType(OpCodes).GetField("Shr").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 794, 1, 794, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 795, 1, 795, 100)
getOPCodeIL.Emit(OpCodes.Br, cont128)
getOPCodeIL.MarkLabel(fa128)
getOPCodeIL.Emit(OpCodes.Br, cont128)
getOPCodeIL.MarkLabel(cont128)
getOPCodeIL.MarkSequencePoint(doc2, 797, 1, 797, 100)
Dim typ131(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ131(UBound(typ131) + 1)
typ131(UBound(typ131)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "sizeof")
Typ = GetType(System.String)
ReDim Preserve typ131(UBound(typ131) + 1)
typ131(UBound(typ131)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 798, 1, 798, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa129 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru129 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont129 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru129)
getOPCodeIL.Emit(OpCodes.Br, fa129)
getOPCodeIL.MarkLabel(tru129)
getOPCodeIL.MarkSequencePoint(doc2, 799, 1, 799, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Sizeof"))
Typ = GetType(OpCodes).GetField("Sizeof").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 800, 1, 800, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 801, 1, 801, 100)
getOPCodeIL.Emit(OpCodes.Br, cont129)
getOPCodeIL.MarkLabel(fa129)
getOPCodeIL.Emit(OpCodes.Br, cont129)
getOPCodeIL.MarkLabel(cont129)
getOPCodeIL.MarkSequencePoint(doc2, 803, 1, 803, 100)
Dim typ132(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ132(UBound(typ132) + 1)
typ132(UBound(typ132)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "starg")
Typ = GetType(System.String)
ReDim Preserve typ132(UBound(typ132) + 1)
typ132(UBound(typ132)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 804, 1, 804, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa130 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru130 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont130 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru130)
getOPCodeIL.Emit(OpCodes.Br, fa130)
getOPCodeIL.MarkLabel(tru130)
getOPCodeIL.MarkSequencePoint(doc2, 805, 1, 805, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Starg"))
Typ = GetType(OpCodes).GetField("Starg").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 806, 1, 806, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 807, 1, 807, 100)
getOPCodeIL.Emit(OpCodes.Br, cont130)
getOPCodeIL.MarkLabel(fa130)
getOPCodeIL.Emit(OpCodes.Br, cont130)
getOPCodeIL.MarkLabel(cont130)
getOPCodeIL.MarkSequencePoint(doc2, 809, 1, 809, 100)
Dim typ133(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ133(UBound(typ133) + 1)
typ133(UBound(typ133)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "starg.s")
Typ = GetType(System.String)
ReDim Preserve typ133(UBound(typ133) + 1)
typ133(UBound(typ133)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 810, 1, 810, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa131 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru131 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont131 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru131)
getOPCodeIL.Emit(OpCodes.Br, fa131)
getOPCodeIL.MarkLabel(tru131)
getOPCodeIL.MarkSequencePoint(doc2, 811, 1, 811, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Starg_S"))
Typ = GetType(OpCodes).GetField("Starg_S").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 812, 1, 812, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 813, 1, 813, 100)
getOPCodeIL.Emit(OpCodes.Br, cont131)
getOPCodeIL.MarkLabel(fa131)
getOPCodeIL.Emit(OpCodes.Br, cont131)
getOPCodeIL.MarkLabel(cont131)
getOPCodeIL.MarkSequencePoint(doc2, 815, 1, 815, 100)
Dim typ134(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ134(UBound(typ134) + 1)
typ134(UBound(typ134)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem")
Typ = GetType(System.String)
ReDim Preserve typ134(UBound(typ134) + 1)
typ134(UBound(typ134)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 816, 1, 816, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa132 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru132 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont132 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru132)
getOPCodeIL.Emit(OpCodes.Br, fa132)
getOPCodeIL.MarkLabel(tru132)
getOPCodeIL.MarkSequencePoint(doc2, 817, 1, 817, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem"))
Typ = GetType(OpCodes).GetField("Stelem").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 818, 1, 818, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 819, 1, 819, 100)
getOPCodeIL.Emit(OpCodes.Br, cont132)
getOPCodeIL.MarkLabel(fa132)
getOPCodeIL.Emit(OpCodes.Br, cont132)
getOPCodeIL.MarkLabel(cont132)
getOPCodeIL.MarkSequencePoint(doc2, 821, 1, 821, 100)
Dim typ135(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ135(UBound(typ135) + 1)
typ135(UBound(typ135)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.i")
Typ = GetType(System.String)
ReDim Preserve typ135(UBound(typ135) + 1)
typ135(UBound(typ135)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 822, 1, 822, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa133 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru133 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont133 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru133)
getOPCodeIL.Emit(OpCodes.Br, fa133)
getOPCodeIL.MarkLabel(tru133)
getOPCodeIL.MarkSequencePoint(doc2, 823, 1, 823, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_I"))
Typ = GetType(OpCodes).GetField("Stelem_I").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 824, 1, 824, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 825, 1, 825, 100)
getOPCodeIL.Emit(OpCodes.Br, cont133)
getOPCodeIL.MarkLabel(fa133)
getOPCodeIL.Emit(OpCodes.Br, cont133)
getOPCodeIL.MarkLabel(cont133)
getOPCodeIL.MarkSequencePoint(doc2, 827, 1, 827, 100)
Dim typ136(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ136(UBound(typ136) + 1)
typ136(UBound(typ136)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.i1")
Typ = GetType(System.String)
ReDim Preserve typ136(UBound(typ136) + 1)
typ136(UBound(typ136)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 828, 1, 828, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa134 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru134 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont134 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru134)
getOPCodeIL.Emit(OpCodes.Br, fa134)
getOPCodeIL.MarkLabel(tru134)
getOPCodeIL.MarkSequencePoint(doc2, 829, 1, 829, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_I1"))
Typ = GetType(OpCodes).GetField("Stelem_I1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 830, 1, 830, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 831, 1, 831, 100)
getOPCodeIL.Emit(OpCodes.Br, cont134)
getOPCodeIL.MarkLabel(fa134)
getOPCodeIL.Emit(OpCodes.Br, cont134)
getOPCodeIL.MarkLabel(cont134)
getOPCodeIL.MarkSequencePoint(doc2, 833, 1, 833, 100)
Dim typ137(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ137(UBound(typ137) + 1)
typ137(UBound(typ137)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.i2")
Typ = GetType(System.String)
ReDim Preserve typ137(UBound(typ137) + 1)
typ137(UBound(typ137)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 834, 1, 834, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa135 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru135 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont135 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru135)
getOPCodeIL.Emit(OpCodes.Br, fa135)
getOPCodeIL.MarkLabel(tru135)
getOPCodeIL.MarkSequencePoint(doc2, 835, 1, 835, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_I2"))
Typ = GetType(OpCodes).GetField("Stelem_I2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 836, 1, 836, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 837, 1, 837, 100)
getOPCodeIL.Emit(OpCodes.Br, cont135)
getOPCodeIL.MarkLabel(fa135)
getOPCodeIL.Emit(OpCodes.Br, cont135)
getOPCodeIL.MarkLabel(cont135)
getOPCodeIL.MarkSequencePoint(doc2, 839, 1, 839, 100)
Dim typ138(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ138(UBound(typ138) + 1)
typ138(UBound(typ138)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.i4")
Typ = GetType(System.String)
ReDim Preserve typ138(UBound(typ138) + 1)
typ138(UBound(typ138)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 840, 1, 840, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa136 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru136 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont136 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru136)
getOPCodeIL.Emit(OpCodes.Br, fa136)
getOPCodeIL.MarkLabel(tru136)
getOPCodeIL.MarkSequencePoint(doc2, 841, 1, 841, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_I4"))
Typ = GetType(OpCodes).GetField("Stelem_I4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 842, 1, 842, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 843, 1, 843, 100)
getOPCodeIL.Emit(OpCodes.Br, cont136)
getOPCodeIL.MarkLabel(fa136)
getOPCodeIL.Emit(OpCodes.Br, cont136)
getOPCodeIL.MarkLabel(cont136)
getOPCodeIL.MarkSequencePoint(doc2, 845, 1, 845, 100)
Dim typ139(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ139(UBound(typ139) + 1)
typ139(UBound(typ139)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.i8")
Typ = GetType(System.String)
ReDim Preserve typ139(UBound(typ139) + 1)
typ139(UBound(typ139)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 846, 1, 846, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa137 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru137 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont137 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru137)
getOPCodeIL.Emit(OpCodes.Br, fa137)
getOPCodeIL.MarkLabel(tru137)
getOPCodeIL.MarkSequencePoint(doc2, 847, 1, 847, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_I8"))
Typ = GetType(OpCodes).GetField("Stelem_I8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 848, 1, 848, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 849, 1, 849, 100)
getOPCodeIL.Emit(OpCodes.Br, cont137)
getOPCodeIL.MarkLabel(fa137)
getOPCodeIL.Emit(OpCodes.Br, cont137)
getOPCodeIL.MarkLabel(cont137)
getOPCodeIL.MarkSequencePoint(doc2, 851, 1, 851, 100)
Dim typ140(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ140(UBound(typ140) + 1)
typ140(UBound(typ140)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.r4")
Typ = GetType(System.String)
ReDim Preserve typ140(UBound(typ140) + 1)
typ140(UBound(typ140)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 852, 1, 852, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa138 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru138 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont138 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru138)
getOPCodeIL.Emit(OpCodes.Br, fa138)
getOPCodeIL.MarkLabel(tru138)
getOPCodeIL.MarkSequencePoint(doc2, 853, 1, 853, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_R4"))
Typ = GetType(OpCodes).GetField("Stelem_R4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 854, 1, 854, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 855, 1, 855, 100)
getOPCodeIL.Emit(OpCodes.Br, cont138)
getOPCodeIL.MarkLabel(fa138)
getOPCodeIL.Emit(OpCodes.Br, cont138)
getOPCodeIL.MarkLabel(cont138)
getOPCodeIL.MarkSequencePoint(doc2, 857, 1, 857, 100)
Dim typ141(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ141(UBound(typ141) + 1)
typ141(UBound(typ141)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.r8")
Typ = GetType(System.String)
ReDim Preserve typ141(UBound(typ141) + 1)
typ141(UBound(typ141)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 858, 1, 858, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa139 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru139 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont139 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru139)
getOPCodeIL.Emit(OpCodes.Br, fa139)
getOPCodeIL.MarkLabel(tru139)
getOPCodeIL.MarkSequencePoint(doc2, 859, 1, 859, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_R8"))
Typ = GetType(OpCodes).GetField("Stelem_R8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 860, 1, 860, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 861, 1, 861, 100)
getOPCodeIL.Emit(OpCodes.Br, cont139)
getOPCodeIL.MarkLabel(fa139)
getOPCodeIL.Emit(OpCodes.Br, cont139)
getOPCodeIL.MarkLabel(cont139)
getOPCodeIL.MarkSequencePoint(doc2, 863, 1, 863, 100)
Dim typ142(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ142(UBound(typ142) + 1)
typ142(UBound(typ142)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stelem.ref")
Typ = GetType(System.String)
ReDim Preserve typ142(UBound(typ142) + 1)
typ142(UBound(typ142)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 864, 1, 864, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa140 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru140 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont140 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru140)
getOPCodeIL.Emit(OpCodes.Br, fa140)
getOPCodeIL.MarkLabel(tru140)
getOPCodeIL.MarkSequencePoint(doc2, 865, 1, 865, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_Ref"))
Typ = GetType(OpCodes).GetField("Stelem_Ref").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 866, 1, 866, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 867, 1, 867, 100)
getOPCodeIL.Emit(OpCodes.Br, cont140)
getOPCodeIL.MarkLabel(fa140)
getOPCodeIL.Emit(OpCodes.Br, cont140)
getOPCodeIL.MarkLabel(cont140)
getOPCodeIL.MarkSequencePoint(doc2, 869, 1, 869, 100)
Dim typ143(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ143(UBound(typ143) + 1)
typ143(UBound(typ143)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stfld")
Typ = GetType(System.String)
ReDim Preserve typ143(UBound(typ143) + 1)
typ143(UBound(typ143)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 870, 1, 870, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa141 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru141 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont141 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru141)
getOPCodeIL.Emit(OpCodes.Br, fa141)
getOPCodeIL.MarkLabel(tru141)
getOPCodeIL.MarkSequencePoint(doc2, 871, 1, 871, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stfld"))
Typ = GetType(OpCodes).GetField("Stfld").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 872, 1, 872, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 873, 1, 873, 100)
getOPCodeIL.Emit(OpCodes.Br, cont141)
getOPCodeIL.MarkLabel(fa141)
getOPCodeIL.Emit(OpCodes.Br, cont141)
getOPCodeIL.MarkLabel(cont141)
getOPCodeIL.MarkSequencePoint(doc2, 875, 1, 875, 100)
Dim typ144(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ144(UBound(typ144) + 1)
typ144(UBound(typ144)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.i")
Typ = GetType(System.String)
ReDim Preserve typ144(UBound(typ144) + 1)
typ144(UBound(typ144)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 876, 1, 876, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa142 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru142 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont142 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru142)
getOPCodeIL.Emit(OpCodes.Br, fa142)
getOPCodeIL.MarkLabel(tru142)
getOPCodeIL.MarkSequencePoint(doc2, 877, 1, 877, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stind_I"))
Typ = GetType(OpCodes).GetField("Stind_I").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 878, 1, 878, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 879, 1, 879, 100)
getOPCodeIL.Emit(OpCodes.Br, cont142)
getOPCodeIL.MarkLabel(fa142)
getOPCodeIL.Emit(OpCodes.Br, cont142)
getOPCodeIL.MarkLabel(cont142)
getOPCodeIL.MarkSequencePoint(doc2, 881, 1, 881, 100)
Dim typ145(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ145(UBound(typ145) + 1)
typ145(UBound(typ145)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.i1")
Typ = GetType(System.String)
ReDim Preserve typ145(UBound(typ145) + 1)
typ145(UBound(typ145)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 882, 1, 882, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa143 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru143 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont143 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru143)
getOPCodeIL.Emit(OpCodes.Br, fa143)
getOPCodeIL.MarkLabel(tru143)
getOPCodeIL.MarkSequencePoint(doc2, 883, 1, 883, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Ldind_I1"))
Typ = GetType(OpCodes).GetField("Ldind_I1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 884, 1, 884, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 885, 1, 885, 100)
getOPCodeIL.Emit(OpCodes.Br, cont143)
getOPCodeIL.MarkLabel(fa143)
getOPCodeIL.Emit(OpCodes.Br, cont143)
getOPCodeIL.MarkLabel(cont143)
getOPCodeIL.MarkSequencePoint(doc2, 887, 1, 887, 100)
Dim typ146(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ146(UBound(typ146) + 1)
typ146(UBound(typ146)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.i2")
Typ = GetType(System.String)
ReDim Preserve typ146(UBound(typ146) + 1)
typ146(UBound(typ146)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 888, 1, 888, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa144 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru144 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont144 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru144)
getOPCodeIL.Emit(OpCodes.Br, fa144)
getOPCodeIL.MarkLabel(tru144)
getOPCodeIL.MarkSequencePoint(doc2, 889, 1, 889, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stind_I2"))
Typ = GetType(OpCodes).GetField("Stind_I2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 890, 1, 890, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 891, 1, 891, 100)
getOPCodeIL.Emit(OpCodes.Br, cont144)
getOPCodeIL.MarkLabel(fa144)
getOPCodeIL.Emit(OpCodes.Br, cont144)
getOPCodeIL.MarkLabel(cont144)
getOPCodeIL.MarkSequencePoint(doc2, 893, 1, 893, 100)
Dim typ147(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ147(UBound(typ147) + 1)
typ147(UBound(typ147)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.i4")
Typ = GetType(System.String)
ReDim Preserve typ147(UBound(typ147) + 1)
typ147(UBound(typ147)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 894, 1, 894, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa145 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru145 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont145 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru145)
getOPCodeIL.Emit(OpCodes.Br, fa145)
getOPCodeIL.MarkLabel(tru145)
getOPCodeIL.MarkSequencePoint(doc2, 895, 1, 895, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stind_I4"))
Typ = GetType(OpCodes).GetField("Stind_I4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 896, 1, 896, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 897, 1, 897, 100)
getOPCodeIL.Emit(OpCodes.Br, cont145)
getOPCodeIL.MarkLabel(fa145)
getOPCodeIL.Emit(OpCodes.Br, cont145)
getOPCodeIL.MarkLabel(cont145)
getOPCodeIL.MarkSequencePoint(doc2, 899, 1, 899, 100)
Dim typ148(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ148(UBound(typ148) + 1)
typ148(UBound(typ148)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.i8")
Typ = GetType(System.String)
ReDim Preserve typ148(UBound(typ148) + 1)
typ148(UBound(typ148)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 900, 1, 900, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa146 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru146 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont146 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru146)
getOPCodeIL.Emit(OpCodes.Br, fa146)
getOPCodeIL.MarkLabel(tru146)
getOPCodeIL.MarkSequencePoint(doc2, 901, 1, 901, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stind_I8"))
Typ = GetType(OpCodes).GetField("Stind_I8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 902, 1, 902, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 903, 1, 903, 100)
getOPCodeIL.Emit(OpCodes.Br, cont146)
getOPCodeIL.MarkLabel(fa146)
getOPCodeIL.Emit(OpCodes.Br, cont146)
getOPCodeIL.MarkLabel(cont146)
getOPCodeIL.MarkSequencePoint(doc2, 905, 1, 905, 100)
Dim typ149(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ149(UBound(typ149) + 1)
typ149(UBound(typ149)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.r4")
Typ = GetType(System.String)
ReDim Preserve typ149(UBound(typ149) + 1)
typ149(UBound(typ149)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 906, 1, 906, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa147 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru147 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont147 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru147)
getOPCodeIL.Emit(OpCodes.Br, fa147)
getOPCodeIL.MarkLabel(tru147)
getOPCodeIL.MarkSequencePoint(doc2, 907, 1, 907, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stind_R4"))
Typ = GetType(OpCodes).GetField("Stind_R4").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 908, 1, 908, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 909, 1, 909, 100)
getOPCodeIL.Emit(OpCodes.Br, cont147)
getOPCodeIL.MarkLabel(fa147)
getOPCodeIL.Emit(OpCodes.Br, cont147)
getOPCodeIL.MarkLabel(cont147)
getOPCodeIL.MarkSequencePoint(doc2, 911, 1, 911, 100)
Dim typ150(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ150(UBound(typ150) + 1)
typ150(UBound(typ150)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.r8")
Typ = GetType(System.String)
ReDim Preserve typ150(UBound(typ150) + 1)
typ150(UBound(typ150)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 912, 1, 912, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa148 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru148 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont148 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru148)
getOPCodeIL.Emit(OpCodes.Br, fa148)
getOPCodeIL.MarkLabel(tru148)
getOPCodeIL.MarkSequencePoint(doc2, 913, 1, 913, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stelem_R8"))
Typ = GetType(OpCodes).GetField("Stelem_R8").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 914, 1, 914, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 915, 1, 915, 100)
getOPCodeIL.Emit(OpCodes.Br, cont148)
getOPCodeIL.MarkLabel(fa148)
getOPCodeIL.Emit(OpCodes.Br, cont148)
getOPCodeIL.MarkLabel(cont148)
getOPCodeIL.MarkSequencePoint(doc2, 917, 1, 917, 100)
Dim typ151(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ151(UBound(typ151) + 1)
typ151(UBound(typ151)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stind.ref")
Typ = GetType(System.String)
ReDim Preserve typ151(UBound(typ151) + 1)
typ151(UBound(typ151)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 918, 1, 918, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa149 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru149 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont149 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru149)
getOPCodeIL.Emit(OpCodes.Br, fa149)
getOPCodeIL.MarkLabel(tru149)
getOPCodeIL.MarkSequencePoint(doc2, 919, 1, 919, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stind_Ref"))
Typ = GetType(OpCodes).GetField("Stind_Ref").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 920, 1, 920, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 921, 1, 921, 100)
getOPCodeIL.Emit(OpCodes.Br, cont149)
getOPCodeIL.MarkLabel(fa149)
getOPCodeIL.Emit(OpCodes.Br, cont149)
getOPCodeIL.MarkLabel(cont149)
getOPCodeIL.MarkSequencePoint(doc2, 923, 1, 923, 100)
Dim typ152(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ152(UBound(typ152) + 1)
typ152(UBound(typ152)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stloc")
Typ = GetType(System.String)
ReDim Preserve typ152(UBound(typ152) + 1)
typ152(UBound(typ152)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 924, 1, 924, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa150 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru150 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont150 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru150)
getOPCodeIL.Emit(OpCodes.Br, fa150)
getOPCodeIL.MarkLabel(tru150)
getOPCodeIL.MarkSequencePoint(doc2, 925, 1, 925, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stloc"))
Typ = GetType(OpCodes).GetField("Stloc").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 926, 1, 926, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 927, 1, 927, 100)
getOPCodeIL.Emit(OpCodes.Br, cont150)
getOPCodeIL.MarkLabel(fa150)
getOPCodeIL.Emit(OpCodes.Br, cont150)
getOPCodeIL.MarkLabel(cont150)
getOPCodeIL.MarkSequencePoint(doc2, 929, 1, 929, 100)
Dim typ153(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ153(UBound(typ153) + 1)
typ153(UBound(typ153)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stloc.s")
Typ = GetType(System.String)
ReDim Preserve typ153(UBound(typ153) + 1)
typ153(UBound(typ153)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 930, 1, 930, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa151 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru151 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont151 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru151)
getOPCodeIL.Emit(OpCodes.Br, fa151)
getOPCodeIL.MarkLabel(tru151)
getOPCodeIL.MarkSequencePoint(doc2, 931, 1, 931, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stloc_S"))
Typ = GetType(OpCodes).GetField("Stloc_S").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 932, 1, 932, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 933, 1, 933, 100)
getOPCodeIL.Emit(OpCodes.Br, cont151)
getOPCodeIL.MarkLabel(fa151)
getOPCodeIL.Emit(OpCodes.Br, cont151)
getOPCodeIL.MarkLabel(cont151)
getOPCodeIL.MarkSequencePoint(doc2, 935, 1, 935, 100)
Dim typ154(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ154(UBound(typ154) + 1)
typ154(UBound(typ154)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stloc.0")
Typ = GetType(System.String)
ReDim Preserve typ154(UBound(typ154) + 1)
typ154(UBound(typ154)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 936, 1, 936, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa152 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru152 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont152 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru152)
getOPCodeIL.Emit(OpCodes.Br, fa152)
getOPCodeIL.MarkLabel(tru152)
getOPCodeIL.MarkSequencePoint(doc2, 937, 1, 937, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stloc_0"))
Typ = GetType(OpCodes).GetField("Stloc_0").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 938, 1, 938, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 939, 1, 939, 100)
getOPCodeIL.Emit(OpCodes.Br, cont152)
getOPCodeIL.MarkLabel(fa152)
getOPCodeIL.Emit(OpCodes.Br, cont152)
getOPCodeIL.MarkLabel(cont152)
getOPCodeIL.MarkSequencePoint(doc2, 941, 1, 941, 100)
Dim typ155(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ155(UBound(typ155) + 1)
typ155(UBound(typ155)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stloc.1")
Typ = GetType(System.String)
ReDim Preserve typ155(UBound(typ155) + 1)
typ155(UBound(typ155)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 942, 1, 942, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa153 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru153 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont153 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru153)
getOPCodeIL.Emit(OpCodes.Br, fa153)
getOPCodeIL.MarkLabel(tru153)
getOPCodeIL.MarkSequencePoint(doc2, 943, 1, 943, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stloc_1"))
Typ = GetType(OpCodes).GetField("Stloc_1").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 944, 1, 944, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 945, 1, 945, 100)
getOPCodeIL.Emit(OpCodes.Br, cont153)
getOPCodeIL.MarkLabel(fa153)
getOPCodeIL.Emit(OpCodes.Br, cont153)
getOPCodeIL.MarkLabel(cont153)
getOPCodeIL.MarkSequencePoint(doc2, 947, 1, 947, 100)
Dim typ156(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ156(UBound(typ156) + 1)
typ156(UBound(typ156)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stloc.2")
Typ = GetType(System.String)
ReDim Preserve typ156(UBound(typ156) + 1)
typ156(UBound(typ156)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 948, 1, 948, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa154 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru154 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont154 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru154)
getOPCodeIL.Emit(OpCodes.Br, fa154)
getOPCodeIL.MarkLabel(tru154)
getOPCodeIL.MarkSequencePoint(doc2, 949, 1, 949, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stloc_2"))
Typ = GetType(OpCodes).GetField("Stloc_2").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 950, 1, 950, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 951, 1, 951, 100)
getOPCodeIL.Emit(OpCodes.Br, cont154)
getOPCodeIL.MarkLabel(fa154)
getOPCodeIL.Emit(OpCodes.Br, cont154)
getOPCodeIL.MarkLabel(cont154)
getOPCodeIL.MarkSequencePoint(doc2, 953, 1, 953, 100)
Dim typ157(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ157(UBound(typ157) + 1)
typ157(UBound(typ157)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stloc.3")
Typ = GetType(System.String)
ReDim Preserve typ157(UBound(typ157) + 1)
typ157(UBound(typ157)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 954, 1, 954, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa155 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru155 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont155 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru155)
getOPCodeIL.Emit(OpCodes.Br, fa155)
getOPCodeIL.MarkLabel(tru155)
getOPCodeIL.MarkSequencePoint(doc2, 955, 1, 955, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stloc_3"))
Typ = GetType(OpCodes).GetField("Stloc_3").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 956, 1, 956, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 957, 1, 957, 100)
getOPCodeIL.Emit(OpCodes.Br, cont155)
getOPCodeIL.MarkLabel(fa155)
getOPCodeIL.Emit(OpCodes.Br, cont155)
getOPCodeIL.MarkLabel(cont155)
getOPCodeIL.MarkSequencePoint(doc2, 959, 1, 959, 100)
Dim typ158(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ158(UBound(typ158) + 1)
typ158(UBound(typ158)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stobj")
Typ = GetType(System.String)
ReDim Preserve typ158(UBound(typ158) + 1)
typ158(UBound(typ158)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 960, 1, 960, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa156 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru156 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont156 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru156)
getOPCodeIL.Emit(OpCodes.Br, fa156)
getOPCodeIL.MarkLabel(tru156)
getOPCodeIL.MarkSequencePoint(doc2, 961, 1, 961, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stobj"))
Typ = GetType(OpCodes).GetField("Stobj").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 962, 1, 962, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 963, 1, 963, 100)
getOPCodeIL.Emit(OpCodes.Br, cont156)
getOPCodeIL.MarkLabel(fa156)
getOPCodeIL.Emit(OpCodes.Br, cont156)
getOPCodeIL.MarkLabel(cont156)
getOPCodeIL.MarkSequencePoint(doc2, 965, 1, 965, 100)
Dim typ159(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ159(UBound(typ159) + 1)
typ159(UBound(typ159)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "stsfld")
Typ = GetType(System.String)
ReDim Preserve typ159(UBound(typ159) + 1)
typ159(UBound(typ159)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 966, 1, 966, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa157 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru157 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont157 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru157)
getOPCodeIL.Emit(OpCodes.Br, fa157)
getOPCodeIL.MarkLabel(tru157)
getOPCodeIL.MarkSequencePoint(doc2, 967, 1, 967, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Stsfld"))
Typ = GetType(OpCodes).GetField("Stsfld").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 968, 1, 968, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 969, 1, 969, 100)
getOPCodeIL.Emit(OpCodes.Br, cont157)
getOPCodeIL.MarkLabel(fa157)
getOPCodeIL.Emit(OpCodes.Br, cont157)
getOPCodeIL.MarkLabel(cont157)
getOPCodeIL.MarkSequencePoint(doc2, 971, 1, 971, 100)
Dim typ160(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ160(UBound(typ160) + 1)
typ160(UBound(typ160)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "sub")
Typ = GetType(System.String)
ReDim Preserve typ160(UBound(typ160) + 1)
typ160(UBound(typ160)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 972, 1, 972, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa158 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru158 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont158 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru158)
getOPCodeIL.Emit(OpCodes.Br, fa158)
getOPCodeIL.MarkLabel(tru158)
getOPCodeIL.MarkSequencePoint(doc2, 973, 1, 973, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Sub"))
Typ = GetType(OpCodes).GetField("Sub").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 974, 1, 974, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 975, 1, 975, 100)
getOPCodeIL.Emit(OpCodes.Br, cont158)
getOPCodeIL.MarkLabel(fa158)
getOPCodeIL.Emit(OpCodes.Br, cont158)
getOPCodeIL.MarkLabel(cont158)
getOPCodeIL.MarkSequencePoint(doc2, 977, 1, 977, 100)
Dim typ161(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ161(UBound(typ161) + 1)
typ161(UBound(typ161)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "sub.ovf")
Typ = GetType(System.String)
ReDim Preserve typ161(UBound(typ161) + 1)
typ161(UBound(typ161)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 978, 1, 978, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa159 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru159 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont159 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru159)
getOPCodeIL.Emit(OpCodes.Br, fa159)
getOPCodeIL.MarkLabel(tru159)
getOPCodeIL.MarkSequencePoint(doc2, 979, 1, 979, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Sub_Ovf"))
Typ = GetType(OpCodes).GetField("Sub_Ovf").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 980, 1, 980, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 981, 1, 981, 100)
getOPCodeIL.Emit(OpCodes.Br, cont159)
getOPCodeIL.MarkLabel(fa159)
getOPCodeIL.Emit(OpCodes.Br, cont159)
getOPCodeIL.MarkLabel(cont159)
getOPCodeIL.MarkSequencePoint(doc2, 983, 1, 983, 100)
Dim typ162(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ162(UBound(typ162) + 1)
typ162(UBound(typ162)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "throw")
Typ = GetType(System.String)
ReDim Preserve typ162(UBound(typ162) + 1)
typ162(UBound(typ162)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 984, 1, 984, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa160 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru160 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont160 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru160)
getOPCodeIL.Emit(OpCodes.Br, fa160)
getOPCodeIL.MarkLabel(tru160)
getOPCodeIL.MarkSequencePoint(doc2, 985, 1, 985, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Throw"))
Typ = GetType(OpCodes).GetField("Throw").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 986, 1, 986, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 987, 1, 987, 100)
getOPCodeIL.Emit(OpCodes.Br, cont160)
getOPCodeIL.MarkLabel(fa160)
getOPCodeIL.Emit(OpCodes.Br, cont160)
getOPCodeIL.MarkLabel(cont160)
getOPCodeIL.MarkSequencePoint(doc2, 989, 1, 989, 100)
Dim typ163(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ163(UBound(typ163) + 1)
typ163(UBound(typ163)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "unbox")
Typ = GetType(System.String)
ReDim Preserve typ163(UBound(typ163) + 1)
typ163(UBound(typ163)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 990, 1, 990, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa161 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru161 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont161 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru161)
getOPCodeIL.Emit(OpCodes.Br, fa161)
getOPCodeIL.MarkLabel(tru161)
getOPCodeIL.MarkSequencePoint(doc2, 991, 1, 991, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Unbox"))
Typ = GetType(OpCodes).GetField("Unbox").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 992, 1, 992, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 993, 1, 993, 100)
getOPCodeIL.Emit(OpCodes.Br, cont161)
getOPCodeIL.MarkLabel(fa161)
getOPCodeIL.Emit(OpCodes.Br, cont161)
getOPCodeIL.MarkLabel(cont161)
getOPCodeIL.MarkSequencePoint(doc2, 995, 1, 995, 100)
Dim typ164(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ164(UBound(typ164) + 1)
typ164(UBound(typ164)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "unbox.any")
Typ = GetType(System.String)
ReDim Preserve typ164(UBound(typ164) + 1)
typ164(UBound(typ164)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 996, 1, 996, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa162 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru162 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont162 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru162)
getOPCodeIL.Emit(OpCodes.Br, fa162)
getOPCodeIL.MarkLabel(tru162)
getOPCodeIL.MarkSequencePoint(doc2, 997, 1, 997, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Unbox_Any"))
Typ = GetType(OpCodes).GetField("Unbox_Any").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 998, 1, 998, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 999, 1, 999, 100)
getOPCodeIL.Emit(OpCodes.Br, cont162)
getOPCodeIL.MarkLabel(fa162)
getOPCodeIL.Emit(OpCodes.Br, cont162)
getOPCodeIL.MarkLabel(cont162)
getOPCodeIL.MarkSequencePoint(doc2, 1001, 1, 1001, 100)
Dim typ165(-1) As Type
getOPCodeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ165(UBound(typ165) + 1)
typ165(UBound(typ165)) = Typ
getOPCodeIL.Emit(OpCodes.Ldstr, "xor")
Typ = GetType(System.String)
ReDim Preserve typ165(UBound(typ165) + 1)
typ165(UBound(typ165)) = Typ
getOPCodeIL.Emit(OpCodes.Call, compStr)
Typ = compStr.ReturnType
getOPCodeIL.Emit(OpCodes.Stloc, 0)
getOPCodeIL.MarkSequencePoint(doc2, 1002, 1, 1002, 100)
getOPCodeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
getOPCodeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa163 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim tru163 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
Dim cont163 As System.Reflection.Emit.Label = getOPCodeIL.DefineLabel()
getOPCodeIL.Emit(OpCodes.Beq, tru163)
getOPCodeIL.Emit(OpCodes.Br, fa163)
getOPCodeIL.MarkLabel(tru163)
getOPCodeIL.MarkSequencePoint(doc2, 1003, 1, 1003, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Xor"))
Typ = GetType(OpCodes).GetField("Xor").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 1004, 1, 1004, 100)
getOPCodeIL.Emit(OpCodes.Br, label0)
getOPCodeIL.MarkSequencePoint(doc2, 1005, 1, 1005, 100)
getOPCodeIL.Emit(OpCodes.Br, cont163)
getOPCodeIL.MarkLabel(fa163)
getOPCodeIL.Emit(OpCodes.Br, cont163)
getOPCodeIL.MarkLabel(cont163)
getOPCodeIL.MarkSequencePoint(doc2, 1007, 1, 1007, 100)
getOPCodeIL.Emit(OpCodes.Ldsfld, GetType(OpCodes).GetField("Nop"))
Typ = GetType(OpCodes).GetField("Nop").FieldType
getOPCodeIL.MarkSequencePoint(doc2, 1008, 1, 1008, 100)
getOPCodeIL.MarkLabel(label0)
getOPCodeIL.MarkSequencePoint(doc2, 1009, 1, 1009, 100)
getOPCodeIL.Emit(OpCodes.Ret)
InstructionHelper.CreateType()
End Sub


Dim doc3 As ISymbolDocumentWriter

Sub ILEmitter()
Dim ILEmitter As TypeBuilder = mdl.DefineType("dylan.NET.Reflection" & "." & "ILEmitter", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass Or TypeAttributes.BeforeFieldInit, GetType(System.Object))
Dim Met As FieldBuilder = ILEmitter.DefineField("Met", GetType(MethodBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim Constr As FieldBuilder = ILEmitter.DefineField("Constr", GetType(ConstructorBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim ILGen As FieldBuilder = ILEmitter.DefineField("ILGen", GetType(ILGenerator), FieldAttributes.Public Or FieldAttributes.Static)
Dim DocWriter As FieldBuilder = ILEmitter.DefineField("DocWriter", GetType(ISymbolDocumentWriter), FieldAttributes.Public Or FieldAttributes.Static)
Dim StaticFlg As FieldBuilder = ILEmitter.DefineField("StaticFlg", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim DebugFlg As FieldBuilder = ILEmitter.DefineField("DebugFlg", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim LocInd As FieldBuilder = ILEmitter.DefineField("LocInd", GetType(System.Int32), FieldAttributes.Public Or FieldAttributes.Static)
Dim ArgInd As FieldBuilder = ILEmitter.DefineField("ArgInd", GetType(System.Int32), FieldAttributes.Public Or FieldAttributes.Static)
Dim LineNr As FieldBuilder = ILEmitter.DefineField("LineNr", GetType(System.Int32), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurSrcFile As FieldBuilder = ILEmitter.DefineField("CurSrcFile", GetType(System.String), FieldAttributes.Public Or FieldAttributes.Static)
Dim SrcFiles As FieldBuilder = ILEmitter.DefineField("SrcFiles", GetType(System.String).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim DocWriters As FieldBuilder = ILEmitter.DefineField("DocWriters", GetType(ISymbolDocumentWriter).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim ctor0 As ConstructorBuilder = ILEmitter.DefineConstructor(MethodAttributes.Public Or MethodAttributes.Static,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
ctor0IL.MarkSequencePoint(doc3, 25, 1, 25, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, Met)
ctor0IL.MarkSequencePoint(doc3, 26, 1, 26, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, Constr)
ctor0IL.MarkSequencePoint(doc3, 27, 1, 27, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, ILGen)
ctor0IL.MarkSequencePoint(doc3, 28, 1, 28, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, StaticFlg)
ctor0IL.MarkSequencePoint(doc3, 29, 1, 29, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, DebugFlg)
ctor0IL.MarkSequencePoint(doc3, 30, 1, 30, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, LocInd)
ctor0IL.MarkSequencePoint(doc3, 31, 1, 31, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, ArgInd)
ctor0IL.MarkSequencePoint(doc3, 32, 1, 32, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, LineNr)
ctor0IL.MarkSequencePoint(doc3, 33, 1, 33, 100)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stsfld, CurSrcFile)
ctor0IL.MarkSequencePoint(doc3, 34, 1, 34, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(System.String))
ctor0IL.Emit(OpCodes.Stsfld, SrcFiles)
ctor0IL.MarkSequencePoint(doc3, 35, 1, 35, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(ISymbolDocumentWriter))
ctor0IL.Emit(OpCodes.Stsfld, DocWriters)
ctor0IL.MarkSequencePoint(doc3, 36, 1, 36, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
Dim AddSrcFile As MethodBuilder = ILEmitter.DefineMethod("AddSrcFile", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ0)
Dim AddSrcFileIL As ILGenerator = AddSrcFile.GetILGenerator()
Dim AddSrcFileparam01 As ParameterBuilder = AddSrcFile.DefineParameter(1, ParameterAttributes.None, "srcf")
AddSrcFileIL.MarkSequencePoint(doc3, 40, 1, 40, 100)
Dim locbldr2 As LocalBuilder = AddSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr2.SetLocalSymInfo("len")
AddSrcFileIL.Emit(OpCodes.Ldsfld, SrcFiles)
Typ = SrcFiles.FieldType
AddSrcFileIL.Emit(OpCodes.Ldlen)
AddSrcFileIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Stloc, 0)
AddSrcFileIL.MarkSequencePoint(doc3, 41, 1, 41, 100)
Dim locbldr3 As LocalBuilder = AddSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr3.SetLocalSymInfo("destl")
AddSrcFileIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Add)
AddSrcFileIL.Emit(OpCodes.Stloc, 1)
AddSrcFileIL.MarkSequencePoint(doc3, 42, 1, 42, 100)
Dim locbldr4 As LocalBuilder = AddSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr4.SetLocalSymInfo("stopel")
AddSrcFileIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Sub)
AddSrcFileIL.Emit(OpCodes.Stloc, 2)
AddSrcFileIL.MarkSequencePoint(doc3, 43, 1, 43, 100)
Dim locbldr5 As LocalBuilder = AddSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr5.SetLocalSymInfo("i")
AddSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Stloc, 3)
AddSrcFileIL.MarkSequencePoint(doc3, 45, 1, 45, 100)
Dim locbldr6 As LocalBuilder = AddSrcFileIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr6.SetLocalSymInfo("destarr")
AddSrcFileIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Conv_U)
AddSrcFileIL.Emit(OpCodes.Newarr, GetType(System.String))
AddSrcFileIL.Emit(OpCodes.Stloc, 4)
AddSrcFileIL.MarkSequencePoint(doc3, 47, 1, 47, 100)
Dim label0 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
AddSrcFileIL.MarkSequencePoint(doc3, 48, 1, 48, 100)
Dim label1 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
AddSrcFileIL.MarkSequencePoint(doc3, 50, 1, 50, 100)
AddSrcFileIL.MarkLabel(label0)
AddSrcFileIL.MarkSequencePoint(doc3, 52, 1, 52, 100)
AddSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Add)
AddSrcFileIL.Emit(OpCodes.Stloc, 3)
AddSrcFileIL.MarkSequencePoint(doc3, 54, 1, 54, 100)
AddSrcFileIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa164 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
Dim tru164 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
Dim cont164 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
AddSrcFileIL.Emit(OpCodes.Bgt, tru164)
AddSrcFileIL.Emit(OpCodes.Br, fa164)
AddSrcFileIL.MarkLabel(tru164)
AddSrcFileIL.MarkSequencePoint(doc3, 56, 1, 56, 100)
AddSrcFileIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
AddSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddSrcFileIL.Emit(OpCodes.Ldsfld, SrcFiles)
Typ = SrcFiles.FieldType
Typ02 = Typ
AddSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddSrcFileIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
AddSrcFileIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
AddSrcFileIL.MarkSequencePoint(doc3, 58, 1, 58, 100)
AddSrcFileIL.Emit(OpCodes.Br, cont164)
AddSrcFileIL.MarkLabel(fa164)
AddSrcFileIL.Emit(OpCodes.Br, cont164)
AddSrcFileIL.MarkLabel(cont164)
AddSrcFileIL.MarkSequencePoint(doc3, 60, 1, 60, 100)
AddSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa165 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
Dim tru165 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
Dim cont165 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
AddSrcFileIL.Emit(OpCodes.Beq, tru165)
AddSrcFileIL.Emit(OpCodes.Br, fa165)
AddSrcFileIL.MarkLabel(tru165)
AddSrcFileIL.MarkSequencePoint(doc3, 61, 1, 61, 100)
AddSrcFileIL.Emit(OpCodes.Br, label1)
AddSrcFileIL.MarkSequencePoint(doc3, 62, 1, 62, 100)
AddSrcFileIL.Emit(OpCodes.Br, cont165)
AddSrcFileIL.MarkLabel(fa165)
AddSrcFileIL.MarkSequencePoint(doc3, 63, 1, 63, 100)
AddSrcFileIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa166 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
Dim tru166 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
Dim cont166 As System.Reflection.Emit.Label = AddSrcFileIL.DefineLabel()
AddSrcFileIL.Emit(OpCodes.Beq, fa166)
AddSrcFileIL.Emit(OpCodes.Br, tru166)
AddSrcFileIL.MarkLabel(tru166)
AddSrcFileIL.MarkSequencePoint(doc3, 64, 1, 64, 100)
AddSrcFileIL.Emit(OpCodes.Br, label0)
AddSrcFileIL.MarkSequencePoint(doc3, 65, 1, 65, 100)
AddSrcFileIL.Emit(OpCodes.Br, cont166)
AddSrcFileIL.MarkLabel(fa166)
AddSrcFileIL.MarkSequencePoint(doc3, 66, 1, 66, 100)
AddSrcFileIL.Emit(OpCodes.Br, label1)
AddSrcFileIL.MarkSequencePoint(doc3, 67, 1, 67, 100)
AddSrcFileIL.Emit(OpCodes.Br, cont166)
AddSrcFileIL.MarkLabel(cont166)
AddSrcFileIL.MarkSequencePoint(doc3, 68, 1, 68, 100)
AddSrcFileIL.Emit(OpCodes.Br, cont165)
AddSrcFileIL.MarkLabel(cont165)
AddSrcFileIL.MarkSequencePoint(doc3, 70, 1, 70, 100)
AddSrcFileIL.MarkLabel(label1)
AddSrcFileIL.MarkSequencePoint(doc3, 72, 1, 72, 100)
AddSrcFileIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
AddSrcFileIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddSrcFileIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddSrcFileIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
AddSrcFileIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
AddSrcFileIL.MarkSequencePoint(doc3, 73, 1, 73, 100)
AddSrcFileIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
AddSrcFileIL.Emit(OpCodes.Stsfld, SrcFiles)
AddSrcFileIL.MarkSequencePoint(doc3, 75, 1, 75, 100)
AddSrcFileIL.Emit(OpCodes.Ret)
Dim PopSrcFile As MethodBuilder = ILEmitter.DefineMethod("PopSrcFile", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim PopSrcFileIL As ILGenerator = PopSrcFile.GetILGenerator()
PopSrcFileIL.MarkSequencePoint(doc3, 79, 1, 79, 100)
Dim locbldr7 As LocalBuilder = PopSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr7.SetLocalSymInfo("len")
PopSrcFileIL.Emit(OpCodes.Ldsfld, SrcFiles)
Typ = SrcFiles.FieldType
PopSrcFileIL.Emit(OpCodes.Ldlen)
PopSrcFileIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Stloc, 0)
PopSrcFileIL.MarkSequencePoint(doc3, 80, 1, 80, 100)
Dim locbldr8 As LocalBuilder = PopSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr8.SetLocalSymInfo("destl")
PopSrcFileIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Sub)
PopSrcFileIL.Emit(OpCodes.Stloc, 1)
PopSrcFileIL.MarkSequencePoint(doc3, 81, 1, 81, 100)
Dim locbldr9 As LocalBuilder = PopSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr9.SetLocalSymInfo("stopel")
PopSrcFileIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Sub)
PopSrcFileIL.Emit(OpCodes.Stloc, 2)
PopSrcFileIL.MarkSequencePoint(doc3, 82, 1, 82, 100)
Dim locbldr10 As LocalBuilder = PopSrcFileIL.DeclareLocal(GetType(System.Int32))
locbldr10.SetLocalSymInfo("i")
PopSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Stloc, 3)
PopSrcFileIL.MarkSequencePoint(doc3, 84, 1, 84, 100)
Dim locbldr11 As LocalBuilder = PopSrcFileIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr11.SetLocalSymInfo("destarr")
PopSrcFileIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Conv_U)
PopSrcFileIL.Emit(OpCodes.Newarr, GetType(System.String))
PopSrcFileIL.Emit(OpCodes.Stloc, 4)
PopSrcFileIL.MarkSequencePoint(doc3, 86, 1, 86, 100)
Dim label2 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
PopSrcFileIL.MarkSequencePoint(doc3, 87, 1, 87, 100)
Dim label3 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
PopSrcFileIL.MarkSequencePoint(doc3, 89, 1, 89, 100)
PopSrcFileIL.MarkLabel(label2)
PopSrcFileIL.MarkSequencePoint(doc3, 91, 1, 91, 100)
PopSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Add)
PopSrcFileIL.Emit(OpCodes.Stloc, 3)
PopSrcFileIL.MarkSequencePoint(doc3, 93, 1, 93, 100)
PopSrcFileIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa167 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
Dim tru167 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
Dim cont167 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
PopSrcFileIL.Emit(OpCodes.Bgt, tru167)
PopSrcFileIL.Emit(OpCodes.Br, fa167)
PopSrcFileIL.MarkLabel(tru167)
PopSrcFileIL.MarkSequencePoint(doc3, 95, 1, 95, 100)
PopSrcFileIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
PopSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Conv_U)
Typ = Typ02
PopSrcFileIL.Emit(OpCodes.Ldsfld, SrcFiles)
Typ = SrcFiles.FieldType
Typ02 = Typ
PopSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Conv_U)
Typ = Typ02
PopSrcFileIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
PopSrcFileIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
PopSrcFileIL.MarkSequencePoint(doc3, 97, 1, 97, 100)
PopSrcFileIL.Emit(OpCodes.Br, cont167)
PopSrcFileIL.MarkLabel(fa167)
PopSrcFileIL.Emit(OpCodes.Br, cont167)
PopSrcFileIL.MarkLabel(cont167)
PopSrcFileIL.MarkSequencePoint(doc3, 99, 1, 99, 100)
PopSrcFileIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa168 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
Dim tru168 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
Dim cont168 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
PopSrcFileIL.Emit(OpCodes.Beq, tru168)
PopSrcFileIL.Emit(OpCodes.Br, fa168)
PopSrcFileIL.MarkLabel(tru168)
PopSrcFileIL.MarkSequencePoint(doc3, 100, 1, 100, 100)
PopSrcFileIL.Emit(OpCodes.Br, label3)
PopSrcFileIL.MarkSequencePoint(doc3, 101, 1, 101, 100)
PopSrcFileIL.Emit(OpCodes.Br, cont168)
PopSrcFileIL.MarkLabel(fa168)
PopSrcFileIL.MarkSequencePoint(doc3, 102, 1, 102, 100)
PopSrcFileIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
PopSrcFileIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa169 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
Dim tru169 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
Dim cont169 As System.Reflection.Emit.Label = PopSrcFileIL.DefineLabel()
PopSrcFileIL.Emit(OpCodes.Beq, fa169)
PopSrcFileIL.Emit(OpCodes.Br, tru169)
PopSrcFileIL.MarkLabel(tru169)
PopSrcFileIL.MarkSequencePoint(doc3, 103, 1, 103, 100)
PopSrcFileIL.Emit(OpCodes.Br, label2)
PopSrcFileIL.MarkSequencePoint(doc3, 104, 1, 104, 100)
PopSrcFileIL.Emit(OpCodes.Br, cont169)
PopSrcFileIL.MarkLabel(fa169)
PopSrcFileIL.MarkSequencePoint(doc3, 105, 1, 105, 100)
PopSrcFileIL.Emit(OpCodes.Br, label3)
PopSrcFileIL.MarkSequencePoint(doc3, 106, 1, 106, 100)
PopSrcFileIL.Emit(OpCodes.Br, cont169)
PopSrcFileIL.MarkLabel(cont169)
PopSrcFileIL.MarkSequencePoint(doc3, 107, 1, 107, 100)
PopSrcFileIL.Emit(OpCodes.Br, cont168)
PopSrcFileIL.MarkLabel(cont168)
PopSrcFileIL.MarkSequencePoint(doc3, 109, 1, 109, 100)
PopSrcFileIL.MarkLabel(label3)
PopSrcFileIL.MarkSequencePoint(doc3, 111, 1, 111, 100)
PopSrcFileIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
PopSrcFileIL.Emit(OpCodes.Stsfld, SrcFiles)
PopSrcFileIL.MarkSequencePoint(doc3, 113, 1, 113, 100)
PopSrcFileIL.Emit(OpCodes.Ret)
Dim typ1(-1) As Type
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = GetType(ISymbolDocumentWriter)
Dim AddDocWriter As MethodBuilder = ILEmitter.DefineMethod("AddDocWriter", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ1)
Dim AddDocWriterIL As ILGenerator = AddDocWriter.GetILGenerator()
Dim AddDocWriterparam01 As ParameterBuilder = AddDocWriter.DefineParameter(1, ParameterAttributes.None, "srcf")
AddDocWriterIL.MarkSequencePoint(doc3, 117, 1, 117, 100)
Dim locbldr12 As LocalBuilder = AddDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr12.SetLocalSymInfo("len")
AddDocWriterIL.Emit(OpCodes.Ldsfld, DocWriters)
Typ = DocWriters.FieldType
AddDocWriterIL.Emit(OpCodes.Ldlen)
AddDocWriterIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Stloc, 0)
AddDocWriterIL.MarkSequencePoint(doc3, 118, 1, 118, 100)
Dim locbldr13 As LocalBuilder = AddDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr13.SetLocalSymInfo("destl")
AddDocWriterIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Add)
AddDocWriterIL.Emit(OpCodes.Stloc, 1)
AddDocWriterIL.MarkSequencePoint(doc3, 119, 1, 119, 100)
Dim locbldr14 As LocalBuilder = AddDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr14.SetLocalSymInfo("stopel")
AddDocWriterIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Sub)
AddDocWriterIL.Emit(OpCodes.Stloc, 2)
AddDocWriterIL.MarkSequencePoint(doc3, 120, 1, 120, 100)
Dim locbldr15 As LocalBuilder = AddDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr15.SetLocalSymInfo("i")
AddDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Stloc, 3)
AddDocWriterIL.MarkSequencePoint(doc3, 122, 1, 122, 100)
Dim locbldr16 As LocalBuilder = AddDocWriterIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr16.SetLocalSymInfo("destarr")
AddDocWriterIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Conv_U)
AddDocWriterIL.Emit(OpCodes.Newarr, GetType(ISymbolDocumentWriter))
AddDocWriterIL.Emit(OpCodes.Stloc, 4)
AddDocWriterIL.MarkSequencePoint(doc3, 124, 1, 124, 100)
Dim label4 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
AddDocWriterIL.MarkSequencePoint(doc3, 125, 1, 125, 100)
Dim label5 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
AddDocWriterIL.MarkSequencePoint(doc3, 127, 1, 127, 100)
AddDocWriterIL.MarkLabel(label4)
AddDocWriterIL.MarkSequencePoint(doc3, 129, 1, 129, 100)
AddDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Add)
AddDocWriterIL.Emit(OpCodes.Stloc, 3)
AddDocWriterIL.MarkSequencePoint(doc3, 131, 1, 131, 100)
AddDocWriterIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa170 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
Dim tru170 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
Dim cont170 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
AddDocWriterIL.Emit(OpCodes.Bgt, tru170)
AddDocWriterIL.Emit(OpCodes.Br, fa170)
AddDocWriterIL.MarkLabel(tru170)
AddDocWriterIL.MarkSequencePoint(doc3, 133, 1, 133, 100)
AddDocWriterIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
AddDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddDocWriterIL.Emit(OpCodes.Ldsfld, DocWriters)
Typ = DocWriters.FieldType
Typ02 = Typ
AddDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddDocWriterIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
AddDocWriterIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
AddDocWriterIL.MarkSequencePoint(doc3, 135, 1, 135, 100)
AddDocWriterIL.Emit(OpCodes.Br, cont170)
AddDocWriterIL.MarkLabel(fa170)
AddDocWriterIL.Emit(OpCodes.Br, cont170)
AddDocWriterIL.MarkLabel(cont170)
AddDocWriterIL.MarkSequencePoint(doc3, 137, 1, 137, 100)
AddDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa171 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
Dim tru171 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
Dim cont171 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
AddDocWriterIL.Emit(OpCodes.Beq, tru171)
AddDocWriterIL.Emit(OpCodes.Br, fa171)
AddDocWriterIL.MarkLabel(tru171)
AddDocWriterIL.MarkSequencePoint(doc3, 138, 1, 138, 100)
AddDocWriterIL.Emit(OpCodes.Br, label5)
AddDocWriterIL.MarkSequencePoint(doc3, 139, 1, 139, 100)
AddDocWriterIL.Emit(OpCodes.Br, cont171)
AddDocWriterIL.MarkLabel(fa171)
AddDocWriterIL.MarkSequencePoint(doc3, 140, 1, 140, 100)
AddDocWriterIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa172 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
Dim tru172 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
Dim cont172 As System.Reflection.Emit.Label = AddDocWriterIL.DefineLabel()
AddDocWriterIL.Emit(OpCodes.Beq, fa172)
AddDocWriterIL.Emit(OpCodes.Br, tru172)
AddDocWriterIL.MarkLabel(tru172)
AddDocWriterIL.MarkSequencePoint(doc3, 141, 1, 141, 100)
AddDocWriterIL.Emit(OpCodes.Br, label4)
AddDocWriterIL.MarkSequencePoint(doc3, 142, 1, 142, 100)
AddDocWriterIL.Emit(OpCodes.Br, cont172)
AddDocWriterIL.MarkLabel(fa172)
AddDocWriterIL.MarkSequencePoint(doc3, 143, 1, 143, 100)
AddDocWriterIL.Emit(OpCodes.Br, label5)
AddDocWriterIL.MarkSequencePoint(doc3, 144, 1, 144, 100)
AddDocWriterIL.Emit(OpCodes.Br, cont172)
AddDocWriterIL.MarkLabel(cont172)
AddDocWriterIL.MarkSequencePoint(doc3, 145, 1, 145, 100)
AddDocWriterIL.Emit(OpCodes.Br, cont171)
AddDocWriterIL.MarkLabel(cont171)
AddDocWriterIL.MarkSequencePoint(doc3, 147, 1, 147, 100)
AddDocWriterIL.MarkLabel(label5)
AddDocWriterIL.MarkSequencePoint(doc3, 149, 1, 149, 100)
AddDocWriterIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
AddDocWriterIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddDocWriterIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddDocWriterIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ISymbolDocumentWriter)
AddDocWriterIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
AddDocWriterIL.MarkSequencePoint(doc3, 150, 1, 150, 100)
AddDocWriterIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
AddDocWriterIL.Emit(OpCodes.Stsfld, DocWriters)
AddDocWriterIL.MarkSequencePoint(doc3, 152, 1, 152, 100)
AddDocWriterIL.Emit(OpCodes.Ret)
Dim PopDocWriter As MethodBuilder = ILEmitter.DefineMethod("PopDocWriter", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim PopDocWriterIL As ILGenerator = PopDocWriter.GetILGenerator()
PopDocWriterIL.MarkSequencePoint(doc3, 156, 1, 156, 100)
Dim locbldr17 As LocalBuilder = PopDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr17.SetLocalSymInfo("len")
PopDocWriterIL.Emit(OpCodes.Ldsfld, DocWriters)
Typ = DocWriters.FieldType
PopDocWriterIL.Emit(OpCodes.Ldlen)
PopDocWriterIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Stloc, 0)
PopDocWriterIL.MarkSequencePoint(doc3, 157, 1, 157, 100)
Dim locbldr18 As LocalBuilder = PopDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr18.SetLocalSymInfo("destl")
PopDocWriterIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Sub)
PopDocWriterIL.Emit(OpCodes.Stloc, 1)
PopDocWriterIL.MarkSequencePoint(doc3, 158, 1, 158, 100)
Dim locbldr19 As LocalBuilder = PopDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr19.SetLocalSymInfo("stopel")
PopDocWriterIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Sub)
PopDocWriterIL.Emit(OpCodes.Stloc, 2)
PopDocWriterIL.MarkSequencePoint(doc3, 159, 1, 159, 100)
Dim locbldr20 As LocalBuilder = PopDocWriterIL.DeclareLocal(GetType(System.Int32))
locbldr20.SetLocalSymInfo("i")
PopDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Stloc, 3)
PopDocWriterIL.MarkSequencePoint(doc3, 161, 1, 161, 100)
Dim locbldr21 As LocalBuilder = PopDocWriterIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr21.SetLocalSymInfo("destarr")
PopDocWriterIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Conv_U)
PopDocWriterIL.Emit(OpCodes.Newarr, GetType(ISymbolDocumentWriter))
PopDocWriterIL.Emit(OpCodes.Stloc, 4)
PopDocWriterIL.MarkSequencePoint(doc3, 163, 1, 163, 100)
Dim label6 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
PopDocWriterIL.MarkSequencePoint(doc3, 164, 1, 164, 100)
Dim label7 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
PopDocWriterIL.MarkSequencePoint(doc3, 166, 1, 166, 100)
PopDocWriterIL.MarkLabel(label6)
PopDocWriterIL.MarkSequencePoint(doc3, 168, 1, 168, 100)
PopDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Add)
PopDocWriterIL.Emit(OpCodes.Stloc, 3)
PopDocWriterIL.MarkSequencePoint(doc3, 170, 1, 170, 100)
PopDocWriterIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa173 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
Dim tru173 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
Dim cont173 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
PopDocWriterIL.Emit(OpCodes.Bgt, tru173)
PopDocWriterIL.Emit(OpCodes.Br, fa173)
PopDocWriterIL.MarkLabel(tru173)
PopDocWriterIL.MarkSequencePoint(doc3, 172, 1, 172, 100)
PopDocWriterIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
PopDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Conv_U)
Typ = Typ02
PopDocWriterIL.Emit(OpCodes.Ldsfld, DocWriters)
Typ = DocWriters.FieldType
Typ02 = Typ
PopDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Conv_U)
Typ = Typ02
PopDocWriterIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
PopDocWriterIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
PopDocWriterIL.MarkSequencePoint(doc3, 174, 1, 174, 100)
PopDocWriterIL.Emit(OpCodes.Br, cont173)
PopDocWriterIL.MarkLabel(fa173)
PopDocWriterIL.Emit(OpCodes.Br, cont173)
PopDocWriterIL.MarkLabel(cont173)
PopDocWriterIL.MarkSequencePoint(doc3, 176, 1, 176, 100)
PopDocWriterIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa174 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
Dim tru174 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
Dim cont174 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
PopDocWriterIL.Emit(OpCodes.Beq, tru174)
PopDocWriterIL.Emit(OpCodes.Br, fa174)
PopDocWriterIL.MarkLabel(tru174)
PopDocWriterIL.MarkSequencePoint(doc3, 177, 1, 177, 100)
PopDocWriterIL.Emit(OpCodes.Br, label7)
PopDocWriterIL.MarkSequencePoint(doc3, 178, 1, 178, 100)
PopDocWriterIL.Emit(OpCodes.Br, cont174)
PopDocWriterIL.MarkLabel(fa174)
PopDocWriterIL.MarkSequencePoint(doc3, 179, 1, 179, 100)
PopDocWriterIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
PopDocWriterIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa175 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
Dim tru175 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
Dim cont175 As System.Reflection.Emit.Label = PopDocWriterIL.DefineLabel()
PopDocWriterIL.Emit(OpCodes.Beq, fa175)
PopDocWriterIL.Emit(OpCodes.Br, tru175)
PopDocWriterIL.MarkLabel(tru175)
PopDocWriterIL.MarkSequencePoint(doc3, 180, 1, 180, 100)
PopDocWriterIL.Emit(OpCodes.Br, label6)
PopDocWriterIL.MarkSequencePoint(doc3, 181, 1, 181, 100)
PopDocWriterIL.Emit(OpCodes.Br, cont175)
PopDocWriterIL.MarkLabel(fa175)
PopDocWriterIL.MarkSequencePoint(doc3, 182, 1, 182, 100)
PopDocWriterIL.Emit(OpCodes.Br, label7)
PopDocWriterIL.MarkSequencePoint(doc3, 183, 1, 183, 100)
PopDocWriterIL.Emit(OpCodes.Br, cont175)
PopDocWriterIL.MarkLabel(cont175)
PopDocWriterIL.MarkSequencePoint(doc3, 184, 1, 184, 100)
PopDocWriterIL.Emit(OpCodes.Br, cont174)
PopDocWriterIL.MarkLabel(cont174)
PopDocWriterIL.MarkSequencePoint(doc3, 186, 1, 186, 100)
PopDocWriterIL.MarkLabel(label7)
PopDocWriterIL.MarkSequencePoint(doc3, 188, 1, 188, 100)
PopDocWriterIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
PopDocWriterIL.Emit(OpCodes.Stsfld, DocWriters)
PopDocWriterIL.MarkSequencePoint(doc3, 190, 1, 190, 100)
PopDocWriterIL.Emit(OpCodes.Ret)
Dim EmitRet As MethodBuilder = ILEmitter.DefineMethod("EmitRet", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitRetIL As ILGenerator = EmitRet.GetILGenerator()
EmitRetIL.MarkSequencePoint(doc3, 194, 1, 194, 100)
Dim locbldr22 As LocalBuilder = EmitRetIL.DeclareLocal(GetType(OpCode))
locbldr22.SetLocalSymInfo("op")
Dim typ2(-1) As Type
EmitRetIL.Emit(OpCodes.Ldstr, "ret")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
EmitRetIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ2))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ2).ReturnType
EmitRetIL.Emit(OpCodes.Stloc, 0)
EmitRetIL.MarkSequencePoint(doc3, 195, 1, 195, 100)
Dim typ3(-1) As Type
EmitRetIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitRetIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
EmitRetIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ3))
Typ = Typ03.GetMethod("Emit", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitRetIL.Emit(OpCodes.Pop)
End If
EmitRetIL.MarkSequencePoint(doc3, 196, 1, 196, 100)
EmitRetIL.Emit(OpCodes.Ret)
Dim EmitDup As MethodBuilder = ILEmitter.DefineMethod("EmitDup", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitDupIL As ILGenerator = EmitDup.GetILGenerator()
EmitDupIL.MarkSequencePoint(doc3, 199, 1, 199, 100)
Dim locbldr23 As LocalBuilder = EmitDupIL.DeclareLocal(GetType(OpCode))
locbldr23.SetLocalSymInfo("op")
Dim typ4(-1) As Type
EmitDupIL.Emit(OpCodes.Ldstr, "dup")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
EmitDupIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ4))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ4).ReturnType
EmitDupIL.Emit(OpCodes.Stloc, 0)
EmitDupIL.MarkSequencePoint(doc3, 200, 1, 200, 100)
Dim typ5(-1) As Type
EmitDupIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitDupIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
EmitDupIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ5))
Typ = Typ03.GetMethod("Emit", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitDupIL.Emit(OpCodes.Pop)
End If
EmitDupIL.MarkSequencePoint(doc3, 201, 1, 201, 100)
EmitDupIL.Emit(OpCodes.Ret)
Dim EmitPop As MethodBuilder = ILEmitter.DefineMethod("EmitPop", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitPopIL As ILGenerator = EmitPop.GetILGenerator()
EmitPopIL.MarkSequencePoint(doc3, 204, 1, 204, 100)
Dim locbldr24 As LocalBuilder = EmitPopIL.DeclareLocal(GetType(OpCode))
locbldr24.SetLocalSymInfo("op")
Dim typ6(-1) As Type
EmitPopIL.Emit(OpCodes.Ldstr, "pop")
Typ = GetType(System.String)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
EmitPopIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ6))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ6).ReturnType
EmitPopIL.Emit(OpCodes.Stloc, 0)
EmitPopIL.MarkSequencePoint(doc3, 205, 1, 205, 100)
Dim typ7(-1) As Type
EmitPopIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitPopIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
EmitPopIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ7))
Typ = Typ03.GetMethod("Emit", typ7).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitPopIL.Emit(OpCodes.Pop)
End If
EmitPopIL.MarkSequencePoint(doc3, 206, 1, 206, 100)
EmitPopIL.Emit(OpCodes.Ret)
Dim typ8(-1) As Type
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = GetType(System.Type)
Dim EmitBox As MethodBuilder = ILEmitter.DefineMethod("EmitBox", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ8)
Dim EmitBoxIL As ILGenerator = EmitBox.GetILGenerator()
Dim EmitBoxparam01 As ParameterBuilder = EmitBox.DefineParameter(1, ParameterAttributes.None, "t")
EmitBoxIL.MarkSequencePoint(doc3, 209, 1, 209, 100)
Dim locbldr25 As LocalBuilder = EmitBoxIL.DeclareLocal(GetType(OpCode))
locbldr25.SetLocalSymInfo("op")
Dim typ9(-1) As Type
EmitBoxIL.Emit(OpCodes.Ldstr, "box")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
EmitBoxIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ9))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ9).ReturnType
EmitBoxIL.Emit(OpCodes.Stloc, 0)
EmitBoxIL.MarkSequencePoint(doc3, 210, 1, 210, 100)
Dim typ10(-1) As Type
EmitBoxIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBoxIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
EmitBoxIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
EmitBoxIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ10))
Typ = Typ03.GetMethod("Emit", typ10).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBoxIL.Emit(OpCodes.Pop)
End If
EmitBoxIL.MarkSequencePoint(doc3, 211, 1, 211, 100)
EmitBoxIL.Emit(OpCodes.Ret)
Dim typ11(-1) As Type
ReDim Preserve typ11(UBound(typ11) + 1)
typ11(UBound(typ11)) = GetType(System.Type)
Dim EmitUnbox As MethodBuilder = ILEmitter.DefineMethod("EmitUnbox", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ11)
Dim EmitUnboxIL As ILGenerator = EmitUnbox.GetILGenerator()
Dim EmitUnboxparam01 As ParameterBuilder = EmitUnbox.DefineParameter(1, ParameterAttributes.None, "t")
EmitUnboxIL.MarkSequencePoint(doc3, 214, 1, 214, 100)
Dim locbldr26 As LocalBuilder = EmitUnboxIL.DeclareLocal(GetType(OpCode))
locbldr26.SetLocalSymInfo("op")
Dim typ12(-1) As Type
EmitUnboxIL.Emit(OpCodes.Ldstr, "unbox")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
EmitUnboxIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ12))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ12).ReturnType
EmitUnboxIL.Emit(OpCodes.Stloc, 0)
EmitUnboxIL.MarkSequencePoint(doc3, 215, 1, 215, 100)
Dim typ13(-1) As Type
EmitUnboxIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitUnboxIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
EmitUnboxIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
EmitUnboxIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ13))
Typ = Typ03.GetMethod("Emit", typ13).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitUnboxIL.Emit(OpCodes.Pop)
End If
EmitUnboxIL.MarkSequencePoint(doc3, 216, 1, 216, 100)
EmitUnboxIL.Emit(OpCodes.Ret)
Dim typ14(-1) As Type
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = GetType(System.Type)
Dim EmitUnboxAny As MethodBuilder = ILEmitter.DefineMethod("EmitUnboxAny", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ14)
Dim EmitUnboxAnyIL As ILGenerator = EmitUnboxAny.GetILGenerator()
Dim EmitUnboxAnyparam01 As ParameterBuilder = EmitUnboxAny.DefineParameter(1, ParameterAttributes.None, "t")
EmitUnboxAnyIL.MarkSequencePoint(doc3, 219, 1, 219, 100)
Dim locbldr27 As LocalBuilder = EmitUnboxAnyIL.DeclareLocal(GetType(OpCode))
locbldr27.SetLocalSymInfo("op")
Dim typ15(-1) As Type
EmitUnboxAnyIL.Emit(OpCodes.Ldstr, "unbox.any")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
EmitUnboxAnyIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ15))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ15).ReturnType
EmitUnboxAnyIL.Emit(OpCodes.Stloc, 0)
EmitUnboxAnyIL.MarkSequencePoint(doc3, 220, 1, 220, 100)
Dim typ16(-1) As Type
EmitUnboxAnyIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitUnboxAnyIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ16(UBound(typ16) + 1)
typ16(UBound(typ16)) = Typ
EmitUnboxAnyIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ16(UBound(typ16) + 1)
typ16(UBound(typ16)) = Typ
EmitUnboxAnyIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ16))
Typ = Typ03.GetMethod("Emit", typ16).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitUnboxAnyIL.Emit(OpCodes.Pop)
End If
EmitUnboxAnyIL.MarkSequencePoint(doc3, 221, 1, 221, 100)
EmitUnboxAnyIL.Emit(OpCodes.Ret)
Dim typ17(-1) As Type
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = GetType(System.Type)
Dim EmitCastclass As MethodBuilder = ILEmitter.DefineMethod("EmitCastclass", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ17)
Dim EmitCastclassIL As ILGenerator = EmitCastclass.GetILGenerator()
Dim EmitCastclassparam01 As ParameterBuilder = EmitCastclass.DefineParameter(1, ParameterAttributes.None, "t")
EmitCastclassIL.MarkSequencePoint(doc3, 224, 1, 224, 100)
Dim locbldr28 As LocalBuilder = EmitCastclassIL.DeclareLocal(GetType(OpCode))
locbldr28.SetLocalSymInfo("op")
Dim typ18(-1) As Type
EmitCastclassIL.Emit(OpCodes.Ldstr, "castclass")
Typ = GetType(System.String)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
EmitCastclassIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ18))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ18).ReturnType
EmitCastclassIL.Emit(OpCodes.Stloc, 0)
EmitCastclassIL.MarkSequencePoint(doc3, 225, 1, 225, 100)
Dim typ19(-1) As Type
EmitCastclassIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCastclassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
EmitCastclassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
EmitCastclassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ19))
Typ = Typ03.GetMethod("Emit", typ19).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCastclassIL.Emit(OpCodes.Pop)
End If
EmitCastclassIL.MarkSequencePoint(doc3, 226, 1, 226, 100)
EmitCastclassIL.Emit(OpCodes.Ret)
Dim typ20(-1) As Type
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = GetType(System.Type)
Dim EmitIsinst As MethodBuilder = ILEmitter.DefineMethod("EmitIsinst", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ20)
Dim EmitIsinstIL As ILGenerator = EmitIsinst.GetILGenerator()
Dim EmitIsinstparam01 As ParameterBuilder = EmitIsinst.DefineParameter(1, ParameterAttributes.None, "t")
EmitIsinstIL.MarkSequencePoint(doc3, 229, 1, 229, 100)
Dim locbldr29 As LocalBuilder = EmitIsinstIL.DeclareLocal(GetType(OpCode))
locbldr29.SetLocalSymInfo("op")
Dim typ21(-1) As Type
EmitIsinstIL.Emit(OpCodes.Ldstr, "isinst")
Typ = GetType(System.String)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
EmitIsinstIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ21))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ21).ReturnType
EmitIsinstIL.Emit(OpCodes.Stloc, 0)
EmitIsinstIL.MarkSequencePoint(doc3, 230, 1, 230, 100)
Dim typ22(-1) As Type
EmitIsinstIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitIsinstIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
EmitIsinstIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
EmitIsinstIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ22))
Typ = Typ03.GetMethod("Emit", typ22).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitIsinstIL.Emit(OpCodes.Pop)
End If
EmitIsinstIL.MarkSequencePoint(doc3, 231, 1, 231, 100)
EmitIsinstIL.Emit(OpCodes.Ret)
Dim typ23(-1) As Type
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.Type)
Dim EmitIs As MethodBuilder = ILEmitter.DefineMethod("EmitIs", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ23)
Dim EmitIsIL As ILGenerator = EmitIs.GetILGenerator()
Dim EmitIsparam01 As ParameterBuilder = EmitIs.DefineParameter(1, ParameterAttributes.None, "t")
EmitIsIL.MarkSequencePoint(doc3, 234, 1, 234, 100)
Dim locbldr30 As LocalBuilder = EmitIsIL.DeclareLocal(GetType(OpCode))
locbldr30.SetLocalSymInfo("op")
Dim typ24(-1) As Type
EmitIsIL.Emit(OpCodes.Ldstr, "isinst")
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
EmitIsIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ24))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ24).ReturnType
EmitIsIL.Emit(OpCodes.Stloc, 0)
EmitIsIL.MarkSequencePoint(doc3, 235, 1, 235, 100)
Dim typ25(-1) As Type
EmitIsIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitIsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
EmitIsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
EmitIsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ25))
Typ = Typ03.GetMethod("Emit", typ25).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitIsIL.Emit(OpCodes.Pop)
End If
EmitIsIL.MarkSequencePoint(doc3, 236, 1, 236, 100)
Dim typ26(-1) As Type
EmitIsIL.Emit(OpCodes.Ldstr, "ldnull")
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
EmitIsIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ26))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ26).ReturnType
EmitIsIL.Emit(OpCodes.Stloc, 0)
EmitIsIL.MarkSequencePoint(doc3, 237, 1, 237, 100)
Dim typ27(-1) As Type
EmitIsIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitIsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
EmitIsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ27))
Typ = Typ03.GetMethod("Emit", typ27).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitIsIL.Emit(OpCodes.Pop)
End If
EmitIsIL.MarkSequencePoint(doc3, 238, 1, 238, 100)
Dim typ28(-1) As Type
EmitIsIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
EmitIsIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ28))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ28).ReturnType
EmitIsIL.Emit(OpCodes.Stloc, 0)
EmitIsIL.MarkSequencePoint(doc3, 239, 1, 239, 100)
Dim typ29(-1) As Type
EmitIsIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitIsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
EmitIsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ29))
Typ = Typ03.GetMethod("Emit", typ29).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitIsIL.Emit(OpCodes.Pop)
End If
EmitIsIL.MarkSequencePoint(doc3, 240, 1, 240, 100)
Dim typ30(-1) As Type
EmitIsIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
EmitIsIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ30))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ30).ReturnType
EmitIsIL.Emit(OpCodes.Stloc, 0)
EmitIsIL.MarkSequencePoint(doc3, 241, 1, 241, 100)
Dim typ31(-1) As Type
EmitIsIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitIsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
EmitIsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ31))
Typ = Typ03.GetMethod("Emit", typ31).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitIsIL.Emit(OpCodes.Pop)
End If
EmitIsIL.MarkSequencePoint(doc3, 242, 1, 242, 100)
Dim typ32(-1) As Type
EmitIsIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
EmitIsIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ32))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ32).ReturnType
EmitIsIL.Emit(OpCodes.Stloc, 0)
EmitIsIL.MarkSequencePoint(doc3, 243, 1, 243, 100)
Dim typ33(-1) As Type
EmitIsIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitIsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
EmitIsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ33))
Typ = Typ03.GetMethod("Emit", typ33).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitIsIL.Emit(OpCodes.Pop)
End If
EmitIsIL.MarkSequencePoint(doc3, 244, 1, 244, 100)
EmitIsIL.Emit(OpCodes.Ret)
Dim typ34(-1) As Type
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = GetType(System.Type)
Dim EmitConstrained As MethodBuilder = ILEmitter.DefineMethod("EmitConstrained", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ34)
Dim EmitConstrainedIL As ILGenerator = EmitConstrained.GetILGenerator()
Dim EmitConstrainedparam01 As ParameterBuilder = EmitConstrained.DefineParameter(1, ParameterAttributes.None, "t")
EmitConstrainedIL.MarkSequencePoint(doc3, 247, 1, 247, 100)
Dim locbldr31 As LocalBuilder = EmitConstrainedIL.DeclareLocal(GetType(OpCode))
locbldr31.SetLocalSymInfo("op")
Dim typ35(-1) As Type
EmitConstrainedIL.Emit(OpCodes.Ldstr, "constrained.")
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
EmitConstrainedIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ35))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ35).ReturnType
EmitConstrainedIL.Emit(OpCodes.Stloc, 0)
EmitConstrainedIL.MarkSequencePoint(doc3, 248, 1, 248, 100)
Dim typ36(-1) As Type
EmitConstrainedIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConstrainedIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
EmitConstrainedIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
EmitConstrainedIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ36))
Typ = Typ03.GetMethod("Emit", typ36).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConstrainedIL.Emit(OpCodes.Pop)
End If
EmitConstrainedIL.MarkSequencePoint(doc3, 249, 1, 249, 100)
EmitConstrainedIL.Emit(OpCodes.Ret)
Dim typ37(-1) As Type
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = GetType(System.Int32)
Dim EmitLdloc As MethodBuilder = ILEmitter.DefineMethod("EmitLdloc", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ37)
Dim EmitLdlocIL As ILGenerator = EmitLdloc.GetILGenerator()
Dim EmitLdlocparam01 As ParameterBuilder = EmitLdloc.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdlocIL.MarkSequencePoint(doc3, 252, 1, 252, 100)
Dim locbldr32 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(OpCode))
locbldr32.SetLocalSymInfo("op")
EmitLdlocIL.MarkSequencePoint(doc3, 253, 1, 253, 100)
Dim locbldr33 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Boolean))
locbldr33.SetLocalSymInfo("b1")
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 1)
EmitLdlocIL.MarkSequencePoint(doc3, 254, 1, 254, 100)
Dim locbldr34 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Boolean))
locbldr34.SetLocalSymInfo("b2")
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 2)
EmitLdlocIL.MarkSequencePoint(doc3, 255, 1, 255, 100)
Dim locbldr35 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Byte))
locbldr35.SetLocalSymInfo("n8")
EmitLdlocIL.MarkSequencePoint(doc3, 256, 1, 256, 100)
Dim locbldr36 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Int16))
locbldr36.SetLocalSymInfo("n16")
EmitLdlocIL.MarkSequencePoint(doc3, 258, 1, 258, 100)
Dim label8 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.MarkSequencePoint(doc3, 260, 1, 260, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa176 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru176 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont176 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru176)
EmitLdlocIL.Emit(OpCodes.Br, fa176)
EmitLdlocIL.MarkLabel(tru176)
EmitLdlocIL.MarkSequencePoint(doc3, 261, 1, 261, 100)
Dim typ38(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.0")
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ38))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ38).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 262, 1, 262, 100)
Dim typ39(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ39))
Typ = Typ03.GetMethod("Emit", typ39).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 263, 1, 263, 100)
EmitLdlocIL.Emit(OpCodes.Br, label8)
EmitLdlocIL.MarkSequencePoint(doc3, 264, 1, 264, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont176)
EmitLdlocIL.MarkLabel(fa176)
EmitLdlocIL.Emit(OpCodes.Br, cont176)
EmitLdlocIL.MarkLabel(cont176)
EmitLdlocIL.MarkSequencePoint(doc3, 266, 1, 266, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa177 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru177 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont177 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru177)
EmitLdlocIL.Emit(OpCodes.Br, fa177)
EmitLdlocIL.MarkLabel(tru177)
EmitLdlocIL.MarkSequencePoint(doc3, 267, 1, 267, 100)
Dim typ40(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.1")
Typ = GetType(System.String)
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ40))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ40).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 268, 1, 268, 100)
Dim typ41(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ41))
Typ = Typ03.GetMethod("Emit", typ41).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 269, 1, 269, 100)
EmitLdlocIL.Emit(OpCodes.Br, label8)
EmitLdlocIL.MarkSequencePoint(doc3, 270, 1, 270, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont177)
EmitLdlocIL.MarkLabel(fa177)
EmitLdlocIL.Emit(OpCodes.Br, cont177)
EmitLdlocIL.MarkLabel(cont177)
EmitLdlocIL.MarkSequencePoint(doc3, 272, 1, 272, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa178 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru178 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont178 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru178)
EmitLdlocIL.Emit(OpCodes.Br, fa178)
EmitLdlocIL.MarkLabel(tru178)
EmitLdlocIL.MarkSequencePoint(doc3, 273, 1, 273, 100)
Dim typ42(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.2")
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ42))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ42).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 274, 1, 274, 100)
Dim typ43(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ43))
Typ = Typ03.GetMethod("Emit", typ43).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 275, 1, 275, 100)
EmitLdlocIL.Emit(OpCodes.Br, label8)
EmitLdlocIL.MarkSequencePoint(doc3, 276, 1, 276, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont178)
EmitLdlocIL.MarkLabel(fa178)
EmitLdlocIL.Emit(OpCodes.Br, cont178)
EmitLdlocIL.MarkLabel(cont178)
EmitLdlocIL.MarkSequencePoint(doc3, 278, 1, 278, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa179 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru179 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont179 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru179)
EmitLdlocIL.Emit(OpCodes.Br, fa179)
EmitLdlocIL.MarkLabel(tru179)
EmitLdlocIL.MarkSequencePoint(doc3, 279, 1, 279, 100)
Dim typ44(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.3")
Typ = GetType(System.String)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ44))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ44).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 280, 1, 280, 100)
Dim typ45(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ45))
Typ = Typ03.GetMethod("Emit", typ45).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 281, 1, 281, 100)
EmitLdlocIL.Emit(OpCodes.Br, label8)
EmitLdlocIL.MarkSequencePoint(doc3, 282, 1, 282, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont179)
EmitLdlocIL.MarkLabel(fa179)
EmitLdlocIL.Emit(OpCodes.Br, cont179)
EmitLdlocIL.MarkLabel(cont179)
EmitLdlocIL.MarkSequencePoint(doc3, 284, 1, 284, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa180 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru180 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont180 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Bge, tru180)
EmitLdlocIL.Emit(OpCodes.Br, fa180)
EmitLdlocIL.MarkLabel(tru180)
EmitLdlocIL.MarkSequencePoint(doc3, 285, 1, 285, 100)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 1)
EmitLdlocIL.MarkSequencePoint(doc3, 286, 1, 286, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont180)
EmitLdlocIL.MarkLabel(fa180)
EmitLdlocIL.Emit(OpCodes.Br, cont180)
EmitLdlocIL.MarkLabel(cont180)
EmitLdlocIL.MarkSequencePoint(doc3, 287, 1, 287, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa181 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru181 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont181 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Ble, tru181)
EmitLdlocIL.Emit(OpCodes.Br, fa181)
EmitLdlocIL.MarkLabel(tru181)
EmitLdlocIL.MarkSequencePoint(doc3, 288, 1, 288, 100)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 2)
EmitLdlocIL.MarkSequencePoint(doc3, 289, 1, 289, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont181)
EmitLdlocIL.MarkLabel(fa181)
EmitLdlocIL.Emit(OpCodes.Br, cont181)
EmitLdlocIL.MarkLabel(cont181)
EmitLdlocIL.MarkSequencePoint(doc3, 290, 1, 290, 100)
EmitLdlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.And)
EmitLdlocIL.Emit(OpCodes.Stloc, 2)
EmitLdlocIL.MarkSequencePoint(doc3, 292, 1, 292, 100)
EmitLdlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa182 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru182 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont182 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru182)
EmitLdlocIL.Emit(OpCodes.Br, fa182)
EmitLdlocIL.MarkLabel(tru182)
EmitLdlocIL.MarkSequencePoint(doc3, 293, 1, 293, 100)
Dim typ46(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.s")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ46))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ46).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 294, 1, 294, 100)
Dim typ47(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ47))
Typ = GetType(Convert).GetMethod("ToByte", typ47).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 3)
EmitLdlocIL.MarkSequencePoint(doc3, 295, 1, 295, 100)
Dim typ48(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ48))
Typ = Typ03.GetMethod("Emit", typ48).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 296, 1, 296, 100)
EmitLdlocIL.Emit(OpCodes.Br, label8)
EmitLdlocIL.MarkSequencePoint(doc3, 297, 1, 297, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont182)
EmitLdlocIL.MarkLabel(fa182)
EmitLdlocIL.Emit(OpCodes.Br, cont182)
EmitLdlocIL.MarkLabel(cont182)
EmitLdlocIL.MarkSequencePoint(doc3, 299, 1, 299, 100)
EmitLdlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa183 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru183 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont183 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru183)
EmitLdlocIL.Emit(OpCodes.Br, fa183)
EmitLdlocIL.MarkLabel(tru183)
EmitLdlocIL.MarkSequencePoint(doc3, 300, 1, 300, 100)
Dim typ49(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc")
Typ = GetType(System.String)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ49))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ49).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 301, 1, 301, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ50 As Type() = {Typ}
EmitLdlocIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ50))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ50).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 4)
EmitLdlocIL.MarkSequencePoint(doc3, 302, 1, 302, 100)
Dim typ51(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ51))
Typ = Typ03.GetMethod("Emit", typ51).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 303, 1, 303, 100)
EmitLdlocIL.Emit(OpCodes.Br, label8)
EmitLdlocIL.MarkSequencePoint(doc3, 304, 1, 304, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont183)
EmitLdlocIL.MarkLabel(fa183)
EmitLdlocIL.Emit(OpCodes.Br, cont183)
EmitLdlocIL.MarkLabel(cont183)
EmitLdlocIL.MarkSequencePoint(doc3, 306, 1, 306, 100)
EmitLdlocIL.MarkLabel(label8)
EmitLdlocIL.MarkSequencePoint(doc3, 307, 1, 307, 100)
EmitLdlocIL.Emit(OpCodes.Ret)
Dim typ52(-1) As Type
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = GetType(System.Int32)
Dim EmitLdloca As MethodBuilder = ILEmitter.DefineMethod("EmitLdloca", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ52)
Dim EmitLdlocaIL As ILGenerator = EmitLdloca.GetILGenerator()
Dim EmitLdlocaparam01 As ParameterBuilder = EmitLdloca.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdlocaIL.MarkSequencePoint(doc3, 310, 1, 310, 100)
Dim locbldr37 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(OpCode))
locbldr37.SetLocalSymInfo("op")
EmitLdlocaIL.MarkSequencePoint(doc3, 311, 1, 311, 100)
Dim locbldr38 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Boolean))
locbldr38.SetLocalSymInfo("b1")
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 1)
EmitLdlocaIL.MarkSequencePoint(doc3, 312, 1, 312, 100)
Dim locbldr39 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Boolean))
locbldr39.SetLocalSymInfo("b2")
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 2)
EmitLdlocaIL.MarkSequencePoint(doc3, 313, 1, 313, 100)
Dim locbldr40 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Byte))
locbldr40.SetLocalSymInfo("n8")
EmitLdlocaIL.MarkSequencePoint(doc3, 314, 1, 314, 100)
Dim locbldr41 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Int16))
locbldr41.SetLocalSymInfo("n16")
EmitLdlocaIL.MarkSequencePoint(doc3, 316, 1, 316, 100)
Dim label9 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.MarkSequencePoint(doc3, 318, 1, 318, 100)
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa184 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru184 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont184 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Bge, tru184)
EmitLdlocaIL.Emit(OpCodes.Br, fa184)
EmitLdlocaIL.MarkLabel(tru184)
EmitLdlocaIL.MarkSequencePoint(doc3, 319, 1, 319, 100)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 1)
EmitLdlocaIL.MarkSequencePoint(doc3, 320, 1, 320, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont184)
EmitLdlocaIL.MarkLabel(fa184)
EmitLdlocaIL.Emit(OpCodes.Br, cont184)
EmitLdlocaIL.MarkLabel(cont184)
EmitLdlocaIL.MarkSequencePoint(doc3, 321, 1, 321, 100)
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa185 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru185 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont185 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Ble, tru185)
EmitLdlocaIL.Emit(OpCodes.Br, fa185)
EmitLdlocaIL.MarkLabel(tru185)
EmitLdlocaIL.MarkSequencePoint(doc3, 322, 1, 322, 100)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 2)
EmitLdlocaIL.MarkSequencePoint(doc3, 323, 1, 323, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont185)
EmitLdlocaIL.MarkLabel(fa185)
EmitLdlocaIL.Emit(OpCodes.Br, cont185)
EmitLdlocaIL.MarkLabel(cont185)
EmitLdlocaIL.MarkSequencePoint(doc3, 324, 1, 324, 100)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.And)
EmitLdlocaIL.Emit(OpCodes.Stloc, 2)
EmitLdlocaIL.MarkSequencePoint(doc3, 326, 1, 326, 100)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa186 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru186 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont186 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Beq, tru186)
EmitLdlocaIL.Emit(OpCodes.Br, fa186)
EmitLdlocaIL.MarkLabel(tru186)
EmitLdlocaIL.MarkSequencePoint(doc3, 327, 1, 327, 100)
Dim typ53(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldstr, "ldloca.s")
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
EmitLdlocaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ53))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ53).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 0)
EmitLdlocaIL.MarkSequencePoint(doc3, 328, 1, 328, 100)
Dim typ54(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
EmitLdlocaIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ54))
Typ = GetType(Convert).GetMethod("ToByte", typ54).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 3)
EmitLdlocaIL.MarkSequencePoint(doc3, 329, 1, 329, 100)
Dim typ55(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
EmitLdlocaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ55))
Typ = Typ03.GetMethod("Emit", typ55).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocaIL.Emit(OpCodes.Pop)
End If
EmitLdlocaIL.MarkSequencePoint(doc3, 330, 1, 330, 100)
EmitLdlocaIL.Emit(OpCodes.Br, label9)
EmitLdlocaIL.MarkSequencePoint(doc3, 331, 1, 331, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont186)
EmitLdlocaIL.MarkLabel(fa186)
EmitLdlocaIL.Emit(OpCodes.Br, cont186)
EmitLdlocaIL.MarkLabel(cont186)
EmitLdlocaIL.MarkSequencePoint(doc3, 333, 1, 333, 100)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa187 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru187 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont187 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Beq, tru187)
EmitLdlocaIL.Emit(OpCodes.Br, fa187)
EmitLdlocaIL.MarkLabel(tru187)
EmitLdlocaIL.MarkSequencePoint(doc3, 334, 1, 334, 100)
Dim typ56(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldstr, "ldloca")
Typ = GetType(System.String)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
EmitLdlocaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ56))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ56).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 0)
EmitLdlocaIL.MarkSequencePoint(doc3, 335, 1, 335, 100)
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ57 As Type() = {Typ}
EmitLdlocaIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ57))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ57).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 4)
EmitLdlocaIL.MarkSequencePoint(doc3, 336, 1, 336, 100)
Dim typ58(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
EmitLdlocaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ58))
Typ = Typ03.GetMethod("Emit", typ58).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocaIL.Emit(OpCodes.Pop)
End If
EmitLdlocaIL.MarkSequencePoint(doc3, 337, 1, 337, 100)
EmitLdlocaIL.Emit(OpCodes.Br, label9)
EmitLdlocaIL.MarkSequencePoint(doc3, 338, 1, 338, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont187)
EmitLdlocaIL.MarkLabel(fa187)
EmitLdlocaIL.Emit(OpCodes.Br, cont187)
EmitLdlocaIL.MarkLabel(cont187)
EmitLdlocaIL.MarkSequencePoint(doc3, 340, 1, 340, 100)
EmitLdlocaIL.MarkLabel(label9)
EmitLdlocaIL.MarkSequencePoint(doc3, 341, 1, 341, 100)
EmitLdlocaIL.Emit(OpCodes.Ret)
Dim typ59(-1) As Type
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = GetType(System.Int32)
Dim EmitLdarg As MethodBuilder = ILEmitter.DefineMethod("EmitLdarg", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ59)
Dim EmitLdargIL As ILGenerator = EmitLdarg.GetILGenerator()
Dim EmitLdargparam01 As ParameterBuilder = EmitLdarg.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdargIL.MarkSequencePoint(doc3, 344, 1, 344, 100)
Dim locbldr42 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(OpCode))
locbldr42.SetLocalSymInfo("op")
EmitLdargIL.MarkSequencePoint(doc3, 345, 1, 345, 100)
Dim locbldr43 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Boolean))
locbldr43.SetLocalSymInfo("b1")
EmitLdargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 1)
EmitLdargIL.MarkSequencePoint(doc3, 346, 1, 346, 100)
Dim locbldr44 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Boolean))
locbldr44.SetLocalSymInfo("b2")
EmitLdargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 2)
EmitLdargIL.MarkSequencePoint(doc3, 347, 1, 347, 100)
Dim locbldr45 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Byte))
locbldr45.SetLocalSymInfo("n8")
EmitLdargIL.MarkSequencePoint(doc3, 348, 1, 348, 100)
Dim locbldr46 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Int16))
locbldr46.SetLocalSymInfo("n16")
EmitLdargIL.MarkSequencePoint(doc3, 350, 1, 350, 100)
Dim label10 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.MarkSequencePoint(doc3, 352, 1, 352, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa188 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru188 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont188 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru188)
EmitLdargIL.Emit(OpCodes.Br, fa188)
EmitLdargIL.MarkLabel(tru188)
EmitLdargIL.MarkSequencePoint(doc3, 353, 1, 353, 100)
Dim typ60(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.0")
Typ = GetType(System.String)
ReDim Preserve typ60(UBound(typ60) + 1)
typ60(UBound(typ60)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ60))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ60).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 354, 1, 354, 100)
Dim typ61(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ61))
Typ = Typ03.GetMethod("Emit", typ61).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 355, 1, 355, 100)
EmitLdargIL.Emit(OpCodes.Br, label10)
EmitLdargIL.MarkSequencePoint(doc3, 356, 1, 356, 100)
EmitLdargIL.Emit(OpCodes.Br, cont188)
EmitLdargIL.MarkLabel(fa188)
EmitLdargIL.Emit(OpCodes.Br, cont188)
EmitLdargIL.MarkLabel(cont188)
EmitLdargIL.MarkSequencePoint(doc3, 358, 1, 358, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa189 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru189 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont189 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru189)
EmitLdargIL.Emit(OpCodes.Br, fa189)
EmitLdargIL.MarkLabel(tru189)
EmitLdargIL.MarkSequencePoint(doc3, 359, 1, 359, 100)
Dim typ62(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.1")
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ62))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ62).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 360, 1, 360, 100)
Dim typ63(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ63))
Typ = Typ03.GetMethod("Emit", typ63).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 361, 1, 361, 100)
EmitLdargIL.Emit(OpCodes.Br, label10)
EmitLdargIL.MarkSequencePoint(doc3, 362, 1, 362, 100)
EmitLdargIL.Emit(OpCodes.Br, cont189)
EmitLdargIL.MarkLabel(fa189)
EmitLdargIL.Emit(OpCodes.Br, cont189)
EmitLdargIL.MarkLabel(cont189)
EmitLdargIL.MarkSequencePoint(doc3, 364, 1, 364, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa190 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru190 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont190 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru190)
EmitLdargIL.Emit(OpCodes.Br, fa190)
EmitLdargIL.MarkLabel(tru190)
EmitLdargIL.MarkSequencePoint(doc3, 365, 1, 365, 100)
Dim typ64(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.2")
Typ = GetType(System.String)
ReDim Preserve typ64(UBound(typ64) + 1)
typ64(UBound(typ64)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ64))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ64).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 366, 1, 366, 100)
Dim typ65(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ65(UBound(typ65) + 1)
typ65(UBound(typ65)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ65))
Typ = Typ03.GetMethod("Emit", typ65).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 367, 1, 367, 100)
EmitLdargIL.Emit(OpCodes.Br, label10)
EmitLdargIL.MarkSequencePoint(doc3, 368, 1, 368, 100)
EmitLdargIL.Emit(OpCodes.Br, cont190)
EmitLdargIL.MarkLabel(fa190)
EmitLdargIL.Emit(OpCodes.Br, cont190)
EmitLdargIL.MarkLabel(cont190)
EmitLdargIL.MarkSequencePoint(doc3, 370, 1, 370, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa191 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru191 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont191 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru191)
EmitLdargIL.Emit(OpCodes.Br, fa191)
EmitLdargIL.MarkLabel(tru191)
EmitLdargIL.MarkSequencePoint(doc3, 371, 1, 371, 100)
Dim typ66(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.3")
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ66))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ66).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 372, 1, 372, 100)
Dim typ67(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ67))
Typ = Typ03.GetMethod("Emit", typ67).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 373, 1, 373, 100)
EmitLdargIL.Emit(OpCodes.Br, label10)
EmitLdargIL.MarkSequencePoint(doc3, 374, 1, 374, 100)
EmitLdargIL.Emit(OpCodes.Br, cont191)
EmitLdargIL.MarkLabel(fa191)
EmitLdargIL.Emit(OpCodes.Br, cont191)
EmitLdargIL.MarkLabel(cont191)
EmitLdargIL.MarkSequencePoint(doc3, 376, 1, 376, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa192 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru192 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont192 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Bge, tru192)
EmitLdargIL.Emit(OpCodes.Br, fa192)
EmitLdargIL.MarkLabel(tru192)
EmitLdargIL.MarkSequencePoint(doc3, 377, 1, 377, 100)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 1)
EmitLdargIL.MarkSequencePoint(doc3, 378, 1, 378, 100)
EmitLdargIL.Emit(OpCodes.Br, cont192)
EmitLdargIL.MarkLabel(fa192)
EmitLdargIL.Emit(OpCodes.Br, cont192)
EmitLdargIL.MarkLabel(cont192)
EmitLdargIL.MarkSequencePoint(doc3, 379, 1, 379, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa193 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru193 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont193 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Ble, tru193)
EmitLdargIL.Emit(OpCodes.Br, fa193)
EmitLdargIL.MarkLabel(tru193)
EmitLdargIL.MarkSequencePoint(doc3, 380, 1, 380, 100)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 2)
EmitLdargIL.MarkSequencePoint(doc3, 381, 1, 381, 100)
EmitLdargIL.Emit(OpCodes.Br, cont193)
EmitLdargIL.MarkLabel(fa193)
EmitLdargIL.Emit(OpCodes.Br, cont193)
EmitLdargIL.MarkLabel(cont193)
EmitLdargIL.MarkSequencePoint(doc3, 382, 1, 382, 100)
EmitLdargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.And)
EmitLdargIL.Emit(OpCodes.Stloc, 2)
EmitLdargIL.MarkSequencePoint(doc3, 384, 1, 384, 100)
EmitLdargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa194 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru194 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont194 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru194)
EmitLdargIL.Emit(OpCodes.Br, fa194)
EmitLdargIL.MarkLabel(tru194)
EmitLdargIL.MarkSequencePoint(doc3, 385, 1, 385, 100)
Dim typ68(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.s")
Typ = GetType(System.String)
ReDim Preserve typ68(UBound(typ68) + 1)
typ68(UBound(typ68)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ68))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ68).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 386, 1, 386, 100)
Dim typ69(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ69(UBound(typ69) + 1)
typ69(UBound(typ69)) = Typ
EmitLdargIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ69))
Typ = GetType(Convert).GetMethod("ToByte", typ69).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 3)
EmitLdargIL.MarkSequencePoint(doc3, 387, 1, 387, 100)
Dim typ70(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ70))
Typ = Typ03.GetMethod("Emit", typ70).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 388, 1, 388, 100)
EmitLdargIL.Emit(OpCodes.Br, label10)
EmitLdargIL.MarkSequencePoint(doc3, 389, 1, 389, 100)
EmitLdargIL.Emit(OpCodes.Br, cont194)
EmitLdargIL.MarkLabel(fa194)
EmitLdargIL.Emit(OpCodes.Br, cont194)
EmitLdargIL.MarkLabel(cont194)
EmitLdargIL.MarkSequencePoint(doc3, 391, 1, 391, 100)
EmitLdargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa195 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru195 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont195 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru195)
EmitLdargIL.Emit(OpCodes.Br, fa195)
EmitLdargIL.MarkLabel(tru195)
EmitLdargIL.MarkSequencePoint(doc3, 392, 1, 392, 100)
Dim typ71(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg")
Typ = GetType(System.String)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ71))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ71).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 393, 1, 393, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ72 As Type() = {Typ}
EmitLdargIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ72))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ72).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 4)
EmitLdargIL.MarkSequencePoint(doc3, 394, 1, 394, 100)
Dim typ73(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ73))
Typ = Typ03.GetMethod("Emit", typ73).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 395, 1, 395, 100)
EmitLdargIL.Emit(OpCodes.Br, label10)
EmitLdargIL.MarkSequencePoint(doc3, 396, 1, 396, 100)
EmitLdargIL.Emit(OpCodes.Br, cont195)
EmitLdargIL.MarkLabel(fa195)
EmitLdargIL.Emit(OpCodes.Br, cont195)
EmitLdargIL.MarkLabel(cont195)
EmitLdargIL.MarkSequencePoint(doc3, 398, 1, 398, 100)
EmitLdargIL.MarkLabel(label10)
EmitLdargIL.MarkSequencePoint(doc3, 399, 1, 399, 100)
EmitLdargIL.Emit(OpCodes.Ret)
Dim typ74(-1) As Type
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = GetType(System.Int32)
Dim EmitLdarga As MethodBuilder = ILEmitter.DefineMethod("EmitLdarga", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ74)
Dim EmitLdargaIL As ILGenerator = EmitLdarga.GetILGenerator()
Dim EmitLdargaparam01 As ParameterBuilder = EmitLdarga.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdargaIL.MarkSequencePoint(doc3, 402, 1, 402, 100)
Dim locbldr47 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(OpCode))
locbldr47.SetLocalSymInfo("op")
EmitLdargaIL.MarkSequencePoint(doc3, 403, 1, 403, 100)
Dim locbldr48 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Boolean))
locbldr48.SetLocalSymInfo("b1")
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 1)
EmitLdargaIL.MarkSequencePoint(doc3, 404, 1, 404, 100)
Dim locbldr49 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Boolean))
locbldr49.SetLocalSymInfo("b2")
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 2)
EmitLdargaIL.MarkSequencePoint(doc3, 405, 1, 405, 100)
Dim locbldr50 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Byte))
locbldr50.SetLocalSymInfo("n8")
EmitLdargaIL.MarkSequencePoint(doc3, 406, 1, 406, 100)
Dim locbldr51 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Int16))
locbldr51.SetLocalSymInfo("n16")
EmitLdargaIL.MarkSequencePoint(doc3, 408, 1, 408, 100)
Dim label11 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.MarkSequencePoint(doc3, 410, 1, 410, 100)
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa196 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru196 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont196 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Bge, tru196)
EmitLdargaIL.Emit(OpCodes.Br, fa196)
EmitLdargaIL.MarkLabel(tru196)
EmitLdargaIL.MarkSequencePoint(doc3, 411, 1, 411, 100)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 1)
EmitLdargaIL.MarkSequencePoint(doc3, 412, 1, 412, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont196)
EmitLdargaIL.MarkLabel(fa196)
EmitLdargaIL.Emit(OpCodes.Br, cont196)
EmitLdargaIL.MarkLabel(cont196)
EmitLdargaIL.MarkSequencePoint(doc3, 413, 1, 413, 100)
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa197 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru197 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont197 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Ble, tru197)
EmitLdargaIL.Emit(OpCodes.Br, fa197)
EmitLdargaIL.MarkLabel(tru197)
EmitLdargaIL.MarkSequencePoint(doc3, 414, 1, 414, 100)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 2)
EmitLdargaIL.MarkSequencePoint(doc3, 415, 1, 415, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont197)
EmitLdargaIL.MarkLabel(fa197)
EmitLdargaIL.Emit(OpCodes.Br, cont197)
EmitLdargaIL.MarkLabel(cont197)
EmitLdargaIL.MarkSequencePoint(doc3, 416, 1, 416, 100)
EmitLdargaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.And)
EmitLdargaIL.Emit(OpCodes.Stloc, 2)
EmitLdargaIL.MarkSequencePoint(doc3, 418, 1, 418, 100)
EmitLdargaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa198 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru198 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont198 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Beq, tru198)
EmitLdargaIL.Emit(OpCodes.Br, fa198)
EmitLdargaIL.MarkLabel(tru198)
EmitLdargaIL.MarkSequencePoint(doc3, 419, 1, 419, 100)
Dim typ75(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldstr, "ldarga.s")
Typ = GetType(System.String)
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
EmitLdargaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ75))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ75).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 0)
EmitLdargaIL.MarkSequencePoint(doc3, 420, 1, 420, 100)
Dim typ76(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ76(UBound(typ76) + 1)
typ76(UBound(typ76)) = Typ
EmitLdargaIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ76))
Typ = GetType(Convert).GetMethod("ToByte", typ76).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 3)
EmitLdargaIL.MarkSequencePoint(doc3, 421, 1, 421, 100)
Dim typ77(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ77(UBound(typ77) + 1)
typ77(UBound(typ77)) = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ77(UBound(typ77) + 1)
typ77(UBound(typ77)) = Typ
EmitLdargaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ77))
Typ = Typ03.GetMethod("Emit", typ77).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargaIL.Emit(OpCodes.Pop)
End If
EmitLdargaIL.MarkSequencePoint(doc3, 422, 1, 422, 100)
EmitLdargaIL.Emit(OpCodes.Br, label11)
EmitLdargaIL.MarkSequencePoint(doc3, 423, 1, 423, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont198)
EmitLdargaIL.MarkLabel(fa198)
EmitLdargaIL.Emit(OpCodes.Br, cont198)
EmitLdargaIL.MarkLabel(cont198)
EmitLdargaIL.MarkSequencePoint(doc3, 425, 1, 425, 100)
EmitLdargaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa199 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru199 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont199 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Beq, tru199)
EmitLdargaIL.Emit(OpCodes.Br, fa199)
EmitLdargaIL.MarkLabel(tru199)
EmitLdargaIL.MarkSequencePoint(doc3, 426, 1, 426, 100)
Dim typ78(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldstr, "ldarga")
Typ = GetType(System.String)
ReDim Preserve typ78(UBound(typ78) + 1)
typ78(UBound(typ78)) = Typ
EmitLdargaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ78))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ78).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 0)
EmitLdargaIL.MarkSequencePoint(doc3, 427, 1, 427, 100)
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ79 As Type() = {Typ}
EmitLdargaIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ79))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ79).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 4)
EmitLdargaIL.MarkSequencePoint(doc3, 428, 1, 428, 100)
Dim typ80(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ80(UBound(typ80) + 1)
typ80(UBound(typ80)) = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ80(UBound(typ80) + 1)
typ80(UBound(typ80)) = Typ
EmitLdargaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ80))
Typ = Typ03.GetMethod("Emit", typ80).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargaIL.Emit(OpCodes.Pop)
End If
EmitLdargaIL.MarkSequencePoint(doc3, 429, 1, 429, 100)
EmitLdargaIL.Emit(OpCodes.Br, label11)
EmitLdargaIL.MarkSequencePoint(doc3, 430, 1, 430, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont199)
EmitLdargaIL.MarkLabel(fa199)
EmitLdargaIL.Emit(OpCodes.Br, cont199)
EmitLdargaIL.MarkLabel(cont199)
EmitLdargaIL.MarkSequencePoint(doc3, 432, 1, 432, 100)
EmitLdargaIL.MarkLabel(label11)
EmitLdargaIL.MarkSequencePoint(doc3, 433, 1, 433, 100)
EmitLdargaIL.Emit(OpCodes.Ret)
Dim typ81(-1) As Type
ReDim Preserve typ81(UBound(typ81) + 1)
typ81(UBound(typ81)) = GetType(System.Int32)
Dim EmitStloc As MethodBuilder = ILEmitter.DefineMethod("EmitStloc", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ81)
Dim EmitStlocIL As ILGenerator = EmitStloc.GetILGenerator()
Dim EmitStlocparam01 As ParameterBuilder = EmitStloc.DefineParameter(1, ParameterAttributes.None, "num")
EmitStlocIL.MarkSequencePoint(doc3, 436, 1, 436, 100)
Dim locbldr52 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(OpCode))
locbldr52.SetLocalSymInfo("op")
EmitStlocIL.MarkSequencePoint(doc3, 437, 1, 437, 100)
Dim locbldr53 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Boolean))
locbldr53.SetLocalSymInfo("b1")
EmitStlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 1)
EmitStlocIL.MarkSequencePoint(doc3, 438, 1, 438, 100)
Dim locbldr54 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Boolean))
locbldr54.SetLocalSymInfo("b2")
EmitStlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 2)
EmitStlocIL.MarkSequencePoint(doc3, 439, 1, 439, 100)
Dim locbldr55 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Byte))
locbldr55.SetLocalSymInfo("n8")
EmitStlocIL.MarkSequencePoint(doc3, 440, 1, 440, 100)
Dim locbldr56 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Int16))
locbldr56.SetLocalSymInfo("n16")
EmitStlocIL.MarkSequencePoint(doc3, 442, 1, 442, 100)
Dim label12 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.MarkSequencePoint(doc3, 444, 1, 444, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa200 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru200 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont200 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru200)
EmitStlocIL.Emit(OpCodes.Br, fa200)
EmitStlocIL.MarkLabel(tru200)
EmitStlocIL.MarkSequencePoint(doc3, 445, 1, 445, 100)
Dim typ82(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.0")
Typ = GetType(System.String)
ReDim Preserve typ82(UBound(typ82) + 1)
typ82(UBound(typ82)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ82))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ82).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 446, 1, 446, 100)
Dim typ83(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ83(UBound(typ83) + 1)
typ83(UBound(typ83)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ83))
Typ = Typ03.GetMethod("Emit", typ83).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 447, 1, 447, 100)
EmitStlocIL.Emit(OpCodes.Br, label12)
EmitStlocIL.MarkSequencePoint(doc3, 448, 1, 448, 100)
EmitStlocIL.Emit(OpCodes.Br, cont200)
EmitStlocIL.MarkLabel(fa200)
EmitStlocIL.Emit(OpCodes.Br, cont200)
EmitStlocIL.MarkLabel(cont200)
EmitStlocIL.MarkSequencePoint(doc3, 450, 1, 450, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa201 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru201 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont201 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru201)
EmitStlocIL.Emit(OpCodes.Br, fa201)
EmitStlocIL.MarkLabel(tru201)
EmitStlocIL.MarkSequencePoint(doc3, 451, 1, 451, 100)
Dim typ84(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.1")
Typ = GetType(System.String)
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ84))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ84).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 452, 1, 452, 100)
Dim typ85(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ85(UBound(typ85) + 1)
typ85(UBound(typ85)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ85))
Typ = Typ03.GetMethod("Emit", typ85).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 453, 1, 453, 100)
EmitStlocIL.Emit(OpCodes.Br, label12)
EmitStlocIL.MarkSequencePoint(doc3, 454, 1, 454, 100)
EmitStlocIL.Emit(OpCodes.Br, cont201)
EmitStlocIL.MarkLabel(fa201)
EmitStlocIL.Emit(OpCodes.Br, cont201)
EmitStlocIL.MarkLabel(cont201)
EmitStlocIL.MarkSequencePoint(doc3, 456, 1, 456, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa202 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru202 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont202 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru202)
EmitStlocIL.Emit(OpCodes.Br, fa202)
EmitStlocIL.MarkLabel(tru202)
EmitStlocIL.MarkSequencePoint(doc3, 457, 1, 457, 100)
Dim typ86(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.2")
Typ = GetType(System.String)
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ86))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ86).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 458, 1, 458, 100)
Dim typ87(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ87))
Typ = Typ03.GetMethod("Emit", typ87).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 459, 1, 459, 100)
EmitStlocIL.Emit(OpCodes.Br, label12)
EmitStlocIL.MarkSequencePoint(doc3, 460, 1, 460, 100)
EmitStlocIL.Emit(OpCodes.Br, cont202)
EmitStlocIL.MarkLabel(fa202)
EmitStlocIL.Emit(OpCodes.Br, cont202)
EmitStlocIL.MarkLabel(cont202)
EmitStlocIL.MarkSequencePoint(doc3, 462, 1, 462, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa203 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru203 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont203 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru203)
EmitStlocIL.Emit(OpCodes.Br, fa203)
EmitStlocIL.MarkLabel(tru203)
EmitStlocIL.MarkSequencePoint(doc3, 463, 1, 463, 100)
Dim typ88(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.3")
Typ = GetType(System.String)
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ88))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ88).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 464, 1, 464, 100)
Dim typ89(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ89(UBound(typ89) + 1)
typ89(UBound(typ89)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ89))
Typ = Typ03.GetMethod("Emit", typ89).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 465, 1, 465, 100)
EmitStlocIL.Emit(OpCodes.Br, label12)
EmitStlocIL.MarkSequencePoint(doc3, 466, 1, 466, 100)
EmitStlocIL.Emit(OpCodes.Br, cont203)
EmitStlocIL.MarkLabel(fa203)
EmitStlocIL.Emit(OpCodes.Br, cont203)
EmitStlocIL.MarkLabel(cont203)
EmitStlocIL.MarkSequencePoint(doc3, 468, 1, 468, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa204 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru204 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont204 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Bge, tru204)
EmitStlocIL.Emit(OpCodes.Br, fa204)
EmitStlocIL.MarkLabel(tru204)
EmitStlocIL.MarkSequencePoint(doc3, 469, 1, 469, 100)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 1)
EmitStlocIL.MarkSequencePoint(doc3, 470, 1, 470, 100)
EmitStlocIL.Emit(OpCodes.Br, cont204)
EmitStlocIL.MarkLabel(fa204)
EmitStlocIL.Emit(OpCodes.Br, cont204)
EmitStlocIL.MarkLabel(cont204)
EmitStlocIL.MarkSequencePoint(doc3, 471, 1, 471, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa205 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru205 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont205 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Ble, tru205)
EmitStlocIL.Emit(OpCodes.Br, fa205)
EmitStlocIL.MarkLabel(tru205)
EmitStlocIL.MarkSequencePoint(doc3, 472, 1, 472, 100)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 2)
EmitStlocIL.MarkSequencePoint(doc3, 473, 1, 473, 100)
EmitStlocIL.Emit(OpCodes.Br, cont205)
EmitStlocIL.MarkLabel(fa205)
EmitStlocIL.Emit(OpCodes.Br, cont205)
EmitStlocIL.MarkLabel(cont205)
EmitStlocIL.MarkSequencePoint(doc3, 474, 1, 474, 100)
EmitStlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.And)
EmitStlocIL.Emit(OpCodes.Stloc, 2)
EmitStlocIL.MarkSequencePoint(doc3, 476, 1, 476, 100)
EmitStlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa206 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru206 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont206 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru206)
EmitStlocIL.Emit(OpCodes.Br, fa206)
EmitStlocIL.MarkLabel(tru206)
EmitStlocIL.MarkSequencePoint(doc3, 477, 1, 477, 100)
Dim typ90(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.s")
Typ = GetType(System.String)
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ90))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ90).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 478, 1, 478, 100)
Dim typ91(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
EmitStlocIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ91))
Typ = GetType(Convert).GetMethod("ToByte", typ91).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 3)
EmitStlocIL.MarkSequencePoint(doc3, 479, 1, 479, 100)
Dim typ92(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ92))
Typ = Typ03.GetMethod("Emit", typ92).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 480, 1, 480, 100)
EmitStlocIL.Emit(OpCodes.Br, label12)
EmitStlocIL.MarkSequencePoint(doc3, 481, 1, 481, 100)
EmitStlocIL.Emit(OpCodes.Br, cont206)
EmitStlocIL.MarkLabel(fa206)
EmitStlocIL.Emit(OpCodes.Br, cont206)
EmitStlocIL.MarkLabel(cont206)
EmitStlocIL.MarkSequencePoint(doc3, 483, 1, 483, 100)
EmitStlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa207 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru207 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont207 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru207)
EmitStlocIL.Emit(OpCodes.Br, fa207)
EmitStlocIL.MarkLabel(tru207)
EmitStlocIL.MarkSequencePoint(doc3, 484, 1, 484, 100)
Dim typ93(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc")
Typ = GetType(System.String)
ReDim Preserve typ93(UBound(typ93) + 1)
typ93(UBound(typ93)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ93))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ93).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 485, 1, 485, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ94 As Type() = {Typ}
EmitStlocIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ94))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ94).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 4)
EmitStlocIL.MarkSequencePoint(doc3, 486, 1, 486, 100)
Dim typ95(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ95))
Typ = Typ03.GetMethod("Emit", typ95).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 487, 1, 487, 100)
EmitStlocIL.Emit(OpCodes.Br, label12)
EmitStlocIL.MarkSequencePoint(doc3, 488, 1, 488, 100)
EmitStlocIL.Emit(OpCodes.Br, cont207)
EmitStlocIL.MarkLabel(fa207)
EmitStlocIL.Emit(OpCodes.Br, cont207)
EmitStlocIL.MarkLabel(cont207)
EmitStlocIL.MarkSequencePoint(doc3, 490, 1, 490, 100)
EmitStlocIL.MarkLabel(label12)
EmitStlocIL.MarkSequencePoint(doc3, 491, 1, 491, 100)
EmitStlocIL.Emit(OpCodes.Ret)
Dim typ96(-1) As Type
ReDim Preserve typ96(UBound(typ96) + 1)
typ96(UBound(typ96)) = GetType(System.Int32)
Dim EmitStarg As MethodBuilder = ILEmitter.DefineMethod("EmitStarg", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ96)
Dim EmitStargIL As ILGenerator = EmitStarg.GetILGenerator()
Dim EmitStargparam01 As ParameterBuilder = EmitStarg.DefineParameter(1, ParameterAttributes.None, "num")
EmitStargIL.MarkSequencePoint(doc3, 495, 1, 495, 100)
Dim locbldr57 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(OpCode))
locbldr57.SetLocalSymInfo("op")
EmitStargIL.MarkSequencePoint(doc3, 496, 1, 496, 100)
Dim locbldr58 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Boolean))
locbldr58.SetLocalSymInfo("b1")
EmitStargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 1)
EmitStargIL.MarkSequencePoint(doc3, 497, 1, 497, 100)
Dim locbldr59 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Boolean))
locbldr59.SetLocalSymInfo("b2")
EmitStargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 2)
EmitStargIL.MarkSequencePoint(doc3, 498, 1, 498, 100)
Dim locbldr60 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Byte))
locbldr60.SetLocalSymInfo("n8")
EmitStargIL.MarkSequencePoint(doc3, 499, 1, 499, 100)
Dim locbldr61 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Int16))
locbldr61.SetLocalSymInfo("n16")
EmitStargIL.MarkSequencePoint(doc3, 501, 1, 501, 100)
Dim label13 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.MarkSequencePoint(doc3, 503, 1, 503, 100)
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStargIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa208 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru208 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont208 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Bge, tru208)
EmitStargIL.Emit(OpCodes.Br, fa208)
EmitStargIL.MarkLabel(tru208)
EmitStargIL.MarkSequencePoint(doc3, 504, 1, 504, 100)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 1)
EmitStargIL.MarkSequencePoint(doc3, 505, 1, 505, 100)
EmitStargIL.Emit(OpCodes.Br, cont208)
EmitStargIL.MarkLabel(fa208)
EmitStargIL.Emit(OpCodes.Br, cont208)
EmitStargIL.MarkLabel(cont208)
EmitStargIL.MarkSequencePoint(doc3, 506, 1, 506, 100)
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStargIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa209 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru209 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont209 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Ble, tru209)
EmitStargIL.Emit(OpCodes.Br, fa209)
EmitStargIL.MarkLabel(tru209)
EmitStargIL.MarkSequencePoint(doc3, 507, 1, 507, 100)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 2)
EmitStargIL.MarkSequencePoint(doc3, 508, 1, 508, 100)
EmitStargIL.Emit(OpCodes.Br, cont209)
EmitStargIL.MarkLabel(fa209)
EmitStargIL.Emit(OpCodes.Br, cont209)
EmitStargIL.MarkLabel(cont209)
EmitStargIL.MarkSequencePoint(doc3, 509, 1, 509, 100)
EmitStargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.And)
EmitStargIL.Emit(OpCodes.Stloc, 2)
EmitStargIL.MarkSequencePoint(doc3, 511, 1, 511, 100)
EmitStargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa210 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru210 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont210 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Beq, tru210)
EmitStargIL.Emit(OpCodes.Br, fa210)
EmitStargIL.MarkLabel(tru210)
EmitStargIL.MarkSequencePoint(doc3, 512, 1, 512, 100)
Dim typ97(-1) As Type
EmitStargIL.Emit(OpCodes.Ldstr, "starg.s")
Typ = GetType(System.String)
ReDim Preserve typ97(UBound(typ97) + 1)
typ97(UBound(typ97)) = Typ
EmitStargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ97))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ97).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 0)
EmitStargIL.MarkSequencePoint(doc3, 513, 1, 513, 100)
Dim typ98(-1) As Type
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
EmitStargIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ98))
Typ = GetType(Convert).GetMethod("ToByte", typ98).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 3)
EmitStargIL.MarkSequencePoint(doc3, 514, 1, 514, 100)
Dim typ99(-1) As Type
EmitStargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
EmitStargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ99))
Typ = Typ03.GetMethod("Emit", typ99).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStargIL.Emit(OpCodes.Pop)
End If
EmitStargIL.MarkSequencePoint(doc3, 515, 1, 515, 100)
EmitStargIL.Emit(OpCodes.Br, label13)
EmitStargIL.MarkSequencePoint(doc3, 516, 1, 516, 100)
EmitStargIL.Emit(OpCodes.Br, cont210)
EmitStargIL.MarkLabel(fa210)
EmitStargIL.Emit(OpCodes.Br, cont210)
EmitStargIL.MarkLabel(cont210)
EmitStargIL.MarkSequencePoint(doc3, 518, 1, 518, 100)
EmitStargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa211 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru211 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont211 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Beq, tru211)
EmitStargIL.Emit(OpCodes.Br, fa211)
EmitStargIL.MarkLabel(tru211)
EmitStargIL.MarkSequencePoint(doc3, 519, 1, 519, 100)
Dim typ100(-1) As Type
EmitStargIL.Emit(OpCodes.Ldstr, "starg")
Typ = GetType(System.String)
ReDim Preserve typ100(UBound(typ100) + 1)
typ100(UBound(typ100)) = Typ
EmitStargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ100))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ100).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 0)
EmitStargIL.MarkSequencePoint(doc3, 520, 1, 520, 100)
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ101 As Type() = {Typ}
EmitStargIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ101))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ101).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 4)
EmitStargIL.MarkSequencePoint(doc3, 521, 1, 521, 100)
Dim typ102(-1) As Type
EmitStargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
EmitStargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ102))
Typ = Typ03.GetMethod("Emit", typ102).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStargIL.Emit(OpCodes.Pop)
End If
EmitStargIL.MarkSequencePoint(doc3, 522, 1, 522, 100)
EmitStargIL.Emit(OpCodes.Br, label13)
EmitStargIL.MarkSequencePoint(doc3, 523, 1, 523, 100)
EmitStargIL.Emit(OpCodes.Br, cont211)
EmitStargIL.MarkLabel(fa211)
EmitStargIL.Emit(OpCodes.Br, cont211)
EmitStargIL.MarkLabel(cont211)
EmitStargIL.MarkSequencePoint(doc3, 525, 1, 525, 100)
EmitStargIL.MarkLabel(label13)
EmitStargIL.MarkSequencePoint(doc3, 526, 1, 526, 100)
EmitStargIL.Emit(OpCodes.Ret)
Dim typ103(-1) As Type
ReDim Preserve typ103(UBound(typ103) + 1)
typ103(UBound(typ103)) = GetType(FieldInfo)
Dim EmitStfld As MethodBuilder = ILEmitter.DefineMethod("EmitStfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ103)
Dim EmitStfldIL As ILGenerator = EmitStfld.GetILGenerator()
Dim EmitStfldparam01 As ParameterBuilder = EmitStfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitStfldIL.MarkSequencePoint(doc3, 529, 1, 529, 100)
Dim locbldr62 As LocalBuilder = EmitStfldIL.DeclareLocal(GetType(OpCode))
locbldr62.SetLocalSymInfo("lop")
Dim typ104(-1) As Type
EmitStfldIL.Emit(OpCodes.Ldstr, "stfld")
Typ = GetType(System.String)
ReDim Preserve typ104(UBound(typ104) + 1)
typ104(UBound(typ104)) = Typ
EmitStfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ104))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ104).ReturnType
EmitStfldIL.Emit(OpCodes.Stloc, 0)
EmitStfldIL.MarkSequencePoint(doc3, 530, 1, 530, 100)
Dim typ105(-1) As Type
EmitStfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ105(UBound(typ105) + 1)
typ105(UBound(typ105)) = Typ
EmitStfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ105(UBound(typ105) + 1)
typ105(UBound(typ105)) = Typ
EmitStfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ105))
Typ = Typ03.GetMethod("Emit", typ105).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStfldIL.Emit(OpCodes.Pop)
End If
EmitStfldIL.MarkSequencePoint(doc3, 531, 1, 531, 100)
EmitStfldIL.Emit(OpCodes.Ret)
Dim typ106(-1) As Type
ReDim Preserve typ106(UBound(typ106) + 1)
typ106(UBound(typ106)) = GetType(FieldInfo)
Dim EmitStsfld As MethodBuilder = ILEmitter.DefineMethod("EmitStsfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ106)
Dim EmitStsfldIL As ILGenerator = EmitStsfld.GetILGenerator()
Dim EmitStsfldparam01 As ParameterBuilder = EmitStsfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitStsfldIL.MarkSequencePoint(doc3, 534, 1, 534, 100)
Dim locbldr63 As LocalBuilder = EmitStsfldIL.DeclareLocal(GetType(OpCode))
locbldr63.SetLocalSymInfo("lsop")
Dim typ107(-1) As Type
EmitStsfldIL.Emit(OpCodes.Ldstr, "stsfld")
Typ = GetType(System.String)
ReDim Preserve typ107(UBound(typ107) + 1)
typ107(UBound(typ107)) = Typ
EmitStsfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ107))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ107).ReturnType
EmitStsfldIL.Emit(OpCodes.Stloc, 0)
EmitStsfldIL.MarkSequencePoint(doc3, 535, 1, 535, 100)
Dim typ108(-1) As Type
EmitStsfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStsfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ108(UBound(typ108) + 1)
typ108(UBound(typ108)) = Typ
EmitStsfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ108(UBound(typ108) + 1)
typ108(UBound(typ108)) = Typ
EmitStsfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ108))
Typ = Typ03.GetMethod("Emit", typ108).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStsfldIL.Emit(OpCodes.Pop)
End If
EmitStsfldIL.MarkSequencePoint(doc3, 536, 1, 536, 100)
EmitStsfldIL.Emit(OpCodes.Ret)
Dim typ109(-1) As Type
ReDim Preserve typ109(UBound(typ109) + 1)
typ109(UBound(typ109)) = GetType(System.Type)
Dim EmitStelem As MethodBuilder = ILEmitter.DefineMethod("EmitStelem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ109)
Dim EmitStelemIL As ILGenerator = EmitStelem.GetILGenerator()
Dim EmitStelemparam01 As ParameterBuilder = EmitStelem.DefineParameter(1, ParameterAttributes.None, "typ")
EmitStelemIL.MarkSequencePoint(doc3, 540, 1, 540, 100)
Dim locbldr64 As LocalBuilder = EmitStelemIL.DeclareLocal(GetType(System.Type))
locbldr64.SetLocalSymInfo("t1")
EmitStelemIL.MarkSequencePoint(doc3, 541, 1, 541, 100)
Dim locbldr65 As LocalBuilder = EmitStelemIL.DeclareLocal(GetType(OpCode))
locbldr65.SetLocalSymInfo("op")
EmitStelemIL.MarkSequencePoint(doc3, 542, 1, 542, 100)
Dim locbldr66 As LocalBuilder = EmitStelemIL.DeclareLocal(GetType(System.Boolean))
locbldr66.SetLocalSymInfo("b")
EmitStelemIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 544, 1, 544, 100)
Dim label14 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.MarkSequencePoint(doc3, 546, 1, 546, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(IntPtr))
Dim typ110 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ110))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ110).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 547, 1, 547, 100)
Dim typ111(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ111(UBound(typ111) + 1)
typ111(UBound(typ111)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ111))
Typ = Typ03.GetMethod("Equals", typ111).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 548, 1, 548, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa212 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru212 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont212 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru212)
EmitStelemIL.Emit(OpCodes.Br, fa212)
EmitStelemIL.MarkLabel(tru212)
EmitStelemIL.MarkSequencePoint(doc3, 549, 1, 549, 100)
Dim typ112(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i")
Typ = GetType(System.String)
ReDim Preserve typ112(UBound(typ112) + 1)
typ112(UBound(typ112)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ112))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ112).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 550, 1, 550, 100)
Dim typ113(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ113(UBound(typ113) + 1)
typ113(UBound(typ113)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ113))
Typ = Typ03.GetMethod("Emit", typ113).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 551, 1, 551, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 552, 1, 552, 100)
EmitStelemIL.Emit(OpCodes.Br, cont212)
EmitStelemIL.MarkLabel(fa212)
EmitStelemIL.Emit(OpCodes.Br, cont212)
EmitStelemIL.MarkLabel(cont212)
EmitStelemIL.MarkSequencePoint(doc3, 554, 1, 554, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.SByte))
Dim typ114 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ114))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ114).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 555, 1, 555, 100)
Dim typ115(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ115(UBound(typ115) + 1)
typ115(UBound(typ115)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ115))
Typ = Typ03.GetMethod("Equals", typ115).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 556, 1, 556, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa213 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru213 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont213 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru213)
EmitStelemIL.Emit(OpCodes.Br, fa213)
EmitStelemIL.MarkLabel(tru213)
EmitStelemIL.MarkSequencePoint(doc3, 557, 1, 557, 100)
Dim typ116(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i1")
Typ = GetType(System.String)
ReDim Preserve typ116(UBound(typ116) + 1)
typ116(UBound(typ116)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ116))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ116).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 558, 1, 558, 100)
Dim typ117(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ117(UBound(typ117) + 1)
typ117(UBound(typ117)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ117))
Typ = Typ03.GetMethod("Emit", typ117).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 559, 1, 559, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 560, 1, 560, 100)
EmitStelemIL.Emit(OpCodes.Br, cont213)
EmitStelemIL.MarkLabel(fa213)
EmitStelemIL.Emit(OpCodes.Br, cont213)
EmitStelemIL.MarkLabel(cont213)
EmitStelemIL.MarkSequencePoint(doc3, 562, 1, 562, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int16))
Dim typ118 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ118))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ118).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 563, 1, 563, 100)
Dim typ119(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ119(UBound(typ119) + 1)
typ119(UBound(typ119)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ119))
Typ = Typ03.GetMethod("Equals", typ119).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 564, 1, 564, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa214 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru214 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont214 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru214)
EmitStelemIL.Emit(OpCodes.Br, fa214)
EmitStelemIL.MarkLabel(tru214)
EmitStelemIL.MarkSequencePoint(doc3, 565, 1, 565, 100)
Dim typ120(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i2")
Typ = GetType(System.String)
ReDim Preserve typ120(UBound(typ120) + 1)
typ120(UBound(typ120)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ120))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ120).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 566, 1, 566, 100)
Dim typ121(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ121(UBound(typ121) + 1)
typ121(UBound(typ121)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ121))
Typ = Typ03.GetMethod("Emit", typ121).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 567, 1, 567, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 568, 1, 568, 100)
EmitStelemIL.Emit(OpCodes.Br, cont214)
EmitStelemIL.MarkLabel(fa214)
EmitStelemIL.Emit(OpCodes.Br, cont214)
EmitStelemIL.MarkLabel(cont214)
EmitStelemIL.MarkSequencePoint(doc3, 570, 1, 570, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int32))
Dim typ122 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ122))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ122).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 571, 1, 571, 100)
Dim typ123(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ123(UBound(typ123) + 1)
typ123(UBound(typ123)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ123))
Typ = Typ03.GetMethod("Equals", typ123).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 572, 1, 572, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa215 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru215 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont215 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru215)
EmitStelemIL.Emit(OpCodes.Br, fa215)
EmitStelemIL.MarkLabel(tru215)
EmitStelemIL.MarkSequencePoint(doc3, 573, 1, 573, 100)
Dim typ124(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i4")
Typ = GetType(System.String)
ReDim Preserve typ124(UBound(typ124) + 1)
typ124(UBound(typ124)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ124))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ124).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 574, 1, 574, 100)
Dim typ125(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ125(UBound(typ125) + 1)
typ125(UBound(typ125)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ125))
Typ = Typ03.GetMethod("Emit", typ125).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 575, 1, 575, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 576, 1, 576, 100)
EmitStelemIL.Emit(OpCodes.Br, cont215)
EmitStelemIL.MarkLabel(fa215)
EmitStelemIL.Emit(OpCodes.Br, cont215)
EmitStelemIL.MarkLabel(cont215)
EmitStelemIL.MarkSequencePoint(doc3, 578, 1, 578, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int64))
Dim typ126 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ126))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ126).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 579, 1, 579, 100)
Dim typ127(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ127(UBound(typ127) + 1)
typ127(UBound(typ127)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ127))
Typ = Typ03.GetMethod("Equals", typ127).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 580, 1, 580, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa216 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru216 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont216 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru216)
EmitStelemIL.Emit(OpCodes.Br, fa216)
EmitStelemIL.MarkLabel(tru216)
EmitStelemIL.MarkSequencePoint(doc3, 581, 1, 581, 100)
Dim typ128(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i8")
Typ = GetType(System.String)
ReDim Preserve typ128(UBound(typ128) + 1)
typ128(UBound(typ128)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ128))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ128).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 582, 1, 582, 100)
Dim typ129(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ129(UBound(typ129) + 1)
typ129(UBound(typ129)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ129))
Typ = Typ03.GetMethod("Emit", typ129).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 583, 1, 583, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 584, 1, 584, 100)
EmitStelemIL.Emit(OpCodes.Br, cont216)
EmitStelemIL.MarkLabel(fa216)
EmitStelemIL.Emit(OpCodes.Br, cont216)
EmitStelemIL.MarkLabel(cont216)
EmitStelemIL.MarkSequencePoint(doc3, 586, 1, 586, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Single))
Dim typ130 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ130))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ130).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 587, 1, 587, 100)
Dim typ131(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ131(UBound(typ131) + 1)
typ131(UBound(typ131)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ131))
Typ = Typ03.GetMethod("Equals", typ131).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 588, 1, 588, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa217 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru217 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont217 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru217)
EmitStelemIL.Emit(OpCodes.Br, fa217)
EmitStelemIL.MarkLabel(tru217)
EmitStelemIL.MarkSequencePoint(doc3, 589, 1, 589, 100)
Dim typ132(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.r4")
Typ = GetType(System.String)
ReDim Preserve typ132(UBound(typ132) + 1)
typ132(UBound(typ132)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ132))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ132).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 590, 1, 590, 100)
Dim typ133(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ133(UBound(typ133) + 1)
typ133(UBound(typ133)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ133))
Typ = Typ03.GetMethod("Emit", typ133).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 591, 1, 591, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 592, 1, 592, 100)
EmitStelemIL.Emit(OpCodes.Br, cont217)
EmitStelemIL.MarkLabel(fa217)
EmitStelemIL.Emit(OpCodes.Br, cont217)
EmitStelemIL.MarkLabel(cont217)
EmitStelemIL.MarkSequencePoint(doc3, 594, 1, 594, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Double))
Dim typ134 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ134))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ134).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 595, 1, 595, 100)
Dim typ135(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ135(UBound(typ135) + 1)
typ135(UBound(typ135)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ135))
Typ = Typ03.GetMethod("Equals", typ135).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 596, 1, 596, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa218 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru218 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont218 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru218)
EmitStelemIL.Emit(OpCodes.Br, fa218)
EmitStelemIL.MarkLabel(tru218)
EmitStelemIL.MarkSequencePoint(doc3, 597, 1, 597, 100)
Dim typ136(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.r8")
Typ = GetType(System.String)
ReDim Preserve typ136(UBound(typ136) + 1)
typ136(UBound(typ136)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ136))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ136).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 598, 1, 598, 100)
Dim typ137(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ137(UBound(typ137) + 1)
typ137(UBound(typ137)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ137))
Typ = Typ03.GetMethod("Emit", typ137).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 599, 1, 599, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 600, 1, 600, 100)
EmitStelemIL.Emit(OpCodes.Br, cont218)
EmitStelemIL.MarkLabel(fa218)
EmitStelemIL.Emit(OpCodes.Br, cont218)
EmitStelemIL.MarkLabel(cont218)
EmitStelemIL.MarkSequencePoint(doc3, 602, 1, 602, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(ValueType))
Dim typ138 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ138))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ138).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 603, 1, 603, 100)
Dim typ139(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ139(UBound(typ139) + 1)
typ139(UBound(typ139)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ139))
Typ = Typ03.GetMethod("IsAssignableFrom", typ139).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 604, 1, 604, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa219 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru219 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont219 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru219)
EmitStelemIL.Emit(OpCodes.Br, fa219)
EmitStelemIL.MarkLabel(tru219)
EmitStelemIL.MarkSequencePoint(doc3, 605, 1, 605, 100)
Dim typ140(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem")
Typ = GetType(System.String)
ReDim Preserve typ140(UBound(typ140) + 1)
typ140(UBound(typ140)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ140))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ140).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 606, 1, 606, 100)
Dim typ141(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ141(UBound(typ141) + 1)
typ141(UBound(typ141)) = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ141(UBound(typ141) + 1)
typ141(UBound(typ141)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ141))
Typ = Typ03.GetMethod("Emit", typ141).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 607, 1, 607, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 608, 1, 608, 100)
EmitStelemIL.Emit(OpCodes.Br, cont219)
EmitStelemIL.MarkLabel(fa219)
EmitStelemIL.Emit(OpCodes.Br, cont219)
EmitStelemIL.MarkLabel(cont219)
EmitStelemIL.MarkSequencePoint(doc3, 610, 1, 610, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Object))
Dim typ142 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ142))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ142).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 611, 1, 611, 100)
Dim typ143(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ143(UBound(typ143) + 1)
typ143(UBound(typ143)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ143))
Typ = Typ03.GetMethod("IsAssignableFrom", typ143).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 612, 1, 612, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa220 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru220 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont220 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru220)
EmitStelemIL.Emit(OpCodes.Br, fa220)
EmitStelemIL.MarkLabel(tru220)
EmitStelemIL.MarkSequencePoint(doc3, 613, 1, 613, 100)
Dim typ144(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.ref")
Typ = GetType(System.String)
ReDim Preserve typ144(UBound(typ144) + 1)
typ144(UBound(typ144)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ144))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ144).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 614, 1, 614, 100)
Dim typ145(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ145(UBound(typ145) + 1)
typ145(UBound(typ145)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ145))
Typ = Typ03.GetMethod("Emit", typ145).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 615, 1, 615, 100)
EmitStelemIL.Emit(OpCodes.Br, label14)
EmitStelemIL.MarkSequencePoint(doc3, 616, 1, 616, 100)
EmitStelemIL.Emit(OpCodes.Br, cont220)
EmitStelemIL.MarkLabel(fa220)
EmitStelemIL.Emit(OpCodes.Br, cont220)
EmitStelemIL.MarkLabel(cont220)
EmitStelemIL.MarkSequencePoint(doc3, 619, 1, 619, 100)
EmitStelemIL.MarkLabel(label14)
EmitStelemIL.MarkSequencePoint(doc3, 621, 1, 621, 100)
EmitStelemIL.Emit(OpCodes.Ret)
Dim typ146(-1) As Type
ReDim Preserve typ146(UBound(typ146) + 1)
typ146(UBound(typ146)) = GetType(System.Type)
Dim EmitLdelem As MethodBuilder = ILEmitter.DefineMethod("EmitLdelem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ146)
Dim EmitLdelemIL As ILGenerator = EmitLdelem.GetILGenerator()
Dim EmitLdelemparam01 As ParameterBuilder = EmitLdelem.DefineParameter(1, ParameterAttributes.None, "typ")
EmitLdelemIL.MarkSequencePoint(doc3, 625, 1, 625, 100)
Dim locbldr67 As LocalBuilder = EmitLdelemIL.DeclareLocal(GetType(System.Type))
locbldr67.SetLocalSymInfo("t1")
EmitLdelemIL.MarkSequencePoint(doc3, 626, 1, 626, 100)
Dim locbldr68 As LocalBuilder = EmitLdelemIL.DeclareLocal(GetType(OpCode))
locbldr68.SetLocalSymInfo("op")
EmitLdelemIL.MarkSequencePoint(doc3, 627, 1, 627, 100)
Dim locbldr69 As LocalBuilder = EmitLdelemIL.DeclareLocal(GetType(System.Boolean))
locbldr69.SetLocalSymInfo("b")
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 629, 1, 629, 100)
Dim label15 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.MarkSequencePoint(doc3, 631, 1, 631, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(IntPtr))
Dim typ147 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ147))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ147).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 632, 1, 632, 100)
Dim typ148(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ148(UBound(typ148) + 1)
typ148(UBound(typ148)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ148))
Typ = Typ03.GetMethod("Equals", typ148).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 633, 1, 633, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa221 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru221 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont221 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru221)
EmitLdelemIL.Emit(OpCodes.Br, fa221)
EmitLdelemIL.MarkLabel(tru221)
EmitLdelemIL.MarkSequencePoint(doc3, 634, 1, 634, 100)
Dim typ149(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i")
Typ = GetType(System.String)
ReDim Preserve typ149(UBound(typ149) + 1)
typ149(UBound(typ149)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ149))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ149).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 635, 1, 635, 100)
Dim typ150(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ150(UBound(typ150) + 1)
typ150(UBound(typ150)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ150))
Typ = Typ03.GetMethod("Emit", typ150).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 636, 1, 636, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 637, 1, 637, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont221)
EmitLdelemIL.MarkLabel(fa221)
EmitLdelemIL.Emit(OpCodes.Br, cont221)
EmitLdelemIL.MarkLabel(cont221)
EmitLdelemIL.MarkSequencePoint(doc3, 639, 1, 639, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.SByte))
Dim typ151 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ151))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ151).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 640, 1, 640, 100)
Dim typ152(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ152(UBound(typ152) + 1)
typ152(UBound(typ152)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ152))
Typ = Typ03.GetMethod("Equals", typ152).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 641, 1, 641, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa222 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru222 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont222 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru222)
EmitLdelemIL.Emit(OpCodes.Br, fa222)
EmitLdelemIL.MarkLabel(tru222)
EmitLdelemIL.MarkSequencePoint(doc3, 642, 1, 642, 100)
Dim typ153(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i1")
Typ = GetType(System.String)
ReDim Preserve typ153(UBound(typ153) + 1)
typ153(UBound(typ153)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ153))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ153).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 643, 1, 643, 100)
Dim typ154(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ154(UBound(typ154) + 1)
typ154(UBound(typ154)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ154))
Typ = Typ03.GetMethod("Emit", typ154).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 644, 1, 644, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 645, 1, 645, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont222)
EmitLdelemIL.MarkLabel(fa222)
EmitLdelemIL.Emit(OpCodes.Br, cont222)
EmitLdelemIL.MarkLabel(cont222)
EmitLdelemIL.MarkSequencePoint(doc3, 647, 1, 647, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int16))
Dim typ155 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ155))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ155).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 648, 1, 648, 100)
Dim typ156(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ156(UBound(typ156) + 1)
typ156(UBound(typ156)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ156))
Typ = Typ03.GetMethod("Equals", typ156).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 649, 1, 649, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa223 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru223 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont223 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru223)
EmitLdelemIL.Emit(OpCodes.Br, fa223)
EmitLdelemIL.MarkLabel(tru223)
EmitLdelemIL.MarkSequencePoint(doc3, 650, 1, 650, 100)
Dim typ157(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i2")
Typ = GetType(System.String)
ReDim Preserve typ157(UBound(typ157) + 1)
typ157(UBound(typ157)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ157))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ157).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 651, 1, 651, 100)
Dim typ158(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ158(UBound(typ158) + 1)
typ158(UBound(typ158)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ158))
Typ = Typ03.GetMethod("Emit", typ158).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 652, 1, 652, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 653, 1, 653, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont223)
EmitLdelemIL.MarkLabel(fa223)
EmitLdelemIL.Emit(OpCodes.Br, cont223)
EmitLdelemIL.MarkLabel(cont223)
EmitLdelemIL.MarkSequencePoint(doc3, 655, 1, 655, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int32))
Dim typ159 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ159))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ159).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 656, 1, 656, 100)
Dim typ160(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ160(UBound(typ160) + 1)
typ160(UBound(typ160)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ160))
Typ = Typ03.GetMethod("Equals", typ160).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 657, 1, 657, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa224 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru224 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont224 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru224)
EmitLdelemIL.Emit(OpCodes.Br, fa224)
EmitLdelemIL.MarkLabel(tru224)
EmitLdelemIL.MarkSequencePoint(doc3, 658, 1, 658, 100)
Dim typ161(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i4")
Typ = GetType(System.String)
ReDim Preserve typ161(UBound(typ161) + 1)
typ161(UBound(typ161)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ161))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ161).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 659, 1, 659, 100)
Dim typ162(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ162(UBound(typ162) + 1)
typ162(UBound(typ162)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ162))
Typ = Typ03.GetMethod("Emit", typ162).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 660, 1, 660, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 661, 1, 661, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont224)
EmitLdelemIL.MarkLabel(fa224)
EmitLdelemIL.Emit(OpCodes.Br, cont224)
EmitLdelemIL.MarkLabel(cont224)
EmitLdelemIL.MarkSequencePoint(doc3, 663, 1, 663, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(Byte))
Dim typ163 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ163))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ163).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 664, 1, 664, 100)
Dim typ164(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ164(UBound(typ164) + 1)
typ164(UBound(typ164)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ164))
Typ = Typ03.GetMethod("Equals", typ164).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 665, 1, 665, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa225 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru225 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont225 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru225)
EmitLdelemIL.Emit(OpCodes.Br, fa225)
EmitLdelemIL.MarkLabel(tru225)
EmitLdelemIL.MarkSequencePoint(doc3, 666, 1, 666, 100)
Dim typ165(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.u1")
Typ = GetType(System.String)
ReDim Preserve typ165(UBound(typ165) + 1)
typ165(UBound(typ165)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ165))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ165).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 667, 1, 667, 100)
Dim typ166(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ166(UBound(typ166) + 1)
typ166(UBound(typ166)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ166))
Typ = Typ03.GetMethod("Emit", typ166).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 668, 1, 668, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 669, 1, 669, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont225)
EmitLdelemIL.MarkLabel(fa225)
EmitLdelemIL.Emit(OpCodes.Br, cont225)
EmitLdelemIL.MarkLabel(cont225)
EmitLdelemIL.MarkSequencePoint(doc3, 671, 1, 671, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(UInt16))
Dim typ167 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ167))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ167).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 672, 1, 672, 100)
Dim typ168(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ168(UBound(typ168) + 1)
typ168(UBound(typ168)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ168))
Typ = Typ03.GetMethod("Equals", typ168).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 673, 1, 673, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa226 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru226 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont226 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru226)
EmitLdelemIL.Emit(OpCodes.Br, fa226)
EmitLdelemIL.MarkLabel(tru226)
EmitLdelemIL.MarkSequencePoint(doc3, 674, 1, 674, 100)
Dim typ169(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.u2")
Typ = GetType(System.String)
ReDim Preserve typ169(UBound(typ169) + 1)
typ169(UBound(typ169)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ169))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ169).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 675, 1, 675, 100)
Dim typ170(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ170(UBound(typ170) + 1)
typ170(UBound(typ170)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ170))
Typ = Typ03.GetMethod("Emit", typ170).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 676, 1, 676, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 677, 1, 677, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont226)
EmitLdelemIL.MarkLabel(fa226)
EmitLdelemIL.Emit(OpCodes.Br, cont226)
EmitLdelemIL.MarkLabel(cont226)
EmitLdelemIL.MarkSequencePoint(doc3, 679, 1, 679, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(UInt32))
Dim typ171 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ171))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ171).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 680, 1, 680, 100)
Dim typ172(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ172(UBound(typ172) + 1)
typ172(UBound(typ172)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ172))
Typ = Typ03.GetMethod("Equals", typ172).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 681, 1, 681, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa227 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru227 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont227 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru227)
EmitLdelemIL.Emit(OpCodes.Br, fa227)
EmitLdelemIL.MarkLabel(tru227)
EmitLdelemIL.MarkSequencePoint(doc3, 682, 1, 682, 100)
Dim typ173(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.u4")
Typ = GetType(System.String)
ReDim Preserve typ173(UBound(typ173) + 1)
typ173(UBound(typ173)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ173))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ173).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 683, 1, 683, 100)
Dim typ174(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ174(UBound(typ174) + 1)
typ174(UBound(typ174)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ174))
Typ = Typ03.GetMethod("Emit", typ174).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 684, 1, 684, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 685, 1, 685, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont227)
EmitLdelemIL.MarkLabel(fa227)
EmitLdelemIL.Emit(OpCodes.Br, cont227)
EmitLdelemIL.MarkLabel(cont227)
EmitLdelemIL.MarkSequencePoint(doc3, 688, 1, 688, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int64))
Dim typ175 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ175))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ175).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 689, 1, 689, 100)
Dim typ176(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ176(UBound(typ176) + 1)
typ176(UBound(typ176)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ176))
Typ = Typ03.GetMethod("Equals", typ176).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 690, 1, 690, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa228 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru228 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont228 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru228)
EmitLdelemIL.Emit(OpCodes.Br, fa228)
EmitLdelemIL.MarkLabel(tru228)
EmitLdelemIL.MarkSequencePoint(doc3, 691, 1, 691, 100)
Dim typ177(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i8")
Typ = GetType(System.String)
ReDim Preserve typ177(UBound(typ177) + 1)
typ177(UBound(typ177)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ177))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ177).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 692, 1, 692, 100)
Dim typ178(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ178(UBound(typ178) + 1)
typ178(UBound(typ178)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ178))
Typ = Typ03.GetMethod("Emit", typ178).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 693, 1, 693, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 694, 1, 694, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont228)
EmitLdelemIL.MarkLabel(fa228)
EmitLdelemIL.Emit(OpCodes.Br, cont228)
EmitLdelemIL.MarkLabel(cont228)
EmitLdelemIL.MarkSequencePoint(doc3, 696, 1, 696, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Single))
Dim typ179 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ179))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ179).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 697, 1, 697, 100)
Dim typ180(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ180(UBound(typ180) + 1)
typ180(UBound(typ180)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ180))
Typ = Typ03.GetMethod("Equals", typ180).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 698, 1, 698, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa229 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru229 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont229 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru229)
EmitLdelemIL.Emit(OpCodes.Br, fa229)
EmitLdelemIL.MarkLabel(tru229)
EmitLdelemIL.MarkSequencePoint(doc3, 699, 1, 699, 100)
Dim typ181(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.r4")
Typ = GetType(System.String)
ReDim Preserve typ181(UBound(typ181) + 1)
typ181(UBound(typ181)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ181))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ181).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 700, 1, 700, 100)
Dim typ182(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ182(UBound(typ182) + 1)
typ182(UBound(typ182)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ182))
Typ = Typ03.GetMethod("Emit", typ182).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 701, 1, 701, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 702, 1, 702, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont229)
EmitLdelemIL.MarkLabel(fa229)
EmitLdelemIL.Emit(OpCodes.Br, cont229)
EmitLdelemIL.MarkLabel(cont229)
EmitLdelemIL.MarkSequencePoint(doc3, 704, 1, 704, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Double))
Dim typ183 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ183))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ183).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 705, 1, 705, 100)
Dim typ184(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ184(UBound(typ184) + 1)
typ184(UBound(typ184)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ184))
Typ = Typ03.GetMethod("Equals", typ184).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 706, 1, 706, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa230 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru230 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont230 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru230)
EmitLdelemIL.Emit(OpCodes.Br, fa230)
EmitLdelemIL.MarkLabel(tru230)
EmitLdelemIL.MarkSequencePoint(doc3, 707, 1, 707, 100)
Dim typ185(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.r8")
Typ = GetType(System.String)
ReDim Preserve typ185(UBound(typ185) + 1)
typ185(UBound(typ185)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ185))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ185).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 708, 1, 708, 100)
Dim typ186(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ186(UBound(typ186) + 1)
typ186(UBound(typ186)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ186))
Typ = Typ03.GetMethod("Emit", typ186).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 709, 1, 709, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 710, 1, 710, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont230)
EmitLdelemIL.MarkLabel(fa230)
EmitLdelemIL.Emit(OpCodes.Br, cont230)
EmitLdelemIL.MarkLabel(cont230)
EmitLdelemIL.MarkSequencePoint(doc3, 712, 1, 712, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(ValueType))
Dim typ187 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ187))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ187).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 713, 1, 713, 100)
Dim typ188(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ188(UBound(typ188) + 1)
typ188(UBound(typ188)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ188))
Typ = Typ03.GetMethod("IsAssignableFrom", typ188).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 714, 1, 714, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa231 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru231 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont231 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru231)
EmitLdelemIL.Emit(OpCodes.Br, fa231)
EmitLdelemIL.MarkLabel(tru231)
EmitLdelemIL.MarkSequencePoint(doc3, 715, 1, 715, 100)
Dim typ189(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem")
Typ = GetType(System.String)
ReDim Preserve typ189(UBound(typ189) + 1)
typ189(UBound(typ189)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ189))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ189).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 716, 1, 716, 100)
Dim typ190(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ190(UBound(typ190) + 1)
typ190(UBound(typ190)) = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ190(UBound(typ190) + 1)
typ190(UBound(typ190)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ190))
Typ = Typ03.GetMethod("Emit", typ190).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 717, 1, 717, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 718, 1, 718, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont231)
EmitLdelemIL.MarkLabel(fa231)
EmitLdelemIL.Emit(OpCodes.Br, cont231)
EmitLdelemIL.MarkLabel(cont231)
EmitLdelemIL.MarkSequencePoint(doc3, 720, 1, 720, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Object))
Dim typ191 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ191))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ191).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 721, 1, 721, 100)
Dim typ192(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ192(UBound(typ192) + 1)
typ192(UBound(typ192)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ192))
Typ = Typ03.GetMethod("IsAssignableFrom", typ192).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 722, 1, 722, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa232 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru232 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont232 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru232)
EmitLdelemIL.Emit(OpCodes.Br, fa232)
EmitLdelemIL.MarkLabel(tru232)
EmitLdelemIL.MarkSequencePoint(doc3, 723, 1, 723, 100)
Dim typ193(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.ref")
Typ = GetType(System.String)
ReDim Preserve typ193(UBound(typ193) + 1)
typ193(UBound(typ193)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ193))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ193).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 724, 1, 724, 100)
Dim typ194(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ194(UBound(typ194) + 1)
typ194(UBound(typ194)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ194))
Typ = Typ03.GetMethod("Emit", typ194).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 725, 1, 725, 100)
EmitLdelemIL.Emit(OpCodes.Br, label15)
EmitLdelemIL.MarkSequencePoint(doc3, 726, 1, 726, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont232)
EmitLdelemIL.MarkLabel(fa232)
EmitLdelemIL.Emit(OpCodes.Br, cont232)
EmitLdelemIL.MarkLabel(cont232)
EmitLdelemIL.MarkSequencePoint(doc3, 729, 1, 729, 100)
EmitLdelemIL.MarkLabel(label15)
EmitLdelemIL.MarkSequencePoint(doc3, 731, 1, 731, 100)
EmitLdelemIL.Emit(OpCodes.Ret)
Dim typ195(-1) As Type
ReDim Preserve typ195(UBound(typ195) + 1)
typ195(UBound(typ195)) = GetType(System.Int64)
Dim EmitLdcI8 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI8", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ195)
Dim EmitLdcI8IL As ILGenerator = EmitLdcI8.GetILGenerator()
Dim EmitLdcI8param01 As ParameterBuilder = EmitLdcI8.DefineParameter(1, ParameterAttributes.None, "n")
EmitLdcI8IL.MarkSequencePoint(doc3, 735, 1, 735, 100)
Dim locbldr70 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(OpCode))
locbldr70.SetLocalSymInfo("op")
EmitLdcI8IL.MarkSequencePoint(doc3, 736, 1, 736, 100)
Dim locbldr71 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(System.Boolean))
locbldr71.SetLocalSymInfo("b1")
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 1)
EmitLdcI8IL.MarkSequencePoint(doc3, 737, 1, 737, 100)
Dim locbldr72 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(System.Boolean))
locbldr72.SetLocalSymInfo("b2")
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 2)
EmitLdcI8IL.MarkSequencePoint(doc3, 741, 1, 741, 100)
Dim label16 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.MarkSequencePoint(doc3, 743, 1, 743, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(-1))
Typ = GetType(System.Int64)
Dim fa233 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru233 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont233 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru233)
EmitLdcI8IL.Emit(OpCodes.Br, fa233)
EmitLdcI8IL.MarkLabel(tru233)
EmitLdcI8IL.MarkSequencePoint(doc3, 744, 1, 744, 100)
Dim typ196(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ196(UBound(typ196) + 1)
typ196(UBound(typ196)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ196))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ196).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 745, 1, 745, 100)
Dim typ197(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ197(UBound(typ197) + 1)
typ197(UBound(typ197)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ197))
Typ = Typ03.GetMethod("Emit", typ197).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 746, 1, 746, 100)
Dim typ198(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ198(UBound(typ198) + 1)
typ198(UBound(typ198)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ198))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ198).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 747, 1, 747, 100)
Dim typ199(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ199(UBound(typ199) + 1)
typ199(UBound(typ199)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ199))
Typ = Typ03.GetMethod("Emit", typ199).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 748, 1, 748, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 749, 1, 749, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont233)
EmitLdcI8IL.MarkLabel(fa233)
EmitLdcI8IL.Emit(OpCodes.Br, cont233)
EmitLdcI8IL.MarkLabel(cont233)
EmitLdcI8IL.MarkSequencePoint(doc3, 751, 1, 751, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
Dim fa234 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru234 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont234 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru234)
EmitLdcI8IL.Emit(OpCodes.Br, fa234)
EmitLdcI8IL.MarkLabel(tru234)
EmitLdcI8IL.MarkSequencePoint(doc3, 752, 1, 752, 100)
Dim typ200(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ200(UBound(typ200) + 1)
typ200(UBound(typ200)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ200))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ200).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 753, 1, 753, 100)
Dim typ201(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ201(UBound(typ201) + 1)
typ201(UBound(typ201)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ201))
Typ = Typ03.GetMethod("Emit", typ201).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 754, 1, 754, 100)
Dim typ202(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ202(UBound(typ202) + 1)
typ202(UBound(typ202)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ202))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ202).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 755, 1, 755, 100)
Dim typ203(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ203(UBound(typ203) + 1)
typ203(UBound(typ203)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ203))
Typ = Typ03.GetMethod("Emit", typ203).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 756, 1, 756, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 757, 1, 757, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont234)
EmitLdcI8IL.MarkLabel(fa234)
EmitLdcI8IL.Emit(OpCodes.Br, cont234)
EmitLdcI8IL.MarkLabel(cont234)
EmitLdcI8IL.MarkSequencePoint(doc3, 759, 1, 759, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(1))
Typ = GetType(System.Int64)
Dim fa235 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru235 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont235 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru235)
EmitLdcI8IL.Emit(OpCodes.Br, fa235)
EmitLdcI8IL.MarkLabel(tru235)
EmitLdcI8IL.MarkSequencePoint(doc3, 760, 1, 760, 100)
Dim typ204(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ204(UBound(typ204) + 1)
typ204(UBound(typ204)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ204))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ204).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 761, 1, 761, 100)
Dim typ205(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ205(UBound(typ205) + 1)
typ205(UBound(typ205)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ205))
Typ = Typ03.GetMethod("Emit", typ205).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 762, 1, 762, 100)
Dim typ206(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ206(UBound(typ206) + 1)
typ206(UBound(typ206)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ206))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ206).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 763, 1, 763, 100)
Dim typ207(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ207(UBound(typ207) + 1)
typ207(UBound(typ207)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ207))
Typ = Typ03.GetMethod("Emit", typ207).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 764, 1, 764, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 765, 1, 765, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont235)
EmitLdcI8IL.MarkLabel(fa235)
EmitLdcI8IL.Emit(OpCodes.Br, cont235)
EmitLdcI8IL.MarkLabel(cont235)
EmitLdcI8IL.MarkSequencePoint(doc3, 767, 1, 767, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(2))
Typ = GetType(System.Int64)
Dim fa236 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru236 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont236 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru236)
EmitLdcI8IL.Emit(OpCodes.Br, fa236)
EmitLdcI8IL.MarkLabel(tru236)
EmitLdcI8IL.MarkSequencePoint(doc3, 768, 1, 768, 100)
Dim typ208(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ208(UBound(typ208) + 1)
typ208(UBound(typ208)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ208))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ208).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 769, 1, 769, 100)
Dim typ209(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ209(UBound(typ209) + 1)
typ209(UBound(typ209)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ209))
Typ = Typ03.GetMethod("Emit", typ209).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 770, 1, 770, 100)
Dim typ210(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ210(UBound(typ210) + 1)
typ210(UBound(typ210)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ210))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ210).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 771, 1, 771, 100)
Dim typ211(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ211(UBound(typ211) + 1)
typ211(UBound(typ211)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ211))
Typ = Typ03.GetMethod("Emit", typ211).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 772, 1, 772, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 773, 1, 773, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont236)
EmitLdcI8IL.MarkLabel(fa236)
EmitLdcI8IL.Emit(OpCodes.Br, cont236)
EmitLdcI8IL.MarkLabel(cont236)
EmitLdcI8IL.MarkSequencePoint(doc3, 775, 1, 775, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(3))
Typ = GetType(System.Int64)
Dim fa237 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru237 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont237 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru237)
EmitLdcI8IL.Emit(OpCodes.Br, fa237)
EmitLdcI8IL.MarkLabel(tru237)
EmitLdcI8IL.MarkSequencePoint(doc3, 776, 1, 776, 100)
Dim typ212(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ212(UBound(typ212) + 1)
typ212(UBound(typ212)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ212))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ212).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 777, 1, 777, 100)
Dim typ213(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ213(UBound(typ213) + 1)
typ213(UBound(typ213)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ213))
Typ = Typ03.GetMethod("Emit", typ213).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 778, 1, 778, 100)
Dim typ214(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ214(UBound(typ214) + 1)
typ214(UBound(typ214)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ214))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ214).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 779, 1, 779, 100)
Dim typ215(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ215(UBound(typ215) + 1)
typ215(UBound(typ215)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ215))
Typ = Typ03.GetMethod("Emit", typ215).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 780, 1, 780, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 781, 1, 781, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont237)
EmitLdcI8IL.MarkLabel(fa237)
EmitLdcI8IL.Emit(OpCodes.Br, cont237)
EmitLdcI8IL.MarkLabel(cont237)
EmitLdcI8IL.MarkSequencePoint(doc3, 783, 1, 783, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(4))
Typ = GetType(System.Int64)
Dim fa238 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru238 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont238 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru238)
EmitLdcI8IL.Emit(OpCodes.Br, fa238)
EmitLdcI8IL.MarkLabel(tru238)
EmitLdcI8IL.MarkSequencePoint(doc3, 784, 1, 784, 100)
Dim typ216(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ216(UBound(typ216) + 1)
typ216(UBound(typ216)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ216))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ216).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 785, 1, 785, 100)
Dim typ217(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ217(UBound(typ217) + 1)
typ217(UBound(typ217)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ217))
Typ = Typ03.GetMethod("Emit", typ217).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 786, 1, 786, 100)
Dim typ218(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ218(UBound(typ218) + 1)
typ218(UBound(typ218)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ218))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ218).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 787, 1, 787, 100)
Dim typ219(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ219(UBound(typ219) + 1)
typ219(UBound(typ219)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ219))
Typ = Typ03.GetMethod("Emit", typ219).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 788, 1, 788, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 789, 1, 789, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont238)
EmitLdcI8IL.MarkLabel(fa238)
EmitLdcI8IL.Emit(OpCodes.Br, cont238)
EmitLdcI8IL.MarkLabel(cont238)
EmitLdcI8IL.MarkSequencePoint(doc3, 791, 1, 791, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(5))
Typ = GetType(System.Int64)
Dim fa239 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru239 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont239 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru239)
EmitLdcI8IL.Emit(OpCodes.Br, fa239)
EmitLdcI8IL.MarkLabel(tru239)
EmitLdcI8IL.MarkSequencePoint(doc3, 792, 1, 792, 100)
Dim typ220(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ220(UBound(typ220) + 1)
typ220(UBound(typ220)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ220))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ220).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 793, 1, 793, 100)
Dim typ221(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ221(UBound(typ221) + 1)
typ221(UBound(typ221)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ221))
Typ = Typ03.GetMethod("Emit", typ221).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 794, 1, 794, 100)
Dim typ222(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ222(UBound(typ222) + 1)
typ222(UBound(typ222)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ222))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ222).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 795, 1, 795, 100)
Dim typ223(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ223(UBound(typ223) + 1)
typ223(UBound(typ223)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ223))
Typ = Typ03.GetMethod("Emit", typ223).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 796, 1, 796, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 797, 1, 797, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont239)
EmitLdcI8IL.MarkLabel(fa239)
EmitLdcI8IL.Emit(OpCodes.Br, cont239)
EmitLdcI8IL.MarkLabel(cont239)
EmitLdcI8IL.MarkSequencePoint(doc3, 799, 1, 799, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(6))
Typ = GetType(System.Int64)
Dim fa240 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru240 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont240 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru240)
EmitLdcI8IL.Emit(OpCodes.Br, fa240)
EmitLdcI8IL.MarkLabel(tru240)
EmitLdcI8IL.MarkSequencePoint(doc3, 800, 1, 800, 100)
Dim typ224(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ224(UBound(typ224) + 1)
typ224(UBound(typ224)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ224))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ224).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 801, 1, 801, 100)
Dim typ225(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ225(UBound(typ225) + 1)
typ225(UBound(typ225)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ225))
Typ = Typ03.GetMethod("Emit", typ225).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 802, 1, 802, 100)
Dim typ226(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ226(UBound(typ226) + 1)
typ226(UBound(typ226)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ226))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ226).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 803, 1, 803, 100)
Dim typ227(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ227(UBound(typ227) + 1)
typ227(UBound(typ227)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ227))
Typ = Typ03.GetMethod("Emit", typ227).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 804, 1, 804, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 805, 1, 805, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont240)
EmitLdcI8IL.MarkLabel(fa240)
EmitLdcI8IL.Emit(OpCodes.Br, cont240)
EmitLdcI8IL.MarkLabel(cont240)
EmitLdcI8IL.MarkSequencePoint(doc3, 807, 1, 807, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(7))
Typ = GetType(System.Int64)
Dim fa241 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru241 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont241 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru241)
EmitLdcI8IL.Emit(OpCodes.Br, fa241)
EmitLdcI8IL.MarkLabel(tru241)
EmitLdcI8IL.MarkSequencePoint(doc3, 808, 1, 808, 100)
Dim typ228(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ228(UBound(typ228) + 1)
typ228(UBound(typ228)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ228))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ228).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 809, 1, 809, 100)
Dim typ229(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ229(UBound(typ229) + 1)
typ229(UBound(typ229)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ229))
Typ = Typ03.GetMethod("Emit", typ229).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 810, 1, 810, 100)
Dim typ230(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ230(UBound(typ230) + 1)
typ230(UBound(typ230)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ230))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ230).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 811, 1, 811, 100)
Dim typ231(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ231(UBound(typ231) + 1)
typ231(UBound(typ231)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ231))
Typ = Typ03.GetMethod("Emit", typ231).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 812, 1, 812, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 813, 1, 813, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont241)
EmitLdcI8IL.MarkLabel(fa241)
EmitLdcI8IL.Emit(OpCodes.Br, cont241)
EmitLdcI8IL.MarkLabel(cont241)
EmitLdcI8IL.MarkSequencePoint(doc3, 815, 1, 815, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(8))
Typ = GetType(System.Int64)
Dim fa242 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru242 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont242 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru242)
EmitLdcI8IL.Emit(OpCodes.Br, fa242)
EmitLdcI8IL.MarkLabel(tru242)
EmitLdcI8IL.MarkSequencePoint(doc3, 816, 1, 816, 100)
Dim typ232(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ232(UBound(typ232) + 1)
typ232(UBound(typ232)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ232))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ232).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 817, 1, 817, 100)
Dim typ233(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ233(UBound(typ233) + 1)
typ233(UBound(typ233)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ233))
Typ = Typ03.GetMethod("Emit", typ233).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 818, 1, 818, 100)
Dim typ234(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ234(UBound(typ234) + 1)
typ234(UBound(typ234)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ234))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ234).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 819, 1, 819, 100)
Dim typ235(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ235(UBound(typ235) + 1)
typ235(UBound(typ235)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ235))
Typ = Typ03.GetMethod("Emit", typ235).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 820, 1, 820, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 821, 1, 821, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont242)
EmitLdcI8IL.MarkLabel(fa242)
EmitLdcI8IL.Emit(OpCodes.Br, cont242)
EmitLdcI8IL.MarkLabel(cont242)
EmitLdcI8IL.MarkSequencePoint(doc3, 823, 1, 823, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(-2147483648))
Typ = GetType(System.Int64)
Dim fa243 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru243 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont243 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Bge, tru243)
EmitLdcI8IL.Emit(OpCodes.Br, fa243)
EmitLdcI8IL.MarkLabel(tru243)
EmitLdcI8IL.MarkSequencePoint(doc3, 824, 1, 824, 100)
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 1)
EmitLdcI8IL.MarkSequencePoint(doc3, 825, 1, 825, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont243)
EmitLdcI8IL.MarkLabel(fa243)
EmitLdcI8IL.Emit(OpCodes.Br, cont243)
EmitLdcI8IL.MarkLabel(cont243)
EmitLdcI8IL.MarkSequencePoint(doc3, 826, 1, 826, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(2147483647))
Typ = GetType(System.Int64)
Dim fa244 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru244 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont244 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Ble, tru244)
EmitLdcI8IL.Emit(OpCodes.Br, fa244)
EmitLdcI8IL.MarkLabel(tru244)
EmitLdcI8IL.MarkSequencePoint(doc3, 827, 1, 827, 100)
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 2)
EmitLdcI8IL.MarkSequencePoint(doc3, 828, 1, 828, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont244)
EmitLdcI8IL.MarkLabel(fa244)
EmitLdcI8IL.Emit(OpCodes.Br, cont244)
EmitLdcI8IL.MarkLabel(cont244)
EmitLdcI8IL.MarkSequencePoint(doc3, 829, 1, 829, 100)
EmitLdcI8IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.And)
EmitLdcI8IL.Emit(OpCodes.Stloc, 2)
EmitLdcI8IL.MarkSequencePoint(doc3, 831, 1, 831, 100)
EmitLdcI8IL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa245 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru245 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont245 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru245)
EmitLdcI8IL.Emit(OpCodes.Br, fa245)
EmitLdcI8IL.MarkLabel(tru245)
EmitLdcI8IL.MarkSequencePoint(doc3, 832, 1, 832, 100)
Dim typ236(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ236(UBound(typ236) + 1)
typ236(UBound(typ236)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ236))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ236).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 833, 1, 833, 100)
Dim locbldr73 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(System.Int32))
locbldr73.SetLocalSymInfo("num")
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
Dim typ237 As Type() = {Typ}
EmitLdcI8IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ237))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ237).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 3)
EmitLdcI8IL.MarkSequencePoint(doc3, 834, 1, 834, 100)
Dim typ238(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ238(UBound(typ238) + 1)
typ238(UBound(typ238)) = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
ReDim Preserve typ238(UBound(typ238) + 1)
typ238(UBound(typ238)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ238))
Typ = Typ03.GetMethod("Emit", typ238).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 835, 1, 835, 100)
Dim typ239(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ239(UBound(typ239) + 1)
typ239(UBound(typ239)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ239))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ239).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 836, 1, 836, 100)
Dim typ240(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ240(UBound(typ240) + 1)
typ240(UBound(typ240)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ240))
Typ = Typ03.GetMethod("Emit", typ240).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 838, 1, 838, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 839, 1, 839, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont245)
EmitLdcI8IL.MarkLabel(fa245)
EmitLdcI8IL.Emit(OpCodes.Br, cont245)
EmitLdcI8IL.MarkLabel(cont245)
EmitLdcI8IL.MarkSequencePoint(doc3, 842, 1, 842, 100)
Dim typ241(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i8")
Typ = GetType(System.String)
ReDim Preserve typ241(UBound(typ241) + 1)
typ241(UBound(typ241)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ241))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ241).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 844, 1, 844, 100)
Dim typ242(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ242(UBound(typ242) + 1)
typ242(UBound(typ242)) = Typ
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
ReDim Preserve typ242(UBound(typ242) + 1)
typ242(UBound(typ242)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ242))
Typ = Typ03.GetMethod("Emit", typ242).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 845, 1, 845, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 848, 1, 848, 100)
EmitLdcI8IL.MarkLabel(label16)
EmitLdcI8IL.MarkSequencePoint(doc3, 849, 1, 849, 100)
EmitLdcI8IL.Emit(OpCodes.Ret)
Dim typ243(-1) As Type
ReDim Preserve typ243(UBound(typ243) + 1)
typ243(UBound(typ243)) = GetType(System.Int32)
Dim EmitLdcI4 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI4", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ243)
Dim EmitLdcI4IL As ILGenerator = EmitLdcI4.GetILGenerator()
Dim EmitLdcI4param01 As ParameterBuilder = EmitLdcI4.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdcI4IL.MarkSequencePoint(doc3, 852, 1, 852, 100)
Dim locbldr74 As LocalBuilder = EmitLdcI4IL.DeclareLocal(GetType(OpCode))
locbldr74.SetLocalSymInfo("op")
EmitLdcI4IL.MarkSequencePoint(doc3, 858, 1, 858, 100)
Dim label17 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.MarkSequencePoint(doc3, 860, 1, 860, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa246 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru246 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont246 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru246)
EmitLdcI4IL.Emit(OpCodes.Br, fa246)
EmitLdcI4IL.MarkLabel(tru246)
EmitLdcI4IL.MarkSequencePoint(doc3, 861, 1, 861, 100)
Dim typ244(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ244(UBound(typ244) + 1)
typ244(UBound(typ244)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ244))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ244).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 862, 1, 862, 100)
Dim typ245(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ245(UBound(typ245) + 1)
typ245(UBound(typ245)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ245))
Typ = Typ03.GetMethod("Emit", typ245).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 863, 1, 863, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 864, 1, 864, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont246)
EmitLdcI4IL.MarkLabel(fa246)
EmitLdcI4IL.Emit(OpCodes.Br, cont246)
EmitLdcI4IL.MarkLabel(cont246)
EmitLdcI4IL.MarkSequencePoint(doc3, 866, 1, 866, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa247 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru247 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont247 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru247)
EmitLdcI4IL.Emit(OpCodes.Br, fa247)
EmitLdcI4IL.MarkLabel(tru247)
EmitLdcI4IL.MarkSequencePoint(doc3, 867, 1, 867, 100)
Dim typ246(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ246(UBound(typ246) + 1)
typ246(UBound(typ246)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ246))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ246).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 868, 1, 868, 100)
Dim typ247(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ247(UBound(typ247) + 1)
typ247(UBound(typ247)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ247))
Typ = Typ03.GetMethod("Emit", typ247).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 869, 1, 869, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 870, 1, 870, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont247)
EmitLdcI4IL.MarkLabel(fa247)
EmitLdcI4IL.Emit(OpCodes.Br, cont247)
EmitLdcI4IL.MarkLabel(cont247)
EmitLdcI4IL.MarkSequencePoint(doc3, 872, 1, 872, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa248 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru248 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont248 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru248)
EmitLdcI4IL.Emit(OpCodes.Br, fa248)
EmitLdcI4IL.MarkLabel(tru248)
EmitLdcI4IL.MarkSequencePoint(doc3, 873, 1, 873, 100)
Dim typ248(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ248(UBound(typ248) + 1)
typ248(UBound(typ248)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ248))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ248).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 874, 1, 874, 100)
Dim typ249(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ249(UBound(typ249) + 1)
typ249(UBound(typ249)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ249))
Typ = Typ03.GetMethod("Emit", typ249).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 875, 1, 875, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 876, 1, 876, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont248)
EmitLdcI4IL.MarkLabel(fa248)
EmitLdcI4IL.Emit(OpCodes.Br, cont248)
EmitLdcI4IL.MarkLabel(cont248)
EmitLdcI4IL.MarkSequencePoint(doc3, 878, 1, 878, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa249 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru249 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont249 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru249)
EmitLdcI4IL.Emit(OpCodes.Br, fa249)
EmitLdcI4IL.MarkLabel(tru249)
EmitLdcI4IL.MarkSequencePoint(doc3, 879, 1, 879, 100)
Dim typ250(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ250(UBound(typ250) + 1)
typ250(UBound(typ250)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ250))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ250).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 880, 1, 880, 100)
Dim typ251(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ251(UBound(typ251) + 1)
typ251(UBound(typ251)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ251))
Typ = Typ03.GetMethod("Emit", typ251).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 881, 1, 881, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 882, 1, 882, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont249)
EmitLdcI4IL.MarkLabel(fa249)
EmitLdcI4IL.Emit(OpCodes.Br, cont249)
EmitLdcI4IL.MarkLabel(cont249)
EmitLdcI4IL.MarkSequencePoint(doc3, 884, 1, 884, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa250 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru250 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont250 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru250)
EmitLdcI4IL.Emit(OpCodes.Br, fa250)
EmitLdcI4IL.MarkLabel(tru250)
EmitLdcI4IL.MarkSequencePoint(doc3, 885, 1, 885, 100)
Dim typ252(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ252(UBound(typ252) + 1)
typ252(UBound(typ252)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ252))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ252).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 886, 1, 886, 100)
Dim typ253(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ253(UBound(typ253) + 1)
typ253(UBound(typ253)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ253))
Typ = Typ03.GetMethod("Emit", typ253).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 887, 1, 887, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 888, 1, 888, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont250)
EmitLdcI4IL.MarkLabel(fa250)
EmitLdcI4IL.Emit(OpCodes.Br, cont250)
EmitLdcI4IL.MarkLabel(cont250)
EmitLdcI4IL.MarkSequencePoint(doc3, 890, 1, 890, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
Dim fa251 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru251 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont251 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru251)
EmitLdcI4IL.Emit(OpCodes.Br, fa251)
EmitLdcI4IL.MarkLabel(tru251)
EmitLdcI4IL.MarkSequencePoint(doc3, 891, 1, 891, 100)
Dim typ254(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ254(UBound(typ254) + 1)
typ254(UBound(typ254)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ254))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ254).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 892, 1, 892, 100)
Dim typ255(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ255(UBound(typ255) + 1)
typ255(UBound(typ255)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ255))
Typ = Typ03.GetMethod("Emit", typ255).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 893, 1, 893, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 894, 1, 894, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont251)
EmitLdcI4IL.MarkLabel(fa251)
EmitLdcI4IL.Emit(OpCodes.Br, cont251)
EmitLdcI4IL.MarkLabel(cont251)
EmitLdcI4IL.MarkSequencePoint(doc3, 896, 1, 896, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
Dim fa252 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru252 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont252 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru252)
EmitLdcI4IL.Emit(OpCodes.Br, fa252)
EmitLdcI4IL.MarkLabel(tru252)
EmitLdcI4IL.MarkSequencePoint(doc3, 897, 1, 897, 100)
Dim typ256(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ256(UBound(typ256) + 1)
typ256(UBound(typ256)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ256))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ256).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 898, 1, 898, 100)
Dim typ257(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ257(UBound(typ257) + 1)
typ257(UBound(typ257)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ257))
Typ = Typ03.GetMethod("Emit", typ257).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 899, 1, 899, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 900, 1, 900, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont252)
EmitLdcI4IL.MarkLabel(fa252)
EmitLdcI4IL.Emit(OpCodes.Br, cont252)
EmitLdcI4IL.MarkLabel(cont252)
EmitLdcI4IL.MarkSequencePoint(doc3, 902, 1, 902, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
Dim fa253 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru253 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont253 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru253)
EmitLdcI4IL.Emit(OpCodes.Br, fa253)
EmitLdcI4IL.MarkLabel(tru253)
EmitLdcI4IL.MarkSequencePoint(doc3, 903, 1, 903, 100)
Dim typ258(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ258(UBound(typ258) + 1)
typ258(UBound(typ258)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ258))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ258).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 904, 1, 904, 100)
Dim typ259(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ259(UBound(typ259) + 1)
typ259(UBound(typ259)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ259))
Typ = Typ03.GetMethod("Emit", typ259).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 905, 1, 905, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 906, 1, 906, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont253)
EmitLdcI4IL.MarkLabel(fa253)
EmitLdcI4IL.Emit(OpCodes.Br, cont253)
EmitLdcI4IL.MarkLabel(cont253)
EmitLdcI4IL.MarkSequencePoint(doc3, 908, 1, 908, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
Dim fa254 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru254 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont254 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru254)
EmitLdcI4IL.Emit(OpCodes.Br, fa254)
EmitLdcI4IL.MarkLabel(tru254)
EmitLdcI4IL.MarkSequencePoint(doc3, 909, 1, 909, 100)
Dim typ260(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ260(UBound(typ260) + 1)
typ260(UBound(typ260)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ260))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ260).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 910, 1, 910, 100)
Dim typ261(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ261(UBound(typ261) + 1)
typ261(UBound(typ261)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ261))
Typ = Typ03.GetMethod("Emit", typ261).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 911, 1, 911, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 912, 1, 912, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont254)
EmitLdcI4IL.MarkLabel(fa254)
EmitLdcI4IL.Emit(OpCodes.Br, cont254)
EmitLdcI4IL.MarkLabel(cont254)
EmitLdcI4IL.MarkSequencePoint(doc3, 914, 1, 914, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
Dim fa255 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru255 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont255 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru255)
EmitLdcI4IL.Emit(OpCodes.Br, fa255)
EmitLdcI4IL.MarkLabel(tru255)
EmitLdcI4IL.MarkSequencePoint(doc3, 915, 1, 915, 100)
Dim typ262(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ262(UBound(typ262) + 1)
typ262(UBound(typ262)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ262))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ262).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 916, 1, 916, 100)
Dim typ263(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ263(UBound(typ263) + 1)
typ263(UBound(typ263)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ263))
Typ = Typ03.GetMethod("Emit", typ263).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 917, 1, 917, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 918, 1, 918, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont255)
EmitLdcI4IL.MarkLabel(fa255)
EmitLdcI4IL.Emit(OpCodes.Br, cont255)
EmitLdcI4IL.MarkLabel(cont255)
EmitLdcI4IL.MarkSequencePoint(doc3, 936, 1, 936, 100)
Dim typ264(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ264(UBound(typ264) + 1)
typ264(UBound(typ264)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ264))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ264).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 938, 1, 938, 100)
Dim typ265(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ265(UBound(typ265) + 1)
typ265(UBound(typ265)) = Typ
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ265(UBound(typ265) + 1)
typ265(UBound(typ265)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ265))
Typ = Typ03.GetMethod("Emit", typ265).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 939, 1, 939, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 942, 1, 942, 100)
EmitLdcI4IL.MarkLabel(label17)
EmitLdcI4IL.MarkSequencePoint(doc3, 943, 1, 943, 100)
EmitLdcI4IL.Emit(OpCodes.Ret)
Dim typ266(-1) As Type
ReDim Preserve typ266(UBound(typ266) + 1)
typ266(UBound(typ266)) = GetType(System.Int16)
Dim EmitLdcI2 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI2", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ266)
Dim EmitLdcI2IL As ILGenerator = EmitLdcI2.GetILGenerator()
Dim EmitLdcI2param01 As ParameterBuilder = EmitLdcI2.DefineParameter(1, ParameterAttributes.None, "n")
EmitLdcI2IL.MarkSequencePoint(doc3, 946, 1, 946, 100)
Dim locbldr75 As LocalBuilder = EmitLdcI2IL.DeclareLocal(GetType(OpCode))
locbldr75.SetLocalSymInfo("op")
EmitLdcI2IL.MarkSequencePoint(doc3, 947, 1, 947, 100)
Dim locbldr76 As LocalBuilder = EmitLdcI2IL.DeclareLocal(GetType(System.Int32))
locbldr76.SetLocalSymInfo("num")
EmitLdcI2IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int16)
Dim typ267 As Type() = {Typ}
EmitLdcI2IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ267))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ267).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 1)
EmitLdcI2IL.MarkSequencePoint(doc3, 953, 1, 953, 100)
Dim label18 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.MarkSequencePoint(doc3, 955, 1, 955, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa256 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru256 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont256 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru256)
EmitLdcI2IL.Emit(OpCodes.Br, fa256)
EmitLdcI2IL.MarkLabel(tru256)
EmitLdcI2IL.MarkSequencePoint(doc3, 956, 1, 956, 100)
Dim typ268(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ268(UBound(typ268) + 1)
typ268(UBound(typ268)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ268))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ268).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 957, 1, 957, 100)
Dim typ269(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ269(UBound(typ269) + 1)
typ269(UBound(typ269)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ269))
Typ = Typ03.GetMethod("Emit", typ269).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 958, 1, 958, 100)
Dim typ270(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ270(UBound(typ270) + 1)
typ270(UBound(typ270)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ270))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ270).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 959, 1, 959, 100)
Dim typ271(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ271(UBound(typ271) + 1)
typ271(UBound(typ271)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ271))
Typ = Typ03.GetMethod("Emit", typ271).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 960, 1, 960, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 961, 1, 961, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont256)
EmitLdcI2IL.MarkLabel(fa256)
EmitLdcI2IL.Emit(OpCodes.Br, cont256)
EmitLdcI2IL.MarkLabel(cont256)
EmitLdcI2IL.MarkSequencePoint(doc3, 963, 1, 963, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa257 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru257 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont257 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru257)
EmitLdcI2IL.Emit(OpCodes.Br, fa257)
EmitLdcI2IL.MarkLabel(tru257)
EmitLdcI2IL.MarkSequencePoint(doc3, 964, 1, 964, 100)
Dim typ272(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ272(UBound(typ272) + 1)
typ272(UBound(typ272)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ272))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ272).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 965, 1, 965, 100)
Dim typ273(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ273(UBound(typ273) + 1)
typ273(UBound(typ273)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ273))
Typ = Typ03.GetMethod("Emit", typ273).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 966, 1, 966, 100)
Dim typ274(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ274(UBound(typ274) + 1)
typ274(UBound(typ274)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ274))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ274).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 967, 1, 967, 100)
Dim typ275(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ275(UBound(typ275) + 1)
typ275(UBound(typ275)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ275))
Typ = Typ03.GetMethod("Emit", typ275).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 968, 1, 968, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 969, 1, 969, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont257)
EmitLdcI2IL.MarkLabel(fa257)
EmitLdcI2IL.Emit(OpCodes.Br, cont257)
EmitLdcI2IL.MarkLabel(cont257)
EmitLdcI2IL.MarkSequencePoint(doc3, 971, 1, 971, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa258 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru258 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont258 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru258)
EmitLdcI2IL.Emit(OpCodes.Br, fa258)
EmitLdcI2IL.MarkLabel(tru258)
EmitLdcI2IL.MarkSequencePoint(doc3, 972, 1, 972, 100)
Dim typ276(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ276(UBound(typ276) + 1)
typ276(UBound(typ276)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ276))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ276).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 973, 1, 973, 100)
Dim typ277(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ277(UBound(typ277) + 1)
typ277(UBound(typ277)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ277))
Typ = Typ03.GetMethod("Emit", typ277).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 974, 1, 974, 100)
Dim typ278(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ278(UBound(typ278) + 1)
typ278(UBound(typ278)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ278))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ278).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 975, 1, 975, 100)
Dim typ279(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ279(UBound(typ279) + 1)
typ279(UBound(typ279)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ279))
Typ = Typ03.GetMethod("Emit", typ279).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 976, 1, 976, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 977, 1, 977, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont258)
EmitLdcI2IL.MarkLabel(fa258)
EmitLdcI2IL.Emit(OpCodes.Br, cont258)
EmitLdcI2IL.MarkLabel(cont258)
EmitLdcI2IL.MarkSequencePoint(doc3, 979, 1, 979, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa259 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru259 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont259 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru259)
EmitLdcI2IL.Emit(OpCodes.Br, fa259)
EmitLdcI2IL.MarkLabel(tru259)
EmitLdcI2IL.MarkSequencePoint(doc3, 980, 1, 980, 100)
Dim typ280(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ280(UBound(typ280) + 1)
typ280(UBound(typ280)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ280))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ280).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 981, 1, 981, 100)
Dim typ281(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ281(UBound(typ281) + 1)
typ281(UBound(typ281)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ281))
Typ = Typ03.GetMethod("Emit", typ281).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 982, 1, 982, 100)
Dim typ282(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ282(UBound(typ282) + 1)
typ282(UBound(typ282)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ282))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ282).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 983, 1, 983, 100)
Dim typ283(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ283(UBound(typ283) + 1)
typ283(UBound(typ283)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ283))
Typ = Typ03.GetMethod("Emit", typ283).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 984, 1, 984, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 985, 1, 985, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont259)
EmitLdcI2IL.MarkLabel(fa259)
EmitLdcI2IL.Emit(OpCodes.Br, cont259)
EmitLdcI2IL.MarkLabel(cont259)
EmitLdcI2IL.MarkSequencePoint(doc3, 987, 1, 987, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa260 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru260 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont260 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru260)
EmitLdcI2IL.Emit(OpCodes.Br, fa260)
EmitLdcI2IL.MarkLabel(tru260)
EmitLdcI2IL.MarkSequencePoint(doc3, 988, 1, 988, 100)
Dim typ284(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ284(UBound(typ284) + 1)
typ284(UBound(typ284)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ284))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ284).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 989, 1, 989, 100)
Dim typ285(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ285(UBound(typ285) + 1)
typ285(UBound(typ285)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ285))
Typ = Typ03.GetMethod("Emit", typ285).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 990, 1, 990, 100)
Dim typ286(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ286(UBound(typ286) + 1)
typ286(UBound(typ286)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ286))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ286).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 991, 1, 991, 100)
Dim typ287(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ287(UBound(typ287) + 1)
typ287(UBound(typ287)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ287))
Typ = Typ03.GetMethod("Emit", typ287).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 992, 1, 992, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 993, 1, 993, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont260)
EmitLdcI2IL.MarkLabel(fa260)
EmitLdcI2IL.Emit(OpCodes.Br, cont260)
EmitLdcI2IL.MarkLabel(cont260)
EmitLdcI2IL.MarkSequencePoint(doc3, 995, 1, 995, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
Dim fa261 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru261 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont261 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru261)
EmitLdcI2IL.Emit(OpCodes.Br, fa261)
EmitLdcI2IL.MarkLabel(tru261)
EmitLdcI2IL.MarkSequencePoint(doc3, 996, 1, 996, 100)
Dim typ288(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ288(UBound(typ288) + 1)
typ288(UBound(typ288)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ288))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ288).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 997, 1, 997, 100)
Dim typ289(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ289(UBound(typ289) + 1)
typ289(UBound(typ289)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ289))
Typ = Typ03.GetMethod("Emit", typ289).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 998, 1, 998, 100)
Dim typ290(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ290(UBound(typ290) + 1)
typ290(UBound(typ290)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ290))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ290).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 999, 1, 999, 100)
Dim typ291(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ291(UBound(typ291) + 1)
typ291(UBound(typ291)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ291))
Typ = Typ03.GetMethod("Emit", typ291).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1000, 1, 1000, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 1001, 1, 1001, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont261)
EmitLdcI2IL.MarkLabel(fa261)
EmitLdcI2IL.Emit(OpCodes.Br, cont261)
EmitLdcI2IL.MarkLabel(cont261)
EmitLdcI2IL.MarkSequencePoint(doc3, 1003, 1, 1003, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
Dim fa262 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru262 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont262 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru262)
EmitLdcI2IL.Emit(OpCodes.Br, fa262)
EmitLdcI2IL.MarkLabel(tru262)
EmitLdcI2IL.MarkSequencePoint(doc3, 1004, 1, 1004, 100)
Dim typ292(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ292(UBound(typ292) + 1)
typ292(UBound(typ292)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ292))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ292).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1005, 1, 1005, 100)
Dim typ293(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ293(UBound(typ293) + 1)
typ293(UBound(typ293)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ293))
Typ = Typ03.GetMethod("Emit", typ293).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1006, 1, 1006, 100)
Dim typ294(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ294(UBound(typ294) + 1)
typ294(UBound(typ294)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ294))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ294).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1007, 1, 1007, 100)
Dim typ295(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ295(UBound(typ295) + 1)
typ295(UBound(typ295)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ295))
Typ = Typ03.GetMethod("Emit", typ295).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1008, 1, 1008, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 1009, 1, 1009, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont262)
EmitLdcI2IL.MarkLabel(fa262)
EmitLdcI2IL.Emit(OpCodes.Br, cont262)
EmitLdcI2IL.MarkLabel(cont262)
EmitLdcI2IL.MarkSequencePoint(doc3, 1011, 1, 1011, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
Dim fa263 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru263 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont263 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru263)
EmitLdcI2IL.Emit(OpCodes.Br, fa263)
EmitLdcI2IL.MarkLabel(tru263)
EmitLdcI2IL.MarkSequencePoint(doc3, 1012, 1, 1012, 100)
Dim typ296(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ296(UBound(typ296) + 1)
typ296(UBound(typ296)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ296))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ296).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1013, 1, 1013, 100)
Dim typ297(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ297(UBound(typ297) + 1)
typ297(UBound(typ297)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ297))
Typ = Typ03.GetMethod("Emit", typ297).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1014, 1, 1014, 100)
Dim typ298(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ298(UBound(typ298) + 1)
typ298(UBound(typ298)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ298))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ298).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1015, 1, 1015, 100)
Dim typ299(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ299(UBound(typ299) + 1)
typ299(UBound(typ299)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ299))
Typ = Typ03.GetMethod("Emit", typ299).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1016, 1, 1016, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 1017, 1, 1017, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont263)
EmitLdcI2IL.MarkLabel(fa263)
EmitLdcI2IL.Emit(OpCodes.Br, cont263)
EmitLdcI2IL.MarkLabel(cont263)
EmitLdcI2IL.MarkSequencePoint(doc3, 1019, 1, 1019, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
Dim fa264 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru264 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont264 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru264)
EmitLdcI2IL.Emit(OpCodes.Br, fa264)
EmitLdcI2IL.MarkLabel(tru264)
EmitLdcI2IL.MarkSequencePoint(doc3, 1020, 1, 1020, 100)
Dim typ300(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ300(UBound(typ300) + 1)
typ300(UBound(typ300)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ300))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ300).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1021, 1, 1021, 100)
Dim typ301(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ301(UBound(typ301) + 1)
typ301(UBound(typ301)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ301))
Typ = Typ03.GetMethod("Emit", typ301).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1022, 1, 1022, 100)
Dim typ302(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ302(UBound(typ302) + 1)
typ302(UBound(typ302)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ302))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ302).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1023, 1, 1023, 100)
Dim typ303(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ303(UBound(typ303) + 1)
typ303(UBound(typ303)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ303))
Typ = Typ03.GetMethod("Emit", typ303).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1024, 1, 1024, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 1025, 1, 1025, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont264)
EmitLdcI2IL.MarkLabel(fa264)
EmitLdcI2IL.Emit(OpCodes.Br, cont264)
EmitLdcI2IL.MarkLabel(cont264)
EmitLdcI2IL.MarkSequencePoint(doc3, 1027, 1, 1027, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
Dim fa265 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru265 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont265 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru265)
EmitLdcI2IL.Emit(OpCodes.Br, fa265)
EmitLdcI2IL.MarkLabel(tru265)
EmitLdcI2IL.MarkSequencePoint(doc3, 1028, 1, 1028, 100)
Dim typ304(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ304(UBound(typ304) + 1)
typ304(UBound(typ304)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ304))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ304).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1029, 1, 1029, 100)
Dim typ305(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ305(UBound(typ305) + 1)
typ305(UBound(typ305)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ305))
Typ = Typ03.GetMethod("Emit", typ305).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1030, 1, 1030, 100)
Dim typ306(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ306(UBound(typ306) + 1)
typ306(UBound(typ306)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ306))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ306).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1031, 1, 1031, 100)
Dim typ307(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ307(UBound(typ307) + 1)
typ307(UBound(typ307)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ307))
Typ = Typ03.GetMethod("Emit", typ307).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1032, 1, 1032, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 1033, 1, 1033, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont265)
EmitLdcI2IL.MarkLabel(fa265)
EmitLdcI2IL.Emit(OpCodes.Br, cont265)
EmitLdcI2IL.MarkLabel(cont265)
EmitLdcI2IL.MarkSequencePoint(doc3, 1051, 1, 1051, 100)
Dim typ308(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ308(UBound(typ308) + 1)
typ308(UBound(typ308)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ308))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ308).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1053, 1, 1053, 100)
Dim typ309(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ309(UBound(typ309) + 1)
typ309(UBound(typ309)) = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ309(UBound(typ309) + 1)
typ309(UBound(typ309)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ309))
Typ = Typ03.GetMethod("Emit", typ309).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1054, 1, 1054, 100)
Dim typ310(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ310(UBound(typ310) + 1)
typ310(UBound(typ310)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ310))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ310).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 1055, 1, 1055, 100)
Dim typ311(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ311(UBound(typ311) + 1)
typ311(UBound(typ311)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ311))
Typ = Typ03.GetMethod("Emit", typ311).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 1056, 1, 1056, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 1059, 1, 1059, 100)
EmitLdcI2IL.MarkLabel(label18)
EmitLdcI2IL.MarkSequencePoint(doc3, 1060, 1, 1060, 100)
EmitLdcI2IL.Emit(OpCodes.Ret)
Dim typ312(-1) As Type
ReDim Preserve typ312(UBound(typ312) + 1)
typ312(UBound(typ312)) = GetType(System.SByte)
Dim EmitLdcI1 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI1", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ312)
Dim EmitLdcI1IL As ILGenerator = EmitLdcI1.GetILGenerator()
Dim EmitLdcI1param01 As ParameterBuilder = EmitLdcI1.DefineParameter(1, ParameterAttributes.None, "n")
EmitLdcI1IL.MarkSequencePoint(doc3, 1063, 1, 1063, 100)
Dim locbldr77 As LocalBuilder = EmitLdcI1IL.DeclareLocal(GetType(OpCode))
locbldr77.SetLocalSymInfo("op")
EmitLdcI1IL.MarkSequencePoint(doc3, 1064, 1, 1064, 100)
Dim locbldr78 As LocalBuilder = EmitLdcI1IL.DeclareLocal(GetType(System.Int32))
locbldr78.SetLocalSymInfo("num")
EmitLdcI1IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.SByte)
Dim typ313 As Type() = {Typ}
EmitLdcI1IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ313))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ313).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 1)
EmitLdcI1IL.MarkSequencePoint(doc3, 1070, 1, 1070, 100)
Dim label19 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.MarkSequencePoint(doc3, 1072, 1, 1072, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa266 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru266 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont266 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru266)
EmitLdcI1IL.Emit(OpCodes.Br, fa266)
EmitLdcI1IL.MarkLabel(tru266)
EmitLdcI1IL.MarkSequencePoint(doc3, 1073, 1, 1073, 100)
Dim typ314(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ314(UBound(typ314) + 1)
typ314(UBound(typ314)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ314))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ314).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1074, 1, 1074, 100)
Dim typ315(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ315(UBound(typ315) + 1)
typ315(UBound(typ315)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ315))
Typ = Typ03.GetMethod("Emit", typ315).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1075, 1, 1075, 100)
Dim typ316(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ316(UBound(typ316) + 1)
typ316(UBound(typ316)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ316))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ316).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1076, 1, 1076, 100)
Dim typ317(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ317(UBound(typ317) + 1)
typ317(UBound(typ317)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ317))
Typ = Typ03.GetMethod("Emit", typ317).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1077, 1, 1077, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1078, 1, 1078, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont266)
EmitLdcI1IL.MarkLabel(fa266)
EmitLdcI1IL.Emit(OpCodes.Br, cont266)
EmitLdcI1IL.MarkLabel(cont266)
EmitLdcI1IL.MarkSequencePoint(doc3, 1080, 1, 1080, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa267 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru267 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont267 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru267)
EmitLdcI1IL.Emit(OpCodes.Br, fa267)
EmitLdcI1IL.MarkLabel(tru267)
EmitLdcI1IL.MarkSequencePoint(doc3, 1081, 1, 1081, 100)
Dim typ318(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ318(UBound(typ318) + 1)
typ318(UBound(typ318)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ318))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ318).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1082, 1, 1082, 100)
Dim typ319(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ319(UBound(typ319) + 1)
typ319(UBound(typ319)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ319))
Typ = Typ03.GetMethod("Emit", typ319).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1083, 1, 1083, 100)
Dim typ320(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ320(UBound(typ320) + 1)
typ320(UBound(typ320)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ320))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ320).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1084, 1, 1084, 100)
Dim typ321(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ321(UBound(typ321) + 1)
typ321(UBound(typ321)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ321))
Typ = Typ03.GetMethod("Emit", typ321).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1085, 1, 1085, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1086, 1, 1086, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont267)
EmitLdcI1IL.MarkLabel(fa267)
EmitLdcI1IL.Emit(OpCodes.Br, cont267)
EmitLdcI1IL.MarkLabel(cont267)
EmitLdcI1IL.MarkSequencePoint(doc3, 1088, 1, 1088, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa268 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru268 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont268 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru268)
EmitLdcI1IL.Emit(OpCodes.Br, fa268)
EmitLdcI1IL.MarkLabel(tru268)
EmitLdcI1IL.MarkSequencePoint(doc3, 1089, 1, 1089, 100)
Dim typ322(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ322(UBound(typ322) + 1)
typ322(UBound(typ322)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ322))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ322).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1090, 1, 1090, 100)
Dim typ323(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ323(UBound(typ323) + 1)
typ323(UBound(typ323)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ323))
Typ = Typ03.GetMethod("Emit", typ323).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1091, 1, 1091, 100)
Dim typ324(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ324(UBound(typ324) + 1)
typ324(UBound(typ324)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ324))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ324).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1092, 1, 1092, 100)
Dim typ325(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ325(UBound(typ325) + 1)
typ325(UBound(typ325)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ325))
Typ = Typ03.GetMethod("Emit", typ325).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1093, 1, 1093, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1094, 1, 1094, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont268)
EmitLdcI1IL.MarkLabel(fa268)
EmitLdcI1IL.Emit(OpCodes.Br, cont268)
EmitLdcI1IL.MarkLabel(cont268)
EmitLdcI1IL.MarkSequencePoint(doc3, 1096, 1, 1096, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa269 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru269 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont269 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru269)
EmitLdcI1IL.Emit(OpCodes.Br, fa269)
EmitLdcI1IL.MarkLabel(tru269)
EmitLdcI1IL.MarkSequencePoint(doc3, 1097, 1, 1097, 100)
Dim typ326(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ326(UBound(typ326) + 1)
typ326(UBound(typ326)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ326))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ326).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1098, 1, 1098, 100)
Dim typ327(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ327(UBound(typ327) + 1)
typ327(UBound(typ327)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ327))
Typ = Typ03.GetMethod("Emit", typ327).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1099, 1, 1099, 100)
Dim typ328(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ328(UBound(typ328) + 1)
typ328(UBound(typ328)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ328))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ328).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1100, 1, 1100, 100)
Dim typ329(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ329(UBound(typ329) + 1)
typ329(UBound(typ329)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ329))
Typ = Typ03.GetMethod("Emit", typ329).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1101, 1, 1101, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1102, 1, 1102, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont269)
EmitLdcI1IL.MarkLabel(fa269)
EmitLdcI1IL.Emit(OpCodes.Br, cont269)
EmitLdcI1IL.MarkLabel(cont269)
EmitLdcI1IL.MarkSequencePoint(doc3, 1104, 1, 1104, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa270 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru270 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont270 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru270)
EmitLdcI1IL.Emit(OpCodes.Br, fa270)
EmitLdcI1IL.MarkLabel(tru270)
EmitLdcI1IL.MarkSequencePoint(doc3, 1105, 1, 1105, 100)
Dim typ330(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ330(UBound(typ330) + 1)
typ330(UBound(typ330)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ330))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ330).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1106, 1, 1106, 100)
Dim typ331(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ331(UBound(typ331) + 1)
typ331(UBound(typ331)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ331))
Typ = Typ03.GetMethod("Emit", typ331).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1107, 1, 1107, 100)
Dim typ332(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ332(UBound(typ332) + 1)
typ332(UBound(typ332)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ332))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ332).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1108, 1, 1108, 100)
Dim typ333(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ333(UBound(typ333) + 1)
typ333(UBound(typ333)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ333))
Typ = Typ03.GetMethod("Emit", typ333).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1109, 1, 1109, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1110, 1, 1110, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont270)
EmitLdcI1IL.MarkLabel(fa270)
EmitLdcI1IL.Emit(OpCodes.Br, cont270)
EmitLdcI1IL.MarkLabel(cont270)
EmitLdcI1IL.MarkSequencePoint(doc3, 1112, 1, 1112, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
Dim fa271 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru271 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont271 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru271)
EmitLdcI1IL.Emit(OpCodes.Br, fa271)
EmitLdcI1IL.MarkLabel(tru271)
EmitLdcI1IL.MarkSequencePoint(doc3, 1113, 1, 1113, 100)
Dim typ334(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ334(UBound(typ334) + 1)
typ334(UBound(typ334)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ334))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ334).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1114, 1, 1114, 100)
Dim typ335(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ335(UBound(typ335) + 1)
typ335(UBound(typ335)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ335))
Typ = Typ03.GetMethod("Emit", typ335).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1115, 1, 1115, 100)
Dim typ336(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ336(UBound(typ336) + 1)
typ336(UBound(typ336)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ336))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ336).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1116, 1, 1116, 100)
Dim typ337(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ337(UBound(typ337) + 1)
typ337(UBound(typ337)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ337))
Typ = Typ03.GetMethod("Emit", typ337).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1117, 1, 1117, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1118, 1, 1118, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont271)
EmitLdcI1IL.MarkLabel(fa271)
EmitLdcI1IL.Emit(OpCodes.Br, cont271)
EmitLdcI1IL.MarkLabel(cont271)
EmitLdcI1IL.MarkSequencePoint(doc3, 1120, 1, 1120, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
Dim fa272 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru272 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont272 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru272)
EmitLdcI1IL.Emit(OpCodes.Br, fa272)
EmitLdcI1IL.MarkLabel(tru272)
EmitLdcI1IL.MarkSequencePoint(doc3, 1121, 1, 1121, 100)
Dim typ338(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ338(UBound(typ338) + 1)
typ338(UBound(typ338)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ338))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ338).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1122, 1, 1122, 100)
Dim typ339(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ339(UBound(typ339) + 1)
typ339(UBound(typ339)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ339))
Typ = Typ03.GetMethod("Emit", typ339).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1123, 1, 1123, 100)
Dim typ340(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ340(UBound(typ340) + 1)
typ340(UBound(typ340)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ340))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ340).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1124, 1, 1124, 100)
Dim typ341(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ341(UBound(typ341) + 1)
typ341(UBound(typ341)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ341))
Typ = Typ03.GetMethod("Emit", typ341).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1125, 1, 1125, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1126, 1, 1126, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont272)
EmitLdcI1IL.MarkLabel(fa272)
EmitLdcI1IL.Emit(OpCodes.Br, cont272)
EmitLdcI1IL.MarkLabel(cont272)
EmitLdcI1IL.MarkSequencePoint(doc3, 1128, 1, 1128, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
Dim fa273 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru273 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont273 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru273)
EmitLdcI1IL.Emit(OpCodes.Br, fa273)
EmitLdcI1IL.MarkLabel(tru273)
EmitLdcI1IL.MarkSequencePoint(doc3, 1129, 1, 1129, 100)
Dim typ342(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ342(UBound(typ342) + 1)
typ342(UBound(typ342)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ342))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ342).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1130, 1, 1130, 100)
Dim typ343(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ343(UBound(typ343) + 1)
typ343(UBound(typ343)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ343))
Typ = Typ03.GetMethod("Emit", typ343).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1131, 1, 1131, 100)
Dim typ344(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ344(UBound(typ344) + 1)
typ344(UBound(typ344)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ344))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ344).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1132, 1, 1132, 100)
Dim typ345(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ345(UBound(typ345) + 1)
typ345(UBound(typ345)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ345))
Typ = Typ03.GetMethod("Emit", typ345).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1133, 1, 1133, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1134, 1, 1134, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont273)
EmitLdcI1IL.MarkLabel(fa273)
EmitLdcI1IL.Emit(OpCodes.Br, cont273)
EmitLdcI1IL.MarkLabel(cont273)
EmitLdcI1IL.MarkSequencePoint(doc3, 1136, 1, 1136, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
Dim fa274 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru274 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont274 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru274)
EmitLdcI1IL.Emit(OpCodes.Br, fa274)
EmitLdcI1IL.MarkLabel(tru274)
EmitLdcI1IL.MarkSequencePoint(doc3, 1137, 1, 1137, 100)
Dim typ346(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ346(UBound(typ346) + 1)
typ346(UBound(typ346)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ346))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ346).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1138, 1, 1138, 100)
Dim typ347(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ347(UBound(typ347) + 1)
typ347(UBound(typ347)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ347))
Typ = Typ03.GetMethod("Emit", typ347).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1139, 1, 1139, 100)
Dim typ348(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ348(UBound(typ348) + 1)
typ348(UBound(typ348)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ348))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ348).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1140, 1, 1140, 100)
Dim typ349(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ349(UBound(typ349) + 1)
typ349(UBound(typ349)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ349))
Typ = Typ03.GetMethod("Emit", typ349).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1141, 1, 1141, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1142, 1, 1142, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont274)
EmitLdcI1IL.MarkLabel(fa274)
EmitLdcI1IL.Emit(OpCodes.Br, cont274)
EmitLdcI1IL.MarkLabel(cont274)
EmitLdcI1IL.MarkSequencePoint(doc3, 1144, 1, 1144, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
Dim fa275 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru275 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont275 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru275)
EmitLdcI1IL.Emit(OpCodes.Br, fa275)
EmitLdcI1IL.MarkLabel(tru275)
EmitLdcI1IL.MarkSequencePoint(doc3, 1145, 1, 1145, 100)
Dim typ350(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ350(UBound(typ350) + 1)
typ350(UBound(typ350)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ350))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ350).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1146, 1, 1146, 100)
Dim typ351(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ351(UBound(typ351) + 1)
typ351(UBound(typ351)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ351))
Typ = Typ03.GetMethod("Emit", typ351).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1147, 1, 1147, 100)
Dim typ352(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ352(UBound(typ352) + 1)
typ352(UBound(typ352)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ352))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ352).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1148, 1, 1148, 100)
Dim typ353(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ353(UBound(typ353) + 1)
typ353(UBound(typ353)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ353))
Typ = Typ03.GetMethod("Emit", typ353).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1149, 1, 1149, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1150, 1, 1150, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont275)
EmitLdcI1IL.MarkLabel(fa275)
EmitLdcI1IL.Emit(OpCodes.Br, cont275)
EmitLdcI1IL.MarkLabel(cont275)
EmitLdcI1IL.MarkSequencePoint(doc3, 1168, 1, 1168, 100)
Dim typ354(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ354(UBound(typ354) + 1)
typ354(UBound(typ354)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ354))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ354).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1170, 1, 1170, 100)
Dim typ355(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ355(UBound(typ355) + 1)
typ355(UBound(typ355)) = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ355(UBound(typ355) + 1)
typ355(UBound(typ355)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ355))
Typ = Typ03.GetMethod("Emit", typ355).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1171, 1, 1171, 100)
Dim typ356(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ356(UBound(typ356) + 1)
typ356(UBound(typ356)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ356))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ356).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 1172, 1, 1172, 100)
Dim typ357(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ357(UBound(typ357) + 1)
typ357(UBound(typ357)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ357))
Typ = Typ03.GetMethod("Emit", typ357).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 1173, 1, 1173, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1176, 1, 1176, 100)
EmitLdcI1IL.MarkLabel(label19)
EmitLdcI1IL.MarkSequencePoint(doc3, 1177, 1, 1177, 100)
EmitLdcI1IL.Emit(OpCodes.Ret)
Dim typ358(-1) As Type
ReDim Preserve typ358(UBound(typ358) + 1)
typ358(UBound(typ358)) = GetType(MethodInfo)
Dim EmitCallvirt As MethodBuilder = ILEmitter.DefineMethod("EmitCallvirt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ358)
Dim EmitCallvirtIL As ILGenerator = EmitCallvirt.GetILGenerator()
Dim EmitCallvirtparam01 As ParameterBuilder = EmitCallvirt.DefineParameter(1, ParameterAttributes.None, "met")
EmitCallvirtIL.MarkSequencePoint(doc3, 1180, 1, 1180, 100)
Dim locbldr79 As LocalBuilder = EmitCallvirtIL.DeclareLocal(GetType(OpCode))
locbldr79.SetLocalSymInfo("cvop")
Dim typ359(-1) As Type
EmitCallvirtIL.Emit(OpCodes.Ldstr, "callvirt")
Typ = GetType(System.String)
ReDim Preserve typ359(UBound(typ359) + 1)
typ359(UBound(typ359)) = Typ
EmitCallvirtIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ359))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ359).ReturnType
EmitCallvirtIL.Emit(OpCodes.Stloc, 0)
EmitCallvirtIL.MarkSequencePoint(doc3, 1181, 1, 1181, 100)
Dim typ360(-1) As Type
EmitCallvirtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCallvirtIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ360(UBound(typ360) + 1)
typ360(UBound(typ360)) = Typ
EmitCallvirtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ360(UBound(typ360) + 1)
typ360(UBound(typ360)) = Typ
EmitCallvirtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ360))
Typ = Typ03.GetMethod("Emit", typ360).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCallvirtIL.Emit(OpCodes.Pop)
End If
EmitCallvirtIL.MarkSequencePoint(doc3, 1182, 1, 1182, 100)
EmitCallvirtIL.Emit(OpCodes.Ret)
Dim typ361(-1) As Type
ReDim Preserve typ361(UBound(typ361) + 1)
typ361(UBound(typ361)) = GetType(ConstructorInfo)
Dim EmitCallCtor As MethodBuilder = ILEmitter.DefineMethod("EmitCallCtor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ361)
Dim EmitCallCtorIL As ILGenerator = EmitCallCtor.GetILGenerator()
Dim EmitCallCtorparam01 As ParameterBuilder = EmitCallCtor.DefineParameter(1, ParameterAttributes.None, "met")
EmitCallCtorIL.MarkSequencePoint(doc3, 1185, 1, 1185, 100)
Dim locbldr80 As LocalBuilder = EmitCallCtorIL.DeclareLocal(GetType(OpCode))
locbldr80.SetLocalSymInfo("cop")
Dim typ362(-1) As Type
EmitCallCtorIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ362(UBound(typ362) + 1)
typ362(UBound(typ362)) = Typ
EmitCallCtorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ362))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ362).ReturnType
EmitCallCtorIL.Emit(OpCodes.Stloc, 0)
EmitCallCtorIL.MarkSequencePoint(doc3, 1186, 1, 1186, 100)
Dim typ363(-1) As Type
EmitCallCtorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCallCtorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ363(UBound(typ363) + 1)
typ363(UBound(typ363)) = Typ
EmitCallCtorIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ConstructorInfo)
ReDim Preserve typ363(UBound(typ363) + 1)
typ363(UBound(typ363)) = Typ
EmitCallCtorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ363))
Typ = Typ03.GetMethod("Emit", typ363).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCallCtorIL.Emit(OpCodes.Pop)
End If
EmitCallCtorIL.MarkSequencePoint(doc3, 1187, 1, 1187, 100)
EmitCallCtorIL.Emit(OpCodes.Ret)
Dim typ364(-1) As Type
ReDim Preserve typ364(UBound(typ364) + 1)
typ364(UBound(typ364)) = GetType(MethodInfo)
Dim EmitCall As MethodBuilder = ILEmitter.DefineMethod("EmitCall", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ364)
Dim EmitCallIL As ILGenerator = EmitCall.GetILGenerator()
Dim EmitCallparam01 As ParameterBuilder = EmitCall.DefineParameter(1, ParameterAttributes.None, "met")
EmitCallIL.MarkSequencePoint(doc3, 1190, 1, 1190, 100)
Dim locbldr81 As LocalBuilder = EmitCallIL.DeclareLocal(GetType(OpCode))
locbldr81.SetLocalSymInfo("cop")
Dim typ365(-1) As Type
EmitCallIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ365(UBound(typ365) + 1)
typ365(UBound(typ365)) = Typ
EmitCallIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ365))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ365).ReturnType
EmitCallIL.Emit(OpCodes.Stloc, 0)
EmitCallIL.MarkSequencePoint(doc3, 1191, 1, 1191, 100)
Dim typ366(-1) As Type
EmitCallIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCallIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ366(UBound(typ366) + 1)
typ366(UBound(typ366)) = Typ
EmitCallIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ366(UBound(typ366) + 1)
typ366(UBound(typ366)) = Typ
EmitCallIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ366))
Typ = Typ03.GetMethod("Emit", typ366).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCallIL.Emit(OpCodes.Pop)
End If
EmitCallIL.MarkSequencePoint(doc3, 1192, 1, 1192, 100)
EmitCallIL.Emit(OpCodes.Ret)
Dim typ367(-1) As Type
ReDim Preserve typ367(UBound(typ367) + 1)
typ367(UBound(typ367)) = GetType(MethodInfo)
Dim EmitLdftn As MethodBuilder = ILEmitter.DefineMethod("EmitLdftn", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ367)
Dim EmitLdftnIL As ILGenerator = EmitLdftn.GetILGenerator()
Dim EmitLdftnparam01 As ParameterBuilder = EmitLdftn.DefineParameter(1, ParameterAttributes.None, "met")
EmitLdftnIL.MarkSequencePoint(doc3, 1195, 1, 1195, 100)
Dim locbldr82 As LocalBuilder = EmitLdftnIL.DeclareLocal(GetType(OpCode))
locbldr82.SetLocalSymInfo("op")
Dim typ368(-1) As Type
EmitLdftnIL.Emit(OpCodes.Ldstr, "ldftn")
Typ = GetType(System.String)
ReDim Preserve typ368(UBound(typ368) + 1)
typ368(UBound(typ368)) = Typ
EmitLdftnIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ368))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ368).ReturnType
EmitLdftnIL.Emit(OpCodes.Stloc, 0)
EmitLdftnIL.MarkSequencePoint(doc3, 1196, 1, 1196, 100)
Dim typ369(-1) As Type
EmitLdftnIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdftnIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ369(UBound(typ369) + 1)
typ369(UBound(typ369)) = Typ
EmitLdftnIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ369(UBound(typ369) + 1)
typ369(UBound(typ369)) = Typ
EmitLdftnIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ369))
Typ = Typ03.GetMethod("Emit", typ369).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdftnIL.Emit(OpCodes.Pop)
End If
EmitLdftnIL.MarkSequencePoint(doc3, 1197, 1, 1197, 100)
EmitLdftnIL.Emit(OpCodes.Ret)
Dim typ370(-1) As Type
ReDim Preserve typ370(UBound(typ370) + 1)
typ370(UBound(typ370)) = GetType(MethodInfo)
Dim EmitLdvirtftn As MethodBuilder = ILEmitter.DefineMethod("EmitLdvirtftn", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ370)
Dim EmitLdvirtftnIL As ILGenerator = EmitLdvirtftn.GetILGenerator()
Dim EmitLdvirtftnparam01 As ParameterBuilder = EmitLdvirtftn.DefineParameter(1, ParameterAttributes.None, "met")
EmitLdvirtftnIL.MarkSequencePoint(doc3, 1200, 1, 1200, 100)
Dim locbldr83 As LocalBuilder = EmitLdvirtftnIL.DeclareLocal(GetType(OpCode))
locbldr83.SetLocalSymInfo("op")
Dim typ371(-1) As Type
EmitLdvirtftnIL.Emit(OpCodes.Ldstr, "ldvirtftn")
Typ = GetType(System.String)
ReDim Preserve typ371(UBound(typ371) + 1)
typ371(UBound(typ371)) = Typ
EmitLdvirtftnIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ371))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ371).ReturnType
EmitLdvirtftnIL.Emit(OpCodes.Stloc, 0)
EmitLdvirtftnIL.MarkSequencePoint(doc3, 1201, 1, 1201, 100)
Dim typ372(-1) As Type
EmitLdvirtftnIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdvirtftnIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ372(UBound(typ372) + 1)
typ372(UBound(typ372)) = Typ
EmitLdvirtftnIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ372(UBound(typ372) + 1)
typ372(UBound(typ372)) = Typ
EmitLdvirtftnIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ372))
Typ = Typ03.GetMethod("Emit", typ372).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdvirtftnIL.Emit(OpCodes.Pop)
End If
EmitLdvirtftnIL.MarkSequencePoint(doc3, 1202, 1, 1202, 100)
EmitLdvirtftnIL.Emit(OpCodes.Ret)
Dim typ373(-1) As Type
ReDim Preserve typ373(UBound(typ373) + 1)
typ373(UBound(typ373)) = GetType(FieldInfo)
Dim EmitLdfld As MethodBuilder = ILEmitter.DefineMethod("EmitLdfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ373)
Dim EmitLdfldIL As ILGenerator = EmitLdfld.GetILGenerator()
Dim EmitLdfldparam01 As ParameterBuilder = EmitLdfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdfldIL.MarkSequencePoint(doc3, 1205, 1, 1205, 100)
Dim locbldr84 As LocalBuilder = EmitLdfldIL.DeclareLocal(GetType(OpCode))
locbldr84.SetLocalSymInfo("lop")
Dim typ374(-1) As Type
EmitLdfldIL.Emit(OpCodes.Ldstr, "ldfld")
Typ = GetType(System.String)
ReDim Preserve typ374(UBound(typ374) + 1)
typ374(UBound(typ374)) = Typ
EmitLdfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ374))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ374).ReturnType
EmitLdfldIL.Emit(OpCodes.Stloc, 0)
EmitLdfldIL.MarkSequencePoint(doc3, 1206, 1, 1206, 100)
Dim typ375(-1) As Type
EmitLdfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ375(UBound(typ375) + 1)
typ375(UBound(typ375)) = Typ
EmitLdfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ375(UBound(typ375) + 1)
typ375(UBound(typ375)) = Typ
EmitLdfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ375))
Typ = Typ03.GetMethod("Emit", typ375).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdfldIL.Emit(OpCodes.Pop)
End If
EmitLdfldIL.MarkSequencePoint(doc3, 1207, 1, 1207, 100)
EmitLdfldIL.Emit(OpCodes.Ret)
Dim typ376(-1) As Type
ReDim Preserve typ376(UBound(typ376) + 1)
typ376(UBound(typ376)) = GetType(FieldInfo)
Dim EmitLdsfld As MethodBuilder = ILEmitter.DefineMethod("EmitLdsfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ376)
Dim EmitLdsfldIL As ILGenerator = EmitLdsfld.GetILGenerator()
Dim EmitLdsfldparam01 As ParameterBuilder = EmitLdsfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdsfldIL.MarkSequencePoint(doc3, 1210, 1, 1210, 100)
Dim locbldr85 As LocalBuilder = EmitLdsfldIL.DeclareLocal(GetType(OpCode))
locbldr85.SetLocalSymInfo("lsop")
Dim typ377(-1) As Type
EmitLdsfldIL.Emit(OpCodes.Ldstr, "ldsfld")
Typ = GetType(System.String)
ReDim Preserve typ377(UBound(typ377) + 1)
typ377(UBound(typ377)) = Typ
EmitLdsfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ377))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ377).ReturnType
EmitLdsfldIL.Emit(OpCodes.Stloc, 0)
EmitLdsfldIL.MarkSequencePoint(doc3, 1211, 1, 1211, 100)
Dim typ378(-1) As Type
EmitLdsfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdsfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ378(UBound(typ378) + 1)
typ378(UBound(typ378)) = Typ
EmitLdsfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ378(UBound(typ378) + 1)
typ378(UBound(typ378)) = Typ
EmitLdsfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ378))
Typ = Typ03.GetMethod("Emit", typ378).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdsfldIL.Emit(OpCodes.Pop)
End If
EmitLdsfldIL.MarkSequencePoint(doc3, 1212, 1, 1212, 100)
EmitLdsfldIL.Emit(OpCodes.Ret)
Dim typ379(-1) As Type
ReDim Preserve typ379(UBound(typ379) + 1)
typ379(UBound(typ379)) = GetType(FieldInfo)
Dim EmitLdflda As MethodBuilder = ILEmitter.DefineMethod("EmitLdflda", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ379)
Dim EmitLdfldaIL As ILGenerator = EmitLdflda.GetILGenerator()
Dim EmitLdfldaparam01 As ParameterBuilder = EmitLdflda.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdfldaIL.MarkSequencePoint(doc3, 1215, 1, 1215, 100)
Dim locbldr86 As LocalBuilder = EmitLdfldaIL.DeclareLocal(GetType(OpCode))
locbldr86.SetLocalSymInfo("lop")
Dim typ380(-1) As Type
EmitLdfldaIL.Emit(OpCodes.Ldstr, "ldflda")
Typ = GetType(System.String)
ReDim Preserve typ380(UBound(typ380) + 1)
typ380(UBound(typ380)) = Typ
EmitLdfldaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ380))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ380).ReturnType
EmitLdfldaIL.Emit(OpCodes.Stloc, 0)
EmitLdfldaIL.MarkSequencePoint(doc3, 1216, 1, 1216, 100)
Dim typ381(-1) As Type
EmitLdfldaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdfldaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ381(UBound(typ381) + 1)
typ381(UBound(typ381)) = Typ
EmitLdfldaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ381(UBound(typ381) + 1)
typ381(UBound(typ381)) = Typ
EmitLdfldaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ381))
Typ = Typ03.GetMethod("Emit", typ381).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdfldaIL.Emit(OpCodes.Pop)
End If
EmitLdfldaIL.MarkSequencePoint(doc3, 1217, 1, 1217, 100)
EmitLdfldaIL.Emit(OpCodes.Ret)
Dim typ382(-1) As Type
ReDim Preserve typ382(UBound(typ382) + 1)
typ382(UBound(typ382)) = GetType(FieldInfo)
Dim EmitLdsflda As MethodBuilder = ILEmitter.DefineMethod("EmitLdsflda", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ382)
Dim EmitLdsfldaIL As ILGenerator = EmitLdsflda.GetILGenerator()
Dim EmitLdsfldaparam01 As ParameterBuilder = EmitLdsflda.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdsfldaIL.MarkSequencePoint(doc3, 1220, 1, 1220, 100)
Dim locbldr87 As LocalBuilder = EmitLdsfldaIL.DeclareLocal(GetType(OpCode))
locbldr87.SetLocalSymInfo("lsop")
Dim typ383(-1) As Type
EmitLdsfldaIL.Emit(OpCodes.Ldstr, "ldsflda")
Typ = GetType(System.String)
ReDim Preserve typ383(UBound(typ383) + 1)
typ383(UBound(typ383)) = Typ
EmitLdsfldaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ383))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ383).ReturnType
EmitLdsfldaIL.Emit(OpCodes.Stloc, 0)
EmitLdsfldaIL.MarkSequencePoint(doc3, 1221, 1, 1221, 100)
Dim typ384(-1) As Type
EmitLdsfldaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdsfldaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ384(UBound(typ384) + 1)
typ384(UBound(typ384)) = Typ
EmitLdsfldaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ384(UBound(typ384) + 1)
typ384(UBound(typ384)) = Typ
EmitLdsfldaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ384))
Typ = Typ03.GetMethod("Emit", typ384).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdsfldaIL.Emit(OpCodes.Pop)
End If
EmitLdsfldaIL.MarkSequencePoint(doc3, 1222, 1, 1222, 100)
EmitLdsfldaIL.Emit(OpCodes.Ret)
Dim typ385(-1) As Type
ReDim Preserve typ385(UBound(typ385) + 1)
typ385(UBound(typ385)) = GetType(System.String)
Dim EmitLdstr As MethodBuilder = ILEmitter.DefineMethod("EmitLdstr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ385)
Dim EmitLdstrIL As ILGenerator = EmitLdstr.GetILGenerator()
Dim EmitLdstrparam01 As ParameterBuilder = EmitLdstr.DefineParameter(1, ParameterAttributes.None, "str")
EmitLdstrIL.MarkSequencePoint(doc3, 1225, 1, 1225, 100)
Dim locbldr88 As LocalBuilder = EmitLdstrIL.DeclareLocal(GetType(OpCode))
locbldr88.SetLocalSymInfo("lsop")
Dim typ386(-1) As Type
EmitLdstrIL.Emit(OpCodes.Ldstr, "ldstr")
Typ = GetType(System.String)
ReDim Preserve typ386(UBound(typ386) + 1)
typ386(UBound(typ386)) = Typ
EmitLdstrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ386))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ386).ReturnType
EmitLdstrIL.Emit(OpCodes.Stloc, 0)
EmitLdstrIL.MarkSequencePoint(doc3, 1226, 1, 1226, 100)
Dim typ387(-1) As Type
EmitLdstrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdstrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ387(UBound(typ387) + 1)
typ387(UBound(typ387)) = Typ
EmitLdstrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ387(UBound(typ387) + 1)
typ387(UBound(typ387)) = Typ
EmitLdstrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ387))
Typ = Typ03.GetMethod("Emit", typ387).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdstrIL.Emit(OpCodes.Pop)
End If
EmitLdstrIL.MarkSequencePoint(doc3, 1227, 1, 1227, 100)
EmitLdstrIL.Emit(OpCodes.Ret)
Dim typ388(-1) As Type
ReDim Preserve typ388(UBound(typ388) + 1)
typ388(UBound(typ388)) = GetType(System.Boolean)
Dim EmitAdd As MethodBuilder = ILEmitter.DefineMethod("EmitAdd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ388)
Dim EmitAddIL As ILGenerator = EmitAdd.GetILGenerator()
Dim EmitAddparam01 As ParameterBuilder = EmitAdd.DefineParameter(1, ParameterAttributes.None, "s")
EmitAddIL.MarkSequencePoint(doc3, 1230, 1, 1230, 100)
Dim locbldr89 As LocalBuilder = EmitAddIL.DeclareLocal(GetType(OpCode))
locbldr89.SetLocalSymInfo("op")
EmitAddIL.MarkSequencePoint(doc3, 1231, 1, 1231, 100)
EmitAddIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitAddIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa276 As System.Reflection.Emit.Label = EmitAddIL.DefineLabel()
Dim tru276 As System.Reflection.Emit.Label = EmitAddIL.DefineLabel()
Dim cont276 As System.Reflection.Emit.Label = EmitAddIL.DefineLabel()
EmitAddIL.Emit(OpCodes.Beq, tru276)
EmitAddIL.Emit(OpCodes.Br, fa276)
EmitAddIL.MarkLabel(tru276)
EmitAddIL.MarkSequencePoint(doc3, 1232, 1, 1232, 100)
Dim typ389(-1) As Type
EmitAddIL.Emit(OpCodes.Ldstr, "add")
Typ = GetType(System.String)
ReDim Preserve typ389(UBound(typ389) + 1)
typ389(UBound(typ389)) = Typ
EmitAddIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ389))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ389).ReturnType
EmitAddIL.Emit(OpCodes.Stloc, 0)
EmitAddIL.MarkSequencePoint(doc3, 1233, 1, 1233, 100)
Dim typ390(-1) As Type
EmitAddIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitAddIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ390(UBound(typ390) + 1)
typ390(UBound(typ390)) = Typ
EmitAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ390))
Typ = Typ03.GetMethod("Emit", typ390).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitAddIL.Emit(OpCodes.Pop)
End If
EmitAddIL.MarkSequencePoint(doc3, 1234, 1, 1234, 100)
EmitAddIL.Emit(OpCodes.Br, cont276)
EmitAddIL.MarkLabel(fa276)
EmitAddIL.MarkSequencePoint(doc3, 1235, 1, 1235, 100)
Dim typ391(-1) As Type
EmitAddIL.Emit(OpCodes.Ldstr, "add.ovf.un")
Typ = GetType(System.String)
ReDim Preserve typ391(UBound(typ391) + 1)
typ391(UBound(typ391)) = Typ
EmitAddIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ391))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ391).ReturnType
EmitAddIL.Emit(OpCodes.Stloc, 0)
EmitAddIL.MarkSequencePoint(doc3, 1236, 1, 1236, 100)
Dim typ392(-1) As Type
EmitAddIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitAddIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ392(UBound(typ392) + 1)
typ392(UBound(typ392)) = Typ
EmitAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ392))
Typ = Typ03.GetMethod("Emit", typ392).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitAddIL.Emit(OpCodes.Pop)
End If
EmitAddIL.MarkSequencePoint(doc3, 1237, 1, 1237, 100)
EmitAddIL.Emit(OpCodes.Br, cont276)
EmitAddIL.MarkLabel(cont276)
EmitAddIL.MarkSequencePoint(doc3, 1238, 1, 1238, 100)
EmitAddIL.Emit(OpCodes.Ret)
Dim typ393(-1) As Type
ReDim Preserve typ393(UBound(typ393) + 1)
typ393(UBound(typ393)) = GetType(System.Boolean)
Dim EmitDiv As MethodBuilder = ILEmitter.DefineMethod("EmitDiv", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ393)
Dim EmitDivIL As ILGenerator = EmitDiv.GetILGenerator()
Dim EmitDivparam01 As ParameterBuilder = EmitDiv.DefineParameter(1, ParameterAttributes.None, "s")
EmitDivIL.MarkSequencePoint(doc3, 1241, 1, 1241, 100)
Dim locbldr90 As LocalBuilder = EmitDivIL.DeclareLocal(GetType(OpCode))
locbldr90.SetLocalSymInfo("op")
EmitDivIL.MarkSequencePoint(doc3, 1242, 1, 1242, 100)
EmitDivIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitDivIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa277 As System.Reflection.Emit.Label = EmitDivIL.DefineLabel()
Dim tru277 As System.Reflection.Emit.Label = EmitDivIL.DefineLabel()
Dim cont277 As System.Reflection.Emit.Label = EmitDivIL.DefineLabel()
EmitDivIL.Emit(OpCodes.Beq, tru277)
EmitDivIL.Emit(OpCodes.Br, fa277)
EmitDivIL.MarkLabel(tru277)
EmitDivIL.MarkSequencePoint(doc3, 1243, 1, 1243, 100)
Dim typ394(-1) As Type
EmitDivIL.Emit(OpCodes.Ldstr, "div")
Typ = GetType(System.String)
ReDim Preserve typ394(UBound(typ394) + 1)
typ394(UBound(typ394)) = Typ
EmitDivIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ394))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ394).ReturnType
EmitDivIL.Emit(OpCodes.Stloc, 0)
EmitDivIL.MarkSequencePoint(doc3, 1244, 1, 1244, 100)
Dim typ395(-1) As Type
EmitDivIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitDivIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ395(UBound(typ395) + 1)
typ395(UBound(typ395)) = Typ
EmitDivIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ395))
Typ = Typ03.GetMethod("Emit", typ395).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitDivIL.Emit(OpCodes.Pop)
End If
EmitDivIL.MarkSequencePoint(doc3, 1245, 1, 1245, 100)
EmitDivIL.Emit(OpCodes.Br, cont277)
EmitDivIL.MarkLabel(fa277)
EmitDivIL.MarkSequencePoint(doc3, 1246, 1, 1246, 100)
Dim typ396(-1) As Type
EmitDivIL.Emit(OpCodes.Ldstr, "div.un")
Typ = GetType(System.String)
ReDim Preserve typ396(UBound(typ396) + 1)
typ396(UBound(typ396)) = Typ
EmitDivIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ396))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ396).ReturnType
EmitDivIL.Emit(OpCodes.Stloc, 0)
EmitDivIL.MarkSequencePoint(doc3, 1247, 1, 1247, 100)
Dim typ397(-1) As Type
EmitDivIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitDivIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ397(UBound(typ397) + 1)
typ397(UBound(typ397)) = Typ
EmitDivIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ397))
Typ = Typ03.GetMethod("Emit", typ397).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitDivIL.Emit(OpCodes.Pop)
End If
EmitDivIL.MarkSequencePoint(doc3, 1248, 1, 1248, 100)
EmitDivIL.Emit(OpCodes.Br, cont277)
EmitDivIL.MarkLabel(cont277)
EmitDivIL.MarkSequencePoint(doc3, 1249, 1, 1249, 100)
EmitDivIL.Emit(OpCodes.Ret)
Dim typ398(-1) As Type
ReDim Preserve typ398(UBound(typ398) + 1)
typ398(UBound(typ398)) = GetType(System.Boolean)
Dim EmitMul As MethodBuilder = ILEmitter.DefineMethod("EmitMul", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ398)
Dim EmitMulIL As ILGenerator = EmitMul.GetILGenerator()
Dim EmitMulparam01 As ParameterBuilder = EmitMul.DefineParameter(1, ParameterAttributes.None, "s")
EmitMulIL.MarkSequencePoint(doc3, 1252, 1, 1252, 100)
Dim locbldr91 As LocalBuilder = EmitMulIL.DeclareLocal(GetType(OpCode))
locbldr91.SetLocalSymInfo("op")
EmitMulIL.MarkSequencePoint(doc3, 1253, 1, 1253, 100)
EmitMulIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitMulIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa278 As System.Reflection.Emit.Label = EmitMulIL.DefineLabel()
Dim tru278 As System.Reflection.Emit.Label = EmitMulIL.DefineLabel()
Dim cont278 As System.Reflection.Emit.Label = EmitMulIL.DefineLabel()
EmitMulIL.Emit(OpCodes.Beq, tru278)
EmitMulIL.Emit(OpCodes.Br, fa278)
EmitMulIL.MarkLabel(tru278)
EmitMulIL.MarkSequencePoint(doc3, 1254, 1, 1254, 100)
Dim typ399(-1) As Type
EmitMulIL.Emit(OpCodes.Ldstr, "mul")
Typ = GetType(System.String)
ReDim Preserve typ399(UBound(typ399) + 1)
typ399(UBound(typ399)) = Typ
EmitMulIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ399))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ399).ReturnType
EmitMulIL.Emit(OpCodes.Stloc, 0)
EmitMulIL.MarkSequencePoint(doc3, 1255, 1, 1255, 100)
Dim typ400(-1) As Type
EmitMulIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitMulIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ400(UBound(typ400) + 1)
typ400(UBound(typ400)) = Typ
EmitMulIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ400))
Typ = Typ03.GetMethod("Emit", typ400).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitMulIL.Emit(OpCodes.Pop)
End If
EmitMulIL.MarkSequencePoint(doc3, 1256, 1, 1256, 100)
EmitMulIL.Emit(OpCodes.Br, cont278)
EmitMulIL.MarkLabel(fa278)
EmitMulIL.MarkSequencePoint(doc3, 1257, 1, 1257, 100)
Dim typ401(-1) As Type
EmitMulIL.Emit(OpCodes.Ldstr, "mul.ovf.un")
Typ = GetType(System.String)
ReDim Preserve typ401(UBound(typ401) + 1)
typ401(UBound(typ401)) = Typ
EmitMulIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ401))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ401).ReturnType
EmitMulIL.Emit(OpCodes.Stloc, 0)
EmitMulIL.MarkSequencePoint(doc3, 1258, 1, 1258, 100)
Dim typ402(-1) As Type
EmitMulIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitMulIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ402(UBound(typ402) + 1)
typ402(UBound(typ402)) = Typ
EmitMulIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ402))
Typ = Typ03.GetMethod("Emit", typ402).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitMulIL.Emit(OpCodes.Pop)
End If
EmitMulIL.MarkSequencePoint(doc3, 1259, 1, 1259, 100)
EmitMulIL.Emit(OpCodes.Br, cont278)
EmitMulIL.MarkLabel(cont278)
EmitMulIL.MarkSequencePoint(doc3, 1260, 1, 1260, 100)
EmitMulIL.Emit(OpCodes.Ret)
Dim typ403(-1) As Type
ReDim Preserve typ403(UBound(typ403) + 1)
typ403(UBound(typ403)) = GetType(System.Boolean)
Dim EmitSub As MethodBuilder = ILEmitter.DefineMethod("EmitSub", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ403)
Dim EmitSubIL As ILGenerator = EmitSub.GetILGenerator()
Dim EmitSubparam01 As ParameterBuilder = EmitSub.DefineParameter(1, ParameterAttributes.None, "s")
EmitSubIL.MarkSequencePoint(doc3, 1263, 1, 1263, 100)
Dim locbldr92 As LocalBuilder = EmitSubIL.DeclareLocal(GetType(OpCode))
locbldr92.SetLocalSymInfo("op")
EmitSubIL.MarkSequencePoint(doc3, 1264, 1, 1264, 100)
EmitSubIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitSubIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa279 As System.Reflection.Emit.Label = EmitSubIL.DefineLabel()
Dim tru279 As System.Reflection.Emit.Label = EmitSubIL.DefineLabel()
Dim cont279 As System.Reflection.Emit.Label = EmitSubIL.DefineLabel()
EmitSubIL.Emit(OpCodes.Beq, tru279)
EmitSubIL.Emit(OpCodes.Br, fa279)
EmitSubIL.MarkLabel(tru279)
EmitSubIL.MarkSequencePoint(doc3, 1265, 1, 1265, 100)
Dim typ404(-1) As Type
EmitSubIL.Emit(OpCodes.Ldstr, "sub")
Typ = GetType(System.String)
ReDim Preserve typ404(UBound(typ404) + 1)
typ404(UBound(typ404)) = Typ
EmitSubIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ404))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ404).ReturnType
EmitSubIL.Emit(OpCodes.Stloc, 0)
EmitSubIL.MarkSequencePoint(doc3, 1266, 1, 1266, 100)
Dim typ405(-1) As Type
EmitSubIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitSubIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ405(UBound(typ405) + 1)
typ405(UBound(typ405)) = Typ
EmitSubIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ405))
Typ = Typ03.GetMethod("Emit", typ405).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitSubIL.Emit(OpCodes.Pop)
End If
EmitSubIL.MarkSequencePoint(doc3, 1267, 1, 1267, 100)
EmitSubIL.Emit(OpCodes.Br, cont279)
EmitSubIL.MarkLabel(fa279)
EmitSubIL.MarkSequencePoint(doc3, 1268, 1, 1268, 100)
Dim typ406(-1) As Type
EmitSubIL.Emit(OpCodes.Ldstr, "sub.ovf.un")
Typ = GetType(System.String)
ReDim Preserve typ406(UBound(typ406) + 1)
typ406(UBound(typ406)) = Typ
EmitSubIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ406))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ406).ReturnType
EmitSubIL.Emit(OpCodes.Stloc, 0)
EmitSubIL.MarkSequencePoint(doc3, 1269, 1, 1269, 100)
Dim typ407(-1) As Type
EmitSubIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitSubIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ407(UBound(typ407) + 1)
typ407(UBound(typ407)) = Typ
EmitSubIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ407))
Typ = Typ03.GetMethod("Emit", typ407).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitSubIL.Emit(OpCodes.Pop)
End If
EmitSubIL.MarkSequencePoint(doc3, 1270, 1, 1270, 100)
EmitSubIL.Emit(OpCodes.Br, cont279)
EmitSubIL.MarkLabel(cont279)
EmitSubIL.MarkSequencePoint(doc3, 1271, 1, 1271, 100)
EmitSubIL.Emit(OpCodes.Ret)
Dim typ408(-1) As Type
ReDim Preserve typ408(UBound(typ408) + 1)
typ408(UBound(typ408)) = GetType(System.Boolean)
Dim EmitRem As MethodBuilder = ILEmitter.DefineMethod("EmitRem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ408)
Dim EmitRemIL As ILGenerator = EmitRem.GetILGenerator()
Dim EmitRemparam01 As ParameterBuilder = EmitRem.DefineParameter(1, ParameterAttributes.None, "s")
EmitRemIL.MarkSequencePoint(doc3, 1274, 1, 1274, 100)
Dim locbldr93 As LocalBuilder = EmitRemIL.DeclareLocal(GetType(OpCode))
locbldr93.SetLocalSymInfo("op")
EmitRemIL.MarkSequencePoint(doc3, 1275, 1, 1275, 100)
EmitRemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitRemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa280 As System.Reflection.Emit.Label = EmitRemIL.DefineLabel()
Dim tru280 As System.Reflection.Emit.Label = EmitRemIL.DefineLabel()
Dim cont280 As System.Reflection.Emit.Label = EmitRemIL.DefineLabel()
EmitRemIL.Emit(OpCodes.Beq, tru280)
EmitRemIL.Emit(OpCodes.Br, fa280)
EmitRemIL.MarkLabel(tru280)
EmitRemIL.MarkSequencePoint(doc3, 1276, 1, 1276, 100)
Dim typ409(-1) As Type
EmitRemIL.Emit(OpCodes.Ldstr, "rem")
Typ = GetType(System.String)
ReDim Preserve typ409(UBound(typ409) + 1)
typ409(UBound(typ409)) = Typ
EmitRemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ409))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ409).ReturnType
EmitRemIL.Emit(OpCodes.Stloc, 0)
EmitRemIL.MarkSequencePoint(doc3, 1277, 1, 1277, 100)
Dim typ410(-1) As Type
EmitRemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitRemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ410(UBound(typ410) + 1)
typ410(UBound(typ410)) = Typ
EmitRemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ410))
Typ = Typ03.GetMethod("Emit", typ410).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitRemIL.Emit(OpCodes.Pop)
End If
EmitRemIL.MarkSequencePoint(doc3, 1278, 1, 1278, 100)
EmitRemIL.Emit(OpCodes.Br, cont280)
EmitRemIL.MarkLabel(fa280)
EmitRemIL.MarkSequencePoint(doc3, 1279, 1, 1279, 100)
Dim typ411(-1) As Type
EmitRemIL.Emit(OpCodes.Ldstr, "rem.un")
Typ = GetType(System.String)
ReDim Preserve typ411(UBound(typ411) + 1)
typ411(UBound(typ411)) = Typ
EmitRemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ411))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ411).ReturnType
EmitRemIL.Emit(OpCodes.Stloc, 0)
EmitRemIL.MarkSequencePoint(doc3, 1280, 1, 1280, 100)
Dim typ412(-1) As Type
EmitRemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitRemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ412(UBound(typ412) + 1)
typ412(UBound(typ412)) = Typ
EmitRemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ412))
Typ = Typ03.GetMethod("Emit", typ412).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitRemIL.Emit(OpCodes.Pop)
End If
EmitRemIL.MarkSequencePoint(doc3, 1281, 1, 1281, 100)
EmitRemIL.Emit(OpCodes.Br, cont280)
EmitRemIL.MarkLabel(cont280)
EmitRemIL.MarkSequencePoint(doc3, 1282, 1, 1282, 100)
EmitRemIL.Emit(OpCodes.Ret)
Dim EmitShl As MethodBuilder = ILEmitter.DefineMethod("EmitShl", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitShlIL As ILGenerator = EmitShl.GetILGenerator()
EmitShlIL.MarkSequencePoint(doc3, 1285, 1, 1285, 100)
Dim locbldr94 As LocalBuilder = EmitShlIL.DeclareLocal(GetType(OpCode))
locbldr94.SetLocalSymInfo("op")
EmitShlIL.MarkSequencePoint(doc3, 1286, 1, 1286, 100)
Dim typ413(-1) As Type
EmitShlIL.Emit(OpCodes.Ldstr, "shl")
Typ = GetType(System.String)
ReDim Preserve typ413(UBound(typ413) + 1)
typ413(UBound(typ413)) = Typ
EmitShlIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ413))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ413).ReturnType
EmitShlIL.Emit(OpCodes.Stloc, 0)
EmitShlIL.MarkSequencePoint(doc3, 1287, 1, 1287, 100)
Dim typ414(-1) As Type
EmitShlIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitShlIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ414(UBound(typ414) + 1)
typ414(UBound(typ414)) = Typ
EmitShlIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ414))
Typ = Typ03.GetMethod("Emit", typ414).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitShlIL.Emit(OpCodes.Pop)
End If
EmitShlIL.MarkSequencePoint(doc3, 1288, 1, 1288, 100)
EmitShlIL.Emit(OpCodes.Ret)
Dim typ415(-1) As Type
ReDim Preserve typ415(UBound(typ415) + 1)
typ415(UBound(typ415)) = GetType(System.Boolean)
Dim EmitShr As MethodBuilder = ILEmitter.DefineMethod("EmitShr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ415)
Dim EmitShrIL As ILGenerator = EmitShr.GetILGenerator()
Dim EmitShrparam01 As ParameterBuilder = EmitShr.DefineParameter(1, ParameterAttributes.None, "s")
EmitShrIL.MarkSequencePoint(doc3, 1291, 1, 1291, 100)
Dim locbldr95 As LocalBuilder = EmitShrIL.DeclareLocal(GetType(OpCode))
locbldr95.SetLocalSymInfo("op")
EmitShrIL.MarkSequencePoint(doc3, 1292, 1, 1292, 100)
EmitShrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitShrIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa281 As System.Reflection.Emit.Label = EmitShrIL.DefineLabel()
Dim tru281 As System.Reflection.Emit.Label = EmitShrIL.DefineLabel()
Dim cont281 As System.Reflection.Emit.Label = EmitShrIL.DefineLabel()
EmitShrIL.Emit(OpCodes.Beq, tru281)
EmitShrIL.Emit(OpCodes.Br, fa281)
EmitShrIL.MarkLabel(tru281)
EmitShrIL.MarkSequencePoint(doc3, 1293, 1, 1293, 100)
Dim typ416(-1) As Type
EmitShrIL.Emit(OpCodes.Ldstr, "shr")
Typ = GetType(System.String)
ReDim Preserve typ416(UBound(typ416) + 1)
typ416(UBound(typ416)) = Typ
EmitShrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ416))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ416).ReturnType
EmitShrIL.Emit(OpCodes.Stloc, 0)
EmitShrIL.MarkSequencePoint(doc3, 1294, 1, 1294, 100)
Dim typ417(-1) As Type
EmitShrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitShrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ417(UBound(typ417) + 1)
typ417(UBound(typ417)) = Typ
EmitShrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ417))
Typ = Typ03.GetMethod("Emit", typ417).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitShrIL.Emit(OpCodes.Pop)
End If
EmitShrIL.MarkSequencePoint(doc3, 1295, 1, 1295, 100)
EmitShrIL.Emit(OpCodes.Br, cont281)
EmitShrIL.MarkLabel(fa281)
EmitShrIL.MarkSequencePoint(doc3, 1296, 1, 1296, 100)
Dim typ418(-1) As Type
EmitShrIL.Emit(OpCodes.Ldstr, "shr.un")
Typ = GetType(System.String)
ReDim Preserve typ418(UBound(typ418) + 1)
typ418(UBound(typ418)) = Typ
EmitShrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ418))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ418).ReturnType
EmitShrIL.Emit(OpCodes.Stloc, 0)
EmitShrIL.MarkSequencePoint(doc3, 1297, 1, 1297, 100)
Dim typ419(-1) As Type
EmitShrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitShrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ419(UBound(typ419) + 1)
typ419(UBound(typ419)) = Typ
EmitShrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ419))
Typ = Typ03.GetMethod("Emit", typ419).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitShrIL.Emit(OpCodes.Pop)
End If
EmitShrIL.MarkSequencePoint(doc3, 1298, 1, 1298, 100)
EmitShrIL.Emit(OpCodes.Br, cont281)
EmitShrIL.MarkLabel(cont281)
EmitShrIL.MarkSequencePoint(doc3, 1299, 1, 1299, 100)
EmitShrIL.Emit(OpCodes.Ret)
Dim EmitAnd As MethodBuilder = ILEmitter.DefineMethod("EmitAnd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitAndIL As ILGenerator = EmitAnd.GetILGenerator()
EmitAndIL.MarkSequencePoint(doc3, 1302, 1, 1302, 100)
Dim locbldr96 As LocalBuilder = EmitAndIL.DeclareLocal(GetType(OpCode))
locbldr96.SetLocalSymInfo("op")
EmitAndIL.MarkSequencePoint(doc3, 1303, 1, 1303, 100)
Dim typ420(-1) As Type
EmitAndIL.Emit(OpCodes.Ldstr, "and")
Typ = GetType(System.String)
ReDim Preserve typ420(UBound(typ420) + 1)
typ420(UBound(typ420)) = Typ
EmitAndIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ420))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ420).ReturnType
EmitAndIL.Emit(OpCodes.Stloc, 0)
EmitAndIL.MarkSequencePoint(doc3, 1304, 1, 1304, 100)
Dim typ421(-1) As Type
EmitAndIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitAndIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ421(UBound(typ421) + 1)
typ421(UBound(typ421)) = Typ
EmitAndIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ421))
Typ = Typ03.GetMethod("Emit", typ421).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitAndIL.Emit(OpCodes.Pop)
End If
EmitAndIL.MarkSequencePoint(doc3, 1305, 1, 1305, 100)
EmitAndIL.Emit(OpCodes.Ret)
Dim EmitOr As MethodBuilder = ILEmitter.DefineMethod("EmitOr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitOrIL As ILGenerator = EmitOr.GetILGenerator()
EmitOrIL.MarkSequencePoint(doc3, 1308, 1, 1308, 100)
Dim locbldr97 As LocalBuilder = EmitOrIL.DeclareLocal(GetType(OpCode))
locbldr97.SetLocalSymInfo("op")
EmitOrIL.MarkSequencePoint(doc3, 1309, 1, 1309, 100)
Dim typ422(-1) As Type
EmitOrIL.Emit(OpCodes.Ldstr, "or")
Typ = GetType(System.String)
ReDim Preserve typ422(UBound(typ422) + 1)
typ422(UBound(typ422)) = Typ
EmitOrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ422))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ422).ReturnType
EmitOrIL.Emit(OpCodes.Stloc, 0)
EmitOrIL.MarkSequencePoint(doc3, 1310, 1, 1310, 100)
Dim typ423(-1) As Type
EmitOrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitOrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ423(UBound(typ423) + 1)
typ423(UBound(typ423)) = Typ
EmitOrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ423))
Typ = Typ03.GetMethod("Emit", typ423).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitOrIL.Emit(OpCodes.Pop)
End If
EmitOrIL.MarkSequencePoint(doc3, 1311, 1, 1311, 100)
EmitOrIL.Emit(OpCodes.Ret)
Dim EmitXor As MethodBuilder = ILEmitter.DefineMethod("EmitXor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitXorIL As ILGenerator = EmitXor.GetILGenerator()
EmitXorIL.MarkSequencePoint(doc3, 1314, 1, 1314, 100)
Dim locbldr98 As LocalBuilder = EmitXorIL.DeclareLocal(GetType(OpCode))
locbldr98.SetLocalSymInfo("op")
EmitXorIL.MarkSequencePoint(doc3, 1315, 1, 1315, 100)
Dim typ424(-1) As Type
EmitXorIL.Emit(OpCodes.Ldstr, "xor")
Typ = GetType(System.String)
ReDim Preserve typ424(UBound(typ424) + 1)
typ424(UBound(typ424)) = Typ
EmitXorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ424))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ424).ReturnType
EmitXorIL.Emit(OpCodes.Stloc, 0)
EmitXorIL.MarkSequencePoint(doc3, 1316, 1, 1316, 100)
Dim typ425(-1) As Type
EmitXorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitXorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ425(UBound(typ425) + 1)
typ425(UBound(typ425)) = Typ
EmitXorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ425))
Typ = Typ03.GetMethod("Emit", typ425).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitXorIL.Emit(OpCodes.Pop)
End If
EmitXorIL.MarkSequencePoint(doc3, 1317, 1, 1317, 100)
EmitXorIL.Emit(OpCodes.Ret)
Dim EmitNot As MethodBuilder = ILEmitter.DefineMethod("EmitNot", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNotIL As ILGenerator = EmitNot.GetILGenerator()
EmitNotIL.MarkSequencePoint(doc3, 1320, 1, 1320, 100)
Dim locbldr99 As LocalBuilder = EmitNotIL.DeclareLocal(GetType(OpCode))
locbldr99.SetLocalSymInfo("op")
EmitNotIL.MarkSequencePoint(doc3, 1321, 1, 1321, 100)
Dim typ426(-1) As Type
EmitNotIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ426(UBound(typ426) + 1)
typ426(UBound(typ426)) = Typ
EmitNotIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ426))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ426).ReturnType
EmitNotIL.Emit(OpCodes.Stloc, 0)
EmitNotIL.MarkSequencePoint(doc3, 1322, 1, 1322, 100)
Dim typ427(-1) As Type
EmitNotIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNotIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ427(UBound(typ427) + 1)
typ427(UBound(typ427)) = Typ
EmitNotIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ427))
Typ = Typ03.GetMethod("Emit", typ427).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNotIL.Emit(OpCodes.Pop)
End If
EmitNotIL.MarkSequencePoint(doc3, 1323, 1, 1323, 100)
Dim typ428(-1) As Type
EmitNotIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ428(UBound(typ428) + 1)
typ428(UBound(typ428)) = Typ
EmitNotIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ428))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ428).ReturnType
EmitNotIL.Emit(OpCodes.Stloc, 0)
EmitNotIL.MarkSequencePoint(doc3, 1324, 1, 1324, 100)
Dim typ429(-1) As Type
EmitNotIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNotIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ429(UBound(typ429) + 1)
typ429(UBound(typ429)) = Typ
EmitNotIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ429))
Typ = Typ03.GetMethod("Emit", typ429).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNotIL.Emit(OpCodes.Pop)
End If
EmitNotIL.MarkSequencePoint(doc3, 1325, 1, 1325, 100)
EmitNotIL.Emit(OpCodes.Ret)
Dim EmitNeg As MethodBuilder = ILEmitter.DefineMethod("EmitNeg", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNegIL As ILGenerator = EmitNeg.GetILGenerator()
EmitNegIL.MarkSequencePoint(doc3, 1328, 1, 1328, 100)
Dim locbldr100 As LocalBuilder = EmitNegIL.DeclareLocal(GetType(OpCode))
locbldr100.SetLocalSymInfo("op")
EmitNegIL.MarkSequencePoint(doc3, 1329, 1, 1329, 100)
Dim typ430(-1) As Type
EmitNegIL.Emit(OpCodes.Ldstr, "neg")
Typ = GetType(System.String)
ReDim Preserve typ430(UBound(typ430) + 1)
typ430(UBound(typ430)) = Typ
EmitNegIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ430))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ430).ReturnType
EmitNegIL.Emit(OpCodes.Stloc, 0)
EmitNegIL.MarkSequencePoint(doc3, 1330, 1, 1330, 100)
Dim typ431(-1) As Type
EmitNegIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNegIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ431(UBound(typ431) + 1)
typ431(UBound(typ431)) = Typ
EmitNegIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ431))
Typ = Typ03.GetMethod("Emit", typ431).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNegIL.Emit(OpCodes.Pop)
End If
EmitNegIL.MarkSequencePoint(doc3, 1331, 1, 1331, 100)
EmitNegIL.Emit(OpCodes.Ret)
Dim EmitNand As MethodBuilder = ILEmitter.DefineMethod("EmitNand", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNandIL As ILGenerator = EmitNand.GetILGenerator()
EmitNandIL.MarkSequencePoint(doc3, 1334, 1, 1334, 100)
Dim locbldr101 As LocalBuilder = EmitNandIL.DeclareLocal(GetType(OpCode))
locbldr101.SetLocalSymInfo("op")
EmitNandIL.MarkSequencePoint(doc3, 1335, 1, 1335, 100)
Dim typ432(-1) As Type
EmitNandIL.Emit(OpCodes.Ldstr, "and")
Typ = GetType(System.String)
ReDim Preserve typ432(UBound(typ432) + 1)
typ432(UBound(typ432)) = Typ
EmitNandIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ432))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ432).ReturnType
EmitNandIL.Emit(OpCodes.Stloc, 0)
EmitNandIL.MarkSequencePoint(doc3, 1336, 1, 1336, 100)
Dim typ433(-1) As Type
EmitNandIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNandIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ433(UBound(typ433) + 1)
typ433(UBound(typ433)) = Typ
EmitNandIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ433))
Typ = Typ03.GetMethod("Emit", typ433).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNandIL.Emit(OpCodes.Pop)
End If
EmitNandIL.MarkSequencePoint(doc3, 1337, 1, 1337, 100)
Dim typ434(-1) As Type
EmitNandIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ434(UBound(typ434) + 1)
typ434(UBound(typ434)) = Typ
EmitNandIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ434))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ434).ReturnType
EmitNandIL.Emit(OpCodes.Stloc, 0)
EmitNandIL.MarkSequencePoint(doc3, 1338, 1, 1338, 100)
Dim typ435(-1) As Type
EmitNandIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNandIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ435(UBound(typ435) + 1)
typ435(UBound(typ435)) = Typ
EmitNandIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ435))
Typ = Typ03.GetMethod("Emit", typ435).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNandIL.Emit(OpCodes.Pop)
End If
EmitNandIL.MarkSequencePoint(doc3, 1339, 1, 1339, 100)
Dim typ436(-1) As Type
EmitNandIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ436(UBound(typ436) + 1)
typ436(UBound(typ436)) = Typ
EmitNandIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ436))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ436).ReturnType
EmitNandIL.Emit(OpCodes.Stloc, 0)
EmitNandIL.MarkSequencePoint(doc3, 1340, 1, 1340, 100)
Dim typ437(-1) As Type
EmitNandIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNandIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ437(UBound(typ437) + 1)
typ437(UBound(typ437)) = Typ
EmitNandIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ437))
Typ = Typ03.GetMethod("Emit", typ437).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNandIL.Emit(OpCodes.Pop)
End If
EmitNandIL.MarkSequencePoint(doc3, 1341, 1, 1341, 100)
EmitNandIL.Emit(OpCodes.Ret)
Dim EmitNor As MethodBuilder = ILEmitter.DefineMethod("EmitNor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNorIL As ILGenerator = EmitNor.GetILGenerator()
EmitNorIL.MarkSequencePoint(doc3, 1344, 1, 1344, 100)
Dim locbldr102 As LocalBuilder = EmitNorIL.DeclareLocal(GetType(OpCode))
locbldr102.SetLocalSymInfo("op")
EmitNorIL.MarkSequencePoint(doc3, 1345, 1, 1345, 100)
Dim typ438(-1) As Type
EmitNorIL.Emit(OpCodes.Ldstr, "or")
Typ = GetType(System.String)
ReDim Preserve typ438(UBound(typ438) + 1)
typ438(UBound(typ438)) = Typ
EmitNorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ438))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ438).ReturnType
EmitNorIL.Emit(OpCodes.Stloc, 0)
EmitNorIL.MarkSequencePoint(doc3, 1346, 1, 1346, 100)
Dim typ439(-1) As Type
EmitNorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ439(UBound(typ439) + 1)
typ439(UBound(typ439)) = Typ
EmitNorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ439))
Typ = Typ03.GetMethod("Emit", typ439).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNorIL.Emit(OpCodes.Pop)
End If
EmitNorIL.MarkSequencePoint(doc3, 1347, 1, 1347, 100)
Dim typ440(-1) As Type
EmitNorIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ440(UBound(typ440) + 1)
typ440(UBound(typ440)) = Typ
EmitNorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ440))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ440).ReturnType
EmitNorIL.Emit(OpCodes.Stloc, 0)
EmitNorIL.MarkSequencePoint(doc3, 1348, 1, 1348, 100)
Dim typ441(-1) As Type
EmitNorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ441(UBound(typ441) + 1)
typ441(UBound(typ441)) = Typ
EmitNorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ441))
Typ = Typ03.GetMethod("Emit", typ441).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNorIL.Emit(OpCodes.Pop)
End If
EmitNorIL.MarkSequencePoint(doc3, 1349, 1, 1349, 100)
Dim typ442(-1) As Type
EmitNorIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ442(UBound(typ442) + 1)
typ442(UBound(typ442)) = Typ
EmitNorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ442))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ442).ReturnType
EmitNorIL.Emit(OpCodes.Stloc, 0)
EmitNorIL.MarkSequencePoint(doc3, 1350, 1, 1350, 100)
Dim typ443(-1) As Type
EmitNorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ443(UBound(typ443) + 1)
typ443(UBound(typ443)) = Typ
EmitNorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ443))
Typ = Typ03.GetMethod("Emit", typ443).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNorIL.Emit(OpCodes.Pop)
End If
EmitNorIL.MarkSequencePoint(doc3, 1351, 1, 1351, 100)
EmitNorIL.Emit(OpCodes.Ret)
Dim EmitXnor As MethodBuilder = ILEmitter.DefineMethod("EmitXnor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitXnorIL As ILGenerator = EmitXnor.GetILGenerator()
EmitXnorIL.MarkSequencePoint(doc3, 1354, 1, 1354, 100)
Dim locbldr103 As LocalBuilder = EmitXnorIL.DeclareLocal(GetType(OpCode))
locbldr103.SetLocalSymInfo("op")
EmitXnorIL.MarkSequencePoint(doc3, 1355, 1, 1355, 100)
Dim typ444(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldstr, "xor")
Typ = GetType(System.String)
ReDim Preserve typ444(UBound(typ444) + 1)
typ444(UBound(typ444)) = Typ
EmitXnorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ444))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ444).ReturnType
EmitXnorIL.Emit(OpCodes.Stloc, 0)
EmitXnorIL.MarkSequencePoint(doc3, 1356, 1, 1356, 100)
Dim typ445(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitXnorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ445(UBound(typ445) + 1)
typ445(UBound(typ445)) = Typ
EmitXnorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ445))
Typ = Typ03.GetMethod("Emit", typ445).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitXnorIL.Emit(OpCodes.Pop)
End If
EmitXnorIL.MarkSequencePoint(doc3, 1357, 1, 1357, 100)
Dim typ446(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldstr, "not")
Typ = GetType(System.String)
ReDim Preserve typ446(UBound(typ446) + 1)
typ446(UBound(typ446)) = Typ
EmitXnorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ446))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ446).ReturnType
EmitXnorIL.Emit(OpCodes.Stloc, 0)
EmitXnorIL.MarkSequencePoint(doc3, 1358, 1, 1358, 100)
Dim typ447(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitXnorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ447(UBound(typ447) + 1)
typ447(UBound(typ447)) = Typ
EmitXnorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ447))
Typ = Typ03.GetMethod("Emit", typ447).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitXnorIL.Emit(OpCodes.Pop)
End If
EmitXnorIL.MarkSequencePoint(doc3, 1359, 1, 1359, 100)
EmitXnorIL.Emit(OpCodes.Ret)
Dim EmitCeq As MethodBuilder = ILEmitter.DefineMethod("EmitCeq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitCeqIL As ILGenerator = EmitCeq.GetILGenerator()
EmitCeqIL.MarkSequencePoint(doc3, 1362, 1, 1362, 100)
Dim locbldr104 As LocalBuilder = EmitCeqIL.DeclareLocal(GetType(OpCode))
locbldr104.SetLocalSymInfo("op")
EmitCeqIL.MarkSequencePoint(doc3, 1363, 1, 1363, 100)
Dim typ448(-1) As Type
EmitCeqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ448(UBound(typ448) + 1)
typ448(UBound(typ448)) = Typ
EmitCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ448))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ448).ReturnType
EmitCeqIL.Emit(OpCodes.Stloc, 0)
EmitCeqIL.MarkSequencePoint(doc3, 1364, 1, 1364, 100)
Dim typ449(-1) As Type
EmitCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ449(UBound(typ449) + 1)
typ449(UBound(typ449)) = Typ
EmitCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ449))
Typ = Typ03.GetMethod("Emit", typ449).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCeqIL.Emit(OpCodes.Pop)
End If
EmitCeqIL.MarkSequencePoint(doc3, 1365, 1, 1365, 100)
EmitCeqIL.Emit(OpCodes.Ret)
Dim EmitCneq As MethodBuilder = ILEmitter.DefineMethod("EmitCneq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitCneqIL As ILGenerator = EmitCneq.GetILGenerator()
EmitCneqIL.MarkSequencePoint(doc3, 1368, 1, 1368, 100)
Dim locbldr105 As LocalBuilder = EmitCneqIL.DeclareLocal(GetType(OpCode))
locbldr105.SetLocalSymInfo("op")
EmitCneqIL.MarkSequencePoint(doc3, 1369, 1, 1369, 100)
Dim typ450(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ450(UBound(typ450) + 1)
typ450(UBound(typ450)) = Typ
EmitCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ450))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ450).ReturnType
EmitCneqIL.Emit(OpCodes.Stloc, 0)
EmitCneqIL.MarkSequencePoint(doc3, 1370, 1, 1370, 100)
Dim typ451(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ451(UBound(typ451) + 1)
typ451(UBound(typ451)) = Typ
EmitCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ451))
Typ = Typ03.GetMethod("Emit", typ451).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCneqIL.Emit(OpCodes.Pop)
End If
EmitCneqIL.MarkSequencePoint(doc3, 1371, 1, 1371, 100)
Dim typ452(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ452(UBound(typ452) + 1)
typ452(UBound(typ452)) = Typ
EmitCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ452))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ452).ReturnType
EmitCneqIL.Emit(OpCodes.Stloc, 0)
EmitCneqIL.MarkSequencePoint(doc3, 1372, 1, 1372, 100)
Dim typ453(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ453(UBound(typ453) + 1)
typ453(UBound(typ453)) = Typ
EmitCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ453))
Typ = Typ03.GetMethod("Emit", typ453).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCneqIL.Emit(OpCodes.Pop)
End If
EmitCneqIL.MarkSequencePoint(doc3, 1373, 1, 1373, 100)
Dim typ454(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ454(UBound(typ454) + 1)
typ454(UBound(typ454)) = Typ
EmitCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ454))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ454).ReturnType
EmitCneqIL.Emit(OpCodes.Stloc, 0)
EmitCneqIL.MarkSequencePoint(doc3, 1374, 1, 1374, 100)
Dim typ455(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ455(UBound(typ455) + 1)
typ455(UBound(typ455)) = Typ
EmitCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ455))
Typ = Typ03.GetMethod("Emit", typ455).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCneqIL.Emit(OpCodes.Pop)
End If
EmitCneqIL.MarkSequencePoint(doc3, 1375, 1, 1375, 100)
EmitCneqIL.Emit(OpCodes.Ret)
Dim typ456(-1) As Type
ReDim Preserve typ456(UBound(typ456) + 1)
typ456(UBound(typ456)) = GetType(System.Boolean)
Dim EmitCgt As MethodBuilder = ILEmitter.DefineMethod("EmitCgt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ456)
Dim EmitCgtIL As ILGenerator = EmitCgt.GetILGenerator()
Dim EmitCgtparam01 As ParameterBuilder = EmitCgt.DefineParameter(1, ParameterAttributes.None, "s")
EmitCgtIL.MarkSequencePoint(doc3, 1378, 1, 1378, 100)
Dim locbldr106 As LocalBuilder = EmitCgtIL.DeclareLocal(GetType(OpCode))
locbldr106.SetLocalSymInfo("op")
EmitCgtIL.MarkSequencePoint(doc3, 1379, 1, 1379, 100)
EmitCgtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCgtIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa282 As System.Reflection.Emit.Label = EmitCgtIL.DefineLabel()
Dim tru282 As System.Reflection.Emit.Label = EmitCgtIL.DefineLabel()
Dim cont282 As System.Reflection.Emit.Label = EmitCgtIL.DefineLabel()
EmitCgtIL.Emit(OpCodes.Beq, tru282)
EmitCgtIL.Emit(OpCodes.Br, fa282)
EmitCgtIL.MarkLabel(tru282)
EmitCgtIL.MarkSequencePoint(doc3, 1380, 1, 1380, 100)
Dim typ457(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldstr, "cgt")
Typ = GetType(System.String)
ReDim Preserve typ457(UBound(typ457) + 1)
typ457(UBound(typ457)) = Typ
EmitCgtIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ457))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ457).ReturnType
EmitCgtIL.Emit(OpCodes.Stloc, 0)
EmitCgtIL.MarkSequencePoint(doc3, 1381, 1, 1381, 100)
Dim typ458(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgtIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ458(UBound(typ458) + 1)
typ458(UBound(typ458)) = Typ
EmitCgtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ458))
Typ = Typ03.GetMethod("Emit", typ458).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgtIL.Emit(OpCodes.Pop)
End If
EmitCgtIL.MarkSequencePoint(doc3, 1382, 1, 1382, 100)
EmitCgtIL.Emit(OpCodes.Br, cont282)
EmitCgtIL.MarkLabel(fa282)
EmitCgtIL.MarkSequencePoint(doc3, 1383, 1, 1383, 100)
Dim typ459(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldstr, "cgt.un")
Typ = GetType(System.String)
ReDim Preserve typ459(UBound(typ459) + 1)
typ459(UBound(typ459)) = Typ
EmitCgtIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ459))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ459).ReturnType
EmitCgtIL.Emit(OpCodes.Stloc, 0)
EmitCgtIL.MarkSequencePoint(doc3, 1384, 1, 1384, 100)
Dim typ460(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgtIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ460(UBound(typ460) + 1)
typ460(UBound(typ460)) = Typ
EmitCgtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ460))
Typ = Typ03.GetMethod("Emit", typ460).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgtIL.Emit(OpCodes.Pop)
End If
EmitCgtIL.MarkSequencePoint(doc3, 1385, 1, 1385, 100)
EmitCgtIL.Emit(OpCodes.Br, cont282)
EmitCgtIL.MarkLabel(cont282)
EmitCgtIL.MarkSequencePoint(doc3, 1386, 1, 1386, 100)
EmitCgtIL.Emit(OpCodes.Ret)
Dim typ461(-1) As Type
ReDim Preserve typ461(UBound(typ461) + 1)
typ461(UBound(typ461)) = GetType(System.Boolean)
Dim EmitClt As MethodBuilder = ILEmitter.DefineMethod("EmitClt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ461)
Dim EmitCltIL As ILGenerator = EmitClt.GetILGenerator()
Dim EmitCltparam01 As ParameterBuilder = EmitClt.DefineParameter(1, ParameterAttributes.None, "s")
EmitCltIL.MarkSequencePoint(doc3, 1389, 1, 1389, 100)
Dim locbldr107 As LocalBuilder = EmitCltIL.DeclareLocal(GetType(OpCode))
locbldr107.SetLocalSymInfo("op")
EmitCltIL.MarkSequencePoint(doc3, 1390, 1, 1390, 100)
EmitCltIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCltIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa283 As System.Reflection.Emit.Label = EmitCltIL.DefineLabel()
Dim tru283 As System.Reflection.Emit.Label = EmitCltIL.DefineLabel()
Dim cont283 As System.Reflection.Emit.Label = EmitCltIL.DefineLabel()
EmitCltIL.Emit(OpCodes.Beq, tru283)
EmitCltIL.Emit(OpCodes.Br, fa283)
EmitCltIL.MarkLabel(tru283)
EmitCltIL.MarkSequencePoint(doc3, 1391, 1, 1391, 100)
Dim typ462(-1) As Type
EmitCltIL.Emit(OpCodes.Ldstr, "clt")
Typ = GetType(System.String)
ReDim Preserve typ462(UBound(typ462) + 1)
typ462(UBound(typ462)) = Typ
EmitCltIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ462))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ462).ReturnType
EmitCltIL.Emit(OpCodes.Stloc, 0)
EmitCltIL.MarkSequencePoint(doc3, 1392, 1, 1392, 100)
Dim typ463(-1) As Type
EmitCltIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCltIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ463(UBound(typ463) + 1)
typ463(UBound(typ463)) = Typ
EmitCltIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ463))
Typ = Typ03.GetMethod("Emit", typ463).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCltIL.Emit(OpCodes.Pop)
End If
EmitCltIL.MarkSequencePoint(doc3, 1393, 1, 1393, 100)
EmitCltIL.Emit(OpCodes.Br, cont283)
EmitCltIL.MarkLabel(fa283)
EmitCltIL.MarkSequencePoint(doc3, 1394, 1, 1394, 100)
Dim typ464(-1) As Type
EmitCltIL.Emit(OpCodes.Ldstr, "clt.un")
Typ = GetType(System.String)
ReDim Preserve typ464(UBound(typ464) + 1)
typ464(UBound(typ464)) = Typ
EmitCltIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ464))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ464).ReturnType
EmitCltIL.Emit(OpCodes.Stloc, 0)
EmitCltIL.MarkSequencePoint(doc3, 1395, 1, 1395, 100)
Dim typ465(-1) As Type
EmitCltIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCltIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ465(UBound(typ465) + 1)
typ465(UBound(typ465)) = Typ
EmitCltIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ465))
Typ = Typ03.GetMethod("Emit", typ465).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCltIL.Emit(OpCodes.Pop)
End If
EmitCltIL.MarkSequencePoint(doc3, 1396, 1, 1396, 100)
EmitCltIL.Emit(OpCodes.Br, cont283)
EmitCltIL.MarkLabel(cont283)
EmitCltIL.MarkSequencePoint(doc3, 1397, 1, 1397, 100)
EmitCltIL.Emit(OpCodes.Ret)
Dim typ466(-1) As Type
ReDim Preserve typ466(UBound(typ466) + 1)
typ466(UBound(typ466)) = GetType(System.Boolean)
Dim EmitCle As MethodBuilder = ILEmitter.DefineMethod("EmitCle", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ466)
Dim EmitCleIL As ILGenerator = EmitCle.GetILGenerator()
Dim EmitCleparam01 As ParameterBuilder = EmitCle.DefineParameter(1, ParameterAttributes.None, "s")
EmitCleIL.MarkSequencePoint(doc3, 1400, 1, 1400, 100)
Dim locbldr108 As LocalBuilder = EmitCleIL.DeclareLocal(GetType(OpCode))
locbldr108.SetLocalSymInfo("op")
EmitCleIL.MarkSequencePoint(doc3, 1401, 1, 1401, 100)
EmitCleIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCleIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa284 As System.Reflection.Emit.Label = EmitCleIL.DefineLabel()
Dim tru284 As System.Reflection.Emit.Label = EmitCleIL.DefineLabel()
Dim cont284 As System.Reflection.Emit.Label = EmitCleIL.DefineLabel()
EmitCleIL.Emit(OpCodes.Beq, tru284)
EmitCleIL.Emit(OpCodes.Br, fa284)
EmitCleIL.MarkLabel(tru284)
EmitCleIL.MarkSequencePoint(doc3, 1402, 1, 1402, 100)
Dim typ467(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "cgt")
Typ = GetType(System.String)
ReDim Preserve typ467(UBound(typ467) + 1)
typ467(UBound(typ467)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ467))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ467).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1403, 1, 1403, 100)
Dim typ468(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ468(UBound(typ468) + 1)
typ468(UBound(typ468)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ468))
Typ = Typ03.GetMethod("Emit", typ468).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1404, 1, 1404, 100)
EmitCleIL.Emit(OpCodes.Br, cont284)
EmitCleIL.MarkLabel(fa284)
EmitCleIL.MarkSequencePoint(doc3, 1405, 1, 1405, 100)
Dim typ469(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "cgt.un")
Typ = GetType(System.String)
ReDim Preserve typ469(UBound(typ469) + 1)
typ469(UBound(typ469)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ469))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ469).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1406, 1, 1406, 100)
Dim typ470(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ470(UBound(typ470) + 1)
typ470(UBound(typ470)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ470))
Typ = Typ03.GetMethod("Emit", typ470).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1407, 1, 1407, 100)
EmitCleIL.Emit(OpCodes.Br, cont284)
EmitCleIL.MarkLabel(cont284)
EmitCleIL.MarkSequencePoint(doc3, 1408, 1, 1408, 100)
Dim typ471(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ471(UBound(typ471) + 1)
typ471(UBound(typ471)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ471))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ471).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1409, 1, 1409, 100)
Dim typ472(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ472(UBound(typ472) + 1)
typ472(UBound(typ472)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ472))
Typ = Typ03.GetMethod("Emit", typ472).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1410, 1, 1410, 100)
Dim typ473(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ473(UBound(typ473) + 1)
typ473(UBound(typ473)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ473))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ473).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1411, 1, 1411, 100)
Dim typ474(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ474(UBound(typ474) + 1)
typ474(UBound(typ474)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ474))
Typ = Typ03.GetMethod("Emit", typ474).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1412, 1, 1412, 100)
EmitCleIL.Emit(OpCodes.Ret)
Dim typ475(-1) As Type
ReDim Preserve typ475(UBound(typ475) + 1)
typ475(UBound(typ475)) = GetType(System.Boolean)
Dim EmitCge As MethodBuilder = ILEmitter.DefineMethod("EmitCge", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ475)
Dim EmitCgeIL As ILGenerator = EmitCge.GetILGenerator()
Dim EmitCgeparam01 As ParameterBuilder = EmitCge.DefineParameter(1, ParameterAttributes.None, "s")
EmitCgeIL.MarkSequencePoint(doc3, 1415, 1, 1415, 100)
Dim locbldr109 As LocalBuilder = EmitCgeIL.DeclareLocal(GetType(OpCode))
locbldr109.SetLocalSymInfo("op")
EmitCgeIL.MarkSequencePoint(doc3, 1416, 1, 1416, 100)
EmitCgeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCgeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa285 As System.Reflection.Emit.Label = EmitCgeIL.DefineLabel()
Dim tru285 As System.Reflection.Emit.Label = EmitCgeIL.DefineLabel()
Dim cont285 As System.Reflection.Emit.Label = EmitCgeIL.DefineLabel()
EmitCgeIL.Emit(OpCodes.Beq, tru285)
EmitCgeIL.Emit(OpCodes.Br, fa285)
EmitCgeIL.MarkLabel(tru285)
EmitCgeIL.MarkSequencePoint(doc3, 1417, 1, 1417, 100)
Dim typ476(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "clt")
Typ = GetType(System.String)
ReDim Preserve typ476(UBound(typ476) + 1)
typ476(UBound(typ476)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ476))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ476).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1418, 1, 1418, 100)
Dim typ477(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ477(UBound(typ477) + 1)
typ477(UBound(typ477)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ477))
Typ = Typ03.GetMethod("Emit", typ477).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1419, 1, 1419, 100)
EmitCgeIL.Emit(OpCodes.Br, cont285)
EmitCgeIL.MarkLabel(fa285)
EmitCgeIL.MarkSequencePoint(doc3, 1420, 1, 1420, 100)
Dim typ478(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "clt.un")
Typ = GetType(System.String)
ReDim Preserve typ478(UBound(typ478) + 1)
typ478(UBound(typ478)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ478))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ478).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1421, 1, 1421, 100)
Dim typ479(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ479(UBound(typ479) + 1)
typ479(UBound(typ479)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ479))
Typ = Typ03.GetMethod("Emit", typ479).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1422, 1, 1422, 100)
EmitCgeIL.Emit(OpCodes.Br, cont285)
EmitCgeIL.MarkLabel(cont285)
EmitCgeIL.MarkSequencePoint(doc3, 1423, 1, 1423, 100)
Dim typ480(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ480(UBound(typ480) + 1)
typ480(UBound(typ480)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ480))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ480).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1424, 1, 1424, 100)
Dim typ481(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ481(UBound(typ481) + 1)
typ481(UBound(typ481)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ481))
Typ = Typ03.GetMethod("Emit", typ481).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1425, 1, 1425, 100)
Dim typ482(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ482(UBound(typ482) + 1)
typ482(UBound(typ482)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ482))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ482).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1426, 1, 1426, 100)
Dim typ483(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ483(UBound(typ483) + 1)
typ483(UBound(typ483)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ483))
Typ = Typ03.GetMethod("Emit", typ483).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1427, 1, 1427, 100)
EmitCgeIL.Emit(OpCodes.Ret)
Dim EmitLike As MethodBuilder = ILEmitter.DefineMethod("EmitLike", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitLikeIL As ILGenerator = EmitLike.GetILGenerator()
EmitLikeIL.MarkSequencePoint(doc3, 1430, 1, 1430, 100)
Dim locbldr110 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(OpCode))
locbldr110.SetLocalSymInfo("op")
EmitLikeIL.MarkSequencePoint(doc3, 1431, 1, 1431, 100)
Dim locbldr111 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(System.Type))
locbldr111.SetLocalSymInfo("lotyp")
EmitLikeIL.Emit(OpCodes.Ldtoken, GetType(Regex))
Dim typ484 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ484))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ484).ReturnType
EmitLikeIL.Emit(OpCodes.Stloc, 1)
EmitLikeIL.MarkSequencePoint(doc3, 1432, 1, 1432, 100)
Dim locbldr112 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr112.SetLocalSymInfo("params")
EmitLikeIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitLikeIL.Emit(OpCodes.Conv_U)
EmitLikeIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitLikeIL.Emit(OpCodes.Stloc, 2)
EmitLikeIL.MarkSequencePoint(doc3, 1433, 1, 1433, 100)
EmitLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitLikeIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ485 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ485))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ485).ReturnType
EmitLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitLikeIL.MarkSequencePoint(doc3, 1434, 1, 1434, 100)
EmitLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitLikeIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ486 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ486))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ486).ReturnType
EmitLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitLikeIL.MarkSequencePoint(doc3, 1435, 1, 1435, 100)
Dim locbldr113 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(MethodInfo))
locbldr113.SetLocalSymInfo("lomet")
Dim typ487(-1) As Type
EmitLikeIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLikeIL.Emit(OpCodes.Ldstr, "IsMatch")
Typ = GetType(System.String)
ReDim Preserve typ487(UBound(typ487) + 1)
typ487(UBound(typ487)) = Typ
EmitLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ487(UBound(typ487) + 1)
typ487(UBound(typ487)) = Typ
EmitLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ487))
Typ = Typ03.GetMethod("GetMethod", typ487).ReturnType
EmitLikeIL.Emit(OpCodes.Stloc, 3)
EmitLikeIL.MarkSequencePoint(doc3, 1436, 1, 1436, 100)
Dim typ488(-1) As Type
EmitLikeIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ488(UBound(typ488) + 1)
typ488(UBound(typ488)) = Typ
EmitLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ488))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ488).ReturnType
EmitLikeIL.Emit(OpCodes.Stloc, 0)
EmitLikeIL.MarkSequencePoint(doc3, 1437, 1, 1437, 100)
Dim typ489(-1) As Type
EmitLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ489(UBound(typ489) + 1)
typ489(UBound(typ489)) = Typ
EmitLikeIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ489(UBound(typ489) + 1)
typ489(UBound(typ489)) = Typ
EmitLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ489))
Typ = Typ03.GetMethod("Emit", typ489).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLikeIL.Emit(OpCodes.Pop)
End If
EmitLikeIL.MarkSequencePoint(doc3, 1438, 1, 1438, 100)
EmitLikeIL.Emit(OpCodes.Ret)
Dim EmitNLike As MethodBuilder = ILEmitter.DefineMethod("EmitNLike", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNLikeIL As ILGenerator = EmitNLike.GetILGenerator()
EmitNLikeIL.MarkSequencePoint(doc3, 1441, 1, 1441, 100)
Dim locbldr114 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(OpCode))
locbldr114.SetLocalSymInfo("op")
EmitNLikeIL.MarkSequencePoint(doc3, 1442, 1, 1442, 100)
Dim locbldr115 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(System.Type))
locbldr115.SetLocalSymInfo("lotyp")
EmitNLikeIL.Emit(OpCodes.Ldtoken, GetType(Regex))
Dim typ490 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitNLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ490))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ490).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 1)
EmitNLikeIL.MarkSequencePoint(doc3, 1443, 1, 1443, 100)
Dim locbldr116 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr116.SetLocalSymInfo("params")
EmitNLikeIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitNLikeIL.Emit(OpCodes.Conv_U)
EmitNLikeIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitNLikeIL.Emit(OpCodes.Stloc, 2)
EmitNLikeIL.MarkSequencePoint(doc3, 1444, 1, 1444, 100)
EmitNLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitNLikeIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitNLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitNLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ491 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitNLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ491))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ491).ReturnType
EmitNLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitNLikeIL.MarkSequencePoint(doc3, 1445, 1, 1445, 100)
EmitNLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitNLikeIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitNLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitNLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ492 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitNLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ492))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ492).ReturnType
EmitNLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitNLikeIL.MarkSequencePoint(doc3, 1446, 1, 1446, 100)
Dim locbldr117 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(MethodInfo))
locbldr117.SetLocalSymInfo("lomet")
Dim typ493(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldstr, "IsMatch")
Typ = GetType(System.String)
ReDim Preserve typ493(UBound(typ493) + 1)
typ493(UBound(typ493)) = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ493(UBound(typ493) + 1)
typ493(UBound(typ493)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ493))
Typ = Typ03.GetMethod("GetMethod", typ493).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 3)
EmitNLikeIL.MarkSequencePoint(doc3, 1447, 1, 1447, 100)
Dim typ494(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ494(UBound(typ494) + 1)
typ494(UBound(typ494)) = Typ
EmitNLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ494))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ494).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 0)
EmitNLikeIL.MarkSequencePoint(doc3, 1448, 1, 1448, 100)
Dim typ495(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ495(UBound(typ495) + 1)
typ495(UBound(typ495)) = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ495(UBound(typ495) + 1)
typ495(UBound(typ495)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ495))
Typ = Typ03.GetMethod("Emit", typ495).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNLikeIL.Emit(OpCodes.Pop)
End If
EmitNLikeIL.MarkSequencePoint(doc3, 1449, 1, 1449, 100)
Dim typ496(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ496(UBound(typ496) + 1)
typ496(UBound(typ496)) = Typ
EmitNLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ496))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ496).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 0)
EmitNLikeIL.MarkSequencePoint(doc3, 1450, 1, 1450, 100)
Dim typ497(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ497(UBound(typ497) + 1)
typ497(UBound(typ497)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ497))
Typ = Typ03.GetMethod("Emit", typ497).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNLikeIL.Emit(OpCodes.Pop)
End If
EmitNLikeIL.MarkSequencePoint(doc3, 1451, 1, 1451, 100)
Dim typ498(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ498(UBound(typ498) + 1)
typ498(UBound(typ498)) = Typ
EmitNLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ498))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ498).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 0)
EmitNLikeIL.MarkSequencePoint(doc3, 1452, 1, 1452, 100)
Dim typ499(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ499(UBound(typ499) + 1)
typ499(UBound(typ499)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ499))
Typ = Typ03.GetMethod("Emit", typ499).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNLikeIL.Emit(OpCodes.Pop)
End If
EmitNLikeIL.MarkSequencePoint(doc3, 1454, 1, 1454, 100)
EmitNLikeIL.Emit(OpCodes.Ret)
Dim EmitStrCeq As MethodBuilder = ILEmitter.DefineMethod("EmitStrCeq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitStrCeqIL As ILGenerator = EmitStrCeq.GetILGenerator()
EmitStrCeqIL.MarkSequencePoint(doc3, 1457, 1, 1457, 100)
Dim locbldr118 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(OpCode))
locbldr118.SetLocalSymInfo("op")
EmitStrCeqIL.MarkSequencePoint(doc3, 1458, 1, 1458, 100)
Dim locbldr119 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(System.Type))
locbldr119.SetLocalSymInfo("strtyp")
EmitStrCeqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ500 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCeqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ500))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ500).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 1)
EmitStrCeqIL.MarkSequencePoint(doc3, 1459, 1, 1459, 100)
Dim locbldr120 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr120.SetLocalSymInfo("params")
EmitStrCeqIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitStrCeqIL.Emit(OpCodes.Conv_U)
EmitStrCeqIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitStrCeqIL.Emit(OpCodes.Stloc, 2)
EmitStrCeqIL.MarkSequencePoint(doc3, 1460, 1, 1460, 100)
EmitStrCeqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitStrCeqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCeqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ501 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCeqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ501))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ501).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCeqIL.MarkSequencePoint(doc3, 1461, 1, 1461, 100)
EmitStrCeqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitStrCeqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCeqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ502 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCeqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ502))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ502).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCeqIL.MarkSequencePoint(doc3, 1462, 1, 1462, 100)
Dim locbldr121 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(MethodInfo))
locbldr121.SetLocalSymInfo("met")
Dim typ503(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldstr, "Compare")
Typ = GetType(System.String)
ReDim Preserve typ503(UBound(typ503) + 1)
typ503(UBound(typ503)) = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ503(UBound(typ503) + 1)
typ503(UBound(typ503)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ503))
Typ = Typ03.GetMethod("GetMethod", typ503).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 3)
EmitStrCeqIL.MarkSequencePoint(doc3, 1463, 1, 1463, 100)
Dim typ504(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ504(UBound(typ504) + 1)
typ504(UBound(typ504)) = Typ
EmitStrCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ504))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ504).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 0)
EmitStrCeqIL.MarkSequencePoint(doc3, 1464, 1, 1464, 100)
Dim typ505(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ505(UBound(typ505) + 1)
typ505(UBound(typ505)) = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ505(UBound(typ505) + 1)
typ505(UBound(typ505)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ505))
Typ = Typ03.GetMethod("Emit", typ505).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCeqIL.Emit(OpCodes.Pop)
End If
EmitStrCeqIL.MarkSequencePoint(doc3, 1465, 1, 1465, 100)
Dim typ506(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ506(UBound(typ506) + 1)
typ506(UBound(typ506)) = Typ
EmitStrCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ506))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ506).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 0)
EmitStrCeqIL.MarkSequencePoint(doc3, 1466, 1, 1466, 100)
Dim typ507(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ507(UBound(typ507) + 1)
typ507(UBound(typ507)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ507))
Typ = Typ03.GetMethod("Emit", typ507).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCeqIL.Emit(OpCodes.Pop)
End If
EmitStrCeqIL.MarkSequencePoint(doc3, 1467, 1, 1467, 100)
Dim typ508(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ508(UBound(typ508) + 1)
typ508(UBound(typ508)) = Typ
EmitStrCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ508))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ508).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 0)
EmitStrCeqIL.MarkSequencePoint(doc3, 1468, 1, 1468, 100)
Dim typ509(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ509(UBound(typ509) + 1)
typ509(UBound(typ509)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ509))
Typ = Typ03.GetMethod("Emit", typ509).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCeqIL.Emit(OpCodes.Pop)
End If
EmitStrCeqIL.MarkSequencePoint(doc3, 1469, 1, 1469, 100)
EmitStrCeqIL.Emit(OpCodes.Ret)
Dim EmitStrCneq As MethodBuilder = ILEmitter.DefineMethod("EmitStrCneq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitStrCneqIL As ILGenerator = EmitStrCneq.GetILGenerator()
EmitStrCneqIL.MarkSequencePoint(doc3, 1472, 1, 1472, 100)
Dim locbldr122 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(OpCode))
locbldr122.SetLocalSymInfo("op")
EmitStrCneqIL.MarkSequencePoint(doc3, 1473, 1, 1473, 100)
Dim locbldr123 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(System.Type))
locbldr123.SetLocalSymInfo("strtyp")
EmitStrCneqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ510 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCneqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ510))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ510).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 1)
EmitStrCneqIL.MarkSequencePoint(doc3, 1474, 1, 1474, 100)
Dim locbldr124 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr124.SetLocalSymInfo("params")
EmitStrCneqIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitStrCneqIL.Emit(OpCodes.Conv_U)
EmitStrCneqIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitStrCneqIL.Emit(OpCodes.Stloc, 2)
EmitStrCneqIL.MarkSequencePoint(doc3, 1475, 1, 1475, 100)
EmitStrCneqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitStrCneqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCneqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ511 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCneqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ511))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ511).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCneqIL.MarkSequencePoint(doc3, 1476, 1, 1476, 100)
EmitStrCneqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitStrCneqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCneqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ512 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCneqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ512))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ512).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCneqIL.MarkSequencePoint(doc3, 1477, 1, 1477, 100)
Dim locbldr125 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(MethodInfo))
locbldr125.SetLocalSymInfo("met")
Dim typ513(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldstr, "Compare")
Typ = GetType(System.String)
ReDim Preserve typ513(UBound(typ513) + 1)
typ513(UBound(typ513)) = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ513(UBound(typ513) + 1)
typ513(UBound(typ513)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ513))
Typ = Typ03.GetMethod("GetMethod", typ513).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 3)
EmitStrCneqIL.MarkSequencePoint(doc3, 1478, 1, 1478, 100)
Dim typ514(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ514(UBound(typ514) + 1)
typ514(UBound(typ514)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ514))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ514).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1479, 1, 1479, 100)
Dim typ515(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ515(UBound(typ515) + 1)
typ515(UBound(typ515)) = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ515(UBound(typ515) + 1)
typ515(UBound(typ515)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ515))
Typ = Typ03.GetMethod("Emit", typ515).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1480, 1, 1480, 100)
Dim typ516(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ516(UBound(typ516) + 1)
typ516(UBound(typ516)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ516))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ516).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1481, 1, 1481, 100)
Dim typ517(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ517(UBound(typ517) + 1)
typ517(UBound(typ517)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ517))
Typ = Typ03.GetMethod("Emit", typ517).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1482, 1, 1482, 100)
Dim typ518(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ518(UBound(typ518) + 1)
typ518(UBound(typ518)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ518))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ518).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1483, 1, 1483, 100)
Dim typ519(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ519(UBound(typ519) + 1)
typ519(UBound(typ519)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ519))
Typ = Typ03.GetMethod("Emit", typ519).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1484, 1, 1484, 100)
Dim typ520(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ520(UBound(typ520) + 1)
typ520(UBound(typ520)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ520))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ520).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1485, 1, 1485, 100)
Dim typ521(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ521(UBound(typ521) + 1)
typ521(UBound(typ521)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ521))
Typ = Typ03.GetMethod("Emit", typ521).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1486, 1, 1486, 100)
Dim typ522(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ522(UBound(typ522) + 1)
typ522(UBound(typ522)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ522))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ522).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1487, 1, 1487, 100)
Dim typ523(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ523(UBound(typ523) + 1)
typ523(UBound(typ523)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ523))
Typ = Typ03.GetMethod("Emit", typ523).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1488, 1, 1488, 100)
EmitStrCneqIL.Emit(OpCodes.Ret)
Dim EmitStrAdd As MethodBuilder = ILEmitter.DefineMethod("EmitStrAdd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitStrAddIL As ILGenerator = EmitStrAdd.GetILGenerator()
EmitStrAddIL.MarkSequencePoint(doc3, 1491, 1, 1491, 100)
Dim locbldr126 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(OpCode))
locbldr126.SetLocalSymInfo("op")
EmitStrAddIL.MarkSequencePoint(doc3, 1492, 1, 1492, 100)
Dim locbldr127 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(System.Type))
locbldr127.SetLocalSymInfo("strtyp")
EmitStrAddIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ524 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrAddIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ524))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ524).ReturnType
EmitStrAddIL.Emit(OpCodes.Stloc, 1)
EmitStrAddIL.MarkSequencePoint(doc3, 1493, 1, 1493, 100)
Dim locbldr128 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr128.SetLocalSymInfo("params")
EmitStrAddIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitStrAddIL.Emit(OpCodes.Conv_U)
EmitStrAddIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitStrAddIL.Emit(OpCodes.Stloc, 2)
EmitStrAddIL.MarkSequencePoint(doc3, 1494, 1, 1494, 100)
EmitStrAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrAddIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitStrAddIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrAddIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
EmitStrAddIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrAddIL.MarkSequencePoint(doc3, 1495, 1, 1495, 100)
EmitStrAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrAddIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitStrAddIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrAddIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
EmitStrAddIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrAddIL.MarkSequencePoint(doc3, 1496, 1, 1496, 100)
Dim locbldr129 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(MethodInfo))
locbldr129.SetLocalSymInfo("met")
Dim typ525(-1) As Type
EmitStrAddIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStrAddIL.Emit(OpCodes.Ldstr, "Concat")
Typ = GetType(System.String)
ReDim Preserve typ525(UBound(typ525) + 1)
typ525(UBound(typ525)) = Typ
EmitStrAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ525(UBound(typ525) + 1)
typ525(UBound(typ525)) = Typ
EmitStrAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ525))
Typ = Typ03.GetMethod("GetMethod", typ525).ReturnType
EmitStrAddIL.Emit(OpCodes.Stloc, 3)
EmitStrAddIL.MarkSequencePoint(doc3, 1497, 1, 1497, 100)
Dim typ526(-1) As Type
EmitStrAddIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ526(UBound(typ526) + 1)
typ526(UBound(typ526)) = Typ
EmitStrAddIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ526))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ526).ReturnType
EmitStrAddIL.Emit(OpCodes.Stloc, 0)
EmitStrAddIL.MarkSequencePoint(doc3, 1498, 1, 1498, 100)
Dim typ527(-1) As Type
EmitStrAddIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrAddIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ527(UBound(typ527) + 1)
typ527(UBound(typ527)) = Typ
EmitStrAddIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ527(UBound(typ527) + 1)
typ527(UBound(typ527)) = Typ
EmitStrAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ527))
Typ = Typ03.GetMethod("Emit", typ527).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrAddIL.Emit(OpCodes.Pop)
End If
EmitStrAddIL.MarkSequencePoint(doc3, 1499, 1, 1499, 100)
EmitStrAddIL.Emit(OpCodes.Ret)
Dim EmitDelegateAdd As MethodBuilder = ILEmitter.DefineMethod("EmitDelegateAdd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitDelegateAddIL As ILGenerator = EmitDelegateAdd.GetILGenerator()
EmitDelegateAddIL.MarkSequencePoint(doc3, 1502, 1, 1502, 100)
Dim locbldr130 As LocalBuilder = EmitDelegateAddIL.DeclareLocal(GetType(OpCode))
locbldr130.SetLocalSymInfo("op")
EmitDelegateAddIL.MarkSequencePoint(doc3, 1503, 1, 1503, 100)
Dim locbldr131 As LocalBuilder = EmitDelegateAddIL.DeclareLocal(GetType(System.Type))
locbldr131.SetLocalSymInfo("deltyp")
EmitDelegateAddIL.Emit(OpCodes.Ldtoken, GetType(System.Delegate))
Dim typ528 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitDelegateAddIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ528))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ528).ReturnType
EmitDelegateAddIL.Emit(OpCodes.Stloc, 1)
EmitDelegateAddIL.MarkSequencePoint(doc3, 1504, 1, 1504, 100)
Dim locbldr132 As LocalBuilder = EmitDelegateAddIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr132.SetLocalSymInfo("params")
EmitDelegateAddIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitDelegateAddIL.Emit(OpCodes.Conv_U)
EmitDelegateAddIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitDelegateAddIL.Emit(OpCodes.Stloc, 2)
EmitDelegateAddIL.MarkSequencePoint(doc3, 1505, 1, 1505, 100)
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitDelegateAddIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitDelegateAddIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
EmitDelegateAddIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitDelegateAddIL.MarkSequencePoint(doc3, 1506, 1, 1506, 100)
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitDelegateAddIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitDelegateAddIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
EmitDelegateAddIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitDelegateAddIL.MarkSequencePoint(doc3, 1507, 1, 1507, 100)
Dim locbldr133 As LocalBuilder = EmitDelegateAddIL.DeclareLocal(GetType(MethodInfo))
locbldr133.SetLocalSymInfo("met")
Dim typ529(-1) As Type
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitDelegateAddIL.Emit(OpCodes.Ldstr, "Combine")
Typ = GetType(System.String)
ReDim Preserve typ529(UBound(typ529) + 1)
typ529(UBound(typ529)) = Typ
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ529(UBound(typ529) + 1)
typ529(UBound(typ529)) = Typ
EmitDelegateAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ529))
Typ = Typ03.GetMethod("GetMethod", typ529).ReturnType
EmitDelegateAddIL.Emit(OpCodes.Stloc, 3)
EmitDelegateAddIL.MarkSequencePoint(doc3, 1508, 1, 1508, 100)
Dim typ530(-1) As Type
EmitDelegateAddIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ530(UBound(typ530) + 1)
typ530(UBound(typ530)) = Typ
EmitDelegateAddIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ530))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ530).ReturnType
EmitDelegateAddIL.Emit(OpCodes.Stloc, 0)
EmitDelegateAddIL.MarkSequencePoint(doc3, 1509, 1, 1509, 100)
Dim typ531(-1) As Type
EmitDelegateAddIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ531(UBound(typ531) + 1)
typ531(UBound(typ531)) = Typ
EmitDelegateAddIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ531(UBound(typ531) + 1)
typ531(UBound(typ531)) = Typ
EmitDelegateAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ531))
Typ = Typ03.GetMethod("Emit", typ531).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitDelegateAddIL.Emit(OpCodes.Pop)
End If
EmitDelegateAddIL.MarkSequencePoint(doc3, 1510, 1, 1510, 100)
EmitDelegateAddIL.Emit(OpCodes.Ret)
Dim EmitDelegateSub As MethodBuilder = ILEmitter.DefineMethod("EmitDelegateSub", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitDelegateSubIL As ILGenerator = EmitDelegateSub.GetILGenerator()
EmitDelegateSubIL.MarkSequencePoint(doc3, 1513, 1, 1513, 100)
Dim locbldr134 As LocalBuilder = EmitDelegateSubIL.DeclareLocal(GetType(OpCode))
locbldr134.SetLocalSymInfo("op")
EmitDelegateSubIL.MarkSequencePoint(doc3, 1514, 1, 1514, 100)
Dim locbldr135 As LocalBuilder = EmitDelegateSubIL.DeclareLocal(GetType(System.Type))
locbldr135.SetLocalSymInfo("deltyp")
EmitDelegateSubIL.Emit(OpCodes.Ldtoken, GetType(System.Delegate))
Dim typ532 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitDelegateSubIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ532))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ532).ReturnType
EmitDelegateSubIL.Emit(OpCodes.Stloc, 1)
EmitDelegateSubIL.MarkSequencePoint(doc3, 1515, 1, 1515, 100)
Dim locbldr136 As LocalBuilder = EmitDelegateSubIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr136.SetLocalSymInfo("params")
EmitDelegateSubIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitDelegateSubIL.Emit(OpCodes.Conv_U)
EmitDelegateSubIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitDelegateSubIL.Emit(OpCodes.Stloc, 2)
EmitDelegateSubIL.MarkSequencePoint(doc3, 1516, 1, 1516, 100)
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitDelegateSubIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitDelegateSubIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
EmitDelegateSubIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitDelegateSubIL.MarkSequencePoint(doc3, 1517, 1, 1517, 100)
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitDelegateSubIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitDelegateSubIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
EmitDelegateSubIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitDelegateSubIL.MarkSequencePoint(doc3, 1518, 1, 1518, 100)
Dim locbldr137 As LocalBuilder = EmitDelegateSubIL.DeclareLocal(GetType(MethodInfo))
locbldr137.SetLocalSymInfo("met")
Dim typ533(-1) As Type
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitDelegateSubIL.Emit(OpCodes.Ldstr, "Remove")
Typ = GetType(System.String)
ReDim Preserve typ533(UBound(typ533) + 1)
typ533(UBound(typ533)) = Typ
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ533(UBound(typ533) + 1)
typ533(UBound(typ533)) = Typ
EmitDelegateSubIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ533))
Typ = Typ03.GetMethod("GetMethod", typ533).ReturnType
EmitDelegateSubIL.Emit(OpCodes.Stloc, 3)
EmitDelegateSubIL.MarkSequencePoint(doc3, 1519, 1, 1519, 100)
Dim typ534(-1) As Type
EmitDelegateSubIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ534(UBound(typ534) + 1)
typ534(UBound(typ534)) = Typ
EmitDelegateSubIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ534))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ534).ReturnType
EmitDelegateSubIL.Emit(OpCodes.Stloc, 0)
EmitDelegateSubIL.MarkSequencePoint(doc3, 1520, 1, 1520, 100)
Dim typ535(-1) As Type
EmitDelegateSubIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ535(UBound(typ535) + 1)
typ535(UBound(typ535)) = Typ
EmitDelegateSubIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ535(UBound(typ535) + 1)
typ535(UBound(typ535)) = Typ
EmitDelegateSubIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ535))
Typ = Typ03.GetMethod("Emit", typ535).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitDelegateSubIL.Emit(OpCodes.Pop)
End If
EmitDelegateSubIL.MarkSequencePoint(doc3, 1521, 1, 1521, 100)
EmitDelegateSubIL.Emit(OpCodes.Ret)
Dim typ536(-1) As Type
ReDim Preserve typ536(UBound(typ536) + 1)
typ536(UBound(typ536)) = GetType(System.Single)
Dim EmitLdcR4 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcR4", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ536)
Dim EmitLdcR4IL As ILGenerator = EmitLdcR4.GetILGenerator()
Dim EmitLdcR4param01 As ParameterBuilder = EmitLdcR4.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdcR4IL.MarkSequencePoint(doc3, 1524, 1, 1524, 100)
Dim locbldr138 As LocalBuilder = EmitLdcR4IL.DeclareLocal(GetType(OpCode))
locbldr138.SetLocalSymInfo("op")
EmitLdcR4IL.MarkSequencePoint(doc3, 1525, 1, 1525, 100)
Dim typ537(-1) As Type
EmitLdcR4IL.Emit(OpCodes.Ldstr, "ldc.r4")
Typ = GetType(System.String)
ReDim Preserve typ537(UBound(typ537) + 1)
typ537(UBound(typ537)) = Typ
EmitLdcR4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ537))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ537).ReturnType
EmitLdcR4IL.Emit(OpCodes.Stloc, 0)
EmitLdcR4IL.MarkSequencePoint(doc3, 1526, 1, 1526, 100)
Dim typ538(-1) As Type
EmitLdcR4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcR4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ538(UBound(typ538) + 1)
typ538(UBound(typ538)) = Typ
EmitLdcR4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Single)
ReDim Preserve typ538(UBound(typ538) + 1)
typ538(UBound(typ538)) = Typ
EmitLdcR4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ538))
Typ = Typ03.GetMethod("Emit", typ538).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcR4IL.Emit(OpCodes.Pop)
End If
EmitLdcR4IL.MarkSequencePoint(doc3, 1527, 1, 1527, 100)
EmitLdcR4IL.Emit(OpCodes.Ret)
Dim typ539(-1) As Type
ReDim Preserve typ539(UBound(typ539) + 1)
typ539(UBound(typ539)) = GetType(System.Double)
Dim EmitLdcR8 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcR8", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ539)
Dim EmitLdcR8IL As ILGenerator = EmitLdcR8.GetILGenerator()
Dim EmitLdcR8param01 As ParameterBuilder = EmitLdcR8.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdcR8IL.MarkSequencePoint(doc3, 1530, 1, 1530, 100)
Dim locbldr139 As LocalBuilder = EmitLdcR8IL.DeclareLocal(GetType(OpCode))
locbldr139.SetLocalSymInfo("op")
EmitLdcR8IL.MarkSequencePoint(doc3, 1531, 1, 1531, 100)
Dim typ540(-1) As Type
EmitLdcR8IL.Emit(OpCodes.Ldstr, "ldc.r8")
Typ = GetType(System.String)
ReDim Preserve typ540(UBound(typ540) + 1)
typ540(UBound(typ540)) = Typ
EmitLdcR8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ540))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ540).ReturnType
EmitLdcR8IL.Emit(OpCodes.Stloc, 0)
EmitLdcR8IL.MarkSequencePoint(doc3, 1532, 1, 1532, 100)
Dim typ541(-1) As Type
EmitLdcR8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcR8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ541(UBound(typ541) + 1)
typ541(UBound(typ541)) = Typ
EmitLdcR8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Double)
ReDim Preserve typ541(UBound(typ541) + 1)
typ541(UBound(typ541)) = Typ
EmitLdcR8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ541))
Typ = Typ03.GetMethod("Emit", typ541).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcR8IL.Emit(OpCodes.Pop)
End If
EmitLdcR8IL.MarkSequencePoint(doc3, 1533, 1, 1533, 100)
EmitLdcR8IL.Emit(OpCodes.Ret)
Dim typ542(-1) As Type
ReDim Preserve typ542(UBound(typ542) + 1)
typ542(UBound(typ542)) = GetType(System.Boolean)
Dim EmitLdcBool As MethodBuilder = ILEmitter.DefineMethod("EmitLdcBool", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ542)
Dim EmitLdcBoolIL As ILGenerator = EmitLdcBool.GetILGenerator()
Dim EmitLdcBoolparam01 As ParameterBuilder = EmitLdcBool.DefineParameter(1, ParameterAttributes.None, "b")
EmitLdcBoolIL.MarkSequencePoint(doc3, 1536, 1, 1536, 100)
Dim locbldr140 As LocalBuilder = EmitLdcBoolIL.DeclareLocal(GetType(OpCode))
locbldr140.SetLocalSymInfo("op")
EmitLdcBoolIL.MarkSequencePoint(doc3, 1537, 1, 1537, 100)
EmitLdcBoolIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitLdcBoolIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa286 As System.Reflection.Emit.Label = EmitLdcBoolIL.DefineLabel()
Dim tru286 As System.Reflection.Emit.Label = EmitLdcBoolIL.DefineLabel()
Dim cont286 As System.Reflection.Emit.Label = EmitLdcBoolIL.DefineLabel()
EmitLdcBoolIL.Emit(OpCodes.Beq, tru286)
EmitLdcBoolIL.Emit(OpCodes.Br, fa286)
EmitLdcBoolIL.MarkLabel(tru286)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1538, 1, 1538, 100)
Dim typ543(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ543(UBound(typ543) + 1)
typ543(UBound(typ543)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ543))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ543).ReturnType
EmitLdcBoolIL.Emit(OpCodes.Stloc, 0)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1539, 1, 1539, 100)
Dim typ544(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcBoolIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ544(UBound(typ544) + 1)
typ544(UBound(typ544)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ544))
Typ = Typ03.GetMethod("Emit", typ544).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcBoolIL.Emit(OpCodes.Pop)
End If
EmitLdcBoolIL.MarkSequencePoint(doc3, 1540, 1, 1540, 100)
EmitLdcBoolIL.Emit(OpCodes.Br, cont286)
EmitLdcBoolIL.MarkLabel(fa286)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1541, 1, 1541, 100)
Dim typ545(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ545(UBound(typ545) + 1)
typ545(UBound(typ545)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ545))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ545).ReturnType
EmitLdcBoolIL.Emit(OpCodes.Stloc, 0)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1542, 1, 1542, 100)
Dim typ546(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcBoolIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ546(UBound(typ546) + 1)
typ546(UBound(typ546)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ546))
Typ = Typ03.GetMethod("Emit", typ546).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcBoolIL.Emit(OpCodes.Pop)
End If
EmitLdcBoolIL.MarkSequencePoint(doc3, 1543, 1, 1543, 100)
EmitLdcBoolIL.Emit(OpCodes.Br, cont286)
EmitLdcBoolIL.MarkLabel(cont286)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1544, 1, 1544, 100)
EmitLdcBoolIL.Emit(OpCodes.Ret)
Dim typ547(-1) As Type
ReDim Preserve typ547(UBound(typ547) + 1)
typ547(UBound(typ547)) = GetType(System.Char)
Dim EmitLdcChar As MethodBuilder = ILEmitter.DefineMethod("EmitLdcChar", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ547)
Dim EmitLdcCharIL As ILGenerator = EmitLdcChar.GetILGenerator()
Dim EmitLdcCharparam01 As ParameterBuilder = EmitLdcChar.DefineParameter(1, ParameterAttributes.None, "c")
EmitLdcCharIL.MarkSequencePoint(doc3, 1547, 1, 1547, 100)
Dim locbldr141 As LocalBuilder = EmitLdcCharIL.DeclareLocal(GetType(OpCode))
locbldr141.SetLocalSymInfo("op")
EmitLdcCharIL.MarkSequencePoint(doc3, 1548, 1, 1548, 100)
Dim typ548(-1) As Type
EmitLdcCharIL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ548(UBound(typ548) + 1)
typ548(UBound(typ548)) = Typ
EmitLdcCharIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ548))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ548).ReturnType
EmitLdcCharIL.Emit(OpCodes.Stloc, 0)
EmitLdcCharIL.MarkSequencePoint(doc3, 1549, 1, 1549, 100)
Dim typ549(-1) As Type
EmitLdcCharIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcCharIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ549(UBound(typ549) + 1)
typ549(UBound(typ549)) = Typ
EmitLdcCharIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Char)
Dim typ550 As Type() = {Typ}
EmitLdcCharIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ550))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ550).ReturnType
ReDim Preserve typ549(UBound(typ549) + 1)
typ549(UBound(typ549)) = Typ
EmitLdcCharIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ549))
Typ = Typ03.GetMethod("Emit", typ549).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcCharIL.Emit(OpCodes.Pop)
End If
EmitLdcCharIL.MarkSequencePoint(doc3, 1550, 1, 1550, 100)
EmitLdcCharIL.Emit(OpCodes.Ret)
Dim EmitLdnull As MethodBuilder = ILEmitter.DefineMethod("EmitLdnull", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitLdnullIL As ILGenerator = EmitLdnull.GetILGenerator()
EmitLdnullIL.MarkSequencePoint(doc3, 1553, 1, 1553, 100)
Dim locbldr142 As LocalBuilder = EmitLdnullIL.DeclareLocal(GetType(OpCode))
locbldr142.SetLocalSymInfo("op")
EmitLdnullIL.MarkSequencePoint(doc3, 1554, 1, 1554, 100)
Dim typ551(-1) As Type
EmitLdnullIL.Emit(OpCodes.Ldstr, "ldnull")
Typ = GetType(System.String)
ReDim Preserve typ551(UBound(typ551) + 1)
typ551(UBound(typ551)) = Typ
EmitLdnullIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ551))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ551).ReturnType
EmitLdnullIL.Emit(OpCodes.Stloc, 0)
EmitLdnullIL.MarkSequencePoint(doc3, 1555, 1, 1555, 100)
Dim typ552(-1) As Type
EmitLdnullIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdnullIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ552(UBound(typ552) + 1)
typ552(UBound(typ552)) = Typ
EmitLdnullIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ552))
Typ = Typ03.GetMethod("Emit", typ552).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdnullIL.Emit(OpCodes.Pop)
End If
EmitLdnullIL.MarkSequencePoint(doc3, 1556, 1, 1556, 100)
EmitLdnullIL.Emit(OpCodes.Ret)
Dim typ553(-1) As Type
ReDim Preserve typ553(UBound(typ553) + 1)
typ553(UBound(typ553)) = GetType(ConstructorInfo)
Dim EmitNewobj As MethodBuilder = ILEmitter.DefineMethod("EmitNewobj", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ553)
Dim EmitNewobjIL As ILGenerator = EmitNewobj.GetILGenerator()
Dim EmitNewobjparam01 As ParameterBuilder = EmitNewobj.DefineParameter(1, ParameterAttributes.None, "c")
EmitNewobjIL.MarkSequencePoint(doc3, 1559, 1, 1559, 100)
Dim locbldr143 As LocalBuilder = EmitNewobjIL.DeclareLocal(GetType(OpCode))
locbldr143.SetLocalSymInfo("op")
EmitNewobjIL.MarkSequencePoint(doc3, 1560, 1, 1560, 100)
Dim typ554(-1) As Type
EmitNewobjIL.Emit(OpCodes.Ldstr, "newobj")
Typ = GetType(System.String)
ReDim Preserve typ554(UBound(typ554) + 1)
typ554(UBound(typ554)) = Typ
EmitNewobjIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ554))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ554).ReturnType
EmitNewobjIL.Emit(OpCodes.Stloc, 0)
EmitNewobjIL.MarkSequencePoint(doc3, 1561, 1, 1561, 100)
Dim typ555(-1) As Type
EmitNewobjIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNewobjIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ555(UBound(typ555) + 1)
typ555(UBound(typ555)) = Typ
EmitNewobjIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ConstructorInfo)
ReDim Preserve typ555(UBound(typ555) + 1)
typ555(UBound(typ555)) = Typ
EmitNewobjIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ555))
Typ = Typ03.GetMethod("Emit", typ555).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNewobjIL.Emit(OpCodes.Pop)
End If
EmitNewobjIL.MarkSequencePoint(doc3, 1562, 1, 1562, 100)
EmitNewobjIL.Emit(OpCodes.Ret)
Dim typ556(-1) As Type
ReDim Preserve typ556(UBound(typ556) + 1)
typ556(UBound(typ556)) = GetType(Emit.Label)
Dim EmitBr As MethodBuilder = ILEmitter.DefineMethod("EmitBr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ556)
Dim EmitBrIL As ILGenerator = EmitBr.GetILGenerator()
Dim EmitBrparam01 As ParameterBuilder = EmitBr.DefineParameter(1, ParameterAttributes.None, "lbl")
EmitBrIL.MarkSequencePoint(doc3, 1565, 1, 1565, 100)
Dim locbldr144 As LocalBuilder = EmitBrIL.DeclareLocal(GetType(OpCode))
locbldr144.SetLocalSymInfo("op")
EmitBrIL.MarkSequencePoint(doc3, 1566, 1, 1566, 100)
Dim typ557(-1) As Type
EmitBrIL.Emit(OpCodes.Ldstr, "br")
Typ = GetType(System.String)
ReDim Preserve typ557(UBound(typ557) + 1)
typ557(UBound(typ557)) = Typ
EmitBrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ557))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ557).ReturnType
EmitBrIL.Emit(OpCodes.Stloc, 0)
EmitBrIL.MarkSequencePoint(doc3, 1567, 1, 1567, 100)
Dim typ558(-1) As Type
EmitBrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ558(UBound(typ558) + 1)
typ558(UBound(typ558)) = Typ
EmitBrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ558(UBound(typ558) + 1)
typ558(UBound(typ558)) = Typ
EmitBrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ558))
Typ = Typ03.GetMethod("Emit", typ558).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBrIL.Emit(OpCodes.Pop)
End If
EmitBrIL.MarkSequencePoint(doc3, 1568, 1, 1568, 100)
EmitBrIL.Emit(OpCodes.Ret)
Dim typ559(-1) As Type
ReDim Preserve typ559(UBound(typ559) + 1)
typ559(UBound(typ559)) = GetType(Emit.Label)
Dim EmitBrfalse As MethodBuilder = ILEmitter.DefineMethod("EmitBrfalse", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ559)
Dim EmitBrfalseIL As ILGenerator = EmitBrfalse.GetILGenerator()
Dim EmitBrfalseparam01 As ParameterBuilder = EmitBrfalse.DefineParameter(1, ParameterAttributes.None, "lbl")
EmitBrfalseIL.MarkSequencePoint(doc3, 1571, 1, 1571, 100)
Dim locbldr145 As LocalBuilder = EmitBrfalseIL.DeclareLocal(GetType(OpCode))
locbldr145.SetLocalSymInfo("op")
EmitBrfalseIL.MarkSequencePoint(doc3, 1572, 1, 1572, 100)
Dim typ560(-1) As Type
EmitBrfalseIL.Emit(OpCodes.Ldstr, "brfalse")
Typ = GetType(System.String)
ReDim Preserve typ560(UBound(typ560) + 1)
typ560(UBound(typ560)) = Typ
EmitBrfalseIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ560))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ560).ReturnType
EmitBrfalseIL.Emit(OpCodes.Stloc, 0)
EmitBrfalseIL.MarkSequencePoint(doc3, 1573, 1, 1573, 100)
Dim typ561(-1) As Type
EmitBrfalseIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBrfalseIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ561(UBound(typ561) + 1)
typ561(UBound(typ561)) = Typ
EmitBrfalseIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ561(UBound(typ561) + 1)
typ561(UBound(typ561)) = Typ
EmitBrfalseIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ561))
Typ = Typ03.GetMethod("Emit", typ561).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBrfalseIL.Emit(OpCodes.Pop)
End If
EmitBrfalseIL.MarkSequencePoint(doc3, 1574, 1, 1574, 100)
EmitBrfalseIL.Emit(OpCodes.Ret)
Dim typ562(-1) As Type
ReDim Preserve typ562(UBound(typ562) + 1)
typ562(UBound(typ562)) = GetType(Emit.Label)
Dim EmitBrtrue As MethodBuilder = ILEmitter.DefineMethod("EmitBrtrue", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ562)
Dim EmitBrtrueIL As ILGenerator = EmitBrtrue.GetILGenerator()
Dim EmitBrtrueparam01 As ParameterBuilder = EmitBrtrue.DefineParameter(1, ParameterAttributes.None, "lbl")
EmitBrtrueIL.MarkSequencePoint(doc3, 1577, 1, 1577, 100)
Dim locbldr146 As LocalBuilder = EmitBrtrueIL.DeclareLocal(GetType(OpCode))
locbldr146.SetLocalSymInfo("op")
EmitBrtrueIL.MarkSequencePoint(doc3, 1578, 1, 1578, 100)
Dim typ563(-1) As Type
EmitBrtrueIL.Emit(OpCodes.Ldstr, "brtrue")
Typ = GetType(System.String)
ReDim Preserve typ563(UBound(typ563) + 1)
typ563(UBound(typ563)) = Typ
EmitBrtrueIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ563))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ563).ReturnType
EmitBrtrueIL.Emit(OpCodes.Stloc, 0)
EmitBrtrueIL.MarkSequencePoint(doc3, 1579, 1, 1579, 100)
Dim typ564(-1) As Type
EmitBrtrueIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBrtrueIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ564(UBound(typ564) + 1)
typ564(UBound(typ564)) = Typ
EmitBrtrueIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ564(UBound(typ564) + 1)
typ564(UBound(typ564)) = Typ
EmitBrtrueIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ564))
Typ = Typ03.GetMethod("Emit", typ564).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBrtrueIL.Emit(OpCodes.Pop)
End If
EmitBrtrueIL.MarkSequencePoint(doc3, 1580, 1, 1580, 100)
EmitBrtrueIL.Emit(OpCodes.Ret)
Dim typ565(-1) As Type
ReDim Preserve typ565(UBound(typ565) + 1)
typ565(UBound(typ565)) = GetType(System.Type)
Dim EmitLdtoken As MethodBuilder = ILEmitter.DefineMethod("EmitLdtoken", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ565)
Dim EmitLdtokenIL As ILGenerator = EmitLdtoken.GetILGenerator()
Dim EmitLdtokenparam01 As ParameterBuilder = EmitLdtoken.DefineParameter(1, ParameterAttributes.None, "t")
EmitLdtokenIL.MarkSequencePoint(doc3, 1583, 1, 1583, 100)
Dim locbldr147 As LocalBuilder = EmitLdtokenIL.DeclareLocal(GetType(OpCode))
locbldr147.SetLocalSymInfo("op")
EmitLdtokenIL.MarkSequencePoint(doc3, 1584, 1, 1584, 100)
Dim typ566(-1) As Type
EmitLdtokenIL.Emit(OpCodes.Ldstr, "ldtoken")
Typ = GetType(System.String)
ReDim Preserve typ566(UBound(typ566) + 1)
typ566(UBound(typ566)) = Typ
EmitLdtokenIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ566))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ566).ReturnType
EmitLdtokenIL.Emit(OpCodes.Stloc, 0)
EmitLdtokenIL.MarkSequencePoint(doc3, 1585, 1, 1585, 100)
Dim typ567(-1) As Type
EmitLdtokenIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdtokenIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ567(UBound(typ567) + 1)
typ567(UBound(typ567)) = Typ
EmitLdtokenIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ567(UBound(typ567) + 1)
typ567(UBound(typ567)) = Typ
EmitLdtokenIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ567))
Typ = Typ03.GetMethod("Emit", typ567).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdtokenIL.Emit(OpCodes.Pop)
End If
EmitLdtokenIL.MarkSequencePoint(doc3, 1586, 1, 1586, 100)
EmitLdtokenIL.Emit(OpCodes.Ret)
Dim EmitConvU As MethodBuilder = ILEmitter.DefineMethod("EmitConvU", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitConvUIL As ILGenerator = EmitConvU.GetILGenerator()
EmitConvUIL.MarkSequencePoint(doc3, 1589, 1, 1589, 100)
Dim locbldr148 As LocalBuilder = EmitConvUIL.DeclareLocal(GetType(OpCode))
locbldr148.SetLocalSymInfo("op")
EmitConvUIL.MarkSequencePoint(doc3, 1590, 1, 1590, 100)
Dim typ568(-1) As Type
EmitConvUIL.Emit(OpCodes.Ldstr, "conv.u")
Typ = GetType(System.String)
ReDim Preserve typ568(UBound(typ568) + 1)
typ568(UBound(typ568)) = Typ
EmitConvUIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ568))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ568).ReturnType
EmitConvUIL.Emit(OpCodes.Stloc, 0)
EmitConvUIL.MarkSequencePoint(doc3, 1591, 1, 1591, 100)
Dim typ569(-1) As Type
EmitConvUIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConvUIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ569(UBound(typ569) + 1)
typ569(UBound(typ569)) = Typ
EmitConvUIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ569))
Typ = Typ03.GetMethod("Emit", typ569).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConvUIL.Emit(OpCodes.Pop)
End If
EmitConvUIL.MarkSequencePoint(doc3, 1592, 1, 1592, 100)
EmitConvUIL.Emit(OpCodes.Ret)
Dim EmitConvI As MethodBuilder = ILEmitter.DefineMethod("EmitConvI", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitConvIIL As ILGenerator = EmitConvI.GetILGenerator()
EmitConvIIL.MarkSequencePoint(doc3, 1595, 1, 1595, 100)
Dim locbldr149 As LocalBuilder = EmitConvIIL.DeclareLocal(GetType(OpCode))
locbldr149.SetLocalSymInfo("op")
EmitConvIIL.MarkSequencePoint(doc3, 1596, 1, 1596, 100)
Dim typ570(-1) As Type
EmitConvIIL.Emit(OpCodes.Ldstr, "conv.i")
Typ = GetType(System.String)
ReDim Preserve typ570(UBound(typ570) + 1)
typ570(UBound(typ570)) = Typ
EmitConvIIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ570))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ570).ReturnType
EmitConvIIL.Emit(OpCodes.Stloc, 0)
EmitConvIIL.MarkSequencePoint(doc3, 1597, 1, 1597, 100)
Dim typ571(-1) As Type
EmitConvIIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConvIIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ571(UBound(typ571) + 1)
typ571(UBound(typ571)) = Typ
EmitConvIIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ571))
Typ = Typ03.GetMethod("Emit", typ571).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConvIIL.Emit(OpCodes.Pop)
End If
EmitConvIIL.MarkSequencePoint(doc3, 1598, 1, 1598, 100)
EmitConvIIL.Emit(OpCodes.Ret)
Dim EmitConvI4 As MethodBuilder = ILEmitter.DefineMethod("EmitConvI4", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitConvI4IL As ILGenerator = EmitConvI4.GetILGenerator()
EmitConvI4IL.MarkSequencePoint(doc3, 1601, 1, 1601, 100)
Dim locbldr150 As LocalBuilder = EmitConvI4IL.DeclareLocal(GetType(OpCode))
locbldr150.SetLocalSymInfo("op")
EmitConvI4IL.MarkSequencePoint(doc3, 1602, 1, 1602, 100)
Dim typ572(-1) As Type
EmitConvI4IL.Emit(OpCodes.Ldstr, "conv.i4")
Typ = GetType(System.String)
ReDim Preserve typ572(UBound(typ572) + 1)
typ572(UBound(typ572)) = Typ
EmitConvI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ572))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ572).ReturnType
EmitConvI4IL.Emit(OpCodes.Stloc, 0)
EmitConvI4IL.MarkSequencePoint(doc3, 1603, 1, 1603, 100)
Dim typ573(-1) As Type
EmitConvI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConvI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ573(UBound(typ573) + 1)
typ573(UBound(typ573)) = Typ
EmitConvI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ573))
Typ = Typ03.GetMethod("Emit", typ573).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConvI4IL.Emit(OpCodes.Pop)
End If
EmitConvI4IL.MarkSequencePoint(doc3, 1604, 1, 1604, 100)
EmitConvI4IL.Emit(OpCodes.Ret)
Dim typ574(-1) As Type
ReDim Preserve typ574(UBound(typ574) + 1)
typ574(UBound(typ574)) = GetType(System.Type)
Dim EmitNewarr As MethodBuilder = ILEmitter.DefineMethod("EmitNewarr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ574)
Dim EmitNewarrIL As ILGenerator = EmitNewarr.GetILGenerator()
Dim EmitNewarrparam01 As ParameterBuilder = EmitNewarr.DefineParameter(1, ParameterAttributes.None, "t")
EmitNewarrIL.MarkSequencePoint(doc3, 1607, 1, 1607, 100)
Dim locbldr151 As LocalBuilder = EmitNewarrIL.DeclareLocal(GetType(OpCode))
locbldr151.SetLocalSymInfo("op")
EmitNewarrIL.MarkSequencePoint(doc3, 1608, 1, 1608, 100)
Dim typ575(-1) As Type
EmitNewarrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNewarrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ575(UBound(typ575) + 1)
typ575(UBound(typ575)) = Typ
EmitNewarrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ575))
Typ = Typ03.GetMethod("Emit", typ575).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNewarrIL.Emit(OpCodes.Pop)
End If
EmitNewarrIL.MarkSequencePoint(doc3, 1609, 1, 1609, 100)
Dim typ576(-1) As Type
EmitNewarrIL.Emit(OpCodes.Ldstr, "newarr")
Typ = GetType(System.String)
ReDim Preserve typ576(UBound(typ576) + 1)
typ576(UBound(typ576)) = Typ
EmitNewarrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ576))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ576).ReturnType
EmitNewarrIL.Emit(OpCodes.Stloc, 0)
EmitNewarrIL.MarkSequencePoint(doc3, 1610, 1, 1610, 100)
Dim typ577(-1) As Type
EmitNewarrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNewarrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ577(UBound(typ577) + 1)
typ577(UBound(typ577)) = Typ
EmitNewarrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ577(UBound(typ577) + 1)
typ577(UBound(typ577)) = Typ
EmitNewarrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ577))
Typ = Typ03.GetMethod("Emit", typ577).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNewarrIL.Emit(OpCodes.Pop)
End If
EmitNewarrIL.MarkSequencePoint(doc3, 1611, 1, 1611, 100)
EmitNewarrIL.Emit(OpCodes.Ret)
Dim typ578(-1) As Type
ReDim Preserve typ578(UBound(typ578) + 1)
typ578(UBound(typ578)) = GetType(System.String)
ReDim Preserve typ578(UBound(typ578) + 1)
typ578(UBound(typ578)) = GetType(System.Type)
Dim DeclVar As MethodBuilder = ILEmitter.DefineMethod("DeclVar", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ578)
Dim DeclVarIL As ILGenerator = DeclVar.GetILGenerator()
Dim DeclVarparam01 As ParameterBuilder = DeclVar.DefineParameter(1, ParameterAttributes.None, "name")
Dim DeclVarparam02 As ParameterBuilder = DeclVar.DefineParameter(2, ParameterAttributes.None, "typ")
DeclVarIL.MarkSequencePoint(doc3, 1615, 1, 1615, 100)
Dim locbldr152 As LocalBuilder = DeclVarIL.DeclareLocal(GetType(LocalBuilder))
locbldr152.SetLocalSymInfo("lb")
Dim typ579(-1) As Type
DeclVarIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
DeclVarIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Type)
ReDim Preserve typ579(UBound(typ579) + 1)
typ579(UBound(typ579)) = Typ
DeclVarIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("DeclareLocal", typ579))
Typ = Typ03.GetMethod("DeclareLocal", typ579).ReturnType
DeclVarIL.Emit(OpCodes.Stloc, 0)
DeclVarIL.MarkSequencePoint(doc3, 1616, 1, 1616, 100)
DeclVarIL.Emit(OpCodes.Ldsfld, DebugFlg)
Typ = DebugFlg.FieldType
DeclVarIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa287 As System.Reflection.Emit.Label = DeclVarIL.DefineLabel()
Dim tru287 As System.Reflection.Emit.Label = DeclVarIL.DefineLabel()
Dim cont287 As System.Reflection.Emit.Label = DeclVarIL.DefineLabel()
DeclVarIL.Emit(OpCodes.Beq, tru287)
DeclVarIL.Emit(OpCodes.Br, fa287)
DeclVarIL.MarkLabel(tru287)
DeclVarIL.MarkSequencePoint(doc3, 1617, 1, 1617, 100)
Dim typ580(-1) As Type
DeclVarIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(LocalBuilder)
Typ03 = Typ
DeclVarIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ580(UBound(typ580) + 1)
typ580(UBound(typ580)) = Typ
DeclVarIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("SetLocalSymInfo", typ580))
Typ = Typ03.GetMethod("SetLocalSymInfo", typ580).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DeclVarIL.Emit(OpCodes.Pop)
End If
DeclVarIL.MarkSequencePoint(doc3, 1618, 1, 1618, 100)
DeclVarIL.Emit(OpCodes.Br, cont287)
DeclVarIL.MarkLabel(fa287)
DeclVarIL.Emit(OpCodes.Br, cont287)
DeclVarIL.MarkLabel(cont287)
DeclVarIL.MarkSequencePoint(doc3, 1619, 1, 1619, 100)
DeclVarIL.Emit(OpCodes.Ret)
Dim DefineLbl As MethodBuilder = ILEmitter.DefineMethod("DefineLbl", MethodAttributes.Public Or MethodAttributes.Static, GetType(Emit.Label), Type.EmptyTypes)
Dim DefineLblIL As ILGenerator = DefineLbl.GetILGenerator()
DefineLblIL.MarkSequencePoint(doc3, 1622, 1, 1622, 100)
DefineLblIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
DefineLblIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("DefineLabel", Type.EmptyTypes))
Typ = Typ03.GetMethod("DefineLabel", Type.EmptyTypes).ReturnType
DefineLblIL.MarkSequencePoint(doc3, 1623, 1, 1623, 100)
DefineLblIL.Emit(OpCodes.Ret)
Dim typ582(-1) As Type
ReDim Preserve typ582(UBound(typ582) + 1)
typ582(UBound(typ582)) = GetType(Emit.Label)
Dim MarkLbl As MethodBuilder = ILEmitter.DefineMethod("MarkLbl", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ582)
Dim MarkLblIL As ILGenerator = MarkLbl.GetILGenerator()
Dim MarkLblparam01 As ParameterBuilder = MarkLbl.DefineParameter(1, ParameterAttributes.None, "lbl")
MarkLblIL.MarkSequencePoint(doc3, 1626, 1, 1626, 100)
Dim typ583(-1) As Type
MarkLblIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
MarkLblIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ583(UBound(typ583) + 1)
typ583(UBound(typ583)) = Typ
MarkLblIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MarkLabel", typ583))
Typ = Typ03.GetMethod("MarkLabel", typ583).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
MarkLblIL.Emit(OpCodes.Pop)
End If
MarkLblIL.MarkSequencePoint(doc3, 1627, 1, 1627, 100)
MarkLblIL.Emit(OpCodes.Ret)
Dim typ584(-1) As Type
ReDim Preserve typ584(UBound(typ584) + 1)
typ584(UBound(typ584)) = GetType(System.Int32)
Dim MarkDbgPt As MethodBuilder = ILEmitter.DefineMethod("MarkDbgPt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ584)
Dim MarkDbgPtIL As ILGenerator = MarkDbgPt.GetILGenerator()
Dim MarkDbgPtparam01 As ParameterBuilder = MarkDbgPt.DefineParameter(1, ParameterAttributes.None, "line")
MarkDbgPtIL.MarkSequencePoint(doc3, 1630, 1, 1630, 100)
Dim typ585(-1) As Type
MarkDbgPtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
MarkDbgPtIL.Emit(OpCodes.Ldsfld, DocWriter)
Typ = DocWriter.FieldType
ReDim Preserve typ585(UBound(typ585) + 1)
typ585(UBound(typ585)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ585(UBound(typ585) + 1)
typ585(UBound(typ585)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ585(UBound(typ585) + 1)
typ585(UBound(typ585)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ585(UBound(typ585) + 1)
typ585(UBound(typ585)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldc_I4, CInt(100))
Typ = GetType(System.Int32)
ReDim Preserve typ585(UBound(typ585) + 1)
typ585(UBound(typ585)) = Typ
MarkDbgPtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MarkSequencePoint", typ585))
Typ = Typ03.GetMethod("MarkSequencePoint", typ585).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
MarkDbgPtIL.Emit(OpCodes.Pop)
End If
MarkDbgPtIL.MarkSequencePoint(doc3, 1631, 1, 1631, 100)
MarkDbgPtIL.Emit(OpCodes.Ret)
ILEmitter.CreateType()
End Sub


Dim doc4 As ISymbolDocumentWriter

Sub AsmFactory()
Dim AsmFactory As TypeBuilder = mdl.DefineType("dylan.NET.Reflection" & "." & "AsmFactory", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass Or TypeAttributes.BeforeFieldInit, GetType(System.Object))
Dim DebugFlg As FieldBuilder = AsmFactory.DefineField("DebugFlg", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim InMethodFlg As FieldBuilder = AsmFactory.DefineField("InMethodFlg", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim ChainFlg As FieldBuilder = AsmFactory.DefineField("ChainFlg", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim PopFlg As FieldBuilder = AsmFactory.DefineField("PopFlg", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim AddrFlg As FieldBuilder = AsmFactory.DefineField("AddrFlg", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim AsmNameStr As FieldBuilder = AsmFactory.DefineField("AsmNameStr", GetType(AssemblyName), FieldAttributes.Public Or FieldAttributes.Static)
Dim AsmB As FieldBuilder = AsmFactory.DefineField("AsmB", GetType(AssemblyBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim Type01 As FieldBuilder = AsmFactory.DefineField("Type01", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim Type02 As FieldBuilder = AsmFactory.DefineField("Type02", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim Type03 As FieldBuilder = AsmFactory.DefineField("Type03", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim Type04 As FieldBuilder = AsmFactory.DefineField("Type04", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim Type05 As FieldBuilder = AsmFactory.DefineField("Type05", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim MdlB As FieldBuilder = AsmFactory.DefineField("MdlB", GetType(ModuleBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim DocWriter As FieldBuilder = AsmFactory.DefineField("DocWriter", GetType(ISymbolDocumentWriter), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnNS As FieldBuilder = AsmFactory.DefineField("CurnNS", GetType(System.String), FieldAttributes.Public Or FieldAttributes.Static)
Dim DfltNS As FieldBuilder = AsmFactory.DefineField("DfltNS", GetType(System.String), FieldAttributes.Public Or FieldAttributes.Static)
Dim AsmMode As FieldBuilder = AsmFactory.DefineField("AsmMode", GetType(System.String), FieldAttributes.Public Or FieldAttributes.Static)
Dim AsmFile As FieldBuilder = AsmFactory.DefineField("AsmFile", GetType(System.String), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnTypName As FieldBuilder = AsmFactory.DefineField("CurnTypName", GetType(System.String), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnMetName As FieldBuilder = AsmFactory.DefineField("CurnMetName", GetType(System.String), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnMetB As FieldBuilder = AsmFactory.DefineField("CurnMetB", GetType(MethodBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnConB As FieldBuilder = AsmFactory.DefineField("CurnConB", GetType(ConstructorBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnFldB As FieldBuilder = AsmFactory.DefineField("CurnFldB", GetType(FieldBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnILGen As FieldBuilder = AsmFactory.DefineField("CurnILGen", GetType(ILGenerator), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnInhTyp As FieldBuilder = AsmFactory.DefineField("CurnInhTyp", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnTypB As FieldBuilder = AsmFactory.DefineField("CurnTypB", GetType(TypeBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnTypB2 As FieldBuilder = AsmFactory.DefineField("CurnTypB2", GetType(TypeBuilder), FieldAttributes.Public Or FieldAttributes.Static)
Dim CurnTypList As FieldBuilder = AsmFactory.DefineField("CurnTypList", GetType(TypeBuilder).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim isNested As FieldBuilder = AsmFactory.DefineField("isNested", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim inClass As FieldBuilder = AsmFactory.DefineField("inClass", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim TypArr As FieldBuilder = AsmFactory.DefineField("TypArr", GetType(System.Type).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim GenParamNames As FieldBuilder = AsmFactory.DefineField("GenParamNames", GetType(System.String).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim GenParamTyps As FieldBuilder = AsmFactory.DefineField("GenParamTyps", GetType(GenericTypeParameterBuilder).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim ctor0 As ConstructorBuilder = AsmFactory.DefineConstructor(MethodAttributes.Public Or MethodAttributes.Static,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
ctor0IL.MarkSequencePoint(doc4, 46, 1, 46, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, DebugFlg)
ctor0IL.MarkSequencePoint(doc4, 47, 1, 47, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, ChainFlg)
ctor0IL.MarkSequencePoint(doc4, 48, 1, 48, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, PopFlg)
ctor0IL.MarkSequencePoint(doc4, 49, 1, 49, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, AddrFlg)
ctor0IL.MarkSequencePoint(doc4, 50, 1, 50, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, InMethodFlg)
ctor0IL.MarkSequencePoint(doc4, 51, 1, 51, 100)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stsfld, CurnNS)
ctor0IL.MarkSequencePoint(doc4, 52, 1, 52, 100)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stsfld, DfltNS)
ctor0IL.MarkSequencePoint(doc4, 53, 1, 53, 100)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stsfld, AsmMode)
ctor0IL.MarkSequencePoint(doc4, 54, 1, 54, 100)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stsfld, AsmFile)
ctor0IL.MarkSequencePoint(doc4, 55, 1, 55, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(TypeBuilder))
ctor0IL.Emit(OpCodes.Stsfld, CurnTypList)
ctor0IL.MarkSequencePoint(doc4, 56, 1, 56, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(System.Type))
ctor0IL.Emit(OpCodes.Stsfld, TypArr)
ctor0IL.MarkSequencePoint(doc4, 57, 1, 57, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(System.String))
ctor0IL.Emit(OpCodes.Stsfld, GenParamNames)
ctor0IL.MarkSequencePoint(doc4, 58, 1, 58, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(System.Type))
ctor0IL.Emit(OpCodes.Stsfld, GenParamTyps)
ctor0IL.MarkSequencePoint(doc4, 59, 1, 59, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, isNested)
ctor0IL.MarkSequencePoint(doc4, 60, 1, 60, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, inClass)
ctor0IL.MarkSequencePoint(doc4, 61, 1, 61, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim CreateTyp As MethodBuilder = AsmFactory.DefineMethod("CreateTyp", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim CreateTypIL As ILGenerator = CreateTyp.GetILGenerator()
CreateTypIL.MarkSequencePoint(doc4, 64, 1, 64, 100)
CreateTypIL.Emit(OpCodes.Ldsfld, CurnTypB)
Typ = CurnTypB.FieldType
Typ03 = Typ
CreateTypIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("CreateType", Type.EmptyTypes))
Typ = Typ03.GetMethod("CreateType", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateTypIL.Emit(OpCodes.Pop)
End If
CreateTypIL.MarkSequencePoint(doc4, 65, 1, 65, 100)
CreateTypIL.Emit(OpCodes.Ret)
Dim InitMtd As MethodBuilder = AsmFactory.DefineMethod("InitMtd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim InitMtdIL As ILGenerator = InitMtd.GetILGenerator()
InitMtdIL.MarkSequencePoint(doc4, 68, 1, 68, 100)
Dim locbldr153 As LocalBuilder = InitMtdIL.DeclareLocal(GetType(ParameterAttributes))
locbldr153.SetLocalSymInfo("rv")
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
InitMtdIL.Emit(OpCodes.Stloc, 0)
InitMtdIL.MarkSequencePoint(doc4, 69, 1, 69, 100)
Dim typ1(-1) As Type
InitMtdIL.Emit(OpCodes.Ldsfld, CurnMetB)
Typ = CurnMetB.FieldType
Typ03 = Typ
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
InitMtdIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(ParameterAttributes)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
InitMtdIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
InitMtdIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("DefineParameter", typ1))
Typ = Typ03.GetMethod("DefineParameter", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
InitMtdIL.Emit(OpCodes.Pop)
End If
InitMtdIL.MarkSequencePoint(doc4, 70, 1, 70, 100)
InitMtdIL.Emit(OpCodes.Ldsfld, CurnMetB)
Typ = CurnMetB.FieldType
Typ03 = Typ
InitMtdIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetILGenerator", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetILGenerator", Type.EmptyTypes).ReturnType
InitMtdIL.Emit(OpCodes.Stsfld, CurnILGen)
InitMtdIL.MarkSequencePoint(doc4, 71, 1, 71, 100)
InitMtdIL.Emit(OpCodes.Ldsfld, CurnMetB)
Typ = CurnMetB.FieldType
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("Met"))
InitMtdIL.MarkSequencePoint(doc4, 72, 1, 72, 100)
InitMtdIL.Emit(OpCodes.Ldsfld, CurnILGen)
Typ = CurnILGen.FieldType
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ILGen"))
InitMtdIL.MarkSequencePoint(doc4, 73, 1, 73, 100)
InitMtdIL.Emit(OpCodes.Ldsfld, DebugFlg)
Typ = DebugFlg.FieldType
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("DebugFlg"))
InitMtdIL.MarkSequencePoint(doc4, 74, 1, 74, 100)
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("LocInd"))
InitMtdIL.MarkSequencePoint(doc4, 75, 1, 75, 100)
InitMtdIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg"))
Typ = asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg").FieldType
InitMtdIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa288 As System.Reflection.Emit.Label = InitMtdIL.DefineLabel()
Dim tru288 As System.Reflection.Emit.Label = InitMtdIL.DefineLabel()
Dim cont288 As System.Reflection.Emit.Label = InitMtdIL.DefineLabel()
InitMtdIL.Emit(OpCodes.Beq, tru288)
InitMtdIL.Emit(OpCodes.Br, fa288)
InitMtdIL.MarkLabel(tru288)
InitMtdIL.MarkSequencePoint(doc4, 76, 1, 76, 100)
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitMtdIL.MarkSequencePoint(doc4, 77, 1, 77, 100)
InitMtdIL.Emit(OpCodes.Br, cont288)
InitMtdIL.MarkLabel(fa288)
InitMtdIL.MarkSequencePoint(doc4, 78, 1, 78, 100)
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitMtdIL.MarkSequencePoint(doc4, 79, 1, 79, 100)
InitMtdIL.Emit(OpCodes.Br, cont288)
InitMtdIL.MarkLabel(cont288)
InitMtdIL.MarkSequencePoint(doc4, 80, 1, 80, 100)
InitMtdIL.Emit(OpCodes.Ret)
Dim InitConstr As MethodBuilder = AsmFactory.DefineMethod("InitConstr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim InitConstrIL As ILGenerator = InitConstr.GetILGenerator()
InitConstrIL.MarkSequencePoint(doc4, 83, 1, 83, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, CurnConB)
Typ = CurnConB.FieldType
Typ03 = Typ
InitConstrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetILGenerator", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetILGenerator", Type.EmptyTypes).ReturnType
InitConstrIL.Emit(OpCodes.Stsfld, CurnILGen)
InitConstrIL.MarkSequencePoint(doc4, 84, 1, 84, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, CurnConB)
Typ = CurnConB.FieldType
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("Constr"))
InitConstrIL.MarkSequencePoint(doc4, 85, 1, 85, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, CurnILGen)
Typ = CurnILGen.FieldType
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ILGen"))
InitConstrIL.MarkSequencePoint(doc4, 86, 1, 86, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, DebugFlg)
Typ = DebugFlg.FieldType
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("DebugFlg"))
InitConstrIL.MarkSequencePoint(doc4, 87, 1, 87, 100)
InitConstrIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("LocInd"))
InitConstrIL.MarkSequencePoint(doc4, 88, 1, 88, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg"))
Typ = asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg").FieldType
InitConstrIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa289 As System.Reflection.Emit.Label = InitConstrIL.DefineLabel()
Dim tru289 As System.Reflection.Emit.Label = InitConstrIL.DefineLabel()
Dim cont289 As System.Reflection.Emit.Label = InitConstrIL.DefineLabel()
InitConstrIL.Emit(OpCodes.Beq, tru289)
InitConstrIL.Emit(OpCodes.Br, fa289)
InitConstrIL.MarkLabel(tru289)
InitConstrIL.MarkSequencePoint(doc4, 89, 1, 89, 100)
InitConstrIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitConstrIL.MarkSequencePoint(doc4, 90, 1, 90, 100)
InitConstrIL.Emit(OpCodes.Br, cont289)
InitConstrIL.MarkLabel(fa289)
InitConstrIL.MarkSequencePoint(doc4, 91, 1, 91, 100)
InitConstrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitConstrIL.MarkSequencePoint(doc4, 92, 1, 92, 100)
InitConstrIL.Emit(OpCodes.Br, cont289)
InitConstrIL.MarkLabel(cont289)
InitConstrIL.MarkSequencePoint(doc4, 93, 1, 93, 100)
InitConstrIL.Emit(OpCodes.Ret)
Dim InitDelConstr As MethodBuilder = AsmFactory.DefineMethod("InitDelConstr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim InitDelConstrIL As ILGenerator = InitDelConstr.GetILGenerator()
InitDelConstrIL.MarkSequencePoint(doc4, 96, 1, 96, 100)
Dim locbldr154 As LocalBuilder = InitDelConstrIL.DeclareLocal(GetType(ParameterAttributes))
locbldr154.SetLocalSymInfo("non")
InitDelConstrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
InitDelConstrIL.Emit(OpCodes.Stloc, 0)
InitDelConstrIL.MarkSequencePoint(doc4, 97, 1, 97, 100)
Dim typ4(-1) As Type
InitDelConstrIL.Emit(OpCodes.Ldsfld, CurnConB)
Typ = CurnConB.FieldType
Typ03 = Typ
InitDelConstrIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
InitDelConstrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(ParameterAttributes)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
InitDelConstrIL.Emit(OpCodes.Ldstr, "obj")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
InitDelConstrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("DefineParameter", typ4))
Typ = Typ03.GetMethod("DefineParameter", typ4).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
InitDelConstrIL.Emit(OpCodes.Pop)
End If
InitDelConstrIL.MarkSequencePoint(doc4, 98, 1, 98, 100)
Dim typ5(-1) As Type
InitDelConstrIL.Emit(OpCodes.Ldsfld, CurnConB)
Typ = CurnConB.FieldType
Typ03 = Typ
InitDelConstrIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
InitDelConstrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(ParameterAttributes)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
InitDelConstrIL.Emit(OpCodes.Ldstr, "ptr")
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
InitDelConstrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("DefineParameter", typ5))
Typ = Typ03.GetMethod("DefineParameter", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
InitDelConstrIL.Emit(OpCodes.Pop)
End If
InitDelConstrIL.MarkSequencePoint(doc4, 99, 1, 99, 100)
Dim locbldr155 As LocalBuilder = InitDelConstrIL.DeclareLocal(GetType(MethodImplAttributes))
locbldr155.SetLocalSymInfo("ruman")
InitDelConstrIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
InitDelConstrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
InitDelConstrIL.Emit(OpCodes.Or)
InitDelConstrIL.Emit(OpCodes.Stloc, 1)
InitDelConstrIL.MarkSequencePoint(doc4, 100, 1, 100, 100)
Dim typ6(-1) As Type
InitDelConstrIL.Emit(OpCodes.Ldsfld, CurnConB)
Typ = CurnConB.FieldType
Typ03 = Typ
InitDelConstrIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(MethodImplAttributes)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
InitDelConstrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("SetImplementationFlags", typ6))
Typ = Typ03.GetMethod("SetImplementationFlags", typ6).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
InitDelConstrIL.Emit(OpCodes.Pop)
End If
InitDelConstrIL.MarkSequencePoint(doc4, 101, 1, 101, 100)
InitDelConstrIL.Emit(OpCodes.Ret)
Dim InitDelMet As MethodBuilder = AsmFactory.DefineMethod("InitDelMet", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim InitDelMetIL As ILGenerator = InitDelMet.GetILGenerator()
InitDelMetIL.MarkSequencePoint(doc4, 104, 1, 104, 100)
InitDelMetIL.Emit(OpCodes.Ldsfld, CurnMetB)
Typ = CurnMetB.FieldType
InitDelMetIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("Met"))
InitDelMetIL.MarkSequencePoint(doc4, 105, 1, 105, 100)
Dim locbldr156 As LocalBuilder = InitDelMetIL.DeclareLocal(GetType(MethodImplAttributes))
locbldr156.SetLocalSymInfo("ruman")
InitDelMetIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
InitDelMetIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
InitDelMetIL.Emit(OpCodes.Or)
InitDelMetIL.Emit(OpCodes.Stloc, 0)
InitDelMetIL.MarkSequencePoint(doc4, 106, 1, 106, 100)
Dim typ7(-1) As Type
InitDelMetIL.Emit(OpCodes.Ldsfld, CurnMetB)
Typ = CurnMetB.FieldType
Typ03 = Typ
InitDelMetIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(MethodImplAttributes)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
InitDelMetIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("SetImplementationFlags", typ7))
Typ = Typ03.GetMethod("SetImplementationFlags", typ7).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
InitDelMetIL.Emit(OpCodes.Pop)
End If
InitDelMetIL.MarkSequencePoint(doc4, 107, 1, 107, 100)
InitDelMetIL.Emit(OpCodes.Ret)
Dim typ8(-1) As Type
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = GetType(TypeBuilder)
Dim AddTypB As MethodBuilder = AsmFactory.DefineMethod("AddTypB", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ8)
Dim AddTypBIL As ILGenerator = AddTypB.GetILGenerator()
Dim AddTypBparam01 As ParameterBuilder = AddTypB.DefineParameter(1, ParameterAttributes.None, "typ")
AddTypBIL.MarkSequencePoint(doc4, 111, 1, 111, 100)
Dim locbldr157 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr157.SetLocalSymInfo("len")
AddTypBIL.Emit(OpCodes.Ldsfld, CurnTypList)
Typ = CurnTypList.FieldType
AddTypBIL.Emit(OpCodes.Ldlen)
AddTypBIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Stloc, 0)
AddTypBIL.MarkSequencePoint(doc4, 112, 1, 112, 100)
Dim locbldr158 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr158.SetLocalSymInfo("destl")
AddTypBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Add)
AddTypBIL.Emit(OpCodes.Stloc, 1)
AddTypBIL.MarkSequencePoint(doc4, 113, 1, 113, 100)
Dim locbldr159 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr159.SetLocalSymInfo("stopel")
AddTypBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Sub)
AddTypBIL.Emit(OpCodes.Stloc, 2)
AddTypBIL.MarkSequencePoint(doc4, 114, 1, 114, 100)
Dim locbldr160 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr160.SetLocalSymInfo("i")
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Stloc, 3)
AddTypBIL.MarkSequencePoint(doc4, 116, 1, 116, 100)
Dim locbldr161 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(TypeBuilder).MakeArrayType())
locbldr161.SetLocalSymInfo("destarr")
AddTypBIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Conv_U)
AddTypBIL.Emit(OpCodes.Newarr, GetType(TypeBuilder))
AddTypBIL.Emit(OpCodes.Stloc, 4)
AddTypBIL.MarkSequencePoint(doc4, 118, 1, 118, 100)
Dim label0 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.MarkSequencePoint(doc4, 119, 1, 119, 100)
Dim label1 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.MarkSequencePoint(doc4, 121, 1, 121, 100)
AddTypBIL.MarkLabel(label0)
AddTypBIL.MarkSequencePoint(doc4, 123, 1, 123, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Add)
AddTypBIL.Emit(OpCodes.Stloc, 3)
AddTypBIL.MarkSequencePoint(doc4, 125, 1, 125, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa290 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim tru290 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim cont290 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.Emit(OpCodes.Bgt, tru290)
AddTypBIL.Emit(OpCodes.Br, fa290)
AddTypBIL.MarkLabel(tru290)
AddTypBIL.MarkSequencePoint(doc4, 127, 1, 127, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(TypeBuilder).MakeArrayType()
Typ02 = Typ
AddTypBIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddTypBIL.Emit(OpCodes.Ldsfld, CurnTypList)
Typ = CurnTypList.FieldType
Typ02 = Typ
AddTypBIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddTypBIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
AddTypBIL.Emit(OpCodes.Stelem, GetType(TypeBuilder).MakeArrayType().GetElementType())
AddTypBIL.MarkSequencePoint(doc4, 129, 1, 129, 100)
AddTypBIL.Emit(OpCodes.Br, cont290)
AddTypBIL.MarkLabel(fa290)
AddTypBIL.Emit(OpCodes.Br, cont290)
AddTypBIL.MarkLabel(cont290)
AddTypBIL.MarkSequencePoint(doc4, 131, 1, 131, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa291 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim tru291 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim cont291 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.Emit(OpCodes.Beq, tru291)
AddTypBIL.Emit(OpCodes.Br, fa291)
AddTypBIL.MarkLabel(tru291)
AddTypBIL.MarkSequencePoint(doc4, 132, 1, 132, 100)
AddTypBIL.Emit(OpCodes.Br, label1)
AddTypBIL.MarkSequencePoint(doc4, 133, 1, 133, 100)
AddTypBIL.Emit(OpCodes.Br, cont291)
AddTypBIL.MarkLabel(fa291)
AddTypBIL.MarkSequencePoint(doc4, 134, 1, 134, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa292 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim tru292 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim cont292 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.Emit(OpCodes.Beq, fa292)
AddTypBIL.Emit(OpCodes.Br, tru292)
AddTypBIL.MarkLabel(tru292)
AddTypBIL.MarkSequencePoint(doc4, 135, 1, 135, 100)
AddTypBIL.Emit(OpCodes.Br, label0)
AddTypBIL.MarkSequencePoint(doc4, 136, 1, 136, 100)
AddTypBIL.Emit(OpCodes.Br, cont292)
AddTypBIL.MarkLabel(fa292)
AddTypBIL.MarkSequencePoint(doc4, 137, 1, 137, 100)
AddTypBIL.Emit(OpCodes.Br, label1)
AddTypBIL.MarkSequencePoint(doc4, 138, 1, 138, 100)
AddTypBIL.Emit(OpCodes.Br, cont292)
AddTypBIL.MarkLabel(cont292)
AddTypBIL.MarkSequencePoint(doc4, 139, 1, 139, 100)
AddTypBIL.Emit(OpCodes.Br, cont291)
AddTypBIL.MarkLabel(cont291)
AddTypBIL.MarkSequencePoint(doc4, 141, 1, 141, 100)
AddTypBIL.MarkLabel(label1)
AddTypBIL.MarkSequencePoint(doc4, 143, 1, 143, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(TypeBuilder).MakeArrayType()
Typ02 = Typ
AddTypBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddTypBIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(TypeBuilder)
AddTypBIL.Emit(OpCodes.Stelem, GetType(TypeBuilder).MakeArrayType().GetElementType())
AddTypBIL.MarkSequencePoint(doc4, 145, 1, 145, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(TypeBuilder).MakeArrayType()
AddTypBIL.Emit(OpCodes.Stsfld, CurnTypList)
AddTypBIL.MarkSequencePoint(doc4, 147, 1, 147, 100)
AddTypBIL.Emit(OpCodes.Ret)
Dim typ9(-1) As Type
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = GetType(System.Type)
Dim AddTyp As MethodBuilder = AsmFactory.DefineMethod("AddTyp", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ9)
Dim AddTypIL As ILGenerator = AddTyp.GetILGenerator()
Dim AddTypparam01 As ParameterBuilder = AddTyp.DefineParameter(1, ParameterAttributes.None, "typ")
AddTypIL.MarkSequencePoint(doc4, 151, 1, 151, 100)
Dim locbldr162 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr162.SetLocalSymInfo("len")
AddTypIL.Emit(OpCodes.Ldsfld, TypArr)
Typ = TypArr.FieldType
AddTypIL.Emit(OpCodes.Ldlen)
AddTypIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Stloc, 0)
AddTypIL.MarkSequencePoint(doc4, 152, 1, 152, 100)
Dim locbldr163 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr163.SetLocalSymInfo("destl")
AddTypIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Add)
AddTypIL.Emit(OpCodes.Stloc, 1)
AddTypIL.MarkSequencePoint(doc4, 153, 1, 153, 100)
Dim locbldr164 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr164.SetLocalSymInfo("stopel")
AddTypIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Sub)
AddTypIL.Emit(OpCodes.Stloc, 2)
AddTypIL.MarkSequencePoint(doc4, 154, 1, 154, 100)
Dim locbldr165 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr165.SetLocalSymInfo("i")
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Stloc, 3)
AddTypIL.MarkSequencePoint(doc4, 156, 1, 156, 100)
Dim locbldr166 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr166.SetLocalSymInfo("destarr")
AddTypIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Conv_U)
AddTypIL.Emit(OpCodes.Newarr, GetType(System.Type))
AddTypIL.Emit(OpCodes.Stloc, 4)
AddTypIL.MarkSequencePoint(doc4, 158, 1, 158, 100)
Dim label2 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.MarkSequencePoint(doc4, 159, 1, 159, 100)
Dim label3 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.MarkSequencePoint(doc4, 161, 1, 161, 100)
AddTypIL.MarkLabel(label2)
AddTypIL.MarkSequencePoint(doc4, 163, 1, 163, 100)
AddTypIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Add)
AddTypIL.Emit(OpCodes.Stloc, 3)
AddTypIL.MarkSequencePoint(doc4, 165, 1, 165, 100)
AddTypIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa293 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim tru293 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim cont293 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.Emit(OpCodes.Bgt, tru293)
AddTypIL.Emit(OpCodes.Br, fa293)
AddTypIL.MarkLabel(tru293)
AddTypIL.MarkSequencePoint(doc4, 167, 1, 167, 100)
AddTypIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
AddTypIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddTypIL.Emit(OpCodes.Ldsfld, TypArr)
Typ = TypArr.FieldType
Typ02 = Typ
AddTypIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddTypIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
AddTypIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
AddTypIL.MarkSequencePoint(doc4, 169, 1, 169, 100)
AddTypIL.Emit(OpCodes.Br, cont293)
AddTypIL.MarkLabel(fa293)
AddTypIL.Emit(OpCodes.Br, cont293)
AddTypIL.MarkLabel(cont293)
AddTypIL.MarkSequencePoint(doc4, 171, 1, 171, 100)
AddTypIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa294 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim tru294 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim cont294 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.Emit(OpCodes.Beq, tru294)
AddTypIL.Emit(OpCodes.Br, fa294)
AddTypIL.MarkLabel(tru294)
AddTypIL.MarkSequencePoint(doc4, 172, 1, 172, 100)
AddTypIL.Emit(OpCodes.Br, label3)
AddTypIL.MarkSequencePoint(doc4, 173, 1, 173, 100)
AddTypIL.Emit(OpCodes.Br, cont294)
AddTypIL.MarkLabel(fa294)
AddTypIL.MarkSequencePoint(doc4, 174, 1, 174, 100)
AddTypIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa295 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim tru295 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim cont295 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.Emit(OpCodes.Beq, fa295)
AddTypIL.Emit(OpCodes.Br, tru295)
AddTypIL.MarkLabel(tru295)
AddTypIL.MarkSequencePoint(doc4, 175, 1, 175, 100)
AddTypIL.Emit(OpCodes.Br, label2)
AddTypIL.MarkSequencePoint(doc4, 176, 1, 176, 100)
AddTypIL.Emit(OpCodes.Br, cont295)
AddTypIL.MarkLabel(fa295)
AddTypIL.MarkSequencePoint(doc4, 177, 1, 177, 100)
AddTypIL.Emit(OpCodes.Br, label3)
AddTypIL.MarkSequencePoint(doc4, 178, 1, 178, 100)
AddTypIL.Emit(OpCodes.Br, cont295)
AddTypIL.MarkLabel(cont295)
AddTypIL.MarkSequencePoint(doc4, 179, 1, 179, 100)
AddTypIL.Emit(OpCodes.Br, cont294)
AddTypIL.MarkLabel(cont294)
AddTypIL.MarkSequencePoint(doc4, 181, 1, 181, 100)
AddTypIL.MarkLabel(label3)
AddTypIL.MarkSequencePoint(doc4, 183, 1, 183, 100)
AddTypIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
AddTypIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddTypIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
AddTypIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
AddTypIL.MarkSequencePoint(doc4, 185, 1, 185, 100)
AddTypIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Type).MakeArrayType()
AddTypIL.Emit(OpCodes.Stsfld, TypArr)
AddTypIL.MarkSequencePoint(doc4, 187, 1, 187, 100)
AddTypIL.Emit(OpCodes.Ret)
Dim typ10(-1) As Type
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = GetType(System.String)
Dim AddGenParamName As MethodBuilder = AsmFactory.DefineMethod("AddGenParamName", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ10)
Dim AddGenParamNameIL As ILGenerator = AddGenParamName.GetILGenerator()
Dim AddGenParamNameparam01 As ParameterBuilder = AddGenParamName.DefineParameter(1, ParameterAttributes.None, "nam")
AddGenParamNameIL.MarkSequencePoint(doc4, 191, 1, 191, 100)
Dim locbldr167 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr167.SetLocalSymInfo("len")
AddGenParamNameIL.Emit(OpCodes.Ldsfld, GenParamNames)
Typ = GenParamNames.FieldType
AddGenParamNameIL.Emit(OpCodes.Ldlen)
AddGenParamNameIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Stloc, 0)
AddGenParamNameIL.MarkSequencePoint(doc4, 192, 1, 192, 100)
Dim locbldr168 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr168.SetLocalSymInfo("destl")
AddGenParamNameIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Add)
AddGenParamNameIL.Emit(OpCodes.Stloc, 1)
AddGenParamNameIL.MarkSequencePoint(doc4, 193, 1, 193, 100)
Dim locbldr169 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr169.SetLocalSymInfo("stopel")
AddGenParamNameIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Sub)
AddGenParamNameIL.Emit(OpCodes.Stloc, 2)
AddGenParamNameIL.MarkSequencePoint(doc4, 194, 1, 194, 100)
Dim locbldr170 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr170.SetLocalSymInfo("i")
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Stloc, 3)
AddGenParamNameIL.MarkSequencePoint(doc4, 196, 1, 196, 100)
Dim locbldr171 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr171.SetLocalSymInfo("destarr")
AddGenParamNameIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Conv_U)
AddGenParamNameIL.Emit(OpCodes.Newarr, GetType(System.String))
AddGenParamNameIL.Emit(OpCodes.Stloc, 4)
AddGenParamNameIL.MarkSequencePoint(doc4, 198, 1, 198, 100)
Dim label4 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.MarkSequencePoint(doc4, 199, 1, 199, 100)
Dim label5 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.MarkSequencePoint(doc4, 201, 1, 201, 100)
AddGenParamNameIL.MarkLabel(label4)
AddGenParamNameIL.MarkSequencePoint(doc4, 203, 1, 203, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Add)
AddGenParamNameIL.Emit(OpCodes.Stloc, 3)
AddGenParamNameIL.MarkSequencePoint(doc4, 205, 1, 205, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa296 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim tru296 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim cont296 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.Emit(OpCodes.Bgt, tru296)
AddGenParamNameIL.Emit(OpCodes.Br, fa296)
AddGenParamNameIL.MarkLabel(tru296)
AddGenParamNameIL.MarkSequencePoint(doc4, 207, 1, 207, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
AddGenParamNameIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddGenParamNameIL.Emit(OpCodes.Ldsfld, GenParamNames)
Typ = GenParamNames.FieldType
Typ02 = Typ
AddGenParamNameIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddGenParamNameIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
AddGenParamNameIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
AddGenParamNameIL.MarkSequencePoint(doc4, 209, 1, 209, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont296)
AddGenParamNameIL.MarkLabel(fa296)
AddGenParamNameIL.Emit(OpCodes.Br, cont296)
AddGenParamNameIL.MarkLabel(cont296)
AddGenParamNameIL.MarkSequencePoint(doc4, 211, 1, 211, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa297 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim tru297 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim cont297 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.Emit(OpCodes.Beq, tru297)
AddGenParamNameIL.Emit(OpCodes.Br, fa297)
AddGenParamNameIL.MarkLabel(tru297)
AddGenParamNameIL.MarkSequencePoint(doc4, 212, 1, 212, 100)
AddGenParamNameIL.Emit(OpCodes.Br, label5)
AddGenParamNameIL.MarkSequencePoint(doc4, 213, 1, 213, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont297)
AddGenParamNameIL.MarkLabel(fa297)
AddGenParamNameIL.MarkSequencePoint(doc4, 214, 1, 214, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa298 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim tru298 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim cont298 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.Emit(OpCodes.Beq, fa298)
AddGenParamNameIL.Emit(OpCodes.Br, tru298)
AddGenParamNameIL.MarkLabel(tru298)
AddGenParamNameIL.MarkSequencePoint(doc4, 215, 1, 215, 100)
AddGenParamNameIL.Emit(OpCodes.Br, label4)
AddGenParamNameIL.MarkSequencePoint(doc4, 216, 1, 216, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont298)
AddGenParamNameIL.MarkLabel(fa298)
AddGenParamNameIL.MarkSequencePoint(doc4, 217, 1, 217, 100)
AddGenParamNameIL.Emit(OpCodes.Br, label5)
AddGenParamNameIL.MarkSequencePoint(doc4, 218, 1, 218, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont298)
AddGenParamNameIL.MarkLabel(cont298)
AddGenParamNameIL.MarkSequencePoint(doc4, 219, 1, 219, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont297)
AddGenParamNameIL.MarkLabel(cont297)
AddGenParamNameIL.MarkSequencePoint(doc4, 221, 1, 221, 100)
AddGenParamNameIL.MarkLabel(label5)
AddGenParamNameIL.MarkSequencePoint(doc4, 223, 1, 223, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
AddGenParamNameIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddGenParamNameIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
AddGenParamNameIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
AddGenParamNameIL.MarkSequencePoint(doc4, 225, 1, 225, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
AddGenParamNameIL.Emit(OpCodes.Stsfld, GenParamNames)
AddGenParamNameIL.MarkSequencePoint(doc4, 227, 1, 227, 100)
AddGenParamNameIL.Emit(OpCodes.Ret)
AsmFactory.CreateType()
End Sub


Dim doc5 As ISymbolDocumentWriter

Sub Importer()
Dim Importer As TypeBuilder = mdl.DefineType("dylan.NET.Reflection" & "." & "Importer", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass, GetType(System.Object))
Dim Asms As FieldBuilder = Importer.DefineField("Asms", GetType(Assembly).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim Imps As FieldBuilder = Importer.DefineField("Imps", GetType(System.String).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim LocImps As FieldBuilder = Importer.DefineField("LocImps", GetType(System.String).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim ctor0 As ConstructorBuilder = Importer.DefineConstructor(MethodAttributes.Public Or MethodAttributes.Static,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
ctor0IL.MarkSequencePoint(doc5, 16, 1, 16, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(Assembly))
ctor0IL.Emit(OpCodes.Stsfld, Asms)
ctor0IL.MarkSequencePoint(doc5, 17, 1, 17, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Conv_U)
ctor0IL.Emit(OpCodes.Newarr, GetType(System.String))
ctor0IL.Emit(OpCodes.Stsfld, Imps)
ctor0IL.MarkSequencePoint(doc5, 19, 1, 19, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(Assembly)
Dim AddAsm As MethodBuilder = Importer.DefineMethod("AddAsm", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ0)
Dim AddAsmIL As ILGenerator = AddAsm.GetILGenerator()
Dim AddAsmparam01 As ParameterBuilder = AddAsm.DefineParameter(1, ParameterAttributes.None, "asm")
AddAsmIL.MarkSequencePoint(doc5, 23, 1, 23, 100)
Dim locbldr172 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr172.SetLocalSymInfo("len")
AddAsmIL.Emit(OpCodes.Ldsfld, Asms)
Typ = Asms.FieldType
AddAsmIL.Emit(OpCodes.Ldlen)
AddAsmIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Stloc, 0)
AddAsmIL.MarkSequencePoint(doc5, 24, 1, 24, 100)
Dim locbldr173 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr173.SetLocalSymInfo("destl")
AddAsmIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Add)
AddAsmIL.Emit(OpCodes.Stloc, 1)
AddAsmIL.MarkSequencePoint(doc5, 25, 1, 25, 100)
Dim locbldr174 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr174.SetLocalSymInfo("stopel")
AddAsmIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Sub)
AddAsmIL.Emit(OpCodes.Stloc, 2)
AddAsmIL.MarkSequencePoint(doc5, 26, 1, 26, 100)
Dim locbldr175 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr175.SetLocalSymInfo("i")
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Stloc, 3)
AddAsmIL.MarkSequencePoint(doc5, 28, 1, 28, 100)
Dim locbldr176 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(Assembly).MakeArrayType())
locbldr176.SetLocalSymInfo("destarr")
AddAsmIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Conv_U)
AddAsmIL.Emit(OpCodes.Newarr, GetType(Assembly))
AddAsmIL.Emit(OpCodes.Stloc, 4)
AddAsmIL.MarkSequencePoint(doc5, 30, 1, 30, 100)
Dim label0 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.MarkSequencePoint(doc5, 31, 1, 31, 100)
Dim label1 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.MarkSequencePoint(doc5, 33, 1, 33, 100)
AddAsmIL.MarkLabel(label0)
AddAsmIL.MarkSequencePoint(doc5, 35, 1, 35, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Add)
AddAsmIL.Emit(OpCodes.Stloc, 3)
AddAsmIL.MarkSequencePoint(doc5, 37, 1, 37, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa299 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim tru299 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim cont299 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.Emit(OpCodes.Bgt, tru299)
AddAsmIL.Emit(OpCodes.Br, fa299)
AddAsmIL.MarkLabel(tru299)
AddAsmIL.MarkSequencePoint(doc5, 39, 1, 39, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(Assembly).MakeArrayType()
Typ02 = Typ
AddAsmIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddAsmIL.Emit(OpCodes.Ldsfld, Asms)
Typ = Asms.FieldType
Typ02 = Typ
AddAsmIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddAsmIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
AddAsmIL.Emit(OpCodes.Stelem, GetType(Assembly).MakeArrayType().GetElementType())
AddAsmIL.MarkSequencePoint(doc5, 41, 1, 41, 100)
AddAsmIL.Emit(OpCodes.Br, cont299)
AddAsmIL.MarkLabel(fa299)
AddAsmIL.Emit(OpCodes.Br, cont299)
AddAsmIL.MarkLabel(cont299)
AddAsmIL.MarkSequencePoint(doc5, 43, 1, 43, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa300 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim tru300 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim cont300 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.Emit(OpCodes.Beq, tru300)
AddAsmIL.Emit(OpCodes.Br, fa300)
AddAsmIL.MarkLabel(tru300)
AddAsmIL.MarkSequencePoint(doc5, 44, 1, 44, 100)
AddAsmIL.Emit(OpCodes.Br, label1)
AddAsmIL.MarkSequencePoint(doc5, 45, 1, 45, 100)
AddAsmIL.Emit(OpCodes.Br, cont300)
AddAsmIL.MarkLabel(fa300)
AddAsmIL.MarkSequencePoint(doc5, 46, 1, 46, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa301 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim tru301 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim cont301 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.Emit(OpCodes.Beq, fa301)
AddAsmIL.Emit(OpCodes.Br, tru301)
AddAsmIL.MarkLabel(tru301)
AddAsmIL.MarkSequencePoint(doc5, 47, 1, 47, 100)
AddAsmIL.Emit(OpCodes.Br, label0)
AddAsmIL.MarkSequencePoint(doc5, 48, 1, 48, 100)
AddAsmIL.Emit(OpCodes.Br, cont301)
AddAsmIL.MarkLabel(fa301)
AddAsmIL.MarkSequencePoint(doc5, 49, 1, 49, 100)
AddAsmIL.Emit(OpCodes.Br, label1)
AddAsmIL.MarkSequencePoint(doc5, 50, 1, 50, 100)
AddAsmIL.Emit(OpCodes.Br, cont301)
AddAsmIL.MarkLabel(cont301)
AddAsmIL.MarkSequencePoint(doc5, 51, 1, 51, 100)
AddAsmIL.Emit(OpCodes.Br, cont300)
AddAsmIL.MarkLabel(cont300)
AddAsmIL.MarkSequencePoint(doc5, 53, 1, 53, 100)
AddAsmIL.MarkLabel(label1)
AddAsmIL.MarkSequencePoint(doc5, 55, 1, 55, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(Assembly).MakeArrayType()
Typ02 = Typ
AddAsmIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Conv_U)
Typ = Typ02
AddAsmIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Assembly)
AddAsmIL.Emit(OpCodes.Stelem, GetType(Assembly).MakeArrayType().GetElementType())
AddAsmIL.MarkSequencePoint(doc5, 57, 1, 57, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(Assembly).MakeArrayType()
AddAsmIL.Emit(OpCodes.Stsfld, Asms)
AddAsmIL.MarkSequencePoint(doc5, 59, 1, 59, 100)
AddAsmIL.Emit(OpCodes.Ret)
Dim typ1(-1) As Type
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = GetType(System.String).MakeArrayType()
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = GetType(System.String)
Dim addelem As MethodBuilder = Importer.DefineMethod("addelem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.String).MakeArrayType(), typ1)
Dim addelemIL As ILGenerator = addelem.GetILGenerator()
Dim addelemparam01 As ParameterBuilder = addelem.DefineParameter(1, ParameterAttributes.None, "srcarr")
Dim addelemparam02 As ParameterBuilder = addelem.DefineParameter(2, ParameterAttributes.None, "eltoadd")
addelemIL.MarkSequencePoint(doc5, 63, 1, 63, 100)
Dim locbldr177 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr177.SetLocalSymInfo("len")
addelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
addelemIL.Emit(OpCodes.Ldlen)
addelemIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Stloc, 0)
addelemIL.MarkSequencePoint(doc5, 64, 1, 64, 100)
Dim locbldr178 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr178.SetLocalSymInfo("destl")
addelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Add)
addelemIL.Emit(OpCodes.Stloc, 1)
addelemIL.MarkSequencePoint(doc5, 65, 1, 65, 100)
Dim locbldr179 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr179.SetLocalSymInfo("stopel")
addelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Sub)
addelemIL.Emit(OpCodes.Stloc, 2)
addelemIL.MarkSequencePoint(doc5, 66, 1, 66, 100)
Dim locbldr180 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr180.SetLocalSymInfo("i")
addelemIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Stloc, 3)
addelemIL.MarkSequencePoint(doc5, 68, 1, 68, 100)
Dim locbldr181 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr181.SetLocalSymInfo("destarr")
addelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Conv_U)
addelemIL.Emit(OpCodes.Newarr, GetType(System.String))
addelemIL.Emit(OpCodes.Stloc, 4)
addelemIL.MarkSequencePoint(doc5, 70, 1, 70, 100)
Dim label2 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.MarkSequencePoint(doc5, 71, 1, 71, 100)
Dim label3 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.MarkSequencePoint(doc5, 73, 1, 73, 100)
addelemIL.MarkLabel(label2)
addelemIL.MarkSequencePoint(doc5, 75, 1, 75, 100)
addelemIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Add)
addelemIL.Emit(OpCodes.Stloc, 3)
addelemIL.MarkSequencePoint(doc5, 77, 1, 77, 100)
addelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa302 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim tru302 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim cont302 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.Emit(OpCodes.Bgt, tru302)
addelemIL.Emit(OpCodes.Br, fa302)
addelemIL.MarkLabel(tru302)
addelemIL.MarkSequencePoint(doc5, 79, 1, 79, 100)
addelemIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
addelemIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Conv_U)
Typ = Typ02
addelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
addelemIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Conv_U)
Typ = Typ02
addelemIL.Emit(OpCodes.Ldelem, GetType(System.String).MakeArrayType().GetElementType())
Typ = GetType(System.String).MakeArrayType().GetElementType()
addelemIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
addelemIL.MarkSequencePoint(doc5, 81, 1, 81, 100)
addelemIL.Emit(OpCodes.Br, cont302)
addelemIL.MarkLabel(fa302)
addelemIL.Emit(OpCodes.Br, cont302)
addelemIL.MarkLabel(cont302)
addelemIL.MarkSequencePoint(doc5, 83, 1, 83, 100)
addelemIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa303 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim tru303 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim cont303 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.Emit(OpCodes.Beq, tru303)
addelemIL.Emit(OpCodes.Br, fa303)
addelemIL.MarkLabel(tru303)
addelemIL.MarkSequencePoint(doc5, 84, 1, 84, 100)
addelemIL.Emit(OpCodes.Br, label3)
addelemIL.MarkSequencePoint(doc5, 85, 1, 85, 100)
addelemIL.Emit(OpCodes.Br, cont303)
addelemIL.MarkLabel(fa303)
addelemIL.MarkSequencePoint(doc5, 86, 1, 86, 100)
addelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa304 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim tru304 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim cont304 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.Emit(OpCodes.Beq, fa304)
addelemIL.Emit(OpCodes.Br, tru304)
addelemIL.MarkLabel(tru304)
addelemIL.MarkSequencePoint(doc5, 87, 1, 87, 100)
addelemIL.Emit(OpCodes.Br, label2)
addelemIL.MarkSequencePoint(doc5, 88, 1, 88, 100)
addelemIL.Emit(OpCodes.Br, cont304)
addelemIL.MarkLabel(fa304)
addelemIL.MarkSequencePoint(doc5, 89, 1, 89, 100)
addelemIL.Emit(OpCodes.Br, label3)
addelemIL.MarkSequencePoint(doc5, 90, 1, 90, 100)
addelemIL.Emit(OpCodes.Br, cont304)
addelemIL.MarkLabel(cont304)
addelemIL.MarkSequencePoint(doc5, 91, 1, 91, 100)
addelemIL.Emit(OpCodes.Br, cont303)
addelemIL.MarkLabel(cont303)
addelemIL.MarkSequencePoint(doc5, 93, 1, 93, 100)
addelemIL.MarkLabel(label3)
addelemIL.MarkSequencePoint(doc5, 95, 1, 95, 100)
addelemIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
addelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Conv_U)
Typ = Typ02
addelemIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
addelemIL.Emit(OpCodes.Stelem, GetType(System.String).MakeArrayType().GetElementType())
addelemIL.MarkSequencePoint(doc5, 97, 1, 97, 100)
addelemIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
addelemIL.MarkSequencePoint(doc5, 99, 1, 99, 100)
addelemIL.Emit(OpCodes.Ret)
Dim typ2(-1) As Type
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = GetType(System.String)
Dim AddImp As MethodBuilder = Importer.DefineMethod("AddImp", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ2)
Dim AddImpIL As ILGenerator = AddImp.GetILGenerator()
Dim AddImpparam01 As ParameterBuilder = AddImp.DefineParameter(1, ParameterAttributes.None, "imp")
AddImpIL.MarkSequencePoint(doc5, 102, 1, 102, 100)
Dim typ3(-1) As Type
AddImpIL.Emit(OpCodes.Ldsfld, Imps)
Typ = Imps.FieldType
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
AddImpIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
AddImpIL.Emit(OpCodes.Call, addelem)
Typ = addelem.ReturnType
AddImpIL.Emit(OpCodes.Stsfld, Imps)
AddImpIL.MarkSequencePoint(doc5, 103, 1, 103, 100)
AddImpIL.Emit(OpCodes.Ret)
Dim typ4(-1) As Type
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = GetType(System.String)
Dim AddLocImp As MethodBuilder = Importer.DefineMethod("AddLocImp", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ4)
Dim AddLocImpIL As ILGenerator = AddLocImp.GetILGenerator()
Dim AddLocImpparam01 As ParameterBuilder = AddLocImp.DefineParameter(1, ParameterAttributes.None, "imp")
AddLocImpIL.MarkSequencePoint(doc5, 106, 1, 106, 100)
Dim typ5(-1) As Type
AddLocImpIL.Emit(OpCodes.Ldsfld, Imps)
Typ = Imps.FieldType
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
AddLocImpIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
AddLocImpIL.Emit(OpCodes.Call, addelem)
Typ = addelem.ReturnType
AddLocImpIL.Emit(OpCodes.Stsfld, Imps)
AddLocImpIL.MarkSequencePoint(doc5, 107, 1, 107, 100)
AddLocImpIL.Emit(OpCodes.Ret)
Importer.CreateType()
End Sub


Dim doc6 As ISymbolDocumentWriter

Sub Loader()
Dim Loader As TypeBuilder = mdl.DefineType("dylan.NET.Reflection" & "." & "Loader", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass Or TypeAttributes.BeforeFieldInit, GetType(System.Object))
Dim FldLitFlag As FieldBuilder = Loader.DefineField("FldLitFlag", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim FldLitVal As FieldBuilder = Loader.DefineField("FldLitVal", GetType(System.Object), FieldAttributes.Public Or FieldAttributes.Static)
Dim EnumLitFlag As FieldBuilder = Loader.DefineField("EnumLitFlag", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim EnumLitTyp As FieldBuilder = Loader.DefineField("EnumLitTyp", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim FldLitTyp As FieldBuilder = Loader.DefineField("FldLitTyp", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim MemberTyp As FieldBuilder = Loader.DefineField("MemberTyp", GetType(System.Type), FieldAttributes.Public Or FieldAttributes.Static)
Dim MakeArr As FieldBuilder = Loader.DefineField("MakeArr", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim MakeRef As FieldBuilder = Loader.DefineField("MakeRef", GetType(System.Boolean), FieldAttributes.Public Or FieldAttributes.Static)
Dim ctor0 As ConstructorBuilder = Loader.DefineConstructor(MethodAttributes.Public Or MethodAttributes.Static,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
ctor0IL.MarkSequencePoint(doc6, 21, 1, 21, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, FldLitFlag)
ctor0IL.MarkSequencePoint(doc6, 22, 1, 22, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, FldLitVal)
ctor0IL.MarkSequencePoint(doc6, 23, 1, 23, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, EnumLitFlag)
ctor0IL.MarkSequencePoint(doc6, 24, 1, 24, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, FldLitTyp)
ctor0IL.MarkSequencePoint(doc6, 25, 1, 25, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, MemberTyp)
ctor0IL.MarkSequencePoint(doc6, 26, 1, 26, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, MakeArr)
ctor0IL.MarkSequencePoint(doc6, 27, 1, 27, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, MakeRef)
ctor0IL.MarkSequencePoint(doc6, 28, 1, 28, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
Dim LoadClass As MethodBuilder = Loader.DefineMethod("LoadClass", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Type), typ0)
Dim LoadClassIL As ILGenerator = LoadClass.GetILGenerator()
Dim LoadClassparam01 As ParameterBuilder = LoadClass.DefineParameter(1, ParameterAttributes.None, "name")
LoadClassIL.MarkSequencePoint(doc6, 32, 1, 32, 100)
Dim locbldr182 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Type))
locbldr182.SetLocalSymInfo("typ")
LoadClassIL.Emit(OpCodes.Ldnull)
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 33, 1, 33, 100)
Dim locbldr183 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr183.SetLocalSymInfo("i")
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Stloc, 1)
LoadClassIL.MarkSequencePoint(doc6, 34, 1, 34, 100)
Dim locbldr184 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr184.SetLocalSymInfo("len")
LoadClassIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms"))
Typ = asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms").FieldType
LoadClassIL.Emit(OpCodes.Ldlen)
LoadClassIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Sub)
LoadClassIL.Emit(OpCodes.Stloc, 2)
LoadClassIL.MarkSequencePoint(doc6, 35, 1, 35, 100)
Dim locbldr185 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(Assembly))
locbldr185.SetLocalSymInfo("curasm")
LoadClassIL.Emit(OpCodes.Ldnull)
LoadClassIL.Emit(OpCodes.Stloc, 3)
LoadClassIL.MarkSequencePoint(doc6, 36, 1, 36, 100)
Dim locbldr186 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr186.SetLocalSymInfo("j")
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Stloc, 4)
LoadClassIL.MarkSequencePoint(doc6, 37, 1, 37, 100)
Dim locbldr187 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr187.SetLocalSymInfo("len2")
LoadClassIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.Importer").GetField("Imps"))
Typ = asm.GetType("dylan.NET.Reflection.Importer").GetField("Imps").FieldType
LoadClassIL.Emit(OpCodes.Ldlen)
LoadClassIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Sub)
LoadClassIL.Emit(OpCodes.Stloc, 5)
LoadClassIL.MarkSequencePoint(doc6, 38, 1, 38, 100)
Dim locbldr188 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.String))
locbldr188.SetLocalSymInfo("curns")
LoadClassIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
LoadClassIL.Emit(OpCodes.Stloc, 6)
LoadClassIL.MarkSequencePoint(doc6, 39, 1, 39, 100)
Dim locbldr189 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.String))
locbldr189.SetLocalSymInfo("tmpstr")
LoadClassIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
LoadClassIL.Emit(OpCodes.Stloc, 7)
LoadClassIL.MarkSequencePoint(doc6, 40, 1, 40, 100)
Dim locbldr190 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Boolean))
locbldr190.SetLocalSymInfo("nest")
LoadClassIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Stloc, 8)
LoadClassIL.MarkSequencePoint(doc6, 42, 1, 42, 100)
Dim label0 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.MarkSequencePoint(doc6, 43, 1, 43, 100)
Dim label1 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.MarkSequencePoint(doc6, 44, 1, 44, 100)
Dim label2 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.MarkSequencePoint(doc6, 45, 1, 45, 100)
Dim label3 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.MarkSequencePoint(doc6, 46, 1, 46, 100)
Dim label4 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.MarkSequencePoint(doc6, 48, 1, 48, 100)
Dim locbldr191 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr191.SetLocalSymInfo("na")
Dim typ1(-1) As Type
LoadClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
LoadClassIL.Emit(OpCodes.Ldstr, "\")
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
LoadClassIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("StringParser", typ1))
Typ = GetType(ParseUtils).GetMethod("StringParser", typ1).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 9)
LoadClassIL.MarkSequencePoint(doc6, 49, 1, 49, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadClassIL.Emit(OpCodes.Ldelem, GetType(System.String).MakeArrayType().GetElementType())
Typ = GetType(System.String).MakeArrayType().GetElementType()
LoadClassIL.Emit(OpCodes.Starg, 0)
LoadClassIL.MarkSequencePoint(doc6, 50, 1, 50, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.String).MakeArrayType()
LoadClassIL.Emit(OpCodes.Ldlen)
LoadClassIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa305 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru305 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont305 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Bgt, tru305)
LoadClassIL.Emit(OpCodes.Br, fa305)
LoadClassIL.MarkLabel(tru305)
LoadClassIL.MarkSequencePoint(doc6, 51, 1, 51, 100)
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Stloc, 8)
LoadClassIL.MarkSequencePoint(doc6, 52, 1, 52, 100)
LoadClassIL.Emit(OpCodes.Br, cont305)
LoadClassIL.MarkLabel(fa305)
LoadClassIL.Emit(OpCodes.Br, cont305)
LoadClassIL.MarkLabel(cont305)
LoadClassIL.MarkSequencePoint(doc6, 54, 1, 54, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms"))
Typ = asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms").FieldType
LoadClassIL.Emit(OpCodes.Ldlen)
LoadClassIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa306 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru306 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont306 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru306)
LoadClassIL.Emit(OpCodes.Br, fa306)
LoadClassIL.MarkLabel(tru306)
LoadClassIL.MarkSequencePoint(doc6, 55, 1, 55, 100)
LoadClassIL.Emit(OpCodes.Br, label2)
LoadClassIL.MarkSequencePoint(doc6, 56, 1, 56, 100)
LoadClassIL.Emit(OpCodes.Br, cont306)
LoadClassIL.MarkLabel(fa306)
LoadClassIL.Emit(OpCodes.Br, cont306)
LoadClassIL.MarkLabel(cont306)
LoadClassIL.MarkSequencePoint(doc6, 58, 1, 58, 100)
LoadClassIL.MarkLabel(label0)
LoadClassIL.MarkSequencePoint(doc6, 59, 1, 59, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Add)
LoadClassIL.Emit(OpCodes.Stloc, 1)
LoadClassIL.MarkSequencePoint(doc6, 61, 1, 61, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms"))
Typ = asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms").FieldType
Typ02 = Typ
LoadClassIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadClassIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
LoadClassIL.Emit(OpCodes.Stloc, 3)
LoadClassIL.MarkSequencePoint(doc6, 63, 1, 63, 100)
Dim typ2(-1) As Type
LoadClassIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(Assembly)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetType", typ2))
Typ = Typ03.GetMethod("GetType", typ2).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 64, 1, 64, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
LoadClassIL.Emit(OpCodes.Ldnull)
Dim fa307 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru307 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont307 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru307)
LoadClassIL.Emit(OpCodes.Br, fa307)
LoadClassIL.MarkLabel(tru307)
LoadClassIL.MarkSequencePoint(doc6, 65, 1, 65, 100)
LoadClassIL.Emit(OpCodes.Br, cont307)
LoadClassIL.MarkLabel(fa307)
LoadClassIL.MarkSequencePoint(doc6, 66, 1, 66, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa308 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru308 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont308 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru308)
LoadClassIL.Emit(OpCodes.Br, fa308)
LoadClassIL.MarkLabel(tru308)
LoadClassIL.MarkSequencePoint(doc6, 67, 1, 67, 100)
Dim typ3(-1) As Type
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadClassIL.Emit(OpCodes.Ldelem, GetType(System.String).MakeArrayType().GetElementType())
Typ = GetType(System.String).MakeArrayType().GetElementType()
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetNestedType", typ3))
Typ = Typ03.GetMethod("GetNestedType", typ3).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 68, 1, 68, 100)
LoadClassIL.Emit(OpCodes.Br, cont308)
LoadClassIL.MarkLabel(fa308)
LoadClassIL.Emit(OpCodes.Br, cont308)
LoadClassIL.MarkLabel(cont308)
LoadClassIL.MarkSequencePoint(doc6, 69, 1, 69, 100)
LoadClassIL.Emit(OpCodes.Br, label2)
LoadClassIL.MarkSequencePoint(doc6, 70, 1, 70, 100)
LoadClassIL.Emit(OpCodes.Br, cont307)
LoadClassIL.MarkLabel(cont307)
LoadClassIL.MarkSequencePoint(doc6, 72, 1, 72, 100)
LoadClassIL.MarkLabel(label3)
LoadClassIL.MarkSequencePoint(doc6, 73, 1, 73, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Add)
LoadClassIL.Emit(OpCodes.Stloc, 4)
LoadClassIL.MarkSequencePoint(doc6, 75, 1, 75, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.Importer").GetField("Imps"))
Typ = asm.GetType("dylan.NET.Reflection.Importer").GetField("Imps").FieldType
Typ02 = Typ
LoadClassIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadClassIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
LoadClassIL.Emit(OpCodes.Stloc, 6)
LoadClassIL.MarkSequencePoint(doc6, 77, 1, 77, 100)
Dim typ4(-1) As Type
LoadClassIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
LoadClassIL.Emit(OpCodes.Ldstr, ".")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
LoadClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
LoadClassIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ4))
Typ = GetType(String).GetMethod("Concat", typ4).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 7)
LoadClassIL.MarkSequencePoint(doc6, 78, 1, 78, 100)
Dim typ5(-1) As Type
LoadClassIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(Assembly)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetType", typ5))
Typ = Typ03.GetMethod("GetType", typ5).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 79, 1, 79, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
LoadClassIL.Emit(OpCodes.Ldnull)
Dim fa309 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru309 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont309 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru309)
LoadClassIL.Emit(OpCodes.Br, fa309)
LoadClassIL.MarkLabel(tru309)
LoadClassIL.MarkSequencePoint(doc6, 80, 1, 80, 100)
LoadClassIL.Emit(OpCodes.Br, cont309)
LoadClassIL.MarkLabel(fa309)
LoadClassIL.MarkSequencePoint(doc6, 81, 1, 81, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa310 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru310 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont310 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru310)
LoadClassIL.Emit(OpCodes.Br, fa310)
LoadClassIL.MarkLabel(tru310)
LoadClassIL.MarkSequencePoint(doc6, 82, 1, 82, 100)
Dim typ6(-1) As Type
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadClassIL.Emit(OpCodes.Ldelem, GetType(System.String).MakeArrayType().GetElementType())
Typ = GetType(System.String).MakeArrayType().GetElementType()
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetNestedType", typ6))
Typ = Typ03.GetMethod("GetNestedType", typ6).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 83, 1, 83, 100)
LoadClassIL.Emit(OpCodes.Br, cont310)
LoadClassIL.MarkLabel(fa310)
LoadClassIL.Emit(OpCodes.Br, cont310)
LoadClassIL.MarkLabel(cont310)
LoadClassIL.MarkSequencePoint(doc6, 84, 1, 84, 100)
LoadClassIL.Emit(OpCodes.Br, label2)
LoadClassIL.MarkSequencePoint(doc6, 85, 1, 85, 100)
LoadClassIL.Emit(OpCodes.Br, cont309)
LoadClassIL.MarkLabel(cont309)
LoadClassIL.MarkSequencePoint(doc6, 87, 1, 87, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
Dim fa311 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru311 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont311 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru311)
LoadClassIL.Emit(OpCodes.Br, fa311)
LoadClassIL.MarkLabel(tru311)
LoadClassIL.MarkSequencePoint(doc6, 88, 1, 88, 100)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Stloc, 4)
LoadClassIL.MarkSequencePoint(doc6, 89, 1, 89, 100)
LoadClassIL.Emit(OpCodes.Br, label4)
LoadClassIL.MarkSequencePoint(doc6, 90, 1, 90, 100)
LoadClassIL.Emit(OpCodes.Br, cont311)
LoadClassIL.MarkLabel(fa311)
LoadClassIL.MarkSequencePoint(doc6, 91, 1, 91, 100)
LoadClassIL.Emit(OpCodes.Br, label3)
LoadClassIL.MarkSequencePoint(doc6, 92, 1, 92, 100)
LoadClassIL.Emit(OpCodes.Br, cont311)
LoadClassIL.MarkLabel(cont311)
LoadClassIL.MarkSequencePoint(doc6, 94, 1, 94, 100)
LoadClassIL.MarkLabel(label4)
LoadClassIL.MarkSequencePoint(doc6, 96, 1, 96, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa312 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru312 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont312 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru312)
LoadClassIL.Emit(OpCodes.Br, fa312)
LoadClassIL.MarkLabel(tru312)
LoadClassIL.MarkSequencePoint(doc6, 97, 1, 97, 100)
LoadClassIL.Emit(OpCodes.Br, label1)
LoadClassIL.MarkSequencePoint(doc6, 98, 1, 98, 100)
LoadClassIL.Emit(OpCodes.Br, cont312)
LoadClassIL.MarkLabel(fa312)
LoadClassIL.MarkSequencePoint(doc6, 99, 1, 99, 100)
LoadClassIL.Emit(OpCodes.Br, label0)
LoadClassIL.MarkSequencePoint(doc6, 100, 1, 100, 100)
LoadClassIL.Emit(OpCodes.Br, cont312)
LoadClassIL.MarkLabel(cont312)
LoadClassIL.MarkSequencePoint(doc6, 102, 1, 102, 100)
LoadClassIL.MarkLabel(label1)
LoadClassIL.MarkSequencePoint(doc6, 103, 1, 103, 100)
LoadClassIL.MarkLabel(label2)
LoadClassIL.MarkSequencePoint(doc6, 105, 1, 105, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
LoadClassIL.Emit(OpCodes.Ldnull)
Dim fa313 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru313 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont313 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, fa313)
LoadClassIL.Emit(OpCodes.Br, tru313)
LoadClassIL.MarkLabel(tru313)
LoadClassIL.MarkSequencePoint(doc6, 106, 1, 106, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, MakeArr)
Typ = MakeArr.FieldType
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa314 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru314 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont314 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru314)
LoadClassIL.Emit(OpCodes.Br, fa314)
LoadClassIL.MarkLabel(tru314)
LoadClassIL.MarkSequencePoint(doc6, 107, 1, 107, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeArrayType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeArrayType", Type.EmptyTypes).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 108, 1, 108, 100)
LoadClassIL.Emit(OpCodes.Br, cont314)
LoadClassIL.MarkLabel(fa314)
LoadClassIL.Emit(OpCodes.Br, cont314)
LoadClassIL.MarkLabel(cont314)
LoadClassIL.MarkSequencePoint(doc6, 109, 1, 109, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, MakeRef)
Typ = MakeRef.FieldType
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa315 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru315 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont315 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru315)
LoadClassIL.Emit(OpCodes.Br, fa315)
LoadClassIL.MarkLabel(tru315)
LoadClassIL.MarkSequencePoint(doc6, 110, 1, 110, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeByRefType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeByRefType", Type.EmptyTypes).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 111, 1, 111, 100)
LoadClassIL.Emit(OpCodes.Br, cont315)
LoadClassIL.MarkLabel(fa315)
LoadClassIL.Emit(OpCodes.Br, cont315)
LoadClassIL.MarkLabel(cont315)
LoadClassIL.MarkSequencePoint(doc6, 112, 1, 112, 100)
LoadClassIL.Emit(OpCodes.Br, cont313)
LoadClassIL.MarkLabel(fa313)
LoadClassIL.Emit(OpCodes.Br, cont313)
LoadClassIL.MarkLabel(cont313)
LoadClassIL.MarkSequencePoint(doc6, 114, 1, 114, 100)
LoadClassIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Stsfld, MakeArr)
LoadClassIL.MarkSequencePoint(doc6, 115, 1, 115, 100)
LoadClassIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Stsfld, MakeRef)
LoadClassIL.MarkSequencePoint(doc6, 117, 1, 117, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
LoadClassIL.MarkSequencePoint(doc6, 119, 1, 119, 100)
LoadClassIL.Emit(OpCodes.Ret)
Dim typ9(-1) As Type
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = GetType(System.Type)
Dim ProcessType As MethodBuilder = Loader.DefineMethod("ProcessType", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Type), typ9)
Dim ProcessTypeIL As ILGenerator = ProcessType.GetILGenerator()
Dim ProcessTypeparam01 As ParameterBuilder = ProcessType.DefineParameter(1, ParameterAttributes.None, "typ")
ProcessTypeIL.MarkSequencePoint(doc6, 122, 1, 122, 100)
ProcessTypeIL.Emit(OpCodes.Ldsfld, MakeArr)
Typ = MakeArr.FieldType
ProcessTypeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa316 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim tru316 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim cont316 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
ProcessTypeIL.Emit(OpCodes.Beq, tru316)
ProcessTypeIL.Emit(OpCodes.Br, fa316)
ProcessTypeIL.MarkLabel(tru316)
ProcessTypeIL.MarkSequencePoint(doc6, 123, 1, 123, 100)
ProcessTypeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
ProcessTypeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeArrayType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeArrayType", Type.EmptyTypes).ReturnType
ProcessTypeIL.Emit(OpCodes.Starg, 0)
ProcessTypeIL.MarkSequencePoint(doc6, 124, 1, 124, 100)
ProcessTypeIL.Emit(OpCodes.Br, cont316)
ProcessTypeIL.MarkLabel(fa316)
ProcessTypeIL.Emit(OpCodes.Br, cont316)
ProcessTypeIL.MarkLabel(cont316)
ProcessTypeIL.MarkSequencePoint(doc6, 125, 1, 125, 100)
ProcessTypeIL.Emit(OpCodes.Ldsfld, MakeRef)
Typ = MakeRef.FieldType
ProcessTypeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa317 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim tru317 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim cont317 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
ProcessTypeIL.Emit(OpCodes.Beq, tru317)
ProcessTypeIL.Emit(OpCodes.Br, fa317)
ProcessTypeIL.MarkLabel(tru317)
ProcessTypeIL.MarkSequencePoint(doc6, 126, 1, 126, 100)
ProcessTypeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
ProcessTypeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeByRefType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeByRefType", Type.EmptyTypes).ReturnType
ProcessTypeIL.Emit(OpCodes.Starg, 0)
ProcessTypeIL.MarkSequencePoint(doc6, 127, 1, 127, 100)
ProcessTypeIL.Emit(OpCodes.Br, cont317)
ProcessTypeIL.MarkLabel(fa317)
ProcessTypeIL.Emit(OpCodes.Br, cont317)
ProcessTypeIL.MarkLabel(cont317)
ProcessTypeIL.MarkSequencePoint(doc6, 129, 1, 129, 100)
ProcessTypeIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ProcessTypeIL.Emit(OpCodes.Stsfld, MakeArr)
ProcessTypeIL.MarkSequencePoint(doc6, 130, 1, 130, 100)
ProcessTypeIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ProcessTypeIL.Emit(OpCodes.Stsfld, MakeRef)
ProcessTypeIL.MarkSequencePoint(doc6, 132, 1, 132, 100)
ProcessTypeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ProcessTypeIL.MarkSequencePoint(doc6, 133, 1, 133, 100)
ProcessTypeIL.Emit(OpCodes.Ret)
Dim typ12(-1) As Type
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = GetType(ParameterInfo).MakeArrayType()
Dim ParamsToTyps As MethodBuilder = Loader.DefineMethod("ParamsToTyps", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Type).MakeArrayType(), typ12)
Dim ParamsToTypsIL As ILGenerator = ParamsToTyps.GetILGenerator()
Dim ParamsToTypsparam01 As ParameterBuilder = ParamsToTyps.DefineParameter(1, ParameterAttributes.None, "t")
ParamsToTypsIL.MarkSequencePoint(doc6, 137, 1, 137, 100)
Dim locbldr192 As LocalBuilder = ParamsToTypsIL.DeclareLocal(GetType(System.Int32))
locbldr192.SetLocalSymInfo("arrlen")
ParamsToTypsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ParameterInfo).MakeArrayType()
ParamsToTypsIL.Emit(OpCodes.Ldlen)
ParamsToTypsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Stloc, 0)
ParamsToTypsIL.MarkSequencePoint(doc6, 138, 1, 138, 100)
Dim locbldr193 As LocalBuilder = ParamsToTypsIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr193.SetLocalSymInfo("arr")
ParamsToTypsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Conv_U)
ParamsToTypsIL.Emit(OpCodes.Newarr, GetType(System.Type))
ParamsToTypsIL.Emit(OpCodes.Stloc, 1)
ParamsToTypsIL.MarkSequencePoint(doc6, 139, 1, 139, 100)
Dim locbldr194 As LocalBuilder = ParamsToTypsIL.DeclareLocal(GetType(ParameterInfo))
locbldr194.SetLocalSymInfo("p")
ParamsToTypsIL.MarkSequencePoint(doc6, 140, 1, 140, 100)
Dim locbldr195 As LocalBuilder = ParamsToTypsIL.DeclareLocal(GetType(System.Type))
locbldr195.SetLocalSymInfo("ta")
ParamsToTypsIL.MarkSequencePoint(doc6, 142, 1, 142, 100)
Dim locbldr196 As LocalBuilder = ParamsToTypsIL.DeclareLocal(GetType(System.Int32))
locbldr196.SetLocalSymInfo("i")
ParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Stloc, 4)
ParamsToTypsIL.MarkSequencePoint(doc6, 143, 1, 143, 100)
Dim locbldr197 As LocalBuilder = ParamsToTypsIL.DeclareLocal(GetType(System.Int32))
locbldr197.SetLocalSymInfo("len")
ParamsToTypsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Sub)
ParamsToTypsIL.Emit(OpCodes.Stloc, 5)
ParamsToTypsIL.MarkSequencePoint(doc6, 145, 1, 145, 100)
Dim label5 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
ParamsToTypsIL.MarkSequencePoint(doc6, 146, 1, 146, 100)
Dim label6 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
ParamsToTypsIL.MarkSequencePoint(doc6, 148, 1, 148, 100)
ParamsToTypsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa318 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
Dim tru318 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
Dim cont318 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
ParamsToTypsIL.Emit(OpCodes.Beq, tru318)
ParamsToTypsIL.Emit(OpCodes.Br, fa318)
ParamsToTypsIL.MarkLabel(tru318)
ParamsToTypsIL.MarkSequencePoint(doc6, 149, 1, 149, 100)
ParamsToTypsIL.Emit(OpCodes.Ldsfld, GetType(System.Type).GetField("EmptyTypes"))
Typ = GetType(System.Type).GetField("EmptyTypes").FieldType
ParamsToTypsIL.Emit(OpCodes.Stloc, 1)
ParamsToTypsIL.MarkSequencePoint(doc6, 150, 1, 150, 100)
ParamsToTypsIL.Emit(OpCodes.Br, label6)
ParamsToTypsIL.MarkSequencePoint(doc6, 151, 1, 151, 100)
ParamsToTypsIL.Emit(OpCodes.Br, cont318)
ParamsToTypsIL.MarkLabel(fa318)
ParamsToTypsIL.Emit(OpCodes.Br, cont318)
ParamsToTypsIL.MarkLabel(cont318)
ParamsToTypsIL.MarkSequencePoint(doc6, 153, 1, 153, 100)
ParamsToTypsIL.MarkLabel(label5)
ParamsToTypsIL.MarkSequencePoint(doc6, 155, 1, 155, 100)
ParamsToTypsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Add)
ParamsToTypsIL.Emit(OpCodes.Stloc, 4)
ParamsToTypsIL.MarkSequencePoint(doc6, 157, 1, 157, 100)
ParamsToTypsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ParameterInfo).MakeArrayType()
Typ02 = Typ
ParamsToTypsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Conv_U)
Typ = Typ02
ParamsToTypsIL.Emit(OpCodes.Ldelem, GetType(ParameterInfo).MakeArrayType().GetElementType())
Typ = GetType(ParameterInfo).MakeArrayType().GetElementType()
ParamsToTypsIL.Emit(OpCodes.Stloc, 2)
ParamsToTypsIL.MarkSequencePoint(doc6, 158, 1, 158, 100)
ParamsToTypsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(ParameterInfo)
Typ03 = Typ
ParamsToTypsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ParameterType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ParameterType", Type.EmptyTypes).ReturnType
ParamsToTypsIL.Emit(OpCodes.Stloc, 3)
ParamsToTypsIL.MarkSequencePoint(doc6, 159, 1, 159, 100)
ParamsToTypsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
ParamsToTypsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Conv_U)
Typ = Typ02
ParamsToTypsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Type)
ParamsToTypsIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
ParamsToTypsIL.MarkSequencePoint(doc6, 161, 1, 161, 100)
ParamsToTypsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
ParamsToTypsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
Dim fa319 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
Dim tru319 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
Dim cont319 As System.Reflection.Emit.Label = ParamsToTypsIL.DefineLabel()
ParamsToTypsIL.Emit(OpCodes.Beq, tru319)
ParamsToTypsIL.Emit(OpCodes.Br, fa319)
ParamsToTypsIL.MarkLabel(tru319)
ParamsToTypsIL.MarkSequencePoint(doc6, 162, 1, 162, 100)
ParamsToTypsIL.Emit(OpCodes.Br, label6)
ParamsToTypsIL.MarkSequencePoint(doc6, 163, 1, 163, 100)
ParamsToTypsIL.Emit(OpCodes.Br, cont319)
ParamsToTypsIL.MarkLabel(fa319)
ParamsToTypsIL.MarkSequencePoint(doc6, 164, 1, 164, 100)
ParamsToTypsIL.Emit(OpCodes.Br, label5)
ParamsToTypsIL.MarkSequencePoint(doc6, 165, 1, 165, 100)
ParamsToTypsIL.Emit(OpCodes.Br, cont319)
ParamsToTypsIL.MarkLabel(cont319)
ParamsToTypsIL.MarkSequencePoint(doc6, 167, 1, 167, 100)
ParamsToTypsIL.MarkLabel(label6)
ParamsToTypsIL.MarkSequencePoint(doc6, 169, 1, 169, 100)
ParamsToTypsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
ParamsToTypsIL.MarkSequencePoint(doc6, 170, 1, 170, 100)
ParamsToTypsIL.Emit(OpCodes.Ret)
Dim typ14(-1) As Type
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = GetType(System.Type)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = GetType(System.String)
Dim LoadMethodWithoutParams As MethodBuilder = Loader.DefineMethod("LoadMethodWithoutParams", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo), typ14)
Dim LoadMethodWithoutParamsIL As ILGenerator = LoadMethodWithoutParams.GetILGenerator()
Dim LoadMethodWithoutParamsparam01 As ParameterBuilder = LoadMethodWithoutParams.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadMethodWithoutParamsparam02 As ParameterBuilder = LoadMethodWithoutParams.DefineParameter(2, ParameterAttributes.None, "name")
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 174, 1, 174, 100)
Dim locbldr198 As LocalBuilder = LoadMethodWithoutParamsIL.DeclareLocal(GetType(System.Type))
locbldr198.SetLocalSymInfo("temptyp")
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldnull)
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 0)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 175, 1, 175, 100)
Dim locbldr199 As LocalBuilder = LoadMethodWithoutParamsIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr199.SetLocalSymInfo("ints")
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldnull)
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 1)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 176, 1, 176, 100)
Dim locbldr200 As LocalBuilder = LoadMethodWithoutParamsIL.DeclareLocal(GetType(System.Int32))
locbldr200.SetLocalSymInfo("i")
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 2)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 177, 1, 177, 100)
Dim locbldr201 As LocalBuilder = LoadMethodWithoutParamsIL.DeclareLocal(GetType(System.Int32))
locbldr201.SetLocalSymInfo("len")
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 3)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 178, 1, 178, 100)
Dim locbldr202 As LocalBuilder = LoadMethodWithoutParamsIL.DeclareLocal(GetType(MethodInfo))
locbldr202.SetLocalSymInfo("mtdinfo")
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldnull)
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 4)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 180, 1, 180, 100)
Dim typ15(-1) As Type
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadMethodWithoutParamsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ15))
Typ = Typ03.GetMethod("GetMethod", typ15).ReturnType
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 4)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 182, 1, 182, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldnull)
Dim fa320 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim tru320 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim cont320 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.Emit(OpCodes.Beq, tru320)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, fa320)
LoadMethodWithoutParamsIL.MarkLabel(tru320)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 184, 1, 184, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodWithoutParamsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetInterfaces", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetInterfaces", Type.EmptyTypes).ReturnType
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 1)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 186, 1, 186, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldnull)
Dim fa321 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim tru321 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim cont321 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.Emit(OpCodes.Beq, fa321)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, tru321)
LoadMethodWithoutParamsIL.MarkLabel(tru321)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 187, 1, 187, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldlen)
LoadMethodWithoutParamsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa322 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim tru322 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim cont322 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.Emit(OpCodes.Bgt, tru322)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, fa322)
LoadMethodWithoutParamsIL.MarkLabel(tru322)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 188, 1, 188, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldlen)
LoadMethodWithoutParamsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Sub)
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 3)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 190, 1, 190, 100)
Dim label7 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 191, 1, 191, 100)
Dim label8 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 192, 1, 192, 100)
Dim label9 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 194, 1, 194, 100)
LoadMethodWithoutParamsIL.MarkLabel(label7)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 196, 1, 196, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Add)
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 2)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 198, 1, 198, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldelem, GetType(System.Type).MakeArrayType().GetElementType())
Typ = GetType(System.Type).MakeArrayType().GetElementType()
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 0)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 199, 1, 199, 100)
Dim typ17(-1) As Type
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
LoadMethodWithoutParamsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ17))
Typ = Typ03.GetMethod("GetMethod", typ17).ReturnType
LoadMethodWithoutParamsIL.Emit(OpCodes.Stloc, 4)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 201, 1, 201, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldnull)
Dim fa323 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim tru323 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim cont323 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.Emit(OpCodes.Beq, tru323)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, fa323)
LoadMethodWithoutParamsIL.MarkLabel(tru323)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 202, 1, 202, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont323)
LoadMethodWithoutParamsIL.MarkLabel(fa323)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 203, 1, 203, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, label9)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 204, 1, 204, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont323)
LoadMethodWithoutParamsIL.MarkLabel(cont323)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 206, 1, 206, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
Dim fa324 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim tru324 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim cont324 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.Emit(OpCodes.Beq, tru324)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, fa324)
LoadMethodWithoutParamsIL.MarkLabel(tru324)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 207, 1, 207, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, label8)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 208, 1, 208, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont324)
LoadMethodWithoutParamsIL.MarkLabel(fa324)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 209, 1, 209, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, label7)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 210, 1, 210, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont324)
LoadMethodWithoutParamsIL.MarkLabel(cont324)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 212, 1, 212, 100)
LoadMethodWithoutParamsIL.MarkLabel(label8)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 213, 1, 213, 100)
LoadMethodWithoutParamsIL.MarkLabel(label9)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 215, 1, 215, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont322)
LoadMethodWithoutParamsIL.MarkLabel(fa322)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont322)
LoadMethodWithoutParamsIL.MarkLabel(cont322)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 216, 1, 216, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont321)
LoadMethodWithoutParamsIL.MarkLabel(fa321)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont321)
LoadMethodWithoutParamsIL.MarkLabel(cont321)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 218, 1, 218, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont320)
LoadMethodWithoutParamsIL.MarkLabel(fa320)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont320)
LoadMethodWithoutParamsIL.MarkLabel(cont320)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 220, 1, 220, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldnull)
Dim fa325 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim tru325 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
Dim cont325 As System.Reflection.Emit.Label = LoadMethodWithoutParamsIL.DefineLabel()
LoadMethodWithoutParamsIL.Emit(OpCodes.Beq, fa325)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, tru325)
LoadMethodWithoutParamsIL.MarkLabel(tru325)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 221, 1, 221, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadMethodWithoutParamsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ReturnType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ReturnType", Type.EmptyTypes).ReturnType
LoadMethodWithoutParamsIL.Emit(OpCodes.Stsfld, MemberTyp)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 222, 1, 222, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont325)
LoadMethodWithoutParamsIL.MarkLabel(fa325)
LoadMethodWithoutParamsIL.Emit(OpCodes.Br, cont325)
LoadMethodWithoutParamsIL.MarkLabel(cont325)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 224, 1, 224, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodWithoutParamsIL.MarkSequencePoint(doc6, 226, 1, 226, 100)
LoadMethodWithoutParamsIL.Emit(OpCodes.Ret)
Dim typ19(-1) As Type
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = GetType(System.Type)
Dim GetDelegateInvokeParams As MethodBuilder = Loader.DefineMethod("GetDelegateInvokeParams", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Type).MakeArrayType(), typ19)
Dim GetDelegateInvokeParamsIL As ILGenerator = GetDelegateInvokeParams.GetILGenerator()
Dim GetDelegateInvokeParamsparam01 As ParameterBuilder = GetDelegateInvokeParams.DefineParameter(1, ParameterAttributes.None, "typ")
GetDelegateInvokeParamsIL.MarkSequencePoint(doc6, 230, 1, 230, 100)
Dim locbldr203 As LocalBuilder = GetDelegateInvokeParamsIL.DeclareLocal(GetType(MethodInfo))
locbldr203.SetLocalSymInfo("inv")
Dim typ20(-1) As Type
GetDelegateInvokeParamsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
GetDelegateInvokeParamsIL.Emit(OpCodes.Ldstr, "Invoke")
Typ = GetType(System.String)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
GetDelegateInvokeParamsIL.Emit(OpCodes.Call, LoadMethodWithoutParams)
Typ = LoadMethodWithoutParams.ReturnType
GetDelegateInvokeParamsIL.Emit(OpCodes.Stloc, 0)
GetDelegateInvokeParamsIL.MarkSequencePoint(doc6, 231, 1, 231, 100)
Dim locbldr204 As LocalBuilder = GetDelegateInvokeParamsIL.DeclareLocal(GetType(ParameterInfo).MakeArrayType())
locbldr204.SetLocalSymInfo("ps")
GetDelegateInvokeParamsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(MethodInfo)
Typ03 = Typ
GetDelegateInvokeParamsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetParameters", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetParameters", Type.EmptyTypes).ReturnType
GetDelegateInvokeParamsIL.Emit(OpCodes.Stloc, 1)
GetDelegateInvokeParamsIL.MarkSequencePoint(doc6, 232, 1, 232, 100)
Dim locbldr205 As LocalBuilder = GetDelegateInvokeParamsIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr205.SetLocalSymInfo("ts")
Dim typ22(-1) As Type
GetDelegateInvokeParamsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(ParameterInfo).MakeArrayType()
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
GetDelegateInvokeParamsIL.Emit(OpCodes.Call, ParamsToTyps)
Typ = ParamsToTyps.ReturnType
GetDelegateInvokeParamsIL.Emit(OpCodes.Stloc, 2)
GetDelegateInvokeParamsIL.MarkSequencePoint(doc6, 234, 1, 234, 100)
GetDelegateInvokeParamsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Type).MakeArrayType()
GetDelegateInvokeParamsIL.MarkSequencePoint(doc6, 235, 1, 235, 100)
GetDelegateInvokeParamsIL.Emit(OpCodes.Ret)
Dim typ23(-1) As Type
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.Type)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.Type).MakeArrayType()
Dim LoadMethod As MethodBuilder = Loader.DefineMethod("LoadMethod", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo), typ23)
Dim LoadMethodIL As ILGenerator = LoadMethod.GetILGenerator()
Dim LoadMethodparam01 As ParameterBuilder = LoadMethod.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadMethodparam02 As ParameterBuilder = LoadMethod.DefineParameter(2, ParameterAttributes.None, "name")
Dim LoadMethodparam03 As ParameterBuilder = LoadMethod.DefineParameter(3, ParameterAttributes.None, "typs")
LoadMethodIL.MarkSequencePoint(doc6, 239, 1, 239, 100)
Dim locbldr206 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Type))
locbldr206.SetLocalSymInfo("temptyp")
LoadMethodIL.Emit(OpCodes.Ldnull)
LoadMethodIL.Emit(OpCodes.Stloc, 0)
LoadMethodIL.MarkSequencePoint(doc6, 240, 1, 240, 100)
Dim locbldr207 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr207.SetLocalSymInfo("ints")
LoadMethodIL.Emit(OpCodes.Ldnull)
LoadMethodIL.Emit(OpCodes.Stloc, 1)
LoadMethodIL.MarkSequencePoint(doc6, 241, 1, 241, 100)
Dim locbldr208 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Int32))
locbldr208.SetLocalSymInfo("i")
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Stloc, 2)
LoadMethodIL.MarkSequencePoint(doc6, 242, 1, 242, 100)
Dim locbldr209 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Int32))
locbldr209.SetLocalSymInfo("len")
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Stloc, 3)
LoadMethodIL.MarkSequencePoint(doc6, 243, 1, 243, 100)
Dim locbldr210 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(MethodInfo))
locbldr210.SetLocalSymInfo("mtdinfo")
LoadMethodIL.Emit(OpCodes.Ldnull)
LoadMethodIL.Emit(OpCodes.Stloc, 4)
LoadMethodIL.MarkSequencePoint(doc6, 245, 1, 245, 100)
Dim typ24(-1) As Type
LoadMethodIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ24))
Typ = Typ03.GetMethod("GetMethod", typ24).ReturnType
LoadMethodIL.Emit(OpCodes.Stloc, 4)
LoadMethodIL.MarkSequencePoint(doc6, 247, 1, 247, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa326 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru326 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont326 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, tru326)
LoadMethodIL.Emit(OpCodes.Br, fa326)
LoadMethodIL.MarkLabel(tru326)
LoadMethodIL.MarkSequencePoint(doc6, 249, 1, 249, 100)
LoadMethodIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetInterfaces", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetInterfaces", Type.EmptyTypes).ReturnType
LoadMethodIL.Emit(OpCodes.Stloc, 1)
LoadMethodIL.MarkSequencePoint(doc6, 251, 1, 251, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa327 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru327 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont327 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, fa327)
LoadMethodIL.Emit(OpCodes.Br, tru327)
LoadMethodIL.MarkLabel(tru327)
LoadMethodIL.MarkSequencePoint(doc6, 252, 1, 252, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodIL.Emit(OpCodes.Ldlen)
LoadMethodIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa328 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru328 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont328 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Bgt, tru328)
LoadMethodIL.Emit(OpCodes.Br, fa328)
LoadMethodIL.MarkLabel(tru328)
LoadMethodIL.MarkSequencePoint(doc6, 253, 1, 253, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodIL.Emit(OpCodes.Ldlen)
LoadMethodIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Sub)
LoadMethodIL.Emit(OpCodes.Stloc, 3)
LoadMethodIL.MarkSequencePoint(doc6, 255, 1, 255, 100)
Dim label10 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.MarkSequencePoint(doc6, 256, 1, 256, 100)
Dim label11 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.MarkSequencePoint(doc6, 257, 1, 257, 100)
Dim label12 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.MarkSequencePoint(doc6, 259, 1, 259, 100)
LoadMethodIL.MarkLabel(label10)
LoadMethodIL.MarkSequencePoint(doc6, 261, 1, 261, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Add)
LoadMethodIL.Emit(OpCodes.Stloc, 2)
LoadMethodIL.MarkSequencePoint(doc6, 263, 1, 263, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
LoadMethodIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadMethodIL.Emit(OpCodes.Ldelem, GetType(System.Type).MakeArrayType().GetElementType())
Typ = GetType(System.Type).MakeArrayType().GetElementType()
LoadMethodIL.Emit(OpCodes.Stloc, 0)
LoadMethodIL.MarkSequencePoint(doc6, 264, 1, 264, 100)
Dim typ26(-1) As Type
LoadMethodIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ26))
Typ = Typ03.GetMethod("GetMethod", typ26).ReturnType
LoadMethodIL.Emit(OpCodes.Stloc, 4)
LoadMethodIL.MarkSequencePoint(doc6, 266, 1, 266, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa329 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru329 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont329 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, tru329)
LoadMethodIL.Emit(OpCodes.Br, fa329)
LoadMethodIL.MarkLabel(tru329)
LoadMethodIL.MarkSequencePoint(doc6, 267, 1, 267, 100)
LoadMethodIL.Emit(OpCodes.Br, cont329)
LoadMethodIL.MarkLabel(fa329)
LoadMethodIL.MarkSequencePoint(doc6, 268, 1, 268, 100)
LoadMethodIL.Emit(OpCodes.Br, label12)
LoadMethodIL.MarkSequencePoint(doc6, 269, 1, 269, 100)
LoadMethodIL.Emit(OpCodes.Br, cont329)
LoadMethodIL.MarkLabel(cont329)
LoadMethodIL.MarkSequencePoint(doc6, 271, 1, 271, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
Dim fa330 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru330 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont330 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, tru330)
LoadMethodIL.Emit(OpCodes.Br, fa330)
LoadMethodIL.MarkLabel(tru330)
LoadMethodIL.MarkSequencePoint(doc6, 272, 1, 272, 100)
LoadMethodIL.Emit(OpCodes.Br, label11)
LoadMethodIL.MarkSequencePoint(doc6, 273, 1, 273, 100)
LoadMethodIL.Emit(OpCodes.Br, cont330)
LoadMethodIL.MarkLabel(fa330)
LoadMethodIL.MarkSequencePoint(doc6, 274, 1, 274, 100)
LoadMethodIL.Emit(OpCodes.Br, label10)
LoadMethodIL.MarkSequencePoint(doc6, 275, 1, 275, 100)
LoadMethodIL.Emit(OpCodes.Br, cont330)
LoadMethodIL.MarkLabel(cont330)
LoadMethodIL.MarkSequencePoint(doc6, 277, 1, 277, 100)
LoadMethodIL.MarkLabel(label11)
LoadMethodIL.MarkSequencePoint(doc6, 278, 1, 278, 100)
LoadMethodIL.MarkLabel(label12)
LoadMethodIL.MarkSequencePoint(doc6, 280, 1, 280, 100)
LoadMethodIL.Emit(OpCodes.Br, cont328)
LoadMethodIL.MarkLabel(fa328)
LoadMethodIL.Emit(OpCodes.Br, cont328)
LoadMethodIL.MarkLabel(cont328)
LoadMethodIL.MarkSequencePoint(doc6, 281, 1, 281, 100)
LoadMethodIL.Emit(OpCodes.Br, cont327)
LoadMethodIL.MarkLabel(fa327)
LoadMethodIL.Emit(OpCodes.Br, cont327)
LoadMethodIL.MarkLabel(cont327)
LoadMethodIL.MarkSequencePoint(doc6, 283, 1, 283, 100)
LoadMethodIL.Emit(OpCodes.Br, cont326)
LoadMethodIL.MarkLabel(fa326)
LoadMethodIL.Emit(OpCodes.Br, cont326)
LoadMethodIL.MarkLabel(cont326)
LoadMethodIL.MarkSequencePoint(doc6, 285, 1, 285, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa331 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru331 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont331 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, fa331)
LoadMethodIL.Emit(OpCodes.Br, tru331)
LoadMethodIL.MarkLabel(tru331)
LoadMethodIL.MarkSequencePoint(doc6, 286, 1, 286, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ReturnType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ReturnType", Type.EmptyTypes).ReturnType
LoadMethodIL.Emit(OpCodes.Stsfld, MemberTyp)
LoadMethodIL.MarkSequencePoint(doc6, 287, 1, 287, 100)
LoadMethodIL.Emit(OpCodes.Br, cont331)
LoadMethodIL.MarkLabel(fa331)
LoadMethodIL.Emit(OpCodes.Br, cont331)
LoadMethodIL.MarkLabel(cont331)
LoadMethodIL.MarkSequencePoint(doc6, 289, 1, 289, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.MarkSequencePoint(doc6, 291, 1, 291, 100)
LoadMethodIL.Emit(OpCodes.Ret)
Dim typ28(-1) As Type
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = GetType(System.Type)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = GetType(System.Type).MakeArrayType()
Dim LoadCtor As MethodBuilder = Loader.DefineMethod("LoadCtor", MethodAttributes.Public Or MethodAttributes.Static, GetType(ConstructorInfo), typ28)
Dim LoadCtorIL As ILGenerator = LoadCtor.GetILGenerator()
Dim LoadCtorparam01 As ParameterBuilder = LoadCtor.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadCtorparam02 As ParameterBuilder = LoadCtor.DefineParameter(2, ParameterAttributes.None, "typs")
LoadCtorIL.MarkSequencePoint(doc6, 295, 1, 295, 100)
Dim locbldr211 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(Binder))
locbldr211.SetLocalSymInfo("nullbind")
LoadCtorIL.Emit(OpCodes.Ldnull)
LoadCtorIL.Emit(OpCodes.Stloc, 0)
LoadCtorIL.MarkSequencePoint(doc6, 296, 1, 296, 100)
Dim locbldr212 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(ParameterModifier).MakeArrayType())
locbldr212.SetLocalSymInfo("parammodifs")
LoadCtorIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadCtorIL.Emit(OpCodes.Conv_U)
LoadCtorIL.Emit(OpCodes.Newarr, GetType(ParameterModifier))
LoadCtorIL.Emit(OpCodes.Stloc, 1)
LoadCtorIL.MarkSequencePoint(doc6, 297, 1, 297, 100)
Dim locbldr213 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(BindingFlags))
locbldr213.SetLocalSymInfo("bindflgs")
LoadCtorIL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
LoadCtorIL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
LoadCtorIL.Emit(OpCodes.Or)
LoadCtorIL.Emit(OpCodes.Ldc_I4, CInt(16))
Typ = GetType(System.Int32)
LoadCtorIL.Emit(OpCodes.Or)
LoadCtorIL.Emit(OpCodes.Ldc_I4, CInt(32))
Typ = GetType(System.Int32)
LoadCtorIL.Emit(OpCodes.Or)
LoadCtorIL.Emit(OpCodes.Stloc, 2)
LoadCtorIL.MarkSequencePoint(doc6, 299, 1, 299, 100)
Dim locbldr214 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(ConstructorInfo))
locbldr214.SetLocalSymInfo("ctorinf")
Dim typ29(-1) As Type
LoadCtorIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadCtorIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
LoadCtorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetConstructor", typ29))
Typ = Typ03.GetMethod("GetConstructor", typ29).ReturnType
LoadCtorIL.Emit(OpCodes.Stloc, 3)
LoadCtorIL.MarkSequencePoint(doc6, 301, 1, 301, 100)
LoadCtorIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(ConstructorInfo)
LoadCtorIL.Emit(OpCodes.Ldnull)
Dim fa332 As System.Reflection.Emit.Label = LoadCtorIL.DefineLabel()
Dim tru332 As System.Reflection.Emit.Label = LoadCtorIL.DefineLabel()
Dim cont332 As System.Reflection.Emit.Label = LoadCtorIL.DefineLabel()
LoadCtorIL.Emit(OpCodes.Beq, fa332)
LoadCtorIL.Emit(OpCodes.Br, tru332)
LoadCtorIL.MarkLabel(tru332)
LoadCtorIL.MarkSequencePoint(doc6, 302, 1, 302, 100)
LoadCtorIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
LoadCtorIL.Emit(OpCodes.Stsfld, MemberTyp)
LoadCtorIL.MarkSequencePoint(doc6, 303, 1, 303, 100)
LoadCtorIL.Emit(OpCodes.Br, cont332)
LoadCtorIL.MarkLabel(fa332)
LoadCtorIL.Emit(OpCodes.Br, cont332)
LoadCtorIL.MarkLabel(cont332)
LoadCtorIL.MarkSequencePoint(doc6, 305, 1, 305, 100)
LoadCtorIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(ConstructorInfo)
LoadCtorIL.MarkSequencePoint(doc6, 307, 1, 307, 100)
LoadCtorIL.Emit(OpCodes.Ret)
Dim typ30(-1) As Type
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = GetType(MethodInfo).MakeArrayType()
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = GetType(MethodInfo)
Dim addelemmtdinfo As MethodBuilder = Loader.DefineMethod("addelemmtdinfo", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo).MakeArrayType(), typ30)
Dim addelemmtdinfoIL As ILGenerator = addelemmtdinfo.GetILGenerator()
Dim addelemmtdinfoparam01 As ParameterBuilder = addelemmtdinfo.DefineParameter(1, ParameterAttributes.None, "srcarr")
Dim addelemmtdinfoparam02 As ParameterBuilder = addelemmtdinfo.DefineParameter(2, ParameterAttributes.None, "eltoadd")
addelemmtdinfoIL.MarkSequencePoint(doc6, 311, 1, 311, 100)
Dim locbldr215 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr215.SetLocalSymInfo("len")
addelemmtdinfoIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo).MakeArrayType()
addelemmtdinfoIL.Emit(OpCodes.Ldlen)
addelemmtdinfoIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 0)
addelemmtdinfoIL.MarkSequencePoint(doc6, 312, 1, 312, 100)
Dim locbldr216 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr216.SetLocalSymInfo("destl")
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Add)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 1)
addelemmtdinfoIL.MarkSequencePoint(doc6, 313, 1, 313, 100)
Dim locbldr217 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr217.SetLocalSymInfo("stopel")
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Sub)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 2)
addelemmtdinfoIL.MarkSequencePoint(doc6, 314, 1, 314, 100)
Dim locbldr218 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr218.SetLocalSymInfo("i")
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 3)
addelemmtdinfoIL.MarkSequencePoint(doc6, 316, 1, 316, 100)
Dim locbldr219 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr219.SetLocalSymInfo("destarr")
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Conv_U)
addelemmtdinfoIL.Emit(OpCodes.Newarr, GetType(MethodInfo))
addelemmtdinfoIL.Emit(OpCodes.Stloc, 4)
addelemmtdinfoIL.MarkSequencePoint(doc6, 318, 1, 318, 100)
Dim label13 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.MarkSequencePoint(doc6, 319, 1, 319, 100)
Dim label14 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.MarkSequencePoint(doc6, 321, 1, 321, 100)
addelemmtdinfoIL.MarkLabel(label13)
addelemmtdinfoIL.MarkSequencePoint(doc6, 323, 1, 323, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Add)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 3)
addelemmtdinfoIL.MarkSequencePoint(doc6, 325, 1, 325, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa333 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim tru333 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim cont333 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.Emit(OpCodes.Bgt, tru333)
addelemmtdinfoIL.Emit(OpCodes.Br, fa333)
addelemmtdinfoIL.MarkLabel(tru333)
addelemmtdinfoIL.MarkSequencePoint(doc6, 327, 1, 327, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo).MakeArrayType()
Typ02 = Typ
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Conv_U)
Typ = Typ02
addelemmtdinfoIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo).MakeArrayType()
Typ02 = Typ
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Conv_U)
Typ = Typ02
addelemmtdinfoIL.Emit(OpCodes.Ldelem, GetType(MethodInfo).MakeArrayType().GetElementType())
Typ = GetType(MethodInfo).MakeArrayType().GetElementType()
addelemmtdinfoIL.Emit(OpCodes.Stelem, GetType(MethodInfo).MakeArrayType().GetElementType())
addelemmtdinfoIL.MarkSequencePoint(doc6, 329, 1, 329, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont333)
addelemmtdinfoIL.MarkLabel(fa333)
addelemmtdinfoIL.Emit(OpCodes.Br, cont333)
addelemmtdinfoIL.MarkLabel(cont333)
addelemmtdinfoIL.MarkSequencePoint(doc6, 331, 1, 331, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa334 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim tru334 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim cont334 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.Emit(OpCodes.Beq, tru334)
addelemmtdinfoIL.Emit(OpCodes.Br, fa334)
addelemmtdinfoIL.MarkLabel(tru334)
addelemmtdinfoIL.MarkSequencePoint(doc6, 332, 1, 332, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, label14)
addelemmtdinfoIL.MarkSequencePoint(doc6, 333, 1, 333, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont334)
addelemmtdinfoIL.MarkLabel(fa334)
addelemmtdinfoIL.MarkSequencePoint(doc6, 334, 1, 334, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa335 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim tru335 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim cont335 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.Emit(OpCodes.Beq, fa335)
addelemmtdinfoIL.Emit(OpCodes.Br, tru335)
addelemmtdinfoIL.MarkLabel(tru335)
addelemmtdinfoIL.MarkSequencePoint(doc6, 335, 1, 335, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, label13)
addelemmtdinfoIL.MarkSequencePoint(doc6, 336, 1, 336, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont335)
addelemmtdinfoIL.MarkLabel(fa335)
addelemmtdinfoIL.MarkSequencePoint(doc6, 337, 1, 337, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, label14)
addelemmtdinfoIL.MarkSequencePoint(doc6, 338, 1, 338, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont335)
addelemmtdinfoIL.MarkLabel(cont335)
addelemmtdinfoIL.MarkSequencePoint(doc6, 339, 1, 339, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont334)
addelemmtdinfoIL.MarkLabel(cont334)
addelemmtdinfoIL.MarkSequencePoint(doc6, 341, 1, 341, 100)
addelemmtdinfoIL.MarkLabel(label14)
addelemmtdinfoIL.MarkSequencePoint(doc6, 343, 1, 343, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo).MakeArrayType()
Typ02 = Typ
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Conv_U)
Typ = Typ02
addelemmtdinfoIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(MethodInfo)
addelemmtdinfoIL.Emit(OpCodes.Stelem, GetType(MethodInfo).MakeArrayType().GetElementType())
addelemmtdinfoIL.MarkSequencePoint(doc6, 345, 1, 345, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo).MakeArrayType()
addelemmtdinfoIL.MarkSequencePoint(doc6, 347, 1, 347, 100)
addelemmtdinfoIL.Emit(OpCodes.Ret)
Dim typ31(-1) As Type
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = GetType(System.Type)
Dim LoadSpecMtds As MethodBuilder = Loader.DefineMethod("LoadSpecMtds", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo).MakeArrayType(), typ31)
Dim LoadSpecMtdsIL As ILGenerator = LoadSpecMtds.GetILGenerator()
Dim LoadSpecMtdsparam01 As ParameterBuilder = LoadSpecMtds.DefineParameter(1, ParameterAttributes.None, "typ")
LoadSpecMtdsIL.MarkSequencePoint(doc6, 351, 1, 351, 100)
Dim locbldr220 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(System.Int32))
locbldr220.SetLocalSymInfo("i")
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 0)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 352, 1, 352, 100)
Dim locbldr221 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(MethodInfo))
locbldr221.SetLocalSymInfo("mtdinfo")
LoadSpecMtdsIL.Emit(OpCodes.Ldnull)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 1)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 353, 1, 353, 100)
Dim locbldr222 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr222.SetLocalSymInfo("mtdinfos")
LoadSpecMtdsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadSpecMtdsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethods", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetMethods", Type.EmptyTypes).ReturnType
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 2)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 354, 1, 354, 100)
Dim locbldr223 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr223.SetLocalSymInfo("mtdinfog")
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Conv_U)
LoadSpecMtdsIL.Emit(OpCodes.Newarr, GetType(MethodInfo))
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 3)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 355, 1, 355, 100)
Dim locbldr224 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(System.Int32))
locbldr224.SetLocalSymInfo("len")
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo).MakeArrayType()
LoadSpecMtdsIL.Emit(OpCodes.Ldlen)
LoadSpecMtdsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Sub)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 4)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 356, 1, 356, 100)
Dim locbldr225 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(System.Boolean))
locbldr225.SetLocalSymInfo("b")
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 5)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 358, 1, 358, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo).MakeArrayType()
LoadSpecMtdsIL.Emit(OpCodes.Ldlen)
LoadSpecMtdsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa336 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim tru336 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim cont336 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.Emit(OpCodes.Bgt, tru336)
LoadSpecMtdsIL.Emit(OpCodes.Br, fa336)
LoadSpecMtdsIL.MarkLabel(tru336)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 360, 1, 360, 100)
Dim label15 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.MarkSequencePoint(doc6, 361, 1, 361, 100)
Dim label16 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.MarkSequencePoint(doc6, 363, 1, 363, 100)
LoadSpecMtdsIL.MarkLabel(label15)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 365, 1, 365, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Add)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 0)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 367, 1, 367, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo).MakeArrayType()
Typ02 = Typ
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadSpecMtdsIL.Emit(OpCodes.Ldelem, GetType(MethodInfo).MakeArrayType().GetElementType())
Typ = GetType(MethodInfo).MakeArrayType().GetElementType()
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 1)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 368, 1, 368, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadSpecMtdsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsSpecialName", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsSpecialName", Type.EmptyTypes).ReturnType
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 5)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 369, 1, 369, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa337 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim tru337 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim cont337 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.Emit(OpCodes.Beq, tru337)
LoadSpecMtdsIL.Emit(OpCodes.Br, fa337)
LoadSpecMtdsIL.MarkLabel(tru337)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 370, 1, 370, 100)
Dim typ34(-1) As Type
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(MethodInfo)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
LoadSpecMtdsIL.Emit(OpCodes.Call, addelemmtdinfo)
Typ = addelemmtdinfo.ReturnType
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 3)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 371, 1, 371, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont337)
LoadSpecMtdsIL.MarkLabel(fa337)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont337)
LoadSpecMtdsIL.MarkLabel(cont337)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 374, 1, 374, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
Dim fa338 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim tru338 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim cont338 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.Emit(OpCodes.Beq, tru338)
LoadSpecMtdsIL.Emit(OpCodes.Br, fa338)
LoadSpecMtdsIL.MarkLabel(tru338)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 375, 1, 375, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, label16)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 376, 1, 376, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont338)
LoadSpecMtdsIL.MarkLabel(fa338)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 377, 1, 377, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, label15)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 378, 1, 378, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont338)
LoadSpecMtdsIL.MarkLabel(cont338)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 380, 1, 380, 100)
LoadSpecMtdsIL.MarkLabel(label16)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 382, 1, 382, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont336)
LoadSpecMtdsIL.MarkLabel(fa336)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont336)
LoadSpecMtdsIL.MarkLabel(cont336)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 385, 1, 385, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadSpecMtdsIL.MarkSequencePoint(doc6, 387, 1, 387, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ret)
Dim typ35(-1) As Type
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = GetType(ParameterInfo).MakeArrayType()
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = GetType(System.Type).MakeArrayType()
Dim CompareParamsToTyps As MethodBuilder = Loader.DefineMethod("CompareParamsToTyps", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Boolean), typ35)
Dim CompareParamsToTypsIL As ILGenerator = CompareParamsToTyps.GetILGenerator()
Dim CompareParamsToTypsparam01 As ParameterBuilder = CompareParamsToTyps.DefineParameter(1, ParameterAttributes.None, "t1")
Dim CompareParamsToTypsparam02 As ParameterBuilder = CompareParamsToTyps.DefineParameter(2, ParameterAttributes.None, "t2")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 391, 1, 391, 100)
Dim locbldr226 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Boolean))
locbldr226.SetLocalSymInfo("ans")
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 0)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 392, 1, 392, 100)
Dim locbldr227 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Boolean))
locbldr227.SetLocalSymInfo("b")
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 1)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 393, 1, 393, 100)
Dim locbldr228 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(ParameterInfo))
locbldr228.SetLocalSymInfo("p")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 394, 1, 394, 100)
Dim locbldr229 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Type))
locbldr229.SetLocalSymInfo("ta")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 395, 1, 395, 100)
Dim locbldr230 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Type))
locbldr230.SetLocalSymInfo("tb")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 397, 1, 397, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ParameterInfo).MakeArrayType()
CompareParamsToTypsIL.Emit(OpCodes.Ldlen)
CompareParamsToTypsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Type).MakeArrayType()
CompareParamsToTypsIL.Emit(OpCodes.Ldlen)
CompareParamsToTypsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
Dim fa339 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim tru339 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim cont339 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.Emit(OpCodes.Beq, tru339)
CompareParamsToTypsIL.Emit(OpCodes.Br, fa339)
CompareParamsToTypsIL.MarkLabel(tru339)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 399, 1, 399, 100)
Dim locbldr231 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Int32))
locbldr231.SetLocalSymInfo("i")
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 5)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 400, 1, 400, 100)
Dim locbldr232 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Int32))
locbldr232.SetLocalSymInfo("len")
CompareParamsToTypsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ParameterInfo).MakeArrayType()
CompareParamsToTypsIL.Emit(OpCodes.Ldlen)
CompareParamsToTypsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Sub)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 6)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 402, 1, 402, 100)
Dim label17 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.MarkSequencePoint(doc6, 403, 1, 403, 100)
Dim label18 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.MarkSequencePoint(doc6, 405, 1, 405, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ParameterInfo).MakeArrayType()
CompareParamsToTypsIL.Emit(OpCodes.Ldlen)
CompareParamsToTypsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa340 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim tru340 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim cont340 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.Emit(OpCodes.Beq, tru340)
CompareParamsToTypsIL.Emit(OpCodes.Br, fa340)
CompareParamsToTypsIL.MarkLabel(tru340)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 406, 1, 406, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 0)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 407, 1, 407, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, label18)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 408, 1, 408, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont340)
CompareParamsToTypsIL.MarkLabel(fa340)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont340)
CompareParamsToTypsIL.MarkLabel(cont340)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 410, 1, 410, 100)
CompareParamsToTypsIL.MarkLabel(label17)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 412, 1, 412, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Add)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 5)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 414, 1, 414, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ParameterInfo).MakeArrayType()
Typ02 = Typ
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Conv_U)
Typ = Typ02
CompareParamsToTypsIL.Emit(OpCodes.Ldelem, GetType(ParameterInfo).MakeArrayType().GetElementType())
Typ = GetType(ParameterInfo).MakeArrayType().GetElementType()
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 2)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 415, 1, 415, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(ParameterInfo)
Typ03 = Typ
CompareParamsToTypsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ParameterType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ParameterType", Type.EmptyTypes).ReturnType
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 3)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 416, 1, 416, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Conv_U)
Typ = Typ02
CompareParamsToTypsIL.Emit(OpCodes.Ldelem, GetType(System.Type).MakeArrayType().GetElementType())
Typ = GetType(System.Type).MakeArrayType().GetElementType()
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 4)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 417, 1, 417, 100)
Dim typ37(-1) As Type
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Type)
Typ03 = Typ
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Type)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
CompareParamsToTypsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ37))
Typ = Typ03.GetMethod("Equals", typ37).ReturnType
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 1)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 419, 1, 419, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
Dim fa341 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim tru341 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim cont341 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.Emit(OpCodes.Beq, tru341)
CompareParamsToTypsIL.Emit(OpCodes.Br, fa341)
CompareParamsToTypsIL.MarkLabel(tru341)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 420, 1, 420, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 0)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 421, 1, 421, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, label18)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 422, 1, 422, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont341)
CompareParamsToTypsIL.MarkLabel(fa341)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont341)
CompareParamsToTypsIL.MarkLabel(cont341)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 424, 1, 424, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Int32)
Dim fa342 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim tru342 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim cont342 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.Emit(OpCodes.Beq, tru342)
CompareParamsToTypsIL.Emit(OpCodes.Br, fa342)
CompareParamsToTypsIL.MarkLabel(tru342)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 425, 1, 425, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, label18)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 426, 1, 426, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont342)
CompareParamsToTypsIL.MarkLabel(fa342)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 427, 1, 427, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, label17)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 428, 1, 428, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont342)
CompareParamsToTypsIL.MarkLabel(cont342)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 430, 1, 430, 100)
CompareParamsToTypsIL.MarkLabel(label18)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 432, 1, 432, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont339)
CompareParamsToTypsIL.MarkLabel(fa339)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 433, 1, 433, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 0)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 434, 1, 434, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont339)
CompareParamsToTypsIL.MarkLabel(cont339)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 436, 1, 436, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 437, 1, 437, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ret)
Dim typ38(-1) As Type
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = GetType(System.Type)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = GetType(System.Type)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = GetType(System.Type)
Dim LoadBinOp As MethodBuilder = Loader.DefineMethod("LoadBinOp", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo), typ38)
Dim LoadBinOpIL As ILGenerator = LoadBinOp.GetILGenerator()
Dim LoadBinOpparam01 As ParameterBuilder = LoadBinOp.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadBinOpparam02 As ParameterBuilder = LoadBinOp.DefineParameter(2, ParameterAttributes.None, "name")
Dim LoadBinOpparam03 As ParameterBuilder = LoadBinOp.DefineParameter(3, ParameterAttributes.None, "typa")
Dim LoadBinOpparam04 As ParameterBuilder = LoadBinOp.DefineParameter(4, ParameterAttributes.None, "typb")
LoadBinOpIL.MarkSequencePoint(doc6, 441, 1, 441, 100)
Dim locbldr233 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr233.SetLocalSymInfo("typs")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Conv_U)
LoadBinOpIL.Emit(OpCodes.Newarr, GetType(System.Type))
LoadBinOpIL.Emit(OpCodes.Stloc, 0)
LoadBinOpIL.MarkSequencePoint(doc6, 442, 1, 442, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadBinOpIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.Type)
LoadBinOpIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
LoadBinOpIL.MarkSequencePoint(doc6, 443, 1, 443, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadBinOpIL.Emit(OpCodes.Ldarg, 3)
Typ = GetType(System.Type)
LoadBinOpIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
LoadBinOpIL.MarkSequencePoint(doc6, 444, 1, 444, 100)
Dim locbldr234 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Int32))
locbldr234.SetLocalSymInfo("i")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Stloc, 1)
LoadBinOpIL.MarkSequencePoint(doc6, 445, 1, 445, 100)
Dim locbldr235 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(MethodInfo))
locbldr235.SetLocalSymInfo("mtdinfo")
LoadBinOpIL.Emit(OpCodes.Ldnull)
LoadBinOpIL.Emit(OpCodes.Stloc, 2)
LoadBinOpIL.MarkSequencePoint(doc6, 446, 1, 446, 100)
Dim locbldr236 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr236.SetLocalSymInfo("mtdinfos")
Dim typ39(-1) As Type
LoadBinOpIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
LoadBinOpIL.Emit(OpCodes.Call, LoadSpecMtds)
Typ = LoadSpecMtds.ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 3)
LoadBinOpIL.MarkSequencePoint(doc6, 447, 1, 447, 100)
Dim locbldr237 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Int32))
locbldr237.SetLocalSymInfo("len")
LoadBinOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadBinOpIL.Emit(OpCodes.Ldlen)
LoadBinOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Sub)
LoadBinOpIL.Emit(OpCodes.Stloc, 4)
LoadBinOpIL.MarkSequencePoint(doc6, 448, 1, 448, 100)
Dim locbldr238 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Boolean))
locbldr238.SetLocalSymInfo("b")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadBinOpIL.Emit(OpCodes.Stloc, 5)
LoadBinOpIL.MarkSequencePoint(doc6, 449, 1, 449, 100)
Dim locbldr239 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Int32))
locbldr239.SetLocalSymInfo("comp")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Stloc, 6)
LoadBinOpIL.MarkSequencePoint(doc6, 450, 1, 450, 100)
Dim locbldr240 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.String))
locbldr240.SetLocalSymInfo("nstr")
LoadBinOpIL.MarkSequencePoint(doc6, 451, 1, 451, 100)
Dim locbldr241 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(ParameterInfo).MakeArrayType())
locbldr241.SetLocalSymInfo("ps")
LoadBinOpIL.MarkSequencePoint(doc6, 453, 1, 453, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadBinOpIL.Emit(OpCodes.Ldlen)
LoadBinOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa343 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru343 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont343 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Bgt, tru343)
LoadBinOpIL.Emit(OpCodes.Br, fa343)
LoadBinOpIL.MarkLabel(tru343)
LoadBinOpIL.MarkSequencePoint(doc6, 455, 1, 455, 100)
Dim label19 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.MarkSequencePoint(doc6, 456, 1, 456, 100)
Dim label20 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.MarkSequencePoint(doc6, 458, 1, 458, 100)
LoadBinOpIL.MarkLabel(label19)
LoadBinOpIL.MarkSequencePoint(doc6, 460, 1, 460, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Add)
LoadBinOpIL.Emit(OpCodes.Stloc, 1)
LoadBinOpIL.MarkSequencePoint(doc6, 462, 1, 462, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
Typ02 = Typ
LoadBinOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadBinOpIL.Emit(OpCodes.Ldelem, GetType(MethodInfo).MakeArrayType().GetElementType())
Typ = GetType(MethodInfo).MakeArrayType().GetElementType()
LoadBinOpIL.Emit(OpCodes.Stloc, 2)
LoadBinOpIL.MarkSequencePoint(doc6, 463, 1, 463, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadBinOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Name", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Name", Type.EmptyTypes).ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 7)
LoadBinOpIL.MarkSequencePoint(doc6, 464, 1, 464, 100)
Dim typ41(-1) As Type
LoadBinOpIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
LoadBinOpIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
LoadBinOpIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ41))
Typ = GetType(String).GetMethod("Compare", typ41).ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 6)
LoadBinOpIL.MarkSequencePoint(doc6, 466, 1, 466, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa344 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru344 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont344 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Beq, tru344)
LoadBinOpIL.Emit(OpCodes.Br, fa344)
LoadBinOpIL.MarkLabel(tru344)
LoadBinOpIL.MarkSequencePoint(doc6, 468, 1, 468, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadBinOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetParameters", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetParameters", Type.EmptyTypes).ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 8)
LoadBinOpIL.MarkSequencePoint(doc6, 469, 1, 469, 100)
Dim typ43(-1) As Type
LoadBinOpIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(ParameterInfo).MakeArrayType()
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
LoadBinOpIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
LoadBinOpIL.Emit(OpCodes.Call, CompareParamsToTyps)
Typ = CompareParamsToTyps.ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 5)
LoadBinOpIL.MarkSequencePoint(doc6, 471, 1, 471, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa345 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru345 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont345 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Beq, tru345)
LoadBinOpIL.Emit(OpCodes.Br, fa345)
LoadBinOpIL.MarkLabel(tru345)
LoadBinOpIL.MarkSequencePoint(doc6, 472, 1, 472, 100)
LoadBinOpIL.Emit(OpCodes.Br, label20)
LoadBinOpIL.MarkSequencePoint(doc6, 473, 1, 473, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont345)
LoadBinOpIL.MarkLabel(fa345)
LoadBinOpIL.MarkSequencePoint(doc6, 474, 1, 474, 100)
LoadBinOpIL.Emit(OpCodes.Ldnull)
LoadBinOpIL.Emit(OpCodes.Stloc, 2)
LoadBinOpIL.MarkSequencePoint(doc6, 475, 1, 475, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont345)
LoadBinOpIL.MarkLabel(cont345)
LoadBinOpIL.MarkSequencePoint(doc6, 477, 1, 477, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont344)
LoadBinOpIL.MarkLabel(fa344)
LoadBinOpIL.MarkSequencePoint(doc6, 478, 1, 478, 100)
LoadBinOpIL.Emit(OpCodes.Ldnull)
LoadBinOpIL.Emit(OpCodes.Stloc, 2)
LoadBinOpIL.MarkSequencePoint(doc6, 479, 1, 479, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont344)
LoadBinOpIL.MarkLabel(cont344)
LoadBinOpIL.MarkSequencePoint(doc6, 481, 1, 481, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
Dim fa346 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru346 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont346 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Beq, tru346)
LoadBinOpIL.Emit(OpCodes.Br, fa346)
LoadBinOpIL.MarkLabel(tru346)
LoadBinOpIL.MarkSequencePoint(doc6, 482, 1, 482, 100)
LoadBinOpIL.Emit(OpCodes.Br, label20)
LoadBinOpIL.MarkSequencePoint(doc6, 483, 1, 483, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont346)
LoadBinOpIL.MarkLabel(fa346)
LoadBinOpIL.MarkSequencePoint(doc6, 484, 1, 484, 100)
LoadBinOpIL.Emit(OpCodes.Br, label19)
LoadBinOpIL.MarkSequencePoint(doc6, 485, 1, 485, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont346)
LoadBinOpIL.MarkLabel(cont346)
LoadBinOpIL.MarkSequencePoint(doc6, 487, 1, 487, 100)
LoadBinOpIL.MarkLabel(label20)
LoadBinOpIL.MarkSequencePoint(doc6, 489, 1, 489, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont343)
LoadBinOpIL.MarkLabel(fa343)
LoadBinOpIL.Emit(OpCodes.Br, cont343)
LoadBinOpIL.MarkLabel(cont343)
LoadBinOpIL.MarkSequencePoint(doc6, 492, 1, 492, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
LoadBinOpIL.MarkSequencePoint(doc6, 494, 1, 494, 100)
LoadBinOpIL.Emit(OpCodes.Ret)
Dim typ44(-1) As Type
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = GetType(System.Type)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = GetType(System.String)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = GetType(System.Type)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = GetType(System.Type)
Dim LoadConvOp As MethodBuilder = Loader.DefineMethod("LoadConvOp", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo), typ44)
Dim LoadConvOpIL As ILGenerator = LoadConvOp.GetILGenerator()
Dim LoadConvOpparam01 As ParameterBuilder = LoadConvOp.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadConvOpparam02 As ParameterBuilder = LoadConvOp.DefineParameter(2, ParameterAttributes.None, "name")
Dim LoadConvOpparam03 As ParameterBuilder = LoadConvOp.DefineParameter(3, ParameterAttributes.None, "src")
Dim LoadConvOpparam04 As ParameterBuilder = LoadConvOp.DefineParameter(4, ParameterAttributes.None, "snk")
LoadConvOpIL.MarkSequencePoint(doc6, 498, 1, 498, 100)
Dim locbldr242 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr242.SetLocalSymInfo("typs")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Conv_U)
LoadConvOpIL.Emit(OpCodes.Newarr, GetType(System.Type))
LoadConvOpIL.Emit(OpCodes.Stloc, 0)
LoadConvOpIL.MarkSequencePoint(doc6, 499, 1, 499, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadConvOpIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.Type)
LoadConvOpIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
LoadConvOpIL.MarkSequencePoint(doc6, 500, 1, 500, 100)
Dim locbldr243 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Int32))
locbldr243.SetLocalSymInfo("i")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Stloc, 1)
LoadConvOpIL.MarkSequencePoint(doc6, 501, 1, 501, 100)
Dim locbldr244 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(MethodInfo))
locbldr244.SetLocalSymInfo("mtdinfo")
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 502, 1, 502, 100)
Dim locbldr245 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr245.SetLocalSymInfo("mtdinfos")
Dim typ45(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
LoadConvOpIL.Emit(OpCodes.Call, LoadSpecMtds)
Typ = LoadSpecMtds.ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 3)
LoadConvOpIL.MarkSequencePoint(doc6, 503, 1, 503, 100)
Dim locbldr246 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Int32))
locbldr246.SetLocalSymInfo("len")
LoadConvOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadConvOpIL.Emit(OpCodes.Ldlen)
LoadConvOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Sub)
LoadConvOpIL.Emit(OpCodes.Stloc, 4)
LoadConvOpIL.MarkSequencePoint(doc6, 504, 1, 504, 100)
Dim locbldr247 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Boolean))
locbldr247.SetLocalSymInfo("b")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadConvOpIL.Emit(OpCodes.Stloc, 5)
LoadConvOpIL.MarkSequencePoint(doc6, 505, 1, 505, 100)
Dim locbldr248 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Int32))
locbldr248.SetLocalSymInfo("comp")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Stloc, 6)
LoadConvOpIL.MarkSequencePoint(doc6, 506, 1, 506, 100)
Dim locbldr249 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.String))
locbldr249.SetLocalSymInfo("nstr")
LoadConvOpIL.MarkSequencePoint(doc6, 507, 1, 507, 100)
Dim locbldr250 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(ParameterInfo).MakeArrayType())
locbldr250.SetLocalSymInfo("ps")
LoadConvOpIL.MarkSequencePoint(doc6, 508, 1, 508, 100)
Dim locbldr251 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Type))
locbldr251.SetLocalSymInfo("rett")
LoadConvOpIL.MarkSequencePoint(doc6, 510, 1, 510, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadConvOpIL.Emit(OpCodes.Ldlen)
LoadConvOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa347 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru347 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont347 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Bgt, tru347)
LoadConvOpIL.Emit(OpCodes.Br, fa347)
LoadConvOpIL.MarkLabel(tru347)
LoadConvOpIL.MarkSequencePoint(doc6, 512, 1, 512, 100)
Dim label21 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.MarkSequencePoint(doc6, 513, 1, 513, 100)
Dim label22 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.MarkSequencePoint(doc6, 515, 1, 515, 100)
LoadConvOpIL.MarkLabel(label21)
LoadConvOpIL.MarkSequencePoint(doc6, 517, 1, 517, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Add)
LoadConvOpIL.Emit(OpCodes.Stloc, 1)
LoadConvOpIL.MarkSequencePoint(doc6, 519, 1, 519, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
Typ02 = Typ
LoadConvOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Conv_U)
Typ = Typ02
LoadConvOpIL.Emit(OpCodes.Ldelem, GetType(MethodInfo).MakeArrayType().GetElementType())
Typ = GetType(MethodInfo).MakeArrayType().GetElementType()
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 520, 1, 520, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Name", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Name", Type.EmptyTypes).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 7)
LoadConvOpIL.MarkSequencePoint(doc6, 521, 1, 521, 100)
Dim typ47(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
LoadConvOpIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
LoadConvOpIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ47))
Typ = GetType(String).GetMethod("Compare", typ47).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 6)
LoadConvOpIL.MarkSequencePoint(doc6, 523, 1, 523, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa348 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru348 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont348 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru348)
LoadConvOpIL.Emit(OpCodes.Br, fa348)
LoadConvOpIL.MarkLabel(tru348)
LoadConvOpIL.MarkSequencePoint(doc6, 525, 1, 525, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetParameters", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetParameters", Type.EmptyTypes).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 8)
LoadConvOpIL.MarkSequencePoint(doc6, 526, 1, 526, 100)
Dim typ49(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(ParameterInfo).MakeArrayType()
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
LoadConvOpIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
LoadConvOpIL.Emit(OpCodes.Call, CompareParamsToTyps)
Typ = CompareParamsToTyps.ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 5)
LoadConvOpIL.MarkSequencePoint(doc6, 528, 1, 528, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa349 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru349 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont349 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru349)
LoadConvOpIL.Emit(OpCodes.Br, fa349)
LoadConvOpIL.MarkLabel(tru349)
LoadConvOpIL.MarkSequencePoint(doc6, 530, 1, 530, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ReturnType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ReturnType", Type.EmptyTypes).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 9)
LoadConvOpIL.MarkSequencePoint(doc6, 531, 1, 531, 100)
Dim typ51(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.Type)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Ldarg, 3)
Typ = GetType(System.Type)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ51))
Typ = Typ03.GetMethod("Equals", typ51).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 5)
LoadConvOpIL.MarkSequencePoint(doc6, 533, 1, 533, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa350 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru350 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont350 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru350)
LoadConvOpIL.Emit(OpCodes.Br, fa350)
LoadConvOpIL.MarkLabel(tru350)
LoadConvOpIL.MarkSequencePoint(doc6, 534, 1, 534, 100)
LoadConvOpIL.Emit(OpCodes.Br, label22)
LoadConvOpIL.MarkSequencePoint(doc6, 535, 1, 535, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont350)
LoadConvOpIL.MarkLabel(fa350)
LoadConvOpIL.MarkSequencePoint(doc6, 536, 1, 536, 100)
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 537, 1, 537, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont350)
LoadConvOpIL.MarkLabel(cont350)
LoadConvOpIL.MarkSequencePoint(doc6, 539, 1, 539, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont349)
LoadConvOpIL.MarkLabel(fa349)
LoadConvOpIL.MarkSequencePoint(doc6, 540, 1, 540, 100)
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 541, 1, 541, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont349)
LoadConvOpIL.MarkLabel(cont349)
LoadConvOpIL.MarkSequencePoint(doc6, 543, 1, 543, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont348)
LoadConvOpIL.MarkLabel(fa348)
LoadConvOpIL.MarkSequencePoint(doc6, 544, 1, 544, 100)
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 545, 1, 545, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont348)
LoadConvOpIL.MarkLabel(cont348)
LoadConvOpIL.MarkSequencePoint(doc6, 547, 1, 547, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
Dim fa351 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru351 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont351 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru351)
LoadConvOpIL.Emit(OpCodes.Br, fa351)
LoadConvOpIL.MarkLabel(tru351)
LoadConvOpIL.MarkSequencePoint(doc6, 548, 1, 548, 100)
LoadConvOpIL.Emit(OpCodes.Br, label22)
LoadConvOpIL.MarkSequencePoint(doc6, 549, 1, 549, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont351)
LoadConvOpIL.MarkLabel(fa351)
LoadConvOpIL.MarkSequencePoint(doc6, 550, 1, 550, 100)
LoadConvOpIL.Emit(OpCodes.Br, label21)
LoadConvOpIL.MarkSequencePoint(doc6, 551, 1, 551, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont351)
LoadConvOpIL.MarkLabel(cont351)
LoadConvOpIL.MarkSequencePoint(doc6, 553, 1, 553, 100)
LoadConvOpIL.MarkLabel(label22)
LoadConvOpIL.MarkSequencePoint(doc6, 555, 1, 555, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont347)
LoadConvOpIL.MarkLabel(fa347)
LoadConvOpIL.Emit(OpCodes.Br, cont347)
LoadConvOpIL.MarkLabel(cont347)
LoadConvOpIL.MarkSequencePoint(doc6, 558, 1, 558, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
LoadConvOpIL.MarkSequencePoint(doc6, 560, 1, 560, 100)
LoadConvOpIL.Emit(OpCodes.Ret)
Dim typ52(-1) As Type
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = GetType(System.Type)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = GetType(System.String)
Dim LoadField As MethodBuilder = Loader.DefineMethod("LoadField", MethodAttributes.Public Or MethodAttributes.Static, GetType(FieldInfo), typ52)
Dim LoadFieldIL As ILGenerator = LoadField.GetILGenerator()
Dim LoadFieldparam01 As ParameterBuilder = LoadField.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadFieldparam02 As ParameterBuilder = LoadField.DefineParameter(2, ParameterAttributes.None, "name")
LoadFieldIL.MarkSequencePoint(doc6, 566, 1, 566, 100)
Dim locbldr252 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(System.Type))
locbldr252.SetLocalSymInfo("temptyp")
LoadFieldIL.Emit(OpCodes.Ldnull)
LoadFieldIL.Emit(OpCodes.Stloc, 0)
LoadFieldIL.MarkSequencePoint(doc6, 567, 1, 567, 100)
Dim locbldr253 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(FieldInfo))
locbldr253.SetLocalSymInfo("fldinfo")
LoadFieldIL.Emit(OpCodes.Ldnull)
LoadFieldIL.Emit(OpCodes.Stloc, 1)
LoadFieldIL.MarkSequencePoint(doc6, 569, 1, 569, 100)
Dim typ53(-1) As Type
LoadFieldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetField", typ53))
Typ = Typ03.GetMethod("GetField", typ53).ReturnType
LoadFieldIL.Emit(OpCodes.Stloc, 1)
LoadFieldIL.MarkSequencePoint(doc6, 571, 1, 571, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
LoadFieldIL.Emit(OpCodes.Ldnull)
Dim fa352 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim tru352 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim cont352 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
LoadFieldIL.Emit(OpCodes.Beq, fa352)
LoadFieldIL.Emit(OpCodes.Br, tru352)
LoadFieldIL.MarkLabel(tru352)
LoadFieldIL.MarkSequencePoint(doc6, 572, 1, 572, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_FieldType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_FieldType", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, MemberTyp)
LoadFieldIL.MarkSequencePoint(doc6, 573, 1, 573, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsLiteral", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsLiteral", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, FldLitFlag)
LoadFieldIL.MarkSequencePoint(doc6, 574, 1, 574, 100)
LoadFieldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsEnum", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsEnum", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, EnumLitFlag)
LoadFieldIL.MarkSequencePoint(doc6, 575, 1, 575, 100)
Dim locbldr254 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(System.Object))
locbldr254.SetLocalSymInfo("nullref")
LoadFieldIL.Emit(OpCodes.Ldnull)
LoadFieldIL.Emit(OpCodes.Stloc, 2)
LoadFieldIL.MarkSequencePoint(doc6, 576, 1, 576, 100)
LoadFieldIL.Emit(OpCodes.Ldsfld, FldLitFlag)
Typ = FldLitFlag.FieldType
LoadFieldIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa353 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim tru353 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim cont353 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
LoadFieldIL.Emit(OpCodes.Beq, tru353)
LoadFieldIL.Emit(OpCodes.Br, fa353)
LoadFieldIL.MarkLabel(tru353)
LoadFieldIL.MarkSequencePoint(doc6, 577, 1, 577, 100)
Dim typ57(-1) As Type
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Object)
ReDim Preserve typ57(UBound(typ57) + 1)
typ57(UBound(typ57)) = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetValue", typ57))
Typ = Typ03.GetMethod("GetValue", typ57).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, FldLitVal)
LoadFieldIL.MarkSequencePoint(doc6, 578, 1, 578, 100)
Dim locbldr255 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(System.Object))
locbldr255.SetLocalSymInfo("obj")
LoadFieldIL.Emit(OpCodes.Ldsfld, FldLitVal)
Typ = FldLitVal.FieldType
LoadFieldIL.Emit(OpCodes.Stloc, 3)
LoadFieldIL.MarkSequencePoint(doc6, 579, 1, 579, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Object)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetType", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetType", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, FldLitTyp)
LoadFieldIL.MarkSequencePoint(doc6, 580, 1, 580, 100)
LoadFieldIL.Emit(OpCodes.Br, cont353)
LoadFieldIL.MarkLabel(fa353)
LoadFieldIL.Emit(OpCodes.Br, cont353)
LoadFieldIL.MarkLabel(cont353)
LoadFieldIL.MarkSequencePoint(doc6, 581, 1, 581, 100)
LoadFieldIL.Emit(OpCodes.Ldsfld, EnumLitFlag)
Typ = EnumLitFlag.FieldType
LoadFieldIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa354 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim tru354 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim cont354 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
LoadFieldIL.Emit(OpCodes.Beq, tru354)
LoadFieldIL.Emit(OpCodes.Br, fa354)
LoadFieldIL.MarkLabel(tru354)
LoadFieldIL.MarkSequencePoint(doc6, 582, 1, 582, 100)
Dim typ59(-1) As Type
LoadFieldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
LoadFieldIL.Emit(OpCodes.Call, GetType(System.Enum).GetMethod("GetUnderlyingType", typ59))
Typ = GetType(System.Enum).GetMethod("GetUnderlyingType", typ59).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, EnumLitTyp)
LoadFieldIL.MarkSequencePoint(doc6, 583, 1, 583, 100)
LoadFieldIL.Emit(OpCodes.Br, cont354)
LoadFieldIL.MarkLabel(fa354)
LoadFieldIL.Emit(OpCodes.Br, cont354)
LoadFieldIL.MarkLabel(cont354)
LoadFieldIL.MarkSequencePoint(doc6, 584, 1, 584, 100)
LoadFieldIL.Emit(OpCodes.Br, cont352)
LoadFieldIL.MarkLabel(fa352)
LoadFieldIL.Emit(OpCodes.Br, cont352)
LoadFieldIL.MarkLabel(cont352)
LoadFieldIL.MarkSequencePoint(doc6, 586, 1, 586, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
LoadFieldIL.MarkSequencePoint(doc6, 588, 1, 588, 100)
LoadFieldIL.Emit(OpCodes.Ret)
Loader.CreateType()
End Sub


Dim doc7 As ISymbolDocumentWriter

Sub ConsolePrinter()
Dim ConsolePrinter As TypeBuilder = mdl.DefineType("dylan.NET.Reflection" & "." & "ConsolePrinter", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass Or TypeAttributes.BeforeFieldInit, GetType(System.Object))
Dim SW As FieldBuilder = ConsolePrinter.DefineField("SW", GetType(StringWriter), FieldAttributes.Public Or FieldAttributes.Static)
Dim ctor0 As ConstructorBuilder = ConsolePrinter.DefineConstructor(MethodAttributes.Public Or MethodAttributes.Static,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
ctor0IL.MarkSequencePoint(doc7, 14, 1, 14, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, SW)
ctor0IL.MarkSequencePoint(doc7, 15, 1, 15, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim PrintString As MethodBuilder = ConsolePrinter.DefineMethod("PrintString", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim PrintStringIL As ILGenerator = PrintString.GetILGenerator()
PrintStringIL.MarkSequencePoint(doc7, 18, 1, 18, 100)
Dim locbldr256 As LocalBuilder = PrintStringIL.DeclareLocal(GetType(System.String))
locbldr256.SetLocalSymInfo("str")
PrintStringIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
PrintStringIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
PrintStringIL.Emit(OpCodes.Stloc, 0)
PrintStringIL.MarkSequencePoint(doc7, 19, 1, 19, 100)
Dim typ1(-1) As Type
PrintStringIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
PrintStringIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ1))
Typ = GetType(Console).GetMethod("WriteLine", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
PrintStringIL.Emit(OpCodes.Pop)
End If
PrintStringIL.MarkSequencePoint(doc7, 20, 1, 20, 100)
PrintStringIL.Emit(OpCodes.Ret)
Dim typ2(-1) As Type
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = GetType(System.Type)
Dim WriteClass As MethodBuilder = ConsolePrinter.DefineMethod("WriteClass", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ2)
Dim WriteClassIL As ILGenerator = WriteClass.GetILGenerator()
Dim WriteClassparam01 As ParameterBuilder = WriteClass.DefineParameter(1, ParameterAttributes.None, "typ")
WriteClassIL.MarkSequencePoint(doc7, 24, 1, 24, 100)
WriteClassIL.Emit(OpCodes.Newobj, GetType(StringWriter).GetConstructor(Type.EmptyTypes))
WriteClassIL.Emit(OpCodes.Stsfld, SW)
WriteClassIL.MarkSequencePoint(doc7, 26, 1, 26, 100)
Dim locbldr257 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr257.SetLocalSymInfo("isAbstract")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAbstract", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAbstract", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 0)
WriteClassIL.MarkSequencePoint(doc7, 27, 1, 27, 100)
Dim locbldr258 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr258.SetLocalSymInfo("isAnsi")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAnsiClass", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAnsiClass", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 1)
WriteClassIL.MarkSequencePoint(doc7, 28, 1, 28, 100)
Dim locbldr259 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr259.SetLocalSymInfo("isAutoChar")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAutoClass", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAutoClass", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 2)
WriteClassIL.MarkSequencePoint(doc7, 29, 1, 29, 100)
Dim locbldr260 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr260.SetLocalSymInfo("isAuto")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAutoLayout", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAutoLayout", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 3)
WriteClassIL.MarkSequencePoint(doc7, 30, 1, 30, 100)
Dim locbldr261 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr261.SetLocalSymInfo("isEnum")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsEnum", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsEnum", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 4)
WriteClassIL.MarkSequencePoint(doc7, 31, 1, 31, 100)
Dim locbldr262 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr262.SetLocalSymInfo("isInterface")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsInterface", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsInterface", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 5)
WriteClassIL.MarkSequencePoint(doc7, 32, 1, 32, 100)
Dim locbldr263 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr263.SetLocalSymInfo("isNestedPrivate")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsNestedPrivate", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsNestedPrivate", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 6)
WriteClassIL.MarkSequencePoint(doc7, 33, 1, 33, 100)
Dim locbldr264 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr264.SetLocalSymInfo("isNestedPublic")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsNestedPublic", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsNestedPublic", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 7)
WriteClassIL.MarkSequencePoint(doc7, 34, 1, 34, 100)
Dim locbldr265 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr265.SetLocalSymInfo("isPrivate")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsNotPublic", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsNotPublic", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 8)
WriteClassIL.MarkSequencePoint(doc7, 35, 1, 35, 100)
Dim locbldr266 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr266.SetLocalSymInfo("isPublic")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsPublic", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsPublic", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 9)
WriteClassIL.MarkSequencePoint(doc7, 36, 1, 36, 100)
Dim locbldr267 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.String))
locbldr267.SetLocalSymInfo("name")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Name", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Name", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 10)
WriteClassIL.MarkSequencePoint(doc7, 37, 1, 37, 100)
Dim locbldr268 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Type))
locbldr268.SetLocalSymInfo("bt")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_BaseType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_BaseType", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 11)
WriteClassIL.MarkSequencePoint(doc7, 38, 1, 38, 100)
Dim locbldr269 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.String))
locbldr269.SetLocalSymInfo("btstr")
WriteClassIL.Emit(OpCodes.Ldloc, 11)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 12)
WriteClassIL.MarkSequencePoint(doc7, 40, 1, 40, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa355 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru355 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont355 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru355)
WriteClassIL.Emit(OpCodes.Br, fa355)
WriteClassIL.MarkLabel(tru355)
WriteClassIL.MarkSequencePoint(doc7, 41, 1, 41, 100)
Dim typ16(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "enum ")
Typ = GetType(System.String)
ReDim Preserve typ16(UBound(typ16) + 1)
typ16(UBound(typ16)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ16))
Typ = Typ03.GetMethod("Write", typ16).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 42, 1, 42, 100)
WriteClassIL.Emit(OpCodes.Br, cont355)
WriteClassIL.MarkLabel(fa355)
WriteClassIL.MarkSequencePoint(doc7, 43, 1, 43, 100)
Dim typ17(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "class ")
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ17))
Typ = Typ03.GetMethod("Write", typ17).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 44, 1, 44, 100)
WriteClassIL.Emit(OpCodes.Br, cont355)
WriteClassIL.MarkLabel(cont355)
WriteClassIL.MarkSequencePoint(doc7, 46, 1, 46, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa356 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru356 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont356 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru356)
WriteClassIL.Emit(OpCodes.Br, fa356)
WriteClassIL.MarkLabel(tru356)
WriteClassIL.MarkSequencePoint(doc7, 47, 1, 47, 100)
Dim typ18(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "public ")
Typ = GetType(System.String)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ18))
Typ = Typ03.GetMethod("Write", typ18).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 48, 1, 48, 100)
WriteClassIL.Emit(OpCodes.Br, cont356)
WriteClassIL.MarkLabel(fa356)
WriteClassIL.Emit(OpCodes.Br, cont356)
WriteClassIL.MarkLabel(cont356)
WriteClassIL.MarkSequencePoint(doc7, 50, 1, 50, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa357 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru357 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont357 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru357)
WriteClassIL.Emit(OpCodes.Br, fa357)
WriteClassIL.MarkLabel(tru357)
WriteClassIL.MarkSequencePoint(doc7, 51, 1, 51, 100)
Dim typ19(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "private ")
Typ = GetType(System.String)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ19))
Typ = Typ03.GetMethod("Write", typ19).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 52, 1, 52, 100)
WriteClassIL.Emit(OpCodes.Br, cont357)
WriteClassIL.MarkLabel(fa357)
WriteClassIL.Emit(OpCodes.Br, cont357)
WriteClassIL.MarkLabel(cont357)
WriteClassIL.MarkSequencePoint(doc7, 54, 1, 54, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa358 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru358 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont358 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru358)
WriteClassIL.Emit(OpCodes.Br, fa358)
WriteClassIL.MarkLabel(tru358)
WriteClassIL.MarkSequencePoint(doc7, 55, 1, 55, 100)
Dim typ20(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "public ")
Typ = GetType(System.String)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ20))
Typ = Typ03.GetMethod("Write", typ20).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 56, 1, 56, 100)
WriteClassIL.Emit(OpCodes.Br, cont358)
WriteClassIL.MarkLabel(fa358)
WriteClassIL.Emit(OpCodes.Br, cont358)
WriteClassIL.MarkLabel(cont358)
WriteClassIL.MarkSequencePoint(doc7, 58, 1, 58, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa359 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru359 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont359 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru359)
WriteClassIL.Emit(OpCodes.Br, fa359)
WriteClassIL.MarkLabel(tru359)
WriteClassIL.MarkSequencePoint(doc7, 59, 1, 59, 100)
Dim typ21(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "private ")
Typ = GetType(System.String)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ21))
Typ = Typ03.GetMethod("Write", typ21).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 60, 1, 60, 100)
WriteClassIL.Emit(OpCodes.Br, cont359)
WriteClassIL.MarkLabel(fa359)
WriteClassIL.Emit(OpCodes.Br, cont359)
WriteClassIL.MarkLabel(cont359)
WriteClassIL.MarkSequencePoint(doc7, 63, 1, 63, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa360 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru360 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont360 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru360)
WriteClassIL.Emit(OpCodes.Br, fa360)
WriteClassIL.MarkLabel(tru360)
WriteClassIL.MarkSequencePoint(doc7, 64, 1, 64, 100)
Dim typ22(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "abstract ")
Typ = GetType(System.String)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ22))
Typ = Typ03.GetMethod("Write", typ22).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 65, 1, 65, 100)
WriteClassIL.Emit(OpCodes.Br, cont360)
WriteClassIL.MarkLabel(fa360)
WriteClassIL.Emit(OpCodes.Br, cont360)
WriteClassIL.MarkLabel(cont360)
WriteClassIL.MarkSequencePoint(doc7, 67, 1, 67, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa361 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru361 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont361 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru361)
WriteClassIL.Emit(OpCodes.Br, fa361)
WriteClassIL.MarkLabel(tru361)
WriteClassIL.MarkSequencePoint(doc7, 68, 1, 68, 100)
Dim typ23(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "auto ")
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ23))
Typ = Typ03.GetMethod("Write", typ23).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 69, 1, 69, 100)
WriteClassIL.Emit(OpCodes.Br, cont361)
WriteClassIL.MarkLabel(fa361)
WriteClassIL.Emit(OpCodes.Br, cont361)
WriteClassIL.MarkLabel(cont361)
WriteClassIL.MarkSequencePoint(doc7, 72, 1, 72, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa362 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru362 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont362 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru362)
WriteClassIL.Emit(OpCodes.Br, fa362)
WriteClassIL.MarkLabel(tru362)
WriteClassIL.MarkSequencePoint(doc7, 73, 1, 73, 100)
Dim typ24(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "autochar ")
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ24))
Typ = Typ03.GetMethod("Write", typ24).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 74, 1, 74, 100)
WriteClassIL.Emit(OpCodes.Br, cont362)
WriteClassIL.MarkLabel(fa362)
WriteClassIL.Emit(OpCodes.Br, cont362)
WriteClassIL.MarkLabel(cont362)
WriteClassIL.MarkSequencePoint(doc7, 76, 1, 76, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa363 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru363 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont363 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru363)
WriteClassIL.Emit(OpCodes.Br, fa363)
WriteClassIL.MarkLabel(tru363)
WriteClassIL.MarkSequencePoint(doc7, 77, 1, 77, 100)
Dim typ25(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "ansi ")
Typ = GetType(System.String)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ25))
Typ = Typ03.GetMethod("Write", typ25).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 78, 1, 78, 100)
WriteClassIL.Emit(OpCodes.Br, cont363)
WriteClassIL.MarkLabel(fa363)
WriteClassIL.Emit(OpCodes.Br, cont363)
WriteClassIL.MarkLabel(cont363)
WriteClassIL.MarkSequencePoint(doc7, 80, 1, 80, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa364 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru364 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont364 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru364)
WriteClassIL.Emit(OpCodes.Br, fa364)
WriteClassIL.MarkLabel(tru364)
WriteClassIL.MarkSequencePoint(doc7, 81, 1, 81, 100)
Dim typ26(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "autochar ")
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ26))
Typ = Typ03.GetMethod("Write", typ26).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 82, 1, 82, 100)
WriteClassIL.Emit(OpCodes.Br, cont364)
WriteClassIL.MarkLabel(fa364)
WriteClassIL.Emit(OpCodes.Br, cont364)
WriteClassIL.MarkLabel(cont364)
WriteClassIL.MarkSequencePoint(doc7, 84, 1, 84, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa365 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru365 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont365 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru365)
WriteClassIL.Emit(OpCodes.Br, fa365)
WriteClassIL.MarkLabel(tru365)
WriteClassIL.MarkSequencePoint(doc7, 85, 1, 85, 100)
Dim typ27(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, "interface ")
Typ = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ27))
Typ = Typ03.GetMethod("Write", typ27).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 86, 1, 86, 100)
WriteClassIL.Emit(OpCodes.Br, cont365)
WriteClassIL.MarkLabel(fa365)
WriteClassIL.Emit(OpCodes.Br, cont365)
WriteClassIL.MarkLabel(cont365)
WriteClassIL.MarkSequencePoint(doc7, 88, 1, 88, 100)
Dim typ28(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldloc, 10)
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ28))
Typ = Typ03.GetMethod("Write", typ28).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 89, 1, 89, 100)
Dim typ29(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldstr, " extends ")
Typ = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ29))
Typ = Typ03.GetMethod("Write", typ29).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 90, 1, 90, 100)
Dim typ30(-1) As Type
WriteClassIL.Emit(OpCodes.Ldsfld, SW)
Typ = SW.FieldType
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Ldloc, 12)
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Write", typ30))
Typ = Typ03.GetMethod("Write", typ30).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteClassIL.Emit(OpCodes.Pop)
End If
WriteClassIL.MarkSequencePoint(doc7, 92, 1, 92, 100)
WriteClassIL.Emit(OpCodes.Ret)
ConsolePrinter.CreateType()
End Sub

Sub Main()

asmName = New AssemblyName("dnr")
asmName.Version = New System.Version(11, 2, 8, 2)
asm  = AppDomain.CurrentDomain.DefineDynamicAssembly(asmName, AssemblyBuilderAccess.Save, CStr("E:\Code\dylannet\dnr\"))
mdl = asm.DefineDynamicModule(asmName.Name & ".dll" , asmName.Name & ".dll", True)
resw = mdl.DefineResource("dnr.resources" ,  "Description")
doc = mdl.DefineDocument("E:\Code\dylannet\dnr\dnr.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
doc2 = mdl.DefineDocument("E:\Code\dylannet\dnr\dnr\instructionhelper.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
doc3 = mdl.DefineDocument("E:\Code\dylannet\dnr\dnr\ilemitter.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
doc4 = mdl.DefineDocument("E:\Code\dylannet\dnr\dnr\asmfactory.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
doc5 = mdl.DefineDocument("E:\Code\dylannet\dnr\dnr\importer.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
doc6 = mdl.DefineDocument("E:\Code\dylannet\dnr\dnr\loader.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
doc7 = mdl.DefineDocument("E:\Code\dylannet\dnr\dnr\consoleprinter.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
addstr("dnr")
addasm(asm)
Dim daType As Type = GetType(DebuggableAttribute)
Dim daCtor As ConstructorInfo = daType.GetConstructor(New Type() { GetType(DebuggableAttribute.DebuggingModes) })
Dim daBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(daCtor, New Object() {DebuggableAttribute.DebuggingModes.DisableOptimizations Or _
DebuggableAttribute.DebuggingModes.Default })
asm.SetCustomAttribute(daBuilder)

InstructionHelper()
ILEmitter()
AsmFactory()
Importer()
Loader()
ConsolePrinter()
Dim vaType As Type = GetType(AssemblyFileVersionAttribute)
Dim vaCtor As ConstructorInfo = vaType.GetConstructor(New Type() { GetType(String) })
Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {"11.2.8.2"})
asm.SetCustomAttribute(vaBuilder)

Dim paType As Type = GetType(AssemblyProductAttribute)
Dim paCtor As ConstructorInfo = paType.GetConstructor(New Type() { GetType(String) })
Dim paBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(paCtor, New Object() {"dnr"})
asm.SetCustomAttribute(paBuilder)

Dim ataType As Type = GetType(AssemblyTitleAttribute)
Dim ataCtor As ConstructorInfo = ataType.GetConstructor(New Type() { GetType(String) })
Dim ataBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(ataCtor, New Object() {"dnr"})
asm.SetCustomAttribute(ataBuilder)

Dim deaType As Type = GetType(AssemblyDescriptionAttribute)
Dim deaCtor As ConstructorInfo = deaType.GetConstructor(New Type() { GetType(String) })
Dim deaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(deaCtor, New Object() {"dnr"})
asm.SetCustomAttribute(deaBuilder)


asm.DefineVersionInfoResource()
asm.Save(asmName.Name & ".dll")
End Sub


End Module