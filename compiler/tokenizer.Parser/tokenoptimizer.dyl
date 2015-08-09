//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

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
			return new AddOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "*" then
			return new MulOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "-" then
			return new SubOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "/" then
			return new DivOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "++" then
			return new IncOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "--" then
			return new DecOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "<<" then
			return new ShlOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == ">>" then
			return new ShrOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "=>" then
			return new GoesToTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "=" then
			PFlags::AsFlag = false
			if CurlyLvl > 0 then
				return new AssignOp2() {Line = tok::Line, Value = tok::Value}
			elseif PFlags::IfFlag then
				return new EqOp() {Line = tok::Line, Value = tok::Value}
			elseif PFlags::ForFlag then
				return new AssignOp2() {Line = tok::Line, Value = tok::Value}
			else
				return new AssignOp() {Line = tok::Line, Value = tok::Value}
			end if
		elseif tok::Value == "%" then
			return new ModOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "==" then
			return new EqOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "===" then
			return new StrictEqOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "like" then
			return new LikeOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "!" then
			return new NegOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "~" then
			return new NotOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "!=" then
			return new NeqOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "!==" then
			return new StrictNeqOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "notlike" then
			return new NLikeOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "<>" then
			return new NeqOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == ">=" then
			return new GeOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "<="  then
			return new LeOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == ">" then
			if GenLvl == 0 then
				return new GtOp() {Line = tok::Line, Value = tok::Value}
			else
				GenLvl--
				return new RAParen() {Line = tok::Line, Value = tok::Value}
			end if
		elseif tok::Value == "<" then
			if lkahead::Value == "of" then
				GenLvl++
				return new LAParen() {Line = tok::Line, Value = tok::Value}
			else
				return new LtOp() {Line = tok::Line, Value = tok::Value}
			end if
		elseif tok::Value == "is" then
			return new IsOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "isnot" then
			return new IsNotOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "and" then
			return new AndOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "andalso" then
			return new AndAlsoOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "or" then
			return new OrOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "orelse" then
			return new OrElseOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "nand" then
			return new NandOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "nor" then
			return new NorOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "xor" then
			return new XorOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "xnor" then
			return new XnorOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "(" then
			return new LParen() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == ")" then
			return new RParen() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "[]" then
			return new LRSParen() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "&" then
			return new Ampersand() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "[" then
			return new LSParen() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "]" then
			return new RSParen() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "{" then
			CurlyLvl++
			return new LCParen() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "}" then
			CurlyLvl--
			return new RCParen() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "|" then
			return new Pipe() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "," then
			return new Comma() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "?" then
			return new QuestionMark() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "??" then
			return new CoalesceOp() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "$" then
			return new DollarSign() {Line = tok::Line, Value = tok::Value}
//		elseif tok::Value == "label" then
//			return new LabelTok() {Line = tok::Line, Value = tok::Value}
//		elseif tok::Value == "place" then
//			return new PlaceTok() {Line = tok::Line, Value = tok::Value}
//		elseif tok::Value == "goto" then
//			return new GotoTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "if" then
			PFlags::IfFlag = true
			return new IfTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#if" then
			PFlags::IfFlag = true
			return new HIfTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "try" then
			return new TryTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "switch" then
			return new SwitchTok2() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "finally" then
			return new FinallyTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "until" then
			PFlags::IfFlag = true
			return new UntilTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "while" then
			PFlags::IfFlag = true
			return new WhileTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "elseif" then
			PFlags::IfFlag = true
			return new ElseIfTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#elseif" then
			PFlags::IfFlag = true
			return new HElseIfTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "else" then
			return new ElseTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "state" then
			return new StateTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#else" then
			return new HElseTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#ternary" then
			return new TernaryTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#define" then
			return new HDefineTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#undef" then
			return new HUndefTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "do" then
			return new DoTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "for" then
			PFlags::AsFlag = true
			PFlags::ForFlag = true
			return new ForTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "foreach" then
			PFlags::AsFlag = true
			return new ForeachTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "where" then
			PFlags::AsFlag = true
			return new WhereTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "upto" then
			return new UptoTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "downto" then
			return new DowntoTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "step" then
			return new StepTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "break" then
			return new BreakTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "continue" then
			return new ContinueTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "then" then
			PFlags::IfFlag = false
			return new ThenTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "new" then
			return new NewTok() {Line = tok::Line, Value = tok::Value}
//		elseif tok::Value == "newarr" then
//			return new NewarrTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "me" then
			return new MeTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "namespace" then
			return new NamespaceTok() {Line = tok::Line, Value = tok::Value}
//		elseif tok::Value == "ptr" then
//			return new PtrTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "gettype" then
			return new GettypeTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "default" then
			return new DefaultTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "ref" then
			return new RefTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "valinref" then
			return new ValInRefTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#refasm" then
			PFlags::NoOptFlag = true
			return new RefasmTok() {Line = tok::Line, Value = tok::Value}
