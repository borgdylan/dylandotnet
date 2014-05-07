//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class public auto ansi DNConfigurationParameters extends ConfigurationParameters
		
		[field: ItemProperty ("DefineConstants"), DefaultValue = ""]
		field private string definesymbols

		property public string DefineSymbols
			get
				return definesymbols
			end get
			set
				definesymbols = value ?? string::Empty
			end set
		end property

		[field: ItemProperty ("DebugSymbols"), DefaultValue = "false"]
		field private boolean debugsyms

		property public boolean DebugSymbols
			get
				return debugsyms
			end get
			set
				debugsyms = value
			end set
		end property

		method public void DNConfigurationParameters()
			me::ctor()
			definesymbols = string::Empty
			debugsyms = false
		end method

		method public hidebysig virtual boolean HasDefineSymbol(var symbol as string)
			var symbols = definesymbols::Split (new char[] { ';' })
			foreach sym in symbols
				if sym == symbol then
					return true
				end if
			end for

			return false
		end method

		method public hidebysig virtual void RemoveDefineSymbol (var symbol as string)
			var symbols = new List<of string> (definesymbols::Split (new char[] { ';' }, StringSplitOptions::RemoveEmptyEntries))
			symbols::Remove (symbol)
			definesymbols = #ternary { symbols::get_Count() > 0 ? string::Join (";", symbols), string::Empty}
		end method
		
		method public hidebysig virtual void AddDefineSymbol (var symbol as string)
			var symbols = new List<of string> (definesymbols::Split(new char[] { ';' }, StringSplitOptions::RemoveEmptyEntries))
			symbols::Add (symbol)
			definesymbols = string::Join (";", symbols)
		end method

	end class
	
end namespace
