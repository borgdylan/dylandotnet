Imports dylan.NET.Tokenizer.CodeGen
Imports dylan.NET.Tokenizer.Parser
Imports dylan.NET.Tokenizer.AST.Tokens.TypeToks
Imports dylan.NET.Tokenizer.AST.Stmts
Imports dylan.NET.Tokenizer.Lexer
Imports dylan.NET.Reflection
Imports dylan.NET.Utils
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

Sub Module1()
Dim Module1 As TypeBuilder = mdl.DefineType("dylan.NET.Compiler" & "." & "Module1", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass, GetType(System.Object))
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String).MakeArrayType()
Dim main As MethodBuilder = Module1.DefineMethod("main", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ0)
Dim mainIL As ILGenerator = main.GetILGenerator()
Dim mainparam01 As ParameterBuilder = main.DefineParameter(1, ParameterAttributes.None, "args")
mainIL.MarkSequencePoint(doc2, 13, 1, 13, 100)
Dim typ1(-1) As Type
mainIL.Emit(OpCodes.Ldsfld, GetType(StreamUtils).GetField("Stdout"))
Typ = GetType(StreamUtils).GetField("Stdout").FieldType
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("InitOutS", typ1))
Typ = GetType(StreamUtils).GetMethod("InitOutS", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 15, 1, 15, 100)
Dim typ2(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "dylan.NET Compiler v. 11.2.7.8 Beta for Microsoft (R) .NET Framework (R) v. 3.5 SP1 / 4.0")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ2))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ2).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 16, 1, 16, 100)
Dim typ3(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "                           and Xamarin Mono v. 2.6.7/v. 2.10.x")
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ3))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 17, 1, 17, 100)
Dim typ4(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ4))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ4).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 18, 1, 18, 100)
Dim typ5(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Copyright (C) 2011 Dylan Borg")
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ5))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 19, 1, 19, 100)
mainIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
mainIL.Emit(OpCodes.Ldlen)
mainIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
Dim fa0 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim tru0 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim cont0 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.Emit(OpCodes.Blt, tru0)
mainIL.Emit(OpCodes.Br, fa0)
mainIL.MarkLabel(tru0)
mainIL.MarkSequencePoint(doc2, 20, 1, 20, 100)
Dim typ6(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Usage: dylandotnet [options] <file-name>")
Typ = GetType(System.String)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ6))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ6).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 21, 1, 21, 100)
mainIL.Emit(OpCodes.Br, cont0)
mainIL.MarkLabel(fa0)
mainIL.MarkSequencePoint(doc2, 23, 1, 23, 100)
Dim try0 As System.Reflection.Emit.Label = mainIL.BeginExceptionBlock()
mainIL.MarkSequencePoint(doc2, 25, 1, 25, 100)
Dim locbldr0 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr0.SetLocalSymInfo("p")
mainIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc2, 27, 1, 27, 100)
Dim locbldr1 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Int32))
locbldr1.SetLocalSymInfo("len")
mainIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
mainIL.Emit(OpCodes.Ldlen)
mainIL.Emit(OpCodes.Conv_I4)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Sub)
mainIL.Emit(OpCodes.Stloc, 1)
mainIL.MarkSequencePoint(doc2, 28, 1, 28, 100)
Dim locbldr2 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Int32))
locbldr2.SetLocalSymInfo("i")
mainIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Stloc, 2)
mainIL.MarkSequencePoint(doc2, 29, 1, 29, 100)
Dim locbldr3 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Int32))
locbldr3.SetLocalSymInfo("comp")
mainIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Stloc, 3)
mainIL.MarkSequencePoint(doc2, 30, 1, 30, 100)
Dim locbldr4 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr4.SetLocalSymInfo("curarg")
mainIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
mainIL.Emit(OpCodes.Stloc, 4)
mainIL.MarkSequencePoint(doc2, 31, 1, 31, 100)
Dim locbldr5 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr5.SetLocalSymInfo("tmpstr")
mainIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 32, 1, 32, 100)
Dim locbldr6 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Type))
locbldr6.SetLocalSymInfo("temptyp")
mainIL.MarkSequencePoint(doc2, 33, 1, 33, 100)
Dim locbldr7 As LocalBuilder = mainIL.DeclareLocal(GetType(Assembly))
locbldr7.SetLocalSymInfo("asm")
mainIL.MarkSequencePoint(doc2, 36, 1, 36, 100)
Dim label0 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.MarkSequencePoint(doc2, 37, 1, 37, 100)
Dim label1 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.MarkSequencePoint(doc2, 38, 1, 38, 100)
Dim label2 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.MarkSequencePoint(doc2, 39, 1, 39, 100)
Dim label3 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.MarkSequencePoint(doc2, 41, 1, 41, 100)
mainIL.MarkLabel(label0)
mainIL.MarkSequencePoint(doc2, 43, 1, 43, 100)
mainIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Add)
mainIL.Emit(OpCodes.Stloc, 2)
mainIL.MarkSequencePoint(doc2, 45, 1, 45, 100)
mainIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
mainIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Conv_U)
Typ = Typ02
mainIL.Emit(OpCodes.Ldelem, GetType(System.String).MakeArrayType().GetElementType())
Typ = GetType(System.String).MakeArrayType().GetElementType()
mainIL.Emit(OpCodes.Stloc, 4)
mainIL.MarkSequencePoint(doc2, 47, 1, 47, 100)
Dim typ7(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
mainIL.Emit(OpCodes.Ldstr, "-V")
Typ = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
mainIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ7))
Typ = GetType(String).GetMethod("Compare", typ7).ReturnType
mainIL.Emit(OpCodes.Stloc, 3)
mainIL.MarkSequencePoint(doc2, 48, 1, 48, 100)
mainIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa1 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim tru1 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim cont1 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.Emit(OpCodes.Beq, tru1)
mainIL.Emit(OpCodes.Br, fa1)
mainIL.MarkLabel(tru1)
mainIL.MarkSequencePoint(doc2, 50, 1, 50, 100)
Dim typ8(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ8))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ8).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 51, 1, 51, 100)
Dim typ9(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "dylan.NET Version Info:")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ9))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ9).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 53, 1, 53, 100)
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetExecutingAssembly", Type.EmptyTypes))
Typ = GetType(Assembly).GetMethod("GetExecutingAssembly", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 54, 1, 54, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 55, 1, 55, 100)
Dim typ11(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ11(UBound(typ11) + 1)
typ11(UBound(typ11)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ11))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ11).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 57, 1, 57, 100)
mainIL.Emit(OpCodes.Ldtoken, GetType(Loader))
Dim typ12 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ12))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ12).ReturnType
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 58, 1, 58, 100)
Dim typ13(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetAssembly", typ13))
Typ = GetType(Assembly).GetMethod("GetAssembly", typ13).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 59, 1, 59, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 60, 1, 60, 100)
Dim typ15(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ15))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ15).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 62, 1, 62, 100)
mainIL.Emit(OpCodes.Ldtoken, GetType(XmlUtils))
Dim typ16 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ16))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ16).ReturnType
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 63, 1, 63, 100)
Dim typ17(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetAssembly", typ17))
Typ = GetType(Assembly).GetMethod("GetAssembly", typ17).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 64, 1, 64, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 65, 1, 65, 100)
Dim typ19(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ19))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ19).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 67, 1, 67, 100)
mainIL.Emit(OpCodes.Ldtoken, GetType(CodeGenerator))
Dim typ20 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ20))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ20).ReturnType
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 68, 1, 68, 100)
Dim typ21(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetAssembly", typ21))
Typ = GetType(Assembly).GetMethod("GetAssembly", typ21).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 69, 1, 69, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 70, 1, 70, 100)
Dim typ23(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ23))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ23).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 72, 1, 72, 100)
mainIL.Emit(OpCodes.Ldtoken, GetType(Parser))
Dim typ24 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ24))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ24).ReturnType
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 73, 1, 73, 100)
Dim typ25(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetAssembly", typ25))
Typ = GetType(Assembly).GetMethod("GetAssembly", typ25).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 74, 1, 74, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 75, 1, 75, 100)
Dim typ27(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ27))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ27).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 77, 1, 77, 100)
mainIL.Emit(OpCodes.Ldtoken, GetType(Lexer))
Dim typ28 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ28))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ28).ReturnType
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 78, 1, 78, 100)
Dim typ29(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetAssembly", typ29))
Typ = GetType(Assembly).GetMethod("GetAssembly", typ29).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 79, 1, 79, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 80, 1, 80, 100)
Dim typ31(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ31))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ31).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 82, 1, 82, 100)
mainIL.Emit(OpCodes.Ldtoken, GetType(StmtSet))
Dim typ32 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ32))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ32).ReturnType
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 83, 1, 83, 100)
Dim typ33(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetAssembly", typ33))
Typ = GetType(Assembly).GetMethod("GetAssembly", typ33).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 84, 1, 84, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 85, 1, 85, 100)
Dim typ35(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ35))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ35).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 87, 1, 87, 100)
Dim typ36(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ36))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ36).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 88, 1, 88, 100)
Dim typ37(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Runtime & OS Version Info:")
Typ = GetType(System.String)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ37))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ37).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 90, 1, 90, 100)
mainIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ38 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ38))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ38).ReturnType
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 91, 1, 91, 100)
Dim typ39(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Assembly).GetMethod("GetAssembly", typ39))
Typ = GetType(Assembly).GetMethod("GetAssembly", typ39).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 92, 1, 92, 100)
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(Assembly)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 93, 1, 93, 100)
Dim typ41(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ41))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ41).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 95, 1, 95, 100)
Dim locbldr8 As LocalBuilder = mainIL.DeclareLocal(GetType(Version))
locbldr8.SetLocalSymInfo("runver")
mainIL.Emit(OpCodes.Call, GetType(Environment).GetMethod("get_Version", Type.EmptyTypes))
Typ = GetType(Environment).GetMethod("get_Version", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 8)
mainIL.MarkSequencePoint(doc2, 96, 1, 96, 100)
Dim locbldr9 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr9.SetLocalSymInfo("runverstr")
mainIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(Version)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 9)
mainIL.MarkSequencePoint(doc2, 98, 1, 98, 100)
Dim typ43(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Runtime Version: ")
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("Write", typ43))
Typ = GetType(StreamUtils).GetMethod("Write", typ43).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 99, 1, 99, 100)
Dim typ44(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(System.String)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ44))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ44).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 101, 1, 101, 100)
Dim locbldr10 As LocalBuilder = mainIL.DeclareLocal(GetType(OperatingSystem))
locbldr10.SetLocalSymInfo("os")
mainIL.Emit(OpCodes.Call, GetType(Environment).GetMethod("get_OSVersion", Type.EmptyTypes))
Typ = GetType(Environment).GetMethod("get_OSVersion", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 10)
mainIL.MarkSequencePoint(doc2, 102, 1, 102, 100)
Dim locbldr11 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr11.SetLocalSymInfo("osverstr")
mainIL.Emit(OpCodes.Ldloc, 10)
Typ = GetType(OperatingSystem)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 11)
mainIL.MarkSequencePoint(doc2, 104, 1, 104, 100)
Dim typ46(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "OS: ")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("Write", typ46))
Typ = GetType(StreamUtils).GetMethod("Write", typ46).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 105, 1, 105, 100)
Dim typ47(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 11)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ47))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ47).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 107, 1, 107, 100)
mainIL.Emit(OpCodes.Br, label3)
mainIL.MarkSequencePoint(doc2, 108, 1, 108, 100)
mainIL.Emit(OpCodes.Br, cont1)
mainIL.MarkLabel(fa1)
mainIL.Emit(OpCodes.Br, cont1)
mainIL.MarkLabel(cont1)
mainIL.MarkSequencePoint(doc2, 110, 1, 110, 100)
Dim typ48(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(System.String)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
mainIL.Emit(OpCodes.Ldstr, "-h")
Typ = GetType(System.String)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
mainIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ48))
Typ = GetType(String).GetMethod("Compare", typ48).ReturnType
mainIL.Emit(OpCodes.Stloc, 3)
mainIL.MarkSequencePoint(doc2, 111, 1, 111, 100)
mainIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa2 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim tru2 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim cont2 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.Emit(OpCodes.Beq, tru2)
mainIL.Emit(OpCodes.Br, fa2)
mainIL.MarkLabel(tru2)
mainIL.MarkSequencePoint(doc2, 112, 1, 112, 100)
Dim typ49(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ49))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ49).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 113, 1, 113, 100)
Dim typ50(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Usage: dylandotnet [options] <file-name>")
Typ = GetType(System.String)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ50))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ50).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 114, 1, 114, 100)
Dim typ51(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Options:")
Typ = GetType(System.String)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ51))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ51).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 115, 1, 115, 100)
Dim typ52(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "   -V : View Version Nrs. for all dylan.NET assemblies")
Typ = GetType(System.String)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ52))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ52).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 116, 1, 116, 100)
Dim typ53(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "   -h : View this help message")
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ53))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ53).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 117, 1, 117, 100)
mainIL.Emit(OpCodes.Br, label3)
mainIL.MarkSequencePoint(doc2, 118, 1, 118, 100)
mainIL.Emit(OpCodes.Br, cont2)
mainIL.MarkLabel(fa2)
mainIL.Emit(OpCodes.Br, cont2)
mainIL.MarkLabel(cont2)
mainIL.MarkSequencePoint(doc2, 120, 1, 120, 100)
mainIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
mainIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Conv_U)
Typ = Typ02
mainIL.Emit(OpCodes.Ldelem, GetType(System.String).MakeArrayType().GetElementType())
Typ = GetType(System.String).MakeArrayType().GetElementType()
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc2, 122, 1, 122, 100)
mainIL.MarkLabel(label2)
mainIL.MarkSequencePoint(doc2, 124, 1, 124, 100)
mainIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
Dim fa3 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim tru3 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim cont3 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.Emit(OpCodes.Bge, tru3)
mainIL.Emit(OpCodes.Br, fa3)
mainIL.MarkLabel(tru3)
mainIL.MarkSequencePoint(doc2, 125, 1, 125, 100)
mainIL.Emit(OpCodes.Br, label1)
mainIL.MarkSequencePoint(doc2, 126, 1, 126, 100)
mainIL.Emit(OpCodes.Br, cont3)
mainIL.MarkLabel(fa3)
mainIL.MarkSequencePoint(doc2, 127, 1, 127, 100)
mainIL.Emit(OpCodes.Br, label0)
mainIL.MarkSequencePoint(doc2, 128, 1, 128, 100)
mainIL.Emit(OpCodes.Br, cont3)
mainIL.MarkLabel(cont3)
mainIL.MarkSequencePoint(doc2, 130, 1, 130, 100)
mainIL.MarkLabel(label1)
mainIL.MarkSequencePoint(doc2, 132, 1, 132, 100)
Dim locbldr12 As LocalBuilder = mainIL.DeclareLocal(GetType(Lexer))
locbldr12.SetLocalSymInfo("lx")
mainIL.Emit(OpCodes.Newobj, GetType(Lexer).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 12)
mainIL.MarkSequencePoint(doc2, 133, 1, 133, 100)
Dim typ54(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Now Lexing: ")
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("Write", typ54))
Typ = GetType(StreamUtils).GetMethod("Write", typ54).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 134, 1, 134, 100)
Dim typ55(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("Write", typ55))
Typ = GetType(StreamUtils).GetMethod("Write", typ55).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 135, 1, 135, 100)
Dim locbldr13 As LocalBuilder = mainIL.DeclareLocal(GetType(StmtSet))
locbldr13.SetLocalSymInfo("pstmts")
Dim typ56(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 12)
Typ = GetType(Lexer)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Analyze", typ56))
Typ = Typ03.GetMethod("Analyze", typ56).ReturnType
mainIL.Emit(OpCodes.Stloc, 13)
mainIL.MarkSequencePoint(doc2, 136, 1, 136, 100)
Dim typ57(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "...Done.")
Typ = GetType(System.String)
ReDim Preserve typ57(UBound(typ57) + 1)
typ57(UBound(typ57)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ57))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ57).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 137, 1, 137, 100)
Dim locbldr14 As LocalBuilder = mainIL.DeclareLocal(GetType(Parser))
locbldr14.SetLocalSymInfo("ps")
mainIL.Emit(OpCodes.Newobj, GetType(Parser).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 14)
mainIL.MarkSequencePoint(doc2, 138, 1, 138, 100)
Dim typ58(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Now Parsing: ")
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("Write", typ58))
Typ = GetType(StreamUtils).GetMethod("Write", typ58).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 139, 1, 139, 100)
Dim typ59(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("Write", typ59))
Typ = GetType(StreamUtils).GetMethod("Write", typ59).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 140, 1, 140, 100)
Dim locbldr15 As LocalBuilder = mainIL.DeclareLocal(GetType(StmtSet))
locbldr15.SetLocalSymInfo("ppstmts")
Dim typ60(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 14)
Typ = GetType(Parser)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 13)
Typ = GetType(StmtSet)
ReDim Preserve typ60(UBound(typ60) + 1)
typ60(UBound(typ60)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Parse", typ60))
Typ = Typ03.GetMethod("Parse", typ60).ReturnType
mainIL.Emit(OpCodes.Stloc, 15)
mainIL.MarkSequencePoint(doc2, 141, 1, 141, 100)
Dim typ61(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "...Done.")
Typ = GetType(System.String)
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ61))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ61).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 142, 1, 142, 100)
Dim locbldr16 As LocalBuilder = mainIL.DeclareLocal(GetType(CodeGenerator))
locbldr16.SetLocalSymInfo("cg")
mainIL.Emit(OpCodes.Newobj, GetType(CodeGenerator).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 16)
mainIL.MarkSequencePoint(doc2, 143, 1, 143, 100)
Dim typ62(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 16)
Typ = GetType(CodeGenerator)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 15)
Typ = GetType(StmtSet)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("EmitMSIL", typ62))
Typ = Typ03.GetMethod("EmitMSIL", typ62).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 203, 1, 203, 100)
Dim locbldr17 As LocalBuilder = mainIL.DeclareLocal(GetType(Exception))
locbldr17.SetLocalSymInfo("ex")
mainIL.BeginCatchBlock(GetType(Exception))
mainIL.Emit(OpCodes.Stloc,17)
mainIL.MarkSequencePoint(doc2, 205, 1, 205, 100)
Dim locbldr18 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr18.SetLocalSymInfo("exstr")
mainIL.Emit(OpCodes.Ldloc, 17)
Typ = GetType(Exception)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 18)
mainIL.MarkSequencePoint(doc2, 206, 1, 206, 100)
Dim typ64(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 18)
Typ = GetType(System.String)
ReDim Preserve typ64(UBound(typ64) + 1)
typ64(UBound(typ64)) = Typ
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("WriteLine", typ64))
Typ = GetType(StreamUtils).GetMethod("WriteLine", typ64).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 209, 1, 209, 100)
mainIL.EndExceptionBlock()
mainIL.MarkSequencePoint(doc2, 211, 1, 211, 100)
mainIL.Emit(OpCodes.Br, cont0)
mainIL.MarkLabel(cont0)
mainIL.MarkSequencePoint(doc2, 213, 1, 213, 100)
mainIL.MarkLabel(label3)
mainIL.MarkSequencePoint(doc2, 215, 1, 215, 100)
mainIL.Emit(OpCodes.Call, GetType(StreamUtils).GetMethod("CloseOutS", Type.EmptyTypes))
Typ = GetType(StreamUtils).GetMethod("CloseOutS", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 217, 1, 217, 100)
mainIL.Emit(OpCodes.Ret)
Module1.CreateType()
asm.SetEntryPoint(main)
Dim staType As Type = GetType(STAThreadAttribute)
Dim staCtor As ConstructorInfo = staType.GetConstructor(Type.EmptyTypes)
Dim staBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(staCtor, New Object() {})
main.SetCustomAttribute(staBuilder)

