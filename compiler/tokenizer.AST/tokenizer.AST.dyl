//The AST model for the dylan.NET tokenizer
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.3.1.5 or later

//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#include "msbuild.dyl"
#include "Properties/AssemblyInfo.dyl"

import System
import System.IO
import System.Collections.Generic
import System.Linq

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

namespace dylan.NET.Tokenizer.AST

	namespace Tokens
		#include "token.dyl"
	end namespace

	namespace Exprs
		#include "expr.dyl"
	end namespace

	namespace Stmts
		#include "stmt.dyl"
	end namespace

	namespace Tokens
		namespace Ops
			#include "op.dyl"
			#include "aritops.dyl"
			#include "logicalops.dyl"
		end namespace

		namespace TypeToks
			#include "typetoks.dyl"
		end namespace
	end namespace
	
	namespace Interfaces
		#include "interfaces.dyl"
	end namespace

	namespace Tokens
		namespace Literals
			#include "literals.dyl"
		end namespace

		#include "ident.dyl"
		#include "exprcalltok.dyl"

		namespace Attributes
			#include "attributes.dyl"
		end namespace

		namespace Ops
			#include "conditionalops.dyl"
		end namespace

		#include "attrvalpair.dyl"
		#include "otherkeywords.dyl"
		#include "comment.dyl"
		#include "methodnametok.dyl"
		#include "methods.dyl"
		#include "newcalltoks.dyl"

		namespace Chars
			#include "chars.dyl"
		end namespace
	end namespace

	namespace Exprs
		#include "varexpr.dyl"
	end namespace

	namespace Stmts
		//#include "stdasmstmt.dyl"
		#include "debugstmt.dyl"
		#include "scopestmt.dyl"
		#include "refasmstmt.dyl"
		//#include "newresstmt.dyl"
		#include "importstmts.dyl"
		#include "asmstmt.dyl"
		#include "verstmt.dyl"
		#include "includestmt.dyl"
		//#include "xmldocstmt.dyl"
		#include "nsstmt.dyl"
		#include "classstmt.dyl"
		#include "delegatestmt.dyl"
		#include "enumstmt.dyl"
		#include "propstmt.dyl"
		#include "eventstmt.dyl"
		#include "metstmt.dyl"
		#include "fieldstmt.dyl"
		#include "exceptionstmts.dyl"
		#include "labelstmts.dyl"
		#include "loopstmts.dyl"
		#include "ifstmts.dyl"
		#include "varstmts.dyl"
		#include "attrstmts.dyl"
		#include "otherstmts.dyl"
	end namespace

end namespace
