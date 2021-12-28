//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.IO
import System.Text
import dylan.NET.Tokenizer.AST.Stmts
import System.IO.MemoryMappedFiles

class public Lexer

    method public StmtSet AnalyzeCore(var sr as TextReader, var path as string)
        var stmts as StmtSet = new StmtSet(path)
        var curstmt as Stmt = null
        var crflag as boolean = false
        var lfflag as boolean = false
        //preallocate 4KB of RAM in the buffer which will be reused for each line
        var buf as StringBuilder = new StringBuilder(4096)
        var curline as integer = 0
        //var curstmtlen as integer = -1
        var chr as char = 'a'

        //ignore char with code 0 which is null char as well
        //when using mmap, the last page is padded with nulls at the end
        do while sr::Peek() > 0

            chr = $char$sr::Read()

            if chr == c'\r' then
                crflag = true
            elseif chr == c'\n' then
                lfflag = true
            end if

            if !#expr(crflag orelse lfflag) then
                buf::Append(chr)
            else
                if lfflag then
                    curline++
                    curstmt = new Line()::Analyze(new Stmt() {Line = curline}, buf)
                    // curstmtlen = curstmt::Tokens::get_Count()

                    if curstmt::Tokens::get_Count() != 0 then
                        stmts::AddStmt(curstmt)
                    end if

                    buf::Clear()
                    crflag = false
                    lfflag = false
                end if
            end if

            // var buf = sr::ReadLine()
            // do while buf != null

            //make sure to detect null chars in mmapped files too
            if sr::Peek() < 1 then
                curline++
                // curstmt = new Line()::Analyze(new Stmt() {Line = curline}, buf)
                curstmt = new Line()::Analyze(new Stmt() {Line = curline}, buf)
                // curstmtlen = curstmt::Tokens::get_Count()

                if curstmt::Tokens::get_Count() != 0 then
                    stmts::AddStmt(curstmt)
                end if
            end if
            // buf = sr::ReadLine()
        end do

        return stmts
    end method

    //NOTE: Close calls only Dispose so the calls are semantically equivalent

    method public StmtSet Analyze(var path as string)
        using sr as StreamReader = new StreamReader(path, Encoding::get_UTF8(), true, 4096)
            return AnalyzeCore(sr, path)
        end using
    end method

    method public StmtSet AnalyzeWithMMap(var path as string)
        using sr as StreamReader = new StreamReader(MemoryMappedFile::CreateFromFile(path)::CreateViewStream(), Encoding::get_UTF8(), true, 4096)
            return AnalyzeCore(sr, path)
        end using
    end method

    method public StmtSet AnalyzeString(var str as string)
        using sr as StringReader = new StringReader(str)
             return AnalyzeCore(sr, string::Empty)
        end using
    end method

    method public StmtSet AnalyzeStream(var sm as Stream) => AnalyzeCore(new StreamReader(sm, Encoding::get_UTF8(), true, 4096), string::Empty)

end class
