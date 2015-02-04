//The dylan.NET task and awaitables library
//Compile with dylan.NET 11.5.2.1 or higher hosted by the ASP.NET vNext tooling

//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

#include "msbuild.dyl"

import System
import System.Threading
//import System.Threading.Tasks

#if NET40 then
	import Microsoft.Runtime.CompilerServices
end #if

import System.Runtime.CompilerServices

namespace System.Threading.Tasks
	#include "AsyncVoid.dyl"
	#include "IAwaitable1.dyl"
	#include "IAwaitable.dyl"
	
	#if !PORTABLESHIM then
		#include "YieldAwaitableWrapper.dyl"
		#include "TaskWrapper.dyl"
		#include "TaskWrapper1.dyl"
		#include "ConfiguredTaskAwaitableWrapper.dyl"
		#include "ConfiguredTaskAwaitableWrapper1.dyl"
	end #if
	
	#include "SetHelper.dyl"
	#include "AwaitClosures.dyl"
	#include "TaskHelpers.dyl"
	#include "CatchClosure.dyl"
	#include "TaskClosure1.dyl"
	#include "TaskClosure.dyl"
	#include "DisposerTaskClosure1.dyl"
	#include "DisposerTaskClosure.dyl"
end namespace
