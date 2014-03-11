//    dnu.dll dylan.NET.Utils Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi abstract interface ITypeProvider

	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetString()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetChar()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetInteger()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetObject()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetShort()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetSByte()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetLong()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetSingle()
	method public hidebysig virtual abstract newslot IKVM.Reflection.Type GetDouble()

end class