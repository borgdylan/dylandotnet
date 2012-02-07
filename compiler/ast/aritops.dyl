//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi AritOp extends Op
end class

// +
class public auto ansi AddOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 11
me::LChild = null
me::RChild = null
end method

end class

// *
class public auto ansi MulOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 12
me::LChild = null
me::RChild = null
end method

end class

// -
class public auto ansi SubOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 11
me::LChild = null
me::RChild = null
end method

end class


// /
class public auto ansi DivOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 12
me::LChild = null
me::RChild = null
end method

end class

// %
class public auto ansi ModOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 12
me::LChild = null
me::RChild = null
end method

end class

// ++
class public auto ansi IncOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 13
me::LChild = null
me::RChild = null
end method

end class

// --
class public auto ansi DecOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 13
me::LChild = null
me::RChild = null
end method

end class

// <<
class public auto ansi ShlOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 10
me::LChild = null
me::RChild = null
end method

end class

// >>
class public auto ansi ShrOp extends AritOp

method public void ctor0()
me::ctor()
me::PrecNo = 10
me::LChild = null
me::RChild = null
end method

end class
