Imports dylan.NET.Tokenizer.CodeGen
Imports dylan.NET.Tokenizer.Parser
Imports dylan.NET.Tokenizer.AST.Stmts
Imports dylan.NET.Tokenizer.Lexer
Imports dylan.NET.Utils
Imports System.Linq
Imports System.Collections.Generic
Imports System.Collections
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
Dim mainparam00 As ParameterBuilder = main.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim mainparam01 As ParameterBuilder = main.DefineParameter(1, ParameterAttributes.None, "args")
mainIL.MarkSequencePoint(doc2, 5, 1, 5, 100)
Dim typ1(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "dylan.NET Compiler v. 11.2.4 for Microsoft (R) .NET Framework (R) v. 3.5 SP1")
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ1))
Typ = GetType(Console).GetMethod("WriteLine", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 6, 1, 6, 100)
Dim typ2(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "                           and Novell Mono v. 2.6.7 /v. 2.10")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ2))
Typ = GetType(Console).GetMethod("WriteLine", typ2).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 7, 1, 7, 100)
Dim typ3(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Copyright (C) Dylan Borg 2010")
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ3))
Typ = GetType(Console).GetMethod("WriteLine", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 8, 1, 8, 100)
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
mainIL.MarkSequencePoint(doc2, 9, 1, 9, 100)
Dim typ4(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Usage: dnc <path>")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ4))
Typ = GetType(Console).GetMethod("WriteLine", typ4).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 10, 1, 10, 100)
mainIL.Emit(OpCodes.Br, cont0)
mainIL.MarkLabel(fa0)
mainIL.MarkSequencePoint(doc2, 12, 1, 12, 100)
Dim try0 As System.Reflection.Emit.Label = mainIL.BeginExceptionBlock()
mainIL.MarkSequencePoint(doc2, 14, 1, 14, 100)
Dim locbldr0 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr0.SetLocalSymInfo("p")
mainIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String).MakeArrayType()
Typ02 = Typ
mainIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Conv_U)
Typ = Typ02
mainIL.Emit(OpCodes.Ldelem, GetType(System.String).MakeArrayType().GetElementType())
Typ = GetType(System.String).MakeArrayType().GetElementType()
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc2, 15, 1, 15, 100)
Dim locbldr1 As LocalBuilder = mainIL.DeclareLocal(GetType(Lexer))
locbldr1.SetLocalSymInfo("lx")
mainIL.Emit(OpCodes.Newobj, GetType(Lexer).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 1)
mainIL.MarkSequencePoint(doc2, 16, 1, 16, 100)
Dim locbldr2 As LocalBuilder = mainIL.DeclareLocal(GetType(StmtSet))
locbldr2.SetLocalSymInfo("pstmts")
Dim typ5(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(Lexer)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Analyze", typ5))
Typ = Typ03.GetMethod("Analyze", typ5).ReturnType
mainIL.Emit(OpCodes.Stloc, 2)
mainIL.MarkSequencePoint(doc2, 17, 1, 17, 100)
Dim locbldr3 As LocalBuilder = mainIL.DeclareLocal(GetType(Parser))
locbldr3.SetLocalSymInfo("ps")
mainIL.Emit(OpCodes.Newobj, GetType(Parser).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 3)
mainIL.MarkSequencePoint(doc2, 18, 1, 18, 100)
Dim locbldr4 As LocalBuilder = mainIL.DeclareLocal(GetType(StmtSet))
locbldr4.SetLocalSymInfo("ppstmts")
Dim typ6(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(Parser)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(StmtSet)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Parse", typ6))
Typ = Typ03.GetMethod("Parse", typ6).ReturnType
mainIL.Emit(OpCodes.Stloc, 4)
mainIL.MarkSequencePoint(doc2, 19, 1, 19, 100)
Dim locbldr5 As LocalBuilder = mainIL.DeclareLocal(GetType(CodeGenerator))
locbldr5.SetLocalSymInfo("cg")
mainIL.Emit(OpCodes.Newobj, GetType(CodeGenerator).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 20, 1, 20, 100)
Dim typ7(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(CodeGenerator)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(StmtSet)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("EmitMSIL", typ7))
Typ = Typ03.GetMethod("EmitMSIL", typ7).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 22, 1, 22, 100)
Dim locbldr6 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Type).MakeArrayType())
locbldr6.SetLocalSymInfo("typs")
mainIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Conv_U)
mainIL.Emit(OpCodes.Newarr, GetType(System.Type))
mainIL.Emit(OpCodes.Stloc, 6)
mainIL.MarkSequencePoint(doc2, 23, 1, 23, 100)
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
mainIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Conv_U)
Typ = Typ02
mainIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ8 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ8))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ8).ReturnType
mainIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
mainIL.MarkSequencePoint(doc2, 24, 1, 24, 100)
mainIL.Emit(OpCodes.Ldloc, 6)
Typ = GetType(System.Type).MakeArrayType()
Typ02 = Typ
mainIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Conv_U)
Typ = Typ02
mainIL.Emit(OpCodes.Ldtoken, GetType(System.String))
Dim typ9 As Type() = {GetType(System.RuntimeTypeHandle)}
mainIL.Emit(OpCodes.Call, GetType(System.Type).GetMethod("GetTypeFromHandle", typ9))
Typ = GetType(System.Type).GetMethod("GetTypeFromHandle", typ9).ReturnType
mainIL.Emit(OpCodes.Stelem, GetType(System.Type).MakeArrayType().GetElementType())
mainIL.MarkSequencePoint(doc2, 26, 1, 26, 100)
Dim locbldr7 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Type))
locbldr7.SetLocalSymInfo("t1")
Dim typ10(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "FieldAttributes")
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Loader).GetMethod("LoadClass", typ10))
Typ = GetType(Loader).GetMethod("LoadClass", typ10).ReturnType
mainIL.Emit(OpCodes.Stloc, 7)
mainIL.MarkSequencePoint(doc2, 27, 1, 27, 100)
Dim locbldr8 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr8.SetLocalSymInfo("t1s")
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.Type)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 8)
mainIL.MarkSequencePoint(doc2, 28, 1, 28, 100)
Dim typ12(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 8)
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ12))
Typ = GetType(Console).GetMethod("WriteLine", typ12).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 32, 1, 32, 100)
Dim locbldr9 As LocalBuilder = mainIL.DeclareLocal(GetType(FieldInfo))
locbldr9.SetLocalSymInfo("f1")
Dim typ13(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 7)
Typ = GetType(System.Type)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
mainIL.Emit(OpCodes.Ldstr, "Literal")
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Loader).GetMethod("LoadField", typ13))
Typ = GetType(Loader).GetMethod("LoadField", typ13).ReturnType
mainIL.Emit(OpCodes.Stloc, 9)
mainIL.MarkSequencePoint(doc2, 33, 1, 33, 100)
Dim locbldr10 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr10.SetLocalSymInfo("f1s")
mainIL.Emit(OpCodes.Ldloc, 9)
Typ = GetType(FieldInfo)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 10)
mainIL.MarkSequencePoint(doc2, 34, 1, 34, 100)
Dim typ15(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 10)
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ15))
Typ = GetType(Console).GetMethod("WriteLine", typ15).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 35, 1, 35, 100)
mainIL.Emit(OpCodes.Ldsfld, GetType(Loader).GetField("FldLitFlag"))
Typ = GetType(Loader).GetField("FldLitFlag").FieldType
mainIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa1 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim tru1 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim cont1 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.Emit(OpCodes.Beq, tru1)
mainIL.Emit(OpCodes.Br, fa1)
mainIL.MarkLabel(tru1)
mainIL.MarkSequencePoint(doc2, 36, 1, 36, 100)
Dim locbldr11 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Type))
locbldr11.SetLocalSymInfo("t2")
mainIL.Emit(OpCodes.Ldsfld, GetType(Loader).GetField("FldLitTyp"))
Typ = GetType(Loader).GetField("FldLitTyp").FieldType
mainIL.Emit(OpCodes.Stloc, 11)
mainIL.MarkSequencePoint(doc2, 37, 1, 37, 100)
Dim locbldr12 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr12.SetLocalSymInfo("t2s")
mainIL.Emit(OpCodes.Ldloc, 11)
Typ = GetType(System.Type)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 12)
mainIL.MarkSequencePoint(doc2, 38, 1, 38, 100)
Dim typ17(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 12)
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ17))
Typ = GetType(Console).GetMethod("WriteLine", typ17).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 39, 1, 39, 100)
Dim typ18(-1) As Type
mainIL.Emit(OpCodes.Ldsfld, GetType(Loader).GetField("FldLitVal"))
Typ = GetType(Loader).GetField("FldLitVal").FieldType
Dim typ19 As Type() = {Typ}
mainIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ19))
Typ = GetType(System.Convert).GetMethod("ToString", typ19).ReturnType
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ18))
Typ = GetType(Console).GetMethod("WriteLine", typ18).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 40, 1, 40, 100)
mainIL.Emit(OpCodes.Ldsfld, GetType(Loader).GetField("EnumLitFlag"))
Typ = GetType(Loader).GetField("EnumLitFlag").FieldType
mainIL.Emit(OpCodes.Ldc_I4, 1)
Typ = GetType(System.Boolean)
Dim fa2 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim tru2 As System.Reflection.Emit.Label = mainIL.DefineLabel()
Dim cont2 As System.Reflection.Emit.Label = mainIL.DefineLabel()
mainIL.Emit(OpCodes.Beq, tru2)
mainIL.Emit(OpCodes.Br, fa2)
mainIL.MarkLabel(tru2)
mainIL.MarkSequencePoint(doc2, 41, 1, 41, 100)
Dim locbldr13 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Type))
locbldr13.SetLocalSymInfo("t3")
mainIL.Emit(OpCodes.Ldsfld, GetType(Loader).GetField("EnumLitTyp"))
Typ = GetType(Loader).GetField("EnumLitTyp").FieldType
mainIL.Emit(OpCodes.Stloc, 13)
mainIL.MarkSequencePoint(doc2, 42, 1, 42, 100)
Dim locbldr14 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr14.SetLocalSymInfo("t3s")
mainIL.Emit(OpCodes.Ldloc, 13)
Typ = GetType(System.Type)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 14)
mainIL.MarkSequencePoint(doc2, 43, 1, 43, 100)
Dim typ21(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 14)
Typ = GetType(System.String)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ21))
Typ = GetType(Console).GetMethod("WriteLine", typ21).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 44, 1, 44, 100)
mainIL.Emit(OpCodes.Br, cont2)
mainIL.MarkLabel(fa2)
mainIL.Emit(OpCodes.Br, cont2)
mainIL.MarkLabel(cont2)
mainIL.MarkSequencePoint(doc2, 45, 1, 45, 100)
mainIL.Emit(OpCodes.Br, cont1)
mainIL.MarkLabel(fa1)
mainIL.Emit(OpCodes.Br, cont1)
mainIL.MarkLabel(cont1)
mainIL.MarkSequencePoint(doc2, 47, 1, 47, 100)
Dim locbldr15 As LocalBuilder = mainIL.DeclareLocal(GetType(Exception))
locbldr15.SetLocalSymInfo("ex")
mainIL.BeginCatchBlock(GetType(Exception))
mainIL.Emit(OpCodes.Stloc,15)
mainIL.MarkSequencePoint(doc2, 49, 1, 49, 100)
Dim locbldr16 As LocalBuilder = mainIL.DeclareLocal(GetType(System.String))
locbldr16.SetLocalSymInfo("exstr")
mainIL.Emit(OpCodes.Ldloc, 15)
Typ = GetType(Exception)
Typ03 = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ToString", Type.EmptyTypes))
Typ = Typ03.GetMethod("ToString", Type.EmptyTypes).ReturnType
mainIL.Emit(OpCodes.Stloc, 16)
mainIL.MarkSequencePoint(doc2, 50, 1, 50, 100)
Dim typ23(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 16)
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ23))
Typ = GetType(Console).GetMethod("WriteLine", typ23).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 51, 1, 51, 100)
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("ReadKey", Type.EmptyTypes))
Typ = GetType(Console).GetMethod("ReadKey", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 53, 1, 53, 100)
mainIL.EndExceptionBlock()
mainIL.MarkSequencePoint(doc2, 55, 1, 55, 100)
mainIL.Emit(OpCodes.Br, cont0)
mainIL.MarkLabel(cont0)
mainIL.MarkSequencePoint(doc2, 57, 1, 57, 100)
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
asmName.Version = New System.Version(11, 2, 4, 0)
asm  = AppDomain.CurrentDomain.DefineDynamicAssembly(asmName, AssemblyBuilderAccess.Save, CStr("E:\Code\dylannet\compiler\"))
mdl = asm.DefineDynamicModule(asmName.Name & ".exe" , asmName.Name & ".exe", True)
resw = mdl.DefineResource("dnc.resources" ,  "Description")
doc = mdl.DefineDocument("E:\Code\dylannet\compiler\dnc.txt", Guid.Empty, Guid.Empty, Guid.Empty)
doc2 = mdl.DefineDocument("E:\Code\dylannet\compiler\Mod1.txt", Guid.Empty, Guid.Empty, Guid.Empty)
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
Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {"11.2.4.0"})
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