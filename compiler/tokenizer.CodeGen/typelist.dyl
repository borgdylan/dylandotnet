//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi static partial Helpers
	method public static prototype IKVM.Reflection.Type CommitEvalTTok(var tt as TypeTok)
end class

class public auto ansi TypeList

	field public C5.IList<of TypeItem> Types

	method public void TypeList()
		me::ctor()
		Types = new C5.LinkedList<of TypeItem>()
	end method

	method public TypeItem GetTypeItem(var nam as string, var gp as integer)
		var nest as boolean = false

		var na as string[] = ParseUtils::StringParser(nam, c'\\')
		nam = na[0]
		if na[l] > 1 then
			nest = true
		end if

		foreach alias in Importer::AliasMap::get_Keys()
			if nam == alias then
				nam = Importer::AliasMap::get_Item(alias)
				break
			elseif nam like ("^" + alias + "`\d+$") then
				nam = Importer::AliasMap::get_Item(alias) + nam::Substring(alias::get_Length())
				break
			elseif nam::StartsWith(alias + ".") then
				nam = Importer::AliasMap::get_Item(alias) + nam::Substring(alias::get_Length())
				break
			end if
		end for
		
		foreach ns in EnumerableEx::StartWith<of string>(EnumerableEx::Concat<of string>(Enumerable::ToArray<of C5.LinkedList<of string> >(Importer::ImpsStack::Backwards())), new string[] {string::Empty, AsmFactory::CurnNS})
			var til as TILambdas = new TILambdas(#ternary{ns::get_Length() == 0 ? nam , ns + "." + nam}, gp)
			var lot2 as IEnumerable<of TypeItem> = Enumerable::Where<of TypeItem>(Types,new Func<of TypeItem,boolean>(til::DetermineIfCandidate()))
			var match as TypeItem = Enumerable::FirstOrDefault<of TypeItem>(lot2)
			
			if match != null then
				if nest then
					match = match::GetTypeItem(na[1])
				end if

				return match
			end if
		end for
		
		return null
	end method

	method public TypeItem GetTypeItem(var t as IKVM.Reflection.Type)
		var til as TILambdas = new TILambdas(t)

		if t::get_IsNested() then
			foreach ti in Types
				var res = ti::GetTypeItem(t)
				if t != null then
					return res
				end if
			end for	
		else
			return Enumerable::FirstOrDefault<of TypeItem>(Enumerable::Where<of TypeItem>(Types,new Func<of TypeItem,boolean>(til::DetermineIfCandidateType())))
		end if
		return null
	end method
	
	method public IKVM.Reflection.Type GetType(var nam as string, var gp as integer)
		var ti as TypeItem = GetTypeItem(nam, gp)
		if ti == null then
			return null
		else
			return ti::BakedTyp ?? #ternary{ti::IsEnum ? ti::EnumBldr, ti::TypeBldr}
		end if
	end method


	method public ConstructorInfo GetCtor(var t as IKVM.Reflection.Type,var paramst as IKVM.Reflection.Type[], var auxt as IKVM.Reflection.Type)
		var ti as TypeItem = GetTypeItem(t)
		if ti == null then
			return null
		else
			var ctorinf as ConstructorInfo = ti::GetCtor(paramst, auxt)
			if ctorinf != null then
				if !ctorinf::get_IsPublic() then
					//filter out private members
					if !ctorinf::get_IsPrivate() then
						if !#expr(ctorinf::get_IsFamilyAndAssembly() andalso Loader::ProtectedFlag) then
							if !ctorinf::get_IsFamilyOrAssembly() then
								if !#expr(ctorinf::get_IsFamily() andalso Loader::ProtectedFlag) then
									if !ctorinf::get_IsAssembly() then
										ctorinf = null
									end if
								end if
							end if
						end if
					else
						ctorinf = null
					end if
				end if
			end if
			return ctorinf
		end if
	end method
	
	method assembly ConstructorInfo GetDefaultCtor(var t as IKVM.Reflection.Type)
		var ti as TypeItem = GetTypeItem(t)
		return #ternary {ti != null ? GetCtor(t, IKVM.Reflection.Type::EmptyTypes, t), Loader::LoadCtor(t, IKVM.Reflection.Type::EmptyTypes)}
	end method
	
	method public void EnsureDefaultCtor(var t as IKVM.Reflection.Type)
		if !#expr(ILEmitter::StructFlg or ILEmitter::InterfaceFlg or ILEmitter::StaticCFlg) then
			var ti as TypeItem = GetTypeItem(t)
			if ti != null then
				if ti::Ctors::get_Count() == 0 then
					Loader::ProtectedFlag = true
					var ctorinf as ConstructorInfo = GetDefaultCtor(ti::InhTyp)
					Loader::ProtectedFlag = false
					if ctorinf != null then
						var cb as ConstructorBuilder = ti::TypeBldr::DefineConstructor(#ternary {ILEmitter::AbstractCFlg ? MethodAttributes::Family, MethodAttributes::Public}, CallingConventions::Standard, IKVM.Reflection.Type::EmptyTypes)
						var ilg = cb::GetILGenerator()
						ilg::Emit(IKVM.Reflection.Emit.OpCodes::Ldarg_0)
						ilg::Emit(IKVM.Reflection.Emit.OpCodes::Call, ctorinf)
						ilg::Emit(IKVM.Reflection.Emit.OpCodes::Ret)
						ti::Ctors::Add(new CtorItem(IKVM.Reflection.Type::EmptyTypes, cb))
					end if
				end if
			end if
		end if
	end method
	
	method public void AddType(var t as TypeItem)
		Types::Add(t)
	end method

	method public FieldInfo GetField(var t as IKVM.Reflection.Type, var nam as string, var auxt as IKVM.Reflection.Type)
		var ti as TypeItem = GetTypeItem(t)
		if ti == null then
			return null
		else
			var fldinfo as FieldInfo = ti::GetField(nam, auxt)
			if fldinfo != null then
				if !fldinfo::get_IsPublic() then
					//filter out private members
					if !fldinfo::get_IsPrivate() then
						if !#expr(fldinfo::get_IsFamilyAndAssembly() andalso Loader::ProtectedFlag) then
							if !fldinfo::get_IsFamilyOrAssembly() then
								if !#expr(fldinfo::get_IsFamily() andalso Loader::ProtectedFlag) then
									if !fldinfo::get_IsAssembly() then
										fldinfo = null
									end if
								end if
							end if
						end if
					else
						fldinfo = null
					end if
				end if
			end if
			
			return fldinfo ?? (GetField(ti::InhTyp, nam, auxt::get_BaseType()) ?? Loader::LoadField(auxt::get_BaseType(), nam))
		end if
	end method

	method public MethodInfo GetMethod(var t as IKVM.Reflection.Type,var mn as MethodNameTok,var paramst as IKVM.Reflection.Type[], var auxt as IKVM.Reflection.Type)
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			var mnstrarr as string[] = ParseUtils::StringParser(mn::Value, ':')
			var nam as string = mnstrarr[--mnstrarr[l]]
		
			var mtdinfo as MethodInfo
			if mn is GenericMethodNameTok then
				var gmn as GenericMethodNameTok = $GenericMethodNameTok$mn
				var genparams as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[gmn::Params::get_Count()]
				var i = -1
				foreach gp in gmn::Params
					i++
					genparams[i] = Helpers::CommitEvalTTok(gp)
					if genparams[i] == null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Generic Argument {0} meant for Generic Method {1} could not be found!!", gp::ToString(), nam))
					end if
				end for
				mtdinfo = ti::GetGenericMethod(nam, genparams, paramst, auxt)
			else
				mtdinfo = ti::GetMethod(nam,paramst, auxt)
			end if
			
			if mtdinfo != null then
				if !mtdinfo::get_IsPublic() then
					//filter out private members
					if !mtdinfo::get_IsPrivate() then
						if !#expr(mtdinfo::get_IsFamilyAndAssembly() andalso Loader::ProtectedFlag) then
							if !mtdinfo::get_IsFamilyOrAssembly() then
								if !#expr(mtdinfo::get_IsFamily() andalso Loader::ProtectedFlag) then
									if !mtdinfo::get_IsAssembly() then
										mtdinfo = null
									end if
								end if
							end if
						end if
					else
						mtdinfo = null
					end if
				end if
			end if
			
			if mtdinfo == null then
				mtdinfo = GetMethod(ti::InhTyp,mn,paramst, auxt::get_BaseType())
				if mtdinfo = null then
					if mn is GenericMethodNameTok then
						var gmn as GenericMethodNameTok = $GenericMethodNameTok$mn
						var genparams as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[gmn::Params::get_Count()]
						var i = -1
						foreach gp in gmn::Params
							i++
							genparams[i] = Helpers::CommitEvalTTok(gp)
							if genparams[i] == null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Generic Argument {0} meant for Generic Method {1} could not be found!!", gp::ToString(), nam))
							end if
						end for
						mtdinfo = Loader::LoadGenericMethod(auxt::get_BaseType(), nam, genparams, paramst)
					else
						mtdinfo = Loader::LoadMethod(auxt::get_BaseType(), nam, paramst)
					end if
				end if
			end if
			
			if mtdinfo = null then
				if ti::Interfaces != null then
					foreach interf in ti::Interfaces
						mtdinfo = GetMethod(interf,mn,paramst, interf)

						if mtdinfo == null then
							mtdinfo = Loader::LoadMethod(interf, nam, paramst)
						else
							break
						end if
					end for
				end if
			end if

			return mtdinfo
		end if
	end method

end class
