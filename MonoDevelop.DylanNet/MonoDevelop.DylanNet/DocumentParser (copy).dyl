namespace MonoDevelop.DylanNet
	
	class private auto ansi ParserLambdas
		
		field private DefaultParsedDocument doc
		field private string filename

		method assembly void ParserLambdas(var d as DefaultParsedDocument, var fn as string)
			doc = d
			filename = fn
		end method

		method assembly void ErrorH(var cm as CompilerMsg)
			doc::get_Errors()::Add(new Error(ErrorType::Error, cm::get_Msg(), new DomRegion(cm::get_File(), cm::get_Line(), 0)))
			doc::set_IsInvalid(true)
		end method

		method assembly void WarnH(var cm as CompilerMsg)
			doc::get_Errors()::Add(new Error(ErrorType::Warning, cm::get_Msg(), new DomRegion(cm::get_File(), cm::get_Line(), 0)))
		end method

		method assembly string ExtractVal(var t as Token)
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
				doc::Add(new Tag(rt::get_Tag(), t::Value, new DomRegion(filename, t::Line, 0, t::Line, 10000)))
			end if

			return t::Value
		end method

	end class

	class public auto ansi beforefieldinit DocumentParser extends TypeSystemParser

		method public void DocumentParser()
			me::ctor()
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
			elseif tt is IntegerTok then
				res = KnownTypeReference::Int32
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

			if b2[0] and b2[1] then
				aue::set_IsOverride(true)
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
				aue::get_BaseTypes()::Add(ProcType(clss::InhClass))
			end if

			foreach i in clss::ImplInterfaces
				aue::get_BaseTypes()::Add(ProcType(i))
			end for

		end method
			
		method public hidebysig virtual ParsedDocument Parse (var storeAst as boolean, var fileName as string, var content as System.IO.TextReader, var project as MonoDevelop.Projects.Project)
			
			StreamUtils::TerminateOnError = false
			var doc = new DefaultParsedDocument (fileName) {set_Flags(ParsedDocumentFlags::NonSerializable)}
			var pl = new ParserLambdas(doc, fileName)
			var w = new Action<of CompilerMsg>(pl::WarnH)
			var e = new Action<of CompilerMsg>(pl::ErrorH)

				try
					StreamUtils::add_WarnH(w)
					StreamUtils::add_ErrorH(e)
					doc::set_Flags(doc::get_Flags() or ParsedDocumentFlags::NonSerializable)
					var classes = doc::get_TopLevelTypeDefinitions()
					var stmts as IEnumerable<of Stmt> = new Parser()::Parse(new Lexer()::AnalyzeCore(content, fileName))::Stmts

					if storeAst then
						doc::set_Ast(stmts)
					end if

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

					foreach stmt in stmts
						
						if stmt is ClassStmt then
							var clss = $ClassStmt$stmt
							fs::Push(clss::Line)
							if inClass then
								isNested = true
								curClass2 = curClass
								curClass = new DefaultUnresolvedTypeDefinition(curClass2, clss::ClassName::Value) {set_Region(new DomRegion(fileName, clss::Line, 0)), set_Accessibility(ProcAccess(clss::Attrs))}
								SetTypeAttrs(curClass, clss::Attrs, clss)
								curClass2::get_NestedTypes()::Add(curClass)
							else
								inClass = true
								curClass = new DefaultUnresolvedTypeDefinition(clss::ClassName::Value) {set_Region(new DomRegion(fileName, clss::Line, 0)), set_Accessibility(ProcAccess(clss::Attrs))}
								SetTypeAttrs(curClass, clss::Attrs, clss)
								classes::Add(curClass)
							end if
						elseif stmt is CommentStmt then
							//HACK: not sure on this code
							if stmt::Tokens::get_Count() > 0 then
								var str as string = string::Join(" ", Enumerable::Select<of Token, string>(stmt::Tokens, new Func<of Token, string>(pl::ExtractVal)))
								doc::Add(new Comment(str) {set_Region(new DomRegion(fileName, stmt::Line, 0, stmt::Line, 10000)), set_CommentType(CommentType::SingleLine), set_OpenTag("//")})
							end if
						elseif stmt is EndClassStmt
							if isNested then
								isNested = false

								if fs::get_Count() > 0 then
									var pv = fs::Pop()
									doc::Add(new FoldingRegion(new DomRegion(pv, 10000, stmt::Line, 10000),FoldType::Type))
									curClass::set_Region(new DomRegion(pv, 0, stmt::Line, 10000))
								end if

								curClass = curClass2
							else
								inClass = false

								if fs::get_Count() > 0 then
									var pv = fs::Pop()
									doc::Add(new FoldingRegion(new DomRegion(pv, 10000, stmt::Line, 10000),FoldType::Type))
									curClass::set_Region(new DomRegion(pv, 0, stmt::Line, 10000))
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
								curClass::get_Members()::Add(new DefaultUnresolvedField(curClass, ass::LExp::Tokens::get_Item(0)::Value) {set_Region(new DomRegion(fileName, ass::Line, 0, ass::Line, 10000)) , set_ReturnType(enumt)} )
							end if
						elseif stmt is EndEnumStmt then
							inEnum = false
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, 10000, stmt::Line, 10000),FoldType::Type))
								curClass::set_Region(new DomRegion(pv, 0, stmt::Line, 10000))
							end if
						elseif stmt is FieldStmt then
							var flss = $FieldStmt$stmt
							var fld = new DefaultUnresolvedField(curClass, flss::FieldName::Value) {set_Region(new DomRegion(fileName, flss::Line, 0, flss::Line, 10000)) , set_ReturnType(ProcType(flss::FieldTyp)), _
								set_Accessibility(ProcAccess(flss::Attrs)), set_DeclaringTypeDefinition(curClass)} 
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
							end if

							foreach p as VarExpr in prss::Params
								prop::set_SymbolKind(SymbolKind::Indexer)
								prop::get_Parameters()::Add(new DefaultUnresolvedParameter(ProcType(p::VarTyp), p::VarName::Value) {set_Region(new DomRegion(fileName, prss::Line, 0, prss::Line, 10000))})
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
								//met::set_HasBody(true)
							else
								//met::set_HasBody(false)
								met::set_Region(new DomRegion(fileName, mtss::Line, 0, mtss::Line, 10000))
							end if

							foreach p as VarExpr in mtss::Params
								met::get_Parameters()::Add(new DefaultUnresolvedParameter(ProcType(p::VarTyp), p::VarName::Value) {set_Region(new DomRegion(fileName, mtss::Line, 0, mtss::Line, 10000))})
							end for

							if (mtss::MethodName::Value == curClass::get_Name()) or (mtss::MethodName::Value like "^ctor\d*$") then
								met::set_SymbolKind(SymbolKind::Constructor)
							end if

							curClass::get_Members()::Add(met)
						elseif stmt is EndMethodStmt then
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, 10000, stmt::Line, 10000),FoldType::Member))
								curMethod::set_Region(new DomRegion(pv, 0, stmt::Line,10000))
							end if
						elseif stmt is EndPropStmt then
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, 10000, stmt::Line, 10000),FoldType::Member))
								curProp::set_Region(new DomRegion(pv, 0, stmt::Line, 10000))
							end if
						elseif stmt is EndEventStmt then
							if fs::get_Count() > 0 then
								var pv = fs::Pop()
								doc::Add(new FoldingRegion(new DomRegion(pv, 10000, stmt::Line, 10000),FoldType::Member))
								curEvent::set_Region(new DomRegion(pv, 0, stmt::Line, 10000))
							end if
						elseif stmt is IfStmt then
							fs::Push(stmt::Line)
						elseif stmt is ElseIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, --stmt::Line, 10000), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is ElseStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, --stmt::Line, 10000), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is EndIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						elseif stmt is TryStmt then
							fs::Push(stmt::Line)
						elseif stmt is CatchStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, --stmt::Line, 10000), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is FinallyStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, --stmt::Line, 10000), FoldType::Undefined))
							end if
							fs::Push(stmt::Line)
						elseif stmt is EndTryStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						elseif stmt is LockStmt then
							fs::Push(stmt::Line)
						elseif stmt is TryLockStmt then
							fs::Push(stmt::Line)
						elseif stmt is EndLockStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
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
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						elseif stmt is UntilStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						elseif stmt is WhileStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
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
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						elseif stmt is EndNSStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						elseif stmt is HIfStmt then
							fs::Push(stmt::Line)
						elseif stmt is HElseIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, --stmt::Line, 10000), FoldType::ConditionalDefine))
							end if
							fs::Push(stmt::Line)
						elseif stmt is HElseStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, --stmt::Line, 10000), FoldType::ConditionalDefine))
							end if
							fs::Push(stmt::Line)
						elseif stmt is EndHIfStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::ConditionalDefine))
							end if
						elseif stmt is PropertyGetStmt then
							if (#expr($PropertyGetStmt$stmt)::Getter == null) and !curProp::get_IsAbstract() then
								fs::Push(stmt::Line)
							end if
						elseif stmt is PropertySetStmt then
							if (#expr($PropertySetStmt$stmt)::Setter == null) and !curProp::get_IsAbstract() then
								fs::Push(stmt::Line)
							end if
						elseif stmt is EndGetStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						elseif stmt is EndSetStmt then
							if fs::get_Count() > 0 then
								doc::Add(new FoldingRegion(new DomRegion(fs::Pop(), 10000, stmt::Line, 10000), FoldType::Undefined))
							end if
						end if
					end for
					stmts = null
				catch ex as Exception
					doc::set_IsInvalid(true)
				finally
					StreamUtils::remove_WarnH(w)
					StreamUtils::remove_ErrorH(e)
				end try
			
			return doc
		end method

	end class
	
end namespace
