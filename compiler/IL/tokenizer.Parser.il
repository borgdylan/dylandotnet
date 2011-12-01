.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:7:9
}
.assembly extern dnu
{
  .ver 11:2:7:9
}
.assembly 'tokenizer.Parser'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 37 2E 39 00 00 ) // ...11.2.7.9..

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
  .ver  11:2:7:9
}

.module tokenizer.Parser.dll // GUID = {C4EC85F1-2AAD-47E0-89AA-79E808979677}


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
	// Code size 20470 (0x4ff6)
	.maxstack 548
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok	V_52,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok	V_53,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok	V_56,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok	V_57,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok	V_58,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok	V_59,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok	V_60,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok	V_61,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok	V_62,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok	V_63,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok	V_64,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok	V_65,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok	V_66,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok	V_67,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok	V_68,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok	V_69,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok	V_70,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok	V_71,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok	V_72,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok	V_73,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr	V_74,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr	V_75,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr	V_76,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr	V_77,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr	V_78,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr	V_79,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr	V_80,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr	V_81,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr	V_82,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr	V_83,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr	V_84,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok	V_85,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok	V_86,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok	V_88,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok	V_89,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok	V_92,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok	V_93,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok	V_94,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok	V_95,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok	V_96,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok	V_97,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok	V_98,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok	V_99,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok	V_100,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok	V_101,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok	V_102,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_103,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_104,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_105,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_106,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_107,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_108,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_109,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_110,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_111,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral	V_112,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral	V_113,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_114,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral	V_115,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral	V_116,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral	V_117,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral	V_118,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral	V_119,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral	V_120,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_121,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_122)
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
	IL_00b0:  br IL_4fef

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
	IL_0132:  br IL_4fef

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
	IL_01b4:  br IL_4fef

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
	IL_0236:  br IL_4fef

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
	IL_02b8:  br IL_4fef

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
	IL_033a:  br IL_4fef

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
	IL_03bc:  br IL_4fef

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
	IL_043e:  br IL_4fef

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

	IL_0521:  br IL_4fef

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
	IL_05a3:  br IL_4fef

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
	IL_0625:  br IL_4fef

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
	IL_06a7:  br IL_4fef

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
	IL_0729:  br IL_4fef

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
	IL_07ab:  br IL_4fef

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
	IL_082d:  br IL_4fef

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
	IL_08af:  br IL_4fef

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
	IL_0931:  br IL_4fef

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
	IL_09b3:  br IL_4fef

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
	IL_0a35:  br IL_4fef

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
	IL_0ab7:  br IL_4fef

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
	IL_0b39:  br IL_4fef

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
	IL_0bbb:  br IL_4fef

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
	IL_0c3d:  br IL_4fef

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
	IL_0cbf:  br IL_4fef

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
	IL_0d41:  br IL_4fef

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
	IL_0dc3:  br IL_4fef

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
	IL_0e45:  br IL_4fef

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
	IL_0ec7:  br IL_4fef

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
	IL_0f49:  br IL_4fef

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
	IL_0fcb:  br IL_4fef

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
	IL_104d:  br IL_4fef

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
	IL_10cf:  br IL_4fef

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
	IL_1151:  br IL_4fef

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
	IL_11d3:  br IL_4fef

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
	IL_1255:  br IL_4fef

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
	IL_12d7:  br IL_4fef

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
	IL_1359:  br IL_4fef

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
	IL_13db:  br IL_4fef

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
	IL_145d:  br IL_4fef

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
	IL_14e9:  br IL_4fef

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
	IL_1575:  br IL_4fef

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
	IL_15f7:  br IL_4fef

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
	IL_1683:  br IL_4fef

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
	IL_1705:  br IL_4fef

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
	IL_1787:  br IL_4fef

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
	IL_1809:  br IL_4fef

	IL_180e:  br IL_1818

	IL_1813:  br IL_1818

	IL_1818:  ldarg 1

	IL_181c:  nop 
	IL_181d:  nop 
	IL_181e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1823:  ldstr "ptr"
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

	IL_1848:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok::'.ctor'()
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
	IL_188b:  br IL_4fef

	IL_1890:  br IL_189a

	IL_1895:  br IL_189a

	IL_189a:  ldarg 1

	IL_189e:  nop 
	IL_189f:  nop 
	IL_18a0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_18a5:  ldstr "gettype"
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

	IL_18ca:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok::'.ctor'()
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
	IL_190d:  br IL_4fef

	IL_1912:  br IL_191c

	IL_1917:  br IL_191c

	IL_191c:  ldarg 1

	IL_1920:  nop 
	IL_1921:  nop 
	IL_1922:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1927:  ldstr "#refasm"
	IL_192c:  call int32 string::Compare(string, string)
	IL_1931:  stloc 0

	IL_1935:  nop 
	IL_1936:  nop 
	IL_1937:  ldloc 0

	IL_193b:  nop 
	IL_193c:  nop 
	IL_193d:  ldc.i4 0
	IL_1942:  beq IL_194c

	IL_1947:  br IL_19a3

	IL_194c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.RefasmTok::'.ctor'()
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
	IL_198f:  ldc.i4 1
	IL_1994:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1999:  br IL_4fef

	IL_199e:  br IL_19a8

	IL_19a3:  br IL_19a8

	IL_19a8:  ldarg 1

	IL_19ac:  nop 
	IL_19ad:  nop 
	IL_19ae:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_19b3:  ldstr "#debug"
	IL_19b8:  call int32 string::Compare(string, string)
	IL_19bd:  stloc 0

	IL_19c1:  nop 
	IL_19c2:  nop 
	IL_19c3:  ldloc 0

	IL_19c7:  nop 
	IL_19c8:  nop 
	IL_19c9:  ldc.i4 0
	IL_19ce:  beq IL_19d8

	IL_19d3:  br IL_1a25

	IL_19d8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DebugTok::'.ctor'()
	IL_19dd:  stloc 55

	IL_19e1:  nop 
	IL_19e2:  nop 
	IL_19e3:  ldloc 55

	IL_19e7:  nop 
	IL_19e8:  nop 
	IL_19e9:  ldarg 1

	IL_19ed:  nop 
	IL_19ee:  nop 
	IL_19ef:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_19f4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_19f9:  ldloc 55

	IL_19fd:  nop 
	IL_19fe:  nop 
	IL_19ff:  ldarg 1

	IL_1a03:  nop 
	IL_1a04:  nop 
	IL_1a05:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a0a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a0f:  ldloc 55

	IL_1a13:  nop 
	IL_1a14:  nop 
	IL_1a15:  starg 1

	IL_1a19:  nop 
	IL_1a1a:  nop 
	IL_1a1b:  br IL_4fef

	IL_1a20:  br IL_1a2a

	IL_1a25:  br IL_1a2a

	IL_1a2a:  ldarg 1

	IL_1a2e:  nop 
	IL_1a2f:  nop 
	IL_1a30:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a35:  ldstr "#scope"
	IL_1a3a:  call int32 string::Compare(string, string)
	IL_1a3f:  stloc 0

	IL_1a43:  nop 
	IL_1a44:  nop 
	IL_1a45:  ldloc 0

	IL_1a49:  nop 
	IL_1a4a:  nop 
	IL_1a4b:  ldc.i4 0
	IL_1a50:  beq IL_1a5a

	IL_1a55:  br IL_1aa7

	IL_1a5a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ScopeTok::'.ctor'()
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
	IL_1a9d:  br IL_4fef

	IL_1aa2:  br IL_1aac

	IL_1aa7:  br IL_1aac

	IL_1aac:  ldarg 1

	IL_1ab0:  nop 
	IL_1ab1:  nop 
	IL_1ab2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ab7:  ldstr "import"
	IL_1abc:  call int32 string::Compare(string, string)
	IL_1ac1:  stloc 0

	IL_1ac5:  nop 
	IL_1ac6:  nop 
	IL_1ac7:  ldloc 0

	IL_1acb:  nop 
	IL_1acc:  nop 
	IL_1acd:  ldc.i4 0
	IL_1ad2:  beq IL_1adc

	IL_1ad7:  br IL_1b33

	IL_1adc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ImportTok::'.ctor'()
	IL_1ae1:  stloc 57

	IL_1ae5:  nop 
	IL_1ae6:  nop 
	IL_1ae7:  ldloc 57

	IL_1aeb:  nop 
	IL_1aec:  nop 
	IL_1aed:  ldarg 1

	IL_1af1:  nop 
	IL_1af2:  nop 
	IL_1af3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1af8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1afd:  ldloc 57

	IL_1b01:  nop 
	IL_1b02:  nop 
	IL_1b03:  ldarg 1

	IL_1b07:  nop 
	IL_1b08:  nop 
	IL_1b09:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b0e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b13:  ldloc 57

	IL_1b17:  nop 
	IL_1b18:  nop 
	IL_1b19:  starg 1

	IL_1b1d:  nop 
	IL_1b1e:  nop 
	IL_1b1f:  ldc.i4 1
	IL_1b24:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1b29:  br IL_4fef

	IL_1b2e:  br IL_1b38

	IL_1b33:  br IL_1b38

	IL_1b38:  ldarg 1

	IL_1b3c:  nop 
	IL_1b3d:  nop 
	IL_1b3e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b43:  ldstr "locimport"
	IL_1b48:  call int32 string::Compare(string, string)
	IL_1b4d:  stloc 0

	IL_1b51:  nop 
	IL_1b52:  nop 
	IL_1b53:  ldloc 0

	IL_1b57:  nop 
	IL_1b58:  nop 
	IL_1b59:  ldc.i4 0
	IL_1b5e:  beq IL_1b68

	IL_1b63:  br IL_1bbf

	IL_1b68:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.LocimportTok::'.ctor'()
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
	IL_1bab:  ldc.i4 1
	IL_1bb0:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1bb5:  br IL_4fef

	IL_1bba:  br IL_1bc4

	IL_1bbf:  br IL_1bc4

	IL_1bc4:  ldarg 1

	IL_1bc8:  nop 
	IL_1bc9:  nop 
	IL_1bca:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1bcf:  ldstr "assembly"
	IL_1bd4:  call int32 string::Compare(string, string)
	IL_1bd9:  stloc 0

	IL_1bdd:  nop 
	IL_1bde:  nop 
	IL_1bdf:  ldloc 0

	IL_1be3:  nop 
	IL_1be4:  nop 
	IL_1be5:  ldc.i4 0
	IL_1bea:  beq IL_1bf4

	IL_1bef:  br IL_1c41

	IL_1bf4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AssemblyTok::'.ctor'()
	IL_1bf9:  stloc 59

	IL_1bfd:  nop 
	IL_1bfe:  nop 
	IL_1bff:  ldloc 59

	IL_1c03:  nop 
	IL_1c04:  nop 
	IL_1c05:  ldarg 1

	IL_1c09:  nop 
	IL_1c0a:  nop 
	IL_1c0b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c10:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c15:  ldloc 59

	IL_1c19:  nop 
	IL_1c1a:  nop 
	IL_1c1b:  ldarg 1

	IL_1c1f:  nop 
	IL_1c20:  nop 
	IL_1c21:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c26:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c2b:  ldloc 59

	IL_1c2f:  nop 
	IL_1c30:  nop 
	IL_1c31:  starg 1

	IL_1c35:  nop 
	IL_1c36:  nop 
	IL_1c37:  br IL_4fef

	IL_1c3c:  br IL_1c46

	IL_1c41:  br IL_1c46

	IL_1c46:  ldarg 1

	IL_1c4a:  nop 
	IL_1c4b:  nop 
	IL_1c4c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c51:  ldstr "ver"
	IL_1c56:  call int32 string::Compare(string, string)
	IL_1c5b:  stloc 0

	IL_1c5f:  nop 
	IL_1c60:  nop 
	IL_1c61:  ldloc 0

	IL_1c65:  nop 
	IL_1c66:  nop 
	IL_1c67:  ldc.i4 0
	IL_1c6c:  beq IL_1c76

	IL_1c71:  br IL_1ccd

	IL_1c76:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VerTok::'.ctor'()
	IL_1c7b:  stloc 60

	IL_1c7f:  nop 
	IL_1c80:  nop 
	IL_1c81:  ldloc 60

	IL_1c85:  nop 
	IL_1c86:  nop 
	IL_1c87:  ldarg 1

	IL_1c8b:  nop 
	IL_1c8c:  nop 
	IL_1c8d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c92:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_1c97:  ldloc 60

	IL_1c9b:  nop 
	IL_1c9c:  nop 
	IL_1c9d:  ldarg 1

	IL_1ca1:  nop 
	IL_1ca2:  nop 
	IL_1ca3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ca8:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cad:  ldloc 60

	IL_1cb1:  nop 
	IL_1cb2:  nop 
	IL_1cb3:  starg 1

	IL_1cb7:  nop 
	IL_1cb8:  nop 
	IL_1cb9:  ldc.i4 1
	IL_1cbe:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::NoOptFlag
	IL_1cc3:  br IL_4fef

	IL_1cc8:  br IL_1cd2

	IL_1ccd:  br IL_1cd2

	IL_1cd2:  ldarg 1

	IL_1cd6:  nop 
	IL_1cd7:  nop 
	IL_1cd8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cdd:  ldstr "on"
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

	IL_1d02:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OnTok::'.ctor'()
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
	IL_1d45:  br IL_4fef

	IL_1d4a:  br IL_1d54

	IL_1d4f:  br IL_1d54

	IL_1d54:  ldarg 1

	IL_1d58:  nop 
	IL_1d59:  nop 
	IL_1d5a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1d5f:  ldstr "off"
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

	IL_1d84:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OffTok::'.ctor'()
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
	IL_1dc7:  br IL_4fef

	IL_1dcc:  br IL_1dd6

	IL_1dd1:  br IL_1dd6

	IL_1dd6:  ldarg 1

	IL_1dda:  nop 
	IL_1ddb:  nop 
	IL_1ddc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1de1:  ldstr "exe"
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

	IL_1e06:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExeTok::'.ctor'()
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
	IL_1e49:  br IL_4fef

	IL_1e4e:  br IL_1e58

	IL_1e53:  br IL_1e58

	IL_1e58:  ldarg 1

	IL_1e5c:  nop 
	IL_1e5d:  nop 
	IL_1e5e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1e63:  ldstr "dll"
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

	IL_1e88:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.DllTok::'.ctor'()
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
	IL_1ecb:  br IL_4fef

	IL_1ed0:  br IL_1eda

	IL_1ed5:  br IL_1eda

	IL_1eda:  ldarg 1

	IL_1ede:  nop 
	IL_1edf:  nop 
	IL_1ee0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ee5:  ldstr "field"
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

	IL_1f0a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.FieldTok::'.ctor'()
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
	IL_1f4d:  br IL_4fef

	IL_1f52:  br IL_1f5c

	IL_1f57:  br IL_1f5c

	IL_1f5c:  ldarg 1

	IL_1f60:  nop 
	IL_1f61:  nop 
	IL_1f62:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f67:  ldstr "class"
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

	IL_1f8c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ClassTok::'.ctor'()
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
	IL_1fcf:  br IL_4fef

	IL_1fd4:  br IL_1fde

	IL_1fd9:  br IL_1fde

	IL_1fde:  ldarg 1

	IL_1fe2:  nop 
	IL_1fe3:  nop 
	IL_1fe4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1fe9:  ldstr "extends"
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

	IL_200e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ExtendsTok::'.ctor'()
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
	IL_2051:  br IL_4fef

	IL_2056:  br IL_2060

	IL_205b:  br IL_2060

	IL_2060:  ldarg 1

	IL_2064:  nop 
	IL_2065:  nop 
	IL_2066:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_206b:  ldstr "method"
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

	IL_2090:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodTok::'.ctor'()
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
	IL_20d3:  br IL_4fef

	IL_20d8:  br IL_20e2

	IL_20dd:  br IL_20e2

	IL_20e2:  ldarg 1

	IL_20e6:  nop 
	IL_20e7:  nop 
	IL_20e8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_20ed:  ldstr "end"
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

	IL_2112:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.EndTok::'.ctor'()
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
	IL_2155:  br IL_4fef

	IL_215a:  br IL_2164

	IL_215f:  br IL_2164

	IL_2164:  ldarg 1

	IL_2168:  nop 
	IL_2169:  nop 
	IL_216a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_216f:  ldstr "return"
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

	IL_2194:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.ReturnTok::'.ctor'()
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
	IL_21d7:  br IL_4fef

	IL_21dc:  br IL_21e6

	IL_21e1:  br IL_21e6

	IL_21e6:  ldarg 1

	IL_21ea:  nop 
	IL_21eb:  nop 
	IL_21ec:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21f1:  ldstr "var"
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

	IL_2216:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.VarTok::'.ctor'()
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
	IL_2259:  br IL_4fef

	IL_225e:  br IL_2268

	IL_2263:  br IL_2268

	IL_2268:  ldarg 1

	IL_226c:  nop 
	IL_226d:  nop 
	IL_226e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2273:  ldstr "as"
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

	IL_2298:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.AsTok::'.ctor'()
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
	IL_22db:  br IL_4fef

	IL_22e0:  br IL_22ea

	IL_22e5:  br IL_22ea

	IL_22ea:  ldarg 1

	IL_22ee:  nop 
	IL_22ef:  nop 
	IL_22f0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22f5:  ldstr "of"
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

	IL_231a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.OfTok::'.ctor'()
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
	IL_235d:  br IL_4fef

	IL_2362:  br IL_236c

	IL_2367:  br IL_236c

	IL_236c:  ldarg 1

	IL_2370:  nop 
	IL_2371:  nop 
	IL_2372:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2377:  ldstr "private"
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

	IL_239c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr::'.ctor'()
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
	IL_23df:  br IL_4fef

	IL_23e4:  br IL_23ee

	IL_23e9:  br IL_23ee

	IL_23ee:  ldarg 1

	IL_23f2:  nop 
	IL_23f3:  nop 
	IL_23f4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23f9:  ldstr "public"
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

	IL_241e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr::'.ctor'()
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
	IL_2461:  br IL_4fef

	IL_2466:  br IL_2470

	IL_246b:  br IL_2470

	IL_2470:  ldarg 1

	IL_2474:  nop 
	IL_2475:  nop 
	IL_2476:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_247b:  ldstr "initonly"
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

	IL_24a0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr::'.ctor'()
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
	IL_24e3:  br IL_4fef

	IL_24e8:  br IL_24f2

	IL_24ed:  br IL_24f2

	IL_24f2:  ldarg 1

	IL_24f6:  nop 
	IL_24f7:  nop 
	IL_24f8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24fd:  ldstr "static"
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

	IL_2522:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr::'.ctor'()
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
	IL_2565:  br IL_4fef

	IL_256a:  br IL_2574

	IL_256f:  br IL_2574

	IL_2574:  ldarg 1

	IL_2578:  nop 
	IL_2579:  nop 
	IL_257a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_257f:  ldstr "specialname"
	IL_2584:  call int32 string::Compare(string, string)
	IL_2589:  stloc 0

	IL_258d:  nop 
	IL_258e:  nop 
	IL_258f:  ldloc 0

	IL_2593:  nop 
	IL_2594:  nop 
	IL_2595:  ldc.i4 0
	IL_259a:  beq IL_25a4

	IL_259f:  br IL_25f1

	IL_25a4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr::'.ctor'()
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
	IL_25e1:  starg 1

	IL_25e5:  nop 
	IL_25e6:  nop 
	IL_25e7:  br IL_4fef

	IL_25ec:  br IL_25f6

	IL_25f1:  br IL_25f6

	IL_25f6:  ldarg 1

	IL_25fa:  nop 
	IL_25fb:  nop 
	IL_25fc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2601:  ldstr "hidebysig"
	IL_2606:  call int32 string::Compare(string, string)
	IL_260b:  stloc 0

	IL_260f:  nop 
	IL_2610:  nop 
	IL_2611:  ldloc 0

	IL_2615:  nop 
	IL_2616:  nop 
	IL_2617:  ldc.i4 0
	IL_261c:  beq IL_2626

	IL_2621:  br IL_2673

	IL_2626:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr::'.ctor'()
	IL_262b:  stloc 79

	IL_262f:  nop 
	IL_2630:  nop 
	IL_2631:  ldloc 79

	IL_2635:  nop 
	IL_2636:  nop 
	IL_2637:  ldarg 1

	IL_263b:  nop 
	IL_263c:  nop 
	IL_263d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2642:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2647:  ldloc 79

	IL_264b:  nop 
	IL_264c:  nop 
	IL_264d:  ldarg 1

	IL_2651:  nop 
	IL_2652:  nop 
	IL_2653:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2658:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_265d:  ldloc 79

	IL_2661:  nop 
	IL_2662:  nop 
	IL_2663:  starg 1

	IL_2667:  nop 
	IL_2668:  nop 
	IL_2669:  br IL_4fef

	IL_266e:  br IL_2678

	IL_2673:  br IL_2678

	IL_2678:  ldarg 1

	IL_267c:  nop 
	IL_267d:  nop 
	IL_267e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2683:  ldstr "virtual"
	IL_2688:  call int32 string::Compare(string, string)
	IL_268d:  stloc 0

	IL_2691:  nop 
	IL_2692:  nop 
	IL_2693:  ldloc 0

	IL_2697:  nop 
	IL_2698:  nop 
	IL_2699:  ldc.i4 0
	IL_269e:  beq IL_26a8

	IL_26a3:  br IL_26f5

	IL_26a8:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr::'.ctor'()
	IL_26ad:  stloc 80

	IL_26b1:  nop 
	IL_26b2:  nop 
	IL_26b3:  ldloc 80

	IL_26b7:  nop 
	IL_26b8:  nop 
	IL_26b9:  ldarg 1

	IL_26bd:  nop 
	IL_26be:  nop 
	IL_26bf:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_26c4:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_26c9:  ldloc 80

	IL_26cd:  nop 
	IL_26ce:  nop 
	IL_26cf:  ldarg 1

	IL_26d3:  nop 
	IL_26d4:  nop 
	IL_26d5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26da:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26df:  ldloc 80

	IL_26e3:  nop 
	IL_26e4:  nop 
	IL_26e5:  starg 1

	IL_26e9:  nop 
	IL_26ea:  nop 
	IL_26eb:  br IL_4fef

	IL_26f0:  br IL_26fa

	IL_26f5:  br IL_26fa

	IL_26fa:  ldarg 1

	IL_26fe:  nop 
	IL_26ff:  nop 
	IL_2700:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2705:  ldstr "auto"
	IL_270a:  call int32 string::Compare(string, string)
	IL_270f:  stloc 0

	IL_2713:  nop 
	IL_2714:  nop 
	IL_2715:  ldloc 0

	IL_2719:  nop 
	IL_271a:  nop 
	IL_271b:  ldc.i4 0
	IL_2720:  beq IL_272a

	IL_2725:  br IL_2777

	IL_272a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr::'.ctor'()
	IL_272f:  stloc 81

	IL_2733:  nop 
	IL_2734:  nop 
	IL_2735:  ldloc 81

	IL_2739:  nop 
	IL_273a:  nop 
	IL_273b:  ldarg 1

	IL_273f:  nop 
	IL_2740:  nop 
	IL_2741:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2746:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_274b:  ldloc 81

	IL_274f:  nop 
	IL_2750:  nop 
	IL_2751:  ldarg 1

	IL_2755:  nop 
	IL_2756:  nop 
	IL_2757:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_275c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2761:  ldloc 81

	IL_2765:  nop 
	IL_2766:  nop 
	IL_2767:  starg 1

	IL_276b:  nop 
	IL_276c:  nop 
	IL_276d:  br IL_4fef

	IL_2772:  br IL_277c

	IL_2777:  br IL_277c

	IL_277c:  ldarg 1

	IL_2780:  nop 
	IL_2781:  nop 
	IL_2782:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2787:  ldstr "autochar"
	IL_278c:  call int32 string::Compare(string, string)
	IL_2791:  stloc 0

	IL_2795:  nop 
	IL_2796:  nop 
	IL_2797:  ldloc 0

	IL_279b:  nop 
	IL_279c:  nop 
	IL_279d:  ldc.i4 0
	IL_27a2:  beq IL_27ac

	IL_27a7:  br IL_27f9

	IL_27ac:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr::'.ctor'()
	IL_27b1:  stloc 82

	IL_27b5:  nop 
	IL_27b6:  nop 
	IL_27b7:  ldloc 82

	IL_27bb:  nop 
	IL_27bc:  nop 
	IL_27bd:  ldarg 1

	IL_27c1:  nop 
	IL_27c2:  nop 
	IL_27c3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_27c8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_27cd:  ldloc 82

	IL_27d1:  nop 
	IL_27d2:  nop 
	IL_27d3:  ldarg 1

	IL_27d7:  nop 
	IL_27d8:  nop 
	IL_27d9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27de:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27e3:  ldloc 82

	IL_27e7:  nop 
	IL_27e8:  nop 
	IL_27e9:  starg 1

	IL_27ed:  nop 
	IL_27ee:  nop 
	IL_27ef:  br IL_4fef

	IL_27f4:  br IL_27fe

	IL_27f9:  br IL_27fe

	IL_27fe:  ldarg 1

	IL_2802:  nop 
	IL_2803:  nop 
	IL_2804:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2809:  ldstr "ansi"
	IL_280e:  call int32 string::Compare(string, string)
	IL_2813:  stloc 0

	IL_2817:  nop 
	IL_2818:  nop 
	IL_2819:  ldloc 0

	IL_281d:  nop 
	IL_281e:  nop 
	IL_281f:  ldc.i4 0
	IL_2824:  beq IL_282e

	IL_2829:  br IL_287b

	IL_282e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr::'.ctor'()
	IL_2833:  stloc 83

	IL_2837:  nop 
	IL_2838:  nop 
	IL_2839:  ldloc 83

	IL_283d:  nop 
	IL_283e:  nop 
	IL_283f:  ldarg 1

	IL_2843:  nop 
	IL_2844:  nop 
	IL_2845:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_284a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_284f:  ldloc 83

	IL_2853:  nop 
	IL_2854:  nop 
	IL_2855:  ldarg 1

	IL_2859:  nop 
	IL_285a:  nop 
	IL_285b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2860:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2865:  ldloc 83

	IL_2869:  nop 
	IL_286a:  nop 
	IL_286b:  starg 1

	IL_286f:  nop 
	IL_2870:  nop 
	IL_2871:  br IL_4fef

	IL_2876:  br IL_2880

	IL_287b:  br IL_2880

	IL_2880:  ldarg 1

	IL_2884:  nop 
	IL_2885:  nop 
	IL_2886:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_288b:  ldstr "beforefieldinit"
	IL_2890:  call int32 string::Compare(string, string)
	IL_2895:  stloc 0

	IL_2899:  nop 
	IL_289a:  nop 
	IL_289b:  ldloc 0

	IL_289f:  nop 
	IL_28a0:  nop 
	IL_28a1:  ldc.i4 0
	IL_28a6:  beq IL_28b0

	IL_28ab:  br IL_28fd

	IL_28b0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr::'.ctor'()
	IL_28b5:  stloc 84

	IL_28b9:  nop 
	IL_28ba:  nop 
	IL_28bb:  ldloc 84

	IL_28bf:  nop 
	IL_28c0:  nop 
	IL_28c1:  ldarg 1

	IL_28c5:  nop 
	IL_28c6:  nop 
	IL_28c7:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28cc:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28d1:  ldloc 84

	IL_28d5:  nop 
	IL_28d6:  nop 
	IL_28d7:  ldarg 1

	IL_28db:  nop 
	IL_28dc:  nop 
	IL_28dd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28e2:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28e7:  ldloc 84

	IL_28eb:  nop 
	IL_28ec:  nop 
	IL_28ed:  starg 1

	IL_28f1:  nop 
	IL_28f2:  nop 
	IL_28f3:  br IL_4fef

	IL_28f8:  br IL_2902

	IL_28fd:  br IL_2902

	IL_2902:  ldarg 1

	IL_2906:  nop 
	IL_2907:  nop 
	IL_2908:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_290d:  ldstr "string"
	IL_2912:  call int32 string::Compare(string, string)
	IL_2917:  stloc 0

	IL_291b:  nop 
	IL_291c:  nop 
	IL_291d:  ldloc 0

	IL_2921:  nop 
	IL_2922:  nop 
	IL_2923:  ldc.i4 0
	IL_2928:  beq IL_2932

	IL_292d:  br IL_2994

	IL_2932:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok::'.ctor'()
	IL_2937:  stloc 85

	IL_293b:  nop 
	IL_293c:  nop 
	IL_293d:  ldloc 85

	IL_2941:  nop 
	IL_2942:  nop 
	IL_2943:  ldarg 1

	IL_2947:  nop 
	IL_2948:  nop 
	IL_2949:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_294e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2953:  ldloc 85

	IL_2957:  nop 
	IL_2958:  nop 
	IL_2959:  ldarg 1

	IL_295d:  nop 
	IL_295e:  nop 
	IL_295f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2964:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2969:  ldloc 85

	IL_296d:  nop 
	IL_296e:  nop 
	IL_296f:  ldtoken [mscorlib]System.String
	IL_2974:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2979:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_297e:  ldloc 85

	IL_2982:  nop 
	IL_2983:  nop 
	IL_2984:  starg 1

	IL_2988:  nop 
	IL_2989:  nop 
	IL_298a:  br IL_4fef

	IL_298f:  br IL_2999

	IL_2994:  br IL_2999

	IL_2999:  ldarg 1

	IL_299d:  nop 
	IL_299e:  nop 
	IL_299f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29a4:  ldstr "void"
	IL_29a9:  call int32 string::Compare(string, string)
	IL_29ae:  stloc 0

	IL_29b2:  nop 
	IL_29b3:  nop 
	IL_29b4:  ldloc 0

	IL_29b8:  nop 
	IL_29b9:  nop 
	IL_29ba:  ldc.i4 0
	IL_29bf:  beq IL_29c9

	IL_29c4:  br IL_2a2b

	IL_29c9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok::'.ctor'()
	IL_29ce:  stloc 86

	IL_29d2:  nop 
	IL_29d3:  nop 
	IL_29d4:  ldloc 86

	IL_29d8:  nop 
	IL_29d9:  nop 
	IL_29da:  ldarg 1

	IL_29de:  nop 
	IL_29df:  nop 
	IL_29e0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29e5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29ea:  ldloc 86

	IL_29ee:  nop 
	IL_29ef:  nop 
	IL_29f0:  ldarg 1

	IL_29f4:  nop 
	IL_29f5:  nop 
	IL_29f6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29fb:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a00:  ldloc 86

	IL_2a04:  nop 
	IL_2a05:  nop 
	IL_2a06:  ldtoken [mscorlib]System.Void
	IL_2a0b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2a10:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2a15:  ldloc 86

	IL_2a19:  nop 
	IL_2a1a:  nop 
	IL_2a1b:  starg 1

	IL_2a1f:  nop 
	IL_2a20:  nop 
	IL_2a21:  br IL_4fef

	IL_2a26:  br IL_2a30

	IL_2a2b:  br IL_2a30

	IL_2a30:  ldarg 1

	IL_2a34:  nop 
	IL_2a35:  nop 
	IL_2a36:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a3b:  ldstr "decimal"
	IL_2a40:  call int32 string::Compare(string, string)
	IL_2a45:  stloc 0

	IL_2a49:  nop 
	IL_2a4a:  nop 
	IL_2a4b:  ldloc 0

	IL_2a4f:  nop 
	IL_2a50:  nop 
	IL_2a51:  ldc.i4 0
	IL_2a56:  beq IL_2a60

	IL_2a5b:  br IL_2ac2

	IL_2a60:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok::'.ctor'()
	IL_2a65:  stloc 87

	IL_2a69:  nop 
	IL_2a6a:  nop 
	IL_2a6b:  ldloc 87

	IL_2a6f:  nop 
	IL_2a70:  nop 
	IL_2a71:  ldarg 1

	IL_2a75:  nop 
	IL_2a76:  nop 
	IL_2a77:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a7c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a81:  ldloc 87

	IL_2a85:  nop 
	IL_2a86:  nop 
	IL_2a87:  ldarg 1

	IL_2a8b:  nop 
	IL_2a8c:  nop 
	IL_2a8d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a92:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a97:  ldloc 87

	IL_2a9b:  nop 
	IL_2a9c:  nop 
	IL_2a9d:  ldtoken [mscorlib]System.Decimal
	IL_2aa2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2aa7:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2aac:  ldloc 87

	IL_2ab0:  nop 
	IL_2ab1:  nop 
	IL_2ab2:  starg 1

	IL_2ab6:  nop 
	IL_2ab7:  nop 
	IL_2ab8:  br IL_4fef

	IL_2abd:  br IL_2ac7

	IL_2ac2:  br IL_2ac7

	IL_2ac7:  ldarg 1

	IL_2acb:  nop 
	IL_2acc:  nop 
	IL_2acd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ad2:  ldstr "integer"
	IL_2ad7:  call int32 string::Compare(string, string)
	IL_2adc:  stloc 0

	IL_2ae0:  nop 
	IL_2ae1:  nop 
	IL_2ae2:  ldloc 0

	IL_2ae6:  nop 
	IL_2ae7:  nop 
	IL_2ae8:  ldc.i4 0
	IL_2aed:  beq IL_2af7

	IL_2af2:  br IL_2b59

	IL_2af7:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok::'.ctor'()
	IL_2afc:  stloc 88

	IL_2b00:  nop 
	IL_2b01:  nop 
	IL_2b02:  ldloc 88

	IL_2b06:  nop 
	IL_2b07:  nop 
	IL_2b08:  ldarg 1

	IL_2b0c:  nop 
	IL_2b0d:  nop 
	IL_2b0e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b13:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b18:  ldloc 88

	IL_2b1c:  nop 
	IL_2b1d:  nop 
	IL_2b1e:  ldarg 1

	IL_2b22:  nop 
	IL_2b23:  nop 
	IL_2b24:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b29:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b2e:  ldloc 88

	IL_2b32:  nop 
	IL_2b33:  nop 
	IL_2b34:  ldtoken [mscorlib]System.Int32
	IL_2b39:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2b3e:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2b43:  ldloc 88

	IL_2b47:  nop 
	IL_2b48:  nop 
	IL_2b49:  starg 1

	IL_2b4d:  nop 
	IL_2b4e:  nop 
	IL_2b4f:  br IL_4fef

	IL_2b54:  br IL_2b5e

	IL_2b59:  br IL_2b5e

	IL_2b5e:  ldarg 1

	IL_2b62:  nop 
	IL_2b63:  nop 
	IL_2b64:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b69:  ldstr "intptr"
	IL_2b6e:  call int32 string::Compare(string, string)
	IL_2b73:  stloc 0

	IL_2b77:  nop 
	IL_2b78:  nop 
	IL_2b79:  ldloc 0

	IL_2b7d:  nop 
	IL_2b7e:  nop 
	IL_2b7f:  ldc.i4 0
	IL_2b84:  beq IL_2b8e

	IL_2b89:  br IL_2bf0

	IL_2b8e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok::'.ctor'()
	IL_2b93:  stloc 89

	IL_2b97:  nop 
	IL_2b98:  nop 
	IL_2b99:  ldloc 89

	IL_2b9d:  nop 
	IL_2b9e:  nop 
	IL_2b9f:  ldarg 1

	IL_2ba3:  nop 
	IL_2ba4:  nop 
	IL_2ba5:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2baa:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2baf:  ldloc 89

	IL_2bb3:  nop 
	IL_2bb4:  nop 
	IL_2bb5:  ldarg 1

	IL_2bb9:  nop 
	IL_2bba:  nop 
	IL_2bbb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bc0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bc5:  ldloc 89

	IL_2bc9:  nop 
	IL_2bca:  nop 
	IL_2bcb:  ldtoken [mscorlib]System.IntPtr
	IL_2bd0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2bd5:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2bda:  ldloc 89

	IL_2bde:  nop 
	IL_2bdf:  nop 
	IL_2be0:  starg 1

	IL_2be4:  nop 
	IL_2be5:  nop 
	IL_2be6:  br IL_4fef

	IL_2beb:  br IL_2bf5

	IL_2bf0:  br IL_2bf5

	IL_2bf5:  ldarg 1

	IL_2bf9:  nop 
	IL_2bfa:  nop 
	IL_2bfb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c00:  ldstr "uinteger"
	IL_2c05:  call int32 string::Compare(string, string)
	IL_2c0a:  stloc 0

	IL_2c0e:  nop 
	IL_2c0f:  nop 
	IL_2c10:  ldloc 0

	IL_2c14:  nop 
	IL_2c15:  nop 
	IL_2c16:  ldc.i4 0
	IL_2c1b:  beq IL_2c25

	IL_2c20:  br IL_2c87

	IL_2c25:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok::'.ctor'()
	IL_2c2a:  stloc 90

	IL_2c2e:  nop 
	IL_2c2f:  nop 
	IL_2c30:  ldloc 90

	IL_2c34:  nop 
	IL_2c35:  nop 
	IL_2c36:  ldarg 1

	IL_2c3a:  nop 
	IL_2c3b:  nop 
	IL_2c3c:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c41:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c46:  ldloc 90

	IL_2c4a:  nop 
	IL_2c4b:  nop 
	IL_2c4c:  ldarg 1

	IL_2c50:  nop 
	IL_2c51:  nop 
	IL_2c52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c57:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c5c:  ldloc 90

	IL_2c60:  nop 
	IL_2c61:  nop 
	IL_2c62:  ldtoken [mscorlib]System.UInt32
	IL_2c67:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2c6c:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2c71:  ldloc 90

	IL_2c75:  nop 
	IL_2c76:  nop 
	IL_2c77:  starg 1

	IL_2c7b:  nop 
	IL_2c7c:  nop 
	IL_2c7d:  br IL_4fef

	IL_2c82:  br IL_2c8c

	IL_2c87:  br IL_2c8c

	IL_2c8c:  ldarg 1

	IL_2c90:  nop 
	IL_2c91:  nop 
	IL_2c92:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c97:  ldstr "double"
	IL_2c9c:  call int32 string::Compare(string, string)
	IL_2ca1:  stloc 0

	IL_2ca5:  nop 
	IL_2ca6:  nop 
	IL_2ca7:  ldloc 0

	IL_2cab:  nop 
	IL_2cac:  nop 
	IL_2cad:  ldc.i4 0
	IL_2cb2:  beq IL_2cbc

	IL_2cb7:  br IL_2d1e

	IL_2cbc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok::'.ctor'()
	IL_2cc1:  stloc 91

	IL_2cc5:  nop 
	IL_2cc6:  nop 
	IL_2cc7:  ldloc 91

	IL_2ccb:  nop 
	IL_2ccc:  nop 
	IL_2ccd:  ldarg 1

	IL_2cd1:  nop 
	IL_2cd2:  nop 
	IL_2cd3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2cd8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2cdd:  ldloc 91

	IL_2ce1:  nop 
	IL_2ce2:  nop 
	IL_2ce3:  ldarg 1

	IL_2ce7:  nop 
	IL_2ce8:  nop 
	IL_2ce9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2cee:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2cf3:  ldloc 91

	IL_2cf7:  nop 
	IL_2cf8:  nop 
	IL_2cf9:  ldtoken [mscorlib]System.Double
	IL_2cfe:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2d03:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2d08:  ldloc 91

	IL_2d0c:  nop 
	IL_2d0d:  nop 
	IL_2d0e:  starg 1

	IL_2d12:  nop 
	IL_2d13:  nop 
	IL_2d14:  br IL_4fef

	IL_2d19:  br IL_2d23

	IL_2d1e:  br IL_2d23

	IL_2d23:  ldarg 1

	IL_2d27:  nop 
	IL_2d28:  nop 
	IL_2d29:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d2e:  ldstr "boolean"
	IL_2d33:  call int32 string::Compare(string, string)
	IL_2d38:  stloc 0

	IL_2d3c:  nop 
	IL_2d3d:  nop 
	IL_2d3e:  ldloc 0

	IL_2d42:  nop 
	IL_2d43:  nop 
	IL_2d44:  ldc.i4 0
	IL_2d49:  beq IL_2d53

	IL_2d4e:  br IL_2db5

	IL_2d53:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok::'.ctor'()
	IL_2d58:  stloc 92

	IL_2d5c:  nop 
	IL_2d5d:  nop 
	IL_2d5e:  ldloc 92

	IL_2d62:  nop 
	IL_2d63:  nop 
	IL_2d64:  ldarg 1

	IL_2d68:  nop 
	IL_2d69:  nop 
	IL_2d6a:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d6f:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d74:  ldloc 92

	IL_2d78:  nop 
	IL_2d79:  nop 
	IL_2d7a:  ldarg 1

	IL_2d7e:  nop 
	IL_2d7f:  nop 
	IL_2d80:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d85:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d8a:  ldloc 92

	IL_2d8e:  nop 
	IL_2d8f:  nop 
	IL_2d90:  ldtoken [mscorlib]System.Boolean
	IL_2d95:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2d9a:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2d9f:  ldloc 92

	IL_2da3:  nop 
	IL_2da4:  nop 
	IL_2da5:  starg 1

	IL_2da9:  nop 
	IL_2daa:  nop 
	IL_2dab:  br IL_4fef

	IL_2db0:  br IL_2dba

	IL_2db5:  br IL_2dba

	IL_2dba:  ldarg 1

	IL_2dbe:  nop 
	IL_2dbf:  nop 
	IL_2dc0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2dc5:  ldstr "char"
	IL_2dca:  call int32 string::Compare(string, string)
	IL_2dcf:  stloc 0

	IL_2dd3:  nop 
	IL_2dd4:  nop 
	IL_2dd5:  ldloc 0

	IL_2dd9:  nop 
	IL_2dda:  nop 
	IL_2ddb:  ldc.i4 0
	IL_2de0:  beq IL_2dea

	IL_2de5:  br IL_2e4c

	IL_2dea:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok::'.ctor'()
	IL_2def:  stloc 93

	IL_2df3:  nop 
	IL_2df4:  nop 
	IL_2df5:  ldloc 93

	IL_2df9:  nop 
	IL_2dfa:  nop 
	IL_2dfb:  ldarg 1

	IL_2dff:  nop 
	IL_2e00:  nop 
	IL_2e01:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e06:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e0b:  ldloc 93

	IL_2e0f:  nop 
	IL_2e10:  nop 
	IL_2e11:  ldarg 1

	IL_2e15:  nop 
	IL_2e16:  nop 
	IL_2e17:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e1c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e21:  ldloc 93

	IL_2e25:  nop 
	IL_2e26:  nop 
	IL_2e27:  ldtoken [mscorlib]System.Char
	IL_2e2c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2e31:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2e36:  ldloc 93

	IL_2e3a:  nop 
	IL_2e3b:  nop 
	IL_2e3c:  starg 1

	IL_2e40:  nop 
	IL_2e41:  nop 
	IL_2e42:  br IL_4fef

	IL_2e47:  br IL_2e51

	IL_2e4c:  br IL_2e51

	IL_2e51:  ldarg 1

	IL_2e55:  nop 
	IL_2e56:  nop 
	IL_2e57:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e5c:  ldstr "single"
	IL_2e61:  call int32 string::Compare(string, string)
	IL_2e66:  stloc 0

	IL_2e6a:  nop 
	IL_2e6b:  nop 
	IL_2e6c:  ldloc 0

	IL_2e70:  nop 
	IL_2e71:  nop 
	IL_2e72:  ldc.i4 0
	IL_2e77:  beq IL_2e81

	IL_2e7c:  br IL_2ee3

	IL_2e81:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok::'.ctor'()
	IL_2e86:  stloc 94

	IL_2e8a:  nop 
	IL_2e8b:  nop 
	IL_2e8c:  ldloc 94

	IL_2e90:  nop 
	IL_2e91:  nop 
	IL_2e92:  ldarg 1

	IL_2e96:  nop 
	IL_2e97:  nop 
	IL_2e98:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e9d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ea2:  ldloc 94

	IL_2ea6:  nop 
	IL_2ea7:  nop 
	IL_2ea8:  ldarg 1

	IL_2eac:  nop 
	IL_2ead:  nop 
	IL_2eae:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2eb3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2eb8:  ldloc 94

	IL_2ebc:  nop 
	IL_2ebd:  nop 
	IL_2ebe:  ldtoken [mscorlib]System.Single
	IL_2ec3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2ec8:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2ecd:  ldloc 94

	IL_2ed1:  nop 
	IL_2ed2:  nop 
	IL_2ed3:  starg 1

	IL_2ed7:  nop 
	IL_2ed8:  nop 
	IL_2ed9:  br IL_4fef

	IL_2ede:  br IL_2ee8

	IL_2ee3:  br IL_2ee8

	IL_2ee8:  ldarg 1

	IL_2eec:  nop 
	IL_2eed:  nop 
	IL_2eee:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ef3:  ldstr "sbyte"
	IL_2ef8:  call int32 string::Compare(string, string)
	IL_2efd:  stloc 0

	IL_2f01:  nop 
	IL_2f02:  nop 
	IL_2f03:  ldloc 0

	IL_2f07:  nop 
	IL_2f08:  nop 
	IL_2f09:  ldc.i4 0
	IL_2f0e:  beq IL_2f18

	IL_2f13:  br IL_2f7a

	IL_2f18:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok::'.ctor'()
	IL_2f1d:  stloc 95

	IL_2f21:  nop 
	IL_2f22:  nop 
	IL_2f23:  ldloc 95

	IL_2f27:  nop 
	IL_2f28:  nop 
	IL_2f29:  ldarg 1

	IL_2f2d:  nop 
	IL_2f2e:  nop 
	IL_2f2f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f34:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f39:  ldloc 95

	IL_2f3d:  nop 
	IL_2f3e:  nop 
	IL_2f3f:  ldarg 1

	IL_2f43:  nop 
	IL_2f44:  nop 
	IL_2f45:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f4a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f4f:  ldloc 95

	IL_2f53:  nop 
	IL_2f54:  nop 
	IL_2f55:  ldtoken [mscorlib]System.SByte
	IL_2f5a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2f5f:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2f64:  ldloc 95

	IL_2f68:  nop 
	IL_2f69:  nop 
	IL_2f6a:  starg 1

	IL_2f6e:  nop 
	IL_2f6f:  nop 
	IL_2f70:  br IL_4fef

	IL_2f75:  br IL_2f7f

	IL_2f7a:  br IL_2f7f

	IL_2f7f:  ldarg 1

	IL_2f83:  nop 
	IL_2f84:  nop 
	IL_2f85:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f8a:  ldstr "byte"
	IL_2f8f:  call int32 string::Compare(string, string)
	IL_2f94:  stloc 0

	IL_2f98:  nop 
	IL_2f99:  nop 
	IL_2f9a:  ldloc 0

	IL_2f9e:  nop 
	IL_2f9f:  nop 
	IL_2fa0:  ldc.i4 0
	IL_2fa5:  beq IL_2faf

	IL_2faa:  br IL_3011

	IL_2faf:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok::'.ctor'()
	IL_2fb4:  stloc 96

	IL_2fb8:  nop 
	IL_2fb9:  nop 
	IL_2fba:  ldloc 96

	IL_2fbe:  nop 
	IL_2fbf:  nop 
	IL_2fc0:  ldarg 1

	IL_2fc4:  nop 
	IL_2fc5:  nop 
	IL_2fc6:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fcb:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fd0:  ldloc 96

	IL_2fd4:  nop 
	IL_2fd5:  nop 
	IL_2fd6:  ldarg 1

	IL_2fda:  nop 
	IL_2fdb:  nop 
	IL_2fdc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fe1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fe6:  ldloc 96

	IL_2fea:  nop 
	IL_2feb:  nop 
	IL_2fec:  ldtoken [mscorlib]System.Byte
	IL_2ff1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2ff6:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2ffb:  ldloc 96

	IL_2fff:  nop 
	IL_3000:  nop 
	IL_3001:  starg 1

	IL_3005:  nop 
	IL_3006:  nop 
	IL_3007:  br IL_4fef

	IL_300c:  br IL_3016

	IL_3011:  br IL_3016

	IL_3016:  ldarg 1

	IL_301a:  nop 
	IL_301b:  nop 
	IL_301c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3021:  ldstr "short"
	IL_3026:  call int32 string::Compare(string, string)
	IL_302b:  stloc 0

	IL_302f:  nop 
	IL_3030:  nop 
	IL_3031:  ldloc 0

	IL_3035:  nop 
	IL_3036:  nop 
	IL_3037:  ldc.i4 0
	IL_303c:  beq IL_3046

	IL_3041:  br IL_30a8

	IL_3046:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok::'.ctor'()
	IL_304b:  stloc 97

	IL_304f:  nop 
	IL_3050:  nop 
	IL_3051:  ldloc 97

	IL_3055:  nop 
	IL_3056:  nop 
	IL_3057:  ldarg 1

	IL_305b:  nop 
	IL_305c:  nop 
	IL_305d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3062:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3067:  ldloc 97

	IL_306b:  nop 
	IL_306c:  nop 
	IL_306d:  ldarg 1

	IL_3071:  nop 
	IL_3072:  nop 
	IL_3073:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3078:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_307d:  ldloc 97

	IL_3081:  nop 
	IL_3082:  nop 
	IL_3083:  ldtoken [mscorlib]System.Int16
	IL_3088:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_308d:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3092:  ldloc 97

	IL_3096:  nop 
	IL_3097:  nop 
	IL_3098:  starg 1

	IL_309c:  nop 
	IL_309d:  nop 
	IL_309e:  br IL_4fef

	IL_30a3:  br IL_30ad

	IL_30a8:  br IL_30ad

	IL_30ad:  ldarg 1

	IL_30b1:  nop 
	IL_30b2:  nop 
	IL_30b3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30b8:  ldstr "ushort"
	IL_30bd:  call int32 string::Compare(string, string)
	IL_30c2:  stloc 0

	IL_30c6:  nop 
	IL_30c7:  nop 
	IL_30c8:  ldloc 0

	IL_30cc:  nop 
	IL_30cd:  nop 
	IL_30ce:  ldc.i4 0
	IL_30d3:  beq IL_30dd

	IL_30d8:  br IL_313f

	IL_30dd:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok::'.ctor'()
	IL_30e2:  stloc 98

	IL_30e6:  nop 
	IL_30e7:  nop 
	IL_30e8:  ldloc 98

	IL_30ec:  nop 
	IL_30ed:  nop 
	IL_30ee:  ldarg 1

	IL_30f2:  nop 
	IL_30f3:  nop 
	IL_30f4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30f9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30fe:  ldloc 98

	IL_3102:  nop 
	IL_3103:  nop 
	IL_3104:  ldarg 1

	IL_3108:  nop 
	IL_3109:  nop 
	IL_310a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_310f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3114:  ldloc 98

	IL_3118:  nop 
	IL_3119:  nop 
	IL_311a:  ldtoken [mscorlib]System.UInt16
	IL_311f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3124:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3129:  ldloc 98

	IL_312d:  nop 
	IL_312e:  nop 
	IL_312f:  starg 1

	IL_3133:  nop 
	IL_3134:  nop 
	IL_3135:  br IL_4fef

	IL_313a:  br IL_3144

	IL_313f:  br IL_3144

	IL_3144:  ldarg 1

	IL_3148:  nop 
	IL_3149:  nop 
	IL_314a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_314f:  ldstr "long"
	IL_3154:  call int32 string::Compare(string, string)
	IL_3159:  stloc 0

	IL_315d:  nop 
	IL_315e:  nop 
	IL_315f:  ldloc 0

	IL_3163:  nop 
	IL_3164:  nop 
	IL_3165:  ldc.i4 0
	IL_316a:  beq IL_3174

	IL_316f:  br IL_31d6

	IL_3174:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok::'.ctor'()
	IL_3179:  stloc 99

	IL_317d:  nop 
	IL_317e:  nop 
	IL_317f:  ldloc 99

	IL_3183:  nop 
	IL_3184:  nop 
	IL_3185:  ldarg 1

	IL_3189:  nop 
	IL_318a:  nop 
	IL_318b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3190:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3195:  ldloc 99

	IL_3199:  nop 
	IL_319a:  nop 
	IL_319b:  ldarg 1

	IL_319f:  nop 
	IL_31a0:  nop 
	IL_31a1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31a6:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31ab:  ldloc 99

	IL_31af:  nop 
	IL_31b0:  nop 
	IL_31b1:  ldtoken [mscorlib]System.Int64
	IL_31b6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_31bb:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_31c0:  ldloc 99

	IL_31c4:  nop 
	IL_31c5:  nop 
	IL_31c6:  starg 1

	IL_31ca:  nop 
	IL_31cb:  nop 
	IL_31cc:  br IL_4fef

	IL_31d1:  br IL_31db

	IL_31d6:  br IL_31db

	IL_31db:  ldarg 1

	IL_31df:  nop 
	IL_31e0:  nop 
	IL_31e1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31e6:  ldstr "ulong"
	IL_31eb:  call int32 string::Compare(string, string)
	IL_31f0:  stloc 0

	IL_31f4:  nop 
	IL_31f5:  nop 
	IL_31f6:  ldloc 0

	IL_31fa:  nop 
	IL_31fb:  nop 
	IL_31fc:  ldc.i4 0
	IL_3201:  beq IL_320b

	IL_3206:  br IL_326d

	IL_320b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok::'.ctor'()
	IL_3210:  stloc 100

	IL_3214:  nop 
	IL_3215:  nop 
	IL_3216:  ldloc 100

	IL_321a:  nop 
	IL_321b:  nop 
	IL_321c:  ldarg 1

	IL_3220:  nop 
	IL_3221:  nop 
	IL_3222:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3227:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_322c:  ldloc 100

	IL_3230:  nop 
	IL_3231:  nop 
	IL_3232:  ldarg 1

	IL_3236:  nop 
	IL_3237:  nop 
	IL_3238:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_323d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3242:  ldloc 100

	IL_3246:  nop 
	IL_3247:  nop 
	IL_3248:  ldtoken [mscorlib]System.UInt64
	IL_324d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_3252:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_3257:  ldloc 100

	IL_325b:  nop 
	IL_325c:  nop 
	IL_325d:  starg 1

	IL_3261:  nop 
	IL_3262:  nop 
	IL_3263:  br IL_4fef

	IL_3268:  br IL_3272

	IL_326d:  br IL_3272

	IL_3272:  ldarg 1

	IL_3276:  nop 
	IL_3277:  nop 
	IL_3278:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_327d:  ldstr "object"
	IL_3282:  call int32 string::Compare(string, string)
	IL_3287:  stloc 0

	IL_328b:  nop 
	IL_328c:  nop 
	IL_328d:  ldloc 0

	IL_3291:  nop 
	IL_3292:  nop 
	IL_3293:  ldc.i4 0
	IL_3298:  beq IL_32a2

	IL_329d:  br IL_3304

	IL_32a2:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_32a7:  stloc 101

	IL_32ab:  nop 
	IL_32ac:  nop 
	IL_32ad:  ldloc 101

	IL_32b1:  nop 
	IL_32b2:  nop 
	IL_32b3:  ldarg 1

	IL_32b7:  nop 
	IL_32b8:  nop 
	IL_32b9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_32be:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_32c3:  ldloc 101

	IL_32c7:  nop 
	IL_32c8:  nop 
	IL_32c9:  ldarg 1

	IL_32cd:  nop 
	IL_32ce:  nop 
	IL_32cf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_32d4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_32d9:  ldloc 101

	IL_32dd:  nop 
	IL_32de:  nop 
	IL_32df:  ldtoken [mscorlib]System.Object
	IL_32e4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_32e9:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_32ee:  ldloc 101

	IL_32f2:  nop 
	IL_32f3:  nop 
	IL_32f4:  starg 1

	IL_32f8:  nop 
	IL_32f9:  nop 
	IL_32fa:  br IL_4fef

	IL_32ff:  br IL_3309

	IL_3304:  br IL_3309

	IL_3309:  ldarg 1

	IL_330d:  nop 
	IL_330e:  nop 
	IL_330f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3314:  ldstr "^//(.)*$"
	IL_3319:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_331e:  stloc 1

	IL_3322:  nop 
	IL_3323:  nop 
	IL_3324:  ldloc 1

	IL_3328:  nop 
	IL_3329:  nop 
	IL_332a:  ldc.i4 1
	IL_332f:  beq IL_3339

	IL_3334:  br IL_3390

	IL_3339:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok::'.ctor'()
	IL_333e:  stloc 102

	IL_3342:  nop 
	IL_3343:  nop 
	IL_3344:  ldloc 102

	IL_3348:  nop 
	IL_3349:  nop 
	IL_334a:  ldarg 1

	IL_334e:  nop 
	IL_334f:  nop 
	IL_3350:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3355:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_335a:  ldloc 102

	IL_335e:  nop 
	IL_335f:  nop 
	IL_3360:  ldarg 1

	IL_3364:  nop 
	IL_3365:  nop 
	IL_3366:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_336b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3370:  ldloc 102

	IL_3374:  nop 
	IL_3375:  nop 
	IL_3376:  starg 1

	IL_337a:  nop 
	IL_337b:  nop 
	IL_337c:  ldc.i4 1
	IL_3381:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_3386:  br IL_4fef

	IL_338b:  br IL_3395

	IL_3390:  br IL_3395

	IL_3395:  ldarg 1

	IL_3399:  nop 
	IL_339a:  nop 
	IL_339b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33a0:  ldstr "null"
	IL_33a5:  call int32 string::Compare(string, string)
	IL_33aa:  stloc 0

	IL_33ae:  nop 
	IL_33af:  nop 
	IL_33b0:  ldloc 0

	IL_33b4:  nop 
	IL_33b5:  nop 
	IL_33b6:  ldc.i4 0
	IL_33bb:  beq IL_33c5

	IL_33c0:  br IL_3412

	IL_33c5:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::'.ctor'()
	IL_33ca:  stloc 103

	IL_33ce:  nop 
	IL_33cf:  nop 
	IL_33d0:  ldloc 103

	IL_33d4:  nop 
	IL_33d5:  nop 
	IL_33d6:  ldarg 1

	IL_33da:  nop 
	IL_33db:  nop 
	IL_33dc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_33e1:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_33e6:  ldloc 103

	IL_33ea:  nop 
	IL_33eb:  nop 
	IL_33ec:  ldarg 1

	IL_33f0:  nop 
	IL_33f1:  nop 
	IL_33f2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33f7:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33fc:  ldloc 103

	IL_3400:  nop 
	IL_3401:  nop 
	IL_3402:  starg 1

	IL_3406:  nop 
	IL_3407:  nop 
	IL_3408:  br IL_4fef

	IL_340d:  br IL_3417

	IL_3412:  br IL_3417

	IL_3417:  ldarg 1

	IL_341b:  nop 
	IL_341c:  nop 
	IL_341d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3422:  ldstr "true"
	IL_3427:  call int32 string::Compare(string, string)
	IL_342c:  stloc 0

	IL_3430:  nop 
	IL_3431:  nop 
	IL_3432:  ldloc 0

	IL_3436:  nop 
	IL_3437:  nop 
	IL_3438:  ldc.i4 0
	IL_343d:  beq IL_3447

	IL_3442:  br IL_3457

	IL_3447:  ldc.i4 1
	IL_344c:  stloc 1

	IL_3450:  nop 
	IL_3451:  nop 
	IL_3452:  br IL_345c

	IL_3457:  br IL_345c

	IL_345c:  ldloc 1

	IL_3460:  nop 
	IL_3461:  nop 
	IL_3462:  stloc 4

	IL_3466:  nop 
	IL_3467:  nop 
	IL_3468:  ldarg 1

	IL_346c:  nop 
	IL_346d:  nop 
	IL_346e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3473:  ldstr "false"
	IL_3478:  call int32 string::Compare(string, string)
	IL_347d:  stloc 0

	IL_3481:  nop 
	IL_3482:  nop 
	IL_3483:  ldloc 0

	IL_3487:  nop 
	IL_3488:  nop 
	IL_3489:  ldc.i4 0
	IL_348e:  beq IL_3498

	IL_3493:  br IL_34a8

	IL_3498:  ldc.i4 1
	IL_349d:  stloc 1

	IL_34a1:  nop 
	IL_34a2:  nop 
	IL_34a3:  br IL_34ad

	IL_34a8:  br IL_34ad

	IL_34ad:  ldloc 4

	IL_34b1:  nop 
	IL_34b2:  nop 
	IL_34b3:  ldloc 1

	IL_34b7:  nop 
	IL_34b8:  nop 
	IL_34b9:  or 
	IL_34ba:  stloc 4

	IL_34be:  nop 
	IL_34bf:  nop 
	IL_34c0:  ldloc 1

	IL_34c4:  nop 
	IL_34c5:  nop 
	IL_34c6:  ldc.i4 1
	IL_34cb:  beq IL_34d5

	IL_34d0:  br IL_35b6

	IL_34d5:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::'.ctor'()
	IL_34da:  stloc 104

	IL_34de:  nop 
	IL_34df:  nop 
	IL_34e0:  ldloc 104

	IL_34e4:  nop 
	IL_34e5:  nop 
	IL_34e6:  ldarg 1

	IL_34ea:  nop 
	IL_34eb:  nop 
	IL_34ec:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_34f1:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_34f6:  ldloc 104

	IL_34fa:  nop 
	IL_34fb:  nop 
	IL_34fc:  ldarg 1

	IL_3500:  nop 
	IL_3501:  nop 
	IL_3502:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3507:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_350c:  ldarg 1

	IL_3510:  nop 
	IL_3511:  nop 
	IL_3512:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3517:  ldstr "true"
	IL_351c:  call int32 string::Compare(string, string)
	IL_3521:  stloc 0

	IL_3525:  nop 
	IL_3526:  nop 
	IL_3527:  ldloc 0

	IL_352b:  nop 
	IL_352c:  nop 
	IL_352d:  ldc.i4 0
	IL_3532:  beq IL_353c

	IL_3537:  br IL_3551

	IL_353c:  ldloc 104

	IL_3540:  nop 
	IL_3541:  nop 
	IL_3542:  ldc.i4 1
	IL_3547:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_354c:  br IL_3556

	IL_3551:  br IL_3556

	IL_3556:  ldarg 1

	IL_355a:  nop 
	IL_355b:  nop 
	IL_355c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3561:  ldstr "false"
	IL_3566:  call int32 string::Compare(string, string)
	IL_356b:  stloc 0

	IL_356f:  nop 
	IL_3570:  nop 
	IL_3571:  ldloc 0

	IL_3575:  nop 
	IL_3576:  nop 
	IL_3577:  ldc.i4 0
	IL_357c:  beq IL_3586

	IL_3581:  br IL_359b

	IL_3586:  ldloc 104

	IL_358a:  nop 
	IL_358b:  nop 
	IL_358c:  ldc.i4 0
	IL_3591:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_3596:  br IL_35a0

	IL_359b:  br IL_35a0

	IL_35a0:  ldloc 104

	IL_35a4:  nop 
	IL_35a5:  nop 
	IL_35a6:  starg 1

	IL_35aa:  nop 
	IL_35ab:  nop 
	IL_35ac:  br IL_4fef

	IL_35b1:  br IL_35bb

	IL_35b6:  br IL_35bb

	IL_35bb:  ldarg 1

	IL_35bf:  nop 
	IL_35c0:  nop 
	IL_35c1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_35c6:  ldstr "^'(.)*'$"
	IL_35cb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_35d0:  stloc 1

	IL_35d4:  nop 
	IL_35d5:  nop 
	IL_35d6:  ldloc 1

	IL_35da:  nop 
	IL_35db:  nop 
	IL_35dc:  ldc.i4 1
	IL_35e1:  beq IL_35eb

	IL_35e6:  br IL_36a2

	IL_35eb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::'.ctor'()
	IL_35f0:  stloc 105

	IL_35f4:  nop 
	IL_35f5:  nop 
	IL_35f6:  ldloc 105

	IL_35fa:  nop 
	IL_35fb:  nop 
	IL_35fc:  ldarg 1

	IL_3600:  nop 
	IL_3601:  nop 
	IL_3602:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3607:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_360c:  ldarg 1

	IL_3610:  nop 
	IL_3611:  nop 
	IL_3612:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3617:  stloc 2

	IL_361b:  nop 
	IL_361c:  nop 
	IL_361d:  ldc.i4 1
	IL_3622:  conv.u 
	IL_3623:  newarr [mscorlib]System.Char
	IL_3628:  stloc 3

	IL_362c:  nop 
	IL_362d:  nop 
	IL_362e:  ldloc 3

	IL_3632:  nop 
	IL_3633:  nop 
	IL_3634:  ldc.i4 0
	IL_3639:  conv.u 
	IL_363a:  ldstr "'"
	IL_363f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3644:  stelem [mscorlib]System.Char
	IL_3649:  ldloc 2

	IL_364d:  nop 
	IL_364e:  nop 
	IL_364f:  ldloc 3

	IL_3653:  nop 
	IL_3654:  nop 
	IL_3655:  callvirt instance string string::Trim(char[])
	IL_365a:  stloc 2

	IL_365e:  nop 
	IL_365f:  nop 
	IL_3660:  ldloc 105

	IL_3664:  nop 
	IL_3665:  nop 
	IL_3666:  ldloc 2

	IL_366a:  nop 
	IL_366b:  nop 
	IL_366c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3671:  ldloc 105

	IL_3675:  nop 
	IL_3676:  nop 
	IL_3677:  ldloc 105

	IL_367b:  nop 
	IL_367c:  nop 
	IL_367d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3682:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3687:  stfld char [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_368c:  ldloc 105

	IL_3690:  nop 
	IL_3691:  nop 
	IL_3692:  starg 1

	IL_3696:  nop 
	IL_3697:  nop 
	IL_3698:  br IL_4fef

	IL_369d:  br IL_36a7

	IL_36a2:  br IL_36a7

	IL_36a7:  ldstr "^"
	IL_36ac:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_36b1:  ldstr "(.)*"
	IL_36b6:  call string string::Concat(string, string, string)
	IL_36bb:  stloc 2

	IL_36bf:  nop 
	IL_36c0:  nop 
	IL_36c1:  ldloc 2

	IL_36c5:  nop 
	IL_36c6:  nop 
	IL_36c7:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_36cc:  ldstr "$"
	IL_36d1:  call string string::Concat(string, string, string)
	IL_36d6:  stloc 2

	IL_36da:  nop 
	IL_36db:  nop 
	IL_36dc:  ldarg 1

	IL_36e0:  nop 
	IL_36e1:  nop 
	IL_36e2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_36e7:  ldloc 2

	IL_36eb:  nop 
	IL_36ec:  nop 
	IL_36ed:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_36f2:  stloc 1

	IL_36f6:  nop 
	IL_36f7:  nop 
	IL_36f8:  ldloc 1

	IL_36fc:  nop 
	IL_36fd:  nop 
	IL_36fe:  ldc.i4 1
	IL_3703:  beq IL_370d

	IL_3708:  br IL_37a9

	IL_370d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::'.ctor'()
	IL_3712:  stloc 106

	IL_3716:  nop 
	IL_3717:  nop 
	IL_3718:  ldloc 106

	IL_371c:  nop 
	IL_371d:  nop 
	IL_371e:  ldarg 1

	IL_3722:  nop 
	IL_3723:  nop 
	IL_3724:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3729:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_372e:  ldarg 1

	IL_3732:  nop 
	IL_3733:  nop 
	IL_3734:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3739:  stloc 2

	IL_373d:  nop 
	IL_373e:  nop 
	IL_373f:  ldc.i4 1
	IL_3744:  conv.u 
	IL_3745:  newarr [mscorlib]System.Char
	IL_374a:  stloc 3

	IL_374e:  nop 
	IL_374f:  nop 
	IL_3750:  ldloc 3

	IL_3754:  nop 
	IL_3755:  nop 
	IL_3756:  ldc.i4 0
	IL_375b:  conv.u 
	IL_375c:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_3761:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3766:  stelem [mscorlib]System.Char
	IL_376b:  ldloc 2

	IL_376f:  nop 
	IL_3770:  nop 
	IL_3771:  ldloc 3

	IL_3775:  nop 
	IL_3776:  nop 
	IL_3777:  callvirt instance string string::Trim(char[])
	IL_377c:  stloc 2

	IL_3780:  nop 
	IL_3781:  nop 
	IL_3782:  ldloc 106

	IL_3786:  nop 
	IL_3787:  nop 
	IL_3788:  ldloc 2

	IL_378c:  nop 
	IL_378d:  nop 
	IL_378e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3793:  ldloc 106

	IL_3797:  nop 
	IL_3798:  nop 
	IL_3799:  starg 1

	IL_379d:  nop 
	IL_379e:  nop 
	IL_379f:  br IL_4fef

	IL_37a4:  br IL_37ae

	IL_37a9:  br IL_37ae

	IL_37ae:  ldarg 1

	IL_37b2:  nop 
	IL_37b3:  nop 
	IL_37b4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37b9:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_37be:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_37c3:  stloc 1

	IL_37c7:  nop 
	IL_37c8:  nop 
	IL_37c9:  ldloc 1

	IL_37cd:  nop 
	IL_37ce:  nop 
	IL_37cf:  stloc 4

	IL_37d3:  nop 
	IL_37d4:  nop 
	IL_37d5:  ldarg 1

	IL_37d9:  nop 
	IL_37da:  nop 
	IL_37db:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37e0:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_37e5:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_37ea:  stloc 1

	IL_37ee:  nop 
	IL_37ef:  nop 
	IL_37f0:  ldloc 4

	IL_37f4:  nop 
	IL_37f5:  nop 
	IL_37f6:  ldloc 1

	IL_37fa:  nop 
	IL_37fb:  nop 
	IL_37fc:  or 
	IL_37fd:  stloc 4

	IL_3801:  nop 
	IL_3802:  nop 
	IL_3803:  ldarg 1

	IL_3807:  nop 
	IL_3808:  nop 
	IL_3809:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_380e:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3813:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3818:  stloc 1

	IL_381c:  nop 
	IL_381d:  nop 
	IL_381e:  ldloc 4

	IL_3822:  nop 
	IL_3823:  nop 
	IL_3824:  ldloc 1

	IL_3828:  nop 
	IL_3829:  nop 
	IL_382a:  or 
	IL_382b:  stloc 4

	IL_382f:  nop 
	IL_3830:  nop 
	IL_3831:  ldarg 1

	IL_3835:  nop 
	IL_3836:  nop 
	IL_3837:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_383c:  stloc 2

	IL_3840:  nop 
	IL_3841:  nop 
	IL_3842:  ldloc 2

	IL_3846:  nop 
	IL_3847:  nop 
	IL_3848:  ldstr "d"
	IL_384d:  callvirt instance bool string::EndsWith(string)
	IL_3852:  stloc 1

	IL_3856:  nop 
	IL_3857:  nop 
	IL_3858:  ldloc 4

	IL_385c:  nop 
	IL_385d:  nop 
	IL_385e:  ldloc 1

	IL_3862:  nop 
	IL_3863:  nop 
	IL_3864:  and 
	IL_3865:  stloc 4

	IL_3869:  nop 
	IL_386a:  nop 
	IL_386b:  ldloc 4

	IL_386f:  nop 
	IL_3870:  nop 
	IL_3871:  ldc.i4 1
	IL_3876:  beq IL_3880

	IL_387b:  br IL_3937

	IL_3880:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3885:  stloc 107

	IL_3889:  nop 
	IL_388a:  nop 
	IL_388b:  ldloc 107

	IL_388f:  nop 
	IL_3890:  nop 
	IL_3891:  ldarg 1

	IL_3895:  nop 
	IL_3896:  nop 
	IL_3897:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_389c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_38a1:  ldarg 1

	IL_38a5:  nop 
	IL_38a6:  nop 
	IL_38a7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_38ac:  stloc 2

	IL_38b0:  nop 
	IL_38b1:  nop 
	IL_38b2:  ldc.i4 1
	IL_38b7:  conv.u 
	IL_38b8:  newarr [mscorlib]System.Char
	IL_38bd:  stloc 3

	IL_38c1:  nop 
	IL_38c2:  nop 
	IL_38c3:  ldloc 3

	IL_38c7:  nop 
	IL_38c8:  nop 
	IL_38c9:  ldc.i4 0
	IL_38ce:  conv.u 
	IL_38cf:  ldstr "d"
	IL_38d4:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_38d9:  stelem [mscorlib]System.Char
	IL_38de:  ldloc 2

	IL_38e2:  nop 
	IL_38e3:  nop 
	IL_38e4:  ldloc 3

	IL_38e8:  nop 
	IL_38e9:  nop 
	IL_38ea:  callvirt instance string string::TrimEnd(char[])
	IL_38ef:  stloc 2

	IL_38f3:  nop 
	IL_38f4:  nop 
	IL_38f5:  ldloc 107

	IL_38f9:  nop 
	IL_38fa:  nop 
	IL_38fb:  ldloc 2

	IL_38ff:  nop 
	IL_3900:  nop 
	IL_3901:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3906:  ldloc 107

	IL_390a:  nop 
	IL_390b:  nop 
	IL_390c:  ldloc 107

	IL_3910:  nop 
	IL_3911:  nop 
	IL_3912:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3917:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_391c:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3921:  ldloc 107

	IL_3925:  nop 
	IL_3926:  nop 
	IL_3927:  starg 1

	IL_392b:  nop 
	IL_392c:  nop 
	IL_392d:  br IL_4fef

	IL_3932:  br IL_393c

	IL_3937:  br IL_393c

	IL_393c:  ldarg 1

	IL_3940:  nop 
	IL_3941:  nop 
	IL_3942:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3947:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_394c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3951:  stloc 1

	IL_3955:  nop 
	IL_3956:  nop 
	IL_3957:  ldloc 1

	IL_395b:  nop 
	IL_395c:  nop 
	IL_395d:  stloc 4

	IL_3961:  nop 
	IL_3962:  nop 
	IL_3963:  ldarg 1

	IL_3967:  nop 
	IL_3968:  nop 
	IL_3969:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_396e:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3973:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3978:  stloc 1

	IL_397c:  nop 
	IL_397d:  nop 
	IL_397e:  ldloc 4

	IL_3982:  nop 
	IL_3983:  nop 
	IL_3984:  ldloc 1

	IL_3988:  nop 
	IL_3989:  nop 
	IL_398a:  or 
	IL_398b:  stloc 4

	IL_398f:  nop 
	IL_3990:  nop 
	IL_3991:  ldarg 1

	IL_3995:  nop 
	IL_3996:  nop 
	IL_3997:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_399c:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_39a1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_39a6:  stloc 1

	IL_39aa:  nop 
	IL_39ab:  nop 
	IL_39ac:  ldloc 4

	IL_39b0:  nop 
	IL_39b1:  nop 
	IL_39b2:  ldloc 1

	IL_39b6:  nop 
	IL_39b7:  nop 
	IL_39b8:  or 
	IL_39b9:  stloc 4

	IL_39bd:  nop 
	IL_39be:  nop 
	IL_39bf:  ldarg 1

	IL_39c3:  nop 
	IL_39c4:  nop 
	IL_39c5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39ca:  stloc 2

	IL_39ce:  nop 
	IL_39cf:  nop 
	IL_39d0:  ldloc 2

	IL_39d4:  nop 
	IL_39d5:  nop 
	IL_39d6:  ldstr "f"
	IL_39db:  callvirt instance bool string::EndsWith(string)
	IL_39e0:  stloc 1

	IL_39e4:  nop 
	IL_39e5:  nop 
	IL_39e6:  ldloc 4

	IL_39ea:  nop 
	IL_39eb:  nop 
	IL_39ec:  ldloc 1

	IL_39f0:  nop 
	IL_39f1:  nop 
	IL_39f2:  and 
	IL_39f3:  stloc 4

	IL_39f7:  nop 
	IL_39f8:  nop 
	IL_39f9:  ldloc 4

	IL_39fd:  nop 
	IL_39fe:  nop 
	IL_39ff:  ldc.i4 1
	IL_3a04:  beq IL_3a0e

	IL_3a09:  br IL_3ac5

	IL_3a0e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_3a13:  stloc 108

	IL_3a17:  nop 
	IL_3a18:  nop 
	IL_3a19:  ldloc 108

	IL_3a1d:  nop 
	IL_3a1e:  nop 
	IL_3a1f:  ldarg 1

	IL_3a23:  nop 
	IL_3a24:  nop 
	IL_3a25:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3a2a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3a2f:  ldarg 1

	IL_3a33:  nop 
	IL_3a34:  nop 
	IL_3a35:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a3a:  stloc 2

	IL_3a3e:  nop 
	IL_3a3f:  nop 
	IL_3a40:  ldc.i4 1
	IL_3a45:  conv.u 
	IL_3a46:  newarr [mscorlib]System.Char
	IL_3a4b:  stloc 3

	IL_3a4f:  nop 
	IL_3a50:  nop 
	IL_3a51:  ldloc 3

	IL_3a55:  nop 
	IL_3a56:  nop 
	IL_3a57:  ldc.i4 0
	IL_3a5c:  conv.u 
	IL_3a5d:  ldstr "f"
	IL_3a62:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3a67:  stelem [mscorlib]System.Char
	IL_3a6c:  ldloc 2

	IL_3a70:  nop 
	IL_3a71:  nop 
	IL_3a72:  ldloc 3

	IL_3a76:  nop 
	IL_3a77:  nop 
	IL_3a78:  callvirt instance string string::TrimEnd(char[])
	IL_3a7d:  stloc 2

	IL_3a81:  nop 
	IL_3a82:  nop 
	IL_3a83:  ldloc 108

	IL_3a87:  nop 
	IL_3a88:  nop 
	IL_3a89:  ldloc 2

	IL_3a8d:  nop 
	IL_3a8e:  nop 
	IL_3a8f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a94:  ldloc 108

	IL_3a98:  nop 
	IL_3a99:  nop 
	IL_3a9a:  ldloc 108

	IL_3a9e:  nop 
	IL_3a9f:  nop 
	IL_3aa0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3aa5:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_3aaa:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_3aaf:  ldloc 108

	IL_3ab3:  nop 
	IL_3ab4:  nop 
	IL_3ab5:  starg 1

	IL_3ab9:  nop 
	IL_3aba:  nop 
	IL_3abb:  br IL_4fef

	IL_3ac0:  br IL_3aca

	IL_3ac5:  br IL_3aca

	IL_3aca:  ldarg 1

	IL_3ace:  nop 
	IL_3acf:  nop 
	IL_3ad0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ad5:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_3ada:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3adf:  stloc 1

	IL_3ae3:  nop 
	IL_3ae4:  nop 
	IL_3ae5:  ldloc 1

	IL_3ae9:  nop 
	IL_3aea:  nop 
	IL_3aeb:  stloc 4

	IL_3aef:  nop 
	IL_3af0:  nop 
	IL_3af1:  ldarg 1

	IL_3af5:  nop 
	IL_3af6:  nop 
	IL_3af7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3afc:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3b01:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b06:  stloc 1

	IL_3b0a:  nop 
	IL_3b0b:  nop 
	IL_3b0c:  ldloc 4

	IL_3b10:  nop 
	IL_3b11:  nop 
	IL_3b12:  ldloc 1

	IL_3b16:  nop 
	IL_3b17:  nop 
	IL_3b18:  or 
	IL_3b19:  stloc 4

	IL_3b1d:  nop 
	IL_3b1e:  nop 
	IL_3b1f:  ldarg 1

	IL_3b23:  nop 
	IL_3b24:  nop 
	IL_3b25:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b2a:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3b2f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b34:  stloc 1

	IL_3b38:  nop 
	IL_3b39:  nop 
	IL_3b3a:  ldloc 4

	IL_3b3e:  nop 
	IL_3b3f:  nop 
	IL_3b40:  ldloc 1

	IL_3b44:  nop 
	IL_3b45:  nop 
	IL_3b46:  or 
	IL_3b47:  stloc 4

	IL_3b4b:  nop 
	IL_3b4c:  nop 
	IL_3b4d:  ldloc 4

	IL_3b51:  nop 
	IL_3b52:  nop 
	IL_3b53:  ldc.i4 1
	IL_3b58:  beq IL_3b62

	IL_3b5d:  br IL_3bd6

	IL_3b62:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3b67:  stloc 109

	IL_3b6b:  nop 
	IL_3b6c:  nop 
	IL_3b6d:  ldloc 109

	IL_3b71:  nop 
	IL_3b72:  nop 
	IL_3b73:  ldarg 1

	IL_3b77:  nop 
	IL_3b78:  nop 
	IL_3b79:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3b7e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3b83:  ldarg 1

	IL_3b87:  nop 
	IL_3b88:  nop 
	IL_3b89:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b8e:  stloc 2

	IL_3b92:  nop 
	IL_3b93:  nop 
	IL_3b94:  ldloc 109

	IL_3b98:  nop 
	IL_3b99:  nop 
	IL_3b9a:  ldloc 2

	IL_3b9e:  nop 
	IL_3b9f:  nop 
	IL_3ba0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ba5:  ldloc 109

	IL_3ba9:  nop 
	IL_3baa:  nop 
	IL_3bab:  ldloc 109

	IL_3baf:  nop 
	IL_3bb0:  nop 
	IL_3bb1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3bb6:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_3bbb:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3bc0:  ldloc 109

	IL_3bc4:  nop 
	IL_3bc5:  nop 
	IL_3bc6:  starg 1

	IL_3bca:  nop 
	IL_3bcb:  nop 
	IL_3bcc:  br IL_4fef

	IL_3bd1:  br IL_3bdb

	IL_3bd6:  br IL_3bdb

	IL_3bdb:  ldarg 1

	IL_3bdf:  nop 
	IL_3be0:  nop 
	IL_3be1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3be6:  ldstr "^(\\d)+(.)*$"
	IL_3beb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3bf0:  stloc 1

	IL_3bf4:  nop 
	IL_3bf5:  nop 
	IL_3bf6:  ldloc 1

	IL_3bfa:  nop 
	IL_3bfb:  nop 
	IL_3bfc:  stloc 4

	IL_3c00:  nop 
	IL_3c01:  nop 
	IL_3c02:  ldarg 1

	IL_3c06:  nop 
	IL_3c07:  nop 
	IL_3c08:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c0d:  ldstr "^\\+(\\d)+(.)*$"
	IL_3c12:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3c17:  stloc 1

	IL_3c1b:  nop 
	IL_3c1c:  nop 
	IL_3c1d:  ldloc 4

	IL_3c21:  nop 
	IL_3c22:  nop 
	IL_3c23:  ldloc 1

	IL_3c27:  nop 
	IL_3c28:  nop 
	IL_3c29:  or 
	IL_3c2a:  stloc 4

	IL_3c2e:  nop 
	IL_3c2f:  nop 
	IL_3c30:  ldarg 1

	IL_3c34:  nop 
	IL_3c35:  nop 
	IL_3c36:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c3b:  ldstr "^-(\\d)+(.)*$"
	IL_3c40:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3c45:  stloc 1

	IL_3c49:  nop 
	IL_3c4a:  nop 
	IL_3c4b:  ldloc 4

	IL_3c4f:  nop 
	IL_3c50:  nop 
	IL_3c51:  ldloc 1

	IL_3c55:  nop 
	IL_3c56:  nop 
	IL_3c57:  or 
	IL_3c58:  stloc 4

	IL_3c5c:  nop 
	IL_3c5d:  nop 
	IL_3c5e:  ldarg 1

	IL_3c62:  nop 
	IL_3c63:  nop 
	IL_3c64:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c69:  stloc 2

	IL_3c6d:  nop 
	IL_3c6e:  nop 
	IL_3c6f:  ldloc 2

	IL_3c73:  nop 
	IL_3c74:  nop 
	IL_3c75:  ldstr "d"
	IL_3c7a:  callvirt instance bool string::EndsWith(string)
	IL_3c7f:  stloc 1

	IL_3c83:  nop 
	IL_3c84:  nop 
	IL_3c85:  ldloc 4

	IL_3c89:  nop 
	IL_3c8a:  nop 
	IL_3c8b:  ldloc 1

	IL_3c8f:  nop 
	IL_3c90:  nop 
	IL_3c91:  and 
	IL_3c92:  stloc 4

	IL_3c96:  nop 
	IL_3c97:  nop 
	IL_3c98:  ldloc 4

	IL_3c9c:  nop 
	IL_3c9d:  nop 
	IL_3c9e:  ldc.i4 1
	IL_3ca3:  beq IL_3cad

	IL_3ca8:  br IL_3d64

	IL_3cad:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3cb2:  stloc 110

	IL_3cb6:  nop 
	IL_3cb7:  nop 
	IL_3cb8:  ldloc 110

	IL_3cbc:  nop 
	IL_3cbd:  nop 
	IL_3cbe:  ldarg 1

	IL_3cc2:  nop 
	IL_3cc3:  nop 
	IL_3cc4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3cc9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3cce:  ldarg 1

	IL_3cd2:  nop 
	IL_3cd3:  nop 
	IL_3cd4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3cd9:  stloc 2

	IL_3cdd:  nop 
	IL_3cde:  nop 
	IL_3cdf:  ldc.i4 1
	IL_3ce4:  conv.u 
	IL_3ce5:  newarr [mscorlib]System.Char
	IL_3cea:  stloc 3

	IL_3cee:  nop 
	IL_3cef:  nop 
	IL_3cf0:  ldloc 3

	IL_3cf4:  nop 
	IL_3cf5:  nop 
	IL_3cf6:  ldc.i4 0
	IL_3cfb:  conv.u 
	IL_3cfc:  ldstr "d"
	IL_3d01:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3d06:  stelem [mscorlib]System.Char
	IL_3d0b:  ldloc 2

	IL_3d0f:  nop 
	IL_3d10:  nop 
	IL_3d11:  ldloc 3

	IL_3d15:  nop 
	IL_3d16:  nop 
	IL_3d17:  callvirt instance string string::TrimEnd(char[])
	IL_3d1c:  stloc 2

	IL_3d20:  nop 
	IL_3d21:  nop 
	IL_3d22:  ldloc 110

	IL_3d26:  nop 
	IL_3d27:  nop 
	IL_3d28:  ldloc 2

	IL_3d2c:  nop 
	IL_3d2d:  nop 
	IL_3d2e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d33:  ldloc 110

	IL_3d37:  nop 
	IL_3d38:  nop 
	IL_3d39:  ldloc 110

	IL_3d3d:  nop 
	IL_3d3e:  nop 
	IL_3d3f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d44:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_3d49:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3d4e:  ldloc 110

	IL_3d52:  nop 
	IL_3d53:  nop 
	IL_3d54:  starg 1

	IL_3d58:  nop 
	IL_3d59:  nop 
	IL_3d5a:  br IL_4fef

	IL_3d5f:  br IL_3d69

	IL_3d64:  br IL_3d69

	IL_3d69:  ldarg 1

	IL_3d6d:  nop 
	IL_3d6e:  nop 
	IL_3d6f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d74:  ldstr "^(\\d)+(.)*$"
	IL_3d79:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3d7e:  stloc 1

	IL_3d82:  nop 
	IL_3d83:  nop 
	IL_3d84:  ldloc 1

	IL_3d88:  nop 
	IL_3d89:  nop 
	IL_3d8a:  stloc 4

	IL_3d8e:  nop 
	IL_3d8f:  nop 
	IL_3d90:  ldarg 1

	IL_3d94:  nop 
	IL_3d95:  nop 
	IL_3d96:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d9b:  ldstr "^\\+(\\d)+(.)*$"
	IL_3da0:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3da5:  stloc 1

	IL_3da9:  nop 
	IL_3daa:  nop 
	IL_3dab:  ldloc 4

	IL_3daf:  nop 
	IL_3db0:  nop 
	IL_3db1:  ldloc 1

	IL_3db5:  nop 
	IL_3db6:  nop 
	IL_3db7:  or 
	IL_3db8:  stloc 4

	IL_3dbc:  nop 
	IL_3dbd:  nop 
	IL_3dbe:  ldarg 1

	IL_3dc2:  nop 
	IL_3dc3:  nop 
	IL_3dc4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3dc9:  ldstr "^-(\\d)+(.)*$"
	IL_3dce:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3dd3:  stloc 1

	IL_3dd7:  nop 
	IL_3dd8:  nop 
	IL_3dd9:  ldloc 4

	IL_3ddd:  nop 
	IL_3dde:  nop 
	IL_3ddf:  ldloc 1

	IL_3de3:  nop 
	IL_3de4:  nop 
	IL_3de5:  or 
	IL_3de6:  stloc 4

	IL_3dea:  nop 
	IL_3deb:  nop 
	IL_3dec:  ldarg 1

	IL_3df0:  nop 
	IL_3df1:  nop 
	IL_3df2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3df7:  stloc 2

	IL_3dfb:  nop 
	IL_3dfc:  nop 
	IL_3dfd:  ldloc 2

	IL_3e01:  nop 
	IL_3e02:  nop 
	IL_3e03:  ldstr "f"
	IL_3e08:  callvirt instance bool string::EndsWith(string)
	IL_3e0d:  stloc 1

	IL_3e11:  nop 
	IL_3e12:  nop 
	IL_3e13:  ldloc 4

	IL_3e17:  nop 
	IL_3e18:  nop 
	IL_3e19:  ldloc 1

	IL_3e1d:  nop 
	IL_3e1e:  nop 
	IL_3e1f:  and 
	IL_3e20:  stloc 4

	IL_3e24:  nop 
	IL_3e25:  nop 
	IL_3e26:  ldloc 4

	IL_3e2a:  nop 
	IL_3e2b:  nop 
	IL_3e2c:  ldc.i4 1
	IL_3e31:  beq IL_3e3b

	IL_3e36:  br IL_3ef2

	IL_3e3b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_3e40:  stloc 111

	IL_3e44:  nop 
	IL_3e45:  nop 
	IL_3e46:  ldloc 111

	IL_3e4a:  nop 
	IL_3e4b:  nop 
	IL_3e4c:  ldarg 1

	IL_3e50:  nop 
	IL_3e51:  nop 
	IL_3e52:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3e57:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3e5c:  ldarg 1

	IL_3e60:  nop 
	IL_3e61:  nop 
	IL_3e62:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e67:  stloc 2

	IL_3e6b:  nop 
	IL_3e6c:  nop 
	IL_3e6d:  ldc.i4 1
	IL_3e72:  conv.u 
	IL_3e73:  newarr [mscorlib]System.Char
	IL_3e78:  stloc 3

	IL_3e7c:  nop 
	IL_3e7d:  nop 
	IL_3e7e:  ldloc 3

	IL_3e82:  nop 
	IL_3e83:  nop 
	IL_3e84:  ldc.i4 0
	IL_3e89:  conv.u 
	IL_3e8a:  ldstr "f"
	IL_3e8f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3e94:  stelem [mscorlib]System.Char
	IL_3e99:  ldloc 2

	IL_3e9d:  nop 
	IL_3e9e:  nop 
	IL_3e9f:  ldloc 3

	IL_3ea3:  nop 
	IL_3ea4:  nop 
	IL_3ea5:  callvirt instance string string::TrimEnd(char[])
	IL_3eaa:  stloc 2

	IL_3eae:  nop 
	IL_3eaf:  nop 
	IL_3eb0:  ldloc 111

	IL_3eb4:  nop 
	IL_3eb5:  nop 
	IL_3eb6:  ldloc 2

	IL_3eba:  nop 
	IL_3ebb:  nop 
	IL_3ebc:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ec1:  ldloc 111

	IL_3ec5:  nop 
	IL_3ec6:  nop 
	IL_3ec7:  ldloc 111

	IL_3ecb:  nop 
	IL_3ecc:  nop 
	IL_3ecd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ed2:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_3ed7:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_3edc:  ldloc 111

	IL_3ee0:  nop 
	IL_3ee1:  nop 
	IL_3ee2:  starg 1

	IL_3ee6:  nop 
	IL_3ee7:  nop 
	IL_3ee8:  br IL_4fef

	IL_3eed:  br IL_3ef7

	IL_3ef2:  br IL_3ef7

	IL_3ef7:  ldarg 1

	IL_3efb:  nop 
	IL_3efc:  nop 
	IL_3efd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f02:  ldstr "^(\\d)+(.)*$"
	IL_3f07:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3f0c:  stloc 1

	IL_3f10:  nop 
	IL_3f11:  nop 
	IL_3f12:  ldloc 1

	IL_3f16:  nop 
	IL_3f17:  nop 
	IL_3f18:  stloc 4

	IL_3f1c:  nop 
	IL_3f1d:  nop 
	IL_3f1e:  ldarg 1

	IL_3f22:  nop 
	IL_3f23:  nop 
	IL_3f24:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f29:  ldstr "^\\+(\\d)+(.)*$"
	IL_3f2e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3f33:  stloc 1

	IL_3f37:  nop 
	IL_3f38:  nop 
	IL_3f39:  ldloc 4

	IL_3f3d:  nop 
	IL_3f3e:  nop 
	IL_3f3f:  ldloc 1

	IL_3f43:  nop 
	IL_3f44:  nop 
	IL_3f45:  or 
	IL_3f46:  stloc 4

	IL_3f4a:  nop 
	IL_3f4b:  nop 
	IL_3f4c:  ldarg 1

	IL_3f50:  nop 
	IL_3f51:  nop 
	IL_3f52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f57:  ldstr "^-(\\d)+(.)*$"
	IL_3f5c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3f61:  stloc 1

	IL_3f65:  nop 
	IL_3f66:  nop 
	IL_3f67:  ldloc 4

	IL_3f6b:  nop 
	IL_3f6c:  nop 
	IL_3f6d:  ldloc 1

	IL_3f71:  nop 
	IL_3f72:  nop 
	IL_3f73:  or 
	IL_3f74:  stloc 4

	IL_3f78:  nop 
	IL_3f79:  nop 
	IL_3f7a:  ldarg 1

	IL_3f7e:  nop 
	IL_3f7f:  nop 
	IL_3f80:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f85:  stloc 2

	IL_3f89:  nop 
	IL_3f8a:  nop 
	IL_3f8b:  ldloc 2

	IL_3f8f:  nop 
	IL_3f90:  nop 
	IL_3f91:  ldstr "ui"
	IL_3f96:  callvirt instance bool string::EndsWith(string)
	IL_3f9b:  stloc 1

	IL_3f9f:  nop 
	IL_3fa0:  nop 
	IL_3fa1:  ldloc 4

	IL_3fa5:  nop 
	IL_3fa6:  nop 
	IL_3fa7:  ldloc 1

	IL_3fab:  nop 
	IL_3fac:  nop 
	IL_3fad:  and 
	IL_3fae:  stloc 4

	IL_3fb2:  nop 
	IL_3fb3:  nop 
	IL_3fb4:  ldloc 4

	IL_3fb8:  nop 
	IL_3fb9:  nop 
	IL_3fba:  ldc.i4 1
	IL_3fbf:  beq IL_3fc9

	IL_3fc4:  br IL_40b2

	IL_3fc9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::'.ctor'()
	IL_3fce:  stloc 112

	IL_3fd2:  nop 
	IL_3fd3:  nop 
	IL_3fd4:  ldloc 112

	IL_3fd8:  nop 
	IL_3fd9:  nop 
	IL_3fda:  ldarg 1

	IL_3fde:  nop 
	IL_3fdf:  nop 
	IL_3fe0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3fe5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3fea:  ldarg 1

	IL_3fee:  nop 
	IL_3fef:  nop 
	IL_3ff0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ff5:  stloc 2

	IL_3ff9:  nop 
	IL_3ffa:  nop 
	IL_3ffb:  ldc.i4 1
	IL_4000:  conv.u 
	IL_4001:  newarr [mscorlib]System.Char
	IL_4006:  stloc 3

	IL_400a:  nop 
	IL_400b:  nop 
	IL_400c:  ldloc 3

	IL_4010:  nop 
	IL_4011:  nop 
	IL_4012:  ldc.i4 0
	IL_4017:  conv.u 
	IL_4018:  ldstr "i"
	IL_401d:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4022:  stelem [mscorlib]System.Char
	IL_4027:  ldloc 2

	IL_402b:  nop 
	IL_402c:  nop 
	IL_402d:  ldloc 3

	IL_4031:  nop 
	IL_4032:  nop 
	IL_4033:  callvirt instance string string::TrimEnd(char[])
	IL_4038:  stloc 2

	IL_403c:  nop 
	IL_403d:  nop 
	IL_403e:  ldloc 3

	IL_4042:  nop 
	IL_4043:  nop 
	IL_4044:  ldc.i4 0
	IL_4049:  conv.u 
	IL_404a:  ldstr "u"
	IL_404f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4054:  stelem [mscorlib]System.Char
	IL_4059:  ldloc 2

	IL_405d:  nop 
	IL_405e:  nop 
	IL_405f:  ldloc 3

	IL_4063:  nop 
	IL_4064:  nop 
	IL_4065:  callvirt instance string string::TrimEnd(char[])
	IL_406a:  stloc 2

	IL_406e:  nop 
	IL_406f:  nop 
	IL_4070:  ldloc 112

	IL_4074:  nop 
	IL_4075:  nop 
	IL_4076:  ldloc 2

	IL_407a:  nop 
	IL_407b:  nop 
	IL_407c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4081:  ldloc 112

	IL_4085:  nop 
	IL_4086:  nop 
	IL_4087:  ldloc 112

	IL_408b:  nop 
	IL_408c:  nop 
	IL_408d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4092:  call unsigned int32 class [mscorlib]System.Convert::ToUInt32(string)
	IL_4097:  stfld unsigned int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::NumVal
	IL_409c:  ldloc 112

	IL_40a0:  nop 
	IL_40a1:  nop 
	IL_40a2:  starg 1

	IL_40a6:  nop 
	IL_40a7:  nop 
	IL_40a8:  br IL_4fef

	IL_40ad:  br IL_40b7

	IL_40b2:  br IL_40b7

	IL_40b7:  ldarg 1

	IL_40bb:  nop 
	IL_40bc:  nop 
	IL_40bd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40c2:  ldstr "^(\\d)+(.)*$"
	IL_40c7:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_40cc:  stloc 1

	IL_40d0:  nop 
	IL_40d1:  nop 
	IL_40d2:  ldloc 1

	IL_40d6:  nop 
	IL_40d7:  nop 
	IL_40d8:  stloc 4

	IL_40dc:  nop 
	IL_40dd:  nop 
	IL_40de:  ldarg 1

	IL_40e2:  nop 
	IL_40e3:  nop 
	IL_40e4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40e9:  ldstr "^\\+(\\d)+(.)*$"
	IL_40ee:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_40f3:  stloc 1

	IL_40f7:  nop 
	IL_40f8:  nop 
	IL_40f9:  ldloc 4

	IL_40fd:  nop 
	IL_40fe:  nop 
	IL_40ff:  ldloc 1

	IL_4103:  nop 
	IL_4104:  nop 
	IL_4105:  or 
	IL_4106:  stloc 4

	IL_410a:  nop 
	IL_410b:  nop 
	IL_410c:  ldarg 1

	IL_4110:  nop 
	IL_4111:  nop 
	IL_4112:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4117:  ldstr "^-(\\d)+(.)*$"
	IL_411c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4121:  stloc 1

	IL_4125:  nop 
	IL_4126:  nop 
	IL_4127:  ldloc 4

	IL_412b:  nop 
	IL_412c:  nop 
	IL_412d:  ldloc 1

	IL_4131:  nop 
	IL_4132:  nop 
	IL_4133:  or 
	IL_4134:  stloc 4

	IL_4138:  nop 
	IL_4139:  nop 
	IL_413a:  ldarg 1

	IL_413e:  nop 
	IL_413f:  nop 
	IL_4140:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4145:  stloc 2

	IL_4149:  nop 
	IL_414a:  nop 
	IL_414b:  ldloc 2

	IL_414f:  nop 
	IL_4150:  nop 
	IL_4151:  ldstr "ip"
	IL_4156:  callvirt instance bool string::EndsWith(string)
	IL_415b:  stloc 1

	IL_415f:  nop 
	IL_4160:  nop 
	IL_4161:  ldloc 4

	IL_4165:  nop 
	IL_4166:  nop 
	IL_4167:  ldloc 1

	IL_416b:  nop 
	IL_416c:  nop 
	IL_416d:  and 
	IL_416e:  stloc 4

	IL_4172:  nop 
	IL_4173:  nop 
	IL_4174:  ldloc 4

	IL_4178:  nop 
	IL_4179:  nop 
	IL_417a:  ldc.i4 1
	IL_417f:  beq IL_4189

	IL_4184:  br IL_4277

	IL_4189:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::'.ctor'()
	IL_418e:  stloc 113

	IL_4192:  nop 
	IL_4193:  nop 
	IL_4194:  ldloc 113

	IL_4198:  nop 
	IL_4199:  nop 
	IL_419a:  ldarg 1

	IL_419e:  nop 
	IL_419f:  nop 
	IL_41a0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_41a5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_41aa:  ldarg 1

	IL_41ae:  nop 
	IL_41af:  nop 
	IL_41b0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_41b5:  stloc 2

	IL_41b9:  nop 
	IL_41ba:  nop 
	IL_41bb:  ldc.i4 1
	IL_41c0:  conv.u 
	IL_41c1:  newarr [mscorlib]System.Char
	IL_41c6:  stloc 3

	IL_41ca:  nop 
	IL_41cb:  nop 
	IL_41cc:  ldloc 3

	IL_41d0:  nop 
	IL_41d1:  nop 
	IL_41d2:  ldc.i4 0
	IL_41d7:  conv.u 
	IL_41d8:  ldstr "p"
	IL_41dd:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_41e2:  stelem [mscorlib]System.Char
	IL_41e7:  ldloc 2

	IL_41eb:  nop 
	IL_41ec:  nop 
	IL_41ed:  ldloc 3

	IL_41f1:  nop 
	IL_41f2:  nop 
	IL_41f3:  callvirt instance string string::TrimEnd(char[])
	IL_41f8:  stloc 2

	IL_41fc:  nop 
	IL_41fd:  nop 
	IL_41fe:  ldloc 3

	IL_4202:  nop 
	IL_4203:  nop 
	IL_4204:  ldc.i4 0
	IL_4209:  conv.u 
	IL_420a:  ldstr "i"
	IL_420f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4214:  stelem [mscorlib]System.Char
	IL_4219:  ldloc 2

	IL_421d:  nop 
	IL_421e:  nop 
	IL_421f:  ldloc 3

	IL_4223:  nop 
	IL_4224:  nop 
	IL_4225:  callvirt instance string string::TrimEnd(char[])
	IL_422a:  stloc 2

	IL_422e:  nop 
	IL_422f:  nop 
	IL_4230:  ldloc 113

	IL_4234:  nop 
	IL_4235:  nop 
	IL_4236:  ldloc 2

	IL_423a:  nop 
	IL_423b:  nop 
	IL_423c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4241:  ldloc 113

	IL_4245:  nop 
	IL_4246:  nop 
	IL_4247:  ldloc 113

	IL_424b:  nop 
	IL_424c:  nop 
	IL_424d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4252:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_4257:  newobj instance void native int::'.ctor'(int32)
	IL_425c:  stfld native int [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::NumVal
	IL_4261:  ldloc 113

	IL_4265:  nop 
	IL_4266:  nop 
	IL_4267:  starg 1

	IL_426b:  nop 
	IL_426c:  nop 
	IL_426d:  br IL_4fef

	IL_4272:  br IL_427c

	IL_4277:  br IL_427c

	IL_427c:  ldarg 1

	IL_4280:  nop 
	IL_4281:  nop 
	IL_4282:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4287:  ldstr "^(\\d)+(.)*$"
	IL_428c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4291:  stloc 1

	IL_4295:  nop 
	IL_4296:  nop 
	IL_4297:  ldloc 1

	IL_429b:  nop 
	IL_429c:  nop 
	IL_429d:  stloc 4

	IL_42a1:  nop 
	IL_42a2:  nop 
	IL_42a3:  ldarg 1

	IL_42a7:  nop 
	IL_42a8:  nop 
	IL_42a9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42ae:  ldstr "^\\+(\\d)+(.)*$"
	IL_42b3:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_42b8:  stloc 1

	IL_42bc:  nop 
	IL_42bd:  nop 
	IL_42be:  ldloc 4

	IL_42c2:  nop 
	IL_42c3:  nop 
	IL_42c4:  ldloc 1

	IL_42c8:  nop 
	IL_42c9:  nop 
	IL_42ca:  or 
	IL_42cb:  stloc 4

	IL_42cf:  nop 
	IL_42d0:  nop 
	IL_42d1:  ldarg 1

	IL_42d5:  nop 
	IL_42d6:  nop 
	IL_42d7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42dc:  ldstr "^-(\\d)+(.)*$"
	IL_42e1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_42e6:  stloc 1

	IL_42ea:  nop 
	IL_42eb:  nop 
	IL_42ec:  ldloc 4

	IL_42f0:  nop 
	IL_42f1:  nop 
	IL_42f2:  ldloc 1

	IL_42f6:  nop 
	IL_42f7:  nop 
	IL_42f8:  or 
	IL_42f9:  stloc 4

	IL_42fd:  nop 
	IL_42fe:  nop 
	IL_42ff:  ldarg 1

	IL_4303:  nop 
	IL_4304:  nop 
	IL_4305:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_430a:  stloc 2

	IL_430e:  nop 
	IL_430f:  nop 
	IL_4310:  ldloc 2

	IL_4314:  nop 
	IL_4315:  nop 
	IL_4316:  ldstr "i"
	IL_431b:  callvirt instance bool string::EndsWith(string)
	IL_4320:  stloc 1

	IL_4324:  nop 
	IL_4325:  nop 
	IL_4326:  ldloc 4

	IL_432a:  nop 
	IL_432b:  nop 
	IL_432c:  ldloc 1

	IL_4330:  nop 
	IL_4331:  nop 
	IL_4332:  and 
	IL_4333:  stloc 4

	IL_4337:  nop 
	IL_4338:  nop 
	IL_4339:  ldloc 4

	IL_433d:  nop 
	IL_433e:  nop 
	IL_433f:  ldc.i4 1
	IL_4344:  beq IL_434e

	IL_4349:  br IL_4405

	IL_434e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_4353:  stloc 114

	IL_4357:  nop 
	IL_4358:  nop 
	IL_4359:  ldloc 114

	IL_435d:  nop 
	IL_435e:  nop 
	IL_435f:  ldarg 1

	IL_4363:  nop 
	IL_4364:  nop 
	IL_4365:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_436a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_436f:  ldarg 1

	IL_4373:  nop 
	IL_4374:  nop 
	IL_4375:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_437a:  stloc 2

	IL_437e:  nop 
	IL_437f:  nop 
	IL_4380:  ldc.i4 1
	IL_4385:  conv.u 
	IL_4386:  newarr [mscorlib]System.Char
	IL_438b:  stloc 3

	IL_438f:  nop 
	IL_4390:  nop 
	IL_4391:  ldloc 3

	IL_4395:  nop 
	IL_4396:  nop 
	IL_4397:  ldc.i4 0
	IL_439c:  conv.u 
	IL_439d:  ldstr "i"
	IL_43a2:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_43a7:  stelem [mscorlib]System.Char
	IL_43ac:  ldloc 2

	IL_43b0:  nop 
	IL_43b1:  nop 
	IL_43b2:  ldloc 3

	IL_43b6:  nop 
	IL_43b7:  nop 
	IL_43b8:  callvirt instance string string::TrimEnd(char[])
	IL_43bd:  stloc 2

	IL_43c1:  nop 
	IL_43c2:  nop 
	IL_43c3:  ldloc 114

	IL_43c7:  nop 
	IL_43c8:  nop 
	IL_43c9:  ldloc 2

	IL_43cd:  nop 
	IL_43ce:  nop 
	IL_43cf:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43d4:  ldloc 114

	IL_43d8:  nop 
	IL_43d9:  nop 
	IL_43da:  ldloc 114

	IL_43de:  nop 
	IL_43df:  nop 
	IL_43e0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43e5:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_43ea:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_43ef:  ldloc 114

	IL_43f3:  nop 
	IL_43f4:  nop 
	IL_43f5:  starg 1

	IL_43f9:  nop 
	IL_43fa:  nop 
	IL_43fb:  br IL_4fef

	IL_4400:  br IL_440a

	IL_4405:  br IL_440a

	IL_440a:  ldarg 1

	IL_440e:  nop 
	IL_440f:  nop 
	IL_4410:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4415:  ldstr "^(\\d)+(.)*$"
	IL_441a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_441f:  stloc 1

	IL_4423:  nop 
	IL_4424:  nop 
	IL_4425:  ldloc 1

	IL_4429:  nop 
	IL_442a:  nop 
	IL_442b:  stloc 4

	IL_442f:  nop 
	IL_4430:  nop 
	IL_4431:  ldarg 1

	IL_4435:  nop 
	IL_4436:  nop 
	IL_4437:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_443c:  ldstr "^\\+(\\d)+(.)*$"
	IL_4441:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4446:  stloc 1

	IL_444a:  nop 
	IL_444b:  nop 
	IL_444c:  ldloc 4

	IL_4450:  nop 
	IL_4451:  nop 
	IL_4452:  ldloc 1

	IL_4456:  nop 
	IL_4457:  nop 
	IL_4458:  or 
	IL_4459:  stloc 4

	IL_445d:  nop 
	IL_445e:  nop 
	IL_445f:  ldarg 1

	IL_4463:  nop 
	IL_4464:  nop 
	IL_4465:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_446a:  ldstr "^-(\\d)+(.)*$"
	IL_446f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4474:  stloc 1

	IL_4478:  nop 
	IL_4479:  nop 
	IL_447a:  ldloc 4

	IL_447e:  nop 
	IL_447f:  nop 
	IL_4480:  ldloc 1

	IL_4484:  nop 
	IL_4485:  nop 
	IL_4486:  or 
	IL_4487:  stloc 4

	IL_448b:  nop 
	IL_448c:  nop 
	IL_448d:  ldarg 1

	IL_4491:  nop 
	IL_4492:  nop 
	IL_4493:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4498:  stloc 2

	IL_449c:  nop 
	IL_449d:  nop 
	IL_449e:  ldloc 2

	IL_44a2:  nop 
	IL_44a3:  nop 
	IL_44a4:  ldstr "ul"
	IL_44a9:  callvirt instance bool string::EndsWith(string)
	IL_44ae:  stloc 1

	IL_44b2:  nop 
	IL_44b3:  nop 
	IL_44b4:  ldloc 4

	IL_44b8:  nop 
	IL_44b9:  nop 
	IL_44ba:  ldloc 1

	IL_44be:  nop 
	IL_44bf:  nop 
	IL_44c0:  and 
	IL_44c1:  stloc 4

	IL_44c5:  nop 
	IL_44c6:  nop 
	IL_44c7:  ldloc 4

	IL_44cb:  nop 
	IL_44cc:  nop 
	IL_44cd:  ldc.i4 1
	IL_44d2:  beq IL_44dc

	IL_44d7:  br IL_45c5

	IL_44dc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::'.ctor'()
	IL_44e1:  stloc 115

	IL_44e5:  nop 
	IL_44e6:  nop 
	IL_44e7:  ldloc 115

	IL_44eb:  nop 
	IL_44ec:  nop 
	IL_44ed:  ldarg 1

	IL_44f1:  nop 
	IL_44f2:  nop 
	IL_44f3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_44f8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_44fd:  ldarg 1

	IL_4501:  nop 
	IL_4502:  nop 
	IL_4503:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4508:  stloc 2

	IL_450c:  nop 
	IL_450d:  nop 
	IL_450e:  ldc.i4 1
	IL_4513:  conv.u 
	IL_4514:  newarr [mscorlib]System.Char
	IL_4519:  stloc 3

	IL_451d:  nop 
	IL_451e:  nop 
	IL_451f:  ldloc 3

	IL_4523:  nop 
	IL_4524:  nop 
	IL_4525:  ldc.i4 0
	IL_452a:  conv.u 
	IL_452b:  ldstr "l"
	IL_4530:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4535:  stelem [mscorlib]System.Char
	IL_453a:  ldloc 2

	IL_453e:  nop 
	IL_453f:  nop 
	IL_4540:  ldloc 3

	IL_4544:  nop 
	IL_4545:  nop 
	IL_4546:  callvirt instance string string::TrimEnd(char[])
	IL_454b:  stloc 2

	IL_454f:  nop 
	IL_4550:  nop 
	IL_4551:  ldloc 3

	IL_4555:  nop 
	IL_4556:  nop 
	IL_4557:  ldc.i4 0
	IL_455c:  conv.u 
	IL_455d:  ldstr "u"
	IL_4562:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4567:  stelem [mscorlib]System.Char
	IL_456c:  ldloc 2

	IL_4570:  nop 
	IL_4571:  nop 
	IL_4572:  ldloc 3

	IL_4576:  nop 
	IL_4577:  nop 
	IL_4578:  callvirt instance string string::TrimEnd(char[])
	IL_457d:  stloc 2

	IL_4581:  nop 
	IL_4582:  nop 
	IL_4583:  ldloc 115

	IL_4587:  nop 
	IL_4588:  nop 
	IL_4589:  ldloc 2

	IL_458d:  nop 
	IL_458e:  nop 
	IL_458f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4594:  ldloc 115

	IL_4598:  nop 
	IL_4599:  nop 
	IL_459a:  ldloc 115

	IL_459e:  nop 
	IL_459f:  nop 
	IL_45a0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45a5:  call unsigned int64 class [mscorlib]System.Convert::ToUInt64(string)
	IL_45aa:  stfld unsigned int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::NumVal
	IL_45af:  ldloc 115

	IL_45b3:  nop 
	IL_45b4:  nop 
	IL_45b5:  starg 1

	IL_45b9:  nop 
	IL_45ba:  nop 
	IL_45bb:  br IL_4fef

	IL_45c0:  br IL_45ca

	IL_45c5:  br IL_45ca

	IL_45ca:  ldarg 1

	IL_45ce:  nop 
	IL_45cf:  nop 
	IL_45d0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45d5:  ldstr "^(\\d)+(.)*$"
	IL_45da:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_45df:  stloc 1

	IL_45e3:  nop 
	IL_45e4:  nop 
	IL_45e5:  ldloc 1

	IL_45e9:  nop 
	IL_45ea:  nop 
	IL_45eb:  stloc 4

	IL_45ef:  nop 
	IL_45f0:  nop 
	IL_45f1:  ldarg 1

	IL_45f5:  nop 
	IL_45f6:  nop 
	IL_45f7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_45fc:  ldstr "^\\+(\\d)+(.)*$"
	IL_4601:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4606:  stloc 1

	IL_460a:  nop 
	IL_460b:  nop 
	IL_460c:  ldloc 4

	IL_4610:  nop 
	IL_4611:  nop 
	IL_4612:  ldloc 1

	IL_4616:  nop 
	IL_4617:  nop 
	IL_4618:  or 
	IL_4619:  stloc 4

	IL_461d:  nop 
	IL_461e:  nop 
	IL_461f:  ldarg 1

	IL_4623:  nop 
	IL_4624:  nop 
	IL_4625:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_462a:  ldstr "^-(\\d)+(.)*$"
	IL_462f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4634:  stloc 1

	IL_4638:  nop 
	IL_4639:  nop 
	IL_463a:  ldloc 4

	IL_463e:  nop 
	IL_463f:  nop 
	IL_4640:  ldloc 1

	IL_4644:  nop 
	IL_4645:  nop 
	IL_4646:  or 
	IL_4647:  stloc 4

	IL_464b:  nop 
	IL_464c:  nop 
	IL_464d:  ldarg 1

	IL_4651:  nop 
	IL_4652:  nop 
	IL_4653:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4658:  stloc 2

	IL_465c:  nop 
	IL_465d:  nop 
	IL_465e:  ldloc 2

	IL_4662:  nop 
	IL_4663:  nop 
	IL_4664:  ldstr "l"
	IL_4669:  callvirt instance bool string::EndsWith(string)
	IL_466e:  stloc 1

	IL_4672:  nop 
	IL_4673:  nop 
	IL_4674:  ldloc 4

	IL_4678:  nop 
	IL_4679:  nop 
	IL_467a:  ldloc 1

	IL_467e:  nop 
	IL_467f:  nop 
	IL_4680:  and 
	IL_4681:  stloc 4

	IL_4685:  nop 
	IL_4686:  nop 
	IL_4687:  ldloc 4

	IL_468b:  nop 
	IL_468c:  nop 
	IL_468d:  ldc.i4 1
	IL_4692:  beq IL_469c

	IL_4697:  br IL_4753

	IL_469c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::'.ctor'()
	IL_46a1:  stloc 116

	IL_46a5:  nop 
	IL_46a6:  nop 
	IL_46a7:  ldloc 116

	IL_46ab:  nop 
	IL_46ac:  nop 
	IL_46ad:  ldarg 1

	IL_46b1:  nop 
	IL_46b2:  nop 
	IL_46b3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_46b8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_46bd:  ldarg 1

	IL_46c1:  nop 
	IL_46c2:  nop 
	IL_46c3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46c8:  stloc 2

	IL_46cc:  nop 
	IL_46cd:  nop 
	IL_46ce:  ldc.i4 1
	IL_46d3:  conv.u 
	IL_46d4:  newarr [mscorlib]System.Char
	IL_46d9:  stloc 3

	IL_46dd:  nop 
	IL_46de:  nop 
	IL_46df:  ldloc 3

	IL_46e3:  nop 
	IL_46e4:  nop 
	IL_46e5:  ldc.i4 0
	IL_46ea:  conv.u 
	IL_46eb:  ldstr "l"
	IL_46f0:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_46f5:  stelem [mscorlib]System.Char
	IL_46fa:  ldloc 2

	IL_46fe:  nop 
	IL_46ff:  nop 
	IL_4700:  ldloc 3

	IL_4704:  nop 
	IL_4705:  nop 
	IL_4706:  callvirt instance string string::TrimEnd(char[])
	IL_470b:  stloc 2

	IL_470f:  nop 
	IL_4710:  nop 
	IL_4711:  ldloc 116

	IL_4715:  nop 
	IL_4716:  nop 
	IL_4717:  ldloc 2

	IL_471b:  nop 
	IL_471c:  nop 
	IL_471d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4722:  ldloc 116

	IL_4726:  nop 
	IL_4727:  nop 
	IL_4728:  ldloc 116

	IL_472c:  nop 
	IL_472d:  nop 
	IL_472e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4733:  call int64 class [mscorlib]System.Convert::ToInt64(string)
	IL_4738:  stfld int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_473d:  ldloc 116

	IL_4741:  nop 
	IL_4742:  nop 
	IL_4743:  starg 1

	IL_4747:  nop 
	IL_4748:  nop 
	IL_4749:  br IL_4fef

	IL_474e:  br IL_4758

	IL_4753:  br IL_4758

	IL_4758:  ldarg 1

	IL_475c:  nop 
	IL_475d:  nop 
	IL_475e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4763:  ldstr "^(\\d)+(.)*$"
	IL_4768:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_476d:  stloc 1

	IL_4771:  nop 
	IL_4772:  nop 
	IL_4773:  ldloc 1

	IL_4777:  nop 
	IL_4778:  nop 
	IL_4779:  stloc 4

	IL_477d:  nop 
	IL_477e:  nop 
	IL_477f:  ldarg 1

	IL_4783:  nop 
	IL_4784:  nop 
	IL_4785:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_478a:  ldstr "^\\+(\\d)+(.)*$"
	IL_478f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4794:  stloc 1

	IL_4798:  nop 
	IL_4799:  nop 
	IL_479a:  ldloc 4

	IL_479e:  nop 
	IL_479f:  nop 
	IL_47a0:  ldloc 1

	IL_47a4:  nop 
	IL_47a5:  nop 
	IL_47a6:  or 
	IL_47a7:  stloc 4

	IL_47ab:  nop 
	IL_47ac:  nop 
	IL_47ad:  ldarg 1

	IL_47b1:  nop 
	IL_47b2:  nop 
	IL_47b3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_47b8:  ldstr "^-(\\d)+(.)*$"
	IL_47bd:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_47c2:  stloc 1

	IL_47c6:  nop 
	IL_47c7:  nop 
	IL_47c8:  ldloc 4

	IL_47cc:  nop 
	IL_47cd:  nop 
	IL_47ce:  ldloc 1

	IL_47d2:  nop 
	IL_47d3:  nop 
	IL_47d4:  or 
	IL_47d5:  stloc 4

	IL_47d9:  nop 
	IL_47da:  nop 
	IL_47db:  ldarg 1

	IL_47df:  nop 
	IL_47e0:  nop 
	IL_47e1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_47e6:  stloc 2

	IL_47ea:  nop 
	IL_47eb:  nop 
	IL_47ec:  ldloc 2

	IL_47f0:  nop 
	IL_47f1:  nop 
	IL_47f2:  ldstr "us"
	IL_47f7:  callvirt instance bool string::EndsWith(string)
	IL_47fc:  stloc 1

	IL_4800:  nop 
	IL_4801:  nop 
	IL_4802:  ldloc 4

	IL_4806:  nop 
	IL_4807:  nop 
	IL_4808:  ldloc 1

	IL_480c:  nop 
	IL_480d:  nop 
	IL_480e:  and 
	IL_480f:  stloc 4

	IL_4813:  nop 
	IL_4814:  nop 
	IL_4815:  ldloc 4

	IL_4819:  nop 
	IL_481a:  nop 
	IL_481b:  ldc.i4 1
	IL_4820:  beq IL_482a

	IL_4825:  br IL_4913

	IL_482a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::'.ctor'()
	IL_482f:  stloc 117

	IL_4833:  nop 
	IL_4834:  nop 
	IL_4835:  ldloc 117

	IL_4839:  nop 
	IL_483a:  nop 
	IL_483b:  ldarg 1

	IL_483f:  nop 
	IL_4840:  nop 
	IL_4841:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4846:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_484b:  ldarg 1

	IL_484f:  nop 
	IL_4850:  nop 
	IL_4851:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4856:  stloc 2

	IL_485a:  nop 
	IL_485b:  nop 
	IL_485c:  ldc.i4 1
	IL_4861:  conv.u 
	IL_4862:  newarr [mscorlib]System.Char
	IL_4867:  stloc 3

	IL_486b:  nop 
	IL_486c:  nop 
	IL_486d:  ldloc 3

	IL_4871:  nop 
	IL_4872:  nop 
	IL_4873:  ldc.i4 0
	IL_4878:  conv.u 
	IL_4879:  ldstr "s"
	IL_487e:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4883:  stelem [mscorlib]System.Char
	IL_4888:  ldloc 2

	IL_488c:  nop 
	IL_488d:  nop 
	IL_488e:  ldloc 3

	IL_4892:  nop 
	IL_4893:  nop 
	IL_4894:  callvirt instance string string::TrimEnd(char[])
	IL_4899:  stloc 2

	IL_489d:  nop 
	IL_489e:  nop 
	IL_489f:  ldloc 3

	IL_48a3:  nop 
	IL_48a4:  nop 
	IL_48a5:  ldc.i4 0
	IL_48aa:  conv.u 
	IL_48ab:  ldstr "u"
	IL_48b0:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_48b5:  stelem [mscorlib]System.Char
	IL_48ba:  ldloc 2

	IL_48be:  nop 
	IL_48bf:  nop 
	IL_48c0:  ldloc 3

	IL_48c4:  nop 
	IL_48c5:  nop 
	IL_48c6:  callvirt instance string string::TrimEnd(char[])
	IL_48cb:  stloc 2

	IL_48cf:  nop 
	IL_48d0:  nop 
	IL_48d1:  ldloc 117

	IL_48d5:  nop 
	IL_48d6:  nop 
	IL_48d7:  ldloc 2

	IL_48db:  nop 
	IL_48dc:  nop 
	IL_48dd:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48e2:  ldloc 117

	IL_48e6:  nop 
	IL_48e7:  nop 
	IL_48e8:  ldloc 117

	IL_48ec:  nop 
	IL_48ed:  nop 
	IL_48ee:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48f3:  call unsigned int16 class [mscorlib]System.Convert::ToUInt16(string)
	IL_48f8:  stfld unsigned int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::NumVal
	IL_48fd:  ldloc 117

	IL_4901:  nop 
	IL_4902:  nop 
	IL_4903:  starg 1

	IL_4907:  nop 
	IL_4908:  nop 
	IL_4909:  br IL_4fef

	IL_490e:  br IL_4918

	IL_4913:  br IL_4918

	IL_4918:  ldarg 1

	IL_491c:  nop 
	IL_491d:  nop 
	IL_491e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4923:  ldstr "^(\\d)+(.)*$"
	IL_4928:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_492d:  stloc 1

	IL_4931:  nop 
	IL_4932:  nop 
	IL_4933:  ldloc 1

	IL_4937:  nop 
	IL_4938:  nop 
	IL_4939:  stloc 4

	IL_493d:  nop 
	IL_493e:  nop 
	IL_493f:  ldarg 1

	IL_4943:  nop 
	IL_4944:  nop 
	IL_4945:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_494a:  ldstr "^\\+(\\d)+(.)*$"
	IL_494f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4954:  stloc 1

	IL_4958:  nop 
	IL_4959:  nop 
	IL_495a:  ldloc 4

	IL_495e:  nop 
	IL_495f:  nop 
	IL_4960:  ldloc 1

	IL_4964:  nop 
	IL_4965:  nop 
	IL_4966:  or 
	IL_4967:  stloc 4

	IL_496b:  nop 
	IL_496c:  nop 
	IL_496d:  ldarg 1

	IL_4971:  nop 
	IL_4972:  nop 
	IL_4973:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4978:  ldstr "^-(\\d)+(.)*$"
	IL_497d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4982:  stloc 1

	IL_4986:  nop 
	IL_4987:  nop 
	IL_4988:  ldloc 4

	IL_498c:  nop 
	IL_498d:  nop 
	IL_498e:  ldloc 1

	IL_4992:  nop 
	IL_4993:  nop 
	IL_4994:  or 
	IL_4995:  stloc 4

	IL_4999:  nop 
	IL_499a:  nop 
	IL_499b:  ldarg 1

	IL_499f:  nop 
	IL_49a0:  nop 
	IL_49a1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_49a6:  stloc 2

	IL_49aa:  nop 
	IL_49ab:  nop 
	IL_49ac:  ldloc 2

	IL_49b0:  nop 
	IL_49b1:  nop 
	IL_49b2:  ldstr "s"
	IL_49b7:  callvirt instance bool string::EndsWith(string)
	IL_49bc:  stloc 1

	IL_49c0:  nop 
	IL_49c1:  nop 
	IL_49c2:  ldloc 4

	IL_49c6:  nop 
	IL_49c7:  nop 
	IL_49c8:  ldloc 1

	IL_49cc:  nop 
	IL_49cd:  nop 
	IL_49ce:  and 
	IL_49cf:  stloc 4

	IL_49d3:  nop 
	IL_49d4:  nop 
	IL_49d5:  ldloc 4

	IL_49d9:  nop 
	IL_49da:  nop 
	IL_49db:  ldc.i4 1
	IL_49e0:  beq IL_49ea

	IL_49e5:  br IL_4aa1

	IL_49ea:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::'.ctor'()
	IL_49ef:  stloc 118

	IL_49f3:  nop 
	IL_49f4:  nop 
	IL_49f5:  ldloc 118

	IL_49f9:  nop 
	IL_49fa:  nop 
	IL_49fb:  ldarg 1

	IL_49ff:  nop 
	IL_4a00:  nop 
	IL_4a01:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4a06:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4a0b:  ldarg 1

	IL_4a0f:  nop 
	IL_4a10:  nop 
	IL_4a11:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a16:  stloc 2

	IL_4a1a:  nop 
	IL_4a1b:  nop 
	IL_4a1c:  ldc.i4 1
	IL_4a21:  conv.u 
	IL_4a22:  newarr [mscorlib]System.Char
	IL_4a27:  stloc 3

	IL_4a2b:  nop 
	IL_4a2c:  nop 
	IL_4a2d:  ldloc 3

	IL_4a31:  nop 
	IL_4a32:  nop 
	IL_4a33:  ldc.i4 0
	IL_4a38:  conv.u 
	IL_4a39:  ldstr "s"
	IL_4a3e:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4a43:  stelem [mscorlib]System.Char
	IL_4a48:  ldloc 2

	IL_4a4c:  nop 
	IL_4a4d:  nop 
	IL_4a4e:  ldloc 3

	IL_4a52:  nop 
	IL_4a53:  nop 
	IL_4a54:  callvirt instance string string::TrimEnd(char[])
	IL_4a59:  stloc 2

	IL_4a5d:  nop 
	IL_4a5e:  nop 
	IL_4a5f:  ldloc 118

	IL_4a63:  nop 
	IL_4a64:  nop 
	IL_4a65:  ldloc 2

	IL_4a69:  nop 
	IL_4a6a:  nop 
	IL_4a6b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a70:  ldloc 118

	IL_4a74:  nop 
	IL_4a75:  nop 
	IL_4a76:  ldloc 118

	IL_4a7a:  nop 
	IL_4a7b:  nop 
	IL_4a7c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a81:  call int16 class [mscorlib]System.Convert::ToInt16(string)
	IL_4a86:  stfld int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_4a8b:  ldloc 118

	IL_4a8f:  nop 
	IL_4a90:  nop 
	IL_4a91:  starg 1

	IL_4a95:  nop 
	IL_4a96:  nop 
	IL_4a97:  br IL_4fef

	IL_4a9c:  br IL_4aa6

	IL_4aa1:  br IL_4aa6

	IL_4aa6:  ldarg 1

	IL_4aaa:  nop 
	IL_4aab:  nop 
	IL_4aac:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ab1:  ldstr "^(\\d)+(.)*$"
	IL_4ab6:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4abb:  stloc 1

	IL_4abf:  nop 
	IL_4ac0:  nop 
	IL_4ac1:  ldloc 1

	IL_4ac5:  nop 
	IL_4ac6:  nop 
	IL_4ac7:  stloc 4

	IL_4acb:  nop 
	IL_4acc:  nop 
	IL_4acd:  ldarg 1

	IL_4ad1:  nop 
	IL_4ad2:  nop 
	IL_4ad3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ad8:  ldstr "^\\+(\\d)+(.)*$"
	IL_4add:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4ae2:  stloc 1

	IL_4ae6:  nop 
	IL_4ae7:  nop 
	IL_4ae8:  ldloc 4

	IL_4aec:  nop 
	IL_4aed:  nop 
	IL_4aee:  ldloc 1

	IL_4af2:  nop 
	IL_4af3:  nop 
	IL_4af4:  or 
	IL_4af5:  stloc 4

	IL_4af9:  nop 
	IL_4afa:  nop 
	IL_4afb:  ldarg 1

	IL_4aff:  nop 
	IL_4b00:  nop 
	IL_4b01:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b06:  ldstr "^-(\\d)+(.)*$"
	IL_4b0b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b10:  stloc 1

	IL_4b14:  nop 
	IL_4b15:  nop 
	IL_4b16:  ldloc 4

	IL_4b1a:  nop 
	IL_4b1b:  nop 
	IL_4b1c:  ldloc 1

	IL_4b20:  nop 
	IL_4b21:  nop 
	IL_4b22:  or 
	IL_4b23:  stloc 4

	IL_4b27:  nop 
	IL_4b28:  nop 
	IL_4b29:  ldarg 1

	IL_4b2d:  nop 
	IL_4b2e:  nop 
	IL_4b2f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b34:  stloc 2

	IL_4b38:  nop 
	IL_4b39:  nop 
	IL_4b3a:  ldloc 2

	IL_4b3e:  nop 
	IL_4b3f:  nop 
	IL_4b40:  ldstr "ub"
	IL_4b45:  callvirt instance bool string::EndsWith(string)
	IL_4b4a:  stloc 1

	IL_4b4e:  nop 
	IL_4b4f:  nop 
	IL_4b50:  ldloc 4

	IL_4b54:  nop 
	IL_4b55:  nop 
	IL_4b56:  ldloc 1

	IL_4b5a:  nop 
	IL_4b5b:  nop 
	IL_4b5c:  and 
	IL_4b5d:  stloc 4

	IL_4b61:  nop 
	IL_4b62:  nop 
	IL_4b63:  ldloc 4

	IL_4b67:  nop 
	IL_4b68:  nop 
	IL_4b69:  ldc.i4 1
	IL_4b6e:  beq IL_4b78

	IL_4b73:  br IL_4c61

	IL_4b78:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::'.ctor'()
	IL_4b7d:  stloc 119

	IL_4b81:  nop 
	IL_4b82:  nop 
	IL_4b83:  ldloc 119

	IL_4b87:  nop 
	IL_4b88:  nop 
	IL_4b89:  ldarg 1

	IL_4b8d:  nop 
	IL_4b8e:  nop 
	IL_4b8f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4b94:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4b99:  ldarg 1

	IL_4b9d:  nop 
	IL_4b9e:  nop 
	IL_4b9f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ba4:  stloc 2

	IL_4ba8:  nop 
	IL_4ba9:  nop 
	IL_4baa:  ldc.i4 1
	IL_4baf:  conv.u 
	IL_4bb0:  newarr [mscorlib]System.Char
	IL_4bb5:  stloc 3

	IL_4bb9:  nop 
	IL_4bba:  nop 
	IL_4bbb:  ldloc 3

	IL_4bbf:  nop 
	IL_4bc0:  nop 
	IL_4bc1:  ldc.i4 0
	IL_4bc6:  conv.u 
	IL_4bc7:  ldstr "b"
	IL_4bcc:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4bd1:  stelem [mscorlib]System.Char
	IL_4bd6:  ldloc 2

	IL_4bda:  nop 
	IL_4bdb:  nop 
	IL_4bdc:  ldloc 3

	IL_4be0:  nop 
	IL_4be1:  nop 
	IL_4be2:  callvirt instance string string::TrimEnd(char[])
	IL_4be7:  stloc 2

	IL_4beb:  nop 
	IL_4bec:  nop 
	IL_4bed:  ldloc 3

	IL_4bf1:  nop 
	IL_4bf2:  nop 
	IL_4bf3:  ldc.i4 0
	IL_4bf8:  conv.u 
	IL_4bf9:  ldstr "u"
	IL_4bfe:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4c03:  stelem [mscorlib]System.Char
	IL_4c08:  ldloc 2

	IL_4c0c:  nop 
	IL_4c0d:  nop 
	IL_4c0e:  ldloc 3

	IL_4c12:  nop 
	IL_4c13:  nop 
	IL_4c14:  callvirt instance string string::TrimEnd(char[])
	IL_4c19:  stloc 2

	IL_4c1d:  nop 
	IL_4c1e:  nop 
	IL_4c1f:  ldloc 119

	IL_4c23:  nop 
	IL_4c24:  nop 
	IL_4c25:  ldloc 2

	IL_4c29:  nop 
	IL_4c2a:  nop 
	IL_4c2b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c30:  ldloc 119

	IL_4c34:  nop 
	IL_4c35:  nop 
	IL_4c36:  ldloc 119

	IL_4c3a:  nop 
	IL_4c3b:  nop 
	IL_4c3c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c41:  call unsigned int8 class [mscorlib]System.Convert::ToByte(string)
	IL_4c46:  stfld unsigned int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::NumVal
	IL_4c4b:  ldloc 119

	IL_4c4f:  nop 
	IL_4c50:  nop 
	IL_4c51:  starg 1

	IL_4c55:  nop 
	IL_4c56:  nop 
	IL_4c57:  br IL_4fef

	IL_4c5c:  br IL_4c66

	IL_4c61:  br IL_4c66

	IL_4c66:  ldarg 1

	IL_4c6a:  nop 
	IL_4c6b:  nop 
	IL_4c6c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c71:  ldstr "^(\\d)+(.)*$"
	IL_4c76:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4c7b:  stloc 1

	IL_4c7f:  nop 
	IL_4c80:  nop 
	IL_4c81:  ldloc 1

	IL_4c85:  nop 
	IL_4c86:  nop 
	IL_4c87:  stloc 4

	IL_4c8b:  nop 
	IL_4c8c:  nop 
	IL_4c8d:  ldarg 1

	IL_4c91:  nop 
	IL_4c92:  nop 
	IL_4c93:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4c98:  ldstr "^\\+(\\d)+(.)*$"
	IL_4c9d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4ca2:  stloc 1

	IL_4ca6:  nop 
	IL_4ca7:  nop 
	IL_4ca8:  ldloc 4

	IL_4cac:  nop 
	IL_4cad:  nop 
	IL_4cae:  ldloc 1

	IL_4cb2:  nop 
	IL_4cb3:  nop 
	IL_4cb4:  or 
	IL_4cb5:  stloc 4

	IL_4cb9:  nop 
	IL_4cba:  nop 
	IL_4cbb:  ldarg 1

	IL_4cbf:  nop 
	IL_4cc0:  nop 
	IL_4cc1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4cc6:  ldstr "^-(\\d)+(.)*$"
	IL_4ccb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4cd0:  stloc 1

	IL_4cd4:  nop 
	IL_4cd5:  nop 
	IL_4cd6:  ldloc 4

	IL_4cda:  nop 
	IL_4cdb:  nop 
	IL_4cdc:  ldloc 1

	IL_4ce0:  nop 
	IL_4ce1:  nop 
	IL_4ce2:  or 
	IL_4ce3:  stloc 4

	IL_4ce7:  nop 
	IL_4ce8:  nop 
	IL_4ce9:  ldarg 1

	IL_4ced:  nop 
	IL_4cee:  nop 
	IL_4cef:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4cf4:  stloc 2

	IL_4cf8:  nop 
	IL_4cf9:  nop 
	IL_4cfa:  ldloc 2

	IL_4cfe:  nop 
	IL_4cff:  nop 
	IL_4d00:  ldstr "b"
	IL_4d05:  callvirt instance bool string::EndsWith(string)
	IL_4d0a:  stloc 1

	IL_4d0e:  nop 
	IL_4d0f:  nop 
	IL_4d10:  ldloc 4

	IL_4d14:  nop 
	IL_4d15:  nop 
	IL_4d16:  ldloc 1

	IL_4d1a:  nop 
	IL_4d1b:  nop 
	IL_4d1c:  and 
	IL_4d1d:  stloc 4

	IL_4d21:  nop 
	IL_4d22:  nop 
	IL_4d23:  ldloc 4

	IL_4d27:  nop 
	IL_4d28:  nop 
	IL_4d29:  ldc.i4 1
	IL_4d2e:  beq IL_4d38

	IL_4d33:  br IL_4def

	IL_4d38:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::'.ctor'()
	IL_4d3d:  stloc 120

	IL_4d41:  nop 
	IL_4d42:  nop 
	IL_4d43:  ldloc 120

	IL_4d47:  nop 
	IL_4d48:  nop 
	IL_4d49:  ldarg 1

	IL_4d4d:  nop 
	IL_4d4e:  nop 
	IL_4d4f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4d54:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4d59:  ldarg 1

	IL_4d5d:  nop 
	IL_4d5e:  nop 
	IL_4d5f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4d64:  stloc 2

	IL_4d68:  nop 
	IL_4d69:  nop 
	IL_4d6a:  ldc.i4 1
	IL_4d6f:  conv.u 
	IL_4d70:  newarr [mscorlib]System.Char
	IL_4d75:  stloc 3

	IL_4d79:  nop 
	IL_4d7a:  nop 
	IL_4d7b:  ldloc 3

	IL_4d7f:  nop 
	IL_4d80:  nop 
	IL_4d81:  ldc.i4 0
	IL_4d86:  conv.u 
	IL_4d87:  ldstr "b"
	IL_4d8c:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4d91:  stelem [mscorlib]System.Char
	IL_4d96:  ldloc 2

	IL_4d9a:  nop 
	IL_4d9b:  nop 
	IL_4d9c:  ldloc 3

	IL_4da0:  nop 
	IL_4da1:  nop 
	IL_4da2:  callvirt instance string string::TrimEnd(char[])
	IL_4da7:  stloc 2

	IL_4dab:  nop 
	IL_4dac:  nop 
	IL_4dad:  ldloc 120

	IL_4db1:  nop 
	IL_4db2:  nop 
	IL_4db3:  ldloc 2

	IL_4db7:  nop 
	IL_4db8:  nop 
	IL_4db9:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4dbe:  ldloc 120

	IL_4dc2:  nop 
	IL_4dc3:  nop 
	IL_4dc4:  ldloc 120

	IL_4dc8:  nop 
	IL_4dc9:  nop 
	IL_4dca:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4dcf:  call int8 class [mscorlib]System.Convert::ToSByte(string)
	IL_4dd4:  stfld int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_4dd9:  ldloc 120

	IL_4ddd:  nop 
	IL_4dde:  nop 
	IL_4ddf:  starg 1

	IL_4de3:  nop 
	IL_4de4:  nop 
	IL_4de5:  br IL_4fef

	IL_4dea:  br IL_4df4

	IL_4def:  br IL_4df4

	IL_4df4:  ldarg 1

	IL_4df8:  nop 
	IL_4df9:  nop 
	IL_4dfa:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4dff:  ldstr "^(\\d)+(.)*$"
	IL_4e04:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4e09:  stloc 1

	IL_4e0d:  nop 
	IL_4e0e:  nop 
	IL_4e0f:  ldloc 1

	IL_4e13:  nop 
	IL_4e14:  nop 
	IL_4e15:  stloc 4

	IL_4e19:  nop 
	IL_4e1a:  nop 
	IL_4e1b:  ldarg 1

	IL_4e1f:  nop 
	IL_4e20:  nop 
	IL_4e21:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4e26:  ldstr "^\\+(\\d)+(.)*$"
	IL_4e2b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4e30:  stloc 1

	IL_4e34:  nop 
	IL_4e35:  nop 
	IL_4e36:  ldloc 4

	IL_4e3a:  nop 
	IL_4e3b:  nop 
	IL_4e3c:  ldloc 1

	IL_4e40:  nop 
	IL_4e41:  nop 
	IL_4e42:  or 
	IL_4e43:  stloc 4

	IL_4e47:  nop 
	IL_4e48:  nop 
	IL_4e49:  ldarg 1

	IL_4e4d:  nop 
	IL_4e4e:  nop 
	IL_4e4f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4e54:  ldstr "^-(\\d)+(.)*$"
	IL_4e59:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4e5e:  stloc 1

	IL_4e62:  nop 
	IL_4e63:  nop 
	IL_4e64:  ldloc 4

	IL_4e68:  nop 
	IL_4e69:  nop 
	IL_4e6a:  ldloc 1

	IL_4e6e:  nop 
	IL_4e6f:  nop 
	IL_4e70:  or 
	IL_4e71:  stloc 4

	IL_4e75:  nop 
	IL_4e76:  nop 
	IL_4e77:  ldloc 4

	IL_4e7b:  nop 
	IL_4e7c:  nop 
	IL_4e7d:  ldc.i4 1
	IL_4e82:  beq IL_4e8c

	IL_4e87:  br IL_4f00

	IL_4e8c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_4e91:  stloc 121

	IL_4e95:  nop 
	IL_4e96:  nop 
	IL_4e97:  ldloc 121

	IL_4e9b:  nop 
	IL_4e9c:  nop 
	IL_4e9d:  ldarg 1

	IL_4ea1:  nop 
	IL_4ea2:  nop 
	IL_4ea3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4ea8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4ead:  ldarg 1

	IL_4eb1:  nop 
	IL_4eb2:  nop 
	IL_4eb3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4eb8:  stloc 2

	IL_4ebc:  nop 
	IL_4ebd:  nop 
	IL_4ebe:  ldloc 121

	IL_4ec2:  nop 
	IL_4ec3:  nop 
	IL_4ec4:  ldloc 2

	IL_4ec8:  nop 
	IL_4ec9:  nop 
	IL_4eca:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ecf:  ldloc 121

	IL_4ed3:  nop 
	IL_4ed4:  nop 
	IL_4ed5:  ldloc 121

	IL_4ed9:  nop 
	IL_4eda:  nop 
	IL_4edb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ee0:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_4ee5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_4eea:  ldloc 121

	IL_4eee:  nop 
	IL_4eef:  nop 
	IL_4ef0:  starg 1

	IL_4ef4:  nop 
	IL_4ef5:  nop 
	IL_4ef6:  br IL_4fef

	IL_4efb:  br IL_4f05

	IL_4f00:  br IL_4f05

	IL_4f05:  ldarg 1

	IL_4f09:  nop 
	IL_4f0a:  nop 
	IL_4f0b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f10:  ldstr "^([a-zA-Z])+(.)*$"
	IL_4f15:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4f1a:  stloc 1

	IL_4f1e:  nop 
	IL_4f1f:  nop 
	IL_4f20:  ldloc 1

	IL_4f24:  nop 
	IL_4f25:  nop 
	IL_4f26:  stloc 4

	IL_4f2a:  nop 
	IL_4f2b:  nop 
	IL_4f2c:  ldarg 1

	IL_4f30:  nop 
	IL_4f31:  nop 
	IL_4f32:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f37:  ldstr "^_(.)*([a-zA-Z])+(.)*$"
	IL_4f3c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4f41:  stloc 1

	IL_4f45:  nop 
	IL_4f46:  nop 
	IL_4f47:  ldloc 4

	IL_4f4b:  nop 
	IL_4f4c:  nop 
	IL_4f4d:  ldloc 1

	IL_4f51:  nop 
	IL_4f52:  nop 
	IL_4f53:  or 
	IL_4f54:  stloc 4

	IL_4f58:  nop 
	IL_4f59:  nop 
	IL_4f5a:  ldarg 1

	IL_4f5e:  nop 
	IL_4f5f:  nop 
	IL_4f60:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4f65:  ldstr "^::(.)*([a-zA-Z])+(.)*$"
	IL_4f6a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4f6f:  stloc 1

	IL_4f73:  nop 
	IL_4f74:  nop 
	IL_4f75:  ldloc 4

	IL_4f79:  nop 
	IL_4f7a:  nop 
	IL_4f7b:  ldloc 1

	IL_4f7f:  nop 
	IL_4f80:  nop 
	IL_4f81:  or 
	IL_4f82:  stloc 4

	IL_4f86:  nop 
	IL_4f87:  nop 
	IL_4f88:  ldloc 4

	IL_4f8c:  nop 
	IL_4f8d:  nop 
	IL_4f8e:  ldc.i4 1
	IL_4f93:  beq IL_4f9d

	IL_4f98:  br IL_4fea

	IL_4f9d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_4fa2:  stloc 122

	IL_4fa6:  nop 
	IL_4fa7:  nop 
	IL_4fa8:  ldloc 122

	IL_4fac:  nop 
	IL_4fad:  nop 
	IL_4fae:  ldarg 1

	IL_4fb2:  nop 
	IL_4fb3:  nop 
	IL_4fb4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4fb9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4fbe:  ldloc 122

	IL_4fc2:  nop 
	IL_4fc3:  nop 
	IL_4fc4:  ldarg 1

	IL_4fc8:  nop 
	IL_4fc9:  nop 
	IL_4fca:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4fcf:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4fd4:  ldloc 122

	IL_4fd8:  nop 
	IL_4fd9:  nop 
	IL_4fda:  starg 1

	IL_4fde:  nop 
	IL_4fdf:  nop 
	IL_4fe0:  br IL_4fef

	IL_4fe5:  br IL_4fef

	IL_4fea:  br IL_4fef

	IL_4fef:  ldarg 1

	IL_4ff3:  nop 
	IL_4ff4:  nop 
	IL_4ff5:  ret 
    } // end of method TokenOptimizer::Optimize

    // method line 10
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7384
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
        // Method begins at RVA 0x7398
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
        // Method begins at RVA 0x7560
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
        // Method begins at RVA 0x7694
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
        // Method begins at RVA 0x7bd0
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
        // Method begins at RVA 0x80d0
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
        // Method begins at RVA 0x84c8
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
        // Method begins at RVA 0x88ec
	// Code size 7627 (0x1dcb)
	.maxstack 218
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok	V_45,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_49,
		int32	V_50,
		int32	V_51,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_52,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_53,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_55)
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

	IL_00ef:  br IL_1d08

	IL_00f4:  br IL_00fe

	IL_00f9:  br IL_00fe

	IL_00fe:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_0103:  ldc.i4 0
	IL_0108:  beq IL_0112

	IL_010d:  br IL_188f

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
	IL_02d4:  br IL_1860

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
	IL_0476:  br IL_1860

	IL_047b:  br IL_0485

	IL_0480:  br IL_0485

	IL_0485:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::ProcessTTokOnly
	IL_048a:  ldc.i4 0
	IL_048f:  beq IL_0499

	IL_0494:  br IL_185b

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
	IL_0594:  br IL_1860

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

	IL_0666:  br IL_1860

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

	IL_0828:  br IL_1860

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

	IL_08e6:  br IL_1860

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

	IL_09a4:  br IL_1860

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

	IL_0a6c:  br IL_1860

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

	IL_0b2a:  br IL_1860

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

	IL_0be8:  br IL_1860

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

	IL_0c33:  br IL_0e3a

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
	IL_0d48:  ldarg 1

	IL_0d4c:  nop 
	IL_0d4d:  nop 
	IL_0d4e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0d53:  ldloc 1

	IL_0d57:  nop 
	IL_0d58:  nop 
	IL_0d59:  conv.u 
	IL_0d5a:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d5f:  stloc 41

	IL_0d63:  nop 
	IL_0d64:  nop 
	IL_0d65:  ldloc 41

	IL_0d69:  nop 
	IL_0d6a:  nop 
	IL_0d6b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0d70:  stloc 42

	IL_0d74:  nop 
	IL_0d75:  nop 
	IL_0d76:  ldloc 42

	IL_0d7a:  nop 
	IL_0d7b:  nop 
	IL_0d7c:  ldlen 
	IL_0d7d:  conv.i4 
	IL_0d7e:  ldc.i4 1
	IL_0d83:  sub 
	IL_0d84:  stloc 43

	IL_0d88:  nop 
	IL_0d89:  nop 
	IL_0d8a:  ldc.i4 -1
	IL_0d8f:  stloc 44

	IL_0d93:  nop 
	IL_0d94:  nop 
	IL_0d95:  ldloc 43

	IL_0d99:  nop 
	IL_0d9a:  nop 
	IL_0d9b:  ldc.i4 0
	IL_0da0:  blt IL_0daa

	IL_0da5:  br IL_0db4

	IL_0daa:  br IL_0e1f

	IL_0daf:  br IL_0db9

	IL_0db4:  br IL_0db9

	IL_0db9:  ldloc 44

	IL_0dbd:  nop 
	IL_0dbe:  nop 
	IL_0dbf:  ldc.i4 1
	IL_0dc4:  add 
	IL_0dc5:  stloc 44

	IL_0dc9:  nop 
	IL_0dca:  nop 
	IL_0dcb:  ldloc 42

	IL_0dcf:  nop 
	IL_0dd0:  nop 
	IL_0dd1:  ldloc 44

	IL_0dd5:  nop 
	IL_0dd6:  nop 
	IL_0dd7:  conv.u 
	IL_0dd8:  ldarg.0 
	IL_0dd9:  ldloc 42

	IL_0ddd:  nop 
	IL_0dde:  nop 
	IL_0ddf:  ldloc 44

	IL_0de3:  nop 
	IL_0de4:  nop 
	IL_0de5:  conv.u 
	IL_0de6:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0deb:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0df0:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0df5:  ldloc 44

	IL_0df9:  nop 
	IL_0dfa:  nop 
	IL_0dfb:  ldloc 43

	IL_0dff:  nop 
	IL_0e00:  nop 
	IL_0e01:  beq IL_0e0b

	IL_0e06:  br IL_0e15

	IL_0e0b:  br IL_0e1f

	IL_0e10:  br IL_0e1f

	IL_0e15:  br IL_0db9

	IL_0e1a:  br IL_0e1f

	IL_0e1f:  ldloc 41

	IL_0e23:  nop 
	IL_0e24:  nop 
	IL_0e25:  ldloc 42

	IL_0e29:  nop 
	IL_0e2a:  nop 
	IL_0e2b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_0e30:  br IL_1860

	IL_0e35:  br IL_0e3f

	IL_0e3a:  br IL_0e3f

	IL_0e3f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeTok
	IL_0e44:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0e49:  stloc 25

	IL_0e4d:  nop 
	IL_0e4e:  nop 
	IL_0e4f:  ldloc 25

	IL_0e53:  nop 
	IL_0e54:  nop 
	IL_0e55:  ldloc 24

	IL_0e59:  nop 
	IL_0e5a:  nop 
	IL_0e5b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0e60:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0e65:  stloc 26

	IL_0e69:  nop 
	IL_0e6a:  nop 
	IL_0e6b:  ldloc 26

	IL_0e6f:  nop 
	IL_0e70:  nop 
	IL_0e71:  ldc.i4 1
	IL_0e76:  beq IL_0e80

	IL_0e7b:  br IL_0fb3

	IL_0e80:  ldarg 1

	IL_0e84:  nop 
	IL_0e85:  nop 
	IL_0e86:  ldloc 1

	IL_0e8a:  nop 
	IL_0e8b:  nop 
	IL_0e8c:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0e91:  ldloc 0

	IL_0e95:  nop 
	IL_0e96:  nop 
	IL_0e97:  ldc.i4 1
	IL_0e9c:  sub 
	IL_0e9d:  stloc 0

	IL_0ea1:  nop 
	IL_0ea2:  nop 
	IL_0ea3:  ldarg 1

	IL_0ea7:  nop 
	IL_0ea8:  nop 
	IL_0ea9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0eae:  ldloc 1

	IL_0eb2:  nop 
	IL_0eb3:  nop 
	IL_0eb4:  conv.u 
	IL_0eb5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0eba:  stloc 11

	IL_0ebe:  nop 
	IL_0ebf:  nop 
	IL_0ec0:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0ec5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0eca:  stloc 25

	IL_0ece:  nop 
	IL_0ecf:  nop 
	IL_0ed0:  ldloc 25

	IL_0ed4:  nop 
	IL_0ed5:  nop 
	IL_0ed6:  ldloc 11

	IL_0eda:  nop 
	IL_0edb:  nop 
	IL_0edc:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0ee1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0ee6:  stloc 26

	IL_0eea:  nop 
	IL_0eeb:  nop 
	IL_0eec:  ldloc 26

	IL_0ef0:  nop 
	IL_0ef1:  nop 
	IL_0ef2:  ldc.i4 1
	IL_0ef7:  beq IL_0f5a

	IL_0efc:  br IL_0f01

	IL_0f01:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0f06:  stloc 12

	IL_0f0a:  nop 
	IL_0f0b:  nop 
	IL_0f0c:  ldloc 12

	IL_0f10:  nop 
	IL_0f11:  nop 
	IL_0f12:  ldloc 11

	IL_0f16:  nop 
	IL_0f17:  nop 
	IL_0f18:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0f1d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_0f22:  ldloc 12

	IL_0f26:  nop 
	IL_0f27:  nop 
	IL_0f28:  ldloc 11

	IL_0f2c:  nop 
	IL_0f2d:  nop 
	IL_0f2e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0f33:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0f38:  ldarg 1

	IL_0f3c:  nop 
	IL_0f3d:  nop 
	IL_0f3e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0f43:  ldloc 1

	IL_0f47:  nop 
	IL_0f48:  nop 
	IL_0f49:  conv.u 
	IL_0f4a:  ldloc 12

	IL_0f4e:  nop 
	IL_0f4f:  nop 
	IL_0f50:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0f55:  br IL_0f5f

	IL_0f5a:  br IL_0f5f

	IL_0f5f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::'.ctor'()
	IL_0f64:  stloc 45

	IL_0f68:  nop 
	IL_0f69:  nop 
	IL_0f6a:  ldloc 45

	IL_0f6e:  nop 
	IL_0f6f:  nop 
	IL_0f70:  ldarg 1

	IL_0f74:  nop 
	IL_0f75:  nop 
	IL_0f76:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0f7b:  ldloc 1

	IL_0f7f:  nop 
	IL_0f80:  nop 
	IL_0f81:  conv.u 
	IL_0f82:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0f87:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_0f8c:  ldarg 1

	IL_0f90:  nop 
	IL_0f91:  nop 
	IL_0f92:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0f97:  ldloc 1

	IL_0f9b:  nop 
	IL_0f9c:  nop 
	IL_0f9d:  conv.u 
	IL_0f9e:  ldloc 45

	IL_0fa2:  nop 
	IL_0fa3:  nop 
	IL_0fa4:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0fa9:  br IL_1860

	IL_0fae:  br IL_0fb8

	IL_0fb3:  br IL_0fb8

	IL_0fb8:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrTok
	IL_0fbd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0fc2:  stloc 25

	IL_0fc6:  nop 
	IL_0fc7:  nop 
	IL_0fc8:  ldloc 25

	IL_0fcc:  nop 
	IL_0fcd:  nop 
	IL_0fce:  ldloc 24

	IL_0fd2:  nop 
	IL_0fd3:  nop 
	IL_0fd4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0fd9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0fde:  stloc 26

	IL_0fe2:  nop 
	IL_0fe3:  nop 
	IL_0fe4:  ldloc 26

	IL_0fe8:  nop 
	IL_0fe9:  nop 
	IL_0fea:  ldc.i4 1
	IL_0fef:  beq IL_0ff9

	IL_0ff4:  br IL_1177

	IL_0ff9:  ldarg 1

	IL_0ffd:  nop 
	IL_0ffe:  nop 
	IL_0fff:  ldloc 1

	IL_1003:  nop 
	IL_1004:  nop 
	IL_1005:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_100a:  ldloc 0

	IL_100e:  nop 
	IL_100f:  nop 
	IL_1010:  ldc.i4 1
	IL_1015:  sub 
	IL_1016:  stloc 0

	IL_101a:  nop 
	IL_101b:  nop 
	IL_101c:  ldarg 1

	IL_1020:  nop 
	IL_1021:  nop 
	IL_1022:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1027:  ldloc 1

	IL_102b:  nop 
	IL_102c:  nop 
	IL_102d:  conv.u 
	IL_102e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1033:  stloc 24

	IL_1037:  nop 
	IL_1038:  nop 
	IL_1039:  ldarg 1

	IL_103d:  nop 
	IL_103e:  nop 
	IL_103f:  ldloc 1

	IL_1043:  nop 
	IL_1044:  nop 
	IL_1045:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_104a:  ldloc 0

	IL_104e:  nop 
	IL_104f:  nop 
	IL_1050:  ldc.i4 1
	IL_1055:  sub 
	IL_1056:  stloc 0

	IL_105a:  nop 
	IL_105b:  nop 
	IL_105c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_1061:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1066:  stloc 25

	IL_106a:  nop 
	IL_106b:  nop 
	IL_106c:  ldloc 25

	IL_1070:  nop 
	IL_1071:  nop 
	IL_1072:  ldloc 24

	IL_1076:  nop 
	IL_1077:  nop 
	IL_1078:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_107d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1082:  stloc 26

	IL_1086:  nop 
	IL_1087:  nop 
	IL_1088:  ldloc 26

	IL_108c:  nop 
	IL_108d:  nop 
	IL_108e:  ldc.i4 1
	IL_1093:  beq IL_10d9

	IL_1098:  br IL_109d

	IL_109d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_10a2:  stloc 17

	IL_10a6:  nop 
	IL_10a7:  nop 
	IL_10a8:  ldloc 17

	IL_10ac:  nop 
	IL_10ad:  nop 
	IL_10ae:  ldloc 24

	IL_10b2:  nop 
	IL_10b3:  nop 
	IL_10b4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_10b9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_10be:  ldloc 17

	IL_10c2:  nop 
	IL_10c3:  nop 
	IL_10c4:  ldloc 24

	IL_10c8:  nop 
	IL_10c9:  nop 
	IL_10ca:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_10cf:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_10d4:  br IL_10ea

	IL_10d9:  ldloc 24

	IL_10dd:  nop 
	IL_10de:  nop 
	IL_10df:  stloc 17

	IL_10e3:  nop 
	IL_10e4:  nop 
	IL_10e5:  br IL_10ea

	IL_10ea:  ldarg 1

	IL_10ee:  nop 
	IL_10ef:  nop 
	IL_10f0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_10f5:  ldloc 1

	IL_10f9:  nop 
	IL_10fa:  nop 
	IL_10fb:  conv.u 
	IL_10fc:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1101:  stloc 15

	IL_1105:  nop 
	IL_1106:  nop 
	IL_1107:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::'.ctor'()
	IL_110c:  stloc 46

	IL_1110:  nop 
	IL_1111:  nop 
	IL_1112:  ldloc 46

	IL_1116:  nop 
	IL_1117:  nop 
	IL_1118:  ldloc 17

	IL_111c:  nop 
	IL_111d:  nop 
	IL_111e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_1123:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_1128:  stloc 16

	IL_112c:  nop 
	IL_112d:  nop 
	IL_112e:  ldloc 16

	IL_1132:  nop 
	IL_1133:  nop 
	IL_1134:  ldloc 15

	IL_1138:  nop 
	IL_1139:  nop 
	IL_113a:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_113f:  ldloc 46

	IL_1143:  nop 
	IL_1144:  nop 
	IL_1145:  ldloc 16

	IL_1149:  nop 
	IL_114a:  nop 
	IL_114b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_1150:  ldarg 1

	IL_1154:  nop 
	IL_1155:  nop 
	IL_1156:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_115b:  ldloc 1

	IL_115f:  nop 
	IL_1160:  nop 
	IL_1161:  conv.u 
	IL_1162:  ldloc 46

	IL_1166:  nop 
	IL_1167:  nop 
	IL_1168:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_116d:  br IL_1860

	IL_1172:  br IL_117c

	IL_1177:  br IL_117c

	IL_117c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrTok
	IL_1181:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1186:  stloc 25

	IL_118a:  nop 
	IL_118b:  nop 
	IL_118c:  ldloc 25

	IL_1190:  nop 
	IL_1191:  nop 
	IL_1192:  ldloc 24

	IL_1196:  nop 
	IL_1197:  nop 
	IL_1198:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_119d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_11a2:  stloc 26

	IL_11a6:  nop 
	IL_11a7:  nop 
	IL_11a8:  ldloc 26

	IL_11ac:  nop 
	IL_11ad:  nop 
	IL_11ae:  ldc.i4 1
	IL_11b3:  beq IL_11bd

	IL_11b8:  br IL_13bf

	IL_11bd:  ldarg 1

	IL_11c1:  nop 
	IL_11c2:  nop 
	IL_11c3:  ldloc 1

	IL_11c7:  nop 
	IL_11c8:  nop 
	IL_11c9:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_11ce:  ldloc 0

	IL_11d2:  nop 
	IL_11d3:  nop 
	IL_11d4:  ldc.i4 1
	IL_11d9:  sub 
	IL_11da:  stloc 0

	IL_11de:  nop 
	IL_11df:  nop 
	IL_11e0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok::'.ctor'()
	IL_11e5:  stloc 14

	IL_11e9:  nop 
	IL_11ea:  nop 
	IL_11eb:  ldarg.0 
	IL_11ec:  ldarg 1

	IL_11f0:  nop 
	IL_11f1:  nop 
	IL_11f2:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_11f7:  ldloc 1

	IL_11fb:  nop 
	IL_11fc:  nop 
	IL_11fd:  conv.u 
	IL_11fe:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1203:  ldloc 14

	IL_1207:  nop 
	IL_1208:  nop 
	IL_1209:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok class dylan.NET.Tokenizer.Parser.ExprOptimizer::IdentToMNTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok)
	IL_120e:  stloc 14

	IL_1212:  nop 
	IL_1213:  nop 
	IL_1214:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::'.ctor'()
	IL_1219:  stloc 47

	IL_121d:  nop 
	IL_121e:  nop 
	IL_121f:  ldloc 47

	IL_1223:  nop 
	IL_1224:  nop 
	IL_1225:  ldloc 14

	IL_1229:  nop 
	IL_122a:  nop 
	IL_122b:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_1230:  ldarg 1

	IL_1234:  nop 
	IL_1235:  nop 
	IL_1236:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_123b:  ldloc 1

	IL_123f:  nop 
	IL_1240:  nop 
	IL_1241:  conv.u 
	IL_1242:  ldloc 47

	IL_1246:  nop 
	IL_1247:  nop 
	IL_1248:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_124d:  ldloc 1

	IL_1251:  nop 
	IL_1252:  nop 
	IL_1253:  ldc.i4 1
	IL_1258:  add 
	IL_1259:  stloc 1

	IL_125d:  nop 
	IL_125e:  nop 
	IL_125f:  ldloc 1

	IL_1263:  nop 
	IL_1264:  nop 
	IL_1265:  ldloc 0

	IL_1269:  nop 
	IL_126a:  nop 
	IL_126b:  ble IL_1275

	IL_1270:  br IL_13b0

	IL_1275:  ldarg 1

	IL_1279:  nop 
	IL_127a:  nop 
	IL_127b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1280:  ldloc 1

	IL_1284:  nop 
	IL_1285:  nop 
	IL_1286:  conv.u 
	IL_1287:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_128c:  stloc 24

	IL_1290:  nop 
	IL_1291:  nop 
	IL_1292:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_1297:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_129c:  stloc 25

	IL_12a0:  nop 
	IL_12a1:  nop 
	IL_12a2:  ldloc 25

	IL_12a6:  nop 
	IL_12a7:  nop 
	IL_12a8:  ldloc 24

	IL_12ac:  nop 
	IL_12ad:  nop 
	IL_12ae:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_12b3:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_12b8:  stloc 26

	IL_12bc:  nop 
	IL_12bd:  nop 
	IL_12be:  ldloc 26

	IL_12c2:  nop 
	IL_12c3:  nop 
	IL_12c4:  ldc.i4 1
	IL_12c9:  beq IL_12d3

	IL_12ce:  br IL_13a6

	IL_12d3:  ldarg 1

	IL_12d7:  nop 
	IL_12d8:  nop 
	IL_12d9:  ldloc 1

	IL_12dd:  nop 
	IL_12de:  nop 
	IL_12df:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_12e4:  ldloc 0

	IL_12e8:  nop 
	IL_12e9:  nop 
	IL_12ea:  ldc.i4 1
	IL_12ef:  sub 
	IL_12f0:  stloc 0

	IL_12f4:  nop 
	IL_12f5:  nop 
	IL_12f6:  ldloc 1

	IL_12fa:  nop 
	IL_12fb:  nop 
	IL_12fc:  ldloc 0

	IL_1300:  nop 
	IL_1301:  nop 
	IL_1302:  ble IL_130c

	IL_1307:  br IL_139c

	IL_130c:  ldarg 1

	IL_1310:  nop 
	IL_1311:  nop 
	IL_1312:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1317:  ldloc 1

	IL_131b:  nop 
	IL_131c:  nop 
	IL_131d:  conv.u 
	IL_131e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1323:  stloc 24

	IL_1327:  nop 
	IL_1328:  nop 
	IL_1329:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_132e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1333:  stloc 25

	IL_1337:  nop 
	IL_1338:  nop 
	IL_1339:  ldloc 25

	IL_133d:  nop 
	IL_133e:  nop 
	IL_133f:  ldloc 24

	IL_1343:  nop 
	IL_1344:  nop 
	IL_1345:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_134a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_134f:  stloc 26

	IL_1353:  nop 
	IL_1354:  nop 
	IL_1355:  ldloc 26

	IL_1359:  nop 
	IL_135a:  nop 
	IL_135b:  ldc.i4 1
	IL_1360:  beq IL_136a

	IL_1365:  br IL_1392

	IL_136a:  ldarg 1

	IL_136e:  nop 
	IL_136f:  nop 
	IL_1370:  ldloc 1

	IL_1374:  nop 
	IL_1375:  nop 
	IL_1376:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_137b:  ldloc 0

	IL_137f:  nop 
	IL_1380:  nop 
	IL_1381:  ldc.i4 1
	IL_1386:  sub 
	IL_1387:  stloc 0

	IL_138b:  nop 
	IL_138c:  nop 
	IL_138d:  br IL_1397

	IL_1392:  br IL_1397

	IL_1397:  br IL_13a1

	IL_139c:  br IL_13a1

	IL_13a1:  br IL_13ab

	IL_13a6:  br IL_13ab

	IL_13ab:  br IL_13b5

	IL_13b0:  br IL_13b5

	IL_13b5:  br IL_1860

	IL_13ba:  br IL_13c4

	IL_13bf:  br IL_13c4

	IL_13c4:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_13c9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_13ce:  stloc 25

	IL_13d2:  nop 
	IL_13d3:  nop 
	IL_13d4:  ldloc 25

	IL_13d8:  nop 
	IL_13d9:  nop 
	IL_13da:  ldloc 24

	IL_13de:  nop 
	IL_13df:  nop 
	IL_13e0:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_13e5:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_13ea:  stloc 26

	IL_13ee:  nop 
	IL_13ef:  nop 
	IL_13f0:  ldloc 26

	IL_13f4:  nop 
	IL_13f5:  nop 
	IL_13f6:  ldc.i4 1
	IL_13fb:  beq IL_1405

	IL_1400:  br IL_15fc

	IL_1405:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_140a:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_140f:  or 
	IL_1410:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1415:  or 
	IL_1416:  stloc 26

	IL_141a:  nop 
	IL_141b:  nop 
	IL_141c:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1421:  ldc.i4 1
	IL_1426:  beq IL_1430

	IL_142b:  br IL_15cc

	IL_1430:  ldc.i4 0
	IL_1435:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_143a:  ldloc 26

	IL_143e:  nop 
	IL_143f:  nop 
	IL_1440:  ldc.i4 1
	IL_1445:  beq IL_144f

	IL_144a:  br IL_145f

	IL_144f:  ldc.i4 1
	IL_1454:  stloc 4

	IL_1458:  nop 
	IL_1459:  nop 
	IL_145a:  br IL_1464

	IL_145f:  br IL_1464

	IL_1464:  ldc.i4 1
	IL_1469:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_146e:  ldarg.0 
	IL_146f:  ldarg 1

	IL_1473:  nop 
	IL_1474:  nop 
	IL_1475:  ldloc 1

	IL_1479:  nop 
	IL_147a:  nop 
	IL_147b:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMethodCall(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_1480:  starg 1

	IL_1484:  nop 
	IL_1485:  nop 
	IL_1486:  ldloc 1

	IL_148a:  nop 
	IL_148b:  nop 
	IL_148c:  ldc.i4 1
	IL_1491:  sub 
	IL_1492:  stloc 1

	IL_1496:  nop 
	IL_1497:  nop 
	IL_1498:  ldarg 1

	IL_149c:  nop 
	IL_149d:  nop 
	IL_149e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_14a3:  ldlen 
	IL_14a4:  conv.i4 
	IL_14a5:  ldc.i4 1
	IL_14aa:  sub 
	IL_14ab:  stloc 0

	IL_14af:  nop 
	IL_14b0:  nop 
	IL_14b1:  ldarg 1

	IL_14b5:  nop 
	IL_14b6:  nop 
	IL_14b7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_14bc:  ldloc 1

	IL_14c0:  nop 
	IL_14c1:  nop 
	IL_14c2:  conv.u 
	IL_14c3:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_14c8:  stloc 48

	IL_14cc:  nop 
	IL_14cd:  nop 
	IL_14ce:  ldloc 48

	IL_14d2:  nop 
	IL_14d3:  nop 
	IL_14d4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_14d9:  stloc 49

	IL_14dd:  nop 
	IL_14de:  nop 
	IL_14df:  ldloc 49

	IL_14e3:  nop 
	IL_14e4:  nop 
	IL_14e5:  ldlen 
	IL_14e6:  conv.i4 
	IL_14e7:  ldc.i4 1
	IL_14ec:  sub 
	IL_14ed:  stloc 50

	IL_14f1:  nop 
	IL_14f2:  nop 
	IL_14f3:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_14f8:  stloc 5

	IL_14fc:  nop 
	IL_14fd:  nop 
	IL_14fe:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1503:  stloc 6

	IL_1507:  nop 
	IL_1508:  nop 
	IL_1509:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_150e:  stloc 7

	IL_1512:  nop 
	IL_1513:  nop 
	IL_1514:  ldc.i4 -1
	IL_1519:  stloc 51

	IL_151d:  nop 
	IL_151e:  nop 
	IL_151f:  ldloc 50

	IL_1523:  nop 
	IL_1524:  nop 
	IL_1525:  ldc.i4 0
	IL_152a:  blt IL_1534

	IL_152f:  br IL_153e

	IL_1534:  br IL_15c7

	IL_1539:  br IL_1543

	IL_153e:  br IL_1543

	IL_1543:  ldloc 51

	IL_1547:  nop 
	IL_1548:  nop 
	IL_1549:  ldc.i4 1
	IL_154e:  add 
	IL_154f:  stloc 51

	IL_1553:  nop 
	IL_1554:  nop 
	IL_1555:  ldc.i4 0
	IL_155a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_155f:  ldc.i4 0
	IL_1564:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1569:  ldc.i4 0
	IL_156e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1573:  ldloc 49

	IL_1577:  nop 
	IL_1578:  nop 
	IL_1579:  ldloc 51

	IL_157d:  nop 
	IL_157e:  nop 
	IL_157f:  conv.u 
	IL_1580:  ldarg.0 
	IL_1581:  ldloc 49

	IL_1585:  nop 
	IL_1586:  nop 
	IL_1587:  ldloc 51

	IL_158b:  nop 
	IL_158c:  nop 
	IL_158d:  conv.u 
	IL_158e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1593:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1598:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_159d:  ldloc 51

	IL_15a1:  nop 
	IL_15a2:  nop 
	IL_15a3:  ldloc 50

	IL_15a7:  nop 
	IL_15a8:  nop 
	IL_15a9:  beq IL_15b3

	IL_15ae:  br IL_15bd

	IL_15b3:  br IL_15c7

	IL_15b8:  br IL_15c7

	IL_15bd:  br IL_1543

	IL_15c2:  br IL_15c7

	IL_15c7:  br IL_15d1

	IL_15cc:  br IL_15d1

	IL_15d1:  ldloc 5

	IL_15d5:  nop 
	IL_15d6:  nop 
	IL_15d7:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_15dc:  ldloc 6

	IL_15e0:  nop 
	IL_15e1:  nop 
	IL_15e2:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_15e7:  ldloc 7

	IL_15eb:  nop 
	IL_15ec:  nop 
	IL_15ed:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_15f2:  br IL_1860

	IL_15f7:  br IL_1601

	IL_15fc:  br IL_1601

	IL_1601:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LSParen
	IL_1606:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_160b:  stloc 25

	IL_160f:  nop 
	IL_1610:  nop 
	IL_1611:  ldloc 25

	IL_1615:  nop 
	IL_1616:  nop 
	IL_1617:  ldloc 24

	IL_161b:  nop 
	IL_161c:  nop 
	IL_161d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1622:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1627:  stloc 26

	IL_162b:  nop 
	IL_162c:  nop 
	IL_162d:  ldloc 26

	IL_1631:  nop 
	IL_1632:  nop 
	IL_1633:  ldc.i4 1
	IL_1638:  beq IL_1642

	IL_163d:  br IL_1813

	IL_1642:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1647:  ldc.i4 1
	IL_164c:  beq IL_1656

	IL_1651:  br IL_16e8

	IL_1656:  ldc.i4 0
	IL_165b:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1660:  ldarg.0 
	IL_1661:  ldarg 1

	IL_1665:  nop 
	IL_1666:  nop 
	IL_1667:  ldloc 1

	IL_166b:  nop 
	IL_166c:  nop 
	IL_166d:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procIdentArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_1672:  starg 1

	IL_1676:  nop 
	IL_1677:  nop 
	IL_1678:  ldloc 1

	IL_167c:  nop 
	IL_167d:  nop 
	IL_167e:  ldc.i4 1
	IL_1683:  sub 
	IL_1684:  stloc 1

	IL_1688:  nop 
	IL_1689:  nop 
	IL_168a:  ldarg 1

	IL_168e:  nop 
	IL_168f:  nop 
	IL_1690:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1695:  ldlen 
	IL_1696:  conv.i4 
	IL_1697:  ldc.i4 1
	IL_169c:  sub 
	IL_169d:  stloc 0

	IL_16a1:  nop 
	IL_16a2:  nop 
	IL_16a3:  ldarg 1

	IL_16a7:  nop 
	IL_16a8:  nop 
	IL_16a9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_16ae:  ldloc 1

	IL_16b2:  nop 
	IL_16b3:  nop 
	IL_16b4:  conv.u 
	IL_16b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_16ba:  stloc 52

	IL_16be:  nop 
	IL_16bf:  nop 
	IL_16c0:  ldloc 52

	IL_16c4:  nop 
	IL_16c5:  nop 
	IL_16c6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_16cb:  stloc 53

	IL_16cf:  nop 
	IL_16d0:  nop 
	IL_16d1:  ldarg.0 
	IL_16d2:  ldloc 53

	IL_16d6:  nop 
	IL_16d7:  nop 
	IL_16d8:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_16dd:  stloc 53

	IL_16e1:  nop 
	IL_16e2:  nop 
	IL_16e3:  br IL_1809

	IL_16e8:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_16ed:  ldc.i4 1
	IL_16f2:  beq IL_16fc

	IL_16f7:  br IL_17ff

	IL_16fc:  ldc.i4 0
	IL_1701:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1706:  ldarg.0 
	IL_1707:  ldarg 1

	IL_170b:  nop 
	IL_170c:  nop 
	IL_170d:  ldloc 1

	IL_1711:  nop 
	IL_1712:  nop 
	IL_1713:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::procMtdArrayAccess(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr, int32)
	IL_1718:  starg 1

	IL_171c:  nop 
	IL_171d:  nop 
	IL_171e:  ldloc 1

	IL_1722:  nop 
	IL_1723:  nop 
	IL_1724:  ldc.i4 1
	IL_1729:  sub 
	IL_172a:  stloc 1

	IL_172e:  nop 
	IL_172f:  nop 
	IL_1730:  ldarg 1

	IL_1734:  nop 
	IL_1735:  nop 
	IL_1736:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_173b:  ldlen 
	IL_173c:  conv.i4 
	IL_173d:  ldc.i4 1
	IL_1742:  sub 
	IL_1743:  stloc 0

	IL_1747:  nop 
	IL_1748:  nop 
	IL_1749:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_174e:  stloc 5

	IL_1752:  nop 
	IL_1753:  nop 
	IL_1754:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1759:  stloc 6

	IL_175d:  nop 
	IL_175e:  nop 
	IL_175f:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1764:  stloc 7

	IL_1768:  nop 
	IL_1769:  nop 
	IL_176a:  ldarg 1

	IL_176e:  nop 
	IL_176f:  nop 
	IL_1770:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1775:  ldloc 1

	IL_1779:  nop 
	IL_177a:  nop 
	IL_177b:  conv.u 
	IL_177c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1781:  stloc 54

	IL_1785:  nop 
	IL_1786:  nop 
	IL_1787:  ldloc 54

	IL_178b:  nop 
	IL_178c:  nop 
	IL_178d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1792:  stloc 55

	IL_1796:  nop 
	IL_1797:  nop 
	IL_1798:  ldloc 55

	IL_179c:  nop 
	IL_179d:  nop 
	IL_179e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_17a3:  stloc 53

	IL_17a7:  nop 
	IL_17a8:  nop 
	IL_17a9:  ldc.i4 0
	IL_17ae:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_17b3:  ldc.i4 0
	IL_17b8:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_17bd:  ldc.i4 0
	IL_17c2:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_17c7:  ldarg.0 
	IL_17c8:  ldloc 53

	IL_17cc:  nop 
	IL_17cd:  nop 
	IL_17ce:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.Parser.ExprOptimizer::Optimize(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_17d3:  stloc 53

	IL_17d7:  nop 
	IL_17d8:  nop 
	IL_17d9:  ldloc 5

	IL_17dd:  nop 
	IL_17de:  nop 
	IL_17df:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_17e4:  ldloc 6

	IL_17e8:  nop 
	IL_17e9:  nop 
	IL_17ea:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_17ef:  ldloc 7

	IL_17f3:  nop 
	IL_17f4:  nop 
	IL_17f5:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_17fa:  br IL_1804

	IL_17ff:  br IL_1804

	IL_1804:  br IL_1809

	IL_1809:  br IL_1860

	IL_180e:  br IL_1818

	IL_1813:  br IL_1818

	IL_1818:  ldloc 1

	IL_181c:  nop 
	IL_181d:  nop 
	IL_181e:  ldloc 2

	IL_1822:  nop 
	IL_1823:  nop 
	IL_1824:  bgt IL_182e

	IL_1829:  br IL_1851

	IL_182e:  ldc.i4 0
	IL_1833:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1838:  ldc.i4 0
	IL_183d:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1842:  ldc.i4 0
	IL_1847:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_184c:  br IL_1856

	IL_1851:  br IL_1856

	IL_1856:  br IL_1860

	IL_185b:  br IL_1860

	IL_1860:  ldloc 1

	IL_1864:  nop 
	IL_1865:  nop 
	IL_1866:  ldloc 0

	IL_186a:  nop 
	IL_186b:  nop 
	IL_186c:  bge IL_1876

	IL_1871:  br IL_1880

	IL_1876:  br IL_1d08

	IL_187b:  br IL_188a

	IL_1880:  br IL_00fe

	IL_1885:  br IL_188a

	IL_188a:  br IL_1d08

	IL_188f:  ldloc 1

	IL_1893:  nop 
	IL_1894:  nop 
	IL_1895:  ldc.i4 1
	IL_189a:  sub 
	IL_189b:  stloc 1

	IL_189f:  nop 
	IL_18a0:  nop 
	IL_18a1:  ldarg 1

	IL_18a5:  nop 
	IL_18a6:  nop 
	IL_18a7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_18ac:  ldloc 1

	IL_18b0:  nop 
	IL_18b1:  nop 
	IL_18b2:  conv.u 
	IL_18b3:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_18b8:  stloc 8

	IL_18bc:  nop 
	IL_18bd:  nop 
	IL_18be:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_18c3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_18c8:  stloc 25

	IL_18cc:  nop 
	IL_18cd:  nop 
	IL_18ce:  ldloc 25

	IL_18d2:  nop 
	IL_18d3:  nop 
	IL_18d4:  ldloc 8

	IL_18d8:  nop 
	IL_18d9:  nop 
	IL_18da:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_18df:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_18e4:  stloc 26

	IL_18e8:  nop 
	IL_18e9:  nop 
	IL_18ea:  ldloc 26

	IL_18ee:  nop 
	IL_18ef:  nop 
	IL_18f0:  ldc.i4 1
	IL_18f5:  beq IL_18ff

	IL_18fa:  br IL_1a27

	IL_18ff:  ldloc 8

	IL_1903:  nop 
	IL_1904:  nop 
	IL_1905:  stloc 19

	IL_1909:  nop 
	IL_190a:  nop 
	IL_190b:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1910:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1915:  or 
	IL_1916:  stloc 26

	IL_191a:  nop 
	IL_191b:  nop 
	IL_191c:  ldloc 26

	IL_1920:  nop 
	IL_1921:  nop 
	IL_1922:  ldc.i4 1
	IL_1927:  beq IL_1931

	IL_192c:  br IL_19c8

	IL_1931:  ldc.i4 0
	IL_1936:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_193b:  ldc.i4 0
	IL_1940:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1945:  ldloc 1

	IL_1949:  nop 
	IL_194a:  nop 
	IL_194b:  ldc.i4 1
	IL_1950:  add 
	IL_1951:  stloc 23

	IL_1955:  nop 
	IL_1956:  nop 
	IL_1957:  ldarg 1

	IL_195b:  nop 
	IL_195c:  nop 
	IL_195d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1962:  ldloc 23

	IL_1966:  nop 
	IL_1967:  nop 
	IL_1968:  conv.u 
	IL_1969:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_196e:  stloc 18

	IL_1972:  nop 
	IL_1973:  nop 
	IL_1974:  ldloc 19

	IL_1978:  nop 
	IL_1979:  nop 
	IL_197a:  ldc.i4 1
	IL_197f:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1984:  ldloc 19

	IL_1988:  nop 
	IL_1989:  nop 
	IL_198a:  ldloc 18

	IL_198e:  nop 
	IL_198f:  nop 
	IL_1990:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_1995:  ldarg 1

	IL_1999:  nop 
	IL_199a:  nop 
	IL_199b:  ldloc 23

	IL_199f:  nop 
	IL_19a0:  nop 
	IL_19a1:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_19a6:  ldarg 1

	IL_19aa:  nop 
	IL_19ab:  nop 
	IL_19ac:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_19b1:  ldloc 1

	IL_19b5:  nop 
	IL_19b6:  nop 
	IL_19b7:  conv.u 
	IL_19b8:  ldloc 19

	IL_19bc:  nop 
	IL_19bd:  nop 
	IL_19be:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_19c3:  br IL_19cd

	IL_19c8:  br IL_19cd

	IL_19cd:  ldloc 19

	IL_19d1:  nop 
	IL_19d2:  nop 
	IL_19d3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_19d8:  stloc 27

	IL_19dc:  nop 
	IL_19dd:  nop 
	IL_19de:  ldloc 27

	IL_19e2:  nop 
	IL_19e3:  nop 
	IL_19e4:  ldstr "^::(.)*$"
	IL_19e9:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_19ee:  stloc 26

	IL_19f2:  nop 
	IL_19f3:  nop 
	IL_19f4:  ldloc 26

	IL_19f8:  nop 
	IL_19f9:  nop 
	IL_19fa:  ldc.i4 1
	IL_19ff:  beq IL_1a09

	IL_1a04:  br IL_1a18

	IL_1a09:  ldc.i4 1
	IL_1a0e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1a13:  br IL_1a1d

	IL_1a18:  br IL_1a1d

	IL_1a1d:  br IL_1cda

	IL_1a22:  br IL_1a2c

	IL_1a27:  br IL_1a2c

	IL_1a2c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_1a31:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1a36:  stloc 25

	IL_1a3a:  nop 
	IL_1a3b:  nop 
	IL_1a3c:  ldloc 25

	IL_1a40:  nop 
	IL_1a41:  nop 
	IL_1a42:  ldloc 8

	IL_1a46:  nop 
	IL_1a47:  nop 
	IL_1a48:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1a4d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1a52:  stloc 26

	IL_1a56:  nop 
	IL_1a57:  nop 
	IL_1a58:  ldloc 26

	IL_1a5c:  nop 
	IL_1a5d:  nop 
	IL_1a5e:  ldc.i4 1
	IL_1a63:  beq IL_1a6d

	IL_1a68:  br IL_1bb7

	IL_1a6d:  ldloc 8

	IL_1a71:  nop 
	IL_1a72:  nop 
	IL_1a73:  stloc 20

	IL_1a77:  nop 
	IL_1a78:  nop 
	IL_1a79:  ldloc 20

	IL_1a7d:  nop 
	IL_1a7e:  nop 
	IL_1a7f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1a84:  stloc 21

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

	IL_1aab:  br IL_1b58

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
	IL_1af3:  ldloc 21

	IL_1af7:  nop 
	IL_1af8:  nop 
	IL_1af9:  ldc.i4 1
	IL_1afe:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1b03:  ldloc 21

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
	IL_1b25:  ldloc 20

	IL_1b29:  nop 
	IL_1b2a:  nop 
	IL_1b2b:  ldloc 21

	IL_1b2f:  nop 
	IL_1b30:  nop 
	IL_1b31:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_1b36:  ldarg 1

	IL_1b3a:  nop 
	IL_1b3b:  nop 
	IL_1b3c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1b41:  ldloc 1

	IL_1b45:  nop 
	IL_1b46:  nop 
	IL_1b47:  conv.u 
	IL_1b48:  ldloc 20

	IL_1b4c:  nop 
	IL_1b4d:  nop 
	IL_1b4e:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1b53:  br IL_1b5d

	IL_1b58:  br IL_1b5d

	IL_1b5d:  ldloc 21

	IL_1b61:  nop 
	IL_1b62:  nop 
	IL_1b63:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b68:  stloc 27

	IL_1b6c:  nop 
	IL_1b6d:  nop 
	IL_1b6e:  ldloc 27

	IL_1b72:  nop 
	IL_1b73:  nop 
	IL_1b74:  ldstr "^::(.)*$"
	IL_1b79:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1b7e:  stloc 26

	IL_1b82:  nop 
	IL_1b83:  nop 
	IL_1b84:  ldloc 26

	IL_1b88:  nop 
	IL_1b89:  nop 
	IL_1b8a:  ldc.i4 1
	IL_1b8f:  beq IL_1b99

	IL_1b94:  br IL_1ba8

	IL_1b99:  ldc.i4 1
	IL_1b9e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1ba3:  br IL_1bad

	IL_1ba8:  br IL_1bad

	IL_1bad:  br IL_1cda

	IL_1bb2:  br IL_1bbc

	IL_1bb7:  br IL_1bbc

	IL_1bbc:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_1bc1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1bc6:  stloc 25

	IL_1bca:  nop 
	IL_1bcb:  nop 
	IL_1bcc:  ldloc 25

	IL_1bd0:  nop 
	IL_1bd1:  nop 
	IL_1bd2:  ldloc 8

	IL_1bd6:  nop 
	IL_1bd7:  nop 
	IL_1bd8:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1bdd:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1be2:  stloc 26

	IL_1be6:  nop 
	IL_1be7:  nop 
	IL_1be8:  ldloc 26

	IL_1bec:  nop 
	IL_1bed:  nop 
	IL_1bee:  ldc.i4 1
	IL_1bf3:  beq IL_1bfd

	IL_1bf8:  br IL_1cd5

	IL_1bfd:  ldloc 8

	IL_1c01:  nop 
	IL_1c02:  nop 
	IL_1c03:  stloc 22

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

	IL_1c2a:  br IL_1cc6

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
	IL_1c72:  ldloc 22

	IL_1c76:  nop 
	IL_1c77:  nop 
	IL_1c78:  ldc.i4 1
	IL_1c7d:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_1c82:  ldloc 22

	IL_1c86:  nop 
	IL_1c87:  nop 
	IL_1c88:  ldloc 18

	IL_1c8c:  nop 
	IL_1c8d:  nop 
	IL_1c8e:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_1c93:  ldarg 1

	IL_1c97:  nop 
	IL_1c98:  nop 
	IL_1c99:  ldloc 23

	IL_1c9d:  nop 
	IL_1c9e:  nop 
	IL_1c9f:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_1ca4:  ldarg 1

	IL_1ca8:  nop 
	IL_1ca9:  nop 
	IL_1caa:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1caf:  ldloc 1

	IL_1cb3:  nop 
	IL_1cb4:  nop 
	IL_1cb5:  conv.u 
	IL_1cb6:  ldloc 22

	IL_1cba:  nop 
	IL_1cbb:  nop 
	IL_1cbc:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1cc1:  br IL_1ccb

	IL_1cc6:  br IL_1ccb

	IL_1ccb:  br IL_1cda

	IL_1cd0:  br IL_1cda

	IL_1cd5:  br IL_1cda

	IL_1cda:  ldloc 1

	IL_1cde:  nop 
	IL_1cdf:  nop 
	IL_1ce0:  ldc.i4 0
	IL_1ce5:  ble IL_1cef

	IL_1cea:  br IL_1cf9

	IL_1cef:  br IL_1d08

	IL_1cf4:  br IL_1d03

	IL_1cf9:  br IL_00fe

	IL_1cfe:  br IL_1d03

	IL_1d03:  br IL_1d08

	IL_1d08:  ldsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1d0d:  ldc.i4 0
	IL_1d12:  beq IL_1d1c

	IL_1d17:  br IL_1d97

	IL_1d1c:  ldloc 4

	IL_1d20:  nop 
	IL_1d21:  nop 
	IL_1d22:  ldc.i4 1
	IL_1d27:  beq IL_1d31

	IL_1d2c:  br IL_1d8d

	IL_1d31:  ldc.i4 1
	IL_1d36:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1d3b:  ldarg 1

	IL_1d3f:  nop 
	IL_1d40:  nop 
	IL_1d41:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1d46:  ldlen 
	IL_1d47:  conv.i4 
	IL_1d48:  stloc 0

	IL_1d4c:  nop 
	IL_1d4d:  nop 
	IL_1d4e:  ldloc 0

	IL_1d52:  nop 
	IL_1d53:  nop 
	IL_1d54:  stloc 1

	IL_1d58:  nop 
	IL_1d59:  nop 
	IL_1d5a:  ldc.i4 0
	IL_1d5f:  stloc 4

	IL_1d63:  nop 
	IL_1d64:  nop 
	IL_1d65:  ldc.i4 0
	IL_1d6a:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1d6f:  ldc.i4 0
	IL_1d74:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1d79:  ldc.i4 0
	IL_1d7e:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1d83:  br IL_00fe

	IL_1d88:  br IL_1d92

	IL_1d8d:  br IL_1d92

	IL_1d92:  br IL_1da6

	IL_1d97:  ldc.i4 0
	IL_1d9c:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetChainFlag
	IL_1da1:  br IL_1da6

	IL_1da6:  ldc.i4 0
	IL_1dab:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::MetCallFlag
	IL_1db0:  ldc.i4 0
	IL_1db5:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::IdentFlag
	IL_1dba:  ldc.i4 0
	IL_1dbf:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::StringFlag
	IL_1dc4:  ldarg 1

	IL_1dc8:  nop 
	IL_1dc9:  nop 
	IL_1dca:  ret 
    } // end of method ExprOptimizer::Optimize

    // method line 18
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xa6c4
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
        // Method begins at RVA 0xa6d8
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
        // Method begins at RVA 0xa7b4
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
        // Method begins at RVA 0xa98c
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
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkLabel (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xab64
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

    // method line 23
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkPlace (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xac40
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

    // method line 24
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkGoto (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xad1c
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

    // method line 25
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkDebug (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xadf8
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

    // method line 26
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkScope (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xaee0
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

    // method line 27
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkImport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xafc8
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

    // method line 28
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkLocimport (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb0a4
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

    // method line 29
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkReturn (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb180
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

    // method line 30
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkCmt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb360
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

    // method line 31
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkElse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb41c
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

    // method line 32
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndIf (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb50c
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

    // method line 33
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndMtd (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb648
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

    // method line 34
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkEndCls (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb784
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

    // method line 35
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssembly (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb8c0
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

    // method line 36
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVer (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xb9c0
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

    // method line 37
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkClass (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xbd1c
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

    // method line 38
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkField (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc05c
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

    // method line 39
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethod (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xc3b0
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

    // method line 40
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkMethodCall (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xcac4
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

    // method line 41
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkVarAs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd014
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

    // method line 42
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt AssOpt (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xd238
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

    // method line 43
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt checkAssign (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, bool& b)  cil managed 
    {
        // Method begins at RVA 0xd45c
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

    // method line 44
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt Optimize (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm)  cil managed 
    {
        // Method begins at RVA 0xd760
	// Code size 2115 (0x843)
	.maxstack 110
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

	IL_016d:  br IL_083c

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
	IL_01b5:  br IL_083c

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
	IL_01fd:  br IL_083c

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
	IL_0245:  br IL_083c

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
	IL_028d:  br IL_083c

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
	IL_02d5:  br IL_083c

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
	IL_031d:  br IL_083c

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
	IL_0365:  br IL_083c

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
	IL_03ad:  br IL_083c

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
	IL_03f5:  br IL_083c

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
	IL_043d:  br IL_083c

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
	IL_0485:  br IL_083c

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
	IL_04cd:  br IL_083c

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
	IL_0515:  br IL_083c

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
	IL_055d:  br IL_083c

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
	IL_05a5:  br IL_083c

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
	IL_05ed:  br IL_083c

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
	IL_0635:  br IL_083c

	IL_063a:  br IL_0644

	IL_063f:  br IL_0644

	IL_0644:  ldarg.0 
	IL_0645:  ldarg 1

	IL_0649:  nop 
	IL_064a:  nop 
	IL_064b:  ldloca 4

	IL_064f:  nop 
	IL_0650:  nop 
	IL_0651:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkLabel(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_067d:  br IL_083c

	IL_0682:  br IL_068c

	IL_0687:  br IL_068c

	IL_068c:  ldarg.0 
	IL_068d:  ldarg 1

	IL_0691:  nop 
	IL_0692:  nop 
	IL_0693:  ldloca 4

	IL_0697:  nop 
	IL_0698:  nop 
	IL_0699:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkPlace(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_06c5:  br IL_083c

	IL_06ca:  br IL_06d4

	IL_06cf:  br IL_06d4

	IL_06d4:  ldarg.0 
	IL_06d5:  ldarg 1

	IL_06d9:  nop 
	IL_06da:  nop 
	IL_06db:  ldloca 4

	IL_06df:  nop 
	IL_06e0:  nop 
	IL_06e1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkGoto(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_070d:  br IL_083c

	IL_0712:  br IL_071c

	IL_0717:  br IL_071c

	IL_071c:  ldarg.0 
	IL_071d:  ldarg 1

	IL_0721:  nop 
	IL_0722:  nop 
	IL_0723:  ldloca 4

	IL_0727:  nop 
	IL_0728:  nop 
	IL_0729:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_0755:  br IL_083c

	IL_075a:  br IL_0764

	IL_075f:  br IL_0764

	IL_0764:  ldarg.0 
	IL_0765:  ldarg 1

	IL_0769:  nop 
	IL_076a:  nop 
	IL_076b:  ldloca 4

	IL_076f:  nop 
	IL_0770:  nop 
	IL_0771:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElseIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_079d:  br IL_083c

	IL_07a2:  br IL_07ac

	IL_07a7:  br IL_07ac

	IL_07ac:  ldarg.0 
	IL_07ad:  ldarg 1

	IL_07b1:  nop 
	IL_07b2:  nop 
	IL_07b3:  ldloca 4

	IL_07b7:  nop 
	IL_07b8:  nop 
	IL_07b9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkElse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_07e5:  br IL_083c

	IL_07ea:  br IL_07f4

	IL_07ef:  br IL_07f4

	IL_07f4:  ldarg.0 
	IL_07f5:  ldarg 1

	IL_07f9:  nop 
	IL_07fa:  nop 
	IL_07fb:  ldloca 4

	IL_07ff:  nop 
	IL_0800:  nop 
	IL_0801:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt class dylan.NET.Tokenizer.Parser.StmtOptimizer::checkEndIf(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, [out] bool&)
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
	IL_082d:  br IL_083c

	IL_0832:  br IL_083c

	IL_0837:  br IL_083c

	IL_083c:  ldarg 1

	IL_0840:  nop 
	IL_0841:  nop 
	IL_0842:  ret 
    } // end of method StmtOptimizer::Optimize

    // method line 45
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xdfb0
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

    // method line 46
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet Parse (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet stms)  cil managed 
    {
        // Method begins at RVA 0xdfc4
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

    // method line 47
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xe090
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Parser::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.Parser
}

