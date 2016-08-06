// //    dnu.dll dylan.NET.Utils Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
// //    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// // Foundation; either version 3 of the License, or (at your option) any later version.
// //    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
// //PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
// //    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
// //Place, Suite 330, Boston, MA 02111-1307 USA 
namespace dylan.NET.Utils

	class public static MemoryFS
		
		field private static C5.HashDictionary<of string, Stream> fs
		//field private static C5.LinkedList<of string> anis

		method private static void MemoryFS()
			fs = new C5.HashDictionary<of string, Stream>(C5.MemoryType::Normal)
			//anis = new C5.LinkedList<of string>()
		end method

		method public static void Clear()
			fs::Clear()
			//anis::Clear()
		end method

		method public static boolean AddFile(var path as string, var s as Stream)
			if !fs::Contains(path) then
				fs::Add(path, s)
				return true
			end if
			return false
		end method

		method public static boolean HasFile(var path as string) => fs::Contains(path)

		method public static Stream GetFile(var path as string)
			if fs::Contains(path) then
				return fs::get_Item(path)
			else
				return null
			end if
		end method

//		method public static void AddANI(var path as string)
//			anis::Add(path)
//		end method
//
//		method public static IEnumerable<of string> GetANIs()
//			return anis
//		end method

		method public static IEnumerable<of string> GetFiles() => fs::get_Keys()

	end class
	
end namespace
