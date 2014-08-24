#refasm "/usr/lib/mono/4.5/mscorlib.dll"
#refasm "/usr/lib/mono/4.5/System.dll"
#refasm "/usr/lib/mono/4.5/System.Core.dll"
#refasm "/usr/lib/mono/4.5/Microsoft.CSharp.dll"
#define NET45

#debug off

[assembly: System.Reflection.AssemblyTitle("dylan.NET.Tasks")]
[assembly: System.Runtime.CompilerServices.RuntimeCompatibility(), WrapNonExceptionThrows = true]
[assembly: System.Runtime.Versioning.TargetFramework(".NETFramework,Version=v4.5")]

assembly dylan.NET.Tasks dll
ver 1.0.2.0
