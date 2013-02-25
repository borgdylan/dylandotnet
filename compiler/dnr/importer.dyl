//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static Importer

	field public static C5.IList<of IKVM.Reflection.Assembly> Asms
	field public static C5.IList<of string> Imps
	field public static C5.IList<of string> LocImps
	field public static C5.IDictionary<of string,string> AliasMap

	[method: ComVisible(false)]
	method public static void Init()
		Asms = new C5.LinkedList<of IKVM.Reflection.Assembly>()
		Imps = new C5.LinkedList<of string>()
		AliasMap = new C5.HashDictionary<of string,string>() { _
		Add("object", "System.Object"), _
		Add("string", "System.String"), _
		Add("char", "System.Char"), _
		Add("boolean", "System.Boolean"), _
		Add("sbyte", "System.SByte"), _
		Add("short", "System.Int16"), _
		Add("integer", "System.Int32"), _
		Add("long", "System.Int64"), _
		Add("byte", "System.Byte"), _
		Add("ushort", "System.UInt16"), _
		Add("uinteger", "System.UInt32"), _
		Add("ulong", "System.UInt64"), _
		Add("intptr", "System.IntPtr"), _
		Add("uintptr", "System.UIntPtr"), _
		Add("decimal", "System.Decimal")}
	end method

	method private static void Importer()
		Init()
	end method

	[method: ComVisible(false)]
	method public static void AddAsm(var asmm as IKVM.Reflection.Assembly)
		Asms::Add(asmm)
	end method

//	method private static string[] addelem(var srcarr as string[], var eltoadd as string)
//		var i as integer = -1
//		var destarr as string[] = new string[srcarr[l] + 1]
//
//		do until i = (srcarr[l] - 1)
//			i = i + 1
//			destarr[i] = srcarr[i]
//		end do
//
//		destarr[srcarr[l]] = eltoadd
//		return destarr
//	end method

	[method: ComVisible(false)]
	method public static void AddImp(var imp as string)
		Imps::Add(imp)
	end method
	
	[method: ComVisible(false)]
	method public static void RegisterAlias(var alias as string, var ns as string)
		AliasMap::Add(alias, ns)
	end method

	[method: ComVisible(false)]
	method public static void AddLocImp(var imp as string)
		Imps::Add(imp)
	end method

end class
