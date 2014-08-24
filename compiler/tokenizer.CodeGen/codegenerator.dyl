//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//class private LPFileTuple
//
//	field public string Path
//	field public IncludeStmt InclStmt
//	
//	method public void LPFileTuple(var p as string,var incs as IncludeStmt)
//		me::ctor()
//		Path = p
//		InclStmt = incs
//	end method
//
//end class

class public partial CodeGenerator

	method public prototype void EmitMSIL(var stmts as StmtSet, var fpath as string)
	method assembly prototype void Process(var c as IStmtContainer, var spth as string)

end class

#include "stmtreader.dyl"

class public CodeGenerator

	field private StmtReader sr

	method public void CodeGenerator()
		mybase::ctor()
		sr = new StmtReader(me)
	end method

//	method private static void LPFile(var incstm as object)
//		var tup as LPFileTuple = $LPFileTuple$incstm
//		var inclustm as IncludeStmt = tup::InclStmt
//		trylock inclustm::Path
//			if inclustm::SSet == null then
//				try
//					if inclustm::Path::Value like c"^\q(.)*\q$" then
//						inclustm::Path::Value = inclustm::Path::Value::Trim(new char[] {c'\q'})
//					end if
//
//					inclustm::Path::Value = ParseUtils::ProcessMSYSPath(inclustm::Path::Value)
//					if !File::Exists(inclustm::Path::Value) then
//						StreamUtils::WriteError(inclustm::Line, tup::Path, string::Format("File '{0}' does not exist.", inclustm::Path::Value))
//					end if
//					StreamUtils::WriteLine(string::Format("Now Lexing: {0}", inclustm::Path::Value))
//					var pstmts as StmtSet = new Lexer()::Analyze(inclustm::Path::Value)
//					StreamUtils::WriteLine(string::Format("Now Parsing: {0}", inclustm::Path::Value))
//					inclustm::SSet = new Parser()::Parse(pstmts)
//					StreamUtils::WriteLine(string::Format("Finished Processing: {0} (worker thread)", inclustm::Path::Value))
//				catch errex as ErrorException
//					inclustm::HasError = true
//				catch ex as Exception
//					StreamUtils::WriteLine(string::Empty)
//					try
//						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, ex::ToString())
//					catch errex2 as ErrorException
//						inclustm::HasError = true
//					end try
//				end try
//			end if
//		end lock
//	end method
//	
//	method private static void LPThread(var sset as object)
//		var sst as StmtSet = $StmtSet$sset
//		foreach stm in sst::Stmts
//			if stm is IncludeStmt then
//				if #expr($IncludeStmt$stm)::SSet == null then
//					ThreadPool::QueueUserWorkItem(new WaitCallback(LPFile()),new LPFileTuple(sst::Path, $IncludeStmt$stm))
//				end if
//			end if
//		end for
//	end method
	
 	//hash set is used to keep track of visited assemblies to avoid cycles in the dep graph
	method private void MarkUsed(var lst as IEnumerable<of string>, var hset as C5.HashSet<of string>)
		foreach a in lst
			if !hset::Contains(a)
				if Importer::Asms::Contains(a) then
					var ar = Importer::Asms::get_Item(a)
					ar::Used = true
					hset::Add(a)

					var lst2 = new C5.LinkedList<of string>()
					foreach dep in ar::Asm::GetReferencedAssemblies()
						lst2::Add("memory:" + dep::get_Name() + ".dll")
					end for
					MarkUsed(lst2, hset)
				end if
			end if
		end for
	end method

	method assembly void Process(var c as IStmtContainer, var spth as string)
		var eval as Evaluator = new Evaluator()

		foreach s in c::get_Children()
			if s is HIfStmt then
				if eval::EvaluateHIf(#expr($HIfStmt$s)::Exp) then
					Process($HIfStmt$s, spth)
					continue
				end if

				foreach b in #expr($HIfStmt$s)::Branches
					if b is HElseIfStmt then
						if eval::EvaluateHIf(#expr($HElseIfStmt$b)::Exp) then
							Process($HElseIfStmt$b, spth)
							break
						end if
					elseif b is HElseStmt then
						Process($HElseStmt$b, spth)
						break
					end if
				end for
			elseif s is EndHIfStmt then
			else
				if s is IncludeStmt then
					var inclustm as IncludeStmt = $IncludeStmt$s
					//var pth as string
					var sset as StmtSet
					
					//lock inclustm::Path
						
						//if inclustm::HasError then
						//	StreamUtils::Terminate()
						//end if

						inclustm::Path::Value = ParseUtils::ProcessMSYSPath(inclustm::Path::get_UnquotedValue())
						//pth = inclustm::Path::Value
						
						if inclustm::SSet == null then
							if !File::Exists(inclustm::Path::Value) then
								StreamUtils::WriteError(inclustm::Line, spth, string::Format("File '{0}' does not exist.", inclustm::Path::Value))
							end if
							StreamUtils::WriteLine(string::Format("Now Lexing: {0}", inclustm::Path::Value))
							var pstmts as StmtSet = new Lexer()::Analyze(inclustm::Path::Value)
							StreamUtils::WriteLine(string::Format("Now Parsing: {0}", inclustm::Path::Value))
							sset = new Parser()::Parse(pstmts)
							inclustm::SSet = sset
							StreamUtils::WriteLine(string::Format("Finished Processing: {0} (inline)", inclustm::Path::Value))
						else
							sset = inclustm::SSet
						end if
					//end lock
						
					EmitMSIL(sset, inclustm::Path::Value)
				else
					if s != null then
						sr::Read(s, spth)
					end if
				end if
			end if
		end for
	end method

	method public void EmitMSIL(var stmts as StmtSet, var fpath as string)

		//ThreadPool::QueueUserWorkItem(new WaitCallback(LPThread()),stmts)
		
		//var i as integer = -1
		
		if ILEmitter::SrcFiles::get_Count() == 0 then
			SymTable::DefSyms::Clear()
			SymTable::AddDef("CLR_" + $string$Environment::get_Version()::get_Major())
		end if
		
		ILEmitter::CurSrcFile = fpath
		ILEmitter::AddSrcFile(fpath)
		Importer::ImpsStack::Push(new C5.LinkedList<of ImportRecord>())

		if ILEmitter::DocWriters::get_Count() >= 0 then
			if AsmFactory::MdlB != null and AsmFactory::DebugFlg then
				fpath = Path::GetFullPath(fpath)
				var docw as ISymbolDocumentWriter = AsmFactory::MdlB::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
				ILEmitter::DocWriter = docw
				ILEmitter::AddDocWriter(docw)
			end if
		end if
		
		Process(stmts, fpath)
		
		ILEmitter::PopSrcFile()

		foreach rec in Importer::ImpsStack::get_Last()
			if !rec::Used then
				StreamUtils::WriteWarn(rec::Line, ILEmitter::CurSrcFile, "Namespace  import for '" + rec::Namespace + "' was not used.")
			end if
		end for

		Importer::ImpsStack::Pop()
		if ILEmitter::SrcFiles::get_Count() > 0 then
			ILEmitter::CurSrcFile = ILEmitter::SrcFiles::get_Last()
		end if

		if ILEmitter::DocWriters::get_Count() > 0 then
			ILEmitter::PopDocWriter()
			if ILEmitter::DocWriters::get_Count() > 0 then
				ILEmitter::DocWriter = ILEmitter::DocWriters::get_Last()
			else
				if ILEmitter::SrcFiles::get_Count() > 0 then
					if AsmFactory::MdlB != null and AsmFactory::DebugFlg then
						var fp = Path::GetFullPath(ILEmitter::SrcFiles::get_Last())
						var docw as ISymbolDocumentWriter = AsmFactory::MdlB::DefineDocument(fp, Guid::Empty, Guid::Empty, Guid::Empty)
						ILEmitter::DocWriter = docw
						ILEmitter::AddDocWriter(docw)
					end if
				end if
			end if
		end if

		if ILEmitter::SrcFiles::get_Count() == 0 then
			StreamUtils::Write("Embedding Resources in Assembly (if any)")

			var lst = new C5.LinkedList<of string>()
			foreach r in SymTable::ResLst
				if r::get_Item3() then
					if Importer::Asms::Contains(r::get_Item1()) then
						if Importer::Asms::get_Item(r::get_Item1())::Used then
							lst::Add(r::get_Item1())
						end if
					end if
				end if
			end for
			MarkUsed(lst, new C5.HashSet<of string>())

			foreach r in SymTable::ResLst
				if r::get_Item3() then
					if Importer::Asms::Contains(r::get_Item1()) then
						if !Importer::Asms::get_Item(r::get_Item1())::Used then
							continue
						end if
					end if
				end if

				if r::get_Item1() like "^memory:(.)*$" then
					var pth = r::get_Item1()::Substring(7)

					if !MemoryFS::HasFile(pth) then
						StreamUtils::WriteWarn(ILEmitter::LineNr, ILEmitter::CurSrcFile, "In-Memory File '" + pth + "' does not exist.")
						continue
					end if

					var fs = MemoryFS::GetFile(pth)
					fs::Seek(0l, SeekOrigin::Begin)
					AsmFactory::MdlB::DefineManifestResource(#ternary {r::get_Item2() == string::Empty ? Path::GetFileName(pth), r::get_Item2() }, fs, ResourceAttributes::Public)
					fs::Seek(0l, SeekOrigin::Begin)
				else
					var fs = new FileStream(r::get_Item1(), FileMode::Open)
					AsmFactory::MdlB::DefineManifestResource(#ternary {r::get_Item2() == string::Empty ? Path::GetFileName(r::get_Item1()), r::get_Item2() }, fs, ResourceAttributes::Public)
					fs::Close()
				end if
			end for

			StreamUtils::WriteLine("...Done.")

			Helpers::ApplyAsmAttrs()

			if AsmFactory::InMemorySet then
				var ms = new MemoryStream()
				StreamUtils::Write("Writing Assembly to Memory")
				AsmFactory::AsmB::DefineVersionInfoResource()
				AsmFactory::AsmB::Save(ms)
				ms::Seek(0l, SeekOrigin::Begin)
				MemoryFS::AddFile(AsmFactory::AsmFile, ms)
				StreamUtils::WriteLine("...Done.")
			else
				StreamUtils::Write("Writing Assembly to Disk")
				AsmFactory::AsmB::DefineVersionInfoResource()
				AsmFactory::AsmB::Save(AsmFactory::AsmFile)
				StreamUtils::WriteLine("...Done.")
			end if

//			foreach t in SymTable::TypeLst::Types
//				StreamUtils::WriteLine(t::ToString())
//			end for
		end if

		stmts::Stmts::Clear()
		stmts::Stmts = new C5.ArrayList<of Stmt>(0)
	end method

end class
