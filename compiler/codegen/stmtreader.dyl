//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi StmtReader

method public void Read(var stm as Stmt, var fpath as string)

var typ as System.Type
var b as boolean = false

label fin

if AsmFactory::DebugFlg = true then
if AsmFactory::InMethodFlg = true then
ILEmitter::MarkDbgPt(stm::Line)
end if
end if

typ = gettype RefasmStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var rastm as RefasmStmt = stm
var ap as Token = rastm::AsmPath

var tmpstr as string = String::Concat(Utils.Constants::quot,"*",Utils.Constants::quot)
var compb as boolean = Utils.ParseUtils::LikeOP(ap::Value, tmpstr)

if compb = true then
tmpstr = ap::Value
var tmpchrarr as char[] = newarr char 1
tmpchrarr[0] = $char$Utils.Constants::quot
tmpstr = tmpstr::Trim(tmpchrarr)
ap::Value = tmpstr
end if

var asm as Assembly = Assembly::LoadFrom(ap::Value)
Console::Write("Referencing Assembly: ")
Console::WriteLine(ap::Value)
Importer::AddAsm(asm)
goto fin
end if

typ = gettype ImportStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var istm as ImportStmt = stm
var ina as Token = istm::NS

tmpstr = String::Concat(Utils.Constants::quot,"*",Utils.Constants::quot)
compb = Utils.ParseUtils::LikeOP(ina::Value, tmpstr)

if compb = true then
tmpstr = ina::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = $char$Utils.Constants::quot
tmpstr = tmpstr::Trim(tmpchrarr)
ina::Value = tmpstr
end if

Console::Write("Importing Namespace: ")
Console::WriteLine(ina::Value)

Importer::AddImp(ina::Value)
goto fin
end if

typ = gettype LocimportStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var listm as LocimportStmt = stm
var lina as Token = listm::NS

tmpstr = String::Concat(Utils.Constants::quot,"*",Utils.Constants::quot)
compb = Utils.ParseUtils::LikeOP(lina::Value, tmpstr)

if compb = true then
tmpstr = lina::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = $char$Utils.Constants::quot
tmpstr = tmpstr::Trim(tmpchrarr)
lina::Value = tmpstr
end if

Console::Write("Importing Namespace: ")
Console::WriteLine(lina::Value)

Importer::AddLocImp(lina::Value)
goto fin
end if

typ = gettype AssemblyStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then

var asms as AssemblyStmt = stm
var asmn as Ident = asms::AsmName
AsmFactory::AsmNameStr = new AssemblyName(asmn::Value)
var asmm as Token = asms::Mode
AsmFactory::AsmMode = asmm::Value
AsmFactory::DfltNS = asmn::Value
AsmFactory::CurnNS = asmn::Value

Console::Write("Beginning Assembly: ")
Console::WriteLine(asmn::Value)

goto fin

end if

typ = gettype VerStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var asmv as VerStmt = stm
var vns as IntLiteral[] = asmv::VersionNos
var vne as IntLiteral
var vernos as integer[] = newarr integer 4
vne = vns[0]
vernos[0] = vne::NumVal
vne = vns[1]
vernos[1] = vne::NumVal
vne = vns[2]
vernos[2] = vne::NumVal
vne = vns[3]
vernos[3] = vne::NumVal
var asmver as Version = new Version(vernos[0], vernos[1], vernos[2], vernos[3])
var asmnm as AssemblyName = AsmFactory::AsmNameStr
asmnm::set_Version(asmver)
AsmFactory::AsmNameStr = asmnm
var cad as AppDomain = AppDomain::get_CurrentDomain()
var aasv as AssemblyBuilderAccess = 2
var curd as string = Directory::GetCurrentDirectory()
AsmFactory::AsmB = cad::DefineDynamicAssembly(asmnm, aasv, curd)
var asmnme as string = asmnm::get_Name()
asmnme = String::Concat(asmnme, ".", AsmFactory::AsmMode)
var ab as AssemblyBuilder = AsmFactory::AsmB

AsmFactory::MdlB = ab::DefineDynamicModule(asmnme, asmnme, AsmFactory::DebugFlg)

if AsmFactory::DebugFlg = true then
var mdlbldbg as ModuleBuilder = AsmFactory::MdlB
fpath = Path::GetFullPath(fpath)
Console::WriteLine(fpath)
AsmFactory::DocWriter = mdlbldbg::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
end if

