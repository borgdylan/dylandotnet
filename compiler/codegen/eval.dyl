//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi beforefieldinit Evaluator

field public OpStack Stack

method public void ctor0()
me::ctor()
Stack = null
end method

method public integer RetPrec(var tok as Token)
var typ as System.Type = null
var b as boolean = false 
var prec as integer = 0

label fin

typ = gettype Op
b = typ::IsInstanceOfType($object$tok)

if b = true then
var optok as Op = tok
prec = optok::PrecNo
goto fin
end if

typ = gettype LParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
prec = -1
goto fin
end if

typ = gettype RParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
prec = 0
goto fin
end if

place fin

return prec

end method

method public boolean isLParen(var tok as Token)
var typ as System.Type = gettype LParen
return typ::IsInstanceOfType($object$tok)
end method

method public boolean isOp(var tok as Token)
var typ as System.Type = gettype Op
return typ::IsInstanceOfType($object$tok)
end method

method public Expr ConvToRPN(var exp as Expr)

Stack = new OpStack()
var exp2 as Expr = new Expr()
var i as integer = -1
var len as integer = exp::Tokens[l] - 1
var int1 as integer = 0
var int2 as integer = 0
var tok as Token = null
var tok2 as Token = null
var typ as System.Type = null
var b as boolean = false
var orflg as boolean = false

exp2::Line = exp::Line

label cont
label loop
label fin

place loop

i++

tok = exp::Tokens[i]

orflg = isOp(tok)
b = isLParen(tok)
orflg = orflg or b
typ = gettype RParen
b = typ::IsInstanceOfType($object$tok)
orflg = orflg or b

if orflg = false then
exp2::AddToken(tok)
goto fin
end if

b = isOp(tok)

if b = true then
int1 = Stack::getLength()
if int1 <> 0 then
tok2 = Stack::TopOp()
int1 = RetPrec(tok)
int2 = RetPrec(tok2)
if int1 <= int2 then
exp2::AddToken(tok2)
Stack::PopOp()
end if
end if
Stack::PushOp(tok)
goto fin
end if

b = isLParen(tok)

if b = true then
Stack::PushOp(tok)
goto fin
end if

typ = gettype RParen
b = typ::IsInstanceOfType($object$tok)

if b = true then
int1 = Stack::getLength()
if int1 <> 0 then
tok2 = Stack::TopOp()
b = isLParen(tok2)
if b = false then
exp2::AddToken(tok2)
Stack::PopOp()
int1 = Stack::getLength()
if int1 <> 0 then
tok2 = Stack::TopOp()
b = isLParen(tok2)
if b = true then
Stack::PopOp()
end if
end if
end if
else
tok2 = Stack::TopOp()
b = isLParen(tok2)
if b = true then
Stack::PopOp()
end if
end if
goto fin
end if

place fin

if i = len then
goto cont
else
goto loop
end if

place cont

label loop2
label cont2

int1 = Stack::getLength()
if int1 = 0 then
goto cont2
end if

place loop2

tok2 = Stack::TopOp()
b = isLParen(tok2)

if b = false then
exp2::AddToken(tok2)
end if

Stack::PopOp()

int1 = Stack::getLength()
if int1 = 0 then
goto cont2
else
goto loop2
end if

place cont2

return exp2

end method

method public Expr ConvToAST(var exp as Expr)

var tokf as Token
var i as integer = -1
var j as integer = 0
var len as integer = exp::Tokens[l]
var tok as Token = null
var tok2 as Token = null
var typ as System.Type = null
var b as boolean = false
var optok as Op

label cont
label loop
label fin

if len = 1 then
tokf = exp::Tokens[0]
goto cont
end if

len--

place loop

i++

tok = exp::Tokens[i]

b = isOp(tok)

if b = true then
if i >= 2 then
optok = tok

j = i - 1
tok2 = exp::Tokens[j]
exp::RemToken(j)
len--
j--
tok = exp::Tokens[j]
exp::RemToken(j)
len--
optok::LChild = tok
optok::RChild = tok2
exp::Tokens[j] = optok
i = j
end if
goto fin
end if

place fin

if i = len then
tokf = exp::Tokens[0]
goto cont
else
goto loop
end if

place cont

return tokf

end method

method public void ASTEmit(var tok as Token, var emt as boolean)

var isop as boolean = isOp(tok)
var optok as Op
var rc as Token
var lc as Token
var typ as System.Type
var b as boolean = false
var tt as TypeTok

label fin

if isop = true then

optok = tok
rc = optok::RChild
lc = optok::LChild
if emt = false then
ASTEmit(lc, false)
ASTEmit(rc, false)
else
ASTEmit(lc, true)
ASTEmit(rc, true)
end if

else

typ = gettype Literal
b = typ::IsInstanceOfType($object$tok)

if b = true then
var lit as Literal = tok
if lit::Conv = false then
tt = lit::LitTyp
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)
goto fin
else
tt = lit::TTok
AsmFactory::Type02 = Helpers::CommitEvalTTok(tt)
goto fin
end if


end if


place fin

end if

end method

method public void Evaluate(var exp as Expr)

var len as integer = exp::Tokens[l]
//Console::WriteLine(len)
var rpnexp as Expr

if len = 1 then
rpnexp = exp
else
if len >= 3 then
rpnexp = ConvToRPN(exp)
end if
end if

var asttok as Token = ConvToAST(rpnexp)
ASTEmit(asttok, false)
ASTEmit(asttok, true)

end method

end class
