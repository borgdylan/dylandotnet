//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi TokenOptimizer

method public Token Optimize(var tok as Token)

var comp as integer = 0
var compb as boolean = false
var tmpstr as string = ""
var tmpchrarr as char[] = newarr char 0
var orflg as boolean = false

label fin

comp = String::Compare(tok::Value, "+")

if comp = 0 then
var aop as AddOp = new AddOp()
aop::Line = tok::Line
aop::Value = tok::Value
tok = aop
goto fin
end if

comp = String::Compare(tok::Value, "*")

if comp = 0 then
var mop as MulOp = new MulOp()
mop::Line = tok::Line
mop::Value = tok::Value
tok = mop
goto fin
end if

comp = String::Compare(tok::Value, "-")

if comp = 0 then
var sop as SubOp = new SubOp()
sop::Line = tok::Line
sop::Value = tok::Value
tok = sop
goto fin
end if

comp = String::Compare(tok::Value, "/")

if comp = 0 then
var dop as DivOp = new DivOp()
dop::Line = tok::Line
dop::Value = tok::Value
tok = dop
goto fin
end if

comp = String::Compare(tok::Value, "++")

if comp = 0 then
var inop as IncOp = new IncOp()
inop::Line = tok::Line
inop::Value = tok::Value
tok = inop
goto fin
end if

comp = String::Compare(tok::Value, "--")

if comp = 0 then
var deop as DecOp = new DecOp()
deop::Line = tok::Line
deop::Value = tok::Value
tok = deop
goto fin
end if

comp = String::Compare(tok::Value, "<<")

if comp = 0 then
var shilop as ShlOp = new ShlOp()
shilop::Line = tok::Line
shilop::Value = tok::Value
tok = shilop
goto fin
end if

comp = String::Compare(tok::Value, ">>")

if comp = 0 then
var shirop as ShrOp = new ShrOp()
shirop::Line = tok::Line
shirop::Value = tok::Value
tok = shirop
goto fin
end if


comp = String::Compare(tok::Value, "=")

if comp = 0 then
if ParserFlags::IfFlag = true then
var eqop2 as EqOp = new EqOp()
eqop2::Line = tok::Line
eqop2::Value = tok::Value
tok = eqop2
else
var assop as AssignOp = new AssignOp()
assop::Line = tok::Line
assop::Value = tok::Value
tok = assop
end if
goto fin
end if

comp = String::Compare(tok::Value, "%")

if comp = 0 then
var moop as ModOp = new ModOp()
moop::Line = tok::Line
moop::Value = tok::Value
tok = moop
goto fin
end if

comp = String::Compare(tok::Value, "==")

if comp = 0 then
var eqop as EqOp = new EqOp()
eqop::Line = tok::Line
eqop::Value = tok::Value
tok = eqop
goto fin
end if

comp = String::Compare(tok::Value, "like")

if comp = 0 then
var lkeop as LikeOp = new LikeOp()
lkeop::Line = tok::Line
lkeop::Value = tok::Value
tok = lkeop
goto fin
end if

comp = String::Compare(tok::Value, "!")

if comp = 0 then
var negop as NegOp = new NegOp()
negop::Line = tok::Line
negop::Value = tok::Value
tok = negop
goto fin
end if

comp = String::Compare(tok::Value, "~")

if comp = 0 then
var notop as NotOp = new NotOp()
notop::Line = tok::Line
notop::Value = tok::Value
tok = notop
goto fin
end if


comp = String::Compare(tok::Value, "!=")

if comp = 0 then
var neqop as NeqOp = new NeqOp()
neqop::Line = tok::Line
neqop::Value = tok::Value
tok = neqop
goto fin
end if

comp = String::Compare(tok::Value, "notlike")

if comp = 0 then
var nlkeop as NLikeOp = new NLikeOp()
nlkeop::Line = tok::Line
nlkeop::Value = tok::Value
tok = nlkeop
goto fin
end if

