//    tokenizer.Parser.dll dylan.NET.Tokenizer.Parser Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public Parser

	field public Flags PFlags
	
	method public void Parser(var pf as Flags)
		mybase::ctor()
		PFlags = pf
	end method

	method public void Parser()
		ctor(new Flags())
	end method
	
	method public StmtSet Parse(var stms as StmtSet, var ignf as boolean)
		var i as integer = -1
		var so as StmtOptimizer = new StmtOptimizer(PFlags)
		PFlags::CurPath = stms::Path

		var nwss as StmtSet = new StmtSet() {Path = stms::Path}
		var cstack as C5.LinkedList<of IStmtContainer> = new C5.LinkedList<of IStmtContainer>() {Push(nwss)}
		var curc as IStmtContainer = nwss

		do until i >= (--stms::Stmts::get_Count())
			i++
			var cs as Stmt = stms::Stmts::get_Item(i)
			
			do while cs::Tokens::get_Item(--cs::Tokens::get_Count())::Value == "_"
				cs::RemToken(--cs::Tokens::get_Count())
				cs::Tokens::AddAll(stms::Stmts::get_Item(++i)::Tokens)
				i++
			end do
			
			var nstm = so::Optimize(cs)
			if nstm is BranchStmt then
				var curb = cstack::get_Last() as IBranchContainer
				if curb != null then
					if !curb::AddBranch($BranchStmt$nstm) then
						StreamUtils::WriteError(nstm::Line, PFlags::CurPath, string::Format("This branch on a {0} is invalid!", curb::GetType()::get_Name()))
					end if
					curc = $IStmtContainer$nstm
				else
					//throw an error here (cant branch on a non branch container)
					StreamUtils::WriteError(nstm::Line, PFlags::CurPath, "You cannot branch on a non-branchable container!")
				end if
			elseif nstm is IStmtContainer then
				curc::AddStmt(nstm)
				var isc = $IStmtContainer$nstm
				if !isc::IsOneLiner(curc) then
					cstack::Push(isc)
					curc = isc
				end if
			elseif nstm is EndStmt then
				if curc is StmtSet then
					//throw an error here (cant end an stmt set)
					StreamUtils::WriteError(nstm::Line, PFlags::CurPath, "You cannot end the file using code!")
				else
					curc::AddStmt(nstm)
					cstack::Pop()

					var curb = cstack::get_Last() as IBranchContainer
					if curb != null then
						curc = curb::get_CurrentContainer()
					else
						curc = cstack::get_Last()
					end if
				end if
			else
				if ignf andalso nstm is CommentStmt then
					continue
				end if
				curc::AddStmt(nstm)
			end if

		end do

		if curc isnot StmtSet then
			//throw an error here (code blocks have not been ended right)
			StreamUtils::WriteError(#expr($Stmt$curc)::Line, PFlags::CurPath, "This block has not been terminated!")
		end if

		return nwss
	end method

	method public StmtSet Parse(var stms as StmtSet)
		return Parse(stms, false)
	end method

end class