.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern System.Xml.Linq
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern System
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly 'dnu'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 35 00 00 ) // ...11.2.8.5..

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (01 00 03 64 6E 75 00 00 ) // ...dnu..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (01 00 03 64 6E 75 00 00 ) // ...dnu..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (01 00 03 64 6E 75 00 00 ) // ...dnu..

  .hash algorithm 0x00008004
  .ver  11:2:8:5
}

.module dnu.dll // GUID = {149CB6CF-FEB1-4D35-AE09-9305B33D6305}


.namespace dylan.NET.Utils
{
  .class public auto ansi Constants
  	extends [mscorlib]System.Object
  {
    .field  public static initonly  string quot
    .field  public static initonly  string cr
    .field  public static initonly  string lf
    .field  public static initonly  string crlf
    .field  public static initonly  float64 pi
    .field  public static initonly  float64 e
    .field  public static initonly  bool t
    .field  public static initonly  bool f

    // method line 1
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 186 (0xba)
	.maxstack 2
	.locals init (
		char	V_0,
		char	V_1)
	IL_0000:  ldstr "34"
	IL_0005:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_000a:  call char class [mscorlib]System.Convert::ToChar(int32)
	IL_000f:  stloc 0

	IL_0013:  nop 
	IL_0014:  nop 
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  call string class [mscorlib]System.Convert::ToString(char)
	IL_0020:  stsfld string dylan.NET.Utils.Constants::quot
	IL_0025:  ldstr "a"
	IL_002a:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_002f:  stloc 1

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  ldc.i4 13
	IL_003a:  call char class [mscorlib]System.Convert::ToChar(int32)
	IL_003f:  stloc 1

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldloc 1

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  call string class [mscorlib]System.Convert::ToString(char)
	IL_0050:  stsfld string dylan.NET.Utils.Constants::cr
	IL_0055:  ldc.i4 10
	IL_005a:  call char class [mscorlib]System.Convert::ToChar(int32)
	IL_005f:  stloc 1

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  ldloc 1

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  call string class [mscorlib]System.Convert::ToString(char)
	IL_0070:  stsfld string dylan.NET.Utils.Constants::lf
	IL_0075:  ldsfld string dylan.NET.Utils.Constants::cr
	IL_007a:  ldsfld string dylan.NET.Utils.Constants::lf
	IL_007f:  call string string::Concat(string, string)
	IL_0084:  stsfld string dylan.NET.Utils.Constants::crlf
	IL_0089:  ldc.r8 3.1415926535897931
	IL_0092:  stsfld float64 dylan.NET.Utils.Constants::pi
	IL_0097:  ldc.r8 2.7182818284590451
	IL_00a0:  stsfld float64 dylan.NET.Utils.Constants::e
	IL_00a5:  ldc.i4 1
	IL_00aa:  stsfld bool dylan.NET.Utils.Constants::t
	IL_00af:  ldc.i4 0
	IL_00b4:  stsfld bool dylan.NET.Utils.Constants::f
	IL_00b9:  ret 
    } // end of method Constants::.cctor

  } // end of class dylan.NET.Utils.Constants
}

