//    dnu.dll dylan.NET.Utils Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi WinApi

dllimport user32.dll
callconv winapi
charset auto
method public static pinvokeimpl boolean MessageBeep(in var uType as integer)
setattr param|0 marshalas Bool

dllimport kernel32.dll
callconv winapi
charset auto
method public static pinvokeimpl boolean Beep(in var dwFreq as integer, in var dwDuration as integer)
setattr param|0 marshalas Bool

dllimport kernel32.dll
callconv winapi
charset auto
method public static pinvokeimpl boolean FreeConsole()
setattr param|0 marshalas Bool

dllimport kernel32.dll
callconv winapi
charset auto
method public static pinvokeimpl boolean AllocConsole()
setattr param|0 marshalas Bool

dllimport kernel32.dll
callconv winapi
charset auto
method public static pinvokeimpl boolean AttachConsole(in var dwProcessId as integer)
setattr param|0 marshalas Bool

end class

class public auto ansi WinSnd

field public static initonly integer SimpleBeep
field public static initonly integer ErrorSnd
field public static initonly integer InformationSnd
field public static initonly integer QuestionSnd
field public static initonly integer WarningSnd
field public static initonly integer OkSnd 

method public static void ctor0()
var ns as System.Globalization.NumberStyles = 515
SimpleBeep = Int32::Parse("FFFFFFFF",ns)
ErrorSnd = Int32::Parse("10",ns)
InformationSnd = Int32::Parse("40",ns)
QuestionSnd = Int32::Parse("20",ns)
end method

end class
