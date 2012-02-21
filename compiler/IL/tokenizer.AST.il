.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly 'tokenizer.AST'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 37 00 00 ) // ...11.2.8.7..

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (
		01 00 0D 74 6F 6B 65 6E 69 7A 65 72 2E 41 53 54   // ...tokenizer.AST
		00 00                                           ) // ..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (
		01 00 0D 74 6F 6B 65 6E 69 7A 65 72 2E 41 53 54   // ...tokenizer.AST
		00 00                                           ) // ..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (
		01 00 0D 74 6F 6B 65 6E 69 7A 65 72 2E 41 53 54   // ...tokenizer.AST
		00 00                                           ) // ..

  .hash algorithm 0x00008004
  .ver  11:2:8:7
}

.module tokenizer.AST.dll // GUID = {9AC01BA2-7E7D-438F-BBA0-3529423E7D73}


.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi Token
  	extends [mscorlib]System.Object
  {
    .field  public  string Value
    .field  public  int32 Line

    // method line 1
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 29 (0x1d)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ret 
    } // end of method Token::.ctor

    // method line 2
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x207c
	// Code size 30 (0x1e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ret 
    } // end of method Token::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Token
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi Expr
  	extends [mscorlib]System.Object
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token[] Tokens
    .field  public  int32 Line
    .field  public  class [mscorlib]System.Type ResultTyp

    // method line 3
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x20a8
	// Code size 42 (0x2a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldnull 
	IL_0024:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Exprs.Expr::ResultTyp
	IL_0029:  ret 
    } // end of method Expr::.ctor

    // method line 4
    .method public 
           instance default void AddToken (class dylan.NET.Tokenizer.AST.Tokens.Token toktoadd)  cil managed 
    {
        // Method begins at RVA 0x20e0
	// Code size 327 (0x147)
	.maxstack 19
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Token[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Token
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

	IL_00f2:  ldloc 0

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldc.i4 0
	IL_00fd:  beq IL_0107

	IL_0102:  br IL_011d

	IL_0107:  ldarg.0 
	IL_0108:  ldarg 1

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0113:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0118:  br IL_0122

	IL_011d:  br IL_0122

	IL_0122:  ldloc 4

	IL_0126:  nop 
	IL_0127:  nop 
	IL_0128:  ldloc 0

	IL_012c:  nop 
	IL_012d:  nop 
	IL_012e:  conv.u 
	IL_012f:  ldarg 1

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  stelem dylan.NET.Tokenizer.AST.Tokens.Token
	IL_013a:  ldarg.0 
	IL_013b:  ldloc 4

	IL_013f:  nop 
	IL_0140:  nop 
	IL_0141:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0146:  ret 
    } // end of method Expr::AddToken

    // method line 5
    .method public 
           instance default void RemToken (int32 ind)  cil managed 
    {
        // Method begins at RVA 0x2234
	// Code size 310 (0x136)
	.maxstack 14
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.AST.Tokens.Token[]	V_5)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
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
	IL_0020:  ldloc 1

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  stloc 2

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldc.i4 -1
	IL_0031:  stloc 3

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldc.i4 -1
	IL_003c:  stloc 4

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 1

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  conv.u 
	IL_0049:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_004e:  stloc 5

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldloc 3

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  ldc.i4 1
	IL_005f:  add 
	IL_0060:  stloc 3

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldloc 0

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldc.i4 0
	IL_0071:  bgt IL_007b

	IL_0076:  br IL_00d6

	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldarg 1

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  beq IL_00cc

	IL_008c:  br IL_0091

	IL_0091:  ldloc 4

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldc.i4 1
	IL_009c:  add 
	IL_009d:  stloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldloc 5

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  ldloc 4

	IL_00ad:  nop 
	IL_00ae:  nop 
	IL_00af:  conv.u 
	IL_00b0:  ldarg.0 
	IL_00b1:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00b6:  ldloc 3

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  conv.u 
	IL_00bd:  ldelem dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00c2:  stelem dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00c7:  br IL_00d1

	IL_00cc:  br IL_00d1

	IL_00d1:  br IL_00db

	IL_00d6:  br IL_00db

	IL_00db:  ldloc 3

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  ldloc 2

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  beq IL_00f1

	IL_00ec:  br IL_00fb

	IL_00f1:  br IL_0129

	IL_00f6:  br IL_0129

	IL_00fb:  ldloc 2

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ldc.i4 -1
	IL_0106:  beq IL_011a

	IL_010b:  br IL_0110

	IL_0110:  br IL_0054

	IL_0115:  br IL_0124

	IL_011a:  br IL_0129

	IL_011f:  br IL_0124

	IL_0124:  br IL_0129

	IL_0129:  ldarg.0 
	IL_012a:  ldloc 5

	IL_012e:  nop 
	IL_012f:  nop 
	IL_0130:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0135:  ret 
    } // end of method Expr::RemToken

  } // end of class dylan.NET.Tokenizer.AST.Exprs.Expr
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi Stmt
  	extends [mscorlib]System.Object
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token[] Tokens
    .field  public  int32 Line

    // method line 6
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2378
	// Code size 35 (0x23)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ret 
    } // end of method Stmt::.ctor

    // method line 7
    .method public 
           instance default void AddToken (class dylan.NET.Tokenizer.AST.Tokens.Token toktoadd)  cil managed 
    {
        // Method begins at RVA 0x23a8
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Token[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Token
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.Token
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0116:  ret 
    } // end of method Stmt::AddToken

  } // end of class dylan.NET.Tokenizer.AST.Stmts.Stmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi StmtSet
  	extends [mscorlib]System.Object
  {
    .field  public  class dylan.NET.Tokenizer.AST.Stmts.Stmt[] Stmts

    // method line 8
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x24cc
	// Code size 24 (0x18)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Stmts.Stmt[] dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_0017:  ret 
    } // end of method StmtSet::.ctor

    // method line 9
    .method public 
           instance default void AddStmt (class dylan.NET.Tokenizer.AST.Stmts.Stmt stmttoadd)  cil managed 
    {
        // Method begins at RVA 0x24f0
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Stmts.Stmt[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Stmts.Stmt[] dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Stmts.Stmt
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Stmts.Stmt[] dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Stmts.Stmt
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Stmts.Stmt[] dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_0116:  ret 
    } // end of method StmtSet::AddStmt

  } // end of class dylan.NET.Tokenizer.AST.Stmts.StmtSet
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi Op
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  int32 PrecNo
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token LChild
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token RChild

    // method line 10
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2614
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method Op::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.Op
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi AssignOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.Op
  {

    // method line 11
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2640
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.Op::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 1
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method AssignOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.AssignOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi AritOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.Op
  {

    // method line 12
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x266c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.Op::'.ctor'()
	IL_0006:  ret 
    } // end of method AritOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi AddOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 13
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2680
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 11
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method AddOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.AddOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi MulOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 14
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x26ac
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 12
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method MulOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.MulOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi SubOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 15
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x26d8
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 11
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method SubOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.SubOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi DivOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 16
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2704
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 12
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method DivOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.DivOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi ModOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 17
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2730
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 12
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method ModOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.ModOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi IncOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 18
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x275c
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 13
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method IncOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.IncOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi DecOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 19
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2788
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 13
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method DecOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.DecOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi ShlOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 20
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x27b4
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 10
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method ShlOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.ShlOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi ShrOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp
  {

    // method line 21
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x27e0
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.AritOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 10
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method ShrOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.ShrOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi LogicalOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.Op
  {

    // method line 22
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x280c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.Op::'.ctor'()
	IL_0006:  ret 
    } // end of method LogicalOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi AndOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 23
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2820
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 7
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method AndOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.AndOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi OrOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 24
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x284c
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 5
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method OrOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.OrOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi NandOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 25
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2878
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 7
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method NandOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.NandOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi NorOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 26
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x28a4
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 5
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method NorOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.NorOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi XorOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 27
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x28d0
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 6
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method XorOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.XorOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi XnorOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 28
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x28fc
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 6
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method XnorOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.XnorOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi NotOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 29
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2928
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 13
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method NotOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.NotOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi NegOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp
  {

    // method line 30
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2954
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.LogicalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 13
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method NegOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.NegOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi TypeTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  bool IsArray
    .field  public  bool IsByRef
    .field  public  class [mscorlib]System.Type RefTyp
    .field  public  string OrdOp

    // method line 31
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2980
	// Code size 69 (0x45)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldnull 
	IL_0034:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0039:  ldarg.0 
	IL_003a:  ldstr ""
	IL_003f:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_0044:  ret 
    } // end of method TypeTok::.ctor

    // method line 32
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x29d4
	// Code size 70 (0x46)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldnull 
	IL_0035:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_003a:  ldarg.0 
	IL_003b:  ldstr ""
	IL_0040:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_0045:  ret 
    } // end of method TypeTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi GenericTypeTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[] Params

    // method line 33
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2a28
	// Code size 86 (0x56)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldnull 
	IL_0034:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0039:  ldarg.0 
	IL_003a:  ldstr ""
	IL_003f:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_0044:  ldarg.0 
	IL_0045:  ldc.i4 0
	IL_004a:  conv.u 
	IL_004b:  newarr dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0050:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[] dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok::Params
	IL_0055:  ret 
    } // end of method GenericTypeTok::.ctor

    // method line 34
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x2a8c
	// Code size 87 (0x57)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldnull 
	IL_0035:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_003a:  ldarg.0 
	IL_003b:  ldstr ""
	IL_0040:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_0045:  ldarg.0 
	IL_0046:  ldc.i4 0
	IL_004b:  conv.u 
	IL_004c:  newarr dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0051:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[] dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok::Params
	IL_0056:  ret 
    } // end of method GenericTypeTok::.ctor

    // method line 35
    .method public static 
           default void AddParam (class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok param)  cil managed 
    {
        // Method begins at RVA 0x2af0
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[] dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok::Params
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[] dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok::Params
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
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
	IL_00ff:  ldarg 0

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[] dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok::Params
	IL_0116:  ret 
    } // end of method GenericTypeTok::AddParam

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi StringTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 36
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2c14
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.String
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method StringTok::.ctor

    // method line 37
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x2c70
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.String
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method StringTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi IntegerTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 38
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2ccc
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Int32
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method IntegerTok::.ctor

    // method line 39
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x2d28
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Int32
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method IntegerTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi DoubleTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 40
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2d84
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Double
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method DoubleTok::.ctor

    // method line 41
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x2de0
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Double
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method DoubleTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi BooleanTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 42
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2e3c
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Boolean
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method BooleanTok::.ctor

    // method line 43
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x2e98
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Boolean
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method BooleanTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi CharTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 44
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2ef4
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Char
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method CharTok::.ctor

    // method line 45
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x2f50
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Char
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method CharTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi DecimalTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 46
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2fac
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Decimal
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method DecimalTok::.ctor

    // method line 47
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3008
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Decimal
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method DecimalTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi LongTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 48
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3064
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Int64
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method LongTok::.ctor

    // method line 49
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x30c0
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Int64
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method LongTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi SByteTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 50
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x311c
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.SByte
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method SByteTok::.ctor

    // method line 51
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3178
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.SByte
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method SByteTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi ShortTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 52
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x31d4
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Int16
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method ShortTok::.ctor

    // method line 53
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3230
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Int16
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method ShortTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi SingleTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 54
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x328c
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Single
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method SingleTok::.ctor

    // method line 55
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x32e8
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Single
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method SingleTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi ObjectTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 56
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3344
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Object
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method ObjectTok::.ctor

    // method line 57
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x33a0
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Object
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method ObjectTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi VoidTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 58
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x33fc
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Void
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method VoidTok::.ctor

    // method line 59
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3458
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Void
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method VoidTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi UIntegerTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 60
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x34b4
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.UInt32
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method UIntegerTok::.ctor

    // method line 61
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3510
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.UInt32
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method UIntegerTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi ULongTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 62
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x356c
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.UInt64
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method ULongTok::.ctor

    // method line 63
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x35c8
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.UInt64
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method ULongTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi ByteTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 64
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3624
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.Byte
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method ByteTok::.ctor

    // method line 65
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3680
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.Byte
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method ByteTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi UShortTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 66
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x36dc
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.UInt16
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method UShortTok::.ctor

    // method line 67
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3738
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.UInt16
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method UShortTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.TypeToks
{
  .class public auto ansi IntPtrTok
  	extends dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
  {

    // method line 68
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3794
	// Code size 78 (0x4e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0032:  ldarg.0 
	IL_0033:  ldtoken [mscorlib]System.IntPtr
	IL_0038:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003d:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004d:  ret 
    } // end of method IntPtrTok::.ctor

    // method line 69
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x37f0
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0033:  ldarg.0 
	IL_0034:  ldtoken [mscorlib]System.IntPtr
	IL_0039:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_003e:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldstr ""
	IL_0049:  stfld string dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::OrdOp
	IL_004e:  ret 
    } // end of method IntPtrTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi Literal
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok LitTyp
    .field  public  bool Conv
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok TTok

    // method line 70
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x384c
	// Code size 54 (0x36)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldnull 
	IL_001e:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0023:  ldarg.0 
	IL_0024:  ldc.i4 0
	IL_0029:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_002e:  ldarg.0 
	IL_002f:  ldnull 
	IL_0030:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0035:  ret 
    } // end of method Literal::.ctor

    // method line 71
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3890
	// Code size 55 (0x37)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldnull 
	IL_001f:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0024:  ldarg.0 
	IL_0025:  ldc.i4 0
	IL_002a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_002f:  ldarg.0 
	IL_0030:  ldnull 
	IL_0031:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0036:  ret 
    } // end of method Literal::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi NullLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
  {
    .field  public  object NullVal

    // method line 72
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x38d4
	// Code size 65 (0x41)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldnull 
	IL_001e:  stfld object dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::NullVal
	IL_0023:  ldarg.0 
	IL_0024:  ldc.i4 0
	IL_0029:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_002e:  ldarg.0 
	IL_002f:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_0034:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0039:  ldarg.0 
	IL_003a:  ldnull 
	IL_003b:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0040:  ret 
    } // end of method NullLiteral::.ctor

    // method line 73
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3924
	// Code size 66 (0x42)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldnull 
	IL_001f:  stfld object dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::NullVal
	IL_0024:  ldarg.0 
	IL_0025:  ldc.i4 0
	IL_002a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_002f:  ldarg.0 
	IL_0030:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_0035:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003a:  ldarg.0 
	IL_003b:  ldnull 
	IL_003c:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0041:  ret 
    } // end of method NullLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi ConstLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
  {
    .field  public  object ConstVal
    .field  public  class [mscorlib]System.Type ExtTyp
    .field  public  class [mscorlib]System.Type IntTyp

    // method line 74
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3974
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldnull 
	IL_001e:  stfld object dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ConstVal
	IL_0023:  ldarg.0 
	IL_0024:  ldc.i4 0
	IL_0029:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_002e:  ldarg.0 
	IL_002f:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_0034:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0039:  ldarg.0 
	IL_003a:  ldnull 
	IL_003b:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0040:  ldarg.0 
	IL_0041:  ldnull 
	IL_0042:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ExtTyp
	IL_0047:  ldarg.0 
	IL_0048:  ldnull 
	IL_0049:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_004e:  ret 
    } // end of method ConstLiteral::.ctor

    // method line 75
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x39d0
	// Code size 80 (0x50)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldnull 
	IL_001f:  stfld object dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ConstVal
	IL_0024:  ldarg.0 
	IL_0025:  ldc.i4 0
	IL_002a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_002f:  ldarg.0 
	IL_0030:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_0035:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003a:  ldarg.0 
	IL_003b:  ldnull 
	IL_003c:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0041:  ldarg.0 
	IL_0042:  ldnull 
	IL_0043:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ExtTyp
	IL_0048:  ldarg.0 
	IL_0049:  ldnull 
	IL_004a:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_004f:  ret 
    } // end of method ConstLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi StringLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
  {
    .field  public  string OrdOp
    .field  public  bool MemberAccessFlg
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token MemberToAccess

    // method line 76
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3a2c
	// Code size 91 (0x5b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0027:  ldarg.0 
	IL_0028:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok::'.ctor'()
	IL_002d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0032:  ldarg.0 
	IL_0033:  ldnull 
	IL_0034:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0039:  ldarg.0 
	IL_003a:  ldstr ""
	IL_003f:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::OrdOp
	IL_0044:  ldarg.0 
	IL_0045:  ldc.i4 0
	IL_004a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_004f:  ldarg.0 
	IL_0050:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0055:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_005a:  ret 
    } // end of method StringLiteral::.ctor

    // method line 77
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3a94
	// Code size 92 (0x5c)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0028:  ldarg.0 
	IL_0029:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok::'.ctor'()
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0033:  ldarg.0 
	IL_0034:  ldnull 
	IL_0035:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_003a:  ldarg.0 
	IL_003b:  ldstr ""
	IL_0040:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::OrdOp
	IL_0045:  ldarg.0 
	IL_0046:  ldc.i4 0
	IL_004b:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_0050:  ldarg.0 
	IL_0051:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0056:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_005b:  ret 
    } // end of method StringLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi CharLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
  {
    .field  public  char CharVal
    .field  public  string OrdOp

    // method line 78
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3afc
	// Code size 85 (0x55)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldstr "a"
	IL_0022:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0027:  stfld char dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_002c:  ldarg.0 
	IL_002d:  ldc.i4 0
	IL_0032:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0037:  ldarg.0 
	IL_0038:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok::'.ctor'()
	IL_003d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldnull 
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0049:  ldarg.0 
	IL_004a:  ldstr ""
	IL_004f:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::OrdOp
	IL_0054:  ret 
    } // end of method CharLiteral::.ctor

    // method line 79
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3b60
	// Code size 86 (0x56)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldstr "a"
	IL_0023:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0028:  stfld char dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_002d:  ldarg.0 
	IL_002e:  ldc.i4 0
	IL_0033:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0038:  ldarg.0 
	IL_0039:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok::'.ctor'()
	IL_003e:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldnull 
	IL_0045:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_004a:  ldarg.0 
	IL_004b:  ldstr ""
	IL_0050:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::OrdOp
	IL_0055:  ret 
    } // end of method CharLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi BooleanLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
  {
    .field  public  bool BoolVal
    .field  public  string OrdOp
    .field  public  bool DoNot

    // method line 80
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3bc4
	// Code size 91 (0x5b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0032:  ldarg.0 
	IL_0033:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok::'.ctor'()
	IL_0038:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003d:  ldarg.0 
	IL_003e:  ldnull 
	IL_003f:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0044:  ldarg.0 
	IL_0045:  ldstr ""
	IL_004a:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::OrdOp
	IL_004f:  ldarg.0 
	IL_0050:  ldc.i4 0
	IL_0055:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::DoNot
	IL_005a:  ret 
    } // end of method BooleanLiteral::.ctor

    // method line 81
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3c2c
	// Code size 92 (0x5c)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003e:  ldarg.0 
	IL_003f:  ldnull 
	IL_0040:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0045:  ldarg.0 
	IL_0046:  ldstr ""
	IL_004b:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::OrdOp
	IL_0050:  ldarg.0 
	IL_0051:  ldc.i4 0
	IL_0056:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::DoNot
	IL_005b:  ret 
    } // end of method BooleanLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi NumberLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
  {
    .field  public  string OrdOp
    .field  public  bool DoNot
    .field  public  bool DoNeg

    // method line 82
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3c94
	// Code size 87 (0x57)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0027:  ldarg.0 
	IL_0028:  ldnull 
	IL_0029:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_002e:  ldarg.0 
	IL_002f:  ldnull 
	IL_0030:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0035:  ldarg.0 
	IL_0036:  ldstr ""
	IL_003b:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0040:  ldarg.0 
	IL_0041:  ldc.i4 0
	IL_0046:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_004b:  ldarg.0 
	IL_004c:  ldc.i4 0
	IL_0051:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0056:  ret 
    } // end of method NumberLiteral::.ctor

    // method line 83
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3cf8
	// Code size 88 (0x58)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0028:  ldarg.0 
	IL_0029:  ldnull 
	IL_002a:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_002f:  ldarg.0 
	IL_0030:  ldnull 
	IL_0031:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0036:  ldarg.0 
	IL_0037:  ldstr ""
	IL_003c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0041:  ldarg.0 
	IL_0042:  ldc.i4 0
	IL_0047:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_004c:  ldarg.0 
	IL_004d:  ldc.i4 0
	IL_0052:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0057:  ret 
    } // end of method NumberLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi IntLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  int32 NumVal

    // method line 84
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3d5c
	// Code size 102 (0x66)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0032:  ldarg.0 
	IL_0033:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok::'.ctor'()
	IL_0038:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003d:  ldarg.0 
	IL_003e:  ldnull 
	IL_003f:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0044:  ldarg.0 
	IL_0045:  ldstr ""
	IL_004a:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_004f:  ldarg.0 
	IL_0050:  ldc.i4 0
	IL_0055:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005a:  ldarg.0 
	IL_005b:  ldc.i4 0
	IL_0060:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0065:  ret 
    } // end of method IntLiteral::.ctor

    // method line 85
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3dd0
	// Code size 103 (0x67)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003e:  ldarg.0 
	IL_003f:  ldnull 
	IL_0040:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0045:  ldarg.0 
	IL_0046:  ldstr ""
	IL_004b:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0050:  ldarg.0 
	IL_0051:  ldc.i4 0
	IL_0056:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005b:  ldarg.0 
	IL_005c:  ldc.i4 0
	IL_0061:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0066:  ret 
    } // end of method IntLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi DoubleLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  float64 NumVal

    // method line 86
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3e44
	// Code size 106 (0x6a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.r8 0.
	IL_0026:  stfld float64 dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_002b:  ldarg.0 
	IL_002c:  ldc.i4 0
	IL_0031:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0036:  ldarg.0 
	IL_0037:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok::'.ctor'()
	IL_003c:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0041:  ldarg.0 
	IL_0042:  ldnull 
	IL_0043:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0048:  ldarg.0 
	IL_0049:  ldstr ""
	IL_004e:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0053:  ldarg.0 
	IL_0054:  ldc.i4 0
	IL_0059:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005e:  ldarg.0 
	IL_005f:  ldc.i4 0
	IL_0064:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0069:  ret 
    } // end of method DoubleLiteral::.ctor

    // method line 87
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3ebc
	// Code size 107 (0x6b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.r8 0.
	IL_0027:  stfld float64 dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_002c:  ldarg.0 
	IL_002d:  ldc.i4 0
	IL_0032:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0037:  ldarg.0 
	IL_0038:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok::'.ctor'()
	IL_003d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldnull 
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0049:  ldarg.0 
	IL_004a:  ldstr ""
	IL_004f:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0054:  ldarg.0 
	IL_0055:  ldc.i4 0
	IL_005a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005f:  ldarg.0 
	IL_0060:  ldc.i4 0
	IL_0065:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006a:  ret 
    } // end of method DoubleLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi SByteLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  int8 NumVal

    // method line 88
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x3f34
	// Code size 99 (0x63)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4.s 0x00
	IL_001f:  stfld int8 dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_0024:  ldarg.0 
	IL_0025:  ldc.i4 0
	IL_002a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_002f:  ldarg.0 
	IL_0030:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok::'.ctor'()
	IL_0035:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003a:  ldarg.0 
	IL_003b:  ldnull 
	IL_003c:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0041:  ldarg.0 
	IL_0042:  ldstr ""
	IL_0047:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_004c:  ldarg.0 
	IL_004d:  ldc.i4 0
	IL_0052:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0057:  ldarg.0 
	IL_0058:  ldc.i4 0
	IL_005d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0062:  ret 
    } // end of method SByteLiteral::.ctor

    // method line 89
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x3fa4
	// Code size 100 (0x64)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4.s 0x00
	IL_0020:  stfld int8 dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_0025:  ldarg.0 
	IL_0026:  ldc.i4 0
	IL_002b:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0030:  ldarg.0 
	IL_0031:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok::'.ctor'()
	IL_0036:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003b:  ldarg.0 
	IL_003c:  ldnull 
	IL_003d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0042:  ldarg.0 
	IL_0043:  ldstr ""
	IL_0048:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_004d:  ldarg.0 
	IL_004e:  ldc.i4 0
	IL_0053:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0058:  ldarg.0 
	IL_0059:  ldc.i4 0
	IL_005e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0063:  ret 
    } // end of method SByteLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi ShortLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  int16 NumVal

    // method line 90
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4014
	// Code size 102 (0x66)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld int16 dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0032:  ldarg.0 
	IL_0033:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok::'.ctor'()
	IL_0038:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003d:  ldarg.0 
	IL_003e:  ldnull 
	IL_003f:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0044:  ldarg.0 
	IL_0045:  ldstr ""
	IL_004a:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_004f:  ldarg.0 
	IL_0050:  ldc.i4 0
	IL_0055:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005a:  ldarg.0 
	IL_005b:  ldc.i4 0
	IL_0060:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0065:  ret 
    } // end of method ShortLiteral::.ctor

    // method line 91
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x4088
	// Code size 103 (0x67)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld int16 dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003e:  ldarg.0 
	IL_003f:  ldnull 
	IL_0040:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0045:  ldarg.0 
	IL_0046:  ldstr ""
	IL_004b:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0050:  ldarg.0 
	IL_0051:  ldc.i4 0
	IL_0056:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005b:  ldarg.0 
	IL_005c:  ldc.i4 0
	IL_0061:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0066:  ret 
    } // end of method ShortLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi LongLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  int64 NumVal

    // method line 92
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x40fc
	// Code size 106 (0x6a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i8 0x0
	IL_0026:  stfld int64 dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_002b:  ldarg.0 
	IL_002c:  ldc.i4 0
	IL_0031:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0036:  ldarg.0 
	IL_0037:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok::'.ctor'()
	IL_003c:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0041:  ldarg.0 
	IL_0042:  ldnull 
	IL_0043:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0048:  ldarg.0 
	IL_0049:  ldstr ""
	IL_004e:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0053:  ldarg.0 
	IL_0054:  ldc.i4 0
	IL_0059:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005e:  ldarg.0 
	IL_005f:  ldc.i4 0
	IL_0064:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0069:  ret 
    } // end of method LongLiteral::.ctor

    // method line 93
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x4174
	// Code size 107 (0x6b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i8 0x0
	IL_0027:  stfld int64 dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_002c:  ldarg.0 
	IL_002d:  ldc.i4 0
	IL_0032:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0037:  ldarg.0 
	IL_0038:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok::'.ctor'()
	IL_003d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldnull 
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0049:  ldarg.0 
	IL_004a:  ldstr ""
	IL_004f:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0054:  ldarg.0 
	IL_0055:  ldc.i4 0
	IL_005a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005f:  ldarg.0 
	IL_0060:  ldc.i4 0
	IL_0065:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006a:  ret 
    } // end of method LongLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi FloatLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  float32 NumVal

    // method line 94
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x41ec
	// Code size 102 (0x66)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.r4 0.
	IL_0022:  stfld float32 dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0032:  ldarg.0 
	IL_0033:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok::'.ctor'()
	IL_0038:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003d:  ldarg.0 
	IL_003e:  ldnull 
	IL_003f:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0044:  ldarg.0 
	IL_0045:  ldstr ""
	IL_004a:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_004f:  ldarg.0 
	IL_0050:  ldc.i4 0
	IL_0055:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005a:  ldarg.0 
	IL_005b:  ldc.i4 0
	IL_0060:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0065:  ret 
    } // end of method FloatLiteral::.ctor

    // method line 95
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x4260
	// Code size 103 (0x67)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.r4 0.
	IL_0023:  stfld float32 dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003e:  ldarg.0 
	IL_003f:  ldnull 
	IL_0040:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0045:  ldarg.0 
	IL_0046:  ldstr ""
	IL_004b:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0050:  ldarg.0 
	IL_0051:  ldc.i4 0
	IL_0056:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005b:  ldarg.0 
	IL_005c:  ldc.i4 0
	IL_0061:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0066:  ret 
    } // end of method FloatLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi UIntLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  unsigned int32 NumVal

    // method line 96
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x42d4
	// Code size 107 (0x6b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  call unsigned int32 class [mscorlib]System.Convert::ToUInt32(int32)
	IL_0027:  stfld unsigned int32 dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::NumVal
	IL_002c:  ldarg.0 
	IL_002d:  ldc.i4 0
	IL_0032:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0037:  ldarg.0 
	IL_0038:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok::'.ctor'()
	IL_003d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldnull 
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0049:  ldarg.0 
	IL_004a:  ldstr ""
	IL_004f:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0054:  ldarg.0 
	IL_0055:  ldc.i4 0
	IL_005a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005f:  ldarg.0 
	IL_0060:  ldc.i4 0
	IL_0065:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006a:  ret 
    } // end of method UIntLiteral::.ctor

    // method line 97
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x434c
	// Code size 108 (0x6c)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  call unsigned int32 class [mscorlib]System.Convert::ToUInt32(int32)
	IL_0028:  stfld unsigned int32 dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::NumVal
	IL_002d:  ldarg.0 
	IL_002e:  ldc.i4 0
	IL_0033:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0038:  ldarg.0 
	IL_0039:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok::'.ctor'()
	IL_003e:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldnull 
	IL_0045:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_004a:  ldarg.0 
	IL_004b:  ldstr ""
	IL_0050:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0055:  ldarg.0 
	IL_0056:  ldc.i4 0
	IL_005b:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0060:  ldarg.0 
	IL_0061:  ldc.i4 0
	IL_0066:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006b:  ret 
    } // end of method UIntLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi ByteLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  unsigned int8 NumVal

    // method line 98
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x43c4
	// Code size 104 (0x68)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4.s 0x00
	IL_001f:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int8)
	IL_0024:  stfld unsigned int8 dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::NumVal
	IL_0029:  ldarg.0 
	IL_002a:  ldc.i4 0
	IL_002f:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0034:  ldarg.0 
	IL_0035:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok::'.ctor'()
	IL_003a:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_003f:  ldarg.0 
	IL_0040:  ldnull 
	IL_0041:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0046:  ldarg.0 
	IL_0047:  ldstr ""
	IL_004c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0051:  ldarg.0 
	IL_0052:  ldc.i4 0
	IL_0057:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005c:  ldarg.0 
	IL_005d:  ldc.i4 0
	IL_0062:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0067:  ret 
    } // end of method ByteLiteral::.ctor

    // method line 99
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x4438
	// Code size 105 (0x69)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4.s 0x00
	IL_0020:  call unsigned int8 class [mscorlib]System.Convert::ToByte(int8)
	IL_0025:  stfld unsigned int8 dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::NumVal
	IL_002a:  ldarg.0 
	IL_002b:  ldc.i4 0
	IL_0030:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0035:  ldarg.0 
	IL_0036:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok::'.ctor'()
	IL_003b:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0040:  ldarg.0 
	IL_0041:  ldnull 
	IL_0042:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0047:  ldarg.0 
	IL_0048:  ldstr ""
	IL_004d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0052:  ldarg.0 
	IL_0053:  ldc.i4 0
	IL_0058:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005d:  ldarg.0 
	IL_005e:  ldc.i4 0
	IL_0063:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0068:  ret 
    } // end of method ByteLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi UShortLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  unsigned int16 NumVal

    // method line 100
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x44b0
	// Code size 107 (0x6b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  call unsigned int16 class [mscorlib]System.Convert::ToUInt16(int16)
	IL_0027:  stfld unsigned int16 dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::NumVal
	IL_002c:  ldarg.0 
	IL_002d:  ldc.i4 0
	IL_0032:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0037:  ldarg.0 
	IL_0038:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok::'.ctor'()
	IL_003d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldnull 
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0049:  ldarg.0 
	IL_004a:  ldstr ""
	IL_004f:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0054:  ldarg.0 
	IL_0055:  ldc.i4 0
	IL_005a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005f:  ldarg.0 
	IL_0060:  ldc.i4 0
	IL_0065:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006a:  ret 
    } // end of method UShortLiteral::.ctor

    // method line 101
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x4528
	// Code size 108 (0x6c)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  call unsigned int16 class [mscorlib]System.Convert::ToUInt16(int16)
	IL_0028:  stfld unsigned int16 dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::NumVal
	IL_002d:  ldarg.0 
	IL_002e:  ldc.i4 0
	IL_0033:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0038:  ldarg.0 
	IL_0039:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok::'.ctor'()
	IL_003e:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldnull 
	IL_0045:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_004a:  ldarg.0 
	IL_004b:  ldstr ""
	IL_0050:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0055:  ldarg.0 
	IL_0056:  ldc.i4 0
	IL_005b:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0060:  ldarg.0 
	IL_0061:  ldc.i4 0
	IL_0066:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006b:  ret 
    } // end of method UShortLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi ULongLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  unsigned int64 NumVal

    // method line 102
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x45a0
	// Code size 111 (0x6f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i8 0x0
	IL_0026:  call unsigned int64 class [mscorlib]System.Convert::ToUInt64(int64)
	IL_002b:  stfld unsigned int64 dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::NumVal
	IL_0030:  ldarg.0 
	IL_0031:  ldc.i4 0
	IL_0036:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_003b:  ldarg.0 
	IL_003c:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok::'.ctor'()
	IL_0041:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0046:  ldarg.0 
	IL_0047:  ldnull 
	IL_0048:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_004d:  ldarg.0 
	IL_004e:  ldstr ""
	IL_0053:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0058:  ldarg.0 
	IL_0059:  ldc.i4 0
	IL_005e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0063:  ldarg.0 
	IL_0064:  ldc.i4 0
	IL_0069:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006e:  ret 
    } // end of method ULongLiteral::.ctor

    // method line 103
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x461c
	// Code size 112 (0x70)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i8 0x0
	IL_0027:  call unsigned int64 class [mscorlib]System.Convert::ToUInt64(int64)
	IL_002c:  stfld unsigned int64 dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::NumVal
	IL_0031:  ldarg.0 
	IL_0032:  ldc.i4 0
	IL_0037:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_003c:  ldarg.0 
	IL_003d:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok::'.ctor'()
	IL_0042:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0047:  ldarg.0 
	IL_0048:  ldnull 
	IL_0049:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_004e:  ldarg.0 
	IL_004f:  ldstr ""
	IL_0054:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0059:  ldarg.0 
	IL_005a:  ldc.i4 0
	IL_005f:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0064:  ldarg.0 
	IL_0065:  ldc.i4 0
	IL_006a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006f:  ret 
    } // end of method ULongLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Literals
{
  .class public auto ansi IntPtrLiteral
  	extends dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
  {
    .field  public  native int NumVal

    // method line 104
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4698
	// Code size 107 (0x6b)
	.maxstack 5
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  newobj instance void native int::'.ctor'(int32)
	IL_0027:  stfld native int dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::NumVal
	IL_002c:  ldarg.0 
	IL_002d:  ldc.i4 0
	IL_0032:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0037:  ldarg.0 
	IL_0038:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok::'.ctor'()
	IL_003d:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0042:  ldarg.0 
	IL_0043:  ldnull 
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0049:  ldarg.0 
	IL_004a:  ldstr ""
	IL_004f:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0054:  ldarg.0 
	IL_0055:  ldc.i4 0
	IL_005a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_005f:  ldarg.0 
	IL_0060:  ldc.i4 0
	IL_0065:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006a:  ret 
    } // end of method IntPtrLiteral::.ctor

    // method line 105
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x4710
	// Code size 108 (0x6c)
	.maxstack 5
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  newobj instance void native int::'.ctor'(int32)
	IL_0028:  stfld native int dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::NumVal
	IL_002d:  ldarg.0 
	IL_002e:  ldc.i4 0
	IL_0033:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0038:  ldarg.0 
	IL_0039:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok::'.ctor'()
	IL_003e:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0043:  ldarg.0 
	IL_0044:  ldnull 
	IL_0045:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_004a:  ldarg.0 
	IL_004b:  ldstr ""
	IL_0050:  stfld string dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0055:  ldarg.0 
	IL_0056:  ldc.i4 0
	IL_005b:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0060:  ldarg.0 
	IL_0061:  ldc.i4 0
	IL_0066:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_006b:  ret 
    } // end of method IntPtrLiteral::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi Ident
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  bool IsRef
    .field  public  bool IsValInRef
    .field  public  bool IsRefInst
    .field  public  bool IsValInRefInst
    .field  public  bool Conv
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok TTok
    .field  public  bool IsArr
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr ArrLoc
    .field  public  bool DoNeg
    .field  public  bool DoNot
    .field  public  string OrdOp
    .field  public  bool MemberAccessFlg
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token MemberToAccess

    // method line 106
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4788
	// Code size 172 (0xac)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsRef
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRef
	IL_0032:  ldarg.0 
	IL_0033:  ldc.i4 0
	IL_0038:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsRef
	IL_003d:  ldarg.0 
	IL_003e:  ldc.i4 0
	IL_0043:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRef
	IL_0048:  ldarg.0 
	IL_0049:  ldc.i4 0
	IL_004e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_0053:  ldarg.0 
	IL_0054:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0059:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_005e:  ldarg.0 
	IL_005f:  ldc.i4 0
	IL_0064:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_0069:  ldarg.0 
	IL_006a:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_006f:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0074:  ldarg.0 
	IL_0075:  ldc.i4 0
	IL_007a:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::DoNeg
	IL_007f:  ldarg.0 
	IL_0080:  ldc.i4 0
	IL_0085:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::DoNot
	IL_008a:  ldarg.0 
	IL_008b:  ldstr ""
	IL_0090:  stfld string dylan.NET.Tokenizer.AST.Tokens.Ident::OrdOp
	IL_0095:  ldarg.0 
	IL_0096:  ldc.i4 0
	IL_009b:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_00a0:  ldarg.0 
	IL_00a1:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_00a6:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_00ab:  ret 
    } // end of method Ident::.ctor

    // method line 107
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x4840
	// Code size 173 (0xad)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsRef
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRef
	IL_0033:  ldarg.0 
	IL_0034:  ldc.i4 0
	IL_0039:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsRef
	IL_003e:  ldarg.0 
	IL_003f:  ldc.i4 0
	IL_0044:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRef
	IL_0049:  ldarg.0 
	IL_004a:  ldc.i4 0
	IL_004f:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_0054:  ldarg.0 
	IL_0055:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_005a:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_005f:  ldarg.0 
	IL_0060:  ldc.i4 0
	IL_0065:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_006a:  ldarg.0 
	IL_006b:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0070:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0075:  ldarg.0 
	IL_0076:  ldc.i4 0
	IL_007b:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::DoNeg
	IL_0080:  ldarg.0 
	IL_0081:  ldc.i4 0
	IL_0086:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::DoNot
	IL_008b:  ldarg.0 
	IL_008c:  ldstr ""
	IL_0091:  stfld string dylan.NET.Tokenizer.AST.Tokens.Ident::OrdOp
	IL_0096:  ldarg.0 
	IL_0097:  ldc.i4 0
	IL_009c:  stfld bool dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_00a1:  ldarg.0 
	IL_00a2:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_00a7:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_00ac:  ret 
    } // end of method Ident::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ident
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi Attribute
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 108
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x48fc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method Attribute::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi HideBySigAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 109
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4910
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method HideBySigAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi SpecialNameAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 110
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4924
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method SpecialNameAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi PrivateAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 111
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4938
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method PrivateAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi FamilyAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 112
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x494c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method FamilyAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.FamilyAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi PublicAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 113
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4960
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method PublicAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi StaticAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 114
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4974
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method StaticAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi VirtualAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 115
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4988
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method VirtualAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi AbstractAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 116
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x499c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method AbstractAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.AbstractAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi NewSlotAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 117
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x49b0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method NewSlotAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.NewSlotAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi PinvokeImplAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 118
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x49c4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method PinvokeImplAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.PinvokeImplAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi HasDefaultAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 119
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x49d8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method HasDefaultAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.HasDefaultAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi NoneAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 120
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x49ec
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method NoneAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.NoneAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi AutoClassAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 121
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a00
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method AutoClassAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi AnsiClassAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 122
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a14
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method AnsiClassAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi BeforeFieldInitAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 123
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a28
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method BeforeFieldInitAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi SealedAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 124
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a3c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method SealedAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.SealedAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi InterfaceAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 125
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a50
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method InterfaceAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.InterfaceAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi InitOnlyAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 126
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a64
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method InitOnlyAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi LiteralAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 127
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a78
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method LiteralAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.LiteralAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi FinalAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 128
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4a8c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method FinalAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.FinalAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi AssemblyAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 129
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4aa0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method AssemblyAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.AssemblyAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi FamANDAssemAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 130
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ab4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method FamANDAssemAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.FamANDAssemAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi FamORAssemAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 131
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ac8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method FamORAssemAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.FamORAssemAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi SequentialLayoutAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 132
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4adc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method SequentialLayoutAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.SequentialLayoutAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Attributes
{
  .class public auto ansi AutoLayoutAttr
  	extends dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
  {

    // method line 133
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4af0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_0006:  ret 
    } // end of method AutoLayoutAttr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi ConditionalOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.Op
  {

    // method line 134
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4b04
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.Op::'.ctor'()
	IL_0006:  ret 
    } // end of method ConditionalOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi EqOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 135
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4b18
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 8
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method EqOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.EqOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi LikeOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 136
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4b44
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 8
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method LikeOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.LikeOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi NeqOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 137
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4b70
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 8
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method NeqOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.NeqOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi NLikeOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 138
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4b9c
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 8
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method NLikeOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.NLikeOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi GtOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 139
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4bc8
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 9
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method GtOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.GtOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi LtOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 140
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4bf4
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 9
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method LtOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.LtOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi GeOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 141
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4c20
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 9
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method GeOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.GeOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Ops
{
  .class public auto ansi LeOp
  	extends dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
  {

    // method line 142
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4c4c
	// Code size 32 (0x20)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 9
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_001f:  ret 
    } // end of method LeOp::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Ops.LeOp
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi NewarrTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 143
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4c78
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method NewarrTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.NewarrTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi NewTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 144
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4c8c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method NewTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.NewTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi CastclassTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 145
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ca0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method CastclassTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.CastclassTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi GettypeTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 146
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4cb4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method GettypeTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.GettypeTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi PtrTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 147
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4cc8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method PtrTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.PtrTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi DependTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 148
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4cdc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method DependTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.DependTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi StdasmTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 149
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4cf0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method StdasmTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.StdasmTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi SwitchTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 150
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d04
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method SwitchTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.SwitchTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi OnTok
  	extends dylan.NET.Tokenizer.AST.Tokens.SwitchTok
  {

    // method line 151
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d18
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.SwitchTok::'.ctor'()
	IL_0006:  ret 
    } // end of method OnTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.OnTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi OfTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 152
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d2c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method OfTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.OfTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi OffTok
  	extends dylan.NET.Tokenizer.AST.Tokens.SwitchTok
  {

    // method line 153
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d40
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.SwitchTok::'.ctor'()
	IL_0006:  ret 
    } // end of method OffTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.OffTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi SingTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 154
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d54
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method SingTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.SingTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ScopeTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 155
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d68
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ScopeTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ScopeTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi DebugTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 156
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d7c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method DebugTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.DebugTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi MakeasmTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 157
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4d90
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method MakeasmTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.MakeasmTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi RefasmTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 158
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4da4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method RefasmTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.RefasmTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi RefstdasmTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 159
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4db8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method RefstdasmTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.RefstdasmTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi NewresTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 160
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4dcc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method NewresTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.NewresTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ImageTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 161
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4de0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ImageTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ImageTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ImportTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 162
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4df4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ImportTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ImportTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi LocimportTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 163
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e08
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method LocimportTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.LocimportTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi AssemblyTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 164
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e1c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method AssemblyTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.AssemblyTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ExeTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 165
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e30
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ExeTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ExeTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi DllTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 166
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e44
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method DllTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.DllTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi VerTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 167
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e58
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method VerTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.VerTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi IncludeTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 168
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e6c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method IncludeTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.IncludeTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi XmldocTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 169
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e80
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method XmldocTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.XmldocTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi NamespaceTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 170
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4e94
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method NamespaceTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.NamespaceTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ClassTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 171
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ea8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ClassTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ClassTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ExtendsTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 172
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ebc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ExtendsTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ExtendsTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi EnumTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 173
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ed0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method EnumTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.EnumTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi FieldTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 174
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ee4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method FieldTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.FieldTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi DelegateTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 175
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ef8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method DelegateTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.DelegateTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi StructTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 176
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f0c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method StructTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.StructTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi PropertyTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 177
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f20
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method PropertyTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.PropertyTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi GetTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 178
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f34
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method GetTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.GetTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi SetTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 179
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f48
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method SetTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.SetTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi MethodTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 180
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f5c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method MethodTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.MethodTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi TryTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 181
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f70
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method TryTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.TryTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi CatchTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 182
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f84
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method CatchTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.CatchTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi AsTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 183
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4f98
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method AsTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.AsTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi FinallyTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 184
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4fac
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method FinallyTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.FinallyTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi LabelTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 185
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4fc0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method LabelTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.LabelTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi PlaceTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 186
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4fd4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method PlaceTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.PlaceTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi GotoTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 187
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4fe8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method GotoTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.GotoTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi IfTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 188
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x4ffc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method IfTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.IfTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ElseIfTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 189
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5010
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ElseIfTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ElseIfTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ThenTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 190
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5024
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ThenTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ThenTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi DoTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 191
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5038
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method DoTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.DoTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi BreakTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 192
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x504c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method BreakTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.BreakTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ContinueTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 193
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5060
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ContinueTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ContinueTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi WhileTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 194
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5074
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method WhileTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.WhileTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi UntilTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 195
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5088
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method UntilTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.UntilTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi LiteralTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 196
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x509c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method LiteralTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.LiteralTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi VarTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 197
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x50b0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method VarTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.VarTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ElseTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 198
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x50c4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ElseTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ElseTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ReturnTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 199
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x50d8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ReturnTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ReturnTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi ThrowTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 200
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x50ec
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method ThrowTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.ThrowTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi EndTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 201
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5100
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method EndTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.EndTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi MeTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  bool Conv
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok TTok

    // method line 202
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5114
	// Code size 47 (0x2f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 0
	IL_0022:  stfld bool dylan.NET.Tokenizer.AST.Tokens.MeTok::Conv
	IL_0027:  ldarg.0 
	IL_0028:  ldnull 
	IL_0029:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.MeTok::TTok
	IL_002e:  ret 
    } // end of method MeTok::.ctor

    // method line 203
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x5150
	// Code size 48 (0x30)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  ldc.i4 0
	IL_0023:  stfld bool dylan.NET.Tokenizer.AST.Tokens.MeTok::Conv
	IL_0028:  ldarg.0 
	IL_0029:  ldnull 
	IL_002a:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.MeTok::TTok
	IL_002f:  ret 
    } // end of method MeTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.MeTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi CommentTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 204
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x518c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method CommentTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.CommentTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi MethodNameTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Ident
  {

    // method line 205
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x51a0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0006:  ret 
    } // end of method MethodNameTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi MethodCallTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok Name
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr[] Params
    .field  public  bool PopFlg
    .field  public  class [mscorlib]System.Type[] TypArr

    // method line 206
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x51b4
	// Code size 79 (0x4f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_0022:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  stfld bool dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_0032:  ldarg.0 
	IL_0033:  ldc.i4 0
	IL_0038:  conv.u 
	IL_0039:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_003e:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_0043:  ldarg.0 
	IL_0044:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_0049:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::TypArr
	IL_004e:  ret 
    } // end of method MethodCallTok::.ctor

    // method line 207
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x5210
	// Code size 80 (0x50)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_0023:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  stfld bool dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_0033:  ldarg.0 
	IL_0034:  ldc.i4 0
	IL_0039:  conv.u 
	IL_003a:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_003f:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_0044:  ldarg.0 
	IL_0045:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_004a:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::TypArr
	IL_004f:  ret 
    } // end of method MethodCallTok::.ctor

    // method line 208
    .method public 
           instance default void AddParam (class dylan.NET.Tokenizer.AST.Exprs.Expr paramtoadd)  cil managed 
    {
        // Method begins at RVA 0x526c
	// Code size 327 (0x147)
	.maxstack 19
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
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

	IL_00f2:  ldloc 0

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldc.i4 0
	IL_00fd:  beq IL_0107

	IL_0102:  br IL_011d

	IL_0107:  ldarg.0 
	IL_0108:  ldarg 1

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0113:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0118:  br IL_0122

	IL_011d:  br IL_0122

	IL_0122:  ldloc 4

	IL_0126:  nop 
	IL_0127:  nop 
	IL_0128:  ldloc 0

	IL_012c:  nop 
	IL_012d:  nop 
	IL_012e:  conv.u 
	IL_012f:  ldarg 1

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_013a:  ldarg.0 
	IL_013b:  ldloc 4

	IL_013f:  nop 
	IL_0140:  nop 
	IL_0141:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_0146:  ret 
    } // end of method MethodCallTok::AddParam

  } // end of class dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi NewCallTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok Name
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr[] Params

    // method line 209
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x53c0
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0022:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Name
	IL_0027:  ldarg.0 
	IL_0028:  ldc.i4 0
	IL_002d:  conv.u 
	IL_002e:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0038:  ret 
    } // end of method NewCallTok::.ctor

    // method line 210
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x5408
	// Code size 58 (0x3a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0023:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Name
	IL_0028:  ldarg.0 
	IL_0029:  ldc.i4 0
	IL_002e:  conv.u 
	IL_002f:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0034:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0039:  ret 
    } // end of method NewCallTok::.ctor

    // method line 211
    .method public 
           instance default void AddParam (class dylan.NET.Tokenizer.AST.Exprs.Expr paramtoadd)  cil managed 
    {
        // Method begins at RVA 0x5450
	// Code size 327 (0x147)
	.maxstack 19
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
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

	IL_00f2:  ldloc 0

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldc.i4 0
	IL_00fd:  beq IL_0107

	IL_0102:  br IL_011d

	IL_0107:  ldarg.0 
	IL_0108:  ldarg 1

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0113:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0118:  br IL_0122

	IL_011d:  br IL_0122

	IL_0122:  ldloc 4

	IL_0126:  nop 
	IL_0127:  nop 
	IL_0128:  ldloc 0

	IL_012c:  nop 
	IL_012d:  nop 
	IL_012e:  conv.u 
	IL_012f:  ldarg 1

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_013a:  ldarg.0 
	IL_013b:  ldloc 4

	IL_013f:  nop 
	IL_0140:  nop 
	IL_0141:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0146:  ret 
    } // end of method NewCallTok::AddParam

  } // end of class dylan.NET.Tokenizer.AST.Tokens.NewCallTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi GettypeCallTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok Name

    // method line 212
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x55a4
	// Code size 40 (0x28)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0022:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_0027:  ret 
    } // end of method GettypeCallTok::.ctor

    // method line 213
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x55d8
	// Code size 41 (0x29)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0023:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_0028:  ret 
    } // end of method GettypeCallTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi PtrCallTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok MetToCall

    // method line 214
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5610
	// Code size 40 (0x28)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001c:  ldarg.0 
	IL_001d:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_0022:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_0027:  ret 
    } // end of method PtrCallTok::.ctor

    // method line 215
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x5644
	// Code size 41 (0x29)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0012:  ldarg.0 
	IL_0013:  ldc.i4 0
	IL_0018:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_001d:  ldarg.0 
	IL_001e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_0023:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_0028:  ret 
    } // end of method PtrCallTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.PtrCallTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens
{
  .class public auto ansi NewarrCallTok
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok ArrayType
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr ArrayLen

    // method line 216
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x567c
	// Code size 51 (0x33)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0011:  ldarg.0 
	IL_0012:  ldstr ""
	IL_0017:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_001c:  ldarg.0 
	IL_001d:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0022:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_0027:  ldarg.0 
	IL_0028:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_002d:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_0032:  ret 
    } // end of method NewarrCallTok::.ctor

    // method line 217
    .method public specialname rtspecialname 
           instance default void '.ctor' (string 'value')  cil managed 
    {
        // Method begins at RVA 0x56bc
	// Code size 52 (0x34)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  stfld int32 dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0011:  ldarg.0 
	IL_0012:  ldarg 1

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  stfld string dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_001d:  ldarg.0 
	IL_001e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0023:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_0028:  ldarg.0 
	IL_0029:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_0033:  ret 
    } // end of method NewarrCallTok::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi Character
  	extends dylan.NET.Tokenizer.AST.Tokens.Token
  {

    // method line 218
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x56fc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0006:  ret 
    } // end of method Character::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.Character
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi RSParen
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 219
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5710
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method RSParen::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.RSParen
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi LSParen
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 220
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5724
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method LSParen::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi LRSParen
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 221
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5738
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method LRSParen::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.LRSParen
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi RAParen
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 222
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x574c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method RAParen::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.RAParen
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi LAParen
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 223
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5760
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method LAParen::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.LAParen
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi RParen
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 224
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5774
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method RParen::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi LParen
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 225
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5788
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method LParen::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi Comma
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 226
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x579c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method Comma::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi CrLf
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 227
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x57b0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method CrLf::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.CrLf
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi Cr
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 228
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x57c4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method Cr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.Cr
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi Lf
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 229
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x57d8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method Lf::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.Lf
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi Pipe
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 230
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x57ec
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method Pipe::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.Pipe
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi Ampersand
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 231
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5800
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method Ampersand::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.Ampersand
}

