Imports dylan.NET
Imports dylan.NET.Utils
Imports System.Linq
Imports Mono.Data.Sqlite
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

Sub SQLConnection()
Dim SQLConnection As TypeBuilder = mdl.DefineType("dylan.NET.SQLiteData" & "." & "SQLConnection", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass Or TypeAttributes.BeforeFieldInit, GetType(System.Object))
Dim SQLCon As FieldBuilder = SQLConnection.DefineField("SQLCon", GetType(SqliteConnection), FieldAttributes.Public Or FieldAttributes.Static)
Dim SQLCmd As FieldBuilder = SQLConnection.DefineField("SQLCmd", GetType(SqliteCommand), FieldAttributes.Public Or FieldAttributes.Static)
Dim SQLRdr As FieldBuilder = SQLConnection.DefineField("SQLRdr", GetType(SqliteDataReader), FieldAttributes.Public Or FieldAttributes.Static)
Dim SQLTrans As FieldBuilder = SQLConnection.DefineField("SQLTrans", GetType(SqliteTransaction), FieldAttributes.Public Or FieldAttributes.Static)
Dim DTable As FieldBuilder = SQLConnection.DefineField("DTable", GetType(DataTable), FieldAttributes.Public Or FieldAttributes.Static)
Dim Rows As FieldBuilder = SQLConnection.DefineField("Rows", GetType(DataRow).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim Columns As FieldBuilder = SQLConnection.DefineField("Columns", GetType(DataColumn).MakeArrayType(), FieldAttributes.Public Or FieldAttributes.Static)
Dim AffectedRecs As FieldBuilder = SQLConnection.DefineField("AffectedRecs", GetType(System.Int32), FieldAttributes.Public Or FieldAttributes.Static)
Dim FldCount As FieldBuilder = SQLConnection.DefineField("FldCount", GetType(System.Int32), FieldAttributes.Public Or FieldAttributes.Static)
Dim RwCount As FieldBuilder = SQLConnection.DefineField("RwCount", GetType(System.Int32), FieldAttributes.Public Or FieldAttributes.Static)
Dim ColCount As FieldBuilder = SQLConnection.DefineField("ColCount", GetType(System.Int32), FieldAttributes.Public Or FieldAttributes.Static)
Dim ctor0 As ConstructorBuilder = SQLConnection.DefineConstructor(MethodAttributes.Public Or MethodAttributes.Static,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
Dim ctor0param00 As ParameterBuilder = ctor0.DefineParameter(0, ParameterAttributes.RetVal, "")
ctor0IL.MarkSequencePoint(doc2, 16, 1, 16, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, SQLCon)
ctor0IL.MarkSequencePoint(doc2, 17, 1, 17, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, SQLCmd)
ctor0IL.MarkSequencePoint(doc2, 18, 1, 18, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, SQLRdr)
ctor0IL.MarkSequencePoint(doc2, 19, 1, 19, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, SQLTrans)
ctor0IL.MarkSequencePoint(doc2, 20, 1, 20, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, DTable)
ctor0IL.MarkSequencePoint(doc2, 21, 1, 21, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, Rows)
ctor0IL.MarkSequencePoint(doc2, 22, 1, 22, 100)
ctor0IL.Emit(OpCodes.Ldnull)
ctor0IL.Emit(OpCodes.Stsfld, Columns)
ctor0IL.MarkSequencePoint(doc2, 23, 1, 23, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, AffectedRecs)
ctor0IL.MarkSequencePoint(doc2, 24, 1, 24, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, FldCount)
ctor0IL.MarkSequencePoint(doc2, 25, 1, 25, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, ColCount)
ctor0IL.MarkSequencePoint(doc2, 26, 1, 26, 100)
ctor0IL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ctor0IL.Emit(OpCodes.Stsfld, RwCount)
ctor0IL.MarkSequencePoint(doc2, 27, 1, 27, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
Dim CreateDB As MethodBuilder = SQLConnection.DefineMethod("CreateDB", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ0)
Dim CreateDBIL As ILGenerator = CreateDB.GetILGenerator()
Dim CreateDBparam00 As ParameterBuilder = CreateDB.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim CreateDBparam01 As ParameterBuilder = CreateDB.DefineParameter(1, ParameterAttributes.None, "addr")
CreateDBIL.MarkSequencePoint(doc2, 30, 1, 30, 100)
Dim locbldr0 As LocalBuilder = CreateDBIL.DeclareLocal(GetType(FileStream))
locbldr0.SetLocalSymInfo("stream")
Dim typ1(-1) As Type
CreateDBIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
CreateDBIL.Emit(OpCodes.Call, GetType(File).GetMethod("Create", typ1))
Typ = GetType(File).GetMethod("Create", typ1).ReturnType
CreateDBIL.Emit(OpCodes.Stloc, 0)
CreateDBIL.MarkSequencePoint(doc2, 31, 1, 31, 100)
CreateDBIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(FileStream)
Typ03 = Typ
interfacebool = False
For Each t As Type In Typ03.GetInterfaces()
If t.ToString() = GetType(System.IDisposable).ToString() Then
interfacebool = True
End If
Next
If interfacebool = True Then
CreateDBIL.Emit(OpCodes.Callvirt, GetType(System.IDisposable).GetMethod("Dispose", Type.EmptyTypes))
Typ = GetType(System.IDisposable).GetMethod("Dispose", Type.EmptyTypes).ReturnType
Else
CreateDBIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Dispose", Type.EmptyTypes))
Typ = Typ03.GetMethod("Dispose", Type.EmptyTypes).ReturnType
End If
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateDBIL.Emit(OpCodes.Pop)
End If
CreateDBIL.MarkSequencePoint(doc2, 32, 1, 32, 100)
CreateDBIL.Emit(OpCodes.Ret)
Dim typ3(-1) As Type
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = GetType(System.String)
Dim InitCon As MethodBuilder = SQLConnection.DefineMethod("InitCon", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ3)
Dim InitConIL As ILGenerator = InitCon.GetILGenerator()
Dim InitConparam00 As ParameterBuilder = InitCon.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim InitConparam01 As ParameterBuilder = InitCon.DefineParameter(1, ParameterAttributes.None, "constr")
InitConIL.MarkSequencePoint(doc2, 35, 1, 35, 100)
Dim typ4(-1) As Type
InitConIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
InitConIL.Emit(OpCodes.Newobj, GetType(SqliteConnection).GetConstructor(typ4))
InitConIL.Emit(OpCodes.Stsfld, SQLCon)
InitConIL.MarkSequencePoint(doc2, 36, 1, 36, 100)
InitConIL.Emit(OpCodes.Ldsfld, SQLCon)
Typ = SQLCon.FieldType
Typ03 = Typ
InitConIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Open", Type.EmptyTypes))
Typ = Typ03.GetMethod("Open", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
InitConIL.Emit(OpCodes.Pop)
End If
InitConIL.MarkSequencePoint(doc2, 37, 1, 37, 100)
InitConIL.Emit(OpCodes.Ret)
Dim EndCon As MethodBuilder = SQLConnection.DefineMethod("EndCon", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EndConIL As ILGenerator = EndCon.GetILGenerator()
Dim EndConparam00 As ParameterBuilder = EndCon.DefineParameter(0, ParameterAttributes.RetVal, "")
EndConIL.MarkSequencePoint(doc2, 40, 1, 40, 100)
EndConIL.Emit(OpCodes.Ldsfld, SQLCon)
Typ = SQLCon.FieldType
Typ03 = Typ
EndConIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Close", Type.EmptyTypes))
Typ = Typ03.GetMethod("Close", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EndConIL.Emit(OpCodes.Pop)
End If
EndConIL.MarkSequencePoint(doc2, 41, 1, 41, 100)
EndConIL.Emit(OpCodes.Ldsfld, SQLCon)
Typ = SQLCon.FieldType
Typ03 = Typ
interfacebool = False
For Each t As Type In Typ03.GetInterfaces()
If t.ToString() = GetType(System.IDisposable).ToString() Then
interfacebool = True
End If
Next
If interfacebool = True Then
EndConIL.Emit(OpCodes.Callvirt, GetType(System.IDisposable).GetMethod("Dispose", Type.EmptyTypes))
Typ = GetType(System.IDisposable).GetMethod("Dispose", Type.EmptyTypes).ReturnType
Else
EndConIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Dispose", Type.EmptyTypes))
Typ = Typ03.GetMethod("Dispose", Type.EmptyTypes).ReturnType
End If
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EndConIL.Emit(OpCodes.Pop)
End If
EndConIL.MarkSequencePoint(doc2, 42, 1, 42, 100)
EndConIL.Emit(OpCodes.Ldnull)
EndConIL.Emit(OpCodes.Stsfld, SQLCon)
EndConIL.MarkSequencePoint(doc2, 43, 1, 43, 100)
EndConIL.Emit(OpCodes.Ret)
Dim BeginTrans As MethodBuilder = SQLConnection.DefineMethod("BeginTrans", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim BeginTransIL As ILGenerator = BeginTrans.GetILGenerator()
Dim BeginTransparam00 As ParameterBuilder = BeginTrans.DefineParameter(0, ParameterAttributes.RetVal, "")
BeginTransIL.MarkSequencePoint(doc2, 46, 1, 46, 100)
BeginTransIL.Emit(OpCodes.Ldsfld, SQLCon)
Typ = SQLCon.FieldType
Typ03 = Typ
BeginTransIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("BeginTransaction", Type.EmptyTypes))
Typ = Typ03.GetMethod("BeginTransaction", Type.EmptyTypes).ReturnType
BeginTransIL.Emit(OpCodes.Stsfld, SQLTrans)
BeginTransIL.MarkSequencePoint(doc2, 47, 1, 47, 100)
BeginTransIL.Emit(OpCodes.Ret)
Dim RollBackTrans As MethodBuilder = SQLConnection.DefineMethod("RollBackTrans", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim RollBackTransIL As ILGenerator = RollBackTrans.GetILGenerator()
Dim RollBackTransparam00 As ParameterBuilder = RollBackTrans.DefineParameter(0, ParameterAttributes.RetVal, "")
RollBackTransIL.MarkSequencePoint(doc2, 50, 1, 50, 100)
RollBackTransIL.Emit(OpCodes.Ldsfld, SQLTrans)
Typ = SQLTrans.FieldType
Typ03 = Typ
RollBackTransIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Rollback", Type.EmptyTypes))
Typ = Typ03.GetMethod("Rollback", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
RollBackTransIL.Emit(OpCodes.Pop)
End If
RollBackTransIL.MarkSequencePoint(doc2, 51, 1, 51, 100)
RollBackTransIL.Emit(OpCodes.Ret)
Dim CommitTrans As MethodBuilder = SQLConnection.DefineMethod("CommitTrans", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim CommitTransIL As ILGenerator = CommitTrans.GetILGenerator()
Dim CommitTransparam00 As ParameterBuilder = CommitTrans.DefineParameter(0, ParameterAttributes.RetVal, "")
CommitTransIL.MarkSequencePoint(doc2, 54, 1, 54, 100)
CommitTransIL.Emit(OpCodes.Ldsfld, SQLTrans)
Typ = SQLTrans.FieldType
Typ03 = Typ
CommitTransIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Commit", Type.EmptyTypes))
Typ = Typ03.GetMethod("Commit", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CommitTransIL.Emit(OpCodes.Pop)
End If
CommitTransIL.MarkSequencePoint(doc2, 55, 1, 55, 100)
CommitTransIL.Emit(OpCodes.Ret)
Dim EndTrans As MethodBuilder = SQLConnection.DefineMethod("EndTrans", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim EndTransIL As ILGenerator = EndTrans.GetILGenerator()
Dim EndTransparam00 As ParameterBuilder = EndTrans.DefineParameter(0, ParameterAttributes.RetVal, "")
EndTransIL.MarkSequencePoint(doc2, 58, 1, 58, 100)
EndTransIL.Emit(OpCodes.Ldsfld, SQLTrans)
Typ = SQLTrans.FieldType
Typ03 = Typ
interfacebool = False
For Each t As Type In Typ03.GetInterfaces()
If t.ToString() = GetType(System.IDisposable).ToString() Then
interfacebool = True
End If
Next
If interfacebool = True Then
EndTransIL.Emit(OpCodes.Callvirt, GetType(System.IDisposable).GetMethod("Dispose", Type.EmptyTypes))
Typ = GetType(System.IDisposable).GetMethod("Dispose", Type.EmptyTypes).ReturnType
Else
EndTransIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Dispose", Type.EmptyTypes))
Typ = Typ03.GetMethod("Dispose", Type.EmptyTypes).ReturnType
End If
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
EndTransIL.Emit(OpCodes.Pop)
End If
EndTransIL.MarkSequencePoint(doc2, 59, 1, 59, 100)
EndTransIL.Emit(OpCodes.Ldnull)
EndTransIL.Emit(OpCodes.Stsfld, SQLTrans)
EndTransIL.MarkSequencePoint(doc2, 60, 1, 60, 100)
EndTransIL.Emit(OpCodes.Ret)
Dim typ12(-1) As Type
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = GetType(System.String)
Dim PrepCmd As MethodBuilder = SQLConnection.DefineMethod("PrepCmd", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), typ12)
Dim PrepCmdIL As ILGenerator = PrepCmd.GetILGenerator()
Dim PrepCmdparam00 As ParameterBuilder = PrepCmd.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim PrepCmdparam01 As ParameterBuilder = PrepCmd.DefineParameter(1, ParameterAttributes.None, "cmdtext")
PrepCmdIL.MarkSequencePoint(doc2, 63, 1, 63, 100)
PrepCmdIL.Emit(OpCodes.Ldsfld, SQLTrans)
Typ = SQLTrans.FieldType
PrepCmdIL.Emit(OpCodes.Ldnull)
Dim fa0 As System.Reflection.Emit.Label = PrepCmdIL.DefineLabel()
Dim tru0 As System.Reflection.Emit.Label = PrepCmdIL.DefineLabel()
Dim cont0 As System.Reflection.Emit.Label = PrepCmdIL.DefineLabel()
PrepCmdIL.Emit(OpCodes.Beq, tru0)
PrepCmdIL.Emit(OpCodes.Br, fa0)
PrepCmdIL.MarkLabel(tru0)
PrepCmdIL.MarkSequencePoint(doc2, 64, 1, 64, 100)
Dim typ13(-1) As Type
PrepCmdIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
PrepCmdIL.Emit(OpCodes.Ldsfld, SQLCon)
Typ = SQLCon.FieldType
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
PrepCmdIL.Emit(OpCodes.Newobj, GetType(SqliteCommand).GetConstructor(typ13))
PrepCmdIL.Emit(OpCodes.Stsfld, SQLCmd)
PrepCmdIL.MarkSequencePoint(doc2, 65, 1, 65, 100)
PrepCmdIL.Emit(OpCodes.Br, cont0)
PrepCmdIL.MarkLabel(fa0)
PrepCmdIL.MarkSequencePoint(doc2, 66, 1, 66, 100)
Dim typ14(-1) As Type
PrepCmdIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.String)
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
PrepCmdIL.Emit(OpCodes.Ldsfld, SQLCon)
Typ = SQLCon.FieldType
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
PrepCmdIL.Emit(OpCodes.Ldsfld, SQLTrans)
Typ = SQLTrans.FieldType
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = Typ
PrepCmdIL.Emit(OpCodes.Newobj, GetType(SqliteCommand).GetConstructor(typ14))
PrepCmdIL.Emit(OpCodes.Stsfld, SQLCmd)
PrepCmdIL.MarkSequencePoint(doc2, 67, 1, 67, 100)
PrepCmdIL.Emit(OpCodes.Br, cont0)
PrepCmdIL.MarkLabel(cont0)
PrepCmdIL.MarkSequencePoint(doc2, 68, 1, 68, 100)
PrepCmdIL.Emit(OpCodes.Ret)
Dim ExecRdr As MethodBuilder = SQLConnection.DefineMethod("ExecRdr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim ExecRdrIL As ILGenerator = ExecRdr.GetILGenerator()
Dim ExecRdrparam00 As ParameterBuilder = ExecRdr.DefineParameter(0, ParameterAttributes.RetVal, "")
ExecRdrIL.MarkSequencePoint(doc2, 71, 1, 71, 100)
ExecRdrIL.Emit(OpCodes.Ldsfld, SQLCmd)
Typ = SQLCmd.FieldType
Typ03 = Typ
ExecRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ExecuteReader", Type.EmptyTypes))
Typ = Typ03.GetMethod("ExecuteReader", Type.EmptyTypes).ReturnType
ExecRdrIL.Emit(OpCodes.Stsfld, SQLRdr)
ExecRdrIL.MarkSequencePoint(doc2, 72, 1, 72, 100)
ExecRdrIL.Emit(OpCodes.Ldsfld, SQLRdr)
Typ = SQLRdr.FieldType
Typ03 = Typ
ExecRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_RecordsAffected", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_RecordsAffected", Type.EmptyTypes).ReturnType
ExecRdrIL.Emit(OpCodes.Stsfld, AffectedRecs)
ExecRdrIL.MarkSequencePoint(doc2, 73, 1, 73, 100)
ExecRdrIL.Emit(OpCodes.Ldsfld, SQLRdr)
Typ = SQLRdr.FieldType
Typ03 = Typ
ExecRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_FieldCount", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_FieldCount", Type.EmptyTypes).ReturnType
ExecRdrIL.Emit(OpCodes.Stsfld, FldCount)
ExecRdrIL.MarkSequencePoint(doc2, 74, 1, 74, 100)
ExecRdrIL.Emit(OpCodes.Ret)
Dim ProcessRdr As MethodBuilder = SQLConnection.DefineMethod("ProcessRdr", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim ProcessRdrIL As ILGenerator = ProcessRdr.GetILGenerator()
Dim ProcessRdrparam00 As ParameterBuilder = ProcessRdr.DefineParameter(0, ParameterAttributes.RetVal, "")
ProcessRdrIL.MarkSequencePoint(doc2, 77, 1, 77, 100)
ProcessRdrIL.Emit(OpCodes.Newobj, GetType(DataTable).GetConstructor(Type.EmptyTypes))
ProcessRdrIL.Emit(OpCodes.Stsfld, DTable)
ProcessRdrIL.MarkSequencePoint(doc2, 78, 1, 78, 100)
Dim typ18(-1) As Type
ProcessRdrIL.Emit(OpCodes.Ldsfld, DTable)
Typ = DTable.FieldType
Typ03 = Typ
ProcessRdrIL.Emit(OpCodes.Ldsfld, SQLRdr)
Typ = SQLRdr.FieldType
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
ProcessRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("Load", typ18))
Typ = Typ03.GetMethod("Load", typ18).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
ProcessRdrIL.Emit(OpCodes.Pop)
End If
ProcessRdrIL.MarkSequencePoint(doc2, 79, 1, 79, 100)
Dim locbldr1 As LocalBuilder = ProcessRdrIL.DeclareLocal(GetType(System.Int32))
locbldr1.SetLocalSymInfo("cnt")
ProcessRdrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ProcessRdrIL.Emit(OpCodes.Stloc, 0)
ProcessRdrIL.MarkSequencePoint(doc2, 80, 1, 80, 100)
Dim locbldr2 As LocalBuilder = ProcessRdrIL.DeclareLocal(GetType(DataRowCollection))
locbldr2.SetLocalSymInfo("rws")
ProcessRdrIL.Emit(OpCodes.Ldsfld, DTable)
Typ = DTable.FieldType
Typ03 = Typ
ProcessRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Rows", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Rows", Type.EmptyTypes).ReturnType
ProcessRdrIL.Emit(OpCodes.Stloc, 1)
ProcessRdrIL.MarkSequencePoint(doc2, 81, 1, 81, 100)
ProcessRdrIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(DataRowCollection)
Typ03 = Typ
ProcessRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Count", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Count", Type.EmptyTypes).ReturnType
ProcessRdrIL.Emit(OpCodes.Stloc, 0)
ProcessRdrIL.MarkSequencePoint(doc2, 82, 1, 82, 100)
ProcessRdrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ProcessRdrIL.Emit(OpCodes.Stsfld, RwCount)
ProcessRdrIL.MarkSequencePoint(doc2, 83, 1, 83, 100)
ProcessRdrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ProcessRdrIL.Emit(OpCodes.Conv_U)
ProcessRdrIL.Emit(OpCodes.Newarr, GetType(DataRow))
ProcessRdrIL.Emit(OpCodes.Stsfld, Rows)
ProcessRdrIL.MarkSequencePoint(doc2, 84, 1, 84, 100)
Dim typ21(-1) As Type
ProcessRdrIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(DataRowCollection)
Typ03 = Typ
ProcessRdrIL.Emit(OpCodes.Ldsfld, Rows)
Typ = Rows.FieldType
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
ProcessRdrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
ProcessRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("CopyTo", typ21))
Typ = Typ03.GetMethod("CopyTo", typ21).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
ProcessRdrIL.Emit(OpCodes.Pop)
End If
ProcessRdrIL.MarkSequencePoint(doc2, 85, 1, 85, 100)
Dim locbldr3 As LocalBuilder = ProcessRdrIL.DeclareLocal(GetType(DataColumnCollection))
locbldr3.SetLocalSymInfo("clms")
ProcessRdrIL.Emit(OpCodes.Ldsfld, DTable)
Typ = DTable.FieldType
Typ03 = Typ
ProcessRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Columns", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Columns", Type.EmptyTypes).ReturnType
ProcessRdrIL.Emit(OpCodes.Stloc, 2)
ProcessRdrIL.MarkSequencePoint(doc2, 86, 1, 86, 100)
ProcessRdrIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(DataColumnCollection)
Typ03 = Typ
ProcessRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Count", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_Count", Type.EmptyTypes).ReturnType
ProcessRdrIL.Emit(OpCodes.Stloc, 0)
ProcessRdrIL.MarkSequencePoint(doc2, 87, 1, 87, 100)
ProcessRdrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ProcessRdrIL.Emit(OpCodes.Stsfld, ColCount)
ProcessRdrIL.MarkSequencePoint(doc2, 88, 1, 88, 100)
ProcessRdrIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Int32)
ProcessRdrIL.Emit(OpCodes.Conv_U)
ProcessRdrIL.Emit(OpCodes.Newarr, GetType(DataColumn))
ProcessRdrIL.Emit(OpCodes.Stsfld, Columns)
ProcessRdrIL.MarkSequencePoint(doc2, 89, 1, 89, 100)
Dim typ24(-1) As Type
ProcessRdrIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(DataColumnCollection)
Typ03 = Typ
ProcessRdrIL.Emit(OpCodes.Ldsfld, Columns)
Typ = Columns.FieldType
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
ProcessRdrIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
ProcessRdrIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("CopyTo", typ24))
Typ = Typ03.GetMethod("CopyTo", typ24).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
ProcessRdrIL.Emit(OpCodes.Pop)
End If
ProcessRdrIL.MarkSequencePoint(doc2, 90, 1, 90, 100)
ProcessRdrIL.Emit(OpCodes.Ret)
Dim ExecQuery As MethodBuilder = SQLConnection.DefineMethod("ExecQuery", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim ExecQueryIL As ILGenerator = ExecQuery.GetILGenerator()
Dim ExecQueryparam00 As ParameterBuilder = ExecQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
ExecQueryIL.MarkSequencePoint(doc2, 93, 1, 93, 100)
ExecQueryIL.Emit(OpCodes.Call, ExecRdr)
Typ = ExecRdr.ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
ExecQueryIL.Emit(OpCodes.Pop)
End If
ExecQueryIL.MarkSequencePoint(doc2, 94, 1, 94, 100)
ExecQueryIL.Emit(OpCodes.Call, ProcessRdr)
Typ = ProcessRdr.ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
ExecQueryIL.Emit(OpCodes.Pop)
End If
ExecQueryIL.MarkSequencePoint(doc2, 95, 1, 95, 100)
ExecQueryIL.Emit(OpCodes.Ret)
Dim ExecNonQuery As MethodBuilder = SQLConnection.DefineMethod("ExecNonQuery", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Void), Type.EmptyTypes)
Dim ExecNonQueryIL As ILGenerator = ExecNonQuery.GetILGenerator()
Dim ExecNonQueryparam00 As ParameterBuilder = ExecNonQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
ExecNonQueryIL.MarkSequencePoint(doc2, 98, 1, 98, 100)
ExecNonQueryIL.Emit(OpCodes.Ldsfld, SQLCmd)
Typ = SQLCmd.FieldType
Typ03 = Typ
ExecNonQueryIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("ExecuteNonQuery", Type.EmptyTypes))
Typ = Typ03.GetMethod("ExecuteNonQuery", Type.EmptyTypes).ReturnType
ExecNonQueryIL.Emit(OpCodes.Stsfld, AffectedRecs)
ExecNonQueryIL.MarkSequencePoint(doc2, 99, 1, 99, 100)
ExecNonQueryIL.Emit(OpCodes.Ret)
Dim get_Table As MethodBuilder = SQLConnection.DefineMethod("get_Table", MethodAttributes.Public Or MethodAttributes.Static, GetType(DataTable), Type.EmptyTypes)
Dim get_TableIL As ILGenerator = get_Table.GetILGenerator()
Dim get_Tableparam00 As ParameterBuilder = get_Table.DefineParameter(0, ParameterAttributes.RetVal, "")
get_TableIL.MarkSequencePoint(doc2, 102, 1, 102, 100)
get_TableIL.Emit(OpCodes.Ldsfld, DTable)
Typ = DTable.FieldType
get_TableIL.MarkSequencePoint(doc2, 103, 1, 103, 100)
get_TableIL.Emit(OpCodes.Ret)
Dim get_AffectedRecords As MethodBuilder = SQLConnection.DefineMethod("get_AffectedRecords", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Int32), Type.EmptyTypes)
Dim get_AffectedRecordsIL As ILGenerator = get_AffectedRecords.GetILGenerator()
Dim get_AffectedRecordsparam00 As ParameterBuilder = get_AffectedRecords.DefineParameter(0, ParameterAttributes.RetVal, "")
get_AffectedRecordsIL.MarkSequencePoint(doc2, 106, 1, 106, 100)
get_AffectedRecordsIL.Emit(OpCodes.Ldsfld, AffectedRecs)
Typ = AffectedRecs.FieldType
get_AffectedRecordsIL.MarkSequencePoint(doc2, 107, 1, 107, 100)
get_AffectedRecordsIL.Emit(OpCodes.Ret)
Dim get_RowCount As MethodBuilder = SQLConnection.DefineMethod("get_RowCount", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Int32), Type.EmptyTypes)
Dim get_RowCountIL As ILGenerator = get_RowCount.GetILGenerator()
Dim get_RowCountparam00 As ParameterBuilder = get_RowCount.DefineParameter(0, ParameterAttributes.RetVal, "")
get_RowCountIL.MarkSequencePoint(doc2, 110, 1, 110, 100)
get_RowCountIL.Emit(OpCodes.Ldsfld, RwCount)
Typ = RwCount.FieldType
get_RowCountIL.MarkSequencePoint(doc2, 111, 1, 111, 100)
get_RowCountIL.Emit(OpCodes.Ret)
Dim get_ColumnCount As MethodBuilder = SQLConnection.DefineMethod("get_ColumnCount", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Int32), Type.EmptyTypes)
Dim get_ColumnCountIL As ILGenerator = get_ColumnCount.GetILGenerator()
Dim get_ColumnCountparam00 As ParameterBuilder = get_ColumnCount.DefineParameter(0, ParameterAttributes.RetVal, "")
get_ColumnCountIL.MarkSequencePoint(doc2, 114, 1, 114, 100)
get_ColumnCountIL.Emit(OpCodes.Ldsfld, ColCount)
Typ = ColCount.FieldType
get_ColumnCountIL.MarkSequencePoint(doc2, 115, 1, 115, 100)
get_ColumnCountIL.Emit(OpCodes.Ret)
Dim get_RowArray As MethodBuilder = SQLConnection.DefineMethod("get_RowArray", MethodAttributes.Public Or MethodAttributes.Static, GetType(DataRow).MakeArrayType(), Type.EmptyTypes)
Dim get_RowArrayIL As ILGenerator = get_RowArray.GetILGenerator()
Dim get_RowArrayparam00 As ParameterBuilder = get_RowArray.DefineParameter(0, ParameterAttributes.RetVal, "")
get_RowArrayIL.MarkSequencePoint(doc2, 118, 1, 118, 100)
get_RowArrayIL.Emit(OpCodes.Ldsfld, Rows)
Typ = Rows.FieldType
get_RowArrayIL.MarkSequencePoint(doc2, 119, 1, 119, 100)
get_RowArrayIL.Emit(OpCodes.Ret)
Dim get_ColumnArray As MethodBuilder = SQLConnection.DefineMethod("get_ColumnArray", MethodAttributes.Public Or MethodAttributes.Static, GetType(DataColumn).MakeArrayType(), Type.EmptyTypes)
Dim get_ColumnArrayIL As ILGenerator = get_ColumnArray.GetILGenerator()
Dim get_ColumnArrayparam00 As ParameterBuilder = get_ColumnArray.DefineParameter(0, ParameterAttributes.RetVal, "")
get_ColumnArrayIL.MarkSequencePoint(doc2, 122, 1, 122, 100)
get_ColumnArrayIL.Emit(OpCodes.Ldsfld, Columns)
Typ = Columns.FieldType
get_ColumnArrayIL.MarkSequencePoint(doc2, 123, 1, 123, 100)
get_ColumnArrayIL.Emit(OpCodes.Ret)
Dim typ26(-1) As Type
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = GetType(System.Int32)
Dim get_Row As MethodBuilder = SQLConnection.DefineMethod("get_Row", MethodAttributes.Public Or MethodAttributes.Static, GetType(DataRow), typ26)
Dim get_RowIL As ILGenerator = get_Row.GetILGenerator()
Dim get_Rowparam00 As ParameterBuilder = get_Row.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_Rowparam01 As ParameterBuilder = get_Row.DefineParameter(1, ParameterAttributes.None, "ind")
get_RowIL.MarkSequencePoint(doc2, 126, 1, 126, 100)
get_RowIL.Emit(OpCodes.Ldsfld, Rows)
Typ = Rows.FieldType
Typ02 = Typ
get_RowIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
get_RowIL.Emit(OpCodes.Conv_U)
Typ = Typ02
get_RowIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
get_RowIL.MarkSequencePoint(doc2, 127, 1, 127, 100)
get_RowIL.Emit(OpCodes.Ret)
Dim typ27(-1) As Type
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = GetType(System.Int32)
Dim get_Column As MethodBuilder = SQLConnection.DefineMethod("get_Column", MethodAttributes.Public Or MethodAttributes.Static, GetType(DataColumn), typ27)
Dim get_ColumnIL As ILGenerator = get_Column.GetILGenerator()
Dim get_Columnparam00 As ParameterBuilder = get_Column.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_Columnparam01 As ParameterBuilder = get_Column.DefineParameter(1, ParameterAttributes.None, "ind")
get_ColumnIL.MarkSequencePoint(doc2, 130, 1, 130, 100)
get_ColumnIL.Emit(OpCodes.Ldsfld, Columns)
Typ = Columns.FieldType
Typ02 = Typ
get_ColumnIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
get_ColumnIL.Emit(OpCodes.Conv_U)
Typ = Typ02
get_ColumnIL.Emit(OpCodes.Ldelem, Typ.GetElementType())
Typ = Typ.GetElementType()
get_ColumnIL.MarkSequencePoint(doc2, 131, 1, 131, 100)
get_ColumnIL.Emit(OpCodes.Ret)
Dim typ28(-1) As Type
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = GetType(System.Int32)
Dim get_RowItems As MethodBuilder = SQLConnection.DefineMethod("get_RowItems", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Object).MakeArrayType(), typ28)
Dim get_RowItemsIL As ILGenerator = get_RowItems.GetILGenerator()
Dim get_RowItemsparam00 As ParameterBuilder = get_RowItems.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemsparam01 As ParameterBuilder = get_RowItems.DefineParameter(1, ParameterAttributes.None, "rowind")
get_RowItemsIL.MarkSequencePoint(doc2, 134, 1, 134, 100)
Dim locbldr4 As LocalBuilder = get_RowItemsIL.DeclareLocal(GetType(DataRow))
locbldr4.SetLocalSymInfo("row")
Dim typ29(-1) As Type
get_RowItemsIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
get_RowItemsIL.Emit(OpCodes.Call, get_Row)
Typ = get_Row.ReturnType
get_RowItemsIL.Emit(OpCodes.Stloc, 0)
get_RowItemsIL.MarkSequencePoint(doc2, 135, 1, 135, 100)
Dim locbldr5 As LocalBuilder = get_RowItemsIL.DeclareLocal(GetType(System.Object).MakeArrayType())
locbldr5.SetLocalSymInfo("arr")
get_RowItemsIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(DataRow)
Typ03 = Typ
get_RowItemsIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_ItemArray", Type.EmptyTypes))
Typ = Typ03.GetMethod("get_ItemArray", Type.EmptyTypes).ReturnType
get_RowItemsIL.Emit(OpCodes.Stloc, 1)
get_RowItemsIL.MarkSequencePoint(doc2, 136, 1, 136, 100)
get_RowItemsIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Object).MakeArrayType()
get_RowItemsIL.MarkSequencePoint(doc2, 137, 1, 137, 100)
get_RowItemsIL.Emit(OpCodes.Ret)
Dim typ31(-1) As Type
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = GetType(System.Int32)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = GetType(System.Int32)
Dim get_RowItem As MethodBuilder = SQLConnection.DefineMethod("get_RowItem", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Object), typ31)
Dim get_RowItemIL As ILGenerator = get_RowItem.GetILGenerator()
Dim get_RowItemparam00 As ParameterBuilder = get_RowItem.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemparam01 As ParameterBuilder = get_RowItem.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemparam02 As ParameterBuilder = get_RowItem.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemIL.MarkSequencePoint(doc2, 140, 1, 140, 100)
Dim locbldr6 As LocalBuilder = get_RowItemIL.DeclareLocal(GetType(DataRow))
locbldr6.SetLocalSymInfo("row")
Dim typ32(-1) As Type
get_RowItemIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
get_RowItemIL.Emit(OpCodes.Call, get_Row)
Typ = get_Row.ReturnType
get_RowItemIL.Emit(OpCodes.Stloc, 0)
get_RowItemIL.MarkSequencePoint(doc2, 141, 1, 141, 100)
Dim locbldr7 As LocalBuilder = get_RowItemIL.DeclareLocal(GetType(System.Object))
locbldr7.SetLocalSymInfo("o")
Dim typ33(-1) As Type
get_RowItemIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(DataRow)
Typ03 = Typ
get_RowItemIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
get_RowItemIL.Emit(OpCodes.Callvirt, Typ03.GetMethod("get_Item", typ33))
Typ = Typ03.GetMethod("get_Item", typ33).ReturnType
get_RowItemIL.Emit(OpCodes.Stloc, 1)
get_RowItemIL.MarkSequencePoint(doc2, 142, 1, 142, 100)
get_RowItemIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Object)
get_RowItemIL.MarkSequencePoint(doc2, 143, 1, 143, 100)
get_RowItemIL.Emit(OpCodes.Ret)
Dim typ34(-1) As Type
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = GetType(System.Int32)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = GetType(System.Int32)
Dim get_RowItemInt8 As MethodBuilder = SQLConnection.DefineMethod("get_RowItemInt8", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.SByte), typ34)
Dim get_RowItemInt8IL As ILGenerator = get_RowItemInt8.GetILGenerator()
Dim get_RowItemInt8param00 As ParameterBuilder = get_RowItemInt8.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemInt8param01 As ParameterBuilder = get_RowItemInt8.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemInt8param02 As ParameterBuilder = get_RowItemInt8.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemInt8IL.MarkSequencePoint(doc2, 146, 1, 146, 100)
Dim locbldr8 As LocalBuilder = get_RowItemInt8IL.DeclareLocal(GetType(System.Object))
locbldr8.SetLocalSymInfo("o")
Dim typ35(-1) As Type
get_RowItemInt8IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
get_RowItemInt8IL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
get_RowItemInt8IL.Emit(OpCodes.Call, get_RowItem)
Typ = get_RowItem.ReturnType
get_RowItemInt8IL.Emit(OpCodes.Stloc, 0)
get_RowItemInt8IL.MarkSequencePoint(doc2, 147, 1, 147, 100)
get_RowItemInt8IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Object)
Dim typ36 As Type() = {Typ}
get_RowItemInt8IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToSByte", typ36))
Typ = GetType(System.Convert).GetMethod("ToSByte", typ36).ReturnType
get_RowItemInt8IL.MarkSequencePoint(doc2, 148, 1, 148, 100)
get_RowItemInt8IL.Emit(OpCodes.Ret)
Dim typ37(-1) As Type
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = GetType(System.Int32)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = GetType(System.Int32)
Dim get_RowItemInt16 As MethodBuilder = SQLConnection.DefineMethod("get_RowItemInt16", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Int16), typ37)
Dim get_RowItemInt16IL As ILGenerator = get_RowItemInt16.GetILGenerator()
Dim get_RowItemInt16param00 As ParameterBuilder = get_RowItemInt16.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemInt16param01 As ParameterBuilder = get_RowItemInt16.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemInt16param02 As ParameterBuilder = get_RowItemInt16.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemInt16IL.MarkSequencePoint(doc2, 151, 1, 151, 100)
Dim locbldr9 As LocalBuilder = get_RowItemInt16IL.DeclareLocal(GetType(System.Object))
locbldr9.SetLocalSymInfo("o")
Dim typ38(-1) As Type
get_RowItemInt16IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
get_RowItemInt16IL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
get_RowItemInt16IL.Emit(OpCodes.Call, get_RowItem)
Typ = get_RowItem.ReturnType
get_RowItemInt16IL.Emit(OpCodes.Stloc, 0)
get_RowItemInt16IL.MarkSequencePoint(doc2, 152, 1, 152, 100)
get_RowItemInt16IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Object)
Dim typ39 As Type() = {Typ}
get_RowItemInt16IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt16", typ39))
Typ = GetType(System.Convert).GetMethod("ToInt16", typ39).ReturnType
get_RowItemInt16IL.MarkSequencePoint(doc2, 153, 1, 153, 100)
get_RowItemInt16IL.Emit(OpCodes.Ret)
Dim typ40(-1) As Type
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = GetType(System.Int32)
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = GetType(System.Int32)
Dim get_RowItemInt32 As MethodBuilder = SQLConnection.DefineMethod("get_RowItemInt32", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Int32), typ40)
Dim get_RowItemInt32IL As ILGenerator = get_RowItemInt32.GetILGenerator()
Dim get_RowItemInt32param00 As ParameterBuilder = get_RowItemInt32.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemInt32param01 As ParameterBuilder = get_RowItemInt32.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemInt32param02 As ParameterBuilder = get_RowItemInt32.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemInt32IL.MarkSequencePoint(doc2, 156, 1, 156, 100)
Dim locbldr10 As LocalBuilder = get_RowItemInt32IL.DeclareLocal(GetType(System.Object))
locbldr10.SetLocalSymInfo("o")
Dim typ41(-1) As Type
get_RowItemInt32IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
get_RowItemInt32IL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
get_RowItemInt32IL.Emit(OpCodes.Call, get_RowItem)
Typ = get_RowItem.ReturnType
get_RowItemInt32IL.Emit(OpCodes.Stloc, 0)
get_RowItemInt32IL.MarkSequencePoint(doc2, 157, 1, 157, 100)
get_RowItemInt32IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Object)
Dim typ42 As Type() = {Typ}
get_RowItemInt32IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt32", typ42))
Typ = GetType(System.Convert).GetMethod("ToInt32", typ42).ReturnType
get_RowItemInt32IL.MarkSequencePoint(doc2, 158, 1, 158, 100)
get_RowItemInt32IL.Emit(OpCodes.Ret)
Dim typ43(-1) As Type
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = GetType(System.Int32)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = GetType(System.Int32)
Dim get_RowItemInt64 As MethodBuilder = SQLConnection.DefineMethod("get_RowItemInt64", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Int64), typ43)
Dim get_RowItemInt64IL As ILGenerator = get_RowItemInt64.GetILGenerator()
Dim get_RowItemInt64param00 As ParameterBuilder = get_RowItemInt64.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemInt64param01 As ParameterBuilder = get_RowItemInt64.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemInt64param02 As ParameterBuilder = get_RowItemInt64.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemInt64IL.MarkSequencePoint(doc2, 161, 1, 161, 100)
Dim locbldr11 As LocalBuilder = get_RowItemInt64IL.DeclareLocal(GetType(System.Object))
locbldr11.SetLocalSymInfo("o")
Dim typ44(-1) As Type
get_RowItemInt64IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
get_RowItemInt64IL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
get_RowItemInt64IL.Emit(OpCodes.Call, get_RowItem)
Typ = get_RowItem.ReturnType
get_RowItemInt64IL.Emit(OpCodes.Stloc, 0)
get_RowItemInt64IL.MarkSequencePoint(doc2, 162, 1, 162, 100)
get_RowItemInt64IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Object)
Dim typ45 As Type() = {Typ}
get_RowItemInt64IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt64", typ45))
Typ = GetType(System.Convert).GetMethod("ToInt64", typ45).ReturnType
get_RowItemInt64IL.MarkSequencePoint(doc2, 163, 1, 163, 100)
get_RowItemInt64IL.Emit(OpCodes.Ret)
Dim typ46(-1) As Type
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = GetType(System.Int32)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = GetType(System.Int32)
Dim get_RowItemFloat32 As MethodBuilder = SQLConnection.DefineMethod("get_RowItemFloat32", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Single), typ46)
Dim get_RowItemFloat32IL As ILGenerator = get_RowItemFloat32.GetILGenerator()
Dim get_RowItemFloat32param00 As ParameterBuilder = get_RowItemFloat32.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemFloat32param01 As ParameterBuilder = get_RowItemFloat32.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemFloat32param02 As ParameterBuilder = get_RowItemFloat32.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemFloat32IL.MarkSequencePoint(doc2, 166, 1, 166, 100)
Dim locbldr12 As LocalBuilder = get_RowItemFloat32IL.DeclareLocal(GetType(System.Object))
locbldr12.SetLocalSymInfo("o")
Dim typ47(-1) As Type
get_RowItemFloat32IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
get_RowItemFloat32IL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
get_RowItemFloat32IL.Emit(OpCodes.Call, get_RowItem)
Typ = get_RowItem.ReturnType
get_RowItemFloat32IL.Emit(OpCodes.Stloc, 0)
get_RowItemFloat32IL.MarkSequencePoint(doc2, 167, 1, 167, 100)
get_RowItemFloat32IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Object)
Dim typ48 As Type() = {Typ}
get_RowItemFloat32IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToSingle", typ48))
Typ = GetType(System.Convert).GetMethod("ToSingle", typ48).ReturnType
get_RowItemFloat32IL.MarkSequencePoint(doc2, 168, 1, 168, 100)
get_RowItemFloat32IL.Emit(OpCodes.Ret)
Dim typ49(-1) As Type
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = GetType(System.Int32)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = GetType(System.Int32)
Dim get_RowItemFloat64 As MethodBuilder = SQLConnection.DefineMethod("get_RowItemFloat64", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.Double), typ49)
Dim get_RowItemFloat64IL As ILGenerator = get_RowItemFloat64.GetILGenerator()
Dim get_RowItemFloat64param00 As ParameterBuilder = get_RowItemFloat64.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemFloat64param01 As ParameterBuilder = get_RowItemFloat64.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemFloat64param02 As ParameterBuilder = get_RowItemFloat64.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemFloat64IL.MarkSequencePoint(doc2, 171, 1, 171, 100)
Dim locbldr13 As LocalBuilder = get_RowItemFloat64IL.DeclareLocal(GetType(System.Object))
locbldr13.SetLocalSymInfo("o")
Dim typ50(-1) As Type
get_RowItemFloat64IL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
get_RowItemFloat64IL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
get_RowItemFloat64IL.Emit(OpCodes.Call, get_RowItem)
Typ = get_RowItem.ReturnType
get_RowItemFloat64IL.Emit(OpCodes.Stloc, 0)
get_RowItemFloat64IL.MarkSequencePoint(doc2, 172, 1, 172, 100)
get_RowItemFloat64IL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Object)
Dim typ51 As Type() = {Typ}
get_RowItemFloat64IL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToDouble", typ51))
Typ = GetType(System.Convert).GetMethod("ToDouble", typ51).ReturnType
get_RowItemFloat64IL.MarkSequencePoint(doc2, 173, 1, 173, 100)
get_RowItemFloat64IL.Emit(OpCodes.Ret)
Dim typ52(-1) As Type
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = GetType(System.Int32)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = GetType(System.Int32)
Dim get_RowItemString As MethodBuilder = SQLConnection.DefineMethod("get_RowItemString", MethodAttributes.Public Or MethodAttributes.Static, GetType(System.String), typ52)
Dim get_RowItemStringIL As ILGenerator = get_RowItemString.GetILGenerator()
Dim get_RowItemStringparam00 As ParameterBuilder = get_RowItemString.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim get_RowItemStringparam01 As ParameterBuilder = get_RowItemString.DefineParameter(1, ParameterAttributes.None, "rowind")
Dim get_RowItemStringparam02 As ParameterBuilder = get_RowItemString.DefineParameter(2, ParameterAttributes.None, "itemind")
get_RowItemStringIL.MarkSequencePoint(doc2, 176, 1, 176, 100)
Dim locbldr14 As LocalBuilder = get_RowItemStringIL.DeclareLocal(GetType(System.Object))
locbldr14.SetLocalSymInfo("o")
Dim typ53(-1) As Type
get_RowItemStringIL.Emit(OpCodes.Ldarg, 0)
Typ = GetType(System.Int32)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
get_RowItemStringIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
get_RowItemStringIL.Emit(OpCodes.Call, get_RowItem)
Typ = get_RowItem.ReturnType
get_RowItemStringIL.Emit(OpCodes.Stloc, 0)
get_RowItemStringIL.MarkSequencePoint(doc2, 177, 1, 177, 100)
get_RowItemStringIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.Object)
Dim typ54 As Type() = {Typ}
get_RowItemStringIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ54))
Typ = GetType(System.Convert).GetMethod("ToString", typ54).ReturnType
get_RowItemStringIL.MarkSequencePoint(doc2, 178, 1, 178, 100)
get_RowItemStringIL.Emit(OpCodes.Ret)
SQLConnection.CreateType()
End Sub


