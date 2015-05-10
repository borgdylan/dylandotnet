//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//class public NewarrTok extends Token
//
//	method public override string ToString()
//		return "newarr"
//	end method
//
//end class

class public NewTok extends Token
	method public override string ToString() => "new"
end class

class public GettypeTok extends Token
	method public override string ToString() => "gettype"
end class

class public DefaultTok extends Token
	method public override string ToString() => "default"
end class

class public WhereTok extends NonExprToken
	method public override string ToString() => "where"
end class

class public RefTok extends Token
	method public override string ToString() => "ref"
end class

class public ValInRefTok extends Token
	method public override string ToString() => "valinref"
end class

class public abstract SwitchTok extends NonExprToken
end class

class public OnTok extends SwitchTok
	method public override string ToString() => "on"
end class

class public OfTok extends Token
	method public override string ToString() => "of"
end class

class public OffTok extends SwitchTok
	method public override string ToString() => "off"
end class

class public ScopeTok extends NonExprToken
	method public override string ToString() => "#scope"
end class

class public DebugTok extends NonExprToken
	method public override string ToString() => "#debug"
end class

class public RefasmTok extends NonExprToken
	method public override string ToString() => "#refasm"
end class

//class public RefembedasmTok extends NonExprToken
//
//	method public override string ToString()
//		return "#refembedasm"
//	end method
//
//end class

class public EmbedTok extends NonExprToken
	method public override string ToString() => "#embed"
end class

class public RefstdasmTok extends NonExprToken
	method public override string ToString() => "#refstdasm"
end class

class public ImportTok extends NonExprToken
	method public override string ToString() => "import"
end class

class public LocimportTok extends NonExprToken
	method public override string ToString() => "locimport"
end class

class public AssemblyTok extends NonExprToken
	method public override string ToString() => "assembly"
end class

class public AssemblyCTok extends NonExprToken
	method public override string ToString() => "assembly:"
end class

class public ExeTok extends NonExprToken
	method public override string ToString() => "exe"
end class

class public DllTok extends NonExprToken
	method public override string ToString() => "dll"
end class

class public WinexeTok extends NonExprToken
	method public override string ToString() => "winexe"
end class

class public VerTok extends NonExprToken
	method public override string ToString() => "ver"
end class

class public IncludeTok extends NonExprToken
	method public override string ToString() => "#include"
end class

class public SignTok extends NonExprToken
	method public override string ToString() => "#sign"
end class


class public NamespaceTok extends NonExprToken
	method public override string ToString() => "namespace"
end class

class public ClassTok extends NonExprToken
	method public override string ToString() => "class"
end class

class public ClassCTok extends NonExprToken
	method public override string ToString() => "class:"
end class

class public StructTok extends NonExprToken
	method public override string ToString() => "struct"
end class

class public InterfaceTok extends NonExprToken
	method public override string ToString() => "interface"
end class

class public ExtendsTok extends NonExprToken
	method public override string ToString() => "extends"
end class

class public ImplementsTok extends NonExprToken
	method public override string ToString() => "implements"
end class

class public EnumTok extends NonExprToken
	method public override string ToString() => "enum"
end class

class public EnumCTok extends NonExprToken
	method public override string ToString() => "enum:"
end class

class public FieldTok extends NonExprToken
	method public override string ToString() => "field"
end class

class public FieldCTok extends NonExprToken
	method public override string ToString() => "field:"
end class

class public DelegateTok extends NonExprToken
	method public override string ToString() => "delegate"
end class

class public PropertyTok extends NonExprToken
	method public override string ToString() => "property"
end class

class public PropertyCTok extends NonExprToken
	method public override string ToString() => "property:"
end class

class public EventTok extends NonExprToken
	method public override string ToString() => "event"
end class

class public EventCTok extends NonExprToken
	method public override string ToString() => "event:"
end class


class public GetTok extends NonExprToken
	method public override string ToString() => "get"
end class

class public SetTok extends NonExprToken
	method public override string ToString() => "set"
end class

class public AddTok extends NonExprToken
	method public override string ToString() => "add"
end class

class public RemoveTok extends NonExprToken
	method public override string ToString() => "remove"
end class


class public MethodTok extends NonExprToken
	method public override string ToString() => "method"
end class

class public MethodCTok extends NonExprToken
	method public override string ToString() => "method:"
end class

class public TryTok extends NonExprToken
	method public override string ToString() => "try"
end class

class public CatchTok extends NonExprToken
	method public override string ToString() => "catch"
end class

