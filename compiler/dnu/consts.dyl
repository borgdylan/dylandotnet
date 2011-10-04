//    dnu.dll dylan.NET.Utils Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Constants

field public static initonly string quot

field public static initonly string cr

field public static initonly string lf

field public static initonly string crlf

field public static initonly double pi

field public static initonly double e

field public static initonly boolean t

field public static initonly boolean f

method public static void ctor0()
var q as char = Convert::ToChar($integer$"34")
quot = $string$q
var chr as char = 'a'
chr = $char$13
cr = $string$chr
chr = $char$10
lf = $string$chr
crlf = String::Concat(cr, lf)
pi = 3.1415926535897931d
e = 2.7182818284590451d
t = true
f = false
end method

end class