comp = String::Compare(tok::Value, "<>")

if comp = 0 then
var neqop2 as NeqOp = new NeqOp()
neqop2::Line = tok::Line
neqop2::Value = tok::Value
tok = neqop2
goto fin
end if


comp = String::Compare(tok::Value, ">=")

if comp = 0 then
var geop as GeOp = new GeOp()
geop::Line = tok::Line
geop::Value = tok::Value
tok = geop
goto fin
end if

comp = String::Compare(tok::Value, "<=")

if comp = 0 then
var leop as LeOp = new LeOp()
leop::Line = tok::Line
leop::Value = tok::Value
tok = leop
goto fin
end if

comp = String::Compare(tok::Value, ">")

if comp = 0 then
var gtop as GtOp = new GtOp()
gtop::Line = tok::Line
gtop::Value = tok::Value
tok = gtop
goto fin
end if

comp = String::Compare(tok::Value, "<")

if comp = 0 then
var ltop as LtOp = new LtOp()
ltop::Line = tok::Line
ltop::Value = tok::Value
tok = ltop
goto fin
end if

comp = String::Compare(tok::Value, "and")

if comp = 0 then
var andop as AndOp = new AndOp()
andop::Line = tok::Line
andop::Value = tok::Value
tok = andop
goto fin
end if

comp = String::Compare(tok::Value, "or")

if comp = 0 then
var orop as OrOp = new OrOp()
orop::Line = tok::Line
orop::Value = tok::Value
tok = orop
goto fin
end if

comp = String::Compare(tok::Value, "nand")

if comp = 0 then
var nandop as NandOp = new NandOp()
nandop::Line = tok::Line
nandop::Value = tok::Value
tok = nandop
goto fin
end if

comp = String::Compare(tok::Value, "nor")

if comp = 0 then
var norop as NorOp = new NorOp()
norop::Line = tok::Line
norop::Value = tok::Value
tok = norop
goto fin
end if


comp = String::Compare(tok::Value, "xor")

if comp = 0 then
var xorop as XorOp = new XorOp()
xorop::Line = tok::Line
xorop::Value = tok::Value
tok = xorop
goto fin
end if

comp = String::Compare(tok::Value, "xnor")

if comp = 0 then
var xnorop as XnorOp = new XnorOp()
xnorop::Line = tok::Line
xnorop::Value = tok::Value
tok = xnorop
goto fin
end if

comp = String::Compare(tok::Value, "(")

if comp = 0 then
var lpar as LParen = new LParen()
lpar::Line = tok::Line
lpar::Value = tok::Value
tok = lpar
goto fin
end if

comp = String::Compare(tok::Value, ")")

if comp = 0 then
var rpar as RParen = new RParen()
rpar::Line = tok::Line
rpar::Value = tok::Value
tok = rpar
goto fin
end if

comp = String::Compare(tok::Value, "[]")

if comp = 0 then
var lrspar as LRSParen = new LRSParen()
lrspar::Line = tok::Line
lrspar::Value = tok::Value
tok = lrspar
goto fin
end if

comp = String::Compare(tok::Value, "&")

if comp = 0 then
var ampsig as Ampersand = new Ampersand()
ampsig::Line = tok::Line
ampsig::Value = tok::Value
tok = ampsig
goto fin
end if

comp = String::Compare(tok::Value, "[")

if comp = 0 then
var lspar as LSParen = new LSParen()
lspar::Line = tok::Line
lspar::Value = tok::Value
tok = lspar
goto fin
end if

comp = String::Compare(tok::Value, "]")

if comp = 0 then
var rspar as RSParen = new RSParen()
rspar::Line = tok::Line
rspar::Value = tok::Value
tok = rspar
goto fin
end if

comp = String::Compare(tok::Value, "|")

if comp = 0 then
var pip as Pipe = new Pipe()
pip::Line = tok::Line
pip::Value = tok::Value
tok = pip
goto fin
end if