//		elseif tok::Value == "#refembedasm" then
//			PFlags::NoOptFlag = true
//			return new RefembedasmTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#refstdasm" then
			PFlags::NoOptFlag = true
			return new RefstdasmTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#debug" then
			return new DebugTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#include" then
			return new IncludeTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#error" then
			return new ErrorTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#warning" then
			return new WarningTok() {Line = tok::Line, Value = tok::Value}
		//elseif tok::Value == "#scope" then
		//	return new ScopeTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#sign" then
			return new SignTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#embed" then
			return new EmbedTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#expr" then
			return new ExprTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "#region" then
			return new RegionTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "import" then
			PFlags::NoOptFlag = true
			return new ImportTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "locimport" then
			PFlags::NoOptFlag = true
			return new LocimportTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "assembly:" then
			return new AssemblyCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "assembly" then
			return #ternary {isFirstToken ? new AssemblyTok() {Line = tok::Line, Value = tok::Value}, new AssemblyAttr() {Line = tok::Line, Value = tok::Value}}
		elseif tok::Value == "ver" then
			PFlags::NoOptFlag = true
			return new VerTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "on" then
			return new OnTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "off" then
			return new OffTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "exe" then
			return new ExeTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "dll" then
			return new DllTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "winexe" then
			return new WinexeTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "field:" then
			return new FieldCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "field" then
			PFlags::ForFlag = true
			return new FieldTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "property:" then
			return new PropertyCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "property" then
			return new PropertyTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "event:" then
			return new EventCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "event" then
			return new EventTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "class:" then
			return new ClassCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value like "^parameter(\d)+:$" then
			return new ParameterCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "class" then
			return new ClassTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "struct" then
			return new StructTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "delegate" then
			return new DelegateTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "extends" then
			return new ExtendsTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "implements" then
			return new ImplementsTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "method" then
			return new MethodTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "method:" then
			return new MethodCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "enum" then
			return new EnumTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "enum:" then
			return new EnumCTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "end" then
			SpecialFlg = lkahead::Value like "^((((s)|(g))et)|(add)|(remove)|(interface))$"
			return new EndTok() {Line = tok::Line, Value = tok::Value}
		elseif (tok::Value == "set") andalso (isFirstToken orelse SpecialFlg) then
			SpecialFlg = false
			return new SetTok() {Line = tok::Line, Value = tok::Value}
		elseif (tok::Value == "get") andalso (isFirstToken orelse SpecialFlg) then
			SpecialFlg = false
			return new GetTok() {Line = tok::Line, Value = tok::Value}
		elseif (tok::Value == "add") andalso (isFirstToken orelse SpecialFlg) then
			SpecialFlg = false
			return new AddTok() {Line = tok::Line, Value = tok::Value}
		elseif (tok::Value == "remove")  andalso (isFirstToken orelse SpecialFlg) then
			SpecialFlg = false
			return new RemoveTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "return" then
			return new ReturnTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "lock" then
			return new LockTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "trylock" then
			return new TryLockTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "throw" then
			return new ThrowTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "var" then
			PFlags::AsFlag = true
			return new VarTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "using" then
			PFlags::AsFlag = true
			return new UsingTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "catch" then
			PFlags::AsFlag = true
			return new CatchTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "as" then
			return #ternary {PFlags::AsFlag ? new AsTok() {Line = tok::Line, Value = tok::Value}, new AsOp() {Line = tok::Line, Value = tok::Value}}
		elseif tok::Value == "of" then
			return new OfTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "in" then
			PFlags::IfFlag = true
			PFlags::AsFlag = false
			return new InTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "out" then
			return new OutTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "inout" then
			return new InOutTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "private" then
			return new PrivateAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "public" then
			return new PublicAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "initonly" then
			return new InitOnlyAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "static" then
			return new StaticAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "none" then
			return new NoneAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "specialname" then
			return new SpecialNameAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "sealed" then
			return new SealedAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "final" then
			return new FinalAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "hidebysig" then
			return new HideBySigAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "family" then
			return new FamilyAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "literal" then
			return new LiteralAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "famorassem" then
			return new FamORAssemAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "famandassem" then
			return new FamANDAssemAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "virtual" then
			return new VirtualAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "override" then
			return new OverrideAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "abstract" then
			return new AbstractAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "prototype" then
			return new PrototypeAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "partial" then
			return new PartialAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "interface" then
			if isFirstToken orelse SpecialFlg then
				return new InterfaceTok() {Line = tok::Line, Value = tok::Value}
			else
				return new InterfaceAttr() {Line = tok::Line, Value = tok::Value}
			end if
		elseif tok::Value == "newslot" then
			return new NewSlotAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "auto" then
			return new AutoLayoutAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "autogen" then
			return new AutoGenAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "autochar" then
			return new AutoClassAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "ansi" then
			return new AnsiClassAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "beforefieldinit" then
			return new BeforeFieldInitAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "pinvokeimpl" then
			return new PinvokeImplAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "sequential" then
			return new SequentialLayoutAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "serializable" then
			return new SerializableAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "notserialized" then
			return new NotSerializedAttr() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "string" then
			return new StringTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "void" then
			return new VoidTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "decimal" then
			return new DecimalTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "integer" then
			return new IntegerTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "intptr" then
			return new IntPtrTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "uinteger" then
			return new UIntegerTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "double" then
			return new DoubleTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "boolean" then
			return new BooleanTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "char" then
			return new CharTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "single" then
			return new SingleTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "sbyte" then
			return new SByteTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "byte" then
			return new ByteTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "short" then
			return new ShortTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "ushort" then
			return new UShortTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "long" then
			return new LongTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "ulong" then
			return new ULongTok(tok::Value) {Line = tok::Line}
		elseif tok::Value == "object" then
			return new ObjectTok(tok::Value) {Line = tok::Line}
		elseif tok::Value like "^//(.)*$" then
			PFlags::CmtFlag = true
			return new CommentTok() {Line = tok::Line, Value = tok::Value}
		elseif tok::Value == "null" then
			return new NullLiteral(tok::Value) {Line = tok::Line}
		elseif tok::Value like "^((true)|(false))$" then
			return #ternary {tok::Value == "true" ? new BooleanLiteral(true) {Line = tok::Line} , new BooleanLiteral(false) {Line = tok::Line}}
		elseif tok::Value like "^(c)?'(.)*'$" then
			tok::Value = #ternary {tok::Value::StartsWith("c") ? ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\s'})), tok::Value::Trim(new char[] {c'\s'})}
			return new CharLiteral($char$tok::Value) {Line = tok::Line}
		elseif tok::Value like c"^(i)\q(.)*\q$" then
			return new InterpolateLiteral(tok::Value::TrimStart(new char[] {'i'})::Trim(new char[] {c'\q'})) {Line = tok::Line}
		elseif tok::Value like c"^(c)?\q(.)*\q$" then
			return new StringLiteral(#ternary {tok::Value::StartsWith("c") ? ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\q'})), tok::Value::Trim(new char[] {c'\q'})}) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+d$" then
			return new DoubleLiteral($double$tok::Value::TrimEnd(new char[] {'d'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+f$" then
			return new FloatLiteral($single$tok::Value::TrimEnd(new char[] {'f'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+m$" then
			return new DecimalLiteral($decimal$tok::Value::TrimEnd(new char[] {'m'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+\.(\d)+$" then
			return new DoubleLiteral($double$tok::Value) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+d$" then
			return new DoubleLiteral($double$tok::Value::TrimEnd(new char[] {'d'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+f$" then
			return new FloatLiteral($single$tok::Value::TrimEnd(new char[] {'f'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+m$" then
			return new DecimalLiteral($decimal$tok::Value::TrimEnd(new char[] {'m'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+ui$" then
			return new UIntLiteral($uinteger$tok::Value::TrimEnd(new char[] {'i'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+ip$" then
			tok::Value = tok::Value::TrimEnd(new char[] {'p'})::TrimEnd(new char[] {'i'})
			return new IntPtrLiteral() {NumVal = new IntPtr($integer$tok::Value), Value = tok::Value, Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+i$" then
			return new IntLiteral($integer$tok::Value::TrimEnd(new char[] {'i'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+ul$" then
			return new ULongLiteral($ulong$tok::Value::TrimEnd(new char[] {'l'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+l$" then
			return new LongLiteral($long$tok::Value::TrimEnd(new char[] {'l'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+us$" then
			return new UShortLiteral($ushort$tok::Value::TrimEnd(new char[] {'s'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+s$" then
			return new ShortLiteral($short$tok::Value::TrimEnd(new char[] {'s'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+ub$" then
			return new ByteLiteral($byte$tok::Value::TrimEnd(new char[] {'b'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+b$" then
			return new SByteLiteral($sbyte$tok::Value::TrimEnd(new char[] {'b'})) {Line = tok::Line}
		elseif tok::Value like "^(\+|-)?(\d)+$" then
			return new IntLiteral($integer$tok::Value) {Line = tok::Line}
		elseif tok::Value like "^\\((([a-zA-Z])+(.)*)|(_(.)+))$" then
			return new NestedAccessToken(tok::Value) {Line = tok::Line}
		elseif tok::Value like "^\.((([a-zA-Z])+(.)*)|(_(.)+))$" then
			return new ExplImplAccessToken(tok::Value) {Line = tok::Line}
		elseif tok::Value like "^(::)?((([a-zA-Z])+(.)*)|(_(.)+))$" then
			return new Ident(tok::Value) {Line = tok::Line}
		else
			StreamUtils::WriteErrorLine(tok::Line, PFlags::CurPath, string::Format("'{0}' is an invalid token!", tok::Value))
		end if
		
		return tok
	end method

end class