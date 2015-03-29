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
using Microsoft.Framework.Runtime.Helpers;
using Microsoft.Framework.Runtime.Compilation;
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
    
    public class DNDiagnosticResult : IDiagnosticResult
    {
    	private bool _success;
    	private IEnumerable<ICompilationMessage> _messages;
    
    	public DNDiagnosticResult(bool success, IEnumerable<ICompilationMessage> messages) {
    		_success = success;
    		_messages = messages;
    	}
    
        public bool Success
        {
        	get
        	{
        		return _success;
        	}
        }

        public IEnumerable<ICompilationMessage> Diagnostics
        {
        	get
        	{
        		return _messages;
        	}
        }
    }
    
	public class DNCompilation
    {
        private string assemblyName;
        private FrameworkName effectiveTargetFramework;
        private string config;
        private Tuple<Stream, Stream> streams;
        internal IDiagnosticResult result;
        internal ICompilationMessage finalError;
		private List<ICompilationMessage> messages;
		private ICompilationProject Project;
        private IEnumerable<IMetadataReference> MetadataReferences;
        private IEnumerable<ISourceReference> SourceReferences;
		private bool success;
		private bool warnErrors;
		public static object lockobj;
		private ICompilerOptions compileOpts;

		static DNCompilation() {
			lockobj = new object();
		}
		
        public DNCompilation(string name, ICompilationProject project, IEnumerable<IMetadataReference> metadataReferences, IEnumerable<ISourceReference> sourceReferences, FrameworkName targetFramework, string configuration)
        {
            Project = project;
            MetadataReferences = metadataReferences;
            SourceReferences = sourceReferences;
            assemblyName = name;
            effectiveTargetFramework = targetFramework;
            config = configuration;
            messages = new List<ICompilationMessage>();
            success = true;
            compileOpts = project.GetCompilerOptions(targetFramework, configuration);

            if (compileOpts.WarningsAsErrors.HasValue) {
	            warnErrors = (bool)compileOpts.WarningsAsErrors;
	        }
        }

		private void ErrorH(CompilerMsg cm) {
			//Console.WriteLine("ERROR: {0} inside project {1} at line {2} in file: {3}", cm.Msg, assemblyName, cm.Line.ToString(), cm.File);
			var formatted = $"ERROR: {cm.Msg} inside project {assemblyName}({effectiveTargetFramework.FullName}) at line {cm.Line} in file: {cm.File}";
			var msg = new CompilationMessage() {Message = cm.Msg, StartLine = cm.Line, EndLine = cm.Line, StartColumn = 1, SourceFilePath = cm.File, FormattedMessage = formatted, Severity = CompilationMessageSeverity.Error};
			messages.Add(msg);
			finalError = msg;
			success = false;
		}

		private void WarnH(CompilerMsg cm) {
			//Console.WriteLine("WARNING: {0} inside project {1} at line {2} in file: {3}", cm.Msg, assemblyName, cm.Line.ToString(), cm.File);
			if (warnErrors) {
				ErrorH(cm);
				return;
			}
			
			var formatted = $"WARNING: {cm.Msg} inside project {assemblyName}({effectiveTargetFramework.FullName}) at line {cm.Line} in file: {cm.File}";
			messages.Add(new CompilationMessage() {Message = cm.Msg, StartLine = cm.Line, EndLine = cm.Line, StartColumn = 1, SourceFilePath = cm.File, FormattedMessage = formatted, Severity = CompilationMessageSeverity.Warning});
		}
		
		private static Version ParseVersion(string version)
        {
        	//adapted from roslyn project compiler
        	//but in away it ensures that dylan.NET gets
        	//a version with all four integers
            var dashIdx = version.IndexOf('-');
            if (dashIdx >= 0)
            {
               version = version.Substring(0, dashIdx);
            }
            
            string[] parsed = version.Split(new char[] {'.'});
            string[] dest = new string[4];
            int i = 0;
            while (i < parsed.Length && i < 4)
            {
            	dest[i] = parsed[i];
            	i++;
            }
            while (i < 4)
            {
            	dest[i] = "0";
            	i++;
            }
            
            return new Version(string.Join(".", dest));
        }
		
		internal Tuple<Stream, Stream> CompileInMemory() {
			if (streams == null) {
				
				var lst = new List<Tuple<string, Stream> >();
				
				//get value for debug switch
				bool debugOpt = true;
				if (compileOpts.Optimize.HasValue) {
					debugOpt = !((bool)compileOpts.Optimize);
				}

				using (StreamWriter sw = new StreamWriter(Path.Combine(Project.ProjectDirectory, "msbuild.dyl"))) {
	        	    foreach (var reference in MetadataReferences)
	        	    {
	        	    	//dlls from nupkgs
	        	        var fileRef = reference as IMetadataFileReference;
	        	        if (fileRef != null)
	        	        {
	        	        	sw.Write("#refasm \"");
	        	        	sw.Write(fileRef.Path);
	        	        	sw.WriteLine("\"");
	        	        }
	        	        else {
	        	        	//in memory dlls coming from compiled projects
	        	       	 	var rosRef = reference as IMetadataProjectReference;
	        	       	 	if (rosRef != null) {
	        	       	 		var ms = new MemoryStream();
	        	       	 		rosRef.EmitReferenceAssembly(ms);
	        	       	 		if (ms.Length > 0) {
				               	 	ms.Seek(0, SeekOrigin.Begin);
				               	 	//put into in memory filesystem
	        	       	 			lst.Add(Tuple.Create<string, Stream>($"{rosRef.Name}.dll", ms));
	        	        			sw.Write("#refasm \"memory:");
	        	        			sw.Write(rosRef.Name);
	        	        			sw.WriteLine(".dll\"");
	        	        		}
	        	       		}
	        	       	}
	        	    }
	        	    
	        	   //write out all defines
					if (compileOpts != null && compileOpts.Defines != null) {
		        	   	 foreach (string r in compileOpts.Defines) {
			            	sw.Write("#define ");
		        	    	sw.WriteLine(r);
			            }
					}

					//write out resource embeds
	        	    foreach (string r in Project.Files.ResourceFiles) {
		            	sw.Write("#embed \"");
	        	        sw.Write(r);
	        	        sw.WriteLine("\"");
		            }
					
					//write out debug switch prference
					sw.WriteLine();
					sw.Write("#debug ");
					sw.WriteLine(debugOpt ? "on" : "off");
					sw.WriteLine();
					
					//write assembly attributes (similar set to the ones set by roslyn)
					//name
					sw.WriteLine($"[assembly: System.Reflection.AssemblyTitle(\"{assemblyName}\")]");
					//information version that includes stuff like alpha, beta etc.
					sw.WriteLine($"[assembly: System.Reflection.AssemblyInformationalVersion(\"{Project.Version}\")]");
					//get native code exceptions wrapped into something that inherits System.Exception
					sw.WriteLine("[assembly: System.Runtime.CompilerServices.RuntimeCompatibility(), WrapNonExceptionThrows = true]");
					//write out the TFM i.e. target framework moniker
					sw.WriteLine($"[assembly: System.Runtime.Versioning.TargetFramework(\"{effectiveTargetFramework.FullName}\")]");
					
					//define assembly as a dll since k does not really use exes
	        	    sw.WriteLine();
	        	    sw.Write("assembly ");
	        	    sw.Write(assemblyName);
	        	    sw.WriteLine(" dll");
					
					//finalise assembly definition by issuing the version directive
	        	    Version ver = ParseVersion(Project.Version);
	        	    sw.WriteLine($"ver {ver.Major}.{ver.Minor}.{ver.Build}.{ver.Revision}");
	        	    
	        	    //include any 'shared.dyl' export files from referenced projects
	        	    foreach (ISourceFileReference p in SourceReferences.OfType<ISourceFileReference>()) {
	        	    	if (Path.GetFileName(p.Path) == "shared.dyl") {
		        	    	sw.Write("#include \"");
	        	        	sw.Write(p.Path);
	      		  	        sw.WriteLine("\"");
	        	    	}
	        	    }
				}
				
				foreach (Tuple<string, Stream> tup in lst) {
					MemoryFS.AddFile(tup.Item1, tup.Item2);
				}
				lst = null;
				
				var w = new Action<CompilerMsg>(WarnH);
				var e = new Action<CompilerMsg>(ErrorH);

				try {
					StreamUtils.UseConsole = false;
					StreamUtils.WarnH += w;
					StreamUtils.ErrorH += e;
					
					string srcFile = "msbuild.dyl";
					
					if (File.Exists(Path.Combine(Project.ProjectDirectory, $"{assemblyName}.dyl"))) {
						srcFile = $"{assemblyName}.dyl";
					}
					else if (File.Exists(Path.Combine(Project.ProjectDirectory, "project.dyl"))) {
						srcFile = "project.dyl";
					}
					else {
						var formatted = $"WARNING: The file '{assemblyName}.dyl' or 'project.dyl' was not found, compiling 'msbuild.dyl' into an assembly instead! inside project {assemblyName}({effectiveTargetFramework.FullName})";
						messages.Add(new CompilationMessage() {Message = $"The file '{assemblyName}.dyl' or 'project.dyl' was not found, compiling 'msbuild.dyl' into an assembly instead!", SourceFilePath = string.Empty, FormattedMessage = formatted, Severity = CompilationMessageSeverity.Warning});
					}
					
					StreamUtils.UseConsole = false;
					var cd = Environment.CurrentDirectory;
					dylan.NET.Compiler.Program.Invoke(new string[] {"-inmemory", "-cd", Project.ProjectDirectory, srcFile});
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
				
				//clean stuff up
				MemoryFS.Clear();
				ILEmitter.Init();
				AsmFactory.Init();
				Importer.Init();
				Loader.Init();
				SymTable.Init();

				if (success) {
					//load debug symbols if they got made
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

				result = new DNDiagnosticResult(success, messages);
			}

			return streams;
		}
    }
	
	public class DNCompilationException : Exception, ICompilationException
    {
    	private IEnumerable<ICompilationMessage> _messages;
    	private ICompilationMessage _finalError;
    
        public DNCompilationException(ICompilationMessage finalError, IEnumerable<ICompilationMessage> messages) :base(finalError.FormattedMessage)
        {
        	_finalError = finalError;
        	_messages = messages;
        } 
        
        public virtual IEnumerable<ICompilationFailure> CompilationFailures
        {
        	get {
        		return new ICompilationFailure[] {new CompilationFailure() {CompiledContent = string.Empty, SourceFileContent = string.Empty, SourceFilePath = _finalError.SourceFilePath, Messages = _messages } };
        	}
        }
    }
	
	public class DNProjectReference : IMetadataProjectReference, IDisposable
    {
    	private Stream _assembly;
    	private Stream _symbols;
    	private IDiagnosticResult _result;
    	private string _name;
    	private ICompilationProject _project;
    	private bool _compiled;
    	private DNCompilation _comp;
		private ICompilationMessage _finalError;

        public DNProjectReference(ICompilationProject project, string name, DNCompilation compilation)
        {
        	_name = name;
            _project = project;
            _compiled = false;
            _comp = compilation;
        }
        
        private void EnsureCompiled() {
        	if (!_compiled) {
        		Tuple<Stream, Stream> cim;
        		
        		lock (DNCompilation.lockobj) {
	        		cim = _comp.CompileInMemory();
     			}
     			   		
        		_result = _comp.result;
        		_finalError = _comp.finalError;
        		_assembly = cim.Item1;
        		_symbols = cim.Item2;
        		_compiled = true;
        	}
        }

		public virtual void Dispose() {
			if (_assembly != null) {
	            _assembly.Close();
    		}
    		if (_symbols != null) {
	            _symbols.Close();
    		}
		}

        public virtual string ProjectPath
        {
            get
            {
                return _project.ProjectFilePath;
            }
        }

        public virtual string Name
        {
            get
            {
                return _name;
            }
        }

		public virtual IDiagnosticResult GetDiagnostics() {
			EnsureCompiled();
			return _result;
		}

        public virtual IList<ISourceReference> GetSources() {
        	return new ISourceReference[0];
        }

        public virtual void EmitReferenceAssembly(Stream stream)
        {
        	EnsureCompiled();
	        if (_assembly != null) {
	            _assembly.CopyTo(stream);
	            _assembly.Seek(0, SeekOrigin.Begin);
	            stream.Seek(0, SeekOrigin.Begin);
	         }
        }

        public virtual Assembly Load(IAssemblyLoadContext loader)
        {
			EnsureCompiled();
        	Assembly asm = null;

        	if (!_result.Success) {
				throw new DNCompilationException(_finalError, _result.Diagnostics);
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

        public virtual IDiagnosticResult EmitAssembly(string path)
        {
        	EnsureCompiled();
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
			
			if (File.Exists(Path.Combine(_project.ProjectDirectory, fsDocs))) {
	    		File.Copy(Path.Combine(_project.ProjectDirectory, fsDocs), Path.Combine(path, docs), true);
	    	}
	    	else {
	    		if (File.Exists(Path.Combine(_project.ProjectDirectory, docs))) {
	    			File.Copy(Path.Combine(_project.ProjectDirectory, docs), Path.Combine(path, docs), true);
	    		}
	    	}
	    	
			
            return _result;
        }
    }

    public class DNProjectCompiler : IProjectCompiler
    {
        private Dictionary<string, DNCompilation> compilations;

        public DNProjectCompiler()
        {
            compilations = new Dictionary<string, DNCompilation>();
        }

        public virtual IMetadataProjectReference CompileProject(ICompilationProject project, ILibraryKey target, Func<ILibraryExport> getExport, Func<IList<ResourceDescriptor>> getResources)
        {
        	string assemblyName = target.Name;

            DNCompilation comp;
			if (compilations.ContainsKey(assemblyName)) {
				comp = compilations[assemblyName];
			}
			else {
				try {
					ILibraryExport incomingRefs = getExport.Invoke();
					comp = new DNCompilation(assemblyName, project, incomingRefs.MetadataReferences, incomingRefs.SourceReferences, target.TargetFramework, target.Configuration);
				}
				catch (ErrorException e) {
					comp = null;
				}
				compilations.Add(assemblyName, comp);
			}

            return new DNProjectReference(project, assemblyName, comp);
        }
    }
}
