//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi NewarrTok extends Token

	method public hidebysig virtual string ToString()
		return "newarr"
	end method

end class

class public auto ansi NewTok extends Token

	method public hidebysig virtual string ToString()
		return "new"
	end method

end class

//class public auto ansi CastclassTok extends Token
//end class

class public auto ansi GettypeTok extends Token

	method public hidebysig virtual string ToString()
		return "gettype"
	end method

end class

class public auto ansi DefaultTok extends Token

	method public hidebysig virtual string ToString()
		return "default"
	end method

end class

class public auto ansi WhereTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "where"
	end method

end class

class public auto ansi RefTok extends Token

	method public hidebysig virtual string ToString()
		return "ref"
	end method

end class

class public auto ansi ValInRefTok extends Token

	method public hidebysig virtual string ToString()
		return "valinref"
	end method

end class

class public auto ansi PtrTok extends Token

	method public hidebysig virtual string ToString()
		return "ptr"
	end method

end class

//class public auto ansi DependTok extends Token
//end class
//
//class public auto ansi StdasmTok extends Token
//end class

class public auto ansi abstract SwitchTok extends NonExprToken
end class

class public auto ansi OnTok extends SwitchTok

	method public hidebysig virtual string ToString()
		return "on"
	end method

end class

class public auto ansi OfTok extends Token

	method public hidebysig virtual string ToString()
		return "of"
	end method

end class

class public auto ansi OffTok extends SwitchTok

	method public hidebysig virtual string ToString()
		return "off"
	end method

end class

//class public auto ansi SingTok extends Token
//end class

class public auto ansi ScopeTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#scope"
	end method

end class

class public auto ansi DebugTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#debug"
	end method

end class

//class public auto ansi MakeasmTok extends Token
//end class

class public auto ansi RefasmTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#refasm"
	end method

end class

class public auto ansi EmbedTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#embed"
	end method

end class

class public auto ansi RefstdasmTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#refstdasm"
	end method

end class

//class public auto ansi NewresTok extends Token
//end class

//class public auto ansi ImageTok extends Token
//end class

class public auto ansi ImportTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "import"
	end method

end class

class public auto ansi LocimportTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "locimport"
	end method

end class

class public auto ansi AssemblyTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "assembly"
	end method

end class

class public auto ansi AssemblyCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "assembly:"
	end method

end class

class public auto ansi ExeTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "exe"
	end method

end class

class public auto ansi DllTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "dll"
	end method

end class

class public auto ansi WinexeTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "winexe"
	end method

end class

class public auto ansi VerTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "ver"
	end method

end class

class public auto ansi IncludeTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#include"
	end method

end class

class public auto ansi SignTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#sign"
	end method

end class

//class public auto ansi XmldocTok extends Token
//end class

class public auto ansi NamespaceTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "namespace"
	end method

end class

class public auto ansi ClassTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "class"
	end method

end class

class public auto ansi ClassCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "class:"
	end method

end class

class public auto ansi StructTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "struct"
	end method

end class

class public auto ansi ExtendsTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "extends"
	end method

end class

class public auto ansi ImplementsTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "implements"
	end method

end class

class public auto ansi EnumTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "enum"
	end method

end class

class public auto ansi EnumCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "enum:"
	end method

end class

class public auto ansi FieldTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "field"
	end method

end class

class public auto ansi FieldCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "field:"
	end method

end class

class public auto ansi DelegateTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "delegate"
	end method

end class

class public auto ansi PropertyTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "property"
	end method

end class

class public auto ansi PropertyCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "property:"
	end method

end class

class public auto ansi EventTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "event"
	end method

end class

class public auto ansi EventCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "event:"
	end method

end class


class public auto ansi GetTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "get"
	end method

end class

class public auto ansi SetTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "set"
	end method

end class

class public auto ansi AddTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "add"
	end method

end class

class public auto ansi RemoveTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "remove"
	end method

end class


class public auto ansi MethodTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "method"
	end method

end class

