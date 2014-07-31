﻿using System;
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
using Microsoft.CodeAnalysis;

namespace DNLoader
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
    	
        public DNProjectReference(string name, IDiagnosticResult result, string path, Stream asm, Stream symbols)
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
        
        public Assembly Load(IAssemblyLoaderEngine loader)
        {	
        
        	Assembly asm = loader.LoadStream(_assembly, _symbols);
        	
            if (_assembly != null) {
	            _assembly.Seek(0, SeekOrigin.Begin);
    	  }
    		if (_symbols != null) {
	            _symbols.Seek(0, SeekOrigin.Begin);
    	  }
    		       
            return asm;
        }
        
        public IDiagnosticResult EmitAssembly(string path)
        {	
        	Directory.CreateDirectory(path);
        
         	if (_assembly != null) {
         		using(Stream stream = new FileStream(Path.Combine(path, _name + ".dll"), FileMode.Create) ) {
		            _assembly.Seek(0, SeekOrigin.Begin);
		            _assembly.CopyTo(stream);
    		        _assembly.Seek(0, SeekOrigin.Begin);
    		        stream.Seek(0, SeekOrigin.Begin);
    		    }
    		}
    		if (_symbols != null) {
	            using(Stream symbols = new FileStream(Path.Combine(path, _name + PlatformHelper.DebugExtension), FileMode.Create) ) {
		            _symbols.Seek(0, SeekOrigin.Begin);
		            _symbols.CopyTo(symbols);
    		        _symbols.Seek(0, SeekOrigin.Begin);
    		        symbols.Seek(0, SeekOrigin.Begin);
    		   }
    		}
    		
    		File.Copy("msbuild.dyl", Path.Combine(path, "msbuild.dyl"), true);
    		
            return _result;
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
		
        public DNCompilation(string name, Project project, IList<IMetadataReference> metadataReferences, FrameworkName targetFramework)
        {
            Project = project;
            MetadataReferences = metadataReferences;
            assemblyName = name;
            effectiveTargetFramework = targetFramework;
            warnings = new List<string>();
            errors = new List<string>();
        }

        public Project Project { get; private set; }
        public IList<IMetadataReference> MetadataReferences { get; private set; }
		
		private void ErrorH(CompilerMsg cm) {
			//Console.WriteLine("ERROR: {0} inside project {1} at line {2} in file: {3}", cm.Msg, assemblyName, cm.Line.ToString(), cm.File);
			errors.Add(string.Format("ERROR: {0} inside project {1}({2}) at line {3} in file: {4}", new object[] {cm.Msg, assemblyName, effectiveTargetFramework.FullName, cm.Line.ToString(), cm.File}));
		}

		private void WarnH(CompilerMsg cm) {
			//Console.WriteLine("WARNING: {0} inside project {1} at line {2} in file: {3}", cm.Msg, assemblyName, cm.Line.ToString(), cm.File);
			warnings.Add(string.Format("WARNING: {0} inside project {1}({2}) at line {3} in file: {4}", new object[] {cm.Msg, assemblyName, effectiveTargetFramework.FullName, cm.Line.ToString(), cm.File}));
		}
		
		private Tuple<Stream, Stream> CompileInMemory() {
			if (streams == null) {
				string debugOpt = Project.GetCompilerOptions().DebugSymbols;
				DebugInformationKind debugInformationKind;
				if (!Enum.TryParse<DebugInformationKind>(debugOpt, ignoreCase: true, result: out debugInformationKind)) {
 					debugInformationKind = DebugInformationKind.Full;	
 				}
				
				bool success = true;
				
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
	        	        		sw.Write("#refasm \"memory:");
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
	        	   
	        	   	 foreach (string r in Project.GetCompilerOptions().Defines) {
		            	sw.Write("#define ");
	        	    	sw.WriteLine(r);
		            }
		            
		            
	        	    sw.Write("#define ");
	        	    
	        	    if (effectiveTargetFramework.Identifier == ".NETFramework") {
		        	    sw.Write("NET");
		        	}
		        	else if (effectiveTargetFramework.Identifier == ".NETPortable") {
		        	    sw.Write("PORTABLE");
		        	}
		        	else if (effectiveTargetFramework.Identifier == ".NETCore") {
		        	    sw.Write("NETCORE");
		        	}
		        	else {
		        		sw.Write(effectiveTargetFramework.Identifier);
		        	}
	        	    
	        	    sw.Write(effectiveTargetFramework.Version.Major);
	        	    sw.WriteLine(effectiveTargetFramework.Version.Minor);
	        	    
	        	    foreach (string r in Project.ResourceFiles) {
		            	sw.Write("#embed \"");
	        	        sw.Write(r);
	        	        sw.WriteLine("\"");    
		            }

					sw.WriteLine();
					sw.Write("#debug ");
					sw.WriteLine(debugInformationKind == DebugInformationKind.None ? "off" : "on");
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
				
				MemoryFS.Clear();
				ILEmitter.Init();
				AsmFactory.Init();
				Importer.Init();
				Loader.Init();
				SymTable.Init();
				
				//change the .dll.mdb to .pdb if you are on windows/.NET
				if (success) {
					Stream syms = null;
					if (debugInformationKind != DebugInformationKind.None) {
					 	var pdbPath = Path.Combine(Project.ProjectDirectory, assemblyName + PlatformHelper.DebugExtension);
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
               _export = new DNProjectReference(assemblyName, result, Project.ProjectFilePath, cim.Item1, cim.Item2);
            }

            return _export;
        }
    }
    
    public class DNAssemblyLoader : IProjectReferenceProvider
    {
        private Dictionary<string, DNCompilation> compilations;

        public DNAssemblyLoader()
        {
            compilations = new Dictionary<string, DNCompilation>();
            StreamUtils.UseConsole = false;
        }

        public IMetadataProjectReference GetProjectReference(Project project, FrameworkName targetFramework, string config, ILibraryExport export)
        {
        	string assemblyName = project.Name;
            
            DNCompilation comp;
			if (compilations.ContainsKey(assemblyName)) {
				comp = compilations[assemblyName];
			}
			else {
				try {
					comp = new DNCompilation(assemblyName, project, export.MetadataReferences, targetFramework);
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