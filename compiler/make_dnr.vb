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
Dim ctor0 As ConstructorBuilder = ILEmitter.DefineConstructor(MethodAttributes.Public Or MethodAttributes.Static,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
ctor0IL.MarkSequencePoint(doc3, 21, 1, 21, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, Met)
ctor0IL.MarkSequencePoint(doc3, 22, 1, 22, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, Constr)
ctor0IL.MarkSequencePoint(doc3, 23, 1, 23, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, ILGen)
ctor0IL.MarkSequencePoint(doc3, 24, 1, 24, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, StaticFlg)
ctor0IL.MarkSequencePoint(doc3, 25, 1, 25, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
ctor0IL.Emit(OpCodes.Stsfld, DebugFlg)
ctor0IL.MarkSequencePoint(doc3, 26, 1, 26, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, LocInd)
ctor0IL.MarkSequencePoint(doc3, 27, 1, 27, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, ArgInd)
ctor0IL.MarkSequencePoint(doc3, 28, 1, 28, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim EmitRet As MethodBuilder = ILEmitter.DefineMethod("EmitRet", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitRetIL As ILGenerator = EmitRet.GetILGenerator()
EmitRetIL.MarkSequencePoint(doc3, 31, 1, 31, 100)
Dim locbldr2 As LocalBuilder = EmitRetIL.DeclareLocal(GetType(OpCode))
locbldr2.SetLocalSymInfo("op")
Dim typ0(-1) As Type
EmitRetIL.Emit(OpCodes.Ldstr, "ret")
Typ = GetType(System.String)
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = Typ
EmitRetIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ0))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ0).ReturnType
EmitRetIL.Emit(OpCodes.Stloc, 0)
EmitRetIL.MarkSequencePoint(doc3, 32, 1, 32, 100)
Dim typ1(-1) As Type
EmitRetIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitRetIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
EmitRetIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ1))
Typ = Typ03.GetMethod("Emit", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitRetIL.Emit(OpCodes.Pop)
End If
EmitRetIL.MarkSequencePoint(doc3, 33, 1, 33, 100)
EmitRetIL.Emit(OpCodes.Ret)
Dim EmitPop As MethodBuilder = ILEmitter.DefineMethod("EmitPop", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitPopIL As ILGenerator = EmitPop.GetILGenerator()
EmitPopIL.MarkSequencePoint(doc3, 36, 1, 36, 100)
Dim locbldr3 As LocalBuilder = EmitPopIL.DeclareLocal(GetType(OpCode))
locbldr3.SetLocalSymInfo("op")
Dim typ2(-1) As Type
EmitPopIL.Emit(OpCodes.Ldstr, "pop")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
EmitPopIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ2))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ2).ReturnType
EmitPopIL.Emit(OpCodes.Stloc, 0)
EmitPopIL.MarkSequencePoint(doc3, 37, 1, 37, 100)
Dim typ3(-1) As Type
EmitPopIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitPopIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
EmitPopIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ3))
Typ = Typ03.GetMethod("Emit", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitPopIL.Emit(OpCodes.Pop)
End If
EmitPopIL.MarkSequencePoint(doc3, 38, 1, 38, 100)
EmitPopIL.Emit(OpCodes.Ret)
Dim typ4(-1) As Type
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = GetType(System.Type)
Dim EmitBox As MethodBuilder = ILEmitter.DefineMethod("EmitBox", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ4)
Dim EmitBoxIL As ILGenerator = EmitBox.GetILGenerator()
Dim EmitBoxparam01 As ParameterBuilder = EmitBox.DefineParameter(1, ParameterAttributes.None, "t")
EmitBoxIL.MarkSequencePoint(doc3, 41, 1, 41, 100)
Dim locbldr4 As LocalBuilder = EmitBoxIL.DeclareLocal(GetType(OpCode))
locbldr4.SetLocalSymInfo("op")
Dim typ5(-1) As Type
EmitBoxIL.Emit(OpCodes.Ldstr, "box")
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
EmitBoxIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ5))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ5).ReturnType
EmitBoxIL.Emit(OpCodes.Stloc, 0)
EmitBoxIL.MarkSequencePoint(doc3, 42, 1, 42, 100)
Dim typ6(-1) As Type
EmitBoxIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBoxIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
EmitBoxIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
EmitBoxIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ6))
Typ = Typ03.GetMethod("Emit", typ6).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBoxIL.Emit(OpCodes.Pop)
End If
EmitBoxIL.MarkSequencePoint(doc3, 43, 1, 43, 100)
EmitBoxIL.Emit(OpCodes.Ret)
Dim typ7(-1) As Type
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = GetType(System.Type)
Dim EmitUnbox As MethodBuilder = ILEmitter.DefineMethod("EmitUnbox", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ7)
Dim EmitUnboxIL As ILGenerator = EmitUnbox.GetILGenerator()
Dim EmitUnboxparam01 As ParameterBuilder = EmitUnbox.DefineParameter(1, ParameterAttributes.None, "t")
EmitUnboxIL.MarkSequencePoint(doc3, 46, 1, 46, 100)
Dim locbldr5 As LocalBuilder = EmitUnboxIL.DeclareLocal(GetType(OpCode))
locbldr5.SetLocalSymInfo("op")
Dim typ8(-1) As Type
EmitUnboxIL.Emit(OpCodes.Ldstr, "unbox")
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
EmitUnboxIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ8))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ8).ReturnType
EmitUnboxIL.Emit(OpCodes.Stloc, 0)
EmitUnboxIL.MarkSequencePoint(doc3, 47, 1, 47, 100)
Dim typ9(-1) As Type
EmitUnboxIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitUnboxIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
EmitUnboxIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
EmitUnboxIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ9))
Typ = Typ03.GetMethod("Emit", typ9).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitUnboxIL.Emit(OpCodes.Pop)
End If
EmitUnboxIL.MarkSequencePoint(doc3, 48, 1, 48, 100)
EmitUnboxIL.Emit(OpCodes.Ret)
Dim typ10(-1) As Type
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = GetType(System.Type)
Dim EmitUnboxAny As MethodBuilder = ILEmitter.DefineMethod("EmitUnboxAny", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ10)
Dim EmitUnboxAnyIL As ILGenerator = EmitUnboxAny.GetILGenerator()
Dim EmitUnboxAnyparam01 As ParameterBuilder = EmitUnboxAny.DefineParameter(1, ParameterAttributes.None, "t")
EmitUnboxAnyIL.MarkSequencePoint(doc3, 51, 1, 51, 100)
Dim locbldr6 As LocalBuilder = EmitUnboxAnyIL.DeclareLocal(GetType(OpCode))
locbldr6.SetLocalSymInfo("op")
Dim typ11(-1) As Type
EmitUnboxAnyIL.Emit(OpCodes.Ldstr, "unbox.any")
Typ = GetType(System.String)
ReDim Preserve typ11(UBound(typ11) + 1)
typ11(UBound(typ11)) = Typ
EmitUnboxAnyIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ11))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ11).ReturnType
EmitUnboxAnyIL.Emit(OpCodes.Stloc, 0)
EmitUnboxAnyIL.MarkSequencePoint(doc3, 52, 1, 52, 100)
Dim typ12(-1) As Type
EmitUnboxAnyIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitUnboxAnyIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
EmitUnboxAnyIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
EmitUnboxAnyIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ12))
Typ = Typ03.GetMethod("Emit", typ12).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitUnboxAnyIL.Emit(OpCodes.Pop)
End If
EmitUnboxAnyIL.MarkSequencePoint(doc3, 53, 1, 53, 100)
EmitUnboxAnyIL.Emit(OpCodes.Ret)
Dim typ13(-1) As Type
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = GetType(System.Type)
Dim EmitConstrained As MethodBuilder = ILEmitter.DefineMethod("EmitConstrained", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ13)
Dim EmitConstrainedIL As ILGenerator = EmitConstrained.GetILGenerator()
Dim EmitConstrainedparam01 As ParameterBuilder = EmitConstrained.DefineParameter(1, ParameterAttributes.None, "t")
EmitConstrainedIL.MarkSequencePoint(doc3, 56, 1, 56, 100)
Dim locbldr7 As LocalBuilder = EmitConstrainedIL.DeclareLocal(GetType(OpCode))
locbldr7.SetLocalSymInfo("op")
Dim typ14(-1) As Type
EmitConstrainedIL.Emit(OpCodes.Ldstr, "constrained.")
Typ = GetType(System.String)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
EmitConstrainedIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ14))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ14).ReturnType
EmitConstrainedIL.Emit(OpCodes.Stloc, 0)
EmitConstrainedIL.MarkSequencePoint(doc3, 57, 1, 57, 100)
Dim typ15(-1) As Type
EmitConstrainedIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConstrainedIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
EmitConstrainedIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
EmitConstrainedIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ15))
Typ = Typ03.GetMethod("Emit", typ15).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConstrainedIL.Emit(OpCodes.Pop)
End If
EmitConstrainedIL.MarkSequencePoint(doc3, 58, 1, 58, 100)
EmitConstrainedIL.Emit(OpCodes.Ret)
Dim typ16(-1) As Type
ReDim Preserve typ16(UBound(typ16) + 1)
typ16(UBound(typ16)) = GetType(System.Int32)
Dim EmitLdloc As MethodBuilder = ILEmitter.DefineMethod("EmitLdloc", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ16)
Dim EmitLdlocIL As ILGenerator = EmitLdloc.GetILGenerator()
Dim EmitLdlocparam01 As ParameterBuilder = EmitLdloc.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdlocIL.MarkSequencePoint(doc3, 61, 1, 61, 100)
Dim locbldr8 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(OpCode))
locbldr8.SetLocalSymInfo("op")
EmitLdlocIL.MarkSequencePoint(doc3, 62, 1, 62, 100)
Dim locbldr9 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Boolean))
locbldr9.SetLocalSymInfo("b1")
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 1)
EmitLdlocIL.MarkSequencePoint(doc3, 63, 1, 63, 100)
Dim locbldr10 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Boolean))
locbldr10.SetLocalSymInfo("b2")
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 2)
EmitLdlocIL.MarkSequencePoint(doc3, 64, 1, 64, 100)
Dim locbldr11 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Byte))
locbldr11.SetLocalSymInfo("n8")
EmitLdlocIL.MarkSequencePoint(doc3, 65, 1, 65, 100)
Dim locbldr12 As LocalBuilder = EmitLdlocIL.DeclareLocal(GetType(System.Int16))
locbldr12.SetLocalSymInfo("n16")
EmitLdlocIL.MarkSequencePoint(doc3, 67, 1, 67, 100)
Dim label0 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.MarkSequencePoint(doc3, 69, 1, 69, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa164 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru164 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont164 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru164)
EmitLdlocIL.Emit(OpCodes.Br, fa164)
EmitLdlocIL.MarkLabel(tru164)
EmitLdlocIL.MarkSequencePoint(doc3, 70, 1, 70, 100)
Dim typ17(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.0")
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ17))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ17).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 71, 1, 71, 100)
Dim typ18(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ18))
Typ = Typ03.GetMethod("Emit", typ18).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 72, 1, 72, 100)
EmitLdlocIL.Emit(OpCodes.Br, label0)
EmitLdlocIL.MarkSequencePoint(doc3, 73, 1, 73, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont164)
EmitLdlocIL.MarkLabel(fa164)
EmitLdlocIL.Emit(OpCodes.Br, cont164)
EmitLdlocIL.MarkLabel(cont164)
EmitLdlocIL.MarkSequencePoint(doc3, 75, 1, 75, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa165 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru165 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont165 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru165)
EmitLdlocIL.Emit(OpCodes.Br, fa165)
EmitLdlocIL.MarkLabel(tru165)
EmitLdlocIL.MarkSequencePoint(doc3, 76, 1, 76, 100)
Dim typ19(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.1")
Typ = GetType(System.String)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ19))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ19).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 77, 1, 77, 100)
Dim typ20(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ20))
Typ = Typ03.GetMethod("Emit", typ20).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 78, 1, 78, 100)
EmitLdlocIL.Emit(OpCodes.Br, label0)
EmitLdlocIL.MarkSequencePoint(doc3, 79, 1, 79, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont165)
EmitLdlocIL.MarkLabel(fa165)
EmitLdlocIL.Emit(OpCodes.Br, cont165)
EmitLdlocIL.MarkLabel(cont165)
EmitLdlocIL.MarkSequencePoint(doc3, 81, 1, 81, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa166 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru166 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont166 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru166)
EmitLdlocIL.Emit(OpCodes.Br, fa166)
EmitLdlocIL.MarkLabel(tru166)
EmitLdlocIL.MarkSequencePoint(doc3, 82, 1, 82, 100)
Dim typ21(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.2")
Typ = GetType(System.String)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ21))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ21).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 83, 1, 83, 100)
Dim typ22(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ22))
Typ = Typ03.GetMethod("Emit", typ22).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 84, 1, 84, 100)
EmitLdlocIL.Emit(OpCodes.Br, label0)
EmitLdlocIL.MarkSequencePoint(doc3, 85, 1, 85, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont166)
EmitLdlocIL.MarkLabel(fa166)
EmitLdlocIL.Emit(OpCodes.Br, cont166)
EmitLdlocIL.MarkLabel(cont166)
EmitLdlocIL.MarkSequencePoint(doc3, 87, 1, 87, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa167 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru167 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont167 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru167)
EmitLdlocIL.Emit(OpCodes.Br, fa167)
EmitLdlocIL.MarkLabel(tru167)
EmitLdlocIL.MarkSequencePoint(doc3, 88, 1, 88, 100)
Dim typ23(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.3")
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ23))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ23).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 89, 1, 89, 100)
Dim typ24(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ24))
Typ = Typ03.GetMethod("Emit", typ24).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 90, 1, 90, 100)
EmitLdlocIL.Emit(OpCodes.Br, label0)
EmitLdlocIL.MarkSequencePoint(doc3, 91, 1, 91, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont167)
EmitLdlocIL.MarkLabel(fa167)
EmitLdlocIL.Emit(OpCodes.Br, cont167)
EmitLdlocIL.MarkLabel(cont167)
EmitLdlocIL.MarkSequencePoint(doc3, 93, 1, 93, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa168 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru168 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont168 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Bge, tru168)
EmitLdlocIL.Emit(OpCodes.Br, fa168)
EmitLdlocIL.MarkLabel(tru168)
EmitLdlocIL.MarkSequencePoint(doc3, 94, 1, 94, 100)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 1)
EmitLdlocIL.MarkSequencePoint(doc3, 95, 1, 95, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont168)
EmitLdlocIL.MarkLabel(fa168)
EmitLdlocIL.Emit(OpCodes.Br, cont168)
EmitLdlocIL.MarkLabel(cont168)
EmitLdlocIL.MarkSequencePoint(doc3, 96, 1, 96, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa169 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru169 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont169 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Ble, tru169)
EmitLdlocIL.Emit(OpCodes.Br, fa169)
EmitLdlocIL.MarkLabel(tru169)
EmitLdlocIL.MarkSequencePoint(doc3, 97, 1, 97, 100)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Stloc, 2)
EmitLdlocIL.MarkSequencePoint(doc3, 98, 1, 98, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont169)
EmitLdlocIL.MarkLabel(fa169)
EmitLdlocIL.Emit(OpCodes.Br, cont169)
EmitLdlocIL.MarkLabel(cont169)
EmitLdlocIL.MarkSequencePoint(doc3, 99, 1, 99, 100)
EmitLdlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.And)
EmitLdlocIL.Emit(OpCodes.Stloc, 2)
EmitLdlocIL.MarkSequencePoint(doc3, 101, 1, 101, 100)
EmitLdlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa170 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru170 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont170 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru170)
EmitLdlocIL.Emit(OpCodes.Br, fa170)
EmitLdlocIL.MarkLabel(tru170)
EmitLdlocIL.MarkSequencePoint(doc3, 102, 1, 102, 100)
Dim typ25(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc.s")
Typ = GetType(System.String)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ25))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ25).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 103, 1, 103, 100)
Dim typ26(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ26))
Typ = GetType(Convert).GetMethod("ToByte", typ26).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 3)
EmitLdlocIL.MarkSequencePoint(doc3, 104, 1, 104, 100)
Dim typ27(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ27))
Typ = Typ03.GetMethod("Emit", typ27).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 105, 1, 105, 100)
EmitLdlocIL.Emit(OpCodes.Br, label0)
EmitLdlocIL.MarkSequencePoint(doc3, 106, 1, 106, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont170)
EmitLdlocIL.MarkLabel(fa170)
EmitLdlocIL.Emit(OpCodes.Br, cont170)
EmitLdlocIL.MarkLabel(cont170)
EmitLdlocIL.MarkSequencePoint(doc3, 108, 1, 108, 100)
EmitLdlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa171 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim tru171 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
Dim cont171 As System.Reflection.Emit.Label = EmitLdlocIL.DefineLabel()
EmitLdlocIL.Emit(OpCodes.Beq, tru171)
EmitLdlocIL.Emit(OpCodes.Br, fa171)
EmitLdlocIL.MarkLabel(tru171)
EmitLdlocIL.MarkSequencePoint(doc3, 109, 1, 109, 100)
Dim typ28(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldstr, "ldloc")
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
EmitLdlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ28))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ28).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 0)
EmitLdlocIL.MarkSequencePoint(doc3, 110, 1, 110, 100)
EmitLdlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ29 As Type() = {Typ}
EmitLdlocIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ29))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ29).ReturnType
EmitLdlocIL.Emit(OpCodes.Stloc, 4)
EmitLdlocIL.MarkSequencePoint(doc3, 111, 1, 111, 100)
Dim typ30(-1) As Type
EmitLdlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
EmitLdlocIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
EmitLdlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ30))
Typ = Typ03.GetMethod("Emit", typ30).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocIL.Emit(OpCodes.Pop)
End If
EmitLdlocIL.MarkSequencePoint(doc3, 112, 1, 112, 100)
EmitLdlocIL.Emit(OpCodes.Br, label0)
EmitLdlocIL.MarkSequencePoint(doc3, 113, 1, 113, 100)
EmitLdlocIL.Emit(OpCodes.Br, cont171)
EmitLdlocIL.MarkLabel(fa171)
EmitLdlocIL.Emit(OpCodes.Br, cont171)
EmitLdlocIL.MarkLabel(cont171)
EmitLdlocIL.MarkSequencePoint(doc3, 115, 1, 115, 100)
EmitLdlocIL.MarkLabel(label0)
EmitLdlocIL.MarkSequencePoint(doc3, 116, 1, 116, 100)
EmitLdlocIL.Emit(OpCodes.Ret)
Dim typ31(-1) As Type
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = GetType(System.Int32)
Dim EmitLdloca As MethodBuilder = ILEmitter.DefineMethod("EmitLdloca", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ31)
Dim EmitLdlocaIL As ILGenerator = EmitLdloca.GetILGenerator()
Dim EmitLdlocaparam01 As ParameterBuilder = EmitLdloca.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdlocaIL.MarkSequencePoint(doc3, 119, 1, 119, 100)
Dim locbldr13 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(OpCode))
locbldr13.SetLocalSymInfo("op")
EmitLdlocaIL.MarkSequencePoint(doc3, 120, 1, 120, 100)
Dim locbldr14 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Boolean))
locbldr14.SetLocalSymInfo("b1")
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 1)
EmitLdlocaIL.MarkSequencePoint(doc3, 121, 1, 121, 100)
Dim locbldr15 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Boolean))
locbldr15.SetLocalSymInfo("b2")
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 2)
EmitLdlocaIL.MarkSequencePoint(doc3, 122, 1, 122, 100)
Dim locbldr16 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Byte))
locbldr16.SetLocalSymInfo("n8")
EmitLdlocaIL.MarkSequencePoint(doc3, 123, 1, 123, 100)
Dim locbldr17 As LocalBuilder = EmitLdlocaIL.DeclareLocal(GetType(System.Int16))
locbldr17.SetLocalSymInfo("n16")
EmitLdlocaIL.MarkSequencePoint(doc3, 125, 1, 125, 100)
Dim label1 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.MarkSequencePoint(doc3, 127, 1, 127, 100)
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa172 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru172 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont172 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Bge, tru172)
EmitLdlocaIL.Emit(OpCodes.Br, fa172)
EmitLdlocaIL.MarkLabel(tru172)
EmitLdlocaIL.MarkSequencePoint(doc3, 128, 1, 128, 100)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 1)
EmitLdlocaIL.MarkSequencePoint(doc3, 129, 1, 129, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont172)
EmitLdlocaIL.MarkLabel(fa172)
EmitLdlocaIL.Emit(OpCodes.Br, cont172)
EmitLdlocaIL.MarkLabel(cont172)
EmitLdlocaIL.MarkSequencePoint(doc3, 130, 1, 130, 100)
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa173 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru173 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont173 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Ble, tru173)
EmitLdlocaIL.Emit(OpCodes.Br, fa173)
EmitLdlocaIL.MarkLabel(tru173)
EmitLdlocaIL.MarkSequencePoint(doc3, 131, 1, 131, 100)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Stloc, 2)
EmitLdlocaIL.MarkSequencePoint(doc3, 132, 1, 132, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont173)
EmitLdlocaIL.MarkLabel(fa173)
EmitLdlocaIL.Emit(OpCodes.Br, cont173)
EmitLdlocaIL.MarkLabel(cont173)
EmitLdlocaIL.MarkSequencePoint(doc3, 133, 1, 133, 100)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.And)
EmitLdlocaIL.Emit(OpCodes.Stloc, 2)
EmitLdlocaIL.MarkSequencePoint(doc3, 135, 1, 135, 100)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa174 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru174 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont174 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Beq, tru174)
EmitLdlocaIL.Emit(OpCodes.Br, fa174)
EmitLdlocaIL.MarkLabel(tru174)
EmitLdlocaIL.MarkSequencePoint(doc3, 136, 1, 136, 100)
Dim typ32(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldstr, "ldloca.s")
Typ = GetType(System.String)
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
EmitLdlocaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ32))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ32).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 0)
EmitLdlocaIL.MarkSequencePoint(doc3, 137, 1, 137, 100)
Dim typ33(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
EmitLdlocaIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ33))
Typ = GetType(Convert).GetMethod("ToByte", typ33).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 3)
EmitLdlocaIL.MarkSequencePoint(doc3, 138, 1, 138, 100)
Dim typ34(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
EmitLdlocaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ34))
Typ = Typ03.GetMethod("Emit", typ34).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocaIL.Emit(OpCodes.Pop)
End If
EmitLdlocaIL.MarkSequencePoint(doc3, 139, 1, 139, 100)
EmitLdlocaIL.Emit(OpCodes.Br, label1)
EmitLdlocaIL.MarkSequencePoint(doc3, 140, 1, 140, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont174)
EmitLdlocaIL.MarkLabel(fa174)
EmitLdlocaIL.Emit(OpCodes.Br, cont174)
EmitLdlocaIL.MarkLabel(cont174)
EmitLdlocaIL.MarkSequencePoint(doc3, 142, 1, 142, 100)
EmitLdlocaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdlocaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa175 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim tru175 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
Dim cont175 As System.Reflection.Emit.Label = EmitLdlocaIL.DefineLabel()
EmitLdlocaIL.Emit(OpCodes.Beq, tru175)
EmitLdlocaIL.Emit(OpCodes.Br, fa175)
EmitLdlocaIL.MarkLabel(tru175)
EmitLdlocaIL.MarkSequencePoint(doc3, 143, 1, 143, 100)
Dim typ35(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldstr, "ldloca")
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
EmitLdlocaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ35))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ35).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 0)
EmitLdlocaIL.MarkSequencePoint(doc3, 144, 1, 144, 100)
EmitLdlocaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ36 As Type() = {Typ}
EmitLdlocaIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ36))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ36).ReturnType
EmitLdlocaIL.Emit(OpCodes.Stloc, 4)
EmitLdlocaIL.MarkSequencePoint(doc3, 145, 1, 145, 100)
Dim typ37(-1) As Type
EmitLdlocaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
EmitLdlocaIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
EmitLdlocaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ37))
Typ = Typ03.GetMethod("Emit", typ37).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdlocaIL.Emit(OpCodes.Pop)
End If
EmitLdlocaIL.MarkSequencePoint(doc3, 146, 1, 146, 100)
EmitLdlocaIL.Emit(OpCodes.Br, label1)
EmitLdlocaIL.MarkSequencePoint(doc3, 147, 1, 147, 100)
EmitLdlocaIL.Emit(OpCodes.Br, cont175)
EmitLdlocaIL.MarkLabel(fa175)
EmitLdlocaIL.Emit(OpCodes.Br, cont175)
EmitLdlocaIL.MarkLabel(cont175)
EmitLdlocaIL.MarkSequencePoint(doc3, 149, 1, 149, 100)
EmitLdlocaIL.MarkLabel(label1)
EmitLdlocaIL.MarkSequencePoint(doc3, 150, 1, 150, 100)
EmitLdlocaIL.Emit(OpCodes.Ret)
Dim typ38(-1) As Type
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = GetType(System.Int32)
Dim EmitLdarg As MethodBuilder = ILEmitter.DefineMethod("EmitLdarg", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ38)
Dim EmitLdargIL As ILGenerator = EmitLdarg.GetILGenerator()
Dim EmitLdargparam01 As ParameterBuilder = EmitLdarg.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdargIL.MarkSequencePoint(doc3, 153, 1, 153, 100)
Dim locbldr18 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(OpCode))
locbldr18.SetLocalSymInfo("op")
EmitLdargIL.MarkSequencePoint(doc3, 154, 1, 154, 100)
Dim locbldr19 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Boolean))
locbldr19.SetLocalSymInfo("b1")
EmitLdargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 1)
EmitLdargIL.MarkSequencePoint(doc3, 155, 1, 155, 100)
Dim locbldr20 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Boolean))
locbldr20.SetLocalSymInfo("b2")
EmitLdargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 2)
EmitLdargIL.MarkSequencePoint(doc3, 156, 1, 156, 100)
Dim locbldr21 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Byte))
locbldr21.SetLocalSymInfo("n8")
EmitLdargIL.MarkSequencePoint(doc3, 157, 1, 157, 100)
Dim locbldr22 As LocalBuilder = EmitLdargIL.DeclareLocal(GetType(System.Int16))
locbldr22.SetLocalSymInfo("n16")
EmitLdargIL.MarkSequencePoint(doc3, 159, 1, 159, 100)
Dim label2 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.MarkSequencePoint(doc3, 161, 1, 161, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa176 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru176 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont176 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru176)
EmitLdargIL.Emit(OpCodes.Br, fa176)
EmitLdargIL.MarkLabel(tru176)
EmitLdargIL.MarkSequencePoint(doc3, 162, 1, 162, 100)
Dim typ39(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.0")
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ39))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ39).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 163, 1, 163, 100)
Dim typ40(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ40))
Typ = Typ03.GetMethod("Emit", typ40).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 164, 1, 164, 100)
EmitLdargIL.Emit(OpCodes.Br, label2)
EmitLdargIL.MarkSequencePoint(doc3, 165, 1, 165, 100)
EmitLdargIL.Emit(OpCodes.Br, cont176)
EmitLdargIL.MarkLabel(fa176)
EmitLdargIL.Emit(OpCodes.Br, cont176)
EmitLdargIL.MarkLabel(cont176)
EmitLdargIL.MarkSequencePoint(doc3, 167, 1, 167, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa177 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru177 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont177 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru177)
EmitLdargIL.Emit(OpCodes.Br, fa177)
EmitLdargIL.MarkLabel(tru177)
EmitLdargIL.MarkSequencePoint(doc3, 168, 1, 168, 100)
Dim typ41(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.1")
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ41))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ41).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 169, 1, 169, 100)
Dim typ42(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ42))
Typ = Typ03.GetMethod("Emit", typ42).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 170, 1, 170, 100)
EmitLdargIL.Emit(OpCodes.Br, label2)
EmitLdargIL.MarkSequencePoint(doc3, 171, 1, 171, 100)
EmitLdargIL.Emit(OpCodes.Br, cont177)
EmitLdargIL.MarkLabel(fa177)
EmitLdargIL.Emit(OpCodes.Br, cont177)
EmitLdargIL.MarkLabel(cont177)
EmitLdargIL.MarkSequencePoint(doc3, 173, 1, 173, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa178 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru178 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont178 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru178)
EmitLdargIL.Emit(OpCodes.Br, fa178)
EmitLdargIL.MarkLabel(tru178)
EmitLdargIL.MarkSequencePoint(doc3, 174, 1, 174, 100)
Dim typ43(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.2")
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ43))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ43).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 175, 1, 175, 100)
Dim typ44(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ44))
Typ = Typ03.GetMethod("Emit", typ44).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 176, 1, 176, 100)
EmitLdargIL.Emit(OpCodes.Br, label2)
EmitLdargIL.MarkSequencePoint(doc3, 177, 1, 177, 100)
EmitLdargIL.Emit(OpCodes.Br, cont178)
EmitLdargIL.MarkLabel(fa178)
EmitLdargIL.Emit(OpCodes.Br, cont178)
EmitLdargIL.MarkLabel(cont178)
EmitLdargIL.MarkSequencePoint(doc3, 179, 1, 179, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa179 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru179 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont179 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru179)
EmitLdargIL.Emit(OpCodes.Br, fa179)
EmitLdargIL.MarkLabel(tru179)
EmitLdargIL.MarkSequencePoint(doc3, 180, 1, 180, 100)
Dim typ45(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.3")
Typ = GetType(System.String)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ45))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ45).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 181, 1, 181, 100)
Dim typ46(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ46))
Typ = Typ03.GetMethod("Emit", typ46).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 182, 1, 182, 100)
EmitLdargIL.Emit(OpCodes.Br, label2)
EmitLdargIL.MarkSequencePoint(doc3, 183, 1, 183, 100)
EmitLdargIL.Emit(OpCodes.Br, cont179)
EmitLdargIL.MarkLabel(fa179)
EmitLdargIL.Emit(OpCodes.Br, cont179)
EmitLdargIL.MarkLabel(cont179)
EmitLdargIL.MarkSequencePoint(doc3, 185, 1, 185, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa180 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru180 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont180 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Bge, tru180)
EmitLdargIL.Emit(OpCodes.Br, fa180)
EmitLdargIL.MarkLabel(tru180)
EmitLdargIL.MarkSequencePoint(doc3, 186, 1, 186, 100)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 1)
EmitLdargIL.MarkSequencePoint(doc3, 187, 1, 187, 100)
EmitLdargIL.Emit(OpCodes.Br, cont180)
EmitLdargIL.MarkLabel(fa180)
EmitLdargIL.Emit(OpCodes.Br, cont180)
EmitLdargIL.MarkLabel(cont180)
EmitLdargIL.MarkSequencePoint(doc3, 188, 1, 188, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa181 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru181 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont181 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Ble, tru181)
EmitLdargIL.Emit(OpCodes.Br, fa181)
EmitLdargIL.MarkLabel(tru181)
EmitLdargIL.MarkSequencePoint(doc3, 189, 1, 189, 100)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Stloc, 2)
EmitLdargIL.MarkSequencePoint(doc3, 190, 1, 190, 100)
EmitLdargIL.Emit(OpCodes.Br, cont181)
EmitLdargIL.MarkLabel(fa181)
EmitLdargIL.Emit(OpCodes.Br, cont181)
EmitLdargIL.MarkLabel(cont181)
EmitLdargIL.MarkSequencePoint(doc3, 191, 1, 191, 100)
EmitLdargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.And)
EmitLdargIL.Emit(OpCodes.Stloc, 2)
EmitLdargIL.MarkSequencePoint(doc3, 193, 1, 193, 100)
EmitLdargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa182 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru182 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont182 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru182)
EmitLdargIL.Emit(OpCodes.Br, fa182)
EmitLdargIL.MarkLabel(tru182)
EmitLdargIL.MarkSequencePoint(doc3, 194, 1, 194, 100)
Dim typ47(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg.s")
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ47))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ47).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 195, 1, 195, 100)
Dim typ48(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
EmitLdargIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ48))
Typ = GetType(Convert).GetMethod("ToByte", typ48).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 3)
EmitLdargIL.MarkSequencePoint(doc3, 196, 1, 196, 100)
Dim typ49(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ49))
Typ = Typ03.GetMethod("Emit", typ49).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 197, 1, 197, 100)
EmitLdargIL.Emit(OpCodes.Br, label2)
EmitLdargIL.MarkSequencePoint(doc3, 198, 1, 198, 100)
EmitLdargIL.Emit(OpCodes.Br, cont182)
EmitLdargIL.MarkLabel(fa182)
EmitLdargIL.Emit(OpCodes.Br, cont182)
EmitLdargIL.MarkLabel(cont182)
EmitLdargIL.MarkSequencePoint(doc3, 200, 1, 200, 100)
EmitLdargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa183 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim tru183 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
Dim cont183 As System.Reflection.Emit.Label = EmitLdargIL.DefineLabel()
EmitLdargIL.Emit(OpCodes.Beq, tru183)
EmitLdargIL.Emit(OpCodes.Br, fa183)
EmitLdargIL.MarkLabel(tru183)
EmitLdargIL.MarkSequencePoint(doc3, 201, 1, 201, 100)
Dim typ50(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldstr, "ldarg")
Typ = GetType(System.String)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
EmitLdargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ50))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ50).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 0)
EmitLdargIL.MarkSequencePoint(doc3, 202, 1, 202, 100)
EmitLdargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ51 As Type() = {Typ}
EmitLdargIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ51))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ51).ReturnType
EmitLdargIL.Emit(OpCodes.Stloc, 4)
EmitLdargIL.MarkSequencePoint(doc3, 203, 1, 203, 100)
Dim typ52(-1) As Type
EmitLdargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
EmitLdargIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
EmitLdargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ52))
Typ = Typ03.GetMethod("Emit", typ52).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargIL.Emit(OpCodes.Pop)
End If
EmitLdargIL.MarkSequencePoint(doc3, 204, 1, 204, 100)
EmitLdargIL.Emit(OpCodes.Br, label2)
EmitLdargIL.MarkSequencePoint(doc3, 205, 1, 205, 100)
EmitLdargIL.Emit(OpCodes.Br, cont183)
EmitLdargIL.MarkLabel(fa183)
EmitLdargIL.Emit(OpCodes.Br, cont183)
EmitLdargIL.MarkLabel(cont183)
EmitLdargIL.MarkSequencePoint(doc3, 207, 1, 207, 100)
EmitLdargIL.MarkLabel(label2)
EmitLdargIL.MarkSequencePoint(doc3, 208, 1, 208, 100)
EmitLdargIL.Emit(OpCodes.Ret)
Dim typ53(-1) As Type
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = GetType(System.Int32)
Dim EmitLdarga As MethodBuilder = ILEmitter.DefineMethod("EmitLdarga", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ53)
Dim EmitLdargaIL As ILGenerator = EmitLdarga.GetILGenerator()
Dim EmitLdargaparam01 As ParameterBuilder = EmitLdarga.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdargaIL.MarkSequencePoint(doc3, 211, 1, 211, 100)
Dim locbldr23 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(OpCode))
locbldr23.SetLocalSymInfo("op")
EmitLdargaIL.MarkSequencePoint(doc3, 212, 1, 212, 100)
Dim locbldr24 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Boolean))
locbldr24.SetLocalSymInfo("b1")
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 1)
EmitLdargaIL.MarkSequencePoint(doc3, 213, 1, 213, 100)
Dim locbldr25 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Boolean))
locbldr25.SetLocalSymInfo("b2")
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 2)
EmitLdargaIL.MarkSequencePoint(doc3, 214, 1, 214, 100)
Dim locbldr26 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Byte))
locbldr26.SetLocalSymInfo("n8")
EmitLdargaIL.MarkSequencePoint(doc3, 215, 1, 215, 100)
Dim locbldr27 As LocalBuilder = EmitLdargaIL.DeclareLocal(GetType(System.Int16))
locbldr27.SetLocalSymInfo("n16")
EmitLdargaIL.MarkSequencePoint(doc3, 217, 1, 217, 100)
Dim label3 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.MarkSequencePoint(doc3, 219, 1, 219, 100)
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa184 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru184 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont184 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Bge, tru184)
EmitLdargaIL.Emit(OpCodes.Br, fa184)
EmitLdargaIL.MarkLabel(tru184)
EmitLdargaIL.MarkSequencePoint(doc3, 220, 1, 220, 100)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 1)
EmitLdargaIL.MarkSequencePoint(doc3, 221, 1, 221, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont184)
EmitLdargaIL.MarkLabel(fa184)
EmitLdargaIL.Emit(OpCodes.Br, cont184)
EmitLdargaIL.MarkLabel(cont184)
EmitLdargaIL.MarkSequencePoint(doc3, 222, 1, 222, 100)
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa185 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru185 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont185 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Ble, tru185)
EmitLdargaIL.Emit(OpCodes.Br, fa185)
EmitLdargaIL.MarkLabel(tru185)
EmitLdargaIL.MarkSequencePoint(doc3, 223, 1, 223, 100)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Stloc, 2)
EmitLdargaIL.MarkSequencePoint(doc3, 224, 1, 224, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont185)
EmitLdargaIL.MarkLabel(fa185)
EmitLdargaIL.Emit(OpCodes.Br, cont185)
EmitLdargaIL.MarkLabel(cont185)
EmitLdargaIL.MarkSequencePoint(doc3, 225, 1, 225, 100)
EmitLdargaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.And)
EmitLdargaIL.Emit(OpCodes.Stloc, 2)
EmitLdargaIL.MarkSequencePoint(doc3, 227, 1, 227, 100)
EmitLdargaIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa186 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru186 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont186 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Beq, tru186)
EmitLdargaIL.Emit(OpCodes.Br, fa186)
EmitLdargaIL.MarkLabel(tru186)
EmitLdargaIL.MarkSequencePoint(doc3, 228, 1, 228, 100)
Dim typ54(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldstr, "ldarga.s")
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
EmitLdargaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ54))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ54).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 0)
EmitLdargaIL.MarkSequencePoint(doc3, 229, 1, 229, 100)
Dim typ55(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
EmitLdargaIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ55))
Typ = GetType(Convert).GetMethod("ToByte", typ55).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 3)
EmitLdargaIL.MarkSequencePoint(doc3, 230, 1, 230, 100)
Dim typ56(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
EmitLdargaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ56))
Typ = Typ03.GetMethod("Emit", typ56).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargaIL.Emit(OpCodes.Pop)
End If
EmitLdargaIL.MarkSequencePoint(doc3, 231, 1, 231, 100)
EmitLdargaIL.Emit(OpCodes.Br, label3)
EmitLdargaIL.MarkSequencePoint(doc3, 232, 1, 232, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont186)
EmitLdargaIL.MarkLabel(fa186)
EmitLdargaIL.Emit(OpCodes.Br, cont186)
EmitLdargaIL.MarkLabel(cont186)
EmitLdargaIL.MarkSequencePoint(doc3, 234, 1, 234, 100)
EmitLdargaIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdargaIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa187 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim tru187 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
Dim cont187 As System.Reflection.Emit.Label = EmitLdargaIL.DefineLabel()
EmitLdargaIL.Emit(OpCodes.Beq, tru187)
EmitLdargaIL.Emit(OpCodes.Br, fa187)
EmitLdargaIL.MarkLabel(tru187)
EmitLdargaIL.MarkSequencePoint(doc3, 235, 1, 235, 100)
Dim typ57(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldstr, "ldarga")
Typ = GetType(System.String)
ReDim Preserve typ57(UBound(typ57) + 1)
typ57(UBound(typ57)) = Typ
EmitLdargaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ57))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ57).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 0)
EmitLdargaIL.MarkSequencePoint(doc3, 236, 1, 236, 100)
EmitLdargaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ58 As Type() = {Typ}
EmitLdargaIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ58))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ58).ReturnType
EmitLdargaIL.Emit(OpCodes.Stloc, 4)
EmitLdargaIL.MarkSequencePoint(doc3, 237, 1, 237, 100)
Dim typ59(-1) As Type
EmitLdargaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
EmitLdargaIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
EmitLdargaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ59))
Typ = Typ03.GetMethod("Emit", typ59).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdargaIL.Emit(OpCodes.Pop)
End If
EmitLdargaIL.MarkSequencePoint(doc3, 238, 1, 238, 100)
EmitLdargaIL.Emit(OpCodes.Br, label3)
EmitLdargaIL.MarkSequencePoint(doc3, 239, 1, 239, 100)
EmitLdargaIL.Emit(OpCodes.Br, cont187)
EmitLdargaIL.MarkLabel(fa187)
EmitLdargaIL.Emit(OpCodes.Br, cont187)
EmitLdargaIL.MarkLabel(cont187)
EmitLdargaIL.MarkSequencePoint(doc3, 241, 1, 241, 100)
EmitLdargaIL.MarkLabel(label3)
EmitLdargaIL.MarkSequencePoint(doc3, 242, 1, 242, 100)
EmitLdargaIL.Emit(OpCodes.Ret)
Dim typ60(-1) As Type
ReDim Preserve typ60(UBound(typ60) + 1)
typ60(UBound(typ60)) = GetType(System.Int32)
Dim EmitStloc As MethodBuilder = ILEmitter.DefineMethod("EmitStloc", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ60)
Dim EmitStlocIL As ILGenerator = EmitStloc.GetILGenerator()
Dim EmitStlocparam01 As ParameterBuilder = EmitStloc.DefineParameter(1, ParameterAttributes.None, "num")
EmitStlocIL.MarkSequencePoint(doc3, 245, 1, 245, 100)
Dim locbldr28 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(OpCode))
locbldr28.SetLocalSymInfo("op")
EmitStlocIL.MarkSequencePoint(doc3, 246, 1, 246, 100)
Dim locbldr29 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Boolean))
locbldr29.SetLocalSymInfo("b1")
EmitStlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 1)
EmitStlocIL.MarkSequencePoint(doc3, 247, 1, 247, 100)
Dim locbldr30 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Boolean))
locbldr30.SetLocalSymInfo("b2")
EmitStlocIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 2)
EmitStlocIL.MarkSequencePoint(doc3, 248, 1, 248, 100)
Dim locbldr31 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Byte))
locbldr31.SetLocalSymInfo("n8")
EmitStlocIL.MarkSequencePoint(doc3, 249, 1, 249, 100)
Dim locbldr32 As LocalBuilder = EmitStlocIL.DeclareLocal(GetType(System.Int16))
locbldr32.SetLocalSymInfo("n16")
EmitStlocIL.MarkSequencePoint(doc3, 251, 1, 251, 100)
Dim label4 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.MarkSequencePoint(doc3, 253, 1, 253, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa188 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru188 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont188 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru188)
EmitStlocIL.Emit(OpCodes.Br, fa188)
EmitStlocIL.MarkLabel(tru188)
EmitStlocIL.MarkSequencePoint(doc3, 254, 1, 254, 100)
Dim typ61(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.0")
Typ = GetType(System.String)
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ61))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ61).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 255, 1, 255, 100)
Dim typ62(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ62))
Typ = Typ03.GetMethod("Emit", typ62).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 256, 1, 256, 100)
EmitStlocIL.Emit(OpCodes.Br, label4)
EmitStlocIL.MarkSequencePoint(doc3, 257, 1, 257, 100)
EmitStlocIL.Emit(OpCodes.Br, cont188)
EmitStlocIL.MarkLabel(fa188)
EmitStlocIL.Emit(OpCodes.Br, cont188)
EmitStlocIL.MarkLabel(cont188)
EmitStlocIL.MarkSequencePoint(doc3, 259, 1, 259, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa189 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru189 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont189 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru189)
EmitStlocIL.Emit(OpCodes.Br, fa189)
EmitStlocIL.MarkLabel(tru189)
EmitStlocIL.MarkSequencePoint(doc3, 260, 1, 260, 100)
Dim typ63(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.1")
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ63))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ63).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 261, 1, 261, 100)
Dim typ64(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ64(UBound(typ64) + 1)
typ64(UBound(typ64)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ64))
Typ = Typ03.GetMethod("Emit", typ64).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 262, 1, 262, 100)
EmitStlocIL.Emit(OpCodes.Br, label4)
EmitStlocIL.MarkSequencePoint(doc3, 263, 1, 263, 100)
EmitStlocIL.Emit(OpCodes.Br, cont189)
EmitStlocIL.MarkLabel(fa189)
EmitStlocIL.Emit(OpCodes.Br, cont189)
EmitStlocIL.MarkLabel(cont189)
EmitStlocIL.MarkSequencePoint(doc3, 265, 1, 265, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa190 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru190 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont190 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru190)
EmitStlocIL.Emit(OpCodes.Br, fa190)
EmitStlocIL.MarkLabel(tru190)
EmitStlocIL.MarkSequencePoint(doc3, 266, 1, 266, 100)
Dim typ65(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.2")
Typ = GetType(System.String)
ReDim Preserve typ65(UBound(typ65) + 1)
typ65(UBound(typ65)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ65))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ65).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 267, 1, 267, 100)
Dim typ66(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ66))
Typ = Typ03.GetMethod("Emit", typ66).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 268, 1, 268, 100)
EmitStlocIL.Emit(OpCodes.Br, label4)
EmitStlocIL.MarkSequencePoint(doc3, 269, 1, 269, 100)
EmitStlocIL.Emit(OpCodes.Br, cont190)
EmitStlocIL.MarkLabel(fa190)
EmitStlocIL.Emit(OpCodes.Br, cont190)
EmitStlocIL.MarkLabel(cont190)
EmitStlocIL.MarkSequencePoint(doc3, 271, 1, 271, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa191 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru191 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont191 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru191)
EmitStlocIL.Emit(OpCodes.Br, fa191)
EmitStlocIL.MarkLabel(tru191)
EmitStlocIL.MarkSequencePoint(doc3, 272, 1, 272, 100)
Dim typ67(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.3")
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ67))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ67).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 273, 1, 273, 100)
Dim typ68(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ68(UBound(typ68) + 1)
typ68(UBound(typ68)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ68))
Typ = Typ03.GetMethod("Emit", typ68).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 274, 1, 274, 100)
EmitStlocIL.Emit(OpCodes.Br, label4)
EmitStlocIL.MarkSequencePoint(doc3, 275, 1, 275, 100)
EmitStlocIL.Emit(OpCodes.Br, cont191)
EmitStlocIL.MarkLabel(fa191)
EmitStlocIL.Emit(OpCodes.Br, cont191)
EmitStlocIL.MarkLabel(cont191)
EmitStlocIL.MarkSequencePoint(doc3, 277, 1, 277, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa192 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru192 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont192 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Bge, tru192)
EmitStlocIL.Emit(OpCodes.Br, fa192)
EmitStlocIL.MarkLabel(tru192)
EmitStlocIL.MarkSequencePoint(doc3, 278, 1, 278, 100)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 1)
EmitStlocIL.MarkSequencePoint(doc3, 279, 1, 279, 100)
EmitStlocIL.Emit(OpCodes.Br, cont192)
EmitStlocIL.MarkLabel(fa192)
EmitStlocIL.Emit(OpCodes.Br, cont192)
EmitStlocIL.MarkLabel(cont192)
EmitStlocIL.MarkSequencePoint(doc3, 280, 1, 280, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStlocIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa193 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru193 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont193 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Ble, tru193)
EmitStlocIL.Emit(OpCodes.Br, fa193)
EmitStlocIL.MarkLabel(tru193)
EmitStlocIL.MarkSequencePoint(doc3, 281, 1, 281, 100)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Stloc, 2)
EmitStlocIL.MarkSequencePoint(doc3, 282, 1, 282, 100)
EmitStlocIL.Emit(OpCodes.Br, cont193)
EmitStlocIL.MarkLabel(fa193)
EmitStlocIL.Emit(OpCodes.Br, cont193)
EmitStlocIL.MarkLabel(cont193)
EmitStlocIL.MarkSequencePoint(doc3, 283, 1, 283, 100)
EmitStlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.And)
EmitStlocIL.Emit(OpCodes.Stloc, 2)
EmitStlocIL.MarkSequencePoint(doc3, 285, 1, 285, 100)
EmitStlocIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa194 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru194 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont194 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru194)
EmitStlocIL.Emit(OpCodes.Br, fa194)
EmitStlocIL.MarkLabel(tru194)
EmitStlocIL.MarkSequencePoint(doc3, 286, 1, 286, 100)
Dim typ69(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc.s")
Typ = GetType(System.String)
ReDim Preserve typ69(UBound(typ69) + 1)
typ69(UBound(typ69)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ69))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ69).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 287, 1, 287, 100)
Dim typ70(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = Typ
EmitStlocIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ70))
Typ = GetType(Convert).GetMethod("ToByte", typ70).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 3)
EmitStlocIL.MarkSequencePoint(doc3, 288, 1, 288, 100)
Dim typ71(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ71))
Typ = Typ03.GetMethod("Emit", typ71).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 289, 1, 289, 100)
EmitStlocIL.Emit(OpCodes.Br, label4)
EmitStlocIL.MarkSequencePoint(doc3, 290, 1, 290, 100)
EmitStlocIL.Emit(OpCodes.Br, cont194)
EmitStlocIL.MarkLabel(fa194)
EmitStlocIL.Emit(OpCodes.Br, cont194)
EmitStlocIL.MarkLabel(cont194)
EmitStlocIL.MarkSequencePoint(doc3, 292, 1, 292, 100)
EmitStlocIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStlocIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa195 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim tru195 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
Dim cont195 As System.Reflection.Emit.Label = EmitStlocIL.DefineLabel()
EmitStlocIL.Emit(OpCodes.Beq, tru195)
EmitStlocIL.Emit(OpCodes.Br, fa195)
EmitStlocIL.MarkLabel(tru195)
EmitStlocIL.MarkSequencePoint(doc3, 293, 1, 293, 100)
Dim typ72(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldstr, "stloc")
Typ = GetType(System.String)
ReDim Preserve typ72(UBound(typ72) + 1)
typ72(UBound(typ72)) = Typ
EmitStlocIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ72))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ72).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 0)
EmitStlocIL.MarkSequencePoint(doc3, 294, 1, 294, 100)
EmitStlocIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ73 As Type() = {Typ}
EmitStlocIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ73))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ73).ReturnType
EmitStlocIL.Emit(OpCodes.Stloc, 4)
EmitStlocIL.MarkSequencePoint(doc3, 295, 1, 295, 100)
Dim typ74(-1) As Type
EmitStlocIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = Typ
EmitStlocIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = Typ
EmitStlocIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ74))
Typ = Typ03.GetMethod("Emit", typ74).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStlocIL.Emit(OpCodes.Pop)
End If
EmitStlocIL.MarkSequencePoint(doc3, 296, 1, 296, 100)
EmitStlocIL.Emit(OpCodes.Br, label4)
EmitStlocIL.MarkSequencePoint(doc3, 297, 1, 297, 100)
EmitStlocIL.Emit(OpCodes.Br, cont195)
EmitStlocIL.MarkLabel(fa195)
EmitStlocIL.Emit(OpCodes.Br, cont195)
EmitStlocIL.MarkLabel(cont195)
EmitStlocIL.MarkSequencePoint(doc3, 299, 1, 299, 100)
EmitStlocIL.MarkLabel(label4)
EmitStlocIL.MarkSequencePoint(doc3, 300, 1, 300, 100)
EmitStlocIL.Emit(OpCodes.Ret)
Dim typ75(-1) As Type
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = GetType(System.Int32)
Dim EmitStarg As MethodBuilder = ILEmitter.DefineMethod("EmitStarg", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ75)
Dim EmitStargIL As ILGenerator = EmitStarg.GetILGenerator()
Dim EmitStargparam01 As ParameterBuilder = EmitStarg.DefineParameter(1, ParameterAttributes.None, "num")
EmitStargIL.MarkSequencePoint(doc3, 304, 1, 304, 100)
Dim locbldr33 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(OpCode))
locbldr33.SetLocalSymInfo("op")
EmitStargIL.MarkSequencePoint(doc3, 305, 1, 305, 100)
Dim locbldr34 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Boolean))
locbldr34.SetLocalSymInfo("b1")
EmitStargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 1)
EmitStargIL.MarkSequencePoint(doc3, 306, 1, 306, 100)
Dim locbldr35 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Boolean))
locbldr35.SetLocalSymInfo("b2")
EmitStargIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 2)
EmitStargIL.MarkSequencePoint(doc3, 307, 1, 307, 100)
Dim locbldr36 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Byte))
locbldr36.SetLocalSymInfo("n8")
EmitStargIL.MarkSequencePoint(doc3, 308, 1, 308, 100)
Dim locbldr37 As LocalBuilder = EmitStargIL.DeclareLocal(GetType(System.Int16))
locbldr37.SetLocalSymInfo("n16")
EmitStargIL.MarkSequencePoint(doc3, 310, 1, 310, 100)
Dim label5 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.MarkSequencePoint(doc3, 312, 1, 312, 100)
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStargIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa196 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru196 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont196 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Bge, tru196)
EmitStargIL.Emit(OpCodes.Br, fa196)
EmitStargIL.MarkLabel(tru196)
EmitStargIL.MarkSequencePoint(doc3, 313, 1, 313, 100)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 1)
EmitStargIL.MarkSequencePoint(doc3, 314, 1, 314, 100)
EmitStargIL.Emit(OpCodes.Br, cont196)
EmitStargIL.MarkLabel(fa196)
EmitStargIL.Emit(OpCodes.Br, cont196)
EmitStargIL.MarkLabel(cont196)
EmitStargIL.MarkSequencePoint(doc3, 315, 1, 315, 100)
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitStargIL.Emit(OpCodes.Ldc_I4, CInt(255))
Typ = GetType(System.Int32)
Dim fa197 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru197 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont197 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Ble, tru197)
EmitStargIL.Emit(OpCodes.Br, fa197)
EmitStargIL.MarkLabel(tru197)
EmitStargIL.MarkSequencePoint(doc3, 316, 1, 316, 100)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Stloc, 2)
EmitStargIL.MarkSequencePoint(doc3, 317, 1, 317, 100)
EmitStargIL.Emit(OpCodes.Br, cont197)
EmitStargIL.MarkLabel(fa197)
EmitStargIL.Emit(OpCodes.Br, cont197)
EmitStargIL.MarkLabel(cont197)
EmitStargIL.MarkSequencePoint(doc3, 318, 1, 318, 100)
EmitStargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.And)
EmitStargIL.Emit(OpCodes.Stloc, 2)
EmitStargIL.MarkSequencePoint(doc3, 320, 1, 320, 100)
EmitStargIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa198 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru198 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont198 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Beq, tru198)
EmitStargIL.Emit(OpCodes.Br, fa198)
EmitStargIL.MarkLabel(tru198)
EmitStargIL.MarkSequencePoint(doc3, 321, 1, 321, 100)
Dim typ76(-1) As Type
EmitStargIL.Emit(OpCodes.Ldstr, "starg.s")
Typ = GetType(System.String)
ReDim Preserve typ76(UBound(typ76) + 1)
typ76(UBound(typ76)) = Typ
EmitStargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ76))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ76).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 0)
EmitStargIL.MarkSequencePoint(doc3, 322, 1, 322, 100)
Dim typ77(-1) As Type
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ77(UBound(typ77) + 1)
typ77(UBound(typ77)) = Typ
EmitStargIL.Emit(OpCodes.Call, GetType(Convert).GetMethod("ToByte", typ77))
Typ = GetType(Convert).GetMethod("ToByte", typ77).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 3)
EmitStargIL.MarkSequencePoint(doc3, 323, 1, 323, 100)
Dim typ78(-1) As Type
EmitStargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ78(UBound(typ78) + 1)
typ78(UBound(typ78)) = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Byte)
ReDim Preserve typ78(UBound(typ78) + 1)
typ78(UBound(typ78)) = Typ
EmitStargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ78))
Typ = Typ03.GetMethod("Emit", typ78).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStargIL.Emit(OpCodes.Pop)
End If
EmitStargIL.MarkSequencePoint(doc3, 324, 1, 324, 100)
EmitStargIL.Emit(OpCodes.Br, label5)
EmitStargIL.MarkSequencePoint(doc3, 325, 1, 325, 100)
EmitStargIL.Emit(OpCodes.Br, cont198)
EmitStargIL.MarkLabel(fa198)
EmitStargIL.Emit(OpCodes.Br, cont198)
EmitStargIL.MarkLabel(cont198)
EmitStargIL.MarkSequencePoint(doc3, 327, 1, 327, 100)
EmitStargIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitStargIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa199 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim tru199 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
Dim cont199 As System.Reflection.Emit.Label = EmitStargIL.DefineLabel()
EmitStargIL.Emit(OpCodes.Beq, tru199)
EmitStargIL.Emit(OpCodes.Br, fa199)
EmitStargIL.MarkLabel(tru199)
EmitStargIL.MarkSequencePoint(doc3, 328, 1, 328, 100)
Dim typ79(-1) As Type
EmitStargIL.Emit(OpCodes.Ldstr, "starg")
Typ = GetType(System.String)
ReDim Preserve typ79(UBound(typ79) + 1)
typ79(UBound(typ79)) = Typ
EmitStargIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ79))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ79).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 0)
EmitStargIL.MarkSequencePoint(doc3, 329, 1, 329, 100)
EmitStargIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
Dim typ80 As Type() = {Typ}
EmitStargIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ80))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ80).ReturnType
EmitStargIL.Emit(OpCodes.Stloc, 4)
EmitStargIL.MarkSequencePoint(doc3, 330, 1, 330, 100)
Dim typ81(-1) As Type
EmitStargIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ81(UBound(typ81) + 1)
typ81(UBound(typ81)) = Typ
EmitStargIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int16)
ReDim Preserve typ81(UBound(typ81) + 1)
typ81(UBound(typ81)) = Typ
EmitStargIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ81))
Typ = Typ03.GetMethod("Emit", typ81).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStargIL.Emit(OpCodes.Pop)
End If
EmitStargIL.MarkSequencePoint(doc3, 331, 1, 331, 100)
EmitStargIL.Emit(OpCodes.Br, label5)
EmitStargIL.MarkSequencePoint(doc3, 332, 1, 332, 100)
EmitStargIL.Emit(OpCodes.Br, cont199)
EmitStargIL.MarkLabel(fa199)
EmitStargIL.Emit(OpCodes.Br, cont199)
EmitStargIL.MarkLabel(cont199)
EmitStargIL.MarkSequencePoint(doc3, 334, 1, 334, 100)
EmitStargIL.MarkLabel(label5)
EmitStargIL.MarkSequencePoint(doc3, 335, 1, 335, 100)
EmitStargIL.Emit(OpCodes.Ret)
Dim typ82(-1) As Type
ReDim Preserve typ82(UBound(typ82) + 1)
typ82(UBound(typ82)) = GetType(FieldInfo)
Dim EmitStfld As MethodBuilder = ILEmitter.DefineMethod("EmitStfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ82)
Dim EmitStfldIL As ILGenerator = EmitStfld.GetILGenerator()
Dim EmitStfldparam01 As ParameterBuilder = EmitStfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitStfldIL.MarkSequencePoint(doc3, 338, 1, 338, 100)
Dim locbldr38 As LocalBuilder = EmitStfldIL.DeclareLocal(GetType(OpCode))
locbldr38.SetLocalSymInfo("lop")
Dim typ83(-1) As Type
EmitStfldIL.Emit(OpCodes.Ldstr, "stfld")
Typ = GetType(System.String)
ReDim Preserve typ83(UBound(typ83) + 1)
typ83(UBound(typ83)) = Typ
EmitStfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ83))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ83).ReturnType
EmitStfldIL.Emit(OpCodes.Stloc, 0)
EmitStfldIL.MarkSequencePoint(doc3, 339, 1, 339, 100)
Dim typ84(-1) As Type
EmitStfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
EmitStfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
EmitStfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ84))
Typ = Typ03.GetMethod("Emit", typ84).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStfldIL.Emit(OpCodes.Pop)
End If
EmitStfldIL.MarkSequencePoint(doc3, 340, 1, 340, 100)
EmitStfldIL.Emit(OpCodes.Ret)
Dim typ85(-1) As Type
ReDim Preserve typ85(UBound(typ85) + 1)
typ85(UBound(typ85)) = GetType(FieldInfo)
Dim EmitStsfld As MethodBuilder = ILEmitter.DefineMethod("EmitStsfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ85)
Dim EmitStsfldIL As ILGenerator = EmitStsfld.GetILGenerator()
Dim EmitStsfldparam01 As ParameterBuilder = EmitStsfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitStsfldIL.MarkSequencePoint(doc3, 343, 1, 343, 100)
Dim locbldr39 As LocalBuilder = EmitStsfldIL.DeclareLocal(GetType(OpCode))
locbldr39.SetLocalSymInfo("lsop")
Dim typ86(-1) As Type
EmitStsfldIL.Emit(OpCodes.Ldstr, "stsfld")
Typ = GetType(System.String)
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
EmitStsfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ86))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ86).ReturnType
EmitStsfldIL.Emit(OpCodes.Stloc, 0)
EmitStsfldIL.MarkSequencePoint(doc3, 344, 1, 344, 100)
Dim typ87(-1) As Type
EmitStsfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStsfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
EmitStsfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
EmitStsfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ87))
Typ = Typ03.GetMethod("Emit", typ87).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStsfldIL.Emit(OpCodes.Pop)
End If
EmitStsfldIL.MarkSequencePoint(doc3, 345, 1, 345, 100)
EmitStsfldIL.Emit(OpCodes.Ret)
Dim typ88(-1) As Type
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = GetType(System.Type)
Dim EmitStelem As MethodBuilder = ILEmitter.DefineMethod("EmitStelem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ88)
Dim EmitStelemIL As ILGenerator = EmitStelem.GetILGenerator()
Dim EmitStelemparam01 As ParameterBuilder = EmitStelem.DefineParameter(1, ParameterAttributes.None, "typ")
EmitStelemIL.MarkSequencePoint(doc3, 349, 1, 349, 100)
Dim locbldr40 As LocalBuilder = EmitStelemIL.DeclareLocal(GetType(System.Type))
locbldr40.SetLocalSymInfo("t1")
EmitStelemIL.MarkSequencePoint(doc3, 350, 1, 350, 100)
Dim locbldr41 As LocalBuilder = EmitStelemIL.DeclareLocal(GetType(OpCode))
locbldr41.SetLocalSymInfo("op")
EmitStelemIL.MarkSequencePoint(doc3, 351, 1, 351, 100)
Dim locbldr42 As LocalBuilder = EmitStelemIL.DeclareLocal(GetType(System.Boolean))
locbldr42.SetLocalSymInfo("b")
EmitStelemIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 353, 1, 353, 100)
Dim label6 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.MarkSequencePoint(doc3, 355, 1, 355, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(IntPtr))
Dim typ89 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ89))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ89).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 356, 1, 356, 100)
Dim typ90(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ90))
Typ = Typ03.GetMethod("Equals", typ90).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 357, 1, 357, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa200 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru200 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont200 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru200)
EmitStelemIL.Emit(OpCodes.Br, fa200)
EmitStelemIL.MarkLabel(tru200)
EmitStelemIL.MarkSequencePoint(doc3, 358, 1, 358, 100)
Dim typ91(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i")
Typ = GetType(System.String)
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ91))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ91).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 359, 1, 359, 100)
Dim typ92(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ92))
Typ = Typ03.GetMethod("Emit", typ92).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 360, 1, 360, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 361, 1, 361, 100)
EmitStelemIL.Emit(OpCodes.Br, cont200)
EmitStelemIL.MarkLabel(fa200)
EmitStelemIL.Emit(OpCodes.Br, cont200)
EmitStelemIL.MarkLabel(cont200)
EmitStelemIL.MarkSequencePoint(doc3, 363, 1, 363, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.SByte))
Dim typ93 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ93))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ93).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 364, 1, 364, 100)
Dim typ94(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ94(UBound(typ94) + 1)
typ94(UBound(typ94)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ94))
Typ = Typ03.GetMethod("Equals", typ94).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 365, 1, 365, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa201 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru201 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont201 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru201)
EmitStelemIL.Emit(OpCodes.Br, fa201)
EmitStelemIL.MarkLabel(tru201)
EmitStelemIL.MarkSequencePoint(doc3, 366, 1, 366, 100)
Dim typ95(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i1")
Typ = GetType(System.String)
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ95))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ95).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 367, 1, 367, 100)
Dim typ96(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ96(UBound(typ96) + 1)
typ96(UBound(typ96)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ96))
Typ = Typ03.GetMethod("Emit", typ96).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 368, 1, 368, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 369, 1, 369, 100)
EmitStelemIL.Emit(OpCodes.Br, cont201)
EmitStelemIL.MarkLabel(fa201)
EmitStelemIL.Emit(OpCodes.Br, cont201)
EmitStelemIL.MarkLabel(cont201)
EmitStelemIL.MarkSequencePoint(doc3, 371, 1, 371, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int16))
Dim typ97 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ97))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ97).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 372, 1, 372, 100)
Dim typ98(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ98))
Typ = Typ03.GetMethod("Equals", typ98).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 373, 1, 373, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa202 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru202 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont202 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru202)
EmitStelemIL.Emit(OpCodes.Br, fa202)
EmitStelemIL.MarkLabel(tru202)
EmitStelemIL.MarkSequencePoint(doc3, 374, 1, 374, 100)
Dim typ99(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i2")
Typ = GetType(System.String)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ99))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ99).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 375, 1, 375, 100)
Dim typ100(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ100(UBound(typ100) + 1)
typ100(UBound(typ100)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ100))
Typ = Typ03.GetMethod("Emit", typ100).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 376, 1, 376, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 377, 1, 377, 100)
EmitStelemIL.Emit(OpCodes.Br, cont202)
EmitStelemIL.MarkLabel(fa202)
EmitStelemIL.Emit(OpCodes.Br, cont202)
EmitStelemIL.MarkLabel(cont202)
EmitStelemIL.MarkSequencePoint(doc3, 379, 1, 379, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int32))
Dim typ101 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ101))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ101).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 380, 1, 380, 100)
Dim typ102(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ102))
Typ = Typ03.GetMethod("Equals", typ102).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 381, 1, 381, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa203 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru203 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont203 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru203)
EmitStelemIL.Emit(OpCodes.Br, fa203)
EmitStelemIL.MarkLabel(tru203)
EmitStelemIL.MarkSequencePoint(doc3, 382, 1, 382, 100)
Dim typ103(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i4")
Typ = GetType(System.String)
ReDim Preserve typ103(UBound(typ103) + 1)
typ103(UBound(typ103)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ103))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ103).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 383, 1, 383, 100)
Dim typ104(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ104(UBound(typ104) + 1)
typ104(UBound(typ104)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ104))
Typ = Typ03.GetMethod("Emit", typ104).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 384, 1, 384, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 385, 1, 385, 100)
EmitStelemIL.Emit(OpCodes.Br, cont203)
EmitStelemIL.MarkLabel(fa203)
EmitStelemIL.Emit(OpCodes.Br, cont203)
EmitStelemIL.MarkLabel(cont203)
EmitStelemIL.MarkSequencePoint(doc3, 387, 1, 387, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int64))
Dim typ105 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ105))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ105).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 388, 1, 388, 100)
Dim typ106(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ106(UBound(typ106) + 1)
typ106(UBound(typ106)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ106))
Typ = Typ03.GetMethod("Equals", typ106).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 389, 1, 389, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa204 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru204 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont204 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru204)
EmitStelemIL.Emit(OpCodes.Br, fa204)
EmitStelemIL.MarkLabel(tru204)
EmitStelemIL.MarkSequencePoint(doc3, 390, 1, 390, 100)
Dim typ107(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.i8")
Typ = GetType(System.String)
ReDim Preserve typ107(UBound(typ107) + 1)
typ107(UBound(typ107)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ107))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ107).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 391, 1, 391, 100)
Dim typ108(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ108(UBound(typ108) + 1)
typ108(UBound(typ108)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ108))
Typ = Typ03.GetMethod("Emit", typ108).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 392, 1, 392, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 393, 1, 393, 100)
EmitStelemIL.Emit(OpCodes.Br, cont204)
EmitStelemIL.MarkLabel(fa204)
EmitStelemIL.Emit(OpCodes.Br, cont204)
EmitStelemIL.MarkLabel(cont204)
EmitStelemIL.MarkSequencePoint(doc3, 395, 1, 395, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Single))
Dim typ109 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ109))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ109).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 396, 1, 396, 100)
Dim typ110(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ110(UBound(typ110) + 1)
typ110(UBound(typ110)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ110))
Typ = Typ03.GetMethod("Equals", typ110).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 397, 1, 397, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa205 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru205 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont205 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru205)
EmitStelemIL.Emit(OpCodes.Br, fa205)
EmitStelemIL.MarkLabel(tru205)
EmitStelemIL.MarkSequencePoint(doc3, 398, 1, 398, 100)
Dim typ111(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.r4")
Typ = GetType(System.String)
ReDim Preserve typ111(UBound(typ111) + 1)
typ111(UBound(typ111)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ111))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ111).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 399, 1, 399, 100)
Dim typ112(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ112(UBound(typ112) + 1)
typ112(UBound(typ112)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ112))
Typ = Typ03.GetMethod("Emit", typ112).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 400, 1, 400, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 401, 1, 401, 100)
EmitStelemIL.Emit(OpCodes.Br, cont205)
EmitStelemIL.MarkLabel(fa205)
EmitStelemIL.Emit(OpCodes.Br, cont205)
EmitStelemIL.MarkLabel(cont205)
EmitStelemIL.MarkSequencePoint(doc3, 403, 1, 403, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Double))
Dim typ113 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ113))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ113).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 404, 1, 404, 100)
Dim typ114(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ114(UBound(typ114) + 1)
typ114(UBound(typ114)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ114))
Typ = Typ03.GetMethod("Equals", typ114).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 405, 1, 405, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa206 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru206 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont206 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru206)
EmitStelemIL.Emit(OpCodes.Br, fa206)
EmitStelemIL.MarkLabel(tru206)
EmitStelemIL.MarkSequencePoint(doc3, 406, 1, 406, 100)
Dim typ115(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.r8")
Typ = GetType(System.String)
ReDim Preserve typ115(UBound(typ115) + 1)
typ115(UBound(typ115)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ115))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ115).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 407, 1, 407, 100)
Dim typ116(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ116(UBound(typ116) + 1)
typ116(UBound(typ116)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ116))
Typ = Typ03.GetMethod("Emit", typ116).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 408, 1, 408, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 409, 1, 409, 100)
EmitStelemIL.Emit(OpCodes.Br, cont206)
EmitStelemIL.MarkLabel(fa206)
EmitStelemIL.Emit(OpCodes.Br, cont206)
EmitStelemIL.MarkLabel(cont206)
EmitStelemIL.MarkSequencePoint(doc3, 411, 1, 411, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(ValueType))
Dim typ117 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ117))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ117).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 412, 1, 412, 100)
Dim typ118(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ118(UBound(typ118) + 1)
typ118(UBound(typ118)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ118))
Typ = Typ03.GetMethod("IsAssignableFrom", typ118).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 413, 1, 413, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa207 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru207 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont207 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru207)
EmitStelemIL.Emit(OpCodes.Br, fa207)
EmitStelemIL.MarkLabel(tru207)
EmitStelemIL.MarkSequencePoint(doc3, 414, 1, 414, 100)
Dim typ119(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem")
Typ = GetType(System.String)
ReDim Preserve typ119(UBound(typ119) + 1)
typ119(UBound(typ119)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ119))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ119).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 415, 1, 415, 100)
Dim typ120(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ120(UBound(typ120) + 1)
typ120(UBound(typ120)) = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ120(UBound(typ120) + 1)
typ120(UBound(typ120)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ120))
Typ = Typ03.GetMethod("Emit", typ120).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 416, 1, 416, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 417, 1, 417, 100)
EmitStelemIL.Emit(OpCodes.Br, cont207)
EmitStelemIL.MarkLabel(fa207)
EmitStelemIL.Emit(OpCodes.Br, cont207)
EmitStelemIL.MarkLabel(cont207)
EmitStelemIL.MarkSequencePoint(doc3, 419, 1, 419, 100)
EmitStelemIL.Emit(OpCodes.Ldtoken, GetType(System.Object))
Dim typ121 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ121))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ121).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 0)
EmitStelemIL.MarkSequencePoint(doc3, 420, 1, 420, 100)
Dim typ122(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ122(UBound(typ122) + 1)
typ122(UBound(typ122)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ122))
Typ = Typ03.GetMethod("IsAssignableFrom", typ122).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 2)
EmitStelemIL.MarkSequencePoint(doc3, 421, 1, 421, 100)
EmitStelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitStelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa208 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim tru208 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
Dim cont208 As System.Reflection.Emit.Label = EmitStelemIL.DefineLabel()
EmitStelemIL.Emit(OpCodes.Beq, tru208)
EmitStelemIL.Emit(OpCodes.Br, fa208)
EmitStelemIL.MarkLabel(tru208)
EmitStelemIL.MarkSequencePoint(doc3, 422, 1, 422, 100)
Dim typ123(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldstr, "stelem.ref")
Typ = GetType(System.String)
ReDim Preserve typ123(UBound(typ123) + 1)
typ123(UBound(typ123)) = Typ
EmitStelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ123))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ123).ReturnType
EmitStelemIL.Emit(OpCodes.Stloc, 1)
EmitStelemIL.MarkSequencePoint(doc3, 423, 1, 423, 100)
Dim typ124(-1) As Type
EmitStelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ124(UBound(typ124) + 1)
typ124(UBound(typ124)) = Typ
EmitStelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ124))
Typ = Typ03.GetMethod("Emit", typ124).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStelemIL.Emit(OpCodes.Pop)
End If
EmitStelemIL.MarkSequencePoint(doc3, 424, 1, 424, 100)
EmitStelemIL.Emit(OpCodes.Br, label6)
EmitStelemIL.MarkSequencePoint(doc3, 425, 1, 425, 100)
EmitStelemIL.Emit(OpCodes.Br, cont208)
EmitStelemIL.MarkLabel(fa208)
EmitStelemIL.Emit(OpCodes.Br, cont208)
EmitStelemIL.MarkLabel(cont208)
EmitStelemIL.MarkSequencePoint(doc3, 428, 1, 428, 100)
EmitStelemIL.MarkLabel(label6)
EmitStelemIL.MarkSequencePoint(doc3, 430, 1, 430, 100)
EmitStelemIL.Emit(OpCodes.Ret)
Dim typ125(-1) As Type
ReDim Preserve typ125(UBound(typ125) + 1)
typ125(UBound(typ125)) = GetType(System.Type)
Dim EmitLdelem As MethodBuilder = ILEmitter.DefineMethod("EmitLdelem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ125)
Dim EmitLdelemIL As ILGenerator = EmitLdelem.GetILGenerator()
Dim EmitLdelemparam01 As ParameterBuilder = EmitLdelem.DefineParameter(1, ParameterAttributes.None, "typ")
EmitLdelemIL.MarkSequencePoint(doc3, 434, 1, 434, 100)
Dim locbldr43 As LocalBuilder = EmitLdelemIL.DeclareLocal(GetType(System.Type))
locbldr43.SetLocalSymInfo("t1")
EmitLdelemIL.MarkSequencePoint(doc3, 435, 1, 435, 100)
Dim locbldr44 As LocalBuilder = EmitLdelemIL.DeclareLocal(GetType(OpCode))
locbldr44.SetLocalSymInfo("op")
EmitLdelemIL.MarkSequencePoint(doc3, 436, 1, 436, 100)
Dim locbldr45 As LocalBuilder = EmitLdelemIL.DeclareLocal(GetType(System.Boolean))
locbldr45.SetLocalSymInfo("b")
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 438, 1, 438, 100)
Dim label7 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.MarkSequencePoint(doc3, 440, 1, 440, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(IntPtr))
Dim typ126 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ126))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ126).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 441, 1, 441, 100)
Dim typ127(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ127(UBound(typ127) + 1)
typ127(UBound(typ127)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ127))
Typ = Typ03.GetMethod("Equals", typ127).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 442, 1, 442, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa209 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru209 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont209 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru209)
EmitLdelemIL.Emit(OpCodes.Br, fa209)
EmitLdelemIL.MarkLabel(tru209)
EmitLdelemIL.MarkSequencePoint(doc3, 443, 1, 443, 100)
Dim typ128(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i")
Typ = GetType(System.String)
ReDim Preserve typ128(UBound(typ128) + 1)
typ128(UBound(typ128)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ128))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ128).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 444, 1, 444, 100)
Dim typ129(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ129(UBound(typ129) + 1)
typ129(UBound(typ129)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ129))
Typ = Typ03.GetMethod("Emit", typ129).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 445, 1, 445, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 446, 1, 446, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont209)
EmitLdelemIL.MarkLabel(fa209)
EmitLdelemIL.Emit(OpCodes.Br, cont209)
EmitLdelemIL.MarkLabel(cont209)
EmitLdelemIL.MarkSequencePoint(doc3, 448, 1, 448, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.SByte))
Dim typ130 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ130))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ130).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 449, 1, 449, 100)
Dim typ131(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ131(UBound(typ131) + 1)
typ131(UBound(typ131)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ131))
Typ = Typ03.GetMethod("Equals", typ131).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 450, 1, 450, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa210 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru210 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont210 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru210)
EmitLdelemIL.Emit(OpCodes.Br, fa210)
EmitLdelemIL.MarkLabel(tru210)
EmitLdelemIL.MarkSequencePoint(doc3, 451, 1, 451, 100)
Dim typ132(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i1")
Typ = GetType(System.String)
ReDim Preserve typ132(UBound(typ132) + 1)
typ132(UBound(typ132)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ132))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ132).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 452, 1, 452, 100)
Dim typ133(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ133(UBound(typ133) + 1)
typ133(UBound(typ133)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ133))
Typ = Typ03.GetMethod("Emit", typ133).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 453, 1, 453, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 454, 1, 454, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont210)
EmitLdelemIL.MarkLabel(fa210)
EmitLdelemIL.Emit(OpCodes.Br, cont210)
EmitLdelemIL.MarkLabel(cont210)
EmitLdelemIL.MarkSequencePoint(doc3, 456, 1, 456, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int16))
Dim typ134 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ134))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ134).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 457, 1, 457, 100)
Dim typ135(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ135(UBound(typ135) + 1)
typ135(UBound(typ135)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ135))
Typ = Typ03.GetMethod("Equals", typ135).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 458, 1, 458, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa211 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru211 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont211 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru211)
EmitLdelemIL.Emit(OpCodes.Br, fa211)
EmitLdelemIL.MarkLabel(tru211)
EmitLdelemIL.MarkSequencePoint(doc3, 459, 1, 459, 100)
Dim typ136(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i2")
Typ = GetType(System.String)
ReDim Preserve typ136(UBound(typ136) + 1)
typ136(UBound(typ136)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ136))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ136).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 460, 1, 460, 100)
Dim typ137(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ137(UBound(typ137) + 1)
typ137(UBound(typ137)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ137))
Typ = Typ03.GetMethod("Emit", typ137).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 461, 1, 461, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 462, 1, 462, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont211)
EmitLdelemIL.MarkLabel(fa211)
EmitLdelemIL.Emit(OpCodes.Br, cont211)
EmitLdelemIL.MarkLabel(cont211)
EmitLdelemIL.MarkSequencePoint(doc3, 464, 1, 464, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int32))
Dim typ138 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ138))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ138).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 465, 1, 465, 100)
Dim typ139(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ139(UBound(typ139) + 1)
typ139(UBound(typ139)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ139))
Typ = Typ03.GetMethod("Equals", typ139).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 466, 1, 466, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa212 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru212 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont212 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru212)
EmitLdelemIL.Emit(OpCodes.Br, fa212)
EmitLdelemIL.MarkLabel(tru212)
EmitLdelemIL.MarkSequencePoint(doc3, 467, 1, 467, 100)
Dim typ140(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i4")
Typ = GetType(System.String)
ReDim Preserve typ140(UBound(typ140) + 1)
typ140(UBound(typ140)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ140))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ140).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 468, 1, 468, 100)
Dim typ141(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ141(UBound(typ141) + 1)
typ141(UBound(typ141)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ141))
Typ = Typ03.GetMethod("Emit", typ141).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 469, 1, 469, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 470, 1, 470, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont212)
EmitLdelemIL.MarkLabel(fa212)
EmitLdelemIL.Emit(OpCodes.Br, cont212)
EmitLdelemIL.MarkLabel(cont212)
EmitLdelemIL.MarkSequencePoint(doc3, 472, 1, 472, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(Byte))
Dim typ142 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ142))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ142).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 473, 1, 473, 100)
Dim typ143(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ143(UBound(typ143) + 1)
typ143(UBound(typ143)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ143))
Typ = Typ03.GetMethod("Equals", typ143).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 474, 1, 474, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa213 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru213 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont213 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru213)
EmitLdelemIL.Emit(OpCodes.Br, fa213)
EmitLdelemIL.MarkLabel(tru213)
EmitLdelemIL.MarkSequencePoint(doc3, 475, 1, 475, 100)
Dim typ144(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.u1")
Typ = GetType(System.String)
ReDim Preserve typ144(UBound(typ144) + 1)
typ144(UBound(typ144)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ144))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ144).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 476, 1, 476, 100)
Dim typ145(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ145(UBound(typ145) + 1)
typ145(UBound(typ145)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ145))
Typ = Typ03.GetMethod("Emit", typ145).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 477, 1, 477, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 478, 1, 478, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont213)
EmitLdelemIL.MarkLabel(fa213)
EmitLdelemIL.Emit(OpCodes.Br, cont213)
EmitLdelemIL.MarkLabel(cont213)
EmitLdelemIL.MarkSequencePoint(doc3, 480, 1, 480, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(UInt16))
Dim typ146 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ146))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ146).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 481, 1, 481, 100)
Dim typ147(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ147(UBound(typ147) + 1)
typ147(UBound(typ147)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ147))
Typ = Typ03.GetMethod("Equals", typ147).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 482, 1, 482, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa214 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru214 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont214 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru214)
EmitLdelemIL.Emit(OpCodes.Br, fa214)
EmitLdelemIL.MarkLabel(tru214)
EmitLdelemIL.MarkSequencePoint(doc3, 483, 1, 483, 100)
Dim typ148(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.u2")
Typ = GetType(System.String)
ReDim Preserve typ148(UBound(typ148) + 1)
typ148(UBound(typ148)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ148))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ148).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 484, 1, 484, 100)
Dim typ149(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ149(UBound(typ149) + 1)
typ149(UBound(typ149)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ149))
Typ = Typ03.GetMethod("Emit", typ149).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 485, 1, 485, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 486, 1, 486, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont214)
EmitLdelemIL.MarkLabel(fa214)
EmitLdelemIL.Emit(OpCodes.Br, cont214)
EmitLdelemIL.MarkLabel(cont214)
EmitLdelemIL.MarkSequencePoint(doc3, 488, 1, 488, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(UInt32))
Dim typ150 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ150))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ150).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 489, 1, 489, 100)
Dim typ151(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ151(UBound(typ151) + 1)
typ151(UBound(typ151)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ151))
Typ = Typ03.GetMethod("Equals", typ151).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 490, 1, 490, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa215 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru215 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont215 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru215)
EmitLdelemIL.Emit(OpCodes.Br, fa215)
EmitLdelemIL.MarkLabel(tru215)
EmitLdelemIL.MarkSequencePoint(doc3, 491, 1, 491, 100)
Dim typ152(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.u4")
Typ = GetType(System.String)
ReDim Preserve typ152(UBound(typ152) + 1)
typ152(UBound(typ152)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ152))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ152).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 492, 1, 492, 100)
Dim typ153(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ153(UBound(typ153) + 1)
typ153(UBound(typ153)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ153))
Typ = Typ03.GetMethod("Emit", typ153).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 493, 1, 493, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 494, 1, 494, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont215)
EmitLdelemIL.MarkLabel(fa215)
EmitLdelemIL.Emit(OpCodes.Br, cont215)
EmitLdelemIL.MarkLabel(cont215)
EmitLdelemIL.MarkSequencePoint(doc3, 497, 1, 497, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Int64))
Dim typ154 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ154))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ154).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 498, 1, 498, 100)
Dim typ155(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ155(UBound(typ155) + 1)
typ155(UBound(typ155)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ155))
Typ = Typ03.GetMethod("Equals", typ155).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 499, 1, 499, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa216 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru216 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont216 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru216)
EmitLdelemIL.Emit(OpCodes.Br, fa216)
EmitLdelemIL.MarkLabel(tru216)
EmitLdelemIL.MarkSequencePoint(doc3, 500, 1, 500, 100)
Dim typ156(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.i8")
Typ = GetType(System.String)
ReDim Preserve typ156(UBound(typ156) + 1)
typ156(UBound(typ156)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ156))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ156).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 501, 1, 501, 100)
Dim typ157(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ157(UBound(typ157) + 1)
typ157(UBound(typ157)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ157))
Typ = Typ03.GetMethod("Emit", typ157).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 502, 1, 502, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 503, 1, 503, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont216)
EmitLdelemIL.MarkLabel(fa216)
EmitLdelemIL.Emit(OpCodes.Br, cont216)
EmitLdelemIL.MarkLabel(cont216)
EmitLdelemIL.MarkSequencePoint(doc3, 505, 1, 505, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Single))
Dim typ158 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ158))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ158).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 506, 1, 506, 100)
Dim typ159(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ159(UBound(typ159) + 1)
typ159(UBound(typ159)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ159))
Typ = Typ03.GetMethod("Equals", typ159).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 507, 1, 507, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa217 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru217 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont217 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru217)
EmitLdelemIL.Emit(OpCodes.Br, fa217)
EmitLdelemIL.MarkLabel(tru217)
EmitLdelemIL.MarkSequencePoint(doc3, 508, 1, 508, 100)
Dim typ160(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.r4")
Typ = GetType(System.String)
ReDim Preserve typ160(UBound(typ160) + 1)
typ160(UBound(typ160)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ160))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ160).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 509, 1, 509, 100)
Dim typ161(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ161(UBound(typ161) + 1)
typ161(UBound(typ161)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ161))
Typ = Typ03.GetMethod("Emit", typ161).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 510, 1, 510, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 511, 1, 511, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont217)
EmitLdelemIL.MarkLabel(fa217)
EmitLdelemIL.Emit(OpCodes.Br, cont217)
EmitLdelemIL.MarkLabel(cont217)
EmitLdelemIL.MarkSequencePoint(doc3, 513, 1, 513, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Double))
Dim typ162 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ162))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ162).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 514, 1, 514, 100)
Dim typ163(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ163(UBound(typ163) + 1)
typ163(UBound(typ163)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ163))
Typ = Typ03.GetMethod("Equals", typ163).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 515, 1, 515, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa218 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru218 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont218 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru218)
EmitLdelemIL.Emit(OpCodes.Br, fa218)
EmitLdelemIL.MarkLabel(tru218)
EmitLdelemIL.MarkSequencePoint(doc3, 516, 1, 516, 100)
Dim typ164(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.r8")
Typ = GetType(System.String)
ReDim Preserve typ164(UBound(typ164) + 1)
typ164(UBound(typ164)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ164))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ164).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 517, 1, 517, 100)
Dim typ165(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ165(UBound(typ165) + 1)
typ165(UBound(typ165)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ165))
Typ = Typ03.GetMethod("Emit", typ165).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 518, 1, 518, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 519, 1, 519, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont218)
EmitLdelemIL.MarkLabel(fa218)
EmitLdelemIL.Emit(OpCodes.Br, cont218)
EmitLdelemIL.MarkLabel(cont218)
EmitLdelemIL.MarkSequencePoint(doc3, 521, 1, 521, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(ValueType))
Dim typ166 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ166))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ166).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 522, 1, 522, 100)
Dim typ167(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ167(UBound(typ167) + 1)
typ167(UBound(typ167)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ167))
Typ = Typ03.GetMethod("IsAssignableFrom", typ167).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 523, 1, 523, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa219 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru219 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont219 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru219)
EmitLdelemIL.Emit(OpCodes.Br, fa219)
EmitLdelemIL.MarkLabel(tru219)
EmitLdelemIL.MarkSequencePoint(doc3, 524, 1, 524, 100)
Dim typ168(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem")
Typ = GetType(System.String)
ReDim Preserve typ168(UBound(typ168) + 1)
typ168(UBound(typ168)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ168))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ168).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 525, 1, 525, 100)
Dim typ169(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ169(UBound(typ169) + 1)
typ169(UBound(typ169)) = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ169(UBound(typ169) + 1)
typ169(UBound(typ169)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ169))
Typ = Typ03.GetMethod("Emit", typ169).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 526, 1, 526, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 527, 1, 527, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont219)
EmitLdelemIL.MarkLabel(fa219)
EmitLdelemIL.Emit(OpCodes.Br, cont219)
EmitLdelemIL.MarkLabel(cont219)
EmitLdelemIL.MarkSequencePoint(doc3, 529, 1, 529, 100)
EmitLdelemIL.Emit(OpCodes.Ldtoken, GetType(System.Object))
Dim typ170 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLdelemIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ170))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ170).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 0)
EmitLdelemIL.MarkSequencePoint(doc3, 530, 1, 530, 100)
Dim typ171(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ171(UBound(typ171) + 1)
typ171(UBound(typ171)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("IsAssignableFrom", typ171))
Typ = Typ03.GetMethod("IsAssignableFrom", typ171).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 2)
EmitLdelemIL.MarkSequencePoint(doc3, 531, 1, 531, 100)
EmitLdelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdelemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa220 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim tru220 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
Dim cont220 As System.Reflection.Emit.Label = EmitLdelemIL.DefineLabel()
EmitLdelemIL.Emit(OpCodes.Beq, tru220)
EmitLdelemIL.Emit(OpCodes.Br, fa220)
EmitLdelemIL.MarkLabel(tru220)
EmitLdelemIL.MarkSequencePoint(doc3, 532, 1, 532, 100)
Dim typ172(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldstr, "ldelem.ref")
Typ = GetType(System.String)
ReDim Preserve typ172(UBound(typ172) + 1)
typ172(UBound(typ172)) = Typ
EmitLdelemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ172))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ172).ReturnType
EmitLdelemIL.Emit(OpCodes.Stloc, 1)
EmitLdelemIL.MarkSequencePoint(doc3, 533, 1, 533, 100)
Dim typ173(-1) As Type
EmitLdelemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdelemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(OpCode)
ReDim Preserve typ173(UBound(typ173) + 1)
typ173(UBound(typ173)) = Typ
EmitLdelemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ173))
Typ = Typ03.GetMethod("Emit", typ173).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdelemIL.Emit(OpCodes.Pop)
End If
EmitLdelemIL.MarkSequencePoint(doc3, 534, 1, 534, 100)
EmitLdelemIL.Emit(OpCodes.Br, label7)
EmitLdelemIL.MarkSequencePoint(doc3, 535, 1, 535, 100)
EmitLdelemIL.Emit(OpCodes.Br, cont220)
EmitLdelemIL.MarkLabel(fa220)
EmitLdelemIL.Emit(OpCodes.Br, cont220)
EmitLdelemIL.MarkLabel(cont220)
EmitLdelemIL.MarkSequencePoint(doc3, 538, 1, 538, 100)
EmitLdelemIL.MarkLabel(label7)
EmitLdelemIL.MarkSequencePoint(doc3, 540, 1, 540, 100)
EmitLdelemIL.Emit(OpCodes.Ret)
Dim typ174(-1) As Type
ReDim Preserve typ174(UBound(typ174) + 1)
typ174(UBound(typ174)) = GetType(System.Int64)
Dim EmitLdcI8 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI8", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ174)
Dim EmitLdcI8IL As ILGenerator = EmitLdcI8.GetILGenerator()
Dim EmitLdcI8param01 As ParameterBuilder = EmitLdcI8.DefineParameter(1, ParameterAttributes.None, "n")
EmitLdcI8IL.MarkSequencePoint(doc3, 544, 1, 544, 100)
Dim locbldr46 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(OpCode))
locbldr46.SetLocalSymInfo("op")
EmitLdcI8IL.MarkSequencePoint(doc3, 545, 1, 545, 100)
Dim locbldr47 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(System.Boolean))
locbldr47.SetLocalSymInfo("b1")
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 1)
EmitLdcI8IL.MarkSequencePoint(doc3, 546, 1, 546, 100)
Dim locbldr48 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(System.Boolean))
locbldr48.SetLocalSymInfo("b2")
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 2)
EmitLdcI8IL.MarkSequencePoint(doc3, 550, 1, 550, 100)
Dim label8 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.MarkSequencePoint(doc3, 552, 1, 552, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(-1))
Typ = GetType(System.Int64)
Dim fa221 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru221 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont221 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru221)
EmitLdcI8IL.Emit(OpCodes.Br, fa221)
EmitLdcI8IL.MarkLabel(tru221)
EmitLdcI8IL.MarkSequencePoint(doc3, 553, 1, 553, 100)
Dim typ175(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ175(UBound(typ175) + 1)
typ175(UBound(typ175)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ175))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ175).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 554, 1, 554, 100)
Dim typ176(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ176(UBound(typ176) + 1)
typ176(UBound(typ176)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ176))
Typ = Typ03.GetMethod("Emit", typ176).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 555, 1, 555, 100)
Dim typ177(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ177(UBound(typ177) + 1)
typ177(UBound(typ177)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ177))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ177).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 556, 1, 556, 100)
Dim typ178(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ178(UBound(typ178) + 1)
typ178(UBound(typ178)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ178))
Typ = Typ03.GetMethod("Emit", typ178).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 557, 1, 557, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 558, 1, 558, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont221)
EmitLdcI8IL.MarkLabel(fa221)
EmitLdcI8IL.Emit(OpCodes.Br, cont221)
EmitLdcI8IL.MarkLabel(cont221)
EmitLdcI8IL.MarkSequencePoint(doc3, 560, 1, 560, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
Dim fa222 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru222 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont222 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru222)
EmitLdcI8IL.Emit(OpCodes.Br, fa222)
EmitLdcI8IL.MarkLabel(tru222)
EmitLdcI8IL.MarkSequencePoint(doc3, 561, 1, 561, 100)
Dim typ179(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ179(UBound(typ179) + 1)
typ179(UBound(typ179)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ179))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ179).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 562, 1, 562, 100)
Dim typ180(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ180(UBound(typ180) + 1)
typ180(UBound(typ180)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ180))
Typ = Typ03.GetMethod("Emit", typ180).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 563, 1, 563, 100)
Dim typ181(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ181(UBound(typ181) + 1)
typ181(UBound(typ181)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ181))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ181).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 564, 1, 564, 100)
Dim typ182(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ182(UBound(typ182) + 1)
typ182(UBound(typ182)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ182))
Typ = Typ03.GetMethod("Emit", typ182).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 565, 1, 565, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 566, 1, 566, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont222)
EmitLdcI8IL.MarkLabel(fa222)
EmitLdcI8IL.Emit(OpCodes.Br, cont222)
EmitLdcI8IL.MarkLabel(cont222)
EmitLdcI8IL.MarkSequencePoint(doc3, 568, 1, 568, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(1))
Typ = GetType(System.Int64)
Dim fa223 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru223 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont223 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru223)
EmitLdcI8IL.Emit(OpCodes.Br, fa223)
EmitLdcI8IL.MarkLabel(tru223)
EmitLdcI8IL.MarkSequencePoint(doc3, 569, 1, 569, 100)
Dim typ183(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ183(UBound(typ183) + 1)
typ183(UBound(typ183)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ183))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ183).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 570, 1, 570, 100)
Dim typ184(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ184(UBound(typ184) + 1)
typ184(UBound(typ184)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ184))
Typ = Typ03.GetMethod("Emit", typ184).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 571, 1, 571, 100)
Dim typ185(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ185(UBound(typ185) + 1)
typ185(UBound(typ185)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ185))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ185).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 572, 1, 572, 100)
Dim typ186(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ186(UBound(typ186) + 1)
typ186(UBound(typ186)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ186))
Typ = Typ03.GetMethod("Emit", typ186).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 573, 1, 573, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 574, 1, 574, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont223)
EmitLdcI8IL.MarkLabel(fa223)
EmitLdcI8IL.Emit(OpCodes.Br, cont223)
EmitLdcI8IL.MarkLabel(cont223)
EmitLdcI8IL.MarkSequencePoint(doc3, 576, 1, 576, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(2))
Typ = GetType(System.Int64)
Dim fa224 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru224 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont224 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru224)
EmitLdcI8IL.Emit(OpCodes.Br, fa224)
EmitLdcI8IL.MarkLabel(tru224)
EmitLdcI8IL.MarkSequencePoint(doc3, 577, 1, 577, 100)
Dim typ187(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ187(UBound(typ187) + 1)
typ187(UBound(typ187)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ187))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ187).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 578, 1, 578, 100)
Dim typ188(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ188(UBound(typ188) + 1)
typ188(UBound(typ188)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ188))
Typ = Typ03.GetMethod("Emit", typ188).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 579, 1, 579, 100)
Dim typ189(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ189(UBound(typ189) + 1)
typ189(UBound(typ189)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ189))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ189).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 580, 1, 580, 100)
Dim typ190(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ190(UBound(typ190) + 1)
typ190(UBound(typ190)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ190))
Typ = Typ03.GetMethod("Emit", typ190).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 581, 1, 581, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 582, 1, 582, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont224)
EmitLdcI8IL.MarkLabel(fa224)
EmitLdcI8IL.Emit(OpCodes.Br, cont224)
EmitLdcI8IL.MarkLabel(cont224)
EmitLdcI8IL.MarkSequencePoint(doc3, 584, 1, 584, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(3))
Typ = GetType(System.Int64)
Dim fa225 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru225 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont225 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru225)
EmitLdcI8IL.Emit(OpCodes.Br, fa225)
EmitLdcI8IL.MarkLabel(tru225)
EmitLdcI8IL.MarkSequencePoint(doc3, 585, 1, 585, 100)
Dim typ191(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ191(UBound(typ191) + 1)
typ191(UBound(typ191)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ191))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ191).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 586, 1, 586, 100)
Dim typ192(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ192(UBound(typ192) + 1)
typ192(UBound(typ192)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ192))
Typ = Typ03.GetMethod("Emit", typ192).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 587, 1, 587, 100)
Dim typ193(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ193(UBound(typ193) + 1)
typ193(UBound(typ193)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ193))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ193).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 588, 1, 588, 100)
Dim typ194(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ194(UBound(typ194) + 1)
typ194(UBound(typ194)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ194))
Typ = Typ03.GetMethod("Emit", typ194).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 589, 1, 589, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 590, 1, 590, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont225)
EmitLdcI8IL.MarkLabel(fa225)
EmitLdcI8IL.Emit(OpCodes.Br, cont225)
EmitLdcI8IL.MarkLabel(cont225)
EmitLdcI8IL.MarkSequencePoint(doc3, 592, 1, 592, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(4))
Typ = GetType(System.Int64)
Dim fa226 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru226 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont226 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru226)
EmitLdcI8IL.Emit(OpCodes.Br, fa226)
EmitLdcI8IL.MarkLabel(tru226)
EmitLdcI8IL.MarkSequencePoint(doc3, 593, 1, 593, 100)
Dim typ195(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ195(UBound(typ195) + 1)
typ195(UBound(typ195)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ195))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ195).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 594, 1, 594, 100)
Dim typ196(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ196(UBound(typ196) + 1)
typ196(UBound(typ196)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ196))
Typ = Typ03.GetMethod("Emit", typ196).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 595, 1, 595, 100)
Dim typ197(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ197(UBound(typ197) + 1)
typ197(UBound(typ197)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ197))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ197).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 596, 1, 596, 100)
Dim typ198(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ198(UBound(typ198) + 1)
typ198(UBound(typ198)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ198))
Typ = Typ03.GetMethod("Emit", typ198).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 597, 1, 597, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 598, 1, 598, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont226)
EmitLdcI8IL.MarkLabel(fa226)
EmitLdcI8IL.Emit(OpCodes.Br, cont226)
EmitLdcI8IL.MarkLabel(cont226)
EmitLdcI8IL.MarkSequencePoint(doc3, 600, 1, 600, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(5))
Typ = GetType(System.Int64)
Dim fa227 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru227 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont227 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru227)
EmitLdcI8IL.Emit(OpCodes.Br, fa227)
EmitLdcI8IL.MarkLabel(tru227)
EmitLdcI8IL.MarkSequencePoint(doc3, 601, 1, 601, 100)
Dim typ199(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ199(UBound(typ199) + 1)
typ199(UBound(typ199)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ199))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ199).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 602, 1, 602, 100)
Dim typ200(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ200(UBound(typ200) + 1)
typ200(UBound(typ200)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ200))
Typ = Typ03.GetMethod("Emit", typ200).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 603, 1, 603, 100)
Dim typ201(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ201(UBound(typ201) + 1)
typ201(UBound(typ201)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ201))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ201).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 604, 1, 604, 100)
Dim typ202(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ202(UBound(typ202) + 1)
typ202(UBound(typ202)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ202))
Typ = Typ03.GetMethod("Emit", typ202).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 605, 1, 605, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 606, 1, 606, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont227)
EmitLdcI8IL.MarkLabel(fa227)
EmitLdcI8IL.Emit(OpCodes.Br, cont227)
EmitLdcI8IL.MarkLabel(cont227)
EmitLdcI8IL.MarkSequencePoint(doc3, 608, 1, 608, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(6))
Typ = GetType(System.Int64)
Dim fa228 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru228 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont228 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru228)
EmitLdcI8IL.Emit(OpCodes.Br, fa228)
EmitLdcI8IL.MarkLabel(tru228)
EmitLdcI8IL.MarkSequencePoint(doc3, 609, 1, 609, 100)
Dim typ203(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ203(UBound(typ203) + 1)
typ203(UBound(typ203)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ203))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ203).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 610, 1, 610, 100)
Dim typ204(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ204(UBound(typ204) + 1)
typ204(UBound(typ204)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ204))
Typ = Typ03.GetMethod("Emit", typ204).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 611, 1, 611, 100)
Dim typ205(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ205(UBound(typ205) + 1)
typ205(UBound(typ205)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ205))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ205).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 612, 1, 612, 100)
Dim typ206(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ206(UBound(typ206) + 1)
typ206(UBound(typ206)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ206))
Typ = Typ03.GetMethod("Emit", typ206).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 613, 1, 613, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 614, 1, 614, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont228)
EmitLdcI8IL.MarkLabel(fa228)
EmitLdcI8IL.Emit(OpCodes.Br, cont228)
EmitLdcI8IL.MarkLabel(cont228)
EmitLdcI8IL.MarkSequencePoint(doc3, 616, 1, 616, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(7))
Typ = GetType(System.Int64)
Dim fa229 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru229 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont229 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru229)
EmitLdcI8IL.Emit(OpCodes.Br, fa229)
EmitLdcI8IL.MarkLabel(tru229)
EmitLdcI8IL.MarkSequencePoint(doc3, 617, 1, 617, 100)
Dim typ207(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ207(UBound(typ207) + 1)
typ207(UBound(typ207)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ207))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ207).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 618, 1, 618, 100)
Dim typ208(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ208(UBound(typ208) + 1)
typ208(UBound(typ208)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ208))
Typ = Typ03.GetMethod("Emit", typ208).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 619, 1, 619, 100)
Dim typ209(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ209(UBound(typ209) + 1)
typ209(UBound(typ209)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ209))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ209).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 620, 1, 620, 100)
Dim typ210(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ210(UBound(typ210) + 1)
typ210(UBound(typ210)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ210))
Typ = Typ03.GetMethod("Emit", typ210).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 621, 1, 621, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 622, 1, 622, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont229)
EmitLdcI8IL.MarkLabel(fa229)
EmitLdcI8IL.Emit(OpCodes.Br, cont229)
EmitLdcI8IL.MarkLabel(cont229)
EmitLdcI8IL.MarkSequencePoint(doc3, 624, 1, 624, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(8))
Typ = GetType(System.Int64)
Dim fa230 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru230 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont230 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru230)
EmitLdcI8IL.Emit(OpCodes.Br, fa230)
EmitLdcI8IL.MarkLabel(tru230)
EmitLdcI8IL.MarkSequencePoint(doc3, 625, 1, 625, 100)
Dim typ211(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ211(UBound(typ211) + 1)
typ211(UBound(typ211)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ211))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ211).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 626, 1, 626, 100)
Dim typ212(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ212(UBound(typ212) + 1)
typ212(UBound(typ212)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ212))
Typ = Typ03.GetMethod("Emit", typ212).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 627, 1, 627, 100)
Dim typ213(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ213(UBound(typ213) + 1)
typ213(UBound(typ213)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ213))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ213).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 628, 1, 628, 100)
Dim typ214(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ214(UBound(typ214) + 1)
typ214(UBound(typ214)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ214))
Typ = Typ03.GetMethod("Emit", typ214).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 629, 1, 629, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 630, 1, 630, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont230)
EmitLdcI8IL.MarkLabel(fa230)
EmitLdcI8IL.Emit(OpCodes.Br, cont230)
EmitLdcI8IL.MarkLabel(cont230)
EmitLdcI8IL.MarkSequencePoint(doc3, 632, 1, 632, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(-2147483648))
Typ = GetType(System.Int64)
Dim fa231 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru231 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont231 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Bge, tru231)
EmitLdcI8IL.Emit(OpCodes.Br, fa231)
EmitLdcI8IL.MarkLabel(tru231)
EmitLdcI8IL.MarkSequencePoint(doc3, 633, 1, 633, 100)
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 1)
EmitLdcI8IL.MarkSequencePoint(doc3, 634, 1, 634, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont231)
EmitLdcI8IL.MarkLabel(fa231)
EmitLdcI8IL.Emit(OpCodes.Br, cont231)
EmitLdcI8IL.MarkLabel(cont231)
EmitLdcI8IL.MarkSequencePoint(doc3, 635, 1, 635, 100)
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
EmitLdcI8IL.Emit(OpCodes.Ldc_I8, CLng(2147483647))
Typ = GetType(System.Int64)
Dim fa232 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru232 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont232 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Ble, tru232)
EmitLdcI8IL.Emit(OpCodes.Br, fa232)
EmitLdcI8IL.MarkLabel(tru232)
EmitLdcI8IL.MarkSequencePoint(doc3, 636, 1, 636, 100)
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Stloc, 2)
EmitLdcI8IL.MarkSequencePoint(doc3, 637, 1, 637, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont232)
EmitLdcI8IL.MarkLabel(fa232)
EmitLdcI8IL.Emit(OpCodes.Br, cont232)
EmitLdcI8IL.MarkLabel(cont232)
EmitLdcI8IL.MarkSequencePoint(doc3, 638, 1, 638, 100)
EmitLdcI8IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.And)
EmitLdcI8IL.Emit(OpCodes.Stloc, 2)
EmitLdcI8IL.MarkSequencePoint(doc3, 640, 1, 640, 100)
EmitLdcI8IL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
EmitLdcI8IL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa233 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim tru233 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
Dim cont233 As System.Reflection.Emit.Label = EmitLdcI8IL.DefineLabel()
EmitLdcI8IL.Emit(OpCodes.Beq, tru233)
EmitLdcI8IL.Emit(OpCodes.Br, fa233)
EmitLdcI8IL.MarkLabel(tru233)
EmitLdcI8IL.MarkSequencePoint(doc3, 641, 1, 641, 100)
Dim typ215(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ215(UBound(typ215) + 1)
typ215(UBound(typ215)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ215))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ215).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 642, 1, 642, 100)
Dim locbldr49 As LocalBuilder = EmitLdcI8IL.DeclareLocal(GetType(System.Int32))
locbldr49.SetLocalSymInfo("num")
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
Dim typ216 As Type() = {Typ}
EmitLdcI8IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ216))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ216).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 3)
EmitLdcI8IL.MarkSequencePoint(doc3, 643, 1, 643, 100)
Dim typ217(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ217(UBound(typ217) + 1)
typ217(UBound(typ217)) = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
ReDim Preserve typ217(UBound(typ217) + 1)
typ217(UBound(typ217)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ217))
Typ = Typ03.GetMethod("Emit", typ217).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 644, 1, 644, 100)
Dim typ218(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "conv.i8")
Typ = GetType(System.String)
ReDim Preserve typ218(UBound(typ218) + 1)
typ218(UBound(typ218)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ218))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ218).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 645, 1, 645, 100)
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
EmitLdcI8IL.MarkSequencePoint(doc3, 647, 1, 647, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 648, 1, 648, 100)
EmitLdcI8IL.Emit(OpCodes.Br, cont233)
EmitLdcI8IL.MarkLabel(fa233)
EmitLdcI8IL.Emit(OpCodes.Br, cont233)
EmitLdcI8IL.MarkLabel(cont233)
EmitLdcI8IL.MarkSequencePoint(doc3, 651, 1, 651, 100)
Dim typ220(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldstr, "ldc.i8")
Typ = GetType(System.String)
ReDim Preserve typ220(UBound(typ220) + 1)
typ220(UBound(typ220)) = Typ
EmitLdcI8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ220))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ220).ReturnType
EmitLdcI8IL.Emit(OpCodes.Stloc, 0)
EmitLdcI8IL.MarkSequencePoint(doc3, 653, 1, 653, 100)
Dim typ221(-1) As Type
EmitLdcI8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ221(UBound(typ221) + 1)
typ221(UBound(typ221)) = Typ
EmitLdcI8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int64)
ReDim Preserve typ221(UBound(typ221) + 1)
typ221(UBound(typ221)) = Typ
EmitLdcI8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ221))
Typ = Typ03.GetMethod("Emit", typ221).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI8IL.Emit(OpCodes.Pop)
End If
EmitLdcI8IL.MarkSequencePoint(doc3, 654, 1, 654, 100)
EmitLdcI8IL.Emit(OpCodes.Br, label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 657, 1, 657, 100)
EmitLdcI8IL.MarkLabel(label8)
EmitLdcI8IL.MarkSequencePoint(doc3, 658, 1, 658, 100)
EmitLdcI8IL.Emit(OpCodes.Ret)
Dim typ222(-1) As Type
ReDim Preserve typ222(UBound(typ222) + 1)
typ222(UBound(typ222)) = GetType(System.Int32)
Dim EmitLdcI4 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI4", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ222)
Dim EmitLdcI4IL As ILGenerator = EmitLdcI4.GetILGenerator()
Dim EmitLdcI4param01 As ParameterBuilder = EmitLdcI4.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdcI4IL.MarkSequencePoint(doc3, 661, 1, 661, 100)
Dim locbldr50 As LocalBuilder = EmitLdcI4IL.DeclareLocal(GetType(OpCode))
locbldr50.SetLocalSymInfo("op")
EmitLdcI4IL.MarkSequencePoint(doc3, 667, 1, 667, 100)
Dim label9 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.MarkSequencePoint(doc3, 669, 1, 669, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa234 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru234 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont234 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru234)
EmitLdcI4IL.Emit(OpCodes.Br, fa234)
EmitLdcI4IL.MarkLabel(tru234)
EmitLdcI4IL.MarkSequencePoint(doc3, 670, 1, 670, 100)
Dim typ223(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ223(UBound(typ223) + 1)
typ223(UBound(typ223)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ223))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ223).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 671, 1, 671, 100)
Dim typ224(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ224(UBound(typ224) + 1)
typ224(UBound(typ224)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ224))
Typ = Typ03.GetMethod("Emit", typ224).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 672, 1, 672, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 673, 1, 673, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont234)
EmitLdcI4IL.MarkLabel(fa234)
EmitLdcI4IL.Emit(OpCodes.Br, cont234)
EmitLdcI4IL.MarkLabel(cont234)
EmitLdcI4IL.MarkSequencePoint(doc3, 675, 1, 675, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa235 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru235 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont235 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru235)
EmitLdcI4IL.Emit(OpCodes.Br, fa235)
EmitLdcI4IL.MarkLabel(tru235)
EmitLdcI4IL.MarkSequencePoint(doc3, 676, 1, 676, 100)
Dim typ225(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ225(UBound(typ225) + 1)
typ225(UBound(typ225)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ225))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ225).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 677, 1, 677, 100)
Dim typ226(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ226(UBound(typ226) + 1)
typ226(UBound(typ226)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ226))
Typ = Typ03.GetMethod("Emit", typ226).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 678, 1, 678, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 679, 1, 679, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont235)
EmitLdcI4IL.MarkLabel(fa235)
EmitLdcI4IL.Emit(OpCodes.Br, cont235)
EmitLdcI4IL.MarkLabel(cont235)
EmitLdcI4IL.MarkSequencePoint(doc3, 681, 1, 681, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa236 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru236 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont236 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru236)
EmitLdcI4IL.Emit(OpCodes.Br, fa236)
EmitLdcI4IL.MarkLabel(tru236)
EmitLdcI4IL.MarkSequencePoint(doc3, 682, 1, 682, 100)
Dim typ227(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ227(UBound(typ227) + 1)
typ227(UBound(typ227)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ227))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ227).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 683, 1, 683, 100)
Dim typ228(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ228(UBound(typ228) + 1)
typ228(UBound(typ228)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ228))
Typ = Typ03.GetMethod("Emit", typ228).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 684, 1, 684, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 685, 1, 685, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont236)
EmitLdcI4IL.MarkLabel(fa236)
EmitLdcI4IL.Emit(OpCodes.Br, cont236)
EmitLdcI4IL.MarkLabel(cont236)
EmitLdcI4IL.MarkSequencePoint(doc3, 687, 1, 687, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa237 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru237 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont237 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru237)
EmitLdcI4IL.Emit(OpCodes.Br, fa237)
EmitLdcI4IL.MarkLabel(tru237)
EmitLdcI4IL.MarkSequencePoint(doc3, 688, 1, 688, 100)
Dim typ229(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ229(UBound(typ229) + 1)
typ229(UBound(typ229)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ229))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ229).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 689, 1, 689, 100)
Dim typ230(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ230(UBound(typ230) + 1)
typ230(UBound(typ230)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ230))
Typ = Typ03.GetMethod("Emit", typ230).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 690, 1, 690, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 691, 1, 691, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont237)
EmitLdcI4IL.MarkLabel(fa237)
EmitLdcI4IL.Emit(OpCodes.Br, cont237)
EmitLdcI4IL.MarkLabel(cont237)
EmitLdcI4IL.MarkSequencePoint(doc3, 693, 1, 693, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa238 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru238 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont238 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru238)
EmitLdcI4IL.Emit(OpCodes.Br, fa238)
EmitLdcI4IL.MarkLabel(tru238)
EmitLdcI4IL.MarkSequencePoint(doc3, 694, 1, 694, 100)
Dim typ231(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ231(UBound(typ231) + 1)
typ231(UBound(typ231)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ231))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ231).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 695, 1, 695, 100)
Dim typ232(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ232(UBound(typ232) + 1)
typ232(UBound(typ232)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ232))
Typ = Typ03.GetMethod("Emit", typ232).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 696, 1, 696, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 697, 1, 697, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont238)
EmitLdcI4IL.MarkLabel(fa238)
EmitLdcI4IL.Emit(OpCodes.Br, cont238)
EmitLdcI4IL.MarkLabel(cont238)
EmitLdcI4IL.MarkSequencePoint(doc3, 699, 1, 699, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
Dim fa239 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru239 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont239 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru239)
EmitLdcI4IL.Emit(OpCodes.Br, fa239)
EmitLdcI4IL.MarkLabel(tru239)
EmitLdcI4IL.MarkSequencePoint(doc3, 700, 1, 700, 100)
Dim typ233(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ233(UBound(typ233) + 1)
typ233(UBound(typ233)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ233))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ233).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 701, 1, 701, 100)
Dim typ234(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ234(UBound(typ234) + 1)
typ234(UBound(typ234)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ234))
Typ = Typ03.GetMethod("Emit", typ234).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 702, 1, 702, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 703, 1, 703, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont239)
EmitLdcI4IL.MarkLabel(fa239)
EmitLdcI4IL.Emit(OpCodes.Br, cont239)
EmitLdcI4IL.MarkLabel(cont239)
EmitLdcI4IL.MarkSequencePoint(doc3, 705, 1, 705, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
Dim fa240 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru240 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont240 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru240)
EmitLdcI4IL.Emit(OpCodes.Br, fa240)
EmitLdcI4IL.MarkLabel(tru240)
EmitLdcI4IL.MarkSequencePoint(doc3, 706, 1, 706, 100)
Dim typ235(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ235(UBound(typ235) + 1)
typ235(UBound(typ235)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ235))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ235).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 707, 1, 707, 100)
Dim typ236(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ236(UBound(typ236) + 1)
typ236(UBound(typ236)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ236))
Typ = Typ03.GetMethod("Emit", typ236).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 708, 1, 708, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 709, 1, 709, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont240)
EmitLdcI4IL.MarkLabel(fa240)
EmitLdcI4IL.Emit(OpCodes.Br, cont240)
EmitLdcI4IL.MarkLabel(cont240)
EmitLdcI4IL.MarkSequencePoint(doc3, 711, 1, 711, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
Dim fa241 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru241 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont241 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru241)
EmitLdcI4IL.Emit(OpCodes.Br, fa241)
EmitLdcI4IL.MarkLabel(tru241)
EmitLdcI4IL.MarkSequencePoint(doc3, 712, 1, 712, 100)
Dim typ237(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ237(UBound(typ237) + 1)
typ237(UBound(typ237)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ237))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ237).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 713, 1, 713, 100)
Dim typ238(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ238(UBound(typ238) + 1)
typ238(UBound(typ238)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ238))
Typ = Typ03.GetMethod("Emit", typ238).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 714, 1, 714, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 715, 1, 715, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont241)
EmitLdcI4IL.MarkLabel(fa241)
EmitLdcI4IL.Emit(OpCodes.Br, cont241)
EmitLdcI4IL.MarkLabel(cont241)
EmitLdcI4IL.MarkSequencePoint(doc3, 717, 1, 717, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
Dim fa242 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru242 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont242 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru242)
EmitLdcI4IL.Emit(OpCodes.Br, fa242)
EmitLdcI4IL.MarkLabel(tru242)
EmitLdcI4IL.MarkSequencePoint(doc3, 718, 1, 718, 100)
Dim typ239(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ239(UBound(typ239) + 1)
typ239(UBound(typ239)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ239))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ239).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 719, 1, 719, 100)
Dim typ240(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ240(UBound(typ240) + 1)
typ240(UBound(typ240)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ240))
Typ = Typ03.GetMethod("Emit", typ240).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 720, 1, 720, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 721, 1, 721, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont242)
EmitLdcI4IL.MarkLabel(fa242)
EmitLdcI4IL.Emit(OpCodes.Br, cont242)
EmitLdcI4IL.MarkLabel(cont242)
EmitLdcI4IL.MarkSequencePoint(doc3, 723, 1, 723, 100)
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
EmitLdcI4IL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
Dim fa243 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim tru243 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
Dim cont243 As System.Reflection.Emit.Label = EmitLdcI4IL.DefineLabel()
EmitLdcI4IL.Emit(OpCodes.Beq, tru243)
EmitLdcI4IL.Emit(OpCodes.Br, fa243)
EmitLdcI4IL.MarkLabel(tru243)
EmitLdcI4IL.MarkSequencePoint(doc3, 724, 1, 724, 100)
Dim typ241(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ241(UBound(typ241) + 1)
typ241(UBound(typ241)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ241))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ241).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 725, 1, 725, 100)
Dim typ242(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ242(UBound(typ242) + 1)
typ242(UBound(typ242)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ242))
Typ = Typ03.GetMethod("Emit", typ242).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 726, 1, 726, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 727, 1, 727, 100)
EmitLdcI4IL.Emit(OpCodes.Br, cont243)
EmitLdcI4IL.MarkLabel(fa243)
EmitLdcI4IL.Emit(OpCodes.Br, cont243)
EmitLdcI4IL.MarkLabel(cont243)
EmitLdcI4IL.MarkSequencePoint(doc3, 745, 1, 745, 100)
Dim typ243(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ243(UBound(typ243) + 1)
typ243(UBound(typ243)) = Typ
EmitLdcI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ243))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ243).ReturnType
EmitLdcI4IL.Emit(OpCodes.Stloc, 0)
EmitLdcI4IL.MarkSequencePoint(doc3, 747, 1, 747, 100)
Dim typ244(-1) As Type
EmitLdcI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ244(UBound(typ244) + 1)
typ244(UBound(typ244)) = Typ
EmitLdcI4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ244(UBound(typ244) + 1)
typ244(UBound(typ244)) = Typ
EmitLdcI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ244))
Typ = Typ03.GetMethod("Emit", typ244).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI4IL.Emit(OpCodes.Pop)
End If
EmitLdcI4IL.MarkSequencePoint(doc3, 748, 1, 748, 100)
EmitLdcI4IL.Emit(OpCodes.Br, label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 751, 1, 751, 100)
EmitLdcI4IL.MarkLabel(label9)
EmitLdcI4IL.MarkSequencePoint(doc3, 752, 1, 752, 100)
EmitLdcI4IL.Emit(OpCodes.Ret)
Dim typ245(-1) As Type
ReDim Preserve typ245(UBound(typ245) + 1)
typ245(UBound(typ245)) = GetType(System.Int16)
Dim EmitLdcI2 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI2", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ245)
Dim EmitLdcI2IL As ILGenerator = EmitLdcI2.GetILGenerator()
Dim EmitLdcI2param01 As ParameterBuilder = EmitLdcI2.DefineParameter(1, ParameterAttributes.None, "n")
EmitLdcI2IL.MarkSequencePoint(doc3, 755, 1, 755, 100)
Dim locbldr51 As LocalBuilder = EmitLdcI2IL.DeclareLocal(GetType(OpCode))
locbldr51.SetLocalSymInfo("op")
EmitLdcI2IL.MarkSequencePoint(doc3, 756, 1, 756, 100)
Dim locbldr52 As LocalBuilder = EmitLdcI2IL.DeclareLocal(GetType(System.Int32))
locbldr52.SetLocalSymInfo("num")
EmitLdcI2IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int16)
Dim typ246 As Type() = {Typ}
EmitLdcI2IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ246))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ246).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 1)
EmitLdcI2IL.MarkSequencePoint(doc3, 762, 1, 762, 100)
Dim label10 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.MarkSequencePoint(doc3, 764, 1, 764, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa244 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru244 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont244 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru244)
EmitLdcI2IL.Emit(OpCodes.Br, fa244)
EmitLdcI2IL.MarkLabel(tru244)
EmitLdcI2IL.MarkSequencePoint(doc3, 765, 1, 765, 100)
Dim typ247(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ247(UBound(typ247) + 1)
typ247(UBound(typ247)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ247))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ247).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 766, 1, 766, 100)
Dim typ248(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ248(UBound(typ248) + 1)
typ248(UBound(typ248)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ248))
Typ = Typ03.GetMethod("Emit", typ248).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 767, 1, 767, 100)
Dim typ249(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ249(UBound(typ249) + 1)
typ249(UBound(typ249)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ249))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ249).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 768, 1, 768, 100)
Dim typ250(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ250(UBound(typ250) + 1)
typ250(UBound(typ250)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ250))
Typ = Typ03.GetMethod("Emit", typ250).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 769, 1, 769, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 770, 1, 770, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont244)
EmitLdcI2IL.MarkLabel(fa244)
EmitLdcI2IL.Emit(OpCodes.Br, cont244)
EmitLdcI2IL.MarkLabel(cont244)
EmitLdcI2IL.MarkSequencePoint(doc3, 772, 1, 772, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa245 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru245 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont245 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru245)
EmitLdcI2IL.Emit(OpCodes.Br, fa245)
EmitLdcI2IL.MarkLabel(tru245)
EmitLdcI2IL.MarkSequencePoint(doc3, 773, 1, 773, 100)
Dim typ251(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ251(UBound(typ251) + 1)
typ251(UBound(typ251)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ251))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ251).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 774, 1, 774, 100)
Dim typ252(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ252(UBound(typ252) + 1)
typ252(UBound(typ252)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ252))
Typ = Typ03.GetMethod("Emit", typ252).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 775, 1, 775, 100)
Dim typ253(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ253(UBound(typ253) + 1)
typ253(UBound(typ253)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ253))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ253).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 776, 1, 776, 100)
Dim typ254(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ254(UBound(typ254) + 1)
typ254(UBound(typ254)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ254))
Typ = Typ03.GetMethod("Emit", typ254).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 777, 1, 777, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 778, 1, 778, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont245)
EmitLdcI2IL.MarkLabel(fa245)
EmitLdcI2IL.Emit(OpCodes.Br, cont245)
EmitLdcI2IL.MarkLabel(cont245)
EmitLdcI2IL.MarkSequencePoint(doc3, 780, 1, 780, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa246 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru246 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont246 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru246)
EmitLdcI2IL.Emit(OpCodes.Br, fa246)
EmitLdcI2IL.MarkLabel(tru246)
EmitLdcI2IL.MarkSequencePoint(doc3, 781, 1, 781, 100)
Dim typ255(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ255(UBound(typ255) + 1)
typ255(UBound(typ255)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ255))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ255).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 782, 1, 782, 100)
Dim typ256(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ256(UBound(typ256) + 1)
typ256(UBound(typ256)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ256))
Typ = Typ03.GetMethod("Emit", typ256).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 783, 1, 783, 100)
Dim typ257(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ257(UBound(typ257) + 1)
typ257(UBound(typ257)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ257))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ257).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 784, 1, 784, 100)
Dim typ258(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ258(UBound(typ258) + 1)
typ258(UBound(typ258)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ258))
Typ = Typ03.GetMethod("Emit", typ258).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 785, 1, 785, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 786, 1, 786, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont246)
EmitLdcI2IL.MarkLabel(fa246)
EmitLdcI2IL.Emit(OpCodes.Br, cont246)
EmitLdcI2IL.MarkLabel(cont246)
EmitLdcI2IL.MarkSequencePoint(doc3, 788, 1, 788, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa247 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru247 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont247 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru247)
EmitLdcI2IL.Emit(OpCodes.Br, fa247)
EmitLdcI2IL.MarkLabel(tru247)
EmitLdcI2IL.MarkSequencePoint(doc3, 789, 1, 789, 100)
Dim typ259(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ259(UBound(typ259) + 1)
typ259(UBound(typ259)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ259))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ259).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 790, 1, 790, 100)
Dim typ260(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ260(UBound(typ260) + 1)
typ260(UBound(typ260)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ260))
Typ = Typ03.GetMethod("Emit", typ260).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 791, 1, 791, 100)
Dim typ261(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ261(UBound(typ261) + 1)
typ261(UBound(typ261)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ261))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ261).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 792, 1, 792, 100)
Dim typ262(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ262(UBound(typ262) + 1)
typ262(UBound(typ262)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ262))
Typ = Typ03.GetMethod("Emit", typ262).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 793, 1, 793, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 794, 1, 794, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont247)
EmitLdcI2IL.MarkLabel(fa247)
EmitLdcI2IL.Emit(OpCodes.Br, cont247)
EmitLdcI2IL.MarkLabel(cont247)
EmitLdcI2IL.MarkSequencePoint(doc3, 796, 1, 796, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa248 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru248 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont248 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru248)
EmitLdcI2IL.Emit(OpCodes.Br, fa248)
EmitLdcI2IL.MarkLabel(tru248)
EmitLdcI2IL.MarkSequencePoint(doc3, 797, 1, 797, 100)
Dim typ263(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ263(UBound(typ263) + 1)
typ263(UBound(typ263)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ263))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ263).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 798, 1, 798, 100)
Dim typ264(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ264(UBound(typ264) + 1)
typ264(UBound(typ264)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ264))
Typ = Typ03.GetMethod("Emit", typ264).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 799, 1, 799, 100)
Dim typ265(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ265(UBound(typ265) + 1)
typ265(UBound(typ265)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ265))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ265).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 800, 1, 800, 100)
Dim typ266(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ266(UBound(typ266) + 1)
typ266(UBound(typ266)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ266))
Typ = Typ03.GetMethod("Emit", typ266).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 801, 1, 801, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 802, 1, 802, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont248)
EmitLdcI2IL.MarkLabel(fa248)
EmitLdcI2IL.Emit(OpCodes.Br, cont248)
EmitLdcI2IL.MarkLabel(cont248)
EmitLdcI2IL.MarkSequencePoint(doc3, 804, 1, 804, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
Dim fa249 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru249 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont249 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru249)
EmitLdcI2IL.Emit(OpCodes.Br, fa249)
EmitLdcI2IL.MarkLabel(tru249)
EmitLdcI2IL.MarkSequencePoint(doc3, 805, 1, 805, 100)
Dim typ267(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ267(UBound(typ267) + 1)
typ267(UBound(typ267)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ267))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ267).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 806, 1, 806, 100)
Dim typ268(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ268(UBound(typ268) + 1)
typ268(UBound(typ268)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ268))
Typ = Typ03.GetMethod("Emit", typ268).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 807, 1, 807, 100)
Dim typ269(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ269(UBound(typ269) + 1)
typ269(UBound(typ269)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ269))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ269).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 808, 1, 808, 100)
Dim typ270(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ270(UBound(typ270) + 1)
typ270(UBound(typ270)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ270))
Typ = Typ03.GetMethod("Emit", typ270).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 809, 1, 809, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 810, 1, 810, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont249)
EmitLdcI2IL.MarkLabel(fa249)
EmitLdcI2IL.Emit(OpCodes.Br, cont249)
EmitLdcI2IL.MarkLabel(cont249)
EmitLdcI2IL.MarkSequencePoint(doc3, 812, 1, 812, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
Dim fa250 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru250 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont250 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru250)
EmitLdcI2IL.Emit(OpCodes.Br, fa250)
EmitLdcI2IL.MarkLabel(tru250)
EmitLdcI2IL.MarkSequencePoint(doc3, 813, 1, 813, 100)
Dim typ271(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ271(UBound(typ271) + 1)
typ271(UBound(typ271)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ271))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ271).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 814, 1, 814, 100)
Dim typ272(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ272(UBound(typ272) + 1)
typ272(UBound(typ272)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ272))
Typ = Typ03.GetMethod("Emit", typ272).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 815, 1, 815, 100)
Dim typ273(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ273(UBound(typ273) + 1)
typ273(UBound(typ273)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ273))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ273).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 816, 1, 816, 100)
Dim typ274(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ274(UBound(typ274) + 1)
typ274(UBound(typ274)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ274))
Typ = Typ03.GetMethod("Emit", typ274).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 817, 1, 817, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 818, 1, 818, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont250)
EmitLdcI2IL.MarkLabel(fa250)
EmitLdcI2IL.Emit(OpCodes.Br, cont250)
EmitLdcI2IL.MarkLabel(cont250)
EmitLdcI2IL.MarkSequencePoint(doc3, 820, 1, 820, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
Dim fa251 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru251 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont251 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru251)
EmitLdcI2IL.Emit(OpCodes.Br, fa251)
EmitLdcI2IL.MarkLabel(tru251)
EmitLdcI2IL.MarkSequencePoint(doc3, 821, 1, 821, 100)
Dim typ275(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ275(UBound(typ275) + 1)
typ275(UBound(typ275)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ275))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ275).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 822, 1, 822, 100)
Dim typ276(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ276(UBound(typ276) + 1)
typ276(UBound(typ276)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ276))
Typ = Typ03.GetMethod("Emit", typ276).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 823, 1, 823, 100)
Dim typ277(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ277(UBound(typ277) + 1)
typ277(UBound(typ277)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ277))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ277).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 824, 1, 824, 100)
Dim typ278(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ278(UBound(typ278) + 1)
typ278(UBound(typ278)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ278))
Typ = Typ03.GetMethod("Emit", typ278).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 825, 1, 825, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 826, 1, 826, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont251)
EmitLdcI2IL.MarkLabel(fa251)
EmitLdcI2IL.Emit(OpCodes.Br, cont251)
EmitLdcI2IL.MarkLabel(cont251)
EmitLdcI2IL.MarkSequencePoint(doc3, 828, 1, 828, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
Dim fa252 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru252 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont252 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru252)
EmitLdcI2IL.Emit(OpCodes.Br, fa252)
EmitLdcI2IL.MarkLabel(tru252)
EmitLdcI2IL.MarkSequencePoint(doc3, 829, 1, 829, 100)
Dim typ279(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ279(UBound(typ279) + 1)
typ279(UBound(typ279)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ279))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ279).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 830, 1, 830, 100)
Dim typ280(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ280(UBound(typ280) + 1)
typ280(UBound(typ280)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ280))
Typ = Typ03.GetMethod("Emit", typ280).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 831, 1, 831, 100)
Dim typ281(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ281(UBound(typ281) + 1)
typ281(UBound(typ281)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ281))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ281).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 832, 1, 832, 100)
Dim typ282(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ282(UBound(typ282) + 1)
typ282(UBound(typ282)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ282))
Typ = Typ03.GetMethod("Emit", typ282).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 833, 1, 833, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 834, 1, 834, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont252)
EmitLdcI2IL.MarkLabel(fa252)
EmitLdcI2IL.Emit(OpCodes.Br, cont252)
EmitLdcI2IL.MarkLabel(cont252)
EmitLdcI2IL.MarkSequencePoint(doc3, 836, 1, 836, 100)
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI2IL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
Dim fa253 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim tru253 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
Dim cont253 As System.Reflection.Emit.Label = EmitLdcI2IL.DefineLabel()
EmitLdcI2IL.Emit(OpCodes.Beq, tru253)
EmitLdcI2IL.Emit(OpCodes.Br, fa253)
EmitLdcI2IL.MarkLabel(tru253)
EmitLdcI2IL.MarkSequencePoint(doc3, 837, 1, 837, 100)
Dim typ283(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ283(UBound(typ283) + 1)
typ283(UBound(typ283)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ283))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ283).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 838, 1, 838, 100)
Dim typ284(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ284(UBound(typ284) + 1)
typ284(UBound(typ284)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ284))
Typ = Typ03.GetMethod("Emit", typ284).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 839, 1, 839, 100)
Dim typ285(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ285(UBound(typ285) + 1)
typ285(UBound(typ285)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ285))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ285).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 840, 1, 840, 100)
Dim typ286(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ286(UBound(typ286) + 1)
typ286(UBound(typ286)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ286))
Typ = Typ03.GetMethod("Emit", typ286).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 841, 1, 841, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 842, 1, 842, 100)
EmitLdcI2IL.Emit(OpCodes.Br, cont253)
EmitLdcI2IL.MarkLabel(fa253)
EmitLdcI2IL.Emit(OpCodes.Br, cont253)
EmitLdcI2IL.MarkLabel(cont253)
EmitLdcI2IL.MarkSequencePoint(doc3, 860, 1, 860, 100)
Dim typ287(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ287(UBound(typ287) + 1)
typ287(UBound(typ287)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ287))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ287).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 862, 1, 862, 100)
Dim typ288(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ288(UBound(typ288) + 1)
typ288(UBound(typ288)) = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ288(UBound(typ288) + 1)
typ288(UBound(typ288)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ288))
Typ = Typ03.GetMethod("Emit", typ288).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 863, 1, 863, 100)
Dim typ289(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldstr, "conv.i2")
Typ = GetType(System.String)
ReDim Preserve typ289(UBound(typ289) + 1)
typ289(UBound(typ289)) = Typ
EmitLdcI2IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ289))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ289).ReturnType
EmitLdcI2IL.Emit(OpCodes.Stloc, 0)
EmitLdcI2IL.MarkSequencePoint(doc3, 864, 1, 864, 100)
Dim typ290(-1) As Type
EmitLdcI2IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI2IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ290(UBound(typ290) + 1)
typ290(UBound(typ290)) = Typ
EmitLdcI2IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ290))
Typ = Typ03.GetMethod("Emit", typ290).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI2IL.Emit(OpCodes.Pop)
End If
EmitLdcI2IL.MarkSequencePoint(doc3, 865, 1, 865, 100)
EmitLdcI2IL.Emit(OpCodes.Br, label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 868, 1, 868, 100)
EmitLdcI2IL.MarkLabel(label10)
EmitLdcI2IL.MarkSequencePoint(doc3, 869, 1, 869, 100)
EmitLdcI2IL.Emit(OpCodes.Ret)
Dim typ291(-1) As Type
ReDim Preserve typ291(UBound(typ291) + 1)
typ291(UBound(typ291)) = GetType(System.SByte)
Dim EmitLdcI1 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcI1", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ291)
Dim EmitLdcI1IL As ILGenerator = EmitLdcI1.GetILGenerator()
Dim EmitLdcI1param01 As ParameterBuilder = EmitLdcI1.DefineParameter(1, ParameterAttributes.None, "n")
EmitLdcI1IL.MarkSequencePoint(doc3, 872, 1, 872, 100)
Dim locbldr53 As LocalBuilder = EmitLdcI1IL.DeclareLocal(GetType(OpCode))
locbldr53.SetLocalSymInfo("op")
EmitLdcI1IL.MarkSequencePoint(doc3, 873, 1, 873, 100)
Dim locbldr54 As LocalBuilder = EmitLdcI1IL.DeclareLocal(GetType(System.Int32))
locbldr54.SetLocalSymInfo("num")
EmitLdcI1IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.SByte)
Dim typ292 As Type() = {Typ}
EmitLdcI1IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ292))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ292).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 1)
EmitLdcI1IL.MarkSequencePoint(doc3, 879, 1, 879, 100)
Dim label11 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.MarkSequencePoint(doc3, 881, 1, 881, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa254 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru254 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont254 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru254)
EmitLdcI1IL.Emit(OpCodes.Br, fa254)
EmitLdcI1IL.MarkLabel(tru254)
EmitLdcI1IL.MarkSequencePoint(doc3, 882, 1, 882, 100)
Dim typ293(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.m1")
Typ = GetType(System.String)
ReDim Preserve typ293(UBound(typ293) + 1)
typ293(UBound(typ293)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ293))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ293).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 883, 1, 883, 100)
Dim typ294(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ294(UBound(typ294) + 1)
typ294(UBound(typ294)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ294))
Typ = Typ03.GetMethod("Emit", typ294).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 884, 1, 884, 100)
Dim typ295(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ295(UBound(typ295) + 1)
typ295(UBound(typ295)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ295))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ295).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 885, 1, 885, 100)
Dim typ296(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ296(UBound(typ296) + 1)
typ296(UBound(typ296)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ296))
Typ = Typ03.GetMethod("Emit", typ296).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 886, 1, 886, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 887, 1, 887, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont254)
EmitLdcI1IL.MarkLabel(fa254)
EmitLdcI1IL.Emit(OpCodes.Br, cont254)
EmitLdcI1IL.MarkLabel(cont254)
EmitLdcI1IL.MarkSequencePoint(doc3, 889, 1, 889, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa255 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru255 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont255 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru255)
EmitLdcI1IL.Emit(OpCodes.Br, fa255)
EmitLdcI1IL.MarkLabel(tru255)
EmitLdcI1IL.MarkSequencePoint(doc3, 890, 1, 890, 100)
Dim typ297(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ297(UBound(typ297) + 1)
typ297(UBound(typ297)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ297))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ297).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 891, 1, 891, 100)
Dim typ298(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ298(UBound(typ298) + 1)
typ298(UBound(typ298)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ298))
Typ = Typ03.GetMethod("Emit", typ298).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 892, 1, 892, 100)
Dim typ299(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ299(UBound(typ299) + 1)
typ299(UBound(typ299)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ299))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ299).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 893, 1, 893, 100)
Dim typ300(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ300(UBound(typ300) + 1)
typ300(UBound(typ300)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ300))
Typ = Typ03.GetMethod("Emit", typ300).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 894, 1, 894, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 895, 1, 895, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont255)
EmitLdcI1IL.MarkLabel(fa255)
EmitLdcI1IL.Emit(OpCodes.Br, cont255)
EmitLdcI1IL.MarkLabel(cont255)
EmitLdcI1IL.MarkSequencePoint(doc3, 897, 1, 897, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa256 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru256 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont256 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru256)
EmitLdcI1IL.Emit(OpCodes.Br, fa256)
EmitLdcI1IL.MarkLabel(tru256)
EmitLdcI1IL.MarkSequencePoint(doc3, 898, 1, 898, 100)
Dim typ301(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ301(UBound(typ301) + 1)
typ301(UBound(typ301)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ301))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ301).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 899, 1, 899, 100)
Dim typ302(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ302(UBound(typ302) + 1)
typ302(UBound(typ302)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ302))
Typ = Typ03.GetMethod("Emit", typ302).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 900, 1, 900, 100)
Dim typ303(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ303(UBound(typ303) + 1)
typ303(UBound(typ303)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ303))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ303).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 901, 1, 901, 100)
Dim typ304(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ304(UBound(typ304) + 1)
typ304(UBound(typ304)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ304))
Typ = Typ03.GetMethod("Emit", typ304).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 902, 1, 902, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 903, 1, 903, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont256)
EmitLdcI1IL.MarkLabel(fa256)
EmitLdcI1IL.Emit(OpCodes.Br, cont256)
EmitLdcI1IL.MarkLabel(cont256)
EmitLdcI1IL.MarkSequencePoint(doc3, 905, 1, 905, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
Dim fa257 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru257 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont257 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru257)
EmitLdcI1IL.Emit(OpCodes.Br, fa257)
EmitLdcI1IL.MarkLabel(tru257)
EmitLdcI1IL.MarkSequencePoint(doc3, 906, 1, 906, 100)
Dim typ305(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.2")
Typ = GetType(System.String)
ReDim Preserve typ305(UBound(typ305) + 1)
typ305(UBound(typ305)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ305))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ305).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 907, 1, 907, 100)
Dim typ306(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ306(UBound(typ306) + 1)
typ306(UBound(typ306)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ306))
Typ = Typ03.GetMethod("Emit", typ306).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 908, 1, 908, 100)
Dim typ307(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ307(UBound(typ307) + 1)
typ307(UBound(typ307)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ307))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ307).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 909, 1, 909, 100)
Dim typ308(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ308(UBound(typ308) + 1)
typ308(UBound(typ308)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ308))
Typ = Typ03.GetMethod("Emit", typ308).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 910, 1, 910, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 911, 1, 911, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont257)
EmitLdcI1IL.MarkLabel(fa257)
EmitLdcI1IL.Emit(OpCodes.Br, cont257)
EmitLdcI1IL.MarkLabel(cont257)
EmitLdcI1IL.MarkSequencePoint(doc3, 913, 1, 913, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
Dim fa258 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru258 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont258 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru258)
EmitLdcI1IL.Emit(OpCodes.Br, fa258)
EmitLdcI1IL.MarkLabel(tru258)
EmitLdcI1IL.MarkSequencePoint(doc3, 914, 1, 914, 100)
Dim typ309(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.3")
Typ = GetType(System.String)
ReDim Preserve typ309(UBound(typ309) + 1)
typ309(UBound(typ309)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ309))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ309).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 915, 1, 915, 100)
Dim typ310(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ310(UBound(typ310) + 1)
typ310(UBound(typ310)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ310))
Typ = Typ03.GetMethod("Emit", typ310).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 916, 1, 916, 100)
Dim typ311(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ311(UBound(typ311) + 1)
typ311(UBound(typ311)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ311))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ311).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 917, 1, 917, 100)
Dim typ312(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ312(UBound(typ312) + 1)
typ312(UBound(typ312)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ312))
Typ = Typ03.GetMethod("Emit", typ312).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 918, 1, 918, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 919, 1, 919, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont258)
EmitLdcI1IL.MarkLabel(fa258)
EmitLdcI1IL.Emit(OpCodes.Br, cont258)
EmitLdcI1IL.MarkLabel(cont258)
EmitLdcI1IL.MarkSequencePoint(doc3, 921, 1, 921, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
Dim fa259 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru259 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont259 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru259)
EmitLdcI1IL.Emit(OpCodes.Br, fa259)
EmitLdcI1IL.MarkLabel(tru259)
EmitLdcI1IL.MarkSequencePoint(doc3, 922, 1, 922, 100)
Dim typ313(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.4")
Typ = GetType(System.String)
ReDim Preserve typ313(UBound(typ313) + 1)
typ313(UBound(typ313)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ313))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ313).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 923, 1, 923, 100)
Dim typ314(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ314(UBound(typ314) + 1)
typ314(UBound(typ314)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ314))
Typ = Typ03.GetMethod("Emit", typ314).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 924, 1, 924, 100)
Dim typ315(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ315(UBound(typ315) + 1)
typ315(UBound(typ315)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ315))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ315).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 925, 1, 925, 100)
Dim typ316(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ316(UBound(typ316) + 1)
typ316(UBound(typ316)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ316))
Typ = Typ03.GetMethod("Emit", typ316).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 926, 1, 926, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 927, 1, 927, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont259)
EmitLdcI1IL.MarkLabel(fa259)
EmitLdcI1IL.Emit(OpCodes.Br, cont259)
EmitLdcI1IL.MarkLabel(cont259)
EmitLdcI1IL.MarkSequencePoint(doc3, 929, 1, 929, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
Dim fa260 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru260 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont260 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru260)
EmitLdcI1IL.Emit(OpCodes.Br, fa260)
EmitLdcI1IL.MarkLabel(tru260)
EmitLdcI1IL.MarkSequencePoint(doc3, 930, 1, 930, 100)
Dim typ317(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.5")
Typ = GetType(System.String)
ReDim Preserve typ317(UBound(typ317) + 1)
typ317(UBound(typ317)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ317))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ317).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 931, 1, 931, 100)
Dim typ318(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ318(UBound(typ318) + 1)
typ318(UBound(typ318)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ318))
Typ = Typ03.GetMethod("Emit", typ318).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 932, 1, 932, 100)
Dim typ319(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ319(UBound(typ319) + 1)
typ319(UBound(typ319)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ319))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ319).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 933, 1, 933, 100)
Dim typ320(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ320(UBound(typ320) + 1)
typ320(UBound(typ320)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ320))
Typ = Typ03.GetMethod("Emit", typ320).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 934, 1, 934, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 935, 1, 935, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont260)
EmitLdcI1IL.MarkLabel(fa260)
EmitLdcI1IL.Emit(OpCodes.Br, cont260)
EmitLdcI1IL.MarkLabel(cont260)
EmitLdcI1IL.MarkSequencePoint(doc3, 937, 1, 937, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
Dim fa261 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru261 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont261 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru261)
EmitLdcI1IL.Emit(OpCodes.Br, fa261)
EmitLdcI1IL.MarkLabel(tru261)
EmitLdcI1IL.MarkSequencePoint(doc3, 938, 1, 938, 100)
Dim typ321(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.6")
Typ = GetType(System.String)
ReDim Preserve typ321(UBound(typ321) + 1)
typ321(UBound(typ321)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ321))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ321).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 939, 1, 939, 100)
Dim typ322(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ322(UBound(typ322) + 1)
typ322(UBound(typ322)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ322))
Typ = Typ03.GetMethod("Emit", typ322).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 940, 1, 940, 100)
Dim typ323(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ323(UBound(typ323) + 1)
typ323(UBound(typ323)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ323))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ323).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 941, 1, 941, 100)
Dim typ324(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ324(UBound(typ324) + 1)
typ324(UBound(typ324)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ324))
Typ = Typ03.GetMethod("Emit", typ324).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 942, 1, 942, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 943, 1, 943, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont261)
EmitLdcI1IL.MarkLabel(fa261)
EmitLdcI1IL.Emit(OpCodes.Br, cont261)
EmitLdcI1IL.MarkLabel(cont261)
EmitLdcI1IL.MarkSequencePoint(doc3, 945, 1, 945, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
Dim fa262 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru262 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont262 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru262)
EmitLdcI1IL.Emit(OpCodes.Br, fa262)
EmitLdcI1IL.MarkLabel(tru262)
EmitLdcI1IL.MarkSequencePoint(doc3, 946, 1, 946, 100)
Dim typ325(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.7")
Typ = GetType(System.String)
ReDim Preserve typ325(UBound(typ325) + 1)
typ325(UBound(typ325)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ325))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ325).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 947, 1, 947, 100)
Dim typ326(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ326(UBound(typ326) + 1)
typ326(UBound(typ326)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ326))
Typ = Typ03.GetMethod("Emit", typ326).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 948, 1, 948, 100)
Dim typ327(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ327(UBound(typ327) + 1)
typ327(UBound(typ327)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ327))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ327).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 949, 1, 949, 100)
Dim typ328(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ328(UBound(typ328) + 1)
typ328(UBound(typ328)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ328))
Typ = Typ03.GetMethod("Emit", typ328).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 950, 1, 950, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 951, 1, 951, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont262)
EmitLdcI1IL.MarkLabel(fa262)
EmitLdcI1IL.Emit(OpCodes.Br, cont262)
EmitLdcI1IL.MarkLabel(cont262)
EmitLdcI1IL.MarkSequencePoint(doc3, 953, 1, 953, 100)
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
EmitLdcI1IL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
Dim fa263 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim tru263 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
Dim cont263 As System.Reflection.Emit.Label = EmitLdcI1IL.DefineLabel()
EmitLdcI1IL.Emit(OpCodes.Beq, tru263)
EmitLdcI1IL.Emit(OpCodes.Br, fa263)
EmitLdcI1IL.MarkLabel(tru263)
EmitLdcI1IL.MarkSequencePoint(doc3, 954, 1, 954, 100)
Dim typ329(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4.8")
Typ = GetType(System.String)
ReDim Preserve typ329(UBound(typ329) + 1)
typ329(UBound(typ329)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ329))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ329).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 955, 1, 955, 100)
Dim typ330(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ330(UBound(typ330) + 1)
typ330(UBound(typ330)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ330))
Typ = Typ03.GetMethod("Emit", typ330).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 956, 1, 956, 100)
Dim typ331(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ331(UBound(typ331) + 1)
typ331(UBound(typ331)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ331))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ331).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 957, 1, 957, 100)
Dim typ332(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ332(UBound(typ332) + 1)
typ332(UBound(typ332)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ332))
Typ = Typ03.GetMethod("Emit", typ332).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 958, 1, 958, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 959, 1, 959, 100)
EmitLdcI1IL.Emit(OpCodes.Br, cont263)
EmitLdcI1IL.MarkLabel(fa263)
EmitLdcI1IL.Emit(OpCodes.Br, cont263)
EmitLdcI1IL.MarkLabel(cont263)
EmitLdcI1IL.MarkSequencePoint(doc3, 977, 1, 977, 100)
Dim typ333(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ333(UBound(typ333) + 1)
typ333(UBound(typ333)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ333))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ333).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 979, 1, 979, 100)
Dim typ334(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ334(UBound(typ334) + 1)
typ334(UBound(typ334)) = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ334(UBound(typ334) + 1)
typ334(UBound(typ334)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ334))
Typ = Typ03.GetMethod("Emit", typ334).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 980, 1, 980, 100)
Dim typ335(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldstr, "conv.i1")
Typ = GetType(System.String)
ReDim Preserve typ335(UBound(typ335) + 1)
typ335(UBound(typ335)) = Typ
EmitLdcI1IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ335))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ335).ReturnType
EmitLdcI1IL.Emit(OpCodes.Stloc, 0)
EmitLdcI1IL.MarkSequencePoint(doc3, 981, 1, 981, 100)
Dim typ336(-1) As Type
EmitLdcI1IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcI1IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ336(UBound(typ336) + 1)
typ336(UBound(typ336)) = Typ
EmitLdcI1IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ336))
Typ = Typ03.GetMethod("Emit", typ336).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcI1IL.Emit(OpCodes.Pop)
End If
EmitLdcI1IL.MarkSequencePoint(doc3, 982, 1, 982, 100)
EmitLdcI1IL.Emit(OpCodes.Br, label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 985, 1, 985, 100)
EmitLdcI1IL.MarkLabel(label11)
EmitLdcI1IL.MarkSequencePoint(doc3, 986, 1, 986, 100)
EmitLdcI1IL.Emit(OpCodes.Ret)
Dim typ337(-1) As Type
ReDim Preserve typ337(UBound(typ337) + 1)
typ337(UBound(typ337)) = GetType(MethodInfo)
Dim EmitCallvirt As MethodBuilder = ILEmitter.DefineMethod("EmitCallvirt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ337)
Dim EmitCallvirtIL As ILGenerator = EmitCallvirt.GetILGenerator()
Dim EmitCallvirtparam01 As ParameterBuilder = EmitCallvirt.DefineParameter(1, ParameterAttributes.None, "met")
EmitCallvirtIL.MarkSequencePoint(doc3, 989, 1, 989, 100)
Dim locbldr55 As LocalBuilder = EmitCallvirtIL.DeclareLocal(GetType(OpCode))
locbldr55.SetLocalSymInfo("cvop")
Dim typ338(-1) As Type
EmitCallvirtIL.Emit(OpCodes.Ldstr, "callvirt")
Typ = GetType(System.String)
ReDim Preserve typ338(UBound(typ338) + 1)
typ338(UBound(typ338)) = Typ
EmitCallvirtIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ338))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ338).ReturnType
EmitCallvirtIL.Emit(OpCodes.Stloc, 0)
EmitCallvirtIL.MarkSequencePoint(doc3, 990, 1, 990, 100)
Dim typ339(-1) As Type
EmitCallvirtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCallvirtIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ339(UBound(typ339) + 1)
typ339(UBound(typ339)) = Typ
EmitCallvirtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ339(UBound(typ339) + 1)
typ339(UBound(typ339)) = Typ
EmitCallvirtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ339))
Typ = Typ03.GetMethod("Emit", typ339).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCallvirtIL.Emit(OpCodes.Pop)
End If
EmitCallvirtIL.MarkSequencePoint(doc3, 991, 1, 991, 100)
EmitCallvirtIL.Emit(OpCodes.Ret)
Dim typ340(-1) As Type
ReDim Preserve typ340(UBound(typ340) + 1)
typ340(UBound(typ340)) = GetType(ConstructorInfo)
Dim EmitCallCtor As MethodBuilder = ILEmitter.DefineMethod("EmitCallCtor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ340)
Dim EmitCallCtorIL As ILGenerator = EmitCallCtor.GetILGenerator()
Dim EmitCallCtorparam01 As ParameterBuilder = EmitCallCtor.DefineParameter(1, ParameterAttributes.None, "met")
EmitCallCtorIL.MarkSequencePoint(doc3, 994, 1, 994, 100)
Dim locbldr56 As LocalBuilder = EmitCallCtorIL.DeclareLocal(GetType(OpCode))
locbldr56.SetLocalSymInfo("cop")
Dim typ341(-1) As Type
EmitCallCtorIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ341(UBound(typ341) + 1)
typ341(UBound(typ341)) = Typ
EmitCallCtorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ341))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ341).ReturnType
EmitCallCtorIL.Emit(OpCodes.Stloc, 0)
EmitCallCtorIL.MarkSequencePoint(doc3, 995, 1, 995, 100)
Dim typ342(-1) As Type
EmitCallCtorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCallCtorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ342(UBound(typ342) + 1)
typ342(UBound(typ342)) = Typ
EmitCallCtorIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ConstructorInfo)
ReDim Preserve typ342(UBound(typ342) + 1)
typ342(UBound(typ342)) = Typ
EmitCallCtorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ342))
Typ = Typ03.GetMethod("Emit", typ342).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCallCtorIL.Emit(OpCodes.Pop)
End If
EmitCallCtorIL.MarkSequencePoint(doc3, 996, 1, 996, 100)
EmitCallCtorIL.Emit(OpCodes.Ret)
Dim typ343(-1) As Type
ReDim Preserve typ343(UBound(typ343) + 1)
typ343(UBound(typ343)) = GetType(MethodInfo)
Dim EmitCall As MethodBuilder = ILEmitter.DefineMethod("EmitCall", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ343)
Dim EmitCallIL As ILGenerator = EmitCall.GetILGenerator()
Dim EmitCallparam01 As ParameterBuilder = EmitCall.DefineParameter(1, ParameterAttributes.None, "met")
EmitCallIL.MarkSequencePoint(doc3, 999, 1, 999, 100)
Dim locbldr57 As LocalBuilder = EmitCallIL.DeclareLocal(GetType(OpCode))
locbldr57.SetLocalSymInfo("cop")
Dim typ344(-1) As Type
EmitCallIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ344(UBound(typ344) + 1)
typ344(UBound(typ344)) = Typ
EmitCallIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ344))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ344).ReturnType
EmitCallIL.Emit(OpCodes.Stloc, 0)
EmitCallIL.MarkSequencePoint(doc3, 1000, 1, 1000, 100)
Dim typ345(-1) As Type
EmitCallIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCallIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ345(UBound(typ345) + 1)
typ345(UBound(typ345)) = Typ
EmitCallIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ345(UBound(typ345) + 1)
typ345(UBound(typ345)) = Typ
EmitCallIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ345))
Typ = Typ03.GetMethod("Emit", typ345).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCallIL.Emit(OpCodes.Pop)
End If
EmitCallIL.MarkSequencePoint(doc3, 1001, 1, 1001, 100)
EmitCallIL.Emit(OpCodes.Ret)
Dim typ346(-1) As Type
ReDim Preserve typ346(UBound(typ346) + 1)
typ346(UBound(typ346)) = GetType(MethodInfo)
Dim EmitLdftn As MethodBuilder = ILEmitter.DefineMethod("EmitLdftn", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ346)
Dim EmitLdftnIL As ILGenerator = EmitLdftn.GetILGenerator()
Dim EmitLdftnparam01 As ParameterBuilder = EmitLdftn.DefineParameter(1, ParameterAttributes.None, "met")
EmitLdftnIL.MarkSequencePoint(doc3, 1004, 1, 1004, 100)
Dim locbldr58 As LocalBuilder = EmitLdftnIL.DeclareLocal(GetType(OpCode))
locbldr58.SetLocalSymInfo("op")
Dim typ347(-1) As Type
EmitLdftnIL.Emit(OpCodes.Ldstr, "ldftn")
Typ = GetType(System.String)
ReDim Preserve typ347(UBound(typ347) + 1)
typ347(UBound(typ347)) = Typ
EmitLdftnIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ347))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ347).ReturnType
EmitLdftnIL.Emit(OpCodes.Stloc, 0)
EmitLdftnIL.MarkSequencePoint(doc3, 1005, 1, 1005, 100)
Dim typ348(-1) As Type
EmitLdftnIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdftnIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ348(UBound(typ348) + 1)
typ348(UBound(typ348)) = Typ
EmitLdftnIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ348(UBound(typ348) + 1)
typ348(UBound(typ348)) = Typ
EmitLdftnIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ348))
Typ = Typ03.GetMethod("Emit", typ348).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdftnIL.Emit(OpCodes.Pop)
End If
EmitLdftnIL.MarkSequencePoint(doc3, 1006, 1, 1006, 100)
EmitLdftnIL.Emit(OpCodes.Ret)
Dim typ349(-1) As Type
ReDim Preserve typ349(UBound(typ349) + 1)
typ349(UBound(typ349)) = GetType(MethodInfo)
Dim EmitLdvirtftn As MethodBuilder = ILEmitter.DefineMethod("EmitLdvirtftn", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ349)
Dim EmitLdvirtftnIL As ILGenerator = EmitLdvirtftn.GetILGenerator()
Dim EmitLdvirtftnparam01 As ParameterBuilder = EmitLdvirtftn.DefineParameter(1, ParameterAttributes.None, "met")
EmitLdvirtftnIL.MarkSequencePoint(doc3, 1009, 1, 1009, 100)
Dim locbldr59 As LocalBuilder = EmitLdvirtftnIL.DeclareLocal(GetType(OpCode))
locbldr59.SetLocalSymInfo("op")
Dim typ350(-1) As Type
EmitLdvirtftnIL.Emit(OpCodes.Ldstr, "ldvirtftn")
Typ = GetType(System.String)
ReDim Preserve typ350(UBound(typ350) + 1)
typ350(UBound(typ350)) = Typ
EmitLdvirtftnIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ350))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ350).ReturnType
EmitLdvirtftnIL.Emit(OpCodes.Stloc, 0)
EmitLdvirtftnIL.MarkSequencePoint(doc3, 1010, 1, 1010, 100)
Dim typ351(-1) As Type
EmitLdvirtftnIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdvirtftnIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ351(UBound(typ351) + 1)
typ351(UBound(typ351)) = Typ
EmitLdvirtftnIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo)
ReDim Preserve typ351(UBound(typ351) + 1)
typ351(UBound(typ351)) = Typ
EmitLdvirtftnIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ351))
Typ = Typ03.GetMethod("Emit", typ351).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdvirtftnIL.Emit(OpCodes.Pop)
End If
EmitLdvirtftnIL.MarkSequencePoint(doc3, 1011, 1, 1011, 100)
EmitLdvirtftnIL.Emit(OpCodes.Ret)
Dim typ352(-1) As Type
ReDim Preserve typ352(UBound(typ352) + 1)
typ352(UBound(typ352)) = GetType(FieldInfo)
Dim EmitLdfld As MethodBuilder = ILEmitter.DefineMethod("EmitLdfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ352)
Dim EmitLdfldIL As ILGenerator = EmitLdfld.GetILGenerator()
Dim EmitLdfldparam01 As ParameterBuilder = EmitLdfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdfldIL.MarkSequencePoint(doc3, 1014, 1, 1014, 100)
Dim locbldr60 As LocalBuilder = EmitLdfldIL.DeclareLocal(GetType(OpCode))
locbldr60.SetLocalSymInfo("lop")
Dim typ353(-1) As Type
EmitLdfldIL.Emit(OpCodes.Ldstr, "ldfld")
Typ = GetType(System.String)
ReDim Preserve typ353(UBound(typ353) + 1)
typ353(UBound(typ353)) = Typ
EmitLdfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ353))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ353).ReturnType
EmitLdfldIL.Emit(OpCodes.Stloc, 0)
EmitLdfldIL.MarkSequencePoint(doc3, 1015, 1, 1015, 100)
Dim typ354(-1) As Type
EmitLdfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ354(UBound(typ354) + 1)
typ354(UBound(typ354)) = Typ
EmitLdfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ354(UBound(typ354) + 1)
typ354(UBound(typ354)) = Typ
EmitLdfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ354))
Typ = Typ03.GetMethod("Emit", typ354).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdfldIL.Emit(OpCodes.Pop)
End If
EmitLdfldIL.MarkSequencePoint(doc3, 1016, 1, 1016, 100)
EmitLdfldIL.Emit(OpCodes.Ret)
Dim typ355(-1) As Type
ReDim Preserve typ355(UBound(typ355) + 1)
typ355(UBound(typ355)) = GetType(FieldInfo)
Dim EmitLdsfld As MethodBuilder = ILEmitter.DefineMethod("EmitLdsfld", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ355)
Dim EmitLdsfldIL As ILGenerator = EmitLdsfld.GetILGenerator()
Dim EmitLdsfldparam01 As ParameterBuilder = EmitLdsfld.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdsfldIL.MarkSequencePoint(doc3, 1019, 1, 1019, 100)
Dim locbldr61 As LocalBuilder = EmitLdsfldIL.DeclareLocal(GetType(OpCode))
locbldr61.SetLocalSymInfo("lsop")
Dim typ356(-1) As Type
EmitLdsfldIL.Emit(OpCodes.Ldstr, "ldsfld")
Typ = GetType(System.String)
ReDim Preserve typ356(UBound(typ356) + 1)
typ356(UBound(typ356)) = Typ
EmitLdsfldIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ356))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ356).ReturnType
EmitLdsfldIL.Emit(OpCodes.Stloc, 0)
EmitLdsfldIL.MarkSequencePoint(doc3, 1020, 1, 1020, 100)
Dim typ357(-1) As Type
EmitLdsfldIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdsfldIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ357(UBound(typ357) + 1)
typ357(UBound(typ357)) = Typ
EmitLdsfldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ357(UBound(typ357) + 1)
typ357(UBound(typ357)) = Typ
EmitLdsfldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ357))
Typ = Typ03.GetMethod("Emit", typ357).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdsfldIL.Emit(OpCodes.Pop)
End If
EmitLdsfldIL.MarkSequencePoint(doc3, 1021, 1, 1021, 100)
EmitLdsfldIL.Emit(OpCodes.Ret)
Dim typ358(-1) As Type
ReDim Preserve typ358(UBound(typ358) + 1)
typ358(UBound(typ358)) = GetType(FieldInfo)
Dim EmitLdflda As MethodBuilder = ILEmitter.DefineMethod("EmitLdflda", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ358)
Dim EmitLdfldaIL As ILGenerator = EmitLdflda.GetILGenerator()
Dim EmitLdfldaparam01 As ParameterBuilder = EmitLdflda.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdfldaIL.MarkSequencePoint(doc3, 1024, 1, 1024, 100)
Dim locbldr62 As LocalBuilder = EmitLdfldaIL.DeclareLocal(GetType(OpCode))
locbldr62.SetLocalSymInfo("lop")
Dim typ359(-1) As Type
EmitLdfldaIL.Emit(OpCodes.Ldstr, "ldflda")
Typ = GetType(System.String)
ReDim Preserve typ359(UBound(typ359) + 1)
typ359(UBound(typ359)) = Typ
EmitLdfldaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ359))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ359).ReturnType
EmitLdfldaIL.Emit(OpCodes.Stloc, 0)
EmitLdfldaIL.MarkSequencePoint(doc3, 1025, 1, 1025, 100)
Dim typ360(-1) As Type
EmitLdfldaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdfldaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ360(UBound(typ360) + 1)
typ360(UBound(typ360)) = Typ
EmitLdfldaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ360(UBound(typ360) + 1)
typ360(UBound(typ360)) = Typ
EmitLdfldaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ360))
Typ = Typ03.GetMethod("Emit", typ360).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdfldaIL.Emit(OpCodes.Pop)
End If
EmitLdfldaIL.MarkSequencePoint(doc3, 1026, 1, 1026, 100)
EmitLdfldaIL.Emit(OpCodes.Ret)
Dim typ361(-1) As Type
ReDim Preserve typ361(UBound(typ361) + 1)
typ361(UBound(typ361)) = GetType(FieldInfo)
Dim EmitLdsflda As MethodBuilder = ILEmitter.DefineMethod("EmitLdsflda", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ361)
Dim EmitLdsfldaIL As ILGenerator = EmitLdsflda.GetILGenerator()
Dim EmitLdsfldaparam01 As ParameterBuilder = EmitLdsflda.DefineParameter(1, ParameterAttributes.None, "fld")
EmitLdsfldaIL.MarkSequencePoint(doc3, 1029, 1, 1029, 100)
Dim locbldr63 As LocalBuilder = EmitLdsfldaIL.DeclareLocal(GetType(OpCode))
locbldr63.SetLocalSymInfo("lsop")
Dim typ362(-1) As Type
EmitLdsfldaIL.Emit(OpCodes.Ldstr, "ldsflda")
Typ = GetType(System.String)
ReDim Preserve typ362(UBound(typ362) + 1)
typ362(UBound(typ362)) = Typ
EmitLdsfldaIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ362))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ362).ReturnType
EmitLdsfldaIL.Emit(OpCodes.Stloc, 0)
EmitLdsfldaIL.MarkSequencePoint(doc3, 1030, 1, 1030, 100)
Dim typ363(-1) As Type
EmitLdsfldaIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdsfldaIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ363(UBound(typ363) + 1)
typ363(UBound(typ363)) = Typ
EmitLdsfldaIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(FieldInfo)
ReDim Preserve typ363(UBound(typ363) + 1)
typ363(UBound(typ363)) = Typ
EmitLdsfldaIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ363))
Typ = Typ03.GetMethod("Emit", typ363).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdsfldaIL.Emit(OpCodes.Pop)
End If
EmitLdsfldaIL.MarkSequencePoint(doc3, 1031, 1, 1031, 100)
EmitLdsfldaIL.Emit(OpCodes.Ret)
Dim typ364(-1) As Type
ReDim Preserve typ364(UBound(typ364) + 1)
typ364(UBound(typ364)) = GetType(System.String)
Dim EmitLdstr As MethodBuilder = ILEmitter.DefineMethod("EmitLdstr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ364)
Dim EmitLdstrIL As ILGenerator = EmitLdstr.GetILGenerator()
Dim EmitLdstrparam01 As ParameterBuilder = EmitLdstr.DefineParameter(1, ParameterAttributes.None, "str")
EmitLdstrIL.MarkSequencePoint(doc3, 1034, 1, 1034, 100)
Dim locbldr64 As LocalBuilder = EmitLdstrIL.DeclareLocal(GetType(OpCode))
locbldr64.SetLocalSymInfo("lsop")
Dim typ365(-1) As Type
EmitLdstrIL.Emit(OpCodes.Ldstr, "ldstr")
Typ = GetType(System.String)
ReDim Preserve typ365(UBound(typ365) + 1)
typ365(UBound(typ365)) = Typ
EmitLdstrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ365))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ365).ReturnType
EmitLdstrIL.Emit(OpCodes.Stloc, 0)
EmitLdstrIL.MarkSequencePoint(doc3, 1035, 1, 1035, 100)
Dim typ366(-1) As Type
EmitLdstrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdstrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ366(UBound(typ366) + 1)
typ366(UBound(typ366)) = Typ
EmitLdstrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ366(UBound(typ366) + 1)
typ366(UBound(typ366)) = Typ
EmitLdstrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ366))
Typ = Typ03.GetMethod("Emit", typ366).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdstrIL.Emit(OpCodes.Pop)
End If
EmitLdstrIL.MarkSequencePoint(doc3, 1036, 1, 1036, 100)
EmitLdstrIL.Emit(OpCodes.Ret)
Dim typ367(-1) As Type
ReDim Preserve typ367(UBound(typ367) + 1)
typ367(UBound(typ367)) = GetType(System.Boolean)
Dim EmitAdd As MethodBuilder = ILEmitter.DefineMethod("EmitAdd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ367)
Dim EmitAddIL As ILGenerator = EmitAdd.GetILGenerator()
Dim EmitAddparam01 As ParameterBuilder = EmitAdd.DefineParameter(1, ParameterAttributes.None, "s")
EmitAddIL.MarkSequencePoint(doc3, 1039, 1, 1039, 100)
Dim locbldr65 As LocalBuilder = EmitAddIL.DeclareLocal(GetType(OpCode))
locbldr65.SetLocalSymInfo("op")
EmitAddIL.MarkSequencePoint(doc3, 1040, 1, 1040, 100)
EmitAddIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitAddIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa264 As System.Reflection.Emit.Label = EmitAddIL.DefineLabel()
Dim tru264 As System.Reflection.Emit.Label = EmitAddIL.DefineLabel()
Dim cont264 As System.Reflection.Emit.Label = EmitAddIL.DefineLabel()
EmitAddIL.Emit(OpCodes.Beq, tru264)
EmitAddIL.Emit(OpCodes.Br, fa264)
EmitAddIL.MarkLabel(tru264)
EmitAddIL.MarkSequencePoint(doc3, 1041, 1, 1041, 100)
Dim typ368(-1) As Type
EmitAddIL.Emit(OpCodes.Ldstr, "add")
Typ = GetType(System.String)
ReDim Preserve typ368(UBound(typ368) + 1)
typ368(UBound(typ368)) = Typ
EmitAddIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ368))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ368).ReturnType
EmitAddIL.Emit(OpCodes.Stloc, 0)
EmitAddIL.MarkSequencePoint(doc3, 1042, 1, 1042, 100)
Dim typ369(-1) As Type
EmitAddIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitAddIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ369(UBound(typ369) + 1)
typ369(UBound(typ369)) = Typ
EmitAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ369))
Typ = Typ03.GetMethod("Emit", typ369).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitAddIL.Emit(OpCodes.Pop)
End If
EmitAddIL.MarkSequencePoint(doc3, 1043, 1, 1043, 100)
EmitAddIL.Emit(OpCodes.Br, cont264)
EmitAddIL.MarkLabel(fa264)
EmitAddIL.MarkSequencePoint(doc3, 1044, 1, 1044, 100)
Dim typ370(-1) As Type
EmitAddIL.Emit(OpCodes.Ldstr, "add.ovf.un")
Typ = GetType(System.String)
ReDim Preserve typ370(UBound(typ370) + 1)
typ370(UBound(typ370)) = Typ
EmitAddIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ370))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ370).ReturnType
EmitAddIL.Emit(OpCodes.Stloc, 0)
EmitAddIL.MarkSequencePoint(doc3, 1045, 1, 1045, 100)
Dim typ371(-1) As Type
EmitAddIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitAddIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ371(UBound(typ371) + 1)
typ371(UBound(typ371)) = Typ
EmitAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ371))
Typ = Typ03.GetMethod("Emit", typ371).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitAddIL.Emit(OpCodes.Pop)
End If
EmitAddIL.MarkSequencePoint(doc3, 1046, 1, 1046, 100)
EmitAddIL.Emit(OpCodes.Br, cont264)
EmitAddIL.MarkLabel(cont264)
EmitAddIL.MarkSequencePoint(doc3, 1047, 1, 1047, 100)
EmitAddIL.Emit(OpCodes.Ret)
Dim typ372(-1) As Type
ReDim Preserve typ372(UBound(typ372) + 1)
typ372(UBound(typ372)) = GetType(System.Boolean)
Dim EmitDiv As MethodBuilder = ILEmitter.DefineMethod("EmitDiv", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ372)
Dim EmitDivIL As ILGenerator = EmitDiv.GetILGenerator()
Dim EmitDivparam01 As ParameterBuilder = EmitDiv.DefineParameter(1, ParameterAttributes.None, "s")
EmitDivIL.MarkSequencePoint(doc3, 1050, 1, 1050, 100)
Dim locbldr66 As LocalBuilder = EmitDivIL.DeclareLocal(GetType(OpCode))
locbldr66.SetLocalSymInfo("op")
EmitDivIL.MarkSequencePoint(doc3, 1051, 1, 1051, 100)
EmitDivIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitDivIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa265 As System.Reflection.Emit.Label = EmitDivIL.DefineLabel()
Dim tru265 As System.Reflection.Emit.Label = EmitDivIL.DefineLabel()
Dim cont265 As System.Reflection.Emit.Label = EmitDivIL.DefineLabel()
EmitDivIL.Emit(OpCodes.Beq, tru265)
EmitDivIL.Emit(OpCodes.Br, fa265)
EmitDivIL.MarkLabel(tru265)
EmitDivIL.MarkSequencePoint(doc3, 1052, 1, 1052, 100)
Dim typ373(-1) As Type
EmitDivIL.Emit(OpCodes.Ldstr, "div")
Typ = GetType(System.String)
ReDim Preserve typ373(UBound(typ373) + 1)
typ373(UBound(typ373)) = Typ
EmitDivIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ373))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ373).ReturnType
EmitDivIL.Emit(OpCodes.Stloc, 0)
EmitDivIL.MarkSequencePoint(doc3, 1053, 1, 1053, 100)
Dim typ374(-1) As Type
EmitDivIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitDivIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ374(UBound(typ374) + 1)
typ374(UBound(typ374)) = Typ
EmitDivIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ374))
Typ = Typ03.GetMethod("Emit", typ374).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitDivIL.Emit(OpCodes.Pop)
End If
EmitDivIL.MarkSequencePoint(doc3, 1054, 1, 1054, 100)
EmitDivIL.Emit(OpCodes.Br, cont265)
EmitDivIL.MarkLabel(fa265)
EmitDivIL.MarkSequencePoint(doc3, 1055, 1, 1055, 100)
Dim typ375(-1) As Type
EmitDivIL.Emit(OpCodes.Ldstr, "div.un")
Typ = GetType(System.String)
ReDim Preserve typ375(UBound(typ375) + 1)
typ375(UBound(typ375)) = Typ
EmitDivIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ375))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ375).ReturnType
EmitDivIL.Emit(OpCodes.Stloc, 0)
EmitDivIL.MarkSequencePoint(doc3, 1056, 1, 1056, 100)
Dim typ376(-1) As Type
EmitDivIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitDivIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ376(UBound(typ376) + 1)
typ376(UBound(typ376)) = Typ
EmitDivIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ376))
Typ = Typ03.GetMethod("Emit", typ376).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitDivIL.Emit(OpCodes.Pop)
End If
EmitDivIL.MarkSequencePoint(doc3, 1057, 1, 1057, 100)
EmitDivIL.Emit(OpCodes.Br, cont265)
EmitDivIL.MarkLabel(cont265)
EmitDivIL.MarkSequencePoint(doc3, 1058, 1, 1058, 100)
EmitDivIL.Emit(OpCodes.Ret)
Dim typ377(-1) As Type
ReDim Preserve typ377(UBound(typ377) + 1)
typ377(UBound(typ377)) = GetType(System.Boolean)
Dim EmitMul As MethodBuilder = ILEmitter.DefineMethod("EmitMul", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ377)
Dim EmitMulIL As ILGenerator = EmitMul.GetILGenerator()
Dim EmitMulparam01 As ParameterBuilder = EmitMul.DefineParameter(1, ParameterAttributes.None, "s")
EmitMulIL.MarkSequencePoint(doc3, 1061, 1, 1061, 100)
Dim locbldr67 As LocalBuilder = EmitMulIL.DeclareLocal(GetType(OpCode))
locbldr67.SetLocalSymInfo("op")
EmitMulIL.MarkSequencePoint(doc3, 1062, 1, 1062, 100)
EmitMulIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitMulIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa266 As System.Reflection.Emit.Label = EmitMulIL.DefineLabel()
Dim tru266 As System.Reflection.Emit.Label = EmitMulIL.DefineLabel()
Dim cont266 As System.Reflection.Emit.Label = EmitMulIL.DefineLabel()
EmitMulIL.Emit(OpCodes.Beq, tru266)
EmitMulIL.Emit(OpCodes.Br, fa266)
EmitMulIL.MarkLabel(tru266)
EmitMulIL.MarkSequencePoint(doc3, 1063, 1, 1063, 100)
Dim typ378(-1) As Type
EmitMulIL.Emit(OpCodes.Ldstr, "mul")
Typ = GetType(System.String)
ReDim Preserve typ378(UBound(typ378) + 1)
typ378(UBound(typ378)) = Typ
EmitMulIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ378))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ378).ReturnType
EmitMulIL.Emit(OpCodes.Stloc, 0)
EmitMulIL.MarkSequencePoint(doc3, 1064, 1, 1064, 100)
Dim typ379(-1) As Type
EmitMulIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitMulIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ379(UBound(typ379) + 1)
typ379(UBound(typ379)) = Typ
EmitMulIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ379))
Typ = Typ03.GetMethod("Emit", typ379).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitMulIL.Emit(OpCodes.Pop)
End If
EmitMulIL.MarkSequencePoint(doc3, 1065, 1, 1065, 100)
EmitMulIL.Emit(OpCodes.Br, cont266)
EmitMulIL.MarkLabel(fa266)
EmitMulIL.MarkSequencePoint(doc3, 1066, 1, 1066, 100)
Dim typ380(-1) As Type
EmitMulIL.Emit(OpCodes.Ldstr, "mul.ovf.un")
Typ = GetType(System.String)
ReDim Preserve typ380(UBound(typ380) + 1)
typ380(UBound(typ380)) = Typ
EmitMulIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ380))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ380).ReturnType
EmitMulIL.Emit(OpCodes.Stloc, 0)
EmitMulIL.MarkSequencePoint(doc3, 1067, 1, 1067, 100)
Dim typ381(-1) As Type
EmitMulIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitMulIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ381(UBound(typ381) + 1)
typ381(UBound(typ381)) = Typ
EmitMulIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ381))
Typ = Typ03.GetMethod("Emit", typ381).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitMulIL.Emit(OpCodes.Pop)
End If
EmitMulIL.MarkSequencePoint(doc3, 1068, 1, 1068, 100)
EmitMulIL.Emit(OpCodes.Br, cont266)
EmitMulIL.MarkLabel(cont266)
EmitMulIL.MarkSequencePoint(doc3, 1069, 1, 1069, 100)
EmitMulIL.Emit(OpCodes.Ret)
Dim typ382(-1) As Type
ReDim Preserve typ382(UBound(typ382) + 1)
typ382(UBound(typ382)) = GetType(System.Boolean)
Dim EmitSub As MethodBuilder = ILEmitter.DefineMethod("EmitSub", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ382)
Dim EmitSubIL As ILGenerator = EmitSub.GetILGenerator()
Dim EmitSubparam01 As ParameterBuilder = EmitSub.DefineParameter(1, ParameterAttributes.None, "s")
EmitSubIL.MarkSequencePoint(doc3, 1072, 1, 1072, 100)
Dim locbldr68 As LocalBuilder = EmitSubIL.DeclareLocal(GetType(OpCode))
locbldr68.SetLocalSymInfo("op")
EmitSubIL.MarkSequencePoint(doc3, 1073, 1, 1073, 100)
EmitSubIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitSubIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa267 As System.Reflection.Emit.Label = EmitSubIL.DefineLabel()
Dim tru267 As System.Reflection.Emit.Label = EmitSubIL.DefineLabel()
Dim cont267 As System.Reflection.Emit.Label = EmitSubIL.DefineLabel()
EmitSubIL.Emit(OpCodes.Beq, tru267)
EmitSubIL.Emit(OpCodes.Br, fa267)
EmitSubIL.MarkLabel(tru267)
EmitSubIL.MarkSequencePoint(doc3, 1074, 1, 1074, 100)
Dim typ383(-1) As Type
EmitSubIL.Emit(OpCodes.Ldstr, "sub")
Typ = GetType(System.String)
ReDim Preserve typ383(UBound(typ383) + 1)
typ383(UBound(typ383)) = Typ
EmitSubIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ383))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ383).ReturnType
EmitSubIL.Emit(OpCodes.Stloc, 0)
EmitSubIL.MarkSequencePoint(doc3, 1075, 1, 1075, 100)
Dim typ384(-1) As Type
EmitSubIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitSubIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ384(UBound(typ384) + 1)
typ384(UBound(typ384)) = Typ
EmitSubIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ384))
Typ = Typ03.GetMethod("Emit", typ384).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitSubIL.Emit(OpCodes.Pop)
End If
EmitSubIL.MarkSequencePoint(doc3, 1076, 1, 1076, 100)
EmitSubIL.Emit(OpCodes.Br, cont267)
EmitSubIL.MarkLabel(fa267)
EmitSubIL.MarkSequencePoint(doc3, 1077, 1, 1077, 100)
Dim typ385(-1) As Type
EmitSubIL.Emit(OpCodes.Ldstr, "sub.ovf.un")
Typ = GetType(System.String)
ReDim Preserve typ385(UBound(typ385) + 1)
typ385(UBound(typ385)) = Typ
EmitSubIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ385))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ385).ReturnType
EmitSubIL.Emit(OpCodes.Stloc, 0)
EmitSubIL.MarkSequencePoint(doc3, 1078, 1, 1078, 100)
Dim typ386(-1) As Type
EmitSubIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitSubIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ386(UBound(typ386) + 1)
typ386(UBound(typ386)) = Typ
EmitSubIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ386))
Typ = Typ03.GetMethod("Emit", typ386).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitSubIL.Emit(OpCodes.Pop)
End If
EmitSubIL.MarkSequencePoint(doc3, 1079, 1, 1079, 100)
EmitSubIL.Emit(OpCodes.Br, cont267)
EmitSubIL.MarkLabel(cont267)
EmitSubIL.MarkSequencePoint(doc3, 1080, 1, 1080, 100)
EmitSubIL.Emit(OpCodes.Ret)
Dim typ387(-1) As Type
ReDim Preserve typ387(UBound(typ387) + 1)
typ387(UBound(typ387)) = GetType(System.Boolean)
Dim EmitRem As MethodBuilder = ILEmitter.DefineMethod("EmitRem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ387)
Dim EmitRemIL As ILGenerator = EmitRem.GetILGenerator()
Dim EmitRemparam01 As ParameterBuilder = EmitRem.DefineParameter(1, ParameterAttributes.None, "s")
EmitRemIL.MarkSequencePoint(doc3, 1083, 1, 1083, 100)
Dim locbldr69 As LocalBuilder = EmitRemIL.DeclareLocal(GetType(OpCode))
locbldr69.SetLocalSymInfo("op")
EmitRemIL.MarkSequencePoint(doc3, 1084, 1, 1084, 100)
EmitRemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitRemIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa268 As System.Reflection.Emit.Label = EmitRemIL.DefineLabel()
Dim tru268 As System.Reflection.Emit.Label = EmitRemIL.DefineLabel()
Dim cont268 As System.Reflection.Emit.Label = EmitRemIL.DefineLabel()
EmitRemIL.Emit(OpCodes.Beq, tru268)
EmitRemIL.Emit(OpCodes.Br, fa268)
EmitRemIL.MarkLabel(tru268)
EmitRemIL.MarkSequencePoint(doc3, 1085, 1, 1085, 100)
Dim typ388(-1) As Type
EmitRemIL.Emit(OpCodes.Ldstr, "rem")
Typ = GetType(System.String)
ReDim Preserve typ388(UBound(typ388) + 1)
typ388(UBound(typ388)) = Typ
EmitRemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ388))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ388).ReturnType
EmitRemIL.Emit(OpCodes.Stloc, 0)
EmitRemIL.MarkSequencePoint(doc3, 1086, 1, 1086, 100)
Dim typ389(-1) As Type
EmitRemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitRemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ389(UBound(typ389) + 1)
typ389(UBound(typ389)) = Typ
EmitRemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ389))
Typ = Typ03.GetMethod("Emit", typ389).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitRemIL.Emit(OpCodes.Pop)
End If
EmitRemIL.MarkSequencePoint(doc3, 1087, 1, 1087, 100)
EmitRemIL.Emit(OpCodes.Br, cont268)
EmitRemIL.MarkLabel(fa268)
EmitRemIL.MarkSequencePoint(doc3, 1088, 1, 1088, 100)
Dim typ390(-1) As Type
EmitRemIL.Emit(OpCodes.Ldstr, "rem.un")
Typ = GetType(System.String)
ReDim Preserve typ390(UBound(typ390) + 1)
typ390(UBound(typ390)) = Typ
EmitRemIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ390))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ390).ReturnType
EmitRemIL.Emit(OpCodes.Stloc, 0)
EmitRemIL.MarkSequencePoint(doc3, 1089, 1, 1089, 100)
Dim typ391(-1) As Type
EmitRemIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitRemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ391(UBound(typ391) + 1)
typ391(UBound(typ391)) = Typ
EmitRemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ391))
Typ = Typ03.GetMethod("Emit", typ391).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitRemIL.Emit(OpCodes.Pop)
End If
EmitRemIL.MarkSequencePoint(doc3, 1090, 1, 1090, 100)
EmitRemIL.Emit(OpCodes.Br, cont268)
EmitRemIL.MarkLabel(cont268)
EmitRemIL.MarkSequencePoint(doc3, 1091, 1, 1091, 100)
EmitRemIL.Emit(OpCodes.Ret)
Dim EmitShl As MethodBuilder = ILEmitter.DefineMethod("EmitShl", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitShlIL As ILGenerator = EmitShl.GetILGenerator()
EmitShlIL.MarkSequencePoint(doc3, 1094, 1, 1094, 100)
Dim locbldr70 As LocalBuilder = EmitShlIL.DeclareLocal(GetType(OpCode))
locbldr70.SetLocalSymInfo("op")
EmitShlIL.MarkSequencePoint(doc3, 1095, 1, 1095, 100)
Dim typ392(-1) As Type
EmitShlIL.Emit(OpCodes.Ldstr, "shl")
Typ = GetType(System.String)
ReDim Preserve typ392(UBound(typ392) + 1)
typ392(UBound(typ392)) = Typ
EmitShlIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ392))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ392).ReturnType
EmitShlIL.Emit(OpCodes.Stloc, 0)
EmitShlIL.MarkSequencePoint(doc3, 1096, 1, 1096, 100)
Dim typ393(-1) As Type
EmitShlIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitShlIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ393(UBound(typ393) + 1)
typ393(UBound(typ393)) = Typ
EmitShlIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ393))
Typ = Typ03.GetMethod("Emit", typ393).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitShlIL.Emit(OpCodes.Pop)
End If
EmitShlIL.MarkSequencePoint(doc3, 1097, 1, 1097, 100)
EmitShlIL.Emit(OpCodes.Ret)
Dim typ394(-1) As Type
ReDim Preserve typ394(UBound(typ394) + 1)
typ394(UBound(typ394)) = GetType(System.Boolean)
Dim EmitShr As MethodBuilder = ILEmitter.DefineMethod("EmitShr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ394)
Dim EmitShrIL As ILGenerator = EmitShr.GetILGenerator()
Dim EmitShrparam01 As ParameterBuilder = EmitShr.DefineParameter(1, ParameterAttributes.None, "s")
EmitShrIL.MarkSequencePoint(doc3, 1100, 1, 1100, 100)
Dim locbldr71 As LocalBuilder = EmitShrIL.DeclareLocal(GetType(OpCode))
locbldr71.SetLocalSymInfo("op")
EmitShrIL.MarkSequencePoint(doc3, 1101, 1, 1101, 100)
EmitShrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitShrIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa269 As System.Reflection.Emit.Label = EmitShrIL.DefineLabel()
Dim tru269 As System.Reflection.Emit.Label = EmitShrIL.DefineLabel()
Dim cont269 As System.Reflection.Emit.Label = EmitShrIL.DefineLabel()
EmitShrIL.Emit(OpCodes.Beq, tru269)
EmitShrIL.Emit(OpCodes.Br, fa269)
EmitShrIL.MarkLabel(tru269)
EmitShrIL.MarkSequencePoint(doc3, 1102, 1, 1102, 100)
Dim typ395(-1) As Type
EmitShrIL.Emit(OpCodes.Ldstr, "shr")
Typ = GetType(System.String)
ReDim Preserve typ395(UBound(typ395) + 1)
typ395(UBound(typ395)) = Typ
EmitShrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ395))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ395).ReturnType
EmitShrIL.Emit(OpCodes.Stloc, 0)
EmitShrIL.MarkSequencePoint(doc3, 1103, 1, 1103, 100)
Dim typ396(-1) As Type
EmitShrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitShrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ396(UBound(typ396) + 1)
typ396(UBound(typ396)) = Typ
EmitShrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ396))
Typ = Typ03.GetMethod("Emit", typ396).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitShrIL.Emit(OpCodes.Pop)
End If
EmitShrIL.MarkSequencePoint(doc3, 1104, 1, 1104, 100)
EmitShrIL.Emit(OpCodes.Br, cont269)
EmitShrIL.MarkLabel(fa269)
EmitShrIL.MarkSequencePoint(doc3, 1105, 1, 1105, 100)
Dim typ397(-1) As Type
EmitShrIL.Emit(OpCodes.Ldstr, "shr.un")
Typ = GetType(System.String)
ReDim Preserve typ397(UBound(typ397) + 1)
typ397(UBound(typ397)) = Typ
EmitShrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ397))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ397).ReturnType
EmitShrIL.Emit(OpCodes.Stloc, 0)
EmitShrIL.MarkSequencePoint(doc3, 1106, 1, 1106, 100)
Dim typ398(-1) As Type
EmitShrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitShrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ398(UBound(typ398) + 1)
typ398(UBound(typ398)) = Typ
EmitShrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ398))
Typ = Typ03.GetMethod("Emit", typ398).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitShrIL.Emit(OpCodes.Pop)
End If
EmitShrIL.MarkSequencePoint(doc3, 1107, 1, 1107, 100)
EmitShrIL.Emit(OpCodes.Br, cont269)
EmitShrIL.MarkLabel(cont269)
EmitShrIL.MarkSequencePoint(doc3, 1108, 1, 1108, 100)
EmitShrIL.Emit(OpCodes.Ret)
Dim EmitAnd As MethodBuilder = ILEmitter.DefineMethod("EmitAnd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitAndIL As ILGenerator = EmitAnd.GetILGenerator()
EmitAndIL.MarkSequencePoint(doc3, 1111, 1, 1111, 100)
Dim locbldr72 As LocalBuilder = EmitAndIL.DeclareLocal(GetType(OpCode))
locbldr72.SetLocalSymInfo("op")
EmitAndIL.MarkSequencePoint(doc3, 1112, 1, 1112, 100)
Dim typ399(-1) As Type
EmitAndIL.Emit(OpCodes.Ldstr, "and")
Typ = GetType(System.String)
ReDim Preserve typ399(UBound(typ399) + 1)
typ399(UBound(typ399)) = Typ
EmitAndIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ399))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ399).ReturnType
EmitAndIL.Emit(OpCodes.Stloc, 0)
EmitAndIL.MarkSequencePoint(doc3, 1113, 1, 1113, 100)
Dim typ400(-1) As Type
EmitAndIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitAndIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ400(UBound(typ400) + 1)
typ400(UBound(typ400)) = Typ
EmitAndIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ400))
Typ = Typ03.GetMethod("Emit", typ400).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitAndIL.Emit(OpCodes.Pop)
End If
EmitAndIL.MarkSequencePoint(doc3, 1114, 1, 1114, 100)
EmitAndIL.Emit(OpCodes.Ret)
Dim EmitOr As MethodBuilder = ILEmitter.DefineMethod("EmitOr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitOrIL As ILGenerator = EmitOr.GetILGenerator()
EmitOrIL.MarkSequencePoint(doc3, 1117, 1, 1117, 100)
Dim locbldr73 As LocalBuilder = EmitOrIL.DeclareLocal(GetType(OpCode))
locbldr73.SetLocalSymInfo("op")
EmitOrIL.MarkSequencePoint(doc3, 1118, 1, 1118, 100)
Dim typ401(-1) As Type
EmitOrIL.Emit(OpCodes.Ldstr, "or")
Typ = GetType(System.String)
ReDim Preserve typ401(UBound(typ401) + 1)
typ401(UBound(typ401)) = Typ
EmitOrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ401))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ401).ReturnType
EmitOrIL.Emit(OpCodes.Stloc, 0)
EmitOrIL.MarkSequencePoint(doc3, 1119, 1, 1119, 100)
Dim typ402(-1) As Type
EmitOrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitOrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ402(UBound(typ402) + 1)
typ402(UBound(typ402)) = Typ
EmitOrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ402))
Typ = Typ03.GetMethod("Emit", typ402).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitOrIL.Emit(OpCodes.Pop)
End If
EmitOrIL.MarkSequencePoint(doc3, 1120, 1, 1120, 100)
EmitOrIL.Emit(OpCodes.Ret)
Dim EmitXor As MethodBuilder = ILEmitter.DefineMethod("EmitXor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitXorIL As ILGenerator = EmitXor.GetILGenerator()
EmitXorIL.MarkSequencePoint(doc3, 1123, 1, 1123, 100)
Dim locbldr74 As LocalBuilder = EmitXorIL.DeclareLocal(GetType(OpCode))
locbldr74.SetLocalSymInfo("op")
EmitXorIL.MarkSequencePoint(doc3, 1124, 1, 1124, 100)
Dim typ403(-1) As Type
EmitXorIL.Emit(OpCodes.Ldstr, "xor")
Typ = GetType(System.String)
ReDim Preserve typ403(UBound(typ403) + 1)
typ403(UBound(typ403)) = Typ
EmitXorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ403))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ403).ReturnType
EmitXorIL.Emit(OpCodes.Stloc, 0)
EmitXorIL.MarkSequencePoint(doc3, 1125, 1, 1125, 100)
Dim typ404(-1) As Type
EmitXorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitXorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ404(UBound(typ404) + 1)
typ404(UBound(typ404)) = Typ
EmitXorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ404))
Typ = Typ03.GetMethod("Emit", typ404).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitXorIL.Emit(OpCodes.Pop)
End If
EmitXorIL.MarkSequencePoint(doc3, 1126, 1, 1126, 100)
EmitXorIL.Emit(OpCodes.Ret)
Dim EmitNot As MethodBuilder = ILEmitter.DefineMethod("EmitNot", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNotIL As ILGenerator = EmitNot.GetILGenerator()
EmitNotIL.MarkSequencePoint(doc3, 1129, 1, 1129, 100)
Dim locbldr75 As LocalBuilder = EmitNotIL.DeclareLocal(GetType(OpCode))
locbldr75.SetLocalSymInfo("op")
EmitNotIL.MarkSequencePoint(doc3, 1130, 1, 1130, 100)
Dim typ405(-1) As Type
EmitNotIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ405(UBound(typ405) + 1)
typ405(UBound(typ405)) = Typ
EmitNotIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ405))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ405).ReturnType
EmitNotIL.Emit(OpCodes.Stloc, 0)
EmitNotIL.MarkSequencePoint(doc3, 1131, 1, 1131, 100)
Dim typ406(-1) As Type
EmitNotIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNotIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ406(UBound(typ406) + 1)
typ406(UBound(typ406)) = Typ
EmitNotIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ406))
Typ = Typ03.GetMethod("Emit", typ406).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNotIL.Emit(OpCodes.Pop)
End If
EmitNotIL.MarkSequencePoint(doc3, 1132, 1, 1132, 100)
Dim typ407(-1) As Type
EmitNotIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ407(UBound(typ407) + 1)
typ407(UBound(typ407)) = Typ
EmitNotIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ407))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ407).ReturnType
EmitNotIL.Emit(OpCodes.Stloc, 0)
EmitNotIL.MarkSequencePoint(doc3, 1133, 1, 1133, 100)
Dim typ408(-1) As Type
EmitNotIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNotIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ408(UBound(typ408) + 1)
typ408(UBound(typ408)) = Typ
EmitNotIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ408))
Typ = Typ03.GetMethod("Emit", typ408).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNotIL.Emit(OpCodes.Pop)
End If
EmitNotIL.MarkSequencePoint(doc3, 1134, 1, 1134, 100)
EmitNotIL.Emit(OpCodes.Ret)
Dim EmitNeg As MethodBuilder = ILEmitter.DefineMethod("EmitNeg", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNegIL As ILGenerator = EmitNeg.GetILGenerator()
EmitNegIL.MarkSequencePoint(doc3, 1137, 1, 1137, 100)
Dim locbldr76 As LocalBuilder = EmitNegIL.DeclareLocal(GetType(OpCode))
locbldr76.SetLocalSymInfo("op")
EmitNegIL.MarkSequencePoint(doc3, 1138, 1, 1138, 100)
Dim typ409(-1) As Type
EmitNegIL.Emit(OpCodes.Ldstr, "neg")
Typ = GetType(System.String)
ReDim Preserve typ409(UBound(typ409) + 1)
typ409(UBound(typ409)) = Typ
EmitNegIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ409))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ409).ReturnType
EmitNegIL.Emit(OpCodes.Stloc, 0)
EmitNegIL.MarkSequencePoint(doc3, 1139, 1, 1139, 100)
Dim typ410(-1) As Type
EmitNegIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNegIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ410(UBound(typ410) + 1)
typ410(UBound(typ410)) = Typ
EmitNegIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ410))
Typ = Typ03.GetMethod("Emit", typ410).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNegIL.Emit(OpCodes.Pop)
End If
EmitNegIL.MarkSequencePoint(doc3, 1140, 1, 1140, 100)
EmitNegIL.Emit(OpCodes.Ret)
Dim EmitNand As MethodBuilder = ILEmitter.DefineMethod("EmitNand", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNandIL As ILGenerator = EmitNand.GetILGenerator()
EmitNandIL.MarkSequencePoint(doc3, 1143, 1, 1143, 100)
Dim locbldr77 As LocalBuilder = EmitNandIL.DeclareLocal(GetType(OpCode))
locbldr77.SetLocalSymInfo("op")
EmitNandIL.MarkSequencePoint(doc3, 1144, 1, 1144, 100)
Dim typ411(-1) As Type
EmitNandIL.Emit(OpCodes.Ldstr, "and")
Typ = GetType(System.String)
ReDim Preserve typ411(UBound(typ411) + 1)
typ411(UBound(typ411)) = Typ
EmitNandIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ411))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ411).ReturnType
EmitNandIL.Emit(OpCodes.Stloc, 0)
EmitNandIL.MarkSequencePoint(doc3, 1145, 1, 1145, 100)
Dim typ412(-1) As Type
EmitNandIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNandIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ412(UBound(typ412) + 1)
typ412(UBound(typ412)) = Typ
EmitNandIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ412))
Typ = Typ03.GetMethod("Emit", typ412).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNandIL.Emit(OpCodes.Pop)
End If
EmitNandIL.MarkSequencePoint(doc3, 1146, 1, 1146, 100)
Dim typ413(-1) As Type
EmitNandIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ413(UBound(typ413) + 1)
typ413(UBound(typ413)) = Typ
EmitNandIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ413))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ413).ReturnType
EmitNandIL.Emit(OpCodes.Stloc, 0)
EmitNandIL.MarkSequencePoint(doc3, 1147, 1, 1147, 100)
Dim typ414(-1) As Type
EmitNandIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNandIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ414(UBound(typ414) + 1)
typ414(UBound(typ414)) = Typ
EmitNandIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ414))
Typ = Typ03.GetMethod("Emit", typ414).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNandIL.Emit(OpCodes.Pop)
End If
EmitNandIL.MarkSequencePoint(doc3, 1148, 1, 1148, 100)
Dim typ415(-1) As Type
EmitNandIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ415(UBound(typ415) + 1)
typ415(UBound(typ415)) = Typ
EmitNandIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ415))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ415).ReturnType
EmitNandIL.Emit(OpCodes.Stloc, 0)
EmitNandIL.MarkSequencePoint(doc3, 1149, 1, 1149, 100)
Dim typ416(-1) As Type
EmitNandIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNandIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ416(UBound(typ416) + 1)
typ416(UBound(typ416)) = Typ
EmitNandIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ416))
Typ = Typ03.GetMethod("Emit", typ416).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNandIL.Emit(OpCodes.Pop)
End If
EmitNandIL.MarkSequencePoint(doc3, 1150, 1, 1150, 100)
EmitNandIL.Emit(OpCodes.Ret)
Dim EmitNor As MethodBuilder = ILEmitter.DefineMethod("EmitNor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNorIL As ILGenerator = EmitNor.GetILGenerator()
EmitNorIL.MarkSequencePoint(doc3, 1153, 1, 1153, 100)
Dim locbldr78 As LocalBuilder = EmitNorIL.DeclareLocal(GetType(OpCode))
locbldr78.SetLocalSymInfo("op")
EmitNorIL.MarkSequencePoint(doc3, 1154, 1, 1154, 100)
Dim typ417(-1) As Type
EmitNorIL.Emit(OpCodes.Ldstr, "or")
Typ = GetType(System.String)
ReDim Preserve typ417(UBound(typ417) + 1)
typ417(UBound(typ417)) = Typ
EmitNorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ417))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ417).ReturnType
EmitNorIL.Emit(OpCodes.Stloc, 0)
EmitNorIL.MarkSequencePoint(doc3, 1155, 1, 1155, 100)
Dim typ418(-1) As Type
EmitNorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ418(UBound(typ418) + 1)
typ418(UBound(typ418)) = Typ
EmitNorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ418))
Typ = Typ03.GetMethod("Emit", typ418).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNorIL.Emit(OpCodes.Pop)
End If
EmitNorIL.MarkSequencePoint(doc3, 1156, 1, 1156, 100)
Dim typ419(-1) As Type
EmitNorIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ419(UBound(typ419) + 1)
typ419(UBound(typ419)) = Typ
EmitNorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ419))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ419).ReturnType
EmitNorIL.Emit(OpCodes.Stloc, 0)
EmitNorIL.MarkSequencePoint(doc3, 1157, 1, 1157, 100)
Dim typ420(-1) As Type
EmitNorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ420(UBound(typ420) + 1)
typ420(UBound(typ420)) = Typ
EmitNorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ420))
Typ = Typ03.GetMethod("Emit", typ420).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNorIL.Emit(OpCodes.Pop)
End If
EmitNorIL.MarkSequencePoint(doc3, 1158, 1, 1158, 100)
Dim typ421(-1) As Type
EmitNorIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ421(UBound(typ421) + 1)
typ421(UBound(typ421)) = Typ
EmitNorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ421))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ421).ReturnType
EmitNorIL.Emit(OpCodes.Stloc, 0)
EmitNorIL.MarkSequencePoint(doc3, 1159, 1, 1159, 100)
Dim typ422(-1) As Type
EmitNorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ422(UBound(typ422) + 1)
typ422(UBound(typ422)) = Typ
EmitNorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ422))
Typ = Typ03.GetMethod("Emit", typ422).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNorIL.Emit(OpCodes.Pop)
End If
EmitNorIL.MarkSequencePoint(doc3, 1160, 1, 1160, 100)
EmitNorIL.Emit(OpCodes.Ret)
Dim EmitXnor As MethodBuilder = ILEmitter.DefineMethod("EmitXnor", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitXnorIL As ILGenerator = EmitXnor.GetILGenerator()
EmitXnorIL.MarkSequencePoint(doc3, 1163, 1, 1163, 100)
Dim locbldr79 As LocalBuilder = EmitXnorIL.DeclareLocal(GetType(OpCode))
locbldr79.SetLocalSymInfo("op")
EmitXnorIL.MarkSequencePoint(doc3, 1164, 1, 1164, 100)
Dim typ423(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldstr, "xor")
Typ = GetType(System.String)
ReDim Preserve typ423(UBound(typ423) + 1)
typ423(UBound(typ423)) = Typ
EmitXnorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ423))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ423).ReturnType
EmitXnorIL.Emit(OpCodes.Stloc, 0)
EmitXnorIL.MarkSequencePoint(doc3, 1165, 1, 1165, 100)
Dim typ424(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitXnorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ424(UBound(typ424) + 1)
typ424(UBound(typ424)) = Typ
EmitXnorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ424))
Typ = Typ03.GetMethod("Emit", typ424).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitXnorIL.Emit(OpCodes.Pop)
End If
EmitXnorIL.MarkSequencePoint(doc3, 1166, 1, 1166, 100)
Dim typ425(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldstr, "not")
Typ = GetType(System.String)
ReDim Preserve typ425(UBound(typ425) + 1)
typ425(UBound(typ425)) = Typ
EmitXnorIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ425))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ425).ReturnType
EmitXnorIL.Emit(OpCodes.Stloc, 0)
EmitXnorIL.MarkSequencePoint(doc3, 1167, 1, 1167, 100)
Dim typ426(-1) As Type
EmitXnorIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitXnorIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ426(UBound(typ426) + 1)
typ426(UBound(typ426)) = Typ
EmitXnorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ426))
Typ = Typ03.GetMethod("Emit", typ426).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitXnorIL.Emit(OpCodes.Pop)
End If
EmitXnorIL.MarkSequencePoint(doc3, 1168, 1, 1168, 100)
EmitXnorIL.Emit(OpCodes.Ret)
Dim EmitCeq As MethodBuilder = ILEmitter.DefineMethod("EmitCeq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitCeqIL As ILGenerator = EmitCeq.GetILGenerator()
EmitCeqIL.MarkSequencePoint(doc3, 1171, 1, 1171, 100)
Dim locbldr80 As LocalBuilder = EmitCeqIL.DeclareLocal(GetType(OpCode))
locbldr80.SetLocalSymInfo("op")
EmitCeqIL.MarkSequencePoint(doc3, 1172, 1, 1172, 100)
Dim typ427(-1) As Type
EmitCeqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ427(UBound(typ427) + 1)
typ427(UBound(typ427)) = Typ
EmitCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ427))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ427).ReturnType
EmitCeqIL.Emit(OpCodes.Stloc, 0)
EmitCeqIL.MarkSequencePoint(doc3, 1173, 1, 1173, 100)
Dim typ428(-1) As Type
EmitCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ428(UBound(typ428) + 1)
typ428(UBound(typ428)) = Typ
EmitCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ428))
Typ = Typ03.GetMethod("Emit", typ428).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCeqIL.Emit(OpCodes.Pop)
End If
EmitCeqIL.MarkSequencePoint(doc3, 1174, 1, 1174, 100)
EmitCeqIL.Emit(OpCodes.Ret)
Dim EmitCneq As MethodBuilder = ILEmitter.DefineMethod("EmitCneq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitCneqIL As ILGenerator = EmitCneq.GetILGenerator()
EmitCneqIL.MarkSequencePoint(doc3, 1177, 1, 1177, 100)
Dim locbldr81 As LocalBuilder = EmitCneqIL.DeclareLocal(GetType(OpCode))
locbldr81.SetLocalSymInfo("op")
EmitCneqIL.MarkSequencePoint(doc3, 1178, 1, 1178, 100)
Dim typ429(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ429(UBound(typ429) + 1)
typ429(UBound(typ429)) = Typ
EmitCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ429))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ429).ReturnType
EmitCneqIL.Emit(OpCodes.Stloc, 0)
EmitCneqIL.MarkSequencePoint(doc3, 1179, 1, 1179, 100)
Dim typ430(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ430(UBound(typ430) + 1)
typ430(UBound(typ430)) = Typ
EmitCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ430))
Typ = Typ03.GetMethod("Emit", typ430).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCneqIL.Emit(OpCodes.Pop)
End If
EmitCneqIL.MarkSequencePoint(doc3, 1180, 1, 1180, 100)
Dim typ431(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ431(UBound(typ431) + 1)
typ431(UBound(typ431)) = Typ
EmitCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ431))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ431).ReturnType
EmitCneqIL.Emit(OpCodes.Stloc, 0)
EmitCneqIL.MarkSequencePoint(doc3, 1181, 1, 1181, 100)
Dim typ432(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ432(UBound(typ432) + 1)
typ432(UBound(typ432)) = Typ
EmitCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ432))
Typ = Typ03.GetMethod("Emit", typ432).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCneqIL.Emit(OpCodes.Pop)
End If
EmitCneqIL.MarkSequencePoint(doc3, 1182, 1, 1182, 100)
Dim typ433(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ433(UBound(typ433) + 1)
typ433(UBound(typ433)) = Typ
EmitCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ433))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ433).ReturnType
EmitCneqIL.Emit(OpCodes.Stloc, 0)
EmitCneqIL.MarkSequencePoint(doc3, 1183, 1, 1183, 100)
Dim typ434(-1) As Type
EmitCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ434(UBound(typ434) + 1)
typ434(UBound(typ434)) = Typ
EmitCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ434))
Typ = Typ03.GetMethod("Emit", typ434).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCneqIL.Emit(OpCodes.Pop)
End If
EmitCneqIL.MarkSequencePoint(doc3, 1184, 1, 1184, 100)
EmitCneqIL.Emit(OpCodes.Ret)
Dim typ435(-1) As Type
ReDim Preserve typ435(UBound(typ435) + 1)
typ435(UBound(typ435)) = GetType(System.Boolean)
Dim EmitCgt As MethodBuilder = ILEmitter.DefineMethod("EmitCgt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ435)
Dim EmitCgtIL As ILGenerator = EmitCgt.GetILGenerator()
Dim EmitCgtparam01 As ParameterBuilder = EmitCgt.DefineParameter(1, ParameterAttributes.None, "s")
EmitCgtIL.MarkSequencePoint(doc3, 1187, 1, 1187, 100)
Dim locbldr82 As LocalBuilder = EmitCgtIL.DeclareLocal(GetType(OpCode))
locbldr82.SetLocalSymInfo("op")
EmitCgtIL.MarkSequencePoint(doc3, 1188, 1, 1188, 100)
EmitCgtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCgtIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa270 As System.Reflection.Emit.Label = EmitCgtIL.DefineLabel()
Dim tru270 As System.Reflection.Emit.Label = EmitCgtIL.DefineLabel()
Dim cont270 As System.Reflection.Emit.Label = EmitCgtIL.DefineLabel()
EmitCgtIL.Emit(OpCodes.Beq, tru270)
EmitCgtIL.Emit(OpCodes.Br, fa270)
EmitCgtIL.MarkLabel(tru270)
EmitCgtIL.MarkSequencePoint(doc3, 1189, 1, 1189, 100)
Dim typ436(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldstr, "cgt")
Typ = GetType(System.String)
ReDim Preserve typ436(UBound(typ436) + 1)
typ436(UBound(typ436)) = Typ
EmitCgtIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ436))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ436).ReturnType
EmitCgtIL.Emit(OpCodes.Stloc, 0)
EmitCgtIL.MarkSequencePoint(doc3, 1190, 1, 1190, 100)
Dim typ437(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgtIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ437(UBound(typ437) + 1)
typ437(UBound(typ437)) = Typ
EmitCgtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ437))
Typ = Typ03.GetMethod("Emit", typ437).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgtIL.Emit(OpCodes.Pop)
End If
EmitCgtIL.MarkSequencePoint(doc3, 1191, 1, 1191, 100)
EmitCgtIL.Emit(OpCodes.Br, cont270)
EmitCgtIL.MarkLabel(fa270)
EmitCgtIL.MarkSequencePoint(doc3, 1192, 1, 1192, 100)
Dim typ438(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldstr, "cgt.un")
Typ = GetType(System.String)
ReDim Preserve typ438(UBound(typ438) + 1)
typ438(UBound(typ438)) = Typ
EmitCgtIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ438))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ438).ReturnType
EmitCgtIL.Emit(OpCodes.Stloc, 0)
EmitCgtIL.MarkSequencePoint(doc3, 1193, 1, 1193, 100)
Dim typ439(-1) As Type
EmitCgtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgtIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ439(UBound(typ439) + 1)
typ439(UBound(typ439)) = Typ
EmitCgtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ439))
Typ = Typ03.GetMethod("Emit", typ439).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgtIL.Emit(OpCodes.Pop)
End If
EmitCgtIL.MarkSequencePoint(doc3, 1194, 1, 1194, 100)
EmitCgtIL.Emit(OpCodes.Br, cont270)
EmitCgtIL.MarkLabel(cont270)
EmitCgtIL.MarkSequencePoint(doc3, 1195, 1, 1195, 100)
EmitCgtIL.Emit(OpCodes.Ret)
Dim typ440(-1) As Type
ReDim Preserve typ440(UBound(typ440) + 1)
typ440(UBound(typ440)) = GetType(System.Boolean)
Dim EmitClt As MethodBuilder = ILEmitter.DefineMethod("EmitClt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ440)
Dim EmitCltIL As ILGenerator = EmitClt.GetILGenerator()
Dim EmitCltparam01 As ParameterBuilder = EmitClt.DefineParameter(1, ParameterAttributes.None, "s")
EmitCltIL.MarkSequencePoint(doc3, 1198, 1, 1198, 100)
Dim locbldr83 As LocalBuilder = EmitCltIL.DeclareLocal(GetType(OpCode))
locbldr83.SetLocalSymInfo("op")
EmitCltIL.MarkSequencePoint(doc3, 1199, 1, 1199, 100)
EmitCltIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCltIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa271 As System.Reflection.Emit.Label = EmitCltIL.DefineLabel()
Dim tru271 As System.Reflection.Emit.Label = EmitCltIL.DefineLabel()
Dim cont271 As System.Reflection.Emit.Label = EmitCltIL.DefineLabel()
EmitCltIL.Emit(OpCodes.Beq, tru271)
EmitCltIL.Emit(OpCodes.Br, fa271)
EmitCltIL.MarkLabel(tru271)
EmitCltIL.MarkSequencePoint(doc3, 1200, 1, 1200, 100)
Dim typ441(-1) As Type
EmitCltIL.Emit(OpCodes.Ldstr, "clt")
Typ = GetType(System.String)
ReDim Preserve typ441(UBound(typ441) + 1)
typ441(UBound(typ441)) = Typ
EmitCltIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ441))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ441).ReturnType
EmitCltIL.Emit(OpCodes.Stloc, 0)
EmitCltIL.MarkSequencePoint(doc3, 1201, 1, 1201, 100)
Dim typ442(-1) As Type
EmitCltIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCltIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ442(UBound(typ442) + 1)
typ442(UBound(typ442)) = Typ
EmitCltIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ442))
Typ = Typ03.GetMethod("Emit", typ442).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCltIL.Emit(OpCodes.Pop)
End If
EmitCltIL.MarkSequencePoint(doc3, 1202, 1, 1202, 100)
EmitCltIL.Emit(OpCodes.Br, cont271)
EmitCltIL.MarkLabel(fa271)
EmitCltIL.MarkSequencePoint(doc3, 1203, 1, 1203, 100)
Dim typ443(-1) As Type
EmitCltIL.Emit(OpCodes.Ldstr, "clt.un")
Typ = GetType(System.String)
ReDim Preserve typ443(UBound(typ443) + 1)
typ443(UBound(typ443)) = Typ
EmitCltIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ443))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ443).ReturnType
EmitCltIL.Emit(OpCodes.Stloc, 0)
EmitCltIL.MarkSequencePoint(doc3, 1204, 1, 1204, 100)
Dim typ444(-1) As Type
EmitCltIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCltIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ444(UBound(typ444) + 1)
typ444(UBound(typ444)) = Typ
EmitCltIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ444))
Typ = Typ03.GetMethod("Emit", typ444).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCltIL.Emit(OpCodes.Pop)
End If
EmitCltIL.MarkSequencePoint(doc3, 1205, 1, 1205, 100)
EmitCltIL.Emit(OpCodes.Br, cont271)
EmitCltIL.MarkLabel(cont271)
EmitCltIL.MarkSequencePoint(doc3, 1206, 1, 1206, 100)
EmitCltIL.Emit(OpCodes.Ret)
Dim typ445(-1) As Type
ReDim Preserve typ445(UBound(typ445) + 1)
typ445(UBound(typ445)) = GetType(System.Boolean)
Dim EmitCle As MethodBuilder = ILEmitter.DefineMethod("EmitCle", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ445)
Dim EmitCleIL As ILGenerator = EmitCle.GetILGenerator()
Dim EmitCleparam01 As ParameterBuilder = EmitCle.DefineParameter(1, ParameterAttributes.None, "s")
EmitCleIL.MarkSequencePoint(doc3, 1209, 1, 1209, 100)
Dim locbldr84 As LocalBuilder = EmitCleIL.DeclareLocal(GetType(OpCode))
locbldr84.SetLocalSymInfo("op")
EmitCleIL.MarkSequencePoint(doc3, 1210, 1, 1210, 100)
EmitCleIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCleIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa272 As System.Reflection.Emit.Label = EmitCleIL.DefineLabel()
Dim tru272 As System.Reflection.Emit.Label = EmitCleIL.DefineLabel()
Dim cont272 As System.Reflection.Emit.Label = EmitCleIL.DefineLabel()
EmitCleIL.Emit(OpCodes.Beq, tru272)
EmitCleIL.Emit(OpCodes.Br, fa272)
EmitCleIL.MarkLabel(tru272)
EmitCleIL.MarkSequencePoint(doc3, 1211, 1, 1211, 100)
Dim typ446(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "cgt")
Typ = GetType(System.String)
ReDim Preserve typ446(UBound(typ446) + 1)
typ446(UBound(typ446)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ446))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ446).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1212, 1, 1212, 100)
Dim typ447(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ447(UBound(typ447) + 1)
typ447(UBound(typ447)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ447))
Typ = Typ03.GetMethod("Emit", typ447).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1213, 1, 1213, 100)
EmitCleIL.Emit(OpCodes.Br, cont272)
EmitCleIL.MarkLabel(fa272)
EmitCleIL.MarkSequencePoint(doc3, 1214, 1, 1214, 100)
Dim typ448(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "cgt.un")
Typ = GetType(System.String)
ReDim Preserve typ448(UBound(typ448) + 1)
typ448(UBound(typ448)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ448))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ448).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1215, 1, 1215, 100)
Dim typ449(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ449(UBound(typ449) + 1)
typ449(UBound(typ449)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ449))
Typ = Typ03.GetMethod("Emit", typ449).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1216, 1, 1216, 100)
EmitCleIL.Emit(OpCodes.Br, cont272)
EmitCleIL.MarkLabel(cont272)
EmitCleIL.MarkSequencePoint(doc3, 1217, 1, 1217, 100)
Dim typ450(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ450(UBound(typ450) + 1)
typ450(UBound(typ450)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ450))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ450).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1218, 1, 1218, 100)
Dim typ451(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ451(UBound(typ451) + 1)
typ451(UBound(typ451)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ451))
Typ = Typ03.GetMethod("Emit", typ451).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1219, 1, 1219, 100)
Dim typ452(-1) As Type
EmitCleIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ452(UBound(typ452) + 1)
typ452(UBound(typ452)) = Typ
EmitCleIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ452))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ452).ReturnType
EmitCleIL.Emit(OpCodes.Stloc, 0)
EmitCleIL.MarkSequencePoint(doc3, 1220, 1, 1220, 100)
Dim typ453(-1) As Type
EmitCleIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCleIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ453(UBound(typ453) + 1)
typ453(UBound(typ453)) = Typ
EmitCleIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ453))
Typ = Typ03.GetMethod("Emit", typ453).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCleIL.Emit(OpCodes.Pop)
End If
EmitCleIL.MarkSequencePoint(doc3, 1221, 1, 1221, 100)
EmitCleIL.Emit(OpCodes.Ret)
Dim typ454(-1) As Type
ReDim Preserve typ454(UBound(typ454) + 1)
typ454(UBound(typ454)) = GetType(System.Boolean)
Dim EmitCge As MethodBuilder = ILEmitter.DefineMethod("EmitCge", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ454)
Dim EmitCgeIL As ILGenerator = EmitCge.GetILGenerator()
Dim EmitCgeparam01 As ParameterBuilder = EmitCge.DefineParameter(1, ParameterAttributes.None, "s")
EmitCgeIL.MarkSequencePoint(doc3, 1224, 1, 1224, 100)
Dim locbldr85 As LocalBuilder = EmitCgeIL.DeclareLocal(GetType(OpCode))
locbldr85.SetLocalSymInfo("op")
EmitCgeIL.MarkSequencePoint(doc3, 1225, 1, 1225, 100)
EmitCgeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitCgeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa273 As System.Reflection.Emit.Label = EmitCgeIL.DefineLabel()
Dim tru273 As System.Reflection.Emit.Label = EmitCgeIL.DefineLabel()
Dim cont273 As System.Reflection.Emit.Label = EmitCgeIL.DefineLabel()
EmitCgeIL.Emit(OpCodes.Beq, tru273)
EmitCgeIL.Emit(OpCodes.Br, fa273)
EmitCgeIL.MarkLabel(tru273)
EmitCgeIL.MarkSequencePoint(doc3, 1226, 1, 1226, 100)
Dim typ455(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "clt")
Typ = GetType(System.String)
ReDim Preserve typ455(UBound(typ455) + 1)
typ455(UBound(typ455)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ455))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ455).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1227, 1, 1227, 100)
Dim typ456(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ456(UBound(typ456) + 1)
typ456(UBound(typ456)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ456))
Typ = Typ03.GetMethod("Emit", typ456).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1228, 1, 1228, 100)
EmitCgeIL.Emit(OpCodes.Br, cont273)
EmitCgeIL.MarkLabel(fa273)
EmitCgeIL.MarkSequencePoint(doc3, 1229, 1, 1229, 100)
Dim typ457(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "clt.un")
Typ = GetType(System.String)
ReDim Preserve typ457(UBound(typ457) + 1)
typ457(UBound(typ457)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ457))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ457).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1230, 1, 1230, 100)
Dim typ458(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ458(UBound(typ458) + 1)
typ458(UBound(typ458)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ458))
Typ = Typ03.GetMethod("Emit", typ458).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1231, 1, 1231, 100)
EmitCgeIL.Emit(OpCodes.Br, cont273)
EmitCgeIL.MarkLabel(cont273)
EmitCgeIL.MarkSequencePoint(doc3, 1232, 1, 1232, 100)
Dim typ459(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ459(UBound(typ459) + 1)
typ459(UBound(typ459)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ459))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ459).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1233, 1, 1233, 100)
Dim typ460(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ460(UBound(typ460) + 1)
typ460(UBound(typ460)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ460))
Typ = Typ03.GetMethod("Emit", typ460).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1234, 1, 1234, 100)
Dim typ461(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ461(UBound(typ461) + 1)
typ461(UBound(typ461)) = Typ
EmitCgeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ461))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ461).ReturnType
EmitCgeIL.Emit(OpCodes.Stloc, 0)
EmitCgeIL.MarkSequencePoint(doc3, 1235, 1, 1235, 100)
Dim typ462(-1) As Type
EmitCgeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitCgeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ462(UBound(typ462) + 1)
typ462(UBound(typ462)) = Typ
EmitCgeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ462))
Typ = Typ03.GetMethod("Emit", typ462).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitCgeIL.Emit(OpCodes.Pop)
End If
EmitCgeIL.MarkSequencePoint(doc3, 1236, 1, 1236, 100)
EmitCgeIL.Emit(OpCodes.Ret)
Dim EmitLike As MethodBuilder = ILEmitter.DefineMethod("EmitLike", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitLikeIL As ILGenerator = EmitLike.GetILGenerator()
EmitLikeIL.MarkSequencePoint(doc3, 1239, 1, 1239, 100)
Dim locbldr86 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(OpCode))
locbldr86.SetLocalSymInfo("op")
EmitLikeIL.MarkSequencePoint(doc3, 1240, 1, 1240, 100)
Dim locbldr87 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(System.Type))
locbldr87.SetLocalSymInfo("lotyp")
EmitLikeIL.Emit(OpCodes.Ldtoken, GetType(Regex))
Dim typ463 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ463))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ463).ReturnType
EmitLikeIL.Emit(OpCodes.Stloc, 1)
EmitLikeIL.MarkSequencePoint(doc3, 1241, 1, 1241, 100)
Dim locbldr88 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr88.SetLocalSymInfo("params")
EmitLikeIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitLikeIL.Emit(OpCodes.Conv_U)
EmitLikeIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitLikeIL.Emit(OpCodes.Stloc, 2)
EmitLikeIL.MarkSequencePoint(doc3, 1242, 1, 1242, 100)
EmitLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitLikeIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ464 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ464))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ464).ReturnType
EmitLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitLikeIL.MarkSequencePoint(doc3, 1243, 1, 1243, 100)
EmitLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitLikeIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ465 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ465))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ465).ReturnType
EmitLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitLikeIL.MarkSequencePoint(doc3, 1244, 1, 1244, 100)
Dim locbldr89 As LocalBuilder = EmitLikeIL.DeclareLocal(GetType(MethodInfo))
locbldr89.SetLocalSymInfo("lomet")
Dim typ466(-1) As Type
EmitLikeIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitLikeIL.Emit(OpCodes.Ldstr, "IsMatch")
Typ = GetType(System.String)
ReDim Preserve typ466(UBound(typ466) + 1)
typ466(UBound(typ466)) = Typ
EmitLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ466(UBound(typ466) + 1)
typ466(UBound(typ466)) = Typ
EmitLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ466))
Typ = Typ03.GetMethod("GetMethod", typ466).ReturnType
EmitLikeIL.Emit(OpCodes.Stloc, 3)
EmitLikeIL.MarkSequencePoint(doc3, 1245, 1, 1245, 100)
Dim typ467(-1) As Type
EmitLikeIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ467(UBound(typ467) + 1)
typ467(UBound(typ467)) = Typ
EmitLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ467))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ467).ReturnType
EmitLikeIL.Emit(OpCodes.Stloc, 0)
EmitLikeIL.MarkSequencePoint(doc3, 1246, 1, 1246, 100)
Dim typ468(-1) As Type
EmitLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ468(UBound(typ468) + 1)
typ468(UBound(typ468)) = Typ
EmitLikeIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ468(UBound(typ468) + 1)
typ468(UBound(typ468)) = Typ
EmitLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ468))
Typ = Typ03.GetMethod("Emit", typ468).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLikeIL.Emit(OpCodes.Pop)
End If
EmitLikeIL.MarkSequencePoint(doc3, 1247, 1, 1247, 100)
EmitLikeIL.Emit(OpCodes.Ret)
Dim EmitNLike As MethodBuilder = ILEmitter.DefineMethod("EmitNLike", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitNLikeIL As ILGenerator = EmitNLike.GetILGenerator()
EmitNLikeIL.MarkSequencePoint(doc3, 1250, 1, 1250, 100)
Dim locbldr90 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(OpCode))
locbldr90.SetLocalSymInfo("op")
EmitNLikeIL.MarkSequencePoint(doc3, 1251, 1, 1251, 100)
Dim locbldr91 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(System.Type))
locbldr91.SetLocalSymInfo("lotyp")
EmitNLikeIL.Emit(OpCodes.Ldtoken, GetType(Regex))
Dim typ469 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitNLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ469))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ469).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 1)
EmitNLikeIL.MarkSequencePoint(doc3, 1252, 1, 1252, 100)
Dim locbldr92 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr92.SetLocalSymInfo("params")
EmitNLikeIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitNLikeIL.Emit(OpCodes.Conv_U)
EmitNLikeIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitNLikeIL.Emit(OpCodes.Stloc, 2)
EmitNLikeIL.MarkSequencePoint(doc3, 1253, 1, 1253, 100)
EmitNLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitNLikeIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitNLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitNLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ470 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitNLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ470))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ470).ReturnType
EmitNLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitNLikeIL.MarkSequencePoint(doc3, 1254, 1, 1254, 100)
EmitNLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitNLikeIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitNLikeIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitNLikeIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ471 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitNLikeIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ471))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ471).ReturnType
EmitNLikeIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitNLikeIL.MarkSequencePoint(doc3, 1255, 1, 1255, 100)
Dim locbldr93 As LocalBuilder = EmitNLikeIL.DeclareLocal(GetType(MethodInfo))
locbldr93.SetLocalSymInfo("lomet")
Dim typ472(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldstr, "IsMatch")
Typ = GetType(System.String)
ReDim Preserve typ472(UBound(typ472) + 1)
typ472(UBound(typ472)) = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ472(UBound(typ472) + 1)
typ472(UBound(typ472)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ472))
Typ = Typ03.GetMethod("GetMethod", typ472).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 3)
EmitNLikeIL.MarkSequencePoint(doc3, 1256, 1, 1256, 100)
Dim typ473(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ473(UBound(typ473) + 1)
typ473(UBound(typ473)) = Typ
EmitNLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ473))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ473).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 0)
EmitNLikeIL.MarkSequencePoint(doc3, 1257, 1, 1257, 100)
Dim typ474(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ474(UBound(typ474) + 1)
typ474(UBound(typ474)) = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ474(UBound(typ474) + 1)
typ474(UBound(typ474)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ474))
Typ = Typ03.GetMethod("Emit", typ474).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNLikeIL.Emit(OpCodes.Pop)
End If
EmitNLikeIL.MarkSequencePoint(doc3, 1258, 1, 1258, 100)
Dim typ475(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ475(UBound(typ475) + 1)
typ475(UBound(typ475)) = Typ
EmitNLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ475))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ475).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 0)
EmitNLikeIL.MarkSequencePoint(doc3, 1259, 1, 1259, 100)
Dim typ476(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ476(UBound(typ476) + 1)
typ476(UBound(typ476)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ476))
Typ = Typ03.GetMethod("Emit", typ476).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNLikeIL.Emit(OpCodes.Pop)
End If
EmitNLikeIL.MarkSequencePoint(doc3, 1260, 1, 1260, 100)
Dim typ477(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ477(UBound(typ477) + 1)
typ477(UBound(typ477)) = Typ
EmitNLikeIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ477))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ477).ReturnType
EmitNLikeIL.Emit(OpCodes.Stloc, 0)
EmitNLikeIL.MarkSequencePoint(doc3, 1261, 1, 1261, 100)
Dim typ478(-1) As Type
EmitNLikeIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNLikeIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ478(UBound(typ478) + 1)
typ478(UBound(typ478)) = Typ
EmitNLikeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ478))
Typ = Typ03.GetMethod("Emit", typ478).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNLikeIL.Emit(OpCodes.Pop)
End If
EmitNLikeIL.MarkSequencePoint(doc3, 1263, 1, 1263, 100)
EmitNLikeIL.Emit(OpCodes.Ret)
Dim EmitStrCeq As MethodBuilder = ILEmitter.DefineMethod("EmitStrCeq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitStrCeqIL As ILGenerator = EmitStrCeq.GetILGenerator()
EmitStrCeqIL.MarkSequencePoint(doc3, 1266, 1, 1266, 100)
Dim locbldr94 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(OpCode))
locbldr94.SetLocalSymInfo("op")
EmitStrCeqIL.MarkSequencePoint(doc3, 1267, 1, 1267, 100)
Dim locbldr95 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(System.Type))
locbldr95.SetLocalSymInfo("strtyp")
EmitStrCeqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ479 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCeqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ479))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ479).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 1)
EmitStrCeqIL.MarkSequencePoint(doc3, 1268, 1, 1268, 100)
Dim locbldr96 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr96.SetLocalSymInfo("params")
EmitStrCeqIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitStrCeqIL.Emit(OpCodes.Conv_U)
EmitStrCeqIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitStrCeqIL.Emit(OpCodes.Stloc, 2)
EmitStrCeqIL.MarkSequencePoint(doc3, 1269, 1, 1269, 100)
EmitStrCeqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitStrCeqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCeqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ480 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCeqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ480))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ480).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCeqIL.MarkSequencePoint(doc3, 1270, 1, 1270, 100)
EmitStrCeqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitStrCeqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCeqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ481 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCeqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ481))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ481).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCeqIL.MarkSequencePoint(doc3, 1271, 1, 1271, 100)
Dim locbldr97 As LocalBuilder = EmitStrCeqIL.DeclareLocal(GetType(MethodInfo))
locbldr97.SetLocalSymInfo("met")
Dim typ482(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldstr, "Compare")
Typ = GetType(System.String)
ReDim Preserve typ482(UBound(typ482) + 1)
typ482(UBound(typ482)) = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ482(UBound(typ482) + 1)
typ482(UBound(typ482)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ482))
Typ = Typ03.GetMethod("GetMethod", typ482).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 3)
EmitStrCeqIL.MarkSequencePoint(doc3, 1272, 1, 1272, 100)
Dim typ483(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ483(UBound(typ483) + 1)
typ483(UBound(typ483)) = Typ
EmitStrCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ483))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ483).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 0)
EmitStrCeqIL.MarkSequencePoint(doc3, 1273, 1, 1273, 100)
Dim typ484(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ484(UBound(typ484) + 1)
typ484(UBound(typ484)) = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ484(UBound(typ484) + 1)
typ484(UBound(typ484)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ484))
Typ = Typ03.GetMethod("Emit", typ484).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCeqIL.Emit(OpCodes.Pop)
End If
EmitStrCeqIL.MarkSequencePoint(doc3, 1274, 1, 1274, 100)
Dim typ485(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ485(UBound(typ485) + 1)
typ485(UBound(typ485)) = Typ
EmitStrCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ485))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ485).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 0)
EmitStrCeqIL.MarkSequencePoint(doc3, 1275, 1, 1275, 100)
Dim typ486(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ486(UBound(typ486) + 1)
typ486(UBound(typ486)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ486))
Typ = Typ03.GetMethod("Emit", typ486).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCeqIL.Emit(OpCodes.Pop)
End If
EmitStrCeqIL.MarkSequencePoint(doc3, 1276, 1, 1276, 100)
Dim typ487(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ487(UBound(typ487) + 1)
typ487(UBound(typ487)) = Typ
EmitStrCeqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ487))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ487).ReturnType
EmitStrCeqIL.Emit(OpCodes.Stloc, 0)
EmitStrCeqIL.MarkSequencePoint(doc3, 1277, 1, 1277, 100)
Dim typ488(-1) As Type
EmitStrCeqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCeqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ488(UBound(typ488) + 1)
typ488(UBound(typ488)) = Typ
EmitStrCeqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ488))
Typ = Typ03.GetMethod("Emit", typ488).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCeqIL.Emit(OpCodes.Pop)
End If
EmitStrCeqIL.MarkSequencePoint(doc3, 1278, 1, 1278, 100)
EmitStrCeqIL.Emit(OpCodes.Ret)
Dim EmitStrCneq As MethodBuilder = ILEmitter.DefineMethod("EmitStrCneq", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitStrCneqIL As ILGenerator = EmitStrCneq.GetILGenerator()
EmitStrCneqIL.MarkSequencePoint(doc3, 1281, 1, 1281, 100)
Dim locbldr98 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(OpCode))
locbldr98.SetLocalSymInfo("op")
EmitStrCneqIL.MarkSequencePoint(doc3, 1282, 1, 1282, 100)
Dim locbldr99 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(System.Type))
locbldr99.SetLocalSymInfo("strtyp")
EmitStrCneqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ489 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCneqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ489))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ489).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 1)
EmitStrCneqIL.MarkSequencePoint(doc3, 1283, 1, 1283, 100)
Dim locbldr100 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr100.SetLocalSymInfo("params")
EmitStrCneqIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitStrCneqIL.Emit(OpCodes.Conv_U)
EmitStrCneqIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitStrCneqIL.Emit(OpCodes.Stloc, 2)
EmitStrCneqIL.MarkSequencePoint(doc3, 1284, 1, 1284, 100)
EmitStrCneqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitStrCneqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCneqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ490 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCneqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ490))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ490).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCneqIL.MarkSequencePoint(doc3, 1285, 1, 1285, 100)
EmitStrCneqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitStrCneqIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrCneqIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ491 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrCneqIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ491))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ491).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrCneqIL.MarkSequencePoint(doc3, 1286, 1, 1286, 100)
Dim locbldr101 As LocalBuilder = EmitStrCneqIL.DeclareLocal(GetType(MethodInfo))
locbldr101.SetLocalSymInfo("met")
Dim typ492(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldstr, "Compare")
Typ = GetType(System.String)
ReDim Preserve typ492(UBound(typ492) + 1)
typ492(UBound(typ492)) = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ492(UBound(typ492) + 1)
typ492(UBound(typ492)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ492))
Typ = Typ03.GetMethod("GetMethod", typ492).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 3)
EmitStrCneqIL.MarkSequencePoint(doc3, 1287, 1, 1287, 100)
Dim typ493(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ493(UBound(typ493) + 1)
typ493(UBound(typ493)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ493))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ493).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1288, 1, 1288, 100)
Dim typ494(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ494(UBound(typ494) + 1)
typ494(UBound(typ494)) = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ494(UBound(typ494) + 1)
typ494(UBound(typ494)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ494))
Typ = Typ03.GetMethod("Emit", typ494).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1289, 1, 1289, 100)
Dim typ495(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ495(UBound(typ495) + 1)
typ495(UBound(typ495)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ495))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ495).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1290, 1, 1290, 100)
Dim typ496(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ496(UBound(typ496) + 1)
typ496(UBound(typ496)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ496))
Typ = Typ03.GetMethod("Emit", typ496).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1291, 1, 1291, 100)
Dim typ497(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ497(UBound(typ497) + 1)
typ497(UBound(typ497)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ497))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ497).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1292, 1, 1292, 100)
Dim typ498(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ498(UBound(typ498) + 1)
typ498(UBound(typ498)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ498))
Typ = Typ03.GetMethod("Emit", typ498).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1293, 1, 1293, 100)
Dim typ499(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ499(UBound(typ499) + 1)
typ499(UBound(typ499)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ499))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ499).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1294, 1, 1294, 100)
Dim typ500(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ500(UBound(typ500) + 1)
typ500(UBound(typ500)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ500))
Typ = Typ03.GetMethod("Emit", typ500).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1295, 1, 1295, 100)
Dim typ501(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldstr, "ceq")
Typ = GetType(System.String)
ReDim Preserve typ501(UBound(typ501) + 1)
typ501(UBound(typ501)) = Typ
EmitStrCneqIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ501))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ501).ReturnType
EmitStrCneqIL.Emit(OpCodes.Stloc, 0)
EmitStrCneqIL.MarkSequencePoint(doc3, 1296, 1, 1296, 100)
Dim typ502(-1) As Type
EmitStrCneqIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrCneqIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ502(UBound(typ502) + 1)
typ502(UBound(typ502)) = Typ
EmitStrCneqIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ502))
Typ = Typ03.GetMethod("Emit", typ502).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrCneqIL.Emit(OpCodes.Pop)
End If
EmitStrCneqIL.MarkSequencePoint(doc3, 1297, 1, 1297, 100)
EmitStrCneqIL.Emit(OpCodes.Ret)
Dim EmitStrAdd As MethodBuilder = ILEmitter.DefineMethod("EmitStrAdd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitStrAddIL As ILGenerator = EmitStrAdd.GetILGenerator()
EmitStrAddIL.MarkSequencePoint(doc3, 1300, 1, 1300, 100)
Dim locbldr102 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(OpCode))
locbldr102.SetLocalSymInfo("op")
EmitStrAddIL.MarkSequencePoint(doc3, 1301, 1, 1301, 100)
Dim locbldr103 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(System.Type))
locbldr103.SetLocalSymInfo("strtyp")
EmitStrAddIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ503 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrAddIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ503))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ503).ReturnType
EmitStrAddIL.Emit(OpCodes.Stloc, 1)
EmitStrAddIL.MarkSequencePoint(doc3, 1302, 1, 1302, 100)
Dim locbldr104 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(system.Type).MakeArrayType())
locbldr104.SetLocalSymInfo("params")
EmitStrAddIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
EmitStrAddIL.Emit(OpCodes.Conv_U)
EmitStrAddIL.Emit(OpCodes.Newarr, GetType(System.Type))
EmitStrAddIL.Emit(OpCodes.Stloc, 2)
EmitStrAddIL.MarkSequencePoint(doc3, 1303, 1, 1303, 100)
EmitStrAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrAddIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
EmitStrAddIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrAddIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ504 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrAddIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ504))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ504).ReturnType
EmitStrAddIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrAddIL.MarkSequencePoint(doc3, 1304, 1, 1304, 100)
EmitStrAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
Typ02 = Typ
EmitStrAddIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
EmitStrAddIL.Emit(OpCodes.Conv_U)
Typ = Typ02
EmitStrAddIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ505 As Type() = {GetType(System.RuntimeTypeHandle)}
EmitStrAddIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ505))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ505).ReturnType
EmitStrAddIL.Emit(OpCodes.Stelem, GetType(system.Type).MakeArrayType().GetElementType())
EmitStrAddIL.MarkSequencePoint(doc3, 1305, 1, 1305, 100)
Dim locbldr105 As LocalBuilder = EmitStrAddIL.DeclareLocal(GetType(MethodInfo))
locbldr105.SetLocalSymInfo("met")
Dim typ506(-1) As Type
EmitStrAddIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type)
Typ03 = Typ
EmitStrAddIL.Emit(OpCodes.Ldstr, "Concat")
Typ = GetType(System.String)
ReDim Preserve typ506(UBound(typ506) + 1)
typ506(UBound(typ506)) = Typ
EmitStrAddIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(system.Type).MakeArrayType()
ReDim Preserve typ506(UBound(typ506) + 1)
typ506(UBound(typ506)) = Typ
EmitStrAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ506))
Typ = Typ03.GetMethod("GetMethod", typ506).ReturnType
EmitStrAddIL.Emit(OpCodes.Stloc, 3)
EmitStrAddIL.MarkSequencePoint(doc3, 1306, 1, 1306, 100)
Dim typ507(-1) As Type
EmitStrAddIL.Emit(OpCodes.Ldstr, "call")
Typ = GetType(System.String)
ReDim Preserve typ507(UBound(typ507) + 1)
typ507(UBound(typ507)) = Typ
EmitStrAddIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ507))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ507).ReturnType
EmitStrAddIL.Emit(OpCodes.Stloc, 0)
EmitStrAddIL.MarkSequencePoint(doc3, 1307, 1, 1307, 100)
Dim typ508(-1) As Type
EmitStrAddIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitStrAddIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ508(UBound(typ508) + 1)
typ508(UBound(typ508)) = Typ
EmitStrAddIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo)
ReDim Preserve typ508(UBound(typ508) + 1)
typ508(UBound(typ508)) = Typ
EmitStrAddIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ508))
Typ = Typ03.GetMethod("Emit", typ508).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitStrAddIL.Emit(OpCodes.Pop)
End If
EmitStrAddIL.MarkSequencePoint(doc3, 1308, 1, 1308, 100)
EmitStrAddIL.Emit(OpCodes.Ret)
Dim typ509(-1) As Type
ReDim Preserve typ509(UBound(typ509) + 1)
typ509(UBound(typ509)) = GetType(System.Single)
Dim EmitLdcR4 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcR4", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ509)
Dim EmitLdcR4IL As ILGenerator = EmitLdcR4.GetILGenerator()
Dim EmitLdcR4param01 As ParameterBuilder = EmitLdcR4.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdcR4IL.MarkSequencePoint(doc3, 1311, 1, 1311, 100)
Dim locbldr106 As LocalBuilder = EmitLdcR4IL.DeclareLocal(GetType(OpCode))
locbldr106.SetLocalSymInfo("op")
EmitLdcR4IL.MarkSequencePoint(doc3, 1312, 1, 1312, 100)
Dim typ510(-1) As Type
EmitLdcR4IL.Emit(OpCodes.Ldstr, "ldc.r4")
Typ = GetType(System.String)
ReDim Preserve typ510(UBound(typ510) + 1)
typ510(UBound(typ510)) = Typ
EmitLdcR4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ510))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ510).ReturnType
EmitLdcR4IL.Emit(OpCodes.Stloc, 0)
EmitLdcR4IL.MarkSequencePoint(doc3, 1313, 1, 1313, 100)
Dim typ511(-1) As Type
EmitLdcR4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcR4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ511(UBound(typ511) + 1)
typ511(UBound(typ511)) = Typ
EmitLdcR4IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Single)
ReDim Preserve typ511(UBound(typ511) + 1)
typ511(UBound(typ511)) = Typ
EmitLdcR4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ511))
Typ = Typ03.GetMethod("Emit", typ511).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcR4IL.Emit(OpCodes.Pop)
End If
EmitLdcR4IL.MarkSequencePoint(doc3, 1314, 1, 1314, 100)
EmitLdcR4IL.Emit(OpCodes.Ret)
Dim typ512(-1) As Type
ReDim Preserve typ512(UBound(typ512) + 1)
typ512(UBound(typ512)) = GetType(System.Double)
Dim EmitLdcR8 As MethodBuilder = ILEmitter.DefineMethod("EmitLdcR8", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ512)
Dim EmitLdcR8IL As ILGenerator = EmitLdcR8.GetILGenerator()
Dim EmitLdcR8param01 As ParameterBuilder = EmitLdcR8.DefineParameter(1, ParameterAttributes.None, "num")
EmitLdcR8IL.MarkSequencePoint(doc3, 1317, 1, 1317, 100)
Dim locbldr107 As LocalBuilder = EmitLdcR8IL.DeclareLocal(GetType(OpCode))
locbldr107.SetLocalSymInfo("op")
EmitLdcR8IL.MarkSequencePoint(doc3, 1318, 1, 1318, 100)
Dim typ513(-1) As Type
EmitLdcR8IL.Emit(OpCodes.Ldstr, "ldc.r8")
Typ = GetType(System.String)
ReDim Preserve typ513(UBound(typ513) + 1)
typ513(UBound(typ513)) = Typ
EmitLdcR8IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ513))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ513).ReturnType
EmitLdcR8IL.Emit(OpCodes.Stloc, 0)
EmitLdcR8IL.MarkSequencePoint(doc3, 1319, 1, 1319, 100)
Dim typ514(-1) As Type
EmitLdcR8IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcR8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ514(UBound(typ514) + 1)
typ514(UBound(typ514)) = Typ
EmitLdcR8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Double)
ReDim Preserve typ514(UBound(typ514) + 1)
typ514(UBound(typ514)) = Typ
EmitLdcR8IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ514))
Typ = Typ03.GetMethod("Emit", typ514).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcR8IL.Emit(OpCodes.Pop)
End If
EmitLdcR8IL.MarkSequencePoint(doc3, 1320, 1, 1320, 100)
EmitLdcR8IL.Emit(OpCodes.Ret)
Dim typ515(-1) As Type
ReDim Preserve typ515(UBound(typ515) + 1)
typ515(UBound(typ515)) = GetType(System.Boolean)
Dim EmitLdcBool As MethodBuilder = ILEmitter.DefineMethod("EmitLdcBool", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ515)
Dim EmitLdcBoolIL As ILGenerator = EmitLdcBool.GetILGenerator()
Dim EmitLdcBoolparam01 As ParameterBuilder = EmitLdcBool.DefineParameter(1, ParameterAttributes.None, "b")
EmitLdcBoolIL.MarkSequencePoint(doc3, 1323, 1, 1323, 100)
Dim locbldr108 As LocalBuilder = EmitLdcBoolIL.DeclareLocal(GetType(OpCode))
locbldr108.SetLocalSymInfo("op")
EmitLdcBoolIL.MarkSequencePoint(doc3, 1324, 1, 1324, 100)
EmitLdcBoolIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Boolean)
EmitLdcBoolIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa274 As System.Reflection.Emit.Label = EmitLdcBoolIL.DefineLabel()
Dim tru274 As System.Reflection.Emit.Label = EmitLdcBoolIL.DefineLabel()
Dim cont274 As System.Reflection.Emit.Label = EmitLdcBoolIL.DefineLabel()
EmitLdcBoolIL.Emit(OpCodes.Beq, tru274)
EmitLdcBoolIL.Emit(OpCodes.Br, fa274)
EmitLdcBoolIL.MarkLabel(tru274)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1325, 1, 1325, 100)
Dim typ516(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldstr, "ldc.i4.1")
Typ = GetType(System.String)
ReDim Preserve typ516(UBound(typ516) + 1)
typ516(UBound(typ516)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ516))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ516).ReturnType
EmitLdcBoolIL.Emit(OpCodes.Stloc, 0)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1326, 1, 1326, 100)
Dim typ517(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcBoolIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ517(UBound(typ517) + 1)
typ517(UBound(typ517)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ517))
Typ = Typ03.GetMethod("Emit", typ517).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcBoolIL.Emit(OpCodes.Pop)
End If
EmitLdcBoolIL.MarkSequencePoint(doc3, 1327, 1, 1327, 100)
EmitLdcBoolIL.Emit(OpCodes.Br, cont274)
EmitLdcBoolIL.MarkLabel(fa274)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1328, 1, 1328, 100)
Dim typ518(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldstr, "ldc.i4.0")
Typ = GetType(System.String)
ReDim Preserve typ518(UBound(typ518) + 1)
typ518(UBound(typ518)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ518))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ518).ReturnType
EmitLdcBoolIL.Emit(OpCodes.Stloc, 0)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1329, 1, 1329, 100)
Dim typ519(-1) As Type
EmitLdcBoolIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcBoolIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ519(UBound(typ519) + 1)
typ519(UBound(typ519)) = Typ
EmitLdcBoolIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ519))
Typ = Typ03.GetMethod("Emit", typ519).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcBoolIL.Emit(OpCodes.Pop)
End If
EmitLdcBoolIL.MarkSequencePoint(doc3, 1330, 1, 1330, 100)
EmitLdcBoolIL.Emit(OpCodes.Br, cont274)
EmitLdcBoolIL.MarkLabel(cont274)
EmitLdcBoolIL.MarkSequencePoint(doc3, 1331, 1, 1331, 100)
EmitLdcBoolIL.Emit(OpCodes.Ret)
Dim typ520(-1) As Type
ReDim Preserve typ520(UBound(typ520) + 1)
typ520(UBound(typ520)) = GetType(System.Char)
Dim EmitLdcChar As MethodBuilder = ILEmitter.DefineMethod("EmitLdcChar", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ520)
Dim EmitLdcCharIL As ILGenerator = EmitLdcChar.GetILGenerator()
Dim EmitLdcCharparam01 As ParameterBuilder = EmitLdcChar.DefineParameter(1, ParameterAttributes.None, "c")
EmitLdcCharIL.MarkSequencePoint(doc3, 1334, 1, 1334, 100)
Dim locbldr109 As LocalBuilder = EmitLdcCharIL.DeclareLocal(GetType(OpCode))
locbldr109.SetLocalSymInfo("op")
EmitLdcCharIL.MarkSequencePoint(doc3, 1335, 1, 1335, 100)
Dim typ521(-1) As Type
EmitLdcCharIL.Emit(OpCodes.Ldstr, "ldc.i4")
Typ = GetType(System.String)
ReDim Preserve typ521(UBound(typ521) + 1)
typ521(UBound(typ521)) = Typ
EmitLdcCharIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ521))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ521).ReturnType
EmitLdcCharIL.Emit(OpCodes.Stloc, 0)
EmitLdcCharIL.MarkSequencePoint(doc3, 1336, 1, 1336, 100)
Dim typ522(-1) As Type
EmitLdcCharIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdcCharIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ522(UBound(typ522) + 1)
typ522(UBound(typ522)) = Typ
EmitLdcCharIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Char)
Dim typ523 As Type() = {Typ}
EmitLdcCharIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ523))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ523).ReturnType
ReDim Preserve typ522(UBound(typ522) + 1)
typ522(UBound(typ522)) = Typ
EmitLdcCharIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ522))
Typ = Typ03.GetMethod("Emit", typ522).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdcCharIL.Emit(OpCodes.Pop)
End If
EmitLdcCharIL.MarkSequencePoint(doc3, 1337, 1, 1337, 100)
EmitLdcCharIL.Emit(OpCodes.Ret)
Dim EmitLdnull As MethodBuilder = ILEmitter.DefineMethod("EmitLdnull", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitLdnullIL As ILGenerator = EmitLdnull.GetILGenerator()
EmitLdnullIL.MarkSequencePoint(doc3, 1340, 1, 1340, 100)
Dim locbldr110 As LocalBuilder = EmitLdnullIL.DeclareLocal(GetType(OpCode))
locbldr110.SetLocalSymInfo("op")
EmitLdnullIL.MarkSequencePoint(doc3, 1341, 1, 1341, 100)
Dim typ524(-1) As Type
EmitLdnullIL.Emit(OpCodes.Ldstr, "ldnull")
Typ = GetType(System.String)
ReDim Preserve typ524(UBound(typ524) + 1)
typ524(UBound(typ524)) = Typ
EmitLdnullIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ524))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ524).ReturnType
EmitLdnullIL.Emit(OpCodes.Stloc, 0)
EmitLdnullIL.MarkSequencePoint(doc3, 1342, 1, 1342, 100)
Dim typ525(-1) As Type
EmitLdnullIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdnullIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ525(UBound(typ525) + 1)
typ525(UBound(typ525)) = Typ
EmitLdnullIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ525))
Typ = Typ03.GetMethod("Emit", typ525).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdnullIL.Emit(OpCodes.Pop)
End If
EmitLdnullIL.MarkSequencePoint(doc3, 1343, 1, 1343, 100)
EmitLdnullIL.Emit(OpCodes.Ret)
Dim typ526(-1) As Type
ReDim Preserve typ526(UBound(typ526) + 1)
typ526(UBound(typ526)) = GetType(ConstructorInfo)
Dim EmitNewobj As MethodBuilder = ILEmitter.DefineMethod("EmitNewobj", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ526)
Dim EmitNewobjIL As ILGenerator = EmitNewobj.GetILGenerator()
Dim EmitNewobjparam01 As ParameterBuilder = EmitNewobj.DefineParameter(1, ParameterAttributes.None, "c")
EmitNewobjIL.MarkSequencePoint(doc3, 1346, 1, 1346, 100)
Dim locbldr111 As LocalBuilder = EmitNewobjIL.DeclareLocal(GetType(OpCode))
locbldr111.SetLocalSymInfo("op")
EmitNewobjIL.MarkSequencePoint(doc3, 1347, 1, 1347, 100)
Dim typ527(-1) As Type
EmitNewobjIL.Emit(OpCodes.Ldstr, "newobj")
Typ = GetType(System.String)
ReDim Preserve typ527(UBound(typ527) + 1)
typ527(UBound(typ527)) = Typ
EmitNewobjIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ527))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ527).ReturnType
EmitNewobjIL.Emit(OpCodes.Stloc, 0)
EmitNewobjIL.MarkSequencePoint(doc3, 1348, 1, 1348, 100)
Dim typ528(-1) As Type
EmitNewobjIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNewobjIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ528(UBound(typ528) + 1)
typ528(UBound(typ528)) = Typ
EmitNewobjIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ConstructorInfo)
ReDim Preserve typ528(UBound(typ528) + 1)
typ528(UBound(typ528)) = Typ
EmitNewobjIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ528))
Typ = Typ03.GetMethod("Emit", typ528).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNewobjIL.Emit(OpCodes.Pop)
End If
EmitNewobjIL.MarkSequencePoint(doc3, 1349, 1, 1349, 100)
EmitNewobjIL.Emit(OpCodes.Ret)
Dim typ529(-1) As Type
ReDim Preserve typ529(UBound(typ529) + 1)
typ529(UBound(typ529)) = GetType(Emit.Label)
Dim EmitBr As MethodBuilder = ILEmitter.DefineMethod("EmitBr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ529)
Dim EmitBrIL As ILGenerator = EmitBr.GetILGenerator()
Dim EmitBrparam01 As ParameterBuilder = EmitBr.DefineParameter(1, ParameterAttributes.None, "lbl")
EmitBrIL.MarkSequencePoint(doc3, 1352, 1, 1352, 100)
Dim locbldr112 As LocalBuilder = EmitBrIL.DeclareLocal(GetType(OpCode))
locbldr112.SetLocalSymInfo("op")
EmitBrIL.MarkSequencePoint(doc3, 1353, 1, 1353, 100)
Dim typ530(-1) As Type
EmitBrIL.Emit(OpCodes.Ldstr, "br")
Typ = GetType(System.String)
ReDim Preserve typ530(UBound(typ530) + 1)
typ530(UBound(typ530)) = Typ
EmitBrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ530))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ530).ReturnType
EmitBrIL.Emit(OpCodes.Stloc, 0)
EmitBrIL.MarkSequencePoint(doc3, 1354, 1, 1354, 100)
Dim typ531(-1) As Type
EmitBrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ531(UBound(typ531) + 1)
typ531(UBound(typ531)) = Typ
EmitBrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ531(UBound(typ531) + 1)
typ531(UBound(typ531)) = Typ
EmitBrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ531))
Typ = Typ03.GetMethod("Emit", typ531).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBrIL.Emit(OpCodes.Pop)
End If
EmitBrIL.MarkSequencePoint(doc3, 1355, 1, 1355, 100)
EmitBrIL.Emit(OpCodes.Ret)
Dim typ532(-1) As Type
ReDim Preserve typ532(UBound(typ532) + 1)
typ532(UBound(typ532)) = GetType(Emit.Label)
Dim EmitBrfalse As MethodBuilder = ILEmitter.DefineMethod("EmitBrfalse", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ532)
Dim EmitBrfalseIL As ILGenerator = EmitBrfalse.GetILGenerator()
Dim EmitBrfalseparam01 As ParameterBuilder = EmitBrfalse.DefineParameter(1, ParameterAttributes.None, "lbl")
EmitBrfalseIL.MarkSequencePoint(doc3, 1358, 1, 1358, 100)
Dim locbldr113 As LocalBuilder = EmitBrfalseIL.DeclareLocal(GetType(OpCode))
locbldr113.SetLocalSymInfo("op")
EmitBrfalseIL.MarkSequencePoint(doc3, 1359, 1, 1359, 100)
Dim typ533(-1) As Type
EmitBrfalseIL.Emit(OpCodes.Ldstr, "brfalse")
Typ = GetType(System.String)
ReDim Preserve typ533(UBound(typ533) + 1)
typ533(UBound(typ533)) = Typ
EmitBrfalseIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ533))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ533).ReturnType
EmitBrfalseIL.Emit(OpCodes.Stloc, 0)
EmitBrfalseIL.MarkSequencePoint(doc3, 1360, 1, 1360, 100)
Dim typ534(-1) As Type
EmitBrfalseIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBrfalseIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ534(UBound(typ534) + 1)
typ534(UBound(typ534)) = Typ
EmitBrfalseIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ534(UBound(typ534) + 1)
typ534(UBound(typ534)) = Typ
EmitBrfalseIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ534))
Typ = Typ03.GetMethod("Emit", typ534).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBrfalseIL.Emit(OpCodes.Pop)
End If
EmitBrfalseIL.MarkSequencePoint(doc3, 1361, 1, 1361, 100)
EmitBrfalseIL.Emit(OpCodes.Ret)
Dim typ535(-1) As Type
ReDim Preserve typ535(UBound(typ535) + 1)
typ535(UBound(typ535)) = GetType(Emit.Label)
Dim EmitBrtrue As MethodBuilder = ILEmitter.DefineMethod("EmitBrtrue", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ535)
Dim EmitBrtrueIL As ILGenerator = EmitBrtrue.GetILGenerator()
Dim EmitBrtrueparam01 As ParameterBuilder = EmitBrtrue.DefineParameter(1, ParameterAttributes.None, "lbl")
EmitBrtrueIL.MarkSequencePoint(doc3, 1364, 1, 1364, 100)
Dim locbldr114 As LocalBuilder = EmitBrtrueIL.DeclareLocal(GetType(OpCode))
locbldr114.SetLocalSymInfo("op")
EmitBrtrueIL.MarkSequencePoint(doc3, 1365, 1, 1365, 100)
Dim typ536(-1) As Type
EmitBrtrueIL.Emit(OpCodes.Ldstr, "brtrue")
Typ = GetType(System.String)
ReDim Preserve typ536(UBound(typ536) + 1)
typ536(UBound(typ536)) = Typ
EmitBrtrueIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ536))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ536).ReturnType
EmitBrtrueIL.Emit(OpCodes.Stloc, 0)
EmitBrtrueIL.MarkSequencePoint(doc3, 1366, 1, 1366, 100)
Dim typ537(-1) As Type
EmitBrtrueIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitBrtrueIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ537(UBound(typ537) + 1)
typ537(UBound(typ537)) = Typ
EmitBrtrueIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ537(UBound(typ537) + 1)
typ537(UBound(typ537)) = Typ
EmitBrtrueIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ537))
Typ = Typ03.GetMethod("Emit", typ537).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitBrtrueIL.Emit(OpCodes.Pop)
End If
EmitBrtrueIL.MarkSequencePoint(doc3, 1367, 1, 1367, 100)
EmitBrtrueIL.Emit(OpCodes.Ret)
Dim typ538(-1) As Type
ReDim Preserve typ538(UBound(typ538) + 1)
typ538(UBound(typ538)) = GetType(System.Type)
Dim EmitLdtoken As MethodBuilder = ILEmitter.DefineMethod("EmitLdtoken", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ538)
Dim EmitLdtokenIL As ILGenerator = EmitLdtoken.GetILGenerator()
Dim EmitLdtokenparam01 As ParameterBuilder = EmitLdtoken.DefineParameter(1, ParameterAttributes.None, "t")
EmitLdtokenIL.MarkSequencePoint(doc3, 1370, 1, 1370, 100)
Dim locbldr115 As LocalBuilder = EmitLdtokenIL.DeclareLocal(GetType(OpCode))
locbldr115.SetLocalSymInfo("op")
EmitLdtokenIL.MarkSequencePoint(doc3, 1371, 1, 1371, 100)
Dim typ539(-1) As Type
EmitLdtokenIL.Emit(OpCodes.Ldstr, "ldtoken")
Typ = GetType(System.String)
ReDim Preserve typ539(UBound(typ539) + 1)
typ539(UBound(typ539)) = Typ
EmitLdtokenIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ539))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ539).ReturnType
EmitLdtokenIL.Emit(OpCodes.Stloc, 0)
EmitLdtokenIL.MarkSequencePoint(doc3, 1372, 1, 1372, 100)
Dim typ540(-1) As Type
EmitLdtokenIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitLdtokenIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ540(UBound(typ540) + 1)
typ540(UBound(typ540)) = Typ
EmitLdtokenIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ540(UBound(typ540) + 1)
typ540(UBound(typ540)) = Typ
EmitLdtokenIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ540))
Typ = Typ03.GetMethod("Emit", typ540).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitLdtokenIL.Emit(OpCodes.Pop)
End If
EmitLdtokenIL.MarkSequencePoint(doc3, 1373, 1, 1373, 100)
EmitLdtokenIL.Emit(OpCodes.Ret)
Dim EmitConvU As MethodBuilder = ILEmitter.DefineMethod("EmitConvU", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitConvUIL As ILGenerator = EmitConvU.GetILGenerator()
EmitConvUIL.MarkSequencePoint(doc3, 1376, 1, 1376, 100)
Dim locbldr116 As LocalBuilder = EmitConvUIL.DeclareLocal(GetType(OpCode))
locbldr116.SetLocalSymInfo("op")
EmitConvUIL.MarkSequencePoint(doc3, 1377, 1, 1377, 100)
Dim typ541(-1) As Type
EmitConvUIL.Emit(OpCodes.Ldstr, "conv.u")
Typ = GetType(System.String)
ReDim Preserve typ541(UBound(typ541) + 1)
typ541(UBound(typ541)) = Typ
EmitConvUIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ541))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ541).ReturnType
EmitConvUIL.Emit(OpCodes.Stloc, 0)
EmitConvUIL.MarkSequencePoint(doc3, 1378, 1, 1378, 100)
Dim typ542(-1) As Type
EmitConvUIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConvUIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ542(UBound(typ542) + 1)
typ542(UBound(typ542)) = Typ
EmitConvUIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ542))
Typ = Typ03.GetMethod("Emit", typ542).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConvUIL.Emit(OpCodes.Pop)
End If
EmitConvUIL.MarkSequencePoint(doc3, 1379, 1, 1379, 100)
EmitConvUIL.Emit(OpCodes.Ret)
Dim EmitConvI As MethodBuilder = ILEmitter.DefineMethod("EmitConvI", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitConvIIL As ILGenerator = EmitConvI.GetILGenerator()
EmitConvIIL.MarkSequencePoint(doc3, 1382, 1, 1382, 100)
Dim locbldr117 As LocalBuilder = EmitConvIIL.DeclareLocal(GetType(OpCode))
locbldr117.SetLocalSymInfo("op")
EmitConvIIL.MarkSequencePoint(doc3, 1383, 1, 1383, 100)
Dim typ543(-1) As Type
EmitConvIIL.Emit(OpCodes.Ldstr, "conv.i")
Typ = GetType(System.String)
ReDim Preserve typ543(UBound(typ543) + 1)
typ543(UBound(typ543)) = Typ
EmitConvIIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ543))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ543).ReturnType
EmitConvIIL.Emit(OpCodes.Stloc, 0)
EmitConvIIL.MarkSequencePoint(doc3, 1384, 1, 1384, 100)
Dim typ544(-1) As Type
EmitConvIIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConvIIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ544(UBound(typ544) + 1)
typ544(UBound(typ544)) = Typ
EmitConvIIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ544))
Typ = Typ03.GetMethod("Emit", typ544).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConvIIL.Emit(OpCodes.Pop)
End If
EmitConvIIL.MarkSequencePoint(doc3, 1385, 1, 1385, 100)
EmitConvIIL.Emit(OpCodes.Ret)
Dim EmitConvI4 As MethodBuilder = ILEmitter.DefineMethod("EmitConvI4", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EmitConvI4IL As ILGenerator = EmitConvI4.GetILGenerator()
EmitConvI4IL.MarkSequencePoint(doc3, 1388, 1, 1388, 100)
Dim locbldr118 As LocalBuilder = EmitConvI4IL.DeclareLocal(GetType(OpCode))
locbldr118.SetLocalSymInfo("op")
EmitConvI4IL.MarkSequencePoint(doc3, 1389, 1, 1389, 100)
Dim typ545(-1) As Type
EmitConvI4IL.Emit(OpCodes.Ldstr, "conv.i4")
Typ = GetType(System.String)
ReDim Preserve typ545(UBound(typ545) + 1)
typ545(UBound(typ545)) = Typ
EmitConvI4IL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ545))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ545).ReturnType
EmitConvI4IL.Emit(OpCodes.Stloc, 0)
EmitConvI4IL.MarkSequencePoint(doc3, 1390, 1, 1390, 100)
Dim typ546(-1) As Type
EmitConvI4IL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitConvI4IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ546(UBound(typ546) + 1)
typ546(UBound(typ546)) = Typ
EmitConvI4IL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ546))
Typ = Typ03.GetMethod("Emit", typ546).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitConvI4IL.Emit(OpCodes.Pop)
End If
EmitConvI4IL.MarkSequencePoint(doc3, 1391, 1, 1391, 100)
EmitConvI4IL.Emit(OpCodes.Ret)
Dim typ547(-1) As Type
ReDim Preserve typ547(UBound(typ547) + 1)
typ547(UBound(typ547)) = GetType(System.Type)
Dim EmitNewarr As MethodBuilder = ILEmitter.DefineMethod("EmitNewarr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ547)
Dim EmitNewarrIL As ILGenerator = EmitNewarr.GetILGenerator()
Dim EmitNewarrparam01 As ParameterBuilder = EmitNewarr.DefineParameter(1, ParameterAttributes.None, "t")
EmitNewarrIL.MarkSequencePoint(doc3, 1394, 1, 1394, 100)
Dim locbldr119 As LocalBuilder = EmitNewarrIL.DeclareLocal(GetType(OpCode))
locbldr119.SetLocalSymInfo("op")
EmitNewarrIL.MarkSequencePoint(doc3, 1395, 1, 1395, 100)
Dim typ548(-1) As Type
EmitNewarrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNewarrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ548(UBound(typ548) + 1)
typ548(UBound(typ548)) = Typ
EmitNewarrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ548))
Typ = Typ03.GetMethod("Emit", typ548).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNewarrIL.Emit(OpCodes.Pop)
End If
EmitNewarrIL.MarkSequencePoint(doc3, 1396, 1, 1396, 100)
Dim typ549(-1) As Type
EmitNewarrIL.Emit(OpCodes.Ldstr, "newarr")
Typ = GetType(System.String)
ReDim Preserve typ549(UBound(typ549) + 1)
typ549(UBound(typ549)) = Typ
EmitNewarrIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ549))
Typ = asm.GetType("dylan.NET.Reflection.InstructionHelper").GetMethod("getOPCode", typ549).ReturnType
EmitNewarrIL.Emit(OpCodes.Stloc, 0)
EmitNewarrIL.MarkSequencePoint(doc3, 1397, 1, 1397, 100)
Dim typ550(-1) As Type
EmitNewarrIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
EmitNewarrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(OpCode)
ReDim Preserve typ550(UBound(typ550) + 1)
typ550(UBound(typ550)) = Typ
EmitNewarrIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ550(UBound(typ550) + 1)
typ550(UBound(typ550)) = Typ
EmitNewarrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Emit", typ550))
Typ = Typ03.GetMethod("Emit", typ550).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EmitNewarrIL.Emit(OpCodes.Pop)
End If
EmitNewarrIL.MarkSequencePoint(doc3, 1398, 1, 1398, 100)
EmitNewarrIL.Emit(OpCodes.Ret)
Dim typ551(-1) As Type
ReDim Preserve typ551(UBound(typ551) + 1)
typ551(UBound(typ551)) = GetType(System.String)
ReDim Preserve typ551(UBound(typ551) + 1)
typ551(UBound(typ551)) = GetType(System.Type)
Dim DeclVar As MethodBuilder = ILEmitter.DefineMethod("DeclVar", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ551)
Dim DeclVarIL As ILGenerator = DeclVar.GetILGenerator()
Dim DeclVarparam01 As ParameterBuilder = DeclVar.DefineParameter(1, ParameterAttributes.None, "name")
Dim DeclVarparam02 As ParameterBuilder = DeclVar.DefineParameter(2, ParameterAttributes.None, "typ")
DeclVarIL.MarkSequencePoint(doc3, 1402, 1, 1402, 100)
Dim locbldr120 As LocalBuilder = DeclVarIL.DeclareLocal(GetType(LocalBuilder))
locbldr120.SetLocalSymInfo("lb")
Dim typ552(-1) As Type
DeclVarIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
DeclVarIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Type)
ReDim Preserve typ552(UBound(typ552) + 1)
typ552(UBound(typ552)) = Typ
DeclVarIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("DeclareLocal", typ552))
Typ = Typ03.GetMethod("DeclareLocal", typ552).ReturnType
DeclVarIL.Emit(OpCodes.Stloc, 0)
DeclVarIL.MarkSequencePoint(doc3, 1403, 1, 1403, 100)
DeclVarIL.Emit(OpCodes.Ldsfld, DebugFlg)
Typ = DebugFlg.FieldType
DeclVarIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa275 As System.Reflection.Emit.Label = DeclVarIL.DefineLabel()
Dim tru275 As System.Reflection.Emit.Label = DeclVarIL.DefineLabel()
Dim cont275 As System.Reflection.Emit.Label = DeclVarIL.DefineLabel()
DeclVarIL.Emit(OpCodes.Beq, tru275)
DeclVarIL.Emit(OpCodes.Br, fa275)
DeclVarIL.MarkLabel(tru275)
DeclVarIL.MarkSequencePoint(doc3, 1404, 1, 1404, 100)
Dim typ553(-1) As Type
DeclVarIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(LocalBuilder)
Typ03 = Typ
DeclVarIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ553(UBound(typ553) + 1)
typ553(UBound(typ553)) = Typ
DeclVarIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("SetLocalSymInfo", typ553))
Typ = Typ03.GetMethod("SetLocalSymInfo", typ553).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DeclVarIL.Emit(OpCodes.Pop)
End If
DeclVarIL.MarkSequencePoint(doc3, 1405, 1, 1405, 100)
DeclVarIL.Emit(OpCodes.Br, cont275)
DeclVarIL.MarkLabel(fa275)
DeclVarIL.Emit(OpCodes.Br, cont275)
DeclVarIL.MarkLabel(cont275)
DeclVarIL.MarkSequencePoint(doc3, 1406, 1, 1406, 100)
DeclVarIL.Emit(OpCodes.Ret)
Dim DefineLbl As MethodBuilder = ILEmitter.DefineMethod("DefineLbl", MethodAttributes.Public Or MethodAttributes.Static, GetType(Emit.Label), Type.EmptyTypes)
Dim DefineLblIL As ILGenerator = DefineLbl.GetILGenerator()
DefineLblIL.MarkSequencePoint(doc3, 1409, 1, 1409, 100)
DefineLblIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
DefineLblIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("DefineLabel", Type.EmptyTypes))
Typ = Typ03.GetMethod("DefineLabel", Type.EmptyTypes).ReturnType
DefineLblIL.MarkSequencePoint(doc3, 1410, 1, 1410, 100)
DefineLblIL.Emit(OpCodes.Ret)
Dim typ555(-1) As Type
ReDim Preserve typ555(UBound(typ555) + 1)
typ555(UBound(typ555)) = GetType(Emit.Label)
Dim MarkLbl As MethodBuilder = ILEmitter.DefineMethod("MarkLbl", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ555)
Dim MarkLblIL As ILGenerator = MarkLbl.GetILGenerator()
Dim MarkLblparam01 As ParameterBuilder = MarkLbl.DefineParameter(1, ParameterAttributes.None, "lbl")
MarkLblIL.MarkSequencePoint(doc3, 1413, 1, 1413, 100)
Dim typ556(-1) As Type
MarkLblIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
MarkLblIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(Emit.Label)
ReDim Preserve typ556(UBound(typ556) + 1)
typ556(UBound(typ556)) = Typ
MarkLblIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MarkLabel", typ556))
Typ = Typ03.GetMethod("MarkLabel", typ556).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
MarkLblIL.Emit(OpCodes.Pop)
End If
MarkLblIL.MarkSequencePoint(doc3, 1414, 1, 1414, 100)
MarkLblIL.Emit(OpCodes.Ret)
Dim typ557(-1) As Type
ReDim Preserve typ557(UBound(typ557) + 1)
typ557(UBound(typ557)) = GetType(System.Int32)
Dim MarkDbgPt As MethodBuilder = ILEmitter.DefineMethod("MarkDbgPt", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ557)
Dim MarkDbgPtIL As ILGenerator = MarkDbgPt.GetILGenerator()
Dim MarkDbgPtparam01 As ParameterBuilder = MarkDbgPt.DefineParameter(1, ParameterAttributes.None, "line")
MarkDbgPtIL.MarkSequencePoint(doc3, 1417, 1, 1417, 100)
Dim typ558(-1) As Type
MarkDbgPtIL.Emit(OpCodes.Ldsfld, ILGen)
Typ = ILGen.FieldType
Typ03 = Typ
MarkDbgPtIL.Emit(OpCodes.Ldsfld, DocWriter)
Typ = DocWriter.FieldType
ReDim Preserve typ558(UBound(typ558) + 1)
typ558(UBound(typ558)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ558(UBound(typ558) + 1)
typ558(UBound(typ558)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ558(UBound(typ558) + 1)
typ558(UBound(typ558)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ558(UBound(typ558) + 1)
typ558(UBound(typ558)) = Typ
MarkDbgPtIL.Emit(OpCodes.Ldc_I4, CInt(100))
Typ = GetType(System.Int32)
ReDim Preserve typ558(UBound(typ558) + 1)
typ558(UBound(typ558)) = Typ
MarkDbgPtIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MarkSequencePoint", typ558))
Typ = Typ03.GetMethod("MarkSequencePoint", typ558).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
MarkDbgPtIL.Emit(OpCodes.Pop)
End If
MarkDbgPtIL.MarkSequencePoint(doc3, 1418, 1, 1418, 100)
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
Dim locbldr121 As LocalBuilder = InitMtdIL.DeclareLocal(GetType(ParameterAttributes))
locbldr121.SetLocalSymInfo("rv")
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
InitMtdIL.Emit(OpCodes.Ldsfld, DocWriter)
Typ = DocWriter.FieldType
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("DocWriter"))
InitMtdIL.MarkSequencePoint(doc4, 74, 1, 74, 100)
InitMtdIL.Emit(OpCodes.Ldsfld, DebugFlg)
Typ = DebugFlg.FieldType
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("DebugFlg"))
InitMtdIL.MarkSequencePoint(doc4, 75, 1, 75, 100)
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("LocInd"))
InitMtdIL.MarkSequencePoint(doc4, 76, 1, 76, 100)
InitMtdIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg"))
Typ = asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg").FieldType
InitMtdIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa276 As System.Reflection.Emit.Label = InitMtdIL.DefineLabel()
Dim tru276 As System.Reflection.Emit.Label = InitMtdIL.DefineLabel()
Dim cont276 As System.Reflection.Emit.Label = InitMtdIL.DefineLabel()
InitMtdIL.Emit(OpCodes.Beq, tru276)
InitMtdIL.Emit(OpCodes.Br, fa276)
InitMtdIL.MarkLabel(tru276)
InitMtdIL.MarkSequencePoint(doc4, 77, 1, 77, 100)
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitMtdIL.MarkSequencePoint(doc4, 78, 1, 78, 100)
InitMtdIL.Emit(OpCodes.Br, cont276)
InitMtdIL.MarkLabel(fa276)
InitMtdIL.MarkSequencePoint(doc4, 79, 1, 79, 100)
InitMtdIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
InitMtdIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitMtdIL.MarkSequencePoint(doc4, 80, 1, 80, 100)
InitMtdIL.Emit(OpCodes.Br, cont276)
InitMtdIL.MarkLabel(cont276)
InitMtdIL.MarkSequencePoint(doc4, 81, 1, 81, 100)
InitMtdIL.Emit(OpCodes.Ret)
Dim InitConstr As MethodBuilder = AsmFactory.DefineMethod("InitConstr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim InitConstrIL As ILGenerator = InitConstr.GetILGenerator()
InitConstrIL.MarkSequencePoint(doc4, 84, 1, 84, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, CurnConB)
Typ = CurnConB.FieldType
Typ03 = Typ
InitConstrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetILGenerator", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetILGenerator", Type.EmptyTypes).ReturnType
InitConstrIL.Emit(OpCodes.Stsfld, CurnILGen)
InitConstrIL.MarkSequencePoint(doc4, 85, 1, 85, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, CurnConB)
Typ = CurnConB.FieldType
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("Constr"))
InitConstrIL.MarkSequencePoint(doc4, 86, 1, 86, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, CurnILGen)
Typ = CurnILGen.FieldType
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ILGen"))
InitConstrIL.MarkSequencePoint(doc4, 87, 1, 87, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, DocWriter)
Typ = DocWriter.FieldType
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("DocWriter"))
InitConstrIL.MarkSequencePoint(doc4, 88, 1, 88, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, DebugFlg)
Typ = DebugFlg.FieldType
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("DebugFlg"))
InitConstrIL.MarkSequencePoint(doc4, 89, 1, 89, 100)
InitConstrIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("LocInd"))
InitConstrIL.MarkSequencePoint(doc4, 90, 1, 90, 100)
InitConstrIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg"))
Typ = asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("StaticFlg").FieldType
InitConstrIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa277 As System.Reflection.Emit.Label = InitConstrIL.DefineLabel()
Dim tru277 As System.Reflection.Emit.Label = InitConstrIL.DefineLabel()
Dim cont277 As System.Reflection.Emit.Label = InitConstrIL.DefineLabel()
InitConstrIL.Emit(OpCodes.Beq, tru277)
InitConstrIL.Emit(OpCodes.Br, fa277)
InitConstrIL.MarkLabel(tru277)
InitConstrIL.MarkSequencePoint(doc4, 91, 1, 91, 100)
InitConstrIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitConstrIL.MarkSequencePoint(doc4, 92, 1, 92, 100)
InitConstrIL.Emit(OpCodes.Br, cont277)
InitConstrIL.MarkLabel(fa277)
InitConstrIL.MarkSequencePoint(doc4, 93, 1, 93, 100)
InitConstrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
InitConstrIL.Emit(OpCodes.Stsfld, asm.GetType("dylan.NET.Reflection.ILEmitter").GetField("ArgInd"))
InitConstrIL.MarkSequencePoint(doc4, 94, 1, 94, 100)
InitConstrIL.Emit(OpCodes.Br, cont277)
InitConstrIL.MarkLabel(cont277)
InitConstrIL.MarkSequencePoint(doc4, 95, 1, 95, 100)
InitConstrIL.Emit(OpCodes.Ret)
Dim typ4(-1) As Type
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = GetType(TypeBuilder)
Dim AddTypB As MethodBuilder = AsmFactory.DefineMethod("AddTypB", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ4)
Dim AddTypBIL As ILGenerator = AddTypB.GetILGenerator()
Dim AddTypBparam01 As ParameterBuilder = AddTypB.DefineParameter(1, ParameterAttributes.None, "typ")
AddTypBIL.MarkSequencePoint(doc4, 100, 1, 100, 100)
Dim locbldr122 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr122.SetLocalSymInfo("len")
AddTypBIL.Emit(OpCodes.Ldsfld, CurnTypList)
Typ = CurnTypList.FieldType
AddTypBIL.Emit(OpCodes.Ldlen)
AddTypBIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Stloc, 0)
AddTypBIL.MarkSequencePoint(doc4, 101, 1, 101, 100)
Dim locbldr123 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr123.SetLocalSymInfo("destl")
AddTypBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Add)
AddTypBIL.Emit(OpCodes.Stloc, 1)
AddTypBIL.MarkSequencePoint(doc4, 102, 1, 102, 100)
Dim locbldr124 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr124.SetLocalSymInfo("stopel")
AddTypBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Sub)
AddTypBIL.Emit(OpCodes.Stloc, 2)
AddTypBIL.MarkSequencePoint(doc4, 103, 1, 103, 100)
Dim locbldr125 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(System.Int32))
locbldr125.SetLocalSymInfo("i")
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Stloc, 3)
AddTypBIL.MarkSequencePoint(doc4, 105, 1, 105, 100)
Dim locbldr126 As LocalBuilder = AddTypBIL.DeclareLocal(GetType(TypeBuilder).MakeArrayType())
locbldr126.SetLocalSymInfo("destarr")
AddTypBIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Conv_U)
AddTypBIL.Emit(OpCodes.Newarr, GetType(TypeBuilder))
AddTypBIL.Emit(OpCodes.Stloc, 4)
AddTypBIL.MarkSequencePoint(doc4, 107, 1, 107, 100)
Dim label0 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.MarkSequencePoint(doc4, 108, 1, 108, 100)
Dim label1 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.MarkSequencePoint(doc4, 110, 1, 110, 100)
AddTypBIL.MarkLabel(label0)
AddTypBIL.MarkSequencePoint(doc4, 112, 1, 112, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Add)
AddTypBIL.Emit(OpCodes.Stloc, 3)
AddTypBIL.MarkSequencePoint(doc4, 114, 1, 114, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa278 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim tru278 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim cont278 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.Emit(OpCodes.Bgt, tru278)
AddTypBIL.Emit(OpCodes.Br, fa278)
AddTypBIL.MarkLabel(tru278)
AddTypBIL.MarkSequencePoint(doc4, 116, 1, 116, 100)
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
AddTypBIL.MarkSequencePoint(doc4, 118, 1, 118, 100)
AddTypBIL.Emit(OpCodes.Br, cont278)
AddTypBIL.MarkLabel(fa278)
AddTypBIL.Emit(OpCodes.Br, cont278)
AddTypBIL.MarkLabel(cont278)
AddTypBIL.MarkSequencePoint(doc4, 120, 1, 120, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa279 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim tru279 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim cont279 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.Emit(OpCodes.Beq, tru279)
AddTypBIL.Emit(OpCodes.Br, fa279)
AddTypBIL.MarkLabel(tru279)
AddTypBIL.MarkSequencePoint(doc4, 121, 1, 121, 100)
AddTypBIL.Emit(OpCodes.Br, label1)
AddTypBIL.MarkSequencePoint(doc4, 122, 1, 122, 100)
AddTypBIL.Emit(OpCodes.Br, cont279)
AddTypBIL.MarkLabel(fa279)
AddTypBIL.MarkSequencePoint(doc4, 123, 1, 123, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddTypBIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa280 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim tru280 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
Dim cont280 As System.Reflection.Emit.Label = AddTypBIL.DefineLabel()
AddTypBIL.Emit(OpCodes.Beq, fa280)
AddTypBIL.Emit(OpCodes.Br, tru280)
AddTypBIL.MarkLabel(tru280)
AddTypBIL.MarkSequencePoint(doc4, 124, 1, 124, 100)
AddTypBIL.Emit(OpCodes.Br, label0)
AddTypBIL.MarkSequencePoint(doc4, 125, 1, 125, 100)
AddTypBIL.Emit(OpCodes.Br, cont280)
AddTypBIL.MarkLabel(fa280)
AddTypBIL.MarkSequencePoint(doc4, 126, 1, 126, 100)
AddTypBIL.Emit(OpCodes.Br, label1)
AddTypBIL.MarkSequencePoint(doc4, 127, 1, 127, 100)
AddTypBIL.Emit(OpCodes.Br, cont280)
AddTypBIL.MarkLabel(cont280)
AddTypBIL.MarkSequencePoint(doc4, 128, 1, 128, 100)
AddTypBIL.Emit(OpCodes.Br, cont279)
AddTypBIL.MarkLabel(cont279)
AddTypBIL.MarkSequencePoint(doc4, 130, 1, 130, 100)
AddTypBIL.MarkLabel(label1)
AddTypBIL.MarkSequencePoint(doc4, 132, 1, 132, 100)
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
AddTypBIL.MarkSequencePoint(doc4, 134, 1, 134, 100)
AddTypBIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(TypeBuilder).MakeArrayType()
AddTypBIL.Emit(OpCodes.Stsfld, CurnTypList)
AddTypBIL.MarkSequencePoint(doc4, 136, 1, 136, 100)
AddTypBIL.Emit(OpCodes.Ret)
Dim typ5(-1) As Type
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = GetType(System.Type)
Dim AddTyp As MethodBuilder = AsmFactory.DefineMethod("AddTyp", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ5)
Dim AddTypIL As ILGenerator = AddTyp.GetILGenerator()
Dim AddTypparam01 As ParameterBuilder = AddTyp.DefineParameter(1, ParameterAttributes.None, "typ")
AddTypIL.MarkSequencePoint(doc4, 140, 1, 140, 100)
Dim locbldr127 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr127.SetLocalSymInfo("len")
AddTypIL.Emit(OpCodes.Ldsfld, TypArr)
Typ = TypArr.FieldType
AddTypIL.Emit(OpCodes.Ldlen)
AddTypIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Stloc, 0)
AddTypIL.MarkSequencePoint(doc4, 141, 1, 141, 100)
Dim locbldr128 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr128.SetLocalSymInfo("destl")
AddTypIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Add)
AddTypIL.Emit(OpCodes.Stloc, 1)
AddTypIL.MarkSequencePoint(doc4, 142, 1, 142, 100)
Dim locbldr129 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr129.SetLocalSymInfo("stopel")
AddTypIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Sub)
AddTypIL.Emit(OpCodes.Stloc, 2)
AddTypIL.MarkSequencePoint(doc4, 143, 1, 143, 100)
Dim locbldr130 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Int32))
locbldr130.SetLocalSymInfo("i")
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Stloc, 3)
AddTypIL.MarkSequencePoint(doc4, 145, 1, 145, 100)
Dim locbldr131 As LocalBuilder = AddTypIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr131.SetLocalSymInfo("destarr")
AddTypIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Conv_U)
AddTypIL.Emit(OpCodes.Newarr, GetType(System.Type))
AddTypIL.Emit(OpCodes.Stloc, 4)
AddTypIL.MarkSequencePoint(doc4, 147, 1, 147, 100)
Dim label2 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.MarkSequencePoint(doc4, 148, 1, 148, 100)
Dim label3 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.MarkSequencePoint(doc4, 150, 1, 150, 100)
AddTypIL.MarkLabel(label2)
AddTypIL.MarkSequencePoint(doc4, 152, 1, 152, 100)
AddTypIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Add)
AddTypIL.Emit(OpCodes.Stloc, 3)
AddTypIL.MarkSequencePoint(doc4, 154, 1, 154, 100)
AddTypIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa281 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim tru281 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim cont281 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.Emit(OpCodes.Bgt, tru281)
AddTypIL.Emit(OpCodes.Br, fa281)
AddTypIL.MarkLabel(tru281)
AddTypIL.MarkSequencePoint(doc4, 156, 1, 156, 100)
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
AddTypIL.MarkSequencePoint(doc4, 158, 1, 158, 100)
AddTypIL.Emit(OpCodes.Br, cont281)
AddTypIL.MarkLabel(fa281)
AddTypIL.Emit(OpCodes.Br, cont281)
AddTypIL.MarkLabel(cont281)
AddTypIL.MarkSequencePoint(doc4, 160, 1, 160, 100)
AddTypIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa282 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim tru282 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim cont282 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.Emit(OpCodes.Beq, tru282)
AddTypIL.Emit(OpCodes.Br, fa282)
AddTypIL.MarkLabel(tru282)
AddTypIL.MarkSequencePoint(doc4, 161, 1, 161, 100)
AddTypIL.Emit(OpCodes.Br, label3)
AddTypIL.MarkSequencePoint(doc4, 162, 1, 162, 100)
AddTypIL.Emit(OpCodes.Br, cont282)
AddTypIL.MarkLabel(fa282)
AddTypIL.MarkSequencePoint(doc4, 163, 1, 163, 100)
AddTypIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddTypIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa283 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim tru283 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
Dim cont283 As System.Reflection.Emit.Label = AddTypIL.DefineLabel()
AddTypIL.Emit(OpCodes.Beq, fa283)
AddTypIL.Emit(OpCodes.Br, tru283)
AddTypIL.MarkLabel(tru283)
AddTypIL.MarkSequencePoint(doc4, 164, 1, 164, 100)
AddTypIL.Emit(OpCodes.Br, label2)
AddTypIL.MarkSequencePoint(doc4, 165, 1, 165, 100)
AddTypIL.Emit(OpCodes.Br, cont283)
AddTypIL.MarkLabel(fa283)
AddTypIL.MarkSequencePoint(doc4, 166, 1, 166, 100)
AddTypIL.Emit(OpCodes.Br, label3)
AddTypIL.MarkSequencePoint(doc4, 167, 1, 167, 100)
AddTypIL.Emit(OpCodes.Br, cont283)
AddTypIL.MarkLabel(cont283)
AddTypIL.MarkSequencePoint(doc4, 168, 1, 168, 100)
AddTypIL.Emit(OpCodes.Br, cont282)
AddTypIL.MarkLabel(cont282)
AddTypIL.MarkSequencePoint(doc4, 170, 1, 170, 100)
AddTypIL.MarkLabel(label3)
AddTypIL.MarkSequencePoint(doc4, 172, 1, 172, 100)
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
AddTypIL.MarkSequencePoint(doc4, 174, 1, 174, 100)
AddTypIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Type).MakeArrayType()
AddTypIL.Emit(OpCodes.Stsfld, TypArr)
AddTypIL.MarkSequencePoint(doc4, 176, 1, 176, 100)
AddTypIL.Emit(OpCodes.Ret)
Dim typ6(-1) As Type
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = GetType(System.String)
Dim AddGenParamName As MethodBuilder = AsmFactory.DefineMethod("AddGenParamName", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ6)
Dim AddGenParamNameIL As ILGenerator = AddGenParamName.GetILGenerator()
Dim AddGenParamNameparam01 As ParameterBuilder = AddGenParamName.DefineParameter(1, ParameterAttributes.None, "nam")
AddGenParamNameIL.MarkSequencePoint(doc4, 180, 1, 180, 100)
Dim locbldr132 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr132.SetLocalSymInfo("len")
AddGenParamNameIL.Emit(OpCodes.Ldsfld, GenParamNames)
Typ = GenParamNames.FieldType
AddGenParamNameIL.Emit(OpCodes.Ldlen)
AddGenParamNameIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Stloc, 0)
AddGenParamNameIL.MarkSequencePoint(doc4, 181, 1, 181, 100)
Dim locbldr133 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr133.SetLocalSymInfo("destl")
AddGenParamNameIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Add)
AddGenParamNameIL.Emit(OpCodes.Stloc, 1)
AddGenParamNameIL.MarkSequencePoint(doc4, 182, 1, 182, 100)
Dim locbldr134 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr134.SetLocalSymInfo("stopel")
AddGenParamNameIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Sub)
AddGenParamNameIL.Emit(OpCodes.Stloc, 2)
AddGenParamNameIL.MarkSequencePoint(doc4, 183, 1, 183, 100)
Dim locbldr135 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.Int32))
locbldr135.SetLocalSymInfo("i")
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Stloc, 3)
AddGenParamNameIL.MarkSequencePoint(doc4, 185, 1, 185, 100)
Dim locbldr136 As LocalBuilder = AddGenParamNameIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr136.SetLocalSymInfo("destarr")
AddGenParamNameIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Conv_U)
AddGenParamNameIL.Emit(OpCodes.Newarr, GetType(System.String))
AddGenParamNameIL.Emit(OpCodes.Stloc, 4)
AddGenParamNameIL.MarkSequencePoint(doc4, 187, 1, 187, 100)
Dim label4 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.MarkSequencePoint(doc4, 188, 1, 188, 100)
Dim label5 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.MarkSequencePoint(doc4, 190, 1, 190, 100)
AddGenParamNameIL.MarkLabel(label4)
AddGenParamNameIL.MarkSequencePoint(doc4, 192, 1, 192, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Add)
AddGenParamNameIL.Emit(OpCodes.Stloc, 3)
AddGenParamNameIL.MarkSequencePoint(doc4, 194, 1, 194, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa284 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim tru284 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim cont284 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.Emit(OpCodes.Bgt, tru284)
AddGenParamNameIL.Emit(OpCodes.Br, fa284)
AddGenParamNameIL.MarkLabel(tru284)
AddGenParamNameIL.MarkSequencePoint(doc4, 196, 1, 196, 100)
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
AddGenParamNameIL.MarkSequencePoint(doc4, 198, 1, 198, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont284)
AddGenParamNameIL.MarkLabel(fa284)
AddGenParamNameIL.Emit(OpCodes.Br, cont284)
AddGenParamNameIL.MarkLabel(cont284)
AddGenParamNameIL.MarkSequencePoint(doc4, 200, 1, 200, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa285 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim tru285 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim cont285 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.Emit(OpCodes.Beq, tru285)
AddGenParamNameIL.Emit(OpCodes.Br, fa285)
AddGenParamNameIL.MarkLabel(tru285)
AddGenParamNameIL.MarkSequencePoint(doc4, 201, 1, 201, 100)
AddGenParamNameIL.Emit(OpCodes.Br, label5)
AddGenParamNameIL.MarkSequencePoint(doc4, 202, 1, 202, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont285)
AddGenParamNameIL.MarkLabel(fa285)
AddGenParamNameIL.MarkSequencePoint(doc4, 203, 1, 203, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddGenParamNameIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa286 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim tru286 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
Dim cont286 As System.Reflection.Emit.Label = AddGenParamNameIL.DefineLabel()
AddGenParamNameIL.Emit(OpCodes.Beq, fa286)
AddGenParamNameIL.Emit(OpCodes.Br, tru286)
AddGenParamNameIL.MarkLabel(tru286)
AddGenParamNameIL.MarkSequencePoint(doc4, 204, 1, 204, 100)
AddGenParamNameIL.Emit(OpCodes.Br, label4)
AddGenParamNameIL.MarkSequencePoint(doc4, 205, 1, 205, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont286)
AddGenParamNameIL.MarkLabel(fa286)
AddGenParamNameIL.MarkSequencePoint(doc4, 206, 1, 206, 100)
AddGenParamNameIL.Emit(OpCodes.Br, label5)
AddGenParamNameIL.MarkSequencePoint(doc4, 207, 1, 207, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont286)
AddGenParamNameIL.MarkLabel(cont286)
AddGenParamNameIL.MarkSequencePoint(doc4, 208, 1, 208, 100)
AddGenParamNameIL.Emit(OpCodes.Br, cont285)
AddGenParamNameIL.MarkLabel(cont285)
AddGenParamNameIL.MarkSequencePoint(doc4, 210, 1, 210, 100)
AddGenParamNameIL.MarkLabel(label5)
AddGenParamNameIL.MarkSequencePoint(doc4, 212, 1, 212, 100)
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
AddGenParamNameIL.MarkSequencePoint(doc4, 214, 1, 214, 100)
AddGenParamNameIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String).MakeArrayType()
AddGenParamNameIL.Emit(OpCodes.Stsfld, GenParamNames)
AddGenParamNameIL.MarkSequencePoint(doc4, 216, 1, 216, 100)
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
Dim locbldr137 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr137.SetLocalSymInfo("len")
AddAsmIL.Emit(OpCodes.Ldsfld, Asms)
Typ = Asms.FieldType
AddAsmIL.Emit(OpCodes.Ldlen)
AddAsmIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Stloc, 0)
AddAsmIL.MarkSequencePoint(doc5, 24, 1, 24, 100)
Dim locbldr138 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr138.SetLocalSymInfo("destl")
AddAsmIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Add)
AddAsmIL.Emit(OpCodes.Stloc, 1)
AddAsmIL.MarkSequencePoint(doc5, 25, 1, 25, 100)
Dim locbldr139 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr139.SetLocalSymInfo("stopel")
AddAsmIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Sub)
AddAsmIL.Emit(OpCodes.Stloc, 2)
AddAsmIL.MarkSequencePoint(doc5, 26, 1, 26, 100)
Dim locbldr140 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(System.Int32))
locbldr140.SetLocalSymInfo("i")
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Stloc, 3)
AddAsmIL.MarkSequencePoint(doc5, 28, 1, 28, 100)
Dim locbldr141 As LocalBuilder = AddAsmIL.DeclareLocal(GetType(Assembly).MakeArrayType())
locbldr141.SetLocalSymInfo("destarr")
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
Dim fa287 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim tru287 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim cont287 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.Emit(OpCodes.Bgt, tru287)
AddAsmIL.Emit(OpCodes.Br, fa287)
AddAsmIL.MarkLabel(tru287)
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
AddAsmIL.Emit(OpCodes.Br, cont287)
AddAsmIL.MarkLabel(fa287)
AddAsmIL.Emit(OpCodes.Br, cont287)
AddAsmIL.MarkLabel(cont287)
AddAsmIL.MarkSequencePoint(doc5, 43, 1, 43, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa288 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim tru288 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim cont288 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.Emit(OpCodes.Beq, tru288)
AddAsmIL.Emit(OpCodes.Br, fa288)
AddAsmIL.MarkLabel(tru288)
AddAsmIL.MarkSequencePoint(doc5, 44, 1, 44, 100)
AddAsmIL.Emit(OpCodes.Br, label1)
AddAsmIL.MarkSequencePoint(doc5, 45, 1, 45, 100)
AddAsmIL.Emit(OpCodes.Br, cont288)
AddAsmIL.MarkLabel(fa288)
AddAsmIL.MarkSequencePoint(doc5, 46, 1, 46, 100)
AddAsmIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
AddAsmIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa289 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim tru289 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
Dim cont289 As System.Reflection.Emit.Label = AddAsmIL.DefineLabel()
AddAsmIL.Emit(OpCodes.Beq, fa289)
AddAsmIL.Emit(OpCodes.Br, tru289)
AddAsmIL.MarkLabel(tru289)
AddAsmIL.MarkSequencePoint(doc5, 47, 1, 47, 100)
AddAsmIL.Emit(OpCodes.Br, label0)
AddAsmIL.MarkSequencePoint(doc5, 48, 1, 48, 100)
AddAsmIL.Emit(OpCodes.Br, cont289)
AddAsmIL.MarkLabel(fa289)
AddAsmIL.MarkSequencePoint(doc5, 49, 1, 49, 100)
AddAsmIL.Emit(OpCodes.Br, label1)
AddAsmIL.MarkSequencePoint(doc5, 50, 1, 50, 100)
AddAsmIL.Emit(OpCodes.Br, cont289)
AddAsmIL.MarkLabel(cont289)
AddAsmIL.MarkSequencePoint(doc5, 51, 1, 51, 100)
AddAsmIL.Emit(OpCodes.Br, cont288)
AddAsmIL.MarkLabel(cont288)
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
Dim locbldr142 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr142.SetLocalSymInfo("len")
addelemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
addelemIL.Emit(OpCodes.Ldlen)
addelemIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Stloc, 0)
addelemIL.MarkSequencePoint(doc5, 64, 1, 64, 100)
Dim locbldr143 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr143.SetLocalSymInfo("destl")
addelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Add)
addelemIL.Emit(OpCodes.Stloc, 1)
addelemIL.MarkSequencePoint(doc5, 65, 1, 65, 100)
Dim locbldr144 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr144.SetLocalSymInfo("stopel")
addelemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Sub)
addelemIL.Emit(OpCodes.Stloc, 2)
addelemIL.MarkSequencePoint(doc5, 66, 1, 66, 100)
Dim locbldr145 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.Int32))
locbldr145.SetLocalSymInfo("i")
addelemIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Stloc, 3)
addelemIL.MarkSequencePoint(doc5, 68, 1, 68, 100)
Dim locbldr146 As LocalBuilder = addelemIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr146.SetLocalSymInfo("destarr")
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
Dim fa290 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim tru290 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim cont290 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.Emit(OpCodes.Bgt, tru290)
addelemIL.Emit(OpCodes.Br, fa290)
addelemIL.MarkLabel(tru290)
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
addelemIL.Emit(OpCodes.Br, cont290)
addelemIL.MarkLabel(fa290)
addelemIL.Emit(OpCodes.Br, cont290)
addelemIL.MarkLabel(cont290)
addelemIL.MarkSequencePoint(doc5, 83, 1, 83, 100)
addelemIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa291 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim tru291 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim cont291 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.Emit(OpCodes.Beq, tru291)
addelemIL.Emit(OpCodes.Br, fa291)
addelemIL.MarkLabel(tru291)
addelemIL.MarkSequencePoint(doc5, 84, 1, 84, 100)
addelemIL.Emit(OpCodes.Br, label3)
addelemIL.MarkSequencePoint(doc5, 85, 1, 85, 100)
addelemIL.Emit(OpCodes.Br, cont291)
addelemIL.MarkLabel(fa291)
addelemIL.MarkSequencePoint(doc5, 86, 1, 86, 100)
addelemIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
addelemIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa292 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim tru292 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
Dim cont292 As System.Reflection.Emit.Label = addelemIL.DefineLabel()
addelemIL.Emit(OpCodes.Beq, fa292)
addelemIL.Emit(OpCodes.Br, tru292)
addelemIL.MarkLabel(tru292)
addelemIL.MarkSequencePoint(doc5, 87, 1, 87, 100)
addelemIL.Emit(OpCodes.Br, label2)
addelemIL.MarkSequencePoint(doc5, 88, 1, 88, 100)
addelemIL.Emit(OpCodes.Br, cont292)
addelemIL.MarkLabel(fa292)
addelemIL.MarkSequencePoint(doc5, 89, 1, 89, 100)
addelemIL.Emit(OpCodes.Br, label3)
addelemIL.MarkSequencePoint(doc5, 90, 1, 90, 100)
addelemIL.Emit(OpCodes.Br, cont292)
addelemIL.MarkLabel(cont292)
addelemIL.MarkSequencePoint(doc5, 91, 1, 91, 100)
addelemIL.Emit(OpCodes.Br, cont291)
addelemIL.MarkLabel(cont291)
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
Dim locbldr147 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Type))
locbldr147.SetLocalSymInfo("typ")
LoadClassIL.Emit(OpCodes.Ldnull)
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 33, 1, 33, 100)
Dim locbldr148 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr148.SetLocalSymInfo("i")
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Stloc, 1)
LoadClassIL.MarkSequencePoint(doc6, 34, 1, 34, 100)
Dim locbldr149 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr149.SetLocalSymInfo("len")
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
Dim locbldr150 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(Assembly))
locbldr150.SetLocalSymInfo("curasm")
LoadClassIL.Emit(OpCodes.Ldnull)
LoadClassIL.Emit(OpCodes.Stloc, 3)
LoadClassIL.MarkSequencePoint(doc6, 36, 1, 36, 100)
Dim locbldr151 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr151.SetLocalSymInfo("j")
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Stloc, 4)
LoadClassIL.MarkSequencePoint(doc6, 37, 1, 37, 100)
Dim locbldr152 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Int32))
locbldr152.SetLocalSymInfo("len2")
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
Dim locbldr153 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.String))
locbldr153.SetLocalSymInfo("curns")
LoadClassIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
LoadClassIL.Emit(OpCodes.Stloc, 6)
LoadClassIL.MarkSequencePoint(doc6, 39, 1, 39, 100)
Dim locbldr154 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.String))
locbldr154.SetLocalSymInfo("tmpstr")
LoadClassIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
LoadClassIL.Emit(OpCodes.Stloc, 7)
LoadClassIL.MarkSequencePoint(doc6, 40, 1, 40, 100)
Dim locbldr155 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.Boolean))
locbldr155.SetLocalSymInfo("nest")
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
Dim locbldr156 As LocalBuilder = LoadClassIL.DeclareLocal(GetType(System.String).MakeArrayType())
locbldr156.SetLocalSymInfo("na")
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
Dim fa293 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru293 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont293 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Bgt, tru293)
LoadClassIL.Emit(OpCodes.Br, fa293)
LoadClassIL.MarkLabel(tru293)
LoadClassIL.MarkSequencePoint(doc6, 51, 1, 51, 100)
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Stloc, 8)
LoadClassIL.MarkSequencePoint(doc6, 52, 1, 52, 100)
LoadClassIL.Emit(OpCodes.Br, cont293)
LoadClassIL.MarkLabel(fa293)
LoadClassIL.Emit(OpCodes.Br, cont293)
LoadClassIL.MarkLabel(cont293)
LoadClassIL.MarkSequencePoint(doc6, 54, 1, 54, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms"))
Typ = asm.GetType("dylan.NET.Reflection.Importer").GetField("Asms").FieldType
LoadClassIL.Emit(OpCodes.Ldlen)
LoadClassIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa294 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru294 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont294 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru294)
LoadClassIL.Emit(OpCodes.Br, fa294)
LoadClassIL.MarkLabel(tru294)
LoadClassIL.MarkSequencePoint(doc6, 55, 1, 55, 100)
LoadClassIL.Emit(OpCodes.Br, label2)
LoadClassIL.MarkSequencePoint(doc6, 56, 1, 56, 100)
LoadClassIL.Emit(OpCodes.Br, cont294)
LoadClassIL.MarkLabel(fa294)
LoadClassIL.Emit(OpCodes.Br, cont294)
LoadClassIL.MarkLabel(cont294)
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
Dim fa295 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru295 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont295 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru295)
LoadClassIL.Emit(OpCodes.Br, fa295)
LoadClassIL.MarkLabel(tru295)
LoadClassIL.MarkSequencePoint(doc6, 65, 1, 65, 100)
LoadClassIL.Emit(OpCodes.Br, cont295)
LoadClassIL.MarkLabel(fa295)
LoadClassIL.MarkSequencePoint(doc6, 66, 1, 66, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa296 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru296 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont296 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru296)
LoadClassIL.Emit(OpCodes.Br, fa296)
LoadClassIL.MarkLabel(tru296)
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
LoadClassIL.Emit(OpCodes.Br, cont296)
LoadClassIL.MarkLabel(fa296)
LoadClassIL.Emit(OpCodes.Br, cont296)
LoadClassIL.MarkLabel(cont296)
LoadClassIL.MarkSequencePoint(doc6, 69, 1, 69, 100)
LoadClassIL.Emit(OpCodes.Br, label2)
LoadClassIL.MarkSequencePoint(doc6, 70, 1, 70, 100)
LoadClassIL.Emit(OpCodes.Br, cont295)
LoadClassIL.MarkLabel(cont295)
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
Dim fa297 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru297 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont297 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru297)
LoadClassIL.Emit(OpCodes.Br, fa297)
LoadClassIL.MarkLabel(tru297)
LoadClassIL.MarkSequencePoint(doc6, 80, 1, 80, 100)
LoadClassIL.Emit(OpCodes.Br, cont297)
LoadClassIL.MarkLabel(fa297)
LoadClassIL.MarkSequencePoint(doc6, 81, 1, 81, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(System.Boolean)
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa298 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru298 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont298 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru298)
LoadClassIL.Emit(OpCodes.Br, fa298)
LoadClassIL.MarkLabel(tru298)
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
LoadClassIL.Emit(OpCodes.Br, cont298)
LoadClassIL.MarkLabel(fa298)
LoadClassIL.Emit(OpCodes.Br, cont298)
LoadClassIL.MarkLabel(cont298)
LoadClassIL.MarkSequencePoint(doc6, 84, 1, 84, 100)
LoadClassIL.Emit(OpCodes.Br, label2)
LoadClassIL.MarkSequencePoint(doc6, 85, 1, 85, 100)
LoadClassIL.Emit(OpCodes.Br, cont297)
LoadClassIL.MarkLabel(cont297)
LoadClassIL.MarkSequencePoint(doc6, 87, 1, 87, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
Dim fa299 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru299 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont299 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru299)
LoadClassIL.Emit(OpCodes.Br, fa299)
LoadClassIL.MarkLabel(tru299)
LoadClassIL.MarkSequencePoint(doc6, 88, 1, 88, 100)
LoadClassIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Stloc, 4)
LoadClassIL.MarkSequencePoint(doc6, 89, 1, 89, 100)
LoadClassIL.Emit(OpCodes.Br, label4)
LoadClassIL.MarkSequencePoint(doc6, 90, 1, 90, 100)
LoadClassIL.Emit(OpCodes.Br, cont299)
LoadClassIL.MarkLabel(fa299)
LoadClassIL.MarkSequencePoint(doc6, 91, 1, 91, 100)
LoadClassIL.Emit(OpCodes.Br, label3)
LoadClassIL.MarkSequencePoint(doc6, 92, 1, 92, 100)
LoadClassIL.Emit(OpCodes.Br, cont299)
LoadClassIL.MarkLabel(cont299)
LoadClassIL.MarkSequencePoint(doc6, 94, 1, 94, 100)
LoadClassIL.MarkLabel(label4)
LoadClassIL.MarkSequencePoint(doc6, 96, 1, 96, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadClassIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa300 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru300 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont300 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru300)
LoadClassIL.Emit(OpCodes.Br, fa300)
LoadClassIL.MarkLabel(tru300)
LoadClassIL.MarkSequencePoint(doc6, 97, 1, 97, 100)
LoadClassIL.Emit(OpCodes.Br, label1)
LoadClassIL.MarkSequencePoint(doc6, 98, 1, 98, 100)
LoadClassIL.Emit(OpCodes.Br, cont300)
LoadClassIL.MarkLabel(fa300)
LoadClassIL.MarkSequencePoint(doc6, 99, 1, 99, 100)
LoadClassIL.Emit(OpCodes.Br, label0)
LoadClassIL.MarkSequencePoint(doc6, 100, 1, 100, 100)
LoadClassIL.Emit(OpCodes.Br, cont300)
LoadClassIL.MarkLabel(cont300)
LoadClassIL.MarkSequencePoint(doc6, 102, 1, 102, 100)
LoadClassIL.MarkLabel(label1)
LoadClassIL.MarkSequencePoint(doc6, 103, 1, 103, 100)
LoadClassIL.MarkLabel(label2)
LoadClassIL.MarkSequencePoint(doc6, 105, 1, 105, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
LoadClassIL.Emit(OpCodes.Ldnull)
Dim fa301 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru301 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont301 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, fa301)
LoadClassIL.Emit(OpCodes.Br, tru301)
LoadClassIL.MarkLabel(tru301)
LoadClassIL.MarkSequencePoint(doc6, 106, 1, 106, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, MakeArr)
Typ = MakeArr.FieldType
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa302 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru302 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont302 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru302)
LoadClassIL.Emit(OpCodes.Br, fa302)
LoadClassIL.MarkLabel(tru302)
LoadClassIL.MarkSequencePoint(doc6, 107, 1, 107, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeArrayType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeArrayType", Type.EmptyTypes).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 108, 1, 108, 100)
LoadClassIL.Emit(OpCodes.Br, cont302)
LoadClassIL.MarkLabel(fa302)
LoadClassIL.Emit(OpCodes.Br, cont302)
LoadClassIL.MarkLabel(cont302)
LoadClassIL.MarkSequencePoint(doc6, 109, 1, 109, 100)
LoadClassIL.Emit(OpCodes.Ldsfld, MakeRef)
Typ = MakeRef.FieldType
LoadClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa303 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim tru303 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
Dim cont303 As System.Reflection.Emit.Label = LoadClassIL.DefineLabel()
LoadClassIL.Emit(OpCodes.Beq, tru303)
LoadClassIL.Emit(OpCodes.Br, fa303)
LoadClassIL.MarkLabel(tru303)
LoadClassIL.MarkSequencePoint(doc6, 110, 1, 110, 100)
LoadClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeByRefType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeByRefType", Type.EmptyTypes).ReturnType
LoadClassIL.Emit(OpCodes.Stloc, 0)
LoadClassIL.MarkSequencePoint(doc6, 111, 1, 111, 100)
LoadClassIL.Emit(OpCodes.Br, cont303)
LoadClassIL.MarkLabel(fa303)
LoadClassIL.Emit(OpCodes.Br, cont303)
LoadClassIL.MarkLabel(cont303)
LoadClassIL.MarkSequencePoint(doc6, 112, 1, 112, 100)
LoadClassIL.Emit(OpCodes.Br, cont301)
LoadClassIL.MarkLabel(fa301)
LoadClassIL.Emit(OpCodes.Br, cont301)
LoadClassIL.MarkLabel(cont301)
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
Dim fa304 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim tru304 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim cont304 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
ProcessTypeIL.Emit(OpCodes.Beq, tru304)
ProcessTypeIL.Emit(OpCodes.Br, fa304)
ProcessTypeIL.MarkLabel(tru304)
ProcessTypeIL.MarkSequencePoint(doc6, 123, 1, 123, 100)
ProcessTypeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
ProcessTypeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeArrayType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeArrayType", Type.EmptyTypes).ReturnType
ProcessTypeIL.Emit(OpCodes.Starg, 0)
ProcessTypeIL.MarkSequencePoint(doc6, 124, 1, 124, 100)
ProcessTypeIL.Emit(OpCodes.Br, cont304)
ProcessTypeIL.MarkLabel(fa304)
ProcessTypeIL.Emit(OpCodes.Br, cont304)
ProcessTypeIL.MarkLabel(cont304)
ProcessTypeIL.MarkSequencePoint(doc6, 125, 1, 125, 100)
ProcessTypeIL.Emit(OpCodes.Ldsfld, MakeRef)
Typ = MakeRef.FieldType
ProcessTypeIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa305 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim tru305 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
Dim cont305 As System.Reflection.Emit.Label = ProcessTypeIL.DefineLabel()
ProcessTypeIL.Emit(OpCodes.Beq, tru305)
ProcessTypeIL.Emit(OpCodes.Br, fa305)
ProcessTypeIL.MarkLabel(tru305)
ProcessTypeIL.MarkSequencePoint(doc6, 126, 1, 126, 100)
ProcessTypeIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
ProcessTypeIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("MakeByRefType", Type.EmptyTypes))
Typ = Typ03.GetMethod("MakeByRefType", Type.EmptyTypes).ReturnType
ProcessTypeIL.Emit(OpCodes.Starg, 0)
ProcessTypeIL.MarkSequencePoint(doc6, 127, 1, 127, 100)
ProcessTypeIL.Emit(OpCodes.Br, cont305)
ProcessTypeIL.MarkLabel(fa305)
ProcessTypeIL.Emit(OpCodes.Br, cont305)
ProcessTypeIL.MarkLabel(cont305)
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
typ12(UBound(typ12)) = GetType(System.Type)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = GetType(System.Type).MakeArrayType()
Dim LoadMethod As MethodBuilder = Loader.DefineMethod("LoadMethod", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo), typ12)
Dim LoadMethodIL As ILGenerator = LoadMethod.GetILGenerator()
Dim LoadMethodparam01 As ParameterBuilder = LoadMethod.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadMethodparam02 As ParameterBuilder = LoadMethod.DefineParameter(2, ParameterAttributes.None, "name")
Dim LoadMethodparam03 As ParameterBuilder = LoadMethod.DefineParameter(3, ParameterAttributes.None, "typs")
LoadMethodIL.MarkSequencePoint(doc6, 137, 1, 137, 100)
Dim locbldr157 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Type))
locbldr157.SetLocalSymInfo("temptyp")
LoadMethodIL.Emit(OpCodes.Ldnull)
LoadMethodIL.Emit(OpCodes.Stloc, 0)
LoadMethodIL.MarkSequencePoint(doc6, 138, 1, 138, 100)
Dim locbldr158 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr158.SetLocalSymInfo("ints")
LoadMethodIL.Emit(OpCodes.Ldnull)
LoadMethodIL.Emit(OpCodes.Stloc, 1)
LoadMethodIL.MarkSequencePoint(doc6, 139, 1, 139, 100)
Dim locbldr159 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Int32))
locbldr159.SetLocalSymInfo("i")
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Stloc, 2)
LoadMethodIL.MarkSequencePoint(doc6, 140, 1, 140, 100)
Dim locbldr160 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(System.Int32))
locbldr160.SetLocalSymInfo("len")
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Stloc, 3)
LoadMethodIL.MarkSequencePoint(doc6, 141, 1, 141, 100)
Dim locbldr161 As LocalBuilder = LoadMethodIL.DeclareLocal(GetType(MethodInfo))
locbldr161.SetLocalSymInfo("mtdinfo")
LoadMethodIL.Emit(OpCodes.Ldnull)
LoadMethodIL.Emit(OpCodes.Stloc, 4)
LoadMethodIL.MarkSequencePoint(doc6, 143, 1, 143, 100)
Dim typ13(-1) As Type
LoadMethodIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ13))
Typ = Typ03.GetMethod("GetMethod", typ13).ReturnType
LoadMethodIL.Emit(OpCodes.Stloc, 4)
LoadMethodIL.MarkSequencePoint(doc6, 145, 1, 145, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa306 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru306 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont306 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, tru306)
LoadMethodIL.Emit(OpCodes.Br, fa306)
LoadMethodIL.MarkLabel(tru306)
LoadMethodIL.MarkSequencePoint(doc6, 147, 1, 147, 100)
LoadMethodIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetInterfaces", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetInterfaces", Type.EmptyTypes).ReturnType
LoadMethodIL.Emit(OpCodes.Stloc, 1)
LoadMethodIL.MarkSequencePoint(doc6, 149, 1, 149, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa307 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru307 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont307 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, fa307)
LoadMethodIL.Emit(OpCodes.Br, tru307)
LoadMethodIL.MarkLabel(tru307)
LoadMethodIL.MarkSequencePoint(doc6, 150, 1, 150, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodIL.Emit(OpCodes.Ldlen)
LoadMethodIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa308 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru308 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont308 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Bgt, tru308)
LoadMethodIL.Emit(OpCodes.Br, fa308)
LoadMethodIL.MarkLabel(tru308)
LoadMethodIL.MarkSequencePoint(doc6, 151, 1, 151, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Type).MakeArrayType()
LoadMethodIL.Emit(OpCodes.Ldlen)
LoadMethodIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Sub)
LoadMethodIL.Emit(OpCodes.Stloc, 3)
LoadMethodIL.MarkSequencePoint(doc6, 153, 1, 153, 100)
Dim label5 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.MarkSequencePoint(doc6, 154, 1, 154, 100)
Dim label6 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.MarkSequencePoint(doc6, 155, 1, 155, 100)
Dim label7 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.MarkSequencePoint(doc6, 157, 1, 157, 100)
LoadMethodIL.MarkLabel(label5)
LoadMethodIL.MarkSequencePoint(doc6, 159, 1, 159, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Add)
LoadMethodIL.Emit(OpCodes.Stloc, 2)
LoadMethodIL.MarkSequencePoint(doc6, 161, 1, 161, 100)
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
LoadMethodIL.MarkSequencePoint(doc6, 162, 1, 162, 100)
Dim typ15(-1) As Type
LoadMethodIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadMethodIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethod", typ15))
Typ = Typ03.GetMethod("GetMethod", typ15).ReturnType
LoadMethodIL.Emit(OpCodes.Stloc, 4)
LoadMethodIL.MarkSequencePoint(doc6, 164, 1, 164, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa309 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru309 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont309 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, tru309)
LoadMethodIL.Emit(OpCodes.Br, fa309)
LoadMethodIL.MarkLabel(tru309)
LoadMethodIL.MarkSequencePoint(doc6, 165, 1, 165, 100)
LoadMethodIL.Emit(OpCodes.Br, cont309)
LoadMethodIL.MarkLabel(fa309)
LoadMethodIL.MarkSequencePoint(doc6, 166, 1, 166, 100)
LoadMethodIL.Emit(OpCodes.Br, label7)
LoadMethodIL.MarkSequencePoint(doc6, 167, 1, 167, 100)
LoadMethodIL.Emit(OpCodes.Br, cont309)
LoadMethodIL.MarkLabel(cont309)
LoadMethodIL.MarkSequencePoint(doc6, 169, 1, 169, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
LoadMethodIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
Dim fa310 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru310 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont310 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, tru310)
LoadMethodIL.Emit(OpCodes.Br, fa310)
LoadMethodIL.MarkLabel(tru310)
LoadMethodIL.MarkSequencePoint(doc6, 170, 1, 170, 100)
LoadMethodIL.Emit(OpCodes.Br, label6)
LoadMethodIL.MarkSequencePoint(doc6, 171, 1, 171, 100)
LoadMethodIL.Emit(OpCodes.Br, cont310)
LoadMethodIL.MarkLabel(fa310)
LoadMethodIL.MarkSequencePoint(doc6, 172, 1, 172, 100)
LoadMethodIL.Emit(OpCodes.Br, label5)
LoadMethodIL.MarkSequencePoint(doc6, 173, 1, 173, 100)
LoadMethodIL.Emit(OpCodes.Br, cont310)
LoadMethodIL.MarkLabel(cont310)
LoadMethodIL.MarkSequencePoint(doc6, 175, 1, 175, 100)
LoadMethodIL.MarkLabel(label6)
LoadMethodIL.MarkSequencePoint(doc6, 176, 1, 176, 100)
LoadMethodIL.MarkLabel(label7)
LoadMethodIL.MarkSequencePoint(doc6, 178, 1, 178, 100)
LoadMethodIL.Emit(OpCodes.Br, cont308)
LoadMethodIL.MarkLabel(fa308)
LoadMethodIL.Emit(OpCodes.Br, cont308)
LoadMethodIL.MarkLabel(cont308)
LoadMethodIL.MarkSequencePoint(doc6, 179, 1, 179, 100)
LoadMethodIL.Emit(OpCodes.Br, cont307)
LoadMethodIL.MarkLabel(fa307)
LoadMethodIL.Emit(OpCodes.Br, cont307)
LoadMethodIL.MarkLabel(cont307)
LoadMethodIL.MarkSequencePoint(doc6, 181, 1, 181, 100)
LoadMethodIL.Emit(OpCodes.Br, cont306)
LoadMethodIL.MarkLabel(fa306)
LoadMethodIL.Emit(OpCodes.Br, cont306)
LoadMethodIL.MarkLabel(cont306)
LoadMethodIL.MarkSequencePoint(doc6, 183, 1, 183, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.Emit(OpCodes.Ldnull)
Dim fa311 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim tru311 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
Dim cont311 As System.Reflection.Emit.Label = LoadMethodIL.DefineLabel()
LoadMethodIL.Emit(OpCodes.Beq, fa311)
LoadMethodIL.Emit(OpCodes.Br, tru311)
LoadMethodIL.MarkLabel(tru311)
LoadMethodIL.MarkSequencePoint(doc6, 184, 1, 184, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadMethodIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ReturnType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ReturnType", Type.EmptyTypes).ReturnType
LoadMethodIL.Emit(OpCodes.Stsfld, MemberTyp)
LoadMethodIL.MarkSequencePoint(doc6, 185, 1, 185, 100)
LoadMethodIL.Emit(OpCodes.Br, cont311)
LoadMethodIL.MarkLabel(fa311)
LoadMethodIL.Emit(OpCodes.Br, cont311)
LoadMethodIL.MarkLabel(cont311)
LoadMethodIL.MarkSequencePoint(doc6, 187, 1, 187, 100)
LoadMethodIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo)
LoadMethodIL.MarkSequencePoint(doc6, 189, 1, 189, 100)
LoadMethodIL.Emit(OpCodes.Ret)
Dim typ17(-1) As Type
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = GetType(System.Type)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = GetType(System.Type).MakeArrayType()
Dim LoadCtor As MethodBuilder = Loader.DefineMethod("LoadCtor", MethodAttributes.Public Or MethodAttributes.Static, GetType(ConstructorInfo), typ17)
Dim LoadCtorIL As ILGenerator = LoadCtor.GetILGenerator()
Dim LoadCtorparam01 As ParameterBuilder = LoadCtor.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadCtorparam02 As ParameterBuilder = LoadCtor.DefineParameter(2, ParameterAttributes.None, "typs")
LoadCtorIL.MarkSequencePoint(doc6, 193, 1, 193, 100)
Dim locbldr162 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(Binder))
locbldr162.SetLocalSymInfo("nullbind")
LoadCtorIL.Emit(OpCodes.Ldnull)
LoadCtorIL.Emit(OpCodes.Stloc, 0)
LoadCtorIL.MarkSequencePoint(doc6, 194, 1, 194, 100)
Dim locbldr163 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(ParameterModifier).MakeArrayType())
locbldr163.SetLocalSymInfo("parammodifs")
LoadCtorIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadCtorIL.Emit(OpCodes.Conv_U)
LoadCtorIL.Emit(OpCodes.Newarr, GetType(ParameterModifier))
LoadCtorIL.Emit(OpCodes.Stloc, 1)
LoadCtorIL.MarkSequencePoint(doc6, 195, 1, 195, 100)
Dim locbldr164 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(BindingFlags))
locbldr164.SetLocalSymInfo("bindflgs")
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
LoadCtorIL.MarkSequencePoint(doc6, 197, 1, 197, 100)
Dim locbldr165 As LocalBuilder = LoadCtorIL.DeclareLocal(GetType(ConstructorInfo))
locbldr165.SetLocalSymInfo("ctorinf")
Dim typ18(-1) As Type
LoadCtorIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadCtorIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
LoadCtorIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetConstructor", typ18))
Typ = Typ03.GetMethod("GetConstructor", typ18).ReturnType
LoadCtorIL.Emit(OpCodes.Stloc, 3)
LoadCtorIL.MarkSequencePoint(doc6, 199, 1, 199, 100)
LoadCtorIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(ConstructorInfo)
LoadCtorIL.Emit(OpCodes.Ldnull)
Dim fa312 As System.Reflection.Emit.Label = LoadCtorIL.DefineLabel()
Dim tru312 As System.Reflection.Emit.Label = LoadCtorIL.DefineLabel()
Dim cont312 As System.Reflection.Emit.Label = LoadCtorIL.DefineLabel()
LoadCtorIL.Emit(OpCodes.Beq, fa312)
LoadCtorIL.Emit(OpCodes.Br, tru312)
LoadCtorIL.MarkLabel(tru312)
LoadCtorIL.MarkSequencePoint(doc6, 200, 1, 200, 100)
LoadCtorIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
LoadCtorIL.Emit(OpCodes.Stsfld, MemberTyp)
LoadCtorIL.MarkSequencePoint(doc6, 201, 1, 201, 100)
LoadCtorIL.Emit(OpCodes.Br, cont312)
LoadCtorIL.MarkLabel(fa312)
LoadCtorIL.Emit(OpCodes.Br, cont312)
LoadCtorIL.MarkLabel(cont312)
LoadCtorIL.MarkSequencePoint(doc6, 203, 1, 203, 100)
LoadCtorIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(ConstructorInfo)
LoadCtorIL.MarkSequencePoint(doc6, 205, 1, 205, 100)
LoadCtorIL.Emit(OpCodes.Ret)
Dim typ19(-1) As Type
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = GetType(MethodInfo).MakeArrayType()
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = GetType(MethodInfo)
Dim addelemmtdinfo As MethodBuilder = Loader.DefineMethod("addelemmtdinfo", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo).MakeArrayType(), typ19)
Dim addelemmtdinfoIL As ILGenerator = addelemmtdinfo.GetILGenerator()
Dim addelemmtdinfoparam01 As ParameterBuilder = addelemmtdinfo.DefineParameter(1, ParameterAttributes.None, "srcarr")
Dim addelemmtdinfoparam02 As ParameterBuilder = addelemmtdinfo.DefineParameter(2, ParameterAttributes.None, "eltoadd")
addelemmtdinfoIL.MarkSequencePoint(doc6, 209, 1, 209, 100)
Dim locbldr166 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr166.SetLocalSymInfo("len")
addelemmtdinfoIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(MethodInfo).MakeArrayType()
addelemmtdinfoIL.Emit(OpCodes.Ldlen)
addelemmtdinfoIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 0)
addelemmtdinfoIL.MarkSequencePoint(doc6, 210, 1, 210, 100)
Dim locbldr167 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr167.SetLocalSymInfo("destl")
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Add)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 1)
addelemmtdinfoIL.MarkSequencePoint(doc6, 211, 1, 211, 100)
Dim locbldr168 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr168.SetLocalSymInfo("stopel")
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Sub)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 2)
addelemmtdinfoIL.MarkSequencePoint(doc6, 212, 1, 212, 100)
Dim locbldr169 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(System.Int32))
locbldr169.SetLocalSymInfo("i")
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 3)
addelemmtdinfoIL.MarkSequencePoint(doc6, 214, 1, 214, 100)
Dim locbldr170 As LocalBuilder = addelemmtdinfoIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr170.SetLocalSymInfo("destarr")
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Conv_U)
addelemmtdinfoIL.Emit(OpCodes.Newarr, GetType(MethodInfo))
addelemmtdinfoIL.Emit(OpCodes.Stloc, 4)
addelemmtdinfoIL.MarkSequencePoint(doc6, 216, 1, 216, 100)
Dim label8 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.MarkSequencePoint(doc6, 217, 1, 217, 100)
Dim label9 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.MarkSequencePoint(doc6, 219, 1, 219, 100)
addelemmtdinfoIL.MarkLabel(label8)
addelemmtdinfoIL.MarkSequencePoint(doc6, 221, 1, 221, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Add)
addelemmtdinfoIL.Emit(OpCodes.Stloc, 3)
addelemmtdinfoIL.MarkSequencePoint(doc6, 223, 1, 223, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa313 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim tru313 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim cont313 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.Emit(OpCodes.Bgt, tru313)
addelemmtdinfoIL.Emit(OpCodes.Br, fa313)
addelemmtdinfoIL.MarkLabel(tru313)
addelemmtdinfoIL.MarkSequencePoint(doc6, 225, 1, 225, 100)
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
addelemmtdinfoIL.MarkSequencePoint(doc6, 227, 1, 227, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont313)
addelemmtdinfoIL.MarkLabel(fa313)
addelemmtdinfoIL.Emit(OpCodes.Br, cont313)
addelemmtdinfoIL.MarkLabel(cont313)
addelemmtdinfoIL.MarkSequencePoint(doc6, 229, 1, 229, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa314 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim tru314 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim cont314 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.Emit(OpCodes.Beq, tru314)
addelemmtdinfoIL.Emit(OpCodes.Br, fa314)
addelemmtdinfoIL.MarkLabel(tru314)
addelemmtdinfoIL.MarkSequencePoint(doc6, 230, 1, 230, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, label9)
addelemmtdinfoIL.MarkSequencePoint(doc6, 231, 1, 231, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont314)
addelemmtdinfoIL.MarkLabel(fa314)
addelemmtdinfoIL.MarkSequencePoint(doc6, 232, 1, 232, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
addelemmtdinfoIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
Dim fa315 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim tru315 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
Dim cont315 As System.Reflection.Emit.Label = addelemmtdinfoIL.DefineLabel()
addelemmtdinfoIL.Emit(OpCodes.Beq, fa315)
addelemmtdinfoIL.Emit(OpCodes.Br, tru315)
addelemmtdinfoIL.MarkLabel(tru315)
addelemmtdinfoIL.MarkSequencePoint(doc6, 233, 1, 233, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, label8)
addelemmtdinfoIL.MarkSequencePoint(doc6, 234, 1, 234, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont315)
addelemmtdinfoIL.MarkLabel(fa315)
addelemmtdinfoIL.MarkSequencePoint(doc6, 235, 1, 235, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, label9)
addelemmtdinfoIL.MarkSequencePoint(doc6, 236, 1, 236, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont315)
addelemmtdinfoIL.MarkLabel(cont315)
addelemmtdinfoIL.MarkSequencePoint(doc6, 237, 1, 237, 100)
addelemmtdinfoIL.Emit(OpCodes.Br, cont314)
addelemmtdinfoIL.MarkLabel(cont314)
addelemmtdinfoIL.MarkSequencePoint(doc6, 239, 1, 239, 100)
addelemmtdinfoIL.MarkLabel(label9)
addelemmtdinfoIL.MarkSequencePoint(doc6, 241, 1, 241, 100)
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
addelemmtdinfoIL.MarkSequencePoint(doc6, 243, 1, 243, 100)
addelemmtdinfoIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(MethodInfo).MakeArrayType()
addelemmtdinfoIL.MarkSequencePoint(doc6, 245, 1, 245, 100)
addelemmtdinfoIL.Emit(OpCodes.Ret)
Dim typ20(-1) As Type
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = GetType(System.Type)
Dim LoadSpecMtds As MethodBuilder = Loader.DefineMethod("LoadSpecMtds", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo).MakeArrayType(), typ20)
Dim LoadSpecMtdsIL As ILGenerator = LoadSpecMtds.GetILGenerator()
Dim LoadSpecMtdsparam01 As ParameterBuilder = LoadSpecMtds.DefineParameter(1, ParameterAttributes.None, "typ")
LoadSpecMtdsIL.MarkSequencePoint(doc6, 249, 1, 249, 100)
Dim locbldr171 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(System.Int32))
locbldr171.SetLocalSymInfo("i")
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 0)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 250, 1, 250, 100)
Dim locbldr172 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(MethodInfo))
locbldr172.SetLocalSymInfo("mtdinfo")
LoadSpecMtdsIL.Emit(OpCodes.Ldnull)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 1)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 251, 1, 251, 100)
Dim locbldr173 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr173.SetLocalSymInfo("mtdinfos")
LoadSpecMtdsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadSpecMtdsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetMethods", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetMethods", Type.EmptyTypes).ReturnType
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 2)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 252, 1, 252, 100)
Dim locbldr174 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr174.SetLocalSymInfo("mtdinfog")
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Conv_U)
LoadSpecMtdsIL.Emit(OpCodes.Newarr, GetType(MethodInfo))
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 3)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 253, 1, 253, 100)
Dim locbldr175 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(System.Int32))
locbldr175.SetLocalSymInfo("len")
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo).MakeArrayType()
LoadSpecMtdsIL.Emit(OpCodes.Ldlen)
LoadSpecMtdsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Sub)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 4)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 254, 1, 254, 100)
Dim locbldr176 As LocalBuilder = LoadSpecMtdsIL.DeclareLocal(GetType(System.Boolean))
locbldr176.SetLocalSymInfo("b")
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 5)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 256, 1, 256, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo).MakeArrayType()
LoadSpecMtdsIL.Emit(OpCodes.Ldlen)
LoadSpecMtdsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa316 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim tru316 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim cont316 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.Emit(OpCodes.Bgt, tru316)
LoadSpecMtdsIL.Emit(OpCodes.Br, fa316)
LoadSpecMtdsIL.MarkLabel(tru316)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 258, 1, 258, 100)
Dim label10 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.MarkSequencePoint(doc6, 259, 1, 259, 100)
Dim label11 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.MarkSequencePoint(doc6, 261, 1, 261, 100)
LoadSpecMtdsIL.MarkLabel(label10)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 263, 1, 263, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Add)
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 0)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 265, 1, 265, 100)
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
LoadSpecMtdsIL.MarkSequencePoint(doc6, 266, 1, 266, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadSpecMtdsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsSpecialName", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsSpecialName", Type.EmptyTypes).ReturnType
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 5)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 267, 1, 267, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadSpecMtdsIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa317 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim tru317 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim cont317 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.Emit(OpCodes.Beq, tru317)
LoadSpecMtdsIL.Emit(OpCodes.Br, fa317)
LoadSpecMtdsIL.MarkLabel(tru317)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 268, 1, 268, 100)
Dim typ23(-1) As Type
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(MethodInfo)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
LoadSpecMtdsIL.Emit(OpCodes.Call, addelemmtdinfo)
Typ = addelemmtdinfo.ReturnType
LoadSpecMtdsIL.Emit(OpCodes.Stloc, 3)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 269, 1, 269, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont317)
LoadSpecMtdsIL.MarkLabel(fa317)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont317)
LoadSpecMtdsIL.MarkLabel(cont317)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 272, 1, 272, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
Dim fa318 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim tru318 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
Dim cont318 As System.Reflection.Emit.Label = LoadSpecMtdsIL.DefineLabel()
LoadSpecMtdsIL.Emit(OpCodes.Beq, tru318)
LoadSpecMtdsIL.Emit(OpCodes.Br, fa318)
LoadSpecMtdsIL.MarkLabel(tru318)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 273, 1, 273, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, label11)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 274, 1, 274, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont318)
LoadSpecMtdsIL.MarkLabel(fa318)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 275, 1, 275, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, label10)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 276, 1, 276, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont318)
LoadSpecMtdsIL.MarkLabel(cont318)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 278, 1, 278, 100)
LoadSpecMtdsIL.MarkLabel(label11)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 280, 1, 280, 100)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont316)
LoadSpecMtdsIL.MarkLabel(fa316)
LoadSpecMtdsIL.Emit(OpCodes.Br, cont316)
LoadSpecMtdsIL.MarkLabel(cont316)
LoadSpecMtdsIL.MarkSequencePoint(doc6, 283, 1, 283, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadSpecMtdsIL.MarkSequencePoint(doc6, 285, 1, 285, 100)
LoadSpecMtdsIL.Emit(OpCodes.Ret)
Dim typ24(-1) As Type
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = GetType(ParameterInfo).MakeArrayType()
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = GetType(System.Type).MakeArrayType()
Dim CompareParamsToTyps As MethodBuilder = Loader.DefineMethod("CompareParamsToTyps", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Boolean), typ24)
Dim CompareParamsToTypsIL As ILGenerator = CompareParamsToTyps.GetILGenerator()
Dim CompareParamsToTypsparam01 As ParameterBuilder = CompareParamsToTyps.DefineParameter(1, ParameterAttributes.None, "t1")
Dim CompareParamsToTypsparam02 As ParameterBuilder = CompareParamsToTyps.DefineParameter(2, ParameterAttributes.None, "t2")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 289, 1, 289, 100)
Dim locbldr177 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Boolean))
locbldr177.SetLocalSymInfo("ans")
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 0)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 290, 1, 290, 100)
Dim locbldr178 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Boolean))
locbldr178.SetLocalSymInfo("b")
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 1)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 291, 1, 291, 100)
Dim locbldr179 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(ParameterInfo))
locbldr179.SetLocalSymInfo("p")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 292, 1, 292, 100)
Dim locbldr180 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Type))
locbldr180.SetLocalSymInfo("ta")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 293, 1, 293, 100)
Dim locbldr181 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Type))
locbldr181.SetLocalSymInfo("tb")
CompareParamsToTypsIL.MarkSequencePoint(doc6, 295, 1, 295, 100)
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
Dim fa319 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim tru319 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim cont319 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.Emit(OpCodes.Beq, tru319)
CompareParamsToTypsIL.Emit(OpCodes.Br, fa319)
CompareParamsToTypsIL.MarkLabel(tru319)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 297, 1, 297, 100)
Dim locbldr182 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Int32))
locbldr182.SetLocalSymInfo("i")
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 5)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 298, 1, 298, 100)
Dim locbldr183 As LocalBuilder = CompareParamsToTypsIL.DeclareLocal(GetType(System.Int32))
locbldr183.SetLocalSymInfo("len")
CompareParamsToTypsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(ParameterInfo).MakeArrayType()
CompareParamsToTypsIL.Emit(OpCodes.Ldlen)
CompareParamsToTypsIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Sub)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 6)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 300, 1, 300, 100)
Dim label12 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.MarkSequencePoint(doc6, 301, 1, 301, 100)
Dim label13 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.MarkSequencePoint(doc6, 303, 1, 303, 100)
CompareParamsToTypsIL.MarkLabel(label12)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 305, 1, 305, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Add)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 5)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 307, 1, 307, 100)
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
CompareParamsToTypsIL.MarkSequencePoint(doc6, 308, 1, 308, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(ParameterInfo)
Typ03 = Typ
CompareParamsToTypsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ParameterType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ParameterType", Type.EmptyTypes).ReturnType
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 3)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 309, 1, 309, 100)
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
CompareParamsToTypsIL.MarkSequencePoint(doc6, 310, 1, 310, 100)
Dim typ26(-1) As Type
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Type)
Typ03 = Typ
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Type)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
CompareParamsToTypsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ26))
Typ = Typ03.GetMethod("Equals", typ26).ReturnType
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 1)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 312, 1, 312, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
Dim fa320 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim tru320 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim cont320 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.Emit(OpCodes.Beq, tru320)
CompareParamsToTypsIL.Emit(OpCodes.Br, fa320)
CompareParamsToTypsIL.MarkLabel(tru320)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 313, 1, 313, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 0)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 314, 1, 314, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, label13)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 315, 1, 315, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont320)
CompareParamsToTypsIL.MarkLabel(fa320)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont320)
CompareParamsToTypsIL.MarkLabel(cont320)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 317, 1, 317, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Int32)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Int32)
Dim fa321 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim tru321 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
Dim cont321 As System.Reflection.Emit.Label = CompareParamsToTypsIL.DefineLabel()
CompareParamsToTypsIL.Emit(OpCodes.Beq, tru321)
CompareParamsToTypsIL.Emit(OpCodes.Br, fa321)
CompareParamsToTypsIL.MarkLabel(tru321)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 318, 1, 318, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, label13)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 319, 1, 319, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont321)
CompareParamsToTypsIL.MarkLabel(fa321)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 320, 1, 320, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, label12)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 321, 1, 321, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont321)
CompareParamsToTypsIL.MarkLabel(cont321)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 323, 1, 323, 100)
CompareParamsToTypsIL.MarkLabel(label13)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 325, 1, 325, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont319)
CompareParamsToTypsIL.MarkLabel(fa319)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 326, 1, 326, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.Emit(OpCodes.Stloc, 0)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 327, 1, 327, 100)
CompareParamsToTypsIL.Emit(OpCodes.Br, cont319)
CompareParamsToTypsIL.MarkLabel(cont319)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 329, 1, 329, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
CompareParamsToTypsIL.MarkSequencePoint(doc6, 330, 1, 330, 100)
CompareParamsToTypsIL.Emit(OpCodes.Ret)
Dim typ27(-1) As Type
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = GetType(System.Type)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = GetType(System.Type)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = GetType(System.Type)
Dim LoadBinOp As MethodBuilder = Loader.DefineMethod("LoadBinOp", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo), typ27)
Dim LoadBinOpIL As ILGenerator = LoadBinOp.GetILGenerator()
Dim LoadBinOpparam01 As ParameterBuilder = LoadBinOp.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadBinOpparam02 As ParameterBuilder = LoadBinOp.DefineParameter(2, ParameterAttributes.None, "name")
Dim LoadBinOpparam03 As ParameterBuilder = LoadBinOp.DefineParameter(3, ParameterAttributes.None, "typa")
Dim LoadBinOpparam04 As ParameterBuilder = LoadBinOp.DefineParameter(4, ParameterAttributes.None, "typb")
LoadBinOpIL.MarkSequencePoint(doc6, 334, 1, 334, 100)
Dim locbldr184 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr184.SetLocalSymInfo("typs")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Conv_U)
LoadBinOpIL.Emit(OpCodes.Newarr, GetType(System.Type))
LoadBinOpIL.Emit(OpCodes.Stloc, 0)
LoadBinOpIL.MarkSequencePoint(doc6, 335, 1, 335, 100)
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
LoadBinOpIL.MarkSequencePoint(doc6, 336, 1, 336, 100)
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
LoadBinOpIL.MarkSequencePoint(doc6, 337, 1, 337, 100)
Dim locbldr185 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Int32))
locbldr185.SetLocalSymInfo("i")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Stloc, 1)
LoadBinOpIL.MarkSequencePoint(doc6, 338, 1, 338, 100)
Dim locbldr186 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(MethodInfo))
locbldr186.SetLocalSymInfo("mtdinfo")
LoadBinOpIL.Emit(OpCodes.Ldnull)
LoadBinOpIL.Emit(OpCodes.Stloc, 2)
LoadBinOpIL.MarkSequencePoint(doc6, 339, 1, 339, 100)
Dim locbldr187 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr187.SetLocalSymInfo("mtdinfos")
Dim typ28(-1) As Type
LoadBinOpIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
LoadBinOpIL.Emit(OpCodes.Call, LoadSpecMtds)
Typ = LoadSpecMtds.ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 3)
LoadBinOpIL.MarkSequencePoint(doc6, 340, 1, 340, 100)
Dim locbldr188 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Int32))
locbldr188.SetLocalSymInfo("len")
LoadBinOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadBinOpIL.Emit(OpCodes.Ldlen)
LoadBinOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Sub)
LoadBinOpIL.Emit(OpCodes.Stloc, 4)
LoadBinOpIL.MarkSequencePoint(doc6, 341, 1, 341, 100)
Dim locbldr189 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Boolean))
locbldr189.SetLocalSymInfo("b")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadBinOpIL.Emit(OpCodes.Stloc, 5)
LoadBinOpIL.MarkSequencePoint(doc6, 342, 1, 342, 100)
Dim locbldr190 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.Int32))
locbldr190.SetLocalSymInfo("comp")
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Stloc, 6)
LoadBinOpIL.MarkSequencePoint(doc6, 343, 1, 343, 100)
Dim locbldr191 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(System.String))
locbldr191.SetLocalSymInfo("nstr")
LoadBinOpIL.MarkSequencePoint(doc6, 344, 1, 344, 100)
Dim locbldr192 As LocalBuilder = LoadBinOpIL.DeclareLocal(GetType(ParameterInfo).MakeArrayType())
locbldr192.SetLocalSymInfo("ps")
LoadBinOpIL.MarkSequencePoint(doc6, 346, 1, 346, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadBinOpIL.Emit(OpCodes.Ldlen)
LoadBinOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa322 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru322 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont322 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Bgt, tru322)
LoadBinOpIL.Emit(OpCodes.Br, fa322)
LoadBinOpIL.MarkLabel(tru322)
LoadBinOpIL.MarkSequencePoint(doc6, 348, 1, 348, 100)
Dim label14 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.MarkSequencePoint(doc6, 349, 1, 349, 100)
Dim label15 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.MarkSequencePoint(doc6, 351, 1, 351, 100)
LoadBinOpIL.MarkLabel(label14)
LoadBinOpIL.MarkSequencePoint(doc6, 353, 1, 353, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Add)
LoadBinOpIL.Emit(OpCodes.Stloc, 1)
LoadBinOpIL.MarkSequencePoint(doc6, 355, 1, 355, 100)
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
LoadBinOpIL.MarkSequencePoint(doc6, 356, 1, 356, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadBinOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Name", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Name", Type.EmptyTypes).ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 7)
LoadBinOpIL.MarkSequencePoint(doc6, 357, 1, 357, 100)
Dim typ30(-1) As Type
LoadBinOpIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
LoadBinOpIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
LoadBinOpIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ30))
Typ = GetType(String).GetMethod("Compare", typ30).ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 6)
LoadBinOpIL.MarkSequencePoint(doc6, 359, 1, 359, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa323 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru323 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont323 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Beq, tru323)
LoadBinOpIL.Emit(OpCodes.Br, fa323)
LoadBinOpIL.MarkLabel(tru323)
LoadBinOpIL.MarkSequencePoint(doc6, 361, 1, 361, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadBinOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetParameters", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetParameters", Type.EmptyTypes).ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 8)
LoadBinOpIL.MarkSequencePoint(doc6, 362, 1, 362, 100)
Dim typ32(-1) As Type
LoadBinOpIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(ParameterInfo).MakeArrayType()
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
LoadBinOpIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
LoadBinOpIL.Emit(OpCodes.Call, CompareParamsToTyps)
Typ = CompareParamsToTyps.ReturnType
LoadBinOpIL.Emit(OpCodes.Stloc, 5)
LoadBinOpIL.MarkSequencePoint(doc6, 364, 1, 364, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadBinOpIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa324 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru324 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont324 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Beq, tru324)
LoadBinOpIL.Emit(OpCodes.Br, fa324)
LoadBinOpIL.MarkLabel(tru324)
LoadBinOpIL.MarkSequencePoint(doc6, 365, 1, 365, 100)
LoadBinOpIL.Emit(OpCodes.Br, label15)
LoadBinOpIL.MarkSequencePoint(doc6, 366, 1, 366, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont324)
LoadBinOpIL.MarkLabel(fa324)
LoadBinOpIL.MarkSequencePoint(doc6, 367, 1, 367, 100)
LoadBinOpIL.Emit(OpCodes.Ldnull)
LoadBinOpIL.Emit(OpCodes.Stloc, 2)
LoadBinOpIL.MarkSequencePoint(doc6, 368, 1, 368, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont324)
LoadBinOpIL.MarkLabel(cont324)
LoadBinOpIL.MarkSequencePoint(doc6, 370, 1, 370, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont323)
LoadBinOpIL.MarkLabel(fa323)
LoadBinOpIL.MarkSequencePoint(doc6, 371, 1, 371, 100)
LoadBinOpIL.Emit(OpCodes.Ldnull)
LoadBinOpIL.Emit(OpCodes.Stloc, 2)
LoadBinOpIL.MarkSequencePoint(doc6, 372, 1, 372, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont323)
LoadBinOpIL.MarkLabel(cont323)
LoadBinOpIL.MarkSequencePoint(doc6, 374, 1, 374, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadBinOpIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
Dim fa325 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim tru325 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
Dim cont325 As System.Reflection.Emit.Label = LoadBinOpIL.DefineLabel()
LoadBinOpIL.Emit(OpCodes.Beq, tru325)
LoadBinOpIL.Emit(OpCodes.Br, fa325)
LoadBinOpIL.MarkLabel(tru325)
LoadBinOpIL.MarkSequencePoint(doc6, 375, 1, 375, 100)
LoadBinOpIL.Emit(OpCodes.Br, label15)
LoadBinOpIL.MarkSequencePoint(doc6, 376, 1, 376, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont325)
LoadBinOpIL.MarkLabel(fa325)
LoadBinOpIL.MarkSequencePoint(doc6, 377, 1, 377, 100)
LoadBinOpIL.Emit(OpCodes.Br, label14)
LoadBinOpIL.MarkSequencePoint(doc6, 378, 1, 378, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont325)
LoadBinOpIL.MarkLabel(cont325)
LoadBinOpIL.MarkSequencePoint(doc6, 380, 1, 380, 100)
LoadBinOpIL.MarkLabel(label15)
LoadBinOpIL.MarkSequencePoint(doc6, 382, 1, 382, 100)
LoadBinOpIL.Emit(OpCodes.Br, cont322)
LoadBinOpIL.MarkLabel(fa322)
LoadBinOpIL.Emit(OpCodes.Br, cont322)
LoadBinOpIL.MarkLabel(cont322)
LoadBinOpIL.MarkSequencePoint(doc6, 385, 1, 385, 100)
LoadBinOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
LoadBinOpIL.MarkSequencePoint(doc6, 387, 1, 387, 100)
LoadBinOpIL.Emit(OpCodes.Ret)
Dim typ33(-1) As Type
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = GetType(System.Type)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = GetType(System.String)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = GetType(System.Type)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = GetType(System.Type)
Dim LoadConvOp As MethodBuilder = Loader.DefineMethod("LoadConvOp", MethodAttributes.Public Or MethodAttributes.Static, GetType(MethodInfo), typ33)
Dim LoadConvOpIL As ILGenerator = LoadConvOp.GetILGenerator()
Dim LoadConvOpparam01 As ParameterBuilder = LoadConvOp.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadConvOpparam02 As ParameterBuilder = LoadConvOp.DefineParameter(2, ParameterAttributes.None, "name")
Dim LoadConvOpparam03 As ParameterBuilder = LoadConvOp.DefineParameter(3, ParameterAttributes.None, "src")
Dim LoadConvOpparam04 As ParameterBuilder = LoadConvOp.DefineParameter(4, ParameterAttributes.None, "snk")
LoadConvOpIL.MarkSequencePoint(doc6, 391, 1, 391, 100)
Dim locbldr193 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr193.SetLocalSymInfo("typs")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Conv_U)
LoadConvOpIL.Emit(OpCodes.Newarr, GetType(System.Type))
LoadConvOpIL.Emit(OpCodes.Stloc, 0)
LoadConvOpIL.MarkSequencePoint(doc6, 392, 1, 392, 100)
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
LoadConvOpIL.MarkSequencePoint(doc6, 393, 1, 393, 100)
Dim locbldr194 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Int32))
locbldr194.SetLocalSymInfo("i")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Stloc, 1)
LoadConvOpIL.MarkSequencePoint(doc6, 394, 1, 394, 100)
Dim locbldr195 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(MethodInfo))
locbldr195.SetLocalSymInfo("mtdinfo")
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 395, 1, 395, 100)
Dim locbldr196 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(MethodInfo).MakeArrayType())
locbldr196.SetLocalSymInfo("mtdinfos")
Dim typ34(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
LoadConvOpIL.Emit(OpCodes.Call, LoadSpecMtds)
Typ = LoadSpecMtds.ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 3)
LoadConvOpIL.MarkSequencePoint(doc6, 396, 1, 396, 100)
Dim locbldr197 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Int32))
locbldr197.SetLocalSymInfo("len")
LoadConvOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadConvOpIL.Emit(OpCodes.Ldlen)
LoadConvOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Sub)
LoadConvOpIL.Emit(OpCodes.Stloc, 4)
LoadConvOpIL.MarkSequencePoint(doc6, 397, 1, 397, 100)
Dim locbldr198 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Boolean))
locbldr198.SetLocalSymInfo("b")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Boolean)
LoadConvOpIL.Emit(OpCodes.Stloc, 5)
LoadConvOpIL.MarkSequencePoint(doc6, 398, 1, 398, 100)
Dim locbldr199 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Int32))
locbldr199.SetLocalSymInfo("comp")
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Stloc, 6)
LoadConvOpIL.MarkSequencePoint(doc6, 399, 1, 399, 100)
Dim locbldr200 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.String))
locbldr200.SetLocalSymInfo("nstr")
LoadConvOpIL.MarkSequencePoint(doc6, 400, 1, 400, 100)
Dim locbldr201 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(ParameterInfo).MakeArrayType())
locbldr201.SetLocalSymInfo("ps")
LoadConvOpIL.MarkSequencePoint(doc6, 401, 1, 401, 100)
Dim locbldr202 As LocalBuilder = LoadConvOpIL.DeclareLocal(GetType(System.Type))
locbldr202.SetLocalSymInfo("rett")
LoadConvOpIL.MarkSequencePoint(doc6, 403, 1, 403, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(MethodInfo).MakeArrayType()
LoadConvOpIL.Emit(OpCodes.Ldlen)
LoadConvOpIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa326 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru326 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont326 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Bgt, tru326)
LoadConvOpIL.Emit(OpCodes.Br, fa326)
LoadConvOpIL.MarkLabel(tru326)
LoadConvOpIL.MarkSequencePoint(doc6, 405, 1, 405, 100)
Dim label16 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.MarkSequencePoint(doc6, 406, 1, 406, 100)
Dim label17 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.MarkSequencePoint(doc6, 408, 1, 408, 100)
LoadConvOpIL.MarkLabel(label16)
LoadConvOpIL.MarkSequencePoint(doc6, 410, 1, 410, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Add)
LoadConvOpIL.Emit(OpCodes.Stloc, 1)
LoadConvOpIL.MarkSequencePoint(doc6, 412, 1, 412, 100)
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
LoadConvOpIL.MarkSequencePoint(doc6, 413, 1, 413, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Name", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Name", Type.EmptyTypes).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 7)
LoadConvOpIL.MarkSequencePoint(doc6, 414, 1, 414, 100)
Dim typ36(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.String)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
LoadConvOpIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
LoadConvOpIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ36))
Typ = GetType(String).GetMethod("Compare", typ36).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 6)
LoadConvOpIL.MarkSequencePoint(doc6, 416, 1, 416, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa327 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru327 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont327 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru327)
LoadConvOpIL.Emit(OpCodes.Br, fa327)
LoadConvOpIL.MarkLabel(tru327)
LoadConvOpIL.MarkSequencePoint(doc6, 418, 1, 418, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetParameters", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetParameters", Type.EmptyTypes).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 8)
LoadConvOpIL.MarkSequencePoint(doc6, 419, 1, 419, 100)
Dim typ38(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(ParameterInfo).MakeArrayType()
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
LoadConvOpIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Type).MakeArrayType()
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
LoadConvOpIL.Emit(OpCodes.Call, CompareParamsToTyps)
Typ = CompareParamsToTyps.ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 5)
LoadConvOpIL.MarkSequencePoint(doc6, 421, 1, 421, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa328 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru328 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont328 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru328)
LoadConvOpIL.Emit(OpCodes.Br, fa328)
LoadConvOpIL.MarkLabel(tru328)
LoadConvOpIL.MarkSequencePoint(doc6, 423, 1, 423, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ReturnType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ReturnType", Type.EmptyTypes).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 9)
LoadConvOpIL.MarkSequencePoint(doc6, 424, 1, 424, 100)
Dim typ40(-1) As Type
LoadConvOpIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.Type)
Typ03 = Typ
LoadConvOpIL.Emit(OpCodes.Ldarg, 3)
Typ = GetType(System.Type)
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = Typ
LoadConvOpIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Equals", typ40))
Typ = Typ03.GetMethod("Equals", typ40).ReturnType
LoadConvOpIL.Emit(OpCodes.Stloc, 5)
LoadConvOpIL.MarkSequencePoint(doc6, 426, 1, 426, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
LoadConvOpIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa329 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru329 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont329 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru329)
LoadConvOpIL.Emit(OpCodes.Br, fa329)
LoadConvOpIL.MarkLabel(tru329)
LoadConvOpIL.MarkSequencePoint(doc6, 427, 1, 427, 100)
LoadConvOpIL.Emit(OpCodes.Br, label17)
LoadConvOpIL.MarkSequencePoint(doc6, 428, 1, 428, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont329)
LoadConvOpIL.MarkLabel(fa329)
LoadConvOpIL.MarkSequencePoint(doc6, 429, 1, 429, 100)
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 430, 1, 430, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont329)
LoadConvOpIL.MarkLabel(cont329)
LoadConvOpIL.MarkSequencePoint(doc6, 432, 1, 432, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont328)
LoadConvOpIL.MarkLabel(fa328)
LoadConvOpIL.MarkSequencePoint(doc6, 433, 1, 433, 100)
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 434, 1, 434, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont328)
LoadConvOpIL.MarkLabel(cont328)
LoadConvOpIL.MarkSequencePoint(doc6, 436, 1, 436, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont327)
LoadConvOpIL.MarkLabel(fa327)
LoadConvOpIL.MarkSequencePoint(doc6, 437, 1, 437, 100)
LoadConvOpIL.Emit(OpCodes.Ldnull)
LoadConvOpIL.Emit(OpCodes.Stloc, 2)
LoadConvOpIL.MarkSequencePoint(doc6, 438, 1, 438, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont327)
LoadConvOpIL.MarkLabel(cont327)
LoadConvOpIL.MarkSequencePoint(doc6, 440, 1, 440, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
LoadConvOpIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.Int32)
Dim fa330 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim tru330 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
Dim cont330 As System.Reflection.Emit.Label = LoadConvOpIL.DefineLabel()
LoadConvOpIL.Emit(OpCodes.Beq, tru330)
LoadConvOpIL.Emit(OpCodes.Br, fa330)
LoadConvOpIL.MarkLabel(tru330)
LoadConvOpIL.MarkSequencePoint(doc6, 441, 1, 441, 100)
LoadConvOpIL.Emit(OpCodes.Br, label17)
LoadConvOpIL.MarkSequencePoint(doc6, 442, 1, 442, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont330)
LoadConvOpIL.MarkLabel(fa330)
LoadConvOpIL.MarkSequencePoint(doc6, 443, 1, 443, 100)
LoadConvOpIL.Emit(OpCodes.Br, label16)
LoadConvOpIL.MarkSequencePoint(doc6, 444, 1, 444, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont330)
LoadConvOpIL.MarkLabel(cont330)
LoadConvOpIL.MarkSequencePoint(doc6, 446, 1, 446, 100)
LoadConvOpIL.MarkLabel(label17)
LoadConvOpIL.MarkSequencePoint(doc6, 448, 1, 448, 100)
LoadConvOpIL.Emit(OpCodes.Br, cont326)
LoadConvOpIL.MarkLabel(fa326)
LoadConvOpIL.Emit(OpCodes.Br, cont326)
LoadConvOpIL.MarkLabel(cont326)
LoadConvOpIL.MarkSequencePoint(doc6, 451, 1, 451, 100)
LoadConvOpIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(MethodInfo)
LoadConvOpIL.MarkSequencePoint(doc6, 453, 1, 453, 100)
LoadConvOpIL.Emit(OpCodes.Ret)
Dim typ41(-1) As Type
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = GetType(System.Type)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = GetType(System.String)
Dim LoadField As MethodBuilder = Loader.DefineMethod("LoadField", MethodAttributes.Public Or MethodAttributes.Static, GetType(FieldInfo), typ41)
Dim LoadFieldIL As ILGenerator = LoadField.GetILGenerator()
Dim LoadFieldparam01 As ParameterBuilder = LoadField.DefineParameter(1, ParameterAttributes.None, "typ")
Dim LoadFieldparam02 As ParameterBuilder = LoadField.DefineParameter(2, ParameterAttributes.None, "name")
LoadFieldIL.MarkSequencePoint(doc6, 459, 1, 459, 100)
Dim locbldr203 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(System.Type))
locbldr203.SetLocalSymInfo("temptyp")
LoadFieldIL.Emit(OpCodes.Ldnull)
LoadFieldIL.Emit(OpCodes.Stloc, 0)
LoadFieldIL.MarkSequencePoint(doc6, 460, 1, 460, 100)
Dim locbldr204 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(FieldInfo))
locbldr204.SetLocalSymInfo("fldinfo")
LoadFieldIL.Emit(OpCodes.Ldnull)
LoadFieldIL.Emit(OpCodes.Stloc, 1)
LoadFieldIL.MarkSequencePoint(doc6, 462, 1, 462, 100)
Dim typ42(-1) As Type
LoadFieldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetField", typ42))
Typ = Typ03.GetMethod("GetField", typ42).ReturnType
LoadFieldIL.Emit(OpCodes.Stloc, 1)
LoadFieldIL.MarkSequencePoint(doc6, 464, 1, 464, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
LoadFieldIL.Emit(OpCodes.Ldnull)
Dim fa331 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim tru331 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim cont331 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
LoadFieldIL.Emit(OpCodes.Beq, fa331)
LoadFieldIL.Emit(OpCodes.Br, tru331)
LoadFieldIL.MarkLabel(tru331)
LoadFieldIL.MarkSequencePoint(doc6, 465, 1, 465, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_FieldType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_FieldType", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, MemberTyp)
LoadFieldIL.MarkSequencePoint(doc6, 466, 1, 466, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsLiteral", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsLiteral", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, FldLitFlag)
LoadFieldIL.MarkSequencePoint(doc6, 467, 1, 467, 100)
LoadFieldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsEnum", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsEnum", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, EnumLitFlag)
LoadFieldIL.MarkSequencePoint(doc6, 468, 1, 468, 100)
Dim locbldr205 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(System.Object))
locbldr205.SetLocalSymInfo("nullref")
LoadFieldIL.Emit(OpCodes.Ldnull)
LoadFieldIL.Emit(OpCodes.Stloc, 2)
LoadFieldIL.MarkSequencePoint(doc6, 469, 1, 469, 100)
LoadFieldIL.Emit(OpCodes.Ldsfld, FldLitFlag)
Typ = FldLitFlag.FieldType
LoadFieldIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa332 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim tru332 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim cont332 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
LoadFieldIL.Emit(OpCodes.Beq, tru332)
LoadFieldIL.Emit(OpCodes.Br, fa332)
LoadFieldIL.MarkLabel(tru332)
LoadFieldIL.MarkSequencePoint(doc6, 470, 1, 470, 100)
Dim typ46(-1) As Type
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Object)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetValue", typ46))
Typ = Typ03.GetMethod("GetValue", typ46).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, FldLitVal)
LoadFieldIL.MarkSequencePoint(doc6, 471, 1, 471, 100)
Dim locbldr206 As LocalBuilder = LoadFieldIL.DeclareLocal(GetType(System.Object))
locbldr206.SetLocalSymInfo("obj")
LoadFieldIL.Emit(OpCodes.Ldsfld, FldLitVal)
Typ = FldLitVal.FieldType
LoadFieldIL.Emit(OpCodes.Stloc, 3)
LoadFieldIL.MarkSequencePoint(doc6, 472, 1, 472, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Object)
Typ03 = Typ
LoadFieldIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("GetType", Type.EmptyTypes))
Typ = Typ03.GetMethod("GetType", Type.EmptyTypes).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, FldLitTyp)
LoadFieldIL.MarkSequencePoint(doc6, 473, 1, 473, 100)
LoadFieldIL.Emit(OpCodes.Br, cont332)
LoadFieldIL.MarkLabel(fa332)
LoadFieldIL.Emit(OpCodes.Br, cont332)
LoadFieldIL.MarkLabel(cont332)
LoadFieldIL.MarkSequencePoint(doc6, 474, 1, 474, 100)
LoadFieldIL.Emit(OpCodes.Ldsfld, EnumLitFlag)
Typ = EnumLitFlag.FieldType
LoadFieldIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa333 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim tru333 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
Dim cont333 As System.Reflection.Emit.Label = LoadFieldIL.DefineLabel()
LoadFieldIL.Emit(OpCodes.Beq, tru333)
LoadFieldIL.Emit(OpCodes.Br, fa333)
LoadFieldIL.MarkLabel(tru333)
LoadFieldIL.MarkSequencePoint(doc6, 475, 1, 475, 100)
Dim typ48(-1) As Type
LoadFieldIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
LoadFieldIL.Emit(OpCodes.Call, GetType(System.Enum).GetMethod("GetUnderlyingType", typ48))
Typ = GetType(System.Enum).GetMethod("GetUnderlyingType", typ48).ReturnType
LoadFieldIL.Emit(OpCodes.Stsfld, EnumLitTyp)
LoadFieldIL.MarkSequencePoint(doc6, 476, 1, 476, 100)
LoadFieldIL.Emit(OpCodes.Br, cont333)
LoadFieldIL.MarkLabel(fa333)
LoadFieldIL.Emit(OpCodes.Br, cont333)
LoadFieldIL.MarkLabel(cont333)
LoadFieldIL.MarkSequencePoint(doc6, 477, 1, 477, 100)
LoadFieldIL.Emit(OpCodes.Br, cont331)
LoadFieldIL.MarkLabel(fa331)
LoadFieldIL.Emit(OpCodes.Br, cont331)
LoadFieldIL.MarkLabel(cont331)
LoadFieldIL.MarkSequencePoint(doc6, 479, 1, 479, 100)
LoadFieldIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(FieldInfo)
LoadFieldIL.MarkSequencePoint(doc6, 481, 1, 481, 100)
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
Dim locbldr207 As LocalBuilder = PrintStringIL.DeclareLocal(GetType(System.String))
locbldr207.SetLocalSymInfo("str")
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
Dim locbldr208 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr208.SetLocalSymInfo("isAbstract")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAbstract", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAbstract", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 0)
WriteClassIL.MarkSequencePoint(doc7, 27, 1, 27, 100)
Dim locbldr209 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr209.SetLocalSymInfo("isAnsi")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAnsiClass", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAnsiClass", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 1)
WriteClassIL.MarkSequencePoint(doc7, 28, 1, 28, 100)
Dim locbldr210 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr210.SetLocalSymInfo("isAutoChar")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAutoClass", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAutoClass", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 2)
WriteClassIL.MarkSequencePoint(doc7, 29, 1, 29, 100)
Dim locbldr211 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr211.SetLocalSymInfo("isAuto")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsAutoLayout", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsAutoLayout", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 3)
WriteClassIL.MarkSequencePoint(doc7, 30, 1, 30, 100)
Dim locbldr212 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr212.SetLocalSymInfo("isEnum")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsEnum", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsEnum", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 4)
WriteClassIL.MarkSequencePoint(doc7, 31, 1, 31, 100)
Dim locbldr213 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr213.SetLocalSymInfo("isInterface")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsInterface", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsInterface", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 5)
WriteClassIL.MarkSequencePoint(doc7, 32, 1, 32, 100)
Dim locbldr214 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr214.SetLocalSymInfo("isNestedPrivate")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsNestedPrivate", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsNestedPrivate", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 6)
WriteClassIL.MarkSequencePoint(doc7, 33, 1, 33, 100)
Dim locbldr215 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr215.SetLocalSymInfo("isNestedPublic")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsNestedPublic", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsNestedPublic", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 7)
WriteClassIL.MarkSequencePoint(doc7, 34, 1, 34, 100)
Dim locbldr216 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr216.SetLocalSymInfo("isPrivate")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsNotPublic", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsNotPublic", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 8)
WriteClassIL.MarkSequencePoint(doc7, 35, 1, 35, 100)
Dim locbldr217 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Boolean))
locbldr217.SetLocalSymInfo("isPublic")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_IsPublic", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_IsPublic", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 9)
WriteClassIL.MarkSequencePoint(doc7, 36, 1, 36, 100)
Dim locbldr218 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.String))
locbldr218.SetLocalSymInfo("name")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Name", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Name", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 10)
WriteClassIL.MarkSequencePoint(doc7, 37, 1, 37, 100)
Dim locbldr219 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.Type))
locbldr219.SetLocalSymInfo("bt")
WriteClassIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Type)
Typ03 = Typ
WriteClassIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_BaseType", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_BaseType", Type.EmptyTypes).ReturnType
WriteClassIL.Emit(OpCodes.Stloc, 11)
WriteClassIL.MarkSequencePoint(doc7, 38, 1, 38, 100)
Dim locbldr220 As LocalBuilder = WriteClassIL.DeclareLocal(GetType(System.String))
locbldr220.SetLocalSymInfo("btstr")
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
Dim fa334 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru334 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont334 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru334)
WriteClassIL.Emit(OpCodes.Br, fa334)
WriteClassIL.MarkLabel(tru334)
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
WriteClassIL.Emit(OpCodes.Br, cont334)
WriteClassIL.MarkLabel(fa334)
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
WriteClassIL.Emit(OpCodes.Br, cont334)
WriteClassIL.MarkLabel(cont334)
WriteClassIL.MarkSequencePoint(doc7, 46, 1, 46, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa335 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru335 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont335 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru335)
WriteClassIL.Emit(OpCodes.Br, fa335)
WriteClassIL.MarkLabel(tru335)
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
WriteClassIL.Emit(OpCodes.Br, cont335)
WriteClassIL.MarkLabel(fa335)
WriteClassIL.Emit(OpCodes.Br, cont335)
WriteClassIL.MarkLabel(cont335)
WriteClassIL.MarkSequencePoint(doc7, 50, 1, 50, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa336 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru336 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont336 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru336)
WriteClassIL.Emit(OpCodes.Br, fa336)
WriteClassIL.MarkLabel(tru336)
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
WriteClassIL.Emit(OpCodes.Br, cont336)
WriteClassIL.MarkLabel(fa336)
WriteClassIL.Emit(OpCodes.Br, cont336)
WriteClassIL.MarkLabel(cont336)
WriteClassIL.MarkSequencePoint(doc7, 54, 1, 54, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa337 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru337 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont337 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru337)
WriteClassIL.Emit(OpCodes.Br, fa337)
WriteClassIL.MarkLabel(tru337)
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
WriteClassIL.Emit(OpCodes.Br, cont337)
WriteClassIL.MarkLabel(fa337)
WriteClassIL.Emit(OpCodes.Br, cont337)
WriteClassIL.MarkLabel(cont337)
WriteClassIL.MarkSequencePoint(doc7, 58, 1, 58, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa338 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru338 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont338 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru338)
WriteClassIL.Emit(OpCodes.Br, fa338)
WriteClassIL.MarkLabel(tru338)
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
WriteClassIL.Emit(OpCodes.Br, cont338)
WriteClassIL.MarkLabel(fa338)
WriteClassIL.Emit(OpCodes.Br, cont338)
WriteClassIL.MarkLabel(cont338)
WriteClassIL.MarkSequencePoint(doc7, 63, 1, 63, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa339 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru339 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont339 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru339)
WriteClassIL.Emit(OpCodes.Br, fa339)
WriteClassIL.MarkLabel(tru339)
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
WriteClassIL.Emit(OpCodes.Br, cont339)
WriteClassIL.MarkLabel(fa339)
WriteClassIL.Emit(OpCodes.Br, cont339)
WriteClassIL.MarkLabel(cont339)
WriteClassIL.MarkSequencePoint(doc7, 67, 1, 67, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa340 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru340 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont340 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru340)
WriteClassIL.Emit(OpCodes.Br, fa340)
WriteClassIL.MarkLabel(tru340)
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
WriteClassIL.Emit(OpCodes.Br, cont340)
WriteClassIL.MarkLabel(fa340)
WriteClassIL.Emit(OpCodes.Br, cont340)
WriteClassIL.MarkLabel(cont340)
WriteClassIL.MarkSequencePoint(doc7, 72, 1, 72, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa341 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru341 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont341 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru341)
WriteClassIL.Emit(OpCodes.Br, fa341)
WriteClassIL.MarkLabel(tru341)
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
WriteClassIL.Emit(OpCodes.Br, cont341)
WriteClassIL.MarkLabel(fa341)
WriteClassIL.Emit(OpCodes.Br, cont341)
WriteClassIL.MarkLabel(cont341)
WriteClassIL.MarkSequencePoint(doc7, 76, 1, 76, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa342 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru342 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont342 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru342)
WriteClassIL.Emit(OpCodes.Br, fa342)
WriteClassIL.MarkLabel(tru342)
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
WriteClassIL.Emit(OpCodes.Br, cont342)
WriteClassIL.MarkLabel(fa342)
WriteClassIL.Emit(OpCodes.Br, cont342)
WriteClassIL.MarkLabel(cont342)
WriteClassIL.MarkSequencePoint(doc7, 80, 1, 80, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa343 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru343 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont343 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru343)
WriteClassIL.Emit(OpCodes.Br, fa343)
WriteClassIL.MarkLabel(tru343)
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
WriteClassIL.Emit(OpCodes.Br, cont343)
WriteClassIL.MarkLabel(fa343)
WriteClassIL.Emit(OpCodes.Br, cont343)
WriteClassIL.MarkLabel(cont343)
WriteClassIL.MarkSequencePoint(doc7, 84, 1, 84, 100)
WriteClassIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.Boolean)
WriteClassIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa344 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim tru344 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
Dim cont344 As System.Reflection.Emit.Label = WriteClassIL.DefineLabel()
WriteClassIL.Emit(OpCodes.Beq, tru344)
WriteClassIL.Emit(OpCodes.Br, fa344)
WriteClassIL.MarkLabel(tru344)
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
WriteClassIL.Emit(OpCodes.Br, cont344)
WriteClassIL.MarkLabel(fa344)
WriteClassIL.Emit(OpCodes.Br, cont344)
WriteClassIL.MarkLabel(cont344)
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
asmName.Version = New System.Version(11, 2, 7, 9)
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
Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {"11.2.7.9"})
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