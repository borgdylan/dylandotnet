//    dnide.exe dylan.NET.IDE Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi MainWindow extends Window
	
	field public Statusbar SB
	field public ProgressBar PB
	field public Timer PBPulser
	field public TextView tvw1
	field public ComboBox cmb1
	field public ALList al1
	field public HBox hb1
	
	method public void OnDelete(var sender as object, var e as DeleteEventArgs)
		Application::Quit()
	end method
	
	method public void QuitMenu_OnActivate(var sender as object, var e as EventArgs)
		Application::Quit()
	end method
	
	method public void CMB1_OnChanged(var sender as object, var e as EventArgs)
		tvw1::set_Buffer($TextBuffer$al1::GetItemValue(cmb1::get_Active()))
	end method
	
	method public void SaveMenu_OnActivate(var sender as object, var e as EventArgs)
		File::WriteAllText(cmb1::get_ActiveText(), tvw1::get_Buffer()::get_Text())
		SB::Push(Convert::ToUInt32(1),"File Saved")
	end method
	
	method public ALList StmtSet2ALList(var sset as StmtSet)
		var al as ALList = new ALList()
		
		if sset::Stmts[l] > 0 then
			
			var i as integer = -1
			
			label loop
			label cont
			
			place loop
			
			i = i + 1
			
			al::Add(sset::Stmts[i])
			
			if i = (sset::Stmts[l] - 1) then
				goto cont
			else
				goto loop
			end if
			
			place cont
		
		end if
		
		return al
	end method
	
	method public boolean FilterHI(var o as object)
		var hityp as Type = gettype IncludeStmt
		if hityp::IsInstanceOfType(o) then
			return true
		else
			return false
		end if
	end method
	
	method public boolean FilterAsm(var o as object)
		var asmtyp as Type = gettype AssemblyStmt
		if asmtyp::IsInstanceOfType(o) then
			return true
		else
			return false
		end if
	end method
	
	method public boolean CheckIfMainFile()
		
		if File::Exists(cmb1::get_ActiveText()) then
		
			var lx as Lexer =  new Lexer()
			var sset as StmtSet = lx::Analyze(cmb1::get_ActiveText())
			var ps as Parser = new Parser()
			sset = ps::Parse(sset)
			var alist as ALList = StmtSet2ALList(sset)
			
			if alist::FindItem(new SearchDelegate(FilterAsm())) = null then
				return false
			else
				return true
			end if
		else
			return false
		end if
		
	end method
	
	method public void CompileMenu_OnActivate(var sender as object, var e as EventArgs)
		if CheckIfMainFile() = false then
			SB::Push(Convert::ToUInt32(1),"Error:File is not main project file!!")
			return
		end if
		
		SB::Push(Convert::ToUInt32(1),"Compiling...")
		var curd as string = Environment::get_CurrentDirectory()
		Environment::set_CurrentDirectory(Path::GetDirectoryName(cmb1::get_ActiveText()))
		var params as string[] = new string[1]
		params[0] = Path::GetFileName(cmb1::get_ActiveText())
		Module1::main(params)
		Environment::set_CurrentDirectory(curd)
		SB::Push(Convert::ToUInt32(1),"Ready")
	end method
	
	method public void LoadHIMenu_OnActivate(var sender as object, var e as EventArgs)
		
		if CheckIfMainFile() = false then
			SB::Push(Convert::ToUInt32(1),"Error:File is not main project file!!")
			return
		end if
		
		SB::Push(Convert::ToUInt32(1),"Loading Files...")
		var curd as string = Environment::get_CurrentDirectory()
		Environment::set_CurrentDirectory(Path::GetDirectoryName(cmb1::get_ActiveText()))
		var lx as Lexer =  new Lexer()
		var sset as StmtSet = lx::Analyze(Path::GetFileName(cmb1::get_ActiveText()))
		var ps as Parser = new Parser()
		sset = ps::Parse(sset)
		var hilist as ALList = StmtSet2ALList(sset)
		hilist = hilist::FindItems(new SearchDelegate(FilterHI()))
		var ite as Item = null
		var histm as IncludeStmt = null
		var str as string = String::Empty
		var trmarr as char[] = new char[1]
		trmarr[0] = $char$Constants::quot
		
		if hilist::Length > 0 then
		
			label cont
			label loop
			
			place loop
			
			if ite = null then
				ite = hilist::Head
			else
				ite = ite::GoNext()
			end if
			
			histm = $IncludeStmt$ite::Value
			str = histm::Path::Value
			
			if str like ("^" + Constants::quot + "(.)*" + Constants::quot + "$") then
				str = str::Trim(trmarr)
			end if
			if Path::IsPathRooted(str) = false then
				str = Path::Combine(Environment::get_CurrentDirectory(),str)
			end if
			
			//Console::WriteLine(str)
			var ntt as TextTagTable = null
			var buf as TextBuffer = new TextBuffer(ntt)
			buf::set_Text(File::ReadAllText(str))
			cmb1::AppendText(str)
			al1::Add(buf)
			
			if ite::HasNext() then
				goto loop
			else
				goto cont
			end if
			
			place cont
			
		end if
		
		Environment::set_CurrentDirectory(curd)
		SB::Push(Convert::ToUInt32(1),"Ready")
	end method
	
	method public void CloseMenu_OnActivate(var sender as object, var e as EventArgs)
		
		var ind as integer = cmb1::get_Active()
		cmb1::remove_Changed(new EventHandler(CMB1_OnChanged()))
		var tb as TextBuffer = $TextBuffer$al1::GetItemValue(ind)
		tb::Clear()
		al1::Remove(ind)
		var cmb2 as ComboBox = ComboBox::NewText()
		var i as integer = -1
		
		label loop
		label cont
		
		place loop
		
		i = i + 1
		
		if i != ind then
			cmb1::set_Active(i)
			cmb2::AppendText(cmb1::get_ActiveText())
		end if
		
		if i = al1::Length then
			goto cont
		else
			goto loop
		end if
		
		place cont
		
		hb1::Remove(cmb1)
		cmb1::Destroy()
		hb1::Add(cmb2)
		cmb2::Show()
		cmb1 = cmb2
		
		cmb1::add_Changed(new EventHandler(CMB1_OnChanged()))
	end method
	
	method public void NewMenu_OnActivate(var sender as object, var e as EventArgs)
		var ntt as TextTagTable = null
		var buf as TextBuffer = new TextBuffer(ntt)
		tvw1::set_Buffer(buf)
		cmb1::AppendText("Untitled")
		al1::Add(buf)
		cmb1::set_Active(al1::Length - 1)
	end method
	
	method public void AboutMenu_OnActivate(var sender as object, var e as EventArgs)
		var abt as AboutDialog = new AboutDialog()
		abt::set_Name("dylan.NET IDE")
		abt::set_Copyright("Copyright (C) Dylan Borg 2012")
		abt::set_Version(Assembly::GetExecutingAssembly()::GetName()::get_Version()::ToString())
		abt::set_License("This program is free software; you can redistribute it and/or modify it under the terms" + Constants::crlf +  "of the GNU Lesser General Public License as published by the Free Software Foundation;" + Constants::crlf +  "either version 3 of the License, or (at your option) any later version. This program is" + Constants::crlf +  "distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even" + Constants::crlf +  "the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See" + Constants::crlf +  "the GNU Lesser General Public License for more details. You should have received a copy" + Constants::crlf +  "of the GNU Lesser General Public License along with this program; if not, write to the" + Constants::crlf +"Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA" )
		abt::Run()
	end method
	
	method public void SaveAsMenu_OnActivate(var sender as object, var e as EventArgs)
		
		SB::Push(Convert::ToUInt32(1),"Saving File...")
		PBPulser::Change(0,100)
		var arr as object[] = new object[4]
		arr[0] = "Cancel"
		arr[1] = $object$ResponseType::Cancel
		arr[2] = "Save"
		arr[3] = $object$ResponseType::Accept
		var fc as FileChooserDialog = new FileChooserDialog("Save File", me, FileChooserAction::Save,arr)
		
		var filt as FileFilter = new FileFilter()
		filt::set_Name("dylan.NET Source Files")
		filt::AddPattern("*.dyl")
		fc::AddFilter(filt)
		
		if fc::Run() = ResponseType::Accept then
			File::WriteAllText(fc::get_Filename(),tvw1::get_Buffer()::get_Text())
			var ind as integer = cmb1::get_Active()
			var str as string = fc::get_Filename()
			cmb1::remove_Changed(new EventHandler(CMB1_OnChanged()))
			cmb1::AppendText(str)
			Console::WriteLine((al1::Length - 1) >= ind)
			var obj as object = al1::GetItemValue(ind)
			al1::Remove(ind)
			al1::Add(obj)
			
			var cmb2 as ComboBox = ComboBox::NewText()
			var i as integer = -1
			
			label loop
			label cont
			
			place loop
			
			i = i + 1
			
			if i != ind then
				cmb1::set_Active(i)
				cmb2::AppendText(cmb1::get_ActiveText())
			end if
			
			if i = al1::Length then
				goto cont
			else
				goto loop
			end if
			
			place cont
			
			hb1::Remove(cmb1)
			cmb1::Destroy()
			hb1::Add(cmb2)
			cmb2::Show()
			cmb1 = cmb2
			
			cmb1::set_Active(al1::Length - 1)
			cmb1::add_Changed(new EventHandler(CMB1_OnChanged()))
		
		end if
		
		fc::Destroy()
		
		SB::Push(Convert::ToUInt32(1),"File Saved")
		PBPulser::Change(Timeout::Infinite,Timeout::Infinite)
		PB::set_Fraction(1d)
	end method
	
	method public void OpenMenu_OnActivate(var sender as object, var e as EventArgs)
		
		SB::Push(Convert::ToUInt32(1),"Opening File...")
		PBPulser::Change(0,100)
		var arr as object[] = new object[4]
		arr[0] = "Cancel"
		arr[1] = $object$ResponseType::Cancel
		arr[2] = "Open"
		arr[3] = $object$ResponseType::Accept
		var fc as FileChooserDialog = new FileChooserDialog("Open File", me, FileChooserAction::Open,arr)
		
		var filt as FileFilter = new FileFilter()
		filt::set_Name("dylan.NET Source Files")
		//filt::AddMimeType("text/plain")
		filt::AddPattern("*.dyl")
		fc::AddFilter(filt)
		
		if fc::Run() = ResponseType::Accept then
			var ntt as TextTagTable = null
			var buf as TextBuffer = new TextBuffer(ntt)
			buf::set_Text(File::ReadAllText(fc::get_Filename()))
			tvw1::set_Buffer(buf)
			cmb1::AppendText(fc::get_Filename())
			al1::Add(buf)
			cmb1::set_Active(al1::Length - 1)
		end if
		
		fc::Destroy()
		
		SB::Push(Convert::ToUInt32(1),"File Opened")
		PBPulser::Change(Timeout::Infinite,Timeout::Infinite)
		PB::set_Fraction(1d)
	end method
	
	method public void PBPulserCB(var o as object)
		PB::Pulse()
	end method
	
	method public void InitializeComponent()
		PB = new ProgressBar()
		PBPulser = new Timer(new TimerCallback(PBPulserCB()),null,0,100)
		add_DeleteEvent(new DeleteEventHandler(OnDelete()))
		var vbx as VBox = new VBox(false, 0)
		var mb as MenuBar = new MenuBar()
		var fme as MenuItem = new MenuItem("File")
		mb::Append(fme)
		var fmb as Menu = new Menu()
		fme::set_Submenu(fmb)
		var dme as MenuItem = new MenuItem("dylan.NET")
		mb::Append(dme)
		var dmb as Menu = new Menu()
		dme::set_Submenu(dmb)
		var hme as MenuItem = new MenuItem("Help")
		mb::Append(hme)
		var hmb as Menu = new Menu()
		hme::set_Submenu(hmb)
		var nm as MenuItem = new MenuItem("New")
		nm::add_Activated(new EventHandler(NewMenu_OnActivate()))
		fmb::Append(nm)
		var om as MenuItem = new MenuItem("Open")
		om::add_Activated(new EventHandler(OpenMenu_OnActivate()))
		fmb::Append(om)
		var sm as MenuItem = new MenuItem("Save")
		sm::add_Activated(new EventHandler(SaveMenu_OnActivate()))
		fmb::Append(sm)
		var sam as MenuItem = new MenuItem("Save As")
		sam::add_Activated(new EventHandler(SaveAsMenu_OnActivate()))
		fmb::Append(sam)
		var clm as MenuItem = new MenuItem("Close")
		clm::add_Activated(new EventHandler(CloseMenu_OnActivate()))
		fmb::Append(clm)
		var qm as MenuItem = new MenuItem("Quit")
		qm::add_Activated(new EventHandler(QuitMenu_OnActivate()))
		fmb::Append(qm)
		var cm as MenuItem = new MenuItem("Compile")
		cm::add_Activated(new EventHandler(CompileMenu_OnActivate()))
		dmb::Append(cm)
		var lhim as MenuItem = new MenuItem("Load #includes")
		lhim::add_Activated(new EventHandler(LoadHIMenu_OnActivate()))
		dmb::Append(lhim)
		var abtm as MenuItem = new MenuItem("About")
		abtm::add_Activated(new EventHandler(AboutMenu_OnActivate()))
		hmb::Append(abtm)
		SB = new Statusbar()
		SB::PackEnd(PB,false,false,Convert::ToUInt32(0))
		cmb1 = ComboBox::NewText()
		cmb1::add_Changed(new EventHandler(CMB1_OnChanged()))
		hb1 = new HBox(false,0)
		hb1::Add(cmb1)
		vbx::PackStart(hb1,false,false,Convert::ToUInt32(0))
		tvw1 = new TextView()
		var sw as ScrolledWindow = new ScrolledWindow()
		sw::Add(tvw1)
		vbx::PackStart(sw,true,true,Convert::ToUInt32(0))
		vbx::PackStart(mb,false,false,Convert::ToUInt32(0))
		vbx::PackEnd(SB,false,false,Convert::ToUInt32(0))
		Add(vbx)
		al1 = new ALList()
		al1::Add(tvw1::get_Buffer())
		cmb1::AppendText("Untitled")
		cmb1::set_Active(0)
		Resize(500,500)
		PBPulser::Change(Timeout::Infinite,Timeout::Infinite)
		SB::Push(Convert::ToUInt32(1),"Program Loaded")
		PB::set_Fraction(1d)
	end method
	
	method public void MainWindow()
	
		me::ctor("dylan.NET IDE")
		InitializeComponent()
		
	end method

end class
