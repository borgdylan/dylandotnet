.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern System
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern dnu
{
  .ver 11:2:8:5
}
.assembly 'dnr'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 35 00 00 ) // ...11.2.8.5..

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (01 00 03 64 6E 72 00 00 ) // ...dnr..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (01 00 03 64 6E 72 00 00 ) // ...dnr..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (01 00 03 64 6E 72 00 00 ) // ...dnr..

  .hash algorithm 0x00008004
  .ver  11:2:8:5
}

.module dnr.dll // GUID = {F432366C-2B5C-4AEE-9797-E3EBA965617B}


.namespace dylan.NET.Reflection
{
  .class public auto ansi InstructionHelper
  	extends [mscorlib]System.Object
  {

    // method line 1
    .method public static 
           default bool compStr (string s1, string s2)  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 65 (0x41)
	.maxstack 4
	.locals init (
		int32	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  call int32 string::Compare(string, string)
	IL_0011:  stloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldc.i4 0
	IL_0022:  beq IL_002c

	IL_0027:  br IL_0036

	IL_002c:  ldc.i4 1
	IL_0031:  br IL_0040

	IL_0036:  ldc.i4 0
	IL_003b:  br IL_0040

	IL_0040:  ret 
    } // end of method InstructionHelper::compStr

    // method line 2
    .method public static 
           default valuetype [mscorlib]System.Reflection.Emit.OpCode getOPCode (string code)  cil managed 
    {
        // Method begins at RVA 0x20a0
	// Code size 10349 (0x286d)
	.maxstack 493
	.locals init (
		bool	V_0)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldarg 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldstr "add"
	IL_0016:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_001b:  stloc 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 0

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 1
	IL_002c:  beq IL_0036

	IL_0031:  br IL_0045

	IL_0036:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Add
	IL_003b:  br IL_286c

	IL_0040:  br IL_004a

	IL_0045:  br IL_004a

	IL_004a:  ldarg 0

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldstr "add.ovf"
	IL_0055:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_005a:  stloc 0

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 1
	IL_006b:  beq IL_0075

	IL_0070:  br IL_0084

	IL_0075:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Add_Ovf
	IL_007a:  br IL_286c

	IL_007f:  br IL_0089

	IL_0084:  br IL_0089

	IL_0089:  ldarg 0

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldstr "and"
	IL_0094:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0099:  stloc 0

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldloc 0

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldc.i4 1
	IL_00aa:  beq IL_00b4

	IL_00af:  br IL_00c3

	IL_00b4:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::And
	IL_00b9:  br IL_286c

	IL_00be:  br IL_00c8

	IL_00c3:  br IL_00c8

	IL_00c8:  ldarg 0

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  ldstr "beq"
	IL_00d3:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_00d8:  stloc 0

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  ldloc 0

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  ldc.i4 1
	IL_00e9:  beq IL_00f3

	IL_00ee:  br IL_0102

	IL_00f3:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Beq
	IL_00f8:  br IL_286c

	IL_00fd:  br IL_0107

	IL_0102:  br IL_0107

	IL_0107:  ldarg 0

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldstr "bge"
	IL_0112:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0117:  stloc 0

	IL_011b:  nop 
	IL_011c:  nop 
	IL_011d:  ldloc 0

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldc.i4 1
	IL_0128:  beq IL_0132

	IL_012d:  br IL_0141

	IL_0132:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Bge
	IL_0137:  br IL_286c

	IL_013c:  br IL_0146

	IL_0141:  br IL_0146

	IL_0146:  ldarg 0

	IL_014a:  nop 
	IL_014b:  nop 
	IL_014c:  ldstr "bgt"
	IL_0151:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0156:  stloc 0

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldloc 0

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldc.i4 1
	IL_0167:  beq IL_0171

	IL_016c:  br IL_0180

	IL_0171:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Bgt
	IL_0176:  br IL_286c

	IL_017b:  br IL_0185

	IL_0180:  br IL_0185

	IL_0185:  ldarg 0

	IL_0189:  nop 
	IL_018a:  nop 
	IL_018b:  ldstr "ble"
	IL_0190:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0195:  stloc 0

	IL_0199:  nop 
	IL_019a:  nop 
	IL_019b:  ldloc 0

	IL_019f:  nop 
	IL_01a0:  nop 
	IL_01a1:  ldc.i4 1
	IL_01a6:  beq IL_01b0

	IL_01ab:  br IL_01bf

	IL_01b0:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ble
	IL_01b5:  br IL_286c

	IL_01ba:  br IL_01c4

	IL_01bf:  br IL_01c4

	IL_01c4:  ldarg 0

	IL_01c8:  nop 
	IL_01c9:  nop 
	IL_01ca:  ldstr "blt"
	IL_01cf:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_01d4:  stloc 0

	IL_01d8:  nop 
	IL_01d9:  nop 
	IL_01da:  ldloc 0

	IL_01de:  nop 
	IL_01df:  nop 
	IL_01e0:  ldc.i4 1
	IL_01e5:  beq IL_01ef

	IL_01ea:  br IL_01fe

	IL_01ef:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Blt
	IL_01f4:  br IL_286c

	IL_01f9:  br IL_0203

	IL_01fe:  br IL_0203

	IL_0203:  ldarg 0

	IL_0207:  nop 
	IL_0208:  nop 
	IL_0209:  ldstr "box"
	IL_020e:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0213:  stloc 0

	IL_0217:  nop 
	IL_0218:  nop 
	IL_0219:  ldloc 0

	IL_021d:  nop 
	IL_021e:  nop 
	IL_021f:  ldc.i4 1
	IL_0224:  beq IL_022e

	IL_0229:  br IL_023d

	IL_022e:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Box
	IL_0233:  br IL_286c

	IL_0238:  br IL_0242

	IL_023d:  br IL_0242

	IL_0242:  ldarg 0

	IL_0246:  nop 
	IL_0247:  nop 
	IL_0248:  ldstr "br"
	IL_024d:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0252:  stloc 0

	IL_0256:  nop 
	IL_0257:  nop 
	IL_0258:  ldloc 0

	IL_025c:  nop 
	IL_025d:  nop 
	IL_025e:  ldc.i4 1
	IL_0263:  beq IL_026d

	IL_0268:  br IL_027c

	IL_026d:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Br
	IL_0272:  br IL_286c

	IL_0277:  br IL_0281

	IL_027c:  br IL_0281

	IL_0281:  ldarg 0

	IL_0285:  nop 
	IL_0286:  nop 
	IL_0287:  ldstr "break"
	IL_028c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0291:  stloc 0

	IL_0295:  nop 
	IL_0296:  nop 
	IL_0297:  ldloc 0

	IL_029b:  nop 
	IL_029c:  nop 
	IL_029d:  ldc.i4 1
	IL_02a2:  beq IL_02ac

	IL_02a7:  br IL_02bb

	IL_02ac:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Break
	IL_02b1:  br IL_286c

	IL_02b6:  br IL_02c0

	IL_02bb:  br IL_02c0

	IL_02c0:  ldarg 0

	IL_02c4:  nop 
	IL_02c5:  nop 
	IL_02c6:  ldstr "brfalse"
	IL_02cb:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_02d0:  stloc 0

	IL_02d4:  nop 
	IL_02d5:  nop 
	IL_02d6:  ldloc 0

	IL_02da:  nop 
	IL_02db:  nop 
	IL_02dc:  ldc.i4 1
	IL_02e1:  beq IL_02eb

	IL_02e6:  br IL_02fa

	IL_02eb:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Brfalse
	IL_02f0:  br IL_286c

	IL_02f5:  br IL_02ff

	IL_02fa:  br IL_02ff

	IL_02ff:  ldarg 0

	IL_0303:  nop 
	IL_0304:  nop 
	IL_0305:  ldstr "brtrue"
	IL_030a:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_030f:  stloc 0

	IL_0313:  nop 
	IL_0314:  nop 
	IL_0315:  ldloc 0

	IL_0319:  nop 
	IL_031a:  nop 
	IL_031b:  ldc.i4 1
	IL_0320:  beq IL_032a

	IL_0325:  br IL_0339

	IL_032a:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Brtrue
	IL_032f:  br IL_286c

	IL_0334:  br IL_033e

	IL_0339:  br IL_033e

	IL_033e:  ldarg 0

	IL_0342:  nop 
	IL_0343:  nop 
	IL_0344:  ldstr "call"
	IL_0349:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_034e:  stloc 0

	IL_0352:  nop 
	IL_0353:  nop 
	IL_0354:  ldloc 0

	IL_0358:  nop 
	IL_0359:  nop 
	IL_035a:  ldc.i4 1
	IL_035f:  beq IL_0369

	IL_0364:  br IL_0378

	IL_0369:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Call
	IL_036e:  br IL_286c

	IL_0373:  br IL_037d

	IL_0378:  br IL_037d

	IL_037d:  ldarg 0

	IL_0381:  nop 
	IL_0382:  nop 
	IL_0383:  ldstr "callvirt"
	IL_0388:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_038d:  stloc 0

	IL_0391:  nop 
	IL_0392:  nop 
	IL_0393:  ldloc 0

	IL_0397:  nop 
	IL_0398:  nop 
	IL_0399:  ldc.i4 1
	IL_039e:  beq IL_03a8

	IL_03a3:  br IL_03b7

	IL_03a8:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Callvirt
	IL_03ad:  br IL_286c

	IL_03b2:  br IL_03bc

	IL_03b7:  br IL_03bc

	IL_03bc:  ldarg 0

	IL_03c0:  nop 
	IL_03c1:  nop 
	IL_03c2:  ldstr "castclass"
	IL_03c7:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_03cc:  stloc 0

	IL_03d0:  nop 
	IL_03d1:  nop 
	IL_03d2:  ldloc 0

	IL_03d6:  nop 
	IL_03d7:  nop 
	IL_03d8:  ldc.i4 1
	IL_03dd:  beq IL_03e7

	IL_03e2:  br IL_03f6

	IL_03e7:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Castclass
	IL_03ec:  br IL_286c

	IL_03f1:  br IL_03fb

	IL_03f6:  br IL_03fb

	IL_03fb:  ldarg 0

	IL_03ff:  nop 
	IL_0400:  nop 
	IL_0401:  ldstr "ceq"
	IL_0406:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_040b:  stloc 0

	IL_040f:  nop 
	IL_0410:  nop 
	IL_0411:  ldloc 0

	IL_0415:  nop 
	IL_0416:  nop 
	IL_0417:  ldc.i4 1
	IL_041c:  beq IL_0426

	IL_0421:  br IL_0435

	IL_0426:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ceq
	IL_042b:  br IL_286c

	IL_0430:  br IL_043a

	IL_0435:  br IL_043a

	IL_043a:  ldarg 0

	IL_043e:  nop 
	IL_043f:  nop 
	IL_0440:  ldstr "clt"
	IL_0445:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_044a:  stloc 0

	IL_044e:  nop 
	IL_044f:  nop 
	IL_0450:  ldloc 0

	IL_0454:  nop 
	IL_0455:  nop 
	IL_0456:  ldc.i4 1
	IL_045b:  beq IL_0465

	IL_0460:  br IL_0474

	IL_0465:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Clt
	IL_046a:  br IL_286c

	IL_046f:  br IL_0479

	IL_0474:  br IL_0479

	IL_0479:  ldarg 0

	IL_047d:  nop 
	IL_047e:  nop 
	IL_047f:  ldstr "cgt"
	IL_0484:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0489:  stloc 0

	IL_048d:  nop 
	IL_048e:  nop 
	IL_048f:  ldloc 0

	IL_0493:  nop 
	IL_0494:  nop 
	IL_0495:  ldc.i4 1
	IL_049a:  beq IL_04a4

	IL_049f:  br IL_04b3

	IL_04a4:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Cgt
	IL_04a9:  br IL_286c

	IL_04ae:  br IL_04b8

	IL_04b3:  br IL_04b8

	IL_04b8:  ldarg 0

	IL_04bc:  nop 
	IL_04bd:  nop 
	IL_04be:  ldstr "constrained."
	IL_04c3:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_04c8:  stloc 0

	IL_04cc:  nop 
	IL_04cd:  nop 
	IL_04ce:  ldloc 0

	IL_04d2:  nop 
	IL_04d3:  nop 
	IL_04d4:  ldc.i4 1
	IL_04d9:  beq IL_04e3

	IL_04de:  br IL_04f2

	IL_04e3:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Constrained
	IL_04e8:  br IL_286c

	IL_04ed:  br IL_04f7

	IL_04f2:  br IL_04f7

	IL_04f7:  ldarg 0

	IL_04fb:  nop 
	IL_04fc:  nop 
	IL_04fd:  ldstr "conv.i"
	IL_0502:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0507:  stloc 0

	IL_050b:  nop 
	IL_050c:  nop 
	IL_050d:  ldloc 0

	IL_0511:  nop 
	IL_0512:  nop 
	IL_0513:  ldc.i4 1
	IL_0518:  beq IL_0522

	IL_051d:  br IL_0531

	IL_0522:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_I
	IL_0527:  br IL_286c

	IL_052c:  br IL_0536

	IL_0531:  br IL_0536

	IL_0536:  ldarg 0

	IL_053a:  nop 
	IL_053b:  nop 
	IL_053c:  ldstr "conv.i1"
	IL_0541:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0546:  stloc 0

	IL_054a:  nop 
	IL_054b:  nop 
	IL_054c:  ldloc 0

	IL_0550:  nop 
	IL_0551:  nop 
	IL_0552:  ldc.i4 1
	IL_0557:  beq IL_0561

	IL_055c:  br IL_0570

	IL_0561:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_I1
	IL_0566:  br IL_286c

	IL_056b:  br IL_0575

	IL_0570:  br IL_0575

	IL_0575:  ldarg 0

	IL_0579:  nop 
	IL_057a:  nop 
	IL_057b:  ldstr "conv.i2"
	IL_0580:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0585:  stloc 0

	IL_0589:  nop 
	IL_058a:  nop 
	IL_058b:  ldloc 0

	IL_058f:  nop 
	IL_0590:  nop 
	IL_0591:  ldc.i4 1
	IL_0596:  beq IL_05a0

	IL_059b:  br IL_05af

	IL_05a0:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_I2
	IL_05a5:  br IL_286c

	IL_05aa:  br IL_05b4

	IL_05af:  br IL_05b4

	IL_05b4:  ldarg 0

	IL_05b8:  nop 
	IL_05b9:  nop 
	IL_05ba:  ldstr "conv.i4"
	IL_05bf:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_05c4:  stloc 0

	IL_05c8:  nop 
	IL_05c9:  nop 
	IL_05ca:  ldloc 0

	IL_05ce:  nop 
	IL_05cf:  nop 
	IL_05d0:  ldc.i4 1
	IL_05d5:  beq IL_05df

	IL_05da:  br IL_05ee

	IL_05df:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_I4
	IL_05e4:  br IL_286c

	IL_05e9:  br IL_05f3

	IL_05ee:  br IL_05f3

	IL_05f3:  ldarg 0

	IL_05f7:  nop 
	IL_05f8:  nop 
	IL_05f9:  ldstr "conv.i8"
	IL_05fe:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0603:  stloc 0

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  ldloc 0

	IL_060d:  nop 
	IL_060e:  nop 
	IL_060f:  ldc.i4 1
	IL_0614:  beq IL_061e

	IL_0619:  br IL_062d

	IL_061e:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_I8
	IL_0623:  br IL_286c

	IL_0628:  br IL_0632

	IL_062d:  br IL_0632

	IL_0632:  ldarg 0

	IL_0636:  nop 
	IL_0637:  nop 
	IL_0638:  ldstr "conv.u"
	IL_063d:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0642:  stloc 0

	IL_0646:  nop 
	IL_0647:  nop 
	IL_0648:  ldloc 0

	IL_064c:  nop 
	IL_064d:  nop 
	IL_064e:  ldc.i4 1
	IL_0653:  beq IL_065d

	IL_0658:  br IL_066c

	IL_065d:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_U
	IL_0662:  br IL_286c

	IL_0667:  br IL_0671

	IL_066c:  br IL_0671

	IL_0671:  ldarg 0

	IL_0675:  nop 
	IL_0676:  nop 
	IL_0677:  ldstr "conv.u1"
	IL_067c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0681:  stloc 0

	IL_0685:  nop 
	IL_0686:  nop 
	IL_0687:  ldloc 0

	IL_068b:  nop 
	IL_068c:  nop 
	IL_068d:  ldc.i4 1
	IL_0692:  beq IL_069c

	IL_0697:  br IL_06ab

	IL_069c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_U1
	IL_06a1:  br IL_286c

	IL_06a6:  br IL_06b0

	IL_06ab:  br IL_06b0

	IL_06b0:  ldarg 0

	IL_06b4:  nop 
	IL_06b5:  nop 
	IL_06b6:  ldstr "conv.u2"
	IL_06bb:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_06c0:  stloc 0

	IL_06c4:  nop 
	IL_06c5:  nop 
	IL_06c6:  ldloc 0

	IL_06ca:  nop 
	IL_06cb:  nop 
	IL_06cc:  ldc.i4 1
	IL_06d1:  beq IL_06db

	IL_06d6:  br IL_06ea

	IL_06db:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_U2
	IL_06e0:  br IL_286c

	IL_06e5:  br IL_06ef

	IL_06ea:  br IL_06ef

	IL_06ef:  ldarg 0

	IL_06f3:  nop 
	IL_06f4:  nop 
	IL_06f5:  ldstr "conv.u4"
	IL_06fa:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_06ff:  stloc 0

	IL_0703:  nop 
	IL_0704:  nop 
	IL_0705:  ldloc 0

	IL_0709:  nop 
	IL_070a:  nop 
	IL_070b:  ldc.i4 1
	IL_0710:  beq IL_071a

	IL_0715:  br IL_0729

	IL_071a:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_U4
	IL_071f:  br IL_286c

	IL_0724:  br IL_072e

	IL_0729:  br IL_072e

	IL_072e:  ldarg 0

	IL_0732:  nop 
	IL_0733:  nop 
	IL_0734:  ldstr "conv.u8"
	IL_0739:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_073e:  stloc 0

	IL_0742:  nop 
	IL_0743:  nop 
	IL_0744:  ldloc 0

	IL_0748:  nop 
	IL_0749:  nop 
	IL_074a:  ldc.i4 1
	IL_074f:  beq IL_0759

	IL_0754:  br IL_0768

	IL_0759:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_U8
	IL_075e:  br IL_286c

	IL_0763:  br IL_076d

	IL_0768:  br IL_076d

	IL_076d:  ldarg 0

	IL_0771:  nop 
	IL_0772:  nop 
	IL_0773:  ldstr "conv.ovf.i"
	IL_0778:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_077d:  stloc 0

	IL_0781:  nop 
	IL_0782:  nop 
	IL_0783:  ldloc 0

	IL_0787:  nop 
	IL_0788:  nop 
	IL_0789:  ldc.i4 1
	IL_078e:  beq IL_0798

	IL_0793:  br IL_07a7

	IL_0798:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_I
	IL_079d:  br IL_286c

	IL_07a2:  br IL_07ac

	IL_07a7:  br IL_07ac

	IL_07ac:  ldarg 0

	IL_07b0:  nop 
	IL_07b1:  nop 
	IL_07b2:  ldstr "conv.ovf.i1"
	IL_07b7:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_07bc:  stloc 0

	IL_07c0:  nop 
	IL_07c1:  nop 
	IL_07c2:  ldloc 0

	IL_07c6:  nop 
	IL_07c7:  nop 
	IL_07c8:  ldc.i4 1
	IL_07cd:  beq IL_07d7

	IL_07d2:  br IL_07e6

	IL_07d7:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_I1
	IL_07dc:  br IL_286c

	IL_07e1:  br IL_07eb

	IL_07e6:  br IL_07eb

	IL_07eb:  ldarg 0

	IL_07ef:  nop 
	IL_07f0:  nop 
	IL_07f1:  ldstr "conv.ovf.i2"
	IL_07f6:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_07fb:  stloc 0

	IL_07ff:  nop 
	IL_0800:  nop 
	IL_0801:  ldloc 0

	IL_0805:  nop 
	IL_0806:  nop 
	IL_0807:  ldc.i4 1
	IL_080c:  beq IL_0816

	IL_0811:  br IL_0825

	IL_0816:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_I2
	IL_081b:  br IL_286c

	IL_0820:  br IL_082a

	IL_0825:  br IL_082a

	IL_082a:  ldarg 0

	IL_082e:  nop 
	IL_082f:  nop 
	IL_0830:  ldstr "conv.ovf.i4"
	IL_0835:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_083a:  stloc 0

	IL_083e:  nop 
	IL_083f:  nop 
	IL_0840:  ldloc 0

	IL_0844:  nop 
	IL_0845:  nop 
	IL_0846:  ldc.i4 1
	IL_084b:  beq IL_0855

	IL_0850:  br IL_0864

	IL_0855:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_I4
	IL_085a:  br IL_286c

	IL_085f:  br IL_0869

	IL_0864:  br IL_0869

	IL_0869:  ldarg 0

	IL_086d:  nop 
	IL_086e:  nop 
	IL_086f:  ldstr "conv.ovf.i8"
	IL_0874:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0879:  stloc 0

	IL_087d:  nop 
	IL_087e:  nop 
	IL_087f:  ldloc 0

	IL_0883:  nop 
	IL_0884:  nop 
	IL_0885:  ldc.i4 1
	IL_088a:  beq IL_0894

	IL_088f:  br IL_08a3

	IL_0894:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_I8
	IL_0899:  br IL_286c

	IL_089e:  br IL_08a8

	IL_08a3:  br IL_08a8

	IL_08a8:  ldarg 0

	IL_08ac:  nop 
	IL_08ad:  nop 
	IL_08ae:  ldstr "conv.ovf.u"
	IL_08b3:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_08b8:  stloc 0

	IL_08bc:  nop 
	IL_08bd:  nop 
	IL_08be:  ldloc 0

	IL_08c2:  nop 
	IL_08c3:  nop 
	IL_08c4:  ldc.i4 1
	IL_08c9:  beq IL_08d3

	IL_08ce:  br IL_08e2

	IL_08d3:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_U
	IL_08d8:  br IL_286c

	IL_08dd:  br IL_08e7

	IL_08e2:  br IL_08e7

	IL_08e7:  ldarg 0

	IL_08eb:  nop 
	IL_08ec:  nop 
	IL_08ed:  ldstr "conv.ovf.u1"
	IL_08f2:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_08f7:  stloc 0

	IL_08fb:  nop 
	IL_08fc:  nop 
	IL_08fd:  ldloc 0

	IL_0901:  nop 
	IL_0902:  nop 
	IL_0903:  ldc.i4 1
	IL_0908:  beq IL_0912

	IL_090d:  br IL_0921

	IL_0912:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_U1
	IL_0917:  br IL_286c

	IL_091c:  br IL_0926

	IL_0921:  br IL_0926

	IL_0926:  ldarg 0

	IL_092a:  nop 
	IL_092b:  nop 
	IL_092c:  ldstr "conv.ovf.u2"
	IL_0931:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0936:  stloc 0

	IL_093a:  nop 
	IL_093b:  nop 
	IL_093c:  ldloc 0

	IL_0940:  nop 
	IL_0941:  nop 
	IL_0942:  ldc.i4 1
	IL_0947:  beq IL_0951

	IL_094c:  br IL_0960

	IL_0951:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_U2
	IL_0956:  br IL_286c

	IL_095b:  br IL_0965

	IL_0960:  br IL_0965

	IL_0965:  ldarg 0

	IL_0969:  nop 
	IL_096a:  nop 
	IL_096b:  ldstr "conv.ovf.u4"
	IL_0970:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0975:  stloc 0

	IL_0979:  nop 
	IL_097a:  nop 
	IL_097b:  ldloc 0

	IL_097f:  nop 
	IL_0980:  nop 
	IL_0981:  ldc.i4 1
	IL_0986:  beq IL_0990

	IL_098b:  br IL_099f

	IL_0990:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_U4
	IL_0995:  br IL_286c

	IL_099a:  br IL_09a4

	IL_099f:  br IL_09a4

	IL_09a4:  ldarg 0

	IL_09a8:  nop 
	IL_09a9:  nop 
	IL_09aa:  ldstr "conv.ovf.u8"
	IL_09af:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_09b4:  stloc 0

	IL_09b8:  nop 
	IL_09b9:  nop 
	IL_09ba:  ldloc 0

	IL_09be:  nop 
	IL_09bf:  nop 
	IL_09c0:  ldc.i4 1
	IL_09c5:  beq IL_09cf

	IL_09ca:  br IL_09de

	IL_09cf:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_Ovf_U8
	IL_09d4:  br IL_286c

	IL_09d9:  br IL_09e3

	IL_09de:  br IL_09e3

	IL_09e3:  ldarg 0

	IL_09e7:  nop 
	IL_09e8:  nop 
	IL_09e9:  ldstr "conv.r4"
	IL_09ee:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_09f3:  stloc 0

	IL_09f7:  nop 
	IL_09f8:  nop 
	IL_09f9:  ldloc 0

	IL_09fd:  nop 
	IL_09fe:  nop 
	IL_09ff:  ldc.i4 1
	IL_0a04:  beq IL_0a0e

	IL_0a09:  br IL_0a1d

	IL_0a0e:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_R4
	IL_0a13:  br IL_286c

	IL_0a18:  br IL_0a22

	IL_0a1d:  br IL_0a22

	IL_0a22:  ldarg 0

	IL_0a26:  nop 
	IL_0a27:  nop 
	IL_0a28:  ldstr "conv.r8"
	IL_0a2d:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0a32:  stloc 0

	IL_0a36:  nop 
	IL_0a37:  nop 
	IL_0a38:  ldloc 0

	IL_0a3c:  nop 
	IL_0a3d:  nop 
	IL_0a3e:  ldc.i4 1
	IL_0a43:  beq IL_0a4d

	IL_0a48:  br IL_0a5c

	IL_0a4d:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Conv_R8
	IL_0a52:  br IL_286c

	IL_0a57:  br IL_0a61

	IL_0a5c:  br IL_0a61

	IL_0a61:  ldarg 0

	IL_0a65:  nop 
	IL_0a66:  nop 
	IL_0a67:  ldstr "div"
	IL_0a6c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0a71:  stloc 0

	IL_0a75:  nop 
	IL_0a76:  nop 
	IL_0a77:  ldloc 0

	IL_0a7b:  nop 
	IL_0a7c:  nop 
	IL_0a7d:  ldc.i4 1
	IL_0a82:  beq IL_0a8c

	IL_0a87:  br IL_0a9b

	IL_0a8c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Div
	IL_0a91:  br IL_286c

	IL_0a96:  br IL_0aa0

	IL_0a9b:  br IL_0aa0

	IL_0aa0:  ldarg 0

	IL_0aa4:  nop 
	IL_0aa5:  nop 
	IL_0aa6:  ldstr "dup"
	IL_0aab:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0ab0:  stloc 0

	IL_0ab4:  nop 
	IL_0ab5:  nop 
	IL_0ab6:  ldloc 0

	IL_0aba:  nop 
	IL_0abb:  nop 
	IL_0abc:  ldc.i4 1
	IL_0ac1:  beq IL_0acb

	IL_0ac6:  br IL_0ada

	IL_0acb:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Dup
	IL_0ad0:  br IL_286c

	IL_0ad5:  br IL_0adf

	IL_0ada:  br IL_0adf

	IL_0adf:  ldarg 0

	IL_0ae3:  nop 
	IL_0ae4:  nop 
	IL_0ae5:  ldstr "isinst"
	IL_0aea:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0aef:  stloc 0

	IL_0af3:  nop 
	IL_0af4:  nop 
	IL_0af5:  ldloc 0

	IL_0af9:  nop 
	IL_0afa:  nop 
	IL_0afb:  ldc.i4 1
	IL_0b00:  beq IL_0b0a

	IL_0b05:  br IL_0b19

	IL_0b0a:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Isinst
	IL_0b0f:  br IL_286c

	IL_0b14:  br IL_0b1e

	IL_0b19:  br IL_0b1e

	IL_0b1e:  ldarg 0

	IL_0b22:  nop 
	IL_0b23:  nop 
	IL_0b24:  ldstr "ldarg"
	IL_0b29:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0b2e:  stloc 0

	IL_0b32:  nop 
	IL_0b33:  nop 
	IL_0b34:  ldloc 0

	IL_0b38:  nop 
	IL_0b39:  nop 
	IL_0b3a:  ldc.i4 1
	IL_0b3f:  beq IL_0b49

	IL_0b44:  br IL_0b58

	IL_0b49:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarg
	IL_0b4e:  br IL_286c

	IL_0b53:  br IL_0b5d

	IL_0b58:  br IL_0b5d

	IL_0b5d:  ldarg 0

	IL_0b61:  nop 
	IL_0b62:  nop 
	IL_0b63:  ldstr "ldarga"
	IL_0b68:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0b6d:  stloc 0

	IL_0b71:  nop 
	IL_0b72:  nop 
	IL_0b73:  ldloc 0

	IL_0b77:  nop 
	IL_0b78:  nop 
	IL_0b79:  ldc.i4 1
	IL_0b7e:  beq IL_0b88

	IL_0b83:  br IL_0b97

	IL_0b88:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarga
	IL_0b8d:  br IL_286c

	IL_0b92:  br IL_0b9c

	IL_0b97:  br IL_0b9c

	IL_0b9c:  ldarg 0

	IL_0ba0:  nop 
	IL_0ba1:  nop 
	IL_0ba2:  ldstr "ldarg.s"
	IL_0ba7:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0bac:  stloc 0

	IL_0bb0:  nop 
	IL_0bb1:  nop 
	IL_0bb2:  ldloc 0

	IL_0bb6:  nop 
	IL_0bb7:  nop 
	IL_0bb8:  ldc.i4 1
	IL_0bbd:  beq IL_0bc7

	IL_0bc2:  br IL_0bd6

	IL_0bc7:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarg_S
	IL_0bcc:  br IL_286c

	IL_0bd1:  br IL_0bdb

	IL_0bd6:  br IL_0bdb

	IL_0bdb:  ldarg 0

	IL_0bdf:  nop 
	IL_0be0:  nop 
	IL_0be1:  ldstr "ldarga.s"
	IL_0be6:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0beb:  stloc 0

	IL_0bef:  nop 
	IL_0bf0:  nop 
	IL_0bf1:  ldloc 0

	IL_0bf5:  nop 
	IL_0bf6:  nop 
	IL_0bf7:  ldc.i4 1
	IL_0bfc:  beq IL_0c06

	IL_0c01:  br IL_0c15

	IL_0c06:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarga_S
	IL_0c0b:  br IL_286c

	IL_0c10:  br IL_0c1a

	IL_0c15:  br IL_0c1a

	IL_0c1a:  ldarg 0

	IL_0c1e:  nop 
	IL_0c1f:  nop 
	IL_0c20:  ldstr "ldarg.0"
	IL_0c25:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0c2a:  stloc 0

	IL_0c2e:  nop 
	IL_0c2f:  nop 
	IL_0c30:  ldloc 0

	IL_0c34:  nop 
	IL_0c35:  nop 
	IL_0c36:  ldc.i4 1
	IL_0c3b:  beq IL_0c45

	IL_0c40:  br IL_0c54

	IL_0c45:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarg_0
	IL_0c4a:  br IL_286c

	IL_0c4f:  br IL_0c59

	IL_0c54:  br IL_0c59

	IL_0c59:  ldarg 0

	IL_0c5d:  nop 
	IL_0c5e:  nop 
	IL_0c5f:  ldstr "ldarg.1"
	IL_0c64:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0c69:  stloc 0

	IL_0c6d:  nop 
	IL_0c6e:  nop 
	IL_0c6f:  ldloc 0

	IL_0c73:  nop 
	IL_0c74:  nop 
	IL_0c75:  ldc.i4 1
	IL_0c7a:  beq IL_0c84

	IL_0c7f:  br IL_0c93

	IL_0c84:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarg_1
	IL_0c89:  br IL_286c

	IL_0c8e:  br IL_0c98

	IL_0c93:  br IL_0c98

	IL_0c98:  ldarg 0

	IL_0c9c:  nop 
	IL_0c9d:  nop 
	IL_0c9e:  ldstr "ldarg.2"
	IL_0ca3:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0ca8:  stloc 0

	IL_0cac:  nop 
	IL_0cad:  nop 
	IL_0cae:  ldloc 0

	IL_0cb2:  nop 
	IL_0cb3:  nop 
	IL_0cb4:  ldc.i4 1
	IL_0cb9:  beq IL_0cc3

	IL_0cbe:  br IL_0cd2

	IL_0cc3:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarg_2
	IL_0cc8:  br IL_286c

	IL_0ccd:  br IL_0cd7

	IL_0cd2:  br IL_0cd7

	IL_0cd7:  ldarg 0

	IL_0cdb:  nop 
	IL_0cdc:  nop 
	IL_0cdd:  ldstr "ldarg.3"
	IL_0ce2:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0ce7:  stloc 0

	IL_0ceb:  nop 
	IL_0cec:  nop 
	IL_0ced:  ldloc 0

	IL_0cf1:  nop 
	IL_0cf2:  nop 
	IL_0cf3:  ldc.i4 1
	IL_0cf8:  beq IL_0d02

	IL_0cfd:  br IL_0d11

	IL_0d02:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldarg_3
	IL_0d07:  br IL_286c

	IL_0d0c:  br IL_0d16

	IL_0d11:  br IL_0d16

	IL_0d16:  ldarg 0

	IL_0d1a:  nop 
	IL_0d1b:  nop 
	IL_0d1c:  ldstr "ldc.i4"
	IL_0d21:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0d26:  stloc 0

	IL_0d2a:  nop 
	IL_0d2b:  nop 
	IL_0d2c:  ldloc 0

	IL_0d30:  nop 
	IL_0d31:  nop 
	IL_0d32:  ldc.i4 1
	IL_0d37:  beq IL_0d41

	IL_0d3c:  br IL_0d50

	IL_0d41:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4
	IL_0d46:  br IL_286c

	IL_0d4b:  br IL_0d55

	IL_0d50:  br IL_0d55

	IL_0d55:  ldarg 0

	IL_0d59:  nop 
	IL_0d5a:  nop 
	IL_0d5b:  ldstr "ldc.i4.0"
	IL_0d60:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0d65:  stloc 0

	IL_0d69:  nop 
	IL_0d6a:  nop 
	IL_0d6b:  ldloc 0

	IL_0d6f:  nop 
	IL_0d70:  nop 
	IL_0d71:  ldc.i4 1
	IL_0d76:  beq IL_0d80

	IL_0d7b:  br IL_0d8f

	IL_0d80:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_0
	IL_0d85:  br IL_286c

	IL_0d8a:  br IL_0d94

	IL_0d8f:  br IL_0d94

	IL_0d94:  ldarg 0

	IL_0d98:  nop 
	IL_0d99:  nop 
	IL_0d9a:  ldstr "ldc.i4.1"
	IL_0d9f:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0da4:  stloc 0

	IL_0da8:  nop 
	IL_0da9:  nop 
	IL_0daa:  ldloc 0

	IL_0dae:  nop 
	IL_0daf:  nop 
	IL_0db0:  ldc.i4 1
	IL_0db5:  beq IL_0dbf

	IL_0dba:  br IL_0dce

	IL_0dbf:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_1
	IL_0dc4:  br IL_286c

	IL_0dc9:  br IL_0dd3

	IL_0dce:  br IL_0dd3

	IL_0dd3:  ldarg 0

	IL_0dd7:  nop 
	IL_0dd8:  nop 
	IL_0dd9:  ldstr "ldc.i4.2"
	IL_0dde:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0de3:  stloc 0

	IL_0de7:  nop 
	IL_0de8:  nop 
	IL_0de9:  ldloc 0

	IL_0ded:  nop 
	IL_0dee:  nop 
	IL_0def:  ldc.i4 1
	IL_0df4:  beq IL_0dfe

	IL_0df9:  br IL_0e0d

	IL_0dfe:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_2
	IL_0e03:  br IL_286c

	IL_0e08:  br IL_0e12

	IL_0e0d:  br IL_0e12

	IL_0e12:  ldarg 0

	IL_0e16:  nop 
	IL_0e17:  nop 
	IL_0e18:  ldstr "ldc.i4.3"
	IL_0e1d:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0e22:  stloc 0

	IL_0e26:  nop 
	IL_0e27:  nop 
	IL_0e28:  ldloc 0

	IL_0e2c:  nop 
	IL_0e2d:  nop 
	IL_0e2e:  ldc.i4 1
	IL_0e33:  beq IL_0e3d

	IL_0e38:  br IL_0e4c

	IL_0e3d:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_3
	IL_0e42:  br IL_286c

	IL_0e47:  br IL_0e51

	IL_0e4c:  br IL_0e51

	IL_0e51:  ldarg 0

	IL_0e55:  nop 
	IL_0e56:  nop 
	IL_0e57:  ldstr "ldc.i4.4"
	IL_0e5c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0e61:  stloc 0

	IL_0e65:  nop 
	IL_0e66:  nop 
	IL_0e67:  ldloc 0

	IL_0e6b:  nop 
	IL_0e6c:  nop 
	IL_0e6d:  ldc.i4 1
	IL_0e72:  beq IL_0e7c

	IL_0e77:  br IL_0e8b

	IL_0e7c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_4
	IL_0e81:  br IL_286c

	IL_0e86:  br IL_0e90

	IL_0e8b:  br IL_0e90

	IL_0e90:  ldarg 0

	IL_0e94:  nop 
	IL_0e95:  nop 
	IL_0e96:  ldstr "ldc.i4.5"
	IL_0e9b:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0ea0:  stloc 0

	IL_0ea4:  nop 
	IL_0ea5:  nop 
	IL_0ea6:  ldloc 0

	IL_0eaa:  nop 
	IL_0eab:  nop 
	IL_0eac:  ldc.i4 1
	IL_0eb1:  beq IL_0ebb

	IL_0eb6:  br IL_0eca

	IL_0ebb:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_5
	IL_0ec0:  br IL_286c

	IL_0ec5:  br IL_0ecf

	IL_0eca:  br IL_0ecf

	IL_0ecf:  ldarg 0

	IL_0ed3:  nop 
	IL_0ed4:  nop 
	IL_0ed5:  ldstr "ldc.i4.6"
	IL_0eda:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0edf:  stloc 0

	IL_0ee3:  nop 
	IL_0ee4:  nop 
	IL_0ee5:  ldloc 0

	IL_0ee9:  nop 
	IL_0eea:  nop 
	IL_0eeb:  ldc.i4 1
	IL_0ef0:  beq IL_0efa

	IL_0ef5:  br IL_0f09

	IL_0efa:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_6
	IL_0eff:  br IL_286c

	IL_0f04:  br IL_0f0e

	IL_0f09:  br IL_0f0e

	IL_0f0e:  ldarg 0

	IL_0f12:  nop 
	IL_0f13:  nop 
	IL_0f14:  ldstr "ldc.i4.7"
	IL_0f19:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0f1e:  stloc 0

	IL_0f22:  nop 
	IL_0f23:  nop 
	IL_0f24:  ldloc 0

	IL_0f28:  nop 
	IL_0f29:  nop 
	IL_0f2a:  ldc.i4 1
	IL_0f2f:  beq IL_0f39

	IL_0f34:  br IL_0f48

	IL_0f39:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_7
	IL_0f3e:  br IL_286c

	IL_0f43:  br IL_0f4d

	IL_0f48:  br IL_0f4d

	IL_0f4d:  ldarg 0

	IL_0f51:  nop 
	IL_0f52:  nop 
	IL_0f53:  ldstr "ldc.i4.8"
	IL_0f58:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0f5d:  stloc 0

	IL_0f61:  nop 
	IL_0f62:  nop 
	IL_0f63:  ldloc 0

	IL_0f67:  nop 
	IL_0f68:  nop 
	IL_0f69:  ldc.i4 1
	IL_0f6e:  beq IL_0f78

	IL_0f73:  br IL_0f87

	IL_0f78:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_8
	IL_0f7d:  br IL_286c

	IL_0f82:  br IL_0f8c

	IL_0f87:  br IL_0f8c

	IL_0f8c:  ldarg 0

	IL_0f90:  nop 
	IL_0f91:  nop 
	IL_0f92:  ldstr "ldc.i4.m1"
	IL_0f97:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0f9c:  stloc 0

	IL_0fa0:  nop 
	IL_0fa1:  nop 
	IL_0fa2:  ldloc 0

	IL_0fa6:  nop 
	IL_0fa7:  nop 
	IL_0fa8:  ldc.i4 1
	IL_0fad:  beq IL_0fb7

	IL_0fb2:  br IL_0fc6

	IL_0fb7:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_M1
	IL_0fbc:  br IL_286c

	IL_0fc1:  br IL_0fcb

	IL_0fc6:  br IL_0fcb

	IL_0fcb:  ldarg 0

	IL_0fcf:  nop 
	IL_0fd0:  nop 
	IL_0fd1:  ldstr "ldc.i4.s"
	IL_0fd6:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_0fdb:  stloc 0

	IL_0fdf:  nop 
	IL_0fe0:  nop 
	IL_0fe1:  ldloc 0

	IL_0fe5:  nop 
	IL_0fe6:  nop 
	IL_0fe7:  ldc.i4 1
	IL_0fec:  beq IL_0ff6

	IL_0ff1:  br IL_1005

	IL_0ff6:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I4_S
	IL_0ffb:  br IL_286c

	IL_1000:  br IL_100a

	IL_1005:  br IL_100a

	IL_100a:  ldarg 0

	IL_100e:  nop 
	IL_100f:  nop 
	IL_1010:  ldstr "ldc.i8"
	IL_1015:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_101a:  stloc 0

	IL_101e:  nop 
	IL_101f:  nop 
	IL_1020:  ldloc 0

	IL_1024:  nop 
	IL_1025:  nop 
	IL_1026:  ldc.i4 1
	IL_102b:  beq IL_1035

	IL_1030:  br IL_1044

	IL_1035:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_I8
	IL_103a:  br IL_286c

	IL_103f:  br IL_1049

	IL_1044:  br IL_1049

	IL_1049:  ldarg 0

	IL_104d:  nop 
	IL_104e:  nop 
	IL_104f:  ldstr "ldc.r4"
	IL_1054:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1059:  stloc 0

	IL_105d:  nop 
	IL_105e:  nop 
	IL_105f:  ldloc 0

	IL_1063:  nop 
	IL_1064:  nop 
	IL_1065:  ldc.i4 1
	IL_106a:  beq IL_1074

	IL_106f:  br IL_1083

	IL_1074:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_R4
	IL_1079:  br IL_286c

	IL_107e:  br IL_1088

	IL_1083:  br IL_1088

	IL_1088:  ldarg 0

	IL_108c:  nop 
	IL_108d:  nop 
	IL_108e:  ldstr "ldc.r8"
	IL_1093:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1098:  stloc 0

	IL_109c:  nop 
	IL_109d:  nop 
	IL_109e:  ldloc 0

	IL_10a2:  nop 
	IL_10a3:  nop 
	IL_10a4:  ldc.i4 1
	IL_10a9:  beq IL_10b3

	IL_10ae:  br IL_10c2

	IL_10b3:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_R8
	IL_10b8:  br IL_286c

	IL_10bd:  br IL_10c7

	IL_10c2:  br IL_10c7

	IL_10c7:  ldarg 0

	IL_10cb:  nop 
	IL_10cc:  nop 
	IL_10cd:  ldstr "ldc.r8"
	IL_10d2:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_10d7:  stloc 0

	IL_10db:  nop 
	IL_10dc:  nop 
	IL_10dd:  ldloc 0

	IL_10e1:  nop 
	IL_10e2:  nop 
	IL_10e3:  ldc.i4 1
	IL_10e8:  beq IL_10f2

	IL_10ed:  br IL_1101

	IL_10f2:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldc_R8
	IL_10f7:  br IL_286c

	IL_10fc:  br IL_1106

	IL_1101:  br IL_1106

	IL_1106:  ldarg 0

	IL_110a:  nop 
	IL_110b:  nop 
	IL_110c:  ldstr "ldelem"
	IL_1111:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1116:  stloc 0

	IL_111a:  nop 
	IL_111b:  nop 
	IL_111c:  ldloc 0

	IL_1120:  nop 
	IL_1121:  nop 
	IL_1122:  ldc.i4 1
	IL_1127:  beq IL_1131

	IL_112c:  br IL_1140

	IL_1131:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem
	IL_1136:  br IL_286c

	IL_113b:  br IL_1145

	IL_1140:  br IL_1145

	IL_1145:  ldarg 0

	IL_1149:  nop 
	IL_114a:  nop 
	IL_114b:  ldstr "ldelem.i"
	IL_1150:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1155:  stloc 0

	IL_1159:  nop 
	IL_115a:  nop 
	IL_115b:  ldloc 0

	IL_115f:  nop 
	IL_1160:  nop 
	IL_1161:  ldc.i4 1
	IL_1166:  beq IL_1170

	IL_116b:  br IL_117f

	IL_1170:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_I
	IL_1175:  br IL_286c

	IL_117a:  br IL_1184

	IL_117f:  br IL_1184

	IL_1184:  ldarg 0

	IL_1188:  nop 
	IL_1189:  nop 
	IL_118a:  ldstr "ldelem.i1"
	IL_118f:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1194:  stloc 0

	IL_1198:  nop 
	IL_1199:  nop 
	IL_119a:  ldloc 0

	IL_119e:  nop 
	IL_119f:  nop 
	IL_11a0:  ldc.i4 1
	IL_11a5:  beq IL_11af

	IL_11aa:  br IL_11be

	IL_11af:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_I1
	IL_11b4:  br IL_286c

	IL_11b9:  br IL_11c3

	IL_11be:  br IL_11c3

	IL_11c3:  ldarg 0

	IL_11c7:  nop 
	IL_11c8:  nop 
	IL_11c9:  ldstr "ldelem.i2"
	IL_11ce:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_11d3:  stloc 0

	IL_11d7:  nop 
	IL_11d8:  nop 
	IL_11d9:  ldloc 0

	IL_11dd:  nop 
	IL_11de:  nop 
	IL_11df:  ldc.i4 1
	IL_11e4:  beq IL_11ee

	IL_11e9:  br IL_11fd

	IL_11ee:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_I2
	IL_11f3:  br IL_286c

	IL_11f8:  br IL_1202

	IL_11fd:  br IL_1202

	IL_1202:  ldarg 0

	IL_1206:  nop 
	IL_1207:  nop 
	IL_1208:  ldstr "ldelem.i4"
	IL_120d:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1212:  stloc 0

	IL_1216:  nop 
	IL_1217:  nop 
	IL_1218:  ldloc 0

	IL_121c:  nop 
	IL_121d:  nop 
	IL_121e:  ldc.i4 1
	IL_1223:  beq IL_122d

	IL_1228:  br IL_123c

	IL_122d:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_I4
	IL_1232:  br IL_286c

	IL_1237:  br IL_1241

	IL_123c:  br IL_1241

	IL_1241:  ldarg 0

	IL_1245:  nop 
	IL_1246:  nop 
	IL_1247:  ldstr "ldelem.i8"
	IL_124c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1251:  stloc 0

	IL_1255:  nop 
	IL_1256:  nop 
	IL_1257:  ldloc 0

	IL_125b:  nop 
	IL_125c:  nop 
	IL_125d:  ldc.i4 1
	IL_1262:  beq IL_126c

	IL_1267:  br IL_127b

	IL_126c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_I8
	IL_1271:  br IL_286c

	IL_1276:  br IL_1280

	IL_127b:  br IL_1280

	IL_1280:  ldarg 0

	IL_1284:  nop 
	IL_1285:  nop 
	IL_1286:  ldstr "ldelem.r4"
	IL_128b:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1290:  stloc 0

	IL_1294:  nop 
	IL_1295:  nop 
	IL_1296:  ldloc 0

	IL_129a:  nop 
	IL_129b:  nop 
	IL_129c:  ldc.i4 1
	IL_12a1:  beq IL_12ab

	IL_12a6:  br IL_12ba

	IL_12ab:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_R4
	IL_12b0:  br IL_286c

	IL_12b5:  br IL_12bf

	IL_12ba:  br IL_12bf

	IL_12bf:  ldarg 0

	IL_12c3:  nop 
	IL_12c4:  nop 
	IL_12c5:  ldstr "ldelem.r8"
	IL_12ca:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_12cf:  stloc 0

	IL_12d3:  nop 
	IL_12d4:  nop 
	IL_12d5:  ldloc 0

	IL_12d9:  nop 
	IL_12da:  nop 
	IL_12db:  ldc.i4 1
	IL_12e0:  beq IL_12ea

	IL_12e5:  br IL_12f9

	IL_12ea:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_R8
	IL_12ef:  br IL_286c

	IL_12f4:  br IL_12fe

	IL_12f9:  br IL_12fe

	IL_12fe:  ldarg 0

	IL_1302:  nop 
	IL_1303:  nop 
	IL_1304:  ldstr "ldelem.u1"
	IL_1309:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_130e:  stloc 0

	IL_1312:  nop 
	IL_1313:  nop 
	IL_1314:  ldloc 0

	IL_1318:  nop 
	IL_1319:  nop 
	IL_131a:  ldc.i4 1
	IL_131f:  beq IL_1329

	IL_1324:  br IL_1338

	IL_1329:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_U1
	IL_132e:  br IL_286c

	IL_1333:  br IL_133d

	IL_1338:  br IL_133d

	IL_133d:  ldarg 0

	IL_1341:  nop 
	IL_1342:  nop 
	IL_1343:  ldstr "ldelem.u2"
	IL_1348:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_134d:  stloc 0

	IL_1351:  nop 
	IL_1352:  nop 
	IL_1353:  ldloc 0

	IL_1357:  nop 
	IL_1358:  nop 
	IL_1359:  ldc.i4 1
	IL_135e:  beq IL_1368

	IL_1363:  br IL_1377

	IL_1368:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_U2
	IL_136d:  br IL_286c

	IL_1372:  br IL_137c

	IL_1377:  br IL_137c

	IL_137c:  ldarg 0

	IL_1380:  nop 
	IL_1381:  nop 
	IL_1382:  ldstr "ldelem.u4"
	IL_1387:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_138c:  stloc 0

	IL_1390:  nop 
	IL_1391:  nop 
	IL_1392:  ldloc 0

	IL_1396:  nop 
	IL_1397:  nop 
	IL_1398:  ldc.i4 1
	IL_139d:  beq IL_13a7

	IL_13a2:  br IL_13b6

	IL_13a7:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_U4
	IL_13ac:  br IL_286c

	IL_13b1:  br IL_13bb

	IL_13b6:  br IL_13bb

	IL_13bb:  ldarg 0

	IL_13bf:  nop 
	IL_13c0:  nop 
	IL_13c1:  ldstr "ldelem.ref"
	IL_13c6:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_13cb:  stloc 0

	IL_13cf:  nop 
	IL_13d0:  nop 
	IL_13d1:  ldloc 0

	IL_13d5:  nop 
	IL_13d6:  nop 
	IL_13d7:  ldc.i4 1
	IL_13dc:  beq IL_13e6

	IL_13e1:  br IL_13f5

	IL_13e6:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelem_Ref
	IL_13eb:  br IL_286c

	IL_13f0:  br IL_13fa

	IL_13f5:  br IL_13fa

	IL_13fa:  ldarg 0

	IL_13fe:  nop 
	IL_13ff:  nop 
	IL_1400:  ldstr "ldelema"
	IL_1405:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_140a:  stloc 0

	IL_140e:  nop 
	IL_140f:  nop 
	IL_1410:  ldloc 0

	IL_1414:  nop 
	IL_1415:  nop 
	IL_1416:  ldc.i4 1
	IL_141b:  beq IL_1425

	IL_1420:  br IL_1434

	IL_1425:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldelema
	IL_142a:  br IL_286c

	IL_142f:  br IL_1439

	IL_1434:  br IL_1439

	IL_1439:  ldarg 0

	IL_143d:  nop 
	IL_143e:  nop 
	IL_143f:  ldstr "ldfld"
	IL_1444:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1449:  stloc 0

	IL_144d:  nop 
	IL_144e:  nop 
	IL_144f:  ldloc 0

	IL_1453:  nop 
	IL_1454:  nop 
	IL_1455:  ldc.i4 1
	IL_145a:  beq IL_1464

	IL_145f:  br IL_1473

	IL_1464:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldfld
	IL_1469:  br IL_286c

	IL_146e:  br IL_1478

	IL_1473:  br IL_1478

	IL_1478:  ldarg 0

	IL_147c:  nop 
	IL_147d:  nop 
	IL_147e:  ldstr "ldflda"
	IL_1483:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1488:  stloc 0

	IL_148c:  nop 
	IL_148d:  nop 
	IL_148e:  ldloc 0

	IL_1492:  nop 
	IL_1493:  nop 
	IL_1494:  ldc.i4 1
	IL_1499:  beq IL_14a3

	IL_149e:  br IL_14b2

	IL_14a3:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldflda
	IL_14a8:  br IL_286c

	IL_14ad:  br IL_14b7

	IL_14b2:  br IL_14b7

	IL_14b7:  ldarg 0

	IL_14bb:  nop 
	IL_14bc:  nop 
	IL_14bd:  ldstr "ldftn"
	IL_14c2:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_14c7:  stloc 0

	IL_14cb:  nop 
	IL_14cc:  nop 
	IL_14cd:  ldloc 0

	IL_14d1:  nop 
	IL_14d2:  nop 
	IL_14d3:  ldc.i4 1
	IL_14d8:  beq IL_14e2

	IL_14dd:  br IL_14f1

	IL_14e2:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldftn
	IL_14e7:  br IL_286c

	IL_14ec:  br IL_14f6

	IL_14f1:  br IL_14f6

	IL_14f6:  ldarg 0

	IL_14fa:  nop 
	IL_14fb:  nop 
	IL_14fc:  ldstr "ldind.i"
	IL_1501:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1506:  stloc 0

	IL_150a:  nop 
	IL_150b:  nop 
	IL_150c:  ldloc 0

	IL_1510:  nop 
	IL_1511:  nop 
	IL_1512:  ldc.i4 1
	IL_1517:  beq IL_1521

	IL_151c:  br IL_1530

	IL_1521:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_I
	IL_1526:  br IL_286c

	IL_152b:  br IL_1535

	IL_1530:  br IL_1535

	IL_1535:  ldarg 0

	IL_1539:  nop 
	IL_153a:  nop 
	IL_153b:  ldstr "ldind.i1"
	IL_1540:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1545:  stloc 0

	IL_1549:  nop 
	IL_154a:  nop 
	IL_154b:  ldloc 0

	IL_154f:  nop 
	IL_1550:  nop 
	IL_1551:  ldc.i4 1
	IL_1556:  beq IL_1560

	IL_155b:  br IL_156f

	IL_1560:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_I1
	IL_1565:  br IL_286c

	IL_156a:  br IL_1574

	IL_156f:  br IL_1574

	IL_1574:  ldarg 0

	IL_1578:  nop 
	IL_1579:  nop 
	IL_157a:  ldstr "ldind.i2"
	IL_157f:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1584:  stloc 0

	IL_1588:  nop 
	IL_1589:  nop 
	IL_158a:  ldloc 0

	IL_158e:  nop 
	IL_158f:  nop 
	IL_1590:  ldc.i4 1
	IL_1595:  beq IL_159f

	IL_159a:  br IL_15ae

	IL_159f:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_I2
	IL_15a4:  br IL_286c

	IL_15a9:  br IL_15b3

	IL_15ae:  br IL_15b3

	IL_15b3:  ldarg 0

	IL_15b7:  nop 
	IL_15b8:  nop 
	IL_15b9:  ldstr "ldind.i4"
	IL_15be:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_15c3:  stloc 0

	IL_15c7:  nop 
	IL_15c8:  nop 
	IL_15c9:  ldloc 0

	IL_15cd:  nop 
	IL_15ce:  nop 
	IL_15cf:  ldc.i4 1
	IL_15d4:  beq IL_15de

	IL_15d9:  br IL_15ed

	IL_15de:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_I4
	IL_15e3:  br IL_286c

	IL_15e8:  br IL_15f2

	IL_15ed:  br IL_15f2

	IL_15f2:  ldarg 0

	IL_15f6:  nop 
	IL_15f7:  nop 
	IL_15f8:  ldstr "ldind.i8"
	IL_15fd:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1602:  stloc 0

	IL_1606:  nop 
	IL_1607:  nop 
	IL_1608:  ldloc 0

	IL_160c:  nop 
	IL_160d:  nop 
	IL_160e:  ldc.i4 1
	IL_1613:  beq IL_161d

	IL_1618:  br IL_162c

	IL_161d:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_I8
	IL_1622:  br IL_286c

	IL_1627:  br IL_1631

	IL_162c:  br IL_1631

	IL_1631:  ldarg 0

	IL_1635:  nop 
	IL_1636:  nop 
	IL_1637:  ldstr "ldind.r4"
	IL_163c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1641:  stloc 0

	IL_1645:  nop 
	IL_1646:  nop 
	IL_1647:  ldloc 0

	IL_164b:  nop 
	IL_164c:  nop 
	IL_164d:  ldc.i4 1
	IL_1652:  beq IL_165c

	IL_1657:  br IL_166b

	IL_165c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_R4
	IL_1661:  br IL_286c

	IL_1666:  br IL_1670

	IL_166b:  br IL_1670

	IL_1670:  ldarg 0

	IL_1674:  nop 
	IL_1675:  nop 
	IL_1676:  ldstr "ldind.r8"
	IL_167b:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1680:  stloc 0

	IL_1684:  nop 
	IL_1685:  nop 
	IL_1686:  ldloc 0

	IL_168a:  nop 
	IL_168b:  nop 
	IL_168c:  ldc.i4 1
	IL_1691:  beq IL_169b

	IL_1696:  br IL_16aa

	IL_169b:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_R8
	IL_16a0:  br IL_286c

	IL_16a5:  br IL_16af

	IL_16aa:  br IL_16af

	IL_16af:  ldarg 0

	IL_16b3:  nop 
	IL_16b4:  nop 
	IL_16b5:  ldstr "ldind.u1"
	IL_16ba:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_16bf:  stloc 0

	IL_16c3:  nop 
	IL_16c4:  nop 
	IL_16c5:  ldloc 0

	IL_16c9:  nop 
	IL_16ca:  nop 
	IL_16cb:  ldc.i4 1
	IL_16d0:  beq IL_16da

	IL_16d5:  br IL_16e9

	IL_16da:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_U1
	IL_16df:  br IL_286c

	IL_16e4:  br IL_16ee

	IL_16e9:  br IL_16ee

	IL_16ee:  ldarg 0

	IL_16f2:  nop 
	IL_16f3:  nop 
	IL_16f4:  ldstr "ldind.u2"
	IL_16f9:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_16fe:  stloc 0

	IL_1702:  nop 
	IL_1703:  nop 
	IL_1704:  ldloc 0

	IL_1708:  nop 
	IL_1709:  nop 
	IL_170a:  ldc.i4 1
	IL_170f:  beq IL_1719

	IL_1714:  br IL_1728

	IL_1719:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_U2
	IL_171e:  br IL_286c

	IL_1723:  br IL_172d

	IL_1728:  br IL_172d

	IL_172d:  ldarg 0

	IL_1731:  nop 
	IL_1732:  nop 
	IL_1733:  ldstr "ldind.u4"
	IL_1738:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_173d:  stloc 0

	IL_1741:  nop 
	IL_1742:  nop 
	IL_1743:  ldloc 0

	IL_1747:  nop 
	IL_1748:  nop 
	IL_1749:  ldc.i4 1
	IL_174e:  beq IL_1758

	IL_1753:  br IL_1767

	IL_1758:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_U4
	IL_175d:  br IL_286c

	IL_1762:  br IL_176c

	IL_1767:  br IL_176c

	IL_176c:  ldarg 0

	IL_1770:  nop 
	IL_1771:  nop 
	IL_1772:  ldstr "ldind.ref"
	IL_1777:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_177c:  stloc 0

	IL_1780:  nop 
	IL_1781:  nop 
	IL_1782:  ldloc 0

	IL_1786:  nop 
	IL_1787:  nop 
	IL_1788:  ldc.i4 1
	IL_178d:  beq IL_1797

	IL_1792:  br IL_17a6

	IL_1797:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_Ref
	IL_179c:  br IL_286c

	IL_17a1:  br IL_17ab

	IL_17a6:  br IL_17ab

	IL_17ab:  ldarg 0

	IL_17af:  nop 
	IL_17b0:  nop 
	IL_17b1:  ldstr "ldlen"
	IL_17b6:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_17bb:  stloc 0

	IL_17bf:  nop 
	IL_17c0:  nop 
	IL_17c1:  ldloc 0

	IL_17c5:  nop 
	IL_17c6:  nop 
	IL_17c7:  ldc.i4 1
	IL_17cc:  beq IL_17d6

	IL_17d1:  br IL_17e5

	IL_17d6:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldlen
	IL_17db:  br IL_286c

	IL_17e0:  br IL_17ea

	IL_17e5:  br IL_17ea

	IL_17ea:  ldarg 0

	IL_17ee:  nop 
	IL_17ef:  nop 
	IL_17f0:  ldstr "ldloc"
	IL_17f5:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_17fa:  stloc 0

	IL_17fe:  nop 
	IL_17ff:  nop 
	IL_1800:  ldloc 0

	IL_1804:  nop 
	IL_1805:  nop 
	IL_1806:  ldc.i4 1
	IL_180b:  beq IL_1815

	IL_1810:  br IL_1824

	IL_1815:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloc
	IL_181a:  br IL_286c

	IL_181f:  br IL_1829

	IL_1824:  br IL_1829

	IL_1829:  ldarg 0

	IL_182d:  nop 
	IL_182e:  nop 
	IL_182f:  ldstr "ldloc.s"
	IL_1834:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1839:  stloc 0

	IL_183d:  nop 
	IL_183e:  nop 
	IL_183f:  ldloc 0

	IL_1843:  nop 
	IL_1844:  nop 
	IL_1845:  ldc.i4 1
	IL_184a:  beq IL_1854

	IL_184f:  br IL_1863

	IL_1854:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloc_S
	IL_1859:  br IL_286c

	IL_185e:  br IL_1868

	IL_1863:  br IL_1868

	IL_1868:  ldarg 0

	IL_186c:  nop 
	IL_186d:  nop 
	IL_186e:  ldstr "ldloca"
	IL_1873:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1878:  stloc 0

	IL_187c:  nop 
	IL_187d:  nop 
	IL_187e:  ldloc 0

	IL_1882:  nop 
	IL_1883:  nop 
	IL_1884:  ldc.i4 1
	IL_1889:  beq IL_1893

	IL_188e:  br IL_18a2

	IL_1893:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloca
	IL_1898:  br IL_286c

	IL_189d:  br IL_18a7

	IL_18a2:  br IL_18a7

	IL_18a7:  ldarg 0

	IL_18ab:  nop 
	IL_18ac:  nop 
	IL_18ad:  ldstr "ldloca.s"
	IL_18b2:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_18b7:  stloc 0

	IL_18bb:  nop 
	IL_18bc:  nop 
	IL_18bd:  ldloc 0

	IL_18c1:  nop 
	IL_18c2:  nop 
	IL_18c3:  ldc.i4 1
	IL_18c8:  beq IL_18d2

	IL_18cd:  br IL_18e1

	IL_18d2:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloca_S
	IL_18d7:  br IL_286c

	IL_18dc:  br IL_18e6

	IL_18e1:  br IL_18e6

	IL_18e6:  ldarg 0

	IL_18ea:  nop 
	IL_18eb:  nop 
	IL_18ec:  ldstr "ldloc.0"
	IL_18f1:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_18f6:  stloc 0

	IL_18fa:  nop 
	IL_18fb:  nop 
	IL_18fc:  ldloc 0

	IL_1900:  nop 
	IL_1901:  nop 
	IL_1902:  ldc.i4 1
	IL_1907:  beq IL_1911

	IL_190c:  br IL_1920

	IL_1911:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloc_0
	IL_1916:  br IL_286c

	IL_191b:  br IL_1925

	IL_1920:  br IL_1925

	IL_1925:  ldarg 0

	IL_1929:  nop 
	IL_192a:  nop 
	IL_192b:  ldstr "ldloc.1"
	IL_1930:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1935:  stloc 0

	IL_1939:  nop 
	IL_193a:  nop 
	IL_193b:  ldloc 0

	IL_193f:  nop 
	IL_1940:  nop 
	IL_1941:  ldc.i4 1
	IL_1946:  beq IL_1950

	IL_194b:  br IL_195f

	IL_1950:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloc_1
	IL_1955:  br IL_286c

	IL_195a:  br IL_1964

	IL_195f:  br IL_1964

	IL_1964:  ldarg 0

	IL_1968:  nop 
	IL_1969:  nop 
	IL_196a:  ldstr "ldloc.2"
	IL_196f:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1974:  stloc 0

	IL_1978:  nop 
	IL_1979:  nop 
	IL_197a:  ldloc 0

	IL_197e:  nop 
	IL_197f:  nop 
	IL_1980:  ldc.i4 1
	IL_1985:  beq IL_198f

	IL_198a:  br IL_199e

	IL_198f:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloc_2
	IL_1994:  br IL_286c

	IL_1999:  br IL_19a3

	IL_199e:  br IL_19a3

	IL_19a3:  ldarg 0

	IL_19a7:  nop 
	IL_19a8:  nop 
	IL_19a9:  ldstr "ldloc.3"
	IL_19ae:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_19b3:  stloc 0

	IL_19b7:  nop 
	IL_19b8:  nop 
	IL_19b9:  ldloc 0

	IL_19bd:  nop 
	IL_19be:  nop 
	IL_19bf:  ldc.i4 1
	IL_19c4:  beq IL_19ce

	IL_19c9:  br IL_19dd

	IL_19ce:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldloc_3
	IL_19d3:  br IL_286c

	IL_19d8:  br IL_19e2

	IL_19dd:  br IL_19e2

	IL_19e2:  ldarg 0

	IL_19e6:  nop 
	IL_19e7:  nop 
	IL_19e8:  ldstr "ldnull"
	IL_19ed:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_19f2:  stloc 0

	IL_19f6:  nop 
	IL_19f7:  nop 
	IL_19f8:  ldloc 0

	IL_19fc:  nop 
	IL_19fd:  nop 
	IL_19fe:  ldc.i4 1
	IL_1a03:  beq IL_1a0d

	IL_1a08:  br IL_1a1c

	IL_1a0d:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldnull
	IL_1a12:  br IL_286c

	IL_1a17:  br IL_1a21

	IL_1a1c:  br IL_1a21

	IL_1a21:  ldarg 0

	IL_1a25:  nop 
	IL_1a26:  nop 
	IL_1a27:  ldstr "ldobj"
	IL_1a2c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1a31:  stloc 0

	IL_1a35:  nop 
	IL_1a36:  nop 
	IL_1a37:  ldloc 0

	IL_1a3b:  nop 
	IL_1a3c:  nop 
	IL_1a3d:  ldc.i4 1
	IL_1a42:  beq IL_1a4c

	IL_1a47:  br IL_1a5b

	IL_1a4c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldobj
	IL_1a51:  br IL_286c

	IL_1a56:  br IL_1a60

	IL_1a5b:  br IL_1a60

	IL_1a60:  ldarg 0

	IL_1a64:  nop 
	IL_1a65:  nop 
	IL_1a66:  ldstr "ldsfld"
	IL_1a6b:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1a70:  stloc 0

	IL_1a74:  nop 
	IL_1a75:  nop 
	IL_1a76:  ldloc 0

	IL_1a7a:  nop 
	IL_1a7b:  nop 
	IL_1a7c:  ldc.i4 1
	IL_1a81:  beq IL_1a8b

	IL_1a86:  br IL_1a9a

	IL_1a8b:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldsfld
	IL_1a90:  br IL_286c

	IL_1a95:  br IL_1a9f

	IL_1a9a:  br IL_1a9f

	IL_1a9f:  ldarg 0

	IL_1aa3:  nop 
	IL_1aa4:  nop 
	IL_1aa5:  ldstr "ldsflda"
	IL_1aaa:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1aaf:  stloc 0

	IL_1ab3:  nop 
	IL_1ab4:  nop 
	IL_1ab5:  ldloc 0

	IL_1ab9:  nop 
	IL_1aba:  nop 
	IL_1abb:  ldc.i4 1
	IL_1ac0:  beq IL_1aca

	IL_1ac5:  br IL_1ad9

	IL_1aca:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldsflda
	IL_1acf:  br IL_286c

	IL_1ad4:  br IL_1ade

	IL_1ad9:  br IL_1ade

	IL_1ade:  ldarg 0

	IL_1ae2:  nop 
	IL_1ae3:  nop 
	IL_1ae4:  ldstr "ldstr"
	IL_1ae9:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1aee:  stloc 0

	IL_1af2:  nop 
	IL_1af3:  nop 
	IL_1af4:  ldloc 0

	IL_1af8:  nop 
	IL_1af9:  nop 
	IL_1afa:  ldc.i4 1
	IL_1aff:  beq IL_1b09

	IL_1b04:  br IL_1b18

	IL_1b09:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldstr
	IL_1b0e:  br IL_286c

	IL_1b13:  br IL_1b1d

	IL_1b18:  br IL_1b1d

	IL_1b1d:  ldarg 0

	IL_1b21:  nop 
	IL_1b22:  nop 
	IL_1b23:  ldstr "ldtoken"
	IL_1b28:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1b2d:  stloc 0

	IL_1b31:  nop 
	IL_1b32:  nop 
	IL_1b33:  ldloc 0

	IL_1b37:  nop 
	IL_1b38:  nop 
	IL_1b39:  ldc.i4 1
	IL_1b3e:  beq IL_1b48

	IL_1b43:  br IL_1b57

	IL_1b48:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldtoken
	IL_1b4d:  br IL_286c

	IL_1b52:  br IL_1b5c

	IL_1b57:  br IL_1b5c

	IL_1b5c:  ldarg 0

	IL_1b60:  nop 
	IL_1b61:  nop 
	IL_1b62:  ldstr "ldvirtftn"
	IL_1b67:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1b6c:  stloc 0

	IL_1b70:  nop 
	IL_1b71:  nop 
	IL_1b72:  ldloc 0

	IL_1b76:  nop 
	IL_1b77:  nop 
	IL_1b78:  ldc.i4 1
	IL_1b7d:  beq IL_1b87

	IL_1b82:  br IL_1b96

	IL_1b87:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldvirtftn
	IL_1b8c:  br IL_286c

	IL_1b91:  br IL_1b9b

	IL_1b96:  br IL_1b9b

	IL_1b9b:  ldarg 0

	IL_1b9f:  nop 
	IL_1ba0:  nop 
	IL_1ba1:  ldstr "ldftn"
	IL_1ba6:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1bab:  stloc 0

	IL_1baf:  nop 
	IL_1bb0:  nop 
	IL_1bb1:  ldloc 0

	IL_1bb5:  nop 
	IL_1bb6:  nop 
	IL_1bb7:  ldc.i4 1
	IL_1bbc:  beq IL_1bc6

	IL_1bc1:  br IL_1bd5

	IL_1bc6:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldftn
	IL_1bcb:  br IL_286c

	IL_1bd0:  br IL_1bda

	IL_1bd5:  br IL_1bda

	IL_1bda:  ldarg 0

	IL_1bde:  nop 
	IL_1bdf:  nop 
	IL_1be0:  ldstr "leave"
	IL_1be5:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1bea:  stloc 0

	IL_1bee:  nop 
	IL_1bef:  nop 
	IL_1bf0:  ldloc 0

	IL_1bf4:  nop 
	IL_1bf5:  nop 
	IL_1bf6:  ldc.i4 1
	IL_1bfb:  beq IL_1c05

	IL_1c00:  br IL_1c14

	IL_1c05:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Leave
	IL_1c0a:  br IL_286c

	IL_1c0f:  br IL_1c19

	IL_1c14:  br IL_1c19

	IL_1c19:  ldarg 0

	IL_1c1d:  nop 
	IL_1c1e:  nop 
	IL_1c1f:  ldstr "mul"
	IL_1c24:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1c29:  stloc 0

	IL_1c2d:  nop 
	IL_1c2e:  nop 
	IL_1c2f:  ldloc 0

	IL_1c33:  nop 
	IL_1c34:  nop 
	IL_1c35:  ldc.i4 1
	IL_1c3a:  beq IL_1c44

	IL_1c3f:  br IL_1c53

	IL_1c44:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Mul
	IL_1c49:  br IL_286c

	IL_1c4e:  br IL_1c58

	IL_1c53:  br IL_1c58

	IL_1c58:  ldarg 0

	IL_1c5c:  nop 
	IL_1c5d:  nop 
	IL_1c5e:  ldstr "mul.ovf"
	IL_1c63:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1c68:  stloc 0

	IL_1c6c:  nop 
	IL_1c6d:  nop 
	IL_1c6e:  ldloc 0

	IL_1c72:  nop 
	IL_1c73:  nop 
	IL_1c74:  ldc.i4 1
	IL_1c79:  beq IL_1c83

	IL_1c7e:  br IL_1c92

	IL_1c83:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Mul_Ovf
	IL_1c88:  br IL_286c

	IL_1c8d:  br IL_1c97

	IL_1c92:  br IL_1c97

	IL_1c97:  ldarg 0

	IL_1c9b:  nop 
	IL_1c9c:  nop 
	IL_1c9d:  ldstr "neg"
	IL_1ca2:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1ca7:  stloc 0

	IL_1cab:  nop 
	IL_1cac:  nop 
	IL_1cad:  ldloc 0

	IL_1cb1:  nop 
	IL_1cb2:  nop 
	IL_1cb3:  ldc.i4 1
	IL_1cb8:  beq IL_1cc2

	IL_1cbd:  br IL_1cd1

	IL_1cc2:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Neg
	IL_1cc7:  br IL_286c

	IL_1ccc:  br IL_1cd6

	IL_1cd1:  br IL_1cd6

	IL_1cd6:  ldarg 0

	IL_1cda:  nop 
	IL_1cdb:  nop 
	IL_1cdc:  ldstr "newarr"
	IL_1ce1:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1ce6:  stloc 0

	IL_1cea:  nop 
	IL_1ceb:  nop 
	IL_1cec:  ldloc 0

	IL_1cf0:  nop 
	IL_1cf1:  nop 
	IL_1cf2:  ldc.i4 1
	IL_1cf7:  beq IL_1d01

	IL_1cfc:  br IL_1d10

	IL_1d01:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Newarr
	IL_1d06:  br IL_286c

	IL_1d0b:  br IL_1d15

	IL_1d10:  br IL_1d15

	IL_1d15:  ldarg 0

	IL_1d19:  nop 
	IL_1d1a:  nop 
	IL_1d1b:  ldstr "newobj"
	IL_1d20:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1d25:  stloc 0

	IL_1d29:  nop 
	IL_1d2a:  nop 
	IL_1d2b:  ldloc 0

	IL_1d2f:  nop 
	IL_1d30:  nop 
	IL_1d31:  ldc.i4 1
	IL_1d36:  beq IL_1d40

	IL_1d3b:  br IL_1d4f

	IL_1d40:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Newobj
	IL_1d45:  br IL_286c

	IL_1d4a:  br IL_1d54

	IL_1d4f:  br IL_1d54

	IL_1d54:  ldarg 0

	IL_1d58:  nop 
	IL_1d59:  nop 
	IL_1d5a:  ldstr "nop"
	IL_1d5f:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1d64:  stloc 0

	IL_1d68:  nop 
	IL_1d69:  nop 
	IL_1d6a:  ldloc 0

	IL_1d6e:  nop 
	IL_1d6f:  nop 
	IL_1d70:  ldc.i4 1
	IL_1d75:  beq IL_1d7f

	IL_1d7a:  br IL_1d8e

	IL_1d7f:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Nop
	IL_1d84:  br IL_286c

	IL_1d89:  br IL_1d93

	IL_1d8e:  br IL_1d93

	IL_1d93:  ldarg 0

	IL_1d97:  nop 
	IL_1d98:  nop 
	IL_1d99:  ldstr "not"
	IL_1d9e:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1da3:  stloc 0

	IL_1da7:  nop 
	IL_1da8:  nop 
	IL_1da9:  ldloc 0

	IL_1dad:  nop 
	IL_1dae:  nop 
	IL_1daf:  ldc.i4 1
	IL_1db4:  beq IL_1dbe

	IL_1db9:  br IL_1dcd

	IL_1dbe:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Not
	IL_1dc3:  br IL_286c

	IL_1dc8:  br IL_1dd2

	IL_1dcd:  br IL_1dd2

	IL_1dd2:  ldarg 0

	IL_1dd6:  nop 
	IL_1dd7:  nop 
	IL_1dd8:  ldstr "or"
	IL_1ddd:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1de2:  stloc 0

	IL_1de6:  nop 
	IL_1de7:  nop 
	IL_1de8:  ldloc 0

	IL_1dec:  nop 
	IL_1ded:  nop 
	IL_1dee:  ldc.i4 1
	IL_1df3:  beq IL_1dfd

	IL_1df8:  br IL_1e0c

	IL_1dfd:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Or
	IL_1e02:  br IL_286c

	IL_1e07:  br IL_1e11

	IL_1e0c:  br IL_1e11

	IL_1e11:  ldarg 0

	IL_1e15:  nop 
	IL_1e16:  nop 
	IL_1e17:  ldstr "pop"
	IL_1e1c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1e21:  stloc 0

	IL_1e25:  nop 
	IL_1e26:  nop 
	IL_1e27:  ldloc 0

	IL_1e2b:  nop 
	IL_1e2c:  nop 
	IL_1e2d:  ldc.i4 1
	IL_1e32:  beq IL_1e3c

	IL_1e37:  br IL_1e4b

	IL_1e3c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Pop
	IL_1e41:  br IL_286c

	IL_1e46:  br IL_1e50

	IL_1e4b:  br IL_1e50

	IL_1e50:  ldarg 0

	IL_1e54:  nop 
	IL_1e55:  nop 
	IL_1e56:  ldstr "rem"
	IL_1e5b:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1e60:  stloc 0

	IL_1e64:  nop 
	IL_1e65:  nop 
	IL_1e66:  ldloc 0

	IL_1e6a:  nop 
	IL_1e6b:  nop 
	IL_1e6c:  ldc.i4 1
	IL_1e71:  beq IL_1e7b

	IL_1e76:  br IL_1e8a

	IL_1e7b:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Rem
	IL_1e80:  br IL_286c

	IL_1e85:  br IL_1e8f

	IL_1e8a:  br IL_1e8f

	IL_1e8f:  ldarg 0

	IL_1e93:  nop 
	IL_1e94:  nop 
	IL_1e95:  ldstr "rem.un"
	IL_1e9a:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1e9f:  stloc 0

	IL_1ea3:  nop 
	IL_1ea4:  nop 
	IL_1ea5:  ldloc 0

	IL_1ea9:  nop 
	IL_1eaa:  nop 
	IL_1eab:  ldc.i4 1
	IL_1eb0:  beq IL_1eba

	IL_1eb5:  br IL_1ec9

	IL_1eba:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Rem_Un
	IL_1ebf:  br IL_286c

	IL_1ec4:  br IL_1ece

	IL_1ec9:  br IL_1ece

	IL_1ece:  ldarg 0

	IL_1ed2:  nop 
	IL_1ed3:  nop 
	IL_1ed4:  ldstr "ret"
	IL_1ed9:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1ede:  stloc 0

	IL_1ee2:  nop 
	IL_1ee3:  nop 
	IL_1ee4:  ldloc 0

	IL_1ee8:  nop 
	IL_1ee9:  nop 
	IL_1eea:  ldc.i4 1
	IL_1eef:  beq IL_1ef9

	IL_1ef4:  br IL_1f08

	IL_1ef9:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ret
	IL_1efe:  br IL_286c

	IL_1f03:  br IL_1f0d

	IL_1f08:  br IL_1f0d

	IL_1f0d:  ldarg 0

	IL_1f11:  nop 
	IL_1f12:  nop 
	IL_1f13:  ldstr "rethrow"
	IL_1f18:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1f1d:  stloc 0

	IL_1f21:  nop 
	IL_1f22:  nop 
	IL_1f23:  ldloc 0

	IL_1f27:  nop 
	IL_1f28:  nop 
	IL_1f29:  ldc.i4 1
	IL_1f2e:  beq IL_1f38

	IL_1f33:  br IL_1f47

	IL_1f38:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Rethrow
	IL_1f3d:  br IL_286c

	IL_1f42:  br IL_1f4c

	IL_1f47:  br IL_1f4c

	IL_1f4c:  ldarg 0

	IL_1f50:  nop 
	IL_1f51:  nop 
	IL_1f52:  ldstr "shl"
	IL_1f57:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1f5c:  stloc 0

	IL_1f60:  nop 
	IL_1f61:  nop 
	IL_1f62:  ldloc 0

	IL_1f66:  nop 
	IL_1f67:  nop 
	IL_1f68:  ldc.i4 1
	IL_1f6d:  beq IL_1f77

	IL_1f72:  br IL_1f86

	IL_1f77:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Shl
	IL_1f7c:  br IL_286c

	IL_1f81:  br IL_1f8b

	IL_1f86:  br IL_1f8b

	IL_1f8b:  ldarg 0

	IL_1f8f:  nop 
	IL_1f90:  nop 
	IL_1f91:  ldstr "shr"
	IL_1f96:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1f9b:  stloc 0

	IL_1f9f:  nop 
	IL_1fa0:  nop 
	IL_1fa1:  ldloc 0

	IL_1fa5:  nop 
	IL_1fa6:  nop 
	IL_1fa7:  ldc.i4 1
	IL_1fac:  beq IL_1fb6

	IL_1fb1:  br IL_1fc5

	IL_1fb6:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Shr
	IL_1fbb:  br IL_286c

	IL_1fc0:  br IL_1fca

	IL_1fc5:  br IL_1fca

	IL_1fca:  ldarg 0

	IL_1fce:  nop 
	IL_1fcf:  nop 
	IL_1fd0:  ldstr "sizeof"
	IL_1fd5:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_1fda:  stloc 0

	IL_1fde:  nop 
	IL_1fdf:  nop 
	IL_1fe0:  ldloc 0

	IL_1fe4:  nop 
	IL_1fe5:  nop 
	IL_1fe6:  ldc.i4 1
	IL_1feb:  beq IL_1ff5

	IL_1ff0:  br IL_2004

	IL_1ff5:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Sizeof
	IL_1ffa:  br IL_286c

	IL_1fff:  br IL_2009

	IL_2004:  br IL_2009

	IL_2009:  ldarg 0

	IL_200d:  nop 
	IL_200e:  nop 
	IL_200f:  ldstr "starg"
	IL_2014:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2019:  stloc 0

	IL_201d:  nop 
	IL_201e:  nop 
	IL_201f:  ldloc 0

	IL_2023:  nop 
	IL_2024:  nop 
	IL_2025:  ldc.i4 1
	IL_202a:  beq IL_2034

	IL_202f:  br IL_2043

	IL_2034:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Starg
	IL_2039:  br IL_286c

	IL_203e:  br IL_2048

	IL_2043:  br IL_2048

	IL_2048:  ldarg 0

	IL_204c:  nop 
	IL_204d:  nop 
	IL_204e:  ldstr "starg.s"
	IL_2053:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2058:  stloc 0

	IL_205c:  nop 
	IL_205d:  nop 
	IL_205e:  ldloc 0

	IL_2062:  nop 
	IL_2063:  nop 
	IL_2064:  ldc.i4 1
	IL_2069:  beq IL_2073

	IL_206e:  br IL_2082

	IL_2073:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Starg_S
	IL_2078:  br IL_286c

	IL_207d:  br IL_2087

	IL_2082:  br IL_2087

	IL_2087:  ldarg 0

	IL_208b:  nop 
	IL_208c:  nop 
	IL_208d:  ldstr "stelem"
	IL_2092:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2097:  stloc 0

	IL_209b:  nop 
	IL_209c:  nop 
	IL_209d:  ldloc 0

	IL_20a1:  nop 
	IL_20a2:  nop 
	IL_20a3:  ldc.i4 1
	IL_20a8:  beq IL_20b2

	IL_20ad:  br IL_20c1

	IL_20b2:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem
	IL_20b7:  br IL_286c

	IL_20bc:  br IL_20c6

	IL_20c1:  br IL_20c6

	IL_20c6:  ldarg 0

	IL_20ca:  nop 
	IL_20cb:  nop 
	IL_20cc:  ldstr "stelem.i"
	IL_20d1:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_20d6:  stloc 0

	IL_20da:  nop 
	IL_20db:  nop 
	IL_20dc:  ldloc 0

	IL_20e0:  nop 
	IL_20e1:  nop 
	IL_20e2:  ldc.i4 1
	IL_20e7:  beq IL_20f1

	IL_20ec:  br IL_2100

	IL_20f1:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_I
	IL_20f6:  br IL_286c

	IL_20fb:  br IL_2105

	IL_2100:  br IL_2105

	IL_2105:  ldarg 0

	IL_2109:  nop 
	IL_210a:  nop 
	IL_210b:  ldstr "stelem.i1"
	IL_2110:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2115:  stloc 0

	IL_2119:  nop 
	IL_211a:  nop 
	IL_211b:  ldloc 0

	IL_211f:  nop 
	IL_2120:  nop 
	IL_2121:  ldc.i4 1
	IL_2126:  beq IL_2130

	IL_212b:  br IL_213f

	IL_2130:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_I1
	IL_2135:  br IL_286c

	IL_213a:  br IL_2144

	IL_213f:  br IL_2144

	IL_2144:  ldarg 0

	IL_2148:  nop 
	IL_2149:  nop 
	IL_214a:  ldstr "stelem.i2"
	IL_214f:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2154:  stloc 0

	IL_2158:  nop 
	IL_2159:  nop 
	IL_215a:  ldloc 0

	IL_215e:  nop 
	IL_215f:  nop 
	IL_2160:  ldc.i4 1
	IL_2165:  beq IL_216f

	IL_216a:  br IL_217e

	IL_216f:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_I2
	IL_2174:  br IL_286c

	IL_2179:  br IL_2183

	IL_217e:  br IL_2183

	IL_2183:  ldarg 0

	IL_2187:  nop 
	IL_2188:  nop 
	IL_2189:  ldstr "stelem.i4"
	IL_218e:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2193:  stloc 0

	IL_2197:  nop 
	IL_2198:  nop 
	IL_2199:  ldloc 0

	IL_219d:  nop 
	IL_219e:  nop 
	IL_219f:  ldc.i4 1
	IL_21a4:  beq IL_21ae

	IL_21a9:  br IL_21bd

	IL_21ae:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_I4
	IL_21b3:  br IL_286c

	IL_21b8:  br IL_21c2

	IL_21bd:  br IL_21c2

	IL_21c2:  ldarg 0

	IL_21c6:  nop 
	IL_21c7:  nop 
	IL_21c8:  ldstr "stelem.i8"
	IL_21cd:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_21d2:  stloc 0

	IL_21d6:  nop 
	IL_21d7:  nop 
	IL_21d8:  ldloc 0

	IL_21dc:  nop 
	IL_21dd:  nop 
	IL_21de:  ldc.i4 1
	IL_21e3:  beq IL_21ed

	IL_21e8:  br IL_21fc

	IL_21ed:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_I8
	IL_21f2:  br IL_286c

	IL_21f7:  br IL_2201

	IL_21fc:  br IL_2201

	IL_2201:  ldarg 0

	IL_2205:  nop 
	IL_2206:  nop 
	IL_2207:  ldstr "stelem.r4"
	IL_220c:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2211:  stloc 0

	IL_2215:  nop 
	IL_2216:  nop 
	IL_2217:  ldloc 0

	IL_221b:  nop 
	IL_221c:  nop 
	IL_221d:  ldc.i4 1
	IL_2222:  beq IL_222c

	IL_2227:  br IL_223b

	IL_222c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_R4
	IL_2231:  br IL_286c

	IL_2236:  br IL_2240

	IL_223b:  br IL_2240

	IL_2240:  ldarg 0

	IL_2244:  nop 
	IL_2245:  nop 
	IL_2246:  ldstr "stelem.r8"
	IL_224b:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2250:  stloc 0

	IL_2254:  nop 
	IL_2255:  nop 
	IL_2256:  ldloc 0

	IL_225a:  nop 
	IL_225b:  nop 
	IL_225c:  ldc.i4 1
	IL_2261:  beq IL_226b

	IL_2266:  br IL_227a

	IL_226b:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_R8
	IL_2270:  br IL_286c

	IL_2275:  br IL_227f

	IL_227a:  br IL_227f

	IL_227f:  ldarg 0

	IL_2283:  nop 
	IL_2284:  nop 
	IL_2285:  ldstr "stelem.ref"
	IL_228a:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_228f:  stloc 0

	IL_2293:  nop 
	IL_2294:  nop 
	IL_2295:  ldloc 0

	IL_2299:  nop 
	IL_229a:  nop 
	IL_229b:  ldc.i4 1
	IL_22a0:  beq IL_22aa

	IL_22a5:  br IL_22b9

	IL_22aa:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_Ref
	IL_22af:  br IL_286c

	IL_22b4:  br IL_22be

	IL_22b9:  br IL_22be

	IL_22be:  ldarg 0

	IL_22c2:  nop 
	IL_22c3:  nop 
	IL_22c4:  ldstr "stfld"
	IL_22c9:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_22ce:  stloc 0

	IL_22d2:  nop 
	IL_22d3:  nop 
	IL_22d4:  ldloc 0

	IL_22d8:  nop 
	IL_22d9:  nop 
	IL_22da:  ldc.i4 1
	IL_22df:  beq IL_22e9

	IL_22e4:  br IL_22f8

	IL_22e9:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stfld
	IL_22ee:  br IL_286c

	IL_22f3:  br IL_22fd

	IL_22f8:  br IL_22fd

	IL_22fd:  ldarg 0

	IL_2301:  nop 
	IL_2302:  nop 
	IL_2303:  ldstr "stind.i"
	IL_2308:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_230d:  stloc 0

	IL_2311:  nop 
	IL_2312:  nop 
	IL_2313:  ldloc 0

	IL_2317:  nop 
	IL_2318:  nop 
	IL_2319:  ldc.i4 1
	IL_231e:  beq IL_2328

	IL_2323:  br IL_2337

	IL_2328:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stind_I
	IL_232d:  br IL_286c

	IL_2332:  br IL_233c

	IL_2337:  br IL_233c

	IL_233c:  ldarg 0

	IL_2340:  nop 
	IL_2341:  nop 
	IL_2342:  ldstr "stind.i1"
	IL_2347:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_234c:  stloc 0

	IL_2350:  nop 
	IL_2351:  nop 
	IL_2352:  ldloc 0

	IL_2356:  nop 
	IL_2357:  nop 
	IL_2358:  ldc.i4 1
	IL_235d:  beq IL_2367

	IL_2362:  br IL_2376

	IL_2367:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Ldind_I1
	IL_236c:  br IL_286c

	IL_2371:  br IL_237b

	IL_2376:  br IL_237b

	IL_237b:  ldarg 0

	IL_237f:  nop 
	IL_2380:  nop 
	IL_2381:  ldstr "stind.i2"
	IL_2386:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_238b:  stloc 0

	IL_238f:  nop 
	IL_2390:  nop 
	IL_2391:  ldloc 0

	IL_2395:  nop 
	IL_2396:  nop 
	IL_2397:  ldc.i4 1
	IL_239c:  beq IL_23a6

	IL_23a1:  br IL_23b5

	IL_23a6:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stind_I2
	IL_23ab:  br IL_286c

	IL_23b0:  br IL_23ba

	IL_23b5:  br IL_23ba

	IL_23ba:  ldarg 0

	IL_23be:  nop 
	IL_23bf:  nop 
	IL_23c0:  ldstr "stind.i4"
	IL_23c5:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_23ca:  stloc 0

	IL_23ce:  nop 
	IL_23cf:  nop 
	IL_23d0:  ldloc 0

	IL_23d4:  nop 
	IL_23d5:  nop 
	IL_23d6:  ldc.i4 1
	IL_23db:  beq IL_23e5

	IL_23e0:  br IL_23f4

	IL_23e5:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stind_I4
	IL_23ea:  br IL_286c

	IL_23ef:  br IL_23f9

	IL_23f4:  br IL_23f9

	IL_23f9:  ldarg 0

	IL_23fd:  nop 
	IL_23fe:  nop 
	IL_23ff:  ldstr "stind.i8"
	IL_2404:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2409:  stloc 0

	IL_240d:  nop 
	IL_240e:  nop 
	IL_240f:  ldloc 0

	IL_2413:  nop 
	IL_2414:  nop 
	IL_2415:  ldc.i4 1
	IL_241a:  beq IL_2424

	IL_241f:  br IL_2433

	IL_2424:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stind_I8
	IL_2429:  br IL_286c

	IL_242e:  br IL_2438

	IL_2433:  br IL_2438

	IL_2438:  ldarg 0

	IL_243c:  nop 
	IL_243d:  nop 
	IL_243e:  ldstr "stind.r4"
	IL_2443:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2448:  stloc 0

	IL_244c:  nop 
	IL_244d:  nop 
	IL_244e:  ldloc 0

	IL_2452:  nop 
	IL_2453:  nop 
	IL_2454:  ldc.i4 1
	IL_2459:  beq IL_2463

	IL_245e:  br IL_2472

	IL_2463:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stind_R4
	IL_2468:  br IL_286c

	IL_246d:  br IL_2477

	IL_2472:  br IL_2477

	IL_2477:  ldarg 0

	IL_247b:  nop 
	IL_247c:  nop 
	IL_247d:  ldstr "stind.r8"
	IL_2482:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2487:  stloc 0

	IL_248b:  nop 
	IL_248c:  nop 
	IL_248d:  ldloc 0

	IL_2491:  nop 
	IL_2492:  nop 
	IL_2493:  ldc.i4 1
	IL_2498:  beq IL_24a2

	IL_249d:  br IL_24b1

	IL_24a2:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stelem_R8
	IL_24a7:  br IL_286c

	IL_24ac:  br IL_24b6

	IL_24b1:  br IL_24b6

	IL_24b6:  ldarg 0

	IL_24ba:  nop 
	IL_24bb:  nop 
	IL_24bc:  ldstr "stind.ref"
	IL_24c1:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_24c6:  stloc 0

	IL_24ca:  nop 
	IL_24cb:  nop 
	IL_24cc:  ldloc 0

	IL_24d0:  nop 
	IL_24d1:  nop 
	IL_24d2:  ldc.i4 1
	IL_24d7:  beq IL_24e1

	IL_24dc:  br IL_24f0

	IL_24e1:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stind_Ref
	IL_24e6:  br IL_286c

	IL_24eb:  br IL_24f5

	IL_24f0:  br IL_24f5

	IL_24f5:  ldarg 0

	IL_24f9:  nop 
	IL_24fa:  nop 
	IL_24fb:  ldstr "stloc"
	IL_2500:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2505:  stloc 0

	IL_2509:  nop 
	IL_250a:  nop 
	IL_250b:  ldloc 0

	IL_250f:  nop 
	IL_2510:  nop 
	IL_2511:  ldc.i4 1
	IL_2516:  beq IL_2520

	IL_251b:  br IL_252f

	IL_2520:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stloc
	IL_2525:  br IL_286c

	IL_252a:  br IL_2534

	IL_252f:  br IL_2534

	IL_2534:  ldarg 0

	IL_2538:  nop 
	IL_2539:  nop 
	IL_253a:  ldstr "stloc.s"
	IL_253f:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2544:  stloc 0

	IL_2548:  nop 
	IL_2549:  nop 
	IL_254a:  ldloc 0

	IL_254e:  nop 
	IL_254f:  nop 
	IL_2550:  ldc.i4 1
	IL_2555:  beq IL_255f

	IL_255a:  br IL_256e

	IL_255f:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stloc_S
	IL_2564:  br IL_286c

	IL_2569:  br IL_2573

	IL_256e:  br IL_2573

	IL_2573:  ldarg 0

	IL_2577:  nop 
	IL_2578:  nop 
	IL_2579:  ldstr "stloc.0"
	IL_257e:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2583:  stloc 0

	IL_2587:  nop 
	IL_2588:  nop 
	IL_2589:  ldloc 0

	IL_258d:  nop 
	IL_258e:  nop 
	IL_258f:  ldc.i4 1
	IL_2594:  beq IL_259e

	IL_2599:  br IL_25ad

	IL_259e:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stloc_0
	IL_25a3:  br IL_286c

	IL_25a8:  br IL_25b2

	IL_25ad:  br IL_25b2

	IL_25b2:  ldarg 0

	IL_25b6:  nop 
	IL_25b7:  nop 
	IL_25b8:  ldstr "stloc.1"
	IL_25bd:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_25c2:  stloc 0

	IL_25c6:  nop 
	IL_25c7:  nop 
	IL_25c8:  ldloc 0

	IL_25cc:  nop 
	IL_25cd:  nop 
	IL_25ce:  ldc.i4 1
	IL_25d3:  beq IL_25dd

	IL_25d8:  br IL_25ec

	IL_25dd:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stloc_1
	IL_25e2:  br IL_286c

	IL_25e7:  br IL_25f1

	IL_25ec:  br IL_25f1

	IL_25f1:  ldarg 0

	IL_25f5:  nop 
	IL_25f6:  nop 
	IL_25f7:  ldstr "stloc.2"
	IL_25fc:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2601:  stloc 0

	IL_2605:  nop 
	IL_2606:  nop 
	IL_2607:  ldloc 0

	IL_260b:  nop 
	IL_260c:  nop 
	IL_260d:  ldc.i4 1
	IL_2612:  beq IL_261c

	IL_2617:  br IL_262b

	IL_261c:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stloc_2
	IL_2621:  br IL_286c

	IL_2626:  br IL_2630

	IL_262b:  br IL_2630

	IL_2630:  ldarg 0

	IL_2634:  nop 
	IL_2635:  nop 
	IL_2636:  ldstr "stloc.3"
	IL_263b:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2640:  stloc 0

	IL_2644:  nop 
	IL_2645:  nop 
	IL_2646:  ldloc 0

	IL_264a:  nop 
	IL_264b:  nop 
	IL_264c:  ldc.i4 1
	IL_2651:  beq IL_265b

	IL_2656:  br IL_266a

	IL_265b:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stloc_3
	IL_2660:  br IL_286c

	IL_2665:  br IL_266f

	IL_266a:  br IL_266f

	IL_266f:  ldarg 0

	IL_2673:  nop 
	IL_2674:  nop 
	IL_2675:  ldstr "stobj"
	IL_267a:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_267f:  stloc 0

	IL_2683:  nop 
	IL_2684:  nop 
	IL_2685:  ldloc 0

	IL_2689:  nop 
	IL_268a:  nop 
	IL_268b:  ldc.i4 1
	IL_2690:  beq IL_269a

	IL_2695:  br IL_26a9

	IL_269a:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stobj
	IL_269f:  br IL_286c

	IL_26a4:  br IL_26ae

	IL_26a9:  br IL_26ae

	IL_26ae:  ldarg 0

	IL_26b2:  nop 
	IL_26b3:  nop 
	IL_26b4:  ldstr "stsfld"
	IL_26b9:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_26be:  stloc 0

	IL_26c2:  nop 
	IL_26c3:  nop 
	IL_26c4:  ldloc 0

	IL_26c8:  nop 
	IL_26c9:  nop 
	IL_26ca:  ldc.i4 1
	IL_26cf:  beq IL_26d9

	IL_26d4:  br IL_26e8

	IL_26d9:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Stsfld
	IL_26de:  br IL_286c

	IL_26e3:  br IL_26ed

	IL_26e8:  br IL_26ed

	IL_26ed:  ldarg 0

	IL_26f1:  nop 
	IL_26f2:  nop 
	IL_26f3:  ldstr "sub"
	IL_26f8:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_26fd:  stloc 0

	IL_2701:  nop 
	IL_2702:  nop 
	IL_2703:  ldloc 0

	IL_2707:  nop 
	IL_2708:  nop 
	IL_2709:  ldc.i4 1
	IL_270e:  beq IL_2718

	IL_2713:  br IL_2727

	IL_2718:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Sub
	IL_271d:  br IL_286c

	IL_2722:  br IL_272c

	IL_2727:  br IL_272c

	IL_272c:  ldarg 0

	IL_2730:  nop 
	IL_2731:  nop 
	IL_2732:  ldstr "sub.ovf"
	IL_2737:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_273c:  stloc 0

	IL_2740:  nop 
	IL_2741:  nop 
	IL_2742:  ldloc 0

	IL_2746:  nop 
	IL_2747:  nop 
	IL_2748:  ldc.i4 1
	IL_274d:  beq IL_2757

	IL_2752:  br IL_2766

	IL_2757:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Sub_Ovf
	IL_275c:  br IL_286c

	IL_2761:  br IL_276b

	IL_2766:  br IL_276b

	IL_276b:  ldarg 0

	IL_276f:  nop 
	IL_2770:  nop 
	IL_2771:  ldstr "throw"
	IL_2776:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_277b:  stloc 0

	IL_277f:  nop 
	IL_2780:  nop 
	IL_2781:  ldloc 0

	IL_2785:  nop 
	IL_2786:  nop 
	IL_2787:  ldc.i4 1
	IL_278c:  beq IL_2796

	IL_2791:  br IL_27a5

	IL_2796:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Throw
	IL_279b:  br IL_286c

	IL_27a0:  br IL_27aa

	IL_27a5:  br IL_27aa

	IL_27aa:  ldarg 0

	IL_27ae:  nop 
	IL_27af:  nop 
	IL_27b0:  ldstr "unbox"
	IL_27b5:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_27ba:  stloc 0

	IL_27be:  nop 
	IL_27bf:  nop 
	IL_27c0:  ldloc 0

	IL_27c4:  nop 
	IL_27c5:  nop 
	IL_27c6:  ldc.i4 1
	IL_27cb:  beq IL_27d5

	IL_27d0:  br IL_27e4

	IL_27d5:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Unbox
	IL_27da:  br IL_286c

	IL_27df:  br IL_27e9

	IL_27e4:  br IL_27e9

	IL_27e9:  ldarg 0

	IL_27ed:  nop 
	IL_27ee:  nop 
	IL_27ef:  ldstr "unbox.any"
	IL_27f4:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_27f9:  stloc 0

	IL_27fd:  nop 
	IL_27fe:  nop 
	IL_27ff:  ldloc 0

	IL_2803:  nop 
	IL_2804:  nop 
	IL_2805:  ldc.i4 1
	IL_280a:  beq IL_2814

	IL_280f:  br IL_2823

	IL_2814:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Unbox_Any
	IL_2819:  br IL_286c

	IL_281e:  br IL_2828

	IL_2823:  br IL_2828

	IL_2828:  ldarg 0

	IL_282c:  nop 
	IL_282d:  nop 
	IL_282e:  ldstr "xor"
	IL_2833:  call bool class dylan.NET.Reflection.InstructionHelper::compStr(string, string)
	IL_2838:  stloc 0

	IL_283c:  nop 
	IL_283d:  nop 
	IL_283e:  ldloc 0

	IL_2842:  nop 
	IL_2843:  nop 
	IL_2844:  ldc.i4 1
	IL_2849:  beq IL_2853

	IL_284e:  br IL_2862

	IL_2853:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Xor
	IL_2858:  br IL_286c

	IL_285d:  br IL_2867

	IL_2862:  br IL_2867

	IL_2867:  ldsfld valuetype [mscorlib]System.Reflection.Emit.OpCode [mscorlib]System.Reflection.Emit.OpCodes::Nop
	IL_286c:  ret 
    } // end of method InstructionHelper::getOPCode

    // method line 3
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x491c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method InstructionHelper::.ctor

  } // end of class dylan.NET.Reflection.InstructionHelper
}

