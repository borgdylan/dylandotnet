//The AST model for the dylan.NET tokenizer
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.9.9 or later


//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2011 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#refasm mscorlib.dll
#refasm System.dll
#refasm System.Core.dll
#refasm System.Data.dll
#refasm System.Data.DataSetExtensions.dll
#refasm System.Xml.dll 
#refasm System.Xml.Linq.dll
#refasm System.Configuration.dll
#refasm Microsoft.VisualBasic.dll

import Microsoft.VisualBasic
import System
import System.Collections
import System.Collections.Generic
import System.Data
import System.Diagnostics
import System.Linq
import System.Xml
import System.Xml.Linq

locimport dylan.NET.Tokenizer.AST
locimport dylan.NET.Tokenizer.AST.Tokens
locimport dylan.NET.Tokenizer.AST.Exprs
locimport dylan.NET.Tokenizer.AST.Stmts
locimport dylan.NET.Tokenizer.AST.Tokens.Ops
locimport dylan.NET.Tokenizer.AST.Tokens.TypeToks
locimport dylan.NET.Tokenizer.AST.Tokens.Literals
locimport dylan.NET.Tokenizer.AST.Tokens.Attributes
locimport dylan.NET.Tokenizer.AST.Tokens.Chars

assembly tokenizer.AST dll
ver 11.2.7.3

namespace dylan.NET.Tokenizer.AST.Tokens
#include E:\Code\dylannet\compiler\ast\token.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Exprs
#include E:\Code\dylannet\compiler\ast\expr.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Stmts
#include E:\Code\dylannet\compiler\ast\stmt.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Ops
#include E:\Code\dylannet\compiler\ast\op.dyl
#include E:\Code\dylannet\compiler\ast\aritops.dyl
#include E:\Code\dylannet\compiler\ast\logicalops.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
#include E:\Code\dylannet\compiler\ast\typetoks.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Literals
#include E:\Code\dylannet\compiler\ast\literals.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens
#include E:\Code\dylannet\compiler\ast\ident.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
#include E:\Code\dylannet\compiler\ast\attributes.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Ops
#include E:\Code\dylannet\compiler\ast\conditionalops.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens
#include E:\Code\dylannet\compiler\ast\otherkeywords.dyl
#include E:\Code\dylannet\compiler\ast\comment.dyl
#include E:\Code\dylannet\compiler\ast\methods.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Tokens.Chars
#include E:\Code\dylannet\compiler\ast\chars.dyl
end namespace

namespace dylan.NET.Tokenizer.AST
end namespace

namespace dylan.NET.Tokenizer.AST.Exprs
#include E:\Code\dylannet\compiler\ast\newarrexpr.dyl
#include E:\Code\dylannet\compiler\ast\newexpr.dyl
#include E:\Code\dylannet\compiler\ast\castclassexpr.dyl
#include E:\Code\dylannet\compiler\ast\gettypeexpr.dyl
#include E:\Code\dylannet\compiler\ast\ptrexpr.dyl
#include E:\Code\dylannet\compiler\ast\otherexpr.dyl
#include E:\Code\dylannet\compiler\ast\conditionalexpr.dyl
end namespace

namespace dylan.NET.Tokenizer.AST.Stmts
#include E:\Code\dylannet\compiler\ast\dependstmt.dyl
#include E:\Code\dylannet\compiler\ast\stdasmstmt.dyl
#include E:\Code\dylannet\compiler\ast\singstmt.dyl
#include E:\Code\dylannet\compiler\ast\debugstmt.dyl
#include E:\Code\dylannet\compiler\ast\makeasmstmt.dyl
#include E:\Code\dylannet\compiler\ast\refasmstmt.dyl
#include E:\Code\dylannet\compiler\ast\newresstmt.dyl
#include E:\Code\dylannet\compiler\ast\importstmts.dyl
#include E:\Code\dylannet\compiler\ast\asmstmt.dyl
#include E:\Code\dylannet\compiler\ast\verstmt.dyl
#include E:\Code\dylannet\compiler\ast\includestmt.dyl
#include E:\Code\dylannet\compiler\ast\xmldocstmt.dyl
#include E:\Code\dylannet\compiler\ast\nsstmt.dyl
#include E:\Code\dylannet\compiler\ast\classstmt.dyl
#include E:\Code\dylannet\compiler\ast\enumstmt.dyl
#include E:\Code\dylannet\compiler\ast\propstmt.dyl
#include E:\Code\dylannet\compiler\ast\metstmt.dyl
#include E:\Code\dylannet\compiler\ast\fieldstmt.dyl
#include E:\Code\dylannet\compiler\ast\exceptionstmts.dyl
#include E:\Code\dylannet\compiler\ast\labelstmts.dyl
#include E:\Code\dylannet\compiler\ast\ifstmts.dyl
#include E:\Code\dylannet\compiler\ast\varstmts.dyl
#include E:\Code\dylannet\compiler\ast\otherstmts.dyl
end namespace
