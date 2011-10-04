Imports dnu
Imports System.Runtime.InteropServices
Imports System.Windows.Forms
Imports System.Xml.XPath
Imports Microsoft.VisualBasic.FileIO
Imports Microsoft.VisualBasic.CompilerServices
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
Sub Module1()
Dim Module1 As TypeBuilder = mdl.DefineType("dnutest" & "." & "Module1", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass, GetType(System.Object))
Dim main As MethodBuilder = Module1.DefineMethod("main", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim mainIL As ILGenerator = main.GetILGenerator()
Dim mainparam00 As ParameterBuilder = main.DefineParameter(0, ParameterAttributes.RetVal, "")
mainIL.MarkSequencePoint(doc, 35, 1, 35, 100)
Dim locbldr0 As LocalBuilder = mainIL.DeclareLocal(GetType(System.Int32))
locbldr0.SetLocalSymInfo("i")
mainIL.Emit(OpCodes.Ldc_I4, 0)
Typ = GetType(System.Int32)
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 36, 1, 36, 100)
Dim typ0(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "(")
Typ = GetType(System.String)
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ0))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ0).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 37, 1, 37, 100)
Dim typ1(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ1))
Typ = GetType(Console).GetMethod("WriteLine", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 38, 1, 38, 100)
Dim typ2(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "*")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ2))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ2).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 39, 1, 39, 100)
Dim typ3(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ3))
Typ = GetType(Console).GetMethod("WriteLine", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 40, 1, 40, 100)
Dim typ4(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "/")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ4))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ4).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 41, 1, 41, 100)
Dim typ5(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ5))
Typ = GetType(Console).GetMethod("WriteLine", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 42, 1, 42, 100)
Dim typ6(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "%")
Typ = GetType(System.String)
ReDim Preserve typ6(UBound(typ6) + 1)
typ6(UBound(typ6)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ6))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ6).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 43, 1, 43, 100)
Dim typ7(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ7))
Typ = GetType(Console).GetMethod("WriteLine", typ7).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 44, 1, 44, 100)
Dim typ8(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "+")
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ8))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ8).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 45, 1, 45, 100)
Dim typ9(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ9))
Typ = GetType(Console).GetMethod("WriteLine", typ9).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 46, 1, 46, 100)
Dim typ10(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "-")
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ10))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ10).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 47, 1, 47, 100)
Dim typ11(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ11(UBound(typ11) + 1)
typ11(UBound(typ11)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ11))
Typ = GetType(Console).GetMethod("WriteLine", typ11).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 48, 1, 48, 100)
Dim typ12(-1) As Type
mainIL.Emit(OpCodes.Ldstr, ")")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ12))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ12).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 49, 1, 49, 100)
Dim typ13(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ13))
Typ = GetType(Console).GetMethod("WriteLine", typ13).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 50, 1, 50, 100)
Dim typ14(-1) As Type
mainIL.Emit(OpCodes.Ldstr, "a")
Typ = GetType(System.String)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
mainIL.Emit(OpCodes.Call, GetType(ParseUtils).GetMethod("RetPrec", typ14))
Typ = GetType(ParseUtils).GetMethod("RetPrec", typ14).ReturnType
mainIL.Emit(OpCodes.Stloc, 0)
mainIL.MarkSequencePoint(doc, 51, 1, 51, 100)
Dim typ15(-1) As Type
mainIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("WriteLine", typ15))
Typ = GetType(Console).GetMethod("WriteLine", typ15).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 52, 1, 52, 100)
mainIL.Emit(OpCodes.Call, GetType(Console).GetMethod("ReadKey", Type.EmptyTypes))
Typ = GetType(Console).GetMethod("ReadKey", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
mainIL.Emit(OpCodes.Pop)
End If
mainIL.MarkSequencePoint(doc, 53, 1, 53, 100)
mainIL.Emit(OpCodes.Ret)
Module1.CreateType()
asm.SetEntryPoint(main)
Dim staType As Type = GetType(STAThreadAttribute)
Dim staCtor As ConstructorInfo = staType.GetConstructor(Type.EmptyTypes)
Dim staBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(staCtor, New Object() {})
main.SetCustomAttribute(staBuilder)

End Sub

Sub Main()

asmName = New AssemblyName("dnutest")
asmName.Version = New System.Version(1, 1, 0, 0)
asm  = AppDomain.CurrentDomain.DefineDynamicAssembly(asmName, AssemblyBuilderAccess.Save, CStr("E:\Code\dylannet\dnu\"))
mdl = asm.DefineDynamicModule(asmName.Name & ".exe" , asmName.Name & ".exe", True)
resw = mdl.DefineResource("dnutest.resources" ,  "Description")
doc = mdl.DefineDocument("E:\Code\dylannet\dnu\dnutest.txt", Guid.Empty, Guid.Empty, Guid.Empty)
addstr("dnutest")
addasm(asm)
Dim daType As Type = GetType(DebuggableAttribute)
Dim daCtor As ConstructorInfo = daType.GetConstructor(New Type() { GetType(DebuggableAttribute.DebuggingModes) })
Dim daBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(daCtor, New Object() {DebuggableAttribute.DebuggingModes.DisableOptimizations Or _
DebuggableAttribute.DebuggingModes.Default })
asm.SetCustomAttribute(daBuilder)

Module1()
Dim vaType As Type = GetType(AssemblyFileVersionAttribute)
Dim vaCtor As ConstructorInfo = vaType.GetConstructor(New Type() { GetType(String) })
Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {"1.1.0.0"})
asm.SetCustomAttribute(vaBuilder)

Dim paType As Type = GetType(AssemblyProductAttribute)
Dim paCtor As ConstructorInfo = paType.GetConstructor(New Type() { GetType(String) })
Dim paBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(paCtor, New Object() {"dnutest"})
asm.SetCustomAttribute(paBuilder)

Dim ataType As Type = GetType(AssemblyTitleAttribute)
Dim ataCtor As ConstructorInfo = ataType.GetConstructor(New Type() { GetType(String) })
Dim ataBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(ataCtor, New Object() {"dnutest"})
asm.SetCustomAttribute(ataBuilder)

Dim deaType As Type = GetType(AssemblyDescriptionAttribute)
Dim deaCtor As ConstructorInfo = deaType.GetConstructor(New Type() { GetType(String) })
Dim deaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(deaCtor, New Object() {"dnutest"})
asm.SetCustomAttribute(deaBuilder)


asm.DefineVersionInfoResource()
asm.Save(asmName.Name & ".exe")
End Sub


End Module