comp = String::Compare(tok::Value, ",")

if comp = 0 then
var com as Comma = new Comma()
com::Line = tok::Line
com::Value = tok::Value
tok = com
goto fin
end if

comp = String::Compare(tok::Value, "$")

if comp = 0 then
var ds as DollarSign = new DollarSign()
ds::Line = tok::Line
ds::Value = tok::Value
tok = ds
goto fin
end if

comp = String::Compare(tok::Value, "label")

if comp = 0 then
var lbltk as LabelTok = new LabelTok()
lbltk::Line = tok::Line
lbltk::Value = tok::Value
tok = lbltk
goto fin
end if

comp = String::Compare(tok::Value, "place")

if comp = 0 then
var plctk as PlaceTok = new PlaceTok()
plctk::Line = tok::Line
plctk::Value = tok::Value
tok = plctk
goto fin
end if

comp = String::Compare(tok::Value, "goto")

if comp = 0 then
var gtotk as GotoTok = new GotoTok()
gtotk::Line = tok::Line
gtotk::Value = tok::Value
tok = gtotk
goto fin
end if

comp = String::Compare(tok::Value, "if")

if comp = 0 then
var iftk as IfTok = new IfTok()
iftk::Line = tok::Line
iftk::Value = tok::Value
tok = iftk
ParserFlags::IfFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "elseif")

if comp = 0 then
var eliftk as ElseIfTok = new ElseIfTok()
eliftk::Line = tok::Line
eliftk::Value = tok::Value
tok = eliftk
ParserFlags::IfFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "else")

if comp = 0 then
var elsetk as ElseTok = new ElseTok()
elsetk::Line = tok::Line
elsetk::Value = tok::Value
tok = elsetk
goto fin
end if

comp = String::Compare(tok::Value, "then")

if comp = 0 then
var thentk as ThenTok = new ThenTok()
thentk::Line = tok::Line
thentk::Value = tok::Value
tok = thentk
ParserFlags::IfFlag = false
goto fin
end if

comp = String::Compare(tok::Value, "new")

if comp = 0 then
var newtk as NewTok = new NewTok()
newtk::Line = tok::Line
newtk::Value = tok::Value
tok = newtk
goto fin
end if

comp = String::Compare(tok::Value, "newarr")

if comp = 0 then
var newatk as NewarrTok = new NewarrTok()
newatk::Line = tok::Line
newatk::Value = tok::Value
tok = newatk
goto fin
end if

comp = String::Compare(tok::Value, "me")

if comp = 0 then
var metk as MeTok = new MeTok()
metk::Line = tok::Line
metk::Value = tok::Value
tok = metk
goto fin
end if

comp = String::Compare(tok::Value, "namespace")

if comp = 0 then
var nstk as NamespaceTok = new NamespaceTok()
nstk::Line = tok::Line
nstk::Value = tok::Value
tok = nstk
goto fin
end if

comp = String::Compare(tok::Value, "ptr")

if comp = 0 then
var ptrtk as PtrTok = new PtrTok()
ptrtk::Line = tok::Line
ptrtk::Value = tok::Value
tok = ptrtk
goto fin
end if


comp = String::Compare(tok::Value, "gettype")

if comp = 0 then
var gttk as GettypeTok = new GettypeTok()
gttk::Line = tok::Line
gttk::Value = tok::Value
tok = gttk
goto fin
end if

comp = String::Compare(tok::Value, "#refasm")

if comp = 0 then
var ratk as RefasmTok = new RefasmTok()
ratk::Line = tok::Line
ratk::Value = tok::Value
tok = ratk
ParserFlags::NoOptFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "#refstdasm")

if comp = 0 then
var rsatk as RefstdasmTok = new RefstdasmTok()
rsatk::Line = tok::Line
rsatk::Value = tok::Value
tok = rsatk
ParserFlags::NoOptFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "#debug")

