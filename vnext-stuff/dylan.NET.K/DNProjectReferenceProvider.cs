//    dylan.NET.K.dll dylan.NET.K Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Runtime.Versioning;
using System.Text;
using Microsoft.Framework.Runtime;
using NuGet;
using dylan.NET.Compiler;
using dylan.NET.Utils;
using dylan.NET.Reflection;
using dylan.NET.Tokenizer.CodeGen;

namespace dylan.NET.K
{

	 internal static class PlatformHelper
    {
        private static Lazy<bool> _isMono = new Lazy<bool>(() => Type.GetType("Mono.Runtime") != null);

        public static bool IsMono
        {
            get
            {
                return _isMono.Value;
            }
        }

        public static string DebugExtension {
        	get {
        		return IsMono ? ".dll.mdb" : ".pdb";
        	}
        }
    }

	public class DNProjectReference : IMetadataProjectReference, IDisposable
    {
    	private Stream _assembly;
    	private Stream _symbols;
    	private string _path;
    	private IDiagnosticResult _result;
    	private string _name;
    	private Project _project;

        public DNProjectReference(Project project, string name, IDiagnosticResult result, string path, Stream asm, Stream symbols)
        {
        	_name = name;
            _assembly = asm;
            _symbols = symbols;
            _path = path;
            _result = result;
        }

		public void Dispose() {
			if (_assembly != null) {
	            _assembly.Close();
    		}
    		if (_symbols != null) {
	            _symbols.Close();
    		}
		}

        public string ProjectPath
        {
            get
            {
                return _path;
            }
        }

        public string Name
        {
            get
            {
                return _name;
            }
        }

		public IDiagnosticResult GetDiagnostics() {
			return _result;
		}

        public IList<ISourceReference> GetSources() {
        	return new ISourceReference[0];
        }

        public void EmitReferenceAssembly(Stream stream)
        {
	        if (_assembly != null) {
	            _assembly.CopyTo(stream);
	            _assembly.Seek(0, SeekOrigin.Begin);
	            stream.Seek(0, SeekOrigin.Begin);
	         }
        }

        public Assembly Load(IAssemblyLoadContext loader)
        {

        	Assembly asm = null;

        	if (!_result.Success) {
				throw new CompilationException(_result.Errors.ToList());
			}

            if (_assembly != null) {
            	asm = loader.LoadStream(_assembly, _symbols);
	            _assembly.Seek(0, SeekOrigin.Begin);
    	  }
    		if (_symbols != null) {
	            _symbols.Seek(0, SeekOrigin.Begin);
    	  }

            return asm;
        }

        public IDiagnosticResult EmitAssembly(string path)
        {
        	//make folder if it does not exist
        	Directory.CreateDirectory(path);

			//copy msil to disk
         	if (_assembly != null) {
         		using(Stream stream = new FileStream(Path.Combine(path, _name + ".dll"), FileMode.Create) ) {
		            _assembly.Seek(0, SeekOrigin.Begin);
		            _assembly.CopyTo(stream);
    		        _assembly.Seek(0, SeekOrigin.Begin);
    		        stream.Seek(0, SeekOrigin.Begin);
    		    }
    		}
    		//copy debug sysmbols to disk
    		if (_symbols != null) {
	            using(Stream symbols = new FileStream(Path.Combine(path, _name + PlatformHelper.DebugExtension), FileMode.Create) ) {
		            _symbols.Seek(0, SeekOrigin.Begin);
		            _symbols.CopyTo(symbols);
    		        _symbols.Seek(0, SeekOrigin.Begin);
    		        symbols.Seek(0, SeekOrigin.Begin);
    		   }
    		}
			
			//copy directive file made by build tooling
			if (File.Exists("msbuild.dyl")) {
	    		File.Copy("msbuild.dyl", Path.Combine(path, "msbuild.dyl"), true);
	    	}
	    	
	    	//copy docs in msxdoc format if they are found
	    	var ps = ParseUtils.StringParser(path, Path.DirectorySeparatorChar);
	    	//the short framework name e.g. aspnet50 extracted from path
	    	var fn = ps[ps.Length - 1];
	    	//framework specific docs
			var fsDocs = $"{_name}.{fn}.xml";
			//general docs
			var docs = $"{_name}.xml";
			
			if (File.Exists(fsDocs)) {
	    		File.Copy(fsDocs, Path.Combine(path, docs), true);
	    	}
	    	else {
	    		if (File.Exists(docs)) {
	    			File.Copy(docs, Path.Combine(path, docs), true);
	    		}
	    	}
	    	
			
            return _result;
        }
    }