class public AsTok extends NonExprToken
	method public override string ToString() => "as"
end class

class public FinallyTok extends NonExprToken
	method public override string ToString() => "finally"
end class

//class public LabelTok extends NonExprToken
//
//	method public override string ToString()
//		return "label"
//	end method
//
//end class
//
//class public PlaceTok extends NonExprToken
//
//	method public override string ToString()
//		return "place"
//	end method
//
//end class
//
//class public GotoTok extends NonExprToken
//
//	method public override string ToString()
//		return "goto"
//	end method
//
//end class

class public IfTok extends NonExprToken
	method public override string ToString() => "if"
end class

class public HIfTok extends NonExprToken
	method public override string ToString() => "#if"
end class

class public ElseIfTok extends NonExprToken
	method public override string ToString() => "elseif"
end class

class public HElseIfTok extends NonExprToken
	method public override string ToString() => "#elseif"
end class


class public ThenTok extends NonExprToken
	method public override string ToString() => "then"
end class

class public DoTok extends NonExprToken
	method public override string ToString() => "do"
end class

class public ForTok extends NonExprToken
	method public override string ToString() => "for"
end class

class public UptoTok extends NonExprToken
	method public override string ToString() => "upto"
end class

class public DowntoTok extends NonExprToken
	method public override string ToString() => "downto"
end class

class public StepTok extends NonExprToken
	method public override string ToString() => "step"
end class

class public ForeachTok extends NonExprToken
	method public override string ToString() => "foreach"
end class

class public BreakTok extends NonExprToken
	method public override string ToString() => "break"
end class

class public ContinueTok extends NonExprToken
	method public override string ToString() => "continue"
end class

class public WhileTok extends NonExprToken
	method public override string ToString() => "while"
end class

class public UntilTok extends NonExprToken
	method public override string ToString() => "until"
end class

class public LiteralTok extends NonExprToken
	method public override string ToString() => "literal"
end class

class public VarTok extends NonExprToken
	method public override string ToString() => "var"
end class

class public UsingTok extends NonExprToken
	method public override string ToString() => "using"
end class

class public ElseTok extends NonExprToken
	method public override string ToString() => "else"
end class

class public HElseTok extends NonExprToken
	method public override string ToString() => "#else"
end class

class public TernaryTok extends Token
	method public override string ToString() => "#ternary"
end class

class public HDefineTok extends NonExprToken
	method public override string ToString() => "#define"
end class

class public HUndefTok extends NonExprToken
	method public override string ToString() => "#undef"
end class

class public ErrorTok extends NonExprToken
	method public override string ToString() => "#error"
end class

class public WarningTok extends NonExprToken
	method public override string ToString() => "#warning"
end class

class public ReturnTok extends NonExprToken
	method public override string ToString() => "return"
end class

class public ThrowTok extends NonExprToken
	method public override string ToString() => "throw"
end class

class public EndTok extends NonExprToken
	method public override string ToString() => "end"
end class

class public InTok extends NonExprToken
	method public override string ToString() => "in"
end class

class public OutTok extends NonExprToken
	method public override string ToString() => "out"
end class

class public InOutTok extends NonExprToken
	method public override string ToString() => "inout"
end class

class public LockTok extends NonExprToken
	method public override string ToString() => "lock"
end class

class public TryLockTok extends NonExprToken
	method public override string ToString() => "trylock"
end class

class public ExprTok extends Token
	method public override string ToString() => "#expr"
end class

class public RegionTok extends NonExprToken
	method public override string ToString() => "#region"
end class

class public MeTok extends ValueToken implements IUnaryOperatable, IConvable

	field public boolean _Conv
	field public TypeTok _TTok
	field private string _OrdOp

	method public void MeTok()
		mybase::ctor()
		_Conv = false
		_TTok = null
		_OrdOp = string::Empty
	end method

	method public void MeTok(var value as string)
		mybase::ctor(value)
		_Conv = false
		_TTok = null
		_OrdOp = string::Empty
	end method
	
	method public override string ToString() => #ternary{_Conv ? "$" + _TTok::ToString() + "$me", "me"}
	
	property public virtual string OrdOp
		get
			return _OrdOp
		end get
		set
			_OrdOp = value
		end set
	end property
	
	property public virtual boolean Conv
		get
			return _Conv
		end get
		set
			_Conv = value
		end set
	end property
	
	property public virtual TypeTok TTok
		get
			return _TTok
		end get
		set
			_TTok = value
		end set
	end property
	
end class

class public ParameterCTok extends NonExprToken
	method public override string ToString() => Value
end class