// --------------------------------------------------------------------------------------------------------
if AsmFactory::DebugFlg = true then
var dtyp as System.Type = gettype DebuggableAttribute
var debugattr as DebuggableAttribute.DebuggingModes = 1 or 256
var oattr as object = $object$debugattr
var dattyp as System.Type = gettype DebuggableAttribute.DebuggingModes
var tarr as System.Type[] = newarr System.Type 1
tarr[0] = dattyp
var dctor as ConstructorInfo = dtyp::GetConstructor(tarr)
var oarr as object[] = newarr object 1
oarr[0] = oattr
var dbuilder as CustomAttributeBuilder = new CustomAttributeBuilder(dctor, oarr)
ab::SetCustomAttribute(dbuilder)
end if
// --------------------------------------------------------------------------------------------------------

AsmFactory::AsmFile = asmnme
Importer::AddAsm(AsmFactory::AsmB)
goto fin
end if

typ = gettype DebugStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var dbgs as DebugStmt = stm
AsmFactory::DebugFlg = dbgs::Flg
goto fin
end if

typ = gettype ClassStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var clss as ClassStmt = stm

if AsmFactory::inClass = true then
AsmFactory::isNested = true
end if

if AsmFactory::isNested = false then
AsmFactory::inClass = true
end if

var attrs as Attributes.Attribute[] = clss::Attrs
var ta as TypeAttributes = Helpers::ProcessClassAttrs(attrs)
var clssnam as Ident = clss::ClassName
var clsnamstr as string = clssnam::Value
var inhclstok as TypeTok = clss::InhClass
var inhtyp as System.Type = null
var reft as System.Type  = inhclstok::RefTyp
var cmp as integer = String::Compare(inhclstok::Value, "")

if reft = null then
if cmp = 0 then
inhtyp = gettype object
else
inhtyp = Helpers::CommitEvalTTok(inhclstok)
end if
else
inhtyp = reft 
end if


if AsmFactory::isNested = false then
var mdlbld as ModuleBuilder = AsmFactory::MdlB
AsmFactory::CurnTypName = clsnamstr
clsnamstr = String::Concat(AsmFactory::CurnNS, ".", clsnamstr)
AsmFactory::CurnTypB = mdlbld::DefineType(clsnamstr, ta, inhtyp)

Console::Write("Adding Class: ")
Console::WriteLine(clsnamstr)
else
AsmFactory::CurnTypB2 = AsmFactory::CurnTypB
var ctb2 as TypeBuilder = AsmFactory::CurnTypB2
Console::Write("Adding Nested Class: ")
Console::WriteLine(clsnamstr)
AsmFactory::CurnTypName = clsnamstr
AsmFactory::CurnTypB = ctb2::DefineNestedType(clsnamstr, ta, inhtyp)
end if

goto fin
end if

typ = gettype FieldStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var flss as FieldStmt = stm

var fattrs as Attributes.Attribute[] = flss::Attrs
var fa as FieldAttributes = Helpers::ProcessFieldAttrs(fattrs)
var flssnam as Ident = flss::FieldName
var flsnamstr as string = flssnam::Value
var ftyptok as TypeTok = flss::FieldTyp
var ftyp as System.Type = null
//var reft3 as System.Type  = ftyptok::RefTyp

//if reft3 = null then
//Loader::MakeArr = ftyptok::IsArray
//Loader::MakeRef = ftyptok::IsByRef
//ftyp = Loader::LoadClass(ftyptok::Value)
//else
//Loader::MakeArr = ftyptok::IsArray
//Loader::MakeRef = ftyptok::IsByRef
//ftyp = Loader::ProcessType(reft3) 
//end if

ftyp = Helpers::CommitEvalTTok(ftyptok)

var typb2 as TypeBuilder = AsmFactory::CurnTypB
AsmFactory::CurnFldB = typb2::DefineField(flsnamstr, ftyp, fa)

if AsmFactory::isNested = false then
SymTable::AddFld(flsnamstr, ftyp, AsmFactory::CurnFldB)
else
SymTable::AddNestedFld(flsnamstr, ftyp, AsmFactory::CurnFldB)
end if