if comp = 0 then
var dgtk as DebugTok = new DebugTok()
dgtk::Line = tok::Line
dgtk::Value = tok::Value
tok = dgtk
goto fin
end if

comp = String::Compare(tok::Value, "#include")

if comp = 0 then
var inclutk as IncludeTok = new IncludeTok()
inclutk::Line = tok::Line
inclutk::Value = tok::Value
tok = inclutk
goto fin
end if

comp = String::Compare(tok::Value, "#scope")

if comp = 0 then
var scptk as ScopeTok = new ScopeTok()
scptk::Line = tok::Line
scptk::Value = tok::Value
tok = scptk
goto fin
end if

comp = String::Compare(tok::Value, "import")

if comp = 0 then
var imptk as ImportTok = new ImportTok()
imptk::Line = tok::Line
imptk::Value = tok::Value
tok = imptk
ParserFlags::NoOptFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "locimport")

if comp = 0 then
var limptk as LocimportTok = new LocimportTok()
limptk::Line = tok::Line
limptk::Value = tok::Value
tok = limptk
ParserFlags::NoOptFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "assembly")

if comp = 0 then
var asmtk as AssemblyTok = new AssemblyTok()
asmtk::Line = tok::Line
asmtk::Value = tok::Value
tok = asmtk
goto fin
end if

comp = String::Compare(tok::Value, "ver")

if comp = 0 then
var vertk as VerTok = new VerTok()
vertk::Line = tok::Line
vertk::Value = tok::Value
tok = vertk
ParserFlags::NoOptFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "on")

if comp = 0 then
var ontk as OnTok = new OnTok()
ontk::Line = tok::Line
ontk::Value = tok::Value
tok = ontk
goto fin
end if

comp = String::Compare(tok::Value, "off")

if comp = 0 then
var offtk as OffTok = new OffTok()
offtk::Line = tok::Line
offtk::Value = tok::Value
tok = offtk
goto fin
end if

comp = String::Compare(tok::Value, "exe")

if comp = 0 then
var extk as ExeTok = new ExeTok()
extk::Line = tok::Line
extk::Value = tok::Value
tok = extk
goto fin
end if

comp = String::Compare(tok::Value, "dll")

if comp = 0 then
var dltk as DllTok = new DllTok()
dltk::Line = tok::Line
dltk::Value = tok::Value
tok = dltk
goto fin
end if

comp = String::Compare(tok::Value, "field")

if comp = 0 then
var fltk as FieldTok = new FieldTok()
fltk::Line = tok::Line
fltk::Value = tok::Value
tok = fltk
goto fin
end if

comp = String::Compare(tok::Value, "class")

if comp = 0 then
var cltk as ClassTok = new ClassTok()
cltk::Line = tok::Line
cltk::Value = tok::Value
tok = cltk
goto fin
end if

comp = String::Compare(tok::Value, "delegate")

if comp = 0 then
var deltk as DelegateTok = new DelegateTok()
deltk::Line = tok::Line
deltk::Value = tok::Value
tok = deltk
goto fin
end if

comp = String::Compare(tok::Value, "extends")

if comp = 0 then
var exttk as ExtendsTok = new ExtendsTok()
exttk::Line = tok::Line
exttk::Value = tok::Value
tok = exttk
goto fin
end if

comp = String::Compare(tok::Value, "method")

if comp = 0 then
var mettk as MethodTok = new MethodTok()
mettk::Line = tok::Line
mettk::Value = tok::Value
tok = mettk
goto fin
end if

comp = String::Compare(tok::Value, "end")

if comp = 0 then
var entk as EndTok = new EndTok()
entk::Line = tok::Line
entk::Value = tok::Value
tok = entk
goto fin
end if

comp = String::Compare(tok::Value, "return")

if comp = 0 then
var rettk as ReturnTok = new ReturnTok()
rettk::Line = tok::Line
rettk::Value = tok::Value
tok = rettk
goto fin
end if

