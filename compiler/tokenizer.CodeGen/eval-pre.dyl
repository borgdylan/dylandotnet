// //    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
// //    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// // Foundation; either version 3 of the License, or (at your option) any later version.
// //    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
// //PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
// //    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
// //Place, Suite 330, Boston, MA 02111-1307 USA

import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.Chars

class public sealed partial Evaluator

	method public static integer RetPrec(var tok as Token)
		if tok is Op then
			return #expr($Op$tok)::PrecNo
		elseif tok is LParen then
			return -1
		elseif tok is RParen then
			return 0
		else
			return 0
		end if
	end method

	method public static Expr ConvToRPN(var exp as Expr)
		if (exp::Tokens::get_Count() == 0) orelse (exp::Tokens::get_Count() == 1) then
			return exp
		end if

		var stack = new OpStack()
		var exp2 as Expr = new Expr() {Line = exp::Line}
		var i as integer = -1
		var tok as Token = null

		do until i == --exp::Tokens::get_Count()

			i++
			tok = exp::Tokens::get_Item(i)

			if !#expr((tok is Op) orelse (tok is LParen) orelse (tok is RParen)) then
				exp2::AddToken(tok)
			elseif tok is Op then
				if stack::getLength() != 0 then
					if RetPrec(tok) <= RetPrec(stack::TopOp()) then
						exp2::AddToken(stack::TopOp())
						stack::PopOp()
					end if
				end if
				stack::PushOp(tok)
			elseif tok is LParen then
				stack::PushOp(tok)
			elseif tok is RParen then
				if stack::getLength() != 0 then
					if stack::TopOp() isnot LParen then
						exp2::AddToken(stack::TopOp())
						stack::PopOp()
						if stack::getLength() != 0 then
							if stack::TopOp() is LParen then
								stack::PopOp()
							end if
						end if
					end if
				else
					if stack::TopOp() is LParen then
						stack::PopOp()
					end if
				end if
			end if
		end do

		if stack::getLength() == 0 then
			return exp2
		end if

		do
			if stack::TopOp() isnot LParen then
				exp2::AddToken(stack::TopOp())
			end if
			stack::PopOp()
		until stack::getLength() = 0

		return exp2
	end method

	method public static Token ConvToAST(var exp as Expr)

		var tokf as Token
		var i as integer = -1
		var j as integer = 0
		var tok as Token = null
		var tok2 as Token = null

		if exp::Tokens::get_Count() == 1 then
			return exp::Tokens::get_Item(0)
		elseif exp::Tokens::get_Count() = 0 then
			return null
		end if
		var len as integer = --exp::Tokens::get_Count()
		do until i == len
			i++
			tok = exp::Tokens::get_Item(i)
			if tok is optok as Op then
				if i >= 2 then
					j = --i
					tok2 = exp::Tokens::get_Item(j)
					exp::RemToken(j)
					len--
					j--
					tok = exp::Tokens::get_Item(j)
					exp::RemToken(j)
					len--
					optok::LChild = tok
					optok::RChild = tok2
					exp::Tokens::set_Item(j,optok)
					i = j
				end if
			end if
			if i == len then
				tokf = exp::Tokens::get_Item(0)
			end if
		end do
		return tokf
	end method

end class