End Sub

Sub Main()

asmName = New AssemblyName("dnc")
asmName.Version = New System.Version(11, 2, 7, 8)
asm  = AppDomain.CurrentDomain.DefineDynamicAssembly(asmName, AssemblyBuilderAccess.Save, CStr("E:\Code\dylannet\compiler\"))
mdl = asm.DefineDynamicModule(asmName.Name & ".exe" , asmName.Name & ".exe", True)
resw = mdl.DefineResource("dnc.resources" ,  "Description")
doc = mdl.DefineDocument("E:\Code\dylannet\compiler\dnc.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
doc2 = mdl.DefineDocument("E:\Code\dylannet\compiler\dnc\Mod1.dyl", Guid.Empty, Guid.Empty, Guid.Empty)
addstr("dnc")
addasm(asm)
Dim daType As Type = GetType(DebuggableAttribute)
Dim daCtor As ConstructorInfo = daType.GetConstructor(New Type() { GetType(DebuggableAttribute.DebuggingModes) })
Dim daBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(daCtor, New Object() {DebuggableAttribute.DebuggingModes.DisableOptimizations Or _
DebuggableAttribute.DebuggingModes.Default })
asm.SetCustomAttribute(daBuilder)

Module1()
Dim vaType As Type = GetType(AssemblyFileVersionAttribute)
Dim vaCtor As ConstructorInfo = vaType.GetConstructor(New Type() { GetType(String) })
Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {"11.2.7.8"})
asm.SetCustomAttribute(vaBuilder)

Dim paType As Type = GetType(AssemblyProductAttribute)
Dim paCtor As ConstructorInfo = paType.GetConstructor(New Type() { GetType(String) })
Dim paBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(paCtor, New Object() {"dnc"})
asm.SetCustomAttribute(paBuilder)

Dim ataType As Type = GetType(AssemblyTitleAttribute)
Dim ataCtor As ConstructorInfo = ataType.GetConstructor(New Type() { GetType(String) })
Dim ataBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(ataCtor, New Object() {"dnc"})
asm.SetCustomAttribute(ataBuilder)

Dim deaType As Type = GetType(AssemblyDescriptionAttribute)
Dim deaCtor As ConstructorInfo = deaType.GetConstructor(New Type() { GetType(String) })
Dim deaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(deaCtor, New Object() {"dnc"})
asm.SetCustomAttribute(deaBuilder)


asm.DefineVersionInfoResource()
asm.Save(asmName.Name & ".exe")
End Sub


End Module