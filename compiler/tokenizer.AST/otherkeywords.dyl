//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Tokens.TypeToks

//class public NewarrTok extends Token
//
//	method public override string ToString()
//		return "newarr"
//	end method
//
//end class

class public sealed NewTok extends Token
	method public override string ToString() => "new"
end class

class public sealed GettypeTok extends Token
	method public override string ToString() => "gettype"
end class

class public sealed DefaultTok extends Token
	method public override string ToString() => "default"
end class

class public sealed WhereTok extends NonExprToken
	method public override string ToString() => "where"
end class

class public sealed RefTok extends Token
	method public override string ToString() => "ref"
end class

class public sealed ValInRefTok extends Token
	method public override string ToString() => "valinref"
end class

class public abstract SwitchTok extends NonExprToken
end class

class public sealed OnTok extends SwitchTok
	method public override string ToString() => "on"
end class

class public sealed OfTok extends Token
	method public override string ToString() => "of"
end class

class public sealed OffTok extends SwitchTok
	method public override string ToString() => "off"
end class

class public sealed ScopeTok extends NonExprToken
	method public override string ToString() => "#scope"
end class

class public sealed DebugTok extends NonExprToken
	method public override string ToString() => "#debug"
end class

class public sealed RefasmTok extends NonExprToken
	method public override string ToString() => "#refasm"
end class

//class public sealed RefembedasmTok extends NonExprToken
//
//	method public override string ToString()
//		return "#refembedasm"
//	end method
//
//end class

class public sealed EmbedTok extends NonExprToken
	method public override string ToString() => "#embed"
end class

class public sealed RefstdasmTok extends NonExprToken
	method public override string ToString() => "#refstdasm"
end class

class public sealed ImportTok extends NonExprToken
	method public override string ToString() => "import"
end class

class public sealed LocimportTok extends NonExprToken
	method public override string ToString() => "locimport"
end class

class public sealed AssemblyTok extends NonExprToken
	method public override string ToString() => "assembly"
end class

class public sealed AssemblyCTok extends NonExprToken
	method public override string ToString() => "assembly:"
end class

class public sealed ExeTok extends NonExprToken
	method public override string ToString() => "exe"
end class

class public sealed DllTok extends NonExprToken
	method public override string ToString() => "dll"
end class

class public sealed WinexeTok extends NonExprToken
	method public override string ToString() => "winexe"
end class

class public sealed VerTok extends NonExprToken
	method public override string ToString() => "ver"
end class

class public sealed IncludeTok extends NonExprToken
	method public override string ToString() => "#include"
end class

class public sealed SignTok extends NonExprToken
	method public override string ToString() => "#sign"
end class

class public sealed NamespaceTok extends NonExprToken
	method public override string ToString() => "namespace"
end class

class public sealed ClassTok extends NonExprToken
	method public override string ToString() => "class"
end class

class public sealed ClassCTok extends NonExprToken
	method public override string ToString() => "class:"
end class

class public sealed StructTok extends NonExprToken
	method public override string ToString() => "struct"
end class

class public sealed InterfaceTok extends NonExprToken
	method public override string ToString() => "interface"
end class

class public sealed ExtendsTok extends NonExprToken
	method public override string ToString() => "extends"
end class

class public sealed ImplementsTok extends NonExprToken
	method public override string ToString() => "implements"
end class

class public sealed EnumTok extends NonExprToken
	method public override string ToString() => "enum"
end class

class public sealed EnumCTok extends NonExprToken
	method public override string ToString() => "enum:"
end class

class public sealed FieldTok extends NonExprToken
	method public override string ToString() => "field"
end class

class public sealed FieldCTok extends NonExprToken
	method public override string ToString() => "field:"
end class

class public sealed DelegateTok extends NonExprToken
	method public override string ToString() => "delegate"
end class

class public sealed PropertyTok extends NonExprToken
	method public override string ToString() => "property"
end class

class public sealed PropertyCTok extends NonExprToken
	method public override string ToString() => "property:"
end class

class public sealed EventTok extends NonExprToken
	method public override string ToString() => "event"
end class

class public sealed EventCTok extends NonExprToken
	method public override string ToString() => "event:"
end class

class public sealed GetTok extends NonExprToken
	method public override string ToString() => "get"
end class

class public sealed SetTok extends NonExprToken
	method public override string ToString() => "set"
end class

class public sealed AddTok extends NonExprToken
	method public override string ToString() => "add"
end class

class public sealed RemoveTok extends NonExprToken
	method public override string ToString() => "remove"
end class

class public sealed MethodTok extends NonExprToken
	method public override string ToString() => "method"
end class

class public sealed MethodCTok extends NonExprToken
	method public override string ToString() => "method:"
end class

