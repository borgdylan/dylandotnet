.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern dnu
{
  .ver 11:2:8:7
}
.assembly extern tokenizer.AST
{
  .ver 11:2:8:7
}
.assembly 'tokenizer.Lexer'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 37 00 00 ) // ...11.2.8.7..

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (
		01 00 0F 74 6F 6B 65 6E 69 7A 65 72 2E 4C 65 78   // ...tokenizer.Lex
		65 72 00 00                                     ) // er..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (
		01 00 0F 74 6F 6B 65 6E 69 7A 65 72 2E 4C 65 78   // ...tokenizer.Lex
		65 72 00 00                                     ) // er..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (
		01 00 0F 74 6F 6B 65 6E 69 7A 65 72 2E 4C 65 78   // ...tokenizer.Lex
		65 72 00 00                                     ) // er..

  .hash algorithm 0x00008004
  .ver  11:2:8:7
}

.module tokenizer.Lexer.dll // GUID = {26275FCC-1F1D-4A2E-9740-07877689EB72}


.namespace dylan.NET.Tokenizer.Lexer
{
  .class public auto ansi Line
  	extends [mscorlib]System.Object
  {
    .field  public  string PrevChar
    .field  public  bool InStr
    .field  public  bool InChar

    // method line 1
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 40 (0x28)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld bool dylan.NET.Tokenizer.Lexer.Line::InStr
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.Lexer.Line::InChar
	IL_0027:  ret 
    } // end of method Line::.ctor

    // method line 2
    .method public 
           instance default bool isDigit (char c)  cil managed 
    {
        // Method begins at RVA 0x2084
	// Code size 152 (0x98)
	.maxstack 6
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		bool	V_3)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  call int32 class [mscorlib]System.Convert::ToInt32(char)
	IL_000b:  stloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldstr "0"
	IL_0016:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_001b:  call int32 class [mscorlib]System.Convert::ToInt32(char)
	IL_0020:  stloc 1

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldstr "9"
	IL_002b:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0030:  call int32 class [mscorlib]System.Convert::ToInt32(char)
	IL_0035:  stloc 2

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldc.i4 0
	IL_0040:  stloc 3

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  ldloc 0

	IL_004a:  nop 
	IL_004b:  nop 
	IL_004c:  ldloc 1

	IL_0050:  nop 
	IL_0051:  nop 
	IL_0052:  bge IL_005c

	IL_0057:  br IL_008c

	IL_005c:  ldloc 0

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldloc 2

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  ble IL_0072

	IL_006d:  br IL_0082

	IL_0072:  ldc.i4 1
	IL_0077:  stloc 3

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  br IL_0087

	IL_0082:  br IL_0087

	IL_0087:  br IL_0091

	IL_008c:  br IL_0091

	IL_0091:  ldloc 3

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ret 
    } // end of method Line::isDigit

    // method line 3
    .method public 
           instance default bool isSep (string cc, string lc, bool& sca, bool& scla)  cil managed 
    {
        // Method begins at RVA 0x2128
	// Code size 4427 (0x114b)
	.maxstack 197
	.locals init (
		int32	V_0,
		bool	V_1,
		bool	V_2,
		char	V_3,
		bool	V_4,
		char	V_5,
		char	V_6)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldc.i4 0
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldstr "a"
	IL_0026:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_002b:  stloc 3

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 0
	IL_0036:  stloc 4

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldarg 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldnull 
	IL_0043:  beq IL_004d

	IL_0048:  br IL_005d

	IL_004d:  ldstr " "
	IL_0052:  starg 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  br IL_0062

	IL_005d:  br IL_0062

	IL_0062:  ldarg 1

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_006d:  call int32 string::Compare(string, string)
	IL_0072:  stloc 0

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldloc 0

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldc.i4 0
	IL_0083:  beq IL_008d

	IL_0088:  br IL_00d0

	IL_008d:  ldarg.0 
	IL_008e:  ldarg.0 
	IL_008f:  ldfld bool dylan.NET.Tokenizer.Lexer.Line::InStr
	IL_0094:  ldarg.0 
	IL_0095:  ldfld bool dylan.NET.Tokenizer.Lexer.Line::InStr
	IL_009a:  and 
	IL_009b:  not 
	IL_009c:  stfld bool dylan.NET.Tokenizer.Lexer.Line::InStr
	IL_00a1:  ldarg.0 
	IL_00a2:  ldfld bool dylan.NET.Tokenizer.Lexer.Line::InStr
	IL_00a7:  ldc.i4 0
	IL_00ac:  beq IL_00b6

	IL_00b1:  br IL_00c6

	IL_00b6:  ldarg.0 
	IL_00b7:  ldc.i4 0
	IL_00bc:  stfld bool dylan.NET.Tokenizer.Lexer.Line::InChar
	IL_00c1:  br IL_00cb

	IL_00c6:  br IL_00cb

	IL_00cb:  br IL_00d5

	IL_00d0:  br IL_00d5

	IL_00d5:  ldarg 1

	IL_00d9:  nop 
	IL_00da:  nop 
	IL_00db:  ldstr "'"
	IL_00e0:  call int32 string::Compare(string, string)
	IL_00e5:  stloc 0

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldloc 0

	IL_00ef:  nop 
	IL_00f0:  nop 
	IL_00f1:  ldc.i4 0
	IL_00f6:  beq IL_0100

	IL_00fb:  br IL_0119

	IL_0100:  ldarg.0 
	IL_0101:  ldarg.0 
	IL_0102:  ldfld bool dylan.NET.Tokenizer.Lexer.Line::InChar
	IL_0107:  ldarg.0 
	IL_0108:  ldfld bool dylan.NET.Tokenizer.Lexer.Line::InChar
	IL_010d:  and 
	IL_010e:  not 
	IL_010f:  stfld bool dylan.NET.Tokenizer.Lexer.Line::InChar
	IL_0114:  br IL_011e

	IL_0119:  br IL_011e

	IL_011e:  ldarg.0 
	IL_011f:  ldfld bool dylan.NET.Tokenizer.Lexer.Line::InStr
	IL_0124:  ldarg.0 
	IL_0125:  ldfld bool dylan.NET.Tokenizer.Lexer.Line::InChar
	IL_012a:  or 
	IL_012b:  stloc 1

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  ldloc 1

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  ldc.i4 0
	IL_013c:  beq IL_0146

	IL_0141:  br IL_1118

	IL_0146:  ldarg 1

	IL_014a:  nop 
	IL_014b:  nop 
	IL_014c:  ldstr ":"
	IL_0151:  call int32 string::Compare(string, string)
	IL_0156:  stloc 0

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldloc 0

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldc.i4 0
	IL_0167:  beq IL_0171

	IL_016c:  br IL_01fa

	IL_0171:  ldarg.0 
	IL_0172:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0177:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_017c:  call int32 string::Compare(string, string)
	IL_0181:  stloc 0

	IL_0185:  nop 
	IL_0186:  nop 
	IL_0187:  ldloc 0

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  ldc.i4 0
	IL_0192:  beq IL_019c

	IL_0197:  br IL_01f0

	IL_019c:  ldloc 1

	IL_01a0:  nop 
	IL_01a1:  nop 
	IL_01a2:  ldc.i4 0
	IL_01a7:  beq IL_01b1

	IL_01ac:  br IL_01e6

	IL_01b1:  ldc.i4 1
	IL_01b6:  stloc 2

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  ldarg 4

	IL_01c0:  nop 
	IL_01c1:  nop 
	IL_01c2:  ldc.i4 0
	IL_01c7:  stobj [mscorlib]System.Boolean
	IL_01cc:  ldarg 3

	IL_01d0:  nop 
	IL_01d1:  nop 
	IL_01d2:  ldc.i4 1
	IL_01d7:  stobj [mscorlib]System.Boolean
	IL_01dc:  br IL_1138

	IL_01e1:  br IL_01eb

	IL_01e6:  br IL_01eb

	IL_01eb:  br IL_01f5

	IL_01f0:  br IL_01f5

	IL_01f5:  br IL_01ff

	IL_01fa:  br IL_01ff

	IL_01ff:  ldarg 1

	IL_0203:  nop 
	IL_0204:  nop 
	IL_0205:  ldstr "("
	IL_020a:  call int32 string::Compare(string, string)
	IL_020f:  stloc 0

	IL_0213:  nop 
	IL_0214:  nop 
	IL_0215:  ldloc 0

	IL_0219:  nop 
	IL_021a:  nop 
	IL_021b:  ldc.i4 0
	IL_0220:  beq IL_022a

	IL_0225:  br IL_024f

	IL_022a:  ldarg 3

	IL_022e:  nop 
	IL_022f:  nop 
	IL_0230:  ldc.i4 1
	IL_0235:  stobj [mscorlib]System.Boolean
	IL_023a:  ldc.i4 1
	IL_023f:  stloc 2

	IL_0243:  nop 
	IL_0244:  nop 
	IL_0245:  br IL_1138

	IL_024a:  br IL_0254

	IL_024f:  br IL_0254

	IL_0254:  ldarg 1

	IL_0258:  nop 
	IL_0259:  nop 
	IL_025a:  ldstr ")"
	IL_025f:  call int32 string::Compare(string, string)
	IL_0264:  stloc 0

	IL_0268:  nop 
	IL_0269:  nop 
	IL_026a:  ldloc 0

	IL_026e:  nop 
	IL_026f:  nop 
	IL_0270:  ldc.i4 0
	IL_0275:  beq IL_027f

	IL_027a:  br IL_02a4

	IL_027f:  ldarg 3

	IL_0283:  nop 
	IL_0284:  nop 
	IL_0285:  ldc.i4 1
	IL_028a:  stobj [mscorlib]System.Boolean
	IL_028f:  ldc.i4 1
	IL_0294:  stloc 2

	IL_0298:  nop 
	IL_0299:  nop 
	IL_029a:  br IL_1138

	IL_029f:  br IL_02a9

	IL_02a4:  br IL_02a9

	IL_02a9:  ldarg 1

	IL_02ad:  nop 
	IL_02ae:  nop 
	IL_02af:  ldstr "["
	IL_02b4:  call int32 string::Compare(string, string)
	IL_02b9:  stloc 0

	IL_02bd:  nop 
	IL_02be:  nop 
	IL_02bf:  ldloc 0

	IL_02c3:  nop 
	IL_02c4:  nop 
	IL_02c5:  ldc.i4 0
	IL_02ca:  beq IL_02d4

	IL_02cf:  br IL_035e

	IL_02d4:  ldarg 2

	IL_02d8:  nop 
	IL_02d9:  nop 
	IL_02da:  ldstr "]"
	IL_02df:  call int32 string::Compare(string, string)
	IL_02e4:  stloc 0

	IL_02e8:  nop 
	IL_02e9:  nop 
	IL_02ea:  ldloc 0

	IL_02ee:  nop 
	IL_02ef:  nop 
	IL_02f0:  ldc.i4 0
	IL_02f5:  beq IL_02ff

	IL_02fa:  br IL_0334

	IL_02ff:  ldarg 3

	IL_0303:  nop 
	IL_0304:  nop 
	IL_0305:  ldc.i4 1
	IL_030a:  stobj [mscorlib]System.Boolean
	IL_030f:  ldarg 4

	IL_0313:  nop 
	IL_0314:  nop 
	IL_0315:  ldc.i4 0
	IL_031a:  stobj [mscorlib]System.Boolean
	IL_031f:  ldc.i4 1
	IL_0324:  stloc 2

	IL_0328:  nop 
	IL_0329:  nop 
	IL_032a:  br IL_1138

	IL_032f:  br IL_0354

	IL_0334:  ldarg 3

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  ldc.i4 1
	IL_033f:  stobj [mscorlib]System.Boolean
	IL_0344:  ldc.i4 1
	IL_0349:  stloc 2

	IL_034d:  nop 
	IL_034e:  nop 
	IL_034f:  br IL_0354

	IL_0354:  br IL_1138

	IL_0359:  br IL_0363

	IL_035e:  br IL_0363

	IL_0363:  ldarg 1

	IL_0367:  nop 
	IL_0368:  nop 
	IL_0369:  ldstr "]"
	IL_036e:  call int32 string::Compare(string, string)
	IL_0373:  stloc 0

	IL_0377:  nop 
	IL_0378:  nop 
	IL_0379:  ldloc 0

	IL_037d:  nop 
	IL_037e:  nop 
	IL_037f:  ldc.i4 0
	IL_0384:  beq IL_038e

	IL_0389:  br IL_0403

	IL_038e:  ldarg.0 
	IL_038f:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0394:  ldstr "["
	IL_0399:  call int32 string::Compare(string, string)
	IL_039e:  stloc 0

	IL_03a2:  nop 
	IL_03a3:  nop 
	IL_03a4:  ldloc 0

	IL_03a8:  nop 
	IL_03a9:  nop 
	IL_03aa:  ldc.i4 0
	IL_03af:  beq IL_03b9

	IL_03b4:  br IL_03d9

	IL_03b9:  ldc.i4 0
	IL_03be:  stloc 2

	IL_03c2:  nop 
	IL_03c3:  nop 
	IL_03c4:  ldarg 3

	IL_03c8:  nop 
	IL_03c9:  nop 
	IL_03ca:  ldc.i4 1
	IL_03cf:  stobj [mscorlib]System.Boolean
	IL_03d4:  br IL_03f9

	IL_03d9:  ldarg 3

	IL_03dd:  nop 
	IL_03de:  nop 
	IL_03df:  ldc.i4 1
	IL_03e4:  stobj [mscorlib]System.Boolean
	IL_03e9:  ldc.i4 1
	IL_03ee:  stloc 2

	IL_03f2:  nop 
	IL_03f3:  nop 
	IL_03f4:  br IL_03f9

	IL_03f9:  br IL_1138

	IL_03fe:  br IL_0408

	IL_0403:  br IL_0408

	IL_0408:  ldarg 1

	IL_040c:  nop 
	IL_040d:  nop 
	IL_040e:  ldstr ","
	IL_0413:  call int32 string::Compare(string, string)
	IL_0418:  stloc 0

	IL_041c:  nop 
	IL_041d:  nop 
	IL_041e:  ldloc 0

	IL_0422:  nop 
	IL_0423:  nop 
	IL_0424:  ldc.i4 0
	IL_0429:  beq IL_0433

	IL_042e:  br IL_0458

	IL_0433:  ldarg 3

	IL_0437:  nop 
	IL_0438:  nop 
	IL_0439:  ldc.i4 1
	IL_043e:  stobj [mscorlib]System.Boolean
	IL_0443:  ldc.i4 1
	IL_0448:  stloc 2

	IL_044c:  nop 
	IL_044d:  nop 
	IL_044e:  br IL_1138

	IL_0453:  br IL_045d

	IL_0458:  br IL_045d

	IL_045d:  ldarg 1

	IL_0461:  nop 
	IL_0462:  nop 
	IL_0463:  ldstr "&"
	IL_0468:  call int32 string::Compare(string, string)
	IL_046d:  stloc 0

	IL_0471:  nop 
	IL_0472:  nop 
	IL_0473:  ldloc 0

	IL_0477:  nop 
	IL_0478:  nop 
	IL_0479:  ldc.i4 0
	IL_047e:  beq IL_0488

	IL_0483:  br IL_04ad

	IL_0488:  ldarg 3

	IL_048c:  nop 
	IL_048d:  nop 
	IL_048e:  ldc.i4 1
	IL_0493:  stobj [mscorlib]System.Boolean
	IL_0498:  ldc.i4 1
	IL_049d:  stloc 2

	IL_04a1:  nop 
	IL_04a2:  nop 
	IL_04a3:  br IL_1138

	IL_04a8:  br IL_04b2

	IL_04ad:  br IL_04b2

	IL_04b2:  ldarg 1

	IL_04b6:  nop 
	IL_04b7:  nop 
	IL_04b8:  ldstr "*"
	IL_04bd:  call int32 string::Compare(string, string)
	IL_04c2:  stloc 0

	IL_04c6:  nop 
	IL_04c7:  nop 
	IL_04c8:  ldloc 0

	IL_04cc:  nop 
	IL_04cd:  nop 
	IL_04ce:  ldc.i4 0
	IL_04d3:  beq IL_04dd

	IL_04d8:  br IL_0502

	IL_04dd:  ldarg 3

	IL_04e1:  nop 
	IL_04e2:  nop 
	IL_04e3:  ldc.i4 1
	IL_04e8:  stobj [mscorlib]System.Boolean
	IL_04ed:  ldc.i4 1
	IL_04f2:  stloc 2

	IL_04f6:  nop 
	IL_04f7:  nop 
	IL_04f8:  br IL_1138

	IL_04fd:  br IL_0507

	IL_0502:  br IL_0507

	IL_0507:  ldarg 1

	IL_050b:  nop 
	IL_050c:  nop 
	IL_050d:  ldstr "/"
	IL_0512:  call int32 string::Compare(string, string)
	IL_0517:  stloc 0

	IL_051b:  nop 
	IL_051c:  nop 
	IL_051d:  ldloc 0

	IL_0521:  nop 
	IL_0522:  nop 
	IL_0523:  ldc.i4 0
	IL_0528:  beq IL_0532

	IL_052d:  br IL_0641

	IL_0532:  ldarg 2

	IL_0536:  nop 
	IL_0537:  nop 
	IL_0538:  ldstr "/"
	IL_053d:  call int32 string::Compare(string, string)
	IL_0542:  stloc 0

	IL_0546:  nop 
	IL_0547:  nop 
	IL_0548:  ldloc 0

	IL_054c:  nop 
	IL_054d:  nop 
	IL_054e:  ldc.i4 0
	IL_0553:  beq IL_05c2

	IL_0558:  br IL_055d

	IL_055d:  ldarg 3

	IL_0561:  nop 
	IL_0562:  nop 
	IL_0563:  ldc.i4 1
	IL_0568:  stobj [mscorlib]System.Boolean
	IL_056d:  ldarg.0 
	IL_056e:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0573:  ldstr "/"
	IL_0578:  call int32 string::Compare(string, string)
	IL_057d:  stloc 0

	IL_0581:  nop 
	IL_0582:  nop 
	IL_0583:  ldloc 0

	IL_0587:  nop 
	IL_0588:  nop 
	IL_0589:  ldc.i4 0
	IL_058e:  beq IL_0598

	IL_0593:  br IL_05a8

	IL_0598:  ldc.i4 0
	IL_059d:  stloc 2

	IL_05a1:  nop 
	IL_05a2:  nop 
	IL_05a3:  br IL_05b8

	IL_05a8:  ldc.i4 1
	IL_05ad:  stloc 2

	IL_05b1:  nop 
	IL_05b2:  nop 
	IL_05b3:  br IL_05b8

	IL_05b8:  br IL_1138

	IL_05bd:  br IL_063c

	IL_05c2:  ldarg.0 
	IL_05c3:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_05c8:  ldstr "/"
	IL_05cd:  call int32 string::Compare(string, string)
	IL_05d2:  stloc 0

	IL_05d6:  nop 
	IL_05d7:  nop 
	IL_05d8:  ldloc 0

	IL_05dc:  nop 
	IL_05dd:  nop 
	IL_05de:  ldc.i4 0
	IL_05e3:  beq IL_05ed

	IL_05e8:  br IL_0602

	IL_05ed:  ldc.i4 0
	IL_05f2:  stloc 2

	IL_05f6:  nop 
	IL_05f7:  nop 
	IL_05f8:  br IL_1138

	IL_05fd:  br IL_0637

	IL_0602:  ldarg 3

	IL_0606:  nop 
	IL_0607:  nop 
	IL_0608:  ldc.i4 1
	IL_060d:  stobj [mscorlib]System.Boolean
	IL_0612:  ldarg 4

	IL_0616:  nop 
	IL_0617:  nop 
	IL_0618:  ldc.i4 0
	IL_061d:  stobj [mscorlib]System.Boolean
	IL_0622:  ldc.i4 1
	IL_0627:  stloc 2

	IL_062b:  nop 
	IL_062c:  nop 
	IL_062d:  br IL_1138

	IL_0632:  br IL_0637

	IL_0637:  br IL_063c

	IL_063c:  br IL_0646

	IL_0641:  br IL_0646

	IL_0646:  ldarg 1

	IL_064a:  nop 
	IL_064b:  nop 
	IL_064c:  ldstr "|"
	IL_0651:  call int32 string::Compare(string, string)
	IL_0656:  stloc 0

	IL_065a:  nop 
	IL_065b:  nop 
	IL_065c:  ldloc 0

	IL_0660:  nop 
	IL_0661:  nop 
	IL_0662:  ldc.i4 0
	IL_0667:  beq IL_0671

	IL_066c:  br IL_0696

	IL_0671:  ldarg 3

	IL_0675:  nop 
	IL_0676:  nop 
	IL_0677:  ldc.i4 1
	IL_067c:  stobj [mscorlib]System.Boolean
	IL_0681:  ldc.i4 1
	IL_0686:  stloc 2

	IL_068a:  nop 
	IL_068b:  nop 
	IL_068c:  br IL_1138

	IL_0691:  br IL_069b

	IL_0696:  br IL_069b

	IL_069b:  ldarg 1

	IL_069f:  nop 
	IL_06a0:  nop 
	IL_06a1:  ldstr "$"
	IL_06a6:  call int32 string::Compare(string, string)
	IL_06ab:  stloc 0

	IL_06af:  nop 
	IL_06b0:  nop 
	IL_06b1:  ldloc 0

	IL_06b5:  nop 
	IL_06b6:  nop 
	IL_06b7:  ldc.i4 0
	IL_06bc:  beq IL_06c6

	IL_06c1:  br IL_06eb

	IL_06c6:  ldarg 3

	IL_06ca:  nop 
	IL_06cb:  nop 
	IL_06cc:  ldc.i4 1
	IL_06d1:  stobj [mscorlib]System.Boolean
	IL_06d6:  ldc.i4 1
	IL_06db:  stloc 2

	IL_06df:  nop 
	IL_06e0:  nop 
	IL_06e1:  br IL_1138

	IL_06e6:  br IL_06f0

	IL_06eb:  br IL_06f0

	IL_06f0:  ldarg 1

	IL_06f4:  nop 
	IL_06f5:  nop 
	IL_06f6:  ldstr "&"
	IL_06fb:  call int32 string::Compare(string, string)
	IL_0700:  stloc 0

	IL_0704:  nop 
	IL_0705:  nop 
	IL_0706:  ldloc 0

	IL_070a:  nop 
	IL_070b:  nop 
	IL_070c:  ldc.i4 0
	IL_0711:  beq IL_071b

	IL_0716:  br IL_0740

	IL_071b:  ldarg 3

	IL_071f:  nop 
	IL_0720:  nop 
	IL_0721:  ldc.i4 1
	IL_0726:  stobj [mscorlib]System.Boolean
	IL_072b:  ldc.i4 1
	IL_0730:  stloc 2

	IL_0734:  nop 
	IL_0735:  nop 
	IL_0736:  br IL_1138

	IL_073b:  br IL_0745

	IL_0740:  br IL_0745

	IL_0745:  ldarg 1

	IL_0749:  nop 
	IL_074a:  nop 
	IL_074b:  ldstr "~"
	IL_0750:  call int32 string::Compare(string, string)
	IL_0755:  stloc 0

	IL_0759:  nop 
	IL_075a:  nop 
	IL_075b:  ldloc 0

	IL_075f:  nop 
	IL_0760:  nop 
	IL_0761:  ldc.i4 0
	IL_0766:  beq IL_0770

	IL_076b:  br IL_0795

	IL_0770:  ldarg 3

	IL_0774:  nop 
	IL_0775:  nop 
	IL_0776:  ldc.i4 1
	IL_077b:  stobj [mscorlib]System.Boolean
	IL_0780:  ldc.i4 1
	IL_0785:  stloc 2

	IL_0789:  nop 
	IL_078a:  nop 
	IL_078b:  br IL_1138

	IL_0790:  br IL_079a

	IL_0795:  br IL_079a

	IL_079a:  ldarg 1

	IL_079e:  nop 
	IL_079f:  nop 
	IL_07a0:  ldstr "="
	IL_07a5:  call int32 string::Compare(string, string)
	IL_07aa:  stloc 0

	IL_07ae:  nop 
	IL_07af:  nop 
	IL_07b0:  ldloc 0

	IL_07b4:  nop 
	IL_07b5:  nop 
	IL_07b6:  ldc.i4 0
	IL_07bb:  beq IL_07c5

	IL_07c0:  br IL_094f

	IL_07c5:  ldarg 2

	IL_07c9:  nop 
	IL_07ca:  nop 
	IL_07cb:  ldstr "="
	IL_07d0:  call int32 string::Compare(string, string)
	IL_07d5:  stloc 0

	IL_07d9:  nop 
	IL_07da:  nop 
	IL_07db:  ldloc 0

	IL_07df:  nop 
	IL_07e0:  nop 
	IL_07e1:  ldc.i4 0
	IL_07e6:  beq IL_0915

	IL_07eb:  br IL_07f0

	IL_07f0:  ldarg 3

	IL_07f4:  nop 
	IL_07f5:  nop 
	IL_07f6:  ldc.i4 1
	IL_07fb:  stobj [mscorlib]System.Boolean
	IL_0800:  ldarg.0 
	IL_0801:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0806:  ldstr ">"
	IL_080b:  call int32 string::Compare(string, string)
	IL_0810:  stloc 0

	IL_0814:  nop 
	IL_0815:  nop 
	IL_0816:  ldloc 0

	IL_081a:  nop 
	IL_081b:  nop 
	IL_081c:  ldc.i4 0
	IL_0821:  beq IL_082b

	IL_0826:  br IL_083b

	IL_082b:  ldc.i4 0
	IL_0830:  stloc 2

	IL_0834:  nop 
	IL_0835:  nop 
	IL_0836:  br IL_090b

	IL_083b:  ldarg.0 
	IL_083c:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0841:  ldstr "<"
	IL_0846:  call int32 string::Compare(string, string)
	IL_084b:  stloc 0

	IL_084f:  nop 
	IL_0850:  nop 
	IL_0851:  ldloc 0

	IL_0855:  nop 
	IL_0856:  nop 
	IL_0857:  ldc.i4 0
	IL_085c:  beq IL_0866

	IL_0861:  br IL_0876

	IL_0866:  ldc.i4 0
	IL_086b:  stloc 2

	IL_086f:  nop 
	IL_0870:  nop 
	IL_0871:  br IL_0906

	IL_0876:  ldarg.0 
	IL_0877:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_087c:  ldstr "!"
	IL_0881:  call int32 string::Compare(string, string)
	IL_0886:  stloc 0

	IL_088a:  nop 
	IL_088b:  nop 
	IL_088c:  ldloc 0

	IL_0890:  nop 
	IL_0891:  nop 
	IL_0892:  ldc.i4 0
	IL_0897:  beq IL_08a1

	IL_089c:  br IL_08b1

	IL_08a1:  ldc.i4 0
	IL_08a6:  stloc 2

	IL_08aa:  nop 
	IL_08ab:  nop 
	IL_08ac:  br IL_0901

	IL_08b1:  ldarg.0 
	IL_08b2:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_08b7:  ldstr "="
	IL_08bc:  call int32 string::Compare(string, string)
	IL_08c1:  stloc 0

	IL_08c5:  nop 
	IL_08c6:  nop 
	IL_08c7:  ldloc 0

	IL_08cb:  nop 
	IL_08cc:  nop 
	IL_08cd:  ldc.i4 0
	IL_08d2:  beq IL_08dc

	IL_08d7:  br IL_08ec

	IL_08dc:  ldc.i4 0
	IL_08e1:  stloc 2

	IL_08e5:  nop 
	IL_08e6:  nop 
	IL_08e7:  br IL_08fc

	IL_08ec:  ldc.i4 1
	IL_08f1:  stloc 2

	IL_08f5:  nop 
	IL_08f6:  nop 
	IL_08f7:  br IL_08fc

	IL_08fc:  br IL_0901

	IL_0901:  br IL_0906

	IL_0906:  br IL_090b

	IL_090b:  br IL_1138

	IL_0910:  br IL_094a

	IL_0915:  ldarg 3

	IL_0919:  nop 
	IL_091a:  nop 
	IL_091b:  ldc.i4 1
	IL_0920:  stobj [mscorlib]System.Boolean
	IL_0925:  ldarg 4

	IL_0929:  nop 
	IL_092a:  nop 
	IL_092b:  ldc.i4 0
	IL_0930:  stobj [mscorlib]System.Boolean
	IL_0935:  ldc.i4 1
	IL_093a:  stloc 2

	IL_093e:  nop 
	IL_093f:  nop 
	IL_0940:  br IL_1138

	IL_0945:  br IL_094a

	IL_094a:  br IL_0954

	IL_094f:  br IL_0954

	IL_0954:  ldarg 1

	IL_0958:  nop 
	IL_0959:  nop 
	IL_095a:  ldstr "!"
	IL_095f:  call int32 string::Compare(string, string)
	IL_0964:  stloc 0

	IL_0968:  nop 
	IL_0969:  nop 
	IL_096a:  ldloc 0

	IL_096e:  nop 
	IL_096f:  nop 
	IL_0970:  ldc.i4 0
	IL_0975:  beq IL_097f

	IL_097a:  br IL_0a09

	IL_097f:  ldarg 2

	IL_0983:  nop 
	IL_0984:  nop 
	IL_0985:  ldstr "="
	IL_098a:  call int32 string::Compare(string, string)
	IL_098f:  stloc 0

	IL_0993:  nop 
	IL_0994:  nop 
	IL_0995:  ldloc 0

	IL_0999:  nop 
	IL_099a:  nop 
	IL_099b:  ldc.i4 0
	IL_09a0:  beq IL_09cf

	IL_09a5:  br IL_09aa

	IL_09aa:  ldarg 3

	IL_09ae:  nop 
	IL_09af:  nop 
	IL_09b0:  ldc.i4 1
	IL_09b5:  stobj [mscorlib]System.Boolean
	IL_09ba:  ldc.i4 1
	IL_09bf:  stloc 2

	IL_09c3:  nop 
	IL_09c4:  nop 
	IL_09c5:  br IL_1138

	IL_09ca:  br IL_0a04

	IL_09cf:  ldarg 3

	IL_09d3:  nop 
	IL_09d4:  nop 
	IL_09d5:  ldc.i4 1
	IL_09da:  stobj [mscorlib]System.Boolean
	IL_09df:  ldarg 4

	IL_09e3:  nop 
	IL_09e4:  nop 
	IL_09e5:  ldc.i4 0
	IL_09ea:  stobj [mscorlib]System.Boolean
	IL_09ef:  ldc.i4 1
	IL_09f4:  stloc 2

	IL_09f8:  nop 
	IL_09f9:  nop 
	IL_09fa:  br IL_1138

	IL_09ff:  br IL_0a04

	IL_0a04:  br IL_0a0e

	IL_0a09:  br IL_0a0e

	IL_0a0e:  ldarg 1

	IL_0a12:  nop 
	IL_0a13:  nop 
	IL_0a14:  ldstr "<"
	IL_0a19:  call int32 string::Compare(string, string)
	IL_0a1e:  stloc 0

	IL_0a22:  nop 
	IL_0a23:  nop 
	IL_0a24:  ldloc 0

	IL_0a28:  nop 
	IL_0a29:  nop 
	IL_0a2a:  ldc.i4 0
	IL_0a2f:  beq IL_0a39

	IL_0a34:  br IL_0bcd

	IL_0a39:  ldarg 2

	IL_0a3d:  nop 
	IL_0a3e:  nop 
	IL_0a3f:  ldstr "="
	IL_0a44:  call int32 string::Compare(string, string)
	IL_0a49:  stloc 0

	IL_0a4d:  nop 
	IL_0a4e:  nop 
	IL_0a4f:  ldloc 0

	IL_0a53:  nop 
	IL_0a54:  nop 
	IL_0a55:  ldc.i4 0
	IL_0a5a:  beq IL_0a64

	IL_0a5f:  br IL_0a99

	IL_0a64:  ldarg 3

	IL_0a68:  nop 
	IL_0a69:  nop 
	IL_0a6a:  ldc.i4 1
	IL_0a6f:  stobj [mscorlib]System.Boolean
	IL_0a74:  ldarg 4

	IL_0a78:  nop 
	IL_0a79:  nop 
	IL_0a7a:  ldc.i4 0
	IL_0a7f:  stobj [mscorlib]System.Boolean
	IL_0a84:  ldc.i4 1
	IL_0a89:  stloc 2

	IL_0a8d:  nop 
	IL_0a8e:  nop 
	IL_0a8f:  br IL_1138

	IL_0a94:  br IL_0bc8

	IL_0a99:  ldarg.0 
	IL_0a9a:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0a9f:  ldstr "<"
	IL_0aa4:  call int32 string::Compare(string, string)
	IL_0aa9:  stloc 0

	IL_0aad:  nop 
	IL_0aae:  nop 
	IL_0aaf:  ldloc 0

	IL_0ab3:  nop 
	IL_0ab4:  nop 
	IL_0ab5:  ldc.i4 0
	IL_0aba:  beq IL_0ac4

	IL_0abf:  br IL_0ad4

	IL_0ac4:  ldc.i4 0
	IL_0ac9:  stloc 2

	IL_0acd:  nop 
	IL_0ace:  nop 
	IL_0acf:  br IL_0bc3

	IL_0ad4:  ldarg 2

	IL_0ad8:  nop 
	IL_0ad9:  nop 
	IL_0ada:  ldstr "<"
	IL_0adf:  call int32 string::Compare(string, string)
	IL_0ae4:  stloc 0

	IL_0ae8:  nop 
	IL_0ae9:  nop 
	IL_0aea:  ldloc 0

	IL_0aee:  nop 
	IL_0aef:  nop 
	IL_0af0:  ldc.i4 0
	IL_0af5:  beq IL_0aff

	IL_0afa:  br IL_0b34

	IL_0aff:  ldarg 3

	IL_0b03:  nop 
	IL_0b04:  nop 
	IL_0b05:  ldc.i4 1
	IL_0b0a:  stobj [mscorlib]System.Boolean
	IL_0b0f:  ldarg 4

	IL_0b13:  nop 
	IL_0b14:  nop 
	IL_0b15:  ldc.i4 0
	IL_0b1a:  stobj [mscorlib]System.Boolean
	IL_0b1f:  ldc.i4 1
	IL_0b24:  stloc 2

	IL_0b28:  nop 
	IL_0b29:  nop 
	IL_0b2a:  br IL_1138

	IL_0b2f:  br IL_0bbe

	IL_0b34:  ldarg 2

	IL_0b38:  nop 
	IL_0b39:  nop 
	IL_0b3a:  ldstr ">"
	IL_0b3f:  call int32 string::Compare(string, string)
	IL_0b44:  stloc 0

	IL_0b48:  nop 
	IL_0b49:  nop 
	IL_0b4a:  ldloc 0

	IL_0b4e:  nop 
	IL_0b4f:  nop 
	IL_0b50:  ldc.i4 0
	IL_0b55:  beq IL_0b5f

	IL_0b5a:  br IL_0b94

	IL_0b5f:  ldarg 3

	IL_0b63:  nop 
	IL_0b64:  nop 
	IL_0b65:  ldc.i4 1
	IL_0b6a:  stobj [mscorlib]System.Boolean
	IL_0b6f:  ldarg 4

	IL_0b73:  nop 
	IL_0b74:  nop 
	IL_0b75:  ldc.i4 0
	IL_0b7a:  stobj [mscorlib]System.Boolean
	IL_0b7f:  ldc.i4 1
	IL_0b84:  stloc 2

	IL_0b88:  nop 
	IL_0b89:  nop 
	IL_0b8a:  br IL_1138

	IL_0b8f:  br IL_0bb9

	IL_0b94:  ldarg 3

	IL_0b98:  nop 
	IL_0b99:  nop 
	IL_0b9a:  ldc.i4 1
	IL_0b9f:  stobj [mscorlib]System.Boolean
	IL_0ba4:  ldc.i4 1
	IL_0ba9:  stloc 2

	IL_0bad:  nop 
	IL_0bae:  nop 
	IL_0baf:  br IL_1138

	IL_0bb4:  br IL_0bb9

	IL_0bb9:  br IL_0bbe

	IL_0bbe:  br IL_0bc3

	IL_0bc3:  br IL_0bc8

	IL_0bc8:  br IL_0bd2

	IL_0bcd:  br IL_0bd2

	IL_0bd2:  ldarg 1

	IL_0bd6:  nop 
	IL_0bd7:  nop 
	IL_0bd8:  ldstr ">"
	IL_0bdd:  call int32 string::Compare(string, string)
	IL_0be2:  stloc 0

	IL_0be6:  nop 
	IL_0be7:  nop 
	IL_0be8:  ldloc 0

	IL_0bec:  nop 
	IL_0bed:  nop 
	IL_0bee:  ldc.i4 0
	IL_0bf3:  beq IL_0bfd

	IL_0bf8:  br IL_0d6c

	IL_0bfd:  ldarg 2

	IL_0c01:  nop 
	IL_0c02:  nop 
	IL_0c03:  ldstr "="
	IL_0c08:  call int32 string::Compare(string, string)
	IL_0c0d:  stloc 0

	IL_0c11:  nop 
	IL_0c12:  nop 
	IL_0c13:  ldloc 0

	IL_0c17:  nop 
	IL_0c18:  nop 
	IL_0c19:  ldc.i4 0
	IL_0c1e:  beq IL_0d32

	IL_0c23:  br IL_0c28

	IL_0c28:  ldarg 3

	IL_0c2c:  nop 
	IL_0c2d:  nop 
	IL_0c2e:  ldc.i4 1
	IL_0c33:  stobj [mscorlib]System.Boolean
	IL_0c38:  ldarg.0 
	IL_0c39:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0c3e:  ldstr "<"
	IL_0c43:  call int32 string::Compare(string, string)
	IL_0c48:  stloc 0

	IL_0c4c:  nop 
	IL_0c4d:  nop 
	IL_0c4e:  ldloc 0

	IL_0c52:  nop 
	IL_0c53:  nop 
	IL_0c54:  ldc.i4 0
	IL_0c59:  beq IL_0c63

	IL_0c5e:  br IL_0c73

	IL_0c63:  ldc.i4 0
	IL_0c68:  stloc 2

	IL_0c6c:  nop 
	IL_0c6d:  nop 
	IL_0c6e:  br IL_0d28

	IL_0c73:  ldarg.0 
	IL_0c74:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0c79:  ldstr ">"
	IL_0c7e:  call int32 string::Compare(string, string)
	IL_0c83:  stloc 0

	IL_0c87:  nop 
	IL_0c88:  nop 
	IL_0c89:  ldloc 0

	IL_0c8d:  nop 
	IL_0c8e:  nop 
	IL_0c8f:  ldc.i4 0
	IL_0c94:  beq IL_0c9e

	IL_0c99:  br IL_0cae

	IL_0c9e:  ldc.i4 0
	IL_0ca3:  stloc 2

	IL_0ca7:  nop 
	IL_0ca8:  nop 
	IL_0ca9:  br IL_0d23

	IL_0cae:  ldarg 2

	IL_0cb2:  nop 
	IL_0cb3:  nop 
	IL_0cb4:  ldstr ">"
	IL_0cb9:  call int32 string::Compare(string, string)
	IL_0cbe:  stloc 0

	IL_0cc2:  nop 
	IL_0cc3:  nop 
	IL_0cc4:  ldloc 0

	IL_0cc8:  nop 
	IL_0cc9:  nop 
	IL_0cca:  ldc.i4 0
	IL_0ccf:  beq IL_0cd9

	IL_0cd4:  br IL_0d0e

	IL_0cd9:  ldarg 3

	IL_0cdd:  nop 
	IL_0cde:  nop 
	IL_0cdf:  ldc.i4 1
	IL_0ce4:  stobj [mscorlib]System.Boolean
	IL_0ce9:  ldarg 4

	IL_0ced:  nop 
	IL_0cee:  nop 
	IL_0cef:  ldc.i4 0
	IL_0cf4:  stobj [mscorlib]System.Boolean
	IL_0cf9:  ldc.i4 1
	IL_0cfe:  stloc 2

	IL_0d02:  nop 
	IL_0d03:  nop 
	IL_0d04:  br IL_1138

	IL_0d09:  br IL_0d1e

	IL_0d0e:  ldc.i4 1
	IL_0d13:  stloc 2

	IL_0d17:  nop 
	IL_0d18:  nop 
	IL_0d19:  br IL_0d1e

	IL_0d1e:  br IL_0d23

	IL_0d23:  br IL_0d28

	IL_0d28:  br IL_1138

	IL_0d2d:  br IL_0d67

	IL_0d32:  ldarg 3

	IL_0d36:  nop 
	IL_0d37:  nop 
	IL_0d38:  ldc.i4 1
	IL_0d3d:  stobj [mscorlib]System.Boolean
	IL_0d42:  ldarg 4

	IL_0d46:  nop 
	IL_0d47:  nop 
	IL_0d48:  ldc.i4 0
	IL_0d4d:  stobj [mscorlib]System.Boolean
	IL_0d52:  ldc.i4 1
	IL_0d57:  stloc 2

	IL_0d5b:  nop 
	IL_0d5c:  nop 
	IL_0d5d:  br IL_1138

	IL_0d62:  br IL_0d67

	IL_0d67:  br IL_0d71

	IL_0d6c:  br IL_0d71

	IL_0d71:  ldarg 1

	IL_0d75:  nop 
	IL_0d76:  nop 
	IL_0d77:  ldstr "-"
	IL_0d7c:  call int32 string::Compare(string, string)
	IL_0d81:  stloc 0

	IL_0d85:  nop 
	IL_0d86:  nop 
	IL_0d87:  ldloc 0

	IL_0d8b:  nop 
	IL_0d8c:  nop 
	IL_0d8d:  ldc.i4 0
	IL_0d92:  beq IL_0d9c

	IL_0d97:  br IL_0eb7

	IL_0d9c:  ldarg 2

	IL_0da0:  nop 
	IL_0da1:  nop 
	IL_0da2:  ldstr "-"
	IL_0da7:  call int32 string::Compare(string, string)
	IL_0dac:  stloc 0

	IL_0db0:  nop 
	IL_0db1:  nop 
	IL_0db2:  ldloc 0

	IL_0db6:  nop 
	IL_0db7:  nop 
	IL_0db8:  ldc.i4 0
	IL_0dbd:  beq IL_0e7d

	IL_0dc2:  br IL_0dc7

	IL_0dc7:  ldarg 3

	IL_0dcb:  nop 
	IL_0dcc:  nop 
	IL_0dcd:  ldc.i4 1
	IL_0dd2:  stobj [mscorlib]System.Boolean
	IL_0dd7:  ldarg.0 
	IL_0dd8:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0ddd:  ldstr "-"
	IL_0de2:  call int32 string::Compare(string, string)
	IL_0de7:  stloc 0

	IL_0deb:  nop 
	IL_0dec:  nop 
	IL_0ded:  ldloc 0

	IL_0df1:  nop 
	IL_0df2:  nop 
	IL_0df3:  ldc.i4 0
	IL_0df8:  beq IL_0e02

	IL_0dfd:  br IL_0e12

	IL_0e02:  ldc.i4 0
	IL_0e07:  stloc 2

	IL_0e0b:  nop 
	IL_0e0c:  nop 
	IL_0e0d:  br IL_0e22

	IL_0e12:  ldc.i4 1
	IL_0e17:  stloc 2

	IL_0e1b:  nop 
	IL_0e1c:  nop 
	IL_0e1d:  br IL_0e22

	IL_0e22:  ldarg 2

	IL_0e26:  nop 
	IL_0e27:  nop 
	IL_0e28:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0e2d:  stloc 3

	IL_0e31:  nop 
	IL_0e32:  nop 
	IL_0e33:  ldloc 3

	IL_0e37:  nop 
	IL_0e38:  nop 
	IL_0e39:  call bool char::IsDigit(char)
	IL_0e3e:  stloc 4

	IL_0e42:  nop 
	IL_0e43:  nop 
	IL_0e44:  ldloc 4

	IL_0e48:  nop 
	IL_0e49:  nop 
	IL_0e4a:  ldc.i4 1
	IL_0e4f:  beq IL_0e59

	IL_0e54:  br IL_0e6e

	IL_0e59:  ldarg 4

	IL_0e5d:  nop 
	IL_0e5e:  nop 
	IL_0e5f:  ldc.i4 0
	IL_0e64:  stobj [mscorlib]System.Boolean
	IL_0e69:  br IL_0e73

	IL_0e6e:  br IL_0e73

	IL_0e73:  br IL_1138

	IL_0e78:  br IL_0eb2

	IL_0e7d:  ldarg 3

	IL_0e81:  nop 
	IL_0e82:  nop 
	IL_0e83:  ldc.i4 1
	IL_0e88:  stobj [mscorlib]System.Boolean
	IL_0e8d:  ldarg 4

	IL_0e91:  nop 
	IL_0e92:  nop 
	IL_0e93:  ldc.i4 0
	IL_0e98:  stobj [mscorlib]System.Boolean
	IL_0e9d:  ldc.i4 1
	IL_0ea2:  stloc 2

	IL_0ea6:  nop 
	IL_0ea7:  nop 
	IL_0ea8:  br IL_1138

	IL_0ead:  br IL_0eb2

	IL_0eb2:  br IL_0ebc

	IL_0eb7:  br IL_0ebc

	IL_0ebc:  ldarg 1

	IL_0ec0:  nop 
	IL_0ec1:  nop 
	IL_0ec2:  ldstr "+"
	IL_0ec7:  call int32 string::Compare(string, string)
	IL_0ecc:  stloc 0

	IL_0ed0:  nop 
	IL_0ed1:  nop 
	IL_0ed2:  ldloc 0

	IL_0ed6:  nop 
	IL_0ed7:  nop 
	IL_0ed8:  ldc.i4 0
	IL_0edd:  beq IL_0ee7

	IL_0ee2:  br IL_1002

	IL_0ee7:  ldarg 2

	IL_0eeb:  nop 
	IL_0eec:  nop 
	IL_0eed:  ldstr "+"
	IL_0ef2:  call int32 string::Compare(string, string)
	IL_0ef7:  stloc 0

	IL_0efb:  nop 
	IL_0efc:  nop 
	IL_0efd:  ldloc 0

	IL_0f01:  nop 
	IL_0f02:  nop 
	IL_0f03:  ldc.i4 0
	IL_0f08:  beq IL_0fc8

	IL_0f0d:  br IL_0f12

	IL_0f12:  ldarg 3

	IL_0f16:  nop 
	IL_0f17:  nop 
	IL_0f18:  ldc.i4 1
	IL_0f1d:  stobj [mscorlib]System.Boolean
	IL_0f22:  ldarg.0 
	IL_0f23:  ldfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_0f28:  ldstr "+"
	IL_0f2d:  call int32 string::Compare(string, string)
	IL_0f32:  stloc 0

	IL_0f36:  nop 
	IL_0f37:  nop 
	IL_0f38:  ldloc 0

	IL_0f3c:  nop 
	IL_0f3d:  nop 
	IL_0f3e:  ldc.i4 0
	IL_0f43:  beq IL_0f4d

	IL_0f48:  br IL_0f5d

	IL_0f4d:  ldc.i4 0
	IL_0f52:  stloc 2

	IL_0f56:  nop 
	IL_0f57:  nop 
	IL_0f58:  br IL_0f6d

	IL_0f5d:  ldc.i4 1
	IL_0f62:  stloc 2

	IL_0f66:  nop 
	IL_0f67:  nop 
	IL_0f68:  br IL_0f6d

	IL_0f6d:  ldarg 2

	IL_0f71:  nop 
	IL_0f72:  nop 
	IL_0f73:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0f78:  stloc 3

	IL_0f7c:  nop 
	IL_0f7d:  nop 
	IL_0f7e:  ldloc 3

	IL_0f82:  nop 
	IL_0f83:  nop 
	IL_0f84:  call bool char::IsDigit(char)
	IL_0f89:  stloc 4

	IL_0f8d:  nop 
	IL_0f8e:  nop 
	IL_0f8f:  ldloc 4

	IL_0f93:  nop 
	IL_0f94:  nop 
	IL_0f95:  ldc.i4 1
	IL_0f9a:  beq IL_0fa4

	IL_0f9f:  br IL_0fb9

	IL_0fa4:  ldarg 4

	IL_0fa8:  nop 
	IL_0fa9:  nop 
	IL_0faa:  ldc.i4 0
	IL_0faf:  stobj [mscorlib]System.Boolean
	IL_0fb4:  br IL_0fbe

	IL_0fb9:  br IL_0fbe

	IL_0fbe:  br IL_1138

	IL_0fc3:  br IL_0ffd

	IL_0fc8:  ldarg 3

	IL_0fcc:  nop 
	IL_0fcd:  nop 
	IL_0fce:  ldc.i4 1
	IL_0fd3:  stobj [mscorlib]System.Boolean
	IL_0fd8:  ldarg 4

	IL_0fdc:  nop 
	IL_0fdd:  nop 
	IL_0fde:  ldc.i4 0
	IL_0fe3:  stobj [mscorlib]System.Boolean
	IL_0fe8:  ldc.i4 1
	IL_0fed:  stloc 2

	IL_0ff1:  nop 
	IL_0ff2:  nop 
	IL_0ff3:  br IL_1138

	IL_0ff8:  br IL_0ffd

	IL_0ffd:  br IL_1007

	IL_1002:  br IL_1007

	IL_1007:  ldc.i4 9
	IL_100c:  call char class [mscorlib]System.Convert::ToChar(int32)
	IL_1011:  stloc 5

	IL_1015:  nop 
	IL_1016:  nop 
	IL_1017:  ldarg 1

	IL_101b:  nop 
	IL_101c:  nop 
	IL_101d:  ldloc 5

	IL_1021:  nop 
	IL_1022:  nop 
	IL_1023:  call string class [mscorlib]System.Convert::ToString(char)
	IL_1028:  call int32 string::Compare(string, string)
	IL_102d:  stloc 0

	IL_1031:  nop 
	IL_1032:  nop 
	IL_1033:  ldloc 0

	IL_1037:  nop 
	IL_1038:  nop 
	IL_1039:  ldc.i4 0
	IL_103e:  beq IL_1048

	IL_1043:  br IL_106d

	IL_1048:  ldarg 3

	IL_104c:  nop 
	IL_104d:  nop 
	IL_104e:  ldc.i4 0
	IL_1053:  stobj [mscorlib]System.Boolean
	IL_1058:  ldc.i4 1
	IL_105d:  stloc 2

	IL_1061:  nop 
	IL_1062:  nop 
	IL_1063:  br IL_1138

	IL_1068:  br IL_108d

	IL_106d:  ldarg 3

	IL_1071:  nop 
	IL_1072:  nop 
	IL_1073:  ldc.i4 0
	IL_1078:  stobj [mscorlib]System.Boolean
	IL_107d:  ldc.i4 0
	IL_1082:  stloc 2

	IL_1086:  nop 
	IL_1087:  nop 
	IL_1088:  br IL_108d

	IL_108d:  ldc.i4 32
	IL_1092:  call char class [mscorlib]System.Convert::ToChar(int32)
	IL_1097:  stloc 6

	IL_109b:  nop 
	IL_109c:  nop 
	IL_109d:  ldarg 1

	IL_10a1:  nop 
	IL_10a2:  nop 
	IL_10a3:  ldloc 6

	IL_10a7:  nop 
	IL_10a8:  nop 
	IL_10a9:  call string class [mscorlib]System.Convert::ToString(char)
	IL_10ae:  call int32 string::Compare(string, string)
	IL_10b3:  stloc 0

	IL_10b7:  nop 
	IL_10b8:  nop 
	IL_10b9:  ldloc 0

	IL_10bd:  nop 
	IL_10be:  nop 
	IL_10bf:  ldc.i4 0
	IL_10c4:  beq IL_10ce

	IL_10c9:  br IL_10f3

	IL_10ce:  ldarg 3

	IL_10d2:  nop 
	IL_10d3:  nop 
	IL_10d4:  ldc.i4 0
	IL_10d9:  stobj [mscorlib]System.Boolean
	IL_10de:  ldc.i4 1
	IL_10e3:  stloc 2

	IL_10e7:  nop 
	IL_10e8:  nop 
	IL_10e9:  br IL_1138

	IL_10ee:  br IL_1113

	IL_10f3:  ldarg 3

	IL_10f7:  nop 
	IL_10f8:  nop 
	IL_10f9:  ldc.i4 0
	IL_10fe:  stobj [mscorlib]System.Boolean
	IL_1103:  ldc.i4 0
	IL_1108:  stloc 2

	IL_110c:  nop 
	IL_110d:  nop 
	IL_110e:  br IL_1113

	IL_1113:  br IL_1138

	IL_1118:  ldarg 3

	IL_111c:  nop 
	IL_111d:  nop 
	IL_111e:  ldc.i4 0
	IL_1123:  stobj [mscorlib]System.Boolean
	IL_1128:  ldc.i4 0
	IL_112d:  stloc 2

	IL_1131:  nop 
	IL_1132:  nop 
	IL_1133:  br IL_1138

	IL_1138:  ldarg.0 
	IL_1139:  ldarg 1

	IL_113d:  nop 
	IL_113e:  nop 
	IL_113f:  stfld string dylan.NET.Tokenizer.Lexer.Line::PrevChar
	IL_1144:  ldloc 2

	IL_1148:  nop 
	IL_1149:  nop 
	IL_114a:  ret 
    } // end of method Line::isSep

    // method line 4
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt Analyze (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, string str)  cil managed 
    {
        // Method begins at RVA 0x3280
	// Code size 1000 (0x3e8)
	.maxstack 39
	.locals init (
		string	V_0,
		string	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_2,
		int32	V_3,
		int32	V_4,
		string	V_5,
		bool	V_6,
		bool	V_7,
		bool	V_8,
		int32	V_9,
		int32	V_10)
	IL_0000:  ldstr ""
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldstr ""
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldnull 
	IL_0017:  stloc 2

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldarg 2

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  callvirt instance int32 string::get_Length()
	IL_0028:  stloc 3

	IL_002c:  nop 
	IL_002d:  nop 
	IL_002e:  ldc.i4 0
	IL_0033:  stloc 4

	IL_0037:  nop 
	IL_0038:  nop 
	IL_0039:  ldloc 3

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldc.i4 1
	IL_0044:  sub 
	IL_0045:  stloc 3

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  ldstr ""
	IL_0050:  stloc 5

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldc.i4 0
	IL_005b:  stloc 6

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  ldc.i4 0
	IL_0066:  stloc 7

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldc.i4 0
	IL_0071:  stloc 8

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 -1
	IL_007c:  stloc 9

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldc.i4 0
	IL_0087:  stloc 10

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldloc 3

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldc.i4 -1
	IL_0098:  beq IL_00a2

	IL_009d:  br IL_00ac

	IL_00a2:  br IL_035e

	IL_00a7:  br IL_00b1

	IL_00ac:  br IL_00b1

	IL_00b1:  ldloc 9

	IL_00b5:  nop 
	IL_00b6:  nop 
	IL_00b7:  ldc.i4 1
	IL_00bc:  add 
	IL_00bd:  stloc 9

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldloc 9

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldc.i4 1
	IL_00ce:  add 
	IL_00cf:  stloc 10

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldc.i4 0
	IL_00da:  stloc 6

	IL_00de:  nop 
	IL_00df:  nop 
	IL_00e0:  ldloc 8

	IL_00e4:  nop 
	IL_00e5:  nop 
	IL_00e6:  ldc.i4 0
	IL_00eb:  beq IL_00f5

	IL_00f0:  br IL_0105

	IL_00f5:  ldc.i4 0
	IL_00fa:  stloc 7

	IL_00fe:  nop 
	IL_00ff:  nop 
	IL_0100:  br IL_010a

	IL_0105:  br IL_010a

	IL_010a:  ldloc 7

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ldc.i4 1
	IL_0115:  beq IL_011f

	IL_011a:  br IL_01a7

	IL_011f:  ldloc 5

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  ldstr ""
	IL_012a:  call int32 string::Compare(string, string)
	IL_012f:  stloc 4

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  ldloc 4

	IL_0139:  nop 
	IL_013a:  nop 
	IL_013b:  ldc.i4 0
	IL_0140:  beq IL_0192

	IL_0145:  br IL_014a

	IL_014a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_014f:  stloc 2

	IL_0153:  nop 
	IL_0154:  nop 
	IL_0155:  ldloc 2

	IL_0159:  nop 
	IL_015a:  nop 
	IL_015b:  ldloc 5

	IL_015f:  nop 
	IL_0160:  nop 
	IL_0161:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0166:  ldloc 2

	IL_016a:  nop 
	IL_016b:  nop 
	IL_016c:  ldarg 1

	IL_0170:  nop 
	IL_0171:  nop 
	IL_0172:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0177:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_017c:  ldarg 1

	IL_0180:  nop 
	IL_0181:  nop 
	IL_0182:  ldloc 2

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_018d:  br IL_0197

	IL_0192:  br IL_0197

	IL_0197:  ldstr ""
	IL_019c:  stloc 5

	IL_01a0:  nop 
	IL_01a1:  nop 
	IL_01a2:  br IL_01ac

	IL_01a7:  br IL_01ac

	IL_01ac:  ldc.i4 0
	IL_01b1:  stloc 7

	IL_01b5:  nop 
	IL_01b6:  nop 
	IL_01b7:  ldc.i4 1
	IL_01bc:  stloc 8

	IL_01c0:  nop 
	IL_01c1:  nop 
	IL_01c2:  ldarg 2

	IL_01c6:  nop 
	IL_01c7:  nop 
	IL_01c8:  ldloc 9

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  callvirt instance char string::get_Chars(int32)
	IL_01d3:  call string class [mscorlib]System.Convert::ToString(char)
	IL_01d8:  stloc 0

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 9

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldloc 3

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  blt IL_01f4

	IL_01ef:  br IL_0215

	IL_01f4:  ldarg 2

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  ldloc 10

	IL_01fe:  nop 
	IL_01ff:  nop 
	IL_0200:  callvirt instance char string::get_Chars(int32)
	IL_0205:  call string class [mscorlib]System.Convert::ToString(char)
	IL_020a:  stloc 1

	IL_020e:  nop 
	IL_020f:  nop 
	IL_0210:  br IL_0221

	IL_0215:  ldnull 
	IL_0216:  stloc 1

	IL_021a:  nop 
	IL_021b:  nop 
	IL_021c:  br IL_0221

	IL_0221:  ldarg.0 
	IL_0222:  ldloc 0

	IL_0226:  nop 
	IL_0227:  nop 
	IL_0228:  ldloc 1

	IL_022c:  nop 
	IL_022d:  nop 
	IL_022e:  ldloca 7

	IL_0232:  nop 
	IL_0233:  nop 
	IL_0234:  ldloca 8

	IL_0238:  nop 
	IL_0239:  nop 
	IL_023a:  callvirt instance bool class dylan.NET.Tokenizer.Lexer.Line::isSep(string, string, [out] bool&, [out] bool&)
	IL_023f:  stloc 6

	IL_0243:  nop 
	IL_0244:  nop 
	IL_0245:  ldloc 6

	IL_0249:  nop 
	IL_024a:  nop 
	IL_024b:  ldc.i4 1
	IL_0250:  beq IL_025a

	IL_0255:  br IL_0318

	IL_025a:  ldloc 5

	IL_025e:  nop 
	IL_025f:  nop 
	IL_0260:  ldstr ""
	IL_0265:  call int32 string::Compare(string, string)
	IL_026a:  stloc 4

	IL_026e:  nop 
	IL_026f:  nop 
	IL_0270:  ldloc 4

	IL_0274:  nop 
	IL_0275:  nop 
	IL_0276:  ldc.i4 0
	IL_027b:  beq IL_02cd

	IL_0280:  br IL_0285

	IL_0285:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_028a:  stloc 2

	IL_028e:  nop 
	IL_028f:  nop 
	IL_0290:  ldloc 2

	IL_0294:  nop 
	IL_0295:  nop 
	IL_0296:  ldloc 5

	IL_029a:  nop 
	IL_029b:  nop 
	IL_029c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02a1:  ldloc 2

	IL_02a5:  nop 
	IL_02a6:  nop 
	IL_02a7:  ldarg 1

	IL_02ab:  nop 
	IL_02ac:  nop 
	IL_02ad:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_02b2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02b7:  ldarg 1

	IL_02bb:  nop 
	IL_02bc:  nop 
	IL_02bd:  ldloc 2

	IL_02c1:  nop 
	IL_02c2:  nop 
	IL_02c3:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_02c8:  br IL_02d2

	IL_02cd:  br IL_02d2

	IL_02d2:  ldstr ""
	IL_02d7:  stloc 5

	IL_02db:  nop 
	IL_02dc:  nop 
	IL_02dd:  ldloc 7

	IL_02e1:  nop 
	IL_02e2:  nop 
	IL_02e3:  ldc.i4 1
	IL_02e8:  beq IL_02f2

	IL_02ed:  br IL_030e

	IL_02f2:  ldloc 5

	IL_02f6:  nop 
	IL_02f7:  nop 
	IL_02f8:  ldloc 0

	IL_02fc:  nop 
	IL_02fd:  nop 
	IL_02fe:  call string string::Concat(string, string)
	IL_0303:  stloc 5

	IL_0307:  nop 
	IL_0308:  nop 
	IL_0309:  br IL_0313

	IL_030e:  br IL_0313

	IL_0313:  br IL_0334

	IL_0318:  ldloc 5

	IL_031c:  nop 
	IL_031d:  nop 
	IL_031e:  ldloc 0

	IL_0322:  nop 
	IL_0323:  nop 
	IL_0324:  call string string::Concat(string, string)
	IL_0329:  stloc 5

	IL_032d:  nop 
	IL_032e:  nop 
	IL_032f:  br IL_0334

	IL_0334:  ldloc 9

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  ldloc 3

	IL_033e:  nop 
	IL_033f:  nop 
	IL_0340:  beq IL_034a

	IL_0345:  br IL_0354

	IL_034a:  br IL_035e

	IL_034f:  br IL_035e

	IL_0354:  br IL_00b1

	IL_0359:  br IL_035e

	IL_035e:  ldloc 5

	IL_0362:  nop 
	IL_0363:  nop 
	IL_0364:  ldstr ""
	IL_0369:  call int32 string::Compare(string, string)
	IL_036e:  stloc 4

	IL_0372:  nop 
	IL_0373:  nop 
	IL_0374:  ldloc 4

	IL_0378:  nop 
	IL_0379:  nop 
	IL_037a:  ldc.i4 0
	IL_037f:  beq IL_03d1

	IL_0384:  br IL_0389

	IL_0389:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_038e:  stloc 2

	IL_0392:  nop 
	IL_0393:  nop 
	IL_0394:  ldloc 2

	IL_0398:  nop 
	IL_0399:  nop 
	IL_039a:  ldloc 5

	IL_039e:  nop 
	IL_039f:  nop 
	IL_03a0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03a5:  ldloc 2

	IL_03a9:  nop 
	IL_03aa:  nop 
	IL_03ab:  ldarg 1

	IL_03af:  nop 
	IL_03b0:  nop 
	IL_03b1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_03b6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_03bb:  ldarg 1

	IL_03bf:  nop 
	IL_03c0:  nop 
	IL_03c1:  ldloc 2

	IL_03c5:  nop 
	IL_03c6:  nop 
	IL_03c7:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_03cc:  br IL_03d6

	IL_03d1:  br IL_03d6

	IL_03d6:  ldstr ""
	IL_03db:  stloc 5

	IL_03df:  nop 
	IL_03e0:  nop 
	IL_03e1:  ldarg 1

	IL_03e5:  nop 
	IL_03e6:  nop 
	IL_03e7:  ret 
    } // end of method Line::Analyze

  } // end of class dylan.NET.Tokenizer.Lexer.Line
}

