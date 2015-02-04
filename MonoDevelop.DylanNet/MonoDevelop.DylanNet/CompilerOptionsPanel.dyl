//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

namespace MonoDevelop.DylanNet

	class public auto ansi CompilerOptionsPanelWidget extends VBox

		field private DotNetProject project
		field private ComboBox compileTargetCombo

		method public void OnTargetChanged (var s as object, var a as EventArgs)
		end method

		method public void CompilerOptionsPanelWidget (var project as DotNetProject)
			mybase::ctor()

			//build code
			compileTargetCombo = new ComboBox()
			compileTargetCombo::set_WidthRequest(183)
			var hbox as HBox = new HBox()
			hbox::PackStart(new Label("Compile Target:"), false, false, 2ui)
			hbox::PackStart(compileTargetCombo, false, true, 22ui)
			PackStart(new HBox() {PackStart(new Label("<b>Code Generation</b>") {set_UseMarkup(true)}, false, false, 0ui) }, true, true, 0ui)
			PackStart(hbox, true, true, 0ui)
			ShowAll()

			me::project = project
			var configuration as DotNetProjectConfiguration = $DotNetProjectConfiguration$project::GetConfiguration(IdeApp::get_Workspace()::get_ActiveConfiguration())

			var store as ListStore = new ListStore (new Type[] {gettype string})
			store::AppendValues (new object[] {"Executable"})
			store::AppendValues (new object[] {"Library"})
			store::AppendValues (new object[] {"Executable with GUI"})
			//store.AppendValues (GettextCatalog.GetString ("Module"));
			compileTargetCombo::set_Model (store)
			var cr as CellRendererText = new CellRendererText ()
			compileTargetCombo::PackStart (cr, true)
			compileTargetCombo::AddAttribute (cr, "text", 0)
			compileTargetCombo::set_Active($integer$configuration::get_CompileTarget())
			compileTargetCombo::add_Changed(new EventHandler (OnTargetChanged))

		end method
		
		method public override void OnDestroyed ()
			mybase::OnDestroyed ()
		end method

		method public boolean ValidateChanges ()
			return true
		end method
		
		method public void Store (var configs as ItemConfigurationCollection<of ItemConfiguration>)
			var compileTarget as CompileTarget = $CompileTarget$compileTargetCombo::get_Active()
			project::set_CompileTarget(compileTarget)
		end method

	end class	

	class public auto ansi CompilerOptionsPanel extends ItemOptionsPanel

		field public CompilerOptionsPanelWidget widget
		
		method public override Widget CreatePanelWidget ()
			widget = new CompilerOptionsPanelWidget ($DotNetProject$ get_ConfiguredProject())
			return widget
		end method
		
		method public override boolean ValidateChanges ()
			return widget::ValidateChanges ()
		end method
		
		method public override void ApplyChanges ()
			var dlg as MultiConfigItemOptionsDialog = $MultiConfigItemOptionsDialog$get_ParentDialog()
			widget::Store (dlg::get_Configurations())
		end method

	end class
	
end namespace
