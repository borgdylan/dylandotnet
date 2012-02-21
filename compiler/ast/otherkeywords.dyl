//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi NewarrTok extends Token

end class

class public auto ansi NewTok extends Token

end class

class public auto ansi CastclassTok extends Token

end class

class public auto ansi GettypeTok extends Token

end class

class public auto ansi PtrTok extends Token

end class

class public auto ansi DependTok extends Token

end class

class public auto ansi StdasmTok extends Token

end class

class public auto ansi SwitchTok extends Token

end class

class public auto ansi OnTok extends SwitchTok

end class

class public auto ansi OfTok extends Token

end class

class public auto ansi OffTok extends SwitchTok

end class

class public auto ansi SingTok extends Token

end class

class public auto ansi ScopeTok extends Token

end class

class public auto ansi DebugTok extends Token

end class

class public auto ansi MakeasmTok extends Token

end class

class public auto ansi RefasmTok extends Token

end class

class public auto ansi RefstdasmTok extends Token

end class

class public auto ansi NewresTok extends Token

end class

class public auto ansi ImageTok extends Token

end class

class public auto ansi ImportTok extends Token

end class

class public auto ansi LocimportTok extends Token

end class

class public auto ansi AssemblyTok extends Token

end class

class public auto ansi ExeTok extends Token

end class

class public auto ansi DllTok extends Token

end class

class public auto ansi VerTok extends Token

end class

class public auto ansi IncludeTok extends Token

end class

class public auto ansi XmldocTok extends Token

end class

class public auto ansi NamespaceTok extends Token

end class

class public auto ansi ClassTok extends Token

end class

class public auto ansi ExtendsTok extends Token

end class

class public auto ansi EnumTok extends Token

end class

class public auto ansi FieldTok extends Token

end class

class public auto ansi DelegateTok extends Token

end class

class public auto ansi StructTok extends Token

end class

class public auto ansi PropertyTok extends Token

end class

class public auto ansi GetTok extends Token

end class

class public auto ansi SetTok extends Token

end class

class public auto ansi MethodTok extends Token

end class

class public auto ansi TryTok extends Token

end class

class public auto ansi CatchTok extends Token

end class

class public auto ansi AsTok extends Token

end class

class public auto ansi FinallyTok extends Token

end class

class public auto ansi LabelTok extends Token

end class

class public auto ansi PlaceTok extends Token

end class

class public auto ansi GotoTok extends Token

end class

class public auto ansi IfTok extends Token

end class

class public auto ansi ElseIfTok extends Token

end class

class public auto ansi ThenTok extends Token

end class

class public auto ansi DoTok extends Token

end class

class public auto ansi BreakTok extends Token

end class

class public auto ansi ContinueTok extends Token

end class

class public auto ansi WhileTok extends Token

end class

class public auto ansi UntilTok extends Token

end class

class public auto ansi LiteralTok extends Token

end class

class public auto ansi VarTok extends Token

end class

class public auto ansi ElseTok extends Token

end class

class public auto ansi ReturnTok extends Token

end class

class public auto ansi ThrowTok extends Token

end class

class public auto ansi EndTok extends Token

end class

class public auto ansi MeTok extends Token

field public boolean Conv
field public TypeTok TTok

method public void ctor0()
me::ctor()
me::Value = ""
me::Line = 0
Conv = false
TTok = null
end method

method public void ctor1(var value as string)
me::ctor()
me::Value = value
me::Line = 0
Conv = false
TTok = null
end method

end class