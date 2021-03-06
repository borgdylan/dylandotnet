//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Utils
import dylan.NET.Tokenizer.AST.Stmts

class public Parser

	field public Flags PFlags

	method public void Parser(var pf as Flags)
		mybase::ctor()
		PFlags = pf
	end method

	method public void Parser()
		ctor(new Flags())
	end method

	method public StmtSet Parse(var stms as StmtSet, var ctxType as ContextType, var ignf as boolean)
		var i as integer = -1
		var so as StmtOptimizer = new StmtOptimizer(PFlags)
		PFlags::CurPath = stms::Path

		var nwss as StmtSet = new StmtSet() {Path = stms::Path, set_Context(ctxType)}
		var cstack as C5.LinkedList<of IStmtContainer> = new C5.LinkedList<of IStmtContainer>() {Push(nwss)}
		var ctxstack as C5.LinkedList<of ContextType> = new C5.LinkedList<of ContextType>() {Push(ctxType)}
		var curc as IStmtContainer = nwss

		do until i >= (--stms::Stmts::get_Count())
			i++
			var cs as Stmt = stms::Stmts::get_Item(i)
			dylan.NET.Reflection.ILEmitter::LineNr = cs::Line

			do while cs::Tokens::get_Item(--cs::Tokens::get_Count())::Value == "_"
				cs::RemToken(--cs::Tokens::get_Count())
				var nxts = stms::Stmts::get_Item(++i)
				cs::Tokens::AddAll(nxts::Tokens)
				cs::EndColumn = nxts::EndColumn
				cs::EndLine = nxts::EndLine
				i++
			end do

			var nstm = so::Optimize(cs)
			if nstm is BranchStmt then
				if cstack::get_Last() is curb as IBranchContainer then
					if !curb::AddBranch($BranchStmt$nstm) then
						StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, string::Format("This branch on a '{0}' is invalid!", curb::GetType()::get_Name()))
					end if
					curc = $IStmtContainer$nstm
					curc::set_FilePath(stms::Path)
				else
					//throw an error here (cant branch on a non branch container)
					StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, "You cannot branch on a non-branchable container!")
				end if
			elseif nstm is IStmtContainer then
				if !nstm::ValidateContext(ctxstack::get_Last()) then
					StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, _
							string::Format("You cannot put a '{0}' into the '{1}' context type!", nstm::GetType()::get_Name(), $object$ctxstack::get_Last()))
				end if

				if !curc::AddStmt(nstm) then
					StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, i"You cannot put a {nstm::GetType()::get_Name()} into a {curc::GetType()::get_Name()}!")
				end if

				var isc = $IStmtContainer$nstm
				isc::set_FilePath(stms::Path)
				if !isc::IsOneLiner(curc) then
					cstack::Push(isc)
					curc = isc
					if isc::get_Context() != ContextType::None then
						ctxstack::Push(isc::get_Context())
					end if
				end if
			elseif nstm is EndStmt then
				if curc is StmtSet then
					//throw an error here (cant end an stmt set)
					StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, "You cannot end the statement set programmatically!")
				else
					if !cstack::get_Last()::ValidateEnding(nstm) then
						StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, _
							string::Format("You cannot end a '{0}' with a '{1}'!", cstack::get_Last()::GetType()::get_Name(), nstm::GetType()::get_Name()))
					end if

					if cstack::get_Last()::get_Context() != ContextType::None then
						ctxstack::Pop()
					end if

					if !curc::AddStmt(nstm) then
						StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, i"You cannot put a {nstm::GetType()::get_Name()} into a {curc::GetType()::get_Name()}!")
					end if

					cstack::Pop()

					var curb = cstack::get_Last() as IBranchContainer
					if curb isnot null then
						curc = curb::get_CurrentContainer()
					else
						curc = cstack::get_Last()
					end if
				end if
			else
				if ignf andalso nstm is CommentStmt then
					continue
				end if
				if !nstm::ValidateContext(ctxstack::get_Last()) then
					StreamUtils::WriteError(nstm::Line, 0, PFlags::CurPath, _
							string::Format("You cannot put a '{0}' into the '{1}' context type!", nstm::GetType()::get_Name(), $object$ctxstack::get_Last()))
				end if
				curc::AddStmt(nstm)
			end if

		end do

		if curc isnot StmtSet then
			//throw an error here (code blocks have not been ended right)
			StreamUtils::WriteError(#expr($Stmt$curc)::Line, 0, PFlags::CurPath, "This block has not been terminated!")
		end if

		return nwss
	end method

	method public StmtSet Parse(var stms as StmtSet, var ignf as boolean) => Parse(stms, ContextType::Assembly, ignf)
	method public StmtSet Parse(var stms as StmtSet, var ctxType as ContextType) => Parse(stms, ctxType, false)
	method public StmtSet Parse(var stms as StmtSet) => Parse(stms, ContextType::Assembly, false)

end class