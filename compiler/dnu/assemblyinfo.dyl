//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

[assembly: ComVisible(false)]
[assembly: CLSCompliant(true)]
#if DEBUG then
[assembly: System.Reflection.AssemblyConfiguration("DEBUG")]
#else
[assembly: System.Reflection.AssemblyConfiguration("RELEASE")]
end #if
[assembly: System.Reflection.AssemblyTitle("dylan.NET.Utils")]
[assembly: System.Reflection.AssemblyCopyright("Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>")]