.namespace dylan.NET.Tokenizer.AST.Tokens.Chars
{
  .class public auto ansi DollarSign
  	extends dylan.NET.Tokenizer.AST.Tokens.Chars.Character
  {

    // method line 232
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5814
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Tokens.Chars.Character::'.ctor'()
	IL_0006:  ret 
    } // end of method DollarSign::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Tokens.Chars.DollarSign
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi NewarrExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok ArrayType
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token ArrayLen

    // method line 233
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5828
	// Code size 64 (0x40)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Exprs.NewarrExpr::ArrayType
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Exprs.NewarrExpr::ArrayLen
	IL_0038:  ldarg.0 
	IL_0039:  ldnull 
	IL_003a:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Exprs.Expr::ResultTyp
	IL_003f:  ret 
    } // end of method NewarrExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.NewarrExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi NewExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.MethodCallTok MetToCall

    // method line 234
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5874
	// Code size 53 (0x35)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodCallTok dylan.NET.Tokenizer.AST.Exprs.NewExpr::MetToCall
	IL_002d:  ldarg.0 
	IL_002e:  ldnull 
	IL_002f:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Exprs.Expr::ResultTyp
	IL_0034:  ret 
    } // end of method NewExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.NewExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi CastclassExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token Obj
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok DestType

    // method line 235
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x58b8
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Exprs.CastclassExpr::Obj
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Exprs.CastclassExpr::DestType
	IL_0038:  ret 
    } // end of method CastclassExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.CastclassExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi GettypeExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok TypeToGet

    // method line 236
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5900
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Exprs.GettypeExpr::TypeToGet
	IL_002d:  ret 
    } // end of method GettypeExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.GettypeExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi PtrExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.MethodCallTok MetToCall

    // method line 237
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x593c
	// Code size 53 (0x35)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodCallTok dylan.NET.Tokenizer.AST.Exprs.PtrExpr::MetToCall
	IL_002d:  ldarg.0 
	IL_002e:  ldnull 
	IL_002f:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Exprs.Expr::ResultTyp
	IL_0034:  ret 
    } // end of method PtrExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.PtrExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi AritExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {

    // method line 238
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5980
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ret 
    } // end of method AritExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.AritExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi LogicExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {

    // method line 239
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5994
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ret 
    } // end of method LogicExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.LogicExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi VarExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok VarTyp
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident VarName

    // method line 240
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x59a8
	// Code size 64 (0x40)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldnull 
	IL_0024:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.AST.Exprs.Expr::ResultTyp
	IL_0029:  ldarg.0 
	IL_002a:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_002f:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarTyp
	IL_0034:  ldarg.0 
	IL_0035:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_003a:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarName
	IL_003f:  ret 
    } // end of method VarExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.VarExpr
}

