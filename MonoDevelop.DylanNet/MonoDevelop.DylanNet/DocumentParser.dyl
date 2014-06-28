//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class private auto ansi ParserLambdas
		
		field private ParsedDocument doc
		//field private string filename

		method assembly void ParserLambdas(var d as ParsedDocument)
			doc = d
			//filename = fn
		end method

		method assembly void ErrorH(var cm as CompilerMsg)
			doc::get_Errors()::Add(new Error(ErrorType::Error, cm::get_Msg(), new DomRegion(cm::get_File(), cm::get_Line(), 0)))
			doc::set_IsInvalid(true)
		end method

		method assembly void WarnH(var cm as CompilerMsg)
			doc::get_Errors()::Add(new Error(ErrorType::Warning, cm::get_Msg(), new DomRegion(cm::get_File(), cm::get_Line(), 0)))
		end method

		method assembly string ExtractVal(var t as Token)
			return t::Value
		end method
			
	end class

	class public auto ansi beforefieldinit DocumentParser extends TypeSystemParser implements IFoldingParser
		
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
			me::ctor()
		end method

		method public static void DocumentParser()
		end method
			
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

		method private boolean IsOneLinerMethod(var attrs as IEnumerable<of Attributes.Attribute>)
			
			foreach a in attrs
				if a is PinvokeImplAttr then
					return true
				elseif a is AbstractAttr then
					return true
				elseif a is PrototypeAttr then
					return true
				end if
			end for

			return false
		end method

		method private boolean IsOneLinerProperty(var attrs as IEnumerable<of Attributes.Attribute>)
			
			foreach a in attrs
				if a is AutoGenAttr then
					return true
				end if
			end for

			return false
		end method

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
					var classes = doc::get_TopLevelTypeDefinitions()
					var stmts as IEnumerable<of Stmt> = new Parser()::Parse(new Lexer()::AnalyzeCore(content, fileName))::Stmts

