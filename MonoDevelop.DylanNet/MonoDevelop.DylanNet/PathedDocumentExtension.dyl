﻿//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	//delegate public void MyDel(var x as integer)

	class private auto ansi PathedLambdas

		field private TextLocation location

		method assembly void PathedLambdas(var loc as TextLocation)
			mybase::ctor()
			location = loc
		end method

		method assembly boolean RegionIsInside(var t as IUnresolvedTypeDefinition)
			return #ternary {t == null ? false, t::get_BodyRegion()::IsInside(location)}
		end method

		method assembly boolean RegionIsInside(var e as IUnresolvedMember)
			return #ternary {e == null ? false, e::get_BodyRegion()::IsInside(location)}
		end method

	end class

	class public auto ansi PathedDocumentExtension extends TextEditorExtension implements IPathedDocument

		field private EventHandler<of DocumentPathChangedEventArgs> _PathChanged
		field private List<of PathEntry> _CurrentPath
		field private Mono.TextEditor.Caret caret
		field private EventHandler<of DocumentLocationEventArgs> pc

		property public virtual PathEntry[] CurrentPath
			get
				return Enumerable::ToArray<of PathEntry>(_CurrentPath ?? new List<of PathEntry>())
			end get
		end property

		method  public virtual Widget CreatePathWidget (var index as integer)
			return new Label() {set_TooltipText(get_CurrentPath()[index]::get_Markup()), set_HasTooltip(true)}
		end method

		event public virtual EventHandler<of DocumentPathChangedEventArgs> PathChanged
			add
				if _PathChanged == null then
					_PathChanged = value
				else
					_PathChanged = _PathChanged + value
				end if
			end add
			remove
				if _PathChanged != null then
					_PathChanged = _PathChanged - value
				end if
			end remove
		end event

		#region "Reimpl of DomRegion Searchers in terms of BodyRegion"
			method public IUnresolvedTypeDefinition GetTopLevelTypeDefinition(var doc as ParsedDocumentDecorator, var location as TextLocation)
				if doc == null then
					return null
				end if

				var pl = new PathedLambdas(location)
				return Enumerable::FirstOrDefault<of IUnresolvedTypeDefinition>(doc::get_TopLevelTypeDefinitions(), new Func<of IUnresolvedTypeDefinition, boolean>(pl::RegionIsInside))
			end method

			method public IUnresolvedTypeDefinition GetInnermostTypeDefinition(var doc as ParsedDocumentDecorator, var location as TextLocation)
				if doc == null then
					return null
				end if

				var parent as IUnresolvedTypeDefinition = null
				var type = GetTopLevelTypeDefinition(doc, location)
				var pl = new PathedLambdas(location)
				do while type != null
					parent = type
					type = Enumerable::FirstOrDefault<of IUnresolvedTypeDefinition>(parent::get_NestedTypes(), new Func<of IUnresolvedTypeDefinition, boolean>(pl::RegionIsInside))
				end do
				return parent
			end method

			method public IUnresolvedMember GetMember(var doc as ParsedDocumentDecorator, var location as TextLocation)
				if doc == null then
					return null
				end if

				var type = GetInnermostTypeDefinition(doc, location)
				if type == null then
					return null
				end if

				var pl = new PathedLambdas(location)
				return Enumerable::LastOrDefault<of IUnresolvedMember>(type::get_Members(), new Func<of IUnresolvedMember, boolean>(pl::RegionIsInside))
			end method
		end #region

		method private Xwt.Drawing.Image GetPixbuf(var t as IUnresolvedTypeDefinition)
			return ImageService::GetIcon(TypeSystem.Stock::GetStockIcon(t))
		end method

		method private Xwt.Drawing.Image GetPixbuf(var t as IUnresolvedMember)
			return ImageService::GetIcon(TypeSystem.Stock::GetStockIcon(t))
		end method

		method private string GetString(var tt as ITypeReference)

			var res as string = string::Empty

			if tt == KnownTypeReference::Void then
				res = "void"
			elseif tt == KnownTypeReference::Object then
				res = "object"
			elseif tt == KnownTypeReference::String then
				res = "string"
			elseif tt == KnownTypeReference::Int32 then
				res = "integer"
			elseif tt == KnownTypeReference::UInt32 then
				res = "uinteger"
			elseif tt == KnownTypeReference::Int16 then
				res = "short"
			elseif tt == KnownTypeReference::UInt16 then
				res = "ushort"
			elseif tt == KnownTypeReference::Int64 then
				res = "long"
			elseif tt == KnownTypeReference::UInt64 then
				res = "ulong"
			elseif tt == KnownTypeReference::Byte then
				res = "byte"
			elseif tt == KnownTypeReference::SByte then
				res = "sbyte"
			elseif tt == KnownTypeReference::Decimal then
				res = "decimal"
			elseif tt == KnownTypeReference::Double then
				res = "double"
			elseif tt == KnownTypeReference::Single then
				res = "single"
			elseif tt == KnownTypeReference::Boolean then
				res = "boolean"
			elseif tt is UnknownType then
				res = #expr($UnknownType$tt)::get_Name()
			elseif tt is ParameterizedTypeReference then
				var gtt = $ParameterizedTypeReference$tt
				var lst = string::Empty

				foreach p in gtt::get_TypeArguments()
					if lst != string:Empty
						lst = lst + ", "
					end if

					lst = lst + GetString(p)
				end for

				res = GetString(gtt::get_GenericType()) + "&lt;of " + lst + "&gt;"
			elseif tt is ArrayTypeReference then
				res = GetString(#expr($ArrayTypeReference$tt)::get_ElementType()) + "[]"
			elseif tt is ByReferenceTypeReference then
				res = GetString(#expr($ByReferenceTypeReference$tt)::get_ElementType()) + "&amp;"
			end if

			return res
		end method

		method private string GetStringM(var m as IUnresolvedMember)
			if m is IUnresolvedMethod then
				var accus as string = string::Empty
				foreach p in #expr($IUnresolvedMethod$m)::get_Parameters()
					if accus != string:Empty
						accus = accus + ", "
					end if

					accus = accus + GetString(p::get_Type())
				end for

				var accus2 as string = string::Empty
				foreach p in #expr($IUnresolvedMethod$m)::get_TypeParameters()
					if accus2 != string:Empty
						accus2 = accus2 + ", "
					end if

					accus2 = accus2 + p::get_Name()
				end for

				return m::get_Name() + #ternary { accus2 == string::Empty ? string::Empty, "&lt;of " + accus2 + "&gt;"} + "(" + accus +  ")"
			elseif m is IUnresolvedProperty then
				var accus as string = string::Empty
				foreach p in #expr($IUnresolvedProperty$m)::get_Parameters()
					if accus != string:Empty
						accus = accus + ", "
					end if

					accus = accus + GetString(p::get_Type())
				end for

				return m::get_Name() + #ternary { accus == string::Empty ? string::Empty, "[" + accus + "]"}
			end if

			return m::get_Name()
		end method

		method private string GetStringT(var m as IUnresolvedTypeDefinition)
			if m is IUnresolvedTypeDefinition then
				var accus2 as string = string::Empty
				foreach p in m::get_TypeParameters()
					if accus2 != string:Empty
						accus2 = accus2 + ", "
					end if

					accus2 = accus2 + p::get_Name()
				end for

				return m::get_Name() + #ternary { accus2 == string::Empty ? string::Empty, "&lt;of " + accus2 + "&gt;"}
			end if

			return m::get_Name()
		end method

		method private void UpdatePath (var sender as object, var e as Mono.TextEditor.DocumentLocationEventArgs)
			try
				if _CurrentPath == null then
					_CurrentPath = new List<of PathEntry> {new PathEntry("No Selection")}
				end if

				if _PathChanged != null then
					_PathChanged::Invoke(me, new DocumentPathChangedEventArgs(get_CurrentPath()))
				end if

				var parsedDocument = $ParsedDocumentDecorator$get_Document()::get_ParsedDocument()
				var textLoc as TextLocation = TypeSystem.HelperMethods::Convert(get_Document()::get_Editor()::get_Caret()::get_Location())

				if parsedDocument != null then
					
					_CurrentPath::Clear()
	
					var t = GetInnermostTypeDefinition(parsedDocument, textLoc)
					if t != null
	
						if t::get_DeclaringTypeDefinition() != null then
							_CurrentPath::Add(new PathEntry(GetPixbuf(t::get_DeclaringTypeDefinition()), GetStringT(t::get_DeclaringTypeDefinition())))
						end if
	
						_CurrentPath::Add(new PathEntry(GetPixbuf(t), GetStringT(t)))
						if t::get_Kind() != TypeKind::Delegate then
							var m = GetMember(parsedDocument, textLoc)
							if m != null then
								_CurrentPath::Add(new PathEntry(GetPixbuf(m), GetStringM(m)))
							else
								_CurrentPath::Add(new PathEntry("No Selection"))
							end if
						end if
					else
						_CurrentPath::Add(new PathEntry("No Selection"))
					end if
				else
					_CurrentPath::Clear()
					_CurrentPath::Add(new PathEntry("No Selection"))
				end if

			catch ex as Exception
				_CurrentPath::Clear()
				_CurrentPath::Add(new PathEntry("No Selection"))
			finally
				try
					if _PathChanged != null then
						_PathChanged::Invoke(me, new DocumentPathChangedEventArgs(get_CurrentPath()))
					end if
				catch ex as Exception
				end try
			end try

		end method

		method public void OnStart(var fn as string)
			if fn != null andalso new FilePath(fn) == get_Document()::get_FileName() then
				//caret::remove_PositionChanged(pc)
				_CurrentPath::Clear()
			end if
		end method

		method public void OnEnd(var fn as string)
			if fn != null andalso new FilePath(fn) == get_Document()::get_FileName() then
				//caret::add_PositionChanged(pc)
			end if
		end method

		method public override void Initialize()
			try
				DocumentParser::add_OnStart(new Action<of string>(OnStart))
				DocumentParser::add_OnEnd(new Action<of string>(OnEnd))
				pc = new EventHandler<of DocumentLocationEventArgs>(UpdatePath)
				caret = get_Document()::get_Editor()::get_Caret()
				_CurrentPath = new List<of PathEntry>()
				_CurrentPath::Add(new PathEntry("No Selection"))
				//UpdatePath(null, $Mono.TextEditor.DocumentLocationEventArgs$null)
			catch ex as Exception
			end try
		end method

	end class

end namespace
