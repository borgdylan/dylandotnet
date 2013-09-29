//The AST model for the dylan.NET tokenizer
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.4 or later

//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refstdasm "mscorlib.dll"

#if CLR_2 then
#refasm "build/2.0/C5.Mono.dll"
#refasm "build/2.0/IKVM.Reflection.dll"
#refasm "build/2.0/dnu.dll"
#refasm "build/2.0/dnr.dll"
#else
#refasm "build/4.0/C5.Mono.dll"
#refasm "build/4.0/IKVM.Reflection.dll"
#refasm "build/4.0/dnu.dll"
#refasm "build/4.0/dnr.dll"
end #if

#include "cflags.dyl"
#if DEBUG then
	#debug on
end #if

import System
import System.IO
import dylan.NET.Utils
import dylan.NET.Reflection
import dylan.NET.Tokenizer.AST
import dylan.NET.Tokenizer.AST.Interfaces
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.Ops
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Tokens.Literals
import dylan.NET.Tokenizer.AST.Tokens.Attributes
import dylan.NET.Tokenizer.AST.Tokens.Chars
import IKVM.Reflection
import IKVM.Reflection.Emit

#include "ast/assemblyinfo.dyl"

assembly tokenizer.AST dll
ver 11.3.1.5

namespace dylan.NET.Tokenizer.AST

	namespace Tokens
		#include "ast/token.dyl"
	end namespace

	namespace Exprs
		#include "ast/expr.dyl"
	end namespace

	namespace Stmts
		#include "ast/stmt.dyl"
	end namespace

	namespace Tokens
		namespace Ops
			#include "ast/op.dyl"
			#include "ast/aritops.dyl"
			#include "ast/logicalops.dyl"
		end namespace

		namespace TypeToks
			#include "ast/typetoks.dyl"
		end namespace
	end namespace
	
	namespace Interfaces
		#include "ast/interfaces.dyl"
	end namespace

	namespace Tokens
		namespace Literals
			#include "ast/literals.dyl"
		end namespace

		#include "ast/ident.dyl"
		#include "ast/exprcalltok.dyl"

		namespace Attributes
			#include "ast/attributes.dyl"
		end namespace

		namespace Ops
			#include "ast/conditionalops.dyl"
		end namespace

		#include "ast/attrvalpair.dyl"
		#include "ast/otherkeywords.dyl"
		#include "ast/comment.dyl"
		#include "ast/methodnametok.dyl"
		#include "ast/methods.dyl"
		#include "ast/newcalltoks.dyl"

		namespace Chars
			#include "ast/chars.dyl"
		end namespace
	end namespace

	namespace Exprs
		#include "ast/varexpr.dyl"
	end namespace

	namespace Stmts
		//#include "ast/stdasmstmt.dyl"
		#include "ast/debugstmt.dyl"
		#include "ast/scopestmt.dyl"
		#include "ast/refasmstmt.dyl"
		#include "ast/newresstmt.dyl"
		#include "ast/importstmts.dyl"
		#include "ast/asmstmt.dyl"
		#include "ast/verstmt.dyl"
		#include "ast/includestmt.dyl"
		//#include "ast/xmldocstmt.dyl"
		#include "ast/nsstmt.dyl"
		#include "ast/classstmt.dyl"
		#include "ast/delegatestmt.dyl"
		#include "ast/enumstmt.dyl"
		#include "ast/propstmt.dyl"
		#include "ast/eventstmt.dyl"
		#include "ast/metstmt.dyl"
		#include "ast/fieldstmt.dyl"
		#include "ast/exceptionstmts.dyl"
		#include "ast/labelstmts.dyl"
		#include "ast/loopstmts.dyl"
		#include "ast/ifstmts.dyl"
		#include "ast/varstmts.dyl"
		#include "ast/attrstmts.dyl"
		#include "ast/otherstmts.dyl"
	end namespace

end namespace
