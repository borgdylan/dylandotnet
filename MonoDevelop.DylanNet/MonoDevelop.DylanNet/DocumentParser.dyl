//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class private ParserLambdas
		
		field private ParsedDocument doc
		//field private string filename

		method assembly void ParserLambdas(var d as ParsedDocument)
			doc = d
			//filename = fn
		end method

		method assembly void ErrorH(var cm as CompilerMsg)
			doc::get_Errors()::Add(new ICSharpCode.NRefactory.TypeSystem.Error(ErrorType::Error, cm::get_Msg(), new DomRegion(cm::get_File(), cm::get_Line(), 0)))
			doc::set_IsInvalid(true)
		end method

		method assembly void WarnH(var cm as CompilerMsg)
			doc::get_Errors()::Add(new ICSharpCode.NRefactory.TypeSystem.Error(ErrorType::Warning, cm::get_Msg(), new DomRegion(cm::get_File(), cm::get_Line(), 0)))
		end method

		method assembly string ExtractVal(var t as Token)
			return t::Value
		end method
			
	end class

	class public ParserModel
		field public DefaultUnresolvedTypeDefinition curClass
		field public DefaultUnresolvedTypeDefinition curClass2
		field public DefaultUnresolvedMethod curMethod
		field public DefaultUnresolvedProperty curProp
		field public DefaultUnresolvedEvent curEvent
		field public boolean inClass
		field public boolean isNested
		field public boolean inEnum
		field public ITypeReference enumt
		field public integer cstart
		field public integer cfin
		field public boolean cf
		field public string cs
		field public string cst
		field public string fileName
		field public IList<of IUnresolvedTypeDefinition> classes
		field public ParsedDocumentDecorator doc

		method public void ParserModel(var fn as string, var d as ParsedDocumentDecorator, var c as IList<of IUnresolvedTypeDefinition>)
			fileName = fn
			classes = c
			doc = d
		end method

	end class

	class public beforefieldinit DocumentParser extends TypeSystemParser implements IFoldingParser
		
		field private static Action<of string> onstart

		event public static Action<of string> OnStart
			add
				if onstart == null then
					onstart = value
				else
					onstart = onstart + value
				end if
			end add
			remove
				if onstart != null then
					onstart = onstart - value
				end if
			end remove
		end event

		field private static Action<of string> onend

		event public static Action<of string> OnEnd
			add
				if onend == null then
					onend = value
				else
					onend = onend + value
				end if
			end add
			remove
				if onend != null then
					onend = onend - value
				end if
			end remove
		end event

		method public void DocumentParser()
			mybase::ctor()
		end method

		//method public static void DocumentParser()
		//end method
			
		method public ITypeReference ProcType(var tt as TypeTok)
			
			var res as ITypeReference = new UnknownType(new FullTypeName(tt::Value))

			if tt is VoidTok then
				res = KnownTypeReference::Void
			elseif tt is ObjectTok then
				res = KnownTypeReference::Object
			elseif tt is StringTok then
				res = KnownTypeReference::String
			elseif tt is IntegerTok then
				res = KnownTypeReference::Int32
			elseif tt is UIntegerTok then
				res = KnownTypeReference::UInt32
			elseif tt is ShortTok then
				res = KnownTypeReference::Int16
			elseif tt is UShortTok then
				res = KnownTypeReference::UInt16
			elseif tt is LongTok then
				res = KnownTypeReference::Int64
			elseif tt is ULongTok then
				res = KnownTypeReference::UInt64
			elseif tt is ByteTok then
				res = KnownTypeReference::Byte
			elseif tt is SByteTok then
				res = KnownTypeReference::SByte
			elseif tt is DecimalTok then
				res = KnownTypeReference::Decimal
			elseif tt is DoubleTok then
				res = KnownTypeReference::Double
			elseif tt is SingleTok then
				res = KnownTypeReference::Single
			elseif tt is BooleanTok then
				res = KnownTypeReference::Boolean
			elseif tt is GenericTypeTok then
				var gtt = $GenericTypeTok$tt
				var lst = new List<of ITypeReference>()

				foreach p in gtt::Params
					lst::Add(ProcType(p))
				end for

				res = new ParameterizedTypeReference(res, lst)
			end if

			if tt::IsArray then
				res = new ArrayTypeReference(res,1)
			end if
			if tt::IsByRef then
				res = new ByReferenceTypeReference(res)
			end if

			return res
		end method

		method private Accessibility ProcAccess(var attrs as IEnumerable<of Attributes.Attribute>)
			
			foreach a in attrs
				if a is PrivateAttr then
					return Accessibility::Private
				elseif a is PublicAttr then
					return Accessibility::Public
				elseif a is FamilyAttr then
					return Accessibility::Protected
				elseif a is AssemblyAttr then
					return Accessibility::Internal
				elseif a is FamORAssemAttr then
					return Accessibility::ProtectedOrInternal
				elseif a is FamANDAssemAttr then
					return Accessibility::ProtectedAndInternal
				end if
			end for

			return Accessibility::None
		end method

