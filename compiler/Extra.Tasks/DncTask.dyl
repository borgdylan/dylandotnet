namespace Extra.Tasks

	class public auto ansi beforefieldinit sealed DncTask extends Task
		
		property public autogen ITaskItem[] InputFile

		field private boolean haderrs

		method public void DncTask()
			me::ctor()
		end method

		method private void ErrorH(var cm as CompilerMsg)
			get_Log()::LogError(string::Empty, string::Empty, string::Empty, cm::get_File(), cm::get_Line(), 0, cm::get_Line(), 0, cm::get_Msg(), new object[0])
			haderrs = true
		end method

		method private void WarnH(var cm as CompilerMsg)
			get_Log()::LogWarning(string::Empty, string::Empty, string::Empty, cm::get_File(), cm::get_Line(), 0, cm::get_Line(), 0, cm::get_Msg(), new object[0])
		end method

		method public hidebysig virtual boolean Execute()
			haderrs = false

			try
				_InputFile = _InputFile ?? new ITaskItem[0]
				if _InputFile[l] > 0 then
					
					StreamUtils::Init()
					StreamUtils::add_WarnH(new Action<of CompilerMsg>(WarnH()))
					StreamUtils::add_ErrorH(new Action<of CompilerMsg>(ErrorH()))
		
					Program::Invoke(new string[] {_InputFile[0]::get_ItemSpec()})

				end if
			catch ex as Exception
				get_Log()::LogWarningFromException(ex)
			end try
			return !haderrs
		end method

	end class
	
end namespace