Dim doc3 As ISymbolDocumentWriter

Sub NameReader()
Dim NameReader As TypeBuilder = mdl.DefineType("dylan.NET.SQLiteData" & "." & "NameReader", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass, GetType(System.Object))
Dim Name As FieldBuilder = NameReader.DefineField("Name", GetType(System.String), FieldAttributes.Public)
Dim Surname As FieldBuilder = NameReader.DefineField("Surname", GetType(System.String), FieldAttributes.Public)
Dim ID As FieldBuilder = NameReader.DefineField("ID", GetType(System.Int64), FieldAttributes.Public)
Dim Count As FieldBuilder = NameReader.DefineField("Count", GetType(System.Int64), FieldAttributes.Public)
Dim TableName As FieldBuilder = NameReader.DefineField("TableName", GetType(System.String), FieldAttributes.Public)
Dim ctor0 As ConstructorBuilder = NameReader.DefineConstructor(MethodAttributes.Public,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
Dim ctor0param00 As ParameterBuilder = ctor0.DefineParameter(0, ParameterAttributes.RetVal, "")
ctor0IL.MarkSequencePoint(doc3, 10, 1, 10, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Call, GetType(System.Object).GetConstructor(Type.EmptyTypes))
ctor0IL.MarkSequencePoint(doc3, 11, 1, 11, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Name)
ctor0IL.MarkSequencePoint(doc3, 12, 1, 12, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Surname)
ctor0IL.MarkSequencePoint(doc3, 13, 1, 13, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, TableName)
ctor0IL.MarkSequencePoint(doc3, 14, 1, 14, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, ID)
ctor0IL.MarkSequencePoint(doc3, 15, 1, 15, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, Count)
ctor0IL.MarkSequencePoint(doc3, 16, 1, 16, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
Dim CreateAndOpenTable As MethodBuilder = NameReader.DefineMethod("CreateAndOpenTable", MethodAttributes.Public, GetType(System.Void), typ0)
Dim CreateAndOpenTableIL As ILGenerator = CreateAndOpenTable.GetILGenerator()
Dim CreateAndOpenTableparam00 As ParameterBuilder = CreateAndOpenTable.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim CreateAndOpenTableparam01 As ParameterBuilder = CreateAndOpenTable.DefineParameter(1, ParameterAttributes.None, "constr")
Dim CreateAndOpenTableparam02 As ParameterBuilder = CreateAndOpenTable.DefineParameter(2, ParameterAttributes.None, "tblname")
CreateAndOpenTableIL.MarkSequencePoint(doc3, 19, 1, 19, 100)
Dim typ1(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ1))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 20, 1, 20, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 21, 1, 21, 100)
Dim locbldr15 As LocalBuilder = CreateAndOpenTableIL.DeclareLocal(GetType(System.String))
locbldr15.SetLocalSymInfo("str")
Dim typ2(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "create table ")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "(Name text, Surname text);")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ2))
Typ = GetType(String).GetMethod("Concat", typ2).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stloc, 0)
CreateAndOpenTableIL.MarkSequencePoint(doc3, 22, 1, 22, 100)
Dim typ3(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ3))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 23, 1, 23, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 24, 1, 24, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 25, 1, 25, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 26, 1, 26, 100)
Dim typ4(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ4))
Typ = GetType(String).GetMethod("Concat", typ4).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stloc, 0)
CreateAndOpenTableIL.MarkSequencePoint(doc3, 27, 1, 27, 100)
Dim typ5(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ5))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 28, 1, 28, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc3, 29, 1, 29, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg_0)
CreateAndOpenTableIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
Dim typ6 As Type() = {Typ}
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt64", typ6))
Typ = GetType(System.Convert).GetMethod("ToInt64", typ6).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stfld, Count)
CreateAndOpenTableIL.MarkSequencePoint(doc3, 30, 1, 30, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg_0)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
CreateAndOpenTableIL.Emit(OpCodes.Stfld, TableName)
CreateAndOpenTableIL.MarkSequencePoint(doc3, 31, 1, 31, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ret)
Dim typ7(-1) As Type
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = GetType(System.String)
Dim OpenTable As MethodBuilder = NameReader.DefineMethod("OpenTable", MethodAttributes.Public, GetType(System.Void), typ7)
Dim OpenTableIL As ILGenerator = OpenTable.GetILGenerator()
Dim OpenTableparam00 As ParameterBuilder = OpenTable.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim OpenTableparam01 As ParameterBuilder = OpenTable.DefineParameter(1, ParameterAttributes.None, "constr")
Dim OpenTableparam02 As ParameterBuilder = OpenTable.DefineParameter(2, ParameterAttributes.None, "tblname")
OpenTableIL.MarkSequencePoint(doc3, 34, 1, 34, 100)
Dim typ8(-1) As Type
OpenTableIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ8))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ8).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc3, 35, 1, 35, 100)
Dim locbldr16 As LocalBuilder = OpenTableIL.DeclareLocal(GetType(System.String))
locbldr16.SetLocalSymInfo("str")
Dim typ9(-1) As Type
OpenTableIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ9))
Typ = GetType(String).GetMethod("Concat", typ9).ReturnType
OpenTableIL.Emit(OpCodes.Stloc, 0)
OpenTableIL.MarkSequencePoint(doc3, 36, 1, 36, 100)
Dim typ10(-1) As Type
OpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ10))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ10).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc3, 37, 1, 37, 100)
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc3, 38, 1, 38, 100)
OpenTableIL.Emit(OpCodes.Ldarg_0)
OpenTableIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
Dim typ11 As Type() = {Typ}
OpenTableIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt64", typ11))
Typ = GetType(System.Convert).GetMethod("ToInt64", typ11).ReturnType
OpenTableIL.Emit(OpCodes.Stfld, Count)
OpenTableIL.MarkSequencePoint(doc3, 39, 1, 39, 100)
OpenTableIL.Emit(OpCodes.Ldarg_0)
OpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
OpenTableIL.Emit(OpCodes.Stfld, TableName)
OpenTableIL.MarkSequencePoint(doc3, 40, 1, 40, 100)
OpenTableIL.Emit(OpCodes.Ret)
Dim AddRecord As MethodBuilder = NameReader.DefineMethod("AddRecord", MethodAttributes.Public, GetType(System.Void), Type.EmptyTypes)
Dim AddRecordIL As ILGenerator = AddRecord.GetILGenerator()
Dim AddRecordparam00 As ParameterBuilder = AddRecord.DefineParameter(0, ParameterAttributes.RetVal, "")
AddRecordIL.MarkSequencePoint(doc3, 43, 1, 43, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc3, 44, 1, 44, 100)
Dim locbldr17 As LocalBuilder = AddRecordIL.DeclareLocal(GetType(System.String))
locbldr17.SetLocalSymInfo("str")
Dim typ12(-1) As Type
AddRecordIL.Emit(OpCodes.Ldstr, "insert into ")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Ldstr, " values('','');")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ12))
Typ = GetType(String).GetMethod("Concat", typ12).ReturnType
AddRecordIL.Emit(OpCodes.Stloc, 0)
AddRecordIL.MarkSequencePoint(doc3, 45, 1, 45, 100)
Dim typ13(-1) As Type
AddRecordIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ13))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ13).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc3, 46, 1, 46, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc3, 47, 1, 47, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc3, 48, 1, 48, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc3, 49, 1, 49, 100)
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldfld, Count)
Typ = Count.FieldType
AddRecordIL.Emit(OpCodes.Ldc_I8, CLng(1))
Typ = GetType(System.Int64)
AddRecordIL.Emit(OpCodes.Add)
AddRecordIL.Emit(OpCodes.Stfld, Count)
AddRecordIL.MarkSequencePoint(doc3, 50, 1, 50, 100)
AddRecordIL.Emit(OpCodes.Ret)
Dim typ14(-1) As Type
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = GetType(System.Int64)
Dim LoadData As MethodBuilder = NameReader.DefineMethod("LoadData", MethodAttributes.Public, GetType(System.Void), typ14)
Dim LoadDataIL As ILGenerator = LoadData.GetILGenerator()
Dim LoadDataparam00 As ParameterBuilder = LoadData.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim LoadDataparam01 As ParameterBuilder = LoadData.DefineParameter(1, ParameterAttributes.None, "id")
LoadDataIL.MarkSequencePoint(doc3, 53, 1, 53, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int64)
LoadDataIL.Emit(OpCodes.Stfld, ID)
LoadDataIL.MarkSequencePoint(doc3, 54, 1, 54, 100)
Dim locbldr18 As LocalBuilder = LoadDataIL.DeclareLocal(GetType(System.String))
locbldr18.SetLocalSymInfo("str")
Dim typ15(-1) As Type
LoadDataIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldstr, " where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ16 As Type() = {Typ}
LoadDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ16))
Typ = GetType(System.Convert).GetMethod("ToString", typ16).ReturnType
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ15))
Typ = GetType(String).GetMethod("Concat", typ15).ReturnType
LoadDataIL.Emit(OpCodes.Stloc, 0)
LoadDataIL.MarkSequencePoint(doc3, 55, 1, 55, 100)
Dim typ17(-1) As Type
LoadDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
LoadDataIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
LoadDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ17))
Typ = GetType(String).GetMethod("Concat", typ17).ReturnType
LoadDataIL.Emit(OpCodes.Stloc, 0)
LoadDataIL.MarkSequencePoint(doc3, 56, 1, 56, 100)
Dim typ18(-1) As Type
LoadDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ18))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ18).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
LoadDataIL.Emit(OpCodes.Pop)
End If
LoadDataIL.MarkSequencePoint(doc3, 57, 1, 57, 100)
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
LoadDataIL.Emit(OpCodes.Pop)
End If
LoadDataIL.MarkSequencePoint(doc3, 58, 1, 58, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ19(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ19))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ19).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Name)
LoadDataIL.MarkSequencePoint(doc3, 59, 1, 59, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ20(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ20))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ20).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Surname)
LoadDataIL.MarkSequencePoint(doc3, 60, 1, 60, 100)
LoadDataIL.Emit(OpCodes.Ret)
Dim typ21(-1) As Type
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = GetType(System.Int64)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = GetType(System.String)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = GetType(System.String)
Dim WriteData As MethodBuilder = NameReader.DefineMethod("WriteData", MethodAttributes.Public, GetType(System.Void), typ21)
Dim WriteDataIL As ILGenerator = WriteData.GetILGenerator()
Dim WriteDataparam00 As ParameterBuilder = WriteData.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim WriteDataparam01 As ParameterBuilder = WriteData.DefineParameter(1, ParameterAttributes.None, "id")
Dim WriteDataparam02 As ParameterBuilder = WriteData.DefineParameter(2, ParameterAttributes.None, "nm")
Dim WriteDataparam03 As ParameterBuilder = WriteData.DefineParameter(3, ParameterAttributes.None, "snm")
WriteDataIL.MarkSequencePoint(doc3, 63, 1, 63, 100)
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int64)
WriteDataIL.Emit(OpCodes.Stfld, ID)
WriteDataIL.MarkSequencePoint(doc3, 64, 1, 64, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc3, 65, 1, 65, 100)
Dim locbldr19 As LocalBuilder = WriteDataIL.DeclareLocal(GetType(System.String))
locbldr19.SetLocalSymInfo("str")
Dim typ22(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Name = '")
Typ = GetType(System.String)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ22))
Typ = GetType(String).GetMethod("Concat", typ22).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc3, 66, 1, 66, 100)
Dim typ23(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ24 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ24))
Typ = GetType(System.Convert).GetMethod("ToString", typ24).ReturnType
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ23))
Typ = GetType(String).GetMethod("Concat", typ23).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc3, 67, 1, 67, 100)
Dim typ25(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ25))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ25).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc3, 68, 1, 68, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc3, 69, 1, 69, 100)
Dim typ26(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Surname = '")
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 3)
Typ = GetType(System.String)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ26))
Typ = GetType(String).GetMethod("Concat", typ26).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc3, 70, 1, 70, 100)
Dim typ27(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ28 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ28))
Typ = GetType(System.Convert).GetMethod("ToString", typ28).ReturnType
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ27))
Typ = GetType(String).GetMethod("Concat", typ27).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc3, 71, 1, 71, 100)
Dim typ29(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ29))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ29).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc3, 72, 1, 72, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc3, 73, 1, 73, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc3, 74, 1, 74, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc3, 75, 1, 75, 100)
WriteDataIL.Emit(OpCodes.Ret)
Dim typ30(-1) As Type
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = GetType(System.String)
Dim GetMember As MethodBuilder = NameReader.DefineMethod("GetMember", MethodAttributes.Public, GetType(System.String), typ30)
Dim GetMemberIL As ILGenerator = GetMember.GetILGenerator()
Dim GetMemberparam00 As ParameterBuilder = GetMember.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim GetMemberparam01 As ParameterBuilder = GetMember.DefineParameter(1, ParameterAttributes.None, "mem")
GetMemberIL.MarkSequencePoint(doc3, 78, 1, 78, 100)
Dim label0 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.MarkSequencePoint(doc3, 79, 1, 79, 100)
Dim locbldr20 As LocalBuilder = GetMemberIL.DeclareLocal(GetType(System.String))
locbldr20.SetLocalSymInfo("str")
GetMemberIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc3, 80, 1, 80, 100)
Dim locbldr21 As LocalBuilder = GetMemberIL.DeclareLocal(GetType(System.Int32))
locbldr21.SetLocalSymInfo("comp")
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc3, 82, 1, 82, 100)
Dim typ31(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "ID")
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ31))
Typ = GetType(String).GetMethod("Compare", typ31).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc3, 83, 1, 83, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa1 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru1 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont1 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru1)
GetMemberIL.Emit(OpCodes.Br, fa1)
GetMemberIL.MarkLabel(tru1)
GetMemberIL.MarkSequencePoint(doc3, 84, 1, 84, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ32 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ32))
Typ = GetType(System.Convert).GetMethod("ToString", typ32).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc3, 85, 1, 85, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc3, 86, 1, 86, 100)
GetMemberIL.Emit(OpCodes.Br, cont1)
GetMemberIL.MarkLabel(fa1)
GetMemberIL.Emit(OpCodes.Br, cont1)
GetMemberIL.MarkLabel(cont1)
GetMemberIL.MarkSequencePoint(doc3, 88, 1, 88, 100)
Dim typ33(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Name")
Typ = GetType(System.String)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ33))
Typ = GetType(String).GetMethod("Compare", typ33).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc3, 89, 1, 89, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa2 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru2 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont2 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru2)
GetMemberIL.Emit(OpCodes.Br, fa2)
GetMemberIL.MarkLabel(tru2)
GetMemberIL.MarkSequencePoint(doc3, 90, 1, 90, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Name)
Typ = Name.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc3, 91, 1, 91, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc3, 92, 1, 92, 100)
GetMemberIL.Emit(OpCodes.Br, cont2)
GetMemberIL.MarkLabel(fa2)
GetMemberIL.Emit(OpCodes.Br, cont2)
GetMemberIL.MarkLabel(cont2)
GetMemberIL.MarkSequencePoint(doc3, 94, 1, 94, 100)
Dim typ34(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Surname")
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ34))
Typ = GetType(String).GetMethod("Compare", typ34).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc3, 95, 1, 95, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa3 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru3 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont3 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru3)
GetMemberIL.Emit(OpCodes.Br, fa3)
GetMemberIL.MarkLabel(tru3)
GetMemberIL.MarkSequencePoint(doc3, 96, 1, 96, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Surname)
Typ = Surname.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc3, 97, 1, 97, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc3, 98, 1, 98, 100)
GetMemberIL.Emit(OpCodes.Br, cont3)
GetMemberIL.MarkLabel(fa3)
GetMemberIL.Emit(OpCodes.Br, cont3)
GetMemberIL.MarkLabel(cont3)
GetMemberIL.MarkSequencePoint(doc3, 100, 1, 100, 100)
Dim typ35(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "*")
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ35))
Typ = GetType(String).GetMethod("Compare", typ35).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc3, 101, 1, 101, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa4 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru4 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont4 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru4)
GetMemberIL.Emit(OpCodes.Br, fa4)
GetMemberIL.MarkLabel(tru4)
GetMemberIL.MarkSequencePoint(doc3, 102, 1, 102, 100)
Dim typ36(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "ID: ")
Typ = GetType(System.String)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ37 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ37))
Typ = GetType(System.Convert).GetMethod("ToString", typ37).ReturnType
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ36))
Typ = GetType(String).GetMethod("Concat", typ36).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc3, 103, 1, 103, 100)
Dim typ38(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Name: ")
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Name)
Typ = Name.FieldType
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ38))
Typ = GetType(String).GetMethod("Concat", typ38).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc3, 104, 1, 104, 100)
Dim typ39(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Surname: ")
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Surname)
Typ = Surname.FieldType
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ39))
Typ = GetType(String).GetMethod("Concat", typ39).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc3, 105, 1, 105, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc3, 106, 1, 106, 100)
GetMemberIL.Emit(OpCodes.Br, cont4)
GetMemberIL.MarkLabel(fa4)
GetMemberIL.MarkSequencePoint(doc3, 107, 1, 107, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc3, 108, 1, 108, 100)
GetMemberIL.Emit(OpCodes.Br, cont4)
GetMemberIL.MarkLabel(cont4)
GetMemberIL.MarkSequencePoint(doc3, 110, 1, 110, 100)
GetMemberIL.MarkLabel(label0)
GetMemberIL.MarkSequencePoint(doc3, 112, 1, 112, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
GetMemberIL.MarkSequencePoint(doc3, 114, 1, 114, 100)
GetMemberIL.Emit(OpCodes.Ret)
Dim GetRecordString As MethodBuilder = NameReader.DefineMethod("GetRecordString", MethodAttributes.Public, GetType(System.String), Type.EmptyTypes)
Dim GetRecordStringIL As ILGenerator = GetRecordString.GetILGenerator()
Dim GetRecordStringparam00 As ParameterBuilder = GetRecordString.DefineParameter(0, ParameterAttributes.RetVal, "")
GetRecordStringIL.MarkSequencePoint(doc3, 117, 1, 117, 100)
GetRecordStringIL.Emit(OpCodes.Ldarg_0)
Dim typ40(-1) As Type
GetRecordStringIL.Emit(OpCodes.Ldstr, "*")
Typ = GetType(System.String)
ReDim Preserve typ40(UBound(typ40) + 1)
typ40(UBound(typ40)) = Typ
GetRecordStringIL.Emit(OpCodes.Callvirt, GetMember)
Typ = GetMember.ReturnType
GetRecordStringIL.MarkSequencePoint(doc3, 118, 1, 118, 100)
GetRecordStringIL.Emit(OpCodes.Ret)
Dim typ41(-1) As Type
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = GetType(System.String)
Dim DoQuery As MethodBuilder = NameReader.DefineMethod("DoQuery", MethodAttributes.Public, GetType(System.Void), typ41)
Dim DoQueryIL As ILGenerator = DoQuery.GetILGenerator()
Dim DoQueryparam00 As ParameterBuilder = DoQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim DoQueryparam01 As ParameterBuilder = DoQuery.DefineParameter(1, ParameterAttributes.None, "sel")
Dim DoQueryparam02 As ParameterBuilder = DoQuery.DefineParameter(2, ParameterAttributes.None, "whr")
DoQueryIL.MarkSequencePoint(doc3, 122, 1, 122, 100)
Dim locbldr22 As LocalBuilder = DoQueryIL.DeclareLocal(GetType(System.String))
locbldr22.SetLocalSymInfo("str")
Dim typ42(-1) As Type
DoQueryIL.Emit(OpCodes.Ldstr, "select ")
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, " from ")
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg_0)
DoQueryIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
DoQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ42))
Typ = GetType(String).GetMethod("Concat", typ42).ReturnType
DoQueryIL.Emit(OpCodes.Stloc, 0)
DoQueryIL.MarkSequencePoint(doc3, 123, 1, 123, 100)
Dim typ43(-1) As Type
DoQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, " where ")
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
DoQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ43))
Typ = GetType(String).GetMethod("Concat", typ43).ReturnType
DoQueryIL.Emit(OpCodes.Stloc, 0)
DoQueryIL.MarkSequencePoint(doc3, 124, 1, 124, 100)
Dim typ44(-1) As Type
DoQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ44(UBound(typ44) + 1)
typ44(UBound(typ44)) = Typ
DoQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ44))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ44).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoQueryIL.Emit(OpCodes.Pop)
End If
DoQueryIL.MarkSequencePoint(doc3, 125, 1, 125, 100)
DoQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoQueryIL.Emit(OpCodes.Pop)
End If
DoQueryIL.MarkSequencePoint(doc3, 127, 1, 127, 100)
DoQueryIL.Emit(OpCodes.Ret)
Dim typ45(-1) As Type
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = GetType(System.String)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = GetType(System.String)
Dim DoListQuery As MethodBuilder = NameReader.DefineMethod("DoListQuery", MethodAttributes.Public, GetType(System.String), typ45)
Dim DoListQueryIL As ILGenerator = DoListQuery.GetILGenerator()
Dim DoListQueryparam00 As ParameterBuilder = DoListQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim DoListQueryparam01 As ParameterBuilder = DoListQuery.DefineParameter(1, ParameterAttributes.None, "sel")
Dim DoListQueryparam02 As ParameterBuilder = DoListQuery.DefineParameter(2, ParameterAttributes.None, "whr")
DoListQueryIL.MarkSequencePoint(doc3, 131, 1, 131, 100)
Dim locbldr23 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.String))
locbldr23.SetLocalSymInfo("str")
Dim typ46(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
DoListQueryIL.Emit(OpCodes.Ldarg_0)
DoListQueryIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
DoListQueryIL.Emit(OpCodes.Ldstr, " where ")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ46))
Typ = GetType(String).GetMethod("Concat", typ46).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc3, 132, 1, 132, 100)
Dim typ47(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
DoListQueryIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
DoListQueryIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ47))
Typ = GetType(String).GetMethod("Concat", typ47).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc3, 133, 1, 133, 100)
Dim typ48(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ48(UBound(typ48) + 1)
typ48(UBound(typ48)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ48))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ48).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoListQueryIL.Emit(OpCodes.Pop)
End If
DoListQueryIL.MarkSequencePoint(doc3, 134, 1, 134, 100)
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoListQueryIL.Emit(OpCodes.Pop)
End If
DoListQueryIL.MarkSequencePoint(doc3, 136, 1, 136, 100)
Dim locbldr24 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.Int32))
locbldr24.SetLocalSymInfo("i")
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Stloc, 1)
DoListQueryIL.MarkSequencePoint(doc3, 137, 1, 137, 100)
Dim locbldr25 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.Int32))
locbldr25.SetLocalSymInfo("len")
DoListQueryIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Sub)
DoListQueryIL.Emit(OpCodes.Stloc, 2)
DoListQueryIL.MarkSequencePoint(doc3, 138, 1, 138, 100)
Dim locbldr26 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.String))
locbldr26.SetLocalSymInfo("str2")
DoListQueryIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
DoListQueryIL.Emit(OpCodes.Stloc, 3)
DoListQueryIL.MarkSequencePoint(doc3, 140, 1, 140, 100)
Dim label1 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.MarkSequencePoint(doc3, 141, 1, 141, 100)
Dim label2 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.MarkSequencePoint(doc3, 143, 1, 143, 100)
DoListQueryIL.MarkLabel(label1)
DoListQueryIL.MarkSequencePoint(doc3, 145, 1, 145, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Add)
DoListQueryIL.Emit(OpCodes.Stloc, 1)
DoListQueryIL.MarkSequencePoint(doc3, 147, 1, 147, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ49(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ49))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ49).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, ID)
DoListQueryIL.MarkSequencePoint(doc3, 148, 1, 148, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ50(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ50))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ50).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Name)
DoListQueryIL.MarkSequencePoint(doc3, 149, 1, 149, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ51(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ51))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ51).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Surname)
DoListQueryIL.MarkSequencePoint(doc3, 151, 1, 151, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ52(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
DoListQueryIL.Emit(OpCodes.Callvirt, GetMember)
Typ = GetMember.ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc3, 152, 1, 152, 100)
Dim typ53(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
DoListQueryIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ53))
Typ = GetType(String).GetMethod("Concat", typ53).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 3)
DoListQueryIL.MarkSequencePoint(doc3, 154, 1, 154, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa5 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
Dim tru5 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
Dim cont5 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.Emit(OpCodes.Beq, tru5)
DoListQueryIL.Emit(OpCodes.Br, fa5)
DoListQueryIL.MarkLabel(tru5)
DoListQueryIL.MarkSequencePoint(doc3, 155, 1, 155, 100)
DoListQueryIL.Emit(OpCodes.Br, label2)
DoListQueryIL.MarkSequencePoint(doc3, 156, 1, 156, 100)
DoListQueryIL.Emit(OpCodes.Br, cont5)
DoListQueryIL.MarkLabel(fa5)
DoListQueryIL.MarkSequencePoint(doc3, 157, 1, 157, 100)
DoListQueryIL.Emit(OpCodes.Br, label1)
DoListQueryIL.MarkSequencePoint(doc3, 158, 1, 158, 100)
DoListQueryIL.Emit(OpCodes.Br, cont5)
DoListQueryIL.MarkLabel(cont5)
DoListQueryIL.MarkSequencePoint(doc3, 160, 1, 160, 100)
DoListQueryIL.MarkLabel(label2)
DoListQueryIL.MarkSequencePoint(doc3, 162, 1, 162, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.String)
DoListQueryIL.MarkSequencePoint(doc3, 164, 1, 164, 100)
DoListQueryIL.Emit(OpCodes.Ret)
NameReader.CreateType()
End Sub


Dim doc4 As ISymbolDocumentWriter

Sub ContactReader()
Dim ContactReader As TypeBuilder = mdl.DefineType("dylan.NET.SQLiteData" & "." & "ContactReader", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass, GetType(System.Object))
Dim Title As FieldBuilder = ContactReader.DefineField("Title", GetType(System.String), FieldAttributes.Public)
Dim Name As FieldBuilder = ContactReader.DefineField("Name", GetType(System.String), FieldAttributes.Public)
Dim Surname As FieldBuilder = ContactReader.DefineField("Surname", GetType(System.String), FieldAttributes.Public)
Dim Email1 As FieldBuilder = ContactReader.DefineField("Email1", GetType(System.String), FieldAttributes.Public)
Dim Email2 As FieldBuilder = ContactReader.DefineField("Email2", GetType(System.String), FieldAttributes.Public)
Dim Email3 As FieldBuilder = ContactReader.DefineField("Email3", GetType(System.String), FieldAttributes.Public)
Dim Tel1 As FieldBuilder = ContactReader.DefineField("Tel1", GetType(System.String), FieldAttributes.Public)
Dim Tel2 As FieldBuilder = ContactReader.DefineField("Tel2", GetType(System.String), FieldAttributes.Public)
Dim Address As FieldBuilder = ContactReader.DefineField("Address", GetType(System.String), FieldAttributes.Public)
Dim Notes As FieldBuilder = ContactReader.DefineField("Notes", GetType(System.String), FieldAttributes.Public)
Dim ID As FieldBuilder = ContactReader.DefineField("ID", GetType(System.Int64), FieldAttributes.Public)
Dim Count As FieldBuilder = ContactReader.DefineField("Count", GetType(System.Int64), FieldAttributes.Public)
Dim TableName As FieldBuilder = ContactReader.DefineField("TableName", GetType(System.String), FieldAttributes.Public)
Dim ctor0 As ConstructorBuilder = ContactReader.DefineConstructor(MethodAttributes.Public,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
Dim ctor0param00 As ParameterBuilder = ctor0.DefineParameter(0, ParameterAttributes.RetVal, "")
ctor0IL.MarkSequencePoint(doc4, 18, 1, 18, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Call, GetType(System.Object).GetConstructor(Type.EmptyTypes))
ctor0IL.MarkSequencePoint(doc4, 19, 1, 19, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Title)
ctor0IL.MarkSequencePoint(doc4, 20, 1, 20, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Name)
ctor0IL.MarkSequencePoint(doc4, 21, 1, 21, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Surname)
ctor0IL.MarkSequencePoint(doc4, 22, 1, 22, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Email1)
ctor0IL.MarkSequencePoint(doc4, 23, 1, 23, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Email2)
ctor0IL.MarkSequencePoint(doc4, 24, 1, 24, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Email3)
ctor0IL.MarkSequencePoint(doc4, 25, 1, 25, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Tel1)
ctor0IL.MarkSequencePoint(doc4, 26, 1, 26, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Tel2)
ctor0IL.MarkSequencePoint(doc4, 27, 1, 27, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Address)
ctor0IL.MarkSequencePoint(doc4, 28, 1, 28, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Notes)
ctor0IL.MarkSequencePoint(doc4, 29, 1, 29, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, TableName)
ctor0IL.MarkSequencePoint(doc4, 30, 1, 30, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, ID)
ctor0IL.MarkSequencePoint(doc4, 31, 1, 31, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, Count)
ctor0IL.MarkSequencePoint(doc4, 32, 1, 32, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
Dim CreateAndOpenTable As MethodBuilder = ContactReader.DefineMethod("CreateAndOpenTable", MethodAttributes.Public, GetType(System.Void), typ0)
Dim CreateAndOpenTableIL As ILGenerator = CreateAndOpenTable.GetILGenerator()
Dim CreateAndOpenTableparam00 As ParameterBuilder = CreateAndOpenTable.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim CreateAndOpenTableparam01 As ParameterBuilder = CreateAndOpenTable.DefineParameter(1, ParameterAttributes.None, "constr")
Dim CreateAndOpenTableparam02 As ParameterBuilder = CreateAndOpenTable.DefineParameter(2, ParameterAttributes.None, "tblname")
CreateAndOpenTableIL.MarkSequencePoint(doc4, 35, 1, 35, 100)
Dim typ1(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ1))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 36, 1, 36, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 37, 1, 37, 100)
Dim locbldr27 As LocalBuilder = CreateAndOpenTableIL.DeclareLocal(GetType(System.String))
locbldr27.SetLocalSymInfo("str")
Dim typ2(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "create table ")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "(Title text,Name text, Surname text, Email1 text, Email2 text, Email3 text, Tel1 text, Tel2 text, Address text, Notes text);")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ2))
Typ = GetType(String).GetMethod("Concat", typ2).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stloc, 0)
CreateAndOpenTableIL.MarkSequencePoint(doc4, 38, 1, 38, 100)
Dim typ3(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ3))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 39, 1, 39, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 40, 1, 40, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 41, 1, 41, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 42, 1, 42, 100)
Dim typ4(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ4))
Typ = GetType(String).GetMethod("Concat", typ4).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stloc, 0)
CreateAndOpenTableIL.MarkSequencePoint(doc4, 43, 1, 43, 100)
Dim typ5(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ5))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 44, 1, 44, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc4, 45, 1, 45, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg_0)
CreateAndOpenTableIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
Dim typ6 As Type() = {Typ}
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt64", typ6))
Typ = GetType(System.Convert).GetMethod("ToInt64", typ6).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stfld, Count)
CreateAndOpenTableIL.MarkSequencePoint(doc4, 46, 1, 46, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg_0)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
CreateAndOpenTableIL.Emit(OpCodes.Stfld, TableName)
CreateAndOpenTableIL.MarkSequencePoint(doc4, 47, 1, 47, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ret)
Dim typ7(-1) As Type
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = GetType(System.String)
Dim OpenTable As MethodBuilder = ContactReader.DefineMethod("OpenTable", MethodAttributes.Public, GetType(System.Void), typ7)
Dim OpenTableIL As ILGenerator = OpenTable.GetILGenerator()
Dim OpenTableparam00 As ParameterBuilder = OpenTable.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim OpenTableparam01 As ParameterBuilder = OpenTable.DefineParameter(1, ParameterAttributes.None, "constr")
Dim OpenTableparam02 As ParameterBuilder = OpenTable.DefineParameter(2, ParameterAttributes.None, "tblname")
OpenTableIL.MarkSequencePoint(doc4, 50, 1, 50, 100)
Dim typ8(-1) As Type
OpenTableIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ8))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ8).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc4, 51, 1, 51, 100)
Dim locbldr28 As LocalBuilder = OpenTableIL.DeclareLocal(GetType(System.String))
locbldr28.SetLocalSymInfo("str")
Dim typ9(-1) As Type
OpenTableIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ9))
Typ = GetType(String).GetMethod("Concat", typ9).ReturnType
OpenTableIL.Emit(OpCodes.Stloc, 0)
OpenTableIL.MarkSequencePoint(doc4, 52, 1, 52, 100)
Dim typ10(-1) As Type
OpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ10))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ10).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc4, 53, 1, 53, 100)
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc4, 54, 1, 54, 100)
OpenTableIL.Emit(OpCodes.Ldarg_0)
OpenTableIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
Dim typ11 As Type() = {Typ}
OpenTableIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt64", typ11))
Typ = GetType(System.Convert).GetMethod("ToInt64", typ11).ReturnType
OpenTableIL.Emit(OpCodes.Stfld, Count)
OpenTableIL.MarkSequencePoint(doc4, 55, 1, 55, 100)
OpenTableIL.Emit(OpCodes.Ldarg_0)
OpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
OpenTableIL.Emit(OpCodes.Stfld, TableName)
OpenTableIL.MarkSequencePoint(doc4, 56, 1, 56, 100)
OpenTableIL.Emit(OpCodes.Ret)
Dim AddRecord As MethodBuilder = ContactReader.DefineMethod("AddRecord", MethodAttributes.Public, GetType(System.Void), Type.EmptyTypes)
Dim AddRecordIL As ILGenerator = AddRecord.GetILGenerator()
Dim AddRecordparam00 As ParameterBuilder = AddRecord.DefineParameter(0, ParameterAttributes.RetVal, "")
AddRecordIL.MarkSequencePoint(doc4, 59, 1, 59, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc4, 60, 1, 60, 100)
Dim locbldr29 As LocalBuilder = AddRecordIL.DeclareLocal(GetType(System.String))
locbldr29.SetLocalSymInfo("str")
Dim typ12(-1) As Type
AddRecordIL.Emit(OpCodes.Ldstr, "insert into ")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Ldstr, " values('','','','','','','','','','');")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ12))
Typ = GetType(String).GetMethod("Concat", typ12).ReturnType
AddRecordIL.Emit(OpCodes.Stloc, 0)
AddRecordIL.MarkSequencePoint(doc4, 61, 1, 61, 100)
Dim typ13(-1) As Type
AddRecordIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ13))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ13).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc4, 62, 1, 62, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc4, 63, 1, 63, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc4, 64, 1, 64, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc4, 65, 1, 65, 100)
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldfld, Count)
Typ = Count.FieldType
AddRecordIL.Emit(OpCodes.Ldc_I8, CLng(1))
Typ = GetType(System.Int64)
AddRecordIL.Emit(OpCodes.Add)
AddRecordIL.Emit(OpCodes.Stfld, Count)
AddRecordIL.MarkSequencePoint(doc4, 66, 1, 66, 100)
AddRecordIL.Emit(OpCodes.Ret)
Dim typ14(-1) As Type
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = GetType(System.Int64)
Dim LoadData As MethodBuilder = ContactReader.DefineMethod("LoadData", MethodAttributes.Public, GetType(System.Void), typ14)
Dim LoadDataIL As ILGenerator = LoadData.GetILGenerator()
Dim LoadDataparam00 As ParameterBuilder = LoadData.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim LoadDataparam01 As ParameterBuilder = LoadData.DefineParameter(1, ParameterAttributes.None, "id")
LoadDataIL.MarkSequencePoint(doc4, 69, 1, 69, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int64)
LoadDataIL.Emit(OpCodes.Stfld, ID)
LoadDataIL.MarkSequencePoint(doc4, 70, 1, 70, 100)
Dim locbldr30 As LocalBuilder = LoadDataIL.DeclareLocal(GetType(System.String))
locbldr30.SetLocalSymInfo("str")
Dim typ15(-1) As Type
LoadDataIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldstr, " where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ16 As Type() = {Typ}
LoadDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ16))
Typ = GetType(System.Convert).GetMethod("ToString", typ16).ReturnType
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ15))
Typ = GetType(String).GetMethod("Concat", typ15).ReturnType
LoadDataIL.Emit(OpCodes.Stloc, 0)
LoadDataIL.MarkSequencePoint(doc4, 71, 1, 71, 100)
Dim typ17(-1) As Type
LoadDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
LoadDataIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
LoadDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ17))
Typ = GetType(String).GetMethod("Concat", typ17).ReturnType
LoadDataIL.Emit(OpCodes.Stloc, 0)
LoadDataIL.MarkSequencePoint(doc4, 72, 1, 72, 100)
Dim typ18(-1) As Type
LoadDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ18))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ18).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
LoadDataIL.Emit(OpCodes.Pop)
End If
LoadDataIL.MarkSequencePoint(doc4, 73, 1, 73, 100)
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
LoadDataIL.Emit(OpCodes.Pop)
End If
LoadDataIL.MarkSequencePoint(doc4, 74, 1, 74, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ19(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ19))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ19).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Title)
LoadDataIL.MarkSequencePoint(doc4, 75, 1, 75, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ20(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ20))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ20).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Name)
LoadDataIL.MarkSequencePoint(doc4, 76, 1, 76, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ21(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ21))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ21).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Surname)
LoadDataIL.MarkSequencePoint(doc4, 77, 1, 77, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ22(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ22))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ22).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Email1)
LoadDataIL.MarkSequencePoint(doc4, 78, 1, 78, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ23(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ23))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ23).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Email2)
LoadDataIL.MarkSequencePoint(doc4, 79, 1, 79, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ24(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ24))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ24).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Email3)
LoadDataIL.MarkSequencePoint(doc4, 80, 1, 80, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ25(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ25))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ25).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Tel1)
LoadDataIL.MarkSequencePoint(doc4, 81, 1, 81, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ26(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
ReDim Preserve typ26(UBound(typ26) + 1)
typ26(UBound(typ26)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ26))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ26).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Tel2)
LoadDataIL.MarkSequencePoint(doc4, 82, 1, 82, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ27(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(9))
Typ = GetType(System.Int32)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ27))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ27).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Address)
LoadDataIL.MarkSequencePoint(doc4, 83, 1, 83, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ28(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(10))
Typ = GetType(System.Int32)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ28))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ28).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Notes)
LoadDataIL.MarkSequencePoint(doc4, 84, 1, 84, 100)
LoadDataIL.Emit(OpCodes.Ret)
Dim typ29(-1) As Type
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.Int64)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = GetType(System.String)
Dim WriteData As MethodBuilder = ContactReader.DefineMethod("WriteData", MethodAttributes.Public, GetType(System.Void), typ29)
Dim WriteDataIL As ILGenerator = WriteData.GetILGenerator()
Dim WriteDataparam00 As ParameterBuilder = WriteData.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim WriteDataparam01 As ParameterBuilder = WriteData.DefineParameter(1, ParameterAttributes.None, "id")
Dim WriteDataparam02 As ParameterBuilder = WriteData.DefineParameter(2, ParameterAttributes.None, "tit")
Dim WriteDataparam03 As ParameterBuilder = WriteData.DefineParameter(3, ParameterAttributes.None, "nm")
Dim WriteDataparam04 As ParameterBuilder = WriteData.DefineParameter(4, ParameterAttributes.None, "snm")
Dim WriteDataparam05 As ParameterBuilder = WriteData.DefineParameter(5, ParameterAttributes.None, "em1")
Dim WriteDataparam06 As ParameterBuilder = WriteData.DefineParameter(6, ParameterAttributes.None, "em2")
Dim WriteDataparam07 As ParameterBuilder = WriteData.DefineParameter(7, ParameterAttributes.None, "em3")
Dim WriteDataparam08 As ParameterBuilder = WriteData.DefineParameter(8, ParameterAttributes.None, "tel1")
Dim WriteDataparam09 As ParameterBuilder = WriteData.DefineParameter(9, ParameterAttributes.None, "tel2")
Dim WriteDataparam010 As ParameterBuilder = WriteData.DefineParameter(10, ParameterAttributes.None, "addr")
Dim WriteDataparam011 As ParameterBuilder = WriteData.DefineParameter(11, ParameterAttributes.None, "nts")
WriteDataIL.MarkSequencePoint(doc4, 87, 1, 87, 100)
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int64)
WriteDataIL.Emit(OpCodes.Stfld, ID)
WriteDataIL.MarkSequencePoint(doc4, 88, 1, 88, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 89, 1, 89, 100)
Dim locbldr31 As LocalBuilder = WriteDataIL.DeclareLocal(GetType(System.String))
locbldr31.SetLocalSymInfo("str")
Dim typ30(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Title = '")
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ30(UBound(typ30) + 1)
typ30(UBound(typ30)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ30))
Typ = GetType(String).GetMethod("Concat", typ30).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 90, 1, 90, 100)
Dim typ31(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ32 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ32))
Typ = GetType(System.Convert).GetMethod("ToString", typ32).ReturnType
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ31))
Typ = GetType(String).GetMethod("Concat", typ31).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 91, 1, 91, 100)
Dim typ33(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ33(UBound(typ33) + 1)
typ33(UBound(typ33)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ33))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ33).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 92, 1, 92, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 93, 1, 93, 100)
Dim typ34(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Name = '")
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 3)
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ34))
Typ = GetType(String).GetMethod("Concat", typ34).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 94, 1, 94, 100)
Dim typ35(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ36 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ36))
Typ = GetType(System.Convert).GetMethod("ToString", typ36).ReturnType
ReDim Preserve typ35(UBound(typ35) + 1)
typ35(UBound(typ35)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ35))
Typ = GetType(String).GetMethod("Concat", typ35).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 95, 1, 95, 100)
Dim typ37(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ37))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ37).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 96, 1, 96, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 97, 1, 97, 100)
Dim typ38(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Surname = '")
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 4)
Typ = GetType(System.String)
ReDim Preserve typ38(UBound(typ38) + 1)
typ38(UBound(typ38)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ38))
Typ = GetType(String).GetMethod("Concat", typ38).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 98, 1, 98, 100)
Dim typ39(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ40 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ40))
Typ = GetType(System.Convert).GetMethod("ToString", typ40).ReturnType
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ39))
Typ = GetType(String).GetMethod("Concat", typ39).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 99, 1, 99, 100)
Dim typ41(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ41))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ41).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 100, 1, 100, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 101, 1, 101, 100)
Dim typ42(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Email1 = '")
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 5)
Typ = GetType(System.String)
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ42))
Typ = GetType(String).GetMethod("Concat", typ42).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 102, 1, 102, 100)
Dim typ43(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ44 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ44))
Typ = GetType(System.Convert).GetMethod("ToString", typ44).ReturnType
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ43))
Typ = GetType(String).GetMethod("Concat", typ43).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 103, 1, 103, 100)
Dim typ45(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ45))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ45).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 104, 1, 104, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 105, 1, 105, 100)
Dim typ46(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Email2 = '")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 6)
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ46))
Typ = GetType(String).GetMethod("Concat", typ46).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 106, 1, 106, 100)
Dim typ47(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ48 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ48))
Typ = GetType(System.Convert).GetMethod("ToString", typ48).ReturnType
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ47))
Typ = GetType(String).GetMethod("Concat", typ47).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 107, 1, 107, 100)
Dim typ49(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ49))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ49).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 108, 1, 108, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 109, 1, 109, 100)
Dim typ50(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Email3 = '")
Typ = GetType(System.String)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 7)
Typ = GetType(System.String)
ReDim Preserve typ50(UBound(typ50) + 1)
typ50(UBound(typ50)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ50))
Typ = GetType(String).GetMethod("Concat", typ50).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 110, 1, 110, 100)
Dim typ51(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ52 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ52))
Typ = GetType(System.Convert).GetMethod("ToString", typ52).ReturnType
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ51))
Typ = GetType(String).GetMethod("Concat", typ51).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 111, 1, 111, 100)
Dim typ53(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ53(UBound(typ53) + 1)
typ53(UBound(typ53)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ53))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ53).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 112, 1, 112, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 113, 1, 113, 100)
Dim typ54(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Tel1 = '")
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 8)
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ54))
Typ = GetType(String).GetMethod("Concat", typ54).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 114, 1, 114, 100)
Dim typ55(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ56 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ56))
Typ = GetType(System.Convert).GetMethod("ToString", typ56).ReturnType
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ55))
Typ = GetType(String).GetMethod("Concat", typ55).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 115, 1, 115, 100)
Dim typ57(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ57(UBound(typ57) + 1)
typ57(UBound(typ57)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ57))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ57).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 116, 1, 116, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 117, 1, 117, 100)
Dim typ58(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Tel2 = '")
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 9)
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ58))
Typ = GetType(String).GetMethod("Concat", typ58).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 118, 1, 118, 100)
Dim typ59(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ60 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ60))
Typ = GetType(System.Convert).GetMethod("ToString", typ60).ReturnType
ReDim Preserve typ59(UBound(typ59) + 1)
typ59(UBound(typ59)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ59))
Typ = GetType(String).GetMethod("Concat", typ59).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 119, 1, 119, 100)
Dim typ61(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ61))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ61).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 120, 1, 120, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 121, 1, 121, 100)
Dim typ62(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Address = '")
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 10)
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ62))
Typ = GetType(String).GetMethod("Concat", typ62).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 122, 1, 122, 100)
Dim typ63(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ64 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ64))
Typ = GetType(System.Convert).GetMethod("ToString", typ64).ReturnType
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ63))
Typ = GetType(String).GetMethod("Concat", typ63).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 123, 1, 123, 100)
Dim typ65(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ65(UBound(typ65) + 1)
typ65(UBound(typ65)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ65))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ65).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 124, 1, 124, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 125, 1, 125, 100)
Dim typ66(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Notes = '")
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 11)
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ66))
Typ = GetType(String).GetMethod("Concat", typ66).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 126, 1, 126, 100)
Dim typ67(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ68 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ68))
Typ = GetType(System.Convert).GetMethod("ToString", typ68).ReturnType
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ67))
Typ = GetType(String).GetMethod("Concat", typ67).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc4, 127, 1, 127, 100)
Dim typ69(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ69(UBound(typ69) + 1)
typ69(UBound(typ69)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ69))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ69).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 128, 1, 128, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 129, 1, 129, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 130, 1, 130, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc4, 131, 1, 131, 100)
WriteDataIL.Emit(OpCodes.Ret)
Dim typ70(-1) As Type
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = GetType(System.String)
Dim GetMember As MethodBuilder = ContactReader.DefineMethod("GetMember", MethodAttributes.Public, GetType(System.String), typ70)
Dim GetMemberIL As ILGenerator = GetMember.GetILGenerator()
Dim GetMemberparam00 As ParameterBuilder = GetMember.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim GetMemberparam01 As ParameterBuilder = GetMember.DefineParameter(1, ParameterAttributes.None, "mem")
GetMemberIL.MarkSequencePoint(doc4, 134, 1, 134, 100)
Dim label0 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.MarkSequencePoint(doc4, 135, 1, 135, 100)
Dim locbldr32 As LocalBuilder = GetMemberIL.DeclareLocal(GetType(System.String))
locbldr32.SetLocalSymInfo("str")
GetMemberIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 136, 1, 136, 100)
Dim locbldr33 As LocalBuilder = GetMemberIL.DeclareLocal(GetType(System.Int32))
locbldr33.SetLocalSymInfo("comp")
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 138, 1, 138, 100)
Dim typ71(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "ID")
Typ = GetType(System.String)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ71))
Typ = GetType(String).GetMethod("Compare", typ71).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 139, 1, 139, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa6 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru6 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont6 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru6)
GetMemberIL.Emit(OpCodes.Br, fa6)
GetMemberIL.MarkLabel(tru6)
GetMemberIL.MarkSequencePoint(doc4, 140, 1, 140, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ72 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ72))
Typ = GetType(System.Convert).GetMethod("ToString", typ72).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 141, 1, 141, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 142, 1, 142, 100)
GetMemberIL.Emit(OpCodes.Br, cont6)
GetMemberIL.MarkLabel(fa6)
GetMemberIL.Emit(OpCodes.Br, cont6)
GetMemberIL.MarkLabel(cont6)
GetMemberIL.MarkSequencePoint(doc4, 144, 1, 144, 100)
Dim typ73(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Title")
Typ = GetType(System.String)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ73))
Typ = GetType(String).GetMethod("Compare", typ73).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 145, 1, 145, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa7 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru7 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont7 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru7)
GetMemberIL.Emit(OpCodes.Br, fa7)
GetMemberIL.MarkLabel(tru7)
GetMemberIL.MarkSequencePoint(doc4, 146, 1, 146, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Title)
Typ = Title.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 147, 1, 147, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 148, 1, 148, 100)
GetMemberIL.Emit(OpCodes.Br, cont7)
GetMemberIL.MarkLabel(fa7)
GetMemberIL.Emit(OpCodes.Br, cont7)
GetMemberIL.MarkLabel(cont7)
GetMemberIL.MarkSequencePoint(doc4, 150, 1, 150, 100)
Dim typ74(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Name")
Typ = GetType(System.String)
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ74))
Typ = GetType(String).GetMethod("Compare", typ74).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 151, 1, 151, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa8 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru8 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont8 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru8)
GetMemberIL.Emit(OpCodes.Br, fa8)
GetMemberIL.MarkLabel(tru8)
GetMemberIL.MarkSequencePoint(doc4, 152, 1, 152, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Name)
Typ = Name.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 153, 1, 153, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 154, 1, 154, 100)
GetMemberIL.Emit(OpCodes.Br, cont8)
GetMemberIL.MarkLabel(fa8)
GetMemberIL.Emit(OpCodes.Br, cont8)
GetMemberIL.MarkLabel(cont8)
GetMemberIL.MarkSequencePoint(doc4, 156, 1, 156, 100)
Dim typ75(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Surname")
Typ = GetType(System.String)
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ75))
Typ = GetType(String).GetMethod("Compare", typ75).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 157, 1, 157, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa9 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru9 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont9 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru9)
GetMemberIL.Emit(OpCodes.Br, fa9)
GetMemberIL.MarkLabel(tru9)
GetMemberIL.MarkSequencePoint(doc4, 158, 1, 158, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Surname)
Typ = Surname.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 159, 1, 159, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 160, 1, 160, 100)
GetMemberIL.Emit(OpCodes.Br, cont9)
GetMemberIL.MarkLabel(fa9)
GetMemberIL.Emit(OpCodes.Br, cont9)
GetMemberIL.MarkLabel(cont9)
GetMemberIL.MarkSequencePoint(doc4, 162, 1, 162, 100)
Dim typ76(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Email1")
Typ = GetType(System.String)
ReDim Preserve typ76(UBound(typ76) + 1)
typ76(UBound(typ76)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ76(UBound(typ76) + 1)
typ76(UBound(typ76)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ76))
Typ = GetType(String).GetMethod("Compare", typ76).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 163, 1, 163, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa10 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru10 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont10 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru10)
GetMemberIL.Emit(OpCodes.Br, fa10)
GetMemberIL.MarkLabel(tru10)
GetMemberIL.MarkSequencePoint(doc4, 164, 1, 164, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Email1)
Typ = Email1.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 165, 1, 165, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 166, 1, 166, 100)
GetMemberIL.Emit(OpCodes.Br, cont10)
GetMemberIL.MarkLabel(fa10)
GetMemberIL.Emit(OpCodes.Br, cont10)
GetMemberIL.MarkLabel(cont10)
GetMemberIL.MarkSequencePoint(doc4, 168, 1, 168, 100)
Dim typ77(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Email2")
Typ = GetType(System.String)
ReDim Preserve typ77(UBound(typ77) + 1)
typ77(UBound(typ77)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ77(UBound(typ77) + 1)
typ77(UBound(typ77)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ77))
Typ = GetType(String).GetMethod("Compare", typ77).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 169, 1, 169, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa11 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru11 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont11 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru11)
GetMemberIL.Emit(OpCodes.Br, fa11)
GetMemberIL.MarkLabel(tru11)
GetMemberIL.MarkSequencePoint(doc4, 170, 1, 170, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Email2)
Typ = Email2.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 171, 1, 171, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 172, 1, 172, 100)
GetMemberIL.Emit(OpCodes.Br, cont11)
GetMemberIL.MarkLabel(fa11)
GetMemberIL.Emit(OpCodes.Br, cont11)
GetMemberIL.MarkLabel(cont11)
GetMemberIL.MarkSequencePoint(doc4, 174, 1, 174, 100)
Dim typ78(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Email3")
Typ = GetType(System.String)
ReDim Preserve typ78(UBound(typ78) + 1)
typ78(UBound(typ78)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ78(UBound(typ78) + 1)
typ78(UBound(typ78)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ78))
Typ = GetType(String).GetMethod("Compare", typ78).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 175, 1, 175, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa12 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru12 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont12 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru12)
GetMemberIL.Emit(OpCodes.Br, fa12)
GetMemberIL.MarkLabel(tru12)
GetMemberIL.MarkSequencePoint(doc4, 176, 1, 176, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Email3)
Typ = Email3.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 177, 1, 177, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 178, 1, 178, 100)
GetMemberIL.Emit(OpCodes.Br, cont12)
GetMemberIL.MarkLabel(fa12)
GetMemberIL.Emit(OpCodes.Br, cont12)
GetMemberIL.MarkLabel(cont12)
GetMemberIL.MarkSequencePoint(doc4, 180, 1, 180, 100)
Dim typ79(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Tel1")
Typ = GetType(System.String)
ReDim Preserve typ79(UBound(typ79) + 1)
typ79(UBound(typ79)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ79(UBound(typ79) + 1)
typ79(UBound(typ79)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ79))
Typ = GetType(String).GetMethod("Compare", typ79).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 181, 1, 181, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa13 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru13 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont13 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru13)
GetMemberIL.Emit(OpCodes.Br, fa13)
GetMemberIL.MarkLabel(tru13)
GetMemberIL.MarkSequencePoint(doc4, 182, 1, 182, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Tel1)
Typ = Tel1.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 183, 1, 183, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 184, 1, 184, 100)
GetMemberIL.Emit(OpCodes.Br, cont13)
GetMemberIL.MarkLabel(fa13)
GetMemberIL.Emit(OpCodes.Br, cont13)
GetMemberIL.MarkLabel(cont13)
GetMemberIL.MarkSequencePoint(doc4, 186, 1, 186, 100)
Dim typ80(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Tel2")
Typ = GetType(System.String)
ReDim Preserve typ80(UBound(typ80) + 1)
typ80(UBound(typ80)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ80(UBound(typ80) + 1)
typ80(UBound(typ80)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ80))
Typ = GetType(String).GetMethod("Compare", typ80).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 187, 1, 187, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa14 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru14 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont14 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru14)
GetMemberIL.Emit(OpCodes.Br, fa14)
GetMemberIL.MarkLabel(tru14)
GetMemberIL.MarkSequencePoint(doc4, 188, 1, 188, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Tel2)
Typ = Tel2.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 189, 1, 189, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 190, 1, 190, 100)
GetMemberIL.Emit(OpCodes.Br, cont14)
GetMemberIL.MarkLabel(fa14)
GetMemberIL.Emit(OpCodes.Br, cont14)
GetMemberIL.MarkLabel(cont14)
GetMemberIL.MarkSequencePoint(doc4, 192, 1, 192, 100)
Dim typ81(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Address")
Typ = GetType(System.String)
ReDim Preserve typ81(UBound(typ81) + 1)
typ81(UBound(typ81)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ81(UBound(typ81) + 1)
typ81(UBound(typ81)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ81))
Typ = GetType(String).GetMethod("Compare", typ81).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 193, 1, 193, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa15 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru15 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont15 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru15)
GetMemberIL.Emit(OpCodes.Br, fa15)
GetMemberIL.MarkLabel(tru15)
GetMemberIL.MarkSequencePoint(doc4, 194, 1, 194, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Address)
Typ = Address.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 195, 1, 195, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 196, 1, 196, 100)
GetMemberIL.Emit(OpCodes.Br, cont15)
GetMemberIL.MarkLabel(fa15)
GetMemberIL.Emit(OpCodes.Br, cont15)
GetMemberIL.MarkLabel(cont15)
GetMemberIL.MarkSequencePoint(doc4, 198, 1, 198, 100)
Dim typ82(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Notes")
Typ = GetType(System.String)
ReDim Preserve typ82(UBound(typ82) + 1)
typ82(UBound(typ82)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ82(UBound(typ82) + 1)
typ82(UBound(typ82)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ82))
Typ = GetType(String).GetMethod("Compare", typ82).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 199, 1, 199, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa16 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru16 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont16 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru16)
GetMemberIL.Emit(OpCodes.Br, fa16)
GetMemberIL.MarkLabel(tru16)
GetMemberIL.MarkSequencePoint(doc4, 200, 1, 200, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Notes)
Typ = Notes.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 201, 1, 201, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 202, 1, 202, 100)
GetMemberIL.Emit(OpCodes.Br, cont16)
GetMemberIL.MarkLabel(fa16)
GetMemberIL.Emit(OpCodes.Br, cont16)
GetMemberIL.MarkLabel(cont16)
GetMemberIL.MarkSequencePoint(doc4, 204, 1, 204, 100)
Dim typ83(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "*")
Typ = GetType(System.String)
ReDim Preserve typ83(UBound(typ83) + 1)
typ83(UBound(typ83)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ83(UBound(typ83) + 1)
typ83(UBound(typ83)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ83))
Typ = GetType(String).GetMethod("Compare", typ83).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc4, 205, 1, 205, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa17 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru17 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont17 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru17)
GetMemberIL.Emit(OpCodes.Br, fa17)
GetMemberIL.MarkLabel(tru17)
GetMemberIL.MarkSequencePoint(doc4, 206, 1, 206, 100)
Dim typ84(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "ID: ")
Typ = GetType(System.String)
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ85 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ85))
Typ = GetType(System.Convert).GetMethod("ToString", typ85).ReturnType
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ84(UBound(typ84) + 1)
typ84(UBound(typ84)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ84))
Typ = GetType(String).GetMethod("Concat", typ84).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 207, 1, 207, 100)
Dim typ86(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Title: ")
Typ = GetType(System.String)
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Title)
Typ = Title.FieldType
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ86(UBound(typ86) + 1)
typ86(UBound(typ86)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ86))
Typ = GetType(String).GetMethod("Concat", typ86).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 208, 1, 208, 100)
Dim typ87(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Name: ")
Typ = GetType(System.String)
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Name)
Typ = Name.FieldType
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ87(UBound(typ87) + 1)
typ87(UBound(typ87)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ87))
Typ = GetType(String).GetMethod("Concat", typ87).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 209, 1, 209, 100)
Dim typ88(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Surname: ")
Typ = GetType(System.String)
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Surname)
Typ = Surname.FieldType
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ88(UBound(typ88) + 1)
typ88(UBound(typ88)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ88))
Typ = GetType(String).GetMethod("Concat", typ88).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 210, 1, 210, 100)
Dim typ89(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ89(UBound(typ89) + 1)
typ89(UBound(typ89)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Email1: ")
Typ = GetType(System.String)
ReDim Preserve typ89(UBound(typ89) + 1)
typ89(UBound(typ89)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Email1)
Typ = Email1.FieldType
ReDim Preserve typ89(UBound(typ89) + 1)
typ89(UBound(typ89)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ89(UBound(typ89) + 1)
typ89(UBound(typ89)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ89))
Typ = GetType(String).GetMethod("Concat", typ89).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 211, 1, 211, 100)
Dim typ90(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Email2: ")
Typ = GetType(System.String)
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Email2)
Typ = Email2.FieldType
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ90(UBound(typ90) + 1)
typ90(UBound(typ90)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ90))
Typ = GetType(String).GetMethod("Concat", typ90).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 212, 1, 212, 100)
Dim typ91(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Email3: ")
Typ = GetType(System.String)
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Email3)
Typ = Email3.FieldType
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ91(UBound(typ91) + 1)
typ91(UBound(typ91)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ91))
Typ = GetType(String).GetMethod("Concat", typ91).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 213, 1, 213, 100)
Dim typ92(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Tel1: ")
Typ = GetType(System.String)
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Tel1)
Typ = Tel1.FieldType
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ92(UBound(typ92) + 1)
typ92(UBound(typ92)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ92))
Typ = GetType(String).GetMethod("Concat", typ92).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 214, 1, 214, 100)
Dim typ93(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ93(UBound(typ93) + 1)
typ93(UBound(typ93)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Tel2: ")
Typ = GetType(System.String)
ReDim Preserve typ93(UBound(typ93) + 1)
typ93(UBound(typ93)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Tel2)
Typ = Tel2.FieldType
ReDim Preserve typ93(UBound(typ93) + 1)
typ93(UBound(typ93)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ93(UBound(typ93) + 1)
typ93(UBound(typ93)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ93))
Typ = GetType(String).GetMethod("Concat", typ93).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 215, 1, 215, 100)
Dim typ94(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ94(UBound(typ94) + 1)
typ94(UBound(typ94)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Address: ")
Typ = GetType(System.String)
ReDim Preserve typ94(UBound(typ94) + 1)
typ94(UBound(typ94)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Address)
Typ = Address.FieldType
ReDim Preserve typ94(UBound(typ94) + 1)
typ94(UBound(typ94)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ94(UBound(typ94) + 1)
typ94(UBound(typ94)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ94))
Typ = GetType(String).GetMethod("Concat", typ94).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 216, 1, 216, 100)
Dim typ95(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Notes: ")
Typ = GetType(System.String)
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Notes)
Typ = Notes.FieldType
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ95(UBound(typ95) + 1)
typ95(UBound(typ95)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ95))
Typ = GetType(String).GetMethod("Concat", typ95).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc4, 217, 1, 217, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 218, 1, 218, 100)
GetMemberIL.Emit(OpCodes.Br, cont17)
GetMemberIL.MarkLabel(fa17)
GetMemberIL.MarkSequencePoint(doc4, 219, 1, 219, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc4, 220, 1, 220, 100)
GetMemberIL.Emit(OpCodes.Br, cont17)
GetMemberIL.MarkLabel(cont17)
GetMemberIL.MarkSequencePoint(doc4, 222, 1, 222, 100)
GetMemberIL.MarkLabel(label0)
GetMemberIL.MarkSequencePoint(doc4, 224, 1, 224, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
GetMemberIL.MarkSequencePoint(doc4, 226, 1, 226, 100)
GetMemberIL.Emit(OpCodes.Ret)
Dim GetRecordString As MethodBuilder = ContactReader.DefineMethod("GetRecordString", MethodAttributes.Public, GetType(System.String), Type.EmptyTypes)
Dim GetRecordStringIL As ILGenerator = GetRecordString.GetILGenerator()
Dim GetRecordStringparam00 As ParameterBuilder = GetRecordString.DefineParameter(0, ParameterAttributes.RetVal, "")
GetRecordStringIL.MarkSequencePoint(doc4, 229, 1, 229, 100)
GetRecordStringIL.Emit(OpCodes.Ldarg_0)
Dim typ96(-1) As Type
GetRecordStringIL.Emit(OpCodes.Ldstr, "*")
Typ = GetType(System.String)
ReDim Preserve typ96(UBound(typ96) + 1)
typ96(UBound(typ96)) = Typ
GetRecordStringIL.Emit(OpCodes.Callvirt, GetMember)
Typ = GetMember.ReturnType
GetRecordStringIL.MarkSequencePoint(doc4, 230, 1, 230, 100)
GetRecordStringIL.Emit(OpCodes.Ret)
Dim typ97(-1) As Type
ReDim Preserve typ97(UBound(typ97) + 1)
typ97(UBound(typ97)) = GetType(System.String)
ReDim Preserve typ97(UBound(typ97) + 1)
typ97(UBound(typ97)) = GetType(System.String)
Dim DoQuery As MethodBuilder = ContactReader.DefineMethod("DoQuery", MethodAttributes.Public, GetType(System.Void), typ97)
Dim DoQueryIL As ILGenerator = DoQuery.GetILGenerator()
Dim DoQueryparam00 As ParameterBuilder = DoQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim DoQueryparam01 As ParameterBuilder = DoQuery.DefineParameter(1, ParameterAttributes.None, "sel")
Dim DoQueryparam02 As ParameterBuilder = DoQuery.DefineParameter(2, ParameterAttributes.None, "whr")
DoQueryIL.MarkSequencePoint(doc4, 234, 1, 234, 100)
Dim locbldr34 As LocalBuilder = DoQueryIL.DeclareLocal(GetType(System.String))
locbldr34.SetLocalSymInfo("str")
Dim typ98(-1) As Type
DoQueryIL.Emit(OpCodes.Ldstr, "select ")
Typ = GetType(System.String)
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, " from ")
Typ = GetType(System.String)
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg_0)
DoQueryIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ98(UBound(typ98) + 1)
typ98(UBound(typ98)) = Typ
DoQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ98))
Typ = GetType(String).GetMethod("Concat", typ98).ReturnType
DoQueryIL.Emit(OpCodes.Stloc, 0)
DoQueryIL.MarkSequencePoint(doc4, 235, 1, 235, 100)
Dim typ99(-1) As Type
DoQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, " where ")
Typ = GetType(System.String)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ99(UBound(typ99) + 1)
typ99(UBound(typ99)) = Typ
DoQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ99))
Typ = GetType(String).GetMethod("Concat", typ99).ReturnType
DoQueryIL.Emit(OpCodes.Stloc, 0)
DoQueryIL.MarkSequencePoint(doc4, 236, 1, 236, 100)
Dim typ100(-1) As Type
DoQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ100(UBound(typ100) + 1)
typ100(UBound(typ100)) = Typ
DoQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ100))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ100).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoQueryIL.Emit(OpCodes.Pop)
End If
DoQueryIL.MarkSequencePoint(doc4, 237, 1, 237, 100)
DoQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoQueryIL.Emit(OpCodes.Pop)
End If
DoQueryIL.MarkSequencePoint(doc4, 239, 1, 239, 100)
DoQueryIL.Emit(OpCodes.Ret)
Dim typ101(-1) As Type
ReDim Preserve typ101(UBound(typ101) + 1)
typ101(UBound(typ101)) = GetType(System.String)
ReDim Preserve typ101(UBound(typ101) + 1)
typ101(UBound(typ101)) = GetType(System.String)
Dim DoListQuery As MethodBuilder = ContactReader.DefineMethod("DoListQuery", MethodAttributes.Public, GetType(System.String), typ101)
Dim DoListQueryIL As ILGenerator = DoListQuery.GetILGenerator()
Dim DoListQueryparam00 As ParameterBuilder = DoListQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim DoListQueryparam01 As ParameterBuilder = DoListQuery.DefineParameter(1, ParameterAttributes.None, "sel")
Dim DoListQueryparam02 As ParameterBuilder = DoListQuery.DefineParameter(2, ParameterAttributes.None, "whr")
DoListQueryIL.MarkSequencePoint(doc4, 243, 1, 243, 100)
Dim locbldr35 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.String))
locbldr35.SetLocalSymInfo("str")
Dim typ102(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
DoListQueryIL.Emit(OpCodes.Ldarg_0)
DoListQueryIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
DoListQueryIL.Emit(OpCodes.Ldstr, " where ")
Typ = GetType(System.String)
ReDim Preserve typ102(UBound(typ102) + 1)
typ102(UBound(typ102)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ102))
Typ = GetType(String).GetMethod("Concat", typ102).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc4, 244, 1, 244, 100)
Dim typ103(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ103(UBound(typ103) + 1)
typ103(UBound(typ103)) = Typ
DoListQueryIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ103(UBound(typ103) + 1)
typ103(UBound(typ103)) = Typ
DoListQueryIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ103(UBound(typ103) + 1)
typ103(UBound(typ103)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ103))
Typ = GetType(String).GetMethod("Concat", typ103).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc4, 245, 1, 245, 100)
Dim typ104(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ104(UBound(typ104) + 1)
typ104(UBound(typ104)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ104))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ104).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoListQueryIL.Emit(OpCodes.Pop)
End If
DoListQueryIL.MarkSequencePoint(doc4, 246, 1, 246, 100)
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoListQueryIL.Emit(OpCodes.Pop)
End If
DoListQueryIL.MarkSequencePoint(doc4, 248, 1, 248, 100)
Dim locbldr36 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.Int32))
locbldr36.SetLocalSymInfo("i")
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Stloc, 1)
DoListQueryIL.MarkSequencePoint(doc4, 249, 1, 249, 100)
Dim locbldr37 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.Int32))
locbldr37.SetLocalSymInfo("len")
DoListQueryIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Sub)
DoListQueryIL.Emit(OpCodes.Stloc, 2)
DoListQueryIL.MarkSequencePoint(doc4, 250, 1, 250, 100)
Dim locbldr38 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.String))
locbldr38.SetLocalSymInfo("str2")
DoListQueryIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
DoListQueryIL.Emit(OpCodes.Stloc, 3)
DoListQueryIL.MarkSequencePoint(doc4, 252, 1, 252, 100)
Dim label1 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.MarkSequencePoint(doc4, 253, 1, 253, 100)
Dim label2 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.MarkSequencePoint(doc4, 255, 1, 255, 100)
DoListQueryIL.MarkLabel(label1)
DoListQueryIL.MarkSequencePoint(doc4, 257, 1, 257, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Add)
DoListQueryIL.Emit(OpCodes.Stloc, 1)
DoListQueryIL.MarkSequencePoint(doc4, 259, 1, 259, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ105(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ105(UBound(typ105) + 1)
typ105(UBound(typ105)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ105(UBound(typ105) + 1)
typ105(UBound(typ105)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ105))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ105).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, ID)
DoListQueryIL.MarkSequencePoint(doc4, 260, 1, 260, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ106(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ106(UBound(typ106) + 1)
typ106(UBound(typ106)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ106(UBound(typ106) + 1)
typ106(UBound(typ106)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ106))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ106).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Title)
DoListQueryIL.MarkSequencePoint(doc4, 261, 1, 261, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ107(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ107(UBound(typ107) + 1)
typ107(UBound(typ107)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
ReDim Preserve typ107(UBound(typ107) + 1)
typ107(UBound(typ107)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ107))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ107).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Name)
DoListQueryIL.MarkSequencePoint(doc4, 262, 1, 262, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ108(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ108(UBound(typ108) + 1)
typ108(UBound(typ108)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
ReDim Preserve typ108(UBound(typ108) + 1)
typ108(UBound(typ108)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ108))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ108).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Surname)
DoListQueryIL.MarkSequencePoint(doc4, 263, 1, 263, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ109(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ109(UBound(typ109) + 1)
typ109(UBound(typ109)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
ReDim Preserve typ109(UBound(typ109) + 1)
typ109(UBound(typ109)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ109))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ109).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Email1)
DoListQueryIL.MarkSequencePoint(doc4, 264, 1, 264, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ110(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ110(UBound(typ110) + 1)
typ110(UBound(typ110)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(5))
Typ = GetType(System.Int32)
ReDim Preserve typ110(UBound(typ110) + 1)
typ110(UBound(typ110)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ110))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ110).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Email2)
DoListQueryIL.MarkSequencePoint(doc4, 265, 1, 265, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ111(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ111(UBound(typ111) + 1)
typ111(UBound(typ111)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(6))
Typ = GetType(System.Int32)
ReDim Preserve typ111(UBound(typ111) + 1)
typ111(UBound(typ111)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ111))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ111).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Email3)
DoListQueryIL.MarkSequencePoint(doc4, 266, 1, 266, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ112(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ112(UBound(typ112) + 1)
typ112(UBound(typ112)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(7))
Typ = GetType(System.Int32)
ReDim Preserve typ112(UBound(typ112) + 1)
typ112(UBound(typ112)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ112))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ112).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Tel1)
DoListQueryIL.MarkSequencePoint(doc4, 267, 1, 267, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ113(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ113(UBound(typ113) + 1)
typ113(UBound(typ113)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(8))
Typ = GetType(System.Int32)
ReDim Preserve typ113(UBound(typ113) + 1)
typ113(UBound(typ113)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ113))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ113).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Tel2)
DoListQueryIL.MarkSequencePoint(doc4, 268, 1, 268, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ114(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ114(UBound(typ114) + 1)
typ114(UBound(typ114)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(9))
Typ = GetType(System.Int32)
ReDim Preserve typ114(UBound(typ114) + 1)
typ114(UBound(typ114)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ114))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ114).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Address)
DoListQueryIL.MarkSequencePoint(doc4, 269, 1, 269, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ115(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ115(UBound(typ115) + 1)
typ115(UBound(typ115)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(10))
Typ = GetType(System.Int32)
ReDim Preserve typ115(UBound(typ115) + 1)
typ115(UBound(typ115)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ115))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ115).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Notes)
DoListQueryIL.MarkSequencePoint(doc4, 271, 1, 271, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ116(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ116(UBound(typ116) + 1)
typ116(UBound(typ116)) = Typ
DoListQueryIL.Emit(OpCodes.Callvirt, GetMember)
Typ = GetMember.ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc4, 272, 1, 272, 100)
Dim typ117(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.String)
ReDim Preserve typ117(UBound(typ117) + 1)
typ117(UBound(typ117)) = Typ
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ117(UBound(typ117) + 1)
typ117(UBound(typ117)) = Typ
DoListQueryIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ117(UBound(typ117) + 1)
typ117(UBound(typ117)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ117))
Typ = GetType(String).GetMethod("Concat", typ117).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 3)
DoListQueryIL.MarkSequencePoint(doc4, 274, 1, 274, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa18 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
Dim tru18 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
Dim cont18 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.Emit(OpCodes.Beq, tru18)
DoListQueryIL.Emit(OpCodes.Br, fa18)
DoListQueryIL.MarkLabel(tru18)
DoListQueryIL.MarkSequencePoint(doc4, 275, 1, 275, 100)
DoListQueryIL.Emit(OpCodes.Br, label2)
DoListQueryIL.MarkSequencePoint(doc4, 276, 1, 276, 100)
DoListQueryIL.Emit(OpCodes.Br, cont18)
DoListQueryIL.MarkLabel(fa18)
DoListQueryIL.MarkSequencePoint(doc4, 277, 1, 277, 100)
DoListQueryIL.Emit(OpCodes.Br, label1)
DoListQueryIL.MarkSequencePoint(doc4, 278, 1, 278, 100)
DoListQueryIL.Emit(OpCodes.Br, cont18)
DoListQueryIL.MarkLabel(cont18)
DoListQueryIL.MarkSequencePoint(doc4, 280, 1, 280, 100)
DoListQueryIL.MarkLabel(label2)
DoListQueryIL.MarkSequencePoint(doc4, 282, 1, 282, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.String)
DoListQueryIL.MarkSequencePoint(doc4, 284, 1, 284, 100)
DoListQueryIL.Emit(OpCodes.Ret)
ContactReader.CreateType()
End Sub


Dim doc5 As ISymbolDocumentWriter

Sub ExamResultsReader()
Dim ExamResultsReader As TypeBuilder = mdl.DefineType("dylan.NET.SQLiteData" & "." & "ExamResultsReader", TypeAttributes.Public Or TypeAttributes.AutoLayout Or TypeAttributes.AnsiClass, GetType(System.Object))
Dim Subject As FieldBuilder = ExamResultsReader.DefineField("Subject", GetType(System.String), FieldAttributes.Public)
Dim Session As FieldBuilder = ExamResultsReader.DefineField("Session", GetType(System.String), FieldAttributes.Public)
Dim Year As FieldBuilder = ExamResultsReader.DefineField("Year", GetType(System.Int64), FieldAttributes.Public)
Dim Marks As FieldBuilder = ExamResultsReader.DefineField("Marks", GetType(System.Int64), FieldAttributes.Public)
Dim ID As FieldBuilder = ExamResultsReader.DefineField("ID", GetType(System.Int64), FieldAttributes.Public)
Dim Count As FieldBuilder = ExamResultsReader.DefineField("Count", GetType(System.Int64), FieldAttributes.Public)
Dim TableName As FieldBuilder = ExamResultsReader.DefineField("TableName", GetType(System.String), FieldAttributes.Public)
Dim ctor0 As ConstructorBuilder = ExamResultsReader.DefineConstructor(MethodAttributes.Public,CallingConventions.Standard , Type.EmptyTypes)
Dim ctor0IL As ILGenerator = ctor0.GetILGenerator()
Dim ctor0param00 As ParameterBuilder = ctor0.DefineParameter(0, ParameterAttributes.RetVal, "")
ctor0IL.MarkSequencePoint(doc5, 12, 1, 12, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Call, GetType(System.Object).GetConstructor(Type.EmptyTypes))
ctor0IL.MarkSequencePoint(doc5, 13, 1, 13, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Subject)
ctor0IL.MarkSequencePoint(doc5, 14, 1, 14, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, Session)
ctor0IL.MarkSequencePoint(doc5, 15, 1, 15, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, Year)
ctor0IL.MarkSequencePoint(doc5, 16, 1, 16, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, Marks)
ctor0IL.MarkSequencePoint(doc5, 17, 1, 17, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
ctor0IL.Emit(OpCodes.Stfld, TableName)
ctor0IL.MarkSequencePoint(doc5, 18, 1, 18, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, ID)
ctor0IL.MarkSequencePoint(doc5, 19, 1, 19, 100)
ctor0IL.Emit(OpCodes.Ldarg_0)
ctor0IL.Emit(OpCodes.Ldc_I8, CLng(0))
Typ = GetType(System.Int64)
ctor0IL.Emit(OpCodes.Stfld, Count)
ctor0IL.MarkSequencePoint(doc5, 20, 1, 20, 100)
ctor0IL.Emit(OpCodes.Ret)
Dim typ0(-1) As Type
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
ReDim Preserve typ0(UBound(typ0) + 1)
typ0(UBound(typ0)) = GetType(System.String)
Dim CreateAndOpenTable As MethodBuilder = ExamResultsReader.DefineMethod("CreateAndOpenTable", MethodAttributes.Public, GetType(System.Void), typ0)
Dim CreateAndOpenTableIL As ILGenerator = CreateAndOpenTable.GetILGenerator()
Dim CreateAndOpenTableparam00 As ParameterBuilder = CreateAndOpenTable.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim CreateAndOpenTableparam01 As ParameterBuilder = CreateAndOpenTable.DefineParameter(1, ParameterAttributes.None, "constr")
Dim CreateAndOpenTableparam02 As ParameterBuilder = CreateAndOpenTable.DefineParameter(2, ParameterAttributes.None, "tblname")
CreateAndOpenTableIL.MarkSequencePoint(doc5, 23, 1, 23, 100)
Dim typ1(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ1(UBound(typ1) + 1)
typ1(UBound(typ1)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ1))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ1).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 24, 1, 24, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 25, 1, 25, 100)
Dim locbldr39 As LocalBuilder = CreateAndOpenTableIL.DeclareLocal(GetType(System.String))
locbldr39.SetLocalSymInfo("str")
Dim typ2(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "create table ")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "(Subject text, Session text, Year INTEGER, Marks INTEGER);")
Typ = GetType(System.String)
ReDim Preserve typ2(UBound(typ2) + 1)
typ2(UBound(typ2)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ2))
Typ = GetType(String).GetMethod("Concat", typ2).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stloc, 0)
CreateAndOpenTableIL.MarkSequencePoint(doc5, 26, 1, 26, 100)
Dim typ3(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ3(UBound(typ3) + 1)
typ3(UBound(typ3)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ3))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ3).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 27, 1, 27, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 28, 1, 28, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 29, 1, 29, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 30, 1, 30, 100)
Dim typ4(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ4(UBound(typ4) + 1)
typ4(UBound(typ4)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ4))
Typ = GetType(String).GetMethod("Concat", typ4).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stloc, 0)
CreateAndOpenTableIL.MarkSequencePoint(doc5, 31, 1, 31, 100)
Dim typ5(-1) As Type
CreateAndOpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ5(UBound(typ5) + 1)
typ5(UBound(typ5)) = Typ
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ5))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ5).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 32, 1, 32, 100)
CreateAndOpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
CreateAndOpenTableIL.Emit(OpCodes.Pop)
End If
CreateAndOpenTableIL.MarkSequencePoint(doc5, 33, 1, 33, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg_0)
CreateAndOpenTableIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
Dim typ6 As Type() = {Typ}
CreateAndOpenTableIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt64", typ6))
Typ = GetType(System.Convert).GetMethod("ToInt64", typ6).ReturnType
CreateAndOpenTableIL.Emit(OpCodes.Stfld, Count)
CreateAndOpenTableIL.MarkSequencePoint(doc5, 34, 1, 34, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg_0)
CreateAndOpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
CreateAndOpenTableIL.Emit(OpCodes.Stfld, TableName)
CreateAndOpenTableIL.MarkSequencePoint(doc5, 35, 1, 35, 100)
CreateAndOpenTableIL.Emit(OpCodes.Ret)
Dim typ7(-1) As Type
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = GetType(System.String)
ReDim Preserve typ7(UBound(typ7) + 1)
typ7(UBound(typ7)) = GetType(System.String)
Dim OpenTable As MethodBuilder = ExamResultsReader.DefineMethod("OpenTable", MethodAttributes.Public, GetType(System.Void), typ7)
Dim OpenTableIL As ILGenerator = OpenTable.GetILGenerator()
Dim OpenTableparam00 As ParameterBuilder = OpenTable.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim OpenTableparam01 As ParameterBuilder = OpenTable.DefineParameter(1, ParameterAttributes.None, "constr")
Dim OpenTableparam02 As ParameterBuilder = OpenTable.DefineParameter(2, ParameterAttributes.None, "tblname")
OpenTableIL.MarkSequencePoint(doc5, 38, 1, 38, 100)
Dim typ8(-1) As Type
OpenTableIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ8(UBound(typ8) + 1)
typ8(UBound(typ8)) = Typ
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ8))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("InitCon", typ8).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc5, 39, 1, 39, 100)
Dim locbldr40 As LocalBuilder = OpenTableIL.DeclareLocal(GetType(System.String))
locbldr40.SetLocalSymInfo("str")
Dim typ9(-1) As Type
OpenTableIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ9(UBound(typ9) + 1)
typ9(UBound(typ9)) = Typ
OpenTableIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ9))
Typ = GetType(String).GetMethod("Concat", typ9).ReturnType
OpenTableIL.Emit(OpCodes.Stloc, 0)
OpenTableIL.MarkSequencePoint(doc5, 40, 1, 40, 100)
Dim typ10(-1) As Type
OpenTableIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ10(UBound(typ10) + 1)
typ10(UBound(typ10)) = Typ
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ10))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ10).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc5, 41, 1, 41, 100)
OpenTableIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
OpenTableIL.Emit(OpCodes.Pop)
End If
OpenTableIL.MarkSequencePoint(doc5, 42, 1, 42, 100)
OpenTableIL.Emit(OpCodes.Ldarg_0)
OpenTableIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
Dim typ11 As Type() = {Typ}
OpenTableIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToInt64", typ11))
Typ = GetType(System.Convert).GetMethod("ToInt64", typ11).ReturnType
OpenTableIL.Emit(OpCodes.Stfld, Count)
OpenTableIL.MarkSequencePoint(doc5, 43, 1, 43, 100)
OpenTableIL.Emit(OpCodes.Ldarg_0)
OpenTableIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
OpenTableIL.Emit(OpCodes.Stfld, TableName)
OpenTableIL.MarkSequencePoint(doc5, 44, 1, 44, 100)
OpenTableIL.Emit(OpCodes.Ret)
Dim AddRecord As MethodBuilder = ExamResultsReader.DefineMethod("AddRecord", MethodAttributes.Public, GetType(System.Void), Type.EmptyTypes)
Dim AddRecordIL As ILGenerator = AddRecord.GetILGenerator()
Dim AddRecordparam00 As ParameterBuilder = AddRecord.DefineParameter(0, ParameterAttributes.RetVal, "")
AddRecordIL.MarkSequencePoint(doc5, 47, 1, 47, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc5, 48, 1, 48, 100)
Dim locbldr41 As LocalBuilder = AddRecordIL.DeclareLocal(GetType(System.String))
locbldr41.SetLocalSymInfo("str")
Dim typ12(-1) As Type
AddRecordIL.Emit(OpCodes.Ldstr, "insert into ")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Ldstr, " values('','',0,0);")
Typ = GetType(System.String)
ReDim Preserve typ12(UBound(typ12) + 1)
typ12(UBound(typ12)) = Typ
AddRecordIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ12))
Typ = GetType(String).GetMethod("Concat", typ12).ReturnType
AddRecordIL.Emit(OpCodes.Stloc, 0)
AddRecordIL.MarkSequencePoint(doc5, 49, 1, 49, 100)
Dim typ13(-1) As Type
AddRecordIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ13(UBound(typ13) + 1)
typ13(UBound(typ13)) = Typ
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ13))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ13).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc5, 50, 1, 50, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc5, 51, 1, 51, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc5, 52, 1, 52, 100)
AddRecordIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
AddRecordIL.Emit(OpCodes.Pop)
End If
AddRecordIL.MarkSequencePoint(doc5, 53, 1, 53, 100)
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldarg_0)
AddRecordIL.Emit(OpCodes.Ldfld, Count)
Typ = Count.FieldType
AddRecordIL.Emit(OpCodes.Ldc_I8, CLng(1))
Typ = GetType(System.Int64)
AddRecordIL.Emit(OpCodes.Add)
AddRecordIL.Emit(OpCodes.Stfld, Count)
AddRecordIL.MarkSequencePoint(doc5, 54, 1, 54, 100)
AddRecordIL.Emit(OpCodes.Ret)
Dim typ14(-1) As Type
ReDim Preserve typ14(UBound(typ14) + 1)
typ14(UBound(typ14)) = GetType(System.Int64)
Dim LoadData As MethodBuilder = ExamResultsReader.DefineMethod("LoadData", MethodAttributes.Public, GetType(System.Void), typ14)
Dim LoadDataIL As ILGenerator = LoadData.GetILGenerator()
Dim LoadDataparam00 As ParameterBuilder = LoadData.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim LoadDataparam01 As ParameterBuilder = LoadData.DefineParameter(1, ParameterAttributes.None, "id")
LoadDataIL.MarkSequencePoint(doc5, 57, 1, 57, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int64)
LoadDataIL.Emit(OpCodes.Stfld, ID)
LoadDataIL.MarkSequencePoint(doc5, 58, 1, 58, 100)
Dim locbldr42 As LocalBuilder = LoadDataIL.DeclareLocal(GetType(System.String))
locbldr42.SetLocalSymInfo("str")
Dim typ15(-1) As Type
LoadDataIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldstr, " where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Ldarg_0)
LoadDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ16 As Type() = {Typ}
LoadDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ16))
Typ = GetType(System.Convert).GetMethod("ToString", typ16).ReturnType
ReDim Preserve typ15(UBound(typ15) + 1)
typ15(UBound(typ15)) = Typ
LoadDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ15))
Typ = GetType(String).GetMethod("Concat", typ15).ReturnType
LoadDataIL.Emit(OpCodes.Stloc, 0)
LoadDataIL.MarkSequencePoint(doc5, 59, 1, 59, 100)
Dim typ17(-1) As Type
LoadDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
LoadDataIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ17(UBound(typ17) + 1)
typ17(UBound(typ17)) = Typ
LoadDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ17))
Typ = GetType(String).GetMethod("Concat", typ17).ReturnType
LoadDataIL.Emit(OpCodes.Stloc, 0)
LoadDataIL.MarkSequencePoint(doc5, 60, 1, 60, 100)
Dim typ18(-1) As Type
LoadDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ18(UBound(typ18) + 1)
typ18(UBound(typ18)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ18))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ18).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
LoadDataIL.Emit(OpCodes.Pop)
End If
LoadDataIL.MarkSequencePoint(doc5, 61, 1, 61, 100)
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
LoadDataIL.Emit(OpCodes.Pop)
End If
LoadDataIL.MarkSequencePoint(doc5, 62, 1, 62, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ19(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ19(UBound(typ19) + 1)
typ19(UBound(typ19)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ19))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ19).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Subject)
LoadDataIL.MarkSequencePoint(doc5, 63, 1, 63, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ20(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
ReDim Preserve typ20(UBound(typ20) + 1)
typ20(UBound(typ20)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ20))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ20).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Session)
LoadDataIL.MarkSequencePoint(doc5, 64, 1, 64, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ21(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
ReDim Preserve typ21(UBound(typ21) + 1)
typ21(UBound(typ21)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ21))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ21).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Year)
LoadDataIL.MarkSequencePoint(doc5, 65, 1, 65, 100)
LoadDataIL.Emit(OpCodes.Ldarg_0)
Dim typ22(-1) As Type
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
LoadDataIL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
ReDim Preserve typ22(UBound(typ22) + 1)
typ22(UBound(typ22)) = Typ
LoadDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ22))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ22).ReturnType
LoadDataIL.Emit(OpCodes.Stfld, Marks)
LoadDataIL.MarkSequencePoint(doc5, 66, 1, 66, 100)
LoadDataIL.Emit(OpCodes.Ret)
Dim typ23(-1) As Type
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.Int64)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.String)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.Int64)
ReDim Preserve typ23(UBound(typ23) + 1)
typ23(UBound(typ23)) = GetType(System.Int64)
Dim WriteData As MethodBuilder = ExamResultsReader.DefineMethod("WriteData", MethodAttributes.Public, GetType(System.Void), typ23)
Dim WriteDataIL As ILGenerator = WriteData.GetILGenerator()
Dim WriteDataparam00 As ParameterBuilder = WriteData.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim WriteDataparam01 As ParameterBuilder = WriteData.DefineParameter(1, ParameterAttributes.None, "id")
Dim WriteDataparam02 As ParameterBuilder = WriteData.DefineParameter(2, ParameterAttributes.None, "sbj")
Dim WriteDataparam03 As ParameterBuilder = WriteData.DefineParameter(3, ParameterAttributes.None, "sesn")
Dim WriteDataparam04 As ParameterBuilder = WriteData.DefineParameter(4, ParameterAttributes.None, "yr")
Dim WriteDataparam05 As ParameterBuilder = WriteData.DefineParameter(5, ParameterAttributes.None, "mks")
WriteDataIL.MarkSequencePoint(doc5, 69, 1, 69, 100)
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.Int64)
WriteDataIL.Emit(OpCodes.Stfld, ID)
WriteDataIL.MarkSequencePoint(doc5, 70, 1, 70, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("BeginTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 71, 1, 71, 100)
Dim locbldr43 As LocalBuilder = WriteDataIL.DeclareLocal(GetType(System.String))
locbldr43.SetLocalSymInfo("str")
Dim typ24(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Subject = '")
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ24(UBound(typ24) + 1)
typ24(UBound(typ24)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ24))
Typ = GetType(String).GetMethod("Concat", typ24).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 72, 1, 72, 100)
Dim typ25(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ26 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ26))
Typ = GetType(System.Convert).GetMethod("ToString", typ26).ReturnType
ReDim Preserve typ25(UBound(typ25) + 1)
typ25(UBound(typ25)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ25))
Typ = GetType(String).GetMethod("Concat", typ25).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 73, 1, 73, 100)
Dim typ27(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ27(UBound(typ27) + 1)
typ27(UBound(typ27)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ27))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ27).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 74, 1, 74, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 75, 1, 75, 100)
Dim typ28(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Session = '")
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 3)
Typ = GetType(System.String)
ReDim Preserve typ28(UBound(typ28) + 1)
typ28(UBound(typ28)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ28))
Typ = GetType(String).GetMethod("Concat", typ28).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 76, 1, 76, 100)
Dim typ29(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, "' where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ30 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ30))
Typ = GetType(System.Convert).GetMethod("ToString", typ30).ReturnType
ReDim Preserve typ29(UBound(typ29) + 1)
typ29(UBound(typ29)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ29))
Typ = GetType(String).GetMethod("Concat", typ29).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 77, 1, 77, 100)
Dim typ31(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ31(UBound(typ31) + 1)
typ31(UBound(typ31)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ31))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ31).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 78, 1, 78, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 79, 1, 79, 100)
Dim typ32(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Year = ")
Typ = GetType(System.String)
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 4)
Typ = GetType(System.Int64)
Dim typ33 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ33))
Typ = GetType(System.Convert).GetMethod("ToString", typ33).ReturnType
ReDim Preserve typ32(UBound(typ32) + 1)
typ32(UBound(typ32)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ32))
Typ = GetType(String).GetMethod("Concat", typ32).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 80, 1, 80, 100)
Dim typ34(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ35 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ35))
Typ = GetType(System.Convert).GetMethod("ToString", typ35).ReturnType
ReDim Preserve typ34(UBound(typ34) + 1)
typ34(UBound(typ34)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ34))
Typ = GetType(String).GetMethod("Concat", typ34).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 81, 1, 81, 100)
Dim typ36(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ36(UBound(typ36) + 1)
typ36(UBound(typ36)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ36))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ36).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 82, 1, 82, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 83, 1, 83, 100)
Dim typ37(-1) As Type
WriteDataIL.Emit(OpCodes.Ldstr, "update ")
Typ = GetType(System.String)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " set Marks = ")
Typ = GetType(System.String)
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg, 5)
Typ = GetType(System.Int64)
Dim typ38 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ38))
Typ = GetType(System.Convert).GetMethod("ToString", typ38).ReturnType
ReDim Preserve typ37(UBound(typ37) + 1)
typ37(UBound(typ37)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ37))
Typ = GetType(String).GetMethod("Concat", typ37).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 84, 1, 84, 100)
Dim typ39(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
WriteDataIL.Emit(OpCodes.Ldstr, " where rowid = ")
Typ = GetType(System.String)
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
WriteDataIL.Emit(OpCodes.Ldarg_0)
WriteDataIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ40 As Type() = {Typ}
WriteDataIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ40))
Typ = GetType(System.Convert).GetMethod("ToString", typ40).ReturnType
ReDim Preserve typ39(UBound(typ39) + 1)
typ39(UBound(typ39)) = Typ
WriteDataIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ39))
Typ = GetType(String).GetMethod("Concat", typ39).ReturnType
WriteDataIL.Emit(OpCodes.Stloc, 0)
WriteDataIL.MarkSequencePoint(doc5, 85, 1, 85, 100)
Dim typ41(-1) As Type
WriteDataIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ41(UBound(typ41) + 1)
typ41(UBound(typ41)) = Typ
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ41))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ41).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 86, 1, 86, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecNonQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 87, 1, 87, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("CommitTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 88, 1, 88, 100)
WriteDataIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("EndTrans", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
WriteDataIL.Emit(OpCodes.Pop)
End If
WriteDataIL.MarkSequencePoint(doc5, 89, 1, 89, 100)
WriteDataIL.Emit(OpCodes.Ret)
Dim typ42(-1) As Type
ReDim Preserve typ42(UBound(typ42) + 1)
typ42(UBound(typ42)) = GetType(System.String)
Dim GetMember As MethodBuilder = ExamResultsReader.DefineMethod("GetMember", MethodAttributes.Public, GetType(System.String), typ42)
Dim GetMemberIL As ILGenerator = GetMember.GetILGenerator()
Dim GetMemberparam00 As ParameterBuilder = GetMember.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim GetMemberparam01 As ParameterBuilder = GetMember.DefineParameter(1, ParameterAttributes.None, "mem")
GetMemberIL.MarkSequencePoint(doc5, 92, 1, 92, 100)
Dim label0 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.MarkSequencePoint(doc5, 93, 1, 93, 100)
Dim locbldr44 As LocalBuilder = GetMemberIL.DeclareLocal(GetType(System.String))
locbldr44.SetLocalSymInfo("str")
GetMemberIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 94, 1, 94, 100)
Dim locbldr45 As LocalBuilder = GetMemberIL.DeclareLocal(GetType(System.Int32))
locbldr45.SetLocalSymInfo("comp")
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc5, 96, 1, 96, 100)
Dim typ43(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "ID")
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ43(UBound(typ43) + 1)
typ43(UBound(typ43)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ43))
Typ = GetType(String).GetMethod("Compare", typ43).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc5, 97, 1, 97, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa19 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru19 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont19 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru19)
GetMemberIL.Emit(OpCodes.Br, fa19)
GetMemberIL.MarkLabel(tru19)
GetMemberIL.MarkSequencePoint(doc5, 98, 1, 98, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ44 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ44))
Typ = GetType(System.Convert).GetMethod("ToString", typ44).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 99, 1, 99, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc5, 100, 1, 100, 100)
GetMemberIL.Emit(OpCodes.Br, cont19)
GetMemberIL.MarkLabel(fa19)
GetMemberIL.Emit(OpCodes.Br, cont19)
GetMemberIL.MarkLabel(cont19)
GetMemberIL.MarkSequencePoint(doc5, 102, 1, 102, 100)
Dim typ45(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Subject")
Typ = GetType(System.String)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ45(UBound(typ45) + 1)
typ45(UBound(typ45)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ45))
Typ = GetType(String).GetMethod("Compare", typ45).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc5, 103, 1, 103, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa20 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru20 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont20 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru20)
GetMemberIL.Emit(OpCodes.Br, fa20)
GetMemberIL.MarkLabel(tru20)
GetMemberIL.MarkSequencePoint(doc5, 104, 1, 104, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Subject)
Typ = Subject.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 105, 1, 105, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc5, 106, 1, 106, 100)
GetMemberIL.Emit(OpCodes.Br, cont20)
GetMemberIL.MarkLabel(fa20)
GetMemberIL.Emit(OpCodes.Br, cont20)
GetMemberIL.MarkLabel(cont20)
GetMemberIL.MarkSequencePoint(doc5, 108, 1, 108, 100)
Dim typ46(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Session")
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ46(UBound(typ46) + 1)
typ46(UBound(typ46)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ46))
Typ = GetType(String).GetMethod("Compare", typ46).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc5, 109, 1, 109, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa21 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru21 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont21 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru21)
GetMemberIL.Emit(OpCodes.Br, fa21)
GetMemberIL.MarkLabel(tru21)
GetMemberIL.MarkSequencePoint(doc5, 110, 1, 110, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Session)
Typ = Session.FieldType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 111, 1, 111, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc5, 112, 1, 112, 100)
GetMemberIL.Emit(OpCodes.Br, cont21)
GetMemberIL.MarkLabel(fa21)
GetMemberIL.Emit(OpCodes.Br, cont21)
GetMemberIL.MarkLabel(cont21)
GetMemberIL.MarkSequencePoint(doc5, 114, 1, 114, 100)
Dim typ47(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Year")
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ47(UBound(typ47) + 1)
typ47(UBound(typ47)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ47))
Typ = GetType(String).GetMethod("Compare", typ47).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc5, 115, 1, 115, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa22 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru22 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont22 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru22)
GetMemberIL.Emit(OpCodes.Br, fa22)
GetMemberIL.MarkLabel(tru22)
GetMemberIL.MarkSequencePoint(doc5, 116, 1, 116, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Year)
Typ = Year.FieldType
Dim typ48 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ48))
Typ = GetType(System.Convert).GetMethod("ToString", typ48).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 117, 1, 117, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc5, 118, 1, 118, 100)
GetMemberIL.Emit(OpCodes.Br, cont22)
GetMemberIL.MarkLabel(fa22)
GetMemberIL.Emit(OpCodes.Br, cont22)
GetMemberIL.MarkLabel(cont22)
GetMemberIL.MarkSequencePoint(doc5, 120, 1, 120, 100)
Dim typ49(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "Marks")
Typ = GetType(System.String)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ49(UBound(typ49) + 1)
typ49(UBound(typ49)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ49))
Typ = GetType(String).GetMethod("Compare", typ49).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc5, 121, 1, 121, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa23 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru23 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont23 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru23)
GetMemberIL.Emit(OpCodes.Br, fa23)
GetMemberIL.MarkLabel(tru23)
GetMemberIL.MarkSequencePoint(doc5, 122, 1, 122, 100)
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Marks)
Typ = Marks.FieldType
Dim typ50 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ50))
Typ = GetType(System.Convert).GetMethod("ToString", typ50).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 123, 1, 123, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc5, 124, 1, 124, 100)
GetMemberIL.Emit(OpCodes.Br, cont23)
GetMemberIL.MarkLabel(fa23)
GetMemberIL.Emit(OpCodes.Br, cont23)
GetMemberIL.MarkLabel(cont23)
GetMemberIL.MarkSequencePoint(doc5, 126, 1, 126, 100)
Dim typ51(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "*")
Typ = GetType(System.String)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ51(UBound(typ51) + 1)
typ51(UBound(typ51)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Compare", typ51))
Typ = GetType(String).GetMethod("Compare", typ51).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 1)
GetMemberIL.MarkSequencePoint(doc5, 127, 1, 127, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
GetMemberIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
Dim fa24 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim tru24 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
Dim cont24 As System.Reflection.Emit.Label = GetMemberIL.DefineLabel()
GetMemberIL.Emit(OpCodes.Beq, tru24)
GetMemberIL.Emit(OpCodes.Br, fa24)
GetMemberIL.MarkLabel(tru24)
GetMemberIL.MarkSequencePoint(doc5, 128, 1, 128, 100)
Dim typ52(-1) As Type
GetMemberIL.Emit(OpCodes.Ldstr, "ID: ")
Typ = GetType(System.String)
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, ID)
Typ = ID.FieldType
Dim typ53 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ53))
Typ = GetType(System.Convert).GetMethod("ToString", typ53).ReturnType
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ52(UBound(typ52) + 1)
typ52(UBound(typ52)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ52))
Typ = GetType(String).GetMethod("Concat", typ52).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 129, 1, 129, 100)
Dim typ54(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Subject: ")
Typ = GetType(System.String)
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Subject)
Typ = Subject.FieldType
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ54(UBound(typ54) + 1)
typ54(UBound(typ54)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ54))
Typ = GetType(String).GetMethod("Concat", typ54).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 130, 1, 130, 100)
Dim typ55(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Session: ")
Typ = GetType(System.String)
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Session)
Typ = Session.FieldType
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ55(UBound(typ55) + 1)
typ55(UBound(typ55)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ55))
Typ = GetType(String).GetMethod("Concat", typ55).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 131, 1, 131, 100)
Dim typ56(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Year: ")
Typ = GetType(System.String)
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Year)
Typ = Year.FieldType
Dim typ57 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ57))
Typ = GetType(System.Convert).GetMethod("ToString", typ57).ReturnType
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ56(UBound(typ56) + 1)
typ56(UBound(typ56)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ56))
Typ = GetType(String).GetMethod("Concat", typ56).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 132, 1, 132, 100)
Dim typ58(-1) As Type
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
GetMemberIL.Emit(OpCodes.Ldstr, "Marks: ")
Typ = GetType(System.String)
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
GetMemberIL.Emit(OpCodes.Ldarg_0)
GetMemberIL.Emit(OpCodes.Ldfld, Marks)
Typ = Marks.FieldType
Dim typ59 As Type() = {Typ}
GetMemberIL.Emit(OpCodes.Call, GetType(System.Convert).GetMethod("ToString", typ59))
Typ = GetType(System.Convert).GetMethod("ToString", typ59).ReturnType
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
GetMemberIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ58(UBound(typ58) + 1)
typ58(UBound(typ58)) = Typ
GetMemberIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ58))
Typ = GetType(String).GetMethod("Concat", typ58).ReturnType
GetMemberIL.Emit(OpCodes.Stloc, 0)
GetMemberIL.MarkSequencePoint(doc5, 133, 1, 133, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc5, 134, 1, 134, 100)
GetMemberIL.Emit(OpCodes.Br, cont24)
GetMemberIL.MarkLabel(fa24)
GetMemberIL.MarkSequencePoint(doc5, 135, 1, 135, 100)
GetMemberIL.Emit(OpCodes.Br, label0)
GetMemberIL.MarkSequencePoint(doc5, 136, 1, 136, 100)
GetMemberIL.Emit(OpCodes.Br, cont24)
GetMemberIL.MarkLabel(cont24)
GetMemberIL.MarkSequencePoint(doc5, 138, 1, 138, 100)
GetMemberIL.MarkLabel(label0)
GetMemberIL.MarkSequencePoint(doc5, 140, 1, 140, 100)
GetMemberIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
GetMemberIL.MarkSequencePoint(doc5, 142, 1, 142, 100)
GetMemberIL.Emit(OpCodes.Ret)
Dim GetRecordString As MethodBuilder = ExamResultsReader.DefineMethod("GetRecordString", MethodAttributes.Public, GetType(System.String), Type.EmptyTypes)
Dim GetRecordStringIL As ILGenerator = GetRecordString.GetILGenerator()
Dim GetRecordStringparam00 As ParameterBuilder = GetRecordString.DefineParameter(0, ParameterAttributes.RetVal, "")
GetRecordStringIL.MarkSequencePoint(doc5, 145, 1, 145, 100)
GetRecordStringIL.Emit(OpCodes.Ldarg_0)
Dim typ60(-1) As Type
GetRecordStringIL.Emit(OpCodes.Ldstr, "*")
Typ = GetType(System.String)
ReDim Preserve typ60(UBound(typ60) + 1)
typ60(UBound(typ60)) = Typ
GetRecordStringIL.Emit(OpCodes.Callvirt, GetMember)
Typ = GetMember.ReturnType
GetRecordStringIL.MarkSequencePoint(doc5, 146, 1, 146, 100)
GetRecordStringIL.Emit(OpCodes.Ret)
Dim typ61(-1) As Type
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = GetType(System.String)
ReDim Preserve typ61(UBound(typ61) + 1)
typ61(UBound(typ61)) = GetType(System.String)
Dim DoQuery As MethodBuilder = ExamResultsReader.DefineMethod("DoQuery", MethodAttributes.Public, GetType(System.Void), typ61)
Dim DoQueryIL As ILGenerator = DoQuery.GetILGenerator()
Dim DoQueryparam00 As ParameterBuilder = DoQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim DoQueryparam01 As ParameterBuilder = DoQuery.DefineParameter(1, ParameterAttributes.None, "sel")
Dim DoQueryparam02 As ParameterBuilder = DoQuery.DefineParameter(2, ParameterAttributes.None, "whr")
DoQueryIL.MarkSequencePoint(doc5, 150, 1, 150, 100)
Dim locbldr46 As LocalBuilder = DoQueryIL.DeclareLocal(GetType(System.String))
locbldr46.SetLocalSymInfo("str")
Dim typ62(-1) As Type
DoQueryIL.Emit(OpCodes.Ldstr, "select ")
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, " from ")
Typ = GetType(System.String)
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg_0)
DoQueryIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ62(UBound(typ62) + 1)
typ62(UBound(typ62)) = Typ
DoQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ62))
Typ = GetType(String).GetMethod("Concat", typ62).ReturnType
DoQueryIL.Emit(OpCodes.Stloc, 0)
DoQueryIL.MarkSequencePoint(doc5, 151, 1, 151, 100)
Dim typ63(-1) As Type
DoQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, " where ")
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
DoQueryIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
DoQueryIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ63(UBound(typ63) + 1)
typ63(UBound(typ63)) = Typ
DoQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ63))
Typ = GetType(String).GetMethod("Concat", typ63).ReturnType
DoQueryIL.Emit(OpCodes.Stloc, 0)
DoQueryIL.MarkSequencePoint(doc5, 152, 1, 152, 100)
Dim typ64(-1) As Type
DoQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ64(UBound(typ64) + 1)
typ64(UBound(typ64)) = Typ
DoQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ64))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ64).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoQueryIL.Emit(OpCodes.Pop)
End If
DoQueryIL.MarkSequencePoint(doc5, 153, 1, 153, 100)
DoQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoQueryIL.Emit(OpCodes.Pop)
End If
DoQueryIL.MarkSequencePoint(doc5, 155, 1, 155, 100)
DoQueryIL.Emit(OpCodes.Ret)
Dim typ65(-1) As Type
ReDim Preserve typ65(UBound(typ65) + 1)
typ65(UBound(typ65)) = GetType(System.String)
ReDim Preserve typ65(UBound(typ65) + 1)
typ65(UBound(typ65)) = GetType(System.String)
Dim DoListQuery As MethodBuilder = ExamResultsReader.DefineMethod("DoListQuery", MethodAttributes.Public, GetType(System.String), typ65)
Dim DoListQueryIL As ILGenerator = DoListQuery.GetILGenerator()
Dim DoListQueryparam00 As ParameterBuilder = DoListQuery.DefineParameter(0, ParameterAttributes.RetVal, "")
Dim DoListQueryparam01 As ParameterBuilder = DoListQuery.DefineParameter(1, ParameterAttributes.None, "sel")
Dim DoListQueryparam02 As ParameterBuilder = DoListQuery.DefineParameter(2, ParameterAttributes.None, "whr")
DoListQueryIL.MarkSequencePoint(doc5, 159, 1, 159, 100)
Dim locbldr47 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.String))
locbldr47.SetLocalSymInfo("str")
Dim typ66(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldstr, "select rowid,* from ")
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
DoListQueryIL.Emit(OpCodes.Ldarg_0)
DoListQueryIL.Emit(OpCodes.Ldfld, TableName)
Typ = TableName.FieldType
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
DoListQueryIL.Emit(OpCodes.Ldstr, " where ")
Typ = GetType(System.String)
ReDim Preserve typ66(UBound(typ66) + 1)
typ66(UBound(typ66)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ66))
Typ = GetType(String).GetMethod("Concat", typ66).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc5, 160, 1, 160, 100)
Dim typ67(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
DoListQueryIL.Emit(OpCodes.Ldarg, 2)
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
DoListQueryIL.Emit(OpCodes.Ldstr, ";")
Typ = GetType(System.String)
ReDim Preserve typ67(UBound(typ67) + 1)
typ67(UBound(typ67)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ67))
Typ = GetType(String).GetMethod("Concat", typ67).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc5, 161, 1, 161, 100)
Dim typ68(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ68(UBound(typ68) + 1)
typ68(UBound(typ68)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ68))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("PrepCmd", typ68).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoListQueryIL.Emit(OpCodes.Pop)
End If
DoListQueryIL.MarkSequencePoint(doc5, 162, 1, 162, 100)
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("ExecQuery", Type.EmptyTypes).ReturnType
If Typ.ToString() = GetType(System.Void).ToString() Then

