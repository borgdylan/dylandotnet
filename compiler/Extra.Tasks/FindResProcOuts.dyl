//    Extra.Tasks.dll Extra.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.IO

namespace Extra.Tasks

	class public sealed FindResProcOuts extends Task

		property public autogen ITaskItem[] Inputs

		[property: Output()]
		property public autogen ITaskItem[] Outputs

		[property: Output()]
		property public autogen ITaskItem[] FilteredOutputs

		method public void FindResProcOuts()
			mybase::ctor()
		end method

		method private string Extract(var i as ITaskItem) => Path::ChangeExtension(i::get_ItemSpec(), ".resx")
		method private ITaskItem Pack(var i as string) => new TaskItem(i)
		method private boolean Filter(var i as string) => !File::Exists(i)

		method public override boolean Execute()
			try
				var b as IEnumerable<of string> = Enumerable::Select<of ITaskItem, string>(_Inputs ?? new ITaskItem[0], new Func<of ITaskItem, string>(Extract))
				//actual outputs incl. overwritten files
				set_Outputs(Enumerable::ToArray<of ITaskItem>(Enumerable::Select<of string, ITaskItem>(b, new Func<of string, ITaskItem>(Pack))))
				//new outputs only, MSBuild already adds others as resources
				set_FilteredOutputs(Enumerable::ToArray<of ITaskItem>(Enumerable::Select<of string, ITaskItem>(Enumerable::Where<of string>(b, new Func<of string, boolean>(Filter)), new Func<of string, ITaskItem>(Pack))))
			catch ex as Exception
				get_Log()::LogWarningFromException(ex)
			end try
			return true
		end method

	end class

end namespace

