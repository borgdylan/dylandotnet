//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

namespace MonoDevelop.DylanNet

	class public auto ansi CodeGenerationPanelWidget extends VBox

		field private DotNetProjectConfiguration configuration
		field private DNConfigurationParameters compilerParameters
		field private Entry symbolsEntry
		field private ToggleButton debugCheck

		method public void CodeGenerationPanelWidget ()
			me::ctor()
			//buidl code here
			symbolsEntry = new Entry()
			var hbox as HBox = new HBox()
			hbox::PackStart(new Label("Define Symbols:"), false, false, 2ui)
			hbox::PackStart(symbolsEntry, true, true, 22ui)
			PackStart(hbox, true, true, 0ui)
			debugCheck = new CheckButton()
			var hbox2 as HBox = new HBox()
			hbox2::PackStart(new Label("Debug Symbols:"), false, false, 2ui)
			hbox2::PackStart(debugCheck, true, true, 22ui)
			PackStart(hbox2, true, true, 0ui)
			ShowAll()

			compilerParameters = null
		end method
		
		method public void Load (var configuration as DotNetProjectConfiguration)
			me::configuration = configuration
			compilerParameters = $DNConfigurationParameters$configuration::get_CompilationParameters()
			
			symbolsEntry::set_Text(compilerParameters::get_DefineSymbols())
			debugCheck::set_Active(compilerParameters::get_DebugSymbols())
		end method

		method public void Store ()
			if compilerParameters == null then
				throw new ApplicationException ("Code generation panel wasn't loaded !")
			end if

			compilerParameters::set_DefineSymbols(symbolsEntry::get_Text())
			compilerParameters::set_DebugSymbols(debugCheck::get_Active())
		end method
	
	end class

	class public auto ansi CodeGenerationPanel extends MultiConfigItemOptionsPanel

		field private CodeGenerationPanelWidget widget

		method public override Widget CreatePanelWidget()
			widget = new  CodeGenerationPanelWidget ()
			return widget
		end method
		
		method public override void LoadConfigData ()
			widget::Load ($DotNetProjectConfiguration$get_CurrentConfiguration())
		end method
		
		method public override void ApplyChanges ()
			widget::Store ()
		end method
	end class
	
end namespace
