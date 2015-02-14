//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public NewarrTok extends Token

	method public override string ToString()
		return "newarr"
	end method

end class

class public NewTok extends Token

	method public override string ToString()
		return "new"
	end method

end class

class public GettypeTok extends Token

	method public override string ToString()
		return "gettype"
	end method

end class

class public DefaultTok extends Token

	method public override string ToString()
		return "default"
	end method

end class

class public WhereTok extends NonExprToken

	method public override string ToString()
		return "where"
	end method

end class

class public RefTok extends Token

	method public override string ToString()
		return "ref"
	end method

end class

class public ValInRefTok extends Token

	method public override string ToString()
		return "valinref"
	end method

end class

class public abstract SwitchTok extends NonExprToken
end class

class public OnTok extends SwitchTok

	method public override string ToString()
		return "on"
	end method

end class

class public OfTok extends Token

	method public override string ToString()
		return "of"
	end method

end class

class public OffTok extends SwitchTok

	method public override string ToString()
		return "off"
	end method

end class

class public ScopeTok extends NonExprToken

	method public override string ToString()
		return "#scope"
	end method

end class

class public DebugTok extends NonExprToken

	method public override string ToString()
		return "#debug"
	end method

end class

class public RefasmTok extends NonExprToken

	method public override string ToString()
		return "#refasm"
	end method

end class

//class public RefembedasmTok extends NonExprToken
//
//	method public override string ToString()
//		return "#refembedasm"
//	end method
//
//end class

class public EmbedTok extends NonExprToken

	method public override string ToString()
		return "#embed"
	end method

end class

class public RefstdasmTok extends NonExprToken

	method public override string ToString()
		return "#refstdasm"
	end method

end class

class public ImportTok extends NonExprToken

	method public override string ToString()
		return "import"
	end method

end class

class public LocimportTok extends NonExprToken

	method public override string ToString()
		return "locimport"
	end method

end class

class public AssemblyTok extends NonExprToken

	method public override string ToString()
		return "assembly"
	end method

end class

class public AssemblyCTok extends NonExprToken

	method public override string ToString()
		return "assembly:"
	end method

end class

class public ExeTok extends NonExprToken

	method public override string ToString()
		return "exe"
	end method

end class

class public DllTok extends NonExprToken

	method public override string ToString()
		return "dll"
	end method

end class

class public WinexeTok extends NonExprToken

	method public override string ToString()
		return "winexe"
	end method

end class

class public VerTok extends NonExprToken

	method public override string ToString()
		return "ver"
	end method

end class

class public IncludeTok extends NonExprToken

	method public override string ToString()
		return "#include"
	end method

end class

class public SignTok extends NonExprToken

	method public override string ToString()
		return "#sign"
	end method

end class


class public NamespaceTok extends NonExprToken

	method public override string ToString()
		return "namespace"
	end method

end class

class public ClassTok extends NonExprToken

	method public override string ToString()
		return "class"
	end method

end class

class public ClassCTok extends NonExprToken

	method public override string ToString()
		return "class:"
	end method

end class

class public StructTok extends NonExprToken

	method public override string ToString()
		return "struct"
	end method

end class

class public InterfaceTok extends NonExprToken

	method public override string ToString()
		return "interface"
	end method

end class

class public ExtendsTok extends NonExprToken

	method public override string ToString()
		return "extends"
	end method

end class

class public ImplementsTok extends NonExprToken

	method public override string ToString()
		return "implements"
	end method

end class

class public EnumTok extends NonExprToken

	method public override string ToString()
		return "enum"
	end method

end class

class public EnumCTok extends NonExprToken

	method public override string ToString()
		return "enum:"
	end method

end class

class public FieldTok extends NonExprToken

	method public override string ToString()
		return "field"
	end method

end class

class public FieldCTok extends NonExprToken

	method public override string ToString()
		return "field:"
	end method

end class

class public DelegateTok extends NonExprToken

	method public override string ToString()
		return "delegate"
	end method

end class

class public PropertyTok extends NonExprToken

	method public override string ToString()
		return "property"
	end method

end class

class public PropertyCTok extends NonExprToken

	method public override string ToString()
		return "property:"
	end method

end class

class public EventTok extends NonExprToken

	method public override string ToString()
		return "event"
	end method

end class

class public EventCTok extends NonExprToken

	method public override string ToString()
		return "event:"
	end method

end class


class public GetTok extends NonExprToken

	method public override string ToString()
		return "get"
	end method

end class

class public SetTok extends NonExprToken

	method public override string ToString()
		return "set"
	end method