Console::Write("Adding Field: ")
Console::WriteLine(flsnamstr)

goto fin
end if


typ = gettype EndClassStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
AsmFactory::CreateTyp()
if AsmFactory::isNested = false then
AsmFactory::inClass = false
SymTable::ResetMet()
SymTable::ResetCtor()
SymTable::ResetFld()
end if
if AsmFactory::isNested = true then
AsmFactory::CurnTypB = AsmFactory::CurnTypB2
AsmFactory::isNested = false
SymTable::ResetNestedMet()
SymTable::ResetNestedCtor()
SymTable::ResetNestedFld()
end if
goto fin
end if

typ = gettype MethodStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var mtss as MethodStmt = stm

ILEmitter::StaticFlg = false

SymTable::ResetVar()
SymTable::ResetIf()

var mattrs as Attributes.Attribute[] = mtss::Attrs
var ma as MethodAttributes = Helpers::ProcessMethodAttrs(mattrs)
var mtssnam as Ident = mtss::MethodName
var mtssnamstr as string = mtssnam::Value
var paramarr as Expr[] = mtss::Params
var paramlen as integer = paramarr[l]
var rettyptok as TypeTok = mtss::RetTyp
var rettyp as System.Type = null
//reft  = rettyptok::RefTyp
//cmp = String::Compare(rettyptok::Value, "")

//if reft = null then
//if cmp = 0 then
//else
//Loader::MakeArr = rettyptok::IsArray
//Loader::MakeRef = rettyptok::IsByRef
//rettyp = Loader::LoadClass(rettyptok::Value)
//end if
//else
//Loader::MakeArr = rettyptok::IsArray
//Loader::MakeRef = rettyptok::IsByRef
//rettyp = Loader::ProcessType(reft) 
//end if

rettyp = Helpers::CommitEvalTTok(rettyptok)

AsmFactory::TypArr = newarr System.Type 0

if paramlen = 0 then
else
Helpers::ProcessParams(paramarr)
end if


var typb as TypeBuilder = AsmFactory::CurnTypB
var isconstr as boolean = ParseUtils::LikeOP(mtssnamstr, "^ctor(.)*$")
if isconstr = false then
AsmFactory::CurnMetB = typb::DefineMethod(mtssnamstr, ma, rettyp, AsmFactory::TypArr)
AsmFactory::InitMtd()
Console::Write("Adding Method: ")
Console::WriteLine(mtssnamstr)

if AsmFactory::isNested = false then
SymTable::AddMet(mtssnamstr, rettyp, AsmFactory::TypArr, AsmFactory::CurnMetB)
else
SymTable::AddNestedMet(mtssnamstr, rettyp, AsmFactory::TypArr, AsmFactory::CurnMetB)
end if

else
var stdcallconv as CallingConventions = 1
AsmFactory::CurnConB = typb::DefineConstructor(ma, stdcallconv, AsmFactory::TypArr)
AsmFactory::InitConstr()

if AsmFactory::isNested = false then
SymTable::AddCtor(AsmFactory::TypArr, AsmFactory::CurnConB)
else
SymTable::AddNestedCtor(AsmFactory::TypArr, AsmFactory::CurnConB)
end if


Console::Write("Adding Constructor: ")
Console::WriteLine(mtssnamstr)
end if


AsmFactory::InMethodFlg = true
AsmFactory::CurnMetName = mtssnamstr

if paramlen = 0 then
else
if isconstr = false then
Helpers::PostProcessParams(paramarr)
else
Helpers::PostProcessParamsConstr(paramarr)
end if
end if

goto fin
end if

typ = gettype EndMethodStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
ILEmitter::EmitRet()
AsmFactory::InMethodFlg = false
ab = AsmFactory::AsmB
var mnamcomp as integer = String::Compare(AsmFactory::CurnMetName,"main")
var amodecomp as integer = String::Compare(AsmFactory::AsmMode,"exe")
if mnamcomp = 0 then
if amodecomp  = 0 then
ab::SetEntryPoint(ILEmitter::Met)
end if
end if
goto fin
end if

var vnam as Ident
var vtyptok as TypeTok
var vtyp as System.Type = null
var eval as Evaluator = null
//var vreft as System.Type

typ = gettype VarStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var curv as VarStmt = stm
vnam = curv::VarName

