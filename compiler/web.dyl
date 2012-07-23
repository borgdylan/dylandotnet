//The Web Library for the dylan.NET Website
//A Component of the NEW dylan.NET Compiler
//compile with dylan.NET v.11.2.9.6 or later

//    web.dll dylan.NET.Web Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//		This program is free software: you can redistribute it and/or modify it under the terms of the GNU
// Affero General Public License as published by the Free Software Foundation, either version 3 of the License
//, or (at your option) any later version.
//    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even 
//the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General 
//Public License for more details.
//    You should have received a copy of the GNU Affero General Public License along with this program.
//If not, see <http://www.gnu.org/licenses/>.

#refstdasm "mscorlib.dll"
#refstdasm "System.dll"
#refstdasm "System.Xml.Linq.dll"
#refstdasm "System.Core.dll"
#refstdasm "System.Web.dll"
#refstdasm "System.Web.Extensions.dll"
#refstdasm "System.Web.Services.dll"
#refstdasm "System.Web.DynamicData.dll"
#refasm "tokenizer.AST.dll"
#refasm "tokenizer.Lexer.dll"
#refasm "tokenizer.Parser.dll"
#refasm "tokenizer.CodeGen.dll"
#refasm "dnu.dll"
#refasm "dnr.dll"

import System
import System.Linq
import System.Xml.Linq
import System.Collections
import System.Collections.Generic
import System.Net
import System.Net.Mail
import System.IO
import System.Web
import System.Web.UI
import System.Security
import System.Security.Cryptography
import System.Web.Security
import System.Web.DynamicData
import System.Web.UI.WebControls
import System.Web.UI.HtmlControls
import System.Text
import dylan.NET.Utils
import dylan.NET.Web
import dylan.NET.Reflection
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.Parser
import dylan.NET.Tokenizer.CodeGen

#debug on

assembly web dll
ver 11.2.9.6

namespace dylan.NET.Web

end namespace
