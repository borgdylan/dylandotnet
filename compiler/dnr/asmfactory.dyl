//    dnr.dll dylan.NET.Reflection Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi static AsmFactory

	field public static boolean DebugFlg
	field public static boolean InMethodFlg
	field public static boolean InCtorFlg
	field public static boolean ChainFlg
	field public static boolean RefChainFlg
	field public static boolean PopFlg
	field public static boolean ForcedAddrFlg
	field public static boolean AddrFlg
	field public static IKVM.Reflection.AssemblyName AsmNameStr
	field public static IKVM.Reflection.Emit.AssemblyBuilder AsmB
	field public static IKVM.Reflection.Type Type01
	field public static IKVM.Reflection.Type Type02
	field public static IKVM.Reflection.Type Type03
	field public static IKVM.Reflection.Type Type04
	field public static IKVM.Reflection.Type Type05
	field public static IKVM.Reflection.Type CurnEventType
	field public static IKVM.Reflection.Emit.ModuleBuilder MdlB
	field public static ISymbolDocumentWriter DocWriter
	field public static string CurnNS
	field public static string DfltNS
	field public static string AsmMode
	field public static string AsmFile
	field public static string CurnTypName
	field public static string CurnMetName
	field public static IKVM.Reflection.Emit.MethodBuilder CurnMetB
	field public static IKVM.Reflection.Emit.ConstructorBuilder CurnConB
	field public static IKVM.Reflection.Emit.FieldBuilder CurnFldB
	field public static IKVM.Reflection.Emit.PropertyBuilder CurnPropB
	field public static IKVM.Reflection.Emit.EventBuilder CurnEventB
	field public static IKVM.Reflection.Emit.ILGenerator CurnILGen
	field public static IKVM.Reflection.Type CurnInhTyp
	field public static IKVM.Reflection.Emit.TypeBuilder CurnTypB
	field public static IKVM.Reflection.Emit.TypeBuilder CurnTypB2
	field public static IKVM.Reflection.Emit.TypeBuilder[] CurnTypList
	field public static boolean isNested
	field public static boolean inClass
	field public static IKVM.Reflection.Type[] TypArr
	field public static string[] GenParamNames
	field public static IKVM.Reflection.Emit.GenericTypeParameterBuilder[] GenParamTyps

	[method: ComVisible(false)]
	method public static void Init()
		DebugFlg = false
		ChainFlg = false
		RefChainFlg = false
		PopFlg = false
		AddrFlg = false
		ForcedAddrFlg = false
		InMethodFlg = false
		InCtorFlg = false
		CurnNS = String::Empty
		DfltNS = String::Empty
		AsmFile = String::Empty
		CurnTypList = new IKVM.Reflection.Emit.TypeBuilder[0]
		TypArr = new IKVM.Reflection.Type[0]
		GenParamNames = new string[0]
		GenParamTyps = new IKVM.Reflection.Emit.GenericTypeParameterBuilder[0]
		isNested = false
		inClass = false
	end method

	method private static void AsmFactory()
		AsmMode = String::Empty
		Init()
	end method

	[method: ComVisible(false)]
	method public static IKVM.Reflection.Type CreateTyp()
		return CurnTypB::CreateType()
	end method

	[method: ComVisible(false)]
	method public static void InitMtd()
		CurnMetB::DefineParameter(0, IKVM.Reflection.ParameterAttributes::Retval, String::Empty)
		CurnILGen = CurnMetB::GetILGenerator()
		ILEmitter::Met = CurnMetB
		ILEmitter::ILGen = CurnILGen
		ILEmitter::DebugFlg = DebugFlg
		ILEmitter::LocInd = -1
		if CurnMetB::get_IsStatic() then
			ILEmitter::ArgInd = -1
		else
			ILEmitter::ArgInd = 0
		end if
	end method

	[method: ComVisible(false)]
	method public static void InitConstr()
		CurnILGen = CurnConB::GetILGenerator()
		ILEmitter::Constr = CurnConB
		ILEmitter::ILGen = CurnILGen
		ILEmitter::DebugFlg = DebugFlg
		ILEmitter::LocInd = -1
		if CurnConB::get_IsStatic() then
			ILEmitter::ArgInd = -1
		else
			ILEmitter::ArgInd = 0
		end if
	end method

	[method: ComVisible(false)]
	method public static void InitDelConstr()
		CurnConB::DefineParameter(1, IKVM.Reflection.ParameterAttributes::None, "obj")
		CurnConB::DefineParameter(2, IKVM.Reflection.ParameterAttributes::None, "ptr")
		CurnConB::SetImplementationFlags(IKVM.Reflection.MethodImplAttributes::Runtime or IKVM.Reflection.MethodImplAttributes::Managed)
	end method

	[method: ComVisible(false)]
	method public static void InitDelMet()
		ILEmitter::Met = CurnMetB
		CurnMetB::SetImplementationFlags(IKVM.Reflection.MethodImplAttributes::Runtime or IKVM.Reflection.MethodImplAttributes::Managed)
	end method

	[method: ComVisible(false)]
	method public static void AddTypB(var typ as IKVM.Reflection.Emit.TypeBuilder)

		var len as integer = CurnTypList[l]
		var stopel as integer = len - 1
		var i as integer = -1

		var destarr as IKVM.Reflection.Emit.TypeBuilder[] = new IKVM.Reflection.Emit.TypeBuilder[len + 1]

		do until i = stopel
			i = i + 1
			destarr[i] = CurnTypList[i]
		end do

		destarr[len] = typ
		CurnTypList = destarr

	end method

	[method: ComVisible(false)]
	method public static void AddTyp(var typ as IKVM.Reflection.Type)

		var len as integer = TypArr[l]
		var stopel as integer = len - 1
		var i as integer = -1

		var destarr as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[len + 1]

		do until i = stopel
			i = i + 1
			destarr[i] = TypArr[i]
		end do
		
		destarr[len] = typ
		TypArr = destarr

	end method

	[method: ComVisible(false)]
	method public static void AddGenParamName(var nam as string)

		var len as integer = GenParamNames[l]
		var stopel as integer = len - 1
		var i as integer = -1

		var destarr as string[] = new string[len + 1]

		do until i = stopel
			i = i + 1
			destarr[i] = GenParamNames[i]
		end do
		
		destarr[len] = nam
		GenParamNames = destarr

	end method

end class