comp = String::Compare(tok::Value, "var")

if comp = 0 then
var vrtk as VarTok = new VarTok()
vrtk::Line = tok::Line
vrtk::Value = tok::Value
tok = vrtk
goto fin
end if

comp = String::Compare(tok::Value, "as")

if comp = 0 then
var astk as AsTok = new AsTok()
astk::Line = tok::Line
astk::Value = tok::Value
tok = astk
goto fin
end if

comp = String::Compare(tok::Value, "of")

if comp = 0 then
var oftk as OfTok = new OfTok()
oftk::Line = tok::Line
oftk::Value = tok::Value
tok = oftk
goto fin
end if

comp = String::Compare(tok::Value, "private")

if comp = 0 then
var privattr as PrivateAttr = new PrivateAttr()
privattr::Line = tok::Line
privattr::Value = tok::Value
tok = privattr
goto fin
end if

comp = String::Compare(tok::Value, "public")

if comp = 0 then
var pubattr as PublicAttr = new PublicAttr()
pubattr::Line = tok::Line
pubattr::Value = tok::Value
tok = pubattr
goto fin
end if

comp = String::Compare(tok::Value, "initonly")

if comp = 0 then
var initoattr as InitOnlyAttr = new InitOnlyAttr()
initoattr::Line = tok::Line
initoattr::Value = tok::Value
tok = initoattr
goto fin
end if

comp = String::Compare(tok::Value, "static")

if comp = 0 then
var statattr as StaticAttr = new StaticAttr()
statattr::Line = tok::Line
statattr::Value = tok::Value
tok = statattr
goto fin
end if

comp = String::Compare(tok::Value, "specialname")

if comp = 0 then
var spnattr as SpecialNameAttr = new SpecialNameAttr()
spnattr::Line = tok::Line
spnattr::Value = tok::Value
tok = spnattr
goto fin
end if

comp = String::Compare(tok::Value, "hidebysig")

if comp = 0 then
var hbsattr as HideBySigAttr = new HideBySigAttr()
hbsattr::Line = tok::Line
hbsattr::Value = tok::Value
tok = hbsattr
goto fin
end if


comp = String::Compare(tok::Value, "virtual")

if comp = 0 then
var virtattr as VirtualAttr = new VirtualAttr()
virtattr::Line = tok::Line
virtattr::Value = tok::Value
tok = virtattr
goto fin
end if

comp = String::Compare(tok::Value, "auto")

if comp = 0 then
var autattr as AutoLayoutAttr = new AutoLayoutAttr()
autattr::Line = tok::Line
autattr::Value = tok::Value
tok = autattr
goto fin
end if

comp = String::Compare(tok::Value, "autochar")

if comp = 0 then
var autcattr as AutoClassAttr = new AutoClassAttr()
autcattr::Line = tok::Line
autcattr::Value = tok::Value
tok = autcattr
goto fin
end if

comp = String::Compare(tok::Value, "ansi")

if comp = 0 then
var ansattr as AnsiClassAttr = new AnsiClassAttr()
ansattr::Line = tok::Line
ansattr::Value = tok::Value
tok = ansattr
goto fin
end if

comp = String::Compare(tok::Value, "beforefieldinit")

if comp = 0 then
var bfiattr as BeforeFieldInitAttr = new BeforeFieldInitAttr()
bfiattr::Line = tok::Line
bfiattr::Value = tok::Value
tok = bfiattr
goto fin
end if

comp = String::Compare(tok::Value, "string")

if comp = 0 then
var strtok as StringTok = new StringTok()
strtok::Line = tok::Line
strtok::Value = tok::Value
strtok::RefTyp = gettype string
tok = strtok
goto fin
end if

comp = String::Compare(tok::Value, "void")

if comp = 0 then
var voidtok as VoidTok = new VoidTok()
voidtok::Line = tok::Line
voidtok::Value = tok::Value
voidtok::RefTyp = gettype void
tok = voidtok
goto fin
end if