//		method private boolean IsOneLinerMethod(var attrs as IEnumerable<of Attributes.Attribute>)
//			
//			foreach a in attrs
//				if a is PinvokeImplAttr then
//					return true
//				elseif a is AbstractAttr then
//					return true
//				elseif a is PrototypeAttr then
//					return true
//				end if
//			end for
//
//			return false
//		end method
//
//		method private boolean IsOneLinerProperty(var attrs as IEnumerable<of Attributes.Attribute>)
//			
//			foreach a in attrs
//				if a is AutoGenAttr then
//					return true
//				end if
//			end for
//
//			return false
//		end method

		method private void SetAttrs(var aue as AbstractUnresolvedMember, var attrs as IEnumerable<of Attributes.Attribute>)
			var b2 as boolean[] = new boolean[] {false, false}
		
			foreach a in attrs
				if a is AbstractAttr then
					aue::set_IsAbstract(true)
				elseif a is VirtualAttr then
					aue::set_IsVirtual(true)
					b2[0] = true
				elseif a is HideBySigAttr then
					b2[1] = true
				elseif a is OverrideAttr then
					b2[0] = true
					b2[1] = true
				elseif a is StaticAttr then
					aue::set_IsStatic(true)
				end if
			end for

			if b2[0] then
				if b2[1] then
					aue::set_IsOverride(true)
				end if
			end if
		end method

		method private void SetTypeAttrs(var aue as DefaultUnresolvedTypeDefinition, var attrs as IEnumerable<of Attributes.Attribute>, var clss as ClassStmt)
			var isinterf = false
			foreach a in attrs
				if a is AbstractAttr then
					aue::set_IsAbstract(true)
				elseif a is StaticAttr then
					aue::set_IsStatic(true)
				elseif a is InterfaceAttr then
					aue::set_Kind(TypeKind::Interface)
					isinterf = true
				end if
			end for

			if !isinterf then
				if clss::InhClass::Value == "System.ValueType" orelse clss::InhClass::Value == "ValueType" then
					aue::set_Kind(TypeKind::Struct)
				end if

				aue::get_BaseTypes()::Add(ProcType(clss::InhClass))
			end if

			foreach i in clss::ImplInterfaces
				aue::get_BaseTypes()::Add(ProcType(i))
			end for

		end method

		method private void SetTypeAttrs(var aue as DefaultUnresolvedTypeDefinition, var attrs as IEnumerable<of Attributes.Attribute>, var clss as DelegateStmt)
			foreach a in attrs
				if a is AbstractAttr then
					aue::set_IsAbstract(true)
				end if
			end for

			aue::set_Kind(TypeKind::Delegate)
			aue::get_BaseTypes()::Add(KnownTypeReference::MulticastDelegate)
		end method

		method public integer GetEnd(var b as BlockStmt)
			var ch = b::get_Children()
			return #ternary {ch[l] > 0 ? ch[--ch[l]]::Line, b::Line}
		end method

		method public void Process(var stmts as IStmtContainer, var pm as ParserModel)
			foreach stmt in stmts::get_Children()
					pm::cf = false

					if stmt is ClassStmt then
						var clss = $ClassStmt$stmt
						if pm::inClass then
							pm::isNested = true
							pm::curClass2 = pm::curClass
							pm::curClass = new DefaultUnresolvedTypeDefinition(pm::curClass2, clss::ClassName::Value) {set_Region(new DomRegion(pm::fileName, clss::Line, 0)), _
								set_Accessibility(ProcAccess(clss::Attrs)), set_DeclaringTypeDefinition(pm::curClass2)}
							SetTypeAttrs(pm::curClass, clss::Attrs, clss)
							pm::curClass2::get_NestedTypes()::Add(pm::curClass)
						else
							pm::inClass = true
							pm::curClass = new DefaultUnresolvedTypeDefinition(clss::ClassName::Value) {set_Region(new DomRegion(pm::fileName, clss::Line, 0)), set_Accessibility(ProcAccess(clss::Attrs))}
							SetTypeAttrs(pm::curClass, clss::Attrs, clss)
							pm::classes::Add(pm::curClass)
						end if

						if clss::ClassName is GenericTypeTok then
							var i as integer = -1
							foreach p in #expr($GenericTypeTok$clss::ClassName)::Params
								i++
								pm::curClass::get_TypeParameters()::Add(new DefaultUnresolvedTypeParameter(SymbolKind::TypeDefinition, i, p::Value))
							end for
						end if

						Process(clss, pm)

						pm::doc::Add(new FoldingRegion(new DomRegion(clss::Line, integer::MaxValue, GetEnd(clss), integer::MaxValue),FoldType::Type))
						pm::curClass::set_BodyRegion(new DomRegion(clss::Line, 0, GetEnd(clss), integer::MaxValue))

						if pm::isNested then
							pm::isNested = false
							pm::curClass = pm::curClass2
						else
							pm::inClass = false
						end if
					elseif stmt is DelegateStmt then
						var clss = $DelegateStmt$stmt
						var del = new DefaultUnresolvedTypeDefinition(clss::DelegateName::Value) {set_Region(new DomRegion(pm::fileName, clss::Line, 0)), _
								set_Accessibility(ProcAccess(clss::Attrs)), set_BodyRegion(new DomRegion(pm::fileName, clss::Line, 0, clss::Line, integer::MaxValue))}
						SetTypeAttrs(del, clss::Attrs, clss)

						if clss::DelegateName is GenericMethodNameTok then
							var i as integer = -1
							foreach p in #expr($GenericMethodNameTok$clss::DelegateName)::Params
								i++
								del::get_TypeParameters()::Add(new DefaultUnresolvedTypeParameter(SymbolKind::TypeDefinition, i, p::Value))
							end for
						end if

						if pm::inClass then
							del::set_DeclaringTypeDefinition(pm::curClass)
							pm::curClass::get_NestedTypes()::Add(del)
						else
							pm::classes::Add(del)
						end if
					elseif stmt is CommentStmt then
						//TASK: not sure on this code
						if stmt::Tokens::get_Count() > 0 then
							pm::cf = true
							var pl = new ParserLambdas(pm::doc)
							var str as string = string::Join(" ", Enumerable::Select<of Token, string>(stmt::Tokens, new Func<of Token, string>(pl::ExtractVal)))
							pm::cst = str
							pm::doc::Add(new Comment(str) {set_Region(new DomRegion(pm::fileName, stmt::Line, 0)), set_CommentType(CommentType::SingleLine), set_OpenTag("//")})

							var t = Enumerable::FirstOrDefault<of Token>(Enumerable::Skip<of Token>(stmt::Tokens, 1))
							if t != null then
								var b as boolean = false
								var rt as CommentTag = null
								foreach tag in CommentTag::get_SpecialCommentTags()
									if t::Value::StartsWith(tag::get_Tag()) then
										b = true
										rt = tag
										break
									end if
								end for

								if b then
									var str2 = string::Join(" ", Enumerable::Select<of Token, string>(Enumerable::Skip<of Token>(stmt::Tokens, 2), new Func<of Token, string>(pl::ExtractVal)))
									pm::doc::Add(new Tag(rt::get_Tag(), str2, new DomRegion(pm::fileName, t::Line, 0)))
								end if
							end if
						end if
					elseif stmt is EnumStmt then
						var clss = $EnumStmt$stmt
						pm::curClass = new DefaultUnresolvedTypeDefinition(clss::EnumName::Value) {set_Region(new DomRegion(pm::fileName, clss::Line, 0)), set_Kind(TypeKind::Enum), set_Accessibility(ProcAccess(clss::Attrs))}
						pm::classes::Add(pm::curClass)
						pm::inEnum = true
						pm::enumt = ProcType(clss::EnumTyp)

						Process(clss, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(clss::Line, integer::MaxValue, GetEnd(clss), integer::MaxValue),FoldType::Type))
						pm::curClass::set_BodyRegion(new DomRegion(clss::Line, 0, GetEnd(clss), integer::MaxValue))
						pm::inEnum = false
					elseif stmt is AssignStmt
						if pm::inEnum then
							var ass = $AssignStmt$stmt
							pm::curClass::get_Members()::Add(new DefaultUnresolvedField(pm::curClass, ass::LExp::Tokens::get_Item(0)::Value) {set_Region(new DomRegion(pm::fileName, ass::Line, 0)), set_ReturnType(pm::enumt) _
								, set_BodyRegion(new DomRegion(pm::fileName, ass::Line, 0, ass::Line, integer::MaxValue)) } )
						end if
					elseif stmt is FieldStmt then
						var flss = $FieldStmt$stmt
						var fld = new DefaultUnresolvedField(pm::curClass, flss::FieldName::Value) {set_Region(new DomRegion(pm::fileName, flss::Line, 0)) , set_ReturnType(ProcType(flss::FieldTyp)), _
							set_Accessibility(ProcAccess(flss::Attrs)), set_BodyRegion(new DomRegion(pm::fileName, flss::Line, 0, flss::Line, integer::MaxValue)), set_DeclaringTypeDefinition(pm::curClass)} 
						SetAttrs(fld, flss::Attrs)
						pm::curClass::get_Members()::Add(fld)
					elseif stmt is PropertyStmt then
						var prss = $PropertyStmt$stmt
						var prop = new DefaultUnresolvedProperty(pm::curClass, prss::PropertyName::Value) {set_Region(new DomRegion(pm::fileName, prss::Line, 0)) , set_ReturnType(ProcType(prss::PropertyTyp)), _
							set_Accessibility(ProcAccess(prss::Attrs)), set_DeclaringTypeDefinition(pm::curClass)}
						SetAttrs(prop, prss::Attrs)
						pm::curProp = prop

						foreach p as VarExpr in prss::Params
							prop::set_SymbolKind(SymbolKind::Indexer)
							//{set_Region(new DomRegion(fileName, prss::Line, 0))}
							prop::get_Parameters()::Add(new DefaultUnresolvedParameter(ProcType(p::VarTyp), p::VarName::Value) )
						end for

						pm::curClass::get_Members()::Add(prop)

						if prss::IsOneLiner(prss::get_Parent()) then
							prop::set_BodyRegion(new DomRegion(pm::fileName, prss::Line, 0, prss::Line, integer::MaxValue))
						else
							Process(prss, pm)
							pm::doc::Add(new FoldingRegion(new DomRegion(prss::Line, integer::MaxValue, GetEnd(prss), integer::MaxValue),FoldType::Member))
							prop::set_BodyRegion(new DomRegion(prss::Line, integer::MaxValue, GetEnd(prss), integer::MaxValue))
						end if
					elseif stmt is EventStmt then
						var evss = $EventStmt$stmt
						pm::curEvent = new DefaultUnresolvedEvent(pm::curClass, evss::EventName::Value) {set_Region(new DomRegion(pm::fileName, evss::Line, 0)) , set_ReturnType(ProcType(evss::EventTyp)), _
							set_Accessibility(ProcAccess(evss::Attrs)), set_DeclaringTypeDefinition(pm::curClass)}
						pm::curClass::get_Members()::Add(pm::curEvent)
						Process(evss, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(evss::Line, integer::MaxValue, GetEnd(evss), integer::MaxValue),FoldType::Member))
						pm::curEvent::set_BodyRegion(new DomRegion(evss::Line, integer::MaxValue, GetEnd(evss), integer::MaxValue))
					elseif stmt is MethodStmt then
						var mtss = $MethodStmt$stmt

						var met = new DefaultUnresolvedMethod(pm::curClass, mtss::MethodName::Value) {set_Region(new DomRegion(pm::fileName, mtss::Line, 0)) , set_ReturnType(ProcType(mtss::RetTyp)), _
							set_Accessibility(ProcAccess(mtss::Attrs)), set_DeclaringTypeDefinition(pm::curClass)}
						SetAttrs(met, mtss::Attrs)
						pm::curMethod = met

						foreach p as VarExpr in mtss::Params
							//{set_Region(new DomRegion(fileName, mtss::Line, 0))}
							met::get_Parameters()::Add(new DefaultUnresolvedParameter(ProcType(p::VarTyp), p::VarName::Value) )
						end for

						if mtss::MethodName is GenericMethodNameTok then
							var i as integer = -1
							foreach p in #expr($GenericMethodNameTok$mtss::MethodName)::Params
								i++
								met::get_TypeParameters()::Add(new DefaultUnresolvedTypeParameter(SymbolKind::Method, i, p::Value))
							end for
						end if

						if (mtss::MethodName::Value == pm::curClass::get_Name()) orelse (mtss::MethodName::Value like "^ctor\d*$") then
							met::set_SymbolKind(SymbolKind::Constructor)
						end if

						pm::curClass::get_Members()::Add(met)

						if mtss::IsOneLiner(mtss::get_Parent()) then
							met::set_HasBody(false)
							met::set_BodyRegion(new DomRegion(pm::fileName, mtss::Line, 0, mtss::Line, integer::MaxValue))
						else
							met::set_HasBody(true)
							Process(mtss, pm)
							pm::doc::Add(new FoldingRegion(new DomRegion(mtss::Line, integer::MaxValue, GetEnd(mtss), integer::MaxValue),FoldType::Member))
							met::set_BodyRegion(new DomRegion(mtss::Line, integer::MaxValue, GetEnd(mtss), integer::MaxValue))
						end if
					elseif stmt is IfStmt then
						var ifs = $IfStmt$stmt
						Process(ifs, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ifs::Line, integer::MaxValue, GetEnd(ifs), integer::MaxValue), FoldType::Undefined))
						foreach b in ifs::get_BranchChildren()
							Process(b, pm)
							pm::doc::Add(new FoldingRegion(new DomRegion(b::Line, integer::MaxValue, GetEnd(b), integer::MaxValue), FoldType::Undefined))
						end for
					elseif stmt is TryStmt then
						var ts = $TryStmt$stmt
						Process(ts, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ts::Line, integer::MaxValue, GetEnd(ts), integer::MaxValue), FoldType::Undefined))
						foreach b in ts::get_BranchChildren()
							Process(b, pm)
							pm::doc::Add(new FoldingRegion(new DomRegion(b::Line, integer::MaxValue, GetEnd(b), integer::MaxValue), FoldType::Undefined))
						end for
					elseif stmt is LockStmt then
						var ls = $LockStmt$stmt
						Process(ls, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ls::Line, integer::MaxValue, GetEnd(ls), integer::MaxValue), FoldType::Undefined))
					elseif stmt is TryLockStmt then
						var ls = $TryLockStmt$stmt
						Process(ls, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ls::Line, integer::MaxValue, GetEnd(ls), integer::MaxValue), FoldType::Undefined))
					elseif stmt is ForeachStmt then
						var ds = $ForeachStmt$stmt
						Process(ds, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ds::Line, integer::MaxValue, GetEnd(ds), integer::MaxValue), FoldType::Undefined))
					elseif stmt is DoStmt then
						var ds = $DoStmt$stmt
						Process(ds, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ds::Line, integer::MaxValue, GetEnd(ds), integer::MaxValue), FoldType::Undefined))
					elseif stmt is DoUntilStmt then
						var ds = $DoUntilStmt$stmt
						Process(ds, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ds::Line, integer::MaxValue, GetEnd(ds), integer::MaxValue), FoldType::Undefined))
					elseif stmt is DoWhileStmt then
						var ds = $DoWhileStmt$stmt
						Process(ds, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ds::Line, integer::MaxValue, GetEnd(ds), integer::MaxValue), FoldType::Undefined))
					elseif stmt is ForStmt then
						var ds = $ForStmt$stmt
						Process(ds, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(ds::Line, integer::MaxValue, GetEnd(ds), integer::MaxValue), FoldType::Undefined))
					elseif stmt is NSStmt then
						var nss = $NSStmt$stmt
						Process(nss, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(nss::Line, integer::MaxValue, GetEnd(nss), integer::MaxValue), FoldType::Undefined))
					elseif stmt is UsingAsgnStmt then
						var uss = $UsingAsgnStmt$stmt
						Process(uss, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(uss::Line, integer::MaxValue, GetEnd(uss), integer::MaxValue), FoldType::Undefined))
					elseif stmt is InfUsingAsgnStmt then
						var uss = $InfUsingAsgnStmt$stmt
						Process(uss, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(uss::Line, integer::MaxValue, GetEnd(uss), integer::MaxValue), FoldType::Undefined))
					elseif stmt is HIfStmt then
						var hs = $HIfStmt$stmt
						Process(hs, pm)
						pm::doc::Add(new FoldingRegion(new DomRegion(hs::Line, integer::MaxValue, GetEnd(hs), integer::MaxValue), FoldType::ConditionalDefine))
						foreach b in hs::get_BranchChildren()
							Process(b, pm)
							pm::doc::Add(new FoldingRegion(new DomRegion(b::Line, integer::MaxValue, GetEnd(b), integer::MaxValue), FoldType::ConditionalDefine))
						end for
					elseif stmt is PropertyGetStmt then
						var prgs = $PropertyGetStmt$stmt
						if !prgs::IsOneLiner(prgs::get_Parent()) then
							Process(prgs, pm)
							pm::doc::Add(new FoldingRegion(new DomRegion(prgs::Line, integer::MaxValue, GetEnd(prgs), integer::MaxValue), FoldType::Undefined))
						end if
					elseif stmt is PropertySetStmt then
						var prss = $PropertySetStmt$stmt
						if !prss::IsOneLiner(prss::get_Parent()) then
							Process(prss, pm)
							pm::doc::Add(new FoldingRegion(new DomRegion(prss::Line, integer::MaxValue, GetEnd(prss), integer::MaxValue), FoldType::Undefined))
						end if
					elseif stmt is RegionStmt then
						var rst = $RegionStmt$stmt
						Process(rst, pm)
						pm::doc::Add(new FoldingRegion(rst::Name::get_UnquotedValue(), new DomRegion(rst::Line, 0, GetEnd(rst), integer::MaxValue), FoldType::UserRegion))
					end if

					if pm::cf then
						if pm::cstart == -1 then
							pm::cstart = stmt::Line
							pm::cs = pm::cst
						end if
						pm::cfin = stmt::Line
					else
						if pm::cstart != -1 then
							if pm::cstart != pm::cfin then
								pm::doc::Add(new FoldingRegion(pm::cs, new DomRegion(pm::cstart, 0, pm::cfin, integer::MaxValue), #ternary { pm::inClass orelse pm::inEnum ? FoldType::CommentInsideMember, FoldType::Comment}))
							end if
							pm::cstart = -1
							pm::cfin = -1
						end if
					end if

				end for
		end method

		method public override ParsedDocument Parse (var storeAst as boolean, var fileName as string, var content as TextReader, var project as Project)
			
			if onstart != null then
				onstart::Invoke(fileName)
			end if

			StreamUtils::TerminateOnError = false
			var doc = new ParsedDocumentDecorator(new CSharpUnresolvedFile() {set_FileName(fileName)})
			var pl = new ParserLambdas(doc)
			var w = new Action<of CompilerMsg>(pl::WarnH)
			var e = new Action<of CompilerMsg>(pl::ErrorH)

				try
					StreamUtils::add_WarnH(w)
					StreamUtils::add_ErrorH(e)
					//doc::set_Flags(ParsedDocumentFlags::NonSerializable)
					var stmts = new Parser()::Parse(new Lexer()::AnalyzeCore(content, fileName))

//					if storeAst then
//						doc::set_Ast(stmts)
//					end if

					//TODO: call new stuff
					var pm = new ParserModel(fileName, doc, doc::get_TopLevelTypeDefinitions())
					Process(stmts, pm)

					if pm::cstart != -1 then
						if pm::cstart != pm::cfin then
							doc::Add(new FoldingRegion(new DomRegion(pm::cs, pm::cstart, 0, pm::cfin, integer::MaxValue), #ternary { pm::inClass orelse pm::inEnum ? FoldType::CommentInsideMember, FoldType::Comment}))
						end if
					end if

					try
						doc::set_LastWriteTimeUtc(File::GetLastWriteTimeUtc(fileName))
//						var docp = IdeApp::get_Workbench()::get_Pads()::get_DocumentOutlinePad()::get_Content() as IPadContent
//						if docp != null then
//							docp::RedrawContent()
//						end if
					catch ex as Exception
						doc::set_LastWriteTimeUtc(DateTime::get_UtcNow())
					end try
					doc::set_IsInvalid(false)
					if onend != null then
						onend::Invoke(fileName)
					end if
				catch ex as ErrorException
					doc::set_IsInvalid(true)
//					Console::WriteLine(ex::get_Message())
				catch ex as Exception
					doc::set_IsInvalid(true)
//					Console::WriteLine(ex::get_Message())
				finally
					StreamUtils::remove_WarnH(w)
					StreamUtils::remove_ErrorH(e)
				end try
			
			return doc
		end method

		method public virtual ParsedDocument Parse (var fileName as string, var content as string)
			return Parse(false, fileName, new StringReader(content), $Project$null)
		end method

	end class
	
end namespace
