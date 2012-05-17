//The AST model for the dylan.NET tokenizer
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.2.9.1 or later

//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"
#refasm "dnu.dll"

#debug on

import System
import System.IO
import dylan.NET.Utils
import dylan.NET.Tokenizer.AST
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Literals
import dylan.NET.Tokenizer.AST.Tokens.Attributes
import dylan.NET.Tokenizer.AST.Tokens.Chars

assembly tokenizer.AST dll
ver 11.2.9.3

namespace dylan.NET.Tokenizer.AST.Tokens
	#include "ast/token.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Exprs
	#include "ast/expr.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Stmts
	#include "ast/stmt.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Ops
	#include "ast/op.dyl"
	#include "ast/aritops.dyl"
	#include "ast/logicalops.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
	#include "ast/typetoks.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Literals
	#include "ast/literals.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens
	#include "ast/ident.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
	#include "ast/attributes.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Ops
	#include "ast/conditionalops.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens
	#include "ast/otherkeywords.dyl"
	#include "ast/comment.dyl"
	#include "ast/methods.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Chars
	#include "ast/chars.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST
end namespace

namespace dylan.NET.Tokenizer.AST.Exprs
	#include "ast/newarrexpr.dyl"
	#include "ast/newexpr.dyl"
	#include "ast/castclassexpr.dyl"
	#include "ast/gettypeexpr.dyl"
	#include "ast/ptrexpr.dyl"
	#include "ast/otherexpr.dyl"
	#include "ast/conditionalexpr.dyl"
end namespace

namespace dylan.NET.Tokenizer.AST.Stmts
	#include "ast/dependstmt.dyl"
	#include "ast/stdasmstmt.dyl"
	#include "ast/singstmt.dyl"
	#include "ast/debugstmt.dyl"
	#include "ast/scopestmt.dyl"
	#include "ast/makeasmstmt.dyl"
	#include "ast/refasmstmt.dyl"
	#include "ast/newresstmt.dyl"
	#include "ast/importstmts.dyl"
	#include "ast/asmstmt.dyl"
	#include "ast/verstmt.dyl"
	#include "ast/includestmt.dyl"
	#include "ast/xmldocstmt.dyl"
	#include "ast/nsstmt.dyl"
	#include "ast/classstmt.dyl"
	#include "ast/delegatestmt.dyl"
	#include "ast/enumstmt.dyl"
	#include "ast/propstmt.dyl"
	#include "ast/metstmt.dyl"
	#include "ast/fieldstmt.dyl"
	#include "ast/exceptionstmts.dyl"
	#include "ast/labelstmts.dyl"
	#include "ast/loopstmts.dyl"
	#include "ast/ifstmts.dyl"
	#include "ast/varstmts.dyl"
	#include "ast/otherstmts.dyl"
end namespace
