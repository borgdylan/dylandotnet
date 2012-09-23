//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public auto ansi TypeList

	field public List<of TypeItem> Types

	method public void TypeList()
		me::ctor()
		Types = new List<of TypeItem>()
	end method

	method public TypeItem GetTypeItem(var nam as string)
		var lot as IEnumerable<of TypeItem> = Types
		var lon as IList<of string> = new List<of string>(Importer::Imps)
		var lonproxy as IEnumerable<of string> = lon
		lon::Add(String::Empty)
		var lone as IEnumerator<of string> = lonproxy::GetEnumerator()

		do while lone::MoveNext()
			var til as TILambdas
			if lone::get_Current()::get_Length() = 0 then
				til = new TILambdas(nam)
			else
				til = new TILambdas(lone::get_Current() + "." + nam)
			end if
			var lot2 as IEnumerable<of TypeItem> = Enumerable::Where<of TypeItem>(lot,new Func<of TypeItem,boolean>(til::DetermineIfCandidate()))
			var matches as TypeItem[] = Enumerable::ToArray<of TypeItem>(lot2)
			if matches[l] != 0 then
				return matches[0]
			end if
		end do

		return null
	end method

	method public TypeItem GetTypeItem(var t as IKVM.Reflection.Type)
		var lot as IEnumerable<of TypeItem> = Types
		var til as TILambdas = new TILambdas(t)
		var lot2 as IEnumerable<of TypeItem> = Enumerable::Where<of TypeItem>(lot,new Func<of TypeItem,boolean>(til::DetermineIfCandidateType()))
		var matches as TypeItem[] = Enumerable::ToArray<of TypeItem>(lot2)
		if matches[l] != 0 then
			return matches[0]
		end if
		return null
	end method
	
	method public IKVM.Reflection.Type GetType(var nam as string)
		var ti as TypeItem = GetTypeItem(nam)
		if ti = null then
			return null
		else
			return ti::TypeBldr
		end if
	end method


	method public ConstructorBuilder GetCtor(var t as IKVM.Reflection.Type,var paramst as IKVM.Reflection.Type[])
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			var ctorinf as ConstructorBuilder = ti::GetCtor(paramst)
			if ctorinf != null then
				if ctorinf::get_IsPublic() == false then
					//filter out private members
					if ctorinf::get_IsPrivate() = false then
						if (ctorinf::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) = false then
							if (ctorinf::get_IsFamilyOrAssembly() and (Loader::ProtectedFlag or true)) = false then
								if (ctorinf::get_IsFamily() and Loader::ProtectedFlag) = false then
									if ctorinf::get_IsAssembly() = false then
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
		if ti != null then
			return GetCtor(t, IKVM.Reflection.Type::EmptyTypes)
		else
			return Loader::LoadCtor(t, IKVM.Reflection.Type::EmptyTypes)
		end if
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
				if fldinfo::get_IsPublic() == false then
					//filter out private members
					if fldinfo::get_IsPrivate() = false then
						if (fldinfo::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) = false then
							if (fldinfo::get_IsFamilyOrAssembly() and (Loader::ProtectedFlag or true)) = false then
								if (fldinfo::get_IsFamily() and Loader::ProtectedFlag) = false then
									if fldinfo::get_IsAssembly() = false then
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
				Loader::ProtectedFlag = true
				fldinfo = GetField(ti::InhTyp,nam)
				if fldinfo = null then
					fldinfo = Loader::LoadField(ti::InhTyp, nam)
				end if
				Loader::ProtectedFlag = false
			end if
			
			return fldinfo
		end if
	end method

	method public MethodInfo GetMethod(var t as IKVM.Reflection.Type,var nam as string,var paramst as IKVM.Reflection.Type[])
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			var mtdinfo as MethodInfo = ti::GetMethod(nam,paramst)
			if mtdinfo != null then
				if mtdinfo::get_IsPublic() == false then
					//filter out private members
					if mtdinfo::get_IsPrivate() = false then
						if (mtdinfo::get_IsFamilyAndAssembly() and Loader::ProtectedFlag) = false then
							if (mtdinfo::get_IsFamilyOrAssembly() and (Loader::ProtectedFlag or true)) = false then
								if (mtdinfo::get_IsFamily() and Loader::ProtectedFlag) = false then
									if mtdinfo::get_IsAssembly() = false then
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
				Loader::ProtectedFlag = true
				mtdinfo = GetMethod(ti::InhTyp,nam,paramst)
				if mtdinfo = null then
					mtdinfo = Loader::LoadMethod(ti::InhTyp, nam, paramst)
				end if
				Loader::ProtectedFlag = false
			end if
			
			return mtdinfo
		end if
	end method

end class