vtyptok = curv::VarTyp
//vreft = vtyptok::RefTyp

//if vreft = null then
//Loader::MakeArr = vtyptok::IsArray
//Loader::MakeRef = vtyptok::IsByRef
//vtyp = Loader::LoadClass(vtyptok::Value)
//else
//Loader::MakeArr = vtyptok::IsArray
//Loader::MakeRef = vtyptok::IsByRef
//vtyp = Loader::ProcessType(vreft) 
//end if

vtyp = Helpers::CommitEvalTTok(vtyptok)

ILEmitter::DeclVar(vnam::Value, vtyp)
ILEmitter::LocInd = ILEmitter::LocInd + 1
SymTable::AddVar(vnam::Value, true, ILEmitter::LocInd, vtyp)

goto fin
end if

typ = gettype VarAsgnStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var curva as VarAsgnStmt = stm
vnam = curva::VarName

vtyptok = curva::VarTyp
//vreft = vtyptok::RefTyp

//if vreft = null then
//Loader::MakeArr = vtyptok::IsArray
//Loader::MakeRef = vtyptok::IsByRef
//vtyp = Loader::LoadClass(vtyptok::Value)
//else
//Loader::MakeArr = vtyptok::IsArray
//Loader::MakeRef = vtyptok::IsByRef
//vtyp = Loader::ProcessType(vreft) 
//end if

vtyp = Helpers::CommitEvalTTok(vtyptok)

ILEmitter::DeclVar(vnam::Value, vtyp)
ILEmitter::LocInd = ILEmitter::LocInd + 1
SymTable::AddVar(vnam::Value, true, ILEmitter::LocInd, vtyp)
eval = new Evaluator()
eval::Evaluate(curva::RExpr)
eval::StoreEmit(vnam)

goto fin
end if

typ = gettype AssignStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var asgnstm as AssignStmt = stm
eval = new Evaluator()
eval::Evaluate(asgnstm::RExp)
var asgnstmle as Expr = asgnstm::LExp
vnam = asgnstmle::Tokens[0]
eval::StoreEmit(vnam)
goto fin
end if

typ = gettype MethodCallStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var mcstmt as MethodCallStmt = stm
var mcstmtexp as Expr = new Expr()
var mcstmttok as MethodCallTok = mcstmt::MethodToken
mcstmttok::PopFlg = true
mcstmtexp::AddToken(mcstmttok)
eval = new Evaluator()
eval::Evaluate(mcstmtexp)
goto fin
end if

var ifendl as Emit.Label
var ifnbl as Emit.Label

typ = gettype IfStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
var ifstm as IfStmt = stm
SymTable::AddIf()
var ifexp as Expr = ifstm::Exp
eval = new Evaluator()
eval::Evaluate(ifexp)

ifnbl = SymTable::ReadIfNxtBlkLbl()
ILEmitter::EmitBrfalse(ifnbl)

goto fin
end if

typ = gettype ElseIfStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then

ifendl = SymTable::ReadIfEndLbl()
ILEmitter::EmitBr(ifendl)
ifnbl = SymTable::ReadIfNxtBlkLbl()
ILEmitter::MarkLbl(ifnbl)
SymTable::SetIfNxtBlkLbl()

var elifstm as ElseIfStmt = stm
var elifexp as Expr = elifstm::Exp
eval = new Evaluator()
eval::Evaluate(elifexp)

ifnbl = SymTable::ReadIfNxtBlkLbl()
ILEmitter::EmitBrfalse(ifnbl)

goto fin
end if

typ = gettype ElseStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then
ifendl = SymTable::ReadIfEndLbl()
ILEmitter::EmitBr(ifendl)
ifnbl = SymTable::ReadIfNxtBlkLbl()
ILEmitter::MarkLbl(ifnbl)
SymTable::SetIfElsePass()
goto fin
end if

typ = gettype EndIfStmt
b = typ::IsInstanceOfType($object$stm)

if b = true then

b = SymTable::ReadIfElsePass()

if b = false then
ifnbl = SymTable::ReadIfNxtBlkLbl()
ILEmitter::MarkLbl(ifnbl)
end if

ifendl = SymTable::ReadIfEndLbl()
ILEmitter::MarkLbl(ifendl)
SymTable::PopIf()
goto fin
end if


place fin

end method

end class
