//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi TokenOptimizer

	field public integer GenLvl
	field public integer CurlyLvl
	field public Flags PFlags
	field public boolean isFirstToken

	method public void TokenOptimizer()
		me::ctor()
		GenLvl = 0
		CurlyLvl = 0
		PFlags = new Flags()
		isFirstToken = true
	end method
	
	method public void TokenOptimizer(var pf as Flags)
		me::ctor()
		GenLvl = 0
		CurlyLvl = 0
		PFlags = pf
		isFirstToken = true
	end method

	method public Token Optimize(var tok as Token, var lkahead as Token)

		if lkahead = null then
			lkahead = new Token()
		end if
		
		label fin
		
		if tok::Value = "+" then
			tok = new AddOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "*" then
			tok = new MulOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "-" then
			tok = new SubOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "/" then
			tok = new DivOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "++" then
			tok = new IncOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "--" then
			tok = new DecOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "<<" then
			tok = new ShlOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = ">>" then
			tok = new ShrOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "=" then
			if CurlyLvl > 0 then
				tok = new AssignOp2() {Line = tok::Line, Value = tok::Value}
			elseif PFlags::IfFlag then
				tok = new EqOp() {Line = tok::Line, Value = tok::Value}
			else
				tok = new AssignOp() {Line = tok::Line, Value = tok::Value}
			end if
			PFlags::AsFlag = false
			goto fin
		end if
		
		if tok::Value = "%" then
			tok = new ModOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "==" then
			tok = new EqOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "like" then
			tok = new LikeOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "!" then
			tok = new NegOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "~" then
			tok = new NotOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "!=" then
			tok = new NeqOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "notlike" then
			tok = new NLikeOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "<>" then
			tok = new NeqOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = ">=" then
			tok = new GeOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "<="  then
			tok = new LeOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = ">" then
			if GenLvl = 0 then
				tok = new GtOp() {Line = tok::Line, Value = tok::Value}
			else
				GenLvl = GenLvl - 1
				tok = new RAParen() {Line = tok::Line, Value = tok::Value}
			end if
		goto fin
		end if
		
		if tok::Value = "<" then
			if lkahead::Value = "of" then
				GenLvl = GenLvl + 1
				tok = new LAParen() {Line = tok::Line, Value = tok::Value}
			else
				tok = new LtOp() {Line = tok::Line, Value = tok::Value}
			end if
			goto fin
		end if
		
		if tok::Value = "is" then
			tok = new IsOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "and" then
			tok = new AndOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "or" then
			tok = new OrOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "nand" then
			tok = new NandOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "nor" then
			tok = new NorOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "xor" then
			tok = new XorOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "xnor" then
			tok = new XnorOp() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "(" then
			tok = new LParen() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = ")" then
			tok = new RParen() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "[]" then
			tok = new LRSParen() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "&" then
			tok = new Ampersand() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "[" then
			tok = new LSParen() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "]" then
			tok = new RSParen() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "{" then
			CurlyLvl = CurlyLvl + 1
			tok = new LCParen() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "}" then
			CurlyLvl = CurlyLvl - 1
			tok = new RCParen() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "|" then
			tok = new Pipe() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "," then
			tok = new Comma() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "$" then
			tok = new DollarSign() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "label" then
			tok = new LabelTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "place" then
			tok = new PlaceTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "goto" then
			tok = new GotoTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "if" then
			tok = new IfTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "#if" then
			tok = new HIfTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "try" then
			tok = new TryTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "finally" then
			tok = new FinallyTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "until" then
			tok = new UntilTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "while" then
			tok = new WhileTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "elseif" then
			tok = new ElseIfTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "#elseif" then
			tok = new HElseIfTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "else" then
			tok = new ElseTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#else" then
			tok = new HElseTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#define" then
			tok = new HDefineTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#undef" then
			tok = new HUndefTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "do" then
			tok = new DoTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "for" then
			tok = new ForTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "foreach" then
			tok = new ForeachTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "break" then
			tok = new BreakTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "continue" then
			tok = new ContinueTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "then" then
			tok = new ThenTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = false
			goto fin
		end if
		
		if tok::Value = "new" then
			tok = new NewTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "newarr" then
			tok = new NewarrTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "me" then
			tok = new MeTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "namespace" then
			tok = new NamespaceTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "ptr" then
			tok = new PtrTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "gettype" then
			tok = new GettypeTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "ref" then
			tok = new RefTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "valinref" then
			tok = new ValInRefTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#refasm" then
			tok = new RefasmTok() {Line = tok::Line, Value = tok::Value}
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "#refstdasm" then
			tok = new RefstdasmTok() {Line = tok::Line, Value = tok::Value}
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "#debug" then
			tok = new DebugTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#include" then
			tok = new IncludeTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#error" then
			tok = new ErrorTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#warning" then
			tok = new WarningTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "#scope" then
			tok = new ScopeTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "import" then
			tok = new ImportTok() {Line = tok::Line, Value = tok::Value}
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "locimport" then
			tok = new LocimportTok() {Line = tok::Line, Value = tok::Value}
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "assembly:" then
			tok = new AssemblyCTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "assembly" then
			if isFirstToken then
				tok = new AssemblyTok() {Line = tok::Line, Value = tok::Value}
			else
				tok = new AssemblyAttr() {Line = tok::Line, Value = tok::Value}
			end if
			goto fin
		end if
		
		if tok::Value = "ver" then
			tok = new VerTok() {Line = tok::Line, Value = tok::Value}
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "on" then
			tok = new OnTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "off" then
			tok = new OffTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "exe" then
			tok = new ExeTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "dll" then
			tok = new DllTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "field:" then
			tok = new FieldCTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "field" then
			tok = new FieldTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "property:" then
			tok = new PropertyCTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "property" then
			tok = new PropertyTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "event:" then
			tok = new EventCTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "event" then
			tok = new EventTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "class:" then
			tok = new ClassCTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value like "^parameter(\d)+:$" then
			tok = new ParameterCTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "class" then
			tok = new ClassTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "struct" then
			tok = new StructTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "delegate" then
			tok = new DelegateTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "extends" then
			tok = new ExtendsTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "implements" then
			tok = new ImplementsTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "method" then
			tok = new MethodTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "method:" then
			tok = new MethodCTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "end" then
			tok = new EndTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if (tok::Value = "set") and isFirstToken then
			tok = new SetTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if (tok::Value = "get") and isFirstToken then
			tok = new GetTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if (tok::Value = "add") and isFirstToken then
			tok = new AddTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if (tok::Value = "remove")  and isFirstToken then
			tok = new RemoveTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "return" then
			tok = new ReturnTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "lock" then
			tok = new LockTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "throw" then
			tok = new ThrowTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "var" then
			tok = new VarTok() {Line = tok::Line, Value = tok::Value}
			PFlags::AsFlag = true
			goto fin
		end if
		
		if tok::Value = "catch" then
			tok = new CatchTok() {Line = tok::Line, Value = tok::Value}
			PFlags::AsFlag = true
			goto fin
		end if
		
		if tok::Value = "as" then
			if PFlags::AsFlag then
				tok = new AsTok() {Line = tok::Line, Value = tok::Value}
			else
				tok = new AsOp() {Line = tok::Line, Value = tok::Value}
			end if
			goto fin
		end if
		
		if tok::Value = "of" then
			tok = new OfTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "in" then
			tok = new InTok() {Line = tok::Line, Value = tok::Value}
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "out" then
			tok = new OutTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "inout" then
			tok = new InOutTok() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "private" then
			tok = new PrivateAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "public" then
			tok = new PublicAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "initonly" then
			tok = new InitOnlyAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "static" then
			tok = new StaticAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "none" then
			tok = new NoneAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "specialname" then
			tok = new SpecialNameAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "sealed" then
			tok = new SealedAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "final" then
			tok = new FinalAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "hidebysig" then
			tok = new HideBySigAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "family" then
			tok = new FamilyAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "famorassem" then
			tok = new FamORAssemAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "famandassem" then
			tok = new FamANDAssemAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "virtual" then
			tok = new VirtualAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "abstract" then
			tok = new AbstractAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "prototype" then
			tok = new PrototypeAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "partial" then
			tok = new PartialAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "interface" then
			tok = new InterfaceAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "newslot" then
			tok = new NewSlotAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "auto" then
			tok = new AutoLayoutAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "autochar" then
			tok = new AutoClassAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "ansi" then
			tok = new AnsiClassAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "beforefieldinit" then
			tok = new BeforeFieldInitAttr() {Line = tok::Line, Value = tok::Value}
			goto fin
		end if
		
		if tok::Value = "string" then
			tok = new StringTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
	
		if tok::Value = "void" then
			tok = new VoidTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "decimal" then
			tok = new DecimalTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "integer" then
			tok = new IntegerTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "intptr" then
			tok = new IntPtrTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "uinteger" then
			tok = new UIntegerTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "double" then
			tok = new DoubleTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "boolean" then
			tok = new BooleanTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "char" then
			tok = new CharTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "single" then
			tok = new SingleTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "sbyte" then
			tok = new SByteTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "byte" then
			tok = new ByteTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "short" then
			tok = new ShortTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "ushort" then
			tok = new UShortTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "long" then
			tok = new LongTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "ulong" then
			tok = new ULongTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value = "object" then
			tok = new ObjectTok(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if tok::Value like "^//(.)*$" then
			tok = new CommentTok() {Line = tok::Line, Value = tok::Value}
			PFlags::CmtFlag = true
			goto fin
		end if
		
		if tok::Value = "null" then
			tok = new NullLiteral(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if (tok::Value = "true") or (tok::Value = "false") then
			var boolit as BooleanLiteral
			if tok::Value = "true" then
				boolit = new BooleanLiteral(true)
			end if
			if tok::Value = "false" then
				boolit = new BooleanLiteral(false)
			end if
			boolit::Line = tok::Line
			tok = boolit
			goto fin
		end if
		
		if (tok::Value like "^'(.)*'$") or (tok::Value like "^c'(.)*'$") then
			if tok::Value::StartsWith("c") then
				tok::Value = ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\s'}))
			else
				tok::Value = tok::Value::Trim(new char[] {c'\s'})
			end if
			tok = new CharLiteral($char$tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if (tok::Value like c"^\q(.)*\q$") or (tok::Value like c"^c\q(.)*\q$") then
			if tok::Value::StartsWith("c") then
				tok::Value = ParseUtils::ProcessString(tok::Value::TrimStart(new char[] {'c'})::Trim(new char[] {c'\q'}))
			else
				tok::Value = tok::Value::Trim(new char[] {c'\q'})
			end if
			tok = new StringLiteral(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$")) and tok::Value::EndsWith("d") then
			tok = new DoubleLiteral($double$tok::Value::TrimEnd(new char[] {'d'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$")) and tok::Value::EndsWith("f") then
			tok = new FloatLiteral($single$tok::Value::TrimEnd(new char[] {'f'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$")) and tok::Value::EndsWith("m") then
			tok = new DecimalLiteral($decimal$tok::Value::TrimEnd(new char[] {'m'})) {Line = tok::Line}
			goto fin
		end if
		
		if (tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$") then
			tok = new DoubleLiteral($double$tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("d") then
			tok = new DoubleLiteral($double$tok::Value::TrimEnd(new char[] {'d'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("f") then
			tok = new FloatLiteral($single$tok::Value::TrimEnd(new char[] {'f'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("m") then
			tok = new DecimalLiteral($decimal$tok::Value::TrimEnd(new char[] {'m'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("ui") then
			tok = new UIntLiteral($uinteger$tok::Value::TrimEnd(new char[] {'i'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("ip") then
			tok::Value = tok::Value::TrimEnd(new char[] {'p'})::TrimEnd(new char[] {'i'})
			tok = new IntPtrLiteral() {NumVal = new IntPtr($integer$tok::Value), Value = tok::Value, Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("i") then
			tok = new IntLiteral($integer$tok::Value::TrimEnd(new char[] {'i'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("ul") then
			tok = new ULongLiteral($ulong$tok::Value::TrimEnd(new char[] {'l'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("l") then
			tok = new LongLiteral($long$tok::Value::TrimEnd(new char[] {'l'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("us") then
			tok = new UShortLiteral($ushort$tok::Value::TrimEnd(new char[] {'s'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("s") then
			tok = new ShortLiteral($short$tok::Value::TrimEnd(new char[] {'s'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("ub") then
			tok = new ByteLiteral($byte$tok::Value::TrimEnd(new char[] {'b'})::TrimEnd(new char[] {'u'})) {Line = tok::Line}
			goto fin
		end if
		
		if ((tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")) and tok::Value::EndsWith("b") then
			tok = new SByteLiteral($sbyte$tok::Value::TrimEnd(new char[] {'b'})) {Line = tok::Line}
			goto fin
		end if
		
		if (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$") then
			tok = new IntLiteral($integer$tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		if (tok::Value like "^([a-zA-Z])+(.)*$") or (tok::Value like "^_(.)*([a-zA-Z])+(.)*$") or (tok::Value like "^::(.)*([a-zA-Z])+(.)*$") then
			tok = new Ident(tok::Value) {Line = tok::Line}
			goto fin
		end if
		
		place fin
		
		if isFirstToken then
			isFirstToken = false
		end if
		
		return tok
		
	end method

end class
