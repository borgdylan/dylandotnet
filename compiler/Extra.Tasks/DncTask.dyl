//    Extra.Tasks.dll Extra.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

namespace Extra.Tasks

	class public beforefieldinit sealed DncTask extends Task
		
		property public autogen ITaskItem[] InputFile

		field private boolean haderrs

		method public void DncTask()
			mybase::ctor()
			StreamUtils::UseConsole = false
		end method

		method private void ErrorH(var cm as CompilerMsg)
			get_Log()::LogError(string::Empty, string::Empty, string::Empty, cm::get_File(), cm::get_Line(), 0, cm::get_Line(), 0, cm::get_Msg(), new object[0])
			haderrs = true
		end method

		method private void WarnH(var cm as CompilerMsg)
			get_Log()::LogWarning(string::Empty, string::Empty, string::Empty, cm::get_File(), cm::get_Line(), 0, cm::get_Line(), 0, cm::get_Msg(), new object[0])
		end method

		method public override boolean Execute()
			haderrs = false
			var w = new Action<of CompilerMsg>(WarnH)
			var e = new Action<of CompilerMsg>(ErrorH)

			try
				_InputFile = _InputFile ?? new ITaskItem[0]
				if _InputFile[l] > 0 then
					
					//StreamUtils::Init()
					StreamUtils::add_WarnH(w)
					StreamUtils::add_ErrorH(e)
		
					Program::Invoke(new string[] {_InputFile[0]::get_ItemSpec()})

				end if
			catch ex as Exception
				get_Log()::LogWarningFromException(ex)
			finally
				StreamUtils::remove_WarnH(w)
				StreamUtils::remove_ErrorH(e)
			end try
			return !haderrs
		end method

	end class
	
end namespace