class public auto ansi MethodCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "method:"
	end method

end class

class public auto ansi TryTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "try"
	end method

end class

class public auto ansi CatchTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "catch"
	end method

end class

class public auto ansi AsTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "as"
	end method

end class

class public auto ansi FinallyTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "finally"
	end method

end class

class public auto ansi LabelTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "label"
	end method

end class

class public auto ansi PlaceTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "place"
	end method

end class

class public auto ansi GotoTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "goto"
	end method

end class

class public auto ansi IfTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "if"
	end method

end class

class public auto ansi HIfTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#if"
	end method

end class

class public auto ansi ElseIfTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "elseif"
	end method

end class

class public auto ansi HElseIfTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#elseif"
	end method

end class


class public auto ansi ThenTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "then"
	end method

end class

class public auto ansi DoTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "do"
	end method

end class

class public auto ansi ForTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "for"
	end method

end class

class public auto ansi UptoTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "upto"
	end method

end class

class public auto ansi DowntoTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "downto"
	end method

end class

class public auto ansi StepTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "step"
	end method

end class

class public auto ansi ForeachTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "foreach"
	end method

end class

class public auto ansi BreakTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "break"
	end method

end class

class public auto ansi ContinueTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "continue"
	end method

end class

class public auto ansi WhileTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "while"
	end method

end class

class public auto ansi UntilTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "until"
	end method

end class

class public auto ansi LiteralTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "literal"
	end method

end class

class public auto ansi VarTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "var"
	end method
	
end class

class public auto ansi UsingTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "using"
	end method
	
end class

class public auto ansi ElseTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "else"
	end method

end class

class public auto ansi HElseTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#else"
	end method

end class

class public auto ansi TernaryTok extends Token

	method public hidebysig virtual string ToString()
		return "#ternary"
	end method

end class

class public auto ansi HDefineTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#define"
	end method

end class

class public auto ansi HUndefTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#undef"
	end method

end class

class public auto ansi ErrorTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#error"
	end method

end class

class public auto ansi WarningTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#warning"
	end method

end class

class public auto ansi ReturnTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "return"
	end method

end class

class public auto ansi ThrowTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "throw"
	end method
	
end class

class public auto ansi EndTok extends NonExprToken
	
	method public hidebysig virtual string ToString()
		return "end"
	end method

end class

class public auto ansi InTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "in"
	end method

end class

class public auto ansi OutTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "out"
	end method

end class

class public auto ansi InOutTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "inout"
	end method

end class

class public auto ansi LockTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "lock"
	end method

end class

class public auto ansi TryLockTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "trylock"
	end method

end class

class public auto ansi ExprTok extends Token

	method public hidebysig virtual string ToString()
		return "#expr"
	end method

end class

class public auto ansi RegionTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return "#region"
	end method

end class

class public auto ansi MeTok extends ValueToken implements IUnaryOperatable, IConvable

	field public boolean _Conv
	field public TypeTok _TTok
	field private string _OrdOp

	method public void MeTok()
		me::ctor()
		_Conv = false
		_TTok = null
		_OrdOp = string::Empty
	end method

	method public void MeTok(var value as string)
		me::ctor(value)
		_Conv = false
		_TTok = null
		_OrdOp = string::Empty
	end method
	
	method public hidebysig virtual string ToString()
		return #ternary{_Conv ? "$" + _TTok::ToString() + "$me", "me"}
	end method
	
	property public hidebysig virtual final newslot string OrdOp
		get
			return _OrdOp
		end get
		set
			_OrdOp = value
		end set
	end property
	
	property public hidebysig virtual final newslot boolean Conv
		get
			return _Conv
		end get
		set
			_Conv = value
		end set
	end property
	
	property public hidebysig virtual final newslot TypeTok TTok
		get
			return _TTok
		end get
		set
			_TTok = value
		end set
	end property
	
end class

class public auto ansi ParameterCTok extends NonExprToken

	method public hidebysig virtual string ToString()
		return Value
	end method

end class
