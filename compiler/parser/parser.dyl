//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Parser

method public StmtSet Parse(var stms as StmtSet)
var i as integer = -1
var so as StmtOptimizer = null
var len as integer = stms::Stmts[l]
len--

label loop
label cont

place loop

i++
so = new StmtOptimizer()
stms::Stmts[i] = so::Optimize(stms::Stmts[i])

if i = len then
goto cont
else
goto loop
end if

place cont

return stms
end method

end class
