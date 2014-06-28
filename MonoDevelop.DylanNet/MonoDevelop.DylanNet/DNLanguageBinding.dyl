//    MonoDevelop.DylanNet.dll MonoDevelop.DylanNet Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA

namespace MonoDevelop.DylanNet

	class public auto ansi DNLanguageBinding implements ILanguageBinding, IDotNetLanguageBinding

		property public override newslot string BlockCommentEndTag
			get
				return null
			end get
		end property
		
		property public override newslot string BlockCommentStartTag
			get
				return null
			end get
		end property
	
		property public override newslot string Language
			get
				return "dylan.NET"
			end get
		end property
		
		property public override newslot string SingleLineCommentTag
			get
				return "//"
			end get
		end property
		
		property public override newslot string ProjectStockIcon
			get
				return "md-csharp-project"
			end get
		end property
		
		method public override newslot FilePath GetFileName(var fileNameWithoutExtension as FilePath)
			return $FilePath$#expr($string$fileNameWithoutExtension + ".dyl")
		end method
		
		method public override newslot boolean IsSourceCodeFile(var fileName as FilePath)
			return fileName::get_Extension() == ".dyl"
		end method
		
		method public override newslot BuildResult Compile(var items as ProjectItemCollection, var configuration as DotNetProjectConfiguration, var configSelector as ConfigurationSelector, var monitor as IProgressMonitor)
			return null
		end method

		method public override newslot ConfigurationParameters CreateCompilationParameters(var projectOptions as XmlElement)
			return new DNConfigurationParameters()
		end method

		method public override newslot ProjectParameters CreateProjectParameters(var projectOptions as XmlElement)
			return new DNProjectParameters()
		end method

		method public override newslot CodeDomProvider GetCodeDomProvider()
			return null
		end method

		method public override newslot ClrVersion[] GetSupportedClrVersions()
			return new ClrVersion[] {ClrVersion::Net_2_0, ClrVersion::Clr_2_1, ClrVersion::Net_4_0, ClrVersion::Net_4_5}
		end method
	end class
	
end namespace
