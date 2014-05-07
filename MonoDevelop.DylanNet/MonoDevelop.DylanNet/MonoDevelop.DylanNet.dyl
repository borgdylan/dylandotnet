//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

#include "msbuild.dyl"
#include "Properties/AssemblyInfo.dyl"

import System
import System.Collections
import System.Collections.Generic
import System.Linq
import System.Text
import System.Xml
import System.Xml.Linq
import System.Threading
import System.IO

import MonoDevelop.Components.Commands
import MonoDevelop.Ide
import MonoDevelop.Core
import MonoDevelop.Core.Serialization
import MonoDevelop.Projects
import MonoDevelop.Components
import MonoDevelop.Components
import MonoDevelop.Ide.Gui
import MonoDevelop.Ide.Tasks
import MonoDevelop.Ide.Gui.Dialogs
import MonoDevelop.Ide.Gui.Content 
import Mono.TextEditor
import System.CodeDom.Compiler
import MonoDevelop.Projects.Dom
import MonoDevelop.Projects.Dom.Parser
import MonoDevelop.Ide.TypeSystem
import ICSharpCode.NRefactory
import ICSharpCode.NRefactory.TypeSystem.Implementation
import ICSharpCode.NRefactory.TypeSystem
import ICSharpCode.NRefactory.CSharp.TypeSystem

import dylan.NET.Utils
import dylan.NET.Tokenizer.AST
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Tokens.Attributes
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Exprs
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.Parser

import Gtk
import Gdk

#include "Utils.dyl"
#include "DateInserterCommands.dyl"
#include "InsertDateHandler.dyl"
#include "InsertNextHandler.dyl"
#include "DNConfigurationParameters.dyl"
#include "DNProjectParameters.dyl"
#include "DNLanguageBinding.dyl"
#include "CompilerOptionsPanel.dyl"
#include "CodeGenerationPanel.dyl"
#include "DocumentParser.dyl"
#include "PathedDocumentExtension.dyl"
#include "SurroundIfHandler.dyl"
#include "SurroundIfElseHandler.dyl"
#include "SurroundHIfHandler.dyl"
#include "SurroundHIfHElseHandler.dyl"
#include "SurroundLockHandler.dyl"
#include "SurroundTryCatchHandler.dyl"
#include "SurroundTryFinallyHandler.dyl"
#include "SurroundTryCatchFinallyHandler.dyl"
#include "SurroundUsingHandler.dyl"
#include "SurroundForHandler.dyl"
#include "SurroundForeachHandler.dyl"
#include "SurroundDoWhileHandler.dyl"
#include "SurroundDoUntilHandler.dyl"
#include "SurroundDo_WhileHandler.dyl"
#include "SurroundDo_UntilHandler.dyl"

//class public auto ansi DNProject implements IProjectBinding
//
//		property public hidebysig virtual newslot final string Name
//			get
//				return "dylan.NET Project"
//			end get
//		end property
//
//		method public hidebysig virtual newslot final boolean CanCreateSingleFileProject(var sourceFile as string)
//			return true
//		end method
//
//		method public hidebysig virtual newslot final Project CreateProject(var info as ProjectCreateInformation, var projectOptions as XmlElement)
//			return null
//		end method
//		
//		method public hidebysig virtual newslot final Project CreateSingleFileProject(var sourceFile as string)
//			return null
//		end method
//
//end class
