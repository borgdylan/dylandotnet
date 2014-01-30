namespace dylan.NET.ResProc

	class public auto ansi sealed Msg

		property public autogen integer Line
		property public autogen string File	
		property public autogen string Msg
		
		method public void Msg()
			_Line = 0
			_File = string::Empty
			_Msg = string::Empty
		end method

		method public void Msg(var line as integer, var file as string, var msg as string)
			_Line = line
			_File = file
			_Msg = msg
		end method
		
	end class
	
end namespace