	public class DNEmbeddedReference : IMetadataEmbeddedReference
    {

    	private string _name;
    	private byte[] _contents;

    	public DNEmbeddedReference(string name, Stream content) {
    		_name = name;
    		MemoryStream ms = (MemoryStream)content;
    		_contents = ms.ToArray();
    	}

    	public string Name
        {
            get
            {
                return _name;
            }
        }

        public byte[] Contents
        {
            get
            {
                return _contents;
            }
        }

    }

	public class DNCompilation
    {
        private IMetadataProjectReference _export;
        private string assemblyName;
        private FrameworkName effectiveTargetFramework;
        private Tuple<Stream, Stream> streams;
        private IDiagnosticResult result;
		private List<string> warnings;
		private List<string> errors;
		private Project Project;
        private IEnumerable<IMetadataReference> MetadataReferences;
		private IList<IMetadataReference> OutgoingRefs;
		private bool success;
		private bool warnErrors;

        public DNCompilation(string name, Project project, IEnumerable<IMetadataReference> metadataReferences, IList<IMetadataReference> outgoingRefs, FrameworkName targetFramework)
        {
            Project = project;
            MetadataReferences = metadataReferences;
            assemblyName = name;
            effectiveTargetFramework = targetFramework;
            warnings = new List<string>();
            errors = new List<string>();
            OutgoingRefs = outgoingRefs;
            success = true;

            if (project.GetCompilerOptions().WarningsAsErrors.HasValue) {
	            warnErrors = (bool)project.GetCompilerOptions().WarningsAsErrors;
	        }
        }

		private void ErrorH(CompilerMsg cm) {
			//Console.WriteLine("ERROR: {0} inside project {1} at line {2} in file: {3}", cm.Msg, assemblyName, cm.Line.ToString(), cm.File);
			errors.Add($"ERROR: {cm.Msg} inside project {assemblyName}({effectiveTargetFramework.FullName}) at line {cm.Line} in file: {cm.File}");
			success = false;
		}

		private void WarnH(CompilerMsg cm) {
			//Console.WriteLine("WARNING: {0} inside project {1} at line {2} in file: {3}", cm.Msg, assemblyName, cm.Line.ToString(), cm.File);
			if (warnErrors) {
				ErrorH(cm);
				return;
			}

			warnings.Add($"WARNING: {cm.Msg} inside project {assemblyName}({effectiveTargetFramework.FullName}) at line {cm.Line} in file: {cm.File}");
		}

