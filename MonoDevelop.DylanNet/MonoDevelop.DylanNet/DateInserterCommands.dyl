//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	enum public auto ansi integer DateInserterCommands
		InsertDate = 1
       	InsertNext = 2

       	SurroundIf = 3
       	SurroundLock = 4
       	SurroundTryCatch = 5
       	SurroundTryFinally = 6
       	SurroundTryCatchFinally = 7
       	SurroundUsing = 8
       	SurroundFor = 9
       	SurroundForeach = 10
       	SurroundDoWhile = 11
       	SurroundDoUntil = 12
       	SurroundDo_While = 13
       	SurroundDo_Until = 14
       	SurroundIfElse = 15
       	SurroundHIf = 16
       	SurroundHIfHElse = 17
	end enum
	
end namespace