.namespace dylan.NET.Reflection
{
  .class public auto ansi beforefieldinit ILEmitter
  	extends [mscorlib]System.Object
  {
    .field  public static  class [mscorlib]System.Reflection.Emit.MethodBuilder Met
    .field  public static  class [mscorlib]System.Reflection.Emit.ConstructorBuilder Constr
    .field  public static  class [mscorlib]System.Reflection.Emit.ILGenerator ILGen
    .field  public static  class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter DocWriter
    .field  public static  bool StaticFlg
    .field  public static  bool DebugFlg
    .field  public static  int32 LocInd
    .field  public static  int32 ArgInd
    .field  public static  int32 LineNr
    .field  public static  string CurSrcFile
    .field  public static  string[] SrcFiles
    .field  public static  class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] DocWriters

    // method line 4
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x4930
	// Code size 111 (0x6f)
	.maxstack 1
	IL_0000:  ldnull 
	IL_0001:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.ILEmitter::Met
	IL_0006:  ldnull 
	IL_0007:  stsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Reflection.ILEmitter::Constr
	IL_000c:  ldnull 
	IL_000d:  stsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0012:  ldc.i4 0
	IL_0017:  stsfld bool dylan.NET.Reflection.ILEmitter::StaticFlg
	IL_001c:  ldc.i4 0
	IL_0021:  stsfld bool dylan.NET.Reflection.ILEmitter::DebugFlg
	IL_0026:  ldc.i4 0
	IL_002b:  stsfld int32 dylan.NET.Reflection.ILEmitter::LocInd
	IL_0030:  ldc.i4 0
	IL_0035:  stsfld int32 dylan.NET.Reflection.ILEmitter::ArgInd
	IL_003a:  ldc.i4 0
	IL_003f:  stsfld int32 dylan.NET.Reflection.ILEmitter::LineNr
	IL_0044:  ldstr ""
	IL_0049:  stsfld string dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_004e:  ldc.i4 0
	IL_0053:  conv.u 
	IL_0054:  newarr [mscorlib]System.String
	IL_0059:  stsfld string[] dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_005e:  ldc.i4 0
	IL_0063:  conv.u 
	IL_0064:  newarr [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter
	IL_0069:  stsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] dylan.NET.Reflection.ILEmitter::DocWriters
	IL_006e:  ret 
    } // end of method ILEmitter::.cctor

    // method line 5
    .method public static 
           default void AddSrcFile (string srcf)  cil managed 
    {
        // Method begins at RVA 0x49ac
	// Code size 276 (0x114)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string[]	V_4)
	IL_0000:  ldsfld string[] dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  add 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 1
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.String
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld string[] dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.String
	IL_0093:  stelem [mscorlib]System.String
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  conv.u 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  stelem [mscorlib]System.String
	IL_0108:  ldloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  stsfld string[] dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0113:  ret 
    } // end of method ILEmitter::AddSrcFile

    // method line 6
    .method public static 
           default void PopSrcFile ()  cil managed 
    {
        // Method begins at RVA 0x4acc
	// Code size 252 (0xfc)
	.maxstack 11
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string[]	V_4)
	IL_0000:  ldsfld string[] dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  sub 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 2
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.String
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 1

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld string[] dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.String
	IL_0093:  stelem [mscorlib]System.String
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  stsfld string[] dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_00fb:  ret 
    } // end of method ILEmitter::PopSrcFile

    // method line 7
    .method public static 
           default void AddDocWriter (class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter srcf)  cil managed 
    {
        // Method begins at RVA 0x4bd4
	// Code size 276 (0x114)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string[]	V_4)
	IL_0000:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] dylan.NET.Reflection.ILEmitter::DocWriters
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  add 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 1
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] dylan.NET.Reflection.ILEmitter::DocWriters
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter
	IL_0093:  stelem [mscorlib]System.String
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  conv.u 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  stelem [mscorlib]System.String
	IL_0108:  ldloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  stsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] dylan.NET.Reflection.ILEmitter::DocWriters
	IL_0113:  ret 
    } // end of method ILEmitter::AddDocWriter

    // method line 8
    .method public static 
           default void PopDocWriter ()  cil managed 
    {
        // Method begins at RVA 0x4cf4
	// Code size 252 (0xfc)
	.maxstack 11
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string[]	V_4)
	IL_0000:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] dylan.NET.Reflection.ILEmitter::DocWriters
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  sub 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 2
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 1

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] dylan.NET.Reflection.ILEmitter::DocWriters
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter
	IL_0093:  stelem [mscorlib]System.String
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  stsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] dylan.NET.Reflection.ILEmitter::DocWriters
	IL_00fb:  ret 
    } // end of method ILEmitter::PopDocWriter

    // method line 9
    .method public static 
           default void EmitRet ()  cil managed 
    {
        // Method begins at RVA 0x4dfc
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ret"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitRet

    // method line 10
    .method public static 
           default void EmitDup ()  cil managed 
    {
        // Method begins at RVA 0x4e2c
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "dup"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitDup

    // method line 11
    .method public static 
           default void EmitPop ()  cil managed 
    {
        // Method begins at RVA 0x4e5c
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "pop"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitPop

    // method line 12
    .method public static 
           default void EmitLdlen ()  cil managed 
    {
        // Method begins at RVA 0x4e8c
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldlen"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitLdlen

    // method line 13
    .method public static 
           default void EmitBox (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x4ebc
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "box"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitBox

    // method line 14
    .method public static 
           default void EmitUnbox (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x4ef0
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "unbox"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitUnbox

    // method line 15
    .method public static 
           default void EmitUnboxAny (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x4f24
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "unbox.any"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitUnboxAny

    // method line 16
    .method public static 
           default void EmitCastclass (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x4f58
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "castclass"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitCastclass

    // method line 17
    .method public static 
           default void EmitIsinst (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x4f8c
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "isinst"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitIsinst

    // method line 18
    .method public static 
           default void EmitIs (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x4fc0
	// Code size 167 (0xa7)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "isinst"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ldstr "ldnull"
	IL_002b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0030:  stloc 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_003b:  ldloc 0

	IL_003f:  nop 
	IL_0040:  nop 
	IL_0041:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0046:  ldstr "ceq"
	IL_004b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0050:  stloc 0

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_005b:  ldloc 0

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0066:  ldstr "ldc.i4.0"
	IL_006b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0070:  stloc 0

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_007b:  ldloc 0

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0086:  ldstr "ceq"
	IL_008b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0090:  stloc 0

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_009b:  ldloc 0

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00a6:  ret 
    } // end of method ILEmitter::EmitIs

    // method line 19
    .method public static 
           default void EmitConstrained (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x5074
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "constrained."
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitConstrained

    // method line 20
    .method public static 
           default void EmitLdloc (int32 num)  cil managed 
    {
        // Method begins at RVA 0x50a8
	// Code size 580 (0x244)
	.maxstack 32
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		bool	V_1,
		bool	V_2,
		unsigned int8	V_3,
		int16	V_4)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 0
	IL_0021:  beq IL_002b

	IL_0026:  br IL_0055

	IL_002b:  ldstr "ldloc.0"
	IL_0030:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0035:  stloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0040:  ldloc 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_004b:  br IL_0243

	IL_0050:  br IL_005a

	IL_0055:  br IL_005a

	IL_005a:  ldarg 0

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldc.i4 1
	IL_0065:  beq IL_006f

	IL_006a:  br IL_0099

	IL_006f:  ldstr "ldloc.1"
	IL_0074:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0079:  stloc 0

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0084:  ldloc 0

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_008f:  br IL_0243

	IL_0094:  br IL_009e

	IL_0099:  br IL_009e

	IL_009e:  ldarg 0

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldc.i4 2
	IL_00a9:  beq IL_00b3

	IL_00ae:  br IL_00dd

	IL_00b3:  ldstr "ldloc.2"
	IL_00b8:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00bd:  stloc 0

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00c8:  ldloc 0

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d3:  br IL_0243

	IL_00d8:  br IL_00e2

	IL_00dd:  br IL_00e2

	IL_00e2:  ldarg 0

	IL_00e6:  nop 
	IL_00e7:  nop 
	IL_00e8:  ldc.i4 3
	IL_00ed:  beq IL_00f7

	IL_00f2:  br IL_0121

	IL_00f7:  ldstr "ldloc.3"
	IL_00fc:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0101:  stloc 0

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_010c:  ldloc 0

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0117:  br IL_0243

	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  ldarg 0

	IL_012a:  nop 
	IL_012b:  nop 
	IL_012c:  ldc.i4 0
	IL_0131:  bge IL_013b

	IL_0136:  br IL_014b

	IL_013b:  ldc.i4 1
	IL_0140:  stloc 1

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  br IL_0150

	IL_014b:  br IL_0150

	IL_0150:  ldarg 0

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldc.i4 255
	IL_015b:  ble IL_0165

	IL_0160:  br IL_0175

	IL_0165:  ldc.i4 1
	IL_016a:  stloc 2

	IL_016e:  nop 
	IL_016f:  nop 
	IL_0170:  br IL_017a

	IL_0175:  br IL_017a

	IL_017a:  ldloc 1

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldloc 2

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  and 
	IL_0187:  stloc 2

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  ldloc 2

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldc.i4 1
	IL_0198:  beq IL_01a2

	IL_019d:  br IL_01e3

	IL_01a2:  ldstr "ldloc.s"
	IL_01a7:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01ac:  stloc 0

	IL_01b0:  nop 
	IL_01b1:  nop 
	IL_01b2:  ldarg 0

	IL_01b6:  nop 
	IL_01b7:  nop 
	IL_01b8:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int32)
	IL_01bd:  stloc 3

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01c8:  ldloc 0

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldloc 3

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, unsigned int8)
	IL_01d9:  br IL_0243

	IL_01de:  br IL_01e8

	IL_01e3:  br IL_01e8

	IL_01e8:  ldloc 1

	IL_01ec:  nop 
	IL_01ed:  nop 
	IL_01ee:  ldc.i4 1
	IL_01f3:  beq IL_01fd

	IL_01f8:  br IL_023e

	IL_01fd:  ldstr "ldloc"
	IL_0202:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0207:  stloc 0

	IL_020b:  nop 
	IL_020c:  nop 
	IL_020d:  ldarg 0

	IL_0211:  nop 
	IL_0212:  nop 
	IL_0213:  call int16 class [mscorlib]System.Convert::ToInt16(int32)
	IL_0218:  stloc 4

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0223:  ldloc 0

	IL_0227:  nop 
	IL_0228:  nop 
	IL_0229:  ldloc 4

	IL_022d:  nop 
	IL_022e:  nop 
	IL_022f:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int16)
	IL_0234:  br IL_0243

	IL_0239:  br IL_0243

	IL_023e:  br IL_0243

	IL_0243:  ret 
    } // end of method ILEmitter::EmitLdloc

    // method line 21
    .method public static 
           default void EmitLdloca (int32 num)  cil managed 
    {
        // Method begins at RVA 0x52f8
	// Code size 308 (0x134)
	.maxstack 16
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		bool	V_1,
		bool	V_2,
		unsigned int8	V_3,
		int16	V_4)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 0
	IL_0021:  bge IL_002b

	IL_0026:  br IL_003b

	IL_002b:  ldc.i4 1
	IL_0030:  stloc 1

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  br IL_0040

	IL_003b:  br IL_0040

	IL_0040:  ldarg 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  ldc.i4 255
	IL_004b:  ble IL_0055

	IL_0050:  br IL_0065

	IL_0055:  ldc.i4 1
	IL_005a:  stloc 2

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  br IL_006a

	IL_0065:  br IL_006a

	IL_006a:  ldloc 1

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldloc 2

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  and 
	IL_0077:  stloc 2

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldc.i4 1
	IL_0088:  beq IL_0092

	IL_008d:  br IL_00d3

	IL_0092:  ldstr "ldloca.s"
	IL_0097:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_009c:  stloc 0

	IL_00a0:  nop 
	IL_00a1:  nop 
	IL_00a2:  ldarg 0

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int32)
	IL_00ad:  stloc 3

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00b8:  ldloc 0

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  ldloc 3

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, unsigned int8)
	IL_00c9:  br IL_0133

	IL_00ce:  br IL_00d8

	IL_00d3:  br IL_00d8

	IL_00d8:  ldloc 1

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  ldc.i4 1
	IL_00e3:  beq IL_00ed

	IL_00e8:  br IL_012e

	IL_00ed:  ldstr "ldloca"
	IL_00f2:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00f7:  stloc 0

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  call int16 class [mscorlib]System.Convert::ToInt16(int32)
	IL_0108:  stloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0113:  ldloc 0

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 4

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int16)
	IL_0124:  br IL_0133

	IL_0129:  br IL_0133

	IL_012e:  br IL_0133

	IL_0133:  ret 
    } // end of method ILEmitter::EmitLdloca

    // method line 22
    .method public static 
           default void EmitLdarg (int32 num)  cil managed 
    {
        // Method begins at RVA 0x5438
	// Code size 580 (0x244)
	.maxstack 32
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		bool	V_1,
		bool	V_2,
		unsigned int8	V_3,
		int16	V_4)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 0
	IL_0021:  beq IL_002b

	IL_0026:  br IL_0055

	IL_002b:  ldstr "ldarg.0"
	IL_0030:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0035:  stloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0040:  ldloc 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_004b:  br IL_0243

	IL_0050:  br IL_005a

	IL_0055:  br IL_005a

	IL_005a:  ldarg 0

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldc.i4 1
	IL_0065:  beq IL_006f

	IL_006a:  br IL_0099

	IL_006f:  ldstr "ldarg.1"
	IL_0074:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0079:  stloc 0

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0084:  ldloc 0

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_008f:  br IL_0243

	IL_0094:  br IL_009e

	IL_0099:  br IL_009e

	IL_009e:  ldarg 0

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldc.i4 2
	IL_00a9:  beq IL_00b3

	IL_00ae:  br IL_00dd

	IL_00b3:  ldstr "ldarg.2"
	IL_00b8:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00bd:  stloc 0

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00c8:  ldloc 0

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d3:  br IL_0243

	IL_00d8:  br IL_00e2

	IL_00dd:  br IL_00e2

	IL_00e2:  ldarg 0

	IL_00e6:  nop 
	IL_00e7:  nop 
	IL_00e8:  ldc.i4 3
	IL_00ed:  beq IL_00f7

	IL_00f2:  br IL_0121

	IL_00f7:  ldstr "ldarg.3"
	IL_00fc:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0101:  stloc 0

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_010c:  ldloc 0

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0117:  br IL_0243

	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  ldarg 0

	IL_012a:  nop 
	IL_012b:  nop 
	IL_012c:  ldc.i4 0
	IL_0131:  bge IL_013b

	IL_0136:  br IL_014b

	IL_013b:  ldc.i4 1
	IL_0140:  stloc 1

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  br IL_0150

	IL_014b:  br IL_0150

	IL_0150:  ldarg 0

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldc.i4 255
	IL_015b:  ble IL_0165

	IL_0160:  br IL_0175

	IL_0165:  ldc.i4 1
	IL_016a:  stloc 2

	IL_016e:  nop 
	IL_016f:  nop 
	IL_0170:  br IL_017a

	IL_0175:  br IL_017a

	IL_017a:  ldloc 1

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldloc 2

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  and 
	IL_0187:  stloc 2

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  ldloc 2

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldc.i4 1
	IL_0198:  beq IL_01a2

	IL_019d:  br IL_01e3

	IL_01a2:  ldstr "ldarg.s"
	IL_01a7:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01ac:  stloc 0

	IL_01b0:  nop 
	IL_01b1:  nop 
	IL_01b2:  ldarg 0

	IL_01b6:  nop 
	IL_01b7:  nop 
	IL_01b8:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int32)
	IL_01bd:  stloc 3

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01c8:  ldloc 0

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldloc 3

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, unsigned int8)
	IL_01d9:  br IL_0243

	IL_01de:  br IL_01e8

	IL_01e3:  br IL_01e8

	IL_01e8:  ldloc 1

	IL_01ec:  nop 
	IL_01ed:  nop 
	IL_01ee:  ldc.i4 1
	IL_01f3:  beq IL_01fd

	IL_01f8:  br IL_023e

	IL_01fd:  ldstr "ldarg"
	IL_0202:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0207:  stloc 0

	IL_020b:  nop 
	IL_020c:  nop 
	IL_020d:  ldarg 0

	IL_0211:  nop 
	IL_0212:  nop 
	IL_0213:  call int16 class [mscorlib]System.Convert::ToInt16(int32)
	IL_0218:  stloc 4

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0223:  ldloc 0

	IL_0227:  nop 
	IL_0228:  nop 
	IL_0229:  ldloc 4

	IL_022d:  nop 
	IL_022e:  nop 
	IL_022f:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int16)
	IL_0234:  br IL_0243

	IL_0239:  br IL_0243

	IL_023e:  br IL_0243

	IL_0243:  ret 
    } // end of method ILEmitter::EmitLdarg

    // method line 23
    .method public static 
           default void EmitLdarga (int32 num)  cil managed 
    {
        // Method begins at RVA 0x5688
	// Code size 308 (0x134)
	.maxstack 16
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		bool	V_1,
		bool	V_2,
		unsigned int8	V_3,
		int16	V_4)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 0
	IL_0021:  bge IL_002b

	IL_0026:  br IL_003b

	IL_002b:  ldc.i4 1
	IL_0030:  stloc 1

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  br IL_0040

	IL_003b:  br IL_0040

	IL_0040:  ldarg 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  ldc.i4 255
	IL_004b:  ble IL_0055

	IL_0050:  br IL_0065

	IL_0055:  ldc.i4 1
	IL_005a:  stloc 2

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  br IL_006a

	IL_0065:  br IL_006a

	IL_006a:  ldloc 1

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldloc 2

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  and 
	IL_0077:  stloc 2

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldc.i4 1
	IL_0088:  beq IL_0092

	IL_008d:  br IL_00d3

	IL_0092:  ldstr "ldarga.s"
	IL_0097:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_009c:  stloc 0

	IL_00a0:  nop 
	IL_00a1:  nop 
	IL_00a2:  ldarg 0

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int32)
	IL_00ad:  stloc 3

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00b8:  ldloc 0

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  ldloc 3

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, unsigned int8)
	IL_00c9:  br IL_0133

	IL_00ce:  br IL_00d8

	IL_00d3:  br IL_00d8

	IL_00d8:  ldloc 1

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  ldc.i4 1
	IL_00e3:  beq IL_00ed

	IL_00e8:  br IL_012e

	IL_00ed:  ldstr "ldarga"
	IL_00f2:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00f7:  stloc 0

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  call int16 class [mscorlib]System.Convert::ToInt16(int32)
	IL_0108:  stloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0113:  ldloc 0

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 4

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int16)
	IL_0124:  br IL_0133

	IL_0129:  br IL_0133

	IL_012e:  br IL_0133

	IL_0133:  ret 
    } // end of method ILEmitter::EmitLdarga

    // method line 24
    .method public static 
           default void EmitStloc (int32 num)  cil managed 
    {
        // Method begins at RVA 0x57c8
	// Code size 580 (0x244)
	.maxstack 32
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		bool	V_1,
		bool	V_2,
		unsigned int8	V_3,
		int16	V_4)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 0
	IL_0021:  beq IL_002b

	IL_0026:  br IL_0055

	IL_002b:  ldstr "stloc.0"
	IL_0030:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0035:  stloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0040:  ldloc 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_004b:  br IL_0243

	IL_0050:  br IL_005a

	IL_0055:  br IL_005a

	IL_005a:  ldarg 0

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldc.i4 1
	IL_0065:  beq IL_006f

	IL_006a:  br IL_0099

	IL_006f:  ldstr "stloc.1"
	IL_0074:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0079:  stloc 0

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0084:  ldloc 0

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_008f:  br IL_0243

	IL_0094:  br IL_009e

	IL_0099:  br IL_009e

	IL_009e:  ldarg 0

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldc.i4 2
	IL_00a9:  beq IL_00b3

	IL_00ae:  br IL_00dd

	IL_00b3:  ldstr "stloc.2"
	IL_00b8:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00bd:  stloc 0

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00c8:  ldloc 0

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d3:  br IL_0243

	IL_00d8:  br IL_00e2

	IL_00dd:  br IL_00e2

	IL_00e2:  ldarg 0

	IL_00e6:  nop 
	IL_00e7:  nop 
	IL_00e8:  ldc.i4 3
	IL_00ed:  beq IL_00f7

	IL_00f2:  br IL_0121

	IL_00f7:  ldstr "stloc.3"
	IL_00fc:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0101:  stloc 0

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_010c:  ldloc 0

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0117:  br IL_0243

	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  ldarg 0

	IL_012a:  nop 
	IL_012b:  nop 
	IL_012c:  ldc.i4 0
	IL_0131:  bge IL_013b

	IL_0136:  br IL_014b

	IL_013b:  ldc.i4 1
	IL_0140:  stloc 1

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  br IL_0150

	IL_014b:  br IL_0150

	IL_0150:  ldarg 0

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldc.i4 255
	IL_015b:  ble IL_0165

	IL_0160:  br IL_0175

	IL_0165:  ldc.i4 1
	IL_016a:  stloc 2

	IL_016e:  nop 
	IL_016f:  nop 
	IL_0170:  br IL_017a

	IL_0175:  br IL_017a

	IL_017a:  ldloc 1

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldloc 2

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  and 
	IL_0187:  stloc 2

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  ldloc 2

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldc.i4 1
	IL_0198:  beq IL_01a2

	IL_019d:  br IL_01e3

	IL_01a2:  ldstr "stloc.s"
	IL_01a7:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01ac:  stloc 0

	IL_01b0:  nop 
	IL_01b1:  nop 
	IL_01b2:  ldarg 0

	IL_01b6:  nop 
	IL_01b7:  nop 
	IL_01b8:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int32)
	IL_01bd:  stloc 3

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01c8:  ldloc 0

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldloc 3

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, unsigned int8)
	IL_01d9:  br IL_0243

	IL_01de:  br IL_01e8

	IL_01e3:  br IL_01e8

	IL_01e8:  ldloc 1

	IL_01ec:  nop 
	IL_01ed:  nop 
	IL_01ee:  ldc.i4 1
	IL_01f3:  beq IL_01fd

	IL_01f8:  br IL_023e

	IL_01fd:  ldstr "stloc"
	IL_0202:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0207:  stloc 0

	IL_020b:  nop 
	IL_020c:  nop 
	IL_020d:  ldarg 0

	IL_0211:  nop 
	IL_0212:  nop 
	IL_0213:  call int16 class [mscorlib]System.Convert::ToInt16(int32)
	IL_0218:  stloc 4

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0223:  ldloc 0

	IL_0227:  nop 
	IL_0228:  nop 
	IL_0229:  ldloc 4

	IL_022d:  nop 
	IL_022e:  nop 
	IL_022f:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int16)
	IL_0234:  br IL_0243

	IL_0239:  br IL_0243

	IL_023e:  br IL_0243

	IL_0243:  ret 
    } // end of method ILEmitter::EmitStloc

    // method line 25
    .method public static 
           default void EmitStarg (int32 num)  cil managed 
    {
        // Method begins at RVA 0x5a18
	// Code size 308 (0x134)
	.maxstack 16
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		bool	V_1,
		bool	V_2,
		unsigned int8	V_3,
		int16	V_4)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 0
	IL_0021:  bge IL_002b

	IL_0026:  br IL_003b

	IL_002b:  ldc.i4 1
	IL_0030:  stloc 1

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  br IL_0040

	IL_003b:  br IL_0040

	IL_0040:  ldarg 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  ldc.i4 255
	IL_004b:  ble IL_0055

	IL_0050:  br IL_0065

	IL_0055:  ldc.i4 1
	IL_005a:  stloc 2

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  br IL_006a

	IL_0065:  br IL_006a

	IL_006a:  ldloc 1

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldloc 2

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  and 
	IL_0077:  stloc 2

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldc.i4 1
	IL_0088:  beq IL_0092

	IL_008d:  br IL_00d3

	IL_0092:  ldstr "starg.s"
	IL_0097:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_009c:  stloc 0

	IL_00a0:  nop 
	IL_00a1:  nop 
	IL_00a2:  ldarg 0

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int32)
	IL_00ad:  stloc 3

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00b8:  ldloc 0

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  ldloc 3

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, unsigned int8)
	IL_00c9:  br IL_0133

	IL_00ce:  br IL_00d8

	IL_00d3:  br IL_00d8

	IL_00d8:  ldloc 1

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  ldc.i4 1
	IL_00e3:  beq IL_00ed

	IL_00e8:  br IL_012e

	IL_00ed:  ldstr "starg"
	IL_00f2:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00f7:  stloc 0

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  call int16 class [mscorlib]System.Convert::ToInt16(int32)
	IL_0108:  stloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0113:  ldloc 0

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 4

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int16)
	IL_0124:  br IL_0133

	IL_0129:  br IL_0133

	IL_012e:  br IL_0133

	IL_0133:  ret 
    } // end of method ILEmitter::EmitStarg

    // method line 26
    .method public static 
           default void EmitStfld (class [mscorlib]System.Reflection.FieldInfo fld)  cil managed 
    {
        // Method begins at RVA 0x5b58
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "stfld"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.FieldInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitStfld

    // method line 27
    .method public static 
           default void EmitStsfld (class [mscorlib]System.Reflection.FieldInfo fld)  cil managed 
    {
        // Method begins at RVA 0x5b8c
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "stsfld"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.FieldInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitStsfld

    // method line 28
    .method public static 
           default void EmitStelem (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x5bc0
	// Code size 981 (0x3d5)
	.maxstack 37
	.locals init (
		class [mscorlib]System.Type	V_0,
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_1,
		bool	V_2)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 2

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldtoken [mscorlib]System.IntPtr
	IL_0010:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0015:  stloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldloc 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldarg 0

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_002c:  stloc 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 2

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldc.i4 1
	IL_003d:  beq IL_0047

	IL_0042:  br IL_0071

	IL_0047:  ldstr "stelem.i"
	IL_004c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0051:  stloc 1

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0067:  br IL_03d4

	IL_006c:  br IL_0076

	IL_0071:  br IL_0076

	IL_0076:  ldtoken [mscorlib]System.SByte
	IL_007b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0080:  stloc 0

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldloc 0

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  ldarg 0

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0097:  stloc 2

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 2

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldc.i4 1
	IL_00a8:  beq IL_00b2

	IL_00ad:  br IL_00dc

	IL_00b2:  ldstr "stelem.i1"
	IL_00b7:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00bc:  stloc 1

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00c7:  ldloc 1

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d2:  br IL_03d4

	IL_00d7:  br IL_00e1

	IL_00dc:  br IL_00e1

	IL_00e1:  ldtoken [mscorlib]System.Int16
	IL_00e6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00eb:  stloc 0

	IL_00ef:  nop 
	IL_00f0:  nop 
	IL_00f1:  ldloc 0

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldarg 0

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0102:  stloc 2

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  ldloc 2

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldc.i4 1
	IL_0113:  beq IL_011d

	IL_0118:  br IL_0147

	IL_011d:  ldstr "stelem.i2"
	IL_0122:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0127:  stloc 1

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0132:  ldloc 1

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_013d:  br IL_03d4

	IL_0142:  br IL_014c

	IL_0147:  br IL_014c

	IL_014c:  ldtoken [mscorlib]System.Int32
	IL_0151:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0156:  stloc 0

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldloc 0

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldarg 0

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_016d:  stloc 2

	IL_0171:  nop 
	IL_0172:  nop 
	IL_0173:  ldloc 2

	IL_0177:  nop 
	IL_0178:  nop 
	IL_0179:  ldc.i4 1
	IL_017e:  beq IL_0188

	IL_0183:  br IL_01b2

	IL_0188:  ldstr "stelem.i4"
	IL_018d:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0192:  stloc 1

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_019d:  ldloc 1

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01a8:  br IL_03d4

	IL_01ad:  br IL_01b7

	IL_01b2:  br IL_01b7

	IL_01b7:  ldtoken [mscorlib]System.Int64
	IL_01bc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01c1:  stloc 0

	IL_01c5:  nop 
	IL_01c6:  nop 
	IL_01c7:  ldloc 0

	IL_01cb:  nop 
	IL_01cc:  nop 
	IL_01cd:  ldarg 0

	IL_01d1:  nop 
	IL_01d2:  nop 
	IL_01d3:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_01d8:  stloc 2

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 2

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldc.i4 1
	IL_01e9:  beq IL_01f3

	IL_01ee:  br IL_021d

	IL_01f3:  ldstr "stelem.i8"
	IL_01f8:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01fd:  stloc 1

	IL_0201:  nop 
	IL_0202:  nop 
	IL_0203:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0208:  ldloc 1

	IL_020c:  nop 
	IL_020d:  nop 
	IL_020e:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0213:  br IL_03d4

	IL_0218:  br IL_0222

	IL_021d:  br IL_0222

	IL_0222:  ldtoken [mscorlib]System.Single
	IL_0227:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_022c:  stloc 0

	IL_0230:  nop 
	IL_0231:  nop 
	IL_0232:  ldloc 0

	IL_0236:  nop 
	IL_0237:  nop 
	IL_0238:  ldarg 0

	IL_023c:  nop 
	IL_023d:  nop 
	IL_023e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0243:  stloc 2

	IL_0247:  nop 
	IL_0248:  nop 
	IL_0249:  ldloc 2

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  ldc.i4 1
	IL_0254:  beq IL_025e

	IL_0259:  br IL_0288

	IL_025e:  ldstr "stelem.r4"
	IL_0263:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0268:  stloc 1

	IL_026c:  nop 
	IL_026d:  nop 
	IL_026e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0273:  ldloc 1

	IL_0277:  nop 
	IL_0278:  nop 
	IL_0279:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_027e:  br IL_03d4

	IL_0283:  br IL_028d

	IL_0288:  br IL_028d

	IL_028d:  ldtoken [mscorlib]System.Double
	IL_0292:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0297:  stloc 0

	IL_029b:  nop 
	IL_029c:  nop 
	IL_029d:  ldloc 0

	IL_02a1:  nop 
	IL_02a2:  nop 
	IL_02a3:  ldarg 0

	IL_02a7:  nop 
	IL_02a8:  nop 
	IL_02a9:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_02ae:  stloc 2

	IL_02b2:  nop 
	IL_02b3:  nop 
	IL_02b4:  ldloc 2

	IL_02b8:  nop 
	IL_02b9:  nop 
	IL_02ba:  ldc.i4 1
	IL_02bf:  beq IL_02c9

	IL_02c4:  br IL_02f3

	IL_02c9:  ldstr "stelem.r8"
	IL_02ce:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02d3:  stloc 1

	IL_02d7:  nop 
	IL_02d8:  nop 
	IL_02d9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02de:  ldloc 1

	IL_02e2:  nop 
	IL_02e3:  nop 
	IL_02e4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_02e9:  br IL_03d4

	IL_02ee:  br IL_02f8

	IL_02f3:  br IL_02f8

	IL_02f8:  ldtoken [mscorlib]System.ValueType
	IL_02fd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0302:  stloc 0

	IL_0306:  nop 
	IL_0307:  nop 
	IL_0308:  ldloc 0

	IL_030c:  nop 
	IL_030d:  nop 
	IL_030e:  ldarg 0

	IL_0312:  nop 
	IL_0313:  nop 
	IL_0314:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_0319:  stloc 2

	IL_031d:  nop 
	IL_031e:  nop 
	IL_031f:  ldloc 2

	IL_0323:  nop 
	IL_0324:  nop 
	IL_0325:  ldc.i4 1
	IL_032a:  beq IL_0334

	IL_032f:  br IL_0364

	IL_0334:  ldstr "stelem"
	IL_0339:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_033e:  stloc 1

	IL_0342:  nop 
	IL_0343:  nop 
	IL_0344:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0349:  ldloc 1

	IL_034d:  nop 
	IL_034e:  nop 
	IL_034f:  ldarg 0

	IL_0353:  nop 
	IL_0354:  nop 
	IL_0355:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_035a:  br IL_03d4

	IL_035f:  br IL_0369

	IL_0364:  br IL_0369

	IL_0369:  ldtoken [mscorlib]System.Object
	IL_036e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0373:  stloc 0

	IL_0377:  nop 
	IL_0378:  nop 
	IL_0379:  ldloc 0

	IL_037d:  nop 
	IL_037e:  nop 
	IL_037f:  ldarg 0

	IL_0383:  nop 
	IL_0384:  nop 
	IL_0385:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_038a:  stloc 2

	IL_038e:  nop 
	IL_038f:  nop 
	IL_0390:  ldloc 2

	IL_0394:  nop 
	IL_0395:  nop 
	IL_0396:  ldc.i4 1
	IL_039b:  beq IL_03a5

	IL_03a0:  br IL_03cf

	IL_03a5:  ldstr "stelem.ref"
	IL_03aa:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_03af:  stloc 1

	IL_03b3:  nop 
	IL_03b4:  nop 
	IL_03b5:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03ba:  ldloc 1

	IL_03be:  nop 
	IL_03bf:  nop 
	IL_03c0:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03c5:  br IL_03d4

	IL_03ca:  br IL_03d4

	IL_03cf:  br IL_03d4

	IL_03d4:  ret 
    } // end of method ILEmitter::EmitStelem

    // method line 29
    .method public static 
           default void EmitLdelem (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x5fa4
	// Code size 1302 (0x516)
	.maxstack 49
	.locals init (
		class [mscorlib]System.Type	V_0,
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_1,
		bool	V_2)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 2

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldtoken [mscorlib]System.IntPtr
	IL_0010:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0015:  stloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldloc 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldarg 0

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_002c:  stloc 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 2

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldc.i4 1
	IL_003d:  beq IL_0047

	IL_0042:  br IL_0071

	IL_0047:  ldstr "ldelem.i"
	IL_004c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0051:  stloc 1

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0067:  br IL_0515

	IL_006c:  br IL_0076

	IL_0071:  br IL_0076

	IL_0076:  ldtoken [mscorlib]System.SByte
	IL_007b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0080:  stloc 0

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldloc 0

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  ldarg 0

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0097:  stloc 2

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 2

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldc.i4 1
	IL_00a8:  beq IL_00b2

	IL_00ad:  br IL_00dc

	IL_00b2:  ldstr "ldelem.i1"
	IL_00b7:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00bc:  stloc 1

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00c7:  ldloc 1

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d2:  br IL_0515

	IL_00d7:  br IL_00e1

	IL_00dc:  br IL_00e1

	IL_00e1:  ldtoken [mscorlib]System.Int16
	IL_00e6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00eb:  stloc 0

	IL_00ef:  nop 
	IL_00f0:  nop 
	IL_00f1:  ldloc 0

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldarg 0

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0102:  stloc 2

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  ldloc 2

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldc.i4 1
	IL_0113:  beq IL_011d

	IL_0118:  br IL_0147

	IL_011d:  ldstr "ldelem.i2"
	IL_0122:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0127:  stloc 1

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0132:  ldloc 1

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_013d:  br IL_0515

	IL_0142:  br IL_014c

	IL_0147:  br IL_014c

	IL_014c:  ldtoken [mscorlib]System.Int32
	IL_0151:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0156:  stloc 0

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldloc 0

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldarg 0

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_016d:  stloc 2

	IL_0171:  nop 
	IL_0172:  nop 
	IL_0173:  ldloc 2

	IL_0177:  nop 
	IL_0178:  nop 
	IL_0179:  ldc.i4 1
	IL_017e:  beq IL_0188

	IL_0183:  br IL_01b2

	IL_0188:  ldstr "ldelem.i4"
	IL_018d:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0192:  stloc 1

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_019d:  ldloc 1

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01a8:  br IL_0515

	IL_01ad:  br IL_01b7

	IL_01b2:  br IL_01b7

	IL_01b7:  ldtoken [mscorlib]System.Byte
	IL_01bc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01c1:  stloc 0

	IL_01c5:  nop 
	IL_01c6:  nop 
	IL_01c7:  ldloc 0

	IL_01cb:  nop 
	IL_01cc:  nop 
	IL_01cd:  ldarg 0

	IL_01d1:  nop 
	IL_01d2:  nop 
	IL_01d3:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_01d8:  stloc 2

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 2

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldc.i4 1
	IL_01e9:  beq IL_01f3

	IL_01ee:  br IL_021d

	IL_01f3:  ldstr "ldelem.u1"
	IL_01f8:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01fd:  stloc 1

	IL_0201:  nop 
	IL_0202:  nop 
	IL_0203:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0208:  ldloc 1

	IL_020c:  nop 
	IL_020d:  nop 
	IL_020e:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0213:  br IL_0515

	IL_0218:  br IL_0222

	IL_021d:  br IL_0222

	IL_0222:  ldtoken [mscorlib]System.UInt16
	IL_0227:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_022c:  stloc 0

	IL_0230:  nop 
	IL_0231:  nop 
	IL_0232:  ldloc 0

	IL_0236:  nop 
	IL_0237:  nop 
	IL_0238:  ldarg 0

	IL_023c:  nop 
	IL_023d:  nop 
	IL_023e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0243:  stloc 2

	IL_0247:  nop 
	IL_0248:  nop 
	IL_0249:  ldloc 2

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  ldc.i4 1
	IL_0254:  beq IL_025e

	IL_0259:  br IL_0288

	IL_025e:  ldstr "ldelem.u2"
	IL_0263:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0268:  stloc 1

	IL_026c:  nop 
	IL_026d:  nop 
	IL_026e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0273:  ldloc 1

	IL_0277:  nop 
	IL_0278:  nop 
	IL_0279:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_027e:  br IL_0515

	IL_0283:  br IL_028d

	IL_0288:  br IL_028d

	IL_028d:  ldtoken [mscorlib]System.UInt32
	IL_0292:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0297:  stloc 0

	IL_029b:  nop 
	IL_029c:  nop 
	IL_029d:  ldloc 0

	IL_02a1:  nop 
	IL_02a2:  nop 
	IL_02a3:  ldarg 0

	IL_02a7:  nop 
	IL_02a8:  nop 
	IL_02a9:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_02ae:  stloc 2

	IL_02b2:  nop 
	IL_02b3:  nop 
	IL_02b4:  ldloc 2

	IL_02b8:  nop 
	IL_02b9:  nop 
	IL_02ba:  ldc.i4 1
	IL_02bf:  beq IL_02c9

	IL_02c4:  br IL_02f3

	IL_02c9:  ldstr "ldelem.u4"
	IL_02ce:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02d3:  stloc 1

	IL_02d7:  nop 
	IL_02d8:  nop 
	IL_02d9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02de:  ldloc 1

	IL_02e2:  nop 
	IL_02e3:  nop 
	IL_02e4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_02e9:  br IL_0515

	IL_02ee:  br IL_02f8

	IL_02f3:  br IL_02f8

	IL_02f8:  ldtoken [mscorlib]System.Int64
	IL_02fd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0302:  stloc 0

	IL_0306:  nop 
	IL_0307:  nop 
	IL_0308:  ldloc 0

	IL_030c:  nop 
	IL_030d:  nop 
	IL_030e:  ldarg 0

	IL_0312:  nop 
	IL_0313:  nop 
	IL_0314:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0319:  stloc 2

	IL_031d:  nop 
	IL_031e:  nop 
	IL_031f:  ldloc 2

	IL_0323:  nop 
	IL_0324:  nop 
	IL_0325:  ldc.i4 1
	IL_032a:  beq IL_0334

	IL_032f:  br IL_035e

	IL_0334:  ldstr "ldelem.i8"
	IL_0339:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_033e:  stloc 1

	IL_0342:  nop 
	IL_0343:  nop 
	IL_0344:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0349:  ldloc 1

	IL_034d:  nop 
	IL_034e:  nop 
	IL_034f:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0354:  br IL_0515

	IL_0359:  br IL_0363

	IL_035e:  br IL_0363

	IL_0363:  ldtoken [mscorlib]System.Single
	IL_0368:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_036d:  stloc 0

	IL_0371:  nop 
	IL_0372:  nop 
	IL_0373:  ldloc 0

	IL_0377:  nop 
	IL_0378:  nop 
	IL_0379:  ldarg 0

	IL_037d:  nop 
	IL_037e:  nop 
	IL_037f:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0384:  stloc 2

	IL_0388:  nop 
	IL_0389:  nop 
	IL_038a:  ldloc 2

	IL_038e:  nop 
	IL_038f:  nop 
	IL_0390:  ldc.i4 1
	IL_0395:  beq IL_039f

	IL_039a:  br IL_03c9

	IL_039f:  ldstr "ldelem.r4"
	IL_03a4:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_03a9:  stloc 1

	IL_03ad:  nop 
	IL_03ae:  nop 
	IL_03af:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03b4:  ldloc 1

	IL_03b8:  nop 
	IL_03b9:  nop 
	IL_03ba:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03bf:  br IL_0515

	IL_03c4:  br IL_03ce

	IL_03c9:  br IL_03ce

	IL_03ce:  ldtoken [mscorlib]System.Double
	IL_03d3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03d8:  stloc 0

	IL_03dc:  nop 
	IL_03dd:  nop 
	IL_03de:  ldloc 0

	IL_03e2:  nop 
	IL_03e3:  nop 
	IL_03e4:  ldarg 0

	IL_03e8:  nop 
	IL_03e9:  nop 
	IL_03ea:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_03ef:  stloc 2

	IL_03f3:  nop 
	IL_03f4:  nop 
	IL_03f5:  ldloc 2

	IL_03f9:  nop 
	IL_03fa:  nop 
	IL_03fb:  ldc.i4 1
	IL_0400:  beq IL_040a

	IL_0405:  br IL_0434

	IL_040a:  ldstr "ldelem.r8"
	IL_040f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0414:  stloc 1

	IL_0418:  nop 
	IL_0419:  nop 
	IL_041a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_041f:  ldloc 1

	IL_0423:  nop 
	IL_0424:  nop 
	IL_0425:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_042a:  br IL_0515

	IL_042f:  br IL_0439

	IL_0434:  br IL_0439

	IL_0439:  ldtoken [mscorlib]System.ValueType
	IL_043e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0443:  stloc 0

	IL_0447:  nop 
	IL_0448:  nop 
	IL_0449:  ldloc 0

	IL_044d:  nop 
	IL_044e:  nop 
	IL_044f:  ldarg 0

	IL_0453:  nop 
	IL_0454:  nop 
	IL_0455:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_045a:  stloc 2

	IL_045e:  nop 
	IL_045f:  nop 
	IL_0460:  ldloc 2

	IL_0464:  nop 
	IL_0465:  nop 
	IL_0466:  ldc.i4 1
	IL_046b:  beq IL_0475

	IL_0470:  br IL_04a5

	IL_0475:  ldstr "ldelem"
	IL_047a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_047f:  stloc 1

	IL_0483:  nop 
	IL_0484:  nop 
	IL_0485:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_048a:  ldloc 1

	IL_048e:  nop 
	IL_048f:  nop 
	IL_0490:  ldarg 0

	IL_0494:  nop 
	IL_0495:  nop 
	IL_0496:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_049b:  br IL_0515

	IL_04a0:  br IL_04aa

	IL_04a5:  br IL_04aa

	IL_04aa:  ldtoken [mscorlib]System.Object
	IL_04af:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04b4:  stloc 0

	IL_04b8:  nop 
	IL_04b9:  nop 
	IL_04ba:  ldloc 0

	IL_04be:  nop 
	IL_04bf:  nop 
	IL_04c0:  ldarg 0

	IL_04c4:  nop 
	IL_04c5:  nop 
	IL_04c6:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_04cb:  stloc 2

	IL_04cf:  nop 
	IL_04d0:  nop 
	IL_04d1:  ldloc 2

	IL_04d5:  nop 
	IL_04d6:  nop 
	IL_04d7:  ldc.i4 1
	IL_04dc:  beq IL_04e6

	IL_04e1:  br IL_0510

	IL_04e6:  ldstr "ldelem.ref"
	IL_04eb:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_04f0:  stloc 1

	IL_04f4:  nop 
	IL_04f5:  nop 
	IL_04f6:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_04fb:  ldloc 1

	IL_04ff:  nop 
	IL_0500:  nop 
	IL_0501:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0506:  br IL_0515

	IL_050b:  br IL_0515

	IL_0510:  br IL_0515

	IL_0515:  ret 
    } // end of method ILEmitter::EmitLdelem

    // method line 30
    .method public static 
           default void EmitLdelema (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x64c8
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldelema"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdelema

    // method line 31
    .method public static 
           default void EmitLdcI8 (int64 n)  cil managed 
    {
        // Method begins at RVA 0x64fc
	// Code size 1340 (0x53c)
	.maxstack 54
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		bool	V_1,
		bool	V_2,
		int32	V_3)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i8 0xffffffffffffffff
	IL_0025:  beq IL_002f

	IL_002a:  br IL_0079

	IL_002f:  ldstr "ldc.i4.m1"
	IL_0034:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0039:  stloc 0

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0044:  ldloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_004f:  ldstr "conv.i8"
	IL_0054:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0059:  stloc 0

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0064:  ldloc 0

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_006f:  br IL_053b

	IL_0074:  br IL_007e

	IL_0079:  br IL_007e

	IL_007e:  ldarg 0

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldc.i8 0x0
	IL_008d:  beq IL_0097

	IL_0092:  br IL_00e1

	IL_0097:  ldstr "ldc.i4.0"
	IL_009c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00a1:  stloc 0

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ac:  ldloc 0

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00b7:  ldstr "conv.i8"
	IL_00bc:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00c1:  stloc 0

	IL_00c5:  nop 
	IL_00c6:  nop 
	IL_00c7:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00cc:  ldloc 0

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d7:  br IL_053b

	IL_00dc:  br IL_00e6

	IL_00e1:  br IL_00e6

	IL_00e6:  ldarg 0

	IL_00ea:  nop 
	IL_00eb:  nop 
	IL_00ec:  ldc.i8 0x1
	IL_00f5:  beq IL_00ff

	IL_00fa:  br IL_0149

	IL_00ff:  ldstr "ldc.i4.1"
	IL_0104:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0109:  stloc 0

	IL_010d:  nop 
	IL_010e:  nop 
	IL_010f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0114:  ldloc 0

	IL_0118:  nop 
	IL_0119:  nop 
	IL_011a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_011f:  ldstr "conv.i8"
	IL_0124:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0129:  stloc 0

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0134:  ldloc 0

	IL_0138:  nop 
	IL_0139:  nop 
	IL_013a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_013f:  br IL_053b

	IL_0144:  br IL_014e

	IL_0149:  br IL_014e

	IL_014e:  ldarg 0

	IL_0152:  nop 
	IL_0153:  nop 
	IL_0154:  ldc.i8 0x2
	IL_015d:  beq IL_0167

	IL_0162:  br IL_01b1

	IL_0167:  ldstr "ldc.i4.2"
	IL_016c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0171:  stloc 0

	IL_0175:  nop 
	IL_0176:  nop 
	IL_0177:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_017c:  ldloc 0

	IL_0180:  nop 
	IL_0181:  nop 
	IL_0182:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0187:  ldstr "conv.i8"
	IL_018c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0191:  stloc 0

	IL_0195:  nop 
	IL_0196:  nop 
	IL_0197:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_019c:  ldloc 0

	IL_01a0:  nop 
	IL_01a1:  nop 
	IL_01a2:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01a7:  br IL_053b

	IL_01ac:  br IL_01b6

	IL_01b1:  br IL_01b6

	IL_01b6:  ldarg 0

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  ldc.i8 0x3
	IL_01c5:  beq IL_01cf

	IL_01ca:  br IL_0219

	IL_01cf:  ldstr "ldc.i4.3"
	IL_01d4:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01d9:  stloc 0

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01e4:  ldloc 0

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01ef:  ldstr "conv.i8"
	IL_01f4:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01f9:  stloc 0

	IL_01fd:  nop 
	IL_01fe:  nop 
	IL_01ff:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0204:  ldloc 0

	IL_0208:  nop 
	IL_0209:  nop 
	IL_020a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_020f:  br IL_053b

	IL_0214:  br IL_021e

	IL_0219:  br IL_021e

	IL_021e:  ldarg 0

	IL_0222:  nop 
	IL_0223:  nop 
	IL_0224:  ldc.i8 0x4
	IL_022d:  beq IL_0237

	IL_0232:  br IL_0281

	IL_0237:  ldstr "ldc.i4.4"
	IL_023c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0241:  stloc 0

	IL_0245:  nop 
	IL_0246:  nop 
	IL_0247:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_024c:  ldloc 0

	IL_0250:  nop 
	IL_0251:  nop 
	IL_0252:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0257:  ldstr "conv.i8"
	IL_025c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0261:  stloc 0

	IL_0265:  nop 
	IL_0266:  nop 
	IL_0267:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_026c:  ldloc 0

	IL_0270:  nop 
	IL_0271:  nop 
	IL_0272:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0277:  br IL_053b

	IL_027c:  br IL_0286

	IL_0281:  br IL_0286

	IL_0286:  ldarg 0

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  ldc.i8 0x5
	IL_0295:  beq IL_029f

	IL_029a:  br IL_02e9

	IL_029f:  ldstr "ldc.i4.5"
	IL_02a4:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02a9:  stloc 0

	IL_02ad:  nop 
	IL_02ae:  nop 
	IL_02af:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02b4:  ldloc 0

	IL_02b8:  nop 
	IL_02b9:  nop 
	IL_02ba:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_02bf:  ldstr "conv.i8"
	IL_02c4:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02c9:  stloc 0

	IL_02cd:  nop 
	IL_02ce:  nop 
	IL_02cf:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02d4:  ldloc 0

	IL_02d8:  nop 
	IL_02d9:  nop 
	IL_02da:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_02df:  br IL_053b

	IL_02e4:  br IL_02ee

	IL_02e9:  br IL_02ee

	IL_02ee:  ldarg 0

	IL_02f2:  nop 
	IL_02f3:  nop 
	IL_02f4:  ldc.i8 0x6
	IL_02fd:  beq IL_0307

	IL_0302:  br IL_0351

	IL_0307:  ldstr "ldc.i4.6"
	IL_030c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0311:  stloc 0

	IL_0315:  nop 
	IL_0316:  nop 
	IL_0317:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_031c:  ldloc 0

	IL_0320:  nop 
	IL_0321:  nop 
	IL_0322:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0327:  ldstr "conv.i8"
	IL_032c:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0331:  stloc 0

	IL_0335:  nop 
	IL_0336:  nop 
	IL_0337:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_033c:  ldloc 0

	IL_0340:  nop 
	IL_0341:  nop 
	IL_0342:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0347:  br IL_053b

	IL_034c:  br IL_0356

	IL_0351:  br IL_0356

	IL_0356:  ldarg 0

	IL_035a:  nop 
	IL_035b:  nop 
	IL_035c:  ldc.i8 0x7
	IL_0365:  beq IL_036f

	IL_036a:  br IL_03b9

	IL_036f:  ldstr "ldc.i4.7"
	IL_0374:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0379:  stloc 0

	IL_037d:  nop 
	IL_037e:  nop 
	IL_037f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0384:  ldloc 0

	IL_0388:  nop 
	IL_0389:  nop 
	IL_038a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_038f:  ldstr "conv.i8"
	IL_0394:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0399:  stloc 0

	IL_039d:  nop 
	IL_039e:  nop 
	IL_039f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03a4:  ldloc 0

	IL_03a8:  nop 
	IL_03a9:  nop 
	IL_03aa:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03af:  br IL_053b

	IL_03b4:  br IL_03be

	IL_03b9:  br IL_03be

	IL_03be:  ldarg 0

	IL_03c2:  nop 
	IL_03c3:  nop 
	IL_03c4:  ldc.i8 0x8
	IL_03cd:  beq IL_03d7

	IL_03d2:  br IL_0421

	IL_03d7:  ldstr "ldc.i4.8"
	IL_03dc:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_03e1:  stloc 0

	IL_03e5:  nop 
	IL_03e6:  nop 
	IL_03e7:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03ec:  ldloc 0

	IL_03f0:  nop 
	IL_03f1:  nop 
	IL_03f2:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03f7:  ldstr "conv.i8"
	IL_03fc:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0401:  stloc 0

	IL_0405:  nop 
	IL_0406:  nop 
	IL_0407:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_040c:  ldloc 0

	IL_0410:  nop 
	IL_0411:  nop 
	IL_0412:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0417:  br IL_053b

	IL_041c:  br IL_0426

	IL_0421:  br IL_0426

	IL_0426:  ldarg 0

	IL_042a:  nop 
	IL_042b:  nop 
	IL_042c:  ldc.i8 0xffffffff80000000
	IL_0435:  bge IL_043f

	IL_043a:  br IL_044f

	IL_043f:  ldc.i4 1
	IL_0444:  stloc 1

	IL_0448:  nop 
	IL_0449:  nop 
	IL_044a:  br IL_0454

	IL_044f:  br IL_0454

	IL_0454:  ldarg 0

	IL_0458:  nop 
	IL_0459:  nop 
	IL_045a:  ldc.i8 0x7fffffff
	IL_0463:  ble IL_046d

	IL_0468:  br IL_047d

	IL_046d:  ldc.i4 1
	IL_0472:  stloc 2

	IL_0476:  nop 
	IL_0477:  nop 
	IL_0478:  br IL_0482

	IL_047d:  br IL_0482

	IL_0482:  ldloc 1

	IL_0486:  nop 
	IL_0487:  nop 
	IL_0488:  ldloc 2

	IL_048c:  nop 
	IL_048d:  nop 
	IL_048e:  and 
	IL_048f:  stloc 2

	IL_0493:  nop 
	IL_0494:  nop 
	IL_0495:  ldloc 2

	IL_0499:  nop 
	IL_049a:  nop 
	IL_049b:  ldc.i4 1
	IL_04a0:  beq IL_04aa

	IL_04a5:  br IL_050b

	IL_04aa:  ldstr "ldc.i4"
	IL_04af:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_04b4:  stloc 0

	IL_04b8:  nop 
	IL_04b9:  nop 
	IL_04ba:  ldarg 0

	IL_04be:  nop 
	IL_04bf:  nop 
	IL_04c0:  call int32 class [mscorlib]System.Convert::ToInt32(int64)
	IL_04c5:  stloc 3

	IL_04c9:  nop 
	IL_04ca:  nop 
	IL_04cb:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_04d0:  ldloc 0

	IL_04d4:  nop 
	IL_04d5:  nop 
	IL_04d6:  ldloc 3

	IL_04da:  nop 
	IL_04db:  nop 
	IL_04dc:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int32)
	IL_04e1:  ldstr "conv.i8"
	IL_04e6:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_04eb:  stloc 0

	IL_04ef:  nop 
	IL_04f0:  nop 
	IL_04f1:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_04f6:  ldloc 0

	IL_04fa:  nop 
	IL_04fb:  nop 
	IL_04fc:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0501:  br IL_053b

	IL_0506:  br IL_0510

	IL_050b:  br IL_0510

	IL_0510:  ldstr "ldc.i8"
	IL_0515:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_051a:  stloc 0

	IL_051e:  nop 
	IL_051f:  nop 
	IL_0520:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0525:  ldloc 0

	IL_0529:  nop 
	IL_052a:  nop 
	IL_052b:  ldarg 0

	IL_052f:  nop 
	IL_0530:  nop 
	IL_0531:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int64)
	IL_0536:  br IL_053b

	IL_053b:  ret 
    } // end of method ILEmitter::EmitLdcI8

    // method line 32
    .method public static 
           default void EmitLdcI4 (int32 num)  cil managed 
    {
        // Method begins at RVA 0x6a44
	// Code size 724 (0x2d4)
	.maxstack 43
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 -1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003f

	IL_0015:  ldstr "ldc.i4.m1"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_02d3

	IL_003a:  br IL_0044

	IL_003f:  br IL_0044

	IL_0044:  ldarg 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldc.i4 0
	IL_004f:  beq IL_0059

	IL_0054:  br IL_0083

	IL_0059:  ldstr "ldc.i4.0"
	IL_005e:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0063:  stloc 0

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_006e:  ldloc 0

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0079:  br IL_02d3

	IL_007e:  br IL_0088

	IL_0083:  br IL_0088

	IL_0088:  ldarg 0

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldc.i4 1
	IL_0093:  beq IL_009d

	IL_0098:  br IL_00c7

	IL_009d:  ldstr "ldc.i4.1"
	IL_00a2:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00a7:  stloc 0

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00b2:  ldloc 0

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00bd:  br IL_02d3

	IL_00c2:  br IL_00cc

	IL_00c7:  br IL_00cc

	IL_00cc:  ldarg 0

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  ldc.i4 2
	IL_00d7:  beq IL_00e1

	IL_00dc:  br IL_010b

	IL_00e1:  ldstr "ldc.i4.2"
	IL_00e6:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00eb:  stloc 0

	IL_00ef:  nop 
	IL_00f0:  nop 
	IL_00f1:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00f6:  ldloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0101:  br IL_02d3

	IL_0106:  br IL_0110

	IL_010b:  br IL_0110

	IL_0110:  ldarg 0

	IL_0114:  nop 
	IL_0115:  nop 
	IL_0116:  ldc.i4 3
	IL_011b:  beq IL_0125

	IL_0120:  br IL_014f

	IL_0125:  ldstr "ldc.i4.3"
	IL_012a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_012f:  stloc 0

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_013a:  ldloc 0

	IL_013e:  nop 
	IL_013f:  nop 
	IL_0140:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0145:  br IL_02d3

	IL_014a:  br IL_0154

	IL_014f:  br IL_0154

	IL_0154:  ldarg 0

	IL_0158:  nop 
	IL_0159:  nop 
	IL_015a:  ldc.i4 4
	IL_015f:  beq IL_0169

	IL_0164:  br IL_0193

	IL_0169:  ldstr "ldc.i4.4"
	IL_016e:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0173:  stloc 0

	IL_0177:  nop 
	IL_0178:  nop 
	IL_0179:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_017e:  ldloc 0

	IL_0182:  nop 
	IL_0183:  nop 
	IL_0184:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0189:  br IL_02d3

	IL_018e:  br IL_0198

	IL_0193:  br IL_0198

	IL_0198:  ldarg 0

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  ldc.i4 5
	IL_01a3:  beq IL_01ad

	IL_01a8:  br IL_01d7

	IL_01ad:  ldstr "ldc.i4.5"
	IL_01b2:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01b7:  stloc 0

	IL_01bb:  nop 
	IL_01bc:  nop 
	IL_01bd:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01c2:  ldloc 0

	IL_01c6:  nop 
	IL_01c7:  nop 
	IL_01c8:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01cd:  br IL_02d3

	IL_01d2:  br IL_01dc

	IL_01d7:  br IL_01dc

	IL_01dc:  ldarg 0

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  ldc.i4 6
	IL_01e7:  beq IL_01f1

	IL_01ec:  br IL_021b

	IL_01f1:  ldstr "ldc.i4.6"
	IL_01f6:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01fb:  stloc 0

	IL_01ff:  nop 
	IL_0200:  nop 
	IL_0201:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0206:  ldloc 0

	IL_020a:  nop 
	IL_020b:  nop 
	IL_020c:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0211:  br IL_02d3

	IL_0216:  br IL_0220

	IL_021b:  br IL_0220

	IL_0220:  ldarg 0

	IL_0224:  nop 
	IL_0225:  nop 
	IL_0226:  ldc.i4 7
	IL_022b:  beq IL_0235

	IL_0230:  br IL_025f

	IL_0235:  ldstr "ldc.i4.7"
	IL_023a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_023f:  stloc 0

	IL_0243:  nop 
	IL_0244:  nop 
	IL_0245:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_024a:  ldloc 0

	IL_024e:  nop 
	IL_024f:  nop 
	IL_0250:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0255:  br IL_02d3

	IL_025a:  br IL_0264

	IL_025f:  br IL_0264

	IL_0264:  ldarg 0

	IL_0268:  nop 
	IL_0269:  nop 
	IL_026a:  ldc.i4 8
	IL_026f:  beq IL_0279

	IL_0274:  br IL_02a3

	IL_0279:  ldstr "ldc.i4.8"
	IL_027e:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0283:  stloc 0

	IL_0287:  nop 
	IL_0288:  nop 
	IL_0289:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_028e:  ldloc 0

	IL_0292:  nop 
	IL_0293:  nop 
	IL_0294:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0299:  br IL_02d3

	IL_029e:  br IL_02a8

	IL_02a3:  br IL_02a8

	IL_02a8:  ldstr "ldc.i4"
	IL_02ad:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02b2:  stloc 0

	IL_02b6:  nop 
	IL_02b7:  nop 
	IL_02b8:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02bd:  ldloc 0

	IL_02c1:  nop 
	IL_02c2:  nop 
	IL_02c3:  ldarg 0

	IL_02c7:  nop 
	IL_02c8:  nop 
	IL_02c9:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int32)
	IL_02ce:  br IL_02d3

	IL_02d3:  ret 
    } // end of method ILEmitter::EmitLdcI4

    // method line 33
    .method public static 
           default void EmitLdcI2 (int16 n)  cil managed 
    {
        // Method begins at RVA 0x6d24
	// Code size 1093 (0x445)
	.maxstack 43
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		int32	V_1)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  call int32 class [mscorlib]System.Convert::ToInt32(int16)
	IL_000b:  stloc 1

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldloc 1

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldc.i4 -1
	IL_001c:  beq IL_0026

	IL_0021:  br IL_0070

	IL_0026:  ldstr "ldc.i4.m1"
	IL_002b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0030:  stloc 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_003b:  ldloc 0

	IL_003f:  nop 
	IL_0040:  nop 
	IL_0041:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0046:  ldstr "conv.i2"
	IL_004b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0050:  stloc 0

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_005b:  ldloc 0

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0066:  br IL_0444

	IL_006b:  br IL_0075

	IL_0070:  br IL_0075

	IL_0075:  ldloc 1

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldc.i4 0
	IL_0080:  beq IL_008a

	IL_0085:  br IL_00d4

	IL_008a:  ldstr "ldc.i4.0"
	IL_008f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0094:  stloc 0

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_009f:  ldloc 0

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00aa:  ldstr "conv.i2"
	IL_00af:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00b4:  stloc 0

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00bf:  ldloc 0

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00ca:  br IL_0444

	IL_00cf:  br IL_00d9

	IL_00d4:  br IL_00d9

	IL_00d9:  ldloc 1

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldc.i4 1
	IL_00e4:  beq IL_00ee

	IL_00e9:  br IL_0138

	IL_00ee:  ldstr "ldc.i4.1"
	IL_00f3:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00f8:  stloc 0

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0103:  ldloc 0

	IL_0107:  nop 
	IL_0108:  nop 
	IL_0109:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_010e:  ldstr "conv.i2"
	IL_0113:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0118:  stloc 0

	IL_011c:  nop 
	IL_011d:  nop 
	IL_011e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0123:  ldloc 0

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_012e:  br IL_0444

	IL_0133:  br IL_013d

	IL_0138:  br IL_013d

	IL_013d:  ldloc 1

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  ldc.i4 2
	IL_0148:  beq IL_0152

	IL_014d:  br IL_019c

	IL_0152:  ldstr "ldc.i4.2"
	IL_0157:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_015c:  stloc 0

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0167:  ldloc 0

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0172:  ldstr "conv.i2"
	IL_0177:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_017c:  stloc 0

	IL_0180:  nop 
	IL_0181:  nop 
	IL_0182:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0187:  ldloc 0

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0192:  br IL_0444

	IL_0197:  br IL_01a1

	IL_019c:  br IL_01a1

	IL_01a1:  ldloc 1

	IL_01a5:  nop 
	IL_01a6:  nop 
	IL_01a7:  ldc.i4 3
	IL_01ac:  beq IL_01b6

	IL_01b1:  br IL_0200

	IL_01b6:  ldstr "ldc.i4.3"
	IL_01bb:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01c0:  stloc 0

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01cb:  ldloc 0

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01d6:  ldstr "conv.i2"
	IL_01db:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01e0:  stloc 0

	IL_01e4:  nop 
	IL_01e5:  nop 
	IL_01e6:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01eb:  ldloc 0

	IL_01ef:  nop 
	IL_01f0:  nop 
	IL_01f1:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01f6:  br IL_0444

	IL_01fb:  br IL_0205

	IL_0200:  br IL_0205

	IL_0205:  ldloc 1

	IL_0209:  nop 
	IL_020a:  nop 
	IL_020b:  ldc.i4 4
	IL_0210:  beq IL_021a

	IL_0215:  br IL_0264

	IL_021a:  ldstr "ldc.i4.4"
	IL_021f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0224:  stloc 0

	IL_0228:  nop 
	IL_0229:  nop 
	IL_022a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_022f:  ldloc 0

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_023a:  ldstr "conv.i2"
	IL_023f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0244:  stloc 0

	IL_0248:  nop 
	IL_0249:  nop 
	IL_024a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_024f:  ldloc 0

	IL_0253:  nop 
	IL_0254:  nop 
	IL_0255:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_025a:  br IL_0444

	IL_025f:  br IL_0269

	IL_0264:  br IL_0269

	IL_0269:  ldloc 1

	IL_026d:  nop 
	IL_026e:  nop 
	IL_026f:  ldc.i4 5
	IL_0274:  beq IL_027e

	IL_0279:  br IL_02c8

	IL_027e:  ldstr "ldc.i4.5"
	IL_0283:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0288:  stloc 0

	IL_028c:  nop 
	IL_028d:  nop 
	IL_028e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0293:  ldloc 0

	IL_0297:  nop 
	IL_0298:  nop 
	IL_0299:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_029e:  ldstr "conv.i2"
	IL_02a3:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02a8:  stloc 0

	IL_02ac:  nop 
	IL_02ad:  nop 
	IL_02ae:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02b3:  ldloc 0

	IL_02b7:  nop 
	IL_02b8:  nop 
	IL_02b9:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_02be:  br IL_0444

	IL_02c3:  br IL_02cd

	IL_02c8:  br IL_02cd

	IL_02cd:  ldloc 1

	IL_02d1:  nop 
	IL_02d2:  nop 
	IL_02d3:  ldc.i4 6
	IL_02d8:  beq IL_02e2

	IL_02dd:  br IL_032c

	IL_02e2:  ldstr "ldc.i4.6"
	IL_02e7:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02ec:  stloc 0

	IL_02f0:  nop 
	IL_02f1:  nop 
	IL_02f2:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02f7:  ldloc 0

	IL_02fb:  nop 
	IL_02fc:  nop 
	IL_02fd:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0302:  ldstr "conv.i2"
	IL_0307:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_030c:  stloc 0

	IL_0310:  nop 
	IL_0311:  nop 
	IL_0312:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0317:  ldloc 0

	IL_031b:  nop 
	IL_031c:  nop 
	IL_031d:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0322:  br IL_0444

	IL_0327:  br IL_0331

	IL_032c:  br IL_0331

	IL_0331:  ldloc 1

	IL_0335:  nop 
	IL_0336:  nop 
	IL_0337:  ldc.i4 7
	IL_033c:  beq IL_0346

	IL_0341:  br IL_0390

	IL_0346:  ldstr "ldc.i4.7"
	IL_034b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0350:  stloc 0

	IL_0354:  nop 
	IL_0355:  nop 
	IL_0356:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_035b:  ldloc 0

	IL_035f:  nop 
	IL_0360:  nop 
	IL_0361:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0366:  ldstr "conv.i2"
	IL_036b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0370:  stloc 0

	IL_0374:  nop 
	IL_0375:  nop 
	IL_0376:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_037b:  ldloc 0

	IL_037f:  nop 
	IL_0380:  nop 
	IL_0381:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0386:  br IL_0444

	IL_038b:  br IL_0395

	IL_0390:  br IL_0395

	IL_0395:  ldloc 1

	IL_0399:  nop 
	IL_039a:  nop 
	IL_039b:  ldc.i4 8
	IL_03a0:  beq IL_03aa

	IL_03a5:  br IL_03f4

	IL_03aa:  ldstr "ldc.i4.8"
	IL_03af:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_03b4:  stloc 0

	IL_03b8:  nop 
	IL_03b9:  nop 
	IL_03ba:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03bf:  ldloc 0

	IL_03c3:  nop 
	IL_03c4:  nop 
	IL_03c5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03ca:  ldstr "conv.i2"
	IL_03cf:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_03d4:  stloc 0

	IL_03d8:  nop 
	IL_03d9:  nop 
	IL_03da:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03df:  ldloc 0

	IL_03e3:  nop 
	IL_03e4:  nop 
	IL_03e5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03ea:  br IL_0444

	IL_03ef:  br IL_03f9

	IL_03f4:  br IL_03f9

	IL_03f9:  ldstr "ldc.i4"
	IL_03fe:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0403:  stloc 0

	IL_0407:  nop 
	IL_0408:  nop 
	IL_0409:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_040e:  ldloc 0

	IL_0412:  nop 
	IL_0413:  nop 
	IL_0414:  ldloc 1

	IL_0418:  nop 
	IL_0419:  nop 
	IL_041a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int32)
	IL_041f:  ldstr "conv.i2"
	IL_0424:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0429:  stloc 0

	IL_042d:  nop 
	IL_042e:  nop 
	IL_042f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0434:  ldloc 0

	IL_0438:  nop 
	IL_0439:  nop 
	IL_043a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_043f:  br IL_0444

	IL_0444:  ret 
    } // end of method ILEmitter::EmitLdcI2

    // method line 34
    .method public static 
           default void EmitLdcI1 (int8 n)  cil managed 
    {
        // Method begins at RVA 0x7178
	// Code size 1093 (0x445)
	.maxstack 43
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		int32	V_1)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  call int32 class [mscorlib]System.Convert::ToInt32(int8)
	IL_000b:  stloc 1

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldloc 1

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldc.i4 -1
	IL_001c:  beq IL_0026

	IL_0021:  br IL_0070

	IL_0026:  ldstr "ldc.i4.m1"
	IL_002b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0030:  stloc 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_003b:  ldloc 0

	IL_003f:  nop 
	IL_0040:  nop 
	IL_0041:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0046:  ldstr "conv.i1"
	IL_004b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0050:  stloc 0

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_005b:  ldloc 0

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0066:  br IL_0444

	IL_006b:  br IL_0075

	IL_0070:  br IL_0075

	IL_0075:  ldloc 1

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldc.i4 0
	IL_0080:  beq IL_008a

	IL_0085:  br IL_00d4

	IL_008a:  ldstr "ldc.i4.0"
	IL_008f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0094:  stloc 0

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_009f:  ldloc 0

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00aa:  ldstr "conv.i1"
	IL_00af:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00b4:  stloc 0

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00bf:  ldloc 0

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00ca:  br IL_0444

	IL_00cf:  br IL_00d9

	IL_00d4:  br IL_00d9

	IL_00d9:  ldloc 1

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldc.i4 1
	IL_00e4:  beq IL_00ee

	IL_00e9:  br IL_0138

	IL_00ee:  ldstr "ldc.i4.1"
	IL_00f3:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00f8:  stloc 0

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0103:  ldloc 0

	IL_0107:  nop 
	IL_0108:  nop 
	IL_0109:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_010e:  ldstr "conv.i1"
	IL_0113:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0118:  stloc 0

	IL_011c:  nop 
	IL_011d:  nop 
	IL_011e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0123:  ldloc 0

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_012e:  br IL_0444

	IL_0133:  br IL_013d

	IL_0138:  br IL_013d

	IL_013d:  ldloc 1

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  ldc.i4 2
	IL_0148:  beq IL_0152

	IL_014d:  br IL_019c

	IL_0152:  ldstr "ldc.i4.2"
	IL_0157:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_015c:  stloc 0

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0167:  ldloc 0

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0172:  ldstr "conv.i1"
	IL_0177:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_017c:  stloc 0

	IL_0180:  nop 
	IL_0181:  nop 
	IL_0182:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0187:  ldloc 0

	IL_018b:  nop 
	IL_018c:  nop 
	IL_018d:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0192:  br IL_0444

	IL_0197:  br IL_01a1

	IL_019c:  br IL_01a1

	IL_01a1:  ldloc 1

	IL_01a5:  nop 
	IL_01a6:  nop 
	IL_01a7:  ldc.i4 3
	IL_01ac:  beq IL_01b6

	IL_01b1:  br IL_0200

	IL_01b6:  ldstr "ldc.i4.3"
	IL_01bb:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01c0:  stloc 0

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01cb:  ldloc 0

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01d6:  ldstr "conv.i1"
	IL_01db:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_01e0:  stloc 0

	IL_01e4:  nop 
	IL_01e5:  nop 
	IL_01e6:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_01eb:  ldloc 0

	IL_01ef:  nop 
	IL_01f0:  nop 
	IL_01f1:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_01f6:  br IL_0444

	IL_01fb:  br IL_0205

	IL_0200:  br IL_0205

	IL_0205:  ldloc 1

	IL_0209:  nop 
	IL_020a:  nop 
	IL_020b:  ldc.i4 4
	IL_0210:  beq IL_021a

	IL_0215:  br IL_0264

	IL_021a:  ldstr "ldc.i4.4"
	IL_021f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0224:  stloc 0

	IL_0228:  nop 
	IL_0229:  nop 
	IL_022a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_022f:  ldloc 0

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_023a:  ldstr "conv.i1"
	IL_023f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0244:  stloc 0

	IL_0248:  nop 
	IL_0249:  nop 
	IL_024a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_024f:  ldloc 0

	IL_0253:  nop 
	IL_0254:  nop 
	IL_0255:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_025a:  br IL_0444

	IL_025f:  br IL_0269

	IL_0264:  br IL_0269

	IL_0269:  ldloc 1

	IL_026d:  nop 
	IL_026e:  nop 
	IL_026f:  ldc.i4 5
	IL_0274:  beq IL_027e

	IL_0279:  br IL_02c8

	IL_027e:  ldstr "ldc.i4.5"
	IL_0283:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0288:  stloc 0

	IL_028c:  nop 
	IL_028d:  nop 
	IL_028e:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0293:  ldloc 0

	IL_0297:  nop 
	IL_0298:  nop 
	IL_0299:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_029e:  ldstr "conv.i1"
	IL_02a3:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02a8:  stloc 0

	IL_02ac:  nop 
	IL_02ad:  nop 
	IL_02ae:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02b3:  ldloc 0

	IL_02b7:  nop 
	IL_02b8:  nop 
	IL_02b9:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_02be:  br IL_0444

	IL_02c3:  br IL_02cd

	IL_02c8:  br IL_02cd

	IL_02cd:  ldloc 1

	IL_02d1:  nop 
	IL_02d2:  nop 
	IL_02d3:  ldc.i4 6
	IL_02d8:  beq IL_02e2

	IL_02dd:  br IL_032c

	IL_02e2:  ldstr "ldc.i4.6"
	IL_02e7:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_02ec:  stloc 0

	IL_02f0:  nop 
	IL_02f1:  nop 
	IL_02f2:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_02f7:  ldloc 0

	IL_02fb:  nop 
	IL_02fc:  nop 
	IL_02fd:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0302:  ldstr "conv.i1"
	IL_0307:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_030c:  stloc 0

	IL_0310:  nop 
	IL_0311:  nop 
	IL_0312:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0317:  ldloc 0

	IL_031b:  nop 
	IL_031c:  nop 
	IL_031d:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0322:  br IL_0444

	IL_0327:  br IL_0331

	IL_032c:  br IL_0331

	IL_0331:  ldloc 1

	IL_0335:  nop 
	IL_0336:  nop 
	IL_0337:  ldc.i4 7
	IL_033c:  beq IL_0346

	IL_0341:  br IL_0390

	IL_0346:  ldstr "ldc.i4.7"
	IL_034b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0350:  stloc 0

	IL_0354:  nop 
	IL_0355:  nop 
	IL_0356:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_035b:  ldloc 0

	IL_035f:  nop 
	IL_0360:  nop 
	IL_0361:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0366:  ldstr "conv.i1"
	IL_036b:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0370:  stloc 0

	IL_0374:  nop 
	IL_0375:  nop 
	IL_0376:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_037b:  ldloc 0

	IL_037f:  nop 
	IL_0380:  nop 
	IL_0381:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0386:  br IL_0444

	IL_038b:  br IL_0395

	IL_0390:  br IL_0395

	IL_0395:  ldloc 1

	IL_0399:  nop 
	IL_039a:  nop 
	IL_039b:  ldc.i4 8
	IL_03a0:  beq IL_03aa

	IL_03a5:  br IL_03f4

	IL_03aa:  ldstr "ldc.i4.8"
	IL_03af:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_03b4:  stloc 0

	IL_03b8:  nop 
	IL_03b9:  nop 
	IL_03ba:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03bf:  ldloc 0

	IL_03c3:  nop 
	IL_03c4:  nop 
	IL_03c5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03ca:  ldstr "conv.i1"
	IL_03cf:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_03d4:  stloc 0

	IL_03d8:  nop 
	IL_03d9:  nop 
	IL_03da:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_03df:  ldloc 0

	IL_03e3:  nop 
	IL_03e4:  nop 
	IL_03e5:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_03ea:  br IL_0444

	IL_03ef:  br IL_03f9

	IL_03f4:  br IL_03f9

	IL_03f9:  ldstr "ldc.i4"
	IL_03fe:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0403:  stloc 0

	IL_0407:  nop 
	IL_0408:  nop 
	IL_0409:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_040e:  ldloc 0

	IL_0412:  nop 
	IL_0413:  nop 
	IL_0414:  ldloc 1

	IL_0418:  nop 
	IL_0419:  nop 
	IL_041a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int32)
	IL_041f:  ldstr "conv.i1"
	IL_0424:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0429:  stloc 0

	IL_042d:  nop 
	IL_042e:  nop 
	IL_042f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0434:  ldloc 0

	IL_0438:  nop 
	IL_0439:  nop 
	IL_043a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_043f:  br IL_0444

	IL_0444:  ret 
    } // end of method ILEmitter::EmitLdcI1

    // method line 35
    .method public static 
           default void EmitCallvirt (class [mscorlib]System.Reflection.MethodInfo met)  cil managed 
    {
        // Method begins at RVA 0x75cc
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "callvirt"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitCallvirt

    // method line 36
    .method public static 
           default void EmitCallCtor (class [mscorlib]System.Reflection.ConstructorInfo met)  cil managed 
    {
        // Method begins at RVA 0x7600
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "call"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.ConstructorInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitCallCtor

    // method line 37
    .method public static 
           default void EmitCall (class [mscorlib]System.Reflection.MethodInfo met)  cil managed 
    {
        // Method begins at RVA 0x7634
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "call"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitCall

    // method line 38
    .method public static 
           default void EmitLdftn (class [mscorlib]System.Reflection.MethodInfo met)  cil managed 
    {
        // Method begins at RVA 0x7668
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldftn"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdftn

    // method line 39
    .method public static 
           default void EmitLdvirtftn (class [mscorlib]System.Reflection.MethodInfo met)  cil managed 
    {
        // Method begins at RVA 0x769c
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldvirtftn"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdvirtftn

    // method line 40
    .method public static 
           default void EmitLdfld (class [mscorlib]System.Reflection.FieldInfo fld)  cil managed 
    {
        // Method begins at RVA 0x76d0
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldfld"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.FieldInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdfld

    // method line 41
    .method public static 
           default void EmitLdsfld (class [mscorlib]System.Reflection.FieldInfo fld)  cil managed 
    {
        // Method begins at RVA 0x7704
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldsfld"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.FieldInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdsfld

    // method line 42
    .method public static 
           default void EmitLdflda (class [mscorlib]System.Reflection.FieldInfo fld)  cil managed 
    {
        // Method begins at RVA 0x7738
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldflda"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.FieldInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdflda

    // method line 43
    .method public static 
           default void EmitLdsflda (class [mscorlib]System.Reflection.FieldInfo fld)  cil managed 
    {
        // Method begins at RVA 0x776c
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldsflda"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.FieldInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdsflda

    // method line 44
    .method public static 
           default void EmitLdstr (string str)  cil managed 
    {
        // Method begins at RVA 0x77a0
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldstr"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, string)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdstr

    // method line 45
    .method public static 
           default void EmitAdd (bool s)  cil managed 
    {
        // Method begins at RVA 0x77d4
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "add"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "add.ovf.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitAdd

    // method line 46
    .method public static 
           default void EmitDiv (bool s)  cil managed 
    {
        // Method begins at RVA 0x7840
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "div"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "div.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitDiv

    // method line 47
    .method public static 
           default void EmitMul (bool s)  cil managed 
    {
        // Method begins at RVA 0x78ac
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "mul"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "mul.ovf.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitMul

    // method line 48
    .method public static 
           default void EmitSub (bool s)  cil managed 
    {
        // Method begins at RVA 0x7918
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "sub"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "sub.ovf.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitSub

    // method line 49
    .method public static 
           default void EmitRem (bool s)  cil managed 
    {
        // Method begins at RVA 0x7984
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "rem"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "rem.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitRem

    // method line 50
    .method public static 
           default void EmitShl ()  cil managed 
    {
        // Method begins at RVA 0x79f0
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "shl"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitShl

    // method line 51
    .method public static 
           default void EmitShr (bool s)  cil managed 
    {
        // Method begins at RVA 0x7a20
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "shr"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "shr.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitShr

    // method line 52
    .method public static 
           default void EmitAnd ()  cil managed 
    {
        // Method begins at RVA 0x7a8c
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "and"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitAnd

    // method line 53
    .method public static 
           default void EmitOr ()  cil managed 
    {
        // Method begins at RVA 0x7abc
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "or"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitOr

    // method line 54
    .method public static 
           default void EmitXor ()  cil managed 
    {
        // Method begins at RVA 0x7aec
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "xor"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitXor

    // method line 55
    .method public static 
           default void EmitNot ()  cil managed 
    {
        // Method begins at RVA 0x7b1c
	// Code size 65 (0x41)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldc.i4.0"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ldstr "ceq"
	IL_0025:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_002a:  stloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0035:  ldloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0040:  ret 
    } // end of method ILEmitter::EmitNot

    // method line 56
    .method public static 
           default void EmitNeg ()  cil managed 
    {
        // Method begins at RVA 0x7b6c
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "neg"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitNeg

    // method line 57
    .method public static 
           default void EmitNand ()  cil managed 
    {
        // Method begins at RVA 0x7b9c
	// Code size 97 (0x61)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "and"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ldstr "ldc.i4.0"
	IL_0025:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_002a:  stloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0035:  ldloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0040:  ldstr "ceq"
	IL_0045:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_004a:  stloc 0

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0055:  ldloc 0

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0060:  ret 
    } // end of method ILEmitter::EmitNand

    // method line 58
    .method public static 
           default void EmitNor ()  cil managed 
    {
        // Method begins at RVA 0x7c0c
	// Code size 97 (0x61)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "or"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ldstr "ldc.i4.0"
	IL_0025:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_002a:  stloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0035:  ldloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0040:  ldstr "ceq"
	IL_0045:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_004a:  stloc 0

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0055:  ldloc 0

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0060:  ret 
    } // end of method ILEmitter::EmitNor

    // method line 59
    .method public static 
           default void EmitXnor ()  cil managed 
    {
        // Method begins at RVA 0x7c7c
	// Code size 65 (0x41)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "xor"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ldstr "not"
	IL_0025:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_002a:  stloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0035:  ldloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0040:  ret 
    } // end of method ILEmitter::EmitXnor

    // method line 60
    .method public static 
           default void EmitCeq ()  cil managed 
    {
        // Method begins at RVA 0x7ccc
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ceq"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitCeq

    // method line 61
    .method public static 
           default void EmitCneq ()  cil managed 
    {
        // Method begins at RVA 0x7cfc
	// Code size 97 (0x61)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ceq"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ldstr "ldc.i4.0"
	IL_0025:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_002a:  stloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0035:  ldloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0040:  ldstr "ceq"
	IL_0045:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_004a:  stloc 0

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0055:  ldloc 0

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0060:  ret 
    } // end of method ILEmitter::EmitCneq

    // method line 62
    .method public static 
           default void EmitCgt (bool s)  cil managed 
    {
        // Method begins at RVA 0x7d6c
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "cgt"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "cgt.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitCgt

    // method line 63
    .method public static 
           default void EmitClt (bool s)  cil managed 
    {
        // Method begins at RVA 0x7dd8
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "clt"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "clt.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitClt

    // method line 64
    .method public static 
           default void EmitCle (bool s)  cil managed 
    {
        // Method begins at RVA 0x7e44
	// Code size 160 (0xa0)
	.maxstack 8
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "cgt"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "cgt.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ldstr "ldc.i4.0"
	IL_0064:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0069:  stloc 0

	IL_006d:  nop 
	IL_006e:  nop 
	IL_006f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0074:  ldloc 0

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_007f:  ldstr "ceq"
	IL_0084:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0089:  stloc 0

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0094:  ldloc 0

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_009f:  ret 
    } // end of method ILEmitter::EmitCle

    // method line 65
    .method public static 
           default void EmitCge (bool s)  cil managed 
    {
        // Method begins at RVA 0x7ef0
	// Code size 160 (0xa0)
	.maxstack 8
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "clt"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "clt.un"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ldstr "ldc.i4.0"
	IL_0064:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0069:  stloc 0

	IL_006d:  nop 
	IL_006e:  nop 
	IL_006f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0074:  ldloc 0

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_007f:  ldstr "ceq"
	IL_0084:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0089:  stloc 0

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0094:  ldloc 0

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_009f:  ret 
    } // end of method ILEmitter::EmitCge

    // method line 66
    .method public static 
           default void EmitLike ()  cil managed 
    {
        // Method begins at RVA 0x7f9c
	// Code size 154 (0x9a)
	.maxstack 9
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo	V_3)
	IL_0000:  ldtoken [System]System.Text.RegularExpressions.Regex
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 2
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.Type
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldtoken [mscorlib]System.String
	IL_0032:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0037:  stelem [mscorlib]System.Type
	IL_003c:  ldloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  conv.u 
	IL_0048:  ldtoken [mscorlib]System.String
	IL_004d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0052:  stelem [mscorlib]System.Type
	IL_0057:  ldloc 1

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  ldstr "IsMatch"
	IL_0062:  ldloc 2

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_006d:  stloc 3

	IL_0071:  nop 
	IL_0072:  nop 
	IL_0073:  ldstr "call"
	IL_0078:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_007d:  stloc 0

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0088:  ldloc 0

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldloc 3

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0099:  ret 
    } // end of method ILEmitter::EmitLike

    // method line 67
    .method public static 
           default void EmitNLike ()  cil managed 
    {
        // Method begins at RVA 0x8044
	// Code size 218 (0xda)
	.maxstack 9
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo	V_3)
	IL_0000:  ldtoken [System]System.Text.RegularExpressions.Regex
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 2
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.Type
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldtoken [mscorlib]System.String
	IL_0032:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0037:  stelem [mscorlib]System.Type
	IL_003c:  ldloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  conv.u 
	IL_0048:  ldtoken [mscorlib]System.String
	IL_004d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0052:  stelem [mscorlib]System.Type
	IL_0057:  ldloc 1

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  ldstr "IsMatch"
	IL_0062:  ldloc 2

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_006d:  stloc 3

	IL_0071:  nop 
	IL_0072:  nop 
	IL_0073:  ldstr "call"
	IL_0078:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_007d:  stloc 0

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0088:  ldloc 0

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldloc 3

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0099:  ldstr "ldc.i4.0"
	IL_009e:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00a3:  stloc 0

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ae:  ldloc 0

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00b9:  ldstr "ceq"
	IL_00be:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00c3:  stloc 0

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ce:  ldloc 0

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d9:  ret 
    } // end of method ILEmitter::EmitNLike

    // method line 68
    .method public static 
           default void EmitStrCeq ()  cil managed 
    {
        // Method begins at RVA 0x812c
	// Code size 218 (0xda)
	.maxstack 9
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo	V_3)
	IL_0000:  ldtoken [mscorlib]System.String
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 2
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.Type
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldtoken [mscorlib]System.String
	IL_0032:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0037:  stelem [mscorlib]System.Type
	IL_003c:  ldloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  conv.u 
	IL_0048:  ldtoken [mscorlib]System.String
	IL_004d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0052:  stelem [mscorlib]System.Type
	IL_0057:  ldloc 1

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  ldstr "Compare"
	IL_0062:  ldloc 2

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_006d:  stloc 3

	IL_0071:  nop 
	IL_0072:  nop 
	IL_0073:  ldstr "call"
	IL_0078:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_007d:  stloc 0

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0088:  ldloc 0

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldloc 3

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0099:  ldstr "ldc.i4.0"
	IL_009e:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00a3:  stloc 0

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ae:  ldloc 0

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00b9:  ldstr "ceq"
	IL_00be:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00c3:  stloc 0

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ce:  ldloc 0

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d9:  ret 
    } // end of method ILEmitter::EmitStrCeq

    // method line 69
    .method public static 
           default void EmitStrCneq ()  cil managed 
    {
        // Method begins at RVA 0x8214
	// Code size 282 (0x11a)
	.maxstack 9
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo	V_3)
	IL_0000:  ldtoken [mscorlib]System.String
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 2
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.Type
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldtoken [mscorlib]System.String
	IL_0032:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0037:  stelem [mscorlib]System.Type
	IL_003c:  ldloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  conv.u 
	IL_0048:  ldtoken [mscorlib]System.String
	IL_004d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0052:  stelem [mscorlib]System.Type
	IL_0057:  ldloc 1

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  ldstr "Compare"
	IL_0062:  ldloc 2

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_006d:  stloc 3

	IL_0071:  nop 
	IL_0072:  nop 
	IL_0073:  ldstr "call"
	IL_0078:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_007d:  stloc 0

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0088:  ldloc 0

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldloc 3

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0099:  ldstr "ldc.i4.0"
	IL_009e:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00a3:  stloc 0

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ae:  ldloc 0

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00b9:  ldstr "ceq"
	IL_00be:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00c3:  stloc 0

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ce:  ldloc 0

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00d9:  ldstr "ldc.i4.0"
	IL_00de:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_00e3:  stloc 0

	IL_00e7:  nop 
	IL_00e8:  nop 
	IL_00e9:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_00ee:  ldloc 0

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_00f9:  ldstr "ceq"
	IL_00fe:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0103:  stloc 0

	IL_0107:  nop 
	IL_0108:  nop 
	IL_0109:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_010e:  ldloc 0

	IL_0112:  nop 
	IL_0113:  nop 
	IL_0114:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0119:  ret 
    } // end of method ILEmitter::EmitStrCneq

    // method line 70
    .method public static 
           default void EmitStrAdd ()  cil managed 
    {
        // Method begins at RVA 0x833c
	// Code size 146 (0x92)
	.maxstack 9
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo	V_3)
	IL_0000:  ldtoken [mscorlib]System.String
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 2
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.Type
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  stelem [mscorlib]System.Type
	IL_0038:  ldloc 2

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldc.i4 1
	IL_0043:  conv.u 
	IL_0044:  ldloc 1

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  stelem [mscorlib]System.Type
	IL_004f:  ldloc 1

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldstr "Concat"
	IL_005a:  ldloc 2

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldstr "call"
	IL_0070:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0075:  stloc 0

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0080:  ldloc 0

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldloc 3

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0091:  ret 
    } // end of method ILEmitter::EmitStrAdd

    // method line 71
    .method public static 
           default void EmitDelegateAdd ()  cil managed 
    {
        // Method begins at RVA 0x83dc
	// Code size 146 (0x92)
	.maxstack 9
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo	V_3)
	IL_0000:  ldtoken [mscorlib]System.Delegate
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 2
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.Type
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  stelem [mscorlib]System.Type
	IL_0038:  ldloc 2

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldc.i4 1
	IL_0043:  conv.u 
	IL_0044:  ldloc 1

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  stelem [mscorlib]System.Type
	IL_004f:  ldloc 1

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldstr "Combine"
	IL_005a:  ldloc 2

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldstr "call"
	IL_0070:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0075:  stloc 0

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0080:  ldloc 0

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldloc 3

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0091:  ret 
    } // end of method ILEmitter::EmitDelegateAdd

    // method line 72
    .method public static 
           default void EmitDelegateSub ()  cil managed 
    {
        // Method begins at RVA 0x847c
	// Code size 146 (0x92)
	.maxstack 9
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo	V_3)
	IL_0000:  ldtoken [mscorlib]System.Delegate
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 2
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.Type
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldloc 2

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  stelem [mscorlib]System.Type
	IL_0038:  ldloc 2

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldc.i4 1
	IL_0043:  conv.u 
	IL_0044:  ldloc 1

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  stelem [mscorlib]System.Type
	IL_004f:  ldloc 1

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldstr "Remove"
	IL_005a:  ldloc 2

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldstr "call"
	IL_0070:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0075:  stloc 0

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0080:  ldloc 0

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldloc 3

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.MethodInfo)
	IL_0091:  ret 
    } // end of method ILEmitter::EmitDelegateSub

    // method line 73
    .method public static 
           default void EmitLdcR4 (float32 num)  cil managed 
    {
        // Method begins at RVA 0x851c
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldc.r4"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, float32)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdcR4

    // method line 74
    .method public static 
           default void EmitLdcR8 (float64 num)  cil managed 
    {
        // Method begins at RVA 0x8550
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldc.r8"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, float64)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdcR8

    // method line 75
    .method public static 
           default void EmitLdcBool (bool b)  cil managed 
    {
        // Method begins at RVA 0x8584
	// Code size 96 (0x60)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_003a

	IL_0015:  ldstr "ldc.i4.1"
	IL_001a:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001f:  stloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0035:  br IL_005f

	IL_003a:  ldstr "ldc.i4.0"
	IL_003f:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_0044:  stloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_004f:  ldloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_005a:  br IL_005f

	IL_005f:  ret 
    } // end of method ILEmitter::EmitLdcBool

    // method line 76
    .method public static 
           default void EmitLdcChar (char c)  cil managed 
    {
        // Method begins at RVA 0x85f0
	// Code size 44 (0x2c)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldc.i4"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  call int32 class [mscorlib]System.Convert::ToInt32(char)
	IL_0026:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, int32)
	IL_002b:  ret 
    } // end of method ILEmitter::EmitLdcChar

    // method line 77
    .method public static 
           default void EmitLdnull ()  cil managed 
    {
        // Method begins at RVA 0x8628
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldnull"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitLdnull

    // method line 78
    .method public static 
           default void EmitNewobj (class [mscorlib]System.Reflection.ConstructorInfo c)  cil managed 
    {
        // Method begins at RVA 0x8658
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "newobj"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Reflection.ConstructorInfo)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitNewobj

    // method line 79
    .method public static 
           default void EmitBr (valuetype [mscorlib]System.Reflection.Emit.Label lbl)  cil managed 
    {
        // Method begins at RVA 0x868c
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "br"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitBr

    // method line 80
    .method public static 
           default void EmitBrfalse (valuetype [mscorlib]System.Reflection.Emit.Label lbl)  cil managed 
    {
        // Method begins at RVA 0x86c0
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "brfalse"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitBrfalse

    // method line 81
    .method public static 
           default void EmitBrtrue (valuetype [mscorlib]System.Reflection.Emit.Label lbl)  cil managed 
    {
        // Method begins at RVA 0x86f4
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "brtrue"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitBrtrue

    // method line 82
    .method public static 
           default void EmitLdtoken (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x8728
	// Code size 39 (0x27)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "ldtoken"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0026:  ret 
    } // end of method ILEmitter::EmitLdtoken

    // method line 83
    .method public static 
           default void EmitConvU ()  cil managed 
    {
        // Method begins at RVA 0x875c
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "conv.u"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitConvU

    // method line 84
    .method public static 
           default void EmitConvI ()  cil managed 
    {
        // Method begins at RVA 0x878c
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "conv.i"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitConvI

    // method line 85
    .method public static 
           default void EmitConvI4 ()  cil managed 
    {
        // Method begins at RVA 0x87bc
	// Code size 33 (0x21)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldstr "conv.i4"
	IL_0005:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0020:  ret 
    } // end of method ILEmitter::EmitConvI4

    // method line 86
    .method public static 
           default void EmitNewarr (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x87ec
	// Code size 55 (0x37)
	.maxstack 3
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.OpCode	V_0)
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0005:  ldloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode)
	IL_0010:  ldstr "newarr"
	IL_0015:  call valuetype [mscorlib]System.Reflection.Emit.OpCode class dylan.NET.Reflection.InstructionHelper::getOPCode(string)
	IL_001a:  stloc 0

	IL_001e:  nop 
	IL_001f:  nop 
	IL_0020:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0025:  ldloc 0

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldarg 0

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::Emit(valuetype [mscorlib]System.Reflection.Emit.OpCode, class [mscorlib]System.Type)
	IL_0036:  ret 
    } // end of method ILEmitter::EmitNewarr

    // method line 87
    .method public static 
           default void DeclVar (string name, class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x8830
	// Code size 70 (0x46)
	.maxstack 4
	.locals init (
		class [mscorlib]System.Reflection.Emit.LocalBuilder	V_0)
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0005:  ldarg 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  callvirt instance class [mscorlib]System.Reflection.Emit.LocalBuilder class [mscorlib]System.Reflection.Emit.ILGenerator::DeclareLocal(class [mscorlib]System.Type)
	IL_0010:  stloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld bool dylan.NET.Reflection.ILEmitter::DebugFlg
	IL_001b:  ldc.i4 1
	IL_0020:  beq IL_002a

	IL_0025:  br IL_0040

	IL_002a:  ldloc 0

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldarg 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  callvirt instance void class [mscorlib]System.Reflection.Emit.LocalBuilder::SetLocalSymInfo(string)
	IL_003b:  br IL_0045

	IL_0040:  br IL_0045

	IL_0045:  ret 
    } // end of method ILEmitter::DeclVar

    // method line 88
    .method public static 
           default valuetype [mscorlib]System.Reflection.Emit.Label DefineLbl ()  cil managed 
    {
        // Method begins at RVA 0x8884
	// Code size 11 (0xb)
	.maxstack 1
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0005:  callvirt instance valuetype [mscorlib]System.Reflection.Emit.Label class [mscorlib]System.Reflection.Emit.ILGenerator::DefineLabel()
	IL_000a:  ret 
    } // end of method ILEmitter::DefineLbl

    // method line 89
    .method public static 
           default void MarkLbl (valuetype [mscorlib]System.Reflection.Emit.Label lbl)  cil managed 
    {
        // Method begins at RVA 0x889c
	// Code size 17 (0x11)
	.maxstack 2
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0005:  ldarg 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::MarkLabel(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_0010:  ret 
    } // end of method ILEmitter::MarkLbl

    // method line 90
    .method public static 
           default void MarkDbgPt (int32 line)  cil managed 
    {
        // Method begins at RVA 0x88bc
	// Code size 38 (0x26)
	.maxstack 6
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0005:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter dylan.NET.Reflection.ILEmitter::DocWriter
	IL_000a:  ldarg 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 1
	IL_0015:  ldarg 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldc.i4 100
	IL_0020:  callvirt instance void class [mscorlib]System.Reflection.Emit.ILGenerator::MarkSequencePoint(class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter, int32, int32, int32, int32)
	IL_0025:  ret 
    } // end of method ILEmitter::MarkDbgPt

  } // end of class dylan.NET.Reflection.ILEmitter
}

.namespace dylan.NET.Reflection
{
  .class public auto ansi beforefieldinit AsmFactory
  	extends [mscorlib]System.Object
  {
    .field  public static  bool DebugFlg
    .field  public static  bool InMethodFlg
    .field  public static  bool ChainFlg
    .field  public static  bool PopFlg
    .field  public static  bool AddrFlg
    .field  public static  class [mscorlib]System.Reflection.AssemblyName AsmNameStr
    .field  public static  class [mscorlib]System.Reflection.Emit.AssemblyBuilder AsmB
    .field  public static  class [mscorlib]System.Type Type01
    .field  public static  class [mscorlib]System.Type Type02
    .field  public static  class [mscorlib]System.Type Type03
    .field  public static  class [mscorlib]System.Type Type04
    .field  public static  class [mscorlib]System.Type Type05
    .field  public static  class [mscorlib]System.Reflection.Emit.ModuleBuilder MdlB
    .field  public static  class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter DocWriter
    .field  public static  string CurnNS
    .field  public static  string DfltNS
    .field  public static  string AsmMode
    .field  public static  string AsmFile
    .field  public static  string CurnTypName
    .field  public static  string CurnMetName
    .field  public static  class [mscorlib]System.Reflection.Emit.MethodBuilder CurnMetB
    .field  public static  class [mscorlib]System.Reflection.Emit.ConstructorBuilder CurnConB
    .field  public static  class [mscorlib]System.Reflection.Emit.FieldBuilder CurnFldB
    .field  public static  class [mscorlib]System.Reflection.Emit.ILGenerator CurnILGen
    .field  public static  class [mscorlib]System.Type CurnInhTyp
    .field  public static  class [mscorlib]System.Reflection.Emit.TypeBuilder CurnTypB
    .field  public static  class [mscorlib]System.Reflection.Emit.TypeBuilder CurnTypB2
    .field  public static  class [mscorlib]System.Reflection.Emit.TypeBuilder[] CurnTypList
    .field  public static  bool isNested
    .field  public static  bool inClass
    .field  public static  class [mscorlib]System.Type[] TypArr
    .field  public static  string[] GenParamNames
    .field  public static  class [mscorlib]System.Reflection.Emit.GenericTypeParameterBuilder[] GenParamTyps

    // method line 91
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x88f0
	// Code size 175 (0xaf)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  stsfld bool dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_000a:  ldc.i4 0
	IL_000f:  stsfld bool dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0014:  ldc.i4 0
	IL_0019:  stsfld bool dylan.NET.Reflection.AsmFactory::PopFlg
	IL_001e:  ldc.i4 0
	IL_0023:  stsfld bool dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0028:  ldc.i4 0
	IL_002d:  stsfld bool dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_0032:  ldstr ""
	IL_0037:  stsfld string dylan.NET.Reflection.AsmFactory::CurnNS
	IL_003c:  ldstr ""
	IL_0041:  stsfld string dylan.NET.Reflection.AsmFactory::DfltNS
	IL_0046:  ldstr ""
	IL_004b:  stsfld string dylan.NET.Reflection.AsmFactory::AsmMode
	IL_0050:  ldstr ""
	IL_0055:  stsfld string dylan.NET.Reflection.AsmFactory::AsmFile
	IL_005a:  ldc.i4 0
	IL_005f:  conv.u 
	IL_0060:  newarr [mscorlib]System.Reflection.Emit.TypeBuilder
	IL_0065:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder[] dylan.NET.Reflection.AsmFactory::CurnTypList
	IL_006a:  ldc.i4 0
	IL_006f:  conv.u 
	IL_0070:  newarr [mscorlib]System.Type
	IL_0075:  stsfld class [mscorlib]System.Type[] dylan.NET.Reflection.AsmFactory::TypArr
	IL_007a:  ldc.i4 0
	IL_007f:  conv.u 
	IL_0080:  newarr [mscorlib]System.String
	IL_0085:  stsfld string[] dylan.NET.Reflection.AsmFactory::GenParamNames
	IL_008a:  ldc.i4 0
	IL_008f:  conv.u 
	IL_0090:  newarr [mscorlib]System.Type
	IL_0095:  stsfld class [mscorlib]System.Reflection.Emit.GenericTypeParameterBuilder[] dylan.NET.Reflection.AsmFactory::GenParamTyps
	IL_009a:  ldc.i4 0
	IL_009f:  stsfld bool dylan.NET.Reflection.AsmFactory::isNested
	IL_00a4:  ldc.i4 0
	IL_00a9:  stsfld bool dylan.NET.Reflection.AsmFactory::inClass
	IL_00ae:  ret 
    } // end of method AsmFactory::.cctor

    // method line 92
    .method public static 
           default void CreateTyp ()  cil managed 
    {
        // Method begins at RVA 0x89ac
	// Code size 12 (0xc)
	.maxstack 1
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0005:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.Emit.TypeBuilder::CreateType()
	IL_000a:  pop 
	IL_000b:  ret 
    } // end of method AsmFactory::CreateTyp

    // method line 93
    .method public static 
           default void InitMtd ()  cil managed 
    {
        // Method begins at RVA 0x89c4
	// Code size 144 (0x90)
	.maxstack 6
	.locals init (
		valuetype [mscorlib]System.Reflection.ParameterAttributes	V_0)
	IL_0000:  ldc.i4 8
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_0010:  ldc.i4 0
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldstr ""
	IL_0020:  callvirt instance class [mscorlib]System.Reflection.Emit.ParameterBuilder class [mscorlib]System.Reflection.Emit.MethodBuilder::DefineParameter(int32, valuetype [mscorlib]System.Reflection.ParameterAttributes, string)
	IL_0025:  pop 
	IL_0026:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_002b:  callvirt instance class [mscorlib]System.Reflection.Emit.ILGenerator class [mscorlib]System.Reflection.Emit.MethodBuilder::GetILGenerator()
	IL_0030:  stsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.AsmFactory::CurnILGen
	IL_0035:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_003a:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.ILEmitter::Met
	IL_003f:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.AsmFactory::CurnILGen
	IL_0044:  stsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0049:  ldsfld bool dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_004e:  stsfld bool dylan.NET.Reflection.ILEmitter::DebugFlg
	IL_0053:  ldc.i4 -1
	IL_0058:  stsfld int32 dylan.NET.Reflection.ILEmitter::LocInd
	IL_005d:  ldsfld bool dylan.NET.Reflection.ILEmitter::StaticFlg
	IL_0062:  ldc.i4 1
	IL_0067:  beq IL_0071

	IL_006c:  br IL_0080

	IL_0071:  ldc.i4 -1
	IL_0076:  stsfld int32 dylan.NET.Reflection.ILEmitter::ArgInd
	IL_007b:  br IL_008f

	IL_0080:  ldc.i4 0
	IL_0085:  stsfld int32 dylan.NET.Reflection.ILEmitter::ArgInd
	IL_008a:  br IL_008f

	IL_008f:  ret 
    } // end of method AsmFactory::InitMtd

    // method line 94
    .method public static 
           default void InitConstr ()  cil managed 
    {
        // Method begins at RVA 0x8a60
	// Code size 106 (0x6a)
	.maxstack 4
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Reflection.AsmFactory::CurnConB
	IL_0005:  callvirt instance class [mscorlib]System.Reflection.Emit.ILGenerator class [mscorlib]System.Reflection.Emit.ConstructorBuilder::GetILGenerator()
	IL_000a:  stsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.AsmFactory::CurnILGen
	IL_000f:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Reflection.AsmFactory::CurnConB
	IL_0014:  stsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Reflection.ILEmitter::Constr
	IL_0019:  ldsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.AsmFactory::CurnILGen
	IL_001e:  stsfld class [mscorlib]System.Reflection.Emit.ILGenerator dylan.NET.Reflection.ILEmitter::ILGen
	IL_0023:  ldsfld bool dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_0028:  stsfld bool dylan.NET.Reflection.ILEmitter::DebugFlg
	IL_002d:  ldc.i4 -1
	IL_0032:  stsfld int32 dylan.NET.Reflection.ILEmitter::LocInd
	IL_0037:  ldsfld bool dylan.NET.Reflection.ILEmitter::StaticFlg
	IL_003c:  ldc.i4 1
	IL_0041:  beq IL_004b

	IL_0046:  br IL_005a

	IL_004b:  ldc.i4 -1
	IL_0050:  stsfld int32 dylan.NET.Reflection.ILEmitter::ArgInd
	IL_0055:  br IL_0069

	IL_005a:  ldc.i4 0
	IL_005f:  stsfld int32 dylan.NET.Reflection.ILEmitter::ArgInd
	IL_0064:  br IL_0069

	IL_0069:  ret 
    } // end of method AsmFactory::InitConstr

    // method line 95
    .method public static 
           default void InitDelConstr ()  cil managed 
    {
        // Method begins at RVA 0x8ad8
	// Code size 99 (0x63)
	.maxstack 4
	.locals init (
		valuetype [mscorlib]System.Reflection.ParameterAttributes	V_0,
		valuetype [mscorlib]System.Reflection.MethodImplAttributes	V_1)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Reflection.AsmFactory::CurnConB
	IL_0010:  ldc.i4 1
	IL_0015:  ldloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldstr "obj"
	IL_0020:  callvirt instance class [mscorlib]System.Reflection.Emit.ParameterBuilder class [mscorlib]System.Reflection.Emit.ConstructorBuilder::DefineParameter(int32, valuetype [mscorlib]System.Reflection.ParameterAttributes, string)
	IL_0025:  pop 
	IL_0026:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Reflection.AsmFactory::CurnConB
	IL_002b:  ldc.i4 2
	IL_0030:  ldloc 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldstr "ptr"
	IL_003b:  callvirt instance class [mscorlib]System.Reflection.Emit.ParameterBuilder class [mscorlib]System.Reflection.Emit.ConstructorBuilder::DefineParameter(int32, valuetype [mscorlib]System.Reflection.ParameterAttributes, string)
	IL_0040:  pop 
	IL_0041:  ldc.i4 3
	IL_0046:  ldc.i4 0
	IL_004b:  or 
	IL_004c:  stloc 1

	IL_0050:  nop 
	IL_0051:  nop 
	IL_0052:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Reflection.AsmFactory::CurnConB
	IL_0057:  ldloc 1

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  callvirt instance void class [mscorlib]System.Reflection.Emit.ConstructorBuilder::SetImplementationFlags(valuetype [mscorlib]System.Reflection.MethodImplAttributes)
	IL_0062:  ret 
    } // end of method AsmFactory::InitDelConstr

    // method line 96
    .method public static 
           default void InitDelMet ()  cil managed 
    {
        // Method begins at RVA 0x8b48
	// Code size 44 (0x2c)
	.maxstack 2
	.locals init (
		valuetype [mscorlib]System.Reflection.MethodImplAttributes	V_0)
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_0005:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.ILEmitter::Met
	IL_000a:  ldc.i4 3
	IL_000f:  ldc.i4 0
	IL_0014:  or 
	IL_0015:  stloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_0020:  ldloc 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  callvirt instance void class [mscorlib]System.Reflection.Emit.MethodBuilder::SetImplementationFlags(valuetype [mscorlib]System.Reflection.MethodImplAttributes)
	IL_002b:  ret 
    } // end of method AsmFactory::InitDelMet

    // method line 97
    .method public static 
           default void AddTypB (class [mscorlib]System.Reflection.Emit.TypeBuilder typ)  cil managed 
    {
        // Method begins at RVA 0x8b80
	// Code size 276 (0x114)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class [mscorlib]System.Reflection.Emit.TypeBuilder[]	V_4)
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder[] dylan.NET.Reflection.AsmFactory::CurnTypList
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  add 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 1
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.Reflection.Emit.TypeBuilder
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder[] dylan.NET.Reflection.AsmFactory::CurnTypList
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.Reflection.Emit.TypeBuilder
	IL_0093:  stelem [mscorlib]System.Reflection.Emit.TypeBuilder
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  conv.u 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  stelem [mscorlib]System.Reflection.Emit.TypeBuilder
	IL_0108:  ldloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder[] dylan.NET.Reflection.AsmFactory::CurnTypList
	IL_0113:  ret 
    } // end of method AsmFactory::AddTypB

    // method line 98
    .method public static 
           default void AddTyp (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x8ca0
	// Code size 276 (0x114)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class [mscorlib]System.Type[]	V_4)
	IL_0000:  ldsfld class [mscorlib]System.Type[] dylan.NET.Reflection.AsmFactory::TypArr
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  add 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 1
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.Type
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld class [mscorlib]System.Type[] dylan.NET.Reflection.AsmFactory::TypArr
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.Type
	IL_0093:  stelem [mscorlib]System.Type
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  conv.u 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  stelem [mscorlib]System.Type
	IL_0108:  ldloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  stsfld class [mscorlib]System.Type[] dylan.NET.Reflection.AsmFactory::TypArr
	IL_0113:  ret 
    } // end of method AsmFactory::AddTyp

    // method line 99
    .method public static 
           default void AddGenParamName (string nam)  cil managed 
    {
        // Method begins at RVA 0x8dc0
	// Code size 276 (0x114)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		string[]	V_4)
	IL_0000:  ldsfld string[] dylan.NET.Reflection.AsmFactory::GenParamNames
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  add 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 1
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.String
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld string[] dylan.NET.Reflection.AsmFactory::GenParamNames
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.String
	IL_0093:  stelem [mscorlib]System.String
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  conv.u 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  stelem [mscorlib]System.String
	IL_0108:  ldloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  stsfld string[] dylan.NET.Reflection.AsmFactory::GenParamNames
	IL_0113:  ret 
    } // end of method AsmFactory::AddGenParamName

  } // end of class dylan.NET.Reflection.AsmFactory
}

.namespace dylan.NET.Reflection
{
  .class public auto ansi Importer
  	extends [mscorlib]System.Object
  {
    .field  public static  class [mscorlib]System.Reflection.Assembly[] Asms
    .field  public static  string[] Imps
    .field  public static  string[] LocImps

    // method line 100
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x8ee0
	// Code size 33 (0x21)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr [mscorlib]System.Reflection.Assembly
	IL_000b:  stsfld class [mscorlib]System.Reflection.Assembly[] dylan.NET.Reflection.Importer::Asms
	IL_0010:  ldc.i4 0
	IL_0015:  conv.u 
	IL_0016:  newarr [mscorlib]System.String
	IL_001b:  stsfld string[] dylan.NET.Reflection.Importer::Imps
	IL_0020:  ret 
    } // end of method Importer::.cctor

    // method line 101
    .method public static 
           default void AddAsm (class [mscorlib]System.Reflection.Assembly asm)  cil managed 
    {
        // Method begins at RVA 0x8f10
	// Code size 276 (0x114)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class [mscorlib]System.Reflection.Assembly[]	V_4)
	IL_0000:  ldsfld class [mscorlib]System.Reflection.Assembly[] dylan.NET.Reflection.Importer::Asms
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  stloc 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 1
	IL_0018:  add 
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldloc 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 1
	IL_002a:  sub 
	IL_002b:  stloc 2

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 -1
	IL_0036:  stloc 3

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  conv.u 
	IL_0043:  newarr [mscorlib]System.Reflection.Assembly
	IL_0048:  stloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  add 
	IL_005a:  stloc 3

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bgt IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld class [mscorlib]System.Reflection.Assembly[] dylan.NET.Reflection.Importer::Asms
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem [mscorlib]System.Reflection.Assembly
	IL_0093:  stelem [mscorlib]System.Reflection.Assembly
	IL_0098:  br IL_00a2

	IL_009d:  br IL_00a2

	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  beq IL_00b8

	IL_00b3:  br IL_00c2

	IL_00b8:  br IL_00f0

	IL_00bd:  br IL_00f0

	IL_00c2:  ldloc 2

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldc.i4 -1
	IL_00cd:  beq IL_00e1

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_004e

	IL_00dc:  br IL_00eb

	IL_00e1:  br IL_00f0

	IL_00e6:  br IL_00eb

	IL_00eb:  br IL_00f0

	IL_00f0:  ldloc 4

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  conv.u 
	IL_00fd:  ldarg 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  stelem [mscorlib]System.Reflection.Assembly
	IL_0108:  ldloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  stsfld class [mscorlib]System.Reflection.Assembly[] dylan.NET.Reflection.Importer::Asms
	IL_0113:  ret 
    } // end of method Importer::AddAsm

    // method line 102
    .method public static 
           default string[] addelem (string[] srcarr, string eltoadd)  cil managed 
    {
        // Method begins at RVA 0x9030
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
    } // end of method Importer::addelem

    // method line 103
    .method public static 
           default void AddImp (string imp)  cil managed 
    {
        // Method begins at RVA 0x9150
	// Code size 22 (0x16)
	.maxstack 2
	IL_0000:  ldsfld string[] dylan.NET.Reflection.Importer::Imps
	IL_0005:  ldarg 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  call string[] class dylan.NET.Reflection.Importer::addelem(string[], string)
	IL_0010:  stsfld string[] dylan.NET.Reflection.Importer::Imps
	IL_0015:  ret 
    } // end of method Importer::AddImp

    // method line 104
    .method public static 
           default void AddLocImp (string imp)  cil managed 
    {
        // Method begins at RVA 0x9174
	// Code size 22 (0x16)
	.maxstack 2
	IL_0000:  ldsfld string[] dylan.NET.Reflection.Importer::Imps
	IL_0005:  ldarg 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  call string[] class dylan.NET.Reflection.Importer::addelem(string[], string)
	IL_0010:  stsfld string[] dylan.NET.Reflection.Importer::Imps
	IL_0015:  ret 
    } // end of method Importer::AddLocImp

  } // end of class dylan.NET.Reflection.Importer
}

.namespace dylan.NET.Reflection
{
  .class public auto ansi beforefieldinit Loader
  	extends [mscorlib]System.Object
  {
    .field  public static  bool FldLitFlag
    .field  public static  bool ProtectedFlag
    .field  public static  object FldLitVal
    .field  public static  bool EnumLitFlag
    .field  public static  class [mscorlib]System.Type EnumLitTyp
    .field  public static  class [mscorlib]System.Type FldLitTyp
    .field  public static  class [mscorlib]System.Type MemberTyp
    .field  public static  bool MakeArr
    .field  public static  bool MakeRef

    // method line 105
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x9198
	// Code size 69 (0x45)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  stsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_000a:  ldc.i4 0
	IL_000f:  stsfld bool dylan.NET.Reflection.Loader::FldLitFlag
	IL_0014:  ldnull 
	IL_0015:  stsfld object dylan.NET.Reflection.Loader::FldLitVal
	IL_001a:  ldc.i4 0
	IL_001f:  stsfld bool dylan.NET.Reflection.Loader::EnumLitFlag
	IL_0024:  ldnull 
	IL_0025:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::FldLitTyp
	IL_002a:  ldnull 
	IL_002b:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::MemberTyp
	IL_0030:  ldc.i4 0
	IL_0035:  stsfld bool dylan.NET.Reflection.Loader::MakeArr
	IL_003a:  ldc.i4 0
	IL_003f:  stsfld bool dylan.NET.Reflection.Loader::MakeRef
	IL_0044:  ret 
    } // end of method Loader::.cctor

    // method line 106
    .method public static 
           default class [mscorlib]System.Type LoadClass (string name)  cil managed 
    {
        // Method begins at RVA 0x91ec
	// Code size 1172 (0x494)
	.maxstack 56
	.locals init (
		class [mscorlib]System.Type	V_0,
		int32	V_1,
		int32	V_2,
		class [mscorlib]System.Reflection.Assembly	V_3,
		int32	V_4,
		int32	V_5,
		string	V_6,
		string	V_7,
		bool	V_8,
		class [mscorlib]System.Reflection.Emit.AssemblyBuilder	V_9,
		string[]	V_10)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldc.i4 -1
	IL_000c:  stloc 1

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldsfld class [mscorlib]System.Reflection.Assembly[] dylan.NET.Reflection.Importer::Asms
	IL_0017:  ldlen 
	IL_0018:  conv.i4 
	IL_0019:  ldc.i4 1
	IL_001e:  sub 
	IL_001f:  stloc 2

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldnull 
	IL_0026:  stloc 3

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldc.i4 -1
	IL_0031:  stloc 4

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldsfld string[] dylan.NET.Reflection.Importer::Imps
	IL_003c:  ldlen 
	IL_003d:  conv.i4 
	IL_003e:  ldc.i4 1
	IL_0043:  sub 
	IL_0044:  stloc 5

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldstr ""
	IL_004f:  stloc 6

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldstr ""
	IL_005a:  stloc 7

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldc.i4 0
	IL_0065:  stloc 8

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 0

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldstr "\\"
	IL_0076:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_007b:  stloc 10

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldloc 10

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldc.i4 0
	IL_008c:  conv.u 
	IL_008d:  ldelem [mscorlib]System.String
	IL_0092:  starg 0

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldloc 10

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldlen 
	IL_009f:  conv.i4 
	IL_00a0:  ldc.i4 1
	IL_00a5:  bgt IL_00af

	IL_00aa:  br IL_00bf

	IL_00af:  ldc.i4 1
	IL_00b4:  stloc 8

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  br IL_00c4

	IL_00bf:  br IL_00c4

	IL_00c4:  ldsfld class [mscorlib]System.Reflection.Assembly[] dylan.NET.Reflection.Importer::Asms
	IL_00c9:  ldlen 
	IL_00ca:  conv.i4 
	IL_00cb:  ldc.i4 0
	IL_00d0:  beq IL_00da

	IL_00d5:  br IL_00e4

	IL_00da:  br IL_0400

	IL_00df:  br IL_00e9

	IL_00e4:  br IL_00e9

	IL_00e9:  ldloc 1

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ldc.i4 1
	IL_00f4:  add 
	IL_00f5:  stloc 1

	IL_00f9:  nop 
	IL_00fa:  nop 
	IL_00fb:  ldsfld class [mscorlib]System.Reflection.Assembly[] dylan.NET.Reflection.Importer::Asms
	IL_0100:  ldloc 1

	IL_0104:  nop 
	IL_0105:  nop 
	IL_0106:  conv.u 
	IL_0107:  ldelem [mscorlib]System.Reflection.Assembly
	IL_010c:  stloc 3

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldloc 3

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder dylan.NET.Reflection.AsmFactory::AsmB
	IL_011d:  beq IL_0127

	IL_0122:  br IL_01ba

	IL_0127:  ldloc 3

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  stloc 9

	IL_0131:  nop 
	IL_0132:  nop 
	IL_0133:  ldloc 9

	IL_0137:  nop 
	IL_0138:  nop 
	IL_0139:  ldarg 0

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  ldc.i4 0
	IL_0144:  ldc.i4 0
	IL_0149:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.Assembly::GetType(string, bool, bool)
	IL_014e:  stloc 0

	IL_0152:  nop 
	IL_0153:  nop 
	IL_0154:  ldloc 0

	IL_0158:  nop 
	IL_0159:  nop 
	IL_015a:  ldnull 
	IL_015b:  beq IL_0165

	IL_0160:  br IL_016a

	IL_0165:  br IL_01b5

	IL_016a:  ldloc 8

	IL_016e:  nop 
	IL_016f:  nop 
	IL_0170:  ldc.i4 1
	IL_0175:  beq IL_017f

	IL_017a:  br IL_01a6

	IL_017f:  ldloc 0

	IL_0183:  nop 
	IL_0184:  nop 
	IL_0185:  ldloc 10

	IL_0189:  nop 
	IL_018a:  nop 
	IL_018b:  ldc.i4 1
	IL_0190:  conv.u 
	IL_0191:  ldelem [mscorlib]System.String
	IL_0196:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::GetNestedType(string)
	IL_019b:  stloc 0

	IL_019f:  nop 
	IL_01a0:  nop 
	IL_01a1:  br IL_01ab

	IL_01a6:  br IL_01ab

	IL_01ab:  br IL_0400

	IL_01b0:  br IL_01b5

	IL_01b5:  br IL_0237

	IL_01ba:  ldloc 3

	IL_01be:  nop 
	IL_01bf:  nop 
	IL_01c0:  ldarg 0

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.Assembly::GetType(string)
	IL_01cb:  stloc 0

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  ldloc 0

	IL_01d5:  nop 
	IL_01d6:  nop 
	IL_01d7:  ldnull 
	IL_01d8:  beq IL_01e2

	IL_01dd:  br IL_01e7

	IL_01e2:  br IL_0232

	IL_01e7:  ldloc 8

	IL_01eb:  nop 
	IL_01ec:  nop 
	IL_01ed:  ldc.i4 1
	IL_01f2:  beq IL_01fc

	IL_01f7:  br IL_0223

	IL_01fc:  ldloc 0

	IL_0200:  nop 
	IL_0201:  nop 
	IL_0202:  ldloc 10

	IL_0206:  nop 
	IL_0207:  nop 
	IL_0208:  ldc.i4 1
	IL_020d:  conv.u 
	IL_020e:  ldelem [mscorlib]System.String
	IL_0213:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::GetNestedType(string)
	IL_0218:  stloc 0

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  br IL_0228

	IL_0223:  br IL_0228

	IL_0228:  br IL_0400

	IL_022d:  br IL_0232

	IL_0232:  br IL_0237

	IL_0237:  ldloc 4

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  ldc.i4 1
	IL_0242:  add 
	IL_0243:  stloc 4

	IL_0247:  nop 
	IL_0248:  nop 
	IL_0249:  ldsfld string[] dylan.NET.Reflection.Importer::Imps
	IL_024e:  ldloc 4

	IL_0252:  nop 
	IL_0253:  nop 
	IL_0254:  conv.u 
	IL_0255:  ldelem [mscorlib]System.String
	IL_025a:  stloc 6

	IL_025e:  nop 
	IL_025f:  nop 
	IL_0260:  ldloc 6

	IL_0264:  nop 
	IL_0265:  nop 
	IL_0266:  ldstr "."
	IL_026b:  ldarg 0

	IL_026f:  nop 
	IL_0270:  nop 
	IL_0271:  call string string::Concat(string, string, string)
	IL_0276:  stloc 7

	IL_027a:  nop 
	IL_027b:  nop 
	IL_027c:  ldloc 3

	IL_0280:  nop 
	IL_0281:  nop 
	IL_0282:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder dylan.NET.Reflection.AsmFactory::AsmB
	IL_0287:  beq IL_0291

	IL_028c:  br IL_0324

	IL_0291:  ldloc 3

	IL_0295:  nop 
	IL_0296:  nop 
	IL_0297:  stloc 9

	IL_029b:  nop 
	IL_029c:  nop 
	IL_029d:  ldloc 9

	IL_02a1:  nop 
	IL_02a2:  nop 
	IL_02a3:  ldloc 7

	IL_02a7:  nop 
	IL_02a8:  nop 
	IL_02a9:  ldc.i4 0
	IL_02ae:  ldc.i4 0
	IL_02b3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.Assembly::GetType(string, bool, bool)
	IL_02b8:  stloc 0

	IL_02bc:  nop 
	IL_02bd:  nop 
	IL_02be:  ldloc 0

	IL_02c2:  nop 
	IL_02c3:  nop 
	IL_02c4:  ldnull 
	IL_02c5:  beq IL_02cf

	IL_02ca:  br IL_02d4

	IL_02cf:  br IL_031f

	IL_02d4:  ldloc 8

	IL_02d8:  nop 
	IL_02d9:  nop 
	IL_02da:  ldc.i4 1
	IL_02df:  beq IL_02e9

	IL_02e4:  br IL_0310

	IL_02e9:  ldloc 0

	IL_02ed:  nop 
	IL_02ee:  nop 
	IL_02ef:  ldloc 10

	IL_02f3:  nop 
	IL_02f4:  nop 
	IL_02f5:  ldc.i4 1
	IL_02fa:  conv.u 
	IL_02fb:  ldelem [mscorlib]System.String
	IL_0300:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::GetNestedType(string)
	IL_0305:  stloc 0

	IL_0309:  nop 
	IL_030a:  nop 
	IL_030b:  br IL_0315

	IL_0310:  br IL_0315

	IL_0315:  br IL_0400

	IL_031a:  br IL_031f

	IL_031f:  br IL_03a1

	IL_0324:  ldloc 3

	IL_0328:  nop 
	IL_0329:  nop 
	IL_032a:  ldloc 7

	IL_032e:  nop 
	IL_032f:  nop 
	IL_0330:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.Assembly::GetType(string)
	IL_0335:  stloc 0

	IL_0339:  nop 
	IL_033a:  nop 
	IL_033b:  ldloc 0

	IL_033f:  nop 
	IL_0340:  nop 
	IL_0341:  ldnull 
	IL_0342:  beq IL_034c

	IL_0347:  br IL_0351

	IL_034c:  br IL_039c

	IL_0351:  ldloc 8

	IL_0355:  nop 
	IL_0356:  nop 
	IL_0357:  ldc.i4 1
	IL_035c:  beq IL_0366

	IL_0361:  br IL_038d

	IL_0366:  ldloc 0

	IL_036a:  nop 
	IL_036b:  nop 
	IL_036c:  ldloc 10

	IL_0370:  nop 
	IL_0371:  nop 
	IL_0372:  ldc.i4 1
	IL_0377:  conv.u 
	IL_0378:  ldelem [mscorlib]System.String
	IL_037d:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::GetNestedType(string)
	IL_0382:  stloc 0

	IL_0386:  nop 
	IL_0387:  nop 
	IL_0388:  br IL_0392

	IL_038d:  br IL_0392

	IL_0392:  br IL_0400

	IL_0397:  br IL_039c

	IL_039c:  br IL_03a1

	IL_03a1:  ldloc 4

	IL_03a5:  nop 
	IL_03a6:  nop 
	IL_03a7:  ldloc 5

	IL_03ab:  nop 
	IL_03ac:  nop 
	IL_03ad:  beq IL_03b7

	IL_03b2:  br IL_03cc

	IL_03b7:  ldc.i4 -1
	IL_03bc:  stloc 4

	IL_03c0:  nop 
	IL_03c1:  nop 
	IL_03c2:  br IL_03d6

	IL_03c7:  br IL_03d6

	IL_03cc:  br IL_0237

	IL_03d1:  br IL_03d6

	IL_03d6:  ldloc 1

	IL_03da:  nop 
	IL_03db:  nop 
	IL_03dc:  ldloc 2

	IL_03e0:  nop 
	IL_03e1:  nop 
	IL_03e2:  beq IL_03ec

	IL_03e7:  br IL_03f6

	IL_03ec:  br IL_0400

	IL_03f1:  br IL_0400

	IL_03f6:  br IL_00e9

	IL_03fb:  br IL_0400

	IL_0400:  ldloc 0

	IL_0404:  nop 
	IL_0405:  nop 
	IL_0406:  ldnull 
	IL_0407:  beq IL_0474

	IL_040c:  br IL_0411

	IL_0411:  ldsfld bool dylan.NET.Reflection.Loader::MakeArr
	IL_0416:  ldc.i4 1
	IL_041b:  beq IL_0425

	IL_0420:  br IL_043b

	IL_0425:  ldloc 0

	IL_0429:  nop 
	IL_042a:  nop 
	IL_042b:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeArrayType()
	IL_0430:  stloc 0

	IL_0434:  nop 
	IL_0435:  nop 
	IL_0436:  br IL_0440

	IL_043b:  br IL_0440

	IL_0440:  ldsfld bool dylan.NET.Reflection.Loader::MakeRef
	IL_0445:  ldc.i4 1
	IL_044a:  beq IL_0454

	IL_044f:  br IL_046a

	IL_0454:  ldloc 0

	IL_0458:  nop 
	IL_0459:  nop 
	IL_045a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeByRefType()
	IL_045f:  stloc 0

	IL_0463:  nop 
	IL_0464:  nop 
	IL_0465:  br IL_046f

	IL_046a:  br IL_046f

	IL_046f:  br IL_0479

	IL_0474:  br IL_0479

	IL_0479:  ldc.i4 0
	IL_047e:  stsfld bool dylan.NET.Reflection.Loader::MakeArr
	IL_0483:  ldc.i4 0
	IL_0488:  stsfld bool dylan.NET.Reflection.Loader::MakeRef
	IL_048d:  ldloc 0

	IL_0491:  nop 
	IL_0492:  nop 
	IL_0493:  ret 
    } // end of method Loader::LoadClass

    // method line 107
    .method public static 
           default class [mscorlib]System.Type ProcessType (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x968c
	// Code size 121 (0x79)
	.maxstack 7
	IL_0000:  ldsfld bool dylan.NET.Reflection.Loader::MakeArr
	IL_0005:  ldc.i4 1
	IL_000a:  beq IL_0014

	IL_000f:  br IL_002a

	IL_0014:  ldarg 0

	IL_0018:  nop 
	IL_0019:  nop 
	IL_001a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeArrayType()
	IL_001f:  starg 0

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  br IL_002f

	IL_002a:  br IL_002f

	IL_002f:  ldsfld bool dylan.NET.Reflection.Loader::MakeRef
	IL_0034:  ldc.i4 1
	IL_0039:  beq IL_0043

	IL_003e:  br IL_0059

	IL_0043:  ldarg 0

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeByRefType()
	IL_004e:  starg 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  br IL_005e

	IL_0059:  br IL_005e

	IL_005e:  ldc.i4 0
	IL_0063:  stsfld bool dylan.NET.Reflection.Loader::MakeArr
	IL_0068:  ldc.i4 0
	IL_006d:  stsfld bool dylan.NET.Reflection.Loader::MakeRef
	IL_0072:  ldarg 0

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ret 
    } // end of method Loader::ProcessType

    // method line 108
    .method public static 
           default class [mscorlib]System.Type[] ParamsToTyps (class [mscorlib]System.Reflection.ParameterInfo[] t)  cil managed 
    {
        // Method begins at RVA 0x9714
	// Code size 240 (0xf0)
	.maxstack 9
	.locals init (
		int32	V_0,
		class [mscorlib]System.Type[]	V_1,
		class [mscorlib]System.Reflection.ParameterInfo	V_2,
		class [mscorlib]System.Type	V_3,
		int32	V_4,
		int32	V_5)
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
	IL_0014:  conv.u 
	IL_0015:  newarr [mscorlib]System.Type
	IL_001a:  stloc 1

	IL_001e:  nop 
	IL_001f:  nop 
	IL_0020:  ldc.i4 -1
	IL_0025:  stloc 4

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldloc 0

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 1
	IL_0036:  sub 
	IL_0037:  stloc 5

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldloc 0

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ldc.i4 0
	IL_0048:  beq IL_0052

	IL_004d:  br IL_0067

	IL_0052:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_0057:  stloc 1

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  br IL_00e9

	IL_0062:  br IL_006c

	IL_0067:  br IL_006c

	IL_006c:  ldloc 4

	IL_0070:  nop 
	IL_0071:  nop 
	IL_0072:  ldc.i4 1
	IL_0077:  add 
	IL_0078:  stloc 4

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldarg 0

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldloc 4

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  conv.u 
	IL_008b:  ldelem [mscorlib]System.Reflection.ParameterInfo
	IL_0090:  stloc 2

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 2

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.ParameterInfo::get_ParameterType()
	IL_00a1:  stloc 3

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldloc 1

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldloc 4

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  conv.u 
	IL_00b4:  ldloc 3

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  stelem [mscorlib]System.Type
	IL_00bf:  ldloc 4

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldloc 5

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  beq IL_00d5

	IL_00d0:  br IL_00df

	IL_00d5:  br IL_00e9

	IL_00da:  br IL_00e9

	IL_00df:  br IL_006c

	IL_00e4:  br IL_00e9

	IL_00e9:  ldloc 1

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ret 
    } // end of method Loader::ParamsToTyps

    // method line 109
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo LoadMethodWithoutParams (class [mscorlib]System.Type typ, string name)  cil managed 
    {
        // Method begins at RVA 0x9810
	// Code size 379 (0x17b)
	.maxstack 14
	.locals init (
		class [mscorlib]System.Type	V_0,
		class [mscorlib]System.Type[]	V_1,
		int32	V_2,
		int32	V_3,
		class [mscorlib]System.Reflection.MethodInfo	V_4)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldnull 
	IL_0008:  stloc 1

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldc.i4 -1
	IL_0013:  stloc 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldc.i4 0
	IL_001e:  stloc 3

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldnull 
	IL_0025:  stloc 4

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldarg 0

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldarg 1

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string)
	IL_003c:  stloc 4

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 4

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldnull 
	IL_0049:  beq IL_0053

	IL_004e:  br IL_0144

	IL_0053:  ldarg 0

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  callvirt instance class [mscorlib]System.Type[] class [mscorlib]System.Type::GetInterfaces()
	IL_005e:  stloc 1

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  ldloc 1

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldnull 
	IL_006b:  beq IL_013a

	IL_0070:  br IL_0075

	IL_0075:  ldloc 1

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldlen 
	IL_007c:  conv.i4 
	IL_007d:  ldc.i4 0
	IL_0082:  bgt IL_008c

	IL_0087:  br IL_0130

	IL_008c:  ldloc 1

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldlen 
	IL_0093:  conv.i4 
	IL_0094:  ldc.i4 1
	IL_0099:  sub 
	IL_009a:  stloc 3

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  ldloc 2

	IL_00a4:  nop 
	IL_00a5:  nop 
	IL_00a6:  ldc.i4 1
	IL_00ab:  add 
	IL_00ac:  stloc 2

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 1

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 2

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  conv.u 
	IL_00bf:  ldelem [mscorlib]System.Type
	IL_00c4:  stloc 0

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  ldloc 0

	IL_00ce:  nop 
	IL_00cf:  nop 
	IL_00d0:  ldarg 1

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string)
	IL_00db:  stloc 4

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  ldloc 4

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ldnull 
	IL_00e8:  beq IL_00f2

	IL_00ed:  br IL_00f7

	IL_00f2:  br IL_0101

	IL_00f7:  br IL_012b

	IL_00fc:  br IL_0101

	IL_0101:  ldloc 2

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldloc 3

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  beq IL_0117

	IL_0112:  br IL_0121

	IL_0117:  br IL_012b

	IL_011c:  br IL_012b

	IL_0121:  br IL_00a0

	IL_0126:  br IL_012b

	IL_012b:  br IL_0135

	IL_0130:  br IL_0135

	IL_0135:  br IL_013f

	IL_013a:  br IL_013f

	IL_013f:  br IL_0149

	IL_0144:  br IL_0149

	IL_0149:  ldloc 4

	IL_014d:  nop 
	IL_014e:  nop 
	IL_014f:  ldnull 
	IL_0150:  beq IL_016f

	IL_0155:  br IL_015a

	IL_015a:  ldloc 4

	IL_015e:  nop 
	IL_015f:  nop 
	IL_0160:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0165:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::MemberTyp
	IL_016a:  br IL_0174

	IL_016f:  br IL_0174

	IL_0174:  ldloc 4

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ret 
    } // end of method Loader::LoadMethodWithoutParams

    // method line 110
    .method public static 
           default class [mscorlib]System.Type[] GetDelegateInvokeParams (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x9998
	// Code size 63 (0x3f)
	.maxstack 2
	.locals init (
		class [mscorlib]System.Reflection.MethodInfo	V_0,
		class [mscorlib]System.Reflection.ParameterInfo[]	V_1,
		class [mscorlib]System.Type[]	V_2)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldstr "Invoke"
	IL_000b:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Reflection.Loader::LoadMethodWithoutParams(class [mscorlib]System.Type, string)
	IL_0010:  stloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  callvirt instance class [mscorlib]System.Reflection.ParameterInfo[] class [mscorlib]System.Reflection.MethodBase::GetParameters()
	IL_0021:  stloc 1

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldloc 1

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  call class [mscorlib]System.Type[] class dylan.NET.Reflection.Loader::ParamsToTyps(class [mscorlib]System.Reflection.ParameterInfo[])
	IL_0032:  stloc 2

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 2

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ret 
    } // end of method Loader::GetDelegateInvokeParams

    // method line 111
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo LoadMethod (class [mscorlib]System.Type typ, string name, class [mscorlib]System.Type[] typs)  cil managed 
    {
        // Method begins at RVA 0x99e4
	// Code size 1020 (0x3fc)
	.maxstack 39
	.locals init (
		class [mscorlib]System.Type	V_0,
		class [mscorlib]System.Type[]	V_1,
		int32	V_2,
		int32	V_3,
		class [mscorlib]System.Reflection.MethodInfo	V_4,
		class [mscorlib]System.Reflection.Binder	V_5,
		valuetype [mscorlib]System.Reflection.ParameterModifier[]	V_6,
		valuetype [mscorlib]System.Reflection.BindingFlags	V_7,
		bool	V_8,
		bool	V_9,
		class [mscorlib]System.Reflection.Assembly	V_10,
		class [mscorlib]System.Reflection.AssemblyName	V_11,
		bool	V_12,
		bool	V_13)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldnull 
	IL_0008:  stloc 1

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldc.i4 -1
	IL_0013:  stloc 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldc.i4 0
	IL_001e:  stloc 3

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldnull 
	IL_0025:  stloc 4

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldarg 0

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldarg 1

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldarg 2

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0042:  stloc 4

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldloc 4

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldnull 
	IL_004f:  beq IL_0059

	IL_0054:  br IL_0150

	IL_0059:  ldarg 0

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  callvirt instance class [mscorlib]System.Type[] class [mscorlib]System.Type::GetInterfaces()
	IL_0064:  stloc 1

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldloc 1

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldnull 
	IL_0071:  beq IL_0146

	IL_0076:  br IL_007b

	IL_007b:  ldloc 1

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldlen 
	IL_0082:  conv.i4 
	IL_0083:  ldc.i4 0
	IL_0088:  bgt IL_0092

	IL_008d:  br IL_013c

	IL_0092:  ldloc 1

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldlen 
	IL_0099:  conv.i4 
	IL_009a:  ldc.i4 1
	IL_009f:  sub 
	IL_00a0:  stloc 3

	IL_00a4:  nop 
	IL_00a5:  nop 
	IL_00a6:  ldloc 2

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldc.i4 1
	IL_00b1:  add 
	IL_00b2:  stloc 2

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 1

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  ldloc 2

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  conv.u 
	IL_00c5:  ldelem [mscorlib]System.Type
	IL_00ca:  stloc 0

	IL_00ce:  nop 
	IL_00cf:  nop 
	IL_00d0:  ldloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldarg 1

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldarg 2

	IL_00e0:  nop 
	IL_00e1:  nop 
	IL_00e2:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_00e7:  stloc 4

	IL_00eb:  nop 
	IL_00ec:  nop 
	IL_00ed:  ldloc 4

	IL_00f1:  nop 
	IL_00f2:  nop 
	IL_00f3:  ldnull 
	IL_00f4:  beq IL_00fe

	IL_00f9:  br IL_0103

	IL_00fe:  br IL_010d

	IL_0103:  br IL_0137

	IL_0108:  br IL_010d

	IL_010d:  ldloc 2

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldloc 3

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  beq IL_0123

	IL_011e:  br IL_012d

	IL_0123:  br IL_0137

	IL_0128:  br IL_0137

	IL_012d:  br IL_00a6

	IL_0132:  br IL_0137

	IL_0137:  br IL_0141

	IL_013c:  br IL_0141

	IL_0141:  br IL_014b

	IL_0146:  br IL_014b

	IL_014b:  br IL_0155

	IL_0150:  br IL_0155

	IL_0155:  ldloc 4

	IL_0159:  nop 
	IL_015a:  nop 
	IL_015b:  ldnull 
	IL_015c:  beq IL_017b

	IL_0161:  br IL_0166

	IL_0166:  ldloc 4

	IL_016a:  nop 
	IL_016b:  nop 
	IL_016c:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0171:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::MemberTyp
	IL_0176:  br IL_0180

	IL_017b:  br IL_0180

	IL_0180:  ldnull 
	IL_0181:  stloc 5

	IL_0185:  nop 
	IL_0186:  nop 
	IL_0187:  ldc.i4 0
	IL_018c:  conv.u 
	IL_018d:  newarr [mscorlib]System.Reflection.ParameterModifier
	IL_0192:  stloc 6

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldc.i4 4
	IL_019d:  ldc.i4 8
	IL_01a2:  or 
	IL_01a3:  ldc.i4 16
	IL_01a8:  or 
	IL_01a9:  ldc.i4 32
	IL_01ae:  or 
	IL_01af:  stloc 7

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  ldloc 4

	IL_01b9:  nop 
	IL_01ba:  nop 
	IL_01bb:  ldnull 
	IL_01bc:  beq IL_01c6

	IL_01c1:  br IL_03f0

	IL_01c6:  ldarg 0

	IL_01ca:  nop 
	IL_01cb:  nop 
	IL_01cc:  ldarg 1

	IL_01d0:  nop 
	IL_01d1:  nop 
	IL_01d2:  ldloc 7

	IL_01d6:  nop 
	IL_01d7:  nop 
	IL_01d8:  ldloc 5

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldarg 2

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldloc 6

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, valuetype [mscorlib]System.Reflection.BindingFlags, class [mscorlib]System.Reflection.Binder, class [mscorlib]System.Type[], valuetype [mscorlib]System.Reflection.ParameterModifier[])
	IL_01ef:  stloc 4

	IL_01f3:  nop 
	IL_01f4:  nop 
	IL_01f5:  ldloc 4

	IL_01f9:  nop 
	IL_01fa:  nop 
	IL_01fb:  ldnull 
	IL_01fc:  beq IL_03bb

	IL_0201:  br IL_0206

	IL_0206:  ldc.i4 0
	IL_020b:  stloc 8

	IL_020f:  nop 
	IL_0210:  nop 
	IL_0211:  ldloc 4

	IL_0215:  nop 
	IL_0216:  nop 
	IL_0217:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsPrivate()
	IL_021c:  stloc 8

	IL_0220:  nop 
	IL_0221:  nop 
	IL_0222:  ldloc 8

	IL_0226:  nop 
	IL_0227:  nop 
	IL_0228:  ldc.i4 0
	IL_022d:  beq IL_0237

	IL_0232:  br IL_03aa

	IL_0237:  ldarg 0

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  callvirt instance class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Type::get_Assembly()
	IL_0242:  stloc 10

	IL_0246:  nop 
	IL_0247:  nop 
	IL_0248:  ldloc 10

	IL_024c:  nop 
	IL_024d:  nop 
	IL_024e:  callvirt instance class [mscorlib]System.Reflection.AssemblyName class [mscorlib]System.Reflection.Assembly::GetName()
	IL_0253:  stloc 11

	IL_0257:  nop 
	IL_0258:  nop 
	IL_0259:  ldsfld class [mscorlib]System.Reflection.AssemblyName dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_025e:  ldloc 11

	IL_0262:  nop 
	IL_0263:  nop 
	IL_0264:  call bool class [mscorlib]System.Reflection.AssemblyName::ReferenceMatchesDefinition(class [mscorlib]System.Reflection.AssemblyName, class [mscorlib]System.Reflection.AssemblyName)
	IL_0269:  stloc 9

	IL_026d:  nop 
	IL_026e:  nop 
	IL_026f:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_0274:  ldloc 9

	IL_0278:  nop 
	IL_0279:  nop 
	IL_027a:  or 
	IL_027b:  stloc 12

	IL_027f:  nop 
	IL_0280:  nop 
	IL_0281:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_0286:  ldloc 9

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  and 
	IL_028d:  stloc 13

	IL_0291:  nop 
	IL_0292:  nop 
	IL_0293:  ldloc 4

	IL_0297:  nop 
	IL_0298:  nop 
	IL_0299:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsFamilyAndAssembly()
	IL_029e:  stloc 8

	IL_02a2:  nop 
	IL_02a3:  nop 
	IL_02a4:  ldloc 8

	IL_02a8:  nop 
	IL_02a9:  nop 
	IL_02aa:  ldloc 13

	IL_02ae:  nop 
	IL_02af:  nop 
	IL_02b0:  and 
	IL_02b1:  stloc 8

	IL_02b5:  nop 
	IL_02b6:  nop 
	IL_02b7:  ldloc 8

	IL_02bb:  nop 
	IL_02bc:  nop 
	IL_02bd:  ldc.i4 0
	IL_02c2:  beq IL_02cc

	IL_02c7:  br IL_03a0

	IL_02cc:  ldloc 4

	IL_02d0:  nop 
	IL_02d1:  nop 
	IL_02d2:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsFamilyOrAssembly()
	IL_02d7:  stloc 8

	IL_02db:  nop 
	IL_02dc:  nop 
	IL_02dd:  ldloc 8

	IL_02e1:  nop 
	IL_02e2:  nop 
	IL_02e3:  ldloc 12

	IL_02e7:  nop 
	IL_02e8:  nop 
	IL_02e9:  and 
	IL_02ea:  stloc 8

	IL_02ee:  nop 
	IL_02ef:  nop 
	IL_02f0:  ldloc 8

	IL_02f4:  nop 
	IL_02f5:  nop 
	IL_02f6:  ldc.i4 0
	IL_02fb:  beq IL_0305

	IL_0300:  br IL_0396

	IL_0305:  ldloc 4

	IL_0309:  nop 
	IL_030a:  nop 
	IL_030b:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsFamily()
	IL_0310:  stloc 8

	IL_0314:  nop 
	IL_0315:  nop 
	IL_0316:  ldloc 8

	IL_031a:  nop 
	IL_031b:  nop 
	IL_031c:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_0321:  and 
	IL_0322:  stloc 8

	IL_0326:  nop 
	IL_0327:  nop 
	IL_0328:  ldloc 8

	IL_032c:  nop 
	IL_032d:  nop 
	IL_032e:  ldc.i4 0
	IL_0333:  beq IL_033d

	IL_0338:  br IL_038c

	IL_033d:  ldloc 4

	IL_0341:  nop 
	IL_0342:  nop 
	IL_0343:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsAssembly()
	IL_0348:  stloc 8

	IL_034c:  nop 
	IL_034d:  nop 
	IL_034e:  ldloc 8

	IL_0352:  nop 
	IL_0353:  nop 
	IL_0354:  ldloc 9

	IL_0358:  nop 
	IL_0359:  nop 
	IL_035a:  and 
	IL_035b:  stloc 8

	IL_035f:  nop 
	IL_0360:  nop 
	IL_0361:  ldloc 8

	IL_0365:  nop 
	IL_0366:  nop 
	IL_0367:  ldc.i4 0
	IL_036c:  beq IL_0376

	IL_0371:  br IL_0382

	IL_0376:  ldnull 
	IL_0377:  stloc 4

	IL_037b:  nop 
	IL_037c:  nop 
	IL_037d:  br IL_0387

	IL_0382:  br IL_0387

	IL_0387:  br IL_0391

	IL_038c:  br IL_0391

	IL_0391:  br IL_039b

	IL_0396:  br IL_039b

	IL_039b:  br IL_03a5

	IL_03a0:  br IL_03a5

	IL_03a5:  br IL_03b6

	IL_03aa:  ldnull 
	IL_03ab:  stloc 4

	IL_03af:  nop 
	IL_03b0:  nop 
	IL_03b1:  br IL_03b6

	IL_03b6:  br IL_03c0

	IL_03bb:  br IL_03c0

	IL_03c0:  ldloc 4

	IL_03c4:  nop 
	IL_03c5:  nop 
	IL_03c6:  ldnull 
	IL_03c7:  beq IL_03e6

	IL_03cc:  br IL_03d1

	IL_03d1:  ldloc 4

	IL_03d5:  nop 
	IL_03d6:  nop 
	IL_03d7:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_03dc:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::MemberTyp
	IL_03e1:  br IL_03eb

	IL_03e6:  br IL_03eb

	IL_03eb:  br IL_03f5

	IL_03f0:  br IL_03f5

	IL_03f5:  ldloc 4

	IL_03f9:  nop 
	IL_03fa:  nop 
	IL_03fb:  ret 
    } // end of method Loader::LoadMethod

    // method line 112
    .method public static 
           default class [mscorlib]System.Reflection.ConstructorInfo LoadCtor (class [mscorlib]System.Type typ, class [mscorlib]System.Type[] typs)  cil managed 
    {
        // Method begins at RVA 0x9dec
	// Code size 686 (0x2ae)
	.maxstack 26
	.locals init (
		class [mscorlib]System.Reflection.Binder	V_0,
		valuetype [mscorlib]System.Reflection.ParameterModifier[]	V_1,
		valuetype [mscorlib]System.Reflection.BindingFlags	V_2,
		class [mscorlib]System.Reflection.ConstructorInfo	V_3,
		bool	V_4,
		bool	V_5,
		class [mscorlib]System.Reflection.Assembly	V_6,
		class [mscorlib]System.Reflection.AssemblyName	V_7,
		bool	V_8,
		bool	V_9)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr [mscorlib]System.Reflection.ParameterModifier
	IL_0012:  stloc 1

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  ldc.i4 4
	IL_001d:  ldc.i4 8
	IL_0022:  or 
	IL_0023:  ldc.i4 16
	IL_0028:  or 
	IL_0029:  ldc.i4 32
	IL_002e:  or 
	IL_002f:  stloc 2

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  ldarg 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldarg 1

	IL_003f:  nop 
	IL_0040:  nop 
	IL_0041:  callvirt instance class [mscorlib]System.Reflection.ConstructorInfo class [mscorlib]System.Type::GetConstructor(class [mscorlib]System.Type[])
	IL_0046:  stloc 3

	IL_004a:  nop 
	IL_004b:  nop 
	IL_004c:  ldloc 3

	IL_0050:  nop 
	IL_0051:  nop 
	IL_0052:  ldnull 
	IL_0053:  beq IL_006d

	IL_0058:  br IL_005d

	IL_005d:  ldarg 0

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::MemberTyp
	IL_0068:  br IL_0072

	IL_006d:  br IL_0072

	IL_0072:  ldloc 3

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldnull 
	IL_0079:  beq IL_0083

	IL_007e:  br IL_02a2

	IL_0083:  ldarg 0

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldloc 2

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldloc 0

	IL_0093:  nop 
	IL_0094:  nop 
	IL_0095:  ldarg 1

	IL_0099:  nop 
	IL_009a:  nop 
	IL_009b:  ldloc 1

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  callvirt instance class [mscorlib]System.Reflection.ConstructorInfo class [mscorlib]System.Type::GetConstructor(valuetype [mscorlib]System.Reflection.BindingFlags, class [mscorlib]System.Reflection.Binder, class [mscorlib]System.Type[], valuetype [mscorlib]System.Reflection.ParameterModifier[])
	IL_00a6:  stloc 3

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldloc 3

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldnull 
	IL_00b3:  beq IL_0272

	IL_00b8:  br IL_00bd

	IL_00bd:  ldc.i4 0
	IL_00c2:  stloc 4

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldloc 3

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsPrivate()
	IL_00d3:  stloc 4

	IL_00d7:  nop 
	IL_00d8:  nop 
	IL_00d9:  ldloc 4

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldc.i4 0
	IL_00e4:  beq IL_00ee

	IL_00e9:  br IL_0261

	IL_00ee:  ldarg 0

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  callvirt instance class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Type::get_Assembly()
	IL_00f9:  stloc 6

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  ldloc 6

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  callvirt instance class [mscorlib]System.Reflection.AssemblyName class [mscorlib]System.Reflection.Assembly::GetName()
	IL_010a:  stloc 7

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ldsfld class [mscorlib]System.Reflection.AssemblyName dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_0115:  ldloc 7

	IL_0119:  nop 
	IL_011a:  nop 
	IL_011b:  call bool class [mscorlib]System.Reflection.AssemblyName::ReferenceMatchesDefinition(class [mscorlib]System.Reflection.AssemblyName, class [mscorlib]System.Reflection.AssemblyName)
	IL_0120:  stloc 5

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_012b:  ldloc 5

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  or 
	IL_0132:  stloc 8

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_013d:  ldloc 5

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  and 
	IL_0144:  stloc 9

	IL_0148:  nop 
	IL_0149:  nop 
	IL_014a:  ldloc 3

	IL_014e:  nop 
	IL_014f:  nop 
	IL_0150:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsFamilyAndAssembly()
	IL_0155:  stloc 4

	IL_0159:  nop 
	IL_015a:  nop 
	IL_015b:  ldloc 4

	IL_015f:  nop 
	IL_0160:  nop 
	IL_0161:  ldloc 9

	IL_0165:  nop 
	IL_0166:  nop 
	IL_0167:  and 
	IL_0168:  stloc 4

	IL_016c:  nop 
	IL_016d:  nop 
	IL_016e:  ldloc 4

	IL_0172:  nop 
	IL_0173:  nop 
	IL_0174:  ldc.i4 0
	IL_0179:  beq IL_0183

	IL_017e:  br IL_0257

	IL_0183:  ldloc 3

	IL_0187:  nop 
	IL_0188:  nop 
	IL_0189:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsFamilyOrAssembly()
	IL_018e:  stloc 4

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  ldloc 4

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  ldloc 8

	IL_019e:  nop 
	IL_019f:  nop 
	IL_01a0:  and 
	IL_01a1:  stloc 4

	IL_01a5:  nop 
	IL_01a6:  nop 
	IL_01a7:  ldloc 4

	IL_01ab:  nop 
	IL_01ac:  nop 
	IL_01ad:  ldc.i4 0
	IL_01b2:  beq IL_01bc

	IL_01b7:  br IL_024d

	IL_01bc:  ldloc 3

	IL_01c0:  nop 
	IL_01c1:  nop 
	IL_01c2:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsFamily()
	IL_01c7:  stloc 4

	IL_01cb:  nop 
	IL_01cc:  nop 
	IL_01cd:  ldloc 4

	IL_01d1:  nop 
	IL_01d2:  nop 
	IL_01d3:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_01d8:  and 
	IL_01d9:  stloc 4

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  ldloc 4

	IL_01e3:  nop 
	IL_01e4:  nop 
	IL_01e5:  ldc.i4 0
	IL_01ea:  beq IL_01f4

	IL_01ef:  br IL_0243

	IL_01f4:  ldloc 3

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsAssembly()
	IL_01ff:  stloc 4

	IL_0203:  nop 
	IL_0204:  nop 
	IL_0205:  ldloc 4

	IL_0209:  nop 
	IL_020a:  nop 
	IL_020b:  ldloc 5

	IL_020f:  nop 
	IL_0210:  nop 
	IL_0211:  and 
	IL_0212:  stloc 4

	IL_0216:  nop 
	IL_0217:  nop 
	IL_0218:  ldloc 4

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  ldc.i4 0
	IL_0223:  beq IL_022d

	IL_0228:  br IL_0239

	IL_022d:  ldnull 
	IL_022e:  stloc 3

	IL_0232:  nop 
	IL_0233:  nop 
	IL_0234:  br IL_023e

	IL_0239:  br IL_023e

	IL_023e:  br IL_0248

	IL_0243:  br IL_0248

	IL_0248:  br IL_0252

	IL_024d:  br IL_0252

	IL_0252:  br IL_025c

	IL_0257:  br IL_025c

	IL_025c:  br IL_026d

	IL_0261:  ldnull 
	IL_0262:  stloc 3

	IL_0266:  nop 
	IL_0267:  nop 
	IL_0268:  br IL_026d

	IL_026d:  br IL_0277

	IL_0272:  br IL_0277

	IL_0277:  ldloc 3

	IL_027b:  nop 
	IL_027c:  nop 
	IL_027d:  ldnull 
	IL_027e:  beq IL_0298

	IL_0283:  br IL_0288

	IL_0288:  ldarg 0

	IL_028c:  nop 
	IL_028d:  nop 
	IL_028e:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::MemberTyp
	IL_0293:  br IL_029d

	IL_0298:  br IL_029d

	IL_029d:  br IL_02a7

	IL_02a2:  br IL_02a7

	IL_02a7:  ldloc 3

	IL_02ab:  nop 
	IL_02ac:  nop 
	IL_02ad:  ret 
    } // end of method Loader::LoadCtor

    // method line 113
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo[] addelemmtdinfo (class [mscorlib]System.Reflection.MethodInfo[] srcarr, class [mscorlib]System.Reflection.MethodInfo eltoadd)  cil managed 
    {
        // Method begins at RVA 0xa0a8
	// Code size 273 (0x111)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class [mscorlib]System.Reflection.MethodInfo[]	V_4)
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
	IL_0044:  newarr [mscorlib]System.Reflection.MethodInfo
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
	IL_0090:  ldelem [mscorlib]System.Reflection.MethodInfo
	IL_0095:  stelem [mscorlib]System.Reflection.MethodInfo
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
	IL_0105:  stelem [mscorlib]System.Reflection.MethodInfo
	IL_010a:  ldloc 4

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ret 
    } // end of method Loader::addelemmtdinfo

    // method line 114
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo[] LoadSpecMtds (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0xa1c8
	// Code size 278 (0x116)
	.maxstack 9
	.locals init (
		int32	V_0,
		class [mscorlib]System.Reflection.MethodInfo	V_1,
		class [mscorlib]System.Reflection.MethodInfo[]	V_2,
		class [mscorlib]System.Reflection.MethodInfo[]	V_3,
		int32	V_4,
		bool	V_5)
	IL_0000:  ldc.i4 -1
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldnull 
	IL_000c:  stloc 1

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldarg 0

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  callvirt instance class [mscorlib]System.Reflection.MethodInfo[] class [mscorlib]System.Type::GetMethods()
	IL_001d:  stloc 2

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  ldc.i4 0
	IL_0028:  conv.u 
	IL_0029:  newarr [mscorlib]System.Reflection.MethodInfo
	IL_002e:  stloc 3

	IL_0032:  nop 
	IL_0033:  nop 
	IL_0034:  ldloc 2

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldlen 
	IL_003b:  conv.i4 
	IL_003c:  ldc.i4 1
	IL_0041:  sub 
	IL_0042:  stloc 4

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldc.i4 0
	IL_004d:  stloc 5

	IL_0051:  nop 
	IL_0052:  nop 
	IL_0053:  ldloc 2

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  ldlen 
	IL_005a:  conv.i4 
	IL_005b:  ldc.i4 0
	IL_0060:  bgt IL_006a

	IL_0065:  br IL_010a

	IL_006a:  ldloc 0

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldc.i4 1
	IL_0075:  add 
	IL_0076:  stloc 0

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 2

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldloc 0

	IL_0086:  nop 
	IL_0087:  nop 
	IL_0088:  conv.u 
	IL_0089:  ldelem [mscorlib]System.Reflection.MethodInfo
	IL_008e:  stloc 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldloc 1

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsSpecialName()
	IL_009f:  stloc 5

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldloc 5

	IL_00a9:  nop 
	IL_00aa:  nop 
	IL_00ab:  ldc.i4 1
	IL_00b0:  beq IL_00ba

	IL_00b5:  br IL_00d6

	IL_00ba:  ldloc 3

	IL_00be:  nop 
	IL_00bf:  nop 
	IL_00c0:  ldloc 1

	IL_00c4:  nop 
	IL_00c5:  nop 
	IL_00c6:  call class [mscorlib]System.Reflection.MethodInfo[] class dylan.NET.Reflection.Loader::addelemmtdinfo(class [mscorlib]System.Reflection.MethodInfo[], class [mscorlib]System.Reflection.MethodInfo)
	IL_00cb:  stloc 3

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  br IL_00db

	IL_00d6:  br IL_00db

	IL_00db:  ldloc 0

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  ldloc 4

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  beq IL_00f1

	IL_00ec:  br IL_00fb

	IL_00f1:  br IL_0105

	IL_00f6:  br IL_0105

	IL_00fb:  br IL_006a

	IL_0100:  br IL_0105

	IL_0105:  br IL_010f

	IL_010a:  br IL_010f

	IL_010f:  ldloc 3

	IL_0113:  nop 
	IL_0114:  nop 
	IL_0115:  ret 
    } // end of method Loader::LoadSpecMtds

    // method line 115
    .method public static 
           default bool CompareParamsToTyps (class [mscorlib]System.Reflection.ParameterInfo[] t1, class [mscorlib]System.Type[] t2)  cil managed 
    {
        // Method begins at RVA 0xa2ec
	// Code size 351 (0x15f)
	.maxstack 12
	.locals init (
		bool	V_0,
		bool	V_1,
		class [mscorlib]System.Reflection.ParameterInfo	V_2,
		class [mscorlib]System.Type	V_3,
		class [mscorlib]System.Type	V_4,
		int32	V_5,
		int32	V_6)
	IL_0000:  ldc.i4 1
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldlen 
	IL_001d:  conv.i4 
	IL_001e:  ldarg 1

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldlen 
	IL_0025:  conv.i4 
	IL_0026:  beq IL_0030

	IL_002b:  br IL_0148

	IL_0030:  ldc.i4 -1
	IL_0035:  stloc 5

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldarg 0

	IL_003f:  nop 
	IL_0040:  nop 
	IL_0041:  ldlen 
	IL_0042:  conv.i4 
	IL_0043:  ldc.i4 1
	IL_0048:  sub 
	IL_0049:  stloc 6

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldarg 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldlen 
	IL_0056:  conv.i4 
	IL_0057:  ldc.i4 0
	IL_005c:  beq IL_0066

	IL_0061:  br IL_007b

	IL_0066:  ldc.i4 1
	IL_006b:  stloc 0

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  br IL_0143

	IL_0076:  br IL_0080

	IL_007b:  br IL_0080

	IL_0080:  ldloc 5

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldc.i4 1
	IL_008b:  add 
	IL_008c:  stloc 5

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldarg 0

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldloc 5

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  conv.u 
	IL_009f:  ldelem [mscorlib]System.Reflection.ParameterInfo
	IL_00a4:  stloc 2

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldloc 2

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.ParameterInfo::get_ParameterType()
	IL_00b5:  stloc 3

	IL_00b9:  nop 
	IL_00ba:  nop 
	IL_00bb:  ldarg 1

	IL_00bf:  nop 
	IL_00c0:  nop 
	IL_00c1:  ldloc 1

	IL_00c5:  nop 
	IL_00c6:  nop 
	IL_00c7:  conv.u 
	IL_00c8:  ldelem [mscorlib]System.Type
	IL_00cd:  stloc 4

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  ldloc 3

	IL_00d7:  nop 
	IL_00d8:  nop 
	IL_00d9:  ldloc 4

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_00e4:  stloc 1

	IL_00e8:  nop 
	IL_00e9:  nop 
	IL_00ea:  ldloc 1

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  ldc.i4 0
	IL_00f5:  beq IL_00ff

	IL_00fa:  br IL_0114

	IL_00ff:  ldc.i4 0
	IL_0104:  stloc 0

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  br IL_0143

	IL_010f:  br IL_0119

	IL_0114:  br IL_0119

	IL_0119:  ldloc 5

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  ldloc 6

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  beq IL_012f

	IL_012a:  br IL_0139

	IL_012f:  br IL_0143

	IL_0134:  br IL_0143

	IL_0139:  br IL_0080

	IL_013e:  br IL_0143

	IL_0143:  br IL_0158

	IL_0148:  ldc.i4 0
	IL_014d:  stloc 0

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  br IL_0158

	IL_0158:  ldloc 0

	IL_015c:  nop 
	IL_015d:  nop 
	IL_015e:  ret 
    } // end of method Loader::CompareParamsToTyps

    // method line 116
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo LoadBinOp (class [mscorlib]System.Type typ, string name, class [mscorlib]System.Type typa, class [mscorlib]System.Type typb)  cil managed 
    {
        // Method begins at RVA 0xa458
	// Code size 425 (0x1a9)
	.maxstack 17
	.locals init (
		class [mscorlib]System.Type[]	V_0,
		int32	V_1,
		class [mscorlib]System.Reflection.MethodInfo	V_2,
		class [mscorlib]System.Reflection.MethodInfo[]	V_3,
		int32	V_4,
		bool	V_5,
		int32	V_6,
		string	V_7,
		class [mscorlib]System.Reflection.ParameterInfo[]	V_8)
	IL_0000:  ldc.i4 2
	IL_0005:  conv.u 
	IL_0006:  newarr [mscorlib]System.Type
	IL_000b:  stloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldc.i4 0
	IL_001c:  conv.u 
	IL_001d:  ldarg 2

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  stelem [mscorlib]System.Type
	IL_0028:  ldloc 0

	IL_002c:  nop 
	IL_002d:  nop 
	IL_002e:  ldc.i4 1
	IL_0033:  conv.u 
	IL_0034:  ldarg 3

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  stelem [mscorlib]System.Type
	IL_003f:  ldc.i4 -1
	IL_0044:  stloc 1

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldnull 
	IL_004b:  stloc 2

	IL_004f:  nop 
	IL_0050:  nop 
	IL_0051:  ldarg 0

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  call class [mscorlib]System.Reflection.MethodInfo[] class dylan.NET.Reflection.Loader::LoadSpecMtds(class [mscorlib]System.Type)
	IL_005c:  stloc 3

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldloc 3

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  ldlen 
	IL_0069:  conv.i4 
	IL_006a:  ldc.i4 1
	IL_006f:  sub 
	IL_0070:  stloc 4

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldc.i4 0
	IL_007b:  stloc 5

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldc.i4 0
	IL_0086:  stloc 6

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  ldloc 3

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldlen 
	IL_0093:  conv.i4 
	IL_0094:  ldc.i4 0
	IL_0099:  bgt IL_00a3

	IL_009e:  br IL_019d

	IL_00a3:  ldloc 1

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  ldc.i4 1
	IL_00ae:  add 
	IL_00af:  stloc 1

	IL_00b3:  nop 
	IL_00b4:  nop 
	IL_00b5:  ldloc 3

	IL_00b9:  nop 
	IL_00ba:  nop 
	IL_00bb:  ldloc 1

	IL_00bf:  nop 
	IL_00c0:  nop 
	IL_00c1:  conv.u 
	IL_00c2:  ldelem [mscorlib]System.Reflection.MethodInfo
	IL_00c7:  stloc 2

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 2

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  callvirt instance string class [mscorlib]System.Reflection.MemberInfo::get_Name()
	IL_00d8:  stloc 7

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  ldloc 7

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  ldarg 1

	IL_00e8:  nop 
	IL_00e9:  nop 
	IL_00ea:  call int32 string::Compare(string, string)
	IL_00ef:  stloc 6

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldloc 6

	IL_00f9:  nop 
	IL_00fa:  nop 
	IL_00fb:  ldc.i4 0
	IL_0100:  beq IL_010a

	IL_0105:  br IL_0162

	IL_010a:  ldloc 2

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  callvirt instance class [mscorlib]System.Reflection.ParameterInfo[] class [mscorlib]System.Reflection.MethodBase::GetParameters()
	IL_0115:  stloc 8

	IL_0119:  nop 
	IL_011a:  nop 
	IL_011b:  ldloc 8

	IL_011f:  nop 
	IL_0120:  nop 
	IL_0121:  ldloc 0

	IL_0125:  nop 
	IL_0126:  nop 
	IL_0127:  call bool class dylan.NET.Reflection.Loader::CompareParamsToTyps(class [mscorlib]System.Reflection.ParameterInfo[], class [mscorlib]System.Type[])
	IL_012c:  stloc 5

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldloc 5

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldc.i4 1
	IL_013d:  beq IL_0147

	IL_0142:  br IL_0151

	IL_0147:  br IL_0198

	IL_014c:  br IL_015d

	IL_0151:  ldnull 
	IL_0152:  stloc 2

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  br IL_015d

	IL_015d:  br IL_016e

	IL_0162:  ldnull 
	IL_0163:  stloc 2

	IL_0167:  nop 
	IL_0168:  nop 
	IL_0169:  br IL_016e

	IL_016e:  ldloc 1

	IL_0172:  nop 
	IL_0173:  nop 
	IL_0174:  ldloc 4

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  beq IL_0184

	IL_017f:  br IL_018e

	IL_0184:  br IL_0198

	IL_0189:  br IL_0198

	IL_018e:  br IL_00a3

	IL_0193:  br IL_0198

	IL_0198:  br IL_01a2

	IL_019d:  br IL_01a2

	IL_01a2:  ldloc 2

	IL_01a6:  nop 
	IL_01a7:  nop 
	IL_01a8:  ret 
    } // end of method Loader::LoadBinOp

    // method line 117
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo LoadConvOp (class [mscorlib]System.Type typ, string name, class [mscorlib]System.Type src, class [mscorlib]System.Type snk)  cil managed 
    {
        // Method begins at RVA 0xa610
	// Code size 480 (0x1e0)
	.maxstack 17
	.locals init (
		class [mscorlib]System.Type[]	V_0,
		int32	V_1,
		class [mscorlib]System.Reflection.MethodInfo	V_2,
		class [mscorlib]System.Reflection.MethodInfo[]	V_3,
		int32	V_4,
		bool	V_5,
		int32	V_6,
		string	V_7,
		class [mscorlib]System.Reflection.ParameterInfo[]	V_8,
		class [mscorlib]System.Type	V_9)
	IL_0000:  ldc.i4 1
	IL_0005:  conv.u 
	IL_0006:  newarr [mscorlib]System.Type
	IL_000b:  stloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldc.i4 0
	IL_001c:  conv.u 
	IL_001d:  ldarg 2

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  stelem [mscorlib]System.Type
	IL_0028:  ldc.i4 -1
	IL_002d:  stloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldnull 
	IL_0034:  stloc 2

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldarg 0

	IL_003e:  nop 
	IL_003f:  nop 
	IL_0040:  call class [mscorlib]System.Reflection.MethodInfo[] class dylan.NET.Reflection.Loader::LoadSpecMtds(class [mscorlib]System.Type)
	IL_0045:  stloc 3

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  ldloc 3

	IL_004f:  nop 
	IL_0050:  nop 
	IL_0051:  ldlen 
	IL_0052:  conv.i4 
	IL_0053:  ldc.i4 1
	IL_0058:  sub 
	IL_0059:  stloc 4

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldc.i4 0
	IL_0064:  stloc 5

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldc.i4 0
	IL_006f:  stloc 6

	IL_0073:  nop 
	IL_0074:  nop 
	IL_0075:  ldloc 3

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldlen 
	IL_007c:  conv.i4 
	IL_007d:  ldc.i4 0
	IL_0082:  bgt IL_008c

	IL_0087:  br IL_01d4

	IL_008c:  ldloc 1

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldc.i4 1
	IL_0097:  add 
	IL_0098:  stloc 1

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldloc 3

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldloc 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  conv.u 
	IL_00ab:  ldelem [mscorlib]System.Reflection.MethodInfo
	IL_00b0:  stloc 2

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  ldloc 2

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  callvirt instance string class [mscorlib]System.Reflection.MemberInfo::get_Name()
	IL_00c1:  stloc 7

	IL_00c5:  nop 
	IL_00c6:  nop 
	IL_00c7:  ldloc 7

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldarg 1

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  call int32 string::Compare(string, string)
	IL_00d8:  stloc 6

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  ldloc 6

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  ldc.i4 0
	IL_00e9:  beq IL_00f3

	IL_00ee:  br IL_0199

	IL_00f3:  ldloc 2

	IL_00f7:  nop 
	IL_00f8:  nop 
	IL_00f9:  callvirt instance class [mscorlib]System.Reflection.ParameterInfo[] class [mscorlib]System.Reflection.MethodBase::GetParameters()
	IL_00fe:  stloc 8

	IL_0102:  nop 
	IL_0103:  nop 
	IL_0104:  ldloc 8

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  ldloc 0

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  call bool class dylan.NET.Reflection.Loader::CompareParamsToTyps(class [mscorlib]System.Reflection.ParameterInfo[], class [mscorlib]System.Type[])
	IL_0115:  stloc 5

	IL_0119:  nop 
	IL_011a:  nop 
	IL_011b:  ldloc 5

	IL_011f:  nop 
	IL_0120:  nop 
	IL_0121:  ldc.i4 1
	IL_0126:  beq IL_0130

	IL_012b:  br IL_0188

	IL_0130:  ldloc 2

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_013b:  stloc 9

	IL_013f:  nop 
	IL_0140:  nop 
	IL_0141:  ldloc 9

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldarg 3

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0152:  stloc 5

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  ldloc 5

	IL_015c:  nop 
	IL_015d:  nop 
	IL_015e:  ldc.i4 1
	IL_0163:  beq IL_016d

	IL_0168:  br IL_0177

	IL_016d:  br IL_01cf

	IL_0172:  br IL_0183

	IL_0177:  ldnull 
	IL_0178:  stloc 2

	IL_017c:  nop 
	IL_017d:  nop 
	IL_017e:  br IL_0183

	IL_0183:  br IL_0194

	IL_0188:  ldnull 
	IL_0189:  stloc 2

	IL_018d:  nop 
	IL_018e:  nop 
	IL_018f:  br IL_0194

	IL_0194:  br IL_01a5

	IL_0199:  ldnull 
	IL_019a:  stloc 2

	IL_019e:  nop 
	IL_019f:  nop 
	IL_01a0:  br IL_01a5

	IL_01a5:  ldloc 1

	IL_01a9:  nop 
	IL_01aa:  nop 
	IL_01ab:  ldloc 4

	IL_01af:  nop 
	IL_01b0:  nop 
	IL_01b1:  beq IL_01bb

	IL_01b6:  br IL_01c5

	IL_01bb:  br IL_01cf

	IL_01c0:  br IL_01cf

	IL_01c5:  br IL_008c

	IL_01ca:  br IL_01cf

	IL_01cf:  br IL_01d9

	IL_01d4:  br IL_01d9

	IL_01d9:  ldloc 2

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  ret 
    } // end of method Loader::LoadConvOp

    // method line 118
    .method public static 
           default class [mscorlib]System.Reflection.FieldInfo LoadField (class [mscorlib]System.Type typ, string name)  cil managed 
    {
        // Method begins at RVA 0xa7fc
	// Code size 795 (0x31b)
	.maxstack 27
	.locals init (
		class [mscorlib]System.Type	V_0,
		class [mscorlib]System.Reflection.FieldInfo	V_1,
		valuetype [mscorlib]System.Reflection.BindingFlags	V_2,
		bool	V_3,
		bool	V_4,
		class [mscorlib]System.Reflection.Assembly	V_5,
		class [mscorlib]System.Reflection.AssemblyName	V_6,
		bool	V_7,
		bool	V_8,
		object	V_9,
		object	V_10)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldnull 
	IL_0008:  stloc 1

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldarg 0

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldarg 1

	IL_0018:  nop 
	IL_0019:  nop 
	IL_001a:  callvirt instance class [mscorlib]System.Reflection.FieldInfo class [mscorlib]System.Type::GetField(string)
	IL_001f:  stloc 1

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldc.i4 4
	IL_002a:  ldc.i4 8
	IL_002f:  or 
	IL_0030:  ldc.i4 16
	IL_0035:  or 
	IL_0036:  ldc.i4 32
	IL_003b:  or 
	IL_003c:  stloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 1

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldnull 
	IL_0049:  beq IL_0053

	IL_004e:  br IL_0240

	IL_0053:  ldarg 0

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  ldarg 1

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 2

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  callvirt instance class [mscorlib]System.Reflection.FieldInfo class [mscorlib]System.Type::GetField(string, valuetype [mscorlib]System.Reflection.BindingFlags)
	IL_006a:  stloc 1

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldloc 1

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldnull 
	IL_0077:  beq IL_0236

	IL_007c:  br IL_0081

	IL_0081:  ldc.i4 0
	IL_0086:  stloc 3

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  ldloc 1

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsPrivate()
	IL_0097:  stloc 3

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 3

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldc.i4 0
	IL_00a8:  beq IL_00b2

	IL_00ad:  br IL_0225

	IL_00b2:  ldarg 0

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  callvirt instance class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Type::get_Assembly()
	IL_00bd:  stloc 5

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldloc 5

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  callvirt instance class [mscorlib]System.Reflection.AssemblyName class [mscorlib]System.Reflection.Assembly::GetName()
	IL_00ce:  stloc 6

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  ldsfld class [mscorlib]System.Reflection.AssemblyName dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_00d9:  ldloc 6

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  call bool class [mscorlib]System.Reflection.AssemblyName::ReferenceMatchesDefinition(class [mscorlib]System.Reflection.AssemblyName, class [mscorlib]System.Reflection.AssemblyName)
	IL_00e4:  stloc 4

	IL_00e8:  nop 
	IL_00e9:  nop 
	IL_00ea:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_00ef:  ldloc 4

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  or 
	IL_00f6:  stloc 7

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_0101:  ldloc 4

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  and 
	IL_0108:  stloc 8

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldloc 1

	IL_0112:  nop 
	IL_0113:  nop 
	IL_0114:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsFamilyAndAssembly()
	IL_0119:  stloc 3

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  ldloc 3

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  ldloc 8

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  and 
	IL_012c:  stloc 3

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldloc 3

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldc.i4 0
	IL_013d:  beq IL_0147

	IL_0142:  br IL_021b

	IL_0147:  ldloc 1

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsFamilyOrAssembly()
	IL_0152:  stloc 3

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  ldloc 3

	IL_015c:  nop 
	IL_015d:  nop 
	IL_015e:  ldloc 7

	IL_0162:  nop 
	IL_0163:  nop 
	IL_0164:  and 
	IL_0165:  stloc 3

	IL_0169:  nop 
	IL_016a:  nop 
	IL_016b:  ldloc 3

	IL_016f:  nop 
	IL_0170:  nop 
	IL_0171:  ldc.i4 0
	IL_0176:  beq IL_0180

	IL_017b:  br IL_0211

	IL_0180:  ldloc 1

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsFamily()
	IL_018b:  stloc 3

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldloc 3

	IL_0195:  nop 
	IL_0196:  nop 
	IL_0197:  ldsfld bool dylan.NET.Reflection.Loader::ProtectedFlag
	IL_019c:  and 
	IL_019d:  stloc 3

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  ldloc 3

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldc.i4 0
	IL_01ae:  beq IL_01b8

	IL_01b3:  br IL_0207

	IL_01b8:  ldloc 1

	IL_01bc:  nop 
	IL_01bd:  nop 
	IL_01be:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsAssembly()
	IL_01c3:  stloc 3

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  ldloc 3

	IL_01cd:  nop 
	IL_01ce:  nop 
	IL_01cf:  ldloc 4

	IL_01d3:  nop 
	IL_01d4:  nop 
	IL_01d5:  and 
	IL_01d6:  stloc 3

	IL_01da:  nop 
	IL_01db:  nop 
	IL_01dc:  ldloc 3

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  ldc.i4 0
	IL_01e7:  beq IL_01f1

	IL_01ec:  br IL_01fd

	IL_01f1:  ldnull 
	IL_01f2:  stloc 1

	IL_01f6:  nop 
	IL_01f7:  nop 
	IL_01f8:  br IL_0202

	IL_01fd:  br IL_0202

	IL_0202:  br IL_020c

	IL_0207:  br IL_020c

	IL_020c:  br IL_0216

	IL_0211:  br IL_0216

	IL_0216:  br IL_0220

	IL_021b:  br IL_0220

	IL_0220:  br IL_0231

	IL_0225:  ldnull 
	IL_0226:  stloc 1

	IL_022a:  nop 
	IL_022b:  nop 
	IL_022c:  br IL_0231

	IL_0231:  br IL_023b

	IL_0236:  br IL_023b

	IL_023b:  br IL_0245

	IL_0240:  br IL_0245

	IL_0245:  ldloc 1

	IL_0249:  nop 
	IL_024a:  nop 
	IL_024b:  ldnull 
	IL_024c:  beq IL_030f

	IL_0251:  br IL_0256

	IL_0256:  ldloc 1

	IL_025a:  nop 
	IL_025b:  nop 
	IL_025c:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0261:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::MemberTyp
	IL_0266:  ldloc 1

	IL_026a:  nop 
	IL_026b:  nop 
	IL_026c:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsLiteral()
	IL_0271:  stsfld bool dylan.NET.Reflection.Loader::FldLitFlag
	IL_0276:  ldarg 0

	IL_027a:  nop 
	IL_027b:  nop 
	IL_027c:  callvirt instance bool class [mscorlib]System.Type::get_IsEnum()
	IL_0281:  stsfld bool dylan.NET.Reflection.Loader::EnumLitFlag
	IL_0286:  ldnull 
	IL_0287:  stloc 9

	IL_028b:  nop 
	IL_028c:  nop 
	IL_028d:  ldsfld bool dylan.NET.Reflection.Loader::FldLitFlag
	IL_0292:  ldc.i4 1
	IL_0297:  beq IL_02a1

	IL_029c:  br IL_02d7

	IL_02a1:  ldloc 1

	IL_02a5:  nop 
	IL_02a6:  nop 
	IL_02a7:  ldloc 9

	IL_02ab:  nop 
	IL_02ac:  nop 
	IL_02ad:  callvirt instance object class [mscorlib]System.Reflection.FieldInfo::GetValue(object)
	IL_02b2:  stsfld object dylan.NET.Reflection.Loader::FldLitVal
	IL_02b7:  ldsfld object dylan.NET.Reflection.Loader::FldLitVal
	IL_02bc:  stloc 10

	IL_02c0:  nop 
	IL_02c1:  nop 
	IL_02c2:  ldloc 10

	IL_02c6:  nop 
	IL_02c7:  nop 
	IL_02c8:  callvirt instance class [mscorlib]System.Type object::GetType()
	IL_02cd:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::FldLitTyp
	IL_02d2:  br IL_02dc

	IL_02d7:  br IL_02dc

	IL_02dc:  ldsfld bool dylan.NET.Reflection.Loader::EnumLitFlag
	IL_02e1:  ldc.i4 1
	IL_02e6:  beq IL_02f0

	IL_02eb:  br IL_0305

	IL_02f0:  ldarg 0

	IL_02f4:  nop 
	IL_02f5:  nop 
	IL_02f6:  call class [mscorlib]System.Type class [mscorlib]System.Enum::GetUnderlyingType(class [mscorlib]System.Type)
	IL_02fb:  stsfld class [mscorlib]System.Type dylan.NET.Reflection.Loader::EnumLitTyp
	IL_0300:  br IL_030a

	IL_0305:  br IL_030a

	IL_030a:  br IL_0314

	IL_030f:  br IL_0314

	IL_0314:  ldloc 1

	IL_0318:  nop 
	IL_0319:  nop 
	IL_031a:  ret 
    } // end of method Loader::LoadField

  } // end of class dylan.NET.Reflection.Loader
}

.namespace dylan.NET.Reflection
{
  .class public auto ansi beforefieldinit ConsolePrinter
  	extends [mscorlib]System.Object
  {
    .field  public static  class [mscorlib]System.IO.StringWriter SW

    // method line 119
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0xab24
	// Code size 7 (0x7)
	.maxstack 1
	IL_0000:  ldnull 
	IL_0001:  stsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0006:  ret 
    } // end of method ConsolePrinter::.cctor

    // method line 120
    .method public static 
           default void PrintString ()  cil managed 
    {
        // Method begins at RVA 0xab38
	// Code size 28 (0x1c)
	.maxstack 1
	.locals init (
		string	V_0)
	IL_0000:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0005:  callvirt instance string class [mscorlib]System.IO.StringWriter::ToString()
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_001b:  ret 
    } // end of method ConsolePrinter::PrintString

    // method line 121
    .method public static 
           default void WriteClass (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0xab60
	// Code size 800 (0x320)
	.maxstack 48
	.locals init (
		bool	V_0,
		bool	V_1,
		bool	V_2,
		bool	V_3,
		bool	V_4,
		bool	V_5,
		bool	V_6,
		bool	V_7,
		bool	V_8,
		bool	V_9,
		string	V_10,
		class [mscorlib]System.Type	V_11,
		string	V_12)
	IL_0000:  newobj instance void class [mscorlib]System.IO.StringWriter::'.ctor'()
	IL_0005:  stsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_000a:  ldarg 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  callvirt instance bool class [mscorlib]System.Type::get_IsAbstract()
	IL_0015:  stloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldarg 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  callvirt instance bool class [mscorlib]System.Type::get_IsAnsiClass()
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 0

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  callvirt instance bool class [mscorlib]System.Type::get_IsAutoClass()
	IL_0037:  stloc 2

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldarg 0

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::get_IsAutoLayout()
	IL_0048:  stloc 3

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldarg 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  callvirt instance bool class [mscorlib]System.Type::get_IsEnum()
	IL_0059:  stloc 4

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldarg 0

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  callvirt instance bool class [mscorlib]System.Type::get_IsInterface()
	IL_006a:  stloc 5

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldarg 0

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  callvirt instance bool class [mscorlib]System.Type::get_IsNestedPrivate()
	IL_007b:  stloc 6

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldarg 0

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  callvirt instance bool class [mscorlib]System.Type::get_IsNestedPublic()
	IL_008c:  stloc 7

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldarg 0

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  callvirt instance bool class [mscorlib]System.Type::get_IsNotPublic()
	IL_009d:  stloc 8

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldarg 0

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  callvirt instance bool class [mscorlib]System.Type::get_IsPublic()
	IL_00ae:  stloc 9

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldarg 0

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  callvirt instance string class [mscorlib]System.Reflection.MemberInfo::get_Name()
	IL_00bf:  stloc 10

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldarg 0

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::get_BaseType()
	IL_00d0:  stloc 11

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldloc 11

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  callvirt instance string class [mscorlib]System.Type::ToString()
	IL_00e1:  stloc 12

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ldloc 4

	IL_00eb:  nop 
	IL_00ec:  nop 
	IL_00ed:  ldc.i4 1
	IL_00f2:  beq IL_00fc

	IL_00f7:  br IL_0110

	IL_00fc:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0101:  ldstr "enum "
	IL_0106:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_010b:  br IL_0124

	IL_0110:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0115:  ldstr "class "
	IL_011a:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_011f:  br IL_0124

	IL_0124:  ldloc 9

	IL_0128:  nop 
	IL_0129:  nop 
	IL_012a:  ldc.i4 1
	IL_012f:  beq IL_0139

	IL_0134:  br IL_014d

	IL_0139:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_013e:  ldstr "public "
	IL_0143:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_0148:  br IL_0152

	IL_014d:  br IL_0152

	IL_0152:  ldloc 8

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  ldc.i4 1
	IL_015d:  beq IL_0167

	IL_0162:  br IL_017b

	IL_0167:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_016c:  ldstr "private "
	IL_0171:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_0176:  br IL_0180

	IL_017b:  br IL_0180

	IL_0180:  ldloc 7

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  ldc.i4 1
	IL_018b:  beq IL_0195

	IL_0190:  br IL_01a9

	IL_0195:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_019a:  ldstr "public "
	IL_019f:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_01a4:  br IL_01ae

	IL_01a9:  br IL_01ae

	IL_01ae:  ldloc 6

	IL_01b2:  nop 
	IL_01b3:  nop 
	IL_01b4:  ldc.i4 1
	IL_01b9:  beq IL_01c3

	IL_01be:  br IL_01d7

	IL_01c3:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_01c8:  ldstr "private "
	IL_01cd:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_01d2:  br IL_01dc

	IL_01d7:  br IL_01dc

	IL_01dc:  ldloc 0

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  ldc.i4 1
	IL_01e7:  beq IL_01f1

	IL_01ec:  br IL_0205

	IL_01f1:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_01f6:  ldstr "abstract "
	IL_01fb:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_0200:  br IL_020a

	IL_0205:  br IL_020a

	IL_020a:  ldloc 3

	IL_020e:  nop 
	IL_020f:  nop 
	IL_0210:  ldc.i4 1
	IL_0215:  beq IL_021f

	IL_021a:  br IL_0233

	IL_021f:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0224:  ldstr "auto "
	IL_0229:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_022e:  br IL_0238

	IL_0233:  br IL_0238

	IL_0238:  ldloc 2

	IL_023c:  nop 
	IL_023d:  nop 
	IL_023e:  ldc.i4 1
	IL_0243:  beq IL_024d

	IL_0248:  br IL_0261

	IL_024d:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0252:  ldstr "autochar "
	IL_0257:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_025c:  br IL_0266

	IL_0261:  br IL_0266

	IL_0266:  ldloc 1

	IL_026a:  nop 
	IL_026b:  nop 
	IL_026c:  ldc.i4 1
	IL_0271:  beq IL_027b

	IL_0276:  br IL_028f

	IL_027b:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0280:  ldstr "ansi "
	IL_0285:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_028a:  br IL_0294

	IL_028f:  br IL_0294

	IL_0294:  ldloc 2

	IL_0298:  nop 
	IL_0299:  nop 
	IL_029a:  ldc.i4 1
	IL_029f:  beq IL_02a9

	IL_02a4:  br IL_02bd

	IL_02a9:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_02ae:  ldstr "autochar "
	IL_02b3:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_02b8:  br IL_02c2

	IL_02bd:  br IL_02c2

	IL_02c2:  ldloc 5

	IL_02c6:  nop 
	IL_02c7:  nop 
	IL_02c8:  ldc.i4 1
	IL_02cd:  beq IL_02d7

	IL_02d2:  br IL_02eb

	IL_02d7:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_02dc:  ldstr "interface "
	IL_02e1:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_02e6:  br IL_02f0

	IL_02eb:  br IL_02f0

	IL_02f0:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_02f5:  ldloc 10

	IL_02f9:  nop 
	IL_02fa:  nop 
	IL_02fb:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_0300:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0305:  ldstr " extends "
	IL_030a:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_030f:  ldsfld class [mscorlib]System.IO.StringWriter dylan.NET.Reflection.ConsolePrinter::SW
	IL_0314:  ldloc 12

	IL_0318:  nop 
	IL_0319:  nop 
	IL_031a:  callvirt instance void class [mscorlib]System.IO.StringWriter::Write(string)
	IL_031f:  ret 
    } // end of method ConsolePrinter::WriteClass

  } // end of class dylan.NET.Reflection.ConsolePrinter
}

