//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi LogicalOp extends Op

end class

class public auto ansi AndOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 7
me::LChild = null
me::RChild = null
end method

end class

class public auto ansi OrOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 5
me::LChild = null
me::RChild = null
end method

end class

class public auto ansi NandOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 7
me::LChild = null
me::RChild = null
end method

end class

class public auto ansi NorOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 5
me::LChild = null
me::RChild = null
end method

end class

class public auto ansi XorOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 6
me::LChild = null
me::RChild = null
end method

end class

class public auto ansi XnorOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 6
me::LChild = null
me::RChild = null
end method

end class

class public auto ansi NotOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 13
me::LChild = null
me::RChild = null
end method

end class

class public auto ansi NegOp extends LogicalOp

method public void ctor0()
me::ctor()
me::PrecNo = 13
me::LChild = null
me::RChild = null
end method

end class