		private Tuple<Stream, Stream> CompileInMemory() {
			if (streams == null) {

				bool debugOpt = true;
				if (Project.GetCompilerOptions().Optimize.HasValue) {
					debugOpt = !((bool)Project.GetCompilerOptions().Optimize);
				}

				using (StreamWriter sw = new StreamWriter(Path.Combine(Project.ProjectDirectory, "msbuild.dyl"))) {
	        	    foreach (var reference in MetadataReferences)
	        	    {
	        	        var fileRef = reference as IMetadataFileReference;
	        	        if (fileRef != null)
	        	        {
	        	        	sw.Write("#refasm \"");
	        	        	sw.Write(fileRef.Path);
	        	        	sw.WriteLine("\"");
	        	        }
	        	        else {
	        	      	  	var rawRef = reference as IMetadataEmbeddedReference;
	        	     	  	if (rawRef != null) {
	        	     	  		MemoryFS.AddFile(rawRef.Name + ".dll", new MemoryStream(rawRef.Contents));
	        	        		sw.Write("#refembedasm \"memory:");
	        	        		sw.Write(rawRef.Name);
	        	        		sw.WriteLine(".dll\"");
	        	       		}
	        	       	 	else {
	        	       	 		var rosRef = reference as IMetadataProjectReference;
	        	       	 		if (rosRef != null) {
	        	       	 			var ms = new MemoryStream();
	        	       	 			rosRef.EmitReferenceAssembly(ms);
	        	       	 			if (ms.Length > 0) {
				                   	 	ms.Seek(0, SeekOrigin.Begin);
	        	       	 				MemoryFS.AddFile(rosRef.Name + ".dll", ms);
	        	        				sw.Write("#refasm \"memory:");
	        	        				sw.Write(rosRef.Name);
	        	        				sw.WriteLine(".dll\"");
	        	        			}
	        	       	 		}
	        	       		}
	        	       	}
	        	    }

					if (Project.GetCompilerOptions() != null && Project.GetCompilerOptions().Defines != null) {
		        	   	 foreach (string r in Project.GetCompilerOptions().Defines) {
			            	sw.Write("#define ");
		        	    	sw.WriteLine(r);
			            }
					}

	        	    var fxId = string.Empty;
	        	    var fxVer = effectiveTargetFramework.Version;

	        	    if (effectiveTargetFramework.Identifier == ".NETFramework") {
		        	    fxId = "NET";
		        	}
		        	else if (effectiveTargetFramework.Identifier == "Asp.Net") {
		        	    fxId = "ASPNET";
		        	}
		        	else if (effectiveTargetFramework.Identifier == "Asp.NetCore") {
		        	    fxId = "ASPNETCORE";
		        	}
		        	else if (effectiveTargetFramework.Identifier == ".NETPortable") {
		        	    fxId = "PORTABLE";
		        	}
		        	else if (effectiveTargetFramework.Identifier == ".NETCore") {
		        	    fxId = "NETCORE";
		        	}
		        	else if (effectiveTargetFramework.Identifier == "WindowsPhone") {
		        	    fxId = "WP";
		        	}
		        	else if (effectiveTargetFramework.Identifier == "MonoTouch") {
		        	    fxId = "IOS";
		        	}
		        	else if (effectiveTargetFramework.Identifier == "MonoAndroid") {
		        	    fxId = "ANDROID";
		        	}
		        	else if (effectiveTargetFramework.Identifier == "Silverlight") {
		        	    fxId = "SL";
		        	}
		        	else {
		        		fxId = effectiveTargetFramework.Identifier;
		        	}

	        	    sw.WriteLine("#define {0}{1}{2}", new object[] {fxId, fxVer.Major.ToString(), fxVer.Minor.ToString()});
	        	    if (fxVer.Build > 0) {
	        	    	sw.WriteLine("#define {0}{1}{2}{3}", new object[] {fxId, fxVer.Major.ToString(), fxVer.Minor.ToString(), fxVer.Build.ToString()});
	        	    }

	        	    foreach (string r in Project.ResourceFiles) {
		            	sw.Write("#embed \"");
	        	        sw.Write(r);
	        	        sw.WriteLine("\"");
		            }

					sw.WriteLine();
					sw.Write("#debug ");
					sw.WriteLine(debugOpt ? "on" : "off");
					sw.WriteLine();

					sw.WriteLine("[assembly: System.Reflection.AssemblyTitle(\"" + assemblyName + "\")]");
					sw.WriteLine("[assembly: System.Runtime.CompilerServices.RuntimeCompatibility(), WrapNonExceptionThrows = true]");
					sw.WriteLine("[assembly: System.Runtime.Versioning.TargetFramework(\"" + effectiveTargetFramework.FullName + "\")]");

	        	    sw.WriteLine();
	        	    sw.Write("assembly ");
	        	    sw.Write(assemblyName);
	        	    sw.WriteLine(" dll");

	        	    Version ver = Project.Version.Version;
	        	    sw.WriteLine("ver {0}.{1}.{2}.{3}", new object[] {(object)ver.Major, (object)ver.Minor, (object)ver.Build, (object)ver.Revision});
				}

				var w = new Action<CompilerMsg>(WarnH);
				var e = new Action<CompilerMsg>(ErrorH);

				try {
					StreamUtils.WarnH += w;
					StreamUtils.ErrorH += e;

					var cd = Environment.CurrentDirectory;
					dylan.NET.Compiler.Program.Invoke(new string[] {"-inmemory", "-cd", Project.ProjectDirectory, assemblyName + ".dyl"});
					Environment.CurrentDirectory = cd;
				}
				catch (ErrorException fe) {
					success = false;
				}
				finally {
					StreamUtils.WarnH -= w;
					StreamUtils.ErrorH -= e;
				}

				var asm = MemoryFS.GetFile(assemblyName + ".dll");

				foreach (string ani in MemoryFS.GetANIs()) {
					OutgoingRefs.Add(new DNEmbeddedReference(Path.GetFileNameWithoutExtension(ani), MemoryFS.GetFile(ani)));
				}

				MemoryFS.Clear();
				ILEmitter.Init();
				AsmFactory.Init();
				Importer.Init();
				Loader.Init();
				SymTable.Init();

				//change the .dll.mdb to .pdb if you are on windows/.NET
				if (success) {
					Stream syms = null;
					var pdbPath = Path.Combine(Project.ProjectDirectory, assemblyName + PlatformHelper.DebugExtension);
					if (debugOpt && File.Exists(pdbPath)) {
					 	using (FileStream fs = new FileStream(pdbPath, FileMode.Open)) {
					 		syms = new MemoryStream();
					 		fs.CopyTo(syms);
  	  		        		syms.Seek(0, SeekOrigin.Begin);
					 	}
					 	File.Delete(pdbPath);
					}
					streams = Tuple.Create<Stream, Stream>(asm, syms);
				}
				else {
					streams = Tuple.Create<Stream, Stream>(null, null);
				}

				result = new DiagnosticResult(success, warnings, errors);
			}

			return streams;
		}