class public sealed TryTok extends NonExprToken
	method public override string ToString() => "try"
end class

class public sealed CatchTok extends NonExprToken
	method public override string ToString() => "catch"
end class

class public sealed WhenTok extends NonExprToken
	method public override string ToString() => "when"
end class

class public sealed AsTok extends NonExprToken
	method public override string ToString() => "as"
end class

class public sealed FinallyTok extends NonExprToken
	method public override string ToString() => "finally"
end class

//class public sealed LabelTok extends NonExprToken
//
//	method public override string ToString()
//		return "label"
//	end method
//
//end class
//
//class public sealed PlaceTok extends NonExprToken
//
//	method public override string ToString()
//		return "place"
//	end method
//
//end class
//
//class public sealed GotoTok extends NonExprToken
//
//	method public override string ToString()
//		return "goto"
//	end method
//
//end class

class public sealed IfTok extends NonExprToken
	method public override string ToString() => "if"
end class

class public sealed SwitchTok2 extends NonExprToken
	method public override string ToString() => "switch"
end class

class public sealed HIfTok extends NonExprToken
	method public override string ToString() => "#if"
end class

class public sealed ElseIfTok extends NonExprToken
	method public override string ToString() => "elseif"
end class

class public sealed StateTok extends NonExprToken
	method public override string ToString() => "state"
end class

class public sealed HElseIfTok extends NonExprToken
	method public override string ToString() => "#elseif"
end class

class public sealed ThenTok extends NonExprToken
	method public override string ToString() => "then"
end class

class public sealed DoTok extends NonExprToken
	method public override string ToString() => "do"
end class

class public sealed ForTok extends NonExprToken
	method public override string ToString() => "for"
end class

class public sealed UptoTok extends NonExprToken
	method public override string ToString() => "upto"
end class

class public sealed DowntoTok extends NonExprToken
	method public override string ToString() => "downto"
end class

class public sealed StepTok extends NonExprToken
	method public override string ToString() => "step"
end class

class public sealed ForeachTok extends NonExprToken
	method public override string ToString() => "foreach"
end class

class public sealed BreakTok extends NonExprToken
	method public override string ToString() => "break"
end class

class public sealed ContinueTok extends NonExprToken
	method public override string ToString() => "continue"
end class

class public sealed WhileTok extends NonExprToken
	method public override string ToString() => "while"
end class

class public sealed UntilTok extends NonExprToken
	method public override string ToString() => "until"
end class

class public sealed LiteralTok extends NonExprToken
	method public override string ToString() => "literal"
end class

class public sealed VarTok extends NonExprToken
	method public override string ToString() => "var"
end class

class public sealed UsingTok extends NonExprToken
	method public override string ToString() => "using"
end class

class public sealed ElseTok extends NonExprToken
	method public override string ToString() => "else"
end class

class public sealed HElseTok extends NonExprToken
	method public override string ToString() => "#else"
end class

class public sealed TernaryTok extends Token
	method public override string ToString() => "#ternary"
end class

class public sealed HDefineTok extends NonExprToken
	method public override string ToString() => "#define"
end class

class public sealed HUndefTok extends NonExprToken
	method public override string ToString() => "#undef"
end class

class public sealed ErrorTok extends NonExprToken
	method public override string ToString() => "#error"
end class

class public sealed WarningTok extends NonExprToken
	method public override string ToString() => "#warning"
end class

class public sealed ReturnTok extends NonExprToken
	method public override string ToString() => "return"
end class

class public sealed ThrowTok extends NonExprToken
	method public override string ToString() => "throw"
end class

class public sealed EndTok extends NonExprToken
	method public override string ToString() => "end"
end class

class public sealed InTok extends NonExprToken
	method public override string ToString() => "in"
end class

class public sealed OutTok extends NonExprToken
	method public override string ToString() => "out"
end class

class public sealed InOutTok extends NonExprToken
	method public override string ToString() => "inout"
end class

class public sealed LockTok extends NonExprToken
	method public override string ToString() => "lock"
end class

class public sealed TryLockTok extends NonExprToken
	method public override string ToString() => "trylock"
end class

class public sealed ExprTok extends Token
	method public override string ToString() => "#expr"
end class

class public sealed NullCondTok extends Token
	method public override string ToString() => "#nullcond"
end class

class public sealed TupleTok extends Token
	method public override string ToString() => "#tuple"
end class

class public sealed RegionTok extends NonExprToken
	method public override string ToString() => "#region"
end class

class public sealed MeTok extends ValueToken implements IUnaryOperatable, IConvable

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

	method public override string ToString() => #ternary{_Conv ? i"${_TTok::ToString()}$me", "me"}

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

class public sealed ParameterCTok extends NonExprToken
	method public override string ToString() => Value
end class