end class

class public AddTok extends NonExprToken

	method public override string ToString()
		return "add"
	end method

end class

class public RemoveTok extends NonExprToken

	method public override string ToString()
		return "remove"
	end method

end class


class public MethodTok extends NonExprToken

	method public override string ToString()
		return "method"
	end method

end class

class public MethodCTok extends NonExprToken

	method public override string ToString()
		return "method:"
	end method

end class

class public TryTok extends NonExprToken

	method public override string ToString()
		return "try"
	end method

end class

class public CatchTok extends NonExprToken

	method public override string ToString()
		return "catch"
	end method

end class

class public AsTok extends NonExprToken

	method public override string ToString()
		return "as"
	end method

end class

class public FinallyTok extends NonExprToken

	method public override string ToString()
		return "finally"
	end method

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

	method public override string ToString()
		return "if"
	end method

end class

class public HIfTok extends NonExprToken

	method public override string ToString()
		return "#if"
	end method

end class

class public ElseIfTok extends NonExprToken

	method public override string ToString()
		return "elseif"
	end method

end class

class public HElseIfTok extends NonExprToken

	method public override string ToString()
		return "#elseif"
	end method

end class


class public ThenTok extends NonExprToken

	method public override string ToString()
		return "then"
	end method

end class

class public DoTok extends NonExprToken

	method public override string ToString()
		return "do"
	end method

end class

class public ForTok extends NonExprToken

	method public override string ToString()
		return "for"
	end method

end class

class public UptoTok extends NonExprToken

	method public override string ToString()
		return "upto"
	end method

end class

class public DowntoTok extends NonExprToken

	method public override string ToString()
		return "downto"
	end method

end class

class public StepTok extends NonExprToken

	method public override string ToString()
		return "step"
	end method

end class

class public ForeachTok extends NonExprToken

	method public override string ToString()
		return "foreach"
	end method

end class

class public BreakTok extends NonExprToken

	method public override string ToString()
		return "break"
	end method

end class

class public ContinueTok extends NonExprToken

	method public override string ToString()
		return "continue"
	end method

end class

class public WhileTok extends NonExprToken

	method public override string ToString()
		return "while"
	end method

end class

class public UntilTok extends NonExprToken

	method public override string ToString()
		return "until"
	end method

end class

class public LiteralTok extends NonExprToken

	method public override string ToString()
		return "literal"
	end method

end class

class public VarTok extends NonExprToken

	method public override string ToString()
		return "var"
	end method
	
end class

class public UsingTok extends NonExprToken

	method public override string ToString()
		return "using"
	end method
	
end class

class public ElseTok extends NonExprToken

	method public override string ToString()
		return "else"
	end method

end class

class public HElseTok extends NonExprToken

	method public override string ToString()
		return "#else"
	end method

end class

class public TernaryTok extends Token

	method public override string ToString()
		return "#ternary"
	end method

end class

class public HDefineTok extends NonExprToken

	method public override string ToString()
		return "#define"
	end method

end class

class public HUndefTok extends NonExprToken

	method public override string ToString()
		return "#undef"
	end method

end class

class public ErrorTok extends NonExprToken

	method public override string ToString()
		return "#error"
	end method

end class

class public WarningTok extends NonExprToken

	method public override string ToString()
		return "#warning"
	end method

end class

class public ReturnTok extends NonExprToken

	method public override string ToString()
		return "return"
	end method

end class

class public ThrowTok extends NonExprToken

	method public override string ToString()
		return "throw"
	end method
	
end class

class public EndTok extends NonExprToken
	
	method public override string ToString()
		return "end"
	end method

end class

class public InTok extends NonExprToken

	method public override string ToString()
		return "in"
	end method

end class

class public OutTok extends NonExprToken

	method public override string ToString()
		return "out"
	end method

end class

class public InOutTok extends NonExprToken

	method public override string ToString()
		return "inout"
	end method

end class

class public LockTok extends NonExprToken

	method public override string ToString()
		return "lock"
	end method

end class

class public TryLockTok extends NonExprToken

	method public override string ToString()
		return "trylock"
	end method

end class

class public ExprTok extends Token

	method public override string ToString()
		return "#expr"
	end method

end class

class public RegionTok extends NonExprToken

	method public override string ToString()
		return "#region"
	end method

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
	
	method public override string ToString()
		return #ternary{_Conv ? "$" + _TTok::ToString() + "$me", "me"}
	end method
	
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

	method public override string ToString()
		return Value
	end method

end class
