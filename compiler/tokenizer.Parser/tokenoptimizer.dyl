//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import System.Globalization

import dylan.NET.Utils
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.Literals

import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Attributes
import dylan.NET.Tokenizer.AST.Tokens.Chars

class public sealed TokenOptimizer

    field public integer GenLvl
    field public integer CurlyLvl
    field public Flags PFlags
    field public boolean isFirstToken
    field public boolean isFirstRun
    field public boolean SpecialFlg

    field private static C5.HashDictionary<of string, Type> _opLookup
    field private static C5.HashDictionary<of string, Type> _charLookup
    field private static C5.HashDictionary<of string, Type> _keywLookup
    field private static C5.HashDictionary<of string, Type> _attrLookup
    field private static C5.HashDictionary<of string, Type> _typeLookup

    method private static void TokenOptimizer()
        _opLookup = new C5.HashDictionary<of string, Type>(C5.MemoryType::Normal) { _
            Add("+", gettype AddOp), Add("*", gettype MulOp), Add("-", gettype SubOp), Add("/", gettype DivOp), Add("%", gettype ModOp), _
            Add("++", gettype IncOp), Add("--", gettype DecOp), _
            Add("<<", gettype ShlOp), Add(">>", gettype ShrOp), _
            Add("(+)", gettype PlusOp), Add("(-)", gettype MinusOp), _
            Add("==", gettype EqOp), Add("===", gettype StrictEqOp), Add("!=", gettype NeqOp), Add("<>", gettype NeqOp), Add("!==", gettype StrictNeqOp), _
            Add(">=", gettype GeOp), Add("<=" , gettype LeOp), _
            Add("like", gettype LikeOp), Add("notlike", gettype NLikeOp), _
            Add("!", gettype NegOp), Add("~", gettype NotOp), _
            Add("is", gettype IsOp), Add("isnot", gettype IsNotOp), _
            Add("and", gettype AndOp), Add("nand", gettype NandOp), Add("or", gettype OrOp), Add("nor", gettype NorOp), _
            Add("andalso", gettype AndAlsoOp), Add("orelse", gettype OrElseOp), _
            Add("xor", gettype XorOp), Add("xnor", gettype XnorOp), _
            Add("??", gettype CoalesceOp) }

        _charLookup = new C5.HashDictionary<of string, Type>(C5.MemoryType::Normal) { _
            Add("(", gettype LParen), Add(")", gettype RParen), Add("[]", gettype LRSParen), Add("[", gettype LSParen), Add("]", gettype RSParen), _
            Add("&", gettype Ampersand), Add("|", gettype Pipe), Add(",", gettype Comma), Add("?", gettype QuestionMark), Add("$", gettype DollarSign), _
            Add("=>", gettype GoesToTok) }

         _keywLookup = new C5.HashDictionary<of string, Type>(C5.MemoryType::Normal) { _
            Add("try", gettype TryTok), Add("finally", gettype FinallyTok), _
            Add("switch", gettype SwitchTok2), Add("state", gettype StateTok), _
            Add("else", gettype ElseTok), Add("#else", gettype HElseTok), _
            Add("#ternary", gettype TernaryTok), Add("#expr", gettype ExprTok), Add("#nullcond", gettype NullCondTok), Add("#tuple", gettype TupleTok), _
            Add("#define", gettype HDefineTok), Add("#undef", gettype HUndefTok), _
            Add("do", gettype DoTok), _
            Add("upto", gettype UptoTok), Add("downto", gettype DowntoTok), Add("step", gettype StepTok), _
            Add("break", gettype BreakTok), Add("continue", gettype ContinueTok), _
            Add("new", gettype NewTok), Add("me", gettype MeTok), Add("namespace", gettype NamespaceTok), _
            Add("gettype", gettype GettypeTok), Add("default", gettype DefaultTok), _
            Add("ref", gettype RefTok), Add("valinref", gettype ValInRefTok), _
            Add("#debug", gettype DebugTok), Add("#include", gettype IncludeTok), _
            Add("#error", gettype ErrorTok), Add("#warning", gettype WarningTok), _
            Add("#sign", gettype SignTok), Add("#embed", gettype EmbedTok), _
            Add("#region", gettype RegionTok), _
            Add("assembly:", gettype AssemblyCTok), Add("field:", gettype FieldCTok), Add("property:", gettype PropertyCTok), Add("event:", gettype EventCTok), Add("method:", gettype MethodCTok), _
            Add("class:", gettype ClassCTok), Add("enum:", gettype EnumCTok), _
            Add("on", gettype OnTok), Add("off", gettype OffTok), _
            Add("exe", gettype ExeTok), Add("dll", gettype DllTok), Add("winexe", gettype WinexeTok), _
            Add("property", gettype PropertyTok), Add("event", gettype EventTok),  Add("method", gettype MethodTok), _
            Add("class", gettype ClassTok), Add("struct", gettype StructTok), Add("delegate", gettype DelegateTok), Add("enum", gettype EnumTok), _
            Add("extends", gettype ExtendsTok), Add("implements", gettype ImplementsTok), _
            Add("return", gettype ReturnTok), _
            Add("lock", gettype LockTok), Add("trylock", gettype TryLockTok), _
            Add("throw", gettype ThrowTok), Add("when", gettype WhenTok), Add("of", gettype OfTok), _
            Add("out", gettype OutTok), Add("inout", gettype InOutTok) }

        _attrLookup = new C5.HashDictionary<of string, Type>(C5.MemoryType::Normal) { _
            Add("private", gettype PrivateAttr), Add("public", gettype PublicAttr), Add("family", gettype FamilyAttr), Add("famorassem", gettype FamORAssemAttr), Add("famandassem", gettype FamANDAssemAttr), _
            Add("initonly", gettype InitOnlyAttr), _
            Add("static", gettype StaticAttr), Add("specialname", gettype SpecialNameAttr), Add("final", gettype FinalAttr), Add("hidebysig", gettype HideBySigAttr), Add("virtual", gettype VirtualAttr), _
            Add("override", gettype OverrideAttr), Add("prototype", gettype PrototypeAttr), Add("newslot", gettype NewSlotAttr), Add("autogen", gettype AutoGenAttr), Add("pinvokeimpl", gettype PinvokeImplAttr), _
            Add("none", gettype NoneAttr), Add("literal", gettype LiteralAttr), _
            Add("sealed", gettype SealedAttr), Add("abstract", gettype AbstractAttr), Add("partial", gettype PartialAttr), Add("auto", gettype AutoLayoutAttr), Add("ansi", gettype AnsiClassAttr), _
            Add("sequential", gettype SequentialLayoutAttr), Add("beforefieldinit", gettype BeforeFieldInitAttr), Add("serializable", gettype SerializableAttr), Add("notserialized", gettype NotSerializedAttr), _
            Add("autochar", gettype AutoClassAttr) }

        _typeLookup = new C5.HashDictionary<of string, Type>(C5.MemoryType::Normal) { _
            Add("string", gettype StringTok), Add("char", gettype CharTok), _
            Add("void", gettype VoidTok), Add("boolean", gettype BooleanTok), Add("object", gettype ObjectTok), _
            Add("decimal", gettype DecimalTok), _
            Add("integer", gettype IntegerTok), Add("intptr", gettype IntPtrTok), Add("uinteger", gettype UIntegerTok), Add("sbyte", gettype SByteTok), Add("byte", gettype ByteTok), Add("short", gettype ShortTok), Add("ushort", gettype UShortTok), Add("long", gettype LongTok), Add("ulong", gettype ULongTok), _
            Add("double", gettype DoubleTok), Add("single", gettype SingleTok) }

    end method

    method public void TokenOptimizer(var pf as Flags)
        mybase::ctor()
        //GenLvl = 0
        //CurlyLvl = 0
        PFlags = pf
        isFirstToken = true
        isFirstRun = true
        //SpecialFlg = false
    end method

    method public void TokenOptimizer()
        ctor(new Flags())
    end method

    method private static Token NewToken(var src as Token, var toktyp as Type)
        var tok as Token = $Token$Activator::CreateInstance(toktyp)
        tok::PosFromToken(src)
        tok::Value = src::Value
        return tok
    end method

    method public Token Optimize(var tok as Token, var lkahead as Token)
        if lkahead is null then
            lkahead = new Token()
        end if
        if !isFirstRun then
            if isFirstToken then
                isFirstToken = false
            end if
        end if
        isFirstRun = false

        if _opLookup::Contains(tok::Value) then
            return NewToken(tok, _opLookup::get_Item(tok::Value))
        elseif tok::Value == "=" then
            PFlags::AsFlag = false
            if CurlyLvl > 0 then
                return new AssignOp2() {PosFromToken(tok), Value = tok::Value}
            elseif PFlags::IfFlag then
                return new EqOp() {PosFromToken(tok), Value = tok::Value}
            elseif PFlags::ForFlag then
                return new AssignOp2() {PosFromToken(tok), Value = tok::Value}
            else
                return new AssignOp() {PosFromToken(tok), Value = tok::Value}
            end if
        elseif tok::Value == ">" then
            if GenLvl == 0 then
                return new GtOp() {PosFromToken(tok), Value = tok::Value}
            else
                GenLvl--
                return new RAParen() {PosFromToken(tok), Value = tok::Value}
            end if
        elseif tok::Value == "<" then
            if lkahead::Value == "of" then
                GenLvl++
                return new LAParen() {PosFromToken(tok), Value = tok::Value}
            else
                return new LtOp() {PosFromToken(tok), Value = tok::Value}
            end if
        elseif _charLookup::Contains(tok::Value) then
            return NewToken(tok, _charLookup::get_Item(tok::Value))
        elseif tok::Value == "{" then
            CurlyLvl++
            return new LCParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "}" then
            CurlyLvl--
            return new RCParen() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "label" then
