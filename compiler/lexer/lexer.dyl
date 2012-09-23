//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi Lexer

	method public StmtSet Analyze(var path as string)
	
		var stmts as StmtSet = new StmtSet(path)
		var curstmt as Stmt = null
		var curln as Line = null
		var sr as StreamReader = new StreamReader(path)
		var crflag as boolean = false
		var lfflag as boolean = false
		var buf as string = String::Empty
		var curline as integer = 0
		var curstmtlen as integer = -1
		var chr as char = 'a'
		
		do while sr::Peek() >= 0
		
			chr = $char$sr::Read()
			
			if chr = c'\r' then
				crflag = true
			end if
			
			if chr = c'\n' then
				lfflag = true
			end if
			
			if (crflag or lfflag) = false then
				buf = buf + $string$chr
			else
				if lfflag then
					curline = curline + 1
					curstmt = new Stmt()
					curstmt::Line = curline
					curln = new Line()
					curstmt = curln::Analyze(curstmt, buf)
					curstmtlen = curstmt::Tokens[l]
			
					if curstmtlen != 0 then
						stmts::AddStmt(curstmt)
					end if
			
					buf = String::Empty
					crflag = false
					lfflag = false
				end if
			end if
			
			if sr::Peek() = -1 then
				curline = curline + 1
				curstmt = new Stmt()
				curstmt::Line = curline
				curln = new Line()
				curstmt = curln::Analyze(curstmt, buf)
				curstmtlen = curstmt::Tokens[l]
			
				if curstmtlen != 0 then
					stmts::AddStmt(curstmt)
				end if
			end if
		
		end do
		
		sr::Close()
		sr::Dispose()
		
		return stmts
	end method
	
	method public StmtSet AnalyzeString(var str as string)
	
		var stmts as StmtSet = new StmtSet()
		var curstmt as Stmt = null
		var curln as Line = null
		var sr as StringReader = new StringReader(str)
		var crflag as boolean = false
		var lfflag as boolean = false
		var buf as string = String::Empty
		var curline as integer = 0
		var curstmtlen as integer = -1
		var chr as char = 'a'
		 
		do while sr::Peek() >= 0
		
			chr = $char$sr::Read()
			
			if chr = c'\r' then
				crflag = true
			end if
			
			if chr = c'\n' then
				lfflag = true
			end if
			
			if (crflag or lfflag) = false then
				buf = buf + $string$chr
			else
				if lfflag then
					curline = curline + 1
					curstmt = new Stmt()
					curstmt::Line = curline
					curln = new Line()
					curstmt = curln::Analyze(curstmt, buf)
					curstmtlen = curstmt::Tokens[l]
			
					if curstmtlen != 0 then
						stmts::AddStmt(curstmt)
					end if
			
					buf = String::Empty
					crflag = false
					lfflag = false
				end if
			end if
			
			if sr::Peek() = -1 then
				curline = curline + 1
				curstmt = new Stmt()
				curstmt::Line = curline
				curln = new Line()
				curstmt = curln::Analyze(curstmt, buf)
				curstmtlen = curstmt::Tokens[l]
			
				if curstmtlen != 0 then
					stmts::AddStmt(curstmt)
				end if
			end if
			
		end do
		
		sr::Close()
		sr::Dispose()
		
		return stmts
	end method


end class
