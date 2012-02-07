//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Keyboard

method public static string ReadString()
return Console::ReadLine()
end method

method public static integer ReadInteger()
return $integer$ReadString()
end method

method public static sbyte ReadSbyte()
return $sbyte$ReadString()
end method

method public static short ReadShort()
return $short$ReadString()
end method

method public static long ReadLong()
return $long$ReadString()
end method

method public static single ReadSingle()
return $single$ReadString()
end method

method public static double ReadDouble()
return $double$ReadString()
end method

method public static char ReadChar()
return $char$ReadString()
end method

method public static boolean ReadBoolean()
return $boolean$ReadString()
end method

end class