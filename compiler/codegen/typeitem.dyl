//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi TypeItem

	field public string Name
	field public boolean IsStatic
	field public IKVM.Reflection.Type InhTyp
	field public IKVM.Reflection.Type BakedTyp
	field public C5.IList<of IKVM.Reflection.Type> Interfaces
	field public TypeBuilder TypeBldr
	field public EnumBuilder EnumBldr
	field public C5.IList<of MethodItem> Methods
	field public C5.IList<of CtorItem> Ctors
	field public C5.HashDictionary<of string, FieldItem> Fields
	field public boolean IsEnum

	method private void TypeItem(var nme as string, var bld as TypeBuilder, var bld3 as EnumBuilder)
		me::ctor()
		IsStatic = false
		Name = nme
		TypeBldr = bld
		EnumBldr = bld3
		InhTyp = null
		Interfaces = new C5.LinkedList<of IKVM.Reflection.Type>()
		Methods = new C5.LinkedList<of MethodItem>()
		Ctors = new C5.LinkedList<of CtorItem>()
		Fields = new C5.HashDictionary<of string, FieldItem>()
		BakedTyp = null
	end method
	
	method public void TypeItem(var nme as string, var bld as TypeBuilder)
		ctor(nme, bld, $EnumBuilder$null)
		IsEnum = false
	end method
	
	method public void TypeItem(var nme as string, var bld3 as EnumBuilder)
		ctor(nme, $TypeBuilder$null, bld3)
		IsEnum = true
	end method
	
	method public void TypeItem()
		ctor(string::Empty, $TypeBuilder$null)
	end method

	method public void AddField(var f as FieldItem)		
		if Fields::Contains(f::Name) then
			StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, "Field '" + f::Name + "' is already declared in the current class!")
		end if

		Fields::Add(f::Name, f)
	end method

	method public void AddMethod(var m as MethodItem)
		Methods::Add(m)
	end method

	method public void AddCtor(var c as CtorItem)
		Ctors::Add(c)
	end method

	method public void AddInterface(var i as IKVM.Reflection.Type)
		Interfaces::Add(i)
	end method
	
	method public void NormalizeInterfaces()
		Interfaces = new C5.LinkedList<of IKVM.Reflection.Type>() {AddAll(Enumerable::Distinct<of IKVM.Reflection.Type>(Interfaces))}
	end method

	method public MethodBuilder GetMethod(var nam as string, var paramst as IKVM.Reflection.Type[])
		var mil as MILambdas2 = new MILambdas2(nam, paramst)
		var lom2 as IEnumerable<of MethodItem> = Enumerable::Where<of MethodItem>(Methods,new Func<of MethodItem,boolean>(mil::DetermineIfCandidate()))
		var matches as MethodItem[] = Enumerable::ToArray<of MethodItem>(lom2)
		
		if matches[l] == 0 then
			return null
		elseif matches[l] == 1 then
			Loader::MemberTyp = matches[0]::MethodBldr::get_ReturnType()
			return matches[0]::MethodBldr
		else
			var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of MethodItem,integer[]>(lom2,new Func<of MethodItem,integer[]>(MILambdas2::ExtractDeriveness())),new Func<of integer[],integer,integer[]>(MILambdas2::ZipDeriveness())),new Func<of integer[],integer[],integer[]>(MILambdas2::DerivenessMax()))
			Loader::MemberTyp = matches[chosen[--chosen[l]]]::MethodBldr::get_ReturnType()
			return matches[chosen[--chosen[l]]]::MethodBldr
		end if
	end method
	
	method public MethodInfo GetGenericMethod(var nam as string, var genparams as IKVM.Reflection.Type[], var paramst as IKVM.Reflection.Type[])
		var mil as MILambdas2 = new MILambdas2(nam, genparams[l])
		var mil2 as MILambdas2 = new MILambdas2(genparams)
		var mil3 as MILambdas2 = new MILambdas2(nam, paramst)
		var glom as IEnumerable<of MethodInfo> = Enumerable::Where<of MethodInfo>(Enumerable::Select<of MethodItem, MethodInfo>(Enumerable::Where<of MethodItem>(Methods , new Func<of MethodItem,boolean>(mil::GenericMtdFilter())), new Func<of MethodItem,MethodInfo>(mil2::InstGenMtd())), new Func<of MethodInfo, boolean>(mil3::DetermineIfCandidate2()))
		var matches as MethodInfo[] = Enumerable::ToArray<of MethodInfo>(glom)
		
		if matches[l] == 0 then
			return null
		elseif matches[l] == 1 then
			Loader::MemberTyp = matches[0]::get_ReturnType()
			return matches[0]
		else
			var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of MethodInfo,integer[]>(glom,new Func<of MethodInfo,integer[]>(MILambdas2::ExtractDeriveness2())),new Func<of integer[],integer,integer[]>(MILambdas2::ZipDeriveness())),new Func<of integer[],integer[],integer[]>(MILambdas2::DerivenessMax()))
			Loader::MemberTyp = matches[chosen[--chosen[l]]]::get_ReturnType()
			return matches[chosen[--chosen[l]]]
		end if
	end method
	
	method public MethodItem GetProtoMethod(var nam as string, var paramst as IKVM.Reflection.Type[])
		var mil as MILambdas2 = new MILambdas2(nam, paramst)
		var lom2 as MethodItem[] = Enumerable::ToArray<of MethodItem>(Enumerable::Where<of MethodItem>(Methods,new Func<of MethodItem,boolean>(mil::DetermineIfProtoCandidate())))
		if lom2[l] > 0 then
			return lom2[0]
		else
			return null
		end if
	end method

	method public ConstructorBuilder GetCtor(var paramst as IKVM.Reflection.Type[])
		var cil as CILambdas = new CILambdas(paramst)
		var loc2 as IEnumerable<of CtorItem> = Enumerable::Where<of CtorItem>(Ctors,new Func<of CtorItem,boolean>(cil::DetermineIfCandidate()))
		var matches as CtorItem[] = Enumerable::ToArray<of CtorItem>(loc2)
		
		if matches[l] == 0 then
			if (paramst[l] == 0) and (Ctors::get_Count() == 0) then
				var cb as ConstructorBuilder = TypeBldr::DefineDefaultConstructor(MethodAttributes::Public)
				Ctors::Add(new CtorItem(new IKVM.Reflection.Type[0], cb))
				Loader::MemberTyp = TypeBldr
				return cb
			else
				return null
			end if
		elseif matches[l] == 1 then
			Loader::MemberTyp = TypeBldr
			return matches[0]::CtorBldr
		else
			var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of CtorItem,integer[]>(loc2,new Func<of CtorItem,integer[]>(CILambdas::ExtractDeriveness())),new Func<of integer[],integer,integer[]>(CILambdas::ZipDeriveness())),new Func<of integer[],integer[],integer[]>(CILambdas::DerivenessMax()))
			Loader::MemberTyp = TypeBldr
			return matches[chosen[--chosen[l]]]::CtorBldr
		end if
	end method

	method public FieldBuilder GetField(var nam as string)
		Loader::FldLitFlag = false
		Loader::EnumLitFlag = false
	
		//var fil as FILambdas = new FILambdas(nam)
		//var matches as FieldItem[] = Enumerable::ToArray<of FieldItem>(Enumerable::Where<of FieldItem>(Fields,new Func<of FieldItem,boolean>(fil::DetermineIfCandidate())))

		var fld as FieldItem = #ternary { Fields::Contains(nam) ? Fields::get_Item(nam), $FieldItem$null }
		var fldinfo as FieldBuilder = #ternary { fld == null ? $FieldBuilder$null, fld::FieldBldr }

		//if matches[l] == 0 then
		//	fldinfo = null
		//else
		//	fld = matches[0]
		//	fldinfo = fld::FieldBldr
		//end if
		
		if fldinfo != null then
			Loader::MemberTyp = fldinfo::get_FieldType()
			Loader::FldLitFlag = fldinfo::get_IsLiteral()
			Loader::EnumLitFlag = IsEnum
			if Loader::FldLitFlag then
				Loader::FldLitVal = fld::LitVal
				Loader::FldLitTyp = fldinfo::get_FieldType()
			end if
			if IsEnum then
				Loader::EnumLitTyp = InhTyp
			end if
		end if
		
		return fldinfo
	end method

	method public hidebysig virtual string ToString()
		return Name
	end method

end class
