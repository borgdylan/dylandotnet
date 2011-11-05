.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern dnr
{
  .ver 11:2:7:7
}
.assembly extern dnu
{
  .ver 11:2:7:7
}
.assembly extern tokenizer.CodeGen
{
  .ver 11:2:7:7
}
.assembly extern tokenizer.Parser
{
  .ver 11:2:7:7
}
.assembly extern tokenizer.Lexer
{
  .ver 11:2:7:7
}
.assembly extern tokenizer.AST
{
  .ver 11:2:7:7
}
.assembly 'dnc'
{
  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 37 2E 37 00 00 ) // ...11.2.7.7..

  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (01 00 03 64 6E 63 00 00 ) // ...dnc..

  .hash algorithm 0x00008004
  .ver  11:2:7:7
}

.module dnc.exe // GUID = {8816E5F5-05E2-4161-B042-1334B1E1516D}


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
	// Code size 1186 (0x4a2)
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
	IL_0000:  ldstr "dylan.NET Compiler v. 11.2.7.6 Beta for Microsoft (R) .NET Framework (R) v. 3.5 SP1 / 4.0"
	IL_0005:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_000a:  ldstr "                           and Xamarin Mono v. 2.6.7/v. 2.10.x"
	IL_000f:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0014:  ldstr "This compiler is FREE and OPEN SOURCE software under the GNU LGPLv3 license."
	IL_0019:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_001e:  ldstr "Copyright (C) 2011 Dylan Borg"
	IL_0023:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0028:  ldarg 0

	IL_002c:  nop 
	IL_002d:  nop 
	IL_002e:  ldlen 
	IL_002f:  conv.i4 
	IL_0030:  ldc.i4 1
	IL_0035:  blt IL_003f

	IL_003a:  br IL_004e

	IL_003f:  ldstr "Usage: dylandotnet [options] <file-name>"
	IL_0044:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0049:  br IL_04a1

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

	IL_00e9:  br IL_034a

	IL_00ee:  call void class [mscorlib]System.Console::WriteLine()
	IL_00f3:  ldstr "dylan.NET Version Info:"
	IL_00f8:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_00fd:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetExecutingAssembly()
	IL_0102:  stloc 7

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  ldloc 7

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0113:  stloc 5

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 5

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0124:  ldtoken [dnr]dylan.NET.Reflection.Loader
	IL_0129:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_012e:  stloc 6

	IL_0132:  nop 
	IL_0133:  nop 
	IL_0134:  ldloc 6

	IL_0138:  nop 
	IL_0139:  nop 
	IL_013a:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_013f:  stloc 7

	IL_0143:  nop 
	IL_0144:  nop 
	IL_0145:  ldloc 7

	IL_0149:  nop 
	IL_014a:  nop 
	IL_014b:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0150:  stloc 5

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldloc 5

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0161:  ldtoken [dnu]dylan.NET.Utils.XmlUtils
	IL_0166:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_016b:  stloc 6

	IL_016f:  nop 
	IL_0170:  nop 
	IL_0171:  ldloc 6

	IL_0175:  nop 
	IL_0176:  nop 
	IL_0177:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_017c:  stloc 7

	IL_0180:  nop 
	IL_0181:  nop 
	IL_0182:  ldloc 7

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_018d:  stloc 5

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldloc 5

	IL_0197:  nop 
	IL_0198:  nop 
	IL_0199:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_019e:  ldtoken [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator
	IL_01a3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01a8:  stloc 6

	IL_01ac:  nop 
	IL_01ad:  nop 
	IL_01ae:  ldloc 6

	IL_01b2:  nop 
	IL_01b3:  nop 
	IL_01b4:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_01b9:  stloc 7

	IL_01bd:  nop 
	IL_01be:  nop 
	IL_01bf:  ldloc 7

	IL_01c3:  nop 
	IL_01c4:  nop 
	IL_01c5:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_01ca:  stloc 5

	IL_01ce:  nop 
	IL_01cf:  nop 
	IL_01d0:  ldloc 5

	IL_01d4:  nop 
	IL_01d5:  nop 
	IL_01d6:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_01db:  ldtoken [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser
	IL_01e0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01e5:  stloc 6

	IL_01e9:  nop 
	IL_01ea:  nop 
	IL_01eb:  ldloc 6

	IL_01ef:  nop 
	IL_01f0:  nop 
	IL_01f1:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_01f6:  stloc 7

	IL_01fa:  nop 
	IL_01fb:  nop 
	IL_01fc:  ldloc 7

	IL_0200:  nop 
	IL_0201:  nop 
	IL_0202:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0207:  stloc 5

	IL_020b:  nop 
	IL_020c:  nop 
	IL_020d:  ldloc 5

	IL_0211:  nop 
	IL_0212:  nop 
	IL_0213:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0218:  ldtoken [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer
	IL_021d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0222:  stloc 6

	IL_0226:  nop 
	IL_0227:  nop 
	IL_0228:  ldloc 6

	IL_022c:  nop 
	IL_022d:  nop 
	IL_022e:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_0233:  stloc 7

	IL_0237:  nop 
	IL_0238:  nop 
	IL_0239:  ldloc 7

	IL_023d:  nop 
	IL_023e:  nop 
	IL_023f:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0244:  stloc 5

	IL_0248:  nop 
	IL_0249:  nop 
	IL_024a:  ldloc 5

	IL_024e:  nop 
	IL_024f:  nop 
	IL_0250:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0255:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet
	IL_025a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_025f:  stloc 6

	IL_0263:  nop 
	IL_0264:  nop 
	IL_0265:  ldloc 6

	IL_0269:  nop 
	IL_026a:  nop 
	IL_026b:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_0270:  stloc 7

	IL_0274:  nop 
	IL_0275:  nop 
	IL_0276:  ldloc 7

	IL_027a:  nop 
	IL_027b:  nop 
	IL_027c:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_0281:  stloc 5

	IL_0285:  nop 
	IL_0286:  nop 
	IL_0287:  ldloc 5

	IL_028b:  nop 
	IL_028c:  nop 
	IL_028d:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0292:  call void class [mscorlib]System.Console::WriteLine()
	IL_0297:  ldstr "Runtime & OS Version Info:"
	IL_029c:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_02a1:  ldtoken [mscorlib]System.String
	IL_02a6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02ab:  stloc 6

	IL_02af:  nop 
	IL_02b0:  nop 
	IL_02b1:  ldloc 6

	IL_02b5:  nop 
	IL_02b6:  nop 
	IL_02b7:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::GetAssembly(class [mscorlib]System.Type)
	IL_02bc:  stloc 7

	IL_02c0:  nop 
	IL_02c1:  nop 
	IL_02c2:  ldloc 7

	IL_02c6:  nop 
	IL_02c7:  nop 
	IL_02c8:  callvirt instance string class [mscorlib]System.Reflection.Assembly::ToString()
	IL_02cd:  stloc 5

	IL_02d1:  nop 
	IL_02d2:  nop 
	IL_02d3:  ldloc 5

	IL_02d7:  nop 
	IL_02d8:  nop 
	IL_02d9:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_02de:  call class [mscorlib]System.Version class [mscorlib]System.Environment::get_Version()
	IL_02e3:  stloc 8

	IL_02e7:  nop 
	IL_02e8:  nop 
	IL_02e9:  ldloc 8

	IL_02ed:  nop 
	IL_02ee:  nop 
	IL_02ef:  callvirt instance string class [mscorlib]System.Version::ToString()
	IL_02f4:  stloc 9

	IL_02f8:  nop 
	IL_02f9:  nop 
	IL_02fa:  ldstr "Runtime Version: "
	IL_02ff:  call void class [mscorlib]System.Console::Write(string)
	IL_0304:  ldloc 9

	IL_0308:  nop 
	IL_0309:  nop 
	IL_030a:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_030f:  call class [mscorlib]System.OperatingSystem class [mscorlib]System.Environment::get_OSVersion()
	IL_0314:  stloc 10

	IL_0318:  nop 
	IL_0319:  nop 
	IL_031a:  ldloc 10

	IL_031e:  nop 
	IL_031f:  nop 
	IL_0320:  callvirt instance string class [mscorlib]System.OperatingSystem::ToString()
	IL_0325:  stloc 11

	IL_0329:  nop 
	IL_032a:  nop 
	IL_032b:  ldstr "OS: "
	IL_0330:  call void class [mscorlib]System.Console::Write(string)
	IL_0335:  ldloc 11

	IL_0339:  nop 
	IL_033a:  nop 
	IL_033b:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0340:  br IL_04a1

	IL_0345:  br IL_034f

	IL_034a:  br IL_034f

	IL_034f:  ldloc 4

	IL_0353:  nop 
	IL_0354:  nop 
	IL_0355:  ldstr "-h"
	IL_035a:  call int32 string::Compare(string, string)
	IL_035f:  stloc 3

	IL_0363:  nop 
	IL_0364:  nop 
	IL_0365:  ldloc 3

	IL_0369:  nop 
	IL_036a:  nop 
	IL_036b:  ldc.i4 0
	IL_0370:  beq IL_037a

	IL_0375:  br IL_03b1

	IL_037a:  call void class [mscorlib]System.Console::WriteLine()
	IL_037f:  ldstr "Usage: dylandotnet [options] <file-name>"
	IL_0384:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0389:  ldstr "Options:"
	IL_038e:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0393:  ldstr "   -V : View Version Nrs. for all dylan.NET assemblies"
	IL_0398:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_039d:  ldstr "   -h : View this help message"
	IL_03a2:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_03a7:  br IL_04a1

	IL_03ac:  br IL_03b6

	IL_03b1:  br IL_03b6

	IL_03b6:  ldarg 0

	IL_03ba:  nop 
	IL_03bb:  nop 
	IL_03bc:  ldloc 2

	IL_03c0:  nop 
	IL_03c1:  nop 
	IL_03c2:  conv.u 
	IL_03c3:  ldelem [mscorlib]System.String
	IL_03c8:  stloc 0

	IL_03cc:  nop 
	IL_03cd:  nop 
	IL_03ce:  ldloc 2

	IL_03d2:  nop 
	IL_03d3:  nop 
	IL_03d4:  ldloc 1

	IL_03d8:  nop 
	IL_03d9:  nop 
	IL_03da:  bge IL_03e4

	IL_03df:  br IL_03ee

	IL_03e4:  br IL_03f8

	IL_03e9:  br IL_03f8

	IL_03ee:  br IL_0099

	IL_03f3:  br IL_03f8

	IL_03f8:  newobj instance void class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::'.ctor'()
	IL_03fd:  stloc 12

	IL_0401:  nop 
	IL_0402:  nop 
	IL_0403:  ldstr "Now Lexing: "
	IL_0408:  call void class [mscorlib]System.Console::Write(string)
	IL_040d:  ldloc 0

	IL_0411:  nop 
	IL_0412:  nop 
	IL_0413:  call void class [mscorlib]System.Console::Write(string)
	IL_0418:  ldloc 12

	IL_041c:  nop 
	IL_041d:  nop 
	IL_041e:  ldloc 0

	IL_0422:  nop 
	IL_0423:  nop 
	IL_0424:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::Analyze(string)
	IL_0429:  stloc 13

	IL_042d:  nop 
	IL_042e:  nop 
	IL_042f:  ldstr "...Done."
	IL_0434:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0439:  newobj instance void class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::'.ctor'()
	IL_043e:  stloc 14

	IL_0442:  nop 
	IL_0443:  nop 
	IL_0444:  ldstr "Now Parsing: "
	IL_0449:  call void class [mscorlib]System.Console::Write(string)
	IL_044e:  ldloc 0

	IL_0452:  nop 
	IL_0453:  nop 
	IL_0454:  call void class [mscorlib]System.Console::Write(string)
	IL_0459:  ldloc 14

	IL_045d:  nop 
	IL_045e:  nop 
	IL_045f:  ldloc 13

	IL_0463:  nop 
	IL_0464:  nop 
	IL_0465:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::Parse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet)
	IL_046a:  stloc 15

	IL_046e:  nop 
	IL_046f:  nop 
	IL_0470:  ldstr "...Done."
	IL_0475:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_047a:  newobj instance void class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator::'.ctor'()
	IL_047f:  stloc 16

	IL_0483:  nop 
	IL_0484:  nop 
	IL_0485:  ldloc 16

	IL_0489:  nop 
	IL_048a:  nop 
	IL_048b:  ldloc 15

	IL_048f:  nop 
	IL_0490:  nop 
	IL_0491:  ldloc 0

	IL_0495:  nop 
	IL_0496:  nop 
	IL_0497:  callvirt instance void class [tokenizer.CodeGen]dylan.NET.Tokenizer.CodeGen.CodeGenerator::EmitMSIL(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet, string)
	IL_049c:  br IL_04a1

	IL_04a1:  ret 
    } // end of method Module1::main

    // method line 2
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2500
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Module1::.ctor

  } // end of class dylan.NET.Compiler.Module1
}

