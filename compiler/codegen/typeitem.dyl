//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi TypeItem

	field public string Name
	field public IKVM.Reflection.Type InhTyp
	field public C5.IList<of IKVM.Reflection.Type> Interfaces
	field public TypeBuilder TypeBldr
	field public C5.IList<of MethodItem> Methods
	field public C5.IList<of CtorItem> Ctors
	field public C5.IList<of FieldItem> Fields
	field assembly Func<of IKVM.Reflection.Type, ConstructorInfo> DefCtorDel

	method public void TypeItem()
		me::ctor()
		Name = String::Empty
		InhTyp = null
		TypeBldr = null
		Interfaces = new C5.LinkedList<of IKVM.Reflection.Type>()
		Methods = new C5.LinkedList<of MethodItem>()
		Ctors = new C5.LinkedList<of CtorItem>()
		Fields = new C5.LinkedList<of FieldItem>()
		DefCtorDel = null
	end method

	method public void TypeItem(var nme as string,var bld as TypeBuilder)
		me::ctor()
		Name = nme
		TypeBldr = bld
		Interfaces = new C5.LinkedList<of IKVM.Reflection.Type>()
		Methods = new C5.LinkedList<of MethodItem>()
		Ctors = new C5.LinkedList<of CtorItem>()
		Fields = new C5.LinkedList<of FieldItem>()
		DefCtorDel = null
	end method

	method public void AddField(var f as FieldItem)
		Fields::Add(f)
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

	method public MethodBuilder GetMethod(var nam as string, var paramst as IKVM.Reflection.Type[])
		var mil as MILambdas2 = new MILambdas2(nam, paramst)
		var lom2 as IEnumerable<of MethodItem> = Enumerable::Where<of MethodItem>(Methods,new Func<of MethodItem,boolean>(mil::DetermineIfCandidate()))
		var matches as MethodItem[] = Enumerable::ToArray<of MethodItem>(lom2)
		
		if matches[l] = 0 then
			return null
		elseif matches[l] = 1 then
			Loader::MemberTyp = matches[0]::MethodBldr::get_ReturnType()
			return matches[0]::MethodBldr
		else
			var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of MethodItem,integer[]>(lom2,new Func<of MethodItem,integer[]>(MILambdas2::ExtractDeriveness())),new Func<of integer[],integer,integer[]>(MILambdas2::ZipDeriveness())),new Func<of integer[],integer[],integer[]>(MILambdas2::DerivenessMax()))
			Loader::MemberTyp = matches[chosen[chosen[l] - 1]]::MethodBldr::get_ReturnType()
			return matches[chosen[chosen[l] - 1]]::MethodBldr
		end if
	end method

	method public ConstructorBuilder GetCtor(var paramst as IKVM.Reflection.Type[])
		var cil as CILambdas = new CILambdas(paramst)
		var loc2 as IEnumerable<of CtorItem> = Enumerable::Where<of CtorItem>(Ctors,new Func<of CtorItem,boolean>(cil::DetermineIfCandidate()))
		var matches as CtorItem[] = Enumerable::ToArray<of CtorItem>(loc2)
		
		if matches[l] = 0 then
			if (paramst[l] = 0) and (Ctors::get_Count() = 0) then
				var cb as ConstructorBuilder = TypeBldr::DefineDefaultConstructor(MethodAttributes::Public)
				Ctors::Add(new CtorItem(new IKVM.Reflection.Type[0], cb))
				Loader::MemberTyp = TypeBldr
				return cb
			else
				return null
			end if
		elseif matches[l] = 1 then
			Loader::MemberTyp = TypeBldr
			return matches[0]::CtorBldr
		else
			var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of CtorItem,integer[]>(loc2,new Func<of CtorItem,integer[]>(CILambdas::ExtractDeriveness())),new Func<of integer[],integer,integer[]>(CILambdas::ZipDeriveness())),new Func<of integer[],integer[],integer[]>(CILambdas::DerivenessMax()))
			Loader::MemberTyp = TypeBldr
			return matches[chosen[chosen[l] - 1]]::CtorBldr
		end if
	end method

	method public FieldBuilder GetField(var nam as string)
		Loader::FldLitFlag = false
		Loader::EnumLitFlag = false
	
		var fil as FILambdas = new FILambdas(nam)
		var matches as FieldItem[] = Enumerable::ToArray<of FieldItem>(Enumerable::Where<of FieldItem>(Fields,new Func<of FieldItem,boolean>(fil::DetermineIfCandidate())))
			
		if matches[l] = 0 then
			return null
		else
			Loader::MemberTyp = matches[0]::FieldBldr::get_FieldType()
			return matches[0]::FieldBldr
		end if
	end method

	method public hidebysig virtual string ToString()
		return Name
	end method

end class
