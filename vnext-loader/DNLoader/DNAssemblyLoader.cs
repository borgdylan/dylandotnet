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

namespace DNLoader
{
	
	public class DNProjectReference : IMetadataProjectReference
    {
    	
    	private string _name;
    	private Stream _assembly;
    	private string _path;
    	
        public DNProjectReference(string name, string path, Stream asm)
        {
            _name = name;
            _assembly = asm;
            _path = path;
        }

        public string Name
        {
            get
            {
                return _name;
            }
        }

        public string ProjectPath
        {
            get
            {
                return _path;
            }
        }

        public void WriteReferenceAssemblyStream(Stream stream)
        {
            _assembly.CopyTo(stream);
            _assembly.Seek(0, SeekOrigin.Begin);
            stream.Seek(0, SeekOrigin.Begin);
        }
    }	
	
    public class DNAssemblyLoader : IAssemblyLoader, ILibraryExportProvider
    {
        private readonly IProjectResolver _projectResolver;
        private readonly IApplicationEnvironment _environment;
        private readonly ILibraryExportProvider _exportProvider;
        private readonly IAssemblyLoaderEngine _loaderEngine;

        public DNAssemblyLoader(IProjectResolver projectResolver,
                                    IApplicationEnvironment environment,
                                    ILibraryExportProvider exportProvider,
                                    IAssemblyLoaderEngine loaderEngine)
        {
            _projectResolver = projectResolver;
            _environment = environment;
            _exportProvider = exportProvider;
            _loaderEngine = loaderEngine;
        }
		
		private Stream CompileInMemory(string assemblyName, Project project, FrameworkName effectiveTargetFramework, ILibraryExport export) {

			using (StreamWriter sw = new StreamWriter(Path.Combine(project.ProjectDirectory, "msbuild.dyl"))) {
        	    foreach (var reference in export.MetadataReferences)
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
        	       	 			rosRef.WriteReferenceAssemblyStream(ms);
			                    ms.Seek(0, SeekOrigin.Begin);
        	       	 			MemoryFS.AddFile(rosRef.Name + ".dll", ms);
        	        			sw.Write("#refasm \"memory:");
        	        			sw.Write(rosRef.Name);
        	        			sw.WriteLine(".dll\"");
        	       	 		}
        	       		}
        	       	}
        	    }
        	   
        	   	 foreach (string r in project.GetCompilerOptions().Defines) {
	            	sw.Write("#define ");
        	        sw.WriteLine(r);    
	            }
        	    
        	    foreach (string r in project.ResourceFiles) {
	            	sw.Write("#embed \"");
        	        sw.Write(r);
        	        sw.WriteLine("\"");    
	            }
				
				sw.WriteLine();
				
				sw.WriteLine("[assembly: System.Reflection.AssemblyTitle(\"" + assemblyName + "\")]");
				sw.WriteLine("[assembly: System.Runtime.CompilerServices.RuntimeCompatibility(), WrapNonExceptionThrows = true]");
				sw.WriteLine("[assembly: System.Runtime.Versioning.TargetFramework(\"" + effectiveTargetFramework.FullName + "\")]");
				
        	    sw.WriteLine();
        	    sw.Write("assembly ");
        	    sw.Write(assemblyName);
        	    sw.WriteLine(" dll");
        	    sw.WriteLine("ver 1.0.0.0");
			}
			
			var cd = Environment.CurrentDirectory;
			dylan.NET.Compiler.Program.Invoke(new string[] {"-inmemory", "-cd", project.ProjectDirectory, assemblyName + ".dyl"});
			Environment.CurrentDirectory = cd;
			
			var asm = MemoryFS.GetFile(assemblyName + ".dll");
			
			MemoryFS.Clear();
			ILEmitter.Init();
			AsmFactory.Init();
			Importer.Init();
			Loader.Init();
			SymTable.Init();
			
			return asm;
		}
		
        public Assembly Load(string assemblyName)
        {
            Project project;
            if (!_projectResolver.TryResolveProject(assemblyName, out project))
            {
                return null;
            }

            var projectExportProvider = new ProjectExportProvider(_projectResolver);
            FrameworkName effectiveTargetFramework;
            var export = projectExportProvider.GetProjectExport(_exportProvider, assemblyName, _environment.TargetFramework, out effectiveTargetFramework);
			
			var asm = _loaderEngine.LoadStream(CompileInMemory(assemblyName, project, effectiveTargetFramework, export), null);
			        
            return asm;
        }

        public ILibraryExport GetLibraryExport(string assemblyName, FrameworkName targetFramework)
        {
            Project project;
            if (!_projectResolver.TryResolveProject(assemblyName, out project))
            {
                return null;
            }
            
            var projectExportProvider = new ProjectExportProvider(_projectResolver);
            FrameworkName effectiveTargetFramework;
            var export = projectExportProvider.GetProjectExport(_exportProvider, assemblyName, _environment.TargetFramework, out effectiveTargetFramework);
            
            var metadataReferences = new List<IMetadataReference>();
            var sourceReferences = new List<ISourceReference>();

            // Project reference
            metadataReferences.Add(new DNProjectReference(assemblyName, project.ProjectFilePath, CompileInMemory(assemblyName, project, effectiveTargetFramework, export)));

            // Other references
            metadataReferences.AddRange(export.MetadataReferences);

            // Shared sources
            foreach (var sharedFile in project.SharedFiles)
            {
            	sourceReferences.Add(new SourceFileReference(sharedFile));
            }

            return new LibraryExport(metadataReferences, sourceReferences);
        }
    }
}