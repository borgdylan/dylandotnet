//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System
import System.Runtime.InteropServices
import System.Collections.Generic
import System.Linq

class public static Importer

	field public static C5.HashDictionary<of string, AssemblyRecord> Asms

	#if VTUP_HACK then
	field public static AssemblyRecord ValueTupleAsm
	end #if

	//field public static C5.IList<of string> Imps
	field public static C5.LinkedList<of C5.LinkedList<of ImportRecord> > ImpsStack
	field public static C5.IDictionary<of string, string> AliasMap
	//field public static C5.IDictionary<of string, Managed.Reflection.Type> TypeMap
	field public static string AsmBasePath

	[method: ComVisible(false)]
	method public static void Init()
		#if VTUP_HACK
		ValueTupleAsm = null
		end #if

		Asms = new C5.HashDictionary<of string, AssemblyRecord>(C5.MemoryType::Normal)
		//Imps = new C5.LinkedList<of string>()
		ImpsStack = new C5.LinkedList<of C5.LinkedList<of ImportRecord> > {new C5.LinkedList<of ImportRecord>()}
		AsmBasePath = RuntimeEnvironment::GetRuntimeDirectory()
		AliasMap = new C5.HashDictionary<of string,string>(C5.MemoryType::Normal) { _
			Add("object", "System.Object"), _
			Add("void", "System.Void"), _
			Add("string", "System.String"), _
			Add("char", "System.Char"), _
			Add("boolean", "System.Boolean"), _
			Add("sbyte", "System.SByte"), _
			Add("short", "System.Int16"), _
			Add("integer", "System.Int32"), _
			Add("long", "System.Int64"), _
			Add("single", "System.Single"), _
			Add("double", "System.Double"), _
			Add("byte", "System.Byte"), _
			Add("ushort", "System.UInt16"), _
			Add("uinteger", "System.UInt32"), _
			Add("ulong", "System.UInt64"), _
			Add("intptr", "System.IntPtr"), _
			Add("uintptr", "System.UIntPtr"), _
			Add("decimal", "System.Decimal") }
		//TypeMap = new C5.HashDictionary<of string, Managed.Reflection.Type>()
	end method

	method private static void Importer()
		Init()
	end method

	[method: ComVisible(false)]
	method public static void AddAsm(var path as string, var asmm as Managed.Reflection.Assembly)
		if !Asms::Contains(path) then
			Asms::Add(path, new AssemblyRecord(asmm))

			#if VTUP_HACK then
			if asmm::GetName()::get_Name() == "System.ValueTuple" then
				ValueTupleAsm = Asms::get_Item(path)
			end if
			end #if
		end if
	end method

	[method: ComVisible(false)]
	method public static void AddImp(var imp as string)
		ImpsStack::get_Last()::Add(new ImportRecord(imp, ILEmitter::LineNr))
	end method

	[method: ComVisible(false)]
	method public static void RegisterAlias(var alias as string, var ns as string)
		AliasMap::Add(alias, ns)
	end method

	method private static IEnumerable<of ImportRecord> Identity(var src as C5.LinkedList<of ImportRecord>) => src

	//Enumerable::ToList<of C5.LinkedList<of ImportRecord> >()
	method public static IEnumerable<of ImportRecord> GetActiveImports() => _
		Enumerable::Concat<of ImportRecord>( _
			new ImportRecord[] {new ImportRecord(string::Empty), new ImportRecord(AsmFactory::CurnNS)}, _
			Enumerable::SelectMany<of C5.LinkedList<of ImportRecord>, ImportRecord>( _
				Importer::ImpsStack::Backwards(), _
				new Func<of C5.LinkedList<of ImportRecord>, IEnumerable<of ImportRecord> >(Identity) _
			) _
		)

end class