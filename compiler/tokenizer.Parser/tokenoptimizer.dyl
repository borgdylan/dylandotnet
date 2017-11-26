//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import dylan.NET.Utils
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.Literals

import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Attributes
import dylan.NET.Tokenizer.AST.Tokens.Chars

class public TokenOptimizer

    field public integer GenLvl
    field public integer CurlyLvl
    field public Flags PFlags
    field public boolean isFirstToken
    field public boolean isFirstRun
    field public boolean SpecialFlg

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

        if tok::Value == "+" then
            return new AddOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "*" then
            return new MulOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "-" then
            return new SubOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "/" then
            return new DivOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "++" then
            return new IncOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "--" then
            return new DecOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "<<" then
            return new ShlOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == ">>" then
            return new ShrOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "=>" then
            return new GoesToTok() {PosFromToken(tok), Value = tok::Value}
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
        elseif tok::Value == "%" then
            return new ModOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "==" then
            return new EqOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "===" then
            return new StrictEqOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "like" then
            return new LikeOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "!" then
            return new NegOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "~" then
            return new NotOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "!=" then
            return new NeqOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "!==" then
            return new StrictNeqOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "notlike" then
            return new NLikeOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "<>" then
            return new NeqOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == ">=" then
            return new GeOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "<="  then
            return new LeOp() {PosFromToken(tok), Value = tok::Value}
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
        elseif tok::Value == "is" then
            return new IsOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "isnot" then
            return new IsNotOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "and" then
            return new AndOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "andalso" then
            return new AndAlsoOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "or" then
            return new OrOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "orelse" then
            return new OrElseOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "nand" then
            return new NandOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "nor" then
            return new NorOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "xor" then
            return new XorOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "xnor" then
            return new XnorOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "(" then
            return new LParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == ")" then
            return new RParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "[]" then
            return new LRSParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "&" then
            return new Ampersand() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "[" then
            return new LSParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "]" then
            return new RSParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "{" then
            CurlyLvl++
            return new LCParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "}" then
            CurlyLvl--
            return new RCParen() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "|" then
            return new Pipe() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "," then
            return new Comma() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "?" then
            return new QuestionMark() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "??" then
            return new CoalesceOp() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "$" then
            return new DollarSign() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "label" then
//            return new LabelTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "place" then
//            return new PlaceTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "goto" then
//            return new GotoTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "if" then
            PFlags::IfFlag = true
            return new IfTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#if" then
            PFlags::IfFlag = true
            return new HIfTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "try" then
            return new TryTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "switch" then
            return new SwitchTok2() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "finally" then
            return new FinallyTok() {PosFromToken(tok), Value = tok::Value}
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
        elseif tok::Value == "else" then
            return new ElseTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "state" then
            return new StateTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#else" then
            return new HElseTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#ternary" then
            return new TernaryTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#define" then
            return new HDefineTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#undef" then
            return new HUndefTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "do" then
            return new DoTok() {PosFromToken(tok), Value = tok::Value}
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
        elseif tok::Value == "upto" then
            return new UptoTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "downto" then
            return new DowntoTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "step" then
            return new StepTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "break" then
            return new BreakTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "continue" then
            return new ContinueTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "then" then
            PFlags::IfFlag = false
            return new ThenTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "new" then
            return new NewTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "newarr" then
//            return new NewarrTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "me" then
            return new MeTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "namespace" then
            return new NamespaceTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "ptr" then
//            return new PtrTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "gettype" then
            return new GettypeTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "default" then
            return new DefaultTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "ref" then
            return new RefTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "valinref" then
            return new ValInRefTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#refasm" then
            PFlags::NoOptFlag = true
            return new RefasmTok() {PosFromToken(tok), Value = tok::Value}