comp = String::Compare(tok::Value, "decimal")

if comp = 0 then
var decitok as DecimalTok = new DecimalTok()
decitok::Line = tok::Line
decitok::Value = tok::Value
decitok::RefTyp = gettype decimal
tok = decitok
goto fin
end if

comp = String::Compare(tok::Value, "integer")

if comp = 0 then
var inttok as IntegerTok = new IntegerTok()
inttok::Line = tok::Line
inttok::Value = tok::Value
inttok::RefTyp = gettype integer
tok = inttok
goto fin
end if

comp = String::Compare(tok::Value, "intptr")

if comp = 0 then
var intptok as IntPtrTok = new IntPtrTok()
intptok::Line = tok::Line
intptok::Value = tok::Value
intptok::RefTyp = gettype IntPtr
tok = intptok
goto fin
end if

comp = String::Compare(tok::Value, "uinteger")

if comp = 0 then
var uinttok as UIntegerTok = new UIntegerTok()
uinttok::Line = tok::Line
uinttok::Value = tok::Value
uinttok::RefTyp = gettype UInt32
tok = uinttok
goto fin
end if


comp = String::Compare(tok::Value, "double")

if comp = 0 then
var dbltok as DoubleTok = new DoubleTok()
dbltok::Line = tok::Line
dbltok::Value = tok::Value
dbltok::RefTyp = gettype double
tok = dbltok
goto fin
end if

comp = String::Compare(tok::Value, "boolean")

if comp = 0 then
var booltok as BooleanTok = new BooleanTok()
booltok::Line = tok::Line
booltok::Value = tok::Value
booltok::RefTyp = gettype boolean
tok = booltok
goto fin
end if

comp = String::Compare(tok::Value, "char")

if comp = 0 then
var chrtok as CharTok = new CharTok()
chrtok::Line = tok::Line
chrtok::Value = tok::Value
chrtok::RefTyp = gettype char
tok = chrtok
goto fin
end if

comp = String::Compare(tok::Value, "single")

if comp = 0 then
var sngtok as SingleTok = new SingleTok()
sngtok::Line = tok::Line
sngtok::Value = tok::Value
sngtok::RefTyp = gettype single
tok = sngtok
goto fin
end if


comp = String::Compare(tok::Value, "sbyte")

if comp = 0 then
var sbytok as SByteTok = new SByteTok()
sbytok::Line = tok::Line
sbytok::Value = tok::Value
sbytok::RefTyp = gettype sbyte
tok = sbytok
goto fin
end if

comp = String::Compare(tok::Value, "byte")

if comp = 0 then
var byttok as ByteTok = new ByteTok()
byttok::Line = tok::Line
byttok::Value = tok::Value
byttok::RefTyp = gettype System.Byte
tok = byttok
goto fin
end if

comp = String::Compare(tok::Value, "short")

if comp = 0 then
var shtok as ShortTok = new ShortTok()
shtok::Line = tok::Line
shtok::Value = tok::Value
shtok::RefTyp = gettype short
tok = shtok
goto fin
end if

comp = String::Compare(tok::Value, "ushort")

if comp = 0 then
var ushtok as UShortTok = new UShortTok()
ushtok::Line = tok::Line
ushtok::Value = tok::Value
ushtok::RefTyp = gettype UInt16
tok = ushtok
goto fin
end if

comp = String::Compare(tok::Value, "long")

if comp = 0 then
var lngtok as LongTok = new LongTok()
lngtok::Line = tok::Line
lngtok::Value = tok::Value
lngtok::RefTyp = gettype long
tok = lngtok
goto fin
end if

comp = String::Compare(tok::Value, "ulong")

if comp = 0 then
var ulngtok as ULongTok = new ULongTok()
ulngtok::Line = tok::Line
ulngtok::Value = tok::Value
ulngtok::RefTyp = gettype UInt64
tok = ulngtok
goto fin
end if


