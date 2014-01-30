namespace Extra.Tasks

	class public auto ansi beforefieldinit sealed FindResProcOuts extends Task
		
		property public autogen ITaskItem[] Inputs

		[property: Output()]
		property public autogen ITaskItem[] Outputs

		method public void FindResProcOuts()
			me::ctor()
		end method
			
		method private string Extract(var i as ITaskItem)
			return Path::ChangeExtension(i::get_ItemSpec(), ".resx")
		end method

		method private ITaskItem Pack(var i as string)
			return new TaskItem(i)
		end method

		method public hidebysig virtual boolean Execute()
			try
				_Inputs = _Inputs ?? new ITaskItem[0]
			
				var b as IEnumerable<of string> = Enumerable::Select<of ITaskItem, string>(_Inputs, new Func<of ITaskItem, string>(Extract))
				set_Outputs(Enumerable::ToArray<of ITaskItem>(Enumerable::Select<of string, ITaskItem>(b, new Func<of string, ITaskItem>(Pack))))

			catch ex as Exception
				get_Log()::LogWarningFromException(ex)
			end try
			return true
		end method

	end class
	
end namespace

