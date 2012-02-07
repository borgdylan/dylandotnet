//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit StreamUtils

field public static Stream Stdin
field public static Stream Stdout
field public static Stream Stderr

field public static StreamReader InS
field public static StreamWriter OutS

field public static boolean UseConsole

method public static void ctor0()
Stdin = Console::OpenStandardInput()
Stderr = Console::OpenStandardError()
Stdout = Console::OpenStandardOutput()
InS = null
OutS = null
UseConsole = true
end method

method public static void InitInS(var s as Stream)
if InS <> null then
InS::Close()
end if
InS = new StreamReader(s)
end method

method public static void InitOutS(var s as Stream)
if OutS <> null then
OutS::Close()
end if
OutS = new StreamWriter(s)
end method

method public static void InitInOutSWithStd()
InitInS(Stdin)
InitOutS(Stdout)
end method

method public static void CloseInS()
if InS <> null then
InS::Close()
InS = null
end if
end method

method public static void CloseOutS()
if OutS <> null then
OutS::Close()
OutS = null
end if
end method

method public static string ReadLine()
if UseConsole = false then
if InS <> null then
return InS::ReadLine()
else
return ""
end if
else
return Console::ReadLine()
end if
end method

method public static void WriteLine(var str as string)
if UseConsole = false then
if OutS <> null then
OutS::WriteLine(str)
else
end if
else
Console::WriteLine(str)
end if
end method

method public static void Write(var str as string)
if UseConsole = false then
if OutS <> null then
OutS::Write(str)
else
end if
else
Console::Write(str)
end if
end method

method public static void WriteWarn(var line as integer, var file as string, var msg as string)

var str as string = String::Concat("WARNING: " , msg, " at line ", $string$line)
str = String::Concat(str, " in file: " , file)
WriteLine(str)

end method

method public static void WriteError(var line as integer, var file as string, var msg as string)

var str as string = String::Concat("ERROR: " , msg, " at line ", $string$line)
str = String::Concat(str, " in file: " , file)
WriteLine(str)
CloseInS()
CloseOutS()
Environment::Exit(1)

end method

end class