.namespace dylan.NET.Tokenizer.AST.Exprs
{
  .class public auto ansi ConditionalExpr
  	extends dylan.NET.Tokenizer.AST.Exprs.Expr
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr LtExpr
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr RtExpr
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp CondOP

    // method line 241
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x59f4
	// Code size 68 (0x44)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Exprs.ConditionalExpr::LtExpr
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Exprs.ConditionalExpr::RtExpr
	IL_0038:  ldarg.0 
	IL_0039:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp::'.ctor'()
	IL_003e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp dylan.NET.Tokenizer.AST.Exprs.ConditionalExpr::CondOP
	IL_0043:  ret 
    } // end of method ConditionalExpr::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Exprs.ConditionalExpr
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi DependStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token Path

    // method line 242
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5a44
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.DependStmt::Path
	IL_002d:  ret 
    } // end of method DependStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.DependStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi StdasmStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.SwitchTok Opt

    // method line 243
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5a80
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.SwitchTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.StdasmStmt::Opt
	IL_002d:  ret 
    } // end of method StdasmStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.StdasmStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi SingStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 244
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5abc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method SingStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.SingStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi DebugStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.SwitchTok Opt
    .field  public  bool Flg

    // method line 245
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5ad0
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.SwitchTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Opt
	IL_002d:  ldarg.0 
	IL_002e:  ldc.i4 0
	IL_0033:  stfld bool dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Flg
	IL_0038:  ret 
    } // end of method DebugStmt::.ctor

    // method line 246
    .method public 
           instance default void setFlg ()  cil managed 
    {
        // Method begins at RVA 0x5b18
	// Code size 194 (0xc2)
	.maxstack 8
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldtoken dylan.NET.Tokenizer.AST.Tokens.OnTok
	IL_0010:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0015:  stloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldloc 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldarg.0 
	IL_0022:  ldfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Opt
	IL_0027:  box dylan.NET.Tokenizer.AST.Tokens.SwitchTok
	IL_002c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0031:  stloc 1

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldloc 1

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldc.i4 1
	IL_0042:  beq IL_004c

	IL_0047:  br IL_0061

	IL_004c:  ldarg.0 
	IL_004d:  ldc.i4 1
	IL_0052:  stfld bool dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Flg
	IL_0057:  br IL_00c1

	IL_005c:  br IL_0066

	IL_0061:  br IL_0066

	IL_0066:  ldtoken dylan.NET.Tokenizer.AST.Tokens.OffTok
	IL_006b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0070:  stloc 0

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldloc 0

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldarg.0 
	IL_007d:  ldfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Opt
	IL_0082:  box dylan.NET.Tokenizer.AST.Tokens.SwitchTok
	IL_0087:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_008c:  stloc 1

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldloc 1

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldc.i4 1
	IL_009d:  beq IL_00a7

	IL_00a2:  br IL_00bc

	IL_00a7:  ldarg.0 
	IL_00a8:  ldc.i4 0
	IL_00ad:  stfld bool dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Flg
	IL_00b2:  br IL_00c1

	IL_00b7:  br IL_00c1

	IL_00bc:  br IL_00c1

	IL_00c1:  ret 
    } // end of method DebugStmt::setFlg

  } // end of class dylan.NET.Tokenizer.AST.Stmts.DebugStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ScopeStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.SwitchTok Opt
    .field  public  bool Flg

    // method line 247
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5be8
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.SwitchTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::Opt
	IL_002d:  ldarg.0 
	IL_002e:  ldc.i4 0
	IL_0033:  stfld bool dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::Flg
	IL_0038:  ret 
    } // end of method ScopeStmt::.ctor

    // method line 248
    .method public 
           instance default void setFlg ()  cil managed 
    {
        // Method begins at RVA 0x5c30
	// Code size 194 (0xc2)
	.maxstack 8
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldtoken dylan.NET.Tokenizer.AST.Tokens.OnTok
	IL_0010:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0015:  stloc 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldloc 0

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldarg.0 
	IL_0022:  ldfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::Opt
	IL_0027:  box dylan.NET.Tokenizer.AST.Tokens.SwitchTok
	IL_002c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0031:  stloc 1

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldloc 1

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldc.i4 1
	IL_0042:  beq IL_004c

	IL_0047:  br IL_0061

	IL_004c:  ldarg.0 
	IL_004d:  ldc.i4 1
	IL_0052:  stfld bool dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::Flg
	IL_0057:  br IL_00c1

	IL_005c:  br IL_0066

	IL_0061:  br IL_0066

	IL_0066:  ldtoken dylan.NET.Tokenizer.AST.Tokens.OffTok
	IL_006b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0070:  stloc 0

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldloc 0

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldarg.0 
	IL_007d:  ldfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::Opt
	IL_0082:  box dylan.NET.Tokenizer.AST.Tokens.SwitchTok
	IL_0087:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_008c:  stloc 1

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldloc 1

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldc.i4 1
	IL_009d:  beq IL_00a7

	IL_00a2:  br IL_00bc

	IL_00a7:  ldarg.0 
	IL_00a8:  ldc.i4 0
	IL_00ad:  stfld bool dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::Flg
	IL_00b2:  br IL_00c1

	IL_00b7:  br IL_00c1

	IL_00bc:  br IL_00c1

	IL_00c1:  ret 
    } // end of method ScopeStmt::setFlg

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ScopeStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi MakeasmStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.SwitchTok Opt

    // method line 249
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5d00
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.SwitchTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.SwitchTok dylan.NET.Tokenizer.AST.Stmts.MakeasmStmt::Opt
	IL_002d:  ret 
    } // end of method MakeasmStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.MakeasmStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi RefasmStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token AsmPath

    // method line 250
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5d3c
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.RefasmStmt::AsmPath
	IL_002d:  ret 
    } // end of method RefasmStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.RefasmStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi RefstdasmStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token AsmPath

    // method line 251
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5d78
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt::AsmPath
	IL_002d:  ret 
    } // end of method RefstdasmStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi NewresStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token Path
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token ResType

    // method line 252
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5db4
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.NewresStmt::Path
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.NewresStmt::ResType
	IL_0038:  ret 
    } // end of method NewresStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.NewresStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ImportStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token NS

    // method line 253
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5dfc
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.ImportStmt::NS
	IL_002d:  ret 
    } // end of method ImportStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ImportStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi LocimportStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token NS

    // method line 254
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5e38
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.LocimportStmt::NS
	IL_002d:  ret 
    } // end of method LocimportStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.LocimportStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi AssemblyStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token Mode
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident AsmName

    // method line 255
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5e74
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::Mode
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::AsmName
	IL_0038:  ret 
    } // end of method AssemblyStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi VerStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[] VersionNos

    // method line 256
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5ebc
	// Code size 52 (0x34)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4 4
	IL_0028:  conv.u 
	IL_0029:  newarr dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[] dylan.NET.Tokenizer.AST.Stmts.VerStmt::VersionNos
	IL_0033:  ret 
    } // end of method VerStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.VerStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi IncludeStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token Path

    // method line 257
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5efc
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.IncludeStmt::Path
	IL_002d:  ret 
    } // end of method IncludeStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.IncludeStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi XmlDocStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token NodeType
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token NodePath

    // method line 258
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5f38
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.XmlDocStmt::NodeType
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.XmlDocStmt::NodePath
	IL_0038:  ret 
    } // end of method XmlDocStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.XmlDocStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi NSStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token NS

    // method line 259
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5f80
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.NSStmt::NS
	IL_002d:  ret 
    } // end of method NSStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.NSStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ClassStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] Attrs
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident ClassName
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok InhClass

    // method line 260
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x5fbc
	// Code size 74 (0x4a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4 0
	IL_0028:  conv.u 
	IL_0029:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.ClassStmt::Attrs
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.ClassStmt::ClassName
	IL_003e:  ldarg.0 
	IL_003f:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.ClassStmt::InhClass
	IL_0049:  ret 
    } // end of method ClassStmt::.ctor

    // method line 261
    .method public 
           instance default void AddAttr (class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute attrtoadd)  cil managed 
    {
        // Method begins at RVA 0x6014
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.ClassStmt::Attrs
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.ClassStmt::Attrs
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.ClassStmt::Attrs
	IL_0116:  ret 
    } // end of method ClassStmt::AddAttr

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ClassStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi DelegateStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] Attrs
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident DelegateName
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok RetTyp
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr[] Params

    // method line 262
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6138
	// Code size 91 (0x5b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4 0
	IL_0028:  conv.u 
	IL_0029:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Attrs
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::DelegateName
	IL_003e:  ldarg.0 
	IL_003f:  ldc.i4 0
	IL_0044:  conv.u 
	IL_0045:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_004a:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Params
	IL_004f:  ldarg.0 
	IL_0050:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0055:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::RetTyp
	IL_005a:  ret 
    } // end of method DelegateStmt::.ctor

    // method line 263
    .method public 
           instance default void AddAttr (class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute attrtoadd)  cil managed 
    {
        // Method begins at RVA 0x61a0
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Attrs
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Attrs
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Attrs
	IL_0116:  ret 
    } // end of method DelegateStmt::AddAttr

    // method line 264
    .method public 
           instance default void AddParam (class dylan.NET.Tokenizer.AST.Exprs.Expr paramtoadd)  cil managed 
    {
        // Method begins at RVA 0x62c4
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Params
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Params
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Params
	IL_0116:  ret 
    } // end of method DelegateStmt::AddParam

  } // end of class dylan.NET.Tokenizer.AST.Stmts.DelegateStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EnumStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] Attrs
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident EnumName
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok EnumTyp

    // method line 265
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x63e8
	// Code size 74 (0x4a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4 0
	IL_0028:  conv.u 
	IL_0029:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.EnumStmt::Attrs
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.EnumStmt::EnumName
	IL_003e:  ldarg.0 
	IL_003f:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.EnumStmt::EnumTyp
	IL_0049:  ret 
    } // end of method EnumStmt::.ctor

    // method line 266
    .method public 
           instance default void AddAttr (class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute attrtoadd)  cil managed 
    {
        // Method begins at RVA 0x6440
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.EnumStmt::Attrs
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.EnumStmt::Attrs
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.EnumStmt::Attrs
	IL_0116:  ret 
    } // end of method EnumStmt::AddAttr

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EnumStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi LiteralStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr RExp
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident LitName

    // method line 267
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6564
	// Code size 51 (0x33)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.LiteralStmt::RExp
	IL_002d:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0032:  ret 
    } // end of method LiteralStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.LiteralStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi PropertyStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] Attrs
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident PropertyName

    // method line 268
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x65a4
	// Code size 63 (0x3f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4 0
	IL_0028:  conv.u 
	IL_0029:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.PropertyStmt::Attrs
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.PropertyStmt::PropertyName
	IL_003e:  ret 
    } // end of method PropertyStmt::.ctor

    // method line 269
    .method public 
           instance default void AddAttr (class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute attrtoadd)  cil managed 
    {
        // Method begins at RVA 0x65f0
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.PropertyStmt::Attrs
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.PropertyStmt::Attrs
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.PropertyStmt::Attrs
	IL_0116:  ret 
    } // end of method PropertyStmt::AddAttr

  } // end of class dylan.NET.Tokenizer.AST.Stmts.PropertyStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi PropertySetStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok Setter

    // method line 270
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6714
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok dylan.NET.Tokenizer.AST.Stmts.PropertySetStmt::Setter
	IL_002d:  ret 
    } // end of method PropertySetStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.PropertySetStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi PropertyGetStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok Getter

    // method line 271
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6750
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.MethodNameTok dylan.NET.Tokenizer.AST.Stmts.PropertyGetStmt::Getter
	IL_002d:  ret 
    } // end of method PropertyGetStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.PropertyGetStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi MethodStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] Attrs
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident MethodName
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok RetTyp
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr[] Params

    // method line 272
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x678c
	// Code size 91 (0x5b)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4 0
	IL_0028:  conv.u 
	IL_0029:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Attrs
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.MethodStmt::MethodName
	IL_003e:  ldarg.0 
	IL_003f:  ldc.i4 0
	IL_0044:  conv.u 
	IL_0045:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_004a:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Params
	IL_004f:  ldarg.0 
	IL_0050:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0055:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.MethodStmt::RetTyp
	IL_005a:  ret 
    } // end of method MethodStmt::.ctor

    // method line 273
    .method public 
           instance default void AddAttr (class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute attrtoadd)  cil managed 
    {
        // Method begins at RVA 0x67f4
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Attrs
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Attrs
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Attrs
	IL_0116:  ret 
    } // end of method MethodStmt::AddAttr

    // method line 274
    .method public 
           instance default void AddParam (class dylan.NET.Tokenizer.AST.Exprs.Expr paramtoadd)  cil managed 
    {
        // Method begins at RVA 0x6918
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Params
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Exprs.Expr
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Params
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr[] dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Params
	IL_0116:  ret 
    } // end of method MethodStmt::AddParam

  } // end of class dylan.NET.Tokenizer.AST.Stmts.MethodStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi FieldStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] Attrs
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident FieldName
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok FieldTyp

    // method line 275
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6a3c
	// Code size 74 (0x4a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4 0
	IL_0028:  conv.u 
	IL_0029:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_002e:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.FieldStmt::Attrs
	IL_0033:  ldarg.0 
	IL_0034:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0039:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldName
	IL_003e:  ldarg.0 
	IL_003f:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0044:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldTyp
	IL_0049:  ret 
    } // end of method FieldStmt::.ctor

    // method line 276
    .method public 
           instance default void AddAttr (class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute attrtoadd)  cil managed 
    {
        // Method begins at RVA 0x6a94
	// Code size 279 (0x117)
	.maxstack 15
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_4)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.FieldStmt::Attrs
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
	IL_0044:  newarr dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0083:  ldarg.0 
	IL_0084:  ldfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.FieldStmt::Attrs
	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  conv.u 
	IL_0090:  ldelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0095:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
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
	IL_0105:  stelem dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_010a:  ldarg.0 
	IL_010b:  ldloc 4

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  stfld class dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] dylan.NET.Tokenizer.AST.Stmts.FieldStmt::Attrs
	IL_0116:  ret 
    } // end of method FieldStmt::AddAttr

  } // end of class dylan.NET.Tokenizer.AST.Stmts.FieldStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi TryStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 277
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6bb8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method TryStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.TryStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi CatchStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident ExName
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok ExTyp

    // method line 278
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6bcc
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.CatchStmt::ExName
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.CatchStmt::ExTyp
	IL_0038:  ret 
    } // end of method CatchStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.CatchStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi FinallyStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 279
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6c14
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method FinallyStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.FinallyStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ThrowStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr RExp

    // method line 280
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6c28
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.ThrowStmt::RExp
	IL_002d:  ret 
    } // end of method ThrowStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ThrowStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi LabelStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident LabelName

    // method line 281
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6c64
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.LabelStmt::LabelName
	IL_002d:  ret 
    } // end of method LabelStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.LabelStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi PlaceStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident LabelName

    // method line 282
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6ca0
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.PlaceStmt::LabelName
	IL_002d:  ret 
    } // end of method PlaceStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.PlaceStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi GotoStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident LabelName

    // method line 283
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6cdc
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.GotoStmt::LabelName
	IL_002d:  ret 
    } // end of method GotoStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.GotoStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi DoWhileStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr Exp

    // method line 284
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6d18
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.DoWhileStmt::Exp
	IL_002d:  ret 
    } // end of method DoWhileStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.DoWhileStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi DoUntilStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr Exp

    // method line 285
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6d54
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.DoUntilStmt::Exp
	IL_002d:  ret 
    } // end of method DoUntilStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.DoUntilStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi WhileStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr Exp

    // method line 286
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6d90
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.WhileStmt::Exp
	IL_002d:  ret 
    } // end of method WhileStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.WhileStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi UntilStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr Exp

    // method line 287
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6dcc
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.UntilStmt::Exp
	IL_002d:  ret 
    } // end of method UntilStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.UntilStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi DoStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 288
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6e08
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method DoStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.DoStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi BreakStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 289
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6e1c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method BreakStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.BreakStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ContinueStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 290
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6e30
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method ContinueStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ContinueStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndDoStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 291
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6e44
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndDoStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndDoStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi IfStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr Exp

    // method line 292
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6e58
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.IfStmt::Exp
	IL_002d:  ret 
    } // end of method IfStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.IfStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ElseIfStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr Exp

    // method line 293
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6e94
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt::Exp
	IL_002d:  ret 
    } // end of method ElseIfStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ElseStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 294
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6ed0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method ElseStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ElseStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndIfStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 295
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6ee4
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndIfStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndIfStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi VarStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok VarTyp
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident VarName

    // method line 296
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6ef8
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarTyp
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarName
	IL_0038:  ret 
    } // end of method VarStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.VarStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi VarAsgnStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok VarTyp
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident VarName
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr RExpr

    // method line 297
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6f40
	// Code size 68 (0x44)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarTyp
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarName
	IL_0038:  ldarg.0 
	IL_0039:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_003e:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::RExpr
	IL_0043:  ret 
    } // end of method VarAsgnStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi AssignStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr LExp
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr RExp

    // method line 298
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6f90
	// Code size 57 (0x39)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.AssignStmt::LExp
	IL_002d:  ldarg.0 
	IL_002e:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0033:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.AssignStmt::RExp
	IL_0038:  ret 
    } // end of method AssignStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.AssignStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi IncStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident NumVar

    // method line 299
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6fd8
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.IncStmt::NumVar
	IL_002d:  ret 
    } // end of method IncStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.IncStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi DecStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Ident NumVar

    // method line 300
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7014
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Ident dylan.NET.Tokenizer.AST.Stmts.DecStmt::NumVar
	IL_002d:  ret 
    } // end of method DecStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.DecStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi ReturnStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Exprs.Expr RExp

    // method line 301
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7050
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_002d:  ret 
    } // end of method ReturnStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.ReturnStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi MethodCallStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {
    .field  public  class dylan.NET.Tokenizer.AST.Tokens.Token MethodToken

    // method line 302
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x708c
	// Code size 46 (0x2e)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0012:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token[] dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0017:  ldarg.0 
	IL_0018:  ldc.i4 0
	IL_001d:  stfld int32 dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0022:  ldarg.0 
	IL_0023:  newobj instance void class dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0028:  stfld class dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::MethodToken
	IL_002d:  ret 
    } // end of method MethodCallStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndMethodStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 303
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x70c8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndMethodStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndEnumStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 304
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x70dc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndEnumStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndEnumStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndClassStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 305
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x70f0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndClassStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndClassStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndNSStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 306
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7104
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndNSStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndNSStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndXmlDocStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 307
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7118
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndXmlDocStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndXmlDocStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndTryStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 308
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x712c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndTryStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndTryStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi EndPropStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 309
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7140
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method EndPropStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.EndPropStmt
}

.namespace dylan.NET.Tokenizer.AST.Stmts
{
  .class public auto ansi CommentStmt
  	extends dylan.NET.Tokenizer.AST.Stmts.Stmt
  {

    // method line 310
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7154
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class dylan.NET.Tokenizer.AST.Stmts.Stmt::'.ctor'()
	IL_0006:  ret 
    } // end of method CommentStmt::.ctor

  } // end of class dylan.NET.Tokenizer.AST.Stmts.CommentStmt
}

