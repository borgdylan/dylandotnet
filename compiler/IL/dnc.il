.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern dnu
{
  .ver 11:2:8:5
}
.assembly extern dnr
{
  .ver 11:2:8:5
}
.assembly extern tokenizer.CodeGen
{
  .ver 11:2:8:5
}
.assembly extern tokenizer.Parser
{
  .ver 11:2:8:5
}
.assembly extern tokenizer.Lexer
{
  .ver 11:2:8:5
}
.assembly extern tokenizer.AST
{
  .ver 11:2:8:5
}
.assembly 'dnc'
{
  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 35 00 00 ) // ...11.2.8.5..

  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .hash algorithm 0x00008004
  .ver  11:2:8:5
}

.module dnc.exe // GUID = {BF2494F7-8615-4E2F-8145-11D14FA7A918}


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
	// Code size 1201 (0x4b1)
	.maxstack 14
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
		class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator	V_16)
	IL_0000:  ldstr "dylan.NET Compiler v. 11.2.8.5 Beta for Microsoft (R) .NET Framework (R) v. 3.5 SP1 / 4.0"
	IL_0005:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_000a:  ldstr "                           and Xamarin Mono v. 2.6.7/v. 2.10.x"
	IL_000f:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0014:  ldstr "This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license."
	IL_0019:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_001e:  ldstr "Copyright (C) 2012 Dylan Borg"
	IL_0023:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0028:  ldarg 0

	IL_002c:  nop 
	IL_002d:  nop 
	IL_002e:  ldlen 
	IL_002f:  conv.i4 
	IL_0030:  ldc.i4 1
	IL_0035:  blt IL_003f

	IL_003a:  br IL_004e

	IL_003f:  ldstr "Usage: dylandotnet [options] <file-name>"
	IL_0044:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0049:  br IL_04b0

	IL_004e:  ldstr ""
	IL_0053:  stloc 0

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  ldarg 0

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldlen 
	IL_0060:  conv.i4 
	IL_0061:  ldc.i4 1
	IL_0066:  sub 
	IL_0067:  stloc 1

	IL_006b:  nop 
	IL_006c:  nop 
	IL_006d:  ldc.i4 -1
	IL_0072:  stloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldc.i4 0
	IL_007d:  stloc 3

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldstr ""
	IL_0088:  stloc 4

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldstr ""
	IL_0093:  stloc 5

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldloc 2

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldc.i4 1
	IL_00a4:  add 
	IL_00a5:  stloc 2

	IL_00a9:  nop 
	IL_00aa:  nop 
	IL_00ab:  ldarg 0

	IL_00af:  nop 
	IL_00b0:  nop 
	IL_00b1:  ldloc 2

	IL_00b5:  nop 
	IL_00b6:  nop 
	IL_00b7:  conv.u 
	IL_00b8:  ldelem [mscorlib]System.String
	IL_00bd:  stloc 4

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldloc 4

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldstr "-V"
	IL_00ce:  call int32 string::Compare(string, string)
	IL_00d3:  stloc 3

	IL_00d7:  nop 
	IL_00d8:  nop 
	IL_00d9:  ldloc 3

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldc.i4 0
	IL_00e4:  beq IL_00ee

	IL_00e9:  br IL_0354

	IL_00ee:  ldstr ""
	IL_00f3:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_00f8:  ldstr "dylan.NET Version Info:"
	IL_00fd:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0102:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetExecutingAssembly()
	IL_0107:  stloc 7

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldloc 7

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0118:  stloc 5

	IL_011c:  nop 
	IL_011d:  nop 
	IL_011e:  ldloc 5

	IL_0122:  nop 
	IL_0123:  nop 
	IL_0124:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0129:  ldtoken [dnr]dylan.NET.Reflection.Loader
	IL_012e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0133:  stloc 6

	IL_0137:  nop 
	IL_0138:  nop 
	IL_0139:  ldloc 6

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_0144:  stloc 7

	IL_0148:  nop 
	IL_0149:  nop 
	IL_014a:  ldloc 7

	IL_014e:  nop 
	IL_014f:  nop 
	IL_0150:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0155:  stloc 5

	IL_0159:  nop 
	IL_015a:  nop 
	IL_015b:  ldloc 5

	IL_015f:  nop 
	IL_0160:  nop 
	IL_0161:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0166:  ldtoken [dnu]dylan.NET.Utils.XmlUtils
	IL_016b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0170:  stloc 6

	IL_0174:  nop 
	IL_0175:  nop 
	IL_0176:  ldloc 6

	IL_017a:  nop 
	IL_017b:  nop 
	IL_017c:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_0181:  stloc 7

	IL_0185:  nop 
	IL_0186:  nop 
	IL_0187:  ldloc 7

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0192:  stloc 5

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldloc 5

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_01a3:  ldtoken [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator
	IL_01a8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01ad:  stloc 6

	IL_01b1:  nop 
	IL_01b2:  nop 
	IL_01b3:  ldloc 6

	IL_01b7:  nop 
	IL_01b8:  nop 
	IL_01b9:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_01be:  stloc 7

	IL_01c2:  nop 
	IL_01c3:  nop 
	IL_01c4:  ldloc 7

	IL_01c8:  nop 
	IL_01c9:  nop 
	IL_01ca:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_01cf:  stloc 5

	IL_01d3:  nop 
	IL_01d4:  nop 
	IL_01d5:  ldloc 5

	IL_01d9:  nop 
	IL_01da:  nop 
	IL_01db:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_01e0:  ldtoken [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser
	IL_01e5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01ea:  stloc 6

	IL_01ee:  nop 
	IL_01ef:  nop 
	IL_01f0:  ldloc 6

	IL_01f4:  nop 
	IL_01f5:  nop 
	IL_01f6:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_01fb:  stloc 7

	IL_01ff:  nop 
	IL_0200:  nop 
	IL_0201:  ldloc 7

	IL_0205:  nop 
	IL_0206:  nop 
	IL_0207:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_020c:  stloc 5

	IL_0210:  nop 
	IL_0211:  nop 
	IL_0212:  ldloc 5

	IL_0216:  nop 
	IL_0217:  nop 
	IL_0218:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_021d:  ldtoken [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer
	IL_0222:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0227:  stloc 6

	IL_022b:  nop 
	IL_022c:  nop 
	IL_022d:  ldloc 6

	IL_0231:  nop 
	IL_0232:  nop 
	IL_0233:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_0238:  stloc 7

	IL_023c:  nop 
	IL_023d:  nop 
	IL_023e:  ldloc 7

	IL_0242:  nop 
	IL_0243:  nop 
	IL_0244:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0249:  stloc 5

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  ldloc 5

	IL_0253:  nop 
	IL_0254:  nop 
	IL_0255:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_025a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet
	IL_025f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0264:  stloc 6

	IL_0268:  nop 
	IL_0269:  nop 
	IL_026a:  ldloc 6

	IL_026e:  nop 
	IL_026f:  nop 
	IL_0270:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_0275:  stloc 7

	IL_0279:  nop 
	IL_027a:  nop 
	IL_027b:  ldloc 7

	IL_027f:  nop 
	IL_0280:  nop 
	IL_0281:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0286:  stloc 5

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  ldloc 5

	IL_0290:  nop 
	IL_0291:  nop 
	IL_0292:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0297:  ldstr ""
	IL_029c:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_02a1:  ldstr "Runtime & OS Version Info:"
	IL_02a6:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_02ab:  ldtoken [mscorlib]System.String
	IL_02b0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02b5:  stloc 6

	IL_02b9:  nop 
	IL_02ba:  nop 
	IL_02bb:  ldloc 6

	IL_02bf:  nop 
	IL_02c0:  nop 
	IL_02c1:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_02c6:  stloc 7

	IL_02ca:  nop 
	IL_02cb:  nop 
	IL_02cc:  ldloc 7

	IL_02d0:  nop 
	IL_02d1:  nop 
	IL_02d2:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_02d7:  stloc 5

	IL_02db:  nop 
	IL_02dc:  nop 
	IL_02dd:  ldloc 5

	IL_02e1:  nop 
	IL_02e2:  nop 
	IL_02e3:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_02e8:  call class [mscorlib]System.Version class [mscorlib]System.Environment::get_Version()
	IL_02ed:  stloc 8

	IL_02f1:  nop 
	IL_02f2:  nop 
	IL_02f3:  ldloc 8

	IL_02f7:  nop 
	IL_02f8:  nop 
	IL_02f9:  callvirt instance string class [mscorlib]System.Version::ToString()
	IL_02fe:  stloc 9

	IL_0302:  nop 
	IL_0303:  nop 
	IL_0304:  ldstr "Runtime Version: "
	IL_0309:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_030e:  ldloc 9

	IL_0312:  nop 
	IL_0313:  nop 
	IL_0314:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0319:  call class [mscorlib]System.OperatingSystem class [mscorlib]System.Environment::get_OSVersion()
	IL_031e:  stloc 10

	IL_0322:  nop 
	IL_0323:  nop 
	IL_0324:  ldloc 10

	IL_0328:  nop 
	IL_0329:  nop 
	IL_032a:  callvirt instance string class [mscorlib]System.OperatingSystem::ToString()
	IL_032f:  stloc 11

	IL_0333:  nop 
	IL_0334:  nop 
	IL_0335:  ldstr "OS: "
	IL_033a:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_033f:  ldloc 11

	IL_0343:  nop 
	IL_0344:  nop 
	IL_0345:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_034a:  br IL_04b0

	IL_034f:  br IL_0359

	IL_0354:  br IL_0359

	IL_0359:  ldloc 4

	IL_035d:  nop 
	IL_035e:  nop 
	IL_035f:  ldstr "-h"
	IL_0364:  call int32 string::Compare(string, string)
	IL_0369:  stloc 3

	IL_036d:  nop 
	IL_036e:  nop 
	IL_036f:  ldloc 3

	IL_0373:  nop 
	IL_0374:  nop 
	IL_0375:  ldc.i4 0
	IL_037a:  beq IL_0384

	IL_037f:  br IL_03c0

	IL_0384:  ldstr ""
	IL_0389:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_038e:  ldstr "Usage: dylandotnet [options] <file-name>"
	IL_0393:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0398:  ldstr "Options:"
	IL_039d:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_03a2:  ldstr "   -V : View Version Nrs. for all dylan.NET assemblies"
	IL_03a7:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_03ac:  ldstr "   -h : View this help message"
	IL_03b1:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_03b6:  br IL_04b0

	IL_03bb:  br IL_03c5

	IL_03c0:  br IL_03c5

	IL_03c5:  ldarg 0

	IL_03c9:  nop 
	IL_03ca:  nop 
	IL_03cb:  ldloc 2

	IL_03cf:  nop 
	IL_03d0:  nop 
	IL_03d1:  conv.u 
	IL_03d2:  ldelem [mscorlib]System.String
	IL_03d7:  stloc 0

	IL_03db:  nop 
	IL_03dc:  nop 
	IL_03dd:  ldloc 2

	IL_03e1:  nop 
	IL_03e2:  nop 
	IL_03e3:  ldloc 1

	IL_03e7:  nop 
	IL_03e8:  nop 
	IL_03e9:  bge IL_03f3

	IL_03ee:  br IL_03fd

	IL_03f3:  br IL_0407

	IL_03f8:  br IL_0407

	IL_03fd:  br IL_0099

	IL_0402:  br IL_0407

	IL_0407:  newobj instance void class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::'.ctor'()
	IL_040c:  stloc 12

	IL_0410:  nop 
	IL_0411:  nop 
	IL_0412:  ldstr "Now Lexing: "
	IL_0417:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_041c:  ldloc 0

	IL_0420:  nop 
	IL_0421:  nop 
	IL_0422:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0427:  ldloc 12

	IL_042b:  nop 
	IL_042c:  nop 
	IL_042d:  ldloc 0

	IL_0431:  nop 
	IL_0432:  nop 
	IL_0433:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::Analyze(string)
	IL_0438:  stloc 13

	IL_043c:  nop 
	IL_043d:  nop 
	IL_043e:  ldstr "...Done."
	IL_0443:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0448:  newobj instance void class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::'.ctor'()
	IL_044d:  stloc 14

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  ldstr "Now Parsing: "
	IL_0458:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_045d:  ldloc 0

	IL_0461:  nop 
	IL_0462:  nop 
	IL_0463:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0468:  ldloc 14

	IL_046c:  nop 
	IL_046d:  nop 
	IL_046e:  ldloc 13

	IL_0472:  nop 
	IL_0473:  nop 
	IL_0474:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::Parse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet)
	IL_0479:  stloc 15

	IL_047d:  nop 
	IL_047e:  nop 
	IL_047f:  ldstr "...Done."
	IL_0484:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0489:  newobj instance void class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator::'.ctor'()
	IL_048e:  stloc 16

	IL_0492:  nop 
	IL_0493:  nop 
	IL_0494:  ldloc 16

	IL_0498:  nop 
	IL_0499:  nop 
	IL_049a:  ldloc 15

	IL_049e:  nop 
	IL_049f:  nop 
	IL_04a0:  ldloc 0

	IL_04a4:  nop 
	IL_04a5:  nop 
	IL_04a6:  callvirt instance void class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator::EmitMSIL(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet, string)
	IL_04ab:  br IL_04b0

	IL_04b0:  ret 
    } // end of method Module1::main

    // method line 2
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2510
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Module1::.ctor

  } // end of class dylan.NET.Compiler.Module1
}

