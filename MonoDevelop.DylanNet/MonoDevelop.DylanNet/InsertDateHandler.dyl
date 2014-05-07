//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class public auto ansi InsertDateHandler extends CommandHandler  

        method family hidebysig virtual void Run()
        	var doc as Document = IdeApp::get_Workbench()::get_ActiveDocument()
    		var textEditorData = doc::GetContent<of ITextEditorDataProvider>()::GetTextEditorData()  
		    textEditorData::InsertAtCaret(DateTime::get_Now()::ToString())  
        end method
         
        method family hidebysig virtual void Update (var info as CommandInfo)
        	var doc as Document = IdeApp::get_Workbench()::get_ActiveDocument()  
  			if doc != null then
	  			info::set_Enabled(doc::GetContent<of ITextEditorDataProvider>() != null)
  			else
 	 			info::set_Enabled(false)
 	 		end if
        end method

	end class
	
end namespace