//        elseif tok::Value == "#refembedasm" then
//            PFlags::NoOptFlag = true
//            return new RefembedasmTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#refstdasm" then
            PFlags::NoOptFlag = true
            return new RefstdasmTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#debug" then
            return new DebugTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#include" then
            return new IncludeTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#error" then
            return new ErrorTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#warning" then
            return new WarningTok() {PosFromToken(tok), Value = tok::Value}
        //elseif tok::Value == "#scope" then
        //    return new ScopeTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#sign" then
            return new SignTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#embed" then
            return new EmbedTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#expr" then
            return new ExprTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#nullcond" then
            return new NullCondTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "#region" then
            return new RegionTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "import" then
            PFlags::NoOptFlag = true
            return new ImportTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "locimport" then
            PFlags::NoOptFlag = true
            return new LocimportTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "assembly:" then
            return new AssemblyCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "assembly" then
            return #ternary {isFirstToken ? new AssemblyTok() {PosFromToken(tok), Value = tok::Value}, new AssemblyAttr() {PosFromToken(tok), Value = tok::Value}}
        elseif tok::Value == "ver" then
            PFlags::NoOptFlag = true
            return new VerTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "on" then
            return new OnTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "off" then
            return new OffTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "exe" then
            return new ExeTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "dll" then
            return new DllTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "winexe" then
            return new WinexeTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "field:" then
            return new FieldCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "field" then
            PFlags::ForFlag = true
            return new FieldTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "property:" then
            return new PropertyCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "property" then
            return new PropertyTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "event:" then
            return new EventCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "event" then
            return new EventTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "class:" then
            return new ClassCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value like "^parameter(\d)+:$" then
            return new ParameterCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "class" then
            return new ClassTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "struct" then
            return new StructTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "delegate" then
            return new DelegateTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "extends" then
            return new ExtendsTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "implements" then
            return new ImplementsTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "method" then
            return new MethodTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "method:" then
            return new MethodCTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "enum" then
            return new EnumTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "enum:" then
            return new EnumCTok() {PosFromToken(tok), Value = tok::Value}
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
        elseif tok::Value == "return" then
            return new ReturnTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "lock" then
            return new LockTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "trylock" then
            return new TryLockTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "throw" then
            return new ThrowTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "var" then
            PFlags::AsFlag = true
            return new VarTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "using" then
            PFlags::AsFlag = true
            return new UsingTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "catch" then
            PFlags::AsFlag = true
            return new CatchTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "when" then
            return new WhenTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "as" then
            return #ternary {PFlags::AsFlag ? new AsTok() {PosFromToken(tok), Value = tok::Value}, new AsOp() {PosFromToken(tok), Value = tok::Value}}
        elseif tok::Value == "of" then
            return new OfTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "in" then
            PFlags::IfFlag = true
            PFlags::AsFlag = false
            return new InTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "out" then
            return new OutTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "inout" then
            return new InOutTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "private" then
            return new PrivateAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "public" then
            return new PublicAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "initonly" then
            return new InitOnlyAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "static" then
            return new StaticAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "none" then
            return new NoneAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "specialname" then
            return new SpecialNameAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "sealed" then
            return new SealedAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "final" then
            return new FinalAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "hidebysig" then
            return new HideBySigAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "family" then
            return new FamilyAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "literal" then
            return new LiteralAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "famorassem" then
            return new FamORAssemAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "famandassem" then
            return new FamANDAssemAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "virtual" then
            return new VirtualAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "override" then
            return new OverrideAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "abstract" then
            return new AbstractAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "prototype" then
            return new PrototypeAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "partial" then
            return new PartialAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "interface" then
            if isFirstToken orelse SpecialFlg then
                return new InterfaceTok() {PosFromToken(tok), Value = tok::Value}
            else
                return new InterfaceAttr() {PosFromToken(tok), Value = tok::Value}
            end if
        elseif tok::Value == "newslot" then
            return new NewSlotAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "auto" then
            return new AutoLayoutAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "autogen" then
            return new AutoGenAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "autochar" then
            return new AutoClassAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "ansi" then
            return new AnsiClassAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "beforefieldinit" then
            return new BeforeFieldInitAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "pinvokeimpl" then
            return new PinvokeImplAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "sequential" then
            return new SequentialLayoutAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "serializable" then
            return new SerializableAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "notserialized" then
            return new NotSerializedAttr() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "string" then
            return new StringTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "void" then
            return new VoidTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "decimal" then
            return new DecimalTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "integer" then
            return new IntegerTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "intptr" then
            return new IntPtrTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "uinteger" then
            return new UIntegerTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "double" then
            return new DoubleTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "boolean" then
            return new BooleanTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "char" then
            return new CharTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "single" then
            return new SingleTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "sbyte" then
            return new SByteTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "byte" then
            return new ByteTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "short" then
            return new ShortTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "ushort" then
            return new UShortTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "long" then
            return new LongTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "ulong" then
            return new ULongTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value == "object" then
            return new ObjectTok(tok::Value) {PosFromToken(tok)}
        elseif tok::Value like "^//(.)*$" then
            PFlags::CmtFlag = true
            return new CommentTok() {PosFromToken(tok), Value = tok::Value}
        elseif tok::Value == "null" then
            return new NullLiteral(tok::Value) {PosFromToken(tok)}
        elseif tok::Value like "^((true)|(false))$" then
            return #ternary {tok::Value == "true" ? new BooleanLiteral(true) {PosFromToken(tok)} , new BooleanLiteral(false) {PosFromToken(tok)}}
        elseif tok::Value like "^(c)?'(.)*'$" then
            tok::Value = #ternary {tok::Value::StartsWith("c") ? ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\s'})), tok::Value::Trim(new char[] {c'\s'})}
            return new CharLiteral($char$tok::Value) {PosFromToken(tok)}
        elseif tok::Value like c"^(i)\q(.)*\q$" then
            return new InterpolateLiteral(tok::Value::TrimStart(new char[] {'i'})::Trim(new char[] {c'\q'})) {PosFromToken(tok)}
        elseif tok::Value like c"^(f)\q(.)*\q$" then
            return new FormattableLiteral(tok::Value::TrimStart(new char[] {'f'})::Trim(new char[] {c'\q'})) {PosFromToken(tok)}
        elseif tok::Value like c"^(c)?\q(.)*\q$" then
            return new StringLiteral(#ternary {tok::Value::StartsWith("c") ? ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\q'})), tok::Value::Trim(new char[] {c'\q'})}) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+d$" then
            return new DoubleLiteral($double$tok::Value::TrimEnd(new char[] {'d'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+f$" then
            return new FloatLiteral($single$tok::Value::TrimEnd(new char[] {'f'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+m$" then
            return new DecimalLiteral($decimal$tok::Value::TrimEnd(new char[] {'m'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+$" then
            return new DoubleLiteral($double$tok::Value) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+d$" then
            return new DoubleLiteral($double$tok::Value::TrimEnd(new char[] {'d'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+f$" then
            return new FloatLiteral($single$tok::Value::TrimEnd(new char[] {'f'})) {PosFromToken(tok)}
        elseif tok::Value like "^(\+|-)?(\d)+m$" then
            return new DecimalLiteral($decimal$tok::Value::TrimEnd(new char[] {'m'})) {PosFromToken(tok)}
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