Else
DoListQueryIL.Emit(OpCodes.Pop)
End If
DoListQueryIL.MarkSequencePoint(doc5, 164, 1, 164, 100)
Dim locbldr48 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.Int32))
locbldr48.SetLocalSymInfo("i")
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(-1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Stloc, 1)
DoListQueryIL.MarkSequencePoint(doc5, 165, 1, 165, 100)
Dim locbldr49 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.Int32))
locbldr49.SetLocalSymInfo("len")
DoListQueryIL.Emit(OpCodes.Ldsfld, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount"))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetField("RwCount").FieldType
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Sub)
DoListQueryIL.Emit(OpCodes.Stloc, 2)
DoListQueryIL.MarkSequencePoint(doc5, 166, 1, 166, 100)
Dim locbldr50 As LocalBuilder = DoListQueryIL.DeclareLocal(GetType(System.String))
locbldr50.SetLocalSymInfo("str2")
DoListQueryIL.Emit(OpCodes.Ldstr, "")
Typ = GetType(System.String)
DoListQueryIL.Emit(OpCodes.Stloc, 3)
DoListQueryIL.MarkSequencePoint(doc5, 168, 1, 168, 100)
Dim label1 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.MarkSequencePoint(doc5, 169, 1, 169, 100)
Dim label2 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.MarkSequencePoint(doc5, 171, 1, 171, 100)
DoListQueryIL.MarkLabel(label1)
DoListQueryIL.MarkSequencePoint(doc5, 173, 1, 173, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Add)
DoListQueryIL.Emit(OpCodes.Stloc, 1)
DoListQueryIL.MarkSequencePoint(doc5, 175, 1, 175, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ69(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ69(UBound(typ69) + 1)
typ69(UBound(typ69)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(0))
Typ = GetType(System.Int32)
ReDim Preserve typ69(UBound(typ69) + 1)
typ69(UBound(typ69)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ69))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ69).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, ID)
DoListQueryIL.MarkSequencePoint(doc5, 176, 1, 176, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ70(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(1))
Typ = GetType(System.Int32)
ReDim Preserve typ70(UBound(typ70) + 1)
typ70(UBound(typ70)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ70))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ70).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Subject)
DoListQueryIL.MarkSequencePoint(doc5, 177, 1, 177, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ71(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(2))
Typ = GetType(System.Int32)
ReDim Preserve typ71(UBound(typ71) + 1)
typ71(UBound(typ71)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ71))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemString", typ71).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Session)
DoListQueryIL.MarkSequencePoint(doc5, 178, 1, 178, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ72(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ72(UBound(typ72) + 1)
typ72(UBound(typ72)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(3))
Typ = GetType(System.Int32)
ReDim Preserve typ72(UBound(typ72) + 1)
typ72(UBound(typ72)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ72))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ72).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Year)
DoListQueryIL.MarkSequencePoint(doc5, 179, 1, 179, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ73(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
DoListQueryIL.Emit(OpCodes.Ldc_I4, CInt(4))
Typ = GetType(System.Int32)
ReDim Preserve typ73(UBound(typ73) + 1)
typ73(UBound(typ73)) = Typ
DoListQueryIL.Emit(OpCodes.Call, asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ73))
Typ = asm.GetType("dylan.NET.SQLiteData.SQLConnection").GetMethod("get_RowItemInt64", typ73).ReturnType
DoListQueryIL.Emit(OpCodes.Stfld, Marks)
DoListQueryIL.MarkSequencePoint(doc5, 181, 1, 181, 100)
DoListQueryIL.Emit(OpCodes.Ldarg_0)
Dim typ74(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldarg, 1)
Typ = GetType(System.String)
ReDim Preserve typ74(UBound(typ74) + 1)
typ74(UBound(typ74)) = Typ
DoListQueryIL.Emit(OpCodes.Callvirt, GetMember)
Typ = GetMember.ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 0)
DoListQueryIL.MarkSequencePoint(doc5, 182, 1, 182, 100)
Dim typ75(-1) As Type
DoListQueryIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.String)
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
DoListQueryIL.Emit(OpCodes.Ldloc, 0)
Typ = GetType(System.String)
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
DoListQueryIL.Emit(OpCodes.Ldsfld, GetType(Utils.Constants).GetField("crlf"))
Typ = GetType(Utils.Constants).GetField("crlf").FieldType
ReDim Preserve typ75(UBound(typ75) + 1)
typ75(UBound(typ75)) = Typ
DoListQueryIL.Emit(OpCodes.Call, GetType(String).GetMethod("Concat", typ75))
Typ = GetType(String).GetMethod("Concat", typ75).ReturnType
DoListQueryIL.Emit(OpCodes.Stloc, 3)
DoListQueryIL.MarkSequencePoint(doc5, 184, 1, 184, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 1)
Typ = GetType(System.Int32)
DoListQueryIL.Emit(OpCodes.Ldloc, 2)
Typ = GetType(System.Int32)
Dim fa25 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
Dim tru25 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
Dim cont25 As System.Reflection.Emit.Label = DoListQueryIL.DefineLabel()
DoListQueryIL.Emit(OpCodes.Beq, tru25)
DoListQueryIL.Emit(OpCodes.Br, fa25)
DoListQueryIL.MarkLabel(tru25)
DoListQueryIL.MarkSequencePoint(doc5, 185, 1, 185, 100)
DoListQueryIL.Emit(OpCodes.Br, label2)
DoListQueryIL.MarkSequencePoint(doc5, 186, 1, 186, 100)
DoListQueryIL.Emit(OpCodes.Br, cont25)
DoListQueryIL.MarkLabel(fa25)
DoListQueryIL.MarkSequencePoint(doc5, 187, 1, 187, 100)
DoListQueryIL.Emit(OpCodes.Br, label1)
DoListQueryIL.MarkSequencePoint(doc5, 188, 1, 188, 100)
DoListQueryIL.Emit(OpCodes.Br, cont25)
DoListQueryIL.MarkLabel(cont25)
DoListQueryIL.MarkSequencePoint(doc5, 190, 1, 190, 100)
DoListQueryIL.MarkLabel(label2)
DoListQueryIL.MarkSequencePoint(doc5, 192, 1, 192, 100)
DoListQueryIL.Emit(OpCodes.Ldloc, 3)
Typ = GetType(System.String)
DoListQueryIL.MarkSequencePoint(doc5, 194, 1, 194, 100)
DoListQueryIL.Emit(OpCodes.Ret)
ExamResultsReader.CreateType()
End Sub

