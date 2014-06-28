//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class public auto ansi InsertNextHandler extends CommandHandler  
 
        method family override void Run()
        	var doc as Document = IdeApp::get_Workbench()::get_ActiveDocument()
    		var textEditorData = doc::GetContent<of ITextEditorDataProvider>()::GetTextEditorData()  
		    textEditorData::InsertAtCaret($string$#expr(++$integer$textEditorData::get_SelectedText()))  
        end method

        method family override void Update (var info as CommandInfo)
        	var doc as Document = IdeApp::get_Workbench()::get_ActiveDocument()  
  			if doc != null then
  				var textEditor = doc::GetContent<of ITextEditorDataProvider>()
  				if textEditor != null then
	  				var i as integer = 0
	  				info::set_Enabled(integer::TryParse(textEditor::GetTextEditorData()::get_SelectedText(), ref i))
	  			end if
  			else
 	 			info::set_Enabled(false)
 	 		end if
        end method

	end class
	
end namespace
