#refasm "/usr/local/lib/mono/4.5/mscorlib.dll"
#refasm "/usr/local/lib/mono/4.5/System.dll"
#refasm "/usr/local/lib/mono/4.5/System.Core.dll"
#refasm "/usr/local/lib/mono/4.5/Microsoft.CSharp.dll"
#define DEBUG
#define TRACE
#define NET45

#debug on

[assembly: System.Reflection.AssemblyTitle("dylan.NET.Tasks")]
[assembly: System.Reflection.AssemblyInformationalVersion("1.3.0.0")]
[assembly: System.Runtime.CompilerServices.RuntimeCompatibility(), WrapNonExceptionThrows = true]
[assembly: System.Runtime.Versioning.TargetFramework(".NETFramework,Version=v4.5")]

assembly dylan.NET.Tasks dll
ver 1.3.0.0