comp = String::Compare(tok::Value, "object")

if comp = 0 then
var objtok as ObjectTok = new ObjectTok()
objtok::Line = tok::Line
objtok::Value = tok::Value
objtok::RefTyp = gettype object
tok = objtok
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^//(.)*$")

if compb = true then
var comtok as commentTok = new commentTok()
comtok::Line = tok::Line
comtok::Value = tok::Value
tok = comtok
ParserFlags::CmtFlag = true
goto fin
end if

comp = String::Compare(tok::Value, "null")

if comp = 0 then
var nulllit as NullLiteral = new NullLiteral()
nulllit::Line = tok::Line
nulllit::Value = tok::Value
tok = nulllit
goto fin
end if

comp = String::Compare(tok::Value, "true")
if comp = 0 then
compb = true
end if
orflg = compb
comp = String::Compare(tok::Value, "false")
if comp = 0 then
compb = true
end if
orflg = orflg or compb

if compb = true then
var boolit as BooleanLiteral = new BooleanLiteral()
boolit::Line = tok::Line
boolit::Value = tok::Value
comp = String::Compare(tok::Value, "true")
if comp = 0 then
boolit::BoolVal = true
end if
comp = String::Compare(tok::Value, "false")
if comp = 0 then
boolit::BoolVal = false
end if
tok = boolit
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^'(.)*'$")

if compb = true then
var chrlit as CharLiteral = new CharLiteral()
chrlit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = $char$"'"
tmpstr = tmpstr::Trim(tmpchrarr)
chrlit::Value = tmpstr
chrlit::CharVal = $char$chrlit::Value
tok = chrlit
goto fin
end if


tmpstr = String::Concat("^",Utils.Constants::quot,"(.)*")
tmpstr = String::Concat(tmpstr, Utils.Constants::quot,"$")
compb = Utils.ParseUtils::LikeOP(tok::Value, tmpstr)

