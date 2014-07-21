//    Extra.Tasks.dll Extra.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

namespace Extra.Tasks

	class public sealed ErrorWarnTask extends Task
		
		property public autogen ITaskItem[] Lines
		field public static literal string ErrorRegex = "(^\s*(?<file>.*)\((?<line>\d*){1}(,(?<column>\d*[\+]*))?\)(:|)\s+)*error\s*(?<number>.*):\s(?<message>.*)"
		field public static literal string WarningRegex = "(^\s*(?<file>.*)\((?<line>\d*){1}(,(?<column>\d*[\+]*))?\)(:|)\s+)*warning\s*(?<number>.*):\s(?<message>.*)"

//		property public override string ToolName
//			get
//				return "ErrorWarn"
//			end get
//		end property

		method public override boolean Execute()
			var haderrs as boolean = false
			var r1 = new Regex(ErrorRegex)
			var r2 = new Regex(WarningRegex)

			try
				_Lines = _Lines ?? new ITaskItem[0]
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
			catch ex as Exception
				get_Log()::LogWarningFromException(ex)
			end try
			return !haderrs
		end method

//		method public override string GenerateFullPathToTool()
//			return string::Empty
//		end method

	end class
	
end namespace
