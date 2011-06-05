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
mainIL.Emit(OpCodes.Ldstr, "dylan.NET Compiler v. 11.2.7.1 Alpha for Microsoft (R) .NET Framework (R) v. 3.5 SP1")
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ1))
Typ = GetType(Console).GetMethod("WriteLine", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 14, 1, 14, 100)
Dim typ2(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "                           and Xamarin Mono v. 2.6.7/v. 2.8/v. 2.10")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ2))
Typ = GetType(Console).GetMethod("WriteLine", typ2).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 15, 1, 15, 100)
Dim typ3(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license.")
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ3))
Typ = GetType(Console).GetMethod("WriteLine", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 16, 1, 16, 100)
Dim typ4(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Copyright (C) 2011 Dylan Borg")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ4))
Typ = GetType(Console).GetMethod("WriteLine", typ4).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 17, 1, 17, 100)
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
mainIL.MarkSequencePoint(doc2, 18, 1, 18, 100)
Dim typ5(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Usage: dnc <path>")
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ5))
Typ = GetType(Console).GetMethod("WriteLine", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 19, 1, 19, 100)
mainIL.Emit(OpCodes.Br, cont0)
mainIL.MarkLabel(fa0)
mainIL.MarkSequencePoint(doc2, 23, 1, 23, 100)
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
mainIL.MarkSequencePoint(doc2, 24, 1, 24, 100)
Dim locbldr1 As LocalBuilder = mainIL.DeclareLocal(GetType(Lexer))
locbldr1.SetLocalSymInfo("lx")
mainIL.Emit(OpCodes.Newobj, GetType(Lexer).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 1)
mainIL.MarkSequencePoint(doc2, 25, 1, 25, 100)
Dim typ6(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Now Lexing: ")
Typ = GetType(System.String)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("Write", typ6))
Typ = GetType(Console).GetMethod("Write", typ6).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 26, 1, 26, 100)
Dim typ7(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("Write", typ7))
Typ = GetType(Console).GetMethod("Write", typ7).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 27, 1, 27, 100)
Dim locbldr2 As LocalBuilder = mainIL.DeclareLocal(GetType(StmtSet))
locbldr2.SetLocalSymInfo("pstmts")
Dim typ8(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(Lexer)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Analyze", typ8))
Typ = Typ03.GetMethod("Analyze", typ8).ReturnType
mainIL.Emit(OpCodes.Stloc, 2)
mainIL.MarkSequencePoint(doc2, 28, 1, 28, 100)
Dim typ9(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "...Done.")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ9))
Typ = GetType(Console).GetMethod("WriteLine", typ9).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 29, 1, 29, 100)
Dim locbldr3 As LocalBuilder = mainIL.DeclareLocal(GetType(Parser))
locbldr3.SetLocalSymInfo("ps")
mainIL.Emit(OpCodes.Newobj, GetType(Parser).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 3)
mainIL.MarkSequencePoint(doc2, 30, 1, 30, 100)
Dim typ10(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "Now Parsing: ")
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("Write", typ10))
Typ = GetType(Console).GetMethod("Write", typ10).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 31, 1, 31, 100)
Dim typ11(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ11(UBound(typ11) + 1)
typ11(UBound(typ11)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("Write", typ11))
Typ = GetType(Console).GetMethod("Write", typ11).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 32, 1, 32, 100)
Dim locbldr4 As LocalBuilder = mainIL.DeclareLocal(GetType(StmtSet))
locbldr4.SetLocalSymInfo("ppstmts")
Dim typ12(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(Parser)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(StmtSet)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Parse", typ12))
Typ = Typ03.GetMethod("Parse", typ12).ReturnType
mainIL.Emit(OpCodes.Stloc, 4)
mainIL.MarkSequencePoint(doc2, 33, 1, 33, 100)
Dim typ13(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "...Done.")
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ13))
Typ = GetType(Console).GetMethod("WriteLine", typ13).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 34, 1, 34, 100)
Dim locbldr5 As LocalBuilder = mainIL.DeclareLocal(GetType(CodeGenerator))
locbldr5.SetLocalSymInfo("cg")
mainIL.Emit(OpCodes.Newobj, GetType(CodeGenerator).GetConstructor(Type.EmptyTypes))
mainIL.Emit(OpCodes.Stloc, 5)
mainIL.MarkSequencePoint(doc2, 35, 1, 35, 100)
Dim typ14(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 5)
Typ = GetType(CodeGenerator)
Typ03 = Typ
mainIL.Emit(OpCodes.Ldloc, 4)
Typ = GetType(StmtSet)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
mainIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("EmitMSIL", typ14))
Typ = Typ03.GetMethod("EmitMSIL", typ14).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc2, 100, 1, 100, 100)
mainIL.Emit(OpCodes.Br, cont0)
mainIL.MarkLabel(cont0)
mainIL.MarkSequencePoint(doc2, 102, 1, 102, 100)
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
asmName.Version = New System.Version(11, 2, 7, 1)
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
Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {"11.2.7.1"})
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