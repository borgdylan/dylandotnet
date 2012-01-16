.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:8:2
}
.assembly extern dnu
{
  .ver 11:2:8:2
}
.assembly 'tokenizer.Parser'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 32 00 00 ) // ...11.2.8.2..

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
  .ver  11:2:8:2
}

.module tokenizer.Parser.dll // GUID = {E315BD1E-DC32-43FA-AF6A-8DE9E4777700}


.namespace dylan.NET.Tokenizer.Parser
{
  .class public auto ansi beforefieldinit ParserFlags
  	extends [mscorlib]System.Object
  {
    .field  public static  bool IfFlag
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
	// Code size 183 (0xb7)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_000a:  ldc.i4 0
	IL_000f:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_0014:  ldc.i4 0
	IL_0019:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_001e:  ldc.i4 0
	IL_0023:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NegFlag
	IL_0028:  ldc.i4 0
	IL_002d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NotFlag
	IL_0032:  ldc.i4 0
	IL_0037:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_003c:  ldc.i4 0
	IL_0041:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ArrFlag
	IL_0046:  ldnull 
	IL_0047:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.Parser.ParserFlags::ArrSlot
	IL_004c:  ldc.i4 0
	IL_0051:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::RefFlag
	IL_0056:  ldc.i4 0
	IL_005b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ValinrefFlag
	IL_0060:  ldnull 
	IL_0061:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_0066:  ldstr ""
	IL_006b:  stsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_0070:  ldc.i4 0
	IL_0075:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_007a:  ldc.i4 0
	IL_007f:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_0084:  ldc.i4 0
	IL_0089:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_008e:  ldc.i4 0
	IL_0093:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_0098:  ldc.i4 0
	IL_009d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_00a2:  ldc.i4 0
	IL_00a7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_00ac:  ldc.i4 0
	IL_00b1:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_00b6:  ret 
    } // end of method ParserFlags::.cctor

    // method line 2
    .method public static 
           default void SetUnaryFalse ()  cil managed 
    {
        // Method begins at RVA 0x2114
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
        // Method begins at RVA 0x2188
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
        // Method begins at RVA 0x222c
	// Code size 7 (0x7)
	.maxstack 1
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ret 
    } // end of method ParserFlags::UpdateNullLit

    // method line 5
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral UpdateCharLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral id)  cil managed 
    {
        // Method begins at RVA 0x2240
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

    // method line 6
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral UpdateStringLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral id)  cil managed 
    {
        // Method begins at RVA 0x2284
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

    // method line 7
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral UpdateBoolLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral id)  cil managed 
    {
        // Method begins at RVA 0x22c8
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

    // method line 8
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral UpdateNumLit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral id)  cil managed 
    {
        // Method begins at RVA 0x231c
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

    // method line 9
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x2380
	// Code size 21000 (0x5208)
	.maxstack 564
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseIfTok	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrTok	V_50,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok	V_51,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NamespaceTok	V_52,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok	V_53,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefstdasmTok	V_56,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok	V_57,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IncludeTok	V_58,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok	V_59,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok	V_60,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok	V_61,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok	V_62,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok	V_63,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok	V_64,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok	V_65,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok	V_66,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok	V_67,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok	V_68,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok	V_69,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DelegateTok	V_70,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok	V_71,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok	V_72,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok	V_73,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok	V_74,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok	V_75,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok	V_76,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok	V_77,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr	V_78,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr	V_79,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr	V_80,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr	V_81,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr	V_82,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr	V_83,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr	V_84,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr	V_85,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr	V_86,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr	V_88,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok	V_89,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok	V_92,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok	V_93,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok	V_94,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok	V_95,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok	V_96,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok	V_97,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok	V_98,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok	V_99,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok	V_100,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok	V_101,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok	V_102,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok	V_103,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok	V_104,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok	V_105,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok	V_106,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_107,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_108,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_109,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_110,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_111,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_112,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_113,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_114,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_115,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral	V_116,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral	V_117,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_118,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral	V_119,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral	V_120,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral	V_121,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral	V_122,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral	V_123,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral	V_124,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_125,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_126)
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
	IL_00b0:  br IL_5201

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
	IL_0132:  br IL_5201

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
	IL_01b4:  br IL_5201

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
	IL_0236:  br IL_5201

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
	IL_02b8:  br IL_5201

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
	IL_033a:  br IL_5201

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
	IL_03bc:  br IL_5201

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
	IL_043e:  br IL_5201

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

	IL_0521:  br IL_5201

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
	IL_05a3:  br IL_5201

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
	IL_0625:  br IL_5201

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
	IL_06a7:  br IL_5201

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
	IL_0729:  br IL_5201

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
	IL_07ab:  br IL_5201

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
	IL_082d:  br IL_5201

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
	IL_08af:  br IL_5201

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
	IL_0931:  br IL_5201

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
	IL_09b3:  br IL_5201

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
	IL_0a35:  br IL_5201

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
	IL_0ab7:  br IL_5201

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
	IL_0b39:  br IL_5201

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
	IL_0bbb:  br IL_5201

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
	IL_0c3d:  br IL_5201

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
	IL_0cbf:  br IL_5201

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
	IL_0d41:  br IL_5201

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
	IL_0dc3:  br IL_5201

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
	IL_0e45:  br IL_5201

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
	IL_0ec7:  br IL_5201

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
	IL_0f49:  br IL_5201

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
	IL_0fcb:  br IL_5201

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
	IL_104d:  br IL_5201

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
	IL_10cf:  br IL_5201

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
	IL_1151:  br IL_5201

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
	IL_11d3:  br IL_5201

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
	IL_1255:  br IL_5201

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
	IL_12d7:  br IL_5201

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
	IL_1359:  br IL_5201

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
	IL_13db:  br IL_5201

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
	IL_145d:  br IL_5201

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
	IL_14e9:  br IL_5201

	IL_14ee:  br IL_14f8

	IL_14f3:  br IL_14f8

	IL_14f8:  ldarg 1

	IL_14fc:  nop 
	IL_14fd:  nop 
	IL_14fe:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1503:  ldstr "elseif"
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

	IL_1528:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseIfTok::'.ctor'()
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
	IL_1575:  br IL_5201

	IL_157a:  br IL_1584

	IL_157f:  br IL_1584

	IL_1584:  ldarg 1

	IL_1588:  nop 
	IL_1589:  nop 
	IL_158a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_158f:  ldstr "else"
	IL_1594:  call int32 string::Compare(string, string)
	IL_1599:  stloc 0

	IL_159d:  nop 
	IL_159e:  nop 
	IL_159f:  ldloc 0

	IL_15a3:  nop 
	IL_15a4:  nop 
	IL_15a5:  ldc.i4 0
	IL_15aa:  beq IL_15b4

	IL_15af:  br IL_1601

	IL_15b4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok::'.ctor'()
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
	IL_15f7:  br IL_5201

	IL_15fc:  br IL_1606

	IL_1601:  br IL_1606

	IL_1606:  ldarg 1

	IL_160a:  nop 
	IL_160b:  nop 
	IL_160c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1611:  ldstr "then"
	IL_1616:  call int32 string::Compare(string, string)
	IL_161b:  stloc 0

	IL_161f:  nop 
	IL_1620:  nop 
	IL_1621:  ldloc 0

	IL_1625:  nop 
	IL_1626:  nop 
	IL_1627:  ldc.i4 0
	IL_162c:  beq IL_1636

	IL_1631:  br IL_168d

	IL_1636:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok::'.ctor'()
	IL_163b:  stloc 48

	IL_163f:  nop 
	IL_1640:  nop 
	IL_1641:  ldloc 48

	IL_1645:  nop 
	IL_1646:  nop 
	IL_1647:  ldarg 1

	IL_164b:  nop 
	IL_164c:  nop 
	IL_164d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1652:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1657:  ldloc 48

	IL_165b:  nop 
	IL_165c:  nop 
	IL_165d:  ldarg 1

	IL_1661:  nop 
	IL_1662:  nop 
	IL_1663:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1668:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_166d:  ldloc 48

	IL_1671:  nop 
	IL_1672:  nop 
	IL_1673:  starg 1

	IL_1677:  nop 
	IL_1678:  nop 
	IL_1679:  ldc.i4 0
	IL_167e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_1683:  br IL_5201

	IL_1688:  br IL_1692

	IL_168d:  br IL_1692

	IL_1692:  ldarg 1

	IL_1696:  nop 
	IL_1697:  nop 
	IL_1698:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_169d:  ldstr "new"
	IL_16a2:  call int32 string::Compare(string, string)
	IL_16a7:  stloc 0

	IL_16ab:  nop 
	IL_16ac:  nop 
	IL_16ad:  ldloc 0

	IL_16b1:  nop 
	IL_16b2:  nop 
	IL_16b3:  ldc.i4 0
	IL_16b8:  beq IL_16c2

	IL_16bd:  br IL_170f

	IL_16c2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok::'.ctor'()
	IL_16c7:  stloc 49

	IL_16cb:  nop 
	IL_16cc:  nop 
	IL_16cd:  ldloc 49

	IL_16d1:  nop 
	IL_16d2:  nop 
	IL_16d3:  ldarg 1

	IL_16d7:  nop 
	IL_16d8:  nop 
	IL_16d9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_16de:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_16e3:  ldloc 49

	IL_16e7:  nop 
	IL_16e8:  nop 
	IL_16e9:  ldarg 1

	IL_16ed:  nop 
	IL_16ee:  nop 
	IL_16ef:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_16f4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_16f9:  ldloc 49

	IL_16fd:  nop 
	IL_16fe:  nop 
	IL_16ff:  starg 1

	IL_1703:  nop 
	IL_1704:  nop 
	IL_1705:  br IL_5201

	IL_170a:  br IL_1714

	IL_170f:  br IL_1714

	IL_1714:  ldarg 1

	IL_1718:  nop 
	IL_1719:  nop 
	IL_171a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_171f:  ldstr "newarr"
	IL_1724:  call int32 string::Compare(string, string)
	IL_1729:  stloc 0

	IL_172d:  nop 
	IL_172e:  nop 
	IL_172f:  ldloc 0

	IL_1733:  nop 
	IL_1734:  nop 
	IL_1735:  ldc.i4 0
	IL_173a:  beq IL_1744

	IL_173f:  br IL_1791

	IL_1744:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrTok::'.ctor'()
	IL_1749:  stloc 50

	IL_174d:  nop 
	IL_174e:  nop 
	IL_174f:  ldloc 50

	IL_1753:  nop 
	IL_1754:  nop 
	IL_1755:  ldarg 1

	IL_1759:  nop 
	IL_175a:  nop 
	IL_175b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1760:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1765:  ldloc 50

	IL_1769:  nop 
	IL_176a:  nop 
	IL_176b:  ldarg 1

	IL_176f:  nop 
	IL_1770:  nop 
	IL_1771:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1776:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_177b:  ldloc 50

	IL_177f:  nop 
	IL_1780:  nop 
	IL_1781:  starg 1

	IL_1785:  nop 
	IL_1786:  nop 
	IL_1787:  br IL_5201

	IL_178c:  br IL_1796

	IL_1791:  br IL_1796

	IL_1796:  ldarg 1

	IL_179a:  nop 
	IL_179b:  nop 
	IL_179c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_17a1:  ldstr "me"
	IL_17a6:  call int32 string::Compare(string, string)
	IL_17ab:  stloc 0

	IL_17af:  nop 
	IL_17b0:  nop 
	IL_17b1:  ldloc 0

	IL_17b5:  nop 
	IL_17b6:  nop 
	IL_17b7:  ldc.i4 0
	IL_17bc:  beq IL_17c6

	IL_17c1:  br IL_1813

	IL_17c6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok::'.ctor'()
	IL_17cb:  stloc 51

	IL_17cf:  nop 
	IL_17d0:  nop 
	IL_17d1:  ldloc 51

	IL_17d5:  nop 
	IL_17d6:  nop 
	IL_17d7:  ldarg 1

	IL_17db:  nop 
	IL_17dc:  nop 
	IL_17dd:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_17e2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_17e7:  ldloc 51

	IL_17eb:  nop 
	IL_17ec:  nop 
	IL_17ed:  ldarg 1

	IL_17f1:  nop 
	IL_17f2:  nop 
	IL_17f3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_17f8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_17fd:  ldloc 51

	IL_1801:  nop 
	IL_1802:  nop 
	IL_1803:  starg 1

	IL_1807:  nop 
	IL_1808:  nop 
	IL_1809:  br IL_5201

	IL_180e:  br IL_1818

	IL_1813:  br IL_1818

	IL_1818:  ldarg 1

	IL_181c:  nop 
	IL_181d:  nop 
	IL_181e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1823:  ldstr "namespace"
	IL_1828:  call int32 string::Compare(string, string)
	IL_182d:  stloc 0

	IL_1831:  nop 
	IL_1832:  nop 
	IL_1833:  ldloc 0

	IL_1837:  nop 
	IL_1838:  nop 
	IL_1839:  ldc.i4 0
	IL_183e:  beq IL_1848

	IL_1843:  br IL_1895

	IL_1848:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NamespaceTok::'.ctor'()
	IL_184d:  stloc 52

	IL_1851:  nop 
	IL_1852:  nop 
	IL_1853:  ldloc 52

	IL_1857:  nop 
	IL_1858:  nop 
	IL_1859:  ldarg 1

	IL_185d:  nop 
	IL_185e:  nop 
	IL_185f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1864:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1869:  ldloc 52

	IL_186d:  nop 
	IL_186e:  nop 
	IL_186f:  ldarg 1

	IL_1873:  nop 
	IL_1874:  nop 
	IL_1875:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_187a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_187f:  ldloc 52

	IL_1883:  nop 
	IL_1884:  nop 
	IL_1885:  starg 1

	IL_1889:  nop 
	IL_188a:  nop 
	IL_188b:  br IL_5201

	IL_1890:  br IL_189a

	IL_1895:  br IL_189a

	IL_189a:  ldarg 1

	IL_189e:  nop 
	IL_189f:  nop 
	IL_18a0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_18a5:  ldstr "ptr"
	IL_18aa:  call int32 string::Compare(string, string)
	IL_18af:  stloc 0

	IL_18b3:  nop 
	IL_18b4:  nop 
	IL_18b5:  ldloc 0

	IL_18b9:  nop 
	IL_18ba:  nop 
	IL_18bb:  ldc.i4 0
	IL_18c0:  beq IL_18ca

	IL_18c5:  br IL_1917

	IL_18ca:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok::'.ctor'()
	IL_18cf:  stloc 53

	IL_18d3:  nop 
	IL_18d4:  nop 
	IL_18d5:  ldloc 53

	IL_18d9:  nop 
	IL_18da:  nop 
	IL_18db:  ldarg 1

	IL_18df:  nop 
	IL_18e0:  nop 
	IL_18e1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_18e6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_18eb:  ldloc 53

	IL_18ef:  nop 
	IL_18f0:  nop 
	IL_18f1:  ldarg 1

	IL_18f5:  nop 
	IL_18f6:  nop 
	IL_18f7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_18fc:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1901:  ldloc 53

	IL_1905:  nop 
	IL_1906:  nop 
	IL_1907:  starg 1

	IL_190b:  nop 
	IL_190c:  nop 
	IL_190d:  br IL_5201

	IL_1912:  br IL_191c

	IL_1917:  br IL_191c

	IL_191c:  ldarg 1

	IL_1920:  nop 
	IL_1921:  nop 
	IL_1922:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1927:  ldstr "gettype"
	IL_192c:  call int32 string::Compare(string, string)
	IL_1931:  stloc 0

	IL_1935:  nop 
	IL_1936:  nop 
	IL_1937:  ldloc 0

	IL_193b:  nop 
	IL_193c:  nop 
	IL_193d:  ldc.i4 0
	IL_1942:  beq IL_194c

	IL_1947:  br IL_1999

	IL_194c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok::'.ctor'()
	IL_1951:  stloc 54

	IL_1955:  nop 
	IL_1956:  nop 
	IL_1957:  ldloc 54

	IL_195b:  nop 
	IL_195c:  nop 
	IL_195d:  ldarg 1

	IL_1961:  nop 
	IL_1962:  nop 
	IL_1963:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1968:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_196d:  ldloc 54

	IL_1971:  nop 
	IL_1972:  nop 
	IL_1973:  ldarg 1

	IL_1977:  nop 
	IL_1978:  nop 
	IL_1979:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_197e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1983:  ldloc 54

	IL_1987:  nop 
	IL_1988:  nop 
	IL_1989:  starg 1

	IL_198d:  nop 
	IL_198e:  nop 
	IL_198f:  br IL_5201

	IL_1994:  br IL_199e

	IL_1999:  br IL_199e

	IL_199e:  ldarg 1

	IL_19a2:  nop 
	IL_19a3:  nop 
	IL_19a4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_19a9:  ldstr "#refasm"
	IL_19ae:  call int32 string::Compare(string, string)
	IL_19b3:  stloc 0

	IL_19b7:  nop 
	IL_19b8:  nop 
	IL_19b9:  ldloc 0

	IL_19bd:  nop 
	IL_19be:  nop 
	IL_19bf:  ldc.i4 0
	IL_19c4:  beq IL_19ce

	IL_19c9:  br IL_1a25

	IL_19ce:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok::'.ctor'()
	IL_19d3:  stloc 55

	IL_19d7:  nop 
	IL_19d8:  nop 
	IL_19d9:  ldloc 55

	IL_19dd:  nop 
	IL_19de:  nop 
	IL_19df:  ldarg 1

	IL_19e3:  nop 
	IL_19e4:  nop 
	IL_19e5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_19ea:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_19ef:  ldloc 55

	IL_19f3:  nop 
	IL_19f4:  nop 
	IL_19f5:  ldarg 1

	IL_19f9:  nop 
	IL_19fa:  nop 
	IL_19fb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a00:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a05:  ldloc 55

	IL_1a09:  nop 
	IL_1a0a:  nop 
	IL_1a0b:  starg 1

	IL_1a0f:  nop 
	IL_1a10:  nop 
	IL_1a11:  ldc.i4 1
	IL_1a16:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1a1b:  br IL_5201

	IL_1a20:  br IL_1a2a

	IL_1a25:  br IL_1a2a

	IL_1a2a:  ldarg 1

	IL_1a2e:  nop 
	IL_1a2f:  nop 
	IL_1a30:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a35:  ldstr "#refstdasm"
	IL_1a3a:  call int32 string::Compare(string, string)
	IL_1a3f:  stloc 0

	IL_1a43:  nop 
	IL_1a44:  nop 
	IL_1a45:  ldloc 0

	IL_1a49:  nop 
	IL_1a4a:  nop 
	IL_1a4b:  ldc.i4 0
	IL_1a50:  beq IL_1a5a

	IL_1a55:  br IL_1ab1

	IL_1a5a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefstdasmTok::'.ctor'()
	IL_1a5f:  stloc 56

	IL_1a63:  nop 
	IL_1a64:  nop 
	IL_1a65:  ldloc 56

	IL_1a69:  nop 
	IL_1a6a:  nop 
	IL_1a6b:  ldarg 1

	IL_1a6f:  nop 
	IL_1a70:  nop 
	IL_1a71:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a76:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a7b:  ldloc 56

	IL_1a7f:  nop 
	IL_1a80:  nop 
	IL_1a81:  ldarg 1

	IL_1a85:  nop 
	IL_1a86:  nop 
	IL_1a87:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a8c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a91:  ldloc 56

	IL_1a95:  nop 
	IL_1a96:  nop 
	IL_1a97:  starg 1

	IL_1a9b:  nop 
	IL_1a9c:  nop 
	IL_1a9d:  ldc.i4 1
	IL_1aa2:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1aa7:  br IL_5201

	IL_1aac:  br IL_1ab6

	IL_1ab1:  br IL_1ab6

	IL_1ab6:  ldarg 1

	IL_1aba:  nop 
	IL_1abb:  nop 
	IL_1abc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ac1:  ldstr "#debug"
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

	IL_1ae6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok::'.ctor'()
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
	IL_1b29:  br IL_5201

	IL_1b2e:  br IL_1b38

	IL_1b33:  br IL_1b38

	IL_1b38:  ldarg 1

	IL_1b3c:  nop 
	IL_1b3d:  nop 
	IL_1b3e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b43:  ldstr "#include"
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

	IL_1b68:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IncludeTok::'.ctor'()
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
	IL_1bab:  br IL_5201

	IL_1bb0:  br IL_1bba

	IL_1bb5:  br IL_1bba

	IL_1bba:  ldarg 1

	IL_1bbe:  nop 
	IL_1bbf:  nop 
	IL_1bc0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1bc5:  ldstr "#scope"
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

	IL_1bea:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok::'.ctor'()
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
	IL_1c2d:  br IL_5201

	IL_1c32:  br IL_1c3c

	IL_1c37:  br IL_1c3c

	IL_1c3c:  ldarg 1

	IL_1c40:  nop 
	IL_1c41:  nop 
	IL_1c42:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c47:  ldstr "import"
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

	IL_1c6c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok::'.ctor'()
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
	IL_1cb9:  br IL_5201

	IL_1cbe:  br IL_1cc8

	IL_1cc3:  br IL_1cc8

	IL_1cc8:  ldarg 1

	IL_1ccc:  nop 
	IL_1ccd:  nop 
	IL_1cce:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cd3:  ldstr "locimport"
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

	IL_1cf8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok::'.ctor'()
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
	IL_1d45:  br IL_5201

	IL_1d4a:  br IL_1d54

	IL_1d4f:  br IL_1d54

	IL_1d54:  ldarg 1

	IL_1d58:  nop 
	IL_1d59:  nop 
	IL_1d5a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d5f:  ldstr "assembly"
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

	IL_1d84:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok::'.ctor'()
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
	IL_1dc7:  br IL_5201

	IL_1dcc:  br IL_1dd6

	IL_1dd1:  br IL_1dd6

	IL_1dd6:  ldarg 1

	IL_1dda:  nop 
	IL_1ddb:  nop 
	IL_1ddc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1de1:  ldstr "ver"
	IL_1de6:  call int32 string::Compare(string, string)
	IL_1deb:  stloc 0

	IL_1def:  nop 
	IL_1df0:  nop 
	IL_1df1:  ldloc 0

	IL_1df5:  nop 
	IL_1df6:  nop 
	IL_1df7:  ldc.i4 0
	IL_1dfc:  beq IL_1e06

	IL_1e01:  br IL_1e5d

	IL_1e06:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok::'.ctor'()
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
	IL_1e49:  ldc.i4 1
	IL_1e4e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1e53:  br IL_5201

	IL_1e58:  br IL_1e62

	IL_1e5d:  br IL_1e62

	IL_1e62:  ldarg 1

	IL_1e66:  nop 
	IL_1e67:  nop 
	IL_1e68:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1e6d:  ldstr "on"
	IL_1e72:  call int32 string::Compare(string, string)
	IL_1e77:  stloc 0

	IL_1e7b:  nop 
	IL_1e7c:  nop 
	IL_1e7d:  ldloc 0

	IL_1e81:  nop 
	IL_1e82:  nop 
	IL_1e83:  ldc.i4 0
	IL_1e88:  beq IL_1e92

	IL_1e8d:  br IL_1edf

	IL_1e92:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok::'.ctor'()
	IL_1e97:  stloc 64

	IL_1e9b:  nop 
	IL_1e9c:  nop 
	IL_1e9d:  ldloc 64

	IL_1ea1:  nop 
	IL_1ea2:  nop 
	IL_1ea3:  ldarg 1

	IL_1ea7:  nop 
	IL_1ea8:  nop 
	IL_1ea9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1eae:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1eb3:  ldloc 64

	IL_1eb7:  nop 
	IL_1eb8:  nop 
	IL_1eb9:  ldarg 1

	IL_1ebd:  nop 
	IL_1ebe:  nop 
	IL_1ebf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ec4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ec9:  ldloc 64

	IL_1ecd:  nop 
	IL_1ece:  nop 
	IL_1ecf:  starg 1

	IL_1ed3:  nop 
	IL_1ed4:  nop 
	IL_1ed5:  br IL_5201

	IL_1eda:  br IL_1ee4

	IL_1edf:  br IL_1ee4

	IL_1ee4:  ldarg 1

	IL_1ee8:  nop 
	IL_1ee9:  nop 
	IL_1eea:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1eef:  ldstr "off"
	IL_1ef4:  call int32 string::Compare(string, string)
	IL_1ef9:  stloc 0

	IL_1efd:  nop 
	IL_1efe:  nop 
	IL_1eff:  ldloc 0

	IL_1f03:  nop 
	IL_1f04:  nop 
	IL_1f05:  ldc.i4 0
	IL_1f0a:  beq IL_1f14

	IL_1f0f:  br IL_1f61

	IL_1f14:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok::'.ctor'()
	IL_1f19:  stloc 65

	IL_1f1d:  nop 
	IL_1f1e:  nop 
	IL_1f1f:  ldloc 65

	IL_1f23:  nop 
	IL_1f24:  nop 
	IL_1f25:  ldarg 1

	IL_1f29:  nop 
	IL_1f2a:  nop 
	IL_1f2b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1f30:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1f35:  ldloc 65

	IL_1f39:  nop 
	IL_1f3a:  nop 
	IL_1f3b:  ldarg 1

	IL_1f3f:  nop 
	IL_1f40:  nop 
	IL_1f41:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f46:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f4b:  ldloc 65

	IL_1f4f:  nop 
	IL_1f50:  nop 
	IL_1f51:  starg 1

	IL_1f55:  nop 
	IL_1f56:  nop 
	IL_1f57:  br IL_5201

	IL_1f5c:  br IL_1f66

	IL_1f61:  br IL_1f66

	IL_1f66:  ldarg 1

	IL_1f6a:  nop 
	IL_1f6b:  nop 
	IL_1f6c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f71:  ldstr "exe"
	IL_1f76:  call int32 string::Compare(string, string)
	IL_1f7b:  stloc 0

	IL_1f7f:  nop 
	IL_1f80:  nop 
	IL_1f81:  ldloc 0

	IL_1f85:  nop 
	IL_1f86:  nop 
	IL_1f87:  ldc.i4 0
	IL_1f8c:  beq IL_1f96

	IL_1f91:  br IL_1fe3

	IL_1f96:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok::'.ctor'()
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
	IL_1fd9:  br IL_5201

	IL_1fde:  br IL_1fe8

	IL_1fe3:  br IL_1fe8

	IL_1fe8:  ldarg 1

	IL_1fec:  nop 
	IL_1fed:  nop 
	IL_1fee:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ff3:  ldstr "dll"
	IL_1ff8:  call int32 string::Compare(string, string)
	IL_1ffd:  stloc 0

	IL_2001:  nop 
	IL_2002:  nop 
	IL_2003:  ldloc 0

	IL_2007:  nop 
	IL_2008:  nop 
	IL_2009:  ldc.i4 0
	IL_200e:  beq IL_2018

	IL_2013:  br IL_2065

	IL_2018:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok::'.ctor'()
	IL_201d:  stloc 67

	IL_2021:  nop 
	IL_2022:  nop 
	IL_2023:  ldloc 67

	IL_2027:  nop 
	IL_2028:  nop 
	IL_2029:  ldarg 1

	IL_202d:  nop 
	IL_202e:  nop 
	IL_202f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2034:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2039:  ldloc 67

	IL_203d:  nop 
	IL_203e:  nop 
	IL_203f:  ldarg 1

	IL_2043:  nop 
	IL_2044:  nop 
	IL_2045:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_204a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_204f:  ldloc 67

	IL_2053:  nop 
	IL_2054:  nop 
	IL_2055:  starg 1

	IL_2059:  nop 
	IL_205a:  nop 
	IL_205b:  br IL_5201

	IL_2060:  br IL_206a

	IL_2065:  br IL_206a

	IL_206a:  ldarg 1

	IL_206e:  nop 
	IL_206f:  nop 
	IL_2070:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2075:  ldstr "field"
	IL_207a:  call int32 string::Compare(string, string)
	IL_207f:  stloc 0

	IL_2083:  nop 
	IL_2084:  nop 
	IL_2085:  ldloc 0

	IL_2089:  nop 
	IL_208a:  nop 
	IL_208b:  ldc.i4 0
	IL_2090:  beq IL_209a

	IL_2095:  br IL_20e7

	IL_209a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok::'.ctor'()
	IL_209f:  stloc 68

	IL_20a3:  nop 
	IL_20a4:  nop 
	IL_20a5:  ldloc 68

	IL_20a9:  nop 
	IL_20aa:  nop 
	IL_20ab:  ldarg 1

	IL_20af:  nop 
	IL_20b0:  nop 
	IL_20b1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_20b6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_20bb:  ldloc 68

	IL_20bf:  nop 
	IL_20c0:  nop 
	IL_20c1:  ldarg 1

	IL_20c5:  nop 
	IL_20c6:  nop 
	IL_20c7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20cc:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20d1:  ldloc 68

	IL_20d5:  nop 
	IL_20d6:  nop 
	IL_20d7:  starg 1

	IL_20db:  nop 
	IL_20dc:  nop 
	IL_20dd:  br IL_5201

	IL_20e2:  br IL_20ec

	IL_20e7:  br IL_20ec

	IL_20ec:  ldarg 1

	IL_20f0:  nop 
	IL_20f1:  nop 
	IL_20f2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20f7:  ldstr "class"
	IL_20fc:  call int32 string::Compare(string, string)
	IL_2101:  stloc 0

	IL_2105:  nop 
	IL_2106:  nop 
	IL_2107:  ldloc 0

	IL_210b:  nop 
	IL_210c:  nop 
	IL_210d:  ldc.i4 0
	IL_2112:  beq IL_211c

	IL_2117:  br IL_2169

	IL_211c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok::'.ctor'()
	IL_2121:  stloc 69

	IL_2125:  nop 
	IL_2126:  nop 
	IL_2127:  ldloc 69

	IL_212b:  nop 
	IL_212c:  nop 
	IL_212d:  ldarg 1

	IL_2131:  nop 
	IL_2132:  nop 
	IL_2133:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2138:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_213d:  ldloc 69

	IL_2141:  nop 
	IL_2142:  nop 
	IL_2143:  ldarg 1

	IL_2147:  nop 
	IL_2148:  nop 
	IL_2149:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_214e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2153:  ldloc 69

	IL_2157:  nop 
	IL_2158:  nop 
	IL_2159:  starg 1

	IL_215d:  nop 
	IL_215e:  nop 
	IL_215f:  br IL_5201

	IL_2164:  br IL_216e

	IL_2169:  br IL_216e

	IL_216e:  ldarg 1

	IL_2172:  nop 
	IL_2173:  nop 
	IL_2174:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2179:  ldstr "delegate"
	IL_217e:  call int32 string::Compare(string, string)
	IL_2183:  stloc 0

	IL_2187:  nop 
	IL_2188:  nop 
	IL_2189:  ldloc 0

	IL_218d:  nop 
	IL_218e:  nop 
	IL_218f:  ldc.i4 0
	IL_2194:  beq IL_219e

	IL_2199:  br IL_21eb

	IL_219e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DelegateTok::'.ctor'()
	IL_21a3:  stloc 70

	IL_21a7:  nop 
	IL_21a8:  nop 
	IL_21a9:  ldloc 70

	IL_21ad:  nop 
	IL_21ae:  nop 
	IL_21af:  ldarg 1

	IL_21b3:  nop 
	IL_21b4:  nop 
	IL_21b5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_21ba:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_21bf:  ldloc 70

	IL_21c3:  nop 
	IL_21c4:  nop 
	IL_21c5:  ldarg 1

	IL_21c9:  nop 
	IL_21ca:  nop 
	IL_21cb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21d0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21d5:  ldloc 70

	IL_21d9:  nop 
	IL_21da:  nop 
	IL_21db:  starg 1

	IL_21df:  nop 
	IL_21e0:  nop 
	IL_21e1:  br IL_5201

	IL_21e6:  br IL_21f0

	IL_21eb:  br IL_21f0

	IL_21f0:  ldarg 1

	IL_21f4:  nop 
	IL_21f5:  nop 
	IL_21f6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21fb:  ldstr "extends"
	IL_2200:  call int32 string::Compare(string, string)
	IL_2205:  stloc 0

	IL_2209:  nop 
	IL_220a:  nop 
	IL_220b:  ldloc 0

	IL_220f:  nop 
	IL_2210:  nop 
	IL_2211:  ldc.i4 0
	IL_2216:  beq IL_2220

	IL_221b:  br IL_226d

	IL_2220:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok::'.ctor'()
	IL_2225:  stloc 71

	IL_2229:  nop 
	IL_222a:  nop 
	IL_222b:  ldloc 71

	IL_222f:  nop 
	IL_2230:  nop 
	IL_2231:  ldarg 1

	IL_2235:  nop 
	IL_2236:  nop 
	IL_2237:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_223c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2241:  ldloc 71

	IL_2245:  nop 
	IL_2246:  nop 
	IL_2247:  ldarg 1

	IL_224b:  nop 
	IL_224c:  nop 
	IL_224d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2252:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2257:  ldloc 71

	IL_225b:  nop 
	IL_225c:  nop 
	IL_225d:  starg 1

	IL_2261:  nop 
	IL_2262:  nop 
	IL_2263:  br IL_5201

	IL_2268:  br IL_2272

	IL_226d:  br IL_2272

	IL_2272:  ldarg 1

	IL_2276:  nop 
	IL_2277:  nop 
	IL_2278:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_227d:  ldstr "method"
	IL_2282:  call int32 string::Compare(string, string)
	IL_2287:  stloc 0

	IL_228b:  nop 
	IL_228c:  nop 
	IL_228d:  ldloc 0

	IL_2291:  nop 
	IL_2292:  nop 
	IL_2293:  ldc.i4 0
	IL_2298:  beq IL_22a2

	IL_229d:  br IL_22ef

	IL_22a2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok::'.ctor'()
	IL_22a7:  stloc 72

	IL_22ab:  nop 
	IL_22ac:  nop 
	IL_22ad:  ldloc 72

	IL_22b1:  nop 
	IL_22b2:  nop 
	IL_22b3:  ldarg 1

	IL_22b7:  nop 
	IL_22b8:  nop 
	IL_22b9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_22be:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_22c3:  ldloc 72

	IL_22c7:  nop 
	IL_22c8:  nop 
	IL_22c9:  ldarg 1

	IL_22cd:  nop 
	IL_22ce:  nop 
	IL_22cf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22d4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22d9:  ldloc 72

	IL_22dd:  nop 
	IL_22de:  nop 
	IL_22df:  starg 1

	IL_22e3:  nop 
	IL_22e4:  nop 
	IL_22e5:  br IL_5201

	IL_22ea:  br IL_22f4

	IL_22ef:  br IL_22f4

	IL_22f4:  ldarg 1

	IL_22f8:  nop 
	IL_22f9:  nop 
	IL_22fa:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22ff:  ldstr "end"
	IL_2304:  call int32 string::Compare(string, string)
	IL_2309:  stloc 0

	IL_230d:  nop 
	IL_230e:  nop 
	IL_230f:  ldloc 0

	IL_2313:  nop 
	IL_2314:  nop 
	IL_2315:  ldc.i4 0
	IL_231a:  beq IL_2324

	IL_231f:  br IL_2371

	IL_2324:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok::'.ctor'()
	IL_2329:  stloc 73

	IL_232d:  nop 
	IL_232e:  nop 
	IL_232f:  ldloc 73

	IL_2333:  nop 
	IL_2334:  nop 
	IL_2335:  ldarg 1

	IL_2339:  nop 
	IL_233a:  nop 
	IL_233b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2340:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2345:  ldloc 73

	IL_2349:  nop 
	IL_234a:  nop 
	IL_234b:  ldarg 1

	IL_234f:  nop 
	IL_2350:  nop 
	IL_2351:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2356:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_235b:  ldloc 73

	IL_235f:  nop 
	IL_2360:  nop 
	IL_2361:  starg 1

	IL_2365:  nop 
	IL_2366:  nop 
	IL_2367:  br IL_5201

	IL_236c:  br IL_2376

	IL_2371:  br IL_2376

	IL_2376:  ldarg 1

	IL_237a:  nop 
	IL_237b:  nop 
	IL_237c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2381:  ldstr "return"
	IL_2386:  call int32 string::Compare(string, string)
	IL_238b:  stloc 0

	IL_238f:  nop 
	IL_2390:  nop 
	IL_2391:  ldloc 0

	IL_2395:  nop 
	IL_2396:  nop 
	IL_2397:  ldc.i4 0
	IL_239c:  beq IL_23a6

	IL_23a1:  br IL_23f3

	IL_23a6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok::'.ctor'()
	IL_23ab:  stloc 74

	IL_23af:  nop 
	IL_23b0:  nop 
	IL_23b1:  ldloc 74

	IL_23b5:  nop 
	IL_23b6:  nop 
	IL_23b7:  ldarg 1

	IL_23bb:  nop 
	IL_23bc:  nop 
	IL_23bd:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_23c2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_23c7:  ldloc 74

	IL_23cb:  nop 
	IL_23cc:  nop 
	IL_23cd:  ldarg 1

	IL_23d1:  nop 
	IL_23d2:  nop 
	IL_23d3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23d8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23dd:  ldloc 74

	IL_23e1:  nop 
	IL_23e2:  nop 
	IL_23e3:  starg 1

	IL_23e7:  nop 
	IL_23e8:  nop 
	IL_23e9:  br IL_5201

	IL_23ee:  br IL_23f8

	IL_23f3:  br IL_23f8

	IL_23f8:  ldarg 1

	IL_23fc:  nop 
	IL_23fd:  nop 
	IL_23fe:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2403:  ldstr "var"
	IL_2408:  call int32 string::Compare(string, string)
	IL_240d:  stloc 0

	IL_2411:  nop 
	IL_2412:  nop 
	IL_2413:  ldloc 0

	IL_2417:  nop 
	IL_2418:  nop 
	IL_2419:  ldc.i4 0
	IL_241e:  beq IL_2428

	IL_2423:  br IL_2475

	IL_2428:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok::'.ctor'()
	IL_242d:  stloc 75

	IL_2431:  nop 
	IL_2432:  nop 
	IL_2433:  ldloc 75

	IL_2437:  nop 
	IL_2438:  nop 
	IL_2439:  ldarg 1

	IL_243d:  nop 
	IL_243e:  nop 
	IL_243f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2444:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2449:  ldloc 75

	IL_244d:  nop 
	IL_244e:  nop 
	IL_244f:  ldarg 1

	IL_2453:  nop 
	IL_2454:  nop 
	IL_2455:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_245a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_245f:  ldloc 75

	IL_2463:  nop 
	IL_2464:  nop 
	IL_2465:  starg 1

	IL_2469:  nop 
	IL_246a:  nop 
	IL_246b:  br IL_5201

	IL_2470:  br IL_247a

	IL_2475:  br IL_247a

	IL_247a:  ldarg 1

	IL_247e:  nop 
	IL_247f:  nop 
	IL_2480:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2485:  ldstr "as"
	IL_248a:  call int32 string::Compare(string, string)
	IL_248f:  stloc 0

	IL_2493:  nop 
	IL_2494:  nop 
	IL_2495:  ldloc 0

	IL_2499:  nop 
	IL_249a:  nop 
	IL_249b:  ldc.i4 0
	IL_24a0:  beq IL_24aa

	IL_24a5:  br IL_24f7

	IL_24aa:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok::'.ctor'()
	IL_24af:  stloc 76

	IL_24b3:  nop 
	IL_24b4:  nop 
	IL_24b5:  ldloc 76

	IL_24b9:  nop 
	IL_24ba:  nop 
	IL_24bb:  ldarg 1

	IL_24bf:  nop 
	IL_24c0:  nop 
	IL_24c1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_24c6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_24cb:  ldloc 76

	IL_24cf:  nop 
	IL_24d0:  nop 
	IL_24d1:  ldarg 1

	IL_24d5:  nop 
	IL_24d6:  nop 
	IL_24d7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24dc:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24e1:  ldloc 76

	IL_24e5:  nop 
	IL_24e6:  nop 
	IL_24e7:  starg 1

	IL_24eb:  nop 
	IL_24ec:  nop 
	IL_24ed:  br IL_5201

	IL_24f2:  br IL_24fc

	IL_24f7:  br IL_24fc

	IL_24fc:  ldarg 1

	IL_2500:  nop 
	IL_2501:  nop 
	IL_2502:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2507:  ldstr "of"
	IL_250c:  call int32 string::Compare(string, string)
	IL_2511:  stloc 0

	IL_2515:  nop 
	IL_2516:  nop 
	IL_2517:  ldloc 0

	IL_251b:  nop 
	IL_251c:  nop 
	IL_251d:  ldc.i4 0
	IL_2522:  beq IL_252c

	IL_2527:  br IL_2579

	IL_252c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok::'.ctor'()
	IL_2531:  stloc 77

	IL_2535:  nop 
	IL_2536:  nop 
	IL_2537:  ldloc 77

	IL_253b:  nop 
	IL_253c:  nop 
	IL_253d:  ldarg 1

	IL_2541:  nop 
	IL_2542:  nop 
	IL_2543:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2548:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_254d:  ldloc 77

	IL_2551:  nop 
	IL_2552:  nop 
	IL_2553:  ldarg 1

	IL_2557:  nop 
	IL_2558:  nop 
	IL_2559:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_255e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2563:  ldloc 77

	IL_2567:  nop 
	IL_2568:  nop 
	IL_2569:  starg 1

	IL_256d:  nop 
	IL_256e:  nop 
	IL_256f:  br IL_5201

	IL_2574:  br IL_257e

	IL_2579:  br IL_257e

	IL_257e:  ldarg 1

	IL_2582:  nop 
	IL_2583:  nop 
	IL_2584:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2589:  ldstr "private"
	IL_258e:  call int32 string::Compare(string, string)
	IL_2593:  stloc 0

	IL_2597:  nop 
	IL_2598:  nop 
	IL_2599:  ldloc 0

	IL_259d:  nop 
	IL_259e:  nop 
	IL_259f:  ldc.i4 0
	IL_25a4:  beq IL_25ae

	IL_25a9:  br IL_25fb

	IL_25ae:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr::'.ctor'()
	IL_25b3:  stloc 78

	IL_25b7:  nop 
	IL_25b8:  nop 
	IL_25b9:  ldloc 78

	IL_25bd:  nop 
	IL_25be:  nop 
	IL_25bf:  ldarg 1

	IL_25c3:  nop 
	IL_25c4:  nop 
	IL_25c5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_25ca:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_25cf:  ldloc 78

	IL_25d3:  nop 
	IL_25d4:  nop 
	IL_25d5:  ldarg 1

	IL_25d9:  nop 
	IL_25da:  nop 
	IL_25db:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_25e0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_25e5:  ldloc 78

	IL_25e9:  nop 
	IL_25ea:  nop 
	IL_25eb:  starg 1

	IL_25ef:  nop 
	IL_25f0:  nop 
	IL_25f1:  br IL_5201

	IL_25f6:  br IL_2600

	IL_25fb:  br IL_2600

	IL_2600:  ldarg 1

	IL_2604:  nop 
	IL_2605:  nop 
	IL_2606:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_260b:  ldstr "public"
	IL_2610:  call int32 string::Compare(string, string)
	IL_2615:  stloc 0

	IL_2619:  nop 
	IL_261a:  nop 
	IL_261b:  ldloc 0

	IL_261f:  nop 
	IL_2620:  nop 
	IL_2621:  ldc.i4 0
	IL_2626:  beq IL_2630

	IL_262b:  br IL_267d

	IL_2630:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr::'.ctor'()
	IL_2635:  stloc 79

	IL_2639:  nop 
	IL_263a:  nop 
	IL_263b:  ldloc 79

	IL_263f:  nop 
	IL_2640:  nop 
	IL_2641:  ldarg 1

	IL_2645:  nop 
	IL_2646:  nop 
	IL_2647:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_264c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2651:  ldloc 79

	IL_2655:  nop 
	IL_2656:  nop 
	IL_2657:  ldarg 1

	IL_265b:  nop 
	IL_265c:  nop 
	IL_265d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2662:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2667:  ldloc 79

	IL_266b:  nop 
	IL_266c:  nop 
	IL_266d:  starg 1

	IL_2671:  nop 
	IL_2672:  nop 
	IL_2673:  br IL_5201

	IL_2678:  br IL_2682

	IL_267d:  br IL_2682

	IL_2682:  ldarg 1

	IL_2686:  nop 
	IL_2687:  nop 
	IL_2688:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_268d:  ldstr "initonly"
	IL_2692:  call int32 string::Compare(string, string)
	IL_2697:  stloc 0

	IL_269b:  nop 
	IL_269c:  nop 
	IL_269d:  ldloc 0

	IL_26a1:  nop 
	IL_26a2:  nop 
	IL_26a3:  ldc.i4 0
	IL_26a8:  beq IL_26b2

	IL_26ad:  br IL_26ff

	IL_26b2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr::'.ctor'()
	IL_26b7:  stloc 80

	IL_26bb:  nop 
	IL_26bc:  nop 
	IL_26bd:  ldloc 80

	IL_26c1:  nop 
	IL_26c2:  nop 
	IL_26c3:  ldarg 1

	IL_26c7:  nop 
	IL_26c8:  nop 
	IL_26c9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_26ce:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_26d3:  ldloc 80

	IL_26d7:  nop 
	IL_26d8:  nop 
	IL_26d9:  ldarg 1

	IL_26dd:  nop 
	IL_26de:  nop 
	IL_26df:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26e4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26e9:  ldloc 80

	IL_26ed:  nop 
	IL_26ee:  nop 
	IL_26ef:  starg 1

	IL_26f3:  nop 
	IL_26f4:  nop 
	IL_26f5:  br IL_5201

	IL_26fa:  br IL_2704

	IL_26ff:  br IL_2704

	IL_2704:  ldarg 1

	IL_2708:  nop 
	IL_2709:  nop 
	IL_270a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_270f:  ldstr "static"
	IL_2714:  call int32 string::Compare(string, string)
	IL_2719:  stloc 0

	IL_271d:  nop 
	IL_271e:  nop 
	IL_271f:  ldloc 0

	IL_2723:  nop 
	IL_2724:  nop 
	IL_2725:  ldc.i4 0
	IL_272a:  beq IL_2734

	IL_272f:  br IL_2781

	IL_2734:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr::'.ctor'()
	IL_2739:  stloc 81

	IL_273d:  nop 
	IL_273e:  nop 
	IL_273f:  ldloc 81

	IL_2743:  nop 
	IL_2744:  nop 
	IL_2745:  ldarg 1

	IL_2749:  nop 
	IL_274a:  nop 
	IL_274b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2750:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2755:  ldloc 81

	IL_2759:  nop 
	IL_275a:  nop 
	IL_275b:  ldarg 1

	IL_275f:  nop 
	IL_2760:  nop 
	IL_2761:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2766:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_276b:  ldloc 81

	IL_276f:  nop 
	IL_2770:  nop 
	IL_2771:  starg 1

	IL_2775:  nop 
	IL_2776:  nop 
	IL_2777:  br IL_5201

	IL_277c:  br IL_2786

	IL_2781:  br IL_2786

	IL_2786:  ldarg 1

	IL_278a:  nop 
	IL_278b:  nop 
	IL_278c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2791:  ldstr "specialname"
	IL_2796:  call int32 string::Compare(string, string)
	IL_279b:  stloc 0

	IL_279f:  nop 
	IL_27a0:  nop 
	IL_27a1:  ldloc 0

	IL_27a5:  nop 
	IL_27a6:  nop 
	IL_27a7:  ldc.i4 0
	IL_27ac:  beq IL_27b6

	IL_27b1:  br IL_2803

	IL_27b6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr::'.ctor'()
	IL_27bb:  stloc 82

	IL_27bf:  nop 
	IL_27c0:  nop 
	IL_27c1:  ldloc 82

	IL_27c5:  nop 
	IL_27c6:  nop 
	IL_27c7:  ldarg 1

	IL_27cb:  nop 
	IL_27cc:  nop 
	IL_27cd:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_27d2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_27d7:  ldloc 82

	IL_27db:  nop 
	IL_27dc:  nop 
	IL_27dd:  ldarg 1

	IL_27e1:  nop 
	IL_27e2:  nop 
	IL_27e3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27e8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27ed:  ldloc 82

	IL_27f1:  nop 
	IL_27f2:  nop 
	IL_27f3:  starg 1

	IL_27f7:  nop 
	IL_27f8:  nop 
	IL_27f9:  br IL_5201

	IL_27fe:  br IL_2808

	IL_2803:  br IL_2808

	IL_2808:  ldarg 1

	IL_280c:  nop 
	IL_280d:  nop 
	IL_280e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2813:  ldstr "hidebysig"
	IL_2818:  call int32 string::Compare(string, string)
	IL_281d:  stloc 0

	IL_2821:  nop 
	IL_2822:  nop 
	IL_2823:  ldloc 0

	IL_2827:  nop 
	IL_2828:  nop 
	IL_2829:  ldc.i4 0
	IL_282e:  beq IL_2838

	IL_2833:  br IL_2885

	IL_2838:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr::'.ctor'()
	IL_283d:  stloc 83

	IL_2841:  nop 
	IL_2842:  nop 
	IL_2843:  ldloc 83

	IL_2847:  nop 
	IL_2848:  nop 
	IL_2849:  ldarg 1

	IL_284d:  nop 
	IL_284e:  nop 
	IL_284f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2854:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2859:  ldloc 83

	IL_285d:  nop 
	IL_285e:  nop 
	IL_285f:  ldarg 1

	IL_2863:  nop 
	IL_2864:  nop 
	IL_2865:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_286a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_286f:  ldloc 83

	IL_2873:  nop 
	IL_2874:  nop 
	IL_2875:  starg 1

	IL_2879:  nop 
	IL_287a:  nop 
	IL_287b:  br IL_5201

	IL_2880:  br IL_288a

	IL_2885:  br IL_288a

	IL_288a:  ldarg 1

	IL_288e:  nop 
	IL_288f:  nop 
	IL_2890:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2895:  ldstr "virtual"
	IL_289a:  call int32 string::Compare(string, string)
	IL_289f:  stloc 0

	IL_28a3:  nop 
	IL_28a4:  nop 
	IL_28a5:  ldloc 0

	IL_28a9:  nop 
	IL_28aa:  nop 
	IL_28ab:  ldc.i4 0
	IL_28b0:  beq IL_28ba

	IL_28b5:  br IL_2907

	IL_28ba:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr::'.ctor'()
	IL_28bf:  stloc 84

	IL_28c3:  nop 
	IL_28c4:  nop 
	IL_28c5:  ldloc 84

	IL_28c9:  nop 
	IL_28ca:  nop 
	IL_28cb:  ldarg 1

	IL_28cf:  nop 
	IL_28d0:  nop 
	IL_28d1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28d6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28db:  ldloc 84

	IL_28df:  nop 
	IL_28e0:  nop 
	IL_28e1:  ldarg 1

	IL_28e5:  nop 
	IL_28e6:  nop 
	IL_28e7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28ec:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28f1:  ldloc 84

	IL_28f5:  nop 
	IL_28f6:  nop 
	IL_28f7:  starg 1

	IL_28fb:  nop 
	IL_28fc:  nop 
	IL_28fd:  br IL_5201

	IL_2902:  br IL_290c

	IL_2907:  br IL_290c

	IL_290c:  ldarg 1

	IL_2910:  nop 
	IL_2911:  nop 
	IL_2912:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2917:  ldstr "auto"
	IL_291c:  call int32 string::Compare(string, string)
	IL_2921:  stloc 0

	IL_2925:  nop 
	IL_2926:  nop 
	IL_2927:  ldloc 0

	IL_292b:  nop 
	IL_292c:  nop 
	IL_292d:  ldc.i4 0
	IL_2932:  beq IL_293c

	IL_2937:  br IL_2989

	IL_293c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr::'.ctor'()
	IL_2941:  stloc 85

	IL_2945:  nop 
	IL_2946:  nop 
	IL_2947:  ldloc 85

	IL_294b:  nop 
	IL_294c:  nop 
	IL_294d:  ldarg 1

	IL_2951:  nop 
	IL_2952:  nop 
	IL_2953:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2958:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_295d:  ldloc 85

	IL_2961:  nop 
	IL_2962:  nop 
	IL_2963:  ldarg 1

	IL_2967:  nop 
	IL_2968:  nop 
	IL_2969:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_296e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2973:  ldloc 85

	IL_2977:  nop 
	IL_2978:  nop 
	IL_2979:  starg 1

	IL_297d:  nop 
	IL_297e:  nop 
	IL_297f:  br IL_5201

	IL_2984:  br IL_298e

	IL_2989:  br IL_298e

	IL_298e:  ldarg 1

	IL_2992:  nop 
	IL_2993:  nop 
	IL_2994:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2999:  ldstr "autochar"
	IL_299e:  call int32 string::Compare(string, string)
	IL_29a3:  stloc 0

	IL_29a7:  nop 
	IL_29a8:  nop 
	IL_29a9:  ldloc 0

	IL_29ad:  nop 
	IL_29ae:  nop 
	IL_29af:  ldc.i4 0
	IL_29b4:  beq IL_29be

	IL_29b9:  br IL_2a0b

	IL_29be:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr::'.ctor'()
	IL_29c3:  stloc 86

	IL_29c7:  nop 
	IL_29c8:  nop 
	IL_29c9:  ldloc 86

	IL_29cd:  nop 
	IL_29ce:  nop 
	IL_29cf:  ldarg 1

	IL_29d3:  nop 
	IL_29d4:  nop 
	IL_29d5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29da:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29df:  ldloc 86

	IL_29e3:  nop 
	IL_29e4:  nop 
	IL_29e5:  ldarg 1

	IL_29e9:  nop 
	IL_29ea:  nop 
	IL_29eb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29f0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29f5:  ldloc 86

	IL_29f9:  nop 
	IL_29fa:  nop 
	IL_29fb:  starg 1

	IL_29ff:  nop 
	IL_2a00:  nop 
	IL_2a01:  br IL_5201

	IL_2a06:  br IL_2a10

	IL_2a0b:  br IL_2a10

	IL_2a10:  ldarg 1

	IL_2a14:  nop 
	IL_2a15:  nop 
	IL_2a16:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a1b:  ldstr "ansi"
	IL_2a20:  call int32 string::Compare(string, string)
	IL_2a25:  stloc 0

	IL_2a29:  nop 
	IL_2a2a:  nop 
	IL_2a2b:  ldloc 0

	IL_2a2f:  nop 
	IL_2a30:  nop 
	IL_2a31:  ldc.i4 0
	IL_2a36:  beq IL_2a40

	IL_2a3b:  br IL_2a8d

	IL_2a40:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr::'.ctor'()
	IL_2a45:  stloc 87

	IL_2a49:  nop 
	IL_2a4a:  nop 
	IL_2a4b:  ldloc 87

	IL_2a4f:  nop 
	IL_2a50:  nop 
	IL_2a51:  ldarg 1

	IL_2a55:  nop 
	IL_2a56:  nop 
	IL_2a57:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a5c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a61:  ldloc 87

	IL_2a65:  nop 
	IL_2a66:  nop 
	IL_2a67:  ldarg 1

	IL_2a6b:  nop 
	IL_2a6c:  nop 
	IL_2a6d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a72:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a77:  ldloc 87

	IL_2a7b:  nop 
	IL_2a7c:  nop 
	IL_2a7d:  starg 1

	IL_2a81:  nop 
	IL_2a82:  nop 
	IL_2a83:  br IL_5201

	IL_2a88:  br IL_2a92

	IL_2a8d:  br IL_2a92

	IL_2a92:  ldarg 1

	IL_2a96:  nop 
	IL_2a97:  nop 
	IL_2a98:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a9d:  ldstr "beforefieldinit"
	IL_2aa2:  call int32 string::Compare(string, string)
	IL_2aa7:  stloc 0

	IL_2aab:  nop 
	IL_2aac:  nop 
	IL_2aad:  ldloc 0

	IL_2ab1:  nop 
	IL_2ab2:  nop 
	IL_2ab3:  ldc.i4 0
	IL_2ab8:  beq IL_2ac2

	IL_2abd:  br IL_2b0f

	IL_2ac2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr::'.ctor'()
	IL_2ac7:  stloc 88

	IL_2acb:  nop 
	IL_2acc:  nop 
	IL_2acd:  ldloc 88

	IL_2ad1:  nop 
	IL_2ad2:  nop 
	IL_2ad3:  ldarg 1

	IL_2ad7:  nop 
	IL_2ad8:  nop 
	IL_2ad9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ade:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ae3:  ldloc 88

	IL_2ae7:  nop 
	IL_2ae8:  nop 
	IL_2ae9:  ldarg 1

	IL_2aed:  nop 
	IL_2aee:  nop 
	IL_2aef:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2af4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2af9:  ldloc 88

	IL_2afd:  nop 
	IL_2afe:  nop 
	IL_2aff:  starg 1

	IL_2b03:  nop 
	IL_2b04:  nop 
	IL_2b05:  br IL_5201

	IL_2b0a:  br IL_2b14

	IL_2b0f:  br IL_2b14

	IL_2b14:  ldarg 1

	IL_2b18:  nop 
	IL_2b19:  nop 
	IL_2b1a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b1f:  ldstr "string"
	IL_2b24:  call int32 string::Compare(string, string)
	IL_2b29:  stloc 0

	IL_2b2d:  nop 
	IL_2b2e:  nop 
	IL_2b2f:  ldloc 0

	IL_2b33:  nop 
	IL_2b34:  nop 
	IL_2b35:  ldc.i4 0
	IL_2b3a:  beq IL_2b44

	IL_2b3f:  br IL_2ba6

	IL_2b44:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok::'.ctor'()
	IL_2b49:  stloc 89

	IL_2b4d:  nop 
	IL_2b4e:  nop 
	IL_2b4f:  ldloc 89

	IL_2b53:  nop 
	IL_2b54:  nop 
	IL_2b55:  ldarg 1

	IL_2b59:  nop 
	IL_2b5a:  nop 
	IL_2b5b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b60:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b65:  ldloc 89

	IL_2b69:  nop 
	IL_2b6a:  nop 
	IL_2b6b:  ldarg 1

	IL_2b6f:  nop 
	IL_2b70:  nop 
	IL_2b71:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b76:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b7b:  ldloc 89

	IL_2b7f:  nop 
	IL_2b80:  nop 
	IL_2b81:  ldtoken [mscorlib]System.String
	IL_2b86:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2b8b:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2b90:  ldloc 89

	IL_2b94:  nop 
	IL_2b95:  nop 
	IL_2b96:  starg 1

	IL_2b9a:  nop 
	IL_2b9b:  nop 
	IL_2b9c:  br IL_5201

	IL_2ba1:  br IL_2bab

	IL_2ba6:  br IL_2bab

	IL_2bab:  ldarg 1

	IL_2baf:  nop 
	IL_2bb0:  nop 
	IL_2bb1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bb6:  ldstr "void"
	IL_2bbb:  call int32 string::Compare(string, string)
	IL_2bc0:  stloc 0

	IL_2bc4:  nop 
	IL_2bc5:  nop 
	IL_2bc6:  ldloc 0

	IL_2bca:  nop 
	IL_2bcb:  nop 
	IL_2bcc:  ldc.i4 0
	IL_2bd1:  beq IL_2bdb

	IL_2bd6:  br IL_2c3d

	IL_2bdb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok::'.ctor'()
	IL_2be0:  stloc 90

	IL_2be4:  nop 
	IL_2be5:  nop 
	IL_2be6:  ldloc 90

	IL_2bea:  nop 
	IL_2beb:  nop 
	IL_2bec:  ldarg 1

	IL_2bf0:  nop 
	IL_2bf1:  nop 
	IL_2bf2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2bf7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2bfc:  ldloc 90

	IL_2c00:  nop 
	IL_2c01:  nop 
	IL_2c02:  ldarg 1

	IL_2c06:  nop 
	IL_2c07:  nop 
	IL_2c08:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c0d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c12:  ldloc 90

	IL_2c16:  nop 
	IL_2c17:  nop 
	IL_2c18:  ldtoken [mscorlib]System.Void
	IL_2c1d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2c22:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2c27:  ldloc 90

	IL_2c2b:  nop 
	IL_2c2c:  nop 
	IL_2c2d:  starg 1

	IL_2c31:  nop 
	IL_2c32:  nop 
	IL_2c33:  br IL_5201

	IL_2c38:  br IL_2c42

	IL_2c3d:  br IL_2c42

	IL_2c42:  ldarg 1

	IL_2c46:  nop 
	IL_2c47:  nop 
	IL_2c48:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c4d:  ldstr "decimal"
	IL_2c52:  call int32 string::Compare(string, string)
	IL_2c57:  stloc 0

	IL_2c5b:  nop 
	IL_2c5c:  nop 
	IL_2c5d:  ldloc 0

	IL_2c61:  nop 
	IL_2c62:  nop 
	IL_2c63:  ldc.i4 0
	IL_2c68:  beq IL_2c72

	IL_2c6d:  br IL_2cd4

	IL_2c72:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok::'.ctor'()
	IL_2c77:  stloc 91

	IL_2c7b:  nop 
	IL_2c7c:  nop 
	IL_2c7d:  ldloc 91

	IL_2c81:  nop 
	IL_2c82:  nop 
	IL_2c83:  ldarg 1

	IL_2c87:  nop 
	IL_2c88:  nop 
	IL_2c89:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c8e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c93:  ldloc 91

	IL_2c97:  nop 
	IL_2c98:  nop 
	IL_2c99:  ldarg 1

	IL_2c9d:  nop 
	IL_2c9e:  nop 
	IL_2c9f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ca4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ca9:  ldloc 91

	IL_2cad:  nop 
	IL_2cae:  nop 
	IL_2caf:  ldtoken [mscorlib]System.Decimal
	IL_2cb4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2cb9:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2cbe:  ldloc 91

	IL_2cc2:  nop 
	IL_2cc3:  nop 
	IL_2cc4:  starg 1

	IL_2cc8:  nop 
	IL_2cc9:  nop 
	IL_2cca:  br IL_5201

	IL_2ccf:  br IL_2cd9

	IL_2cd4:  br IL_2cd9

	IL_2cd9:  ldarg 1

	IL_2cdd:  nop 
	IL_2cde:  nop 
	IL_2cdf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ce4:  ldstr "integer"
	IL_2ce9:  call int32 string::Compare(string, string)
	IL_2cee:  stloc 0

	IL_2cf2:  nop 
	IL_2cf3:  nop 
	IL_2cf4:  ldloc 0

	IL_2cf8:  nop 
	IL_2cf9:  nop 
	IL_2cfa:  ldc.i4 0
	IL_2cff:  beq IL_2d09

	IL_2d04:  br IL_2d6b

	IL_2d09:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok::'.ctor'()
	IL_2d0e:  stloc 92

	IL_2d12:  nop 
	IL_2d13:  nop 
	IL_2d14:  ldloc 92

	IL_2d18:  nop 
	IL_2d19:  nop 
	IL_2d1a:  ldarg 1

	IL_2d1e:  nop 
	IL_2d1f:  nop 
	IL_2d20:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d25:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d2a:  ldloc 92

	IL_2d2e:  nop 
	IL_2d2f:  nop 
	IL_2d30:  ldarg 1

	IL_2d34:  nop 
	IL_2d35:  nop 
	IL_2d36:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d3b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d40:  ldloc 92

	IL_2d44:  nop 
	IL_2d45:  nop 
	IL_2d46:  ldtoken [mscorlib]System.Int32
	IL_2d4b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2d50:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2d55:  ldloc 92

	IL_2d59:  nop 
	IL_2d5a:  nop 
	IL_2d5b:  starg 1

	IL_2d5f:  nop 
	IL_2d60:  nop 
	IL_2d61:  br IL_5201

	IL_2d66:  br IL_2d70

	IL_2d6b:  br IL_2d70

	IL_2d70:  ldarg 1

	IL_2d74:  nop 
	IL_2d75:  nop 
	IL_2d76:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d7b:  ldstr "intptr"
	IL_2d80:  call int32 string::Compare(string, string)
	IL_2d85:  stloc 0

	IL_2d89:  nop 
	IL_2d8a:  nop 
	IL_2d8b:  ldloc 0

	IL_2d8f:  nop 
	IL_2d90:  nop 
	IL_2d91:  ldc.i4 0
	IL_2d96:  beq IL_2da0

	IL_2d9b:  br IL_2e02

	IL_2da0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok::'.ctor'()
	IL_2da5:  stloc 93

	IL_2da9:  nop 
	IL_2daa:  nop 
	IL_2dab:  ldloc 93

	IL_2daf:  nop 
	IL_2db0:  nop 
	IL_2db1:  ldarg 1

	IL_2db5:  nop 
	IL_2db6:  nop 
	IL_2db7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2dbc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2dc1:  ldloc 93

	IL_2dc5:  nop 
	IL_2dc6:  nop 
	IL_2dc7:  ldarg 1

	IL_2dcb:  nop 
	IL_2dcc:  nop 
	IL_2dcd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2dd2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2dd7:  ldloc 93

	IL_2ddb:  nop 
	IL_2ddc:  nop 
	IL_2ddd:  ldtoken [mscorlib]System.IntPtr
	IL_2de2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2de7:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2dec:  ldloc 93

	IL_2df0:  nop 
	IL_2df1:  nop 
	IL_2df2:  starg 1

	IL_2df6:  nop 
	IL_2df7:  nop 
	IL_2df8:  br IL_5201

	IL_2dfd:  br IL_2e07

	IL_2e02:  br IL_2e07

	IL_2e07:  ldarg 1

	IL_2e0b:  nop 
	IL_2e0c:  nop 
	IL_2e0d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e12:  ldstr "uinteger"
	IL_2e17:  call int32 string::Compare(string, string)
	IL_2e1c:  stloc 0

	IL_2e20:  nop 
	IL_2e21:  nop 
	IL_2e22:  ldloc 0

	IL_2e26:  nop 
	IL_2e27:  nop 
	IL_2e28:  ldc.i4 0
	IL_2e2d:  beq IL_2e37

	IL_2e32:  br IL_2e99

	IL_2e37:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok::'.ctor'()
	IL_2e3c:  stloc 94

	IL_2e40:  nop 
	IL_2e41:  nop 
	IL_2e42:  ldloc 94

	IL_2e46:  nop 
	IL_2e47:  nop 
	IL_2e48:  ldarg 1

	IL_2e4c:  nop 
	IL_2e4d:  nop 
	IL_2e4e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e53:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e58:  ldloc 94

	IL_2e5c:  nop 
	IL_2e5d:  nop 
	IL_2e5e:  ldarg 1

	IL_2e62:  nop 
	IL_2e63:  nop 
	IL_2e64:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e69:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e6e:  ldloc 94

	IL_2e72:  nop 
	IL_2e73:  nop 
	IL_2e74:  ldtoken [mscorlib]System.UInt32
	IL_2e79:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2e7e:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2e83:  ldloc 94

	IL_2e87:  nop 
	IL_2e88:  nop 
	IL_2e89:  starg 1

	IL_2e8d:  nop 
	IL_2e8e:  nop 
	IL_2e8f:  br IL_5201

	IL_2e94:  br IL_2e9e

	IL_2e99:  br IL_2e9e

	IL_2e9e:  ldarg 1

	IL_2ea2:  nop 
	IL_2ea3:  nop 
	IL_2ea4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ea9:  ldstr "double"
	IL_2eae:  call int32 string::Compare(string, string)
	IL_2eb3:  stloc 0

	IL_2eb7:  nop 
	IL_2eb8:  nop 
	IL_2eb9:  ldloc 0

	IL_2ebd:  nop 
	IL_2ebe:  nop 
	IL_2ebf:  ldc.i4 0
	IL_2ec4:  beq IL_2ece

	IL_2ec9:  br IL_2f30

	IL_2ece:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok::'.ctor'()
	IL_2ed3:  stloc 95

	IL_2ed7:  nop 
	IL_2ed8:  nop 
	IL_2ed9:  ldloc 95

	IL_2edd:  nop 
	IL_2ede:  nop 
	IL_2edf:  ldarg 1

	IL_2ee3:  nop 
	IL_2ee4:  nop 
	IL_2ee5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2eea:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2eef:  ldloc 95

	IL_2ef3:  nop 
	IL_2ef4:  nop 
	IL_2ef5:  ldarg 1

	IL_2ef9:  nop 
	IL_2efa:  nop 
	IL_2efb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f00:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f05:  ldloc 95

	IL_2f09:  nop 
	IL_2f0a:  nop 
	IL_2f0b:  ldtoken [mscorlib]System.Double
	IL_2f10:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2f15:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2f1a:  ldloc 95

	IL_2f1e:  nop 
	IL_2f1f:  nop 
	IL_2f20:  starg 1

	IL_2f24:  nop 
	IL_2f25:  nop 
	IL_2f26:  br IL_5201

	IL_2f2b:  br IL_2f35

	IL_2f30:  br IL_2f35

	IL_2f35:  ldarg 1

	IL_2f39:  nop 
	IL_2f3a:  nop 
	IL_2f3b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f40:  ldstr "boolean"
	IL_2f45:  call int32 string::Compare(string, string)
	IL_2f4a:  stloc 0

	IL_2f4e:  nop 
	IL_2f4f:  nop 
	IL_2f50:  ldloc 0

	IL_2f54:  nop 
	IL_2f55:  nop 
	IL_2f56:  ldc.i4 0
	IL_2f5b:  beq IL_2f65

	IL_2f60:  br IL_2fc7

	IL_2f65:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok::'.ctor'()
	IL_2f6a:  stloc 96

	IL_2f6e:  nop 
	IL_2f6f:  nop 
	IL_2f70:  ldloc 96

	IL_2f74:  nop 
	IL_2f75:  nop 
	IL_2f76:  ldarg 1

	IL_2f7a:  nop 
	IL_2f7b:  nop 
	IL_2f7c:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f81:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f86:  ldloc 96

	IL_2f8a:  nop 
	IL_2f8b:  nop 
	IL_2f8c:  ldarg 1

	IL_2f90:  nop 
	IL_2f91:  nop 
	IL_2f92:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f97:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f9c:  ldloc 96

	IL_2fa0:  nop 
	IL_2fa1:  nop 
	IL_2fa2:  ldtoken [mscorlib]System.Boolean
	IL_2fa7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2fac:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2fb1:  ldloc 96

	IL_2fb5:  nop 
	IL_2fb6:  nop 
	IL_2fb7:  starg 1

	IL_2fbb:  nop 
	IL_2fbc:  nop 
	IL_2fbd:  br IL_5201

	IL_2fc2:  br IL_2fcc

	IL_2fc7:  br IL_2fcc

	IL_2fcc:  ldarg 1

	IL_2fd0:  nop 
	IL_2fd1:  nop 
	IL_2fd2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fd7:  ldstr "char"
	IL_2fdc:  call int32 string::Compare(string, string)
	IL_2fe1:  stloc 0

	IL_2fe5:  nop 
	IL_2fe6:  nop 
	IL_2fe7:  ldloc 0

	IL_2feb:  nop 
	IL_2fec:  nop 
	IL_2fed:  ldc.i4 0
	IL_2ff2:  beq IL_2ffc

	IL_2ff7:  br IL_305e

	IL_2ffc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok::'.ctor'()
	IL_3001:  stloc 97

	IL_3005:  nop 
	IL_3006:  nop 
	IL_3007:  ldloc 97

	IL_300b:  nop 
	IL_300c:  nop 
	IL_300d:  ldarg 1

	IL_3011:  nop 
	IL_3012:  nop 
	IL_3013:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3018:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_301d:  ldloc 97

	IL_3021:  nop 
	IL_3022:  nop 
	IL_3023:  ldarg 1

	IL_3027:  nop 
	IL_3028:  nop 
	IL_3029:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_302e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3033:  ldloc 97

	IL_3037:  nop 
	IL_3038:  nop 
	IL_3039:  ldtoken [mscorlib]System.Char
	IL_303e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3043:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3048:  ldloc 97

	IL_304c:  nop 
	IL_304d:  nop 
	IL_304e:  starg 1

	IL_3052:  nop 
	IL_3053:  nop 
	IL_3054:  br IL_5201

	IL_3059:  br IL_3063

	IL_305e:  br IL_3063

	IL_3063:  ldarg 1

	IL_3067:  nop 
	IL_3068:  nop 
	IL_3069:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_306e:  ldstr "single"
	IL_3073:  call int32 string::Compare(string, string)
	IL_3078:  stloc 0

	IL_307c:  nop 
	IL_307d:  nop 
	IL_307e:  ldloc 0

	IL_3082:  nop 
	IL_3083:  nop 
	IL_3084:  ldc.i4 0
	IL_3089:  beq IL_3093

	IL_308e:  br IL_30f5

	IL_3093:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok::'.ctor'()
	IL_3098:  stloc 98

	IL_309c:  nop 
	IL_309d:  nop 
	IL_309e:  ldloc 98

	IL_30a2:  nop 
	IL_30a3:  nop 
	IL_30a4:  ldarg 1

	IL_30a8:  nop 
	IL_30a9:  nop 
	IL_30aa:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30af:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30b4:  ldloc 98

	IL_30b8:  nop 
	IL_30b9:  nop 
	IL_30ba:  ldarg 1

	IL_30be:  nop 
	IL_30bf:  nop 
	IL_30c0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30c5:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30ca:  ldloc 98

	IL_30ce:  nop 
	IL_30cf:  nop 
	IL_30d0:  ldtoken [mscorlib]System.Single
	IL_30d5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_30da:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_30df:  ldloc 98

	IL_30e3:  nop 
	IL_30e4:  nop 
	IL_30e5:  starg 1

	IL_30e9:  nop 
	IL_30ea:  nop 
	IL_30eb:  br IL_5201

	IL_30f0:  br IL_30fa

	IL_30f5:  br IL_30fa

	IL_30fa:  ldarg 1

	IL_30fe:  nop 
	IL_30ff:  nop 
	IL_3100:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3105:  ldstr "sbyte"
	IL_310a:  call int32 string::Compare(string, string)
	IL_310f:  stloc 0

	IL_3113:  nop 
	IL_3114:  nop 
	IL_3115:  ldloc 0

	IL_3119:  nop 
	IL_311a:  nop 
	IL_311b:  ldc.i4 0
	IL_3120:  beq IL_312a

	IL_3125:  br IL_318c

	IL_312a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok::'.ctor'()
	IL_312f:  stloc 99

	IL_3133:  nop 
	IL_3134:  nop 
	IL_3135:  ldloc 99

	IL_3139:  nop 
	IL_313a:  nop 
	IL_313b:  ldarg 1

	IL_313f:  nop 
	IL_3140:  nop 
	IL_3141:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3146:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_314b:  ldloc 99

	IL_314f:  nop 
	IL_3150:  nop 
	IL_3151:  ldarg 1

	IL_3155:  nop 
	IL_3156:  nop 
	IL_3157:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_315c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3161:  ldloc 99

	IL_3165:  nop 
	IL_3166:  nop 
	IL_3167:  ldtoken [mscorlib]System.SByte
	IL_316c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3171:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3176:  ldloc 99

	IL_317a:  nop 
	IL_317b:  nop 
	IL_317c:  starg 1

	IL_3180:  nop 
	IL_3181:  nop 
	IL_3182:  br IL_5201

	IL_3187:  br IL_3191

	IL_318c:  br IL_3191

	IL_3191:  ldarg 1

	IL_3195:  nop 
	IL_3196:  nop 
	IL_3197:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_319c:  ldstr "byte"
	IL_31a1:  call int32 string::Compare(string, string)
	IL_31a6:  stloc 0

	IL_31aa:  nop 
	IL_31ab:  nop 
	IL_31ac:  ldloc 0

	IL_31b0:  nop 
	IL_31b1:  nop 
	IL_31b2:  ldc.i4 0
	IL_31b7:  beq IL_31c1

	IL_31bc:  br IL_3223

	IL_31c1:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok::'.ctor'()
	IL_31c6:  stloc 100

	IL_31ca:  nop 
	IL_31cb:  nop 
	IL_31cc:  ldloc 100

	IL_31d0:  nop 
	IL_31d1:  nop 
	IL_31d2:  ldarg 1

	IL_31d6:  nop 
	IL_31d7:  nop 
	IL_31d8:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_31dd:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_31e2:  ldloc 100

	IL_31e6:  nop 
	IL_31e7:  nop 
	IL_31e8:  ldarg 1

	IL_31ec:  nop 
	IL_31ed:  nop 
	IL_31ee:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31f3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31f8:  ldloc 100

	IL_31fc:  nop 
	IL_31fd:  nop 
	IL_31fe:  ldtoken [mscorlib]System.Byte
	IL_3203:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3208:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_320d:  ldloc 100

	IL_3211:  nop 
	IL_3212:  nop 
	IL_3213:  starg 1

	IL_3217:  nop 
	IL_3218:  nop 
	IL_3219:  br IL_5201

	IL_321e:  br IL_3228

	IL_3223:  br IL_3228

	IL_3228:  ldarg 1

	IL_322c:  nop 
	IL_322d:  nop 
	IL_322e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3233:  ldstr "short"
	IL_3238:  call int32 string::Compare(string, string)
	IL_323d:  stloc 0

	IL_3241:  nop 
	IL_3242:  nop 
	IL_3243:  ldloc 0

	IL_3247:  nop 
	IL_3248:  nop 
	IL_3249:  ldc.i4 0
	IL_324e:  beq IL_3258

	IL_3253:  br IL_32ba

	IL_3258:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok::'.ctor'()
	IL_325d:  stloc 101

	IL_3261:  nop 
	IL_3262:  nop 
	IL_3263:  ldloc 101

	IL_3267:  nop 
	IL_3268:  nop 
	IL_3269:  ldarg 1

	IL_326d:  nop 
	IL_326e:  nop 
	IL_326f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3274:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3279:  ldloc 101

	IL_327d:  nop 
	IL_327e:  nop 
	IL_327f:  ldarg 1

	IL_3283:  nop 
	IL_3284:  nop 
	IL_3285:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_328a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_328f:  ldloc 101

	IL_3293:  nop 
	IL_3294:  nop 
	IL_3295:  ldtoken [mscorlib]System.Int16
	IL_329a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_329f:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_32a4:  ldloc 101

	IL_32a8:  nop 
	IL_32a9:  nop 
	IL_32aa:  starg 1

	IL_32ae:  nop 
	IL_32af:  nop 
	IL_32b0:  br IL_5201

	IL_32b5:  br IL_32bf

	IL_32ba:  br IL_32bf

	IL_32bf:  ldarg 1

	IL_32c3:  nop 
	IL_32c4:  nop 
	IL_32c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_32ca:  ldstr "ushort"
	IL_32cf:  call int32 string::Compare(string, string)
	IL_32d4:  stloc 0

	IL_32d8:  nop 
	IL_32d9:  nop 
	IL_32da:  ldloc 0

	IL_32de:  nop 
	IL_32df:  nop 
	IL_32e0:  ldc.i4 0
	IL_32e5:  beq IL_32ef

	IL_32ea:  br IL_3351

	IL_32ef:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok::'.ctor'()
	IL_32f4:  stloc 102

	IL_32f8:  nop 
	IL_32f9:  nop 
	IL_32fa:  ldloc 102

	IL_32fe:  nop 
	IL_32ff:  nop 
	IL_3300:  ldarg 1

	IL_3304:  nop 
	IL_3305:  nop 
	IL_3306:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_330b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3310:  ldloc 102

	IL_3314:  nop 
	IL_3315:  nop 
	IL_3316:  ldarg 1

	IL_331a:  nop 
	IL_331b:  nop 
	IL_331c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3321:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3326:  ldloc 102

	IL_332a:  nop 
	IL_332b:  nop 
	IL_332c:  ldtoken [mscorlib]System.UInt16
	IL_3331:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3336:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_333b:  ldloc 102

	IL_333f:  nop 
	IL_3340:  nop 
	IL_3341:  starg 1

	IL_3345:  nop 
	IL_3346:  nop 
	IL_3347:  br IL_5201

	IL_334c:  br IL_3356

	IL_3351:  br IL_3356

	IL_3356:  ldarg 1

	IL_335a:  nop 
	IL_335b:  nop 
	IL_335c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3361:  ldstr "long"
	IL_3366:  call int32 string::Compare(string, string)
	IL_336b:  stloc 0

	IL_336f:  nop 
	IL_3370:  nop 
	IL_3371:  ldloc 0

	IL_3375:  nop 
	IL_3376:  nop 
	IL_3377:  ldc.i4 0
	IL_337c:  beq IL_3386

	IL_3381:  br IL_33e8

	IL_3386:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok::'.ctor'()
	IL_338b:  stloc 103

	IL_338f:  nop 
	IL_3390:  nop 
	IL_3391:  ldloc 103

	IL_3395:  nop 
	IL_3396:  nop 
	IL_3397:  ldarg 1

	IL_339b:  nop 
	IL_339c:  nop 
	IL_339d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_33a2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_33a7:  ldloc 103

	IL_33ab:  nop 
	IL_33ac:  nop 
	IL_33ad:  ldarg 1

	IL_33b1:  nop 
	IL_33b2:  nop 
	IL_33b3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33b8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33bd:  ldloc 103

	IL_33c1:  nop 
	IL_33c2:  nop 
	IL_33c3:  ldtoken [mscorlib]System.Int64
	IL_33c8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_33cd:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_33d2:  ldloc 103

	IL_33d6:  nop 
	IL_33d7:  nop 
	IL_33d8:  starg 1

	IL_33dc:  nop 
	IL_33dd:  nop 
	IL_33de:  br IL_5201

	IL_33e3:  br IL_33ed

	IL_33e8:  br IL_33ed

	IL_33ed:  ldarg 1

	IL_33f1:  nop 
	IL_33f2:  nop 
	IL_33f3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33f8:  ldstr "ulong"
	IL_33fd:  call int32 string::Compare(string, string)
	IL_3402:  stloc 0

	IL_3406:  nop 
	IL_3407:  nop 
	IL_3408:  ldloc 0

	IL_340c:  nop 
	IL_340d:  nop 
	IL_340e:  ldc.i4 0
	IL_3413:  beq IL_341d

	IL_3418:  br IL_347f

	IL_341d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok::'.ctor'()
	IL_3422:  stloc 104

	IL_3426:  nop 
	IL_3427:  nop 
	IL_3428:  ldloc 104

	IL_342c:  nop 
	IL_342d:  nop 
	IL_342e:  ldarg 1

	IL_3432:  nop 
	IL_3433:  nop 
	IL_3434:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3439:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_343e:  ldloc 104

	IL_3442:  nop 
	IL_3443:  nop 
	IL_3444:  ldarg 1

	IL_3448:  nop 
	IL_3449:  nop 
	IL_344a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_344f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3454:  ldloc 104

	IL_3458:  nop 
	IL_3459:  nop 
	IL_345a:  ldtoken [mscorlib]System.UInt64
	IL_345f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3464:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3469:  ldloc 104

	IL_346d:  nop 
	IL_346e:  nop 
	IL_346f:  starg 1

	IL_3473:  nop 
	IL_3474:  nop 
	IL_3475:  br IL_5201

	IL_347a:  br IL_3484

	IL_347f:  br IL_3484

	IL_3484:  ldarg 1

	IL_3488:  nop 
	IL_3489:  nop 
	IL_348a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_348f:  ldstr "object"
	IL_3494:  call int32 string::Compare(string, string)
	IL_3499:  stloc 0

	IL_349d:  nop 
	IL_349e:  nop 
	IL_349f:  ldloc 0

	IL_34a3:  nop 
	IL_34a4:  nop 
	IL_34a5:  ldc.i4 0
	IL_34aa:  beq IL_34b4

	IL_34af:  br IL_3516

	IL_34b4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_34b9:  stloc 105

	IL_34bd:  nop 
	IL_34be:  nop 
	IL_34bf:  ldloc 105

	IL_34c3:  nop 
	IL_34c4:  nop 
	IL_34c5:  ldarg 1

	IL_34c9:  nop 
	IL_34ca:  nop 
	IL_34cb:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_34d0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_34d5:  ldloc 105

	IL_34d9:  nop 
	IL_34da:  nop 
	IL_34db:  ldarg 1

	IL_34df:  nop 
	IL_34e0:  nop 
	IL_34e1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_34e6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_34eb:  ldloc 105

	IL_34ef:  nop 
	IL_34f0:  nop 
	IL_34f1:  ldtoken [mscorlib]System.Object
	IL_34f6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_34fb:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3500:  ldloc 105

	IL_3504:  nop 
	IL_3505:  nop 
	IL_3506:  starg 1

	IL_350a:  nop 
	IL_350b:  nop 
	IL_350c:  br IL_5201

	IL_3511:  br IL_351b

	IL_3516:  br IL_351b

	IL_351b:  ldarg 1

	IL_351f:  nop 
	IL_3520:  nop 
	IL_3521:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3526:  ldstr "^//(.)*$"
	IL_352b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3530:  stloc 1

	IL_3534:  nop 
	IL_3535:  nop 
	IL_3536:  ldloc 1

	IL_353a:  nop 
	IL_353b:  nop 
	IL_353c:  ldc.i4 1
	IL_3541:  beq IL_354b

	IL_3546:  br IL_35a2

	IL_354b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok::'.ctor'()
	IL_3550:  stloc 106

	IL_3554:  nop 
	IL_3555:  nop 
	IL_3556:  ldloc 106

	IL_355a:  nop 
	IL_355b:  nop 
	IL_355c:  ldarg 1

	IL_3560:  nop 
	IL_3561:  nop 
	IL_3562:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3567:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_356c:  ldloc 106

	IL_3570:  nop 
	IL_3571:  nop 
	IL_3572:  ldarg 1

	IL_3576:  nop 
	IL_3577:  nop 
	IL_3578:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_357d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3582:  ldloc 106

	IL_3586:  nop 
	IL_3587:  nop 
	IL_3588:  starg 1

	IL_358c:  nop 
	IL_358d:  nop 
	IL_358e:  ldc.i4 1
	IL_3593:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_3598:  br IL_5201

	IL_359d:  br IL_35a7

	IL_35a2:  br IL_35a7

	IL_35a7:  ldarg 1

	IL_35ab:  nop 
	IL_35ac:  nop 
	IL_35ad:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_35b2:  ldstr "null"
	IL_35b7:  call int32 string::Compare(string, string)
	IL_35bc:  stloc 0

	IL_35c0:  nop 
	IL_35c1:  nop 
	IL_35c2:  ldloc 0

	IL_35c6:  nop 
	IL_35c7:  nop 
	IL_35c8:  ldc.i4 0
	IL_35cd:  beq IL_35d7

	IL_35d2:  br IL_3624

	IL_35d7:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::'.ctor'()
	IL_35dc:  stloc 107

	IL_35e0:  nop 
	IL_35e1:  nop 
	IL_35e2:  ldloc 107

	IL_35e6:  nop 
	IL_35e7:  nop 
	IL_35e8:  ldarg 1

	IL_35ec:  nop 
	IL_35ed:  nop 
	IL_35ee:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_35f3:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_35f8:  ldloc 107

	IL_35fc:  nop 
	IL_35fd:  nop 
	IL_35fe:  ldarg 1

	IL_3602:  nop 
	IL_3603:  nop 
	IL_3604:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3609:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_360e:  ldloc 107

	IL_3612:  nop 
	IL_3613:  nop 
	IL_3614:  starg 1

	IL_3618:  nop 
	IL_3619:  nop 
	IL_361a:  br IL_5201

	IL_361f:  br IL_3629

	IL_3624:  br IL_3629

	IL_3629:  ldarg 1

	IL_362d:  nop 
	IL_362e:  nop 
	IL_362f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3634:  ldstr "true"
	IL_3639:  call int32 string::Compare(string, string)
	IL_363e:  stloc 0

	IL_3642:  nop 
	IL_3643:  nop 
	IL_3644:  ldloc 0

	IL_3648:  nop 
	IL_3649:  nop 
	IL_364a:  ldc.i4 0
	IL_364f:  beq IL_3659

	IL_3654:  br IL_3669

	IL_3659:  ldc.i4 1
	IL_365e:  stloc 1

	IL_3662:  nop 
	IL_3663:  nop 
	IL_3664:  br IL_366e

	IL_3669:  br IL_366e

	IL_366e:  ldloc 1

	IL_3672:  nop 
	IL_3673:  nop 
	IL_3674:  stloc 4

	IL_3678:  nop 
	IL_3679:  nop 
	IL_367a:  ldarg 1

	IL_367e:  nop 
	IL_367f:  nop 
	IL_3680:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3685:  ldstr "false"
	IL_368a:  call int32 string::Compare(string, string)
	IL_368f:  stloc 0

	IL_3693:  nop 
	IL_3694:  nop 
	IL_3695:  ldloc 0

	IL_3699:  nop 
	IL_369a:  nop 
	IL_369b:  ldc.i4 0
	IL_36a0:  beq IL_36aa

	IL_36a5:  br IL_36ba

	IL_36aa:  ldc.i4 1
	IL_36af:  stloc 1

	IL_36b3:  nop 
	IL_36b4:  nop 
	IL_36b5:  br IL_36bf

	IL_36ba:  br IL_36bf

	IL_36bf:  ldloc 4

	IL_36c3:  nop 
	IL_36c4:  nop 
	IL_36c5:  ldloc 1

	IL_36c9:  nop 
	IL_36ca:  nop 
	IL_36cb:  or 
	IL_36cc:  stloc 4

	IL_36d0:  nop 
	IL_36d1:  nop 
	IL_36d2:  ldloc 1

	IL_36d6:  nop 
	IL_36d7:  nop 
	IL_36d8:  ldc.i4 1
	IL_36dd:  beq IL_36e7

	IL_36e2:  br IL_37c8

	IL_36e7:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::'.ctor'()
	IL_36ec:  stloc 108

	IL_36f0:  nop 
	IL_36f1:  nop 
	IL_36f2:  ldloc 108

	IL_36f6:  nop 
	IL_36f7:  nop 
	IL_36f8:  ldarg 1

	IL_36fc:  nop 
	IL_36fd:  nop 
	IL_36fe:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3703:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3708:  ldloc 108

	IL_370c:  nop 
	IL_370d:  nop 
	IL_370e:  ldarg 1

	IL_3712:  nop 
	IL_3713:  nop 
	IL_3714:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3719:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_371e:  ldarg 1

	IL_3722:  nop 
	IL_3723:  nop 
	IL_3724:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3729:  ldstr "true"
	IL_372e:  call int32 string::Compare(string, string)
	IL_3733:  stloc 0

	IL_3737:  nop 
	IL_3738:  nop 
	IL_3739:  ldloc 0

	IL_373d:  nop 
	IL_373e:  nop 
	IL_373f:  ldc.i4 0
	IL_3744:  beq IL_374e

	IL_3749:  br IL_3763

	IL_374e:  ldloc 108

	IL_3752:  nop 
	IL_3753:  nop 
	IL_3754:  ldc.i4 1
	IL_3759:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_375e:  br IL_3768

	IL_3763:  br IL_3768

	IL_3768:  ldarg 1

	IL_376c:  nop 
	IL_376d:  nop 
	IL_376e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3773:  ldstr "false"
	IL_3778:  call int32 string::Compare(string, string)
	IL_377d:  stloc 0

	IL_3781:  nop 
	IL_3782:  nop 
	IL_3783:  ldloc 0

	IL_3787:  nop 
	IL_3788:  nop 
	IL_3789:  ldc.i4 0
	IL_378e:  beq IL_3798

	IL_3793:  br IL_37ad

	IL_3798:  ldloc 108

	IL_379c:  nop 
	IL_379d:  nop 
	IL_379e:  ldc.i4 0
	IL_37a3:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_37a8:  br IL_37b2

	IL_37ad:  br IL_37b2

	IL_37b2:  ldloc 108

	IL_37b6:  nop 
	IL_37b7:  nop 
	IL_37b8:  starg 1

	IL_37bc:  nop 
	IL_37bd:  nop 
	IL_37be:  br IL_5201

	IL_37c3:  br IL_37cd

	IL_37c8:  br IL_37cd

	IL_37cd:  ldarg 1

	IL_37d1:  nop 
	IL_37d2:  nop 
	IL_37d3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37d8:  ldstr "^'(.)*'$"
	IL_37dd:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_37e2:  stloc 1

	IL_37e6:  nop 
	IL_37e7:  nop 
	IL_37e8:  ldloc 1

	IL_37ec:  nop 
	IL_37ed:  nop 
	IL_37ee:  ldc.i4 1
	IL_37f3:  beq IL_37fd

	IL_37f8:  br IL_38b4

	IL_37fd:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::'.ctor'()
	IL_3802:  stloc 109

	IL_3806:  nop 
	IL_3807:  nop 
	IL_3808:  ldloc 109

	IL_380c:  nop 
	IL_380d:  nop 
	IL_380e:  ldarg 1

	IL_3812:  nop 
	IL_3813:  nop 
	IL_3814:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3819:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_381e:  ldarg 1

	IL_3822:  nop 
	IL_3823:  nop 
	IL_3824:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3829:  stloc 2

	IL_382d:  nop 
	IL_382e:  nop 
	IL_382f:  ldc.i4 1
	IL_3834:  conv.u 
	IL_3835:  newarr [mscorlib]System.Char
	IL_383a:  stloc 3

	IL_383e:  nop 
	IL_383f:  nop 
	IL_3840:  ldloc 3

	IL_3844:  nop 
	IL_3845:  nop 
	IL_3846:  ldc.i4 0
	IL_384b:  conv.u 
	IL_384c:  ldstr "'"
	IL_3851:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3856:  stelem [mscorlib]System.Char
	IL_385b:  ldloc 2

	IL_385f:  nop 
	IL_3860:  nop 
	IL_3861:  ldloc 3

	IL_3865:  nop 
	IL_3866:  nop 
	IL_3867:  callvirt instance string string::Trim(char[])
	IL_386c:  stloc 2

	IL_3870:  nop 
	IL_3871:  nop 
	IL_3872:  ldloc 109

	IL_3876:  nop 
	IL_3877:  nop 
	IL_3878:  ldloc 2

	IL_387c:  nop 
	IL_387d:  nop 
	IL_387e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3883:  ldloc 109

	IL_3887:  nop 
	IL_3888:  nop 
	IL_3889:  ldloc 109

	IL_388d:  nop 
	IL_388e:  nop 
	IL_388f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3894:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3899:  stfld char [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_389e:  ldloc 109

	IL_38a2:  nop 
	IL_38a3:  nop 
	IL_38a4:  starg 1

	IL_38a8:  nop 
	IL_38a9:  nop 
	IL_38aa:  br IL_5201

	IL_38af:  br IL_38b9

	IL_38b4:  br IL_38b9

	IL_38b9:  ldstr "^"
	IL_38be:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_38c3:  ldstr "(.)*"
	IL_38c8:  call string string::Concat(string, string, string)
	IL_38cd:  stloc 2

	IL_38d1:  nop 
	IL_38d2:  nop 
	IL_38d3:  ldloc 2

	IL_38d7:  nop 
	IL_38d8:  nop 
	IL_38d9:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_38de:  ldstr "$"
	IL_38e3:  call string string::Concat(string, string, string)
	IL_38e8:  stloc 2

	IL_38ec:  nop 
	IL_38ed:  nop 
	IL_38ee:  ldarg 1

	IL_38f2:  nop 
	IL_38f3:  nop 
	IL_38f4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_38f9:  ldloc 2

	IL_38fd:  nop 
	IL_38fe:  nop 
	IL_38ff:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3904:  stloc 1

	IL_3908:  nop 
	IL_3909:  nop 
	IL_390a:  ldloc 1

	IL_390e:  nop 
	IL_390f:  nop 
	IL_3910:  ldc.i4 1
	IL_3915:  beq IL_391f

	IL_391a:  br IL_39bb

	IL_391f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::'.ctor'()
	IL_3924:  stloc 110

	IL_3928:  nop 
	IL_3929:  nop 
	IL_392a:  ldloc 110

	IL_392e:  nop 
	IL_392f:  nop 
	IL_3930:  ldarg 1

	IL_3934:  nop 
	IL_3935:  nop 
	IL_3936:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_393b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3940:  ldarg 1

	IL_3944:  nop 
	IL_3945:  nop 
	IL_3946:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_394b:  stloc 2

	IL_394f:  nop 
	IL_3950:  nop 
	IL_3951:  ldc.i4 1
	IL_3956:  conv.u 
	IL_3957:  newarr [mscorlib]System.Char
	IL_395c:  stloc 3

	IL_3960:  nop 
	IL_3961:  nop 
	IL_3962:  ldloc 3

	IL_3966:  nop 
	IL_3967:  nop 
	IL_3968:  ldc.i4 0
	IL_396d:  conv.u 
	IL_396e:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_3973:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3978:  stelem [mscorlib]System.Char
	IL_397d:  ldloc 2

	IL_3981:  nop 
	IL_3982:  nop 
	IL_3983:  ldloc 3

	IL_3987:  nop 
	IL_3988:  nop 
	IL_3989:  callvirt instance string string::Trim(char[])
	IL_398e:  stloc 2

	IL_3992:  nop 
	IL_3993:  nop 
	IL_3994:  ldloc 110

	IL_3998:  nop 
	IL_3999:  nop 
	IL_399a:  ldloc 2

	IL_399e:  nop 
	IL_399f:  nop 
	IL_39a0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39a5:  ldloc 110

	IL_39a9:  nop 
	IL_39aa:  nop 
	IL_39ab:  starg 1

	IL_39af:  nop 
	IL_39b0:  nop 
	IL_39b1:  br IL_5201

	IL_39b6:  br IL_39c0

	IL_39bb:  br IL_39c0

	IL_39c0:  ldarg 1

	IL_39c4:  nop 
	IL_39c5:  nop 
	IL_39c6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39cb:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_39d0:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_39d5:  stloc 1

	IL_39d9:  nop 
	IL_39da:  nop 
	IL_39db:  ldloc 1

	IL_39df:  nop 
	IL_39e0:  nop 
	IL_39e1:  stloc 4

	IL_39e5:  nop 
	IL_39e6:  nop 
	IL_39e7:  ldarg 1

	IL_39eb:  nop 
	IL_39ec:  nop 
	IL_39ed:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39f2:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_39f7:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_39fc:  stloc 1

	IL_3a00:  nop 
	IL_3a01:  nop 
	IL_3a02:  ldloc 4

	IL_3a06:  nop 
	IL_3a07:  nop 
	IL_3a08:  ldloc 1

	IL_3a0c:  nop 
	IL_3a0d:  nop 
	IL_3a0e:  or 
	IL_3a0f:  stloc 4

	IL_3a13:  nop 
	IL_3a14:  nop 
	IL_3a15:  ldarg 1

	IL_3a19:  nop 
	IL_3a1a:  nop 
	IL_3a1b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a20:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3a25:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3a2a:  stloc 1

	IL_3a2e:  nop 
	IL_3a2f:  nop 
	IL_3a30:  ldloc 4

	IL_3a34:  nop 
	IL_3a35:  nop 
	IL_3a36:  ldloc 1

	IL_3a3a:  nop 
	IL_3a3b:  nop 
	IL_3a3c:  or 
	IL_3a3d:  stloc 4

	IL_3a41:  nop 
	IL_3a42:  nop 
	IL_3a43:  ldarg 1

	IL_3a47:  nop 
	IL_3a48:  nop 
	IL_3a49:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a4e:  stloc 2

	IL_3a52:  nop 
	IL_3a53:  nop 
	IL_3a54:  ldloc 2

	IL_3a58:  nop 
	IL_3a59:  nop 
	IL_3a5a:  ldstr "d"
	IL_3a5f:  callvirt instance bool string::EndsWith(string)
	IL_3a64:  stloc 1

	IL_3a68:  nop 
	IL_3a69:  nop 
	IL_3a6a:  ldloc 4

	IL_3a6e:  nop 
	IL_3a6f:  nop 
	IL_3a70:  ldloc 1

	IL_3a74:  nop 
	IL_3a75:  nop 
	IL_3a76:  and 
	IL_3a77:  stloc 4

	IL_3a7b:  nop 
	IL_3a7c:  nop 
	IL_3a7d:  ldloc 4

	IL_3a81:  nop 
	IL_3a82:  nop 
	IL_3a83:  ldc.i4 1
	IL_3a88:  beq IL_3a92

	IL_3a8d:  br IL_3b49

	IL_3a92:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3a97:  stloc 111

	IL_3a9b:  nop 
	IL_3a9c:  nop 
	IL_3a9d:  ldloc 111

	IL_3aa1:  nop 
	IL_3aa2:  nop 
	IL_3aa3:  ldarg 1

	IL_3aa7:  nop 
	IL_3aa8:  nop 
	IL_3aa9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3aae:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3ab3:  ldarg 1

	IL_3ab7:  nop 
	IL_3ab8:  nop 
	IL_3ab9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3abe:  stloc 2

	IL_3ac2:  nop 
	IL_3ac3:  nop 
	IL_3ac4:  ldc.i4 1
	IL_3ac9:  conv.u 
	IL_3aca:  newarr [mscorlib]System.Char
	IL_3acf:  stloc 3

	IL_3ad3:  nop 
	IL_3ad4:  nop 
	IL_3ad5:  ldloc 3

	IL_3ad9:  nop 
	IL_3ada:  nop 
	IL_3adb:  ldc.i4 0
	IL_3ae0:  conv.u 
	IL_3ae1:  ldstr "d"
	IL_3ae6:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3aeb:  stelem [mscorlib]System.Char
	IL_3af0:  ldloc 2

	IL_3af4:  nop 
	IL_3af5:  nop 
	IL_3af6:  ldloc 3

	IL_3afa:  nop 
	IL_3afb:  nop 
	IL_3afc:  callvirt instance string string::TrimEnd(char[])
	IL_3b01:  stloc 2

	IL_3b05:  nop 
	IL_3b06:  nop 
	IL_3b07:  ldloc 111

	IL_3b0b:  nop 
	IL_3b0c:  nop 
	IL_3b0d:  ldloc 2

	IL_3b11:  nop 
	IL_3b12:  nop 
	IL_3b13:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b18:  ldloc 111

	IL_3b1c:  nop 
	IL_3b1d:  nop 
	IL_3b1e:  ldloc 111

	IL_3b22:  nop 
	IL_3b23:  nop 
	IL_3b24:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b29:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_3b2e:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3b33:  ldloc 111

	IL_3b37:  nop 
	IL_3b38:  nop 
	IL_3b39:  starg 1

	IL_3b3d:  nop 
	IL_3b3e:  nop 
	IL_3b3f:  br IL_5201

	IL_3b44:  br IL_3b4e

	IL_3b49:  br IL_3b4e

	IL_3b4e:  ldarg 1

	IL_3b52:  nop 
	IL_3b53:  nop 
	IL_3b54:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b59:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_3b5e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b63:  stloc 1

	IL_3b67:  nop 
	IL_3b68:  nop 
	IL_3b69:  ldloc 1

	IL_3b6d:  nop 
	IL_3b6e:  nop 
	IL_3b6f:  stloc 4

	IL_3b73:  nop 
	IL_3b74:  nop 
	IL_3b75:  ldarg 1

	IL_3b79:  nop 
	IL_3b7a:  nop 
	IL_3b7b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b80:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3b85:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b8a:  stloc 1

	IL_3b8e:  nop 
	IL_3b8f:  nop 
	IL_3b90:  ldloc 4

	IL_3b94:  nop 
	IL_3b95:  nop 
	IL_3b96:  ldloc 1

	IL_3b9a:  nop 
	IL_3b9b:  nop 
	IL_3b9c:  or 
	IL_3b9d:  stloc 4

	IL_3ba1:  nop 
	IL_3ba2:  nop 
	IL_3ba3:  ldarg 1

	IL_3ba7:  nop 
	IL_3ba8:  nop 
	IL_3ba9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3bae:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3bb3:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3bb8:  stloc 1

	IL_3bbc:  nop 
	IL_3bbd:  nop 
	IL_3bbe:  ldloc 4

	IL_3bc2:  nop 
	IL_3bc3:  nop 
	IL_3bc4:  ldloc 1

	IL_3bc8:  nop 
	IL_3bc9:  nop 
	IL_3bca:  or 
	IL_3bcb:  stloc 4

	IL_3bcf:  nop 
	IL_3bd0:  nop 
	IL_3bd1:  ldarg 1

	IL_3bd5:  nop 
	IL_3bd6:  nop 
	IL_3bd7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3bdc:  stloc 2

	IL_3be0:  nop 
	IL_3be1:  nop 
	IL_3be2:  ldloc 2

	IL_3be6:  nop 
	IL_3be7:  nop 
	IL_3be8:  ldstr "f"
	IL_3bed:  callvirt instance bool string::EndsWith(string)
	IL_3bf2:  stloc 1

	IL_3bf6:  nop 
	IL_3bf7:  nop 
	IL_3bf8:  ldloc 4

	IL_3bfc:  nop 
	IL_3bfd:  nop 
	IL_3bfe:  ldloc 1

	IL_3c02:  nop 
	IL_3c03:  nop 
	IL_3c04:  and 
	IL_3c05:  stloc 4

	IL_3c09:  nop 
	IL_3c0a:  nop 
	IL_3c0b:  ldloc 4

	IL_3c0f:  nop 
	IL_3c10:  nop 
	IL_3c11:  ldc.i4 1
	IL_3c16:  beq IL_3c20

	IL_3c1b:  br IL_3cd7

	IL_3c20:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_3c25:  stloc 112

	IL_3c29:  nop 
	IL_3c2a:  nop 
	IL_3c2b:  ldloc 112

	IL_3c2f:  nop 
	IL_3c30:  nop 
	IL_3c31:  ldarg 1

	IL_3c35:  nop 
	IL_3c36:  nop 
	IL_3c37:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3c3c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3c41:  ldarg 1

	IL_3c45:  nop 
	IL_3c46:  nop 
	IL_3c47:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c4c:  stloc 2

	IL_3c50:  nop 
	IL_3c51:  nop 
	IL_3c52:  ldc.i4 1
	IL_3c57:  conv.u 
	IL_3c58:  newarr [mscorlib]System.Char
	IL_3c5d:  stloc 3

	IL_3c61:  nop 
	IL_3c62:  nop 
	IL_3c63:  ldloc 3

	IL_3c67:  nop 
	IL_3c68:  nop 
	IL_3c69:  ldc.i4 0
	IL_3c6e:  conv.u 
	IL_3c6f:  ldstr "f"
	IL_3c74:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3c79:  stelem [mscorlib]System.Char
	IL_3c7e:  ldloc 2

	IL_3c82:  nop 
	IL_3c83:  nop 
	IL_3c84:  ldloc 3

	IL_3c88:  nop 
	IL_3c89:  nop 
	IL_3c8a:  callvirt instance string string::TrimEnd(char[])
	IL_3c8f:  stloc 2

	IL_3c93:  nop 
	IL_3c94:  nop 
	IL_3c95:  ldloc 112

	IL_3c99:  nop 
	IL_3c9a:  nop 
	IL_3c9b:  ldloc 2

	IL_3c9f:  nop 
	IL_3ca0:  nop 
	IL_3ca1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ca6:  ldloc 112

	IL_3caa:  nop 
	IL_3cab:  nop 
	IL_3cac:  ldloc 112

	IL_3cb0:  nop 
	IL_3cb1:  nop 
	IL_3cb2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3cb7:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_3cbc:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_3cc1:  ldloc 112

	IL_3cc5:  nop 
	IL_3cc6:  nop 
	IL_3cc7:  starg 1

	IL_3ccb:  nop 
	IL_3ccc:  nop 
	IL_3ccd:  br IL_5201

	IL_3cd2:  br IL_3cdc

	IL_3cd7:  br IL_3cdc

	IL_3cdc:  ldarg 1

	IL_3ce0:  nop 
	IL_3ce1:  nop 
	IL_3ce2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ce7:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_3cec:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3cf1:  stloc 1

	IL_3cf5:  nop 
	IL_3cf6:  nop 
	IL_3cf7:  ldloc 1

	IL_3cfb:  nop 
	IL_3cfc:  nop 
	IL_3cfd:  stloc 4

	IL_3d01:  nop 
	IL_3d02:  nop 
	IL_3d03:  ldarg 1

	IL_3d07:  nop 
	IL_3d08:  nop 
	IL_3d09:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d0e:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3d13:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3d18:  stloc 1

	IL_3d1c:  nop 
	IL_3d1d:  nop 
	IL_3d1e:  ldloc 4

	IL_3d22:  nop 
	IL_3d23:  nop 
	IL_3d24:  ldloc 1

	IL_3d28:  nop 
	IL_3d29:  nop 
	IL_3d2a:  or 
	IL_3d2b:  stloc 4

	IL_3d2f:  nop 
	IL_3d30:  nop 
	IL_3d31:  ldarg 1

	IL_3d35:  nop 
	IL_3d36:  nop 
	IL_3d37:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d3c:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3d41:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3d46:  stloc 1

	IL_3d4a:  nop 
	IL_3d4b:  nop 
	IL_3d4c:  ldloc 4

	IL_3d50:  nop 
	IL_3d51:  nop 
	IL_3d52:  ldloc 1

	IL_3d56:  nop 
	IL_3d57:  nop 
	IL_3d58:  or 
	IL_3d59:  stloc 4

	IL_3d5d:  nop 
	IL_3d5e:  nop 
	IL_3d5f:  ldloc 4

	IL_3d63:  nop 
	IL_3d64:  nop 
	IL_3d65:  ldc.i4 1
	IL_3d6a:  beq IL_3d74

	IL_3d6f:  br IL_3de8

	IL_3d74:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3d79:  stloc 113

	IL_3d7d:  nop 
	IL_3d7e:  nop 
	IL_3d7f:  ldloc 113

	IL_3d83:  nop 
	IL_3d84:  nop 
	IL_3d85:  ldarg 1

	IL_3d89:  nop 
	IL_3d8a:  nop 
	IL_3d8b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3d90:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3d95:  ldarg 1

	IL_3d99:  nop 
	IL_3d9a:  nop 
	IL_3d9b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3da0:  stloc 2

	IL_3da4:  nop 
	IL_3da5:  nop 
	IL_3da6:  ldloc 113

	IL_3daa:  nop 
	IL_3dab:  nop 
	IL_3dac:  ldloc 2

	IL_3db0:  nop 
	IL_3db1:  nop 
	IL_3db2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3db7:  ldloc 113

	IL_3dbb:  nop 
	IL_3dbc:  nop 
	IL_3dbd:  ldloc 113

	IL_3dc1:  nop 
	IL_3dc2:  nop 
	IL_3dc3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3dc8:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_3dcd:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3dd2:  ldloc 113

	IL_3dd6:  nop 
	IL_3dd7:  nop 
	IL_3dd8:  starg 1

	IL_3ddc:  nop 
	IL_3ddd:  nop 
	IL_3dde:  br IL_5201

	IL_3de3:  br IL_3ded

	IL_3de8:  br IL_3ded

	IL_3ded:  ldarg 1

	IL_3df1:  nop 
	IL_3df2:  nop 
	IL_3df3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3df8:  ldstr "^(\\d)+(.)*$"
	IL_3dfd:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3e02:  stloc 1

	IL_3e06:  nop 
	IL_3e07:  nop 
	IL_3e08:  ldloc 1

	IL_3e0c:  nop 
	IL_3e0d:  nop 
	IL_3e0e:  stloc 4

	IL_3e12:  nop 
	IL_3e13:  nop 
	IL_3e14:  ldarg 1

	IL_3e18:  nop 
	IL_3e19:  nop 
	IL_3e1a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e1f:  ldstr "^\\+(\\d)+(.)*$"
	IL_3e24:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3e29:  stloc 1

	IL_3e2d:  nop 
	IL_3e2e:  nop 
	IL_3e2f:  ldloc 4

	IL_3e33:  nop 
	IL_3e34:  nop 
	IL_3e35:  ldloc 1

	IL_3e39:  nop 
	IL_3e3a:  nop 
	IL_3e3b:  or 
	IL_3e3c:  stloc 4

	IL_3e40:  nop 
	IL_3e41:  nop 
	IL_3e42:  ldarg 1

	IL_3e46:  nop 
	IL_3e47:  nop 
	IL_3e48:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e4d:  ldstr "^-(\\d)+(.)*$"
	IL_3e52:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3e57:  stloc 1

	IL_3e5b:  nop 
	IL_3e5c:  nop 
	IL_3e5d:  ldloc 4

	IL_3e61:  nop 
	IL_3e62:  nop 
	IL_3e63:  ldloc 1

	IL_3e67:  nop 
	IL_3e68:  nop 
	IL_3e69:  or 
	IL_3e6a:  stloc 4

	IL_3e6e:  nop 
	IL_3e6f:  nop 
	IL_3e70:  ldarg 1

	IL_3e74:  nop 
	IL_3e75:  nop 
	IL_3e76:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e7b:  stloc 2

	IL_3e7f:  nop 
	IL_3e80:  nop 
	IL_3e81:  ldloc 2

	IL_3e85:  nop 
	IL_3e86:  nop 
	IL_3e87:  ldstr "d"
	IL_3e8c:  callvirt instance bool string::EndsWith(string)
	IL_3e91:  stloc 1

	IL_3e95:  nop 
	IL_3e96:  nop 
	IL_3e97:  ldloc 4

	IL_3e9b:  nop 
	IL_3e9c:  nop 
	IL_3e9d:  ldloc 1

	IL_3ea1:  nop 
	IL_3ea2:  nop 
	IL_3ea3:  and 
	IL_3ea4:  stloc 4

	IL_3ea8:  nop 
	IL_3ea9:  nop 
	IL_3eaa:  ldloc 4

	IL_3eae:  nop 
	IL_3eaf:  nop 
	IL_3eb0:  ldc.i4 1
	IL_3eb5:  beq IL_3ebf

	IL_3eba:  br IL_3f76

	IL_3ebf:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3ec4:  stloc 114

	IL_3ec8:  nop 
	IL_3ec9:  nop 
	IL_3eca:  ldloc 114

	IL_3ece:  nop 
	IL_3ecf:  nop 
	IL_3ed0:  ldarg 1

	IL_3ed4:  nop 
	IL_3ed5:  nop 
	IL_3ed6:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3edb:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3ee0:  ldarg 1

	IL_3ee4:  nop 
	IL_3ee5:  nop 
	IL_3ee6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3eeb:  stloc 2

	IL_3eef:  nop 
	IL_3ef0:  nop 
	IL_3ef1:  ldc.i4 1
	IL_3ef6:  conv.u 
	IL_3ef7:  newarr [mscorlib]System.Char
	IL_3efc:  stloc 3

	IL_3f00:  nop 
	IL_3f01:  nop 
	IL_3f02:  ldloc 3

	IL_3f06:  nop 
	IL_3f07:  nop 
	IL_3f08:  ldc.i4 0
	IL_3f0d:  conv.u 
	IL_3f0e:  ldstr "d"
	IL_3f13:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3f18:  stelem [mscorlib]System.Char
	IL_3f1d:  ldloc 2

	IL_3f21:  nop 
	IL_3f22:  nop 
	IL_3f23:  ldloc 3

	IL_3f27:  nop 
	IL_3f28:  nop 
	IL_3f29:  callvirt instance string string::TrimEnd(char[])
	IL_3f2e:  stloc 2

	IL_3f32:  nop 
	IL_3f33:  nop 
	IL_3f34:  ldloc 114

	IL_3f38:  nop 
	IL_3f39:  nop 
	IL_3f3a:  ldloc 2

	IL_3f3e:  nop 
	IL_3f3f:  nop 
	IL_3f40:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f45:  ldloc 114

	IL_3f49:  nop 
	IL_3f4a:  nop 
	IL_3f4b:  ldloc 114

	IL_3f4f:  nop 
	IL_3f50:  nop 
	IL_3f51:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f56:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_3f5b:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3f60:  ldloc 114

	IL_3f64:  nop 
	IL_3f65:  nop 
	IL_3f66:  starg 1

	IL_3f6a:  nop 
	IL_3f6b:  nop 
	IL_3f6c:  br IL_5201

	IL_3f71:  br IL_3f7b

	IL_3f76:  br IL_3f7b

	IL_3f7b:  ldarg 1

	IL_3f7f:  nop 
	IL_3f80:  nop 
	IL_3f81:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f86:  ldstr "^(\\d)+(.)*$"
	IL_3f8b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3f90:  stloc 1

	IL_3f94:  nop 
	IL_3f95:  nop 
	IL_3f96:  ldloc 1

	IL_3f9a:  nop 
	IL_3f9b:  nop 
	IL_3f9c:  stloc 4

	IL_3fa0:  nop 
	IL_3fa1:  nop 
	IL_3fa2:  ldarg 1

	IL_3fa6:  nop 
	IL_3fa7:  nop 
	IL_3fa8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3fad:  ldstr "^\\+(\\d)+(.)*$"
	IL_3fb2:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3fb7:  stloc 1

	IL_3fbb:  nop 
	IL_3fbc:  nop 
	IL_3fbd:  ldloc 4

	IL_3fc1:  nop 
	IL_3fc2:  nop 
	IL_3fc3:  ldloc 1

	IL_3fc7:  nop 
	IL_3fc8:  nop 
	IL_3fc9:  or 
	IL_3fca:  stloc 4

	IL_3fce:  nop 
	IL_3fcf:  nop 
	IL_3fd0:  ldarg 1

	IL_3fd4:  nop 
	IL_3fd5:  nop 
	IL_3fd6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3fdb:  ldstr "^-(\\d)+(.)*$"
	IL_3fe0:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3fe5:  stloc 1

	IL_3fe9:  nop 
	IL_3fea:  nop 
	IL_3feb:  ldloc 4

	IL_3fef:  nop 
	IL_3ff0:  nop 
	IL_3ff1:  ldloc 1

	IL_3ff5:  nop 
	IL_3ff6:  nop 
	IL_3ff7:  or 
	IL_3ff8:  stloc 4

	IL_3ffc:  nop 
	IL_3ffd:  nop 
	IL_3ffe:  ldarg 1

	IL_4002:  nop 
	IL_4003:  nop 
	IL_4004:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4009:  stloc 2

	IL_400d:  nop 
	IL_400e:  nop 
	IL_400f:  ldloc 2

	IL_4013:  nop 
	IL_4014:  nop 
	IL_4015:  ldstr "f"
	IL_401a:  callvirt instance bool string::EndsWith(string)
	IL_401f:  stloc 1

	IL_4023:  nop 
	IL_4024:  nop 
	IL_4025:  ldloc 4

	IL_4029:  nop 
	IL_402a:  nop 
	IL_402b:  ldloc 1

	IL_402f:  nop 
	IL_4030:  nop 
	IL_4031:  and 
	IL_4032:  stloc 4

	IL_4036:  nop 
	IL_4037:  nop 
	IL_4038:  ldloc 4

	IL_403c:  nop 
	IL_403d:  nop 
	IL_403e:  ldc.i4 1
	IL_4043:  beq IL_404d

	IL_4048:  br IL_4104

	IL_404d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_4052:  stloc 115

	IL_4056:  nop 
	IL_4057:  nop 
	IL_4058:  ldloc 115

	IL_405c:  nop 
	IL_405d:  nop 
	IL_405e:  ldarg 1

	IL_4062:  nop 
	IL_4063:  nop 
	IL_4064:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4069:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_406e:  ldarg 1

	IL_4072:  nop 
	IL_4073:  nop 
	IL_4074:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4079:  stloc 2

	IL_407d:  nop 
	IL_407e:  nop 
	IL_407f:  ldc.i4 1
	IL_4084:  conv.u 
	IL_4085:  newarr [mscorlib]System.Char
	IL_408a:  stloc 3

	IL_408e:  nop 
	IL_408f:  nop 
	IL_4090:  ldloc 3

	IL_4094:  nop 
	IL_4095:  nop 
	IL_4096:  ldc.i4 0
	IL_409b:  conv.u 
	IL_409c:  ldstr "f"
	IL_40a1:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_40a6:  stelem [mscorlib]System.Char
	IL_40ab:  ldloc 2

	IL_40af:  nop 
	IL_40b0:  nop 
	IL_40b1:  ldloc 3

	IL_40b5:  nop 
	IL_40b6:  nop 
	IL_40b7:  callvirt instance string string::TrimEnd(char[])
	IL_40bc:  stloc 2

	IL_40c0:  nop 
	IL_40c1:  nop 
	IL_40c2:  ldloc 115

	IL_40c6:  nop 
	IL_40c7:  nop 
	IL_40c8:  ldloc 2

	IL_40cc:  nop 
	IL_40cd:  nop 
	IL_40ce:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40d3:  ldloc 115

	IL_40d7:  nop 
	IL_40d8:  nop 
	IL_40d9:  ldloc 115

	IL_40dd:  nop 
	IL_40de:  nop 
	IL_40df:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40e4:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_40e9:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_40ee:  ldloc 115

	IL_40f2:  nop 
	IL_40f3:  nop 
	IL_40f4:  starg 1

	IL_40f8:  nop 
	IL_40f9:  nop 
	IL_40fa:  br IL_5201

	IL_40ff:  br IL_4109

	IL_4104:  br IL_4109

	IL_4109:  ldarg 1

	IL_410d:  nop 
	IL_410e:  nop 
	IL_410f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4114:  ldstr "^(\\d)+(.)*$"
	IL_4119:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_411e:  stloc 1

	IL_4122:  nop 
	IL_4123:  nop 
	IL_4124:  ldloc 1

	IL_4128:  nop 
	IL_4129:  nop 
	IL_412a:  stloc 4

	IL_412e:  nop 
	IL_412f:  nop 
	IL_4130:  ldarg 1

	IL_4134:  nop 
	IL_4135:  nop 
	IL_4136:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_413b:  ldstr "^\\+(\\d)+(.)*$"
	IL_4140:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4145:  stloc 1

	IL_4149:  nop 
	IL_414a:  nop 
	IL_414b:  ldloc 4

	IL_414f:  nop 
	IL_4150:  nop 
	IL_4151:  ldloc 1

	IL_4155:  nop 
	IL_4156:  nop 
	IL_4157:  or 
	IL_4158:  stloc 4

	IL_415c:  nop 
	IL_415d:  nop 
	IL_415e:  ldarg 1

	IL_4162:  nop 
	IL_4163:  nop 
	IL_4164:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4169:  ldstr "^-(\\d)+(.)*$"
	IL_416e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4173:  stloc 1

	IL_4177:  nop 
	IL_4178:  nop 
	IL_4179:  ldloc 4

	IL_417d:  nop 
	IL_417e:  nop 
	IL_417f:  ldloc 1

	IL_4183:  nop 
	IL_4184:  nop 
	IL_4185:  or 
	IL_4186:  stloc 4

	IL_418a:  nop 
	IL_418b:  nop 
	IL_418c:  ldarg 1

	IL_4190:  nop 
	IL_4191:  nop 
	IL_4192:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4197:  stloc 2

	IL_419b:  nop 
	IL_419c:  nop 
	IL_419d:  ldloc 2

	IL_41a1:  nop 
	IL_41a2:  nop 
	IL_41a3:  ldstr "ui"
	IL_41a8:  callvirt instance bool string::EndsWith(string)
	IL_41ad:  stloc 1

	IL_41b1:  nop 
	IL_41b2:  nop 
	IL_41b3:  ldloc 4

	IL_41b7:  nop 
	IL_41b8:  nop 
	IL_41b9:  ldloc 1

	IL_41bd:  nop 
	IL_41be:  nop 
	IL_41bf:  and 
	IL_41c0:  stloc 4

	IL_41c4:  nop 
	IL_41c5:  nop 
	IL_41c6:  ldloc 4

	IL_41ca:  nop 
	IL_41cb:  nop 
	IL_41cc:  ldc.i4 1
	IL_41d1:  beq IL_41db

	IL_41d6:  br IL_42c4

	IL_41db:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::'.ctor'()
	IL_41e0:  stloc 116

	IL_41e4:  nop 
	IL_41e5:  nop 
	IL_41e6:  ldloc 116

	IL_41ea:  nop 
	IL_41eb:  nop 
	IL_41ec:  ldarg 1

	IL_41f0:  nop 
	IL_41f1:  nop 
	IL_41f2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_41f7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_41fc:  ldarg 1

	IL_4200:  nop 
	IL_4201:  nop 
	IL_4202:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4207:  stloc 2

	IL_420b:  nop 
	IL_420c:  nop 
	IL_420d:  ldc.i4 1
	IL_4212:  conv.u 
	IL_4213:  newarr [mscorlib]System.Char
	IL_4218:  stloc 3

	IL_421c:  nop 
	IL_421d:  nop 
	IL_421e:  ldloc 3

	IL_4222:  nop 
	IL_4223:  nop 
	IL_4224:  ldc.i4 0
	IL_4229:  conv.u 
	IL_422a:  ldstr "i"
	IL_422f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4234:  stelem [mscorlib]System.Char
	IL_4239:  ldloc 2

	IL_423d:  nop 
	IL_423e:  nop 
	IL_423f:  ldloc 3

	IL_4243:  nop 
	IL_4244:  nop 
	IL_4245:  callvirt instance string string::TrimEnd(char[])
	IL_424a:  stloc 2

	IL_424e:  nop 
	IL_424f:  nop 
	IL_4250:  ldloc 3

	IL_4254:  nop 
	IL_4255:  nop 
	IL_4256:  ldc.i4 0
	IL_425b:  conv.u 
	IL_425c:  ldstr "u"
	IL_4261:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4266:  stelem [mscorlib]System.Char
	IL_426b:  ldloc 2

	IL_426f:  nop 
	IL_4270:  nop 
	IL_4271:  ldloc 3

	IL_4275:  nop 
	IL_4276:  nop 
	IL_4277:  callvirt instance string string::TrimEnd(char[])
	IL_427c:  stloc 2

	IL_4280:  nop 
	IL_4281:  nop 
	IL_4282:  ldloc 116

	IL_4286:  nop 
	IL_4287:  nop 
	IL_4288:  ldloc 2

	IL_428c:  nop 
	IL_428d:  nop 
	IL_428e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4293:  ldloc 116

	IL_4297:  nop 
	IL_4298:  nop 
	IL_4299:  ldloc 116

	IL_429d:  nop 
	IL_429e:  nop 
	IL_429f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42a4:  call unsigned int32 class [mscorlib]System.Convert::ToUInt32(string)
	IL_42a9:  stfld unsigned int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::NumVal
	IL_42ae:  ldloc 116

	IL_42b2:  nop 
	IL_42b3:  nop 
	IL_42b4:  starg 1

	IL_42b8:  nop 
	IL_42b9:  nop 
	IL_42ba:  br IL_5201

	IL_42bf:  br IL_42c9

	IL_42c4:  br IL_42c9

	IL_42c9:  ldarg 1

	IL_42cd:  nop 
	IL_42ce:  nop 
	IL_42cf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42d4:  ldstr "^(\\d)+(.)*$"
	IL_42d9:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_42de:  stloc 1

	IL_42e2:  nop 
	IL_42e3:  nop 
	IL_42e4:  ldloc 1

	IL_42e8:  nop 
	IL_42e9:  nop 
	IL_42ea:  stloc 4

	IL_42ee:  nop 
	IL_42ef:  nop 
	IL_42f0:  ldarg 1

	IL_42f4:  nop 
	IL_42f5:  nop 
	IL_42f6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42fb:  ldstr "^\\+(\\d)+(.)*$"
	IL_4300:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4305:  stloc 1

	IL_4309:  nop 
	IL_430a:  nop 
	IL_430b:  ldloc 4

	IL_430f:  nop 
	IL_4310:  nop 
	IL_4311:  ldloc 1

	IL_4315:  nop 
	IL_4316:  nop 
	IL_4317:  or 
	IL_4318:  stloc 4

	IL_431c:  nop 
	IL_431d:  nop 
	IL_431e:  ldarg 1

	IL_4322:  nop 
	IL_4323:  nop 
	IL_4324:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4329:  ldstr "^-(\\d)+(.)*$"
	IL_432e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4333:  stloc 1

	IL_4337:  nop 
	IL_4338:  nop 
	IL_4339:  ldloc 4

	IL_433d:  nop 
	IL_433e:  nop 
	IL_433f:  ldloc 1

	IL_4343:  nop 
	IL_4344:  nop 
	IL_4345:  or 
	IL_4346:  stloc 4

	IL_434a:  nop 
	IL_434b:  nop 
	IL_434c:  ldarg 1

	IL_4350:  nop 
	IL_4351:  nop 
	IL_4352:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4357:  stloc 2

	IL_435b:  nop 
	IL_435c:  nop 
	IL_435d:  ldloc 2

	IL_4361:  nop 
	IL_4362:  nop 
	IL_4363:  ldstr "ip"
	IL_4368:  callvirt instance bool string::EndsWith(string)
	IL_436d:  stloc 1

	IL_4371:  nop 
	IL_4372:  nop 
	IL_4373:  ldloc 4

	IL_4377:  nop 
	IL_4378:  nop 
	IL_4379:  ldloc 1

	IL_437d:  nop 
	IL_437e:  nop 
	IL_437f:  and 
	IL_4380:  stloc 4

	IL_4384:  nop 
	IL_4385:  nop 
	IL_4386:  ldloc 4

	IL_438a:  nop 
	IL_438b:  nop 
	IL_438c:  ldc.i4 1
	IL_4391:  beq IL_439b

	IL_4396:  br IL_4489

	IL_439b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::'.ctor'()
	IL_43a0:  stloc 117

	IL_43a4:  nop 
	IL_43a5:  nop 
	IL_43a6:  ldloc 117

	IL_43aa:  nop 
	IL_43ab:  nop 
	IL_43ac:  ldarg 1

	IL_43b0:  nop 
	IL_43b1:  nop 
	IL_43b2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_43b7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_43bc:  ldarg 1

	IL_43c0:  nop 
	IL_43c1:  nop 
	IL_43c2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43c7:  stloc 2

	IL_43cb:  nop 
	IL_43cc:  nop 
	IL_43cd:  ldc.i4 1
	IL_43d2:  conv.u 
	IL_43d3:  newarr [mscorlib]System.Char
	IL_43d8:  stloc 3

	IL_43dc:  nop 
	IL_43dd:  nop 
	IL_43de:  ldloc 3

	IL_43e2:  nop 
	IL_43e3:  nop 
	IL_43e4:  ldc.i4 0
	IL_43e9:  conv.u 
	IL_43ea:  ldstr "p"
	IL_43ef:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_43f4:  stelem [mscorlib]System.Char
	IL_43f9:  ldloc 2

	IL_43fd:  nop 
	IL_43fe:  nop 
	IL_43ff:  ldloc 3

	IL_4403:  nop 
	IL_4404:  nop 
	IL_4405:  callvirt instance string string::TrimEnd(char[])
	IL_440a:  stloc 2

	IL_440e:  nop 
	IL_440f:  nop 
	IL_4410:  ldloc 3

	IL_4414:  nop 
	IL_4415:  nop 
	IL_4416:  ldc.i4 0
	IL_441b:  conv.u 
	IL_441c:  ldstr "i"
	IL_4421:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4426:  stelem [mscorlib]System.Char
	IL_442b:  ldloc 2

	IL_442f:  nop 
	IL_4430:  nop 
	IL_4431:  ldloc 3

	IL_4435:  nop 
	IL_4436:  nop 
	IL_4437:  callvirt instance string string::TrimEnd(char[])
	IL_443c:  stloc 2

	IL_4440:  nop 
	IL_4441:  nop 
	IL_4442:  ldloc 117

	IL_4446:  nop 
	IL_4447:  nop 
	IL_4448:  ldloc 2

	IL_444c:  nop 
	IL_444d:  nop 
	IL_444e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4453:  ldloc 117

	IL_4457:  nop 
	IL_4458:  nop 
	IL_4459:  ldloc 117

	IL_445d:  nop 
	IL_445e:  nop 
	IL_445f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4464:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_4469:  newobj instance void native int::'.ctor'(int32)
	IL_446e:  stfld native int [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::NumVal
	IL_4473:  ldloc 117

	IL_4477:  nop 
	IL_4478:  nop 
	IL_4479:  starg 1

	IL_447d:  nop 
	IL_447e:  nop 
	IL_447f:  br IL_5201

	IL_4484:  br IL_448e

	IL_4489:  br IL_448e

	IL_448e:  ldarg 1

	IL_4492:  nop 
	IL_4493:  nop 
	IL_4494:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4499:  ldstr "^(\\d)+(.)*$"
	IL_449e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_44a3:  stloc 1

	IL_44a7:  nop 
	IL_44a8:  nop 
	IL_44a9:  ldloc 1

	IL_44ad:  nop 
	IL_44ae:  nop 
	IL_44af:  stloc 4

	IL_44b3:  nop 
	IL_44b4:  nop 
	IL_44b5:  ldarg 1

	IL_44b9:  nop 
	IL_44ba:  nop 
	IL_44bb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_44c0:  ldstr "^\\+(\\d)+(.)*$"
	IL_44c5:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_44ca:  stloc 1

	IL_44ce:  nop 
	IL_44cf:  nop 
	IL_44d0:  ldloc 4

	IL_44d4:  nop 
	IL_44d5:  nop 
	IL_44d6:  ldloc 1

	IL_44da:  nop 
	IL_44db:  nop 
	IL_44dc:  or 
	IL_44dd:  stloc 4

	IL_44e1:  nop 
	IL_44e2:  nop 
	IL_44e3:  ldarg 1

	IL_44e7:  nop 
	IL_44e8:  nop 
	IL_44e9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_44ee:  ldstr "^-(\\d)+(.)*$"
	IL_44f3:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_44f8:  stloc 1

	IL_44fc:  nop 
	IL_44fd:  nop 
	IL_44fe:  ldloc 4

	IL_4502:  nop 
	IL_4503:  nop 
	IL_4504:  ldloc 1

	IL_4508:  nop 
	IL_4509:  nop 
	IL_450a:  or 
	IL_450b:  stloc 4

	IL_450f:  nop 
	IL_4510:  nop 
	IL_4511:  ldarg 1

	IL_4515:  nop 
	IL_4516:  nop 
	IL_4517:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_451c:  stloc 2

	IL_4520:  nop 
	IL_4521:  nop 
	IL_4522:  ldloc 2

	IL_4526:  nop 
	IL_4527:  nop 
	IL_4528:  ldstr "i"
	IL_452d:  callvirt instance bool string::EndsWith(string)
	IL_4532:  stloc 1

	IL_4536:  nop 
	IL_4537:  nop 
	IL_4538:  ldloc 4

	IL_453c:  nop 
	IL_453d:  nop 
	IL_453e:  ldloc 1

	IL_4542:  nop 
	IL_4543:  nop 
	IL_4544:  and 
	IL_4545:  stloc 4

	IL_4549:  nop 
	IL_454a:  nop 
	IL_454b:  ldloc 4

	IL_454f:  nop 
	IL_4550:  nop 
	IL_4551:  ldc.i4 1
	IL_4556:  beq IL_4560

	IL_455b:  br IL_4617

	IL_4560:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_4565:  stloc 118

	IL_4569:  nop 
	IL_456a:  nop 
	IL_456b:  ldloc 118

	IL_456f:  nop 
	IL_4570:  nop 
	IL_4571:  ldarg 1

	IL_4575:  nop 
	IL_4576:  nop 
	IL_4577:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_457c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4581:  ldarg 1

	IL_4585:  nop 
	IL_4586:  nop 
	IL_4587:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_458c:  stloc 2

	IL_4590:  nop 
	IL_4591:  nop 
	IL_4592:  ldc.i4 1
	IL_4597:  conv.u 
	IL_4598:  newarr [mscorlib]System.Char
	IL_459d:  stloc 3

	IL_45a1:  nop 
	IL_45a2:  nop 
	IL_45a3:  ldloc 3

	IL_45a7:  nop 
	IL_45a8:  nop 
	IL_45a9:  ldc.i4 0
	IL_45ae:  conv.u 
	IL_45af:  ldstr "i"
	IL_45b4:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_45b9:  stelem [mscorlib]System.Char
	IL_45be:  ldloc 2

	IL_45c2:  nop 
	IL_45c3:  nop 
	IL_45c4:  ldloc 3

	IL_45c8:  nop 
	IL_45c9:  nop 
	IL_45ca:  callvirt instance string string::TrimEnd(char[])
	IL_45cf:  stloc 2

	IL_45d3:  nop 
	IL_45d4:  nop 
	IL_45d5:  ldloc 118

	IL_45d9:  nop 
	IL_45da:  nop 
	IL_45db:  ldloc 2

	IL_45df:  nop 
	IL_45e0:  nop 
	IL_45e1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45e6:  ldloc 118

	IL_45ea:  nop 
	IL_45eb:  nop 
	IL_45ec:  ldloc 118

	IL_45f0:  nop 
	IL_45f1:  nop 
	IL_45f2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45f7:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_45fc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_4601:  ldloc 118

	IL_4605:  nop 
	IL_4606:  nop 
	IL_4607:  starg 1

	IL_460b:  nop 
	IL_460c:  nop 
	IL_460d:  br IL_5201

	IL_4612:  br IL_461c

	IL_4617:  br IL_461c

	IL_461c:  ldarg 1

	IL_4620:  nop 
	IL_4621:  nop 
	IL_4622:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4627:  ldstr "^(\\d)+(.)*$"
	IL_462c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4631:  stloc 1

	IL_4635:  nop 
	IL_4636:  nop 
	IL_4637:  ldloc 1

	IL_463b:  nop 
	IL_463c:  nop 
	IL_463d:  stloc 4

	IL_4641:  nop 
	IL_4642:  nop 
	IL_4643:  ldarg 1

	IL_4647:  nop 
	IL_4648:  nop 
	IL_4649:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_464e:  ldstr "^\\+(\\d)+(.)*$"
	IL_4653:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4658:  stloc 1

	IL_465c:  nop 
	IL_465d:  nop 
	IL_465e:  ldloc 4

	IL_4662:  nop 
	IL_4663:  nop 
	IL_4664:  ldloc 1

	IL_4668:  nop 
	IL_4669:  nop 
	IL_466a:  or 
	IL_466b:  stloc 4

	IL_466f:  nop 
	IL_4670:  nop 
	IL_4671:  ldarg 1

	IL_4675:  nop 
	IL_4676:  nop 
	IL_4677:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_467c:  ldstr "^-(\\d)+(.)*$"
	IL_4681:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4686:  stloc 1

	IL_468a:  nop 
	IL_468b:  nop 
	IL_468c:  ldloc 4

	IL_4690:  nop 
	IL_4691:  nop 
	IL_4692:  ldloc 1

	IL_4696:  nop 
	IL_4697:  nop 
	IL_4698:  or 
	IL_4699:  stloc 4

	IL_469d:  nop 
	IL_469e:  nop 
	IL_469f:  ldarg 1

	IL_46a3:  nop 
	IL_46a4:  nop 
	IL_46a5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46aa:  stloc 2

	IL_46ae:  nop 
	IL_46af:  nop 
	IL_46b0:  ldloc 2

	IL_46b4:  nop 
	IL_46b5:  nop 
	IL_46b6:  ldstr "ul"
	IL_46bb:  callvirt instance bool string::EndsWith(string)
	IL_46c0:  stloc 1

	IL_46c4:  nop 
	IL_46c5:  nop 
	IL_46c6:  ldloc 4

	IL_46ca:  nop 
	IL_46cb:  nop 
	IL_46cc:  ldloc 1

	IL_46d0:  nop 
	IL_46d1:  nop 
	IL_46d2:  and 
	IL_46d3:  stloc 4

	IL_46d7:  nop 
	IL_46d8:  nop 
	IL_46d9:  ldloc 4

	IL_46dd:  nop 
	IL_46de:  nop 
	IL_46df:  ldc.i4 1
	IL_46e4:  beq IL_46ee

	IL_46e9:  br IL_47d7

	IL_46ee:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::'.ctor'()
	IL_46f3:  stloc 119

	IL_46f7:  nop 
	IL_46f8:  nop 
	IL_46f9:  ldloc 119

	IL_46fd:  nop 
	IL_46fe:  nop 
	IL_46ff:  ldarg 1

	IL_4703:  nop 
	IL_4704:  nop 
	IL_4705:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_470a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_470f:  ldarg 1

	IL_4713:  nop 
	IL_4714:  nop 
	IL_4715:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_471a:  stloc 2

	IL_471e:  nop 
	IL_471f:  nop 
	IL_4720:  ldc.i4 1
	IL_4725:  conv.u 
	IL_4726:  newarr [mscorlib]System.Char
	IL_472b:  stloc 3

	IL_472f:  nop 
	IL_4730:  nop 
	IL_4731:  ldloc 3

	IL_4735:  nop 
	IL_4736:  nop 
	IL_4737:  ldc.i4 0
	IL_473c:  conv.u 
	IL_473d:  ldstr "l"
	IL_4742:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4747:  stelem [mscorlib]System.Char
	IL_474c:  ldloc 2

	IL_4750:  nop 
	IL_4751:  nop 
	IL_4752:  ldloc 3

	IL_4756:  nop 
	IL_4757:  nop 
	IL_4758:  callvirt instance string string::TrimEnd(char[])
	IL_475d:  stloc 2

	IL_4761:  nop 
	IL_4762:  nop 
	IL_4763:  ldloc 3

	IL_4767:  nop 
	IL_4768:  nop 
	IL_4769:  ldc.i4 0
	IL_476e:  conv.u 
	IL_476f:  ldstr "u"
	IL_4774:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4779:  stelem [mscorlib]System.Char
	IL_477e:  ldloc 2

	IL_4782:  nop 
	IL_4783:  nop 
	IL_4784:  ldloc 3

	IL_4788:  nop 
	IL_4789:  nop 
	IL_478a:  callvirt instance string string::TrimEnd(char[])
	IL_478f:  stloc 2

	IL_4793:  nop 
	IL_4794:  nop 
	IL_4795:  ldloc 119

	IL_4799:  nop 
	IL_479a:  nop 
	IL_479b:  ldloc 2

	IL_479f:  nop 
	IL_47a0:  nop 
	IL_47a1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_47a6:  ldloc 119

	IL_47aa:  nop 
	IL_47ab:  nop 
	IL_47ac:  ldloc 119

	IL_47b0:  nop 
	IL_47b1:  nop 
	IL_47b2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_47b7:  call unsigned int64 class [mscorlib]System.Convert::ToUInt64(string)
	IL_47bc:  stfld unsigned int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::NumVal
	IL_47c1:  ldloc 119

	IL_47c5:  nop 
	IL_47c6:  nop 
	IL_47c7:  starg 1

	IL_47cb:  nop 
	IL_47cc:  nop 
	IL_47cd:  br IL_5201

	IL_47d2:  br IL_47dc

	IL_47d7:  br IL_47dc

	IL_47dc:  ldarg 1

	IL_47e0:  nop 
	IL_47e1:  nop 
	IL_47e2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_47e7:  ldstr "^(\\d)+(.)*$"
	IL_47ec:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_47f1:  stloc 1

	IL_47f5:  nop 
	IL_47f6:  nop 
	IL_47f7:  ldloc 1

	IL_47fb:  nop 
	IL_47fc:  nop 
	IL_47fd:  stloc 4

	IL_4801:  nop 
	IL_4802:  nop 
	IL_4803:  ldarg 1

	IL_4807:  nop 
	IL_4808:  nop 
	IL_4809:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_480e:  ldstr "^\\+(\\d)+(.)*$"
	IL_4813:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4818:  stloc 1

	IL_481c:  nop 
	IL_481d:  nop 
	IL_481e:  ldloc 4

	IL_4822:  nop 
	IL_4823:  nop 
	IL_4824:  ldloc 1

	IL_4828:  nop 
	IL_4829:  nop 
	IL_482a:  or 
	IL_482b:  stloc 4

	IL_482f:  nop 
	IL_4830:  nop 
	IL_4831:  ldarg 1

	IL_4835:  nop 
	IL_4836:  nop 
	IL_4837:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_483c:  ldstr "^-(\\d)+(.)*$"
	IL_4841:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4846:  stloc 1

	IL_484a:  nop 
	IL_484b:  nop 
	IL_484c:  ldloc 4

	IL_4850:  nop 
	IL_4851:  nop 
	IL_4852:  ldloc 1

	IL_4856:  nop 
	IL_4857:  nop 
	IL_4858:  or 
	IL_4859:  stloc 4

	IL_485d:  nop 
	IL_485e:  nop 
	IL_485f:  ldarg 1

	IL_4863:  nop 
	IL_4864:  nop 
	IL_4865:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_486a:  stloc 2

	IL_486e:  nop 
	IL_486f:  nop 
	IL_4870:  ldloc 2

	IL_4874:  nop 
	IL_4875:  nop 
	IL_4876:  ldstr "l"
	IL_487b:  callvirt instance bool string::EndsWith(string)
	IL_4880:  stloc 1

	IL_4884:  nop 
	IL_4885:  nop 
	IL_4886:  ldloc 4

	IL_488a:  nop 
	IL_488b:  nop 
	IL_488c:  ldloc 1

	IL_4890:  nop 
	IL_4891:  nop 
	IL_4892:  and 
	IL_4893:  stloc 4

	IL_4897:  nop 
	IL_4898:  nop 
	IL_4899:  ldloc 4

	IL_489d:  nop 
	IL_489e:  nop 
	IL_489f:  ldc.i4 1
	IL_48a4:  beq IL_48ae

	IL_48a9:  br IL_4965

	IL_48ae:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::'.ctor'()
	IL_48b3:  stloc 120

	IL_48b7:  nop 
	IL_48b8:  nop 
	IL_48b9:  ldloc 120

	IL_48bd:  nop 
	IL_48be:  nop 
	IL_48bf:  ldarg 1

	IL_48c3:  nop 
	IL_48c4:  nop 
	IL_48c5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_48ca:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_48cf:  ldarg 1

	IL_48d3:  nop 
	IL_48d4:  nop 
	IL_48d5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48da:  stloc 2

	IL_48de:  nop 
	IL_48df:  nop 
	IL_48e0:  ldc.i4 1
	IL_48e5:  conv.u 
	IL_48e6:  newarr [mscorlib]System.Char
	IL_48eb:  stloc 3

	IL_48ef:  nop 
	IL_48f0:  nop 
	IL_48f1:  ldloc 3

	IL_48f5:  nop 
	IL_48f6:  nop 
	IL_48f7:  ldc.i4 0
	IL_48fc:  conv.u 
	IL_48fd:  ldstr "l"
	IL_4902:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4907:  stelem [mscorlib]System.Char
	IL_490c:  ldloc 2

	IL_4910:  nop 
	IL_4911:  nop 
	IL_4912:  ldloc 3

	IL_4916:  nop 
	IL_4917:  nop 
	IL_4918:  callvirt instance string string::TrimEnd(char[])
	IL_491d:  stloc 2

	IL_4921:  nop 
	IL_4922:  nop 
	IL_4923:  ldloc 120

	IL_4927:  nop 
	IL_4928:  nop 
	IL_4929:  ldloc 2

	IL_492d:  nop 
	IL_492e:  nop 
	IL_492f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4934:  ldloc 120

	IL_4938:  nop 
	IL_4939:  nop 
	IL_493a:  ldloc 120

	IL_493e:  nop 
	IL_493f:  nop 
	IL_4940:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4945:  call int64 class [mscorlib]System.Convert::ToInt64(string)
	IL_494a:  stfld int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_494f:  ldloc 120

	IL_4953:  nop 
	IL_4954:  nop 
	IL_4955:  starg 1

	IL_4959:  nop 
	IL_495a:  nop 
	IL_495b:  br IL_5201

	IL_4960:  br IL_496a

	IL_4965:  br IL_496a

	IL_496a:  ldarg 1

	IL_496e:  nop 
	IL_496f:  nop 
	IL_4970:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4975:  ldstr "^(\\d)+(.)*$"
	IL_497a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_497f:  stloc 1

	IL_4983:  nop 
	IL_4984:  nop 
	IL_4985:  ldloc 1

	IL_4989:  nop 
	IL_498a:  nop 
	IL_498b:  stloc 4

	IL_498f:  nop 
	IL_4990:  nop 
	IL_4991:  ldarg 1

	IL_4995:  nop 
	IL_4996:  nop 
	IL_4997:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_499c:  ldstr "^\\+(\\d)+(.)*$"
	IL_49a1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_49a6:  stloc 1

	IL_49aa:  nop 
	IL_49ab:  nop 
	IL_49ac:  ldloc 4

	IL_49b0:  nop 
	IL_49b1:  nop 
	IL_49b2:  ldloc 1

	IL_49b6:  nop 
	IL_49b7:  nop 
	IL_49b8:  or 
	IL_49b9:  stloc 4

	IL_49bd:  nop 
	IL_49be:  nop 
	IL_49bf:  ldarg 1

	IL_49c3:  nop 
	IL_49c4:  nop 
	IL_49c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_49ca:  ldstr "^-(\\d)+(.)*$"
	IL_49cf:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_49d4:  stloc 1

	IL_49d8:  nop 
	IL_49d9:  nop 
	IL_49da:  ldloc 4

	IL_49de:  nop 
	IL_49df:  nop 
	IL_49e0:  ldloc 1

	IL_49e4:  nop 
	IL_49e5:  nop 
	IL_49e6:  or 
	IL_49e7:  stloc 4

	IL_49eb:  nop 
	IL_49ec:  nop 
	IL_49ed:  ldarg 1

	IL_49f1:  nop 
	IL_49f2:  nop 
	IL_49f3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_49f8:  stloc 2

	IL_49fc:  nop 
	IL_49fd:  nop 
	IL_49fe:  ldloc 2

	IL_4a02:  nop 
	IL_4a03:  nop 
	IL_4a04:  ldstr "us"
	IL_4a09:  callvirt instance bool string::EndsWith(string)
	IL_4a0e:  stloc 1

	IL_4a12:  nop 
	IL_4a13:  nop 
	IL_4a14:  ldloc 4

	IL_4a18:  nop 
	IL_4a19:  nop 
	IL_4a1a:  ldloc 1

	IL_4a1e:  nop 
	IL_4a1f:  nop 
	IL_4a20:  and 
	IL_4a21:  stloc 4

	IL_4a25:  nop 
	IL_4a26:  nop 
	IL_4a27:  ldloc 4

	IL_4a2b:  nop 
	IL_4a2c:  nop 
	IL_4a2d:  ldc.i4 1
	IL_4a32:  beq IL_4a3c

	IL_4a37:  br IL_4b25

	IL_4a3c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::'.ctor'()
	IL_4a41:  stloc 121

	IL_4a45:  nop 
	IL_4a46:  nop 
	IL_4a47:  ldloc 121

	IL_4a4b:  nop 
	IL_4a4c:  nop 
	IL_4a4d:  ldarg 1

	IL_4a51:  nop 
	IL_4a52:  nop 
	IL_4a53:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4a58:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4a5d:  ldarg 1

	IL_4a61:  nop 
	IL_4a62:  nop 
	IL_4a63:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a68:  stloc 2

	IL_4a6c:  nop 
	IL_4a6d:  nop 
	IL_4a6e:  ldc.i4 1
	IL_4a73:  conv.u 
	IL_4a74:  newarr [mscorlib]System.Char
	IL_4a79:  stloc 3

	IL_4a7d:  nop 
	IL_4a7e:  nop 
	IL_4a7f:  ldloc 3

	IL_4a83:  nop 
	IL_4a84:  nop 
	IL_4a85:  ldc.i4 0
	IL_4a8a:  conv.u 
	IL_4a8b:  ldstr "s"
	IL_4a90:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4a95:  stelem [mscorlib]System.Char
	IL_4a9a:  ldloc 2

	IL_4a9e:  nop 
	IL_4a9f:  nop 
	IL_4aa0:  ldloc 3

	IL_4aa4:  nop 
	IL_4aa5:  nop 
	IL_4aa6:  callvirt instance string string::TrimEnd(char[])
	IL_4aab:  stloc 2

	IL_4aaf:  nop 
	IL_4ab0:  nop 
	IL_4ab1:  ldloc 3

	IL_4ab5:  nop 
	IL_4ab6:  nop 
	IL_4ab7:  ldc.i4 0
	IL_4abc:  conv.u 
	IL_4abd:  ldstr "u"
	IL_4ac2:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4ac7:  stelem [mscorlib]System.Char
	IL_4acc:  ldloc 2

	IL_4ad0:  nop 
	IL_4ad1:  nop 
	IL_4ad2:  ldloc 3

	IL_4ad6:  nop 
	IL_4ad7:  nop 
	IL_4ad8:  callvirt instance string string::TrimEnd(char[])
	IL_4add:  stloc 2

	IL_4ae1:  nop 
	IL_4ae2:  nop 
	IL_4ae3:  ldloc 121

	IL_4ae7:  nop 
	IL_4ae8:  nop 
	IL_4ae9:  ldloc 2

	IL_4aed:  nop 
	IL_4aee:  nop 
	IL_4aef:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4af4:  ldloc 121

	IL_4af8:  nop 
	IL_4af9:  nop 
	IL_4afa:  ldloc 121

	IL_4afe:  nop 
	IL_4aff:  nop 
	IL_4b00:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b05:  call unsigned int16 class [mscorlib]System.Convert::ToUInt16(string)
	IL_4b0a:  stfld unsigned int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::NumVal
	IL_4b0f:  ldloc 121

	IL_4b13:  nop 
	IL_4b14:  nop 
	IL_4b15:  starg 1

	IL_4b19:  nop 
	IL_4b1a:  nop 
	IL_4b1b:  br IL_5201

	IL_4b20:  br IL_4b2a

	IL_4b25:  br IL_4b2a

	IL_4b2a:  ldarg 1

	IL_4b2e:  nop 
	IL_4b2f:  nop 
	IL_4b30:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b35:  ldstr "^(\\d)+(.)*$"
	IL_4b3a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b3f:  stloc 1

	IL_4b43:  nop 
	IL_4b44:  nop 
	IL_4b45:  ldloc 1

	IL_4b49:  nop 
	IL_4b4a:  nop 
	IL_4b4b:  stloc 4

	IL_4b4f:  nop 
	IL_4b50:  nop 
	IL_4b51:  ldarg 1

	IL_4b55:  nop 
	IL_4b56:  nop 
	IL_4b57:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b5c:  ldstr "^\\+(\\d)+(.)*$"
	IL_4b61:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b66:  stloc 1

	IL_4b6a:  nop 
	IL_4b6b:  nop 
	IL_4b6c:  ldloc 4

	IL_4b70:  nop 
	IL_4b71:  nop 
	IL_4b72:  ldloc 1

	IL_4b76:  nop 
	IL_4b77:  nop 
	IL_4b78:  or 
	IL_4b79:  stloc 4

	IL_4b7d:  nop 
	IL_4b7e:  nop 
	IL_4b7f:  ldarg 1

	IL_4b83:  nop 
	IL_4b84:  nop 
	IL_4b85:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b8a:  ldstr "^-(\\d)+(.)*$"
	IL_4b8f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b94:  stloc 1

	IL_4b98:  nop 
	IL_4b99:  nop 
	IL_4b9a:  ldloc 4

	IL_4b9e:  nop 
	IL_4b9f:  nop 
	IL_4ba0:  ldloc 1

	IL_4ba4:  nop 
	IL_4ba5:  nop 
	IL_4ba6:  or 
	IL_4ba7:  stloc 4

	IL_4bab:  nop 
	IL_4bac:  nop 
	IL_4bad:  ldarg 1

	IL_4bb1:  nop 
	IL_4bb2:  nop 
	IL_4bb3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4bb8:  stloc 2

	IL_4bbc:  nop 
	IL_4bbd:  nop 
	IL_4bbe:  ldloc 2

	IL_4bc2:  nop 
	IL_4bc3:  nop 
	IL_4bc4:  ldstr "s"
	IL_4bc9:  callvirt instance bool string::EndsWith(string)
	IL_4bce:  stloc 1

	IL_4bd2:  nop 
	IL_4bd3:  nop 
	IL_4bd4:  ldloc 4

	IL_4bd8:  nop 
	IL_4bd9:  nop 
	IL_4bda:  ldloc 1

	IL_4bde:  nop 
	IL_4bdf:  nop 
	IL_4be0:  and 
	IL_4be1:  stloc 4

	IL_4be5:  nop 
	IL_4be6:  nop 
	IL_4be7:  ldloc 4

	IL_4beb:  nop 
	IL_4bec:  nop 
	IL_4bed:  ldc.i4 1
	IL_4bf2:  beq IL_4bfc

	IL_4bf7:  br IL_4cb3

	IL_4bfc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::'.ctor'()
	IL_4c01:  stloc 122

	IL_4c05:  nop 
	IL_4c06:  nop 
	IL_4c07:  ldloc 122

	IL_4c0b:  nop 
	IL_4c0c:  nop 
	IL_4c0d:  ldarg 1

	IL_4c11:  nop 
	IL_4c12:  nop 
	IL_4c13:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4c18:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4c1d:  ldarg 1

	IL_4c21:  nop 
	IL_4c22:  nop 
	IL_4c23:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c28:  stloc 2

	IL_4c2c:  nop 
	IL_4c2d:  nop 
	IL_4c2e:  ldc.i4 1
	IL_4c33:  conv.u 
	IL_4c34:  newarr [mscorlib]System.Char
	IL_4c39:  stloc 3

	IL_4c3d:  nop 
	IL_4c3e:  nop 
	IL_4c3f:  ldloc 3

	IL_4c43:  nop 
	IL_4c44:  nop 
	IL_4c45:  ldc.i4 0
	IL_4c4a:  conv.u 
	IL_4c4b:  ldstr "s"
	IL_4c50:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4c55:  stelem [mscorlib]System.Char
	IL_4c5a:  ldloc 2

	IL_4c5e:  nop 
	IL_4c5f:  nop 
	IL_4c60:  ldloc 3

	IL_4c64:  nop 
	IL_4c65:  nop 
	IL_4c66:  callvirt instance string string::TrimEnd(char[])
	IL_4c6b:  stloc 2

	IL_4c6f:  nop 
	IL_4c70:  nop 
	IL_4c71:  ldloc 122

	IL_4c75:  nop 
	IL_4c76:  nop 
	IL_4c77:  ldloc 2

	IL_4c7b:  nop 
	IL_4c7c:  nop 
	IL_4c7d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c82:  ldloc 122

	IL_4c86:  nop 
	IL_4c87:  nop 
	IL_4c88:  ldloc 122

	IL_4c8c:  nop 
	IL_4c8d:  nop 
	IL_4c8e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c93:  call int16 class [mscorlib]System.Convert::ToInt16(string)
	IL_4c98:  stfld int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_4c9d:  ldloc 122

	IL_4ca1:  nop 
	IL_4ca2:  nop 
	IL_4ca3:  starg 1

	IL_4ca7:  nop 
	IL_4ca8:  nop 
	IL_4ca9:  br IL_5201

	IL_4cae:  br IL_4cb8

	IL_4cb3:  br IL_4cb8

	IL_4cb8:  ldarg 1

	IL_4cbc:  nop 
	IL_4cbd:  nop 
	IL_4cbe:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4cc3:  ldstr "^(\\d)+(.)*$"
	IL_4cc8:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4ccd:  stloc 1

	IL_4cd1:  nop 
	IL_4cd2:  nop 
	IL_4cd3:  ldloc 1

	IL_4cd7:  nop 
	IL_4cd8:  nop 
	IL_4cd9:  stloc 4

	IL_4cdd:  nop 
	IL_4cde:  nop 
	IL_4cdf:  ldarg 1

	IL_4ce3:  nop 
	IL_4ce4:  nop 
	IL_4ce5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4cea:  ldstr "^\\+(\\d)+(.)*$"
	IL_4cef:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4cf4:  stloc 1

	IL_4cf8:  nop 
	IL_4cf9:  nop 
	IL_4cfa:  ldloc 4

	IL_4cfe:  nop 
	IL_4cff:  nop 
	IL_4d00:  ldloc 1

	IL_4d04:  nop 
	IL_4d05:  nop 
	IL_4d06:  or 
	IL_4d07:  stloc 4

	IL_4d0b:  nop 
	IL_4d0c:  nop 
	IL_4d0d:  ldarg 1

	IL_4d11:  nop 
	IL_4d12:  nop 
	IL_4d13:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4d18:  ldstr "^-(\\d)+(.)*$"
	IL_4d1d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4d22:  stloc 1

	IL_4d26:  nop 
	IL_4d27:  nop 
	IL_4d28:  ldloc 4

	IL_4d2c:  nop 
	IL_4d2d:  nop 
	IL_4d2e:  ldloc 1

	IL_4d32:  nop 
	IL_4d33:  nop 
	IL_4d34:  or 
	IL_4d35:  stloc 4

	IL_4d39:  nop 
	IL_4d3a:  nop 
	IL_4d3b:  ldarg 1

	IL_4d3f:  nop 
	IL_4d40:  nop 
	IL_4d41:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4d46:  stloc 2

	IL_4d4a:  nop 
	IL_4d4b:  nop 
	IL_4d4c:  ldloc 2

	IL_4d50:  nop 
	IL_4d51:  nop 
	IL_4d52:  ldstr "ub"
	IL_4d57:  callvirt instance bool string::EndsWith(string)
	IL_4d5c:  stloc 1

	IL_4d60:  nop 
	IL_4d61:  nop 
	IL_4d62:  ldloc 4

	IL_4d66:  nop 
	IL_4d67:  nop 
	IL_4d68:  ldloc 1

	IL_4d6c:  nop 
	IL_4d6d:  nop 
	IL_4d6e:  and 
	IL_4d6f:  stloc 4

	IL_4d73:  nop 
	IL_4d74:  nop 
	IL_4d75:  ldloc 4

	IL_4d79:  nop 
	IL_4d7a:  nop 
	IL_4d7b:  ldc.i4 1
	IL_4d80:  beq IL_4d8a

	IL_4d85:  br IL_4e73

	IL_4d8a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::'.ctor'()
	IL_4d8f:  stloc 123

	IL_4d93:  nop 
	IL_4d94:  nop 
	IL_4d95:  ldloc 123

	IL_4d99:  nop 
	IL_4d9a:  nop 
	IL_4d9b:  ldarg 1

	IL_4d9f:  nop 
	IL_4da0:  nop 
	IL_4da1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4da6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4dab:  ldarg 1

	IL_4daf:  nop 
	IL_4db0:  nop 
	IL_4db1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4db6:  stloc 2

	IL_4dba:  nop 
	IL_4dbb:  nop 
	IL_4dbc:  ldc.i4 1
	IL_4dc1:  conv.u 
	IL_4dc2:  newarr [mscorlib]System.Char
	IL_4dc7:  stloc 3

	IL_4dcb:  nop 
	IL_4dcc:  nop 
	IL_4dcd:  ldloc 3

	IL_4dd1:  nop 
	IL_4dd2:  nop 
	IL_4dd3:  ldc.i4 0
	IL_4dd8:  conv.u 
	IL_4dd9:  ldstr "b"
	IL_4dde:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4de3:  stelem [mscorlib]System.Char
	IL_4de8:  ldloc 2

	IL_4dec:  nop 
	IL_4ded:  nop 
	IL_4dee:  ldloc 3

	IL_4df2:  nop 
	IL_4df3:  nop 
	IL_4df4:  callvirt instance string string::TrimEnd(char[])
	IL_4df9:  stloc 2

	IL_4dfd:  nop 
	IL_4dfe:  nop 
	IL_4dff:  ldloc 3

	IL_4e03:  nop 
	IL_4e04:  nop 
	IL_4e05:  ldc.i4 0
	IL_4e0a:  conv.u 
	IL_4e0b:  ldstr "u"
	IL_4e10:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4e15:  stelem [mscorlib]System.Char
	IL_4e1a:  ldloc 2

	IL_4e1e:  nop 
	IL_4e1f:  nop 
	IL_4e20:  ldloc 3

	IL_4e24:  nop 
	IL_4e25:  nop 
	IL_4e26:  callvirt instance string string::TrimEnd(char[])
	IL_4e2b:  stloc 2

	IL_4e2f:  nop 
	IL_4e30:  nop 
	IL_4e31:  ldloc 123

	IL_4e35:  nop 
	IL_4e36:  nop 
	IL_4e37:  ldloc 2

	IL_4e3b:  nop 
	IL_4e3c:  nop 
	IL_4e3d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4e42:  ldloc 123

	IL_4e46:  nop 
	IL_4e47:  nop 
	IL_4e48:  ldloc 123

	IL_4e4c:  nop 
	IL_4e4d:  nop 
	IL_4e4e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4e53:  call unsigned int8 class [mscorlib]System.Convert::ToByte(string)
	IL_4e58:  stfld unsigned int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::NumVal
	IL_4e5d:  ldloc 123

	IL_4e61:  nop 
	IL_4e62:  nop 
	IL_4e63:  starg 1

	IL_4e67:  nop 
	IL_4e68:  nop 
	IL_4e69:  br IL_5201

	IL_4e6e:  br IL_4e78

	IL_4e73:  br IL_4e78

	IL_4e78:  ldarg 1

	IL_4e7c:  nop 
	IL_4e7d:  nop 
	IL_4e7e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4e83:  ldstr "^(\\d)+(.)*$"
	IL_4e88:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4e8d:  stloc 1

	IL_4e91:  nop 
	IL_4e92:  nop 
	IL_4e93:  ldloc 1

	IL_4e97:  nop 
	IL_4e98:  nop 
	IL_4e99:  stloc 4

	IL_4e9d:  nop 
	IL_4e9e:  nop 
	IL_4e9f:  ldarg 1

	IL_4ea3:  nop 
	IL_4ea4:  nop 
	IL_4ea5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4eaa:  ldstr "^\\+(\\d)+(.)*$"
	IL_4eaf:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4eb4:  stloc 1

	IL_4eb8:  nop 
	IL_4eb9:  nop 
	IL_4eba:  ldloc 4

	IL_4ebe:  nop 
	IL_4ebf:  nop 
	IL_4ec0:  ldloc 1

	IL_4ec4:  nop 
	IL_4ec5:  nop 
	IL_4ec6:  or 
	IL_4ec7:  stloc 4

	IL_4ecb:  nop 
	IL_4ecc:  nop 
	IL_4ecd:  ldarg 1

	IL_4ed1:  nop 
	IL_4ed2:  nop 
	IL_4ed3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ed8:  ldstr "^-(\\d)+(.)*$"
	IL_4edd:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4ee2:  stloc 1

	IL_4ee6:  nop 
	IL_4ee7:  nop 
	IL_4ee8:  ldloc 4

	IL_4eec:  nop 
	IL_4eed:  nop 
	IL_4eee:  ldloc 1

	IL_4ef2:  nop 
	IL_4ef3:  nop 
	IL_4ef4:  or 
	IL_4ef5:  stloc 4

	IL_4ef9:  nop 
	IL_4efa:  nop 
	IL_4efb:  ldarg 1

	IL_4eff:  nop 
	IL_4f00:  nop 
	IL_4f01:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f06:  stloc 2

	IL_4f0a:  nop 
	IL_4f0b:  nop 
	IL_4f0c:  ldloc 2

	IL_4f10:  nop 
	IL_4f11:  nop 
	IL_4f12:  ldstr "b"
	IL_4f17:  callvirt instance bool string::EndsWith(string)
	IL_4f1c:  stloc 1

	IL_4f20:  nop 
	IL_4f21:  nop 
	IL_4f22:  ldloc 4

	IL_4f26:  nop 
	IL_4f27:  nop 
	IL_4f28:  ldloc 1

	IL_4f2c:  nop 
	IL_4f2d:  nop 
	IL_4f2e:  and 
	IL_4f2f:  stloc 4

	IL_4f33:  nop 
	IL_4f34:  nop 
	IL_4f35:  ldloc 4

	IL_4f39:  nop 
	IL_4f3a:  nop 
	IL_4f3b:  ldc.i4 1
	IL_4f40:  beq IL_4f4a

	IL_4f45:  br IL_5001

	IL_4f4a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::'.ctor'()
	IL_4f4f:  stloc 124

	IL_4f53:  nop 
	IL_4f54:  nop 
	IL_4f55:  ldloc 124

	IL_4f59:  nop 
	IL_4f5a:  nop 
	IL_4f5b:  ldarg 1

	IL_4f5f:  nop 
	IL_4f60:  nop 
	IL_4f61:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4f66:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4f6b:  ldarg 1

	IL_4f6f:  nop 
	IL_4f70:  nop 
	IL_4f71:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f76:  stloc 2

	IL_4f7a:  nop 
	IL_4f7b:  nop 
	IL_4f7c:  ldc.i4 1
	IL_4f81:  conv.u 
	IL_4f82:  newarr [mscorlib]System.Char
	IL_4f87:  stloc 3

	IL_4f8b:  nop 
	IL_4f8c:  nop 
	IL_4f8d:  ldloc 3

	IL_4f91:  nop 
	IL_4f92:  nop 
	IL_4f93:  ldc.i4 0
	IL_4f98:  conv.u 
	IL_4f99:  ldstr "b"
	IL_4f9e:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4fa3:  stelem [mscorlib]System.Char
	IL_4fa8:  ldloc 2

	IL_4fac:  nop 
	IL_4fad:  nop 
	IL_4fae:  ldloc 3

	IL_4fb2:  nop 
	IL_4fb3:  nop 
	IL_4fb4:  callvirt instance string string::TrimEnd(char[])
	IL_4fb9:  stloc 2

	IL_4fbd:  nop 
	IL_4fbe:  nop 
	IL_4fbf:  ldloc 124

	IL_4fc3:  nop 
	IL_4fc4:  nop 
	IL_4fc5:  ldloc 2

	IL_4fc9:  nop 
	IL_4fca:  nop 
	IL_4fcb:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4fd0:  ldloc 124

	IL_4fd4:  nop 
	IL_4fd5:  nop 
	IL_4fd6:  ldloc 124

	IL_4fda:  nop 
	IL_4fdb:  nop 
	IL_4fdc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4fe1:  call int8 class [mscorlib]System.Convert::ToSByte(string)
	IL_4fe6:  stfld int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_4feb:  ldloc 124

	IL_4fef:  nop 
	IL_4ff0:  nop 
	IL_4ff1:  starg 1

	IL_4ff5:  nop 
	IL_4ff6:  nop 
	IL_4ff7:  br IL_5201

	IL_4ffc:  br IL_5006

	IL_5001:  br IL_5006

	IL_5006:  ldarg 1

	IL_500a:  nop 
	IL_500b:  nop 
	IL_500c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5011:  ldstr "^(\\d)+(.)*$"
	IL_5016:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_501b:  stloc 1

	IL_501f:  nop 
	IL_5020:  nop 
	IL_5021:  ldloc 1

	IL_5025:  nop 
	IL_5026:  nop 
	IL_5027:  stloc 4

	IL_502b:  nop 
	IL_502c:  nop 
	IL_502d:  ldarg 1

	IL_5031:  nop 
	IL_5032:  nop 
	IL_5033:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5038:  ldstr "^\\+(\\d)+(.)*$"
	IL_503d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5042:  stloc 1

	IL_5046:  nop 
	IL_5047:  nop 
	IL_5048:  ldloc 4

	IL_504c:  nop 
	IL_504d:  nop 
	IL_504e:  ldloc 1

	IL_5052:  nop 
	IL_5053:  nop 
	IL_5054:  or 
	IL_5055:  stloc 4

	IL_5059:  nop 
	IL_505a:  nop 
	IL_505b:  ldarg 1

	IL_505f:  nop 
	IL_5060:  nop 
	IL_5061:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5066:  ldstr "^-(\\d)+(.)*$"
	IL_506b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5070:  stloc 1

	IL_5074:  nop 
	IL_5075:  nop 
	IL_5076:  ldloc 4

	IL_507a:  nop 
	IL_507b:  nop 
	IL_507c:  ldloc 1

	IL_5080:  nop 
	IL_5081:  nop 
	IL_5082:  or 
	IL_5083:  stloc 4

	IL_5087:  nop 
	IL_5088:  nop 
	IL_5089:  ldloc 4

	IL_508d:  nop 
	IL_508e:  nop 
	IL_508f:  ldc.i4 1
	IL_5094:  beq IL_509e

	IL_5099:  br IL_5112

	IL_509e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_50a3:  stloc 125

	IL_50a7:  nop 
	IL_50a8:  nop 
	IL_50a9:  ldloc 125

	IL_50ad:  nop 
	IL_50ae:  nop 
	IL_50af:  ldarg 1

	IL_50b3:  nop 
	IL_50b4:  nop 
	IL_50b5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_50ba:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_50bf:  ldarg 1

	IL_50c3:  nop 
	IL_50c4:  nop 
	IL_50c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_50ca:  stloc 2

	IL_50ce:  nop 
	IL_50cf:  nop 
	IL_50d0:  ldloc 125

	IL_50d4:  nop 
	IL_50d5:  nop 
	IL_50d6:  ldloc 2

	IL_50da:  nop 
	IL_50db:  nop 
	IL_50dc:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_50e1:  ldloc 125

	IL_50e5:  nop 
	IL_50e6:  nop 
	IL_50e7:  ldloc 125

	IL_50eb:  nop 
	IL_50ec:  nop 
	IL_50ed:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_50f2:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_50f7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_50fc:  ldloc 125

	IL_5100:  nop 
	IL_5101:  nop 
	IL_5102:  starg 1

	IL_5106:  nop 
	IL_5107:  nop 
	IL_5108:  br IL_5201

	IL_510d:  br IL_5117

	IL_5112:  br IL_5117

	IL_5117:  ldarg 1

	IL_511b:  nop 
	IL_511c:  nop 
	IL_511d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5122:  ldstr "^([a-zA-Z])+(.)*$"
	IL_5127:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_512c:  stloc 1

	IL_5130:  nop 
	IL_5131:  nop 
	IL_5132:  ldloc 1

	IL_5136:  nop 
	IL_5137:  nop 
	IL_5138:  stloc 4

	IL_513c:  nop 
	IL_513d:  nop 
	IL_513e:  ldarg 1

	IL_5142:  nop 
	IL_5143:  nop 
	IL_5144:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5149:  ldstr "^_(.)*([a-zA-Z])+(.)*$"
	IL_514e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5153:  stloc 1

	IL_5157:  nop 
	IL_5158:  nop 
	IL_5159:  ldloc 4

	IL_515d:  nop 
	IL_515e:  nop 
	IL_515f:  ldloc 1

	IL_5163:  nop 
	IL_5164:  nop 
	IL_5165:  or 
	IL_5166:  stloc 4

	IL_516a:  nop 
	IL_516b:  nop 
	IL_516c:  ldarg 1

	IL_5170:  nop 
	IL_5171:  nop 
	IL_5172:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_5177:  ldstr "^::(.)*([a-zA-Z])+(.)*$"
	IL_517c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_5181:  stloc 1

	IL_5185:  nop 
	IL_5186:  nop 
	IL_5187:  ldloc 4

	IL_518b:  nop 
	IL_518c:  nop 
	IL_518d:  ldloc 1

	IL_5191:  nop 
	IL_5192:  nop 
	IL_5193:  or 
	IL_5194:  stloc 4

	IL_5198:  nop 
	IL_5199:  nop 
	IL_519a:  ldloc 4

	IL_519e:  nop 
	IL_519f:  nop 
	IL_51a0:  ldc.i4 1
	IL_51a5:  beq IL_51af

	IL_51aa:  br IL_51fc

	IL_51af:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_51b4:  stloc 126

	IL_51b8:  nop 
	IL_51b9:  nop 
	IL_51ba:  ldloc 126

	IL_51be:  nop 
	IL_51bf:  nop 
	IL_51c0:  ldarg 1

	IL_51c4:  nop 
	IL_51c5:  nop 
	IL_51c6:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_51cb:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_51d0:  ldloc 126

	IL_51d4:  nop 
	IL_51d5:  nop 
	IL_51d6:  ldarg 1

	IL_51da:  nop 
	IL_51db:  nop 
	IL_51dc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_51e1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_51e6:  ldloc 126

	IL_51ea:  nop 
	IL_51eb:  nop 
	IL_51ec:  starg 1

	IL_51f0:  nop 
	IL_51f1:  nop 
	IL_51f2:  br IL_5201

	IL_51f7:  br IL_5201

	IL_51fc:  br IL_5201

	IL_5201:  ldarg 1

	IL_5205:  nop 
	IL_5206:  nop 
	IL_5207:  ret 
    } // end of method TokenOptimizer::Optimize

    // method line 10
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7594
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

    // method line 11
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr checkVarAs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0x75a8
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

    // method line 12
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok IdentToMNTok (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident idt, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok mnt)  cil managed 
    {
        // Method begins at RVA 0x7770
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

    // method line 13
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procMethodCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x78a4
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

    // method line 14
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procNewCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x7de0
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

    // method line 15
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procIdentArrayAccess (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x8454
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

    // method line 16
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procMtdArrayAccess (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x884c
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

    // method line 17
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x8c70
	// Code size 7776 (0x1e60)
	.maxstack 223
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_38,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_39,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral	V_40,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok	V_41,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_42,
		int32	V_43,
		int32	V_44,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_45,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_50,
		int32	V_51,
		int32	V_52,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_53,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_56)
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

	IL_00ef:  br IL_1d9d

	IL_00f4:  br IL_00fe

	IL_00f9:  br IL_00fe

	IL_00fe:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_0103:  ldc.i4 0
	IL_0108:  beq IL_0112

	IL_010d:  br IL_1924

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
	IL_02d4:  br IL_18f5

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
	IL_0476:  br IL_18f5

	IL_047b:  br IL_0485

	IL_0480:  br IL_0485

	IL_0485:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_048a:  ldc.i4 0
	IL_048f:  beq IL_0499

	IL_0494:  br IL_18f0

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
	IL_0594:  br IL_18f5

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

	IL_0666:  br IL_18f5

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

	IL_0828:  br IL_18f5

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

	IL_08e6:  br IL_18f5

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

	IL_09a4:  br IL_18f5

	IL_09a9:  br IL_09b3

	IL_09ae:  br IL_09b3

	IL_09b3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
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

	IL_09ef:  br IL_0a76

	IL_09f4:  ldc.i4 1
	IL_09f9:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_09fe:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_0a03:  ldc.i4 1
	IL_0a08:  beq IL_0a12

	IL_0a0d:  br IL_0a67

	IL_0a12:  ldarg 1

	IL_0a16:  nop 
	IL_0a17:  nop 
	IL_0a18:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0a1d:  ldloc 1

	IL_0a21:  nop 
	IL_0a22:  nop 
	IL_0a23:  conv.u 
	IL_0a24:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a29:  stloc 38

	IL_0a2d:  nop 
	IL_0a2e:  nop 
	IL_0a2f:  ldarg 1

	IL_0a33:  nop 
	IL_0a34:  nop 
	IL_0a35:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0a3a:  ldloc 1

	IL_0a3e:  nop 
	IL_0a3f:  nop 
	IL_0a40:  conv.u 
	IL_0a41:  ldloc 38

	IL_0a45:  nop 
	IL_0a46:  nop 
	IL_0a47:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateStringLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral)
	IL_0a4c:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a51:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0a56:  ldloc 1

	IL_0a5a:  nop 
	IL_0a5b:  nop 
	IL_0a5c:  stloc 2

	IL_0a60:  nop 
	IL_0a61:  nop 
	IL_0a62:  br IL_0a6c

	IL_0a67:  br IL_0a6c

	IL_0a6c:  br IL_18f5

	IL_0a71:  br IL_0a7b

	IL_0a76:  br IL_0a7b

	IL_0a7b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral
	IL_0a80:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a85:  stloc 25

	IL_0a89:  nop 
	IL_0a8a:  nop 
	IL_0a8b:  ldloc 25

	IL_0a8f:  nop 
	IL_0a90:  nop 
	IL_0a91:  ldloc 24

	IL_0a95:  nop 
	IL_0a96:  nop 
	IL_0a97:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a9c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0aa1:  stloc 26

	IL_0aa5:  nop 
	IL_0aa6:  nop 
	IL_0aa7:  ldloc 26

	IL_0aab:  nop 
	IL_0aac:  nop 
	IL_0aad:  ldc.i4 1
	IL_0ab2:  beq IL_0abc

	IL_0ab7:  br IL_0b34

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
	IL_0b05:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateBoolLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral)
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

	IL_0b2a:  br IL_18f5

	IL_0b2f:  br IL_0b39

	IL_0b34:  br IL_0b39

	IL_0b39:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
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
	IL_0bc3:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateNumLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral)
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

	IL_0be8:  br IL_18f5

	IL_0bed:  br IL_0bf7

	IL_0bf2:  br IL_0bf7

	IL_0bf7:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok
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

	IL_0c33:  br IL_0ecf

	IL_0c38:  ldarg 1

	IL_0c3c:  nop 
	IL_0c3d:  nop 
	IL_0c3e:  ldloc 1

	IL_0c42:  nop 
	IL_0c43:  nop 
	IL_0c44:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0c49:  ldloc 0

	IL_0c4d:  nop 
	IL_0c4e:  nop 
	IL_0c4f:  ldc.i4 1
	IL_0c54:  sub 
	IL_0c55:  stloc 0

	IL_0c59:  nop 
	IL_0c5a:  nop 
	IL_0c5b:  ldarg 1

	IL_0c5f:  nop 
	IL_0c60:  nop 
	IL_0c61:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0c66:  ldloc 1

	IL_0c6a:  nop 
	IL_0c6b:  nop 
	IL_0c6c:  conv.u 
	IL_0c6d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0c72:  stloc 9

	IL_0c76:  nop 
	IL_0c77:  nop 
	IL_0c78:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0c7d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0c82:  stloc 25

	IL_0c86:  nop 
	IL_0c87:  nop 
	IL_0c88:  ldloc 25

	IL_0c8c:  nop 
	IL_0c8d:  nop 
	IL_0c8e:  ldloc 9

	IL_0c92:  nop 
	IL_0c93:  nop 
	IL_0c94:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0c99:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0c9e:  stloc 26

	IL_0ca2:  nop 
	IL_0ca3:  nop 
	IL_0ca4:  ldloc 26

	IL_0ca8:  nop 
	IL_0ca9:  nop 
	IL_0caa:  ldc.i4 1
	IL_0caf:  beq IL_0d12

	IL_0cb4:  br IL_0cb9

	IL_0cb9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0cbe:  stloc 10

	IL_0cc2:  nop 
	IL_0cc3:  nop 
	IL_0cc4:  ldloc 10

	IL_0cc8:  nop 
	IL_0cc9:  nop 
	IL_0cca:  ldloc 9

	IL_0cce:  nop 
	IL_0ccf:  nop 
	IL_0cd0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0cd5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0cda:  ldloc 10

	IL_0cde:  nop 
	IL_0cdf:  nop 
	IL_0ce0:  ldloc 9

	IL_0ce4:  nop 
	IL_0ce5:  nop 
	IL_0ce6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ceb:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0cf0:  ldarg 1

	IL_0cf4:  nop 
	IL_0cf5:  nop 
	IL_0cf6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0cfb:  ldloc 1

	IL_0cff:  nop 
	IL_0d00:  nop 
	IL_0d01:  conv.u 
	IL_0d02:  ldloc 10

	IL_0d06:  nop 
	IL_0d07:  nop 
	IL_0d08:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d0d:  br IL_0d17

	IL_0d12:  br IL_0d17

	IL_0d17:  ldarg.0 
	IL_0d18:  ldarg 1

	IL_0d1c:  nop 
	IL_0d1d:  nop 
	IL_0d1e:  ldloc 1

	IL_0d22:  nop 
	IL_0d23:  nop 
	IL_0d24:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procNewCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_0d29:  starg 1

	IL_0d2d:  nop 
	IL_0d2e:  nop 
	IL_0d2f:  ldarg 1

	IL_0d33:  nop 
	IL_0d34:  nop 
	IL_0d35:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0d3a:  ldlen 
	IL_0d3b:  conv.i4 
	IL_0d3c:  ldc.i4 1
	IL_0d41:  sub 
	IL_0d42:  stloc 0

	IL_0d46:  nop 
	IL_0d47:  nop 
	IL_0d48:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok
	IL_0d4d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d52:  stloc 25

	IL_0d56:  nop 
	IL_0d57:  nop 
	IL_0d58:  ldloc 25

	IL_0d5c:  nop 
	IL_0d5d:  nop 
	IL_0d5e:  ldarg 1

	IL_0d62:  nop 
	IL_0d63:  nop 
	IL_0d64:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0d69:  ldloc 1

	IL_0d6d:  nop 
	IL_0d6e:  nop 
	IL_0d6f:  conv.u 
	IL_0d70:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d75:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d7a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0d7f:  stloc 26

	IL_0d83:  nop 
	IL_0d84:  nop 
	IL_0d85:  ldloc 26

	IL_0d89:  nop 
	IL_0d8a:  nop 
	IL_0d8b:  ldc.i4 1
	IL_0d90:  beq IL_0d9a

	IL_0d95:  br IL_0e87

	IL_0d9a:  ldarg 1

	IL_0d9e:  nop 
	IL_0d9f:  nop 
	IL_0da0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0da5:  ldloc 1

	IL_0da9:  nop 
	IL_0daa:  nop 
	IL_0dab:  conv.u 
	IL_0dac:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0db1:  stloc 41

	IL_0db5:  nop 
	IL_0db6:  nop 
	IL_0db7:  ldloc 41

	IL_0dbb:  nop 
	IL_0dbc:  nop 
	IL_0dbd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0dc2:  stloc 42

	IL_0dc6:  nop 
	IL_0dc7:  nop 
	IL_0dc8:  ldloc 42

	IL_0dcc:  nop 
	IL_0dcd:  nop 
	IL_0dce:  ldlen 
	IL_0dcf:  conv.i4 
	IL_0dd0:  ldc.i4 1
	IL_0dd5:  sub 
	IL_0dd6:  stloc 43

	IL_0dda:  nop 
	IL_0ddb:  nop 
	IL_0ddc:  ldc.i4 -1
	IL_0de1:  stloc 44

	IL_0de5:  nop 
	IL_0de6:  nop 
	IL_0de7:  ldloc 43

	IL_0deb:  nop 
	IL_0dec:  nop 
	IL_0ded:  ldc.i4 0
	IL_0df2:  blt IL_0dfc

	IL_0df7:  br IL_0e06

	IL_0dfc:  br IL_0e71

	IL_0e01:  br IL_0e0b

	IL_0e06:  br IL_0e0b

	IL_0e0b:  ldloc 44

	IL_0e0f:  nop 
	IL_0e10:  nop 
	IL_0e11:  ldc.i4 1
	IL_0e16:  add 
	IL_0e17:  stloc 44

	IL_0e1b:  nop 
	IL_0e1c:  nop 
	IL_0e1d:  ldloc 42

	IL_0e21:  nop 
	IL_0e22:  nop 
	IL_0e23:  ldloc 44

	IL_0e27:  nop 
	IL_0e28:  nop 
	IL_0e29:  conv.u 
	IL_0e2a:  ldarg.0 
	IL_0e2b:  ldloc 42

	IL_0e2f:  nop 
	IL_0e30:  nop 
	IL_0e31:  ldloc 44

	IL_0e35:  nop 
	IL_0e36:  nop 
	IL_0e37:  conv.u 
	IL_0e38:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0e3d:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0e42:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0e47:  ldloc 44

	IL_0e4b:  nop 
	IL_0e4c:  nop 
	IL_0e4d:  ldloc 43

	IL_0e51:  nop 
	IL_0e52:  nop 
	IL_0e53:  beq IL_0e5d

	IL_0e58:  br IL_0e67

	IL_0e5d:  br IL_0e71

	IL_0e62:  br IL_0e71

	IL_0e67:  br IL_0e0b

	IL_0e6c:  br IL_0e71

	IL_0e71:  ldloc 41

	IL_0e75:  nop 
	IL_0e76:  nop 
	IL_0e77:  ldloc 42

	IL_0e7b:  nop 
	IL_0e7c:  nop 
	IL_0e7d:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0e82:  br IL_0ec5

	IL_0e87:  ldarg 1

	IL_0e8b:  nop 
	IL_0e8c:  nop 
	IL_0e8d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0e92:  ldloc 1

	IL_0e96:  nop 
	IL_0e97:  nop 
	IL_0e98:  conv.u 
	IL_0e99:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0e9e:  stloc 45

	IL_0ea2:  nop 
	IL_0ea3:  nop 
	IL_0ea4:  ldloc 45

	IL_0ea8:  nop 
	IL_0ea9:  nop 
	IL_0eaa:  ldarg.0 
	IL_0eab:  ldloc 45

	IL_0eaf:  nop 
	IL_0eb0:  nop 
	IL_0eb1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_0eb6:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0ebb:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_0ec0:  br IL_0ec5

	IL_0ec5:  br IL_18f5

	IL_0eca:  br IL_0ed4

	IL_0ecf:  br IL_0ed4

	IL_0ed4:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok
	IL_0ed9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0ede:  stloc 25

	IL_0ee2:  nop 
	IL_0ee3:  nop 
	IL_0ee4:  ldloc 25

	IL_0ee8:  nop 
	IL_0ee9:  nop 
	IL_0eea:  ldloc 24

	IL_0eee:  nop 
	IL_0eef:  nop 
	IL_0ef0:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0ef5:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0efa:  stloc 26

	IL_0efe:  nop 
	IL_0eff:  nop 
	IL_0f00:  ldloc 26

	IL_0f04:  nop 
	IL_0f05:  nop 
	IL_0f06:  ldc.i4 1
	IL_0f0b:  beq IL_0f15

	IL_0f10:  br IL_1048

	IL_0f15:  ldarg 1

	IL_0f19:  nop 
	IL_0f1a:  nop 
	IL_0f1b:  ldloc 1

	IL_0f1f:  nop 
	IL_0f20:  nop 
	IL_0f21:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0f26:  ldloc 0

	IL_0f2a:  nop 
	IL_0f2b:  nop 
	IL_0f2c:  ldc.i4 1
	IL_0f31:  sub 
	IL_0f32:  stloc 0

	IL_0f36:  nop 
	IL_0f37:  nop 
	IL_0f38:  ldarg 1

	IL_0f3c:  nop 
	IL_0f3d:  nop 
	IL_0f3e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0f43:  ldloc 1

	IL_0f47:  nop 
	IL_0f48:  nop 
	IL_0f49:  conv.u 
	IL_0f4a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0f4f:  stloc 11

	IL_0f53:  nop 
	IL_0f54:  nop 
	IL_0f55:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0f5a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0f5f:  stloc 25

	IL_0f63:  nop 
	IL_0f64:  nop 
	IL_0f65:  ldloc 25

	IL_0f69:  nop 
	IL_0f6a:  nop 
	IL_0f6b:  ldloc 11

	IL_0f6f:  nop 
	IL_0f70:  nop 
	IL_0f71:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0f76:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0f7b:  stloc 26

	IL_0f7f:  nop 
	IL_0f80:  nop 
	IL_0f81:  ldloc 26

	IL_0f85:  nop 
	IL_0f86:  nop 
	IL_0f87:  ldc.i4 1
	IL_0f8c:  beq IL_0fef

	IL_0f91:  br IL_0f96

	IL_0f96:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0f9b:  stloc 12

	IL_0f9f:  nop 
	IL_0fa0:  nop 
	IL_0fa1:  ldloc 12

	IL_0fa5:  nop 
	IL_0fa6:  nop 
	IL_0fa7:  ldloc 11

	IL_0fab:  nop 
	IL_0fac:  nop 
	IL_0fad:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0fb2:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0fb7:  ldloc 12

	IL_0fbb:  nop 
	IL_0fbc:  nop 
	IL_0fbd:  ldloc 11

	IL_0fc1:  nop 
	IL_0fc2:  nop 
	IL_0fc3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0fc8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0fcd:  ldarg 1

	IL_0fd1:  nop 
	IL_0fd2:  nop 
	IL_0fd3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0fd8:  ldloc 1

	IL_0fdc:  nop 
	IL_0fdd:  nop 
	IL_0fde:  conv.u 
	IL_0fdf:  ldloc 12

	IL_0fe3:  nop 
	IL_0fe4:  nop 
	IL_0fe5:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0fea:  br IL_0ff4

	IL_0fef:  br IL_0ff4

	IL_0ff4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::'.ctor'()
	IL_0ff9:  stloc 46

	IL_0ffd:  nop 
	IL_0ffe:  nop 
	IL_0fff:  ldloc 46

	IL_1003:  nop 
	IL_1004:  nop 
	IL_1005:  ldarg 1

	IL_1009:  nop 
	IL_100a:  nop 
	IL_100b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1010:  ldloc 1

	IL_1014:  nop 
	IL_1015:  nop 
	IL_1016:  conv.u 
	IL_1017:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_101c:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_1021:  ldarg 1

	IL_1025:  nop 
	IL_1026:  nop 
	IL_1027:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_102c:  ldloc 1

	IL_1030:  nop 
	IL_1031:  nop 
	IL_1032:  conv.u 
	IL_1033:  ldloc 46

	IL_1037:  nop 
	IL_1038:  nop 
	IL_1039:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_103e:  br IL_18f5

	IL_1043:  br IL_104d

	IL_1048:  br IL_104d

	IL_104d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrTok
	IL_1052:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1057:  stloc 25

	IL_105b:  nop 
	IL_105c:  nop 
	IL_105d:  ldloc 25

	IL_1061:  nop 
	IL_1062:  nop 
	IL_1063:  ldloc 24

	IL_1067:  nop 
	IL_1068:  nop 
	IL_1069:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_106e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1073:  stloc 26

	IL_1077:  nop 
	IL_1078:  nop 
	IL_1079:  ldloc 26

	IL_107d:  nop 
	IL_107e:  nop 
	IL_107f:  ldc.i4 1
	IL_1084:  beq IL_108e

	IL_1089:  br IL_120c

	IL_108e:  ldarg 1

	IL_1092:  nop 
	IL_1093:  nop 
	IL_1094:  ldloc 1

	IL_1098:  nop 
	IL_1099:  nop 
	IL_109a:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_109f:  ldloc 0

	IL_10a3:  nop 
	IL_10a4:  nop 
	IL_10a5:  ldc.i4 1
	IL_10aa:  sub 
	IL_10ab:  stloc 0

	IL_10af:  nop 
	IL_10b0:  nop 
	IL_10b1:  ldarg 1

	IL_10b5:  nop 
	IL_10b6:  nop 
	IL_10b7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_10bc:  ldloc 1

	IL_10c0:  nop 
	IL_10c1:  nop 
	IL_10c2:  conv.u 
	IL_10c3:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_10c8:  stloc 24

	IL_10cc:  nop 
	IL_10cd:  nop 
	IL_10ce:  ldarg 1

	IL_10d2:  nop 
	IL_10d3:  nop 
	IL_10d4:  ldloc 1

	IL_10d8:  nop 
	IL_10d9:  nop 
	IL_10da:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_10df:  ldloc 0

	IL_10e3:  nop 
	IL_10e4:  nop 
	IL_10e5:  ldc.i4 1
	IL_10ea:  sub 
	IL_10eb:  stloc 0

	IL_10ef:  nop 
	IL_10f0:  nop 
	IL_10f1:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_10f6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_10fb:  stloc 25

	IL_10ff:  nop 
	IL_1100:  nop 
	IL_1101:  ldloc 25

	IL_1105:  nop 
	IL_1106:  nop 
	IL_1107:  ldloc 24

	IL_110b:  nop 
	IL_110c:  nop 
	IL_110d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1112:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1117:  stloc 26

	IL_111b:  nop 
	IL_111c:  nop 
	IL_111d:  ldloc 26

	IL_1121:  nop 
	IL_1122:  nop 
	IL_1123:  ldc.i4 1
	IL_1128:  beq IL_116e

	IL_112d:  br IL_1132

	IL_1132:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_1137:  stloc 17

	IL_113b:  nop 
	IL_113c:  nop 
	IL_113d:  ldloc 17

	IL_1141:  nop 
	IL_1142:  nop 
	IL_1143:  ldloc 24

	IL_1147:  nop 
	IL_1148:  nop 
	IL_1149:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_114e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1153:  ldloc 17

	IL_1157:  nop 
	IL_1158:  nop 
	IL_1159:  ldloc 24

	IL_115d:  nop 
	IL_115e:  nop 
	IL_115f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1164:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1169:  br IL_117f

	IL_116e:  ldloc 24

	IL_1172:  nop 
	IL_1173:  nop 
	IL_1174:  stloc 17

	IL_1178:  nop 
	IL_1179:  nop 
	IL_117a:  br IL_117f

	IL_117f:  ldarg 1

	IL_1183:  nop 
	IL_1184:  nop 
	IL_1185:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_118a:  ldloc 1

	IL_118e:  nop 
	IL_118f:  nop 
	IL_1190:  conv.u 
	IL_1191:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1196:  stloc 15

	IL_119a:  nop 
	IL_119b:  nop 
	IL_119c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::'.ctor'()
	IL_11a1:  stloc 47

	IL_11a5:  nop 
	IL_11a6:  nop 
	IL_11a7:  ldloc 47

	IL_11ab:  nop 
	IL_11ac:  nop 
	IL_11ad:  ldloc 17

	IL_11b1:  nop 
	IL_11b2:  nop 
	IL_11b3:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_11b8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_11bd:  stloc 16

	IL_11c1:  nop 
	IL_11c2:  nop 
	IL_11c3:  ldloc 16

	IL_11c7:  nop 
	IL_11c8:  nop 
	IL_11c9:  ldloc 15

	IL_11cd:  nop 
	IL_11ce:  nop 
	IL_11cf:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_11d4:  ldloc 47

	IL_11d8:  nop 
	IL_11d9:  nop 
	IL_11da:  ldloc 16

	IL_11de:  nop 
	IL_11df:  nop 
	IL_11e0:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_11e5:  ldarg 1

	IL_11e9:  nop 
	IL_11ea:  nop 
	IL_11eb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_11f0:  ldloc 1

	IL_11f4:  nop 
	IL_11f5:  nop 
	IL_11f6:  conv.u 
	IL_11f7:  ldloc 47

	IL_11fb:  nop 
	IL_11fc:  nop 
	IL_11fd:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1202:  br IL_18f5

	IL_1207:  br IL_1211

	IL_120c:  br IL_1211

	IL_1211:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok
	IL_1216:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_121b:  stloc 25

	IL_121f:  nop 
	IL_1220:  nop 
	IL_1221:  ldloc 25

	IL_1225:  nop 
	IL_1226:  nop 
	IL_1227:  ldloc 24

	IL_122b:  nop 
	IL_122c:  nop 
	IL_122d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1232:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1237:  stloc 26

	IL_123b:  nop 
	IL_123c:  nop 
	IL_123d:  ldloc 26

	IL_1241:  nop 
	IL_1242:  nop 
	IL_1243:  ldc.i4 1
	IL_1248:  beq IL_1252

	IL_124d:  br IL_1454

	IL_1252:  ldarg 1

	IL_1256:  nop 
	IL_1257:  nop 
	IL_1258:  ldloc 1

	IL_125c:  nop 
	IL_125d:  nop 
	IL_125e:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1263:  ldloc 0

	IL_1267:  nop 
	IL_1268:  nop 
	IL_1269:  ldc.i4 1
	IL_126e:  sub 
	IL_126f:  stloc 0

	IL_1273:  nop 
	IL_1274:  nop 
	IL_1275:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_127a:  stloc 14

	IL_127e:  nop 
	IL_127f:  nop 
	IL_1280:  ldarg.0 
	IL_1281:  ldarg 1

	IL_1285:  nop 
	IL_1286:  nop 
	IL_1287:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_128c:  ldloc 1

	IL_1290:  nop 
	IL_1291:  nop 
	IL_1292:  conv.u 
	IL_1293:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1298:  ldloc 14

	IL_129c:  nop 
	IL_129d:  nop 
	IL_129e:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok class dylan.NET.Tokenizer.Parser.ExprOptimizer::IdentToMNTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok)
	IL_12a3:  stloc 14

	IL_12a7:  nop 
	IL_12a8:  nop 
	IL_12a9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::'.ctor'()
	IL_12ae:  stloc 48

	IL_12b2:  nop 
	IL_12b3:  nop 
	IL_12b4:  ldloc 48

	IL_12b8:  nop 
	IL_12b9:  nop 
	IL_12ba:  ldloc 14

	IL_12be:  nop 
	IL_12bf:  nop 
	IL_12c0:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_12c5:  ldarg 1

	IL_12c9:  nop 
	IL_12ca:  nop 
	IL_12cb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_12d0:  ldloc 1

	IL_12d4:  nop 
	IL_12d5:  nop 
	IL_12d6:  conv.u 
	IL_12d7:  ldloc 48

	IL_12db:  nop 
	IL_12dc:  nop 
	IL_12dd:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_12e2:  ldloc 1

	IL_12e6:  nop 
	IL_12e7:  nop 
	IL_12e8:  ldc.i4 1
	IL_12ed:  add 
	IL_12ee:  stloc 1

	IL_12f2:  nop 
	IL_12f3:  nop 
	IL_12f4:  ldloc 1

	IL_12f8:  nop 
	IL_12f9:  nop 
	IL_12fa:  ldloc 0

	IL_12fe:  nop 
	IL_12ff:  nop 
	IL_1300:  ble IL_130a

	IL_1305:  br IL_1445

	IL_130a:  ldarg 1

	IL_130e:  nop 
	IL_130f:  nop 
	IL_1310:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1315:  ldloc 1

	IL_1319:  nop 
	IL_131a:  nop 
	IL_131b:  conv.u 
	IL_131c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1321:  stloc 24

	IL_1325:  nop 
	IL_1326:  nop 
	IL_1327:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_132c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1331:  stloc 25

	IL_1335:  nop 
	IL_1336:  nop 
	IL_1337:  ldloc 25

	IL_133b:  nop 
	IL_133c:  nop 
	IL_133d:  ldloc 24

	IL_1341:  nop 
	IL_1342:  nop 
	IL_1343:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1348:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_134d:  stloc 26

	IL_1351:  nop 
	IL_1352:  nop 
	IL_1353:  ldloc 26

	IL_1357:  nop 
	IL_1358:  nop 
	IL_1359:  ldc.i4 1
	IL_135e:  beq IL_1368

	IL_1363:  br IL_143b

	IL_1368:  ldarg 1

	IL_136c:  nop 
	IL_136d:  nop 
	IL_136e:  ldloc 1

	IL_1372:  nop 
	IL_1373:  nop 
	IL_1374:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1379:  ldloc 0

	IL_137d:  nop 
	IL_137e:  nop 
	IL_137f:  ldc.i4 1
	IL_1384:  sub 
	IL_1385:  stloc 0

	IL_1389:  nop 
	IL_138a:  nop 
	IL_138b:  ldloc 1

	IL_138f:  nop 
	IL_1390:  nop 
	IL_1391:  ldloc 0

	IL_1395:  nop 
	IL_1396:  nop 
	IL_1397:  ble IL_13a1

	IL_139c:  br IL_1431

	IL_13a1:  ldarg 1

	IL_13a5:  nop 
	IL_13a6:  nop 
	IL_13a7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_13ac:  ldloc 1

	IL_13b0:  nop 
	IL_13b1:  nop 
	IL_13b2:  conv.u 
	IL_13b3:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_13b8:  stloc 24

	IL_13bc:  nop 
	IL_13bd:  nop 
	IL_13be:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_13c3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_13c8:  stloc 25

	IL_13cc:  nop 
	IL_13cd:  nop 
	IL_13ce:  ldloc 25

	IL_13d2:  nop 
	IL_13d3:  nop 
	IL_13d4:  ldloc 24

	IL_13d8:  nop 
	IL_13d9:  nop 
	IL_13da:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_13df:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_13e4:  stloc 26

	IL_13e8:  nop 
	IL_13e9:  nop 
	IL_13ea:  ldloc 26

	IL_13ee:  nop 
	IL_13ef:  nop 
	IL_13f0:  ldc.i4 1
	IL_13f5:  beq IL_13ff

	IL_13fa:  br IL_1427

	IL_13ff:  ldarg 1

	IL_1403:  nop 
	IL_1404:  nop 
	IL_1405:  ldloc 1

	IL_1409:  nop 
	IL_140a:  nop 
	IL_140b:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1410:  ldloc 0

	IL_1414:  nop 
	IL_1415:  nop 
	IL_1416:  ldc.i4 1
	IL_141b:  sub 
	IL_141c:  stloc 0

	IL_1420:  nop 
	IL_1421:  nop 
	IL_1422:  br IL_142c

	IL_1427:  br IL_142c

	IL_142c:  br IL_1436

	IL_1431:  br IL_1436

	IL_1436:  br IL_1440

	IL_143b:  br IL_1440

	IL_1440:  br IL_144a

	IL_1445:  br IL_144a

	IL_144a:  br IL_18f5

	IL_144f:  br IL_1459

	IL_1454:  br IL_1459

	IL_1459:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_145e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1463:  stloc 25

	IL_1467:  nop 
	IL_1468:  nop 
	IL_1469:  ldloc 25

	IL_146d:  nop 
	IL_146e:  nop 
	IL_146f:  ldloc 24

	IL_1473:  nop 
	IL_1474:  nop 
	IL_1475:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_147a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_147f:  stloc 26

	IL_1483:  nop 
	IL_1484:  nop 
	IL_1485:  ldloc 26

	IL_1489:  nop 
	IL_148a:  nop 
	IL_148b:  ldc.i4 1
	IL_1490:  beq IL_149a

	IL_1495:  br IL_1691

	IL_149a:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_149f:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_14a4:  or 
	IL_14a5:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_14aa:  or 
	IL_14ab:  stloc 26

	IL_14af:  nop 
	IL_14b0:  nop 
	IL_14b1:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_14b6:  ldc.i4 1
	IL_14bb:  beq IL_14c5

	IL_14c0:  br IL_1661

	IL_14c5:  ldc.i4 0
	IL_14ca:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_14cf:  ldloc 26

	IL_14d3:  nop 
	IL_14d4:  nop 
	IL_14d5:  ldc.i4 1
	IL_14da:  beq IL_14e4

	IL_14df:  br IL_14f4

	IL_14e4:  ldc.i4 1
	IL_14e9:  stloc 4

	IL_14ed:  nop 
	IL_14ee:  nop 
	IL_14ef:  br IL_14f9

	IL_14f4:  br IL_14f9

	IL_14f9:  ldc.i4 1
	IL_14fe:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1503:  ldarg.0 
	IL_1504:  ldarg 1

	IL_1508:  nop 
	IL_1509:  nop 
	IL_150a:  ldloc 1

	IL_150e:  nop 
	IL_150f:  nop 
	IL_1510:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMethodCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_1515:  starg 1

	IL_1519:  nop 
	IL_151a:  nop 
	IL_151b:  ldloc 1

	IL_151f:  nop 
	IL_1520:  nop 
	IL_1521:  ldc.i4 1
	IL_1526:  sub 
	IL_1527:  stloc 1

	IL_152b:  nop 
	IL_152c:  nop 
	IL_152d:  ldarg 1

	IL_1531:  nop 
	IL_1532:  nop 
	IL_1533:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1538:  ldlen 
	IL_1539:  conv.i4 
	IL_153a:  ldc.i4 1
	IL_153f:  sub 
	IL_1540:  stloc 0

	IL_1544:  nop 
	IL_1545:  nop 
	IL_1546:  ldarg 1

	IL_154a:  nop 
	IL_154b:  nop 
	IL_154c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1551:  ldloc 1

	IL_1555:  nop 
	IL_1556:  nop 
	IL_1557:  conv.u 
	IL_1558:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_155d:  stloc 49

	IL_1561:  nop 
	IL_1562:  nop 
	IL_1563:  ldloc 49

	IL_1567:  nop 
	IL_1568:  nop 
	IL_1569:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_156e:  stloc 50

	IL_1572:  nop 
	IL_1573:  nop 
	IL_1574:  ldloc 50

	IL_1578:  nop 
	IL_1579:  nop 
	IL_157a:  ldlen 
	IL_157b:  conv.i4 
	IL_157c:  ldc.i4 1
	IL_1581:  sub 
	IL_1582:  stloc 51

	IL_1586:  nop 
	IL_1587:  nop 
	IL_1588:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_158d:  stloc 5

	IL_1591:  nop 
	IL_1592:  nop 
	IL_1593:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1598:  stloc 6

	IL_159c:  nop 
	IL_159d:  nop 
	IL_159e:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_15a3:  stloc 7

	IL_15a7:  nop 
	IL_15a8:  nop 
	IL_15a9:  ldc.i4 -1
	IL_15ae:  stloc 52

	IL_15b2:  nop 
	IL_15b3:  nop 
	IL_15b4:  ldloc 51

	IL_15b8:  nop 
	IL_15b9:  nop 
	IL_15ba:  ldc.i4 0
	IL_15bf:  blt IL_15c9

	IL_15c4:  br IL_15d3

	IL_15c9:  br IL_165c

	IL_15ce:  br IL_15d8

	IL_15d3:  br IL_15d8

	IL_15d8:  ldloc 52

	IL_15dc:  nop 
	IL_15dd:  nop 
	IL_15de:  ldc.i4 1
	IL_15e3:  add 
	IL_15e4:  stloc 52

	IL_15e8:  nop 
	IL_15e9:  nop 
	IL_15ea:  ldc.i4 0
	IL_15ef:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_15f4:  ldc.i4 0
	IL_15f9:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_15fe:  ldc.i4 0
	IL_1603:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1608:  ldloc 50

	IL_160c:  nop 
	IL_160d:  nop 
	IL_160e:  ldloc 52

	IL_1612:  nop 
	IL_1613:  nop 
	IL_1614:  conv.u 
	IL_1615:  ldarg.0 
	IL_1616:  ldloc 50

	IL_161a:  nop 
	IL_161b:  nop 
	IL_161c:  ldloc 52

	IL_1620:  nop 
	IL_1621:  nop 
	IL_1622:  conv.u 
	IL_1623:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1628:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_162d:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1632:  ldloc 52

	IL_1636:  nop 
	IL_1637:  nop 
	IL_1638:  ldloc 51

	IL_163c:  nop 
	IL_163d:  nop 
	IL_163e:  beq IL_1648

	IL_1643:  br IL_1652

	IL_1648:  br IL_165c

	IL_164d:  br IL_165c

	IL_1652:  br IL_15d8

	IL_1657:  br IL_165c

	IL_165c:  br IL_1666

	IL_1661:  br IL_1666

	IL_1666:  ldloc 5

	IL_166a:  nop 
	IL_166b:  nop 
	IL_166c:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1671:  ldloc 6

	IL_1675:  nop 
	IL_1676:  nop 
	IL_1677:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_167c:  ldloc 7

	IL_1680:  nop 
	IL_1681:  nop 
	IL_1682:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1687:  br IL_18f5

	IL_168c:  br IL_1696

	IL_1691:  br IL_1696

	IL_1696:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
	IL_169b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_16a0:  stloc 25

	IL_16a4:  nop 
	IL_16a5:  nop 
	IL_16a6:  ldloc 25

	IL_16aa:  nop 
	IL_16ab:  nop 
	IL_16ac:  ldloc 24

	IL_16b0:  nop 
	IL_16b1:  nop 
	IL_16b2:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_16b7:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_16bc:  stloc 26

	IL_16c0:  nop 
	IL_16c1:  nop 
	IL_16c2:  ldloc 26

	IL_16c6:  nop 
	IL_16c7:  nop 
	IL_16c8:  ldc.i4 1
	IL_16cd:  beq IL_16d7

	IL_16d2:  br IL_18a8

	IL_16d7:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_16dc:  ldc.i4 1
	IL_16e1:  beq IL_16eb

	IL_16e6:  br IL_177d

	IL_16eb:  ldc.i4 0
	IL_16f0:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_16f5:  ldarg.0 
	IL_16f6:  ldarg 1

	IL_16fa:  nop 
	IL_16fb:  nop 
	IL_16fc:  ldloc 1

	IL_1700:  nop 
	IL_1701:  nop 
	IL_1702:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procIdentArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_1707:  starg 1

	IL_170b:  nop 
	IL_170c:  nop 
	IL_170d:  ldloc 1

	IL_1711:  nop 
	IL_1712:  nop 
	IL_1713:  ldc.i4 1
	IL_1718:  sub 
	IL_1719:  stloc 1

	IL_171d:  nop 
	IL_171e:  nop 
	IL_171f:  ldarg 1

	IL_1723:  nop 
	IL_1724:  nop 
	IL_1725:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_172a:  ldlen 
	IL_172b:  conv.i4 
	IL_172c:  ldc.i4 1
	IL_1731:  sub 
	IL_1732:  stloc 0

	IL_1736:  nop 
	IL_1737:  nop 
	IL_1738:  ldarg 1

	IL_173c:  nop 
	IL_173d:  nop 
	IL_173e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1743:  ldloc 1

	IL_1747:  nop 
	IL_1748:  nop 
	IL_1749:  conv.u 
	IL_174a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_174f:  stloc 53

	IL_1753:  nop 
	IL_1754:  nop 
	IL_1755:  ldloc 53

	IL_1759:  nop 
	IL_175a:  nop 
	IL_175b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_1760:  stloc 54

	IL_1764:  nop 
	IL_1765:  nop 
	IL_1766:  ldarg.0 
	IL_1767:  ldloc 54

	IL_176b:  nop 
	IL_176c:  nop 
	IL_176d:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1772:  stloc 54

	IL_1776:  nop 
	IL_1777:  nop 
	IL_1778:  br IL_189e

	IL_177d:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1782:  ldc.i4 1
	IL_1787:  beq IL_1791

	IL_178c:  br IL_1894

	IL_1791:  ldc.i4 0
	IL_1796:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_179b:  ldarg.0 
	IL_179c:  ldarg 1

	IL_17a0:  nop 
	IL_17a1:  nop 
	IL_17a2:  ldloc 1

	IL_17a6:  nop 
	IL_17a7:  nop 
	IL_17a8:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMtdArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_17ad:  starg 1

	IL_17b1:  nop 
	IL_17b2:  nop 
	IL_17b3:  ldloc 1

	IL_17b7:  nop 
	IL_17b8:  nop 
	IL_17b9:  ldc.i4 1
	IL_17be:  sub 
	IL_17bf:  stloc 1

	IL_17c3:  nop 
	IL_17c4:  nop 
	IL_17c5:  ldarg 1

	IL_17c9:  nop 
	IL_17ca:  nop 
	IL_17cb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_17d0:  ldlen 
	IL_17d1:  conv.i4 
	IL_17d2:  ldc.i4 1
	IL_17d7:  sub 
	IL_17d8:  stloc 0

	IL_17dc:  nop 
	IL_17dd:  nop 
	IL_17de:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_17e3:  stloc 5

	IL_17e7:  nop 
	IL_17e8:  nop 
	IL_17e9:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_17ee:  stloc 6

	IL_17f2:  nop 
	IL_17f3:  nop 
	IL_17f4:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_17f9:  stloc 7

	IL_17fd:  nop 
	IL_17fe:  nop 
	IL_17ff:  ldarg 1

	IL_1803:  nop 
	IL_1804:  nop 
	IL_1805:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_180a:  ldloc 1

	IL_180e:  nop 
	IL_180f:  nop 
	IL_1810:  conv.u 
	IL_1811:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1816:  stloc 55

	IL_181a:  nop 
	IL_181b:  nop 
	IL_181c:  ldloc 55

	IL_1820:  nop 
	IL_1821:  nop 
	IL_1822:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1827:  stloc 56

	IL_182b:  nop 
	IL_182c:  nop 
	IL_182d:  ldloc 56

	IL_1831:  nop 
	IL_1832:  nop 
	IL_1833:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_1838:  stloc 54

	IL_183c:  nop 
	IL_183d:  nop 
	IL_183e:  ldc.i4 0
	IL_1843:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1848:  ldc.i4 0
	IL_184d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1852:  ldc.i4 0
	IL_1857:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_185c:  ldarg.0 
	IL_185d:  ldloc 54

	IL_1861:  nop 
	IL_1862:  nop 
	IL_1863:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1868:  stloc 54

	IL_186c:  nop 
	IL_186d:  nop 
	IL_186e:  ldloc 5

	IL_1872:  nop 
	IL_1873:  nop 
	IL_1874:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1879:  ldloc 6

	IL_187d:  nop 
	IL_187e:  nop 
	IL_187f:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1884:  ldloc 7

	IL_1888:  nop 
	IL_1889:  nop 
	IL_188a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_188f:  br IL_1899

	IL_1894:  br IL_1899

	IL_1899:  br IL_189e

	IL_189e:  br IL_18f5

	IL_18a3:  br IL_18ad

	IL_18a8:  br IL_18ad

	IL_18ad:  ldloc 1

	IL_18b1:  nop 
	IL_18b2:  nop 
	IL_18b3:  ldloc 2

	IL_18b7:  nop 
	IL_18b8:  nop 
	IL_18b9:  bgt IL_18c3

	IL_18be:  br IL_18e6

	IL_18c3:  ldc.i4 0
	IL_18c8:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_18cd:  ldc.i4 0
	IL_18d2:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_18d7:  ldc.i4 0
	IL_18dc:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_18e1:  br IL_18eb

	IL_18e6:  br IL_18eb

	IL_18eb:  br IL_18f5

	IL_18f0:  br IL_18f5

	IL_18f5:  ldloc 1

	IL_18f9:  nop 
	IL_18fa:  nop 
	IL_18fb:  ldloc 0

	IL_18ff:  nop 
	IL_1900:  nop 
	IL_1901:  bge IL_190b

	IL_1906:  br IL_1915

	IL_190b:  br IL_1d9d

	IL_1910:  br IL_191f

	IL_1915:  br IL_00fe

	IL_191a:  br IL_191f

	IL_191f:  br IL_1d9d

	IL_1924:  ldloc 1

	IL_1928:  nop 
	IL_1929:  nop 
	IL_192a:  ldc.i4 1
	IL_192f:  sub 
	IL_1930:  stloc 1

	IL_1934:  nop 
	IL_1935:  nop 
	IL_1936:  ldarg 1

	IL_193a:  nop 
	IL_193b:  nop 
	IL_193c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1941:  ldloc 1

	IL_1945:  nop 
	IL_1946:  nop 
	IL_1947:  conv.u 
	IL_1948:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_194d:  stloc 8

	IL_1951:  nop 
	IL_1952:  nop 
	IL_1953:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_1958:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_195d:  stloc 25

	IL_1961:  nop 
	IL_1962:  nop 
	IL_1963:  ldloc 25

	IL_1967:  nop 
	IL_1968:  nop 
	IL_1969:  ldloc 8

	IL_196d:  nop 
	IL_196e:  nop 
	IL_196f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1974:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1979:  stloc 26

	IL_197d:  nop 
	IL_197e:  nop 
	IL_197f:  ldloc 26

	IL_1983:  nop 
	IL_1984:  nop 
	IL_1985:  ldc.i4 1
	IL_198a:  beq IL_1994

	IL_198f:  br IL_1abc

	IL_1994:  ldloc 8

	IL_1998:  nop 
	IL_1999:  nop 
	IL_199a:  stloc 19

	IL_199e:  nop 
	IL_199f:  nop 
	IL_19a0:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_19a5:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_19aa:  or 
	IL_19ab:  stloc 26

	IL_19af:  nop 
	IL_19b0:  nop 
	IL_19b1:  ldloc 26

	IL_19b5:  nop 
	IL_19b6:  nop 
	IL_19b7:  ldc.i4 1
	IL_19bc:  beq IL_19c6

	IL_19c1:  br IL_1a5d

	IL_19c6:  ldc.i4 0
	IL_19cb:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_19d0:  ldc.i4 0
	IL_19d5:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_19da:  ldloc 1

	IL_19de:  nop 
	IL_19df:  nop 
	IL_19e0:  ldc.i4 1
	IL_19e5:  add 
	IL_19e6:  stloc 23

	IL_19ea:  nop 
	IL_19eb:  nop 
	IL_19ec:  ldarg 1

	IL_19f0:  nop 
	IL_19f1:  nop 
	IL_19f2:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_19f7:  ldloc 23

	IL_19fb:  nop 
	IL_19fc:  nop 
	IL_19fd:  conv.u 
	IL_19fe:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1a03:  stloc 18

	IL_1a07:  nop 
	IL_1a08:  nop 
	IL_1a09:  ldloc 19

	IL_1a0d:  nop 
	IL_1a0e:  nop 
	IL_1a0f:  ldc.i4 1
	IL_1a14:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1a19:  ldloc 19

	IL_1a1d:  nop 
	IL_1a1e:  nop 
	IL_1a1f:  ldloc 18

	IL_1a23:  nop 
	IL_1a24:  nop 
	IL_1a25:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_1a2a:  ldarg 1

	IL_1a2e:  nop 
	IL_1a2f:  nop 
	IL_1a30:  ldloc 23

	IL_1a34:  nop 
	IL_1a35:  nop 
	IL_1a36:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1a3b:  ldarg 1

	IL_1a3f:  nop 
	IL_1a40:  nop 
	IL_1a41:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1a46:  ldloc 1

	IL_1a4a:  nop 
	IL_1a4b:  nop 
	IL_1a4c:  conv.u 
	IL_1a4d:  ldloc 19

	IL_1a51:  nop 
	IL_1a52:  nop 
	IL_1a53:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1a58:  br IL_1a62

	IL_1a5d:  br IL_1a62

	IL_1a62:  ldloc 19

	IL_1a66:  nop 
	IL_1a67:  nop 
	IL_1a68:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a6d:  stloc 27

	IL_1a71:  nop 
	IL_1a72:  nop 
	IL_1a73:  ldloc 27

	IL_1a77:  nop 
	IL_1a78:  nop 
	IL_1a79:  ldstr "^::(.)*$"
	IL_1a7e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1a83:  stloc 26

	IL_1a87:  nop 
	IL_1a88:  nop 
	IL_1a89:  ldloc 26

	IL_1a8d:  nop 
	IL_1a8e:  nop 
	IL_1a8f:  ldc.i4 1
	IL_1a94:  beq IL_1a9e

	IL_1a99:  br IL_1aad

	IL_1a9e:  ldc.i4 1
	IL_1aa3:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1aa8:  br IL_1ab2

	IL_1aad:  br IL_1ab2

	IL_1ab2:  br IL_1d6f

	IL_1ab7:  br IL_1ac1

	IL_1abc:  br IL_1ac1

	IL_1ac1:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_1ac6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1acb:  stloc 25

	IL_1acf:  nop 
	IL_1ad0:  nop 
	IL_1ad1:  ldloc 25

	IL_1ad5:  nop 
	IL_1ad6:  nop 
	IL_1ad7:  ldloc 8

	IL_1adb:  nop 
	IL_1adc:  nop 
	IL_1add:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1ae2:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1ae7:  stloc 26

	IL_1aeb:  nop 
	IL_1aec:  nop 
	IL_1aed:  ldloc 26

	IL_1af1:  nop 
	IL_1af2:  nop 
	IL_1af3:  ldc.i4 1
	IL_1af8:  beq IL_1b02

	IL_1afd:  br IL_1c4c

	IL_1b02:  ldloc 8

	IL_1b06:  nop 
	IL_1b07:  nop 
	IL_1b08:  stloc 20

	IL_1b0c:  nop 
	IL_1b0d:  nop 
	IL_1b0e:  ldloc 20

	IL_1b12:  nop 
	IL_1b13:  nop 
	IL_1b14:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1b19:  stloc 21

	IL_1b1d:  nop 
	IL_1b1e:  nop 
	IL_1b1f:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1b24:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1b29:  or 
	IL_1b2a:  stloc 26

	IL_1b2e:  nop 
	IL_1b2f:  nop 
	IL_1b30:  ldloc 26

	IL_1b34:  nop 
	IL_1b35:  nop 
	IL_1b36:  ldc.i4 1
	IL_1b3b:  beq IL_1b45

	IL_1b40:  br IL_1bed

	IL_1b45:  ldc.i4 0
	IL_1b4a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1b4f:  ldc.i4 0
	IL_1b54:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1b59:  ldloc 1

	IL_1b5d:  nop 
	IL_1b5e:  nop 
	IL_1b5f:  ldc.i4 1
	IL_1b64:  add 
	IL_1b65:  stloc 23

	IL_1b69:  nop 
	IL_1b6a:  nop 
	IL_1b6b:  ldarg 1

	IL_1b6f:  nop 
	IL_1b70:  nop 
	IL_1b71:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1b76:  ldloc 23

	IL_1b7a:  nop 
	IL_1b7b:  nop 
	IL_1b7c:  conv.u 
	IL_1b7d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1b82:  stloc 18

	IL_1b86:  nop 
	IL_1b87:  nop 
	IL_1b88:  ldloc 21

	IL_1b8c:  nop 
	IL_1b8d:  nop 
	IL_1b8e:  ldc.i4 1
	IL_1b93:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1b98:  ldloc 21

	IL_1b9c:  nop 
	IL_1b9d:  nop 
	IL_1b9e:  ldloc 18

	IL_1ba2:  nop 
	IL_1ba3:  nop 
	IL_1ba4:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_1ba9:  ldarg 1

	IL_1bad:  nop 
	IL_1bae:  nop 
	IL_1baf:  ldloc 23

	IL_1bb3:  nop 
	IL_1bb4:  nop 
	IL_1bb5:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1bba:  ldloc 20

	IL_1bbe:  nop 
	IL_1bbf:  nop 
	IL_1bc0:  ldloc 21

	IL_1bc4:  nop 
	IL_1bc5:  nop 
	IL_1bc6:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1bcb:  ldarg 1

	IL_1bcf:  nop 
	IL_1bd0:  nop 
	IL_1bd1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1bd6:  ldloc 1

	IL_1bda:  nop 
	IL_1bdb:  nop 
	IL_1bdc:  conv.u 
	IL_1bdd:  ldloc 20

	IL_1be1:  nop 
	IL_1be2:  nop 
	IL_1be3:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1be8:  br IL_1bf2

	IL_1bed:  br IL_1bf2

	IL_1bf2:  ldloc 21

	IL_1bf6:  nop 
	IL_1bf7:  nop 
	IL_1bf8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1bfd:  stloc 27

	IL_1c01:  nop 
	IL_1c02:  nop 
	IL_1c03:  ldloc 27

	IL_1c07:  nop 
	IL_1c08:  nop 
	IL_1c09:  ldstr "^::(.)*$"
	IL_1c0e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1c13:  stloc 26

	IL_1c17:  nop 
	IL_1c18:  nop 
	IL_1c19:  ldloc 26

	IL_1c1d:  nop 
	IL_1c1e:  nop 
	IL_1c1f:  ldc.i4 1
	IL_1c24:  beq IL_1c2e

	IL_1c29:  br IL_1c3d

	IL_1c2e:  ldc.i4 1
	IL_1c33:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1c38:  br IL_1c42

	IL_1c3d:  br IL_1c42

	IL_1c42:  br IL_1d6f

	IL_1c47:  br IL_1c51

	IL_1c4c:  br IL_1c51

	IL_1c51:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_1c56:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1c5b:  stloc 25

	IL_1c5f:  nop 
	IL_1c60:  nop 
	IL_1c61:  ldloc 25

	IL_1c65:  nop 
	IL_1c66:  nop 
	IL_1c67:  ldloc 8

	IL_1c6b:  nop 
	IL_1c6c:  nop 
	IL_1c6d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1c72:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1c77:  stloc 26

	IL_1c7b:  nop 
	IL_1c7c:  nop 
	IL_1c7d:  ldloc 26

	IL_1c81:  nop 
	IL_1c82:  nop 
	IL_1c83:  ldc.i4 1
	IL_1c88:  beq IL_1c92

	IL_1c8d:  br IL_1d6a

	IL_1c92:  ldloc 8

	IL_1c96:  nop 
	IL_1c97:  nop 
	IL_1c98:  stloc 22

	IL_1c9c:  nop 
	IL_1c9d:  nop 
	IL_1c9e:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1ca3:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1ca8:  or 
	IL_1ca9:  stloc 26

	IL_1cad:  nop 
	IL_1cae:  nop 
	IL_1caf:  ldloc 26

	IL_1cb3:  nop 
	IL_1cb4:  nop 
	IL_1cb5:  ldc.i4 1
	IL_1cba:  beq IL_1cc4

	IL_1cbf:  br IL_1d5b

	IL_1cc4:  ldc.i4 0
	IL_1cc9:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1cce:  ldc.i4 0
	IL_1cd3:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1cd8:  ldloc 1

	IL_1cdc:  nop 
	IL_1cdd:  nop 
	IL_1cde:  ldc.i4 1
	IL_1ce3:  add 
	IL_1ce4:  stloc 23

	IL_1ce8:  nop 
	IL_1ce9:  nop 
	IL_1cea:  ldarg 1

	IL_1cee:  nop 
	IL_1cef:  nop 
	IL_1cf0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1cf5:  ldloc 23

	IL_1cf9:  nop 
	IL_1cfa:  nop 
	IL_1cfb:  conv.u 
	IL_1cfc:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1d01:  stloc 18

	IL_1d05:  nop 
	IL_1d06:  nop 
	IL_1d07:  ldloc 22

	IL_1d0b:  nop 
	IL_1d0c:  nop 
	IL_1d0d:  ldc.i4 1
	IL_1d12:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_1d17:  ldloc 22

	IL_1d1b:  nop 
	IL_1d1c:  nop 
	IL_1d1d:  ldloc 18

	IL_1d21:  nop 
	IL_1d22:  nop 
	IL_1d23:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_1d28:  ldarg 1

	IL_1d2c:  nop 
	IL_1d2d:  nop 
	IL_1d2e:  ldloc 23

	IL_1d32:  nop 
	IL_1d33:  nop 
	IL_1d34:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1d39:  ldarg 1

	IL_1d3d:  nop 
	IL_1d3e:  nop 
	IL_1d3f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1d44:  ldloc 1

	IL_1d48:  nop 
	IL_1d49:  nop 
	IL_1d4a:  conv.u 
	IL_1d4b:  ldloc 22

	IL_1d4f:  nop 
	IL_1d50:  nop 
	IL_1d51:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1d56:  br IL_1d60

	IL_1d5b:  br IL_1d60

	IL_1d60:  br IL_1d6f

	IL_1d65:  br IL_1d6f

	IL_1d6a:  br IL_1d6f

	IL_1d6f:  ldloc 1

	IL_1d73:  nop 
	IL_1d74:  nop 
	IL_1d75:  ldc.i4 0
	IL_1d7a:  ble IL_1d84

	IL_1d7f:  br IL_1d8e

	IL_1d84:  br IL_1d9d

	IL_1d89:  br IL_1d98

	IL_1d8e:  br IL_00fe

	IL_1d93:  br IL_1d98

	IL_1d98:  br IL_1d9d

	IL_1d9d:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1da2:  ldc.i4 0
	IL_1da7:  beq IL_1db1

	IL_1dac:  br IL_1e2c

	IL_1db1:  ldloc 4

	IL_1db5:  nop 
	IL_1db6:  nop 
	IL_1db7:  ldc.i4 1
	IL_1dbc:  beq IL_1dc6

	IL_1dc1:  br IL_1e22

	IL_1dc6:  ldc.i4 1
	IL_1dcb:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1dd0:  ldarg 1

	IL_1dd4:  nop 
	IL_1dd5:  nop 
	IL_1dd6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1ddb:  ldlen 
	IL_1ddc:  conv.i4 
	IL_1ddd:  stloc 0

	IL_1de1:  nop 
	IL_1de2:  nop 
	IL_1de3:  ldloc 0

	IL_1de7:  nop 
	IL_1de8:  nop 
	IL_1de9:  stloc 1

	IL_1ded:  nop 
	IL_1dee:  nop 
	IL_1def:  ldc.i4 0
	IL_1df4:  stloc 4

	IL_1df8:  nop 
	IL_1df9:  nop 
	IL_1dfa:  ldc.i4 0
	IL_1dff:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1e04:  ldc.i4 0
	IL_1e09:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1e0e:  ldc.i4 0
	IL_1e13:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1e18:  br IL_00fe

	IL_1e1d:  br IL_1e27

	IL_1e22:  br IL_1e27

	IL_1e27:  br IL_1e3b

	IL_1e2c:  ldc.i4 0
	IL_1e31:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1e36:  br IL_1e3b

	IL_1e3b:  ldc.i4 0
	IL_1e40:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1e45:  ldc.i4 0
	IL_1e4a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1e4f:  ldc.i4 0
	IL_1e54:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1e59:  ldarg 1

	IL_1e5d:  nop 
	IL_1e5e:  nop 
	IL_1e5f:  ret 
    } // end of method ExprOptimizer::Optimize

    // method line 18
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xaadc
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

    // method line 19
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkRefasm (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xaaf0
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

    // method line 20
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkRefstdasm (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xabcc
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

    // method line 21
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkInclude (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xaca8
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

    // method line 22
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xad84
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

    // method line 23
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkElseIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xaf5c
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

    // method line 24
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkLabel (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb134
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

    // method line 25
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkPlace (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb210
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

    // method line 26
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkGoto (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb2ec
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

    // method line 27
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDebug (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb3c8
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

    // method line 28
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkScope (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb4b0
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

    // method line 29
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkImport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb598
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

    // method line 30
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkNS (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb674
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

    // method line 31
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkLocimport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb750
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

    // method line 32
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkReturn (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb82c
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

    // method line 33
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkCmt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xba0c
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

    // method line 34
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkElse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbac8
	// Code size 225 (0xe1)
	.maxstack 7
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseStmt	V_3)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  blt IL_001c

	IL_0017:  br IL_00d5

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
	IL_0038:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok
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
	IL_0075:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseStmt::'.ctor'()
	IL_007a:  stloc 3

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldarg 2

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldobj [mscorlib]System.Boolean
	IL_008b:  ldc.i4 1
	IL_0090:  beq IL_009a

	IL_0095:  br IL_00cb

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
	IL_00c6:  br IL_00d0

	IL_00cb:  br IL_00d0

	IL_00d0:  br IL_00da

	IL_00d5:  br IL_00da

	IL_00da:  ldloc 3

	IL_00de:  nop 
	IL_00df:  nop 
	IL_00e0:  ret 
    } // end of method StmtOptimizer::checkElse

    // method line 35
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbbb8
	// Code size 304 (0x130)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_3,
		class [mscorlib]System.Type	V_4,
		bool	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndIfStmt	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  bge IL_001c

	IL_0017:  br IL_0124

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
	IL_0038:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
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
	IL_0064:  ldarg 1

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_006f:  ldc.i4 1
	IL_0074:  conv.u 
	IL_0075:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_007a:  stloc 3

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IfTok
	IL_0085:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_008a:  stloc 4

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldloc 4

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 3

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00a6:  stloc 5

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldarg 2

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 2

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 5

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  and 
	IL_00bf:  stobj [mscorlib]System.Boolean
	IL_00c4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndIfStmt::'.ctor'()
	IL_00c9:  stloc 6

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldarg 2

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldobj [mscorlib]System.Boolean
	IL_00da:  ldc.i4 1
	IL_00df:  beq IL_00e9

	IL_00e4:  br IL_011a

	IL_00e9:  ldloc 6

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ldarg 1

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00fa:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ff:  ldloc 6

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  ldarg 1

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0110:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0115:  br IL_011f

	IL_011a:  br IL_011f

	IL_011f:  br IL_0129

	IL_0124:  br IL_0129

	IL_0129:  ldloc 6

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  ret 
    } // end of method StmtOptimizer::checkEndIf

    // method line 36
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndMtd (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbcf4
	// Code size 304 (0x130)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_3,
		class [mscorlib]System.Type	V_4,
		bool	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  bge IL_001c

	IL_0017:  br IL_0124

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
	IL_0038:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
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
	IL_0064:  ldarg 1

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_006f:  ldc.i4 1
	IL_0074:  conv.u 
	IL_0075:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_007a:  stloc 3

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok
	IL_0085:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_008a:  stloc 4

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldloc 4

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 3

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00a6:  stloc 5

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldarg 2

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 2

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 5

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  and 
	IL_00bf:  stobj [mscorlib]System.Boolean
	IL_00c4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt::'.ctor'()
	IL_00c9:  stloc 6

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldarg 2

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldobj [mscorlib]System.Boolean
	IL_00da:  ldc.i4 1
	IL_00df:  beq IL_00e9

	IL_00e4:  br IL_011a

	IL_00e9:  ldloc 6

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ldarg 1

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00fa:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ff:  ldloc 6

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  ldarg 1

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0110:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0115:  br IL_011f

	IL_011a:  br IL_011f

	IL_011f:  br IL_0129

	IL_0124:  br IL_0129

	IL_0129:  ldloc 6

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  ret 
    } // end of method StmtOptimizer::checkEndMtd

    // method line 37
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndNS (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbe30
	// Code size 304 (0x130)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_3,
		class [mscorlib]System.Type	V_4,
		bool	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndNSStmt	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  bge IL_001c

	IL_0017:  br IL_0124

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
	IL_0038:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
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
	IL_0064:  ldarg 1

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_006f:  ldc.i4 1
	IL_0074:  conv.u 
	IL_0075:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_007a:  stloc 3

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NamespaceTok
	IL_0085:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_008a:  stloc 4

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldloc 4

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 3

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00a6:  stloc 5

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldarg 2

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 2

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 5

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  and 
	IL_00bf:  stobj [mscorlib]System.Boolean
	IL_00c4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndNSStmt::'.ctor'()
	IL_00c9:  stloc 6

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldarg 2

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldobj [mscorlib]System.Boolean
	IL_00da:  ldc.i4 1
	IL_00df:  beq IL_00e9

	IL_00e4:  br IL_011a

	IL_00e9:  ldloc 6

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ldarg 1

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00fa:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ff:  ldloc 6

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  ldarg 1

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0110:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0115:  br IL_011f

	IL_011a:  br IL_011f

	IL_011f:  br IL_0129

	IL_0124:  br IL_0129

	IL_0129:  ldloc 6

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  ret 
    } // end of method StmtOptimizer::checkEndNS

    // method line 38
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndCls (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbf6c
	// Code size 304 (0x130)
	.maxstack 8
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_3,
		class [mscorlib]System.Type	V_4,
		bool	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndClassStmt	V_6)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  bge IL_001c

	IL_0017:  br IL_0124

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
	IL_0038:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok
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
	IL_0064:  ldarg 1

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_006f:  ldc.i4 1
	IL_0074:  conv.u 
	IL_0075:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_007a:  stloc 3

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok
	IL_0085:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_008a:  stloc 4

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldloc 4

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 3

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00a6:  stloc 5

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldarg 2

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 2

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 5

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  and 
	IL_00bf:  stobj [mscorlib]System.Boolean
	IL_00c4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndClassStmt::'.ctor'()
	IL_00c9:  stloc 6

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldarg 2

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldobj [mscorlib]System.Boolean
	IL_00da:  ldc.i4 1
	IL_00df:  beq IL_00e9

	IL_00e4:  br IL_011a

	IL_00e9:  ldloc 6

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ldarg 1

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00fa:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ff:  ldloc 6

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  ldarg 1

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0110:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0115:  br IL_011f

	IL_011a:  br IL_011f

	IL_011f:  br IL_0129

	IL_0124:  br IL_0129

	IL_0129:  ldloc 6

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  ret 
    } // end of method StmtOptimizer::checkEndCls

    // method line 39
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssembly (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc0a8
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

    // method line 40
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVer (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc1a8
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

    // method line 41
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkClass (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc504
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

    // method line 42
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkField (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc844
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

    // method line 43
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethod (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xcb98
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

    // method line 44
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDelegate (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd2ac
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

    // method line 45
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethodCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd9c0
	// Code size 426 (0x1aa)
	.maxstack 9
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_2,
		class [mscorlib]System.Type	V_3,
		bool	V_4,
		bool	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt	V_6,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_8)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  bgt IL_001c

	IL_0017:  br IL_019e

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
	IL_0048:  ldarg 1

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0053:  ldc.i4 1
	IL_0058:  conv.u 
	IL_0059:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_005e:  stloc 2

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_0069:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_006e:  stloc 3

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldloc 1

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  ldloc 0

	IL_007e:  nop 
	IL_007f:  nop 
	IL_0080:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0085:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_008a:  stloc 4

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldloc 3

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 2

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00a1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00a6:  stloc 5

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldarg 2

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 4

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldloc 5

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  and 
	IL_00bf:  stobj [mscorlib]System.Boolean
	IL_00c4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::'.ctor'()
	IL_00c9:  stloc 6

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldarg 2

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldobj [mscorlib]System.Boolean
	IL_00da:  ldc.i4 1
	IL_00df:  beq IL_00e9

	IL_00e4:  br IL_0194

	IL_00e9:  ldloc 6

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ldarg 1

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00fa:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_00ff:  ldloc 6

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  ldarg 1

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0110:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0115:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_011a:  stloc 7

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0125:  stloc 8

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  ldloc 8

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  ldarg 1

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_013c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0141:  ldloc 8

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldarg 1

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0152:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0157:  ldloc 7

	IL_015b:  nop 
	IL_015c:  nop 
	IL_015d:  ldloc 8

	IL_0161:  nop 
	IL_0162:  nop 
	IL_0163:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0168:  stloc 8

	IL_016c:  nop 
	IL_016d:  nop 
	IL_016e:  ldloc 6

	IL_0172:  nop 
	IL_0173:  nop 
	IL_0174:  ldloc 8

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_017f:  ldc.i4 0
	IL_0184:  conv.u 
	IL_0185:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_018a:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::MethodToken
	IL_018f:  br IL_0199

	IL_0194:  br IL_0199

	IL_0199:  br IL_01a3

	IL_019e:  br IL_01a3

	IL_01a3:  ldloc 6

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ret 
    } // end of method StmtOptimizer::checkMethodCall

    // method line 46
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVarAs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xdb78
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

    // method line 47
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt AssOpt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xdd9c
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

    // method line 48
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssign (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xdfc0
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

    // method line 49
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xe2c4
	// Code size 2475 (0x9ab)
	.maxstack 130
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

	IL_016d:  br IL_09a4

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
	IL_01b5:  br IL_09a4

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
	IL_01fd:  br IL_09a4

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
	IL_0245:  br IL_09a4

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
	IL_028d:  br IL_09a4

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
	IL_02d5:  br IL_09a4

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
	IL_031d:  br IL_09a4

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
	IL_0365:  br IL_09a4

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
	IL_03ad:  br IL_09a4

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
	IL_03f5:  br IL_09a4

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
	IL_043d:  br IL_09a4

	IL_0442:  br IL_044c

	IL_0447:  br IL_044c

	IL_044c:  ldarg.0 
	IL_044d:  ldarg 1

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  ldloca 4

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkMethodCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0485:  br IL_09a4

	IL_048a:  br IL_0494

	IL_048f:  br IL_0494

	IL_0494:  ldarg.0 
	IL_0495:  ldarg 1

	IL_0499:  nop 
	IL_049a:  nop 
	IL_049b:  ldloca 4

	IL_049f:  nop 
	IL_04a0:  nop 
	IL_04a1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkAssign(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_04cd:  br IL_09a4

	IL_04d2:  br IL_04dc

	IL_04d7:  br IL_04dc

	IL_04dc:  ldarg.0 
	IL_04dd:  ldarg 1

	IL_04e1:  nop 
	IL_04e2:  nop 
	IL_04e3:  ldloca 4

	IL_04e7:  nop 
	IL_04e8:  nop 
	IL_04e9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkVarAs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0515:  br IL_09a4

	IL_051a:  br IL_0524

	IL_051f:  br IL_0524

	IL_0524:  ldarg.0 
	IL_0525:  ldarg 1

	IL_0529:  nop 
	IL_052a:  nop 
	IL_052b:  ldloca 4

	IL_052f:  nop 
	IL_0530:  nop 
	IL_0531:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkReturn(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_055d:  br IL_09a4

	IL_0562:  br IL_056c

	IL_0567:  br IL_056c

	IL_056c:  ldarg.0 
	IL_056d:  ldarg 1

	IL_0571:  nop 
	IL_0572:  nop 
	IL_0573:  ldloca 4

	IL_0577:  nop 
	IL_0578:  nop 
	IL_0579:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndMtd(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_05a5:  br IL_09a4

	IL_05aa:  br IL_05b4

	IL_05af:  br IL_05b4

	IL_05b4:  ldarg.0 
	IL_05b5:  ldarg 1

	IL_05b9:  nop 
	IL_05ba:  nop 
	IL_05bb:  ldloca 4

	IL_05bf:  nop 
	IL_05c0:  nop 
	IL_05c1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndNS(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_05ed:  br IL_09a4

	IL_05f2:  br IL_05fc

	IL_05f7:  br IL_05fc

	IL_05fc:  ldarg.0 
	IL_05fd:  ldarg 1

	IL_0601:  nop 
	IL_0602:  nop 
	IL_0603:  ldloca 4

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndCls(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0635:  br IL_09a4

	IL_063a:  br IL_0644

	IL_063f:  br IL_0644

	IL_0644:  ldarg.0 
	IL_0645:  ldarg 1

	IL_0649:  nop 
	IL_064a:  nop 
	IL_064b:  ldloca 4

	IL_064f:  nop 
	IL_0650:  nop 
	IL_0651:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkDebug(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_067d:  br IL_09a4

	IL_0682:  br IL_068c

	IL_0687:  br IL_068c

	IL_068c:  ldarg.0 
	IL_068d:  ldarg 1

	IL_0691:  nop 
	IL_0692:  nop 
	IL_0693:  ldloca 4

	IL_0697:  nop 
	IL_0698:  nop 
	IL_0699:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkScope(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_06c5:  br IL_09a4

	IL_06ca:  br IL_06d4

	IL_06cf:  br IL_06d4

	IL_06d4:  ldarg.0 
	IL_06d5:  ldarg 1

	IL_06d9:  nop 
	IL_06da:  nop 
	IL_06db:  ldloca 4

	IL_06df:  nop 
	IL_06e0:  nop 
	IL_06e1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkInclude(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_070d:  br IL_09a4

	IL_0712:  br IL_071c

	IL_0717:  br IL_071c

	IL_071c:  ldarg.0 
	IL_071d:  ldarg 1

	IL_0721:  nop 
	IL_0722:  nop 
	IL_0723:  ldloca 4

	IL_0727:  nop 
	IL_0728:  nop 
	IL_0729:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkRefasm(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0755:  br IL_09a4

	IL_075a:  br IL_0764

	IL_075f:  br IL_0764

	IL_0764:  ldarg.0 
	IL_0765:  ldarg 1

	IL_0769:  nop 
	IL_076a:  nop 
	IL_076b:  ldloca 4

	IL_076f:  nop 
	IL_0770:  nop 
	IL_0771:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkRefstdasm(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_079d:  br IL_09a4

	IL_07a2:  br IL_07ac

	IL_07a7:  br IL_07ac

	IL_07ac:  ldarg.0 
	IL_07ad:  ldarg 1

	IL_07b1:  nop 
	IL_07b2:  nop 
	IL_07b3:  ldloca 4

	IL_07b7:  nop 
	IL_07b8:  nop 
	IL_07b9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkLabel(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_07e5:  br IL_09a4

	IL_07ea:  br IL_07f4

	IL_07ef:  br IL_07f4

	IL_07f4:  ldarg.0 
	IL_07f5:  ldarg 1

	IL_07f9:  nop 
	IL_07fa:  nop 
	IL_07fb:  ldloca 4

	IL_07ff:  nop 
	IL_0800:  nop 
	IL_0801:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkPlace(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_082d:  br IL_09a4

	IL_0832:  br IL_083c

	IL_0837:  br IL_083c

	IL_083c:  ldarg.0 
	IL_083d:  ldarg 1

	IL_0841:  nop 
	IL_0842:  nop 
	IL_0843:  ldloca 4

	IL_0847:  nop 
	IL_0848:  nop 
	IL_0849:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkGoto(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0875:  br IL_09a4

	IL_087a:  br IL_0884

	IL_087f:  br IL_0884

	IL_0884:  ldarg.0 
	IL_0885:  ldarg 1

	IL_0889:  nop 
	IL_088a:  nop 
	IL_088b:  ldloca 4

	IL_088f:  nop 
	IL_0890:  nop 
	IL_0891:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_08bd:  br IL_09a4

	IL_08c2:  br IL_08cc

	IL_08c7:  br IL_08cc

	IL_08cc:  ldarg.0 
	IL_08cd:  ldarg 1

	IL_08d1:  nop 
	IL_08d2:  nop 
	IL_08d3:  ldloca 4

	IL_08d7:  nop 
	IL_08d8:  nop 
	IL_08d9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElseIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0905:  br IL_09a4

	IL_090a:  br IL_0914

	IL_090f:  br IL_0914

	IL_0914:  ldarg.0 
	IL_0915:  ldarg 1

	IL_0919:  nop 
	IL_091a:  nop 
	IL_091b:  ldloca 4

	IL_091f:  nop 
	IL_0920:  nop 
	IL_0921:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_094d:  br IL_09a4

	IL_0952:  br IL_095c

	IL_0957:  br IL_095c

	IL_095c:  ldarg.0 
	IL_095d:  ldarg 1

	IL_0961:  nop 
	IL_0962:  nop 
	IL_0963:  ldloca 4

	IL_0967:  nop 
	IL_0968:  nop 
	IL_0969:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0995:  br IL_09a4

	IL_099a:  br IL_09a4

	IL_099f:  br IL_09a4

	IL_09a4:  ldarg 1

	IL_09a8:  nop 
	IL_09a9:  nop 
	IL_09aa:  ret 
    } // end of method StmtOptimizer::Optimize

    // method line 50
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xec7c
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

    // method line 51
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet Parse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet stms)  cil managed 
    {
        // Method begins at RVA 0xec90
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

    // method line 52
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xed5c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Parser::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.Parser
}

