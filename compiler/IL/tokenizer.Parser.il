.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:8:7
}
.assembly extern dnu
{
  .ver 11:2:8:7
}
.assembly 'tokenizer.Parser'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 37 00 00 ) // ...11.2.8.7..

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (
		01 00 10 74 6F 6B 65 6E 69 7A 65 72 2E 50 61 72   // ...tokenizer.Par
		73 65 72 00 00                                  ) // ser..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (
		01 00 10 74 6F 6B 65 6E 69 7A 65 72 2E 50 61 72   // ...tokenizer.Par
		73 65 72 00 00                                  ) // ser..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (
		01 00 10 74 6F 6B 65 6E 69 7A 65 72 2E 50 61 72   // ...tokenizer.Par
		73 65 72 00 00                                  ) // ser..

  .hash algorithm 0x00008004
  .ver  11:2:8:7
}

.module tokenizer.Parser.dll // GUID = {83F7F532-F915-41D1-B31E-38684589326C}


.namespace dylan.NET.Tokenizer.Parser
{
  .class public auto ansi beforefieldinit ParserFlags
  	extends [mscorlib]System.Object
  {
    .field  public static  bool IfFlag
    .field  public static  bool AssemFlg
    .field  public static  bool CmtFlag
    .field  public static  bool NoOptFlag
    .field  public static  bool NegFlag
    .field  public static  bool NotFlag
    .field  public static  bool ConvFlag
    .field  public static  bool ArrFlag
    .field  public static  class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ArrSlot
    .field  public static  bool RefFlag
    .field  public static  bool ValinrefFlag
    .field  public static  class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok ConvTyp
    .field  public static  string OrdOp
    .field  public static  bool isChanged
    .field  public static  bool ProcessTTokOnly
    .field  public static  bool DurConvFlag
    .field  public static  bool IdentFlag
    .field  public static  bool MetCallFlag
    .field  public static  bool MetChainFlag
    .field  public static  bool StringFlag

    // method line 1
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 193 (0xc1)
	.maxstack 1
	IL_0000:  ldc.i4 1
	IL_0005:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::AssemFlg
	IL_000a:  ldc.i4 0
	IL_000f:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_0014:  ldc.i4 0
	IL_0019:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_001e:  ldc.i4 0
	IL_0023:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_0028:  ldc.i4 0
	IL_002d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NegFlag
	IL_0032:  ldc.i4 0
	IL_0037:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NotFlag
	IL_003c:  ldc.i4 0
	IL_0041:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_0046:  ldc.i4 0
	IL_004b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ArrFlag
	IL_0050:  ldnull 
	IL_0051:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.Parser.ParserFlags::ArrSlot
	IL_0056:  ldc.i4 0
	IL_005b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::RefFlag
	IL_0060:  ldc.i4 0
	IL_0065:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ValinrefFlag
	IL_006a:  ldnull 
	IL_006b:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_0070:  ldstr ""
	IL_0075:  stsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_007a:  ldc.i4 0
	IL_007f:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_0084:  ldc.i4 0
	IL_0089:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_008e:  ldc.i4 0
	IL_0093:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_0098:  ldc.i4 0
	IL_009d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_00a2:  ldc.i4 0
	IL_00a7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_00ac:  ldc.i4 0
	IL_00b1:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00b6:  ldc.i4 0
	IL_00bb:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_00c0:  ret 
    } // end of method ParserFlags::.cctor

    // method line 2
    .method public static 
           default void SetUnaryFalse ()  cil managed 
    {
        // Method begins at RVA 0x2120
	// Code size 103 (0x67)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NegFlag
	IL_000a:  ldc.i4 0
	IL_000f:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NotFlag
	IL_0014:  ldc.i4 0
	IL_0019:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_001e:  ldc.i4 0
	IL_0023:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ArrFlag
	IL_0028:  ldnull 
	IL_0029:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.Parser.ParserFlags::ArrSlot
	IL_002e:  ldc.i4 0
	IL_0033:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::RefFlag
	IL_0038:  ldc.i4 0
	IL_003d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ValinrefFlag
	IL_0042:  ldnull 
	IL_0043:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_0048:  ldstr ""
	IL_004d:  stsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_0052:  ldc.i4 0
	IL_0057:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_005c:  ldc.i4 0
	IL_0061:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_0066:  ret 
    } // end of method ParserFlags::SetUnaryFalse

    // method line 3
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident UpdateIdent (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident id)  cil managed 
    {
        // Method begins at RVA 0x2194
	// Code size 151 (0x97)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NegFlag
	IL_000b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::DoNeg
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NotFlag
	IL_001b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::DoNot
	IL_0020:  ldarg 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_002b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_0030:  ldarg 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ArrFlag
	IL_003b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_0040:  ldarg 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.Parser.ParserFlags::ArrSlot
	IL_004b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0050:  ldarg 0

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::RefFlag
	IL_005b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsRef
	IL_0060:  ldarg 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ValinrefFlag
	IL_006b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRef
	IL_0070:  ldarg 0

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_007b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_0080:  ldarg 0

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_008b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::OrdOp
	IL_0090:  ldarg 0

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ret 
    } // end of method ParserFlags::UpdateIdent

    // method line 4
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral UpdateNullLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral id)  cil managed 
    {
        // Method begins at RVA 0x2238
	// Code size 39 (0x27)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_000b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_001b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0020:  ldarg 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ret 
    } // end of method ParserFlags::UpdateNullLit

    // method line 5
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok UpdateMeTok (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok id)  cil managed 
    {
        // Method begins at RVA 0x226c
	// Code size 39 (0x27)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_000b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok::Conv
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_001b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok::TTok
	IL_0020:  ldarg 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ret 
    } // end of method ParserFlags::UpdateMeTok

    // method line 6
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral UpdateCharLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral id)  cil managed 
    {
        // Method begins at RVA 0x22a0
	// Code size 55 (0x37)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_000b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_001b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0020:  ldarg 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_002b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::OrdOp
	IL_0030:  ldarg 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ret 
    } // end of method ParserFlags::UpdateCharLit

    // method line 7
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral UpdateStringLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral id)  cil managed 
    {
        // Method begins at RVA 0x22e4
	// Code size 55 (0x37)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_000b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_001b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0020:  ldarg 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_002b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::OrdOp
	IL_0030:  ldarg 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ret 
    } // end of method ParserFlags::UpdateStringLit

    // method line 8
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral UpdateBoolLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral id)  cil managed 
    {
        // Method begins at RVA 0x2328
	// Code size 71 (0x47)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NotFlag
	IL_000b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::DoNot
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_001b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0020:  ldarg 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_002b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0030:  ldarg 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_003b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::OrdOp
	IL_0040:  ldarg 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  ret 
    } // end of method ParserFlags::UpdateBoolLit

    // method line 9
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral UpdateNumLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral id)  cil managed 
    {
        // Method begins at RVA 0x237c
	// Code size 87 (0x57)
	.maxstack 2
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NegFlag
	IL_000b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNeg
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NotFlag
	IL_001b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::DoNot
	IL_0020:  ldarg 0

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_002b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0030:  ldarg 0

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_003b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0040:  ldarg 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_004b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral::OrdOp
	IL_0050:  ldarg 0

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ret 
    } // end of method ParserFlags::UpdateNumLit

  } // end of class dylan.NET.Tokenizer.Parser.ParserFlags
}

.namespace dylan.NET.Tokenizer.Parser
{
  .class public auto ansi TokenOptimizer
  	extends [mscorlib]System.Object
  {

    // method line 10
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x23e0
	// Code size 22490 (0x57da)
	.maxstack 610
	.locals init (
		int32	V_0,
		bool	V_1,
		string	V_2,
		char[]	V_3,
		bool	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AddOp	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.MulOp	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.SubOp	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.DivOp	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.IncOp	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.DecOp	V_10,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ShlOp	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ShrOp	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.EqOp	V_13,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AssignOp	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ModOp	V_15,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.EqOp	V_16,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LikeOp	V_17,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NegOp	V_18,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NotOp	V_19,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NeqOp	V_20,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NLikeOp	V_21,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NeqOp	V_22,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GeOp	V_23,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LeOp	V_24,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GtOp	V_25,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LtOp	V_26,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AndOp	V_27,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.OrOp	V_28,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NandOp	V_29,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NorOp	V_30,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XorOp	V_31,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XnorOp	V_32,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen	V_33,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen	V_34,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LRSParen	V_35,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Ampersand	V_36,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen	V_37,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RSParen	V_38,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Pipe	V_39,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma	V_40,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.DollarSign	V_41,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LabelTok	V_42,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PlaceTok	V_43,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GotoTok	V_44,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IfTok	V_45,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.UntilTok	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.WhileTok	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseIfTok	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DoTok	V_50,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.BreakTok	V_51,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ContinueTok	V_52,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok	V_53,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrTok	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok	V_56,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NamespaceTok	V_57,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok	V_58,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok	V_59,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok	V_60,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefstdasmTok	V_61,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok	V_62,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IncludeTok	V_63,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok	V_64,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok	V_65,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok	V_66,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok	V_67,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok	V_68,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok	V_69,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok	V_70,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok	V_71,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok	V_72,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok	V_73,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok	V_74,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DelegateTok	V_75,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok	V_76,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok	V_77,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok	V_78,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok	V_79,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok	V_80,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok	V_81,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok	V_82,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr	V_83,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr	V_84,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr	V_85,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr	V_86,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SealedAttr	V_88,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FinalAttr	V_89,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FamilyAttr	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FamORAssemAttr	V_92,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FamANDAssemAttr	V_93,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AssemblyAttr	V_94,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr	V_95,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr	V_96,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr	V_97,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr	V_98,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr	V_99,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok	V_100,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok	V_101,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok	V_102,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok	V_103,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok	V_104,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok	V_105,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok	V_106,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok	V_107,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok	V_108,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok	V_109,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok	V_110,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok	V_111,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok	V_112,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok	V_113,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok	V_114,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok	V_115,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok	V_116,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok	V_117,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_118,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_119,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_120,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_121,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_122,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_123,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_124,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_125,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_126,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral	V_127,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral	V_128,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_129,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral	V_130,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral	V_131,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral	V_132,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral	V_133,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral	V_134,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral	V_135,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_136,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_137)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldstr ""
	IL_001b:  stloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldc.i4 0
	IL_0026:  conv.u 
	IL_0027:  newarr [mscorlib]System.Char
	IL_002c:  stloc 3

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 0
	IL_0037:  stloc 4

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldarg 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0048:  ldstr "+"
	IL_004d:  call int32 string::Compare(string, string)
	IL_0052:  stloc 0

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldloc 0

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldc.i4 0
	IL_0063:  beq IL_006d

	IL_0068:  br IL_00ba

	IL_006d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AddOp::'.ctor'()
	IL_0072:  stloc 5

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldloc 5

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldarg 1

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0089:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_008e:  ldloc 5

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldarg 1

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_009f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00a4:  ldloc 5

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  starg 1

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  br IL_57d3

	IL_00b5:  br IL_00bf

	IL_00ba:  br IL_00bf

	IL_00bf:  ldarg 1

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00ca:  ldstr "*"
	IL_00cf:  call int32 string::Compare(string, string)
	IL_00d4:  stloc 0

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  ldloc 0

	IL_00de:  nop 
	IL_00df:  nop 
	IL_00e0:  ldc.i4 0
	IL_00e5:  beq IL_00ef

	IL_00ea:  br IL_013c

	IL_00ef:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.MulOp::'.ctor'()
	IL_00f4:  stloc 6

	IL_00f8:  nop 
	IL_00f9:  nop 
	IL_00fa:  ldloc 6

	IL_00fe:  nop 
	IL_00ff:  nop 
	IL_0100:  ldarg 1

	IL_0104:  nop 
	IL_0105:  nop 
	IL_0106:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_010b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0110:  ldloc 6

	IL_0114:  nop 
	IL_0115:  nop 
	IL_0116:  ldarg 1

	IL_011a:  nop 
	IL_011b:  nop 
	IL_011c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0121:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0126:  ldloc 6

	IL_012a:  nop 
	IL_012b:  nop 
	IL_012c:  starg 1

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  br IL_57d3

	IL_0137:  br IL_0141

	IL_013c:  br IL_0141

	IL_0141:  ldarg 1

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_014c:  ldstr "-"
	IL_0151:  call int32 string::Compare(string, string)
	IL_0156:  stloc 0

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldloc 0

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldc.i4 0
	IL_0167:  beq IL_0171

	IL_016c:  br IL_01be

	IL_0171:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.SubOp::'.ctor'()
	IL_0176:  stloc 7

	IL_017a:  nop 
	IL_017b:  nop 
	IL_017c:  ldloc 7

	IL_0180:  nop 
	IL_0181:  nop 
	IL_0182:  ldarg 1

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_018d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0192:  ldloc 7

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldarg 1

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01a3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01a8:  ldloc 7

	IL_01ac:  nop 
	IL_01ad:  nop 
	IL_01ae:  starg 1

	IL_01b2:  nop 
	IL_01b3:  nop 
	IL_01b4:  br IL_57d3

	IL_01b9:  br IL_01c3

	IL_01be:  br IL_01c3

	IL_01c3:  ldarg 1

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01ce:  ldstr "/"
	IL_01d3:  call int32 string::Compare(string, string)
	IL_01d8:  stloc 0

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 0

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldc.i4 0
	IL_01e9:  beq IL_01f3

	IL_01ee:  br IL_0240

	IL_01f3:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.DivOp::'.ctor'()
	IL_01f8:  stloc 8

	IL_01fc:  nop 
	IL_01fd:  nop 
	IL_01fe:  ldloc 8

	IL_0202:  nop 
	IL_0203:  nop 
	IL_0204:  ldarg 1

	IL_0208:  nop 
	IL_0209:  nop 
	IL_020a:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_020f:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0214:  ldloc 8

	IL_0218:  nop 
	IL_0219:  nop 
	IL_021a:  ldarg 1

	IL_021e:  nop 
	IL_021f:  nop 
	IL_0220:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0225:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_022a:  ldloc 8

	IL_022e:  nop 
	IL_022f:  nop 
	IL_0230:  starg 1

	IL_0234:  nop 
	IL_0235:  nop 
	IL_0236:  br IL_57d3

	IL_023b:  br IL_0245

	IL_0240:  br IL_0245

	IL_0245:  ldarg 1

	IL_0249:  nop 
	IL_024a:  nop 
	IL_024b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0250:  ldstr "++"
	IL_0255:  call int32 string::Compare(string, string)
	IL_025a:  stloc 0

	IL_025e:  nop 
	IL_025f:  nop 
	IL_0260:  ldloc 0

	IL_0264:  nop 
	IL_0265:  nop 
	IL_0266:  ldc.i4 0
	IL_026b:  beq IL_0275

	IL_0270:  br IL_02c2

	IL_0275:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.IncOp::'.ctor'()
	IL_027a:  stloc 9

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  ldloc 9

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  ldarg 1

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0291:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0296:  ldloc 9

	IL_029a:  nop 
	IL_029b:  nop 
	IL_029c:  ldarg 1

	IL_02a0:  nop 
	IL_02a1:  nop 
	IL_02a2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02a7:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02ac:  ldloc 9

	IL_02b0:  nop 
	IL_02b1:  nop 
	IL_02b2:  starg 1

	IL_02b6:  nop 
	IL_02b7:  nop 
	IL_02b8:  br IL_57d3

	IL_02bd:  br IL_02c7

	IL_02c2:  br IL_02c7

	IL_02c7:  ldarg 1

	IL_02cb:  nop 
	IL_02cc:  nop 
	IL_02cd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02d2:  ldstr "--"
	IL_02d7:  call int32 string::Compare(string, string)
	IL_02dc:  stloc 0

	IL_02e0:  nop 
	IL_02e1:  nop 
	IL_02e2:  ldloc 0

	IL_02e6:  nop 
	IL_02e7:  nop 
	IL_02e8:  ldc.i4 0
	IL_02ed:  beq IL_02f7

	IL_02f2:  br IL_0344

	IL_02f7:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.DecOp::'.ctor'()
	IL_02fc:  stloc 10

	IL_0300:  nop 
	IL_0301:  nop 
	IL_0302:  ldloc 10

	IL_0306:  nop 
	IL_0307:  nop 
	IL_0308:  ldarg 1

	IL_030c:  nop 
	IL_030d:  nop 
	IL_030e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0313:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0318:  ldloc 10

	IL_031c:  nop 
	IL_031d:  nop 
	IL_031e:  ldarg 1

	IL_0322:  nop 
	IL_0323:  nop 
	IL_0324:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0329:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_032e:  ldloc 10

	IL_0332:  nop 
	IL_0333:  nop 
	IL_0334:  starg 1

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  br IL_57d3

	IL_033f:  br IL_0349

	IL_0344:  br IL_0349

	IL_0349:  ldarg 1

	IL_034d:  nop 
	IL_034e:  nop 
	IL_034f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0354:  ldstr "<<"
	IL_0359:  call int32 string::Compare(string, string)
	IL_035e:  stloc 0

	IL_0362:  nop 
	IL_0363:  nop 
	IL_0364:  ldloc 0

	IL_0368:  nop 
	IL_0369:  nop 
	IL_036a:  ldc.i4 0
	IL_036f:  beq IL_0379

	IL_0374:  br IL_03c6

	IL_0379:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ShlOp::'.ctor'()
	IL_037e:  stloc 11

	IL_0382:  nop 
	IL_0383:  nop 
	IL_0384:  ldloc 11

	IL_0388:  nop 
	IL_0389:  nop 
	IL_038a:  ldarg 1

	IL_038e:  nop 
	IL_038f:  nop 
	IL_0390:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0395:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_039a:  ldloc 11

	IL_039e:  nop 
	IL_039f:  nop 
	IL_03a0:  ldarg 1

	IL_03a4:  nop 
	IL_03a5:  nop 
	IL_03a6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03ab:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03b0:  ldloc 11

	IL_03b4:  nop 
	IL_03b5:  nop 
	IL_03b6:  starg 1

	IL_03ba:  nop 
	IL_03bb:  nop 
	IL_03bc:  br IL_57d3

	IL_03c1:  br IL_03cb

	IL_03c6:  br IL_03cb

	IL_03cb:  ldarg 1

	IL_03cf:  nop 
	IL_03d0:  nop 
	IL_03d1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03d6:  ldstr ">>"
	IL_03db:  call int32 string::Compare(string, string)
	IL_03e0:  stloc 0

	IL_03e4:  nop 
	IL_03e5:  nop 
	IL_03e6:  ldloc 0

	IL_03ea:  nop 
	IL_03eb:  nop 
	IL_03ec:  ldc.i4 0
	IL_03f1:  beq IL_03fb

	IL_03f6:  br IL_0448

	IL_03fb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ShrOp::'.ctor'()
	IL_0400:  stloc 12

	IL_0404:  nop 
	IL_0405:  nop 
	IL_0406:  ldloc 12

	IL_040a:  nop 
	IL_040b:  nop 
	IL_040c:  ldarg 1

	IL_0410:  nop 
	IL_0411:  nop 
	IL_0412:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0417:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_041c:  ldloc 12

	IL_0420:  nop 
	IL_0421:  nop 
	IL_0422:  ldarg 1

	IL_0426:  nop 
	IL_0427:  nop 
	IL_0428:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_042d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0432:  ldloc 12

	IL_0436:  nop 
	IL_0437:  nop 
	IL_0438:  starg 1

	IL_043c:  nop 
	IL_043d:  nop 
	IL_043e:  br IL_57d3

	IL_0443:  br IL_044d

	IL_0448:  br IL_044d

	IL_044d:  ldarg 1

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0458:  ldstr "="
	IL_045d:  call int32 string::Compare(string, string)
	IL_0462:  stloc 0

	IL_0466:  nop 
	IL_0467:  nop 
	IL_0468:  ldloc 0

	IL_046c:  nop 
	IL_046d:  nop 
	IL_046e:  ldc.i4 0
	IL_0473:  beq IL_047d

	IL_0478:  br IL_052b

	IL_047d:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_0482:  ldc.i4 1
	IL_0487:  beq IL_0491

	IL_048c:  br IL_04d9

	IL_0491:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.EqOp::'.ctor'()
	IL_0496:  stloc 13

	IL_049a:  nop 
	IL_049b:  nop 
	IL_049c:  ldloc 13

	IL_04a0:  nop 
	IL_04a1:  nop 
	IL_04a2:  ldarg 1

	IL_04a6:  nop 
	IL_04a7:  nop 
	IL_04a8:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_04ad:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_04b2:  ldloc 13

	IL_04b6:  nop 
	IL_04b7:  nop 
	IL_04b8:  ldarg 1

	IL_04bc:  nop 
	IL_04bd:  nop 
	IL_04be:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_04c3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_04c8:  ldloc 13

	IL_04cc:  nop 
	IL_04cd:  nop 
	IL_04ce:  starg 1

	IL_04d2:  nop 
	IL_04d3:  nop 
	IL_04d4:  br IL_0521

	IL_04d9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AssignOp::'.ctor'()
	IL_04de:  stloc 14

	IL_04e2:  nop 
	IL_04e3:  nop 
	IL_04e4:  ldloc 14

	IL_04e8:  nop 
	IL_04e9:  nop 
	IL_04ea:  ldarg 1

	IL_04ee:  nop 
	IL_04ef:  nop 
	IL_04f0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_04f5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_04fa:  ldloc 14

	IL_04fe:  nop 
	IL_04ff:  nop 
	IL_0500:  ldarg 1

	IL_0504:  nop 
	IL_0505:  nop 
	IL_0506:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_050b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0510:  ldloc 14

	IL_0514:  nop 
	IL_0515:  nop 
	IL_0516:  starg 1

	IL_051a:  nop 
	IL_051b:  nop 
	IL_051c:  br IL_0521

	IL_0521:  br IL_57d3

	IL_0526:  br IL_0530

	IL_052b:  br IL_0530

	IL_0530:  ldarg 1

	IL_0534:  nop 
	IL_0535:  nop 
	IL_0536:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_053b:  ldstr "%"
	IL_0540:  call int32 string::Compare(string, string)
	IL_0545:  stloc 0

	IL_0549:  nop 
	IL_054a:  nop 
	IL_054b:  ldloc 0

	IL_054f:  nop 
	IL_0550:  nop 
	IL_0551:  ldc.i4 0
	IL_0556:  beq IL_0560

	IL_055b:  br IL_05ad

	IL_0560:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ModOp::'.ctor'()
	IL_0565:  stloc 15

	IL_0569:  nop 
	IL_056a:  nop 
	IL_056b:  ldloc 15

	IL_056f:  nop 
	IL_0570:  nop 
	IL_0571:  ldarg 1

	IL_0575:  nop 
	IL_0576:  nop 
	IL_0577:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_057c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0581:  ldloc 15

	IL_0585:  nop 
	IL_0586:  nop 
	IL_0587:  ldarg 1

	IL_058b:  nop 
	IL_058c:  nop 
	IL_058d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0592:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0597:  ldloc 15

	IL_059b:  nop 
	IL_059c:  nop 
	IL_059d:  starg 1

	IL_05a1:  nop 
	IL_05a2:  nop 
	IL_05a3:  br IL_57d3

	IL_05a8:  br IL_05b2

	IL_05ad:  br IL_05b2

	IL_05b2:  ldarg 1

	IL_05b6:  nop 
	IL_05b7:  nop 
	IL_05b8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_05bd:  ldstr "=="
	IL_05c2:  call int32 string::Compare(string, string)
	IL_05c7:  stloc 0

	IL_05cb:  nop 
	IL_05cc:  nop 
	IL_05cd:  ldloc 0

	IL_05d1:  nop 
	IL_05d2:  nop 
	IL_05d3:  ldc.i4 0
	IL_05d8:  beq IL_05e2

	IL_05dd:  br IL_062f

	IL_05e2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.EqOp::'.ctor'()
	IL_05e7:  stloc 16

	IL_05eb:  nop 
	IL_05ec:  nop 
	IL_05ed:  ldloc 16

	IL_05f1:  nop 
	IL_05f2:  nop 
	IL_05f3:  ldarg 1

	IL_05f7:  nop 
	IL_05f8:  nop 
	IL_05f9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_05fe:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0603:  ldloc 16

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  ldarg 1

	IL_060d:  nop 
	IL_060e:  nop 
	IL_060f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0614:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0619:  ldloc 16

	IL_061d:  nop 
	IL_061e:  nop 
	IL_061f:  starg 1

	IL_0623:  nop 
	IL_0624:  nop 
	IL_0625:  br IL_57d3

	IL_062a:  br IL_0634

	IL_062f:  br IL_0634

	IL_0634:  ldarg 1

	IL_0638:  nop 
	IL_0639:  nop 
	IL_063a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_063f:  ldstr "like"
	IL_0644:  call int32 string::Compare(string, string)
	IL_0649:  stloc 0

	IL_064d:  nop 
	IL_064e:  nop 
	IL_064f:  ldloc 0

	IL_0653:  nop 
	IL_0654:  nop 
	IL_0655:  ldc.i4 0
	IL_065a:  beq IL_0664

	IL_065f:  br IL_06b1

	IL_0664:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LikeOp::'.ctor'()
	IL_0669:  stloc 17

	IL_066d:  nop 
	IL_066e:  nop 
	IL_066f:  ldloc 17

	IL_0673:  nop 
	IL_0674:  nop 
	IL_0675:  ldarg 1

	IL_0679:  nop 
	IL_067a:  nop 
	IL_067b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0680:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0685:  ldloc 17

	IL_0689:  nop 
	IL_068a:  nop 
	IL_068b:  ldarg 1

	IL_068f:  nop 
	IL_0690:  nop 
	IL_0691:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0696:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_069b:  ldloc 17

	IL_069f:  nop 
	IL_06a0:  nop 
	IL_06a1:  starg 1

	IL_06a5:  nop 
	IL_06a6:  nop 
	IL_06a7:  br IL_57d3

	IL_06ac:  br IL_06b6

	IL_06b1:  br IL_06b6

	IL_06b6:  ldarg 1

	IL_06ba:  nop 
	IL_06bb:  nop 
	IL_06bc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_06c1:  ldstr "!"
	IL_06c6:  call int32 string::Compare(string, string)
	IL_06cb:  stloc 0

	IL_06cf:  nop 
	IL_06d0:  nop 
	IL_06d1:  ldloc 0

	IL_06d5:  nop 
	IL_06d6:  nop 
	IL_06d7:  ldc.i4 0
	IL_06dc:  beq IL_06e6

	IL_06e1:  br IL_0733

	IL_06e6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NegOp::'.ctor'()
	IL_06eb:  stloc 18

	IL_06ef:  nop 
	IL_06f0:  nop 
	IL_06f1:  ldloc 18

	IL_06f5:  nop 
	IL_06f6:  nop 
	IL_06f7:  ldarg 1

	IL_06fb:  nop 
	IL_06fc:  nop 
	IL_06fd:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0702:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0707:  ldloc 18

	IL_070b:  nop 
	IL_070c:  nop 
	IL_070d:  ldarg 1

	IL_0711:  nop 
	IL_0712:  nop 
	IL_0713:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0718:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_071d:  ldloc 18

	IL_0721:  nop 
	IL_0722:  nop 
	IL_0723:  starg 1

	IL_0727:  nop 
	IL_0728:  nop 
	IL_0729:  br IL_57d3

	IL_072e:  br IL_0738

	IL_0733:  br IL_0738

	IL_0738:  ldarg 1

	IL_073c:  nop 
	IL_073d:  nop 
	IL_073e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0743:  ldstr "~"
	IL_0748:  call int32 string::Compare(string, string)
	IL_074d:  stloc 0

	IL_0751:  nop 
	IL_0752:  nop 
	IL_0753:  ldloc 0

	IL_0757:  nop 
	IL_0758:  nop 
	IL_0759:  ldc.i4 0
	IL_075e:  beq IL_0768

	IL_0763:  br IL_07b5

	IL_0768:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NotOp::'.ctor'()
	IL_076d:  stloc 19

	IL_0771:  nop 
	IL_0772:  nop 
	IL_0773:  ldloc 19

	IL_0777:  nop 
	IL_0778:  nop 
	IL_0779:  ldarg 1

	IL_077d:  nop 
	IL_077e:  nop 
	IL_077f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0784:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0789:  ldloc 19

	IL_078d:  nop 
	IL_078e:  nop 
	IL_078f:  ldarg 1

	IL_0793:  nop 
	IL_0794:  nop 
	IL_0795:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_079a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_079f:  ldloc 19

	IL_07a3:  nop 
	IL_07a4:  nop 
	IL_07a5:  starg 1

	IL_07a9:  nop 
	IL_07aa:  nop 
	IL_07ab:  br IL_57d3

	IL_07b0:  br IL_07ba

	IL_07b5:  br IL_07ba

	IL_07ba:  ldarg 1

	IL_07be:  nop 
	IL_07bf:  nop 
	IL_07c0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_07c5:  ldstr "!="
	IL_07ca:  call int32 string::Compare(string, string)
	IL_07cf:  stloc 0

	IL_07d3:  nop 
	IL_07d4:  nop 
	IL_07d5:  ldloc 0

	IL_07d9:  nop 
	IL_07da:  nop 
	IL_07db:  ldc.i4 0
	IL_07e0:  beq IL_07ea

	IL_07e5:  br IL_0837

	IL_07ea:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NeqOp::'.ctor'()
	IL_07ef:  stloc 20

	IL_07f3:  nop 
	IL_07f4:  nop 
	IL_07f5:  ldloc 20

	IL_07f9:  nop 
	IL_07fa:  nop 
	IL_07fb:  ldarg 1

	IL_07ff:  nop 
	IL_0800:  nop 
	IL_0801:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0806:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_080b:  ldloc 20

	IL_080f:  nop 
	IL_0810:  nop 
	IL_0811:  ldarg 1

	IL_0815:  nop 
	IL_0816:  nop 
	IL_0817:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_081c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0821:  ldloc 20

	IL_0825:  nop 
	IL_0826:  nop 
	IL_0827:  starg 1

	IL_082b:  nop 
	IL_082c:  nop 
	IL_082d:  br IL_57d3

	IL_0832:  br IL_083c

	IL_0837:  br IL_083c

	IL_083c:  ldarg 1

	IL_0840:  nop 
	IL_0841:  nop 
	IL_0842:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0847:  ldstr "notlike"
	IL_084c:  call int32 string::Compare(string, string)
	IL_0851:  stloc 0

	IL_0855:  nop 
	IL_0856:  nop 
	IL_0857:  ldloc 0

	IL_085b:  nop 
	IL_085c:  nop 
	IL_085d:  ldc.i4 0
	IL_0862:  beq IL_086c

	IL_0867:  br IL_08b9

	IL_086c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NLikeOp::'.ctor'()
	IL_0871:  stloc 21

	IL_0875:  nop 
	IL_0876:  nop 
	IL_0877:  ldloc 21

	IL_087b:  nop 
	IL_087c:  nop 
	IL_087d:  ldarg 1

	IL_0881:  nop 
	IL_0882:  nop 
	IL_0883:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0888:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_088d:  ldloc 21

	IL_0891:  nop 
	IL_0892:  nop 
	IL_0893:  ldarg 1

	IL_0897:  nop 
	IL_0898:  nop 
	IL_0899:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_089e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_08a3:  ldloc 21

	IL_08a7:  nop 
	IL_08a8:  nop 
	IL_08a9:  starg 1

	IL_08ad:  nop 
	IL_08ae:  nop 
	IL_08af:  br IL_57d3

	IL_08b4:  br IL_08be

	IL_08b9:  br IL_08be

	IL_08be:  ldarg 1

	IL_08c2:  nop 
	IL_08c3:  nop 
	IL_08c4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_08c9:  ldstr "<>"
	IL_08ce:  call int32 string::Compare(string, string)
	IL_08d3:  stloc 0

	IL_08d7:  nop 
	IL_08d8:  nop 
	IL_08d9:  ldloc 0

	IL_08dd:  nop 
	IL_08de:  nop 
	IL_08df:  ldc.i4 0
	IL_08e4:  beq IL_08ee

	IL_08e9:  br IL_093b

	IL_08ee:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NeqOp::'.ctor'()
	IL_08f3:  stloc 22

	IL_08f7:  nop 
	IL_08f8:  nop 
	IL_08f9:  ldloc 22

	IL_08fd:  nop 
	IL_08fe:  nop 
	IL_08ff:  ldarg 1

	IL_0903:  nop 
	IL_0904:  nop 
	IL_0905:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_090a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_090f:  ldloc 22

	IL_0913:  nop 
	IL_0914:  nop 
	IL_0915:  ldarg 1

	IL_0919:  nop 
	IL_091a:  nop 
	IL_091b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0920:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0925:  ldloc 22

	IL_0929:  nop 
	IL_092a:  nop 
	IL_092b:  starg 1

	IL_092f:  nop 
	IL_0930:  nop 
	IL_0931:  br IL_57d3

	IL_0936:  br IL_0940

	IL_093b:  br IL_0940

	IL_0940:  ldarg 1

	IL_0944:  nop 
	IL_0945:  nop 
	IL_0946:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_094b:  ldstr ">="
	IL_0950:  call int32 string::Compare(string, string)
	IL_0955:  stloc 0

	IL_0959:  nop 
	IL_095a:  nop 
	IL_095b:  ldloc 0

	IL_095f:  nop 
	IL_0960:  nop 
	IL_0961:  ldc.i4 0
	IL_0966:  beq IL_0970

	IL_096b:  br IL_09bd

	IL_0970:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GeOp::'.ctor'()
	IL_0975:  stloc 23

	IL_0979:  nop 
	IL_097a:  nop 
	IL_097b:  ldloc 23

	IL_097f:  nop 
	IL_0980:  nop 
	IL_0981:  ldarg 1

	IL_0985:  nop 
	IL_0986:  nop 
	IL_0987:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_098c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0991:  ldloc 23

	IL_0995:  nop 
	IL_0996:  nop 
	IL_0997:  ldarg 1

	IL_099b:  nop 
	IL_099c:  nop 
	IL_099d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_09a2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_09a7:  ldloc 23

	IL_09ab:  nop 
	IL_09ac:  nop 
	IL_09ad:  starg 1

	IL_09b1:  nop 
	IL_09b2:  nop 
	IL_09b3:  br IL_57d3

	IL_09b8:  br IL_09c2

	IL_09bd:  br IL_09c2

	IL_09c2:  ldarg 1

	IL_09c6:  nop 
	IL_09c7:  nop 
	IL_09c8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_09cd:  ldstr "<="
	IL_09d2:  call int32 string::Compare(string, string)
	IL_09d7:  stloc 0

	IL_09db:  nop 
	IL_09dc:  nop 
	IL_09dd:  ldloc 0

	IL_09e1:  nop 
	IL_09e2:  nop 
	IL_09e3:  ldc.i4 0
	IL_09e8:  beq IL_09f2

	IL_09ed:  br IL_0a3f

	IL_09f2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LeOp::'.ctor'()
	IL_09f7:  stloc 24

	IL_09fb:  nop 
	IL_09fc:  nop 
	IL_09fd:  ldloc 24

	IL_0a01:  nop 
	IL_0a02:  nop 
	IL_0a03:  ldarg 1

	IL_0a07:  nop 
	IL_0a08:  nop 
	IL_0a09:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0a0e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0a13:  ldloc 24

	IL_0a17:  nop 
	IL_0a18:  nop 
	IL_0a19:  ldarg 1

	IL_0a1d:  nop 
	IL_0a1e:  nop 
	IL_0a1f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0a24:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0a29:  ldloc 24

	IL_0a2d:  nop 
	IL_0a2e:  nop 
	IL_0a2f:  starg 1

	IL_0a33:  nop 
	IL_0a34:  nop 
	IL_0a35:  br IL_57d3

	IL_0a3a:  br IL_0a44

	IL_0a3f:  br IL_0a44

	IL_0a44:  ldarg 1

	IL_0a48:  nop 
	IL_0a49:  nop 
	IL_0a4a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0a4f:  ldstr ">"
	IL_0a54:  call int32 string::Compare(string, string)
	IL_0a59:  stloc 0

	IL_0a5d:  nop 
	IL_0a5e:  nop 
	IL_0a5f:  ldloc 0

	IL_0a63:  nop 
	IL_0a64:  nop 
	IL_0a65:  ldc.i4 0
	IL_0a6a:  beq IL_0a74

	IL_0a6f:  br IL_0ac1

	IL_0a74:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GtOp::'.ctor'()
	IL_0a79:  stloc 25

	IL_0a7d:  nop 
	IL_0a7e:  nop 
	IL_0a7f:  ldloc 25

	IL_0a83:  nop 
	IL_0a84:  nop 
	IL_0a85:  ldarg 1

	IL_0a89:  nop 
	IL_0a8a:  nop 
	IL_0a8b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0a90:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0a95:  ldloc 25

	IL_0a99:  nop 
	IL_0a9a:  nop 
	IL_0a9b:  ldarg 1

	IL_0a9f:  nop 
	IL_0aa0:  nop 
	IL_0aa1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0aa6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0aab:  ldloc 25

	IL_0aaf:  nop 
	IL_0ab0:  nop 
	IL_0ab1:  starg 1

	IL_0ab5:  nop 
	IL_0ab6:  nop 
	IL_0ab7:  br IL_57d3

	IL_0abc:  br IL_0ac6

	IL_0ac1:  br IL_0ac6

	IL_0ac6:  ldarg 1

	IL_0aca:  nop 
	IL_0acb:  nop 
	IL_0acc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ad1:  ldstr "<"
	IL_0ad6:  call int32 string::Compare(string, string)
	IL_0adb:  stloc 0

	IL_0adf:  nop 
	IL_0ae0:  nop 
	IL_0ae1:  ldloc 0

	IL_0ae5:  nop 
	IL_0ae6:  nop 
	IL_0ae7:  ldc.i4 0
	IL_0aec:  beq IL_0af6

	IL_0af1:  br IL_0b43

	IL_0af6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LtOp::'.ctor'()
	IL_0afb:  stloc 26

	IL_0aff:  nop 
	IL_0b00:  nop 
	IL_0b01:  ldloc 26

	IL_0b05:  nop 
	IL_0b06:  nop 
	IL_0b07:  ldarg 1

	IL_0b0b:  nop 
	IL_0b0c:  nop 
	IL_0b0d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0b12:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0b17:  ldloc 26

	IL_0b1b:  nop 
	IL_0b1c:  nop 
	IL_0b1d:  ldarg 1

	IL_0b21:  nop 
	IL_0b22:  nop 
	IL_0b23:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0b28:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0b2d:  ldloc 26

	IL_0b31:  nop 
	IL_0b32:  nop 
	IL_0b33:  starg 1

	IL_0b37:  nop 
	IL_0b38:  nop 
	IL_0b39:  br IL_57d3

	IL_0b3e:  br IL_0b48

	IL_0b43:  br IL_0b48

	IL_0b48:  ldarg 1

	IL_0b4c:  nop 
	IL_0b4d:  nop 
	IL_0b4e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0b53:  ldstr "and"
	IL_0b58:  call int32 string::Compare(string, string)
	IL_0b5d:  stloc 0

	IL_0b61:  nop 
	IL_0b62:  nop 
	IL_0b63:  ldloc 0

	IL_0b67:  nop 
	IL_0b68:  nop 
	IL_0b69:  ldc.i4 0
	IL_0b6e:  beq IL_0b78

	IL_0b73:  br IL_0bc5

	IL_0b78:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AndOp::'.ctor'()
	IL_0b7d:  stloc 27

	IL_0b81:  nop 
	IL_0b82:  nop 
	IL_0b83:  ldloc 27

	IL_0b87:  nop 
	IL_0b88:  nop 
	IL_0b89:  ldarg 1

	IL_0b8d:  nop 
	IL_0b8e:  nop 
	IL_0b8f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0b94:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0b99:  ldloc 27

	IL_0b9d:  nop 
	IL_0b9e:  nop 
	IL_0b9f:  ldarg 1

	IL_0ba3:  nop 
	IL_0ba4:  nop 
	IL_0ba5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0baa:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0baf:  ldloc 27

	IL_0bb3:  nop 
	IL_0bb4:  nop 
	IL_0bb5:  starg 1

	IL_0bb9:  nop 
	IL_0bba:  nop 
	IL_0bbb:  br IL_57d3

	IL_0bc0:  br IL_0bca

	IL_0bc5:  br IL_0bca

	IL_0bca:  ldarg 1

	IL_0bce:  nop 
	IL_0bcf:  nop 
	IL_0bd0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0bd5:  ldstr "or"
	IL_0bda:  call int32 string::Compare(string, string)
	IL_0bdf:  stloc 0

	IL_0be3:  nop 
	IL_0be4:  nop 
	IL_0be5:  ldloc 0

	IL_0be9:  nop 
	IL_0bea:  nop 
	IL_0beb:  ldc.i4 0
	IL_0bf0:  beq IL_0bfa

	IL_0bf5:  br IL_0c47

	IL_0bfa:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.OrOp::'.ctor'()
	IL_0bff:  stloc 28

	IL_0c03:  nop 
	IL_0c04:  nop 
	IL_0c05:  ldloc 28

	IL_0c09:  nop 
	IL_0c0a:  nop 
	IL_0c0b:  ldarg 1

	IL_0c0f:  nop 
	IL_0c10:  nop 
	IL_0c11:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0c16:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0c1b:  ldloc 28

	IL_0c1f:  nop 
	IL_0c20:  nop 
	IL_0c21:  ldarg 1

	IL_0c25:  nop 
	IL_0c26:  nop 
	IL_0c27:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0c2c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0c31:  ldloc 28

	IL_0c35:  nop 
	IL_0c36:  nop 
	IL_0c37:  starg 1

	IL_0c3b:  nop 
	IL_0c3c:  nop 
	IL_0c3d:  br IL_57d3

	IL_0c42:  br IL_0c4c

	IL_0c47:  br IL_0c4c

	IL_0c4c:  ldarg 1

	IL_0c50:  nop 
	IL_0c51:  nop 
	IL_0c52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0c57:  ldstr "nand"
	IL_0c5c:  call int32 string::Compare(string, string)
	IL_0c61:  stloc 0

	IL_0c65:  nop 
	IL_0c66:  nop 
	IL_0c67:  ldloc 0

	IL_0c6b:  nop 
	IL_0c6c:  nop 
	IL_0c6d:  ldc.i4 0
	IL_0c72:  beq IL_0c7c

	IL_0c77:  br IL_0cc9

	IL_0c7c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NandOp::'.ctor'()
	IL_0c81:  stloc 29

	IL_0c85:  nop 
	IL_0c86:  nop 
	IL_0c87:  ldloc 29

	IL_0c8b:  nop 
	IL_0c8c:  nop 
	IL_0c8d:  ldarg 1

	IL_0c91:  nop 
	IL_0c92:  nop 
	IL_0c93:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0c98:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0c9d:  ldloc 29

	IL_0ca1:  nop 
	IL_0ca2:  nop 
	IL_0ca3:  ldarg 1

	IL_0ca7:  nop 
	IL_0ca8:  nop 
	IL_0ca9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0cae:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0cb3:  ldloc 29

	IL_0cb7:  nop 
	IL_0cb8:  nop 
	IL_0cb9:  starg 1

	IL_0cbd:  nop 
	IL_0cbe:  nop 
	IL_0cbf:  br IL_57d3

	IL_0cc4:  br IL_0cce

	IL_0cc9:  br IL_0cce

	IL_0cce:  ldarg 1

	IL_0cd2:  nop 
	IL_0cd3:  nop 
	IL_0cd4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0cd9:  ldstr "nor"
	IL_0cde:  call int32 string::Compare(string, string)
	IL_0ce3:  stloc 0

	IL_0ce7:  nop 
	IL_0ce8:  nop 
	IL_0ce9:  ldloc 0

	IL_0ced:  nop 
	IL_0cee:  nop 
	IL_0cef:  ldc.i4 0
	IL_0cf4:  beq IL_0cfe

	IL_0cf9:  br IL_0d4b

	IL_0cfe:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NorOp::'.ctor'()
	IL_0d03:  stloc 30

	IL_0d07:  nop 
	IL_0d08:  nop 
	IL_0d09:  ldloc 30

	IL_0d0d:  nop 
	IL_0d0e:  nop 
	IL_0d0f:  ldarg 1

	IL_0d13:  nop 
	IL_0d14:  nop 
	IL_0d15:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0d1a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0d1f:  ldloc 30

	IL_0d23:  nop 
	IL_0d24:  nop 
	IL_0d25:  ldarg 1

	IL_0d29:  nop 
	IL_0d2a:  nop 
	IL_0d2b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0d30:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0d35:  ldloc 30

	IL_0d39:  nop 
	IL_0d3a:  nop 
	IL_0d3b:  starg 1

	IL_0d3f:  nop 
	IL_0d40:  nop 
	IL_0d41:  br IL_57d3

	IL_0d46:  br IL_0d50

	IL_0d4b:  br IL_0d50

	IL_0d50:  ldarg 1

	IL_0d54:  nop 
	IL_0d55:  nop 
	IL_0d56:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0d5b:  ldstr "xor"
	IL_0d60:  call int32 string::Compare(string, string)
	IL_0d65:  stloc 0

	IL_0d69:  nop 
	IL_0d6a:  nop 
	IL_0d6b:  ldloc 0

	IL_0d6f:  nop 
	IL_0d70:  nop 
	IL_0d71:  ldc.i4 0
	IL_0d76:  beq IL_0d80

	IL_0d7b:  br IL_0dcd

	IL_0d80:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XorOp::'.ctor'()
	IL_0d85:  stloc 31

	IL_0d89:  nop 
	IL_0d8a:  nop 
	IL_0d8b:  ldloc 31

	IL_0d8f:  nop 
	IL_0d90:  nop 
	IL_0d91:  ldarg 1

	IL_0d95:  nop 
	IL_0d96:  nop 
	IL_0d97:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0d9c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0da1:  ldloc 31

	IL_0da5:  nop 
	IL_0da6:  nop 
	IL_0da7:  ldarg 1

	IL_0dab:  nop 
	IL_0dac:  nop 
	IL_0dad:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0db2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0db7:  ldloc 31

	IL_0dbb:  nop 
	IL_0dbc:  nop 
	IL_0dbd:  starg 1

	IL_0dc1:  nop 
	IL_0dc2:  nop 
	IL_0dc3:  br IL_57d3

	IL_0dc8:  br IL_0dd2

	IL_0dcd:  br IL_0dd2

	IL_0dd2:  ldarg 1

	IL_0dd6:  nop 
	IL_0dd7:  nop 
	IL_0dd8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ddd:  ldstr "xnor"
	IL_0de2:  call int32 string::Compare(string, string)
	IL_0de7:  stloc 0

	IL_0deb:  nop 
	IL_0dec:  nop 
	IL_0ded:  ldloc 0

	IL_0df1:  nop 
	IL_0df2:  nop 
	IL_0df3:  ldc.i4 0
	IL_0df8:  beq IL_0e02

	IL_0dfd:  br IL_0e4f

	IL_0e02:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XnorOp::'.ctor'()
	IL_0e07:  stloc 32

	IL_0e0b:  nop 
	IL_0e0c:  nop 
	IL_0e0d:  ldloc 32

	IL_0e11:  nop 
	IL_0e12:  nop 
	IL_0e13:  ldarg 1

	IL_0e17:  nop 
	IL_0e18:  nop 
	IL_0e19:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0e1e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0e23:  ldloc 32

	IL_0e27:  nop 
	IL_0e28:  nop 
	IL_0e29:  ldarg 1

	IL_0e2d:  nop 
	IL_0e2e:  nop 
	IL_0e2f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0e34:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0e39:  ldloc 32

	IL_0e3d:  nop 
	IL_0e3e:  nop 
	IL_0e3f:  starg 1

	IL_0e43:  nop 
	IL_0e44:  nop 
	IL_0e45:  br IL_57d3

	IL_0e4a:  br IL_0e54

	IL_0e4f:  br IL_0e54

	IL_0e54:  ldarg 1

	IL_0e58:  nop 
	IL_0e59:  nop 
	IL_0e5a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0e5f:  ldstr "("
	IL_0e64:  call int32 string::Compare(string, string)
	IL_0e69:  stloc 0

	IL_0e6d:  nop 
	IL_0e6e:  nop 
	IL_0e6f:  ldloc 0

	IL_0e73:  nop 
	IL_0e74:  nop 
	IL_0e75:  ldc.i4 0
	IL_0e7a:  beq IL_0e84

	IL_0e7f:  br IL_0ed1

	IL_0e84:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen::'.ctor'()
	IL_0e89:  stloc 33

	IL_0e8d:  nop 
	IL_0e8e:  nop 
	IL_0e8f:  ldloc 33

	IL_0e93:  nop 
	IL_0e94:  nop 
	IL_0e95:  ldarg 1

	IL_0e99:  nop 
	IL_0e9a:  nop 
	IL_0e9b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0ea0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0ea5:  ldloc 33

	IL_0ea9:  nop 
	IL_0eaa:  nop 
	IL_0eab:  ldarg 1

	IL_0eaf:  nop 
	IL_0eb0:  nop 
	IL_0eb1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0eb6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ebb:  ldloc 33

	IL_0ebf:  nop 
	IL_0ec0:  nop 
	IL_0ec1:  starg 1

	IL_0ec5:  nop 
	IL_0ec6:  nop 
	IL_0ec7:  br IL_57d3

	IL_0ecc:  br IL_0ed6

	IL_0ed1:  br IL_0ed6

	IL_0ed6:  ldarg 1

	IL_0eda:  nop 
	IL_0edb:  nop 
	IL_0edc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ee1:  ldstr ")"
	IL_0ee6:  call int32 string::Compare(string, string)
	IL_0eeb:  stloc 0

	IL_0eef:  nop 
	IL_0ef0:  nop 
	IL_0ef1:  ldloc 0

	IL_0ef5:  nop 
	IL_0ef6:  nop 
	IL_0ef7:  ldc.i4 0
	IL_0efc:  beq IL_0f06

	IL_0f01:  br IL_0f53

	IL_0f06:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen::'.ctor'()
	IL_0f0b:  stloc 34

	IL_0f0f:  nop 
	IL_0f10:  nop 
	IL_0f11:  ldloc 34

	IL_0f15:  nop 
	IL_0f16:  nop 
	IL_0f17:  ldarg 1

	IL_0f1b:  nop 
	IL_0f1c:  nop 
	IL_0f1d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0f22:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0f27:  ldloc 34

	IL_0f2b:  nop 
	IL_0f2c:  nop 
	IL_0f2d:  ldarg 1

	IL_0f31:  nop 
	IL_0f32:  nop 
	IL_0f33:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0f38:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0f3d:  ldloc 34

	IL_0f41:  nop 
	IL_0f42:  nop 
	IL_0f43:  starg 1

	IL_0f47:  nop 
	IL_0f48:  nop 
	IL_0f49:  br IL_57d3

	IL_0f4e:  br IL_0f58

	IL_0f53:  br IL_0f58

	IL_0f58:  ldarg 1

	IL_0f5c:  nop 
	IL_0f5d:  nop 
	IL_0f5e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0f63:  ldstr "[]"
	IL_0f68:  call int32 string::Compare(string, string)
	IL_0f6d:  stloc 0

	IL_0f71:  nop 
	IL_0f72:  nop 
	IL_0f73:  ldloc 0

	IL_0f77:  nop 
	IL_0f78:  nop 
	IL_0f79:  ldc.i4 0
	IL_0f7e:  beq IL_0f88

	IL_0f83:  br IL_0fd5

	IL_0f88:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LRSParen::'.ctor'()
	IL_0f8d:  stloc 35

	IL_0f91:  nop 
	IL_0f92:  nop 
	IL_0f93:  ldloc 35

	IL_0f97:  nop 
	IL_0f98:  nop 
	IL_0f99:  ldarg 1

	IL_0f9d:  nop 
	IL_0f9e:  nop 
	IL_0f9f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0fa4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0fa9:  ldloc 35

	IL_0fad:  nop 
	IL_0fae:  nop 
	IL_0faf:  ldarg 1

	IL_0fb3:  nop 
	IL_0fb4:  nop 
	IL_0fb5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0fba:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0fbf:  ldloc 35

	IL_0fc3:  nop 
	IL_0fc4:  nop 
	IL_0fc5:  starg 1

	IL_0fc9:  nop 
	IL_0fca:  nop 
	IL_0fcb:  br IL_57d3

	IL_0fd0:  br IL_0fda

	IL_0fd5:  br IL_0fda

	IL_0fda:  ldarg 1

	IL_0fde:  nop 
	IL_0fdf:  nop 
	IL_0fe0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0fe5:  ldstr "&"
	IL_0fea:  call int32 string::Compare(string, string)
	IL_0fef:  stloc 0

	IL_0ff3:  nop 
	IL_0ff4:  nop 
	IL_0ff5:  ldloc 0

	IL_0ff9:  nop 
	IL_0ffa:  nop 
	IL_0ffb:  ldc.i4 0
	IL_1000:  beq IL_100a

	IL_1005:  br IL_1057

	IL_100a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Ampersand::'.ctor'()
	IL_100f:  stloc 36

	IL_1013:  nop 
	IL_1014:  nop 
	IL_1015:  ldloc 36

	IL_1019:  nop 
	IL_101a:  nop 
	IL_101b:  ldarg 1

	IL_101f:  nop 
	IL_1020:  nop 
	IL_1021:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1026:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_102b:  ldloc 36

	IL_102f:  nop 
	IL_1030:  nop 
	IL_1031:  ldarg 1

	IL_1035:  nop 
	IL_1036:  nop 
	IL_1037:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_103c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1041:  ldloc 36

	IL_1045:  nop 
	IL_1046:  nop 
	IL_1047:  starg 1

	IL_104b:  nop 
	IL_104c:  nop 
	IL_104d:  br IL_57d3

	IL_1052:  br IL_105c

	IL_1057:  br IL_105c

	IL_105c:  ldarg 1

	IL_1060:  nop 
	IL_1061:  nop 
	IL_1062:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1067:  ldstr "["
	IL_106c:  call int32 string::Compare(string, string)
	IL_1071:  stloc 0

	IL_1075:  nop 
	IL_1076:  nop 
	IL_1077:  ldloc 0

	IL_107b:  nop 
	IL_107c:  nop 
	IL_107d:  ldc.i4 0
	IL_1082:  beq IL_108c

	IL_1087:  br IL_10d9

	IL_108c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen::'.ctor'()
	IL_1091:  stloc 37

	IL_1095:  nop 
	IL_1096:  nop 
	IL_1097:  ldloc 37

	IL_109b:  nop 
	IL_109c:  nop 
	IL_109d:  ldarg 1

	IL_10a1:  nop 
	IL_10a2:  nop 
	IL_10a3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_10a8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_10ad:  ldloc 37

	IL_10b1:  nop 
	IL_10b2:  nop 
	IL_10b3:  ldarg 1

	IL_10b7:  nop 
	IL_10b8:  nop 
	IL_10b9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_10be:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_10c3:  ldloc 37

	IL_10c7:  nop 
	IL_10c8:  nop 
	IL_10c9:  starg 1

	IL_10cd:  nop 
	IL_10ce:  nop 
	IL_10cf:  br IL_57d3

	IL_10d4:  br IL_10de

	IL_10d9:  br IL_10de

	IL_10de:  ldarg 1

	IL_10e2:  nop 
	IL_10e3:  nop 
	IL_10e4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_10e9:  ldstr "]"
	IL_10ee:  call int32 string::Compare(string, string)
	IL_10f3:  stloc 0

	IL_10f7:  nop 
	IL_10f8:  nop 
	IL_10f9:  ldloc 0

	IL_10fd:  nop 
	IL_10fe:  nop 
	IL_10ff:  ldc.i4 0
	IL_1104:  beq IL_110e

	IL_1109:  br IL_115b

	IL_110e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RSParen::'.ctor'()
	IL_1113:  stloc 38

	IL_1117:  nop 
	IL_1118:  nop 
	IL_1119:  ldloc 38

	IL_111d:  nop 
	IL_111e:  nop 
	IL_111f:  ldarg 1

	IL_1123:  nop 
	IL_1124:  nop 
	IL_1125:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_112a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_112f:  ldloc 38

	IL_1133:  nop 
	IL_1134:  nop 
	IL_1135:  ldarg 1

	IL_1139:  nop 
	IL_113a:  nop 
	IL_113b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1140:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1145:  ldloc 38

	IL_1149:  nop 
	IL_114a:  nop 
	IL_114b:  starg 1

	IL_114f:  nop 
	IL_1150:  nop 
	IL_1151:  br IL_57d3

	IL_1156:  br IL_1160

	IL_115b:  br IL_1160

	IL_1160:  ldarg 1

	IL_1164:  nop 
	IL_1165:  nop 
	IL_1166:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_116b:  ldstr "|"
	IL_1170:  call int32 string::Compare(string, string)
	IL_1175:  stloc 0

	IL_1179:  nop 
	IL_117a:  nop 
	IL_117b:  ldloc 0

	IL_117f:  nop 
	IL_1180:  nop 
	IL_1181:  ldc.i4 0
	IL_1186:  beq IL_1190

	IL_118b:  br IL_11dd

	IL_1190:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Pipe::'.ctor'()
	IL_1195:  stloc 39

	IL_1199:  nop 
	IL_119a:  nop 
	IL_119b:  ldloc 39

	IL_119f:  nop 
	IL_11a0:  nop 
	IL_11a1:  ldarg 1

	IL_11a5:  nop 
	IL_11a6:  nop 
	IL_11a7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_11ac:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_11b1:  ldloc 39

	IL_11b5:  nop 
	IL_11b6:  nop 
	IL_11b7:  ldarg 1

	IL_11bb:  nop 
	IL_11bc:  nop 
	IL_11bd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_11c2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_11c7:  ldloc 39

	IL_11cb:  nop 
	IL_11cc:  nop 
	IL_11cd:  starg 1

	IL_11d1:  nop 
	IL_11d2:  nop 
	IL_11d3:  br IL_57d3

	IL_11d8:  br IL_11e2

	IL_11dd:  br IL_11e2

	IL_11e2:  ldarg 1

	IL_11e6:  nop 
	IL_11e7:  nop 
	IL_11e8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_11ed:  ldstr ","
	IL_11f2:  call int32 string::Compare(string, string)
	IL_11f7:  stloc 0

	IL_11fb:  nop 
	IL_11fc:  nop 
	IL_11fd:  ldloc 0

	IL_1201:  nop 
	IL_1202:  nop 
	IL_1203:  ldc.i4 0
	IL_1208:  beq IL_1212

	IL_120d:  br IL_125f

	IL_1212:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma::'.ctor'()
	IL_1217:  stloc 40

	IL_121b:  nop 
	IL_121c:  nop 
	IL_121d:  ldloc 40

	IL_1221:  nop 
	IL_1222:  nop 
	IL_1223:  ldarg 1

	IL_1227:  nop 
	IL_1228:  nop 
	IL_1229:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_122e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1233:  ldloc 40

	IL_1237:  nop 
	IL_1238:  nop 
	IL_1239:  ldarg 1

	IL_123d:  nop 
	IL_123e:  nop 
	IL_123f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1244:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1249:  ldloc 40

	IL_124d:  nop 
	IL_124e:  nop 
	IL_124f:  starg 1

	IL_1253:  nop 
	IL_1254:  nop 
	IL_1255:  br IL_57d3

	IL_125a:  br IL_1264

	IL_125f:  br IL_1264

	IL_1264:  ldarg 1

	IL_1268:  nop 
	IL_1269:  nop 
	IL_126a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_126f:  ldstr "$"
	IL_1274:  call int32 string::Compare(string, string)
	IL_1279:  stloc 0

	IL_127d:  nop 
	IL_127e:  nop 
	IL_127f:  ldloc 0

	IL_1283:  nop 
	IL_1284:  nop 
	IL_1285:  ldc.i4 0
	IL_128a:  beq IL_1294

	IL_128f:  br IL_12e1

	IL_1294:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.DollarSign::'.ctor'()
	IL_1299:  stloc 41

	IL_129d:  nop 
	IL_129e:  nop 
	IL_129f:  ldloc 41

	IL_12a3:  nop 
	IL_12a4:  nop 
	IL_12a5:  ldarg 1

	IL_12a9:  nop 
	IL_12aa:  nop 
	IL_12ab:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_12b0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_12b5:  ldloc 41

	IL_12b9:  nop 
	IL_12ba:  nop 
	IL_12bb:  ldarg 1

	IL_12bf:  nop 
	IL_12c0:  nop 
	IL_12c1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_12c6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_12cb:  ldloc 41

	IL_12cf:  nop 
	IL_12d0:  nop 
	IL_12d1:  starg 1

	IL_12d5:  nop 
	IL_12d6:  nop 
	IL_12d7:  br IL_57d3

	IL_12dc:  br IL_12e6

	IL_12e1:  br IL_12e6

	IL_12e6:  ldarg 1

	IL_12ea:  nop 
	IL_12eb:  nop 
	IL_12ec:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_12f1:  ldstr "label"
	IL_12f6:  call int32 string::Compare(string, string)
	IL_12fb:  stloc 0

	IL_12ff:  nop 
	IL_1300:  nop 
	IL_1301:  ldloc 0

	IL_1305:  nop 
	IL_1306:  nop 
	IL_1307:  ldc.i4 0
	IL_130c:  beq IL_1316

	IL_1311:  br IL_1363

	IL_1316:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LabelTok::'.ctor'()
	IL_131b:  stloc 42

	IL_131f:  nop 
	IL_1320:  nop 
	IL_1321:  ldloc 42

	IL_1325:  nop 
	IL_1326:  nop 
	IL_1327:  ldarg 1

	IL_132b:  nop 
	IL_132c:  nop 
	IL_132d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1332:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1337:  ldloc 42

	IL_133b:  nop 
	IL_133c:  nop 
	IL_133d:  ldarg 1

	IL_1341:  nop 
	IL_1342:  nop 
	IL_1343:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1348:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_134d:  ldloc 42

	IL_1351:  nop 
	IL_1352:  nop 
	IL_1353:  starg 1

	IL_1357:  nop 
	IL_1358:  nop 
	IL_1359:  br IL_57d3

	IL_135e:  br IL_1368

	IL_1363:  br IL_1368

	IL_1368:  ldarg 1

	IL_136c:  nop 
	IL_136d:  nop 
	IL_136e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1373:  ldstr "place"
	IL_1378:  call int32 string::Compare(string, string)
	IL_137d:  stloc 0

	IL_1381:  nop 
	IL_1382:  nop 
	IL_1383:  ldloc 0

	IL_1387:  nop 
	IL_1388:  nop 
	IL_1389:  ldc.i4 0
	IL_138e:  beq IL_1398

	IL_1393:  br IL_13e5

	IL_1398:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PlaceTok::'.ctor'()
	IL_139d:  stloc 43

	IL_13a1:  nop 
	IL_13a2:  nop 
	IL_13a3:  ldloc 43

	IL_13a7:  nop 
	IL_13a8:  nop 
	IL_13a9:  ldarg 1

	IL_13ad:  nop 
	IL_13ae:  nop 
	IL_13af:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_13b4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_13b9:  ldloc 43

	IL_13bd:  nop 
	IL_13be:  nop 
	IL_13bf:  ldarg 1

	IL_13c3:  nop 
	IL_13c4:  nop 
	IL_13c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13ca:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13cf:  ldloc 43

	IL_13d3:  nop 
	IL_13d4:  nop 
	IL_13d5:  starg 1

	IL_13d9:  nop 
	IL_13da:  nop 
	IL_13db:  br IL_57d3

	IL_13e0:  br IL_13ea

	IL_13e5:  br IL_13ea

	IL_13ea:  ldarg 1

	IL_13ee:  nop 
	IL_13ef:  nop 
	IL_13f0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13f5:  ldstr "goto"
	IL_13fa:  call int32 string::Compare(string, string)
	IL_13ff:  stloc 0

	IL_1403:  nop 
	IL_1404:  nop 
	IL_1405:  ldloc 0

	IL_1409:  nop 
	IL_140a:  nop 
	IL_140b:  ldc.i4 0
	IL_1410:  beq IL_141a

	IL_1415:  br IL_1467

	IL_141a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GotoTok::'.ctor'()
	IL_141f:  stloc 44

	IL_1423:  nop 
	IL_1424:  nop 
	IL_1425:  ldloc 44

	IL_1429:  nop 
	IL_142a:  nop 
	IL_142b:  ldarg 1

	IL_142f:  nop 
	IL_1430:  nop 
	IL_1431:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1436:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_143b:  ldloc 44

	IL_143f:  nop 
	IL_1440:  nop 
	IL_1441:  ldarg 1

	IL_1445:  nop 
	IL_1446:  nop 
	IL_1447:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_144c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1451:  ldloc 44

	IL_1455:  nop 
	IL_1456:  nop 
	IL_1457:  starg 1

	IL_145b:  nop 
	IL_145c:  nop 
	IL_145d:  br IL_57d3

	IL_1462:  br IL_146c

	IL_1467:  br IL_146c

	IL_146c:  ldarg 1

	IL_1470:  nop 
	IL_1471:  nop 
	IL_1472:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1477:  ldstr "if"
	IL_147c:  call int32 string::Compare(string, string)
	IL_1481:  stloc 0

	IL_1485:  nop 
	IL_1486:  nop 
	IL_1487:  ldloc 0

	IL_148b:  nop 
	IL_148c:  nop 
	IL_148d:  ldc.i4 0
	IL_1492:  beq IL_149c

	IL_1497:  br IL_14f3

	IL_149c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IfTok::'.ctor'()
	IL_14a1:  stloc 45

	IL_14a5:  nop 
	IL_14a6:  nop 
	IL_14a7:  ldloc 45

	IL_14ab:  nop 
	IL_14ac:  nop 
	IL_14ad:  ldarg 1

	IL_14b1:  nop 
	IL_14b2:  nop 
	IL_14b3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_14b8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_14bd:  ldloc 45

	IL_14c1:  nop 
	IL_14c2:  nop 
	IL_14c3:  ldarg 1

	IL_14c7:  nop 
	IL_14c8:  nop 
	IL_14c9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_14ce:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_14d3:  ldloc 45

	IL_14d7:  nop 
	IL_14d8:  nop 
	IL_14d9:  starg 1

	IL_14dd:  nop 
	IL_14de:  nop 
	IL_14df:  ldc.i4 1
	IL_14e4:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_14e9:  br IL_57d3

	IL_14ee:  br IL_14f8

	IL_14f3:  br IL_14f8

	IL_14f8:  ldarg 1

	IL_14fc:  nop 
	IL_14fd:  nop 
	IL_14fe:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1503:  ldstr "until"
	IL_1508:  call int32 string::Compare(string, string)
	IL_150d:  stloc 0

	IL_1511:  nop 
	IL_1512:  nop 
	IL_1513:  ldloc 0

	IL_1517:  nop 
	IL_1518:  nop 
	IL_1519:  ldc.i4 0
	IL_151e:  beq IL_1528

	IL_1523:  br IL_157f

	IL_1528:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.UntilTok::'.ctor'()
	IL_152d:  stloc 46

	IL_1531:  nop 
	IL_1532:  nop 
	IL_1533:  ldloc 46

	IL_1537:  nop 
	IL_1538:  nop 
	IL_1539:  ldarg 1

	IL_153d:  nop 
	IL_153e:  nop 
	IL_153f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1544:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1549:  ldloc 46

	IL_154d:  nop 
	IL_154e:  nop 
	IL_154f:  ldarg 1

	IL_1553:  nop 
	IL_1554:  nop 
	IL_1555:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_155a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_155f:  ldloc 46

	IL_1563:  nop 
	IL_1564:  nop 
	IL_1565:  starg 1

	IL_1569:  nop 
	IL_156a:  nop 
	IL_156b:  ldc.i4 1
	IL_1570:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_1575:  br IL_57d3

	IL_157a:  br IL_1584

	IL_157f:  br IL_1584

	IL_1584:  ldarg 1

	IL_1588:  nop 
	IL_1589:  nop 
	IL_158a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_158f:  ldstr "while"
	IL_1594:  call int32 string::Compare(string, string)
	IL_1599:  stloc 0

	IL_159d:  nop 
	IL_159e:  nop 
	IL_159f:  ldloc 0

	IL_15a3:  nop 
	IL_15a4:  nop 
	IL_15a5:  ldc.i4 0
	IL_15aa:  beq IL_15b4

	IL_15af:  br IL_160b

	IL_15b4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.WhileTok::'.ctor'()
	IL_15b9:  stloc 47

	IL_15bd:  nop 
	IL_15be:  nop 
	IL_15bf:  ldloc 47

	IL_15c3:  nop 
	IL_15c4:  nop 
	IL_15c5:  ldarg 1

	IL_15c9:  nop 
	IL_15ca:  nop 
	IL_15cb:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_15d0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_15d5:  ldloc 47

	IL_15d9:  nop 
	IL_15da:  nop 
	IL_15db:  ldarg 1

	IL_15df:  nop 
	IL_15e0:  nop 
	IL_15e1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_15e6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_15eb:  ldloc 47

	IL_15ef:  nop 
	IL_15f0:  nop 
	IL_15f1:  starg 1

	IL_15f5:  nop 
	IL_15f6:  nop 
	IL_15f7:  ldc.i4 1
	IL_15fc:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_1601:  br IL_57d3

	IL_1606:  br IL_1610

	IL_160b:  br IL_1610

	IL_1610:  ldarg 1

	IL_1614:  nop 
	IL_1615:  nop 
	IL_1616:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_161b:  ldstr "elseif"
	IL_1620:  call int32 string::Compare(string, string)
	IL_1625:  stloc 0

	IL_1629:  nop 
	IL_162a:  nop 
	IL_162b:  ldloc 0

	IL_162f:  nop 
	IL_1630:  nop 
	IL_1631:  ldc.i4 0
	IL_1636:  beq IL_1640

	IL_163b:  br IL_1697

	IL_1640:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseIfTok::'.ctor'()
	IL_1645:  stloc 48

	IL_1649:  nop 
	IL_164a:  nop 
	IL_164b:  ldloc 48

	IL_164f:  nop 
	IL_1650:  nop 
	IL_1651:  ldarg 1

	IL_1655:  nop 
	IL_1656:  nop 
	IL_1657:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_165c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1661:  ldloc 48

	IL_1665:  nop 
	IL_1666:  nop 
	IL_1667:  ldarg 1

	IL_166b:  nop 
	IL_166c:  nop 
	IL_166d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1672:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1677:  ldloc 48

	IL_167b:  nop 
	IL_167c:  nop 
	IL_167d:  starg 1

	IL_1681:  nop 
	IL_1682:  nop 
	IL_1683:  ldc.i4 1
	IL_1688:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_168d:  br IL_57d3

	IL_1692:  br IL_169c

	IL_1697:  br IL_169c

	IL_169c:  ldarg 1

	IL_16a0:  nop 
	IL_16a1:  nop 
	IL_16a2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_16a7:  ldstr "else"
	IL_16ac:  call int32 string::Compare(string, string)
	IL_16b1:  stloc 0

	IL_16b5:  nop 
	IL_16b6:  nop 
	IL_16b7:  ldloc 0

	IL_16bb:  nop 
	IL_16bc:  nop 
	IL_16bd:  ldc.i4 0
	IL_16c2:  beq IL_16cc

	IL_16c7:  br IL_1719

	IL_16cc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok::'.ctor'()
	IL_16d1:  stloc 49

	IL_16d5:  nop 
	IL_16d6:  nop 
	IL_16d7:  ldloc 49

	IL_16db:  nop 
	IL_16dc:  nop 
	IL_16dd:  ldarg 1

	IL_16e1:  nop 
	IL_16e2:  nop 
	IL_16e3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_16e8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_16ed:  ldloc 49

	IL_16f1:  nop 
	IL_16f2:  nop 
	IL_16f3:  ldarg 1

	IL_16f7:  nop 
	IL_16f8:  nop 
	IL_16f9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_16fe:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1703:  ldloc 49

	IL_1707:  nop 
	IL_1708:  nop 
	IL_1709:  starg 1

	IL_170d:  nop 
	IL_170e:  nop 
	IL_170f:  br IL_57d3

	IL_1714:  br IL_171e

	IL_1719:  br IL_171e

	IL_171e:  ldarg 1

	IL_1722:  nop 
	IL_1723:  nop 
	IL_1724:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1729:  ldstr "do"
	IL_172e:  call int32 string::Compare(string, string)
	IL_1733:  stloc 0

	IL_1737:  nop 
	IL_1738:  nop 
	IL_1739:  ldloc 0

	IL_173d:  nop 
	IL_173e:  nop 
	IL_173f:  ldc.i4 0
	IL_1744:  beq IL_174e

	IL_1749:  br IL_179b

	IL_174e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DoTok::'.ctor'()
	IL_1753:  stloc 50

	IL_1757:  nop 
	IL_1758:  nop 
	IL_1759:  ldloc 50

	IL_175d:  nop 
	IL_175e:  nop 
	IL_175f:  ldarg 1

	IL_1763:  nop 
	IL_1764:  nop 
	IL_1765:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_176a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_176f:  ldloc 50

	IL_1773:  nop 
	IL_1774:  nop 
	IL_1775:  ldarg 1

	IL_1779:  nop 
	IL_177a:  nop 
	IL_177b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1780:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1785:  ldloc 50

	IL_1789:  nop 
	IL_178a:  nop 
	IL_178b:  starg 1

	IL_178f:  nop 
	IL_1790:  nop 
	IL_1791:  br IL_57d3

	IL_1796:  br IL_17a0

	IL_179b:  br IL_17a0

	IL_17a0:  ldarg 1

	IL_17a4:  nop 
	IL_17a5:  nop 
	IL_17a6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_17ab:  ldstr "break"
	IL_17b0:  call int32 string::Compare(string, string)
	IL_17b5:  stloc 0

	IL_17b9:  nop 
	IL_17ba:  nop 
	IL_17bb:  ldloc 0

	IL_17bf:  nop 
	IL_17c0:  nop 
	IL_17c1:  ldc.i4 0
	IL_17c6:  beq IL_17d0

	IL_17cb:  br IL_181d

	IL_17d0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.BreakTok::'.ctor'()
	IL_17d5:  stloc 51

	IL_17d9:  nop 
	IL_17da:  nop 
	IL_17db:  ldloc 51

	IL_17df:  nop 
	IL_17e0:  nop 
	IL_17e1:  ldarg 1

	IL_17e5:  nop 
	IL_17e6:  nop 
	IL_17e7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_17ec:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_17f1:  ldloc 51

	IL_17f5:  nop 
	IL_17f6:  nop 
	IL_17f7:  ldarg 1

	IL_17fb:  nop 
	IL_17fc:  nop 
	IL_17fd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1802:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1807:  ldloc 51

	IL_180b:  nop 
	IL_180c:  nop 
	IL_180d:  starg 1

	IL_1811:  nop 
	IL_1812:  nop 
	IL_1813:  br IL_57d3

	IL_1818:  br IL_1822

	IL_181d:  br IL_1822

	IL_1822:  ldarg 1

	IL_1826:  nop 
	IL_1827:  nop 
	IL_1828:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_182d:  ldstr "continue"
	IL_1832:  call int32 string::Compare(string, string)
	IL_1837:  stloc 0

	IL_183b:  nop 
	IL_183c:  nop 
	IL_183d:  ldloc 0

	IL_1841:  nop 
	IL_1842:  nop 
	IL_1843:  ldc.i4 0
	IL_1848:  beq IL_1852

	IL_184d:  br IL_189f

	IL_1852:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ContinueTok::'.ctor'()
	IL_1857:  stloc 52

	IL_185b:  nop 
	IL_185c:  nop 
	IL_185d:  ldloc 52

	IL_1861:  nop 
	IL_1862:  nop 
	IL_1863:  ldarg 1

	IL_1867:  nop 
	IL_1868:  nop 
	IL_1869:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_186e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1873:  ldloc 52

	IL_1877:  nop 
	IL_1878:  nop 
	IL_1879:  ldarg 1

	IL_187d:  nop 
	IL_187e:  nop 
	IL_187f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1884:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1889:  ldloc 52

	IL_188d:  nop 
	IL_188e:  nop 
	IL_188f:  starg 1

	IL_1893:  nop 
	IL_1894:  nop 
	IL_1895:  br IL_57d3

	IL_189a:  br IL_18a4

	IL_189f:  br IL_18a4

	IL_18a4:  ldarg 1

	IL_18a8:  nop 
	IL_18a9:  nop 
	IL_18aa:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_18af:  ldstr "then"
	IL_18b4:  call int32 string::Compare(string, string)
	IL_18b9:  stloc 0

	IL_18bd:  nop 
	IL_18be:  nop 
	IL_18bf:  ldloc 0

	IL_18c3:  nop 
	IL_18c4:  nop 
	IL_18c5:  ldc.i4 0
	IL_18ca:  beq IL_18d4

	IL_18cf:  br IL_192b

	IL_18d4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok::'.ctor'()
	IL_18d9:  stloc 53

	IL_18dd:  nop 
	IL_18de:  nop 
	IL_18df:  ldloc 53

	IL_18e3:  nop 
	IL_18e4:  nop 
	IL_18e5:  ldarg 1

	IL_18e9:  nop 
	IL_18ea:  nop 
	IL_18eb:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_18f0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_18f5:  ldloc 53

	IL_18f9:  nop 
	IL_18fa:  nop 
	IL_18fb:  ldarg 1

	IL_18ff:  nop 
	IL_1900:  nop 
	IL_1901:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1906:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_190b:  ldloc 53

	IL_190f:  nop 
	IL_1910:  nop 
	IL_1911:  starg 1

	IL_1915:  nop 
	IL_1916:  nop 
	IL_1917:  ldc.i4 0
	IL_191c:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_1921:  br IL_57d3

	IL_1926:  br IL_1930

	IL_192b:  br IL_1930

	IL_1930:  ldarg 1

	IL_1934:  nop 
	IL_1935:  nop 
	IL_1936:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_193b:  ldstr "new"
	IL_1940:  call int32 string::Compare(string, string)
	IL_1945:  stloc 0

	IL_1949:  nop 
	IL_194a:  nop 
	IL_194b:  ldloc 0

	IL_194f:  nop 
	IL_1950:  nop 
	IL_1951:  ldc.i4 0
	IL_1956:  beq IL_1960

	IL_195b:  br IL_19ad

	IL_1960:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok::'.ctor'()
	IL_1965:  stloc 54

	IL_1969:  nop 
	IL_196a:  nop 
	IL_196b:  ldloc 54

	IL_196f:  nop 
	IL_1970:  nop 
	IL_1971:  ldarg 1

	IL_1975:  nop 
	IL_1976:  nop 
	IL_1977:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_197c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1981:  ldloc 54

	IL_1985:  nop 
	IL_1986:  nop 
	IL_1987:  ldarg 1

	IL_198b:  nop 
	IL_198c:  nop 
	IL_198d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1992:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1997:  ldloc 54

	IL_199b:  nop 
	IL_199c:  nop 
	IL_199d:  starg 1

	IL_19a1:  nop 
	IL_19a2:  nop 
	IL_19a3:  br IL_57d3

	IL_19a8:  br IL_19b2

	IL_19ad:  br IL_19b2

	IL_19b2:  ldarg 1

	IL_19b6:  nop 
	IL_19b7:  nop 
	IL_19b8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_19bd:  ldstr "newarr"
	IL_19c2:  call int32 string::Compare(string, string)
	IL_19c7:  stloc 0

	IL_19cb:  nop 
	IL_19cc:  nop 
	IL_19cd:  ldloc 0

	IL_19d1:  nop 
	IL_19d2:  nop 
	IL_19d3:  ldc.i4 0
	IL_19d8:  beq IL_19e2

	IL_19dd:  br IL_1a2f

	IL_19e2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrTok::'.ctor'()
	IL_19e7:  stloc 55

	IL_19eb:  nop 
	IL_19ec:  nop 
	IL_19ed:  ldloc 55

	IL_19f1:  nop 
	IL_19f2:  nop 
	IL_19f3:  ldarg 1

	IL_19f7:  nop 
	IL_19f8:  nop 
	IL_19f9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_19fe:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a03:  ldloc 55

	IL_1a07:  nop 
	IL_1a08:  nop 
	IL_1a09:  ldarg 1

	IL_1a0d:  nop 
	IL_1a0e:  nop 
	IL_1a0f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a14:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a19:  ldloc 55

	IL_1a1d:  nop 
	IL_1a1e:  nop 
	IL_1a1f:  starg 1

	IL_1a23:  nop 
	IL_1a24:  nop 
	IL_1a25:  br IL_57d3

	IL_1a2a:  br IL_1a34

	IL_1a2f:  br IL_1a34

	IL_1a34:  ldarg 1

	IL_1a38:  nop 
	IL_1a39:  nop 
	IL_1a3a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a3f:  ldstr "me"
	IL_1a44:  call int32 string::Compare(string, string)
	IL_1a49:  stloc 0

	IL_1a4d:  nop 
	IL_1a4e:  nop 
	IL_1a4f:  ldloc 0

	IL_1a53:  nop 
	IL_1a54:  nop 
	IL_1a55:  ldc.i4 0
	IL_1a5a:  beq IL_1a64

	IL_1a5f:  br IL_1ab1

	IL_1a64:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok::'.ctor'()
	IL_1a69:  stloc 56

	IL_1a6d:  nop 
	IL_1a6e:  nop 
	IL_1a6f:  ldloc 56

	IL_1a73:  nop 
	IL_1a74:  nop 
	IL_1a75:  ldarg 1

	IL_1a79:  nop 
	IL_1a7a:  nop 
	IL_1a7b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a80:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a85:  ldloc 56

	IL_1a89:  nop 
	IL_1a8a:  nop 
	IL_1a8b:  ldarg 1

	IL_1a8f:  nop 
	IL_1a90:  nop 
	IL_1a91:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a96:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a9b:  ldloc 56

	IL_1a9f:  nop 
	IL_1aa0:  nop 
	IL_1aa1:  starg 1

	IL_1aa5:  nop 
	IL_1aa6:  nop 
	IL_1aa7:  br IL_57d3

	IL_1aac:  br IL_1ab6

	IL_1ab1:  br IL_1ab6

	IL_1ab6:  ldarg 1

	IL_1aba:  nop 
	IL_1abb:  nop 
	IL_1abc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ac1:  ldstr "namespace"
	IL_1ac6:  call int32 string::Compare(string, string)
	IL_1acb:  stloc 0

	IL_1acf:  nop 
	IL_1ad0:  nop 
	IL_1ad1:  ldloc 0

	IL_1ad5:  nop 
	IL_1ad6:  nop 
	IL_1ad7:  ldc.i4 0
	IL_1adc:  beq IL_1ae6

	IL_1ae1:  br IL_1b33

	IL_1ae6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NamespaceTok::'.ctor'()
	IL_1aeb:  stloc 57

	IL_1aef:  nop 
	IL_1af0:  nop 
	IL_1af1:  ldloc 57

	IL_1af5:  nop 
	IL_1af6:  nop 
	IL_1af7:  ldarg 1

	IL_1afb:  nop 
	IL_1afc:  nop 
	IL_1afd:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b02:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b07:  ldloc 57

	IL_1b0b:  nop 
	IL_1b0c:  nop 
	IL_1b0d:  ldarg 1

	IL_1b11:  nop 
	IL_1b12:  nop 
	IL_1b13:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b18:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b1d:  ldloc 57

	IL_1b21:  nop 
	IL_1b22:  nop 
	IL_1b23:  starg 1

	IL_1b27:  nop 
	IL_1b28:  nop 
	IL_1b29:  br IL_57d3

	IL_1b2e:  br IL_1b38

	IL_1b33:  br IL_1b38

	IL_1b38:  ldarg 1

	IL_1b3c:  nop 
	IL_1b3d:  nop 
	IL_1b3e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b43:  ldstr "ptr"
	IL_1b48:  call int32 string::Compare(string, string)
	IL_1b4d:  stloc 0

	IL_1b51:  nop 
	IL_1b52:  nop 
	IL_1b53:  ldloc 0

	IL_1b57:  nop 
	IL_1b58:  nop 
	IL_1b59:  ldc.i4 0
	IL_1b5e:  beq IL_1b68

	IL_1b63:  br IL_1bb5

	IL_1b68:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok::'.ctor'()
	IL_1b6d:  stloc 58

	IL_1b71:  nop 
	IL_1b72:  nop 
	IL_1b73:  ldloc 58

	IL_1b77:  nop 
	IL_1b78:  nop 
	IL_1b79:  ldarg 1

	IL_1b7d:  nop 
	IL_1b7e:  nop 
	IL_1b7f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b84:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b89:  ldloc 58

	IL_1b8d:  nop 
	IL_1b8e:  nop 
	IL_1b8f:  ldarg 1

	IL_1b93:  nop 
	IL_1b94:  nop 
	IL_1b95:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b9a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b9f:  ldloc 58

	IL_1ba3:  nop 
	IL_1ba4:  nop 
	IL_1ba5:  starg 1

	IL_1ba9:  nop 
	IL_1baa:  nop 
	IL_1bab:  br IL_57d3

	IL_1bb0:  br IL_1bba

	IL_1bb5:  br IL_1bba

	IL_1bba:  ldarg 1

	IL_1bbe:  nop 
	IL_1bbf:  nop 
	IL_1bc0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1bc5:  ldstr "gettype"
	IL_1bca:  call int32 string::Compare(string, string)
	IL_1bcf:  stloc 0

	IL_1bd3:  nop 
	IL_1bd4:  nop 
	IL_1bd5:  ldloc 0

	IL_1bd9:  nop 
	IL_1bda:  nop 
	IL_1bdb:  ldc.i4 0
	IL_1be0:  beq IL_1bea

	IL_1be5:  br IL_1c37

	IL_1bea:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok::'.ctor'()
	IL_1bef:  stloc 59

	IL_1bf3:  nop 
	IL_1bf4:  nop 
	IL_1bf5:  ldloc 59

	IL_1bf9:  nop 
	IL_1bfa:  nop 
	IL_1bfb:  ldarg 1

	IL_1bff:  nop 
	IL_1c00:  nop 
	IL_1c01:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c06:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c0b:  ldloc 59

	IL_1c0f:  nop 
	IL_1c10:  nop 
	IL_1c11:  ldarg 1

	IL_1c15:  nop 
	IL_1c16:  nop 
	IL_1c17:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c1c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c21:  ldloc 59

	IL_1c25:  nop 
	IL_1c26:  nop 
	IL_1c27:  starg 1

	IL_1c2b:  nop 
	IL_1c2c:  nop 
	IL_1c2d:  br IL_57d3

	IL_1c32:  br IL_1c3c

	IL_1c37:  br IL_1c3c

	IL_1c3c:  ldarg 1

	IL_1c40:  nop 
	IL_1c41:  nop 
	IL_1c42:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c47:  ldstr "#refasm"
	IL_1c4c:  call int32 string::Compare(string, string)
	IL_1c51:  stloc 0

	IL_1c55:  nop 
	IL_1c56:  nop 
	IL_1c57:  ldloc 0

	IL_1c5b:  nop 
	IL_1c5c:  nop 
	IL_1c5d:  ldc.i4 0
	IL_1c62:  beq IL_1c6c

	IL_1c67:  br IL_1cc3

	IL_1c6c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok::'.ctor'()
	IL_1c71:  stloc 60

	IL_1c75:  nop 
	IL_1c76:  nop 
	IL_1c77:  ldloc 60

	IL_1c7b:  nop 
	IL_1c7c:  nop 
	IL_1c7d:  ldarg 1

	IL_1c81:  nop 
	IL_1c82:  nop 
	IL_1c83:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c88:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c8d:  ldloc 60

	IL_1c91:  nop 
	IL_1c92:  nop 
	IL_1c93:  ldarg 1

	IL_1c97:  nop 
	IL_1c98:  nop 
	IL_1c99:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c9e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ca3:  ldloc 60

	IL_1ca7:  nop 
	IL_1ca8:  nop 
	IL_1ca9:  starg 1

	IL_1cad:  nop 
	IL_1cae:  nop 
	IL_1caf:  ldc.i4 1
	IL_1cb4:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1cb9:  br IL_57d3

	IL_1cbe:  br IL_1cc8

	IL_1cc3:  br IL_1cc8

	IL_1cc8:  ldarg 1

	IL_1ccc:  nop 
	IL_1ccd:  nop 
	IL_1cce:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cd3:  ldstr "#refstdasm"
	IL_1cd8:  call int32 string::Compare(string, string)
	IL_1cdd:  stloc 0

	IL_1ce1:  nop 
	IL_1ce2:  nop 
	IL_1ce3:  ldloc 0

	IL_1ce7:  nop 
	IL_1ce8:  nop 
	IL_1ce9:  ldc.i4 0
	IL_1cee:  beq IL_1cf8

	IL_1cf3:  br IL_1d4f

	IL_1cf8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefstdasmTok::'.ctor'()
	IL_1cfd:  stloc 61

	IL_1d01:  nop 
	IL_1d02:  nop 
	IL_1d03:  ldloc 61

	IL_1d07:  nop 
	IL_1d08:  nop 
	IL_1d09:  ldarg 1

	IL_1d0d:  nop 
	IL_1d0e:  nop 
	IL_1d0f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1d14:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1d19:  ldloc 61

	IL_1d1d:  nop 
	IL_1d1e:  nop 
	IL_1d1f:  ldarg 1

	IL_1d23:  nop 
	IL_1d24:  nop 
	IL_1d25:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d2a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d2f:  ldloc 61

	IL_1d33:  nop 
	IL_1d34:  nop 
	IL_1d35:  starg 1

	IL_1d39:  nop 
	IL_1d3a:  nop 
	IL_1d3b:  ldc.i4 1
	IL_1d40:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1d45:  br IL_57d3

	IL_1d4a:  br IL_1d54

	IL_1d4f:  br IL_1d54

	IL_1d54:  ldarg 1

	IL_1d58:  nop 
	IL_1d59:  nop 
	IL_1d5a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d5f:  ldstr "#debug"
	IL_1d64:  call int32 string::Compare(string, string)
	IL_1d69:  stloc 0

	IL_1d6d:  nop 
	IL_1d6e:  nop 
	IL_1d6f:  ldloc 0

	IL_1d73:  nop 
	IL_1d74:  nop 
	IL_1d75:  ldc.i4 0
	IL_1d7a:  beq IL_1d84

	IL_1d7f:  br IL_1dd1

	IL_1d84:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok::'.ctor'()
	IL_1d89:  stloc 62

	IL_1d8d:  nop 
	IL_1d8e:  nop 
	IL_1d8f:  ldloc 62

	IL_1d93:  nop 
	IL_1d94:  nop 
	IL_1d95:  ldarg 1

	IL_1d99:  nop 
	IL_1d9a:  nop 
	IL_1d9b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1da0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1da5:  ldloc 62

	IL_1da9:  nop 
	IL_1daa:  nop 
	IL_1dab:  ldarg 1

	IL_1daf:  nop 
	IL_1db0:  nop 
	IL_1db1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1db6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1dbb:  ldloc 62

	IL_1dbf:  nop 
	IL_1dc0:  nop 
	IL_1dc1:  starg 1

	IL_1dc5:  nop 
	IL_1dc6:  nop 
	IL_1dc7:  br IL_57d3

	IL_1dcc:  br IL_1dd6

	IL_1dd1:  br IL_1dd6

	IL_1dd6:  ldarg 1

	IL_1dda:  nop 
	IL_1ddb:  nop 
	IL_1ddc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1de1:  ldstr "#include"
	IL_1de6:  call int32 string::Compare(string, string)
	IL_1deb:  stloc 0

	IL_1def:  nop 
	IL_1df0:  nop 
	IL_1df1:  ldloc 0

	IL_1df5:  nop 
	IL_1df6:  nop 
	IL_1df7:  ldc.i4 0
	IL_1dfc:  beq IL_1e06

	IL_1e01:  br IL_1e53

	IL_1e06:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IncludeTok::'.ctor'()
	IL_1e0b:  stloc 63

	IL_1e0f:  nop 
	IL_1e10:  nop 
	IL_1e11:  ldloc 63

	IL_1e15:  nop 
	IL_1e16:  nop 
	IL_1e17:  ldarg 1

	IL_1e1b:  nop 
	IL_1e1c:  nop 
	IL_1e1d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1e22:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1e27:  ldloc 63

	IL_1e2b:  nop 
	IL_1e2c:  nop 
	IL_1e2d:  ldarg 1

	IL_1e31:  nop 
	IL_1e32:  nop 
	IL_1e33:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1e38:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1e3d:  ldloc 63

	IL_1e41:  nop 
	IL_1e42:  nop 
	IL_1e43:  starg 1

	IL_1e47:  nop 
	IL_1e48:  nop 
	IL_1e49:  br IL_57d3

	IL_1e4e:  br IL_1e58

	IL_1e53:  br IL_1e58

	IL_1e58:  ldarg 1

	IL_1e5c:  nop 
	IL_1e5d:  nop 
	IL_1e5e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1e63:  ldstr "#scope"
	IL_1e68:  call int32 string::Compare(string, string)
	IL_1e6d:  stloc 0

	IL_1e71:  nop 
	IL_1e72:  nop 
	IL_1e73:  ldloc 0

	IL_1e77:  nop 
	IL_1e78:  nop 
	IL_1e79:  ldc.i4 0
	IL_1e7e:  beq IL_1e88

	IL_1e83:  br IL_1ed5

	IL_1e88:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok::'.ctor'()
	IL_1e8d:  stloc 64

	IL_1e91:  nop 
	IL_1e92:  nop 
	IL_1e93:  ldloc 64

	IL_1e97:  nop 
	IL_1e98:  nop 
	IL_1e99:  ldarg 1

	IL_1e9d:  nop 
	IL_1e9e:  nop 
	IL_1e9f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1ea4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1ea9:  ldloc 64

	IL_1ead:  nop 
	IL_1eae:  nop 
	IL_1eaf:  ldarg 1

	IL_1eb3:  nop 
	IL_1eb4:  nop 
	IL_1eb5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1eba:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ebf:  ldloc 64

	IL_1ec3:  nop 
	IL_1ec4:  nop 
	IL_1ec5:  starg 1

	IL_1ec9:  nop 
	IL_1eca:  nop 
	IL_1ecb:  br IL_57d3

	IL_1ed0:  br IL_1eda

	IL_1ed5:  br IL_1eda

	IL_1eda:  ldarg 1

	IL_1ede:  nop 
	IL_1edf:  nop 
	IL_1ee0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ee5:  ldstr "import"
	IL_1eea:  call int32 string::Compare(string, string)
	IL_1eef:  stloc 0

	IL_1ef3:  nop 
	IL_1ef4:  nop 
	IL_1ef5:  ldloc 0

	IL_1ef9:  nop 
	IL_1efa:  nop 
	IL_1efb:  ldc.i4 0
	IL_1f00:  beq IL_1f0a

	IL_1f05:  br IL_1f61

	IL_1f0a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok::'.ctor'()
	IL_1f0f:  stloc 65

	IL_1f13:  nop 
	IL_1f14:  nop 
	IL_1f15:  ldloc 65

	IL_1f19:  nop 
	IL_1f1a:  nop 
	IL_1f1b:  ldarg 1

	IL_1f1f:  nop 
	IL_1f20:  nop 
	IL_1f21:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1f26:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1f2b:  ldloc 65

	IL_1f2f:  nop 
	IL_1f30:  nop 
	IL_1f31:  ldarg 1

	IL_1f35:  nop 
	IL_1f36:  nop 
	IL_1f37:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f3c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f41:  ldloc 65

	IL_1f45:  nop 
	IL_1f46:  nop 
	IL_1f47:  starg 1

	IL_1f4b:  nop 
	IL_1f4c:  nop 
	IL_1f4d:  ldc.i4 1
	IL_1f52:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1f57:  br IL_57d3

	IL_1f5c:  br IL_1f66

	IL_1f61:  br IL_1f66

	IL_1f66:  ldarg 1

	IL_1f6a:  nop 
	IL_1f6b:  nop 
	IL_1f6c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f71:  ldstr "locimport"
	IL_1f76:  call int32 string::Compare(string, string)
	IL_1f7b:  stloc 0

	IL_1f7f:  nop 
	IL_1f80:  nop 
	IL_1f81:  ldloc 0

	IL_1f85:  nop 
	IL_1f86:  nop 
	IL_1f87:  ldc.i4 0
	IL_1f8c:  beq IL_1f96

	IL_1f91:  br IL_1fed

	IL_1f96:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok::'.ctor'()
	IL_1f9b:  stloc 66

	IL_1f9f:  nop 
	IL_1fa0:  nop 
	IL_1fa1:  ldloc 66

	IL_1fa5:  nop 
	IL_1fa6:  nop 
	IL_1fa7:  ldarg 1

	IL_1fab:  nop 
	IL_1fac:  nop 
	IL_1fad:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1fb2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1fb7:  ldloc 66

	IL_1fbb:  nop 
	IL_1fbc:  nop 
	IL_1fbd:  ldarg 1

	IL_1fc1:  nop 
	IL_1fc2:  nop 
	IL_1fc3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1fc8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1fcd:  ldloc 66

	IL_1fd1:  nop 
	IL_1fd2:  nop 
	IL_1fd3:  starg 1

	IL_1fd7:  nop 
	IL_1fd8:  nop 
	IL_1fd9:  ldc.i4 1
	IL_1fde:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1fe3:  br IL_57d3

	IL_1fe8:  br IL_1ff2

	IL_1fed:  br IL_1ff2

	IL_1ff2:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::AssemFlg
	IL_1ff7:  ldc.i4 1
	IL_1ffc:  beq IL_2006

	IL_2001:  br IL_2097

	IL_2006:  ldarg 1

	IL_200a:  nop 
	IL_200b:  nop 
	IL_200c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2011:  ldstr "assembly"
	IL_2016:  call int32 string::Compare(string, string)
	IL_201b:  stloc 0

	IL_201f:  nop 
	IL_2020:  nop 
	IL_2021:  ldloc 0

	IL_2025:  nop 
	IL_2026:  nop 
	IL_2027:  ldc.i4 0
	IL_202c:  beq IL_2036

	IL_2031:  br IL_208d

	IL_2036:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok::'.ctor'()
	IL_203b:  stloc 67

	IL_203f:  nop 
	IL_2040:  nop 
	IL_2041:  ldloc 67

	IL_2045:  nop 
	IL_2046:  nop 
	IL_2047:  ldarg 1

	IL_204b:  nop 
	IL_204c:  nop 
	IL_204d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2052:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2057:  ldloc 67

	IL_205b:  nop 
	IL_205c:  nop 
	IL_205d:  ldarg 1

	IL_2061:  nop 
	IL_2062:  nop 
	IL_2063:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2068:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_206d:  ldloc 67

	IL_2071:  nop 
	IL_2072:  nop 
	IL_2073:  starg 1

	IL_2077:  nop 
	IL_2078:  nop 
	IL_2079:  ldc.i4 0
	IL_207e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::AssemFlg
	IL_2083:  br IL_57d3

	IL_2088:  br IL_2092

	IL_208d:  br IL_2092

	IL_2092:  br IL_209c

	IL_2097:  br IL_209c

	IL_209c:  ldarg 1

	IL_20a0:  nop 
	IL_20a1:  nop 
	IL_20a2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20a7:  ldstr "ver"
	IL_20ac:  call int32 string::Compare(string, string)
	IL_20b1:  stloc 0

	IL_20b5:  nop 
	IL_20b6:  nop 
	IL_20b7:  ldloc 0

	IL_20bb:  nop 
	IL_20bc:  nop 
	IL_20bd:  ldc.i4 0
	IL_20c2:  beq IL_20cc

	IL_20c7:  br IL_2123

	IL_20cc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok::'.ctor'()
	IL_20d1:  stloc 68

	IL_20d5:  nop 
	IL_20d6:  nop 
	IL_20d7:  ldloc 68

	IL_20db:  nop 
	IL_20dc:  nop 
	IL_20dd:  ldarg 1

	IL_20e1:  nop 
	IL_20e2:  nop 
	IL_20e3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_20e8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_20ed:  ldloc 68

	IL_20f1:  nop 
	IL_20f2:  nop 
	IL_20f3:  ldarg 1

	IL_20f7:  nop 
	IL_20f8:  nop 
	IL_20f9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20fe:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2103:  ldloc 68

	IL_2107:  nop 
	IL_2108:  nop 
	IL_2109:  starg 1

	IL_210d:  nop 
	IL_210e:  nop 
	IL_210f:  ldc.i4 1
	IL_2114:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_2119:  br IL_57d3

	IL_211e:  br IL_2128

	IL_2123:  br IL_2128

	IL_2128:  ldarg 1

	IL_212c:  nop 
	IL_212d:  nop 
	IL_212e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2133:  ldstr "on"
	IL_2138:  call int32 string::Compare(string, string)
	IL_213d:  stloc 0

	IL_2141:  nop 
	IL_2142:  nop 
	IL_2143:  ldloc 0

	IL_2147:  nop 
	IL_2148:  nop 
	IL_2149:  ldc.i4 0
	IL_214e:  beq IL_2158

	IL_2153:  br IL_21a5

	IL_2158:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok::'.ctor'()
	IL_215d:  stloc 69

	IL_2161:  nop 
	IL_2162:  nop 
	IL_2163:  ldloc 69

	IL_2167:  nop 
	IL_2168:  nop 
	IL_2169:  ldarg 1

	IL_216d:  nop 
	IL_216e:  nop 
	IL_216f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2174:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2179:  ldloc 69

	IL_217d:  nop 
	IL_217e:  nop 
	IL_217f:  ldarg 1

	IL_2183:  nop 
	IL_2184:  nop 
	IL_2185:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_218a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_218f:  ldloc 69

	IL_2193:  nop 
	IL_2194:  nop 
	IL_2195:  starg 1

	IL_2199:  nop 
	IL_219a:  nop 
	IL_219b:  br IL_57d3

	IL_21a0:  br IL_21aa

	IL_21a5:  br IL_21aa

	IL_21aa:  ldarg 1

	IL_21ae:  nop 
	IL_21af:  nop 
	IL_21b0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21b5:  ldstr "off"
	IL_21ba:  call int32 string::Compare(string, string)
	IL_21bf:  stloc 0

	IL_21c3:  nop 
	IL_21c4:  nop 
	IL_21c5:  ldloc 0

	IL_21c9:  nop 
	IL_21ca:  nop 
	IL_21cb:  ldc.i4 0
	IL_21d0:  beq IL_21da

	IL_21d5:  br IL_2227

	IL_21da:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok::'.ctor'()
	IL_21df:  stloc 70

	IL_21e3:  nop 
	IL_21e4:  nop 
	IL_21e5:  ldloc 70

	IL_21e9:  nop 
	IL_21ea:  nop 
	IL_21eb:  ldarg 1

	IL_21ef:  nop 
	IL_21f0:  nop 
	IL_21f1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_21f6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_21fb:  ldloc 70

	IL_21ff:  nop 
	IL_2200:  nop 
	IL_2201:  ldarg 1

	IL_2205:  nop 
	IL_2206:  nop 
	IL_2207:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_220c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2211:  ldloc 70

	IL_2215:  nop 
	IL_2216:  nop 
	IL_2217:  starg 1

	IL_221b:  nop 
	IL_221c:  nop 
	IL_221d:  br IL_57d3

	IL_2222:  br IL_222c

	IL_2227:  br IL_222c

	IL_222c:  ldarg 1

	IL_2230:  nop 
	IL_2231:  nop 
	IL_2232:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2237:  ldstr "exe"
	IL_223c:  call int32 string::Compare(string, string)
	IL_2241:  stloc 0

	IL_2245:  nop 
	IL_2246:  nop 
	IL_2247:  ldloc 0

	IL_224b:  nop 
	IL_224c:  nop 
	IL_224d:  ldc.i4 0
	IL_2252:  beq IL_225c

	IL_2257:  br IL_22a9

	IL_225c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok::'.ctor'()
	IL_2261:  stloc 71

	IL_2265:  nop 
	IL_2266:  nop 
	IL_2267:  ldloc 71

	IL_226b:  nop 
	IL_226c:  nop 
	IL_226d:  ldarg 1

	IL_2271:  nop 
	IL_2272:  nop 
	IL_2273:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2278:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_227d:  ldloc 71

	IL_2281:  nop 
	IL_2282:  nop 
	IL_2283:  ldarg 1

	IL_2287:  nop 
	IL_2288:  nop 
	IL_2289:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_228e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2293:  ldloc 71

	IL_2297:  nop 
	IL_2298:  nop 
	IL_2299:  starg 1

	IL_229d:  nop 
	IL_229e:  nop 
	IL_229f:  br IL_57d3

	IL_22a4:  br IL_22ae

	IL_22a9:  br IL_22ae

	IL_22ae:  ldarg 1

	IL_22b2:  nop 
	IL_22b3:  nop 
	IL_22b4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22b9:  ldstr "dll"
	IL_22be:  call int32 string::Compare(string, string)
	IL_22c3:  stloc 0

	IL_22c7:  nop 
	IL_22c8:  nop 
	IL_22c9:  ldloc 0

	IL_22cd:  nop 
	IL_22ce:  nop 
	IL_22cf:  ldc.i4 0
	IL_22d4:  beq IL_22de

	IL_22d9:  br IL_232b

	IL_22de:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok::'.ctor'()
	IL_22e3:  stloc 72

	IL_22e7:  nop 
	IL_22e8:  nop 
	IL_22e9:  ldloc 72

	IL_22ed:  nop 
	IL_22ee:  nop 
	IL_22ef:  ldarg 1

	IL_22f3:  nop 
	IL_22f4:  nop 
	IL_22f5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_22fa:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_22ff:  ldloc 72

	IL_2303:  nop 
	IL_2304:  nop 
	IL_2305:  ldarg 1

	IL_2309:  nop 
	IL_230a:  nop 
	IL_230b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2310:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2315:  ldloc 72

	IL_2319:  nop 
	IL_231a:  nop 
	IL_231b:  starg 1

	IL_231f:  nop 
	IL_2320:  nop 
	IL_2321:  br IL_57d3

	IL_2326:  br IL_2330

	IL_232b:  br IL_2330

	IL_2330:  ldarg 1

	IL_2334:  nop 
	IL_2335:  nop 
	IL_2336:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_233b:  ldstr "field"
	IL_2340:  call int32 string::Compare(string, string)
	IL_2345:  stloc 0

	IL_2349:  nop 
	IL_234a:  nop 
	IL_234b:  ldloc 0

	IL_234f:  nop 
	IL_2350:  nop 
	IL_2351:  ldc.i4 0
	IL_2356:  beq IL_2360

	IL_235b:  br IL_23ad

	IL_2360:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok::'.ctor'()
	IL_2365:  stloc 73

	IL_2369:  nop 
	IL_236a:  nop 
	IL_236b:  ldloc 73

	IL_236f:  nop 
	IL_2370:  nop 
	IL_2371:  ldarg 1

	IL_2375:  nop 
	IL_2376:  nop 
	IL_2377:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_237c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2381:  ldloc 73

	IL_2385:  nop 
	IL_2386:  nop 
	IL_2387:  ldarg 1

	IL_238b:  nop 
	IL_238c:  nop 
	IL_238d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2392:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2397:  ldloc 73

	IL_239b:  nop 
	IL_239c:  nop 
	IL_239d:  starg 1

	IL_23a1:  nop 
	IL_23a2:  nop 
	IL_23a3:  br IL_57d3

	IL_23a8:  br IL_23b2

	IL_23ad:  br IL_23b2

	IL_23b2:  ldarg 1

	IL_23b6:  nop 
	IL_23b7:  nop 
	IL_23b8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23bd:  ldstr "class"
	IL_23c2:  call int32 string::Compare(string, string)
	IL_23c7:  stloc 0

	IL_23cb:  nop 
	IL_23cc:  nop 
	IL_23cd:  ldloc 0

	IL_23d1:  nop 
	IL_23d2:  nop 
	IL_23d3:  ldc.i4 0
	IL_23d8:  beq IL_23e2

	IL_23dd:  br IL_242f

	IL_23e2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok::'.ctor'()
	IL_23e7:  stloc 74

	IL_23eb:  nop 
	IL_23ec:  nop 
	IL_23ed:  ldloc 74

	IL_23f1:  nop 
	IL_23f2:  nop 
	IL_23f3:  ldarg 1

	IL_23f7:  nop 
	IL_23f8:  nop 
	IL_23f9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_23fe:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2403:  ldloc 74

	IL_2407:  nop 
	IL_2408:  nop 
	IL_2409:  ldarg 1

	IL_240d:  nop 
	IL_240e:  nop 
	IL_240f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2414:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2419:  ldloc 74

	IL_241d:  nop 
	IL_241e:  nop 
	IL_241f:  starg 1

	IL_2423:  nop 
	IL_2424:  nop 
	IL_2425:  br IL_57d3

	IL_242a:  br IL_2434

	IL_242f:  br IL_2434

	IL_2434:  ldarg 1

	IL_2438:  nop 
	IL_2439:  nop 
	IL_243a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_243f:  ldstr "delegate"
	IL_2444:  call int32 string::Compare(string, string)
	IL_2449:  stloc 0

	IL_244d:  nop 
	IL_244e:  nop 
	IL_244f:  ldloc 0

	IL_2453:  nop 
	IL_2454:  nop 
	IL_2455:  ldc.i4 0
	IL_245a:  beq IL_2464

	IL_245f:  br IL_24b1

	IL_2464:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DelegateTok::'.ctor'()
	IL_2469:  stloc 75

	IL_246d:  nop 
	IL_246e:  nop 
	IL_246f:  ldloc 75

	IL_2473:  nop 
	IL_2474:  nop 
	IL_2475:  ldarg 1

	IL_2479:  nop 
	IL_247a:  nop 
	IL_247b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2480:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2485:  ldloc 75

	IL_2489:  nop 
	IL_248a:  nop 
	IL_248b:  ldarg 1

	IL_248f:  nop 
	IL_2490:  nop 
	IL_2491:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2496:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_249b:  ldloc 75

	IL_249f:  nop 
	IL_24a0:  nop 
	IL_24a1:  starg 1

	IL_24a5:  nop 
	IL_24a6:  nop 
	IL_24a7:  br IL_57d3

	IL_24ac:  br IL_24b6

	IL_24b1:  br IL_24b6

	IL_24b6:  ldarg 1

	IL_24ba:  nop 
	IL_24bb:  nop 
	IL_24bc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24c1:  ldstr "extends"
	IL_24c6:  call int32 string::Compare(string, string)
	IL_24cb:  stloc 0

	IL_24cf:  nop 
	IL_24d0:  nop 
	IL_24d1:  ldloc 0

	IL_24d5:  nop 
	IL_24d6:  nop 
	IL_24d7:  ldc.i4 0
	IL_24dc:  beq IL_24e6

	IL_24e1:  br IL_2533

	IL_24e6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok::'.ctor'()
	IL_24eb:  stloc 76

	IL_24ef:  nop 
	IL_24f0:  nop 
	IL_24f1:  ldloc 76

	IL_24f5:  nop 
	IL_24f6:  nop 
	IL_24f7:  ldarg 1

	IL_24fb:  nop 
	IL_24fc:  nop 
	IL_24fd:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2502:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2507:  ldloc 76

	IL_250b:  nop 
	IL_250c:  nop 
	IL_250d:  ldarg 1

	IL_2511:  nop 
	IL_2512:  nop 
	IL_2513:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2518:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_251d:  ldloc 76

	IL_2521:  nop 
	IL_2522:  nop 
	IL_2523:  starg 1

	IL_2527:  nop 
	IL_2528:  nop 
	IL_2529:  br IL_57d3

	IL_252e:  br IL_2538

	IL_2533:  br IL_2538

	IL_2538:  ldarg 1

	IL_253c:  nop 
	IL_253d:  nop 
	IL_253e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2543:  ldstr "method"
	IL_2548:  call int32 string::Compare(string, string)
	IL_254d:  stloc 0

	IL_2551:  nop 
	IL_2552:  nop 
	IL_2553:  ldloc 0

	IL_2557:  nop 
	IL_2558:  nop 
	IL_2559:  ldc.i4 0
	IL_255e:  beq IL_2568

	IL_2563:  br IL_25b5

	IL_2568:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok::'.ctor'()
	IL_256d:  stloc 77

	IL_2571:  nop 
	IL_2572:  nop 
	IL_2573:  ldloc 77

	IL_2577:  nop 
	IL_2578:  nop 
	IL_2579:  ldarg 1

	IL_257d:  nop 
	IL_257e:  nop 
	IL_257f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2584:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2589:  ldloc 77

	IL_258d:  nop 
	IL_258e:  nop 
	IL_258f:  ldarg 1

	IL_2593:  nop 
	IL_2594:  nop 
	IL_2595:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_259a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_259f:  ldloc 77

	IL_25a3:  nop 
	IL_25a4:  nop 
	IL_25a5:  starg 1

	IL_25a9:  nop 
	IL_25aa:  nop 
	IL_25ab:  br IL_57d3

	IL_25b0:  br IL_25ba

	IL_25b5:  br IL_25ba

	IL_25ba:  ldarg 1

	IL_25be:  nop 
	IL_25bf:  nop 
	IL_25c0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_25c5:  ldstr "end"
	IL_25ca:  call int32 string::Compare(string, string)
	IL_25cf:  stloc 0

	IL_25d3:  nop 
	IL_25d4:  nop 
	IL_25d5:  ldloc 0

	IL_25d9:  nop 
	IL_25da:  nop 
	IL_25db:  ldc.i4 0
	IL_25e0:  beq IL_25ea

	IL_25e5:  br IL_2637

	IL_25ea:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok::'.ctor'()
	IL_25ef:  stloc 78

	IL_25f3:  nop 
	IL_25f4:  nop 
	IL_25f5:  ldloc 78

	IL_25f9:  nop 
	IL_25fa:  nop 
	IL_25fb:  ldarg 1

	IL_25ff:  nop 
	IL_2600:  nop 
	IL_2601:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2606:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_260b:  ldloc 78

	IL_260f:  nop 
	IL_2610:  nop 
	IL_2611:  ldarg 1

	IL_2615:  nop 
	IL_2616:  nop 
	IL_2617:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_261c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2621:  ldloc 78

	IL_2625:  nop 
	IL_2626:  nop 
	IL_2627:  starg 1

	IL_262b:  nop 
	IL_262c:  nop 
	IL_262d:  br IL_57d3

	IL_2632:  br IL_263c

	IL_2637:  br IL_263c

	IL_263c:  ldarg 1

	IL_2640:  nop 
	IL_2641:  nop 
	IL_2642:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2647:  ldstr "return"
	IL_264c:  call int32 string::Compare(string, string)
	IL_2651:  stloc 0

	IL_2655:  nop 
	IL_2656:  nop 
	IL_2657:  ldloc 0

	IL_265b:  nop 
	IL_265c:  nop 
	IL_265d:  ldc.i4 0
	IL_2662:  beq IL_266c

	IL_2667:  br IL_26b9

	IL_266c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok::'.ctor'()
	IL_2671:  stloc 79

	IL_2675:  nop 
	IL_2676:  nop 
	IL_2677:  ldloc 79

	IL_267b:  nop 
	IL_267c:  nop 
	IL_267d:  ldarg 1

	IL_2681:  nop 
	IL_2682:  nop 
	IL_2683:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2688:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_268d:  ldloc 79

	IL_2691:  nop 
	IL_2692:  nop 
	IL_2693:  ldarg 1

	IL_2697:  nop 
	IL_2698:  nop 
	IL_2699:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_269e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26a3:  ldloc 79

	IL_26a7:  nop 
	IL_26a8:  nop 
	IL_26a9:  starg 1

	IL_26ad:  nop 
	IL_26ae:  nop 
	IL_26af:  br IL_57d3

	IL_26b4:  br IL_26be

	IL_26b9:  br IL_26be

	IL_26be:  ldarg 1

	IL_26c2:  nop 
	IL_26c3:  nop 
	IL_26c4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26c9:  ldstr "var"
	IL_26ce:  call int32 string::Compare(string, string)
	IL_26d3:  stloc 0

	IL_26d7:  nop 
	IL_26d8:  nop 
	IL_26d9:  ldloc 0

	IL_26dd:  nop 
	IL_26de:  nop 
	IL_26df:  ldc.i4 0
	IL_26e4:  beq IL_26ee

	IL_26e9:  br IL_273b

	IL_26ee:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok::'.ctor'()
	IL_26f3:  stloc 80

	IL_26f7:  nop 
	IL_26f8:  nop 
	IL_26f9:  ldloc 80

	IL_26fd:  nop 
	IL_26fe:  nop 
	IL_26ff:  ldarg 1

	IL_2703:  nop 
	IL_2704:  nop 
	IL_2705:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_270a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_270f:  ldloc 80

	IL_2713:  nop 
	IL_2714:  nop 
	IL_2715:  ldarg 1

	IL_2719:  nop 
	IL_271a:  nop 
	IL_271b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2720:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2725:  ldloc 80

	IL_2729:  nop 
	IL_272a:  nop 
	IL_272b:  starg 1

	IL_272f:  nop 
	IL_2730:  nop 
	IL_2731:  br IL_57d3

	IL_2736:  br IL_2740

	IL_273b:  br IL_2740

	IL_2740:  ldarg 1

	IL_2744:  nop 
	IL_2745:  nop 
	IL_2746:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_274b:  ldstr "as"
	IL_2750:  call int32 string::Compare(string, string)
	IL_2755:  stloc 0

	IL_2759:  nop 
	IL_275a:  nop 
	IL_275b:  ldloc 0

	IL_275f:  nop 
	IL_2760:  nop 
	IL_2761:  ldc.i4 0
	IL_2766:  beq IL_2770

	IL_276b:  br IL_27bd

	IL_2770:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok::'.ctor'()
	IL_2775:  stloc 81

	IL_2779:  nop 
	IL_277a:  nop 
	IL_277b:  ldloc 81

	IL_277f:  nop 
	IL_2780:  nop 
	IL_2781:  ldarg 1

	IL_2785:  nop 
	IL_2786:  nop 
	IL_2787:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_278c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2791:  ldloc 81

	IL_2795:  nop 
	IL_2796:  nop 
	IL_2797:  ldarg 1

	IL_279b:  nop 
	IL_279c:  nop 
	IL_279d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27a2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27a7:  ldloc 81

	IL_27ab:  nop 
	IL_27ac:  nop 
	IL_27ad:  starg 1

	IL_27b1:  nop 
	IL_27b2:  nop 
	IL_27b3:  br IL_57d3

	IL_27b8:  br IL_27c2

	IL_27bd:  br IL_27c2

	IL_27c2:  ldarg 1

	IL_27c6:  nop 
	IL_27c7:  nop 
	IL_27c8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27cd:  ldstr "of"
	IL_27d2:  call int32 string::Compare(string, string)
	IL_27d7:  stloc 0

	IL_27db:  nop 
	IL_27dc:  nop 
	IL_27dd:  ldloc 0

	IL_27e1:  nop 
	IL_27e2:  nop 
	IL_27e3:  ldc.i4 0
	IL_27e8:  beq IL_27f2

	IL_27ed:  br IL_283f

	IL_27f2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok::'.ctor'()
	IL_27f7:  stloc 82

	IL_27fb:  nop 
	IL_27fc:  nop 
	IL_27fd:  ldloc 82

	IL_2801:  nop 
	IL_2802:  nop 
	IL_2803:  ldarg 1

	IL_2807:  nop 
	IL_2808:  nop 
	IL_2809:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_280e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2813:  ldloc 82

	IL_2817:  nop 
	IL_2818:  nop 
	IL_2819:  ldarg 1

	IL_281d:  nop 
	IL_281e:  nop 
	IL_281f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2824:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2829:  ldloc 82

	IL_282d:  nop 
	IL_282e:  nop 
	IL_282f:  starg 1

	IL_2833:  nop 
	IL_2834:  nop 
	IL_2835:  br IL_57d3

	IL_283a:  br IL_2844

	IL_283f:  br IL_2844

	IL_2844:  ldarg 1

	IL_2848:  nop 
	IL_2849:  nop 
	IL_284a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_284f:  ldstr "private"
	IL_2854:  call int32 string::Compare(string, string)
	IL_2859:  stloc 0

	IL_285d:  nop 
	IL_285e:  nop 
	IL_285f:  ldloc 0

	IL_2863:  nop 
	IL_2864:  nop 
	IL_2865:  ldc.i4 0
	IL_286a:  beq IL_2874

	IL_286f:  br IL_28c1

	IL_2874:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr::'.ctor'()
	IL_2879:  stloc 83

	IL_287d:  nop 
	IL_287e:  nop 
	IL_287f:  ldloc 83

	IL_2883:  nop 
	IL_2884:  nop 
	IL_2885:  ldarg 1

	IL_2889:  nop 
	IL_288a:  nop 
	IL_288b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2890:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2895:  ldloc 83

	IL_2899:  nop 
	IL_289a:  nop 
	IL_289b:  ldarg 1

	IL_289f:  nop 
	IL_28a0:  nop 
	IL_28a1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28a6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28ab:  ldloc 83

	IL_28af:  nop 
	IL_28b0:  nop 
	IL_28b1:  starg 1

	IL_28b5:  nop 
	IL_28b6:  nop 
	IL_28b7:  br IL_57d3

	IL_28bc:  br IL_28c6

	IL_28c1:  br IL_28c6

	IL_28c6:  ldarg 1

	IL_28ca:  nop 
	IL_28cb:  nop 
	IL_28cc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28d1:  ldstr "public"
	IL_28d6:  call int32 string::Compare(string, string)
	IL_28db:  stloc 0

	IL_28df:  nop 
	IL_28e0:  nop 
	IL_28e1:  ldloc 0

	IL_28e5:  nop 
	IL_28e6:  nop 
	IL_28e7:  ldc.i4 0
	IL_28ec:  beq IL_28f6

	IL_28f1:  br IL_2943

	IL_28f6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr::'.ctor'()
	IL_28fb:  stloc 84

	IL_28ff:  nop 
	IL_2900:  nop 
	IL_2901:  ldloc 84

	IL_2905:  nop 
	IL_2906:  nop 
	IL_2907:  ldarg 1

	IL_290b:  nop 
	IL_290c:  nop 
	IL_290d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2912:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2917:  ldloc 84

	IL_291b:  nop 
	IL_291c:  nop 
	IL_291d:  ldarg 1

	IL_2921:  nop 
	IL_2922:  nop 
	IL_2923:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2928:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_292d:  ldloc 84

	IL_2931:  nop 
	IL_2932:  nop 
	IL_2933:  starg 1

	IL_2937:  nop 
	IL_2938:  nop 
	IL_2939:  br IL_57d3

	IL_293e:  br IL_2948

	IL_2943:  br IL_2948

	IL_2948:  ldarg 1

	IL_294c:  nop 
	IL_294d:  nop 
	IL_294e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2953:  ldstr "initonly"
	IL_2958:  call int32 string::Compare(string, string)
	IL_295d:  stloc 0

	IL_2961:  nop 
	IL_2962:  nop 
	IL_2963:  ldloc 0

	IL_2967:  nop 
	IL_2968:  nop 
	IL_2969:  ldc.i4 0
	IL_296e:  beq IL_2978

	IL_2973:  br IL_29c5

	IL_2978:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr::'.ctor'()
	IL_297d:  stloc 85

	IL_2981:  nop 
	IL_2982:  nop 
	IL_2983:  ldloc 85

	IL_2987:  nop 
	IL_2988:  nop 
	IL_2989:  ldarg 1

	IL_298d:  nop 
	IL_298e:  nop 
	IL_298f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2994:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2999:  ldloc 85

	IL_299d:  nop 
	IL_299e:  nop 
	IL_299f:  ldarg 1

	IL_29a3:  nop 
	IL_29a4:  nop 
	IL_29a5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29aa:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29af:  ldloc 85

	IL_29b3:  nop 
	IL_29b4:  nop 
	IL_29b5:  starg 1

	IL_29b9:  nop 
	IL_29ba:  nop 
	IL_29bb:  br IL_57d3

	IL_29c0:  br IL_29ca

	IL_29c5:  br IL_29ca

	IL_29ca:  ldarg 1

	IL_29ce:  nop 
	IL_29cf:  nop 
	IL_29d0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29d5:  ldstr "static"
	IL_29da:  call int32 string::Compare(string, string)
	IL_29df:  stloc 0

	IL_29e3:  nop 
	IL_29e4:  nop 
	IL_29e5:  ldloc 0

	IL_29e9:  nop 
	IL_29ea:  nop 
	IL_29eb:  ldc.i4 0
	IL_29f0:  beq IL_29fa

	IL_29f5:  br IL_2a47

	IL_29fa:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr::'.ctor'()
	IL_29ff:  stloc 86

	IL_2a03:  nop 
	IL_2a04:  nop 
	IL_2a05:  ldloc 86

	IL_2a09:  nop 
	IL_2a0a:  nop 
	IL_2a0b:  ldarg 1

	IL_2a0f:  nop 
	IL_2a10:  nop 
	IL_2a11:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a16:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a1b:  ldloc 86

	IL_2a1f:  nop 
	IL_2a20:  nop 
	IL_2a21:  ldarg 1

	IL_2a25:  nop 
	IL_2a26:  nop 
	IL_2a27:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a2c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a31:  ldloc 86

	IL_2a35:  nop 
	IL_2a36:  nop 
	IL_2a37:  starg 1

	IL_2a3b:  nop 
	IL_2a3c:  nop 
	IL_2a3d:  br IL_57d3

	IL_2a42:  br IL_2a4c

	IL_2a47:  br IL_2a4c

	IL_2a4c:  ldarg 1

	IL_2a50:  nop 
	IL_2a51:  nop 
	IL_2a52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a57:  ldstr "specialname"
	IL_2a5c:  call int32 string::Compare(string, string)
	IL_2a61:  stloc 0

	IL_2a65:  nop 
	IL_2a66:  nop 
	IL_2a67:  ldloc 0

	IL_2a6b:  nop 
	IL_2a6c:  nop 
	IL_2a6d:  ldc.i4 0
	IL_2a72:  beq IL_2a7c

	IL_2a77:  br IL_2ac9

	IL_2a7c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr::'.ctor'()
	IL_2a81:  stloc 87

	IL_2a85:  nop 
	IL_2a86:  nop 
	IL_2a87:  ldloc 87

	IL_2a8b:  nop 
	IL_2a8c:  nop 
	IL_2a8d:  ldarg 1

	IL_2a91:  nop 
	IL_2a92:  nop 
	IL_2a93:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a98:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a9d:  ldloc 87

	IL_2aa1:  nop 
	IL_2aa2:  nop 
	IL_2aa3:  ldarg 1

	IL_2aa7:  nop 
	IL_2aa8:  nop 
	IL_2aa9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2aae:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ab3:  ldloc 87

	IL_2ab7:  nop 
	IL_2ab8:  nop 
	IL_2ab9:  starg 1

	IL_2abd:  nop 
	IL_2abe:  nop 
	IL_2abf:  br IL_57d3

	IL_2ac4:  br IL_2ace

	IL_2ac9:  br IL_2ace

	IL_2ace:  ldarg 1

	IL_2ad2:  nop 
	IL_2ad3:  nop 
	IL_2ad4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ad9:  ldstr "sealed"
	IL_2ade:  call int32 string::Compare(string, string)
	IL_2ae3:  stloc 0

	IL_2ae7:  nop 
	IL_2ae8:  nop 
	IL_2ae9:  ldloc 0

	IL_2aed:  nop 
	IL_2aee:  nop 
	IL_2aef:  ldc.i4 0
	IL_2af4:  beq IL_2afe

	IL_2af9:  br IL_2b4b

	IL_2afe:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SealedAttr::'.ctor'()
	IL_2b03:  stloc 88

	IL_2b07:  nop 
	IL_2b08:  nop 
	IL_2b09:  ldloc 88

	IL_2b0d:  nop 
	IL_2b0e:  nop 
	IL_2b0f:  ldarg 1

	IL_2b13:  nop 
	IL_2b14:  nop 
	IL_2b15:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b1a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b1f:  ldloc 88

	IL_2b23:  nop 
	IL_2b24:  nop 
	IL_2b25:  ldarg 1

	IL_2b29:  nop 
	IL_2b2a:  nop 
	IL_2b2b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b30:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b35:  ldloc 88

	IL_2b39:  nop 
	IL_2b3a:  nop 
	IL_2b3b:  starg 1

	IL_2b3f:  nop 
	IL_2b40:  nop 
	IL_2b41:  br IL_57d3

	IL_2b46:  br IL_2b50

	IL_2b4b:  br IL_2b50

	IL_2b50:  ldarg 1

	IL_2b54:  nop 
	IL_2b55:  nop 
	IL_2b56:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b5b:  ldstr "final"
	IL_2b60:  call int32 string::Compare(string, string)
	IL_2b65:  stloc 0

	IL_2b69:  nop 
	IL_2b6a:  nop 
	IL_2b6b:  ldloc 0

	IL_2b6f:  nop 
	IL_2b70:  nop 
	IL_2b71:  ldc.i4 0
	IL_2b76:  beq IL_2b80

	IL_2b7b:  br IL_2bcd

	IL_2b80:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FinalAttr::'.ctor'()
	IL_2b85:  stloc 89

	IL_2b89:  nop 
	IL_2b8a:  nop 
	IL_2b8b:  ldloc 89

	IL_2b8f:  nop 
	IL_2b90:  nop 
	IL_2b91:  ldarg 1

	IL_2b95:  nop 
	IL_2b96:  nop 
	IL_2b97:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b9c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ba1:  ldloc 89

	IL_2ba5:  nop 
	IL_2ba6:  nop 
	IL_2ba7:  ldarg 1

	IL_2bab:  nop 
	IL_2bac:  nop 
	IL_2bad:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bb2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bb7:  ldloc 89

	IL_2bbb:  nop 
	IL_2bbc:  nop 
	IL_2bbd:  starg 1

	IL_2bc1:  nop 
	IL_2bc2:  nop 
	IL_2bc3:  br IL_57d3

	IL_2bc8:  br IL_2bd2

	IL_2bcd:  br IL_2bd2

	IL_2bd2:  ldarg 1

	IL_2bd6:  nop 
	IL_2bd7:  nop 
	IL_2bd8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bdd:  ldstr "hidebysig"
	IL_2be2:  call int32 string::Compare(string, string)
	IL_2be7:  stloc 0

	IL_2beb:  nop 
	IL_2bec:  nop 
	IL_2bed:  ldloc 0

	IL_2bf1:  nop 
	IL_2bf2:  nop 
	IL_2bf3:  ldc.i4 0
	IL_2bf8:  beq IL_2c02

	IL_2bfd:  br IL_2c4f

	IL_2c02:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr::'.ctor'()
	IL_2c07:  stloc 90

	IL_2c0b:  nop 
	IL_2c0c:  nop 
	IL_2c0d:  ldloc 90

	IL_2c11:  nop 
	IL_2c12:  nop 
	IL_2c13:  ldarg 1

	IL_2c17:  nop 
	IL_2c18:  nop 
	IL_2c19:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c1e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c23:  ldloc 90

	IL_2c27:  nop 
	IL_2c28:  nop 
	IL_2c29:  ldarg 1

	IL_2c2d:  nop 
	IL_2c2e:  nop 
	IL_2c2f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c34:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c39:  ldloc 90

	IL_2c3d:  nop 
	IL_2c3e:  nop 
	IL_2c3f:  starg 1

	IL_2c43:  nop 
	IL_2c44:  nop 
	IL_2c45:  br IL_57d3

	IL_2c4a:  br IL_2c54

	IL_2c4f:  br IL_2c54

	IL_2c54:  ldarg 1

	IL_2c58:  nop 
	IL_2c59:  nop 
	IL_2c5a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c5f:  ldstr "family"
	IL_2c64:  call int32 string::Compare(string, string)
	IL_2c69:  stloc 0

	IL_2c6d:  nop 
	IL_2c6e:  nop 
	IL_2c6f:  ldloc 0

	IL_2c73:  nop 
	IL_2c74:  nop 
	IL_2c75:  ldc.i4 0
	IL_2c7a:  beq IL_2c84

	IL_2c7f:  br IL_2cd1

	IL_2c84:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FamilyAttr::'.ctor'()
	IL_2c89:  stloc 91

	IL_2c8d:  nop 
	IL_2c8e:  nop 
	IL_2c8f:  ldloc 91

	IL_2c93:  nop 
	IL_2c94:  nop 
	IL_2c95:  ldarg 1

	IL_2c99:  nop 
	IL_2c9a:  nop 
	IL_2c9b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ca0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ca5:  ldloc 91

	IL_2ca9:  nop 
	IL_2caa:  nop 
	IL_2cab:  ldarg 1

	IL_2caf:  nop 
	IL_2cb0:  nop 
	IL_2cb1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2cb6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2cbb:  ldloc 91

	IL_2cbf:  nop 
	IL_2cc0:  nop 
	IL_2cc1:  starg 1

	IL_2cc5:  nop 
	IL_2cc6:  nop 
	IL_2cc7:  br IL_57d3

	IL_2ccc:  br IL_2cd6

	IL_2cd1:  br IL_2cd6

	IL_2cd6:  ldarg 1

	IL_2cda:  nop 
	IL_2cdb:  nop 
	IL_2cdc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ce1:  ldstr "famorassem"
	IL_2ce6:  call int32 string::Compare(string, string)
	IL_2ceb:  stloc 0

	IL_2cef:  nop 
	IL_2cf0:  nop 
	IL_2cf1:  ldloc 0

	IL_2cf5:  nop 
	IL_2cf6:  nop 
	IL_2cf7:  ldc.i4 0
	IL_2cfc:  beq IL_2d06

	IL_2d01:  br IL_2d53

	IL_2d06:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FamORAssemAttr::'.ctor'()
	IL_2d0b:  stloc 92

	IL_2d0f:  nop 
	IL_2d10:  nop 
	IL_2d11:  ldloc 92

	IL_2d15:  nop 
	IL_2d16:  nop 
	IL_2d17:  ldarg 1

	IL_2d1b:  nop 
	IL_2d1c:  nop 
	IL_2d1d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d22:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d27:  ldloc 92

	IL_2d2b:  nop 
	IL_2d2c:  nop 
	IL_2d2d:  ldarg 1

	IL_2d31:  nop 
	IL_2d32:  nop 
	IL_2d33:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d38:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d3d:  ldloc 92

	IL_2d41:  nop 
	IL_2d42:  nop 
	IL_2d43:  starg 1

	IL_2d47:  nop 
	IL_2d48:  nop 
	IL_2d49:  br IL_57d3

	IL_2d4e:  br IL_2d58

	IL_2d53:  br IL_2d58

	IL_2d58:  ldarg 1

	IL_2d5c:  nop 
	IL_2d5d:  nop 
	IL_2d5e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d63:  ldstr "famandassem"
	IL_2d68:  call int32 string::Compare(string, string)
	IL_2d6d:  stloc 0

	IL_2d71:  nop 
	IL_2d72:  nop 
	IL_2d73:  ldloc 0

	IL_2d77:  nop 
	IL_2d78:  nop 
	IL_2d79:  ldc.i4 0
	IL_2d7e:  beq IL_2d88

	IL_2d83:  br IL_2dd5

	IL_2d88:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.FamANDAssemAttr::'.ctor'()
	IL_2d8d:  stloc 93

	IL_2d91:  nop 
	IL_2d92:  nop 
	IL_2d93:  ldloc 93

	IL_2d97:  nop 
	IL_2d98:  nop 
	IL_2d99:  ldarg 1

	IL_2d9d:  nop 
	IL_2d9e:  nop 
	IL_2d9f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2da4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2da9:  ldloc 93

	IL_2dad:  nop 
	IL_2dae:  nop 
	IL_2daf:  ldarg 1

	IL_2db3:  nop 
	IL_2db4:  nop 
	IL_2db5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2dba:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2dbf:  ldloc 93

	IL_2dc3:  nop 
	IL_2dc4:  nop 
	IL_2dc5:  starg 1

	IL_2dc9:  nop 
	IL_2dca:  nop 
	IL_2dcb:  br IL_57d3

	IL_2dd0:  br IL_2dda

	IL_2dd5:  br IL_2dda

	IL_2dda:  ldarg 1

	IL_2dde:  nop 
	IL_2ddf:  nop 
	IL_2de0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2de5:  ldstr "assembly"
	IL_2dea:  call int32 string::Compare(string, string)
	IL_2def:  stloc 0

	IL_2df3:  nop 
	IL_2df4:  nop 
	IL_2df5:  ldloc 0

	IL_2df9:  nop 
	IL_2dfa:  nop 
	IL_2dfb:  ldc.i4 0
	IL_2e00:  beq IL_2e0a

	IL_2e05:  br IL_2e57

	IL_2e0a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AssemblyAttr::'.ctor'()
	IL_2e0f:  stloc 94

	IL_2e13:  nop 
	IL_2e14:  nop 
	IL_2e15:  ldloc 94

	IL_2e19:  nop 
	IL_2e1a:  nop 
	IL_2e1b:  ldarg 1

	IL_2e1f:  nop 
	IL_2e20:  nop 
	IL_2e21:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e26:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e2b:  ldloc 94

	IL_2e2f:  nop 
	IL_2e30:  nop 
	IL_2e31:  ldarg 1

	IL_2e35:  nop 
	IL_2e36:  nop 
	IL_2e37:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e3c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e41:  ldloc 94

	IL_2e45:  nop 
	IL_2e46:  nop 
	IL_2e47:  starg 1

	IL_2e4b:  nop 
	IL_2e4c:  nop 
	IL_2e4d:  br IL_57d3

	IL_2e52:  br IL_2e5c

	IL_2e57:  br IL_2e5c

	IL_2e5c:  ldarg 1

	IL_2e60:  nop 
	IL_2e61:  nop 
	IL_2e62:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e67:  ldstr "virtual"
	IL_2e6c:  call int32 string::Compare(string, string)
	IL_2e71:  stloc 0

	IL_2e75:  nop 
	IL_2e76:  nop 
	IL_2e77:  ldloc 0

	IL_2e7b:  nop 
	IL_2e7c:  nop 
	IL_2e7d:  ldc.i4 0
	IL_2e82:  beq IL_2e8c

	IL_2e87:  br IL_2ed9

	IL_2e8c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr::'.ctor'()
	IL_2e91:  stloc 95

	IL_2e95:  nop 
	IL_2e96:  nop 
	IL_2e97:  ldloc 95

	IL_2e9b:  nop 
	IL_2e9c:  nop 
	IL_2e9d:  ldarg 1

	IL_2ea1:  nop 
	IL_2ea2:  nop 
	IL_2ea3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ea8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ead:  ldloc 95

	IL_2eb1:  nop 
	IL_2eb2:  nop 
	IL_2eb3:  ldarg 1

	IL_2eb7:  nop 
	IL_2eb8:  nop 
	IL_2eb9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ebe:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ec3:  ldloc 95

	IL_2ec7:  nop 
	IL_2ec8:  nop 
	IL_2ec9:  starg 1

	IL_2ecd:  nop 
	IL_2ece:  nop 
	IL_2ecf:  br IL_57d3

	IL_2ed4:  br IL_2ede

	IL_2ed9:  br IL_2ede

	IL_2ede:  ldarg 1

	IL_2ee2:  nop 
	IL_2ee3:  nop 
	IL_2ee4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ee9:  ldstr "auto"
	IL_2eee:  call int32 string::Compare(string, string)
	IL_2ef3:  stloc 0

	IL_2ef7:  nop 
	IL_2ef8:  nop 
	IL_2ef9:  ldloc 0

	IL_2efd:  nop 
	IL_2efe:  nop 
	IL_2eff:  ldc.i4 0
	IL_2f04:  beq IL_2f0e

	IL_2f09:  br IL_2f5b

	IL_2f0e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr::'.ctor'()
	IL_2f13:  stloc 96

	IL_2f17:  nop 
	IL_2f18:  nop 
	IL_2f19:  ldloc 96

	IL_2f1d:  nop 
	IL_2f1e:  nop 
	IL_2f1f:  ldarg 1

	IL_2f23:  nop 
	IL_2f24:  nop 
	IL_2f25:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f2a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f2f:  ldloc 96

	IL_2f33:  nop 
	IL_2f34:  nop 
	IL_2f35:  ldarg 1

	IL_2f39:  nop 
	IL_2f3a:  nop 
	IL_2f3b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f40:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f45:  ldloc 96

	IL_2f49:  nop 
	IL_2f4a:  nop 
	IL_2f4b:  starg 1

	IL_2f4f:  nop 
	IL_2f50:  nop 
	IL_2f51:  br IL_57d3

	IL_2f56:  br IL_2f60

	IL_2f5b:  br IL_2f60

	IL_2f60:  ldarg 1

	IL_2f64:  nop 
	IL_2f65:  nop 
	IL_2f66:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f6b:  ldstr "autochar"
	IL_2f70:  call int32 string::Compare(string, string)
	IL_2f75:  stloc 0

	IL_2f79:  nop 
	IL_2f7a:  nop 
	IL_2f7b:  ldloc 0

	IL_2f7f:  nop 
	IL_2f80:  nop 
	IL_2f81:  ldc.i4 0
	IL_2f86:  beq IL_2f90

	IL_2f8b:  br IL_2fdd

	IL_2f90:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr::'.ctor'()
	IL_2f95:  stloc 97

	IL_2f99:  nop 
	IL_2f9a:  nop 
	IL_2f9b:  ldloc 97

	IL_2f9f:  nop 
	IL_2fa0:  nop 
	IL_2fa1:  ldarg 1

	IL_2fa5:  nop 
	IL_2fa6:  nop 
	IL_2fa7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fac:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fb1:  ldloc 97

	IL_2fb5:  nop 
	IL_2fb6:  nop 
	IL_2fb7:  ldarg 1

	IL_2fbb:  nop 
	IL_2fbc:  nop 
	IL_2fbd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fc2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fc7:  ldloc 97

	IL_2fcb:  nop 
	IL_2fcc:  nop 
	IL_2fcd:  starg 1

	IL_2fd1:  nop 
	IL_2fd2:  nop 
	IL_2fd3:  br IL_57d3

	IL_2fd8:  br IL_2fe2

	IL_2fdd:  br IL_2fe2

	IL_2fe2:  ldarg 1

	IL_2fe6:  nop 
	IL_2fe7:  nop 
	IL_2fe8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fed:  ldstr "ansi"
	IL_2ff2:  call int32 string::Compare(string, string)
	IL_2ff7:  stloc 0

	IL_2ffb:  nop 
	IL_2ffc:  nop 
	IL_2ffd:  ldloc 0

	IL_3001:  nop 
	IL_3002:  nop 
	IL_3003:  ldc.i4 0
	IL_3008:  beq IL_3012

	IL_300d:  br IL_305f

	IL_3012:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr::'.ctor'()
	IL_3017:  stloc 98

	IL_301b:  nop 
	IL_301c:  nop 
	IL_301d:  ldloc 98

	IL_3021:  nop 
	IL_3022:  nop 
	IL_3023:  ldarg 1

	IL_3027:  nop 
	IL_3028:  nop 
	IL_3029:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_302e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3033:  ldloc 98

	IL_3037:  nop 
	IL_3038:  nop 
	IL_3039:  ldarg 1

	IL_303d:  nop 
	IL_303e:  nop 
	IL_303f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3044:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3049:  ldloc 98

	IL_304d:  nop 
	IL_304e:  nop 
	IL_304f:  starg 1

	IL_3053:  nop 
	IL_3054:  nop 
	IL_3055:  br IL_57d3

	IL_305a:  br IL_3064

	IL_305f:  br IL_3064

	IL_3064:  ldarg 1

	IL_3068:  nop 
	IL_3069:  nop 
	IL_306a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_306f:  ldstr "beforefieldinit"
	IL_3074:  call int32 string::Compare(string, string)
	IL_3079:  stloc 0

	IL_307d:  nop 
	IL_307e:  nop 
	IL_307f:  ldloc 0

	IL_3083:  nop 
	IL_3084:  nop 
	IL_3085:  ldc.i4 0
	IL_308a:  beq IL_3094

	IL_308f:  br IL_30e1

	IL_3094:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr::'.ctor'()
	IL_3099:  stloc 99

	IL_309d:  nop 
	IL_309e:  nop 
	IL_309f:  ldloc 99

	IL_30a3:  nop 
	IL_30a4:  nop 
	IL_30a5:  ldarg 1

	IL_30a9:  nop 
	IL_30aa:  nop 
	IL_30ab:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30b0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30b5:  ldloc 99

	IL_30b9:  nop 
	IL_30ba:  nop 
	IL_30bb:  ldarg 1

	IL_30bf:  nop 
	IL_30c0:  nop 
	IL_30c1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30c6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30cb:  ldloc 99

	IL_30cf:  nop 
	IL_30d0:  nop 
	IL_30d1:  starg 1

	IL_30d5:  nop 
	IL_30d6:  nop 
	IL_30d7:  br IL_57d3

	IL_30dc:  br IL_30e6

	IL_30e1:  br IL_30e6

	IL_30e6:  ldarg 1

	IL_30ea:  nop 
	IL_30eb:  nop 
	IL_30ec:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30f1:  ldstr "string"
	IL_30f6:  call int32 string::Compare(string, string)
	IL_30fb:  stloc 0

	IL_30ff:  nop 
	IL_3100:  nop 
	IL_3101:  ldloc 0

	IL_3105:  nop 
	IL_3106:  nop 
	IL_3107:  ldc.i4 0
	IL_310c:  beq IL_3116

	IL_3111:  br IL_3178

	IL_3116:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok::'.ctor'()
	IL_311b:  stloc 100

	IL_311f:  nop 
	IL_3120:  nop 
	IL_3121:  ldloc 100

	IL_3125:  nop 
	IL_3126:  nop 
	IL_3127:  ldarg 1

	IL_312b:  nop 
	IL_312c:  nop 
	IL_312d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3132:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3137:  ldloc 100

	IL_313b:  nop 
	IL_313c:  nop 
	IL_313d:  ldarg 1

	IL_3141:  nop 
	IL_3142:  nop 
	IL_3143:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3148:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_314d:  ldloc 100

	IL_3151:  nop 
	IL_3152:  nop 
	IL_3153:  ldtoken [mscorlib]System.String
	IL_3158:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_315d:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3162:  ldloc 100

	IL_3166:  nop 
	IL_3167:  nop 
	IL_3168:  starg 1

	IL_316c:  nop 
	IL_316d:  nop 
	IL_316e:  br IL_57d3

	IL_3173:  br IL_317d

	IL_3178:  br IL_317d

	IL_317d:  ldarg 1

	IL_3181:  nop 
	IL_3182:  nop 
	IL_3183:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3188:  ldstr "void"
	IL_318d:  call int32 string::Compare(string, string)
	IL_3192:  stloc 0

	IL_3196:  nop 
	IL_3197:  nop 
	IL_3198:  ldloc 0

	IL_319c:  nop 
	IL_319d:  nop 
	IL_319e:  ldc.i4 0
	IL_31a3:  beq IL_31ad

	IL_31a8:  br IL_320f

	IL_31ad:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok::'.ctor'()
	IL_31b2:  stloc 101

	IL_31b6:  nop 
	IL_31b7:  nop 
	IL_31b8:  ldloc 101

	IL_31bc:  nop 
	IL_31bd:  nop 
	IL_31be:  ldarg 1

	IL_31c2:  nop 
	IL_31c3:  nop 
	IL_31c4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_31c9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_31ce:  ldloc 101

	IL_31d2:  nop 
	IL_31d3:  nop 
	IL_31d4:  ldarg 1

	IL_31d8:  nop 
	IL_31d9:  nop 
	IL_31da:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31df:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31e4:  ldloc 101

	IL_31e8:  nop 
	IL_31e9:  nop 
	IL_31ea:  ldtoken [mscorlib]System.Void
	IL_31ef:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_31f4:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_31f9:  ldloc 101

	IL_31fd:  nop 
	IL_31fe:  nop 
	IL_31ff:  starg 1

	IL_3203:  nop 
	IL_3204:  nop 
	IL_3205:  br IL_57d3

	IL_320a:  br IL_3214

	IL_320f:  br IL_3214

	IL_3214:  ldarg 1

	IL_3218:  nop 
	IL_3219:  nop 
	IL_321a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_321f:  ldstr "decimal"
	IL_3224:  call int32 string::Compare(string, string)
	IL_3229:  stloc 0

	IL_322d:  nop 
	IL_322e:  nop 
	IL_322f:  ldloc 0

	IL_3233:  nop 
	IL_3234:  nop 
	IL_3235:  ldc.i4 0
	IL_323a:  beq IL_3244

	IL_323f:  br IL_32a6

	IL_3244:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok::'.ctor'()
	IL_3249:  stloc 102

	IL_324d:  nop 
	IL_324e:  nop 
	IL_324f:  ldloc 102

	IL_3253:  nop 
	IL_3254:  nop 
	IL_3255:  ldarg 1

	IL_3259:  nop 
	IL_325a:  nop 
	IL_325b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3260:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3265:  ldloc 102

	IL_3269:  nop 
	IL_326a:  nop 
	IL_326b:  ldarg 1

	IL_326f:  nop 
	IL_3270:  nop 
	IL_3271:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3276:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_327b:  ldloc 102

	IL_327f:  nop 
	IL_3280:  nop 
	IL_3281:  ldtoken [mscorlib]System.Decimal
	IL_3286:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_328b:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3290:  ldloc 102

	IL_3294:  nop 
	IL_3295:  nop 
	IL_3296:  starg 1

	IL_329a:  nop 
	IL_329b:  nop 
	IL_329c:  br IL_57d3

	IL_32a1:  br IL_32ab

	IL_32a6:  br IL_32ab

	IL_32ab:  ldarg 1

	IL_32af:  nop 
	IL_32b0:  nop 
	IL_32b1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_32b6:  ldstr "integer"
	IL_32bb:  call int32 string::Compare(string, string)
	IL_32c0:  stloc 0

	IL_32c4:  nop 
	IL_32c5:  nop 
	IL_32c6:  ldloc 0

	IL_32ca:  nop 
	IL_32cb:  nop 
	IL_32cc:  ldc.i4 0
	IL_32d1:  beq IL_32db

	IL_32d6:  br IL_333d

	IL_32db:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok::'.ctor'()
	IL_32e0:  stloc 103

	IL_32e4:  nop 
	IL_32e5:  nop 
	IL_32e6:  ldloc 103

	IL_32ea:  nop 
	IL_32eb:  nop 
	IL_32ec:  ldarg 1

	IL_32f0:  nop 
	IL_32f1:  nop 
	IL_32f2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_32f7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_32fc:  ldloc 103

	IL_3300:  nop 
	IL_3301:  nop 
	IL_3302:  ldarg 1

	IL_3306:  nop 
	IL_3307:  nop 
	IL_3308:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_330d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3312:  ldloc 103

	IL_3316:  nop 
	IL_3317:  nop 
	IL_3318:  ldtoken [mscorlib]System.Int32
	IL_331d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3322:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3327:  ldloc 103

	IL_332b:  nop 
	IL_332c:  nop 
	IL_332d:  starg 1

	IL_3331:  nop 
	IL_3332:  nop 
	IL_3333:  br IL_57d3

	IL_3338:  br IL_3342

	IL_333d:  br IL_3342

	IL_3342:  ldarg 1

	IL_3346:  nop 
	IL_3347:  nop 
	IL_3348:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_334d:  ldstr "intptr"
	IL_3352:  call int32 string::Compare(string, string)
	IL_3357:  stloc 0

	IL_335b:  nop 
	IL_335c:  nop 
	IL_335d:  ldloc 0

	IL_3361:  nop 
	IL_3362:  nop 
	IL_3363:  ldc.i4 0
	IL_3368:  beq IL_3372

	IL_336d:  br IL_33d4

	IL_3372:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok::'.ctor'()
	IL_3377:  stloc 104

	IL_337b:  nop 
	IL_337c:  nop 
	IL_337d:  ldloc 104

	IL_3381:  nop 
	IL_3382:  nop 
	IL_3383:  ldarg 1

	IL_3387:  nop 
	IL_3388:  nop 
	IL_3389:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_338e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3393:  ldloc 104

	IL_3397:  nop 
	IL_3398:  nop 
	IL_3399:  ldarg 1

	IL_339d:  nop 
	IL_339e:  nop 
	IL_339f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33a4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33a9:  ldloc 104

	IL_33ad:  nop 
	IL_33ae:  nop 
	IL_33af:  ldtoken [mscorlib]System.IntPtr
	IL_33b4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_33b9:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_33be:  ldloc 104

	IL_33c2:  nop 
	IL_33c3:  nop 
	IL_33c4:  starg 1

	IL_33c8:  nop 
	IL_33c9:  nop 
	IL_33ca:  br IL_57d3

	IL_33cf:  br IL_33d9

	IL_33d4:  br IL_33d9

	IL_33d9:  ldarg 1

	IL_33dd:  nop 
	IL_33de:  nop 
	IL_33df:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33e4:  ldstr "uinteger"
	IL_33e9:  call int32 string::Compare(string, string)
	IL_33ee:  stloc 0

	IL_33f2:  nop 
	IL_33f3:  nop 
	IL_33f4:  ldloc 0

	IL_33f8:  nop 
	IL_33f9:  nop 
	IL_33fa:  ldc.i4 0
	IL_33ff:  beq IL_3409

	IL_3404:  br IL_346b

	IL_3409:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok::'.ctor'()
	IL_340e:  stloc 105

	IL_3412:  nop 
	IL_3413:  nop 
	IL_3414:  ldloc 105

	IL_3418:  nop 
	IL_3419:  nop 
	IL_341a:  ldarg 1

	IL_341e:  nop 
	IL_341f:  nop 
	IL_3420:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3425:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_342a:  ldloc 105

	IL_342e:  nop 
	IL_342f:  nop 
	IL_3430:  ldarg 1

	IL_3434:  nop 
	IL_3435:  nop 
	IL_3436:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_343b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3440:  ldloc 105

	IL_3444:  nop 
	IL_3445:  nop 
	IL_3446:  ldtoken [mscorlib]System.UInt32
	IL_344b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3450:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3455:  ldloc 105

	IL_3459:  nop 
	IL_345a:  nop 
	IL_345b:  starg 1

	IL_345f:  nop 
	IL_3460:  nop 
	IL_3461:  br IL_57d3

	IL_3466:  br IL_3470

	IL_346b:  br IL_3470

	IL_3470:  ldarg 1

	IL_3474:  nop 
	IL_3475:  nop 
	IL_3476:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_347b:  ldstr "double"
	IL_3480:  call int32 string::Compare(string, string)
	IL_3485:  stloc 0

	IL_3489:  nop 
	IL_348a:  nop 
	IL_348b:  ldloc 0

	IL_348f:  nop 
	IL_3490:  nop 
	IL_3491:  ldc.i4 0
	IL_3496:  beq IL_34a0

	IL_349b:  br IL_3502

	IL_34a0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok::'.ctor'()
	IL_34a5:  stloc 106

	IL_34a9:  nop 
	IL_34aa:  nop 
	IL_34ab:  ldloc 106

	IL_34af:  nop 
	IL_34b0:  nop 
	IL_34b1:  ldarg 1

	IL_34b5:  nop 
	IL_34b6:  nop 
	IL_34b7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_34bc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_34c1:  ldloc 106

	IL_34c5:  nop 
	IL_34c6:  nop 
	IL_34c7:  ldarg 1

	IL_34cb:  nop 
	IL_34cc:  nop 
	IL_34cd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_34d2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_34d7:  ldloc 106

	IL_34db:  nop 
	IL_34dc:  nop 
	IL_34dd:  ldtoken [mscorlib]System.Double
	IL_34e2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_34e7:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_34ec:  ldloc 106

	IL_34f0:  nop 
	IL_34f1:  nop 
	IL_34f2:  starg 1

	IL_34f6:  nop 
	IL_34f7:  nop 
	IL_34f8:  br IL_57d3

	IL_34fd:  br IL_3507

	IL_3502:  br IL_3507

	IL_3507:  ldarg 1

	IL_350b:  nop 
	IL_350c:  nop 
	IL_350d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3512:  ldstr "boolean"
	IL_3517:  call int32 string::Compare(string, string)
	IL_351c:  stloc 0

	IL_3520:  nop 
	IL_3521:  nop 
	IL_3522:  ldloc 0

	IL_3526:  nop 
	IL_3527:  nop 
	IL_3528:  ldc.i4 0
	IL_352d:  beq IL_3537

	IL_3532:  br IL_3599

	IL_3537:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok::'.ctor'()
	IL_353c:  stloc 107

	IL_3540:  nop 
	IL_3541:  nop 
	IL_3542:  ldloc 107

	IL_3546:  nop 
	IL_3547:  nop 
	IL_3548:  ldarg 1

	IL_354c:  nop 
	IL_354d:  nop 
	IL_354e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3553:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3558:  ldloc 107

	IL_355c:  nop 
	IL_355d:  nop 
	IL_355e:  ldarg 1

	IL_3562:  nop 
	IL_3563:  nop 
	IL_3564:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3569:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_356e:  ldloc 107

	IL_3572:  nop 
	IL_3573:  nop 
	IL_3574:  ldtoken [mscorlib]System.Boolean
	IL_3579:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_357e:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3583:  ldloc 107

	IL_3587:  nop 
	IL_3588:  nop 
	IL_3589:  starg 1

	IL_358d:  nop 
	IL_358e:  nop 
	IL_358f:  br IL_57d3

	IL_3594:  br IL_359e

	IL_3599:  br IL_359e

	IL_359e:  ldarg 1

	IL_35a2:  nop 
	IL_35a3:  nop 
	IL_35a4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_35a9:  ldstr "char"
	IL_35ae:  call int32 string::Compare(string, string)
	IL_35b3:  stloc 0

	IL_35b7:  nop 
	IL_35b8:  nop 
	IL_35b9:  ldloc 0

	IL_35bd:  nop 
	IL_35be:  nop 
	IL_35bf:  ldc.i4 0
	IL_35c4:  beq IL_35ce

	IL_35c9:  br IL_3630

	IL_35ce:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok::'.ctor'()
	IL_35d3:  stloc 108

	IL_35d7:  nop 
	IL_35d8:  nop 
	IL_35d9:  ldloc 108

	IL_35dd:  nop 
	IL_35de:  nop 
	IL_35df:  ldarg 1

	IL_35e3:  nop 
	IL_35e4:  nop 
	IL_35e5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_35ea:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_35ef:  ldloc 108

	IL_35f3:  nop 
	IL_35f4:  nop 
	IL_35f5:  ldarg 1

	IL_35f9:  nop 
	IL_35fa:  nop 
	IL_35fb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3600:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3605:  ldloc 108

	IL_3609:  nop 
	IL_360a:  nop 
	IL_360b:  ldtoken [mscorlib]System.Char
	IL_3610:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3615:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_361a:  ldloc 108

	IL_361e:  nop 
	IL_361f:  nop 
	IL_3620:  starg 1

	IL_3624:  nop 
	IL_3625:  nop 
	IL_3626:  br IL_57d3

	IL_362b:  br IL_3635

	IL_3630:  br IL_3635

	IL_3635:  ldarg 1

	IL_3639:  nop 
	IL_363a:  nop 
	IL_363b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3640:  ldstr "single"
	IL_3645:  call int32 string::Compare(string, string)
	IL_364a:  stloc 0

	IL_364e:  nop 
	IL_364f:  nop 
	IL_3650:  ldloc 0

	IL_3654:  nop 
	IL_3655:  nop 
	IL_3656:  ldc.i4 0
	IL_365b:  beq IL_3665

	IL_3660:  br IL_36c7

	IL_3665:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok::'.ctor'()
	IL_366a:  stloc 109

	IL_366e:  nop 
	IL_366f:  nop 
	IL_3670:  ldloc 109

	IL_3674:  nop 
	IL_3675:  nop 
	IL_3676:  ldarg 1

	IL_367a:  nop 
	IL_367b:  nop 
	IL_367c:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3681:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3686:  ldloc 109

	IL_368a:  nop 
	IL_368b:  nop 
	IL_368c:  ldarg 1

	IL_3690:  nop 
	IL_3691:  nop 
	IL_3692:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3697:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_369c:  ldloc 109

	IL_36a0:  nop 
	IL_36a1:  nop 
	IL_36a2:  ldtoken [mscorlib]System.Single
	IL_36a7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_36ac:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_36b1:  ldloc 109

	IL_36b5:  nop 
	IL_36b6:  nop 
	IL_36b7:  starg 1

	IL_36bb:  nop 
	IL_36bc:  nop 
	IL_36bd:  br IL_57d3

	IL_36c2:  br IL_36cc

	IL_36c7:  br IL_36cc

	IL_36cc:  ldarg 1

	IL_36d0:  nop 
	IL_36d1:  nop 
	IL_36d2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_36d7:  ldstr "sbyte"
	IL_36dc:  call int32 string::Compare(string, string)
	IL_36e1:  stloc 0

	IL_36e5:  nop 
	IL_36e6:  nop 
	IL_36e7:  ldloc 0

	IL_36eb:  nop 
	IL_36ec:  nop 
	IL_36ed:  ldc.i4 0
	IL_36f2:  beq IL_36fc

	IL_36f7:  br IL_375e

	IL_36fc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok::'.ctor'()
	IL_3701:  stloc 110

	IL_3705:  nop 
	IL_3706:  nop 
	IL_3707:  ldloc 110

	IL_370b:  nop 
	IL_370c:  nop 
	IL_370d:  ldarg 1

	IL_3711:  nop 
	IL_3712:  nop 
	IL_3713:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3718:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_371d:  ldloc 110

	IL_3721:  nop 
	IL_3722:  nop 
	IL_3723:  ldarg 1

	IL_3727:  nop 
	IL_3728:  nop 
	IL_3729:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_372e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3733:  ldloc 110

	IL_3737:  nop 
	IL_3738:  nop 
	IL_3739:  ldtoken [mscorlib]System.SByte
	IL_373e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3743:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3748:  ldloc 110

	IL_374c:  nop 
	IL_374d:  nop 
	IL_374e:  starg 1

	IL_3752:  nop 
	IL_3753:  nop 
	IL_3754:  br IL_57d3

	IL_3759:  br IL_3763

	IL_375e:  br IL_3763

	IL_3763:  ldarg 1

	IL_3767:  nop 
	IL_3768:  nop 
	IL_3769:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_376e:  ldstr "byte"
	IL_3773:  call int32 string::Compare(string, string)
	IL_3778:  stloc 0

	IL_377c:  nop 
	IL_377d:  nop 
	IL_377e:  ldloc 0

	IL_3782:  nop 
	IL_3783:  nop 
	IL_3784:  ldc.i4 0
	IL_3789:  beq IL_3793

	IL_378e:  br IL_37f5

	IL_3793:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok::'.ctor'()
	IL_3798:  stloc 111

	IL_379c:  nop 
	IL_379d:  nop 
	IL_379e:  ldloc 111

	IL_37a2:  nop 
	IL_37a3:  nop 
	IL_37a4:  ldarg 1

	IL_37a8:  nop 
	IL_37a9:  nop 
	IL_37aa:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_37af:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_37b4:  ldloc 111

	IL_37b8:  nop 
	IL_37b9:  nop 
	IL_37ba:  ldarg 1

	IL_37be:  nop 
	IL_37bf:  nop 
	IL_37c0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37c5:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37ca:  ldloc 111

	IL_37ce:  nop 
	IL_37cf:  nop 
	IL_37d0:  ldtoken [mscorlib]System.Byte
	IL_37d5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_37da:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_37df:  ldloc 111

	IL_37e3:  nop 
	IL_37e4:  nop 
	IL_37e5:  starg 1

	IL_37e9:  nop 
	IL_37ea:  nop 
	IL_37eb:  br IL_57d3

	IL_37f0:  br IL_37fa

	IL_37f5:  br IL_37fa

	IL_37fa:  ldarg 1

	IL_37fe:  nop 
	IL_37ff:  nop 
	IL_3800:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3805:  ldstr "short"
	IL_380a:  call int32 string::Compare(string, string)
	IL_380f:  stloc 0

	IL_3813:  nop 
	IL_3814:  nop 
	IL_3815:  ldloc 0

	IL_3819:  nop 
	IL_381a:  nop 
	IL_381b:  ldc.i4 0
	IL_3820:  beq IL_382a

	IL_3825:  br IL_388c

	IL_382a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok::'.ctor'()
	IL_382f:  stloc 112

	IL_3833:  nop 
	IL_3834:  nop 
	IL_3835:  ldloc 112

	IL_3839:  nop 
	IL_383a:  nop 
	IL_383b:  ldarg 1

	IL_383f:  nop 
	IL_3840:  nop 
	IL_3841:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3846:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_384b:  ldloc 112

	IL_384f:  nop 
	IL_3850:  nop 
	IL_3851:  ldarg 1

	IL_3855:  nop 
	IL_3856:  nop 
	IL_3857:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_385c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3861:  ldloc 112

	IL_3865:  nop 
	IL_3866:  nop 
	IL_3867:  ldtoken [mscorlib]System.Int16
	IL_386c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3871:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3876:  ldloc 112

	IL_387a:  nop 
	IL_387b:  nop 
	IL_387c:  starg 1

	IL_3880:  nop 
	IL_3881:  nop 
	IL_3882:  br IL_57d3

	IL_3887:  br IL_3891

	IL_388c:  br IL_3891

	IL_3891:  ldarg 1

	IL_3895:  nop 
	IL_3896:  nop 
	IL_3897:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_389c:  ldstr "ushort"
	IL_38a1:  call int32 string::Compare(string, string)
	IL_38a6:  stloc 0

	IL_38aa:  nop 
	IL_38ab:  nop 
	IL_38ac:  ldloc 0

	IL_38b0:  nop 
	IL_38b1:  nop 
	IL_38b2:  ldc.i4 0
	IL_38b7:  beq IL_38c1

	IL_38bc:  br IL_3923

	IL_38c1:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok::'.ctor'()
	IL_38c6:  stloc 113

	IL_38ca:  nop 
	IL_38cb:  nop 
	IL_38cc:  ldloc 113

	IL_38d0:  nop 
	IL_38d1:  nop 
	IL_38d2:  ldarg 1

	IL_38d6:  nop 
	IL_38d7:  nop 
	IL_38d8:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_38dd:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_38e2:  ldloc 113

	IL_38e6:  nop 
	IL_38e7:  nop 
	IL_38e8:  ldarg 1

	IL_38ec:  nop 
	IL_38ed:  nop 
	IL_38ee:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_38f3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_38f8:  ldloc 113

	IL_38fc:  nop 
	IL_38fd:  nop 
	IL_38fe:  ldtoken [mscorlib]System.UInt16
	IL_3903:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3908:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_390d:  ldloc 113

	IL_3911:  nop 
	IL_3912:  nop 
	IL_3913:  starg 1

	IL_3917:  nop 
	IL_3918:  nop 
	IL_3919:  br IL_57d3

	IL_391e:  br IL_3928

	IL_3923:  br IL_3928

	IL_3928:  ldarg 1

	IL_392c:  nop 
	IL_392d:  nop 
	IL_392e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3933:  ldstr "long"
	IL_3938:  call int32 string::Compare(string, string)
	IL_393d:  stloc 0

	IL_3941:  nop 
	IL_3942:  nop 
	IL_3943:  ldloc 0

	IL_3947:  nop 
	IL_3948:  nop 
	IL_3949:  ldc.i4 0
	IL_394e:  beq IL_3958

	IL_3953:  br IL_39ba

	IL_3958:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok::'.ctor'()
	IL_395d:  stloc 114

	IL_3961:  nop 
	IL_3962:  nop 
	IL_3963:  ldloc 114

	IL_3967:  nop 
	IL_3968:  nop 
	IL_3969:  ldarg 1

	IL_396d:  nop 
	IL_396e:  nop 
	IL_396f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3974:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3979:  ldloc 114

	IL_397d:  nop 
	IL_397e:  nop 
	IL_397f:  ldarg 1

	IL_3983:  nop 
	IL_3984:  nop 
	IL_3985:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_398a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_398f:  ldloc 114

	IL_3993:  nop 
	IL_3994:  nop 
	IL_3995:  ldtoken [mscorlib]System.Int64
	IL_399a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_399f:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_39a4:  ldloc 114

	IL_39a8:  nop 
	IL_39a9:  nop 
	IL_39aa:  starg 1

	IL_39ae:  nop 
	IL_39af:  nop 
	IL_39b0:  br IL_57d3

	IL_39b5:  br IL_39bf

	IL_39ba:  br IL_39bf

	IL_39bf:  ldarg 1

	IL_39c3:  nop 
	IL_39c4:  nop 
	IL_39c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39ca:  ldstr "ulong"
	IL_39cf:  call int32 string::Compare(string, string)
	IL_39d4:  stloc 0

	IL_39d8:  nop 
	IL_39d9:  nop 
	IL_39da:  ldloc 0

	IL_39de:  nop 
	IL_39df:  nop 
	IL_39e0:  ldc.i4 0
	IL_39e5:  beq IL_39ef

	IL_39ea:  br IL_3a51

	IL_39ef:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok::'.ctor'()
	IL_39f4:  stloc 115

	IL_39f8:  nop 
	IL_39f9:  nop 
	IL_39fa:  ldloc 115

	IL_39fe:  nop 
	IL_39ff:  nop 
	IL_3a00:  ldarg 1

	IL_3a04:  nop 
	IL_3a05:  nop 
	IL_3a06:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3a0b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3a10:  ldloc 115

	IL_3a14:  nop 
	IL_3a15:  nop 
	IL_3a16:  ldarg 1

	IL_3a1a:  nop 
	IL_3a1b:  nop 
	IL_3a1c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a21:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a26:  ldloc 115

	IL_3a2a:  nop 
	IL_3a2b:  nop 
	IL_3a2c:  ldtoken [mscorlib]System.UInt64
	IL_3a31:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3a36:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3a3b:  ldloc 115

	IL_3a3f:  nop 
	IL_3a40:  nop 
	IL_3a41:  starg 1

	IL_3a45:  nop 
	IL_3a46:  nop 
	IL_3a47:  br IL_57d3

	IL_3a4c:  br IL_3a56

	IL_3a51:  br IL_3a56

	IL_3a56:  ldarg 1

	IL_3a5a:  nop 
	IL_3a5b:  nop 
	IL_3a5c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a61:  ldstr "object"
	IL_3a66:  call int32 string::Compare(string, string)
	IL_3a6b:  stloc 0

	IL_3a6f:  nop 
	IL_3a70:  nop 
	IL_3a71:  ldloc 0

	IL_3a75:  nop 
	IL_3a76:  nop 
	IL_3a77:  ldc.i4 0
	IL_3a7c:  beq IL_3a86

	IL_3a81:  br IL_3ae8

	IL_3a86:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_3a8b:  stloc 116

	IL_3a8f:  nop 
	IL_3a90:  nop 
	IL_3a91:  ldloc 116

	IL_3a95:  nop 
	IL_3a96:  nop 
	IL_3a97:  ldarg 1

	IL_3a9b:  nop 
	IL_3a9c:  nop 
	IL_3a9d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3aa2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3aa7:  ldloc 116

	IL_3aab:  nop 
	IL_3aac:  nop 
	IL_3aad:  ldarg 1

	IL_3ab1:  nop 
	IL_3ab2:  nop 
	IL_3ab3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ab8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3abd:  ldloc 116

	IL_3ac1:  nop 
	IL_3ac2:  nop 
	IL_3ac3:  ldtoken [mscorlib]System.Object
	IL_3ac8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3acd:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3ad2:  ldloc 116

	IL_3ad6:  nop 
	IL_3ad7:  nop 
	IL_3ad8:  starg 1

	IL_3adc:  nop 
	IL_3add:  nop 
	IL_3ade:  br IL_57d3

	IL_3ae3:  br IL_3aed

	IL_3ae8:  br IL_3aed

	IL_3aed:  ldarg 1

	IL_3af1:  nop 
	IL_3af2:  nop 
	IL_3af3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3af8:  ldstr "^//(.)*$"
	IL_3afd:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b02:  stloc 1

	IL_3b06:  nop 
	IL_3b07:  nop 
	IL_3b08:  ldloc 1

	IL_3b0c:  nop 
	IL_3b0d:  nop 
	IL_3b0e:  ldc.i4 1
	IL_3b13:  beq IL_3b1d

	IL_3b18:  br IL_3b74

	IL_3b1d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok::'.ctor'()
	IL_3b22:  stloc 117

	IL_3b26:  nop 
	IL_3b27:  nop 
	IL_3b28:  ldloc 117

	IL_3b2c:  nop 
	IL_3b2d:  nop 
	IL_3b2e:  ldarg 1

	IL_3b32:  nop 
	IL_3b33:  nop 
	IL_3b34:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3b39:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3b3e:  ldloc 117

	IL_3b42:  nop 
	IL_3b43:  nop 
	IL_3b44:  ldarg 1

	IL_3b48:  nop 
	IL_3b49:  nop 
	IL_3b4a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b4f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b54:  ldloc 117

	IL_3b58:  nop 
	IL_3b59:  nop 
	IL_3b5a:  starg 1

	IL_3b5e:  nop 
	IL_3b5f:  nop 
	IL_3b60:  ldc.i4 1
	IL_3b65:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_3b6a:  br IL_57d3

	IL_3b6f:  br IL_3b79

	IL_3b74:  br IL_3b79

	IL_3b79:  ldarg 1

	IL_3b7d:  nop 
	IL_3b7e:  nop 
	IL_3b7f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b84:  ldstr "null"
	IL_3b89:  call int32 string::Compare(string, string)
	IL_3b8e:  stloc 0

	IL_3b92:  nop 
	IL_3b93:  nop 
	IL_3b94:  ldloc 0

	IL_3b98:  nop 
	IL_3b99:  nop 
	IL_3b9a:  ldc.i4 0
	IL_3b9f:  beq IL_3ba9

	IL_3ba4:  br IL_3bf6

	IL_3ba9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::'.ctor'()
	IL_3bae:  stloc 118

	IL_3bb2:  nop 
	IL_3bb3:  nop 
	IL_3bb4:  ldloc 118

	IL_3bb8:  nop 
	IL_3bb9:  nop 
	IL_3bba:  ldarg 1

	IL_3bbe:  nop 
	IL_3bbf:  nop 
	IL_3bc0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3bc5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3bca:  ldloc 118

	IL_3bce:  nop 
	IL_3bcf:  nop 
	IL_3bd0:  ldarg 1

	IL_3bd4:  nop 
	IL_3bd5:  nop 
	IL_3bd6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3bdb:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3be0:  ldloc 118

	IL_3be4:  nop 
	IL_3be5:  nop 
	IL_3be6:  starg 1

	IL_3bea:  nop 
	IL_3beb:  nop 
	IL_3bec:  br IL_57d3

	IL_3bf1:  br IL_3bfb

	IL_3bf6:  br IL_3bfb

	IL_3bfb:  ldarg 1

	IL_3bff:  nop 
	IL_3c00:  nop 
	IL_3c01:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c06:  ldstr "true"
	IL_3c0b:  call int32 string::Compare(string, string)
	IL_3c10:  stloc 0

	IL_3c14:  nop 
	IL_3c15:  nop 
	IL_3c16:  ldloc 0

	IL_3c1a:  nop 
	IL_3c1b:  nop 
	IL_3c1c:  ldc.i4 0
	IL_3c21:  beq IL_3c2b

	IL_3c26:  br IL_3c3b

	IL_3c2b:  ldc.i4 1
	IL_3c30:  stloc 1

	IL_3c34:  nop 
	IL_3c35:  nop 
	IL_3c36:  br IL_3c40

	IL_3c3b:  br IL_3c40

	IL_3c40:  ldloc 1

	IL_3c44:  nop 
	IL_3c45:  nop 
	IL_3c46:  stloc 4

	IL_3c4a:  nop 
	IL_3c4b:  nop 
	IL_3c4c:  ldarg 1

	IL_3c50:  nop 
	IL_3c51:  nop 
	IL_3c52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c57:  ldstr "false"
	IL_3c5c:  call int32 string::Compare(string, string)
	IL_3c61:  stloc 0

	IL_3c65:  nop 
	IL_3c66:  nop 
	IL_3c67:  ldloc 0

	IL_3c6b:  nop 
	IL_3c6c:  nop 
	IL_3c6d:  ldc.i4 0
	IL_3c72:  beq IL_3c7c

	IL_3c77:  br IL_3c8c

	IL_3c7c:  ldc.i4 1
	IL_3c81:  stloc 1

	IL_3c85:  nop 
	IL_3c86:  nop 
	IL_3c87:  br IL_3c91

	IL_3c8c:  br IL_3c91

	IL_3c91:  ldloc 4

	IL_3c95:  nop 
	IL_3c96:  nop 
	IL_3c97:  ldloc 1

	IL_3c9b:  nop 
	IL_3c9c:  nop 
	IL_3c9d:  or 
	IL_3c9e:  stloc 4

	IL_3ca2:  nop 
	IL_3ca3:  nop 
	IL_3ca4:  ldloc 1

	IL_3ca8:  nop 
	IL_3ca9:  nop 
	IL_3caa:  ldc.i4 1
	IL_3caf:  beq IL_3cb9

	IL_3cb4:  br IL_3d9a

	IL_3cb9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::'.ctor'()
	IL_3cbe:  stloc 119

	IL_3cc2:  nop 
	IL_3cc3:  nop 
	IL_3cc4:  ldloc 119

	IL_3cc8:  nop 
	IL_3cc9:  nop 
	IL_3cca:  ldarg 1

	IL_3cce:  nop 
	IL_3ccf:  nop 
	IL_3cd0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3cd5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3cda:  ldloc 119

	IL_3cde:  nop 
	IL_3cdf:  nop 
	IL_3ce0:  ldarg 1

	IL_3ce4:  nop 
	IL_3ce5:  nop 
	IL_3ce6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ceb:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3cf0:  ldarg 1

	IL_3cf4:  nop 
	IL_3cf5:  nop 
	IL_3cf6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3cfb:  ldstr "true"
	IL_3d00:  call int32 string::Compare(string, string)
	IL_3d05:  stloc 0

	IL_3d09:  nop 
	IL_3d0a:  nop 
	IL_3d0b:  ldloc 0

	IL_3d0f:  nop 
	IL_3d10:  nop 
	IL_3d11:  ldc.i4 0
	IL_3d16:  beq IL_3d20

	IL_3d1b:  br IL_3d35

	IL_3d20:  ldloc 119

	IL_3d24:  nop 
	IL_3d25:  nop 
	IL_3d26:  ldc.i4 1
	IL_3d2b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_3d30:  br IL_3d3a

	IL_3d35:  br IL_3d3a

	IL_3d3a:  ldarg 1

	IL_3d3e:  nop 
	IL_3d3f:  nop 
	IL_3d40:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d45:  ldstr "false"
	IL_3d4a:  call int32 string::Compare(string, string)
	IL_3d4f:  stloc 0

	IL_3d53:  nop 
	IL_3d54:  nop 
	IL_3d55:  ldloc 0

	IL_3d59:  nop 
	IL_3d5a:  nop 
	IL_3d5b:  ldc.i4 0
	IL_3d60:  beq IL_3d6a

	IL_3d65:  br IL_3d7f

	IL_3d6a:  ldloc 119

	IL_3d6e:  nop 
	IL_3d6f:  nop 
	IL_3d70:  ldc.i4 0
	IL_3d75:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_3d7a:  br IL_3d84

	IL_3d7f:  br IL_3d84

	IL_3d84:  ldloc 119

	IL_3d88:  nop 
	IL_3d89:  nop 
	IL_3d8a:  starg 1

	IL_3d8e:  nop 
	IL_3d8f:  nop 
	IL_3d90:  br IL_57d3

	IL_3d95:  br IL_3d9f

	IL_3d9a:  br IL_3d9f

	IL_3d9f:  ldarg 1

	IL_3da3:  nop 
	IL_3da4:  nop 
	IL_3da5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3daa:  ldstr "^'(.)*'$"
	IL_3daf:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3db4:  stloc 1

	IL_3db8:  nop 
	IL_3db9:  nop 
	IL_3dba:  ldloc 1

	IL_3dbe:  nop 
	IL_3dbf:  nop 
	IL_3dc0:  ldc.i4 1
	IL_3dc5:  beq IL_3dcf

	IL_3dca:  br IL_3e86

	IL_3dcf:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::'.ctor'()
	IL_3dd4:  stloc 120

	IL_3dd8:  nop 
	IL_3dd9:  nop 
	IL_3dda:  ldloc 120

	IL_3dde:  nop 
	IL_3ddf:  nop 
	IL_3de0:  ldarg 1

	IL_3de4:  nop 
	IL_3de5:  nop 
	IL_3de6:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3deb:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3df0:  ldarg 1

	IL_3df4:  nop 
	IL_3df5:  nop 
	IL_3df6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3dfb:  stloc 2

	IL_3dff:  nop 
	IL_3e00:  nop 
	IL_3e01:  ldc.i4 1
	IL_3e06:  conv.u 
	IL_3e07:  newarr [mscorlib]System.Char
	IL_3e0c:  stloc 3

	IL_3e10:  nop 
	IL_3e11:  nop 
	IL_3e12:  ldloc 3

	IL_3e16:  nop 
	IL_3e17:  nop 
	IL_3e18:  ldc.i4 0
	IL_3e1d:  conv.u 
	IL_3e1e:  ldstr "'"
	IL_3e23:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3e28:  stelem [mscorlib]System.Char
	IL_3e2d:  ldloc 2

	IL_3e31:  nop 
	IL_3e32:  nop 
	IL_3e33:  ldloc 3

	IL_3e37:  nop 
	IL_3e38:  nop 
	IL_3e39:  callvirt instance string string::Trim(char[])
	IL_3e3e:  stloc 2

	IL_3e42:  nop 
	IL_3e43:  nop 
	IL_3e44:  ldloc 120

	IL_3e48:  nop 
	IL_3e49:  nop 
	IL_3e4a:  ldloc 2

	IL_3e4e:  nop 
	IL_3e4f:  nop 
	IL_3e50:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e55:  ldloc 120

	IL_3e59:  nop 
	IL_3e5a:  nop 
	IL_3e5b:  ldloc 120

	IL_3e5f:  nop 
	IL_3e60:  nop 
	IL_3e61:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e66:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3e6b:  stfld char [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_3e70:  ldloc 120

	IL_3e74:  nop 
	IL_3e75:  nop 
	IL_3e76:  starg 1

	IL_3e7a:  nop 
	IL_3e7b:  nop 
	IL_3e7c:  br IL_57d3

	IL_3e81:  br IL_3e8b

	IL_3e86:  br IL_3e8b

	IL_3e8b:  ldstr "^"
	IL_3e90:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_3e95:  ldstr "(.)*"
	IL_3e9a:  call string string::Concat(string, string, string)
	IL_3e9f:  stloc 2

	IL_3ea3:  nop 
	IL_3ea4:  nop 
	IL_3ea5:  ldloc 2

	IL_3ea9:  nop 
	IL_3eaa:  nop 
	IL_3eab:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_3eb0:  ldstr "$"
	IL_3eb5:  call string string::Concat(string, string, string)
	IL_3eba:  stloc 2

	IL_3ebe:  nop 
	IL_3ebf:  nop 
	IL_3ec0:  ldarg 1

	IL_3ec4:  nop 
	IL_3ec5:  nop 
	IL_3ec6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ecb:  ldloc 2

	IL_3ecf:  nop 
	IL_3ed0:  nop 
	IL_3ed1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3ed6:  stloc 1

	IL_3eda:  nop 
	IL_3edb:  nop 
	IL_3edc:  ldloc 1

	IL_3ee0:  nop 
	IL_3ee1:  nop 
	IL_3ee2:  ldc.i4 1
	IL_3ee7:  beq IL_3ef1

	IL_3eec:  br IL_3f8d

	IL_3ef1:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::'.ctor'()
	IL_3ef6:  stloc 121

	IL_3efa:  nop 
	IL_3efb:  nop 
	IL_3efc:  ldloc 121

	IL_3f00:  nop 
	IL_3f01:  nop 
	IL_3f02:  ldarg 1

	IL_3f06:  nop 
	IL_3f07:  nop 
	IL_3f08:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3f0d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3f12:  ldarg 1

	IL_3f16:  nop 
	IL_3f17:  nop 
	IL_3f18:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f1d:  stloc 2

	IL_3f21:  nop 
	IL_3f22:  nop 
	IL_3f23:  ldc.i4 1
	IL_3f28:  conv.u 
	IL_3f29:  newarr [mscorlib]System.Char
	IL_3f2e:  stloc 3

	IL_3f32:  nop 
	IL_3f33:  nop 
	IL_3f34:  ldloc 3

	IL_3f38:  nop 
	IL_3f39:  nop 
	IL_3f3a:  ldc.i4 0
	IL_3f3f:  conv.u 
	IL_3f40:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_3f45:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3f4a:  stelem [mscorlib]System.Char
	IL_3f4f:  ldloc 2

	IL_3f53:  nop 
	IL_3f54:  nop 
	IL_3f55:  ldloc 3

	IL_3f59:  nop 
	IL_3f5a:  nop 
	IL_3f5b:  callvirt instance string string::Trim(char[])
	IL_3f60:  stloc 2

	IL_3f64:  nop 
	IL_3f65:  nop 
	IL_3f66:  ldloc 121

	IL_3f6a:  nop 
	IL_3f6b:  nop 
	IL_3f6c:  ldloc 2

	IL_3f70:  nop 
	IL_3f71:  nop 
	IL_3f72:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f77:  ldloc 121

	IL_3f7b:  nop 
	IL_3f7c:  nop 
	IL_3f7d:  starg 1

	IL_3f81:  nop 
	IL_3f82:  nop 
	IL_3f83:  br IL_57d3

	IL_3f88:  br IL_3f92

	IL_3f8d:  br IL_3f92

	IL_3f92:  ldarg 1

	IL_3f96:  nop 
	IL_3f97:  nop 
	IL_3f98:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f9d:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_3fa2:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3fa7:  stloc 1

	IL_3fab:  nop 
	IL_3fac:  nop 
	IL_3fad:  ldloc 1

	IL_3fb1:  nop 
	IL_3fb2:  nop 
	IL_3fb3:  stloc 4

	IL_3fb7:  nop 
	IL_3fb8:  nop 
	IL_3fb9:  ldarg 1

	IL_3fbd:  nop 
	IL_3fbe:  nop 
	IL_3fbf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3fc4:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3fc9:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3fce:  stloc 1

	IL_3fd2:  nop 
	IL_3fd3:  nop 
	IL_3fd4:  ldloc 4

	IL_3fd8:  nop 
	IL_3fd9:  nop 
	IL_3fda:  ldloc 1

	IL_3fde:  nop 
	IL_3fdf:  nop 
	IL_3fe0:  or 
	IL_3fe1:  stloc 4

	IL_3fe5:  nop 
	IL_3fe6:  nop 
	IL_3fe7:  ldarg 1

	IL_3feb:  nop 
	IL_3fec:  nop 
	IL_3fed:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ff2:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3ff7:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3ffc:  stloc 1

	IL_4000:  nop 
	IL_4001:  nop 
	IL_4002:  ldloc 4

	IL_4006:  nop 
	IL_4007:  nop 
	IL_4008:  ldloc 1

	IL_400c:  nop 
	IL_400d:  nop 
	IL_400e:  or 
	IL_400f:  stloc 4

	IL_4013:  nop 
	IL_4014:  nop 
	IL_4015:  ldarg 1

	IL_4019:  nop 
	IL_401a:  nop 
	IL_401b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4020:  stloc 2

	IL_4024:  nop 
	IL_4025:  nop 
	IL_4026:  ldloc 2

	IL_402a:  nop 
	IL_402b:  nop 
	IL_402c:  ldstr "d"
	IL_4031:  callvirt instance bool string::EndsWith(string)
	IL_4036:  stloc 1

	IL_403a:  nop 
	IL_403b:  nop 
	IL_403c:  ldloc 4

	IL_4040:  nop 
	IL_4041:  nop 
	IL_4042:  ldloc 1

	IL_4046:  nop 
	IL_4047:  nop 
	IL_4048:  and 
	IL_4049:  stloc 4

	IL_404d:  nop 
	IL_404e:  nop 
	IL_404f:  ldloc 4

	IL_4053:  nop 
	IL_4054:  nop 
	IL_4055:  ldc.i4 1
	IL_405a:  beq IL_4064

	IL_405f:  br IL_411b

	IL_4064:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_4069:  stloc 122

	IL_406d:  nop 
	IL_406e:  nop 
	IL_406f:  ldloc 122

	IL_4073:  nop 
	IL_4074:  nop 
	IL_4075:  ldarg 1

	IL_4079:  nop 
	IL_407a:  nop 
	IL_407b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4080:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4085:  ldarg 1

	IL_4089:  nop 
	IL_408a:  nop 
	IL_408b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4090:  stloc 2

	IL_4094:  nop 
	IL_4095:  nop 
	IL_4096:  ldc.i4 1
	IL_409b:  conv.u 
	IL_409c:  newarr [mscorlib]System.Char
	IL_40a1:  stloc 3

	IL_40a5:  nop 
	IL_40a6:  nop 
	IL_40a7:  ldloc 3

	IL_40ab:  nop 
	IL_40ac:  nop 
	IL_40ad:  ldc.i4 0
	IL_40b2:  conv.u 
	IL_40b3:  ldstr "d"
	IL_40b8:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_40bd:  stelem [mscorlib]System.Char
	IL_40c2:  ldloc 2

	IL_40c6:  nop 
	IL_40c7:  nop 
	IL_40c8:  ldloc 3

	IL_40cc:  nop 
	IL_40cd:  nop 
	IL_40ce:  callvirt instance string string::TrimEnd(char[])
	IL_40d3:  stloc 2

	IL_40d7:  nop 
	IL_40d8:  nop 
	IL_40d9:  ldloc 122

	IL_40dd:  nop 
	IL_40de:  nop 
	IL_40df:  ldloc 2

	IL_40e3:  nop 
	IL_40e4:  nop 
	IL_40e5:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40ea:  ldloc 122

	IL_40ee:  nop 
	IL_40ef:  nop 
	IL_40f0:  ldloc 122

	IL_40f4:  nop 
	IL_40f5:  nop 
	IL_40f6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40fb:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_4100:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_4105:  ldloc 122

	IL_4109:  nop 
	IL_410a:  nop 
	IL_410b:  starg 1

	IL_410f:  nop 
	IL_4110:  nop 
	IL_4111:  br IL_57d3

	IL_4116:  br IL_4120

	IL_411b:  br IL_4120

	IL_4120:  ldarg 1

	IL_4124:  nop 
	IL_4125:  nop 
	IL_4126:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_412b:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_4130:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4135:  stloc 1

	IL_4139:  nop 
	IL_413a:  nop 
	IL_413b:  ldloc 1

	IL_413f:  nop 
	IL_4140:  nop 
	IL_4141:  stloc 4

	IL_4145:  nop 
	IL_4146:  nop 
	IL_4147:  ldarg 1

	IL_414b:  nop 
	IL_414c:  nop 
	IL_414d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4152:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_4157:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_415c:  stloc 1

	IL_4160:  nop 
	IL_4161:  nop 
	IL_4162:  ldloc 4

	IL_4166:  nop 
	IL_4167:  nop 
	IL_4168:  ldloc 1

	IL_416c:  nop 
	IL_416d:  nop 
	IL_416e:  or 
	IL_416f:  stloc 4

	IL_4173:  nop 
	IL_4174:  nop 
	IL_4175:  ldarg 1

	IL_4179:  nop 
	IL_417a:  nop 
	IL_417b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4180:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_4185:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_418a:  stloc 1

	IL_418e:  nop 
	IL_418f:  nop 
	IL_4190:  ldloc 4

	IL_4194:  nop 
	IL_4195:  nop 
	IL_4196:  ldloc 1

	IL_419a:  nop 
	IL_419b:  nop 
	IL_419c:  or 
	IL_419d:  stloc 4

	IL_41a1:  nop 
	IL_41a2:  nop 
	IL_41a3:  ldarg 1

	IL_41a7:  nop 
	IL_41a8:  nop 
	IL_41a9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_41ae:  stloc 2

	IL_41b2:  nop 
	IL_41b3:  nop 
	IL_41b4:  ldloc 2

	IL_41b8:  nop 
	IL_41b9:  nop 
	IL_41ba:  ldstr "f"
	IL_41bf:  callvirt instance bool string::EndsWith(string)
	IL_41c4:  stloc 1

	IL_41c8:  nop 
	IL_41c9:  nop 
	IL_41ca:  ldloc 4

	IL_41ce:  nop 
	IL_41cf:  nop 
	IL_41d0:  ldloc 1

	IL_41d4:  nop 
	IL_41d5:  nop 
	IL_41d6:  and 
	IL_41d7:  stloc 4

	IL_41db:  nop 
	IL_41dc:  nop 
	IL_41dd:  ldloc 4

	IL_41e1:  nop 
	IL_41e2:  nop 
	IL_41e3:  ldc.i4 1
	IL_41e8:  beq IL_41f2

	IL_41ed:  br IL_42a9

	IL_41f2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_41f7:  stloc 123

	IL_41fb:  nop 
	IL_41fc:  nop 
	IL_41fd:  ldloc 123

	IL_4201:  nop 
	IL_4202:  nop 
	IL_4203:  ldarg 1

	IL_4207:  nop 
	IL_4208:  nop 
	IL_4209:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_420e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4213:  ldarg 1

	IL_4217:  nop 
	IL_4218:  nop 
	IL_4219:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_421e:  stloc 2

	IL_4222:  nop 
	IL_4223:  nop 
	IL_4224:  ldc.i4 1
	IL_4229:  conv.u 
	IL_422a:  newarr [mscorlib]System.Char
	IL_422f:  stloc 3

	IL_4233:  nop 
	IL_4234:  nop 
	IL_4235:  ldloc 3

	IL_4239:  nop 
	IL_423a:  nop 
	IL_423b:  ldc.i4 0
	IL_4240:  conv.u 
	IL_4241:  ldstr "f"
	IL_4246:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_424b:  stelem [mscorlib]System.Char
	IL_4250:  ldloc 2

	IL_4254:  nop 
	IL_4255:  nop 
	IL_4256:  ldloc 3

	IL_425a:  nop 
	IL_425b:  nop 
	IL_425c:  callvirt instance string string::TrimEnd(char[])
	IL_4261:  stloc 2

	IL_4265:  nop 
	IL_4266:  nop 
	IL_4267:  ldloc 123

	IL_426b:  nop 
	IL_426c:  nop 
	IL_426d:  ldloc 2

	IL_4271:  nop 
	IL_4272:  nop 
	IL_4273:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4278:  ldloc 123

	IL_427c:  nop 
	IL_427d:  nop 
	IL_427e:  ldloc 123

	IL_4282:  nop 
	IL_4283:  nop 
	IL_4284:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4289:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_428e:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_4293:  ldloc 123

	IL_4297:  nop 
	IL_4298:  nop 
	IL_4299:  starg 1

	IL_429d:  nop 
	IL_429e:  nop 
	IL_429f:  br IL_57d3

	IL_42a4:  br IL_42ae

	IL_42a9:  br IL_42ae

	IL_42ae:  ldarg 1

	IL_42b2:  nop 
	IL_42b3:  nop 
	IL_42b4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42b9:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_42be:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_42c3:  stloc 1

	IL_42c7:  nop 
	IL_42c8:  nop 
	IL_42c9:  ldloc 1

	IL_42cd:  nop 
	IL_42ce:  nop 
	IL_42cf:  stloc 4

	IL_42d3:  nop 
	IL_42d4:  nop 
	IL_42d5:  ldarg 1

	IL_42d9:  nop 
	IL_42da:  nop 
	IL_42db:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42e0:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_42e5:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_42ea:  stloc 1

	IL_42ee:  nop 
	IL_42ef:  nop 
	IL_42f0:  ldloc 4

	IL_42f4:  nop 
	IL_42f5:  nop 
	IL_42f6:  ldloc 1

	IL_42fa:  nop 
	IL_42fb:  nop 
	IL_42fc:  or 
	IL_42fd:  stloc 4

	IL_4301:  nop 
	IL_4302:  nop 
	IL_4303:  ldarg 1

	IL_4307:  nop 
	IL_4308:  nop 
	IL_4309:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_430e:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_4313:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4318:  stloc 1

	IL_431c:  nop 
	IL_431d:  nop 
	IL_431e:  ldloc 4

	IL_4322:  nop 
	IL_4323:  nop 
	IL_4324:  ldloc 1

	IL_4328:  nop 
	IL_4329:  nop 
	IL_432a:  or 
	IL_432b:  stloc 4

	IL_432f:  nop 
	IL_4330:  nop 
	IL_4331:  ldloc 4

	IL_4335:  nop 
	IL_4336:  nop 
	IL_4337:  ldc.i4 1
	IL_433c:  beq IL_4346

	IL_4341:  br IL_43ba

	IL_4346:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_434b:  stloc 124

	IL_434f:  nop 
	IL_4350:  nop 
	IL_4351:  ldloc 124

	IL_4355:  nop 
	IL_4356:  nop 
	IL_4357:  ldarg 1

	IL_435b:  nop 
	IL_435c:  nop 
	IL_435d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4362:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4367:  ldarg 1

	IL_436b:  nop 
	IL_436c:  nop 
	IL_436d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4372:  stloc 2

	IL_4376:  nop 
	IL_4377:  nop 
	IL_4378:  ldloc 124

	IL_437c:  nop 
	IL_437d:  nop 
	IL_437e:  ldloc 2

	IL_4382:  nop 
	IL_4383:  nop 
	IL_4384:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4389:  ldloc 124

	IL_438d:  nop 
	IL_438e:  nop 
	IL_438f:  ldloc 124

	IL_4393:  nop 
	IL_4394:  nop 
	IL_4395:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_439a:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_439f:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_43a4:  ldloc 124

	IL_43a8:  nop 
	IL_43a9:  nop 
	IL_43aa:  starg 1

	IL_43ae:  nop 
	IL_43af:  nop 
	IL_43b0:  br IL_57d3

	IL_43b5:  br IL_43bf

	IL_43ba:  br IL_43bf

	IL_43bf:  ldarg 1

	IL_43c3:  nop 
	IL_43c4:  nop 
	IL_43c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43ca:  ldstr "^(\\d)+(.)*$"
	IL_43cf:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_43d4:  stloc 1

	IL_43d8:  nop 
	IL_43d9:  nop 
	IL_43da:  ldloc 1

	IL_43de:  nop 
	IL_43df:  nop 
	IL_43e0:  stloc 4

	IL_43e4:  nop 
	IL_43e5:  nop 
	IL_43e6:  ldarg 1

	IL_43ea:  nop 
	IL_43eb:  nop 
	IL_43ec:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43f1:  ldstr "^\\+(\\d)+(.)*$"
	IL_43f6:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_43fb:  stloc 1

	IL_43ff:  nop 
	IL_4400:  nop 
	IL_4401:  ldloc 4

	IL_4405:  nop 
	IL_4406:  nop 
	IL_4407:  ldloc 1

	IL_440b:  nop 
	IL_440c:  nop 
	IL_440d:  or 
	IL_440e:  stloc 4

	IL_4412:  nop 
	IL_4413:  nop 
	IL_4414:  ldarg 1

	IL_4418:  nop 
	IL_4419:  nop 
	IL_441a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_441f:  ldstr "^-(\\d)+(.)*$"
	IL_4424:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4429:  stloc 1

	IL_442d:  nop 
	IL_442e:  nop 
	IL_442f:  ldloc 4

	IL_4433:  nop 
	IL_4434:  nop 
	IL_4435:  ldloc 1

	IL_4439:  nop 
	IL_443a:  nop 
	IL_443b:  or 
	IL_443c:  stloc 4

	IL_4440:  nop 
	IL_4441:  nop 
	IL_4442:  ldarg 1

	IL_4446:  nop 
	IL_4447:  nop 
	IL_4448:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_444d:  stloc 2

	IL_4451:  nop 
	IL_4452:  nop 
	IL_4453:  ldloc 2

	IL_4457:  nop 
	IL_4458:  nop 
	IL_4459:  ldstr "d"
	IL_445e:  callvirt instance bool string::EndsWith(string)
	IL_4463:  stloc 1

	IL_4467:  nop 
	IL_4468:  nop 
	IL_4469:  ldloc 4

	IL_446d:  nop 
	IL_446e:  nop 
	IL_446f:  ldloc 1

	IL_4473:  nop 
	IL_4474:  nop 
	IL_4475:  and 
	IL_4476:  stloc 4

	IL_447a:  nop 
	IL_447b:  nop 
	IL_447c:  ldloc 4

	IL_4480:  nop 
	IL_4481:  nop 
	IL_4482:  ldc.i4 1
	IL_4487:  beq IL_4491

	IL_448c:  br IL_4548

	IL_4491:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_4496:  stloc 125

	IL_449a:  nop 
	IL_449b:  nop 
	IL_449c:  ldloc 125

	IL_44a0:  nop 
	IL_44a1:  nop 
	IL_44a2:  ldarg 1

	IL_44a6:  nop 
	IL_44a7:  nop 
	IL_44a8:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_44ad:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_44b2:  ldarg 1

	IL_44b6:  nop 
	IL_44b7:  nop 
	IL_44b8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_44bd:  stloc 2

	IL_44c1:  nop 
	IL_44c2:  nop 
	IL_44c3:  ldc.i4 1
	IL_44c8:  conv.u 
	IL_44c9:  newarr [mscorlib]System.Char
	IL_44ce:  stloc 3

	IL_44d2:  nop 
	IL_44d3:  nop 
	IL_44d4:  ldloc 3

	IL_44d8:  nop 
	IL_44d9:  nop 
	IL_44da:  ldc.i4 0
	IL_44df:  conv.u 
	IL_44e0:  ldstr "d"
	IL_44e5:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_44ea:  stelem [mscorlib]System.Char
	IL_44ef:  ldloc 2

	IL_44f3:  nop 
	IL_44f4:  nop 
	IL_44f5:  ldloc 3

	IL_44f9:  nop 
	IL_44fa:  nop 
	IL_44fb:  callvirt instance string string::TrimEnd(char[])
	IL_4500:  stloc 2

	IL_4504:  nop 
	IL_4505:  nop 
	IL_4506:  ldloc 125

	IL_450a:  nop 
	IL_450b:  nop 
	IL_450c:  ldloc 2

	IL_4510:  nop 
	IL_4511:  nop 
	IL_4512:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4517:  ldloc 125

	IL_451b:  nop 
	IL_451c:  nop 
	IL_451d:  ldloc 125

	IL_4521:  nop 
	IL_4522:  nop 
	IL_4523:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4528:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_452d:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_4532:  ldloc 125

	IL_4536:  nop 
	IL_4537:  nop 
	IL_4538:  starg 1

	IL_453c:  nop 
	IL_453d:  nop 
	IL_453e:  br IL_57d3

	IL_4543:  br IL_454d

	IL_4548:  br IL_454d

	IL_454d:  ldarg 1

	IL_4551:  nop 
	IL_4552:  nop 
	IL_4553:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4558:  ldstr "^(\\d)+(.)*$"
	IL_455d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4562:  stloc 1

	IL_4566:  nop 
	IL_4567:  nop 
	IL_4568:  ldloc 1

	IL_456c:  nop 
	IL_456d:  nop 
	IL_456e:  stloc 4

	IL_4572:  nop 
	IL_4573:  nop 
	IL_4574:  ldarg 1

	IL_4578:  nop 
	IL_4579:  nop 
	IL_457a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_457f:  ldstr "^\\+(\\d)+(.)*$"
	IL_4584:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4589:  stloc 1

	IL_458d:  nop 
	IL_458e:  nop 
	IL_458f:  ldloc 4

	IL_4593:  nop 
	IL_4594:  nop 
	IL_4595:  ldloc 1

	IL_4599:  nop 
	IL_459a:  nop 
	IL_459b:  or 
	IL_459c:  stloc 4

	IL_45a0:  nop 
	IL_45a1:  nop 
	IL_45a2:  ldarg 1

	IL_45a6:  nop 
	IL_45a7:  nop 
	IL_45a8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45ad:  ldstr "^-(\\d)+(.)*$"
	IL_45b2:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_45b7:  stloc 1

	IL_45bb:  nop 
	IL_45bc:  nop 
	IL_45bd:  ldloc 4

	IL_45c1:  nop 
	IL_45c2:  nop 
	IL_45c3:  ldloc 1

	IL_45c7:  nop 
	IL_45c8:  nop 
	IL_45c9:  or 
	IL_45ca:  stloc 4

	IL_45ce:  nop 
	IL_45cf:  nop 
	IL_45d0:  ldarg 1

	IL_45d4:  nop 
	IL_45d5:  nop 
	IL_45d6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45db:  stloc 2

	IL_45df:  nop 
	IL_45e0:  nop 
	IL_45e1:  ldloc 2

	IL_45e5:  nop 
	IL_45e6:  nop 
	IL_45e7:  ldstr "f"
	IL_45ec:  callvirt instance bool string::EndsWith(string)
	IL_45f1:  stloc 1

	IL_45f5:  nop 
	IL_45f6:  nop 
	IL_45f7:  ldloc 4

	IL_45fb:  nop 
	IL_45fc:  nop 
	IL_45fd:  ldloc 1

	IL_4601:  nop 
	IL_4602:  nop 
	IL_4603:  and 
	IL_4604:  stloc 4

	IL_4608:  nop 
	IL_4609:  nop 
	IL_460a:  ldloc 4

	IL_460e:  nop 
	IL_460f:  nop 
	IL_4610:  ldc.i4 1
	IL_4615:  beq IL_461f

	IL_461a:  br IL_46d6

	IL_461f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_4624:  stloc 126

	IL_4628:  nop 
	IL_4629:  nop 
	IL_462a:  ldloc 126

	IL_462e:  nop 
	IL_462f:  nop 
	IL_4630:  ldarg 1

	IL_4634:  nop 
	IL_4635:  nop 
	IL_4636:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_463b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4640:  ldarg 1

	IL_4644:  nop 
	IL_4645:  nop 
	IL_4646:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_464b:  stloc 2

	IL_464f:  nop 
	IL_4650:  nop 
	IL_4651:  ldc.i4 1
	IL_4656:  conv.u 
	IL_4657:  newarr [mscorlib]System.Char
	IL_465c:  stloc 3

	IL_4660:  nop 
	IL_4661:  nop 
	IL_4662:  ldloc 3

	IL_4666:  nop 
	IL_4667:  nop 
	IL_4668:  ldc.i4 0
	IL_466d:  conv.u 
	IL_466e:  ldstr "f"
	IL_4673:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4678:  stelem [mscorlib]System.Char
	IL_467d:  ldloc 2

	IL_4681:  nop 
	IL_4682:  nop 
	IL_4683:  ldloc 3

	IL_4687:  nop 
	IL_4688:  nop 
	IL_4689:  callvirt instance string string::TrimEnd(char[])
	IL_468e:  stloc 2

	IL_4692:  nop 
	IL_4693:  nop 
	IL_4694:  ldloc 126

	IL_4698:  nop 
	IL_4699:  nop 
	IL_469a:  ldloc 2

	IL_469e:  nop 
	IL_469f:  nop 
	IL_46a0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46a5:  ldloc 126

	IL_46a9:  nop 
	IL_46aa:  nop 
	IL_46ab:  ldloc 126

	IL_46af:  nop 
	IL_46b0:  nop 
	IL_46b1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46b6:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_46bb:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_46c0:  ldloc 126

	IL_46c4:  nop 
	IL_46c5:  nop 
	IL_46c6:  starg 1

	IL_46ca:  nop 
	IL_46cb:  nop 
	IL_46cc:  br IL_57d3

	IL_46d1:  br IL_46db

	IL_46d6:  br IL_46db

	IL_46db:  ldarg 1

	IL_46df:  nop 
	IL_46e0:  nop 
	IL_46e1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46e6:  ldstr "^(\\d)+(.)*$"
	IL_46eb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_46f0:  stloc 1

	IL_46f4:  nop 
	IL_46f5:  nop 
	IL_46f6:  ldloc 1

	IL_46fa:  nop 
	IL_46fb:  nop 
	IL_46fc:  stloc 4

	IL_4700:  nop 
	IL_4701:  nop 
	IL_4702:  ldarg 1

	IL_4706:  nop 
	IL_4707:  nop 
	IL_4708:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_470d:  ldstr "^\\+(\\d)+(.)*$"
	IL_4712:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4717:  stloc 1

	IL_471b:  nop 
	IL_471c:  nop 
	IL_471d:  ldloc 4

	IL_4721:  nop 
	IL_4722:  nop 
	IL_4723:  ldloc 1

	IL_4727:  nop 
	IL_4728:  nop 
	IL_4729:  or 
	IL_472a:  stloc 4

	IL_472e:  nop 
	IL_472f:  nop 
	IL_4730:  ldarg 1

	IL_4734:  nop 
	IL_4735:  nop 
	IL_4736:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_473b:  ldstr "^-(\\d)+(.)*$"
	IL_4740:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4745:  stloc 1

	IL_4749:  nop 
	IL_474a:  nop 
	IL_474b:  ldloc 4

	IL_474f:  nop 
	IL_4750:  nop 
	IL_4751:  ldloc 1

	IL_4755:  nop 
	IL_4756:  nop 
	IL_4757:  or 
	IL_4758:  stloc 4

	IL_475c:  nop 
	IL_475d:  nop 
	IL_475e:  ldarg 1

	IL_4762:  nop 
	IL_4763:  nop 
	IL_4764:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4769:  stloc 2

	IL_476d:  nop 
	IL_476e:  nop 
	IL_476f:  ldloc 2

	IL_4773:  nop 
	IL_4774:  nop 
	IL_4775:  ldstr "ui"
	IL_477a:  callvirt instance bool string::EndsWith(string)
	IL_477f:  stloc 1

	IL_4783:  nop 
	IL_4784:  nop 
	IL_4785:  ldloc 4

	IL_4789:  nop 
	IL_478a:  nop 
	IL_478b:  ldloc 1

	IL_478f:  nop 
	IL_4790:  nop 
	IL_4791:  and 
	IL_4792:  stloc 4

	IL_4796:  nop 
	IL_4797:  nop 
	IL_4798:  ldloc 4

	IL_479c:  nop 
	IL_479d:  nop 
	IL_479e:  ldc.i4 1
	IL_47a3:  beq IL_47ad

	IL_47a8:  br IL_4896

	IL_47ad:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::'.ctor'()
	IL_47b2:  stloc 127

	IL_47b6:  nop 
	IL_47b7:  nop 
	IL_47b8:  ldloc 127

	IL_47bc:  nop 
	IL_47bd:  nop 
	IL_47be:  ldarg 1

	IL_47c2:  nop 
	IL_47c3:  nop 
	IL_47c4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_47c9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_47ce:  ldarg 1

	IL_47d2:  nop 
	IL_47d3:  nop 
	IL_47d4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_47d9:  stloc 2

	IL_47dd:  nop 
	IL_47de:  nop 
	IL_47df:  ldc.i4 1
	IL_47e4:  conv.u 
	IL_47e5:  newarr [mscorlib]System.Char
	IL_47ea:  stloc 3

	IL_47ee:  nop 
	IL_47ef:  nop 
	IL_47f0:  ldloc 3

	IL_47f4:  nop 
	IL_47f5:  nop 
	IL_47f6:  ldc.i4 0
	IL_47fb:  conv.u 
	IL_47fc:  ldstr "i"
	IL_4801:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4806:  stelem [mscorlib]System.Char
	IL_480b:  ldloc 2

	IL_480f:  nop 
	IL_4810:  nop 
	IL_4811:  ldloc 3

	IL_4815:  nop 
	IL_4816:  nop 
	IL_4817:  callvirt instance string string::TrimEnd(char[])
	IL_481c:  stloc 2

	IL_4820:  nop 
	IL_4821:  nop 
	IL_4822:  ldloc 3

	IL_4826:  nop 
	IL_4827:  nop 
	IL_4828:  ldc.i4 0
	IL_482d:  conv.u 
	IL_482e:  ldstr "u"
	IL_4833:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4838:  stelem [mscorlib]System.Char
	IL_483d:  ldloc 2

	IL_4841:  nop 
	IL_4842:  nop 
	IL_4843:  ldloc 3

	IL_4847:  nop 
	IL_4848:  nop 
	IL_4849:  callvirt instance string string::TrimEnd(char[])
	IL_484e:  stloc 2

	IL_4852:  nop 
	IL_4853:  nop 
	IL_4854:  ldloc 127

	IL_4858:  nop 
	IL_4859:  nop 
	IL_485a:  ldloc 2

	IL_485e:  nop 
	IL_485f:  nop 
	IL_4860:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4865:  ldloc 127

	IL_4869:  nop 
	IL_486a:  nop 
	IL_486b:  ldloc 127

	IL_486f:  nop 
	IL_4870:  nop 
	IL_4871:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4876:  call unsigned int32 class [mscorlib]System.Convert::ToUInt32(string)
	IL_487b:  stfld unsigned int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::NumVal
	IL_4880:  ldloc 127

	IL_4884:  nop 
	IL_4885:  nop 
	IL_4886:  starg 1

	IL_488a:  nop 
	IL_488b:  nop 
	IL_488c:  br IL_57d3

	IL_4891:  br IL_489b

	IL_4896:  br IL_489b

	IL_489b:  ldarg 1

	IL_489f:  nop 
	IL_48a0:  nop 
	IL_48a1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48a6:  ldstr "^(\\d)+(.)*$"
	IL_48ab:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_48b0:  stloc 1

	IL_48b4:  nop 
	IL_48b5:  nop 
	IL_48b6:  ldloc 1

	IL_48ba:  nop 
	IL_48bb:  nop 
	IL_48bc:  stloc 4

	IL_48c0:  nop 
	IL_48c1:  nop 
	IL_48c2:  ldarg 1

	IL_48c6:  nop 
	IL_48c7:  nop 
	IL_48c8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48cd:  ldstr "^\\+(\\d)+(.)*$"
	IL_48d2:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_48d7:  stloc 1

	IL_48db:  nop 
	IL_48dc:  nop 
	IL_48dd:  ldloc 4

	IL_48e1:  nop 
	IL_48e2:  nop 
	IL_48e3:  ldloc 1

	IL_48e7:  nop 
	IL_48e8:  nop 
	IL_48e9:  or 
	IL_48ea:  stloc 4

	IL_48ee:  nop 
	IL_48ef:  nop 
	IL_48f0:  ldarg 1

	IL_48f4:  nop 
	IL_48f5:  nop 
	IL_48f6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48fb:  ldstr "^-(\\d)+(.)*$"
	IL_4900:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4905:  stloc 1

	IL_4909:  nop 
	IL_490a:  nop 
	IL_490b:  ldloc 4

	IL_490f:  nop 
	IL_4910:  nop 
	IL_4911:  ldloc 1

	IL_4915:  nop 
	IL_4916:  nop 
	IL_4917:  or 
	IL_4918:  stloc 4

	IL_491c:  nop 
	IL_491d:  nop 
	IL_491e:  ldarg 1

	IL_4922:  nop 
	IL_4923:  nop 
	IL_4924:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4929:  stloc 2

	IL_492d:  nop 
	IL_492e:  nop 
	IL_492f:  ldloc 2

	IL_4933:  nop 
	IL_4934:  nop 
	IL_4935:  ldstr "ip"
	IL_493a:  callvirt instance bool string::EndsWith(string)
	IL_493f:  stloc 1

	IL_4943:  nop 
	IL_4944:  nop 
	IL_4945:  ldloc 4

	IL_4949:  nop 
	IL_494a:  nop 
	IL_494b:  ldloc 1

	IL_494f:  nop 
	IL_4950:  nop 
	IL_4951:  and 
	IL_4952:  stloc 4

	IL_4956:  nop 
	IL_4957:  nop 
	IL_4958:  ldloc 4

	IL_495c:  nop 
	IL_495d:  nop 
	IL_495e:  ldc.i4 1
	IL_4963:  beq IL_496d

	IL_4968:  br IL_4a5b

	IL_496d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::'.ctor'()
	IL_4972:  stloc 128

	IL_4976:  nop 
	IL_4977:  nop 
	IL_4978:  ldloc 128

	IL_497c:  nop 
	IL_497d:  nop 
	IL_497e:  ldarg 1

	IL_4982:  nop 
	IL_4983:  nop 
	IL_4984:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4989:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_498e:  ldarg 1

	IL_4992:  nop 
	IL_4993:  nop 
	IL_4994:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4999:  stloc 2

	IL_499d:  nop 
	IL_499e:  nop 
	IL_499f:  ldc.i4 1
	IL_49a4:  conv.u 
	IL_49a5:  newarr [mscorlib]System.Char
	IL_49aa:  stloc 3

	IL_49ae:  nop 
	IL_49af:  nop 
	IL_49b0:  ldloc 3

	IL_49b4:  nop 
	IL_49b5:  nop 
	IL_49b6:  ldc.i4 0
	IL_49bb:  conv.u 
	IL_49bc:  ldstr "p"
	IL_49c1:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_49c6:  stelem [mscorlib]System.Char
	IL_49cb:  ldloc 2

	IL_49cf:  nop 
	IL_49d0:  nop 
	IL_49d1:  ldloc 3

	IL_49d5:  nop 
	IL_49d6:  nop 
	IL_49d7:  callvirt instance string string::TrimEnd(char[])
	IL_49dc:  stloc 2

	IL_49e0:  nop 
	IL_49e1:  nop 
	IL_49e2:  ldloc 3

	IL_49e6:  nop 
	IL_49e7:  nop 
	IL_49e8:  ldc.i4 0
	IL_49ed:  conv.u 
	IL_49ee:  ldstr "i"
	IL_49f3:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_49f8:  stelem [mscorlib]System.Char
	IL_49fd:  ldloc 2

	IL_4a01:  nop 
	IL_4a02:  nop 
	IL_4a03:  ldloc 3

	IL_4a07:  nop 
	IL_4a08:  nop 
	IL_4a09:  callvirt instance string string::TrimEnd(char[])
	IL_4a0e:  stloc 2

	IL_4a12:  nop 
	IL_4a13:  nop 
	IL_4a14:  ldloc 128

	IL_4a18:  nop 
	IL_4a19:  nop 
	IL_4a1a:  ldloc 2

	IL_4a1e:  nop 
	IL_4a1f:  nop 
	IL_4a20:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a25:  ldloc 128

	IL_4a29:  nop 
	IL_4a2a:  nop 
	IL_4a2b:  ldloc 128

	IL_4a2f:  nop 
	IL_4a30:  nop 
	IL_4a31:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a36:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_4a3b:  newobj instance void native int::'.ctor'(int32)
	IL_4a40:  stfld native int [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::NumVal
	IL_4a45:  ldloc 128

	IL_4a49:  nop 
	IL_4a4a:  nop 
	IL_4a4b:  starg 1

	IL_4a4f:  nop 
	IL_4a50:  nop 
	IL_4a51:  br IL_57d3

	IL_4a56:  br IL_4a60

	IL_4a5b:  br IL_4a60

	IL_4a60:  ldarg 1

	IL_4a64:  nop 
	IL_4a65:  nop 
	IL_4a66:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a6b:  ldstr "^(\\d)+(.)*$"
	IL_4a70:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4a75:  stloc 1

	IL_4a79:  nop 
	IL_4a7a:  nop 
	IL_4a7b:  ldloc 1

	IL_4a7f:  nop 
	IL_4a80:  nop 
	IL_4a81:  stloc 4

	IL_4a85:  nop 
	IL_4a86:  nop 
	IL_4a87:  ldarg 1

	IL_4a8b:  nop 
	IL_4a8c:  nop 
	IL_4a8d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a92:  ldstr "^\\+(\\d)+(.)*$"
	IL_4a97:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4a9c:  stloc 1

	IL_4aa0:  nop 
	IL_4aa1:  nop 
	IL_4aa2:  ldloc 4

	IL_4aa6:  nop 
	IL_4aa7:  nop 
	IL_4aa8:  ldloc 1

	IL_4aac:  nop 
	IL_4aad:  nop 
	IL_4aae:  or 
	IL_4aaf:  stloc 4

	IL_4ab3:  nop 
	IL_4ab4:  nop 
	IL_4ab5:  ldarg 1

	IL_4ab9:  nop 
	IL_4aba:  nop 
	IL_4abb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ac0:  ldstr "^-(\\d)+(.)*$"
	IL_4ac5:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4aca:  stloc 1

	IL_4ace:  nop 
	IL_4acf:  nop 
	IL_4ad0:  ldloc 4

	IL_4ad4:  nop 
	IL_4ad5:  nop 
	IL_4ad6:  ldloc 1

	IL_4ada:  nop 
	IL_4adb:  nop 
	IL_4adc:  or 
	IL_4add:  stloc 4

	IL_4ae1:  nop 
	IL_4ae2:  nop 
	IL_4ae3:  ldarg 1

	IL_4ae7:  nop 
	IL_4ae8:  nop 
	IL_4ae9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4aee:  stloc 2

	IL_4af2:  nop 
	IL_4af3:  nop 
	IL_4af4:  ldloc 2

	IL_4af8:  nop 
	IL_4af9:  nop 
	IL_4afa:  ldstr "i"
	IL_4aff:  callvirt instance bool string::EndsWith(string)
	IL_4b04:  stloc 1

	IL_4b08:  nop 
	IL_4b09:  nop 
	IL_4b0a:  ldloc 4

	IL_4b0e:  nop 
	IL_4b0f:  nop 
	IL_4b10:  ldloc 1

	IL_4b14:  nop 
	IL_4b15:  nop 
	IL_4b16:  and 
	IL_4b17:  stloc 4

	IL_4b1b:  nop 
	IL_4b1c:  nop 
	IL_4b1d:  ldloc 4

	IL_4b21:  nop 
	IL_4b22:  nop 
	IL_4b23:  ldc.i4 1
	IL_4b28:  beq IL_4b32

	IL_4b2d:  br IL_4be9

	IL_4b32:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_4b37:  stloc 129

	IL_4b3b:  nop 
	IL_4b3c:  nop 
	IL_4b3d:  ldloc 129

	IL_4b41:  nop 
	IL_4b42:  nop 
	IL_4b43:  ldarg 1

	IL_4b47:  nop 
	IL_4b48:  nop 
	IL_4b49:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4b4e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4b53:  ldarg 1

	IL_4b57:  nop 
	IL_4b58:  nop 
	IL_4b59:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b5e:  stloc 2

	IL_4b62:  nop 
	IL_4b63:  nop 
	IL_4b64:  ldc.i4 1
	IL_4b69:  conv.u 
	IL_4b6a:  newarr [mscorlib]System.Char
	IL_4b6f:  stloc 3

	IL_4b73:  nop 
	IL_4b74:  nop 
	IL_4b75:  ldloc 3

	IL_4b79:  nop 
	IL_4b7a:  nop 
	IL_4b7b:  ldc.i4 0
	IL_4b80:  conv.u 
	IL_4b81:  ldstr "i"
	IL_4b86:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4b8b:  stelem [mscorlib]System.Char
	IL_4b90:  ldloc 2

	IL_4b94:  nop 
	IL_4b95:  nop 
	IL_4b96:  ldloc 3

	IL_4b9a:  nop 
	IL_4b9b:  nop 
	IL_4b9c:  callvirt instance string string::TrimEnd(char[])
	IL_4ba1:  stloc 2

	IL_4ba5:  nop 
	IL_4ba6:  nop 
	IL_4ba7:  ldloc 129

	IL_4bab:  nop 
	IL_4bac:  nop 
	IL_4bad:  ldloc 2

	IL_4bb1:  nop 
	IL_4bb2:  nop 
	IL_4bb3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4bb8:  ldloc 129

	IL_4bbc:  nop 
	IL_4bbd:  nop 
	IL_4bbe:  ldloc 129

	IL_4bc2:  nop 
	IL_4bc3:  nop 
	IL_4bc4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4bc9:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_4bce:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_4bd3:  ldloc 129

	IL_4bd7:  nop 
	IL_4bd8:  nop 
	IL_4bd9:  starg 1

	IL_4bdd:  nop 
	IL_4bde:  nop 
	IL_4bdf:  br IL_57d3

	IL_4be4:  br IL_4bee

	IL_4be9:  br IL_4bee

	IL_4bee:  ldarg 1

	IL_4bf2:  nop 
	IL_4bf3:  nop 
	IL_4bf4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4bf9:  ldstr "^(\\d)+(.)*$"
	IL_4bfe:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4c03:  stloc 1

	IL_4c07:  nop 
	IL_4c08:  nop 
	IL_4c09:  ldloc 1

	IL_4c0d:  nop 
	IL_4c0e:  nop 
	IL_4c0f:  stloc 4

	IL_4c13:  nop 
	IL_4c14:  nop 
	IL_4c15:  ldarg 1

	IL_4c19:  nop 
	IL_4c1a:  nop 
	IL_4c1b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c20:  ldstr "^\\+(\\d)+(.)*$"
	IL_4c25:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4c2a:  stloc 1

	IL_4c2e:  nop 
	IL_4c2f:  nop 
	IL_4c30:  ldloc 4

	IL_4c34:  nop 
	IL_4c35:  nop 
	IL_4c36:  ldloc 1

	IL_4c3a:  nop 
	IL_4c3b:  nop 
	IL_4c3c:  or 
	IL_4c3d:  stloc 4

	IL_4c41:  nop 
	IL_4c42:  nop 
	IL_4c43:  ldarg 1

	IL_4c47:  nop 
	IL_4c48:  nop 
	IL_4c49:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c4e:  ldstr "^-(\\d)+(.)*$"
	IL_4c53:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4c58:  stloc 1

	IL_4c5c:  nop 
	IL_4c5d:  nop 
	IL_4c5e:  ldloc 4

	IL_4c62:  nop 
	IL_4c63:  nop 
	IL_4c64:  ldloc 1

	IL_4c68:  nop 
	IL_4c69:  nop 
	IL_4c6a:  or 
	IL_4c6b:  stloc 4

	IL_4c6f:  nop 
	IL_4c70:  nop 
	IL_4c71:  ldarg 1

	IL_4c75:  nop 
	IL_4c76:  nop 
	IL_4c77:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c7c:  stloc 2

	IL_4c80:  nop 
	IL_4c81:  nop 
	IL_4c82:  ldloc 2

	IL_4c86:  nop 
	IL_4c87:  nop 
	IL_4c88:  ldstr "ul"
	IL_4c8d:  callvirt instance bool string::EndsWith(string)
	IL_4c92:  stloc 1

	IL_4c96:  nop 
	IL_4c97:  nop 
	IL_4c98:  ldloc 4

	IL_4c9c:  nop 
	IL_4c9d:  nop 
	IL_4c9e:  ldloc 1

	IL_4ca2:  nop 
	IL_4ca3:  nop 
	IL_4ca4:  and 
	IL_4ca5:  stloc 4

	IL_4ca9:  nop 
	IL_4caa:  nop 
	IL_4cab:  ldloc 4

	IL_4caf:  nop 
	IL_4cb0:  nop 
	IL_4cb1:  ldc.i4 1
	IL_4cb6:  beq IL_4cc0

	IL_4cbb:  br IL_4da9

	IL_4cc0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::'.ctor'()
	IL_4cc5:  stloc 130

	IL_4cc9:  nop 
	IL_4cca:  nop 
	IL_4ccb:  ldloc 130

	IL_4ccf:  nop 
	IL_4cd0:  nop 
	IL_4cd1:  ldarg 1

	IL_4cd5:  nop 
	IL_4cd6:  nop 
	IL_4cd7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4cdc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4ce1:  ldarg 1

	IL_4ce5:  nop 
	IL_4ce6:  nop 
	IL_4ce7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4cec:  stloc 2

	IL_4cf0:  nop 
	IL_4cf1:  nop 
	IL_4cf2:  ldc.i4 1
	IL_4cf7:  conv.u 
	IL_4cf8:  newarr [mscorlib]System.Char
	IL_4cfd:  stloc 3

	IL_4d01:  nop 
	IL_4d02:  nop 
	IL_4d03:  ldloc 3

	IL_4d07:  nop 
	IL_4d08:  nop 
	IL_4d09:  ldc.i4 0
	IL_4d0e:  conv.u 
	IL_4d0f:  ldstr "l"
	IL_4d14:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4d19:  stelem [mscorlib]System.Char
	IL_4d1e:  ldloc 2

	IL_4d22:  nop 
	IL_4d23:  nop 
	IL_4d24:  ldloc 3

	IL_4d28:  nop 
	IL_4d29:  nop 
	IL_4d2a:  callvirt instance string string::TrimEnd(char[])
	IL_4d2f:  stloc 2

	IL_4d33:  nop 
	IL_4d34:  nop 
	IL_4d35:  ldloc 3

	IL_4d39:  nop 
	IL_4d3a:  nop 
	IL_4d3b:  ldc.i4 0
	IL_4d40:  conv.u 
	IL_4d41:  ldstr "u"
	IL_4d46:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4d4b:  stelem [mscorlib]System.Char
	IL_4d50:  ldloc 2

	IL_4d54:  nop 
	IL_4d55:  nop 
	IL_4d56:  ldloc 3

	IL_4d5a:  nop 
	IL_4d5b:  nop 
	IL_4d5c:  callvirt instance string string::TrimEnd(char[])
	IL_4d61:  stloc 2

	IL_4d65:  nop 
	IL_4d66:  nop 
	IL_4d67:  ldloc 130

	IL_4d6b:  nop 
	IL_4d6c:  nop 
	IL_4d6d:  ldloc 2

	IL_4d71:  nop 
	IL_4d72:  nop 
	IL_4d73:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4d78:  ldloc 130

	IL_4d7c:  nop 
	IL_4d7d:  nop 
	IL_4d7e:  ldloc 130

	IL_4d82:  nop 
	IL_4d83:  nop 
	IL_4d84:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4d89:  call unsigned int64 class [mscorlib]System.Convert::ToUInt64(string)
	IL_4d8e:  stfld unsigned int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::NumVal
	IL_4d93:  ldloc 130

	IL_4d97:  nop 
	IL_4d98:  nop 
	IL_4d99:  starg 1

	IL_4d9d:  nop 
	IL_4d9e:  nop 
	IL_4d9f:  br IL_57d3

	IL_4da4:  br IL_4dae

	IL_4da9:  br IL_4dae

	IL_4dae:  ldarg 1

	IL_4db2:  nop 
	IL_4db3:  nop 
	IL_4db4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4db9:  ldstr "^(\\d)+(.)*$"
	IL_4dbe:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4dc3:  stloc 1

	IL_4dc7:  nop 
	IL_4dc8:  nop 
	IL_4dc9:  ldloc 1

	IL_4dcd:  nop 
	IL_4dce:  nop 
	IL_4dcf:  stloc 4

	IL_4dd3:  nop 
	IL_4dd4:  nop 
	IL_4dd5:  ldarg 1

	IL_4dd9:  nop 
	IL_4dda:  nop 
	IL_4ddb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4de0:  ldstr "^\\+(\\d)+(.)*$"
	IL_4de5:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4dea:  stloc 1

	IL_4dee:  nop 
	IL_4def:  nop 
	IL_4df0:  ldloc 4

	IL_4df4:  nop 
	IL_4df5:  nop 
	IL_4df6:  ldloc 1

	IL_4dfa:  nop 
	IL_4dfb:  nop 
	IL_4dfc:  or 
	IL_4dfd:  stloc 4

	IL_4e01:  nop 
	IL_4e02:  nop 
	IL_4e03:  ldarg 1

	IL_4e07:  nop 
	IL_4e08:  nop 
	IL_4e09:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4e0e:  ldstr "^-(\\d)+(.)*$"
	IL_4e13:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4e18:  stloc 1

	IL_4e1c:  nop 
	IL_4e1d:  nop 
	IL_4e1e:  ldloc 4

	IL_4e22:  nop 
	IL_4e23:  nop 
	IL_4e24:  ldloc 1

	IL_4e28:  nop 
	IL_4e29:  nop 
	IL_4e2a:  or 
	IL_4e2b:  stloc 4

	IL_4e2f:  nop 
	IL_4e30:  nop 
	IL_4e31:  ldarg 1

	IL_4e35:  nop 
	IL_4e36:  nop 
	IL_4e37:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4e3c:  stloc 2

	IL_4e40:  nop 
	IL_4e41:  nop 
	IL_4e42:  ldloc 2

	IL_4e46:  nop 
	IL_4e47:  nop 
	IL_4e48:  ldstr "l"
	IL_4e4d:  callvirt instance bool string::EndsWith(string)
	IL_4e52:  stloc 1

	IL_4e56:  nop 
	IL_4e57:  nop 
	IL_4e58:  ldloc 4

	IL_4e5c:  nop 
	IL_4e5d:  nop 
	IL_4e5e:  ldloc 1

	IL_4e62:  nop 
	IL_4e63:  nop 
	IL_4e64:  and 
	IL_4e65:  stloc 4

	IL_4e69:  nop 
	IL_4e6a:  nop 
	IL_4e6b:  ldloc 4

	IL_4e6f:  nop 
	IL_4e70:  nop 
	IL_4e71:  ldc.i4 1
	IL_4e76:  beq IL_4e80

	IL_4e7b:  br IL_4f37

	IL_4e80:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::'.ctor'()
	IL_4e85:  stloc 131

	IL_4e89:  nop 
	IL_4e8a:  nop 
	IL_4e8b:  ldloc 131

	IL_4e8f:  nop 
	IL_4e90:  nop 
	IL_4e91:  ldarg 1

	IL_4e95:  nop 
	IL_4e96:  nop 
	IL_4e97:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4e9c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4ea1:  ldarg 1

	IL_4ea5:  nop 
	IL_4ea6:  nop 
	IL_4ea7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4eac:  stloc 2

	IL_4eb0:  nop 
	IL_4eb1:  nop 
	IL_4eb2:  ldc.i4 1
	IL_4eb7:  conv.u 
	IL_4eb8:  newarr [mscorlib]System.Char
	IL_4ebd:  stloc 3

	IL_4ec1:  nop 
	IL_4ec2:  nop 
	IL_4ec3:  ldloc 3

	IL_4ec7:  nop 
	IL_4ec8:  nop 
	IL_4ec9:  ldc.i4 0
	IL_4ece:  conv.u 
	IL_4ecf:  ldstr "l"
	IL_4ed4:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4ed9:  stelem [mscorlib]System.Char
	IL_4ede:  ldloc 2

	IL_4ee2:  nop 
	IL_4ee3:  nop 
	IL_4ee4:  ldloc 3

	IL_4ee8:  nop 
	IL_4ee9:  nop 
	IL_4eea:  callvirt instance string string::TrimEnd(char[])
	IL_4eef:  stloc 2

	IL_4ef3:  nop 
	IL_4ef4:  nop 
	IL_4ef5:  ldloc 131

	IL_4ef9:  nop 
	IL_4efa:  nop 
	IL_4efb:  ldloc 2

	IL_4eff:  nop 
	IL_4f00:  nop 
	IL_4f01:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f06:  ldloc 131

	IL_4f0a:  nop 
	IL_4f0b:  nop 
	IL_4f0c:  ldloc 131

	IL_4f10:  nop 
	IL_4f11:  nop 
	IL_4f12:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f17:  call int64 class [mscorlib]System.Convert::ToInt64(string)
	IL_4f1c:  stfld int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_4f21:  ldloc 131

	IL_4f25:  nop 
	IL_4f26:  nop 
	IL_4f27:  starg 1

	IL_4f2b:  nop 
	IL_4f2c:  nop 
	IL_4f2d:  br IL_57d3

	IL_4f32:  br IL_4f3c

	IL_4f37:  br IL_4f3c

	IL_4f3c:  ldarg 1

	IL_4f40:  nop 
	IL_4f41:  nop 
	IL_4f42:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f47:  ldstr "^(\\d)+(.)*$"
	IL_4f4c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4f51:  stloc 1

	IL_4f55:  nop 
	IL_4f56:  nop 
	IL_4f57:  ldloc 1

	IL_4f5b:  nop 
	IL_4f5c:  nop 
	IL_4f5d:  stloc 4

	IL_4f61:  nop 
	IL_4f62:  nop 
	IL_4f63:  ldarg 1

	IL_4f67:  nop 
	IL_4f68:  nop 
	IL_4f69:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f6e:  ldstr "^\\+(\\d)+(.)*$"
	IL_4f73:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4f78:  stloc 1

	IL_4f7c:  nop 
	IL_4f7d:  nop 
	IL_4f7e:  ldloc 4

	IL_4f82:  nop 
	IL_4f83:  nop 
	IL_4f84:  ldloc 1

	IL_4f88:  nop 
	IL_4f89:  nop 
	IL_4f8a:  or 
	IL_4f8b:  stloc 4

	IL_4f8f:  nop 
	IL_4f90:  nop 
	IL_4f91:  ldarg 1

	IL_4f95:  nop 
	IL_4f96:  nop 
	IL_4f97:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f9c:  ldstr "^-(\\d)+(.)*$"
	IL_4fa1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4fa6:  stloc 1

	IL_4faa:  nop 
	IL_4fab:  nop 
	IL_4fac:  ldloc 4

	IL_4fb0:  nop 
	IL_4fb1:  nop 
	IL_4fb2:  ldloc 1

	IL_4fb6:  nop 
	IL_4fb7:  nop 
	IL_4fb8:  or 
	IL_4fb9:  stloc 4

	IL_4fbd:  nop 
	IL_4fbe:  nop 
	IL_4fbf:  ldarg 1

	IL_4fc3:  nop 
	IL_4fc4:  nop 
	IL_4fc5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4fca:  stloc 2

	IL_4fce:  nop 
	IL_4fcf:  nop 
	IL_4fd0:  ldloc 2

	IL_4fd4:  nop 
	IL_4fd5:  nop 
	IL_4fd6:  ldstr "us"
	IL_4fdb:  callvirt instance bool string::EndsWith(string)
	IL_4fe0:  stloc 1

	IL_4fe4:  nop 
	IL_4fe5:  nop 
	IL_4fe6:  ldloc 4

	IL_4fea:  nop 
	IL_4feb:  nop 
	IL_4fec:  ldloc 1

	IL_4ff0:  nop 
	IL_4ff1:  nop 
	IL_4ff2:  and 
	IL_4ff3:  stloc 4

	IL_4ff7:  nop 
	IL_4ff8:  nop 
	IL_4ff9:  ldloc 4

	IL_4ffd:  nop 
	IL_4ffe:  nop 
	IL_4fff:  ldc.i4 1
	IL_5004:  beq IL_500e

	IL_5009:  br IL_50f7

	IL_500e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::'.ctor'()
	IL_5013:  stloc 132

	IL_5017:  nop 
	IL_5018:  nop 
	IL_5019:  ldloc 132

	IL_501d:  nop 
	IL_501e:  nop 
	IL_501f:  ldarg 1

	IL_5023:  nop 
	IL_5024:  nop 
	IL_5025:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_502a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_502f:  ldarg 1

	IL_5033:  nop 
	IL_5034:  nop 
	IL_5035:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_503a:  stloc 2

	IL_503e:  nop 
	IL_503f:  nop 
	IL_5040:  ldc.i4 1
	IL_5045:  conv.u 
	IL_5046:  newarr [mscorlib]System.Char
	IL_504b:  stloc 3

	IL_504f:  nop 
	IL_5050:  nop 
	IL_5051:  ldloc 3

	IL_5055:  nop 
	IL_5056:  nop 
	IL_5057:  ldc.i4 0
	IL_505c:  conv.u 
	IL_505d:  ldstr "s"
	IL_5062:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_5067:  stelem [mscorlib]System.Char
	IL_506c:  ldloc 2

	IL_5070:  nop 
	IL_5071:  nop 
	IL_5072:  ldloc 3

	IL_5076:  nop 
	IL_5077:  nop 
	IL_5078:  callvirt instance string string::TrimEnd(char[])
	IL_507d:  stloc 2

	IL_5081:  nop 
	IL_5082:  nop 
	IL_5083:  ldloc 3

	IL_5087:  nop 
	IL_5088:  nop 
	IL_5089:  ldc.i4 0
	IL_508e:  conv.u 
	IL_508f:  ldstr "u"
	IL_5094:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_5099:  stelem [mscorlib]System.Char
	IL_509e:  ldloc 2

	IL_50a2:  nop 
	IL_50a3:  nop 
	IL_50a4:  ldloc 3

	IL_50a8:  nop 
	IL_50a9:  nop 
	IL_50aa:  callvirt instance string string::TrimEnd(char[])
	IL_50af:  stloc 2

	IL_50b3:  nop 
	IL_50b4:  nop 
	IL_50b5:  ldloc 132

	IL_50b9:  nop 
	IL_50ba:  nop 
	IL_50bb:  ldloc 2

	IL_50bf:  nop 
	IL_50c0:  nop 
	IL_50c1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_50c6:  ldloc 132

	IL_50ca:  nop 
	IL_50cb:  nop 
	IL_50cc:  ldloc 132

	IL_50d0:  nop 
	IL_50d1:  nop 
	IL_50d2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_50d7:  call unsigned int16 class [mscorlib]System.Convert::ToUInt16(string)
	IL_50dc:  stfld unsigned int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::NumVal
	IL_50e1:  ldloc 132

	IL_50e5:  nop 
	IL_50e6:  nop 
	IL_50e7:  starg 1

	IL_50eb:  nop 
	IL_50ec:  nop 
	IL_50ed:  br IL_57d3

	IL_50f2:  br IL_50fc

	IL_50f7:  br IL_50fc

	IL_50fc:  ldarg 1

	IL_5100:  nop 
	IL_5101:  nop 
	IL_5102:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5107:  ldstr "^(\\d)+(.)*$"
	IL_510c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5111:  stloc 1

	IL_5115:  nop 
	IL_5116:  nop 
	IL_5117:  ldloc 1

	IL_511b:  nop 
	IL_511c:  nop 
	IL_511d:  stloc 4

	IL_5121:  nop 
	IL_5122:  nop 
	IL_5123:  ldarg 1

	IL_5127:  nop 
	IL_5128:  nop 
	IL_5129:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_512e:  ldstr "^\\+(\\d)+(.)*$"
	IL_5133:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5138:  stloc 1

	IL_513c:  nop 
	IL_513d:  nop 
	IL_513e:  ldloc 4

	IL_5142:  nop 
	IL_5143:  nop 
	IL_5144:  ldloc 1

	IL_5148:  nop 
	IL_5149:  nop 
	IL_514a:  or 
	IL_514b:  stloc 4

	IL_514f:  nop 
	IL_5150:  nop 
	IL_5151:  ldarg 1

	IL_5155:  nop 
	IL_5156:  nop 
	IL_5157:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_515c:  ldstr "^-(\\d)+(.)*$"
	IL_5161:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5166:  stloc 1

	IL_516a:  nop 
	IL_516b:  nop 
	IL_516c:  ldloc 4

	IL_5170:  nop 
	IL_5171:  nop 
	IL_5172:  ldloc 1

	IL_5176:  nop 
	IL_5177:  nop 
	IL_5178:  or 
	IL_5179:  stloc 4

	IL_517d:  nop 
	IL_517e:  nop 
	IL_517f:  ldarg 1

	IL_5183:  nop 
	IL_5184:  nop 
	IL_5185:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_518a:  stloc 2

	IL_518e:  nop 
	IL_518f:  nop 
	IL_5190:  ldloc 2

	IL_5194:  nop 
	IL_5195:  nop 
	IL_5196:  ldstr "s"
	IL_519b:  callvirt instance bool string::EndsWith(string)
	IL_51a0:  stloc 1

	IL_51a4:  nop 
	IL_51a5:  nop 
	IL_51a6:  ldloc 4

	IL_51aa:  nop 
	IL_51ab:  nop 
	IL_51ac:  ldloc 1

	IL_51b0:  nop 
	IL_51b1:  nop 
	IL_51b2:  and 
	IL_51b3:  stloc 4

	IL_51b7:  nop 
	IL_51b8:  nop 
	IL_51b9:  ldloc 4

	IL_51bd:  nop 
	IL_51be:  nop 
	IL_51bf:  ldc.i4 1
	IL_51c4:  beq IL_51ce

	IL_51c9:  br IL_5285

	IL_51ce:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::'.ctor'()
	IL_51d3:  stloc 133

	IL_51d7:  nop 
	IL_51d8:  nop 
	IL_51d9:  ldloc 133

	IL_51dd:  nop 
	IL_51de:  nop 
	IL_51df:  ldarg 1

	IL_51e3:  nop 
	IL_51e4:  nop 
	IL_51e5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_51ea:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_51ef:  ldarg 1

	IL_51f3:  nop 
	IL_51f4:  nop 
	IL_51f5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_51fa:  stloc 2

	IL_51fe:  nop 
	IL_51ff:  nop 
	IL_5200:  ldc.i4 1
	IL_5205:  conv.u 
	IL_5206:  newarr [mscorlib]System.Char
	IL_520b:  stloc 3

	IL_520f:  nop 
	IL_5210:  nop 
	IL_5211:  ldloc 3

	IL_5215:  nop 
	IL_5216:  nop 
	IL_5217:  ldc.i4 0
	IL_521c:  conv.u 
	IL_521d:  ldstr "s"
	IL_5222:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_5227:  stelem [mscorlib]System.Char
	IL_522c:  ldloc 2

	IL_5230:  nop 
	IL_5231:  nop 
	IL_5232:  ldloc 3

	IL_5236:  nop 
	IL_5237:  nop 
	IL_5238:  callvirt instance string string::TrimEnd(char[])
	IL_523d:  stloc 2

	IL_5241:  nop 
	IL_5242:  nop 
	IL_5243:  ldloc 133

	IL_5247:  nop 
	IL_5248:  nop 
	IL_5249:  ldloc 2

	IL_524d:  nop 
	IL_524e:  nop 
	IL_524f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5254:  ldloc 133

	IL_5258:  nop 
	IL_5259:  nop 
	IL_525a:  ldloc 133

	IL_525e:  nop 
	IL_525f:  nop 
	IL_5260:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5265:  call int16 class [mscorlib]System.Convert::ToInt16(string)
	IL_526a:  stfld int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_526f:  ldloc 133

	IL_5273:  nop 
	IL_5274:  nop 
	IL_5275:  starg 1

	IL_5279:  nop 
	IL_527a:  nop 
	IL_527b:  br IL_57d3

	IL_5280:  br IL_528a

	IL_5285:  br IL_528a

	IL_528a:  ldarg 1

	IL_528e:  nop 
	IL_528f:  nop 
	IL_5290:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5295:  ldstr "^(\\d)+(.)*$"
	IL_529a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_529f:  stloc 1

	IL_52a3:  nop 
	IL_52a4:  nop 
	IL_52a5:  ldloc 1

	IL_52a9:  nop 
	IL_52aa:  nop 
	IL_52ab:  stloc 4

	IL_52af:  nop 
	IL_52b0:  nop 
	IL_52b1:  ldarg 1

	IL_52b5:  nop 
	IL_52b6:  nop 
	IL_52b7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_52bc:  ldstr "^\\+(\\d)+(.)*$"
	IL_52c1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_52c6:  stloc 1

	IL_52ca:  nop 
	IL_52cb:  nop 
	IL_52cc:  ldloc 4

	IL_52d0:  nop 
	IL_52d1:  nop 
	IL_52d2:  ldloc 1

	IL_52d6:  nop 
	IL_52d7:  nop 
	IL_52d8:  or 
	IL_52d9:  stloc 4

	IL_52dd:  nop 
	IL_52de:  nop 
	IL_52df:  ldarg 1

	IL_52e3:  nop 
	IL_52e4:  nop 
	IL_52e5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_52ea:  ldstr "^-(\\d)+(.)*$"
	IL_52ef:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_52f4:  stloc 1

	IL_52f8:  nop 
	IL_52f9:  nop 
	IL_52fa:  ldloc 4

	IL_52fe:  nop 
	IL_52ff:  nop 
	IL_5300:  ldloc 1

	IL_5304:  nop 
	IL_5305:  nop 
	IL_5306:  or 
	IL_5307:  stloc 4

	IL_530b:  nop 
	IL_530c:  nop 
	IL_530d:  ldarg 1

	IL_5311:  nop 
	IL_5312:  nop 
	IL_5313:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5318:  stloc 2

	IL_531c:  nop 
	IL_531d:  nop 
	IL_531e:  ldloc 2

	IL_5322:  nop 
	IL_5323:  nop 
	IL_5324:  ldstr "ub"
	IL_5329:  callvirt instance bool string::EndsWith(string)
	IL_532e:  stloc 1

	IL_5332:  nop 
	IL_5333:  nop 
	IL_5334:  ldloc 4

	IL_5338:  nop 
	IL_5339:  nop 
	IL_533a:  ldloc 1

	IL_533e:  nop 
	IL_533f:  nop 
	IL_5340:  and 
	IL_5341:  stloc 4

	IL_5345:  nop 
	IL_5346:  nop 
	IL_5347:  ldloc 4

	IL_534b:  nop 
	IL_534c:  nop 
	IL_534d:  ldc.i4 1
	IL_5352:  beq IL_535c

	IL_5357:  br IL_5445

	IL_535c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::'.ctor'()
	IL_5361:  stloc 134

	IL_5365:  nop 
	IL_5366:  nop 
	IL_5367:  ldloc 134

	IL_536b:  nop 
	IL_536c:  nop 
	IL_536d:  ldarg 1

	IL_5371:  nop 
	IL_5372:  nop 
	IL_5373:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_5378:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_537d:  ldarg 1

	IL_5381:  nop 
	IL_5382:  nop 
	IL_5383:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5388:  stloc 2

	IL_538c:  nop 
	IL_538d:  nop 
	IL_538e:  ldc.i4 1
	IL_5393:  conv.u 
	IL_5394:  newarr [mscorlib]System.Char
	IL_5399:  stloc 3

	IL_539d:  nop 
	IL_539e:  nop 
	IL_539f:  ldloc 3

	IL_53a3:  nop 
	IL_53a4:  nop 
	IL_53a5:  ldc.i4 0
	IL_53aa:  conv.u 
	IL_53ab:  ldstr "b"
	IL_53b0:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_53b5:  stelem [mscorlib]System.Char
	IL_53ba:  ldloc 2

	IL_53be:  nop 
	IL_53bf:  nop 
	IL_53c0:  ldloc 3

	IL_53c4:  nop 
	IL_53c5:  nop 
	IL_53c6:  callvirt instance string string::TrimEnd(char[])
	IL_53cb:  stloc 2

	IL_53cf:  nop 
	IL_53d0:  nop 
	IL_53d1:  ldloc 3

	IL_53d5:  nop 
	IL_53d6:  nop 
	IL_53d7:  ldc.i4 0
	IL_53dc:  conv.u 
	IL_53dd:  ldstr "u"
	IL_53e2:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_53e7:  stelem [mscorlib]System.Char
	IL_53ec:  ldloc 2

	IL_53f0:  nop 
	IL_53f1:  nop 
	IL_53f2:  ldloc 3

	IL_53f6:  nop 
	IL_53f7:  nop 
	IL_53f8:  callvirt instance string string::TrimEnd(char[])
	IL_53fd:  stloc 2

	IL_5401:  nop 
	IL_5402:  nop 
	IL_5403:  ldloc 134

	IL_5407:  nop 
	IL_5408:  nop 
	IL_5409:  ldloc 2

	IL_540d:  nop 
	IL_540e:  nop 
	IL_540f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5414:  ldloc 134

	IL_5418:  nop 
	IL_5419:  nop 
	IL_541a:  ldloc 134

	IL_541e:  nop 
	IL_541f:  nop 
	IL_5420:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5425:  call unsigned int8 class [mscorlib]System.Convert::ToByte(string)
	IL_542a:  stfld unsigned int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::NumVal
	IL_542f:  ldloc 134

	IL_5433:  nop 
	IL_5434:  nop 
	IL_5435:  starg 1

	IL_5439:  nop 
	IL_543a:  nop 
	IL_543b:  br IL_57d3

	IL_5440:  br IL_544a

	IL_5445:  br IL_544a

	IL_544a:  ldarg 1

	IL_544e:  nop 
	IL_544f:  nop 
	IL_5450:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5455:  ldstr "^(\\d)+(.)*$"
	IL_545a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_545f:  stloc 1

	IL_5463:  nop 
	IL_5464:  nop 
	IL_5465:  ldloc 1

	IL_5469:  nop 
	IL_546a:  nop 
	IL_546b:  stloc 4

	IL_546f:  nop 
	IL_5470:  nop 
	IL_5471:  ldarg 1

	IL_5475:  nop 
	IL_5476:  nop 
	IL_5477:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_547c:  ldstr "^\\+(\\d)+(.)*$"
	IL_5481:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5486:  stloc 1

	IL_548a:  nop 
	IL_548b:  nop 
	IL_548c:  ldloc 4

	IL_5490:  nop 
	IL_5491:  nop 
	IL_5492:  ldloc 1

	IL_5496:  nop 
	IL_5497:  nop 
	IL_5498:  or 
	IL_5499:  stloc 4

	IL_549d:  nop 
	IL_549e:  nop 
	IL_549f:  ldarg 1

	IL_54a3:  nop 
	IL_54a4:  nop 
	IL_54a5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_54aa:  ldstr "^-(\\d)+(.)*$"
	IL_54af:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_54b4:  stloc 1

	IL_54b8:  nop 
	IL_54b9:  nop 
	IL_54ba:  ldloc 4

	IL_54be:  nop 
	IL_54bf:  nop 
	IL_54c0:  ldloc 1

	IL_54c4:  nop 
	IL_54c5:  nop 
	IL_54c6:  or 
	IL_54c7:  stloc 4

	IL_54cb:  nop 
	IL_54cc:  nop 
	IL_54cd:  ldarg 1

	IL_54d1:  nop 
	IL_54d2:  nop 
	IL_54d3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_54d8:  stloc 2

	IL_54dc:  nop 
	IL_54dd:  nop 
	IL_54de:  ldloc 2

	IL_54e2:  nop 
	IL_54e3:  nop 
	IL_54e4:  ldstr "b"
	IL_54e9:  callvirt instance bool string::EndsWith(string)
	IL_54ee:  stloc 1

	IL_54f2:  nop 
	IL_54f3:  nop 
	IL_54f4:  ldloc 4

	IL_54f8:  nop 
	IL_54f9:  nop 
	IL_54fa:  ldloc 1

	IL_54fe:  nop 
	IL_54ff:  nop 
	IL_5500:  and 
	IL_5501:  stloc 4

	IL_5505:  nop 
	IL_5506:  nop 
	IL_5507:  ldloc 4

	IL_550b:  nop 
	IL_550c:  nop 
	IL_550d:  ldc.i4 1
	IL_5512:  beq IL_551c

	IL_5517:  br IL_55d3

	IL_551c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::'.ctor'()
	IL_5521:  stloc 135

	IL_5525:  nop 
	IL_5526:  nop 
	IL_5527:  ldloc 135

	IL_552b:  nop 
	IL_552c:  nop 
	IL_552d:  ldarg 1

	IL_5531:  nop 
	IL_5532:  nop 
	IL_5533:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_5538:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_553d:  ldarg 1

	IL_5541:  nop 
	IL_5542:  nop 
	IL_5543:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5548:  stloc 2

	IL_554c:  nop 
	IL_554d:  nop 
	IL_554e:  ldc.i4 1
	IL_5553:  conv.u 
	IL_5554:  newarr [mscorlib]System.Char
	IL_5559:  stloc 3

	IL_555d:  nop 
	IL_555e:  nop 
	IL_555f:  ldloc 3

	IL_5563:  nop 
	IL_5564:  nop 
	IL_5565:  ldc.i4 0
	IL_556a:  conv.u 
	IL_556b:  ldstr "b"
	IL_5570:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_5575:  stelem [mscorlib]System.Char
	IL_557a:  ldloc 2

	IL_557e:  nop 
	IL_557f:  nop 
	IL_5580:  ldloc 3

	IL_5584:  nop 
	IL_5585:  nop 
	IL_5586:  callvirt instance string string::TrimEnd(char[])
	IL_558b:  stloc 2

	IL_558f:  nop 
	IL_5590:  nop 
	IL_5591:  ldloc 135

	IL_5595:  nop 
	IL_5596:  nop 
	IL_5597:  ldloc 2

	IL_559b:  nop 
	IL_559c:  nop 
	IL_559d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_55a2:  ldloc 135

	IL_55a6:  nop 
	IL_55a7:  nop 
	IL_55a8:  ldloc 135

	IL_55ac:  nop 
	IL_55ad:  nop 
	IL_55ae:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_55b3:  call int8 class [mscorlib]System.Convert::ToSByte(string)
	IL_55b8:  stfld int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_55bd:  ldloc 135

	IL_55c1:  nop 
	IL_55c2:  nop 
	IL_55c3:  starg 1

	IL_55c7:  nop 
	IL_55c8:  nop 
	IL_55c9:  br IL_57d3

	IL_55ce:  br IL_55d8

	IL_55d3:  br IL_55d8

	IL_55d8:  ldarg 1

	IL_55dc:  nop 
	IL_55dd:  nop 
	IL_55de:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_55e3:  ldstr "^(\\d)+(.)*$"
	IL_55e8:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_55ed:  stloc 1

	IL_55f1:  nop 
	IL_55f2:  nop 
	IL_55f3:  ldloc 1

	IL_55f7:  nop 
	IL_55f8:  nop 
	IL_55f9:  stloc 4

	IL_55fd:  nop 
	IL_55fe:  nop 
	IL_55ff:  ldarg 1

	IL_5603:  nop 
	IL_5604:  nop 
	IL_5605:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_560a:  ldstr "^\\+(\\d)+(.)*$"
	IL_560f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5614:  stloc 1

	IL_5618:  nop 
	IL_5619:  nop 
	IL_561a:  ldloc 4

	IL_561e:  nop 
	IL_561f:  nop 
	IL_5620:  ldloc 1

	IL_5624:  nop 
	IL_5625:  nop 
	IL_5626:  or 
	IL_5627:  stloc 4

	IL_562b:  nop 
	IL_562c:  nop 
	IL_562d:  ldarg 1

	IL_5631:  nop 
	IL_5632:  nop 
	IL_5633:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5638:  ldstr "^-(\\d)+(.)*$"
	IL_563d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5642:  stloc 1

	IL_5646:  nop 
	IL_5647:  nop 
	IL_5648:  ldloc 4

	IL_564c:  nop 
	IL_564d:  nop 
	IL_564e:  ldloc 1

	IL_5652:  nop 
	IL_5653:  nop 
	IL_5654:  or 
	IL_5655:  stloc 4

	IL_5659:  nop 
	IL_565a:  nop 
	IL_565b:  ldloc 4

	IL_565f:  nop 
	IL_5660:  nop 
	IL_5661:  ldc.i4 1
	IL_5666:  beq IL_5670

	IL_566b:  br IL_56e4

	IL_5670:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_5675:  stloc 136

	IL_5679:  nop 
	IL_567a:  nop 
	IL_567b:  ldloc 136

	IL_567f:  nop 
	IL_5680:  nop 
	IL_5681:  ldarg 1

	IL_5685:  nop 
	IL_5686:  nop 
	IL_5687:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_568c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_5691:  ldarg 1

	IL_5695:  nop 
	IL_5696:  nop 
	IL_5697:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_569c:  stloc 2

	IL_56a0:  nop 
	IL_56a1:  nop 
	IL_56a2:  ldloc 136

	IL_56a6:  nop 
	IL_56a7:  nop 
	IL_56a8:  ldloc 2

	IL_56ac:  nop 
	IL_56ad:  nop 
	IL_56ae:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_56b3:  ldloc 136

	IL_56b7:  nop 
	IL_56b8:  nop 
	IL_56b9:  ldloc 136

	IL_56bd:  nop 
	IL_56be:  nop 
	IL_56bf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_56c4:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_56c9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_56ce:  ldloc 136

	IL_56d2:  nop 
	IL_56d3:  nop 
	IL_56d4:  starg 1

	IL_56d8:  nop 
	IL_56d9:  nop 
	IL_56da:  br IL_57d3

	IL_56df:  br IL_56e9

	IL_56e4:  br IL_56e9

	IL_56e9:  ldarg 1

	IL_56ed:  nop 
	IL_56ee:  nop 
	IL_56ef:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_56f4:  ldstr "^([a-zA-Z])+(.)*$"
	IL_56f9:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_56fe:  stloc 1

	IL_5702:  nop 
	IL_5703:  nop 
	IL_5704:  ldloc 1

	IL_5708:  nop 
	IL_5709:  nop 
	IL_570a:  stloc 4

	IL_570e:  nop 
	IL_570f:  nop 
	IL_5710:  ldarg 1

	IL_5714:  nop 
	IL_5715:  nop 
	IL_5716:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_571b:  ldstr "^_(.)*([a-zA-Z])+(.)*$"
	IL_5720:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5725:  stloc 1

	IL_5729:  nop 
	IL_572a:  nop 
	IL_572b:  ldloc 4

	IL_572f:  nop 
	IL_5730:  nop 
	IL_5731:  ldloc 1

	IL_5735:  nop 
	IL_5736:  nop 
	IL_5737:  or 
	IL_5738:  stloc 4

	IL_573c:  nop 
	IL_573d:  nop 
	IL_573e:  ldarg 1

	IL_5742:  nop 
	IL_5743:  nop 
	IL_5744:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5749:  ldstr "^::(.)*([a-zA-Z])+(.)*$"
	IL_574e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5753:  stloc 1

	IL_5757:  nop 
	IL_5758:  nop 
	IL_5759:  ldloc 4

	IL_575d:  nop 
	IL_575e:  nop 
	IL_575f:  ldloc 1

	IL_5763:  nop 
	IL_5764:  nop 
	IL_5765:  or 
	IL_5766:  stloc 4

	IL_576a:  nop 
	IL_576b:  nop 
	IL_576c:  ldloc 4

	IL_5770:  nop 
	IL_5771:  nop 
	IL_5772:  ldc.i4 1
	IL_5777:  beq IL_5781

	IL_577c:  br IL_57ce

	IL_5781:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_5786:  stloc 137

	IL_578a:  nop 
	IL_578b:  nop 
	IL_578c:  ldloc 137

	IL_5790:  nop 
	IL_5791:  nop 
	IL_5792:  ldarg 1

	IL_5796:  nop 
	IL_5797:  nop 
	IL_5798:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_579d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_57a2:  ldloc 137

	IL_57a6:  nop 
	IL_57a7:  nop 
	IL_57a8:  ldarg 1

	IL_57ac:  nop 
	IL_57ad:  nop 
	IL_57ae:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_57b3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_57b8:  ldloc 137

	IL_57bc:  nop 
	IL_57bd:  nop 
	IL_57be:  starg 1

	IL_57c2:  nop 
	IL_57c3:  nop 
	IL_57c4:  br IL_57d3

	IL_57c9:  br IL_57d3

	IL_57ce:  br IL_57d3

	IL_57d3:  ldarg 1

	IL_57d7:  nop 
	IL_57d8:  nop 
	IL_57d9:  ret 
    } // end of method TokenOptimizer::Optimize

    // method line 11
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7bc8
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method TokenOptimizer::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.TokenOptimizer
}

.namespace dylan.NET.Tokenizer.Parser
{
  .class public auto ansi ExprOptimizer
  	extends [mscorlib]System.Object
  {

    // method line 12
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr checkVarAs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0x7bdc
	// Code size 444 (0x1bc)
	.maxstack 12
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_3,
		class [mscorlib]System.Type	V_4,
		bool	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_7)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_01b0

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0083:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0099:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarName
	IL_00bf:  ldarg 1

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00ca:  ldc.i4 3
	IL_00cf:  conv.u 
	IL_00d0:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00d5:  stloc 3

	IL_00d9:  nop 
	IL_00da:  nop 
	IL_00db:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_00e0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00e5:  stloc 4

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldloc 4

	IL_00ef:  nop 
	IL_00f0:  nop 
	IL_00f1:  ldloc 3

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00fc:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0101:  stloc 5

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldloc 5

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldc.i4 1
	IL_0112:  beq IL_0185

	IL_0117:  br IL_011c

	IL_011c:  ldarg 1

	IL_0120:  nop 
	IL_0121:  nop 
	IL_0122:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0127:  ldc.i4 3
	IL_012c:  conv.u 
	IL_012d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0132:  stloc 6

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_013d:  stloc 7

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  ldloc 7

	IL_0147:  nop 
	IL_0148:  nop 
	IL_0149:  ldloc 6

	IL_014d:  nop 
	IL_014e:  nop 
	IL_014f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0154:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0159:  ldloc 7

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  ldloc 6

	IL_0163:  nop 
	IL_0164:  nop 
	IL_0165:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_016a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_016f:  ldloc 2

	IL_0173:  nop 
	IL_0174:  nop 
	IL_0175:  ldloc 7

	IL_0179:  nop 
	IL_017a:  nop 
	IL_017b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarTyp
	IL_0180:  br IL_01ab

	IL_0185:  ldloc 2

	IL_0189:  nop 
	IL_018a:  nop 
	IL_018b:  ldarg 1

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0196:  ldc.i4 3
	IL_019b:  conv.u 
	IL_019c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01a1:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarTyp
	IL_01a6:  br IL_01ab

	IL_01ab:  br IL_01b5

	IL_01b0:  br IL_01b5

	IL_01b5:  ldloc 2

	IL_01b9:  nop 
	IL_01ba:  nop 
	IL_01bb:  ret 
    } // end of method ExprOptimizer::checkVarAs

    // method line 13
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok IdentToMNTok (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident idt, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok mnt)  cil managed 
    {
        // Method begins at RVA 0x7da4
	// Code size 293 (0x125)
	.maxstack 2
	IL_0000:  ldarg 2

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::DoNeg
	IL_0011:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::DoNeg
	IL_0016:  ldarg 2

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldarg 1

	IL_0020:  nop 
	IL_0021:  nop 
	IL_0022:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::DoNot
	IL_0027:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::DoNot
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldarg 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_003d:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_0042:  ldarg 2

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldarg 1

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_0053:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldarg 1

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0069:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_006e:  ldarg 2

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldarg 1

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsRef
	IL_007f:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsRef
	IL_0084:  ldarg 2

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  ldarg 1

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRef
	IL_0095:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRef
	IL_009a:  ldarg 2

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  ldarg 1

	IL_00a4:  nop 
	IL_00a5:  nop 
	IL_00a6:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsRefInst
	IL_00ab:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsRefInst
	IL_00b0:  ldarg 2

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  ldarg 1

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRefInst
	IL_00c1:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsValInRefInst
	IL_00c6:  ldarg 2

	IL_00ca:  nop 
	IL_00cb:  nop 
	IL_00cc:  ldarg 1

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_00d7:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_00dc:  ldarg 2

	IL_00e0:  nop 
	IL_00e1:  nop 
	IL_00e2:  ldarg 1

	IL_00e6:  nop 
	IL_00e7:  nop 
	IL_00e8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::OrdOp
	IL_00ed:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::OrdOp
	IL_00f2:  ldarg 2

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldarg 1

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0103:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0108:  ldarg 2

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldarg 1

	IL_0112:  nop 
	IL_0113:  nop 
	IL_0114:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0119:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_011e:  ldarg 2

	IL_0122:  nop 
	IL_0123:  nop 
	IL_0124:  ret 
    } // end of method ExprOptimizer::IdentToMNTok

    // method line 14
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procMethodCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x7ed8
	// Code size 1325 (0x52d)
	.maxstack 39
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_3,
		int32	V_4,
		bool	V_5,
		int32	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_7,
		class [mscorlib]System.Type	V_8,
		bool	V_9,
		int32	V_10)
	IL_0000:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::'.ctor'()
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldnull 
	IL_0017:  stloc 2

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0022:  stloc 3

	IL_0026:  nop 
	IL_0027:  nop 
	IL_0028:  ldc.i4 1
	IL_002d:  stloc 4

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldc.i4 1
	IL_0038:  stloc 5

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldc.i4 0
	IL_0043:  stloc 6

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldarg 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldc.i4 1
	IL_0054:  sub 
	IL_0055:  starg 2

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  ldarg 1

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0066:  ldarg 2

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  conv.u 
	IL_006d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0072:  stloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg.0 
	IL_0079:  ldloc 2

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldloc 0

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok class dylan.NET.Tokenizer.Parser.ExprOptimizer::IdentToMNTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok)
	IL_008a:  stloc 0

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldarg 2

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  stloc 6

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  ldarg 2

	IL_00a0:  nop 
	IL_00a1:  nop 
	IL_00a2:  ldc.i4 1
	IL_00a7:  add 
	IL_00a8:  starg 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  ldarg 1

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00b9:  ldarg 2

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  conv.u 
	IL_00c0:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00c5:  stloc 7

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  ldarg 1

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00d6:  ldlen 
	IL_00d7:  conv.i4 
	IL_00d8:  ldc.i4 1
	IL_00dd:  sub 
	IL_00de:  stloc 10

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  ldarg 1

	IL_00e8:  nop 
	IL_00e9:  nop 
	IL_00ea:  ldarg 2

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_00f5:  ldarg 1

	IL_00f9:  nop 
	IL_00fa:  nop 
	IL_00fb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0100:  ldlen 
	IL_0101:  conv.i4 
	IL_0102:  ldc.i4 1
	IL_0107:  sub 
	IL_0108:  stloc 10

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldarg 2

	IL_0112:  nop 
	IL_0113:  nop 
	IL_0114:  ldc.i4 1
	IL_0119:  sub 
	IL_011a:  starg 2

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  ldarg 2

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  ldc.i4 1
	IL_012b:  add 
	IL_012c:  starg 2

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldarg 1

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_013d:  ldarg 2

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  conv.u 
	IL_0144:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0149:  stloc 7

	IL_014d:  nop 
	IL_014e:  nop 
	IL_014f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_0154:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0159:  stloc 8

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  ldloc 8

	IL_0163:  nop 
	IL_0164:  nop 
	IL_0165:  ldloc 7

	IL_0169:  nop 
	IL_016a:  nop 
	IL_016b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0170:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0175:  stloc 9

	IL_0179:  nop 
	IL_017a:  nop 
	IL_017b:  ldloc 9

	IL_017f:  nop 
	IL_0180:  nop 
	IL_0181:  ldc.i4 1
	IL_0186:  beq IL_0190

	IL_018b:  br IL_025e

	IL_0190:  ldloc 4

	IL_0194:  nop 
	IL_0195:  nop 
	IL_0196:  ldc.i4 1
	IL_019b:  sub 
	IL_019c:  stloc 4

	IL_01a0:  nop 
	IL_01a1:  nop 
	IL_01a2:  ldloc 4

	IL_01a6:  nop 
	IL_01a7:  nop 
	IL_01a8:  ldc.i4 0
	IL_01ad:  beq IL_01b7

	IL_01b2:  br IL_023f

	IL_01b7:  ldc.i4 0
	IL_01bc:  stloc 5

	IL_01c0:  nop 
	IL_01c1:  nop 
	IL_01c2:  ldloc 3

	IL_01c6:  nop 
	IL_01c7:  nop 
	IL_01c8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01cd:  ldlen 
	IL_01ce:  conv.i4 
	IL_01cf:  ldc.i4 0
	IL_01d4:  bgt IL_01de

	IL_01d9:  br IL_01f4

	IL_01de:  ldloc 1

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldloc 3

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01ef:  br IL_01f9

	IL_01f4:  br IL_01f9

	IL_01f9:  ldarg 1

	IL_01fd:  nop 
	IL_01fe:  nop 
	IL_01ff:  ldarg 2

	IL_0203:  nop 
	IL_0204:  nop 
	IL_0205:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_020a:  ldarg 1

	IL_020e:  nop 
	IL_020f:  nop 
	IL_0210:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0215:  ldlen 
	IL_0216:  conv.i4 
	IL_0217:  ldc.i4 1
	IL_021c:  sub 
	IL_021d:  stloc 10

	IL_0221:  nop 
	IL_0222:  nop 
	IL_0223:  ldarg 2

	IL_0227:  nop 
	IL_0228:  nop 
	IL_0229:  ldc.i4 1
	IL_022e:  sub 
	IL_022f:  starg 2

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  br IL_04e2

	IL_023a:  br IL_0254

	IL_023f:  ldc.i4 1
	IL_0244:  stloc 5

	IL_0248:  nop 
	IL_0249:  nop 
	IL_024a:  br IL_043b

	IL_024f:  br IL_0254

	IL_0254:  br IL_043b

	IL_0259:  br IL_0263

	IL_025e:  br IL_0263

	IL_0263:  ldarg 1

	IL_0267:  nop 
	IL_0268:  nop 
	IL_0269:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_026e:  ldarg 2

	IL_0272:  nop 
	IL_0273:  nop 
	IL_0274:  conv.u 
	IL_0275:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_027a:  stloc 7

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_0285:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_028a:  stloc 8

	IL_028e:  nop 
	IL_028f:  nop 
	IL_0290:  ldloc 8

	IL_0294:  nop 
	IL_0295:  nop 
	IL_0296:  ldloc 7

	IL_029a:  nop 
	IL_029b:  nop 
	IL_029c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02a1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_02a6:  stloc 9

	IL_02aa:  nop 
	IL_02ab:  nop 
	IL_02ac:  ldloc 9

	IL_02b0:  nop 
	IL_02b1:  nop 
	IL_02b2:  ldc.i4 1
	IL_02b7:  beq IL_02c1

	IL_02bc:  br IL_0301

	IL_02c1:  ldloc 4

	IL_02c5:  nop 
	IL_02c6:  nop 
	IL_02c7:  ldc.i4 1
	IL_02cc:  add 
	IL_02cd:  stloc 4

	IL_02d1:  nop 
	IL_02d2:  nop 
	IL_02d3:  ldc.i4 1
	IL_02d8:  stloc 5

	IL_02dc:  nop 
	IL_02dd:  nop 
	IL_02de:  ldarg 1

	IL_02e2:  nop 
	IL_02e3:  nop 
	IL_02e4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_02e9:  ldlen 
	IL_02ea:  conv.i4 
	IL_02eb:  ldc.i4 1
	IL_02f0:  sub 
	IL_02f1:  stloc 10

	IL_02f5:  nop 
	IL_02f6:  nop 
	IL_02f7:  br IL_043b

	IL_02fc:  br IL_0306

	IL_0301:  br IL_0306

	IL_0306:  ldarg 1

	IL_030a:  nop 
	IL_030b:  nop 
	IL_030c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0311:  ldarg 2

	IL_0315:  nop 
	IL_0316:  nop 
	IL_0317:  conv.u 
	IL_0318:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_031d:  stloc 7

	IL_0321:  nop 
	IL_0322:  nop 
	IL_0323:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_0328:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_032d:  stloc 8

	IL_0331:  nop 
	IL_0332:  nop 
	IL_0333:  ldloc 8

	IL_0337:  nop 
	IL_0338:  nop 
	IL_0339:  ldloc 7

	IL_033d:  nop 
	IL_033e:  nop 
	IL_033f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0344:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0349:  stloc 9

	IL_034d:  nop 
	IL_034e:  nop 
	IL_034f:  ldloc 9

	IL_0353:  nop 
	IL_0354:  nop 
	IL_0355:  ldc.i4 1
	IL_035a:  beq IL_0364

	IL_035f:  br IL_0426

	IL_0364:  ldloc 4

	IL_0368:  nop 
	IL_0369:  nop 
	IL_036a:  ldc.i4 1
	IL_036f:  beq IL_0379

	IL_0374:  br IL_040c

	IL_0379:  ldc.i4 0
	IL_037e:  stloc 5

	IL_0382:  nop 
	IL_0383:  nop 
	IL_0384:  ldloc 3

	IL_0388:  nop 
	IL_0389:  nop 
	IL_038a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_038f:  ldlen 
	IL_0390:  conv.i4 
	IL_0391:  ldc.i4 0
	IL_0396:  bgt IL_03a0

	IL_039b:  br IL_03b6

	IL_03a0:  ldloc 1

	IL_03a4:  nop 
	IL_03a5:  nop 
	IL_03a6:  ldloc 3

	IL_03aa:  nop 
	IL_03ab:  nop 
	IL_03ac:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_03b1:  br IL_03bb

	IL_03b6:  br IL_03bb

	IL_03bb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_03c0:  stloc 3

	IL_03c4:  nop 
	IL_03c5:  nop 
	IL_03c6:  ldarg 1

	IL_03ca:  nop 
	IL_03cb:  nop 
	IL_03cc:  ldarg 2

	IL_03d0:  nop 
	IL_03d1:  nop 
	IL_03d2:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_03d7:  ldarg 1

	IL_03db:  nop 
	IL_03dc:  nop 
	IL_03dd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03e2:  ldlen 
	IL_03e3:  conv.i4 
	IL_03e4:  ldc.i4 1
	IL_03e9:  sub 
	IL_03ea:  stloc 10

	IL_03ee:  nop 
	IL_03ef:  nop 
	IL_03f0:  ldarg 2

	IL_03f4:  nop 
	IL_03f5:  nop 
	IL_03f6:  ldc.i4 1
	IL_03fb:  sub 
	IL_03fc:  starg 2

	IL_0400:  nop 
	IL_0401:  nop 
	IL_0402:  br IL_043b

	IL_0407:  br IL_0421

	IL_040c:  ldc.i4 1
	IL_0411:  stloc 5

	IL_0415:  nop 
	IL_0416:  nop 
	IL_0417:  br IL_043b

	IL_041c:  br IL_0421

	IL_0421:  br IL_043b

	IL_0426:  ldc.i4 1
	IL_042b:  stloc 5

	IL_042f:  nop 
	IL_0430:  nop 
	IL_0431:  br IL_043b

	IL_0436:  br IL_043b

	IL_043b:  ldloc 5

	IL_043f:  nop 
	IL_0440:  nop 
	IL_0441:  ldc.i4 1
	IL_0446:  beq IL_0450

	IL_044b:  br IL_04b3

	IL_0450:  ldloc 3

	IL_0454:  nop 
	IL_0455:  nop 
	IL_0456:  ldarg 1

	IL_045a:  nop 
	IL_045b:  nop 
	IL_045c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0461:  ldarg 2

	IL_0465:  nop 
	IL_0466:  nop 
	IL_0467:  conv.u 
	IL_0468:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_046d:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0472:  ldarg 1

	IL_0476:  nop 
	IL_0477:  nop 
	IL_0478:  ldarg 2

	IL_047c:  nop 
	IL_047d:  nop 
	IL_047e:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0483:  ldarg 1

	IL_0487:  nop 
	IL_0488:  nop 
	IL_0489:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_048e:  ldlen 
	IL_048f:  conv.i4 
	IL_0490:  ldc.i4 1
	IL_0495:  sub 
	IL_0496:  stloc 10

	IL_049a:  nop 
	IL_049b:  nop 
	IL_049c:  ldarg 2

	IL_04a0:  nop 
	IL_04a1:  nop 
	IL_04a2:  ldc.i4 1
	IL_04a7:  sub 
	IL_04a8:  starg 2

	IL_04ac:  nop 
	IL_04ad:  nop 
	IL_04ae:  br IL_04b8

	IL_04b3:  br IL_04b8

	IL_04b8:  ldarg 2

	IL_04bc:  nop 
	IL_04bd:  nop 
	IL_04be:  ldloc 10

	IL_04c2:  nop 
	IL_04c3:  nop 
	IL_04c4:  beq IL_04ce

	IL_04c9:  br IL_04d8

	IL_04ce:  br IL_04e2

	IL_04d3:  br IL_04e2

	IL_04d8:  br IL_0120

	IL_04dd:  br IL_04e2

	IL_04e2:  ldloc 1

	IL_04e6:  nop 
	IL_04e7:  nop 
	IL_04e8:  ldloc 0

	IL_04ec:  nop 
	IL_04ed:  nop 
	IL_04ee:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_04f3:  ldloc 1

	IL_04f7:  nop 
	IL_04f8:  nop 
	IL_04f9:  ldloc 0

	IL_04fd:  nop 
	IL_04fe:  nop 
	IL_04ff:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0504:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0509:  ldarg 1

	IL_050d:  nop 
	IL_050e:  nop 
	IL_050f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0514:  ldloc 6

	IL_0518:  nop 
	IL_0519:  nop 
	IL_051a:  conv.u 
	IL_051b:  ldloc 1

	IL_051f:  nop 
	IL_0520:  nop 
	IL_0521:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0526:  ldarg 1

	IL_052a:  nop 
	IL_052b:  nop 
	IL_052c:  ret 
    } // end of method ExprOptimizer::procMethodCall

    // method line 15
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procNewCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x8414
	// Code size 1638 (0x666)
	.maxstack 59
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_3,
		int32	V_4,
		bool	V_5,
		int32	V_6,
		class [mscorlib]System.Type	V_7,
		class [mscorlib]System.Type	V_8,
		bool	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_10,
		class [mscorlib]System.Type	V_11,
		bool	V_12,
		int32	V_13)
	IL_0000:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::'.ctor'()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::'.ctor'()
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_001b:  stloc 3

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldc.i4 1
	IL_0026:  stloc 4

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldc.i4 1
	IL_0031:  stloc 5

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldc.i4 0
	IL_003c:  stloc 6

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 0
	IL_0047:  stloc 9

	IL_004b:  nop 
	IL_004c:  nop 
	IL_004d:  ldarg 1

	IL_0051:  nop 
	IL_0052:  nop 
	IL_0053:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  conv.u 
	IL_005f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0064:  stloc 2

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldarg 2

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  stloc 6

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldarg 2

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldc.i4 1
	IL_0081:  add 
	IL_0082:  starg 2

	IL_0086:  nop 
	IL_0087:  nop 
	IL_0088:  ldarg 1

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0093:  ldarg 2

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  conv.u 
	IL_009a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_009f:  stloc 10

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldarg 1

	IL_00a9:  nop 
	IL_00aa:  nop 
	IL_00ab:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00b0:  ldlen 
	IL_00b1:  conv.i4 
	IL_00b2:  ldc.i4 1
	IL_00b7:  sub 
	IL_00b8:  stloc 13

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_00c3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00c8:  stloc 11

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  ldloc 11

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  ldloc 10

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00df:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00e4:  stloc 12

	IL_00e8:  nop 
	IL_00e9:  nop 
	IL_00ea:  ldloc 12

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  ldc.i4 1
	IL_00f5:  beq IL_00ff

	IL_00fa:  br IL_0124

	IL_00ff:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_0104:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0109:  stloc 7

	IL_010d:  nop 
	IL_010e:  nop 
	IL_010f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_0114:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0119:  stloc 8

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  br IL_0154

	IL_0124:  ldc.i4 1
	IL_0129:  stloc 9

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
	IL_0134:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0139:  stloc 7

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RSParen
	IL_0144:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0149:  stloc 8

	IL_014d:  nop 
	IL_014e:  nop 
	IL_014f:  br IL_0154

	IL_0154:  ldloc 9

	IL_0158:  nop 
	IL_0159:  nop 
	IL_015a:  ldc.i4 0
	IL_015f:  beq IL_0169

	IL_0164:  br IL_017f

	IL_0169:  ldloc 0

	IL_016d:  nop 
	IL_016e:  nop 
	IL_016f:  ldloc 2

	IL_0173:  nop 
	IL_0174:  nop 
	IL_0175:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Name
	IL_017a:  br IL_0195

	IL_017f:  ldloc 1

	IL_0183:  nop 
	IL_0184:  nop 
	IL_0185:  ldloc 2

	IL_0189:  nop 
	IL_018a:  nop 
	IL_018b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_0190:  br IL_0195

	IL_0195:  ldarg 1

	IL_0199:  nop 
	IL_019a:  nop 
	IL_019b:  ldarg 2

	IL_019f:  nop 
	IL_01a0:  nop 
	IL_01a1:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_01a6:  ldarg 1

	IL_01aa:  nop 
	IL_01ab:  nop 
	IL_01ac:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01b1:  ldlen 
	IL_01b2:  conv.i4 
	IL_01b3:  ldc.i4 1
	IL_01b8:  sub 
	IL_01b9:  stloc 13

	IL_01bd:  nop 
	IL_01be:  nop 
	IL_01bf:  ldarg 2

	IL_01c3:  nop 
	IL_01c4:  nop 
	IL_01c5:  ldc.i4 1
	IL_01ca:  sub 
	IL_01cb:  starg 2

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  ldarg 2

	IL_01d5:  nop 
	IL_01d6:  nop 
	IL_01d7:  ldc.i4 1
	IL_01dc:  add 
	IL_01dd:  starg 2

	IL_01e1:  nop 
	IL_01e2:  nop 
	IL_01e3:  ldarg 1

	IL_01e7:  nop 
	IL_01e8:  nop 
	IL_01e9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01ee:  ldarg 2

	IL_01f2:  nop 
	IL_01f3:  nop 
	IL_01f4:  conv.u 
	IL_01f5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01fa:  stloc 10

	IL_01fe:  nop 
	IL_01ff:  nop 
	IL_0200:  ldloc 8

	IL_0204:  nop 
	IL_0205:  nop 
	IL_0206:  stloc 11

	IL_020a:  nop 
	IL_020b:  nop 
	IL_020c:  ldloc 11

	IL_0210:  nop 
	IL_0211:  nop 
	IL_0212:  ldloc 10

	IL_0216:  nop 
	IL_0217:  nop 
	IL_0218:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_021d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0222:  stloc 12

	IL_0226:  nop 
	IL_0227:  nop 
	IL_0228:  ldloc 12

	IL_022c:  nop 
	IL_022d:  nop 
	IL_022e:  ldc.i4 1
	IL_0233:  beq IL_023d

	IL_0238:  br IL_033b

	IL_023d:  ldloc 4

	IL_0241:  nop 
	IL_0242:  nop 
	IL_0243:  ldc.i4 1
	IL_0248:  sub 
	IL_0249:  stloc 4

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  ldloc 4

	IL_0253:  nop 
	IL_0254:  nop 
	IL_0255:  ldc.i4 0
	IL_025a:  beq IL_0264

	IL_025f:  br IL_031c

	IL_0264:  ldc.i4 0
	IL_0269:  stloc 5

	IL_026d:  nop 
	IL_026e:  nop 
	IL_026f:  ldloc 3

	IL_0273:  nop 
	IL_0274:  nop 
	IL_0275:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_027a:  ldlen 
	IL_027b:  conv.i4 
	IL_027c:  ldc.i4 0
	IL_0281:  bgt IL_028b

	IL_0286:  br IL_02d1

	IL_028b:  ldloc 9

	IL_028f:  nop 
	IL_0290:  nop 
	IL_0291:  ldc.i4 0
	IL_0296:  beq IL_02a0

	IL_029b:  br IL_02b6

	IL_02a0:  ldloc 0

	IL_02a4:  nop 
	IL_02a5:  nop 
	IL_02a6:  ldloc 3

	IL_02aa:  nop 
	IL_02ab:  nop 
	IL_02ac:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_02b1:  br IL_02cc

	IL_02b6:  ldloc 1

	IL_02ba:  nop 
	IL_02bb:  nop 
	IL_02bc:  ldloc 3

	IL_02c0:  nop 
	IL_02c1:  nop 
	IL_02c2:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_02c7:  br IL_02cc

	IL_02cc:  br IL_02d6

	IL_02d1:  br IL_02d6

	IL_02d6:  ldarg 1

	IL_02da:  nop 
	IL_02db:  nop 
	IL_02dc:  ldarg 2

	IL_02e0:  nop 
	IL_02e1:  nop 
	IL_02e2:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_02e7:  ldarg 1

	IL_02eb:  nop 
	IL_02ec:  nop 
	IL_02ed:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_02f2:  ldlen 
	IL_02f3:  conv.i4 
	IL_02f4:  ldc.i4 1
	IL_02f9:  sub 
	IL_02fa:  stloc 13

	IL_02fe:  nop 
	IL_02ff:  nop 
	IL_0300:  ldarg 2

	IL_0304:  nop 
	IL_0305:  nop 
	IL_0306:  ldc.i4 1
	IL_030b:  sub 
	IL_030c:  starg 2

	IL_0310:  nop 
	IL_0311:  nop 
	IL_0312:  br IL_05da

	IL_0317:  br IL_0331

	IL_031c:  ldc.i4 1
	IL_0321:  stloc 5

	IL_0325:  nop 
	IL_0326:  nop 
	IL_0327:  br IL_0533

	IL_032c:  br IL_0331

	IL_0331:  br IL_0533

	IL_0336:  br IL_0340

	IL_033b:  br IL_0340

	IL_0340:  ldarg 1

	IL_0344:  nop 
	IL_0345:  nop 
	IL_0346:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_034b:  ldarg 2

	IL_034f:  nop 
	IL_0350:  nop 
	IL_0351:  conv.u 
	IL_0352:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0357:  stloc 10

	IL_035b:  nop 
	IL_035c:  nop 
	IL_035d:  ldloc 7

	IL_0361:  nop 
	IL_0362:  nop 
	IL_0363:  stloc 11

	IL_0367:  nop 
	IL_0368:  nop 
	IL_0369:  ldloc 11

	IL_036d:  nop 
	IL_036e:  nop 
	IL_036f:  ldloc 10

	IL_0373:  nop 
	IL_0374:  nop 
	IL_0375:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_037a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_037f:  stloc 12

	IL_0383:  nop 
	IL_0384:  nop 
	IL_0385:  ldloc 12

	IL_0389:  nop 
	IL_038a:  nop 
	IL_038b:  ldc.i4 1
	IL_0390:  beq IL_039a

	IL_0395:  br IL_03da

	IL_039a:  ldloc 4

	IL_039e:  nop 
	IL_039f:  nop 
	IL_03a0:  ldc.i4 1
	IL_03a5:  add 
	IL_03a6:  stloc 4

	IL_03aa:  nop 
	IL_03ab:  nop 
	IL_03ac:  ldc.i4 1
	IL_03b1:  stloc 5

	IL_03b5:  nop 
	IL_03b6:  nop 
	IL_03b7:  ldarg 1

	IL_03bb:  nop 
	IL_03bc:  nop 
	IL_03bd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03c2:  ldlen 
	IL_03c3:  conv.i4 
	IL_03c4:  ldc.i4 1
	IL_03c9:  sub 
	IL_03ca:  stloc 13

	IL_03ce:  nop 
	IL_03cf:  nop 
	IL_03d0:  br IL_0533

	IL_03d5:  br IL_03df

	IL_03da:  br IL_03df

	IL_03df:  ldarg 1

	IL_03e3:  nop 
	IL_03e4:  nop 
	IL_03e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03ea:  ldarg 2

	IL_03ee:  nop 
	IL_03ef:  nop 
	IL_03f0:  conv.u 
	IL_03f1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03f6:  stloc 10

	IL_03fa:  nop 
	IL_03fb:  nop 
	IL_03fc:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_0401:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0406:  stloc 11

	IL_040a:  nop 
	IL_040b:  nop 
	IL_040c:  ldloc 11

	IL_0410:  nop 
	IL_0411:  nop 
	IL_0412:  ldloc 10

	IL_0416:  nop 
	IL_0417:  nop 
	IL_0418:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_041d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0422:  stloc 12

	IL_0426:  nop 
	IL_0427:  nop 
	IL_0428:  ldloc 12

	IL_042c:  nop 
	IL_042d:  nop 
	IL_042e:  ldc.i4 1
	IL_0433:  beq IL_043d

	IL_0438:  br IL_051e

	IL_043d:  ldloc 4

	IL_0441:  nop 
	IL_0442:  nop 
	IL_0443:  ldc.i4 1
	IL_0448:  beq IL_0452

	IL_044d:  br IL_0504

	IL_0452:  ldc.i4 0
	IL_0457:  stloc 5

	IL_045b:  nop 
	IL_045c:  nop 
	IL_045d:  ldloc 3

	IL_0461:  nop 
	IL_0462:  nop 
	IL_0463:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0468:  ldlen 
	IL_0469:  conv.i4 
	IL_046a:  ldc.i4 0
	IL_046f:  bgt IL_0479

	IL_0474:  br IL_04ae

	IL_0479:  ldloc 9

	IL_047d:  nop 
	IL_047e:  nop 
	IL_047f:  ldc.i4 0
	IL_0484:  beq IL_048e

	IL_0489:  br IL_04a4

	IL_048e:  ldloc 0

	IL_0492:  nop 
	IL_0493:  nop 
	IL_0494:  ldloc 3

	IL_0498:  nop 
	IL_0499:  nop 
	IL_049a:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_049f:  br IL_04a9

	IL_04a4:  br IL_04a9

	IL_04a9:  br IL_04b3

	IL_04ae:  br IL_04b3

	IL_04b3:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_04b8:  stloc 3

	IL_04bc:  nop 
	IL_04bd:  nop 
	IL_04be:  ldarg 1

	IL_04c2:  nop 
	IL_04c3:  nop 
	IL_04c4:  ldarg 2

	IL_04c8:  nop 
	IL_04c9:  nop 
	IL_04ca:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_04cf:  ldarg 1

	IL_04d3:  nop 
	IL_04d4:  nop 
	IL_04d5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_04da:  ldlen 
	IL_04db:  conv.i4 
	IL_04dc:  ldc.i4 1
	IL_04e1:  sub 
	IL_04e2:  stloc 13

	IL_04e6:  nop 
	IL_04e7:  nop 
	IL_04e8:  ldarg 2

	IL_04ec:  nop 
	IL_04ed:  nop 
	IL_04ee:  ldc.i4 1
	IL_04f3:  sub 
	IL_04f4:  starg 2

	IL_04f8:  nop 
	IL_04f9:  nop 
	IL_04fa:  br IL_0533

	IL_04ff:  br IL_0519

	IL_0504:  ldc.i4 1
	IL_0509:  stloc 5

	IL_050d:  nop 
	IL_050e:  nop 
	IL_050f:  br IL_0533

	IL_0514:  br IL_0519

	IL_0519:  br IL_0533

	IL_051e:  ldc.i4 1
	IL_0523:  stloc 5

	IL_0527:  nop 
	IL_0528:  nop 
	IL_0529:  br IL_0533

	IL_052e:  br IL_0533

	IL_0533:  ldloc 5

	IL_0537:  nop 
	IL_0538:  nop 
	IL_0539:  ldc.i4 1
	IL_053e:  beq IL_0548

	IL_0543:  br IL_05ab

	IL_0548:  ldloc 3

	IL_054c:  nop 
	IL_054d:  nop 
	IL_054e:  ldarg 1

	IL_0552:  nop 
	IL_0553:  nop 
	IL_0554:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0559:  ldarg 2

	IL_055d:  nop 
	IL_055e:  nop 
	IL_055f:  conv.u 
	IL_0560:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0565:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_056a:  ldarg 1

	IL_056e:  nop 
	IL_056f:  nop 
	IL_0570:  ldarg 2

	IL_0574:  nop 
	IL_0575:  nop 
	IL_0576:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_057b:  ldarg 1

	IL_057f:  nop 
	IL_0580:  nop 
	IL_0581:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0586:  ldlen 
	IL_0587:  conv.i4 
	IL_0588:  ldc.i4 1
	IL_058d:  sub 
	IL_058e:  stloc 13

	IL_0592:  nop 
	IL_0593:  nop 
	IL_0594:  ldarg 2

	IL_0598:  nop 
	IL_0599:  nop 
	IL_059a:  ldc.i4 1
	IL_059f:  sub 
	IL_05a0:  starg 2

	IL_05a4:  nop 
	IL_05a5:  nop 
	IL_05a6:  br IL_05b0

	IL_05ab:  br IL_05b0

	IL_05b0:  ldarg 2

	IL_05b4:  nop 
	IL_05b5:  nop 
	IL_05b6:  ldloc 13

	IL_05ba:  nop 
	IL_05bb:  nop 
	IL_05bc:  beq IL_05c6

	IL_05c1:  br IL_05d0

	IL_05c6:  br IL_05da

	IL_05cb:  br IL_05da

	IL_05d0:  br IL_01d1

	IL_05d5:  br IL_05da

	IL_05da:  ldloc 9

	IL_05de:  nop 
	IL_05df:  nop 
	IL_05e0:  ldc.i4 0
	IL_05e5:  beq IL_05ef

	IL_05ea:  br IL_0627

	IL_05ef:  ldloc 0

	IL_05f3:  nop 
	IL_05f4:  nop 
	IL_05f5:  ldloc 2

	IL_05f9:  nop 
	IL_05fa:  nop 
	IL_05fb:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0600:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0605:  ldarg 1

	IL_0609:  nop 
	IL_060a:  nop 
	IL_060b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0610:  ldloc 6

	IL_0614:  nop 
	IL_0615:  nop 
	IL_0616:  conv.u 
	IL_0617:  ldloc 0

	IL_061b:  nop 
	IL_061c:  nop 
	IL_061d:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0622:  br IL_065f

	IL_0627:  ldloc 1

	IL_062b:  nop 
	IL_062c:  nop 
	IL_062d:  ldloc 2

	IL_0631:  nop 
	IL_0632:  nop 
	IL_0633:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0638:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_063d:  ldarg 1

	IL_0641:  nop 
	IL_0642:  nop 
	IL_0643:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0648:  ldloc 6

	IL_064c:  nop 
	IL_064d:  nop 
	IL_064e:  conv.u 
	IL_064f:  ldloc 1

	IL_0653:  nop 
	IL_0654:  nop 
	IL_0655:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_065a:  br IL_065f

	IL_065f:  ldarg 1

	IL_0663:  nop 
	IL_0664:  nop 
	IL_0665:  ret 
    } // end of method ExprOptimizer::procNewCall

    // method line 16
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procIdentArrayAccess (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x8a88
	// Code size 1004 (0x3ec)
	.maxstack 25
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_1,
		int32	V_2,
		bool	V_3,
		int32	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_5,
		class [mscorlib]System.Type	V_6,
		bool	V_7,
		int32	V_8)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_000c:  stloc 1

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldc.i4 1
	IL_0017:  stloc 2

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldc.i4 1
	IL_0022:  stloc 3

	IL_0026:  nop 
	IL_0027:  nop 
	IL_0028:  ldc.i4 0
	IL_002d:  stloc 4

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldarg 2

	IL_0037:  nop 
	IL_0038:  nop 
	IL_0039:  ldc.i4 1
	IL_003e:  sub 
	IL_003f:  starg 2

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldarg 1

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0050:  ldarg 2

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  conv.u 
	IL_0057:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_005c:  stloc 0

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldarg 2

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  stloc 4

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldarg 2

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldc.i4 1
	IL_0079:  add 
	IL_007a:  starg 2

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldarg 1

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_008b:  ldarg 2

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  conv.u 
	IL_0092:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0097:  stloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldarg 1

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00a8:  ldlen 
	IL_00a9:  conv.i4 
	IL_00aa:  ldc.i4 1
	IL_00af:  sub 
	IL_00b0:  stloc 8

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  ldarg 1

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  ldarg 2

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_00c7:  ldarg 1

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00d2:  ldlen 
	IL_00d3:  conv.i4 
	IL_00d4:  ldc.i4 1
	IL_00d9:  sub 
	IL_00da:  stloc 8

	IL_00de:  nop 
	IL_00df:  nop 
	IL_00e0:  ldarg 2

	IL_00e4:  nop 
	IL_00e5:  nop 
	IL_00e6:  ldc.i4 1
	IL_00eb:  sub 
	IL_00ec:  starg 2

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ldarg 2

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldc.i4 1
	IL_00fd:  add 
	IL_00fe:  starg 2

	IL_0102:  nop 
	IL_0103:  nop 
	IL_0104:  ldarg 1

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_010f:  ldarg 2

	IL_0113:  nop 
	IL_0114:  nop 
	IL_0115:  conv.u 
	IL_0116:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_011b:  stloc 5

	IL_011f:  nop 
	IL_0120:  nop 
	IL_0121:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RSParen
	IL_0126:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_012b:  stloc 6

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  ldloc 6

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  ldloc 5

	IL_013b:  nop 
	IL_013c:  nop 
	IL_013d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0142:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0147:  stloc 7

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldloc 7

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  ldc.i4 1
	IL_0158:  beq IL_0162

	IL_015d:  br IL_01f9

	IL_0162:  ldloc 2

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  ldc.i4 1
	IL_016d:  sub 
	IL_016e:  stloc 2

	IL_0172:  nop 
	IL_0173:  nop 
	IL_0174:  ldloc 2

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldc.i4 0
	IL_017f:  beq IL_0189

	IL_0184:  br IL_01da

	IL_0189:  ldc.i4 0
	IL_018e:  stloc 3

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  ldarg 1

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  ldarg 2

	IL_019e:  nop 
	IL_019f:  nop 
	IL_01a0:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_01a5:  ldarg 1

	IL_01a9:  nop 
	IL_01aa:  nop 
	IL_01ab:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01b0:  ldlen 
	IL_01b1:  conv.i4 
	IL_01b2:  ldc.i4 1
	IL_01b7:  sub 
	IL_01b8:  stloc 8

	IL_01bc:  nop 
	IL_01bd:  nop 
	IL_01be:  ldarg 2

	IL_01c2:  nop 
	IL_01c3:  nop 
	IL_01c4:  ldc.i4 1
	IL_01c9:  sub 
	IL_01ca:  starg 2

	IL_01ce:  nop 
	IL_01cf:  nop 
	IL_01d0:  br IL_03a7

	IL_01d5:  br IL_01ef

	IL_01da:  ldc.i4 1
	IL_01df:  stloc 3

	IL_01e3:  nop 
	IL_01e4:  nop 
	IL_01e5:  br IL_0300

	IL_01ea:  br IL_01ef

	IL_01ef:  br IL_0300

	IL_01f4:  br IL_01fe

	IL_01f9:  br IL_01fe

	IL_01fe:  ldarg 1

	IL_0202:  nop 
	IL_0203:  nop 
	IL_0204:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0209:  ldarg 2

	IL_020d:  nop 
	IL_020e:  nop 
	IL_020f:  conv.u 
	IL_0210:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0215:  stloc 5

	IL_0219:  nop 
	IL_021a:  nop 
	IL_021b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
	IL_0220:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0225:  stloc 6

	IL_0229:  nop 
	IL_022a:  nop 
	IL_022b:  ldloc 6

	IL_022f:  nop 
	IL_0230:  nop 
	IL_0231:  ldloc 5

	IL_0235:  nop 
	IL_0236:  nop 
	IL_0237:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_023c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0241:  stloc 7

	IL_0245:  nop 
	IL_0246:  nop 
	IL_0247:  ldloc 7

	IL_024b:  nop 
	IL_024c:  nop 
	IL_024d:  ldc.i4 1
	IL_0252:  beq IL_025c

	IL_0257:  br IL_0283

	IL_025c:  ldloc 2

	IL_0260:  nop 
	IL_0261:  nop 
	IL_0262:  ldc.i4 1
	IL_0267:  add 
	IL_0268:  stloc 2

	IL_026c:  nop 
	IL_026d:  nop 
	IL_026e:  ldc.i4 1
	IL_0273:  stloc 3

	IL_0277:  nop 
	IL_0278:  nop 
	IL_0279:  br IL_0300

	IL_027e:  br IL_0288

	IL_0283:  br IL_0288

	IL_0288:  ldarg 1

	IL_028c:  nop 
	IL_028d:  nop 
	IL_028e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0293:  ldarg 2

	IL_0297:  nop 
	IL_0298:  nop 
	IL_0299:  conv.u 
	IL_029a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_029f:  stloc 5

	IL_02a3:  nop 
	IL_02a4:  nop 
	IL_02a5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_02aa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02af:  stloc 6

	IL_02b3:  nop 
	IL_02b4:  nop 
	IL_02b5:  ldloc 6

	IL_02b9:  nop 
	IL_02ba:  nop 
	IL_02bb:  ldloc 5

	IL_02bf:  nop 
	IL_02c0:  nop 
	IL_02c1:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02c6:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_02cb:  stloc 7

	IL_02cf:  nop 
	IL_02d0:  nop 
	IL_02d1:  ldloc 7

	IL_02d5:  nop 
	IL_02d6:  nop 
	IL_02d7:  ldc.i4 1
	IL_02dc:  beq IL_02e6

	IL_02e1:  br IL_02eb

	IL_02e6:  br IL_0300

	IL_02eb:  ldc.i4 1
	IL_02f0:  stloc 3

	IL_02f4:  nop 
	IL_02f5:  nop 
	IL_02f6:  br IL_0300

	IL_02fb:  br IL_0300

	IL_0300:  ldloc 3

	IL_0304:  nop 
	IL_0305:  nop 
	IL_0306:  ldc.i4 1
	IL_030b:  beq IL_0315

	IL_0310:  br IL_0378

	IL_0315:  ldloc 1

	IL_0319:  nop 
	IL_031a:  nop 
	IL_031b:  ldarg 1

	IL_031f:  nop 
	IL_0320:  nop 
	IL_0321:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0326:  ldarg 2

	IL_032a:  nop 
	IL_032b:  nop 
	IL_032c:  conv.u 
	IL_032d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0332:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0337:  ldarg 1

	IL_033b:  nop 
	IL_033c:  nop 
	IL_033d:  ldarg 2

	IL_0341:  nop 
	IL_0342:  nop 
	IL_0343:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0348:  ldarg 1

	IL_034c:  nop 
	IL_034d:  nop 
	IL_034e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0353:  ldlen 
	IL_0354:  conv.i4 
	IL_0355:  ldc.i4 1
	IL_035a:  sub 
	IL_035b:  stloc 8

	IL_035f:  nop 
	IL_0360:  nop 
	IL_0361:  ldarg 2

	IL_0365:  nop 
	IL_0366:  nop 
	IL_0367:  ldc.i4 1
	IL_036c:  sub 
	IL_036d:  starg 2

	IL_0371:  nop 
	IL_0372:  nop 
	IL_0373:  br IL_037d

	IL_0378:  br IL_037d

	IL_037d:  ldarg 2

	IL_0381:  nop 
	IL_0382:  nop 
	IL_0383:  ldloc 8

	IL_0387:  nop 
	IL_0388:  nop 
	IL_0389:  beq IL_0393

	IL_038e:  br IL_039d

	IL_0393:  br IL_03a7

	IL_0398:  br IL_03a7

	IL_039d:  br IL_00f2

	IL_03a2:  br IL_03a7

	IL_03a7:  ldloc 0

	IL_03ab:  nop 
	IL_03ac:  nop 
	IL_03ad:  ldloc 1

	IL_03b1:  nop 
	IL_03b2:  nop 
	IL_03b3:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_03b8:  ldloc 0

	IL_03bc:  nop 
	IL_03bd:  nop 
	IL_03be:  ldc.i4 1
	IL_03c3:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_03c8:  ldarg 1

	IL_03cc:  nop 
	IL_03cd:  nop 
	IL_03ce:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03d3:  ldloc 4

	IL_03d7:  nop 
	IL_03d8:  nop 
	IL_03d9:  conv.u 
	IL_03da:  ldloc 0

	IL_03de:  nop 
	IL_03df:  nop 
	IL_03e0:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03e5:  ldarg 1

	IL_03e9:  nop 
	IL_03ea:  nop 
	IL_03eb:  ret 
    } // end of method ExprOptimizer::procIdentArrayAccess

    // method line 17
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procMtdArrayAccess (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x8e80
	// Code size 1045 (0x415)
	.maxstack 25
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_2,
		int32	V_3,
		bool	V_4,
		int32	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_6,
		class [mscorlib]System.Type	V_7,
		bool	V_8,
		int32	V_9)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldnull 
	IL_0008:  stloc 1

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0013:  stloc 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldc.i4 1
	IL_001e:  stloc 3

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldc.i4 1
	IL_0029:  stloc 4

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  ldc.i4 0
	IL_0034:  stloc 5

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldarg 2

	IL_003e:  nop 
	IL_003f:  nop 
	IL_0040:  ldc.i4 1
	IL_0045:  sub 
	IL_0046:  starg 2

	IL_004a:  nop 
	IL_004b:  nop 
	IL_004c:  ldarg 1

	IL_0050:  nop 
	IL_0051:  nop 
	IL_0052:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0057:  ldarg 2

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  conv.u 
	IL_005e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0063:  stloc 0

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldloc 0

	IL_006d:  nop 
	IL_006e:  nop 
	IL_006f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0074:  stloc 1

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  ldarg 2

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  stloc 5

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldarg 2

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  ldc.i4 1
	IL_0091:  add 
	IL_0092:  starg 2

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldarg 1

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00a3:  ldarg 2

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  conv.u 
	IL_00aa:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00af:  stloc 6

	IL_00b3:  nop 
	IL_00b4:  nop 
	IL_00b5:  ldarg 1

	IL_00b9:  nop 
	IL_00ba:  nop 
	IL_00bb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00c0:  ldlen 
	IL_00c1:  conv.i4 
	IL_00c2:  ldc.i4 1
	IL_00c7:  sub 
	IL_00c8:  stloc 9

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  ldarg 1

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  ldarg 2

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_00df:  ldarg 1

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00ea:  ldlen 
	IL_00eb:  conv.i4 
	IL_00ec:  ldc.i4 1
	IL_00f1:  sub 
	IL_00f2:  stloc 9

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldarg 2

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  ldc.i4 1
	IL_0103:  sub 
	IL_0104:  starg 2

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  ldarg 2

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ldc.i4 1
	IL_0115:  add 
	IL_0116:  starg 2

	IL_011a:  nop 
	IL_011b:  nop 
	IL_011c:  ldarg 1

	IL_0120:  nop 
	IL_0121:  nop 
	IL_0122:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0127:  ldarg 2

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  conv.u 
	IL_012e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0133:  stloc 6

	IL_0137:  nop 
	IL_0138:  nop 
	IL_0139:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RSParen
	IL_013e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0143:  stloc 7

	IL_0147:  nop 
	IL_0148:  nop 
	IL_0149:  ldloc 7

	IL_014d:  nop 
	IL_014e:  nop 
	IL_014f:  ldloc 6

	IL_0153:  nop 
	IL_0154:  nop 
	IL_0155:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_015a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_015f:  stloc 8

	IL_0163:  nop 
	IL_0164:  nop 
	IL_0165:  ldloc 8

	IL_0169:  nop 
	IL_016a:  nop 
	IL_016b:  ldc.i4 1
	IL_0170:  beq IL_017a

	IL_0175:  br IL_0211

	IL_017a:  ldloc 3

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldc.i4 1
	IL_0185:  sub 
	IL_0186:  stloc 3

	IL_018a:  nop 
	IL_018b:  nop 
	IL_018c:  ldloc 3

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  ldc.i4 0
	IL_0197:  beq IL_01a1

	IL_019c:  br IL_01f2

	IL_01a1:  ldc.i4 0
	IL_01a6:  stloc 4

	IL_01aa:  nop 
	IL_01ab:  nop 
	IL_01ac:  ldarg 1

	IL_01b0:  nop 
	IL_01b1:  nop 
	IL_01b2:  ldarg 2

	IL_01b6:  nop 
	IL_01b7:  nop 
	IL_01b8:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_01bd:  ldarg 1

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01c8:  ldlen 
	IL_01c9:  conv.i4 
	IL_01ca:  ldc.i4 1
	IL_01cf:  sub 
	IL_01d0:  stloc 9

	IL_01d4:  nop 
	IL_01d5:  nop 
	IL_01d6:  ldarg 2

	IL_01da:  nop 
	IL_01db:  nop 
	IL_01dc:  ldc.i4 1
	IL_01e1:  sub 
	IL_01e2:  starg 2

	IL_01e6:  nop 
	IL_01e7:  nop 
	IL_01e8:  br IL_03bf

	IL_01ed:  br IL_0207

	IL_01f2:  ldc.i4 1
	IL_01f7:  stloc 4

	IL_01fb:  nop 
	IL_01fc:  nop 
	IL_01fd:  br IL_0318

	IL_0202:  br IL_0207

	IL_0207:  br IL_0318

	IL_020c:  br IL_0216

	IL_0211:  br IL_0216

	IL_0216:  ldarg 1

	IL_021a:  nop 
	IL_021b:  nop 
	IL_021c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0221:  ldarg 2

	IL_0225:  nop 
	IL_0226:  nop 
	IL_0227:  conv.u 
	IL_0228:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_022d:  stloc 6

	IL_0231:  nop 
	IL_0232:  nop 
	IL_0233:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
	IL_0238:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_023d:  stloc 7

	IL_0241:  nop 
	IL_0242:  nop 
	IL_0243:  ldloc 7

	IL_0247:  nop 
	IL_0248:  nop 
	IL_0249:  ldloc 6

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0254:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0259:  stloc 8

	IL_025d:  nop 
	IL_025e:  nop 
	IL_025f:  ldloc 8

	IL_0263:  nop 
	IL_0264:  nop 
	IL_0265:  ldc.i4 1
	IL_026a:  beq IL_0274

	IL_026f:  br IL_029b

	IL_0274:  ldloc 3

	IL_0278:  nop 
	IL_0279:  nop 
	IL_027a:  ldc.i4 1
	IL_027f:  add 
	IL_0280:  stloc 3

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  ldc.i4 1
	IL_028b:  stloc 4

	IL_028f:  nop 
	IL_0290:  nop 
	IL_0291:  br IL_0318

	IL_0296:  br IL_02a0

	IL_029b:  br IL_02a0

	IL_02a0:  ldarg 1

	IL_02a4:  nop 
	IL_02a5:  nop 
	IL_02a6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_02ab:  ldarg 2

	IL_02af:  nop 
	IL_02b0:  nop 
	IL_02b1:  conv.u 
	IL_02b2:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02b7:  stloc 6

	IL_02bb:  nop 
	IL_02bc:  nop 
	IL_02bd:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_02c2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02c7:  stloc 7

	IL_02cb:  nop 
	IL_02cc:  nop 
	IL_02cd:  ldloc 7

	IL_02d1:  nop 
	IL_02d2:  nop 
	IL_02d3:  ldloc 6

	IL_02d7:  nop 
	IL_02d8:  nop 
	IL_02d9:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02de:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_02e3:  stloc 8

	IL_02e7:  nop 
	IL_02e8:  nop 
	IL_02e9:  ldloc 8

	IL_02ed:  nop 
	IL_02ee:  nop 
	IL_02ef:  ldc.i4 1
	IL_02f4:  beq IL_02fe

	IL_02f9:  br IL_0303

	IL_02fe:  br IL_0318

	IL_0303:  ldc.i4 1
	IL_0308:  stloc 4

	IL_030c:  nop 
	IL_030d:  nop 
	IL_030e:  br IL_0318

	IL_0313:  br IL_0318

	IL_0318:  ldloc 4

	IL_031c:  nop 
	IL_031d:  nop 
	IL_031e:  ldc.i4 1
	IL_0323:  beq IL_032d

	IL_0328:  br IL_0390

	IL_032d:  ldloc 2

	IL_0331:  nop 
	IL_0332:  nop 
	IL_0333:  ldarg 1

	IL_0337:  nop 
	IL_0338:  nop 
	IL_0339:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_033e:  ldarg 2

	IL_0342:  nop 
	IL_0343:  nop 
	IL_0344:  conv.u 
	IL_0345:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_034a:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_034f:  ldarg 1

	IL_0353:  nop 
	IL_0354:  nop 
	IL_0355:  ldarg 2

	IL_0359:  nop 
	IL_035a:  nop 
	IL_035b:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0360:  ldarg 1

	IL_0364:  nop 
	IL_0365:  nop 
	IL_0366:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_036b:  ldlen 
	IL_036c:  conv.i4 
	IL_036d:  ldc.i4 1
	IL_0372:  sub 
	IL_0373:  stloc 9

	IL_0377:  nop 
	IL_0378:  nop 
	IL_0379:  ldarg 2

	IL_037d:  nop 
	IL_037e:  nop 
	IL_037f:  ldc.i4 1
	IL_0384:  sub 
	IL_0385:  starg 2

	IL_0389:  nop 
	IL_038a:  nop 
	IL_038b:  br IL_0395

	IL_0390:  br IL_0395

	IL_0395:  ldarg 2

	IL_0399:  nop 
	IL_039a:  nop 
	IL_039b:  ldloc 9

	IL_039f:  nop 
	IL_03a0:  nop 
	IL_03a1:  beq IL_03ab

	IL_03a6:  br IL_03b5

	IL_03ab:  br IL_03bf

	IL_03b0:  br IL_03bf

	IL_03b5:  br IL_010a

	IL_03ba:  br IL_03bf

	IL_03bf:  ldloc 1

	IL_03c3:  nop 
	IL_03c4:  nop 
	IL_03c5:  ldloc 2

	IL_03c9:  nop 
	IL_03ca:  nop 
	IL_03cb:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_03d0:  ldloc 1

	IL_03d4:  nop 
	IL_03d5:  nop 
	IL_03d6:  ldc.i4 1
	IL_03db:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_03e0:  ldloc 0

	IL_03e4:  nop 
	IL_03e5:  nop 
	IL_03e6:  ldloc 1

	IL_03ea:  nop 
	IL_03eb:  nop 
	IL_03ec:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_03f1:  ldarg 1

	IL_03f5:  nop 
	IL_03f6:  nop 
	IL_03f7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03fc:  ldloc 5

	IL_0400:  nop 
	IL_0401:  nop 
	IL_0402:  conv.u 
	IL_0403:  ldloc 0

	IL_0407:  nop 
	IL_0408:  nop 
	IL_0409:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_040e:  ldarg 1

	IL_0412:  nop 
	IL_0413:  nop 
	IL_0414:  ret 
    } // end of method ExprOptimizer::procMtdArrayAccess

    // method line 18
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x92a4
	// Code size 8010 (0x1f4a)
	.maxstack 231
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		bool	V_3,
		bool	V_4,
		bool	V_5,
		bool	V_6,
		bool	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_10,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_13,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_15,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_16,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_17,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_18,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_19,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_20,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_21,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_22,
		int32	V_23,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_24,
		class [mscorlib]System.Type	V_25,
		bool	V_26,
		string	V_27,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_28,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_29,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_30,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_31,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_32,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_33,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_34,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_35,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_36,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_37,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok	V_38,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_39,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_40,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral	V_41,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok	V_42,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_43,
		int32	V_44,
		int32	V_45,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_50,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_51,
		int32	V_52,
		int32	V_53,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_56,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_57)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 1
	IL_0012:  sub 
	IL_0013:  stloc 0

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldc.i4 -1
	IL_001e:  stloc 1

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldc.i4 -1
	IL_0029:  stloc 2

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  ldc.i4 0
	IL_0034:  stloc 3

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldc.i4 0
	IL_003f:  stloc 4

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldc.i4 0
	IL_004a:  stloc 5

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldc.i4 0
	IL_0055:  stloc 6

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  ldc.i4 0
	IL_0060:  stloc 7

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldnull 
	IL_0067:  stloc 8

	IL_006b:  nop 
	IL_006c:  nop 
	IL_006d:  ldnull 
	IL_006e:  stloc 9

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldnull 
	IL_0075:  stloc 10

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldnull 
	IL_007c:  stloc 11

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldnull 
	IL_0083:  stloc 12

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldnull 
	IL_008a:  stloc 13

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldnull 
	IL_0091:  stloc 14

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldnull 
	IL_0098:  stloc 15

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldnull 
	IL_009f:  stloc 16

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldnull 
	IL_00a6:  stloc 17

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldnull 
	IL_00ad:  stloc 18

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldnull 
	IL_00b4:  stloc 19

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldnull 
	IL_00bb:  stloc 20

	IL_00bf:  nop 
	IL_00c0:  nop 
	IL_00c1:  ldnull 
	IL_00c2:  stloc 21

	IL_00c6:  nop 
	IL_00c7:  nop 
	IL_00c8:  ldnull 
	IL_00c9:  stloc 22

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldc.i4 0
	IL_00d4:  stloc 23

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  ldloc 0

	IL_00de:  nop 
	IL_00df:  nop 
	IL_00e0:  ldc.i4 0
	IL_00e5:  blt IL_00ef

	IL_00ea:  br IL_00f9

	IL_00ef:  br IL_1e87

	IL_00f4:  br IL_00fe

	IL_00f9:  br IL_00fe

	IL_00fe:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_0103:  ldc.i4 0
	IL_0108:  beq IL_0112

	IL_010d:  br IL_1a0e

	IL_0112:  ldloc 1

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  ldc.i4 1
	IL_011d:  add 
	IL_011e:  stloc 1

	IL_0122:  nop 
	IL_0123:  nop 
	IL_0124:  ldarg 1

	IL_0128:  nop 
	IL_0129:  nop 
	IL_012a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_012f:  ldloc 1

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  conv.u 
	IL_0136:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_013b:  stloc 24

	IL_013f:  nop 
	IL_0140:  nop 
	IL_0141:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LRSParen
	IL_0146:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_014b:  stloc 25

	IL_014f:  nop 
	IL_0150:  nop 
	IL_0151:  ldloc 25

	IL_0155:  nop 
	IL_0156:  nop 
	IL_0157:  ldloc 24

	IL_015b:  nop 
	IL_015c:  nop 
	IL_015d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0162:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0167:  stloc 26

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  ldloc 26

	IL_0171:  nop 
	IL_0172:  nop 
	IL_0173:  ldc.i4 1
	IL_0178:  beq IL_0182

	IL_017d:  br IL_02de

	IL_0182:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0187:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_018c:  stloc 25

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  ldarg 1

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldloc 1

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_01a3:  ldloc 1

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldc.i4 1
	IL_01ae:  sub 
	IL_01af:  stloc 1

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  ldarg 1

	IL_01b9:  nop 
	IL_01ba:  nop 
	IL_01bb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01c0:  ldlen 
	IL_01c1:  conv.i4 
	IL_01c2:  ldc.i4 1
	IL_01c7:  sub 
	IL_01c8:  stloc 0

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldarg 1

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01d9:  ldloc 1

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  conv.u 
	IL_01e0:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01e5:  stloc 24

	IL_01e9:  nop 
	IL_01ea:  nop 
	IL_01eb:  ldloc 25

	IL_01ef:  nop 
	IL_01f0:  nop 
	IL_01f1:  ldloc 24

	IL_01f5:  nop 
	IL_01f6:  nop 
	IL_01f7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01fc:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0201:  stloc 26

	IL_0205:  nop 
	IL_0206:  nop 
	IL_0207:  ldloc 26

	IL_020b:  nop 
	IL_020c:  nop 
	IL_020d:  ldc.i4 1
	IL_0212:  beq IL_0285

	IL_0217:  br IL_021c

	IL_021c:  ldarg 1

	IL_0220:  nop 
	IL_0221:  nop 
	IL_0222:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0227:  ldloc 1

	IL_022b:  nop 
	IL_022c:  nop 
	IL_022d:  conv.u 
	IL_022e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0233:  stloc 28

	IL_0237:  nop 
	IL_0238:  nop 
	IL_0239:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_023e:  stloc 29

	IL_0242:  nop 
	IL_0243:  nop 
	IL_0244:  ldloc 29

	IL_0248:  nop 
	IL_0249:  nop 
	IL_024a:  ldloc 28

	IL_024e:  nop 
	IL_024f:  nop 
	IL_0250:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0255:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_025a:  ldloc 29

	IL_025e:  nop 
	IL_025f:  nop 
	IL_0260:  ldloc 28

	IL_0264:  nop 
	IL_0265:  nop 
	IL_0266:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_026b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0270:  ldloc 29

	IL_0274:  nop 
	IL_0275:  nop 
	IL_0276:  ldc.i4 1
	IL_027b:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0280:  br IL_02b7

	IL_0285:  ldarg 1

	IL_0289:  nop 
	IL_028a:  nop 
	IL_028b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0290:  ldloc 1

	IL_0294:  nop 
	IL_0295:  nop 
	IL_0296:  conv.u 
	IL_0297:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_029c:  stloc 29

	IL_02a0:  nop 
	IL_02a1:  nop 
	IL_02a2:  ldloc 29

	IL_02a6:  nop 
	IL_02a7:  nop 
	IL_02a8:  ldc.i4 1
	IL_02ad:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_02b2:  br IL_02b7

	IL_02b7:  ldarg 1

	IL_02bb:  nop 
	IL_02bc:  nop 
	IL_02bd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_02c2:  ldloc 1

	IL_02c6:  nop 
	IL_02c7:  nop 
	IL_02c8:  conv.u 
	IL_02c9:  ldloc 29

	IL_02cd:  nop 
	IL_02ce:  nop 
	IL_02cf:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02d4:  br IL_19df

	IL_02d9:  br IL_02e3

	IL_02de:  br IL_02e3

	IL_02e3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Ampersand
	IL_02e8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02ed:  stloc 25

	IL_02f1:  nop 
	IL_02f2:  nop 
	IL_02f3:  ldloc 25

	IL_02f7:  nop 
	IL_02f8:  nop 
	IL_02f9:  ldloc 24

	IL_02fd:  nop 
	IL_02fe:  nop 
	IL_02ff:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0304:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0309:  stloc 26

	IL_030d:  nop 
	IL_030e:  nop 
	IL_030f:  ldloc 26

	IL_0313:  nop 
	IL_0314:  nop 
	IL_0315:  ldc.i4 1
	IL_031a:  beq IL_0324

	IL_031f:  br IL_0480

	IL_0324:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0329:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_032e:  stloc 25

	IL_0332:  nop 
	IL_0333:  nop 
	IL_0334:  ldarg 1

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  ldloc 1

	IL_033e:  nop 
	IL_033f:  nop 
	IL_0340:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0345:  ldloc 1

	IL_0349:  nop 
	IL_034a:  nop 
	IL_034b:  ldc.i4 1
	IL_0350:  sub 
	IL_0351:  stloc 1

	IL_0355:  nop 
	IL_0356:  nop 
	IL_0357:  ldarg 1

	IL_035b:  nop 
	IL_035c:  nop 
	IL_035d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0362:  ldlen 
	IL_0363:  conv.i4 
	IL_0364:  ldc.i4 1
	IL_0369:  sub 
	IL_036a:  stloc 0

	IL_036e:  nop 
	IL_036f:  nop 
	IL_0370:  ldarg 1

	IL_0374:  nop 
	IL_0375:  nop 
	IL_0376:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_037b:  ldloc 1

	IL_037f:  nop 
	IL_0380:  nop 
	IL_0381:  conv.u 
	IL_0382:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0387:  stloc 24

	IL_038b:  nop 
	IL_038c:  nop 
	IL_038d:  ldloc 25

	IL_0391:  nop 
	IL_0392:  nop 
	IL_0393:  ldloc 24

	IL_0397:  nop 
	IL_0398:  nop 
	IL_0399:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_039e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_03a3:  stloc 26

	IL_03a7:  nop 
	IL_03a8:  nop 
	IL_03a9:  ldloc 26

	IL_03ad:  nop 
	IL_03ae:  nop 
	IL_03af:  ldc.i4 1
	IL_03b4:  beq IL_0427

	IL_03b9:  br IL_03be

	IL_03be:  ldarg 1

	IL_03c2:  nop 
	IL_03c3:  nop 
	IL_03c4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03c9:  ldloc 1

	IL_03cd:  nop 
	IL_03ce:  nop 
	IL_03cf:  conv.u 
	IL_03d0:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03d5:  stloc 30

	IL_03d9:  nop 
	IL_03da:  nop 
	IL_03db:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_03e0:  stloc 31

	IL_03e4:  nop 
	IL_03e5:  nop 
	IL_03e6:  ldloc 31

	IL_03ea:  nop 
	IL_03eb:  nop 
	IL_03ec:  ldloc 30

	IL_03f0:  nop 
	IL_03f1:  nop 
	IL_03f2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_03f7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_03fc:  ldloc 31

	IL_0400:  nop 
	IL_0401:  nop 
	IL_0402:  ldloc 30

	IL_0406:  nop 
	IL_0407:  nop 
	IL_0408:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_040d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0412:  ldloc 31

	IL_0416:  nop 
	IL_0417:  nop 
	IL_0418:  ldc.i4 1
	IL_041d:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0422:  br IL_0459

	IL_0427:  ldarg 1

	IL_042b:  nop 
	IL_042c:  nop 
	IL_042d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0432:  ldloc 1

	IL_0436:  nop 
	IL_0437:  nop 
	IL_0438:  conv.u 
	IL_0439:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_043e:  stloc 31

	IL_0442:  nop 
	IL_0443:  nop 
	IL_0444:  ldloc 31

	IL_0448:  nop 
	IL_0449:  nop 
	IL_044a:  ldc.i4 1
	IL_044f:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0454:  br IL_0459

	IL_0459:  ldarg 1

	IL_045d:  nop 
	IL_045e:  nop 
	IL_045f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0464:  ldloc 1

	IL_0468:  nop 
	IL_0469:  nop 
	IL_046a:  conv.u 
	IL_046b:  ldloc 31

	IL_046f:  nop 
	IL_0470:  nop 
	IL_0471:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0476:  br IL_19df

	IL_047b:  br IL_0485

	IL_0480:  br IL_0485

	IL_0485:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_048a:  ldc.i4 0
	IL_048f:  beq IL_0499

	IL_0494:  br IL_19da

	IL_0499:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.DollarSign
	IL_049e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04a3:  stloc 25

	IL_04a7:  nop 
	IL_04a8:  nop 
	IL_04a9:  ldloc 25

	IL_04ad:  nop 
	IL_04ae:  nop 
	IL_04af:  ldloc 24

	IL_04b3:  nop 
	IL_04b4:  nop 
	IL_04b5:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_04ba:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_04bf:  stloc 26

	IL_04c3:  nop 
	IL_04c4:  nop 
	IL_04c5:  ldloc 26

	IL_04c9:  nop 
	IL_04ca:  nop 
	IL_04cb:  ldc.i4 1
	IL_04d0:  beq IL_04da

	IL_04d5:  br IL_059e

	IL_04da:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04df:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04e4:  or 
	IL_04e5:  not 
	IL_04e6:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04eb:  ldc.i4 1
	IL_04f0:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_04f5:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04fa:  ldc.i4 0
	IL_04ff:  beq IL_0553

	IL_0504:  br IL_0509

	IL_0509:  ldc.i4 1
	IL_050e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_0513:  ldstr "conv "
	IL_0518:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_051d:  call string string::Concat(string, string)
	IL_0522:  stsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_0527:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_052c:  stloc 27

	IL_0530:  nop 
	IL_0531:  nop 
	IL_0532:  ldloc 27

	IL_0536:  nop 
	IL_0537:  nop 
	IL_0538:  callvirt instance string string::Trim()
	IL_053d:  stloc 27

	IL_0541:  nop 
	IL_0542:  nop 
	IL_0543:  ldloc 27

	IL_0547:  nop 
	IL_0548:  nop 
	IL_0549:  stsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_054e:  br IL_0558

	IL_0553:  br IL_0558

	IL_0558:  ldarg 1

	IL_055c:  nop 
	IL_055d:  nop 
	IL_055e:  ldloc 1

	IL_0562:  nop 
	IL_0563:  nop 
	IL_0564:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0569:  ldloc 1

	IL_056d:  nop 
	IL_056e:  nop 
	IL_056f:  ldc.i4 1
	IL_0574:  sub 
	IL_0575:  stloc 1

	IL_0579:  nop 
	IL_057a:  nop 
	IL_057b:  ldarg 1

	IL_057f:  nop 
	IL_0580:  nop 
	IL_0581:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0586:  ldlen 
	IL_0587:  conv.i4 
	IL_0588:  ldc.i4 1
	IL_058d:  sub 
	IL_058e:  stloc 0

	IL_0592:  nop 
	IL_0593:  nop 
	IL_0594:  br IL_19df

	IL_0599:  br IL_05a3

	IL_059e:  br IL_05a3

	IL_05a3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_05a8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05ad:  stloc 25

	IL_05b1:  nop 
	IL_05b2:  nop 
	IL_05b3:  ldloc 25

	IL_05b7:  nop 
	IL_05b8:  nop 
	IL_05b9:  ldloc 24

	IL_05bd:  nop 
	IL_05be:  nop 
	IL_05bf:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_05c4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05c9:  stloc 26

	IL_05cd:  nop 
	IL_05ce:  nop 
	IL_05cf:  ldloc 26

	IL_05d3:  nop 
	IL_05d4:  nop 
	IL_05d5:  ldc.i4 1
	IL_05da:  beq IL_05e4

	IL_05df:  br IL_0670

	IL_05e4:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_05e9:  ldc.i4 0
	IL_05ee:  beq IL_0661

	IL_05f3:  br IL_05f8

	IL_05f8:  ldarg 1

	IL_05fc:  nop 
	IL_05fd:  nop 
	IL_05fe:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0603:  ldloc 1

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  conv.u 
	IL_060a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_060f:  stloc 32

	IL_0613:  nop 
	IL_0614:  nop 
	IL_0615:  ldloc 32

	IL_0619:  nop 
	IL_061a:  nop 
	IL_061b:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_0620:  ldarg 1

	IL_0624:  nop 
	IL_0625:  nop 
	IL_0626:  ldloc 1

	IL_062a:  nop 
	IL_062b:  nop 
	IL_062c:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0631:  ldloc 1

	IL_0635:  nop 
	IL_0636:  nop 
	IL_0637:  ldc.i4 1
	IL_063c:  sub 
	IL_063d:  stloc 1

	IL_0641:  nop 
	IL_0642:  nop 
	IL_0643:  ldarg 1

	IL_0647:  nop 
	IL_0648:  nop 
	IL_0649:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_064e:  ldlen 
	IL_064f:  conv.i4 
	IL_0650:  ldc.i4 1
	IL_0655:  sub 
	IL_0656:  stloc 0

	IL_065a:  nop 
	IL_065b:  nop 
	IL_065c:  br IL_0666

	IL_0661:  br IL_0666

	IL_0666:  br IL_19df

	IL_066b:  br IL_0675

	IL_0670:  br IL_0675

	IL_0675:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_067a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_067f:  stloc 25

	IL_0683:  nop 
	IL_0684:  nop 
	IL_0685:  ldloc 25

	IL_0689:  nop 
	IL_068a:  nop 
	IL_068b:  ldloc 24

	IL_068f:  nop 
	IL_0690:  nop 
	IL_0691:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0696:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_069b:  stloc 26

	IL_069f:  nop 
	IL_06a0:  nop 
	IL_06a1:  ldloc 26

	IL_06a5:  nop 
	IL_06a6:  nop 
	IL_06a7:  ldc.i4 1
	IL_06ac:  beq IL_06b6

	IL_06b1:  br IL_0832

	IL_06b6:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_06bb:  ldc.i4 0
	IL_06c0:  beq IL_06ca

	IL_06c5:  br IL_0788

	IL_06ca:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_06cf:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_06d4:  or 
	IL_06d5:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_06da:  or 
	IL_06db:  stloc 26

	IL_06df:  nop 
	IL_06e0:  nop 
	IL_06e1:  ldloc 26

	IL_06e5:  nop 
	IL_06e6:  nop 
	IL_06e7:  ldc.i4 1
	IL_06ec:  beq IL_06f6

	IL_06f1:  br IL_0706

	IL_06f6:  ldc.i4 1
	IL_06fb:  stloc 4

	IL_06ff:  nop 
	IL_0700:  nop 
	IL_0701:  br IL_070b

	IL_0706:  br IL_070b

	IL_070b:  ldc.i4 1
	IL_0710:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_0715:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_071a:  ldc.i4 1
	IL_071f:  beq IL_0729

	IL_0724:  br IL_077e

	IL_0729:  ldarg 1

	IL_072d:  nop 
	IL_072e:  nop 
	IL_072f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0734:  ldloc 1

	IL_0738:  nop 
	IL_0739:  nop 
	IL_073a:  conv.u 
	IL_073b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0740:  stloc 33

	IL_0744:  nop 
	IL_0745:  nop 
	IL_0746:  ldarg 1

	IL_074a:  nop 
	IL_074b:  nop 
	IL_074c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0751:  ldloc 1

	IL_0755:  nop 
	IL_0756:  nop 
	IL_0757:  conv.u 
	IL_0758:  ldloc 33

	IL_075c:  nop 
	IL_075d:  nop 
	IL_075e:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateIdent(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident)
	IL_0763:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0768:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_076d:  ldloc 1

	IL_0771:  nop 
	IL_0772:  nop 
	IL_0773:  stloc 2

	IL_0777:  nop 
	IL_0778:  nop 
	IL_0779:  br IL_0783

	IL_077e:  br IL_0783

	IL_0783:  br IL_0828

	IL_0788:  ldarg 1

	IL_078c:  nop 
	IL_078d:  nop 
	IL_078e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0793:  ldloc 1

	IL_0797:  nop 
	IL_0798:  nop 
	IL_0799:  conv.u 
	IL_079a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_079f:  stloc 34

	IL_07a3:  nop 
	IL_07a4:  nop 
	IL_07a5:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_07aa:  stloc 35

	IL_07ae:  nop 
	IL_07af:  nop 
	IL_07b0:  ldloc 35

	IL_07b4:  nop 
	IL_07b5:  nop 
	IL_07b6:  ldloc 34

	IL_07ba:  nop 
	IL_07bb:  nop 
	IL_07bc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_07c1:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_07c6:  ldloc 35

	IL_07ca:  nop 
	IL_07cb:  nop 
	IL_07cc:  ldloc 34

	IL_07d0:  nop 
	IL_07d1:  nop 
	IL_07d2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_07d7:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_07dc:  ldloc 35

	IL_07e0:  nop 
	IL_07e1:  nop 
	IL_07e2:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_07e7:  ldarg 1

	IL_07eb:  nop 
	IL_07ec:  nop 
	IL_07ed:  ldloc 1

	IL_07f1:  nop 
	IL_07f2:  nop 
	IL_07f3:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_07f8:  ldloc 1

	IL_07fc:  nop 
	IL_07fd:  nop 
	IL_07fe:  ldc.i4 1
	IL_0803:  sub 
	IL_0804:  stloc 1

	IL_0808:  nop 
	IL_0809:  nop 
	IL_080a:  ldarg 1

	IL_080e:  nop 
	IL_080f:  nop 
	IL_0810:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0815:  ldlen 
	IL_0816:  conv.i4 
	IL_0817:  ldc.i4 1
	IL_081c:  sub 
	IL_081d:  stloc 0

	IL_0821:  nop 
	IL_0822:  nop 
	IL_0823:  br IL_0828

	IL_0828:  br IL_19df

	IL_082d:  br IL_0837

	IL_0832:  br IL_0837

	IL_0837:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral
	IL_083c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0841:  stloc 25

	IL_0845:  nop 
	IL_0846:  nop 
	IL_0847:  ldloc 25

	IL_084b:  nop 
	IL_084c:  nop 
	IL_084d:  ldloc 24

	IL_0851:  nop 
	IL_0852:  nop 
	IL_0853:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0858:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_085d:  stloc 26

	IL_0861:  nop 
	IL_0862:  nop 
	IL_0863:  ldloc 26

	IL_0867:  nop 
	IL_0868:  nop 
	IL_0869:  ldc.i4 1
	IL_086e:  beq IL_0878

	IL_0873:  br IL_08f0

	IL_0878:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_087d:  ldc.i4 1
	IL_0882:  beq IL_088c

	IL_0887:  br IL_08e1

	IL_088c:  ldarg 1

	IL_0890:  nop 
	IL_0891:  nop 
	IL_0892:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0897:  ldloc 1

	IL_089b:  nop 
	IL_089c:  nop 
	IL_089d:  conv.u 
	IL_089e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_08a3:  stloc 36

	IL_08a7:  nop 
	IL_08a8:  nop 
	IL_08a9:  ldarg 1

	IL_08ad:  nop 
	IL_08ae:  nop 
	IL_08af:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_08b4:  ldloc 1

	IL_08b8:  nop 
	IL_08b9:  nop 
	IL_08ba:  conv.u 
	IL_08bb:  ldloc 36

	IL_08bf:  nop 
	IL_08c0:  nop 
	IL_08c1:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateCharLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral)
	IL_08c6:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_08cb:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_08d0:  ldloc 1

	IL_08d4:  nop 
	IL_08d5:  nop 
	IL_08d6:  stloc 2

	IL_08da:  nop 
	IL_08db:  nop 
	IL_08dc:  br IL_08e6

	IL_08e1:  br IL_08e6

	IL_08e6:  br IL_19df

	IL_08eb:  br IL_08f5

	IL_08f0:  br IL_08f5

	IL_08f5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral
	IL_08fa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_08ff:  stloc 25

	IL_0903:  nop 
	IL_0904:  nop 
	IL_0905:  ldloc 25

	IL_0909:  nop 
	IL_090a:  nop 
	IL_090b:  ldloc 24

	IL_090f:  nop 
	IL_0910:  nop 
	IL_0911:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0916:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_091b:  stloc 26

	IL_091f:  nop 
	IL_0920:  nop 
	IL_0921:  ldloc 26

	IL_0925:  nop 
	IL_0926:  nop 
	IL_0927:  ldc.i4 1
	IL_092c:  beq IL_0936

	IL_0931:  br IL_09ae

	IL_0936:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_093b:  ldc.i4 1
	IL_0940:  beq IL_094a

	IL_0945:  br IL_099f

	IL_094a:  ldarg 1

	IL_094e:  nop 
	IL_094f:  nop 
	IL_0950:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0955:  ldloc 1

	IL_0959:  nop 
	IL_095a:  nop 
	IL_095b:  conv.u 
	IL_095c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0961:  stloc 37

	IL_0965:  nop 
	IL_0966:  nop 
	IL_0967:  ldarg 1

	IL_096b:  nop 
	IL_096c:  nop 
	IL_096d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0972:  ldloc 1

	IL_0976:  nop 
	IL_0977:  nop 
	IL_0978:  conv.u 
	IL_0979:  ldloc 37

	IL_097d:  nop 
	IL_097e:  nop 
	IL_097f:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateNullLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral)
	IL_0984:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0989:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_098e:  ldloc 1

	IL_0992:  nop 
	IL_0993:  nop 
	IL_0994:  stloc 2

	IL_0998:  nop 
	IL_0999:  nop 
	IL_099a:  br IL_09a4

	IL_099f:  br IL_09a4

	IL_09a4:  br IL_19df

	IL_09a9:  br IL_09b3

	IL_09ae:  br IL_09b3

	IL_09b3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok
	IL_09b8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_09bd:  stloc 25

	IL_09c1:  nop 
	IL_09c2:  nop 
	IL_09c3:  ldloc 25

	IL_09c7:  nop 
	IL_09c8:  nop 
	IL_09c9:  ldloc 24

	IL_09cd:  nop 
	IL_09ce:  nop 
	IL_09cf:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_09d4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_09d9:  stloc 26

	IL_09dd:  nop 
	IL_09de:  nop 
	IL_09df:  ldloc 26

	IL_09e3:  nop 
	IL_09e4:  nop 
	IL_09e5:  ldc.i4 1
	IL_09ea:  beq IL_09f4

	IL_09ef:  br IL_0a6c

	IL_09f4:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_09f9:  ldc.i4 1
	IL_09fe:  beq IL_0a08

	IL_0a03:  br IL_0a5d

	IL_0a08:  ldarg 1

	IL_0a0c:  nop 
	IL_0a0d:  nop 
	IL_0a0e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0a13:  ldloc 1

	IL_0a17:  nop 
	IL_0a18:  nop 
	IL_0a19:  conv.u 
	IL_0a1a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a1f:  stloc 38

	IL_0a23:  nop 
	IL_0a24:  nop 
	IL_0a25:  ldarg 1

	IL_0a29:  nop 
	IL_0a2a:  nop 
	IL_0a2b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0a30:  ldloc 1

	IL_0a34:  nop 
	IL_0a35:  nop 
	IL_0a36:  conv.u 
	IL_0a37:  ldloc 38

	IL_0a3b:  nop 
	IL_0a3c:  nop 
	IL_0a3d:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateMeTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok)
	IL_0a42:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a47:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0a4c:  ldloc 1

	IL_0a50:  nop 
	IL_0a51:  nop 
	IL_0a52:  stloc 2

	IL_0a56:  nop 
	IL_0a57:  nop 
	IL_0a58:  br IL_0a62

	IL_0a5d:  br IL_0a62

	IL_0a62:  br IL_19df

	IL_0a67:  br IL_0a71

	IL_0a6c:  br IL_0a71

	IL_0a71:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_0a76:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a7b:  stloc 25

	IL_0a7f:  nop 
	IL_0a80:  nop 
	IL_0a81:  ldloc 25

	IL_0a85:  nop 
	IL_0a86:  nop 
	IL_0a87:  ldloc 24

	IL_0a8b:  nop 
	IL_0a8c:  nop 
	IL_0a8d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a92:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0a97:  stloc 26

	IL_0a9b:  nop 
	IL_0a9c:  nop 
	IL_0a9d:  ldloc 26

	IL_0aa1:  nop 
	IL_0aa2:  nop 
	IL_0aa3:  ldc.i4 1
	IL_0aa8:  beq IL_0ab2

	IL_0aad:  br IL_0b34

	IL_0ab2:  ldc.i4 1
	IL_0ab7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_0abc:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_0ac1:  ldc.i4 1
	IL_0ac6:  beq IL_0ad0

	IL_0acb:  br IL_0b25

	IL_0ad0:  ldarg 1

	IL_0ad4:  nop 
	IL_0ad5:  nop 
	IL_0ad6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0adb:  ldloc 1

	IL_0adf:  nop 
	IL_0ae0:  nop 
	IL_0ae1:  conv.u 
	IL_0ae2:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0ae7:  stloc 39

	IL_0aeb:  nop 
	IL_0aec:  nop 
	IL_0aed:  ldarg 1

	IL_0af1:  nop 
	IL_0af2:  nop 
	IL_0af3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0af8:  ldloc 1

	IL_0afc:  nop 
	IL_0afd:  nop 
	IL_0afe:  conv.u 
	IL_0aff:  ldloc 39

	IL_0b03:  nop 
	IL_0b04:  nop 
	IL_0b05:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateStringLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral)
	IL_0b0a:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0b0f:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0b14:  ldloc 1

	IL_0b18:  nop 
	IL_0b19:  nop 
	IL_0b1a:  stloc 2

	IL_0b1e:  nop 
	IL_0b1f:  nop 
	IL_0b20:  br IL_0b2a

	IL_0b25:  br IL_0b2a

	IL_0b2a:  br IL_19df

	IL_0b2f:  br IL_0b39

	IL_0b34:  br IL_0b39

	IL_0b39:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral
	IL_0b3e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0b43:  stloc 25

	IL_0b47:  nop 
	IL_0b48:  nop 
	IL_0b49:  ldloc 25

	IL_0b4d:  nop 
	IL_0b4e:  nop 
	IL_0b4f:  ldloc 24

	IL_0b53:  nop 
	IL_0b54:  nop 
	IL_0b55:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0b5a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0b5f:  stloc 26

	IL_0b63:  nop 
	IL_0b64:  nop 
	IL_0b65:  ldloc 26

	IL_0b69:  nop 
	IL_0b6a:  nop 
	IL_0b6b:  ldc.i4 1
	IL_0b70:  beq IL_0b7a

	IL_0b75:  br IL_0bf2

	IL_0b7a:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_0b7f:  ldc.i4 1
	IL_0b84:  beq IL_0b8e

	IL_0b89:  br IL_0be3

	IL_0b8e:  ldarg 1

	IL_0b92:  nop 
	IL_0b93:  nop 
	IL_0b94:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0b99:  ldloc 1

	IL_0b9d:  nop 
	IL_0b9e:  nop 
	IL_0b9f:  conv.u 
	IL_0ba0:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0ba5:  stloc 40

	IL_0ba9:  nop 
	IL_0baa:  nop 
	IL_0bab:  ldarg 1

	IL_0baf:  nop 
	IL_0bb0:  nop 
	IL_0bb1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0bb6:  ldloc 1

	IL_0bba:  nop 
	IL_0bbb:  nop 
	IL_0bbc:  conv.u 
	IL_0bbd:  ldloc 40

	IL_0bc1:  nop 
	IL_0bc2:  nop 
	IL_0bc3:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateBoolLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral)
	IL_0bc8:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0bcd:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0bd2:  ldloc 1

	IL_0bd6:  nop 
	IL_0bd7:  nop 
	IL_0bd8:  stloc 2

	IL_0bdc:  nop 
	IL_0bdd:  nop 
	IL_0bde:  br IL_0be8

	IL_0be3:  br IL_0be8

	IL_0be8:  br IL_19df

	IL_0bed:  br IL_0bf7

	IL_0bf2:  br IL_0bf7

	IL_0bf7:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
	IL_0bfc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0c01:  stloc 25

	IL_0c05:  nop 
	IL_0c06:  nop 
	IL_0c07:  ldloc 25

	IL_0c0b:  nop 
	IL_0c0c:  nop 
	IL_0c0d:  ldloc 24

	IL_0c11:  nop 
	IL_0c12:  nop 
	IL_0c13:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0c18:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0c1d:  stloc 26

	IL_0c21:  nop 
	IL_0c22:  nop 
	IL_0c23:  ldloc 26

	IL_0c27:  nop 
	IL_0c28:  nop 
	IL_0c29:  ldc.i4 1
	IL_0c2e:  beq IL_0c38

	IL_0c33:  br IL_0cb0

	IL_0c38:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_0c3d:  ldc.i4 1
	IL_0c42:  beq IL_0c4c

	IL_0c47:  br IL_0ca1

	IL_0c4c:  ldarg 1

	IL_0c50:  nop 
	IL_0c51:  nop 
	IL_0c52:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0c57:  ldloc 1

	IL_0c5b:  nop 
	IL_0c5c:  nop 
	IL_0c5d:  conv.u 
	IL_0c5e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0c63:  stloc 41

	IL_0c67:  nop 
	IL_0c68:  nop 
	IL_0c69:  ldarg 1

	IL_0c6d:  nop 
	IL_0c6e:  nop 
	IL_0c6f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0c74:  ldloc 1

	IL_0c78:  nop 
	IL_0c79:  nop 
	IL_0c7a:  conv.u 
	IL_0c7b:  ldloc 41

	IL_0c7f:  nop 
	IL_0c80:  nop 
	IL_0c81:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateNumLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral)
	IL_0c86:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0c8b:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0c90:  ldloc 1

	IL_0c94:  nop 
	IL_0c95:  nop 
	IL_0c96:  stloc 2

	IL_0c9a:  nop 
	IL_0c9b:  nop 
	IL_0c9c:  br IL_0ca6

	IL_0ca1:  br IL_0ca6

	IL_0ca6:  br IL_19df

	IL_0cab:  br IL_0cb5

	IL_0cb0:  br IL_0cb5

	IL_0cb5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok
	IL_0cba:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0cbf:  stloc 25

	IL_0cc3:  nop 
	IL_0cc4:  nop 
	IL_0cc5:  ldloc 25

	IL_0cc9:  nop 
	IL_0cca:  nop 
	IL_0ccb:  ldloc 24

	IL_0ccf:  nop 
	IL_0cd0:  nop 
	IL_0cd1:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0cd6:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0cdb:  stloc 26

	IL_0cdf:  nop 
	IL_0ce0:  nop 
	IL_0ce1:  ldloc 26

	IL_0ce5:  nop 
	IL_0ce6:  nop 
	IL_0ce7:  ldc.i4 1
	IL_0cec:  beq IL_0cf6

	IL_0cf1:  br IL_0f8d

	IL_0cf6:  ldarg 1

	IL_0cfa:  nop 
	IL_0cfb:  nop 
	IL_0cfc:  ldloc 1

	IL_0d00:  nop 
	IL_0d01:  nop 
	IL_0d02:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0d07:  ldloc 0

	IL_0d0b:  nop 
	IL_0d0c:  nop 
	IL_0d0d:  ldc.i4 1
	IL_0d12:  sub 
	IL_0d13:  stloc 0

	IL_0d17:  nop 
	IL_0d18:  nop 
	IL_0d19:  ldarg 1

	IL_0d1d:  nop 
	IL_0d1e:  nop 
	IL_0d1f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0d24:  ldloc 1

	IL_0d28:  nop 
	IL_0d29:  nop 
	IL_0d2a:  conv.u 
	IL_0d2b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d30:  stloc 9

	IL_0d34:  nop 
	IL_0d35:  nop 
	IL_0d36:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0d3b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d40:  stloc 25

	IL_0d44:  nop 
	IL_0d45:  nop 
	IL_0d46:  ldloc 25

	IL_0d4a:  nop 
	IL_0d4b:  nop 
	IL_0d4c:  ldloc 9

	IL_0d50:  nop 
	IL_0d51:  nop 
	IL_0d52:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d57:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0d5c:  stloc 26

	IL_0d60:  nop 
	IL_0d61:  nop 
	IL_0d62:  ldloc 26

	IL_0d66:  nop 
	IL_0d67:  nop 
	IL_0d68:  ldc.i4 1
	IL_0d6d:  beq IL_0dd0

	IL_0d72:  br IL_0d77

	IL_0d77:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0d7c:  stloc 10

	IL_0d80:  nop 
	IL_0d81:  nop 
	IL_0d82:  ldloc 10

	IL_0d86:  nop 
	IL_0d87:  nop 
	IL_0d88:  ldloc 9

	IL_0d8c:  nop 
	IL_0d8d:  nop 
	IL_0d8e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0d93:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0d98:  ldloc 10

	IL_0d9c:  nop 
	IL_0d9d:  nop 
	IL_0d9e:  ldloc 9

	IL_0da2:  nop 
	IL_0da3:  nop 
	IL_0da4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0da9:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0dae:  ldarg 1

	IL_0db2:  nop 
	IL_0db3:  nop 
	IL_0db4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0db9:  ldloc 1

	IL_0dbd:  nop 
	IL_0dbe:  nop 
	IL_0dbf:  conv.u 
	IL_0dc0:  ldloc 10

	IL_0dc4:  nop 
	IL_0dc5:  nop 
	IL_0dc6:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0dcb:  br IL_0dd5

	IL_0dd0:  br IL_0dd5

	IL_0dd5:  ldarg.0 
	IL_0dd6:  ldarg 1

	IL_0dda:  nop 
	IL_0ddb:  nop 
	IL_0ddc:  ldloc 1

	IL_0de0:  nop 
	IL_0de1:  nop 
	IL_0de2:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procNewCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_0de7:  starg 1

	IL_0deb:  nop 
	IL_0dec:  nop 
	IL_0ded:  ldarg 1

	IL_0df1:  nop 
	IL_0df2:  nop 
	IL_0df3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0df8:  ldlen 
	IL_0df9:  conv.i4 
	IL_0dfa:  ldc.i4 1
	IL_0dff:  sub 
	IL_0e00:  stloc 0

	IL_0e04:  nop 
	IL_0e05:  nop 
	IL_0e06:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok
	IL_0e0b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0e10:  stloc 25

	IL_0e14:  nop 
	IL_0e15:  nop 
	IL_0e16:  ldloc 25

	IL_0e1a:  nop 
	IL_0e1b:  nop 
	IL_0e1c:  ldarg 1

	IL_0e20:  nop 
	IL_0e21:  nop 
	IL_0e22:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0e27:  ldloc 1

	IL_0e2b:  nop 
	IL_0e2c:  nop 
	IL_0e2d:  conv.u 
	IL_0e2e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0e33:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0e38:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0e3d:  stloc 26

	IL_0e41:  nop 
	IL_0e42:  nop 
	IL_0e43:  ldloc 26

	IL_0e47:  nop 
	IL_0e48:  nop 
	IL_0e49:  ldc.i4 1
	IL_0e4e:  beq IL_0e58

	IL_0e53:  br IL_0f45

	IL_0e58:  ldarg 1

	IL_0e5c:  nop 
	IL_0e5d:  nop 
	IL_0e5e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0e63:  ldloc 1

	IL_0e67:  nop 
	IL_0e68:  nop 
	IL_0e69:  conv.u 
	IL_0e6a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0e6f:  stloc 42

	IL_0e73:  nop 
	IL_0e74:  nop 
	IL_0e75:  ldloc 42

	IL_0e79:  nop 
	IL_0e7a:  nop 
	IL_0e7b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0e80:  stloc 43

	IL_0e84:  nop 
	IL_0e85:  nop 
	IL_0e86:  ldloc 43

	IL_0e8a:  nop 
	IL_0e8b:  nop 
	IL_0e8c:  ldlen 
	IL_0e8d:  conv.i4 
	IL_0e8e:  ldc.i4 1
	IL_0e93:  sub 
	IL_0e94:  stloc 44

	IL_0e98:  nop 
	IL_0e99:  nop 
	IL_0e9a:  ldc.i4 -1
	IL_0e9f:  stloc 45

	IL_0ea3:  nop 
	IL_0ea4:  nop 
	IL_0ea5:  ldloc 44

	IL_0ea9:  nop 
	IL_0eaa:  nop 
	IL_0eab:  ldc.i4 0
	IL_0eb0:  blt IL_0eba

	IL_0eb5:  br IL_0ec4

	IL_0eba:  br IL_0f2f

	IL_0ebf:  br IL_0ec9

	IL_0ec4:  br IL_0ec9

	IL_0ec9:  ldloc 45

	IL_0ecd:  nop 
	IL_0ece:  nop 
	IL_0ecf:  ldc.i4 1
	IL_0ed4:  add 
	IL_0ed5:  stloc 45

	IL_0ed9:  nop 
	IL_0eda:  nop 
	IL_0edb:  ldloc 43

	IL_0edf:  nop 
	IL_0ee0:  nop 
	IL_0ee1:  ldloc 45

	IL_0ee5:  nop 
	IL_0ee6:  nop 
	IL_0ee7:  conv.u 
	IL_0ee8:  ldarg.0 
	IL_0ee9:  ldloc 43

	IL_0eed:  nop 
	IL_0eee:  nop 
	IL_0eef:  ldloc 45

	IL_0ef3:  nop 
	IL_0ef4:  nop 
	IL_0ef5:  conv.u 
	IL_0ef6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0efb:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0f00:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0f05:  ldloc 45

	IL_0f09:  nop 
	IL_0f0a:  nop 
	IL_0f0b:  ldloc 44

	IL_0f0f:  nop 
	IL_0f10:  nop 
	IL_0f11:  beq IL_0f1b

	IL_0f16:  br IL_0f25

	IL_0f1b:  br IL_0f2f

	IL_0f20:  br IL_0f2f

	IL_0f25:  br IL_0ec9

	IL_0f2a:  br IL_0f2f

	IL_0f2f:  ldloc 42

	IL_0f33:  nop 
	IL_0f34:  nop 
	IL_0f35:  ldloc 43

	IL_0f39:  nop 
	IL_0f3a:  nop 
	IL_0f3b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0f40:  br IL_0f83

	IL_0f45:  ldarg 1

	IL_0f49:  nop 
	IL_0f4a:  nop 
	IL_0f4b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0f50:  ldloc 1

	IL_0f54:  nop 
	IL_0f55:  nop 
	IL_0f56:  conv.u 
	IL_0f57:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0f5c:  stloc 46

	IL_0f60:  nop 
	IL_0f61:  nop 
	IL_0f62:  ldloc 46

	IL_0f66:  nop 
	IL_0f67:  nop 
	IL_0f68:  ldarg.0 
	IL_0f69:  ldloc 46

	IL_0f6d:  nop 
	IL_0f6e:  nop 
	IL_0f6f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_0f74:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0f79:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_0f7e:  br IL_0f83

	IL_0f83:  br IL_19df

	IL_0f88:  br IL_0f92

	IL_0f8d:  br IL_0f92

	IL_0f92:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok
	IL_0f97:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0f9c:  stloc 25

	IL_0fa0:  nop 
	IL_0fa1:  nop 
	IL_0fa2:  ldloc 25

	IL_0fa6:  nop 
	IL_0fa7:  nop 
	IL_0fa8:  ldloc 24

	IL_0fac:  nop 
	IL_0fad:  nop 
	IL_0fae:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0fb3:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0fb8:  stloc 26

	IL_0fbc:  nop 
	IL_0fbd:  nop 
	IL_0fbe:  ldloc 26

	IL_0fc2:  nop 
	IL_0fc3:  nop 
	IL_0fc4:  ldc.i4 1
	IL_0fc9:  beq IL_0fd3

	IL_0fce:  br IL_1106

	IL_0fd3:  ldarg 1

	IL_0fd7:  nop 
	IL_0fd8:  nop 
	IL_0fd9:  ldloc 1

	IL_0fdd:  nop 
	IL_0fde:  nop 
	IL_0fdf:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0fe4:  ldloc 0

	IL_0fe8:  nop 
	IL_0fe9:  nop 
	IL_0fea:  ldc.i4 1
	IL_0fef:  sub 
	IL_0ff0:  stloc 0

	IL_0ff4:  nop 
	IL_0ff5:  nop 
	IL_0ff6:  ldarg 1

	IL_0ffa:  nop 
	IL_0ffb:  nop 
	IL_0ffc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1001:  ldloc 1

	IL_1005:  nop 
	IL_1006:  nop 
	IL_1007:  conv.u 
	IL_1008:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_100d:  stloc 11

	IL_1011:  nop 
	IL_1012:  nop 
	IL_1013:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_1018:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_101d:  stloc 25

	IL_1021:  nop 
	IL_1022:  nop 
	IL_1023:  ldloc 25

	IL_1027:  nop 
	IL_1028:  nop 
	IL_1029:  ldloc 11

	IL_102d:  nop 
	IL_102e:  nop 
	IL_102f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1034:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1039:  stloc 26

	IL_103d:  nop 
	IL_103e:  nop 
	IL_103f:  ldloc 26

	IL_1043:  nop 
	IL_1044:  nop 
	IL_1045:  ldc.i4 1
	IL_104a:  beq IL_10ad

	IL_104f:  br IL_1054

	IL_1054:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_1059:  stloc 12

	IL_105d:  nop 
	IL_105e:  nop 
	IL_105f:  ldloc 12

	IL_1063:  nop 
	IL_1064:  nop 
	IL_1065:  ldloc 11

	IL_1069:  nop 
	IL_106a:  nop 
	IL_106b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1070:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1075:  ldloc 12

	IL_1079:  nop 
	IL_107a:  nop 
	IL_107b:  ldloc 11

	IL_107f:  nop 
	IL_1080:  nop 
	IL_1081:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1086:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_108b:  ldarg 1

	IL_108f:  nop 
	IL_1090:  nop 
	IL_1091:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1096:  ldloc 1

	IL_109a:  nop 
	IL_109b:  nop 
	IL_109c:  conv.u 
	IL_109d:  ldloc 12

	IL_10a1:  nop 
	IL_10a2:  nop 
	IL_10a3:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_10a8:  br IL_10b2

	IL_10ad:  br IL_10b2

	IL_10b2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::'.ctor'()
	IL_10b7:  stloc 47

	IL_10bb:  nop 
	IL_10bc:  nop 
	IL_10bd:  ldloc 47

	IL_10c1:  nop 
	IL_10c2:  nop 
	IL_10c3:  ldarg 1

	IL_10c7:  nop 
	IL_10c8:  nop 
	IL_10c9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_10ce:  ldloc 1

	IL_10d2:  nop 
	IL_10d3:  nop 
	IL_10d4:  conv.u 
	IL_10d5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_10da:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_10df:  ldarg 1

	IL_10e3:  nop 
	IL_10e4:  nop 
	IL_10e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_10ea:  ldloc 1

	IL_10ee:  nop 
	IL_10ef:  nop 
	IL_10f0:  conv.u 
	IL_10f1:  ldloc 47

	IL_10f5:  nop 
	IL_10f6:  nop 
	IL_10f7:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_10fc:  br IL_19df

	IL_1101:  br IL_110b

	IL_1106:  br IL_110b

	IL_110b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrTok
	IL_1110:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1115:  stloc 25

	IL_1119:  nop 
	IL_111a:  nop 
	IL_111b:  ldloc 25

	IL_111f:  nop 
	IL_1120:  nop 
	IL_1121:  ldloc 24

	IL_1125:  nop 
	IL_1126:  nop 
	IL_1127:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_112c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1131:  stloc 26

	IL_1135:  nop 
	IL_1136:  nop 
	IL_1137:  ldloc 26

	IL_113b:  nop 
	IL_113c:  nop 
	IL_113d:  ldc.i4 1
	IL_1142:  beq IL_114c

	IL_1147:  br IL_12ca

	IL_114c:  ldarg 1

	IL_1150:  nop 
	IL_1151:  nop 
	IL_1152:  ldloc 1

	IL_1156:  nop 
	IL_1157:  nop 
	IL_1158:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_115d:  ldloc 0

	IL_1161:  nop 
	IL_1162:  nop 
	IL_1163:  ldc.i4 1
	IL_1168:  sub 
	IL_1169:  stloc 0

	IL_116d:  nop 
	IL_116e:  nop 
	IL_116f:  ldarg 1

	IL_1173:  nop 
	IL_1174:  nop 
	IL_1175:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_117a:  ldloc 1

	IL_117e:  nop 
	IL_117f:  nop 
	IL_1180:  conv.u 
	IL_1181:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1186:  stloc 24

	IL_118a:  nop 
	IL_118b:  nop 
	IL_118c:  ldarg 1

	IL_1190:  nop 
	IL_1191:  nop 
	IL_1192:  ldloc 1

	IL_1196:  nop 
	IL_1197:  nop 
	IL_1198:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_119d:  ldloc 0

	IL_11a1:  nop 
	IL_11a2:  nop 
	IL_11a3:  ldc.i4 1
	IL_11a8:  sub 
	IL_11a9:  stloc 0

	IL_11ad:  nop 
	IL_11ae:  nop 
	IL_11af:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_11b4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_11b9:  stloc 25

	IL_11bd:  nop 
	IL_11be:  nop 
	IL_11bf:  ldloc 25

	IL_11c3:  nop 
	IL_11c4:  nop 
	IL_11c5:  ldloc 24

	IL_11c9:  nop 
	IL_11ca:  nop 
	IL_11cb:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_11d0:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_11d5:  stloc 26

	IL_11d9:  nop 
	IL_11da:  nop 
	IL_11db:  ldloc 26

	IL_11df:  nop 
	IL_11e0:  nop 
	IL_11e1:  ldc.i4 1
	IL_11e6:  beq IL_122c

	IL_11eb:  br IL_11f0

	IL_11f0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_11f5:  stloc 17

	IL_11f9:  nop 
	IL_11fa:  nop 
	IL_11fb:  ldloc 17

	IL_11ff:  nop 
	IL_1200:  nop 
	IL_1201:  ldloc 24

	IL_1205:  nop 
	IL_1206:  nop 
	IL_1207:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_120c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1211:  ldloc 17

	IL_1215:  nop 
	IL_1216:  nop 
	IL_1217:  ldloc 24

	IL_121b:  nop 
	IL_121c:  nop 
	IL_121d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1222:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1227:  br IL_123d

	IL_122c:  ldloc 24

	IL_1230:  nop 
	IL_1231:  nop 
	IL_1232:  stloc 17

	IL_1236:  nop 
	IL_1237:  nop 
	IL_1238:  br IL_123d

	IL_123d:  ldarg 1

	IL_1241:  nop 
	IL_1242:  nop 
	IL_1243:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1248:  ldloc 1

	IL_124c:  nop 
	IL_124d:  nop 
	IL_124e:  conv.u 
	IL_124f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1254:  stloc 15

	IL_1258:  nop 
	IL_1259:  nop 
	IL_125a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::'.ctor'()
	IL_125f:  stloc 48

	IL_1263:  nop 
	IL_1264:  nop 
	IL_1265:  ldloc 48

	IL_1269:  nop 
	IL_126a:  nop 
	IL_126b:  ldloc 17

	IL_126f:  nop 
	IL_1270:  nop 
	IL_1271:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_1276:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_127b:  stloc 16

	IL_127f:  nop 
	IL_1280:  nop 
	IL_1281:  ldloc 16

	IL_1285:  nop 
	IL_1286:  nop 
	IL_1287:  ldloc 15

	IL_128b:  nop 
	IL_128c:  nop 
	IL_128d:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_1292:  ldloc 48

	IL_1296:  nop 
	IL_1297:  nop 
	IL_1298:  ldloc 16

	IL_129c:  nop 
	IL_129d:  nop 
	IL_129e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_12a3:  ldarg 1

	IL_12a7:  nop 
	IL_12a8:  nop 
	IL_12a9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_12ae:  ldloc 1

	IL_12b2:  nop 
	IL_12b3:  nop 
	IL_12b4:  conv.u 
	IL_12b5:  ldloc 48

	IL_12b9:  nop 
	IL_12ba:  nop 
	IL_12bb:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_12c0:  br IL_19df

	IL_12c5:  br IL_12cf

	IL_12ca:  br IL_12cf

	IL_12cf:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok
	IL_12d4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_12d9:  stloc 25

	IL_12dd:  nop 
	IL_12de:  nop 
	IL_12df:  ldloc 25

	IL_12e3:  nop 
	IL_12e4:  nop 
	IL_12e5:  ldloc 24

	IL_12e9:  nop 
	IL_12ea:  nop 
	IL_12eb:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_12f0:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_12f5:  stloc 26

	IL_12f9:  nop 
	IL_12fa:  nop 
	IL_12fb:  ldloc 26

	IL_12ff:  nop 
	IL_1300:  nop 
	IL_1301:  ldc.i4 1
	IL_1306:  beq IL_1310

	IL_130b:  br IL_1512

	IL_1310:  ldarg 1

	IL_1314:  nop 
	IL_1315:  nop 
	IL_1316:  ldloc 1

	IL_131a:  nop 
	IL_131b:  nop 
	IL_131c:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1321:  ldloc 0

	IL_1325:  nop 
	IL_1326:  nop 
	IL_1327:  ldc.i4 1
	IL_132c:  sub 
	IL_132d:  stloc 0

	IL_1331:  nop 
	IL_1332:  nop 
	IL_1333:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_1338:  stloc 14

	IL_133c:  nop 
	IL_133d:  nop 
	IL_133e:  ldarg.0 
	IL_133f:  ldarg 1

	IL_1343:  nop 
	IL_1344:  nop 
	IL_1345:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_134a:  ldloc 1

	IL_134e:  nop 
	IL_134f:  nop 
	IL_1350:  conv.u 
	IL_1351:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1356:  ldloc 14

	IL_135a:  nop 
	IL_135b:  nop 
	IL_135c:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok class dylan.NET.Tokenizer.Parser.ExprOptimizer::IdentToMNTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok)
	IL_1361:  stloc 14

	IL_1365:  nop 
	IL_1366:  nop 
	IL_1367:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::'.ctor'()
	IL_136c:  stloc 49

	IL_1370:  nop 
	IL_1371:  nop 
	IL_1372:  ldloc 49

	IL_1376:  nop 
	IL_1377:  nop 
	IL_1378:  ldloc 14

	IL_137c:  nop 
	IL_137d:  nop 
	IL_137e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_1383:  ldarg 1

	IL_1387:  nop 
	IL_1388:  nop 
	IL_1389:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_138e:  ldloc 1

	IL_1392:  nop 
	IL_1393:  nop 
	IL_1394:  conv.u 
	IL_1395:  ldloc 49

	IL_1399:  nop 
	IL_139a:  nop 
	IL_139b:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_13a0:  ldloc 1

	IL_13a4:  nop 
	IL_13a5:  nop 
	IL_13a6:  ldc.i4 1
	IL_13ab:  add 
	IL_13ac:  stloc 1

	IL_13b0:  nop 
	IL_13b1:  nop 
	IL_13b2:  ldloc 1

	IL_13b6:  nop 
	IL_13b7:  nop 
	IL_13b8:  ldloc 0

	IL_13bc:  nop 
	IL_13bd:  nop 
	IL_13be:  ble IL_13c8

	IL_13c3:  br IL_1503

	IL_13c8:  ldarg 1

	IL_13cc:  nop 
	IL_13cd:  nop 
	IL_13ce:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_13d3:  ldloc 1

	IL_13d7:  nop 
	IL_13d8:  nop 
	IL_13d9:  conv.u 
	IL_13da:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_13df:  stloc 24

	IL_13e3:  nop 
	IL_13e4:  nop 
	IL_13e5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_13ea:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_13ef:  stloc 25

	IL_13f3:  nop 
	IL_13f4:  nop 
	IL_13f5:  ldloc 25

	IL_13f9:  nop 
	IL_13fa:  nop 
	IL_13fb:  ldloc 24

	IL_13ff:  nop 
	IL_1400:  nop 
	IL_1401:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1406:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_140b:  stloc 26

	IL_140f:  nop 
	IL_1410:  nop 
	IL_1411:  ldloc 26

	IL_1415:  nop 
	IL_1416:  nop 
	IL_1417:  ldc.i4 1
	IL_141c:  beq IL_1426

	IL_1421:  br IL_14f9

	IL_1426:  ldarg 1

	IL_142a:  nop 
	IL_142b:  nop 
	IL_142c:  ldloc 1

	IL_1430:  nop 
	IL_1431:  nop 
	IL_1432:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1437:  ldloc 0

	IL_143b:  nop 
	IL_143c:  nop 
	IL_143d:  ldc.i4 1
	IL_1442:  sub 
	IL_1443:  stloc 0

	IL_1447:  nop 
	IL_1448:  nop 
	IL_1449:  ldloc 1

	IL_144d:  nop 
	IL_144e:  nop 
	IL_144f:  ldloc 0

	IL_1453:  nop 
	IL_1454:  nop 
	IL_1455:  ble IL_145f

	IL_145a:  br IL_14ef

	IL_145f:  ldarg 1

	IL_1463:  nop 
	IL_1464:  nop 
	IL_1465:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_146a:  ldloc 1

	IL_146e:  nop 
	IL_146f:  nop 
	IL_1470:  conv.u 
	IL_1471:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1476:  stloc 24

	IL_147a:  nop 
	IL_147b:  nop 
	IL_147c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_1481:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1486:  stloc 25

	IL_148a:  nop 
	IL_148b:  nop 
	IL_148c:  ldloc 25

	IL_1490:  nop 
	IL_1491:  nop 
	IL_1492:  ldloc 24

	IL_1496:  nop 
	IL_1497:  nop 
	IL_1498:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_149d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_14a2:  stloc 26

	IL_14a6:  nop 
	IL_14a7:  nop 
	IL_14a8:  ldloc 26

	IL_14ac:  nop 
	IL_14ad:  nop 
	IL_14ae:  ldc.i4 1
	IL_14b3:  beq IL_14bd

	IL_14b8:  br IL_14e5

	IL_14bd:  ldarg 1

	IL_14c1:  nop 
	IL_14c2:  nop 
	IL_14c3:  ldloc 1

	IL_14c7:  nop 
	IL_14c8:  nop 
	IL_14c9:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_14ce:  ldloc 0

	IL_14d2:  nop 
	IL_14d3:  nop 
	IL_14d4:  ldc.i4 1
	IL_14d9:  sub 
	IL_14da:  stloc 0

	IL_14de:  nop 
	IL_14df:  nop 
	IL_14e0:  br IL_14ea

	IL_14e5:  br IL_14ea

	IL_14ea:  br IL_14f4

	IL_14ef:  br IL_14f4

	IL_14f4:  br IL_14fe

	IL_14f9:  br IL_14fe

	IL_14fe:  br IL_1508

	IL_1503:  br IL_1508

	IL_1508:  br IL_19df

	IL_150d:  br IL_1517

	IL_1512:  br IL_1517

	IL_1517:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_151c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1521:  stloc 25

	IL_1525:  nop 
	IL_1526:  nop 
	IL_1527:  ldloc 25

	IL_152b:  nop 
	IL_152c:  nop 
	IL_152d:  ldloc 24

	IL_1531:  nop 
	IL_1532:  nop 
	IL_1533:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1538:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_153d:  stloc 26

	IL_1541:  nop 
	IL_1542:  nop 
	IL_1543:  ldloc 26

	IL_1547:  nop 
	IL_1548:  nop 
	IL_1549:  ldc.i4 1
	IL_154e:  beq IL_1558

	IL_1553:  br IL_174f

	IL_1558:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_155d:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1562:  or 
	IL_1563:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1568:  or 
	IL_1569:  stloc 26

	IL_156d:  nop 
	IL_156e:  nop 
	IL_156f:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1574:  ldc.i4 1
	IL_1579:  beq IL_1583

	IL_157e:  br IL_171f

	IL_1583:  ldc.i4 0
	IL_1588:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_158d:  ldloc 26

	IL_1591:  nop 
	IL_1592:  nop 
	IL_1593:  ldc.i4 1
	IL_1598:  beq IL_15a2

	IL_159d:  br IL_15b2

	IL_15a2:  ldc.i4 1
	IL_15a7:  stloc 4

	IL_15ab:  nop 
	IL_15ac:  nop 
	IL_15ad:  br IL_15b7

	IL_15b2:  br IL_15b7

	IL_15b7:  ldc.i4 1
	IL_15bc:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_15c1:  ldarg.0 
	IL_15c2:  ldarg 1

	IL_15c6:  nop 
	IL_15c7:  nop 
	IL_15c8:  ldloc 1

	IL_15cc:  nop 
	IL_15cd:  nop 
	IL_15ce:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMethodCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_15d3:  starg 1

	IL_15d7:  nop 
	IL_15d8:  nop 
	IL_15d9:  ldloc 1

	IL_15dd:  nop 
	IL_15de:  nop 
	IL_15df:  ldc.i4 1
	IL_15e4:  sub 
	IL_15e5:  stloc 1

	IL_15e9:  nop 
	IL_15ea:  nop 
	IL_15eb:  ldarg 1

	IL_15ef:  nop 
	IL_15f0:  nop 
	IL_15f1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_15f6:  ldlen 
	IL_15f7:  conv.i4 
	IL_15f8:  ldc.i4 1
	IL_15fd:  sub 
	IL_15fe:  stloc 0

	IL_1602:  nop 
	IL_1603:  nop 
	IL_1604:  ldarg 1

	IL_1608:  nop 
	IL_1609:  nop 
	IL_160a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_160f:  ldloc 1

	IL_1613:  nop 
	IL_1614:  nop 
	IL_1615:  conv.u 
	IL_1616:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_161b:  stloc 50

	IL_161f:  nop 
	IL_1620:  nop 
	IL_1621:  ldloc 50

	IL_1625:  nop 
	IL_1626:  nop 
	IL_1627:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_162c:  stloc 51

	IL_1630:  nop 
	IL_1631:  nop 
	IL_1632:  ldloc 51

	IL_1636:  nop 
	IL_1637:  nop 
	IL_1638:  ldlen 
	IL_1639:  conv.i4 
	IL_163a:  ldc.i4 1
	IL_163f:  sub 
	IL_1640:  stloc 52

	IL_1644:  nop 
	IL_1645:  nop 
	IL_1646:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_164b:  stloc 5

	IL_164f:  nop 
	IL_1650:  nop 
	IL_1651:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1656:  stloc 6

	IL_165a:  nop 
	IL_165b:  nop 
	IL_165c:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1661:  stloc 7

	IL_1665:  nop 
	IL_1666:  nop 
	IL_1667:  ldc.i4 -1
	IL_166c:  stloc 53

	IL_1670:  nop 
	IL_1671:  nop 
	IL_1672:  ldloc 52

	IL_1676:  nop 
	IL_1677:  nop 
	IL_1678:  ldc.i4 0
	IL_167d:  blt IL_1687

	IL_1682:  br IL_1691

	IL_1687:  br IL_171a

	IL_168c:  br IL_1696

	IL_1691:  br IL_1696

	IL_1696:  ldloc 53

	IL_169a:  nop 
	IL_169b:  nop 
	IL_169c:  ldc.i4 1
	IL_16a1:  add 
	IL_16a2:  stloc 53

	IL_16a6:  nop 
	IL_16a7:  nop 
	IL_16a8:  ldc.i4 0
	IL_16ad:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_16b2:  ldc.i4 0
	IL_16b7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_16bc:  ldc.i4 0
	IL_16c1:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_16c6:  ldloc 51

	IL_16ca:  nop 
	IL_16cb:  nop 
	IL_16cc:  ldloc 53

	IL_16d0:  nop 
	IL_16d1:  nop 
	IL_16d2:  conv.u 
	IL_16d3:  ldarg.0 
	IL_16d4:  ldloc 51

	IL_16d8:  nop 
	IL_16d9:  nop 
	IL_16da:  ldloc 53

	IL_16de:  nop 
	IL_16df:  nop 
	IL_16e0:  conv.u 
	IL_16e1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_16e6:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_16eb:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_16f0:  ldloc 53

	IL_16f4:  nop 
	IL_16f5:  nop 
	IL_16f6:  ldloc 52

	IL_16fa:  nop 
	IL_16fb:  nop 
	IL_16fc:  beq IL_1706

	IL_1701:  br IL_1710

	IL_1706:  br IL_171a

	IL_170b:  br IL_171a

	IL_1710:  br IL_1696

	IL_1715:  br IL_171a

	IL_171a:  br IL_1724

	IL_171f:  br IL_1724

	IL_1724:  ldloc 5

	IL_1728:  nop 
	IL_1729:  nop 
	IL_172a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_172f:  ldloc 6

	IL_1733:  nop 
	IL_1734:  nop 
	IL_1735:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_173a:  ldloc 7

	IL_173e:  nop 
	IL_173f:  nop 
	IL_1740:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1745:  br IL_19df

	IL_174a:  br IL_1754

	IL_174f:  br IL_1754

	IL_1754:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
	IL_1759:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_175e:  stloc 25

	IL_1762:  nop 
	IL_1763:  nop 
	IL_1764:  ldloc 25

	IL_1768:  nop 
	IL_1769:  nop 
	IL_176a:  ldloc 24

	IL_176e:  nop 
	IL_176f:  nop 
	IL_1770:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1775:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_177a:  stloc 26

	IL_177e:  nop 
	IL_177f:  nop 
	IL_1780:  ldloc 26

	IL_1784:  nop 
	IL_1785:  nop 
	IL_1786:  ldc.i4 1
	IL_178b:  beq IL_1795

	IL_1790:  br IL_1992

	IL_1795:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_179a:  ldc.i4 1
	IL_179f:  beq IL_17a9

	IL_17a4:  br IL_1851

	IL_17a9:  ldc.i4 0
	IL_17ae:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_17b3:  ldarg.0 
	IL_17b4:  ldarg 1

	IL_17b8:  nop 
	IL_17b9:  nop 
	IL_17ba:  ldloc 1

	IL_17be:  nop 
	IL_17bf:  nop 
	IL_17c0:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procIdentArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_17c5:  starg 1

	IL_17c9:  nop 
	IL_17ca:  nop 
	IL_17cb:  ldloc 1

	IL_17cf:  nop 
	IL_17d0:  nop 
	IL_17d1:  ldc.i4 1
	IL_17d6:  sub 
	IL_17d7:  stloc 1

	IL_17db:  nop 
	IL_17dc:  nop 
	IL_17dd:  ldarg 1

	IL_17e1:  nop 
	IL_17e2:  nop 
	IL_17e3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_17e8:  ldlen 
	IL_17e9:  conv.i4 
	IL_17ea:  ldc.i4 1
	IL_17ef:  sub 
	IL_17f0:  stloc 0

	IL_17f4:  nop 
	IL_17f5:  nop 
	IL_17f6:  ldarg 1

	IL_17fa:  nop 
	IL_17fb:  nop 
	IL_17fc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1801:  ldloc 1

	IL_1805:  nop 
	IL_1806:  nop 
	IL_1807:  conv.u 
	IL_1808:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_180d:  stloc 54

	IL_1811:  nop 
	IL_1812:  nop 
	IL_1813:  ldloc 54

	IL_1817:  nop 
	IL_1818:  nop 
	IL_1819:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_181e:  stloc 55

	IL_1822:  nop 
	IL_1823:  nop 
	IL_1824:  ldarg.0 
	IL_1825:  ldloc 55

	IL_1829:  nop 
	IL_182a:  nop 
	IL_182b:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1830:  stloc 55

	IL_1834:  nop 
	IL_1835:  nop 
	IL_1836:  ldc.i4 1
	IL_183b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1840:  ldloc 1

	IL_1844:  nop 
	IL_1845:  nop 
	IL_1846:  stloc 2

	IL_184a:  nop 
	IL_184b:  nop 
	IL_184c:  br IL_1988

	IL_1851:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1856:  ldc.i4 1
	IL_185b:  beq IL_1865

	IL_1860:  br IL_197e

	IL_1865:  ldc.i4 0
	IL_186a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_186f:  ldarg.0 
	IL_1870:  ldarg 1

	IL_1874:  nop 
	IL_1875:  nop 
	IL_1876:  ldloc 1

	IL_187a:  nop 
	IL_187b:  nop 
	IL_187c:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMtdArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_1881:  starg 1

	IL_1885:  nop 
	IL_1886:  nop 
	IL_1887:  ldloc 1

	IL_188b:  nop 
	IL_188c:  nop 
	IL_188d:  ldc.i4 1
	IL_1892:  sub 
	IL_1893:  stloc 1

	IL_1897:  nop 
	IL_1898:  nop 
	IL_1899:  ldarg 1

	IL_189d:  nop 
	IL_189e:  nop 
	IL_189f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_18a4:  ldlen 
	IL_18a5:  conv.i4 
	IL_18a6:  ldc.i4 1
	IL_18ab:  sub 
	IL_18ac:  stloc 0

	IL_18b0:  nop 
	IL_18b1:  nop 
	IL_18b2:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_18b7:  stloc 5

	IL_18bb:  nop 
	IL_18bc:  nop 
	IL_18bd:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_18c2:  stloc 6

	IL_18c6:  nop 
	IL_18c7:  nop 
	IL_18c8:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_18cd:  stloc 7

	IL_18d1:  nop 
	IL_18d2:  nop 
	IL_18d3:  ldarg 1

	IL_18d7:  nop 
	IL_18d8:  nop 
	IL_18d9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_18de:  ldloc 1

	IL_18e2:  nop 
	IL_18e3:  nop 
	IL_18e4:  conv.u 
	IL_18e5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_18ea:  stloc 56

	IL_18ee:  nop 
	IL_18ef:  nop 
	IL_18f0:  ldloc 56

	IL_18f4:  nop 
	IL_18f5:  nop 
	IL_18f6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_18fb:  stloc 57

	IL_18ff:  nop 
	IL_1900:  nop 
	IL_1901:  ldloc 57

	IL_1905:  nop 
	IL_1906:  nop 
	IL_1907:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_190c:  stloc 55

	IL_1910:  nop 
	IL_1911:  nop 
	IL_1912:  ldc.i4 0
	IL_1917:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_191c:  ldc.i4 0
	IL_1921:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1926:  ldc.i4 0
	IL_192b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1930:  ldarg.0 
	IL_1931:  ldloc 55

	IL_1935:  nop 
	IL_1936:  nop 
	IL_1937:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_193c:  stloc 55

	IL_1940:  nop 
	IL_1941:  nop 
	IL_1942:  ldloc 5

	IL_1946:  nop 
	IL_1947:  nop 
	IL_1948:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_194d:  ldloc 6

	IL_1951:  nop 
	IL_1952:  nop 
	IL_1953:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1958:  ldloc 7

	IL_195c:  nop 
	IL_195d:  nop 
	IL_195e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1963:  ldc.i4 1
	IL_1968:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_196d:  ldloc 1

	IL_1971:  nop 
	IL_1972:  nop 
	IL_1973:  stloc 2

	IL_1977:  nop 
	IL_1978:  nop 
	IL_1979:  br IL_1983

	IL_197e:  br IL_1983

	IL_1983:  br IL_1988

	IL_1988:  br IL_19df

	IL_198d:  br IL_1997

	IL_1992:  br IL_1997

	IL_1997:  ldloc 1

	IL_199b:  nop 
	IL_199c:  nop 
	IL_199d:  ldloc 2

	IL_19a1:  nop 
	IL_19a2:  nop 
	IL_19a3:  bgt IL_19ad

	IL_19a8:  br IL_19d0

	IL_19ad:  ldc.i4 0
	IL_19b2:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_19b7:  ldc.i4 0
	IL_19bc:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_19c1:  ldc.i4 0
	IL_19c6:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_19cb:  br IL_19d5

	IL_19d0:  br IL_19d5

	IL_19d5:  br IL_19df

	IL_19da:  br IL_19df

	IL_19df:  ldloc 1

	IL_19e3:  nop 
	IL_19e4:  nop 
	IL_19e5:  ldloc 0

	IL_19e9:  nop 
	IL_19ea:  nop 
	IL_19eb:  bge IL_19f5

	IL_19f0:  br IL_19ff

	IL_19f5:  br IL_1e87

	IL_19fa:  br IL_1a09

	IL_19ff:  br IL_00fe

	IL_1a04:  br IL_1a09

	IL_1a09:  br IL_1e87

	IL_1a0e:  ldloc 1

	IL_1a12:  nop 
	IL_1a13:  nop 
	IL_1a14:  ldc.i4 1
	IL_1a19:  sub 
	IL_1a1a:  stloc 1

	IL_1a1e:  nop 
	IL_1a1f:  nop 
	IL_1a20:  ldarg 1

	IL_1a24:  nop 
	IL_1a25:  nop 
	IL_1a26:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1a2b:  ldloc 1

	IL_1a2f:  nop 
	IL_1a30:  nop 
	IL_1a31:  conv.u 
	IL_1a32:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1a37:  stloc 8

	IL_1a3b:  nop 
	IL_1a3c:  nop 
	IL_1a3d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_1a42:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1a47:  stloc 25

	IL_1a4b:  nop 
	IL_1a4c:  nop 
	IL_1a4d:  ldloc 25

	IL_1a51:  nop 
	IL_1a52:  nop 
	IL_1a53:  ldloc 8

	IL_1a57:  nop 
	IL_1a58:  nop 
	IL_1a59:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1a5e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1a63:  stloc 26

	IL_1a67:  nop 
	IL_1a68:  nop 
	IL_1a69:  ldloc 26

	IL_1a6d:  nop 
	IL_1a6e:  nop 
	IL_1a6f:  ldc.i4 1
	IL_1a74:  beq IL_1a7e

	IL_1a79:  br IL_1ba6

	IL_1a7e:  ldloc 8

	IL_1a82:  nop 
	IL_1a83:  nop 
	IL_1a84:  stloc 19

	IL_1a88:  nop 
	IL_1a89:  nop 
	IL_1a8a:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1a8f:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1a94:  or 
	IL_1a95:  stloc 26

	IL_1a99:  nop 
	IL_1a9a:  nop 
	IL_1a9b:  ldloc 26

	IL_1a9f:  nop 
	IL_1aa0:  nop 
	IL_1aa1:  ldc.i4 1
	IL_1aa6:  beq IL_1ab0

	IL_1aab:  br IL_1b47

	IL_1ab0:  ldc.i4 0
	IL_1ab5:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1aba:  ldc.i4 0
	IL_1abf:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1ac4:  ldloc 1

	IL_1ac8:  nop 
	IL_1ac9:  nop 
	IL_1aca:  ldc.i4 1
	IL_1acf:  add 
	IL_1ad0:  stloc 23

	IL_1ad4:  nop 
	IL_1ad5:  nop 
	IL_1ad6:  ldarg 1

	IL_1ada:  nop 
	IL_1adb:  nop 
	IL_1adc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1ae1:  ldloc 23

	IL_1ae5:  nop 
	IL_1ae6:  nop 
	IL_1ae7:  conv.u 
	IL_1ae8:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1aed:  stloc 18

	IL_1af1:  nop 
	IL_1af2:  nop 
	IL_1af3:  ldloc 19

	IL_1af7:  nop 
	IL_1af8:  nop 
	IL_1af9:  ldc.i4 1
	IL_1afe:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1b03:  ldloc 19

	IL_1b07:  nop 
	IL_1b08:  nop 
	IL_1b09:  ldloc 18

	IL_1b0d:  nop 
	IL_1b0e:  nop 
	IL_1b0f:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_1b14:  ldarg 1

	IL_1b18:  nop 
	IL_1b19:  nop 
	IL_1b1a:  ldloc 23

	IL_1b1e:  nop 
	IL_1b1f:  nop 
	IL_1b20:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1b25:  ldarg 1

	IL_1b29:  nop 
	IL_1b2a:  nop 
	IL_1b2b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1b30:  ldloc 1

	IL_1b34:  nop 
	IL_1b35:  nop 
	IL_1b36:  conv.u 
	IL_1b37:  ldloc 19

	IL_1b3b:  nop 
	IL_1b3c:  nop 
	IL_1b3d:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1b42:  br IL_1b4c

	IL_1b47:  br IL_1b4c

	IL_1b4c:  ldloc 19

	IL_1b50:  nop 
	IL_1b51:  nop 
	IL_1b52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b57:  stloc 27

	IL_1b5b:  nop 
	IL_1b5c:  nop 
	IL_1b5d:  ldloc 27

	IL_1b61:  nop 
	IL_1b62:  nop 
	IL_1b63:  ldstr "^::(.)*$"
	IL_1b68:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1b6d:  stloc 26

	IL_1b71:  nop 
	IL_1b72:  nop 
	IL_1b73:  ldloc 26

	IL_1b77:  nop 
	IL_1b78:  nop 
	IL_1b79:  ldc.i4 1
	IL_1b7e:  beq IL_1b88

	IL_1b83:  br IL_1b97

	IL_1b88:  ldc.i4 1
	IL_1b8d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1b92:  br IL_1b9c

	IL_1b97:  br IL_1b9c

	IL_1b9c:  br IL_1e59

	IL_1ba1:  br IL_1bab

	IL_1ba6:  br IL_1bab

	IL_1bab:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_1bb0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1bb5:  stloc 25

	IL_1bb9:  nop 
	IL_1bba:  nop 
	IL_1bbb:  ldloc 25

	IL_1bbf:  nop 
	IL_1bc0:  nop 
	IL_1bc1:  ldloc 8

	IL_1bc5:  nop 
	IL_1bc6:  nop 
	IL_1bc7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1bcc:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1bd1:  stloc 26

	IL_1bd5:  nop 
	IL_1bd6:  nop 
	IL_1bd7:  ldloc 26

	IL_1bdb:  nop 
	IL_1bdc:  nop 
	IL_1bdd:  ldc.i4 1
	IL_1be2:  beq IL_1bec

	IL_1be7:  br IL_1d36

	IL_1bec:  ldloc 8

	IL_1bf0:  nop 
	IL_1bf1:  nop 
	IL_1bf2:  stloc 20

	IL_1bf6:  nop 
	IL_1bf7:  nop 
	IL_1bf8:  ldloc 20

	IL_1bfc:  nop 
	IL_1bfd:  nop 
	IL_1bfe:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1c03:  stloc 21

	IL_1c07:  nop 
	IL_1c08:  nop 
	IL_1c09:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1c0e:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1c13:  or 
	IL_1c14:  stloc 26

	IL_1c18:  nop 
	IL_1c19:  nop 
	IL_1c1a:  ldloc 26

	IL_1c1e:  nop 
	IL_1c1f:  nop 
	IL_1c20:  ldc.i4 1
	IL_1c25:  beq IL_1c2f

	IL_1c2a:  br IL_1cd7

	IL_1c2f:  ldc.i4 0
	IL_1c34:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1c39:  ldc.i4 0
	IL_1c3e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1c43:  ldloc 1

	IL_1c47:  nop 
	IL_1c48:  nop 
	IL_1c49:  ldc.i4 1
	IL_1c4e:  add 
	IL_1c4f:  stloc 23

	IL_1c53:  nop 
	IL_1c54:  nop 
	IL_1c55:  ldarg 1

	IL_1c59:  nop 
	IL_1c5a:  nop 
	IL_1c5b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1c60:  ldloc 23

	IL_1c64:  nop 
	IL_1c65:  nop 
	IL_1c66:  conv.u 
	IL_1c67:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1c6c:  stloc 18

	IL_1c70:  nop 
	IL_1c71:  nop 
	IL_1c72:  ldloc 21

	IL_1c76:  nop 
	IL_1c77:  nop 
	IL_1c78:  ldc.i4 1
	IL_1c7d:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1c82:  ldloc 21

	IL_1c86:  nop 
	IL_1c87:  nop 
	IL_1c88:  ldloc 18

	IL_1c8c:  nop 
	IL_1c8d:  nop 
	IL_1c8e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_1c93:  ldarg 1

	IL_1c97:  nop 
	IL_1c98:  nop 
	IL_1c99:  ldloc 23

	IL_1c9d:  nop 
	IL_1c9e:  nop 
	IL_1c9f:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1ca4:  ldloc 20

	IL_1ca8:  nop 
	IL_1ca9:  nop 
	IL_1caa:  ldloc 21

	IL_1cae:  nop 
	IL_1caf:  nop 
	IL_1cb0:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1cb5:  ldarg 1

	IL_1cb9:  nop 
	IL_1cba:  nop 
	IL_1cbb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1cc0:  ldloc 1

	IL_1cc4:  nop 
	IL_1cc5:  nop 
	IL_1cc6:  conv.u 
	IL_1cc7:  ldloc 20

	IL_1ccb:  nop 
	IL_1ccc:  nop 
	IL_1ccd:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1cd2:  br IL_1cdc

	IL_1cd7:  br IL_1cdc

	IL_1cdc:  ldloc 21

	IL_1ce0:  nop 
	IL_1ce1:  nop 
	IL_1ce2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ce7:  stloc 27

	IL_1ceb:  nop 
	IL_1cec:  nop 
	IL_1ced:  ldloc 27

	IL_1cf1:  nop 
	IL_1cf2:  nop 
	IL_1cf3:  ldstr "^::(.)*$"
	IL_1cf8:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1cfd:  stloc 26

	IL_1d01:  nop 
	IL_1d02:  nop 
	IL_1d03:  ldloc 26

	IL_1d07:  nop 
	IL_1d08:  nop 
	IL_1d09:  ldc.i4 1
	IL_1d0e:  beq IL_1d18

	IL_1d13:  br IL_1d27

	IL_1d18:  ldc.i4 1
	IL_1d1d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1d22:  br IL_1d2c

	IL_1d27:  br IL_1d2c

	IL_1d2c:  br IL_1e59

	IL_1d31:  br IL_1d3b

	IL_1d36:  br IL_1d3b

	IL_1d3b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_1d40:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d45:  stloc 25

	IL_1d49:  nop 
	IL_1d4a:  nop 
	IL_1d4b:  ldloc 25

	IL_1d4f:  nop 
	IL_1d50:  nop 
	IL_1d51:  ldloc 8

	IL_1d55:  nop 
	IL_1d56:  nop 
	IL_1d57:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1d5c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1d61:  stloc 26

	IL_1d65:  nop 
	IL_1d66:  nop 
	IL_1d67:  ldloc 26

	IL_1d6b:  nop 
	IL_1d6c:  nop 
	IL_1d6d:  ldc.i4 1
	IL_1d72:  beq IL_1d7c

	IL_1d77:  br IL_1e54

	IL_1d7c:  ldloc 8

	IL_1d80:  nop 
	IL_1d81:  nop 
	IL_1d82:  stloc 22

	IL_1d86:  nop 
	IL_1d87:  nop 
	IL_1d88:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1d8d:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1d92:  or 
	IL_1d93:  stloc 26

	IL_1d97:  nop 
	IL_1d98:  nop 
	IL_1d99:  ldloc 26

	IL_1d9d:  nop 
	IL_1d9e:  nop 
	IL_1d9f:  ldc.i4 1
	IL_1da4:  beq IL_1dae

	IL_1da9:  br IL_1e45

	IL_1dae:  ldc.i4 0
	IL_1db3:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1db8:  ldc.i4 0
	IL_1dbd:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1dc2:  ldloc 1

	IL_1dc6:  nop 
	IL_1dc7:  nop 
	IL_1dc8:  ldc.i4 1
	IL_1dcd:  add 
	IL_1dce:  stloc 23

	IL_1dd2:  nop 
	IL_1dd3:  nop 
	IL_1dd4:  ldarg 1

	IL_1dd8:  nop 
	IL_1dd9:  nop 
	IL_1dda:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1ddf:  ldloc 23

	IL_1de3:  nop 
	IL_1de4:  nop 
	IL_1de5:  conv.u 
	IL_1de6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1deb:  stloc 18

	IL_1def:  nop 
	IL_1df0:  nop 
	IL_1df1:  ldloc 22

	IL_1df5:  nop 
	IL_1df6:  nop 
	IL_1df7:  ldc.i4 1
	IL_1dfc:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_1e01:  ldloc 22

	IL_1e05:  nop 
	IL_1e06:  nop 
	IL_1e07:  ldloc 18

	IL_1e0b:  nop 
	IL_1e0c:  nop 
	IL_1e0d:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_1e12:  ldarg 1

	IL_1e16:  nop 
	IL_1e17:  nop 
	IL_1e18:  ldloc 23

	IL_1e1c:  nop 
	IL_1e1d:  nop 
	IL_1e1e:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1e23:  ldarg 1

	IL_1e27:  nop 
	IL_1e28:  nop 
	IL_1e29:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1e2e:  ldloc 1

	IL_1e32:  nop 
	IL_1e33:  nop 
	IL_1e34:  conv.u 
	IL_1e35:  ldloc 22

	IL_1e39:  nop 
	IL_1e3a:  nop 
	IL_1e3b:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1e40:  br IL_1e4a

	IL_1e45:  br IL_1e4a

	IL_1e4a:  br IL_1e59

	IL_1e4f:  br IL_1e59

	IL_1e54:  br IL_1e59

	IL_1e59:  ldloc 1

	IL_1e5d:  nop 
	IL_1e5e:  nop 
	IL_1e5f:  ldc.i4 0
	IL_1e64:  ble IL_1e6e

	IL_1e69:  br IL_1e78

	IL_1e6e:  br IL_1e87

	IL_1e73:  br IL_1e82

	IL_1e78:  br IL_00fe

	IL_1e7d:  br IL_1e82

	IL_1e82:  br IL_1e87

	IL_1e87:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1e8c:  ldc.i4 0
	IL_1e91:  beq IL_1e9b

	IL_1e96:  br IL_1f16

	IL_1e9b:  ldloc 4

	IL_1e9f:  nop 
	IL_1ea0:  nop 
	IL_1ea1:  ldc.i4 1
	IL_1ea6:  beq IL_1eb0

	IL_1eab:  br IL_1f0c

	IL_1eb0:  ldc.i4 1
	IL_1eb5:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1eba:  ldarg 1

	IL_1ebe:  nop 
	IL_1ebf:  nop 
	IL_1ec0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1ec5:  ldlen 
	IL_1ec6:  conv.i4 
	IL_1ec7:  stloc 0

	IL_1ecb:  nop 
	IL_1ecc:  nop 
	IL_1ecd:  ldloc 0

	IL_1ed1:  nop 
	IL_1ed2:  nop 
	IL_1ed3:  stloc 1

	IL_1ed7:  nop 
	IL_1ed8:  nop 
	IL_1ed9:  ldc.i4 0
	IL_1ede:  stloc 4

	IL_1ee2:  nop 
	IL_1ee3:  nop 
	IL_1ee4:  ldc.i4 0
	IL_1ee9:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1eee:  ldc.i4 0
	IL_1ef3:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1ef8:  ldc.i4 0
	IL_1efd:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1f02:  br IL_00fe

	IL_1f07:  br IL_1f11

	IL_1f0c:  br IL_1f11

	IL_1f11:  br IL_1f25

	IL_1f16:  ldc.i4 0
	IL_1f1b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1f20:  br IL_1f25

	IL_1f25:  ldc.i4 0
	IL_1f2a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1f2f:  ldc.i4 0
	IL_1f34:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1f39:  ldc.i4 0
	IL_1f3e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1f43:  ldarg 1

	IL_1f47:  nop 
	IL_1f48:  nop 
	IL_1f49:  ret 
    } // end of method ExprOptimizer::Optimize

    // method line 19
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xb1fc
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method ExprOptimizer::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.ExprOptimizer
}

.namespace dylan.NET.Tokenizer.Parser
{
  .class public auto ansi StmtOptimizer
  	extends [mscorlib]System.Object
  {

    // method line 20
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkRefasm (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb210
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt::AsmPath
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkRefasm

    // method line 21
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkRefstdasm (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb2ec
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefstdasmTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt::AsmPath
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkRefstdasm

    // method line 22
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkInclude (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb3c8
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IncludeStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IncludeTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IncludeStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IncludeStmt::Path
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkInclude

    // method line 23
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb4a4
	// Code size 459 (0x1cb)
	.maxstack 12
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_3,
		int32	V_4,
		int32	V_5,
		bool	V_6,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_7)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IfTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_005d:  stloc 3

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  ldarg 2

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldobj [mscorlib]System.Boolean
	IL_006e:  ldc.i4 1
	IL_0073:  beq IL_007d

	IL_0078:  br IL_01bf

	IL_007d:  ldloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldarg 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_008e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0093:  ldloc 2

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldarg 1

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a9:  ldc.i4 0
	IL_00ae:  stloc 4

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldarg 1

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00bf:  ldlen 
	IL_00c0:  conv.i4 
	IL_00c1:  ldc.i4 1
	IL_00c6:  sub 
	IL_00c7:  stloc 5

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 4

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  ldc.i4 1
	IL_00d8:  add 
	IL_00d9:  stloc 4

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldarg 1

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00ea:  ldloc 4

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  conv.u 
	IL_00f1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00f6:  stloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok
	IL_0101:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0106:  stloc 1

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldloc 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldloc 0

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_011d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0122:  stloc 6

	IL_0126:  nop 
	IL_0127:  nop 
	IL_0128:  ldloc 6

	IL_012c:  nop 
	IL_012d:  nop 
	IL_012e:  ldc.i4 1
	IL_0133:  beq IL_013d

	IL_0138:  br IL_0147

	IL_013d:  br IL_0187

	IL_0142:  br IL_015d

	IL_0147:  ldloc 3

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldloc 0

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0158:  br IL_015d

	IL_015d:  ldloc 4

	IL_0161:  nop 
	IL_0162:  nop 
	IL_0163:  ldloc 5

	IL_0167:  nop 
	IL_0168:  nop 
	IL_0169:  beq IL_0173

	IL_016e:  br IL_017d

	IL_0173:  br IL_0187

	IL_0178:  br IL_0187

	IL_017d:  br IL_00cd

	IL_0182:  br IL_0187

	IL_0187:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_018c:  stloc 7

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  ldloc 7

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldloc 3

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01a3:  stloc 3

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldloc 2

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  ldloc 3

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt::Exp
	IL_01ba:  br IL_01c4

	IL_01bf:  br IL_01c4

	IL_01c4:  ldloc 2

	IL_01c8:  nop 
	IL_01c9:  nop 
	IL_01ca:  ret 
    } // end of method StmtOptimizer::checkIf

    // method line 24
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkWhile (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb67c
	// Code size 379 (0x17b)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.WhileStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_3,
		int32	V_4,
		int32	V_5,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.WhileTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.WhileStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_005d:  stloc 3

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  ldarg 2

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldobj [mscorlib]System.Boolean
	IL_006e:  ldc.i4 1
	IL_0073:  beq IL_007d

	IL_0078:  br IL_016f

	IL_007d:  ldloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldarg 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_008e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0093:  ldloc 2

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldarg 1

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a9:  ldc.i4 0
	IL_00ae:  stloc 4

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldarg 1

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00bf:  ldlen 
	IL_00c0:  conv.i4 
	IL_00c1:  ldc.i4 1
	IL_00c6:  sub 
	IL_00c7:  stloc 5

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 4

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  ldc.i4 1
	IL_00d8:  add 
	IL_00d9:  stloc 4

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldarg 1

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00ea:  ldloc 4

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  conv.u 
	IL_00f1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00f6:  stloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldloc 3

	IL_0100:  nop 
	IL_0101:  nop 
	IL_0102:  ldloc 0

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_010d:  ldloc 4

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldloc 5

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  beq IL_0123

	IL_011e:  br IL_012d

	IL_0123:  br IL_0137

	IL_0128:  br IL_0137

	IL_012d:  br IL_00cd

	IL_0132:  br IL_0137

	IL_0137:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_013c:  stloc 6

	IL_0140:  nop 
	IL_0141:  nop 
	IL_0142:  ldloc 6

	IL_0146:  nop 
	IL_0147:  nop 
	IL_0148:  ldloc 3

	IL_014c:  nop 
	IL_014d:  nop 
	IL_014e:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0153:  stloc 3

	IL_0157:  nop 
	IL_0158:  nop 
	IL_0159:  ldloc 2

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  ldloc 3

	IL_0163:  nop 
	IL_0164:  nop 
	IL_0165:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.WhileStmt::Exp
	IL_016a:  br IL_0174

	IL_016f:  br IL_0174

	IL_0174:  ldloc 2

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ret 
    } // end of method StmtOptimizer::checkWhile

    // method line 25
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDoWhile (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb804
	// Code size 515 (0x203)
	.maxstack 10
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoWhileStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [mscorlib]System.Type	V_5,
		bool	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_8,
		int32	V_9,
		int32	V_10,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_11)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  bge IL_0023

	IL_001e:  br IL_01f7

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DoTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 1

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0076:  ldc.i4 1
	IL_007b:  conv.u 
	IL_007c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0081:  stloc 4

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.WhileTok
	IL_008c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0091:  stloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ad:  stloc 6

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldarg 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 6

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  and 
	IL_00c6:  stobj [mscorlib]System.Boolean
	IL_00cb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoWhileStmt::'.ctor'()
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_00db:  stloc 7

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  ldarg 2

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ldobj [mscorlib]System.Boolean
	IL_00ec:  ldc.i4 1
	IL_00f1:  beq IL_00fb

	IL_00f6:  br IL_01ed

	IL_00fb:  ldloc 0

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ldarg 1

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_010c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0111:  ldloc 0

	IL_0115:  nop 
	IL_0116:  nop 
	IL_0117:  ldarg 1

	IL_011b:  nop 
	IL_011c:  nop 
	IL_011d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0122:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0127:  ldc.i4 1
	IL_012c:  stloc 9

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldarg 1

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_013d:  ldlen 
	IL_013e:  conv.i4 
	IL_013f:  ldc.i4 1
	IL_0144:  sub 
	IL_0145:  stloc 10

	IL_0149:  nop 
	IL_014a:  nop 
	IL_014b:  ldloc 9

	IL_014f:  nop 
	IL_0150:  nop 
	IL_0151:  ldc.i4 1
	IL_0156:  add 
	IL_0157:  stloc 9

	IL_015b:  nop 
	IL_015c:  nop 
	IL_015d:  ldarg 1

	IL_0161:  nop 
	IL_0162:  nop 
	IL_0163:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0168:  ldloc 9

	IL_016c:  nop 
	IL_016d:  nop 
	IL_016e:  conv.u 
	IL_016f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0174:  stloc 8

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldloc 7

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldloc 8

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_018b:  ldloc 9

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldloc 10

	IL_0195:  nop 
	IL_0196:  nop 
	IL_0197:  beq IL_01a1

	IL_019c:  br IL_01ab

	IL_01a1:  br IL_01b5

	IL_01a6:  br IL_01b5

	IL_01ab:  br IL_014b

	IL_01b0:  br IL_01b5

	IL_01b5:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_01ba:  stloc 11

	IL_01be:  nop 
	IL_01bf:  nop 
	IL_01c0:  ldloc 11

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  ldloc 7

	IL_01ca:  nop 
	IL_01cb:  nop 
	IL_01cc:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01d1:  stloc 7

	IL_01d5:  nop 
	IL_01d6:  nop 
	IL_01d7:  ldloc 0

	IL_01db:  nop 
	IL_01dc:  nop 
	IL_01dd:  ldloc 7

	IL_01e1:  nop 
	IL_01e2:  nop 
	IL_01e3:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoWhileStmt::Exp
	IL_01e8:  br IL_01f2

	IL_01ed:  br IL_01f2

	IL_01f2:  br IL_01fc

	IL_01f7:  br IL_01fc

	IL_01fc:  ldloc 0

	IL_0200:  nop 
	IL_0201:  nop 
	IL_0202:  ret 
    } // end of method StmtOptimizer::checkDoWhile

    // method line 26
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkUntil (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xba14
	// Code size 379 (0x17b)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.UntilStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_3,
		int32	V_4,
		int32	V_5,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.UntilTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.UntilStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_005d:  stloc 3

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  ldarg 2

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldobj [mscorlib]System.Boolean
	IL_006e:  ldc.i4 1
	IL_0073:  beq IL_007d

	IL_0078:  br IL_016f

	IL_007d:  ldloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldarg 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_008e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0093:  ldloc 2

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldarg 1

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a9:  ldc.i4 0
	IL_00ae:  stloc 4

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldarg 1

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00bf:  ldlen 
	IL_00c0:  conv.i4 
	IL_00c1:  ldc.i4 1
	IL_00c6:  sub 
	IL_00c7:  stloc 5

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 4

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  ldc.i4 1
	IL_00d8:  add 
	IL_00d9:  stloc 4

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldarg 1

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00ea:  ldloc 4

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  conv.u 
	IL_00f1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00f6:  stloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldloc 3

	IL_0100:  nop 
	IL_0101:  nop 
	IL_0102:  ldloc 0

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_010d:  ldloc 4

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldloc 5

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  beq IL_0123

	IL_011e:  br IL_012d

	IL_0123:  br IL_0137

	IL_0128:  br IL_0137

	IL_012d:  br IL_00cd

	IL_0132:  br IL_0137

	IL_0137:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_013c:  stloc 6

	IL_0140:  nop 
	IL_0141:  nop 
	IL_0142:  ldloc 6

	IL_0146:  nop 
	IL_0147:  nop 
	IL_0148:  ldloc 3

	IL_014c:  nop 
	IL_014d:  nop 
	IL_014e:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0153:  stloc 3

	IL_0157:  nop 
	IL_0158:  nop 
	IL_0159:  ldloc 2

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  ldloc 3

	IL_0163:  nop 
	IL_0164:  nop 
	IL_0165:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.UntilStmt::Exp
	IL_016a:  br IL_0174

	IL_016f:  br IL_0174

	IL_0174:  ldloc 2

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ret 
    } // end of method StmtOptimizer::checkUntil

    // method line 27
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDoUntil (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbb9c
	// Code size 515 (0x203)
	.maxstack 10
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoUntilStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [mscorlib]System.Type	V_5,
		bool	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_7,
		int32	V_8,
		int32	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_10,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_11)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  bge IL_0023

	IL_001e:  br IL_01f7

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DoTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 1

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0076:  ldc.i4 1
	IL_007b:  conv.u 
	IL_007c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0081:  stloc 4

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.UntilTok
	IL_008c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0091:  stloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ad:  stloc 6

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldarg 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 6

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  and 
	IL_00c6:  stobj [mscorlib]System.Boolean
	IL_00cb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoUntilStmt::'.ctor'()
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_00db:  stloc 7

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  ldarg 2

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ldobj [mscorlib]System.Boolean
	IL_00ec:  ldc.i4 1
	IL_00f1:  beq IL_00fb

	IL_00f6:  br IL_01ed

	IL_00fb:  ldloc 0

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ldarg 1

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_010c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0111:  ldloc 0

	IL_0115:  nop 
	IL_0116:  nop 
	IL_0117:  ldarg 1

	IL_011b:  nop 
	IL_011c:  nop 
	IL_011d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0122:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0127:  ldc.i4 1
	IL_012c:  stloc 8

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldarg 1

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_013d:  ldlen 
	IL_013e:  conv.i4 
	IL_013f:  ldc.i4 1
	IL_0144:  sub 
	IL_0145:  stloc 9

	IL_0149:  nop 
	IL_014a:  nop 
	IL_014b:  ldloc 8

	IL_014f:  nop 
	IL_0150:  nop 
	IL_0151:  ldc.i4 1
	IL_0156:  add 
	IL_0157:  stloc 8

	IL_015b:  nop 
	IL_015c:  nop 
	IL_015d:  ldarg 1

	IL_0161:  nop 
	IL_0162:  nop 
	IL_0163:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0168:  ldloc 8

	IL_016c:  nop 
	IL_016d:  nop 
	IL_016e:  conv.u 
	IL_016f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0174:  stloc 10

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldloc 7

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldloc 10

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_018b:  ldloc 8

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldloc 9

	IL_0195:  nop 
	IL_0196:  nop 
	IL_0197:  beq IL_01a1

	IL_019c:  br IL_01ab

	IL_01a1:  br IL_01b5

	IL_01a6:  br IL_01b5

	IL_01ab:  br IL_014b

	IL_01b0:  br IL_01b5

	IL_01b5:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_01ba:  stloc 11

	IL_01be:  nop 
	IL_01bf:  nop 
	IL_01c0:  ldloc 11

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  ldloc 7

	IL_01ca:  nop 
	IL_01cb:  nop 
	IL_01cc:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01d1:  stloc 7

	IL_01d5:  nop 
	IL_01d6:  nop 
	IL_01d7:  ldloc 0

	IL_01db:  nop 
	IL_01dc:  nop 
	IL_01dd:  ldloc 7

	IL_01e1:  nop 
	IL_01e2:  nop 
	IL_01e3:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoUntilStmt::Exp
	IL_01e8:  br IL_01f2

	IL_01ed:  br IL_01f2

	IL_01f2:  br IL_01fc

	IL_01f7:  br IL_01fc

	IL_01fc:  ldloc 0

	IL_0200:  nop 
	IL_0201:  nop 
	IL_0202:  ret 
    } // end of method StmtOptimizer::checkDoUntil

    // method line 28
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkElseIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbdac
	// Code size 459 (0x1cb)
	.maxstack 12
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_3,
		int32	V_4,
		int32	V_5,
		bool	V_6,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_7)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseIfTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_005d:  stloc 3

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  ldarg 2

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldobj [mscorlib]System.Boolean
	IL_006e:  ldc.i4 1
	IL_0073:  beq IL_007d

	IL_0078:  br IL_01bf

	IL_007d:  ldloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldarg 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_008e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0093:  ldloc 2

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldarg 1

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a9:  ldc.i4 0
	IL_00ae:  stloc 4

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldarg 1

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00bf:  ldlen 
	IL_00c0:  conv.i4 
	IL_00c1:  ldc.i4 1
	IL_00c6:  sub 
	IL_00c7:  stloc 5

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 4

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  ldc.i4 1
	IL_00d8:  add 
	IL_00d9:  stloc 4

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldarg 1

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00ea:  ldloc 4

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  conv.u 
	IL_00f1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00f6:  stloc 0

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok
	IL_0101:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0106:  stloc 1

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldloc 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldloc 0

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_011d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0122:  stloc 6

	IL_0126:  nop 
	IL_0127:  nop 
	IL_0128:  ldloc 6

	IL_012c:  nop 
	IL_012d:  nop 
	IL_012e:  ldc.i4 1
	IL_0133:  beq IL_013d

	IL_0138:  br IL_0147

	IL_013d:  br IL_0187

	IL_0142:  br IL_015d

	IL_0147:  ldloc 3

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldloc 0

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0158:  br IL_015d

	IL_015d:  ldloc 4

	IL_0161:  nop 
	IL_0162:  nop 
	IL_0163:  ldloc 5

	IL_0167:  nop 
	IL_0168:  nop 
	IL_0169:  beq IL_0173

	IL_016e:  br IL_017d

	IL_0173:  br IL_0187

	IL_0178:  br IL_0187

	IL_017d:  br IL_00cd

	IL_0182:  br IL_0187

	IL_0187:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_018c:  stloc 7

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  ldloc 7

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldloc 3

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01a3:  stloc 3

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldloc 2

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  ldloc 3

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt::Exp
	IL_01ba:  br IL_01c4

	IL_01bf:  br IL_01c4

	IL_01c4:  ldloc 2

	IL_01c8:  nop 
	IL_01c9:  nop 
	IL_01ca:  ret 
    } // end of method StmtOptimizer::checkElseIf

    // method line 29
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkLabel (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbf84
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LabelTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt::LabelName
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkLabel

    // method line 30
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkPlace (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc060
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PlaceTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt::LabelName
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkPlace

    // method line 31
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkGoto (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc13c
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GotoTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt::LabelName
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkGoto

    // method line 32
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDebug (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc218
	// Code size 219 (0xdb)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00cf

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.SwitchTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Opt
	IL_00bf:  ldloc 2

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt::setFlg()
	IL_00ca:  br IL_00d4

	IL_00cf:  br IL_00d4

	IL_00d4:  ldloc 2

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  ret 
    } // end of method StmtOptimizer::checkDebug

    // method line 33
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkScope (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc300
	// Code size 219 (0xdb)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ScopeStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00cf

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.SwitchTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::Opt
	IL_00bf:  ldloc 2

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ScopeStmt::setFlg()
	IL_00ca:  br IL_00d4

	IL_00cf:  br IL_00d4

	IL_00d4:  ldloc 2

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  ret 
    } // end of method StmtOptimizer::checkScope

    // method line 34
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkImport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc3e8
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt::NS
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkImport

    // method line 35
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkNS (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc4c4
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.NSStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NamespaceTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.NSStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.NSStmt::NS
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkNS

    // method line 36
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkLocimport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc5a0
	// Code size 208 (0xd0)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00c4

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt::NS
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 2

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ret 
    } // end of method StmtOptimizer::checkLocimport

    // method line 37
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkReturn (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc67c
	// Code size 467 (0x1d3)
	.maxstack 15
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt	V_2,
		int32	V_3,
		int32	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_5,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_01c7

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldc.i4 0
	IL_00a3:  stloc 3

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  ldarg 1

	IL_00ad:  nop 
	IL_00ae:  nop 
	IL_00af:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00b4:  ldlen 
	IL_00b5:  conv.i4 
	IL_00b6:  ldc.i4 1
	IL_00bb:  sub 
	IL_00bc:  stloc 4

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  ldnull 
	IL_00c3:  stloc 5

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldarg 1

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00d4:  ldlen 
	IL_00d5:  conv.i4 
	IL_00d6:  ldc.i4 1
	IL_00db:  beq IL_00e5

	IL_00e0:  br IL_00fb

	IL_00e5:  ldloc 2

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldnull 
	IL_00ec:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_00f1:  br IL_01c2

	IL_00f6:  br IL_0100

	IL_00fb:  br IL_0100

	IL_0100:  ldarg 1

	IL_0104:  nop 
	IL_0105:  nop 
	IL_0106:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_010b:  ldlen 
	IL_010c:  conv.i4 
	IL_010d:  ldc.i4 2
	IL_0112:  bge IL_011c

	IL_0117:  br IL_01bd

	IL_011c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0121:  stloc 5

	IL_0125:  nop 
	IL_0126:  nop 
	IL_0127:  ldloc 3

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  ldc.i4 1
	IL_0132:  add 
	IL_0133:  stloc 3

	IL_0137:  nop 
	IL_0138:  nop 
	IL_0139:  ldloc 5

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  ldarg 1

	IL_0143:  nop 
	IL_0144:  nop 
	IL_0145:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_014a:  ldloc 3

	IL_014e:  nop 
	IL_014f:  nop 
	IL_0150:  conv.u 
	IL_0151:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0156:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_015b:  ldloc 3

	IL_015f:  nop 
	IL_0160:  nop 
	IL_0161:  ldloc 4

	IL_0165:  nop 
	IL_0166:  nop 
	IL_0167:  beq IL_0171

	IL_016c:  br IL_017b

	IL_0171:  br IL_0185

	IL_0176:  br IL_0185

	IL_017b:  br IL_0127

	IL_0180:  br IL_0185

	IL_0185:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_018a:  stloc 6

	IL_018e:  nop 
	IL_018f:  nop 
	IL_0190:  ldloc 6

	IL_0194:  nop 
	IL_0195:  nop 
	IL_0196:  ldloc 5

	IL_019a:  nop 
	IL_019b:  nop 
	IL_019c:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01a1:  stloc 5

	IL_01a5:  nop 
	IL_01a6:  nop 
	IL_01a7:  ldloc 2

	IL_01ab:  nop 
	IL_01ac:  nop 
	IL_01ad:  ldloc 5

	IL_01b1:  nop 
	IL_01b2:  nop 
	IL_01b3:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_01b8:  br IL_01c2

	IL_01bd:  br IL_01c2

	IL_01c2:  br IL_01cc

	IL_01c7:  br IL_01cc

	IL_01cc:  ldloc 2

	IL_01d0:  nop 
	IL_01d1:  nop 
	IL_01d2:  ret 
    } // end of method StmtOptimizer::checkReturn

    // method line 38
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkCmt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc85c
	// Code size 175 (0xaf)
	.maxstack 6
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.CommentStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.CommentStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00a3

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  br IL_00a8

	IL_00a3:  br IL_00a8

	IL_00a8:  ldloc 2

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  ret 
    } // end of method StmtOptimizer::checkCmt

    // method line 39
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkElse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc918
	// Code size 232 (0xe8)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  blt IL_0023

	IL_001e:  br IL_00dc

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 2

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 3

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  stobj [mscorlib]System.Boolean
	IL_007c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseStmt::'.ctor'()
	IL_0081:  stloc 0

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldarg 2

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldobj [mscorlib]System.Boolean
	IL_0092:  ldc.i4 1
	IL_0097:  beq IL_00a1

	IL_009c:  br IL_00d2

	IL_00a1:  ldloc 0

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldarg 1

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b7:  ldloc 0

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ldarg 1

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00c8:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00cd:  br IL_00d7

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_00e1

	IL_00dc:  br IL_00e1

	IL_00e1:  ldloc 0

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ret 
    } // end of method StmtOptimizer::checkElse

    // method line 40
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDo (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xca0c
	// Code size 232 (0xe8)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  blt IL_0023

	IL_001e:  br IL_00dc

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DoTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 2

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 3

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  stobj [mscorlib]System.Boolean
	IL_007c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DoStmt::'.ctor'()
	IL_0081:  stloc 0

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldarg 2

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldobj [mscorlib]System.Boolean
	IL_0092:  ldc.i4 1
	IL_0097:  beq IL_00a1

	IL_009c:  br IL_00d2

	IL_00a1:  ldloc 0

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldarg 1

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b7:  ldloc 0

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ldarg 1

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00c8:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00cd:  br IL_00d7

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_00e1

	IL_00dc:  br IL_00e1

	IL_00e1:  ldloc 0

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ret 
    } // end of method StmtOptimizer::checkDo

    // method line 41
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkBreak (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xcb00
	// Code size 232 (0xe8)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.BreakStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  blt IL_0023

	IL_001e:  br IL_00dc

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.BreakTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 2

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 3

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  stobj [mscorlib]System.Boolean
	IL_007c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.BreakStmt::'.ctor'()
	IL_0081:  stloc 0

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldarg 2

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldobj [mscorlib]System.Boolean
	IL_0092:  ldc.i4 1
	IL_0097:  beq IL_00a1

	IL_009c:  br IL_00d2

	IL_00a1:  ldloc 0

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldarg 1

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b7:  ldloc 0

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ldarg 1

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00c8:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00cd:  br IL_00d7

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_00e1

	IL_00dc:  br IL_00e1

	IL_00e1:  ldloc 0

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ret 
    } // end of method StmtOptimizer::checkBreak

    // method line 42
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkContinue (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xcbf4
	// Code size 232 (0xe8)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ContinueStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  blt IL_0023

	IL_001e:  br IL_00dc

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ContinueTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 2

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 3

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  stobj [mscorlib]System.Boolean
	IL_007c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ContinueStmt::'.ctor'()
	IL_0081:  stloc 0

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldarg 2

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldobj [mscorlib]System.Boolean
	IL_0092:  ldc.i4 1
	IL_0097:  beq IL_00a1

	IL_009c:  br IL_00d2

	IL_00a1:  ldloc 0

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldarg 1

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b7:  ldloc 0

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ldarg 1

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00c8:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00cd:  br IL_00d7

	IL_00d2:  br IL_00d7

	IL_00d7:  br IL_00e1

	IL_00dc:  br IL_00e1

	IL_00e1:  ldloc 0

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ret 
    } // end of method StmtOptimizer::checkContinue

    // method line 43
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xcce8
	// Code size 311 (0x137)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndIfStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [mscorlib]System.Type	V_5,
		bool	V_6)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  bge IL_0023

	IL_001e:  br IL_012b

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 1

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0076:  ldc.i4 1
	IL_007b:  conv.u 
	IL_007c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0081:  stloc 4

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IfTok
	IL_008c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0091:  stloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ad:  stloc 6

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldarg 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 6

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  and 
	IL_00c6:  stobj [mscorlib]System.Boolean
	IL_00cb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndIfStmt::'.ctor'()
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldarg 2

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldobj [mscorlib]System.Boolean
	IL_00e1:  ldc.i4 1
	IL_00e6:  beq IL_00f0

	IL_00eb:  br IL_0121

	IL_00f0:  ldloc 0

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldarg 1

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0101:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0106:  ldloc 0

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldarg 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0117:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  br IL_0130

	IL_012b:  br IL_0130

	IL_0130:  ldloc 0

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ret 
    } // end of method StmtOptimizer::checkEndIf

    // method line 44
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndMtd (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xce2c
	// Code size 311 (0x137)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [mscorlib]System.Type	V_5,
		bool	V_6)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  bge IL_0023

	IL_001e:  br IL_012b

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 1

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0076:  ldc.i4 1
	IL_007b:  conv.u 
	IL_007c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0081:  stloc 4

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok
	IL_008c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0091:  stloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ad:  stloc 6

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldarg 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 6

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  and 
	IL_00c6:  stobj [mscorlib]System.Boolean
	IL_00cb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt::'.ctor'()
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldarg 2

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldobj [mscorlib]System.Boolean
	IL_00e1:  ldc.i4 1
	IL_00e6:  beq IL_00f0

	IL_00eb:  br IL_0121

	IL_00f0:  ldloc 0

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldarg 1

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0101:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0106:  ldloc 0

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldarg 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0117:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  br IL_0130

	IL_012b:  br IL_0130

	IL_0130:  ldloc 0

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ret 
    } // end of method StmtOptimizer::checkEndMtd

    // method line 45
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndNS (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xcf70
	// Code size 311 (0x137)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndNSStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [mscorlib]System.Type	V_5,
		bool	V_6)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  bge IL_0023

	IL_001e:  br IL_012b

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 1

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0076:  ldc.i4 1
	IL_007b:  conv.u 
	IL_007c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0081:  stloc 4

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NamespaceTok
	IL_008c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0091:  stloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ad:  stloc 6

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldarg 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 6

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  and 
	IL_00c6:  stobj [mscorlib]System.Boolean
	IL_00cb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndNSStmt::'.ctor'()
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldarg 2

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldobj [mscorlib]System.Boolean
	IL_00e1:  ldc.i4 1
	IL_00e6:  beq IL_00f0

	IL_00eb:  br IL_0121

	IL_00f0:  ldloc 0

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldarg 1

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0101:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0106:  ldloc 0

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldarg 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0117:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  br IL_0130

	IL_012b:  br IL_0130

	IL_0130:  ldloc 0

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ret 
    } // end of method StmtOptimizer::checkEndNS

    // method line 46
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndCls (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd0b4
	// Code size 311 (0x137)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndClassStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [mscorlib]System.Type	V_5,
		bool	V_6)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  bge IL_0023

	IL_001e:  br IL_012b

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 1

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0076:  ldc.i4 1
	IL_007b:  conv.u 
	IL_007c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0081:  stloc 4

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok
	IL_008c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0091:  stloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ad:  stloc 6

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldarg 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 6

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  and 
	IL_00c6:  stobj [mscorlib]System.Boolean
	IL_00cb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndClassStmt::'.ctor'()
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldarg 2

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldobj [mscorlib]System.Boolean
	IL_00e1:  ldc.i4 1
	IL_00e6:  beq IL_00f0

	IL_00eb:  br IL_0121

	IL_00f0:  ldloc 0

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldarg 1

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0101:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0106:  ldloc 0

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldarg 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0117:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  br IL_0130

	IL_012b:  br IL_0130

	IL_0130:  ldloc 0

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ret 
    } // end of method StmtOptimizer::checkEndCls

    // method line 47
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndDo (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd1f8
	// Code size 311 (0x137)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndDoStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [mscorlib]System.Type	V_5,
		bool	V_6)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0012:  ldlen 
	IL_0013:  conv.i4 
	IL_0014:  ldc.i4 2
	IL_0019:  bge IL_0023

	IL_001e:  br IL_012b

	IL_0023:  ldarg 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_002e:  ldc.i4 0
	IL_0033:  conv.u 
	IL_0034:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
	IL_0044:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0049:  stloc 2

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  ldloc 1

	IL_0059:  nop 
	IL_005a:  nop 
	IL_005b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0060:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0065:  stloc 3

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldarg 1

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0076:  ldc.i4 1
	IL_007b:  conv.u 
	IL_007c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0081:  stloc 4

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DoTok
	IL_008c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0091:  stloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 5

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 4

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ad:  stloc 6

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldarg 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 6

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  and 
	IL_00c6:  stobj [mscorlib]System.Boolean
	IL_00cb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndDoStmt::'.ctor'()
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldarg 2

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldobj [mscorlib]System.Boolean
	IL_00e1:  ldc.i4 1
	IL_00e6:  beq IL_00f0

	IL_00eb:  br IL_0121

	IL_00f0:  ldloc 0

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldarg 1

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0101:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0106:  ldloc 0

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldarg 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0117:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_011c:  br IL_0126

	IL_0121:  br IL_0126

	IL_0126:  br IL_0130

	IL_012b:  br IL_0130

	IL_0130:  ldloc 0

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ret 
    } // end of method StmtOptimizer::checkEndDo

    // method line 48
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssembly (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd33c
	// Code size 241 (0xf1)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_00e5

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldloc 2

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldarg 1

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00af:  ldc.i4 1
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::AsmName
	IL_00bf:  ldloc 2

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldarg 1

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00d0:  ldc.i4 2
	IL_00d5:  conv.u 
	IL_00d6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00db:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::Mode
	IL_00e0:  br IL_00ea

	IL_00e5:  br IL_00ea

	IL_00ea:  ldloc 2

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  ret 
    } // end of method StmtOptimizer::checkAssembly

    // method line 49
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVer (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd43c
	// Code size 848 (0x350)
	.maxstack 30
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt	V_2,
		string[]	V_3,
		int32[]	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[]	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_0344

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0083:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0088:  ldloc 2

	IL_008c:  nop 
	IL_008d:  nop 
	IL_008e:  ldarg 1

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0099:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009e:  ldarg 1

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a9:  ldc.i4 1
	IL_00ae:  conv.u 
	IL_00af:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00b4:  stloc 0

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldloc 0

	IL_00be:  nop 
	IL_00bf:  nop 
	IL_00c0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00c5:  ldstr "."
	IL_00ca:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_00cf:  stloc 3

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldc.i4 4
	IL_00da:  conv.u 
	IL_00db:  newarr [mscorlib]System.Int32
	IL_00e0:  stloc 4

	IL_00e4:  nop 
	IL_00e5:  nop 
	IL_00e6:  ldloc 4

	IL_00ea:  nop 
	IL_00eb:  nop 
	IL_00ec:  ldc.i4 0
	IL_00f1:  conv.u 
	IL_00f2:  ldloc 3

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldc.i4 0
	IL_00fd:  conv.u 
	IL_00fe:  ldelem [mscorlib]System.String
	IL_0103:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_0108:  stelem [mscorlib]System.Int32
	IL_010d:  ldloc 4

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldc.i4 1
	IL_0118:  conv.u 
	IL_0119:  ldloc 3

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  ldc.i4 1
	IL_0124:  conv.u 
	IL_0125:  ldelem [mscorlib]System.String
	IL_012a:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_012f:  stelem [mscorlib]System.Int32
	IL_0134:  ldloc 4

	IL_0138:  nop 
	IL_0139:  nop 
	IL_013a:  ldc.i4 2
	IL_013f:  conv.u 
	IL_0140:  ldloc 3

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  ldc.i4 2
	IL_014b:  conv.u 
	IL_014c:  ldelem [mscorlib]System.String
	IL_0151:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_0156:  stelem [mscorlib]System.Int32
	IL_015b:  ldloc 4

	IL_015f:  nop 
	IL_0160:  nop 
	IL_0161:  ldc.i4 3
	IL_0166:  conv.u 
	IL_0167:  ldloc 3

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  ldc.i4 3
	IL_0172:  conv.u 
	IL_0173:  ldelem [mscorlib]System.String
	IL_0178:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_017d:  stelem [mscorlib]System.Int32
	IL_0182:  ldc.i4 4
	IL_0187:  conv.u 
	IL_0188:  newarr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_018d:  stloc 5

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldnull 
	IL_0194:  stloc 6

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  ldloc 3

	IL_019e:  nop 
	IL_019f:  nop 
	IL_01a0:  ldc.i4 0
	IL_01a5:  conv.u 
	IL_01a6:  ldelem [mscorlib]System.String
	IL_01ab:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'(string)
	IL_01b0:  stloc 6

	IL_01b4:  nop 
	IL_01b5:  nop 
	IL_01b6:  ldloc 6

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  ldloc 0

	IL_01c0:  nop 
	IL_01c1:  nop 
	IL_01c2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_01c7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_01cc:  ldloc 6

	IL_01d0:  nop 
	IL_01d1:  nop 
	IL_01d2:  ldloc 4

	IL_01d6:  nop 
	IL_01d7:  nop 
	IL_01d8:  ldc.i4 0
	IL_01dd:  conv.u 
	IL_01de:  ldelem [mscorlib]System.Int32
	IL_01e3:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_01e8:  ldloc 5

	IL_01ec:  nop 
	IL_01ed:  nop 
	IL_01ee:  ldc.i4 0
	IL_01f3:  conv.u 
	IL_01f4:  ldloc 6

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_01ff:  ldloc 3

	IL_0203:  nop 
	IL_0204:  nop 
	IL_0205:  ldc.i4 1
	IL_020a:  conv.u 
	IL_020b:  ldelem [mscorlib]System.String
	IL_0210:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'(string)
	IL_0215:  stloc 6

	IL_0219:  nop 
	IL_021a:  nop 
	IL_021b:  ldloc 6

	IL_021f:  nop 
	IL_0220:  nop 
	IL_0221:  ldloc 0

	IL_0225:  nop 
	IL_0226:  nop 
	IL_0227:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_022c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0231:  ldloc 6

	IL_0235:  nop 
	IL_0236:  nop 
	IL_0237:  ldloc 4

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  ldc.i4 1
	IL_0242:  conv.u 
	IL_0243:  ldelem [mscorlib]System.Int32
	IL_0248:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_024d:  ldloc 5

	IL_0251:  nop 
	IL_0252:  nop 
	IL_0253:  ldc.i4 1
	IL_0258:  conv.u 
	IL_0259:  ldloc 6

	IL_025d:  nop 
	IL_025e:  nop 
	IL_025f:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_0264:  ldloc 3

	IL_0268:  nop 
	IL_0269:  nop 
	IL_026a:  ldc.i4 2
	IL_026f:  conv.u 
	IL_0270:  ldelem [mscorlib]System.String
	IL_0275:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'(string)
	IL_027a:  stloc 6

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  ldloc 6

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  ldloc 0

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0291:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0296:  ldloc 6

	IL_029a:  nop 
	IL_029b:  nop 
	IL_029c:  ldloc 4

	IL_02a0:  nop 
	IL_02a1:  nop 
	IL_02a2:  ldc.i4 2
	IL_02a7:  conv.u 
	IL_02a8:  ldelem [mscorlib]System.Int32
	IL_02ad:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_02b2:  ldloc 5

	IL_02b6:  nop 
	IL_02b7:  nop 
	IL_02b8:  ldc.i4 2
	IL_02bd:  conv.u 
	IL_02be:  ldloc 6

	IL_02c2:  nop 
	IL_02c3:  nop 
	IL_02c4:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_02c9:  ldloc 3

	IL_02cd:  nop 
	IL_02ce:  nop 
	IL_02cf:  ldc.i4 3
	IL_02d4:  conv.u 
	IL_02d5:  ldelem [mscorlib]System.String
	IL_02da:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'(string)
	IL_02df:  stloc 6

	IL_02e3:  nop 
	IL_02e4:  nop 
	IL_02e5:  ldloc 6

	IL_02e9:  nop 
	IL_02ea:  nop 
	IL_02eb:  ldloc 0

	IL_02ef:  nop 
	IL_02f0:  nop 
	IL_02f1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02f6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02fb:  ldloc 6

	IL_02ff:  nop 
	IL_0300:  nop 
	IL_0301:  ldloc 4

	IL_0305:  nop 
	IL_0306:  nop 
	IL_0307:  ldc.i4 3
	IL_030c:  conv.u 
	IL_030d:  ldelem [mscorlib]System.Int32
	IL_0312:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_0317:  ldloc 5

	IL_031b:  nop 
	IL_031c:  nop 
	IL_031d:  ldc.i4 3
	IL_0322:  conv.u 
	IL_0323:  ldloc 6

	IL_0327:  nop 
	IL_0328:  nop 
	IL_0329:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_032e:  ldloc 2

	IL_0332:  nop 
	IL_0333:  nop 
	IL_0334:  ldloc 5

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt::VersionNos
	IL_033f:  br IL_0349

	IL_0344:  br IL_0349

	IL_0349:  ldloc 2

	IL_034d:  nop 
	IL_034e:  nop 
	IL_034f:  ret 
    } // end of method StmtOptimizer::checkVer

    // method line 50
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkClass (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd798
	// Code size 817 (0x331)
	.maxstack 22
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute	V_3,
		int32	V_4,
		int32	V_5,
		bool	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_7,
		class [mscorlib]System.Type	V_8,
		bool	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_10,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_11)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldnull 
	IL_0059:  stloc 3

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldarg 2

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  ldobj [mscorlib]System.Boolean
	IL_006a:  ldc.i4 1
	IL_006f:  beq IL_0079

	IL_0074:  br IL_0325

	IL_0079:  ldloc 2

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldarg 1

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_008a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_008f:  ldloc 2

	IL_0093:  nop 
	IL_0094:  nop 
	IL_0095:  ldarg 1

	IL_0099:  nop 
	IL_009a:  nop 
	IL_009b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a0:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a5:  ldc.i4 0
	IL_00aa:  stloc 4

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  ldarg 1

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00bb:  ldlen 
	IL_00bc:  conv.i4 
	IL_00bd:  ldc.i4 1
	IL_00c2:  sub 
	IL_00c3:  stloc 5

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldc.i4 0
	IL_00ce:  stloc 6

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  ldloc 4

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  ldc.i4 1
	IL_00df:  add 
	IL_00e0:  stloc 4

	IL_00e4:  nop 
	IL_00e5:  nop 
	IL_00e6:  ldarg 1

	IL_00ea:  nop 
	IL_00eb:  nop 
	IL_00ec:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00f1:  ldloc 4

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  conv.u 
	IL_00f8:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00fd:  stloc 0

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0108:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_010d:  stloc 1

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldloc 1

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 0

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0124:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0129:  stloc 6

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  ldloc 6

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  ldc.i4 1
	IL_013a:  beq IL_0144

	IL_013f:  br IL_0166

	IL_0144:  ldloc 0

	IL_0148:  nop 
	IL_0149:  nop 
	IL_014a:  stloc 3

	IL_014e:  nop 
	IL_014f:  nop 
	IL_0150:  ldloc 2

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldloc 3

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::AddAttr(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute)
	IL_0161:  br IL_02f6

	IL_0166:  ldarg 1

	IL_016a:  nop 
	IL_016b:  nop 
	IL_016c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0171:  ldloc 4

	IL_0175:  nop 
	IL_0176:  nop 
	IL_0177:  conv.u 
	IL_0178:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_017d:  stloc 7

	IL_0181:  nop 
	IL_0182:  nop 
	IL_0183:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok
	IL_0188:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_018d:  stloc 8

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldloc 8

	IL_0197:  nop 
	IL_0198:  nop 
	IL_0199:  ldloc 7

	IL_019d:  nop 
	IL_019e:  nop 
	IL_019f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01a4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01a9:  stloc 9

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  ldloc 9

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  ldc.i4 1
	IL_01ba:  beq IL_01c4

	IL_01bf:  br IL_02ca

	IL_01c4:  ldloc 4

	IL_01c8:  nop 
	IL_01c9:  nop 
	IL_01ca:  ldc.i4 1
	IL_01cf:  add 
	IL_01d0:  stloc 4

	IL_01d4:  nop 
	IL_01d5:  nop 
	IL_01d6:  ldarg 1

	IL_01da:  nop 
	IL_01db:  nop 
	IL_01dc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_01e1:  ldloc 4

	IL_01e5:  nop 
	IL_01e6:  nop 
	IL_01e7:  conv.u 
	IL_01e8:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01ed:  stloc 7

	IL_01f1:  nop 
	IL_01f2:  nop 
	IL_01f3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_01f8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01fd:  stloc 8

	IL_0201:  nop 
	IL_0202:  nop 
	IL_0203:  ldloc 8

	IL_0207:  nop 
	IL_0208:  nop 
	IL_0209:  ldloc 7

	IL_020d:  nop 
	IL_020e:  nop 
	IL_020f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0214:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0219:  stloc 9

	IL_021d:  nop 
	IL_021e:  nop 
	IL_021f:  ldloc 9

	IL_0223:  nop 
	IL_0224:  nop 
	IL_0225:  ldc.i4 1
	IL_022a:  beq IL_029e

	IL_022f:  br IL_0234

	IL_0234:  ldarg 1

	IL_0238:  nop 
	IL_0239:  nop 
	IL_023a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_023f:  ldloc 4

	IL_0243:  nop 
	IL_0244:  nop 
	IL_0245:  conv.u 
	IL_0246:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_024b:  stloc 10

	IL_024f:  nop 
	IL_0250:  nop 
	IL_0251:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0256:  stloc 11

	IL_025a:  nop 
	IL_025b:  nop 
	IL_025c:  ldloc 11

	IL_0260:  nop 
	IL_0261:  nop 
	IL_0262:  ldloc 10

	IL_0266:  nop 
	IL_0267:  nop 
	IL_0268:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_026d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0272:  ldloc 11

	IL_0276:  nop 
	IL_0277:  nop 
	IL_0278:  ldloc 10

	IL_027c:  nop 
	IL_027d:  nop 
	IL_027e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0283:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0288:  ldloc 2

	IL_028c:  nop 
	IL_028d:  nop 
	IL_028e:  ldloc 11

	IL_0292:  nop 
	IL_0293:  nop 
	IL_0294:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::InhClass
	IL_0299:  br IL_02c5

	IL_029e:  ldloc 2

	IL_02a2:  nop 
	IL_02a3:  nop 
	IL_02a4:  ldarg 1

	IL_02a8:  nop 
	IL_02a9:  nop 
	IL_02aa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_02af:  ldloc 4

	IL_02b3:  nop 
	IL_02b4:  nop 
	IL_02b5:  conv.u 
	IL_02b6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02bb:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::InhClass
	IL_02c0:  br IL_02c5

	IL_02c5:  br IL_02f1

	IL_02ca:  ldloc 2

	IL_02ce:  nop 
	IL_02cf:  nop 
	IL_02d0:  ldarg 1

	IL_02d4:  nop 
	IL_02d5:  nop 
	IL_02d6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_02db:  ldloc 4

	IL_02df:  nop 
	IL_02e0:  nop 
	IL_02e1:  conv.u 
	IL_02e2:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02e7:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::ClassName
	IL_02ec:  br IL_02f1

	IL_02f1:  br IL_02f6

	IL_02f6:  ldloc 4

	IL_02fa:  nop 
	IL_02fb:  nop 
	IL_02fc:  ldloc 5

	IL_0300:  nop 
	IL_0301:  nop 
	IL_0302:  beq IL_030c

	IL_0307:  br IL_0316

	IL_030c:  br IL_0320

	IL_0311:  br IL_0320

	IL_0316:  br IL_00d4

	IL_031b:  br IL_0320

	IL_0320:  br IL_032a

	IL_0325:  br IL_032a

	IL_032a:  ldloc 2

	IL_032e:  nop 
	IL_032f:  nop 
	IL_0330:  ret 
    } // end of method StmtOptimizer::checkClass

    // method line 51
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkField (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xdad8
	// Code size 840 (0x348)
	.maxstack 20
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_4,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_5,
		int32	V_6,
		int32	V_7,
		bool	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_9,
		class [mscorlib]System.Type	V_10,
		bool	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_13)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldnull 
	IL_0059:  stloc 3

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldarg 2

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  ldobj [mscorlib]System.Boolean
	IL_006a:  ldc.i4 1
	IL_006f:  beq IL_0079

	IL_0074:  br IL_033c

	IL_0079:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_007e:  stloc 4

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldloc 4

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  ldarg 1

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0095:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_009a:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_009f:  stloc 5

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldc.i4 1
	IL_00aa:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00af:  ldloc 5

	IL_00b3:  nop 
	IL_00b4:  nop 
	IL_00b5:  ldloc 4

	IL_00b9:  nop 
	IL_00ba:  nop 
	IL_00bb:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_00c0:  stloc 4

	IL_00c4:  nop 
	IL_00c5:  nop 
	IL_00c6:  ldc.i4 0
	IL_00cb:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00d0:  ldarg 1

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldloc 4

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00e1:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00e6:  ldloc 2

	IL_00ea:  nop 
	IL_00eb:  nop 
	IL_00ec:  ldarg 1

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00f7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00fc:  ldloc 2

	IL_0100:  nop 
	IL_0101:  nop 
	IL_0102:  ldarg 1

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_010d:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0112:  ldc.i4 0
	IL_0117:  stloc 6

	IL_011b:  nop 
	IL_011c:  nop 
	IL_011d:  ldarg 1

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0128:  ldlen 
	IL_0129:  conv.i4 
	IL_012a:  ldc.i4 3
	IL_012f:  sub 
	IL_0130:  stloc 7

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ldc.i4 0
	IL_013b:  stloc 8

	IL_013f:  nop 
	IL_0140:  nop 
	IL_0141:  ldloc 6

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldc.i4 1
	IL_014c:  add 
	IL_014d:  stloc 6

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  ldarg 1

	IL_0157:  nop 
	IL_0158:  nop 
	IL_0159:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_015e:  ldloc 6

	IL_0162:  nop 
	IL_0163:  nop 
	IL_0164:  conv.u 
	IL_0165:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_016a:  stloc 0

	IL_016e:  nop 
	IL_016f:  nop 
	IL_0170:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0175:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_017a:  stloc 1

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldloc 1

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  ldloc 0

	IL_018a:  nop 
	IL_018b:  nop 
	IL_018c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0191:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0196:  stloc 8

	IL_019a:  nop 
	IL_019b:  nop 
	IL_019c:  ldloc 8

	IL_01a0:  nop 
	IL_01a1:  nop 
	IL_01a2:  ldc.i4 1
	IL_01a7:  beq IL_01b1

	IL_01ac:  br IL_01d3

	IL_01b1:  ldloc 0

	IL_01b5:  nop 
	IL_01b6:  nop 
	IL_01b7:  stloc 3

	IL_01bb:  nop 
	IL_01bc:  nop 
	IL_01bd:  ldloc 2

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldloc 3

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::AddAttr(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute)
	IL_01ce:  br IL_01d8

	IL_01d3:  br IL_01d8

	IL_01d8:  ldloc 6

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 7

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  beq IL_01ee

	IL_01e9:  br IL_01f8

	IL_01ee:  br IL_0202

	IL_01f3:  br IL_0202

	IL_01f8:  br IL_0141

	IL_01fd:  br IL_0202

	IL_0202:  ldloc 6

	IL_0206:  nop 
	IL_0207:  nop 
	IL_0208:  ldc.i4 1
	IL_020d:  add 
	IL_020e:  stloc 6

	IL_0212:  nop 
	IL_0213:  nop 
	IL_0214:  ldarg 1

	IL_0218:  nop 
	IL_0219:  nop 
	IL_021a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_021f:  ldloc 6

	IL_0223:  nop 
	IL_0224:  nop 
	IL_0225:  conv.u 
	IL_0226:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_022b:  stloc 9

	IL_022f:  nop 
	IL_0230:  nop 
	IL_0231:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0236:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_023b:  stloc 10

	IL_023f:  nop 
	IL_0240:  nop 
	IL_0241:  ldloc 10

	IL_0245:  nop 
	IL_0246:  nop 
	IL_0247:  ldloc 9

	IL_024b:  nop 
	IL_024c:  nop 
	IL_024d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0252:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0257:  stloc 11

	IL_025b:  nop 
	IL_025c:  nop 
	IL_025d:  ldloc 11

	IL_0261:  nop 
	IL_0262:  nop 
	IL_0263:  ldc.i4 1
	IL_0268:  beq IL_02dc

	IL_026d:  br IL_0272

	IL_0272:  ldarg 1

	IL_0276:  nop 
	IL_0277:  nop 
	IL_0278:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_027d:  ldloc 6

	IL_0281:  nop 
	IL_0282:  nop 
	IL_0283:  conv.u 
	IL_0284:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0289:  stloc 12

	IL_028d:  nop 
	IL_028e:  nop 
	IL_028f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0294:  stloc 13

	IL_0298:  nop 
	IL_0299:  nop 
	IL_029a:  ldloc 13

	IL_029e:  nop 
	IL_029f:  nop 
	IL_02a0:  ldloc 12

	IL_02a4:  nop 
	IL_02a5:  nop 
	IL_02a6:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02ab:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02b0:  ldloc 13

	IL_02b4:  nop 
	IL_02b5:  nop 
	IL_02b6:  ldloc 12

	IL_02ba:  nop 
	IL_02bb:  nop 
	IL_02bc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02c1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02c6:  ldloc 2

	IL_02ca:  nop 
	IL_02cb:  nop 
	IL_02cc:  ldloc 13

	IL_02d0:  nop 
	IL_02d1:  nop 
	IL_02d2:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldTyp
	IL_02d7:  br IL_0303

	IL_02dc:  ldloc 2

	IL_02e0:  nop 
	IL_02e1:  nop 
	IL_02e2:  ldarg 1

	IL_02e6:  nop 
	IL_02e7:  nop 
	IL_02e8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_02ed:  ldloc 6

	IL_02f1:  nop 
	IL_02f2:  nop 
	IL_02f3:  conv.u 
	IL_02f4:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02f9:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldTyp
	IL_02fe:  br IL_0303

	IL_0303:  ldloc 6

	IL_0307:  nop 
	IL_0308:  nop 
	IL_0309:  ldc.i4 1
	IL_030e:  add 
	IL_030f:  stloc 6

	IL_0313:  nop 
	IL_0314:  nop 
	IL_0315:  ldloc 2

	IL_0319:  nop 
	IL_031a:  nop 
	IL_031b:  ldarg 1

	IL_031f:  nop 
	IL_0320:  nop 
	IL_0321:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0326:  ldloc 6

	IL_032a:  nop 
	IL_032b:  nop 
	IL_032c:  conv.u 
	IL_032d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0332:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldName
	IL_0337:  br IL_0341

	IL_033c:  br IL_0341

	IL_0341:  ldloc 2

	IL_0345:  nop 
	IL_0346:  nop 
	IL_0347:  ret 
    } // end of method StmtOptimizer::checkField

    // method line 52
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethod (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xde2c
	// Code size 1798 (0x706)
	.maxstack 53
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_5,
		bool	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_7,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_8,
		int32	V_9,
		int32	V_10,
		bool	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_12,
		class [mscorlib]System.Type	V_13,
		bool	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_15,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_16,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_17,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_18)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_005d:  stloc 3

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0068:  stloc 4

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldnull 
	IL_006f:  stloc 5

	IL_0073:  nop 
	IL_0074:  nop 
	IL_0075:  ldc.i4 0
	IL_007a:  stloc 6

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldarg 2

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldobj [mscorlib]System.Boolean
	IL_008b:  ldc.i4 1
	IL_0090:  beq IL_009a

	IL_0095:  br IL_06fa

	IL_009a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_009f:  stloc 7

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldloc 7

	IL_00a9:  nop 
	IL_00aa:  nop 
	IL_00ab:  ldarg 1

	IL_00af:  nop 
	IL_00b0:  nop 
	IL_00b1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00b6:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00bb:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_00c0:  stloc 8

	IL_00c4:  nop 
	IL_00c5:  nop 
	IL_00c6:  ldc.i4 1
	IL_00cb:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00d0:  ldloc 8

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldloc 7

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_00e1:  stloc 7

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ldc.i4 0
	IL_00ec:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00f1:  ldarg 1

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldloc 7

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0102:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0107:  ldloc 2

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldarg 1

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0118:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_011d:  ldloc 2

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldarg 1

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_012e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0133:  ldc.i4 0
	IL_0138:  stloc 9

	IL_013c:  nop 
	IL_013d:  nop 
	IL_013e:  ldarg 1

	IL_0142:  nop 
	IL_0143:  nop 
	IL_0144:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0149:  ldlen 
	IL_014a:  conv.i4 
	IL_014b:  ldc.i4 1
	IL_0150:  sub 
	IL_0151:  stloc 10

	IL_0155:  nop 
	IL_0156:  nop 
	IL_0157:  ldc.i4 0
	IL_015c:  stloc 11

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldloc 9

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  ldc.i4 1
	IL_016d:  add 
	IL_016e:  stloc 9

	IL_0172:  nop 
	IL_0173:  nop 
	IL_0174:  ldarg 1

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_017f:  ldloc 9

	IL_0183:  nop 
	IL_0184:  nop 
	IL_0185:  conv.u 
	IL_0186:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_018b:  stloc 0

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0196:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_019b:  stloc 1

	IL_019f:  nop 
	IL_01a0:  nop 
	IL_01a1:  ldloc 1

	IL_01a5:  nop 
	IL_01a6:  nop 
	IL_01a7:  ldloc 0

	IL_01ab:  nop 
	IL_01ac:  nop 
	IL_01ad:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01b2:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01b7:  stloc 11

	IL_01bb:  nop 
	IL_01bc:  nop 
	IL_01bd:  ldloc 11

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldc.i4 1
	IL_01c8:  beq IL_01d2

	IL_01cd:  br IL_01f4

	IL_01d2:  ldloc 0

	IL_01d6:  nop 
	IL_01d7:  nop 
	IL_01d8:  stloc 3

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 2

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldloc 3

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::AddAttr(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute)
	IL_01ef:  br IL_0210

	IL_01f4:  ldloc 9

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  ldc.i4 1
	IL_01ff:  sub 
	IL_0200:  stloc 9

	IL_0204:  nop 
	IL_0205:  nop 
	IL_0206:  br IL_023a

	IL_020b:  br IL_0210

	IL_0210:  ldloc 9

	IL_0214:  nop 
	IL_0215:  nop 
	IL_0216:  ldloc 10

	IL_021a:  nop 
	IL_021b:  nop 
	IL_021c:  beq IL_0226

	IL_0221:  br IL_0230

	IL_0226:  br IL_023a

	IL_022b:  br IL_023a

	IL_0230:  br IL_0162

	IL_0235:  br IL_023a

	IL_023a:  ldloc 9

	IL_023e:  nop 
	IL_023f:  nop 
	IL_0240:  ldc.i4 1
	IL_0245:  add 
	IL_0246:  stloc 9

	IL_024a:  nop 
	IL_024b:  nop 
	IL_024c:  ldarg 1

	IL_0250:  nop 
	IL_0251:  nop 
	IL_0252:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0257:  ldloc 9

	IL_025b:  nop 
	IL_025c:  nop 
	IL_025d:  conv.u 
	IL_025e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0263:  stloc 12

	IL_0267:  nop 
	IL_0268:  nop 
	IL_0269:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_026e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0273:  stloc 13

	IL_0277:  nop 
	IL_0278:  nop 
	IL_0279:  ldloc 13

	IL_027d:  nop 
	IL_027e:  nop 
	IL_027f:  ldloc 12

	IL_0283:  nop 
	IL_0284:  nop 
	IL_0285:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_028a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_028f:  stloc 14

	IL_0293:  nop 
	IL_0294:  nop 
	IL_0295:  ldloc 14

	IL_0299:  nop 
	IL_029a:  nop 
	IL_029b:  ldc.i4 1
	IL_02a0:  beq IL_0314

	IL_02a5:  br IL_02aa

	IL_02aa:  ldarg 1

	IL_02ae:  nop 
	IL_02af:  nop 
	IL_02b0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_02b5:  ldloc 9

	IL_02b9:  nop 
	IL_02ba:  nop 
	IL_02bb:  conv.u 
	IL_02bc:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02c1:  stloc 15

	IL_02c5:  nop 
	IL_02c6:  nop 
	IL_02c7:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_02cc:  stloc 16

	IL_02d0:  nop 
	IL_02d1:  nop 
	IL_02d2:  ldloc 16

	IL_02d6:  nop 
	IL_02d7:  nop 
	IL_02d8:  ldloc 15

	IL_02dc:  nop 
	IL_02dd:  nop 
	IL_02de:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02e3:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02e8:  ldloc 16

	IL_02ec:  nop 
	IL_02ed:  nop 
	IL_02ee:  ldloc 15

	IL_02f2:  nop 
	IL_02f3:  nop 
	IL_02f4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02f9:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02fe:  ldloc 2

	IL_0302:  nop 
	IL_0303:  nop 
	IL_0304:  ldloc 16

	IL_0308:  nop 
	IL_0309:  nop 
	IL_030a:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::RetTyp
	IL_030f:  br IL_033b

	IL_0314:  ldloc 2

	IL_0318:  nop 
	IL_0319:  nop 
	IL_031a:  ldarg 1

	IL_031e:  nop 
	IL_031f:  nop 
	IL_0320:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0325:  ldloc 9

	IL_0329:  nop 
	IL_032a:  nop 
	IL_032b:  conv.u 
	IL_032c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0331:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::RetTyp
	IL_0336:  br IL_033b

	IL_033b:  ldloc 9

	IL_033f:  nop 
	IL_0340:  nop 
	IL_0341:  ldc.i4 1
	IL_0346:  add 
	IL_0347:  stloc 9

	IL_034b:  nop 
	IL_034c:  nop 
	IL_034d:  ldarg 1

	IL_0351:  nop 
	IL_0352:  nop 
	IL_0353:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0358:  ldloc 9

	IL_035c:  nop 
	IL_035d:  nop 
	IL_035e:  conv.u 
	IL_035f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0364:  stloc 12

	IL_0368:  nop 
	IL_0369:  nop 
	IL_036a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_036f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0374:  stloc 13

	IL_0378:  nop 
	IL_0379:  nop 
	IL_037a:  ldloc 13

	IL_037e:  nop 
	IL_037f:  nop 
	IL_0380:  ldloc 12

	IL_0384:  nop 
	IL_0385:  nop 
	IL_0386:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_038b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0390:  stloc 14

	IL_0394:  nop 
	IL_0395:  nop 
	IL_0396:  ldloc 14

	IL_039a:  nop 
	IL_039b:  nop 
	IL_039c:  ldc.i4 1
	IL_03a1:  beq IL_03ab

	IL_03a6:  br IL_03c1

	IL_03ab:  ldloc 2

	IL_03af:  nop 
	IL_03b0:  nop 
	IL_03b1:  ldloc 12

	IL_03b5:  nop 
	IL_03b6:  nop 
	IL_03b7:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::MethodName
	IL_03bc:  br IL_03c6

	IL_03c1:  br IL_03c6

	IL_03c6:  ldloc 9

	IL_03ca:  nop 
	IL_03cb:  nop 
	IL_03cc:  ldc.i4 1
	IL_03d1:  add 
	IL_03d2:  stloc 9

	IL_03d6:  nop 
	IL_03d7:  nop 
	IL_03d8:  ldarg 1

	IL_03dc:  nop 
	IL_03dd:  nop 
	IL_03de:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_03e3:  ldloc 9

	IL_03e7:  nop 
	IL_03e8:  nop 
	IL_03e9:  conv.u 
	IL_03ea:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03ef:  stloc 12

	IL_03f3:  nop 
	IL_03f4:  nop 
	IL_03f5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_03fa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03ff:  stloc 13

	IL_0403:  nop 
	IL_0404:  nop 
	IL_0405:  ldloc 13

	IL_0409:  nop 
	IL_040a:  nop 
	IL_040b:  ldloc 12

	IL_040f:  nop 
	IL_0410:  nop 
	IL_0411:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0416:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_041b:  stloc 14

	IL_041f:  nop 
	IL_0420:  nop 
	IL_0421:  ldloc 14

	IL_0425:  nop 
	IL_0426:  nop 
	IL_0427:  ldc.i4 1
	IL_042c:  beq IL_0436

	IL_0431:  br IL_06f0

	IL_0436:  ldloc 9

	IL_043a:  nop 
	IL_043b:  nop 
	IL_043c:  ldc.i4 1
	IL_0441:  add 
	IL_0442:  stloc 9

	IL_0446:  nop 
	IL_0447:  nop 
	IL_0448:  ldarg 1

	IL_044c:  nop 
	IL_044d:  nop 
	IL_044e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0453:  ldloc 9

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  conv.u 
	IL_045a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_045f:  stloc 12

	IL_0463:  nop 
	IL_0464:  nop 
	IL_0465:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_046a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_046f:  stloc 13

	IL_0473:  nop 
	IL_0474:  nop 
	IL_0475:  ldloc 13

	IL_0479:  nop 
	IL_047a:  nop 
	IL_047b:  ldloc 12

	IL_047f:  nop 
	IL_0480:  nop 
	IL_0481:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0486:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_048b:  stloc 14

	IL_048f:  nop 
	IL_0490:  nop 
	IL_0491:  ldloc 14

	IL_0495:  nop 
	IL_0496:  nop 
	IL_0497:  ldc.i4 1
	IL_049c:  beq IL_04a6

	IL_04a1:  br IL_0532

	IL_04a6:  ldloc 6

	IL_04aa:  nop 
	IL_04ab:  nop 
	IL_04ac:  ldc.i4 1
	IL_04b1:  beq IL_04bb

	IL_04b6:  br IL_0518

	IL_04bb:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_04c0:  stloc 17

	IL_04c4:  nop 
	IL_04c5:  nop 
	IL_04c6:  ldloc 17

	IL_04ca:  nop 
	IL_04cb:  nop 
	IL_04cc:  ldloc 5

	IL_04d0:  nop 
	IL_04d1:  nop 
	IL_04d2:  ldloca 11

	IL_04d6:  nop 
	IL_04d7:  nop 
	IL_04d8:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::checkVarAs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, [out] bool&)
	IL_04dd:  stloc 5

	IL_04e1:  nop 
	IL_04e2:  nop 
	IL_04e3:  ldloc 11

	IL_04e7:  nop 
	IL_04e8:  nop 
	IL_04e9:  ldc.i4 1
	IL_04ee:  beq IL_04f8

	IL_04f3:  br IL_050e

	IL_04f8:  ldloc 2

	IL_04fc:  nop 
	IL_04fd:  nop 
	IL_04fe:  ldloc 5

	IL_0502:  nop 
	IL_0503:  nop 
	IL_0504:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0509:  br IL_0513

	IL_050e:  br IL_0513

	IL_0513:  br IL_051d

	IL_0518:  br IL_051d

	IL_051d:  ldc.i4 0
	IL_0522:  stloc 6

	IL_0526:  nop 
	IL_0527:  nop 
	IL_0528:  br IL_06eb

	IL_052d:  br IL_0537

	IL_0532:  br IL_0537

	IL_0537:  ldarg 1

	IL_053b:  nop 
	IL_053c:  nop 
	IL_053d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0542:  ldloc 9

	IL_0546:  nop 
	IL_0547:  nop 
	IL_0548:  conv.u 
	IL_0549:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_054e:  stloc 12

	IL_0552:  nop 
	IL_0553:  nop 
	IL_0554:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok
	IL_0559:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_055e:  stloc 13

	IL_0562:  nop 
	IL_0563:  nop 
	IL_0564:  ldloc 13

	IL_0568:  nop 
	IL_0569:  nop 
	IL_056a:  ldloc 12

	IL_056e:  nop 
	IL_056f:  nop 
	IL_0570:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0575:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_057a:  stloc 14

	IL_057e:  nop 
	IL_057f:  nop 
	IL_0580:  ldloc 14

	IL_0584:  nop 
	IL_0585:  nop 
	IL_0586:  ldc.i4 1
	IL_058b:  beq IL_0595

	IL_0590:  br IL_05b0

	IL_0595:  ldc.i4 1
	IL_059a:  stloc 6

	IL_059e:  nop 
	IL_059f:  nop 
	IL_05a0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_05a5:  stloc 5

	IL_05a9:  nop 
	IL_05aa:  nop 
	IL_05ab:  br IL_05b5

	IL_05b0:  br IL_05b5

	IL_05b5:  ldarg 1

	IL_05b9:  nop 
	IL_05ba:  nop 
	IL_05bb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_05c0:  ldloc 9

	IL_05c4:  nop 
	IL_05c5:  nop 
	IL_05c6:  conv.u 
	IL_05c7:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_05cc:  stloc 12

	IL_05d0:  nop 
	IL_05d1:  nop 
	IL_05d2:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_05d7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05dc:  stloc 13

	IL_05e0:  nop 
	IL_05e1:  nop 
	IL_05e2:  ldloc 13

	IL_05e6:  nop 
	IL_05e7:  nop 
	IL_05e8:  ldloc 12

	IL_05ec:  nop 
	IL_05ed:  nop 
	IL_05ee:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_05f3:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05f8:  stloc 14

	IL_05fc:  nop 
	IL_05fd:  nop 
	IL_05fe:  ldloc 14

	IL_0602:  nop 
	IL_0603:  nop 
	IL_0604:  ldc.i4 1
	IL_0609:  beq IL_0613

	IL_060e:  br IL_067b

	IL_0613:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_0618:  stloc 18

	IL_061c:  nop 
	IL_061d:  nop 
	IL_061e:  ldloc 18

	IL_0622:  nop 
	IL_0623:  nop 
	IL_0624:  ldloc 5

	IL_0628:  nop 
	IL_0629:  nop 
	IL_062a:  ldloca 11

	IL_062e:  nop 
	IL_062f:  nop 
	IL_0630:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::checkVarAs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, [out] bool&)
	IL_0635:  stloc 5

	IL_0639:  nop 
	IL_063a:  nop 
	IL_063b:  ldloc 11

	IL_063f:  nop 
	IL_0640:  nop 
	IL_0641:  ldc.i4 1
	IL_0646:  beq IL_0650

	IL_064b:  br IL_0666

	IL_0650:  ldloc 2

	IL_0654:  nop 
	IL_0655:  nop 
	IL_0656:  ldloc 5

	IL_065a:  nop 
	IL_065b:  nop 
	IL_065c:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0661:  br IL_066b

	IL_0666:  br IL_066b

	IL_066b:  ldc.i4 0
	IL_0670:  stloc 6

	IL_0674:  nop 
	IL_0675:  nop 
	IL_0676:  br IL_0680

	IL_067b:  br IL_0680

	IL_0680:  ldloc 6

	IL_0684:  nop 
	IL_0685:  nop 
	IL_0686:  ldc.i4 1
	IL_068b:  beq IL_0695

	IL_0690:  br IL_06bc

	IL_0695:  ldloc 5

	IL_0699:  nop 
	IL_069a:  nop 
	IL_069b:  ldarg 1

	IL_069f:  nop 
	IL_06a0:  nop 
	IL_06a1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_06a6:  ldloc 9

	IL_06aa:  nop 
	IL_06ab:  nop 
	IL_06ac:  conv.u 
	IL_06ad:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_06b2:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_06b7:  br IL_06c1

	IL_06bc:  br IL_06c1

	IL_06c1:  ldloc 9

	IL_06c5:  nop 
	IL_06c6:  nop 
	IL_06c7:  ldloc 10

	IL_06cb:  nop 
	IL_06cc:  nop 
	IL_06cd:  beq IL_06d7

	IL_06d2:  br IL_06e1

	IL_06d7:  br IL_06eb

	IL_06dc:  br IL_06eb

	IL_06e1:  br IL_0436

	IL_06e6:  br IL_06eb

	IL_06eb:  br IL_06f5

	IL_06f0:  br IL_06f5

	IL_06f5:  br IL_06ff

	IL_06fa:  br IL_06ff

	IL_06ff:  ldloc 2

	IL_0703:  nop 
	IL_0704:  nop 
	IL_0705:  ret 
    } // end of method StmtOptimizer::checkMethod

    // method line 53
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDelegate (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xe540
	// Code size 1798 (0x706)
	.maxstack 53
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_5,
		bool	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_7,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_8,
		int32	V_9,
		int32	V_10,
		bool	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_12,
		class [mscorlib]System.Type	V_13,
		bool	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_15,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_16,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_17,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_18)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DelegateTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute::'.ctor'()
	IL_005d:  stloc 3

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_0068:  stloc 4

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldnull 
	IL_006f:  stloc 5

	IL_0073:  nop 
	IL_0074:  nop 
	IL_0075:  ldc.i4 0
	IL_007a:  stloc 6

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldarg 2

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldobj [mscorlib]System.Boolean
	IL_008b:  ldc.i4 1
	IL_0090:  beq IL_009a

	IL_0095:  br IL_06fa

	IL_009a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_009f:  stloc 7

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldloc 7

	IL_00a9:  nop 
	IL_00aa:  nop 
	IL_00ab:  ldarg 1

	IL_00af:  nop 
	IL_00b0:  nop 
	IL_00b1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00b6:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00bb:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_00c0:  stloc 8

	IL_00c4:  nop 
	IL_00c5:  nop 
	IL_00c6:  ldc.i4 1
	IL_00cb:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00d0:  ldloc 8

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldloc 7

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_00e1:  stloc 7

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ldc.i4 0
	IL_00ec:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00f1:  ldarg 1

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldloc 7

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0102:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0107:  ldloc 2

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldarg 1

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0118:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_011d:  ldloc 2

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldarg 1

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_012e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0133:  ldc.i4 0
	IL_0138:  stloc 9

	IL_013c:  nop 
	IL_013d:  nop 
	IL_013e:  ldarg 1

	IL_0142:  nop 
	IL_0143:  nop 
	IL_0144:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0149:  ldlen 
	IL_014a:  conv.i4 
	IL_014b:  ldc.i4 1
	IL_0150:  sub 
	IL_0151:  stloc 10

	IL_0155:  nop 
	IL_0156:  nop 
	IL_0157:  ldc.i4 0
	IL_015c:  stloc 11

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldloc 9

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  ldc.i4 1
	IL_016d:  add 
	IL_016e:  stloc 9

	IL_0172:  nop 
	IL_0173:  nop 
	IL_0174:  ldarg 1

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_017f:  ldloc 9

	IL_0183:  nop 
	IL_0184:  nop 
	IL_0185:  conv.u 
	IL_0186:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_018b:  stloc 0

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0196:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_019b:  stloc 1

	IL_019f:  nop 
	IL_01a0:  nop 
	IL_01a1:  ldloc 1

	IL_01a5:  nop 
	IL_01a6:  nop 
	IL_01a7:  ldloc 0

	IL_01ab:  nop 
	IL_01ac:  nop 
	IL_01ad:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01b2:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01b7:  stloc 11

	IL_01bb:  nop 
	IL_01bc:  nop 
	IL_01bd:  ldloc 11

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldc.i4 1
	IL_01c8:  beq IL_01d2

	IL_01cd:  br IL_01f4

	IL_01d2:  ldloc 0

	IL_01d6:  nop 
	IL_01d7:  nop 
	IL_01d8:  stloc 3

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldloc 2

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldloc 3

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::AddAttr(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute)
	IL_01ef:  br IL_0210

	IL_01f4:  ldloc 9

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  ldc.i4 1
	IL_01ff:  sub 
	IL_0200:  stloc 9

	IL_0204:  nop 
	IL_0205:  nop 
	IL_0206:  br IL_023a

	IL_020b:  br IL_0210

	IL_0210:  ldloc 9

	IL_0214:  nop 
	IL_0215:  nop 
	IL_0216:  ldloc 10

	IL_021a:  nop 
	IL_021b:  nop 
	IL_021c:  beq IL_0226

	IL_0221:  br IL_0230

	IL_0226:  br IL_023a

	IL_022b:  br IL_023a

	IL_0230:  br IL_0162

	IL_0235:  br IL_023a

	IL_023a:  ldloc 9

	IL_023e:  nop 
	IL_023f:  nop 
	IL_0240:  ldc.i4 1
	IL_0245:  add 
	IL_0246:  stloc 9

	IL_024a:  nop 
	IL_024b:  nop 
	IL_024c:  ldarg 1

	IL_0250:  nop 
	IL_0251:  nop 
	IL_0252:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0257:  ldloc 9

	IL_025b:  nop 
	IL_025c:  nop 
	IL_025d:  conv.u 
	IL_025e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0263:  stloc 12

	IL_0267:  nop 
	IL_0268:  nop 
	IL_0269:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_026e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0273:  stloc 13

	IL_0277:  nop 
	IL_0278:  nop 
	IL_0279:  ldloc 13

	IL_027d:  nop 
	IL_027e:  nop 
	IL_027f:  ldloc 12

	IL_0283:  nop 
	IL_0284:  nop 
	IL_0285:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_028a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_028f:  stloc 14

	IL_0293:  nop 
	IL_0294:  nop 
	IL_0295:  ldloc 14

	IL_0299:  nop 
	IL_029a:  nop 
	IL_029b:  ldc.i4 1
	IL_02a0:  beq IL_0314

	IL_02a5:  br IL_02aa

	IL_02aa:  ldarg 1

	IL_02ae:  nop 
	IL_02af:  nop 
	IL_02b0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_02b5:  ldloc 9

	IL_02b9:  nop 
	IL_02ba:  nop 
	IL_02bb:  conv.u 
	IL_02bc:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02c1:  stloc 15

	IL_02c5:  nop 
	IL_02c6:  nop 
	IL_02c7:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_02cc:  stloc 16

	IL_02d0:  nop 
	IL_02d1:  nop 
	IL_02d2:  ldloc 16

	IL_02d6:  nop 
	IL_02d7:  nop 
	IL_02d8:  ldloc 15

	IL_02dc:  nop 
	IL_02dd:  nop 
	IL_02de:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02e3:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_02e8:  ldloc 16

	IL_02ec:  nop 
	IL_02ed:  nop 
	IL_02ee:  ldloc 15

	IL_02f2:  nop 
	IL_02f3:  nop 
	IL_02f4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02f9:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02fe:  ldloc 2

	IL_0302:  nop 
	IL_0303:  nop 
	IL_0304:  ldloc 16

	IL_0308:  nop 
	IL_0309:  nop 
	IL_030a:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::RetTyp
	IL_030f:  br IL_033b

	IL_0314:  ldloc 2

	IL_0318:  nop 
	IL_0319:  nop 
	IL_031a:  ldarg 1

	IL_031e:  nop 
	IL_031f:  nop 
	IL_0320:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0325:  ldloc 9

	IL_0329:  nop 
	IL_032a:  nop 
	IL_032b:  conv.u 
	IL_032c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0331:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::RetTyp
	IL_0336:  br IL_033b

	IL_033b:  ldloc 9

	IL_033f:  nop 
	IL_0340:  nop 
	IL_0341:  ldc.i4 1
	IL_0346:  add 
	IL_0347:  stloc 9

	IL_034b:  nop 
	IL_034c:  nop 
	IL_034d:  ldarg 1

	IL_0351:  nop 
	IL_0352:  nop 
	IL_0353:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0358:  ldloc 9

	IL_035c:  nop 
	IL_035d:  nop 
	IL_035e:  conv.u 
	IL_035f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0364:  stloc 12

	IL_0368:  nop 
	IL_0369:  nop 
	IL_036a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_036f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0374:  stloc 13

	IL_0378:  nop 
	IL_0379:  nop 
	IL_037a:  ldloc 13

	IL_037e:  nop 
	IL_037f:  nop 
	IL_0380:  ldloc 12

	IL_0384:  nop 
	IL_0385:  nop 
	IL_0386:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_038b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0390:  stloc 14

	IL_0394:  nop 
	IL_0395:  nop 
	IL_0396:  ldloc 14

	IL_039a:  nop 
	IL_039b:  nop 
	IL_039c:  ldc.i4 1
	IL_03a1:  beq IL_03ab

	IL_03a6:  br IL_03c1

	IL_03ab:  ldloc 2

	IL_03af:  nop 
	IL_03b0:  nop 
	IL_03b1:  ldloc 12

	IL_03b5:  nop 
	IL_03b6:  nop 
	IL_03b7:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::DelegateName
	IL_03bc:  br IL_03c6

	IL_03c1:  br IL_03c6

	IL_03c6:  ldloc 9

	IL_03ca:  nop 
	IL_03cb:  nop 
	IL_03cc:  ldc.i4 1
	IL_03d1:  add 
	IL_03d2:  stloc 9

	IL_03d6:  nop 
	IL_03d7:  nop 
	IL_03d8:  ldarg 1

	IL_03dc:  nop 
	IL_03dd:  nop 
	IL_03de:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_03e3:  ldloc 9

	IL_03e7:  nop 
	IL_03e8:  nop 
	IL_03e9:  conv.u 
	IL_03ea:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03ef:  stloc 12

	IL_03f3:  nop 
	IL_03f4:  nop 
	IL_03f5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_03fa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03ff:  stloc 13

	IL_0403:  nop 
	IL_0404:  nop 
	IL_0405:  ldloc 13

	IL_0409:  nop 
	IL_040a:  nop 
	IL_040b:  ldloc 12

	IL_040f:  nop 
	IL_0410:  nop 
	IL_0411:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0416:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_041b:  stloc 14

	IL_041f:  nop 
	IL_0420:  nop 
	IL_0421:  ldloc 14

	IL_0425:  nop 
	IL_0426:  nop 
	IL_0427:  ldc.i4 1
	IL_042c:  beq IL_0436

	IL_0431:  br IL_06f0

	IL_0436:  ldloc 9

	IL_043a:  nop 
	IL_043b:  nop 
	IL_043c:  ldc.i4 1
	IL_0441:  add 
	IL_0442:  stloc 9

	IL_0446:  nop 
	IL_0447:  nop 
	IL_0448:  ldarg 1

	IL_044c:  nop 
	IL_044d:  nop 
	IL_044e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0453:  ldloc 9

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  conv.u 
	IL_045a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_045f:  stloc 12

	IL_0463:  nop 
	IL_0464:  nop 
	IL_0465:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_046a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_046f:  stloc 13

	IL_0473:  nop 
	IL_0474:  nop 
	IL_0475:  ldloc 13

	IL_0479:  nop 
	IL_047a:  nop 
	IL_047b:  ldloc 12

	IL_047f:  nop 
	IL_0480:  nop 
	IL_0481:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0486:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_048b:  stloc 14

	IL_048f:  nop 
	IL_0490:  nop 
	IL_0491:  ldloc 14

	IL_0495:  nop 
	IL_0496:  nop 
	IL_0497:  ldc.i4 1
	IL_049c:  beq IL_04a6

	IL_04a1:  br IL_0532

	IL_04a6:  ldloc 6

	IL_04aa:  nop 
	IL_04ab:  nop 
	IL_04ac:  ldc.i4 1
	IL_04b1:  beq IL_04bb

	IL_04b6:  br IL_0518

	IL_04bb:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_04c0:  stloc 17

	IL_04c4:  nop 
	IL_04c5:  nop 
	IL_04c6:  ldloc 17

	IL_04ca:  nop 
	IL_04cb:  nop 
	IL_04cc:  ldloc 5

	IL_04d0:  nop 
	IL_04d1:  nop 
	IL_04d2:  ldloca 11

	IL_04d6:  nop 
	IL_04d7:  nop 
	IL_04d8:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::checkVarAs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, [out] bool&)
	IL_04dd:  stloc 5

	IL_04e1:  nop 
	IL_04e2:  nop 
	IL_04e3:  ldloc 11

	IL_04e7:  nop 
	IL_04e8:  nop 
	IL_04e9:  ldc.i4 1
	IL_04ee:  beq IL_04f8

	IL_04f3:  br IL_050e

	IL_04f8:  ldloc 2

	IL_04fc:  nop 
	IL_04fd:  nop 
	IL_04fe:  ldloc 5

	IL_0502:  nop 
	IL_0503:  nop 
	IL_0504:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0509:  br IL_0513

	IL_050e:  br IL_0513

	IL_0513:  br IL_051d

	IL_0518:  br IL_051d

	IL_051d:  ldc.i4 0
	IL_0522:  stloc 6

	IL_0526:  nop 
	IL_0527:  nop 
	IL_0528:  br IL_06eb

	IL_052d:  br IL_0537

	IL_0532:  br IL_0537

	IL_0537:  ldarg 1

	IL_053b:  nop 
	IL_053c:  nop 
	IL_053d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0542:  ldloc 9

	IL_0546:  nop 
	IL_0547:  nop 
	IL_0548:  conv.u 
	IL_0549:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_054e:  stloc 12

	IL_0552:  nop 
	IL_0553:  nop 
	IL_0554:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok
	IL_0559:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_055e:  stloc 13

	IL_0562:  nop 
	IL_0563:  nop 
	IL_0564:  ldloc 13

	IL_0568:  nop 
	IL_0569:  nop 
	IL_056a:  ldloc 12

	IL_056e:  nop 
	IL_056f:  nop 
	IL_0570:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0575:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_057a:  stloc 14

	IL_057e:  nop 
	IL_057f:  nop 
	IL_0580:  ldloc 14

	IL_0584:  nop 
	IL_0585:  nop 
	IL_0586:  ldc.i4 1
	IL_058b:  beq IL_0595

	IL_0590:  br IL_05b0

	IL_0595:  ldc.i4 1
	IL_059a:  stloc 6

	IL_059e:  nop 
	IL_059f:  nop 
	IL_05a0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_05a5:  stloc 5

	IL_05a9:  nop 
	IL_05aa:  nop 
	IL_05ab:  br IL_05b5

	IL_05b0:  br IL_05b5

	IL_05b5:  ldarg 1

	IL_05b9:  nop 
	IL_05ba:  nop 
	IL_05bb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_05c0:  ldloc 9

	IL_05c4:  nop 
	IL_05c5:  nop 
	IL_05c6:  conv.u 
	IL_05c7:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_05cc:  stloc 12

	IL_05d0:  nop 
	IL_05d1:  nop 
	IL_05d2:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_05d7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05dc:  stloc 13

	IL_05e0:  nop 
	IL_05e1:  nop 
	IL_05e2:  ldloc 13

	IL_05e6:  nop 
	IL_05e7:  nop 
	IL_05e8:  ldloc 12

	IL_05ec:  nop 
	IL_05ed:  nop 
	IL_05ee:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_05f3:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05f8:  stloc 14

	IL_05fc:  nop 
	IL_05fd:  nop 
	IL_05fe:  ldloc 14

	IL_0602:  nop 
	IL_0603:  nop 
	IL_0604:  ldc.i4 1
	IL_0609:  beq IL_0613

	IL_060e:  br IL_067b

	IL_0613:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_0618:  stloc 18

	IL_061c:  nop 
	IL_061d:  nop 
	IL_061e:  ldloc 18

	IL_0622:  nop 
	IL_0623:  nop 
	IL_0624:  ldloc 5

	IL_0628:  nop 
	IL_0629:  nop 
	IL_062a:  ldloca 11

	IL_062e:  nop 
	IL_062f:  nop 
	IL_0630:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::checkVarAs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, [out] bool&)
	IL_0635:  stloc 5

	IL_0639:  nop 
	IL_063a:  nop 
	IL_063b:  ldloc 11

	IL_063f:  nop 
	IL_0640:  nop 
	IL_0641:  ldc.i4 1
	IL_0646:  beq IL_0650

	IL_064b:  br IL_0666

	IL_0650:  ldloc 2

	IL_0654:  nop 
	IL_0655:  nop 
	IL_0656:  ldloc 5

	IL_065a:  nop 
	IL_065b:  nop 
	IL_065c:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0661:  br IL_066b

	IL_0666:  br IL_066b

	IL_066b:  ldc.i4 0
	IL_0670:  stloc 6

	IL_0674:  nop 
	IL_0675:  nop 
	IL_0676:  br IL_0680

	IL_067b:  br IL_0680

	IL_0680:  ldloc 6

	IL_0684:  nop 
	IL_0685:  nop 
	IL_0686:  ldc.i4 1
	IL_068b:  beq IL_0695

	IL_0690:  br IL_06bc

	IL_0695:  ldloc 5

	IL_0699:  nop 
	IL_069a:  nop 
	IL_069b:  ldarg 1

	IL_069f:  nop 
	IL_06a0:  nop 
	IL_06a1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_06a6:  ldloc 9

	IL_06aa:  nop 
	IL_06ab:  nop 
	IL_06ac:  conv.u 
	IL_06ad:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_06b2:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_06b7:  br IL_06c1

	IL_06bc:  br IL_06c1

	IL_06c1:  ldloc 9

	IL_06c5:  nop 
	IL_06c6:  nop 
	IL_06c7:  ldloc 10

	IL_06cb:  nop 
	IL_06cc:  nop 
	IL_06cd:  beq IL_06d7

	IL_06d2:  br IL_06e1

	IL_06d7:  br IL_06eb

	IL_06dc:  br IL_06eb

	IL_06e1:  br IL_0436

	IL_06e6:  br IL_06eb

	IL_06eb:  br IL_06f5

	IL_06f0:  br IL_06f5

	IL_06f5:  br IL_06ff

	IL_06fa:  br IL_06ff

	IL_06ff:  ldloc 2

	IL_0703:  nop 
	IL_0704:  nop 
	IL_0705:  ret 
    } // end of method StmtOptimizer::checkDelegate

    // method line 54
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethodCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xec54
	// Code size 347 (0x15b)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt	V_3,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_5)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  bgt IL_001c

	IL_0017:  br IL_014f

	IL_001c:  ldarg 1

	IL_0020:  nop 
	IL_0021:  nop 
	IL_0022:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0027:  ldc.i4 0
	IL_002c:  conv.u 
	IL_002d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0032:  stloc 0

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_003d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0042:  stloc 1

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldloc 1

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0059:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_005e:  stloc 2

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  ldarg 2

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldloc 2

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  stobj [mscorlib]System.Boolean
	IL_0075:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::'.ctor'()
	IL_007a:  stloc 3

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldarg 2

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldobj [mscorlib]System.Boolean
	IL_008b:  ldc.i4 1
	IL_0090:  beq IL_009a

	IL_0095:  br IL_0145

	IL_009a:  ldloc 3

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  ldarg 1

	IL_00a4:  nop 
	IL_00a5:  nop 
	IL_00a6:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ab:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b0:  ldloc 3

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  ldarg 1

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00c1:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00c6:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_00cb:  stloc 4

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_00d6:  stloc 5

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldloc 5

	IL_00e0:  nop 
	IL_00e1:  nop 
	IL_00e2:  ldarg 1

	IL_00e6:  nop 
	IL_00e7:  nop 
	IL_00e8:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ed:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_00f2:  ldloc 5

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldarg 1

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0103:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0108:  ldloc 4

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldloc 5

	IL_0112:  nop 
	IL_0113:  nop 
	IL_0114:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0119:  stloc 5

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  ldloc 3

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  ldloc 5

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0130:  ldc.i4 0
	IL_0135:  conv.u 
	IL_0136:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_013b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::MethodToken
	IL_0140:  br IL_014a

	IL_0145:  br IL_014a

	IL_014a:  br IL_0154

	IL_014f:  br IL_0154

	IL_0154:  ldloc 3

	IL_0158:  nop 
	IL_0159:  nop 
	IL_015a:  ret 
    } // end of method StmtOptimizer::checkMethodCall

    // method line 55
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVarAs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xedbc
	// Code size 533 (0x215)
	.maxstack 12
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_3,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_5,
		class [mscorlib]System.Type	V_6,
		bool	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_9)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldc.i4 0
	IL_0010:  conv.u 
	IL_0011:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0016:  stloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok
	IL_0021:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldarg 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 1

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 0

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0048:  stobj [mscorlib]System.Boolean
	IL_004d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::'.ctor'()
	IL_0052:  stloc 2

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldobj [mscorlib]System.Boolean
	IL_0063:  ldc.i4 1
	IL_0068:  beq IL_0072

	IL_006d:  br IL_0209

	IL_0072:  ldloc 2

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldarg 1

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0083:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0088:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_008d:  stloc 3

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldloc 3

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldloc 2

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00a4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00a9:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_00ae:  stloc 4

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldloc 4

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  ldloc 3

	IL_00be:  nop 
	IL_00bf:  nop 
	IL_00c0:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_00c5:  stloc 3

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  ldloc 2

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  ldloc 3

	IL_00d5:  nop 
	IL_00d6:  nop 
	IL_00d7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00dc:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00e1:  ldloc 2

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  ldarg 1

	IL_00eb:  nop 
	IL_00ec:  nop 
	IL_00ed:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00f2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00f7:  ldloc 2

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  ldarg 1

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0108:  ldc.i4 1
	IL_010d:  conv.u 
	IL_010e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0113:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarName
	IL_0118:  ldarg 1

	IL_011c:  nop 
	IL_011d:  nop 
	IL_011e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0123:  ldc.i4 3
	IL_0128:  conv.u 
	IL_0129:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_012e:  stloc 5

	IL_0132:  nop 
	IL_0133:  nop 
	IL_0134:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0139:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_013e:  stloc 6

	IL_0142:  nop 
	IL_0143:  nop 
	IL_0144:  ldloc 6

	IL_0148:  nop 
	IL_0149:  nop 
	IL_014a:  ldloc 5

	IL_014e:  nop 
	IL_014f:  nop 
	IL_0150:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0155:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_015a:  stloc 7

	IL_015e:  nop 
	IL_015f:  nop 
	IL_0160:  ldloc 7

	IL_0164:  nop 
	IL_0165:  nop 
	IL_0166:  ldc.i4 1
	IL_016b:  beq IL_01de

	IL_0170:  br IL_0175

	IL_0175:  ldarg 1

	IL_0179:  nop 
	IL_017a:  nop 
	IL_017b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0180:  ldc.i4 3
	IL_0185:  conv.u 
	IL_0186:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_018b:  stloc 8

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0196:  stloc 9

	IL_019a:  nop 
	IL_019b:  nop 
	IL_019c:  ldloc 9

	IL_01a0:  nop 
	IL_01a1:  nop 
	IL_01a2:  ldloc 8

	IL_01a6:  nop 
	IL_01a7:  nop 
	IL_01a8:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_01ad:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_01b2:  ldloc 9

	IL_01b6:  nop 
	IL_01b7:  nop 
	IL_01b8:  ldloc 8

	IL_01bc:  nop 
	IL_01bd:  nop 
	IL_01be:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01c3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01c8:  ldloc 2

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldloc 9

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarTyp
	IL_01d9:  br IL_0204

	IL_01de:  ldloc 2

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldarg 1

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_01ef:  ldc.i4 3
	IL_01f4:  conv.u 
	IL_01f5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01fa:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarTyp
	IL_01ff:  br IL_0204

	IL_0204:  br IL_020e

	IL_0209:  br IL_020e

	IL_020e:  ldloc 2

	IL_0212:  nop 
	IL_0213:  nop 
	IL_0214:  ret 
    } // end of method StmtOptimizer::checkVarAs

    // method line 56
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt AssOpt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xefe0
	// Code size 535 (0x217)
	.maxstack 14
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_2,
		class [mscorlib]System.Type	V_3,
		bool	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_6,
		class [mscorlib]System.Type	V_7,
		bool	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_10,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_11)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  stloc 0

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldloc 0

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::LExp
	IL_0017:  stloc 1

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldloc 1

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0028:  ldc.i4 0
	IL_002d:  conv.u 
	IL_002e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0033:  stloc 2

	IL_0037:  nop 
	IL_0038:  nop 
	IL_0039:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok
	IL_003e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0043:  stloc 3

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldloc 3

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldloc 2

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_005a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_005f:  stloc 4

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::'.ctor'()
	IL_006a:  stloc 5

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldloc 4

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldc.i4 1
	IL_007b:  beq IL_0085

	IL_0080:  br IL_020b

	IL_0085:  ldloc 5

	IL_0089:  nop 
	IL_008a:  nop 
	IL_008b:  ldloc 0

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0096:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_009b:  ldloc 5

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 0

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ac:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00b1:  ldloc 5

	IL_00b5:  nop 
	IL_00b6:  nop 
	IL_00b7:  ldloc 1

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00c2:  ldc.i4 1
	IL_00c7:  conv.u 
	IL_00c8:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00cd:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarName
	IL_00d2:  ldloc 1

	IL_00d6:  nop 
	IL_00d7:  nop 
	IL_00d8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00dd:  ldc.i4 3
	IL_00e2:  conv.u 
	IL_00e3:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00e8:  stloc 6

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_00f3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00f8:  stloc 7

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  ldloc 7

	IL_0102:  nop 
	IL_0103:  nop 
	IL_0104:  ldloc 6

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_010f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0114:  stloc 8

	IL_0118:  nop 
	IL_0119:  nop 
	IL_011a:  ldloc 8

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  ldc.i4 1
	IL_0125:  beq IL_0198

	IL_012a:  br IL_012f

	IL_012f:  ldloc 1

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_013a:  ldc.i4 3
	IL_013f:  conv.u 
	IL_0140:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0145:  stloc 9

	IL_0149:  nop 
	IL_014a:  nop 
	IL_014b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0150:  stloc 10

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldloc 10

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldloc 9

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0167:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_016c:  ldloc 10

	IL_0170:  nop 
	IL_0171:  nop 
	IL_0172:  ldloc 9

	IL_0176:  nop 
	IL_0177:  nop 
	IL_0178:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_017d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0182:  ldloc 5

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  ldloc 10

	IL_018c:  nop 
	IL_018d:  nop 
	IL_018e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarTyp
	IL_0193:  br IL_01be

	IL_0198:  ldloc 5

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  ldloc 1

	IL_01a2:  nop 
	IL_01a3:  nop 
	IL_01a4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01a9:  ldc.i4 3
	IL_01ae:  conv.u 
	IL_01af:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01b4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarTyp
	IL_01b9:  br IL_01be

	IL_01be:  ldloc 5

	IL_01c2:  nop 
	IL_01c3:  nop 
	IL_01c4:  ldloc 0

	IL_01c8:  nop 
	IL_01c9:  nop 
	IL_01ca:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::RExp
	IL_01cf:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::RExpr
	IL_01d4:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_01d9:  stloc 11

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  ldloc 5

	IL_01e3:  nop 
	IL_01e4:  nop 
	IL_01e5:  ldloc 11

	IL_01e9:  nop 
	IL_01ea:  nop 
	IL_01eb:  ldloc 5

	IL_01ef:  nop 
	IL_01f0:  nop 
	IL_01f1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::RExpr
	IL_01f6:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01fb:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::RExpr
	IL_0200:  ldloc 5

	IL_0204:  nop 
	IL_0205:  nop 
	IL_0206:  br IL_0216

	IL_020b:  ldarg 1

	IL_020f:  nop 
	IL_0210:  nop 
	IL_0211:  br IL_0216

	IL_0216:  ret 
    } // end of method StmtOptimizer::AssOpt

    // method line 57
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssign (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xf204
	// Code size 757 (0x2f5)
	.maxstack 17
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_5,
		int32	V_6,
		int32	V_7,
		int32	V_8,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_9)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AssignOp
	IL_000c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0011:  stloc 1

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::'.ctor'()
	IL_001c:  stloc 2

	IL_0020:  nop 
	IL_0021:  nop 
	IL_0022:  ldc.i4 0
	IL_0027:  stloc 3

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0032:  stloc 4

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_003d:  stloc 5

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ldc.i4 -1
	IL_0048:  stloc 6

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldarg 1

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0059:  ldlen 
	IL_005a:  conv.i4 
	IL_005b:  ldc.i4 1
	IL_0060:  sub 
	IL_0061:  stloc 7

	IL_0065:  nop 
	IL_0066:  nop 
	IL_0067:  ldc.i4 0
	IL_006c:  stloc 8

	IL_0070:  nop 
	IL_0071:  nop 
	IL_0072:  ldloc 6

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  ldc.i4 1
	IL_007d:  add 
	IL_007e:  stloc 6

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldarg 1

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_008f:  ldloc 6

	IL_0093:  nop 
	IL_0094:  nop 
	IL_0095:  conv.u 
	IL_0096:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_009b:  stloc 0

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 1

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldloc 0

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00b2:  stloc 3

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 3

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  ldc.i4 1
	IL_00c3:  beq IL_00cd

	IL_00c8:  br IL_00e3

	IL_00cd:  ldloc 6

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  stloc 8

	IL_00d7:  nop 
	IL_00d8:  nop 
	IL_00d9:  br IL_0112

	IL_00de:  br IL_00e8

	IL_00e3:  br IL_00e8

	IL_00e8:  ldloc 6

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  ldloc 7

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  beq IL_00fe

	IL_00f9:  br IL_0108

	IL_00fe:  br IL_0112

	IL_0103:  br IL_0112

	IL_0108:  br IL_0072

	IL_010d:  br IL_0112

	IL_0112:  ldloc 8

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  ldc.i4 0
	IL_011d:  beq IL_02d9

	IL_0122:  br IL_0127

	IL_0127:  ldc.i4 -1
	IL_012c:  stloc 6

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldloc 8

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldc.i4 1
	IL_013d:  sub 
	IL_013e:  stloc 7

	IL_0142:  nop 
	IL_0143:  nop 
	IL_0144:  ldloc 6

	IL_0148:  nop 
	IL_0149:  nop 
	IL_014a:  ldc.i4 1
	IL_014f:  add 
	IL_0150:  stloc 6

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldloc 5

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldarg 1

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0167:  ldloc 6

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  conv.u 
	IL_016e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0173:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0178:  ldloc 6

	IL_017c:  nop 
	IL_017d:  nop 
	IL_017e:  ldloc 7

	IL_0182:  nop 
	IL_0183:  nop 
	IL_0184:  beq IL_018e

	IL_0189:  br IL_0198

	IL_018e:  br IL_01a2

	IL_0193:  br IL_01a2

	IL_0198:  br IL_0144

	IL_019d:  br IL_01a2

	IL_01a2:  ldloc 8

	IL_01a6:  nop 
	IL_01a7:  nop 
	IL_01a8:  stloc 6

	IL_01ac:  nop 
	IL_01ad:  nop 
	IL_01ae:  ldarg 1

	IL_01b2:  nop 
	IL_01b3:  nop 
	IL_01b4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_01b9:  ldlen 
	IL_01ba:  conv.i4 
	IL_01bb:  ldc.i4 1
	IL_01c0:  sub 
	IL_01c1:  stloc 7

	IL_01c5:  nop 
	IL_01c6:  nop 
	IL_01c7:  ldloc 6

	IL_01cb:  nop 
	IL_01cc:  nop 
	IL_01cd:  ldc.i4 1
	IL_01d2:  add 
	IL_01d3:  stloc 6

	IL_01d7:  nop 
	IL_01d8:  nop 
	IL_01d9:  ldloc 4

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  ldarg 1

	IL_01e3:  nop 
	IL_01e4:  nop 
	IL_01e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_01ea:  ldloc 6

	IL_01ee:  nop 
	IL_01ef:  nop 
	IL_01f0:  conv.u 
	IL_01f1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01f6:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_01fb:  ldloc 6

	IL_01ff:  nop 
	IL_0200:  nop 
	IL_0201:  ldloc 7

	IL_0205:  nop 
	IL_0206:  nop 
	IL_0207:  beq IL_0211

	IL_020c:  br IL_021b

	IL_0211:  br IL_0225

	IL_0216:  br IL_0225

	IL_021b:  br IL_01c7

	IL_0220:  br IL_0225

	IL_0225:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_022a:  stloc 9

	IL_022e:  nop 
	IL_022f:  nop 
	IL_0230:  ldloc 9

	IL_0234:  nop 
	IL_0235:  nop 
	IL_0236:  ldloc 4

	IL_023a:  nop 
	IL_023b:  nop 
	IL_023c:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0241:  stloc 4

	IL_0245:  nop 
	IL_0246:  nop 
	IL_0247:  ldloc 9

	IL_024b:  nop 
	IL_024c:  nop 
	IL_024d:  ldloc 5

	IL_0251:  nop 
	IL_0252:  nop 
	IL_0253:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0258:  stloc 5

	IL_025c:  nop 
	IL_025d:  nop 
	IL_025e:  ldloc 2

	IL_0262:  nop 
	IL_0263:  nop 
	IL_0264:  ldarg 1

	IL_0268:  nop 
	IL_0269:  nop 
	IL_026a:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_026f:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0274:  ldloc 2

	IL_0278:  nop 
	IL_0279:  nop 
	IL_027a:  ldarg 1

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0285:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_028a:  ldloc 2

	IL_028e:  nop 
	IL_028f:  nop 
	IL_0290:  ldloc 5

	IL_0294:  nop 
	IL_0295:  nop 
	IL_0296:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::LExp
	IL_029b:  ldloc 2

	IL_029f:  nop 
	IL_02a0:  nop 
	IL_02a1:  ldloc 4

	IL_02a5:  nop 
	IL_02a6:  nop 
	IL_02a7:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::RExp
	IL_02ac:  ldarg 2

	IL_02b0:  nop 
	IL_02b1:  nop 
	IL_02b2:  ldc.i4 1
	IL_02b7:  stobj [mscorlib]System.Boolean
	IL_02bc:  ldarg.0 
	IL_02bd:  ldloc 2

	IL_02c1:  nop 
	IL_02c2:  nop 
	IL_02c3:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::AssOpt(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt)
	IL_02c8:  stloc 2

	IL_02cc:  nop 
	IL_02cd:  nop 
	IL_02ce:  ldloc 2

	IL_02d2:  nop 
	IL_02d3:  nop 
	IL_02d4:  br IL_02f4

	IL_02d9:  ldarg 2

	IL_02dd:  nop 
	IL_02de:  nop 
	IL_02df:  ldc.i4 0
	IL_02e4:  stobj [mscorlib]System.Boolean
	IL_02e9:  ldarg 1

	IL_02ed:  nop 
	IL_02ee:  nop 
	IL_02ef:  br IL_02f4

	IL_02f4:  ret 
    } // end of method StmtOptimizer::checkAssign

    // method line 58
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xf508
	// Code size 3051 (0xbeb)
	.maxstack 162
	.locals init (
		int32	V_0,
		int32	V_1,
		class dylan.NET.Tokenizer.Parser.TokenOptimizer	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt	V_3,
		bool	V_4)
	IL_0000:  ldc.i4 -1
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldarg 1

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0016:  ldlen 
	IL_0017:  conv.i4 
	IL_0018:  stloc 1

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  ldnull 
	IL_001f:  stloc 2

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldnull 
	IL_0026:  stloc 3

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldc.i4 0
	IL_0031:  stloc 4

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldloc 1

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldc.i4 1
	IL_0042:  sub 
	IL_0043:  stloc 1

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldc.i4 0
	IL_004e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_0053:  ldc.i4 0
	IL_0058:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_005d:  ldc.i4 0
	IL_0062:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_0067:  ldloc 1

	IL_006b:  nop 
	IL_006c:  nop 
	IL_006d:  ldc.i4 0
	IL_0072:  blt IL_007c

	IL_0077:  br IL_0086

	IL_007c:  br IL_0151

	IL_0081:  br IL_008b

	IL_0086:  br IL_008b

	IL_008b:  ldloc 0

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  ldc.i4 1
	IL_0096:  add 
	IL_0097:  stloc 0

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_00a2:  ldc.i4 1
	IL_00a7:  beq IL_00b1

	IL_00ac:  br IL_00bb

	IL_00b1:  br IL_0151

	IL_00b6:  br IL_00c0

	IL_00bb:  br IL_00c0

	IL_00c0:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_00c5:  ldc.i4 1
	IL_00ca:  beq IL_00d4

	IL_00cf:  br IL_00de

	IL_00d4:  br IL_0151

	IL_00d9:  br IL_00e3

	IL_00de:  br IL_00e3

	IL_00e3:  newobj instance void class dylan.NET.Tokenizer.Parser.TokenOptimizer::'.ctor'()
	IL_00e8:  stloc 2

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  ldarg 1

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_00f9:  ldloc 0

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  conv.u 
	IL_0100:  ldloc 2

	IL_0104:  nop 
	IL_0105:  nop 
	IL_0106:  ldarg 1

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0111:  ldloc 0

	IL_0115:  nop 
	IL_0116:  nop 
	IL_0117:  conv.u 
	IL_0118:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_011d:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token class dylan.NET.Tokenizer.Parser.TokenOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0122:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0127:  ldloc 0

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  ldloc 1

	IL_0131:  nop 
	IL_0132:  nop 
	IL_0133:  beq IL_013d

	IL_0138:  br IL_0147

	IL_013d:  br IL_0151

	IL_0142:  br IL_0151

	IL_0147:  br IL_008b

	IL_014c:  br IL_0151

	IL_0151:  ldarg 1

	IL_0155:  nop 
	IL_0156:  nop 
	IL_0157:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_015c:  ldlen 
	IL_015d:  conv.i4 
	IL_015e:  ldc.i4 0
	IL_0163:  beq IL_016d

	IL_0168:  br IL_0177

	IL_016d:  br IL_0be4

	IL_0172:  br IL_017c

	IL_0177:  br IL_017c

	IL_017c:  ldarg.0 
	IL_017d:  ldarg 1

	IL_0181:  nop 
	IL_0182:  nop 
	IL_0183:  ldloca 4

	IL_0187:  nop 
	IL_0188:  nop 
	IL_0189:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkCmt(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_018e:  stloc 3

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  ldloc 4

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  ldc.i4 1
	IL_019f:  beq IL_01a9

	IL_01a4:  br IL_01bf

	IL_01a9:  ldloc 3

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  starg 1

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  br IL_0be4

	IL_01ba:  br IL_01c4

	IL_01bf:  br IL_01c4

	IL_01c4:  ldarg.0 
	IL_01c5:  ldarg 1

	IL_01c9:  nop 
	IL_01ca:  nop 
	IL_01cb:  ldloca 4

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkImport(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_01d6:  stloc 3

	IL_01da:  nop 
	IL_01db:  nop 
	IL_01dc:  ldloc 4

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  ldc.i4 1
	IL_01e7:  beq IL_01f1

	IL_01ec:  br IL_0207

	IL_01f1:  ldloc 3

	IL_01f5:  nop 
	IL_01f6:  nop 
	IL_01f7:  starg 1

	IL_01fb:  nop 
	IL_01fc:  nop 
	IL_01fd:  br IL_0be4

	IL_0202:  br IL_020c

	IL_0207:  br IL_020c

	IL_020c:  ldarg.0 
	IL_020d:  ldarg 1

	IL_0211:  nop 
	IL_0212:  nop 
	IL_0213:  ldloca 4

	IL_0217:  nop 
	IL_0218:  nop 
	IL_0219:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkLocimport(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_021e:  stloc 3

	IL_0222:  nop 
	IL_0223:  nop 
	IL_0224:  ldloc 4

	IL_0228:  nop 
	IL_0229:  nop 
	IL_022a:  ldc.i4 1
	IL_022f:  beq IL_0239

	IL_0234:  br IL_024f

	IL_0239:  ldloc 3

	IL_023d:  nop 
	IL_023e:  nop 
	IL_023f:  starg 1

	IL_0243:  nop 
	IL_0244:  nop 
	IL_0245:  br IL_0be4

	IL_024a:  br IL_0254

	IL_024f:  br IL_0254

	IL_0254:  ldarg.0 
	IL_0255:  ldarg 1

	IL_0259:  nop 
	IL_025a:  nop 
	IL_025b:  ldloca 4

	IL_025f:  nop 
	IL_0260:  nop 
	IL_0261:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkAssembly(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0266:  stloc 3

	IL_026a:  nop 
	IL_026b:  nop 
	IL_026c:  ldloc 4

	IL_0270:  nop 
	IL_0271:  nop 
	IL_0272:  ldc.i4 1
	IL_0277:  beq IL_0281

	IL_027c:  br IL_0297

	IL_0281:  ldloc 3

	IL_0285:  nop 
	IL_0286:  nop 
	IL_0287:  starg 1

	IL_028b:  nop 
	IL_028c:  nop 
	IL_028d:  br IL_0be4

	IL_0292:  br IL_029c

	IL_0297:  br IL_029c

	IL_029c:  ldarg.0 
	IL_029d:  ldarg 1

	IL_02a1:  nop 
	IL_02a2:  nop 
	IL_02a3:  ldloca 4

	IL_02a7:  nop 
	IL_02a8:  nop 
	IL_02a9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkVer(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_02ae:  stloc 3

	IL_02b2:  nop 
	IL_02b3:  nop 
	IL_02b4:  ldloc 4

	IL_02b8:  nop 
	IL_02b9:  nop 
	IL_02ba:  ldc.i4 1
	IL_02bf:  beq IL_02c9

	IL_02c4:  br IL_02df

	IL_02c9:  ldloc 3

	IL_02cd:  nop 
	IL_02ce:  nop 
	IL_02cf:  starg 1

	IL_02d3:  nop 
	IL_02d4:  nop 
	IL_02d5:  br IL_0be4

	IL_02da:  br IL_02e4

	IL_02df:  br IL_02e4

	IL_02e4:  ldarg.0 
	IL_02e5:  ldarg 1

	IL_02e9:  nop 
	IL_02ea:  nop 
	IL_02eb:  ldloca 4

	IL_02ef:  nop 
	IL_02f0:  nop 
	IL_02f1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkNS(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_02f6:  stloc 3

	IL_02fa:  nop 
	IL_02fb:  nop 
	IL_02fc:  ldloc 4

	IL_0300:  nop 
	IL_0301:  nop 
	IL_0302:  ldc.i4 1
	IL_0307:  beq IL_0311

	IL_030c:  br IL_0327

	IL_0311:  ldloc 3

	IL_0315:  nop 
	IL_0316:  nop 
	IL_0317:  starg 1

	IL_031b:  nop 
	IL_031c:  nop 
	IL_031d:  br IL_0be4

	IL_0322:  br IL_032c

	IL_0327:  br IL_032c

	IL_032c:  ldarg.0 
	IL_032d:  ldarg 1

	IL_0331:  nop 
	IL_0332:  nop 
	IL_0333:  ldloca 4

	IL_0337:  nop 
	IL_0338:  nop 
	IL_0339:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkClass(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_033e:  stloc 3

	IL_0342:  nop 
	IL_0343:  nop 
	IL_0344:  ldloc 4

	IL_0348:  nop 
	IL_0349:  nop 
	IL_034a:  ldc.i4 1
	IL_034f:  beq IL_0359

	IL_0354:  br IL_036f

	IL_0359:  ldloc 3

	IL_035d:  nop 
	IL_035e:  nop 
	IL_035f:  starg 1

	IL_0363:  nop 
	IL_0364:  nop 
	IL_0365:  br IL_0be4

	IL_036a:  br IL_0374

	IL_036f:  br IL_0374

	IL_0374:  ldarg.0 
	IL_0375:  ldarg 1

	IL_0379:  nop 
	IL_037a:  nop 
	IL_037b:  ldloca 4

	IL_037f:  nop 
	IL_0380:  nop 
	IL_0381:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkDelegate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0386:  stloc 3

	IL_038a:  nop 
	IL_038b:  nop 
	IL_038c:  ldloc 4

	IL_0390:  nop 
	IL_0391:  nop 
	IL_0392:  ldc.i4 1
	IL_0397:  beq IL_03a1

	IL_039c:  br IL_03b7

	IL_03a1:  ldloc 3

	IL_03a5:  nop 
	IL_03a6:  nop 
	IL_03a7:  starg 1

	IL_03ab:  nop 
	IL_03ac:  nop 
	IL_03ad:  br IL_0be4

	IL_03b2:  br IL_03bc

	IL_03b7:  br IL_03bc

	IL_03bc:  ldarg.0 
	IL_03bd:  ldarg 1

	IL_03c1:  nop 
	IL_03c2:  nop 
	IL_03c3:  ldloca 4

	IL_03c7:  nop 
	IL_03c8:  nop 
	IL_03c9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkField(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_03ce:  stloc 3

	IL_03d2:  nop 
	IL_03d3:  nop 
	IL_03d4:  ldloc 4

	IL_03d8:  nop 
	IL_03d9:  nop 
	IL_03da:  ldc.i4 1
	IL_03df:  beq IL_03e9

	IL_03e4:  br IL_03ff

	IL_03e9:  ldloc 3

	IL_03ed:  nop 
	IL_03ee:  nop 
	IL_03ef:  starg 1

	IL_03f3:  nop 
	IL_03f4:  nop 
	IL_03f5:  br IL_0be4

	IL_03fa:  br IL_0404

	IL_03ff:  br IL_0404

	IL_0404:  ldarg.0 
	IL_0405:  ldarg 1

	IL_0409:  nop 
	IL_040a:  nop 
	IL_040b:  ldloca 4

	IL_040f:  nop 
	IL_0410:  nop 
	IL_0411:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkMethod(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0416:  stloc 3

	IL_041a:  nop 
	IL_041b:  nop 
	IL_041c:  ldloc 4

	IL_0420:  nop 
	IL_0421:  nop 
	IL_0422:  ldc.i4 1
	IL_0427:  beq IL_0431

	IL_042c:  br IL_0447

	IL_0431:  ldloc 3

	IL_0435:  nop 
	IL_0436:  nop 
	IL_0437:  starg 1

	IL_043b:  nop 
	IL_043c:  nop 
	IL_043d:  br IL_0be4

	IL_0442:  br IL_044c

	IL_0447:  br IL_044c

	IL_044c:  ldarg.0 
	IL_044d:  ldarg 1

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  ldloca 4

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkAssign(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_045e:  stloc 3

	IL_0462:  nop 
	IL_0463:  nop 
	IL_0464:  ldloc 4

	IL_0468:  nop 
	IL_0469:  nop 
	IL_046a:  ldc.i4 1
	IL_046f:  beq IL_0479

	IL_0474:  br IL_048f

	IL_0479:  ldloc 3

	IL_047d:  nop 
	IL_047e:  nop 
	IL_047f:  starg 1

	IL_0483:  nop 
	IL_0484:  nop 
	IL_0485:  br IL_0be4

	IL_048a:  br IL_0494

	IL_048f:  br IL_0494

	IL_0494:  ldarg.0 
	IL_0495:  ldarg 1

	IL_0499:  nop 
	IL_049a:  nop 
	IL_049b:  ldloca 4

	IL_049f:  nop 
	IL_04a0:  nop 
	IL_04a1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkVarAs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_04a6:  stloc 3

	IL_04aa:  nop 
	IL_04ab:  nop 
	IL_04ac:  ldloc 4

	IL_04b0:  nop 
	IL_04b1:  nop 
	IL_04b2:  ldc.i4 1
	IL_04b7:  beq IL_04c1

	IL_04bc:  br IL_04d7

	IL_04c1:  ldloc 3

	IL_04c5:  nop 
	IL_04c6:  nop 
	IL_04c7:  starg 1

	IL_04cb:  nop 
	IL_04cc:  nop 
	IL_04cd:  br IL_0be4

	IL_04d2:  br IL_04dc

	IL_04d7:  br IL_04dc

	IL_04dc:  ldarg.0 
	IL_04dd:  ldarg 1

	IL_04e1:  nop 
	IL_04e2:  nop 
	IL_04e3:  ldloca 4

	IL_04e7:  nop 
	IL_04e8:  nop 
	IL_04e9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkReturn(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_04ee:  stloc 3

	IL_04f2:  nop 
	IL_04f3:  nop 
	IL_04f4:  ldloc 4

	IL_04f8:  nop 
	IL_04f9:  nop 
	IL_04fa:  ldc.i4 1
	IL_04ff:  beq IL_0509

	IL_0504:  br IL_051f

	IL_0509:  ldloc 3

	IL_050d:  nop 
	IL_050e:  nop 
	IL_050f:  starg 1

	IL_0513:  nop 
	IL_0514:  nop 
	IL_0515:  br IL_0be4

	IL_051a:  br IL_0524

	IL_051f:  br IL_0524

	IL_0524:  ldarg.0 
	IL_0525:  ldarg 1

	IL_0529:  nop 
	IL_052a:  nop 
	IL_052b:  ldloca 4

	IL_052f:  nop 
	IL_0530:  nop 
	IL_0531:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndMtd(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0536:  stloc 3

	IL_053a:  nop 
	IL_053b:  nop 
	IL_053c:  ldloc 4

	IL_0540:  nop 
	IL_0541:  nop 
	IL_0542:  ldc.i4 1
	IL_0547:  beq IL_0551

	IL_054c:  br IL_0567

	IL_0551:  ldloc 3

	IL_0555:  nop 
	IL_0556:  nop 
	IL_0557:  starg 1

	IL_055b:  nop 
	IL_055c:  nop 
	IL_055d:  br IL_0be4

	IL_0562:  br IL_056c

	IL_0567:  br IL_056c

	IL_056c:  ldarg.0 
	IL_056d:  ldarg 1

	IL_0571:  nop 
	IL_0572:  nop 
	IL_0573:  ldloca 4

	IL_0577:  nop 
	IL_0578:  nop 
	IL_0579:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndNS(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_057e:  stloc 3

	IL_0582:  nop 
	IL_0583:  nop 
	IL_0584:  ldloc 4

	IL_0588:  nop 
	IL_0589:  nop 
	IL_058a:  ldc.i4 1
	IL_058f:  beq IL_0599

	IL_0594:  br IL_05af

	IL_0599:  ldloc 3

	IL_059d:  nop 
	IL_059e:  nop 
	IL_059f:  starg 1

	IL_05a3:  nop 
	IL_05a4:  nop 
	IL_05a5:  br IL_0be4

	IL_05aa:  br IL_05b4

	IL_05af:  br IL_05b4

	IL_05b4:  ldarg.0 
	IL_05b5:  ldarg 1

	IL_05b9:  nop 
	IL_05ba:  nop 
	IL_05bb:  ldloca 4

	IL_05bf:  nop 
	IL_05c0:  nop 
	IL_05c1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndCls(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_05c6:  stloc 3

	IL_05ca:  nop 
	IL_05cb:  nop 
	IL_05cc:  ldloc 4

	IL_05d0:  nop 
	IL_05d1:  nop 
	IL_05d2:  ldc.i4 1
	IL_05d7:  beq IL_05e1

	IL_05dc:  br IL_05f7

	IL_05e1:  ldloc 3

	IL_05e5:  nop 
	IL_05e6:  nop 
	IL_05e7:  starg 1

	IL_05eb:  nop 
	IL_05ec:  nop 
	IL_05ed:  br IL_0be4

	IL_05f2:  br IL_05fc

	IL_05f7:  br IL_05fc

	IL_05fc:  ldarg.0 
	IL_05fd:  ldarg 1

	IL_0601:  nop 
	IL_0602:  nop 
	IL_0603:  ldloca 4

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkDebug(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_060e:  stloc 3

	IL_0612:  nop 
	IL_0613:  nop 
	IL_0614:  ldloc 4

	IL_0618:  nop 
	IL_0619:  nop 
	IL_061a:  ldc.i4 1
	IL_061f:  beq IL_0629

	IL_0624:  br IL_063f

	IL_0629:  ldloc 3

	IL_062d:  nop 
	IL_062e:  nop 
	IL_062f:  starg 1

	IL_0633:  nop 
	IL_0634:  nop 
	IL_0635:  br IL_0be4

	IL_063a:  br IL_0644

	IL_063f:  br IL_0644

	IL_0644:  ldarg.0 
	IL_0645:  ldarg 1

	IL_0649:  nop 
	IL_064a:  nop 
	IL_064b:  ldloca 4

	IL_064f:  nop 
	IL_0650:  nop 
	IL_0651:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkScope(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0656:  stloc 3

	IL_065a:  nop 
	IL_065b:  nop 
	IL_065c:  ldloc 4

	IL_0660:  nop 
	IL_0661:  nop 
	IL_0662:  ldc.i4 1
	IL_0667:  beq IL_0671

	IL_066c:  br IL_0687

	IL_0671:  ldloc 3

	IL_0675:  nop 
	IL_0676:  nop 
	IL_0677:  starg 1

	IL_067b:  nop 
	IL_067c:  nop 
	IL_067d:  br IL_0be4

	IL_0682:  br IL_068c

	IL_0687:  br IL_068c

	IL_068c:  ldarg.0 
	IL_068d:  ldarg 1

	IL_0691:  nop 
	IL_0692:  nop 
	IL_0693:  ldloca 4

	IL_0697:  nop 
	IL_0698:  nop 
	IL_0699:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkInclude(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_069e:  stloc 3

	IL_06a2:  nop 
	IL_06a3:  nop 
	IL_06a4:  ldloc 4

	IL_06a8:  nop 
	IL_06a9:  nop 
	IL_06aa:  ldc.i4 1
	IL_06af:  beq IL_06b9

	IL_06b4:  br IL_06cf

	IL_06b9:  ldloc 3

	IL_06bd:  nop 
	IL_06be:  nop 
	IL_06bf:  starg 1

	IL_06c3:  nop 
	IL_06c4:  nop 
	IL_06c5:  br IL_0be4

	IL_06ca:  br IL_06d4

	IL_06cf:  br IL_06d4

	IL_06d4:  ldarg.0 
	IL_06d5:  ldarg 1

	IL_06d9:  nop 
	IL_06da:  nop 
	IL_06db:  ldloca 4

	IL_06df:  nop 
	IL_06e0:  nop 
	IL_06e1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkRefasm(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_06e6:  stloc 3

	IL_06ea:  nop 
	IL_06eb:  nop 
	IL_06ec:  ldloc 4

	IL_06f0:  nop 
	IL_06f1:  nop 
	IL_06f2:  ldc.i4 1
	IL_06f7:  beq IL_0701

	IL_06fc:  br IL_0717

	IL_0701:  ldloc 3

	IL_0705:  nop 
	IL_0706:  nop 
	IL_0707:  starg 1

	IL_070b:  nop 
	IL_070c:  nop 
	IL_070d:  br IL_0be4

	IL_0712:  br IL_071c

	IL_0717:  br IL_071c

	IL_071c:  ldarg.0 
	IL_071d:  ldarg 1

	IL_0721:  nop 
	IL_0722:  nop 
	IL_0723:  ldloca 4

	IL_0727:  nop 
	IL_0728:  nop 
	IL_0729:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkRefstdasm(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_072e:  stloc 3

	IL_0732:  nop 
	IL_0733:  nop 
	IL_0734:  ldloc 4

	IL_0738:  nop 
	IL_0739:  nop 
	IL_073a:  ldc.i4 1
	IL_073f:  beq IL_0749

	IL_0744:  br IL_075f

	IL_0749:  ldloc 3

	IL_074d:  nop 
	IL_074e:  nop 
	IL_074f:  starg 1

	IL_0753:  nop 
	IL_0754:  nop 
	IL_0755:  br IL_0be4

	IL_075a:  br IL_0764

	IL_075f:  br IL_0764

	IL_0764:  ldarg.0 
	IL_0765:  ldarg 1

	IL_0769:  nop 
	IL_076a:  nop 
	IL_076b:  ldloca 4

	IL_076f:  nop 
	IL_0770:  nop 
	IL_0771:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkLabel(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0776:  stloc 3

	IL_077a:  nop 
	IL_077b:  nop 
	IL_077c:  ldloc 4

	IL_0780:  nop 
	IL_0781:  nop 
	IL_0782:  ldc.i4 1
	IL_0787:  beq IL_0791

	IL_078c:  br IL_07a7

	IL_0791:  ldloc 3

	IL_0795:  nop 
	IL_0796:  nop 
	IL_0797:  starg 1

	IL_079b:  nop 
	IL_079c:  nop 
	IL_079d:  br IL_0be4

	IL_07a2:  br IL_07ac

	IL_07a7:  br IL_07ac

	IL_07ac:  ldarg.0 
	IL_07ad:  ldarg 1

	IL_07b1:  nop 
	IL_07b2:  nop 
	IL_07b3:  ldloca 4

	IL_07b7:  nop 
	IL_07b8:  nop 
	IL_07b9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkPlace(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_07be:  stloc 3

	IL_07c2:  nop 
	IL_07c3:  nop 
	IL_07c4:  ldloc 4

	IL_07c8:  nop 
	IL_07c9:  nop 
	IL_07ca:  ldc.i4 1
	IL_07cf:  beq IL_07d9

	IL_07d4:  br IL_07ef

	IL_07d9:  ldloc 3

	IL_07dd:  nop 
	IL_07de:  nop 
	IL_07df:  starg 1

	IL_07e3:  nop 
	IL_07e4:  nop 
	IL_07e5:  br IL_0be4

	IL_07ea:  br IL_07f4

	IL_07ef:  br IL_07f4

	IL_07f4:  ldarg.0 
	IL_07f5:  ldarg 1

	IL_07f9:  nop 
	IL_07fa:  nop 
	IL_07fb:  ldloca 4

	IL_07ff:  nop 
	IL_0800:  nop 
	IL_0801:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkGoto(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0806:  stloc 3

	IL_080a:  nop 
	IL_080b:  nop 
	IL_080c:  ldloc 4

	IL_0810:  nop 
	IL_0811:  nop 
	IL_0812:  ldc.i4 1
	IL_0817:  beq IL_0821

	IL_081c:  br IL_0837

	IL_0821:  ldloc 3

	IL_0825:  nop 
	IL_0826:  nop 
	IL_0827:  starg 1

	IL_082b:  nop 
	IL_082c:  nop 
	IL_082d:  br IL_0be4

	IL_0832:  br IL_083c

	IL_0837:  br IL_083c

	IL_083c:  ldarg.0 
	IL_083d:  ldarg 1

	IL_0841:  nop 
	IL_0842:  nop 
	IL_0843:  ldloca 4

	IL_0847:  nop 
	IL_0848:  nop 
	IL_0849:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_084e:  stloc 3

	IL_0852:  nop 
	IL_0853:  nop 
	IL_0854:  ldloc 4

	IL_0858:  nop 
	IL_0859:  nop 
	IL_085a:  ldc.i4 1
	IL_085f:  beq IL_0869

	IL_0864:  br IL_087f

	IL_0869:  ldloc 3

	IL_086d:  nop 
	IL_086e:  nop 
	IL_086f:  starg 1

	IL_0873:  nop 
	IL_0874:  nop 
	IL_0875:  br IL_0be4

	IL_087a:  br IL_0884

	IL_087f:  br IL_0884

	IL_0884:  ldarg.0 
	IL_0885:  ldarg 1

	IL_0889:  nop 
	IL_088a:  nop 
	IL_088b:  ldloca 4

	IL_088f:  nop 
	IL_0890:  nop 
	IL_0891:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkWhile(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0896:  stloc 3

	IL_089a:  nop 
	IL_089b:  nop 
	IL_089c:  ldloc 4

	IL_08a0:  nop 
	IL_08a1:  nop 
	IL_08a2:  ldc.i4 1
	IL_08a7:  beq IL_08b1

	IL_08ac:  br IL_08c7

	IL_08b1:  ldloc 3

	IL_08b5:  nop 
	IL_08b6:  nop 
	IL_08b7:  starg 1

	IL_08bb:  nop 
	IL_08bc:  nop 
	IL_08bd:  br IL_0be4

	IL_08c2:  br IL_08cc

	IL_08c7:  br IL_08cc

	IL_08cc:  ldarg.0 
	IL_08cd:  ldarg 1

	IL_08d1:  nop 
	IL_08d2:  nop 
	IL_08d3:  ldloca 4

	IL_08d7:  nop 
	IL_08d8:  nop 
	IL_08d9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkUntil(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_08de:  stloc 3

	IL_08e2:  nop 
	IL_08e3:  nop 
	IL_08e4:  ldloc 4

	IL_08e8:  nop 
	IL_08e9:  nop 
	IL_08ea:  ldc.i4 1
	IL_08ef:  beq IL_08f9

	IL_08f4:  br IL_090f

	IL_08f9:  ldloc 3

	IL_08fd:  nop 
	IL_08fe:  nop 
	IL_08ff:  starg 1

	IL_0903:  nop 
	IL_0904:  nop 
	IL_0905:  br IL_0be4

	IL_090a:  br IL_0914

	IL_090f:  br IL_0914

	IL_0914:  ldarg.0 
	IL_0915:  ldarg 1

	IL_0919:  nop 
	IL_091a:  nop 
	IL_091b:  ldloca 4

	IL_091f:  nop 
	IL_0920:  nop 
	IL_0921:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkDoWhile(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0926:  stloc 3

	IL_092a:  nop 
	IL_092b:  nop 
	IL_092c:  ldloc 4

	IL_0930:  nop 
	IL_0931:  nop 
	IL_0932:  ldc.i4 1
	IL_0937:  beq IL_0941

	IL_093c:  br IL_0957

	IL_0941:  ldloc 3

	IL_0945:  nop 
	IL_0946:  nop 
	IL_0947:  starg 1

	IL_094b:  nop 
	IL_094c:  nop 
	IL_094d:  br IL_0be4

	IL_0952:  br IL_095c

	IL_0957:  br IL_095c

	IL_095c:  ldarg.0 
	IL_095d:  ldarg 1

	IL_0961:  nop 
	IL_0962:  nop 
	IL_0963:  ldloca 4

	IL_0967:  nop 
	IL_0968:  nop 
	IL_0969:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkDoUntil(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_096e:  stloc 3

	IL_0972:  nop 
	IL_0973:  nop 
	IL_0974:  ldloc 4

	IL_0978:  nop 
	IL_0979:  nop 
	IL_097a:  ldc.i4 1
	IL_097f:  beq IL_0989

	IL_0984:  br IL_099f

	IL_0989:  ldloc 3

	IL_098d:  nop 
	IL_098e:  nop 
	IL_098f:  starg 1

	IL_0993:  nop 
	IL_0994:  nop 
	IL_0995:  br IL_0be4

	IL_099a:  br IL_09a4

	IL_099f:  br IL_09a4

	IL_09a4:  ldarg.0 
	IL_09a5:  ldarg 1

	IL_09a9:  nop 
	IL_09aa:  nop 
	IL_09ab:  ldloca 4

	IL_09af:  nop 
	IL_09b0:  nop 
	IL_09b1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElseIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_09b6:  stloc 3

	IL_09ba:  nop 
	IL_09bb:  nop 
	IL_09bc:  ldloc 4

	IL_09c0:  nop 
	IL_09c1:  nop 
	IL_09c2:  ldc.i4 1
	IL_09c7:  beq IL_09d1

	IL_09cc:  br IL_09e7

	IL_09d1:  ldloc 3

	IL_09d5:  nop 
	IL_09d6:  nop 
	IL_09d7:  starg 1

	IL_09db:  nop 
	IL_09dc:  nop 
	IL_09dd:  br IL_0be4

	IL_09e2:  br IL_09ec

	IL_09e7:  br IL_09ec

	IL_09ec:  ldarg.0 
	IL_09ed:  ldarg 1

	IL_09f1:  nop 
	IL_09f2:  nop 
	IL_09f3:  ldloca 4

	IL_09f7:  nop 
	IL_09f8:  nop 
	IL_09f9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_09fe:  stloc 3

	IL_0a02:  nop 
	IL_0a03:  nop 
	IL_0a04:  ldloc 4

	IL_0a08:  nop 
	IL_0a09:  nop 
	IL_0a0a:  ldc.i4 1
	IL_0a0f:  beq IL_0a19

	IL_0a14:  br IL_0a2f

	IL_0a19:  ldloc 3

	IL_0a1d:  nop 
	IL_0a1e:  nop 
	IL_0a1f:  starg 1

	IL_0a23:  nop 
	IL_0a24:  nop 
	IL_0a25:  br IL_0be4

	IL_0a2a:  br IL_0a34

	IL_0a2f:  br IL_0a34

	IL_0a34:  ldarg.0 
	IL_0a35:  ldarg 1

	IL_0a39:  nop 
	IL_0a3a:  nop 
	IL_0a3b:  ldloca 4

	IL_0a3f:  nop 
	IL_0a40:  nop 
	IL_0a41:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkDo(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0a46:  stloc 3

	IL_0a4a:  nop 
	IL_0a4b:  nop 
	IL_0a4c:  ldloc 4

	IL_0a50:  nop 
	IL_0a51:  nop 
	IL_0a52:  ldc.i4 1
	IL_0a57:  beq IL_0a61

	IL_0a5c:  br IL_0a77

	IL_0a61:  ldloc 3

	IL_0a65:  nop 
	IL_0a66:  nop 
	IL_0a67:  starg 1

	IL_0a6b:  nop 
	IL_0a6c:  nop 
	IL_0a6d:  br IL_0be4

	IL_0a72:  br IL_0a7c

	IL_0a77:  br IL_0a7c

	IL_0a7c:  ldarg.0 
	IL_0a7d:  ldarg 1

	IL_0a81:  nop 
	IL_0a82:  nop 
	IL_0a83:  ldloca 4

	IL_0a87:  nop 
	IL_0a88:  nop 
	IL_0a89:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkBreak(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0a8e:  stloc 3

	IL_0a92:  nop 
	IL_0a93:  nop 
	IL_0a94:  ldloc 4

	IL_0a98:  nop 
	IL_0a99:  nop 
	IL_0a9a:  ldc.i4 1
	IL_0a9f:  beq IL_0aa9

	IL_0aa4:  br IL_0abf

	IL_0aa9:  ldloc 3

	IL_0aad:  nop 
	IL_0aae:  nop 
	IL_0aaf:  starg 1

	IL_0ab3:  nop 
	IL_0ab4:  nop 
	IL_0ab5:  br IL_0be4

	IL_0aba:  br IL_0ac4

	IL_0abf:  br IL_0ac4

	IL_0ac4:  ldarg.0 
	IL_0ac5:  ldarg 1

	IL_0ac9:  nop 
	IL_0aca:  nop 
	IL_0acb:  ldloca 4

	IL_0acf:  nop 
	IL_0ad0:  nop 
	IL_0ad1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkContinue(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0ad6:  stloc 3

	IL_0ada:  nop 
	IL_0adb:  nop 
	IL_0adc:  ldloc 4

	IL_0ae0:  nop 
	IL_0ae1:  nop 
	IL_0ae2:  ldc.i4 1
	IL_0ae7:  beq IL_0af1

	IL_0aec:  br IL_0b07

	IL_0af1:  ldloc 3

	IL_0af5:  nop 
	IL_0af6:  nop 
	IL_0af7:  starg 1

	IL_0afb:  nop 
	IL_0afc:  nop 
	IL_0afd:  br IL_0be4

	IL_0b02:  br IL_0b0c

	IL_0b07:  br IL_0b0c

	IL_0b0c:  ldarg.0 
	IL_0b0d:  ldarg 1

	IL_0b11:  nop 
	IL_0b12:  nop 
	IL_0b13:  ldloca 4

	IL_0b17:  nop 
	IL_0b18:  nop 
	IL_0b19:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0b1e:  stloc 3

	IL_0b22:  nop 
	IL_0b23:  nop 
	IL_0b24:  ldloc 4

	IL_0b28:  nop 
	IL_0b29:  nop 
	IL_0b2a:  ldc.i4 1
	IL_0b2f:  beq IL_0b39

	IL_0b34:  br IL_0b4f

	IL_0b39:  ldloc 3

	IL_0b3d:  nop 
	IL_0b3e:  nop 
	IL_0b3f:  starg 1

	IL_0b43:  nop 
	IL_0b44:  nop 
	IL_0b45:  br IL_0be4

	IL_0b4a:  br IL_0b54

	IL_0b4f:  br IL_0b54

	IL_0b54:  ldarg.0 
	IL_0b55:  ldarg 1

	IL_0b59:  nop 
	IL_0b5a:  nop 
	IL_0b5b:  ldloca 4

	IL_0b5f:  nop 
	IL_0b60:  nop 
	IL_0b61:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndDo(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0b66:  stloc 3

	IL_0b6a:  nop 
	IL_0b6b:  nop 
	IL_0b6c:  ldloc 4

	IL_0b70:  nop 
	IL_0b71:  nop 
	IL_0b72:  ldc.i4 1
	IL_0b77:  beq IL_0b81

	IL_0b7c:  br IL_0b97

	IL_0b81:  ldloc 3

	IL_0b85:  nop 
	IL_0b86:  nop 
	IL_0b87:  starg 1

	IL_0b8b:  nop 
	IL_0b8c:  nop 
	IL_0b8d:  br IL_0be4

	IL_0b92:  br IL_0b9c

	IL_0b97:  br IL_0b9c

	IL_0b9c:  ldarg.0 
	IL_0b9d:  ldarg 1

	IL_0ba1:  nop 
	IL_0ba2:  nop 
	IL_0ba3:  ldloca 4

	IL_0ba7:  nop 
	IL_0ba8:  nop 
	IL_0ba9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkMethodCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
	IL_0bae:  stloc 3

	IL_0bb2:  nop 
	IL_0bb3:  nop 
	IL_0bb4:  ldloc 4

	IL_0bb8:  nop 
	IL_0bb9:  nop 
	IL_0bba:  ldc.i4 1
	IL_0bbf:  beq IL_0bc9

	IL_0bc4:  br IL_0bdf

	IL_0bc9:  ldloc 3

	IL_0bcd:  nop 
	IL_0bce:  nop 
	IL_0bcf:  starg 1

	IL_0bd3:  nop 
	IL_0bd4:  nop 
	IL_0bd5:  br IL_0be4

	IL_0bda:  br IL_0be4

	IL_0bdf:  br IL_0be4

	IL_0be4:  ldarg 1

	IL_0be8:  nop 
	IL_0be9:  nop 
	IL_0bea:  ret 
    } // end of method StmtOptimizer::Optimize

    // method line 59
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x10100
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method StmtOptimizer::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.StmtOptimizer
}

.namespace dylan.NET.Tokenizer.Parser
{
  .class public auto ansi Parser
  	extends [mscorlib]System.Object
  {

    // method line 60
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet Parse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet stms)  cil managed 
    {
        // Method begins at RVA 0x10114
	// Code size 190 (0xbe)
	.maxstack 6
	.locals init (
		int32	V_0,
		class dylan.NET.Tokenizer.Parser.StmtOptimizer	V_1,
		int32	V_2)
	IL_0000:  ldc.i4 -1
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldnull 
	IL_000c:  stloc 1

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldarg 1

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_001d:  ldlen 
	IL_001e:  conv.i4 
	IL_001f:  stloc 2

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  ldloc 2

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldc.i4 1
	IL_0030:  sub 
	IL_0031:  stloc 2

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldloc 0

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldc.i4 1
	IL_0042:  add 
	IL_0043:  stloc 0

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  newobj instance void class dylan.NET.Tokenizer.Parser.StmtOptimizer::'.ctor'()
	IL_004e:  stloc 1

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldarg 1

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_005f:  ldloc 0

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  conv.u 
	IL_0066:  ldloc 1

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldarg 1

	IL_0070:  nop 
	IL_0071:  nop 
	IL_0072:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_0077:  ldloc 0

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  conv.u 
	IL_007e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0083:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt)
	IL_0088:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_008d:  ldloc 0

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldloc 2

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  beq IL_00a3

	IL_009e:  br IL_00ad

	IL_00a3:  br IL_00b7

	IL_00a8:  br IL_00b7

	IL_00ad:  br IL_0037

	IL_00b2:  br IL_00b7

	IL_00b7:  ldarg 1

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ret 
    } // end of method Parser::Parse

    // method line 61
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x101e0
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Parser::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.Parser
}

