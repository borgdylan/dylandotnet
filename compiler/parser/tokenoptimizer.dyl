//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi TokenOptimizer

	field public integer GenLvl
	field public ParserFlags PFlags
	field public boolean isFirstToken

	method public void TokenOptimizer()
		me::ctor()
		GenLvl = 0
		PFlags = new ParserFlags()
		isFirstToken = true
	end method
	
	method public void TokenOptimizer(var pf as ParserFlags)
		me::ctor()
		GenLvl = 0
		PFlags = pf
		isFirstToken = true
	end method

	method public Token Optimize(var tok as Token, var lkahead as Token)

		if lkahead = null then
			lkahead = new Token()
		end if
		
		var compb as boolean = false
		var tmpchrarr as char[] = new char[1]
		var orflg as boolean = false
		
		label fin
		
		if tok::Value = "+" then
			var aop as AddOp = new AddOp()
			aop::Line = tok::Line
			aop::Value = tok::Value
			tok = aop
			goto fin
		end if
		
		if tok::Value = "*" then
			var mop as MulOp = new MulOp()
			mop::Line = tok::Line
			mop::Value = tok::Value
			tok = mop
			goto fin
		end if
		
		if tok::Value = "-" then
			var sop as SubOp = new SubOp()
			sop::Line = tok::Line
			sop::Value = tok::Value
			tok = sop
			goto fin
		end if
		
		if tok::Value = "/" then
			var dop as DivOp = new DivOp()
			dop::Line = tok::Line
			dop::Value = tok::Value
			tok = dop
			goto fin
		end if
		
		if tok::Value = "++" then
			var inop as IncOp = new IncOp()
			inop::Line = tok::Line
			inop::Value = tok::Value
			tok = inop
			goto fin
		end if
		
		if tok::Value = "--" then
			var deop as DecOp = new DecOp()
			deop::Line = tok::Line
			deop::Value = tok::Value
			tok = deop
			goto fin
		end if
		
		if tok::Value = "<<" then
			var shilop as ShlOp = new ShlOp()
			shilop::Line = tok::Line
			shilop::Value = tok::Value
			tok = shilop
			goto fin
		end if
		
		if tok::Value = ">>" then
			var shirop as ShrOp = new ShrOp()
			shirop::Line = tok::Line
			shirop::Value = tok::Value
			tok = shirop
			goto fin
		end if
		
		if tok::Value = "=" then
			if PFlags::IfFlag then
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
		
		if tok::Value = "%" then
			var moop as ModOp = new ModOp()
			moop::Line = tok::Line
			moop::Value = tok::Value
			tok = moop
			goto fin
		end if
		
		if tok::Value = "==" then
			var eqop as EqOp = new EqOp()
			eqop::Line = tok::Line
			eqop::Value = tok::Value
			tok = eqop
			goto fin
		end if
		
		if tok::Value = "like" then
			var lkeop as LikeOp = new LikeOp()
			lkeop::Line = tok::Line
			lkeop::Value = tok::Value
			tok = lkeop
			goto fin
		end if
		
		if tok::Value = "!" then
			var negop as NegOp = new NegOp()
			negop::Line = tok::Line
			negop::Value = tok::Value
			tok = negop
			goto fin
		end if
		
		if tok::Value = "~" then
			var notop as NotOp = new NotOp()
			notop::Line = tok::Line
			notop::Value = tok::Value
			tok = notop
			goto fin
		end if
		
		if tok::Value = "!=" then
			var neqop as NeqOp = new NeqOp()
			neqop::Line = tok::Line
			neqop::Value = tok::Value
			tok = neqop
			goto fin
		end if
		
		if tok::Value = "notlike" then
			var nlkeop as NLikeOp = new NLikeOp()
			nlkeop::Line = tok::Line
			nlkeop::Value = tok::Value
			tok = nlkeop
			goto fin
		end if
		
		if tok::Value = "<>" then
			var neqop2 as NeqOp = new NeqOp()
			neqop2::Line = tok::Line
			neqop2::Value = tok::Value
			tok = neqop2
			goto fin
		end if
		
		if tok::Value = ">=" then
			var geop as GeOp = new GeOp()
			geop::Line = tok::Line
			geop::Value = tok::Value
			tok = geop
			goto fin
		end if
		
		if tok::Value = "<="  then
			var leop as LeOp = new LeOp()
			leop::Line = tok::Line
			leop::Value = tok::Value
			tok = leop
			goto fin
		end if
		
		if tok::Value = ">" then
			if GenLvl = 0 then
				var gtop as GtOp = new GtOp()
				gtop::Line = tok::Line
				gtop::Value = tok::Value
				tok = gtop
			else
				var rapa as RAParen = new RAParen()
				rapa::Line = tok::Line
				rapa::Value = tok::Value
				GenLvl = GenLvl - 1
				tok = rapa
			end if
		goto fin
		end if
		
		if tok::Value = "<" then
			if lkahead::Value = "of" then
				var lapa as LAParen = new LAParen()
				lapa::Line = tok::Line
				lapa::Value = tok::Value
				GenLvl = GenLvl + 1
				tok = lapa
			else
				var ltop as LtOp = new LtOp()
				ltop::Line = tok::Line
				ltop::Value = tok::Value
				tok = ltop
			end if
			goto fin
		end if
		
		if tok::Value = "is" then
			var isop as IsOp = new IsOp()
			isop::Line = tok::Line
			isop::Value = tok::Value
			tok = isop
			goto fin
		end if
		
		if tok::Value = "and" then
			var andop as AndOp = new AndOp()
			andop::Line = tok::Line
			andop::Value = tok::Value
			tok = andop
			goto fin
		end if
		
		if tok::Value = "or" then
			var orop as OrOp = new OrOp()
			orop::Line = tok::Line
			orop::Value = tok::Value
			tok = orop
			goto fin
		end if
		
		if tok::Value = "nand" then
			var nandop as NandOp = new NandOp()
			nandop::Line = tok::Line
			nandop::Value = tok::Value
			tok = nandop
			goto fin
		end if
		
		if tok::Value = "nor" then
			var norop as NorOp = new NorOp()
			norop::Line = tok::Line
			norop::Value = tok::Value
			tok = norop
			goto fin
		end if
		
		if tok::Value = "xor" then
			var xorop as XorOp = new XorOp()
			xorop::Line = tok::Line
			xorop::Value = tok::Value
			tok = xorop
			goto fin
		end if
		
		if tok::Value = "xnor" then
			var xnorop as XnorOp = new XnorOp()
			xnorop::Line = tok::Line
			xnorop::Value = tok::Value
			tok = xnorop
			goto fin
		end if
		
		if tok::Value = "(" then
			var lpar as LParen = new LParen()
			lpar::Line = tok::Line
			lpar::Value = tok::Value
			tok = lpar
			goto fin
		end if
		
		if tok::Value = ")" then
			var rpar as RParen = new RParen()
			rpar::Line = tok::Line
			rpar::Value = tok::Value
			tok = rpar
			goto fin
		end if
		
		if tok::Value = "[]" then
			var lrspar as LRSParen = new LRSParen()
			lrspar::Line = tok::Line
			lrspar::Value = tok::Value
			tok = lrspar
			goto fin
		end if
		
		if tok::Value = "&" then
			var ampsig as Ampersand = new Ampersand()
			ampsig::Line = tok::Line
			ampsig::Value = tok::Value
			tok = ampsig
			goto fin
		end if
		
		if tok::Value = "[" then
			var lspar as LSParen = new LSParen()
			lspar::Line = tok::Line
			lspar::Value = tok::Value
			tok = lspar
			goto fin
		end if
		
		if tok::Value = "]" then
			var rspar as RSParen = new RSParen()
			rspar::Line = tok::Line
			rspar::Value = tok::Value
			tok = rspar
			goto fin
		end if
		
		if tok::Value = "|" then
			var pip as Pipe = new Pipe()
			pip::Line = tok::Line
			pip::Value = tok::Value
			tok = pip
			goto fin
		end if
		
		if tok::Value = "," then
			var com as Comma = new Comma()
			com::Line = tok::Line
			com::Value = tok::Value
			tok = com
			goto fin
		end if
		
		if tok::Value = "$" then
			var ds as DollarSign = new DollarSign()
			ds::Line = tok::Line
			ds::Value = tok::Value
			tok = ds
			goto fin
		end if
		
		if tok::Value = "label" then
			var lbltk as LabelTok = new LabelTok()
			lbltk::Line = tok::Line
			lbltk::Value = tok::Value
			tok = lbltk
			goto fin
		end if
		
		if tok::Value = "place" then
			var plctk as PlaceTok = new PlaceTok()
			plctk::Line = tok::Line
			plctk::Value = tok::Value
			tok = plctk
			goto fin
		end if
		
		if tok::Value = "goto" then
			var gtotk as GotoTok = new GotoTok()
			gtotk::Line = tok::Line
			gtotk::Value = tok::Value
			tok = gtotk
			goto fin
		end if
		
		if tok::Value = "if" then
			var iftk as IfTok = new IfTok()
			iftk::Line = tok::Line
			iftk::Value = tok::Value
			tok = iftk
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "try" then
			var trytk as TryTok = new TryTok()
			trytk::Line = tok::Line
			trytk::Value = tok::Value
			tok = trytk
			goto fin
		end if
		
		if tok::Value = "finally" then
			var finatk as FinallyTok = new FinallyTok()
			finatk::Line = tok::Line
			finatk::Value = tok::Value
			tok = finatk
			goto fin
		end if
		
		if tok::Value = "until" then
			var untk as UntilTok = new UntilTok()
			untk::Line = tok::Line
			untk::Value = tok::Value
			tok = untk
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "while" then
			var whtk as WhileTok = new WhileTok()
			whtk::Line = tok::Line
			whtk::Value = tok::Value
			tok = whtk
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "elseif" then
			var eliftk as ElseIfTok = new ElseIfTok()
			eliftk::Line = tok::Line
			eliftk::Value = tok::Value
			tok = eliftk
			PFlags::IfFlag = true
			goto fin
		end if
		
		if tok::Value = "else" then
			var elsetk as ElseTok = new ElseTok()
			elsetk::Line = tok::Line
			elsetk::Value = tok::Value
			tok = elsetk
			goto fin
		end if
		
		if tok::Value = "do" then
			var dotk as DoTok = new DoTok()
			dotk::Line = tok::Line
			dotk::Value = tok::Value
			tok = dotk
			goto fin
		end if
		
		if tok::Value = "break" then
			var brktk as BreakTok = new BreakTok()
			brktk::Line = tok::Line
			brktk::Value = tok::Value
			tok = brktk
			goto fin
		end if
		
		if tok::Value = "continue" then
			var conttk as ContinueTok = new ContinueTok()
			conttk::Line = tok::Line
			conttk::Value = tok::Value
			tok = conttk
			goto fin
		end if
		
		if tok::Value = "then" then
			var thentk as ThenTok = new ThenTok()
			thentk::Line = tok::Line
			thentk::Value = tok::Value
			tok = thentk
			PFlags::IfFlag = false
			goto fin
		end if
		
		if tok::Value = "new" then
			var newtk as NewTok = new NewTok()
			newtk::Line = tok::Line
			newtk::Value = tok::Value
			tok = newtk
			goto fin
		end if
		
		if tok::Value = "newarr" then
			var newatk as NewarrTok = new NewarrTok()
			newatk::Line = tok::Line
			newatk::Value = tok::Value
			tok = newatk
			goto fin
		end if
		
		if tok::Value = "me" then
			var metk as MeTok = new MeTok()
			metk::Line = tok::Line
			metk::Value = tok::Value
			tok = metk
			goto fin
		end if
		
		if tok::Value = "namespace" then
			var nstk as NamespaceTok = new NamespaceTok()
			nstk::Line = tok::Line
			nstk::Value = tok::Value
			tok = nstk
			goto fin
		end if
		
		if tok::Value = "ptr" then
			var ptrtk as PtrTok = new PtrTok()
			ptrtk::Line = tok::Line
			ptrtk::Value = tok::Value
			tok = ptrtk
			goto fin
		end if
		
		if tok::Value = "gettype" then
			var gttk as GettypeTok = new GettypeTok()
			gttk::Line = tok::Line
			gttk::Value = tok::Value
			tok = gttk
			goto fin
		end if
		
		if tok::Value = "ref" then
			var rftk as RefTok = new RefTok()
			rftk::Line = tok::Line
			rftk::Value = tok::Value
			tok = rftk
			goto fin
		end if
		
		if tok::Value = "valinref" then
			var vrftk as ValInRefTok = new ValInRefTok()
			vrftk::Line = tok::Line
			vrftk::Value = tok::Value
			tok = vrftk
			goto fin
		end if
		
		if tok::Value = "#refasm" then
			var ratk as RefasmTok = new RefasmTok()
			ratk::Line = tok::Line
			ratk::Value = tok::Value
			tok = ratk
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "#refstdasm" then
			var rsatk as RefstdasmTok = new RefstdasmTok()
			rsatk::Line = tok::Line
			rsatk::Value = tok::Value
			tok = rsatk
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "#debug" then
			var dgtk as DebugTok = new DebugTok()
			dgtk::Line = tok::Line
			dgtk::Value = tok::Value
			tok = dgtk
			goto fin
		end if
		
		if tok::Value = "#include" then
			var inclutk as IncludeTok = new IncludeTok()
			inclutk::Line = tok::Line
			inclutk::Value = tok::Value
			tok = inclutk
			goto fin
		end if
		
		if tok::Value = "#scope" then
			var scptk as ScopeTok = new ScopeTok()
			scptk::Line = tok::Line
			scptk::Value = tok::Value
			tok = scptk
			goto fin
		end if
		
		if tok::Value = "import" then
			var imptk as ImportTok = new ImportTok()
			imptk::Line = tok::Line
			imptk::Value = tok::Value
			tok = imptk
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "locimport" then
			var limptk as LocimportTok = new LocimportTok()
			limptk::Line = tok::Line
			limptk::Value = tok::Value
			tok = limptk
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "assembly" then
			if isFirstToken then
				var asmtk as AssemblyTok = new AssemblyTok()
				asmtk::Line = tok::Line
				asmtk::Value = tok::Value
				tok = asmtk
			else
				var asmattr as AssemblyAttr = new AssemblyAttr()
				asmattr::Line = tok::Line
				asmattr::Value = tok::Value
				tok = asmattr
			end if
			goto fin
		end if
		
		if tok::Value = "ver" then
			var vertk as VerTok = new VerTok()
			vertk::Line = tok::Line
			vertk::Value = tok::Value
			tok = vertk
			PFlags::NoOptFlag = true
			goto fin
		end if
		
		if tok::Value = "on" then
			var ontk as OnTok = new OnTok()
			ontk::Line = tok::Line
			ontk::Value = tok::Value
			tok = ontk
			goto fin
		end if
		
		if tok::Value = "off" then
			var offtk as OffTok = new OffTok()
			offtk::Line = tok::Line
			offtk::Value = tok::Value
			tok = offtk
			goto fin
		end if
		
		if tok::Value = "exe" then
			var extk as ExeTok = new ExeTok()
			extk::Line = tok::Line
			extk::Value = tok::Value
			tok = extk
			goto fin
		end if
		
		if tok::Value = "dll" then
			var dltk as DllTok = new DllTok()
			dltk::Line = tok::Line
			dltk::Value = tok::Value
			tok = dltk
			goto fin
		end if
		
		if tok::Value = "field" then
			var fltk as FieldTok = new FieldTok()
			fltk::Line = tok::Line
			fltk::Value = tok::Value
			tok = fltk
			goto fin
		end if
		
		if tok::Value = "class" then
			var cltk as ClassTok = new ClassTok()
			cltk::Line = tok::Line
			cltk::Value = tok::Value
			tok = cltk
			goto fin
		end if
		
		if tok::Value = "delegate" then
			var deltk as DelegateTok = new DelegateTok()
			deltk::Line = tok::Line
			deltk::Value = tok::Value
			tok = deltk
			goto fin
		end if
		
		if tok::Value = "extends" then
			var exttk as ExtendsTok = new ExtendsTok()
			exttk::Line = tok::Line
			exttk::Value = tok::Value
			tok = exttk
			goto fin
		end if
		
		if tok::Value = "implements" then
			var impltk as ImplementsTok = new ImplementsTok()
			impltk::Line = tok::Line
			impltk::Value = tok::Value
			tok = impltk
			goto fin
		end if
		
		if tok::Value = "method" then
			var mettk as MethodTok = new MethodTok()
			mettk::Line = tok::Line
			mettk::Value = tok::Value
			tok = mettk
			goto fin
		end if
		
		if tok::Value = "end" then
			var entk as EndTok = new EndTok()
			entk::Line = tok::Line
			entk::Value = tok::Value
			tok = entk
			goto fin
		end if
		
		if tok::Value = "return" then
			var rettk as ReturnTok = new ReturnTok()
			rettk::Line = tok::Line
			rettk::Value = tok::Value
			tok = rettk
			goto fin
		end if
		
		if tok::Value = "throw" then
			var thrtk as ThrowTok = new ThrowTok()
			thrtk::Line = tok::Line
			thrtk::Value = tok::Value
			tok = thrtk
			goto fin
		end if
		
		if tok::Value = "var" then
			var vrtk as VarTok = new VarTok()
			vrtk::Line = tok::Line
			vrtk::Value = tok::Value
			tok = vrtk
			goto fin
		end if
		
		if tok::Value = "catch" then
			var cattk as CatchTok = new CatchTok()
			cattk::Line = tok::Line
			cattk::Value = tok::Value
			tok = cattk
			goto fin
		end if
		
		if tok::Value = "as" then
			var astk as AsTok = new AsTok()
			astk::Line = tok::Line
			astk::Value = tok::Value
			tok = astk
			goto fin
		end if
		
		if tok::Value = "of" then
			var oftk as OfTok = new OfTok()
			oftk::Line = tok::Line
			oftk::Value = tok::Value
			tok = oftk
			goto fin
		end if
		
		if tok::Value = "private" then
			var privattr as PrivateAttr = new PrivateAttr()
			privattr::Line = tok::Line
			privattr::Value = tok::Value
			tok = privattr
			goto fin
		end if
		
		if tok::Value = "public" then
			var pubattr as PublicAttr = new PublicAttr()
			pubattr::Line = tok::Line
			pubattr::Value = tok::Value
			tok = pubattr
			goto fin
		end if
		
		if tok::Value = "initonly" then
			var initoattr as InitOnlyAttr = new InitOnlyAttr()
			initoattr::Line = tok::Line
			initoattr::Value = tok::Value
			tok = initoattr
			goto fin
		end if
		
		if tok::Value = "static" then
			var statattr as StaticAttr = new StaticAttr()
			statattr::Line = tok::Line
			statattr::Value = tok::Value
			tok = statattr
			goto fin
		end if
		
		if tok::Value = "specialname" then
			var spnattr as SpecialNameAttr = new SpecialNameAttr()
			spnattr::Line = tok::Line
			spnattr::Value = tok::Value
			tok = spnattr
			goto fin
		end if
		
		if tok::Value = "sealed" then
			var sealattr as SealedAttr = new SealedAttr()
			sealattr::Line = tok::Line
			sealattr::Value = tok::Value
			tok = sealattr
			goto fin
		end if
		
		if tok::Value = "final" then
			var finaattr as FinalAttr = new FinalAttr()
			finaattr::Line = tok::Line
			finaattr::Value = tok::Value
			tok = finaattr
			goto fin
		end if
		
		if tok::Value = "hidebysig" then
			var hbsattr as HideBySigAttr = new HideBySigAttr()
			hbsattr::Line = tok::Line
			hbsattr::Value = tok::Value
			tok = hbsattr
			goto fin
		end if
		
		if tok::Value = "family" then
			var famattr as FamilyAttr = new FamilyAttr()
			famattr::Line = tok::Line
			famattr::Value = tok::Value
			tok = famattr
			goto fin
		end if
		
		if tok::Value = "famorassem" then
			var famoaattr as FamORAssemAttr = new FamORAssemAttr()
			famoaattr::Line = tok::Line
			famoaattr::Value = tok::Value
			tok = famoaattr
			goto fin
		end if
		
		if tok::Value = "famandassem" then
			var famaaattr as FamANDAssemAttr = new FamANDAssemAttr()
			famaaattr::Line = tok::Line
			famaaattr::Value = tok::Value
			tok = famaaattr
			goto fin
		end if
		
		if tok::Value = "virtual" then
			var virtattr as VirtualAttr = new VirtualAttr()
			virtattr::Line = tok::Line
			virtattr::Value = tok::Value
			tok = virtattr
			goto fin
		end if
		
		if tok::Value = "abstract" then
			var absattr as AbstractAttr = new AbstractAttr()
			absattr::Line = tok::Line
			absattr::Value = tok::Value
			tok = absattr
			goto fin
		end if
		
		if tok::Value = "interface" then
			var interfattr as InterfaceAttr = new InterfaceAttr()
			interfattr::Line = tok::Line
			interfattr::Value = tok::Value
			tok = interfattr
			goto fin
		end if
		
		if tok::Value = "newslot" then
			var nsloattr as NewSlotAttr = new NewSlotAttr()
			nsloattr::Line = tok::Line
			nsloattr::Value = tok::Value
			tok = nsloattr
			goto fin
		end if
		
		if tok::Value = "auto" then
			var autattr as AutoLayoutAttr = new AutoLayoutAttr()
			autattr::Line = tok::Line
			autattr::Value = tok::Value
			tok = autattr
			goto fin
		end if
		
		if tok::Value = "autochar" then
			var autcattr as AutoClassAttr = new AutoClassAttr()
			autcattr::Line = tok::Line
			autcattr::Value = tok::Value
			tok = autcattr
			goto fin
		end if
		
		if tok::Value = "ansi" then
			var ansattr as AnsiClassAttr = new AnsiClassAttr()
			ansattr::Line = tok::Line
			ansattr::Value = tok::Value
			tok = ansattr
			goto fin
		end if
		
		if tok::Value = "beforefieldinit" then
			var bfiattr as BeforeFieldInitAttr = new BeforeFieldInitAttr()
			bfiattr::Line = tok::Line
			bfiattr::Value = tok::Value
			tok = bfiattr
			goto fin
		end if
		
		if tok::Value = "string" then
			var strtok as StringTok = new StringTok(tok::Value)
			strtok::Line = tok::Line
			tok = strtok
			goto fin
		end if
	
		if tok::Value = "void" then
			var voidtok as VoidTok = new VoidTok(tok::Value)
			voidtok::Line = tok::Line
			tok = voidtok
			goto fin
		end if
		
		if tok::Value = "decimal" then
			var decitok as DecimalTok = new DecimalTok(tok::Value)
			decitok::Line = tok::Line
			tok = decitok
			goto fin
		end if
		
		if tok::Value = "integer" then
			var inttok as IntegerTok = new IntegerTok(tok::Value)
			inttok::Line = tok::Line
			tok = inttok
			goto fin
		end if
		
		if tok::Value = "intptr" then
			var intptok as IntPtrTok = new IntPtrTok(tok::Value)
			intptok::Line = tok::Line
			tok = intptok
			goto fin
		end if
		
		if tok::Value = "uinteger" then
			var uinttok as UIntegerTok = new UIntegerTok(tok::Value)
			uinttok::Line = tok::Line
			tok = uinttok
			goto fin
		end if
		
		if tok::Value = "double" then
			var dbltok as DoubleTok = new DoubleTok(tok::Value)
			dbltok::Line = tok::Line
			tok = dbltok
			goto fin
		end if
		
		if tok::Value = "boolean" then
			var booltok as BooleanTok = new BooleanTok(tok::Value)
			booltok::Line = tok::Line
			tok = booltok
			goto fin
		end if
		
		if tok::Value = "char" then
			var chrtok as CharTok = new CharTok(tok::Value)
			chrtok::Line = tok::Line
			tok = chrtok
			goto fin
		end if
		
		if tok::Value = "single" then
			var sngtok as SingleTok = new SingleTok(tok::Value)
			sngtok::Line = tok::Line
			tok = sngtok
			goto fin
		end if
		
		if tok::Value = "sbyte" then
			var sbytok as SByteTok = new SByteTok(tok::Value)
			sbytok::Line = tok::Line
			tok = sbytok
			goto fin
		end if
		
		if tok::Value = "byte" then
			var byttok as ByteTok = new ByteTok(tok::Value)
			byttok::Line = tok::Line
			tok = byttok
			goto fin
		end if
		
		if tok::Value = "short" then
			var shtok as ShortTok = new ShortTok(tok::Value)
			shtok::Line = tok::Line
			tok = shtok
			goto fin
		end if
		
		if tok::Value = "ushort" then
			var ushtok as UShortTok = new UShortTok(tok::Value)
			ushtok::Line = tok::Line
			tok = ushtok
			goto fin
		end if
		
		if tok::Value = "long" then
			var lngtok as LongTok = new LongTok(tok::Value)
			lngtok::Line = tok::Line
			tok = lngtok
			goto fin
		end if
		
		if tok::Value = "ulong" then
			var ulngtok as ULongTok = new ULongTok(tok::Value)
			ulngtok::Line = tok::Line
			tok = ulngtok
			goto fin
		end if
		
		if tok::Value = "object" then
			var objtok as ObjectTok = new ObjectTok(tok::Value)
			objtok::Line = tok::Line
			tok = objtok
			goto fin
		end if
		
		if tok::Value like "^//(.)*$" then
			var comtok as CommentTok = new CommentTok()
			comtok::Line = tok::Line
			comtok::Value = tok::Value
			tok = comtok
			PFlags::CmtFlag = true
			goto fin
		end if
		
		if tok::Value = "null" then
			var nulllit as NullLiteral = new NullLiteral(tok::Value)
			nulllit::Line = tok::Line
			tok = nulllit
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
		
		if tok::Value like "^'(.)*'$" then
			tmpchrarr[0] = $char$"'"
			var chrlit as CharLiteral = new CharLiteral($char$tok::Value::Trim(tmpchrarr))
			chrlit::Line = tok::Line
			tok = chrlit
			goto fin
		end if
		
		if tok::Value like ("^" + Utils.Constants::quot + "(.)*" + Utils.Constants::quot + "$") then
			tmpchrarr[0] = $char$Utils.Constants::quot
			var strlit as StringLiteral = new StringLiteral(tok::Value::Trim(tmpchrarr))
			strlit::Line = tok::Line
			tok = strlit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$")
		compb = tok::Value::EndsWith("d")
		
		if orflg and compb then
			tmpchrarr[0] = 'd'
			var dlit2 as DoubleLiteral = new DoubleLiteral($double$tok::Value::TrimEnd(tmpchrarr))
			dlit2::Line = tok::Line
			tok = dlit2
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$")
		compb = tok::Value::EndsWith("f")
		
		if orflg and compb then
			tmpchrarr[0] = 'f'
			var flit as FloatLiteral = new FloatLiteral($single$tok::Value::TrimEnd(tmpchrarr))
			flit::Line = tok::Line
			tok = flit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$")
		compb = tok::Value::EndsWith("m")
		
		if orflg and compb then
			tmpchrarr[0] = 'm'
			var delit as DecimalLiteral = new DecimalLiteral($decimal$tok::Value::TrimEnd(tmpchrarr))
			delit::Line = tok::Line
			tok = delit
			goto fin
		end if
		
		if (tok::Value like "^(\d)+\.(\d)+(.)*$") or (tok::Value like "^\+(\d)+\.(\d)+(.)*$") or (tok::Value like "^-(\d)+\.(\d)+(.)*$") then
			var dlit as DoubleLiteral = new DoubleLiteral($double$tok::Value)
			dlit::Line = tok::Line
			tok = dlit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("d")
		
		if orflg and compb then
			tmpchrarr[0] = 'd'
			var dlit3 as DoubleLiteral = new DoubleLiteral($double$tok::Value::TrimEnd(tmpchrarr))
			dlit3::Line = tok::Line
			tok = dlit3
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("f")
		
		if orflg and compb then
			tmpchrarr[0] = 'f'
			var flit2 as FloatLiteral = new FloatLiteral($single$tok::Value::TrimEnd(tmpchrarr))
			flit2::Line = tok::Line
			tok = flit2
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("m")
		
		if orflg and compb then
			tmpchrarr[0] = 'm'
			var delit2 as DecimalLiteral = new DecimalLiteral($decimal$tok::Value::TrimEnd(tmpchrarr))
			delit2::Line = tok::Line
			tok = delit2
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("ui")
		
		if orflg and compb then
			tmpchrarr[0] = 'i'
			tok::Value = tok::Value::TrimEnd(tmpchrarr)
			tmpchrarr[0] = 'u'
			var uilit2 as UIntLiteral = new UIntLiteral($uinteger$tok::Value::TrimEnd(tmpchrarr))
			uilit2::Line = tok::Line
			tok = uilit2
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("ip")
		
		if orflg and compb then
			var iplit2 as IntPtrLiteral = new IntPtrLiteral()
			iplit2::Line = tok::Line
			tmpchrarr[0] = 'p'
			tok::Value = tok::Value::TrimEnd(tmpchrarr)
			tmpchrarr[0] = 'i'
			tok::Value = tok::Value::TrimEnd(tmpchrarr)
			iplit2::Value = tok::Value
			iplit2::NumVal = new IntPtr($integer$iplit2::Value)
			tok = iplit2
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("i")
		
		if orflg and compb then
			tmpchrarr[0] = 'i'
			var ilit2 as IntLiteral = new IntLiteral($integer$tok::Value::TrimEnd(tmpchrarr))
			ilit2::Line = tok::Line
			tok = ilit2
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("ul")
		
		if orflg and compb then
			tmpchrarr[0] = 'l'
			tok::Value = tok::Value::TrimEnd(tmpchrarr)
			tmpchrarr[0] = 'u'
			var ullit as ULongLiteral = new ULongLiteral($ulong$tok::Value::TrimEnd(tmpchrarr))
			ullit::Line = tok::Line
			tok = ullit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("l")
		
		if orflg and compb then
			tmpchrarr[0] = 'l'
			var llit as LongLiteral = new LongLiteral($long$tok::Value::TrimEnd(tmpchrarr))
			llit::Line = tok::Line
			tok = llit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("us")
		
		if orflg and compb then
			tmpchrarr[0] = 's'
			tok::Value = tok::Value::TrimEnd(tmpchrarr)
			tmpchrarr[0] = 'u'
			var uslit as UShortLiteral = new UShortLiteral($ushort$tok::Value::TrimEnd(tmpchrarr))
			uslit::Line = tok::Line
			tok = uslit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("s")
		
		if orflg and compb then
			tmpchrarr[0] = 's'
			var slit as ShortLiteral = new ShortLiteral($short$tok::Value::TrimEnd(tmpchrarr))
			slit::Line = tok::Line
			tok = slit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("ub")
		
		if orflg and compb then
			tmpchrarr[0] = 'b'
			tok::Value = tok::Value::TrimEnd(tmpchrarr)
			tmpchrarr[0] = 'u'
			var ublit as ByteLiteral = new ByteLiteral($byte$tok::Value::TrimEnd(tmpchrarr))
			ublit::Line = tok::Line
			tok = ublit
			goto fin
		end if
		
		orflg = (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$")
		compb = tok::Value::EndsWith("b")
		
		if orflg and compb then
			tmpchrarr[0] = 'b'
			var blit as SByteLiteral = new SByteLiteral($sbyte$tok::Value::TrimEnd(tmpchrarr))
			blit::Line = tok::Line
			tok = blit
			goto fin
		end if
		
		if (tok::Value like "^(\d)+(.)*$") or (tok::Value like "^\+(\d)+(.)*$") or (tok::Value like "^-(\d)+(.)*$") then
			var ilit as IntLiteral = new IntLiteral($integer$tok::Value)
			ilit::Line = tok::Line
			tok = ilit
			goto fin
		end if
		
		if (tok::Value like "^([a-zA-Z])+(.)*$") or (tok::Value like "^_(.)*([a-zA-Z])+(.)*$") or (tok::Value like "^::(.)*([a-zA-Z])+(.)*$") then
			var idt as Ident = new Ident(tok::Value)
			idt::Line = tok::Line
			tok = idt
			goto fin
		end if
		
		place fin
		
		if isFirstToken then
			isFirstToken = false
		end if
		
		return tok
		
	end method

end class
