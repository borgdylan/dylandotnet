#define NET_2_0
#define NET_3_5
#define NET_4_0
#refasm "/usr/lib/mono/4.0/System.dll"
#refasm "/usr/lib/mono/4.0/mscorlib.dll"
#refasm "/usr/lib/mono/4.0/System.Core.dll"
#refasm "/usr/lib/mono/4.0/System.Xml.Linq.dll"
#refasm "/usr/lib/mono/4.0/System.Xml.dll"
#refasm "/home/dylan/Desktop/dylandotnet/compiler/packages/NUnit.2.6.3/lib/nunit.framework.dll"
#refasm "/home/dylan/Desktop/dylandotnet/compiler/dnu/bin/Testing/dnu.dll"
#refasm "/home/dylan/Desktop/dylandotnet/compiler/dnu/bin/Testing/C5.Mono.dll"
#debug on
[assembly: System.Runtime.InteropServices.ComVisible(false)]
[assembly: System.Reflection.AssemblyConfiguration("Testing")]
[assembly: System.Reflection.AssemblyTitle("units")]
[assembly: System.Runtime.CompilerServices.RuntimeCompatibility(), WrapNonExceptionThrows = true]
[assembly: System.Runtime.Versioning.TargetFramework(".NETFramework,Version=v4.0"), FrameworkDisplayName = ".NET Framework 4"]
assembly units dll
ver 11.3.3.1
#undef DEBUG
#define DEBUG
