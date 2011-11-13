.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern dnu
{
  .ver 11:2:7:8
}
.assembly extern dnr
{
  .ver 11:2:7:8
}
.assembly extern tokenizer.CodeGen
{
  .ver 11:2:7:8
}
.assembly extern tokenizer.Parser
{
  .ver 11:2:7:8
}
.assembly extern tokenizer.Lexer
{
  .ver 11:2:7:8
}
.assembly extern tokenizer.AST
{
  .ver 11:2:7:8
}
.assembly 'dnc'
{
  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 37 2E 38 00 00 ) // ...11.2.7.8..

  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .hash algorithm 0x00008004
  .ver  11:2:7:8
}

.module dnc.exe // GUID = {CFD1D09B-52A1-49B1-9382-CFF360BB021D}


.namespace dylan.NET.Compiler
{
  .class public auto ansi Module1
  	extends [mscorlib]System.Object
  {

    // method line 1
    .method public static 
           default void main (string[] args)  cil managed 
    {
        .custom instance void class [mscorlib]System.STAThreadAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2050
	.entrypoint
	// Code size 1260 (0x4ec)
	.maxstack 16
	.locals init (
		string	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string	V_4,
		string	V_5,
		class [mscorlib]System.Type	V_6,
		class [mscorlib]System.Reflection.Assembly	V_7,
		class [mscorlib]System.Version	V_8,
		string	V_9,
		class [mscorlib]System.OperatingSystem	V_10,
		string	V_11,
		class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet	V_13,
		class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet	V_15,
		class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator	V_16,
		class [mscorlib]System.Exception	V_17,
		string	V_18)
	IL_0000:  ldsfld class [mscorlib]System.IO.Stream [dnu]dylan.NET.Utils.StreamUtils::Stdout
	IL_0005:  call void class [dnu]dylan.NET.Utils.StreamUtils::InitOutS(class [mscorlib]System.IO.Stream)
	IL_000a:  ldstr "dylan.NET Compiler v. 11.2.7.8 Beta for Microsoft (R) .NET Framework (R) v. 3.5 SP1 / 4.0"
	IL_000f:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0014:  ldstr "                           and Xamarin Mono v. 2.6.7/v. 2.10.x"
	IL_0019:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_001e:  ldstr "This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license."
	IL_0023:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0028:  ldstr "Copyright (C) 2011 Dylan Borg"
	IL_002d:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0032:  ldarg 0

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldlen 
	IL_0039:  conv.i4 
	IL_003a:  ldc.i4 1
	IL_003f:  blt IL_0049

	IL_0044:  br IL_0058

	IL_0049:  ldstr "Usage: dylandotnet [options] <file-name>"
	IL_004e:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0053:  br IL_04e6

	.try { // 0
	  IL_0058:  ldstr ""
	  IL_005d:  stloc 0

	  IL_0061:  nop 
	  IL_0062:  nop 
	  IL_0063:  ldarg 0

	  IL_0067:  nop 
	  IL_0068:  nop 
	  IL_0069:  ldlen 
	  IL_006a:  conv.i4 
	  IL_006b:  ldc.i4 1
	  IL_0070:  sub 
	  IL_0071:  stloc 1

	  IL_0075:  nop 
	  IL_0076:  nop 
	  IL_0077:  ldc.i4 -1
	  IL_007c:  stloc 2

	  IL_0080:  nop 
	  IL_0081:  nop 
	  IL_0082:  ldc.i4 0
	  IL_0087:  stloc 3

	  IL_008b:  nop 
	  IL_008c:  nop 
	  IL_008d:  ldstr ""
	  IL_0092:  stloc 4

	  IL_0096:  nop 
	  IL_0097:  nop 
	  IL_0098:  ldstr ""
	  IL_009d:  stloc 5

	  IL_00a1:  nop 
	  IL_00a2:  nop 
	  IL_00a3:  ldloc 2

	  IL_00a7:  nop 
	  IL_00a8:  nop 
	  IL_00a9:  ldc.i4 1
	  IL_00ae:  add 
	  IL_00af:  stloc 2

	  IL_00b3:  nop 
	  IL_00b4:  nop 
	  IL_00b5:  ldarg 0

	  IL_00b9:  nop 
	  IL_00ba:  nop 
	  IL_00bb:  ldloc 2

	  IL_00bf:  nop 
	  IL_00c0:  nop 
	  IL_00c1:  conv.u 
	  IL_00c2:  ldelem [mscorlib]System.String
	  IL_00c7:  stloc 4

	  IL_00cb:  nop 
	  IL_00cc:  nop 
	  IL_00cd:  ldloc 4

	  IL_00d1:  nop 
	  IL_00d2:  nop 
	  IL_00d3:  ldstr "-V"
	  IL_00d8:  call int32 string::Compare(string, string)
	  IL_00dd:  stloc 3

	  IL_00e1:  nop 
	  IL_00e2:  nop 
	  IL_00e3:  ldloc 3

	  IL_00e7:  nop 
	  IL_00e8:  nop 
	  IL_00e9:  ldc.i4 0
	  IL_00ee:  beq IL_00f8

	  IL_00f3:  br IL_035e

	  IL_00f8:  ldstr ""
	  IL_00fd:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0102:  ldstr "dylan.NET Version Info:"
	  IL_0107:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_010c:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetExecutingAssembly()
	  IL_0111:  stloc 7

	  IL_0115:  nop 
	  IL_0116:  nop 
	  IL_0117:  ldloc 7

	  IL_011b:  nop 
	  IL_011c:  nop 
	  IL_011d:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_0122:  stloc 5

	  IL_0126:  nop 
	  IL_0127:  nop 
	  IL_0128:  ldloc 5

	  IL_012c:  nop 
	  IL_012d:  nop 
	  IL_012e:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0133:  ldtoken [dnr]dylan.NET.Reflection.Loader
	  IL_0138:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	  IL_013d:  stloc 6

	  IL_0141:  nop 
	  IL_0142:  nop 
	  IL_0143:  ldloc 6

	  IL_0147:  nop 
	  IL_0148:  nop 
	  IL_0149:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	  IL_014e:  stloc 7

	  IL_0152:  nop 
	  IL_0153:  nop 
	  IL_0154:  ldloc 7

	  IL_0158:  nop 
	  IL_0159:  nop 
	  IL_015a:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_015f:  stloc 5

	  IL_0163:  nop 
	  IL_0164:  nop 
	  IL_0165:  ldloc 5

	  IL_0169:  nop 
	  IL_016a:  nop 
	  IL_016b:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0170:  ldtoken [dnu]dylan.NET.Utils.XmlUtils
	  IL_0175:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	  IL_017a:  stloc 6

	  IL_017e:  nop 
	  IL_017f:  nop 
	  IL_0180:  ldloc 6

	  IL_0184:  nop 
	  IL_0185:  nop 
	  IL_0186:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	  IL_018b:  stloc 7

	  IL_018f:  nop 
	  IL_0190:  nop 
	  IL_0191:  ldloc 7

	  IL_0195:  nop 
	  IL_0196:  nop 
	  IL_0197:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_019c:  stloc 5

	  IL_01a0:  nop 
	  IL_01a1:  nop 
	  IL_01a2:  ldloc 5

	  IL_01a6:  nop 
	  IL_01a7:  nop 
	  IL_01a8:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_01ad:  ldtoken [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator
	  IL_01b2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	  IL_01b7:  stloc 6

	  IL_01bb:  nop 
	  IL_01bc:  nop 
	  IL_01bd:  ldloc 6

	  IL_01c1:  nop 
	  IL_01c2:  nop 
	  IL_01c3:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	  IL_01c8:  stloc 7

	  IL_01cc:  nop 
	  IL_01cd:  nop 
	  IL_01ce:  ldloc 7

	  IL_01d2:  nop 
	  IL_01d3:  nop 
	  IL_01d4:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_01d9:  stloc 5

	  IL_01dd:  nop 
	  IL_01de:  nop 
	  IL_01df:  ldloc 5

	  IL_01e3:  nop 
	  IL_01e4:  nop 
	  IL_01e5:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_01ea:  ldtoken [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser
	  IL_01ef:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	  IL_01f4:  stloc 6

	  IL_01f8:  nop 
	  IL_01f9:  nop 
	  IL_01fa:  ldloc 6

	  IL_01fe:  nop 
	  IL_01ff:  nop 
	  IL_0200:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	  IL_0205:  stloc 7

	  IL_0209:  nop 
	  IL_020a:  nop 
	  IL_020b:  ldloc 7

	  IL_020f:  nop 
	  IL_0210:  nop 
	  IL_0211:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_0216:  stloc 5

	  IL_021a:  nop 
	  IL_021b:  nop 
	  IL_021c:  ldloc 5

	  IL_0220:  nop 
	  IL_0221:  nop 
	  IL_0222:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0227:  ldtoken [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer
	  IL_022c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	  IL_0231:  stloc 6

	  IL_0235:  nop 
	  IL_0236:  nop 
	  IL_0237:  ldloc 6

	  IL_023b:  nop 
	  IL_023c:  nop 
	  IL_023d:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	  IL_0242:  stloc 7

	  IL_0246:  nop 
	  IL_0247:  nop 
	  IL_0248:  ldloc 7

	  IL_024c:  nop 
	  IL_024d:  nop 
	  IL_024e:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_0253:  stloc 5

	  IL_0257:  nop 
	  IL_0258:  nop 
	  IL_0259:  ldloc 5

	  IL_025d:  nop 
	  IL_025e:  nop 
	  IL_025f:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0264:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet
	  IL_0269:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	  IL_026e:  stloc 6

	  IL_0272:  nop 
	  IL_0273:  nop 
	  IL_0274:  ldloc 6

	  IL_0278:  nop 
	  IL_0279:  nop 
	  IL_027a:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	  IL_027f:  stloc 7

	  IL_0283:  nop 
	  IL_0284:  nop 
	  IL_0285:  ldloc 7

	  IL_0289:  nop 
	  IL_028a:  nop 
	  IL_028b:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_0290:  stloc 5

	  IL_0294:  nop 
	  IL_0295:  nop 
	  IL_0296:  ldloc 5

	  IL_029a:  nop 
	  IL_029b:  nop 
	  IL_029c:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_02a1:  ldstr ""
	  IL_02a6:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_02ab:  ldstr "Runtime & OS Version Info:"
	  IL_02b0:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_02b5:  ldtoken [mscorlib]System.String
	  IL_02ba:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	  IL_02bf:  stloc 6

	  IL_02c3:  nop 
	  IL_02c4:  nop 
	  IL_02c5:  ldloc 6

	  IL_02c9:  nop 
	  IL_02ca:  nop 
	  IL_02cb:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	  IL_02d0:  stloc 7

	  IL_02d4:  nop 
	  IL_02d5:  nop 
	  IL_02d6:  ldloc 7

	  IL_02da:  nop 
	  IL_02db:  nop 
	  IL_02dc:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	  IL_02e1:  stloc 5

	  IL_02e5:  nop 
	  IL_02e6:  nop 
	  IL_02e7:  ldloc 5

	  IL_02eb:  nop 
	  IL_02ec:  nop 
	  IL_02ed:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_02f2:  call class [mscorlib]System.Version class [mscorlib]System.Environment::get_Version()
	  IL_02f7:  stloc 8

	  IL_02fb:  nop 
	  IL_02fc:  nop 
	  IL_02fd:  ldloc 8

	  IL_0301:  nop 
	  IL_0302:  nop 
	  IL_0303:  callvirt instance string class [mscorlib]System.Version::ToString()
	  IL_0308:  stloc 9

	  IL_030c:  nop 
	  IL_030d:  nop 
	  IL_030e:  ldstr "Runtime Version: "
	  IL_0313:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	  IL_0318:  ldloc 9

	  IL_031c:  nop 
	  IL_031d:  nop 
	  IL_031e:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0323:  call class [mscorlib]System.OperatingSystem class [mscorlib]System.Environment::get_OSVersion()
	  IL_0328:  stloc 10

	  IL_032c:  nop 
	  IL_032d:  nop 
	  IL_032e:  ldloc 10

	  IL_0332:  nop 
	  IL_0333:  nop 
	  IL_0334:  callvirt instance string class [mscorlib]System.OperatingSystem::ToString()
	  IL_0339:  stloc 11

	  IL_033d:  nop 
	  IL_033e:  nop 
	  IL_033f:  ldstr "OS: "
	  IL_0344:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	  IL_0349:  ldloc 11

	  IL_034d:  nop 
	  IL_034e:  nop 
	  IL_034f:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0354:  br IL_04e6

	  IL_0359:  br IL_0363

	  IL_035e:  br IL_0363

	  IL_0363:  ldloc 4

	  IL_0367:  nop 
	  IL_0368:  nop 
	  IL_0369:  ldstr "-h"
	  IL_036e:  call int32 string::Compare(string, string)
	  IL_0373:  stloc 3

	  IL_0377:  nop 
	  IL_0378:  nop 
	  IL_0379:  ldloc 3

	  IL_037d:  nop 
	  IL_037e:  nop 
	  IL_037f:  ldc.i4 0
	  IL_0384:  beq IL_038e

	  IL_0389:  br IL_03ca

	  IL_038e:  ldstr ""
	  IL_0393:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0398:  ldstr "Usage: dylandotnet [options] <file-name>"
	  IL_039d:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_03a2:  ldstr "Options:"
	  IL_03a7:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_03ac:  ldstr "   -V : View Version Nrs. for all dylan.NET assemblies"
	  IL_03b1:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_03b6:  ldstr "   -h : View this help message"
	  IL_03bb:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_03c0:  br IL_04e6

	  IL_03c5:  br IL_03cf

	  IL_03ca:  br IL_03cf

	  IL_03cf:  ldarg 0

	  IL_03d3:  nop 
	  IL_03d4:  nop 
	  IL_03d5:  ldloc 2

	  IL_03d9:  nop 
	  IL_03da:  nop 
	  IL_03db:  conv.u 
	  IL_03dc:  ldelem [mscorlib]System.String
	  IL_03e1:  stloc 0

	  IL_03e5:  nop 
	  IL_03e6:  nop 
	  IL_03e7:  ldloc 2

	  IL_03eb:  nop 
	  IL_03ec:  nop 
	  IL_03ed:  ldloc 1

	  IL_03f1:  nop 
	  IL_03f2:  nop 
	  IL_03f3:  bge IL_03fd

	  IL_03f8:  br IL_0407

	  IL_03fd:  br IL_0411

	  IL_0402:  br IL_0411

	  IL_0407:  br IL_00a3

	  IL_040c:  br IL_0411

	  IL_0411:  newobj instance void class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::'.ctor'()
	  IL_0416:  stloc 12

	  IL_041a:  nop 
	  IL_041b:  nop 
	  IL_041c:  ldstr "Now Lexing: "
	  IL_0421:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	  IL_0426:  ldloc 0

	  IL_042a:  nop 
	  IL_042b:  nop 
	  IL_042c:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	  IL_0431:  ldloc 12

	  IL_0435:  nop 
	  IL_0436:  nop 
	  IL_0437:  ldloc 0

	  IL_043b:  nop 
	  IL_043c:  nop 
	  IL_043d:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::Analyze(string)
	  IL_0442:  stloc 13

	  IL_0446:  nop 
	  IL_0447:  nop 
	  IL_0448:  ldstr "...Done."
	  IL_044d:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0452:  newobj instance void class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::'.ctor'()
	  IL_0457:  stloc 14

	  IL_045b:  nop 
	  IL_045c:  nop 
	  IL_045d:  ldstr "Now Parsing: "
	  IL_0462:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	  IL_0467:  ldloc 0

	  IL_046b:  nop 
	  IL_046c:  nop 
	  IL_046d:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	  IL_0472:  ldloc 14

	  IL_0476:  nop 
	  IL_0477:  nop 
	  IL_0478:  ldloc 13

	  IL_047c:  nop 
	  IL_047d:  nop 
	  IL_047e:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::Parse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet)
	  IL_0483:  stloc 15

	  IL_0487:  nop 
	  IL_0488:  nop 
	  IL_0489:  ldstr "...Done."
	  IL_048e:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_0493:  newobj instance void class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator::'.ctor'()
	  IL_0498:  stloc 16

	  IL_049c:  nop 
	  IL_049d:  nop 
	  IL_049e:  ldloc 16

	  IL_04a2:  nop 
	  IL_04a3:  nop 
	  IL_04a4:  ldloc 15

	  IL_04a8:  nop 
	  IL_04a9:  nop 
	  IL_04aa:  ldloc 0

	  IL_04ae:  nop 
	  IL_04af:  nop 
	  IL_04b0:  callvirt instance void class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator::EmitMSIL(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet, string)
	  IL_04b5:  leave IL_04e1

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_04ba:  stloc 17

	  IL_04be:  nop 
	  IL_04bf:  nop 
	  IL_04c0:  ldloc 17

	  IL_04c4:  nop 
	  IL_04c5:  nop 
	  IL_04c6:  callvirt instance string class [mscorlib]System.Exception::ToString()
	  IL_04cb:  stloc 18

	  IL_04cf:  nop 
	  IL_04d0:  nop 
	  IL_04d1:  ldloc 18

	  IL_04d5:  nop 
	  IL_04d6:  nop 
	  IL_04d7:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	  IL_04dc:  leave IL_04e1

	} // end handler 0
	IL_04e1:  br IL_04e6

	IL_04e6:  call void class [dnu]dylan.NET.Utils.StreamUtils::CloseOutS()
	IL_04eb:  ret 
    } // end of method Module1::main

    // method line 2
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2564
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Module1::.ctor

  } // end of class dylan.NET.Compiler.Module1
}

