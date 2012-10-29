//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi CodeGenerator

	method public void EmitMSIL(var stmts as StmtSet, var fpath as string)

		var i as integer = -1
		var helseflg as boolean = true
		var procflg as boolean = true
		
		if ILEmitter::SrcFiles[l] = 0 then
			SymTable::DefSyms::Clear()
			SymTable::AddDef("CLR_" + $string$Environment::get_Version()::get_Major())
		end if
		
		ILEmitter::CurSrcFile = fpath
		ILEmitter::AddSrcFile(fpath)

		if ILEmitter::DocWriters[l] > 0 then
			fpath = Path::GetFullPath(fpath)
			var docw as ISymbolDocumentWriter = AsmFactory::MdlB::DefineDocument(fpath, Guid::Empty, Guid::Empty, Guid::Empty)
			ILEmitter::DocWriter = docw
			ILEmitter::AddDocWriter(docw)
		end if
		
		var eval as Evaluator = new Evaluator()
		var hefs as C5.IStack<of boolean> = new C5.LinkedList<of boolean>()
		var pfs as C5.IStack<of boolean> = new C5.LinkedList<of boolean>()
		
		do until i = (stmts::Stmts[l] - 1)
			i = i + 1
			if stmts::Stmts[i] is HCondCompStmt then
				if stmts::Stmts[i] is HIfStmt then
					hefs::Push(helseflg)
					pfs::Push(procflg)
					helseflg = procflg
					var hif as HIfStmt = $HIfStmt$stmts::Stmts[i]
					if eval::EvaluateHIf(hif::Exp) and helseflg then
						procflg = true
						helseflg = false
					else
						procflg = false
					end if
				elseif stmts::Stmts[i] is HElseIfStmt then
					var hif as HElseIfStmt = $HElseIfStmt$stmts::Stmts[i]
					if eval::EvaluateHIf(hif::Exp) and helseflg then
						procflg = true
						helseflg = false
					else
						procflg = false
					end if
				elseif stmts::Stmts[i] is HElseStmt then
					procflg = helseflg
				elseif stmts::Stmts[i] is EndHIfStmt then
					helseflg = hefs::Pop()
					procflg = pfs::Pop()
				end if
			elseif procflg then
				if stmts::Stmts[i] is IncludeStmt then
					var inclustm as IncludeStmt = $IncludeStmt$stmts::Stmts[i]
					if inclustm::Path::Value like ("^" + Utils.Constants::quot + "(.)*" + Utils.Constants::quot + "$") then
						var tmpchrarr as char[] = new char[1]
						tmpchrarr[0] = $char$Utils.Constants::quot
						inclustm::Path::Value = inclustm::Path::Value::Trim(tmpchrarr)
					end if

					inclustm::Path::Value = ParseUtils::ProcessMSYSPath(inclustm::Path::Value)
					var lx as Lexer = new Lexer()
					StreamUtils::Write("Now Lexing: ")
					StreamUtils::Write(inclustm::Path::Value)
					var pstmts as StmtSet = lx::Analyze(inclustm::Path::Value)
					StreamUtils::WriteLine("...Done.")
					var ps as Parser = new Parser()
					StreamUtils::Write("Now Parsing: ")
					StreamUtils::Write(inclustm::Path::Value)
					var ppstmts as StmtSet = ps::Parse(pstmts)
					StreamUtils::WriteLine("...Done.")
					EmitMSIL(ppstmts, inclustm::Path::Value)
				else
					var sr as StmtReader = new StmtReader()
					if stmts::Stmts[i] != null then
						sr::Read(stmts::Stmts[i], fpath)
					end if
				end if
			end if
		end do
		
		ILEmitter::PopSrcFile()
		if ILEmitter::SrcFiles[l] > 0 then
			ILEmitter::CurSrcFile = ILEmitter::SrcFiles[ILEmitter::SrcFiles[l] - 1]
		end if

		if ILEmitter::DocWriters[l] > 0 then
			ILEmitter::PopDocWriter()
			if ILEmitter::DocWriters[l] > 0 then
				ILEmitter::DocWriter = ILEmitter::DocWriters[ILEmitter::DocWriters[l] - 1]
			end if
		end if

		if ILEmitter::SrcFiles[l] = 0 then
			StreamUtils::Write("Writing Assembly to Disk")
			AsmFactory::AsmB::DefineVersionInfoResource()
			AsmFactory::AsmB::Save(AsmFactory::AsmFile)
			StreamUtils::WriteLine("...Done.")
		end if

	end method

end class
