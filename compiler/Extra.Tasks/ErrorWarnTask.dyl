namespace Extra.Tasks

	class public auto ansi sealed ErrorWarnTask extends Task
		
		property public autogen ITaskItem[] Lines
		field public static literal string ErrorRegex = "(^\s*(?<file>.*)\((?<line>\d*){1}(,(?<column>\d*[\+]*))?\)(:|)\s+)*error\s*(?<number>.*):\s(?<message>.*)"
		field public static literal string WarningRegex = "(^\s*(?<file>.*)\((?<line>\d*){1}(,(?<column>\d*[\+]*))?\)(:|)\s+)*warning\s*(?<number>.*):\s(?<message>.*)"

//		property public hidebysig virtual string ToolName
//			get
//				return "ErrorWarn"
//			end get
//		end property

		method public hidebysig virtual boolean Execute()
			var haderrs as boolean = false
			var r1 = new Regex(ErrorRegex)
			var r2 = new Regex(WarningRegex)

			try
				_Lines = _Lines ?? new ITaskItem[0]
				if _Lines != null then
					foreach item in _Lines
						var line as string = item::get_ItemSpec()
						if line like ErrorRegex then
							var g = r1::Matches(line)::get_Item(0)::get_Groups()
							get_Log()::LogError(string::Empty, string::Empty, string::Empty, g::get_Item("file")::get_Value(), $integer$g::get_Item("line")::get_Value(), 0, $integer$g::get_Item("line")::get_Value(), 0, g::get_Item("message")::get_Value(), new object[0])
							haderrs = true
						elseif line like WarningRegex then
							var g = r2::Matches(line)::get_Item(0)::get_Groups()
							get_Log()::LogWarning(string::Empty, string::Empty, string::Empty, g::get_Item("file")::get_Value(), $integer$g::get_Item("line")::get_Value(), 0, $integer$g::get_Item("line")::get_Value(), 0, g::get_Item("message")::get_Value(), new object[0])
						end if
					end for
				end if
			catch ex as Exception
				get_Log()::LogWarningFromException(ex)
			end try
			return !haderrs
		end method

//		method public hidebysig virtual string GenerateFullPathToTool()
//			return string::Empty
//		end method

	end class
	
end namespace
