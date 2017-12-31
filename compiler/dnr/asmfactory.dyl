//    dnr.dll dylan.NET.Reflection Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.Runtime.InteropServices
import dylan.NET.Utils
import System.Runtime.Versioning

class public static AsmFactory

	field public static boolean DebugFlg
	field public static boolean InMethodFlg
	field public static boolean InCtorFlg
	field public static boolean ChainFlg
	field public static boolean AutoChainFlg
	field public static boolean RefChainFlg
	field public static boolean PopFlg
	field public static boolean ForcedAddrFlg
	field public static boolean AddrFlg
	field public static Managed.Reflection.AssemblyName AsmNameStr
	field public static Managed.Reflection.StrongNameKeyPair StrongKey
	field public static Managed.Reflection.Emit.AssemblyBuilder AsmB

	//unused
	field public static Managed.Reflection.Type Type01

	//type of expression as evaluated so far
	field public static Managed.Reflection.Type Type02

	//unused
	field public static Managed.Reflection.Type Type03

	//type used to drive methods that use addr/forced addr flags
	field public static Managed.Reflection.Type Type04

	//unused
	field public static Managed.Reflection.Type Type05

	field public static Managed.Reflection.Type CurnEventType
	field public static Managed.Reflection.Emit.ModuleBuilder MdlB
	field public static Managed.Reflection.Emit.ISymbolDocumentWriter DocWriter
	field public static string CurnNS
	field public static C5.LinkedList<of string> NSStack
	field public static string DfltNS
	field public static string AsmMode
	field public static string AsmFile
	field public static string CurnTypName
	field public static string CurnTypName2
	field public static string CurnMetName
	field public static Managed.Reflection.Emit.MethodBuilder CurnMetB
	field public static Managed.Reflection.Emit.ConstructorBuilder CurnConB
	field public static Managed.Reflection.Emit.FieldBuilder CurnFldB
	field public static Managed.Reflection.Emit.PropertyBuilder CurnPropB
	field public static Managed.Reflection.Emit.EventBuilder CurnEventB
	field public static Managed.Reflection.Emit.ILGenerator CurnILGen
	field public static Managed.Reflection.Type CurnInhTyp
	field public static Managed.Reflection.Type CurnInhTyp2
	field public static Managed.Reflection.Emit.TypeBuilder CurnTypB
	field public static Managed.Reflection.Emit.TypeBuilder CurnTypB2
	//field public static Managed.Reflection.Emit.TypeBuilder[] CurnTypList
	field public static Managed.Reflection.Emit.EnumBuilder CurnEnumB
	field public static boolean isNested
	field public static boolean inClass
	field public static boolean inEnum
	//field public static string[] GenParamNames
	//field public static Managed.Reflection.Emit.GenericTypeParameterBuilder[] GenParamTyps
	field public static boolean PCLSet
	field public static boolean InMemorySet
	field public static FrameworkName TargetFramework

	[method: ComVisible(false)]
	method public static void Init()
		DebugFlg = false
		ChainFlg = false
		AutoChainFlg = true
		RefChainFlg = false
		PopFlg = false
		AddrFlg = false
		ForcedAddrFlg = false
		InMethodFlg = false
		InCtorFlg = false
		CurnNS = string::Empty
		DfltNS = string::Empty
		AsmFile = string::Empty
		//CurnTypList = new Managed.Reflection.Emit.TypeBuilder[0]
		//GenParamNames = new string[0]
		//GenParamTyps = new Managed.Reflection.Emit.GenericTypeParameterBuilder[0]
		isNested = false
		inClass = false
		inEnum = false
		NSStack = new C5.LinkedList<of string>()
		PCLSet = false
		InMemorySet = false
		StrongKey = null
		TargetFramework = null
	end method

	method private static void AsmFactory()
		AsmMode = "exe"
		Init()
	end method

	[method: ComVisible(false)]
	method public static Managed.Reflection.Type CreateTyp() => CurnTypB::CreateType()

	[method: ComVisible(false)]
	method public static void InitMtd()
		if CurnMetB::get_IsAbstract() then
			CurnILGen = null
		else
			CurnILGen = CurnMetB::GetILGenerator()
		end if
		ILEmitter::Met = CurnMetB
		ILEmitter::ILGen = CurnILGen
		ILEmitter::DebugFlg = DebugFlg
		ILEmitter::LocInd = -1
		ILEmitter::ArgInd = #ternary {CurnMetB::get_IsStatic() ? -1, 0}
	end method

	[method: ComVisible(false)]
	method public static void InitConstr()
		CurnILGen = CurnConB::GetILGenerator()
		ILEmitter::Constr = CurnConB
		ILEmitter::ILGen = CurnILGen
		ILEmitter::DebugFlg = DebugFlg
		ILEmitter::LocInd = -1
		ILEmitter::ArgInd = #ternary {CurnConB::get_IsStatic() ? -1, 0}
	end method

	[method: ComVisible(false)]
	method public static void InitDelConstr()
		CurnConB::DefineParameter(1, Managed.Reflection.ParameterAttributes::None, "obj")
		CurnConB::DefineParameter(2, Managed.Reflection.ParameterAttributes::None, "ptr")
		CurnConB::SetImplementationFlags(Managed.Reflection.MethodImplAttributes::Runtime or Managed.Reflection.MethodImplAttributes::Managed)
	end method

	[method: ComVisible(false)]
	method public static void InitDelMet()
		ILEmitter::Met = CurnMetB
		CurnMetB::SetImplementationFlags(Managed.Reflection.MethodImplAttributes::Runtime or Managed.Reflection.MethodImplAttributes::Managed)
	end method

	[method: ComVisible(false)]
	method public static void InitPInvokeMtd()
		ILEmitter::Met = CurnMetB
		CurnMetB::SetImplementationFlags(CurnMetB::GetMethodImplementationFlags() or Managed.Reflection.MethodImplAttributes::PreserveSig)
	end method

//	[method: ComVisible(false)]
//	method public static void AddTypB(var typ as Managed.Reflection.Emit.TypeBuilder)
//
//		var len as integer = CurnTypList[l]
//		var stopel as integer = --len
//		var destarr as Managed.Reflection.Emit.TypeBuilder[] = new Managed.Reflection.Emit.TypeBuilder[++len]
//
//		for i = 0 upto stopel
//			destarr[i] = CurnTypList[i]
//		end for
//
//		destarr[len] = typ
//		CurnTypList = destarr
//
//	end method

//	[method: ComVisible(false)]
//	method public static void AddGenParamName(var nam as string)
//
//		var len as integer = GenParamNames[l]
//		var stopel as integer = --len
//
//		var destarr as string[] = new string[++len]
//
//		for i = 0 upto stopel
//			destarr[i] = GenParamNames[i]
//		end for
//
//		destarr[len] = nam
//		GenParamNames = destarr
//
//	end method

	[method: ComVisible(false)]
	method public static void PushNS(var ns as string)
		if NSStack::get_Count() != 0 then
			ns = #ternary{ ns like "^global::(.)*$" ? ParseUtils::StringParser(ns, ':')[1], i"{CurnNS}.{ns}"}
		else
			ns = #ternary{ ns like "^global::(.)*$" ? ParseUtils::StringParser(ns, ':')[1], ns}
		end if
		NSStack::Push(ns)
		CurnNS = ns
	end method

	[method: ComVisible(false)]
	method public static void PopNS()
		if NSStack::get_Count() == 0 then
			CurnNS = DfltNS
		else
			NSStack::Pop()
			CurnNS = #ternary{ NSStack::get_Count() == 0 ? DfltNS, NSStack::get_Last()}
		end if
	end method

end class