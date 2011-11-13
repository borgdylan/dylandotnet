.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:7:8
}
.assembly extern dnu
{
  .ver 11:2:7:8
}
.assembly 'tokenizer.Parser'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 37 2E 38 00 00 ) // ...11.2.7.8..

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
  .ver  11:2:7:8
}

.module tokenizer.Parser.dll // GUID = {568A483E-CD9A-408B-8B1A-70CFFE5DDC96}


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
	// Code size 19560 (0x4c68)
	.maxstack 520
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IfTok	V_42,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseIfTok	V_43,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok	V_44,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok	V_45,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok	V_50,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok	V_51,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok	V_52,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok	V_53,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok	V_56,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok	V_57,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok	V_58,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok	V_59,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok	V_60,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok	V_61,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok	V_62,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok	V_63,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok	V_64,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok	V_65,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok	V_66,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok	V_67,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr	V_68,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr	V_69,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr	V_70,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr	V_71,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr	V_72,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr	V_73,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr	V_74,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr	V_75,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr	V_76,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr	V_77,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok	V_78,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok	V_79,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok	V_80,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok	V_81,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok	V_82,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok	V_83,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok	V_84,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok	V_85,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok	V_86,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok	V_88,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok	V_89,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok	V_92,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok	V_93,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok	V_94,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok	V_95,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_96,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_97,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_98,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_99,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_100,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_101,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_102,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_103,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_104,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral	V_105,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral	V_106,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_107,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral	V_108,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral	V_109,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral	V_110,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral	V_111,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral	V_112,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral	V_113,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_114,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_115)
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
	IL_00b0:  br IL_4c61

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
	IL_0132:  br IL_4c61

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
	IL_01b4:  br IL_4c61

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
	IL_0236:  br IL_4c61

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
	IL_02b8:  br IL_4c61

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
	IL_033a:  br IL_4c61

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
	IL_03bc:  br IL_4c61

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
	IL_043e:  br IL_4c61

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

	IL_0521:  br IL_4c61

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
	IL_05a3:  br IL_4c61

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
	IL_0625:  br IL_4c61

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
	IL_06a7:  br IL_4c61

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
	IL_0729:  br IL_4c61

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
	IL_07ab:  br IL_4c61

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
	IL_082d:  br IL_4c61

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
	IL_08af:  br IL_4c61

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
	IL_0931:  br IL_4c61

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
	IL_09b3:  br IL_4c61

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
	IL_0a35:  br IL_4c61

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
	IL_0ab7:  br IL_4c61

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
	IL_0b39:  br IL_4c61

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
	IL_0bbb:  br IL_4c61

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
	IL_0c3d:  br IL_4c61

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
	IL_0cbf:  br IL_4c61

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
	IL_0d41:  br IL_4c61

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
	IL_0dc3:  br IL_4c61

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
	IL_0e45:  br IL_4c61

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
	IL_0ec7:  br IL_4c61

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
	IL_0f49:  br IL_4c61

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
	IL_0fcb:  br IL_4c61

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
	IL_104d:  br IL_4c61

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
	IL_10cf:  br IL_4c61

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
	IL_1151:  br IL_4c61

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
	IL_11d3:  br IL_4c61

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
	IL_1255:  br IL_4c61

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
	IL_12d7:  br IL_4c61

	IL_12dc:  br IL_12e6

	IL_12e1:  br IL_12e6

	IL_12e6:  ldarg 1

	IL_12ea:  nop 
	IL_12eb:  nop 
	IL_12ec:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_12f1:  ldstr "if"
	IL_12f6:  call int32 string::Compare(string, string)
	IL_12fb:  stloc 0

	IL_12ff:  nop 
	IL_1300:  nop 
	IL_1301:  ldloc 0

	IL_1305:  nop 
	IL_1306:  nop 
	IL_1307:  ldc.i4 0
	IL_130c:  beq IL_1316

	IL_1311:  br IL_136d

	IL_1316:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.IfTok::'.ctor'()
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
	IL_1359:  ldc.i4 1
	IL_135e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_1363:  br IL_4c61

	IL_1368:  br IL_1372

	IL_136d:  br IL_1372

	IL_1372:  ldarg 1

	IL_1376:  nop 
	IL_1377:  nop 
	IL_1378:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_137d:  ldstr "elseif"
	IL_1382:  call int32 string::Compare(string, string)
	IL_1387:  stloc 0

	IL_138b:  nop 
	IL_138c:  nop 
	IL_138d:  ldloc 0

	IL_1391:  nop 
	IL_1392:  nop 
	IL_1393:  ldc.i4 0
	IL_1398:  beq IL_13a2

	IL_139d:  br IL_13f9

	IL_13a2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseIfTok::'.ctor'()
	IL_13a7:  stloc 43

	IL_13ab:  nop 
	IL_13ac:  nop 
	IL_13ad:  ldloc 43

	IL_13b1:  nop 
	IL_13b2:  nop 
	IL_13b3:  ldarg 1

	IL_13b7:  nop 
	IL_13b8:  nop 
	IL_13b9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_13be:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_13c3:  ldloc 43

	IL_13c7:  nop 
	IL_13c8:  nop 
	IL_13c9:  ldarg 1

	IL_13cd:  nop 
	IL_13ce:  nop 
	IL_13cf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13d4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13d9:  ldloc 43

	IL_13dd:  nop 
	IL_13de:  nop 
	IL_13df:  starg 1

	IL_13e3:  nop 
	IL_13e4:  nop 
	IL_13e5:  ldc.i4 1
	IL_13ea:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_13ef:  br IL_4c61

	IL_13f4:  br IL_13fe

	IL_13f9:  br IL_13fe

	IL_13fe:  ldarg 1

	IL_1402:  nop 
	IL_1403:  nop 
	IL_1404:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1409:  ldstr "else"
	IL_140e:  call int32 string::Compare(string, string)
	IL_1413:  stloc 0

	IL_1417:  nop 
	IL_1418:  nop 
	IL_1419:  ldloc 0

	IL_141d:  nop 
	IL_141e:  nop 
	IL_141f:  ldc.i4 0
	IL_1424:  beq IL_142e

	IL_1429:  br IL_147b

	IL_142e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ElseTok::'.ctor'()
	IL_1433:  stloc 44

	IL_1437:  nop 
	IL_1438:  nop 
	IL_1439:  ldloc 44

	IL_143d:  nop 
	IL_143e:  nop 
	IL_143f:  ldarg 1

	IL_1443:  nop 
	IL_1444:  nop 
	IL_1445:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_144a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_144f:  ldloc 44

	IL_1453:  nop 
	IL_1454:  nop 
	IL_1455:  ldarg 1

	IL_1459:  nop 
	IL_145a:  nop 
	IL_145b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1460:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1465:  ldloc 44

	IL_1469:  nop 
	IL_146a:  nop 
	IL_146b:  starg 1

	IL_146f:  nop 
	IL_1470:  nop 
	IL_1471:  br IL_4c61

	IL_1476:  br IL_1480

	IL_147b:  br IL_1480

	IL_1480:  ldarg 1

	IL_1484:  nop 
	IL_1485:  nop 
	IL_1486:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_148b:  ldstr "then"
	IL_1490:  call int32 string::Compare(string, string)
	IL_1495:  stloc 0

	IL_1499:  nop 
	IL_149a:  nop 
	IL_149b:  ldloc 0

	IL_149f:  nop 
	IL_14a0:  nop 
	IL_14a1:  ldc.i4 0
	IL_14a6:  beq IL_14b0

	IL_14ab:  br IL_1507

	IL_14b0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ThenTok::'.ctor'()
	IL_14b5:  stloc 45

	IL_14b9:  nop 
	IL_14ba:  nop 
	IL_14bb:  ldloc 45

	IL_14bf:  nop 
	IL_14c0:  nop 
	IL_14c1:  ldarg 1

	IL_14c5:  nop 
	IL_14c6:  nop 
	IL_14c7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_14cc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_14d1:  ldloc 45

	IL_14d5:  nop 
	IL_14d6:  nop 
	IL_14d7:  ldarg 1

	IL_14db:  nop 
	IL_14dc:  nop 
	IL_14dd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_14e2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_14e7:  ldloc 45

	IL_14eb:  nop 
	IL_14ec:  nop 
	IL_14ed:  starg 1

	IL_14f1:  nop 
	IL_14f2:  nop 
	IL_14f3:  ldc.i4 0
	IL_14f8:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IfFlag
	IL_14fd:  br IL_4c61

	IL_1502:  br IL_150c

	IL_1507:  br IL_150c

	IL_150c:  ldarg 1

	IL_1510:  nop 
	IL_1511:  nop 
	IL_1512:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1517:  ldstr "new"
	IL_151c:  call int32 string::Compare(string, string)
	IL_1521:  stloc 0

	IL_1525:  nop 
	IL_1526:  nop 
	IL_1527:  ldloc 0

	IL_152b:  nop 
	IL_152c:  nop 
	IL_152d:  ldc.i4 0
	IL_1532:  beq IL_153c

	IL_1537:  br IL_1589

	IL_153c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok::'.ctor'()
	IL_1541:  stloc 46

	IL_1545:  nop 
	IL_1546:  nop 
	IL_1547:  ldloc 46

	IL_154b:  nop 
	IL_154c:  nop 
	IL_154d:  ldarg 1

	IL_1551:  nop 
	IL_1552:  nop 
	IL_1553:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1558:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_155d:  ldloc 46

	IL_1561:  nop 
	IL_1562:  nop 
	IL_1563:  ldarg 1

	IL_1567:  nop 
	IL_1568:  nop 
	IL_1569:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_156e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1573:  ldloc 46

	IL_1577:  nop 
	IL_1578:  nop 
	IL_1579:  starg 1

	IL_157d:  nop 
	IL_157e:  nop 
	IL_157f:  br IL_4c61

	IL_1584:  br IL_158e

	IL_1589:  br IL_158e

	IL_158e:  ldarg 1

	IL_1592:  nop 
	IL_1593:  nop 
	IL_1594:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1599:  ldstr "gettype"
	IL_159e:  call int32 string::Compare(string, string)
	IL_15a3:  stloc 0

	IL_15a7:  nop 
	IL_15a8:  nop 
	IL_15a9:  ldloc 0

	IL_15ad:  nop 
	IL_15ae:  nop 
	IL_15af:  ldc.i4 0
	IL_15b4:  beq IL_15be

	IL_15b9:  br IL_160b

	IL_15be:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok::'.ctor'()
	IL_15c3:  stloc 47

	IL_15c7:  nop 
	IL_15c8:  nop 
	IL_15c9:  ldloc 47

	IL_15cd:  nop 
	IL_15ce:  nop 
	IL_15cf:  ldarg 1

	IL_15d3:  nop 
	IL_15d4:  nop 
	IL_15d5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_15da:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_15df:  ldloc 47

	IL_15e3:  nop 
	IL_15e4:  nop 
	IL_15e5:  ldarg 1

	IL_15e9:  nop 
	IL_15ea:  nop 
	IL_15eb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_15f0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_15f5:  ldloc 47

	IL_15f9:  nop 
	IL_15fa:  nop 
	IL_15fb:  starg 1

	IL_15ff:  nop 
	IL_1600:  nop 
	IL_1601:  br IL_4c61

	IL_1606:  br IL_1610

	IL_160b:  br IL_1610

	IL_1610:  ldarg 1

	IL_1614:  nop 
	IL_1615:  nop 
	IL_1616:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_161b:  ldstr "#refasm"
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

	IL_1640:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok::'.ctor'()
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
	IL_1688:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_168d:  br IL_4c61

	IL_1692:  br IL_169c

	IL_1697:  br IL_169c

	IL_169c:  ldarg 1

	IL_16a0:  nop 
	IL_16a1:  nop 
	IL_16a2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_16a7:  ldstr "#debug"
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

	IL_16cc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok::'.ctor'()
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
	IL_170f:  br IL_4c61

	IL_1714:  br IL_171e

	IL_1719:  br IL_171e

	IL_171e:  ldarg 1

	IL_1722:  nop 
	IL_1723:  nop 
	IL_1724:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1729:  ldstr "#scope"
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

	IL_174e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok::'.ctor'()
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
	IL_1791:  br IL_4c61

	IL_1796:  br IL_17a0

	IL_179b:  br IL_17a0

	IL_17a0:  ldarg 1

	IL_17a4:  nop 
	IL_17a5:  nop 
	IL_17a6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_17ab:  ldstr "import"
	IL_17b0:  call int32 string::Compare(string, string)
	IL_17b5:  stloc 0

	IL_17b9:  nop 
	IL_17ba:  nop 
	IL_17bb:  ldloc 0

	IL_17bf:  nop 
	IL_17c0:  nop 
	IL_17c1:  ldc.i4 0
	IL_17c6:  beq IL_17d0

	IL_17cb:  br IL_1827

	IL_17d0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok::'.ctor'()
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
	IL_1813:  ldc.i4 1
	IL_1818:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_181d:  br IL_4c61

	IL_1822:  br IL_182c

	IL_1827:  br IL_182c

	IL_182c:  ldarg 1

	IL_1830:  nop 
	IL_1831:  nop 
	IL_1832:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1837:  ldstr "locimport"
	IL_183c:  call int32 string::Compare(string, string)
	IL_1841:  stloc 0

	IL_1845:  nop 
	IL_1846:  nop 
	IL_1847:  ldloc 0

	IL_184b:  nop 
	IL_184c:  nop 
	IL_184d:  ldc.i4 0
	IL_1852:  beq IL_185c

	IL_1857:  br IL_18b3

	IL_185c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok::'.ctor'()
	IL_1861:  stloc 52

	IL_1865:  nop 
	IL_1866:  nop 
	IL_1867:  ldloc 52

	IL_186b:  nop 
	IL_186c:  nop 
	IL_186d:  ldarg 1

	IL_1871:  nop 
	IL_1872:  nop 
	IL_1873:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1878:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_187d:  ldloc 52

	IL_1881:  nop 
	IL_1882:  nop 
	IL_1883:  ldarg 1

	IL_1887:  nop 
	IL_1888:  nop 
	IL_1889:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_188e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1893:  ldloc 52

	IL_1897:  nop 
	IL_1898:  nop 
	IL_1899:  starg 1

	IL_189d:  nop 
	IL_189e:  nop 
	IL_189f:  ldc.i4 1
	IL_18a4:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_18a9:  br IL_4c61

	IL_18ae:  br IL_18b8

	IL_18b3:  br IL_18b8

	IL_18b8:  ldarg 1

	IL_18bc:  nop 
	IL_18bd:  nop 
	IL_18be:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_18c3:  ldstr "assembly"
	IL_18c8:  call int32 string::Compare(string, string)
	IL_18cd:  stloc 0

	IL_18d1:  nop 
	IL_18d2:  nop 
	IL_18d3:  ldloc 0

	IL_18d7:  nop 
	IL_18d8:  nop 
	IL_18d9:  ldc.i4 0
	IL_18de:  beq IL_18e8

	IL_18e3:  br IL_1935

	IL_18e8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok::'.ctor'()
	IL_18ed:  stloc 53

	IL_18f1:  nop 
	IL_18f2:  nop 
	IL_18f3:  ldloc 53

	IL_18f7:  nop 
	IL_18f8:  nop 
	IL_18f9:  ldarg 1

	IL_18fd:  nop 
	IL_18fe:  nop 
	IL_18ff:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1904:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1909:  ldloc 53

	IL_190d:  nop 
	IL_190e:  nop 
	IL_190f:  ldarg 1

	IL_1913:  nop 
	IL_1914:  nop 
	IL_1915:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_191a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_191f:  ldloc 53

	IL_1923:  nop 
	IL_1924:  nop 
	IL_1925:  starg 1

	IL_1929:  nop 
	IL_192a:  nop 
	IL_192b:  br IL_4c61

	IL_1930:  br IL_193a

	IL_1935:  br IL_193a

	IL_193a:  ldarg 1

	IL_193e:  nop 
	IL_193f:  nop 
	IL_1940:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1945:  ldstr "ver"
	IL_194a:  call int32 string::Compare(string, string)
	IL_194f:  stloc 0

	IL_1953:  nop 
	IL_1954:  nop 
	IL_1955:  ldloc 0

	IL_1959:  nop 
	IL_195a:  nop 
	IL_195b:  ldc.i4 0
	IL_1960:  beq IL_196a

	IL_1965:  br IL_19c1

	IL_196a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok::'.ctor'()
	IL_196f:  stloc 54

	IL_1973:  nop 
	IL_1974:  nop 
	IL_1975:  ldloc 54

	IL_1979:  nop 
	IL_197a:  nop 
	IL_197b:  ldarg 1

	IL_197f:  nop 
	IL_1980:  nop 
	IL_1981:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1986:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_198b:  ldloc 54

	IL_198f:  nop 
	IL_1990:  nop 
	IL_1991:  ldarg 1

	IL_1995:  nop 
	IL_1996:  nop 
	IL_1997:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_199c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_19a1:  ldloc 54

	IL_19a5:  nop 
	IL_19a6:  nop 
	IL_19a7:  starg 1

	IL_19ab:  nop 
	IL_19ac:  nop 
	IL_19ad:  ldc.i4 1
	IL_19b2:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_19b7:  br IL_4c61

	IL_19bc:  br IL_19c6

	IL_19c1:  br IL_19c6

	IL_19c6:  ldarg 1

	IL_19ca:  nop 
	IL_19cb:  nop 
	IL_19cc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_19d1:  ldstr "on"
	IL_19d6:  call int32 string::Compare(string, string)
	IL_19db:  stloc 0

	IL_19df:  nop 
	IL_19e0:  nop 
	IL_19e1:  ldloc 0

	IL_19e5:  nop 
	IL_19e6:  nop 
	IL_19e7:  ldc.i4 0
	IL_19ec:  beq IL_19f6

	IL_19f1:  br IL_1a43

	IL_19f6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok::'.ctor'()
	IL_19fb:  stloc 55

	IL_19ff:  nop 
	IL_1a00:  nop 
	IL_1a01:  ldloc 55

	IL_1a05:  nop 
	IL_1a06:  nop 
	IL_1a07:  ldarg 1

	IL_1a0b:  nop 
	IL_1a0c:  nop 
	IL_1a0d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a12:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a17:  ldloc 55

	IL_1a1b:  nop 
	IL_1a1c:  nop 
	IL_1a1d:  ldarg 1

	IL_1a21:  nop 
	IL_1a22:  nop 
	IL_1a23:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a28:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a2d:  ldloc 55

	IL_1a31:  nop 
	IL_1a32:  nop 
	IL_1a33:  starg 1

	IL_1a37:  nop 
	IL_1a38:  nop 
	IL_1a39:  br IL_4c61

	IL_1a3e:  br IL_1a48

	IL_1a43:  br IL_1a48

	IL_1a48:  ldarg 1

	IL_1a4c:  nop 
	IL_1a4d:  nop 
	IL_1a4e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a53:  ldstr "off"
	IL_1a58:  call int32 string::Compare(string, string)
	IL_1a5d:  stloc 0

	IL_1a61:  nop 
	IL_1a62:  nop 
	IL_1a63:  ldloc 0

	IL_1a67:  nop 
	IL_1a68:  nop 
	IL_1a69:  ldc.i4 0
	IL_1a6e:  beq IL_1a78

	IL_1a73:  br IL_1ac5

	IL_1a78:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok::'.ctor'()
	IL_1a7d:  stloc 56

	IL_1a81:  nop 
	IL_1a82:  nop 
	IL_1a83:  ldloc 56

	IL_1a87:  nop 
	IL_1a88:  nop 
	IL_1a89:  ldarg 1

	IL_1a8d:  nop 
	IL_1a8e:  nop 
	IL_1a8f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a94:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1a99:  ldloc 56

	IL_1a9d:  nop 
	IL_1a9e:  nop 
	IL_1a9f:  ldarg 1

	IL_1aa3:  nop 
	IL_1aa4:  nop 
	IL_1aa5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1aaa:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1aaf:  ldloc 56

	IL_1ab3:  nop 
	IL_1ab4:  nop 
	IL_1ab5:  starg 1

	IL_1ab9:  nop 
	IL_1aba:  nop 
	IL_1abb:  br IL_4c61

	IL_1ac0:  br IL_1aca

	IL_1ac5:  br IL_1aca

	IL_1aca:  ldarg 1

	IL_1ace:  nop 
	IL_1acf:  nop 
	IL_1ad0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ad5:  ldstr "exe"
	IL_1ada:  call int32 string::Compare(string, string)
	IL_1adf:  stloc 0

	IL_1ae3:  nop 
	IL_1ae4:  nop 
	IL_1ae5:  ldloc 0

	IL_1ae9:  nop 
	IL_1aea:  nop 
	IL_1aeb:  ldc.i4 0
	IL_1af0:  beq IL_1afa

	IL_1af5:  br IL_1b47

	IL_1afa:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok::'.ctor'()
	IL_1aff:  stloc 57

	IL_1b03:  nop 
	IL_1b04:  nop 
	IL_1b05:  ldloc 57

	IL_1b09:  nop 
	IL_1b0a:  nop 
	IL_1b0b:  ldarg 1

	IL_1b0f:  nop 
	IL_1b10:  nop 
	IL_1b11:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b16:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b1b:  ldloc 57

	IL_1b1f:  nop 
	IL_1b20:  nop 
	IL_1b21:  ldarg 1

	IL_1b25:  nop 
	IL_1b26:  nop 
	IL_1b27:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b2c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b31:  ldloc 57

	IL_1b35:  nop 
	IL_1b36:  nop 
	IL_1b37:  starg 1

	IL_1b3b:  nop 
	IL_1b3c:  nop 
	IL_1b3d:  br IL_4c61

	IL_1b42:  br IL_1b4c

	IL_1b47:  br IL_1b4c

	IL_1b4c:  ldarg 1

	IL_1b50:  nop 
	IL_1b51:  nop 
	IL_1b52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b57:  ldstr "dll"
	IL_1b5c:  call int32 string::Compare(string, string)
	IL_1b61:  stloc 0

	IL_1b65:  nop 
	IL_1b66:  nop 
	IL_1b67:  ldloc 0

	IL_1b6b:  nop 
	IL_1b6c:  nop 
	IL_1b6d:  ldc.i4 0
	IL_1b72:  beq IL_1b7c

	IL_1b77:  br IL_1bc9

	IL_1b7c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok::'.ctor'()
	IL_1b81:  stloc 58

	IL_1b85:  nop 
	IL_1b86:  nop 
	IL_1b87:  ldloc 58

	IL_1b8b:  nop 
	IL_1b8c:  nop 
	IL_1b8d:  ldarg 1

	IL_1b91:  nop 
	IL_1b92:  nop 
	IL_1b93:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b98:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1b9d:  ldloc 58

	IL_1ba1:  nop 
	IL_1ba2:  nop 
	IL_1ba3:  ldarg 1

	IL_1ba7:  nop 
	IL_1ba8:  nop 
	IL_1ba9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1bae:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1bb3:  ldloc 58

	IL_1bb7:  nop 
	IL_1bb8:  nop 
	IL_1bb9:  starg 1

	IL_1bbd:  nop 
	IL_1bbe:  nop 
	IL_1bbf:  br IL_4c61

	IL_1bc4:  br IL_1bce

	IL_1bc9:  br IL_1bce

	IL_1bce:  ldarg 1

	IL_1bd2:  nop 
	IL_1bd3:  nop 
	IL_1bd4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1bd9:  ldstr "field"
	IL_1bde:  call int32 string::Compare(string, string)
	IL_1be3:  stloc 0

	IL_1be7:  nop 
	IL_1be8:  nop 
	IL_1be9:  ldloc 0

	IL_1bed:  nop 
	IL_1bee:  nop 
	IL_1bef:  ldc.i4 0
	IL_1bf4:  beq IL_1bfe

	IL_1bf9:  br IL_1c4b

	IL_1bfe:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok::'.ctor'()
	IL_1c03:  stloc 59

	IL_1c07:  nop 
	IL_1c08:  nop 
	IL_1c09:  ldloc 59

	IL_1c0d:  nop 
	IL_1c0e:  nop 
	IL_1c0f:  ldarg 1

	IL_1c13:  nop 
	IL_1c14:  nop 
	IL_1c15:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c1a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c1f:  ldloc 59

	IL_1c23:  nop 
	IL_1c24:  nop 
	IL_1c25:  ldarg 1

	IL_1c29:  nop 
	IL_1c2a:  nop 
	IL_1c2b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c30:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c35:  ldloc 59

	IL_1c39:  nop 
	IL_1c3a:  nop 
	IL_1c3b:  starg 1

	IL_1c3f:  nop 
	IL_1c40:  nop 
	IL_1c41:  br IL_4c61

	IL_1c46:  br IL_1c50

	IL_1c4b:  br IL_1c50

	IL_1c50:  ldarg 1

	IL_1c54:  nop 
	IL_1c55:  nop 
	IL_1c56:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c5b:  ldstr "class"
	IL_1c60:  call int32 string::Compare(string, string)
	IL_1c65:  stloc 0

	IL_1c69:  nop 
	IL_1c6a:  nop 
	IL_1c6b:  ldloc 0

	IL_1c6f:  nop 
	IL_1c70:  nop 
	IL_1c71:  ldc.i4 0
	IL_1c76:  beq IL_1c80

	IL_1c7b:  br IL_1ccd

	IL_1c80:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok::'.ctor'()
	IL_1c85:  stloc 60

	IL_1c89:  nop 
	IL_1c8a:  nop 
	IL_1c8b:  ldloc 60

	IL_1c8f:  nop 
	IL_1c90:  nop 
	IL_1c91:  ldarg 1

	IL_1c95:  nop 
	IL_1c96:  nop 
	IL_1c97:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c9c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1ca1:  ldloc 60

	IL_1ca5:  nop 
	IL_1ca6:  nop 
	IL_1ca7:  ldarg 1

	IL_1cab:  nop 
	IL_1cac:  nop 
	IL_1cad:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cb2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cb7:  ldloc 60

	IL_1cbb:  nop 
	IL_1cbc:  nop 
	IL_1cbd:  starg 1

	IL_1cc1:  nop 
	IL_1cc2:  nop 
	IL_1cc3:  br IL_4c61

	IL_1cc8:  br IL_1cd2

	IL_1ccd:  br IL_1cd2

	IL_1cd2:  ldarg 1

	IL_1cd6:  nop 
	IL_1cd7:  nop 
	IL_1cd8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cdd:  ldstr "extends"
	IL_1ce2:  call int32 string::Compare(string, string)
	IL_1ce7:  stloc 0

	IL_1ceb:  nop 
	IL_1cec:  nop 
	IL_1ced:  ldloc 0

	IL_1cf1:  nop 
	IL_1cf2:  nop 
	IL_1cf3:  ldc.i4 0
	IL_1cf8:  beq IL_1d02

	IL_1cfd:  br IL_1d4f

	IL_1d02:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok::'.ctor'()
	IL_1d07:  stloc 61

	IL_1d0b:  nop 
	IL_1d0c:  nop 
	IL_1d0d:  ldloc 61

	IL_1d11:  nop 
	IL_1d12:  nop 
	IL_1d13:  ldarg 1

	IL_1d17:  nop 
	IL_1d18:  nop 
	IL_1d19:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1d1e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1d23:  ldloc 61

	IL_1d27:  nop 
	IL_1d28:  nop 
	IL_1d29:  ldarg 1

	IL_1d2d:  nop 
	IL_1d2e:  nop 
	IL_1d2f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d34:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d39:  ldloc 61

	IL_1d3d:  nop 
	IL_1d3e:  nop 
	IL_1d3f:  starg 1

	IL_1d43:  nop 
	IL_1d44:  nop 
	IL_1d45:  br IL_4c61

	IL_1d4a:  br IL_1d54

	IL_1d4f:  br IL_1d54

	IL_1d54:  ldarg 1

	IL_1d58:  nop 
	IL_1d59:  nop 
	IL_1d5a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d5f:  ldstr "method"
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

	IL_1d84:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok::'.ctor'()
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
	IL_1dc7:  br IL_4c61

	IL_1dcc:  br IL_1dd6

	IL_1dd1:  br IL_1dd6

	IL_1dd6:  ldarg 1

	IL_1dda:  nop 
	IL_1ddb:  nop 
	IL_1ddc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1de1:  ldstr "end"
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

	IL_1e06:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok::'.ctor'()
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
	IL_1e49:  br IL_4c61

	IL_1e4e:  br IL_1e58

	IL_1e53:  br IL_1e58

	IL_1e58:  ldarg 1

	IL_1e5c:  nop 
	IL_1e5d:  nop 
	IL_1e5e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1e63:  ldstr "return"
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

	IL_1e88:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok::'.ctor'()
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
	IL_1ecb:  br IL_4c61

	IL_1ed0:  br IL_1eda

	IL_1ed5:  br IL_1eda

	IL_1eda:  ldarg 1

	IL_1ede:  nop 
	IL_1edf:  nop 
	IL_1ee0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ee5:  ldstr "var"
	IL_1eea:  call int32 string::Compare(string, string)
	IL_1eef:  stloc 0

	IL_1ef3:  nop 
	IL_1ef4:  nop 
	IL_1ef5:  ldloc 0

	IL_1ef9:  nop 
	IL_1efa:  nop 
	IL_1efb:  ldc.i4 0
	IL_1f00:  beq IL_1f0a

	IL_1f05:  br IL_1f57

	IL_1f0a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok::'.ctor'()
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
	IL_1f4d:  br IL_4c61

	IL_1f52:  br IL_1f5c

	IL_1f57:  br IL_1f5c

	IL_1f5c:  ldarg 1

	IL_1f60:  nop 
	IL_1f61:  nop 
	IL_1f62:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f67:  ldstr "as"
	IL_1f6c:  call int32 string::Compare(string, string)
	IL_1f71:  stloc 0

	IL_1f75:  nop 
	IL_1f76:  nop 
	IL_1f77:  ldloc 0

	IL_1f7b:  nop 
	IL_1f7c:  nop 
	IL_1f7d:  ldc.i4 0
	IL_1f82:  beq IL_1f8c

	IL_1f87:  br IL_1fd9

	IL_1f8c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok::'.ctor'()
	IL_1f91:  stloc 66

	IL_1f95:  nop 
	IL_1f96:  nop 
	IL_1f97:  ldloc 66

	IL_1f9b:  nop 
	IL_1f9c:  nop 
	IL_1f9d:  ldarg 1

	IL_1fa1:  nop 
	IL_1fa2:  nop 
	IL_1fa3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1fa8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1fad:  ldloc 66

	IL_1fb1:  nop 
	IL_1fb2:  nop 
	IL_1fb3:  ldarg 1

	IL_1fb7:  nop 
	IL_1fb8:  nop 
	IL_1fb9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1fbe:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1fc3:  ldloc 66

	IL_1fc7:  nop 
	IL_1fc8:  nop 
	IL_1fc9:  starg 1

	IL_1fcd:  nop 
	IL_1fce:  nop 
	IL_1fcf:  br IL_4c61

	IL_1fd4:  br IL_1fde

	IL_1fd9:  br IL_1fde

	IL_1fde:  ldarg 1

	IL_1fe2:  nop 
	IL_1fe3:  nop 
	IL_1fe4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1fe9:  ldstr "of"
	IL_1fee:  call int32 string::Compare(string, string)
	IL_1ff3:  stloc 0

	IL_1ff7:  nop 
	IL_1ff8:  nop 
	IL_1ff9:  ldloc 0

	IL_1ffd:  nop 
	IL_1ffe:  nop 
	IL_1fff:  ldc.i4 0
	IL_2004:  beq IL_200e

	IL_2009:  br IL_205b

	IL_200e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok::'.ctor'()
	IL_2013:  stloc 67

	IL_2017:  nop 
	IL_2018:  nop 
	IL_2019:  ldloc 67

	IL_201d:  nop 
	IL_201e:  nop 
	IL_201f:  ldarg 1

	IL_2023:  nop 
	IL_2024:  nop 
	IL_2025:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_202a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_202f:  ldloc 67

	IL_2033:  nop 
	IL_2034:  nop 
	IL_2035:  ldarg 1

	IL_2039:  nop 
	IL_203a:  nop 
	IL_203b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2040:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2045:  ldloc 67

	IL_2049:  nop 
	IL_204a:  nop 
	IL_204b:  starg 1

	IL_204f:  nop 
	IL_2050:  nop 
	IL_2051:  br IL_4c61

	IL_2056:  br IL_2060

	IL_205b:  br IL_2060

	IL_2060:  ldarg 1

	IL_2064:  nop 
	IL_2065:  nop 
	IL_2066:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_206b:  ldstr "private"
	IL_2070:  call int32 string::Compare(string, string)
	IL_2075:  stloc 0

	IL_2079:  nop 
	IL_207a:  nop 
	IL_207b:  ldloc 0

	IL_207f:  nop 
	IL_2080:  nop 
	IL_2081:  ldc.i4 0
	IL_2086:  beq IL_2090

	IL_208b:  br IL_20dd

	IL_2090:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr::'.ctor'()
	IL_2095:  stloc 68

	IL_2099:  nop 
	IL_209a:  nop 
	IL_209b:  ldloc 68

	IL_209f:  nop 
	IL_20a0:  nop 
	IL_20a1:  ldarg 1

	IL_20a5:  nop 
	IL_20a6:  nop 
	IL_20a7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_20ac:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_20b1:  ldloc 68

	IL_20b5:  nop 
	IL_20b6:  nop 
	IL_20b7:  ldarg 1

	IL_20bb:  nop 
	IL_20bc:  nop 
	IL_20bd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20c2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20c7:  ldloc 68

	IL_20cb:  nop 
	IL_20cc:  nop 
	IL_20cd:  starg 1

	IL_20d1:  nop 
	IL_20d2:  nop 
	IL_20d3:  br IL_4c61

	IL_20d8:  br IL_20e2

	IL_20dd:  br IL_20e2

	IL_20e2:  ldarg 1

	IL_20e6:  nop 
	IL_20e7:  nop 
	IL_20e8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20ed:  ldstr "public"
	IL_20f2:  call int32 string::Compare(string, string)
	IL_20f7:  stloc 0

	IL_20fb:  nop 
	IL_20fc:  nop 
	IL_20fd:  ldloc 0

	IL_2101:  nop 
	IL_2102:  nop 
	IL_2103:  ldc.i4 0
	IL_2108:  beq IL_2112

	IL_210d:  br IL_215f

	IL_2112:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr::'.ctor'()
	IL_2117:  stloc 69

	IL_211b:  nop 
	IL_211c:  nop 
	IL_211d:  ldloc 69

	IL_2121:  nop 
	IL_2122:  nop 
	IL_2123:  ldarg 1

	IL_2127:  nop 
	IL_2128:  nop 
	IL_2129:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_212e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2133:  ldloc 69

	IL_2137:  nop 
	IL_2138:  nop 
	IL_2139:  ldarg 1

	IL_213d:  nop 
	IL_213e:  nop 
	IL_213f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2144:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2149:  ldloc 69

	IL_214d:  nop 
	IL_214e:  nop 
	IL_214f:  starg 1

	IL_2153:  nop 
	IL_2154:  nop 
	IL_2155:  br IL_4c61

	IL_215a:  br IL_2164

	IL_215f:  br IL_2164

	IL_2164:  ldarg 1

	IL_2168:  nop 
	IL_2169:  nop 
	IL_216a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_216f:  ldstr "initonly"
	IL_2174:  call int32 string::Compare(string, string)
	IL_2179:  stloc 0

	IL_217d:  nop 
	IL_217e:  nop 
	IL_217f:  ldloc 0

	IL_2183:  nop 
	IL_2184:  nop 
	IL_2185:  ldc.i4 0
	IL_218a:  beq IL_2194

	IL_218f:  br IL_21e1

	IL_2194:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr::'.ctor'()
	IL_2199:  stloc 70

	IL_219d:  nop 
	IL_219e:  nop 
	IL_219f:  ldloc 70

	IL_21a3:  nop 
	IL_21a4:  nop 
	IL_21a5:  ldarg 1

	IL_21a9:  nop 
	IL_21aa:  nop 
	IL_21ab:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_21b0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_21b5:  ldloc 70

	IL_21b9:  nop 
	IL_21ba:  nop 
	IL_21bb:  ldarg 1

	IL_21bf:  nop 
	IL_21c0:  nop 
	IL_21c1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21c6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21cb:  ldloc 70

	IL_21cf:  nop 
	IL_21d0:  nop 
	IL_21d1:  starg 1

	IL_21d5:  nop 
	IL_21d6:  nop 
	IL_21d7:  br IL_4c61

	IL_21dc:  br IL_21e6

	IL_21e1:  br IL_21e6

	IL_21e6:  ldarg 1

	IL_21ea:  nop 
	IL_21eb:  nop 
	IL_21ec:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21f1:  ldstr "static"
	IL_21f6:  call int32 string::Compare(string, string)
	IL_21fb:  stloc 0

	IL_21ff:  nop 
	IL_2200:  nop 
	IL_2201:  ldloc 0

	IL_2205:  nop 
	IL_2206:  nop 
	IL_2207:  ldc.i4 0
	IL_220c:  beq IL_2216

	IL_2211:  br IL_2263

	IL_2216:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr::'.ctor'()
	IL_221b:  stloc 71

	IL_221f:  nop 
	IL_2220:  nop 
	IL_2221:  ldloc 71

	IL_2225:  nop 
	IL_2226:  nop 
	IL_2227:  ldarg 1

	IL_222b:  nop 
	IL_222c:  nop 
	IL_222d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2232:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2237:  ldloc 71

	IL_223b:  nop 
	IL_223c:  nop 
	IL_223d:  ldarg 1

	IL_2241:  nop 
	IL_2242:  nop 
	IL_2243:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2248:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_224d:  ldloc 71

	IL_2251:  nop 
	IL_2252:  nop 
	IL_2253:  starg 1

	IL_2257:  nop 
	IL_2258:  nop 
	IL_2259:  br IL_4c61

	IL_225e:  br IL_2268

	IL_2263:  br IL_2268

	IL_2268:  ldarg 1

	IL_226c:  nop 
	IL_226d:  nop 
	IL_226e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2273:  ldstr "specialname"
	IL_2278:  call int32 string::Compare(string, string)
	IL_227d:  stloc 0

	IL_2281:  nop 
	IL_2282:  nop 
	IL_2283:  ldloc 0

	IL_2287:  nop 
	IL_2288:  nop 
	IL_2289:  ldc.i4 0
	IL_228e:  beq IL_2298

	IL_2293:  br IL_22e5

	IL_2298:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr::'.ctor'()
	IL_229d:  stloc 72

	IL_22a1:  nop 
	IL_22a2:  nop 
	IL_22a3:  ldloc 72

	IL_22a7:  nop 
	IL_22a8:  nop 
	IL_22a9:  ldarg 1

	IL_22ad:  nop 
	IL_22ae:  nop 
	IL_22af:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_22b4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_22b9:  ldloc 72

	IL_22bd:  nop 
	IL_22be:  nop 
	IL_22bf:  ldarg 1

	IL_22c3:  nop 
	IL_22c4:  nop 
	IL_22c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22ca:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22cf:  ldloc 72

	IL_22d3:  nop 
	IL_22d4:  nop 
	IL_22d5:  starg 1

	IL_22d9:  nop 
	IL_22da:  nop 
	IL_22db:  br IL_4c61

	IL_22e0:  br IL_22ea

	IL_22e5:  br IL_22ea

	IL_22ea:  ldarg 1

	IL_22ee:  nop 
	IL_22ef:  nop 
	IL_22f0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22f5:  ldstr "virtual"
	IL_22fa:  call int32 string::Compare(string, string)
	IL_22ff:  stloc 0

	IL_2303:  nop 
	IL_2304:  nop 
	IL_2305:  ldloc 0

	IL_2309:  nop 
	IL_230a:  nop 
	IL_230b:  ldc.i4 0
	IL_2310:  beq IL_231a

	IL_2315:  br IL_2367

	IL_231a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr::'.ctor'()
	IL_231f:  stloc 73

	IL_2323:  nop 
	IL_2324:  nop 
	IL_2325:  ldloc 73

	IL_2329:  nop 
	IL_232a:  nop 
	IL_232b:  ldarg 1

	IL_232f:  nop 
	IL_2330:  nop 
	IL_2331:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2336:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_233b:  ldloc 73

	IL_233f:  nop 
	IL_2340:  nop 
	IL_2341:  ldarg 1

	IL_2345:  nop 
	IL_2346:  nop 
	IL_2347:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_234c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2351:  ldloc 73

	IL_2355:  nop 
	IL_2356:  nop 
	IL_2357:  starg 1

	IL_235b:  nop 
	IL_235c:  nop 
	IL_235d:  br IL_4c61

	IL_2362:  br IL_236c

	IL_2367:  br IL_236c

	IL_236c:  ldarg 1

	IL_2370:  nop 
	IL_2371:  nop 
	IL_2372:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2377:  ldstr "auto"
	IL_237c:  call int32 string::Compare(string, string)
	IL_2381:  stloc 0

	IL_2385:  nop 
	IL_2386:  nop 
	IL_2387:  ldloc 0

	IL_238b:  nop 
	IL_238c:  nop 
	IL_238d:  ldc.i4 0
	IL_2392:  beq IL_239c

	IL_2397:  br IL_23e9

	IL_239c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr::'.ctor'()
	IL_23a1:  stloc 74

	IL_23a5:  nop 
	IL_23a6:  nop 
	IL_23a7:  ldloc 74

	IL_23ab:  nop 
	IL_23ac:  nop 
	IL_23ad:  ldarg 1

	IL_23b1:  nop 
	IL_23b2:  nop 
	IL_23b3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_23b8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_23bd:  ldloc 74

	IL_23c1:  nop 
	IL_23c2:  nop 
	IL_23c3:  ldarg 1

	IL_23c7:  nop 
	IL_23c8:  nop 
	IL_23c9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23ce:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23d3:  ldloc 74

	IL_23d7:  nop 
	IL_23d8:  nop 
	IL_23d9:  starg 1

	IL_23dd:  nop 
	IL_23de:  nop 
	IL_23df:  br IL_4c61

	IL_23e4:  br IL_23ee

	IL_23e9:  br IL_23ee

	IL_23ee:  ldarg 1

	IL_23f2:  nop 
	IL_23f3:  nop 
	IL_23f4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23f9:  ldstr "autochar"
	IL_23fe:  call int32 string::Compare(string, string)
	IL_2403:  stloc 0

	IL_2407:  nop 
	IL_2408:  nop 
	IL_2409:  ldloc 0

	IL_240d:  nop 
	IL_240e:  nop 
	IL_240f:  ldc.i4 0
	IL_2414:  beq IL_241e

	IL_2419:  br IL_246b

	IL_241e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr::'.ctor'()
	IL_2423:  stloc 75

	IL_2427:  nop 
	IL_2428:  nop 
	IL_2429:  ldloc 75

	IL_242d:  nop 
	IL_242e:  nop 
	IL_242f:  ldarg 1

	IL_2433:  nop 
	IL_2434:  nop 
	IL_2435:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_243a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_243f:  ldloc 75

	IL_2443:  nop 
	IL_2444:  nop 
	IL_2445:  ldarg 1

	IL_2449:  nop 
	IL_244a:  nop 
	IL_244b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2450:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2455:  ldloc 75

	IL_2459:  nop 
	IL_245a:  nop 
	IL_245b:  starg 1

	IL_245f:  nop 
	IL_2460:  nop 
	IL_2461:  br IL_4c61

	IL_2466:  br IL_2470

	IL_246b:  br IL_2470

	IL_2470:  ldarg 1

	IL_2474:  nop 
	IL_2475:  nop 
	IL_2476:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_247b:  ldstr "ansi"
	IL_2480:  call int32 string::Compare(string, string)
	IL_2485:  stloc 0

	IL_2489:  nop 
	IL_248a:  nop 
	IL_248b:  ldloc 0

	IL_248f:  nop 
	IL_2490:  nop 
	IL_2491:  ldc.i4 0
	IL_2496:  beq IL_24a0

	IL_249b:  br IL_24ed

	IL_24a0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr::'.ctor'()
	IL_24a5:  stloc 76

	IL_24a9:  nop 
	IL_24aa:  nop 
	IL_24ab:  ldloc 76

	IL_24af:  nop 
	IL_24b0:  nop 
	IL_24b1:  ldarg 1

	IL_24b5:  nop 
	IL_24b6:  nop 
	IL_24b7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_24bc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_24c1:  ldloc 76

	IL_24c5:  nop 
	IL_24c6:  nop 
	IL_24c7:  ldarg 1

	IL_24cb:  nop 
	IL_24cc:  nop 
	IL_24cd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24d2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24d7:  ldloc 76

	IL_24db:  nop 
	IL_24dc:  nop 
	IL_24dd:  starg 1

	IL_24e1:  nop 
	IL_24e2:  nop 
	IL_24e3:  br IL_4c61

	IL_24e8:  br IL_24f2

	IL_24ed:  br IL_24f2

	IL_24f2:  ldarg 1

	IL_24f6:  nop 
	IL_24f7:  nop 
	IL_24f8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24fd:  ldstr "beforefieldinit"
	IL_2502:  call int32 string::Compare(string, string)
	IL_2507:  stloc 0

	IL_250b:  nop 
	IL_250c:  nop 
	IL_250d:  ldloc 0

	IL_2511:  nop 
	IL_2512:  nop 
	IL_2513:  ldc.i4 0
	IL_2518:  beq IL_2522

	IL_251d:  br IL_256f

	IL_2522:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr::'.ctor'()
	IL_2527:  stloc 77

	IL_252b:  nop 
	IL_252c:  nop 
	IL_252d:  ldloc 77

	IL_2531:  nop 
	IL_2532:  nop 
	IL_2533:  ldarg 1

	IL_2537:  nop 
	IL_2538:  nop 
	IL_2539:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_253e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2543:  ldloc 77

	IL_2547:  nop 
	IL_2548:  nop 
	IL_2549:  ldarg 1

	IL_254d:  nop 
	IL_254e:  nop 
	IL_254f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2554:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2559:  ldloc 77

	IL_255d:  nop 
	IL_255e:  nop 
	IL_255f:  starg 1

	IL_2563:  nop 
	IL_2564:  nop 
	IL_2565:  br IL_4c61

	IL_256a:  br IL_2574

	IL_256f:  br IL_2574

	IL_2574:  ldarg 1

	IL_2578:  nop 
	IL_2579:  nop 
	IL_257a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_257f:  ldstr "string"
	IL_2584:  call int32 string::Compare(string, string)
	IL_2589:  stloc 0

	IL_258d:  nop 
	IL_258e:  nop 
	IL_258f:  ldloc 0

	IL_2593:  nop 
	IL_2594:  nop 
	IL_2595:  ldc.i4 0
	IL_259a:  beq IL_25a4

	IL_259f:  br IL_2606

	IL_25a4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok::'.ctor'()
	IL_25a9:  stloc 78

	IL_25ad:  nop 
	IL_25ae:  nop 
	IL_25af:  ldloc 78

	IL_25b3:  nop 
	IL_25b4:  nop 
	IL_25b5:  ldarg 1

	IL_25b9:  nop 
	IL_25ba:  nop 
	IL_25bb:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_25c0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_25c5:  ldloc 78

	IL_25c9:  nop 
	IL_25ca:  nop 
	IL_25cb:  ldarg 1

	IL_25cf:  nop 
	IL_25d0:  nop 
	IL_25d1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_25d6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_25db:  ldloc 78

	IL_25df:  nop 
	IL_25e0:  nop 
	IL_25e1:  ldtoken [mscorlib]System.String
	IL_25e6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_25eb:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_25f0:  ldloc 78

	IL_25f4:  nop 
	IL_25f5:  nop 
	IL_25f6:  starg 1

	IL_25fa:  nop 
	IL_25fb:  nop 
	IL_25fc:  br IL_4c61

	IL_2601:  br IL_260b

	IL_2606:  br IL_260b

	IL_260b:  ldarg 1

	IL_260f:  nop 
	IL_2610:  nop 
	IL_2611:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2616:  ldstr "void"
	IL_261b:  call int32 string::Compare(string, string)
	IL_2620:  stloc 0

	IL_2624:  nop 
	IL_2625:  nop 
	IL_2626:  ldloc 0

	IL_262a:  nop 
	IL_262b:  nop 
	IL_262c:  ldc.i4 0
	IL_2631:  beq IL_263b

	IL_2636:  br IL_269d

	IL_263b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok::'.ctor'()
	IL_2640:  stloc 79

	IL_2644:  nop 
	IL_2645:  nop 
	IL_2646:  ldloc 79

	IL_264a:  nop 
	IL_264b:  nop 
	IL_264c:  ldarg 1

	IL_2650:  nop 
	IL_2651:  nop 
	IL_2652:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2657:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_265c:  ldloc 79

	IL_2660:  nop 
	IL_2661:  nop 
	IL_2662:  ldarg 1

	IL_2666:  nop 
	IL_2667:  nop 
	IL_2668:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_266d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2672:  ldloc 79

	IL_2676:  nop 
	IL_2677:  nop 
	IL_2678:  ldtoken [mscorlib]System.Void
	IL_267d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2682:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2687:  ldloc 79

	IL_268b:  nop 
	IL_268c:  nop 
	IL_268d:  starg 1

	IL_2691:  nop 
	IL_2692:  nop 
	IL_2693:  br IL_4c61

	IL_2698:  br IL_26a2

	IL_269d:  br IL_26a2

	IL_26a2:  ldarg 1

	IL_26a6:  nop 
	IL_26a7:  nop 
	IL_26a8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26ad:  ldstr "decimal"
	IL_26b2:  call int32 string::Compare(string, string)
	IL_26b7:  stloc 0

	IL_26bb:  nop 
	IL_26bc:  nop 
	IL_26bd:  ldloc 0

	IL_26c1:  nop 
	IL_26c2:  nop 
	IL_26c3:  ldc.i4 0
	IL_26c8:  beq IL_26d2

	IL_26cd:  br IL_2734

	IL_26d2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok::'.ctor'()
	IL_26d7:  stloc 80

	IL_26db:  nop 
	IL_26dc:  nop 
	IL_26dd:  ldloc 80

	IL_26e1:  nop 
	IL_26e2:  nop 
	IL_26e3:  ldarg 1

	IL_26e7:  nop 
	IL_26e8:  nop 
	IL_26e9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_26ee:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_26f3:  ldloc 80

	IL_26f7:  nop 
	IL_26f8:  nop 
	IL_26f9:  ldarg 1

	IL_26fd:  nop 
	IL_26fe:  nop 
	IL_26ff:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2704:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2709:  ldloc 80

	IL_270d:  nop 
	IL_270e:  nop 
	IL_270f:  ldtoken [mscorlib]System.Decimal
	IL_2714:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2719:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_271e:  ldloc 80

	IL_2722:  nop 
	IL_2723:  nop 
	IL_2724:  starg 1

	IL_2728:  nop 
	IL_2729:  nop 
	IL_272a:  br IL_4c61

	IL_272f:  br IL_2739

	IL_2734:  br IL_2739

	IL_2739:  ldarg 1

	IL_273d:  nop 
	IL_273e:  nop 
	IL_273f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2744:  ldstr "integer"
	IL_2749:  call int32 string::Compare(string, string)
	IL_274e:  stloc 0

	IL_2752:  nop 
	IL_2753:  nop 
	IL_2754:  ldloc 0

	IL_2758:  nop 
	IL_2759:  nop 
	IL_275a:  ldc.i4 0
	IL_275f:  beq IL_2769

	IL_2764:  br IL_27cb

	IL_2769:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok::'.ctor'()
	IL_276e:  stloc 81

	IL_2772:  nop 
	IL_2773:  nop 
	IL_2774:  ldloc 81

	IL_2778:  nop 
	IL_2779:  nop 
	IL_277a:  ldarg 1

	IL_277e:  nop 
	IL_277f:  nop 
	IL_2780:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2785:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_278a:  ldloc 81

	IL_278e:  nop 
	IL_278f:  nop 
	IL_2790:  ldarg 1

	IL_2794:  nop 
	IL_2795:  nop 
	IL_2796:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_279b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27a0:  ldloc 81

	IL_27a4:  nop 
	IL_27a5:  nop 
	IL_27a6:  ldtoken [mscorlib]System.Int32
	IL_27ab:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_27b0:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_27b5:  ldloc 81

	IL_27b9:  nop 
	IL_27ba:  nop 
	IL_27bb:  starg 1

	IL_27bf:  nop 
	IL_27c0:  nop 
	IL_27c1:  br IL_4c61

	IL_27c6:  br IL_27d0

	IL_27cb:  br IL_27d0

	IL_27d0:  ldarg 1

	IL_27d4:  nop 
	IL_27d5:  nop 
	IL_27d6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27db:  ldstr "intptr"
	IL_27e0:  call int32 string::Compare(string, string)
	IL_27e5:  stloc 0

	IL_27e9:  nop 
	IL_27ea:  nop 
	IL_27eb:  ldloc 0

	IL_27ef:  nop 
	IL_27f0:  nop 
	IL_27f1:  ldc.i4 0
	IL_27f6:  beq IL_2800

	IL_27fb:  br IL_2862

	IL_2800:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok::'.ctor'()
	IL_2805:  stloc 82

	IL_2809:  nop 
	IL_280a:  nop 
	IL_280b:  ldloc 82

	IL_280f:  nop 
	IL_2810:  nop 
	IL_2811:  ldarg 1

	IL_2815:  nop 
	IL_2816:  nop 
	IL_2817:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_281c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2821:  ldloc 82

	IL_2825:  nop 
	IL_2826:  nop 
	IL_2827:  ldarg 1

	IL_282b:  nop 
	IL_282c:  nop 
	IL_282d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2832:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2837:  ldloc 82

	IL_283b:  nop 
	IL_283c:  nop 
	IL_283d:  ldtoken [mscorlib]System.IntPtr
	IL_2842:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2847:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_284c:  ldloc 82

	IL_2850:  nop 
	IL_2851:  nop 
	IL_2852:  starg 1

	IL_2856:  nop 
	IL_2857:  nop 
	IL_2858:  br IL_4c61

	IL_285d:  br IL_2867

	IL_2862:  br IL_2867

	IL_2867:  ldarg 1

	IL_286b:  nop 
	IL_286c:  nop 
	IL_286d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2872:  ldstr "uinteger"
	IL_2877:  call int32 string::Compare(string, string)
	IL_287c:  stloc 0

	IL_2880:  nop 
	IL_2881:  nop 
	IL_2882:  ldloc 0

	IL_2886:  nop 
	IL_2887:  nop 
	IL_2888:  ldc.i4 0
	IL_288d:  beq IL_2897

	IL_2892:  br IL_28f9

	IL_2897:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok::'.ctor'()
	IL_289c:  stloc 83

	IL_28a0:  nop 
	IL_28a1:  nop 
	IL_28a2:  ldloc 83

	IL_28a6:  nop 
	IL_28a7:  nop 
	IL_28a8:  ldarg 1

	IL_28ac:  nop 
	IL_28ad:  nop 
	IL_28ae:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28b3:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28b8:  ldloc 83

	IL_28bc:  nop 
	IL_28bd:  nop 
	IL_28be:  ldarg 1

	IL_28c2:  nop 
	IL_28c3:  nop 
	IL_28c4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28c9:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28ce:  ldloc 83

	IL_28d2:  nop 
	IL_28d3:  nop 
	IL_28d4:  ldtoken [mscorlib]System.UInt32
	IL_28d9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_28de:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_28e3:  ldloc 83

	IL_28e7:  nop 
	IL_28e8:  nop 
	IL_28e9:  starg 1

	IL_28ed:  nop 
	IL_28ee:  nop 
	IL_28ef:  br IL_4c61

	IL_28f4:  br IL_28fe

	IL_28f9:  br IL_28fe

	IL_28fe:  ldarg 1

	IL_2902:  nop 
	IL_2903:  nop 
	IL_2904:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2909:  ldstr "double"
	IL_290e:  call int32 string::Compare(string, string)
	IL_2913:  stloc 0

	IL_2917:  nop 
	IL_2918:  nop 
	IL_2919:  ldloc 0

	IL_291d:  nop 
	IL_291e:  nop 
	IL_291f:  ldc.i4 0
	IL_2924:  beq IL_292e

	IL_2929:  br IL_2990

	IL_292e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok::'.ctor'()
	IL_2933:  stloc 84

	IL_2937:  nop 
	IL_2938:  nop 
	IL_2939:  ldloc 84

	IL_293d:  nop 
	IL_293e:  nop 
	IL_293f:  ldarg 1

	IL_2943:  nop 
	IL_2944:  nop 
	IL_2945:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_294a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_294f:  ldloc 84

	IL_2953:  nop 
	IL_2954:  nop 
	IL_2955:  ldarg 1

	IL_2959:  nop 
	IL_295a:  nop 
	IL_295b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2960:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2965:  ldloc 84

	IL_2969:  nop 
	IL_296a:  nop 
	IL_296b:  ldtoken [mscorlib]System.Double
	IL_2970:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2975:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_297a:  ldloc 84

	IL_297e:  nop 
	IL_297f:  nop 
	IL_2980:  starg 1

	IL_2984:  nop 
	IL_2985:  nop 
	IL_2986:  br IL_4c61

	IL_298b:  br IL_2995

	IL_2990:  br IL_2995

	IL_2995:  ldarg 1

	IL_2999:  nop 
	IL_299a:  nop 
	IL_299b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29a0:  ldstr "boolean"
	IL_29a5:  call int32 string::Compare(string, string)
	IL_29aa:  stloc 0

	IL_29ae:  nop 
	IL_29af:  nop 
	IL_29b0:  ldloc 0

	IL_29b4:  nop 
	IL_29b5:  nop 
	IL_29b6:  ldc.i4 0
	IL_29bb:  beq IL_29c5

	IL_29c0:  br IL_2a27

	IL_29c5:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok::'.ctor'()
	IL_29ca:  stloc 85

	IL_29ce:  nop 
	IL_29cf:  nop 
	IL_29d0:  ldloc 85

	IL_29d4:  nop 
	IL_29d5:  nop 
	IL_29d6:  ldarg 1

	IL_29da:  nop 
	IL_29db:  nop 
	IL_29dc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29e1:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29e6:  ldloc 85

	IL_29ea:  nop 
	IL_29eb:  nop 
	IL_29ec:  ldarg 1

	IL_29f0:  nop 
	IL_29f1:  nop 
	IL_29f2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29f7:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29fc:  ldloc 85

	IL_2a00:  nop 
	IL_2a01:  nop 
	IL_2a02:  ldtoken [mscorlib]System.Boolean
	IL_2a07:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2a0c:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2a11:  ldloc 85

	IL_2a15:  nop 
	IL_2a16:  nop 
	IL_2a17:  starg 1

	IL_2a1b:  nop 
	IL_2a1c:  nop 
	IL_2a1d:  br IL_4c61

	IL_2a22:  br IL_2a2c

	IL_2a27:  br IL_2a2c

	IL_2a2c:  ldarg 1

	IL_2a30:  nop 
	IL_2a31:  nop 
	IL_2a32:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a37:  ldstr "char"
	IL_2a3c:  call int32 string::Compare(string, string)
	IL_2a41:  stloc 0

	IL_2a45:  nop 
	IL_2a46:  nop 
	IL_2a47:  ldloc 0

	IL_2a4b:  nop 
	IL_2a4c:  nop 
	IL_2a4d:  ldc.i4 0
	IL_2a52:  beq IL_2a5c

	IL_2a57:  br IL_2abe

	IL_2a5c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok::'.ctor'()
	IL_2a61:  stloc 86

	IL_2a65:  nop 
	IL_2a66:  nop 
	IL_2a67:  ldloc 86

	IL_2a6b:  nop 
	IL_2a6c:  nop 
	IL_2a6d:  ldarg 1

	IL_2a71:  nop 
	IL_2a72:  nop 
	IL_2a73:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a78:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a7d:  ldloc 86

	IL_2a81:  nop 
	IL_2a82:  nop 
	IL_2a83:  ldarg 1

	IL_2a87:  nop 
	IL_2a88:  nop 
	IL_2a89:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a8e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a93:  ldloc 86

	IL_2a97:  nop 
	IL_2a98:  nop 
	IL_2a99:  ldtoken [mscorlib]System.Char
	IL_2a9e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2aa3:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2aa8:  ldloc 86

	IL_2aac:  nop 
	IL_2aad:  nop 
	IL_2aae:  starg 1

	IL_2ab2:  nop 
	IL_2ab3:  nop 
	IL_2ab4:  br IL_4c61

	IL_2ab9:  br IL_2ac3

	IL_2abe:  br IL_2ac3

	IL_2ac3:  ldarg 1

	IL_2ac7:  nop 
	IL_2ac8:  nop 
	IL_2ac9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ace:  ldstr "single"
	IL_2ad3:  call int32 string::Compare(string, string)
	IL_2ad8:  stloc 0

	IL_2adc:  nop 
	IL_2add:  nop 
	IL_2ade:  ldloc 0

	IL_2ae2:  nop 
	IL_2ae3:  nop 
	IL_2ae4:  ldc.i4 0
	IL_2ae9:  beq IL_2af3

	IL_2aee:  br IL_2b55

	IL_2af3:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok::'.ctor'()
	IL_2af8:  stloc 87

	IL_2afc:  nop 
	IL_2afd:  nop 
	IL_2afe:  ldloc 87

	IL_2b02:  nop 
	IL_2b03:  nop 
	IL_2b04:  ldarg 1

	IL_2b08:  nop 
	IL_2b09:  nop 
	IL_2b0a:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b0f:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b14:  ldloc 87

	IL_2b18:  nop 
	IL_2b19:  nop 
	IL_2b1a:  ldarg 1

	IL_2b1e:  nop 
	IL_2b1f:  nop 
	IL_2b20:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b25:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b2a:  ldloc 87

	IL_2b2e:  nop 
	IL_2b2f:  nop 
	IL_2b30:  ldtoken [mscorlib]System.Single
	IL_2b35:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2b3a:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2b3f:  ldloc 87

	IL_2b43:  nop 
	IL_2b44:  nop 
	IL_2b45:  starg 1

	IL_2b49:  nop 
	IL_2b4a:  nop 
	IL_2b4b:  br IL_4c61

	IL_2b50:  br IL_2b5a

	IL_2b55:  br IL_2b5a

	IL_2b5a:  ldarg 1

	IL_2b5e:  nop 
	IL_2b5f:  nop 
	IL_2b60:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b65:  ldstr "sbyte"
	IL_2b6a:  call int32 string::Compare(string, string)
	IL_2b6f:  stloc 0

	IL_2b73:  nop 
	IL_2b74:  nop 
	IL_2b75:  ldloc 0

	IL_2b79:  nop 
	IL_2b7a:  nop 
	IL_2b7b:  ldc.i4 0
	IL_2b80:  beq IL_2b8a

	IL_2b85:  br IL_2bec

	IL_2b8a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok::'.ctor'()
	IL_2b8f:  stloc 88

	IL_2b93:  nop 
	IL_2b94:  nop 
	IL_2b95:  ldloc 88

	IL_2b99:  nop 
	IL_2b9a:  nop 
	IL_2b9b:  ldarg 1

	IL_2b9f:  nop 
	IL_2ba0:  nop 
	IL_2ba1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ba6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2bab:  ldloc 88

	IL_2baf:  nop 
	IL_2bb0:  nop 
	IL_2bb1:  ldarg 1

	IL_2bb5:  nop 
	IL_2bb6:  nop 
	IL_2bb7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bbc:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bc1:  ldloc 88

	IL_2bc5:  nop 
	IL_2bc6:  nop 
	IL_2bc7:  ldtoken [mscorlib]System.SByte
	IL_2bcc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2bd1:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2bd6:  ldloc 88

	IL_2bda:  nop 
	IL_2bdb:  nop 
	IL_2bdc:  starg 1

	IL_2be0:  nop 
	IL_2be1:  nop 
	IL_2be2:  br IL_4c61

	IL_2be7:  br IL_2bf1

	IL_2bec:  br IL_2bf1

	IL_2bf1:  ldarg 1

	IL_2bf5:  nop 
	IL_2bf6:  nop 
	IL_2bf7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bfc:  ldstr "byte"
	IL_2c01:  call int32 string::Compare(string, string)
	IL_2c06:  stloc 0

	IL_2c0a:  nop 
	IL_2c0b:  nop 
	IL_2c0c:  ldloc 0

	IL_2c10:  nop 
	IL_2c11:  nop 
	IL_2c12:  ldc.i4 0
	IL_2c17:  beq IL_2c21

	IL_2c1c:  br IL_2c83

	IL_2c21:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok::'.ctor'()
	IL_2c26:  stloc 89

	IL_2c2a:  nop 
	IL_2c2b:  nop 
	IL_2c2c:  ldloc 89

	IL_2c30:  nop 
	IL_2c31:  nop 
	IL_2c32:  ldarg 1

	IL_2c36:  nop 
	IL_2c37:  nop 
	IL_2c38:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c3d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c42:  ldloc 89

	IL_2c46:  nop 
	IL_2c47:  nop 
	IL_2c48:  ldarg 1

	IL_2c4c:  nop 
	IL_2c4d:  nop 
	IL_2c4e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c53:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c58:  ldloc 89

	IL_2c5c:  nop 
	IL_2c5d:  nop 
	IL_2c5e:  ldtoken [mscorlib]System.Byte
	IL_2c63:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2c68:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2c6d:  ldloc 89

	IL_2c71:  nop 
	IL_2c72:  nop 
	IL_2c73:  starg 1

	IL_2c77:  nop 
	IL_2c78:  nop 
	IL_2c79:  br IL_4c61

	IL_2c7e:  br IL_2c88

	IL_2c83:  br IL_2c88

	IL_2c88:  ldarg 1

	IL_2c8c:  nop 
	IL_2c8d:  nop 
	IL_2c8e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c93:  ldstr "short"
	IL_2c98:  call int32 string::Compare(string, string)
	IL_2c9d:  stloc 0

	IL_2ca1:  nop 
	IL_2ca2:  nop 
	IL_2ca3:  ldloc 0

	IL_2ca7:  nop 
	IL_2ca8:  nop 
	IL_2ca9:  ldc.i4 0
	IL_2cae:  beq IL_2cb8

	IL_2cb3:  br IL_2d1a

	IL_2cb8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok::'.ctor'()
	IL_2cbd:  stloc 90

	IL_2cc1:  nop 
	IL_2cc2:  nop 
	IL_2cc3:  ldloc 90

	IL_2cc7:  nop 
	IL_2cc8:  nop 
	IL_2cc9:  ldarg 1

	IL_2ccd:  nop 
	IL_2cce:  nop 
	IL_2ccf:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2cd4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2cd9:  ldloc 90

	IL_2cdd:  nop 
	IL_2cde:  nop 
	IL_2cdf:  ldarg 1

	IL_2ce3:  nop 
	IL_2ce4:  nop 
	IL_2ce5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2cea:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2cef:  ldloc 90

	IL_2cf3:  nop 
	IL_2cf4:  nop 
	IL_2cf5:  ldtoken [mscorlib]System.Int16
	IL_2cfa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2cff:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2d04:  ldloc 90

	IL_2d08:  nop 
	IL_2d09:  nop 
	IL_2d0a:  starg 1

	IL_2d0e:  nop 
	IL_2d0f:  nop 
	IL_2d10:  br IL_4c61

	IL_2d15:  br IL_2d1f

	IL_2d1a:  br IL_2d1f

	IL_2d1f:  ldarg 1

	IL_2d23:  nop 
	IL_2d24:  nop 
	IL_2d25:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d2a:  ldstr "ushort"
	IL_2d2f:  call int32 string::Compare(string, string)
	IL_2d34:  stloc 0

	IL_2d38:  nop 
	IL_2d39:  nop 
	IL_2d3a:  ldloc 0

	IL_2d3e:  nop 
	IL_2d3f:  nop 
	IL_2d40:  ldc.i4 0
	IL_2d45:  beq IL_2d4f

	IL_2d4a:  br IL_2db1

	IL_2d4f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok::'.ctor'()
	IL_2d54:  stloc 91

	IL_2d58:  nop 
	IL_2d59:  nop 
	IL_2d5a:  ldloc 91

	IL_2d5e:  nop 
	IL_2d5f:  nop 
	IL_2d60:  ldarg 1

	IL_2d64:  nop 
	IL_2d65:  nop 
	IL_2d66:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d6b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d70:  ldloc 91

	IL_2d74:  nop 
	IL_2d75:  nop 
	IL_2d76:  ldarg 1

	IL_2d7a:  nop 
	IL_2d7b:  nop 
	IL_2d7c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d81:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d86:  ldloc 91

	IL_2d8a:  nop 
	IL_2d8b:  nop 
	IL_2d8c:  ldtoken [mscorlib]System.UInt16
	IL_2d91:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2d96:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2d9b:  ldloc 91

	IL_2d9f:  nop 
	IL_2da0:  nop 
	IL_2da1:  starg 1

	IL_2da5:  nop 
	IL_2da6:  nop 
	IL_2da7:  br IL_4c61

	IL_2dac:  br IL_2db6

	IL_2db1:  br IL_2db6

	IL_2db6:  ldarg 1

	IL_2dba:  nop 
	IL_2dbb:  nop 
	IL_2dbc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2dc1:  ldstr "long"
	IL_2dc6:  call int32 string::Compare(string, string)
	IL_2dcb:  stloc 0

	IL_2dcf:  nop 
	IL_2dd0:  nop 
	IL_2dd1:  ldloc 0

	IL_2dd5:  nop 
	IL_2dd6:  nop 
	IL_2dd7:  ldc.i4 0
	IL_2ddc:  beq IL_2de6

	IL_2de1:  br IL_2e48

	IL_2de6:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok::'.ctor'()
	IL_2deb:  stloc 92

	IL_2def:  nop 
	IL_2df0:  nop 
	IL_2df1:  ldloc 92

	IL_2df5:  nop 
	IL_2df6:  nop 
	IL_2df7:  ldarg 1

	IL_2dfb:  nop 
	IL_2dfc:  nop 
	IL_2dfd:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e02:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e07:  ldloc 92

	IL_2e0b:  nop 
	IL_2e0c:  nop 
	IL_2e0d:  ldarg 1

	IL_2e11:  nop 
	IL_2e12:  nop 
	IL_2e13:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e18:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e1d:  ldloc 92

	IL_2e21:  nop 
	IL_2e22:  nop 
	IL_2e23:  ldtoken [mscorlib]System.Int64
	IL_2e28:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2e2d:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2e32:  ldloc 92

	IL_2e36:  nop 
	IL_2e37:  nop 
	IL_2e38:  starg 1

	IL_2e3c:  nop 
	IL_2e3d:  nop 
	IL_2e3e:  br IL_4c61

	IL_2e43:  br IL_2e4d

	IL_2e48:  br IL_2e4d

	IL_2e4d:  ldarg 1

	IL_2e51:  nop 
	IL_2e52:  nop 
	IL_2e53:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e58:  ldstr "ulong"
	IL_2e5d:  call int32 string::Compare(string, string)
	IL_2e62:  stloc 0

	IL_2e66:  nop 
	IL_2e67:  nop 
	IL_2e68:  ldloc 0

	IL_2e6c:  nop 
	IL_2e6d:  nop 
	IL_2e6e:  ldc.i4 0
	IL_2e73:  beq IL_2e7d

	IL_2e78:  br IL_2edf

	IL_2e7d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok::'.ctor'()
	IL_2e82:  stloc 93

	IL_2e86:  nop 
	IL_2e87:  nop 
	IL_2e88:  ldloc 93

	IL_2e8c:  nop 
	IL_2e8d:  nop 
	IL_2e8e:  ldarg 1

	IL_2e92:  nop 
	IL_2e93:  nop 
	IL_2e94:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e99:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e9e:  ldloc 93

	IL_2ea2:  nop 
	IL_2ea3:  nop 
	IL_2ea4:  ldarg 1

	IL_2ea8:  nop 
	IL_2ea9:  nop 
	IL_2eaa:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2eaf:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2eb4:  ldloc 93

	IL_2eb8:  nop 
	IL_2eb9:  nop 
	IL_2eba:  ldtoken [mscorlib]System.UInt64
	IL_2ebf:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2ec4:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2ec9:  ldloc 93

	IL_2ecd:  nop 
	IL_2ece:  nop 
	IL_2ecf:  starg 1

	IL_2ed3:  nop 
	IL_2ed4:  nop 
	IL_2ed5:  br IL_4c61

	IL_2eda:  br IL_2ee4

	IL_2edf:  br IL_2ee4

	IL_2ee4:  ldarg 1

	IL_2ee8:  nop 
	IL_2ee9:  nop 
	IL_2eea:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2eef:  ldstr "object"
	IL_2ef4:  call int32 string::Compare(string, string)
	IL_2ef9:  stloc 0

	IL_2efd:  nop 
	IL_2efe:  nop 
	IL_2eff:  ldloc 0

	IL_2f03:  nop 
	IL_2f04:  nop 
	IL_2f05:  ldc.i4 0
	IL_2f0a:  beq IL_2f14

	IL_2f0f:  br IL_2f76

	IL_2f14:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_2f19:  stloc 94

	IL_2f1d:  nop 
	IL_2f1e:  nop 
	IL_2f1f:  ldloc 94

	IL_2f23:  nop 
	IL_2f24:  nop 
	IL_2f25:  ldarg 1

	IL_2f29:  nop 
	IL_2f2a:  nop 
	IL_2f2b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f30:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f35:  ldloc 94

	IL_2f39:  nop 
	IL_2f3a:  nop 
	IL_2f3b:  ldarg 1

	IL_2f3f:  nop 
	IL_2f40:  nop 
	IL_2f41:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f46:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f4b:  ldloc 94

	IL_2f4f:  nop 
	IL_2f50:  nop 
	IL_2f51:  ldtoken [mscorlib]System.Object
	IL_2f56:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2f5b:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2f60:  ldloc 94

	IL_2f64:  nop 
	IL_2f65:  nop 
	IL_2f66:  starg 1

	IL_2f6a:  nop 
	IL_2f6b:  nop 
	IL_2f6c:  br IL_4c61

	IL_2f71:  br IL_2f7b

	IL_2f76:  br IL_2f7b

	IL_2f7b:  ldarg 1

	IL_2f7f:  nop 
	IL_2f80:  nop 
	IL_2f81:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f86:  ldstr "^//(.)*$"
	IL_2f8b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_2f90:  stloc 1

	IL_2f94:  nop 
	IL_2f95:  nop 
	IL_2f96:  ldloc 1

	IL_2f9a:  nop 
	IL_2f9b:  nop 
	IL_2f9c:  ldc.i4 1
	IL_2fa1:  beq IL_2fab

	IL_2fa6:  br IL_3002

	IL_2fab:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok::'.ctor'()
	IL_2fb0:  stloc 95

	IL_2fb4:  nop 
	IL_2fb5:  nop 
	IL_2fb6:  ldloc 95

	IL_2fba:  nop 
	IL_2fbb:  nop 
	IL_2fbc:  ldarg 1

	IL_2fc0:  nop 
	IL_2fc1:  nop 
	IL_2fc2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fc7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fcc:  ldloc 95

	IL_2fd0:  nop 
	IL_2fd1:  nop 
	IL_2fd2:  ldarg 1

	IL_2fd6:  nop 
	IL_2fd7:  nop 
	IL_2fd8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fdd:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fe2:  ldloc 95

	IL_2fe6:  nop 
	IL_2fe7:  nop 
	IL_2fe8:  starg 1

	IL_2fec:  nop 
	IL_2fed:  nop 
	IL_2fee:  ldc.i4 1
	IL_2ff3:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_2ff8:  br IL_4c61

	IL_2ffd:  br IL_3007

	IL_3002:  br IL_3007

	IL_3007:  ldarg 1

	IL_300b:  nop 
	IL_300c:  nop 
	IL_300d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3012:  ldstr "null"
	IL_3017:  call int32 string::Compare(string, string)
	IL_301c:  stloc 0

	IL_3020:  nop 
	IL_3021:  nop 
	IL_3022:  ldloc 0

	IL_3026:  nop 
	IL_3027:  nop 
	IL_3028:  ldc.i4 0
	IL_302d:  beq IL_3037

	IL_3032:  br IL_3084

	IL_3037:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::'.ctor'()
	IL_303c:  stloc 96

	IL_3040:  nop 
	IL_3041:  nop 
	IL_3042:  ldloc 96

	IL_3046:  nop 
	IL_3047:  nop 
	IL_3048:  ldarg 1

	IL_304c:  nop 
	IL_304d:  nop 
	IL_304e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3053:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3058:  ldloc 96

	IL_305c:  nop 
	IL_305d:  nop 
	IL_305e:  ldarg 1

	IL_3062:  nop 
	IL_3063:  nop 
	IL_3064:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3069:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_306e:  ldloc 96

	IL_3072:  nop 
	IL_3073:  nop 
	IL_3074:  starg 1

	IL_3078:  nop 
	IL_3079:  nop 
	IL_307a:  br IL_4c61

	IL_307f:  br IL_3089

	IL_3084:  br IL_3089

	IL_3089:  ldarg 1

	IL_308d:  nop 
	IL_308e:  nop 
	IL_308f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3094:  ldstr "true"
	IL_3099:  call int32 string::Compare(string, string)
	IL_309e:  stloc 0

	IL_30a2:  nop 
	IL_30a3:  nop 
	IL_30a4:  ldloc 0

	IL_30a8:  nop 
	IL_30a9:  nop 
	IL_30aa:  ldc.i4 0
	IL_30af:  beq IL_30b9

	IL_30b4:  br IL_30c9

	IL_30b9:  ldc.i4 1
	IL_30be:  stloc 1

	IL_30c2:  nop 
	IL_30c3:  nop 
	IL_30c4:  br IL_30ce

	IL_30c9:  br IL_30ce

	IL_30ce:  ldloc 1

	IL_30d2:  nop 
	IL_30d3:  nop 
	IL_30d4:  stloc 4

	IL_30d8:  nop 
	IL_30d9:  nop 
	IL_30da:  ldarg 1

	IL_30de:  nop 
	IL_30df:  nop 
	IL_30e0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30e5:  ldstr "false"
	IL_30ea:  call int32 string::Compare(string, string)
	IL_30ef:  stloc 0

	IL_30f3:  nop 
	IL_30f4:  nop 
	IL_30f5:  ldloc 0

	IL_30f9:  nop 
	IL_30fa:  nop 
	IL_30fb:  ldc.i4 0
	IL_3100:  beq IL_310a

	IL_3105:  br IL_311a

	IL_310a:  ldc.i4 1
	IL_310f:  stloc 1

	IL_3113:  nop 
	IL_3114:  nop 
	IL_3115:  br IL_311f

	IL_311a:  br IL_311f

	IL_311f:  ldloc 4

	IL_3123:  nop 
	IL_3124:  nop 
	IL_3125:  ldloc 1

	IL_3129:  nop 
	IL_312a:  nop 
	IL_312b:  or 
	IL_312c:  stloc 4

	IL_3130:  nop 
	IL_3131:  nop 
	IL_3132:  ldloc 1

	IL_3136:  nop 
	IL_3137:  nop 
	IL_3138:  ldc.i4 1
	IL_313d:  beq IL_3147

	IL_3142:  br IL_3228

	IL_3147:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::'.ctor'()
	IL_314c:  stloc 97

	IL_3150:  nop 
	IL_3151:  nop 
	IL_3152:  ldloc 97

	IL_3156:  nop 
	IL_3157:  nop 
	IL_3158:  ldarg 1

	IL_315c:  nop 
	IL_315d:  nop 
	IL_315e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3163:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3168:  ldloc 97

	IL_316c:  nop 
	IL_316d:  nop 
	IL_316e:  ldarg 1

	IL_3172:  nop 
	IL_3173:  nop 
	IL_3174:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3179:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_317e:  ldarg 1

	IL_3182:  nop 
	IL_3183:  nop 
	IL_3184:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3189:  ldstr "true"
	IL_318e:  call int32 string::Compare(string, string)
	IL_3193:  stloc 0

	IL_3197:  nop 
	IL_3198:  nop 
	IL_3199:  ldloc 0

	IL_319d:  nop 
	IL_319e:  nop 
	IL_319f:  ldc.i4 0
	IL_31a4:  beq IL_31ae

	IL_31a9:  br IL_31c3

	IL_31ae:  ldloc 97

	IL_31b2:  nop 
	IL_31b3:  nop 
	IL_31b4:  ldc.i4 1
	IL_31b9:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_31be:  br IL_31c8

	IL_31c3:  br IL_31c8

	IL_31c8:  ldarg 1

	IL_31cc:  nop 
	IL_31cd:  nop 
	IL_31ce:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31d3:  ldstr "false"
	IL_31d8:  call int32 string::Compare(string, string)
	IL_31dd:  stloc 0

	IL_31e1:  nop 
	IL_31e2:  nop 
	IL_31e3:  ldloc 0

	IL_31e7:  nop 
	IL_31e8:  nop 
	IL_31e9:  ldc.i4 0
	IL_31ee:  beq IL_31f8

	IL_31f3:  br IL_320d

	IL_31f8:  ldloc 97

	IL_31fc:  nop 
	IL_31fd:  nop 
	IL_31fe:  ldc.i4 0
	IL_3203:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_3208:  br IL_3212

	IL_320d:  br IL_3212

	IL_3212:  ldloc 97

	IL_3216:  nop 
	IL_3217:  nop 
	IL_3218:  starg 1

	IL_321c:  nop 
	IL_321d:  nop 
	IL_321e:  br IL_4c61

	IL_3223:  br IL_322d

	IL_3228:  br IL_322d

	IL_322d:  ldarg 1

	IL_3231:  nop 
	IL_3232:  nop 
	IL_3233:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3238:  ldstr "^'(.)*'$"
	IL_323d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3242:  stloc 1

	IL_3246:  nop 
	IL_3247:  nop 
	IL_3248:  ldloc 1

	IL_324c:  nop 
	IL_324d:  nop 
	IL_324e:  ldc.i4 1
	IL_3253:  beq IL_325d

	IL_3258:  br IL_3314

	IL_325d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::'.ctor'()
	IL_3262:  stloc 98

	IL_3266:  nop 
	IL_3267:  nop 
	IL_3268:  ldloc 98

	IL_326c:  nop 
	IL_326d:  nop 
	IL_326e:  ldarg 1

	IL_3272:  nop 
	IL_3273:  nop 
	IL_3274:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3279:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_327e:  ldarg 1

	IL_3282:  nop 
	IL_3283:  nop 
	IL_3284:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3289:  stloc 2

	IL_328d:  nop 
	IL_328e:  nop 
	IL_328f:  ldc.i4 1
	IL_3294:  conv.u 
	IL_3295:  newarr [mscorlib]System.Char
	IL_329a:  stloc 3

	IL_329e:  nop 
	IL_329f:  nop 
	IL_32a0:  ldloc 3

	IL_32a4:  nop 
	IL_32a5:  nop 
	IL_32a6:  ldc.i4 0
	IL_32ab:  conv.u 
	IL_32ac:  ldstr "'"
	IL_32b1:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_32b6:  stelem [mscorlib]System.Char
	IL_32bb:  ldloc 2

	IL_32bf:  nop 
	IL_32c0:  nop 
	IL_32c1:  ldloc 3

	IL_32c5:  nop 
	IL_32c6:  nop 
	IL_32c7:  callvirt instance string string::Trim(char[])
	IL_32cc:  stloc 2

	IL_32d0:  nop 
	IL_32d1:  nop 
	IL_32d2:  ldloc 98

	IL_32d6:  nop 
	IL_32d7:  nop 
	IL_32d8:  ldloc 2

	IL_32dc:  nop 
	IL_32dd:  nop 
	IL_32de:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_32e3:  ldloc 98

	IL_32e7:  nop 
	IL_32e8:  nop 
	IL_32e9:  ldloc 98

	IL_32ed:  nop 
	IL_32ee:  nop 
	IL_32ef:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_32f4:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_32f9:  stfld char [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_32fe:  ldloc 98

	IL_3302:  nop 
	IL_3303:  nop 
	IL_3304:  starg 1

	IL_3308:  nop 
	IL_3309:  nop 
	IL_330a:  br IL_4c61

	IL_330f:  br IL_3319

	IL_3314:  br IL_3319

	IL_3319:  ldstr "^"
	IL_331e:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_3323:  ldstr "(.)*"
	IL_3328:  call string string::Concat(string, string, string)
	IL_332d:  stloc 2

	IL_3331:  nop 
	IL_3332:  nop 
	IL_3333:  ldloc 2

	IL_3337:  nop 
	IL_3338:  nop 
	IL_3339:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_333e:  ldstr "$"
	IL_3343:  call string string::Concat(string, string, string)
	IL_3348:  stloc 2

	IL_334c:  nop 
	IL_334d:  nop 
	IL_334e:  ldarg 1

	IL_3352:  nop 
	IL_3353:  nop 
	IL_3354:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3359:  ldloc 2

	IL_335d:  nop 
	IL_335e:  nop 
	IL_335f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3364:  stloc 1

	IL_3368:  nop 
	IL_3369:  nop 
	IL_336a:  ldloc 1

	IL_336e:  nop 
	IL_336f:  nop 
	IL_3370:  ldc.i4 1
	IL_3375:  beq IL_337f

	IL_337a:  br IL_341b

	IL_337f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::'.ctor'()
	IL_3384:  stloc 99

	IL_3388:  nop 
	IL_3389:  nop 
	IL_338a:  ldloc 99

	IL_338e:  nop 
	IL_338f:  nop 
	IL_3390:  ldarg 1

	IL_3394:  nop 
	IL_3395:  nop 
	IL_3396:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_339b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_33a0:  ldarg 1

	IL_33a4:  nop 
	IL_33a5:  nop 
	IL_33a6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33ab:  stloc 2

	IL_33af:  nop 
	IL_33b0:  nop 
	IL_33b1:  ldc.i4 1
	IL_33b6:  conv.u 
	IL_33b7:  newarr [mscorlib]System.Char
	IL_33bc:  stloc 3

	IL_33c0:  nop 
	IL_33c1:  nop 
	IL_33c2:  ldloc 3

	IL_33c6:  nop 
	IL_33c7:  nop 
	IL_33c8:  ldc.i4 0
	IL_33cd:  conv.u 
	IL_33ce:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_33d3:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_33d8:  stelem [mscorlib]System.Char
	IL_33dd:  ldloc 2

	IL_33e1:  nop 
	IL_33e2:  nop 
	IL_33e3:  ldloc 3

	IL_33e7:  nop 
	IL_33e8:  nop 
	IL_33e9:  callvirt instance string string::Trim(char[])
	IL_33ee:  stloc 2

	IL_33f2:  nop 
	IL_33f3:  nop 
	IL_33f4:  ldloc 99

	IL_33f8:  nop 
	IL_33f9:  nop 
	IL_33fa:  ldloc 2

	IL_33fe:  nop 
	IL_33ff:  nop 
	IL_3400:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3405:  ldloc 99

	IL_3409:  nop 
	IL_340a:  nop 
	IL_340b:  starg 1

	IL_340f:  nop 
	IL_3410:  nop 
	IL_3411:  br IL_4c61

	IL_3416:  br IL_3420

	IL_341b:  br IL_3420

	IL_3420:  ldarg 1

	IL_3424:  nop 
	IL_3425:  nop 
	IL_3426:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_342b:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_3430:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3435:  stloc 1

	IL_3439:  nop 
	IL_343a:  nop 
	IL_343b:  ldloc 1

	IL_343f:  nop 
	IL_3440:  nop 
	IL_3441:  stloc 4

	IL_3445:  nop 
	IL_3446:  nop 
	IL_3447:  ldarg 1

	IL_344b:  nop 
	IL_344c:  nop 
	IL_344d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3452:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3457:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_345c:  stloc 1

	IL_3460:  nop 
	IL_3461:  nop 
	IL_3462:  ldloc 4

	IL_3466:  nop 
	IL_3467:  nop 
	IL_3468:  ldloc 1

	IL_346c:  nop 
	IL_346d:  nop 
	IL_346e:  or 
	IL_346f:  stloc 4

	IL_3473:  nop 
	IL_3474:  nop 
	IL_3475:  ldarg 1

	IL_3479:  nop 
	IL_347a:  nop 
	IL_347b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3480:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3485:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_348a:  stloc 1

	IL_348e:  nop 
	IL_348f:  nop 
	IL_3490:  ldloc 4

	IL_3494:  nop 
	IL_3495:  nop 
	IL_3496:  ldloc 1

	IL_349a:  nop 
	IL_349b:  nop 
	IL_349c:  or 
	IL_349d:  stloc 4

	IL_34a1:  nop 
	IL_34a2:  nop 
	IL_34a3:  ldarg 1

	IL_34a7:  nop 
	IL_34a8:  nop 
	IL_34a9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_34ae:  stloc 2

	IL_34b2:  nop 
	IL_34b3:  nop 
	IL_34b4:  ldloc 2

	IL_34b8:  nop 
	IL_34b9:  nop 
	IL_34ba:  ldstr "d"
	IL_34bf:  callvirt instance bool string::EndsWith(string)
	IL_34c4:  stloc 1

	IL_34c8:  nop 
	IL_34c9:  nop 
	IL_34ca:  ldloc 4

	IL_34ce:  nop 
	IL_34cf:  nop 
	IL_34d0:  ldloc 1

	IL_34d4:  nop 
	IL_34d5:  nop 
	IL_34d6:  and 
	IL_34d7:  stloc 4

	IL_34db:  nop 
	IL_34dc:  nop 
	IL_34dd:  ldloc 4

	IL_34e1:  nop 
	IL_34e2:  nop 
	IL_34e3:  ldc.i4 1
	IL_34e8:  beq IL_34f2

	IL_34ed:  br IL_35a9

	IL_34f2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_34f7:  stloc 100

	IL_34fb:  nop 
	IL_34fc:  nop 
	IL_34fd:  ldloc 100

	IL_3501:  nop 
	IL_3502:  nop 
	IL_3503:  ldarg 1

	IL_3507:  nop 
	IL_3508:  nop 
	IL_3509:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_350e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3513:  ldarg 1

	IL_3517:  nop 
	IL_3518:  nop 
	IL_3519:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_351e:  stloc 2

	IL_3522:  nop 
	IL_3523:  nop 
	IL_3524:  ldc.i4 1
	IL_3529:  conv.u 
	IL_352a:  newarr [mscorlib]System.Char
	IL_352f:  stloc 3

	IL_3533:  nop 
	IL_3534:  nop 
	IL_3535:  ldloc 3

	IL_3539:  nop 
	IL_353a:  nop 
	IL_353b:  ldc.i4 0
	IL_3540:  conv.u 
	IL_3541:  ldstr "d"
	IL_3546:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_354b:  stelem [mscorlib]System.Char
	IL_3550:  ldloc 2

	IL_3554:  nop 
	IL_3555:  nop 
	IL_3556:  ldloc 3

	IL_355a:  nop 
	IL_355b:  nop 
	IL_355c:  callvirt instance string string::TrimEnd(char[])
	IL_3561:  stloc 2

	IL_3565:  nop 
	IL_3566:  nop 
	IL_3567:  ldloc 100

	IL_356b:  nop 
	IL_356c:  nop 
	IL_356d:  ldloc 2

	IL_3571:  nop 
	IL_3572:  nop 
	IL_3573:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3578:  ldloc 100

	IL_357c:  nop 
	IL_357d:  nop 
	IL_357e:  ldloc 100

	IL_3582:  nop 
	IL_3583:  nop 
	IL_3584:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3589:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_358e:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3593:  ldloc 100

	IL_3597:  nop 
	IL_3598:  nop 
	IL_3599:  starg 1

	IL_359d:  nop 
	IL_359e:  nop 
	IL_359f:  br IL_4c61

	IL_35a4:  br IL_35ae

	IL_35a9:  br IL_35ae

	IL_35ae:  ldarg 1

	IL_35b2:  nop 
	IL_35b3:  nop 
	IL_35b4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_35b9:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_35be:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_35c3:  stloc 1

	IL_35c7:  nop 
	IL_35c8:  nop 
	IL_35c9:  ldloc 1

	IL_35cd:  nop 
	IL_35ce:  nop 
	IL_35cf:  stloc 4

	IL_35d3:  nop 
	IL_35d4:  nop 
	IL_35d5:  ldarg 1

	IL_35d9:  nop 
	IL_35da:  nop 
	IL_35db:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_35e0:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_35e5:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_35ea:  stloc 1

	IL_35ee:  nop 
	IL_35ef:  nop 
	IL_35f0:  ldloc 4

	IL_35f4:  nop 
	IL_35f5:  nop 
	IL_35f6:  ldloc 1

	IL_35fa:  nop 
	IL_35fb:  nop 
	IL_35fc:  or 
	IL_35fd:  stloc 4

	IL_3601:  nop 
	IL_3602:  nop 
	IL_3603:  ldarg 1

	IL_3607:  nop 
	IL_3608:  nop 
	IL_3609:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_360e:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3613:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3618:  stloc 1

	IL_361c:  nop 
	IL_361d:  nop 
	IL_361e:  ldloc 4

	IL_3622:  nop 
	IL_3623:  nop 
	IL_3624:  ldloc 1

	IL_3628:  nop 
	IL_3629:  nop 
	IL_362a:  or 
	IL_362b:  stloc 4

	IL_362f:  nop 
	IL_3630:  nop 
	IL_3631:  ldarg 1

	IL_3635:  nop 
	IL_3636:  nop 
	IL_3637:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_363c:  stloc 2

	IL_3640:  nop 
	IL_3641:  nop 
	IL_3642:  ldloc 2

	IL_3646:  nop 
	IL_3647:  nop 
	IL_3648:  ldstr "f"
	IL_364d:  callvirt instance bool string::EndsWith(string)
	IL_3652:  stloc 1

	IL_3656:  nop 
	IL_3657:  nop 
	IL_3658:  ldloc 4

	IL_365c:  nop 
	IL_365d:  nop 
	IL_365e:  ldloc 1

	IL_3662:  nop 
	IL_3663:  nop 
	IL_3664:  and 
	IL_3665:  stloc 4

	IL_3669:  nop 
	IL_366a:  nop 
	IL_366b:  ldloc 4

	IL_366f:  nop 
	IL_3670:  nop 
	IL_3671:  ldc.i4 1
	IL_3676:  beq IL_3680

	IL_367b:  br IL_3737

	IL_3680:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_3685:  stloc 101

	IL_3689:  nop 
	IL_368a:  nop 
	IL_368b:  ldloc 101

	IL_368f:  nop 
	IL_3690:  nop 
	IL_3691:  ldarg 1

	IL_3695:  nop 
	IL_3696:  nop 
	IL_3697:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_369c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_36a1:  ldarg 1

	IL_36a5:  nop 
	IL_36a6:  nop 
	IL_36a7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_36ac:  stloc 2

	IL_36b0:  nop 
	IL_36b1:  nop 
	IL_36b2:  ldc.i4 1
	IL_36b7:  conv.u 
	IL_36b8:  newarr [mscorlib]System.Char
	IL_36bd:  stloc 3

	IL_36c1:  nop 
	IL_36c2:  nop 
	IL_36c3:  ldloc 3

	IL_36c7:  nop 
	IL_36c8:  nop 
	IL_36c9:  ldc.i4 0
	IL_36ce:  conv.u 
	IL_36cf:  ldstr "f"
	IL_36d4:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_36d9:  stelem [mscorlib]System.Char
	IL_36de:  ldloc 2

	IL_36e2:  nop 
	IL_36e3:  nop 
	IL_36e4:  ldloc 3

	IL_36e8:  nop 
	IL_36e9:  nop 
	IL_36ea:  callvirt instance string string::TrimEnd(char[])
	IL_36ef:  stloc 2

	IL_36f3:  nop 
	IL_36f4:  nop 
	IL_36f5:  ldloc 101

	IL_36f9:  nop 
	IL_36fa:  nop 
	IL_36fb:  ldloc 2

	IL_36ff:  nop 
	IL_3700:  nop 
	IL_3701:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3706:  ldloc 101

	IL_370a:  nop 
	IL_370b:  nop 
	IL_370c:  ldloc 101

	IL_3710:  nop 
	IL_3711:  nop 
	IL_3712:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3717:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_371c:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_3721:  ldloc 101

	IL_3725:  nop 
	IL_3726:  nop 
	IL_3727:  starg 1

	IL_372b:  nop 
	IL_372c:  nop 
	IL_372d:  br IL_4c61

	IL_3732:  br IL_373c

	IL_3737:  br IL_373c

	IL_373c:  ldarg 1

	IL_3740:  nop 
	IL_3741:  nop 
	IL_3742:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3747:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_374c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3751:  stloc 1

	IL_3755:  nop 
	IL_3756:  nop 
	IL_3757:  ldloc 1

	IL_375b:  nop 
	IL_375c:  nop 
	IL_375d:  stloc 4

	IL_3761:  nop 
	IL_3762:  nop 
	IL_3763:  ldarg 1

	IL_3767:  nop 
	IL_3768:  nop 
	IL_3769:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_376e:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3773:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3778:  stloc 1

	IL_377c:  nop 
	IL_377d:  nop 
	IL_377e:  ldloc 4

	IL_3782:  nop 
	IL_3783:  nop 
	IL_3784:  ldloc 1

	IL_3788:  nop 
	IL_3789:  nop 
	IL_378a:  or 
	IL_378b:  stloc 4

	IL_378f:  nop 
	IL_3790:  nop 
	IL_3791:  ldarg 1

	IL_3795:  nop 
	IL_3796:  nop 
	IL_3797:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_379c:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_37a1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_37a6:  stloc 1

	IL_37aa:  nop 
	IL_37ab:  nop 
	IL_37ac:  ldloc 4

	IL_37b0:  nop 
	IL_37b1:  nop 
	IL_37b2:  ldloc 1

	IL_37b6:  nop 
	IL_37b7:  nop 
	IL_37b8:  or 
	IL_37b9:  stloc 4

	IL_37bd:  nop 
	IL_37be:  nop 
	IL_37bf:  ldloc 4

	IL_37c3:  nop 
	IL_37c4:  nop 
	IL_37c5:  ldc.i4 1
	IL_37ca:  beq IL_37d4

	IL_37cf:  br IL_3848

	IL_37d4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_37d9:  stloc 102

	IL_37dd:  nop 
	IL_37de:  nop 
	IL_37df:  ldloc 102

	IL_37e3:  nop 
	IL_37e4:  nop 
	IL_37e5:  ldarg 1

	IL_37e9:  nop 
	IL_37ea:  nop 
	IL_37eb:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_37f0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_37f5:  ldarg 1

	IL_37f9:  nop 
	IL_37fa:  nop 
	IL_37fb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3800:  stloc 2

	IL_3804:  nop 
	IL_3805:  nop 
	IL_3806:  ldloc 102

	IL_380a:  nop 
	IL_380b:  nop 
	IL_380c:  ldloc 2

	IL_3810:  nop 
	IL_3811:  nop 
	IL_3812:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3817:  ldloc 102

	IL_381b:  nop 
	IL_381c:  nop 
	IL_381d:  ldloc 102

	IL_3821:  nop 
	IL_3822:  nop 
	IL_3823:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3828:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_382d:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3832:  ldloc 102

	IL_3836:  nop 
	IL_3837:  nop 
	IL_3838:  starg 1

	IL_383c:  nop 
	IL_383d:  nop 
	IL_383e:  br IL_4c61

	IL_3843:  br IL_384d

	IL_3848:  br IL_384d

	IL_384d:  ldarg 1

	IL_3851:  nop 
	IL_3852:  nop 
	IL_3853:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3858:  ldstr "^(\\d)+(.)*$"
	IL_385d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3862:  stloc 1

	IL_3866:  nop 
	IL_3867:  nop 
	IL_3868:  ldloc 1

	IL_386c:  nop 
	IL_386d:  nop 
	IL_386e:  stloc 4

	IL_3872:  nop 
	IL_3873:  nop 
	IL_3874:  ldarg 1

	IL_3878:  nop 
	IL_3879:  nop 
	IL_387a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_387f:  ldstr "^\\+(\\d)+(.)*$"
	IL_3884:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3889:  stloc 1

	IL_388d:  nop 
	IL_388e:  nop 
	IL_388f:  ldloc 4

	IL_3893:  nop 
	IL_3894:  nop 
	IL_3895:  ldloc 1

	IL_3899:  nop 
	IL_389a:  nop 
	IL_389b:  or 
	IL_389c:  stloc 4

	IL_38a0:  nop 
	IL_38a1:  nop 
	IL_38a2:  ldarg 1

	IL_38a6:  nop 
	IL_38a7:  nop 
	IL_38a8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_38ad:  ldstr "^-(\\d)+(.)*$"
	IL_38b2:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_38b7:  stloc 1

	IL_38bb:  nop 
	IL_38bc:  nop 
	IL_38bd:  ldloc 4

	IL_38c1:  nop 
	IL_38c2:  nop 
	IL_38c3:  ldloc 1

	IL_38c7:  nop 
	IL_38c8:  nop 
	IL_38c9:  or 
	IL_38ca:  stloc 4

	IL_38ce:  nop 
	IL_38cf:  nop 
	IL_38d0:  ldarg 1

	IL_38d4:  nop 
	IL_38d5:  nop 
	IL_38d6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_38db:  stloc 2

	IL_38df:  nop 
	IL_38e0:  nop 
	IL_38e1:  ldloc 2

	IL_38e5:  nop 
	IL_38e6:  nop 
	IL_38e7:  ldstr "d"
	IL_38ec:  callvirt instance bool string::EndsWith(string)
	IL_38f1:  stloc 1

	IL_38f5:  nop 
	IL_38f6:  nop 
	IL_38f7:  ldloc 4

	IL_38fb:  nop 
	IL_38fc:  nop 
	IL_38fd:  ldloc 1

	IL_3901:  nop 
	IL_3902:  nop 
	IL_3903:  and 
	IL_3904:  stloc 4

	IL_3908:  nop 
	IL_3909:  nop 
	IL_390a:  ldloc 4

	IL_390e:  nop 
	IL_390f:  nop 
	IL_3910:  ldc.i4 1
	IL_3915:  beq IL_391f

	IL_391a:  br IL_39d6

	IL_391f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3924:  stloc 103

	IL_3928:  nop 
	IL_3929:  nop 
	IL_392a:  ldloc 103

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
	IL_396e:  ldstr "d"
	IL_3973:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3978:  stelem [mscorlib]System.Char
	IL_397d:  ldloc 2

	IL_3981:  nop 
	IL_3982:  nop 
	IL_3983:  ldloc 3

	IL_3987:  nop 
	IL_3988:  nop 
	IL_3989:  callvirt instance string string::TrimEnd(char[])
	IL_398e:  stloc 2

	IL_3992:  nop 
	IL_3993:  nop 
	IL_3994:  ldloc 103

	IL_3998:  nop 
	IL_3999:  nop 
	IL_399a:  ldloc 2

	IL_399e:  nop 
	IL_399f:  nop 
	IL_39a0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39a5:  ldloc 103

	IL_39a9:  nop 
	IL_39aa:  nop 
	IL_39ab:  ldloc 103

	IL_39af:  nop 
	IL_39b0:  nop 
	IL_39b1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39b6:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_39bb:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_39c0:  ldloc 103

	IL_39c4:  nop 
	IL_39c5:  nop 
	IL_39c6:  starg 1

	IL_39ca:  nop 
	IL_39cb:  nop 
	IL_39cc:  br IL_4c61

	IL_39d1:  br IL_39db

	IL_39d6:  br IL_39db

	IL_39db:  ldarg 1

	IL_39df:  nop 
	IL_39e0:  nop 
	IL_39e1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39e6:  ldstr "^(\\d)+(.)*$"
	IL_39eb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_39f0:  stloc 1

	IL_39f4:  nop 
	IL_39f5:  nop 
	IL_39f6:  ldloc 1

	IL_39fa:  nop 
	IL_39fb:  nop 
	IL_39fc:  stloc 4

	IL_3a00:  nop 
	IL_3a01:  nop 
	IL_3a02:  ldarg 1

	IL_3a06:  nop 
	IL_3a07:  nop 
	IL_3a08:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a0d:  ldstr "^\\+(\\d)+(.)*$"
	IL_3a12:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3a17:  stloc 1

	IL_3a1b:  nop 
	IL_3a1c:  nop 
	IL_3a1d:  ldloc 4

	IL_3a21:  nop 
	IL_3a22:  nop 
	IL_3a23:  ldloc 1

	IL_3a27:  nop 
	IL_3a28:  nop 
	IL_3a29:  or 
	IL_3a2a:  stloc 4

	IL_3a2e:  nop 
	IL_3a2f:  nop 
	IL_3a30:  ldarg 1

	IL_3a34:  nop 
	IL_3a35:  nop 
	IL_3a36:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a3b:  ldstr "^-(\\d)+(.)*$"
	IL_3a40:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3a45:  stloc 1

	IL_3a49:  nop 
	IL_3a4a:  nop 
	IL_3a4b:  ldloc 4

	IL_3a4f:  nop 
	IL_3a50:  nop 
	IL_3a51:  ldloc 1

	IL_3a55:  nop 
	IL_3a56:  nop 
	IL_3a57:  or 
	IL_3a58:  stloc 4

	IL_3a5c:  nop 
	IL_3a5d:  nop 
	IL_3a5e:  ldarg 1

	IL_3a62:  nop 
	IL_3a63:  nop 
	IL_3a64:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a69:  stloc 2

	IL_3a6d:  nop 
	IL_3a6e:  nop 
	IL_3a6f:  ldloc 2

	IL_3a73:  nop 
	IL_3a74:  nop 
	IL_3a75:  ldstr "f"
	IL_3a7a:  callvirt instance bool string::EndsWith(string)
	IL_3a7f:  stloc 1

	IL_3a83:  nop 
	IL_3a84:  nop 
	IL_3a85:  ldloc 4

	IL_3a89:  nop 
	IL_3a8a:  nop 
	IL_3a8b:  ldloc 1

	IL_3a8f:  nop 
	IL_3a90:  nop 
	IL_3a91:  and 
	IL_3a92:  stloc 4

	IL_3a96:  nop 
	IL_3a97:  nop 
	IL_3a98:  ldloc 4

	IL_3a9c:  nop 
	IL_3a9d:  nop 
	IL_3a9e:  ldc.i4 1
	IL_3aa3:  beq IL_3aad

	IL_3aa8:  br IL_3b64

	IL_3aad:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_3ab2:  stloc 104

	IL_3ab6:  nop 
	IL_3ab7:  nop 
	IL_3ab8:  ldloc 104

	IL_3abc:  nop 
	IL_3abd:  nop 
	IL_3abe:  ldarg 1

	IL_3ac2:  nop 
	IL_3ac3:  nop 
	IL_3ac4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3ac9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3ace:  ldarg 1

	IL_3ad2:  nop 
	IL_3ad3:  nop 
	IL_3ad4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ad9:  stloc 2

	IL_3add:  nop 
	IL_3ade:  nop 
	IL_3adf:  ldc.i4 1
	IL_3ae4:  conv.u 
	IL_3ae5:  newarr [mscorlib]System.Char
	IL_3aea:  stloc 3

	IL_3aee:  nop 
	IL_3aef:  nop 
	IL_3af0:  ldloc 3

	IL_3af4:  nop 
	IL_3af5:  nop 
	IL_3af6:  ldc.i4 0
	IL_3afb:  conv.u 
	IL_3afc:  ldstr "f"
	IL_3b01:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3b06:  stelem [mscorlib]System.Char
	IL_3b0b:  ldloc 2

	IL_3b0f:  nop 
	IL_3b10:  nop 
	IL_3b11:  ldloc 3

	IL_3b15:  nop 
	IL_3b16:  nop 
	IL_3b17:  callvirt instance string string::TrimEnd(char[])
	IL_3b1c:  stloc 2

	IL_3b20:  nop 
	IL_3b21:  nop 
	IL_3b22:  ldloc 104

	IL_3b26:  nop 
	IL_3b27:  nop 
	IL_3b28:  ldloc 2

	IL_3b2c:  nop 
	IL_3b2d:  nop 
	IL_3b2e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b33:  ldloc 104

	IL_3b37:  nop 
	IL_3b38:  nop 
	IL_3b39:  ldloc 104

	IL_3b3d:  nop 
	IL_3b3e:  nop 
	IL_3b3f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b44:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_3b49:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_3b4e:  ldloc 104

	IL_3b52:  nop 
	IL_3b53:  nop 
	IL_3b54:  starg 1

	IL_3b58:  nop 
	IL_3b59:  nop 
	IL_3b5a:  br IL_4c61

	IL_3b5f:  br IL_3b69

	IL_3b64:  br IL_3b69

	IL_3b69:  ldarg 1

	IL_3b6d:  nop 
	IL_3b6e:  nop 
	IL_3b6f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b74:  ldstr "^(\\d)+(.)*$"
	IL_3b79:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b7e:  stloc 1

	IL_3b82:  nop 
	IL_3b83:  nop 
	IL_3b84:  ldloc 1

	IL_3b88:  nop 
	IL_3b89:  nop 
	IL_3b8a:  stloc 4

	IL_3b8e:  nop 
	IL_3b8f:  nop 
	IL_3b90:  ldarg 1

	IL_3b94:  nop 
	IL_3b95:  nop 
	IL_3b96:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b9b:  ldstr "^\\+(\\d)+(.)*$"
	IL_3ba0:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3ba5:  stloc 1

	IL_3ba9:  nop 
	IL_3baa:  nop 
	IL_3bab:  ldloc 4

	IL_3baf:  nop 
	IL_3bb0:  nop 
	IL_3bb1:  ldloc 1

	IL_3bb5:  nop 
	IL_3bb6:  nop 
	IL_3bb7:  or 
	IL_3bb8:  stloc 4

	IL_3bbc:  nop 
	IL_3bbd:  nop 
	IL_3bbe:  ldarg 1

	IL_3bc2:  nop 
	IL_3bc3:  nop 
	IL_3bc4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3bc9:  ldstr "^-(\\d)+(.)*$"
	IL_3bce:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3bd3:  stloc 1

	IL_3bd7:  nop 
	IL_3bd8:  nop 
	IL_3bd9:  ldloc 4

	IL_3bdd:  nop 
	IL_3bde:  nop 
	IL_3bdf:  ldloc 1

	IL_3be3:  nop 
	IL_3be4:  nop 
	IL_3be5:  or 
	IL_3be6:  stloc 4

	IL_3bea:  nop 
	IL_3beb:  nop 
	IL_3bec:  ldarg 1

	IL_3bf0:  nop 
	IL_3bf1:  nop 
	IL_3bf2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3bf7:  stloc 2

	IL_3bfb:  nop 
	IL_3bfc:  nop 
	IL_3bfd:  ldloc 2

	IL_3c01:  nop 
	IL_3c02:  nop 
	IL_3c03:  ldstr "ui"
	IL_3c08:  callvirt instance bool string::EndsWith(string)
	IL_3c0d:  stloc 1

	IL_3c11:  nop 
	IL_3c12:  nop 
	IL_3c13:  ldloc 4

	IL_3c17:  nop 
	IL_3c18:  nop 
	IL_3c19:  ldloc 1

	IL_3c1d:  nop 
	IL_3c1e:  nop 
	IL_3c1f:  and 
	IL_3c20:  stloc 4

	IL_3c24:  nop 
	IL_3c25:  nop 
	IL_3c26:  ldloc 4

	IL_3c2a:  nop 
	IL_3c2b:  nop 
	IL_3c2c:  ldc.i4 1
	IL_3c31:  beq IL_3c3b

	IL_3c36:  br IL_3d24

	IL_3c3b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::'.ctor'()
	IL_3c40:  stloc 105

	IL_3c44:  nop 
	IL_3c45:  nop 
	IL_3c46:  ldloc 105

	IL_3c4a:  nop 
	IL_3c4b:  nop 
	IL_3c4c:  ldarg 1

	IL_3c50:  nop 
	IL_3c51:  nop 
	IL_3c52:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3c57:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3c5c:  ldarg 1

	IL_3c60:  nop 
	IL_3c61:  nop 
	IL_3c62:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c67:  stloc 2

	IL_3c6b:  nop 
	IL_3c6c:  nop 
	IL_3c6d:  ldc.i4 1
	IL_3c72:  conv.u 
	IL_3c73:  newarr [mscorlib]System.Char
	IL_3c78:  stloc 3

	IL_3c7c:  nop 
	IL_3c7d:  nop 
	IL_3c7e:  ldloc 3

	IL_3c82:  nop 
	IL_3c83:  nop 
	IL_3c84:  ldc.i4 0
	IL_3c89:  conv.u 
	IL_3c8a:  ldstr "i"
	IL_3c8f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3c94:  stelem [mscorlib]System.Char
	IL_3c99:  ldloc 2

	IL_3c9d:  nop 
	IL_3c9e:  nop 
	IL_3c9f:  ldloc 3

	IL_3ca3:  nop 
	IL_3ca4:  nop 
	IL_3ca5:  callvirt instance string string::TrimEnd(char[])
	IL_3caa:  stloc 2

	IL_3cae:  nop 
	IL_3caf:  nop 
	IL_3cb0:  ldloc 3

	IL_3cb4:  nop 
	IL_3cb5:  nop 
	IL_3cb6:  ldc.i4 0
	IL_3cbb:  conv.u 
	IL_3cbc:  ldstr "u"
	IL_3cc1:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3cc6:  stelem [mscorlib]System.Char
	IL_3ccb:  ldloc 2

	IL_3ccf:  nop 
	IL_3cd0:  nop 
	IL_3cd1:  ldloc 3

	IL_3cd5:  nop 
	IL_3cd6:  nop 
	IL_3cd7:  callvirt instance string string::TrimEnd(char[])
	IL_3cdc:  stloc 2

	IL_3ce0:  nop 
	IL_3ce1:  nop 
	IL_3ce2:  ldloc 105

	IL_3ce6:  nop 
	IL_3ce7:  nop 
	IL_3ce8:  ldloc 2

	IL_3cec:  nop 
	IL_3ced:  nop 
	IL_3cee:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3cf3:  ldloc 105

	IL_3cf7:  nop 
	IL_3cf8:  nop 
	IL_3cf9:  ldloc 105

	IL_3cfd:  nop 
	IL_3cfe:  nop 
	IL_3cff:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d04:  call unsigned int32 class [mscorlib]System.Convert::ToUInt32(string)
	IL_3d09:  stfld unsigned int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::NumVal
	IL_3d0e:  ldloc 105

	IL_3d12:  nop 
	IL_3d13:  nop 
	IL_3d14:  starg 1

	IL_3d18:  nop 
	IL_3d19:  nop 
	IL_3d1a:  br IL_4c61

	IL_3d1f:  br IL_3d29

	IL_3d24:  br IL_3d29

	IL_3d29:  ldarg 1

	IL_3d2d:  nop 
	IL_3d2e:  nop 
	IL_3d2f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d34:  ldstr "^(\\d)+(.)*$"
	IL_3d39:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3d3e:  stloc 1

	IL_3d42:  nop 
	IL_3d43:  nop 
	IL_3d44:  ldloc 1

	IL_3d48:  nop 
	IL_3d49:  nop 
	IL_3d4a:  stloc 4

	IL_3d4e:  nop 
	IL_3d4f:  nop 
	IL_3d50:  ldarg 1

	IL_3d54:  nop 
	IL_3d55:  nop 
	IL_3d56:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d5b:  ldstr "^\\+(\\d)+(.)*$"
	IL_3d60:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3d65:  stloc 1

	IL_3d69:  nop 
	IL_3d6a:  nop 
	IL_3d6b:  ldloc 4

	IL_3d6f:  nop 
	IL_3d70:  nop 
	IL_3d71:  ldloc 1

	IL_3d75:  nop 
	IL_3d76:  nop 
	IL_3d77:  or 
	IL_3d78:  stloc 4

	IL_3d7c:  nop 
	IL_3d7d:  nop 
	IL_3d7e:  ldarg 1

	IL_3d82:  nop 
	IL_3d83:  nop 
	IL_3d84:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d89:  ldstr "^-(\\d)+(.)*$"
	IL_3d8e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3d93:  stloc 1

	IL_3d97:  nop 
	IL_3d98:  nop 
	IL_3d99:  ldloc 4

	IL_3d9d:  nop 
	IL_3d9e:  nop 
	IL_3d9f:  ldloc 1

	IL_3da3:  nop 
	IL_3da4:  nop 
	IL_3da5:  or 
	IL_3da6:  stloc 4

	IL_3daa:  nop 
	IL_3dab:  nop 
	IL_3dac:  ldarg 1

	IL_3db0:  nop 
	IL_3db1:  nop 
	IL_3db2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3db7:  stloc 2

	IL_3dbb:  nop 
	IL_3dbc:  nop 
	IL_3dbd:  ldloc 2

	IL_3dc1:  nop 
	IL_3dc2:  nop 
	IL_3dc3:  ldstr "ip"
	IL_3dc8:  callvirt instance bool string::EndsWith(string)
	IL_3dcd:  stloc 1

	IL_3dd1:  nop 
	IL_3dd2:  nop 
	IL_3dd3:  ldloc 4

	IL_3dd7:  nop 
	IL_3dd8:  nop 
	IL_3dd9:  ldloc 1

	IL_3ddd:  nop 
	IL_3dde:  nop 
	IL_3ddf:  and 
	IL_3de0:  stloc 4

	IL_3de4:  nop 
	IL_3de5:  nop 
	IL_3de6:  ldloc 4

	IL_3dea:  nop 
	IL_3deb:  nop 
	IL_3dec:  ldc.i4 1
	IL_3df1:  beq IL_3dfb

	IL_3df6:  br IL_3ee9

	IL_3dfb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::'.ctor'()
	IL_3e00:  stloc 106

	IL_3e04:  nop 
	IL_3e05:  nop 
	IL_3e06:  ldloc 106

	IL_3e0a:  nop 
	IL_3e0b:  nop 
	IL_3e0c:  ldarg 1

	IL_3e10:  nop 
	IL_3e11:  nop 
	IL_3e12:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3e17:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3e1c:  ldarg 1

	IL_3e20:  nop 
	IL_3e21:  nop 
	IL_3e22:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e27:  stloc 2

	IL_3e2b:  nop 
	IL_3e2c:  nop 
	IL_3e2d:  ldc.i4 1
	IL_3e32:  conv.u 
	IL_3e33:  newarr [mscorlib]System.Char
	IL_3e38:  stloc 3

	IL_3e3c:  nop 
	IL_3e3d:  nop 
	IL_3e3e:  ldloc 3

	IL_3e42:  nop 
	IL_3e43:  nop 
	IL_3e44:  ldc.i4 0
	IL_3e49:  conv.u 
	IL_3e4a:  ldstr "p"
	IL_3e4f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3e54:  stelem [mscorlib]System.Char
	IL_3e59:  ldloc 2

	IL_3e5d:  nop 
	IL_3e5e:  nop 
	IL_3e5f:  ldloc 3

	IL_3e63:  nop 
	IL_3e64:  nop 
	IL_3e65:  callvirt instance string string::TrimEnd(char[])
	IL_3e6a:  stloc 2

	IL_3e6e:  nop 
	IL_3e6f:  nop 
	IL_3e70:  ldloc 3

	IL_3e74:  nop 
	IL_3e75:  nop 
	IL_3e76:  ldc.i4 0
	IL_3e7b:  conv.u 
	IL_3e7c:  ldstr "i"
	IL_3e81:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3e86:  stelem [mscorlib]System.Char
	IL_3e8b:  ldloc 2

	IL_3e8f:  nop 
	IL_3e90:  nop 
	IL_3e91:  ldloc 3

	IL_3e95:  nop 
	IL_3e96:  nop 
	IL_3e97:  callvirt instance string string::TrimEnd(char[])
	IL_3e9c:  stloc 2

	IL_3ea0:  nop 
	IL_3ea1:  nop 
	IL_3ea2:  ldloc 106

	IL_3ea6:  nop 
	IL_3ea7:  nop 
	IL_3ea8:  ldloc 2

	IL_3eac:  nop 
	IL_3ead:  nop 
	IL_3eae:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3eb3:  ldloc 106

	IL_3eb7:  nop 
	IL_3eb8:  nop 
	IL_3eb9:  ldloc 106

	IL_3ebd:  nop 
	IL_3ebe:  nop 
	IL_3ebf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ec4:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_3ec9:  newobj instance void native int::'.ctor'(int32)
	IL_3ece:  stfld native int [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::NumVal
	IL_3ed3:  ldloc 106

	IL_3ed7:  nop 
	IL_3ed8:  nop 
	IL_3ed9:  starg 1

	IL_3edd:  nop 
	IL_3ede:  nop 
	IL_3edf:  br IL_4c61

	IL_3ee4:  br IL_3eee

	IL_3ee9:  br IL_3eee

	IL_3eee:  ldarg 1

	IL_3ef2:  nop 
	IL_3ef3:  nop 
	IL_3ef4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ef9:  ldstr "^(\\d)+(.)*$"
	IL_3efe:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3f03:  stloc 1

	IL_3f07:  nop 
	IL_3f08:  nop 
	IL_3f09:  ldloc 1

	IL_3f0d:  nop 
	IL_3f0e:  nop 
	IL_3f0f:  stloc 4

	IL_3f13:  nop 
	IL_3f14:  nop 
	IL_3f15:  ldarg 1

	IL_3f19:  nop 
	IL_3f1a:  nop 
	IL_3f1b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f20:  ldstr "^\\+(\\d)+(.)*$"
	IL_3f25:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3f2a:  stloc 1

	IL_3f2e:  nop 
	IL_3f2f:  nop 
	IL_3f30:  ldloc 4

	IL_3f34:  nop 
	IL_3f35:  nop 
	IL_3f36:  ldloc 1

	IL_3f3a:  nop 
	IL_3f3b:  nop 
	IL_3f3c:  or 
	IL_3f3d:  stloc 4

	IL_3f41:  nop 
	IL_3f42:  nop 
	IL_3f43:  ldarg 1

	IL_3f47:  nop 
	IL_3f48:  nop 
	IL_3f49:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f4e:  ldstr "^-(\\d)+(.)*$"
	IL_3f53:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3f58:  stloc 1

	IL_3f5c:  nop 
	IL_3f5d:  nop 
	IL_3f5e:  ldloc 4

	IL_3f62:  nop 
	IL_3f63:  nop 
	IL_3f64:  ldloc 1

	IL_3f68:  nop 
	IL_3f69:  nop 
	IL_3f6a:  or 
	IL_3f6b:  stloc 4

	IL_3f6f:  nop 
	IL_3f70:  nop 
	IL_3f71:  ldarg 1

	IL_3f75:  nop 
	IL_3f76:  nop 
	IL_3f77:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f7c:  stloc 2

	IL_3f80:  nop 
	IL_3f81:  nop 
	IL_3f82:  ldloc 2

	IL_3f86:  nop 
	IL_3f87:  nop 
	IL_3f88:  ldstr "i"
	IL_3f8d:  callvirt instance bool string::EndsWith(string)
	IL_3f92:  stloc 1

	IL_3f96:  nop 
	IL_3f97:  nop 
	IL_3f98:  ldloc 4

	IL_3f9c:  nop 
	IL_3f9d:  nop 
	IL_3f9e:  ldloc 1

	IL_3fa2:  nop 
	IL_3fa3:  nop 
	IL_3fa4:  and 
	IL_3fa5:  stloc 4

	IL_3fa9:  nop 
	IL_3faa:  nop 
	IL_3fab:  ldloc 4

	IL_3faf:  nop 
	IL_3fb0:  nop 
	IL_3fb1:  ldc.i4 1
	IL_3fb6:  beq IL_3fc0

	IL_3fbb:  br IL_4077

	IL_3fc0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_3fc5:  stloc 107

	IL_3fc9:  nop 
	IL_3fca:  nop 
	IL_3fcb:  ldloc 107

	IL_3fcf:  nop 
	IL_3fd0:  nop 
	IL_3fd1:  ldarg 1

	IL_3fd5:  nop 
	IL_3fd6:  nop 
	IL_3fd7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3fdc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3fe1:  ldarg 1

	IL_3fe5:  nop 
	IL_3fe6:  nop 
	IL_3fe7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3fec:  stloc 2

	IL_3ff0:  nop 
	IL_3ff1:  nop 
	IL_3ff2:  ldc.i4 1
	IL_3ff7:  conv.u 
	IL_3ff8:  newarr [mscorlib]System.Char
	IL_3ffd:  stloc 3

	IL_4001:  nop 
	IL_4002:  nop 
	IL_4003:  ldloc 3

	IL_4007:  nop 
	IL_4008:  nop 
	IL_4009:  ldc.i4 0
	IL_400e:  conv.u 
	IL_400f:  ldstr "i"
	IL_4014:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4019:  stelem [mscorlib]System.Char
	IL_401e:  ldloc 2

	IL_4022:  nop 
	IL_4023:  nop 
	IL_4024:  ldloc 3

	IL_4028:  nop 
	IL_4029:  nop 
	IL_402a:  callvirt instance string string::TrimEnd(char[])
	IL_402f:  stloc 2

	IL_4033:  nop 
	IL_4034:  nop 
	IL_4035:  ldloc 107

	IL_4039:  nop 
	IL_403a:  nop 
	IL_403b:  ldloc 2

	IL_403f:  nop 
	IL_4040:  nop 
	IL_4041:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4046:  ldloc 107

	IL_404a:  nop 
	IL_404b:  nop 
	IL_404c:  ldloc 107

	IL_4050:  nop 
	IL_4051:  nop 
	IL_4052:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4057:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_405c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_4061:  ldloc 107

	IL_4065:  nop 
	IL_4066:  nop 
	IL_4067:  starg 1

	IL_406b:  nop 
	IL_406c:  nop 
	IL_406d:  br IL_4c61

	IL_4072:  br IL_407c

	IL_4077:  br IL_407c

	IL_407c:  ldarg 1

	IL_4080:  nop 
	IL_4081:  nop 
	IL_4082:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4087:  ldstr "^(\\d)+(.)*$"
	IL_408c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4091:  stloc 1

	IL_4095:  nop 
	IL_4096:  nop 
	IL_4097:  ldloc 1

	IL_409b:  nop 
	IL_409c:  nop 
	IL_409d:  stloc 4

	IL_40a1:  nop 
	IL_40a2:  nop 
	IL_40a3:  ldarg 1

	IL_40a7:  nop 
	IL_40a8:  nop 
	IL_40a9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40ae:  ldstr "^\\+(\\d)+(.)*$"
	IL_40b3:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_40b8:  stloc 1

	IL_40bc:  nop 
	IL_40bd:  nop 
	IL_40be:  ldloc 4

	IL_40c2:  nop 
	IL_40c3:  nop 
	IL_40c4:  ldloc 1

	IL_40c8:  nop 
	IL_40c9:  nop 
	IL_40ca:  or 
	IL_40cb:  stloc 4

	IL_40cf:  nop 
	IL_40d0:  nop 
	IL_40d1:  ldarg 1

	IL_40d5:  nop 
	IL_40d6:  nop 
	IL_40d7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40dc:  ldstr "^-(\\d)+(.)*$"
	IL_40e1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_40e6:  stloc 1

	IL_40ea:  nop 
	IL_40eb:  nop 
	IL_40ec:  ldloc 4

	IL_40f0:  nop 
	IL_40f1:  nop 
	IL_40f2:  ldloc 1

	IL_40f6:  nop 
	IL_40f7:  nop 
	IL_40f8:  or 
	IL_40f9:  stloc 4

	IL_40fd:  nop 
	IL_40fe:  nop 
	IL_40ff:  ldarg 1

	IL_4103:  nop 
	IL_4104:  nop 
	IL_4105:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_410a:  stloc 2

	IL_410e:  nop 
	IL_410f:  nop 
	IL_4110:  ldloc 2

	IL_4114:  nop 
	IL_4115:  nop 
	IL_4116:  ldstr "ul"
	IL_411b:  callvirt instance bool string::EndsWith(string)
	IL_4120:  stloc 1

	IL_4124:  nop 
	IL_4125:  nop 
	IL_4126:  ldloc 4

	IL_412a:  nop 
	IL_412b:  nop 
	IL_412c:  ldloc 1

	IL_4130:  nop 
	IL_4131:  nop 
	IL_4132:  and 
	IL_4133:  stloc 4

	IL_4137:  nop 
	IL_4138:  nop 
	IL_4139:  ldloc 4

	IL_413d:  nop 
	IL_413e:  nop 
	IL_413f:  ldc.i4 1
	IL_4144:  beq IL_414e

	IL_4149:  br IL_4237

	IL_414e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::'.ctor'()
	IL_4153:  stloc 108

	IL_4157:  nop 
	IL_4158:  nop 
	IL_4159:  ldloc 108

	IL_415d:  nop 
	IL_415e:  nop 
	IL_415f:  ldarg 1

	IL_4163:  nop 
	IL_4164:  nop 
	IL_4165:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_416a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_416f:  ldarg 1

	IL_4173:  nop 
	IL_4174:  nop 
	IL_4175:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_417a:  stloc 2

	IL_417e:  nop 
	IL_417f:  nop 
	IL_4180:  ldc.i4 1
	IL_4185:  conv.u 
	IL_4186:  newarr [mscorlib]System.Char
	IL_418b:  stloc 3

	IL_418f:  nop 
	IL_4190:  nop 
	IL_4191:  ldloc 3

	IL_4195:  nop 
	IL_4196:  nop 
	IL_4197:  ldc.i4 0
	IL_419c:  conv.u 
	IL_419d:  ldstr "l"
	IL_41a2:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_41a7:  stelem [mscorlib]System.Char
	IL_41ac:  ldloc 2

	IL_41b0:  nop 
	IL_41b1:  nop 
	IL_41b2:  ldloc 3

	IL_41b6:  nop 
	IL_41b7:  nop 
	IL_41b8:  callvirt instance string string::TrimEnd(char[])
	IL_41bd:  stloc 2

	IL_41c1:  nop 
	IL_41c2:  nop 
	IL_41c3:  ldloc 3

	IL_41c7:  nop 
	IL_41c8:  nop 
	IL_41c9:  ldc.i4 0
	IL_41ce:  conv.u 
	IL_41cf:  ldstr "u"
	IL_41d4:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_41d9:  stelem [mscorlib]System.Char
	IL_41de:  ldloc 2

	IL_41e2:  nop 
	IL_41e3:  nop 
	IL_41e4:  ldloc 3

	IL_41e8:  nop 
	IL_41e9:  nop 
	IL_41ea:  callvirt instance string string::TrimEnd(char[])
	IL_41ef:  stloc 2

	IL_41f3:  nop 
	IL_41f4:  nop 
	IL_41f5:  ldloc 108

	IL_41f9:  nop 
	IL_41fa:  nop 
	IL_41fb:  ldloc 2

	IL_41ff:  nop 
	IL_4200:  nop 
	IL_4201:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4206:  ldloc 108

	IL_420a:  nop 
	IL_420b:  nop 
	IL_420c:  ldloc 108

	IL_4210:  nop 
	IL_4211:  nop 
	IL_4212:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4217:  call unsigned int64 class [mscorlib]System.Convert::ToUInt64(string)
	IL_421c:  stfld unsigned int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::NumVal
	IL_4221:  ldloc 108

	IL_4225:  nop 
	IL_4226:  nop 
	IL_4227:  starg 1

	IL_422b:  nop 
	IL_422c:  nop 
	IL_422d:  br IL_4c61

	IL_4232:  br IL_423c

	IL_4237:  br IL_423c

	IL_423c:  ldarg 1

	IL_4240:  nop 
	IL_4241:  nop 
	IL_4242:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4247:  ldstr "^(\\d)+(.)*$"
	IL_424c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4251:  stloc 1

	IL_4255:  nop 
	IL_4256:  nop 
	IL_4257:  ldloc 1

	IL_425b:  nop 
	IL_425c:  nop 
	IL_425d:  stloc 4

	IL_4261:  nop 
	IL_4262:  nop 
	IL_4263:  ldarg 1

	IL_4267:  nop 
	IL_4268:  nop 
	IL_4269:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_426e:  ldstr "^\\+(\\d)+(.)*$"
	IL_4273:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4278:  stloc 1

	IL_427c:  nop 
	IL_427d:  nop 
	IL_427e:  ldloc 4

	IL_4282:  nop 
	IL_4283:  nop 
	IL_4284:  ldloc 1

	IL_4288:  nop 
	IL_4289:  nop 
	IL_428a:  or 
	IL_428b:  stloc 4

	IL_428f:  nop 
	IL_4290:  nop 
	IL_4291:  ldarg 1

	IL_4295:  nop 
	IL_4296:  nop 
	IL_4297:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_429c:  ldstr "^-(\\d)+(.)*$"
	IL_42a1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_42a6:  stloc 1

	IL_42aa:  nop 
	IL_42ab:  nop 
	IL_42ac:  ldloc 4

	IL_42b0:  nop 
	IL_42b1:  nop 
	IL_42b2:  ldloc 1

	IL_42b6:  nop 
	IL_42b7:  nop 
	IL_42b8:  or 
	IL_42b9:  stloc 4

	IL_42bd:  nop 
	IL_42be:  nop 
	IL_42bf:  ldarg 1

	IL_42c3:  nop 
	IL_42c4:  nop 
	IL_42c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42ca:  stloc 2

	IL_42ce:  nop 
	IL_42cf:  nop 
	IL_42d0:  ldloc 2

	IL_42d4:  nop 
	IL_42d5:  nop 
	IL_42d6:  ldstr "l"
	IL_42db:  callvirt instance bool string::EndsWith(string)
	IL_42e0:  stloc 1

	IL_42e4:  nop 
	IL_42e5:  nop 
	IL_42e6:  ldloc 4

	IL_42ea:  nop 
	IL_42eb:  nop 
	IL_42ec:  ldloc 1

	IL_42f0:  nop 
	IL_42f1:  nop 
	IL_42f2:  and 
	IL_42f3:  stloc 4

	IL_42f7:  nop 
	IL_42f8:  nop 
	IL_42f9:  ldloc 4

	IL_42fd:  nop 
	IL_42fe:  nop 
	IL_42ff:  ldc.i4 1
	IL_4304:  beq IL_430e

	IL_4309:  br IL_43c5

	IL_430e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::'.ctor'()
	IL_4313:  stloc 109

	IL_4317:  nop 
	IL_4318:  nop 
	IL_4319:  ldloc 109

	IL_431d:  nop 
	IL_431e:  nop 
	IL_431f:  ldarg 1

	IL_4323:  nop 
	IL_4324:  nop 
	IL_4325:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_432a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_432f:  ldarg 1

	IL_4333:  nop 
	IL_4334:  nop 
	IL_4335:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_433a:  stloc 2

	IL_433e:  nop 
	IL_433f:  nop 
	IL_4340:  ldc.i4 1
	IL_4345:  conv.u 
	IL_4346:  newarr [mscorlib]System.Char
	IL_434b:  stloc 3

	IL_434f:  nop 
	IL_4350:  nop 
	IL_4351:  ldloc 3

	IL_4355:  nop 
	IL_4356:  nop 
	IL_4357:  ldc.i4 0
	IL_435c:  conv.u 
	IL_435d:  ldstr "l"
	IL_4362:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4367:  stelem [mscorlib]System.Char
	IL_436c:  ldloc 2

	IL_4370:  nop 
	IL_4371:  nop 
	IL_4372:  ldloc 3

	IL_4376:  nop 
	IL_4377:  nop 
	IL_4378:  callvirt instance string string::TrimEnd(char[])
	IL_437d:  stloc 2

	IL_4381:  nop 
	IL_4382:  nop 
	IL_4383:  ldloc 109

	IL_4387:  nop 
	IL_4388:  nop 
	IL_4389:  ldloc 2

	IL_438d:  nop 
	IL_438e:  nop 
	IL_438f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4394:  ldloc 109

	IL_4398:  nop 
	IL_4399:  nop 
	IL_439a:  ldloc 109

	IL_439e:  nop 
	IL_439f:  nop 
	IL_43a0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43a5:  call int64 class [mscorlib]System.Convert::ToInt64(string)
	IL_43aa:  stfld int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_43af:  ldloc 109

	IL_43b3:  nop 
	IL_43b4:  nop 
	IL_43b5:  starg 1

	IL_43b9:  nop 
	IL_43ba:  nop 
	IL_43bb:  br IL_4c61

	IL_43c0:  br IL_43ca

	IL_43c5:  br IL_43ca

	IL_43ca:  ldarg 1

	IL_43ce:  nop 
	IL_43cf:  nop 
	IL_43d0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43d5:  ldstr "^(\\d)+(.)*$"
	IL_43da:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_43df:  stloc 1

	IL_43e3:  nop 
	IL_43e4:  nop 
	IL_43e5:  ldloc 1

	IL_43e9:  nop 
	IL_43ea:  nop 
	IL_43eb:  stloc 4

	IL_43ef:  nop 
	IL_43f0:  nop 
	IL_43f1:  ldarg 1

	IL_43f5:  nop 
	IL_43f6:  nop 
	IL_43f7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43fc:  ldstr "^\\+(\\d)+(.)*$"
	IL_4401:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4406:  stloc 1

	IL_440a:  nop 
	IL_440b:  nop 
	IL_440c:  ldloc 4

	IL_4410:  nop 
	IL_4411:  nop 
	IL_4412:  ldloc 1

	IL_4416:  nop 
	IL_4417:  nop 
	IL_4418:  or 
	IL_4419:  stloc 4

	IL_441d:  nop 
	IL_441e:  nop 
	IL_441f:  ldarg 1

	IL_4423:  nop 
	IL_4424:  nop 
	IL_4425:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_442a:  ldstr "^-(\\d)+(.)*$"
	IL_442f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4434:  stloc 1

	IL_4438:  nop 
	IL_4439:  nop 
	IL_443a:  ldloc 4

	IL_443e:  nop 
	IL_443f:  nop 
	IL_4440:  ldloc 1

	IL_4444:  nop 
	IL_4445:  nop 
	IL_4446:  or 
	IL_4447:  stloc 4

	IL_444b:  nop 
	IL_444c:  nop 
	IL_444d:  ldarg 1

	IL_4451:  nop 
	IL_4452:  nop 
	IL_4453:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4458:  stloc 2

	IL_445c:  nop 
	IL_445d:  nop 
	IL_445e:  ldloc 2

	IL_4462:  nop 
	IL_4463:  nop 
	IL_4464:  ldstr "us"
	IL_4469:  callvirt instance bool string::EndsWith(string)
	IL_446e:  stloc 1

	IL_4472:  nop 
	IL_4473:  nop 
	IL_4474:  ldloc 4

	IL_4478:  nop 
	IL_4479:  nop 
	IL_447a:  ldloc 1

	IL_447e:  nop 
	IL_447f:  nop 
	IL_4480:  and 
	IL_4481:  stloc 4

	IL_4485:  nop 
	IL_4486:  nop 
	IL_4487:  ldloc 4

	IL_448b:  nop 
	IL_448c:  nop 
	IL_448d:  ldc.i4 1
	IL_4492:  beq IL_449c

	IL_4497:  br IL_4585

	IL_449c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::'.ctor'()
	IL_44a1:  stloc 110

	IL_44a5:  nop 
	IL_44a6:  nop 
	IL_44a7:  ldloc 110

	IL_44ab:  nop 
	IL_44ac:  nop 
	IL_44ad:  ldarg 1

	IL_44b1:  nop 
	IL_44b2:  nop 
	IL_44b3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_44b8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_44bd:  ldarg 1

	IL_44c1:  nop 
	IL_44c2:  nop 
	IL_44c3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_44c8:  stloc 2

	IL_44cc:  nop 
	IL_44cd:  nop 
	IL_44ce:  ldc.i4 1
	IL_44d3:  conv.u 
	IL_44d4:  newarr [mscorlib]System.Char
	IL_44d9:  stloc 3

	IL_44dd:  nop 
	IL_44de:  nop 
	IL_44df:  ldloc 3

	IL_44e3:  nop 
	IL_44e4:  nop 
	IL_44e5:  ldc.i4 0
	IL_44ea:  conv.u 
	IL_44eb:  ldstr "s"
	IL_44f0:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_44f5:  stelem [mscorlib]System.Char
	IL_44fa:  ldloc 2

	IL_44fe:  nop 
	IL_44ff:  nop 
	IL_4500:  ldloc 3

	IL_4504:  nop 
	IL_4505:  nop 
	IL_4506:  callvirt instance string string::TrimEnd(char[])
	IL_450b:  stloc 2

	IL_450f:  nop 
	IL_4510:  nop 
	IL_4511:  ldloc 3

	IL_4515:  nop 
	IL_4516:  nop 
	IL_4517:  ldc.i4 0
	IL_451c:  conv.u 
	IL_451d:  ldstr "u"
	IL_4522:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4527:  stelem [mscorlib]System.Char
	IL_452c:  ldloc 2

	IL_4530:  nop 
	IL_4531:  nop 
	IL_4532:  ldloc 3

	IL_4536:  nop 
	IL_4537:  nop 
	IL_4538:  callvirt instance string string::TrimEnd(char[])
	IL_453d:  stloc 2

	IL_4541:  nop 
	IL_4542:  nop 
	IL_4543:  ldloc 110

	IL_4547:  nop 
	IL_4548:  nop 
	IL_4549:  ldloc 2

	IL_454d:  nop 
	IL_454e:  nop 
	IL_454f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4554:  ldloc 110

	IL_4558:  nop 
	IL_4559:  nop 
	IL_455a:  ldloc 110

	IL_455e:  nop 
	IL_455f:  nop 
	IL_4560:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4565:  call unsigned int16 class [mscorlib]System.Convert::ToUInt16(string)
	IL_456a:  stfld unsigned int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::NumVal
	IL_456f:  ldloc 110

	IL_4573:  nop 
	IL_4574:  nop 
	IL_4575:  starg 1

	IL_4579:  nop 
	IL_457a:  nop 
	IL_457b:  br IL_4c61

	IL_4580:  br IL_458a

	IL_4585:  br IL_458a

	IL_458a:  ldarg 1

	IL_458e:  nop 
	IL_458f:  nop 
	IL_4590:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4595:  ldstr "^(\\d)+(.)*$"
	IL_459a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_459f:  stloc 1

	IL_45a3:  nop 
	IL_45a4:  nop 
	IL_45a5:  ldloc 1

	IL_45a9:  nop 
	IL_45aa:  nop 
	IL_45ab:  stloc 4

	IL_45af:  nop 
	IL_45b0:  nop 
	IL_45b1:  ldarg 1

	IL_45b5:  nop 
	IL_45b6:  nop 
	IL_45b7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45bc:  ldstr "^\\+(\\d)+(.)*$"
	IL_45c1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_45c6:  stloc 1

	IL_45ca:  nop 
	IL_45cb:  nop 
	IL_45cc:  ldloc 4

	IL_45d0:  nop 
	IL_45d1:  nop 
	IL_45d2:  ldloc 1

	IL_45d6:  nop 
	IL_45d7:  nop 
	IL_45d8:  or 
	IL_45d9:  stloc 4

	IL_45dd:  nop 
	IL_45de:  nop 
	IL_45df:  ldarg 1

	IL_45e3:  nop 
	IL_45e4:  nop 
	IL_45e5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45ea:  ldstr "^-(\\d)+(.)*$"
	IL_45ef:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_45f4:  stloc 1

	IL_45f8:  nop 
	IL_45f9:  nop 
	IL_45fa:  ldloc 4

	IL_45fe:  nop 
	IL_45ff:  nop 
	IL_4600:  ldloc 1

	IL_4604:  nop 
	IL_4605:  nop 
	IL_4606:  or 
	IL_4607:  stloc 4

	IL_460b:  nop 
	IL_460c:  nop 
	IL_460d:  ldarg 1

	IL_4611:  nop 
	IL_4612:  nop 
	IL_4613:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4618:  stloc 2

	IL_461c:  nop 
	IL_461d:  nop 
	IL_461e:  ldloc 2

	IL_4622:  nop 
	IL_4623:  nop 
	IL_4624:  ldstr "s"
	IL_4629:  callvirt instance bool string::EndsWith(string)
	IL_462e:  stloc 1

	IL_4632:  nop 
	IL_4633:  nop 
	IL_4634:  ldloc 4

	IL_4638:  nop 
	IL_4639:  nop 
	IL_463a:  ldloc 1

	IL_463e:  nop 
	IL_463f:  nop 
	IL_4640:  and 
	IL_4641:  stloc 4

	IL_4645:  nop 
	IL_4646:  nop 
	IL_4647:  ldloc 4

	IL_464b:  nop 
	IL_464c:  nop 
	IL_464d:  ldc.i4 1
	IL_4652:  beq IL_465c

	IL_4657:  br IL_4713

	IL_465c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::'.ctor'()
	IL_4661:  stloc 111

	IL_4665:  nop 
	IL_4666:  nop 
	IL_4667:  ldloc 111

	IL_466b:  nop 
	IL_466c:  nop 
	IL_466d:  ldarg 1

	IL_4671:  nop 
	IL_4672:  nop 
	IL_4673:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4678:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_467d:  ldarg 1

	IL_4681:  nop 
	IL_4682:  nop 
	IL_4683:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4688:  stloc 2

	IL_468c:  nop 
	IL_468d:  nop 
	IL_468e:  ldc.i4 1
	IL_4693:  conv.u 
	IL_4694:  newarr [mscorlib]System.Char
	IL_4699:  stloc 3

	IL_469d:  nop 
	IL_469e:  nop 
	IL_469f:  ldloc 3

	IL_46a3:  nop 
	IL_46a4:  nop 
	IL_46a5:  ldc.i4 0
	IL_46aa:  conv.u 
	IL_46ab:  ldstr "s"
	IL_46b0:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_46b5:  stelem [mscorlib]System.Char
	IL_46ba:  ldloc 2

	IL_46be:  nop 
	IL_46bf:  nop 
	IL_46c0:  ldloc 3

	IL_46c4:  nop 
	IL_46c5:  nop 
	IL_46c6:  callvirt instance string string::TrimEnd(char[])
	IL_46cb:  stloc 2

	IL_46cf:  nop 
	IL_46d0:  nop 
	IL_46d1:  ldloc 111

	IL_46d5:  nop 
	IL_46d6:  nop 
	IL_46d7:  ldloc 2

	IL_46db:  nop 
	IL_46dc:  nop 
	IL_46dd:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46e2:  ldloc 111

	IL_46e6:  nop 
	IL_46e7:  nop 
	IL_46e8:  ldloc 111

	IL_46ec:  nop 
	IL_46ed:  nop 
	IL_46ee:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46f3:  call int16 class [mscorlib]System.Convert::ToInt16(string)
	IL_46f8:  stfld int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_46fd:  ldloc 111

	IL_4701:  nop 
	IL_4702:  nop 
	IL_4703:  starg 1

	IL_4707:  nop 
	IL_4708:  nop 
	IL_4709:  br IL_4c61

	IL_470e:  br IL_4718

	IL_4713:  br IL_4718

	IL_4718:  ldarg 1

	IL_471c:  nop 
	IL_471d:  nop 
	IL_471e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4723:  ldstr "^(\\d)+(.)*$"
	IL_4728:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_472d:  stloc 1

	IL_4731:  nop 
	IL_4732:  nop 
	IL_4733:  ldloc 1

	IL_4737:  nop 
	IL_4738:  nop 
	IL_4739:  stloc 4

	IL_473d:  nop 
	IL_473e:  nop 
	IL_473f:  ldarg 1

	IL_4743:  nop 
	IL_4744:  nop 
	IL_4745:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_474a:  ldstr "^\\+(\\d)+(.)*$"
	IL_474f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4754:  stloc 1

	IL_4758:  nop 
	IL_4759:  nop 
	IL_475a:  ldloc 4

	IL_475e:  nop 
	IL_475f:  nop 
	IL_4760:  ldloc 1

	IL_4764:  nop 
	IL_4765:  nop 
	IL_4766:  or 
	IL_4767:  stloc 4

	IL_476b:  nop 
	IL_476c:  nop 
	IL_476d:  ldarg 1

	IL_4771:  nop 
	IL_4772:  nop 
	IL_4773:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4778:  ldstr "^-(\\d)+(.)*$"
	IL_477d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4782:  stloc 1

	IL_4786:  nop 
	IL_4787:  nop 
	IL_4788:  ldloc 4

	IL_478c:  nop 
	IL_478d:  nop 
	IL_478e:  ldloc 1

	IL_4792:  nop 
	IL_4793:  nop 
	IL_4794:  or 
	IL_4795:  stloc 4

	IL_4799:  nop 
	IL_479a:  nop 
	IL_479b:  ldarg 1

	IL_479f:  nop 
	IL_47a0:  nop 
	IL_47a1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_47a6:  stloc 2

	IL_47aa:  nop 
	IL_47ab:  nop 
	IL_47ac:  ldloc 2

	IL_47b0:  nop 
	IL_47b1:  nop 
	IL_47b2:  ldstr "ub"
	IL_47b7:  callvirt instance bool string::EndsWith(string)
	IL_47bc:  stloc 1

	IL_47c0:  nop 
	IL_47c1:  nop 
	IL_47c2:  ldloc 4

	IL_47c6:  nop 
	IL_47c7:  nop 
	IL_47c8:  ldloc 1

	IL_47cc:  nop 
	IL_47cd:  nop 
	IL_47ce:  and 
	IL_47cf:  stloc 4

	IL_47d3:  nop 
	IL_47d4:  nop 
	IL_47d5:  ldloc 4

	IL_47d9:  nop 
	IL_47da:  nop 
	IL_47db:  ldc.i4 1
	IL_47e0:  beq IL_47ea

	IL_47e5:  br IL_48d3

	IL_47ea:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::'.ctor'()
	IL_47ef:  stloc 112

	IL_47f3:  nop 
	IL_47f4:  nop 
	IL_47f5:  ldloc 112

	IL_47f9:  nop 
	IL_47fa:  nop 
	IL_47fb:  ldarg 1

	IL_47ff:  nop 
	IL_4800:  nop 
	IL_4801:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4806:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_480b:  ldarg 1

	IL_480f:  nop 
	IL_4810:  nop 
	IL_4811:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4816:  stloc 2

	IL_481a:  nop 
	IL_481b:  nop 
	IL_481c:  ldc.i4 1
	IL_4821:  conv.u 
	IL_4822:  newarr [mscorlib]System.Char
	IL_4827:  stloc 3

	IL_482b:  nop 
	IL_482c:  nop 
	IL_482d:  ldloc 3

	IL_4831:  nop 
	IL_4832:  nop 
	IL_4833:  ldc.i4 0
	IL_4838:  conv.u 
	IL_4839:  ldstr "b"
	IL_483e:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4843:  stelem [mscorlib]System.Char
	IL_4848:  ldloc 2

	IL_484c:  nop 
	IL_484d:  nop 
	IL_484e:  ldloc 3

	IL_4852:  nop 
	IL_4853:  nop 
	IL_4854:  callvirt instance string string::TrimEnd(char[])
	IL_4859:  stloc 2

	IL_485d:  nop 
	IL_485e:  nop 
	IL_485f:  ldloc 3

	IL_4863:  nop 
	IL_4864:  nop 
	IL_4865:  ldc.i4 0
	IL_486a:  conv.u 
	IL_486b:  ldstr "u"
	IL_4870:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4875:  stelem [mscorlib]System.Char
	IL_487a:  ldloc 2

	IL_487e:  nop 
	IL_487f:  nop 
	IL_4880:  ldloc 3

	IL_4884:  nop 
	IL_4885:  nop 
	IL_4886:  callvirt instance string string::TrimEnd(char[])
	IL_488b:  stloc 2

	IL_488f:  nop 
	IL_4890:  nop 
	IL_4891:  ldloc 112

	IL_4895:  nop 
	IL_4896:  nop 
	IL_4897:  ldloc 2

	IL_489b:  nop 
	IL_489c:  nop 
	IL_489d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48a2:  ldloc 112

	IL_48a6:  nop 
	IL_48a7:  nop 
	IL_48a8:  ldloc 112

	IL_48ac:  nop 
	IL_48ad:  nop 
	IL_48ae:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48b3:  call unsigned int8 class [mscorlib]System.Convert::ToByte(string)
	IL_48b8:  stfld unsigned int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::NumVal
	IL_48bd:  ldloc 112

	IL_48c1:  nop 
	IL_48c2:  nop 
	IL_48c3:  starg 1

	IL_48c7:  nop 
	IL_48c8:  nop 
	IL_48c9:  br IL_4c61

	IL_48ce:  br IL_48d8

	IL_48d3:  br IL_48d8

	IL_48d8:  ldarg 1

	IL_48dc:  nop 
	IL_48dd:  nop 
	IL_48de:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48e3:  ldstr "^(\\d)+(.)*$"
	IL_48e8:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_48ed:  stloc 1

	IL_48f1:  nop 
	IL_48f2:  nop 
	IL_48f3:  ldloc 1

	IL_48f7:  nop 
	IL_48f8:  nop 
	IL_48f9:  stloc 4

	IL_48fd:  nop 
	IL_48fe:  nop 
	IL_48ff:  ldarg 1

	IL_4903:  nop 
	IL_4904:  nop 
	IL_4905:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_490a:  ldstr "^\\+(\\d)+(.)*$"
	IL_490f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4914:  stloc 1

	IL_4918:  nop 
	IL_4919:  nop 
	IL_491a:  ldloc 4

	IL_491e:  nop 
	IL_491f:  nop 
	IL_4920:  ldloc 1

	IL_4924:  nop 
	IL_4925:  nop 
	IL_4926:  or 
	IL_4927:  stloc 4

	IL_492b:  nop 
	IL_492c:  nop 
	IL_492d:  ldarg 1

	IL_4931:  nop 
	IL_4932:  nop 
	IL_4933:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4938:  ldstr "^-(\\d)+(.)*$"
	IL_493d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4942:  stloc 1

	IL_4946:  nop 
	IL_4947:  nop 
	IL_4948:  ldloc 4

	IL_494c:  nop 
	IL_494d:  nop 
	IL_494e:  ldloc 1

	IL_4952:  nop 
	IL_4953:  nop 
	IL_4954:  or 
	IL_4955:  stloc 4

	IL_4959:  nop 
	IL_495a:  nop 
	IL_495b:  ldarg 1

	IL_495f:  nop 
	IL_4960:  nop 
	IL_4961:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4966:  stloc 2

	IL_496a:  nop 
	IL_496b:  nop 
	IL_496c:  ldloc 2

	IL_4970:  nop 
	IL_4971:  nop 
	IL_4972:  ldstr "b"
	IL_4977:  callvirt instance bool string::EndsWith(string)
	IL_497c:  stloc 1

	IL_4980:  nop 
	IL_4981:  nop 
	IL_4982:  ldloc 4

	IL_4986:  nop 
	IL_4987:  nop 
	IL_4988:  ldloc 1

	IL_498c:  nop 
	IL_498d:  nop 
	IL_498e:  and 
	IL_498f:  stloc 4

	IL_4993:  nop 
	IL_4994:  nop 
	IL_4995:  ldloc 4

	IL_4999:  nop 
	IL_499a:  nop 
	IL_499b:  ldc.i4 1
	IL_49a0:  beq IL_49aa

	IL_49a5:  br IL_4a61

	IL_49aa:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::'.ctor'()
	IL_49af:  stloc 113

	IL_49b3:  nop 
	IL_49b4:  nop 
	IL_49b5:  ldloc 113

	IL_49b9:  nop 
	IL_49ba:  nop 
	IL_49bb:  ldarg 1

	IL_49bf:  nop 
	IL_49c0:  nop 
	IL_49c1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_49c6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_49cb:  ldarg 1

	IL_49cf:  nop 
	IL_49d0:  nop 
	IL_49d1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_49d6:  stloc 2

	IL_49da:  nop 
	IL_49db:  nop 
	IL_49dc:  ldc.i4 1
	IL_49e1:  conv.u 
	IL_49e2:  newarr [mscorlib]System.Char
	IL_49e7:  stloc 3

	IL_49eb:  nop 
	IL_49ec:  nop 
	IL_49ed:  ldloc 3

	IL_49f1:  nop 
	IL_49f2:  nop 
	IL_49f3:  ldc.i4 0
	IL_49f8:  conv.u 
	IL_49f9:  ldstr "b"
	IL_49fe:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4a03:  stelem [mscorlib]System.Char
	IL_4a08:  ldloc 2

	IL_4a0c:  nop 
	IL_4a0d:  nop 
	IL_4a0e:  ldloc 3

	IL_4a12:  nop 
	IL_4a13:  nop 
	IL_4a14:  callvirt instance string string::TrimEnd(char[])
	IL_4a19:  stloc 2

	IL_4a1d:  nop 
	IL_4a1e:  nop 
	IL_4a1f:  ldloc 113

	IL_4a23:  nop 
	IL_4a24:  nop 
	IL_4a25:  ldloc 2

	IL_4a29:  nop 
	IL_4a2a:  nop 
	IL_4a2b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a30:  ldloc 113

	IL_4a34:  nop 
	IL_4a35:  nop 
	IL_4a36:  ldloc 113

	IL_4a3a:  nop 
	IL_4a3b:  nop 
	IL_4a3c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a41:  call int8 class [mscorlib]System.Convert::ToSByte(string)
	IL_4a46:  stfld int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_4a4b:  ldloc 113

	IL_4a4f:  nop 
	IL_4a50:  nop 
	IL_4a51:  starg 1

	IL_4a55:  nop 
	IL_4a56:  nop 
	IL_4a57:  br IL_4c61

	IL_4a5c:  br IL_4a66

	IL_4a61:  br IL_4a66

	IL_4a66:  ldarg 1

	IL_4a6a:  nop 
	IL_4a6b:  nop 
	IL_4a6c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a71:  ldstr "^(\\d)+(.)*$"
	IL_4a76:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4a7b:  stloc 1

	IL_4a7f:  nop 
	IL_4a80:  nop 
	IL_4a81:  ldloc 1

	IL_4a85:  nop 
	IL_4a86:  nop 
	IL_4a87:  stloc 4

	IL_4a8b:  nop 
	IL_4a8c:  nop 
	IL_4a8d:  ldarg 1

	IL_4a91:  nop 
	IL_4a92:  nop 
	IL_4a93:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a98:  ldstr "^\\+(\\d)+(.)*$"
	IL_4a9d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4aa2:  stloc 1

	IL_4aa6:  nop 
	IL_4aa7:  nop 
	IL_4aa8:  ldloc 4

	IL_4aac:  nop 
	IL_4aad:  nop 
	IL_4aae:  ldloc 1

	IL_4ab2:  nop 
	IL_4ab3:  nop 
	IL_4ab4:  or 
	IL_4ab5:  stloc 4

	IL_4ab9:  nop 
	IL_4aba:  nop 
	IL_4abb:  ldarg 1

	IL_4abf:  nop 
	IL_4ac0:  nop 
	IL_4ac1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ac6:  ldstr "^-(\\d)+(.)*$"
	IL_4acb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4ad0:  stloc 1

	IL_4ad4:  nop 
	IL_4ad5:  nop 
	IL_4ad6:  ldloc 4

	IL_4ada:  nop 
	IL_4adb:  nop 
	IL_4adc:  ldloc 1

	IL_4ae0:  nop 
	IL_4ae1:  nop 
	IL_4ae2:  or 
	IL_4ae3:  stloc 4

	IL_4ae7:  nop 
	IL_4ae8:  nop 
	IL_4ae9:  ldloc 4

	IL_4aed:  nop 
	IL_4aee:  nop 
	IL_4aef:  ldc.i4 1
	IL_4af4:  beq IL_4afe

	IL_4af9:  br IL_4b72

	IL_4afe:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_4b03:  stloc 114

	IL_4b07:  nop 
	IL_4b08:  nop 
	IL_4b09:  ldloc 114

	IL_4b0d:  nop 
	IL_4b0e:  nop 
	IL_4b0f:  ldarg 1

	IL_4b13:  nop 
	IL_4b14:  nop 
	IL_4b15:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4b1a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4b1f:  ldarg 1

	IL_4b23:  nop 
	IL_4b24:  nop 
	IL_4b25:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b2a:  stloc 2

	IL_4b2e:  nop 
	IL_4b2f:  nop 
	IL_4b30:  ldloc 114

	IL_4b34:  nop 
	IL_4b35:  nop 
	IL_4b36:  ldloc 2

	IL_4b3a:  nop 
	IL_4b3b:  nop 
	IL_4b3c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b41:  ldloc 114

	IL_4b45:  nop 
	IL_4b46:  nop 
	IL_4b47:  ldloc 114

	IL_4b4b:  nop 
	IL_4b4c:  nop 
	IL_4b4d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b52:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_4b57:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_4b5c:  ldloc 114

	IL_4b60:  nop 
	IL_4b61:  nop 
	IL_4b62:  starg 1

	IL_4b66:  nop 
	IL_4b67:  nop 
	IL_4b68:  br IL_4c61

	IL_4b6d:  br IL_4b77

	IL_4b72:  br IL_4b77

	IL_4b77:  ldarg 1

	IL_4b7b:  nop 
	IL_4b7c:  nop 
	IL_4b7d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b82:  ldstr "^([a-zA-Z])+(.)*$"
	IL_4b87:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b8c:  stloc 1

	IL_4b90:  nop 
	IL_4b91:  nop 
	IL_4b92:  ldloc 1

	IL_4b96:  nop 
	IL_4b97:  nop 
	IL_4b98:  stloc 4

	IL_4b9c:  nop 
	IL_4b9d:  nop 
	IL_4b9e:  ldarg 1

	IL_4ba2:  nop 
	IL_4ba3:  nop 
	IL_4ba4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ba9:  ldstr "^_(.)*([a-zA-Z])+(.)*$"
	IL_4bae:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4bb3:  stloc 1

	IL_4bb7:  nop 
	IL_4bb8:  nop 
	IL_4bb9:  ldloc 4

	IL_4bbd:  nop 
	IL_4bbe:  nop 
	IL_4bbf:  ldloc 1

	IL_4bc3:  nop 
	IL_4bc4:  nop 
	IL_4bc5:  or 
	IL_4bc6:  stloc 4

	IL_4bca:  nop 
	IL_4bcb:  nop 
	IL_4bcc:  ldarg 1

	IL_4bd0:  nop 
	IL_4bd1:  nop 
	IL_4bd2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4bd7:  ldstr "^::(.)*([a-zA-Z])+(.)*$"
	IL_4bdc:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4be1:  stloc 1

	IL_4be5:  nop 
	IL_4be6:  nop 
	IL_4be7:  ldloc 4

	IL_4beb:  nop 
	IL_4bec:  nop 
	IL_4bed:  ldloc 1

	IL_4bf1:  nop 
	IL_4bf2:  nop 
	IL_4bf3:  or 
	IL_4bf4:  stloc 4

	IL_4bf8:  nop 
	IL_4bf9:  nop 
	IL_4bfa:  ldloc 4

	IL_4bfe:  nop 
	IL_4bff:  nop 
	IL_4c00:  ldc.i4 1
	IL_4c05:  beq IL_4c0f

	IL_4c0a:  br IL_4c5c

	IL_4c0f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_4c14:  stloc 115

	IL_4c18:  nop 
	IL_4c19:  nop 
	IL_4c1a:  ldloc 115

	IL_4c1e:  nop 
	IL_4c1f:  nop 
	IL_4c20:  ldarg 1

	IL_4c24:  nop 
	IL_4c25:  nop 
	IL_4c26:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4c2b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4c30:  ldloc 115

	IL_4c34:  nop 
	IL_4c35:  nop 
	IL_4c36:  ldarg 1

	IL_4c3a:  nop 
	IL_4c3b:  nop 
	IL_4c3c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c41:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c46:  ldloc 115

	IL_4c4a:  nop 
	IL_4c4b:  nop 
	IL_4c4c:  starg 1

	IL_4c50:  nop 
	IL_4c51:  nop 
	IL_4c52:  br IL_4c61

	IL_4c57:  br IL_4c61

	IL_4c5c:  br IL_4c61

	IL_4c61:  ldarg 1

	IL_4c65:  nop 
	IL_4c66:  nop 
	IL_4c67:  ret 
    } // end of method TokenOptimizer::Optimize

    // method line 10
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6ff4
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
        // Method begins at RVA 0x7008
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
        // Method begins at RVA 0x71d0
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
        // Method begins at RVA 0x7304
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
        // Method begins at RVA 0x7840
	// Code size 1265 (0x4f1)
	.maxstack 38
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_2,
		int32	V_3,
		bool	V_4,
		int32	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_6,
		class [mscorlib]System.Type	V_7,
		bool	V_8,
		int32	V_9)
	IL_0000:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::'.ctor'()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldc.i4 1
	IL_001b:  stloc 3

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldc.i4 1
	IL_0026:  stloc 4

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldc.i4 0
	IL_0031:  stloc 5

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldarg 1

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0042:  ldarg 2

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  conv.u 
	IL_0049:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_004e:  stloc 1

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldloc 0

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  ldloc 1

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Name
	IL_0065:  ldarg 2

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  stloc 5

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldarg 2

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 1
	IL_007c:  add 
	IL_007d:  starg 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldarg 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_008e:  ldarg 2

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  conv.u 
	IL_0095:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_009a:  stloc 6

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  ldarg 1

	IL_00a4:  nop 
	IL_00a5:  nop 
	IL_00a6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00ab:  ldlen 
	IL_00ac:  conv.i4 
	IL_00ad:  ldc.i4 1
	IL_00b2:  sub 
	IL_00b3:  stloc 9

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldarg 1

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldarg 2

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_00ca:  ldarg 1

	IL_00ce:  nop 
	IL_00cf:  nop 
	IL_00d0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00d5:  ldlen 
	IL_00d6:  conv.i4 
	IL_00d7:  ldc.i4 1
	IL_00dc:  sub 
	IL_00dd:  stloc 9

	IL_00e1:  nop 
	IL_00e2:  nop 
	IL_00e3:  ldarg 2

	IL_00e7:  nop 
	IL_00e8:  nop 
	IL_00e9:  ldc.i4 1
	IL_00ee:  sub 
	IL_00ef:  starg 2

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldarg 2

	IL_00f9:  nop 
	IL_00fa:  nop 
	IL_00fb:  ldc.i4 1
	IL_0100:  add 
	IL_0101:  starg 2

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldarg 1

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0112:  ldarg 2

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  conv.u 
	IL_0119:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_011e:  stloc 6

	IL_0122:  nop 
	IL_0123:  nop 
	IL_0124:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_0129:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_012e:  stloc 7

	IL_0132:  nop 
	IL_0133:  nop 
	IL_0134:  ldloc 7

	IL_0138:  nop 
	IL_0139:  nop 
	IL_013a:  ldloc 6

	IL_013e:  nop 
	IL_013f:  nop 
	IL_0140:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0145:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_014a:  stloc 8

	IL_014e:  nop 
	IL_014f:  nop 
	IL_0150:  ldloc 8

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldc.i4 1
	IL_015b:  beq IL_0165

	IL_0160:  br IL_0233

	IL_0165:  ldloc 3

	IL_0169:  nop 
	IL_016a:  nop 
	IL_016b:  ldc.i4 1
	IL_0170:  sub 
	IL_0171:  stloc 3

	IL_0175:  nop 
	IL_0176:  nop 
	IL_0177:  ldloc 3

	IL_017b:  nop 
	IL_017c:  nop 
	IL_017d:  ldc.i4 0
	IL_0182:  beq IL_018c

	IL_0187:  br IL_0214

	IL_018c:  ldc.i4 0
	IL_0191:  stloc 4

	IL_0195:  nop 
	IL_0196:  nop 
	IL_0197:  ldloc 2

	IL_019b:  nop 
	IL_019c:  nop 
	IL_019d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01a2:  ldlen 
	IL_01a3:  conv.i4 
	IL_01a4:  ldc.i4 0
	IL_01a9:  bgt IL_01b3

	IL_01ae:  br IL_01c9

	IL_01b3:  ldloc 0

	IL_01b7:  nop 
	IL_01b8:  nop 
	IL_01b9:  ldloc 2

	IL_01bd:  nop 
	IL_01be:  nop 
	IL_01bf:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_01c4:  br IL_01ce

	IL_01c9:  br IL_01ce

	IL_01ce:  ldarg 1

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  ldarg 2

	IL_01d8:  nop 
	IL_01d9:  nop 
	IL_01da:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_01df:  ldarg 1

	IL_01e3:  nop 
	IL_01e4:  nop 
	IL_01e5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01ea:  ldlen 
	IL_01eb:  conv.i4 
	IL_01ec:  ldc.i4 1
	IL_01f1:  sub 
	IL_01f2:  stloc 9

	IL_01f6:  nop 
	IL_01f7:  nop 
	IL_01f8:  ldarg 2

	IL_01fc:  nop 
	IL_01fd:  nop 
	IL_01fe:  ldc.i4 1
	IL_0203:  sub 
	IL_0204:  starg 2

	IL_0208:  nop 
	IL_0209:  nop 
	IL_020a:  br IL_04b7

	IL_020f:  br IL_0229

	IL_0214:  ldc.i4 1
	IL_0219:  stloc 4

	IL_021d:  nop 
	IL_021e:  nop 
	IL_021f:  br IL_0410

	IL_0224:  br IL_0229

	IL_0229:  br IL_0410

	IL_022e:  br IL_0238

	IL_0233:  br IL_0238

	IL_0238:  ldarg 1

	IL_023c:  nop 
	IL_023d:  nop 
	IL_023e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0243:  ldarg 2

	IL_0247:  nop 
	IL_0248:  nop 
	IL_0249:  conv.u 
	IL_024a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_024f:  stloc 6

	IL_0253:  nop 
	IL_0254:  nop 
	IL_0255:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_025a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_025f:  stloc 7

	IL_0263:  nop 
	IL_0264:  nop 
	IL_0265:  ldloc 7

	IL_0269:  nop 
	IL_026a:  nop 
	IL_026b:  ldloc 6

	IL_026f:  nop 
	IL_0270:  nop 
	IL_0271:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0276:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_027b:  stloc 8

	IL_027f:  nop 
	IL_0280:  nop 
	IL_0281:  ldloc 8

	IL_0285:  nop 
	IL_0286:  nop 
	IL_0287:  ldc.i4 1
	IL_028c:  beq IL_0296

	IL_0291:  br IL_02d6

	IL_0296:  ldloc 3

	IL_029a:  nop 
	IL_029b:  nop 
	IL_029c:  ldc.i4 1
	IL_02a1:  add 
	IL_02a2:  stloc 3

	IL_02a6:  nop 
	IL_02a7:  nop 
	IL_02a8:  ldc.i4 1
	IL_02ad:  stloc 4

	IL_02b1:  nop 
	IL_02b2:  nop 
	IL_02b3:  ldarg 1

	IL_02b7:  nop 
	IL_02b8:  nop 
	IL_02b9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_02be:  ldlen 
	IL_02bf:  conv.i4 
	IL_02c0:  ldc.i4 1
	IL_02c5:  sub 
	IL_02c6:  stloc 9

	IL_02ca:  nop 
	IL_02cb:  nop 
	IL_02cc:  br IL_0410

	IL_02d1:  br IL_02db

	IL_02d6:  br IL_02db

	IL_02db:  ldarg 1

	IL_02df:  nop 
	IL_02e0:  nop 
	IL_02e1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_02e6:  ldarg 2

	IL_02ea:  nop 
	IL_02eb:  nop 
	IL_02ec:  conv.u 
	IL_02ed:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02f2:  stloc 6

	IL_02f6:  nop 
	IL_02f7:  nop 
	IL_02f8:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_02fd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0302:  stloc 7

	IL_0306:  nop 
	IL_0307:  nop 
	IL_0308:  ldloc 7

	IL_030c:  nop 
	IL_030d:  nop 
	IL_030e:  ldloc 6

	IL_0312:  nop 
	IL_0313:  nop 
	IL_0314:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0319:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_031e:  stloc 8

	IL_0322:  nop 
	IL_0323:  nop 
	IL_0324:  ldloc 8

	IL_0328:  nop 
	IL_0329:  nop 
	IL_032a:  ldc.i4 1
	IL_032f:  beq IL_0339

	IL_0334:  br IL_03fb

	IL_0339:  ldloc 3

	IL_033d:  nop 
	IL_033e:  nop 
	IL_033f:  ldc.i4 1
	IL_0344:  beq IL_034e

	IL_0349:  br IL_03e1

	IL_034e:  ldc.i4 0
	IL_0353:  stloc 4

	IL_0357:  nop 
	IL_0358:  nop 
	IL_0359:  ldloc 2

	IL_035d:  nop 
	IL_035e:  nop 
	IL_035f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0364:  ldlen 
	IL_0365:  conv.i4 
	IL_0366:  ldc.i4 0
	IL_036b:  bgt IL_0375

	IL_0370:  br IL_038b

	IL_0375:  ldloc 0

	IL_0379:  nop 
	IL_037a:  nop 
	IL_037b:  ldloc 2

	IL_037f:  nop 
	IL_0380:  nop 
	IL_0381:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0386:  br IL_0390

	IL_038b:  br IL_0390

	IL_0390:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0395:  stloc 2

	IL_0399:  nop 
	IL_039a:  nop 
	IL_039b:  ldarg 1

	IL_039f:  nop 
	IL_03a0:  nop 
	IL_03a1:  ldarg 2

	IL_03a5:  nop 
	IL_03a6:  nop 
	IL_03a7:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_03ac:  ldarg 1

	IL_03b0:  nop 
	IL_03b1:  nop 
	IL_03b2:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03b7:  ldlen 
	IL_03b8:  conv.i4 
	IL_03b9:  ldc.i4 1
	IL_03be:  sub 
	IL_03bf:  stloc 9

	IL_03c3:  nop 
	IL_03c4:  nop 
	IL_03c5:  ldarg 2

	IL_03c9:  nop 
	IL_03ca:  nop 
	IL_03cb:  ldc.i4 1
	IL_03d0:  sub 
	IL_03d1:  starg 2

	IL_03d5:  nop 
	IL_03d6:  nop 
	IL_03d7:  br IL_0410

	IL_03dc:  br IL_03f6

	IL_03e1:  ldc.i4 1
	IL_03e6:  stloc 4

	IL_03ea:  nop 
	IL_03eb:  nop 
	IL_03ec:  br IL_0410

	IL_03f1:  br IL_03f6

	IL_03f6:  br IL_0410

	IL_03fb:  ldc.i4 1
	IL_0400:  stloc 4

	IL_0404:  nop 
	IL_0405:  nop 
	IL_0406:  br IL_0410

	IL_040b:  br IL_0410

	IL_0410:  ldloc 4

	IL_0414:  nop 
	IL_0415:  nop 
	IL_0416:  ldc.i4 1
	IL_041b:  beq IL_0425

	IL_0420:  br IL_0488

	IL_0425:  ldloc 2

	IL_0429:  nop 
	IL_042a:  nop 
	IL_042b:  ldarg 1

	IL_042f:  nop 
	IL_0430:  nop 
	IL_0431:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0436:  ldarg 2

	IL_043a:  nop 
	IL_043b:  nop 
	IL_043c:  conv.u 
	IL_043d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0442:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0447:  ldarg 1

	IL_044b:  nop 
	IL_044c:  nop 
	IL_044d:  ldarg 2

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0458:  ldarg 1

	IL_045c:  nop 
	IL_045d:  nop 
	IL_045e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0463:  ldlen 
	IL_0464:  conv.i4 
	IL_0465:  ldc.i4 1
	IL_046a:  sub 
	IL_046b:  stloc 9

	IL_046f:  nop 
	IL_0470:  nop 
	IL_0471:  ldarg 2

	IL_0475:  nop 
	IL_0476:  nop 
	IL_0477:  ldc.i4 1
	IL_047c:  sub 
	IL_047d:  starg 2

	IL_0481:  nop 
	IL_0482:  nop 
	IL_0483:  br IL_048d

	IL_0488:  br IL_048d

	IL_048d:  ldarg 2

	IL_0491:  nop 
	IL_0492:  nop 
	IL_0493:  ldloc 9

	IL_0497:  nop 
	IL_0498:  nop 
	IL_0499:  beq IL_04a3

	IL_049e:  br IL_04ad

	IL_04a3:  br IL_04b7

	IL_04a8:  br IL_04b7

	IL_04ad:  br IL_00f5

	IL_04b2:  br IL_04b7

	IL_04b7:  ldloc 0

	IL_04bb:  nop 
	IL_04bc:  nop 
	IL_04bd:  ldloc 1

	IL_04c1:  nop 
	IL_04c2:  nop 
	IL_04c3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_04c8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_04cd:  ldarg 1

	IL_04d1:  nop 
	IL_04d2:  nop 
	IL_04d3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_04d8:  ldloc 5

	IL_04dc:  nop 
	IL_04dd:  nop 
	IL_04de:  conv.u 
	IL_04df:  ldloc 0

	IL_04e3:  nop 
	IL_04e4:  nop 
	IL_04e5:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_04ea:  ldarg 1

	IL_04ee:  nop 
	IL_04ef:  nop 
	IL_04f0:  ret 
    } // end of method ExprOptimizer::procNewCall

    // method line 15
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr procIdentArrayAccess (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr stm, int32 i)  cil managed 
    {
        // Method begins at RVA 0x7d40
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
        // Method begins at RVA 0x8138
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
        // Method begins at RVA 0x855c
	// Code size 6371 (0x18e3)
	.maxstack 189
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_15,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_16,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_17,
		int32	V_18,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_19,
		class [mscorlib]System.Type	V_20,
		bool	V_21,
		string	V_22,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_23,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_24,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_25,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_26,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_27,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_28,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_29,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_30,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_31,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_32,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral	V_33,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok	V_34,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_35,
		int32	V_36,
		int32	V_37,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok	V_38,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_39,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_40,
		int32	V_41,
		int32	V_42,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_43,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_44,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_45,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_46)
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
	IL_00ac:  ldc.i4 0
	IL_00b1:  stloc 18

	IL_00b5:  nop 
	IL_00b6:  nop 
	IL_00b7:  ldloc 0

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ldc.i4 0
	IL_00c2:  blt IL_00cc

	IL_00c7:  br IL_00d6

	IL_00cc:  br IL_1820

	IL_00d1:  br IL_00db

	IL_00d6:  br IL_00db

	IL_00db:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_00e0:  ldc.i4 0
	IL_00e5:  beq IL_00ef

	IL_00ea:  br IL_13a7

	IL_00ef:  ldloc 1

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldc.i4 1
	IL_00fa:  add 
	IL_00fb:  stloc 1

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ldarg 1

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_010c:  ldloc 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  conv.u 
	IL_0113:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0118:  stloc 19

	IL_011c:  nop 
	IL_011d:  nop 
	IL_011e:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LRSParen
	IL_0123:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0128:  stloc 20

	IL_012c:  nop 
	IL_012d:  nop 
	IL_012e:  ldloc 20

	IL_0132:  nop 
	IL_0133:  nop 
	IL_0134:  ldloc 19

	IL_0138:  nop 
	IL_0139:  nop 
	IL_013a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_013f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0144:  stloc 21

	IL_0148:  nop 
	IL_0149:  nop 
	IL_014a:  ldloc 21

	IL_014e:  nop 
	IL_014f:  nop 
	IL_0150:  ldc.i4 1
	IL_0155:  beq IL_015f

	IL_015a:  br IL_02bb

	IL_015f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0164:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0169:  stloc 20

	IL_016d:  nop 
	IL_016e:  nop 
	IL_016f:  ldarg 1

	IL_0173:  nop 
	IL_0174:  nop 
	IL_0175:  ldloc 1

	IL_0179:  nop 
	IL_017a:  nop 
	IL_017b:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0180:  ldloc 1

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  ldc.i4 1
	IL_018b:  sub 
	IL_018c:  stloc 1

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  ldarg 1

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_019d:  ldlen 
	IL_019e:  conv.i4 
	IL_019f:  ldc.i4 1
	IL_01a4:  sub 
	IL_01a5:  stloc 0

	IL_01a9:  nop 
	IL_01aa:  nop 
	IL_01ab:  ldarg 1

	IL_01af:  nop 
	IL_01b0:  nop 
	IL_01b1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01b6:  ldloc 1

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  conv.u 
	IL_01bd:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01c2:  stloc 19

	IL_01c6:  nop 
	IL_01c7:  nop 
	IL_01c8:  ldloc 20

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldloc 19

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01d9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01de:  stloc 21

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldloc 21

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  ldc.i4 1
	IL_01ef:  beq IL_0262

	IL_01f4:  br IL_01f9

	IL_01f9:  ldarg 1

	IL_01fd:  nop 
	IL_01fe:  nop 
	IL_01ff:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0204:  ldloc 1

	IL_0208:  nop 
	IL_0209:  nop 
	IL_020a:  conv.u 
	IL_020b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0210:  stloc 23

	IL_0214:  nop 
	IL_0215:  nop 
	IL_0216:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_021b:  stloc 24

	IL_021f:  nop 
	IL_0220:  nop 
	IL_0221:  ldloc 24

	IL_0225:  nop 
	IL_0226:  nop 
	IL_0227:  ldloc 23

	IL_022b:  nop 
	IL_022c:  nop 
	IL_022d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0232:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0237:  ldloc 24

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  ldloc 23

	IL_0241:  nop 
	IL_0242:  nop 
	IL_0243:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0248:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_024d:  ldloc 24

	IL_0251:  nop 
	IL_0252:  nop 
	IL_0253:  ldc.i4 1
	IL_0258:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_025d:  br IL_0294

	IL_0262:  ldarg 1

	IL_0266:  nop 
	IL_0267:  nop 
	IL_0268:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_026d:  ldloc 1

	IL_0271:  nop 
	IL_0272:  nop 
	IL_0273:  conv.u 
	IL_0274:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0279:  stloc 24

	IL_027d:  nop 
	IL_027e:  nop 
	IL_027f:  ldloc 24

	IL_0283:  nop 
	IL_0284:  nop 
	IL_0285:  ldc.i4 1
	IL_028a:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_028f:  br IL_0294

	IL_0294:  ldarg 1

	IL_0298:  nop 
	IL_0299:  nop 
	IL_029a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_029f:  ldloc 1

	IL_02a3:  nop 
	IL_02a4:  nop 
	IL_02a5:  conv.u 
	IL_02a6:  ldloc 24

	IL_02aa:  nop 
	IL_02ab:  nop 
	IL_02ac:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02b1:  br IL_1378

	IL_02b6:  br IL_02c0

	IL_02bb:  br IL_02c0

	IL_02c0:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Ampersand
	IL_02c5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02ca:  stloc 20

	IL_02ce:  nop 
	IL_02cf:  nop 
	IL_02d0:  ldloc 20

	IL_02d4:  nop 
	IL_02d5:  nop 
	IL_02d6:  ldloc 19

	IL_02da:  nop 
	IL_02db:  nop 
	IL_02dc:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02e1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_02e6:  stloc 21

	IL_02ea:  nop 
	IL_02eb:  nop 
	IL_02ec:  ldloc 21

	IL_02f0:  nop 
	IL_02f1:  nop 
	IL_02f2:  ldc.i4 1
	IL_02f7:  beq IL_0301

	IL_02fc:  br IL_045d

	IL_0301:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0306:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_030b:  stloc 20

	IL_030f:  nop 
	IL_0310:  nop 
	IL_0311:  ldarg 1

	IL_0315:  nop 
	IL_0316:  nop 
	IL_0317:  ldloc 1

	IL_031b:  nop 
	IL_031c:  nop 
	IL_031d:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0322:  ldloc 1

	IL_0326:  nop 
	IL_0327:  nop 
	IL_0328:  ldc.i4 1
	IL_032d:  sub 
	IL_032e:  stloc 1

	IL_0332:  nop 
	IL_0333:  nop 
	IL_0334:  ldarg 1

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_033f:  ldlen 
	IL_0340:  conv.i4 
	IL_0341:  ldc.i4 1
	IL_0346:  sub 
	IL_0347:  stloc 0

	IL_034b:  nop 
	IL_034c:  nop 
	IL_034d:  ldarg 1

	IL_0351:  nop 
	IL_0352:  nop 
	IL_0353:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0358:  ldloc 1

	IL_035c:  nop 
	IL_035d:  nop 
	IL_035e:  conv.u 
	IL_035f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0364:  stloc 19

	IL_0368:  nop 
	IL_0369:  nop 
	IL_036a:  ldloc 20

	IL_036e:  nop 
	IL_036f:  nop 
	IL_0370:  ldloc 19

	IL_0374:  nop 
	IL_0375:  nop 
	IL_0376:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_037b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0380:  stloc 21

	IL_0384:  nop 
	IL_0385:  nop 
	IL_0386:  ldloc 21

	IL_038a:  nop 
	IL_038b:  nop 
	IL_038c:  ldc.i4 1
	IL_0391:  beq IL_0404

	IL_0396:  br IL_039b

	IL_039b:  ldarg 1

	IL_039f:  nop 
	IL_03a0:  nop 
	IL_03a1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_03a6:  ldloc 1

	IL_03aa:  nop 
	IL_03ab:  nop 
	IL_03ac:  conv.u 
	IL_03ad:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03b2:  stloc 25

	IL_03b6:  nop 
	IL_03b7:  nop 
	IL_03b8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_03bd:  stloc 26

	IL_03c1:  nop 
	IL_03c2:  nop 
	IL_03c3:  ldloc 26

	IL_03c7:  nop 
	IL_03c8:  nop 
	IL_03c9:  ldloc 25

	IL_03cd:  nop 
	IL_03ce:  nop 
	IL_03cf:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_03d4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_03d9:  ldloc 26

	IL_03dd:  nop 
	IL_03de:  nop 
	IL_03df:  ldloc 25

	IL_03e3:  nop 
	IL_03e4:  nop 
	IL_03e5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03ea:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03ef:  ldloc 26

	IL_03f3:  nop 
	IL_03f4:  nop 
	IL_03f5:  ldc.i4 1
	IL_03fa:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_03ff:  br IL_0436

	IL_0404:  ldarg 1

	IL_0408:  nop 
	IL_0409:  nop 
	IL_040a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_040f:  ldloc 1

	IL_0413:  nop 
	IL_0414:  nop 
	IL_0415:  conv.u 
	IL_0416:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_041b:  stloc 26

	IL_041f:  nop 
	IL_0420:  nop 
	IL_0421:  ldloc 26

	IL_0425:  nop 
	IL_0426:  nop 
	IL_0427:  ldc.i4 1
	IL_042c:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0431:  br IL_0436

	IL_0436:  ldarg 1

	IL_043a:  nop 
	IL_043b:  nop 
	IL_043c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0441:  ldloc 1

	IL_0445:  nop 
	IL_0446:  nop 
	IL_0447:  conv.u 
	IL_0448:  ldloc 26

	IL_044c:  nop 
	IL_044d:  nop 
	IL_044e:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0453:  br IL_1378

	IL_0458:  br IL_0462

	IL_045d:  br IL_0462

	IL_0462:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_0467:  ldc.i4 0
	IL_046c:  beq IL_0476

	IL_0471:  br IL_1373

	IL_0476:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.DollarSign
	IL_047b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0480:  stloc 20

	IL_0484:  nop 
	IL_0485:  nop 
	IL_0486:  ldloc 20

	IL_048a:  nop 
	IL_048b:  nop 
	IL_048c:  ldloc 19

	IL_0490:  nop 
	IL_0491:  nop 
	IL_0492:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0497:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_049c:  stloc 21

	IL_04a0:  nop 
	IL_04a1:  nop 
	IL_04a2:  ldloc 21

	IL_04a6:  nop 
	IL_04a7:  nop 
	IL_04a8:  ldc.i4 1
	IL_04ad:  beq IL_04b7

	IL_04b2:  br IL_057b

	IL_04b7:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04bc:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04c1:  or 
	IL_04c2:  not 
	IL_04c3:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04c8:  ldc.i4 1
	IL_04cd:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_04d2:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_04d7:  ldc.i4 0
	IL_04dc:  beq IL_0530

	IL_04e1:  br IL_04e6

	IL_04e6:  ldc.i4 1
	IL_04eb:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ConvFlag
	IL_04f0:  ldstr "conv "
	IL_04f5:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_04fa:  call string string::Concat(string, string)
	IL_04ff:  stsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_0504:  ldsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_0509:  stloc 22

	IL_050d:  nop 
	IL_050e:  nop 
	IL_050f:  ldloc 22

	IL_0513:  nop 
	IL_0514:  nop 
	IL_0515:  callvirt instance string string::Trim()
	IL_051a:  stloc 22

	IL_051e:  nop 
	IL_051f:  nop 
	IL_0520:  ldloc 22

	IL_0524:  nop 
	IL_0525:  nop 
	IL_0526:  stsfld string dylan.NET.Tokenizer.Parser.ParserFlags::OrdOp
	IL_052b:  br IL_0535

	IL_0530:  br IL_0535

	IL_0535:  ldarg 1

	IL_0539:  nop 
	IL_053a:  nop 
	IL_053b:  ldloc 1

	IL_053f:  nop 
	IL_0540:  nop 
	IL_0541:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0546:  ldloc 1

	IL_054a:  nop 
	IL_054b:  nop 
	IL_054c:  ldc.i4 1
	IL_0551:  sub 
	IL_0552:  stloc 1

	IL_0556:  nop 
	IL_0557:  nop 
	IL_0558:  ldarg 1

	IL_055c:  nop 
	IL_055d:  nop 
	IL_055e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0563:  ldlen 
	IL_0564:  conv.i4 
	IL_0565:  ldc.i4 1
	IL_056a:  sub 
	IL_056b:  stloc 0

	IL_056f:  nop 
	IL_0570:  nop 
	IL_0571:  br IL_1378

	IL_0576:  br IL_0580

	IL_057b:  br IL_0580

	IL_0580:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0585:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_058a:  stloc 20

	IL_058e:  nop 
	IL_058f:  nop 
	IL_0590:  ldloc 20

	IL_0594:  nop 
	IL_0595:  nop 
	IL_0596:  ldloc 19

	IL_059a:  nop 
	IL_059b:  nop 
	IL_059c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_05a1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05a6:  stloc 21

	IL_05aa:  nop 
	IL_05ab:  nop 
	IL_05ac:  ldloc 21

	IL_05b0:  nop 
	IL_05b1:  nop 
	IL_05b2:  ldc.i4 1
	IL_05b7:  beq IL_05c1

	IL_05bc:  br IL_064d

	IL_05c1:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::DurConvFlag
	IL_05c6:  ldc.i4 0
	IL_05cb:  beq IL_063e

	IL_05d0:  br IL_05d5

	IL_05d5:  ldarg 1

	IL_05d9:  nop 
	IL_05da:  nop 
	IL_05db:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_05e0:  ldloc 1

	IL_05e4:  nop 
	IL_05e5:  nop 
	IL_05e6:  conv.u 
	IL_05e7:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_05ec:  stloc 27

	IL_05f0:  nop 
	IL_05f1:  nop 
	IL_05f2:  ldloc 27

	IL_05f6:  nop 
	IL_05f7:  nop 
	IL_05f8:  stsfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok dylan.NET.Tokenizer.Parser.ParserFlags::ConvTyp
	IL_05fd:  ldarg 1

	IL_0601:  nop 
	IL_0602:  nop 
	IL_0603:  ldloc 1

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_060e:  ldloc 1

	IL_0612:  nop 
	IL_0613:  nop 
	IL_0614:  ldc.i4 1
	IL_0619:  sub 
	IL_061a:  stloc 1

	IL_061e:  nop 
	IL_061f:  nop 
	IL_0620:  ldarg 1

	IL_0624:  nop 
	IL_0625:  nop 
	IL_0626:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_062b:  ldlen 
	IL_062c:  conv.i4 
	IL_062d:  ldc.i4 1
	IL_0632:  sub 
	IL_0633:  stloc 0

	IL_0637:  nop 
	IL_0638:  nop 
	IL_0639:  br IL_0643

	IL_063e:  br IL_0643

	IL_0643:  br IL_1378

	IL_0648:  br IL_0652

	IL_064d:  br IL_0652

	IL_0652:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_0657:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_065c:  stloc 20

	IL_0660:  nop 
	IL_0661:  nop 
	IL_0662:  ldloc 20

	IL_0666:  nop 
	IL_0667:  nop 
	IL_0668:  ldloc 19

	IL_066c:  nop 
	IL_066d:  nop 
	IL_066e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0673:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0678:  stloc 21

	IL_067c:  nop 
	IL_067d:  nop 
	IL_067e:  ldloc 21

	IL_0682:  nop 
	IL_0683:  nop 
	IL_0684:  ldc.i4 1
	IL_0689:  beq IL_0693

	IL_068e:  br IL_0756

	IL_0693:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_0698:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_069d:  or 
	IL_069e:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_06a3:  or 
	IL_06a4:  stloc 21

	IL_06a8:  nop 
	IL_06a9:  nop 
	IL_06aa:  ldloc 21

	IL_06ae:  nop 
	IL_06af:  nop 
	IL_06b0:  ldc.i4 1
	IL_06b5:  beq IL_06bf

	IL_06ba:  br IL_06cf

	IL_06bf:  ldc.i4 1
	IL_06c4:  stloc 4

	IL_06c8:  nop 
	IL_06c9:  nop 
	IL_06ca:  br IL_06d4

	IL_06cf:  br IL_06d4

	IL_06d4:  ldc.i4 1
	IL_06d9:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_06de:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_06e3:  ldc.i4 1
	IL_06e8:  beq IL_06f2

	IL_06ed:  br IL_0747

	IL_06f2:  ldarg 1

	IL_06f6:  nop 
	IL_06f7:  nop 
	IL_06f8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_06fd:  ldloc 1

	IL_0701:  nop 
	IL_0702:  nop 
	IL_0703:  conv.u 
	IL_0704:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0709:  stloc 28

	IL_070d:  nop 
	IL_070e:  nop 
	IL_070f:  ldarg 1

	IL_0713:  nop 
	IL_0714:  nop 
	IL_0715:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_071a:  ldloc 1

	IL_071e:  nop 
	IL_071f:  nop 
	IL_0720:  conv.u 
	IL_0721:  ldloc 28

	IL_0725:  nop 
	IL_0726:  nop 
	IL_0727:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateIdent(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident)
	IL_072c:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0731:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0736:  ldloc 1

	IL_073a:  nop 
	IL_073b:  nop 
	IL_073c:  stloc 2

	IL_0740:  nop 
	IL_0741:  nop 
	IL_0742:  br IL_074c

	IL_0747:  br IL_074c

	IL_074c:  br IL_1378

	IL_0751:  br IL_075b

	IL_0756:  br IL_075b

	IL_075b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral
	IL_0760:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0765:  stloc 20

	IL_0769:  nop 
	IL_076a:  nop 
	IL_076b:  ldloc 20

	IL_076f:  nop 
	IL_0770:  nop 
	IL_0771:  ldloc 19

	IL_0775:  nop 
	IL_0776:  nop 
	IL_0777:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_077c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0781:  stloc 21

	IL_0785:  nop 
	IL_0786:  nop 
	IL_0787:  ldloc 21

	IL_078b:  nop 
	IL_078c:  nop 
	IL_078d:  ldc.i4 1
	IL_0792:  beq IL_079c

	IL_0797:  br IL_0814

	IL_079c:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_07a1:  ldc.i4 1
	IL_07a6:  beq IL_07b0

	IL_07ab:  br IL_0805

	IL_07b0:  ldarg 1

	IL_07b4:  nop 
	IL_07b5:  nop 
	IL_07b6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_07bb:  ldloc 1

	IL_07bf:  nop 
	IL_07c0:  nop 
	IL_07c1:  conv.u 
	IL_07c2:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_07c7:  stloc 29

	IL_07cb:  nop 
	IL_07cc:  nop 
	IL_07cd:  ldarg 1

	IL_07d1:  nop 
	IL_07d2:  nop 
	IL_07d3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_07d8:  ldloc 1

	IL_07dc:  nop 
	IL_07dd:  nop 
	IL_07de:  conv.u 
	IL_07df:  ldloc 29

	IL_07e3:  nop 
	IL_07e4:  nop 
	IL_07e5:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateCharLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral)
	IL_07ea:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_07ef:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_07f4:  ldloc 1

	IL_07f8:  nop 
	IL_07f9:  nop 
	IL_07fa:  stloc 2

	IL_07fe:  nop 
	IL_07ff:  nop 
	IL_0800:  br IL_080a

	IL_0805:  br IL_080a

	IL_080a:  br IL_1378

	IL_080f:  br IL_0819

	IL_0814:  br IL_0819

	IL_0819:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral
	IL_081e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0823:  stloc 20

	IL_0827:  nop 
	IL_0828:  nop 
	IL_0829:  ldloc 20

	IL_082d:  nop 
	IL_082e:  nop 
	IL_082f:  ldloc 19

	IL_0833:  nop 
	IL_0834:  nop 
	IL_0835:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_083a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_083f:  stloc 21

	IL_0843:  nop 
	IL_0844:  nop 
	IL_0845:  ldloc 21

	IL_0849:  nop 
	IL_084a:  nop 
	IL_084b:  ldc.i4 1
	IL_0850:  beq IL_085a

	IL_0855:  br IL_08d2

	IL_085a:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_085f:  ldc.i4 1
	IL_0864:  beq IL_086e

	IL_0869:  br IL_08c3

	IL_086e:  ldarg 1

	IL_0872:  nop 
	IL_0873:  nop 
	IL_0874:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0879:  ldloc 1

	IL_087d:  nop 
	IL_087e:  nop 
	IL_087f:  conv.u 
	IL_0880:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0885:  stloc 30

	IL_0889:  nop 
	IL_088a:  nop 
	IL_088b:  ldarg 1

	IL_088f:  nop 
	IL_0890:  nop 
	IL_0891:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0896:  ldloc 1

	IL_089a:  nop 
	IL_089b:  nop 
	IL_089c:  conv.u 
	IL_089d:  ldloc 30

	IL_08a1:  nop 
	IL_08a2:  nop 
	IL_08a3:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateNullLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral)
	IL_08a8:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_08ad:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_08b2:  ldloc 1

	IL_08b6:  nop 
	IL_08b7:  nop 
	IL_08b8:  stloc 2

	IL_08bc:  nop 
	IL_08bd:  nop 
	IL_08be:  br IL_08c8

	IL_08c3:  br IL_08c8

	IL_08c8:  br IL_1378

	IL_08cd:  br IL_08d7

	IL_08d2:  br IL_08d7

	IL_08d7:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_08dc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_08e1:  stloc 20

	IL_08e5:  nop 
	IL_08e6:  nop 
	IL_08e7:  ldloc 20

	IL_08eb:  nop 
	IL_08ec:  nop 
	IL_08ed:  ldloc 19

	IL_08f1:  nop 
	IL_08f2:  nop 
	IL_08f3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_08f8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_08fd:  stloc 21

	IL_0901:  nop 
	IL_0902:  nop 
	IL_0903:  ldloc 21

	IL_0907:  nop 
	IL_0908:  nop 
	IL_0909:  ldc.i4 1
	IL_090e:  beq IL_0918

	IL_0913:  br IL_099a

	IL_0918:  ldc.i4 1
	IL_091d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_0922:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_0927:  ldc.i4 1
	IL_092c:  beq IL_0936

	IL_0931:  br IL_098b

	IL_0936:  ldarg 1

	IL_093a:  nop 
	IL_093b:  nop 
	IL_093c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0941:  ldloc 1

	IL_0945:  nop 
	IL_0946:  nop 
	IL_0947:  conv.u 
	IL_0948:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_094d:  stloc 31

	IL_0951:  nop 
	IL_0952:  nop 
	IL_0953:  ldarg 1

	IL_0957:  nop 
	IL_0958:  nop 
	IL_0959:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_095e:  ldloc 1

	IL_0962:  nop 
	IL_0963:  nop 
	IL_0964:  conv.u 
	IL_0965:  ldloc 31

	IL_0969:  nop 
	IL_096a:  nop 
	IL_096b:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateStringLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral)
	IL_0970:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0975:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_097a:  ldloc 1

	IL_097e:  nop 
	IL_097f:  nop 
	IL_0980:  stloc 2

	IL_0984:  nop 
	IL_0985:  nop 
	IL_0986:  br IL_0990

	IL_098b:  br IL_0990

	IL_0990:  br IL_1378

	IL_0995:  br IL_099f

	IL_099a:  br IL_099f

	IL_099f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral
	IL_09a4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_09a9:  stloc 20

	IL_09ad:  nop 
	IL_09ae:  nop 
	IL_09af:  ldloc 20

	IL_09b3:  nop 
	IL_09b4:  nop 
	IL_09b5:  ldloc 19

	IL_09b9:  nop 
	IL_09ba:  nop 
	IL_09bb:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_09c0:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_09c5:  stloc 21

	IL_09c9:  nop 
	IL_09ca:  nop 
	IL_09cb:  ldloc 21

	IL_09cf:  nop 
	IL_09d0:  nop 
	IL_09d1:  ldc.i4 1
	IL_09d6:  beq IL_09e0

	IL_09db:  br IL_0a58

	IL_09e0:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_09e5:  ldc.i4 1
	IL_09ea:  beq IL_09f4

	IL_09ef:  br IL_0a49

	IL_09f4:  ldarg 1

	IL_09f8:  nop 
	IL_09f9:  nop 
	IL_09fa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_09ff:  ldloc 1

	IL_0a03:  nop 
	IL_0a04:  nop 
	IL_0a05:  conv.u 
	IL_0a06:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a0b:  stloc 32

	IL_0a0f:  nop 
	IL_0a10:  nop 
	IL_0a11:  ldarg 1

	IL_0a15:  nop 
	IL_0a16:  nop 
	IL_0a17:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0a1c:  ldloc 1

	IL_0a20:  nop 
	IL_0a21:  nop 
	IL_0a22:  conv.u 
	IL_0a23:  ldloc 32

	IL_0a27:  nop 
	IL_0a28:  nop 
	IL_0a29:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateBoolLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral)
	IL_0a2e:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a33:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0a38:  ldloc 1

	IL_0a3c:  nop 
	IL_0a3d:  nop 
	IL_0a3e:  stloc 2

	IL_0a42:  nop 
	IL_0a43:  nop 
	IL_0a44:  br IL_0a4e

	IL_0a49:  br IL_0a4e

	IL_0a4e:  br IL_1378

	IL_0a53:  br IL_0a5d

	IL_0a58:  br IL_0a5d

	IL_0a5d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral
	IL_0a62:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a67:  stloc 20

	IL_0a6b:  nop 
	IL_0a6c:  nop 
	IL_0a6d:  ldloc 20

	IL_0a71:  nop 
	IL_0a72:  nop 
	IL_0a73:  ldloc 19

	IL_0a77:  nop 
	IL_0a78:  nop 
	IL_0a79:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0a7e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0a83:  stloc 21

	IL_0a87:  nop 
	IL_0a88:  nop 
	IL_0a89:  ldloc 21

	IL_0a8d:  nop 
	IL_0a8e:  nop 
	IL_0a8f:  ldc.i4 1
	IL_0a94:  beq IL_0a9e

	IL_0a99:  br IL_0b16

	IL_0a9e:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::isChanged
	IL_0aa3:  ldc.i4 1
	IL_0aa8:  beq IL_0ab2

	IL_0aad:  br IL_0b07

	IL_0ab2:  ldarg 1

	IL_0ab6:  nop 
	IL_0ab7:  nop 
	IL_0ab8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0abd:  ldloc 1

	IL_0ac1:  nop 
	IL_0ac2:  nop 
	IL_0ac3:  conv.u 
	IL_0ac4:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0ac9:  stloc 33

	IL_0acd:  nop 
	IL_0ace:  nop 
	IL_0acf:  ldarg 1

	IL_0ad3:  nop 
	IL_0ad4:  nop 
	IL_0ad5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0ada:  ldloc 1

	IL_0ade:  nop 
	IL_0adf:  nop 
	IL_0ae0:  conv.u 
	IL_0ae1:  ldloc 33

	IL_0ae5:  nop 
	IL_0ae6:  nop 
	IL_0ae7:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral class dylan.NET.Tokenizer.Parser.ParserFlags::UpdateNumLit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NumberLiteral)
	IL_0aec:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0af1:  call void class dylan.NET.Tokenizer.Parser.ParserFlags::SetUnaryFalse()
	IL_0af6:  ldloc 1

	IL_0afa:  nop 
	IL_0afb:  nop 
	IL_0afc:  stloc 2

	IL_0b00:  nop 
	IL_0b01:  nop 
	IL_0b02:  br IL_0b0c

	IL_0b07:  br IL_0b0c

	IL_0b0c:  br IL_1378

	IL_0b11:  br IL_0b1b

	IL_0b16:  br IL_0b1b

	IL_0b1b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewTok
	IL_0b20:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0b25:  stloc 20

	IL_0b29:  nop 
	IL_0b2a:  nop 
	IL_0b2b:  ldloc 20

	IL_0b2f:  nop 
	IL_0b30:  nop 
	IL_0b31:  ldloc 19

	IL_0b35:  nop 
	IL_0b36:  nop 
	IL_0b37:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0b3c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0b41:  stloc 21

	IL_0b45:  nop 
	IL_0b46:  nop 
	IL_0b47:  ldloc 21

	IL_0b4b:  nop 
	IL_0b4c:  nop 
	IL_0b4d:  ldc.i4 1
	IL_0b52:  beq IL_0b5c

	IL_0b57:  br IL_0d5e

	IL_0b5c:  ldarg 1

	IL_0b60:  nop 
	IL_0b61:  nop 
	IL_0b62:  ldloc 1

	IL_0b66:  nop 
	IL_0b67:  nop 
	IL_0b68:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0b6d:  ldloc 0

	IL_0b71:  nop 
	IL_0b72:  nop 
	IL_0b73:  ldc.i4 1
	IL_0b78:  sub 
	IL_0b79:  stloc 0

	IL_0b7d:  nop 
	IL_0b7e:  nop 
	IL_0b7f:  ldarg 1

	IL_0b83:  nop 
	IL_0b84:  nop 
	IL_0b85:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0b8a:  ldloc 1

	IL_0b8e:  nop 
	IL_0b8f:  nop 
	IL_0b90:  conv.u 
	IL_0b91:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0b96:  stloc 9

	IL_0b9a:  nop 
	IL_0b9b:  nop 
	IL_0b9c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0ba1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0ba6:  stloc 20

	IL_0baa:  nop 
	IL_0bab:  nop 
	IL_0bac:  ldloc 20

	IL_0bb0:  nop 
	IL_0bb1:  nop 
	IL_0bb2:  ldloc 9

	IL_0bb6:  nop 
	IL_0bb7:  nop 
	IL_0bb8:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0bbd:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0bc2:  stloc 21

	IL_0bc6:  nop 
	IL_0bc7:  nop 
	IL_0bc8:  ldloc 21

	IL_0bcc:  nop 
	IL_0bcd:  nop 
	IL_0bce:  ldc.i4 1
	IL_0bd3:  beq IL_0c36

	IL_0bd8:  br IL_0bdd

	IL_0bdd:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0be2:  stloc 10

	IL_0be6:  nop 
	IL_0be7:  nop 
	IL_0be8:  ldloc 10

	IL_0bec:  nop 
	IL_0bed:  nop 
	IL_0bee:  ldloc 9

	IL_0bf2:  nop 
	IL_0bf3:  nop 
	IL_0bf4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0bf9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0bfe:  ldloc 10

	IL_0c02:  nop 
	IL_0c03:  nop 
	IL_0c04:  ldloc 9

	IL_0c08:  nop 
	IL_0c09:  nop 
	IL_0c0a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0c0f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0c14:  ldarg 1

	IL_0c18:  nop 
	IL_0c19:  nop 
	IL_0c1a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0c1f:  ldloc 1

	IL_0c23:  nop 
	IL_0c24:  nop 
	IL_0c25:  conv.u 
	IL_0c26:  ldloc 10

	IL_0c2a:  nop 
	IL_0c2b:  nop 
	IL_0c2c:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0c31:  br IL_0c3b

	IL_0c36:  br IL_0c3b

	IL_0c3b:  ldarg.0 
	IL_0c3c:  ldarg 1

	IL_0c40:  nop 
	IL_0c41:  nop 
	IL_0c42:  ldloc 1

	IL_0c46:  nop 
	IL_0c47:  nop 
	IL_0c48:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procNewCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_0c4d:  starg 1

	IL_0c51:  nop 
	IL_0c52:  nop 
	IL_0c53:  ldarg 1

	IL_0c57:  nop 
	IL_0c58:  nop 
	IL_0c59:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0c5e:  ldlen 
	IL_0c5f:  conv.i4 
	IL_0c60:  ldc.i4 1
	IL_0c65:  sub 
	IL_0c66:  stloc 0

	IL_0c6a:  nop 
	IL_0c6b:  nop 
	IL_0c6c:  ldarg 1

	IL_0c70:  nop 
	IL_0c71:  nop 
	IL_0c72:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0c77:  ldloc 1

	IL_0c7b:  nop 
	IL_0c7c:  nop 
	IL_0c7d:  conv.u 
	IL_0c7e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0c83:  stloc 34

	IL_0c87:  nop 
	IL_0c88:  nop 
	IL_0c89:  ldloc 34

	IL_0c8d:  nop 
	IL_0c8e:  nop 
	IL_0c8f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0c94:  stloc 35

	IL_0c98:  nop 
	IL_0c99:  nop 
	IL_0c9a:  ldloc 35

	IL_0c9e:  nop 
	IL_0c9f:  nop 
	IL_0ca0:  ldlen 
	IL_0ca1:  conv.i4 
	IL_0ca2:  ldc.i4 1
	IL_0ca7:  sub 
	IL_0ca8:  stloc 36

	IL_0cac:  nop 
	IL_0cad:  nop 
	IL_0cae:  ldc.i4 -1
	IL_0cb3:  stloc 37

	IL_0cb7:  nop 
	IL_0cb8:  nop 
	IL_0cb9:  ldloc 36

	IL_0cbd:  nop 
	IL_0cbe:  nop 
	IL_0cbf:  ldc.i4 0
	IL_0cc4:  blt IL_0cce

	IL_0cc9:  br IL_0cd8

	IL_0cce:  br IL_0d43

	IL_0cd3:  br IL_0cdd

	IL_0cd8:  br IL_0cdd

	IL_0cdd:  ldloc 37

	IL_0ce1:  nop 
	IL_0ce2:  nop 
	IL_0ce3:  ldc.i4 1
	IL_0ce8:  add 
	IL_0ce9:  stloc 37

	IL_0ced:  nop 
	IL_0cee:  nop 
	IL_0cef:  ldloc 35

	IL_0cf3:  nop 
	IL_0cf4:  nop 
	IL_0cf5:  ldloc 37

	IL_0cf9:  nop 
	IL_0cfa:  nop 
	IL_0cfb:  conv.u 
	IL_0cfc:  ldarg.0 
	IL_0cfd:  ldloc 35

	IL_0d01:  nop 
	IL_0d02:  nop 
	IL_0d03:  ldloc 37

	IL_0d07:  nop 
	IL_0d08:  nop 
	IL_0d09:  conv.u 
	IL_0d0a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0d0f:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0d14:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0d19:  ldloc 37

	IL_0d1d:  nop 
	IL_0d1e:  nop 
	IL_0d1f:  ldloc 36

	IL_0d23:  nop 
	IL_0d24:  nop 
	IL_0d25:  beq IL_0d2f

	IL_0d2a:  br IL_0d39

	IL_0d2f:  br IL_0d43

	IL_0d34:  br IL_0d43

	IL_0d39:  br IL_0cdd

	IL_0d3e:  br IL_0d43

	IL_0d43:  ldloc 34

	IL_0d47:  nop 
	IL_0d48:  nop 
	IL_0d49:  ldloc 35

	IL_0d4d:  nop 
	IL_0d4e:  nop 
	IL_0d4f:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0d54:  br IL_1378

	IL_0d59:  br IL_0d63

	IL_0d5e:  br IL_0d63

	IL_0d63:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok
	IL_0d68:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d6d:  stloc 20

	IL_0d71:  nop 
	IL_0d72:  nop 
	IL_0d73:  ldloc 20

	IL_0d77:  nop 
	IL_0d78:  nop 
	IL_0d79:  ldloc 19

	IL_0d7d:  nop 
	IL_0d7e:  nop 
	IL_0d7f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d84:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0d89:  stloc 21

	IL_0d8d:  nop 
	IL_0d8e:  nop 
	IL_0d8f:  ldloc 21

	IL_0d93:  nop 
	IL_0d94:  nop 
	IL_0d95:  ldc.i4 1
	IL_0d9a:  beq IL_0da4

	IL_0d9f:  br IL_0ed7

	IL_0da4:  ldarg 1

	IL_0da8:  nop 
	IL_0da9:  nop 
	IL_0daa:  ldloc 1

	IL_0dae:  nop 
	IL_0daf:  nop 
	IL_0db0:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0db5:  ldloc 0

	IL_0db9:  nop 
	IL_0dba:  nop 
	IL_0dbb:  ldc.i4 1
	IL_0dc0:  sub 
	IL_0dc1:  stloc 0

	IL_0dc5:  nop 
	IL_0dc6:  nop 
	IL_0dc7:  ldarg 1

	IL_0dcb:  nop 
	IL_0dcc:  nop 
	IL_0dcd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0dd2:  ldloc 1

	IL_0dd6:  nop 
	IL_0dd7:  nop 
	IL_0dd8:  conv.u 
	IL_0dd9:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0dde:  stloc 11

	IL_0de2:  nop 
	IL_0de3:  nop 
	IL_0de4:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0de9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0dee:  stloc 20

	IL_0df2:  nop 
	IL_0df3:  nop 
	IL_0df4:  ldloc 20

	IL_0df8:  nop 
	IL_0df9:  nop 
	IL_0dfa:  ldloc 11

	IL_0dfe:  nop 
	IL_0dff:  nop 
	IL_0e00:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0e05:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0e0a:  stloc 21

	IL_0e0e:  nop 
	IL_0e0f:  nop 
	IL_0e10:  ldloc 21

	IL_0e14:  nop 
	IL_0e15:  nop 
	IL_0e16:  ldc.i4 1
	IL_0e1b:  beq IL_0e7e

	IL_0e20:  br IL_0e25

	IL_0e25:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0e2a:  stloc 12

	IL_0e2e:  nop 
	IL_0e2f:  nop 
	IL_0e30:  ldloc 12

	IL_0e34:  nop 
	IL_0e35:  nop 
	IL_0e36:  ldloc 11

	IL_0e3a:  nop 
	IL_0e3b:  nop 
	IL_0e3c:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0e41:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0e46:  ldloc 12

	IL_0e4a:  nop 
	IL_0e4b:  nop 
	IL_0e4c:  ldloc 11

	IL_0e50:  nop 
	IL_0e51:  nop 
	IL_0e52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0e57:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0e5c:  ldarg 1

	IL_0e60:  nop 
	IL_0e61:  nop 
	IL_0e62:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0e67:  ldloc 1

	IL_0e6b:  nop 
	IL_0e6c:  nop 
	IL_0e6d:  conv.u 
	IL_0e6e:  ldloc 12

	IL_0e72:  nop 
	IL_0e73:  nop 
	IL_0e74:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0e79:  br IL_0e83

	IL_0e7e:  br IL_0e83

	IL_0e83:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::'.ctor'()
	IL_0e88:  stloc 38

	IL_0e8c:  nop 
	IL_0e8d:  nop 
	IL_0e8e:  ldloc 38

	IL_0e92:  nop 
	IL_0e93:  nop 
	IL_0e94:  ldarg 1

	IL_0e98:  nop 
	IL_0e99:  nop 
	IL_0e9a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0e9f:  ldloc 1

	IL_0ea3:  nop 
	IL_0ea4:  nop 
	IL_0ea5:  conv.u 
	IL_0ea6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0eab:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_0eb0:  ldarg 1

	IL_0eb4:  nop 
	IL_0eb5:  nop 
	IL_0eb6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0ebb:  ldloc 1

	IL_0ebf:  nop 
	IL_0ec0:  nop 
	IL_0ec1:  conv.u 
	IL_0ec2:  ldloc 38

	IL_0ec6:  nop 
	IL_0ec7:  nop 
	IL_0ec8:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0ecd:  br IL_1378

	IL_0ed2:  br IL_0edc

	IL_0ed7:  br IL_0edc

	IL_0edc:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_0ee1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0ee6:  stloc 20

	IL_0eea:  nop 
	IL_0eeb:  nop 
	IL_0eec:  ldloc 20

	IL_0ef0:  nop 
	IL_0ef1:  nop 
	IL_0ef2:  ldloc 19

	IL_0ef6:  nop 
	IL_0ef7:  nop 
	IL_0ef8:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0efd:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0f02:  stloc 21

	IL_0f06:  nop 
	IL_0f07:  nop 
	IL_0f08:  ldloc 21

	IL_0f0c:  nop 
	IL_0f0d:  nop 
	IL_0f0e:  ldc.i4 1
	IL_0f13:  beq IL_0f1d

	IL_0f18:  br IL_1114

	IL_0f1d:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_0f22:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_0f27:  or 
	IL_0f28:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_0f2d:  or 
	IL_0f2e:  stloc 21

	IL_0f32:  nop 
	IL_0f33:  nop 
	IL_0f34:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_0f39:  ldc.i4 1
	IL_0f3e:  beq IL_0f48

	IL_0f43:  br IL_10e4

	IL_0f48:  ldc.i4 0
	IL_0f4d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_0f52:  ldloc 21

	IL_0f56:  nop 
	IL_0f57:  nop 
	IL_0f58:  ldc.i4 1
	IL_0f5d:  beq IL_0f67

	IL_0f62:  br IL_0f77

	IL_0f67:  ldc.i4 1
	IL_0f6c:  stloc 4

	IL_0f70:  nop 
	IL_0f71:  nop 
	IL_0f72:  br IL_0f7c

	IL_0f77:  br IL_0f7c

	IL_0f7c:  ldc.i4 1
	IL_0f81:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_0f86:  ldarg.0 
	IL_0f87:  ldarg 1

	IL_0f8b:  nop 
	IL_0f8c:  nop 
	IL_0f8d:  ldloc 1

	IL_0f91:  nop 
	IL_0f92:  nop 
	IL_0f93:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMethodCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_0f98:  starg 1

	IL_0f9c:  nop 
	IL_0f9d:  nop 
	IL_0f9e:  ldloc 1

	IL_0fa2:  nop 
	IL_0fa3:  nop 
	IL_0fa4:  ldc.i4 1
	IL_0fa9:  sub 
	IL_0faa:  stloc 1

	IL_0fae:  nop 
	IL_0faf:  nop 
	IL_0fb0:  ldarg 1

	IL_0fb4:  nop 
	IL_0fb5:  nop 
	IL_0fb6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0fbb:  ldlen 
	IL_0fbc:  conv.i4 
	IL_0fbd:  ldc.i4 1
	IL_0fc2:  sub 
	IL_0fc3:  stloc 0

	IL_0fc7:  nop 
	IL_0fc8:  nop 
	IL_0fc9:  ldarg 1

	IL_0fcd:  nop 
	IL_0fce:  nop 
	IL_0fcf:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0fd4:  ldloc 1

	IL_0fd8:  nop 
	IL_0fd9:  nop 
	IL_0fda:  conv.u 
	IL_0fdb:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0fe0:  stloc 39

	IL_0fe4:  nop 
	IL_0fe5:  nop 
	IL_0fe6:  ldloc 39

	IL_0fea:  nop 
	IL_0feb:  nop 
	IL_0fec:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_0ff1:  stloc 40

	IL_0ff5:  nop 
	IL_0ff6:  nop 
	IL_0ff7:  ldloc 40

	IL_0ffb:  nop 
	IL_0ffc:  nop 
	IL_0ffd:  ldlen 
	IL_0ffe:  conv.i4 
	IL_0fff:  ldc.i4 1
	IL_1004:  sub 
	IL_1005:  stloc 41

	IL_1009:  nop 
	IL_100a:  nop 
	IL_100b:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1010:  stloc 5

	IL_1014:  nop 
	IL_1015:  nop 
	IL_1016:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_101b:  stloc 6

	IL_101f:  nop 
	IL_1020:  nop 
	IL_1021:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1026:  stloc 7

	IL_102a:  nop 
	IL_102b:  nop 
	IL_102c:  ldc.i4 -1
	IL_1031:  stloc 42

	IL_1035:  nop 
	IL_1036:  nop 
	IL_1037:  ldloc 41

	IL_103b:  nop 
	IL_103c:  nop 
	IL_103d:  ldc.i4 0
	IL_1042:  blt IL_104c

	IL_1047:  br IL_1056

	IL_104c:  br IL_10df

	IL_1051:  br IL_105b

	IL_1056:  br IL_105b

	IL_105b:  ldloc 42

	IL_105f:  nop 
	IL_1060:  nop 
	IL_1061:  ldc.i4 1
	IL_1066:  add 
	IL_1067:  stloc 42

	IL_106b:  nop 
	IL_106c:  nop 
	IL_106d:  ldc.i4 0
	IL_1072:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1077:  ldc.i4 0
	IL_107c:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1081:  ldc.i4 0
	IL_1086:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_108b:  ldloc 40

	IL_108f:  nop 
	IL_1090:  nop 
	IL_1091:  ldloc 42

	IL_1095:  nop 
	IL_1096:  nop 
	IL_1097:  conv.u 
	IL_1098:  ldarg.0 
	IL_1099:  ldloc 40

	IL_109d:  nop 
	IL_109e:  nop 
	IL_109f:  ldloc 42

	IL_10a3:  nop 
	IL_10a4:  nop 
	IL_10a5:  conv.u 
	IL_10a6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_10ab:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_10b0:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_10b5:  ldloc 42

	IL_10b9:  nop 
	IL_10ba:  nop 
	IL_10bb:  ldloc 41

	IL_10bf:  nop 
	IL_10c0:  nop 
	IL_10c1:  beq IL_10cb

	IL_10c6:  br IL_10d5

	IL_10cb:  br IL_10df

	IL_10d0:  br IL_10df

	IL_10d5:  br IL_105b

	IL_10da:  br IL_10df

	IL_10df:  br IL_10e9

	IL_10e4:  br IL_10e9

	IL_10e9:  ldloc 5

	IL_10ed:  nop 
	IL_10ee:  nop 
	IL_10ef:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_10f4:  ldloc 6

	IL_10f8:  nop 
	IL_10f9:  nop 
	IL_10fa:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_10ff:  ldloc 7

	IL_1103:  nop 
	IL_1104:  nop 
	IL_1105:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_110a:  br IL_1378

	IL_110f:  br IL_1119

	IL_1114:  br IL_1119

	IL_1119:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
	IL_111e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1123:  stloc 20

	IL_1127:  nop 
	IL_1128:  nop 
	IL_1129:  ldloc 20

	IL_112d:  nop 
	IL_112e:  nop 
	IL_112f:  ldloc 19

	IL_1133:  nop 
	IL_1134:  nop 
	IL_1135:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_113a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_113f:  stloc 21

	IL_1143:  nop 
	IL_1144:  nop 
	IL_1145:  ldloc 21

	IL_1149:  nop 
	IL_114a:  nop 
	IL_114b:  ldc.i4 1
	IL_1150:  beq IL_115a

	IL_1155:  br IL_132b

	IL_115a:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_115f:  ldc.i4 1
	IL_1164:  beq IL_116e

	IL_1169:  br IL_1200

	IL_116e:  ldc.i4 0
	IL_1173:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1178:  ldarg.0 
	IL_1179:  ldarg 1

	IL_117d:  nop 
	IL_117e:  nop 
	IL_117f:  ldloc 1

	IL_1183:  nop 
	IL_1184:  nop 
	IL_1185:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procIdentArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_118a:  starg 1

	IL_118e:  nop 
	IL_118f:  nop 
	IL_1190:  ldloc 1

	IL_1194:  nop 
	IL_1195:  nop 
	IL_1196:  ldc.i4 1
	IL_119b:  sub 
	IL_119c:  stloc 1

	IL_11a0:  nop 
	IL_11a1:  nop 
	IL_11a2:  ldarg 1

	IL_11a6:  nop 
	IL_11a7:  nop 
	IL_11a8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_11ad:  ldlen 
	IL_11ae:  conv.i4 
	IL_11af:  ldc.i4 1
	IL_11b4:  sub 
	IL_11b5:  stloc 0

	IL_11b9:  nop 
	IL_11ba:  nop 
	IL_11bb:  ldarg 1

	IL_11bf:  nop 
	IL_11c0:  nop 
	IL_11c1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_11c6:  ldloc 1

	IL_11ca:  nop 
	IL_11cb:  nop 
	IL_11cc:  conv.u 
	IL_11cd:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_11d2:  stloc 43

	IL_11d6:  nop 
	IL_11d7:  nop 
	IL_11d8:  ldloc 43

	IL_11dc:  nop 
	IL_11dd:  nop 
	IL_11de:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_11e3:  stloc 44

	IL_11e7:  nop 
	IL_11e8:  nop 
	IL_11e9:  ldarg.0 
	IL_11ea:  ldloc 44

	IL_11ee:  nop 
	IL_11ef:  nop 
	IL_11f0:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_11f5:  stloc 44

	IL_11f9:  nop 
	IL_11fa:  nop 
	IL_11fb:  br IL_1321

	IL_1200:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1205:  ldc.i4 1
	IL_120a:  beq IL_1214

	IL_120f:  br IL_1317

	IL_1214:  ldc.i4 0
	IL_1219:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_121e:  ldarg.0 
	IL_121f:  ldarg 1

	IL_1223:  nop 
	IL_1224:  nop 
	IL_1225:  ldloc 1

	IL_1229:  nop 
	IL_122a:  nop 
	IL_122b:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMtdArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_1230:  starg 1

	IL_1234:  nop 
	IL_1235:  nop 
	IL_1236:  ldloc 1

	IL_123a:  nop 
	IL_123b:  nop 
	IL_123c:  ldc.i4 1
	IL_1241:  sub 
	IL_1242:  stloc 1

	IL_1246:  nop 
	IL_1247:  nop 
	IL_1248:  ldarg 1

	IL_124c:  nop 
	IL_124d:  nop 
	IL_124e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1253:  ldlen 
	IL_1254:  conv.i4 
	IL_1255:  ldc.i4 1
	IL_125a:  sub 
	IL_125b:  stloc 0

	IL_125f:  nop 
	IL_1260:  nop 
	IL_1261:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1266:  stloc 5

	IL_126a:  nop 
	IL_126b:  nop 
	IL_126c:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1271:  stloc 6

	IL_1275:  nop 
	IL_1276:  nop 
	IL_1277:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_127c:  stloc 7

	IL_1280:  nop 
	IL_1281:  nop 
	IL_1282:  ldarg 1

	IL_1286:  nop 
	IL_1287:  nop 
	IL_1288:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_128d:  ldloc 1

	IL_1291:  nop 
	IL_1292:  nop 
	IL_1293:  conv.u 
	IL_1294:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1299:  stloc 45

	IL_129d:  nop 
	IL_129e:  nop 
	IL_129f:  ldloc 45

	IL_12a3:  nop 
	IL_12a4:  nop 
	IL_12a5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_12aa:  stloc 46

	IL_12ae:  nop 
	IL_12af:  nop 
	IL_12b0:  ldloc 46

	IL_12b4:  nop 
	IL_12b5:  nop 
	IL_12b6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_12bb:  stloc 44

	IL_12bf:  nop 
	IL_12c0:  nop 
	IL_12c1:  ldc.i4 0
	IL_12c6:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_12cb:  ldc.i4 0
	IL_12d0:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_12d5:  ldc.i4 0
	IL_12da:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_12df:  ldarg.0 
	IL_12e0:  ldloc 44

	IL_12e4:  nop 
	IL_12e5:  nop 
	IL_12e6:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_12eb:  stloc 44

	IL_12ef:  nop 
	IL_12f0:  nop 
	IL_12f1:  ldloc 5

	IL_12f5:  nop 
	IL_12f6:  nop 
	IL_12f7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_12fc:  ldloc 6

	IL_1300:  nop 
	IL_1301:  nop 
	IL_1302:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1307:  ldloc 7

	IL_130b:  nop 
	IL_130c:  nop 
	IL_130d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1312:  br IL_131c

	IL_1317:  br IL_131c

	IL_131c:  br IL_1321

	IL_1321:  br IL_1378

	IL_1326:  br IL_1330

	IL_132b:  br IL_1330

	IL_1330:  ldloc 1

	IL_1334:  nop 
	IL_1335:  nop 
	IL_1336:  ldloc 2

	IL_133a:  nop 
	IL_133b:  nop 
	IL_133c:  bgt IL_1346

	IL_1341:  br IL_1369

	IL_1346:  ldc.i4 0
	IL_134b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1350:  ldc.i4 0
	IL_1355:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_135a:  ldc.i4 0
	IL_135f:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1364:  br IL_136e

	IL_1369:  br IL_136e

	IL_136e:  br IL_1378

	IL_1373:  br IL_1378

	IL_1378:  ldloc 1

	IL_137c:  nop 
	IL_137d:  nop 
	IL_137e:  ldloc 0

	IL_1382:  nop 
	IL_1383:  nop 
	IL_1384:  bge IL_138e

	IL_1389:  br IL_1398

	IL_138e:  br IL_1820

	IL_1393:  br IL_13a2

	IL_1398:  br IL_00db

	IL_139d:  br IL_13a2

	IL_13a2:  br IL_1820

	IL_13a7:  ldloc 1

	IL_13ab:  nop 
	IL_13ac:  nop 
	IL_13ad:  ldc.i4 1
	IL_13b2:  sub 
	IL_13b3:  stloc 1

	IL_13b7:  nop 
	IL_13b8:  nop 
	IL_13b9:  ldarg 1

	IL_13bd:  nop 
	IL_13be:  nop 
	IL_13bf:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_13c4:  ldloc 1

	IL_13c8:  nop 
	IL_13c9:  nop 
	IL_13ca:  conv.u 
	IL_13cb:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_13d0:  stloc 8

	IL_13d4:  nop 
	IL_13d5:  nop 
	IL_13d6:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_13db:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_13e0:  stloc 20

	IL_13e4:  nop 
	IL_13e5:  nop 
	IL_13e6:  ldloc 20

	IL_13ea:  nop 
	IL_13eb:  nop 
	IL_13ec:  ldloc 8

	IL_13f0:  nop 
	IL_13f1:  nop 
	IL_13f2:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_13f7:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_13fc:  stloc 21

	IL_1400:  nop 
	IL_1401:  nop 
	IL_1402:  ldloc 21

	IL_1406:  nop 
	IL_1407:  nop 
	IL_1408:  ldc.i4 1
	IL_140d:  beq IL_1417

	IL_1412:  br IL_153f

	IL_1417:  ldloc 8

	IL_141b:  nop 
	IL_141c:  nop 
	IL_141d:  stloc 14

	IL_1421:  nop 
	IL_1422:  nop 
	IL_1423:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1428:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_142d:  or 
	IL_142e:  stloc 21

	IL_1432:  nop 
	IL_1433:  nop 
	IL_1434:  ldloc 21

	IL_1438:  nop 
	IL_1439:  nop 
	IL_143a:  ldc.i4 1
	IL_143f:  beq IL_1449

	IL_1444:  br IL_14e0

	IL_1449:  ldc.i4 0
	IL_144e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1453:  ldc.i4 0
	IL_1458:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_145d:  ldloc 1

	IL_1461:  nop 
	IL_1462:  nop 
	IL_1463:  ldc.i4 1
	IL_1468:  add 
	IL_1469:  stloc 18

	IL_146d:  nop 
	IL_146e:  nop 
	IL_146f:  ldarg 1

	IL_1473:  nop 
	IL_1474:  nop 
	IL_1475:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_147a:  ldloc 18

	IL_147e:  nop 
	IL_147f:  nop 
	IL_1480:  conv.u 
	IL_1481:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1486:  stloc 13

	IL_148a:  nop 
	IL_148b:  nop 
	IL_148c:  ldloc 14

	IL_1490:  nop 
	IL_1491:  nop 
	IL_1492:  ldc.i4 1
	IL_1497:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_149c:  ldloc 14

	IL_14a0:  nop 
	IL_14a1:  nop 
	IL_14a2:  ldloc 13

	IL_14a6:  nop 
	IL_14a7:  nop 
	IL_14a8:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_14ad:  ldarg 1

	IL_14b1:  nop 
	IL_14b2:  nop 
	IL_14b3:  ldloc 18

	IL_14b7:  nop 
	IL_14b8:  nop 
	IL_14b9:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_14be:  ldarg 1

	IL_14c2:  nop 
	IL_14c3:  nop 
	IL_14c4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_14c9:  ldloc 1

	IL_14cd:  nop 
	IL_14ce:  nop 
	IL_14cf:  conv.u 
	IL_14d0:  ldloc 14

	IL_14d4:  nop 
	IL_14d5:  nop 
	IL_14d6:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_14db:  br IL_14e5

	IL_14e0:  br IL_14e5

	IL_14e5:  ldloc 14

	IL_14e9:  nop 
	IL_14ea:  nop 
	IL_14eb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_14f0:  stloc 22

	IL_14f4:  nop 
	IL_14f5:  nop 
	IL_14f6:  ldloc 22

	IL_14fa:  nop 
	IL_14fb:  nop 
	IL_14fc:  ldstr "^::(.)*$"
	IL_1501:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1506:  stloc 21

	IL_150a:  nop 
	IL_150b:  nop 
	IL_150c:  ldloc 21

	IL_1510:  nop 
	IL_1511:  nop 
	IL_1512:  ldc.i4 1
	IL_1517:  beq IL_1521

	IL_151c:  br IL_1530

	IL_1521:  ldc.i4 1
	IL_1526:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_152b:  br IL_1535

	IL_1530:  br IL_1535

	IL_1535:  br IL_17f2

	IL_153a:  br IL_1544

	IL_153f:  br IL_1544

	IL_1544:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_1549:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_154e:  stloc 20

	IL_1552:  nop 
	IL_1553:  nop 
	IL_1554:  ldloc 20

	IL_1558:  nop 
	IL_1559:  nop 
	IL_155a:  ldloc 8

	IL_155e:  nop 
	IL_155f:  nop 
	IL_1560:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1565:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_156a:  stloc 21

	IL_156e:  nop 
	IL_156f:  nop 
	IL_1570:  ldloc 21

	IL_1574:  nop 
	IL_1575:  nop 
	IL_1576:  ldc.i4 1
	IL_157b:  beq IL_1585

	IL_1580:  br IL_16cf

	IL_1585:  ldloc 8

	IL_1589:  nop 
	IL_158a:  nop 
	IL_158b:  stloc 15

	IL_158f:  nop 
	IL_1590:  nop 
	IL_1591:  ldloc 15

	IL_1595:  nop 
	IL_1596:  nop 
	IL_1597:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_159c:  stloc 16

	IL_15a0:  nop 
	IL_15a1:  nop 
	IL_15a2:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_15a7:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_15ac:  or 
	IL_15ad:  stloc 21

	IL_15b1:  nop 
	IL_15b2:  nop 
	IL_15b3:  ldloc 21

	IL_15b7:  nop 
	IL_15b8:  nop 
	IL_15b9:  ldc.i4 1
	IL_15be:  beq IL_15c8

	IL_15c3:  br IL_1670

	IL_15c8:  ldc.i4 0
	IL_15cd:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_15d2:  ldc.i4 0
	IL_15d7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_15dc:  ldloc 1

	IL_15e0:  nop 
	IL_15e1:  nop 
	IL_15e2:  ldc.i4 1
	IL_15e7:  add 
	IL_15e8:  stloc 18

	IL_15ec:  nop 
	IL_15ed:  nop 
	IL_15ee:  ldarg 1

	IL_15f2:  nop 
	IL_15f3:  nop 
	IL_15f4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_15f9:  ldloc 18

	IL_15fd:  nop 
	IL_15fe:  nop 
	IL_15ff:  conv.u 
	IL_1600:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1605:  stloc 13

	IL_1609:  nop 
	IL_160a:  nop 
	IL_160b:  ldloc 16

	IL_160f:  nop 
	IL_1610:  nop 
	IL_1611:  ldc.i4 1
	IL_1616:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_161b:  ldloc 16

	IL_161f:  nop 
	IL_1620:  nop 
	IL_1621:  ldloc 13

	IL_1625:  nop 
	IL_1626:  nop 
	IL_1627:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_162c:  ldarg 1

	IL_1630:  nop 
	IL_1631:  nop 
	IL_1632:  ldloc 18

	IL_1636:  nop 
	IL_1637:  nop 
	IL_1638:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_163d:  ldloc 15

	IL_1641:  nop 
	IL_1642:  nop 
	IL_1643:  ldloc 16

	IL_1647:  nop 
	IL_1648:  nop 
	IL_1649:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_164e:  ldarg 1

	IL_1652:  nop 
	IL_1653:  nop 
	IL_1654:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1659:  ldloc 1

	IL_165d:  nop 
	IL_165e:  nop 
	IL_165f:  conv.u 
	IL_1660:  ldloc 15

	IL_1664:  nop 
	IL_1665:  nop 
	IL_1666:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_166b:  br IL_1675

	IL_1670:  br IL_1675

	IL_1675:  ldloc 16

	IL_1679:  nop 
	IL_167a:  nop 
	IL_167b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1680:  stloc 22

	IL_1684:  nop 
	IL_1685:  nop 
	IL_1686:  ldloc 22

	IL_168a:  nop 
	IL_168b:  nop 
	IL_168c:  ldstr "^::(.)*$"
	IL_1691:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1696:  stloc 21

	IL_169a:  nop 
	IL_169b:  nop 
	IL_169c:  ldloc 21

	IL_16a0:  nop 
	IL_16a1:  nop 
	IL_16a2:  ldc.i4 1
	IL_16a7:  beq IL_16b1

	IL_16ac:  br IL_16c0

	IL_16b1:  ldc.i4 1
	IL_16b6:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_16bb:  br IL_16c5

	IL_16c0:  br IL_16c5

	IL_16c5:  br IL_17f2

	IL_16ca:  br IL_16d4

	IL_16cf:  br IL_16d4

	IL_16d4:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_16d9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_16de:  stloc 20

	IL_16e2:  nop 
	IL_16e3:  nop 
	IL_16e4:  ldloc 20

	IL_16e8:  nop 
	IL_16e9:  nop 
	IL_16ea:  ldloc 8

	IL_16ee:  nop 
	IL_16ef:  nop 
	IL_16f0:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_16f5:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_16fa:  stloc 21

	IL_16fe:  nop 
	IL_16ff:  nop 
	IL_1700:  ldloc 21

	IL_1704:  nop 
	IL_1705:  nop 
	IL_1706:  ldc.i4 1
	IL_170b:  beq IL_1715

	IL_1710:  br IL_17ed

	IL_1715:  ldloc 8

	IL_1719:  nop 
	IL_171a:  nop 
	IL_171b:  stloc 17

	IL_171f:  nop 
	IL_1720:  nop 
	IL_1721:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1726:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_172b:  or 
	IL_172c:  stloc 21

	IL_1730:  nop 
	IL_1731:  nop 
	IL_1732:  ldloc 21

	IL_1736:  nop 
	IL_1737:  nop 
	IL_1738:  ldc.i4 1
	IL_173d:  beq IL_1747

	IL_1742:  br IL_17de

	IL_1747:  ldc.i4 0
	IL_174c:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1751:  ldc.i4 0
	IL_1756:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_175b:  ldloc 1

	IL_175f:  nop 
	IL_1760:  nop 
	IL_1761:  ldc.i4 1
	IL_1766:  add 
	IL_1767:  stloc 18

	IL_176b:  nop 
	IL_176c:  nop 
	IL_176d:  ldarg 1

	IL_1771:  nop 
	IL_1772:  nop 
	IL_1773:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1778:  ldloc 18

	IL_177c:  nop 
	IL_177d:  nop 
	IL_177e:  conv.u 
	IL_177f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1784:  stloc 13

	IL_1788:  nop 
	IL_1789:  nop 
	IL_178a:  ldloc 17

	IL_178e:  nop 
	IL_178f:  nop 
	IL_1790:  ldc.i4 1
	IL_1795:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_179a:  ldloc 17

	IL_179e:  nop 
	IL_179f:  nop 
	IL_17a0:  ldloc 13

	IL_17a4:  nop 
	IL_17a5:  nop 
	IL_17a6:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_17ab:  ldarg 1

	IL_17af:  nop 
	IL_17b0:  nop 
	IL_17b1:  ldloc 18

	IL_17b5:  nop 
	IL_17b6:  nop 
	IL_17b7:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_17bc:  ldarg 1

	IL_17c0:  nop 
	IL_17c1:  nop 
	IL_17c2:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_17c7:  ldloc 1

	IL_17cb:  nop 
	IL_17cc:  nop 
	IL_17cd:  conv.u 
	IL_17ce:  ldloc 17

	IL_17d2:  nop 
	IL_17d3:  nop 
	IL_17d4:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_17d9:  br IL_17e3

	IL_17de:  br IL_17e3

	IL_17e3:  br IL_17f2

	IL_17e8:  br IL_17f2

	IL_17ed:  br IL_17f2

	IL_17f2:  ldloc 1

	IL_17f6:  nop 
	IL_17f7:  nop 
	IL_17f8:  ldc.i4 0
	IL_17fd:  ble IL_1807

	IL_1802:  br IL_1811

	IL_1807:  br IL_1820

	IL_180c:  br IL_181b

	IL_1811:  br IL_00db

	IL_1816:  br IL_181b

	IL_181b:  br IL_1820

	IL_1820:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1825:  ldc.i4 0
	IL_182a:  beq IL_1834

	IL_182f:  br IL_18af

	IL_1834:  ldloc 4

	IL_1838:  nop 
	IL_1839:  nop 
	IL_183a:  ldc.i4 1
	IL_183f:  beq IL_1849

	IL_1844:  br IL_18a5

	IL_1849:  ldc.i4 1
	IL_184e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1853:  ldarg 1

	IL_1857:  nop 
	IL_1858:  nop 
	IL_1859:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_185e:  ldlen 
	IL_185f:  conv.i4 
	IL_1860:  stloc 0

	IL_1864:  nop 
	IL_1865:  nop 
	IL_1866:  ldloc 0

	IL_186a:  nop 
	IL_186b:  nop 
	IL_186c:  stloc 1

	IL_1870:  nop 
	IL_1871:  nop 
	IL_1872:  ldc.i4 0
	IL_1877:  stloc 4

	IL_187b:  nop 
	IL_187c:  nop 
	IL_187d:  ldc.i4 0
	IL_1882:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1887:  ldc.i4 0
	IL_188c:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1891:  ldc.i4 0
	IL_1896:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_189b:  br IL_00db

	IL_18a0:  br IL_18aa

	IL_18a5:  br IL_18aa

	IL_18aa:  br IL_18be

	IL_18af:  ldc.i4 0
	IL_18b4:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_18b9:  br IL_18be

	IL_18be:  ldc.i4 0
	IL_18c3:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_18c8:  ldc.i4 0
	IL_18cd:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_18d2:  ldc.i4 0
	IL_18d7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_18dc:  ldarg 1

	IL_18e0:  nop 
	IL_18e1:  nop 
	IL_18e2:  ret 
    } // end of method ExprOptimizer::Optimize

    // method line 18
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x9e4c
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
        // Method begins at RVA 0x9e60
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
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0x9f3c
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

    // method line 21
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkElseIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa114
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

    // method line 22
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDebug (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa2ec
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

    // method line 23
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkScope (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa3d4
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

    // method line 24
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkImport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa4bc
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

    // method line 25
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkLocimport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa598
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

    // method line 26
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkReturn (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa674
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

    // method line 27
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkCmt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa854
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

    // method line 28
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkElse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xa910
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

    // method line 29
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xaa00
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

    // method line 30
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndMtd (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xab3c
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

    // method line 31
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndCls (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xac78
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

    // method line 32
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssembly (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xadb4
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

    // method line 33
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVer (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xaeb4
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

    // method line 34
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkClass (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb210
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

    // method line 35
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkField (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb550
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

    // method line 36
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethod (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb8a4
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

    // method line 37
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethodCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbfb8
	// Code size 1345 (0x541)
	.maxstack 39
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_2,
		class [mscorlib]System.Type	V_3,
		bool	V_4,
		bool	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_10,
		int32	V_11,
		bool	V_12,
		int32	V_13,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_14,
		class [mscorlib]System.Type	V_15,
		bool	V_16,
		int32	V_17,
		class dylan.NET.Tokenizer.Parser.ExprOptimizer	V_18)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 2
	IL_0012:  bgt IL_001c

	IL_0017:  br IL_0535

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
	IL_00cf:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_00d4:  stloc 7

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::'.ctor'()
	IL_00df:  stloc 8

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldnull 
	IL_00e6:  stloc 9

	IL_00ea:  nop 
	IL_00eb:  nop 
	IL_00ec:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_00f1:  stloc 10

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldc.i4 1
	IL_00fc:  stloc 11

	IL_0100:  nop 
	IL_0101:  nop 
	IL_0102:  ldc.i4 1
	IL_0107:  stloc 12

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldc.i4 1
	IL_0112:  stloc 13

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  ldarg 2

	IL_011c:  nop 
	IL_011d:  nop 
	IL_011e:  ldobj [mscorlib]System.Boolean
	IL_0123:  ldc.i4 1
	IL_0128:  beq IL_0132

	IL_012d:  br IL_052b

	IL_0132:  ldloc 6

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  ldarg 1

	IL_013c:  nop 
	IL_013d:  nop 
	IL_013e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0143:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0148:  ldloc 6

	IL_014c:  nop 
	IL_014d:  nop 
	IL_014e:  ldarg 1

	IL_0152:  nop 
	IL_0153:  nop 
	IL_0154:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0159:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_015e:  ldarg 1

	IL_0162:  nop 
	IL_0163:  nop 
	IL_0164:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0169:  ldc.i4 0
	IL_016e:  conv.u 
	IL_016f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0174:  stloc 9

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldloc 7

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldloc 9

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_018b:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0190:  ldloc 7

	IL_0194:  nop 
	IL_0195:  nop 
	IL_0196:  ldloc 9

	IL_019a:  nop 
	IL_019b:  nop 
	IL_019c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01a1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01a6:  ldarg 1

	IL_01aa:  nop 
	IL_01ab:  nop 
	IL_01ac:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_01b1:  ldloc 13

	IL_01b5:  nop 
	IL_01b6:  nop 
	IL_01b7:  conv.u 
	IL_01b8:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01bd:  stloc 14

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldarg 1

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_01ce:  ldlen 
	IL_01cf:  conv.i4 
	IL_01d0:  stloc 17

	IL_01d4:  nop 
	IL_01d5:  nop 
	IL_01d6:  newobj instance void class dylan.NET.Tokenizer.Parser.ExprOptimizer::'.ctor'()
	IL_01db:  stloc 18

	IL_01df:  nop 
	IL_01e0:  nop 
	IL_01e1:  ldloc 13

	IL_01e5:  nop 
	IL_01e6:  nop 
	IL_01e7:  ldc.i4 1
	IL_01ec:  add 
	IL_01ed:  stloc 13

	IL_01f1:  nop 
	IL_01f2:  nop 
	IL_01f3:  ldarg 1

	IL_01f7:  nop 
	IL_01f8:  nop 
	IL_01f9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_01fe:  ldloc 13

	IL_0202:  nop 
	IL_0203:  nop 
	IL_0204:  conv.u 
	IL_0205:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_020a:  stloc 14

	IL_020e:  nop 
	IL_020f:  nop 
	IL_0210:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_0215:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_021a:  stloc 15

	IL_021e:  nop 
	IL_021f:  nop 
	IL_0220:  ldloc 15

	IL_0224:  nop 
	IL_0225:  nop 
	IL_0226:  ldloc 14

	IL_022a:  nop 
	IL_022b:  nop 
	IL_022c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0231:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0236:  stloc 16

	IL_023a:  nop 
	IL_023b:  nop 
	IL_023c:  ldloc 16

	IL_0240:  nop 
	IL_0241:  nop 
	IL_0242:  ldc.i4 1
	IL_0247:  beq IL_0251

	IL_024c:  br IL_02fa

	IL_0251:  ldloc 11

	IL_0255:  nop 
	IL_0256:  nop 
	IL_0257:  ldc.i4 1
	IL_025c:  sub 
	IL_025d:  stloc 11

	IL_0261:  nop 
	IL_0262:  nop 
	IL_0263:  ldloc 11

	IL_0267:  nop 
	IL_0268:  nop 
	IL_0269:  ldc.i4 0
	IL_026e:  beq IL_0278

	IL_0273:  br IL_02db

	IL_0278:  ldc.i4 0
	IL_027d:  stloc 12

	IL_0281:  nop 
	IL_0282:  nop 
	IL_0283:  ldloc 18

	IL_0287:  nop 
	IL_0288:  nop 
	IL_0289:  ldloc 10

	IL_028d:  nop 
	IL_028e:  nop 
	IL_028f:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0294:  stloc 10

	IL_0298:  nop 
	IL_0299:  nop 
	IL_029a:  ldloc 10

	IL_029e:  nop 
	IL_029f:  nop 
	IL_02a0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_02a5:  ldlen 
	IL_02a6:  conv.i4 
	IL_02a7:  ldc.i4 0
	IL_02ac:  bgt IL_02b6

	IL_02b1:  br IL_02cc

	IL_02b6:  ldloc 8

	IL_02ba:  nop 
	IL_02bb:  nop 
	IL_02bc:  ldloc 10

	IL_02c0:  nop 
	IL_02c1:  nop 
	IL_02c2:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_02c7:  br IL_02d1

	IL_02cc:  br IL_02d1

	IL_02d1:  br IL_0504

	IL_02d6:  br IL_02f0

	IL_02db:  ldc.i4 1
	IL_02e0:  stloc 12

	IL_02e4:  nop 
	IL_02e5:  nop 
	IL_02e6:  br IL_0499

	IL_02eb:  br IL_02f0

	IL_02f0:  br IL_0499

	IL_02f5:  br IL_02ff

	IL_02fa:  br IL_02ff

	IL_02ff:  ldarg 1

	IL_0303:  nop 
	IL_0304:  nop 
	IL_0305:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_030a:  ldloc 13

	IL_030e:  nop 
	IL_030f:  nop 
	IL_0310:  conv.u 
	IL_0311:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0316:  stloc 14

	IL_031a:  nop 
	IL_031b:  nop 
	IL_031c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_0321:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0326:  stloc 15

	IL_032a:  nop 
	IL_032b:  nop 
	IL_032c:  ldloc 15

	IL_0330:  nop 
	IL_0331:  nop 
	IL_0332:  ldloc 14

	IL_0336:  nop 
	IL_0337:  nop 
	IL_0338:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_033d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0342:  stloc 16

	IL_0346:  nop 
	IL_0347:  nop 
	IL_0348:  ldloc 16

	IL_034c:  nop 
	IL_034d:  nop 
	IL_034e:  ldc.i4 1
	IL_0353:  beq IL_035d

	IL_0358:  br IL_0384

	IL_035d:  ldloc 11

	IL_0361:  nop 
	IL_0362:  nop 
	IL_0363:  ldc.i4 1
	IL_0368:  add 
	IL_0369:  stloc 11

	IL_036d:  nop 
	IL_036e:  nop 
	IL_036f:  ldc.i4 1
	IL_0374:  stloc 12

	IL_0378:  nop 
	IL_0379:  nop 
	IL_037a:  br IL_0499

	IL_037f:  br IL_0389

	IL_0384:  br IL_0389

	IL_0389:  ldarg 1

	IL_038d:  nop 
	IL_038e:  nop 
	IL_038f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_0394:  ldloc 13

	IL_0398:  nop 
	IL_0399:  nop 
	IL_039a:  conv.u 
	IL_039b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03a0:  stloc 14

	IL_03a4:  nop 
	IL_03a5:  nop 
	IL_03a6:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.Comma
	IL_03ab:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03b0:  stloc 15

	IL_03b4:  nop 
	IL_03b5:  nop 
	IL_03b6:  ldloc 15

	IL_03ba:  nop 
	IL_03bb:  nop 
	IL_03bc:  ldloc 14

	IL_03c0:  nop 
	IL_03c1:  nop 
	IL_03c2:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_03c7:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_03cc:  stloc 16

	IL_03d0:  nop 
	IL_03d1:  nop 
	IL_03d2:  ldloc 16

	IL_03d6:  nop 
	IL_03d7:  nop 
	IL_03d8:  ldc.i4 1
	IL_03dd:  beq IL_03e7

	IL_03e2:  br IL_0484

	IL_03e7:  ldloc 11

	IL_03eb:  nop 
	IL_03ec:  nop 
	IL_03ed:  ldc.i4 1
	IL_03f2:  beq IL_03fc

	IL_03f7:  br IL_046a

	IL_03fc:  ldc.i4 0
	IL_0401:  stloc 12

	IL_0405:  nop 
	IL_0406:  nop 
	IL_0407:  ldloc 18

	IL_040b:  nop 
	IL_040c:  nop 
	IL_040d:  ldloc 10

	IL_0411:  nop 
	IL_0412:  nop 
	IL_0413:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0418:  stloc 10

	IL_041c:  nop 
	IL_041d:  nop 
	IL_041e:  ldloc 10

	IL_0422:  nop 
	IL_0423:  nop 
	IL_0424:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0429:  ldlen 
	IL_042a:  conv.i4 
	IL_042b:  ldc.i4 0
	IL_0430:  bgt IL_043a

	IL_0435:  br IL_0450

	IL_043a:  ldloc 8

	IL_043e:  nop 
	IL_043f:  nop 
	IL_0440:  ldloc 10

	IL_0444:  nop 
	IL_0445:  nop 
	IL_0446:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::AddParam(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_044b:  br IL_0455

	IL_0450:  br IL_0455

	IL_0455:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_045a:  stloc 10

	IL_045e:  nop 
	IL_045f:  nop 
	IL_0460:  br IL_0499

	IL_0465:  br IL_047f

	IL_046a:  ldc.i4 1
	IL_046f:  stloc 12

	IL_0473:  nop 
	IL_0474:  nop 
	IL_0475:  br IL_0499

	IL_047a:  br IL_047f

	IL_047f:  br IL_0499

	IL_0484:  ldc.i4 1
	IL_0489:  stloc 12

	IL_048d:  nop 
	IL_048e:  nop 
	IL_048f:  br IL_0499

	IL_0494:  br IL_0499

	IL_0499:  ldloc 12

	IL_049d:  nop 
	IL_049e:  nop 
	IL_049f:  ldc.i4 1
	IL_04a4:  beq IL_04ae

	IL_04a9:  br IL_04d5

	IL_04ae:  ldloc 10

	IL_04b2:  nop 
	IL_04b3:  nop 
	IL_04b4:  ldarg 1

	IL_04b8:  nop 
	IL_04b9:  nop 
	IL_04ba:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Tokens
	IL_04bf:  ldloc 13

	IL_04c3:  nop 
	IL_04c4:  nop 
	IL_04c5:  conv.u 
	IL_04c6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_04cb:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_04d0:  br IL_04da

	IL_04d5:  br IL_04da

	IL_04da:  ldloc 13

	IL_04de:  nop 
	IL_04df:  nop 
	IL_04e0:  ldloc 17

	IL_04e4:  nop 
	IL_04e5:  nop 
	IL_04e6:  beq IL_04f0

	IL_04eb:  br IL_04fa

	IL_04f0:  br IL_0504

	IL_04f5:  br IL_0504

	IL_04fa:  br IL_01e1

	IL_04ff:  br IL_0504

	IL_0504:  ldloc 8

	IL_0508:  nop 
	IL_0509:  nop 
	IL_050a:  ldloc 7

	IL_050e:  nop 
	IL_050f:  nop 
	IL_0510:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0515:  ldloc 6

	IL_0519:  nop 
	IL_051a:  nop 
	IL_051b:  ldloc 8

	IL_051f:  nop 
	IL_0520:  nop 
	IL_0521:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::MethodToken
	IL_0526:  br IL_0530

	IL_052b:  br IL_0530

	IL_0530:  br IL_053a

	IL_0535:  br IL_053a

	IL_053a:  ldloc 6

	IL_053e:  nop 
	IL_053f:  nop 
	IL_0540:  ret 
    } // end of method StmtOptimizer::checkMethodCall

    // method line 38
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVarAs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc508
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

    // method line 39
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt AssOpt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xc72c
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

    // method line 40
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssign (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc950
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

    // method line 41
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xcc54
	// Code size 1899 (0x76b)
	.maxstack 98
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

	IL_016d:  br IL_0764

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
	IL_01b5:  br IL_0764

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
	IL_01fd:  br IL_0764

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
	IL_0245:  br IL_0764

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
	IL_028d:  br IL_0764

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
	IL_02d5:  br IL_0764

	IL_02da:  br IL_02e4

	IL_02df:  br IL_02e4

	IL_02e4:  ldarg.0 
	IL_02e5:  ldarg 1

	IL_02e9:  nop 
	IL_02ea:  nop 
	IL_02eb:  ldloca 4

	IL_02ef:  nop 
	IL_02f0:  nop 
	IL_02f1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkClass(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_031d:  br IL_0764

	IL_0322:  br IL_032c

	IL_0327:  br IL_032c

	IL_032c:  ldarg.0 
	IL_032d:  ldarg 1

	IL_0331:  nop 
	IL_0332:  nop 
	IL_0333:  ldloca 4

	IL_0337:  nop 
	IL_0338:  nop 
	IL_0339:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkField(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0365:  br IL_0764

	IL_036a:  br IL_0374

	IL_036f:  br IL_0374

	IL_0374:  ldarg.0 
	IL_0375:  ldarg 1

	IL_0379:  nop 
	IL_037a:  nop 
	IL_037b:  ldloca 4

	IL_037f:  nop 
	IL_0380:  nop 
	IL_0381:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkMethod(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_03ad:  br IL_0764

	IL_03b2:  br IL_03bc

	IL_03b7:  br IL_03bc

	IL_03bc:  ldarg.0 
	IL_03bd:  ldarg 1

	IL_03c1:  nop 
	IL_03c2:  nop 
	IL_03c3:  ldloca 4

	IL_03c7:  nop 
	IL_03c8:  nop 
	IL_03c9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkMethodCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_03f5:  br IL_0764

	IL_03fa:  br IL_0404

	IL_03ff:  br IL_0404

	IL_0404:  ldarg.0 
	IL_0405:  ldarg 1

	IL_0409:  nop 
	IL_040a:  nop 
	IL_040b:  ldloca 4

	IL_040f:  nop 
	IL_0410:  nop 
	IL_0411:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkAssign(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_043d:  br IL_0764

	IL_0442:  br IL_044c

	IL_0447:  br IL_044c

	IL_044c:  ldarg.0 
	IL_044d:  ldarg 1

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  ldloca 4

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkVarAs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0485:  br IL_0764

	IL_048a:  br IL_0494

	IL_048f:  br IL_0494

	IL_0494:  ldarg.0 
	IL_0495:  ldarg 1

	IL_0499:  nop 
	IL_049a:  nop 
	IL_049b:  ldloca 4

	IL_049f:  nop 
	IL_04a0:  nop 
	IL_04a1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkReturn(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_04cd:  br IL_0764

	IL_04d2:  br IL_04dc

	IL_04d7:  br IL_04dc

	IL_04dc:  ldarg.0 
	IL_04dd:  ldarg 1

	IL_04e1:  nop 
	IL_04e2:  nop 
	IL_04e3:  ldloca 4

	IL_04e7:  nop 
	IL_04e8:  nop 
	IL_04e9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndMtd(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0515:  br IL_0764

	IL_051a:  br IL_0524

	IL_051f:  br IL_0524

	IL_0524:  ldarg.0 
	IL_0525:  ldarg 1

	IL_0529:  nop 
	IL_052a:  nop 
	IL_052b:  ldloca 4

	IL_052f:  nop 
	IL_0530:  nop 
	IL_0531:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndCls(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_055d:  br IL_0764

	IL_0562:  br IL_056c

	IL_0567:  br IL_056c

	IL_056c:  ldarg.0 
	IL_056d:  ldarg 1

	IL_0571:  nop 
	IL_0572:  nop 
	IL_0573:  ldloca 4

	IL_0577:  nop 
	IL_0578:  nop 
	IL_0579:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkDebug(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_05a5:  br IL_0764

	IL_05aa:  br IL_05b4

	IL_05af:  br IL_05b4

	IL_05b4:  ldarg.0 
	IL_05b5:  ldarg 1

	IL_05b9:  nop 
	IL_05ba:  nop 
	IL_05bb:  ldloca 4

	IL_05bf:  nop 
	IL_05c0:  nop 
	IL_05c1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkScope(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_05ed:  br IL_0764

	IL_05f2:  br IL_05fc

	IL_05f7:  br IL_05fc

	IL_05fc:  ldarg.0 
	IL_05fd:  ldarg 1

	IL_0601:  nop 
	IL_0602:  nop 
	IL_0603:  ldloca 4

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkRefasm(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0635:  br IL_0764

	IL_063a:  br IL_0644

	IL_063f:  br IL_0644

	IL_0644:  ldarg.0 
	IL_0645:  ldarg 1

	IL_0649:  nop 
	IL_064a:  nop 
	IL_064b:  ldloca 4

	IL_064f:  nop 
	IL_0650:  nop 
	IL_0651:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_067d:  br IL_0764

	IL_0682:  br IL_068c

	IL_0687:  br IL_068c

	IL_068c:  ldarg.0 
	IL_068d:  ldarg 1

	IL_0691:  nop 
	IL_0692:  nop 
	IL_0693:  ldloca 4

	IL_0697:  nop 
	IL_0698:  nop 
	IL_0699:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElseIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_06c5:  br IL_0764

	IL_06ca:  br IL_06d4

	IL_06cf:  br IL_06d4

	IL_06d4:  ldarg.0 
	IL_06d5:  ldarg 1

	IL_06d9:  nop 
	IL_06da:  nop 
	IL_06db:  ldloca 4

	IL_06df:  nop 
	IL_06e0:  nop 
	IL_06e1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_070d:  br IL_0764

	IL_0712:  br IL_071c

	IL_0717:  br IL_071c

	IL_071c:  ldarg.0 
	IL_071d:  ldarg 1

	IL_0721:  nop 
	IL_0722:  nop 
	IL_0723:  ldloca 4

	IL_0727:  nop 
	IL_0728:  nop 
	IL_0729:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0755:  br IL_0764

	IL_075a:  br IL_0764

	IL_075f:  br IL_0764

	IL_0764:  ldarg 1

	IL_0768:  nop 
	IL_0769:  nop 
	IL_076a:  ret 
    } // end of method StmtOptimizer::Optimize

    // method line 42
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xd3cc
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

    // method line 43
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet Parse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet stms)  cil managed 
    {
        // Method begins at RVA 0xd3e0
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

    // method line 44
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xd4ac
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Parser::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.Parser
}

