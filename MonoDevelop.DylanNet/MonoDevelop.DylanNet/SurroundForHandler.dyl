//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class public auto ansi SurroundForHandler extends CommandHandler

		method family override void Run()
			var doc as Document = IdeApp::get_Workbench()::get_ActiveDocument()
    		var textEditorData = doc::GetContent<of ITextEditorDataProvider>()::GetTextEditorData()  
		    var caret = textEditorData::get_Caret()
		    if !string::IsNullOrEmpty(textEditorData::get_SelectedText()) then
				var sb = new StringBuilder()
		    	var indent = textEditorData::GetIndentationString(++caret::get_Line(), caret::get_Column())
		    	sb::Append(c"for iterator = start upto finish\n")::Append(indent)::Append(Utils::Indent(textEditorData::get_SelectedText()))::Append(c"\n")::Append(indent)::Append("end for")
			    textEditorData::InsertAtCaret(sb::ToString()) 
			end if
		end method

		method family override void Update (var info as CommandInfo)
	  		info::set_Enabled(DesktopService::GetMimeTypeForUri($string$IdeApp::get_Workbench()::get_ActiveDocument()::get_FileName()) == "text/x-dylandotnet")
	  	end method

	end class
	
end namespace
