//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class public static auto ansi Utils
		
		method public static string Indent(var text as string)
			var list = new List<of string>()

			using sr = new StringReader(text)
				do while true
					var line = sr::ReadLine()
					if line == null then
						break
					else
						list::Add(c"\t" + line)
					end if
				end do
			end using

			return string::Join(c"\n", list)
		end method

	end class
	
end namespace