Sub Main()

asmName = New AssemblyName("sld")
asmName.Version = New System.Version(1, 1, 0, 0)
asm  = AppDomain.CurrentDomain.DefineDynamicAssembly(asmName, AssemblyBuilderAccess.Save, CStr("E:\Code\dylannet\sld\"))
mdl = asm.DefineDynamicModule(asmName.Name & ".dll" , asmName.Name & ".dll", True)
resw = mdl.DefineResource("sld.resources" ,  "Description")
doc = mdl.DefineDocument("E:\Code\dylannet\sld\sld.txt", Guid.Empty, Guid.Empty, Guid.Empty)
doc2 = mdl.DefineDocument("E:\Code\dylannet\sld\sqlconn.txt", Guid.Empty, Guid.Empty, Guid.Empty)
doc3 = mdl.DefineDocument("E:\Code\dylannet\sld\namerdr.txt", Guid.Empty, Guid.Empty, Guid.Empty)
doc4 = mdl.DefineDocument("E:\Code\dylannet\sld\cntsrdr.txt", Guid.Empty, Guid.Empty, Guid.Empty)
doc5 = mdl.DefineDocument("E:\Code\dylannet\sld\examresrdr.txt", Guid.Empty, Guid.Empty, Guid.Empty)
addstr("sld")
addasm(asm)
Dim daType As Type = GetType(DebuggableAttribute)
Dim daCtor As ConstructorInfo = daType.GetConstructor(New Type() { GetType(DebuggableAttribute.DebuggingModes) })
Dim daBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(daCtor, New Object() {DebuggableAttribute.DebuggingModes.DisableOptimizations Or _
DebuggableAttribute.DebuggingModes.Default })
asm.SetCustomAttribute(daBuilder)

SQLConnection()
NameReader()
ContactReader()
ExamResultsReader()
Dim vaType As Type = GetType(AssemblyFileVersionAttribute)
Dim vaCtor As ConstructorInfo = vaType.GetConstructor(New Type() { GetType(String) })
Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {"1.1.0.0"})
asm.SetCustomAttribute(vaBuilder)

Dim paType As Type = GetType(AssemblyProductAttribute)
Dim paCtor As ConstructorInfo = paType.GetConstructor(New Type() { GetType(String) })
Dim paBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(paCtor, New Object() {"sld"})
asm.SetCustomAttribute(paBuilder)

Dim ataType As Type = GetType(AssemblyTitleAttribute)
Dim ataCtor As ConstructorInfo = ataType.GetConstructor(New Type() { GetType(String) })
Dim ataBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(ataCtor, New Object() {"sld"})
asm.SetCustomAttribute(ataBuilder)

Dim deaType As Type = GetType(AssemblyDescriptionAttribute)
Dim deaCtor As ConstructorInfo = deaType.GetConstructor(New Type() { GetType(String) })
Dim deaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(deaCtor, New Object() {"sld"})
asm.SetCustomAttribute(deaBuilder)


asm.DefineVersionInfoResource()
asm.Save(asmName.Name & ".dll")
End Sub


End Module