//					if storeAst then
//						doc::set_Ast(stmts)
//					end if

					var curClass as DefaultUnresolvedTypeDefinition = null
					var curClass2 as DefaultUnresolvedTypeDefinition = null
					var curMethod as DefaultUnresolvedMethod = null
					var curProp as DefaultUnresolvedProperty = null
					var curEvent as DefaultUnresolvedEvent = null
					var inClass as boolean = false
					var isNested as boolean = false
					var inEnum as boolean = false
					var enumt as ITypeReference = null
					var fs as Stack<of integer> = new Stack<of integer>()
					var rs as Stack<of string> = new Stack<of string>()
					var cstart as integer = -1
					var cfin as integer = -1
					var cf as boolean = false
					var cs as string = null
					var cst as string = null

					foreach stmt in stmts
						
						cf = false

						if stmt is ClassStmt then
							var clss = $ClassStmt$stmt
							fs::Push(clss::Line)
							if inClass then
								isNested = true
								curClass2 = curClass
								curClass = new DefaultUnresolvedTypeDefinition(curClass2, clss::ClassName::Value) {set_Region(new DomRegion(fileName, clss::Line, 0)), _
									set_Accessibility(ProcAccess(clss::Attrs)), set_DeclaringTypeDefinition(curClass2)}
								SetTypeAttrs(curClass, clss::Attrs, clss)
								curClass2::get_NestedTypes()::Add(curClass)
							else
								inClass = true
								curClass = new DefaultUnresolvedTypeDefinition(clss::ClassName::Value) {set_Region(new DomRegion(fileName, clss::Line, 0)), set_Accessibility(ProcAccess(clss::Attrs))}
								SetTypeAttrs(curClass, clss::Attrs, clss)
								classes::Add(curClass)
							end if

							if clss::ClassName is GenericTypeTok then
								var i as integer = -1
								foreach p in #expr($GenericTypeTok$clss::ClassName)::Params
									i++
									curClass::get_TypeParameters()::Add(new DefaultUnresolvedTypeParameter(SymbolKind::TypeDefinition, i, p::Value))
								end for
							end if

						elseif stmt is DelegateStmt then
							var clss = $DelegateStmt$stmt
							var del = new DefaultUnresolvedTypeDefinition(clss::DelegateName::Value) {set_Region(new DomRegion(fileName, clss::Line, 0)), _
									set_Accessibility(ProcAccess(clss::Attrs)), set_BodyRegion(new DomRegion(fileName, clss::Line, 0, clss::Line, integer::MaxValue))}
							SetTypeAttrs(del, clss::Attrs, clss)

							if clss::DelegateName is GenericMethodNameTok then
								var i as integer = -1
								foreach p in #expr($GenericMethodNameTok$clss::DelegateName)::Params
									i++
									del::get_TypeParameters()::Add(new DefaultUnresolvedTypeParameter(SymbolKind::TypeDefinition, i, p::Value))
								end for
							end if

							if inClass then
								del::set_DeclaringTypeDefinition(curClass)
								curClass::get_NestedTypes()::Add(del)
							else
								classes::Add(del)
							end if
						elseif stmt is CommentStmt then
							//TASK: not sure on this code
							if stmt::Tokens::get_Count() > 0 then
								cf = true

								var str as string = string::Join(" ", Enumerable::Select<of Token, string>(stmt::Tokens, new Func<of Token, string>(pl::ExtractVal)))
								cst = str
								doc::Add(new Comment(str) {set_Region(new DomRegion(fileName, stmt::Line, 0)), set_CommentType(CommentType::SingleLine), set_OpenTag("//")})

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
										doc::Add(new Tag(rt::get_Tag(), str2, new DomRegion(fileName, t::Line, 0)))
									end if
								end if
							end if
						elseif stmt is EndClassStmt
							if isNested then
								isNested = false

								if fs::get_Count() > 0 then
									var pv = fs::Pop()
									doc::Add(new FoldingRegion(new DomRegion(pv, integer::MaxValue, stmt::Line, integer::MaxValue),FoldType::Type))
									curClass::set_BodyRegion(new DomRegion(pv, 0, stmt::Line, integer::MaxValue))
								end if

								curClass = curClass2
							else
								inClass = false

								if fs::get_Count() > 0 then
									var pv = fs::Pop()
									doc::Add(new FoldingRegion(new DomRegion(pv, integer::MaxValue, stmt::Line, integer::MaxValue),FoldType::Type))
									curClass::set_BodyRegion(new DomRegion(pv, 0, stmt::Line, integer::MaxValue))
								end if
							end if

						elseif stmt is EnumStmt then
							var clss = $EnumStmt$stmt
							fs::Push(clss::Line)
							
							curClass = new DefaultUnresolvedTypeDefinition(clss::EnumName::Value) {set_Region(new DomRegion(fileName, clss::Line, 0)), set_Kind(TypeKind::Enum), set_Accessibility(ProcAccess(clss::Attrs))}
							classes::Add(curClass)
							inEnum = true
							enumt = ProcType(clss::EnumTyp)
						elseif stmt is AssignStmt
							if inEnum then
								var ass = $AssignStmt$stmt
								curClass::get_Members()::Add(new DefaultUnresolvedField(curClass, ass::LExp::Tokens::get_Item(0)::Value) {set_Region(new DomRegion(fileName, ass::Line, 0)), set_ReturnType(enumt) _
									, set_BodyRegion(new DomRegion(fileName, ass::Line, 0, ass::Line, integer::MaxValue)) } )
							end if
						elseif stmt is EndEnumStmt then
							inEnum = false
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, integer::MaxValue, stmt::Line, integer::MaxValue),FoldType::Type))
								curClass::set_BodyRegion(new DomRegion(pv, 0, stmt::Line, integer::MaxValue))
							end if
						elseif stmt is FieldStmt then
							var flss = $FieldStmt$stmt
							var fld = new DefaultUnresolvedField(curClass, flss::FieldName::Value) {set_Region(new DomRegion(fileName, flss::Line, 0)) , set_ReturnType(ProcType(flss::FieldTyp)), _
								set_Accessibility(ProcAccess(flss::Attrs)), set_BodyRegion(new DomRegion(fileName, flss::Line, 0, flss::Line, integer::MaxValue)), set_DeclaringTypeDefinition(curClass)} 
							SetAttrs(fld, flss::Attrs)
							curClass::get_Members()::Add(fld)
						elseif stmt is PropertyStmt then
							var prss = $PropertyStmt$stmt
							var prop = new DefaultUnresolvedProperty(curClass, prss::PropertyName::Value) {set_Region(new DomRegion(fileName, prss::Line, 0)) , set_ReturnType(ProcType(prss::PropertyTyp)), _
								set_Accessibility(ProcAccess(prss::Attrs)), set_DeclaringTypeDefinition(curClass)}
							SetAttrs(prop, prss::Attrs)
							curProp = prop

							if !IsOneLinerProperty(prss::Attrs) then
								fs::Push(prss::Line)
							else
								prop::set_BodyRegion(new DomRegion(fileName, prss::Line, 0, prss::Line, integer::MaxValue))
							end if

							foreach p as VarExpr in prss::Params
								prop::set_SymbolKind(SymbolKind::Indexer)
								//{set_Region(new DomRegion(fileName, prss::Line, 0))}
								prop::get_Parameters()::Add(new DefaultUnresolvedParameter(ProcType(p::VarTyp), p::VarName::Value) )
							end for

							curClass::get_Members()::Add(prop)
						elseif stmt is EventStmt then
							var evss = $EventStmt$stmt
							fs::Push(evss::Line)
							curEvent = new DefaultUnresolvedEvent(curClass, evss::EventName::Value) {set_Region(new DomRegion(fileName, evss::Line, 0)) , set_ReturnType(ProcType(evss::EventTyp)), _
								set_Accessibility(ProcAccess(evss::Attrs)), set_DeclaringTypeDefinition(curClass)}
							curClass::get_Members()::Add(curEvent)
						elseif stmt is MethodStmt then
							var mtss = $MethodStmt$stmt

							var met = new DefaultUnresolvedMethod(curClass, mtss::MethodName::Value) {set_Region(new DomRegion(fileName, mtss::Line, 0)) , set_ReturnType(ProcType(mtss::RetTyp)), _
								set_Accessibility(ProcAccess(mtss::Attrs)), set_DeclaringTypeDefinition(curClass)}
							SetAttrs(met, mtss::Attrs)
							curMethod = met

							if !IsOneLinerMethod(mtss::Attrs) then
								fs::Push(mtss::Line)
								met::set_HasBody(true)
							else
								met::set_HasBody(false)
								met::set_BodyRegion(new DomRegion(fileName, mtss::Line, 0, mtss::Line, integer::MaxValue))
							end if

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

							if (mtss::MethodName::Value == curClass::get_Name()) orelse (mtss::MethodName::Value like "^ctor\d*$") then
								met::set_SymbolKind(SymbolKind::Constructor)
							end if

							curClass::get_Members()::Add(met)
						elseif stmt is EndMethodStmt then
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, integer::MaxValue, stmt::Line, integer::MaxValue),FoldType::Member))
								curMethod::set_BodyRegion(new DomRegion(pv, 0, stmt::Line,integer::MaxValue))
							end if
						elseif stmt is EndPropStmt then
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, integer::MaxValue, stmt::Line, integer::MaxValue),FoldType::Member))
								curProp::set_BodyRegion(new DomRegion(pv, 0, stmt::Line, integer::MaxValue))
							end if
						elseif stmt is EndEventStmt then
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, integer::MaxValue, stmt::Line, integer::MaxValue),FoldType::Member))
								curEvent::set_BodyRegion(new DomRegion(pv, 0, stmt::Line, integer::MaxValue))
							end if
						elseif stmt is IfStmt then
							fs::Push(stmt::Line)
						elseif stmt is ElseIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, --stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is ElseStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, --stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is EndIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is TryStmt then
							fs::Push(stmt::Line)
						elseif stmt is CatchStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, --stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is FinallyStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, --stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is EndTryStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is LockStmt then
							fs::Push(stmt::Line)
						elseif stmt is TryLockStmt then
							fs::Push(stmt::Line)
						elseif stmt is EndLockStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is ForeachStmt then
							fs::Push(stmt::Line)
						elseif stmt is DoStmt then
							fs::Push(stmt::Line)
						elseif stmt is DoUntilStmt then
							fs::Push(stmt::Line)
						elseif stmt is DoWhileStmt then
							fs::Push(stmt::Line)
						elseif stmt is ForStmt then
							fs::Push(stmt::Line)
						elseif stmt is NSStmt then
							fs::Push(stmt::Line)
						elseif stmt is EndDoStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is UntilStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is WhileStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is VarAsgnStmt then
							if #expr($VarAsgnStmt$stmt)::IsUsing then
								fs::Push(stmt::Line)
							end if
						elseif stmt is InfVarAsgnStmt then
							if #expr($InfVarAsgnStmt$stmt)::IsUsing then
								fs::Push(stmt::Line)
							end if
						elseif stmt is EndUsingStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is EndNSStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is HIfStmt then
							fs::Push(stmt::Line)
						elseif stmt is HElseIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, --stmt::Line, integer::MaxValue), FoldType::ConditionalDefine))
							end if
							fs::Push(stmt::Line)
						elseif stmt is HElseStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, --stmt::Line, integer::MaxValue), FoldType::ConditionalDefine))
							end if
							fs::Push(stmt::Line)
						elseif stmt is EndHIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::ConditionalDefine))
							end if
						elseif stmt is PropertyGetStmt then
							if (#expr($PropertyGetStmt$stmt)::Getter == null) andalso !curProp::get_IsAbstract() then
								fs::Push(stmt::Line)
							end if
						elseif stmt is PropertySetStmt then
							if (#expr($PropertySetStmt$stmt)::Setter == null) andalso !curProp::get_IsAbstract() then
								fs::Push(stmt::Line)
							end if
						elseif stmt is EndGetStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is EndSetStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), integer::MaxValue, stmt::Line, integer::MaxValue), FoldType::Undefined))
							end if
						elseif stmt is RegionStmt then
							fs::Push(stmt::Line)
							var rst = $RegionStmt$stmt
							rs::Push(rst::Name::get_UnquotedValue())
						elseif stmt is EndRegionStmt then
							var nam = #ternary {rs::get_Count() > 0 ? rs::Pop(), $string$null}
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(nam, new DomRegion(fs::Pop(), 0, stmt::Line, integer::MaxValue), FoldType::UserRegion))
							end if
						end if

						if cf then
							if cstart == -1 then
								cstart = stmt::Line
								cs = cst
							end if
							cfin = stmt::Line
						else
							if cstart != -1 then
								if cstart != cfin then
									doc::Add(new FoldingRegion(cs, new DomRegion(cstart, 0, cfin, integer::MaxValue), #ternary { inClass orelse inEnum ? FoldType::CommentInsideMember, FoldType::Comment}))
								end if
								cstart = -1
								cfin = -1
							end if
						end if

					end for

					if cstart != -1 then
						if cstart != cfin then
							doc::Add(new FoldingRegion(new DomRegion(cs, cstart, 0, cfin, integer::MaxValue), #ternary { inClass orelse inEnum ? FoldType::CommentInsideMember, FoldType::Comment}))
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

		method public override newslot ParsedDocument Parse (var fileName as string, var content as string)
			return Parse(false, fileName, new StringReader(content), $Project$null)
		end method

	end class
	
end namespace
