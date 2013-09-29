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

	method public TypeItem GetTypeItem(var nam as string)
		
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
		
		foreach ns in EnumerableEx::StartWith<of string>(Importer::Imps, new string[] {string::Empty, AsmFactory::CurnNS})
			var til as TILambdas = new TILambdas(#ternary{ns::get_Length() == 0 ? nam , ns + "." + nam} )
			var lot2 as IEnumerable<of TypeItem> = Enumerable::Where<of TypeItem>(Types,new Func<of TypeItem,boolean>(til::DetermineIfCandidate()))
			var match as TypeItem = Enumerable::FirstOrDefault<of TypeItem>(lot2)
			
			if match != null then
				return match
			end if
		end for
		
		return null
	end method

	method public TypeItem GetTypeItem(var t as IKVM.Reflection.Type)
		var til as TILambdas = new TILambdas(t)
		return Enumerable::FirstOrDefault<of TypeItem>(Enumerable::Where<of TypeItem>(Types,new Func<of TypeItem,boolean>(til::DetermineIfCandidateType())))
	end method
	
	method public IKVM.Reflection.Type GetType(var nam as string)
		var ti as TypeItem = GetTypeItem(nam)
		if ti == null then
			return null
		else
			return ti::BakedTyp ?? #ternary{ti::IsEnum ? ti::EnumBldr, ti::TypeBldr}
		end if
	end method


	method public ConstructorBuilder GetCtor(var t as IKVM.Reflection.Type,var paramst as IKVM.Reflection.Type[])
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			var ctorinf as ConstructorBuilder = ti::GetCtor(paramst)
			if ctorinf != null then
				if !ctorinf::get_IsPublic() then
					//filter out private members
					if !ctorinf::get_IsPrivate() then
						if !#expr(ctorinf::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) then
							if !ctorinf::get_IsFamilyOrAssembly() then
								if !#expr(ctorinf::get_IsFamily() and Loader::ProtectedFlag) then
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
		return #ternary {ti != null ? GetCtor(t, IKVM.Reflection.Type::EmptyTypes), Loader::LoadCtor(t, IKVM.Reflection.Type::EmptyTypes)}
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

	method public FieldInfo GetField(var t as IKVM.Reflection.Type,var nam as string)
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			var fldinfo as FieldInfo = ti::GetField(nam)
			if fldinfo != null then
				if !fldinfo::get_IsPublic() then
					//filter out private members
					if !fldinfo::get_IsPrivate() then
						if !#expr(fldinfo::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) then
							if !fldinfo::get_IsFamilyOrAssembly() then
								if !#expr(fldinfo::get_IsFamily() and Loader::ProtectedFlag) then
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
			
			return fldinfo ?? (GetField(ti::InhTyp, nam) ?? Loader::LoadField(ti::InhTyp, nam))
		end if
	end method

	method public MethodInfo GetMethod(var t as IKVM.Reflection.Type,var mn as MethodNameTok,var paramst as IKVM.Reflection.Type[])
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			var mnstrarr as string[] = ParseUtils::StringParser(mn::Value, ":")
			var nam as string = mnstrarr[--mnstrarr[l]]
		
			var mtdinfo as MethodInfo
			if mn is GenericMethodNameTok then
				var gmn as GenericMethodNameTok = $GenericMethodNameTok$mn
				var genparams as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[gmn::Params[l]]
				for i = 0 upto --genparams[l]
					genparams[i] = Helpers::CommitEvalTTok(gmn::Params[i])
					if genparams[i] == null then
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Generic Argument {0} meant for Generic Method {1} could not be found!!", gmn::Params[i]::ToString(), nam))
					end if
				end for
				mtdinfo = ti::GetGenericMethod(nam, genparams, paramst)
			else
				mtdinfo = ti::GetMethod(nam,paramst)
			end if
			
			if mtdinfo != null then
				if !mtdinfo::get_IsPublic() then
					//filter out private members
					if !mtdinfo::get_IsPrivate() then
						if !#expr(mtdinfo::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) then
							if !mtdinfo::get_IsFamilyOrAssembly() then
								if !#expr(mtdinfo::get_IsFamily() and Loader::ProtectedFlag) then
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
			
			if mtdinfo = null then
				mtdinfo = GetMethod(ti::InhTyp,mn,paramst)
				if mtdinfo = null then
					if mn is GenericMethodNameTok then
						var gmn as GenericMethodNameTok = $GenericMethodNameTok$mn
						var genparams as IKVM.Reflection.Type[] = new IKVM.Reflection.Type[gmn::Params[l]]
						for i = 0 upto --genparams[l]
							genparams[i] = Helpers::CommitEvalTTok(gmn::Params[i])
							if genparams[i] == null then
								StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, string::Format("Generic Argument {0} meant for Generic Method {1} could not be found!!", gmn::Params[i]::ToString(), nam))
							end if
						end for
						mtdinfo = Loader::LoadGenericMethod(ti::InhTyp, nam, genparams, paramst)
					else
						mtdinfo = Loader::LoadMethod(ti::InhTyp, nam, paramst)
					end if
				end if
			end if
			
			if mtdinfo = null then
				if ti::Interfaces != null then
					foreach interf in ti::Interfaces
						mtdinfo = GetMethod(interf,mn,paramst)
						if mtdinfo = null then
							mtdinfo = Loader::LoadMethod(interf, nam, paramst)
						end if

						if mtdinfo != null then
							break
						end if
					end for
				end if
			end if

			return mtdinfo
		end if
	end method

end class