.namespace dylan.NET.Tokenizer.Lexer
{
  .class public auto ansi Lexer
  	extends [mscorlib]System.Object
  {

    // method line 5
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet Analyze (string path)  cil managed 
    {
        // Method begins at RVA 0x3674
	// Code size 938 (0x3aa)
	.maxstack 28
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt	V_1,
		class dylan.NET.Tokenizer.Lexer.Line	V_2,
		class [mscorlib]System.IO.StreamReader	V_3,
		bool	V_4,
		bool	V_5,
		bool	V_6,
		bool	V_7,
		string	V_8,
		int32	V_9,
		int32	V_10,
		int32	V_11,
		string	V_12,
		char	V_13,
		int32	V_14)
	IL_0000:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::'.ctor'()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldnull 
	IL_000c:  stloc 1

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldnull 
	IL_0013:  stloc 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldarg 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  newobj instance void class [mscorlib]System.IO.StreamReader::'.ctor'(string)
	IL_0024:  stloc 3

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldc.i4 0
	IL_002f:  stloc 4

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  ldc.i4 0
	IL_003a:  stloc 5

	IL_003e:  nop 
	IL_003f:  nop 
	IL_0040:  ldc.i4 0
	IL_0045:  stloc 6

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  ldc.i4 0
	IL_0050:  stloc 7

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldstr ""
	IL_005b:  stloc 8

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  ldc.i4 0
	IL_0066:  stloc 9

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldc.i4 -1
	IL_0071:  stloc 10

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 0
	IL_007c:  stloc 11

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldstr ""
	IL_0087:  stloc 12

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldstr "a"
	IL_0092:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0097:  stloc 13

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldc.i4 0
	IL_00a2:  stloc 14

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 3

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  callvirt instance int32 class [mscorlib]System.IO.StreamReader::Peek()
	IL_00b3:  stloc 11

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 11

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldc.i4 0
	IL_00c4:  blt IL_00ce

	IL_00c9:  br IL_00d8

	IL_00ce:  br IL_0398

	IL_00d3:  br IL_00dd

	IL_00d8:  br IL_00dd

	IL_00dd:  ldloc 3

	IL_00e1:  nop 
	IL_00e2:  nop 
	IL_00e3:  callvirt instance int32 class [mscorlib]System.IO.StreamReader::Read()
	IL_00e8:  stloc 11

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  ldloc 11

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  call char class [mscorlib]System.Convert::ToChar(int32)
	IL_00f9:  stloc 13

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  ldloc 13

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  call string class [mscorlib]System.Convert::ToString(char)
	IL_010a:  stloc 12

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ldloc 12

	IL_0114:  nop 
	IL_0115:  nop 
	IL_0116:  ldsfld string [dnu]dylan.NET.Utils.Constants::cr
	IL_011b:  call int32 string::Compare(string, string)
	IL_0120:  stloc 14

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  ldloc 14

	IL_012a:  nop 
	IL_012b:  nop 
	IL_012c:  ldc.i4 0
	IL_0131:  beq IL_013b

	IL_0136:  br IL_014b

	IL_013b:  ldc.i4 1
	IL_0140:  stloc 4

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  br IL_0150

	IL_014b:  br IL_0150

	IL_0150:  ldloc 12

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldsfld string [dnu]dylan.NET.Utils.Constants::lf
	IL_015b:  call int32 string::Compare(string, string)
	IL_0160:  stloc 14

	IL_0164:  nop 
	IL_0165:  nop 
	IL_0166:  ldloc 14

	IL_016a:  nop 
	IL_016b:  nop 
	IL_016c:  ldc.i4 0
	IL_0171:  beq IL_017b

	IL_0176:  br IL_018b

	IL_017b:  ldc.i4 1
	IL_0180:  stloc 5

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  br IL_0190

	IL_018b:  br IL_0190

	IL_0190:  ldloc 4

	IL_0194:  nop 
	IL_0195:  nop 
	IL_0196:  ldloc 5

	IL_019a:  nop 
	IL_019b:  nop 
	IL_019c:  and 
	IL_019d:  stloc 6

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  ldloc 4

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldloc 5

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  or 
	IL_01b0:  stloc 7

	IL_01b4:  nop 
	IL_01b5:  nop 
	IL_01b6:  ldloc 7

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  ldc.i4 0
	IL_01c1:  beq IL_01cb

	IL_01c6:  br IL_01e7

	IL_01cb:  ldloc 8

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  ldloc 12

	IL_01d5:  nop 
	IL_01d6:  nop 
	IL_01d7:  call string string::Concat(string, string)
	IL_01dc:  stloc 8

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  br IL_02c5

	IL_01e7:  ldloc 5

	IL_01eb:  nop 
	IL_01ec:  nop 
	IL_01ed:  ldc.i4 1
	IL_01f2:  beq IL_01fc

	IL_01f7:  br IL_02bb

	IL_01fc:  ldloc 9

	IL_0200:  nop 
	IL_0201:  nop 
	IL_0202:  ldc.i4 1
	IL_0207:  add 
	IL_0208:  stloc 9

	IL_020c:  nop 
	IL_020d:  nop 
	IL_020e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0213:  stloc 1

	IL_0217:  nop 
	IL_0218:  nop 
	IL_0219:  ldloc 1

	IL_021d:  nop 
	IL_021e:  nop 
	IL_021f:  ldloc 9

	IL_0223:  nop 
	IL_0224:  nop 
	IL_0225:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_022a:  newobj instance void class dylan.NET.Tokenizer.Lexer.Line::'.ctor'()
	IL_022f:  stloc 2

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  ldloc 2

	IL_0239:  nop 
	IL_023a:  nop 
	IL_023b:  ldloc 1

	IL_023f:  nop 
	IL_0240:  nop 
	IL_0241:  ldloc 8

	IL_0245:  nop 
	IL_0246:  nop 
	IL_0247:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Lexer.Line::Analyze(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, string)
	IL_024c:  stloc 1

	IL_0250:  nop 
	IL_0251:  nop 
	IL_0252:  ldloc 1

	IL_0256:  nop 
	IL_0257:  nop 
	IL_0258:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_025d:  ldlen 
	IL_025e:  conv.i4 
	IL_025f:  stloc 10

	IL_0263:  nop 
	IL_0264:  nop 
	IL_0265:  ldloc 10

	IL_0269:  nop 
	IL_026a:  nop 
	IL_026b:  ldc.i4 0
	IL_0270:  beq IL_0290

	IL_0275:  br IL_027a

	IL_027a:  ldloc 0

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  ldloc 1

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::AddStmt(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt)
	IL_028b:  br IL_0295

	IL_0290:  br IL_0295

	IL_0295:  ldstr ""
	IL_029a:  stloc 8

	IL_029e:  nop 
	IL_029f:  nop 
	IL_02a0:  ldc.i4 0
	IL_02a5:  stloc 4

	IL_02a9:  nop 
	IL_02aa:  nop 
	IL_02ab:  ldc.i4 0
	IL_02b0:  stloc 5

	IL_02b4:  nop 
	IL_02b5:  nop 
	IL_02b6:  br IL_02c0

	IL_02bb:  br IL_02c0

	IL_02c0:  br IL_02c5

	IL_02c5:  ldloc 3

	IL_02c9:  nop 
	IL_02ca:  nop 
	IL_02cb:  callvirt instance int32 class [mscorlib]System.IO.StreamReader::Peek()
	IL_02d0:  stloc 11

	IL_02d4:  nop 
	IL_02d5:  nop 
	IL_02d6:  ldloc 11

	IL_02da:  nop 
	IL_02db:  nop 
	IL_02dc:  ldc.i4 -1
	IL_02e1:  beq IL_02eb

	IL_02e6:  br IL_038e

	IL_02eb:  ldloc 9

	IL_02ef:  nop 
	IL_02f0:  nop 
	IL_02f1:  ldc.i4 1
	IL_02f6:  add 
	IL_02f7:  stloc 9

	IL_02fb:  nop 
	IL_02fc:  nop 
	IL_02fd:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0302:  stloc 1

	IL_0306:  nop 
	IL_0307:  nop 
	IL_0308:  ldloc 1

	IL_030c:  nop 
	IL_030d:  nop 
	IL_030e:  ldloc 9

	IL_0312:  nop 
	IL_0313:  nop 
	IL_0314:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0319:  newobj instance void class dylan.NET.Tokenizer.Lexer.Line::'.ctor'()
	IL_031e:  stloc 2

	IL_0322:  nop 
	IL_0323:  nop 
	IL_0324:  ldloc 2

	IL_0328:  nop 
	IL_0329:  nop 
	IL_032a:  ldloc 1

	IL_032e:  nop 
	IL_032f:  nop 
	IL_0330:  ldloc 8

	IL_0334:  nop 
	IL_0335:  nop 
	IL_0336:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Lexer.Line::Analyze(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, string)
	IL_033b:  stloc 1

	IL_033f:  nop 
	IL_0340:  nop 
	IL_0341:  ldloc 1

	IL_0345:  nop 
	IL_0346:  nop 
	IL_0347:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_034c:  ldlen 
	IL_034d:  conv.i4 
	IL_034e:  stloc 10

	IL_0352:  nop 
	IL_0353:  nop 
	IL_0354:  ldloc 10

	IL_0358:  nop 
	IL_0359:  nop 
	IL_035a:  ldc.i4 0
	IL_035f:  beq IL_037f

	IL_0364:  br IL_0369

	IL_0369:  ldloc 0

	IL_036d:  nop 
	IL_036e:  nop 
	IL_036f:  ldloc 1

	IL_0373:  nop 
	IL_0374:  nop 
	IL_0375:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::AddStmt(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt)
	IL_037a:  br IL_0384

	IL_037f:  br IL_0384

	IL_0384:  br IL_0398

	IL_0389:  br IL_0398

	IL_038e:  br IL_00dd

	IL_0393:  br IL_0398

	IL_0398:  ldloc 3

	IL_039c:  nop 
	IL_039d:  nop 
	IL_039e:  callvirt instance void class [mscorlib]System.IO.StreamReader::Close()
	IL_03a3:  ldloc 0

	IL_03a7:  nop 
	IL_03a8:  nop 
	IL_03a9:  ret 
    } // end of method Lexer::Analyze

    // method line 6
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet AnalyzeString (string str)  cil managed 
    {
        // Method begins at RVA 0x3a2c
	// Code size 938 (0x3aa)
	.maxstack 28
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt	V_1,
		class dylan.NET.Tokenizer.Lexer.Line	V_2,
		class [mscorlib]System.IO.StringReader	V_3,
		bool	V_4,
		bool	V_5,
		bool	V_6,
		bool	V_7,
		string	V_8,
		int32	V_9,
		int32	V_10,
		int32	V_11,
		string	V_12,
		char	V_13,
		int32	V_14)
	IL_0000:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::'.ctor'()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldnull 
	IL_000c:  stloc 1

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldnull 
	IL_0013:  stloc 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldarg 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  newobj instance void class [mscorlib]System.IO.StringReader::'.ctor'(string)
	IL_0024:  stloc 3

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldc.i4 0
	IL_002f:  stloc 4

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  ldc.i4 0
	IL_003a:  stloc 5

	IL_003e:  nop 
	IL_003f:  nop 
	IL_0040:  ldc.i4 0
	IL_0045:  stloc 6

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  ldc.i4 0
	IL_0050:  stloc 7

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldstr ""
	IL_005b:  stloc 8

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  ldc.i4 0
	IL_0066:  stloc 9

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldc.i4 -1
	IL_0071:  stloc 10

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 0
	IL_007c:  stloc 11

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldstr ""
	IL_0087:  stloc 12

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldstr "a"
	IL_0092:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0097:  stloc 13

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldc.i4 0
	IL_00a2:  stloc 14

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 3

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  callvirt instance int32 class [mscorlib]System.IO.StringReader::Peek()
	IL_00b3:  stloc 11

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 11

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldc.i4 0
	IL_00c4:  blt IL_00ce

	IL_00c9:  br IL_00d8

	IL_00ce:  br IL_0398

	IL_00d3:  br IL_00dd

	IL_00d8:  br IL_00dd

	IL_00dd:  ldloc 3

	IL_00e1:  nop 
	IL_00e2:  nop 
	IL_00e3:  callvirt instance int32 class [mscorlib]System.IO.StringReader::Read()
	IL_00e8:  stloc 11

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  ldloc 11

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  call char class [mscorlib]System.Convert::ToChar(int32)
	IL_00f9:  stloc 13

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  ldloc 13

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  call string class [mscorlib]System.Convert::ToString(char)
	IL_010a:  stloc 12

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ldloc 12

	IL_0114:  nop 
	IL_0115:  nop 
	IL_0116:  ldsfld string [dnu]dylan.NET.Utils.Constants::cr
	IL_011b:  call int32 string::Compare(string, string)
	IL_0120:  stloc 14

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  ldloc 14

	IL_012a:  nop 
	IL_012b:  nop 
	IL_012c:  ldc.i4 0
	IL_0131:  beq IL_013b

	IL_0136:  br IL_014b

	IL_013b:  ldc.i4 1
	IL_0140:  stloc 4

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  br IL_0150

	IL_014b:  br IL_0150

	IL_0150:  ldloc 12

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldsfld string [dnu]dylan.NET.Utils.Constants::lf
	IL_015b:  call int32 string::Compare(string, string)
	IL_0160:  stloc 14

	IL_0164:  nop 
	IL_0165:  nop 
	IL_0166:  ldloc 14

	IL_016a:  nop 
	IL_016b:  nop 
	IL_016c:  ldc.i4 0
	IL_0171:  beq IL_017b

	IL_0176:  br IL_018b

	IL_017b:  ldc.i4 1
	IL_0180:  stloc 5

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  br IL_0190

	IL_018b:  br IL_0190

	IL_0190:  ldloc 4

	IL_0194:  nop 
	IL_0195:  nop 
	IL_0196:  ldloc 5

	IL_019a:  nop 
	IL_019b:  nop 
	IL_019c:  and 
	IL_019d:  stloc 6

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  ldloc 4

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldloc 5

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  or 
	IL_01b0:  stloc 7

	IL_01b4:  nop 
	IL_01b5:  nop 
	IL_01b6:  ldloc 7

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  ldc.i4 0
	IL_01c1:  beq IL_01cb

	IL_01c6:  br IL_01e7

	IL_01cb:  ldloc 8

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  ldloc 12

	IL_01d5:  nop 
	IL_01d6:  nop 
	IL_01d7:  call string string::Concat(string, string)
	IL_01dc:  stloc 8

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  br IL_02c5

	IL_01e7:  ldloc 5

	IL_01eb:  nop 
	IL_01ec:  nop 
	IL_01ed:  ldc.i4 1
	IL_01f2:  beq IL_01fc

	IL_01f7:  br IL_02bb

	IL_01fc:  ldloc 9

	IL_0200:  nop 
	IL_0201:  nop 
	IL_0202:  ldc.i4 1
	IL_0207:  add 
	IL_0208:  stloc 9

	IL_020c:  nop 
	IL_020d:  nop 
	IL_020e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0213:  stloc 1

	IL_0217:  nop 
	IL_0218:  nop 
	IL_0219:  ldloc 1

	IL_021d:  nop 
	IL_021e:  nop 
	IL_021f:  ldloc 9

	IL_0223:  nop 
	IL_0224:  nop 
	IL_0225:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_022a:  newobj instance void class dylan.NET.Tokenizer.Lexer.Line::'.ctor'()
	IL_022f:  stloc 2

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  ldloc 2

	IL_0239:  nop 
	IL_023a:  nop 
	IL_023b:  ldloc 1

	IL_023f:  nop 
	IL_0240:  nop 
	IL_0241:  ldloc 8

	IL_0245:  nop 
	IL_0246:  nop 
	IL_0247:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Lexer.Line::Analyze(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, string)
	IL_024c:  stloc 1

	IL_0250:  nop 
	IL_0251:  nop 
	IL_0252:  ldloc 1

	IL_0256:  nop 
	IL_0257:  nop 
	IL_0258:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_025d:  ldlen 
	IL_025e:  conv.i4 
	IL_025f:  stloc 10

	IL_0263:  nop 
	IL_0264:  nop 
	IL_0265:  ldloc 10

	IL_0269:  nop 
	IL_026a:  nop 
	IL_026b:  ldc.i4 0
	IL_0270:  beq IL_0290

	IL_0275:  br IL_027a

	IL_027a:  ldloc 0

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  ldloc 1

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::AddStmt(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt)
	IL_028b:  br IL_0295

	IL_0290:  br IL_0295

	IL_0295:  ldstr ""
	IL_029a:  stloc 8

	IL_029e:  nop 
	IL_029f:  nop 
	IL_02a0:  ldc.i4 0
	IL_02a5:  stloc 4

	IL_02a9:  nop 
	IL_02aa:  nop 
	IL_02ab:  ldc.i4 0
	IL_02b0:  stloc 5

	IL_02b4:  nop 
	IL_02b5:  nop 
	IL_02b6:  br IL_02c0

	IL_02bb:  br IL_02c0

	IL_02c0:  br IL_02c5

	IL_02c5:  ldloc 3

	IL_02c9:  nop 
	IL_02ca:  nop 
	IL_02cb:  callvirt instance int32 class [mscorlib]System.IO.StringReader::Peek()
	IL_02d0:  stloc 11

	IL_02d4:  nop 
	IL_02d5:  nop 
	IL_02d6:  ldloc 11

	IL_02da:  nop 
	IL_02db:  nop 
	IL_02dc:  ldc.i4 -1
	IL_02e1:  beq IL_02eb

	IL_02e6:  br IL_038e

	IL_02eb:  ldloc 9

	IL_02ef:  nop 
	IL_02f0:  nop 
	IL_02f1:  ldc.i4 1
	IL_02f6:  add 
	IL_02f7:  stloc 9

	IL_02fb:  nop 
	IL_02fc:  nop 
	IL_02fd:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0302:  stloc 1

	IL_0306:  nop 
	IL_0307:  nop 
	IL_0308:  ldloc 1

	IL_030c:  nop 
	IL_030d:  nop 
	IL_030e:  ldloc 9

	IL_0312:  nop 
	IL_0313:  nop 
	IL_0314:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0319:  newobj instance void class dylan.NET.Tokenizer.Lexer.Line::'.ctor'()
	IL_031e:  stloc 2

	IL_0322:  nop 
	IL_0323:  nop 
	IL_0324:  ldloc 2

	IL_0328:  nop 
	IL_0329:  nop 
	IL_032a:  ldloc 1

	IL_032e:  nop 
	IL_032f:  nop 
	IL_0330:  ldloc 8

	IL_0334:  nop 
	IL_0335:  nop 
	IL_0336:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Lexer.Line::Analyze(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, string)
	IL_033b:  stloc 1

	IL_033f:  nop 
	IL_0340:  nop 
	IL_0341:  ldloc 1

	IL_0345:  nop 
	IL_0346:  nop 
	IL_0347:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_034c:  ldlen 
	IL_034d:  conv.i4 
	IL_034e:  stloc 10

	IL_0352:  nop 
	IL_0353:  nop 
	IL_0354:  ldloc 10

	IL_0358:  nop 
	IL_0359:  nop 
	IL_035a:  ldc.i4 0
	IL_035f:  beq IL_037f

	IL_0364:  br IL_0369

	IL_0369:  ldloc 0

	IL_036d:  nop 
	IL_036e:  nop 
	IL_036f:  ldloc 1

	IL_0373:  nop 
	IL_0374:  nop 
	IL_0375:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::AddStmt(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt)
	IL_037a:  br IL_0384

	IL_037f:  br IL_0384

	IL_0384:  br IL_0398

	IL_0389:  br IL_0398

	IL_038e:  br IL_00dd

	IL_0393:  br IL_0398

	IL_0398:  ldloc 3

	IL_039c:  nop 
	IL_039d:  nop 
	IL_039e:  callvirt instance void class [mscorlib]System.IO.StringReader::Close()
	IL_03a3:  ldloc 0

	IL_03a7:  nop 
	IL_03a8:  nop 
	IL_03a9:  ret 
    } // end of method Lexer::AnalyzeString

    // method line 7
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3de4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Lexer::.ctor

  } // end of class dylan.NET.Tokenizer.Lexer.Lexer
}

