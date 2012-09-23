//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static ConsolePrinter

	field public static StringWriter SW

	method private static void ConsolePrinter()
		SW = null
	end method

	[method: ComVisible(false)]
	method public static void PrintString()
		var str as string = SW::ToString()
		Console::WriteLine(str)
	end method

	[method: ComVisible(false)]
	method public static void WriteClass(var typ as Type)

		SW = new StringWriter()

		if typ::get_IsEnum() then
			SW::Write("enum ")
		else
			SW::Write("class ")
		end if

		if typ::get_IsPublic() or typ::get_IsNestedPublic()then
			SW::Write("public ")
		end if

		if typ::get_IsNotPublic() or typ::get_IsNestedPrivate() then
			SW::Write("private ")
		end if

		if typ::get_IsAbstract() then
			SW::Write("abstract ")
		end if

		if typ::get_IsAutoLayout() then
			SW::Write("auto ")
		end if

		if typ::get_IsAutoClass() then
			SW::Write("autochar ")
		end if

		if typ::get_IsAnsiClass() then
			SW::Write("ansi ")
		end if

		if typ::get_IsInterface() then
			SW::Write("interface ")
		end if
	
		SW::Write(typ::get_Name() + " extends " + typ::get_BaseType()::ToString())
	
	end method

end class