if compb = true then
var strlit as StringLiteral = new StringLiteral()
strlit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = $char$Utils.Constants::quot
tmpstr = tmpstr::Trim(tmpchrarr)
strlit::Value = tmpstr
tok = strlit
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+\.(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+\.(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+\.(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("d")
orflg = orflg and compb

if orflg = true then
var dlit2 as DoubleLiteral = new DoubleLiteral()
dlit2::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'd'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
dlit2::Value = tmpstr
dlit2::NumVal = $double$dlit2::Value
tok = dlit2
goto fin
end if


compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+\.(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+\.(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+\.(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("f")
orflg = orflg and compb

if orflg = true then
var flit as FloatLiteral = new FloatLiteral()
flit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'f'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
flit::Value = tmpstr
flit::NumVal = $single$flit::Value
tok = flit
goto fin
end if


compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+\.(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+\.(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+\.(\d)+(.)*$")
orflg = orflg or compb

if orflg = true then
var dlit as DoubleLiteral = new DoubleLiteral()
dlit::Line = tok::Line
tmpstr = tok::Value
//tmpchrarr = newarr char 1
//tmpchrarr[0] = $char$"'"
//tmpstr = tmpstr::Trim(tmpchrarr)
dlit::Value = tmpstr
dlit::NumVal = $double$dlit::Value
tok = dlit
goto fin
end if


compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("d")
orflg = orflg and compb

if orflg = true then
var dlit3 as DoubleLiteral = new DoubleLiteral()
dlit3::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'd'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
dlit3::Value = tmpstr
dlit3::NumVal = $double$dlit3::Value
tok = dlit3
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("f")
orflg = orflg and compb

if orflg = true then
var flit2 as FloatLiteral = new FloatLiteral()
flit2::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'f'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
flit2::Value = tmpstr
flit2::NumVal = $single$flit2::Value
tok = flit2
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("ui")
orflg = orflg and compb

if orflg = true then
var uilit2 as UIntLiteral = new UIntLiteral()
uilit2::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'i'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
tmpchrarr[0] = 'u'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
uilit2::Value = tmpstr
uilit2::NumVal = Convert::ToUInt32(uilit2::Value)
tok = uilit2
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("ip")
orflg = orflg and compb

if orflg = true then
var iplit2 as IntPtrLiteral = new IntPtrLiteral()
iplit2::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'p'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
tmpchrarr[0] = 'i'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
iplit2::Value = tmpstr
iplit2::NumVal = new IntPtr($integer$iplit2::Value)
tok = iplit2
goto fin
end if


compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("i")
orflg = orflg and compb

if orflg = true then
var ilit2 as IntLiteral = new IntLiteral()
ilit2::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'i'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
ilit2::Value = tmpstr
ilit2::NumVal = $integer$ilit2::Value
tok = ilit2
goto fin
end if


compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("ul")
orflg = orflg and compb

if orflg = true then
var ullit as ULongLiteral = new ULongLiteral()
ullit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'l'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
tmpchrarr[0] = 'u'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
ullit::Value = tmpstr
ullit::NumVal = Convert::ToUInt64(ullit::Value)
tok = ullit
goto fin
end if


compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("l")
orflg = orflg and compb

if orflg = true then
var llit as LongLiteral = new LongLiteral()
llit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'l'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
llit::Value = tmpstr
llit::NumVal = $long$llit::Value
tok = llit
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("us")
orflg = orflg and compb

if orflg = true then
var uslit as UShortLiteral = new UShortLiteral()
uslit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 's'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
tmpchrarr[0] = 'u'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
uslit::Value = tmpstr
uslit::NumVal = Convert::ToUInt16(uslit::Value)
tok = uslit
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("s")
orflg = orflg and compb

if orflg = true then
var slit as ShortLiteral = new ShortLiteral()
slit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 's'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
slit::Value = tmpstr
slit::NumVal = $short$slit::Value
tok = slit
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("ub")
orflg = orflg and compb

if orflg = true then
var ublit as ByteLiteral = new ByteLiteral()
ublit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'b'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
tmpchrarr[0] = 'u'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
ublit::Value = tmpstr
ublit::NumVal = Convert::ToByte(ublit::Value)
tok = ublit
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb
tmpstr = tok::Value
compb = tmpstr::EndsWith("b")
orflg = orflg and compb

if orflg = true then
var blit as SByteLiteral = new SByteLiteral()
blit::Line = tok::Line
tmpstr = tok::Value
tmpchrarr = newarr char 1
tmpchrarr[0] = 'b'
tmpstr = tmpstr::TrimEnd(tmpchrarr)
blit::Value = tmpstr
blit::NumVal = $sbyte$blit::Value
tok = blit
goto fin
end if

compb = Utils.ParseUtils::LikeOP(tok::Value, "^(\d)+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^\+(\d)+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^-(\d)+(.)*$")
orflg = orflg or compb


if orflg = true then
var ilit as IntLiteral = new IntLiteral()
ilit::Line = tok::Line
tmpstr = tok::Value
//tmpchrarr = newarr char 1
//tmpchrarr[0] = $char$"'"
//tmpstr = tmpstr::Trim(tmpchrarr)
ilit::Value = tmpstr
ilit::NumVal = $integer$ilit::Value
tok = ilit
goto fin
end if


compb = Utils.ParseUtils::LikeOP(tok::Value, "^([a-zA-Z])+(.)*$")
orflg = compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^_(.)*([a-zA-Z])+(.)*$")
orflg = orflg or compb
compb = Utils.ParseUtils::LikeOP(tok::Value, "^::(.)*([a-zA-Z])+(.)*$")
orflg = orflg or compb

if orflg = true then
var idt as Ident = new Ident()
idt::Line = tok::Line
idt::Value = tok::Value
tok = idt
goto fin
end if


place fin
return tok

end method

end class
