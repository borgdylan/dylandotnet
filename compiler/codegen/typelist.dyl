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

	method public void AddType(var t as TypeItem)
		Types::Add(t)
	end method

	method public TypeItem GetTypeItem(var nam as string)
		var lot as IEnumerable<of TypeItem> = Types
		var lon as IList<of string> = new List<of string>(Importer::Imps)
		lon::Add("")
		var lone as IEnumerator<of string> = lon::GetEnumerator()

		do while lone::MoveNext()
			var til as TILambdas
			if lone::get_Current() = "" then
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

	method public TypeItem GetTypeItem(var t as Type)
		var lot as IEnumerable<of TypeItem> = Types
		var til as TILambdas = new TILambdas(t)
		var lot2 as IEnumerable<of TypeItem> = Enumerable::Where<of TypeItem>(lot,new Func<of TypeItem,boolean>(til::DetermineIfCandidateType()))
		var matches as TypeItem[] = Enumerable::ToArray<of TypeItem>(lot2)
		if matches[l] != 0 then
			return matches[0]
		end if
		return null
	end method

	method public Type GetType(var nam as string)
		var ti as TypeItem = GetTypeItem(nam)
		if ti = null then
			return null
		else
			return ti::TypeBldr
		end if
	end method


	method public ConstructorBuilder GetCtor(var t as Type,var paramst as Type[])
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			return ti::GetCtor(paramst)
		end if
	end method

	method public FieldBuilder GetField(var t as Type,var nam as string)
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			return ti::GetField(nam)
		end if
	end method

	method public MethodBuilder GetMethod(var t as Type,var nam as string,var paramst as Type[])
		var ti as TypeItem = GetTypeItem(t)
		if ti = null then
			return null
		else
			return ti::GetMethod(nam,paramst)
		end if
	end method

end class