        public IMetadataProjectReference GetProjectReference()
        {
            if (_export == null)
            {
               var cim = CompileInMemory();
               _export = new DNProjectReference(Project, assemblyName, result, Project.ProjectFilePath, cim.Item1, cim.Item2);
            }

            return _export;
        }
    }

    public class DNProjectReferenceProvider : IProjectReferenceProvider
    {
        private Dictionary<string, DNCompilation> compilations;

        public DNProjectReferenceProvider()
        {
            compilations = new Dictionary<string, DNCompilation>();
            StreamUtils.UseConsole = false;
        }

        //IEnumerable<IMetadataReference> incomingRefs, IEnumerable<ISourceReference> sources
        public IMetadataProjectReference GetProjectReference(Project project, ILibraryKey target, Func<ILibraryExport> getExport, IList<IMetadataReference> outgoingRefs)
        {
        	string assemblyName = target.Name;

            DNCompilation comp;
			if (compilations.ContainsKey(assemblyName)) {
				comp = compilations[assemblyName];
			}
			else {
				try {
					IEnumerable<IMetadataReference> incomingRefs = getExport.Invoke().MetadataReferences;
					comp = new DNCompilation(assemblyName, project, incomingRefs, outgoingRefs, target.TargetFramework);
				}
				catch (ErrorException e) {
					comp = null;
				}
				compilations.Add(assemblyName, comp);
			}

            return comp.GetProjectReference();
        }
    }
}
