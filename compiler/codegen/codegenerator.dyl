//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class private auto ansi LPFileTuple

	field public string Path
	field public IncludeStmt InclStmt
	
	method public void LPFileTuple(var p as string,var incs as IncludeStmt)
		me::ctor()
		Path = p
		InclStmt = incs
	end method

end class

class public auto ansi CodeGenerator

	method private static void LPFile(var incstm as object)
		var tup as LPFileTuple = $LPFileTuple$incstm
		var inclustm as IncludeStmt = tup::InclStmt
		trylock inclustm::Path
			if inclustm::SSet == null then
				try
					if inclustm::Path::Value like c"^\q(.)*\q$" then
						inclustm::Path::Value = inclustm::Path::Value::Trim(new char[] {c'\q'})
					end if

					inclustm::Path::Value = ParseUtils::ProcessMSYSPath(inclustm::Path::Value)
					if !File::Exists(inclustm::Path::Value) then
						StreamUtils::WriteError(inclustm::Line, tup::Path, string::Format("File '{0}' does not exist.", inclustm::Path::Value))
					end if
					StreamUtils::WriteLine(string::Format("Now Lexing: {0}", inclustm::Path::Value))
					var pstmts as StmtSet = new Lexer()::Analyze(inclustm::Path::Value)
					StreamUtils::WriteLine(string::Format("Now Parsing: {0}", inclustm::Path::Value))
					inclustm::SSet = new Parser()::Parse(pstmts)
					StreamUtils::WriteLine(string::Format("Finished Processing: {0} (worker thread)", inclustm::Path::Value))
				catch errex as ErrorException
					inclustm::HasError = true
				catch ex as Exception
					StreamUtils::WriteLine(string::Empty)
					try
						StreamUtils::WriteError(ILEmitter::LineNr, ILEmitter::CurSrcFile, ex::ToString())
					catch errex2 as ErrorException
						inclustm::HasError = true
					end try
				end try
			end if
		end lock
	end method
	
	method private static void LPThread(var sset as object)
		var sst as StmtSet = $StmtSet$sset
		foreach stm in sst::Stmts
			if stm is IncludeStmt then
				ThreadPool::QueueUserWorkItem(new WaitCallback(LPFile()),new LPFileTuple(sst::Path, $IncludeStmt$stm))
			end if
		end for
	end method

	method public void EmitMSIL(var stmts as StmtSet, var fpath as string)

		ThreadPool::QueueUserWorkItem(new WaitCallback(LPThread()),stmts)
		
		var i as integer = -1
		var helseflg as boolean = true
		var procflg as boolean = true
		
		if ILEmitter::SrcFiles::get_Count() == 0 then
			SymTable::DefSyms::Clear()
			SymTable::AddDef("CLR_" + $string$Environment::get_Version()::get_Major())
		end if
		
		ILEmitter::CurSrcFile = fpath
		ILEmitter::AddSrcFile(fpath)
		Importer::ImpsStack::Push(new C5.LinkedList<of string>())

		if ILEmitter::DocWriters::get_Count() >= 0 then
			if AsmFactory::MdlB != null and AsmFactory::DebugFlg then
				fpath = Path::GetFullPath(fpath)
				var docw as ISymbolDocumentWriter = AsmFactory::MdlB::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
				ILEmitter::DocWriter = docw
				ILEmitter::AddDocWriter(docw)
			end if
		end if
		
		var eval as Evaluator = new Evaluator()
		var hefs as C5.IStack<of boolean> = new C5.LinkedList<of boolean>()
		var pfs as C5.IStack<of boolean> = new C5.LinkedList<of boolean>()
		
		do until i = (stmts::Stmts::get_Count() - 1)
			i++
			if stmts::Stmts::get_Item(i) is HCondCompStmt then
				if stmts::Stmts::get_Item(i) is HIfStmt then
					hefs::Push(helseflg)
					pfs::Push(procflg)
					helseflg = procflg
					if eval::EvaluateHIf(#expr($HIfStmt$stmts::Stmts::get_Item(i))::Exp) and helseflg then
						procflg = true
						helseflg = false
					else
						procflg = false
					end if
				elseif stmts::Stmts::get_Item(i) is HElseIfStmt then
					if eval::EvaluateHIf(#expr($HElseIfStmt$stmts::Stmts::get_Item(i))::Exp) and helseflg then
						procflg = true
						helseflg = false
					else
						procflg = false
					end if
				elseif stmts::Stmts::get_Item(i) is HElseStmt then
					procflg = helseflg
				elseif stmts::Stmts::get_Item(i) is EndHIfStmt then
					helseflg = hefs::Pop()
					procflg = pfs::Pop()
				end if
			elseif procflg then
				if stmts::Stmts::get_Item(i) is IncludeStmt then
					var inclustm as IncludeStmt = $IncludeStmt$stmts::Stmts::get_Item(i)
					//var pth as string
					var sset as StmtSet
					
					lock inclustm::Path
						
						if inclustm::HasError then
							StreamUtils::Terminate()
						end if

						if inclustm::Path::Value like c"^\q(.)*\q$" then
							inclustm::Path::Value = inclustm::Path::Value::Trim(new char[] {c'\q'})
						end if
						inclustm::Path::Value = ParseUtils::ProcessMSYSPath(inclustm::Path::Value)
						//pth = inclustm::Path::Value
						
						if inclustm::SSet == null then
							if !File::Exists(inclustm::Path::Value) then
								StreamUtils::WriteError(inclustm::Line, stmts::Path, "File '" + inclustm::Path::Value + "' does not exist.")
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
					end lock
						
					EmitMSIL(sset, inclustm::Path::Value)
				else
					if stmts::Stmts::get_Item(i) != null then
						new StmtReader()::Read(stmts::Stmts::get_Item(i), fpath)
					end if
				end if
			end if
		end do
		
		ILEmitter::PopSrcFile()
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

		if ILEmitter::SrcFiles::get_Count() = 0 then
			Helpers::ApplyAsmAttrs()
		
			StreamUtils::Write("Writing Assembly to Disk")
			AsmFactory::AsmB::DefineVersionInfoResource()
			AsmFactory::AsmB::Save(AsmFactory::AsmFile)
			StreamUtils::WriteLine("...Done.")

//			foreach t in SymTable::TypeLst::Types
//				StreamUtils::WriteLine(t::ToString())
//			end for
		end if

	end method

end class
