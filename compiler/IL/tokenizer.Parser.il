.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:7:7
}
.assembly extern dnu
{
  .ver 11:2:7:7
}
.assembly 'tokenizer.Parser'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 37 2E 37 00 00 ) // ...11.2.7.7..

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
  .ver  11:2:7:7
}

.module tokenizer.Parser.dll // GUID = {445C03BC-CA71-4378-A9A9-B6BE87139DBE}


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
	// Code size 19430 (0x4be6)
	.maxstack 516
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr	V_73,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr	V_74,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr	V_75,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr	V_76,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok	V_77,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok	V_78,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok	V_79,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok	V_80,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok	V_81,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok	V_82,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok	V_83,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok	V_84,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok	V_85,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok	V_86,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok	V_88,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok	V_89,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok	V_92,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok	V_93,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok	V_94,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_95,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_96,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_97,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_98,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_99,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_100,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_101,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_102,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_103,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral	V_104,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral	V_105,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_106,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral	V_107,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral	V_108,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral	V_109,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral	V_110,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral	V_111,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral	V_112,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_113,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_114)
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
	IL_00b0:  br IL_4bdf

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
	IL_0132:  br IL_4bdf

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
	IL_01b4:  br IL_4bdf

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
	IL_0236:  br IL_4bdf

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
	IL_02b8:  br IL_4bdf

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
	IL_033a:  br IL_4bdf

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
	IL_03bc:  br IL_4bdf

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
	IL_043e:  br IL_4bdf

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

	IL_0521:  br IL_4bdf

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
	IL_05a3:  br IL_4bdf

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
	IL_0625:  br IL_4bdf

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
	IL_06a7:  br IL_4bdf

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
	IL_0729:  br IL_4bdf

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
	IL_07ab:  br IL_4bdf

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
	IL_082d:  br IL_4bdf

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
	IL_08af:  br IL_4bdf

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
	IL_0931:  br IL_4bdf

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
	IL_09b3:  br IL_4bdf

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
	IL_0a35:  br IL_4bdf

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
	IL_0ab7:  br IL_4bdf

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
	IL_0b39:  br IL_4bdf

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
	IL_0bbb:  br IL_4bdf

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
	IL_0c3d:  br IL_4bdf

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
	IL_0cbf:  br IL_4bdf

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
	IL_0d41:  br IL_4bdf

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
	IL_0dc3:  br IL_4bdf

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
	IL_0e45:  br IL_4bdf

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
	IL_0ec7:  br IL_4bdf

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
	IL_0f49:  br IL_4bdf

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
	IL_0fcb:  br IL_4bdf

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
	IL_104d:  br IL_4bdf

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
	IL_10cf:  br IL_4bdf

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
	IL_1151:  br IL_4bdf

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
	IL_11d3:  br IL_4bdf

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
	IL_1255:  br IL_4bdf

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
	IL_12d7:  br IL_4bdf

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
	IL_1363:  br IL_4bdf

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
	IL_13ef:  br IL_4bdf

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
	IL_1471:  br IL_4bdf

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
	IL_14fd:  br IL_4bdf

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
	IL_157f:  br IL_4bdf

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
	IL_1601:  br IL_4bdf

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
	IL_168d:  br IL_4bdf

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
	IL_170f:  br IL_4bdf

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
	IL_1791:  br IL_4bdf

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
	IL_181d:  br IL_4bdf

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
	IL_18a9:  br IL_4bdf

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
	IL_192b:  br IL_4bdf

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
	IL_19b7:  br IL_4bdf

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
	IL_1a39:  br IL_4bdf

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
	IL_1abb:  br IL_4bdf

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
	IL_1b3d:  br IL_4bdf

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
	IL_1bbf:  br IL_4bdf

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
	IL_1c41:  br IL_4bdf

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
	IL_1cc3:  br IL_4bdf

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
	IL_1d45:  br IL_4bdf

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
	IL_1dc7:  br IL_4bdf

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
	IL_1e49:  br IL_4bdf

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
	IL_1ecb:  br IL_4bdf

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
	IL_1f4d:  br IL_4bdf

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
	IL_1fcf:  br IL_4bdf

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
	IL_2051:  br IL_4bdf

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
	IL_20d3:  br IL_4bdf

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
	IL_2155:  br IL_4bdf

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
	IL_21d7:  br IL_4bdf

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
	IL_2259:  br IL_4bdf

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
	IL_22db:  br IL_4bdf

	IL_22e0:  br IL_22ea

	IL_22e5:  br IL_22ea

	IL_22ea:  ldarg 1

	IL_22ee:  nop 
	IL_22ef:  nop 
	IL_22f0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22f5:  ldstr "auto"
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

	IL_231a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr::'.ctor'()
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
	IL_235d:  br IL_4bdf

	IL_2362:  br IL_236c

	IL_2367:  br IL_236c

	IL_236c:  ldarg 1

	IL_2370:  nop 
	IL_2371:  nop 
	IL_2372:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2377:  ldstr "autochar"
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

	IL_239c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoClassAttr::'.ctor'()
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
	IL_23df:  br IL_4bdf

	IL_23e4:  br IL_23ee

	IL_23e9:  br IL_23ee

	IL_23ee:  ldarg 1

	IL_23f2:  nop 
	IL_23f3:  nop 
	IL_23f4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_23f9:  ldstr "ansi"
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

	IL_241e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr::'.ctor'()
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
	IL_2461:  br IL_4bdf

	IL_2466:  br IL_2470

	IL_246b:  br IL_2470

	IL_2470:  ldarg 1

	IL_2474:  nop 
	IL_2475:  nop 
	IL_2476:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_247b:  ldstr "beforefieldinit"
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

	IL_24a0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.BeforeFieldInitAttr::'.ctor'()
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
	IL_24e3:  br IL_4bdf

	IL_24e8:  br IL_24f2

	IL_24ed:  br IL_24f2

	IL_24f2:  ldarg 1

	IL_24f6:  nop 
	IL_24f7:  nop 
	IL_24f8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_24fd:  ldstr "string"
	IL_2502:  call int32 string::Compare(string, string)
	IL_2507:  stloc 0

	IL_250b:  nop 
	IL_250c:  nop 
	IL_250d:  ldloc 0

	IL_2511:  nop 
	IL_2512:  nop 
	IL_2513:  ldc.i4 0
	IL_2518:  beq IL_2522

	IL_251d:  br IL_2584

	IL_2522:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.StringTok::'.ctor'()
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
	IL_255f:  ldtoken [mscorlib]System.String
	IL_2564:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2569:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_256e:  ldloc 77

	IL_2572:  nop 
	IL_2573:  nop 
	IL_2574:  starg 1

	IL_2578:  nop 
	IL_2579:  nop 
	IL_257a:  br IL_4bdf

	IL_257f:  br IL_2589

	IL_2584:  br IL_2589

	IL_2589:  ldarg 1

	IL_258d:  nop 
	IL_258e:  nop 
	IL_258f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2594:  ldstr "void"
	IL_2599:  call int32 string::Compare(string, string)
	IL_259e:  stloc 0

	IL_25a2:  nop 
	IL_25a3:  nop 
	IL_25a4:  ldloc 0

	IL_25a8:  nop 
	IL_25a9:  nop 
	IL_25aa:  ldc.i4 0
	IL_25af:  beq IL_25b9

	IL_25b4:  br IL_261b

	IL_25b9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.VoidTok::'.ctor'()
	IL_25be:  stloc 78

	IL_25c2:  nop 
	IL_25c3:  nop 
	IL_25c4:  ldloc 78

	IL_25c8:  nop 
	IL_25c9:  nop 
	IL_25ca:  ldarg 1

	IL_25ce:  nop 
	IL_25cf:  nop 
	IL_25d0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_25d5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_25da:  ldloc 78

	IL_25de:  nop 
	IL_25df:  nop 
	IL_25e0:  ldarg 1

	IL_25e4:  nop 
	IL_25e5:  nop 
	IL_25e6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_25eb:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_25f0:  ldloc 78

	IL_25f4:  nop 
	IL_25f5:  nop 
	IL_25f6:  ldtoken [mscorlib]System.Void
	IL_25fb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2600:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2605:  ldloc 78

	IL_2609:  nop 
	IL_260a:  nop 
	IL_260b:  starg 1

	IL_260f:  nop 
	IL_2610:  nop 
	IL_2611:  br IL_4bdf

	IL_2616:  br IL_2620

	IL_261b:  br IL_2620

	IL_2620:  ldarg 1

	IL_2624:  nop 
	IL_2625:  nop 
	IL_2626:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_262b:  ldstr "decimal"
	IL_2630:  call int32 string::Compare(string, string)
	IL_2635:  stloc 0

	IL_2639:  nop 
	IL_263a:  nop 
	IL_263b:  ldloc 0

	IL_263f:  nop 
	IL_2640:  nop 
	IL_2641:  ldc.i4 0
	IL_2646:  beq IL_2650

	IL_264b:  br IL_26b2

	IL_2650:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DecimalTok::'.ctor'()
	IL_2655:  stloc 79

	IL_2659:  nop 
	IL_265a:  nop 
	IL_265b:  ldloc 79

	IL_265f:  nop 
	IL_2660:  nop 
	IL_2661:  ldarg 1

	IL_2665:  nop 
	IL_2666:  nop 
	IL_2667:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_266c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2671:  ldloc 79

	IL_2675:  nop 
	IL_2676:  nop 
	IL_2677:  ldarg 1

	IL_267b:  nop 
	IL_267c:  nop 
	IL_267d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2682:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2687:  ldloc 79

	IL_268b:  nop 
	IL_268c:  nop 
	IL_268d:  ldtoken [mscorlib]System.Decimal
	IL_2692:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2697:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_269c:  ldloc 79

	IL_26a0:  nop 
	IL_26a1:  nop 
	IL_26a2:  starg 1

	IL_26a6:  nop 
	IL_26a7:  nop 
	IL_26a8:  br IL_4bdf

	IL_26ad:  br IL_26b7

	IL_26b2:  br IL_26b7

	IL_26b7:  ldarg 1

	IL_26bb:  nop 
	IL_26bc:  nop 
	IL_26bd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_26c2:  ldstr "integer"
	IL_26c7:  call int32 string::Compare(string, string)
	IL_26cc:  stloc 0

	IL_26d0:  nop 
	IL_26d1:  nop 
	IL_26d2:  ldloc 0

	IL_26d6:  nop 
	IL_26d7:  nop 
	IL_26d8:  ldc.i4 0
	IL_26dd:  beq IL_26e7

	IL_26e2:  br IL_2749

	IL_26e7:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntegerTok::'.ctor'()
	IL_26ec:  stloc 80

	IL_26f0:  nop 
	IL_26f1:  nop 
	IL_26f2:  ldloc 80

	IL_26f6:  nop 
	IL_26f7:  nop 
	IL_26f8:  ldarg 1

	IL_26fc:  nop 
	IL_26fd:  nop 
	IL_26fe:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2703:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2708:  ldloc 80

	IL_270c:  nop 
	IL_270d:  nop 
	IL_270e:  ldarg 1

	IL_2712:  nop 
	IL_2713:  nop 
	IL_2714:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2719:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_271e:  ldloc 80

	IL_2722:  nop 
	IL_2723:  nop 
	IL_2724:  ldtoken [mscorlib]System.Int32
	IL_2729:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_272e:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2733:  ldloc 80

	IL_2737:  nop 
	IL_2738:  nop 
	IL_2739:  starg 1

	IL_273d:  nop 
	IL_273e:  nop 
	IL_273f:  br IL_4bdf

	IL_2744:  br IL_274e

	IL_2749:  br IL_274e

	IL_274e:  ldarg 1

	IL_2752:  nop 
	IL_2753:  nop 
	IL_2754:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2759:  ldstr "intptr"
	IL_275e:  call int32 string::Compare(string, string)
	IL_2763:  stloc 0

	IL_2767:  nop 
	IL_2768:  nop 
	IL_2769:  ldloc 0

	IL_276d:  nop 
	IL_276e:  nop 
	IL_276f:  ldc.i4 0
	IL_2774:  beq IL_277e

	IL_2779:  br IL_27e0

	IL_277e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.IntPtrTok::'.ctor'()
	IL_2783:  stloc 81

	IL_2787:  nop 
	IL_2788:  nop 
	IL_2789:  ldloc 81

	IL_278d:  nop 
	IL_278e:  nop 
	IL_278f:  ldarg 1

	IL_2793:  nop 
	IL_2794:  nop 
	IL_2795:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_279a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_279f:  ldloc 81

	IL_27a3:  nop 
	IL_27a4:  nop 
	IL_27a5:  ldarg 1

	IL_27a9:  nop 
	IL_27aa:  nop 
	IL_27ab:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27b0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27b5:  ldloc 81

	IL_27b9:  nop 
	IL_27ba:  nop 
	IL_27bb:  ldtoken [mscorlib]System.IntPtr
	IL_27c0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_27c5:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_27ca:  ldloc 81

	IL_27ce:  nop 
	IL_27cf:  nop 
	IL_27d0:  starg 1

	IL_27d4:  nop 
	IL_27d5:  nop 
	IL_27d6:  br IL_4bdf

	IL_27db:  br IL_27e5

	IL_27e0:  br IL_27e5

	IL_27e5:  ldarg 1

	IL_27e9:  nop 
	IL_27ea:  nop 
	IL_27eb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_27f0:  ldstr "uinteger"
	IL_27f5:  call int32 string::Compare(string, string)
	IL_27fa:  stloc 0

	IL_27fe:  nop 
	IL_27ff:  nop 
	IL_2800:  ldloc 0

	IL_2804:  nop 
	IL_2805:  nop 
	IL_2806:  ldc.i4 0
	IL_280b:  beq IL_2815

	IL_2810:  br IL_2877

	IL_2815:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UIntegerTok::'.ctor'()
	IL_281a:  stloc 82

	IL_281e:  nop 
	IL_281f:  nop 
	IL_2820:  ldloc 82

	IL_2824:  nop 
	IL_2825:  nop 
	IL_2826:  ldarg 1

	IL_282a:  nop 
	IL_282b:  nop 
	IL_282c:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2831:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2836:  ldloc 82

	IL_283a:  nop 
	IL_283b:  nop 
	IL_283c:  ldarg 1

	IL_2840:  nop 
	IL_2841:  nop 
	IL_2842:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2847:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_284c:  ldloc 82

	IL_2850:  nop 
	IL_2851:  nop 
	IL_2852:  ldtoken [mscorlib]System.UInt32
	IL_2857:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_285c:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2861:  ldloc 82

	IL_2865:  nop 
	IL_2866:  nop 
	IL_2867:  starg 1

	IL_286b:  nop 
	IL_286c:  nop 
	IL_286d:  br IL_4bdf

	IL_2872:  br IL_287c

	IL_2877:  br IL_287c

	IL_287c:  ldarg 1

	IL_2880:  nop 
	IL_2881:  nop 
	IL_2882:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2887:  ldstr "double"
	IL_288c:  call int32 string::Compare(string, string)
	IL_2891:  stloc 0

	IL_2895:  nop 
	IL_2896:  nop 
	IL_2897:  ldloc 0

	IL_289b:  nop 
	IL_289c:  nop 
	IL_289d:  ldc.i4 0
	IL_28a2:  beq IL_28ac

	IL_28a7:  br IL_290e

	IL_28ac:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.DoubleTok::'.ctor'()
	IL_28b1:  stloc 83

	IL_28b5:  nop 
	IL_28b6:  nop 
	IL_28b7:  ldloc 83

	IL_28bb:  nop 
	IL_28bc:  nop 
	IL_28bd:  ldarg 1

	IL_28c1:  nop 
	IL_28c2:  nop 
	IL_28c3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28c8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_28cd:  ldloc 83

	IL_28d1:  nop 
	IL_28d2:  nop 
	IL_28d3:  ldarg 1

	IL_28d7:  nop 
	IL_28d8:  nop 
	IL_28d9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28de:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_28e3:  ldloc 83

	IL_28e7:  nop 
	IL_28e8:  nop 
	IL_28e9:  ldtoken [mscorlib]System.Double
	IL_28ee:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_28f3:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_28f8:  ldloc 83

	IL_28fc:  nop 
	IL_28fd:  nop 
	IL_28fe:  starg 1

	IL_2902:  nop 
	IL_2903:  nop 
	IL_2904:  br IL_4bdf

	IL_2909:  br IL_2913

	IL_290e:  br IL_2913

	IL_2913:  ldarg 1

	IL_2917:  nop 
	IL_2918:  nop 
	IL_2919:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_291e:  ldstr "boolean"
	IL_2923:  call int32 string::Compare(string, string)
	IL_2928:  stloc 0

	IL_292c:  nop 
	IL_292d:  nop 
	IL_292e:  ldloc 0

	IL_2932:  nop 
	IL_2933:  nop 
	IL_2934:  ldc.i4 0
	IL_2939:  beq IL_2943

	IL_293e:  br IL_29a5

	IL_2943:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.BooleanTok::'.ctor'()
	IL_2948:  stloc 84

	IL_294c:  nop 
	IL_294d:  nop 
	IL_294e:  ldloc 84

	IL_2952:  nop 
	IL_2953:  nop 
	IL_2954:  ldarg 1

	IL_2958:  nop 
	IL_2959:  nop 
	IL_295a:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_295f:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2964:  ldloc 84

	IL_2968:  nop 
	IL_2969:  nop 
	IL_296a:  ldarg 1

	IL_296e:  nop 
	IL_296f:  nop 
	IL_2970:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2975:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_297a:  ldloc 84

	IL_297e:  nop 
	IL_297f:  nop 
	IL_2980:  ldtoken [mscorlib]System.Boolean
	IL_2985:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_298a:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_298f:  ldloc 84

	IL_2993:  nop 
	IL_2994:  nop 
	IL_2995:  starg 1

	IL_2999:  nop 
	IL_299a:  nop 
	IL_299b:  br IL_4bdf

	IL_29a0:  br IL_29aa

	IL_29a5:  br IL_29aa

	IL_29aa:  ldarg 1

	IL_29ae:  nop 
	IL_29af:  nop 
	IL_29b0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_29b5:  ldstr "char"
	IL_29ba:  call int32 string::Compare(string, string)
	IL_29bf:  stloc 0

	IL_29c3:  nop 
	IL_29c4:  nop 
	IL_29c5:  ldloc 0

	IL_29c9:  nop 
	IL_29ca:  nop 
	IL_29cb:  ldc.i4 0
	IL_29d0:  beq IL_29da

	IL_29d5:  br IL_2a3c

	IL_29da:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.CharTok::'.ctor'()
	IL_29df:  stloc 85

	IL_29e3:  nop 
	IL_29e4:  nop 
	IL_29e5:  ldloc 85

	IL_29e9:  nop 
	IL_29ea:  nop 
	IL_29eb:  ldarg 1

	IL_29ef:  nop 
	IL_29f0:  nop 
	IL_29f1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29f6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_29fb:  ldloc 85

	IL_29ff:  nop 
	IL_2a00:  nop 
	IL_2a01:  ldarg 1

	IL_2a05:  nop 
	IL_2a06:  nop 
	IL_2a07:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a0c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a11:  ldloc 85

	IL_2a15:  nop 
	IL_2a16:  nop 
	IL_2a17:  ldtoken [mscorlib]System.Char
	IL_2a1c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2a21:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2a26:  ldloc 85

	IL_2a2a:  nop 
	IL_2a2b:  nop 
	IL_2a2c:  starg 1

	IL_2a30:  nop 
	IL_2a31:  nop 
	IL_2a32:  br IL_4bdf

	IL_2a37:  br IL_2a41

	IL_2a3c:  br IL_2a41

	IL_2a41:  ldarg 1

	IL_2a45:  nop 
	IL_2a46:  nop 
	IL_2a47:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2a4c:  ldstr "single"
	IL_2a51:  call int32 string::Compare(string, string)
	IL_2a56:  stloc 0

	IL_2a5a:  nop 
	IL_2a5b:  nop 
	IL_2a5c:  ldloc 0

	IL_2a60:  nop 
	IL_2a61:  nop 
	IL_2a62:  ldc.i4 0
	IL_2a67:  beq IL_2a71

	IL_2a6c:  br IL_2ad3

	IL_2a71:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SingleTok::'.ctor'()
	IL_2a76:  stloc 86

	IL_2a7a:  nop 
	IL_2a7b:  nop 
	IL_2a7c:  ldloc 86

	IL_2a80:  nop 
	IL_2a81:  nop 
	IL_2a82:  ldarg 1

	IL_2a86:  nop 
	IL_2a87:  nop 
	IL_2a88:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a8d:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2a92:  ldloc 86

	IL_2a96:  nop 
	IL_2a97:  nop 
	IL_2a98:  ldarg 1

	IL_2a9c:  nop 
	IL_2a9d:  nop 
	IL_2a9e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2aa3:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2aa8:  ldloc 86

	IL_2aac:  nop 
	IL_2aad:  nop 
	IL_2aae:  ldtoken [mscorlib]System.Single
	IL_2ab3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2ab8:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2abd:  ldloc 86

	IL_2ac1:  nop 
	IL_2ac2:  nop 
	IL_2ac3:  starg 1

	IL_2ac7:  nop 
	IL_2ac8:  nop 
	IL_2ac9:  br IL_4bdf

	IL_2ace:  br IL_2ad8

	IL_2ad3:  br IL_2ad8

	IL_2ad8:  ldarg 1

	IL_2adc:  nop 
	IL_2add:  nop 
	IL_2ade:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ae3:  ldstr "sbyte"
	IL_2ae8:  call int32 string::Compare(string, string)
	IL_2aed:  stloc 0

	IL_2af1:  nop 
	IL_2af2:  nop 
	IL_2af3:  ldloc 0

	IL_2af7:  nop 
	IL_2af8:  nop 
	IL_2af9:  ldc.i4 0
	IL_2afe:  beq IL_2b08

	IL_2b03:  br IL_2b6a

	IL_2b08:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.SByteTok::'.ctor'()
	IL_2b0d:  stloc 87

	IL_2b11:  nop 
	IL_2b12:  nop 
	IL_2b13:  ldloc 87

	IL_2b17:  nop 
	IL_2b18:  nop 
	IL_2b19:  ldarg 1

	IL_2b1d:  nop 
	IL_2b1e:  nop 
	IL_2b1f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b24:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2b29:  ldloc 87

	IL_2b2d:  nop 
	IL_2b2e:  nop 
	IL_2b2f:  ldarg 1

	IL_2b33:  nop 
	IL_2b34:  nop 
	IL_2b35:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b3a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b3f:  ldloc 87

	IL_2b43:  nop 
	IL_2b44:  nop 
	IL_2b45:  ldtoken [mscorlib]System.SByte
	IL_2b4a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2b4f:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2b54:  ldloc 87

	IL_2b58:  nop 
	IL_2b59:  nop 
	IL_2b5a:  starg 1

	IL_2b5e:  nop 
	IL_2b5f:  nop 
	IL_2b60:  br IL_4bdf

	IL_2b65:  br IL_2b6f

	IL_2b6a:  br IL_2b6f

	IL_2b6f:  ldarg 1

	IL_2b73:  nop 
	IL_2b74:  nop 
	IL_2b75:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2b7a:  ldstr "byte"
	IL_2b7f:  call int32 string::Compare(string, string)
	IL_2b84:  stloc 0

	IL_2b88:  nop 
	IL_2b89:  nop 
	IL_2b8a:  ldloc 0

	IL_2b8e:  nop 
	IL_2b8f:  nop 
	IL_2b90:  ldc.i4 0
	IL_2b95:  beq IL_2b9f

	IL_2b9a:  br IL_2c01

	IL_2b9f:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ByteTok::'.ctor'()
	IL_2ba4:  stloc 88

	IL_2ba8:  nop 
	IL_2ba9:  nop 
	IL_2baa:  ldloc 88

	IL_2bae:  nop 
	IL_2baf:  nop 
	IL_2bb0:  ldarg 1

	IL_2bb4:  nop 
	IL_2bb5:  nop 
	IL_2bb6:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2bbb:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2bc0:  ldloc 88

	IL_2bc4:  nop 
	IL_2bc5:  nop 
	IL_2bc6:  ldarg 1

	IL_2bca:  nop 
	IL_2bcb:  nop 
	IL_2bcc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bd1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2bd6:  ldloc 88

	IL_2bda:  nop 
	IL_2bdb:  nop 
	IL_2bdc:  ldtoken [mscorlib]System.Byte
	IL_2be1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2be6:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2beb:  ldloc 88

	IL_2bef:  nop 
	IL_2bf0:  nop 
	IL_2bf1:  starg 1

	IL_2bf5:  nop 
	IL_2bf6:  nop 
	IL_2bf7:  br IL_4bdf

	IL_2bfc:  br IL_2c06

	IL_2c01:  br IL_2c06

	IL_2c06:  ldarg 1

	IL_2c0a:  nop 
	IL_2c0b:  nop 
	IL_2c0c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c11:  ldstr "short"
	IL_2c16:  call int32 string::Compare(string, string)
	IL_2c1b:  stloc 0

	IL_2c1f:  nop 
	IL_2c20:  nop 
	IL_2c21:  ldloc 0

	IL_2c25:  nop 
	IL_2c26:  nop 
	IL_2c27:  ldc.i4 0
	IL_2c2c:  beq IL_2c36

	IL_2c31:  br IL_2c98

	IL_2c36:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ShortTok::'.ctor'()
	IL_2c3b:  stloc 89

	IL_2c3f:  nop 
	IL_2c40:  nop 
	IL_2c41:  ldloc 89

	IL_2c45:  nop 
	IL_2c46:  nop 
	IL_2c47:  ldarg 1

	IL_2c4b:  nop 
	IL_2c4c:  nop 
	IL_2c4d:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c52:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2c57:  ldloc 89

	IL_2c5b:  nop 
	IL_2c5c:  nop 
	IL_2c5d:  ldarg 1

	IL_2c61:  nop 
	IL_2c62:  nop 
	IL_2c63:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c68:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c6d:  ldloc 89

	IL_2c71:  nop 
	IL_2c72:  nop 
	IL_2c73:  ldtoken [mscorlib]System.Int16
	IL_2c78:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2c7d:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2c82:  ldloc 89

	IL_2c86:  nop 
	IL_2c87:  nop 
	IL_2c88:  starg 1

	IL_2c8c:  nop 
	IL_2c8d:  nop 
	IL_2c8e:  br IL_4bdf

	IL_2c93:  br IL_2c9d

	IL_2c98:  br IL_2c9d

	IL_2c9d:  ldarg 1

	IL_2ca1:  nop 
	IL_2ca2:  nop 
	IL_2ca3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ca8:  ldstr "ushort"
	IL_2cad:  call int32 string::Compare(string, string)
	IL_2cb2:  stloc 0

	IL_2cb6:  nop 
	IL_2cb7:  nop 
	IL_2cb8:  ldloc 0

	IL_2cbc:  nop 
	IL_2cbd:  nop 
	IL_2cbe:  ldc.i4 0
	IL_2cc3:  beq IL_2ccd

	IL_2cc8:  br IL_2d2f

	IL_2ccd:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.UShortTok::'.ctor'()
	IL_2cd2:  stloc 90

	IL_2cd6:  nop 
	IL_2cd7:  nop 
	IL_2cd8:  ldloc 90

	IL_2cdc:  nop 
	IL_2cdd:  nop 
	IL_2cde:  ldarg 1

	IL_2ce2:  nop 
	IL_2ce3:  nop 
	IL_2ce4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2ce9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2cee:  ldloc 90

	IL_2cf2:  nop 
	IL_2cf3:  nop 
	IL_2cf4:  ldarg 1

	IL_2cf8:  nop 
	IL_2cf9:  nop 
	IL_2cfa:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2cff:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d04:  ldloc 90

	IL_2d08:  nop 
	IL_2d09:  nop 
	IL_2d0a:  ldtoken [mscorlib]System.UInt16
	IL_2d0f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2d14:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2d19:  ldloc 90

	IL_2d1d:  nop 
	IL_2d1e:  nop 
	IL_2d1f:  starg 1

	IL_2d23:  nop 
	IL_2d24:  nop 
	IL_2d25:  br IL_4bdf

	IL_2d2a:  br IL_2d34

	IL_2d2f:  br IL_2d34

	IL_2d34:  ldarg 1

	IL_2d38:  nop 
	IL_2d39:  nop 
	IL_2d3a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d3f:  ldstr "long"
	IL_2d44:  call int32 string::Compare(string, string)
	IL_2d49:  stloc 0

	IL_2d4d:  nop 
	IL_2d4e:  nop 
	IL_2d4f:  ldloc 0

	IL_2d53:  nop 
	IL_2d54:  nop 
	IL_2d55:  ldc.i4 0
	IL_2d5a:  beq IL_2d64

	IL_2d5f:  br IL_2dc6

	IL_2d64:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.LongTok::'.ctor'()
	IL_2d69:  stloc 91

	IL_2d6d:  nop 
	IL_2d6e:  nop 
	IL_2d6f:  ldloc 91

	IL_2d73:  nop 
	IL_2d74:  nop 
	IL_2d75:  ldarg 1

	IL_2d79:  nop 
	IL_2d7a:  nop 
	IL_2d7b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d80:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2d85:  ldloc 91

	IL_2d89:  nop 
	IL_2d8a:  nop 
	IL_2d8b:  ldarg 1

	IL_2d8f:  nop 
	IL_2d90:  nop 
	IL_2d91:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d96:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2d9b:  ldloc 91

	IL_2d9f:  nop 
	IL_2da0:  nop 
	IL_2da1:  ldtoken [mscorlib]System.Int64
	IL_2da6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2dab:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2db0:  ldloc 91

	IL_2db4:  nop 
	IL_2db5:  nop 
	IL_2db6:  starg 1

	IL_2dba:  nop 
	IL_2dbb:  nop 
	IL_2dbc:  br IL_4bdf

	IL_2dc1:  br IL_2dcb

	IL_2dc6:  br IL_2dcb

	IL_2dcb:  ldarg 1

	IL_2dcf:  nop 
	IL_2dd0:  nop 
	IL_2dd1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2dd6:  ldstr "ulong"
	IL_2ddb:  call int32 string::Compare(string, string)
	IL_2de0:  stloc 0

	IL_2de4:  nop 
	IL_2de5:  nop 
	IL_2de6:  ldloc 0

	IL_2dea:  nop 
	IL_2deb:  nop 
	IL_2dec:  ldc.i4 0
	IL_2df1:  beq IL_2dfb

	IL_2df6:  br IL_2e5d

	IL_2dfb:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ULongTok::'.ctor'()
	IL_2e00:  stloc 92

	IL_2e04:  nop 
	IL_2e05:  nop 
	IL_2e06:  ldloc 92

	IL_2e0a:  nop 
	IL_2e0b:  nop 
	IL_2e0c:  ldarg 1

	IL_2e10:  nop 
	IL_2e11:  nop 
	IL_2e12:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e17:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2e1c:  ldloc 92

	IL_2e20:  nop 
	IL_2e21:  nop 
	IL_2e22:  ldarg 1

	IL_2e26:  nop 
	IL_2e27:  nop 
	IL_2e28:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e2d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e32:  ldloc 92

	IL_2e36:  nop 
	IL_2e37:  nop 
	IL_2e38:  ldtoken [mscorlib]System.UInt64
	IL_2e3d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2e42:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2e47:  ldloc 92

	IL_2e4b:  nop 
	IL_2e4c:  nop 
	IL_2e4d:  starg 1

	IL_2e51:  nop 
	IL_2e52:  nop 
	IL_2e53:  br IL_4bdf

	IL_2e58:  br IL_2e62

	IL_2e5d:  br IL_2e62

	IL_2e62:  ldarg 1

	IL_2e66:  nop 
	IL_2e67:  nop 
	IL_2e68:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2e6d:  ldstr "object"
	IL_2e72:  call int32 string::Compare(string, string)
	IL_2e77:  stloc 0

	IL_2e7b:  nop 
	IL_2e7c:  nop 
	IL_2e7d:  ldloc 0

	IL_2e81:  nop 
	IL_2e82:  nop 
	IL_2e83:  ldc.i4 0
	IL_2e88:  beq IL_2e92

	IL_2e8d:  br IL_2ef4

	IL_2e92:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.ObjectTok::'.ctor'()
	IL_2e97:  stloc 93

	IL_2e9b:  nop 
	IL_2e9c:  nop 
	IL_2e9d:  ldloc 93

	IL_2ea1:  nop 
	IL_2ea2:  nop 
	IL_2ea3:  ldarg 1

	IL_2ea7:  nop 
	IL_2ea8:  nop 
	IL_2ea9:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2eae:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2eb3:  ldloc 93

	IL_2eb7:  nop 
	IL_2eb8:  nop 
	IL_2eb9:  ldarg 1

	IL_2ebd:  nop 
	IL_2ebe:  nop 
	IL_2ebf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ec4:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2ec9:  ldloc 93

	IL_2ecd:  nop 
	IL_2ece:  nop 
	IL_2ecf:  ldtoken [mscorlib]System.Object
	IL_2ed4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2ed9:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_2ede:  ldloc 93

	IL_2ee2:  nop 
	IL_2ee3:  nop 
	IL_2ee4:  starg 1

	IL_2ee8:  nop 
	IL_2ee9:  nop 
	IL_2eea:  br IL_4bdf

	IL_2eef:  br IL_2ef9

	IL_2ef4:  br IL_2ef9

	IL_2ef9:  ldarg 1

	IL_2efd:  nop 
	IL_2efe:  nop 
	IL_2eff:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f04:  ldstr "^//(.)*$"
	IL_2f09:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_2f0e:  stloc 1

	IL_2f12:  nop 
	IL_2f13:  nop 
	IL_2f14:  ldloc 1

	IL_2f18:  nop 
	IL_2f19:  nop 
	IL_2f1a:  ldc.i4 1
	IL_2f1f:  beq IL_2f29

	IL_2f24:  br IL_2f80

	IL_2f29:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.CommentTok::'.ctor'()
	IL_2f2e:  stloc 94

	IL_2f32:  nop 
	IL_2f33:  nop 
	IL_2f34:  ldloc 94

	IL_2f38:  nop 
	IL_2f39:  nop 
	IL_2f3a:  ldarg 1

	IL_2f3e:  nop 
	IL_2f3f:  nop 
	IL_2f40:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f45:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2f4a:  ldloc 94

	IL_2f4e:  nop 
	IL_2f4f:  nop 
	IL_2f50:  ldarg 1

	IL_2f54:  nop 
	IL_2f55:  nop 
	IL_2f56:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f5b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f60:  ldloc 94

	IL_2f64:  nop 
	IL_2f65:  nop 
	IL_2f66:  starg 1

	IL_2f6a:  nop 
	IL_2f6b:  nop 
	IL_2f6c:  ldc.i4 1
	IL_2f71:  stsfld bool dylan.NET.Tokenizer.Parser.ParserFlags::CmtFlag
	IL_2f76:  br IL_4bdf

	IL_2f7b:  br IL_2f85

	IL_2f80:  br IL_2f85

	IL_2f85:  ldarg 1

	IL_2f89:  nop 
	IL_2f8a:  nop 
	IL_2f8b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2f90:  ldstr "null"
	IL_2f95:  call int32 string::Compare(string, string)
	IL_2f9a:  stloc 0

	IL_2f9e:  nop 
	IL_2f9f:  nop 
	IL_2fa0:  ldloc 0

	IL_2fa4:  nop 
	IL_2fa5:  nop 
	IL_2fa6:  ldc.i4 0
	IL_2fab:  beq IL_2fb5

	IL_2fb0:  br IL_3002

	IL_2fb5:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::'.ctor'()
	IL_2fba:  stloc 95

	IL_2fbe:  nop 
	IL_2fbf:  nop 
	IL_2fc0:  ldloc 95

	IL_2fc4:  nop 
	IL_2fc5:  nop 
	IL_2fc6:  ldarg 1

	IL_2fca:  nop 
	IL_2fcb:  nop 
	IL_2fcc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fd1:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_2fd6:  ldloc 95

	IL_2fda:  nop 
	IL_2fdb:  nop 
	IL_2fdc:  ldarg 1

	IL_2fe0:  nop 
	IL_2fe1:  nop 
	IL_2fe2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fe7:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2fec:  ldloc 95

	IL_2ff0:  nop 
	IL_2ff1:  nop 
	IL_2ff2:  starg 1

	IL_2ff6:  nop 
	IL_2ff7:  nop 
	IL_2ff8:  br IL_4bdf

	IL_2ffd:  br IL_3007

	IL_3002:  br IL_3007

	IL_3007:  ldarg 1

	IL_300b:  nop 
	IL_300c:  nop 
	IL_300d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3012:  ldstr "true"
	IL_3017:  call int32 string::Compare(string, string)
	IL_301c:  stloc 0

	IL_3020:  nop 
	IL_3021:  nop 
	IL_3022:  ldloc 0

	IL_3026:  nop 
	IL_3027:  nop 
	IL_3028:  ldc.i4 0
	IL_302d:  beq IL_3037

	IL_3032:  br IL_3047

	IL_3037:  ldc.i4 1
	IL_303c:  stloc 1

	IL_3040:  nop 
	IL_3041:  nop 
	IL_3042:  br IL_304c

	IL_3047:  br IL_304c

	IL_304c:  ldloc 1

	IL_3050:  nop 
	IL_3051:  nop 
	IL_3052:  stloc 4

	IL_3056:  nop 
	IL_3057:  nop 
	IL_3058:  ldarg 1

	IL_305c:  nop 
	IL_305d:  nop 
	IL_305e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3063:  ldstr "false"
	IL_3068:  call int32 string::Compare(string, string)
	IL_306d:  stloc 0

	IL_3071:  nop 
	IL_3072:  nop 
	IL_3073:  ldloc 0

	IL_3077:  nop 
	IL_3078:  nop 
	IL_3079:  ldc.i4 0
	IL_307e:  beq IL_3088

	IL_3083:  br IL_3098

	IL_3088:  ldc.i4 1
	IL_308d:  stloc 1

	IL_3091:  nop 
	IL_3092:  nop 
	IL_3093:  br IL_309d

	IL_3098:  br IL_309d

	IL_309d:  ldloc 4

	IL_30a1:  nop 
	IL_30a2:  nop 
	IL_30a3:  ldloc 1

	IL_30a7:  nop 
	IL_30a8:  nop 
	IL_30a9:  or 
	IL_30aa:  stloc 4

	IL_30ae:  nop 
	IL_30af:  nop 
	IL_30b0:  ldloc 1

	IL_30b4:  nop 
	IL_30b5:  nop 
	IL_30b6:  ldc.i4 1
	IL_30bb:  beq IL_30c5

	IL_30c0:  br IL_31a6

	IL_30c5:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::'.ctor'()
	IL_30ca:  stloc 96

	IL_30ce:  nop 
	IL_30cf:  nop 
	IL_30d0:  ldloc 96

	IL_30d4:  nop 
	IL_30d5:  nop 
	IL_30d6:  ldarg 1

	IL_30da:  nop 
	IL_30db:  nop 
	IL_30dc:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30e1:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_30e6:  ldloc 96

	IL_30ea:  nop 
	IL_30eb:  nop 
	IL_30ec:  ldarg 1

	IL_30f0:  nop 
	IL_30f1:  nop 
	IL_30f2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30f7:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_30fc:  ldarg 1

	IL_3100:  nop 
	IL_3101:  nop 
	IL_3102:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3107:  ldstr "true"
	IL_310c:  call int32 string::Compare(string, string)
	IL_3111:  stloc 0

	IL_3115:  nop 
	IL_3116:  nop 
	IL_3117:  ldloc 0

	IL_311b:  nop 
	IL_311c:  nop 
	IL_311d:  ldc.i4 0
	IL_3122:  beq IL_312c

	IL_3127:  br IL_3141

	IL_312c:  ldloc 96

	IL_3130:  nop 
	IL_3131:  nop 
	IL_3132:  ldc.i4 1
	IL_3137:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_313c:  br IL_3146

	IL_3141:  br IL_3146

	IL_3146:  ldarg 1

	IL_314a:  nop 
	IL_314b:  nop 
	IL_314c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3151:  ldstr "false"
	IL_3156:  call int32 string::Compare(string, string)
	IL_315b:  stloc 0

	IL_315f:  nop 
	IL_3160:  nop 
	IL_3161:  ldloc 0

	IL_3165:  nop 
	IL_3166:  nop 
	IL_3167:  ldc.i4 0
	IL_316c:  beq IL_3176

	IL_3171:  br IL_318b

	IL_3176:  ldloc 96

	IL_317a:  nop 
	IL_317b:  nop 
	IL_317c:  ldc.i4 0
	IL_3181:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_3186:  br IL_3190

	IL_318b:  br IL_3190

	IL_3190:  ldloc 96

	IL_3194:  nop 
	IL_3195:  nop 
	IL_3196:  starg 1

	IL_319a:  nop 
	IL_319b:  nop 
	IL_319c:  br IL_4bdf

	IL_31a1:  br IL_31ab

	IL_31a6:  br IL_31ab

	IL_31ab:  ldarg 1

	IL_31af:  nop 
	IL_31b0:  nop 
	IL_31b1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_31b6:  ldstr "^'(.)*'$"
	IL_31bb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_31c0:  stloc 1

	IL_31c4:  nop 
	IL_31c5:  nop 
	IL_31c6:  ldloc 1

	IL_31ca:  nop 
	IL_31cb:  nop 
	IL_31cc:  ldc.i4 1
	IL_31d1:  beq IL_31db

	IL_31d6:  br IL_3292

	IL_31db:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::'.ctor'()
	IL_31e0:  stloc 97

	IL_31e4:  nop 
	IL_31e5:  nop 
	IL_31e6:  ldloc 97

	IL_31ea:  nop 
	IL_31eb:  nop 
	IL_31ec:  ldarg 1

	IL_31f0:  nop 
	IL_31f1:  nop 
	IL_31f2:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_31f7:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_31fc:  ldarg 1

	IL_3200:  nop 
	IL_3201:  nop 
	IL_3202:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3207:  stloc 2

	IL_320b:  nop 
	IL_320c:  nop 
	IL_320d:  ldc.i4 1
	IL_3212:  conv.u 
	IL_3213:  newarr [mscorlib]System.Char
	IL_3218:  stloc 3

	IL_321c:  nop 
	IL_321d:  nop 
	IL_321e:  ldloc 3

	IL_3222:  nop 
	IL_3223:  nop 
	IL_3224:  ldc.i4 0
	IL_3229:  conv.u 
	IL_322a:  ldstr "'"
	IL_322f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3234:  stelem [mscorlib]System.Char
	IL_3239:  ldloc 2

	IL_323d:  nop 
	IL_323e:  nop 
	IL_323f:  ldloc 3

	IL_3243:  nop 
	IL_3244:  nop 
	IL_3245:  callvirt instance string string::Trim(char[])
	IL_324a:  stloc 2

	IL_324e:  nop 
	IL_324f:  nop 
	IL_3250:  ldloc 97

	IL_3254:  nop 
	IL_3255:  nop 
	IL_3256:  ldloc 2

	IL_325a:  nop 
	IL_325b:  nop 
	IL_325c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3261:  ldloc 97

	IL_3265:  nop 
	IL_3266:  nop 
	IL_3267:  ldloc 97

	IL_326b:  nop 
	IL_326c:  nop 
	IL_326d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3272:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3277:  stfld char [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_327c:  ldloc 97

	IL_3280:  nop 
	IL_3281:  nop 
	IL_3282:  starg 1

	IL_3286:  nop 
	IL_3287:  nop 
	IL_3288:  br IL_4bdf

	IL_328d:  br IL_3297

	IL_3292:  br IL_3297

	IL_3297:  ldstr "^"
	IL_329c:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_32a1:  ldstr "(.)*"
	IL_32a6:  call string string::Concat(string, string, string)
	IL_32ab:  stloc 2

	IL_32af:  nop 
	IL_32b0:  nop 
	IL_32b1:  ldloc 2

	IL_32b5:  nop 
	IL_32b6:  nop 
	IL_32b7:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_32bc:  ldstr "$"
	IL_32c1:  call string string::Concat(string, string, string)
	IL_32c6:  stloc 2

	IL_32ca:  nop 
	IL_32cb:  nop 
	IL_32cc:  ldarg 1

	IL_32d0:  nop 
	IL_32d1:  nop 
	IL_32d2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_32d7:  ldloc 2

	IL_32db:  nop 
	IL_32dc:  nop 
	IL_32dd:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_32e2:  stloc 1

	IL_32e6:  nop 
	IL_32e7:  nop 
	IL_32e8:  ldloc 1

	IL_32ec:  nop 
	IL_32ed:  nop 
	IL_32ee:  ldc.i4 1
	IL_32f3:  beq IL_32fd

	IL_32f8:  br IL_3399

	IL_32fd:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::'.ctor'()
	IL_3302:  stloc 98

	IL_3306:  nop 
	IL_3307:  nop 
	IL_3308:  ldloc 98

	IL_330c:  nop 
	IL_330d:  nop 
	IL_330e:  ldarg 1

	IL_3312:  nop 
	IL_3313:  nop 
	IL_3314:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3319:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_331e:  ldarg 1

	IL_3322:  nop 
	IL_3323:  nop 
	IL_3324:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3329:  stloc 2

	IL_332d:  nop 
	IL_332e:  nop 
	IL_332f:  ldc.i4 1
	IL_3334:  conv.u 
	IL_3335:  newarr [mscorlib]System.Char
	IL_333a:  stloc 3

	IL_333e:  nop 
	IL_333f:  nop 
	IL_3340:  ldloc 3

	IL_3344:  nop 
	IL_3345:  nop 
	IL_3346:  ldc.i4 0
	IL_334b:  conv.u 
	IL_334c:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_3351:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3356:  stelem [mscorlib]System.Char
	IL_335b:  ldloc 2

	IL_335f:  nop 
	IL_3360:  nop 
	IL_3361:  ldloc 3

	IL_3365:  nop 
	IL_3366:  nop 
	IL_3367:  callvirt instance string string::Trim(char[])
	IL_336c:  stloc 2

	IL_3370:  nop 
	IL_3371:  nop 
	IL_3372:  ldloc 98

	IL_3376:  nop 
	IL_3377:  nop 
	IL_3378:  ldloc 2

	IL_337c:  nop 
	IL_337d:  nop 
	IL_337e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3383:  ldloc 98

	IL_3387:  nop 
	IL_3388:  nop 
	IL_3389:  starg 1

	IL_338d:  nop 
	IL_338e:  nop 
	IL_338f:  br IL_4bdf

	IL_3394:  br IL_339e

	IL_3399:  br IL_339e

	IL_339e:  ldarg 1

	IL_33a2:  nop 
	IL_33a3:  nop 
	IL_33a4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33a9:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_33ae:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_33b3:  stloc 1

	IL_33b7:  nop 
	IL_33b8:  nop 
	IL_33b9:  ldloc 1

	IL_33bd:  nop 
	IL_33be:  nop 
	IL_33bf:  stloc 4

	IL_33c3:  nop 
	IL_33c4:  nop 
	IL_33c5:  ldarg 1

	IL_33c9:  nop 
	IL_33ca:  nop 
	IL_33cb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33d0:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_33d5:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_33da:  stloc 1

	IL_33de:  nop 
	IL_33df:  nop 
	IL_33e0:  ldloc 4

	IL_33e4:  nop 
	IL_33e5:  nop 
	IL_33e6:  ldloc 1

	IL_33ea:  nop 
	IL_33eb:  nop 
	IL_33ec:  or 
	IL_33ed:  stloc 4

	IL_33f1:  nop 
	IL_33f2:  nop 
	IL_33f3:  ldarg 1

	IL_33f7:  nop 
	IL_33f8:  nop 
	IL_33f9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_33fe:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3403:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3408:  stloc 1

	IL_340c:  nop 
	IL_340d:  nop 
	IL_340e:  ldloc 4

	IL_3412:  nop 
	IL_3413:  nop 
	IL_3414:  ldloc 1

	IL_3418:  nop 
	IL_3419:  nop 
	IL_341a:  or 
	IL_341b:  stloc 4

	IL_341f:  nop 
	IL_3420:  nop 
	IL_3421:  ldarg 1

	IL_3425:  nop 
	IL_3426:  nop 
	IL_3427:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_342c:  stloc 2

	IL_3430:  nop 
	IL_3431:  nop 
	IL_3432:  ldloc 2

	IL_3436:  nop 
	IL_3437:  nop 
	IL_3438:  ldstr "d"
	IL_343d:  callvirt instance bool string::EndsWith(string)
	IL_3442:  stloc 1

	IL_3446:  nop 
	IL_3447:  nop 
	IL_3448:  ldloc 4

	IL_344c:  nop 
	IL_344d:  nop 
	IL_344e:  ldloc 1

	IL_3452:  nop 
	IL_3453:  nop 
	IL_3454:  and 
	IL_3455:  stloc 4

	IL_3459:  nop 
	IL_345a:  nop 
	IL_345b:  ldloc 4

	IL_345f:  nop 
	IL_3460:  nop 
	IL_3461:  ldc.i4 1
	IL_3466:  beq IL_3470

	IL_346b:  br IL_3527

	IL_3470:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3475:  stloc 99

	IL_3479:  nop 
	IL_347a:  nop 
	IL_347b:  ldloc 99

	IL_347f:  nop 
	IL_3480:  nop 
	IL_3481:  ldarg 1

	IL_3485:  nop 
	IL_3486:  nop 
	IL_3487:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_348c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3491:  ldarg 1

	IL_3495:  nop 
	IL_3496:  nop 
	IL_3497:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_349c:  stloc 2

	IL_34a0:  nop 
	IL_34a1:  nop 
	IL_34a2:  ldc.i4 1
	IL_34a7:  conv.u 
	IL_34a8:  newarr [mscorlib]System.Char
	IL_34ad:  stloc 3

	IL_34b1:  nop 
	IL_34b2:  nop 
	IL_34b3:  ldloc 3

	IL_34b7:  nop 
	IL_34b8:  nop 
	IL_34b9:  ldc.i4 0
	IL_34be:  conv.u 
	IL_34bf:  ldstr "d"
	IL_34c4:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_34c9:  stelem [mscorlib]System.Char
	IL_34ce:  ldloc 2

	IL_34d2:  nop 
	IL_34d3:  nop 
	IL_34d4:  ldloc 3

	IL_34d8:  nop 
	IL_34d9:  nop 
	IL_34da:  callvirt instance string string::TrimEnd(char[])
	IL_34df:  stloc 2

	IL_34e3:  nop 
	IL_34e4:  nop 
	IL_34e5:  ldloc 99

	IL_34e9:  nop 
	IL_34ea:  nop 
	IL_34eb:  ldloc 2

	IL_34ef:  nop 
	IL_34f0:  nop 
	IL_34f1:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_34f6:  ldloc 99

	IL_34fa:  nop 
	IL_34fb:  nop 
	IL_34fc:  ldloc 99

	IL_3500:  nop 
	IL_3501:  nop 
	IL_3502:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3507:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_350c:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_3511:  ldloc 99

	IL_3515:  nop 
	IL_3516:  nop 
	IL_3517:  starg 1

	IL_351b:  nop 
	IL_351c:  nop 
	IL_351d:  br IL_4bdf

	IL_3522:  br IL_352c

	IL_3527:  br IL_352c

	IL_352c:  ldarg 1

	IL_3530:  nop 
	IL_3531:  nop 
	IL_3532:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3537:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_353c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3541:  stloc 1

	IL_3545:  nop 
	IL_3546:  nop 
	IL_3547:  ldloc 1

	IL_354b:  nop 
	IL_354c:  nop 
	IL_354d:  stloc 4

	IL_3551:  nop 
	IL_3552:  nop 
	IL_3553:  ldarg 1

	IL_3557:  nop 
	IL_3558:  nop 
	IL_3559:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_355e:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_3563:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3568:  stloc 1

	IL_356c:  nop 
	IL_356d:  nop 
	IL_356e:  ldloc 4

	IL_3572:  nop 
	IL_3573:  nop 
	IL_3574:  ldloc 1

	IL_3578:  nop 
	IL_3579:  nop 
	IL_357a:  or 
	IL_357b:  stloc 4

	IL_357f:  nop 
	IL_3580:  nop 
	IL_3581:  ldarg 1

	IL_3585:  nop 
	IL_3586:  nop 
	IL_3587:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_358c:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_3591:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3596:  stloc 1

	IL_359a:  nop 
	IL_359b:  nop 
	IL_359c:  ldloc 4

	IL_35a0:  nop 
	IL_35a1:  nop 
	IL_35a2:  ldloc 1

	IL_35a6:  nop 
	IL_35a7:  nop 
	IL_35a8:  or 
	IL_35a9:  stloc 4

	IL_35ad:  nop 
	IL_35ae:  nop 
	IL_35af:  ldarg 1

	IL_35b3:  nop 
	IL_35b4:  nop 
	IL_35b5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_35ba:  stloc 2

	IL_35be:  nop 
	IL_35bf:  nop 
	IL_35c0:  ldloc 2

	IL_35c4:  nop 
	IL_35c5:  nop 
	IL_35c6:  ldstr "f"
	IL_35cb:  callvirt instance bool string::EndsWith(string)
	IL_35d0:  stloc 1

	IL_35d4:  nop 
	IL_35d5:  nop 
	IL_35d6:  ldloc 4

	IL_35da:  nop 
	IL_35db:  nop 
	IL_35dc:  ldloc 1

	IL_35e0:  nop 
	IL_35e1:  nop 
	IL_35e2:  and 
	IL_35e3:  stloc 4

	IL_35e7:  nop 
	IL_35e8:  nop 
	IL_35e9:  ldloc 4

	IL_35ed:  nop 
	IL_35ee:  nop 
	IL_35ef:  ldc.i4 1
	IL_35f4:  beq IL_35fe

	IL_35f9:  br IL_36b5

	IL_35fe:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_3603:  stloc 100

	IL_3607:  nop 
	IL_3608:  nop 
	IL_3609:  ldloc 100

	IL_360d:  nop 
	IL_360e:  nop 
	IL_360f:  ldarg 1

	IL_3613:  nop 
	IL_3614:  nop 
	IL_3615:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_361a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_361f:  ldarg 1

	IL_3623:  nop 
	IL_3624:  nop 
	IL_3625:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_362a:  stloc 2

	IL_362e:  nop 
	IL_362f:  nop 
	IL_3630:  ldc.i4 1
	IL_3635:  conv.u 
	IL_3636:  newarr [mscorlib]System.Char
	IL_363b:  stloc 3

	IL_363f:  nop 
	IL_3640:  nop 
	IL_3641:  ldloc 3

	IL_3645:  nop 
	IL_3646:  nop 
	IL_3647:  ldc.i4 0
	IL_364c:  conv.u 
	IL_364d:  ldstr "f"
	IL_3652:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3657:  stelem [mscorlib]System.Char
	IL_365c:  ldloc 2

	IL_3660:  nop 
	IL_3661:  nop 
	IL_3662:  ldloc 3

	IL_3666:  nop 
	IL_3667:  nop 
	IL_3668:  callvirt instance string string::TrimEnd(char[])
	IL_366d:  stloc 2

	IL_3671:  nop 
	IL_3672:  nop 
	IL_3673:  ldloc 100

	IL_3677:  nop 
	IL_3678:  nop 
	IL_3679:  ldloc 2

	IL_367d:  nop 
	IL_367e:  nop 
	IL_367f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3684:  ldloc 100

	IL_3688:  nop 
	IL_3689:  nop 
	IL_368a:  ldloc 100

	IL_368e:  nop 
	IL_368f:  nop 
	IL_3690:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3695:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_369a:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_369f:  ldloc 100

	IL_36a3:  nop 
	IL_36a4:  nop 
	IL_36a5:  starg 1

	IL_36a9:  nop 
	IL_36aa:  nop 
	IL_36ab:  br IL_4bdf

	IL_36b0:  br IL_36ba

	IL_36b5:  br IL_36ba

	IL_36ba:  ldarg 1

	IL_36be:  nop 
	IL_36bf:  nop 
	IL_36c0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_36c5:  ldstr "^(\\d)+\\.(\\d)+(.)*$"
	IL_36ca:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_36cf:  stloc 1

	IL_36d3:  nop 
	IL_36d4:  nop 
	IL_36d5:  ldloc 1

	IL_36d9:  nop 
	IL_36da:  nop 
	IL_36db:  stloc 4

	IL_36df:  nop 
	IL_36e0:  nop 
	IL_36e1:  ldarg 1

	IL_36e5:  nop 
	IL_36e6:  nop 
	IL_36e7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_36ec:  ldstr "^\\+(\\d)+\\.(\\d)+(.)*$"
	IL_36f1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_36f6:  stloc 1

	IL_36fa:  nop 
	IL_36fb:  nop 
	IL_36fc:  ldloc 4

	IL_3700:  nop 
	IL_3701:  nop 
	IL_3702:  ldloc 1

	IL_3706:  nop 
	IL_3707:  nop 
	IL_3708:  or 
	IL_3709:  stloc 4

	IL_370d:  nop 
	IL_370e:  nop 
	IL_370f:  ldarg 1

	IL_3713:  nop 
	IL_3714:  nop 
	IL_3715:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_371a:  ldstr "^-(\\d)+\\.(\\d)+(.)*$"
	IL_371f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3724:  stloc 1

	IL_3728:  nop 
	IL_3729:  nop 
	IL_372a:  ldloc 4

	IL_372e:  nop 
	IL_372f:  nop 
	IL_3730:  ldloc 1

	IL_3734:  nop 
	IL_3735:  nop 
	IL_3736:  or 
	IL_3737:  stloc 4

	IL_373b:  nop 
	IL_373c:  nop 
	IL_373d:  ldloc 4

	IL_3741:  nop 
	IL_3742:  nop 
	IL_3743:  ldc.i4 1
	IL_3748:  beq IL_3752

	IL_374d:  br IL_37c6

	IL_3752:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_3757:  stloc 101

	IL_375b:  nop 
	IL_375c:  nop 
	IL_375d:  ldloc 101

	IL_3761:  nop 
	IL_3762:  nop 
	IL_3763:  ldarg 1

	IL_3767:  nop 
	IL_3768:  nop 
	IL_3769:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_376e:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3773:  ldarg 1

	IL_3777:  nop 
	IL_3778:  nop 
	IL_3779:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_377e:  stloc 2

	IL_3782:  nop 
	IL_3783:  nop 
	IL_3784:  ldloc 101

	IL_3788:  nop 
	IL_3789:  nop 
	IL_378a:  ldloc 2

	IL_378e:  nop 
	IL_378f:  nop 
	IL_3790:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3795:  ldloc 101

	IL_3799:  nop 
	IL_379a:  nop 
	IL_379b:  ldloc 101

	IL_379f:  nop 
	IL_37a0:  nop 
	IL_37a1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37a6:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_37ab:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_37b0:  ldloc 101

	IL_37b4:  nop 
	IL_37b5:  nop 
	IL_37b6:  starg 1

	IL_37ba:  nop 
	IL_37bb:  nop 
	IL_37bc:  br IL_4bdf

	IL_37c1:  br IL_37cb

	IL_37c6:  br IL_37cb

	IL_37cb:  ldarg 1

	IL_37cf:  nop 
	IL_37d0:  nop 
	IL_37d1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37d6:  ldstr "^(\\d)+(.)*$"
	IL_37db:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_37e0:  stloc 1

	IL_37e4:  nop 
	IL_37e5:  nop 
	IL_37e6:  ldloc 1

	IL_37ea:  nop 
	IL_37eb:  nop 
	IL_37ec:  stloc 4

	IL_37f0:  nop 
	IL_37f1:  nop 
	IL_37f2:  ldarg 1

	IL_37f6:  nop 
	IL_37f7:  nop 
	IL_37f8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_37fd:  ldstr "^\\+(\\d)+(.)*$"
	IL_3802:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3807:  stloc 1

	IL_380b:  nop 
	IL_380c:  nop 
	IL_380d:  ldloc 4

	IL_3811:  nop 
	IL_3812:  nop 
	IL_3813:  ldloc 1

	IL_3817:  nop 
	IL_3818:  nop 
	IL_3819:  or 
	IL_381a:  stloc 4

	IL_381e:  nop 
	IL_381f:  nop 
	IL_3820:  ldarg 1

	IL_3824:  nop 
	IL_3825:  nop 
	IL_3826:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_382b:  ldstr "^-(\\d)+(.)*$"
	IL_3830:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3835:  stloc 1

	IL_3839:  nop 
	IL_383a:  nop 
	IL_383b:  ldloc 4

	IL_383f:  nop 
	IL_3840:  nop 
	IL_3841:  ldloc 1

	IL_3845:  nop 
	IL_3846:  nop 
	IL_3847:  or 
	IL_3848:  stloc 4

	IL_384c:  nop 
	IL_384d:  nop 
	IL_384e:  ldarg 1

	IL_3852:  nop 
	IL_3853:  nop 
	IL_3854:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3859:  stloc 2

	IL_385d:  nop 
	IL_385e:  nop 
	IL_385f:  ldloc 2

	IL_3863:  nop 
	IL_3864:  nop 
	IL_3865:  ldstr "d"
	IL_386a:  callvirt instance bool string::EndsWith(string)
	IL_386f:  stloc 1

	IL_3873:  nop 
	IL_3874:  nop 
	IL_3875:  ldloc 4

	IL_3879:  nop 
	IL_387a:  nop 
	IL_387b:  ldloc 1

	IL_387f:  nop 
	IL_3880:  nop 
	IL_3881:  and 
	IL_3882:  stloc 4

	IL_3886:  nop 
	IL_3887:  nop 
	IL_3888:  ldloc 4

	IL_388c:  nop 
	IL_388d:  nop 
	IL_388e:  ldc.i4 1
	IL_3893:  beq IL_389d

	IL_3898:  br IL_3954

	IL_389d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_38a2:  stloc 102

	IL_38a6:  nop 
	IL_38a7:  nop 
	IL_38a8:  ldloc 102

	IL_38ac:  nop 
	IL_38ad:  nop 
	IL_38ae:  ldarg 1

	IL_38b2:  nop 
	IL_38b3:  nop 
	IL_38b4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_38b9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_38be:  ldarg 1

	IL_38c2:  nop 
	IL_38c3:  nop 
	IL_38c4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_38c9:  stloc 2

	IL_38cd:  nop 
	IL_38ce:  nop 
	IL_38cf:  ldc.i4 1
	IL_38d4:  conv.u 
	IL_38d5:  newarr [mscorlib]System.Char
	IL_38da:  stloc 3

	IL_38de:  nop 
	IL_38df:  nop 
	IL_38e0:  ldloc 3

	IL_38e4:  nop 
	IL_38e5:  nop 
	IL_38e6:  ldc.i4 0
	IL_38eb:  conv.u 
	IL_38ec:  ldstr "d"
	IL_38f1:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_38f6:  stelem [mscorlib]System.Char
	IL_38fb:  ldloc 2

	IL_38ff:  nop 
	IL_3900:  nop 
	IL_3901:  ldloc 3

	IL_3905:  nop 
	IL_3906:  nop 
	IL_3907:  callvirt instance string string::TrimEnd(char[])
	IL_390c:  stloc 2

	IL_3910:  nop 
	IL_3911:  nop 
	IL_3912:  ldloc 102

	IL_3916:  nop 
	IL_3917:  nop 
	IL_3918:  ldloc 2

	IL_391c:  nop 
	IL_391d:  nop 
	IL_391e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3923:  ldloc 102

	IL_3927:  nop 
	IL_3928:  nop 
	IL_3929:  ldloc 102

	IL_392d:  nop 
	IL_392e:  nop 
	IL_392f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3934:  call float64 class [mscorlib]System.Convert::ToDouble(string)
	IL_3939:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_393e:  ldloc 102

	IL_3942:  nop 
	IL_3943:  nop 
	IL_3944:  starg 1

	IL_3948:  nop 
	IL_3949:  nop 
	IL_394a:  br IL_4bdf

	IL_394f:  br IL_3959

	IL_3954:  br IL_3959

	IL_3959:  ldarg 1

	IL_395d:  nop 
	IL_395e:  nop 
	IL_395f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3964:  ldstr "^(\\d)+(.)*$"
	IL_3969:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_396e:  stloc 1

	IL_3972:  nop 
	IL_3973:  nop 
	IL_3974:  ldloc 1

	IL_3978:  nop 
	IL_3979:  nop 
	IL_397a:  stloc 4

	IL_397e:  nop 
	IL_397f:  nop 
	IL_3980:  ldarg 1

	IL_3984:  nop 
	IL_3985:  nop 
	IL_3986:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_398b:  ldstr "^\\+(\\d)+(.)*$"
	IL_3990:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3995:  stloc 1

	IL_3999:  nop 
	IL_399a:  nop 
	IL_399b:  ldloc 4

	IL_399f:  nop 
	IL_39a0:  nop 
	IL_39a1:  ldloc 1

	IL_39a5:  nop 
	IL_39a6:  nop 
	IL_39a7:  or 
	IL_39a8:  stloc 4

	IL_39ac:  nop 
	IL_39ad:  nop 
	IL_39ae:  ldarg 1

	IL_39b2:  nop 
	IL_39b3:  nop 
	IL_39b4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39b9:  ldstr "^-(\\d)+(.)*$"
	IL_39be:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_39c3:  stloc 1

	IL_39c7:  nop 
	IL_39c8:  nop 
	IL_39c9:  ldloc 4

	IL_39cd:  nop 
	IL_39ce:  nop 
	IL_39cf:  ldloc 1

	IL_39d3:  nop 
	IL_39d4:  nop 
	IL_39d5:  or 
	IL_39d6:  stloc 4

	IL_39da:  nop 
	IL_39db:  nop 
	IL_39dc:  ldarg 1

	IL_39e0:  nop 
	IL_39e1:  nop 
	IL_39e2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_39e7:  stloc 2

	IL_39eb:  nop 
	IL_39ec:  nop 
	IL_39ed:  ldloc 2

	IL_39f1:  nop 
	IL_39f2:  nop 
	IL_39f3:  ldstr "f"
	IL_39f8:  callvirt instance bool string::EndsWith(string)
	IL_39fd:  stloc 1

	IL_3a01:  nop 
	IL_3a02:  nop 
	IL_3a03:  ldloc 4

	IL_3a07:  nop 
	IL_3a08:  nop 
	IL_3a09:  ldloc 1

	IL_3a0d:  nop 
	IL_3a0e:  nop 
	IL_3a0f:  and 
	IL_3a10:  stloc 4

	IL_3a14:  nop 
	IL_3a15:  nop 
	IL_3a16:  ldloc 4

	IL_3a1a:  nop 
	IL_3a1b:  nop 
	IL_3a1c:  ldc.i4 1
	IL_3a21:  beq IL_3a2b

	IL_3a26:  br IL_3ae2

	IL_3a2b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_3a30:  stloc 103

	IL_3a34:  nop 
	IL_3a35:  nop 
	IL_3a36:  ldloc 103

	IL_3a3a:  nop 
	IL_3a3b:  nop 
	IL_3a3c:  ldarg 1

	IL_3a40:  nop 
	IL_3a41:  nop 
	IL_3a42:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3a47:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3a4c:  ldarg 1

	IL_3a50:  nop 
	IL_3a51:  nop 
	IL_3a52:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3a57:  stloc 2

	IL_3a5b:  nop 
	IL_3a5c:  nop 
	IL_3a5d:  ldc.i4 1
	IL_3a62:  conv.u 
	IL_3a63:  newarr [mscorlib]System.Char
	IL_3a68:  stloc 3

	IL_3a6c:  nop 
	IL_3a6d:  nop 
	IL_3a6e:  ldloc 3

	IL_3a72:  nop 
	IL_3a73:  nop 
	IL_3a74:  ldc.i4 0
	IL_3a79:  conv.u 
	IL_3a7a:  ldstr "f"
	IL_3a7f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3a84:  stelem [mscorlib]System.Char
	IL_3a89:  ldloc 2

	IL_3a8d:  nop 
	IL_3a8e:  nop 
	IL_3a8f:  ldloc 3

	IL_3a93:  nop 
	IL_3a94:  nop 
	IL_3a95:  callvirt instance string string::TrimEnd(char[])
	IL_3a9a:  stloc 2

	IL_3a9e:  nop 
	IL_3a9f:  nop 
	IL_3aa0:  ldloc 103

	IL_3aa4:  nop 
	IL_3aa5:  nop 
	IL_3aa6:  ldloc 2

	IL_3aaa:  nop 
	IL_3aab:  nop 
	IL_3aac:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ab1:  ldloc 103

	IL_3ab5:  nop 
	IL_3ab6:  nop 
	IL_3ab7:  ldloc 103

	IL_3abb:  nop 
	IL_3abc:  nop 
	IL_3abd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ac2:  call float32 class [mscorlib]System.Convert::ToSingle(string)
	IL_3ac7:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_3acc:  ldloc 103

	IL_3ad0:  nop 
	IL_3ad1:  nop 
	IL_3ad2:  starg 1

	IL_3ad6:  nop 
	IL_3ad7:  nop 
	IL_3ad8:  br IL_4bdf

	IL_3add:  br IL_3ae7

	IL_3ae2:  br IL_3ae7

	IL_3ae7:  ldarg 1

	IL_3aeb:  nop 
	IL_3aec:  nop 
	IL_3aed:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3af2:  ldstr "^(\\d)+(.)*$"
	IL_3af7:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3afc:  stloc 1

	IL_3b00:  nop 
	IL_3b01:  nop 
	IL_3b02:  ldloc 1

	IL_3b06:  nop 
	IL_3b07:  nop 
	IL_3b08:  stloc 4

	IL_3b0c:  nop 
	IL_3b0d:  nop 
	IL_3b0e:  ldarg 1

	IL_3b12:  nop 
	IL_3b13:  nop 
	IL_3b14:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b19:  ldstr "^\\+(\\d)+(.)*$"
	IL_3b1e:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b23:  stloc 1

	IL_3b27:  nop 
	IL_3b28:  nop 
	IL_3b29:  ldloc 4

	IL_3b2d:  nop 
	IL_3b2e:  nop 
	IL_3b2f:  ldloc 1

	IL_3b33:  nop 
	IL_3b34:  nop 
	IL_3b35:  or 
	IL_3b36:  stloc 4

	IL_3b3a:  nop 
	IL_3b3b:  nop 
	IL_3b3c:  ldarg 1

	IL_3b40:  nop 
	IL_3b41:  nop 
	IL_3b42:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b47:  ldstr "^-(\\d)+(.)*$"
	IL_3b4c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3b51:  stloc 1

	IL_3b55:  nop 
	IL_3b56:  nop 
	IL_3b57:  ldloc 4

	IL_3b5b:  nop 
	IL_3b5c:  nop 
	IL_3b5d:  ldloc 1

	IL_3b61:  nop 
	IL_3b62:  nop 
	IL_3b63:  or 
	IL_3b64:  stloc 4

	IL_3b68:  nop 
	IL_3b69:  nop 
	IL_3b6a:  ldarg 1

	IL_3b6e:  nop 
	IL_3b6f:  nop 
	IL_3b70:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3b75:  stloc 2

	IL_3b79:  nop 
	IL_3b7a:  nop 
	IL_3b7b:  ldloc 2

	IL_3b7f:  nop 
	IL_3b80:  nop 
	IL_3b81:  ldstr "ui"
	IL_3b86:  callvirt instance bool string::EndsWith(string)
	IL_3b8b:  stloc 1

	IL_3b8f:  nop 
	IL_3b90:  nop 
	IL_3b91:  ldloc 4

	IL_3b95:  nop 
	IL_3b96:  nop 
	IL_3b97:  ldloc 1

	IL_3b9b:  nop 
	IL_3b9c:  nop 
	IL_3b9d:  and 
	IL_3b9e:  stloc 4

	IL_3ba2:  nop 
	IL_3ba3:  nop 
	IL_3ba4:  ldloc 4

	IL_3ba8:  nop 
	IL_3ba9:  nop 
	IL_3baa:  ldc.i4 1
	IL_3baf:  beq IL_3bb9

	IL_3bb4:  br IL_3ca2

	IL_3bb9:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::'.ctor'()
	IL_3bbe:  stloc 104

	IL_3bc2:  nop 
	IL_3bc3:  nop 
	IL_3bc4:  ldloc 104

	IL_3bc8:  nop 
	IL_3bc9:  nop 
	IL_3bca:  ldarg 1

	IL_3bce:  nop 
	IL_3bcf:  nop 
	IL_3bd0:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3bd5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3bda:  ldarg 1

	IL_3bde:  nop 
	IL_3bdf:  nop 
	IL_3be0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3be5:  stloc 2

	IL_3be9:  nop 
	IL_3bea:  nop 
	IL_3beb:  ldc.i4 1
	IL_3bf0:  conv.u 
	IL_3bf1:  newarr [mscorlib]System.Char
	IL_3bf6:  stloc 3

	IL_3bfa:  nop 
	IL_3bfb:  nop 
	IL_3bfc:  ldloc 3

	IL_3c00:  nop 
	IL_3c01:  nop 
	IL_3c02:  ldc.i4 0
	IL_3c07:  conv.u 
	IL_3c08:  ldstr "i"
	IL_3c0d:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3c12:  stelem [mscorlib]System.Char
	IL_3c17:  ldloc 2

	IL_3c1b:  nop 
	IL_3c1c:  nop 
	IL_3c1d:  ldloc 3

	IL_3c21:  nop 
	IL_3c22:  nop 
	IL_3c23:  callvirt instance string string::TrimEnd(char[])
	IL_3c28:  stloc 2

	IL_3c2c:  nop 
	IL_3c2d:  nop 
	IL_3c2e:  ldloc 3

	IL_3c32:  nop 
	IL_3c33:  nop 
	IL_3c34:  ldc.i4 0
	IL_3c39:  conv.u 
	IL_3c3a:  ldstr "u"
	IL_3c3f:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3c44:  stelem [mscorlib]System.Char
	IL_3c49:  ldloc 2

	IL_3c4d:  nop 
	IL_3c4e:  nop 
	IL_3c4f:  ldloc 3

	IL_3c53:  nop 
	IL_3c54:  nop 
	IL_3c55:  callvirt instance string string::TrimEnd(char[])
	IL_3c5a:  stloc 2

	IL_3c5e:  nop 
	IL_3c5f:  nop 
	IL_3c60:  ldloc 104

	IL_3c64:  nop 
	IL_3c65:  nop 
	IL_3c66:  ldloc 2

	IL_3c6a:  nop 
	IL_3c6b:  nop 
	IL_3c6c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c71:  ldloc 104

	IL_3c75:  nop 
	IL_3c76:  nop 
	IL_3c77:  ldloc 104

	IL_3c7b:  nop 
	IL_3c7c:  nop 
	IL_3c7d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3c82:  call unsigned int32 class [mscorlib]System.Convert::ToUInt32(string)
	IL_3c87:  stfld unsigned int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UIntLiteral::NumVal
	IL_3c8c:  ldloc 104

	IL_3c90:  nop 
	IL_3c91:  nop 
	IL_3c92:  starg 1

	IL_3c96:  nop 
	IL_3c97:  nop 
	IL_3c98:  br IL_4bdf

	IL_3c9d:  br IL_3ca7

	IL_3ca2:  br IL_3ca7

	IL_3ca7:  ldarg 1

	IL_3cab:  nop 
	IL_3cac:  nop 
	IL_3cad:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3cb2:  ldstr "^(\\d)+(.)*$"
	IL_3cb7:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3cbc:  stloc 1

	IL_3cc0:  nop 
	IL_3cc1:  nop 
	IL_3cc2:  ldloc 1

	IL_3cc6:  nop 
	IL_3cc7:  nop 
	IL_3cc8:  stloc 4

	IL_3ccc:  nop 
	IL_3ccd:  nop 
	IL_3cce:  ldarg 1

	IL_3cd2:  nop 
	IL_3cd3:  nop 
	IL_3cd4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3cd9:  ldstr "^\\+(\\d)+(.)*$"
	IL_3cde:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3ce3:  stloc 1

	IL_3ce7:  nop 
	IL_3ce8:  nop 
	IL_3ce9:  ldloc 4

	IL_3ced:  nop 
	IL_3cee:  nop 
	IL_3cef:  ldloc 1

	IL_3cf3:  nop 
	IL_3cf4:  nop 
	IL_3cf5:  or 
	IL_3cf6:  stloc 4

	IL_3cfa:  nop 
	IL_3cfb:  nop 
	IL_3cfc:  ldarg 1

	IL_3d00:  nop 
	IL_3d01:  nop 
	IL_3d02:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d07:  ldstr "^-(\\d)+(.)*$"
	IL_3d0c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3d11:  stloc 1

	IL_3d15:  nop 
	IL_3d16:  nop 
	IL_3d17:  ldloc 4

	IL_3d1b:  nop 
	IL_3d1c:  nop 
	IL_3d1d:  ldloc 1

	IL_3d21:  nop 
	IL_3d22:  nop 
	IL_3d23:  or 
	IL_3d24:  stloc 4

	IL_3d28:  nop 
	IL_3d29:  nop 
	IL_3d2a:  ldarg 1

	IL_3d2e:  nop 
	IL_3d2f:  nop 
	IL_3d30:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3d35:  stloc 2

	IL_3d39:  nop 
	IL_3d3a:  nop 
	IL_3d3b:  ldloc 2

	IL_3d3f:  nop 
	IL_3d40:  nop 
	IL_3d41:  ldstr "ip"
	IL_3d46:  callvirt instance bool string::EndsWith(string)
	IL_3d4b:  stloc 1

	IL_3d4f:  nop 
	IL_3d50:  nop 
	IL_3d51:  ldloc 4

	IL_3d55:  nop 
	IL_3d56:  nop 
	IL_3d57:  ldloc 1

	IL_3d5b:  nop 
	IL_3d5c:  nop 
	IL_3d5d:  and 
	IL_3d5e:  stloc 4

	IL_3d62:  nop 
	IL_3d63:  nop 
	IL_3d64:  ldloc 4

	IL_3d68:  nop 
	IL_3d69:  nop 
	IL_3d6a:  ldc.i4 1
	IL_3d6f:  beq IL_3d79

	IL_3d74:  br IL_3e67

	IL_3d79:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::'.ctor'()
	IL_3d7e:  stloc 105

	IL_3d82:  nop 
	IL_3d83:  nop 
	IL_3d84:  ldloc 105

	IL_3d88:  nop 
	IL_3d89:  nop 
	IL_3d8a:  ldarg 1

	IL_3d8e:  nop 
	IL_3d8f:  nop 
	IL_3d90:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3d95:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3d9a:  ldarg 1

	IL_3d9e:  nop 
	IL_3d9f:  nop 
	IL_3da0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3da5:  stloc 2

	IL_3da9:  nop 
	IL_3daa:  nop 
	IL_3dab:  ldc.i4 1
	IL_3db0:  conv.u 
	IL_3db1:  newarr [mscorlib]System.Char
	IL_3db6:  stloc 3

	IL_3dba:  nop 
	IL_3dbb:  nop 
	IL_3dbc:  ldloc 3

	IL_3dc0:  nop 
	IL_3dc1:  nop 
	IL_3dc2:  ldc.i4 0
	IL_3dc7:  conv.u 
	IL_3dc8:  ldstr "p"
	IL_3dcd:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3dd2:  stelem [mscorlib]System.Char
	IL_3dd7:  ldloc 2

	IL_3ddb:  nop 
	IL_3ddc:  nop 
	IL_3ddd:  ldloc 3

	IL_3de1:  nop 
	IL_3de2:  nop 
	IL_3de3:  callvirt instance string string::TrimEnd(char[])
	IL_3de8:  stloc 2

	IL_3dec:  nop 
	IL_3ded:  nop 
	IL_3dee:  ldloc 3

	IL_3df2:  nop 
	IL_3df3:  nop 
	IL_3df4:  ldc.i4 0
	IL_3df9:  conv.u 
	IL_3dfa:  ldstr "i"
	IL_3dff:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3e04:  stelem [mscorlib]System.Char
	IL_3e09:  ldloc 2

	IL_3e0d:  nop 
	IL_3e0e:  nop 
	IL_3e0f:  ldloc 3

	IL_3e13:  nop 
	IL_3e14:  nop 
	IL_3e15:  callvirt instance string string::TrimEnd(char[])
	IL_3e1a:  stloc 2

	IL_3e1e:  nop 
	IL_3e1f:  nop 
	IL_3e20:  ldloc 105

	IL_3e24:  nop 
	IL_3e25:  nop 
	IL_3e26:  ldloc 2

	IL_3e2a:  nop 
	IL_3e2b:  nop 
	IL_3e2c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e31:  ldloc 105

	IL_3e35:  nop 
	IL_3e36:  nop 
	IL_3e37:  ldloc 105

	IL_3e3b:  nop 
	IL_3e3c:  nop 
	IL_3e3d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e42:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_3e47:  newobj instance void native int::'.ctor'(int32)
	IL_3e4c:  stfld native int [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntPtrLiteral::NumVal
	IL_3e51:  ldloc 105

	IL_3e55:  nop 
	IL_3e56:  nop 
	IL_3e57:  starg 1

	IL_3e5b:  nop 
	IL_3e5c:  nop 
	IL_3e5d:  br IL_4bdf

	IL_3e62:  br IL_3e6c

	IL_3e67:  br IL_3e6c

	IL_3e6c:  ldarg 1

	IL_3e70:  nop 
	IL_3e71:  nop 
	IL_3e72:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e77:  ldstr "^(\\d)+(.)*$"
	IL_3e7c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3e81:  stloc 1

	IL_3e85:  nop 
	IL_3e86:  nop 
	IL_3e87:  ldloc 1

	IL_3e8b:  nop 
	IL_3e8c:  nop 
	IL_3e8d:  stloc 4

	IL_3e91:  nop 
	IL_3e92:  nop 
	IL_3e93:  ldarg 1

	IL_3e97:  nop 
	IL_3e98:  nop 
	IL_3e99:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3e9e:  ldstr "^\\+(\\d)+(.)*$"
	IL_3ea3:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3ea8:  stloc 1

	IL_3eac:  nop 
	IL_3ead:  nop 
	IL_3eae:  ldloc 4

	IL_3eb2:  nop 
	IL_3eb3:  nop 
	IL_3eb4:  ldloc 1

	IL_3eb8:  nop 
	IL_3eb9:  nop 
	IL_3eba:  or 
	IL_3ebb:  stloc 4

	IL_3ebf:  nop 
	IL_3ec0:  nop 
	IL_3ec1:  ldarg 1

	IL_3ec5:  nop 
	IL_3ec6:  nop 
	IL_3ec7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3ecc:  ldstr "^-(\\d)+(.)*$"
	IL_3ed1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_3ed6:  stloc 1

	IL_3eda:  nop 
	IL_3edb:  nop 
	IL_3edc:  ldloc 4

	IL_3ee0:  nop 
	IL_3ee1:  nop 
	IL_3ee2:  ldloc 1

	IL_3ee6:  nop 
	IL_3ee7:  nop 
	IL_3ee8:  or 
	IL_3ee9:  stloc 4

	IL_3eed:  nop 
	IL_3eee:  nop 
	IL_3eef:  ldarg 1

	IL_3ef3:  nop 
	IL_3ef4:  nop 
	IL_3ef5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3efa:  stloc 2

	IL_3efe:  nop 
	IL_3eff:  nop 
	IL_3f00:  ldloc 2

	IL_3f04:  nop 
	IL_3f05:  nop 
	IL_3f06:  ldstr "i"
	IL_3f0b:  callvirt instance bool string::EndsWith(string)
	IL_3f10:  stloc 1

	IL_3f14:  nop 
	IL_3f15:  nop 
	IL_3f16:  ldloc 4

	IL_3f1a:  nop 
	IL_3f1b:  nop 
	IL_3f1c:  ldloc 1

	IL_3f20:  nop 
	IL_3f21:  nop 
	IL_3f22:  and 
	IL_3f23:  stloc 4

	IL_3f27:  nop 
	IL_3f28:  nop 
	IL_3f29:  ldloc 4

	IL_3f2d:  nop 
	IL_3f2e:  nop 
	IL_3f2f:  ldc.i4 1
	IL_3f34:  beq IL_3f3e

	IL_3f39:  br IL_3ff5

	IL_3f3e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_3f43:  stloc 106

	IL_3f47:  nop 
	IL_3f48:  nop 
	IL_3f49:  ldloc 106

	IL_3f4d:  nop 
	IL_3f4e:  nop 
	IL_3f4f:  ldarg 1

	IL_3f53:  nop 
	IL_3f54:  nop 
	IL_3f55:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3f5a:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_3f5f:  ldarg 1

	IL_3f63:  nop 
	IL_3f64:  nop 
	IL_3f65:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3f6a:  stloc 2

	IL_3f6e:  nop 
	IL_3f6f:  nop 
	IL_3f70:  ldc.i4 1
	IL_3f75:  conv.u 
	IL_3f76:  newarr [mscorlib]System.Char
	IL_3f7b:  stloc 3

	IL_3f7f:  nop 
	IL_3f80:  nop 
	IL_3f81:  ldloc 3

	IL_3f85:  nop 
	IL_3f86:  nop 
	IL_3f87:  ldc.i4 0
	IL_3f8c:  conv.u 
	IL_3f8d:  ldstr "i"
	IL_3f92:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_3f97:  stelem [mscorlib]System.Char
	IL_3f9c:  ldloc 2

	IL_3fa0:  nop 
	IL_3fa1:  nop 
	IL_3fa2:  ldloc 3

	IL_3fa6:  nop 
	IL_3fa7:  nop 
	IL_3fa8:  callvirt instance string string::TrimEnd(char[])
	IL_3fad:  stloc 2

	IL_3fb1:  nop 
	IL_3fb2:  nop 
	IL_3fb3:  ldloc 106

	IL_3fb7:  nop 
	IL_3fb8:  nop 
	IL_3fb9:  ldloc 2

	IL_3fbd:  nop 
	IL_3fbe:  nop 
	IL_3fbf:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3fc4:  ldloc 106

	IL_3fc8:  nop 
	IL_3fc9:  nop 
	IL_3fca:  ldloc 106

	IL_3fce:  nop 
	IL_3fcf:  nop 
	IL_3fd0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_3fd5:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_3fda:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_3fdf:  ldloc 106

	IL_3fe3:  nop 
	IL_3fe4:  nop 
	IL_3fe5:  starg 1

	IL_3fe9:  nop 
	IL_3fea:  nop 
	IL_3feb:  br IL_4bdf

	IL_3ff0:  br IL_3ffa

	IL_3ff5:  br IL_3ffa

	IL_3ffa:  ldarg 1

	IL_3ffe:  nop 
	IL_3fff:  nop 
	IL_4000:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4005:  ldstr "^(\\d)+(.)*$"
	IL_400a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_400f:  stloc 1

	IL_4013:  nop 
	IL_4014:  nop 
	IL_4015:  ldloc 1

	IL_4019:  nop 
	IL_401a:  nop 
	IL_401b:  stloc 4

	IL_401f:  nop 
	IL_4020:  nop 
	IL_4021:  ldarg 1

	IL_4025:  nop 
	IL_4026:  nop 
	IL_4027:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_402c:  ldstr "^\\+(\\d)+(.)*$"
	IL_4031:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4036:  stloc 1

	IL_403a:  nop 
	IL_403b:  nop 
	IL_403c:  ldloc 4

	IL_4040:  nop 
	IL_4041:  nop 
	IL_4042:  ldloc 1

	IL_4046:  nop 
	IL_4047:  nop 
	IL_4048:  or 
	IL_4049:  stloc 4

	IL_404d:  nop 
	IL_404e:  nop 
	IL_404f:  ldarg 1

	IL_4053:  nop 
	IL_4054:  nop 
	IL_4055:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_405a:  ldstr "^-(\\d)+(.)*$"
	IL_405f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4064:  stloc 1

	IL_4068:  nop 
	IL_4069:  nop 
	IL_406a:  ldloc 4

	IL_406e:  nop 
	IL_406f:  nop 
	IL_4070:  ldloc 1

	IL_4074:  nop 
	IL_4075:  nop 
	IL_4076:  or 
	IL_4077:  stloc 4

	IL_407b:  nop 
	IL_407c:  nop 
	IL_407d:  ldarg 1

	IL_4081:  nop 
	IL_4082:  nop 
	IL_4083:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4088:  stloc 2

	IL_408c:  nop 
	IL_408d:  nop 
	IL_408e:  ldloc 2

	IL_4092:  nop 
	IL_4093:  nop 
	IL_4094:  ldstr "ul"
	IL_4099:  callvirt instance bool string::EndsWith(string)
	IL_409e:  stloc 1

	IL_40a2:  nop 
	IL_40a3:  nop 
	IL_40a4:  ldloc 4

	IL_40a8:  nop 
	IL_40a9:  nop 
	IL_40aa:  ldloc 1

	IL_40ae:  nop 
	IL_40af:  nop 
	IL_40b0:  and 
	IL_40b1:  stloc 4

	IL_40b5:  nop 
	IL_40b6:  nop 
	IL_40b7:  ldloc 4

	IL_40bb:  nop 
	IL_40bc:  nop 
	IL_40bd:  ldc.i4 1
	IL_40c2:  beq IL_40cc

	IL_40c7:  br IL_41b5

	IL_40cc:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::'.ctor'()
	IL_40d1:  stloc 107

	IL_40d5:  nop 
	IL_40d6:  nop 
	IL_40d7:  ldloc 107

	IL_40db:  nop 
	IL_40dc:  nop 
	IL_40dd:  ldarg 1

	IL_40e1:  nop 
	IL_40e2:  nop 
	IL_40e3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_40e8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_40ed:  ldarg 1

	IL_40f1:  nop 
	IL_40f2:  nop 
	IL_40f3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_40f8:  stloc 2

	IL_40fc:  nop 
	IL_40fd:  nop 
	IL_40fe:  ldc.i4 1
	IL_4103:  conv.u 
	IL_4104:  newarr [mscorlib]System.Char
	IL_4109:  stloc 3

	IL_410d:  nop 
	IL_410e:  nop 
	IL_410f:  ldloc 3

	IL_4113:  nop 
	IL_4114:  nop 
	IL_4115:  ldc.i4 0
	IL_411a:  conv.u 
	IL_411b:  ldstr "l"
	IL_4120:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4125:  stelem [mscorlib]System.Char
	IL_412a:  ldloc 2

	IL_412e:  nop 
	IL_412f:  nop 
	IL_4130:  ldloc 3

	IL_4134:  nop 
	IL_4135:  nop 
	IL_4136:  callvirt instance string string::TrimEnd(char[])
	IL_413b:  stloc 2

	IL_413f:  nop 
	IL_4140:  nop 
	IL_4141:  ldloc 3

	IL_4145:  nop 
	IL_4146:  nop 
	IL_4147:  ldc.i4 0
	IL_414c:  conv.u 
	IL_414d:  ldstr "u"
	IL_4152:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4157:  stelem [mscorlib]System.Char
	IL_415c:  ldloc 2

	IL_4160:  nop 
	IL_4161:  nop 
	IL_4162:  ldloc 3

	IL_4166:  nop 
	IL_4167:  nop 
	IL_4168:  callvirt instance string string::TrimEnd(char[])
	IL_416d:  stloc 2

	IL_4171:  nop 
	IL_4172:  nop 
	IL_4173:  ldloc 107

	IL_4177:  nop 
	IL_4178:  nop 
	IL_4179:  ldloc 2

	IL_417d:  nop 
	IL_417e:  nop 
	IL_417f:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4184:  ldloc 107

	IL_4188:  nop 
	IL_4189:  nop 
	IL_418a:  ldloc 107

	IL_418e:  nop 
	IL_418f:  nop 
	IL_4190:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4195:  call unsigned int64 class [mscorlib]System.Convert::ToUInt64(string)
	IL_419a:  stfld unsigned int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ULongLiteral::NumVal
	IL_419f:  ldloc 107

	IL_41a3:  nop 
	IL_41a4:  nop 
	IL_41a5:  starg 1

	IL_41a9:  nop 
	IL_41aa:  nop 
	IL_41ab:  br IL_4bdf

	IL_41b0:  br IL_41ba

	IL_41b5:  br IL_41ba

	IL_41ba:  ldarg 1

	IL_41be:  nop 
	IL_41bf:  nop 
	IL_41c0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_41c5:  ldstr "^(\\d)+(.)*$"
	IL_41ca:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_41cf:  stloc 1

	IL_41d3:  nop 
	IL_41d4:  nop 
	IL_41d5:  ldloc 1

	IL_41d9:  nop 
	IL_41da:  nop 
	IL_41db:  stloc 4

	IL_41df:  nop 
	IL_41e0:  nop 
	IL_41e1:  ldarg 1

	IL_41e5:  nop 
	IL_41e6:  nop 
	IL_41e7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_41ec:  ldstr "^\\+(\\d)+(.)*$"
	IL_41f1:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_41f6:  stloc 1

	IL_41fa:  nop 
	IL_41fb:  nop 
	IL_41fc:  ldloc 4

	IL_4200:  nop 
	IL_4201:  nop 
	IL_4202:  ldloc 1

	IL_4206:  nop 
	IL_4207:  nop 
	IL_4208:  or 
	IL_4209:  stloc 4

	IL_420d:  nop 
	IL_420e:  nop 
	IL_420f:  ldarg 1

	IL_4213:  nop 
	IL_4214:  nop 
	IL_4215:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_421a:  ldstr "^-(\\d)+(.)*$"
	IL_421f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4224:  stloc 1

	IL_4228:  nop 
	IL_4229:  nop 
	IL_422a:  ldloc 4

	IL_422e:  nop 
	IL_422f:  nop 
	IL_4230:  ldloc 1

	IL_4234:  nop 
	IL_4235:  nop 
	IL_4236:  or 
	IL_4237:  stloc 4

	IL_423b:  nop 
	IL_423c:  nop 
	IL_423d:  ldarg 1

	IL_4241:  nop 
	IL_4242:  nop 
	IL_4243:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4248:  stloc 2

	IL_424c:  nop 
	IL_424d:  nop 
	IL_424e:  ldloc 2

	IL_4252:  nop 
	IL_4253:  nop 
	IL_4254:  ldstr "l"
	IL_4259:  callvirt instance bool string::EndsWith(string)
	IL_425e:  stloc 1

	IL_4262:  nop 
	IL_4263:  nop 
	IL_4264:  ldloc 4

	IL_4268:  nop 
	IL_4269:  nop 
	IL_426a:  ldloc 1

	IL_426e:  nop 
	IL_426f:  nop 
	IL_4270:  and 
	IL_4271:  stloc 4

	IL_4275:  nop 
	IL_4276:  nop 
	IL_4277:  ldloc 4

	IL_427b:  nop 
	IL_427c:  nop 
	IL_427d:  ldc.i4 1
	IL_4282:  beq IL_428c

	IL_4287:  br IL_4343

	IL_428c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::'.ctor'()
	IL_4291:  stloc 108

	IL_4295:  nop 
	IL_4296:  nop 
	IL_4297:  ldloc 108

	IL_429b:  nop 
	IL_429c:  nop 
	IL_429d:  ldarg 1

	IL_42a1:  nop 
	IL_42a2:  nop 
	IL_42a3:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_42a8:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_42ad:  ldarg 1

	IL_42b1:  nop 
	IL_42b2:  nop 
	IL_42b3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_42b8:  stloc 2

	IL_42bc:  nop 
	IL_42bd:  nop 
	IL_42be:  ldc.i4 1
	IL_42c3:  conv.u 
	IL_42c4:  newarr [mscorlib]System.Char
	IL_42c9:  stloc 3

	IL_42cd:  nop 
	IL_42ce:  nop 
	IL_42cf:  ldloc 3

	IL_42d3:  nop 
	IL_42d4:  nop 
	IL_42d5:  ldc.i4 0
	IL_42da:  conv.u 
	IL_42db:  ldstr "l"
	IL_42e0:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_42e5:  stelem [mscorlib]System.Char
	IL_42ea:  ldloc 2

	IL_42ee:  nop 
	IL_42ef:  nop 
	IL_42f0:  ldloc 3

	IL_42f4:  nop 
	IL_42f5:  nop 
	IL_42f6:  callvirt instance string string::TrimEnd(char[])
	IL_42fb:  stloc 2

	IL_42ff:  nop 
	IL_4300:  nop 
	IL_4301:  ldloc 108

	IL_4305:  nop 
	IL_4306:  nop 
	IL_4307:  ldloc 2

	IL_430b:  nop 
	IL_430c:  nop 
	IL_430d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4312:  ldloc 108

	IL_4316:  nop 
	IL_4317:  nop 
	IL_4318:  ldloc 108

	IL_431c:  nop 
	IL_431d:  nop 
	IL_431e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4323:  call int64 class [mscorlib]System.Convert::ToInt64(string)
	IL_4328:  stfld int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_432d:  ldloc 108

	IL_4331:  nop 
	IL_4332:  nop 
	IL_4333:  starg 1

	IL_4337:  nop 
	IL_4338:  nop 
	IL_4339:  br IL_4bdf

	IL_433e:  br IL_4348

	IL_4343:  br IL_4348

	IL_4348:  ldarg 1

	IL_434c:  nop 
	IL_434d:  nop 
	IL_434e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4353:  ldstr "^(\\d)+(.)*$"
	IL_4358:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_435d:  stloc 1

	IL_4361:  nop 
	IL_4362:  nop 
	IL_4363:  ldloc 1

	IL_4367:  nop 
	IL_4368:  nop 
	IL_4369:  stloc 4

	IL_436d:  nop 
	IL_436e:  nop 
	IL_436f:  ldarg 1

	IL_4373:  nop 
	IL_4374:  nop 
	IL_4375:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_437a:  ldstr "^\\+(\\d)+(.)*$"
	IL_437f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4384:  stloc 1

	IL_4388:  nop 
	IL_4389:  nop 
	IL_438a:  ldloc 4

	IL_438e:  nop 
	IL_438f:  nop 
	IL_4390:  ldloc 1

	IL_4394:  nop 
	IL_4395:  nop 
	IL_4396:  or 
	IL_4397:  stloc 4

	IL_439b:  nop 
	IL_439c:  nop 
	IL_439d:  ldarg 1

	IL_43a1:  nop 
	IL_43a2:  nop 
	IL_43a3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43a8:  ldstr "^-(\\d)+(.)*$"
	IL_43ad:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_43b2:  stloc 1

	IL_43b6:  nop 
	IL_43b7:  nop 
	IL_43b8:  ldloc 4

	IL_43bc:  nop 
	IL_43bd:  nop 
	IL_43be:  ldloc 1

	IL_43c2:  nop 
	IL_43c3:  nop 
	IL_43c4:  or 
	IL_43c5:  stloc 4

	IL_43c9:  nop 
	IL_43ca:  nop 
	IL_43cb:  ldarg 1

	IL_43cf:  nop 
	IL_43d0:  nop 
	IL_43d1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_43d6:  stloc 2

	IL_43da:  nop 
	IL_43db:  nop 
	IL_43dc:  ldloc 2

	IL_43e0:  nop 
	IL_43e1:  nop 
	IL_43e2:  ldstr "us"
	IL_43e7:  callvirt instance bool string::EndsWith(string)
	IL_43ec:  stloc 1

	IL_43f0:  nop 
	IL_43f1:  nop 
	IL_43f2:  ldloc 4

	IL_43f6:  nop 
	IL_43f7:  nop 
	IL_43f8:  ldloc 1

	IL_43fc:  nop 
	IL_43fd:  nop 
	IL_43fe:  and 
	IL_43ff:  stloc 4

	IL_4403:  nop 
	IL_4404:  nop 
	IL_4405:  ldloc 4

	IL_4409:  nop 
	IL_440a:  nop 
	IL_440b:  ldc.i4 1
	IL_4410:  beq IL_441a

	IL_4415:  br IL_4503

	IL_441a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::'.ctor'()
	IL_441f:  stloc 109

	IL_4423:  nop 
	IL_4424:  nop 
	IL_4425:  ldloc 109

	IL_4429:  nop 
	IL_442a:  nop 
	IL_442b:  ldarg 1

	IL_442f:  nop 
	IL_4430:  nop 
	IL_4431:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4436:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_443b:  ldarg 1

	IL_443f:  nop 
	IL_4440:  nop 
	IL_4441:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4446:  stloc 2

	IL_444a:  nop 
	IL_444b:  nop 
	IL_444c:  ldc.i4 1
	IL_4451:  conv.u 
	IL_4452:  newarr [mscorlib]System.Char
	IL_4457:  stloc 3

	IL_445b:  nop 
	IL_445c:  nop 
	IL_445d:  ldloc 3

	IL_4461:  nop 
	IL_4462:  nop 
	IL_4463:  ldc.i4 0
	IL_4468:  conv.u 
	IL_4469:  ldstr "s"
	IL_446e:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4473:  stelem [mscorlib]System.Char
	IL_4478:  ldloc 2

	IL_447c:  nop 
	IL_447d:  nop 
	IL_447e:  ldloc 3

	IL_4482:  nop 
	IL_4483:  nop 
	IL_4484:  callvirt instance string string::TrimEnd(char[])
	IL_4489:  stloc 2

	IL_448d:  nop 
	IL_448e:  nop 
	IL_448f:  ldloc 3

	IL_4493:  nop 
	IL_4494:  nop 
	IL_4495:  ldc.i4 0
	IL_449a:  conv.u 
	IL_449b:  ldstr "u"
	IL_44a0:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_44a5:  stelem [mscorlib]System.Char
	IL_44aa:  ldloc 2

	IL_44ae:  nop 
	IL_44af:  nop 
	IL_44b0:  ldloc 3

	IL_44b4:  nop 
	IL_44b5:  nop 
	IL_44b6:  callvirt instance string string::TrimEnd(char[])
	IL_44bb:  stloc 2

	IL_44bf:  nop 
	IL_44c0:  nop 
	IL_44c1:  ldloc 109

	IL_44c5:  nop 
	IL_44c6:  nop 
	IL_44c7:  ldloc 2

	IL_44cb:  nop 
	IL_44cc:  nop 
	IL_44cd:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_44d2:  ldloc 109

	IL_44d6:  nop 
	IL_44d7:  nop 
	IL_44d8:  ldloc 109

	IL_44dc:  nop 
	IL_44dd:  nop 
	IL_44de:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_44e3:  call unsigned int16 class [mscorlib]System.Convert::ToUInt16(string)
	IL_44e8:  stfld unsigned int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.UShortLiteral::NumVal
	IL_44ed:  ldloc 109

	IL_44f1:  nop 
	IL_44f2:  nop 
	IL_44f3:  starg 1

	IL_44f7:  nop 
	IL_44f8:  nop 
	IL_44f9:  br IL_4bdf

	IL_44fe:  br IL_4508

	IL_4503:  br IL_4508

	IL_4508:  ldarg 1

	IL_450c:  nop 
	IL_450d:  nop 
	IL_450e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4513:  ldstr "^(\\d)+(.)*$"
	IL_4518:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_451d:  stloc 1

	IL_4521:  nop 
	IL_4522:  nop 
	IL_4523:  ldloc 1

	IL_4527:  nop 
	IL_4528:  nop 
	IL_4529:  stloc 4

	IL_452d:  nop 
	IL_452e:  nop 
	IL_452f:  ldarg 1

	IL_4533:  nop 
	IL_4534:  nop 
	IL_4535:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_453a:  ldstr "^\\+(\\d)+(.)*$"
	IL_453f:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4544:  stloc 1

	IL_4548:  nop 
	IL_4549:  nop 
	IL_454a:  ldloc 4

	IL_454e:  nop 
	IL_454f:  nop 
	IL_4550:  ldloc 1

	IL_4554:  nop 
	IL_4555:  nop 
	IL_4556:  or 
	IL_4557:  stloc 4

	IL_455b:  nop 
	IL_455c:  nop 
	IL_455d:  ldarg 1

	IL_4561:  nop 
	IL_4562:  nop 
	IL_4563:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4568:  ldstr "^-(\\d)+(.)*$"
	IL_456d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4572:  stloc 1

	IL_4576:  nop 
	IL_4577:  nop 
	IL_4578:  ldloc 4

	IL_457c:  nop 
	IL_457d:  nop 
	IL_457e:  ldloc 1

	IL_4582:  nop 
	IL_4583:  nop 
	IL_4584:  or 
	IL_4585:  stloc 4

	IL_4589:  nop 
	IL_458a:  nop 
	IL_458b:  ldarg 1

	IL_458f:  nop 
	IL_4590:  nop 
	IL_4591:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4596:  stloc 2

	IL_459a:  nop 
	IL_459b:  nop 
	IL_459c:  ldloc 2

	IL_45a0:  nop 
	IL_45a1:  nop 
	IL_45a2:  ldstr "s"
	IL_45a7:  callvirt instance bool string::EndsWith(string)
	IL_45ac:  stloc 1

	IL_45b0:  nop 
	IL_45b1:  nop 
	IL_45b2:  ldloc 4

	IL_45b6:  nop 
	IL_45b7:  nop 
	IL_45b8:  ldloc 1

	IL_45bc:  nop 
	IL_45bd:  nop 
	IL_45be:  and 
	IL_45bf:  stloc 4

	IL_45c3:  nop 
	IL_45c4:  nop 
	IL_45c5:  ldloc 4

	IL_45c9:  nop 
	IL_45ca:  nop 
	IL_45cb:  ldc.i4 1
	IL_45d0:  beq IL_45da

	IL_45d5:  br IL_4691

	IL_45da:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::'.ctor'()
	IL_45df:  stloc 110

	IL_45e3:  nop 
	IL_45e4:  nop 
	IL_45e5:  ldloc 110

	IL_45e9:  nop 
	IL_45ea:  nop 
	IL_45eb:  ldarg 1

	IL_45ef:  nop 
	IL_45f0:  nop 
	IL_45f1:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_45f6:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_45fb:  ldarg 1

	IL_45ff:  nop 
	IL_4600:  nop 
	IL_4601:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4606:  stloc 2

	IL_460a:  nop 
	IL_460b:  nop 
	IL_460c:  ldc.i4 1
	IL_4611:  conv.u 
	IL_4612:  newarr [mscorlib]System.Char
	IL_4617:  stloc 3

	IL_461b:  nop 
	IL_461c:  nop 
	IL_461d:  ldloc 3

	IL_4621:  nop 
	IL_4622:  nop 
	IL_4623:  ldc.i4 0
	IL_4628:  conv.u 
	IL_4629:  ldstr "s"
	IL_462e:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4633:  stelem [mscorlib]System.Char
	IL_4638:  ldloc 2

	IL_463c:  nop 
	IL_463d:  nop 
	IL_463e:  ldloc 3

	IL_4642:  nop 
	IL_4643:  nop 
	IL_4644:  callvirt instance string string::TrimEnd(char[])
	IL_4649:  stloc 2

	IL_464d:  nop 
	IL_464e:  nop 
	IL_464f:  ldloc 110

	IL_4653:  nop 
	IL_4654:  nop 
	IL_4655:  ldloc 2

	IL_4659:  nop 
	IL_465a:  nop 
	IL_465b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4660:  ldloc 110

	IL_4664:  nop 
	IL_4665:  nop 
	IL_4666:  ldloc 110

	IL_466a:  nop 
	IL_466b:  nop 
	IL_466c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4671:  call int16 class [mscorlib]System.Convert::ToInt16(string)
	IL_4676:  stfld int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_467b:  ldloc 110

	IL_467f:  nop 
	IL_4680:  nop 
	IL_4681:  starg 1

	IL_4685:  nop 
	IL_4686:  nop 
	IL_4687:  br IL_4bdf

	IL_468c:  br IL_4696

	IL_4691:  br IL_4696

	IL_4696:  ldarg 1

	IL_469a:  nop 
	IL_469b:  nop 
	IL_469c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46a1:  ldstr "^(\\d)+(.)*$"
	IL_46a6:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_46ab:  stloc 1

	IL_46af:  nop 
	IL_46b0:  nop 
	IL_46b1:  ldloc 1

	IL_46b5:  nop 
	IL_46b6:  nop 
	IL_46b7:  stloc 4

	IL_46bb:  nop 
	IL_46bc:  nop 
	IL_46bd:  ldarg 1

	IL_46c1:  nop 
	IL_46c2:  nop 
	IL_46c3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46c8:  ldstr "^\\+(\\d)+(.)*$"
	IL_46cd:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_46d2:  stloc 1

	IL_46d6:  nop 
	IL_46d7:  nop 
	IL_46d8:  ldloc 4

	IL_46dc:  nop 
	IL_46dd:  nop 
	IL_46de:  ldloc 1

	IL_46e2:  nop 
	IL_46e3:  nop 
	IL_46e4:  or 
	IL_46e5:  stloc 4

	IL_46e9:  nop 
	IL_46ea:  nop 
	IL_46eb:  ldarg 1

	IL_46ef:  nop 
	IL_46f0:  nop 
	IL_46f1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_46f6:  ldstr "^-(\\d)+(.)*$"
	IL_46fb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4700:  stloc 1

	IL_4704:  nop 
	IL_4705:  nop 
	IL_4706:  ldloc 4

	IL_470a:  nop 
	IL_470b:  nop 
	IL_470c:  ldloc 1

	IL_4710:  nop 
	IL_4711:  nop 
	IL_4712:  or 
	IL_4713:  stloc 4

	IL_4717:  nop 
	IL_4718:  nop 
	IL_4719:  ldarg 1

	IL_471d:  nop 
	IL_471e:  nop 
	IL_471f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4724:  stloc 2

	IL_4728:  nop 
	IL_4729:  nop 
	IL_472a:  ldloc 2

	IL_472e:  nop 
	IL_472f:  nop 
	IL_4730:  ldstr "ub"
	IL_4735:  callvirt instance bool string::EndsWith(string)
	IL_473a:  stloc 1

	IL_473e:  nop 
	IL_473f:  nop 
	IL_4740:  ldloc 4

	IL_4744:  nop 
	IL_4745:  nop 
	IL_4746:  ldloc 1

	IL_474a:  nop 
	IL_474b:  nop 
	IL_474c:  and 
	IL_474d:  stloc 4

	IL_4751:  nop 
	IL_4752:  nop 
	IL_4753:  ldloc 4

	IL_4757:  nop 
	IL_4758:  nop 
	IL_4759:  ldc.i4 1
	IL_475e:  beq IL_4768

	IL_4763:  br IL_4851

	IL_4768:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::'.ctor'()
	IL_476d:  stloc 111

	IL_4771:  nop 
	IL_4772:  nop 
	IL_4773:  ldloc 111

	IL_4777:  nop 
	IL_4778:  nop 
	IL_4779:  ldarg 1

	IL_477d:  nop 
	IL_477e:  nop 
	IL_477f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4784:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4789:  ldarg 1

	IL_478d:  nop 
	IL_478e:  nop 
	IL_478f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4794:  stloc 2

	IL_4798:  nop 
	IL_4799:  nop 
	IL_479a:  ldc.i4 1
	IL_479f:  conv.u 
	IL_47a0:  newarr [mscorlib]System.Char
	IL_47a5:  stloc 3

	IL_47a9:  nop 
	IL_47aa:  nop 
	IL_47ab:  ldloc 3

	IL_47af:  nop 
	IL_47b0:  nop 
	IL_47b1:  ldc.i4 0
	IL_47b6:  conv.u 
	IL_47b7:  ldstr "b"
	IL_47bc:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_47c1:  stelem [mscorlib]System.Char
	IL_47c6:  ldloc 2

	IL_47ca:  nop 
	IL_47cb:  nop 
	IL_47cc:  ldloc 3

	IL_47d0:  nop 
	IL_47d1:  nop 
	IL_47d2:  callvirt instance string string::TrimEnd(char[])
	IL_47d7:  stloc 2

	IL_47db:  nop 
	IL_47dc:  nop 
	IL_47dd:  ldloc 3

	IL_47e1:  nop 
	IL_47e2:  nop 
	IL_47e3:  ldc.i4 0
	IL_47e8:  conv.u 
	IL_47e9:  ldstr "u"
	IL_47ee:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_47f3:  stelem [mscorlib]System.Char
	IL_47f8:  ldloc 2

	IL_47fc:  nop 
	IL_47fd:  nop 
	IL_47fe:  ldloc 3

	IL_4802:  nop 
	IL_4803:  nop 
	IL_4804:  callvirt instance string string::TrimEnd(char[])
	IL_4809:  stloc 2

	IL_480d:  nop 
	IL_480e:  nop 
	IL_480f:  ldloc 111

	IL_4813:  nop 
	IL_4814:  nop 
	IL_4815:  ldloc 2

	IL_4819:  nop 
	IL_481a:  nop 
	IL_481b:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4820:  ldloc 111

	IL_4824:  nop 
	IL_4825:  nop 
	IL_4826:  ldloc 111

	IL_482a:  nop 
	IL_482b:  nop 
	IL_482c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4831:  call unsigned int8 class [mscorlib]System.Convert::ToByte(string)
	IL_4836:  stfld unsigned int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ByteLiteral::NumVal
	IL_483b:  ldloc 111

	IL_483f:  nop 
	IL_4840:  nop 
	IL_4841:  starg 1

	IL_4845:  nop 
	IL_4846:  nop 
	IL_4847:  br IL_4bdf

	IL_484c:  br IL_4856

	IL_4851:  br IL_4856

	IL_4856:  ldarg 1

	IL_485a:  nop 
	IL_485b:  nop 
	IL_485c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4861:  ldstr "^(\\d)+(.)*$"
	IL_4866:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_486b:  stloc 1

	IL_486f:  nop 
	IL_4870:  nop 
	IL_4871:  ldloc 1

	IL_4875:  nop 
	IL_4876:  nop 
	IL_4877:  stloc 4

	IL_487b:  nop 
	IL_487c:  nop 
	IL_487d:  ldarg 1

	IL_4881:  nop 
	IL_4882:  nop 
	IL_4883:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4888:  ldstr "^\\+(\\d)+(.)*$"
	IL_488d:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4892:  stloc 1

	IL_4896:  nop 
	IL_4897:  nop 
	IL_4898:  ldloc 4

	IL_489c:  nop 
	IL_489d:  nop 
	IL_489e:  ldloc 1

	IL_48a2:  nop 
	IL_48a3:  nop 
	IL_48a4:  or 
	IL_48a5:  stloc 4

	IL_48a9:  nop 
	IL_48aa:  nop 
	IL_48ab:  ldarg 1

	IL_48af:  nop 
	IL_48b0:  nop 
	IL_48b1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48b6:  ldstr "^-(\\d)+(.)*$"
	IL_48bb:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_48c0:  stloc 1

	IL_48c4:  nop 
	IL_48c5:  nop 
	IL_48c6:  ldloc 4

	IL_48ca:  nop 
	IL_48cb:  nop 
	IL_48cc:  ldloc 1

	IL_48d0:  nop 
	IL_48d1:  nop 
	IL_48d2:  or 
	IL_48d3:  stloc 4

	IL_48d7:  nop 
	IL_48d8:  nop 
	IL_48d9:  ldarg 1

	IL_48dd:  nop 
	IL_48de:  nop 
	IL_48df:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_48e4:  stloc 2

	IL_48e8:  nop 
	IL_48e9:  nop 
	IL_48ea:  ldloc 2

	IL_48ee:  nop 
	IL_48ef:  nop 
	IL_48f0:  ldstr "b"
	IL_48f5:  callvirt instance bool string::EndsWith(string)
	IL_48fa:  stloc 1

	IL_48fe:  nop 
	IL_48ff:  nop 
	IL_4900:  ldloc 4

	IL_4904:  nop 
	IL_4905:  nop 
	IL_4906:  ldloc 1

	IL_490a:  nop 
	IL_490b:  nop 
	IL_490c:  and 
	IL_490d:  stloc 4

	IL_4911:  nop 
	IL_4912:  nop 
	IL_4913:  ldloc 4

	IL_4917:  nop 
	IL_4918:  nop 
	IL_4919:  ldc.i4 1
	IL_491e:  beq IL_4928

	IL_4923:  br IL_49df

	IL_4928:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::'.ctor'()
	IL_492d:  stloc 112

	IL_4931:  nop 
	IL_4932:  nop 
	IL_4933:  ldloc 112

	IL_4937:  nop 
	IL_4938:  nop 
	IL_4939:  ldarg 1

	IL_493d:  nop 
	IL_493e:  nop 
	IL_493f:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4944:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4949:  ldarg 1

	IL_494d:  nop 
	IL_494e:  nop 
	IL_494f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4954:  stloc 2

	IL_4958:  nop 
	IL_4959:  nop 
	IL_495a:  ldc.i4 1
	IL_495f:  conv.u 
	IL_4960:  newarr [mscorlib]System.Char
	IL_4965:  stloc 3

	IL_4969:  nop 
	IL_496a:  nop 
	IL_496b:  ldloc 3

	IL_496f:  nop 
	IL_4970:  nop 
	IL_4971:  ldc.i4 0
	IL_4976:  conv.u 
	IL_4977:  ldstr "b"
	IL_497c:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_4981:  stelem [mscorlib]System.Char
	IL_4986:  ldloc 2

	IL_498a:  nop 
	IL_498b:  nop 
	IL_498c:  ldloc 3

	IL_4990:  nop 
	IL_4991:  nop 
	IL_4992:  callvirt instance string string::TrimEnd(char[])
	IL_4997:  stloc 2

	IL_499b:  nop 
	IL_499c:  nop 
	IL_499d:  ldloc 112

	IL_49a1:  nop 
	IL_49a2:  nop 
	IL_49a3:  ldloc 2

	IL_49a7:  nop 
	IL_49a8:  nop 
	IL_49a9:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_49ae:  ldloc 112

	IL_49b2:  nop 
	IL_49b3:  nop 
	IL_49b4:  ldloc 112

	IL_49b8:  nop 
	IL_49b9:  nop 
	IL_49ba:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_49bf:  call int8 class [mscorlib]System.Convert::ToSByte(string)
	IL_49c4:  stfld int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_49c9:  ldloc 112

	IL_49cd:  nop 
	IL_49ce:  nop 
	IL_49cf:  starg 1

	IL_49d3:  nop 
	IL_49d4:  nop 
	IL_49d5:  br IL_4bdf

	IL_49da:  br IL_49e4

	IL_49df:  br IL_49e4

	IL_49e4:  ldarg 1

	IL_49e8:  nop 
	IL_49e9:  nop 
	IL_49ea:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_49ef:  ldstr "^(\\d)+(.)*$"
	IL_49f4:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_49f9:  stloc 1

	IL_49fd:  nop 
	IL_49fe:  nop 
	IL_49ff:  ldloc 1

	IL_4a03:  nop 
	IL_4a04:  nop 
	IL_4a05:  stloc 4

	IL_4a09:  nop 
	IL_4a0a:  nop 
	IL_4a0b:  ldarg 1

	IL_4a0f:  nop 
	IL_4a10:  nop 
	IL_4a11:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a16:  ldstr "^\\+(\\d)+(.)*$"
	IL_4a1b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4a20:  stloc 1

	IL_4a24:  nop 
	IL_4a25:  nop 
	IL_4a26:  ldloc 4

	IL_4a2a:  nop 
	IL_4a2b:  nop 
	IL_4a2c:  ldloc 1

	IL_4a30:  nop 
	IL_4a31:  nop 
	IL_4a32:  or 
	IL_4a33:  stloc 4

	IL_4a37:  nop 
	IL_4a38:  nop 
	IL_4a39:  ldarg 1

	IL_4a3d:  nop 
	IL_4a3e:  nop 
	IL_4a3f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4a44:  ldstr "^-(\\d)+(.)*$"
	IL_4a49:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4a4e:  stloc 1

	IL_4a52:  nop 
	IL_4a53:  nop 
	IL_4a54:  ldloc 4

	IL_4a58:  nop 
	IL_4a59:  nop 
	IL_4a5a:  ldloc 1

	IL_4a5e:  nop 
	IL_4a5f:  nop 
	IL_4a60:  or 
	IL_4a61:  stloc 4

	IL_4a65:  nop 
	IL_4a66:  nop 
	IL_4a67:  ldloc 4

	IL_4a6b:  nop 
	IL_4a6c:  nop 
	IL_4a6d:  ldc.i4 1
	IL_4a72:  beq IL_4a7c

	IL_4a77:  br IL_4af0

	IL_4a7c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_4a81:  stloc 113

	IL_4a85:  nop 
	IL_4a86:  nop 
	IL_4a87:  ldloc 113

	IL_4a8b:  nop 
	IL_4a8c:  nop 
	IL_4a8d:  ldarg 1

	IL_4a91:  nop 
	IL_4a92:  nop 
	IL_4a93:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4a98:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4a9d:  ldarg 1

	IL_4aa1:  nop 
	IL_4aa2:  nop 
	IL_4aa3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4aa8:  stloc 2

	IL_4aac:  nop 
	IL_4aad:  nop 
	IL_4aae:  ldloc 113

	IL_4ab2:  nop 
	IL_4ab3:  nop 
	IL_4ab4:  ldloc 2

	IL_4ab8:  nop 
	IL_4ab9:  nop 
	IL_4aba:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4abf:  ldloc 113

	IL_4ac3:  nop 
	IL_4ac4:  nop 
	IL_4ac5:  ldloc 113

	IL_4ac9:  nop 
	IL_4aca:  nop 
	IL_4acb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4ad0:  call int32 class [mscorlib]System.Convert::ToInt32(string)
	IL_4ad5:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_4ada:  ldloc 113

	IL_4ade:  nop 
	IL_4adf:  nop 
	IL_4ae0:  starg 1

	IL_4ae4:  nop 
	IL_4ae5:  nop 
	IL_4ae6:  br IL_4bdf

	IL_4aeb:  br IL_4af5

	IL_4af0:  br IL_4af5

	IL_4af5:  ldarg 1

	IL_4af9:  nop 
	IL_4afa:  nop 
	IL_4afb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b00:  ldstr "^([a-zA-Z])+(.)*$"
	IL_4b05:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b0a:  stloc 1

	IL_4b0e:  nop 
	IL_4b0f:  nop 
	IL_4b10:  ldloc 1

	IL_4b14:  nop 
	IL_4b15:  nop 
	IL_4b16:  stloc 4

	IL_4b1a:  nop 
	IL_4b1b:  nop 
	IL_4b1c:  ldarg 1

	IL_4b20:  nop 
	IL_4b21:  nop 
	IL_4b22:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b27:  ldstr "^_(.)*([a-zA-Z])+(.)*$"
	IL_4b2c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b31:  stloc 1

	IL_4b35:  nop 
	IL_4b36:  nop 
	IL_4b37:  ldloc 4

	IL_4b3b:  nop 
	IL_4b3c:  nop 
	IL_4b3d:  ldloc 1

	IL_4b41:  nop 
	IL_4b42:  nop 
	IL_4b43:  or 
	IL_4b44:  stloc 4

	IL_4b48:  nop 
	IL_4b49:  nop 
	IL_4b4a:  ldarg 1

	IL_4b4e:  nop 
	IL_4b4f:  nop 
	IL_4b50:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4b55:  ldstr "^::(.)*([a-zA-Z])+(.)*$"
	IL_4b5a:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_4b5f:  stloc 1

	IL_4b63:  nop 
	IL_4b64:  nop 
	IL_4b65:  ldloc 4

	IL_4b69:  nop 
	IL_4b6a:  nop 
	IL_4b6b:  ldloc 1

	IL_4b6f:  nop 
	IL_4b70:  nop 
	IL_4b71:  or 
	IL_4b72:  stloc 4

	IL_4b76:  nop 
	IL_4b77:  nop 
	IL_4b78:  ldloc 4

	IL_4b7c:  nop 
	IL_4b7d:  nop 
	IL_4b7e:  ldc.i4 1
	IL_4b83:  beq IL_4b8d

	IL_4b88:  br IL_4bda

	IL_4b8d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::'.ctor'()
	IL_4b92:  stloc 114

	IL_4b96:  nop 
	IL_4b97:  nop 
	IL_4b98:  ldloc 114

	IL_4b9c:  nop 
	IL_4b9d:  nop 
	IL_4b9e:  ldarg 1

	IL_4ba2:  nop 
	IL_4ba3:  nop 
	IL_4ba4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4ba9:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Line
	IL_4bae:  ldloc 114

	IL_4bb2:  nop 
	IL_4bb3:  nop 
	IL_4bb4:  ldarg 1

	IL_4bb8:  nop 
	IL_4bb9:  nop 
	IL_4bba:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4bbf:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_4bc4:  ldloc 114

	IL_4bc8:  nop 
	IL_4bc9:  nop 
	IL_4bca:  starg 1

	IL_4bce:  nop 
	IL_4bcf:  nop 
	IL_4bd0:  br IL_4bdf

	IL_4bd5:  br IL_4bdf

	IL_4bda:  br IL_4bdf

	IL_4bdf:  ldarg 1

	IL_4be3:  nop 
	IL_4be4:  nop 
	IL_4be5:  ret 
    } // end of method TokenOptimizer::Optimize

    // method line 10
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x6f74
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
        // Method begins at RVA 0x6f88
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
        // Method begins at RVA 0x7150
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
        // Method begins at RVA 0x7284
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
        // Method begins at RVA 0x77c0
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
        // Method begins at RVA 0x7cc0
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
        // Method begins at RVA 0x80b8
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
        // Method begins at RVA 0x84dc
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
        // Method begins at RVA 0x9dcc
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
        // Method begins at RVA 0x9de0
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
        // Method begins at RVA 0x9ebc
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
        // Method begins at RVA 0xa094
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
        // Method begins at RVA 0xa26c
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
        // Method begins at RVA 0xa354
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
        // Method begins at RVA 0xa43c
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
        // Method begins at RVA 0xa518
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
        // Method begins at RVA 0xa5f4
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
        // Method begins at RVA 0xa7d4
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
        // Method begins at RVA 0xa890
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
        // Method begins at RVA 0xa980
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
        // Method begins at RVA 0xaabc
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
        // Method begins at RVA 0xabf8
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
        // Method begins at RVA 0xad34
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
        // Method begins at RVA 0xae34
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
        // Method begins at RVA 0xb190
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
        // Method begins at RVA 0xb4d0
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
        // Method begins at RVA 0xb824
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
        // Method begins at RVA 0xbf38
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
        // Method begins at RVA 0xc488
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
        // Method begins at RVA 0xc6ac
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
        // Method begins at RVA 0xc8d0
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
        // Method begins at RVA 0xcbd4
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
        // Method begins at RVA 0xd34c
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
        // Method begins at RVA 0xd360
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
        // Method begins at RVA 0xd42c
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Parser::.ctor

  } // end of class dylan.NET.Tokenizer.Parser.Parser
}

