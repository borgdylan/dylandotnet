//    dnu.dll dylan.NET.Utils Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public static Keyboard

	[method: ComVisible(false)]
	method public static string ReadString() => Console::ReadLine()
	
	[method: ComVisible(false)]
	method public static integer ReadInteger() => $integer$ReadString()
	
	[method: ComVisible(false)]
	method public static sbyte ReadSbyte() => $sbyte$ReadString()
	
	[method: ComVisible(false)]
	method public static short ReadShort() => $short$ReadString()
	
	[method: ComVisible(false)]
	method public static long ReadLong() => $long$ReadString()
	
	[method: ComVisible(false)]
	method public static single ReadSingle() => $single$ReadString()
	
	[method: ComVisible(false)]
	method public static double ReadDouble() => $double$ReadString()
	
	[method: ComVisible(false)]
	method public static char ReadChar() => $char$ReadString()
	
	[method: ComVisible(false)]
	method public static boolean ReadBoolean() => $boolean$ReadString()
	
end class