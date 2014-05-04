#define NET_2_0
#define NET_3_5
#define NET_4_0
#define NET_4_5
#refasm "/usr/lib/mono/4.5/System.dll"
#refasm "/usr/lib/mono/4.5/mscorlib.dll"
#refasm "/usr/lib/mono/4.5/System.Core.dll"
#refasm "/usr/lib/mono/4.5/System.Xml.Linq.dll"
#refasm "/usr/lib/mono/4.5/System.Xml.dll"
#refasm "/usr/lib/cli/nunit.framework-2.6/nunit.framework.dll"
#refasm "/var/www/Code/dylannet/dylandotnet/dncollections/dncollections/bin/Debug/dncollections.dll"
#refasm "/var/www/Code/dylannet/dylandotnet/dncollections/dncollections/bin/Debug/System.Interactive.dll"
#debug on
[assembly: System.Reflection.AssemblyConfiguration("Debug")]
[assembly: System.Reflection.AssemblyTitle("tests")]
[assembly: System.Runtime.CompilerServices.RuntimeCompatibility(), WrapNonExceptionThrows = true]
[assembly: System.Runtime.Versioning.TargetFramework(".NETFramework,Version=v4.5"), FrameworkDisplayName = ".NET Framework 4.5"]
assembly tests dll
ver 1.0.0.0
#undef DEBUG
#define DEBUG