//            return new LabelTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "place" then
//            return new PlaceTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "goto" then
//            return new GotoTok() {PosFromToken(tok), Value = tok::Value}
        elseif _keywLookup::Contains(tok::Value) then
            return NewToken(tok, _keywLookup::get_Item(tok::Value))
        elseif tok::Value == "if" then
            PFlags::IfFlag = true
            return new IfTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#if" then
            PFlags::IfFlag = true
            return new HIfTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "until" then
            PFlags::IfFlag = true
            return new UntilTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "while" then
            PFlags::IfFlag = true
            return new WhileTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "elseif" then
            PFlags::IfFlag = true
            return new ElseIfTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#elseif" then
            PFlags::IfFlag = true
            return new HElseIfTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "for" then
            PFlags::AsFlag = true
            PFlags::ForFlag = true
            return new ForTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "foreach" then
            PFlags::AsFlag = true
            return new ForeachTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "where" then
            PFlags::AsFlag = true
            return new WhereTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "then" then
            PFlags::IfFlag = false
            return new ThenTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "newarr" then
//            return new NewarrTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "ptr" then
//            return new PtrTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#refasm" then
            PFlags::NoOptFlag = true
            return new RefasmTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "#refembedasm" then
//            PFlags::NoOptFlag = true
//            return new RefembedasmTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#refstdasm" then
            PFlags::NoOptFlag = true
            return new RefstdasmTok() {PosFromToken(tok), Value = tok::Value}
        //elseif tok::Value == "#scope" then
        //    return new ScopeTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "import" then
            PFlags::NoOptFlag = true
            return new ImportTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "locimport" then
            PFlags::NoOptFlag = true
            return new LocimportTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "assembly" then
            return #ternary {isFirstToken ? new AssemblyTok() {PosFromToken(tok), Value = tok::Value}, new AssemblyAttr() {PosFromToken(tok), Value = tok::Value}}
        elseif tok::Value == "ver" then
            PFlags::NoOptFlag = true
            return new VerTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "field" then
            PFlags::ForFlag = true
            return new FieldTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value like "^parameter(\d)+:$" then
            return new ParameterCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "end" then
            SpecialFlg = lkahead::Value like "^((((s)|(g))et)|(add)|(remove)|(interface))$"
            return new EndTok() {PosFromToken(tok), Value = tok::Value}
        elseif (tok::Value == "set") andalso (isFirstToken orelse SpecialFlg) then
            SpecialFlg = false
            return new SetTok() {PosFromToken(tok), Value = tok::Value}
        elseif (tok::Value == "get") andalso (isFirstToken orelse SpecialFlg) then
            SpecialFlg = false
            return new GetTok() {PosFromToken(tok), Value = tok::Value}
        elseif (tok::Value == "add") andalso (isFirstToken orelse SpecialFlg) then
            SpecialFlg = false
            return new AddTok() {PosFromToken(tok), Value = tok::Value}
        elseif (tok::Value == "remove")  andalso (isFirstToken orelse SpecialFlg) then
            SpecialFlg = false
            return new RemoveTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "var" then
            PFlags::AsFlag = true
            return new VarTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "using" then
            PFlags::AsFlag = true
            return new UsingTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "catch" then
            PFlags::AsFlag = true
            return new CatchTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "as" then
            return #ternary {PFlags::AsFlag ? new AsTok() {PosFromToken(tok), Value = tok::Value}, new AsOp() {PosFromToken(tok), Value = tok::Value}}
        elseif tok::Value == "in" then
            PFlags::IfFlag = true
            PFlags::AsFlag = false
            return new InTok() {PosFromToken(tok), Value = tok::Value}
        elseif _attrLookup::Contains(tok::Value) then
            return NewToken(tok, _attrLookup::get_Item(tok::Value))
        elseif tok::Value == "interface" then
            if isFirstToken orelse SpecialFlg then
                return new InterfaceTok() {PosFromToken(tok), Value = tok::Value}
            else
                return new InterfaceAttr() {PosFromToken(tok), Value = tok::Value}
            end if
        elseif _typeLookup::Contains(tok::Value) then
            return NewToken(tok, _typeLookup::get_Item(tok::Value))
        elseif tok::Value like "^//(.)*$" then
            PFlags::CmtFlag = true
            return new CommentTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "null" then
            return new NullLiteral(tok::Value) {PosFromToken(tok)}
        elseif tok::Value like "^((true)|(false))$" then
            return #ternary {tok::Value == "true" ? new BooleanLiteral(true) {PosFromToken(tok)} , new BooleanLiteral(false) {PosFromToken(tok)}}
        elseif tok::Value like "^(c)?'(.)*'$" then
            tok::Value = #ternary {tok::Value::StartsWith("c") ? ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\s'})), tok::Value::Trim(new char[] {c'\s'})}
            var cl = new CharLiteral(tok::Value) {PosFromToken(tok)}
            if cl::ParseFailed then
                StreamUtils::WriteErrorLine(tok::Line, ++tok::Column, PFlags::CurPath, string::Format("'{0}' is an invalid character!", tok::Value))
            end if
            return cl
        elseif tok::Value like c"^(i)\q(.)*\q$" then
            return new InterpolateLiteral(tok::Value::TrimStart(new char[] {'i'})::Trim(new char[] {c'\q'})) {PosFromToken(tok)}
        elseif tok::Value like c"^(f)\q(.)*\q$" then
            return new FormattableLiteral(tok::Value::TrimStart(new char[] {'f'})::Trim(new char[] {c'\q'})) {PosFromToken(tok)}
        elseif tok::Value like c"^(c)?\q(.)*\q$" then
            return new StringLiteral(#ternary {tok::Value::StartsWith("c") ? ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\q'})), tok::Value::Trim(new char[] {c'\q'})}) {PosFromToken(tok)}
        //floats
        elseif tok::Value like "^(\+|-)?(\d)+(\.(\d)+)?d$" then
            return new DoubleLiteral($double$tok::Value::TrimEnd(new char[] {'d'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+(\.(\d)+)?f$" then
            return new FloatLiteral($single$tok::Value::TrimEnd(new char[] {'f'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+(\.(\d)+)?m$" then
            return new DecimalLiteral($decimal$tok::Value::TrimEnd(new char[] {'m'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+$" then
            return new DoubleLiteral($double$tok::Value) {PosFromToken(tok)}
        //decimal
        elseif tok::Value like "^(\+|-)?(\d)+ui$" then
            return new UIntLiteral($uinteger$tok::Value::TrimEnd(new char[] {'i'})::TrimEnd(new char[] {'u'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+ip$" then
            tok::Value = tok::Value::TrimEnd(new char[] {'p'})::TrimEnd(new char[] {'i'})
            return new IntPtrLiteral() {NumVal = new IntPtr($integer$tok::Value), Value = tok::Value, PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+i$" then
            return new IntLiteral($integer$tok::Value::TrimEnd(new char[] {'i'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+ul$" then
            return new ULongLiteral($ulong$tok::Value::TrimEnd(new char[] {'l'})::TrimEnd(new char[] {'u'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+l$" then
            return new LongLiteral($long$tok::Value::TrimEnd(new char[] {'l'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+us$" then
            return new UShortLiteral($ushort$tok::Value::TrimEnd(new char[] {'s'})::TrimEnd(new char[] {'u'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+s$" then
            return new ShortLiteral($short$tok::Value::TrimEnd(new char[] {'s'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+ub$" then
            return new ByteLiteral($byte$tok::Value::TrimEnd(new char[] {'b'})::TrimEnd(new char[] {'u'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+b$" then
            return new SByteLiteral($sbyte$tok::Value::TrimEnd(new char[] {'b'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+$" then
            return new IntLiteral($integer$tok::Value) {PosFromToken(tok)}
        //hex
        elseif tok::Value like "^0x([0-9A-F])+ui$" then
            return new UIntLiteral(uinteger::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 4), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+ip$" then
            return new IntPtrLiteral() {NumVal = new IntPtr(integer::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 4), NumberStyles::HexNumber)), Value = tok::Value, PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+i$" then
            return new IntLiteral(integer::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 3), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+ul$" then
            return new ULongLiteral(ulong::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 4), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+l$" then
            return new LongLiteral(long::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 3), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+us$" then
            return new UShortLiteral(ushort::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 4), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+s$" then
            return new ShortLiteral(short::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 3), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+ub$" then
            return new ByteLiteral(byte::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 4), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+b$" then
            return new SByteLiteral(sbyte::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 3), NumberStyles::HexNumber)) {PosFromToken(tok)}
        elseif tok::Value like "^0x([0-9A-F])+$" then
            return new IntLiteral(integer::Parse(tok::Value::Substring(2, tok::Value::get_Length() - 2), NumberStyles::HexNumber)) {PosFromToken(tok)}
        //idents
        elseif tok::Value like "^\\((([a-zA-Z])+(.)*)|(_(.)+))$" then
            return new NestedAccessToken(tok::Value) {PosFromToken(tok)}
        elseif tok::Value like "^\.((([a-zA-Z])+(.)*)|(_(.)+))$" then
            return new ExplImplAccessToken(tok::Value) {PosFromToken(tok)}
        elseif tok::Value like "^(::)?((([a-zA-Z])+(.)*)|(_(.)+))$" then
            return new Ident(tok::Value) {PosFromToken(tok)}
        else
            StreamUtils::WriteErrorLine(tok::Line, tok::Column, PFlags::CurPath, string::Format("'{0}' is an invalid token!", tok::Value))
        end if

        return tok
    end method

end class