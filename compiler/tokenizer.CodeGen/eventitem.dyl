//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.Collections.Generic
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import Managed.Reflection.Emit

class public EventItem

    field public string Name
    field public Managed.Reflection.Type EventTyp
    field public EventBuilder EventBldr
    field public string ExplImplType
    field public TypeTok ExplType
    field public IEnumerable<of Attributes.Attribute> Attrs

    method public void EventItem()
        mybase::ctor()
        Name = string::Empty
        ExplImplType = string::Empty
    end method

    method public void EventItem(var nme as string, var typ as Managed.Reflection.Type, var bld as EventBuilder, var attr as IEnumerable<of Attributes.Attribute>, var expl as string)
        mybase::ctor()
        Name = nme
        EventTyp = typ
        EventBldr = bld
        ExplImplType = string::Empty
        Attrs = attr
        ExplImplType = expl
    end method

    method public override string ToString() => i"{Name} : {EventTyp::ToString()}"

end class