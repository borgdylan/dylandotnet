//    tokenizer.Lexer.dll dylan.NET.Tokenizer.Lexer Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.Text
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Stmts

class public sealed Line

    field private char PrevChar
    field private boolean InStr
    field private boolean InChar

    method public void Line()
        mybase::ctor()
        PrevChar = c'\0'
        //InStr = false
        //InChar = false
    end method

    method public boolean isDigit(var c as char) => c >= '0' andalso c <= '9'

    //cc - char to be evaluated
    //lc - lookahead char
    //sca/sc - still copy signal (enables copy to buffer)
    //scla/scl - still cut last signal (enables a buffer flush in the cycle after a char is put in buffer)
    //scl2a/scl2 - still cut last signal but for when ob is false
    //ob/[cuttok] - signal to flush buffer before current char is written to it
    method private boolean isSep(var cc as char, var lc as char, var sca as boolean&, var scla as boolean&, var scl2a as boolean&)
        //scla is true as set by Analyze i.e. set only if setting to false
        //scl2a is false as set by Analyze i.e. set only if setting to true
        //sca is false as set by Analyze i.e. set only if setting to true
        //scla and sca are considered only if ob is true
        //scl2a is considered only if ob is false
        var ob as boolean = false
        if lc == c'\0' then
            lc = ' '
        end if

        if cc == c'\q' then
            InStr = !InStr
            if !InStr then
                InChar = false
            end if
        end if

        if cc == c'\s' then
            InChar = !InChar
        end if

        if !#expr(InStr orelse InChar) then
            if (cc == c'\t') orelse (cc == ' ') then
                sca = false
                ob = true
            elseif (cc == ':') andalso (PrevChar == c'\q') then
                ob = true
                scla = false
                sca = true
            elseif cc == '(' then
                ob = true
                sca = true
                if (lc == '+') orelse (lc == '-') then
                    scla = false
                end if
            elseif cc == ')' then
                if (PrevChar == '+') orelse (PrevChar == '-') then
                    ob = false
                    scl2a = true
                else
                    ob = true
                    sca = true
                end if
            elseif (cc == ',') orelse (cc == '{') orelse (cc == '}') orelse (cc == '&') orelse (cc == '*') orelse (cc == '|') then
                sca = true
                ob = true
            elseif cc == '[' then
                sca = true
                ob = true
                if lc == ']' then
                    scla = false
                end if
            elseif cc == ']' then
                sca = true
                ob = PrevChar != '['
            elseif cc == '/' then
                if lc == '/' then
                    if PrevChar == '/' then
                        ob = false
                        scl2a = false
                    else
                        sca = true
                        scla = false
                        ob = true
                    end if
                else
                    sca = true
                    ob = PrevChar != '/'
                end if
            elseif cc == '?' then
                sca = true
                if lc == '?' then
                    scla = false
                    ob = true
                else
                    ob = PrevChar != '?'
                end if
            elseif (cc == '$') orelse (cc == '~') then
                sca = true
                ob = true
            elseif cc == '=' then
                sca = true
                if lc == '=' then
                    scla = false
                    ob = !#expr((PrevChar == '!') orelse (PrevChar == '='))
                else
                    if (PrevChar == '>') orelse (PrevChar == '<') orelse (PrevChar == '!') orelse (PrevChar == '=') then
                        ob = false
                        //may want to have this on for < and >
                        scl2a = false
                    else
                        ob = true
                        if lc == '>' then
                            scla = false
                        end if
                    end if
                end if
            elseif cc == '!' then
                sca = true
                ob = true
                if lc == '=' then
                    scla = false
                end if
            elseif cc == '<' then
                if lc == '=' then
                    sca = true
                    scla = false
                    ob = true
                else
                    if PrevChar == '<' then
                        ob = false
                        scl2a = false
                    elseif (lc == '<') orelse (lc == '>') then
                        sca = true
                        scla = false
                        ob = true
                    else
                        sca = true
                        ob = true
                    end if
                end if
            elseif cc == '>' then
                sca = true
                if lc == '=' andalso PrevChar != '=' then
                    scla = false
                    ob = true
                else
                    if (PrevChar == '<') orelse (PrevChar == '>') orelse (PrevChar == '=') then
                        ob = false
                        scl2a = false
                    elseif lc == '>' then
                        sca = true
                        scla = false
                        ob = true
                    else
                        ob = true
                    end if
                end if
            elseif cc == '-' then
                if (PrevChar == '(') andalso (lc == ')')
                    ob = false
                    scl2a = false
                else
                    sca = true
                    if lc == '-' then
                        scla = false
                        ob = true
                    else
                        ob = PrevChar != '-'
                        if char::IsDigit(lc) then
                            scla = false
                        end if
                    end if
                end if
            elseif cc == '+' then
                if (PrevChar == '(') andalso (lc == ')')
                    ob = false
                    scl2a = false
                else
                    sca = true
                    if lc == '+' then
                        scla = false
                        ob = true
                    else
                        ob = PrevChar != '+'
                        if char::IsDigit(lc) then
                            scla = false
                        end if
                    end if
                end if
            else
                sca = false
                ob = false
                scl2a = false
            end if
        else
            sca = false
            ob = false
            scl2a = false
        end if

        PrevChar = cc
        return ob

    end method

    method public Stmt Analyze(var stm as Stmt, var str as StringBuilder, var offset as integer)

        var curchar as char = c'\0'
        var lachar as char = c'\0'
        var len as integer = --str::get_Length()

        var buf as StringBuilder = new StringBuilder()
        var sc as boolean = false
        var scl as boolean = false
        var scl2 as boolean = false
        var i as integer = -1
        var j as integer = 0
        var startCol as integer = 0
        var ln = stm::Line

        if len > -1 then
            do
                i++
                j = ++i

                if !scl then
                    sc = false
                end if

                if sc orelse scl2 then
                    if buf::get_Length() != 0 then
                        stm::AddToken(new Token() {Value = buf::ToString(), Line = ln, EndLine = ln, EndColumn = i + offset, Column = startCol + offset})
                    end if
                    buf::Clear()
                end if

                sc = false
                scl = true
                scl2 = false

                curchar = str::get_Chars(i)
                lachar = #ternary{i < len ? str::get_Chars(j), c'\0'}
                if isSep(curchar, lachar, ref sc, ref scl, ref scl2) then
                    if buf::get_Length() != 0 then
                        stm::AddToken(new Token() {Value = buf::ToString(), Line = ln, EndLine = ln, EndColumn = i + offset, Column = startCol + offset})
                    end if
                    buf::Clear()
                    if sc then
                        if buf::get_Length() == 0 then
                            startCol = ++i
                        end if
                        buf::Append(curchar)
                    end if
                else
                    if buf::get_Length() == 0 then
                        startCol = ++i
                    end if
                    buf::Append(curchar)
                end if

            until i == len
        end if

        if buf::get_Length() != 0 then
            stm::AddToken(new Token() {Value = buf::ToString(), Line = ln, EndLine = ln, EndColumn = ++i + offset, Column = startCol + offset})
        end if
        buf::Clear()

        return stm

    end method

    method public Stmt Analyze(var stm as Stmt, var str as StringBuilder) => Analyze(stm, str, 0)

end class
