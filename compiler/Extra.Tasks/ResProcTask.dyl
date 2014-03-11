//    Extra.Tasks.dll Extra.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

namespace Extra.Tasks

	class public auto ansi beforefieldinit sealed ResProcTask extends Task
		
		property public autogen ITaskItem[] ResxInputs
		property public autogen ITaskItem[] ResourcesInputs

		[property: Output()]
		property public autogen ITaskItem[] Outputs

		method public void ResProcTask()
			me::ctor()
		end method

		method private void WarnH(var cm as Msg)
			get_Log()::LogWarning(string::Empty, string::Empty, string::Empty, cm::get_File(), cm::get_Line(), 0, cm::get_Line(), 0, cm::get_Msg(), new object[0])
		end method

		method private string Extract(var i as ITaskItem)
			return i::get_ItemSpec()
		end method

		method private ITaskItem Pack(var i as string)
			return new TaskItem(i)
		end method

		method public hidebysig virtual boolean Execute()
			try
				ResProc::WarnInit()
				ResProc::add_WarnH(new Action<of Msg>(WarnH))
				var b as IEnumerable<of string> = Enumerable::Concat<of string>(new string[] {"-resx"}, Enumerable::Select<of ITaskItem, string>(_ResxInputs ?? new ITaskItem[0], new Func<of ITaskItem, string>(Extract)))
				var c as IEnumerable<of string> = Enumerable::Concat<of string>(new string[] {"-resources"}, Enumerable::Select<of ITaskItem, string>(_ResourcesInputs ?? new ITaskItem[0], new Func<of ITaskItem, string>(Extract)))

				var o as IEnumerable<of string> = ResProc::Invoke(Enumerable::ToArray<of string>(Enumerable::Concat<of string>(b, c)))
				set_Outputs(Enumerable::ToArray<of ITaskItem>(Enumerable::Select<of string, ITaskItem>(o, new Func<of string, ITaskItem>(Pack))))

			catch ex as Exception
				get_Log()::LogWarningFromException(ex)
			end try
			return true
		end method

	end class
	
end namespace

