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
		foreach ns in new C5.LinkedList<of string>() {Add(string::Empty), AddAll(Importer::Imps)}
			var til as TILambdas = #ternary{ns::get_Length() == 0 ? new TILambdas(nam), new TILambdas(ns + "." + nam)}
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
		return #ternary{ti == null ? $IKVM.Reflection.Type$null, ti::TypeBldr}
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
						if (ctorinf::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) = false then
							if (ctorinf::get_IsFamilyOrAssembly() and (Loader::ProtectedFlag or true)) = false then
								if (ctorinf::get_IsFamily() and Loader::ProtectedFlag) = false then
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
		if (ILEmitter::StructFlg or ILEmitter::InterfaceFlg or ILEmitter::StaticCFlg) == false then
			var ti as TypeItem = GetTypeItem(t)
			if ti != null then
				if ti::Ctors::get_Count() == 0 then
					Loader::ProtectedFlag = true
					var ctorinf as ConstructorInfo = GetDefaultCtor(ti::InhTyp)
					Loader::ProtectedFlag = false
					if ctorinf != null then
						var cb as ConstructorBuilder = ti::TypeBldr::DefineDefaultConstructor(MethodAttributes::Public)
						ti::Ctors::Add(new CtorItem(new IKVM.Reflection.Type[0], cb))
					end if
				end if
			end if
		end if
	end method
	
	method public void AddType(var t as TypeItem)
		t::DefCtorDel = new Func<of IKVM.Reflection.Type, ConstructorInfo>(GetDefaultCtor())
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
						if (fldinfo::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) = false then
							if (fldinfo::get_IsFamilyOrAssembly() and (Loader::ProtectedFlag or true)) = false then
								if (fldinfo::get_IsFamily() and Loader::ProtectedFlag) = false then
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
			
			if fldinfo = null then
				//Loader::ProtectedFlag = true
				fldinfo = GetField(ti::InhTyp,nam)
				if fldinfo = null then
					fldinfo = Loader::LoadField(ti::InhTyp, nam)
				end if
				//Loader::ProtectedFlag = false
			end if
			
			return fldinfo
		end if
	end method

	method public MethodInfo GetMethod(var t as IKVM.Reflection.Type,var mn as MethodNameTok,var paramst as IKVM.Reflection.Type[])
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			var mnstrarr as string[] = ParseUtils::StringParser(mn::Value, ":")
			var nam as string = mnstrarr[mnstrarr[l] - 1]
		
			var mtdinfo as MethodInfo = ti::GetMethod(nam,paramst)
			if mtdinfo != null then
				if !mtdinfo::get_IsPublic() then
					//filter out private members
					if !mtdinfo::get_IsPrivate() then
						if (mtdinfo::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) = false then
							if (mtdinfo::get_IsFamilyOrAssembly() and (Loader::ProtectedFlag or true)) = false then
								if (mtdinfo::get_IsFamily() and Loader::ProtectedFlag) = false then
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
						var i as integer = -1
						do until i = (genparams[l] - 1)
							i = i + 1
							genparams[i] = Helpers::CommitEvalTTok(gmn::Params[i])
						end do
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