.namespace dylan.NET.Utils
{
  .class public auto ansi XmlUtils
  	extends [mscorlib]System.Object
  {

    // method line 2
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XName MakeName (string name)  cil managed 
    {
        // Method begins at RVA 0x2118
	// Code size 29 (0x1d)
	.maxstack 2
	.locals init (
		class [System.Xml.Linq]System.Xml.Linq.XName	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldstr ""
	IL_000b:  call class [System.Xml.Linq]System.Xml.Linq.XName class [System.Xml.Linq]System.Xml.Linq.XName::Get(string, string)
	IL_0010:  stloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ret 
    } // end of method XmlUtils::MakeName

    // method line 3
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XElement MakeNode (string name)  cil managed 
    {
        // Method begins at RVA 0x2144
	// Code size 46 (0x2e)
	.maxstack 2
	.locals init (
		class [System.Xml.Linq]System.Xml.Linq.XName	V_0,
		class [System.Xml.Linq]System.Xml.Linq.XElement	V_1)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldstr ""
	IL_000b:  call class [System.Xml.Linq]System.Xml.Linq.XName class [System.Xml.Linq]System.Xml.Linq.XName::Get(string, string)
	IL_0010:  stloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  newobj instance void class [System.Xml.Linq]System.Xml.Linq.XElement::'.ctor'(class [System.Xml.Linq]System.Xml.Linq.XName)
	IL_0021:  stloc 1

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldloc 1

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ret 
    } // end of method XmlUtils::MakeNode

    // method line 4
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XAttribute MakeAttr (string name, string 'value')  cil managed 
    {
        // Method begins at RVA 0x2180
	// Code size 69 (0x45)
	.maxstack 3
	.locals init (
		class [System.Xml.Linq]System.Xml.Linq.XName	V_0,
		object	V_1,
		class [System.Xml.Linq]System.Xml.Linq.XAttribute	V_2)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldstr ""
	IL_000b:  call class [System.Xml.Linq]System.Xml.Linq.XName class [System.Xml.Linq]System.Xml.Linq.XName::Get(string, string)
	IL_0010:  stloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 1

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  box [mscorlib]System.String
	IL_0021:  stloc 1

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldloc 0

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ldloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  newobj instance void class [System.Xml.Linq]System.Xml.Linq.XAttribute::'.ctor'(class [System.Xml.Linq]System.Xml.Linq.XName, object)
	IL_0038:  stloc 2

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldloc 2

	IL_0042:  nop 
	IL_0043:  nop 
	IL_0044:  ret 
    } // end of method XmlUtils::MakeAttr

    // method line 5
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XElement AddAttr (class [System.Xml.Linq]System.Xml.Linq.XElement el, class [System.Xml.Linq]System.Xml.Linq.XAttribute attr)  cil managed 
    {
        // Method begins at RVA 0x21d4
	// Code size 41 (0x29)
	.maxstack 2
	.locals init (
		object	V_0)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  box [System.Xml.Linq]System.Xml.Linq.XAttribute
	IL_000b:  stloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldarg 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  callvirt instance void class [System.Xml.Linq]System.Xml.Linq.XContainer::Add(object)
	IL_0022:  ldarg 0

	IL_0026:  nop 
	IL_0027:  nop 
	IL_0028:  ret 
    } // end of method XmlUtils::AddAttr

    // method line 6
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XElement AddAttrArr (class [System.Xml.Linq]System.Xml.Linq.XElement el, class [System.Xml.Linq]System.Xml.Linq.XAttribute[] attrs)  cil managed 
    {
        // Method begins at RVA 0x220c
	// Code size 138 (0x8a)
	.maxstack 3
	.locals init (
		object	V_0,
		int32	V_1,
		int32	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  stloc 1

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldc.i4 -1
	IL_0013:  stloc 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldloc 2

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldc.i4 1
	IL_0024:  add 
	IL_0025:  stloc 2

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldarg 1

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldloc 2

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  conv.u 
	IL_0038:  ldelem [System.Xml.Linq]System.Xml.Linq.XAttribute
	IL_003d:  box [System.Xml.Linq]System.Xml.Linq.XAttribute
	IL_0042:  stloc 0

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldarg 0

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  callvirt instance void class [System.Xml.Linq]System.Xml.Linq.XContainer::Add(object)
	IL_0059:  ldloc 2

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 1

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  beq IL_006f

	IL_006a:  br IL_0079

	IL_006f:  br IL_0083

	IL_0074:  br IL_0083

	IL_0079:  br IL_0019

	IL_007e:  br IL_0083

	IL_0083:  ldarg 0

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ret 
    } // end of method XmlUtils::AddAttrArr

    // method line 7
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XElement AddNode (class [System.Xml.Linq]System.Xml.Linq.XElement el, class [System.Xml.Linq]System.Xml.Linq.XElement node)  cil managed 
    {
        // Method begins at RVA 0x22a4
	// Code size 41 (0x29)
	.maxstack 2
	.locals init (
		object	V_0)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  box [System.Xml.Linq]System.Xml.Linq.XElement
	IL_000b:  stloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldarg 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  callvirt instance void class [System.Xml.Linq]System.Xml.Linq.XContainer::Add(object)
	IL_0022:  ldarg 0

	IL_0026:  nop 
	IL_0027:  nop 
	IL_0028:  ret 
    } // end of method XmlUtils::AddNode

    // method line 8
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XElement AddNodeArr (class [System.Xml.Linq]System.Xml.Linq.XElement el, class [System.Xml.Linq]System.Xml.Linq.XElement[] nodes)  cil managed 
    {
        // Method begins at RVA 0x22dc
	// Code size 138 (0x8a)
	.maxstack 3
	.locals init (
		object	V_0,
		int32	V_1,
		int32	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  stloc 1

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldc.i4 -1
	IL_0013:  stloc 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldloc 2

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldc.i4 1
	IL_0024:  add 
	IL_0025:  stloc 2

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldarg 1

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldloc 2

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  conv.u 
	IL_0038:  ldelem [System.Xml.Linq]System.Xml.Linq.XElement
	IL_003d:  box [System.Xml.Linq]System.Xml.Linq.XElement
	IL_0042:  stloc 0

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldarg 0

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  callvirt instance void class [System.Xml.Linq]System.Xml.Linq.XContainer::Add(object)
	IL_0059:  ldloc 2

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 1

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  beq IL_006f

	IL_006a:  br IL_0079

	IL_006f:  br IL_0083

	IL_0074:  br IL_0083

	IL_0079:  br IL_0019

	IL_007e:  br IL_0083

	IL_0083:  ldarg 0

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ret 
    } // end of method XmlUtils::AddNodeArr

    // method line 9
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XElement SetVal (class [System.Xml.Linq]System.Xml.Linq.XElement el, string 'value')  cil managed 
    {
        // Method begins at RVA 0x2374
	// Code size 24 (0x18)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  callvirt instance void class [System.Xml.Linq]System.Xml.Linq.XElement::set_Value(string)
	IL_0011:  ldarg 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ret 
    } // end of method XmlUtils::SetVal

    // method line 10
    .method public static 
           default string GetVal (class [System.Xml.Linq]System.Xml.Linq.XElement el)  cil managed 
    {
        // Method begins at RVA 0x2398
	// Code size 12 (0xc)
	.maxstack 1
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  callvirt instance string class [System.Xml.Linq]System.Xml.Linq.XElement::get_Value()
	IL_000b:  ret 
    } // end of method XmlUtils::GetVal

    // method line 11
    .method public static 
           default class [System.Xml.Linq]System.Xml.Linq.XElement XPathSelectEl (class [System.Xml.Linq]System.Xml.Linq.XElement el, string XPathQuery)  cil managed 
    {
        // Method begins at RVA 0x23b0
	// Code size 30 (0x1e)
	.maxstack 2
	.locals init (
		class [System.Xml.Linq]System.Xml.Linq.XElement	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  call class [System.Xml.Linq]System.Xml.Linq.XElement class [System.Xml.Linq]System.Xml.XPath.Extensions::XPathSelectElement(class [System.Xml.Linq]System.Xml.Linq.XNode, string)
	IL_0011:  stloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ret 
    } // end of method XmlUtils::XPathSelectEl

    // method line 12
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x23dc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method XmlUtils::.ctor

  } // end of class dylan.NET.Utils.XmlUtils
}

.namespace dylan.NET.Utils
{
  .class public auto ansi ParseUtils
  	extends [mscorlib]System.Object
  {
    .field  public static  string[] stack

    // method line 13
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x23f0
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr [mscorlib]System.String
	IL_000b:  stsfld string[] dylan.NET.Utils.ParseUtils::stack
	IL_0010:  ret 
    } // end of method ParseUtils::.cctor

    // method line 14
    .method private static 
           default string[] addelem (string[] srcarr, string eltoadd)  cil managed 
    {
        // Method begins at RVA 0x2410
	// Code size 273 (0x111)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string[]	V_4)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  stloc 0

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldloc 0

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 1
	IL_0019:  add 
	IL_001a:  stloc 1

	IL_001e:  nop 
	IL_001f:  nop 
	IL_0020:  ldloc 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldc.i4 1
	IL_002b:  sub 
	IL_002c:  stloc 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 -1
	IL_0037:  stloc 3

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldloc 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  conv.u 
	IL_0044:  newarr [mscorlib]System.String
	IL_0049:  stloc 4

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 3

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldc.i4 1
	IL_005a:  add 
	IL_005b:  stloc 3

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  ldloc 0

	IL_0065:  nop 
	IL_0066:  nop 
	IL_0067:  ldc.i4 0
	IL_006c:  bgt IL_0076

	IL_0071:  br IL_009f

	IL_0076:  ldloc 4

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 3

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  conv.u 
	IL_0083:  ldarg 0

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem [mscorlib]System.String
	IL_0095:  stelem [mscorlib]System.String
	IL_009a:  br IL_00a4

	IL_009f:  br IL_00a4

	IL_00a4:  ldloc 3

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldloc 2

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  beq IL_00ba

	IL_00b5:  br IL_00c4

	IL_00ba:  br IL_00f2

	IL_00bf:  br IL_00f2

	IL_00c4:  ldloc 2

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  ldc.i4 -1
	IL_00cf:  beq IL_00e3

	IL_00d4:  br IL_00d9

	IL_00d9:  br IL_004f

	IL_00de:  br IL_00ed

	IL_00e3:  br IL_00f2

	IL_00e8:  br IL_00ed

	IL_00ed:  br IL_00f2

	IL_00f2:  ldloc 4

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldloc 0

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  conv.u 
	IL_00ff:  ldarg 1

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  stelem [mscorlib]System.String
	IL_010a:  ldloc 4

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ret 
    } // end of method ParseUtils::addelem

    // method line 15
    .method private static 
           default string[] remelem (string[] srcarr)  cil managed 
    {
        // Method begins at RVA 0x2530
	// Code size 249 (0xf9)
	.maxstack 11
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string[]	V_4)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  stloc 0

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldloc 0

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 1
	IL_0019:  sub 
	IL_001a:  stloc 1

	IL_001e:  nop 
	IL_001f:  nop 
	IL_0020:  ldloc 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldc.i4 2
	IL_002b:  sub 
	IL_002c:  stloc 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 -1
	IL_0037:  stloc 3

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldloc 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  conv.u 
	IL_0044:  newarr [mscorlib]System.String
	IL_0049:  stloc 4

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 3

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldc.i4 1
	IL_005a:  add 
	IL_005b:  stloc 3

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  ldloc 0

	IL_0065:  nop 
	IL_0066:  nop 
	IL_0067:  ldc.i4 0
	IL_006c:  bgt IL_0076

	IL_0071:  br IL_009f

	IL_0076:  ldloc 4

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 3

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  conv.u 
	IL_0083:  ldarg 0

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem [mscorlib]System.String
	IL_0095:  stelem [mscorlib]System.String
	IL_009a:  br IL_00a4

	IL_009f:  br IL_00a4

	IL_00a4:  ldloc 3

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldloc 2

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  beq IL_00ba

	IL_00b5:  br IL_00c4

	IL_00ba:  br IL_00f2

	IL_00bf:  br IL_00f2

	IL_00c4:  ldloc 2

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  ldc.i4 -1
	IL_00cf:  beq IL_00e3

	IL_00d4:  br IL_00d9

	IL_00d9:  br IL_004f

	IL_00de:  br IL_00ed

	IL_00e3:  br IL_00f2

	IL_00e8:  br IL_00ed

	IL_00ed:  br IL_00f2

	IL_00f2:  ldloc 4

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ret 
    } // end of method ParseUtils::remelem

    // method line 16
    .method public static 
           default string[] StringParser (string StringToParse, string DelimeterChar)  cil managed 
    {
        // Method begins at RVA 0x2638
	// Code size 706 (0x2c2)
	.maxstack 33
	.locals init (
		string[]	V_0,
		bool	V_1,
		string	V_2,
		string	V_3,
		int32	V_4,
		int32	V_5,
		string	V_6,
		int32	V_7)
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr [mscorlib]System.String
	IL_000b:  stloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldc.i4 0
	IL_0016:  stloc 1

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldstr ""
	IL_0021:  stloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldstr ""
	IL_002c:  stloc 3

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 -1
	IL_0037:  stloc 4

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldarg 0

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  callvirt instance int32 string::get_Length()
	IL_0048:  ldc.i4 1
	IL_004d:  sub 
	IL_004e:  stloc 5

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldloc 4

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  ldc.i4 1
	IL_005f:  add 
	IL_0060:  stloc 4

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldarg 0

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldloc 4

	IL_0070:  nop 
	IL_0071:  nop 
	IL_0072:  callvirt instance char string::get_Chars(int32)
	IL_0077:  call string class [mscorlib]System.Convert::ToString(char)
	IL_007c:  stloc 2

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldsfld string dylan.NET.Utils.Constants::quot
	IL_0087:  stloc 6

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldloc 2

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldloc 6

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  call int32 string::Compare(string, string)
	IL_009e:  stloc 7

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldloc 7

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldc.i4 0
	IL_00af:  beq IL_00b9

	IL_00b4:  br IL_011c

	IL_00b9:  ldloc 1

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldc.i4 0
	IL_00c4:  beq IL_00ce

	IL_00c9:  br IL_00e3

	IL_00ce:  ldc.i4 1
	IL_00d3:  stloc 1

	IL_00d7:  nop 
	IL_00d8:  nop 
	IL_00d9:  br IL_0117

	IL_00de:  br IL_00e8

	IL_00e3:  br IL_00e8

	IL_00e8:  ldloc 1

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  ldc.i4 1
	IL_00f3:  beq IL_00fd

	IL_00f8:  br IL_0112

	IL_00fd:  ldc.i4 0
	IL_0102:  stloc 1

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  br IL_0117

	IL_010d:  br IL_0117

	IL_0112:  br IL_0117

	IL_0117:  br IL_0121

	IL_011c:  br IL_0121

	IL_0121:  ldloc 2

	IL_0125:  nop 
	IL_0126:  nop 
	IL_0127:  ldarg 1

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  call int32 string::Compare(string, string)
	IL_0132:  stloc 7

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldloc 7

	IL_013c:  nop 
	IL_013d:  nop 
	IL_013e:  ldc.i4 0
	IL_0143:  beq IL_014d

	IL_0148:  br IL_01fe

	IL_014d:  ldloc 1

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  ldc.i4 0
	IL_0158:  beq IL_0162

	IL_015d:  br IL_01be

	IL_0162:  ldloc 3

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  ldstr ""
	IL_016d:  call int32 string::Compare(string, string)
	IL_0172:  stloc 7

	IL_0176:  nop 
	IL_0177:  nop 
	IL_0178:  ldloc 7

	IL_017c:  nop 
	IL_017d:  nop 
	IL_017e:  ldc.i4 0
	IL_0183:  beq IL_01a9

	IL_0188:  br IL_018d

	IL_018d:  ldloc 0

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldloc 3

	IL_0197:  nop 
	IL_0198:  nop 
	IL_0199:  call string[] class dylan.NET.Utils.ParseUtils::addelem(string[], string)
	IL_019e:  stloc 0

	IL_01a2:  nop 
	IL_01a3:  nop 
	IL_01a4:  br IL_01ae

	IL_01a9:  br IL_01ae

	IL_01ae:  ldstr ""
	IL_01b3:  stloc 3

	IL_01b7:  nop 
	IL_01b8:  nop 
	IL_01b9:  br IL_01c3

	IL_01be:  br IL_01c3

	IL_01c3:  ldloc 1

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  ldc.i4 1
	IL_01ce:  beq IL_01d8

	IL_01d3:  br IL_01f4

	IL_01d8:  ldloc 3

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 2

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  call string string::Concat(string, string)
	IL_01e9:  stloc 3

	IL_01ed:  nop 
	IL_01ee:  nop 
	IL_01ef:  br IL_01f9

	IL_01f4:  br IL_01f9

	IL_01f9:  br IL_021a

	IL_01fe:  ldloc 3

	IL_0202:  nop 
	IL_0203:  nop 
	IL_0204:  ldloc 2

	IL_0208:  nop 
	IL_0209:  nop 
	IL_020a:  call string string::Concat(string, string)
	IL_020f:  stloc 3

	IL_0213:  nop 
	IL_0214:  nop 
	IL_0215:  br IL_021a

	IL_021a:  ldloc 3

	IL_021e:  nop 
	IL_021f:  nop 
	IL_0220:  ldstr ""
	IL_0225:  call int32 string::Compare(string, string)
	IL_022a:  stloc 7

	IL_022e:  nop 
	IL_022f:  nop 
	IL_0230:  ldloc 4

	IL_0234:  nop 
	IL_0235:  nop 
	IL_0236:  ldloc 5

	IL_023a:  nop 
	IL_023b:  nop 
	IL_023c:  beq IL_0246

	IL_0241:  br IL_028c

	IL_0246:  ldloc 7

	IL_024a:  nop 
	IL_024b:  nop 
	IL_024c:  ldc.i4 0
	IL_0251:  beq IL_0277

	IL_0256:  br IL_025b

	IL_025b:  ldloc 0

	IL_025f:  nop 
	IL_0260:  nop 
	IL_0261:  ldloc 3

	IL_0265:  nop 
	IL_0266:  nop 
	IL_0267:  call string[] class dylan.NET.Utils.ParseUtils::addelem(string[], string)
	IL_026c:  stloc 0

	IL_0270:  nop 
	IL_0271:  nop 
	IL_0272:  br IL_027c

	IL_0277:  br IL_027c

	IL_027c:  ldstr ""
	IL_0281:  stloc 3

	IL_0285:  nop 
	IL_0286:  nop 
	IL_0287:  br IL_0291

	IL_028c:  br IL_0291

	IL_0291:  ldloc 4

	IL_0295:  nop 
	IL_0296:  nop 
	IL_0297:  ldloc 5

	IL_029b:  nop 
	IL_029c:  nop 
	IL_029d:  beq IL_02a7

	IL_02a2:  br IL_02b1

	IL_02a7:  br IL_02bb

	IL_02ac:  br IL_02bb

	IL_02b1:  br IL_0054

	IL_02b6:  br IL_02bb

	IL_02bb:  ldloc 0

	IL_02bf:  nop 
	IL_02c0:  nop 
	IL_02c1:  ret 
    } // end of method ParseUtils::StringParser

    // method line 17
    .method public static 
           default string[] StringParser2ds (string StringToParse, string DelimeterChar, string DelimeterChar2)  cil managed 
    {
        // Method begins at RVA 0x2908
	// Code size 845 (0x34d)
	.maxstack 39
	.locals init (
		string[]	V_0,
		bool	V_1,
		string	V_2,
		string	V_3,
		int32	V_4,
		int32	V_5,
		string	V_6,
		int32	V_7,
		int32	V_8,
		int32	V_9)
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr [mscorlib]System.String
	IL_000b:  stloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldc.i4 0
	IL_0016:  stloc 1

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldstr ""
	IL_0021:  stloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldstr ""
	IL_002c:  stloc 3

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 -1
	IL_0037:  stloc 4

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldarg 0

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  callvirt instance int32 string::get_Length()
	IL_0048:  ldc.i4 1
	IL_004d:  sub 
	IL_004e:  stloc 5

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldloc 4

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  ldc.i4 1
	IL_005f:  add 
	IL_0060:  stloc 4

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldarg 0

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldloc 4

	IL_0070:  nop 
	IL_0071:  nop 
	IL_0072:  callvirt instance char string::get_Chars(int32)
	IL_0077:  call string class [mscorlib]System.Convert::ToString(char)
	IL_007c:  stloc 2

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldsfld string dylan.NET.Utils.Constants::quot
	IL_0087:  stloc 6

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldloc 2

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldloc 6

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  call int32 string::Compare(string, string)
	IL_009e:  stloc 7

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldc.i4 0
	IL_00a9:  stloc 8

	IL_00ad:  nop 
	IL_00ae:  nop 
	IL_00af:  ldloc 7

	IL_00b3:  nop 
	IL_00b4:  nop 
	IL_00b5:  ldc.i4 0
	IL_00ba:  beq IL_00c4

	IL_00bf:  br IL_0127

	IL_00c4:  ldloc 1

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  ldc.i4 0
	IL_00cf:  beq IL_00d9

	IL_00d4:  br IL_00ee

	IL_00d9:  ldc.i4 1
	IL_00de:  stloc 1

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  br IL_0122

	IL_00e9:  br IL_00f3

	IL_00ee:  br IL_00f3

	IL_00f3:  ldloc 1

	IL_00f7:  nop 
	IL_00f8:  nop 
	IL_00f9:  ldc.i4 1
	IL_00fe:  beq IL_0108

	IL_0103:  br IL_011d

	IL_0108:  ldc.i4 0
	IL_010d:  stloc 1

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  br IL_0122

	IL_0118:  br IL_0122

	IL_011d:  br IL_0122

	IL_0122:  br IL_012c

	IL_0127:  br IL_012c

	IL_012c:  ldc.i4 1
	IL_0131:  stloc 9

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  ldloc 2

	IL_013b:  nop 
	IL_013c:  nop 
	IL_013d:  ldarg 1

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  call int32 string::Compare(string, string)
	IL_0148:  stloc 7

	IL_014c:  nop 
	IL_014d:  nop 
	IL_014e:  ldloc 2

	IL_0152:  nop 
	IL_0153:  nop 
	IL_0154:  ldarg 2

	IL_0158:  nop 
	IL_0159:  nop 
	IL_015a:  call int32 string::Compare(string, string)
	IL_015f:  stloc 8

	IL_0163:  nop 
	IL_0164:  nop 
	IL_0165:  ldloc 7

	IL_0169:  nop 
	IL_016a:  nop 
	IL_016b:  ldc.i4 0
	IL_0170:  beq IL_017a

	IL_0175:  br IL_018f

	IL_017a:  ldc.i4 0
	IL_017f:  stloc 9

	IL_0183:  nop 
	IL_0184:  nop 
	IL_0185:  br IL_01c3

	IL_018a:  br IL_0194

	IL_018f:  br IL_0194

	IL_0194:  ldloc 8

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  ldc.i4 0
	IL_019f:  beq IL_01a9

	IL_01a4:  br IL_01be

	IL_01a9:  ldc.i4 0
	IL_01ae:  stloc 9

	IL_01b2:  nop 
	IL_01b3:  nop 
	IL_01b4:  br IL_01c3

	IL_01b9:  br IL_01c3

	IL_01be:  br IL_01c3

	IL_01c3:  ldloc 9

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  ldc.i4 0
	IL_01ce:  beq IL_01d8

	IL_01d3:  br IL_0289

	IL_01d8:  ldloc 1

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldc.i4 0
	IL_01e3:  beq IL_01ed

	IL_01e8:  br IL_0249

	IL_01ed:  ldloc 3

	IL_01f1:  nop 
	IL_01f2:  nop 
	IL_01f3:  ldstr ""
	IL_01f8:  call int32 string::Compare(string, string)
	IL_01fd:  stloc 7

	IL_0201:  nop 
	IL_0202:  nop 
	IL_0203:  ldloc 7

	IL_0207:  nop 
	IL_0208:  nop 
	IL_0209:  ldc.i4 0
	IL_020e:  beq IL_0234

	IL_0213:  br IL_0218

	IL_0218:  ldloc 0

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  ldloc 3

	IL_0222:  nop 
	IL_0223:  nop 
	IL_0224:  call string[] class dylan.NET.Utils.ParseUtils::addelem(string[], string)
	IL_0229:  stloc 0

	IL_022d:  nop 
	IL_022e:  nop 
	IL_022f:  br IL_0239

	IL_0234:  br IL_0239

	IL_0239:  ldstr ""
	IL_023e:  stloc 3

	IL_0242:  nop 
	IL_0243:  nop 
	IL_0244:  br IL_024e

	IL_0249:  br IL_024e

	IL_024e:  ldloc 1

	IL_0252:  nop 
	IL_0253:  nop 
	IL_0254:  ldc.i4 1
	IL_0259:  beq IL_0263

	IL_025e:  br IL_027f

	IL_0263:  ldloc 3

	IL_0267:  nop 
	IL_0268:  nop 
	IL_0269:  ldloc 2

	IL_026d:  nop 
	IL_026e:  nop 
	IL_026f:  call string string::Concat(string, string)
	IL_0274:  stloc 3

	IL_0278:  nop 
	IL_0279:  nop 
	IL_027a:  br IL_0284

	IL_027f:  br IL_0284

	IL_0284:  br IL_02a5

	IL_0289:  ldloc 3

	IL_028d:  nop 
	IL_028e:  nop 
	IL_028f:  ldloc 2

	IL_0293:  nop 
	IL_0294:  nop 
	IL_0295:  call string string::Concat(string, string)
	IL_029a:  stloc 3

	IL_029e:  nop 
	IL_029f:  nop 
	IL_02a0:  br IL_02a5

	IL_02a5:  ldloc 3

	IL_02a9:  nop 
	IL_02aa:  nop 
	IL_02ab:  ldstr ""
	IL_02b0:  call int32 string::Compare(string, string)
	IL_02b5:  stloc 7

	IL_02b9:  nop 
	IL_02ba:  nop 
	IL_02bb:  ldloc 4

	IL_02bf:  nop 
	IL_02c0:  nop 
	IL_02c1:  ldloc 5

	IL_02c5:  nop 
	IL_02c6:  nop 
	IL_02c7:  beq IL_02d1

	IL_02cc:  br IL_0317

	IL_02d1:  ldloc 7

	IL_02d5:  nop 
	IL_02d6:  nop 
	IL_02d7:  ldc.i4 0
	IL_02dc:  beq IL_0302

	IL_02e1:  br IL_02e6

	IL_02e6:  ldloc 0

	IL_02ea:  nop 
	IL_02eb:  nop 
	IL_02ec:  ldloc 3

	IL_02f0:  nop 
	IL_02f1:  nop 
	IL_02f2:  call string[] class dylan.NET.Utils.ParseUtils::addelem(string[], string)
	IL_02f7:  stloc 0

	IL_02fb:  nop 
	IL_02fc:  nop 
	IL_02fd:  br IL_0307

	IL_0302:  br IL_0307

	IL_0307:  ldstr ""
	IL_030c:  stloc 3

	IL_0310:  nop 
	IL_0311:  nop 
	IL_0312:  br IL_031c

	IL_0317:  br IL_031c

	IL_031c:  ldloc 4

	IL_0320:  nop 
	IL_0321:  nop 
	IL_0322:  ldloc 5

	IL_0326:  nop 
	IL_0327:  nop 
	IL_0328:  beq IL_0332

	IL_032d:  br IL_033c

	IL_0332:  br IL_0346

	IL_0337:  br IL_0346

	IL_033c:  br IL_0054

	IL_0341:  br IL_0346

	IL_0346:  ldloc 0

	IL_034a:  nop 
	IL_034b:  nop 
	IL_034c:  ret 
    } // end of method ParseUtils::StringParser2ds

    // method line 18
    .method public static 
           default bool LikeOP (string str, string pattern)  cil managed 
    {
        // Method begins at RVA 0x2c64
	// Code size 30 (0x1e)
	.maxstack 2
	.locals init (
		bool	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  call bool class [System]System.Text.RegularExpressions.Regex::IsMatch(string, string)
	IL_0011:  stloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ret 
    } // end of method ParseUtils::LikeOP

    // method line 19
    .method public static 
           default int32 RetPrec (string chr)  cil managed 
    {
        // Method begins at RVA 0x2c90
	// Code size 683 (0x2ab)
	.maxstack 33
	.locals init (
		int32	V_0,
		bool	V_1,
		bool	V_2,
		bool	V_3)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 1
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldc.i4 1
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldc.i4 1
	IL_0026:  stloc 3

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 0

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldstr "("
	IL_0037:  call int32 string::Compare(string, string)
	IL_003c:  stloc 0

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 0

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldc.i4 0
	IL_004d:  beq IL_0057

	IL_0052:  br IL_0066

	IL_0057:  ldc.i4 -1
	IL_005c:  br IL_02aa

	IL_0061:  br IL_006b

	IL_0066:  br IL_006b

	IL_006b:  ldarg 0

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldstr "*"
	IL_0076:  call int32 string::Compare(string, string)
	IL_007b:  stloc 0

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldloc 0

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldc.i4 0
	IL_008c:  beq IL_0096

	IL_0091:  br IL_00a6

	IL_0096:  ldc.i4 1
	IL_009b:  stloc 1

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  br IL_00b6

	IL_00a6:  ldc.i4 0
	IL_00ab:  stloc 1

	IL_00af:  nop 
	IL_00b0:  nop 
	IL_00b1:  br IL_00b6

	IL_00b6:  ldarg 0

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  ldstr "/"
	IL_00c1:  call int32 string::Compare(string, string)
	IL_00c6:  stloc 0

	IL_00ca:  nop 
	IL_00cb:  nop 
	IL_00cc:  ldloc 0

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  ldc.i4 0
	IL_00d7:  beq IL_00e1

	IL_00dc:  br IL_00f1

	IL_00e1:  ldc.i4 1
	IL_00e6:  stloc 2

	IL_00ea:  nop 
	IL_00eb:  nop 
	IL_00ec:  br IL_0101

	IL_00f1:  ldc.i4 0
	IL_00f6:  stloc 2

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  br IL_0101

	IL_0101:  ldarg 0

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldstr "%"
	IL_010c:  call int32 string::Compare(string, string)
	IL_0111:  stloc 0

	IL_0115:  nop 
	IL_0116:  nop 
	IL_0117:  ldloc 0

	IL_011b:  nop 
	IL_011c:  nop 
	IL_011d:  ldc.i4 0
	IL_0122:  beq IL_012c

	IL_0127:  br IL_013c

	IL_012c:  ldc.i4 1
	IL_0131:  stloc 3

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  br IL_014c

	IL_013c:  ldc.i4 0
	IL_0141:  stloc 3

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  br IL_014c

	IL_014c:  ldloc 1

	IL_0150:  nop 
	IL_0151:  nop 
	IL_0152:  ldloc 2

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  or 
	IL_0159:  ldloc 3

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  or 
	IL_0160:  stloc 1

	IL_0164:  nop 
	IL_0165:  nop 
	IL_0166:  ldloc 1

	IL_016a:  nop 
	IL_016b:  nop 
	IL_016c:  ldc.i4 1
	IL_0171:  beq IL_017b

	IL_0176:  br IL_018a

	IL_017b:  ldc.i4 8
	IL_0180:  br IL_02aa

	IL_0185:  br IL_018f

	IL_018a:  br IL_018f

	IL_018f:  ldarg 0

	IL_0193:  nop 
	IL_0194:  nop 
	IL_0195:  ldstr "+"
	IL_019a:  call int32 string::Compare(string, string)
	IL_019f:  stloc 0

	IL_01a3:  nop 
	IL_01a4:  nop 
	IL_01a5:  ldloc 0

	IL_01a9:  nop 
	IL_01aa:  nop 
	IL_01ab:  ldc.i4 0
	IL_01b0:  beq IL_01ba

	IL_01b5:  br IL_01ca

	IL_01ba:  ldc.i4 1
	IL_01bf:  stloc 1

	IL_01c3:  nop 
	IL_01c4:  nop 
	IL_01c5:  br IL_01da

	IL_01ca:  ldc.i4 0
	IL_01cf:  stloc 1

	IL_01d3:  nop 
	IL_01d4:  nop 
	IL_01d5:  br IL_01da

	IL_01da:  ldarg 0

	IL_01de:  nop 
	IL_01df:  nop 
	IL_01e0:  ldstr "-"
	IL_01e5:  call int32 string::Compare(string, string)
	IL_01ea:  stloc 0

	IL_01ee:  nop 
	IL_01ef:  nop 
	IL_01f0:  ldloc 0

	IL_01f4:  nop 
	IL_01f5:  nop 
	IL_01f6:  ldc.i4 0
	IL_01fb:  beq IL_0205

	IL_0200:  br IL_0215

	IL_0205:  ldc.i4 1
	IL_020a:  stloc 2

	IL_020e:  nop 
	IL_020f:  nop 
	IL_0210:  br IL_0225

	IL_0215:  ldc.i4 0
	IL_021a:  stloc 2

	IL_021e:  nop 
	IL_021f:  nop 
	IL_0220:  br IL_0225

	IL_0225:  ldloc 1

	IL_0229:  nop 
	IL_022a:  nop 
	IL_022b:  ldloc 2

	IL_022f:  nop 
	IL_0230:  nop 
	IL_0231:  or 
	IL_0232:  stloc 1

	IL_0236:  nop 
	IL_0237:  nop 
	IL_0238:  ldloc 1

	IL_023c:  nop 
	IL_023d:  nop 
	IL_023e:  ldc.i4 1
	IL_0243:  beq IL_024d

	IL_0248:  br IL_025c

	IL_024d:  ldc.i4 6
	IL_0252:  br IL_02aa

	IL_0257:  br IL_0261

	IL_025c:  br IL_0261

	IL_0261:  ldarg 0

	IL_0265:  nop 
	IL_0266:  nop 
	IL_0267:  ldstr ")"
	IL_026c:  call int32 string::Compare(string, string)
	IL_0271:  stloc 0

	IL_0275:  nop 
	IL_0276:  nop 
	IL_0277:  ldloc 0

	IL_027b:  nop 
	IL_027c:  nop 
	IL_027d:  ldc.i4 0
	IL_0282:  beq IL_028c

	IL_0287:  br IL_029b

	IL_028c:  ldc.i4 0
	IL_0291:  br IL_02aa

	IL_0296:  br IL_02aa

	IL_029b:  ldc.i4 0
	IL_02a0:  br IL_02aa

	IL_02a5:  br IL_02aa

	IL_02aa:  ret 
    } // end of method ParseUtils::RetPrec

    // method line 20
    .method public static 
           default string ProcessMSYSPath (string p)  cil managed 
    {
        // Method begins at RVA 0x2f48
	// Code size 398 (0x18e)
	.maxstack 15
	.locals init (
		class [mscorlib]System.OperatingSystem	V_0,
		valuetype [mscorlib]System.PlatformID	V_1,
		valuetype [mscorlib]System.PlatformID	V_2,
		bool	V_3,
		string[]	V_4,
		string	V_5,
		int32	V_6)
	IL_0000:  call class [mscorlib]System.OperatingSystem class [mscorlib]System.Environment::get_OSVersion()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  callvirt instance valuetype [mscorlib]System.PlatformID class [mscorlib]System.OperatingSystem::get_Platform()
	IL_0016:  stloc 1

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 2
	IL_0021:  stloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  stloc 3

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 0
	IL_0037:  stloc 6

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldloc 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ldloc 2

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  beq IL_0053

	IL_004e:  br IL_0182

	IL_0053:  ldarg 0

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  ldstr "/"
	IL_005e:  callvirt instance bool string::Contains(string)
	IL_0063:  stloc 3

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldloc 3

	IL_006d:  nop 
	IL_006e:  nop 
	IL_006f:  ldc.i4 1
	IL_0074:  beq IL_007e

	IL_0079:  br IL_0178

	IL_007e:  ldarg 0

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldstr "/"
	IL_0089:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_008e:  ldstr "\\"
	IL_0093:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0098:  callvirt instance string string::Replace(char, char)
	IL_009d:  starg 0

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldarg 0

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  call bool class [mscorlib]System.IO.File::Exists(string)
	IL_00ae:  stloc 3

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldloc 3

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldc.i4 0
	IL_00bf:  beq IL_00c9

	IL_00c4:  br IL_016e

	IL_00c9:  ldarg 0

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldstr "\\"
	IL_00d4:  call string[] class dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_00d9:  stloc 4

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldloc 4

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldc.i4 0
	IL_00ea:  conv.u 
	IL_00eb:  ldelem [mscorlib]System.String
	IL_00f0:  stloc 5

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 5

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  callvirt instance int32 string::get_Length()
	IL_0101:  stloc 6

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldloc 6

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldc.i4 1
	IL_0112:  beq IL_011c

	IL_0117:  br IL_014e

	IL_011c:  ldloc 5

	IL_0120:  nop 
	IL_0121:  nop 
	IL_0122:  ldstr ":"
	IL_0127:  call string string::Concat(string, string)
	IL_012c:  stloc 5

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldloc 4

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldc.i4 0
	IL_013d:  conv.u 
	IL_013e:  ldloc 5

	IL_0142:  nop 
	IL_0143:  nop 
	IL_0144:  stelem [mscorlib]System.String
	IL_0149:  br IL_0153

	IL_014e:  br IL_0153

	IL_0153:  ldstr "\\"
	IL_0158:  ldloc 4

	IL_015c:  nop 
	IL_015d:  nop 
	IL_015e:  call string string::Join(string, string[])
	IL_0163:  starg 0

	IL_0167:  nop 
	IL_0168:  nop 
	IL_0169:  br IL_0173

	IL_016e:  br IL_0173

	IL_0173:  br IL_017d

	IL_0178:  br IL_017d

	IL_017d:  br IL_0187

	IL_0182:  br IL_0187

	IL_0187:  ldarg 0

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  ret 
    } // end of method ParseUtils::ProcessMSYSPath

  } // end of class dylan.NET.Utils.ParseUtils
}

.namespace dylan.NET.Utils
{
  .class public auto ansi Keyboard
  	extends [mscorlib]System.Object
  {

    // method line 21
    .method public static 
           default string ReadString ()  cil managed 
    {
        // Method begins at RVA 0x30e4
	// Code size 6 (0x6)
	.maxstack 1
	IL_0000:  call string class [mscorlib]System.Console::ReadLine()
	IL_0005:  ret 
    } // end of method Keyboard::ReadString

    // method line 22
    .method public static 
           default int32 ReadInteger ()  cil managed 
    {
        // Method begins at RVA 0x30f8
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadInteger

    // method line 23
    .method public static 
           default int8 ReadSbyte ()  cil managed 
    {
        // Method begins at RVA 0x3110
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call int8 class [mscorlib]System.Convert::ToSByte(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadSbyte

    // method line 24
    .method public static 
           default int16 ReadShort ()  cil managed 
    {
        // Method begins at RVA 0x3128
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call int16 class [mscorlib]System.Convert::ToInt16(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadShort

    // method line 25
    .method public static 
           default int64 ReadLong ()  cil managed 
    {
        // Method begins at RVA 0x3140
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call int64 class [mscorlib]System.Convert::ToInt64(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadLong

    // method line 26
    .method public static 
           default float32 ReadSingle ()  cil managed 
    {
        // Method begins at RVA 0x3158
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadSingle

    // method line 27
    .method public static 
           default float64 ReadDouble ()  cil managed 
    {
        // Method begins at RVA 0x3170
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadDouble

    // method line 28
    .method public static 
           default char ReadChar ()  cil managed 
    {
        // Method begins at RVA 0x3188
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadChar

    // method line 29
    .method public static 
           default bool ReadBoolean ()  cil managed 
    {
        // Method begins at RVA 0x31a0
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  call string class dylan.NET.Utils.Keyboard::ReadString()
	IL_0005:  call bool class [mscorlib]System.Convert::ToBoolean(string)
	IL_000a:  ret 
    } // end of method Keyboard::ReadBoolean

    // method line 30
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x31b8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Keyboard::.ctor

  } // end of class dylan.NET.Utils.Keyboard
}

.namespace dylan.NET.Utils
{
  .class public auto ansi beforefieldinit StreamUtils
  	extends [mscorlib]System.Object
  {
    .field  public static  class [mscorlib]System.IO.Stream Stdin
    .field  public static  class [mscorlib]System.IO.Stream Stdout
    .field  public static  class [mscorlib]System.IO.Stream Stderr
    .field  public static  class [mscorlib]System.IO.StreamReader InS
    .field  public static  class [mscorlib]System.IO.StreamWriter OutS
    .field  public static  bool UseConsole

    // method line 31
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x31cc
	// Code size 53 (0x35)
	.maxstack 1
	IL_0000:  call class [mscorlib]System.IO.Stream class [mscorlib]System.Console::OpenStandardInput()
	IL_0005:  stsfld class [mscorlib]System.IO.Stream dylan.NET.Utils.StreamUtils::Stdin
	IL_000a:  call class [mscorlib]System.IO.Stream class [mscorlib]System.Console::OpenStandardError()
	IL_000f:  stsfld class [mscorlib]System.IO.Stream dylan.NET.Utils.StreamUtils::Stderr
	IL_0014:  call class [mscorlib]System.IO.Stream class [mscorlib]System.Console::OpenStandardOutput()
	IL_0019:  stsfld class [mscorlib]System.IO.Stream dylan.NET.Utils.StreamUtils::Stdout
	IL_001e:  ldnull 
	IL_001f:  stsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0024:  ldnull 
	IL_0025:  stsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_002a:  ldc.i4 1
	IL_002f:  stsfld bool dylan.NET.Utils.StreamUtils::UseConsole
	IL_0034:  ret 
    } // end of method StreamUtils::.cctor

    // method line 32
    .method public static 
           default void InitInS (class [mscorlib]System.IO.Stream s)  cil managed 
    {
        // Method begins at RVA 0x3210
	// Code size 53 (0x35)
	.maxstack 5
	IL_0000:  ldsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0005:  ldnull 
	IL_0006:  beq IL_001f

	IL_000b:  br IL_0010

	IL_0010:  ldsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0015:  callvirt instance void class [mscorlib]System.IO.StreamReader::Close()
	IL_001a:  br IL_0024

	IL_001f:  br IL_0024

	IL_0024:  ldarg 0

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  newobj instance void class [mscorlib]System.IO.StreamReader::'.ctor'(class [mscorlib]System.IO.Stream)
	IL_002f:  stsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0034:  ret 
    } // end of method StreamUtils::InitInS

    // method line 33
    .method public static 
           default void InitOutS (class [mscorlib]System.IO.Stream s)  cil managed 
    {
        // Method begins at RVA 0x3254
	// Code size 53 (0x35)
	.maxstack 5
	IL_0000:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0005:  ldnull 
	IL_0006:  beq IL_001f

	IL_000b:  br IL_0010

	IL_0010:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0015:  callvirt instance void class [mscorlib]System.IO.StreamWriter::Close()
	IL_001a:  br IL_0024

	IL_001f:  br IL_0024

	IL_0024:  ldarg 0

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  newobj instance void class [mscorlib]System.IO.StreamWriter::'.ctor'(class [mscorlib]System.IO.Stream)
	IL_002f:  stsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0034:  ret 
    } // end of method StreamUtils::InitOutS

    // method line 34
    .method public static 
           default void InitInOutSWithStd ()  cil managed 
    {
        // Method begins at RVA 0x3298
	// Code size 21 (0x15)
	.maxstack 1
	IL_0000:  ldsfld class [mscorlib]System.IO.Stream dylan.NET.Utils.StreamUtils::Stdin
	IL_0005:  call void class dylan.NET.Utils.StreamUtils::InitInS(class [mscorlib]System.IO.Stream)
	IL_000a:  ldsfld class [mscorlib]System.IO.Stream dylan.NET.Utils.StreamUtils::Stdout
	IL_000f:  call void class dylan.NET.Utils.StreamUtils::InitOutS(class [mscorlib]System.IO.Stream)
	IL_0014:  ret 
    } // end of method StreamUtils::InitInOutSWithStd

    // method line 35
    .method public static 
           default void CloseInS ()  cil managed 
    {
        // Method begins at RVA 0x32bc
	// Code size 43 (0x2b)
	.maxstack 3
	IL_0000:  ldsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0005:  ldnull 
	IL_0006:  beq IL_0025

	IL_000b:  br IL_0010

	IL_0010:  ldsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0015:  callvirt instance void class [mscorlib]System.IO.StreamReader::Close()
	IL_001a:  ldnull 
	IL_001b:  stsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0020:  br IL_002a

	IL_0025:  br IL_002a

	IL_002a:  ret 
    } // end of method StreamUtils::CloseInS

    // method line 36
    .method public static 
           default void CloseOutS ()  cil managed 
    {
        // Method begins at RVA 0x32f4
	// Code size 43 (0x2b)
	.maxstack 3
	IL_0000:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0005:  ldnull 
	IL_0006:  beq IL_0025

	IL_000b:  br IL_0010

	IL_0010:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0015:  callvirt instance void class [mscorlib]System.IO.StreamWriter::Close()
	IL_001a:  ldnull 
	IL_001b:  stsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0020:  br IL_002a

	IL_0025:  br IL_002a

	IL_002a:  ret 
    } // end of method StreamUtils::CloseOutS

    // method line 37
    .method public static 
           default string ReadLine ()  cil managed 
    {
        // Method begins at RVA 0x332c
	// Code size 77 (0x4d)
	.maxstack 7
	IL_0000:  ldsfld bool dylan.NET.Utils.StreamUtils::UseConsole
	IL_0005:  ldc.i4 0
	IL_000a:  beq IL_0014

	IL_000f:  br IL_0042

	IL_0014:  ldsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0019:  ldnull 
	IL_001a:  beq IL_0033

	IL_001f:  br IL_0024

	IL_0024:  ldsfld class [mscorlib]System.IO.StreamReader dylan.NET.Utils.StreamUtils::InS
	IL_0029:  callvirt instance string class [mscorlib]System.IO.StreamReader::ReadLine()
	IL_002e:  br IL_003d

	IL_0033:  ldstr ""
	IL_0038:  br IL_003d

	IL_003d:  br IL_004c

	IL_0042:  call string class [mscorlib]System.Console::ReadLine()
	IL_0047:  br IL_004c

	IL_004c:  ret 
    } // end of method StreamUtils::ReadLine

    // method line 38
    .method public static 
           default void WriteLine (string str)  cil managed 
    {
        // Method begins at RVA 0x3388
	// Code size 84 (0x54)
	.maxstack 7
	IL_0000:  ldsfld bool dylan.NET.Utils.StreamUtils::UseConsole
	IL_0005:  ldc.i4 0
	IL_000a:  beq IL_0014

	IL_000f:  br IL_0043

	IL_0014:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0019:  ldnull 
	IL_001a:  beq IL_0039

	IL_001f:  br IL_0024

	IL_0024:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0029:  ldarg 0

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  callvirt instance void class [mscorlib]System.IO.TextWriter::WriteLine(string)
	IL_0034:  br IL_003e

	IL_0039:  br IL_003e

	IL_003e:  br IL_0053

	IL_0043:  ldarg 0

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_004e:  br IL_0053

	IL_0053:  ret 
    } // end of method StreamUtils::WriteLine

    // method line 39
    .method public static 
           default void Write (string str)  cil managed 
    {
        // Method begins at RVA 0x33e8
	// Code size 84 (0x54)
	.maxstack 7
	IL_0000:  ldsfld bool dylan.NET.Utils.StreamUtils::UseConsole
	IL_0005:  ldc.i4 0
	IL_000a:  beq IL_0014

	IL_000f:  br IL_0043

	IL_0014:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0019:  ldnull 
	IL_001a:  beq IL_0039

	IL_001f:  br IL_0024

	IL_0024:  ldsfld class [mscorlib]System.IO.StreamWriter dylan.NET.Utils.StreamUtils::OutS
	IL_0029:  ldarg 0

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  callvirt instance void class [mscorlib]System.IO.StreamWriter::Write(string)
	IL_0034:  br IL_003e

	IL_0039:  br IL_003e

	IL_003e:  br IL_0053

	IL_0043:  ldarg 0

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  call void class [mscorlib]System.Console::Write(string)
	IL_004e:  br IL_0053

	IL_0053:  ret 
    } // end of method StreamUtils::Write

    // method line 40
    .method public static 
           default void WriteWarn (int32 line, string file, string msg)  cil managed 
    {
        // Method begins at RVA 0x3448
	// Code size 78 (0x4e)
	.maxstack 4
	.locals init (
		string	V_0)
	IL_0000:  ldstr "WARNING: "
	IL_0005:  ldarg 2

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldstr " at line "
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  call string class [mscorlib]System.Convert::ToString(int32)
	IL_001b:  call string string::Concat(string, string, string, string)
	IL_0020:  stloc 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldloc 0

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldstr " in file: "
	IL_0031:  ldarg 1

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  call string string::Concat(string, string, string)
	IL_003c:  stloc 0

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 0

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  call void class dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_004d:  ret 
    } // end of method StreamUtils::WriteWarn

    // method line 41
    .method public static 
           default void WriteError (int32 line, string file, string msg)  cil managed 
    {
        // Method begins at RVA 0x34a4
	// Code size 98 (0x62)
	.maxstack 4
	.locals init (
		string	V_0)
	IL_0000:  ldstr "ERROR: "
	IL_0005:  ldarg 2

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldstr " at line "
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  call string class [mscorlib]System.Convert::ToString(int32)
	IL_001b:  call string string::Concat(string, string, string, string)
	IL_0020:  stloc 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldloc 0

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldstr " in file: "
	IL_0031:  ldarg 1

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  call string string::Concat(string, string, string)
	IL_003c:  stloc 0

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 0

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  call void class dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_004d:  call void class dylan.NET.Utils.StreamUtils::CloseInS()
	IL_0052:  call void class dylan.NET.Utils.StreamUtils::CloseOutS()
	IL_0057:  ldc.i4 1
	IL_005c:  call void class [mscorlib]System.Environment::Exit(int32)
	IL_0061:  ret 
    } // end of method StreamUtils::WriteError

  } // end of class dylan.NET.Utils.StreamUtils
}

