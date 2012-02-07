.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:8:3
}
.assembly extern dnr
{
  .ver 11:2:8:3
}
.assembly extern dnu
{
  .ver 11:2:8:3
}
.assembly extern tokenizer.Lexer
{
  .ver 11:2:8:3
}
.assembly extern tokenizer.Parser
{
  .ver 11:2:8:3
}
.assembly 'tokenizer.CodeGen'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 33 00 00 ) // ...11.2.8.3..

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (
		01 00 11 74 6F 6B 65 6E 69 7A 65 72 2E 43 6F 64   // ...tokenizer.Cod
		65 47 65 6E 00 00                               ) // eGen..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (
		01 00 11 74 6F 6B 65 6E 69 7A 65 72 2E 43 6F 64   // ...tokenizer.Cod
		65 47 65 6E 00 00                               ) // eGen..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (
		01 00 11 74 6F 6B 65 6E 69 7A 65 72 2E 43 6F 64   // ...tokenizer.Cod
		65 47 65 6E 00 00                               ) // eGen..

  .hash algorithm 0x00008004
  .ver  11:2:8:3
}
.module tokenizer.CodeGen.dll // GUID = {77F06E1D-1F56-4BAD-9D25-146EAB57AB93}


.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi VarItem
  	extends [mscorlib]System.Object
  {
    .field  public  string Name
    .field  public  bool LocArg
    .field  public  int32 Index
    .field  public  class [mscorlib]System.Type VarTyp

    // method line 1
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 47 (0x2f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.CodeGen.VarItem::Name
	IL_0011:  ldarg.0 
	IL_0012:  ldc.i4 0
	IL_0017:  stfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_001c:  ldarg.0 
	IL_001d:  ldc.i4 -1
	IL_0022:  stfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_0027:  ldarg.0 
	IL_0028:  ldnull 
	IL_0029:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_002e:  ret 
    } // end of method VarItem::.ctor

    // method line 2
    .method public specialname rtspecialname 
           instance default void '.ctor' (string nme, bool la, int32 ind, class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x208c
	// Code size 55 (0x37)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.CodeGen.VarItem::Name
	IL_0012:  ldarg.0 
	IL_0013:  ldarg 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  stfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_001e:  ldarg.0 
	IL_001f:  ldarg 3

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  stfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_002a:  ldarg.0 
	IL_002b:  ldarg 4

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_0036:  ret 
    } // end of method VarItem::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.VarItem
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi FieldItem
  	extends [mscorlib]System.Object
  {
    .field  public  string Name
    .field  public  class [mscorlib]System.Type FieldTyp
    .field  public  class [mscorlib]System.Reflection.Emit.FieldBuilder FieldBldr
    .field  public  class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal LitVal

    // method line 3
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x20d0
	// Code size 39 (0x27)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.CodeGen.FieldItem::Name
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.FieldItem::FieldTyp
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class [mscorlib]System.Reflection.Emit.FieldBuilder dylan.NET.Tokenizer.CodeGen.FieldItem::FieldBldr
	IL_001f:  ldarg.0 
	IL_0020:  ldnull 
	IL_0021:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal dylan.NET.Tokenizer.CodeGen.FieldItem::LitVal
	IL_0026:  ret 
    } // end of method FieldItem::.ctor

    // method line 4
    .method public specialname rtspecialname 
           instance default void '.ctor' (string nme, class [mscorlib]System.Type typ, class [mscorlib]System.Reflection.Emit.FieldBuilder bld)  cil managed 
    {
        // Method begins at RVA 0x2104
	// Code size 50 (0x32)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.CodeGen.FieldItem::Name
	IL_0012:  ldarg.0 
	IL_0013:  ldarg 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.FieldItem::FieldTyp
	IL_001e:  ldarg.0 
	IL_001f:  ldarg 3

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  stfld class [mscorlib]System.Reflection.Emit.FieldBuilder dylan.NET.Tokenizer.CodeGen.FieldItem::FieldBldr
	IL_002a:  ldarg.0 
	IL_002b:  ldnull 
	IL_002c:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal dylan.NET.Tokenizer.CodeGen.FieldItem::LitVal
	IL_0031:  ret 
    } // end of method FieldItem::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.FieldItem
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi MethodItem
  	extends [mscorlib]System.Object
  {
    .field  public  string Name
    .field  public  class [mscorlib]System.Type MethodTyp
    .field  public  class [mscorlib]System.Type[] ParamTyps
    .field  public  class [mscorlib]System.Reflection.Emit.MethodBuilder MethodBldr

    // method line 5
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2144
	// Code size 49 (0x31)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.CodeGen.MethodItem::Name
	IL_0011:  ldarg.0 
	IL_0012:  ldnull 
	IL_0013:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.MethodItem::MethodTyp
	IL_0018:  ldarg.0 
	IL_0019:  ldnull 
	IL_001a:  stfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Tokenizer.CodeGen.MethodItem::MethodBldr
	IL_001f:  ldarg.0 
	IL_0020:  ldc.i4 0
	IL_0025:  conv.u 
	IL_0026:  newarr [mscorlib]System.Type
	IL_002b:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.MethodItem::ParamTyps
	IL_0030:  ret 
    } // end of method MethodItem::.ctor

    // method line 6
    .method public specialname rtspecialname 
           instance default void '.ctor' (string nme, class [mscorlib]System.Type typ, class [mscorlib]System.Type[] ptyps, class [mscorlib]System.Reflection.Emit.MethodBuilder bld)  cil managed 
    {
        // Method begins at RVA 0x2184
	// Code size 55 (0x37)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.CodeGen.MethodItem::Name
	IL_0012:  ldarg.0 
	IL_0013:  ldarg 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  stfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.MethodItem::MethodTyp
	IL_001e:  ldarg.0 
	IL_001f:  ldarg 4

	IL_0023:  nop 
	IL_0024:  nop 
	IL_0025:  stfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Tokenizer.CodeGen.MethodItem::MethodBldr
	IL_002a:  ldarg.0 
	IL_002b:  ldarg 3

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.MethodItem::ParamTyps
	IL_0036:  ret 
    } // end of method MethodItem::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.MethodItem
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi CtorItem
  	extends [mscorlib]System.Object
  {
    .field  public  class [mscorlib]System.Type[] ParamTyps
    .field  public  class [mscorlib]System.Reflection.Emit.ConstructorBuilder CtorBldr

    // method line 7
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x21c8
	// Code size 31 (0x1f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldnull 
	IL_0008:  stfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Tokenizer.CodeGen.CtorItem::CtorBldr
	IL_000d:  ldarg.0 
	IL_000e:  ldc.i4 0
	IL_0013:  conv.u 
	IL_0014:  newarr [mscorlib]System.Type
	IL_0019:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.CtorItem::ParamTyps
	IL_001e:  ret 
    } // end of method CtorItem::.ctor

    // method line 8
    .method public specialname rtspecialname 
           instance default void '.ctor' (class [mscorlib]System.Type[] ptyps, class [mscorlib]System.Reflection.Emit.ConstructorBuilder bld)  cil managed 
    {
        // Method begins at RVA 0x21f4
	// Code size 31 (0x1f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 2

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Tokenizer.CodeGen.CtorItem::CtorBldr
	IL_0012:  ldarg.0 
	IL_0013:  ldarg 1

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.CtorItem::ParamTyps
	IL_001e:  ret 
    } // end of method CtorItem::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.CtorItem
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi LabelItem
  	extends [mscorlib]System.Object
  {
    .field  public  valuetype [mscorlib]System.Reflection.Emit.Label Lbl
    .field  public  string LblName

    // method line 9
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2220
	// Code size 18 (0x12)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldstr ""
	IL_000c:  stfld string dylan.NET.Tokenizer.CodeGen.LabelItem::LblName
	IL_0011:  ret 
    } // end of method LabelItem::.ctor

    // method line 10
    .method public specialname rtspecialname 
           instance default void '.ctor' (string ln, valuetype [mscorlib]System.Reflection.Emit.Label l)  cil managed 
    {
        // Method begins at RVA 0x2240
	// Code size 31 (0x1f)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld string dylan.NET.Tokenizer.CodeGen.LabelItem::LblName
	IL_0012:  ldarg.0 
	IL_0013:  ldarg 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  stfld valuetype [mscorlib]System.Reflection.Emit.Label dylan.NET.Tokenizer.CodeGen.LabelItem::Lbl
	IL_001e:  ret 
    } // end of method LabelItem::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.LabelItem
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi IfItem
  	extends [mscorlib]System.Object
  {
    .field  public  valuetype [mscorlib]System.Reflection.Emit.Label EndLabel
    .field  public  valuetype [mscorlib]System.Reflection.Emit.Label NextBlkLabel
    .field  public  bool ElsePass

    // method line 11
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x226c
	// Code size 18 (0x12)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  stfld bool dylan.NET.Tokenizer.CodeGen.IfItem::ElsePass
	IL_0011:  ret 
    } // end of method IfItem::.ctor

    // method line 12
    .method public specialname rtspecialname 
           instance default void '.ctor' (valuetype [mscorlib]System.Reflection.Emit.Label endl, valuetype [mscorlib]System.Reflection.Emit.Label nbl)  cil managed 
    {
        // Method begins at RVA 0x228c
	// Code size 42 (0x2a)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg 1

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  stfld valuetype [mscorlib]System.Reflection.Emit.Label dylan.NET.Tokenizer.CodeGen.IfItem::EndLabel
	IL_0012:  ldarg.0 
	IL_0013:  ldarg 2

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  stfld valuetype [mscorlib]System.Reflection.Emit.Label dylan.NET.Tokenizer.CodeGen.IfItem::NextBlkLabel
	IL_001e:  ldarg.0 
	IL_001f:  ldc.i4 0
	IL_0024:  stfld bool dylan.NET.Tokenizer.CodeGen.IfItem::ElsePass
	IL_0029:  ret 
    } // end of method IfItem::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.IfItem
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi TypeArr
  	extends [mscorlib]System.Object
  {
    .field  public  class [mscorlib]System.Type[] Arr

    // method line 13
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x22c4
	// Code size 24 (0x18)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldc.i4 0
	IL_000c:  conv.u 
	IL_000d:  newarr [mscorlib]System.Type
	IL_0012:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.TypeArr::Arr
	IL_0017:  ret 
    } // end of method TypeArr::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.TypeArr
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi beforefieldinit SymTable
  	extends [mscorlib]System.Object
  {
    .field  public static  class dylan.NET.Tokenizer.CodeGen.VarItem[] VarLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.FieldItem[] FldLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.FieldItem[] NestedFldLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.MethodItem[] MetLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.MethodItem[] NestedMetLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.CtorItem[] CtorLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.CtorItem[] NestedCtorLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.IfItem[] IfLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.LabelItem[] LblLst
    .field  public static  class dylan.NET.Tokenizer.CodeGen.TypeArr[] TypLst

    // method line 14
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x22e8
	// Code size 161 (0xa1)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.VarItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_0010:  ldc.i4 0
	IL_0015:  conv.u 
	IL_0016:  newarr dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_001b:  stsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_0020:  ldc.i4 0
	IL_0025:  conv.u 
	IL_0026:  newarr dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_002b:  stsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedFldLst
	IL_0030:  ldc.i4 0
	IL_0035:  conv.u 
	IL_0036:  newarr dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_003b:  stsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0040:  ldc.i4 0
	IL_0045:  conv.u 
	IL_0046:  newarr dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_004b:  stsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedMetLst
	IL_0050:  ldc.i4 0
	IL_0055:  conv.u 
	IL_0056:  newarr dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_005b:  stsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_0060:  ldc.i4 0
	IL_0065:  conv.u 
	IL_0066:  newarr dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_006b:  stsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedCtorLst
	IL_0070:  ldc.i4 0
	IL_0075:  conv.u 
	IL_0076:  newarr dylan.NET.Tokenizer.CodeGen.IfItem
	IL_007b:  stsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0080:  ldc.i4 0
	IL_0085:  conv.u 
	IL_0086:  newarr dylan.NET.Tokenizer.CodeGen.LabelItem
	IL_008b:  stsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_0090:  ldc.i4 0
	IL_0095:  conv.u 
	IL_0096:  newarr dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_009b:  stsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_00a0:  ret 
    } // end of method SymTable::.cctor

    // method line 15
    .method public static 
           default void ResetIf ()  cil managed 
    {
        // Method begins at RVA 0x2398
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.IfItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0010:  ret 
    } // end of method SymTable::ResetIf

    // method line 16
    .method public static 
           default void ResetLbl ()  cil managed 
    {
        // Method begins at RVA 0x23b8
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.LabelItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_0010:  ret 
    } // end of method SymTable::ResetLbl

    // method line 17
    .method public static 
           default void ResetVar ()  cil managed 
    {
        // Method begins at RVA 0x23d8
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.VarItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_0010:  ret 
    } // end of method SymTable::ResetVar

    // method line 18
    .method public static 
           default void ResetFld ()  cil managed 
    {
        // Method begins at RVA 0x23f8
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_0010:  ret 
    } // end of method SymTable::ResetFld

    // method line 19
    .method public static 
           default void ResetNestedFld ()  cil managed 
    {
        // Method begins at RVA 0x2418
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedFldLst
	IL_0010:  ret 
    } // end of method SymTable::ResetNestedFld

    // method line 20
    .method public static 
           default void ResetMet ()  cil managed 
    {
        // Method begins at RVA 0x2438
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0010:  ret 
    } // end of method SymTable::ResetMet

    // method line 21
    .method public static 
           default void ResetNestedMet ()  cil managed 
    {
        // Method begins at RVA 0x2458
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedMetLst
	IL_0010:  ret 
    } // end of method SymTable::ResetNestedMet

    // method line 22
    .method public static 
           default void ResetCtor ()  cil managed 
    {
        // Method begins at RVA 0x2478
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_0010:  ret 
    } // end of method SymTable::ResetCtor

    // method line 23
    .method public static 
           default void ResetNestedCtor ()  cil managed 
    {
        // Method begins at RVA 0x2498
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_000b:  stsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedCtorLst
	IL_0010:  ret 
    } // end of method SymTable::ResetNestedCtor

    // method line 24
    .method public static 
           default void AddVar (string nme, bool la, int32 ind, class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x24b8
	// Code size 311 (0x137)
	.maxstack 17
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.VarItem[]	V_5)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldarg 2

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldarg 3

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  newobj instance void class dylan.NET.Tokenizer.CodeGen.VarItem::'.ctor'(string, bool, int32, class [mscorlib]System.Type)
	IL_001d:  stloc 0

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  ldsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_0028:  ldlen 
	IL_0029:  conv.i4 
	IL_002a:  stloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldloc 1

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldc.i4 1
	IL_003b:  add 
	IL_003c:  stloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 1

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldc.i4 1
	IL_004d:  sub 
	IL_004e:  stloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 -1
	IL_0059:  stloc 4

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 2

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  conv.u 
	IL_0066:  newarr dylan.NET.Tokenizer.CodeGen.VarItem
	IL_006b:  stloc 5

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 4

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 1
	IL_007c:  add 
	IL_007d:  stloc 4

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldloc 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldc.i4 0
	IL_008e:  bgt IL_0098

	IL_0093:  br IL_00c0

	IL_0098:  ldloc 5

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldloc 4

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  conv.u 
	IL_00a5:  ldsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_00aa:  ldloc 4

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  conv.u 
	IL_00b1:  ldelem dylan.NET.Tokenizer.CodeGen.VarItem
	IL_00b6:  stelem dylan.NET.Tokenizer.CodeGen.VarItem
	IL_00bb:  br IL_00c5

	IL_00c0:  br IL_00c5

	IL_00c5:  ldloc 4

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  ldloc 3

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  beq IL_00db

	IL_00d6:  br IL_00e5

	IL_00db:  br IL_0113

	IL_00e0:  br IL_0113

	IL_00e5:  ldloc 3

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldc.i4 -1
	IL_00f0:  beq IL_0104

	IL_00f5:  br IL_00fa

	IL_00fa:  br IL_0071

	IL_00ff:  br IL_010e

	IL_0104:  br IL_0113

	IL_0109:  br IL_010e

	IL_010e:  br IL_0113

	IL_0113:  ldloc 5

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 1

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  conv.u 
	IL_0120:  ldloc 0

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  stelem dylan.NET.Tokenizer.CodeGen.VarItem
	IL_012b:  ldloc 5

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  stsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_0136:  ret 
    } // end of method SymTable::AddVar

    // method line 25
    .method public static 
           default int32 AddTypArr (class [mscorlib]System.Type[] arr)  cil managed 
    {
        // Method begins at RVA 0x25fc
	// Code size 310 (0x136)
	.maxstack 14
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.TypeArr	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.TypeArr[]	V_5)
	IL_0000:  newobj instance void class dylan.NET.Tokenizer.CodeGen.TypeArr::'.ctor'()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldloc 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldarg 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  stfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.TypeArr::Arr
	IL_001c:  ldsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_0021:  ldlen 
	IL_0022:  conv.i4 
	IL_0023:  stloc 1

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldloc 1

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  ldc.i4 1
	IL_0034:  add 
	IL_0035:  stloc 2

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldloc 1

	IL_003f:  nop 
	IL_0040:  nop 
	IL_0041:  ldc.i4 1
	IL_0046:  sub 
	IL_0047:  stloc 3

	IL_004b:  nop 
	IL_004c:  nop 
	IL_004d:  ldc.i4 -1
	IL_0052:  stloc 4

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldloc 2

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  conv.u 
	IL_005f:  newarr dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_0064:  stloc 5

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldloc 4

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldc.i4 1
	IL_0075:  add 
	IL_0076:  stloc 4

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 1

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldc.i4 0
	IL_0087:  bgt IL_0091

	IL_008c:  br IL_00b9

	IL_0091:  ldloc 5

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 4

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  conv.u 
	IL_009e:  ldsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_00a3:  ldloc 4

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  conv.u 
	IL_00aa:  ldelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_00af:  stelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_00b4:  br IL_00be

	IL_00b9:  br IL_00be

	IL_00be:  ldloc 4

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  ldloc 3

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  beq IL_00d4

	IL_00cf:  br IL_00de

	IL_00d4:  br IL_010c

	IL_00d9:  br IL_010c

	IL_00de:  ldloc 3

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  ldc.i4 -1
	IL_00e9:  beq IL_00fd

	IL_00ee:  br IL_00f3

	IL_00f3:  br IL_006a

	IL_00f8:  br IL_0107

	IL_00fd:  br IL_010c

	IL_0102:  br IL_0107

	IL_0107:  br IL_010c

	IL_010c:  ldloc 5

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldloc 1

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  conv.u 
	IL_0119:  ldloc 0

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  stelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_0124:  ldloc 5

	IL_0128:  nop 
	IL_0129:  nop 
	IL_012a:  stsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_012f:  ldloc 1

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  ret 
    } // end of method SymTable::AddTypArr

    // method line 26
    .method public static 
           default class [mscorlib]System.Type[] PopTypArr ()  cil managed 
    {
        // Method begins at RVA 0x2740
	// Code size 360 (0x168)
	.maxstack 14
	.locals init (
		class [mscorlib]System.Type[]	V_0,
		class dylan.NET.Tokenizer.CodeGen.TypeArr	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		int32	V_5,
		int32	V_6,
		class dylan.NET.Tokenizer.CodeGen.TypeArr[]	V_7)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldnull 
	IL_0008:  stloc 1

	IL_000c:  nop 
	IL_000d:  nop 
	IL_000e:  ldsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_0013:  ldlen 
	IL_0014:  conv.i4 
	IL_0015:  stloc 2

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldloc 2

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldc.i4 1
	IL_0026:  sub 
	IL_0027:  stloc 3

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ldloc 2

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldc.i4 1
	IL_0038:  sub 
	IL_0039:  stloc 4

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldc.i4 0
	IL_0044:  stloc 5

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldloc 3

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  conv.u 
	IL_0051:  newarr dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_0056:  stloc 7

	IL_005a:  nop 
	IL_005b:  nop 
	IL_005c:  ldloc 5

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 1
	IL_0067:  add 
	IL_0068:  stloc 5

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldloc 3

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldc.i4 0
	IL_0079:  bgt IL_0083

	IL_007e:  br IL_012a

	IL_0083:  ldloc 2

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldc.i4 0
	IL_008e:  bgt IL_0098

	IL_0093:  br IL_00d2

	IL_0098:  ldloc 5

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldc.i4 1
	IL_00a3:  sub 
	IL_00a4:  stloc 6

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldloc 7

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  ldloc 6

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  conv.u 
	IL_00b7:  ldsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_00bc:  ldloc 5

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  conv.u 
	IL_00c3:  ldelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_00c8:  stelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_00cd:  br IL_00d7

	IL_00d2:  br IL_00d7

	IL_00d7:  ldloc 5

	IL_00db:  nop 
	IL_00dc:  nop 
	IL_00dd:  ldloc 4

	IL_00e1:  nop 
	IL_00e2:  nop 
	IL_00e3:  beq IL_00ed

	IL_00e8:  br IL_00f7

	IL_00ed:  br IL_012f

	IL_00f2:  br IL_0125

	IL_00f7:  ldloc 4

	IL_00fb:  nop 
	IL_00fc:  nop 
	IL_00fd:  ldc.i4 -1
	IL_0102:  beq IL_0116

	IL_0107:  br IL_010c

	IL_010c:  br IL_005c

	IL_0111:  br IL_0120

	IL_0116:  br IL_012f

	IL_011b:  br IL_0120

	IL_0120:  br IL_0125

	IL_0125:  br IL_012f

	IL_012a:  br IL_012f

	IL_012f:  ldsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_0134:  ldc.i4 0
	IL_0139:  conv.u 
	IL_013a:  ldelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_013f:  stloc 1

	IL_0143:  nop 
	IL_0144:  nop 
	IL_0145:  ldloc 1

	IL_0149:  nop 
	IL_014a:  nop 
	IL_014b:  ldfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.TypeArr::Arr
	IL_0150:  stloc 0

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldloc 7

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  stsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_0161:  ldloc 0

	IL_0165:  nop 
	IL_0166:  nop 
	IL_0167:  ret 
    } // end of method SymTable::PopTypArr

    // method line 27
    .method public static 
           default void AddFld (string nme, class [mscorlib]System.Type typ, class [mscorlib]System.Reflection.Emit.FieldBuilder fld)  cil managed 
    {
        // Method begins at RVA 0x28b4
	// Code size 305 (0x131)
	.maxstack 16
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.FieldItem[]	V_5)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldarg 2

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  newobj instance void class dylan.NET.Tokenizer.CodeGen.FieldItem::'.ctor'(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_0017:  stloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_0022:  ldlen 
	IL_0023:  conv.i4 
	IL_0024:  stloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldc.i4 1
	IL_0035:  add 
	IL_0036:  stloc 2

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  sub 
	IL_0048:  stloc 3

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldc.i4 -1
	IL_0053:  stloc 4

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  ldloc 2

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  conv.u 
	IL_0060:  newarr dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_0065:  stloc 5

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldloc 4

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldc.i4 1
	IL_0076:  add 
	IL_0077:  stloc 4

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldloc 1

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldc.i4 0
	IL_0088:  bgt IL_0092

	IL_008d:  br IL_00ba

	IL_0092:  ldloc 5

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldloc 4

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  conv.u 
	IL_009f:  ldsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_00a4:  ldloc 4

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  conv.u 
	IL_00ab:  ldelem dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_00b0:  stelem dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_00b5:  br IL_00bf

	IL_00ba:  br IL_00bf

	IL_00bf:  ldloc 4

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldloc 3

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  beq IL_00d5

	IL_00d0:  br IL_00df

	IL_00d5:  br IL_010d

	IL_00da:  br IL_010d

	IL_00df:  ldloc 3

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldc.i4 -1
	IL_00ea:  beq IL_00fe

	IL_00ef:  br IL_00f4

	IL_00f4:  br IL_006b

	IL_00f9:  br IL_0108

	IL_00fe:  br IL_010d

	IL_0103:  br IL_0108

	IL_0108:  br IL_010d

	IL_010d:  ldloc 5

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldloc 1

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  conv.u 
	IL_011a:  ldloc 0

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  stelem dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_0125:  ldloc 5

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  stsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_0130:  ret 
    } // end of method SymTable::AddFld

    // method line 28
    .method public static 
           default void AddNestedFld (string nme, class [mscorlib]System.Type typ, class [mscorlib]System.Reflection.Emit.FieldBuilder fld)  cil managed 
    {
        // Method begins at RVA 0x29f4
	// Code size 305 (0x131)
	.maxstack 16
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.FieldItem[]	V_5)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldarg 2

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  newobj instance void class dylan.NET.Tokenizer.CodeGen.FieldItem::'.ctor'(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_0017:  stloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedFldLst
	IL_0022:  ldlen 
	IL_0023:  conv.i4 
	IL_0024:  stloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldc.i4 1
	IL_0035:  add 
	IL_0036:  stloc 2

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  sub 
	IL_0048:  stloc 3

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldc.i4 -1
	IL_0053:  stloc 4

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  ldloc 2

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  conv.u 
	IL_0060:  newarr dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_0065:  stloc 5

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldloc 4

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldc.i4 1
	IL_0076:  add 
	IL_0077:  stloc 4

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldloc 1

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldc.i4 0
	IL_0088:  bgt IL_0092

	IL_008d:  br IL_00ba

	IL_0092:  ldloc 5

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldloc 4

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  conv.u 
	IL_009f:  ldsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedFldLst
	IL_00a4:  ldloc 4

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  conv.u 
	IL_00ab:  ldelem dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_00b0:  stelem dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_00b5:  br IL_00bf

	IL_00ba:  br IL_00bf

	IL_00bf:  ldloc 4

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldloc 3

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  beq IL_00d5

	IL_00d0:  br IL_00df

	IL_00d5:  br IL_010d

	IL_00da:  br IL_010d

	IL_00df:  ldloc 3

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  ldc.i4 -1
	IL_00ea:  beq IL_00fe

	IL_00ef:  br IL_00f4

	IL_00f4:  br IL_006b

	IL_00f9:  br IL_0108

	IL_00fe:  br IL_010d

	IL_0103:  br IL_0108

	IL_0108:  br IL_010d

	IL_010d:  ldloc 5

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldloc 1

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  conv.u 
	IL_011a:  ldloc 0

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  stelem dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_0125:  ldloc 5

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  stsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedFldLst
	IL_0130:  ret 
    } // end of method SymTable::AddNestedFld

    // method line 29
    .method public static 
           default void AddMet (string nme, class [mscorlib]System.Type typ, class [mscorlib]System.Type[] ptyps, class [mscorlib]System.Reflection.Emit.MethodBuilder met)  cil managed 
    {
        // Method begins at RVA 0x2b34
	// Code size 311 (0x137)
	.maxstack 17
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.MethodItem[]	V_5)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldarg 2

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldarg 3

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  newobj instance void class dylan.NET.Tokenizer.CodeGen.MethodItem::'.ctor'(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_001d:  stloc 0

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0028:  ldlen 
	IL_0029:  conv.i4 
	IL_002a:  stloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldloc 1

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldc.i4 1
	IL_003b:  add 
	IL_003c:  stloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 1

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldc.i4 1
	IL_004d:  sub 
	IL_004e:  stloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 -1
	IL_0059:  stloc 4

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 2

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  conv.u 
	IL_0066:  newarr dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_006b:  stloc 5

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 4

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 1
	IL_007c:  add 
	IL_007d:  stloc 4

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldloc 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldc.i4 0
	IL_008e:  bgt IL_0098

	IL_0093:  br IL_00c0

	IL_0098:  ldloc 5

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldloc 4

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  conv.u 
	IL_00a5:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_00aa:  ldloc 4

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  conv.u 
	IL_00b1:  ldelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_00b6:  stelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_00bb:  br IL_00c5

	IL_00c0:  br IL_00c5

	IL_00c5:  ldloc 4

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  ldloc 3

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  beq IL_00db

	IL_00d6:  br IL_00e5

	IL_00db:  br IL_0113

	IL_00e0:  br IL_0113

	IL_00e5:  ldloc 3

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldc.i4 -1
	IL_00f0:  beq IL_0104

	IL_00f5:  br IL_00fa

	IL_00fa:  br IL_0071

	IL_00ff:  br IL_010e

	IL_0104:  br IL_0113

	IL_0109:  br IL_010e

	IL_010e:  br IL_0113

	IL_0113:  ldloc 5

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 1

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  conv.u 
	IL_0120:  ldloc 0

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  stelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_012b:  ldloc 5

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  stsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0136:  ret 
    } // end of method SymTable::AddMet

    // method line 30
    .method public static 
           default void AddNestedMet (string nme, class [mscorlib]System.Type typ, class [mscorlib]System.Type[] ptyps, class [mscorlib]System.Reflection.Emit.MethodBuilder met)  cil managed 
    {
        // Method begins at RVA 0x2c78
	// Code size 311 (0x137)
	.maxstack 17
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.MethodItem[]	V_5)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldarg 2

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldarg 3

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  newobj instance void class dylan.NET.Tokenizer.CodeGen.MethodItem::'.ctor'(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_001d:  stloc 0

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedMetLst
	IL_0028:  ldlen 
	IL_0029:  conv.i4 
	IL_002a:  stloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldloc 1

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldc.i4 1
	IL_003b:  add 
	IL_003c:  stloc 2

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldloc 1

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldc.i4 1
	IL_004d:  sub 
	IL_004e:  stloc 3

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 -1
	IL_0059:  stloc 4

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 2

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  conv.u 
	IL_0066:  newarr dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_006b:  stloc 5

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 4

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 1
	IL_007c:  add 
	IL_007d:  stloc 4

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldloc 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldc.i4 0
	IL_008e:  bgt IL_0098

	IL_0093:  br IL_00c0

	IL_0098:  ldloc 5

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldloc 4

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  conv.u 
	IL_00a5:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedMetLst
	IL_00aa:  ldloc 4

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  conv.u 
	IL_00b1:  ldelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_00b6:  stelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_00bb:  br IL_00c5

	IL_00c0:  br IL_00c5

	IL_00c5:  ldloc 4

	IL_00c9:  nop 
	IL_00ca:  nop 
	IL_00cb:  ldloc 3

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  beq IL_00db

	IL_00d6:  br IL_00e5

	IL_00db:  br IL_0113

	IL_00e0:  br IL_0113

	IL_00e5:  ldloc 3

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldc.i4 -1
	IL_00f0:  beq IL_0104

	IL_00f5:  br IL_00fa

	IL_00fa:  br IL_0071

	IL_00ff:  br IL_010e

	IL_0104:  br IL_0113

	IL_0109:  br IL_010e

	IL_010e:  br IL_0113

	IL_0113:  ldloc 5

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldloc 1

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  conv.u 
	IL_0120:  ldloc 0

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  stelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_012b:  ldloc 5

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  stsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedMetLst
	IL_0136:  ret 
    } // end of method SymTable::AddNestedMet

    // method line 31
    .method public static 
           default void AddCtor (class [mscorlib]System.Type[] ptyps, class [mscorlib]System.Reflection.Emit.ConstructorBuilder met)  cil managed 
    {
        // Method begins at RVA 0x2dbc
	// Code size 299 (0x12b)
	.maxstack 15
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.CtorItem	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.CtorItem[]	V_5)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  newobj instance void class dylan.NET.Tokenizer.CodeGen.CtorItem::'.ctor'(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_0011:  stloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_001c:  ldlen 
	IL_001d:  conv.i4 
	IL_001e:  stloc 1

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldc.i4 1
	IL_002f:  add 
	IL_0030:  stloc 2

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldloc 1

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldc.i4 1
	IL_0041:  sub 
	IL_0042:  stloc 3

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldc.i4 -1
	IL_004d:  stloc 4

	IL_0051:  nop 
	IL_0052:  nop 
	IL_0053:  ldloc 2

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  conv.u 
	IL_005a:  newarr dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_005f:  stloc 5

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  ldloc 4

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldc.i4 1
	IL_0070:  add 
	IL_0071:  stloc 4

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldloc 1

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldc.i4 0
	IL_0082:  bgt IL_008c

	IL_0087:  br IL_00b4

	IL_008c:  ldloc 5

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldloc 4

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  conv.u 
	IL_0099:  ldsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_009e:  ldloc 4

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  conv.u 
	IL_00a5:  ldelem dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_00aa:  stelem dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_00af:  br IL_00b9

	IL_00b4:  br IL_00b9

	IL_00b9:  ldloc 4

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 3

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  beq IL_00cf

	IL_00ca:  br IL_00d9

	IL_00cf:  br IL_0107

	IL_00d4:  br IL_0107

	IL_00d9:  ldloc 3

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldc.i4 -1
	IL_00e4:  beq IL_00f8

	IL_00e9:  br IL_00ee

	IL_00ee:  br IL_0065

	IL_00f3:  br IL_0102

	IL_00f8:  br IL_0107

	IL_00fd:  br IL_0102

	IL_0102:  br IL_0107

	IL_0107:  ldloc 5

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldloc 1

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  conv.u 
	IL_0114:  ldloc 0

	IL_0118:  nop 
	IL_0119:  nop 
	IL_011a:  stelem dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_011f:  ldloc 5

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  stsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_012a:  ret 
    } // end of method SymTable::AddCtor

    // method line 32
    .method public static 
           default void AddNestedCtor (class [mscorlib]System.Type[] ptyps, class [mscorlib]System.Reflection.Emit.ConstructorBuilder met)  cil managed 
    {
        // Method begins at RVA 0x2ef4
	// Code size 299 (0x12b)
	.maxstack 15
	.locals init (
		class dylan.NET.Tokenizer.CodeGen.CtorItem	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class dylan.NET.Tokenizer.CodeGen.CtorItem[]	V_5)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  newobj instance void class dylan.NET.Tokenizer.CodeGen.CtorItem::'.ctor'(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_0011:  stloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedCtorLst
	IL_001c:  ldlen 
	IL_001d:  conv.i4 
	IL_001e:  stloc 1

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldc.i4 1
	IL_002f:  add 
	IL_0030:  stloc 2

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldloc 1

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldc.i4 1
	IL_0041:  sub 
	IL_0042:  stloc 3

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldc.i4 -1
	IL_004d:  stloc 4

	IL_0051:  nop 
	IL_0052:  nop 
	IL_0053:  ldloc 2

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  conv.u 
	IL_005a:  newarr dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_005f:  stloc 5

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  ldloc 4

	IL_0069:  nop 
	IL_006a:  nop 
	IL_006b:  ldc.i4 1
	IL_0070:  add 
	IL_0071:  stloc 4

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldloc 1

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldc.i4 0
	IL_0082:  bgt IL_008c

	IL_0087:  br IL_00b4

	IL_008c:  ldloc 5

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldloc 4

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  conv.u 
	IL_0099:  ldsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedCtorLst
	IL_009e:  ldloc 4

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  conv.u 
	IL_00a5:  ldelem dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_00aa:  stelem dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_00af:  br IL_00b9

	IL_00b4:  br IL_00b9

	IL_00b9:  ldloc 4

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 3

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  beq IL_00cf

	IL_00ca:  br IL_00d9

	IL_00cf:  br IL_0107

	IL_00d4:  br IL_0107

	IL_00d9:  ldloc 3

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldc.i4 -1
	IL_00e4:  beq IL_00f8

	IL_00e9:  br IL_00ee

	IL_00ee:  br IL_0065

	IL_00f3:  br IL_0102

	IL_00f8:  br IL_0107

	IL_00fd:  br IL_0102

	IL_0102:  br IL_0107

	IL_0107:  ldloc 5

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldloc 1

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  conv.u 
	IL_0114:  ldloc 0

	IL_0118:  nop 
	IL_0119:  nop 
	IL_011a:  stelem dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_011f:  ldloc 5

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  stsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::NestedCtorLst
	IL_012a:  ret 
    } // end of method SymTable::AddNestedCtor

    // method line 33
    .method public static 
           default void AddIf ()  cil managed 
    {
        // Method begins at RVA 0x302c
	// Code size 321 (0x141)
	.maxstack 15
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.Label	V_0,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_1,
		class dylan.NET.Tokenizer.CodeGen.IfItem	V_2,
		int32	V_3,
		int32	V_4,
		int32	V_5,
		int32	V_6,
		class dylan.NET.Tokenizer.CodeGen.IfItem[]	V_7)
	IL_0000:  call valuetype [mscorlib]System.Reflection.Emit.Label class [dnr]dylan.NET.Reflection.ILEmitter::DefineLbl()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  call valuetype [mscorlib]System.Reflection.Emit.Label class [dnr]dylan.NET.Reflection.ILEmitter::DefineLbl()
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldloc 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldloc 1

	IL_0020:  nop 
	IL_0021:  nop 
	IL_0022:  newobj instance void class dylan.NET.Tokenizer.CodeGen.IfItem::'.ctor'(valuetype [mscorlib]System.Reflection.Emit.Label, valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_0027:  stloc 2

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0032:  ldlen 
	IL_0033:  conv.i4 
	IL_0034:  stloc 3

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldloc 3

	IL_003e:  nop 
	IL_003f:  nop 
	IL_0040:  ldc.i4 1
	IL_0045:  add 
	IL_0046:  stloc 4

	IL_004a:  nop 
	IL_004b:  nop 
	IL_004c:  ldloc 3

	IL_0050:  nop 
	IL_0051:  nop 
	IL_0052:  ldc.i4 1
	IL_0057:  sub 
	IL_0058:  stloc 5

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldc.i4 -1
	IL_0063:  stloc 6

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldloc 4

	IL_006d:  nop 
	IL_006e:  nop 
	IL_006f:  conv.u 
	IL_0070:  newarr dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0075:  stloc 7

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 6

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldc.i4 1
	IL_0086:  add 
	IL_0087:  stloc 6

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldloc 3

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldc.i4 0
	IL_0098:  bgt IL_00a2

	IL_009d:  br IL_00ca

	IL_00a2:  ldloc 7

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 6

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  conv.u 
	IL_00af:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_00b4:  ldloc 6

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  conv.u 
	IL_00bb:  ldelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_00c0:  stelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_00c5:  br IL_00cf

	IL_00ca:  br IL_00cf

	IL_00cf:  ldloc 6

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldloc 5

	IL_00d9:  nop 
	IL_00da:  nop 
	IL_00db:  beq IL_00e5

	IL_00e0:  br IL_00ef

	IL_00e5:  br IL_011d

	IL_00ea:  br IL_011d

	IL_00ef:  ldloc 5

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldc.i4 -1
	IL_00fa:  beq IL_010e

	IL_00ff:  br IL_0104

	IL_0104:  br IL_007b

	IL_0109:  br IL_0118

	IL_010e:  br IL_011d

	IL_0113:  br IL_0118

	IL_0118:  br IL_011d

	IL_011d:  ldloc 7

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldloc 3

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  conv.u 
	IL_012a:  ldloc 2

	IL_012e:  nop 
	IL_012f:  nop 
	IL_0130:  stelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0135:  ldloc 7

	IL_0139:  nop 
	IL_013a:  nop 
	IL_013b:  stsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0140:  ret 
    } // end of method SymTable::AddIf

    // method line 34
    .method public static 
           default void PopIf ()  cil managed 
    {
        // Method begins at RVA 0x317c
	// Code size 252 (0xfc)
	.maxstack 11
	.locals init (
		int32	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class dylan.NET.Tokenizer.CodeGen.IfItem[]	V_4)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
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
	IL_0043:  newarr dylan.NET.Tokenizer.CodeGen.IfItem
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
	IL_0060:  ldloc 2

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldc.i4 0
	IL_006b:  bge IL_0075

	IL_0070:  br IL_009d

	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 3

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  conv.u 
	IL_0082:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0087:  ldloc 3

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  conv.u 
	IL_008e:  ldelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0093:  stelem dylan.NET.Tokenizer.CodeGen.IfItem
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
	IL_00f6:  stsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_00fb:  ret 
    } // end of method SymTable::PopIf

    // method line 35
    .method public static 
           default valuetype [mscorlib]System.Reflection.Emit.Label ReadIfEndLbl ()  cil managed 
    {
        // Method begins at RVA 0x3284
	// Code size 54 (0x36)
	.maxstack 2
	.locals init (
		int32	V_0,
		class dylan.NET.Tokenizer.CodeGen.IfItem	V_1)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0018:  ldloc 0

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  conv.u 
	IL_001f:  ldelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0024:  stloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldfld valuetype [mscorlib]System.Reflection.Emit.Label dylan.NET.Tokenizer.CodeGen.IfItem::EndLabel
	IL_0035:  ret 
    } // end of method SymTable::ReadIfEndLbl

    // method line 36
    .method public static 
           default valuetype [mscorlib]System.Reflection.Emit.Label ReadIfNxtBlkLbl ()  cil managed 
    {
        // Method begins at RVA 0x32c8
	// Code size 54 (0x36)
	.maxstack 2
	.locals init (
		int32	V_0,
		class dylan.NET.Tokenizer.CodeGen.IfItem	V_1)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0018:  ldloc 0

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  conv.u 
	IL_001f:  ldelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0024:  stloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldfld valuetype [mscorlib]System.Reflection.Emit.Label dylan.NET.Tokenizer.CodeGen.IfItem::NextBlkLabel
	IL_0035:  ret 
    } // end of method SymTable::ReadIfNxtBlkLbl

    // method line 37
    .method public static 
           default bool ReadIfElsePass ()  cil managed 
    {
        // Method begins at RVA 0x330c
	// Code size 54 (0x36)
	.maxstack 2
	.locals init (
		int32	V_0,
		class dylan.NET.Tokenizer.CodeGen.IfItem	V_1)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0018:  ldloc 0

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  conv.u 
	IL_001f:  ldelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0024:  stloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldfld bool dylan.NET.Tokenizer.CodeGen.IfItem::ElsePass
	IL_0035:  ret 
    } // end of method SymTable::ReadIfElsePass

    // method line 38
    .method public static 
           default void SetIfElsePass ()  cil managed 
    {
        // Method begins at RVA 0x3350
	// Code size 59 (0x3b)
	.maxstack 2
	.locals init (
		int32	V_0,
		class dylan.NET.Tokenizer.CodeGen.IfItem	V_1)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0018:  ldloc 0

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  conv.u 
	IL_001f:  ldelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0024:  stloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldc.i4 1
	IL_0035:  stfld bool dylan.NET.Tokenizer.CodeGen.IfItem::ElsePass
	IL_003a:  ret 
    } // end of method SymTable::SetIfElsePass

    // method line 39
    .method public static 
           default void SetIfNxtBlkLbl ()  cil managed 
    {
        // Method begins at RVA 0x3398
	// Code size 59 (0x3b)
	.maxstack 2
	.locals init (
		int32	V_0,
		class dylan.NET.Tokenizer.CodeGen.IfItem	V_1)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldsfld class dylan.NET.Tokenizer.CodeGen.IfItem[] dylan.NET.Tokenizer.CodeGen.SymTable::IfLst
	IL_0018:  ldloc 0

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  conv.u 
	IL_001f:  ldelem dylan.NET.Tokenizer.CodeGen.IfItem
	IL_0024:  stloc 1

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldloc 1

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  call valuetype [mscorlib]System.Reflection.Emit.Label class [dnr]dylan.NET.Reflection.ILEmitter::DefineLbl()
	IL_0035:  stfld valuetype [mscorlib]System.Reflection.Emit.Label dylan.NET.Tokenizer.CodeGen.IfItem::NextBlkLabel
	IL_003a:  ret 
    } // end of method SymTable::SetIfNxtBlkLbl

    // method line 40
    .method public static 
           default void AddLbl (string nam)  cil managed 
    {
        // Method begins at RVA 0x33e0
	// Code size 310 (0x136)
	.maxstack 15
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.Label	V_0,
		class dylan.NET.Tokenizer.CodeGen.LabelItem	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		int32	V_5,
		class dylan.NET.Tokenizer.CodeGen.LabelItem[]	V_6)
	IL_0000:  call valuetype [mscorlib]System.Reflection.Emit.Label class [dnr]dylan.NET.Reflection.ILEmitter::DefineLbl()
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldarg 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  newobj instance void class dylan.NET.Tokenizer.CodeGen.LabelItem::'.ctor'(string, valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_001c:  stloc 1

	IL_0020:  nop 
	IL_0021:  nop 
	IL_0022:  ldsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_0027:  ldlen 
	IL_0028:  conv.i4 
	IL_0029:  stloc 2

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  ldloc 2

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  ldc.i4 1
	IL_003a:  add 
	IL_003b:  stloc 3

	IL_003f:  nop 
	IL_0040:  nop 
	IL_0041:  ldloc 2

	IL_0045:  nop 
	IL_0046:  nop 
	IL_0047:  ldc.i4 1
	IL_004c:  sub 
	IL_004d:  stloc 4

	IL_0051:  nop 
	IL_0052:  nop 
	IL_0053:  ldc.i4 -1
	IL_0058:  stloc 5

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldloc 3

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  conv.u 
	IL_0065:  newarr dylan.NET.Tokenizer.CodeGen.LabelItem
	IL_006a:  stloc 6

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldloc 5

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldc.i4 1
	IL_007b:  add 
	IL_007c:  stloc 5

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldloc 2

	IL_0086:  nop 
	IL_0087:  nop 
	IL_0088:  ldc.i4 0
	IL_008d:  bgt IL_0097

	IL_0092:  br IL_00bf

	IL_0097:  ldloc 6

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldloc 5

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  conv.u 
	IL_00a4:  ldsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_00a9:  ldloc 5

	IL_00ad:  nop 
	IL_00ae:  nop 
	IL_00af:  conv.u 
	IL_00b0:  ldelem dylan.NET.Tokenizer.CodeGen.LabelItem
	IL_00b5:  stelem dylan.NET.Tokenizer.CodeGen.LabelItem
	IL_00ba:  br IL_00c4

	IL_00bf:  br IL_00c4

	IL_00c4:  ldloc 5

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  ldloc 4

	IL_00ce:  nop 
	IL_00cf:  nop 
	IL_00d0:  beq IL_00da

	IL_00d5:  br IL_00e4

	IL_00da:  br IL_0112

	IL_00df:  br IL_0112

	IL_00e4:  ldloc 4

	IL_00e8:  nop 
	IL_00e9:  nop 
	IL_00ea:  ldc.i4 -1
	IL_00ef:  beq IL_0103

	IL_00f4:  br IL_00f9

	IL_00f9:  br IL_0070

	IL_00fe:  br IL_010d

	IL_0103:  br IL_0112

	IL_0108:  br IL_010d

	IL_010d:  br IL_0112

	IL_0112:  ldloc 6

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  ldloc 2

	IL_011c:  nop 
	IL_011d:  nop 
	IL_011e:  conv.u 
	IL_011f:  ldloc 1

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  stelem dylan.NET.Tokenizer.CodeGen.LabelItem
	IL_012a:  ldloc 6

	IL_012e:  nop 
	IL_012f:  nop 
	IL_0130:  stsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_0135:  ret 
    } // end of method SymTable::AddLbl

    // method line 41
    .method public static 
           default class dylan.NET.Tokenizer.CodeGen.VarItem FindVar (string nam)  cil managed 
    {
        // Method begins at RVA 0x3524
	// Code size 258 (0x102)
	.maxstack 8
	.locals init (
		int32	V_0,
		int32	V_1,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_2,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_3,
		int32	V_4)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 -1
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
	IL_0037:  ldsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_003c:  ldlen 
	IL_003d:  conv.i4 
	IL_003e:  ldc.i4 0
	IL_0043:  beq IL_004d

	IL_0048:  br IL_0057

	IL_004d:  br IL_00fb

	IL_0052:  br IL_005c

	IL_0057:  br IL_005c

	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 1
	IL_0067:  add 
	IL_0068:  stloc 1

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldsfld class dylan.NET.Tokenizer.CodeGen.VarItem[] dylan.NET.Tokenizer.CodeGen.SymTable::VarLst
	IL_0073:  ldloc 1

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  conv.u 
	IL_007a:  ldelem dylan.NET.Tokenizer.CodeGen.VarItem
	IL_007f:  stloc 2

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldarg 0

	IL_0089:  nop 
	IL_008a:  nop 
	IL_008b:  ldloc 2

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  ldfld string dylan.NET.Tokenizer.CodeGen.VarItem::Name
	IL_0096:  call int32 string::Compare(string, string)
	IL_009b:  stloc 4

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 4

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldc.i4 0
	IL_00ac:  beq IL_00b6

	IL_00b1:  br IL_00cc

	IL_00b6:  ldloc 2

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  stloc 3

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  br IL_00fb

	IL_00c7:  br IL_00d1

	IL_00cc:  br IL_00d1

	IL_00d1:  ldloc 1

	IL_00d5:  nop 
	IL_00d6:  nop 
	IL_00d7:  ldloc 0

	IL_00db:  nop 
	IL_00dc:  nop 
	IL_00dd:  beq IL_00e7

	IL_00e2:  br IL_00f1

	IL_00e7:  br IL_00fb

	IL_00ec:  br IL_00fb

	IL_00f1:  br IL_005c

	IL_00f6:  br IL_00fb

	IL_00fb:  ldloc 3

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ret 
    } // end of method SymTable::FindVar

    // method line 42
    .method public static 
           default class dylan.NET.Tokenizer.CodeGen.LabelItem FindLbl (string nam)  cil managed 
    {
        // Method begins at RVA 0x3634
	// Code size 258 (0x102)
	.maxstack 8
	.locals init (
		int32	V_0,
		int32	V_1,
		class dylan.NET.Tokenizer.CodeGen.LabelItem	V_2,
		class dylan.NET.Tokenizer.CodeGen.LabelItem	V_3,
		int32	V_4)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 -1
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
	IL_0037:  ldsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_003c:  ldlen 
	IL_003d:  conv.i4 
	IL_003e:  ldc.i4 0
	IL_0043:  beq IL_004d

	IL_0048:  br IL_0057

	IL_004d:  br IL_00fb

	IL_0052:  br IL_005c

	IL_0057:  br IL_005c

	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 1
	IL_0067:  add 
	IL_0068:  stloc 1

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldsfld class dylan.NET.Tokenizer.CodeGen.LabelItem[] dylan.NET.Tokenizer.CodeGen.SymTable::LblLst
	IL_0073:  ldloc 1

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  conv.u 
	IL_007a:  ldelem dylan.NET.Tokenizer.CodeGen.LabelItem
	IL_007f:  stloc 2

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldarg 0

	IL_0089:  nop 
	IL_008a:  nop 
	IL_008b:  ldloc 2

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  ldfld string dylan.NET.Tokenizer.CodeGen.LabelItem::LblName
	IL_0096:  call int32 string::Compare(string, string)
	IL_009b:  stloc 4

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 4

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldc.i4 0
	IL_00ac:  beq IL_00b6

	IL_00b1:  br IL_00cc

	IL_00b6:  ldloc 2

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  stloc 3

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  br IL_00fb

	IL_00c7:  br IL_00d1

	IL_00cc:  br IL_00d1

	IL_00d1:  ldloc 1

	IL_00d5:  nop 
	IL_00d6:  nop 
	IL_00d7:  ldloc 0

	IL_00db:  nop 
	IL_00dc:  nop 
	IL_00dd:  beq IL_00e7

	IL_00e2:  br IL_00f1

	IL_00e7:  br IL_00fb

	IL_00ec:  br IL_00fb

	IL_00f1:  br IL_005c

	IL_00f6:  br IL_00fb

	IL_00fb:  ldloc 3

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ret 
    } // end of method SymTable::FindLbl

    // method line 43
    .method public static 
           default class dylan.NET.Tokenizer.CodeGen.FieldItem FindFld (string nam)  cil managed 
    {
        // Method begins at RVA 0x3744
	// Code size 258 (0x102)
	.maxstack 8
	.locals init (
		int32	V_0,
		int32	V_1,
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_2,
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_3,
		int32	V_4)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 -1
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
	IL_0037:  ldsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_003c:  ldlen 
	IL_003d:  conv.i4 
	IL_003e:  ldc.i4 0
	IL_0043:  beq IL_004d

	IL_0048:  br IL_0057

	IL_004d:  br IL_00fb

	IL_0052:  br IL_005c

	IL_0057:  br IL_005c

	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 1
	IL_0067:  add 
	IL_0068:  stloc 1

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldsfld class dylan.NET.Tokenizer.CodeGen.FieldItem[] dylan.NET.Tokenizer.CodeGen.SymTable::FldLst
	IL_0073:  ldloc 1

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  conv.u 
	IL_007a:  ldelem dylan.NET.Tokenizer.CodeGen.FieldItem
	IL_007f:  stloc 2

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldarg 0

	IL_0089:  nop 
	IL_008a:  nop 
	IL_008b:  ldloc 2

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  ldfld string dylan.NET.Tokenizer.CodeGen.FieldItem::Name
	IL_0096:  call int32 string::Compare(string, string)
	IL_009b:  stloc 4

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 4

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldc.i4 0
	IL_00ac:  beq IL_00b6

	IL_00b1:  br IL_00cc

	IL_00b6:  ldloc 2

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  stloc 3

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  br IL_00fb

	IL_00c7:  br IL_00d1

	IL_00cc:  br IL_00d1

	IL_00d1:  ldloc 1

	IL_00d5:  nop 
	IL_00d6:  nop 
	IL_00d7:  ldloc 0

	IL_00db:  nop 
	IL_00dc:  nop 
	IL_00dd:  beq IL_00e7

	IL_00e2:  br IL_00f1

	IL_00e7:  br IL_00fb

	IL_00ec:  br IL_00fb

	IL_00f1:  br IL_005c

	IL_00f6:  br IL_00fb

	IL_00fb:  ldloc 3

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ret 
    } // end of method SymTable::FindFld

    // method line 44
    .method public static 
           default bool CmpTyps (class [mscorlib]System.Type[] arra, class [mscorlib]System.Type[] arrb)  cil managed 
    {
        // Method begins at RVA 0x3854
	// Code size 301 (0x12d)
	.maxstack 10
	.locals init (
		bool	V_0,
		int32	V_1,
		int32	V_2,
		class [mscorlib]System.Type	V_3,
		class [mscorlib]System.Type	V_4)
	IL_0000:  ldc.i4 1
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldarg 0

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldlen 
	IL_0012:  conv.i4 
	IL_0013:  ldarg 1

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldlen 
	IL_001a:  conv.i4 
	IL_001b:  beq IL_0025

	IL_0020:  br IL_0116

	IL_0025:  ldarg 0

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldlen 
	IL_002c:  conv.i4 
	IL_002d:  ldc.i4 0
	IL_0032:  beq IL_003c

	IL_0037:  br IL_0046

	IL_003c:  br IL_0111

	IL_0041:  br IL_004b

	IL_0046:  br IL_004b

	IL_004b:  ldc.i4 -1
	IL_0050:  stloc 1

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  ldarg 0

	IL_005a:  nop 
	IL_005b:  nop 
	IL_005c:  ldlen 
	IL_005d:  conv.i4 
	IL_005e:  ldc.i4 1
	IL_0063:  sub 
	IL_0064:  stloc 2

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldloc 1

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldc.i4 1
	IL_0075:  add 
	IL_0076:  stloc 1

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldarg 0

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldloc 1

	IL_0086:  nop 
	IL_0087:  nop 
	IL_0088:  conv.u 
	IL_0089:  ldelem [mscorlib]System.Type
	IL_008e:  stloc 3

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldarg 1

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  ldloc 1

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  conv.u 
	IL_00a1:  ldelem [mscorlib]System.Type
	IL_00a6:  stloc 4

	IL_00aa:  nop 
	IL_00ab:  nop 
	IL_00ac:  ldloc 3

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 4

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_00bd:  stloc 0

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  ldloc 0

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldc.i4 0
	IL_00ce:  beq IL_00d8

	IL_00d3:  br IL_00e2

	IL_00d8:  br IL_0111

	IL_00dd:  br IL_00e7

	IL_00e2:  br IL_00e7

	IL_00e7:  ldloc 1

	IL_00eb:  nop 
	IL_00ec:  nop 
	IL_00ed:  ldloc 2

	IL_00f1:  nop 
	IL_00f2:  nop 
	IL_00f3:  beq IL_00fd

	IL_00f8:  br IL_0107

	IL_00fd:  br IL_0111

	IL_0102:  br IL_0111

	IL_0107:  br IL_006a

	IL_010c:  br IL_0111

	IL_0111:  br IL_0126

	IL_0116:  ldc.i4 0
	IL_011b:  stloc 0

	IL_011f:  nop 
	IL_0120:  nop 
	IL_0121:  br IL_0126

	IL_0126:  ldloc 0

	IL_012a:  nop 
	IL_012b:  nop 
	IL_012c:  ret 
    } // end of method SymTable::CmpTyps

    // method line 45
    .method public static 
           default class dylan.NET.Tokenizer.CodeGen.MethodItem FindMet (string nam, class [mscorlib]System.Type[] params)  cil managed 
    {
        // Method begins at RVA 0x3990
	// Code size 317 (0x13d)
	.maxstack 10
	.locals init (
		int32	V_0,
		int32	V_1,
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_2,
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_3,
		int32	V_4,
		bool	V_5)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 -1
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
	IL_0037:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_003c:  ldlen 
	IL_003d:  conv.i4 
	IL_003e:  ldc.i4 0
	IL_0043:  beq IL_004d

	IL_0048:  br IL_0057

	IL_004d:  br IL_0136

	IL_0052:  br IL_005c

	IL_0057:  br IL_005c

	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 1
	IL_0067:  add 
	IL_0068:  stloc 1

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0073:  ldloc 1

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  conv.u 
	IL_007a:  ldelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_007f:  stloc 2

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldarg 0

	IL_0089:  nop 
	IL_008a:  nop 
	IL_008b:  ldloc 2

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  ldfld string dylan.NET.Tokenizer.CodeGen.MethodItem::Name
	IL_0096:  call int32 string::Compare(string, string)
	IL_009b:  stloc 4

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 4

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldc.i4 0
	IL_00ac:  beq IL_00b6

	IL_00b1:  br IL_0107

	IL_00b6:  ldloc 2

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  ldfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.MethodItem::ParamTyps
	IL_00c1:  ldarg 1

	IL_00c5:  nop 
	IL_00c6:  nop 
	IL_00c7:  call bool class dylan.NET.Tokenizer.CodeGen.SymTable::CmpTyps(class [mscorlib]System.Type[], class [mscorlib]System.Type[])
	IL_00cc:  stloc 5

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  ldloc 5

	IL_00d6:  nop 
	IL_00d7:  nop 
	IL_00d8:  ldc.i4 1
	IL_00dd:  beq IL_00e7

	IL_00e2:  br IL_00fd

	IL_00e7:  ldloc 2

	IL_00eb:  nop 
	IL_00ec:  nop 
	IL_00ed:  stloc 3

	IL_00f1:  nop 
	IL_00f2:  nop 
	IL_00f3:  br IL_0136

	IL_00f8:  br IL_0102

	IL_00fd:  br IL_0102

	IL_0102:  br IL_010c

	IL_0107:  br IL_010c

	IL_010c:  ldloc 1

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldloc 0

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  beq IL_0122

	IL_011d:  br IL_012c

	IL_0122:  br IL_0136

	IL_0127:  br IL_0136

	IL_012c:  br IL_005c

	IL_0131:  br IL_0136

	IL_0136:  ldloc 3

	IL_013a:  nop 
	IL_013b:  nop 
	IL_013c:  ret 
    } // end of method SymTable::FindMet

    // method line 46
    .method public static 
           default class dylan.NET.Tokenizer.CodeGen.MethodItem FindMetNoParams (string nam)  cil managed 
    {
        // Method begins at RVA 0x3adc
	// Code size 258 (0x102)
	.maxstack 8
	.locals init (
		int32	V_0,
		int32	V_1,
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_2,
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_3,
		int32	V_4,
		bool	V_5)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 -1
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
	IL_0037:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_003c:  ldlen 
	IL_003d:  conv.i4 
	IL_003e:  ldc.i4 0
	IL_0043:  beq IL_004d

	IL_0048:  br IL_0057

	IL_004d:  br IL_00fb

	IL_0052:  br IL_005c

	IL_0057:  br IL_005c

	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 1
	IL_0067:  add 
	IL_0068:  stloc 1

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldsfld class dylan.NET.Tokenizer.CodeGen.MethodItem[] dylan.NET.Tokenizer.CodeGen.SymTable::MetLst
	IL_0073:  ldloc 1

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  conv.u 
	IL_007a:  ldelem dylan.NET.Tokenizer.CodeGen.MethodItem
	IL_007f:  stloc 2

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldarg 0

	IL_0089:  nop 
	IL_008a:  nop 
	IL_008b:  ldloc 2

	IL_008f:  nop 
	IL_0090:  nop 
	IL_0091:  ldfld string dylan.NET.Tokenizer.CodeGen.MethodItem::Name
	IL_0096:  call int32 string::Compare(string, string)
	IL_009b:  stloc 4

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 4

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldc.i4 0
	IL_00ac:  beq IL_00b6

	IL_00b1:  br IL_00cc

	IL_00b6:  ldloc 2

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  stloc 3

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  br IL_00fb

	IL_00c7:  br IL_00d1

	IL_00cc:  br IL_00d1

	IL_00d1:  ldloc 1

	IL_00d5:  nop 
	IL_00d6:  nop 
	IL_00d7:  ldloc 0

	IL_00db:  nop 
	IL_00dc:  nop 
	IL_00dd:  beq IL_00e7

	IL_00e2:  br IL_00f1

	IL_00e7:  br IL_00fb

	IL_00ec:  br IL_00fb

	IL_00f1:  br IL_005c

	IL_00f6:  br IL_00fb

	IL_00fb:  ldloc 3

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ret 
    } // end of method SymTable::FindMetNoParams

    // method line 47
    .method public static 
           default class dylan.NET.Tokenizer.CodeGen.CtorItem FindCtor (class [mscorlib]System.Type[] params)  cil managed 
    {
        // Method begins at RVA 0x3bec
	// Code size 258 (0x102)
	.maxstack 8
	.locals init (
		int32	V_0,
		int32	V_1,
		class dylan.NET.Tokenizer.CodeGen.CtorItem	V_2,
		class dylan.NET.Tokenizer.CodeGen.CtorItem	V_3,
		int32	V_4,
		bool	V_5)
	IL_0000:  ldsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_0005:  ldlen 
	IL_0006:  conv.i4 
	IL_0007:  ldc.i4 1
	IL_000c:  sub 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldc.i4 -1
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
	IL_0037:  ldsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_003c:  ldlen 
	IL_003d:  conv.i4 
	IL_003e:  ldc.i4 0
	IL_0043:  beq IL_004d

	IL_0048:  br IL_0057

	IL_004d:  br IL_00fb

	IL_0052:  br IL_005c

	IL_0057:  br IL_005c

	IL_005c:  ldloc 1

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 1
	IL_0067:  add 
	IL_0068:  stloc 1

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  ldsfld class dylan.NET.Tokenizer.CodeGen.CtorItem[] dylan.NET.Tokenizer.CodeGen.SymTable::CtorLst
	IL_0073:  ldloc 1

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  conv.u 
	IL_007a:  ldelem dylan.NET.Tokenizer.CodeGen.CtorItem
	IL_007f:  stloc 2

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldloc 2

	IL_0089:  nop 
	IL_008a:  nop 
	IL_008b:  ldfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.CtorItem::ParamTyps
	IL_0090:  ldarg 0

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  call bool class dylan.NET.Tokenizer.CodeGen.SymTable::CmpTyps(class [mscorlib]System.Type[], class [mscorlib]System.Type[])
	IL_009b:  stloc 5

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldloc 5

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldc.i4 1
	IL_00ac:  beq IL_00b6

	IL_00b1:  br IL_00cc

	IL_00b6:  ldloc 2

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  stloc 3

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  br IL_00fb

	IL_00c7:  br IL_00d1

	IL_00cc:  br IL_00d1

	IL_00d1:  ldloc 1

	IL_00d5:  nop 
	IL_00d6:  nop 
	IL_00d7:  ldloc 0

	IL_00db:  nop 
	IL_00dc:  nop 
	IL_00dd:  beq IL_00e7

	IL_00e2:  br IL_00f1

	IL_00e7:  br IL_00fb

	IL_00ec:  br IL_00fb

	IL_00f1:  br IL_005c

	IL_00f6:  br IL_00fb

	IL_00fb:  ldloc 3

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  ret 
    } // end of method SymTable::FindCtor

  } // end of class dylan.NET.Tokenizer.CodeGen.SymTable
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi beforefieldinit Helpers
  	extends [mscorlib]System.Object
  {
    .field  public static  bool StringFlg
    .field  public static  bool DelegateFlg
    .field  public static  bool OpCodeSuppFlg
    .field  public static  class [mscorlib]System.Type LeftOp
    .field  public static  class [mscorlib]System.Type RightOp

    // method line 48
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x3cfc
	// Code size 43 (0x2b)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_000a:  ldc.i4 0
	IL_000f:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::DelegateFlg
	IL_0014:  ldc.i4 0
	IL_0019:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_001e:  ldnull 
	IL_001f:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0024:  ldnull 
	IL_0025:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_002a:  ret 
    } // end of method Helpers::.cctor

    // method line 49
    .method public static 
           default valuetype [mscorlib]System.Reflection.TypeAttributes ProcessClassAttrs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] attrs)  cil managed 
    {
        // Method begins at RVA 0x3d34
	// Code size 711 (0x2c7)
	.maxstack 31
	.locals init (
		valuetype [mscorlib]System.Reflection.TypeAttributes	V_0,
		valuetype [mscorlib]System.Reflection.TypeAttributes	V_1,
		int32	V_2,
		int32	V_3,
		bool	V_4,
		class [mscorlib]System.Type	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute	V_6,
		bool	V_7)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  ldc.i4 1
	IL_000d:  sub 
	IL_000e:  stloc 2

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 -1
	IL_0019:  stloc 3

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldc.i4 0
	IL_0024:  stloc 4

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldnull 
	IL_002b:  stloc 6

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 1
	IL_0036:  stloc 7

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 3

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  add 
	IL_0048:  stloc 3

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldarg 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldloc 3

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  conv.u 
	IL_005b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0060:  stloc 6

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr
	IL_006b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0070:  stloc 5

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldloc 5

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 6

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0087:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_008c:  stloc 4

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldloc 4

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldc.i4 1
	IL_009d:  beq IL_00a7

	IL_00a2:  br IL_0137

	IL_00a7:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_00ac:  ldc.i4 0
	IL_00b1:  beq IL_00bb

	IL_00b6:  br IL_00cb

	IL_00bb:  ldc.i4 1
	IL_00c0:  stloc 1

	IL_00c4:  nop 
	IL_00c5:  nop 
	IL_00c6:  br IL_00db

	IL_00cb:  ldc.i4 2
	IL_00d0:  stloc 1

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  br IL_00db

	IL_00db:  ldloc 7

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  ldc.i4 1
	IL_00e6:  beq IL_00f0

	IL_00eb:  br IL_0115

	IL_00f0:  ldloc 7

	IL_00f4:  nop 
	IL_00f5:  nop 
	IL_00f6:  ldloc 7

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  and 
	IL_00fd:  not 
	IL_00fe:  stloc 7

	IL_0102:  nop 
	IL_0103:  nop 
	IL_0104:  ldloc 1

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  stloc 0

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  br IL_012d

	IL_0115:  ldloc 1

	IL_0119:  nop 
	IL_011a:  nop 
	IL_011b:  ldloc 0

	IL_011f:  nop 
	IL_0120:  nop 
	IL_0121:  or 
	IL_0122:  stloc 0

	IL_0126:  nop 
	IL_0127:  nop 
	IL_0128:  br IL_012d

	IL_012d:  br IL_0296

	IL_0132:  br IL_013c

	IL_0137:  br IL_013c

	IL_013c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AutoLayoutAttr
	IL_0141:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0146:  stloc 5

	IL_014a:  nop 
	IL_014b:  nop 
	IL_014c:  ldloc 5

	IL_0150:  nop 
	IL_0151:  nop 
	IL_0152:  ldloc 6

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_015d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0162:  stloc 4

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  ldloc 4

	IL_016c:  nop 
	IL_016d:  nop 
	IL_016e:  ldc.i4 1
	IL_0173:  beq IL_017d

	IL_0178:  br IL_01e4

	IL_017d:  ldc.i4 0
	IL_0182:  stloc 1

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  ldloc 7

	IL_018c:  nop 
	IL_018d:  nop 
	IL_018e:  ldc.i4 1
	IL_0193:  beq IL_019d

	IL_0198:  br IL_01c2

	IL_019d:  ldloc 7

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  ldloc 7

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  and 
	IL_01aa:  not 
	IL_01ab:  stloc 7

	IL_01af:  nop 
	IL_01b0:  nop 
	IL_01b1:  ldloc 1

	IL_01b5:  nop 
	IL_01b6:  nop 
	IL_01b7:  stloc 0

	IL_01bb:  nop 
	IL_01bc:  nop 
	IL_01bd:  br IL_01da

	IL_01c2:  ldloc 1

	IL_01c6:  nop 
	IL_01c7:  nop 
	IL_01c8:  ldloc 0

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  or 
	IL_01cf:  stloc 0

	IL_01d3:  nop 
	IL_01d4:  nop 
	IL_01d5:  br IL_01da

	IL_01da:  br IL_0296

	IL_01df:  br IL_01e9

	IL_01e4:  br IL_01e9

	IL_01e9:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.AnsiClassAttr
	IL_01ee:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01f3:  stloc 5

	IL_01f7:  nop 
	IL_01f8:  nop 
	IL_01f9:  ldloc 5

	IL_01fd:  nop 
	IL_01fe:  nop 
	IL_01ff:  ldloc 6

	IL_0203:  nop 
	IL_0204:  nop 
	IL_0205:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_020a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_020f:  stloc 4

	IL_0213:  nop 
	IL_0214:  nop 
	IL_0215:  ldloc 4

	IL_0219:  nop 
	IL_021a:  nop 
	IL_021b:  ldc.i4 1
	IL_0220:  beq IL_022a

	IL_0225:  br IL_0291

	IL_022a:  ldc.i4 0
	IL_022f:  stloc 1

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  ldloc 7

	IL_0239:  nop 
	IL_023a:  nop 
	IL_023b:  ldc.i4 1
	IL_0240:  beq IL_024a

	IL_0245:  br IL_026f

	IL_024a:  ldloc 7

	IL_024e:  nop 
	IL_024f:  nop 
	IL_0250:  ldloc 7

	IL_0254:  nop 
	IL_0255:  nop 
	IL_0256:  and 
	IL_0257:  not 
	IL_0258:  stloc 7

	IL_025c:  nop 
	IL_025d:  nop 
	IL_025e:  ldloc 1

	IL_0262:  nop 
	IL_0263:  nop 
	IL_0264:  stloc 0

	IL_0268:  nop 
	IL_0269:  nop 
	IL_026a:  br IL_0287

	IL_026f:  ldloc 1

	IL_0273:  nop 
	IL_0274:  nop 
	IL_0275:  ldloc 0

	IL_0279:  nop 
	IL_027a:  nop 
	IL_027b:  or 
	IL_027c:  stloc 0

	IL_0280:  nop 
	IL_0281:  nop 
	IL_0282:  br IL_0287

	IL_0287:  br IL_0296

	IL_028c:  br IL_0296

	IL_0291:  br IL_0296

	IL_0296:  ldloc 3

	IL_029a:  nop 
	IL_029b:  nop 
	IL_029c:  ldloc 2

	IL_02a0:  nop 
	IL_02a1:  nop 
	IL_02a2:  beq IL_02ac

	IL_02a7:  br IL_02b6

	IL_02ac:  br IL_02c0

	IL_02b1:  br IL_02c0

	IL_02b6:  br IL_003c

	IL_02bb:  br IL_02c0

	IL_02c0:  ldloc 0

	IL_02c4:  nop 
	IL_02c5:  nop 
	IL_02c6:  ret 
    } // end of method Helpers::ProcessClassAttrs

    // method line 50
    .method public static 
           default valuetype [mscorlib]System.Reflection.MethodAttributes ProcessMethodAttrs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] attrs)  cil managed 
    {
        // Method begins at RVA 0x4008
	// Code size 1026 (0x402)
	.maxstack 43
	.locals init (
		valuetype [mscorlib]System.Reflection.MethodAttributes	V_0,
		valuetype [mscorlib]System.Reflection.MethodAttributes	V_1,
		int32	V_2,
		int32	V_3,
		bool	V_4,
		class [mscorlib]System.Type	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute	V_6,
		bool	V_7)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  ldc.i4 1
	IL_000d:  sub 
	IL_000e:  stloc 2

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 -1
	IL_0019:  stloc 3

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldc.i4 0
	IL_0024:  stloc 4

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldnull 
	IL_002b:  stloc 6

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 1
	IL_0036:  stloc 7

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 3

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  add 
	IL_0048:  stloc 3

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldarg 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldloc 3

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  conv.u 
	IL_005b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0060:  stloc 6

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr
	IL_006b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0070:  stloc 5

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldloc 5

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 6

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0087:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_008c:  stloc 4

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldloc 4

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldc.i4 1
	IL_009d:  beq IL_00a7

	IL_00a2:  br IL_010e

	IL_00a7:  ldc.i4 6
	IL_00ac:  stloc 1

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 7

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldc.i4 1
	IL_00bd:  beq IL_00c7

	IL_00c2:  br IL_00ec

	IL_00c7:  ldloc 7

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 7

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  and 
	IL_00d4:  not 
	IL_00d5:  stloc 7

	IL_00d9:  nop 
	IL_00da:  nop 
	IL_00db:  ldloc 1

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  stloc 0

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  br IL_0104

	IL_00ec:  ldloc 1

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ldloc 0

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  or 
	IL_00f9:  stloc 0

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  br IL_0104

	IL_0104:  br IL_03d1

	IL_0109:  br IL_0113

	IL_010e:  br IL_0113

	IL_0113:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr
	IL_0118:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_011d:  stloc 5

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldloc 5

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  ldloc 6

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0134:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0139:  stloc 4

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  ldloc 4

	IL_0143:  nop 
	IL_0144:  nop 
	IL_0145:  ldc.i4 1
	IL_014a:  beq IL_0154

	IL_014f:  br IL_01c5

	IL_0154:  ldc.i4 16
	IL_0159:  stloc 1

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  ldc.i4 1
	IL_0164:  stsfld bool [dnr]dylan.NET.Reflection.ILEmitter::StaticFlg
	IL_0169:  ldloc 7

	IL_016d:  nop 
	IL_016e:  nop 
	IL_016f:  ldc.i4 1
	IL_0174:  beq IL_017e

	IL_0179:  br IL_01a3

	IL_017e:  ldloc 7

	IL_0182:  nop 
	IL_0183:  nop 
	IL_0184:  ldloc 7

	IL_0188:  nop 
	IL_0189:  nop 
	IL_018a:  and 
	IL_018b:  not 
	IL_018c:  stloc 7

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  ldloc 1

	IL_0196:  nop 
	IL_0197:  nop 
	IL_0198:  stloc 0

	IL_019c:  nop 
	IL_019d:  nop 
	IL_019e:  br IL_01bb

	IL_01a3:  ldloc 1

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldloc 0

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  or 
	IL_01b0:  stloc 0

	IL_01b4:  nop 
	IL_01b5:  nop 
	IL_01b6:  br IL_01bb

	IL_01bb:  br IL_03d1

	IL_01c0:  br IL_01ca

	IL_01c5:  br IL_01ca

	IL_01ca:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.SpecialNameAttr
	IL_01cf:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01d4:  stloc 5

	IL_01d8:  nop 
	IL_01d9:  nop 
	IL_01da:  ldloc 5

	IL_01de:  nop 
	IL_01df:  nop 
	IL_01e0:  ldloc 6

	IL_01e4:  nop 
	IL_01e5:  nop 
	IL_01e6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_01eb:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01f0:  stloc 4

	IL_01f4:  nop 
	IL_01f5:  nop 
	IL_01f6:  ldloc 4

	IL_01fa:  nop 
	IL_01fb:  nop 
	IL_01fc:  ldc.i4 1
	IL_0201:  beq IL_020b

	IL_0206:  br IL_0272

	IL_020b:  ldc.i4 2048
	IL_0210:  stloc 1

	IL_0214:  nop 
	IL_0215:  nop 
	IL_0216:  ldloc 7

	IL_021a:  nop 
	IL_021b:  nop 
	IL_021c:  ldc.i4 1
	IL_0221:  beq IL_022b

	IL_0226:  br IL_0250

	IL_022b:  ldloc 7

	IL_022f:  nop 
	IL_0230:  nop 
	IL_0231:  ldloc 7

	IL_0235:  nop 
	IL_0236:  nop 
	IL_0237:  and 
	IL_0238:  not 
	IL_0239:  stloc 7

	IL_023d:  nop 
	IL_023e:  nop 
	IL_023f:  ldloc 1

	IL_0243:  nop 
	IL_0244:  nop 
	IL_0245:  stloc 0

	IL_0249:  nop 
	IL_024a:  nop 
	IL_024b:  br IL_0268

	IL_0250:  ldloc 1

	IL_0254:  nop 
	IL_0255:  nop 
	IL_0256:  ldloc 0

	IL_025a:  nop 
	IL_025b:  nop 
	IL_025c:  or 
	IL_025d:  stloc 0

	IL_0261:  nop 
	IL_0262:  nop 
	IL_0263:  br IL_0268

	IL_0268:  br IL_03d1

	IL_026d:  br IL_0277

	IL_0272:  br IL_0277

	IL_0277:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.VirtualAttr
	IL_027c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0281:  stloc 5

	IL_0285:  nop 
	IL_0286:  nop 
	IL_0287:  ldloc 5

	IL_028b:  nop 
	IL_028c:  nop 
	IL_028d:  ldloc 6

	IL_0291:  nop 
	IL_0292:  nop 
	IL_0293:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0298:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_029d:  stloc 4

	IL_02a1:  nop 
	IL_02a2:  nop 
	IL_02a3:  ldloc 4

	IL_02a7:  nop 
	IL_02a8:  nop 
	IL_02a9:  ldc.i4 1
	IL_02ae:  beq IL_02b8

	IL_02b3:  br IL_031f

	IL_02b8:  ldc.i4 64
	IL_02bd:  stloc 1

	IL_02c1:  nop 
	IL_02c2:  nop 
	IL_02c3:  ldloc 7

	IL_02c7:  nop 
	IL_02c8:  nop 
	IL_02c9:  ldc.i4 1
	IL_02ce:  beq IL_02d8

	IL_02d3:  br IL_02fd

	IL_02d8:  ldloc 7

	IL_02dc:  nop 
	IL_02dd:  nop 
	IL_02de:  ldloc 7

	IL_02e2:  nop 
	IL_02e3:  nop 
	IL_02e4:  and 
	IL_02e5:  not 
	IL_02e6:  stloc 7

	IL_02ea:  nop 
	IL_02eb:  nop 
	IL_02ec:  ldloc 1

	IL_02f0:  nop 
	IL_02f1:  nop 
	IL_02f2:  stloc 0

	IL_02f6:  nop 
	IL_02f7:  nop 
	IL_02f8:  br IL_0315

	IL_02fd:  ldloc 1

	IL_0301:  nop 
	IL_0302:  nop 
	IL_0303:  ldloc 0

	IL_0307:  nop 
	IL_0308:  nop 
	IL_0309:  or 
	IL_030a:  stloc 0

	IL_030e:  nop 
	IL_030f:  nop 
	IL_0310:  br IL_0315

	IL_0315:  br IL_03d1

	IL_031a:  br IL_0324

	IL_031f:  br IL_0324

	IL_0324:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.HideBySigAttr
	IL_0329:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_032e:  stloc 5

	IL_0332:  nop 
	IL_0333:  nop 
	IL_0334:  ldloc 5

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  ldloc 6

	IL_033e:  nop 
	IL_033f:  nop 
	IL_0340:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0345:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_034a:  stloc 4

	IL_034e:  nop 
	IL_034f:  nop 
	IL_0350:  ldloc 4

	IL_0354:  nop 
	IL_0355:  nop 
	IL_0356:  ldc.i4 1
	IL_035b:  beq IL_0365

	IL_0360:  br IL_03cc

	IL_0365:  ldc.i4 128
	IL_036a:  stloc 1

	IL_036e:  nop 
	IL_036f:  nop 
	IL_0370:  ldloc 7

	IL_0374:  nop 
	IL_0375:  nop 
	IL_0376:  ldc.i4 1
	IL_037b:  beq IL_0385

	IL_0380:  br IL_03aa

	IL_0385:  ldloc 7

	IL_0389:  nop 
	IL_038a:  nop 
	IL_038b:  ldloc 7

	IL_038f:  nop 
	IL_0390:  nop 
	IL_0391:  and 
	IL_0392:  not 
	IL_0393:  stloc 7

	IL_0397:  nop 
	IL_0398:  nop 
	IL_0399:  ldloc 1

	IL_039d:  nop 
	IL_039e:  nop 
	IL_039f:  stloc 0

	IL_03a3:  nop 
	IL_03a4:  nop 
	IL_03a5:  br IL_03c2

	IL_03aa:  ldloc 1

	IL_03ae:  nop 
	IL_03af:  nop 
	IL_03b0:  ldloc 0

	IL_03b4:  nop 
	IL_03b5:  nop 
	IL_03b6:  or 
	IL_03b7:  stloc 0

	IL_03bb:  nop 
	IL_03bc:  nop 
	IL_03bd:  br IL_03c2

	IL_03c2:  br IL_03d1

	IL_03c7:  br IL_03d1

	IL_03cc:  br IL_03d1

	IL_03d1:  ldloc 3

	IL_03d5:  nop 
	IL_03d6:  nop 
	IL_03d7:  ldloc 2

	IL_03db:  nop 
	IL_03dc:  nop 
	IL_03dd:  beq IL_03e7

	IL_03e2:  br IL_03f1

	IL_03e7:  br IL_03fb

	IL_03ec:  br IL_03fb

	IL_03f1:  br IL_003c

	IL_03f6:  br IL_03fb

	IL_03fb:  ldloc 0

	IL_03ff:  nop 
	IL_0400:  nop 
	IL_0401:  ret 
    } // end of method Helpers::ProcessMethodAttrs

    // method line 51
    .method public static 
           default valuetype [mscorlib]System.Reflection.FieldAttributes ProcessFieldAttrs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] attrs)  cil managed 
    {
        // Method begins at RVA 0x4418
	// Code size 843 (0x34b)
	.maxstack 35
	.locals init (
		valuetype [mscorlib]System.Reflection.FieldAttributes	V_0,
		valuetype [mscorlib]System.Reflection.FieldAttributes	V_1,
		int32	V_2,
		int32	V_3,
		bool	V_4,
		class [mscorlib]System.Type	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute	V_6,
		bool	V_7)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  ldc.i4 1
	IL_000d:  sub 
	IL_000e:  stloc 2

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 -1
	IL_0019:  stloc 3

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldc.i4 0
	IL_0024:  stloc 4

	IL_0028:  nop 
	IL_0029:  nop 
	IL_002a:  ldnull 
	IL_002b:  stloc 6

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 1
	IL_0036:  stloc 7

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 3

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldc.i4 1
	IL_0047:  add 
	IL_0048:  stloc 3

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldarg 0

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldloc 3

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  conv.u 
	IL_005b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0060:  stloc 6

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PublicAttr
	IL_006b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0070:  stloc 5

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  ldloc 5

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 6

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0087:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_008c:  stloc 4

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldloc 4

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldc.i4 1
	IL_009d:  beq IL_00a7

	IL_00a2:  br IL_010e

	IL_00a7:  ldc.i4 6
	IL_00ac:  stloc 1

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldloc 7

	IL_00b6:  nop 
	IL_00b7:  nop 
	IL_00b8:  ldc.i4 1
	IL_00bd:  beq IL_00c7

	IL_00c2:  br IL_00ec

	IL_00c7:  ldloc 7

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 7

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  and 
	IL_00d4:  not 
	IL_00d5:  stloc 7

	IL_00d9:  nop 
	IL_00da:  nop 
	IL_00db:  ldloc 1

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  stloc 0

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  br IL_0104

	IL_00ec:  ldloc 1

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ldloc 0

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  or 
	IL_00f9:  stloc 0

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  br IL_0104

	IL_0104:  br IL_031a

	IL_0109:  br IL_0113

	IL_010e:  br IL_0113

	IL_0113:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.StaticAttr
	IL_0118:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_011d:  stloc 5

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldloc 5

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  ldloc 6

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_0134:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0139:  stloc 4

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  ldloc 4

	IL_0143:  nop 
	IL_0144:  nop 
	IL_0145:  ldc.i4 1
	IL_014a:  beq IL_0154

	IL_014f:  br IL_01bb

	IL_0154:  ldc.i4 16
	IL_0159:  stloc 1

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  ldloc 7

	IL_0163:  nop 
	IL_0164:  nop 
	IL_0165:  ldc.i4 1
	IL_016a:  beq IL_0174

	IL_016f:  br IL_0199

	IL_0174:  ldloc 7

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldloc 7

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  and 
	IL_0181:  not 
	IL_0182:  stloc 7

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  ldloc 1

	IL_018c:  nop 
	IL_018d:  nop 
	IL_018e:  stloc 0

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  br IL_01b1

	IL_0199:  ldloc 1

	IL_019d:  nop 
	IL_019e:  nop 
	IL_019f:  ldloc 0

	IL_01a3:  nop 
	IL_01a4:  nop 
	IL_01a5:  or 
	IL_01a6:  stloc 0

	IL_01aa:  nop 
	IL_01ab:  nop 
	IL_01ac:  br IL_01b1

	IL_01b1:  br IL_031a

	IL_01b6:  br IL_01c0

	IL_01bb:  br IL_01c0

	IL_01c0:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.InitOnlyAttr
	IL_01c5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01ca:  stloc 5

	IL_01ce:  nop 
	IL_01cf:  nop 
	IL_01d0:  ldloc 5

	IL_01d4:  nop 
	IL_01d5:  nop 
	IL_01d6:  ldloc 6

	IL_01da:  nop 
	IL_01db:  nop 
	IL_01dc:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_01e1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01e6:  stloc 4

	IL_01ea:  nop 
	IL_01eb:  nop 
	IL_01ec:  ldloc 4

	IL_01f0:  nop 
	IL_01f1:  nop 
	IL_01f2:  ldc.i4 1
	IL_01f7:  beq IL_0201

	IL_01fc:  br IL_0268

	IL_0201:  ldc.i4 32
	IL_0206:  stloc 1

	IL_020a:  nop 
	IL_020b:  nop 
	IL_020c:  ldloc 7

	IL_0210:  nop 
	IL_0211:  nop 
	IL_0212:  ldc.i4 1
	IL_0217:  beq IL_0221

	IL_021c:  br IL_0246

	IL_0221:  ldloc 7

	IL_0225:  nop 
	IL_0226:  nop 
	IL_0227:  ldloc 7

	IL_022b:  nop 
	IL_022c:  nop 
	IL_022d:  and 
	IL_022e:  not 
	IL_022f:  stloc 7

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  ldloc 1

	IL_0239:  nop 
	IL_023a:  nop 
	IL_023b:  stloc 0

	IL_023f:  nop 
	IL_0240:  nop 
	IL_0241:  br IL_025e

	IL_0246:  ldloc 1

	IL_024a:  nop 
	IL_024b:  nop 
	IL_024c:  ldloc 0

	IL_0250:  nop 
	IL_0251:  nop 
	IL_0252:  or 
	IL_0253:  stloc 0

	IL_0257:  nop 
	IL_0258:  nop 
	IL_0259:  br IL_025e

	IL_025e:  br IL_031a

	IL_0263:  br IL_026d

	IL_0268:  br IL_026d

	IL_026d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.PrivateAttr
	IL_0272:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0277:  stloc 5

	IL_027b:  nop 
	IL_027c:  nop 
	IL_027d:  ldloc 5

	IL_0281:  nop 
	IL_0282:  nop 
	IL_0283:  ldloc 6

	IL_0287:  nop 
	IL_0288:  nop 
	IL_0289:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute
	IL_028e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0293:  stloc 4

	IL_0297:  nop 
	IL_0298:  nop 
	IL_0299:  ldloc 4

	IL_029d:  nop 
	IL_029e:  nop 
	IL_029f:  ldc.i4 1
	IL_02a4:  beq IL_02ae

	IL_02a9:  br IL_0315

	IL_02ae:  ldc.i4 1
	IL_02b3:  stloc 1

	IL_02b7:  nop 
	IL_02b8:  nop 
	IL_02b9:  ldloc 7

	IL_02bd:  nop 
	IL_02be:  nop 
	IL_02bf:  ldc.i4 1
	IL_02c4:  beq IL_02ce

	IL_02c9:  br IL_02f3

	IL_02ce:  ldloc 7

	IL_02d2:  nop 
	IL_02d3:  nop 
	IL_02d4:  ldloc 7

	IL_02d8:  nop 
	IL_02d9:  nop 
	IL_02da:  and 
	IL_02db:  not 
	IL_02dc:  stloc 7

	IL_02e0:  nop 
	IL_02e1:  nop 
	IL_02e2:  ldloc 1

	IL_02e6:  nop 
	IL_02e7:  nop 
	IL_02e8:  stloc 0

	IL_02ec:  nop 
	IL_02ed:  nop 
	IL_02ee:  br IL_030b

	IL_02f3:  ldloc 1

	IL_02f7:  nop 
	IL_02f8:  nop 
	IL_02f9:  ldloc 0

	IL_02fd:  nop 
	IL_02fe:  nop 
	IL_02ff:  or 
	IL_0300:  stloc 0

	IL_0304:  nop 
	IL_0305:  nop 
	IL_0306:  br IL_030b

	IL_030b:  br IL_031a

	IL_0310:  br IL_031a

	IL_0315:  br IL_031a

	IL_031a:  ldloc 3

	IL_031e:  nop 
	IL_031f:  nop 
	IL_0320:  ldloc 2

	IL_0324:  nop 
	IL_0325:  nop 
	IL_0326:  beq IL_0330

	IL_032b:  br IL_033a

	IL_0330:  br IL_0344

	IL_0335:  br IL_0344

	IL_033a:  br IL_003c

	IL_033f:  br IL_0344

	IL_0344:  ldloc 0

	IL_0348:  nop 
	IL_0349:  nop 
	IL_034a:  ret 
    } // end of method Helpers::ProcessFieldAttrs

    // method line 52
    .method public static 
           default void EvalTTok (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok tt)  cil managed 
    {
        // Method begins at RVA 0x4770
	// Code size 835 (0x343)
	.maxstack 21
	.locals init (
		class [mscorlib]System.Type[]	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[]	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_5,
		int32	V_6,
		int32	V_7,
		int32	V_8,
		int32	V_9,
		string	V_10,
		class [mscorlib]System.Type	V_11,
		bool	V_12)
	IL_0000:  ldc.i4 0
	IL_0005:  conv.u 
	IL_0006:  newarr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_000b:  stloc 4

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::'.ctor'()
	IL_0016:  stloc 5

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 -1
	IL_0021:  stloc 6

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldc.i4 0
	IL_002c:  stloc 7

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 0
	IL_0037:  stloc 8

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldc.i4 0
	IL_0042:  stloc 9

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldstr " "
	IL_004d:  stloc 10

	IL_0051:  nop 
	IL_0052:  nop 
	IL_0053:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok
	IL_0058:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_005d:  stloc 11

	IL_0061:  nop 
	IL_0062:  nop 
	IL_0063:  ldloc 11

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldarg 0

	IL_006d:  nop 
	IL_006e:  nop 
	IL_006f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0074:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0079:  stloc 12

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldloc 12

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  ldc.i4 0
	IL_008a:  beq IL_01de

	IL_008f:  br IL_0094

	IL_0094:  ldarg 0

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  stloc 3

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  ldloc 3

	IL_00a4:  nop 
	IL_00a5:  nop 
	IL_00a6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.GenericTypeTok::Params
	IL_00ab:  stloc 4

	IL_00af:  nop 
	IL_00b0:  nop 
	IL_00b1:  ldloc 4

	IL_00b5:  nop 
	IL_00b6:  nop 
	IL_00b7:  ldlen 
	IL_00b8:  conv.i4 
	IL_00b9:  stloc 8

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldloc 8

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldc.i4 1
	IL_00ca:  sub 
	IL_00cb:  stloc 7

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_00d6:  stloc 0

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldc.i4 0
	IL_00e1:  conv.u 
	IL_00e2:  newarr [mscorlib]System.Type
	IL_00e7:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_00ec:  ldloc 3

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_00f7:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeArr
	IL_00fc:  ldloc 3

	IL_0100:  nop 
	IL_0101:  nop 
	IL_0102:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0107:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeRef
	IL_010c:  ldloc 3

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0117:  ldstr "`"
	IL_011c:  ldloc 8

	IL_0120:  nop 
	IL_0121:  nop 
	IL_0122:  call string class [mscorlib]System.Convert::ToString(int32)
	IL_0127:  call string string::Concat(string, string, string)
	IL_012c:  stloc 10

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  ldloc 10

	IL_0136:  nop 
	IL_0137:  nop 
	IL_0138:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_013d:  stloc 1

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  ldloc 6

	IL_0147:  nop 
	IL_0148:  nop 
	IL_0149:  ldc.i4 1
	IL_014e:  add 
	IL_014f:  stloc 6

	IL_0153:  nop 
	IL_0154:  nop 
	IL_0155:  ldloc 4

	IL_0159:  nop 
	IL_015a:  nop 
	IL_015b:  ldloc 6

	IL_015f:  nop 
	IL_0160:  nop 
	IL_0161:  conv.u 
	IL_0162:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok
	IL_0167:  stloc 5

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  ldloc 5

	IL_0171:  nop 
	IL_0172:  nop 
	IL_0173:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0178:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type01
	IL_017d:  stloc 2

	IL_0181:  nop 
	IL_0182:  nop 
	IL_0183:  ldloc 2

	IL_0187:  nop 
	IL_0188:  nop 
	IL_0189:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_018e:  ldloc 6

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  ldloc 7

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  beq IL_01a4

	IL_019f:  br IL_01ae

	IL_01a4:  br IL_01b8

	IL_01a9:  br IL_01b8

	IL_01ae:  br IL_0143

	IL_01b3:  br IL_01b8

	IL_01b8:  ldloc 1

	IL_01bc:  nop 
	IL_01bd:  nop 
	IL_01be:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_01c3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeGenericType(class [mscorlib]System.Type[])
	IL_01c8:  stloc 1

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldloc 0

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_01d9:  br IL_0337

	IL_01de:  ldarg 0

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_01e9:  ldnull 
	IL_01ea:  beq IL_01f4

	IL_01ef:  br IL_02f7

	IL_01f4:  ldarg 0

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_01ff:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeArr
	IL_0204:  ldarg 0

	IL_0208:  nop 
	IL_0209:  nop 
	IL_020a:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_020f:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeRef
	IL_0214:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0219:  ldarg 0

	IL_021d:  nop 
	IL_021e:  nop 
	IL_021f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0224:  call int32 string::Compare(string, string)
	IL_0229:  stloc 9

	IL_022d:  nop 
	IL_022e:  nop 
	IL_022f:  ldloc 9

	IL_0233:  nop 
	IL_0234:  nop 
	IL_0235:  ldc.i4 0
	IL_023a:  beq IL_0244

	IL_023f:  br IL_02d2

	IL_0244:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0249:  stloc 1

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  ldarg 0

	IL_0253:  nop 
	IL_0254:  nop 
	IL_0255:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_025a:  ldc.i4 1
	IL_025f:  beq IL_0269

	IL_0264:  br IL_027f

	IL_0269:  ldloc 1

	IL_026d:  nop 
	IL_026e:  nop 
	IL_026f:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeArrayType()
	IL_0274:  stloc 1

	IL_0278:  nop 
	IL_0279:  nop 
	IL_027a:  br IL_0284

	IL_027f:  br IL_0284

	IL_0284:  ldarg 0

	IL_0288:  nop 
	IL_0289:  nop 
	IL_028a:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_028f:  ldc.i4 1
	IL_0294:  beq IL_029e

	IL_0299:  br IL_02b4

	IL_029e:  ldloc 1

	IL_02a2:  nop 
	IL_02a3:  nop 
	IL_02a4:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeByRefType()
	IL_02a9:  stloc 1

	IL_02ad:  nop 
	IL_02ae:  nop 
	IL_02af:  br IL_02b9

	IL_02b4:  br IL_02b9

	IL_02b9:  ldc.i4 0
	IL_02be:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeArr
	IL_02c3:  ldc.i4 0
	IL_02c8:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeRef
	IL_02cd:  br IL_02ed

	IL_02d2:  ldarg 0

	IL_02d6:  nop 
	IL_02d7:  nop 
	IL_02d8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02dd:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_02e2:  stloc 1

	IL_02e6:  nop 
	IL_02e7:  nop 
	IL_02e8:  br IL_02ed

	IL_02ed:  br IL_0332

	IL_02f2:  br IL_02fc

	IL_02f7:  br IL_02fc

	IL_02fc:  ldarg 0

	IL_0300:  nop 
	IL_0301:  nop 
	IL_0302:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0307:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeArr
	IL_030c:  ldarg 0

	IL_0310:  nop 
	IL_0311:  nop 
	IL_0312:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0317:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeRef
	IL_031c:  ldarg 0

	IL_0320:  nop 
	IL_0321:  nop 
	IL_0322:  ldfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0327:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::ProcessType(class [mscorlib]System.Type)
	IL_032c:  stloc 1

	IL_0330:  nop 
	IL_0331:  nop 
	IL_0332:  br IL_0337

	IL_0337:  ldloc 1

	IL_033b:  nop 
	IL_033c:  nop 
	IL_033d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type01
	IL_0342:  ret 
    } // end of method Helpers::EvalTTok

    // method line 53
    .method public static 
           default class [mscorlib]System.Type CommitEvalTTok (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok tt)  cil managed 
    {
        // Method begins at RVA 0x4ac0
	// Code size 17 (0x11)
	.maxstack 1
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_000b:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type01
	IL_0010:  ret 
    } // end of method Helpers::CommitEvalTTok

    // method line 54
    .method public static 
           default void ProcessParams (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] ps)  cil managed 
    {
        // Method begins at RVA 0x4ae0
	// Code size 282 (0x11a)
	.maxstack 10
	.locals init (
		string	V_0,
		int32	V_1,
		int32	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_5,
		class [mscorlib]System.Type	V_6)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  ldc.i4 1
	IL_000d:  sub 
	IL_000e:  stloc 1

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 -1
	IL_0019:  stloc 2

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldnull 
	IL_0020:  stloc 3

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldnull 
	IL_0027:  stloc 6

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ldloc 2

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldc.i4 1
	IL_0038:  add 
	IL_0039:  stloc 2

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldarg 0

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldloc 2

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  conv.u 
	IL_004c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0051:  stloc 3

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  ldloc 3

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarTyp
	IL_0062:  stloc 4

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  ldloc 4

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0073:  stloc 6

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  ldloc 6

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldnull 
	IL_0080:  beq IL_008a

	IL_0085:  br IL_00c4

	IL_008a:  ldstr "Class '"
	IL_008f:  ldloc 4

	IL_0093:  nop 
	IL_0094:  nop 
	IL_0095:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_009a:  ldstr "' is not defined."
	IL_009f:  call string string::Concat(string, string, string)
	IL_00a4:  stloc 0

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_00af:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_00b4:  ldloc 0

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_00bf:  br IL_00c9

	IL_00c4:  br IL_00c9

	IL_00c9:  ldloc 6

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldnull 
	IL_00d0:  beq IL_00ea

	IL_00d5:  br IL_00da

	IL_00da:  ldloc 6

	IL_00de:  nop 
	IL_00df:  nop 
	IL_00e0:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_00e5:  br IL_00ef

	IL_00ea:  br IL_00ef

	IL_00ef:  ldloc 2

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldloc 1

	IL_00f9:  nop 
	IL_00fa:  nop 
	IL_00fb:  beq IL_0105

	IL_0100:  br IL_010f

	IL_0105:  br IL_0119

	IL_010a:  br IL_0119

	IL_010f:  br IL_002d

	IL_0114:  br IL_0119

	IL_0119:  ret 
    } // end of method Helpers::ProcessParams

    // method line 55
    .method public static 
           default void PostProcessParams (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] ps)  cil managed 
    {
        // Method begins at RVA 0x4c08
	// Code size 304 (0x130)
	.maxstack 4
	.locals init (
		int32	V_0,
		int32	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_4,
		class [mscorlib]System.Type	V_5,
		class [mscorlib]System.Type	V_6,
		class [mscorlib]System.Reflection.Emit.MethodBuilder	V_7,
		valuetype [mscorlib]System.Reflection.ParameterAttributes	V_8,
		int32	V_9)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  ldc.i4 1
	IL_000d:  sub 
	IL_000e:  stloc 0

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 -1
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldnull 
	IL_0020:  stloc 2

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldnull 
	IL_0027:  stloc 5

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ldloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldc.i4 1
	IL_0038:  add 
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldarg 0

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldloc 1

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  conv.u 
	IL_004c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0051:  stloc 2

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.ILEmitter::Met
	IL_005c:  stloc 7

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 0
	IL_0067:  stloc 8

	IL_006b:  nop 
	IL_006c:  nop 
	IL_006d:  ldloc 2

	IL_0071:  nop 
	IL_0072:  nop 
	IL_0073:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarName
	IL_0078:  stloc 3

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldloc 1

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldc.i4 1
	IL_0089:  add 
	IL_008a:  stloc 9

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldloc 7

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 9

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  ldloc 8

	IL_00a0:  nop 
	IL_00a1:  nop 
	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00ad:  callvirt instance class [mscorlib]System.Reflection.Emit.ParameterBuilder class [mscorlib]System.Reflection.Emit.MethodBuilder::DefineParameter(int32, valuetype [mscorlib]System.Reflection.ParameterAttributes, string)
	IL_00b2:  pop 
	IL_00b3:  ldloc 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarTyp
	IL_00be:  stloc 4

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  ldloc 4

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_00cf:  stloc 5

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::ArgInd
	IL_00da:  ldc.i4 1
	IL_00df:  add 
	IL_00e0:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::ArgInd
	IL_00e5:  ldloc 3

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00f0:  ldc.i4 0
	IL_00f5:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::ArgInd
	IL_00fa:  ldloc 5

	IL_00fe:  nop 
	IL_00ff:  nop 
	IL_0100:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_0105:  ldloc 1

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  ldloc 0

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  beq IL_011b

	IL_0116:  br IL_0125

	IL_011b:  br IL_012f

	IL_0120:  br IL_012f

	IL_0125:  br IL_002d

	IL_012a:  br IL_012f

	IL_012f:  ret 
    } // end of method Helpers::PostProcessParams

    // method line 56
    .method public static 
           default void PostProcessParamsConstr (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] ps)  cil managed 
    {
        // Method begins at RVA 0x4d44
	// Code size 304 (0x130)
	.maxstack 4
	.locals init (
		int32	V_0,
		int32	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_4,
		class [mscorlib]System.Type	V_5,
		class [mscorlib]System.Reflection.Emit.ConstructorBuilder	V_6,
		valuetype [mscorlib]System.Reflection.ParameterAttributes	V_7,
		int32	V_8)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldlen 
	IL_0007:  conv.i4 
	IL_0008:  ldc.i4 1
	IL_000d:  sub 
	IL_000e:  stloc 0

	IL_0012:  nop 
	IL_0013:  nop 
	IL_0014:  ldc.i4 -1
	IL_0019:  stloc 1

	IL_001d:  nop 
	IL_001e:  nop 
	IL_001f:  ldnull 
	IL_0020:  stloc 2

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldnull 
	IL_0027:  stloc 5

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ldloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldc.i4 1
	IL_0038:  add 
	IL_0039:  stloc 1

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldarg 0

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldloc 1

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  conv.u 
	IL_004c:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_0051:  stloc 2

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.ILEmitter::Constr
	IL_005c:  stloc 6

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldc.i4 0
	IL_0067:  stloc 7

	IL_006b:  nop 
	IL_006c:  nop 
	IL_006d:  ldloc 2

	IL_0071:  nop 
	IL_0072:  nop 
	IL_0073:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarName
	IL_0078:  stloc 3

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldloc 1

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldc.i4 1
	IL_0089:  add 
	IL_008a:  stloc 8

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  ldloc 6

	IL_0094:  nop 
	IL_0095:  nop 
	IL_0096:  ldloc 8

	IL_009a:  nop 
	IL_009b:  nop 
	IL_009c:  ldloc 7

	IL_00a0:  nop 
	IL_00a1:  nop 
	IL_00a2:  ldloc 3

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00ad:  callvirt instance class [mscorlib]System.Reflection.Emit.ParameterBuilder class [mscorlib]System.Reflection.Emit.ConstructorBuilder::DefineParameter(int32, valuetype [mscorlib]System.Reflection.ParameterAttributes, string)
	IL_00b2:  pop 
	IL_00b3:  ldloc 2

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarTyp
	IL_00be:  stloc 4

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  ldloc 4

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_00cf:  stloc 5

	IL_00d3:  nop 
	IL_00d4:  nop 
	IL_00d5:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::ArgInd
	IL_00da:  ldc.i4 1
	IL_00df:  add 
	IL_00e0:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::ArgInd
	IL_00e5:  ldloc 3

	IL_00e9:  nop 
	IL_00ea:  nop 
	IL_00eb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00f0:  ldc.i4 0
	IL_00f5:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::ArgInd
	IL_00fa:  ldloc 5

	IL_00fe:  nop 
	IL_00ff:  nop 
	IL_0100:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_0105:  ldloc 1

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  ldloc 0

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  beq IL_011b

	IL_0116:  br IL_0125

	IL_011b:  br IL_012f

	IL_0120:  br IL_012f

	IL_0125:  br IL_002d

	IL_012a:  br IL_012f

	IL_012f:  ret 
    } // end of method Helpers::PostProcessParamsConstr

    // method line 57
    .method public static 
           default void EmitLiteral (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal lit)  cil managed 
    {
        // Method begins at RVA 0x4e80
	// Code size 1058 (0x422)
	.maxstack 29
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_10)
	IL_0000:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_0021:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldloc 1

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldc.i4 1
	IL_0037:  beq IL_0041

	IL_003c:  br IL_0067

	IL_0041:  ldarg 0

	IL_0045:  nop 
	IL_0046:  nop 
	IL_0047:  stloc 2

	IL_004b:  nop 
	IL_004c:  nop 
	IL_004d:  ldloc 2

	IL_0051:  nop 
	IL_0052:  nop 
	IL_0053:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0058:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdstr(string)
	IL_005d:  br IL_0421

	IL_0062:  br IL_006c

	IL_0067:  br IL_006c

	IL_006c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral
	IL_0071:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0076:  stloc 0

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldloc 0

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldarg 0

	IL_0086:  nop 
	IL_0087:  nop 
	IL_0088:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_008d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0092:  stloc 1

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  ldloc 1

	IL_009c:  nop 
	IL_009d:  nop 
	IL_009e:  ldc.i4 1
	IL_00a3:  beq IL_00ad

	IL_00a8:  br IL_00d3

	IL_00ad:  ldarg 0

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  stloc 3

	IL_00b7:  nop 
	IL_00b8:  nop 
	IL_00b9:  ldloc 3

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldfld int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_00c4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcI1(int8)
	IL_00c9:  br IL_0421

	IL_00ce:  br IL_00d8

	IL_00d3:  br IL_00d8

	IL_00d8:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral
	IL_00dd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00e2:  stloc 0

	IL_00e6:  nop 
	IL_00e7:  nop 
	IL_00e8:  ldloc 0

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  ldarg 0

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_00f9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00fe:  stloc 1

	IL_0102:  nop 
	IL_0103:  nop 
	IL_0104:  ldloc 1

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  ldc.i4 1
	IL_010f:  beq IL_0119

	IL_0114:  br IL_013f

	IL_0119:  ldarg 0

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  stloc 4

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  ldloc 4

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  ldfld int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_0130:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcI2(int16)
	IL_0135:  br IL_0421

	IL_013a:  br IL_0144

	IL_013f:  br IL_0144

	IL_0144:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_0149:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_014e:  stloc 0

	IL_0152:  nop 
	IL_0153:  nop 
	IL_0154:  ldloc 0

	IL_0158:  nop 
	IL_0159:  nop 
	IL_015a:  ldarg 0

	IL_015e:  nop 
	IL_015f:  nop 
	IL_0160:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_0165:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_016a:  stloc 1

	IL_016e:  nop 
	IL_016f:  nop 
	IL_0170:  ldloc 1

	IL_0174:  nop 
	IL_0175:  nop 
	IL_0176:  ldc.i4 1
	IL_017b:  beq IL_0185

	IL_0180:  br IL_01ab

	IL_0185:  ldarg 0

	IL_0189:  nop 
	IL_018a:  nop 
	IL_018b:  stloc 5

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldloc 5

	IL_0195:  nop 
	IL_0196:  nop 
	IL_0197:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_019c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcI4(int32)
	IL_01a1:  br IL_0421

	IL_01a6:  br IL_01b0

	IL_01ab:  br IL_01b0

	IL_01b0:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral
	IL_01b5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01ba:  stloc 0

	IL_01be:  nop 
	IL_01bf:  nop 
	IL_01c0:  ldloc 0

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  ldarg 0

	IL_01ca:  nop 
	IL_01cb:  nop 
	IL_01cc:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_01d1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01d6:  stloc 1

	IL_01da:  nop 
	IL_01db:  nop 
	IL_01dc:  ldloc 1

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  ldc.i4 1
	IL_01e7:  beq IL_01f1

	IL_01ec:  br IL_0217

	IL_01f1:  ldarg 0

	IL_01f5:  nop 
	IL_01f6:  nop 
	IL_01f7:  stloc 6

	IL_01fb:  nop 
	IL_01fc:  nop 
	IL_01fd:  ldloc 6

	IL_0201:  nop 
	IL_0202:  nop 
	IL_0203:  ldfld int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_0208:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcI8(int64)
	IL_020d:  br IL_0421

	IL_0212:  br IL_021c

	IL_0217:  br IL_021c

	IL_021c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral
	IL_0221:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0226:  stloc 0

	IL_022a:  nop 
	IL_022b:  nop 
	IL_022c:  ldloc 0

	IL_0230:  nop 
	IL_0231:  nop 
	IL_0232:  ldarg 0

	IL_0236:  nop 
	IL_0237:  nop 
	IL_0238:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_023d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0242:  stloc 1

	IL_0246:  nop 
	IL_0247:  nop 
	IL_0248:  ldloc 1

	IL_024c:  nop 
	IL_024d:  nop 
	IL_024e:  ldc.i4 1
	IL_0253:  beq IL_025d

	IL_0258:  br IL_0283

	IL_025d:  ldarg 0

	IL_0261:  nop 
	IL_0262:  nop 
	IL_0263:  stloc 7

	IL_0267:  nop 
	IL_0268:  nop 
	IL_0269:  ldloc 7

	IL_026d:  nop 
	IL_026e:  nop 
	IL_026f:  ldfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_0274:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcR4(float32)
	IL_0279:  br IL_0421

	IL_027e:  br IL_0288

	IL_0283:  br IL_0288

	IL_0288:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral
	IL_028d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0292:  stloc 0

	IL_0296:  nop 
	IL_0297:  nop 
	IL_0298:  ldloc 0

	IL_029c:  nop 
	IL_029d:  nop 
	IL_029e:  ldarg 0

	IL_02a2:  nop 
	IL_02a3:  nop 
	IL_02a4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_02a9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_02ae:  stloc 1

	IL_02b2:  nop 
	IL_02b3:  nop 
	IL_02b4:  ldloc 1

	IL_02b8:  nop 
	IL_02b9:  nop 
	IL_02ba:  ldc.i4 1
	IL_02bf:  beq IL_02c9

	IL_02c4:  br IL_02ef

	IL_02c9:  ldarg 0

	IL_02cd:  nop 
	IL_02ce:  nop 
	IL_02cf:  stloc 8

	IL_02d3:  nop 
	IL_02d4:  nop 
	IL_02d5:  ldloc 8

	IL_02d9:  nop 
	IL_02da:  nop 
	IL_02db:  ldfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_02e0:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcR8(float64)
	IL_02e5:  br IL_0421

	IL_02ea:  br IL_02f4

	IL_02ef:  br IL_02f4

	IL_02f4:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral
	IL_02f9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02fe:  stloc 0

	IL_0302:  nop 
	IL_0303:  nop 
	IL_0304:  ldloc 0

	IL_0308:  nop 
	IL_0309:  nop 
	IL_030a:  ldarg 0

	IL_030e:  nop 
	IL_030f:  nop 
	IL_0310:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_0315:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_031a:  stloc 1

	IL_031e:  nop 
	IL_031f:  nop 
	IL_0320:  ldloc 1

	IL_0324:  nop 
	IL_0325:  nop 
	IL_0326:  ldc.i4 1
	IL_032b:  beq IL_0335

	IL_0330:  br IL_035b

	IL_0335:  ldarg 0

	IL_0339:  nop 
	IL_033a:  nop 
	IL_033b:  stloc 9

	IL_033f:  nop 
	IL_0340:  nop 
	IL_0341:  ldloc 9

	IL_0345:  nop 
	IL_0346:  nop 
	IL_0347:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_034c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcBool(bool)
	IL_0351:  br IL_0421

	IL_0356:  br IL_0360

	IL_035b:  br IL_0360

	IL_0360:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral
	IL_0365:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_036a:  stloc 0

	IL_036e:  nop 
	IL_036f:  nop 
	IL_0370:  ldloc 0

	IL_0374:  nop 
	IL_0375:  nop 
	IL_0376:  ldarg 0

	IL_037a:  nop 
	IL_037b:  nop 
	IL_037c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_0381:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0386:  stloc 1

	IL_038a:  nop 
	IL_038b:  nop 
	IL_038c:  ldloc 1

	IL_0390:  nop 
	IL_0391:  nop 
	IL_0392:  ldc.i4 1
	IL_0397:  beq IL_03a1

	IL_039c:  br IL_03c7

	IL_03a1:  ldarg 0

	IL_03a5:  nop 
	IL_03a6:  nop 
	IL_03a7:  stloc 10

	IL_03ab:  nop 
	IL_03ac:  nop 
	IL_03ad:  ldloc 10

	IL_03b1:  nop 
	IL_03b2:  nop 
	IL_03b3:  ldfld char [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_03b8:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdcChar(char)
	IL_03bd:  br IL_0421

	IL_03c2:  br IL_03cc

	IL_03c7:  br IL_03cc

	IL_03cc:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral
	IL_03d1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03d6:  stloc 0

	IL_03da:  nop 
	IL_03db:  nop 
	IL_03dc:  ldloc 0

	IL_03e0:  nop 
	IL_03e1:  nop 
	IL_03e2:  ldarg 0

	IL_03e6:  nop 
	IL_03e7:  nop 
	IL_03e8:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_03ed:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_03f2:  stloc 1

	IL_03f6:  nop 
	IL_03f7:  nop 
	IL_03f8:  ldloc 1

	IL_03fc:  nop 
	IL_03fd:  nop 
	IL_03fe:  ldc.i4 1
	IL_0403:  beq IL_040d

	IL_0408:  br IL_041c

	IL_040d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdnull()
	IL_0412:  br IL_0421

	IL_0417:  br IL_0421

	IL_041c:  br IL_0421

	IL_0421:  ret 
    } // end of method Helpers::EmitLiteral

    // method line 58
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal ProcessConst (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral lit)  cil managed 
    {
        // Method begins at RVA 0x52b0
	// Code size 1154 (0x482)
	.maxstack 40
	.locals init (
		class [mscorlib]System.Type	V_0,
		class [mscorlib]System.Type	V_1,
		object	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral	V_6,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral	V_10,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral	V_13)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_000b:  stloc 1

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldarg 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldfld object [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ConstVal
	IL_001c:  stloc 2

	IL_0020:  nop 
	IL_0021:  nop 
	IL_0022:  ldtoken [mscorlib]System.String
	IL_0027:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_002c:  stloc 0

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  ldloc 0

	IL_0036:  nop 
	IL_0037:  nop 
	IL_0038:  ldloc 1

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0043:  stloc 3

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldloc 3

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldc.i4 1
	IL_0054:  beq IL_005e

	IL_0059:  br IL_008f

	IL_005e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::'.ctor'()
	IL_0063:  stloc 4

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldloc 4

	IL_006d:  nop 
	IL_006e:  nop 
	IL_006f:  ldloc 2

	IL_0073:  nop 
	IL_0074:  nop 
	IL_0075:  call string class [mscorlib]System.Convert::ToString(object)
	IL_007a:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_007f:  ldloc 4

	IL_0083:  nop 
	IL_0084:  nop 
	IL_0085:  br IL_0481

	IL_008a:  br IL_0094

	IL_008f:  br IL_0094

	IL_0094:  ldtoken [mscorlib]System.SByte
	IL_0099:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_009e:  stloc 0

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldloc 0

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldloc 1

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_00b5:  stloc 3

	IL_00b9:  nop 
	IL_00ba:  nop 
	IL_00bb:  ldloc 3

	IL_00bf:  nop 
	IL_00c0:  nop 
	IL_00c1:  ldc.i4 1
	IL_00c6:  beq IL_00d0

	IL_00cb:  br IL_0101

	IL_00d0:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::'.ctor'()
	IL_00d5:  stloc 5

	IL_00d9:  nop 
	IL_00da:  nop 
	IL_00db:  ldloc 5

	IL_00df:  nop 
	IL_00e0:  nop 
	IL_00e1:  ldloc 2

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  call int8 class [mscorlib]System.Convert::ToSByte(object)
	IL_00ec:  stfld int8 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.SByteLiteral::NumVal
	IL_00f1:  ldloc 5

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  br IL_0481

	IL_00fc:  br IL_0106

	IL_0101:  br IL_0106

	IL_0106:  ldtoken [mscorlib]System.Int16
	IL_010b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0110:  stloc 0

	IL_0114:  nop 
	IL_0115:  nop 
	IL_0116:  ldloc 0

	IL_011a:  nop 
	IL_011b:  nop 
	IL_011c:  ldloc 1

	IL_0120:  nop 
	IL_0121:  nop 
	IL_0122:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0127:  stloc 3

	IL_012b:  nop 
	IL_012c:  nop 
	IL_012d:  ldloc 3

	IL_0131:  nop 
	IL_0132:  nop 
	IL_0133:  ldc.i4 1
	IL_0138:  beq IL_0142

	IL_013d:  br IL_0173

	IL_0142:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::'.ctor'()
	IL_0147:  stloc 6

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldloc 6

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  ldloc 2

	IL_0157:  nop 
	IL_0158:  nop 
	IL_0159:  call int16 class [mscorlib]System.Convert::ToInt16(object)
	IL_015e:  stfld int16 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ShortLiteral::NumVal
	IL_0163:  ldloc 6

	IL_0167:  nop 
	IL_0168:  nop 
	IL_0169:  br IL_0481

	IL_016e:  br IL_0178

	IL_0173:  br IL_0178

	IL_0178:  ldtoken [mscorlib]System.Int32
	IL_017d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0182:  stloc 0

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  ldloc 0

	IL_018c:  nop 
	IL_018d:  nop 
	IL_018e:  ldloc 1

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0199:  stloc 3

	IL_019d:  nop 
	IL_019e:  nop 
	IL_019f:  ldloc 3

	IL_01a3:  nop 
	IL_01a4:  nop 
	IL_01a5:  ldc.i4 1
	IL_01aa:  beq IL_01b4

	IL_01af:  br IL_01e5

	IL_01b4:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::'.ctor'()
	IL_01b9:  stloc 7

	IL_01bd:  nop 
	IL_01be:  nop 
	IL_01bf:  ldloc 7

	IL_01c3:  nop 
	IL_01c4:  nop 
	IL_01c5:  ldloc 2

	IL_01c9:  nop 
	IL_01ca:  nop 
	IL_01cb:  call int32 class [mscorlib]System.Convert::ToInt32(object)
	IL_01d0:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_01d5:  ldloc 7

	IL_01d9:  nop 
	IL_01da:  nop 
	IL_01db:  br IL_0481

	IL_01e0:  br IL_01ea

	IL_01e5:  br IL_01ea

	IL_01ea:  ldtoken [mscorlib]System.Int64
	IL_01ef:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01f4:  stloc 0

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  ldloc 0

	IL_01fe:  nop 
	IL_01ff:  nop 
	IL_0200:  ldloc 1

	IL_0204:  nop 
	IL_0205:  nop 
	IL_0206:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_020b:  stloc 3

	IL_020f:  nop 
	IL_0210:  nop 
	IL_0211:  ldloc 3

	IL_0215:  nop 
	IL_0216:  nop 
	IL_0217:  ldc.i4 1
	IL_021c:  beq IL_0226

	IL_0221:  br IL_0257

	IL_0226:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::'.ctor'()
	IL_022b:  stloc 8

	IL_022f:  nop 
	IL_0230:  nop 
	IL_0231:  ldloc 8

	IL_0235:  nop 
	IL_0236:  nop 
	IL_0237:  ldloc 2

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  call int64 class [mscorlib]System.Convert::ToInt64(object)
	IL_0242:  stfld int64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.LongLiteral::NumVal
	IL_0247:  ldloc 8

	IL_024b:  nop 
	IL_024c:  nop 
	IL_024d:  br IL_0481

	IL_0252:  br IL_025c

	IL_0257:  br IL_025c

	IL_025c:  ldtoken [mscorlib]System.Single
	IL_0261:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0266:  stloc 0

	IL_026a:  nop 
	IL_026b:  nop 
	IL_026c:  ldloc 0

	IL_0270:  nop 
	IL_0271:  nop 
	IL_0272:  ldloc 1

	IL_0276:  nop 
	IL_0277:  nop 
	IL_0278:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_027d:  stloc 3

	IL_0281:  nop 
	IL_0282:  nop 
	IL_0283:  ldloc 3

	IL_0287:  nop 
	IL_0288:  nop 
	IL_0289:  ldc.i4 1
	IL_028e:  beq IL_0298

	IL_0293:  br IL_02c9

	IL_0298:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::'.ctor'()
	IL_029d:  stloc 9

	IL_02a1:  nop 
	IL_02a2:  nop 
	IL_02a3:  ldloc 9

	IL_02a7:  nop 
	IL_02a8:  nop 
	IL_02a9:  ldloc 2

	IL_02ad:  nop 
	IL_02ae:  nop 
	IL_02af:  call float32 class [mscorlib]System.Convert::ToSingle(object)
	IL_02b4:  stfld float32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.FloatLiteral::NumVal
	IL_02b9:  ldloc 9

	IL_02bd:  nop 
	IL_02be:  nop 
	IL_02bf:  br IL_0481

	IL_02c4:  br IL_02ce

	IL_02c9:  br IL_02ce

	IL_02ce:  ldtoken [mscorlib]System.Double
	IL_02d3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02d8:  stloc 0

	IL_02dc:  nop 
	IL_02dd:  nop 
	IL_02de:  ldloc 0

	IL_02e2:  nop 
	IL_02e3:  nop 
	IL_02e4:  ldloc 1

	IL_02e8:  nop 
	IL_02e9:  nop 
	IL_02ea:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_02ef:  stloc 3

	IL_02f3:  nop 
	IL_02f4:  nop 
	IL_02f5:  ldloc 3

	IL_02f9:  nop 
	IL_02fa:  nop 
	IL_02fb:  ldc.i4 1
	IL_0300:  beq IL_030a

	IL_0305:  br IL_033b

	IL_030a:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::'.ctor'()
	IL_030f:  stloc 10

	IL_0313:  nop 
	IL_0314:  nop 
	IL_0315:  ldloc 10

	IL_0319:  nop 
	IL_031a:  nop 
	IL_031b:  ldloc 2

	IL_031f:  nop 
	IL_0320:  nop 
	IL_0321:  call float64 class [mscorlib]System.Convert::ToDouble(object)
	IL_0326:  stfld float64 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.DoubleLiteral::NumVal
	IL_032b:  ldloc 10

	IL_032f:  nop 
	IL_0330:  nop 
	IL_0331:  br IL_0481

	IL_0336:  br IL_0340

	IL_033b:  br IL_0340

	IL_0340:  ldtoken [mscorlib]System.Boolean
	IL_0345:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_034a:  stloc 0

	IL_034e:  nop 
	IL_034f:  nop 
	IL_0350:  ldloc 0

	IL_0354:  nop 
	IL_0355:  nop 
	IL_0356:  ldloc 1

	IL_035a:  nop 
	IL_035b:  nop 
	IL_035c:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0361:  stloc 3

	IL_0365:  nop 
	IL_0366:  nop 
	IL_0367:  ldloc 3

	IL_036b:  nop 
	IL_036c:  nop 
	IL_036d:  ldc.i4 1
	IL_0372:  beq IL_037c

	IL_0377:  br IL_03ad

	IL_037c:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::'.ctor'()
	IL_0381:  stloc 11

	IL_0385:  nop 
	IL_0386:  nop 
	IL_0387:  ldloc 11

	IL_038b:  nop 
	IL_038c:  nop 
	IL_038d:  ldloc 2

	IL_0391:  nop 
	IL_0392:  nop 
	IL_0393:  call bool class [mscorlib]System.Convert::ToBoolean(object)
	IL_0398:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.BooleanLiteral::BoolVal
	IL_039d:  ldloc 11

	IL_03a1:  nop 
	IL_03a2:  nop 
	IL_03a3:  br IL_0481

	IL_03a8:  br IL_03b2

	IL_03ad:  br IL_03b2

	IL_03b2:  ldtoken [mscorlib]System.Char
	IL_03b7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03bc:  stloc 0

	IL_03c0:  nop 
	IL_03c1:  nop 
	IL_03c2:  ldloc 0

	IL_03c6:  nop 
	IL_03c7:  nop 
	IL_03c8:  ldloc 1

	IL_03cc:  nop 
	IL_03cd:  nop 
	IL_03ce:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_03d3:  stloc 3

	IL_03d7:  nop 
	IL_03d8:  nop 
	IL_03d9:  ldloc 3

	IL_03dd:  nop 
	IL_03de:  nop 
	IL_03df:  ldc.i4 1
	IL_03e4:  beq IL_03ee

	IL_03e9:  br IL_041f

	IL_03ee:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::'.ctor'()
	IL_03f3:  stloc 12

	IL_03f7:  nop 
	IL_03f8:  nop 
	IL_03f9:  ldloc 12

	IL_03fd:  nop 
	IL_03fe:  nop 
	IL_03ff:  ldloc 2

	IL_0403:  nop 
	IL_0404:  nop 
	IL_0405:  call char class [mscorlib]System.Convert::ToChar(object)
	IL_040a:  stfld char [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.CharLiteral::CharVal
	IL_040f:  ldloc 12

	IL_0413:  nop 
	IL_0414:  nop 
	IL_0415:  br IL_0481

	IL_041a:  br IL_0424

	IL_041f:  br IL_0424

	IL_0424:  ldtoken [mscorlib]System.Object
	IL_0429:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_042e:  stloc 0

	IL_0432:  nop 
	IL_0433:  nop 
	IL_0434:  ldloc 0

	IL_0438:  nop 
	IL_0439:  nop 
	IL_043a:  ldloc 1

	IL_043e:  nop 
	IL_043f:  nop 
	IL_0440:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0445:  stloc 3

	IL_0449:  nop 
	IL_044a:  nop 
	IL_044b:  ldloc 3

	IL_044f:  nop 
	IL_0450:  nop 
	IL_0451:  ldc.i4 1
	IL_0456:  beq IL_0460

	IL_045b:  br IL_047b

	IL_0460:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.NullLiteral::'.ctor'()
	IL_0465:  stloc 13

	IL_0469:  nop 
	IL_046a:  nop 
	IL_046b:  ldloc 13

	IL_046f:  nop 
	IL_0470:  nop 
	IL_0471:  br IL_0481

	IL_0476:  br IL_0480

	IL_047b:  br IL_0480

	IL_0480:  ldnull 
	IL_0481:  ret 
    } // end of method Helpers::ProcessConst

    // method line 59
    .method public static 
           default void EmitOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op op, bool s)  cil managed 
    {
        // Method begins at RVA 0x5740
	// Code size 3202 (0xc82)
	.maxstack 136
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1,
		class [mscorlib]System.Reflection.MethodInfo	V_2)
	IL_0000:  ldnull 
	IL_0001:  stloc 2

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AddOp
	IL_000c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0011:  stloc 0

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldloc 0

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldarg 0

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0028:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_002d:  stloc 1

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldloc 1

	IL_0037:  nop 
	IL_0038:  nop 
	IL_0039:  ldc.i4 1
	IL_003e:  beq IL_0048

	IL_0043:  br IL_0116

	IL_0048:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_004d:  ldstr "op_Addition"
	IL_0052:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0057:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_005c:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0061:  stloc 2

	IL_0065:  nop 
	IL_0066:  nop 
	IL_0067:  ldloc 2

	IL_006b:  nop 
	IL_006c:  nop 
	IL_006d:  ldnull 
	IL_006e:  beq IL_0098

	IL_0073:  br IL_0078

	IL_0078:  ldloc 2

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0083:  ldloc 2

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_008e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0093:  br IL_010c

	IL_0098:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_009d:  ldc.i4 1
	IL_00a2:  beq IL_00ac

	IL_00a7:  br IL_00b6

	IL_00ac:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStrAdd()
	IL_00b1:  br IL_0107

	IL_00b6:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::DelegateFlg
	IL_00bb:  ldc.i4 1
	IL_00c0:  beq IL_00ca

	IL_00c5:  br IL_00d4

	IL_00ca:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitDelegateAdd()
	IL_00cf:  br IL_0102

	IL_00d4:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_00d9:  ldc.i4 1
	IL_00de:  beq IL_00e8

	IL_00e3:  br IL_00f8

	IL_00e8:  ldarg 1

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitAdd(bool)
	IL_00f3:  br IL_00fd

	IL_00f8:  br IL_00fd

	IL_00fd:  br IL_0102

	IL_0102:  br IL_0107

	IL_0107:  br IL_010c

	IL_010c:  br IL_0c81

	IL_0111:  br IL_011b

	IL_0116:  br IL_011b

	IL_011b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.MulOp
	IL_0120:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0125:  stloc 0

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  ldloc 0

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  ldarg 0

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_013c:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0141:  stloc 1

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldloc 1

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldc.i4 1
	IL_0152:  beq IL_015c

	IL_0157:  br IL_01e4

	IL_015c:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0161:  ldstr "op_Multiply"
	IL_0166:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_016b:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0170:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0175:  stloc 2

	IL_0179:  nop 
	IL_017a:  nop 
	IL_017b:  ldloc 2

	IL_017f:  nop 
	IL_0180:  nop 
	IL_0181:  ldnull 
	IL_0182:  beq IL_01ac

	IL_0187:  br IL_018c

	IL_018c:  ldloc 2

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0197:  ldloc 2

	IL_019b:  nop 
	IL_019c:  nop 
	IL_019d:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_01a2:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_01a7:  br IL_01da

	IL_01ac:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_01b1:  ldc.i4 1
	IL_01b6:  beq IL_01c0

	IL_01bb:  br IL_01d0

	IL_01c0:  ldarg 1

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitMul(bool)
	IL_01cb:  br IL_01d5

	IL_01d0:  br IL_01d5

	IL_01d5:  br IL_01da

	IL_01da:  br IL_0c81

	IL_01df:  br IL_01e9

	IL_01e4:  br IL_01e9

	IL_01e9:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.SubOp
	IL_01ee:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01f3:  stloc 0

	IL_01f7:  nop 
	IL_01f8:  nop 
	IL_01f9:  ldloc 0

	IL_01fd:  nop 
	IL_01fe:  nop 
	IL_01ff:  ldarg 0

	IL_0203:  nop 
	IL_0204:  nop 
	IL_0205:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_020a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_020f:  stloc 1

	IL_0213:  nop 
	IL_0214:  nop 
	IL_0215:  ldloc 1

	IL_0219:  nop 
	IL_021a:  nop 
	IL_021b:  ldc.i4 1
	IL_0220:  beq IL_022a

	IL_0225:  br IL_02d5

	IL_022a:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_022f:  ldstr "op_Subtraction"
	IL_0234:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0239:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_023e:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0243:  stloc 2

	IL_0247:  nop 
	IL_0248:  nop 
	IL_0249:  ldloc 2

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  ldnull 
	IL_0250:  beq IL_027a

	IL_0255:  br IL_025a

	IL_025a:  ldloc 2

	IL_025e:  nop 
	IL_025f:  nop 
	IL_0260:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0265:  ldloc 2

	IL_0269:  nop 
	IL_026a:  nop 
	IL_026b:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0270:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0275:  br IL_02cb

	IL_027a:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::DelegateFlg
	IL_027f:  ldc.i4 1
	IL_0284:  beq IL_028e

	IL_0289:  br IL_0298

	IL_028e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitDelegateSub()
	IL_0293:  br IL_02c6

	IL_0298:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_029d:  ldc.i4 1
	IL_02a2:  beq IL_02ac

	IL_02a7:  br IL_02bc

	IL_02ac:  ldarg 1

	IL_02b0:  nop 
	IL_02b1:  nop 
	IL_02b2:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitSub(bool)
	IL_02b7:  br IL_02c1

	IL_02bc:  br IL_02c1

	IL_02c1:  br IL_02c6

	IL_02c6:  br IL_02cb

	IL_02cb:  br IL_0c81

	IL_02d0:  br IL_02da

	IL_02d5:  br IL_02da

	IL_02da:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.DivOp
	IL_02df:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02e4:  stloc 0

	IL_02e8:  nop 
	IL_02e9:  nop 
	IL_02ea:  ldloc 0

	IL_02ee:  nop 
	IL_02ef:  nop 
	IL_02f0:  ldarg 0

	IL_02f4:  nop 
	IL_02f5:  nop 
	IL_02f6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_02fb:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0300:  stloc 1

	IL_0304:  nop 
	IL_0305:  nop 
	IL_0306:  ldloc 1

	IL_030a:  nop 
	IL_030b:  nop 
	IL_030c:  ldc.i4 1
	IL_0311:  beq IL_031b

	IL_0316:  br IL_03a3

	IL_031b:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0320:  ldstr "op_Division"
	IL_0325:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_032a:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_032f:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0334:  stloc 2

	IL_0338:  nop 
	IL_0339:  nop 
	IL_033a:  ldloc 2

	IL_033e:  nop 
	IL_033f:  nop 
	IL_0340:  ldnull 
	IL_0341:  beq IL_036b

	IL_0346:  br IL_034b

	IL_034b:  ldloc 2

	IL_034f:  nop 
	IL_0350:  nop 
	IL_0351:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0356:  ldloc 2

	IL_035a:  nop 
	IL_035b:  nop 
	IL_035c:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0361:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0366:  br IL_0399

	IL_036b:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_0370:  ldc.i4 1
	IL_0375:  beq IL_037f

	IL_037a:  br IL_038f

	IL_037f:  ldarg 1

	IL_0383:  nop 
	IL_0384:  nop 
	IL_0385:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitDiv(bool)
	IL_038a:  br IL_0394

	IL_038f:  br IL_0394

	IL_0394:  br IL_0399

	IL_0399:  br IL_0c81

	IL_039e:  br IL_03a8

	IL_03a3:  br IL_03a8

	IL_03a8:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ModOp
	IL_03ad:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03b2:  stloc 0

	IL_03b6:  nop 
	IL_03b7:  nop 
	IL_03b8:  ldloc 0

	IL_03bc:  nop 
	IL_03bd:  nop 
	IL_03be:  ldarg 0

	IL_03c2:  nop 
	IL_03c3:  nop 
	IL_03c4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_03c9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_03ce:  stloc 1

	IL_03d2:  nop 
	IL_03d3:  nop 
	IL_03d4:  ldloc 1

	IL_03d8:  nop 
	IL_03d9:  nop 
	IL_03da:  ldc.i4 1
	IL_03df:  beq IL_03e9

	IL_03e4:  br IL_0471

	IL_03e9:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_03ee:  ldstr "op_Modulus"
	IL_03f3:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_03f8:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_03fd:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0402:  stloc 2

	IL_0406:  nop 
	IL_0407:  nop 
	IL_0408:  ldloc 2

	IL_040c:  nop 
	IL_040d:  nop 
	IL_040e:  ldnull 
	IL_040f:  beq IL_0439

	IL_0414:  br IL_0419

	IL_0419:  ldloc 2

	IL_041d:  nop 
	IL_041e:  nop 
	IL_041f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0424:  ldloc 2

	IL_0428:  nop 
	IL_0429:  nop 
	IL_042a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_042f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0434:  br IL_0467

	IL_0439:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_043e:  ldc.i4 1
	IL_0443:  beq IL_044d

	IL_0448:  br IL_045d

	IL_044d:  ldarg 1

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRem(bool)
	IL_0458:  br IL_0462

	IL_045d:  br IL_0462

	IL_0462:  br IL_0467

	IL_0467:  br IL_0c81

	IL_046c:  br IL_0476

	IL_0471:  br IL_0476

	IL_0476:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.OrOp
	IL_047b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0480:  stloc 0

	IL_0484:  nop 
	IL_0485:  nop 
	IL_0486:  ldloc 0

	IL_048a:  nop 
	IL_048b:  nop 
	IL_048c:  ldarg 0

	IL_0490:  nop 
	IL_0491:  nop 
	IL_0492:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0497:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_049c:  stloc 1

	IL_04a0:  nop 
	IL_04a1:  nop 
	IL_04a2:  ldloc 1

	IL_04a6:  nop 
	IL_04a7:  nop 
	IL_04a8:  ldc.i4 1
	IL_04ad:  beq IL_04b7

	IL_04b2:  br IL_04c6

	IL_04b7:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitOr()
	IL_04bc:  br IL_0c81

	IL_04c1:  br IL_04cb

	IL_04c6:  br IL_04cb

	IL_04cb:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AndOp
	IL_04d0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04d5:  stloc 0

	IL_04d9:  nop 
	IL_04da:  nop 
	IL_04db:  ldloc 0

	IL_04df:  nop 
	IL_04e0:  nop 
	IL_04e1:  ldarg 0

	IL_04e5:  nop 
	IL_04e6:  nop 
	IL_04e7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_04ec:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_04f1:  stloc 1

	IL_04f5:  nop 
	IL_04f6:  nop 
	IL_04f7:  ldloc 1

	IL_04fb:  nop 
	IL_04fc:  nop 
	IL_04fd:  ldc.i4 1
	IL_0502:  beq IL_050c

	IL_0507:  br IL_051b

	IL_050c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitAnd()
	IL_0511:  br IL_0c81

	IL_0516:  br IL_0520

	IL_051b:  br IL_0520

	IL_0520:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.OrOp
	IL_0525:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_052a:  stloc 0

	IL_052e:  nop 
	IL_052f:  nop 
	IL_0530:  ldloc 0

	IL_0534:  nop 
	IL_0535:  nop 
	IL_0536:  ldarg 0

	IL_053a:  nop 
	IL_053b:  nop 
	IL_053c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0541:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0546:  stloc 1

	IL_054a:  nop 
	IL_054b:  nop 
	IL_054c:  ldloc 1

	IL_0550:  nop 
	IL_0551:  nop 
	IL_0552:  ldc.i4 1
	IL_0557:  beq IL_0561

	IL_055c:  br IL_0570

	IL_0561:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitOr()
	IL_0566:  br IL_0c81

	IL_056b:  br IL_0575

	IL_0570:  br IL_0575

	IL_0575:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XorOp
	IL_057a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_057f:  stloc 0

	IL_0583:  nop 
	IL_0584:  nop 
	IL_0585:  ldloc 0

	IL_0589:  nop 
	IL_058a:  nop 
	IL_058b:  ldarg 0

	IL_058f:  nop 
	IL_0590:  nop 
	IL_0591:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0596:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_059b:  stloc 1

	IL_059f:  nop 
	IL_05a0:  nop 
	IL_05a1:  ldloc 1

	IL_05a5:  nop 
	IL_05a6:  nop 
	IL_05a7:  ldc.i4 1
	IL_05ac:  beq IL_05b6

	IL_05b1:  br IL_05c5

	IL_05b6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitXor()
	IL_05bb:  br IL_0c81

	IL_05c0:  br IL_05ca

	IL_05c5:  br IL_05ca

	IL_05ca:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NandOp
	IL_05cf:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05d4:  stloc 0

	IL_05d8:  nop 
	IL_05d9:  nop 
	IL_05da:  ldloc 0

	IL_05de:  nop 
	IL_05df:  nop 
	IL_05e0:  ldarg 0

	IL_05e4:  nop 
	IL_05e5:  nop 
	IL_05e6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_05eb:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05f0:  stloc 1

	IL_05f4:  nop 
	IL_05f5:  nop 
	IL_05f6:  ldloc 1

	IL_05fa:  nop 
	IL_05fb:  nop 
	IL_05fc:  ldc.i4 1
	IL_0601:  beq IL_060b

	IL_0606:  br IL_061a

	IL_060b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNand()
	IL_0610:  br IL_0c81

	IL_0615:  br IL_061f

	IL_061a:  br IL_061f

	IL_061f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NorOp
	IL_0624:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0629:  stloc 0

	IL_062d:  nop 
	IL_062e:  nop 
	IL_062f:  ldloc 0

	IL_0633:  nop 
	IL_0634:  nop 
	IL_0635:  ldarg 0

	IL_0639:  nop 
	IL_063a:  nop 
	IL_063b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0640:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0645:  stloc 1

	IL_0649:  nop 
	IL_064a:  nop 
	IL_064b:  ldloc 1

	IL_064f:  nop 
	IL_0650:  nop 
	IL_0651:  ldc.i4 1
	IL_0656:  beq IL_0660

	IL_065b:  br IL_066f

	IL_0660:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNor()
	IL_0665:  br IL_0c81

	IL_066a:  br IL_0674

	IL_066f:  br IL_0674

	IL_0674:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XnorOp
	IL_0679:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_067e:  stloc 0

	IL_0682:  nop 
	IL_0683:  nop 
	IL_0684:  ldloc 0

	IL_0688:  nop 
	IL_0689:  nop 
	IL_068a:  ldarg 0

	IL_068e:  nop 
	IL_068f:  nop 
	IL_0690:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0695:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_069a:  stloc 1

	IL_069e:  nop 
	IL_069f:  nop 
	IL_06a0:  ldloc 1

	IL_06a4:  nop 
	IL_06a5:  nop 
	IL_06a6:  ldc.i4 1
	IL_06ab:  beq IL_06b5

	IL_06b0:  br IL_06c4

	IL_06b5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitXnor()
	IL_06ba:  br IL_0c81

	IL_06bf:  br IL_06c9

	IL_06c4:  br IL_06c9

	IL_06c9:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GtOp
	IL_06ce:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_06d3:  stloc 0

	IL_06d7:  nop 
	IL_06d8:  nop 
	IL_06d9:  ldloc 0

	IL_06dd:  nop 
	IL_06de:  nop 
	IL_06df:  ldarg 0

	IL_06e3:  nop 
	IL_06e4:  nop 
	IL_06e5:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_06ea:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_06ef:  stloc 1

	IL_06f3:  nop 
	IL_06f4:  nop 
	IL_06f5:  ldloc 1

	IL_06f9:  nop 
	IL_06fa:  nop 
	IL_06fb:  ldc.i4 1
	IL_0700:  beq IL_070a

	IL_0705:  br IL_0792

	IL_070a:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_070f:  ldstr "op_GreaterThan"
	IL_0714:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0719:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_071e:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0723:  stloc 2

	IL_0727:  nop 
	IL_0728:  nop 
	IL_0729:  ldloc 2

	IL_072d:  nop 
	IL_072e:  nop 
	IL_072f:  ldnull 
	IL_0730:  beq IL_075a

	IL_0735:  br IL_073a

	IL_073a:  ldloc 2

	IL_073e:  nop 
	IL_073f:  nop 
	IL_0740:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0745:  ldloc 2

	IL_0749:  nop 
	IL_074a:  nop 
	IL_074b:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0750:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0755:  br IL_0788

	IL_075a:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_075f:  ldc.i4 1
	IL_0764:  beq IL_076e

	IL_0769:  br IL_077e

	IL_076e:  ldarg 1

	IL_0772:  nop 
	IL_0773:  nop 
	IL_0774:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCgt(bool)
	IL_0779:  br IL_0783

	IL_077e:  br IL_0783

	IL_0783:  br IL_0788

	IL_0788:  br IL_0c81

	IL_078d:  br IL_0797

	IL_0792:  br IL_0797

	IL_0797:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LtOp
	IL_079c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_07a1:  stloc 0

	IL_07a5:  nop 
	IL_07a6:  nop 
	IL_07a7:  ldloc 0

	IL_07ab:  nop 
	IL_07ac:  nop 
	IL_07ad:  ldarg 0

	IL_07b1:  nop 
	IL_07b2:  nop 
	IL_07b3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_07b8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_07bd:  stloc 1

	IL_07c1:  nop 
	IL_07c2:  nop 
	IL_07c3:  ldloc 1

	IL_07c7:  nop 
	IL_07c8:  nop 
	IL_07c9:  ldc.i4 1
	IL_07ce:  beq IL_07d8

	IL_07d3:  br IL_0860

	IL_07d8:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_07dd:  ldstr "op_LessThan"
	IL_07e2:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_07e7:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_07ec:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_07f1:  stloc 2

	IL_07f5:  nop 
	IL_07f6:  nop 
	IL_07f7:  ldloc 2

	IL_07fb:  nop 
	IL_07fc:  nop 
	IL_07fd:  ldnull 
	IL_07fe:  beq IL_0828

	IL_0803:  br IL_0808

	IL_0808:  ldloc 2

	IL_080c:  nop 
	IL_080d:  nop 
	IL_080e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0813:  ldloc 2

	IL_0817:  nop 
	IL_0818:  nop 
	IL_0819:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_081e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0823:  br IL_0856

	IL_0828:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_082d:  ldc.i4 1
	IL_0832:  beq IL_083c

	IL_0837:  br IL_084c

	IL_083c:  ldarg 1

	IL_0840:  nop 
	IL_0841:  nop 
	IL_0842:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitClt(bool)
	IL_0847:  br IL_0851

	IL_084c:  br IL_0851

	IL_0851:  br IL_0856

	IL_0856:  br IL_0c81

	IL_085b:  br IL_0865

	IL_0860:  br IL_0865

	IL_0865:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GeOp
	IL_086a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_086f:  stloc 0

	IL_0873:  nop 
	IL_0874:  nop 
	IL_0875:  ldloc 0

	IL_0879:  nop 
	IL_087a:  nop 
	IL_087b:  ldarg 0

	IL_087f:  nop 
	IL_0880:  nop 
	IL_0881:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0886:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_088b:  stloc 1

	IL_088f:  nop 
	IL_0890:  nop 
	IL_0891:  ldloc 1

	IL_0895:  nop 
	IL_0896:  nop 
	IL_0897:  ldc.i4 1
	IL_089c:  beq IL_08a6

	IL_08a1:  br IL_092e

	IL_08a6:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_08ab:  ldstr "op_GreaterThanOrEqual"
	IL_08b0:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_08b5:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_08ba:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_08bf:  stloc 2

	IL_08c3:  nop 
	IL_08c4:  nop 
	IL_08c5:  ldloc 2

	IL_08c9:  nop 
	IL_08ca:  nop 
	IL_08cb:  ldnull 
	IL_08cc:  beq IL_08f6

	IL_08d1:  br IL_08d6

	IL_08d6:  ldloc 2

	IL_08da:  nop 
	IL_08db:  nop 
	IL_08dc:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_08e1:  ldloc 2

	IL_08e5:  nop 
	IL_08e6:  nop 
	IL_08e7:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_08ec:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_08f1:  br IL_0924

	IL_08f6:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_08fb:  ldc.i4 1
	IL_0900:  beq IL_090a

	IL_0905:  br IL_091a

	IL_090a:  ldarg 1

	IL_090e:  nop 
	IL_090f:  nop 
	IL_0910:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCge(bool)
	IL_0915:  br IL_091f

	IL_091a:  br IL_091f

	IL_091f:  br IL_0924

	IL_0924:  br IL_0c81

	IL_0929:  br IL_0933

	IL_092e:  br IL_0933

	IL_0933:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LeOp
	IL_0938:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_093d:  stloc 0

	IL_0941:  nop 
	IL_0942:  nop 
	IL_0943:  ldloc 0

	IL_0947:  nop 
	IL_0948:  nop 
	IL_0949:  ldarg 0

	IL_094d:  nop 
	IL_094e:  nop 
	IL_094f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0954:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0959:  stloc 1

	IL_095d:  nop 
	IL_095e:  nop 
	IL_095f:  ldloc 1

	IL_0963:  nop 
	IL_0964:  nop 
	IL_0965:  ldc.i4 1
	IL_096a:  beq IL_0974

	IL_096f:  br IL_09fc

	IL_0974:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0979:  ldstr "op_LessThanOrEqual"
	IL_097e:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0983:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0988:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_098d:  stloc 2

	IL_0991:  nop 
	IL_0992:  nop 
	IL_0993:  ldloc 2

	IL_0997:  nop 
	IL_0998:  nop 
	IL_0999:  ldnull 
	IL_099a:  beq IL_09c4

	IL_099f:  br IL_09a4

	IL_09a4:  ldloc 2

	IL_09a8:  nop 
	IL_09a9:  nop 
	IL_09aa:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_09af:  ldloc 2

	IL_09b3:  nop 
	IL_09b4:  nop 
	IL_09b5:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_09ba:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_09bf:  br IL_09f2

	IL_09c4:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_09c9:  ldc.i4 1
	IL_09ce:  beq IL_09d8

	IL_09d3:  br IL_09e8

	IL_09d8:  ldarg 1

	IL_09dc:  nop 
	IL_09dd:  nop 
	IL_09de:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCle(bool)
	IL_09e3:  br IL_09ed

	IL_09e8:  br IL_09ed

	IL_09ed:  br IL_09f2

	IL_09f2:  br IL_0c81

	IL_09f7:  br IL_0a01

	IL_09fc:  br IL_0a01

	IL_0a01:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.EqOp
	IL_0a06:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a0b:  stloc 0

	IL_0a0f:  nop 
	IL_0a10:  nop 
	IL_0a11:  ldloc 0

	IL_0a15:  nop 
	IL_0a16:  nop 
	IL_0a17:  ldarg 0

	IL_0a1b:  nop 
	IL_0a1c:  nop 
	IL_0a1d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0a22:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0a27:  stloc 1

	IL_0a2b:  nop 
	IL_0a2c:  nop 
	IL_0a2d:  ldloc 1

	IL_0a31:  nop 
	IL_0a32:  nop 
	IL_0a33:  ldc.i4 1
	IL_0a38:  beq IL_0a42

	IL_0a3d:  br IL_0ac9

	IL_0a42:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0a47:  ldstr "op_Equality"
	IL_0a4c:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0a51:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0a56:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0a5b:  stloc 2

	IL_0a5f:  nop 
	IL_0a60:  nop 
	IL_0a61:  ldloc 2

	IL_0a65:  nop 
	IL_0a66:  nop 
	IL_0a67:  ldnull 
	IL_0a68:  beq IL_0a92

	IL_0a6d:  br IL_0a72

	IL_0a72:  ldloc 2

	IL_0a76:  nop 
	IL_0a77:  nop 
	IL_0a78:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0a7d:  ldloc 2

	IL_0a81:  nop 
	IL_0a82:  nop 
	IL_0a83:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0a88:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0a8d:  br IL_0abf

	IL_0a92:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0a97:  ldc.i4 1
	IL_0a9c:  beq IL_0aa6

	IL_0aa1:  br IL_0ab0

	IL_0aa6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStrCeq()
	IL_0aab:  br IL_0aba

	IL_0ab0:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCeq()
	IL_0ab5:  br IL_0aba

	IL_0aba:  br IL_0abf

	IL_0abf:  br IL_0c81

	IL_0ac4:  br IL_0ace

	IL_0ac9:  br IL_0ace

	IL_0ace:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NeqOp
	IL_0ad3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0ad8:  stloc 0

	IL_0adc:  nop 
	IL_0add:  nop 
	IL_0ade:  ldloc 0

	IL_0ae2:  nop 
	IL_0ae3:  nop 
	IL_0ae4:  ldarg 0

	IL_0ae8:  nop 
	IL_0ae9:  nop 
	IL_0aea:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0aef:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0af4:  stloc 1

	IL_0af8:  nop 
	IL_0af9:  nop 
	IL_0afa:  ldloc 1

	IL_0afe:  nop 
	IL_0aff:  nop 
	IL_0b00:  ldc.i4 1
	IL_0b05:  beq IL_0b0f

	IL_0b0a:  br IL_0b96

	IL_0b0f:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0b14:  ldstr "op_Inequality"
	IL_0b19:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0b1e:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0b23:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0b28:  stloc 2

	IL_0b2c:  nop 
	IL_0b2d:  nop 
	IL_0b2e:  ldloc 2

	IL_0b32:  nop 
	IL_0b33:  nop 
	IL_0b34:  ldnull 
	IL_0b35:  beq IL_0b5f

	IL_0b3a:  br IL_0b3f

	IL_0b3f:  ldloc 2

	IL_0b43:  nop 
	IL_0b44:  nop 
	IL_0b45:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0b4a:  ldloc 2

	IL_0b4e:  nop 
	IL_0b4f:  nop 
	IL_0b50:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0b55:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0b5a:  br IL_0b8c

	IL_0b5f:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0b64:  ldc.i4 1
	IL_0b69:  beq IL_0b73

	IL_0b6e:  br IL_0b7d

	IL_0b73:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStrCneq()
	IL_0b78:  br IL_0b87

	IL_0b7d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCneq()
	IL_0b82:  br IL_0b87

	IL_0b87:  br IL_0b8c

	IL_0b8c:  br IL_0c81

	IL_0b91:  br IL_0b9b

	IL_0b96:  br IL_0b9b

	IL_0b9b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LikeOp
	IL_0ba0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0ba5:  stloc 0

	IL_0ba9:  nop 
	IL_0baa:  nop 
	IL_0bab:  ldloc 0

	IL_0baf:  nop 
	IL_0bb0:  nop 
	IL_0bb1:  ldarg 0

	IL_0bb5:  nop 
	IL_0bb6:  nop 
	IL_0bb7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0bbc:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0bc1:  stloc 1

	IL_0bc5:  nop 
	IL_0bc6:  nop 
	IL_0bc7:  ldloc 1

	IL_0bcb:  nop 
	IL_0bcc:  nop 
	IL_0bcd:  ldc.i4 1
	IL_0bd2:  beq IL_0bdc

	IL_0bd7:  br IL_0c09

	IL_0bdc:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0be1:  ldc.i4 1
	IL_0be6:  beq IL_0bf0

	IL_0beb:  br IL_0bfa

	IL_0bf0:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLike()
	IL_0bf5:  br IL_0bff

	IL_0bfa:  br IL_0bff

	IL_0bff:  br IL_0c81

	IL_0c04:  br IL_0c0e

	IL_0c09:  br IL_0c0e

	IL_0c0e:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NLikeOp
	IL_0c13:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0c18:  stloc 0

	IL_0c1c:  nop 
	IL_0c1d:  nop 
	IL_0c1e:  ldloc 0

	IL_0c22:  nop 
	IL_0c23:  nop 
	IL_0c24:  ldarg 0

	IL_0c28:  nop 
	IL_0c29:  nop 
	IL_0c2a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0c2f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0c34:  stloc 1

	IL_0c38:  nop 
	IL_0c39:  nop 
	IL_0c3a:  ldloc 1

	IL_0c3e:  nop 
	IL_0c3f:  nop 
	IL_0c40:  ldc.i4 1
	IL_0c45:  beq IL_0c4f

	IL_0c4a:  br IL_0c7c

	IL_0c4f:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0c54:  ldc.i4 1
	IL_0c59:  beq IL_0c63

	IL_0c5e:  br IL_0c6d

	IL_0c63:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNLike()
	IL_0c68:  br IL_0c72

	IL_0c6d:  br IL_0c72

	IL_0c72:  br IL_0c81

	IL_0c77:  br IL_0c81

	IL_0c7c:  br IL_0c81

	IL_0c81:  ret 
    } // end of method Helpers::EmitOp

    // method line 60
    .method public static 
           default void EmitLocLd (int32 ind, bool locarg)  cil managed 
    {
        // Method begins at RVA 0x63d0
	// Code size 259 (0x103)
	.maxstack 16
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1)
	IL_0000:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0005:  ldc.i4 0
	IL_000a:  beq IL_0014

	IL_000f:  br IL_004e

	IL_0014:  ldarg 1

	IL_0018:  nop 
	IL_0019:  nop 
	IL_001a:  ldc.i4 1
	IL_001f:  beq IL_0029

	IL_0024:  br IL_0039

	IL_0029:  ldarg 0

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdloc(int32)
	IL_0034:  br IL_0049

	IL_0039:  ldarg 0

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_0044:  br IL_0049

	IL_0049:  br IL_0102

	IL_004e:  ldtoken [mscorlib]System.ValueType
	IL_0053:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0058:  stloc 0

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldloc 0

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0069:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_006e:  stloc 1

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldloc 1

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  ldc.i4 0
	IL_007f:  beq IL_0089

	IL_0084:  br IL_00c3

	IL_0089:  ldarg 1

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldc.i4 1
	IL_0094:  beq IL_009e

	IL_0099:  br IL_00ae

	IL_009e:  ldarg 0

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdloc(int32)
	IL_00a9:  br IL_00be

	IL_00ae:  ldarg 0

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_00b9:  br IL_00be

	IL_00be:  br IL_00fd

	IL_00c3:  ldarg 1

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldc.i4 1
	IL_00ce:  beq IL_00d8

	IL_00d3:  br IL_00e8

	IL_00d8:  ldarg 0

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdloca(int32)
	IL_00e3:  br IL_00f8

	IL_00e8:  ldarg 0

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarga(int32)
	IL_00f3:  br IL_00f8

	IL_00f8:  br IL_00fd

	IL_00fd:  br IL_0102

	IL_0102:  ret 
    } // end of method Helpers::EmitLocLd

    // method line 61
    .method public static 
           default void EmitElemLd (class [mscorlib]System.Type t)  cil managed 
    {
        // Method begins at RVA 0x64e0
	// Code size 133 (0x85)
	.maxstack 7
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1)
	IL_0000:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0005:  ldc.i4 0
	IL_000a:  beq IL_0014

	IL_000f:  br IL_0024

	IL_0014:  ldarg 0

	IL_0018:  nop 
	IL_0019:  nop 
	IL_001a:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdelem(class [mscorlib]System.Type)
	IL_001f:  br IL_0084

	IL_0024:  ldtoken [mscorlib]System.ValueType
	IL_0029:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_002e:  stloc 0

	IL_0032:  nop 
	IL_0033:  nop 
	IL_0034:  ldloc 0

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_003f:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_0044:  stloc 1

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldloc 1

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldc.i4 0
	IL_0055:  beq IL_005f

	IL_005a:  br IL_006f

	IL_005f:  ldarg 0

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdelem(class [mscorlib]System.Type)
	IL_006a:  br IL_007f

	IL_006f:  ldarg 0

	IL_0073:  nop 
	IL_0074:  nop 
	IL_0075:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdelema(class [mscorlib]System.Type)
	IL_007a:  br IL_007f

	IL_007f:  br IL_0084

	IL_0084:  ret 
    } // end of method Helpers::EmitElemLd

    // method line 62
    .method public static 
           default void EmitLocSt (int32 ind, bool locarg)  cil managed 
    {
        // Method begins at RVA 0x6574
	// Code size 54 (0x36)
	.maxstack 4
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_0025

	IL_0015:  ldarg 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStloc(int32)
	IL_0020:  br IL_0035

	IL_0025:  ldarg 0

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStarg(int32)
	IL_0030:  br IL_0035

	IL_0035:  ret 
    } // end of method Helpers::EmitLocSt

    // method line 63
    .method public static 
           default void EmitConv (class [mscorlib]System.Type source, class [mscorlib]System.Type sink)  cil managed 
    {
        // Method begins at RVA 0x65b8
	// Code size 2935 (0xb77)
	.maxstack 140
	.locals init (
		class [mscorlib]System.Type	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		bool	V_3,
		class [mscorlib]System.Reflection.MethodInfo	V_4,
		class [mscorlib]System.Type[]	V_5)
	IL_0000:  ldtoken [mscorlib]System.Convert
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 1

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldc.i4 0
	IL_0015:  stloc 2

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldc.i4 0
	IL_0020:  stloc 3

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldc.i4 1
	IL_002b:  conv.u 
	IL_002c:  newarr [mscorlib]System.Type
	IL_0031:  stloc 5

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldarg 0

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldarg 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0048:  stloc 2

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  ldloc 2

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 1
	IL_0059:  beq IL_0063

	IL_005e:  br IL_006d

	IL_0063:  br IL_0b76

	IL_0068:  br IL_0072

	IL_006d:  br IL_0072

	IL_0072:  ldarg 0

	IL_0076:  nop 
	IL_0077:  nop 
	IL_0078:  callvirt instance bool class [mscorlib]System.Type::get_IsPrimitive()
	IL_007d:  stloc 2

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldarg 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  callvirt instance bool class [mscorlib]System.Type::get_IsPrimitive()
	IL_008e:  stloc 3

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldloc 2

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  ldloc 3

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  and 
	IL_00a1:  stloc 2

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldloc 2

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldc.i4 0
	IL_00b2:  beq IL_00bc

	IL_00b7:  br IL_025f

	IL_00bc:  ldarg 1

	IL_00c0:  nop 
	IL_00c1:  nop 
	IL_00c2:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_00c7:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_00cc:  stloc 2

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  ldloc 2

	IL_00d6:  nop 
	IL_00d7:  nop 
	IL_00d8:  ldc.i4 0
	IL_00dd:  beq IL_00e7

	IL_00e2:  br IL_0186

	IL_00e7:  ldarg 1

	IL_00eb:  nop 
	IL_00ec:  nop 
	IL_00ed:  ldstr "op_Implicit"
	IL_00f2:  ldarg 0

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldarg 1

	IL_00fc:  nop 
	IL_00fd:  nop 
	IL_00fe:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0103:  stloc 4

	IL_0107:  nop 
	IL_0108:  nop 
	IL_0109:  ldloc 4

	IL_010d:  nop 
	IL_010e:  nop 
	IL_010f:  ldnull 
	IL_0110:  beq IL_012f

	IL_0115:  br IL_011a

	IL_011a:  ldloc 4

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0125:  br IL_0b76

	IL_012a:  br IL_0134

	IL_012f:  br IL_0134

	IL_0134:  ldarg 1

	IL_0138:  nop 
	IL_0139:  nop 
	IL_013a:  ldstr "op_Explicit"
	IL_013f:  ldarg 0

	IL_0143:  nop 
	IL_0144:  nop 
	IL_0145:  ldarg 1

	IL_0149:  nop 
	IL_014a:  nop 
	IL_014b:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0150:  stloc 4

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldloc 4

	IL_015a:  nop 
	IL_015b:  nop 
	IL_015c:  ldnull 
	IL_015d:  beq IL_017c

	IL_0162:  br IL_0167

	IL_0167:  ldloc 4

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0172:  br IL_0b76

	IL_0177:  br IL_0181

	IL_017c:  br IL_0181

	IL_0181:  br IL_018b

	IL_0186:  br IL_018b

	IL_018b:  ldarg 0

	IL_018f:  nop 
	IL_0190:  nop 
	IL_0191:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0196:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_019b:  stloc 2

	IL_019f:  nop 
	IL_01a0:  nop 
	IL_01a1:  ldloc 2

	IL_01a5:  nop 
	IL_01a6:  nop 
	IL_01a7:  ldc.i4 0
	IL_01ac:  beq IL_01b6

	IL_01b1:  br IL_0255

	IL_01b6:  ldarg 0

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  ldstr "op_Implicit"
	IL_01c1:  ldarg 0

	IL_01c5:  nop 
	IL_01c6:  nop 
	IL_01c7:  ldarg 1

	IL_01cb:  nop 
	IL_01cc:  nop 
	IL_01cd:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_01d2:  stloc 4

	IL_01d6:  nop 
	IL_01d7:  nop 
	IL_01d8:  ldloc 4

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldnull 
	IL_01df:  beq IL_01fe

	IL_01e4:  br IL_01e9

	IL_01e9:  ldloc 4

	IL_01ed:  nop 
	IL_01ee:  nop 
	IL_01ef:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_01f4:  br IL_0b76

	IL_01f9:  br IL_0203

	IL_01fe:  br IL_0203

	IL_0203:  ldarg 0

	IL_0207:  nop 
	IL_0208:  nop 
	IL_0209:  ldstr "op_Explicit"
	IL_020e:  ldarg 0

	IL_0212:  nop 
	IL_0213:  nop 
	IL_0214:  ldarg 1

	IL_0218:  nop 
	IL_0219:  nop 
	IL_021a:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_021f:  stloc 4

	IL_0223:  nop 
	IL_0224:  nop 
	IL_0225:  ldloc 4

	IL_0229:  nop 
	IL_022a:  nop 
	IL_022b:  ldnull 
	IL_022c:  beq IL_024b

	IL_0231:  br IL_0236

	IL_0236:  ldloc 4

	IL_023a:  nop 
	IL_023b:  nop 
	IL_023c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0241:  br IL_0b76

	IL_0246:  br IL_0250

	IL_024b:  br IL_0250

	IL_0250:  br IL_025a

	IL_0255:  br IL_025a

	IL_025a:  br IL_0264

	IL_025f:  br IL_0264

	IL_0264:  ldtoken [mscorlib]System.Object
	IL_0269:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_026e:  stloc 0

	IL_0272:  nop 
	IL_0273:  nop 
	IL_0274:  ldarg 1

	IL_0278:  nop 
	IL_0279:  nop 
	IL_027a:  ldloc 0

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0285:  stloc 2

	IL_0289:  nop 
	IL_028a:  nop 
	IL_028b:  ldloc 2

	IL_028f:  nop 
	IL_0290:  nop 
	IL_0291:  ldc.i4 1
	IL_0296:  beq IL_02a0

	IL_029b:  br IL_0300

	IL_02a0:  ldtoken [mscorlib]System.ValueType
	IL_02a5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02aa:  stloc 0

	IL_02ae:  nop 
	IL_02af:  nop 
	IL_02b0:  ldloc 0

	IL_02b4:  nop 
	IL_02b5:  nop 
	IL_02b6:  ldarg 0

	IL_02ba:  nop 
	IL_02bb:  nop 
	IL_02bc:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_02c1:  stloc 2

	IL_02c5:  nop 
	IL_02c6:  nop 
	IL_02c7:  ldloc 2

	IL_02cb:  nop 
	IL_02cc:  nop 
	IL_02cd:  ldc.i4 1
	IL_02d2:  beq IL_02dc

	IL_02d7:  br IL_02f1

	IL_02dc:  ldarg 0

	IL_02e0:  nop 
	IL_02e1:  nop 
	IL_02e2:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBox(class [mscorlib]System.Type)
	IL_02e7:  br IL_0b76

	IL_02ec:  br IL_02fb

	IL_02f1:  br IL_0b76

	IL_02f6:  br IL_02fb

	IL_02fb:  br IL_0305

	IL_0300:  br IL_0305

	IL_0305:  ldtoken [mscorlib]System.Object
	IL_030a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_030f:  stloc 0

	IL_0313:  nop 
	IL_0314:  nop 
	IL_0315:  ldarg 0

	IL_0319:  nop 
	IL_031a:  nop 
	IL_031b:  ldloc 0

	IL_031f:  nop 
	IL_0320:  nop 
	IL_0321:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0326:  stloc 2

	IL_032a:  nop 
	IL_032b:  nop 
	IL_032c:  ldloc 2

	IL_0330:  nop 
	IL_0331:  nop 
	IL_0332:  ldc.i4 1
	IL_0337:  beq IL_0341

	IL_033c:  br IL_039c

	IL_0341:  ldtoken [mscorlib]System.ValueType
	IL_0346:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_034b:  stloc 0

	IL_034f:  nop 
	IL_0350:  nop 
	IL_0351:  ldloc 0

	IL_0355:  nop 
	IL_0356:  nop 
	IL_0357:  ldarg 1

	IL_035b:  nop 
	IL_035c:  nop 
	IL_035d:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_0362:  stloc 2

	IL_0366:  nop 
	IL_0367:  nop 
	IL_0368:  ldloc 2

	IL_036c:  nop 
	IL_036d:  nop 
	IL_036e:  ldc.i4 1
	IL_0373:  beq IL_037d

	IL_0378:  br IL_0392

	IL_037d:  ldarg 1

	IL_0381:  nop 
	IL_0382:  nop 
	IL_0383:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitUnboxAny(class [mscorlib]System.Type)
	IL_0388:  br IL_0b76

	IL_038d:  br IL_0397

	IL_0392:  br IL_0397

	IL_0397:  br IL_03a1

	IL_039c:  br IL_03a1

	IL_03a1:  ldtoken [mscorlib]System.ValueType
	IL_03a6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03ab:  stloc 0

	IL_03af:  nop 
	IL_03b0:  nop 
	IL_03b1:  ldloc 0

	IL_03b5:  nop 
	IL_03b6:  nop 
	IL_03b7:  ldarg 1

	IL_03bb:  nop 
	IL_03bc:  nop 
	IL_03bd:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_03c2:  stloc 2

	IL_03c6:  nop 
	IL_03c7:  nop 
	IL_03c8:  ldloc 0

	IL_03cc:  nop 
	IL_03cd:  nop 
	IL_03ce:  ldarg 0

	IL_03d2:  nop 
	IL_03d3:  nop 
	IL_03d4:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_03d9:  stloc 3

	IL_03dd:  nop 
	IL_03de:  nop 
	IL_03df:  ldloc 2

	IL_03e3:  nop 
	IL_03e4:  nop 
	IL_03e5:  ldloc 3

	IL_03e9:  nop 
	IL_03ea:  nop 
	IL_03eb:  or 
	IL_03ec:  stloc 2

	IL_03f0:  nop 
	IL_03f1:  nop 
	IL_03f2:  ldloc 2

	IL_03f6:  nop 
	IL_03f7:  nop 
	IL_03f8:  ldc.i4 0
	IL_03fd:  beq IL_0407

	IL_0402:  br IL_048d

	IL_0407:  ldarg 1

	IL_040b:  nop 
	IL_040c:  nop 
	IL_040d:  ldarg 0

	IL_0411:  nop 
	IL_0412:  nop 
	IL_0413:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_0418:  stloc 2

	IL_041c:  nop 
	IL_041d:  nop 
	IL_041e:  ldloc 2

	IL_0422:  nop 
	IL_0423:  nop 
	IL_0424:  ldc.i4 1
	IL_0429:  beq IL_0433

	IL_042e:  br IL_043d

	IL_0433:  br IL_0b76

	IL_0438:  br IL_0442

	IL_043d:  br IL_0442

	IL_0442:  ldarg 0

	IL_0446:  nop 
	IL_0447:  nop 
	IL_0448:  ldarg 1

	IL_044c:  nop 
	IL_044d:  nop 
	IL_044e:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_0453:  stloc 2

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  ldloc 2

	IL_045d:  nop 
	IL_045e:  nop 
	IL_045f:  ldc.i4 1
	IL_0464:  beq IL_046e

	IL_0469:  br IL_0483

	IL_046e:  ldarg 1

	IL_0472:  nop 
	IL_0473:  nop 
	IL_0474:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCastclass(class [mscorlib]System.Type)
	IL_0479:  br IL_0b76

	IL_047e:  br IL_0488

	IL_0483:  br IL_0488

	IL_0488:  br IL_0492

	IL_048d:  br IL_0492

	IL_0492:  ldtoken [mscorlib]System.IntPtr
	IL_0497:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_049c:  stloc 0

	IL_04a0:  nop 
	IL_04a1:  nop 
	IL_04a2:  ldarg 0

	IL_04a6:  nop 
	IL_04a7:  nop 
	IL_04a8:  ldloc 0

	IL_04ac:  nop 
	IL_04ad:  nop 
	IL_04ae:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_04b3:  stloc 2

	IL_04b7:  nop 
	IL_04b8:  nop 
	IL_04b9:  ldloc 2

	IL_04bd:  nop 
	IL_04be:  nop 
	IL_04bf:  ldc.i4 1
	IL_04c4:  beq IL_04ce

	IL_04c9:  br IL_0509

	IL_04ce:  ldloc 0

	IL_04d2:  nop 
	IL_04d3:  nop 
	IL_04d4:  ldstr "ToInt64"
	IL_04d9:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_04de:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_04e3:  stloc 4

	IL_04e7:  nop 
	IL_04e8:  nop 
	IL_04e9:  ldloc 4

	IL_04ed:  nop 
	IL_04ee:  nop 
	IL_04ef:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCallvirt(class [mscorlib]System.Reflection.MethodInfo)
	IL_04f4:  ldtoken [mscorlib]System.Int64
	IL_04f9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04fe:  starg 0

	IL_0502:  nop 
	IL_0503:  nop 
	IL_0504:  br IL_050e

	IL_0509:  br IL_050e

	IL_050e:  ldtoken [mscorlib]System.String
	IL_0513:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0518:  stloc 0

	IL_051c:  nop 
	IL_051d:  nop 
	IL_051e:  ldarg 1

	IL_0522:  nop 
	IL_0523:  nop 
	IL_0524:  ldloc 0

	IL_0528:  nop 
	IL_0529:  nop 
	IL_052a:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_052f:  stloc 2

	IL_0533:  nop 
	IL_0534:  nop 
	IL_0535:  ldloc 2

	IL_0539:  nop 
	IL_053a:  nop 
	IL_053b:  ldc.i4 1
	IL_0540:  beq IL_054a

	IL_0545:  br IL_05ad

	IL_054a:  ldloc 5

	IL_054e:  nop 
	IL_054f:  nop 
	IL_0550:  ldc.i4 0
	IL_0555:  conv.u 
	IL_0556:  ldarg 0

	IL_055a:  nop 
	IL_055b:  nop 
	IL_055c:  stelem [mscorlib]System.Type
	IL_0561:  ldloc 1

	IL_0565:  nop 
	IL_0566:  nop 
	IL_0567:  ldstr "ToString"
	IL_056c:  ldloc 5

	IL_0570:  nop 
	IL_0571:  nop 
	IL_0572:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0577:  stloc 4

	IL_057b:  nop 
	IL_057c:  nop 
	IL_057d:  ldloc 4

	IL_0581:  nop 
	IL_0582:  nop 
	IL_0583:  ldnull 
	IL_0584:  beq IL_058e

	IL_0589:  br IL_0593

	IL_058e:  br IL_05a8

	IL_0593:  ldloc 4

	IL_0597:  nop 
	IL_0598:  nop 
	IL_0599:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_059e:  br IL_0b76

	IL_05a3:  br IL_05a8

	IL_05a8:  br IL_05b2

	IL_05ad:  br IL_05b2

	IL_05b2:  ldtoken [mscorlib]System.Char
	IL_05b7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05bc:  stloc 0

	IL_05c0:  nop 
	IL_05c1:  nop 
	IL_05c2:  ldarg 1

	IL_05c6:  nop 
	IL_05c7:  nop 
	IL_05c8:  ldloc 0

	IL_05cc:  nop 
	IL_05cd:  nop 
	IL_05ce:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_05d3:  stloc 2

	IL_05d7:  nop 
	IL_05d8:  nop 
	IL_05d9:  ldloc 2

	IL_05dd:  nop 
	IL_05de:  nop 
	IL_05df:  ldc.i4 1
	IL_05e4:  beq IL_05ee

	IL_05e9:  br IL_0651

	IL_05ee:  ldloc 5

	IL_05f2:  nop 
	IL_05f3:  nop 
	IL_05f4:  ldc.i4 0
	IL_05f9:  conv.u 
	IL_05fa:  ldarg 0

	IL_05fe:  nop 
	IL_05ff:  nop 
	IL_0600:  stelem [mscorlib]System.Type
	IL_0605:  ldloc 1

	IL_0609:  nop 
	IL_060a:  nop 
	IL_060b:  ldstr "ToChar"
	IL_0610:  ldloc 5

	IL_0614:  nop 
	IL_0615:  nop 
	IL_0616:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_061b:  stloc 4

	IL_061f:  nop 
	IL_0620:  nop 
	IL_0621:  ldloc 4

	IL_0625:  nop 
	IL_0626:  nop 
	IL_0627:  ldnull 
	IL_0628:  beq IL_0632

	IL_062d:  br IL_0637

	IL_0632:  br IL_064c

	IL_0637:  ldloc 4

	IL_063b:  nop 
	IL_063c:  nop 
	IL_063d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0642:  br IL_0b76

	IL_0647:  br IL_064c

	IL_064c:  br IL_0656

	IL_0651:  br IL_0656

	IL_0656:  ldtoken [mscorlib]System.Decimal
	IL_065b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0660:  stloc 0

	IL_0664:  nop 
	IL_0665:  nop 
	IL_0666:  ldarg 1

	IL_066a:  nop 
	IL_066b:  nop 
	IL_066c:  ldloc 0

	IL_0670:  nop 
	IL_0671:  nop 
	IL_0672:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0677:  stloc 2

	IL_067b:  nop 
	IL_067c:  nop 
	IL_067d:  ldloc 2

	IL_0681:  nop 
	IL_0682:  nop 
	IL_0683:  ldc.i4 1
	IL_0688:  beq IL_0692

	IL_068d:  br IL_06f5

	IL_0692:  ldloc 5

	IL_0696:  nop 
	IL_0697:  nop 
	IL_0698:  ldc.i4 0
	IL_069d:  conv.u 
	IL_069e:  ldarg 0

	IL_06a2:  nop 
	IL_06a3:  nop 
	IL_06a4:  stelem [mscorlib]System.Type
	IL_06a9:  ldloc 1

	IL_06ad:  nop 
	IL_06ae:  nop 
	IL_06af:  ldstr "ToDecimal"
	IL_06b4:  ldloc 5

	IL_06b8:  nop 
	IL_06b9:  nop 
	IL_06ba:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_06bf:  stloc 4

	IL_06c3:  nop 
	IL_06c4:  nop 
	IL_06c5:  ldloc 4

	IL_06c9:  nop 
	IL_06ca:  nop 
	IL_06cb:  ldnull 
	IL_06cc:  beq IL_06d6

	IL_06d1:  br IL_06db

	IL_06d6:  br IL_06f0

	IL_06db:  ldloc 4

	IL_06df:  nop 
	IL_06e0:  nop 
	IL_06e1:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_06e6:  br IL_0b76

	IL_06eb:  br IL_06f0

	IL_06f0:  br IL_06fa

	IL_06f5:  br IL_06fa

	IL_06fa:  ldtoken [mscorlib]System.Double
	IL_06ff:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0704:  stloc 0

	IL_0708:  nop 
	IL_0709:  nop 
	IL_070a:  ldarg 1

	IL_070e:  nop 
	IL_070f:  nop 
	IL_0710:  ldloc 0

	IL_0714:  nop 
	IL_0715:  nop 
	IL_0716:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_071b:  stloc 2

	IL_071f:  nop 
	IL_0720:  nop 
	IL_0721:  ldloc 2

	IL_0725:  nop 
	IL_0726:  nop 
	IL_0727:  ldc.i4 1
	IL_072c:  beq IL_0736

	IL_0731:  br IL_0799

	IL_0736:  ldloc 5

	IL_073a:  nop 
	IL_073b:  nop 
	IL_073c:  ldc.i4 0
	IL_0741:  conv.u 
	IL_0742:  ldarg 0

	IL_0746:  nop 
	IL_0747:  nop 
	IL_0748:  stelem [mscorlib]System.Type
	IL_074d:  ldloc 1

	IL_0751:  nop 
	IL_0752:  nop 
	IL_0753:  ldstr "ToDouble"
	IL_0758:  ldloc 5

	IL_075c:  nop 
	IL_075d:  nop 
	IL_075e:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0763:  stloc 4

	IL_0767:  nop 
	IL_0768:  nop 
	IL_0769:  ldloc 4

	IL_076d:  nop 
	IL_076e:  nop 
	IL_076f:  ldnull 
	IL_0770:  beq IL_077a

	IL_0775:  br IL_077f

	IL_077a:  br IL_0794

	IL_077f:  ldloc 4

	IL_0783:  nop 
	IL_0784:  nop 
	IL_0785:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_078a:  br IL_0b76

	IL_078f:  br IL_0794

	IL_0794:  br IL_079e

	IL_0799:  br IL_079e

	IL_079e:  ldtoken [mscorlib]System.Single
	IL_07a3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_07a8:  stloc 0

	IL_07ac:  nop 
	IL_07ad:  nop 
	IL_07ae:  ldarg 1

	IL_07b2:  nop 
	IL_07b3:  nop 
	IL_07b4:  ldloc 0

	IL_07b8:  nop 
	IL_07b9:  nop 
	IL_07ba:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_07bf:  stloc 2

	IL_07c3:  nop 
	IL_07c4:  nop 
	IL_07c5:  ldloc 2

	IL_07c9:  nop 
	IL_07ca:  nop 
	IL_07cb:  ldc.i4 1
	IL_07d0:  beq IL_07da

	IL_07d5:  br IL_083d

	IL_07da:  ldloc 5

	IL_07de:  nop 
	IL_07df:  nop 
	IL_07e0:  ldc.i4 0
	IL_07e5:  conv.u 
	IL_07e6:  ldarg 0

	IL_07ea:  nop 
	IL_07eb:  nop 
	IL_07ec:  stelem [mscorlib]System.Type
	IL_07f1:  ldloc 1

	IL_07f5:  nop 
	IL_07f6:  nop 
	IL_07f7:  ldstr "ToSingle"
	IL_07fc:  ldloc 5

	IL_0800:  nop 
	IL_0801:  nop 
	IL_0802:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0807:  stloc 4

	IL_080b:  nop 
	IL_080c:  nop 
	IL_080d:  ldloc 4

	IL_0811:  nop 
	IL_0812:  nop 
	IL_0813:  ldnull 
	IL_0814:  beq IL_081e

	IL_0819:  br IL_0823

	IL_081e:  br IL_0838

	IL_0823:  ldloc 4

	IL_0827:  nop 
	IL_0828:  nop 
	IL_0829:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_082e:  br IL_0b76

	IL_0833:  br IL_0838

	IL_0838:  br IL_0842

	IL_083d:  br IL_0842

	IL_0842:  ldtoken [mscorlib]System.Int64
	IL_0847:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_084c:  stloc 0

	IL_0850:  nop 
	IL_0851:  nop 
	IL_0852:  ldarg 1

	IL_0856:  nop 
	IL_0857:  nop 
	IL_0858:  ldloc 0

	IL_085c:  nop 
	IL_085d:  nop 
	IL_085e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0863:  stloc 2

	IL_0867:  nop 
	IL_0868:  nop 
	IL_0869:  ldloc 2

	IL_086d:  nop 
	IL_086e:  nop 
	IL_086f:  ldc.i4 1
	IL_0874:  beq IL_087e

	IL_0879:  br IL_08e1

	IL_087e:  ldloc 5

	IL_0882:  nop 
	IL_0883:  nop 
	IL_0884:  ldc.i4 0
	IL_0889:  conv.u 
	IL_088a:  ldarg 0

	IL_088e:  nop 
	IL_088f:  nop 
	IL_0890:  stelem [mscorlib]System.Type
	IL_0895:  ldloc 1

	IL_0899:  nop 
	IL_089a:  nop 
	IL_089b:  ldstr "ToInt64"
	IL_08a0:  ldloc 5

	IL_08a4:  nop 
	IL_08a5:  nop 
	IL_08a6:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_08ab:  stloc 4

	IL_08af:  nop 
	IL_08b0:  nop 
	IL_08b1:  ldloc 4

	IL_08b5:  nop 
	IL_08b6:  nop 
	IL_08b7:  ldnull 
	IL_08b8:  beq IL_08c2

	IL_08bd:  br IL_08c7

	IL_08c2:  br IL_08dc

	IL_08c7:  ldloc 4

	IL_08cb:  nop 
	IL_08cc:  nop 
	IL_08cd:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_08d2:  br IL_0b76

	IL_08d7:  br IL_08dc

	IL_08dc:  br IL_08e6

	IL_08e1:  br IL_08e6

	IL_08e6:  ldtoken [mscorlib]System.Int32
	IL_08eb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_08f0:  stloc 0

	IL_08f4:  nop 
	IL_08f5:  nop 
	IL_08f6:  ldarg 1

	IL_08fa:  nop 
	IL_08fb:  nop 
	IL_08fc:  ldloc 0

	IL_0900:  nop 
	IL_0901:  nop 
	IL_0902:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0907:  stloc 2

	IL_090b:  nop 
	IL_090c:  nop 
	IL_090d:  ldloc 2

	IL_0911:  nop 
	IL_0912:  nop 
	IL_0913:  ldc.i4 1
	IL_0918:  beq IL_0922

	IL_091d:  br IL_0985

	IL_0922:  ldloc 5

	IL_0926:  nop 
	IL_0927:  nop 
	IL_0928:  ldc.i4 0
	IL_092d:  conv.u 
	IL_092e:  ldarg 0

	IL_0932:  nop 
	IL_0933:  nop 
	IL_0934:  stelem [mscorlib]System.Type
	IL_0939:  ldloc 1

	IL_093d:  nop 
	IL_093e:  nop 
	IL_093f:  ldstr "ToInt32"
	IL_0944:  ldloc 5

	IL_0948:  nop 
	IL_0949:  nop 
	IL_094a:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_094f:  stloc 4

	IL_0953:  nop 
	IL_0954:  nop 
	IL_0955:  ldloc 4

	IL_0959:  nop 
	IL_095a:  nop 
	IL_095b:  ldnull 
	IL_095c:  beq IL_0966

	IL_0961:  br IL_096b

	IL_0966:  br IL_0980

	IL_096b:  ldloc 4

	IL_096f:  nop 
	IL_0970:  nop 
	IL_0971:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0976:  br IL_0b76

	IL_097b:  br IL_0980

	IL_0980:  br IL_098a

	IL_0985:  br IL_098a

	IL_098a:  ldtoken [mscorlib]System.Int16
	IL_098f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0994:  stloc 0

	IL_0998:  nop 
	IL_0999:  nop 
	IL_099a:  ldarg 1

	IL_099e:  nop 
	IL_099f:  nop 
	IL_09a0:  ldloc 0

	IL_09a4:  nop 
	IL_09a5:  nop 
	IL_09a6:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_09ab:  stloc 2

	IL_09af:  nop 
	IL_09b0:  nop 
	IL_09b1:  ldloc 2

	IL_09b5:  nop 
	IL_09b6:  nop 
	IL_09b7:  ldc.i4 1
	IL_09bc:  beq IL_09c6

	IL_09c1:  br IL_0a29

	IL_09c6:  ldloc 5

	IL_09ca:  nop 
	IL_09cb:  nop 
	IL_09cc:  ldc.i4 0
	IL_09d1:  conv.u 
	IL_09d2:  ldarg 0

	IL_09d6:  nop 
	IL_09d7:  nop 
	IL_09d8:  stelem [mscorlib]System.Type
	IL_09dd:  ldloc 1

	IL_09e1:  nop 
	IL_09e2:  nop 
	IL_09e3:  ldstr "ToInt16"
	IL_09e8:  ldloc 5

	IL_09ec:  nop 
	IL_09ed:  nop 
	IL_09ee:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_09f3:  stloc 4

	IL_09f7:  nop 
	IL_09f8:  nop 
	IL_09f9:  ldloc 4

	IL_09fd:  nop 
	IL_09fe:  nop 
	IL_09ff:  ldnull 
	IL_0a00:  beq IL_0a0a

	IL_0a05:  br IL_0a0f

	IL_0a0a:  br IL_0a24

	IL_0a0f:  ldloc 4

	IL_0a13:  nop 
	IL_0a14:  nop 
	IL_0a15:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0a1a:  br IL_0b76

	IL_0a1f:  br IL_0a24

	IL_0a24:  br IL_0a2e

	IL_0a29:  br IL_0a2e

	IL_0a2e:  ldtoken [mscorlib]System.SByte
	IL_0a33:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a38:  stloc 0

	IL_0a3c:  nop 
	IL_0a3d:  nop 
	IL_0a3e:  ldarg 1

	IL_0a42:  nop 
	IL_0a43:  nop 
	IL_0a44:  ldloc 0

	IL_0a48:  nop 
	IL_0a49:  nop 
	IL_0a4a:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0a4f:  stloc 2

	IL_0a53:  nop 
	IL_0a54:  nop 
	IL_0a55:  ldloc 2

	IL_0a59:  nop 
	IL_0a5a:  nop 
	IL_0a5b:  ldc.i4 1
	IL_0a60:  beq IL_0a6a

	IL_0a65:  br IL_0acd

	IL_0a6a:  ldloc 5

	IL_0a6e:  nop 
	IL_0a6f:  nop 
	IL_0a70:  ldc.i4 0
	IL_0a75:  conv.u 
	IL_0a76:  ldarg 0

	IL_0a7a:  nop 
	IL_0a7b:  nop 
	IL_0a7c:  stelem [mscorlib]System.Type
	IL_0a81:  ldloc 1

	IL_0a85:  nop 
	IL_0a86:  nop 
	IL_0a87:  ldstr "ToSByte"
	IL_0a8c:  ldloc 5

	IL_0a90:  nop 
	IL_0a91:  nop 
	IL_0a92:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0a97:  stloc 4

	IL_0a9b:  nop 
	IL_0a9c:  nop 
	IL_0a9d:  ldloc 4

	IL_0aa1:  nop 
	IL_0aa2:  nop 
	IL_0aa3:  ldnull 
	IL_0aa4:  beq IL_0aae

	IL_0aa9:  br IL_0ab3

	IL_0aae:  br IL_0ac8

	IL_0ab3:  ldloc 4

	IL_0ab7:  nop 
	IL_0ab8:  nop 
	IL_0ab9:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0abe:  br IL_0b76

	IL_0ac3:  br IL_0ac8

	IL_0ac8:  br IL_0ad2

	IL_0acd:  br IL_0ad2

	IL_0ad2:  ldtoken [mscorlib]System.Boolean
	IL_0ad7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0adc:  stloc 0

	IL_0ae0:  nop 
	IL_0ae1:  nop 
	IL_0ae2:  ldarg 1

	IL_0ae6:  nop 
	IL_0ae7:  nop 
	IL_0ae8:  ldloc 0

	IL_0aec:  nop 
	IL_0aed:  nop 
	IL_0aee:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0af3:  stloc 2

	IL_0af7:  nop 
	IL_0af8:  nop 
	IL_0af9:  ldloc 2

	IL_0afd:  nop 
	IL_0afe:  nop 
	IL_0aff:  ldc.i4 1
	IL_0b04:  beq IL_0b0e

	IL_0b09:  br IL_0b71

	IL_0b0e:  ldloc 5

	IL_0b12:  nop 
	IL_0b13:  nop 
	IL_0b14:  ldc.i4 0
	IL_0b19:  conv.u 
	IL_0b1a:  ldarg 0

	IL_0b1e:  nop 
	IL_0b1f:  nop 
	IL_0b20:  stelem [mscorlib]System.Type
	IL_0b25:  ldloc 1

	IL_0b29:  nop 
	IL_0b2a:  nop 
	IL_0b2b:  ldstr "ToBoolean"
	IL_0b30:  ldloc 5

	IL_0b34:  nop 
	IL_0b35:  nop 
	IL_0b36:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0b3b:  stloc 4

	IL_0b3f:  nop 
	IL_0b40:  nop 
	IL_0b41:  ldloc 4

	IL_0b45:  nop 
	IL_0b46:  nop 
	IL_0b47:  ldnull 
	IL_0b48:  beq IL_0b52

	IL_0b4d:  br IL_0b57

	IL_0b52:  br IL_0b6c

	IL_0b57:  ldloc 4

	IL_0b5b:  nop 
	IL_0b5c:  nop 
	IL_0b5d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0b62:  br IL_0b76

	IL_0b67:  br IL_0b6c

	IL_0b6c:  br IL_0b76

	IL_0b71:  br IL_0b76

	IL_0b76:  ret 
    } // end of method Helpers::EmitConv

    // method line 64
    .method public static 
           default void EmitMetCall (class [mscorlib]System.Reflection.MethodInfo met, bool stat)  cil managed 
    {
        // Method begins at RVA 0x713c
	// Code size 335 (0x14f)
	.maxstack 15
	.locals init (
		bool	V_0,
		class [mscorlib]System.Type	V_1,
		class [mscorlib]System.Type	V_2,
		class [mscorlib]System.Type	V_3)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_0025

	IL_0015:  ldarg 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0020:  br IL_00d4

	IL_0025:  ldtoken [mscorlib]System.ValueType
	IL_002a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_002f:  stloc 1

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  ldloc 1

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type05
	IL_0040:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_0045:  stloc 0

	IL_0049:  nop 
	IL_004a:  nop 
	IL_004b:  ldloc 0

	IL_004f:  nop 
	IL_0050:  nop 
	IL_0051:  ldc.i4 1
	IL_0056:  beq IL_0060

	IL_005b:  br IL_0095

	IL_0060:  ldarg 0

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsVirtual()
	IL_006b:  stloc 0

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 0

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldc.i4 1
	IL_007c:  beq IL_0086

	IL_0081:  br IL_008b

	IL_0086:  br IL_0090

	IL_008b:  br IL_0090

	IL_0090:  br IL_009a

	IL_0095:  br IL_009a

	IL_009a:  ldloc 0

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  ldc.i4 0
	IL_00a5:  beq IL_00af

	IL_00aa:  br IL_00bf

	IL_00af:  ldarg 0

	IL_00b3:  nop 
	IL_00b4:  nop 
	IL_00b5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCallvirt(class [mscorlib]System.Reflection.MethodInfo)
	IL_00ba:  br IL_00cf

	IL_00bf:  ldarg 0

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_00ca:  br IL_00cf

	IL_00cf:  br IL_00d4

	IL_00d4:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::PopFlg
	IL_00d9:  ldc.i4 1
	IL_00de:  beq IL_00e8

	IL_00e3:  br IL_0149

	IL_00e8:  ldarg 0

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_00f3:  stloc 2

	IL_00f7:  nop 
	IL_00f8:  nop 
	IL_00f9:  ldtoken [mscorlib]System.Void
	IL_00fe:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0103:  stloc 3

	IL_0107:  nop 
	IL_0108:  nop 
	IL_0109:  ldloc 2

	IL_010d:  nop 
	IL_010e:  nop 
	IL_010f:  ldloc 3

	IL_0113:  nop 
	IL_0114:  nop 
	IL_0115:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_011a:  stloc 0

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  ldloc 0

	IL_0124:  nop 
	IL_0125:  nop 
	IL_0126:  ldc.i4 1
	IL_012b:  beq IL_0135

	IL_0130:  br IL_013a

	IL_0135:  br IL_0144

	IL_013a:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitPop()
	IL_013f:  br IL_0144

	IL_0144:  br IL_014e

	IL_0149:  br IL_014e

	IL_014e:  ret 
    } // end of method Helpers::EmitMetCall

    // method line 65
    .method public static 
           default void EmitPtrLd (class [mscorlib]System.Reflection.MethodInfo met, bool stat)  cil managed 
    {
        // Method begins at RVA 0x7298
	// Code size 54 (0x36)
	.maxstack 4
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_0025

	IL_0015:  ldarg 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdftn(class [mscorlib]System.Reflection.MethodInfo)
	IL_0020:  br IL_0035

	IL_0025:  ldarg 0

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdvirtftn(class [mscorlib]System.Reflection.MethodInfo)
	IL_0030:  br IL_0035

	IL_0035:  ret 
    } // end of method Helpers::EmitPtrLd

    // method line 66
    .method public static 
           default void EmitFldLd (class [mscorlib]System.Reflection.FieldInfo fld, bool stat)  cil managed 
    {
        // Method begins at RVA 0x72dc
	// Code size 259 (0x103)
	.maxstack 16
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1)
	IL_0000:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0005:  ldc.i4 0
	IL_000a:  beq IL_0014

	IL_000f:  br IL_004e

	IL_0014:  ldarg 1

	IL_0018:  nop 
	IL_0019:  nop 
	IL_001a:  ldc.i4 1
	IL_001f:  beq IL_0029

	IL_0024:  br IL_0039

	IL_0029:  ldarg 0

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdsfld(class [mscorlib]System.Reflection.FieldInfo)
	IL_0034:  br IL_0049

	IL_0039:  ldarg 0

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdfld(class [mscorlib]System.Reflection.FieldInfo)
	IL_0044:  br IL_0049

	IL_0049:  br IL_0102

	IL_004e:  ldtoken [mscorlib]System.ValueType
	IL_0053:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0058:  stloc 0

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldloc 0

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0069:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_006e:  stloc 1

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldloc 1

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  ldc.i4 0
	IL_007f:  beq IL_0089

	IL_0084:  br IL_00c3

	IL_0089:  ldarg 1

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldc.i4 1
	IL_0094:  beq IL_009e

	IL_0099:  br IL_00ae

	IL_009e:  ldarg 0

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdsfld(class [mscorlib]System.Reflection.FieldInfo)
	IL_00a9:  br IL_00be

	IL_00ae:  ldarg 0

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdfld(class [mscorlib]System.Reflection.FieldInfo)
	IL_00b9:  br IL_00be

	IL_00be:  br IL_00fd

	IL_00c3:  ldarg 1

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldc.i4 1
	IL_00ce:  beq IL_00d8

	IL_00d3:  br IL_00e8

	IL_00d8:  ldarg 0

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdsflda(class [mscorlib]System.Reflection.FieldInfo)
	IL_00e3:  br IL_00f8

	IL_00e8:  ldarg 0

	IL_00ec:  nop 
	IL_00ed:  nop 
	IL_00ee:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdflda(class [mscorlib]System.Reflection.FieldInfo)
	IL_00f3:  br IL_00f8

	IL_00f8:  br IL_00fd

	IL_00fd:  br IL_0102

	IL_0102:  ret 
    } // end of method Helpers::EmitFldLd

    // method line 67
    .method public static 
           default void EmitFldSt (class [mscorlib]System.Reflection.FieldInfo fld, bool stat)  cil managed 
    {
        // Method begins at RVA 0x73ec
	// Code size 54 (0x36)
	.maxstack 4
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldc.i4 1
	IL_000b:  beq IL_0015

	IL_0010:  br IL_0025

	IL_0015:  ldarg 0

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStsfld(class [mscorlib]System.Reflection.FieldInfo)
	IL_0020:  br IL_0035

	IL_0025:  ldarg 0

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStfld(class [mscorlib]System.Reflection.FieldInfo)
	IL_0030:  br IL_0035

	IL_0035:  ret 
    } // end of method Helpers::EmitFldSt

    // method line 68
    .method public static 
           default class [mscorlib]System.Reflection.ConstructorInfo GetLocCtor (class [mscorlib]System.Type t, class [mscorlib]System.Type[] typs)  cil managed 
    {
        // Method begins at RVA 0x7430
	// Code size 117 (0x75)
	.maxstack 6
	.locals init (
		class [mscorlib]System.Reflection.ConstructorInfo	V_0,
		class dylan.NET.Tokenizer.CodeGen.CtorItem	V_1,
		bool	V_2)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_000b:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldloc 2

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldc.i4 1
	IL_0021:  beq IL_002b

	IL_0026:  br IL_0052

	IL_002b:  ldarg 1

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  call class dylan.NET.Tokenizer.CodeGen.CtorItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindCtor(class [mscorlib]System.Type[])
	IL_0036:  stloc 1

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  ldloc 1

	IL_0040:  nop 
	IL_0041:  nop 
	IL_0042:  ldfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder dylan.NET.Tokenizer.CodeGen.CtorItem::CtorBldr
	IL_0047:  stloc 0

	IL_004b:  nop 
	IL_004c:  nop 
	IL_004d:  br IL_006e

	IL_0052:  ldarg 0

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldarg 1

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  call class [mscorlib]System.Reflection.ConstructorInfo class [dnr]dylan.NET.Reflection.Loader::LoadCtor(class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_0063:  stloc 0

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  br IL_006e

	IL_006e:  ldloc 0

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ret 
    } // end of method Helpers::GetLocCtor

    // method line 69
    .method public static 
           default class [mscorlib]System.Reflection.FieldInfo GetLocFld (string nam)  cil managed 
    {
        // Method begins at RVA 0x74b4
	// Code size 97 (0x61)
	.maxstack 6
	.locals init (
		class [mscorlib]System.Reflection.FieldInfo	V_0,
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_1)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  call class dylan.NET.Tokenizer.CodeGen.FieldItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindFld(string)
	IL_0012:  stloc 1

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  ldloc 1

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  ldnull 
	IL_001f:  beq IL_003f

	IL_0024:  br IL_0029

	IL_0029:  ldloc 1

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  ldfld class [mscorlib]System.Reflection.Emit.FieldBuilder dylan.NET.Tokenizer.CodeGen.FieldItem::FieldBldr
	IL_0034:  stloc 0

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  br IL_005a

	IL_003f:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_0044:  ldarg 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_004f:  stloc 0

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  br IL_005a

	IL_005a:  ldloc 0

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ret 
    } // end of method Helpers::GetLocFld

    // method line 70
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo GetLocMet (string nam, class [mscorlib]System.Type[] typs)  cil managed 
    {
        // Method begins at RVA 0x7524
	// Code size 109 (0x6d)
	.maxstack 7
	.locals init (
		class [mscorlib]System.Reflection.MethodInfo	V_0,
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_1)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  ldarg 1

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  call class dylan.NET.Tokenizer.CodeGen.MethodItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindMet(string, class [mscorlib]System.Type[])
	IL_0018:  stloc 1

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  ldloc 1

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldnull 
	IL_0025:  beq IL_0045

	IL_002a:  br IL_002f

	IL_002f:  ldloc 1

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  ldfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Tokenizer.CodeGen.MethodItem::MethodBldr
	IL_003a:  stloc 0

	IL_003e:  nop 
	IL_003f:  nop 
	IL_0040:  br IL_0066

	IL_0045:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_004a:  ldarg 0

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldarg 1

	IL_0054:  nop 
	IL_0055:  nop 
	IL_0056:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadMethod(class [mscorlib]System.Type, string, class [mscorlib]System.Type[])
	IL_005b:  stloc 0

	IL_005f:  nop 
	IL_0060:  nop 
	IL_0061:  br IL_0066

	IL_0066:  ldloc 0

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ret 
    } // end of method Helpers::GetLocMet

    // method line 71
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo GetLocMetNoParams (string nam)  cil managed 
    {
        // Method begins at RVA 0x75a0
	// Code size 75 (0x4b)
	.maxstack 4
	.locals init (
		class [mscorlib]System.Reflection.MethodInfo	V_0,
		class dylan.NET.Tokenizer.CodeGen.MethodItem	V_1)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldarg 0

	IL_000b:  nop 
	IL_000c:  nop 
	IL_000d:  call class dylan.NET.Tokenizer.CodeGen.MethodItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindMetNoParams(string)
	IL_0012:  stloc 1

	IL_0016:  nop 
	IL_0017:  nop 
	IL_0018:  ldloc 1

	IL_001c:  nop 
	IL_001d:  nop 
	IL_001e:  ldnull 
	IL_001f:  beq IL_003f

	IL_0024:  br IL_0029

	IL_0029:  ldloc 1

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  ldfld class [mscorlib]System.Reflection.Emit.MethodBuilder dylan.NET.Tokenizer.CodeGen.MethodItem::MethodBldr
	IL_0034:  stloc 0

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  br IL_0044

	IL_003f:  br IL_0044

	IL_0044:  ldloc 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ret 
    } // end of method Helpers::GetLocMetNoParams

    // method line 72
    .method public static 
           default valuetype [mscorlib]System.Reflection.Emit.Label GetLbl (string nam)  cil managed 
    {
        // Method begins at RVA 0x75f8
	// Code size 68 (0x44)
	.maxstack 4
	.locals init (
		valuetype [mscorlib]System.Reflection.Emit.Label	V_0,
		class dylan.NET.Tokenizer.CodeGen.LabelItem	V_1)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  call class dylan.NET.Tokenizer.CodeGen.LabelItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindLbl(string)
	IL_000b:  stloc 1

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldloc 1

	IL_0015:  nop 
	IL_0016:  nop 
	IL_0017:  ldnull 
	IL_0018:  beq IL_0038

	IL_001d:  br IL_0022

	IL_0022:  ldloc 1

	IL_0026:  nop 
	IL_0027:  nop 
	IL_0028:  ldfld valuetype [mscorlib]System.Reflection.Emit.Label dylan.NET.Tokenizer.CodeGen.LabelItem::Lbl
	IL_002d:  stloc 0

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  br IL_003d

	IL_0038:  br IL_003d

	IL_003d:  ldloc 0

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ret 
    } // end of method Helpers::GetLbl

    // method line 73
    .method public static 
           default string StripDelMtdName (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token t)  cil managed 
    {
        // Method begins at RVA 0x7648
	// Code size 243 (0xf3)
	.maxstack 7
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1,
		string	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_5)
	IL_0000:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 0

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0021:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0026:  stloc 1

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldstr ""
	IL_0031:  stloc 2

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldloc 1

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldc.i4 1
	IL_0042:  beq IL_004c

	IL_0047:  br IL_006e

	IL_004c:  ldarg 0

	IL_0050:  nop 
	IL_0051:  nop 
	IL_0052:  stloc 3

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldloc 3

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0063:  stloc 2

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  br IL_0073

	IL_006e:  br IL_0073

	IL_0073:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_0078:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_007d:  stloc 0

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldloc 0

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldarg 0

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0094:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0099:  stloc 1

	IL_009d:  nop 
	IL_009e:  nop 
	IL_009f:  ldloc 1

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldc.i4 1
	IL_00aa:  beq IL_00b4

	IL_00af:  br IL_00e7

	IL_00b4:  ldarg 0

	IL_00b8:  nop 
	IL_00b9:  nop 
	IL_00ba:  stloc 4

	IL_00be:  nop 
	IL_00bf:  nop 
	IL_00c0:  ldloc 4

	IL_00c4:  nop 
	IL_00c5:  nop 
	IL_00c6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_00cb:  stloc 5

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  ldloc 5

	IL_00d5:  nop 
	IL_00d6:  nop 
	IL_00d7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00dc:  stloc 2

	IL_00e0:  nop 
	IL_00e1:  nop 
	IL_00e2:  br IL_00ec

	IL_00e7:  br IL_00ec

	IL_00ec:  ldloc 2

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ret 
    } // end of method Helpers::StripDelMtdName

    // method line 74
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token SetPopFlg (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token t)  cil managed 
    {
        // Method begins at RVA 0x7748
	// Code size 459 (0x1cb)
	.maxstack 18
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_1,
		class [mscorlib]System.Type	V_2,
		bool	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_6)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  stloc 0

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldnull 
	IL_000d:  stloc 1

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_0018:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_001d:  stloc 2

	IL_0021:  nop 
	IL_0022:  nop 
	IL_0023:  ldloc 2

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldloc 0

	IL_002d:  nop 
	IL_002e:  nop 
	IL_002f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0034:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0039:  stloc 3

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldloc 3

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldc.i4 1
	IL_004a:  beq IL_0054

	IL_004f:  br IL_00c1

	IL_0054:  ldloc 0

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  stloc 4

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  ldloc 4

	IL_0064:  nop 
	IL_0065:  nop 
	IL_0066:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_006b:  stloc 5

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 4

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  stloc 1

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  ldloc 5

	IL_0081:  nop 
	IL_0082:  nop 
	IL_0083:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_0088:  ldc.i4 0
	IL_008d:  beq IL_0097

	IL_0092:  br IL_00a1

	IL_0097:  br IL_015c

	IL_009c:  br IL_00bc

	IL_00a1:  ldloc 5

	IL_00a5:  nop 
	IL_00a6:  nop 
	IL_00a7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_00ac:  stloc 0

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  br IL_0013

	IL_00b7:  br IL_00bc

	IL_00bc:  br IL_00c6

	IL_00c1:  br IL_00c6

	IL_00c6:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_00cb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00d0:  stloc 2

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldloc 2

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldloc 0

	IL_00e0:  nop 
	IL_00e1:  nop 
	IL_00e2:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00e7:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00ec:  stloc 3

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ldloc 3

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  ldc.i4 1
	IL_00fd:  beq IL_0107

	IL_0102:  br IL_0157

	IL_0107:  ldloc 0

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  stloc 6

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  ldloc 6

	IL_0117:  nop 
	IL_0118:  nop 
	IL_0119:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_011e:  ldc.i4 0
	IL_0123:  beq IL_012d

	IL_0128:  br IL_0137

	IL_012d:  br IL_015c

	IL_0132:  br IL_0152

	IL_0137:  ldloc 6

	IL_013b:  nop 
	IL_013c:  nop 
	IL_013d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_0142:  stloc 0

	IL_0146:  nop 
	IL_0147:  nop 
	IL_0148:  br IL_0013

	IL_014d:  br IL_0152

	IL_0152:  br IL_015c

	IL_0157:  br IL_015c

	IL_015c:  ldloc 1

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldnull 
	IL_0163:  beq IL_01a3

	IL_0168:  br IL_016d

	IL_016d:  ldloc 1

	IL_0171:  nop 
	IL_0172:  nop 
	IL_0173:  ldc.i4 1
	IL_0178:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_017d:  ldloc 1

	IL_0181:  nop 
	IL_0182:  nop 
	IL_0183:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0188:  stloc 5

	IL_018c:  nop 
	IL_018d:  nop 
	IL_018e:  ldloc 5

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  ldc.i4 0
	IL_0199:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_019e:  br IL_01a8

	IL_01a3:  br IL_01a8

	IL_01a8:  ldloc 1

	IL_01ac:  nop 
	IL_01ad:  nop 
	IL_01ae:  ldnull 
	IL_01af:  beq IL_01c4

	IL_01b4:  br IL_01b9

	IL_01b9:  ldarg 0

	IL_01bd:  nop 
	IL_01be:  nop 
	IL_01bf:  br IL_01ca

	IL_01c4:  ldnull 
	IL_01c5:  br IL_01ca

	IL_01ca:  ret 
    } // end of method Helpers::SetPopFlg

    // method line 75
    .method public static 
           default bool CheckIfArrLen (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ind)  cil managed 
    {
        // Method begins at RVA 0x7920
	// Code size 228 (0xe4)
	.maxstack 9
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		class [mscorlib]System.Type	V_1,
		bool	V_2,
		bool	V_3,
		int32	V_4)
	IL_0000:  ldarg 0

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 1
	IL_0012:  beq IL_001c

	IL_0017:  br IL_00d8

	IL_001c:  ldarg 0

	IL_0020:  nop 
	IL_0021:  nop 
	IL_0022:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
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
	IL_0064:  ldloc 2

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldc.i4 1
	IL_006f:  beq IL_0079

	IL_0074:  br IL_00ce

	IL_0079:  ldloc 0

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0084:  ldstr "l"
	IL_0089:  call int32 string::Compare(string, string)
	IL_008e:  stloc 4

	IL_0092:  nop 
	IL_0093:  nop 
	IL_0094:  ldloc 4

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  ldc.i4 0
	IL_009f:  beq IL_00b9

	IL_00a4:  br IL_00a9

	IL_00a9:  ldc.i4 0
	IL_00ae:  stloc 3

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  br IL_00c9

	IL_00b9:  ldc.i4 1
	IL_00be:  stloc 3

	IL_00c2:  nop 
	IL_00c3:  nop 
	IL_00c4:  br IL_00c9

	IL_00c9:  br IL_00d3

	IL_00ce:  br IL_00d3

	IL_00d3:  br IL_00dd

	IL_00d8:  br IL_00dd

	IL_00dd:  ldloc 3

	IL_00e1:  nop 
	IL_00e2:  nop 
	IL_00e3:  ret 
    } // end of method Helpers::CheckIfArrLen

  } // end of class dylan.NET.Tokenizer.CodeGen.Helpers
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi OpStack
  	extends [mscorlib]System.Object
  {
    .field  public  class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr Stack

    // method line 76
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7a10
	// Code size 18 (0x12)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_000c:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0011:  ret 
    } // end of method OpStack::.ctor

    // method line 77
    .method public 
           instance default void PushOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token optok)  cil managed 
    {
        // Method begins at RVA 0x7a30
	// Code size 18 (0x12)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0006:  ldarg 1

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0011:  ret 
    } // end of method OpStack::PushOp

    // method line 78
    .method public 
           instance default void PopOp ()  cil managed 
    {
        // Method begins at RVA 0x7a50
	// Code size 81 (0x51)
	.maxstack 4
	.locals init (
		int32	V_0)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 0
	IL_0012:  beq IL_001c

	IL_0017:  br IL_0021

	IL_001c:  br IL_0050

	IL_0021:  ldarg.0 
	IL_0022:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0027:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_002c:  ldlen 
	IL_002d:  conv.i4 
	IL_002e:  ldc.i4 1
	IL_0033:  sub 
	IL_0034:  stloc 0

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldarg.0 
	IL_003b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0040:  ldloc 0

	IL_0044:  nop 
	IL_0045:  nop 
	IL_0046:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_004b:  br IL_0050

	IL_0050:  ret 
    } // end of method OpStack::PopOp

    // method line 79
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token TopOp ()  cil managed 
    {
        // Method begins at RVA 0x7ab0
	// Code size 100 (0x64)
	.maxstack 5
	.locals init (
		int32	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_1)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ldc.i4 0
	IL_0012:  beq IL_001c

	IL_0017:  br IL_0022

	IL_001c:  ldnull 
	IL_001d:  br IL_0063

	IL_0022:  ldarg.0 
	IL_0023:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0028:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_002d:  ldlen 
	IL_002e:  conv.i4 
	IL_002f:  ldc.i4 1
	IL_0034:  sub 
	IL_0035:  stloc 0

	IL_0039:  nop 
	IL_003a:  nop 
	IL_003b:  ldarg.0 
	IL_003c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0041:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0046:  ldloc 0

	IL_004a:  nop 
	IL_004b:  nop 
	IL_004c:  conv.u 
	IL_004d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0052:  stloc 1

	IL_0056:  nop 
	IL_0057:  nop 
	IL_0058:  ldloc 1

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  br IL_0063

	IL_0063:  ret 
    } // end of method OpStack::TopOp

    // method line 80
    .method public 
           instance default int32 getLength ()  cil managed 
    {
        // Method begins at RVA 0x7b20
	// Code size 14 (0xe)
	.maxstack 1
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  ret 
    } // end of method OpStack::getLength

  } // end of class dylan.NET.Tokenizer.CodeGen.OpStack
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi beforefieldinit Evaluator
  	extends [mscorlib]System.Object
  {
    .field  public  class dylan.NET.Tokenizer.CodeGen.OpStack Stack
    .field  public  class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token InstToken

    // method line 81
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7b3c
	// Code size 25 (0x19)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldnull 
	IL_0008:  stfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_000d:  ldarg.0 
	IL_000e:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0013:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token dylan.NET.Tokenizer.CodeGen.Evaluator::InstToken
	IL_0018:  ret 
    } // end of method Evaluator::.ctor

    // method line 82
    .method public 
           instance default int32 RetPrec (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7b64
	// Code size 327 (0x147)
	.maxstack 10
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1,
		int32	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op	V_3)
	IL_0000:  ldnull 
	IL_0001:  stloc 0

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  ldc.i4 0
	IL_000c:  stloc 1

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldc.i4 0
	IL_0017:  stloc 2

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0022:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0027:  stloc 0

	IL_002b:  nop 
	IL_002c:  nop 
	IL_002d:  ldloc 0

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldarg 1

	IL_0037:  nop 
	IL_0038:  nop 
	IL_0039:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_003e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0043:  stloc 1

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldloc 1

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldc.i4 1
	IL_0054:  beq IL_005e

	IL_0059:  br IL_0085

	IL_005e:  ldarg 1

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  stloc 3

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldloc 3

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op::PrecNo
	IL_0075:  stloc 2

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  br IL_0140

	IL_0080:  br IL_008a

	IL_0085:  br IL_008a

	IL_008a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_008f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0094:  stloc 0

	IL_0098:  nop 
	IL_0099:  nop 
	IL_009a:  ldloc 0

	IL_009e:  nop 
	IL_009f:  nop 
	IL_00a0:  ldarg 1

	IL_00a4:  nop 
	IL_00a5:  nop 
	IL_00a6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ab:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00b0:  stloc 1

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  ldloc 1

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  ldc.i4 1
	IL_00c1:  beq IL_00cb

	IL_00c6:  br IL_00e0

	IL_00cb:  ldc.i4 -1
	IL_00d0:  stloc 2

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  br IL_0140

	IL_00db:  br IL_00e5

	IL_00e0:  br IL_00e5

	IL_00e5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_00ea:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00ef:  stloc 0

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldloc 0

	IL_00f9:  nop 
	IL_00fa:  nop 
	IL_00fb:  ldarg 1

	IL_00ff:  nop 
	IL_0100:  nop 
	IL_0101:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0106:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_010b:  stloc 1

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  ldloc 1

	IL_0115:  nop 
	IL_0116:  nop 
	IL_0117:  ldc.i4 1
	IL_011c:  beq IL_0126

	IL_0121:  br IL_013b

	IL_0126:  ldc.i4 0
	IL_012b:  stloc 2

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  br IL_0140

	IL_0136:  br IL_0140

	IL_013b:  br IL_0140

	IL_0140:  ldloc 2

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  ret 
    } // end of method Evaluator::RetPrec

    // method line 83
    .method public 
           instance default bool isLParen (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7cb8
	// Code size 39 (0x27)
	.maxstack 2
	.locals init (
		class [mscorlib]System.Type	V_0)
	IL_0000:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.LParen
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 1

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0021:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0026:  ret 
    } // end of method Evaluator::isLParen

    // method line 84
    .method public 
           instance default bool isOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7cec
	// Code size 39 (0x27)
	.maxstack 2
	.locals init (
		class [mscorlib]System.Type	V_0)
	IL_0000:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 1

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0021:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0026:  ret 
    } // end of method Evaluator::isOp

    // method line 85
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ConvToRPN (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x7d20
	// Code size 1344 (0x540)
	.maxstack 43
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		int32	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_5,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_6,
		class [mscorlib]System.Type	V_7,
		bool	V_8,
		bool	V_9)
	IL_0000:  ldarg.0 
	IL_0001:  newobj instance void class dylan.NET.Tokenizer.CodeGen.OpStack::'.ctor'()
	IL_0006:  stfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_000b:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_0010:  stloc 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldc.i4 -1
	IL_001b:  stloc 1

	IL_001f:  nop 
	IL_0020:  nop 
	IL_0021:  ldarg 1

	IL_0025:  nop 
	IL_0026:  nop 
	IL_0027:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_002c:  ldlen 
	IL_002d:  conv.i4 
	IL_002e:  ldc.i4 1
	IL_0033:  sub 
	IL_0034:  stloc 2

	IL_0038:  nop 
	IL_0039:  nop 
	IL_003a:  ldc.i4 0
	IL_003f:  stloc 3

	IL_0043:  nop 
	IL_0044:  nop 
	IL_0045:  ldc.i4 0
	IL_004a:  stloc 4

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldnull 
	IL_0051:  stloc 5

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  ldnull 
	IL_0058:  stloc 6

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldnull 
	IL_005f:  stloc 7

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  ldc.i4 0
	IL_006a:  stloc 8

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldc.i4 0
	IL_0075:  stloc 9

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldloc 0

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldarg 1

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_008c:  stfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Line
	IL_0091:  ldloc 1

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldc.i4 1
	IL_009c:  add 
	IL_009d:  stloc 1

	IL_00a1:  nop 
	IL_00a2:  nop 
	IL_00a3:  ldarg 1

	IL_00a7:  nop 
	IL_00a8:  nop 
	IL_00a9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00ae:  ldloc 1

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  conv.u 
	IL_00b5:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00ba:  stloc 5

	IL_00be:  nop 
	IL_00bf:  nop 
	IL_00c0:  ldarg.0 
	IL_00c1:  ldloc 5

	IL_00c5:  nop 
	IL_00c6:  nop 
	IL_00c7:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_00cc:  stloc 9

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  ldarg.0 
	IL_00d3:  ldloc 5

	IL_00d7:  nop 
	IL_00d8:  nop 
	IL_00d9:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isLParen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_00de:  stloc 8

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  ldloc 9

	IL_00e8:  nop 
	IL_00e9:  nop 
	IL_00ea:  ldloc 8

	IL_00ee:  nop 
	IL_00ef:  nop 
	IL_00f0:  or 
	IL_00f1:  stloc 9

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_00fc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0101:  stloc 7

	IL_0105:  nop 
	IL_0106:  nop 
	IL_0107:  ldloc 7

	IL_010b:  nop 
	IL_010c:  nop 
	IL_010d:  ldloc 5

	IL_0111:  nop 
	IL_0112:  nop 
	IL_0113:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0118:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_011d:  stloc 8

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldloc 9

	IL_0127:  nop 
	IL_0128:  nop 
	IL_0129:  ldloc 8

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  or 
	IL_0130:  stloc 9

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ldloc 9

	IL_013a:  nop 
	IL_013b:  nop 
	IL_013c:  ldc.i4 0
	IL_0141:  beq IL_014b

	IL_0146:  br IL_0166

	IL_014b:  ldloc 0

	IL_014f:  nop 
	IL_0150:  nop 
	IL_0151:  ldloc 5

	IL_0155:  nop 
	IL_0156:  nop 
	IL_0157:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_015c:  br IL_0442

	IL_0161:  br IL_016b

	IL_0166:  br IL_016b

	IL_016b:  ldarg.0 
	IL_016c:  ldloc 5

	IL_0170:  nop 
	IL_0171:  nop 
	IL_0172:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0177:  stloc 8

	IL_017b:  nop 
	IL_017c:  nop 
	IL_017d:  ldloc 8

	IL_0181:  nop 
	IL_0182:  nop 
	IL_0183:  ldc.i4 1
	IL_0188:  beq IL_0192

	IL_018d:  br IL_024e

	IL_0192:  ldarg.0 
	IL_0193:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0198:  callvirt instance int32 class dylan.NET.Tokenizer.CodeGen.OpStack::getLength()
	IL_019d:  stloc 3

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  ldloc 3

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldc.i4 0
	IL_01ae:  beq IL_022e

	IL_01b3:  br IL_01b8

	IL_01b8:  ldarg.0 
	IL_01b9:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_01be:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token class dylan.NET.Tokenizer.CodeGen.OpStack::TopOp()
	IL_01c3:  stloc 6

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  ldarg.0 
	IL_01ca:  ldloc 5

	IL_01ce:  nop 
	IL_01cf:  nop 
	IL_01d0:  callvirt instance int32 class dylan.NET.Tokenizer.CodeGen.Evaluator::RetPrec(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_01d5:  stloc 3

	IL_01d9:  nop 
	IL_01da:  nop 
	IL_01db:  ldarg.0 
	IL_01dc:  ldloc 6

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  callvirt instance int32 class dylan.NET.Tokenizer.CodeGen.Evaluator::RetPrec(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_01e7:  stloc 4

	IL_01eb:  nop 
	IL_01ec:  nop 
	IL_01ed:  ldloc 3

	IL_01f1:  nop 
	IL_01f2:  nop 
	IL_01f3:  ldloc 4

	IL_01f7:  nop 
	IL_01f8:  nop 
	IL_01f9:  ble IL_0203

	IL_01fe:  br IL_0224

	IL_0203:  ldloc 0

	IL_0207:  nop 
	IL_0208:  nop 
	IL_0209:  ldloc 6

	IL_020d:  nop 
	IL_020e:  nop 
	IL_020f:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0214:  ldarg.0 
	IL_0215:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_021a:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.OpStack::PopOp()
	IL_021f:  br IL_0229

	IL_0224:  br IL_0229

	IL_0229:  br IL_0233

	IL_022e:  br IL_0233

	IL_0233:  ldarg.0 
	IL_0234:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0239:  ldloc 5

	IL_023d:  nop 
	IL_023e:  nop 
	IL_023f:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.OpStack::PushOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0244:  br IL_0442

	IL_0249:  br IL_0253

	IL_024e:  br IL_0253

	IL_0253:  ldarg.0 
	IL_0254:  ldloc 5

	IL_0258:  nop 
	IL_0259:  nop 
	IL_025a:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isLParen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_025f:  stloc 8

	IL_0263:  nop 
	IL_0264:  nop 
	IL_0265:  ldloc 8

	IL_0269:  nop 
	IL_026a:  nop 
	IL_026b:  ldc.i4 1
	IL_0270:  beq IL_027a

	IL_0275:  br IL_0295

	IL_027a:  ldarg.0 
	IL_027b:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0280:  ldloc 5

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.OpStack::PushOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_028b:  br IL_0442

	IL_0290:  br IL_029a

	IL_0295:  br IL_029a

	IL_029a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Chars.RParen
	IL_029f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02a4:  stloc 7

	IL_02a8:  nop 
	IL_02a9:  nop 
	IL_02aa:  ldloc 7

	IL_02ae:  nop 
	IL_02af:  nop 
	IL_02b0:  ldloc 5

	IL_02b4:  nop 
	IL_02b5:  nop 
	IL_02b6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_02bb:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_02c0:  stloc 8

	IL_02c4:  nop 
	IL_02c5:  nop 
	IL_02c6:  ldloc 8

	IL_02ca:  nop 
	IL_02cb:  nop 
	IL_02cc:  ldc.i4 1
	IL_02d1:  beq IL_02db

	IL_02d6:  br IL_043d

	IL_02db:  ldarg.0 
	IL_02dc:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_02e1:  callvirt instance int32 class dylan.NET.Tokenizer.CodeGen.OpStack::getLength()
	IL_02e6:  stloc 3

	IL_02ea:  nop 
	IL_02eb:  nop 
	IL_02ec:  ldloc 3

	IL_02f0:  nop 
	IL_02f1:  nop 
	IL_02f2:  ldc.i4 0
	IL_02f7:  beq IL_03e1

	IL_02fc:  br IL_0301

	IL_0301:  ldarg.0 
	IL_0302:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0307:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token class dylan.NET.Tokenizer.CodeGen.OpStack::TopOp()
	IL_030c:  stloc 6

	IL_0310:  nop 
	IL_0311:  nop 
	IL_0312:  ldarg.0 
	IL_0313:  ldloc 6

	IL_0317:  nop 
	IL_0318:  nop 
	IL_0319:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isLParen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_031e:  stloc 8

	IL_0322:  nop 
	IL_0323:  nop 
	IL_0324:  ldloc 8

	IL_0328:  nop 
	IL_0329:  nop 
	IL_032a:  ldc.i4 0
	IL_032f:  beq IL_0339

	IL_0334:  br IL_03d7

	IL_0339:  ldloc 0

	IL_033d:  nop 
	IL_033e:  nop 
	IL_033f:  ldloc 6

	IL_0343:  nop 
	IL_0344:  nop 
	IL_0345:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_034a:  ldarg.0 
	IL_034b:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0350:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.OpStack::PopOp()
	IL_0355:  ldarg.0 
	IL_0356:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_035b:  callvirt instance int32 class dylan.NET.Tokenizer.CodeGen.OpStack::getLength()
	IL_0360:  stloc 3

	IL_0364:  nop 
	IL_0365:  nop 
	IL_0366:  ldloc 3

	IL_036a:  nop 
	IL_036b:  nop 
	IL_036c:  ldc.i4 0
	IL_0371:  beq IL_03cd

	IL_0376:  br IL_037b

	IL_037b:  ldarg.0 
	IL_037c:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0381:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token class dylan.NET.Tokenizer.CodeGen.OpStack::TopOp()
	IL_0386:  stloc 6

	IL_038a:  nop 
	IL_038b:  nop 
	IL_038c:  ldarg.0 
	IL_038d:  ldloc 6

	IL_0391:  nop 
	IL_0392:  nop 
	IL_0393:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isLParen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_0398:  stloc 8

	IL_039c:  nop 
	IL_039d:  nop 
	IL_039e:  ldloc 8

	IL_03a2:  nop 
	IL_03a3:  nop 
	IL_03a4:  ldc.i4 1
	IL_03a9:  beq IL_03b3

	IL_03ae:  br IL_03c3

	IL_03b3:  ldarg.0 
	IL_03b4:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_03b9:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.OpStack::PopOp()
	IL_03be:  br IL_03c8

	IL_03c3:  br IL_03c8

	IL_03c8:  br IL_03d2

	IL_03cd:  br IL_03d2

	IL_03d2:  br IL_03dc

	IL_03d7:  br IL_03dc

	IL_03dc:  br IL_0433

	IL_03e1:  ldarg.0 
	IL_03e2:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_03e7:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token class dylan.NET.Tokenizer.CodeGen.OpStack::TopOp()
	IL_03ec:  stloc 6

	IL_03f0:  nop 
	IL_03f1:  nop 
	IL_03f2:  ldarg.0 
	IL_03f3:  ldloc 6

	IL_03f7:  nop 
	IL_03f8:  nop 
	IL_03f9:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isLParen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_03fe:  stloc 8

	IL_0402:  nop 
	IL_0403:  nop 
	IL_0404:  ldloc 8

	IL_0408:  nop 
	IL_0409:  nop 
	IL_040a:  ldc.i4 1
	IL_040f:  beq IL_0419

	IL_0414:  br IL_0429

	IL_0419:  ldarg.0 
	IL_041a:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_041f:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.OpStack::PopOp()
	IL_0424:  br IL_042e

	IL_0429:  br IL_042e

	IL_042e:  br IL_0433

	IL_0433:  br IL_0442

	IL_0438:  br IL_0442

	IL_043d:  br IL_0442

	IL_0442:  ldloc 1

	IL_0446:  nop 
	IL_0447:  nop 
	IL_0448:  ldloc 2

	IL_044c:  nop 
	IL_044d:  nop 
	IL_044e:  beq IL_0458

	IL_0453:  br IL_0462

	IL_0458:  br IL_046c

	IL_045d:  br IL_046c

	IL_0462:  br IL_0091

	IL_0467:  br IL_046c

	IL_046c:  ldarg.0 
	IL_046d:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0472:  callvirt instance int32 class dylan.NET.Tokenizer.CodeGen.OpStack::getLength()
	IL_0477:  stloc 3

	IL_047b:  nop 
	IL_047c:  nop 
	IL_047d:  ldloc 3

	IL_0481:  nop 
	IL_0482:  nop 
	IL_0483:  ldc.i4 0
	IL_0488:  beq IL_0492

	IL_048d:  br IL_049c

	IL_0492:  br IL_0539

	IL_0497:  br IL_04a1

	IL_049c:  br IL_04a1

	IL_04a1:  ldarg.0 
	IL_04a2:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_04a7:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token class dylan.NET.Tokenizer.CodeGen.OpStack::TopOp()
	IL_04ac:  stloc 6

	IL_04b0:  nop 
	IL_04b1:  nop 
	IL_04b2:  ldarg.0 
	IL_04b3:  ldloc 6

	IL_04b7:  nop 
	IL_04b8:  nop 
	IL_04b9:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isLParen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_04be:  stloc 8

	IL_04c2:  nop 
	IL_04c3:  nop 
	IL_04c4:  ldloc 8

	IL_04c8:  nop 
	IL_04c9:  nop 
	IL_04ca:  ldc.i4 0
	IL_04cf:  beq IL_04d9

	IL_04d4:  br IL_04ef

	IL_04d9:  ldloc 0

	IL_04dd:  nop 
	IL_04de:  nop 
	IL_04df:  ldloc 6

	IL_04e3:  nop 
	IL_04e4:  nop 
	IL_04e5:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_04ea:  br IL_04f4

	IL_04ef:  br IL_04f4

	IL_04f4:  ldarg.0 
	IL_04f5:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_04fa:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.OpStack::PopOp()
	IL_04ff:  ldarg.0 
	IL_0500:  ldfld class dylan.NET.Tokenizer.CodeGen.OpStack dylan.NET.Tokenizer.CodeGen.Evaluator::Stack
	IL_0505:  callvirt instance int32 class dylan.NET.Tokenizer.CodeGen.OpStack::getLength()
	IL_050a:  stloc 3

	IL_050e:  nop 
	IL_050f:  nop 
	IL_0510:  ldloc 3

	IL_0514:  nop 
	IL_0515:  nop 
	IL_0516:  ldc.i4 0
	IL_051b:  beq IL_0525

	IL_0520:  br IL_052f

	IL_0525:  br IL_0539

	IL_052a:  br IL_0539

	IL_052f:  br IL_04a1

	IL_0534:  br IL_0539

	IL_0539:  ldloc 0

	IL_053d:  nop 
	IL_053e:  nop 
	IL_053f:  ret 
    } // end of method Evaluator::ConvToRPN

    // method line 86
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ConvToAST (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x826c
	// Code size 615 (0x267)
	.maxstack 17
	.locals init (
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_0,
		int32	V_1,
		int32	V_2,
		int32	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_5,
		class [mscorlib]System.Type	V_6,
		bool	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op	V_8)
	IL_0000:  ldc.i4 -1
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 2

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldarg 1

	IL_001a:  nop 
	IL_001b:  nop 
	IL_001c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0021:  ldlen 
	IL_0022:  conv.i4 
	IL_0023:  stloc 3

	IL_0027:  nop 
	IL_0028:  nop 
	IL_0029:  ldnull 
	IL_002a:  stloc 4

	IL_002e:  nop 
	IL_002f:  nop 
	IL_0030:  ldnull 
	IL_0031:  stloc 5

	IL_0035:  nop 
	IL_0036:  nop 
	IL_0037:  ldnull 
	IL_0038:  stloc 6

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldc.i4 0
	IL_0043:  stloc 7

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldloc 3

	IL_004d:  nop 
	IL_004e:  nop 
	IL_004f:  ldc.i4 1
	IL_0054:  beq IL_005e

	IL_0059:  br IL_0084

	IL_005e:  ldarg 1

	IL_0062:  nop 
	IL_0063:  nop 
	IL_0064:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0069:  ldc.i4 0
	IL_006e:  conv.u 
	IL_006f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0074:  stloc 0

	IL_0078:  nop 
	IL_0079:  nop 
	IL_007a:  br IL_0260

	IL_007f:  br IL_0089

	IL_0084:  br IL_0089

	IL_0089:  ldloc 3

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldc.i4 1
	IL_0094:  sub 
	IL_0095:  stloc 3

	IL_0099:  nop 
	IL_009a:  nop 
	IL_009b:  ldloc 1

	IL_009f:  nop 
	IL_00a0:  nop 
	IL_00a1:  ldc.i4 1
	IL_00a6:  add 
	IL_00a7:  stloc 1

	IL_00ab:  nop 
	IL_00ac:  nop 
	IL_00ad:  ldarg 1

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_00b8:  ldloc 1

	IL_00bc:  nop 
	IL_00bd:  nop 
	IL_00be:  conv.u 
	IL_00bf:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_00c4:  stloc 4

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  ldarg.0 
	IL_00cb:  ldloc 4

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_00d6:  stloc 7

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldloc 7

	IL_00e0:  nop 
	IL_00e1:  nop 
	IL_00e2:  ldc.i4 1
	IL_00e7:  beq IL_00f1

	IL_00ec:  br IL_0215

	IL_00f1:  ldloc 1

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldc.i4 2
	IL_00fc:  bge IL_0106

	IL_0101:  br IL_0206

	IL_0106:  ldloc 4

	IL_010a:  nop 
	IL_010b:  nop 
	IL_010c:  stloc 8

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldloc 1

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  ldc.i4 1
	IL_011d:  sub 
	IL_011e:  stloc 2

	IL_0122:  nop 
	IL_0123:  nop 
	IL_0124:  ldarg 1

	IL_0128:  nop 
	IL_0129:  nop 
	IL_012a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_012f:  ldloc 2

	IL_0133:  nop 
	IL_0134:  nop 
	IL_0135:  conv.u 
	IL_0136:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_013b:  stloc 5

	IL_013f:  nop 
	IL_0140:  nop 
	IL_0141:  ldarg 1

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldloc 2

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_0152:  ldloc 3

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  ldc.i4 1
	IL_015d:  sub 
	IL_015e:  stloc 3

	IL_0162:  nop 
	IL_0163:  nop 
	IL_0164:  ldloc 2

	IL_0168:  nop 
	IL_0169:  nop 
	IL_016a:  ldc.i4 1
	IL_016f:  sub 
	IL_0170:  stloc 2

	IL_0174:  nop 
	IL_0175:  nop 
	IL_0176:  ldarg 1

	IL_017a:  nop 
	IL_017b:  nop 
	IL_017c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_0181:  ldloc 2

	IL_0185:  nop 
	IL_0186:  nop 
	IL_0187:  conv.u 
	IL_0188:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_018d:  stloc 4

	IL_0191:  nop 
	IL_0192:  nop 
	IL_0193:  ldarg 1

	IL_0197:  nop 
	IL_0198:  nop 
	IL_0199:  ldloc 2

	IL_019d:  nop 
	IL_019e:  nop 
	IL_019f:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::RemToken(int32)
	IL_01a4:  ldloc 3

	IL_01a8:  nop 
	IL_01a9:  nop 
	IL_01aa:  ldc.i4 1
	IL_01af:  sub 
	IL_01b0:  stloc 3

	IL_01b4:  nop 
	IL_01b5:  nop 
	IL_01b6:  ldloc 8

	IL_01ba:  nop 
	IL_01bb:  nop 
	IL_01bc:  ldloc 4

	IL_01c0:  nop 
	IL_01c1:  nop 
	IL_01c2:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_01c7:  ldloc 8

	IL_01cb:  nop 
	IL_01cc:  nop 
	IL_01cd:  ldloc 5

	IL_01d1:  nop 
	IL_01d2:  nop 
	IL_01d3:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_01d8:  ldarg 1

	IL_01dc:  nop 
	IL_01dd:  nop 
	IL_01de:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_01e3:  ldloc 2

	IL_01e7:  nop 
	IL_01e8:  nop 
	IL_01e9:  conv.u 
	IL_01ea:  ldloc 8

	IL_01ee:  nop 
	IL_01ef:  nop 
	IL_01f0:  stelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_01f5:  ldloc 2

	IL_01f9:  nop 
	IL_01fa:  nop 
	IL_01fb:  stloc 1

	IL_01ff:  nop 
	IL_0200:  nop 
	IL_0201:  br IL_020b

	IL_0206:  br IL_020b

	IL_020b:  br IL_021a

	IL_0210:  br IL_021a

	IL_0215:  br IL_021a

	IL_021a:  ldloc 1

	IL_021e:  nop 
	IL_021f:  nop 
	IL_0220:  ldloc 3

	IL_0224:  nop 
	IL_0225:  nop 
	IL_0226:  beq IL_0230

	IL_022b:  br IL_0256

	IL_0230:  ldarg 1

	IL_0234:  nop 
	IL_0235:  nop 
	IL_0236:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_023b:  ldc.i4 0
	IL_0240:  conv.u 
	IL_0241:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0246:  stloc 0

	IL_024a:  nop 
	IL_024b:  nop 
	IL_024c:  br IL_0260

	IL_0251:  br IL_0260

	IL_0256:  br IL_009b

	IL_025b:  br IL_0260

	IL_0260:  ldloc 0

	IL_0264:  nop 
	IL_0265:  nop 
	IL_0266:  ret 
    } // end of method Evaluator::ConvToAST

    // method line 87
    .method public 
           instance default void ASTEmit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok, bool emt)  cil managed 
    {
        // Method begins at RVA 0x84e0
	// Code size 11504 (0x2cf0)
	.maxstack 469
	.locals init (
		bool	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_3,
		int32	V_4,
		int32	V_5,
		class [mscorlib]System.Type	V_6,
		class [mscorlib]System.Type	V_7,
		class [mscorlib]System.Type	V_8,
		bool	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_10,
		int32	V_11,
		int32	V_12,
		int32	V_13,
		bool	V_14,
		class dylan.NET.Tokenizer.CodeGen.TypeArr[]	V_15,
		class dylan.NET.Tokenizer.CodeGen.TypeArr[]	V_16,
		string	V_17,
		class [mscorlib]System.Type	V_18,
		class [mscorlib]System.Type	V_19,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_20,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal	V_21,
		string	V_22,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_23,
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_24,
		class [mscorlib]System.Reflection.FieldInfo	V_25,
		bool	V_26,
		bool	V_27,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_28,
		int32	V_29,
		class [mscorlib]System.Type	V_30,
		bool	V_31,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_32,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_33,
		string[]	V_34,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral	V_35,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal	V_36,
		class [mscorlib]System.Type	V_37,
		string[]	V_38,
		class [mscorlib]System.Reflection.MethodInfo	V_39,
		class [mscorlib]System.Type	V_40,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_41,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_42,
		string	V_43,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_44,
		class [mscorlib]System.Type[]	V_45,
		class [mscorlib]System.Type[]	V_46,
		int32	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_50,
		class [mscorlib]System.Reflection.ConstructorInfo	V_51,
		class [mscorlib]System.Reflection.FieldInfo	V_52,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_53,
		bool	V_54,
		bool	V_55,
		int32	V_56,
		string	V_57,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok	V_58,
		class [mscorlib]System.Type[]	V_59,
		string	V_60,
		bool	V_61,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok	V_62,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_63,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok	V_64)
	IL_0000:  ldarg.0 
	IL_0001:  ldarg 1

	IL_0005:  nop 
	IL_0006:  nop 
	IL_0007:  callvirt instance bool class dylan.NET.Tokenizer.CodeGen.Evaluator::isOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_000c:  stloc 0

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op::'.ctor'()
	IL_0017:  stloc 1

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_0022:  stloc 2

	IL_0026:  nop 
	IL_0027:  nop 
	IL_0028:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::'.ctor'()
	IL_002d:  stloc 3

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldc.i4 0
	IL_0038:  stloc 4

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldc.i4 0
	IL_0043:  stloc 5

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldnull 
	IL_004a:  stloc 6

	IL_004e:  nop 
	IL_004f:  nop 
	IL_0050:  ldnull 
	IL_0051:  stloc 7

	IL_0055:  nop 
	IL_0056:  nop 
	IL_0057:  ldc.i4 0
	IL_005c:  stloc 9

	IL_0060:  nop 
	IL_0061:  nop 
	IL_0062:  ldnull 
	IL_0063:  stloc 10

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  ldc.i4 -1
	IL_006e:  stloc 11

	IL_0072:  nop 
	IL_0073:  nop 
	IL_0074:  ldc.i4 0
	IL_0079:  stloc 12

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldc.i4 0
	IL_0084:  stloc 13

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  ldc.i4 0
	IL_008f:  stloc 14

	IL_0093:  nop 
	IL_0094:  nop 
	IL_0095:  ldloc 0

	IL_0099:  nop 
	IL_009a:  nop 
	IL_009b:  ldc.i4 1
	IL_00a0:  beq IL_00aa

	IL_00a5:  br IL_02fd

	IL_00aa:  ldarg 1

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  stloc 1

	IL_00b4:  nop 
	IL_00b5:  nop 
	IL_00b6:  ldloc 1

	IL_00ba:  nop 
	IL_00bb:  nop 
	IL_00bc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op::RChild
	IL_00c1:  stloc 2

	IL_00c5:  nop 
	IL_00c6:  nop 
	IL_00c7:  ldloc 1

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op::LChild
	IL_00d2:  stloc 3

	IL_00d6:  nop 
	IL_00d7:  nop 
	IL_00d8:  ldarg.0 
	IL_00d9:  ldloc 3

	IL_00dd:  nop 
	IL_00de:  nop 
	IL_00df:  ldarg 2

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_00ea:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_00ef:  stloc 6

	IL_00f3:  nop 
	IL_00f4:  nop 
	IL_00f5:  ldarg.0 
	IL_00f6:  ldloc 2

	IL_00fa:  nop 
	IL_00fb:  nop 
	IL_00fc:  ldarg 2

	IL_0100:  nop 
	IL_0101:  nop 
	IL_0102:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_0107:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_010c:  stloc 7

	IL_0110:  nop 
	IL_0111:  nop 
	IL_0112:  ldarg 2

	IL_0116:  nop 
	IL_0117:  nop 
	IL_0118:  ldc.i4 1
	IL_011d:  beq IL_0127

	IL_0122:  br IL_015e

	IL_0127:  ldtoken [mscorlib]System.String
	IL_012c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0131:  stloc 8

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  ldloc 6

	IL_013b:  nop 
	IL_013c:  nop 
	IL_013d:  ldloc 8

	IL_0141:  nop 
	IL_0142:  nop 
	IL_0143:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0148:  stloc 9

	IL_014c:  nop 
	IL_014d:  nop 
	IL_014e:  ldloc 9

	IL_0152:  nop 
	IL_0153:  nop 
	IL_0154:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0159:  br IL_0163

	IL_015e:  br IL_0163

	IL_0163:  ldarg 2

	IL_0167:  nop 
	IL_0168:  nop 
	IL_0169:  ldc.i4 1
	IL_016e:  beq IL_0178

	IL_0173:  br IL_01e5

	IL_0178:  ldtoken [mscorlib]System.Delegate
	IL_017d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0182:  stloc 8

	IL_0186:  nop 
	IL_0187:  nop 
	IL_0188:  ldloc 6

	IL_018c:  nop 
	IL_018d:  nop 
	IL_018e:  ldloc 7

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0199:  stloc 9

	IL_019d:  nop 
	IL_019e:  nop 
	IL_019f:  ldloc 9

	IL_01a3:  nop 
	IL_01a4:  nop 
	IL_01a5:  ldc.i4 1
	IL_01aa:  beq IL_01b4

	IL_01af:  br IL_01db

	IL_01b4:  ldloc 6

	IL_01b8:  nop 
	IL_01b9:  nop 
	IL_01ba:  ldloc 8

	IL_01be:  nop 
	IL_01bf:  nop 
	IL_01c0:  callvirt instance bool class [mscorlib]System.Type::IsSubclassOf(class [mscorlib]System.Type)
	IL_01c5:  stloc 9

	IL_01c9:  nop 
	IL_01ca:  nop 
	IL_01cb:  ldloc 9

	IL_01cf:  nop 
	IL_01d0:  nop 
	IL_01d1:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::DelegateFlg
	IL_01d6:  br IL_01e0

	IL_01db:  br IL_01e0

	IL_01e0:  br IL_01ea

	IL_01e5:  br IL_01ea

	IL_01ea:  ldloc 6

	IL_01ee:  nop 
	IL_01ef:  nop 
	IL_01f0:  ldloc 7

	IL_01f4:  nop 
	IL_01f5:  nop 
	IL_01f6:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_01fb:  stloc 9

	IL_01ff:  nop 
	IL_0200:  nop 
	IL_0201:  ldloc 9

	IL_0205:  nop 
	IL_0206:  nop 
	IL_0207:  ldc.i4 1
	IL_020c:  beq IL_0216

	IL_0211:  br IL_022b

	IL_0216:  ldloc 6

	IL_021a:  nop 
	IL_021b:  nop 
	IL_021c:  callvirt instance bool class [mscorlib]System.Type::get_IsPrimitive()
	IL_0221:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_0226:  br IL_023a

	IL_022b:  ldc.i4 0
	IL_0230:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_0235:  br IL_023a

	IL_023a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
	IL_023f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0244:  stloc 8

	IL_0248:  nop 
	IL_0249:  nop 
	IL_024a:  ldloc 8

	IL_024e:  nop 
	IL_024f:  nop 
	IL_0250:  ldloc 1

	IL_0254:  nop 
	IL_0255:  nop 
	IL_0256:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_025b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0260:  stloc 9

	IL_0264:  nop 
	IL_0265:  nop 
	IL_0266:  ldloc 9

	IL_026a:  nop 
	IL_026b:  nop 
	IL_026c:  ldc.i4 1
	IL_0271:  beq IL_027b

	IL_0276:  br IL_028f

	IL_027b:  ldtoken [mscorlib]System.Boolean
	IL_0280:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0285:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_028a:  br IL_029f

	IL_028f:  ldloc 6

	IL_0293:  nop 
	IL_0294:  nop 
	IL_0295:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_029a:  br IL_029f

	IL_029f:  ldarg 2

	IL_02a3:  nop 
	IL_02a4:  nop 
	IL_02a5:  ldc.i4 1
	IL_02aa:  beq IL_02b4

	IL_02af:  br IL_02f3

	IL_02b4:  ldloc 6

	IL_02b8:  nop 
	IL_02b9:  nop 
	IL_02ba:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_02bf:  ldloc 7

	IL_02c3:  nop 
	IL_02c4:  nop 
	IL_02c5:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_02ca:  ldloc 1

	IL_02ce:  nop 
	IL_02cf:  nop 
	IL_02d0:  ldc.i4 1
	IL_02d5:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op, bool)
	IL_02da:  ldc.i4 0
	IL_02df:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_02e4:  ldc.i4 0
	IL_02e9:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_02ee:  br IL_02f8

	IL_02f3:  br IL_02f8

	IL_02f8:  br IL_2cef

	IL_02fd:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_0302:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0307:  stloc 8

	IL_030b:  nop 
	IL_030c:  nop 
	IL_030d:  ldloc 8

	IL_0311:  nop 
	IL_0312:  nop 
	IL_0313:  ldarg 1

	IL_0317:  nop 
	IL_0318:  nop 
	IL_0319:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_031e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0323:  stloc 9

	IL_0327:  nop 
	IL_0328:  nop 
	IL_0329:  ldloc 9

	IL_032d:  nop 
	IL_032e:  nop 
	IL_032f:  ldc.i4 1
	IL_0334:  beq IL_033e

	IL_0339:  br IL_048e

	IL_033e:  ldarg 1

	IL_0342:  nop 
	IL_0343:  nop 
	IL_0344:  stloc 20

	IL_0348:  nop 
	IL_0349:  nop 
	IL_034a:  ldloc 20

	IL_034e:  nop 
	IL_034f:  nop 
	IL_0350:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0355:  stloc 10

	IL_0359:  nop 
	IL_035a:  nop 
	IL_035b:  ldloc 10

	IL_035f:  nop 
	IL_0360:  nop 
	IL_0361:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0366:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_036b:  ldarg 2

	IL_036f:  nop 
	IL_0370:  nop 
	IL_0371:  ldc.i4 1
	IL_0376:  beq IL_0380

	IL_037b:  br IL_0390

	IL_0380:  ldloc 20

	IL_0384:  nop 
	IL_0385:  nop 
	IL_0386:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_038b:  br IL_0395

	IL_0390:  br IL_0395

	IL_0395:  ldloc 20

	IL_0399:  nop 
	IL_039a:  nop 
	IL_039b:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_03a0:  ldc.i4 1
	IL_03a5:  beq IL_03af

	IL_03aa:  br IL_03d5

	IL_03af:  ldc.i4 1
	IL_03b4:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_03b9:  ldarg.0 
	IL_03ba:  ldloc 20

	IL_03be:  nop 
	IL_03bf:  nop 
	IL_03c0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_03c5:  ldarg 2

	IL_03c9:  nop 
	IL_03ca:  nop 
	IL_03cb:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_03d0:  br IL_03da

	IL_03d5:  br IL_03da

	IL_03da:  ldloc 20

	IL_03de:  nop 
	IL_03df:  nop 
	IL_03e0:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_03e5:  ldc.i4 1
	IL_03ea:  beq IL_03f4

	IL_03ef:  br IL_047f

	IL_03f4:  ldarg 2

	IL_03f8:  nop 
	IL_03f9:  nop 
	IL_03fa:  ldc.i4 1
	IL_03ff:  beq IL_0409

	IL_0404:  br IL_0419

	IL_0409:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_040e:  stloc 18

	IL_0412:  nop 
	IL_0413:  nop 
	IL_0414:  br IL_041e

	IL_0419:  br IL_041e

	IL_041e:  ldloc 20

	IL_0422:  nop 
	IL_0423:  nop 
	IL_0424:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_0429:  stloc 10

	IL_042d:  nop 
	IL_042e:  nop 
	IL_042f:  ldloc 10

	IL_0433:  nop 
	IL_0434:  nop 
	IL_0435:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_043a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_043f:  ldarg 2

	IL_0443:  nop 
	IL_0444:  nop 
	IL_0445:  ldc.i4 1
	IL_044a:  beq IL_0454

	IL_044f:  br IL_0475

	IL_0454:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0459:  stloc 19

	IL_045d:  nop 
	IL_045e:  nop 
	IL_045f:  ldloc 18

	IL_0463:  nop 
	IL_0464:  nop 
	IL_0465:  ldloc 19

	IL_0469:  nop 
	IL_046a:  nop 
	IL_046b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0470:  br IL_047a

	IL_0475:  br IL_047a

	IL_047a:  br IL_0484

	IL_047f:  br IL_0484

	IL_0484:  br IL_2cea

	IL_0489:  br IL_0493

	IL_048e:  br IL_0493

	IL_0493:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_0498:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_049d:  stloc 8

	IL_04a1:  nop 
	IL_04a2:  nop 
	IL_04a3:  ldloc 8

	IL_04a7:  nop 
	IL_04a8:  nop 
	IL_04a9:  ldarg 1

	IL_04ad:  nop 
	IL_04ae:  nop 
	IL_04af:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_04b4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_04b9:  stloc 9

	IL_04bd:  nop 
	IL_04be:  nop 
	IL_04bf:  ldloc 9

	IL_04c3:  nop 
	IL_04c4:  nop 
	IL_04c5:  ldc.i4 1
	IL_04ca:  beq IL_04d4

	IL_04cf:  br IL_05df

	IL_04d4:  ldarg 1

	IL_04d8:  nop 
	IL_04d9:  nop 
	IL_04da:  stloc 21

	IL_04de:  nop 
	IL_04df:  nop 
	IL_04e0:  ldarg 2

	IL_04e4:  nop 
	IL_04e5:  nop 
	IL_04e6:  ldc.i4 1
	IL_04eb:  beq IL_04f5

	IL_04f0:  br IL_0505

	IL_04f5:  ldloc 21

	IL_04f9:  nop 
	IL_04fa:  nop 
	IL_04fb:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_0500:  br IL_050a

	IL_0505:  br IL_050a

	IL_050a:  ldloc 21

	IL_050e:  nop 
	IL_050f:  nop 
	IL_0510:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_0515:  stloc 10

	IL_0519:  nop 
	IL_051a:  nop 
	IL_051b:  ldloc 10

	IL_051f:  nop 
	IL_0520:  nop 
	IL_0521:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0526:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_052b:  ldloc 21

	IL_052f:  nop 
	IL_0530:  nop 
	IL_0531:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_0536:  ldc.i4 1
	IL_053b:  beq IL_0545

	IL_0540:  br IL_05d0

	IL_0545:  ldarg 2

	IL_0549:  nop 
	IL_054a:  nop 
	IL_054b:  ldc.i4 1
	IL_0550:  beq IL_055a

	IL_0555:  br IL_056a

	IL_055a:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_055f:  stloc 18

	IL_0563:  nop 
	IL_0564:  nop 
	IL_0565:  br IL_056f

	IL_056a:  br IL_056f

	IL_056f:  ldloc 21

	IL_0573:  nop 
	IL_0574:  nop 
	IL_0575:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_057a:  stloc 10

	IL_057e:  nop 
	IL_057f:  nop 
	IL_0580:  ldloc 10

	IL_0584:  nop 
	IL_0585:  nop 
	IL_0586:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_058b:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0590:  ldarg 2

	IL_0594:  nop 
	IL_0595:  nop 
	IL_0596:  ldc.i4 1
	IL_059b:  beq IL_05a5

	IL_05a0:  br IL_05c6

	IL_05a5:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_05aa:  stloc 19

	IL_05ae:  nop 
	IL_05af:  nop 
	IL_05b0:  ldloc 18

	IL_05b4:  nop 
	IL_05b5:  nop 
	IL_05b6:  ldloc 19

	IL_05ba:  nop 
	IL_05bb:  nop 
	IL_05bc:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_05c1:  br IL_05cb

	IL_05c6:  br IL_05cb

	IL_05cb:  br IL_05d5

	IL_05d0:  br IL_05d5

	IL_05d5:  br IL_2cea

	IL_05da:  br IL_05e4

	IL_05df:  br IL_05e4

	IL_05e4:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_05e9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05ee:  stloc 8

	IL_05f2:  nop 
	IL_05f3:  nop 
	IL_05f4:  ldloc 8

	IL_05f8:  nop 
	IL_05f9:  nop 
	IL_05fa:  ldarg 1

	IL_05fe:  nop 
	IL_05ff:  nop 
	IL_0600:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0605:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_060a:  stloc 9

	IL_060e:  nop 
	IL_060f:  nop 
	IL_0610:  ldc.i4 0
	IL_0615:  stloc 26

	IL_0619:  nop 
	IL_061a:  nop 
	IL_061b:  ldc.i4 0
	IL_0620:  stloc 27

	IL_0624:  nop 
	IL_0625:  nop 
	IL_0626:  ldc.i4 0
	IL_062b:  stloc 29

	IL_062f:  nop 
	IL_0630:  nop 
	IL_0631:  ldc.i4 0
	IL_0636:  stloc 31

	IL_063a:  nop 
	IL_063b:  nop 
	IL_063c:  ldloc 9

	IL_0640:  nop 
	IL_0641:  nop 
	IL_0642:  ldc.i4 1
	IL_0647:  beq IL_0651

	IL_064c:  br IL_0f86

	IL_0651:  ldarg 1

	IL_0655:  nop 
	IL_0656:  nop 
	IL_0657:  stloc 28

	IL_065b:  nop 
	IL_065c:  nop 
	IL_065d:  ldloc 28

	IL_0661:  nop 
	IL_0662:  nop 
	IL_0663:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0668:  stloc 22

	IL_066c:  nop 
	IL_066d:  nop 
	IL_066e:  ldloc 22

	IL_0672:  nop 
	IL_0673:  nop 
	IL_0674:  ldstr ":"
	IL_0679:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_067e:  stloc 34

	IL_0682:  nop 
	IL_0683:  nop 
	IL_0684:  ldc.i4 -1
	IL_0689:  stloc 11

	IL_068d:  nop 
	IL_068e:  nop 
	IL_068f:  ldloc 34

	IL_0693:  nop 
	IL_0694:  nop 
	IL_0695:  ldlen 
	IL_0696:  conv.i4 
	IL_0697:  ldc.i4 1
	IL_069c:  sub 
	IL_069d:  stloc 13

	IL_06a1:  nop 
	IL_06a2:  nop 
	IL_06a3:  ldloc 34

	IL_06a7:  nop 
	IL_06a8:  nop 
	IL_06a9:  ldc.i4 0
	IL_06ae:  conv.u 
	IL_06af:  ldelem [mscorlib]System.String
	IL_06b4:  ldstr "me"
	IL_06b9:  call int32 string::Compare(string, string)
	IL_06be:  stloc 29

	IL_06c2:  nop 
	IL_06c3:  nop 
	IL_06c4:  ldloc 29

	IL_06c8:  nop 
	IL_06c9:  nop 
	IL_06ca:  ldc.i4 0
	IL_06cf:  beq IL_06d9

	IL_06d4:  br IL_06fb

	IL_06d9:  ldloc 11

	IL_06dd:  nop 
	IL_06de:  nop 
	IL_06df:  ldc.i4 1
	IL_06e4:  add 
	IL_06e5:  stloc 11

	IL_06e9:  nop 
	IL_06ea:  nop 
	IL_06eb:  ldc.i4 1
	IL_06f0:  stloc 26

	IL_06f4:  nop 
	IL_06f5:  nop 
	IL_06f6:  br IL_0700

	IL_06fb:  br IL_0700

	IL_0700:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0705:  ldc.i4 0
	IL_070a:  beq IL_0714

	IL_070f:  br IL_0719

	IL_0714:  br IL_0749

	IL_0719:  ldc.i4 0
	IL_071e:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0723:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0728:  stloc 8

	IL_072c:  nop 
	IL_072d:  nop 
	IL_072e:  ldc.i4 1
	IL_0733:  stloc 27

	IL_0737:  nop 
	IL_0738:  nop 
	IL_0739:  ldc.i4 0
	IL_073e:  stloc 31

	IL_0742:  nop 
	IL_0743:  nop 
	IL_0744:  br IL_0749

	IL_0749:  ldloc 11

	IL_074d:  nop 
	IL_074e:  nop 
	IL_074f:  ldc.i4 1
	IL_0754:  add 
	IL_0755:  stloc 11

	IL_0759:  nop 
	IL_075a:  nop 
	IL_075b:  ldloc 11

	IL_075f:  nop 
	IL_0760:  nop 
	IL_0761:  ldloc 13

	IL_0765:  nop 
	IL_0766:  nop 
	IL_0767:  beq IL_0780

	IL_076c:  br IL_0771

	IL_0771:  ldc.i4 1
	IL_0776:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_077b:  br IL_078f

	IL_0780:  ldc.i4 0
	IL_0785:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_078a:  br IL_078f

	IL_078f:  ldloc 27

	IL_0793:  nop 
	IL_0794:  nop 
	IL_0795:  ldc.i4 0
	IL_079a:  beq IL_07a4

	IL_079f:  br IL_0add

	IL_07a4:  ldloc 26

	IL_07a8:  nop 
	IL_07a9:  nop 
	IL_07aa:  ldc.i4 0
	IL_07af:  beq IL_07b9

	IL_07b4:  br IL_095d

	IL_07b9:  ldloc 34

	IL_07bd:  nop 
	IL_07be:  nop 
	IL_07bf:  ldloc 11

	IL_07c3:  nop 
	IL_07c4:  nop 
	IL_07c5:  conv.u 
	IL_07c6:  ldelem [mscorlib]System.String
	IL_07cb:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_07d0:  stloc 23

	IL_07d4:  nop 
	IL_07d5:  nop 
	IL_07d6:  ldloc 23

	IL_07da:  nop 
	IL_07db:  nop 
	IL_07dc:  ldnull 
	IL_07dd:  beq IL_085c

	IL_07e2:  br IL_07e7

	IL_07e7:  ldarg 2

	IL_07eb:  nop 
	IL_07ec:  nop 
	IL_07ed:  ldc.i4 1
	IL_07f2:  beq IL_07fc

	IL_07f7:  br IL_082c

	IL_07fc:  ldloc 23

	IL_0800:  nop 
	IL_0801:  nop 
	IL_0802:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_0807:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_080c:  ldloc 23

	IL_0810:  nop 
	IL_0811:  nop 
	IL_0812:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_0817:  ldloc 23

	IL_081b:  nop 
	IL_081c:  nop 
	IL_081d:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_0822:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_0827:  br IL_0831

	IL_082c:  br IL_0831

	IL_0831:  ldloc 23

	IL_0835:  nop 
	IL_0836:  nop 
	IL_0837:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_083c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0841:  ldloc 23

	IL_0845:  nop 
	IL_0846:  nop 
	IL_0847:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_084c:  stloc 8

	IL_0850:  nop 
	IL_0851:  nop 
	IL_0852:  br IL_0ce9

	IL_0857:  br IL_0958

	IL_085c:  ldloc 34

	IL_0860:  nop 
	IL_0861:  nop 
	IL_0862:  ldloc 11

	IL_0866:  nop 
	IL_0867:  nop 
	IL_0868:  conv.u 
	IL_0869:  ldelem [mscorlib]System.String
	IL_086e:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0873:  stloc 25

	IL_0877:  nop 
	IL_0878:  nop 
	IL_0879:  ldloc 25

	IL_087d:  nop 
	IL_087e:  nop 
	IL_087f:  ldnull 
	IL_0880:  beq IL_094e

	IL_0885:  br IL_088a

	IL_088a:  ldloc 25

	IL_088e:  nop 
	IL_088f:  nop 
	IL_0890:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0895:  stloc 31

	IL_0899:  nop 
	IL_089a:  nop 
	IL_089b:  ldloc 31

	IL_089f:  nop 
	IL_08a0:  nop 
	IL_08a1:  ldc.i4 0
	IL_08a6:  beq IL_08b0

	IL_08ab:  br IL_08de

	IL_08b0:  ldarg 2

	IL_08b4:  nop 
	IL_08b5:  nop 
	IL_08b6:  ldc.i4 1
	IL_08bb:  beq IL_08c5

	IL_08c0:  br IL_08d4

	IL_08c5:  ldc.i4 0
	IL_08ca:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_08cf:  br IL_08d9

	IL_08d4:  br IL_08d9

	IL_08d9:  br IL_08e3

	IL_08de:  br IL_08e3

	IL_08e3:  ldarg 2

	IL_08e7:  nop 
	IL_08e8:  nop 
	IL_08e9:  ldc.i4 1
	IL_08ee:  beq IL_08f8

	IL_08f3:  br IL_091e

	IL_08f8:  ldloc 25

	IL_08fc:  nop 
	IL_08fd:  nop 
	IL_08fe:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0903:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0908:  ldloc 25

	IL_090c:  nop 
	IL_090d:  nop 
	IL_090e:  ldloc 31

	IL_0912:  nop 
	IL_0913:  nop 
	IL_0914:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0919:  br IL_0923

	IL_091e:  br IL_0923

	IL_0923:  ldloc 25

	IL_0927:  nop 
	IL_0928:  nop 
	IL_0929:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_092e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0933:  ldloc 25

	IL_0937:  nop 
	IL_0938:  nop 
	IL_0939:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_093e:  stloc 8

	IL_0942:  nop 
	IL_0943:  nop 
	IL_0944:  br IL_0ce9

	IL_0949:  br IL_0953

	IL_094e:  br IL_0953

	IL_0953:  br IL_0958

	IL_0958:  br IL_0a59

	IL_095d:  ldloc 34

	IL_0961:  nop 
	IL_0962:  nop 
	IL_0963:  ldloc 11

	IL_0967:  nop 
	IL_0968:  nop 
	IL_0969:  conv.u 
	IL_096a:  ldelem [mscorlib]System.String
	IL_096f:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0974:  stloc 25

	IL_0978:  nop 
	IL_0979:  nop 
	IL_097a:  ldloc 25

	IL_097e:  nop 
	IL_097f:  nop 
	IL_0980:  ldnull 
	IL_0981:  beq IL_0a4f

	IL_0986:  br IL_098b

	IL_098b:  ldloc 25

	IL_098f:  nop 
	IL_0990:  nop 
	IL_0991:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0996:  stloc 31

	IL_099a:  nop 
	IL_099b:  nop 
	IL_099c:  ldloc 31

	IL_09a0:  nop 
	IL_09a1:  nop 
	IL_09a2:  ldc.i4 0
	IL_09a7:  beq IL_09b1

	IL_09ac:  br IL_09df

	IL_09b1:  ldarg 2

	IL_09b5:  nop 
	IL_09b6:  nop 
	IL_09b7:  ldc.i4 1
	IL_09bc:  beq IL_09c6

	IL_09c1:  br IL_09d5

	IL_09c6:  ldc.i4 0
	IL_09cb:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_09d0:  br IL_09da

	IL_09d5:  br IL_09da

	IL_09da:  br IL_09e4

	IL_09df:  br IL_09e4

	IL_09e4:  ldarg 2

	IL_09e8:  nop 
	IL_09e9:  nop 
	IL_09ea:  ldc.i4 1
	IL_09ef:  beq IL_09f9

	IL_09f4:  br IL_0a1f

	IL_09f9:  ldloc 25

	IL_09fd:  nop 
	IL_09fe:  nop 
	IL_09ff:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0a04:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0a09:  ldloc 25

	IL_0a0d:  nop 
	IL_0a0e:  nop 
	IL_0a0f:  ldloc 31

	IL_0a13:  nop 
	IL_0a14:  nop 
	IL_0a15:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0a1a:  br IL_0a24

	IL_0a1f:  br IL_0a24

	IL_0a24:  ldloc 25

	IL_0a28:  nop 
	IL_0a29:  nop 
	IL_0a2a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0a2f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0a34:  ldloc 25

	IL_0a38:  nop 
	IL_0a39:  nop 
	IL_0a3a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0a3f:  stloc 8

	IL_0a43:  nop 
	IL_0a44:  nop 
	IL_0a45:  br IL_0ce9

	IL_0a4a:  br IL_0a54

	IL_0a4f:  br IL_0a54

	IL_0a54:  br IL_0a59

	IL_0a59:  ldloc 34

	IL_0a5d:  nop 
	IL_0a5e:  nop 
	IL_0a5f:  ldloc 11

	IL_0a63:  nop 
	IL_0a64:  nop 
	IL_0a65:  conv.u 
	IL_0a66:  ldelem [mscorlib]System.String
	IL_0a6b:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_0a70:  stloc 8

	IL_0a74:  nop 
	IL_0a75:  nop 
	IL_0a76:  ldc.i4 1
	IL_0a7b:  stloc 31

	IL_0a7f:  nop 
	IL_0a80:  nop 
	IL_0a81:  ldloc 8

	IL_0a85:  nop 
	IL_0a86:  nop 
	IL_0a87:  ldnull 
	IL_0a88:  beq IL_0a92

	IL_0a8d:  br IL_0ad3

	IL_0a92:  ldstr "Variable or Class '"
	IL_0a97:  ldloc 34

	IL_0a9b:  nop 
	IL_0a9c:  nop 
	IL_0a9d:  ldloc 11

	IL_0aa1:  nop 
	IL_0aa2:  nop 
	IL_0aa3:  conv.u 
	IL_0aa4:  ldelem [mscorlib]System.String
	IL_0aa9:  ldstr "' is not defined."
	IL_0aae:  call string string::Concat(string, string, string)
	IL_0ab3:  stloc 17

	IL_0ab7:  nop 
	IL_0ab8:  nop 
	IL_0ab9:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_0abe:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_0ac3:  ldloc 17

	IL_0ac7:  nop 
	IL_0ac8:  nop 
	IL_0ac9:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_0ace:  br IL_0ad8

	IL_0ad3:  br IL_0ad8

	IL_0ad8:  br IL_0ce9

	IL_0add:  ldloc 8

	IL_0ae1:  nop 
	IL_0ae2:  nop 
	IL_0ae3:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0ae8:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0aed:  stloc 9

	IL_0af1:  nop 
	IL_0af2:  nop 
	IL_0af3:  ldloc 9

	IL_0af7:  nop 
	IL_0af8:  nop 
	IL_0af9:  ldc.i4 0
	IL_0afe:  beq IL_0b08

	IL_0b03:  br IL_0c37

	IL_0b08:  ldloc 8

	IL_0b0c:  nop 
	IL_0b0d:  nop 
	IL_0b0e:  ldloc 34

	IL_0b12:  nop 
	IL_0b13:  nop 
	IL_0b14:  ldloc 11

	IL_0b18:  nop 
	IL_0b19:  nop 
	IL_0b1a:  conv.u 
	IL_0b1b:  ldelem [mscorlib]System.String
	IL_0b20:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_0b25:  stloc 25

	IL_0b29:  nop 
	IL_0b2a:  nop 
	IL_0b2b:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0b30:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0b35:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0b3a:  stloc 8

	IL_0b3e:  nop 
	IL_0b3f:  nop 
	IL_0b40:  ldarg 2

	IL_0b44:  nop 
	IL_0b45:  nop 
	IL_0b46:  ldc.i4 1
	IL_0b4b:  beq IL_0b55

	IL_0b50:  br IL_0c2d

	IL_0b55:  ldsfld bool [dnr]dylan.NET.Reflection.Loader::FldLitFlag
	IL_0b5a:  ldc.i4 0
	IL_0b5f:  beq IL_0b69

	IL_0b64:  br IL_0b89

	IL_0b69:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0b6e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0b73:  ldloc 25

	IL_0b77:  nop 
	IL_0b78:  nop 
	IL_0b79:  ldloc 31

	IL_0b7d:  nop 
	IL_0b7e:  nop 
	IL_0b7f:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0b84:  br IL_0c28

	IL_0b89:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::'.ctor'()
	IL_0b8e:  stloc 35

	IL_0b92:  nop 
	IL_0b93:  nop 
	IL_0b94:  ldloc 35

	IL_0b98:  nop 
	IL_0b99:  nop 
	IL_0b9a:  ldsfld object [dnr]dylan.NET.Reflection.Loader::FldLitVal
	IL_0b9f:  stfld object [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ConstVal
	IL_0ba4:  ldloc 35

	IL_0ba8:  nop 
	IL_0ba9:  nop 
	IL_0baa:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0baf:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ExtTyp
	IL_0bb4:  ldsfld bool [dnr]dylan.NET.Reflection.Loader::EnumLitFlag
	IL_0bb9:  ldc.i4 1
	IL_0bbe:  beq IL_0bc8

	IL_0bc3:  br IL_0bdd

	IL_0bc8:  ldloc 35

	IL_0bcc:  nop 
	IL_0bcd:  nop 
	IL_0bce:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::EnumLitTyp
	IL_0bd3:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_0bd8:  br IL_0bf2

	IL_0bdd:  ldloc 35

	IL_0be1:  nop 
	IL_0be2:  nop 
	IL_0be3:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0be8:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_0bed:  br IL_0bf2

	IL_0bf2:  ldloc 35

	IL_0bf6:  nop 
	IL_0bf7:  nop 
	IL_0bf8:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessConst(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral)
	IL_0bfd:  stloc 36

	IL_0c01:  nop 
	IL_0c02:  nop 
	IL_0c03:  ldloc 36

	IL_0c07:  nop 
	IL_0c08:  nop 
	IL_0c09:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_0c0e:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0c13:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0c18:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0c1d:  stloc 8

	IL_0c21:  nop 
	IL_0c22:  nop 
	IL_0c23:  br IL_0c28

	IL_0c28:  br IL_0c32

	IL_0c2d:  br IL_0c32

	IL_0c32:  br IL_0cba

	IL_0c37:  ldloc 34

	IL_0c3b:  nop 
	IL_0c3c:  nop 
	IL_0c3d:  ldloc 11

	IL_0c41:  nop 
	IL_0c42:  nop 
	IL_0c43:  conv.u 
	IL_0c44:  ldelem [mscorlib]System.String
	IL_0c49:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0c4e:  stloc 25

	IL_0c52:  nop 
	IL_0c53:  nop 
	IL_0c54:  ldarg 2

	IL_0c58:  nop 
	IL_0c59:  nop 
	IL_0c5a:  ldc.i4 1
	IL_0c5f:  beq IL_0c69

	IL_0c64:  br IL_0c8f

	IL_0c69:  ldloc 25

	IL_0c6d:  nop 
	IL_0c6e:  nop 
	IL_0c6f:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0c74:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0c79:  ldloc 25

	IL_0c7d:  nop 
	IL_0c7e:  nop 
	IL_0c7f:  ldloc 31

	IL_0c83:  nop 
	IL_0c84:  nop 
	IL_0c85:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0c8a:  br IL_0c94

	IL_0c8f:  br IL_0c94

	IL_0c94:  ldloc 25

	IL_0c98:  nop 
	IL_0c99:  nop 
	IL_0c9a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0c9f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0ca4:  ldloc 25

	IL_0ca8:  nop 
	IL_0ca9:  nop 
	IL_0caa:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0caf:  stloc 8

	IL_0cb3:  nop 
	IL_0cb4:  nop 
	IL_0cb5:  br IL_0cba

	IL_0cba:  ldloc 31

	IL_0cbe:  nop 
	IL_0cbf:  nop 
	IL_0cc0:  ldc.i4 1
	IL_0cc5:  beq IL_0ccf

	IL_0cca:  br IL_0cdf

	IL_0ccf:  ldc.i4 0
	IL_0cd4:  stloc 31

	IL_0cd8:  nop 
	IL_0cd9:  nop 
	IL_0cda:  br IL_0ce4

	IL_0cdf:  br IL_0ce4

	IL_0ce4:  br IL_0ce9

	IL_0ce9:  ldc.i4 1
	IL_0cee:  stloc 27

	IL_0cf2:  nop 
	IL_0cf3:  nop 
	IL_0cf4:  ldloc 11

	IL_0cf8:  nop 
	IL_0cf9:  nop 
	IL_0cfa:  ldloc 13

	IL_0cfe:  nop 
	IL_0cff:  nop 
	IL_0d00:  beq IL_0d0a

	IL_0d05:  br IL_0d14

	IL_0d0a:  br IL_0d1e

	IL_0d0f:  br IL_0d1e

	IL_0d14:  br IL_0749

	IL_0d19:  br IL_0d1e

	IL_0d1e:  ldloc 28

	IL_0d22:  nop 
	IL_0d23:  nop 
	IL_0d24:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_0d29:  ldc.i4 1
	IL_0d2e:  beq IL_0d38

	IL_0d33:  br IL_0e88

	IL_0d38:  ldloc 28

	IL_0d3c:  nop 
	IL_0d3d:  nop 
	IL_0d3e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0d43:  call bool class dylan.NET.Tokenizer.CodeGen.Helpers::CheckIfArrLen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0d48:  stloc 9

	IL_0d4c:  nop 
	IL_0d4d:  nop 
	IL_0d4e:  ldloc 9

	IL_0d52:  nop 
	IL_0d53:  nop 
	IL_0d54:  ldc.i4 1
	IL_0d59:  beq IL_0d63

	IL_0d5e:  br IL_0da0

	IL_0d63:  ldarg 2

	IL_0d67:  nop 
	IL_0d68:  nop 
	IL_0d69:  ldc.i4 1
	IL_0d6e:  beq IL_0d78

	IL_0d73:  br IL_0d87

	IL_0d78:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdlen()
	IL_0d7d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI4()
	IL_0d82:  br IL_0d8c

	IL_0d87:  br IL_0d8c

	IL_0d8c:  ldtoken [mscorlib]System.Int32
	IL_0d91:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d96:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0d9b:  br IL_0e83

	IL_0da0:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0da5:  stloc 8

	IL_0da9:  nop 
	IL_0daa:  nop 
	IL_0dab:  ldloc 28

	IL_0daf:  nop 
	IL_0db0:  nop 
	IL_0db1:  ldarg.0 
	IL_0db2:  ldloc 28

	IL_0db6:  nop 
	IL_0db7:  nop 
	IL_0db8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0dbd:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0dc2:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0dc7:  ldarg.0 
	IL_0dc8:  ldloc 28

	IL_0dcc:  nop 
	IL_0dcd:  nop 
	IL_0dce:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0dd3:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0dd8:  starg 1

	IL_0ddc:  nop 
	IL_0ddd:  nop 
	IL_0dde:  ldarg.0 
	IL_0ddf:  ldarg 1

	IL_0de3:  nop 
	IL_0de4:  nop 
	IL_0de5:  ldarg 2

	IL_0de9:  nop 
	IL_0dea:  nop 
	IL_0deb:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_0df0:  ldloc 8

	IL_0df4:  nop 
	IL_0df5:  nop 
	IL_0df6:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::GetElementType()
	IL_0dfb:  stloc 8

	IL_0dff:  nop 
	IL_0e00:  nop 
	IL_0e01:  ldarg 2

	IL_0e05:  nop 
	IL_0e06:  nop 
	IL_0e07:  ldc.i4 1
	IL_0e0c:  beq IL_0e16

	IL_0e11:  br IL_0e64

	IL_0e16:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI()
	IL_0e1b:  ldloc 28

	IL_0e1f:  nop 
	IL_0e20:  nop 
	IL_0e21:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_0e26:  ldc.i4 1
	IL_0e2b:  beq IL_0e35

	IL_0e30:  br IL_0e4f

	IL_0e35:  ldc.i4 1
	IL_0e3a:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0e3f:  ldloc 8

	IL_0e43:  nop 
	IL_0e44:  nop 
	IL_0e45:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0e4a:  br IL_0e54

	IL_0e4f:  br IL_0e54

	IL_0e54:  ldloc 8

	IL_0e58:  nop 
	IL_0e59:  nop 
	IL_0e5a:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitElemLd(class [mscorlib]System.Type)
	IL_0e5f:  br IL_0e69

	IL_0e64:  br IL_0e69

	IL_0e69:  ldloc 8

	IL_0e6d:  nop 
	IL_0e6e:  nop 
	IL_0e6f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0e74:  ldc.i4 0
	IL_0e79:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0e7e:  br IL_0e83

	IL_0e83:  br IL_0e8d

	IL_0e88:  br IL_0e8d

	IL_0e8d:  ldloc 28

	IL_0e91:  nop 
	IL_0e92:  nop 
	IL_0e93:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_0e98:  ldc.i4 1
	IL_0e9d:  beq IL_0ea7

	IL_0ea2:  br IL_0ecd

	IL_0ea7:  ldc.i4 1
	IL_0eac:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0eb1:  ldarg.0 
	IL_0eb2:  ldloc 28

	IL_0eb6:  nop 
	IL_0eb7:  nop 
	IL_0eb8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_0ebd:  ldarg 2

	IL_0ec1:  nop 
	IL_0ec2:  nop 
	IL_0ec3:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_0ec8:  br IL_0ed2

	IL_0ecd:  br IL_0ed2

	IL_0ed2:  ldloc 28

	IL_0ed6:  nop 
	IL_0ed7:  nop 
	IL_0ed8:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_0edd:  ldc.i4 1
	IL_0ee2:  beq IL_0eec

	IL_0ee7:  br IL_0f77

	IL_0eec:  ldarg 2

	IL_0ef0:  nop 
	IL_0ef1:  nop 
	IL_0ef2:  ldc.i4 1
	IL_0ef7:  beq IL_0f01

	IL_0efc:  br IL_0f11

	IL_0f01:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0f06:  stloc 18

	IL_0f0a:  nop 
	IL_0f0b:  nop 
	IL_0f0c:  br IL_0f16

	IL_0f11:  br IL_0f16

	IL_0f16:  ldloc 28

	IL_0f1a:  nop 
	IL_0f1b:  nop 
	IL_0f1c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_0f21:  stloc 10

	IL_0f25:  nop 
	IL_0f26:  nop 
	IL_0f27:  ldloc 10

	IL_0f2b:  nop 
	IL_0f2c:  nop 
	IL_0f2d:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0f32:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0f37:  ldarg 2

	IL_0f3b:  nop 
	IL_0f3c:  nop 
	IL_0f3d:  ldc.i4 1
	IL_0f42:  beq IL_0f4c

	IL_0f47:  br IL_0f6d

	IL_0f4c:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0f51:  stloc 19

	IL_0f55:  nop 
	IL_0f56:  nop 
	IL_0f57:  ldloc 18

	IL_0f5b:  nop 
	IL_0f5c:  nop 
	IL_0f5d:  ldloc 19

	IL_0f61:  nop 
	IL_0f62:  nop 
	IL_0f63:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0f68:  br IL_0f72

	IL_0f6d:  br IL_0f72

	IL_0f72:  br IL_0f7c

	IL_0f77:  br IL_0f7c

	IL_0f7c:  br IL_2cea

	IL_0f81:  br IL_0f8b

	IL_0f86:  br IL_0f8b

	IL_0f8b:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_0f90:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0f95:  stloc 8

	IL_0f99:  nop 
	IL_0f9a:  nop 
	IL_0f9b:  ldloc 8

	IL_0f9f:  nop 
	IL_0fa0:  nop 
	IL_0fa1:  ldarg 1

	IL_0fa5:  nop 
	IL_0fa6:  nop 
	IL_0fa7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0fac:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0fb1:  stloc 9

	IL_0fb5:  nop 
	IL_0fb6:  nop 
	IL_0fb7:  ldloc 9

	IL_0fbb:  nop 
	IL_0fbc:  nop 
	IL_0fbd:  ldc.i4 1
	IL_0fc2:  beq IL_0fcc

	IL_0fc7:  br IL_1dff

	IL_0fcc:  ldarg 1

	IL_0fd0:  nop 
	IL_0fd1:  nop 
	IL_0fd2:  stloc 41

	IL_0fd6:  nop 
	IL_0fd7:  nop 
	IL_0fd8:  ldloc 41

	IL_0fdc:  nop 
	IL_0fdd:  nop 
	IL_0fde:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0fe3:  stloc 42

	IL_0fe7:  nop 
	IL_0fe8:  nop 
	IL_0fe9:  ldstr ""
	IL_0fee:  stloc 43

	IL_0ff2:  nop 
	IL_0ff3:  nop 
	IL_0ff4:  ldc.i4 0
	IL_0ff9:  conv.u 
	IL_0ffa:  newarr [mscorlib]System.Type
	IL_0fff:  stloc 45

	IL_1003:  nop 
	IL_1004:  nop 
	IL_1005:  ldc.i4 0
	IL_100a:  stloc 54

	IL_100e:  nop 
	IL_100f:  nop 
	IL_1010:  ldc.i4 0
	IL_1015:  stloc 55

	IL_1019:  nop 
	IL_101a:  nop 
	IL_101b:  ldc.i4 2
	IL_1020:  stloc 56

	IL_1024:  nop 
	IL_1025:  nop 
	IL_1026:  ldloc 42

	IL_102a:  nop 
	IL_102b:  nop 
	IL_102c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1031:  stloc 43

	IL_1035:  nop 
	IL_1036:  nop 
	IL_1037:  ldloc 43

	IL_103b:  nop 
	IL_103c:  nop 
	IL_103d:  ldstr ":"
	IL_1042:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_1047:  stloc 38

	IL_104b:  nop 
	IL_104c:  nop 
	IL_104d:  ldloc 41

	IL_1051:  nop 
	IL_1052:  nop 
	IL_1053:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_1058:  stloc 44

	IL_105c:  nop 
	IL_105d:  nop 
	IL_105e:  ldloc 44

	IL_1062:  nop 
	IL_1063:  nop 
	IL_1064:  ldlen 
	IL_1065:  conv.i4 
	IL_1066:  ldc.i4 1
	IL_106b:  sub 
	IL_106c:  stloc 47

	IL_1070:  nop 
	IL_1071:  nop 
	IL_1072:  ldc.i4 0
	IL_1077:  stloc 26

	IL_107b:  nop 
	IL_107c:  nop 
	IL_107d:  ldc.i4 0
	IL_1082:  stloc 27

	IL_1086:  nop 
	IL_1087:  nop 
	IL_1088:  ldnull 
	IL_1089:  stloc 37

	IL_108d:  nop 
	IL_108e:  nop 
	IL_108f:  ldnull 
	IL_1090:  stloc 39

	IL_1094:  nop 
	IL_1095:  nop 
	IL_1096:  ldnull 
	IL_1097:  stloc 52

	IL_109b:  nop 
	IL_109c:  nop 
	IL_109d:  ldloc 43

	IL_10a1:  nop 
	IL_10a2:  nop 
	IL_10a3:  ldstr "me::ctor"
	IL_10a8:  call int32 string::Compare(string, string)
	IL_10ad:  stloc 29

	IL_10b1:  nop 
	IL_10b2:  nop 
	IL_10b3:  ldloc 29

	IL_10b7:  nop 
	IL_10b8:  nop 
	IL_10b9:  ldc.i4 0
	IL_10be:  beq IL_10c8

	IL_10c3:  br IL_10d8

	IL_10c8:  ldc.i4 1
	IL_10cd:  stloc 55

	IL_10d1:  nop 
	IL_10d2:  nop 
	IL_10d3:  br IL_10dd

	IL_10d8:  br IL_10dd

	IL_10dd:  ldc.i4 -1
	IL_10e2:  stloc 11

	IL_10e6:  nop 
	IL_10e7:  nop 
	IL_10e8:  ldloc 43

	IL_10ec:  nop 
	IL_10ed:  nop 
	IL_10ee:  ldstr ":"
	IL_10f3:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_10f8:  stloc 38

	IL_10fc:  nop 
	IL_10fd:  nop 
	IL_10fe:  ldloc 38

	IL_1102:  nop 
	IL_1103:  nop 
	IL_1104:  ldlen 
	IL_1105:  conv.i4 
	IL_1106:  ldc.i4 2
	IL_110b:  sub 
	IL_110c:  stloc 13

	IL_1110:  nop 
	IL_1111:  nop 
	IL_1112:  ldloc 38

	IL_1116:  nop 
	IL_1117:  nop 
	IL_1118:  ldc.i4 0
	IL_111d:  conv.u 
	IL_111e:  ldelem [mscorlib]System.String
	IL_1123:  ldstr "me"
	IL_1128:  call int32 string::Compare(string, string)
	IL_112d:  stloc 29

	IL_1131:  nop 
	IL_1132:  nop 
	IL_1133:  ldloc 29

	IL_1137:  nop 
	IL_1138:  nop 
	IL_1139:  ldc.i4 0
	IL_113e:  beq IL_1148

	IL_1143:  br IL_1175

	IL_1148:  ldloc 11

	IL_114c:  nop 
	IL_114d:  nop 
	IL_114e:  ldc.i4 1
	IL_1153:  add 
	IL_1154:  stloc 11

	IL_1158:  nop 
	IL_1159:  nop 
	IL_115a:  ldc.i4 1
	IL_115f:  stloc 26

	IL_1163:  nop 
	IL_1164:  nop 
	IL_1165:  ldc.i4 3
	IL_116a:  stloc 56

	IL_116e:  nop 
	IL_116f:  nop 
	IL_1170:  br IL_117a

	IL_1175:  br IL_117a

	IL_117a:  ldloc 55

	IL_117e:  nop 
	IL_117f:  nop 
	IL_1180:  ldc.i4 0
	IL_1185:  beq IL_118f

	IL_118a:  br IL_16d8

	IL_118f:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_1194:  ldc.i4 1
	IL_1199:  beq IL_11a3

	IL_119e:  br IL_11d3

	IL_11a3:  ldc.i4 0
	IL_11a8:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_11ad:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_11b2:  stloc 37

	IL_11b6:  nop 
	IL_11b7:  nop 
	IL_11b8:  ldc.i4 1
	IL_11bd:  stloc 27

	IL_11c1:  nop 
	IL_11c2:  nop 
	IL_11c3:  ldc.i4 0
	IL_11c8:  stloc 54

	IL_11cc:  nop 
	IL_11cd:  nop 
	IL_11ce:  br IL_11d8

	IL_11d3:  br IL_11d8

	IL_11d8:  ldloc 38

	IL_11dc:  nop 
	IL_11dd:  nop 
	IL_11de:  ldlen 
	IL_11df:  conv.i4 
	IL_11e0:  stloc 29

	IL_11e4:  nop 
	IL_11e5:  nop 
	IL_11e6:  ldloc 29

	IL_11ea:  nop 
	IL_11eb:  nop 
	IL_11ec:  ldloc 56

	IL_11f0:  nop 
	IL_11f1:  nop 
	IL_11f2:  bge IL_11fc

	IL_11f7:  br IL_16ce

	IL_11fc:  ldc.i4 1
	IL_1201:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_1206:  ldloc 11

	IL_120a:  nop 
	IL_120b:  nop 
	IL_120c:  ldc.i4 1
	IL_1211:  add 
	IL_1212:  stloc 11

	IL_1216:  nop 
	IL_1217:  nop 
	IL_1218:  ldloc 27

	IL_121c:  nop 
	IL_121d:  nop 
	IL_121e:  ldc.i4 0
	IL_1223:  beq IL_122d

	IL_1228:  br IL_1566

	IL_122d:  ldloc 26

	IL_1231:  nop 
	IL_1232:  nop 
	IL_1233:  ldc.i4 0
	IL_1238:  beq IL_1242

	IL_123d:  br IL_13e6

	IL_1242:  ldloc 38

	IL_1246:  nop 
	IL_1247:  nop 
	IL_1248:  ldloc 11

	IL_124c:  nop 
	IL_124d:  nop 
	IL_124e:  conv.u 
	IL_124f:  ldelem [mscorlib]System.String
	IL_1254:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_1259:  stloc 53

	IL_125d:  nop 
	IL_125e:  nop 
	IL_125f:  ldloc 53

	IL_1263:  nop 
	IL_1264:  nop 
	IL_1265:  ldnull 
	IL_1266:  beq IL_12e5

	IL_126b:  br IL_1270

	IL_1270:  ldarg 2

	IL_1274:  nop 
	IL_1275:  nop 
	IL_1276:  ldc.i4 1
	IL_127b:  beq IL_1285

	IL_1280:  br IL_12b5

	IL_1285:  ldloc 53

	IL_1289:  nop 
	IL_128a:  nop 
	IL_128b:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_1290:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1295:  ldloc 53

	IL_1299:  nop 
	IL_129a:  nop 
	IL_129b:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_12a0:  ldloc 53

	IL_12a4:  nop 
	IL_12a5:  nop 
	IL_12a6:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_12ab:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_12b0:  br IL_12ba

	IL_12b5:  br IL_12ba

	IL_12ba:  ldloc 53

	IL_12be:  nop 
	IL_12bf:  nop 
	IL_12c0:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_12c5:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_12ca:  ldloc 53

	IL_12ce:  nop 
	IL_12cf:  nop 
	IL_12d0:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_12d5:  stloc 37

	IL_12d9:  nop 
	IL_12da:  nop 
	IL_12db:  br IL_168a

	IL_12e0:  br IL_13e1

	IL_12e5:  ldloc 38

	IL_12e9:  nop 
	IL_12ea:  nop 
	IL_12eb:  ldloc 11

	IL_12ef:  nop 
	IL_12f0:  nop 
	IL_12f1:  conv.u 
	IL_12f2:  ldelem [mscorlib]System.String
	IL_12f7:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_12fc:  stloc 52

	IL_1300:  nop 
	IL_1301:  nop 
	IL_1302:  ldloc 52

	IL_1306:  nop 
	IL_1307:  nop 
	IL_1308:  ldnull 
	IL_1309:  beq IL_13d7

	IL_130e:  br IL_1313

	IL_1313:  ldloc 52

	IL_1317:  nop 
	IL_1318:  nop 
	IL_1319:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_131e:  stloc 31

	IL_1322:  nop 
	IL_1323:  nop 
	IL_1324:  ldloc 31

	IL_1328:  nop 
	IL_1329:  nop 
	IL_132a:  ldc.i4 0
	IL_132f:  beq IL_1339

	IL_1334:  br IL_1367

	IL_1339:  ldarg 2

	IL_133d:  nop 
	IL_133e:  nop 
	IL_133f:  ldc.i4 1
	IL_1344:  beq IL_134e

	IL_1349:  br IL_135d

	IL_134e:  ldc.i4 0
	IL_1353:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1358:  br IL_1362

	IL_135d:  br IL_1362

	IL_1362:  br IL_136c

	IL_1367:  br IL_136c

	IL_136c:  ldarg 2

	IL_1370:  nop 
	IL_1371:  nop 
	IL_1372:  ldc.i4 1
	IL_1377:  beq IL_1381

	IL_137c:  br IL_13a7

	IL_1381:  ldloc 52

	IL_1385:  nop 
	IL_1386:  nop 
	IL_1387:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_138c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1391:  ldloc 52

	IL_1395:  nop 
	IL_1396:  nop 
	IL_1397:  ldloc 31

	IL_139b:  nop 
	IL_139c:  nop 
	IL_139d:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_13a2:  br IL_13ac

	IL_13a7:  br IL_13ac

	IL_13ac:  ldloc 52

	IL_13b0:  nop 
	IL_13b1:  nop 
	IL_13b2:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_13b7:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_13bc:  ldloc 52

	IL_13c0:  nop 
	IL_13c1:  nop 
	IL_13c2:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_13c7:  stloc 37

	IL_13cb:  nop 
	IL_13cc:  nop 
	IL_13cd:  br IL_168a

	IL_13d2:  br IL_13dc

	IL_13d7:  br IL_13dc

	IL_13dc:  br IL_13e1

	IL_13e1:  br IL_14e2

	IL_13e6:  ldloc 38

	IL_13ea:  nop 
	IL_13eb:  nop 
	IL_13ec:  ldloc 11

	IL_13f0:  nop 
	IL_13f1:  nop 
	IL_13f2:  conv.u 
	IL_13f3:  ldelem [mscorlib]System.String
	IL_13f8:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_13fd:  stloc 52

	IL_1401:  nop 
	IL_1402:  nop 
	IL_1403:  ldloc 52

	IL_1407:  nop 
	IL_1408:  nop 
	IL_1409:  ldnull 
	IL_140a:  beq IL_14d8

	IL_140f:  br IL_1414

	IL_1414:  ldloc 52

	IL_1418:  nop 
	IL_1419:  nop 
	IL_141a:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_141f:  stloc 31

	IL_1423:  nop 
	IL_1424:  nop 
	IL_1425:  ldloc 31

	IL_1429:  nop 
	IL_142a:  nop 
	IL_142b:  ldc.i4 0
	IL_1430:  beq IL_143a

	IL_1435:  br IL_1468

	IL_143a:  ldarg 2

	IL_143e:  nop 
	IL_143f:  nop 
	IL_1440:  ldc.i4 1
	IL_1445:  beq IL_144f

	IL_144a:  br IL_145e

	IL_144f:  ldc.i4 0
	IL_1454:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1459:  br IL_1463

	IL_145e:  br IL_1463

	IL_1463:  br IL_146d

	IL_1468:  br IL_146d

	IL_146d:  ldarg 2

	IL_1471:  nop 
	IL_1472:  nop 
	IL_1473:  ldc.i4 1
	IL_1478:  beq IL_1482

	IL_147d:  br IL_14a8

	IL_1482:  ldloc 52

	IL_1486:  nop 
	IL_1487:  nop 
	IL_1488:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_148d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1492:  ldloc 52

	IL_1496:  nop 
	IL_1497:  nop 
	IL_1498:  ldloc 31

	IL_149c:  nop 
	IL_149d:  nop 
	IL_149e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_14a3:  br IL_14ad

	IL_14a8:  br IL_14ad

	IL_14ad:  ldloc 52

	IL_14b1:  nop 
	IL_14b2:  nop 
	IL_14b3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_14b8:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_14bd:  ldloc 52

	IL_14c1:  nop 
	IL_14c2:  nop 
	IL_14c3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_14c8:  stloc 37

	IL_14cc:  nop 
	IL_14cd:  nop 
	IL_14ce:  br IL_168a

	IL_14d3:  br IL_14dd

	IL_14d8:  br IL_14dd

	IL_14dd:  br IL_14e2

	IL_14e2:  ldloc 38

	IL_14e6:  nop 
	IL_14e7:  nop 
	IL_14e8:  ldloc 11

	IL_14ec:  nop 
	IL_14ed:  nop 
	IL_14ee:  conv.u 
	IL_14ef:  ldelem [mscorlib]System.String
	IL_14f4:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_14f9:  stloc 37

	IL_14fd:  nop 
	IL_14fe:  nop 
	IL_14ff:  ldc.i4 1
	IL_1504:  stloc 54

	IL_1508:  nop 
	IL_1509:  nop 
	IL_150a:  ldloc 37

	IL_150e:  nop 
	IL_150f:  nop 
	IL_1510:  ldnull 
	IL_1511:  beq IL_151b

	IL_1516:  br IL_155c

	IL_151b:  ldstr "Variable or Class '"
	IL_1520:  ldloc 38

	IL_1524:  nop 
	IL_1525:  nop 
	IL_1526:  ldloc 11

	IL_152a:  nop 
	IL_152b:  nop 
	IL_152c:  conv.u 
	IL_152d:  ldelem [mscorlib]System.String
	IL_1532:  ldstr "' is not defined."
	IL_1537:  call string string::Concat(string, string, string)
	IL_153c:  stloc 17

	IL_1540:  nop 
	IL_1541:  nop 
	IL_1542:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_1547:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_154c:  ldloc 17

	IL_1550:  nop 
	IL_1551:  nop 
	IL_1552:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_1557:  br IL_1561

	IL_155c:  br IL_1561

	IL_1561:  br IL_168a

	IL_1566:  ldloc 37

	IL_156a:  nop 
	IL_156b:  nop 
	IL_156c:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1571:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_1576:  stloc 9

	IL_157a:  nop 
	IL_157b:  nop 
	IL_157c:  ldloc 9

	IL_1580:  nop 
	IL_1581:  nop 
	IL_1582:  ldc.i4 0
	IL_1587:  beq IL_1591

	IL_158c:  br IL_15d8

	IL_1591:  ldloc 37

	IL_1595:  nop 
	IL_1596:  nop 
	IL_1597:  ldloc 38

	IL_159b:  nop 
	IL_159c:  nop 
	IL_159d:  ldloc 11

	IL_15a1:  nop 
	IL_15a2:  nop 
	IL_15a3:  conv.u 
	IL_15a4:  ldelem [mscorlib]System.String
	IL_15a9:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_15ae:  stloc 52

	IL_15b2:  nop 
	IL_15b3:  nop 
	IL_15b4:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_15b9:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_15be:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_15c3:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_15c8:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_15cd:  stloc 37

	IL_15d1:  nop 
	IL_15d2:  nop 
	IL_15d3:  br IL_162b

	IL_15d8:  ldloc 38

	IL_15dc:  nop 
	IL_15dd:  nop 
	IL_15de:  ldloc 11

	IL_15e2:  nop 
	IL_15e3:  nop 
	IL_15e4:  conv.u 
	IL_15e5:  ldelem [mscorlib]System.String
	IL_15ea:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_15ef:  stloc 52

	IL_15f3:  nop 
	IL_15f4:  nop 
	IL_15f5:  ldloc 52

	IL_15f9:  nop 
	IL_15fa:  nop 
	IL_15fb:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1600:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1605:  ldloc 52

	IL_1609:  nop 
	IL_160a:  nop 
	IL_160b:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1610:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1615:  ldloc 52

	IL_1619:  nop 
	IL_161a:  nop 
	IL_161b:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1620:  stloc 37

	IL_1624:  nop 
	IL_1625:  nop 
	IL_1626:  br IL_162b

	IL_162b:  ldarg 2

	IL_162f:  nop 
	IL_1630:  nop 
	IL_1631:  ldc.i4 1
	IL_1636:  beq IL_1640

	IL_163b:  br IL_1656

	IL_1640:  ldloc 52

	IL_1644:  nop 
	IL_1645:  nop 
	IL_1646:  ldloc 54

	IL_164a:  nop 
	IL_164b:  nop 
	IL_164c:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_1651:  br IL_165b

	IL_1656:  br IL_165b

	IL_165b:  ldloc 54

	IL_165f:  nop 
	IL_1660:  nop 
	IL_1661:  ldc.i4 1
	IL_1666:  beq IL_1670

	IL_166b:  br IL_1680

	IL_1670:  ldc.i4 0
	IL_1675:  stloc 54

	IL_1679:  nop 
	IL_167a:  nop 
	IL_167b:  br IL_1685

	IL_1680:  br IL_1685

	IL_1685:  br IL_168a

	IL_168a:  ldc.i4 1
	IL_168f:  stloc 27

	IL_1693:  nop 
	IL_1694:  nop 
	IL_1695:  ldloc 11

	IL_1699:  nop 
	IL_169a:  nop 
	IL_169b:  ldloc 13

	IL_169f:  nop 
	IL_16a0:  nop 
	IL_16a1:  beq IL_16ab

	IL_16a6:  br IL_16b5

	IL_16ab:  br IL_16bf

	IL_16b0:  br IL_16bf

	IL_16b5:  br IL_1206

	IL_16ba:  br IL_16bf

	IL_16bf:  ldc.i4 0
	IL_16c4:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_16c9:  br IL_16d3

	IL_16ce:  br IL_16d3

	IL_16d3:  br IL_1706

	IL_16d8:  ldarg 2

	IL_16dc:  nop 
	IL_16dd:  nop 
	IL_16de:  ldc.i4 1
	IL_16e3:  beq IL_16ed

	IL_16e8:  br IL_16fc

	IL_16ed:  ldc.i4 0
	IL_16f2:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_16f7:  br IL_1701

	IL_16fc:  br IL_1701

	IL_1701:  br IL_1706

	IL_1706:  ldloc 11

	IL_170a:  nop 
	IL_170b:  nop 
	IL_170c:  ldc.i4 1
	IL_1711:  add 
	IL_1712:  stloc 11

	IL_1716:  nop 
	IL_1717:  nop 
	IL_1718:  ldloc 55

	IL_171c:  nop 
	IL_171d:  nop 
	IL_171e:  ldc.i4 0
	IL_1723:  beq IL_172d

	IL_1728:  br IL_17de

	IL_172d:  ldloc 27

	IL_1731:  nop 
	IL_1732:  nop 
	IL_1733:  ldc.i4 0
	IL_1738:  beq IL_1742

	IL_173d:  br IL_17d4

	IL_1742:  ldarg 2

	IL_1746:  nop 
	IL_1747:  nop 
	IL_1748:  ldc.i4 1
	IL_174d:  beq IL_1757

	IL_1752:  br IL_17ca

	IL_1757:  ldloc 41

	IL_175b:  nop 
	IL_175c:  nop 
	IL_175d:  ldfld class [mscorlib]System.Type[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::TypArr
	IL_1762:  stloc 45

	IL_1766:  nop 
	IL_1767:  nop 
	IL_1768:  ldloc 38

	IL_176c:  nop 
	IL_176d:  nop 
	IL_176e:  ldloc 11

	IL_1772:  nop 
	IL_1773:  nop 
	IL_1774:  conv.u 
	IL_1775:  ldelem [mscorlib]System.String
	IL_177a:  ldloc 45

	IL_177e:  nop 
	IL_177f:  nop 
	IL_1780:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_1785:  stloc 39

	IL_1789:  nop 
	IL_178a:  nop 
	IL_178b:  ldloc 39

	IL_178f:  nop 
	IL_1790:  nop 
	IL_1791:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_1796:  stloc 54

	IL_179a:  nop 
	IL_179b:  nop 
	IL_179c:  ldloc 54

	IL_17a0:  nop 
	IL_17a1:  nop 
	IL_17a2:  ldc.i4 0
	IL_17a7:  beq IL_17b1

	IL_17ac:  br IL_17c0

	IL_17b1:  ldc.i4 0
	IL_17b6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_17bb:  br IL_17c5

	IL_17c0:  br IL_17c5

	IL_17c5:  br IL_17cf

	IL_17ca:  br IL_17cf

	IL_17cf:  br IL_17d9

	IL_17d4:  br IL_17d9

	IL_17d9:  br IL_17e3

	IL_17de:  br IL_17e3

	IL_17e3:  ldloc 11

	IL_17e7:  nop 
	IL_17e8:  nop 
	IL_17e9:  stloc 12

	IL_17ed:  nop 
	IL_17ee:  nop 
	IL_17ef:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_17f4:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type03
	IL_17f9:  ldc.i4 -1
	IL_17fe:  stloc 11

	IL_1802:  nop 
	IL_1803:  nop 
	IL_1804:  ldc.i4 0
	IL_1809:  conv.u 
	IL_180a:  newarr [mscorlib]System.Type
	IL_180f:  stloc 45

	IL_1813:  nop 
	IL_1814:  nop 
	IL_1815:  ldloc 44

	IL_1819:  nop 
	IL_181a:  nop 
	IL_181b:  ldlen 
	IL_181c:  conv.i4 
	IL_181d:  ldc.i4 0
	IL_1822:  beq IL_182c

	IL_1827:  br IL_1841

	IL_182c:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_1831:  stloc 45

	IL_1835:  nop 
	IL_1836:  nop 
	IL_1837:  br IL_195e

	IL_183c:  br IL_1846

	IL_1841:  br IL_1846

	IL_1846:  ldloc 11

	IL_184a:  nop 
	IL_184b:  nop 
	IL_184c:  ldc.i4 1
	IL_1851:  add 
	IL_1852:  stloc 11

	IL_1856:  nop 
	IL_1857:  nop 
	IL_1858:  ldloc 44

	IL_185c:  nop 
	IL_185d:  nop 
	IL_185e:  ldloc 11

	IL_1862:  nop 
	IL_1863:  nop 
	IL_1864:  conv.u 
	IL_1865:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_186a:  stloc 48

	IL_186e:  nop 
	IL_186f:  nop 
	IL_1870:  ldloc 48

	IL_1874:  nop 
	IL_1875:  nop 
	IL_1876:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_187b:  ldlen 
	IL_187c:  conv.i4 
	IL_187d:  ldc.i4 1
	IL_1882:  beq IL_188c

	IL_1887:  br IL_189d

	IL_188c:  ldloc 48

	IL_1890:  nop 
	IL_1891:  nop 
	IL_1892:  stloc 49

	IL_1896:  nop 
	IL_1897:  nop 
	IL_1898:  br IL_18da

	IL_189d:  ldloc 48

	IL_18a1:  nop 
	IL_18a2:  nop 
	IL_18a3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_18a8:  ldlen 
	IL_18a9:  conv.i4 
	IL_18aa:  ldc.i4 3
	IL_18af:  bge IL_18b9

	IL_18b4:  br IL_18d0

	IL_18b9:  ldarg.0 
	IL_18ba:  ldloc 48

	IL_18be:  nop 
	IL_18bf:  nop 
	IL_18c0:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_18c5:  stloc 49

	IL_18c9:  nop 
	IL_18ca:  nop 
	IL_18cb:  br IL_18d5

	IL_18d0:  br IL_18d5

	IL_18d5:  br IL_18da

	IL_18da:  ldarg.0 
	IL_18db:  ldloc 49

	IL_18df:  nop 
	IL_18e0:  nop 
	IL_18e1:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_18e6:  stloc 50

	IL_18ea:  nop 
	IL_18eb:  nop 
	IL_18ec:  ldarg.0 
	IL_18ed:  ldloc 50

	IL_18f1:  nop 
	IL_18f2:  nop 
	IL_18f3:  ldarg 2

	IL_18f7:  nop 
	IL_18f8:  nop 
	IL_18f9:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_18fe:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1903:  stloc 46

	IL_1907:  nop 
	IL_1908:  nop 
	IL_1909:  ldloc 45

	IL_190d:  nop 
	IL_190e:  nop 
	IL_190f:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1914:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1919:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_191e:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1923:  stloc 45

	IL_1927:  nop 
	IL_1928:  nop 
	IL_1929:  ldloc 46

	IL_192d:  nop 
	IL_192e:  nop 
	IL_192f:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1934:  ldloc 11

	IL_1938:  nop 
	IL_1939:  nop 
	IL_193a:  ldloc 47

	IL_193e:  nop 
	IL_193f:  nop 
	IL_1940:  beq IL_194a

	IL_1945:  br IL_1954

	IL_194a:  br IL_195e

	IL_194f:  br IL_195e

	IL_1954:  br IL_1846

	IL_1959:  br IL_195e

	IL_195e:  ldarg 2

	IL_1962:  nop 
	IL_1963:  nop 
	IL_1964:  ldc.i4 0
	IL_1969:  beq IL_1973

	IL_196e:  br IL_1989

	IL_1973:  ldloc 41

	IL_1977:  nop 
	IL_1978:  nop 
	IL_1979:  ldloc 45

	IL_197d:  nop 
	IL_197e:  nop 
	IL_197f:  stfld class [mscorlib]System.Type[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::TypArr
	IL_1984:  br IL_198e

	IL_1989:  br IL_198e

	IL_198e:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type03
	IL_1993:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1998:  ldloc 12

	IL_199c:  nop 
	IL_199d:  nop 
	IL_199e:  stloc 11

	IL_19a2:  nop 
	IL_19a3:  nop 
	IL_19a4:  ldloc 37

	IL_19a8:  nop 
	IL_19a9:  nop 
	IL_19aa:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type05
	IL_19af:  ldloc 55

	IL_19b3:  nop 
	IL_19b4:  nop 
	IL_19b5:  ldc.i4 0
	IL_19ba:  beq IL_19c4

	IL_19bf:  br IL_1cfa

	IL_19c4:  ldloc 27

	IL_19c8:  nop 
	IL_19c9:  nop 
	IL_19ca:  ldc.i4 1
	IL_19cf:  beq IL_19d9

	IL_19d4:  br IL_1a8a

	IL_19d9:  ldloc 37

	IL_19dd:  nop 
	IL_19de:  nop 
	IL_19df:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_19e4:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_19e9:  stloc 9

	IL_19ed:  nop 
	IL_19ee:  nop 
	IL_19ef:  ldloc 9

	IL_19f3:  nop 
	IL_19f4:  nop 
	IL_19f5:  ldc.i4 0
	IL_19fa:  beq IL_1a04

	IL_19ff:  br IL_1a3c

	IL_1a04:  ldloc 37

	IL_1a08:  nop 
	IL_1a09:  nop 
	IL_1a0a:  ldloc 38

	IL_1a0e:  nop 
	IL_1a0f:  nop 
	IL_1a10:  ldloc 11

	IL_1a14:  nop 
	IL_1a15:  nop 
	IL_1a16:  conv.u 
	IL_1a17:  ldelem [mscorlib]System.String
	IL_1a1c:  ldloc 45

	IL_1a20:  nop 
	IL_1a21:  nop 
	IL_1a22:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadMethod(class [mscorlib]System.Type, string, class [mscorlib]System.Type[])
	IL_1a27:  stloc 39

	IL_1a2b:  nop 
	IL_1a2c:  nop 
	IL_1a2d:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_1a32:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1a37:  br IL_1a85

	IL_1a3c:  ldloc 38

	IL_1a40:  nop 
	IL_1a41:  nop 
	IL_1a42:  ldloc 11

	IL_1a46:  nop 
	IL_1a47:  nop 
	IL_1a48:  conv.u 
	IL_1a49:  ldelem [mscorlib]System.String
	IL_1a4e:  ldloc 45

	IL_1a52:  nop 
	IL_1a53:  nop 
	IL_1a54:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_1a59:  stloc 39

	IL_1a5d:  nop 
	IL_1a5e:  nop 
	IL_1a5f:  ldloc 39

	IL_1a63:  nop 
	IL_1a64:  nop 
	IL_1a65:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_1a6a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1a6f:  ldloc 39

	IL_1a73:  nop 
	IL_1a74:  nop 
	IL_1a75:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_1a7a:  stloc 54

	IL_1a7e:  nop 
	IL_1a7f:  nop 
	IL_1a80:  br IL_1a85

	IL_1a85:  br IL_1ad3

	IL_1a8a:  ldloc 38

	IL_1a8e:  nop 
	IL_1a8f:  nop 
	IL_1a90:  ldloc 11

	IL_1a94:  nop 
	IL_1a95:  nop 
	IL_1a96:  conv.u 
	IL_1a97:  ldelem [mscorlib]System.String
	IL_1a9c:  ldloc 45

	IL_1aa0:  nop 
	IL_1aa1:  nop 
	IL_1aa2:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_1aa7:  stloc 39

	IL_1aab:  nop 
	IL_1aac:  nop 
	IL_1aad:  ldloc 39

	IL_1ab1:  nop 
	IL_1ab2:  nop 
	IL_1ab3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_1ab8:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1abd:  ldloc 39

	IL_1ac1:  nop 
	IL_1ac2:  nop 
	IL_1ac3:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_1ac8:  stloc 54

	IL_1acc:  nop 
	IL_1acd:  nop 
	IL_1ace:  br IL_1ad3

	IL_1ad3:  ldarg 2

	IL_1ad7:  nop 
	IL_1ad8:  nop 
	IL_1ad9:  ldc.i4 1
	IL_1ade:  beq IL_1ae8

	IL_1ae3:  br IL_1b18

	IL_1ae8:  ldloc 41

	IL_1aec:  nop 
	IL_1aed:  nop 
	IL_1aee:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_1af3:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::PopFlg
	IL_1af8:  ldloc 39

	IL_1afc:  nop 
	IL_1afd:  nop 
	IL_1afe:  ldloc 54

	IL_1b02:  nop 
	IL_1b03:  nop 
	IL_1b04:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitMetCall(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_1b09:  ldc.i4 0
	IL_1b0e:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::PopFlg
	IL_1b13:  br IL_1b1d

	IL_1b18:  br IL_1b1d

	IL_1b1d:  ldloc 41

	IL_1b21:  nop 
	IL_1b22:  nop 
	IL_1b23:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_1b28:  ldc.i4 0
	IL_1b2d:  beq IL_1b37

	IL_1b32:  br IL_1cab

	IL_1b37:  ldloc 42

	IL_1b3b:  nop 
	IL_1b3c:  nop 
	IL_1b3d:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_1b42:  ldc.i4 1
	IL_1b47:  beq IL_1b51

	IL_1b4c:  br IL_1ca1

	IL_1b51:  ldloc 42

	IL_1b55:  nop 
	IL_1b56:  nop 
	IL_1b57:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_1b5c:  call bool class dylan.NET.Tokenizer.CodeGen.Helpers::CheckIfArrLen(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1b61:  stloc 9

	IL_1b65:  nop 
	IL_1b66:  nop 
	IL_1b67:  ldloc 9

	IL_1b6b:  nop 
	IL_1b6c:  nop 
	IL_1b6d:  ldc.i4 1
	IL_1b72:  beq IL_1b7c

	IL_1b77:  br IL_1bb9

	IL_1b7c:  ldarg 2

	IL_1b80:  nop 
	IL_1b81:  nop 
	IL_1b82:  ldc.i4 1
	IL_1b87:  beq IL_1b91

	IL_1b8c:  br IL_1ba0

	IL_1b91:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdlen()
	IL_1b96:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI4()
	IL_1b9b:  br IL_1ba5

	IL_1ba0:  br IL_1ba5

	IL_1ba5:  ldtoken [mscorlib]System.Int32
	IL_1baa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1baf:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1bb4:  br IL_1c9c

	IL_1bb9:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1bbe:  stloc 37

	IL_1bc2:  nop 
	IL_1bc3:  nop 
	IL_1bc4:  ldloc 42

	IL_1bc8:  nop 
	IL_1bc9:  nop 
	IL_1bca:  ldarg.0 
	IL_1bcb:  ldloc 42

	IL_1bcf:  nop 
	IL_1bd0:  nop 
	IL_1bd1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_1bd6:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1bdb:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_1be0:  ldarg.0 
	IL_1be1:  ldloc 42

	IL_1be5:  nop 
	IL_1be6:  nop 
	IL_1be7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_1bec:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1bf1:  starg 1

	IL_1bf5:  nop 
	IL_1bf6:  nop 
	IL_1bf7:  ldarg.0 
	IL_1bf8:  ldarg 1

	IL_1bfc:  nop 
	IL_1bfd:  nop 
	IL_1bfe:  ldarg 2

	IL_1c02:  nop 
	IL_1c03:  nop 
	IL_1c04:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_1c09:  ldloc 37

	IL_1c0d:  nop 
	IL_1c0e:  nop 
	IL_1c0f:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::GetElementType()
	IL_1c14:  stloc 37

	IL_1c18:  nop 
	IL_1c19:  nop 
	IL_1c1a:  ldarg 2

	IL_1c1e:  nop 
	IL_1c1f:  nop 
	IL_1c20:  ldc.i4 1
	IL_1c25:  beq IL_1c2f

	IL_1c2a:  br IL_1c7d

	IL_1c2f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI()
	IL_1c34:  ldloc 42

	IL_1c38:  nop 
	IL_1c39:  nop 
	IL_1c3a:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1c3f:  ldc.i4 1
	IL_1c44:  beq IL_1c4e

	IL_1c49:  br IL_1c68

	IL_1c4e:  ldc.i4 1
	IL_1c53:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_1c58:  ldloc 37

	IL_1c5c:  nop 
	IL_1c5d:  nop 
	IL_1c5e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1c63:  br IL_1c6d

	IL_1c68:  br IL_1c6d

	IL_1c6d:  ldloc 8

	IL_1c71:  nop 
	IL_1c72:  nop 
	IL_1c73:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitElemLd(class [mscorlib]System.Type)
	IL_1c78:  br IL_1c82

	IL_1c7d:  br IL_1c82

	IL_1c82:  ldloc 37

	IL_1c86:  nop 
	IL_1c87:  nop 
	IL_1c88:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1c8d:  ldc.i4 0
	IL_1c92:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_1c97:  br IL_1c9c

	IL_1c9c:  br IL_1ca6

	IL_1ca1:  br IL_1ca6

	IL_1ca6:  br IL_1cb0

	IL_1cab:  br IL_1cb0

	IL_1cb0:  ldloc 42

	IL_1cb4:  nop 
	IL_1cb5:  nop 
	IL_1cb6:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1cbb:  ldc.i4 1
	IL_1cc0:  beq IL_1cca

	IL_1cc5:  br IL_1cf0

	IL_1cca:  ldc.i4 1
	IL_1ccf:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_1cd4:  ldarg.0 
	IL_1cd5:  ldloc 42

	IL_1cd9:  nop 
	IL_1cda:  nop 
	IL_1cdb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_1ce0:  ldarg 2

	IL_1ce4:  nop 
	IL_1ce5:  nop 
	IL_1ce6:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_1ceb:  br IL_1cf5

	IL_1cf0:  br IL_1cf5

	IL_1cf5:  br IL_1d4b

	IL_1cfa:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_1cff:  stloc 37

	IL_1d03:  nop 
	IL_1d04:  nop 
	IL_1d05:  ldloc 37

	IL_1d09:  nop 
	IL_1d0a:  nop 
	IL_1d0b:  ldloc 45

	IL_1d0f:  nop 
	IL_1d10:  nop 
	IL_1d11:  call class [mscorlib]System.Reflection.ConstructorInfo class [dnr]dylan.NET.Reflection.Loader::LoadCtor(class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_1d16:  stloc 51

	IL_1d1a:  nop 
	IL_1d1b:  nop 
	IL_1d1c:  ldarg 2

	IL_1d20:  nop 
	IL_1d21:  nop 
	IL_1d22:  ldc.i4 1
	IL_1d27:  beq IL_1d31

	IL_1d2c:  br IL_1d41

	IL_1d31:  ldloc 51

	IL_1d35:  nop 
	IL_1d36:  nop 
	IL_1d37:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCallCtor(class [mscorlib]System.Reflection.ConstructorInfo)
	IL_1d3c:  br IL_1d46

	IL_1d41:  br IL_1d46

	IL_1d46:  br IL_1d4b

	IL_1d4b:  ldloc 42

	IL_1d4f:  nop 
	IL_1d50:  nop 
	IL_1d51:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_1d56:  ldc.i4 1
	IL_1d5b:  beq IL_1d65

	IL_1d60:  br IL_1df0

	IL_1d65:  ldarg 2

	IL_1d69:  nop 
	IL_1d6a:  nop 
	IL_1d6b:  ldc.i4 1
	IL_1d70:  beq IL_1d7a

	IL_1d75:  br IL_1d8a

	IL_1d7a:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1d7f:  stloc 18

	IL_1d83:  nop 
	IL_1d84:  nop 
	IL_1d85:  br IL_1d8f

	IL_1d8a:  br IL_1d8f

	IL_1d8f:  ldloc 42

	IL_1d93:  nop 
	IL_1d94:  nop 
	IL_1d95:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_1d9a:  stloc 10

	IL_1d9e:  nop 
	IL_1d9f:  nop 
	IL_1da0:  ldloc 10

	IL_1da4:  nop 
	IL_1da5:  nop 
	IL_1da6:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1dab:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1db0:  ldarg 2

	IL_1db4:  nop 
	IL_1db5:  nop 
	IL_1db6:  ldc.i4 1
	IL_1dbb:  beq IL_1dc5

	IL_1dc0:  br IL_1de6

	IL_1dc5:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1dca:  stloc 19

	IL_1dce:  nop 
	IL_1dcf:  nop 
	IL_1dd0:  ldloc 18

	IL_1dd4:  nop 
	IL_1dd5:  nop 
	IL_1dd6:  ldloc 19

	IL_1dda:  nop 
	IL_1ddb:  nop 
	IL_1ddc:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_1de1:  br IL_1deb

	IL_1de6:  br IL_1deb

	IL_1deb:  br IL_1df5

	IL_1df0:  br IL_1df5

	IL_1df5:  br IL_2cea

	IL_1dfa:  br IL_1e04

	IL_1dff:  br IL_1e04

	IL_1e04:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok
	IL_1e09:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1e0e:  stloc 8

	IL_1e12:  nop 
	IL_1e13:  nop 
	IL_1e14:  ldloc 8

	IL_1e18:  nop 
	IL_1e19:  nop 
	IL_1e1a:  ldarg 1

	IL_1e1e:  nop 
	IL_1e1f:  nop 
	IL_1e20:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1e25:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1e2a:  stloc 9

	IL_1e2e:  nop 
	IL_1e2f:  nop 
	IL_1e30:  ldloc 9

	IL_1e34:  nop 
	IL_1e35:  nop 
	IL_1e36:  ldc.i4 1
	IL_1e3b:  beq IL_1e45

	IL_1e40:  br IL_291c

	IL_1e45:  ldarg 1

	IL_1e49:  nop 
	IL_1e4a:  nop 
	IL_1e4b:  stloc 58

	IL_1e4f:  nop 
	IL_1e50:  nop 
	IL_1e51:  ldloc 58

	IL_1e55:  nop 
	IL_1e56:  nop 
	IL_1e57:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Name
	IL_1e5c:  stloc 10

	IL_1e60:  nop 
	IL_1e61:  nop 
	IL_1e62:  ldloc 10

	IL_1e66:  nop 
	IL_1e67:  nop 
	IL_1e68:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1e6d:  stloc 40

	IL_1e71:  nop 
	IL_1e72:  nop 
	IL_1e73:  ldloc 58

	IL_1e77:  nop 
	IL_1e78:  nop 
	IL_1e79:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_1e7e:  stloc 44

	IL_1e82:  nop 
	IL_1e83:  nop 
	IL_1e84:  ldloc 44

	IL_1e88:  nop 
	IL_1e89:  nop 
	IL_1e8a:  ldlen 
	IL_1e8b:  conv.i4 
	IL_1e8c:  ldc.i4 1
	IL_1e91:  sub 
	IL_1e92:  stloc 47

	IL_1e96:  nop 
	IL_1e97:  nop 
	IL_1e98:  ldc.i4 0
	IL_1e9d:  stloc 61

	IL_1ea1:  nop 
	IL_1ea2:  nop 
	IL_1ea3:  ldtoken [mscorlib]System.MulticastDelegate
	IL_1ea8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1ead:  stloc 8

	IL_1eb1:  nop 
	IL_1eb2:  nop 
	IL_1eb3:  ldloc 40

	IL_1eb7:  nop 
	IL_1eb8:  nop 
	IL_1eb9:  ldloc 8

	IL_1ebd:  nop 
	IL_1ebe:  nop 
	IL_1ebf:  callvirt instance bool class [mscorlib]System.Type::IsSubclassOf(class [mscorlib]System.Type)
	IL_1ec4:  stloc 9

	IL_1ec8:  nop 
	IL_1ec9:  nop 
	IL_1eca:  ldloc 9

	IL_1ece:  nop 
	IL_1ecf:  nop 
	IL_1ed0:  ldc.i4 1
	IL_1ed5:  beq IL_1edf

	IL_1eda:  br IL_1f3d

	IL_1edf:  ldc.i4 1
	IL_1ee4:  stloc 61

	IL_1ee8:  nop 
	IL_1ee9:  nop 
	IL_1eea:  ldloc 40

	IL_1eee:  nop 
	IL_1eef:  nop 
	IL_1ef0:  call class [mscorlib]System.Type[] class [dnr]dylan.NET.Reflection.Loader::GetDelegateInvokeParams(class [mscorlib]System.Type)
	IL_1ef5:  stloc 59

	IL_1ef9:  nop 
	IL_1efa:  nop 
	IL_1efb:  ldloc 44

	IL_1eff:  nop 
	IL_1f00:  nop 
	IL_1f01:  ldc.i4 0
	IL_1f06:  conv.u 
	IL_1f07:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1f0c:  stloc 48

	IL_1f10:  nop 
	IL_1f11:  nop 
	IL_1f12:  ldloc 48

	IL_1f16:  nop 
	IL_1f17:  nop 
	IL_1f18:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1f1d:  ldc.i4 0
	IL_1f22:  conv.u 
	IL_1f23:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1f28:  call string class dylan.NET.Tokenizer.CodeGen.Helpers::StripDelMtdName(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_1f2d:  stloc 60

	IL_1f31:  nop 
	IL_1f32:  nop 
	IL_1f33:  br IL_20a7

	IL_1f38:  br IL_1f42

	IL_1f3d:  br IL_1f42

	IL_1f42:  ldloc 44

	IL_1f46:  nop 
	IL_1f47:  nop 
	IL_1f48:  ldlen 
	IL_1f49:  conv.i4 
	IL_1f4a:  ldc.i4 0
	IL_1f4f:  beq IL_1f59

	IL_1f54:  br IL_1f6e

	IL_1f59:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_1f5e:  stloc 45

	IL_1f62:  nop 
	IL_1f63:  nop 
	IL_1f64:  br IL_20a7

	IL_1f69:  br IL_1f84

	IL_1f6e:  ldc.i4 0
	IL_1f73:  conv.u 
	IL_1f74:  newarr [mscorlib]System.Type
	IL_1f79:  stloc 45

	IL_1f7d:  nop 
	IL_1f7e:  nop 
	IL_1f7f:  br IL_1f84

	IL_1f84:  ldc.i4 -1
	IL_1f89:  stloc 11

	IL_1f8d:  nop 
	IL_1f8e:  nop 
	IL_1f8f:  ldloc 11

	IL_1f93:  nop 
	IL_1f94:  nop 
	IL_1f95:  ldc.i4 1
	IL_1f9a:  add 
	IL_1f9b:  stloc 11

	IL_1f9f:  nop 
	IL_1fa0:  nop 
	IL_1fa1:  ldloc 44

	IL_1fa5:  nop 
	IL_1fa6:  nop 
	IL_1fa7:  ldloc 11

	IL_1fab:  nop 
	IL_1fac:  nop 
	IL_1fad:  conv.u 
	IL_1fae:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1fb3:  stloc 48

	IL_1fb7:  nop 
	IL_1fb8:  nop 
	IL_1fb9:  ldloc 48

	IL_1fbd:  nop 
	IL_1fbe:  nop 
	IL_1fbf:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1fc4:  ldlen 
	IL_1fc5:  conv.i4 
	IL_1fc6:  ldc.i4 1
	IL_1fcb:  beq IL_1fd5

	IL_1fd0:  br IL_1fe6

	IL_1fd5:  ldloc 48

	IL_1fd9:  nop 
	IL_1fda:  nop 
	IL_1fdb:  stloc 49

	IL_1fdf:  nop 
	IL_1fe0:  nop 
	IL_1fe1:  br IL_2023

	IL_1fe6:  ldloc 48

	IL_1fea:  nop 
	IL_1feb:  nop 
	IL_1fec:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1ff1:  ldlen 
	IL_1ff2:  conv.i4 
	IL_1ff3:  ldc.i4 3
	IL_1ff8:  bge IL_2002

	IL_1ffd:  br IL_2019

	IL_2002:  ldarg.0 
	IL_2003:  ldloc 48

	IL_2007:  nop 
	IL_2008:  nop 
	IL_2009:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_200e:  stloc 49

	IL_2012:  nop 
	IL_2013:  nop 
	IL_2014:  br IL_201e

	IL_2019:  br IL_201e

	IL_201e:  br IL_2023

	IL_2023:  ldarg.0 
	IL_2024:  ldloc 49

	IL_2028:  nop 
	IL_2029:  nop 
	IL_202a:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_202f:  stloc 50

	IL_2033:  nop 
	IL_2034:  nop 
	IL_2035:  ldarg.0 
	IL_2036:  ldloc 50

	IL_203a:  nop 
	IL_203b:  nop 
	IL_203c:  ldarg 2

	IL_2040:  nop 
	IL_2041:  nop 
	IL_2042:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_2047:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_204c:  stloc 46

	IL_2050:  nop 
	IL_2051:  nop 
	IL_2052:  ldloc 45

	IL_2056:  nop 
	IL_2057:  nop 
	IL_2058:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_205d:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2062:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_2067:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_206c:  stloc 45

	IL_2070:  nop 
	IL_2071:  nop 
	IL_2072:  ldloc 46

	IL_2076:  nop 
	IL_2077:  nop 
	IL_2078:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_207d:  ldloc 11

	IL_2081:  nop 
	IL_2082:  nop 
	IL_2083:  ldloc 47

	IL_2087:  nop 
	IL_2088:  nop 
	IL_2089:  beq IL_2093

	IL_208e:  br IL_209d

	IL_2093:  br IL_20a7

	IL_2098:  br IL_20a7

	IL_209d:  br IL_1f8f

	IL_20a2:  br IL_20a7

	IL_20a7:  ldloc 61

	IL_20ab:  nop 
	IL_20ac:  nop 
	IL_20ad:  ldc.i4 1
	IL_20b2:  beq IL_20bc

	IL_20b7:  br IL_28c1

	IL_20bc:  ldc.i4 2
	IL_20c1:  conv.u 
	IL_20c2:  newarr [mscorlib]System.Type
	IL_20c7:  stloc 45

	IL_20cb:  nop 
	IL_20cc:  nop 
	IL_20cd:  ldloc 45

	IL_20d1:  nop 
	IL_20d2:  nop 
	IL_20d3:  ldc.i4 0
	IL_20d8:  conv.u 
	IL_20d9:  ldtoken [mscorlib]System.Object
	IL_20de:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_20e3:  stelem [mscorlib]System.Type
	IL_20e8:  ldloc 45

	IL_20ec:  nop 
	IL_20ed:  nop 
	IL_20ee:  ldc.i4 1
	IL_20f3:  conv.u 
	IL_20f4:  ldtoken [mscorlib]System.IntPtr
	IL_20f9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_20fe:  stelem [mscorlib]System.Type
	IL_2103:  ldloc 60

	IL_2107:  nop 
	IL_2108:  nop 
	IL_2109:  ldstr ":"
	IL_210e:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_2113:  stloc 38

	IL_2117:  nop 
	IL_2118:  nop 
	IL_2119:  ldc.i4 0
	IL_211e:  stloc 26

	IL_2122:  nop 
	IL_2123:  nop 
	IL_2124:  ldc.i4 0
	IL_2129:  stloc 27

	IL_212d:  nop 
	IL_212e:  nop 
	IL_212f:  ldc.i4 2
	IL_2134:  stloc 56

	IL_2138:  nop 
	IL_2139:  nop 
	IL_213a:  ldnull 
	IL_213b:  stloc 37

	IL_213f:  nop 
	IL_2140:  nop 
	IL_2141:  ldnull 
	IL_2142:  stloc 39

	IL_2146:  nop 
	IL_2147:  nop 
	IL_2148:  ldnull 
	IL_2149:  stloc 52

	IL_214d:  nop 
	IL_214e:  nop 
	IL_214f:  ldc.i4 -1
	IL_2154:  stloc 11

	IL_2158:  nop 
	IL_2159:  nop 
	IL_215a:  ldloc 38

	IL_215e:  nop 
	IL_215f:  nop 
	IL_2160:  ldlen 
	IL_2161:  conv.i4 
	IL_2162:  ldc.i4 2
	IL_2167:  sub 
	IL_2168:  stloc 13

	IL_216c:  nop 
	IL_216d:  nop 
	IL_216e:  ldloc 38

	IL_2172:  nop 
	IL_2173:  nop 
	IL_2174:  ldc.i4 0
	IL_2179:  conv.u 
	IL_217a:  ldelem [mscorlib]System.String
	IL_217f:  ldstr "me"
	IL_2184:  call int32 string::Compare(string, string)
	IL_2189:  stloc 29

	IL_218d:  nop 
	IL_218e:  nop 
	IL_218f:  ldloc 29

	IL_2193:  nop 
	IL_2194:  nop 
	IL_2195:  ldc.i4 0
	IL_219a:  beq IL_21a4

	IL_219f:  br IL_21d1

	IL_21a4:  ldloc 11

	IL_21a8:  nop 
	IL_21a9:  nop 
	IL_21aa:  ldc.i4 1
	IL_21af:  add 
	IL_21b0:  stloc 11

	IL_21b4:  nop 
	IL_21b5:  nop 
	IL_21b6:  ldc.i4 1
	IL_21bb:  stloc 26

	IL_21bf:  nop 
	IL_21c0:  nop 
	IL_21c1:  ldc.i4 3
	IL_21c6:  stloc 56

	IL_21ca:  nop 
	IL_21cb:  nop 
	IL_21cc:  br IL_21d6

	IL_21d1:  br IL_21d6

	IL_21d6:  ldloc 38

	IL_21da:  nop 
	IL_21db:  nop 
	IL_21dc:  ldlen 
	IL_21dd:  conv.i4 
	IL_21de:  stloc 29

	IL_21e2:  nop 
	IL_21e3:  nop 
	IL_21e4:  ldloc 29

	IL_21e8:  nop 
	IL_21e9:  nop 
	IL_21ea:  ldloc 56

	IL_21ee:  nop 
	IL_21ef:  nop 
	IL_21f0:  bge IL_21fa

	IL_21f5:  br IL_26cc

	IL_21fa:  ldc.i4 1
	IL_21ff:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_2204:  ldloc 11

	IL_2208:  nop 
	IL_2209:  nop 
	IL_220a:  ldc.i4 1
	IL_220f:  add 
	IL_2210:  stloc 11

	IL_2214:  nop 
	IL_2215:  nop 
	IL_2216:  ldloc 27

	IL_221a:  nop 
	IL_221b:  nop 
	IL_221c:  ldc.i4 0
	IL_2221:  beq IL_222b

	IL_2226:  br IL_2564

	IL_222b:  ldloc 26

	IL_222f:  nop 
	IL_2230:  nop 
	IL_2231:  ldc.i4 0
	IL_2236:  beq IL_2240

	IL_223b:  br IL_23e4

	IL_2240:  ldloc 38

	IL_2244:  nop 
	IL_2245:  nop 
	IL_2246:  ldloc 11

	IL_224a:  nop 
	IL_224b:  nop 
	IL_224c:  conv.u 
	IL_224d:  ldelem [mscorlib]System.String
	IL_2252:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_2257:  stloc 53

	IL_225b:  nop 
	IL_225c:  nop 
	IL_225d:  ldloc 53

	IL_2261:  nop 
	IL_2262:  nop 
	IL_2263:  ldnull 
	IL_2264:  beq IL_22e3

	IL_2269:  br IL_226e

	IL_226e:  ldarg 2

	IL_2272:  nop 
	IL_2273:  nop 
	IL_2274:  ldc.i4 1
	IL_2279:  beq IL_2283

	IL_227e:  br IL_22b3

	IL_2283:  ldloc 53

	IL_2287:  nop 
	IL_2288:  nop 
	IL_2289:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_228e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_2293:  ldloc 53

	IL_2297:  nop 
	IL_2298:  nop 
	IL_2299:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_229e:  ldloc 53

	IL_22a2:  nop 
	IL_22a3:  nop 
	IL_22a4:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_22a9:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_22ae:  br IL_22b8

	IL_22b3:  br IL_22b8

	IL_22b8:  ldloc 53

	IL_22bc:  nop 
	IL_22bd:  nop 
	IL_22be:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_22c3:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_22c8:  ldloc 53

	IL_22cc:  nop 
	IL_22cd:  nop 
	IL_22ce:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_22d3:  stloc 37

	IL_22d7:  nop 
	IL_22d8:  nop 
	IL_22d9:  br IL_2688

	IL_22de:  br IL_23df

	IL_22e3:  ldloc 38

	IL_22e7:  nop 
	IL_22e8:  nop 
	IL_22e9:  ldloc 11

	IL_22ed:  nop 
	IL_22ee:  nop 
	IL_22ef:  conv.u 
	IL_22f0:  ldelem [mscorlib]System.String
	IL_22f5:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_22fa:  stloc 52

	IL_22fe:  nop 
	IL_22ff:  nop 
	IL_2300:  ldloc 52

	IL_2304:  nop 
	IL_2305:  nop 
	IL_2306:  ldnull 
	IL_2307:  beq IL_23d5

	IL_230c:  br IL_2311

	IL_2311:  ldloc 52

	IL_2315:  nop 
	IL_2316:  nop 
	IL_2317:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_231c:  stloc 31

	IL_2320:  nop 
	IL_2321:  nop 
	IL_2322:  ldloc 31

	IL_2326:  nop 
	IL_2327:  nop 
	IL_2328:  ldc.i4 0
	IL_232d:  beq IL_2337

	IL_2332:  br IL_2365

	IL_2337:  ldarg 2

	IL_233b:  nop 
	IL_233c:  nop 
	IL_233d:  ldc.i4 1
	IL_2342:  beq IL_234c

	IL_2347:  br IL_235b

	IL_234c:  ldc.i4 0
	IL_2351:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_2356:  br IL_2360

	IL_235b:  br IL_2360

	IL_2360:  br IL_236a

	IL_2365:  br IL_236a

	IL_236a:  ldarg 2

	IL_236e:  nop 
	IL_236f:  nop 
	IL_2370:  ldc.i4 1
	IL_2375:  beq IL_237f

	IL_237a:  br IL_23a5

	IL_237f:  ldloc 52

	IL_2383:  nop 
	IL_2384:  nop 
	IL_2385:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_238a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_238f:  ldloc 52

	IL_2393:  nop 
	IL_2394:  nop 
	IL_2395:  ldloc 31

	IL_2399:  nop 
	IL_239a:  nop 
	IL_239b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_23a0:  br IL_23aa

	IL_23a5:  br IL_23aa

	IL_23aa:  ldloc 52

	IL_23ae:  nop 
	IL_23af:  nop 
	IL_23b0:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_23b5:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_23ba:  ldloc 52

	IL_23be:  nop 
	IL_23bf:  nop 
	IL_23c0:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_23c5:  stloc 37

	IL_23c9:  nop 
	IL_23ca:  nop 
	IL_23cb:  br IL_2688

	IL_23d0:  br IL_23da

	IL_23d5:  br IL_23da

	IL_23da:  br IL_23df

	IL_23df:  br IL_24e0

	IL_23e4:  ldloc 38

	IL_23e8:  nop 
	IL_23e9:  nop 
	IL_23ea:  ldloc 11

	IL_23ee:  nop 
	IL_23ef:  nop 
	IL_23f0:  conv.u 
	IL_23f1:  ldelem [mscorlib]System.String
	IL_23f6:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_23fb:  stloc 52

	IL_23ff:  nop 
	IL_2400:  nop 
	IL_2401:  ldloc 52

	IL_2405:  nop 
	IL_2406:  nop 
	IL_2407:  ldnull 
	IL_2408:  beq IL_24d6

	IL_240d:  br IL_2412

	IL_2412:  ldloc 52

	IL_2416:  nop 
	IL_2417:  nop 
	IL_2418:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_241d:  stloc 31

	IL_2421:  nop 
	IL_2422:  nop 
	IL_2423:  ldloc 31

	IL_2427:  nop 
	IL_2428:  nop 
	IL_2429:  ldc.i4 0
	IL_242e:  beq IL_2438

	IL_2433:  br IL_2466

	IL_2438:  ldarg 2

	IL_243c:  nop 
	IL_243d:  nop 
	IL_243e:  ldc.i4 1
	IL_2443:  beq IL_244d

	IL_2448:  br IL_245c

	IL_244d:  ldc.i4 0
	IL_2452:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_2457:  br IL_2461

	IL_245c:  br IL_2461

	IL_2461:  br IL_246b

	IL_2466:  br IL_246b

	IL_246b:  ldarg 2

	IL_246f:  nop 
	IL_2470:  nop 
	IL_2471:  ldc.i4 1
	IL_2476:  beq IL_2480

	IL_247b:  br IL_24a6

	IL_2480:  ldloc 52

	IL_2484:  nop 
	IL_2485:  nop 
	IL_2486:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_248b:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_2490:  ldloc 52

	IL_2494:  nop 
	IL_2495:  nop 
	IL_2496:  ldloc 31

	IL_249a:  nop 
	IL_249b:  nop 
	IL_249c:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_24a1:  br IL_24ab

	IL_24a6:  br IL_24ab

	IL_24ab:  ldloc 52

	IL_24af:  nop 
	IL_24b0:  nop 
	IL_24b1:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_24b6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_24bb:  ldloc 52

	IL_24bf:  nop 
	IL_24c0:  nop 
	IL_24c1:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_24c6:  stloc 37

	IL_24ca:  nop 
	IL_24cb:  nop 
	IL_24cc:  br IL_2688

	IL_24d1:  br IL_24db

	IL_24d6:  br IL_24db

	IL_24db:  br IL_24e0

	IL_24e0:  ldloc 38

	IL_24e4:  nop 
	IL_24e5:  nop 
	IL_24e6:  ldloc 11

	IL_24ea:  nop 
	IL_24eb:  nop 
	IL_24ec:  conv.u 
	IL_24ed:  ldelem [mscorlib]System.String
	IL_24f2:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_24f7:  stloc 37

	IL_24fb:  nop 
	IL_24fc:  nop 
	IL_24fd:  ldc.i4 1
	IL_2502:  stloc 54

	IL_2506:  nop 
	IL_2507:  nop 
	IL_2508:  ldloc 37

	IL_250c:  nop 
	IL_250d:  nop 
	IL_250e:  ldnull 
	IL_250f:  beq IL_2519

	IL_2514:  br IL_255a

	IL_2519:  ldstr "Variable or Class '"
	IL_251e:  ldloc 38

	IL_2522:  nop 
	IL_2523:  nop 
	IL_2524:  ldloc 11

	IL_2528:  nop 
	IL_2529:  nop 
	IL_252a:  conv.u 
	IL_252b:  ldelem [mscorlib]System.String
	IL_2530:  ldstr "' is not defined."
	IL_2535:  call string string::Concat(string, string, string)
	IL_253a:  stloc 17

	IL_253e:  nop 
	IL_253f:  nop 
	IL_2540:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_2545:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_254a:  ldloc 17

	IL_254e:  nop 
	IL_254f:  nop 
	IL_2550:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_2555:  br IL_255f

	IL_255a:  br IL_255f

	IL_255f:  br IL_2688

	IL_2564:  ldloc 37

	IL_2568:  nop 
	IL_2569:  nop 
	IL_256a:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_256f:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_2574:  stloc 9

	IL_2578:  nop 
	IL_2579:  nop 
	IL_257a:  ldloc 9

	IL_257e:  nop 
	IL_257f:  nop 
	IL_2580:  ldc.i4 0
	IL_2585:  beq IL_258f

	IL_258a:  br IL_25d6

	IL_258f:  ldloc 37

	IL_2593:  nop 
	IL_2594:  nop 
	IL_2595:  ldloc 38

	IL_2599:  nop 
	IL_259a:  nop 
	IL_259b:  ldloc 11

	IL_259f:  nop 
	IL_25a0:  nop 
	IL_25a1:  conv.u 
	IL_25a2:  ldelem [mscorlib]System.String
	IL_25a7:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_25ac:  stloc 52

	IL_25b0:  nop 
	IL_25b1:  nop 
	IL_25b2:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_25b7:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_25bc:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_25c1:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_25c6:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_25cb:  stloc 37

	IL_25cf:  nop 
	IL_25d0:  nop 
	IL_25d1:  br IL_2629

	IL_25d6:  ldloc 38

	IL_25da:  nop 
	IL_25db:  nop 
	IL_25dc:  ldloc 11

	IL_25e0:  nop 
	IL_25e1:  nop 
	IL_25e2:  conv.u 
	IL_25e3:  ldelem [mscorlib]System.String
	IL_25e8:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_25ed:  stloc 52

	IL_25f1:  nop 
	IL_25f2:  nop 
	IL_25f3:  ldloc 52

	IL_25f7:  nop 
	IL_25f8:  nop 
	IL_25f9:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_25fe:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2603:  ldloc 52

	IL_2607:  nop 
	IL_2608:  nop 
	IL_2609:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_260e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_2613:  ldloc 52

	IL_2617:  nop 
	IL_2618:  nop 
	IL_2619:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_261e:  stloc 37

	IL_2622:  nop 
	IL_2623:  nop 
	IL_2624:  br IL_2629

	IL_2629:  ldarg 2

	IL_262d:  nop 
	IL_262e:  nop 
	IL_262f:  ldc.i4 1
	IL_2634:  beq IL_263e

	IL_2639:  br IL_2654

	IL_263e:  ldloc 52

	IL_2642:  nop 
	IL_2643:  nop 
	IL_2644:  ldloc 54

	IL_2648:  nop 
	IL_2649:  nop 
	IL_264a:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_264f:  br IL_2659

	IL_2654:  br IL_2659

	IL_2659:  ldloc 54

	IL_265d:  nop 
	IL_265e:  nop 
	IL_265f:  ldc.i4 1
	IL_2664:  beq IL_266e

	IL_2669:  br IL_267e

	IL_266e:  ldc.i4 0
	IL_2673:  stloc 54

	IL_2677:  nop 
	IL_2678:  nop 
	IL_2679:  br IL_2683

	IL_267e:  br IL_2683

	IL_2683:  br IL_2688

	IL_2688:  ldc.i4 1
	IL_268d:  stloc 27

	IL_2691:  nop 
	IL_2692:  nop 
	IL_2693:  ldloc 11

	IL_2697:  nop 
	IL_2698:  nop 
	IL_2699:  ldloc 13

	IL_269d:  nop 
	IL_269e:  nop 
	IL_269f:  beq IL_26a9

	IL_26a4:  br IL_26b3

	IL_26a9:  br IL_26bd

	IL_26ae:  br IL_26bd

	IL_26b3:  br IL_2204

	IL_26b8:  br IL_26bd

	IL_26bd:  ldc.i4 0
	IL_26c2:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_26c7:  br IL_26d1

	IL_26cc:  br IL_26d1

	IL_26d1:  ldloc 11

	IL_26d5:  nop 
	IL_26d6:  nop 
	IL_26d7:  ldc.i4 1
	IL_26dc:  add 
	IL_26dd:  stloc 11

	IL_26e1:  nop 
	IL_26e2:  nop 
	IL_26e3:  ldloc 27

	IL_26e7:  nop 
	IL_26e8:  nop 
	IL_26e9:  ldc.i4 0
	IL_26ee:  beq IL_26f8

	IL_26f3:  br IL_2779

	IL_26f8:  ldarg 2

	IL_26fc:  nop 
	IL_26fd:  nop 
	IL_26fe:  ldc.i4 1
	IL_2703:  beq IL_270d

	IL_2708:  br IL_276f

	IL_270d:  ldloc 38

	IL_2711:  nop 
	IL_2712:  nop 
	IL_2713:  ldloc 11

	IL_2717:  nop 
	IL_2718:  nop 
	IL_2719:  conv.u 
	IL_271a:  ldelem [mscorlib]System.String
	IL_271f:  ldloc 59

	IL_2723:  nop 
	IL_2724:  nop 
	IL_2725:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_272a:  stloc 39

	IL_272e:  nop 
	IL_272f:  nop 
	IL_2730:  ldloc 39

	IL_2734:  nop 
	IL_2735:  nop 
	IL_2736:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_273b:  stloc 54

	IL_273f:  nop 
	IL_2740:  nop 
	IL_2741:  ldloc 54

	IL_2745:  nop 
	IL_2746:  nop 
	IL_2747:  ldc.i4 0
	IL_274c:  beq IL_2756

	IL_2751:  br IL_2765

	IL_2756:  ldc.i4 0
	IL_275b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_2760:  br IL_276a

	IL_2765:  br IL_276a

	IL_276a:  br IL_2774

	IL_276f:  br IL_2774

	IL_2774:  br IL_277e

	IL_2779:  br IL_277e

	IL_277e:  ldloc 27

	IL_2782:  nop 
	IL_2783:  nop 
	IL_2784:  ldc.i4 1
	IL_2789:  beq IL_2793

	IL_278e:  br IL_282a

	IL_2793:  ldloc 37

	IL_2797:  nop 
	IL_2798:  nop 
	IL_2799:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_279e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_27a3:  stloc 9

	IL_27a7:  nop 
	IL_27a8:  nop 
	IL_27a9:  ldloc 9

	IL_27ad:  nop 
	IL_27ae:  nop 
	IL_27af:  ldc.i4 0
	IL_27b4:  beq IL_27be

	IL_27b9:  br IL_27ec

	IL_27be:  ldloc 37

	IL_27c2:  nop 
	IL_27c3:  nop 
	IL_27c4:  ldloc 38

	IL_27c8:  nop 
	IL_27c9:  nop 
	IL_27ca:  ldloc 11

	IL_27ce:  nop 
	IL_27cf:  nop 
	IL_27d0:  conv.u 
	IL_27d1:  ldelem [mscorlib]System.String
	IL_27d6:  ldloc 59

	IL_27da:  nop 
	IL_27db:  nop 
	IL_27dc:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadMethod(class [mscorlib]System.Type, string, class [mscorlib]System.Type[])
	IL_27e1:  stloc 39

	IL_27e5:  nop 
	IL_27e6:  nop 
	IL_27e7:  br IL_2825

	IL_27ec:  ldloc 38

	IL_27f0:  nop 
	IL_27f1:  nop 
	IL_27f2:  ldloc 11

	IL_27f6:  nop 
	IL_27f7:  nop 
	IL_27f8:  conv.u 
	IL_27f9:  ldelem [mscorlib]System.String
	IL_27fe:  ldloc 59

	IL_2802:  nop 
	IL_2803:  nop 
	IL_2804:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_2809:  stloc 39

	IL_280d:  nop 
	IL_280e:  nop 
	IL_280f:  ldloc 39

	IL_2813:  nop 
	IL_2814:  nop 
	IL_2815:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_281a:  stloc 54

	IL_281e:  nop 
	IL_281f:  nop 
	IL_2820:  br IL_2825

	IL_2825:  br IL_2863

	IL_282a:  ldloc 38

	IL_282e:  nop 
	IL_282f:  nop 
	IL_2830:  ldloc 11

	IL_2834:  nop 
	IL_2835:  nop 
	IL_2836:  conv.u 
	IL_2837:  ldelem [mscorlib]System.String
	IL_283c:  ldloc 59

	IL_2840:  nop 
	IL_2841:  nop 
	IL_2842:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_2847:  stloc 39

	IL_284b:  nop 
	IL_284c:  nop 
	IL_284d:  ldloc 39

	IL_2851:  nop 
	IL_2852:  nop 
	IL_2853:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_2858:  stloc 54

	IL_285c:  nop 
	IL_285d:  nop 
	IL_285e:  br IL_2863

	IL_2863:  ldarg 2

	IL_2867:  nop 
	IL_2868:  nop 
	IL_2869:  ldc.i4 1
	IL_286e:  beq IL_2878

	IL_2873:  br IL_28b7

	IL_2878:  ldloc 54

	IL_287c:  nop 
	IL_287d:  nop 
	IL_287e:  ldc.i4 1
	IL_2883:  beq IL_288d

	IL_2888:  br IL_2897

	IL_288d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdnull()
	IL_2892:  br IL_28a1

	IL_2897:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitDup()
	IL_289c:  br IL_28a1

	IL_28a1:  ldloc 39

	IL_28a5:  nop 
	IL_28a6:  nop 
	IL_28a7:  ldloc 54

	IL_28ab:  nop 
	IL_28ac:  nop 
	IL_28ad:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitPtrLd(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_28b2:  br IL_28bc

	IL_28b7:  br IL_28bc

	IL_28bc:  br IL_28c6

	IL_28c1:  br IL_28c6

	IL_28c6:  ldloc 40

	IL_28ca:  nop 
	IL_28cb:  nop 
	IL_28cc:  ldloc 45

	IL_28d0:  nop 
	IL_28d1:  nop 
	IL_28d2:  call class [mscorlib]System.Reflection.ConstructorInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocCtor(class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_28d7:  stloc 51

	IL_28db:  nop 
	IL_28dc:  nop 
	IL_28dd:  ldarg 2

	IL_28e1:  nop 
	IL_28e2:  nop 
	IL_28e3:  ldc.i4 1
	IL_28e8:  beq IL_28f2

	IL_28ed:  br IL_2902

	IL_28f2:  ldloc 51

	IL_28f6:  nop 
	IL_28f7:  nop 
	IL_28f8:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNewobj(class [mscorlib]System.Reflection.ConstructorInfo)
	IL_28fd:  br IL_2907

	IL_2902:  br IL_2907

	IL_2907:  ldloc 40

	IL_290b:  nop 
	IL_290c:  nop 
	IL_290d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2912:  br IL_2cea

	IL_2917:  br IL_2921

	IL_291c:  br IL_2921

	IL_2921:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok
	IL_2926:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_292b:  stloc 8

	IL_292f:  nop 
	IL_2930:  nop 
	IL_2931:  ldloc 8

	IL_2935:  nop 
	IL_2936:  nop 
	IL_2937:  ldarg 1

	IL_293b:  nop 
	IL_293c:  nop 
	IL_293d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_2942:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2947:  stloc 9

	IL_294b:  nop 
	IL_294c:  nop 
	IL_294d:  ldloc 9

	IL_2951:  nop 
	IL_2952:  nop 
	IL_2953:  ldc.i4 1
	IL_2958:  beq IL_2962

	IL_295d:  br IL_2a62

	IL_2962:  ldarg 2

	IL_2966:  nop 
	IL_2967:  nop 
	IL_2968:  ldc.i4 1
	IL_296d:  beq IL_2977

	IL_2972:  br IL_2a44

	IL_2977:  ldarg 1

	IL_297b:  nop 
	IL_297c:  nop 
	IL_297d:  stloc 62

	IL_2981:  nop 
	IL_2982:  nop 
	IL_2983:  ldloc 62

	IL_2987:  nop 
	IL_2988:  nop 
	IL_2989:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_298e:  stloc 10

	IL_2992:  nop 
	IL_2993:  nop 
	IL_2994:  ldloc 10

	IL_2998:  nop 
	IL_2999:  nop 
	IL_299a:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_299f:  stloc 8

	IL_29a3:  nop 
	IL_29a4:  nop 
	IL_29a5:  ldloc 8

	IL_29a9:  nop 
	IL_29aa:  nop 
	IL_29ab:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdtoken(class [mscorlib]System.Type)
	IL_29b0:  ldc.i4 0
	IL_29b5:  conv.u 
	IL_29b6:  newarr [mscorlib]System.Type
	IL_29bb:  stloc 45

	IL_29bf:  nop 
	IL_29c0:  nop 
	IL_29c1:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_29c6:  stloc 46

	IL_29ca:  nop 
	IL_29cb:  nop 
	IL_29cc:  ldloc 45

	IL_29d0:  nop 
	IL_29d1:  nop 
	IL_29d2:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_29d7:  ldtoken [mscorlib]System.RuntimeTypeHandle
	IL_29dc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_29e1:  stloc 8

	IL_29e5:  nop 
	IL_29e6:  nop 
	IL_29e7:  ldloc 8

	IL_29eb:  nop 
	IL_29ec:  nop 
	IL_29ed:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_29f2:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_29f7:  stloc 45

	IL_29fb:  nop 
	IL_29fc:  nop 
	IL_29fd:  ldloc 46

	IL_2a01:  nop 
	IL_2a02:  nop 
	IL_2a03:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_2a08:  ldtoken [mscorlib]System.Type
	IL_2a0d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2a12:  stloc 8

	IL_2a16:  nop 
	IL_2a17:  nop 
	IL_2a18:  ldloc 8

	IL_2a1c:  nop 
	IL_2a1d:  nop 
	IL_2a1e:  ldstr "GetTypeFromHandle"
	IL_2a23:  ldloc 45

	IL_2a27:  nop 
	IL_2a28:  nop 
	IL_2a29:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_2a2e:  stloc 39

	IL_2a32:  nop 
	IL_2a33:  nop 
	IL_2a34:  ldloc 39

	IL_2a38:  nop 
	IL_2a39:  nop 
	IL_2a3a:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_2a3f:  br IL_2a49

	IL_2a44:  br IL_2a49

	IL_2a49:  ldtoken [mscorlib]System.Type
	IL_2a4e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2a53:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2a58:  br IL_2cea

	IL_2a5d:  br IL_2a67

	IL_2a62:  br IL_2a67

	IL_2a67:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok
	IL_2a6c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2a71:  stloc 8

	IL_2a75:  nop 
	IL_2a76:  nop 
	IL_2a77:  ldloc 8

	IL_2a7b:  nop 
	IL_2a7c:  nop 
	IL_2a7d:  ldarg 1

	IL_2a81:  nop 
	IL_2a82:  nop 
	IL_2a83:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_2a88:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2a8d:  stloc 9

	IL_2a91:  nop 
	IL_2a92:  nop 
	IL_2a93:  ldloc 9

	IL_2a97:  nop 
	IL_2a98:  nop 
	IL_2a99:  ldc.i4 1
	IL_2a9e:  beq IL_2aa8

	IL_2aa3:  br IL_2ae5

	IL_2aa8:  ldarg 2

	IL_2aac:  nop 
	IL_2aad:  nop 
	IL_2aae:  ldc.i4 1
	IL_2ab3:  beq IL_2abd

	IL_2ab8:  br IL_2acc

	IL_2abd:  ldc.i4 0
	IL_2ac2:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_2ac7:  br IL_2ad1

	IL_2acc:  br IL_2ad1

	IL_2ad1:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_2ad6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2adb:  br IL_2cea

	IL_2ae0:  br IL_2aea

	IL_2ae5:  br IL_2aea

	IL_2aea:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok
	IL_2aef:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2af4:  stloc 8

	IL_2af8:  nop 
	IL_2af9:  nop 
	IL_2afa:  ldloc 8

	IL_2afe:  nop 
	IL_2aff:  nop 
	IL_2b00:  ldarg 1

	IL_2b04:  nop 
	IL_2b05:  nop 
	IL_2b06:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_2b0b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2b10:  stloc 9

	IL_2b14:  nop 
	IL_2b15:  nop 
	IL_2b16:  ldloc 9

	IL_2b1a:  nop 
	IL_2b1b:  nop 
	IL_2b1c:  ldc.i4 1
	IL_2b21:  beq IL_2b2b

	IL_2b26:  br IL_2be9

	IL_2b2b:  ldarg 1

	IL_2b2f:  nop 
	IL_2b30:  nop 
	IL_2b31:  stloc 63

	IL_2b35:  nop 
	IL_2b36:  nop 
	IL_2b37:  ldloc 63

	IL_2b3b:  nop 
	IL_2b3c:  nop 
	IL_2b3d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_2b42:  stloc 48

	IL_2b46:  nop 
	IL_2b47:  nop 
	IL_2b48:  ldloc 63

	IL_2b4c:  nop 
	IL_2b4d:  nop 
	IL_2b4e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_2b53:  stloc 10

	IL_2b57:  nop 
	IL_2b58:  nop 
	IL_2b59:  ldloc 10

	IL_2b5d:  nop 
	IL_2b5e:  nop 
	IL_2b5f:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_2b64:  stloc 8

	IL_2b68:  nop 
	IL_2b69:  nop 
	IL_2b6a:  ldarg.0 
	IL_2b6b:  ldloc 48

	IL_2b6f:  nop 
	IL_2b70:  nop 
	IL_2b71:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_2b76:  stloc 48

	IL_2b7a:  nop 
	IL_2b7b:  nop 
	IL_2b7c:  ldarg.0 
	IL_2b7d:  ldloc 48

	IL_2b81:  nop 
	IL_2b82:  nop 
	IL_2b83:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_2b88:  starg 1

	IL_2b8c:  nop 
	IL_2b8d:  nop 
	IL_2b8e:  ldarg.0 
	IL_2b8f:  ldarg 1

	IL_2b93:  nop 
	IL_2b94:  nop 
	IL_2b95:  ldarg 2

	IL_2b99:  nop 
	IL_2b9a:  nop 
	IL_2b9b:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_2ba0:  ldarg 2

	IL_2ba4:  nop 
	IL_2ba5:  nop 
	IL_2ba6:  ldc.i4 1
	IL_2bab:  beq IL_2bb5

	IL_2bb0:  br IL_2bca

	IL_2bb5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI()
	IL_2bba:  ldloc 8

	IL_2bbe:  nop 
	IL_2bbf:  nop 
	IL_2bc0:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNewarr(class [mscorlib]System.Type)
	IL_2bc5:  br IL_2bcf

	IL_2bca:  br IL_2bcf

	IL_2bcf:  ldloc 8

	IL_2bd3:  nop 
	IL_2bd4:  nop 
	IL_2bd5:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeArrayType()
	IL_2bda:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2bdf:  br IL_2cea

	IL_2be4:  br IL_2bee

	IL_2be9:  br IL_2bee

	IL_2bee:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok
	IL_2bf3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2bf8:  stloc 8

	IL_2bfc:  nop 
	IL_2bfd:  nop 
	IL_2bfe:  ldloc 8

	IL_2c02:  nop 
	IL_2c03:  nop 
	IL_2c04:  ldarg 1

	IL_2c08:  nop 
	IL_2c09:  nop 
	IL_2c0a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_2c0f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2c14:  stloc 9

	IL_2c18:  nop 
	IL_2c19:  nop 
	IL_2c1a:  ldloc 9

	IL_2c1e:  nop 
	IL_2c1f:  nop 
	IL_2c20:  ldc.i4 1
	IL_2c25:  beq IL_2c2f

	IL_2c2a:  br IL_2ce5

	IL_2c2f:  ldarg 2

	IL_2c33:  nop 
	IL_2c34:  nop 
	IL_2c35:  ldc.i4 1
	IL_2c3a:  beq IL_2c44

	IL_2c3f:  br IL_2cc7

	IL_2c44:  ldarg 1

	IL_2c48:  nop 
	IL_2c49:  nop 
	IL_2c4a:  stloc 64

	IL_2c4e:  nop 
	IL_2c4f:  nop 
	IL_2c50:  ldloc 64

	IL_2c54:  nop 
	IL_2c55:  nop 
	IL_2c56:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_2c5b:  stloc 42

	IL_2c5f:  nop 
	IL_2c60:  nop 
	IL_2c61:  ldloc 42

	IL_2c65:  nop 
	IL_2c66:  nop 
	IL_2c67:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_2c6c:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMetNoParams(string)
	IL_2c71:  stloc 39

	IL_2c75:  nop 
	IL_2c76:  nop 
	IL_2c77:  ldloc 39

	IL_2c7b:  nop 
	IL_2c7c:  nop 
	IL_2c7d:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_2c82:  stloc 54

	IL_2c86:  nop 
	IL_2c87:  nop 
	IL_2c88:  ldloc 54

	IL_2c8c:  nop 
	IL_2c8d:  nop 
	IL_2c8e:  ldc.i4 0
	IL_2c93:  beq IL_2c9d

	IL_2c98:  br IL_2cac

	IL_2c9d:  ldc.i4 0
	IL_2ca2:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_2ca7:  br IL_2cb1

	IL_2cac:  br IL_2cb1

	IL_2cb1:  ldloc 39

	IL_2cb5:  nop 
	IL_2cb6:  nop 
	IL_2cb7:  ldloc 54

	IL_2cbb:  nop 
	IL_2cbc:  nop 
	IL_2cbd:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitPtrLd(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_2cc2:  br IL_2ccc

	IL_2cc7:  br IL_2ccc

	IL_2ccc:  ldtoken [mscorlib]System.IntPtr
	IL_2cd1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2cd6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2cdb:  br IL_2cea

	IL_2ce0:  br IL_2cea

	IL_2ce5:  br IL_2cea

	IL_2cea:  br IL_2cef

	IL_2cef:  ret 
    } // end of method Evaluator::ASTEmit

    // method line 88
    .method public 
           instance default void Evaluate (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0xb1dc
	// Code size 164 (0xa4)
	.maxstack 10
	.locals init (
		int32	V_0,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_2)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_000b:  ldlen 
	IL_000c:  conv.i4 
	IL_000d:  stloc 0

	IL_0011:  nop 
	IL_0012:  nop 
	IL_0013:  ldloc 0

	IL_0017:  nop 
	IL_0018:  nop 
	IL_0019:  ldc.i4 1
	IL_001e:  beq IL_0028

	IL_0023:  br IL_0039

	IL_0028:  ldarg 1

	IL_002c:  nop 
	IL_002d:  nop 
	IL_002e:  stloc 1

	IL_0032:  nop 
	IL_0033:  nop 
	IL_0034:  br IL_006f

	IL_0039:  ldloc 0

	IL_003d:  nop 
	IL_003e:  nop 
	IL_003f:  ldc.i4 3
	IL_0044:  bge IL_004e

	IL_0049:  br IL_0065

	IL_004e:  ldarg.0 
	IL_004f:  ldarg 1

	IL_0053:  nop 
	IL_0054:  nop 
	IL_0055:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_005a:  stloc 1

	IL_005e:  nop 
	IL_005f:  nop 
	IL_0060:  br IL_006a

	IL_0065:  br IL_006a

	IL_006a:  br IL_006f

	IL_006f:  ldarg.0 
	IL_0070:  ldloc 1

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_007b:  stloc 2

	IL_007f:  nop 
	IL_0080:  nop 
	IL_0081:  ldarg.0 
	IL_0082:  ldloc 2

	IL_0086:  nop 
	IL_0087:  nop 
	IL_0088:  ldc.i4 0
	IL_008d:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_0092:  ldarg.0 
	IL_0093:  ldloc 2

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldc.i4 1
	IL_009e:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_00a3:  ret 
    } // end of method Evaluator::Evaluate

    // method line 89
    .method public 
           instance default void StoreEmit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0xb28c
	// Code size 2273 (0x8e1)
	.maxstack 95
	.locals init (
		int32	V_0,
		int32	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_2,
		string	V_3,
		string[]	V_4,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_5,
		bool	V_6,
		bool	V_7,
		bool	V_8,
		int32	V_9,
		class [mscorlib]System.Type	V_10,
		class [mscorlib]System.Reflection.FieldInfo	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_13,
		class [mscorlib]System.Type	V_14,
		bool	V_15,
		int32	V_16)
	IL_0000:  ldarg 1

	IL_0004:  nop 
	IL_0005:  nop 
	IL_0006:  stloc 2

	IL_000a:  nop 
	IL_000b:  nop 
	IL_000c:  ldloc 2

	IL_0010:  nop 
	IL_0011:  nop 
	IL_0012:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0017:  stloc 3

	IL_001b:  nop 
	IL_001c:  nop 
	IL_001d:  ldc.i4 0
	IL_0022:  stloc 6

	IL_0026:  nop 
	IL_0027:  nop 
	IL_0028:  ldc.i4 0
	IL_002d:  stloc 7

	IL_0031:  nop 
	IL_0032:  nop 
	IL_0033:  ldc.i4 0
	IL_0038:  stloc 8

	IL_003c:  nop 
	IL_003d:  nop 
	IL_003e:  ldc.i4 0
	IL_0043:  stloc 9

	IL_0047:  nop 
	IL_0048:  nop 
	IL_0049:  ldc.i4 2
	IL_004e:  stloc 16

	IL_0052:  nop 
	IL_0053:  nop 
	IL_0054:  ldc.i4 -1
	IL_0059:  stloc 0

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 3

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  ldstr ":"
	IL_006a:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_006f:  stloc 4

	IL_0073:  nop 
	IL_0074:  nop 
	IL_0075:  ldloc 4

	IL_0079:  nop 
	IL_007a:  nop 
	IL_007b:  ldlen 
	IL_007c:  conv.i4 
	IL_007d:  ldc.i4 2
	IL_0082:  sub 
	IL_0083:  stloc 1

	IL_0087:  nop 
	IL_0088:  nop 
	IL_0089:  ldloc 4

	IL_008d:  nop 
	IL_008e:  nop 
	IL_008f:  ldc.i4 0
	IL_0094:  conv.u 
	IL_0095:  ldelem [mscorlib]System.String
	IL_009a:  ldstr "me"
	IL_009f:  call int32 string::Compare(string, string)
	IL_00a4:  stloc 9

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  ldloc 9

	IL_00ae:  nop 
	IL_00af:  nop 
	IL_00b0:  ldc.i4 0
	IL_00b5:  beq IL_00bf

	IL_00ba:  br IL_00ec

	IL_00bf:  ldloc 0

	IL_00c3:  nop 
	IL_00c4:  nop 
	IL_00c5:  ldc.i4 1
	IL_00ca:  add 
	IL_00cb:  stloc 0

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  ldc.i4 1
	IL_00d6:  stloc 6

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldc.i4 3
	IL_00e1:  stloc 16

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  br IL_00f1

	IL_00ec:  br IL_00f1

	IL_00f1:  ldloc 2

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_00fc:  ldc.i4 1
	IL_0101:  beq IL_010b

	IL_0106:  br IL_0134

	IL_010b:  ldloc 16

	IL_010f:  nop 
	IL_0110:  nop 
	IL_0111:  ldc.i4 1
	IL_0116:  sub 
	IL_0117:  stloc 16

	IL_011b:  nop 
	IL_011c:  nop 
	IL_011d:  ldloc 1

	IL_0121:  nop 
	IL_0122:  nop 
	IL_0123:  ldc.i4 1
	IL_0128:  add 
	IL_0129:  stloc 1

	IL_012d:  nop 
	IL_012e:  nop 
	IL_012f:  br IL_0139

	IL_0134:  br IL_0139

	IL_0139:  ldloc 4

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  ldlen 
	IL_0140:  conv.i4 
	IL_0141:  stloc 9

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldloc 9

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldloc 16

	IL_0151:  nop 
	IL_0152:  nop 
	IL_0153:  bge IL_015d

	IL_0158:  br IL_04d4

	IL_015d:  ldc.i4 1
	IL_0162:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0167:  ldloc 0

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  ldc.i4 1
	IL_0172:  add 
	IL_0173:  stloc 0

	IL_0177:  nop 
	IL_0178:  nop 
	IL_0179:  ldloc 7

	IL_017d:  nop 
	IL_017e:  nop 
	IL_017f:  ldc.i4 0
	IL_0184:  beq IL_018e

	IL_0189:  br IL_03a5

	IL_018e:  ldloc 6

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  ldc.i4 0
	IL_0199:  beq IL_01a3

	IL_019e:  br IL_02ca

	IL_01a3:  ldloc 4

	IL_01a7:  nop 
	IL_01a8:  nop 
	IL_01a9:  ldloc 0

	IL_01ad:  nop 
	IL_01ae:  nop 
	IL_01af:  conv.u 
	IL_01b0:  ldelem [mscorlib]System.String
	IL_01b5:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_01ba:  stloc 5

	IL_01be:  nop 
	IL_01bf:  nop 
	IL_01c0:  ldloc 5

	IL_01c4:  nop 
	IL_01c5:  nop 
	IL_01c6:  ldnull 
	IL_01c7:  beq IL_0217

	IL_01cc:  br IL_01d1

	IL_01d1:  ldloc 5

	IL_01d5:  nop 
	IL_01d6:  nop 
	IL_01d7:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_01dc:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_01e1:  ldloc 5

	IL_01e5:  nop 
	IL_01e6:  nop 
	IL_01e7:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_01ec:  ldloc 5

	IL_01f0:  nop 
	IL_01f1:  nop 
	IL_01f2:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_01f7:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_01fc:  ldloc 5

	IL_0200:  nop 
	IL_0201:  nop 
	IL_0202:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_0207:  stloc 10

	IL_020b:  nop 
	IL_020c:  nop 
	IL_020d:  br IL_0490

	IL_0212:  br IL_02c5

	IL_0217:  ldloc 4

	IL_021b:  nop 
	IL_021c:  nop 
	IL_021d:  ldloc 0

	IL_0221:  nop 
	IL_0222:  nop 
	IL_0223:  conv.u 
	IL_0224:  ldelem [mscorlib]System.String
	IL_0229:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_022e:  stloc 11

	IL_0232:  nop 
	IL_0233:  nop 
	IL_0234:  ldloc 11

	IL_0238:  nop 
	IL_0239:  nop 
	IL_023a:  ldnull 
	IL_023b:  beq IL_02bb

	IL_0240:  br IL_0245

	IL_0245:  ldloc 11

	IL_0249:  nop 
	IL_024a:  nop 
	IL_024b:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0250:  stloc 8

	IL_0254:  nop 
	IL_0255:  nop 
	IL_0256:  ldloc 8

	IL_025a:  nop 
	IL_025b:  nop 
	IL_025c:  ldc.i4 0
	IL_0261:  beq IL_026b

	IL_0266:  br IL_027a

	IL_026b:  ldc.i4 0
	IL_0270:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_0275:  br IL_027f

	IL_027a:  br IL_027f

	IL_027f:  ldloc 11

	IL_0283:  nop 
	IL_0284:  nop 
	IL_0285:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_028a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_028f:  ldloc 11

	IL_0293:  nop 
	IL_0294:  nop 
	IL_0295:  ldloc 8

	IL_0299:  nop 
	IL_029a:  nop 
	IL_029b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_02a0:  ldloc 11

	IL_02a4:  nop 
	IL_02a5:  nop 
	IL_02a6:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_02ab:  stloc 10

	IL_02af:  nop 
	IL_02b0:  nop 
	IL_02b1:  br IL_0490

	IL_02b6:  br IL_02c0

	IL_02bb:  br IL_02c0

	IL_02c0:  br IL_02c5

	IL_02c5:  br IL_0378

	IL_02ca:  ldloc 4

	IL_02ce:  nop 
	IL_02cf:  nop 
	IL_02d0:  ldloc 0

	IL_02d4:  nop 
	IL_02d5:  nop 
	IL_02d6:  conv.u 
	IL_02d7:  ldelem [mscorlib]System.String
	IL_02dc:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_02e1:  stloc 11

	IL_02e5:  nop 
	IL_02e6:  nop 
	IL_02e7:  ldloc 11

	IL_02eb:  nop 
	IL_02ec:  nop 
	IL_02ed:  ldnull 
	IL_02ee:  beq IL_036e

	IL_02f3:  br IL_02f8

	IL_02f8:  ldloc 11

	IL_02fc:  nop 
	IL_02fd:  nop 
	IL_02fe:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0303:  stloc 8

	IL_0307:  nop 
	IL_0308:  nop 
	IL_0309:  ldloc 8

	IL_030d:  nop 
	IL_030e:  nop 
	IL_030f:  ldc.i4 0
	IL_0314:  beq IL_031e

	IL_0319:  br IL_032d

	IL_031e:  ldc.i4 0
	IL_0323:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_0328:  br IL_0332

	IL_032d:  br IL_0332

	IL_0332:  ldloc 11

	IL_0336:  nop 
	IL_0337:  nop 
	IL_0338:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_033d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0342:  ldloc 11

	IL_0346:  nop 
	IL_0347:  nop 
	IL_0348:  ldloc 8

	IL_034c:  nop 
	IL_034d:  nop 
	IL_034e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0353:  ldloc 11

	IL_0357:  nop 
	IL_0358:  nop 
	IL_0359:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_035e:  stloc 10

	IL_0362:  nop 
	IL_0363:  nop 
	IL_0364:  br IL_0490

	IL_0369:  br IL_0373

	IL_036e:  br IL_0373

	IL_0373:  br IL_0378

	IL_0378:  ldloc 4

	IL_037c:  nop 
	IL_037d:  nop 
	IL_037e:  ldloc 0

	IL_0382:  nop 
	IL_0383:  nop 
	IL_0384:  conv.u 
	IL_0385:  ldelem [mscorlib]System.String
	IL_038a:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_038f:  stloc 10

	IL_0393:  nop 
	IL_0394:  nop 
	IL_0395:  ldc.i4 1
	IL_039a:  stloc 8

	IL_039e:  nop 
	IL_039f:  nop 
	IL_03a0:  br IL_0490

	IL_03a5:  ldloc 10

	IL_03a9:  nop 
	IL_03aa:  nop 
	IL_03ab:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_03b0:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_03b5:  stloc 15

	IL_03b9:  nop 
	IL_03ba:  nop 
	IL_03bb:  ldloc 15

	IL_03bf:  nop 
	IL_03c0:  nop 
	IL_03c1:  ldc.i4 0
	IL_03c6:  beq IL_03d0

	IL_03cb:  br IL_040d

	IL_03d0:  ldloc 10

	IL_03d4:  nop 
	IL_03d5:  nop 
	IL_03d6:  ldloc 4

	IL_03da:  nop 
	IL_03db:  nop 
	IL_03dc:  ldloc 0

	IL_03e0:  nop 
	IL_03e1:  nop 
	IL_03e2:  conv.u 
	IL_03e3:  ldelem [mscorlib]System.String
	IL_03e8:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_03ed:  stloc 11

	IL_03f1:  nop 
	IL_03f2:  nop 
	IL_03f3:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_03f8:  stloc 10

	IL_03fc:  nop 
	IL_03fd:  nop 
	IL_03fe:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0403:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0408:  br IL_0450

	IL_040d:  ldloc 4

	IL_0411:  nop 
	IL_0412:  nop 
	IL_0413:  ldloc 0

	IL_0417:  nop 
	IL_0418:  nop 
	IL_0419:  conv.u 
	IL_041a:  ldelem [mscorlib]System.String
	IL_041f:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0424:  stloc 11

	IL_0428:  nop 
	IL_0429:  nop 
	IL_042a:  ldloc 11

	IL_042e:  nop 
	IL_042f:  nop 
	IL_0430:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0435:  stloc 10

	IL_0439:  nop 
	IL_043a:  nop 
	IL_043b:  ldloc 11

	IL_043f:  nop 
	IL_0440:  nop 
	IL_0441:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0446:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_044b:  br IL_0450

	IL_0450:  ldloc 11

	IL_0454:  nop 
	IL_0455:  nop 
	IL_0456:  ldloc 8

	IL_045a:  nop 
	IL_045b:  nop 
	IL_045c:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0461:  ldloc 8

	IL_0465:  nop 
	IL_0466:  nop 
	IL_0467:  ldc.i4 1
	IL_046c:  beq IL_0476

	IL_0471:  br IL_0486

	IL_0476:  ldc.i4 0
	IL_047b:  stloc 8

	IL_047f:  nop 
	IL_0480:  nop 
	IL_0481:  br IL_048b

	IL_0486:  br IL_048b

	IL_048b:  br IL_0490

	IL_0490:  ldc.i4 1
	IL_0495:  stloc 7

	IL_0499:  nop 
	IL_049a:  nop 
	IL_049b:  ldloc 0

	IL_049f:  nop 
	IL_04a0:  nop 
	IL_04a1:  ldloc 1

	IL_04a5:  nop 
	IL_04a6:  nop 
	IL_04a7:  beq IL_04b1

	IL_04ac:  br IL_04bb

	IL_04b1:  br IL_04c5

	IL_04b6:  br IL_04c5

	IL_04bb:  br IL_0167

	IL_04c0:  br IL_04c5

	IL_04c5:  ldc.i4 0
	IL_04ca:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_04cf:  br IL_04d9

	IL_04d4:  br IL_04d9

	IL_04d9:  ldloc 2

	IL_04dd:  nop 
	IL_04de:  nop 
	IL_04df:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_04e4:  ldc.i4 1
	IL_04e9:  beq IL_04f3

	IL_04ee:  br IL_04fd

	IL_04f3:  br IL_066e

	IL_04f8:  br IL_0502

	IL_04fd:  br IL_0502

	IL_0502:  ldloc 0

	IL_0506:  nop 
	IL_0507:  nop 
	IL_0508:  ldc.i4 1
	IL_050d:  add 
	IL_050e:  stloc 0

	IL_0512:  nop 
	IL_0513:  nop 
	IL_0514:  ldloc 7

	IL_0518:  nop 
	IL_0519:  nop 
	IL_051a:  ldc.i4 0
	IL_051f:  beq IL_0529

	IL_0524:  br IL_0669

	IL_0529:  ldloc 6

	IL_052d:  nop 
	IL_052e:  nop 
	IL_052f:  ldc.i4 0
	IL_0534:  beq IL_053e

	IL_0539:  br IL_05ed

	IL_053e:  ldloc 4

	IL_0542:  nop 
	IL_0543:  nop 
	IL_0544:  ldloc 0

	IL_0548:  nop 
	IL_0549:  nop 
	IL_054a:  conv.u 
	IL_054b:  ldelem [mscorlib]System.String
	IL_0550:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_0555:  stloc 5

	IL_0559:  nop 
	IL_055a:  nop 
	IL_055b:  ldloc 5

	IL_055f:  nop 
	IL_0560:  nop 
	IL_0561:  ldnull 
	IL_0562:  beq IL_0571

	IL_0567:  br IL_056c

	IL_056c:  br IL_05e8

	IL_0571:  ldloc 4

	IL_0575:  nop 
	IL_0576:  nop 
	IL_0577:  ldloc 0

	IL_057b:  nop 
	IL_057c:  nop 
	IL_057d:  conv.u 
	IL_057e:  ldelem [mscorlib]System.String
	IL_0583:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0588:  stloc 11

	IL_058c:  nop 
	IL_058d:  nop 
	IL_058e:  ldloc 11

	IL_0592:  nop 
	IL_0593:  nop 
	IL_0594:  ldnull 
	IL_0595:  beq IL_05de

	IL_059a:  br IL_059f

	IL_059f:  ldloc 11

	IL_05a3:  nop 
	IL_05a4:  nop 
	IL_05a5:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_05aa:  stloc 8

	IL_05ae:  nop 
	IL_05af:  nop 
	IL_05b0:  ldloc 8

	IL_05b4:  nop 
	IL_05b5:  nop 
	IL_05b6:  ldc.i4 0
	IL_05bb:  beq IL_05c5

	IL_05c0:  br IL_05d4

	IL_05c5:  ldc.i4 0
	IL_05ca:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_05cf:  br IL_05d9

	IL_05d4:  br IL_05d9

	IL_05d9:  br IL_05e3

	IL_05de:  br IL_05e3

	IL_05e3:  br IL_05e8

	IL_05e8:  br IL_0664

	IL_05ed:  ldloc 4

	IL_05f1:  nop 
	IL_05f2:  nop 
	IL_05f3:  ldloc 0

	IL_05f7:  nop 
	IL_05f8:  nop 
	IL_05f9:  conv.u 
	IL_05fa:  ldelem [mscorlib]System.String
	IL_05ff:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0604:  stloc 11

	IL_0608:  nop 
	IL_0609:  nop 
	IL_060a:  ldloc 11

	IL_060e:  nop 
	IL_060f:  nop 
	IL_0610:  ldnull 
	IL_0611:  beq IL_065a

	IL_0616:  br IL_061b

	IL_061b:  ldloc 11

	IL_061f:  nop 
	IL_0620:  nop 
	IL_0621:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0626:  stloc 8

	IL_062a:  nop 
	IL_062b:  nop 
	IL_062c:  ldloc 8

	IL_0630:  nop 
	IL_0631:  nop 
	IL_0632:  ldc.i4 0
	IL_0637:  beq IL_0641

	IL_063c:  br IL_0650

	IL_0641:  ldc.i4 0
	IL_0646:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_064b:  br IL_0655

	IL_0650:  br IL_0655

	IL_0655:  br IL_065f

	IL_065a:  br IL_065f

	IL_065f:  br IL_0664

	IL_0664:  br IL_066e

	IL_0669:  br IL_066e

	IL_066e:  ldloc 2

	IL_0672:  nop 
	IL_0673:  nop 
	IL_0674:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_0679:  ldc.i4 1
	IL_067e:  beq IL_0688

	IL_0683:  br IL_06a3

	IL_0688:  ldarg.0 
	IL_0689:  ldloc 2

	IL_068d:  nop 
	IL_068e:  nop 
	IL_068f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::ArrLoc
	IL_0694:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0699:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI()
	IL_069e:  br IL_06a8

	IL_06a3:  br IL_06a8

	IL_06a8:  ldarg.0 
	IL_06a9:  ldarg 2

	IL_06ad:  nop 
	IL_06ae:  nop 
	IL_06af:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_06b4:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_06b9:  stloc 14

	IL_06bd:  nop 
	IL_06be:  nop 
	IL_06bf:  ldloc 2

	IL_06c3:  nop 
	IL_06c4:  nop 
	IL_06c5:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::IsArr
	IL_06ca:  ldc.i4 1
	IL_06cf:  beq IL_06d9

	IL_06d4:  br IL_06ff

	IL_06d9:  ldloc 10

	IL_06dd:  nop 
	IL_06de:  nop 
	IL_06df:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::GetElementType()
	IL_06e4:  stloc 10

	IL_06e8:  nop 
	IL_06e9:  nop 
	IL_06ea:  ldloc 10

	IL_06ee:  nop 
	IL_06ef:  nop 
	IL_06f0:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStelem(class [mscorlib]System.Type)
	IL_06f5:  br IL_08e0

	IL_06fa:  br IL_0704

	IL_06ff:  br IL_0704

	IL_0704:  ldloc 7

	IL_0708:  nop 
	IL_0709:  nop 
	IL_070a:  ldc.i4 0
	IL_070f:  beq IL_0719

	IL_0714:  br IL_0844

	IL_0719:  ldloc 6

	IL_071d:  nop 
	IL_071e:  nop 
	IL_071f:  ldc.i4 0
	IL_0724:  beq IL_072e

	IL_0729:  br IL_07e0

	IL_072e:  ldloc 4

	IL_0732:  nop 
	IL_0733:  nop 
	IL_0734:  ldloc 0

	IL_0738:  nop 
	IL_0739:  nop 
	IL_073a:  conv.u 
	IL_073b:  ldelem [mscorlib]System.String
	IL_0740:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_0745:  stloc 5

	IL_0749:  nop 
	IL_074a:  nop 
	IL_074b:  ldloc 5

	IL_074f:  nop 
	IL_0750:  nop 
	IL_0751:  ldnull 
	IL_0752:  beq IL_077c

	IL_0757:  br IL_075c

	IL_075c:  ldloc 5

	IL_0760:  nop 
	IL_0761:  nop 
	IL_0762:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_0767:  ldloc 5

	IL_076b:  nop 
	IL_076c:  nop 
	IL_076d:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_0772:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocSt(int32, bool)
	IL_0777:  br IL_07db

	IL_077c:  ldloc 4

	IL_0780:  nop 
	IL_0781:  nop 
	IL_0782:  ldloc 0

	IL_0786:  nop 
	IL_0787:  nop 
	IL_0788:  conv.u 
	IL_0789:  ldelem [mscorlib]System.String
	IL_078e:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0793:  stloc 11

	IL_0797:  nop 
	IL_0798:  nop 
	IL_0799:  ldloc 11

	IL_079d:  nop 
	IL_079e:  nop 
	IL_079f:  ldnull 
	IL_07a0:  beq IL_07d1

	IL_07a5:  br IL_07aa

	IL_07aa:  ldloc 11

	IL_07ae:  nop 
	IL_07af:  nop 
	IL_07b0:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_07b5:  stloc 8

	IL_07b9:  nop 
	IL_07ba:  nop 
	IL_07bb:  ldloc 11

	IL_07bf:  nop 
	IL_07c0:  nop 
	IL_07c1:  ldloc 8

	IL_07c5:  nop 
	IL_07c6:  nop 
	IL_07c7:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_07cc:  br IL_07d6

	IL_07d1:  br IL_07d6

	IL_07d6:  br IL_07db

	IL_07db:  br IL_083f

	IL_07e0:  ldloc 4

	IL_07e4:  nop 
	IL_07e5:  nop 
	IL_07e6:  ldloc 0

	IL_07ea:  nop 
	IL_07eb:  nop 
	IL_07ec:  conv.u 
	IL_07ed:  ldelem [mscorlib]System.String
	IL_07f2:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_07f7:  stloc 11

	IL_07fb:  nop 
	IL_07fc:  nop 
	IL_07fd:  ldloc 11

	IL_0801:  nop 
	IL_0802:  nop 
	IL_0803:  ldnull 
	IL_0804:  beq IL_0835

	IL_0809:  br IL_080e

	IL_080e:  ldloc 11

	IL_0812:  nop 
	IL_0813:  nop 
	IL_0814:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0819:  stloc 8

	IL_081d:  nop 
	IL_081e:  nop 
	IL_081f:  ldloc 11

	IL_0823:  nop 
	IL_0824:  nop 
	IL_0825:  ldloc 8

	IL_0829:  nop 
	IL_082a:  nop 
	IL_082b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0830:  br IL_083a

	IL_0835:  br IL_083a

	IL_083a:  br IL_083f

	IL_083f:  br IL_08e0

	IL_0844:  ldloc 10

	IL_0848:  nop 
	IL_0849:  nop 
	IL_084a:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_084f:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0854:  stloc 15

	IL_0858:  nop 
	IL_0859:  nop 
	IL_085a:  ldloc 15

	IL_085e:  nop 
	IL_085f:  nop 
	IL_0860:  ldc.i4 0
	IL_0865:  beq IL_086f

	IL_086a:  br IL_08a8

	IL_086f:  ldloc 10

	IL_0873:  nop 
	IL_0874:  nop 
	IL_0875:  ldloc 4

	IL_0879:  nop 
	IL_087a:  nop 
	IL_087b:  ldloc 0

	IL_087f:  nop 
	IL_0880:  nop 
	IL_0881:  conv.u 
	IL_0882:  ldelem [mscorlib]System.String
	IL_0887:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_088c:  stloc 11

	IL_0890:  nop 
	IL_0891:  nop 
	IL_0892:  ldloc 11

	IL_0896:  nop 
	IL_0897:  nop 
	IL_0898:  ldloc 8

	IL_089c:  nop 
	IL_089d:  nop 
	IL_089e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_08a3:  br IL_08db

	IL_08a8:  ldloc 4

	IL_08ac:  nop 
	IL_08ad:  nop 
	IL_08ae:  ldloc 0

	IL_08b2:  nop 
	IL_08b3:  nop 
	IL_08b4:  conv.u 
	IL_08b5:  ldelem [mscorlib]System.String
	IL_08ba:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_08bf:  stloc 11

	IL_08c3:  nop 
	IL_08c4:  nop 
	IL_08c5:  ldloc 11

	IL_08c9:  nop 
	IL_08ca:  nop 
	IL_08cb:  ldloc 8

	IL_08cf:  nop 
	IL_08d0:  nop 
	IL_08d1:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_08d6:  br IL_08db

	IL_08db:  br IL_08e0

	IL_08e0:  ret 
    } // end of method Evaluator::StoreEmit

  } // end of class dylan.NET.Tokenizer.CodeGen.Evaluator
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi StmtReader
  	extends [mscorlib]System.Object
  {

    // method line 90
    .method public 
           instance default void Read (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, string fpath)  cil managed 
    {
        // Method begins at RVA 0xbb7c
	// Code size 8995 (0x2323)
	.maxstack 311
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1,
		string	V_2,
		string	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt	V_4,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_5,
		bool	V_6,
		char[]	V_7,
		class [mscorlib]System.Reflection.Assembly	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt	V_10,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_13,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_15,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_16,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt	V_17,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[]	V_18,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_19,
		int32[]	V_20,
		class [mscorlib]System.Version	V_21,
		class [mscorlib]System.Reflection.AssemblyName	V_22,
		class [mscorlib]System.AppDomain	V_23,
		valuetype [mscorlib]System.Reflection.Emit.AssemblyBuilderAccess	V_24,
		string	V_25,
		string	V_26,
		class [mscorlib]System.Reflection.Emit.AssemblyBuilder	V_27,
		class [mscorlib]System.Reflection.Emit.ModuleBuilder	V_28,
		class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter	V_29,
		class [mscorlib]System.Type	V_30,
		valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes	V_31,
		object	V_32,
		class [mscorlib]System.Type	V_33,
		class [mscorlib]System.Type[]	V_34,
		class [mscorlib]System.Reflection.ConstructorInfo	V_35,
		object[]	V_36,
		class [mscorlib]System.Reflection.Emit.CustomAttributeBuilder	V_37,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt	V_38,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt	V_39,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_40,
		valuetype [mscorlib]System.Reflection.TypeAttributes	V_41,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_42,
		string	V_43,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_44,
		class [mscorlib]System.Type	V_45,
		class [mscorlib]System.Type	V_46,
		int32	V_47,
		class [mscorlib]System.Reflection.Emit.ModuleBuilder	V_48,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt	V_50,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_51,
		valuetype [mscorlib]System.Reflection.TypeAttributes	V_52,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_53,
		string	V_54,
		class [mscorlib]System.Type	V_55,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_56,
		valuetype [mscorlib]System.Reflection.MethodAttributes	V_57,
		string	V_58,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_59,
		class [mscorlib]System.Type	V_60,
		class [mscorlib]System.Type[]	V_61,
		valuetype [mscorlib]System.Reflection.CallingConventions	V_62,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_63,
		int32	V_64,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt	V_65,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_66,
		valuetype [mscorlib]System.Reflection.FieldAttributes	V_67,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_68,
		string	V_69,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_70,
		class [mscorlib]System.Type	V_71,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_72,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt	V_73,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_74,
		valuetype [mscorlib]System.Reflection.MethodAttributes	V_75,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_76,
		string	V_77,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_78,
		int32	V_79,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_80,
		class [mscorlib]System.Type	V_81,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_82,
		bool	V_83,
		valuetype [mscorlib]System.Reflection.CallingConventions	V_84,
		int32	V_85,
		int32	V_86,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_88,
		class [mscorlib]System.Type	V_89,
		class dylan.NET.Tokenizer.CodeGen.Evaluator	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt	V_92,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt	V_93,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.NSStmt	V_94,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_95,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt	V_96,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_97,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_98,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt	V_99,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_100,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_101,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_102,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_103,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_104,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt	V_105,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_106,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt	V_107,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_108,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_109,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt	V_110,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt	V_111,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt	V_112)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0015:  ldarg 1

	IL_0019:  nop 
	IL_001a:  nop 
	IL_001b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0020:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_0025:  ldarg 2

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  stsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_0030:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_0035:  ldc.i4 1
	IL_003a:  beq IL_0044

	IL_003f:  br IL_0077

	IL_0044:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_0049:  ldc.i4 1
	IL_004e:  beq IL_0058

	IL_0053:  br IL_006d

	IL_0058:  ldarg 1

	IL_005c:  nop 
	IL_005d:  nop 
	IL_005e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0063:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkDbgPt(int32)
	IL_0068:  br IL_0072

	IL_006d:  br IL_0072

	IL_0072:  br IL_007c

	IL_0077:  br IL_007c

	IL_007c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt
	IL_0081:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0086:  stloc 0

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  ldloc 0

	IL_0090:  nop 
	IL_0091:  nop 
	IL_0092:  ldarg 1

	IL_0096:  nop 
	IL_0097:  nop 
	IL_0098:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_009d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_00a2:  stloc 1

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  ldloc 1

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  ldc.i4 1
	IL_00b3:  beq IL_00bd

	IL_00b8:  br IL_020f

	IL_00bd:  ldarg 1

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  stloc 4

	IL_00c7:  nop 
	IL_00c8:  nop 
	IL_00c9:  ldloc 4

	IL_00cd:  nop 
	IL_00ce:  nop 
	IL_00cf:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt::AsmPath
	IL_00d4:  stloc 5

	IL_00d8:  nop 
	IL_00d9:  nop 
	IL_00da:  ldstr "^"
	IL_00df:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_00e4:  ldstr "(.)*"
	IL_00e9:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_00ee:  call string string::Concat(string, string, string, string)
	IL_00f3:  stloc 2

	IL_00f7:  nop 
	IL_00f8:  nop 
	IL_00f9:  ldloc 2

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  ldstr "$"
	IL_0104:  call string string::Concat(string, string)
	IL_0109:  stloc 2

	IL_010d:  nop 
	IL_010e:  nop 
	IL_010f:  ldloc 5

	IL_0113:  nop 
	IL_0114:  nop 
	IL_0115:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_011a:  ldloc 2

	IL_011e:  nop 
	IL_011f:  nop 
	IL_0120:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_0125:  stloc 6

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  ldloc 6

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  ldc.i4 1
	IL_0136:  beq IL_0140

	IL_013b:  br IL_01aa

	IL_0140:  ldloc 5

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_014b:  stloc 2

	IL_014f:  nop 
	IL_0150:  nop 
	IL_0151:  ldc.i4 1
	IL_0156:  conv.u 
	IL_0157:  newarr [mscorlib]System.Char
	IL_015c:  stloc 7

	IL_0160:  nop 
	IL_0161:  nop 
	IL_0162:  ldloc 7

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  ldc.i4 0
	IL_016d:  conv.u 
	IL_016e:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0173:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0178:  stelem [mscorlib]System.Char
	IL_017d:  ldloc 2

	IL_0181:  nop 
	IL_0182:  nop 
	IL_0183:  ldloc 7

	IL_0187:  nop 
	IL_0188:  nop 
	IL_0189:  callvirt instance string string::Trim(char[])
	IL_018e:  stloc 2

	IL_0192:  nop 
	IL_0193:  nop 
	IL_0194:  ldloc 5

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  ldloc 2

	IL_019e:  nop 
	IL_019f:  nop 
	IL_01a0:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01a5:  br IL_01af

	IL_01aa:  br IL_01af

	IL_01af:  ldloc 5

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  ldloc 5

	IL_01b9:  nop 
	IL_01ba:  nop 
	IL_01bb:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01c0:  call string class [dnu]dylan.NET.Utils.ParseUtils::ProcessMSYSPath(string)
	IL_01c5:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01ca:  ldloc 5

	IL_01ce:  nop 
	IL_01cf:  nop 
	IL_01d0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01d5:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::LoadFrom(string)
	IL_01da:  stloc 8

	IL_01de:  nop 
	IL_01df:  nop 
	IL_01e0:  ldstr "Referencing Assembly: "
	IL_01e5:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_01ea:  ldloc 5

	IL_01ee:  nop 
	IL_01ef:  nop 
	IL_01f0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01f5:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_01fa:  ldloc 8

	IL_01fe:  nop 
	IL_01ff:  nop 
	IL_0200:  call void class [dnr]dylan.NET.Reflection.Importer::AddAsm(class [mscorlib]System.Reflection.Assembly)
	IL_0205:  br IL_2322

	IL_020a:  br IL_0214

	IL_020f:  br IL_0214

	IL_0214:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt
	IL_0219:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_021e:  stloc 0

	IL_0222:  nop 
	IL_0223:  nop 
	IL_0224:  ldloc 0

	IL_0228:  nop 
	IL_0229:  nop 
	IL_022a:  ldarg 1

	IL_022e:  nop 
	IL_022f:  nop 
	IL_0230:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0235:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_023a:  stloc 1

	IL_023e:  nop 
	IL_023f:  nop 
	IL_0240:  ldloc 1

	IL_0244:  nop 
	IL_0245:  nop 
	IL_0246:  ldc.i4 1
	IL_024b:  beq IL_0255

	IL_0250:  br IL_03d3

	IL_0255:  ldarg 1

	IL_0259:  nop 
	IL_025a:  nop 
	IL_025b:  stloc 9

	IL_025f:  nop 
	IL_0260:  nop 
	IL_0261:  ldloc 9

	IL_0265:  nop 
	IL_0266:  nop 
	IL_0267:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefstdasmStmt::AsmPath
	IL_026c:  stloc 5

	IL_0270:  nop 
	IL_0271:  nop 
	IL_0272:  ldstr "^"
	IL_0277:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_027c:  ldstr "(.)*"
	IL_0281:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0286:  call string string::Concat(string, string, string, string)
	IL_028b:  stloc 2

	IL_028f:  nop 
	IL_0290:  nop 
	IL_0291:  ldloc 2

	IL_0295:  nop 
	IL_0296:  nop 
	IL_0297:  ldstr "$"
	IL_029c:  call string string::Concat(string, string)
	IL_02a1:  stloc 2

	IL_02a5:  nop 
	IL_02a6:  nop 
	IL_02a7:  ldloc 5

	IL_02ab:  nop 
	IL_02ac:  nop 
	IL_02ad:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02b2:  ldloc 2

	IL_02b6:  nop 
	IL_02b7:  nop 
	IL_02b8:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_02bd:  stloc 6

	IL_02c1:  nop 
	IL_02c2:  nop 
	IL_02c3:  ldloc 6

	IL_02c7:  nop 
	IL_02c8:  nop 
	IL_02c9:  ldc.i4 1
	IL_02ce:  beq IL_02d8

	IL_02d3:  br IL_0342

	IL_02d8:  ldloc 5

	IL_02dc:  nop 
	IL_02dd:  nop 
	IL_02de:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02e3:  stloc 2

	IL_02e7:  nop 
	IL_02e8:  nop 
	IL_02e9:  ldc.i4 1
	IL_02ee:  conv.u 
	IL_02ef:  newarr [mscorlib]System.Char
	IL_02f4:  stloc 7

	IL_02f8:  nop 
	IL_02f9:  nop 
	IL_02fa:  ldloc 7

	IL_02fe:  nop 
	IL_02ff:  nop 
	IL_0300:  ldc.i4 0
	IL_0305:  conv.u 
	IL_0306:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_030b:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0310:  stelem [mscorlib]System.Char
	IL_0315:  ldloc 2

	IL_0319:  nop 
	IL_031a:  nop 
	IL_031b:  ldloc 7

	IL_031f:  nop 
	IL_0320:  nop 
	IL_0321:  callvirt instance string string::Trim(char[])
	IL_0326:  stloc 2

	IL_032a:  nop 
	IL_032b:  nop 
	IL_032c:  ldloc 5

	IL_0330:  nop 
	IL_0331:  nop 
	IL_0332:  ldloc 2

	IL_0336:  nop 
	IL_0337:  nop 
	IL_0338:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_033d:  br IL_0347

	IL_0342:  br IL_0347

	IL_0347:  ldloc 5

	IL_034b:  nop 
	IL_034c:  nop 
	IL_034d:  ldloc 5

	IL_0351:  nop 
	IL_0352:  nop 
	IL_0353:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0358:  call string class [dnu]dylan.NET.Utils.ParseUtils::ProcessMSYSPath(string)
	IL_035d:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0362:  call string class [mscorlib]System.Runtime.InteropServices.RuntimeEnvironment::GetRuntimeDirectory()
	IL_0367:  stloc 2

	IL_036b:  nop 
	IL_036c:  nop 
	IL_036d:  ldloc 5

	IL_0371:  nop 
	IL_0372:  nop 
	IL_0373:  ldloc 2

	IL_0377:  nop 
	IL_0378:  nop 
	IL_0379:  ldloc 5

	IL_037d:  nop 
	IL_037e:  nop 
	IL_037f:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0384:  call string class [mscorlib]System.IO.Path::Combine(string, string)
	IL_0389:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_038e:  ldloc 5

	IL_0392:  nop 
	IL_0393:  nop 
	IL_0394:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0399:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::LoadFrom(string)
	IL_039e:  stloc 8

	IL_03a2:  nop 
	IL_03a3:  nop 
	IL_03a4:  ldstr "Referencing Assembly: "
	IL_03a9:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_03ae:  ldloc 5

	IL_03b2:  nop 
	IL_03b3:  nop 
	IL_03b4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03b9:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_03be:  ldloc 8

	IL_03c2:  nop 
	IL_03c3:  nop 
	IL_03c4:  call void class [dnr]dylan.NET.Reflection.Importer::AddAsm(class [mscorlib]System.Reflection.Assembly)
	IL_03c9:  br IL_2322

	IL_03ce:  br IL_03d8

	IL_03d3:  br IL_03d8

	IL_03d8:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt
	IL_03dd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03e2:  stloc 0

	IL_03e6:  nop 
	IL_03e7:  nop 
	IL_03e8:  ldloc 0

	IL_03ec:  nop 
	IL_03ed:  nop 
	IL_03ee:  ldarg 1

	IL_03f2:  nop 
	IL_03f3:  nop 
	IL_03f4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_03f9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_03fe:  stloc 1

	IL_0402:  nop 
	IL_0403:  nop 
	IL_0404:  ldloc 1

	IL_0408:  nop 
	IL_0409:  nop 
	IL_040a:  ldc.i4 1
	IL_040f:  beq IL_0419

	IL_0414:  br IL_053f

	IL_0419:  ldarg 1

	IL_041d:  nop 
	IL_041e:  nop 
	IL_041f:  stloc 10

	IL_0423:  nop 
	IL_0424:  nop 
	IL_0425:  ldloc 10

	IL_0429:  nop 
	IL_042a:  nop 
	IL_042b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt::NS
	IL_0430:  stloc 11

	IL_0434:  nop 
	IL_0435:  nop 
	IL_0436:  ldstr "^"
	IL_043b:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0440:  ldstr "(.)*"
	IL_0445:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_044a:  call string string::Concat(string, string, string, string)
	IL_044f:  stloc 2

	IL_0453:  nop 
	IL_0454:  nop 
	IL_0455:  ldloc 2

	IL_0459:  nop 
	IL_045a:  nop 
	IL_045b:  ldstr "$"
	IL_0460:  call string string::Concat(string, string)
	IL_0465:  stloc 2

	IL_0469:  nop 
	IL_046a:  nop 
	IL_046b:  ldloc 11

	IL_046f:  nop 
	IL_0470:  nop 
	IL_0471:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0476:  ldloc 2

	IL_047a:  nop 
	IL_047b:  nop 
	IL_047c:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_0481:  stloc 6

	IL_0485:  nop 
	IL_0486:  nop 
	IL_0487:  ldloc 6

	IL_048b:  nop 
	IL_048c:  nop 
	IL_048d:  ldc.i4 1
	IL_0492:  beq IL_049c

	IL_0497:  br IL_0506

	IL_049c:  ldloc 11

	IL_04a0:  nop 
	IL_04a1:  nop 
	IL_04a2:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_04a7:  stloc 2

	IL_04ab:  nop 
	IL_04ac:  nop 
	IL_04ad:  ldc.i4 1
	IL_04b2:  conv.u 
	IL_04b3:  newarr [mscorlib]System.Char
	IL_04b8:  stloc 7

	IL_04bc:  nop 
	IL_04bd:  nop 
	IL_04be:  ldloc 7

	IL_04c2:  nop 
	IL_04c3:  nop 
	IL_04c4:  ldc.i4 0
	IL_04c9:  conv.u 
	IL_04ca:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_04cf:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_04d4:  stelem [mscorlib]System.Char
	IL_04d9:  ldloc 2

	IL_04dd:  nop 
	IL_04de:  nop 
	IL_04df:  ldloc 7

	IL_04e3:  nop 
	IL_04e4:  nop 
	IL_04e5:  callvirt instance string string::Trim(char[])
	IL_04ea:  stloc 2

	IL_04ee:  nop 
	IL_04ef:  nop 
	IL_04f0:  ldloc 11

	IL_04f4:  nop 
	IL_04f5:  nop 
	IL_04f6:  ldloc 2

	IL_04fa:  nop 
	IL_04fb:  nop 
	IL_04fc:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0501:  br IL_050b

	IL_0506:  br IL_050b

	IL_050b:  ldstr "Importing Namespace: "
	IL_0510:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0515:  ldloc 11

	IL_0519:  nop 
	IL_051a:  nop 
	IL_051b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0520:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0525:  ldloc 11

	IL_0529:  nop 
	IL_052a:  nop 
	IL_052b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0530:  call void class [dnr]dylan.NET.Reflection.Importer::AddImp(string)
	IL_0535:  br IL_2322

	IL_053a:  br IL_0544

	IL_053f:  br IL_0544

	IL_0544:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt
	IL_0549:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_054e:  stloc 0

	IL_0552:  nop 
	IL_0553:  nop 
	IL_0554:  ldloc 0

	IL_0558:  nop 
	IL_0559:  nop 
	IL_055a:  ldarg 1

	IL_055e:  nop 
	IL_055f:  nop 
	IL_0560:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0565:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_056a:  stloc 1

	IL_056e:  nop 
	IL_056f:  nop 
	IL_0570:  ldloc 1

	IL_0574:  nop 
	IL_0575:  nop 
	IL_0576:  ldc.i4 1
	IL_057b:  beq IL_0585

	IL_0580:  br IL_06ab

	IL_0585:  ldarg 1

	IL_0589:  nop 
	IL_058a:  nop 
	IL_058b:  stloc 12

	IL_058f:  nop 
	IL_0590:  nop 
	IL_0591:  ldloc 12

	IL_0595:  nop 
	IL_0596:  nop 
	IL_0597:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt::NS
	IL_059c:  stloc 13

	IL_05a0:  nop 
	IL_05a1:  nop 
	IL_05a2:  ldstr "^"
	IL_05a7:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_05ac:  ldstr "(.)*"
	IL_05b1:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_05b6:  call string string::Concat(string, string, string, string)
	IL_05bb:  stloc 2

	IL_05bf:  nop 
	IL_05c0:  nop 
	IL_05c1:  ldloc 2

	IL_05c5:  nop 
	IL_05c6:  nop 
	IL_05c7:  ldstr "$"
	IL_05cc:  call string string::Concat(string, string)
	IL_05d1:  stloc 2

	IL_05d5:  nop 
	IL_05d6:  nop 
	IL_05d7:  ldloc 13

	IL_05db:  nop 
	IL_05dc:  nop 
	IL_05dd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_05e2:  ldloc 2

	IL_05e6:  nop 
	IL_05e7:  nop 
	IL_05e8:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_05ed:  stloc 6

	IL_05f1:  nop 
	IL_05f2:  nop 
	IL_05f3:  ldloc 6

	IL_05f7:  nop 
	IL_05f8:  nop 
	IL_05f9:  ldc.i4 1
	IL_05fe:  beq IL_0608

	IL_0603:  br IL_0672

	IL_0608:  ldloc 13

	IL_060c:  nop 
	IL_060d:  nop 
	IL_060e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0613:  stloc 2

	IL_0617:  nop 
	IL_0618:  nop 
	IL_0619:  ldc.i4 1
	IL_061e:  conv.u 
	IL_061f:  newarr [mscorlib]System.Char
	IL_0624:  stloc 7

	IL_0628:  nop 
	IL_0629:  nop 
	IL_062a:  ldloc 7

	IL_062e:  nop 
	IL_062f:  nop 
	IL_0630:  ldc.i4 0
	IL_0635:  conv.u 
	IL_0636:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_063b:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0640:  stelem [mscorlib]System.Char
	IL_0645:  ldloc 2

	IL_0649:  nop 
	IL_064a:  nop 
	IL_064b:  ldloc 7

	IL_064f:  nop 
	IL_0650:  nop 
	IL_0651:  callvirt instance string string::Trim(char[])
	IL_0656:  stloc 2

	IL_065a:  nop 
	IL_065b:  nop 
	IL_065c:  ldloc 13

	IL_0660:  nop 
	IL_0661:  nop 
	IL_0662:  ldloc 2

	IL_0666:  nop 
	IL_0667:  nop 
	IL_0668:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_066d:  br IL_0677

	IL_0672:  br IL_0677

	IL_0677:  ldstr "Importing Namespace: "
	IL_067c:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0681:  ldloc 13

	IL_0685:  nop 
	IL_0686:  nop 
	IL_0687:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_068c:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0691:  ldloc 13

	IL_0695:  nop 
	IL_0696:  nop 
	IL_0697:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_069c:  call void class [dnr]dylan.NET.Reflection.Importer::AddLocImp(string)
	IL_06a1:  br IL_2322

	IL_06a6:  br IL_06b0

	IL_06ab:  br IL_06b0

	IL_06b0:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt
	IL_06b5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_06ba:  stloc 0

	IL_06be:  nop 
	IL_06bf:  nop 
	IL_06c0:  ldloc 0

	IL_06c4:  nop 
	IL_06c5:  nop 
	IL_06c6:  ldarg 1

	IL_06ca:  nop 
	IL_06cb:  nop 
	IL_06cc:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_06d1:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_06d6:  stloc 1

	IL_06da:  nop 
	IL_06db:  nop 
	IL_06dc:  ldloc 1

	IL_06e0:  nop 
	IL_06e1:  nop 
	IL_06e2:  ldc.i4 1
	IL_06e7:  beq IL_06f1

	IL_06ec:  br IL_0788

	IL_06f1:  ldarg 1

	IL_06f5:  nop 
	IL_06f6:  nop 
	IL_06f7:  stloc 14

	IL_06fb:  nop 
	IL_06fc:  nop 
	IL_06fd:  ldloc 14

	IL_0701:  nop 
	IL_0702:  nop 
	IL_0703:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::AsmName
	IL_0708:  stloc 15

	IL_070c:  nop 
	IL_070d:  nop 
	IL_070e:  ldloc 15

	IL_0712:  nop 
	IL_0713:  nop 
	IL_0714:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0719:  newobj instance void class [mscorlib]System.Reflection.AssemblyName::'.ctor'(string)
	IL_071e:  stsfld class [mscorlib]System.Reflection.AssemblyName [dnr]dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_0723:  ldloc 14

	IL_0727:  nop 
	IL_0728:  nop 
	IL_0729:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::Mode
	IL_072e:  stloc 16

	IL_0732:  nop 
	IL_0733:  nop 
	IL_0734:  ldloc 16

	IL_0738:  nop 
	IL_0739:  nop 
	IL_073a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_073f:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmMode
	IL_0744:  ldloc 15

	IL_0748:  nop 
	IL_0749:  nop 
	IL_074a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_074f:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::DfltNS
	IL_0754:  ldloc 15

	IL_0758:  nop 
	IL_0759:  nop 
	IL_075a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_075f:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_0764:  ldstr "Beginning Assembly: "
	IL_0769:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_076e:  ldloc 15

	IL_0772:  nop 
	IL_0773:  nop 
	IL_0774:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0779:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_077e:  br IL_2322

	IL_0783:  br IL_078d

	IL_0788:  br IL_078d

	IL_078d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt
	IL_0792:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0797:  stloc 0

	IL_079b:  nop 
	IL_079c:  nop 
	IL_079d:  ldloc 0

	IL_07a1:  nop 
	IL_07a2:  nop 
	IL_07a3:  ldarg 1

	IL_07a7:  nop 
	IL_07a8:  nop 
	IL_07a9:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_07ae:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_07b3:  stloc 1

	IL_07b7:  nop 
	IL_07b8:  nop 
	IL_07b9:  ldloc 1

	IL_07bd:  nop 
	IL_07be:  nop 
	IL_07bf:  ldc.i4 1
	IL_07c4:  beq IL_07ce

	IL_07c9:  br IL_0b5d

	IL_07ce:  ldarg 1

	IL_07d2:  nop 
	IL_07d3:  nop 
	IL_07d4:  stloc 17

	IL_07d8:  nop 
	IL_07d9:  nop 
	IL_07da:  ldloc 17

	IL_07de:  nop 
	IL_07df:  nop 
	IL_07e0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt::VersionNos
	IL_07e5:  stloc 18

	IL_07e9:  nop 
	IL_07ea:  nop 
	IL_07eb:  ldc.i4 4
	IL_07f0:  conv.u 
	IL_07f1:  newarr [mscorlib]System.Int32
	IL_07f6:  stloc 20

	IL_07fa:  nop 
	IL_07fb:  nop 
	IL_07fc:  ldloc 18

	IL_0800:  nop 
	IL_0801:  nop 
	IL_0802:  ldc.i4 0
	IL_0807:  conv.u 
	IL_0808:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_080d:  stloc 19

	IL_0811:  nop 
	IL_0812:  nop 
	IL_0813:  ldloc 20

	IL_0817:  nop 
	IL_0818:  nop 
	IL_0819:  ldc.i4 0
	IL_081e:  conv.u 
	IL_081f:  ldloc 19

	IL_0823:  nop 
	IL_0824:  nop 
	IL_0825:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_082a:  stelem [mscorlib]System.Int32
	IL_082f:  ldloc 18

	IL_0833:  nop 
	IL_0834:  nop 
	IL_0835:  ldc.i4 1
	IL_083a:  conv.u 
	IL_083b:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_0840:  stloc 19

	IL_0844:  nop 
	IL_0845:  nop 
	IL_0846:  ldloc 20

	IL_084a:  nop 
	IL_084b:  nop 
	IL_084c:  ldc.i4 1
	IL_0851:  conv.u 
	IL_0852:  ldloc 19

	IL_0856:  nop 
	IL_0857:  nop 
	IL_0858:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_085d:  stelem [mscorlib]System.Int32
	IL_0862:  ldloc 18

	IL_0866:  nop 
	IL_0867:  nop 
	IL_0868:  ldc.i4 2
	IL_086d:  conv.u 
	IL_086e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_0873:  stloc 19

	IL_0877:  nop 
	IL_0878:  nop 
	IL_0879:  ldloc 20

	IL_087d:  nop 
	IL_087e:  nop 
	IL_087f:  ldc.i4 2
	IL_0884:  conv.u 
	IL_0885:  ldloc 19

	IL_0889:  nop 
	IL_088a:  nop 
	IL_088b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_0890:  stelem [mscorlib]System.Int32
	IL_0895:  ldloc 18

	IL_0899:  nop 
	IL_089a:  nop 
	IL_089b:  ldc.i4 3
	IL_08a0:  conv.u 
	IL_08a1:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_08a6:  stloc 19

	IL_08aa:  nop 
	IL_08ab:  nop 
	IL_08ac:  ldloc 20

	IL_08b0:  nop 
	IL_08b1:  nop 
	IL_08b2:  ldc.i4 3
	IL_08b7:  conv.u 
	IL_08b8:  ldloc 19

	IL_08bc:  nop 
	IL_08bd:  nop 
	IL_08be:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_08c3:  stelem [mscorlib]System.Int32
	IL_08c8:  ldloc 20

	IL_08cc:  nop 
	IL_08cd:  nop 
	IL_08ce:  ldc.i4 0
	IL_08d3:  conv.u 
	IL_08d4:  ldelem [mscorlib]System.Int32
	IL_08d9:  ldloc 20

	IL_08dd:  nop 
	IL_08de:  nop 
	IL_08df:  ldc.i4 1
	IL_08e4:  conv.u 
	IL_08e5:  ldelem [mscorlib]System.Int32
	IL_08ea:  ldloc 20

	IL_08ee:  nop 
	IL_08ef:  nop 
	IL_08f0:  ldc.i4 2
	IL_08f5:  conv.u 
	IL_08f6:  ldelem [mscorlib]System.Int32
	IL_08fb:  ldloc 20

	IL_08ff:  nop 
	IL_0900:  nop 
	IL_0901:  ldc.i4 3
	IL_0906:  conv.u 
	IL_0907:  ldelem [mscorlib]System.Int32
	IL_090c:  newobj instance void class [mscorlib]System.Version::'.ctor'(int32, int32, int32, int32)
	IL_0911:  stloc 21

	IL_0915:  nop 
	IL_0916:  nop 
	IL_0917:  ldsfld class [mscorlib]System.Reflection.AssemblyName [dnr]dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_091c:  stloc 22

	IL_0920:  nop 
	IL_0921:  nop 
	IL_0922:  ldloc 22

	IL_0926:  nop 
	IL_0927:  nop 
	IL_0928:  ldloc 21

	IL_092c:  nop 
	IL_092d:  nop 
	IL_092e:  callvirt instance void class [mscorlib]System.Reflection.AssemblyName::set_Version(class [mscorlib]System.Version)
	IL_0933:  ldloc 22

	IL_0937:  nop 
	IL_0938:  nop 
	IL_0939:  stsfld class [mscorlib]System.Reflection.AssemblyName [dnr]dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_093e:  call class [mscorlib]System.AppDomain class [mscorlib]System.AppDomain::get_CurrentDomain()
	IL_0943:  stloc 23

	IL_0947:  nop 
	IL_0948:  nop 
	IL_0949:  ldc.i4 2
	IL_094e:  stloc 24

	IL_0952:  nop 
	IL_0953:  nop 
	IL_0954:  call string class [mscorlib]System.IO.Directory::GetCurrentDirectory()
	IL_0959:  stloc 25

	IL_095d:  nop 
	IL_095e:  nop 
	IL_095f:  ldloc 23

	IL_0963:  nop 
	IL_0964:  nop 
	IL_0965:  ldloc 22

	IL_0969:  nop 
	IL_096a:  nop 
	IL_096b:  ldloc 24

	IL_096f:  nop 
	IL_0970:  nop 
	IL_0971:  ldloc 25

	IL_0975:  nop 
	IL_0976:  nop 
	IL_0977:  callvirt instance class [mscorlib]System.Reflection.Emit.AssemblyBuilder class [mscorlib]System.AppDomain::DefineDynamicAssembly(class [mscorlib]System.Reflection.AssemblyName, valuetype [mscorlib]System.Reflection.Emit.AssemblyBuilderAccess, string)
	IL_097c:  stsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_0981:  ldloc 22

	IL_0985:  nop 
	IL_0986:  nop 
	IL_0987:  callvirt instance string class [mscorlib]System.Reflection.AssemblyName::get_Name()
	IL_098c:  stloc 26

	IL_0990:  nop 
	IL_0991:  nop 
	IL_0992:  ldloc 26

	IL_0996:  nop 
	IL_0997:  nop 
	IL_0998:  ldstr "."
	IL_099d:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmMode
	IL_09a2:  call string string::Concat(string, string, string)
	IL_09a7:  stloc 26

	IL_09ab:  nop 
	IL_09ac:  nop 
	IL_09ad:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_09b2:  stloc 27

	IL_09b6:  nop 
	IL_09b7:  nop 
	IL_09b8:  ldloc 27

	IL_09bc:  nop 
	IL_09bd:  nop 
	IL_09be:  ldloc 26

	IL_09c2:  nop 
	IL_09c3:  nop 
	IL_09c4:  ldloc 26

	IL_09c8:  nop 
	IL_09c9:  nop 
	IL_09ca:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_09cf:  callvirt instance class [mscorlib]System.Reflection.Emit.ModuleBuilder class [mscorlib]System.Reflection.Emit.AssemblyBuilder::DefineDynamicModule(string, string, bool)
	IL_09d4:  stsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_09d9:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_09de:  ldc.i4 1
	IL_09e3:  beq IL_09ed

	IL_09e8:  br IL_0a4a

	IL_09ed:  ldsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_09f2:  stloc 28

	IL_09f6:  nop 
	IL_09f7:  nop 
	IL_09f8:  ldarg 2

	IL_09fc:  nop 
	IL_09fd:  nop 
	IL_09fe:  call string class [mscorlib]System.IO.Path::GetFullPath(string)
	IL_0a03:  starg 2

	IL_0a07:  nop 
	IL_0a08:  nop 
	IL_0a09:  ldloc 28

	IL_0a0d:  nop 
	IL_0a0e:  nop 
	IL_0a0f:  ldarg 2

	IL_0a13:  nop 
	IL_0a14:  nop 
	IL_0a15:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_0a1a:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_0a1f:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_0a24:  callvirt instance class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter class [mscorlib]System.Reflection.Emit.ModuleBuilder::DefineDocument(string, valuetype [mscorlib]System.Guid, valuetype [mscorlib]System.Guid, valuetype [mscorlib]System.Guid)
	IL_0a29:  stloc 29

	IL_0a2d:  nop 
	IL_0a2e:  nop 
	IL_0a2f:  ldloc 29

	IL_0a33:  nop 
	IL_0a34:  nop 
	IL_0a35:  stsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter [dnr]dylan.NET.Reflection.ILEmitter::DocWriter
	IL_0a3a:  ldloc 29

	IL_0a3e:  nop 
	IL_0a3f:  nop 
	IL_0a40:  call void class [dnr]dylan.NET.Reflection.ILEmitter::AddDocWriter(class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter)
	IL_0a45:  br IL_0a4f

	IL_0a4a:  br IL_0a4f

	IL_0a4f:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_0a54:  ldc.i4 1
	IL_0a59:  beq IL_0a63

	IL_0a5e:  br IL_0b39

	IL_0a63:  ldtoken [mscorlib]System.Diagnostics.DebuggableAttribute
	IL_0a68:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a6d:  stloc 30

	IL_0a71:  nop 
	IL_0a72:  nop 
	IL_0a73:  ldc.i4 1
	IL_0a78:  ldc.i4 256
	IL_0a7d:  or 
	IL_0a7e:  stloc 31

	IL_0a82:  nop 
	IL_0a83:  nop 
	IL_0a84:  ldloc 31

	IL_0a88:  nop 
	IL_0a89:  nop 
	IL_0a8a:  box [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes
	IL_0a8f:  stloc 32

	IL_0a93:  nop 
	IL_0a94:  nop 
	IL_0a95:  ldtoken [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes
	IL_0a9a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a9f:  stloc 33

	IL_0aa3:  nop 
	IL_0aa4:  nop 
	IL_0aa5:  ldc.i4 1
	IL_0aaa:  conv.u 
	IL_0aab:  newarr [mscorlib]System.Type
	IL_0ab0:  stloc 34

	IL_0ab4:  nop 
	IL_0ab5:  nop 
	IL_0ab6:  ldloc 34

	IL_0aba:  nop 
	IL_0abb:  nop 
	IL_0abc:  ldc.i4 0
	IL_0ac1:  conv.u 
	IL_0ac2:  ldloc 33

	IL_0ac6:  nop 
	IL_0ac7:  nop 
	IL_0ac8:  stelem [mscorlib]System.Type
	IL_0acd:  ldloc 30

	IL_0ad1:  nop 
	IL_0ad2:  nop 
	IL_0ad3:  ldloc 34

	IL_0ad7:  nop 
	IL_0ad8:  nop 
	IL_0ad9:  callvirt instance class [mscorlib]System.Reflection.ConstructorInfo class [mscorlib]System.Type::GetConstructor(class [mscorlib]System.Type[])
	IL_0ade:  stloc 35

	IL_0ae2:  nop 
	IL_0ae3:  nop 
	IL_0ae4:  ldc.i4 1
	IL_0ae9:  conv.u 
	IL_0aea:  newarr [mscorlib]System.Object
	IL_0aef:  stloc 36

	IL_0af3:  nop 
	IL_0af4:  nop 
	IL_0af5:  ldloc 36

	IL_0af9:  nop 
	IL_0afa:  nop 
	IL_0afb:  ldc.i4 0
	IL_0b00:  conv.u 
	IL_0b01:  ldloc 32

	IL_0b05:  nop 
	IL_0b06:  nop 
	IL_0b07:  stelem [mscorlib]System.Object
	IL_0b0c:  ldloc 35

	IL_0b10:  nop 
	IL_0b11:  nop 
	IL_0b12:  ldloc 36

	IL_0b16:  nop 
	IL_0b17:  nop 
	IL_0b18:  newobj instance void class [mscorlib]System.Reflection.Emit.CustomAttributeBuilder::'.ctor'(class [mscorlib]System.Reflection.ConstructorInfo, object[])
	IL_0b1d:  stloc 37

	IL_0b21:  nop 
	IL_0b22:  nop 
	IL_0b23:  ldloc 27

	IL_0b27:  nop 
	IL_0b28:  nop 
	IL_0b29:  ldloc 37

	IL_0b2d:  nop 
	IL_0b2e:  nop 
	IL_0b2f:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::SetCustomAttribute(class [mscorlib]System.Reflection.Emit.CustomAttributeBuilder)
	IL_0b34:  br IL_0b3e

	IL_0b39:  br IL_0b3e

	IL_0b3e:  ldloc 26

	IL_0b42:  nop 
	IL_0b43:  nop 
	IL_0b44:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmFile
	IL_0b49:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_0b4e:  call void class [dnr]dylan.NET.Reflection.Importer::AddAsm(class [mscorlib]System.Reflection.Assembly)
	IL_0b53:  br IL_2322

	IL_0b58:  br IL_0b62

	IL_0b5d:  br IL_0b62

	IL_0b62:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt
	IL_0b67:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0b6c:  stloc 0

	IL_0b70:  nop 
	IL_0b71:  nop 
	IL_0b72:  ldloc 0

	IL_0b76:  nop 
	IL_0b77:  nop 
	IL_0b78:  ldarg 1

	IL_0b7c:  nop 
	IL_0b7d:  nop 
	IL_0b7e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0b83:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0b88:  stloc 1

	IL_0b8c:  nop 
	IL_0b8d:  nop 
	IL_0b8e:  ldloc 1

	IL_0b92:  nop 
	IL_0b93:  nop 
	IL_0b94:  ldc.i4 1
	IL_0b99:  beq IL_0ba3

	IL_0b9e:  br IL_0bc9

	IL_0ba3:  ldarg 1

	IL_0ba7:  nop 
	IL_0ba8:  nop 
	IL_0ba9:  stloc 38

	IL_0bad:  nop 
	IL_0bae:  nop 
	IL_0baf:  ldloc 38

	IL_0bb3:  nop 
	IL_0bb4:  nop 
	IL_0bb5:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Flg
	IL_0bba:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_0bbf:  br IL_2322

	IL_0bc4:  br IL_0bce

	IL_0bc9:  br IL_0bce

	IL_0bce:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt
	IL_0bd3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0bd8:  stloc 0

	IL_0bdc:  nop 
	IL_0bdd:  nop 
	IL_0bde:  ldloc 0

	IL_0be2:  nop 
	IL_0be3:  nop 
	IL_0be4:  ldarg 1

	IL_0be8:  nop 
	IL_0be9:  nop 
	IL_0bea:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0bef:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0bf4:  stloc 1

	IL_0bf8:  nop 
	IL_0bf9:  nop 
	IL_0bfa:  ldloc 1

	IL_0bfe:  nop 
	IL_0bff:  nop 
	IL_0c00:  ldc.i4 1
	IL_0c05:  beq IL_0c0f

	IL_0c0a:  br IL_0e9c

	IL_0c0f:  ldarg 1

	IL_0c13:  nop 
	IL_0c14:  nop 
	IL_0c15:  stloc 39

	IL_0c19:  nop 
	IL_0c1a:  nop 
	IL_0c1b:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0c20:  ldc.i4 1
	IL_0c25:  beq IL_0c2f

	IL_0c2a:  br IL_0c3e

	IL_0c2f:  ldc.i4 1
	IL_0c34:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0c39:  br IL_0c43

	IL_0c3e:  br IL_0c43

	IL_0c43:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0c48:  ldc.i4 0
	IL_0c4d:  beq IL_0c57

	IL_0c52:  br IL_0c66

	IL_0c57:  ldc.i4 1
	IL_0c5c:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0c61:  br IL_0c6b

	IL_0c66:  br IL_0c6b

	IL_0c6b:  ldloc 39

	IL_0c6f:  nop 
	IL_0c70:  nop 
	IL_0c71:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::Attrs
	IL_0c76:  stloc 40

	IL_0c7a:  nop 
	IL_0c7b:  nop 
	IL_0c7c:  ldloc 40

	IL_0c80:  nop 
	IL_0c81:  nop 
	IL_0c82:  call valuetype [mscorlib]System.Reflection.TypeAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessClassAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_0c87:  stloc 41

	IL_0c8b:  nop 
	IL_0c8c:  nop 
	IL_0c8d:  ldloc 39

	IL_0c91:  nop 
	IL_0c92:  nop 
	IL_0c93:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::ClassName
	IL_0c98:  stloc 42

	IL_0c9c:  nop 
	IL_0c9d:  nop 
	IL_0c9e:  ldloc 42

	IL_0ca2:  nop 
	IL_0ca3:  nop 
	IL_0ca4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ca9:  stloc 43

	IL_0cad:  nop 
	IL_0cae:  nop 
	IL_0caf:  ldloc 39

	IL_0cb3:  nop 
	IL_0cb4:  nop 
	IL_0cb5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::InhClass
	IL_0cba:  stloc 44

	IL_0cbe:  nop 
	IL_0cbf:  nop 
	IL_0cc0:  ldnull 
	IL_0cc1:  stloc 45

	IL_0cc5:  nop 
	IL_0cc6:  nop 
	IL_0cc7:  ldloc 44

	IL_0ccb:  nop 
	IL_0ccc:  nop 
	IL_0ccd:  ldfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0cd2:  stloc 46

	IL_0cd6:  nop 
	IL_0cd7:  nop 
	IL_0cd8:  ldloc 44

	IL_0cdc:  nop 
	IL_0cdd:  nop 
	IL_0cde:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ce3:  ldstr ""
	IL_0ce8:  call int32 string::Compare(string, string)
	IL_0ced:  stloc 47

	IL_0cf1:  nop 
	IL_0cf2:  nop 
	IL_0cf3:  ldloc 46

	IL_0cf7:  nop 
	IL_0cf8:  nop 
	IL_0cf9:  ldnull 
	IL_0cfa:  beq IL_0d04

	IL_0cff:  br IL_0d49

	IL_0d04:  ldloc 47

	IL_0d08:  nop 
	IL_0d09:  nop 
	IL_0d0a:  ldc.i4 0
	IL_0d0f:  beq IL_0d19

	IL_0d14:  br IL_0d2e

	IL_0d19:  ldtoken [mscorlib]System.Object
	IL_0d1e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d23:  stloc 45

	IL_0d27:  nop 
	IL_0d28:  nop 
	IL_0d29:  br IL_0d44

	IL_0d2e:  ldloc 44

	IL_0d32:  nop 
	IL_0d33:  nop 
	IL_0d34:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0d39:  stloc 45

	IL_0d3d:  nop 
	IL_0d3e:  nop 
	IL_0d3f:  br IL_0d44

	IL_0d44:  br IL_0d5a

	IL_0d49:  ldloc 46

	IL_0d4d:  nop 
	IL_0d4e:  nop 
	IL_0d4f:  stloc 45

	IL_0d53:  nop 
	IL_0d54:  nop 
	IL_0d55:  br IL_0d5a

	IL_0d5a:  ldloc 45

	IL_0d5e:  nop 
	IL_0d5f:  nop 
	IL_0d60:  ldnull 
	IL_0d61:  beq IL_0d6b

	IL_0d66:  br IL_0da5

	IL_0d6b:  ldstr "Base Class '"
	IL_0d70:  ldloc 44

	IL_0d74:  nop 
	IL_0d75:  nop 
	IL_0d76:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0d7b:  ldstr "' is not defined."
	IL_0d80:  call string string::Concat(string, string, string)
	IL_0d85:  stloc 3

	IL_0d89:  nop 
	IL_0d8a:  nop 
	IL_0d8b:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_0d90:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_0d95:  ldloc 3

	IL_0d99:  nop 
	IL_0d9a:  nop 
	IL_0d9b:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_0da0:  br IL_0daa

	IL_0da5:  br IL_0daa

	IL_0daa:  ldloc 45

	IL_0dae:  nop 
	IL_0daf:  nop 
	IL_0db0:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_0db5:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0dba:  ldc.i4 0
	IL_0dbf:  beq IL_0dc9

	IL_0dc4:  br IL_0e36

	IL_0dc9:  ldsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_0dce:  stloc 48

	IL_0dd2:  nop 
	IL_0dd3:  nop 
	IL_0dd4:  ldloc 43

	IL_0dd8:  nop 
	IL_0dd9:  nop 
	IL_0dda:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0ddf:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_0de4:  ldstr "."
	IL_0de9:  ldloc 43

	IL_0ded:  nop 
	IL_0dee:  nop 
	IL_0def:  call string string::Concat(string, string, string)
	IL_0df4:  stloc 43

	IL_0df8:  nop 
	IL_0df9:  nop 
	IL_0dfa:  ldloc 48

	IL_0dfe:  nop 
	IL_0dff:  nop 
	IL_0e00:  ldloc 43

	IL_0e04:  nop 
	IL_0e05:  nop 
	IL_0e06:  ldloc 41

	IL_0e0a:  nop 
	IL_0e0b:  nop 
	IL_0e0c:  ldloc 45

	IL_0e10:  nop 
	IL_0e11:  nop 
	IL_0e12:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.ModuleBuilder::DefineType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_0e17:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0e1c:  ldstr "Adding Class: "
	IL_0e21:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0e26:  ldloc 43

	IL_0e2a:  nop 
	IL_0e2b:  nop 
	IL_0e2c:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0e31:  br IL_0e92

	IL_0e36:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0e3b:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_0e40:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_0e45:  stloc 49

	IL_0e49:  nop 
	IL_0e4a:  nop 
	IL_0e4b:  ldstr "Adding Nested Class: "
	IL_0e50:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0e55:  ldloc 43

	IL_0e59:  nop 
	IL_0e5a:  nop 
	IL_0e5b:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0e60:  ldloc 43

	IL_0e64:  nop 
	IL_0e65:  nop 
	IL_0e66:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0e6b:  ldloc 49

	IL_0e6f:  nop 
	IL_0e70:  nop 
	IL_0e71:  ldloc 43

	IL_0e75:  nop 
	IL_0e76:  nop 
	IL_0e77:  ldloc 41

	IL_0e7b:  nop 
	IL_0e7c:  nop 
	IL_0e7d:  ldloc 45

	IL_0e81:  nop 
	IL_0e82:  nop 
	IL_0e83:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineNestedType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_0e88:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0e8d:  br IL_0e92

	IL_0e92:  br IL_2322

	IL_0e97:  br IL_0ea1

	IL_0e9c:  br IL_0ea1

	IL_0ea1:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt
	IL_0ea6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0eab:  stloc 0

	IL_0eaf:  nop 
	IL_0eb0:  nop 
	IL_0eb1:  ldloc 0

	IL_0eb5:  nop 
	IL_0eb6:  nop 
	IL_0eb7:  ldarg 1

	IL_0ebb:  nop 
	IL_0ebc:  nop 
	IL_0ebd:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0ec2:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0ec7:  stloc 1

	IL_0ecb:  nop 
	IL_0ecc:  nop 
	IL_0ecd:  ldloc 1

	IL_0ed1:  nop 
	IL_0ed2:  nop 
	IL_0ed3:  ldc.i4 1
	IL_0ed8:  beq IL_0ee2

	IL_0edd:  br IL_12c2

	IL_0ee2:  ldarg 1

	IL_0ee6:  nop 
	IL_0ee7:  nop 
	IL_0ee8:  stloc 50

	IL_0eec:  nop 
	IL_0eed:  nop 
	IL_0eee:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0ef3:  ldc.i4 1
	IL_0ef8:  beq IL_0f02

	IL_0efd:  br IL_0f11

	IL_0f02:  ldc.i4 1
	IL_0f07:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0f0c:  br IL_0f16

	IL_0f11:  br IL_0f16

	IL_0f16:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0f1b:  ldc.i4 0
	IL_0f20:  beq IL_0f2a

	IL_0f25:  br IL_0f39

	IL_0f2a:  ldc.i4 1
	IL_0f2f:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0f34:  br IL_0f3e

	IL_0f39:  br IL_0f3e

	IL_0f3e:  ldloc 50

	IL_0f42:  nop 
	IL_0f43:  nop 
	IL_0f44:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Attrs
	IL_0f49:  stloc 51

	IL_0f4d:  nop 
	IL_0f4e:  nop 
	IL_0f4f:  ldloc 51

	IL_0f53:  nop 
	IL_0f54:  nop 
	IL_0f55:  call valuetype [mscorlib]System.Reflection.TypeAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessClassAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_0f5a:  stloc 52

	IL_0f5e:  nop 
	IL_0f5f:  nop 
	IL_0f60:  ldloc 52

	IL_0f64:  nop 
	IL_0f65:  nop 
	IL_0f66:  ldc.i4 0
	IL_0f6b:  or 
	IL_0f6c:  ldc.i4 256
	IL_0f71:  or 
	IL_0f72:  ldc.i4 131072
	IL_0f77:  or 
	IL_0f78:  stloc 52

	IL_0f7c:  nop 
	IL_0f7d:  nop 
	IL_0f7e:  ldloc 50

	IL_0f82:  nop 
	IL_0f83:  nop 
	IL_0f84:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::DelegateName
	IL_0f89:  stloc 53

	IL_0f8d:  nop 
	IL_0f8e:  nop 
	IL_0f8f:  ldloc 53

	IL_0f93:  nop 
	IL_0f94:  nop 
	IL_0f95:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0f9a:  stloc 54

	IL_0f9e:  nop 
	IL_0f9f:  nop 
	IL_0fa0:  ldtoken [mscorlib]System.MulticastDelegate
	IL_0fa5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0faa:  stloc 55

	IL_0fae:  nop 
	IL_0faf:  nop 
	IL_0fb0:  ldloc 55

	IL_0fb4:  nop 
	IL_0fb5:  nop 
	IL_0fb6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_0fbb:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0fc0:  ldc.i4 0
	IL_0fc5:  beq IL_0fcf

	IL_0fca:  br IL_103c

	IL_0fcf:  ldsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_0fd4:  stloc 48

	IL_0fd8:  nop 
	IL_0fd9:  nop 
	IL_0fda:  ldloc 54

	IL_0fde:  nop 
	IL_0fdf:  nop 
	IL_0fe0:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0fe5:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_0fea:  ldstr "."
	IL_0fef:  ldloc 54

	IL_0ff3:  nop 
	IL_0ff4:  nop 
	IL_0ff5:  call string string::Concat(string, string, string)
	IL_0ffa:  stloc 54

	IL_0ffe:  nop 
	IL_0fff:  nop 
	IL_1000:  ldloc 48

	IL_1004:  nop 
	IL_1005:  nop 
	IL_1006:  ldloc 54

	IL_100a:  nop 
	IL_100b:  nop 
	IL_100c:  ldloc 52

	IL_1010:  nop 
	IL_1011:  nop 
	IL_1012:  ldloc 55

	IL_1016:  nop 
	IL_1017:  nop 
	IL_1018:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.ModuleBuilder::DefineType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_101d:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1022:  ldstr "Adding Delegate: "
	IL_1027:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_102c:  ldloc 54

	IL_1030:  nop 
	IL_1031:  nop 
	IL_1032:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_1037:  br IL_1098

	IL_103c:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1041:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_1046:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_104b:  stloc 49

	IL_104f:  nop 
	IL_1050:  nop 
	IL_1051:  ldstr "Adding Nested Delegate: "
	IL_1056:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_105b:  ldloc 54

	IL_105f:  nop 
	IL_1060:  nop 
	IL_1061:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_1066:  ldloc 54

	IL_106a:  nop 
	IL_106b:  nop 
	IL_106c:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_1071:  ldloc 49

	IL_1075:  nop 
	IL_1076:  nop 
	IL_1077:  ldloc 54

	IL_107b:  nop 
	IL_107c:  nop 
	IL_107d:  ldloc 52

	IL_1081:  nop 
	IL_1082:  nop 
	IL_1083:  ldloc 55

	IL_1087:  nop 
	IL_1088:  nop 
	IL_1089:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineNestedType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_108e:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1093:  br IL_1098

	IL_1098:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetVar()
	IL_109d:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetIf()
	IL_10a2:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetLbl()
	IL_10a7:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_10ac:  stloc 56

	IL_10b0:  nop 
	IL_10b1:  nop 
	IL_10b2:  ldc.i4 128
	IL_10b7:  ldc.i4 6
	IL_10bc:  or 
	IL_10bd:  stloc 57

	IL_10c1:  nop 
	IL_10c2:  nop 
	IL_10c3:  ldstr ""
	IL_10c8:  stloc 58

	IL_10cc:  nop 
	IL_10cd:  nop 
	IL_10ce:  ldloc 50

	IL_10d2:  nop 
	IL_10d3:  nop 
	IL_10d4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::RetTyp
	IL_10d9:  stloc 59

	IL_10dd:  nop 
	IL_10de:  nop 
	IL_10df:  ldtoken [mscorlib]System.Void
	IL_10e4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_10e9:  stloc 60

	IL_10ed:  nop 
	IL_10ee:  nop 
	IL_10ef:  ldc.i4 2
	IL_10f4:  conv.u 
	IL_10f5:  newarr [mscorlib]System.Type
	IL_10fa:  stloc 61

	IL_10fe:  nop 
	IL_10ff:  nop 
	IL_1100:  ldloc 61

	IL_1104:  nop 
	IL_1105:  nop 
	IL_1106:  ldc.i4 0
	IL_110b:  conv.u 
	IL_110c:  ldtoken [mscorlib]System.Object
	IL_1111:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1116:  stelem [mscorlib]System.Type
	IL_111b:  ldloc 61

	IL_111f:  nop 
	IL_1120:  nop 
	IL_1121:  ldc.i4 1
	IL_1126:  conv.u 
	IL_1127:  ldtoken [mscorlib]System.IntPtr
	IL_112c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1131:  stelem [mscorlib]System.Type
	IL_1136:  ldc.i4 1
	IL_113b:  stloc 62

	IL_113f:  nop 
	IL_1140:  nop 
	IL_1141:  ldloc 56

	IL_1145:  nop 
	IL_1146:  nop 
	IL_1147:  ldloc 57

	IL_114b:  nop 
	IL_114c:  nop 
	IL_114d:  ldloc 62

	IL_1151:  nop 
	IL_1152:  nop 
	IL_1153:  ldloc 61

	IL_1157:  nop 
	IL_1158:  nop 
	IL_1159:  callvirt instance class [mscorlib]System.Reflection.Emit.ConstructorBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineConstructor(valuetype [mscorlib]System.Reflection.MethodAttributes, valuetype [mscorlib]System.Reflection.CallingConventions, class [mscorlib]System.Type[])
	IL_115e:  stsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_1163:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitDelConstr()
	IL_1168:  ldloc 59

	IL_116c:  nop 
	IL_116d:  nop 
	IL_116e:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1173:  stloc 60

	IL_1177:  nop 
	IL_1178:  nop 
	IL_1179:  ldc.i4 0
	IL_117e:  conv.u 
	IL_117f:  newarr [mscorlib]System.Type
	IL_1184:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1189:  ldloc 50

	IL_118d:  nop 
	IL_118e:  nop 
	IL_118f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Params
	IL_1194:  stloc 63

	IL_1198:  nop 
	IL_1199:  nop 
	IL_119a:  ldloc 63

	IL_119e:  nop 
	IL_119f:  nop 
	IL_11a0:  ldlen 
	IL_11a1:  conv.i4 
	IL_11a2:  stloc 64

	IL_11a6:  nop 
	IL_11a7:  nop 
	IL_11a8:  ldc.i4 128
	IL_11ad:  ldc.i4 6
	IL_11b2:  or 
	IL_11b3:  ldc.i4 256
	IL_11b8:  or 
	IL_11b9:  ldc.i4 64
	IL_11be:  or 
	IL_11bf:  stloc 57

	IL_11c3:  nop 
	IL_11c4:  nop 
	IL_11c5:  ldloc 64

	IL_11c9:  nop 
	IL_11ca:  nop 
	IL_11cb:  ldc.i4 0
	IL_11d0:  beq IL_11da

	IL_11d5:  br IL_11ea

	IL_11da:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_11df:  stloc 61

	IL_11e3:  nop 
	IL_11e4:  nop 
	IL_11e5:  br IL_1205

	IL_11ea:  ldloc 63

	IL_11ee:  nop 
	IL_11ef:  nop 
	IL_11f0:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_11f5:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_11fa:  stloc 61

	IL_11fe:  nop 
	IL_11ff:  nop 
	IL_1200:  br IL_1205

	IL_1205:  ldloc 56

	IL_1209:  nop 
	IL_120a:  nop 
	IL_120b:  ldstr "Invoke"
	IL_1210:  ldloc 57

	IL_1214:  nop 
	IL_1215:  nop 
	IL_1216:  ldloc 60

	IL_121a:  nop 
	IL_121b:  nop 
	IL_121c:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1221:  callvirt instance class [mscorlib]System.Reflection.Emit.MethodBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineMethod(string, valuetype [mscorlib]System.Reflection.MethodAttributes, class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_1226:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_122b:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitDelMet()
	IL_1230:  ldloc 63

	IL_1234:  nop 
	IL_1235:  nop 
	IL_1236:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_123b:  call void class [dnr]dylan.NET.Reflection.AsmFactory::CreateTyp()
	IL_1240:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1245:  ldc.i4 0
	IL_124a:  beq IL_1254

	IL_124f:  br IL_1272

	IL_1254:  ldc.i4 0
	IL_1259:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_125e:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetMet()
	IL_1263:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetCtor()
	IL_1268:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetFld()
	IL_126d:  br IL_1277

	IL_1272:  br IL_1277

	IL_1277:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_127c:  ldc.i4 1
	IL_1281:  beq IL_128b

	IL_1286:  br IL_12b3

	IL_128b:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_1290:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1295:  ldc.i4 0
	IL_129a:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_129f:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedMet()
	IL_12a4:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedCtor()
	IL_12a9:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedFld()
	IL_12ae:  br IL_12b8

	IL_12b3:  br IL_12b8

	IL_12b8:  br IL_2322

	IL_12bd:  br IL_12c7

	IL_12c2:  br IL_12c7

	IL_12c7:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt
	IL_12cc:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_12d1:  stloc 0

	IL_12d5:  nop 
	IL_12d6:  nop 
	IL_12d7:  ldloc 0

	IL_12db:  nop 
	IL_12dc:  nop 
	IL_12dd:  ldarg 1

	IL_12e1:  nop 
	IL_12e2:  nop 
	IL_12e3:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_12e8:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_12ed:  stloc 1

	IL_12f1:  nop 
	IL_12f2:  nop 
	IL_12f3:  ldloc 1

	IL_12f7:  nop 
	IL_12f8:  nop 
	IL_12f9:  ldc.i4 1
	IL_12fe:  beq IL_1308

	IL_1303:  br IL_1467

	IL_1308:  ldarg 1

	IL_130c:  nop 
	IL_130d:  nop 
	IL_130e:  stloc 65

	IL_1312:  nop 
	IL_1313:  nop 
	IL_1314:  ldloc 65

	IL_1318:  nop 
	IL_1319:  nop 
	IL_131a:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::Attrs
	IL_131f:  stloc 66

	IL_1323:  nop 
	IL_1324:  nop 
	IL_1325:  ldloc 66

	IL_1329:  nop 
	IL_132a:  nop 
	IL_132b:  call valuetype [mscorlib]System.Reflection.FieldAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessFieldAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_1330:  stloc 67

	IL_1334:  nop 
	IL_1335:  nop 
	IL_1336:  ldloc 65

	IL_133a:  nop 
	IL_133b:  nop 
	IL_133c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldName
	IL_1341:  stloc 68

	IL_1345:  nop 
	IL_1346:  nop 
	IL_1347:  ldloc 68

	IL_134b:  nop 
	IL_134c:  nop 
	IL_134d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1352:  stloc 69

	IL_1356:  nop 
	IL_1357:  nop 
	IL_1358:  ldloc 65

	IL_135c:  nop 
	IL_135d:  nop 
	IL_135e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldTyp
	IL_1363:  stloc 70

	IL_1367:  nop 
	IL_1368:  nop 
	IL_1369:  ldnull 
	IL_136a:  stloc 71

	IL_136e:  nop 
	IL_136f:  nop 
	IL_1370:  ldloc 70

	IL_1374:  nop 
	IL_1375:  nop 
	IL_1376:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_137b:  stloc 71

	IL_137f:  nop 
	IL_1380:  nop 
	IL_1381:  ldloc 71

	IL_1385:  nop 
	IL_1386:  nop 
	IL_1387:  ldnull 
	IL_1388:  beq IL_1392

	IL_138d:  br IL_13cc

	IL_1392:  ldstr "Class '"
	IL_1397:  ldloc 70

	IL_139b:  nop 
	IL_139c:  nop 
	IL_139d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13a2:  ldstr "' is not defined."
	IL_13a7:  call string string::Concat(string, string, string)
	IL_13ac:  stloc 3

	IL_13b0:  nop 
	IL_13b1:  nop 
	IL_13b2:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_13b7:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_13bc:  ldloc 3

	IL_13c0:  nop 
	IL_13c1:  nop 
	IL_13c2:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_13c7:  br IL_13d1

	IL_13cc:  br IL_13d1

	IL_13d1:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_13d6:  stloc 72

	IL_13da:  nop 
	IL_13db:  nop 
	IL_13dc:  ldloc 72

	IL_13e0:  nop 
	IL_13e1:  nop 
	IL_13e2:  ldloc 69

	IL_13e6:  nop 
	IL_13e7:  nop 
	IL_13e8:  ldloc 71

	IL_13ec:  nop 
	IL_13ed:  nop 
	IL_13ee:  ldloc 67

	IL_13f2:  nop 
	IL_13f3:  nop 
	IL_13f4:  callvirt instance class [mscorlib]System.Reflection.Emit.FieldBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineField(string, class [mscorlib]System.Type, valuetype [mscorlib]System.Reflection.FieldAttributes)
	IL_13f9:  stsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_13fe:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1403:  ldc.i4 0
	IL_1408:  beq IL_1412

	IL_140d:  br IL_142d

	IL_1412:  ldloc 69

	IL_1416:  nop 
	IL_1417:  nop 
	IL_1418:  ldloc 71

	IL_141c:  nop 
	IL_141d:  nop 
	IL_141e:  ldsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_1423:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddFld(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_1428:  br IL_1448

	IL_142d:  ldloc 69

	IL_1431:  nop 
	IL_1432:  nop 
	IL_1433:  ldloc 71

	IL_1437:  nop 
	IL_1438:  nop 
	IL_1439:  ldsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_143e:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedFld(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_1443:  br IL_1448

	IL_1448:  ldstr "\tAdding Field: "
	IL_144d:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_1452:  ldloc 69

	IL_1456:  nop 
	IL_1457:  nop 
	IL_1458:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_145d:  br IL_2322

	IL_1462:  br IL_146c

	IL_1467:  br IL_146c

	IL_146c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndClassStmt
	IL_1471:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1476:  stloc 0

	IL_147a:  nop 
	IL_147b:  nop 
	IL_147c:  ldloc 0

	IL_1480:  nop 
	IL_1481:  nop 
	IL_1482:  ldarg 1

	IL_1486:  nop 
	IL_1487:  nop 
	IL_1488:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_148d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1492:  stloc 1

	IL_1496:  nop 
	IL_1497:  nop 
	IL_1498:  ldloc 1

	IL_149c:  nop 
	IL_149d:  nop 
	IL_149e:  ldc.i4 1
	IL_14a3:  beq IL_14ad

	IL_14a8:  br IL_1534

	IL_14ad:  call void class [dnr]dylan.NET.Reflection.AsmFactory::CreateTyp()
	IL_14b2:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_14b7:  ldc.i4 0
	IL_14bc:  beq IL_14c6

	IL_14c1:  br IL_14e4

	IL_14c6:  ldc.i4 0
	IL_14cb:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_14d0:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetMet()
	IL_14d5:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetCtor()
	IL_14da:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetFld()
	IL_14df:  br IL_14e9

	IL_14e4:  br IL_14e9

	IL_14e9:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_14ee:  ldc.i4 1
	IL_14f3:  beq IL_14fd

	IL_14f8:  br IL_1525

	IL_14fd:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_1502:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1507:  ldc.i4 0
	IL_150c:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1511:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedMet()
	IL_1516:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedCtor()
	IL_151b:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedFld()
	IL_1520:  br IL_152a

	IL_1525:  br IL_152a

	IL_152a:  br IL_2322

	IL_152f:  br IL_1539

	IL_1534:  br IL_1539

	IL_1539:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt
	IL_153e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1543:  stloc 0

	IL_1547:  nop 
	IL_1548:  nop 
	IL_1549:  ldloc 0

	IL_154d:  nop 
	IL_154e:  nop 
	IL_154f:  ldarg 1

	IL_1553:  nop 
	IL_1554:  nop 
	IL_1555:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_155a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_155f:  stloc 1

	IL_1563:  nop 
	IL_1564:  nop 
	IL_1565:  ldloc 1

	IL_1569:  nop 
	IL_156a:  nop 
	IL_156b:  ldc.i4 1
	IL_1570:  beq IL_157a

	IL_1575:  br IL_188e

	IL_157a:  ldarg 1

	IL_157e:  nop 
	IL_157f:  nop 
	IL_1580:  stloc 73

	IL_1584:  nop 
	IL_1585:  nop 
	IL_1586:  ldc.i4 0
	IL_158b:  stsfld bool [dnr]dylan.NET.Reflection.ILEmitter::StaticFlg
	IL_1590:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetVar()
	IL_1595:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetIf()
	IL_159a:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetLbl()
	IL_159f:  ldloc 73

	IL_15a3:  nop 
	IL_15a4:  nop 
	IL_15a5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Attrs
	IL_15aa:  stloc 74

	IL_15ae:  nop 
	IL_15af:  nop 
	IL_15b0:  ldloc 74

	IL_15b4:  nop 
	IL_15b5:  nop 
	IL_15b6:  call valuetype [mscorlib]System.Reflection.MethodAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessMethodAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_15bb:  stloc 75

	IL_15bf:  nop 
	IL_15c0:  nop 
	IL_15c1:  ldloc 73

	IL_15c5:  nop 
	IL_15c6:  nop 
	IL_15c7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::MethodName
	IL_15cc:  stloc 76

	IL_15d0:  nop 
	IL_15d1:  nop 
	IL_15d2:  ldloc 76

	IL_15d6:  nop 
	IL_15d7:  nop 
	IL_15d8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_15dd:  stloc 77

	IL_15e1:  nop 
	IL_15e2:  nop 
	IL_15e3:  ldloc 73

	IL_15e7:  nop 
	IL_15e8:  nop 
	IL_15e9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Params
	IL_15ee:  stloc 78

	IL_15f2:  nop 
	IL_15f3:  nop 
	IL_15f4:  ldloc 78

	IL_15f8:  nop 
	IL_15f9:  nop 
	IL_15fa:  ldlen 
	IL_15fb:  conv.i4 
	IL_15fc:  stloc 79

	IL_1600:  nop 
	IL_1601:  nop 
	IL_1602:  ldloc 73

	IL_1606:  nop 
	IL_1607:  nop 
	IL_1608:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::RetTyp
	IL_160d:  stloc 80

	IL_1611:  nop 
	IL_1612:  nop 
	IL_1613:  ldnull 
	IL_1614:  stloc 81

	IL_1618:  nop 
	IL_1619:  nop 
	IL_161a:  ldloc 80

	IL_161e:  nop 
	IL_161f:  nop 
	IL_1620:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1625:  stloc 81

	IL_1629:  nop 
	IL_162a:  nop 
	IL_162b:  ldc.i4 0
	IL_1630:  conv.u 
	IL_1631:  newarr [mscorlib]System.Type
	IL_1636:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_163b:  ldloc 79

	IL_163f:  nop 
	IL_1640:  nop 
	IL_1641:  ldc.i4 0
	IL_1646:  beq IL_1650

	IL_164b:  br IL_1655

	IL_1650:  br IL_1665

	IL_1655:  ldloc 78

	IL_1659:  nop 
	IL_165a:  nop 
	IL_165b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_1660:  br IL_1665

	IL_1665:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_166a:  stloc 82

	IL_166e:  nop 
	IL_166f:  nop 
	IL_1670:  ldloc 77

	IL_1674:  nop 
	IL_1675:  nop 
	IL_1676:  ldstr "^ctor\\d*$"
	IL_167b:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_1680:  stloc 83

	IL_1684:  nop 
	IL_1685:  nop 
	IL_1686:  ldloc 83

	IL_168a:  nop 
	IL_168b:  nop 
	IL_168c:  stloc 1

	IL_1690:  nop 
	IL_1691:  nop 
	IL_1692:  ldloc 77

	IL_1696:  nop 
	IL_1697:  nop 
	IL_1698:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_169d:  call int32 string::Compare(string, string)
	IL_16a2:  stloc 47

	IL_16a6:  nop 
	IL_16a7:  nop 
	IL_16a8:  ldloc 47

	IL_16ac:  nop 
	IL_16ad:  nop 
	IL_16ae:  ldc.i4 0
	IL_16b3:  beq IL_16bd

	IL_16b8:  br IL_16cd

	IL_16bd:  ldc.i4 1
	IL_16c2:  stloc 83

	IL_16c6:  nop 
	IL_16c7:  nop 
	IL_16c8:  br IL_16d2

	IL_16cd:  br IL_16d2

	IL_16d2:  ldloc 1

	IL_16d6:  nop 
	IL_16d7:  nop 
	IL_16d8:  ldloc 83

	IL_16dc:  nop 
	IL_16dd:  nop 
	IL_16de:  or 
	IL_16df:  stloc 83

	IL_16e3:  nop 
	IL_16e4:  nop 
	IL_16e5:  ldloc 83

	IL_16e9:  nop 
	IL_16ea:  nop 
	IL_16eb:  ldc.i4 0
	IL_16f0:  beq IL_16fa

	IL_16f5:  br IL_1794

	IL_16fa:  ldloc 82

	IL_16fe:  nop 
	IL_16ff:  nop 
	IL_1700:  ldloc 77

	IL_1704:  nop 
	IL_1705:  nop 
	IL_1706:  ldloc 75

	IL_170a:  nop 
	IL_170b:  nop 
	IL_170c:  ldloc 81

	IL_1710:  nop 
	IL_1711:  nop 
	IL_1712:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1717:  callvirt instance class [mscorlib]System.Reflection.Emit.MethodBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineMethod(string, valuetype [mscorlib]System.Reflection.MethodAttributes, class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_171c:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_1721:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitMtd()
	IL_1726:  ldstr "\tAdding Method: "
	IL_172b:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_1730:  ldloc 77

	IL_1734:  nop 
	IL_1735:  nop 
	IL_1736:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_173b:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1740:  ldc.i4 0
	IL_1745:  beq IL_174f

	IL_174a:  br IL_176f

	IL_174f:  ldloc 77

	IL_1753:  nop 
	IL_1754:  nop 
	IL_1755:  ldloc 81

	IL_1759:  nop 
	IL_175a:  nop 
	IL_175b:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1760:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_1765:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddMet(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_176a:  br IL_178f

	IL_176f:  ldloc 77

	IL_1773:  nop 
	IL_1774:  nop 
	IL_1775:  ldloc 81

	IL_1779:  nop 
	IL_177a:  nop 
	IL_177b:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1780:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_1785:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedMet(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_178a:  br IL_178f

	IL_178f:  br IL_181b

	IL_1794:  ldc.i4 1
	IL_1799:  stloc 84

	IL_179d:  nop 
	IL_179e:  nop 
	IL_179f:  ldloc 82

	IL_17a3:  nop 
	IL_17a4:  nop 
	IL_17a5:  ldloc 75

	IL_17a9:  nop 
	IL_17aa:  nop 
	IL_17ab:  ldloc 84

	IL_17af:  nop 
	IL_17b0:  nop 
	IL_17b1:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_17b6:  callvirt instance class [mscorlib]System.Reflection.Emit.ConstructorBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineConstructor(valuetype [mscorlib]System.Reflection.MethodAttributes, valuetype [mscorlib]System.Reflection.CallingConventions, class [mscorlib]System.Type[])
	IL_17bb:  stsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_17c0:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitConstr()
	IL_17c5:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_17ca:  ldc.i4 0
	IL_17cf:  beq IL_17d9

	IL_17d4:  br IL_17ed

	IL_17d9:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_17de:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_17e3:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddCtor(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_17e8:  br IL_1801

	IL_17ed:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_17f2:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_17f7:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedCtor(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_17fc:  br IL_1801

	IL_1801:  ldstr "\tAdding Constructor: "
	IL_1806:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_180b:  ldloc 77

	IL_180f:  nop 
	IL_1810:  nop 
	IL_1811:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_1816:  br IL_181b

	IL_181b:  ldc.i4 1
	IL_1820:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_1825:  ldloc 77

	IL_1829:  nop 
	IL_182a:  nop 
	IL_182b:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnMetName
	IL_1830:  ldloc 79

	IL_1834:  nop 
	IL_1835:  nop 
	IL_1836:  ldc.i4 0
	IL_183b:  beq IL_1845

	IL_1840:  br IL_184a

	IL_1845:  br IL_1884

	IL_184a:  ldloc 83

	IL_184e:  nop 
	IL_184f:  nop 
	IL_1850:  ldc.i4 0
	IL_1855:  beq IL_185f

	IL_185a:  br IL_186f

	IL_185f:  ldloc 78

	IL_1863:  nop 
	IL_1864:  nop 
	IL_1865:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_186a:  br IL_187f

	IL_186f:  ldloc 78

	IL_1873:  nop 
	IL_1874:  nop 
	IL_1875:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParamsConstr(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_187a:  br IL_187f

	IL_187f:  br IL_1884

	IL_1884:  br IL_2322

	IL_1889:  br IL_1893

	IL_188e:  br IL_1893

	IL_1893:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt
	IL_1898:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_189d:  stloc 0

	IL_18a1:  nop 
	IL_18a2:  nop 
	IL_18a3:  ldloc 0

	IL_18a7:  nop 
	IL_18a8:  nop 
	IL_18a9:  ldarg 1

	IL_18ad:  nop 
	IL_18ae:  nop 
	IL_18af:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_18b4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_18b9:  stloc 1

	IL_18bd:  nop 
	IL_18be:  nop 
	IL_18bf:  ldloc 1

	IL_18c3:  nop 
	IL_18c4:  nop 
	IL_18c5:  ldc.i4 1
	IL_18ca:  beq IL_18d4

	IL_18cf:  br IL_1970

	IL_18d4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRet()
	IL_18d9:  ldc.i4 0
	IL_18de:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_18e3:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_18e8:  stloc 27

	IL_18ec:  nop 
	IL_18ed:  nop 
	IL_18ee:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnMetName
	IL_18f3:  ldstr "main"
	IL_18f8:  call int32 string::Compare(string, string)
	IL_18fd:  stloc 85

	IL_1901:  nop 
	IL_1902:  nop 
	IL_1903:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmMode
	IL_1908:  ldstr "exe"
	IL_190d:  call int32 string::Compare(string, string)
	IL_1912:  stloc 86

	IL_1916:  nop 
	IL_1917:  nop 
	IL_1918:  ldloc 85

	IL_191c:  nop 
	IL_191d:  nop 
	IL_191e:  ldc.i4 0
	IL_1923:  beq IL_192d

	IL_1928:  br IL_1961

	IL_192d:  ldloc 86

	IL_1931:  nop 
	IL_1932:  nop 
	IL_1933:  ldc.i4 0
	IL_1938:  beq IL_1942

	IL_193d:  br IL_1957

	IL_1942:  ldloc 27

	IL_1946:  nop 
	IL_1947:  nop 
	IL_1948:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.ILEmitter::Met
	IL_194d:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::SetEntryPoint(class [mscorlib]System.Reflection.MethodInfo)
	IL_1952:  br IL_195c

	IL_1957:  br IL_195c

	IL_195c:  br IL_1966

	IL_1961:  br IL_1966

	IL_1966:  br IL_2322

	IL_196b:  br IL_1975

	IL_1970:  br IL_1975

	IL_1975:  ldnull 
	IL_1976:  stloc 89

	IL_197a:  nop 
	IL_197b:  nop 
	IL_197c:  ldnull 
	IL_197d:  stloc 90

	IL_1981:  nop 
	IL_1982:  nop 
	IL_1983:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt
	IL_1988:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_198d:  stloc 0

	IL_1991:  nop 
	IL_1992:  nop 
	IL_1993:  ldloc 0

	IL_1997:  nop 
	IL_1998:  nop 
	IL_1999:  ldarg 1

	IL_199d:  nop 
	IL_199e:  nop 
	IL_199f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_19a4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_19a9:  stloc 1

	IL_19ad:  nop 
	IL_19ae:  nop 
	IL_19af:  ldloc 1

	IL_19b3:  nop 
	IL_19b4:  nop 
	IL_19b5:  ldc.i4 1
	IL_19ba:  beq IL_19c4

	IL_19bf:  br IL_1a1b

	IL_19c4:  ldarg 1

	IL_19c8:  nop 
	IL_19c9:  nop 
	IL_19ca:  stloc 91

	IL_19ce:  nop 
	IL_19cf:  nop 
	IL_19d0:  ldloc 91

	IL_19d4:  nop 
	IL_19d5:  nop 
	IL_19d6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_19db:  ldnull 
	IL_19dc:  beq IL_1a0c

	IL_19e1:  br IL_19e6

	IL_19e6:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_19eb:  stloc 90

	IL_19ef:  nop 
	IL_19f0:  nop 
	IL_19f1:  ldloc 90

	IL_19f5:  nop 
	IL_19f6:  nop 
	IL_19f7:  ldloc 91

	IL_19fb:  nop 
	IL_19fc:  nop 
	IL_19fd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_1a02:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1a07:  br IL_1a11

	IL_1a0c:  br IL_1a11

	IL_1a11:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRet()
	IL_1a16:  br IL_1a20

	IL_1a1b:  br IL_1a20

	IL_1a20:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt
	IL_1a25:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1a2a:  stloc 0

	IL_1a2e:  nop 
	IL_1a2f:  nop 
	IL_1a30:  ldloc 0

	IL_1a34:  nop 
	IL_1a35:  nop 
	IL_1a36:  ldarg 1

	IL_1a3a:  nop 
	IL_1a3b:  nop 
	IL_1a3c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1a41:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1a46:  stloc 1

	IL_1a4a:  nop 
	IL_1a4b:  nop 
	IL_1a4c:  ldloc 1

	IL_1a50:  nop 
	IL_1a51:  nop 
	IL_1a52:  ldc.i4 1
	IL_1a57:  beq IL_1a61

	IL_1a5c:  br IL_1b40

	IL_1a61:  ldarg 1

	IL_1a65:  nop 
	IL_1a66:  nop 
	IL_1a67:  stloc 92

	IL_1a6b:  nop 
	IL_1a6c:  nop 
	IL_1a6d:  ldloc 92

	IL_1a71:  nop 
	IL_1a72:  nop 
	IL_1a73:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarName
	IL_1a78:  stloc 87

	IL_1a7c:  nop 
	IL_1a7d:  nop 
	IL_1a7e:  ldloc 92

	IL_1a82:  nop 
	IL_1a83:  nop 
	IL_1a84:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarTyp
	IL_1a89:  stloc 88

	IL_1a8d:  nop 
	IL_1a8e:  nop 
	IL_1a8f:  ldloc 88

	IL_1a93:  nop 
	IL_1a94:  nop 
	IL_1a95:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1a9a:  stloc 89

	IL_1a9e:  nop 
	IL_1a9f:  nop 
	IL_1aa0:  ldloc 89

	IL_1aa4:  nop 
	IL_1aa5:  nop 
	IL_1aa6:  ldnull 
	IL_1aa7:  beq IL_1ab1

	IL_1aac:  br IL_1aeb

	IL_1ab1:  ldstr "Class '"
	IL_1ab6:  ldloc 88

	IL_1aba:  nop 
	IL_1abb:  nop 
	IL_1abc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1ac1:  ldstr "' is not defined."
	IL_1ac6:  call string string::Concat(string, string, string)
	IL_1acb:  stloc 3

	IL_1acf:  nop 
	IL_1ad0:  nop 
	IL_1ad1:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_1ad6:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_1adb:  ldloc 3

	IL_1adf:  nop 
	IL_1ae0:  nop 
	IL_1ae1:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_1ae6:  br IL_1af0

	IL_1aeb:  br IL_1af0

	IL_1af0:  ldloc 87

	IL_1af4:  nop 
	IL_1af5:  nop 
	IL_1af6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1afb:  ldloc 89

	IL_1aff:  nop 
	IL_1b00:  nop 
	IL_1b01:  call void class [dnr]dylan.NET.Reflection.ILEmitter::DeclVar(string, class [mscorlib]System.Type)
	IL_1b06:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1b0b:  ldc.i4 1
	IL_1b10:  add 
	IL_1b11:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1b16:  ldloc 87

	IL_1b1a:  nop 
	IL_1b1b:  nop 
	IL_1b1c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1b21:  ldc.i4 1
	IL_1b26:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1b2b:  ldloc 89

	IL_1b2f:  nop 
	IL_1b30:  nop 
	IL_1b31:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_1b36:  br IL_2322

	IL_1b3b:  br IL_1b45

	IL_1b40:  br IL_1b45

	IL_1b45:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt
	IL_1b4a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1b4f:  stloc 0

	IL_1b53:  nop 
	IL_1b54:  nop 
	IL_1b55:  ldloc 0

	IL_1b59:  nop 
	IL_1b5a:  nop 
	IL_1b5b:  ldarg 1

	IL_1b5f:  nop 
	IL_1b60:  nop 
	IL_1b61:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1b66:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1b6b:  stloc 1

	IL_1b6f:  nop 
	IL_1b70:  nop 
	IL_1b71:  ldloc 1

	IL_1b75:  nop 
	IL_1b76:  nop 
	IL_1b77:  ldc.i4 1
	IL_1b7c:  beq IL_1b86

	IL_1b81:  br IL_1c8c

	IL_1b86:  ldarg 1

	IL_1b8a:  nop 
	IL_1b8b:  nop 
	IL_1b8c:  stloc 93

	IL_1b90:  nop 
	IL_1b91:  nop 
	IL_1b92:  ldloc 93

	IL_1b96:  nop 
	IL_1b97:  nop 
	IL_1b98:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarName
	IL_1b9d:  stloc 87

	IL_1ba1:  nop 
	IL_1ba2:  nop 
	IL_1ba3:  ldloc 93

	IL_1ba7:  nop 
	IL_1ba8:  nop 
	IL_1ba9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarTyp
	IL_1bae:  stloc 88

	IL_1bb2:  nop 
	IL_1bb3:  nop 
	IL_1bb4:  ldloc 88

	IL_1bb8:  nop 
	IL_1bb9:  nop 
	IL_1bba:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1bbf:  stloc 89

	IL_1bc3:  nop 
	IL_1bc4:  nop 
	IL_1bc5:  ldloc 89

	IL_1bc9:  nop 
	IL_1bca:  nop 
	IL_1bcb:  ldnull 
	IL_1bcc:  beq IL_1bd6

	IL_1bd1:  br IL_1c10

	IL_1bd6:  ldstr "Class '"
	IL_1bdb:  ldloc 88

	IL_1bdf:  nop 
	IL_1be0:  nop 
	IL_1be1:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1be6:  ldstr "' is not defined."
	IL_1beb:  call string string::Concat(string, string, string)
	IL_1bf0:  stloc 3

	IL_1bf4:  nop 
	IL_1bf5:  nop 
	IL_1bf6:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LineNr
	IL_1bfb:  ldsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_1c00:  ldloc 3

	IL_1c04:  nop 
	IL_1c05:  nop 
	IL_1c06:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteError(int32, string, string)
	IL_1c0b:  br IL_1c15

	IL_1c10:  br IL_1c15

	IL_1c15:  ldloc 87

	IL_1c19:  nop 
	IL_1c1a:  nop 
	IL_1c1b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c20:  ldloc 89

	IL_1c24:  nop 
	IL_1c25:  nop 
	IL_1c26:  call void class [dnr]dylan.NET.Reflection.ILEmitter::DeclVar(string, class [mscorlib]System.Type)
	IL_1c2b:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1c30:  ldc.i4 1
	IL_1c35:  add 
	IL_1c36:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1c3b:  ldloc 87

	IL_1c3f:  nop 
	IL_1c40:  nop 
	IL_1c41:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1c46:  ldc.i4 1
	IL_1c4b:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1c50:  ldloc 89

	IL_1c54:  nop 
	IL_1c55:  nop 
	IL_1c56:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_1c5b:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1c60:  stloc 90

	IL_1c64:  nop 
	IL_1c65:  nop 
	IL_1c66:  ldloc 90

	IL_1c6a:  nop 
	IL_1c6b:  nop 
	IL_1c6c:  ldloc 87

	IL_1c70:  nop 
	IL_1c71:  nop 
	IL_1c72:  ldloc 93

	IL_1c76:  nop 
	IL_1c77:  nop 
	IL_1c78:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::RExpr
	IL_1c7d:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::StoreEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1c82:  br IL_2322

	IL_1c87:  br IL_1c91

	IL_1c8c:  br IL_1c91

	IL_1c91:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.NSStmt
	IL_1c96:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1c9b:  stloc 0

	IL_1c9f:  nop 
	IL_1ca0:  nop 
	IL_1ca1:  ldloc 0

	IL_1ca5:  nop 
	IL_1ca6:  nop 
	IL_1ca7:  ldarg 1

	IL_1cab:  nop 
	IL_1cac:  nop 
	IL_1cad:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1cb2:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1cb7:  stloc 1

	IL_1cbb:  nop 
	IL_1cbc:  nop 
	IL_1cbd:  ldloc 1

	IL_1cc1:  nop 
	IL_1cc2:  nop 
	IL_1cc3:  ldc.i4 1
	IL_1cc8:  beq IL_1cd2

	IL_1ccd:  br IL_1d09

	IL_1cd2:  ldarg 1

	IL_1cd6:  nop 
	IL_1cd7:  nop 
	IL_1cd8:  stloc 94

	IL_1cdc:  nop 
	IL_1cdd:  nop 
	IL_1cde:  ldloc 94

	IL_1ce2:  nop 
	IL_1ce3:  nop 
	IL_1ce4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.NSStmt::NS
	IL_1ce9:  stloc 95

	IL_1ced:  nop 
	IL_1cee:  nop 
	IL_1cef:  ldloc 95

	IL_1cf3:  nop 
	IL_1cf4:  nop 
	IL_1cf5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1cfa:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_1cff:  br IL_2322

	IL_1d04:  br IL_1d0e

	IL_1d09:  br IL_1d0e

	IL_1d0e:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndNSStmt
	IL_1d13:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d18:  stloc 0

	IL_1d1c:  nop 
	IL_1d1d:  nop 
	IL_1d1e:  ldloc 0

	IL_1d22:  nop 
	IL_1d23:  nop 
	IL_1d24:  ldarg 1

	IL_1d28:  nop 
	IL_1d29:  nop 
	IL_1d2a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1d2f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1d34:  stloc 1

	IL_1d38:  nop 
	IL_1d39:  nop 
	IL_1d3a:  ldloc 1

	IL_1d3e:  nop 
	IL_1d3f:  nop 
	IL_1d40:  ldc.i4 1
	IL_1d45:  beq IL_1d4f

	IL_1d4a:  br IL_1d63

	IL_1d4f:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::DfltNS
	IL_1d54:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_1d59:  br IL_2322

	IL_1d5e:  br IL_1d68

	IL_1d63:  br IL_1d68

	IL_1d68:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt
	IL_1d6d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d72:  stloc 0

	IL_1d76:  nop 
	IL_1d77:  nop 
	IL_1d78:  ldloc 0

	IL_1d7c:  nop 
	IL_1d7d:  nop 
	IL_1d7e:  ldarg 1

	IL_1d82:  nop 
	IL_1d83:  nop 
	IL_1d84:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1d89:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1d8e:  stloc 1

	IL_1d92:  nop 
	IL_1d93:  nop 
	IL_1d94:  ldloc 1

	IL_1d98:  nop 
	IL_1d99:  nop 
	IL_1d9a:  ldc.i4 1
	IL_1d9f:  beq IL_1da9

	IL_1da4:  br IL_1e13

	IL_1da9:  ldarg 1

	IL_1dad:  nop 
	IL_1dae:  nop 
	IL_1daf:  stloc 96

	IL_1db3:  nop 
	IL_1db4:  nop 
	IL_1db5:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1dba:  stloc 90

	IL_1dbe:  nop 
	IL_1dbf:  nop 
	IL_1dc0:  ldloc 96

	IL_1dc4:  nop 
	IL_1dc5:  nop 
	IL_1dc6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::LExp
	IL_1dcb:  stloc 97

	IL_1dcf:  nop 
	IL_1dd0:  nop 
	IL_1dd1:  ldloc 97

	IL_1dd5:  nop 
	IL_1dd6:  nop 
	IL_1dd7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1ddc:  ldc.i4 0
	IL_1de1:  conv.u 
	IL_1de2:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1de7:  stloc 98

	IL_1deb:  nop 
	IL_1dec:  nop 
	IL_1ded:  ldloc 90

	IL_1df1:  nop 
	IL_1df2:  nop 
	IL_1df3:  ldloc 98

	IL_1df7:  nop 
	IL_1df8:  nop 
	IL_1df9:  ldloc 96

	IL_1dfd:  nop 
	IL_1dfe:  nop 
	IL_1dff:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::RExp
	IL_1e04:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::StoreEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1e09:  br IL_2322

	IL_1e0e:  br IL_1e18

	IL_1e13:  br IL_1e18

	IL_1e18:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt
	IL_1e1d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1e22:  stloc 0

	IL_1e26:  nop 
	IL_1e27:  nop 
	IL_1e28:  ldloc 0

	IL_1e2c:  nop 
	IL_1e2d:  nop 
	IL_1e2e:  ldarg 1

	IL_1e32:  nop 
	IL_1e33:  nop 
	IL_1e34:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1e39:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1e3e:  stloc 1

	IL_1e42:  nop 
	IL_1e43:  nop 
	IL_1e44:  ldloc 1

	IL_1e48:  nop 
	IL_1e49:  nop 
	IL_1e4a:  ldc.i4 1
	IL_1e4f:  beq IL_1e59

	IL_1e54:  br IL_1ee4

	IL_1e59:  ldarg 1

	IL_1e5d:  nop 
	IL_1e5e:  nop 
	IL_1e5f:  stloc 99

	IL_1e63:  nop 
	IL_1e64:  nop 
	IL_1e65:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_1e6a:  stloc 100

	IL_1e6e:  nop 
	IL_1e6f:  nop 
	IL_1e70:  ldloc 99

	IL_1e74:  nop 
	IL_1e75:  nop 
	IL_1e76:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::MethodToken
	IL_1e7b:  stloc 101

	IL_1e7f:  nop 
	IL_1e80:  nop 
	IL_1e81:  ldloc 101

	IL_1e85:  nop 
	IL_1e86:  nop 
	IL_1e87:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token class dylan.NET.Tokenizer.CodeGen.Helpers::SetPopFlg(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_1e8c:  stloc 101

	IL_1e90:  nop 
	IL_1e91:  nop 
	IL_1e92:  ldloc 101

	IL_1e96:  nop 
	IL_1e97:  nop 
	IL_1e98:  ldnull 
	IL_1e99:  beq IL_1ed5

	IL_1e9e:  br IL_1ea3

	IL_1ea3:  ldloc 100

	IL_1ea7:  nop 
	IL_1ea8:  nop 
	IL_1ea9:  ldloc 101

	IL_1ead:  nop 
	IL_1eae:  nop 
	IL_1eaf:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_1eb4:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1eb9:  stloc 90

	IL_1ebd:  nop 
	IL_1ebe:  nop 
	IL_1ebf:  ldloc 90

	IL_1ec3:  nop 
	IL_1ec4:  nop 
	IL_1ec5:  ldloc 100

	IL_1ec9:  nop 
	IL_1eca:  nop 
	IL_1ecb:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1ed0:  br IL_1eda

	IL_1ed5:  br IL_1eda

	IL_1eda:  br IL_2322

	IL_1edf:  br IL_1ee9

	IL_1ee4:  br IL_1ee9

	IL_1ee9:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt
	IL_1eee:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1ef3:  stloc 0

	IL_1ef7:  nop 
	IL_1ef8:  nop 
	IL_1ef9:  ldloc 0

	IL_1efd:  nop 
	IL_1efe:  nop 
	IL_1eff:  ldarg 1

	IL_1f03:  nop 
	IL_1f04:  nop 
	IL_1f05:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1f0a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1f0f:  stloc 1

	IL_1f13:  nop 
	IL_1f14:  nop 
	IL_1f15:  ldloc 1

	IL_1f19:  nop 
	IL_1f1a:  nop 
	IL_1f1b:  ldc.i4 1
	IL_1f20:  beq IL_1f2a

	IL_1f25:  br IL_1f88

	IL_1f2a:  ldarg 1

	IL_1f2e:  nop 
	IL_1f2f:  nop 
	IL_1f30:  stloc 105

	IL_1f34:  nop 
	IL_1f35:  nop 
	IL_1f36:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddIf()
	IL_1f3b:  ldloc 105

	IL_1f3f:  nop 
	IL_1f40:  nop 
	IL_1f41:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt::Exp
	IL_1f46:  stloc 106

	IL_1f4a:  nop 
	IL_1f4b:  nop 
	IL_1f4c:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1f51:  stloc 90

	IL_1f55:  nop 
	IL_1f56:  nop 
	IL_1f57:  ldloc 90

	IL_1f5b:  nop 
	IL_1f5c:  nop 
	IL_1f5d:  ldloc 106

	IL_1f61:  nop 
	IL_1f62:  nop 
	IL_1f63:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1f68:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1f6d:  stloc 103

	IL_1f71:  nop 
	IL_1f72:  nop 
	IL_1f73:  ldloc 103

	IL_1f77:  nop 
	IL_1f78:  nop 
	IL_1f79:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBrfalse(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1f7e:  br IL_2322

	IL_1f83:  br IL_1f8d

	IL_1f88:  br IL_1f8d

	IL_1f8d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt
	IL_1f92:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1f97:  stloc 0

	IL_1f9b:  nop 
	IL_1f9c:  nop 
	IL_1f9d:  ldloc 0

	IL_1fa1:  nop 
	IL_1fa2:  nop 
	IL_1fa3:  ldarg 1

	IL_1fa7:  nop 
	IL_1fa8:  nop 
	IL_1fa9:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1fae:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1fb3:  stloc 1

	IL_1fb7:  nop 
	IL_1fb8:  nop 
	IL_1fb9:  ldloc 1

	IL_1fbd:  nop 
	IL_1fbe:  nop 
	IL_1fbf:  ldc.i4 1
	IL_1fc4:  beq IL_1fce

	IL_1fc9:  br IL_2058

	IL_1fce:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_1fd3:  stloc 102

	IL_1fd7:  nop 
	IL_1fd8:  nop 
	IL_1fd9:  ldloc 102

	IL_1fdd:  nop 
	IL_1fde:  nop 
	IL_1fdf:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1fe4:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1fe9:  stloc 103

	IL_1fed:  nop 
	IL_1fee:  nop 
	IL_1fef:  ldloc 103

	IL_1ff3:  nop 
	IL_1ff4:  nop 
	IL_1ff5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1ffa:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::SetIfNxtBlkLbl()
	IL_1fff:  ldarg 1

	IL_2003:  nop 
	IL_2004:  nop 
	IL_2005:  stloc 107

	IL_2009:  nop 
	IL_200a:  nop 
	IL_200b:  ldloc 107

	IL_200f:  nop 
	IL_2010:  nop 
	IL_2011:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt::Exp
	IL_2016:  stloc 108

	IL_201a:  nop 
	IL_201b:  nop 
	IL_201c:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_2021:  stloc 90

	IL_2025:  nop 
	IL_2026:  nop 
	IL_2027:  ldloc 90

	IL_202b:  nop 
	IL_202c:  nop 
	IL_202d:  ldloc 108

	IL_2031:  nop 
	IL_2032:  nop 
	IL_2033:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_2038:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_203d:  stloc 103

	IL_2041:  nop 
	IL_2042:  nop 
	IL_2043:  ldloc 103

	IL_2047:  nop 
	IL_2048:  nop 
	IL_2049:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBrfalse(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_204e:  br IL_2322

	IL_2053:  br IL_205d

	IL_2058:  br IL_205d

	IL_205d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseStmt
	IL_2062:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2067:  stloc 0

	IL_206b:  nop 
	IL_206c:  nop 
	IL_206d:  ldloc 0

	IL_2071:  nop 
	IL_2072:  nop 
	IL_2073:  ldarg 1

	IL_2077:  nop 
	IL_2078:  nop 
	IL_2079:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_207e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2083:  stloc 1

	IL_2087:  nop 
	IL_2088:  nop 
	IL_2089:  ldloc 1

	IL_208d:  nop 
	IL_208e:  nop 
	IL_208f:  ldc.i4 1
	IL_2094:  beq IL_209e

	IL_2099:  br IL_20d9

	IL_209e:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_20a3:  stloc 102

	IL_20a7:  nop 
	IL_20a8:  nop 
	IL_20a9:  ldloc 102

	IL_20ad:  nop 
	IL_20ae:  nop 
	IL_20af:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_20b4:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_20b9:  stloc 103

	IL_20bd:  nop 
	IL_20be:  nop 
	IL_20bf:  ldloc 103

	IL_20c3:  nop 
	IL_20c4:  nop 
	IL_20c5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_20ca:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::SetIfElsePass()
	IL_20cf:  br IL_2322

	IL_20d4:  br IL_20de

	IL_20d9:  br IL_20de

	IL_20de:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndIfStmt
	IL_20e3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_20e8:  stloc 0

	IL_20ec:  nop 
	IL_20ed:  nop 
	IL_20ee:  ldloc 0

	IL_20f2:  nop 
	IL_20f3:  nop 
	IL_20f4:  ldarg 1

	IL_20f8:  nop 
	IL_20f9:  nop 
	IL_20fa:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_20ff:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2104:  stloc 1

	IL_2108:  nop 
	IL_2109:  nop 
	IL_210a:  ldloc 1

	IL_210e:  nop 
	IL_210f:  nop 
	IL_2110:  ldc.i4 1
	IL_2115:  beq IL_211f

	IL_211a:  br IL_2184

	IL_211f:  call bool class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfElsePass()
	IL_2124:  stloc 1

	IL_2128:  nop 
	IL_2129:  nop 
	IL_212a:  ldloc 1

	IL_212e:  nop 
	IL_212f:  nop 
	IL_2130:  ldc.i4 0
	IL_2135:  beq IL_213f

	IL_213a:  br IL_215a

	IL_213f:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_2144:  stloc 103

	IL_2148:  nop 
	IL_2149:  nop 
	IL_214a:  ldloc 103

	IL_214e:  nop 
	IL_214f:  nop 
	IL_2150:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_2155:  br IL_215f

	IL_215a:  br IL_215f

	IL_215f:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_2164:  stloc 102

	IL_2168:  nop 
	IL_2169:  nop 
	IL_216a:  ldloc 102

	IL_216e:  nop 
	IL_216f:  nop 
	IL_2170:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_2175:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::PopIf()
	IL_217a:  br IL_2322

	IL_217f:  br IL_2189

	IL_2184:  br IL_2189

	IL_2189:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt
	IL_218e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2193:  stloc 0

	IL_2197:  nop 
	IL_2198:  nop 
	IL_2199:  ldloc 0

	IL_219d:  nop 
	IL_219e:  nop 
	IL_219f:  ldarg 1

	IL_21a3:  nop 
	IL_21a4:  nop 
	IL_21a5:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_21aa:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_21af:  stloc 1

	IL_21b3:  nop 
	IL_21b4:  nop 
	IL_21b5:  ldloc 1

	IL_21b9:  nop 
	IL_21ba:  nop 
	IL_21bb:  ldc.i4 1
	IL_21c0:  beq IL_21ca

	IL_21c5:  br IL_2201

	IL_21ca:  ldarg 1

	IL_21ce:  nop 
	IL_21cf:  nop 
	IL_21d0:  stloc 110

	IL_21d4:  nop 
	IL_21d5:  nop 
	IL_21d6:  ldloc 110

	IL_21da:  nop 
	IL_21db:  nop 
	IL_21dc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt::LabelName
	IL_21e1:  stloc 109

	IL_21e5:  nop 
	IL_21e6:  nop 
	IL_21e7:  ldloc 109

	IL_21eb:  nop 
	IL_21ec:  nop 
	IL_21ed:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_21f2:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddLbl(string)
	IL_21f7:  br IL_2322

	IL_21fc:  br IL_2206

	IL_2201:  br IL_2206

	IL_2206:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt
	IL_220b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2210:  stloc 0

	IL_2214:  nop 
	IL_2215:  nop 
	IL_2216:  ldloc 0

	IL_221a:  nop 
	IL_221b:  nop 
	IL_221c:  ldarg 1

	IL_2220:  nop 
	IL_2221:  nop 
	IL_2222:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_2227:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_222c:  stloc 1

	IL_2230:  nop 
	IL_2231:  nop 
	IL_2232:  ldloc 1

	IL_2236:  nop 
	IL_2237:  nop 
	IL_2238:  ldc.i4 1
	IL_223d:  beq IL_2247

	IL_2242:  br IL_228f

	IL_2247:  ldarg 1

	IL_224b:  nop 
	IL_224c:  nop 
	IL_224d:  stloc 111

	IL_2251:  nop 
	IL_2252:  nop 
	IL_2253:  ldloc 111

	IL_2257:  nop 
	IL_2258:  nop 
	IL_2259:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt::LabelName
	IL_225e:  stloc 109

	IL_2262:  nop 
	IL_2263:  nop 
	IL_2264:  ldloc 109

	IL_2268:  nop 
	IL_2269:  nop 
	IL_226a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_226f:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.Helpers::GetLbl(string)
	IL_2274:  stloc 104

	IL_2278:  nop 
	IL_2279:  nop 
	IL_227a:  ldloc 104

	IL_227e:  nop 
	IL_227f:  nop 
	IL_2280:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_2285:  br IL_2322

	IL_228a:  br IL_2294

	IL_228f:  br IL_2294

	IL_2294:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt
	IL_2299:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_229e:  stloc 0

	IL_22a2:  nop 
	IL_22a3:  nop 
	IL_22a4:  ldloc 0

	IL_22a8:  nop 
	IL_22a9:  nop 
	IL_22aa:  ldarg 1

	IL_22ae:  nop 
	IL_22af:  nop 
	IL_22b0:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_22b5:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_22ba:  stloc 1

	IL_22be:  nop 
	IL_22bf:  nop 
	IL_22c0:  ldloc 1

	IL_22c4:  nop 
	IL_22c5:  nop 
	IL_22c6:  ldc.i4 1
	IL_22cb:  beq IL_22d5

	IL_22d0:  br IL_231d

	IL_22d5:  ldarg 1

	IL_22d9:  nop 
	IL_22da:  nop 
	IL_22db:  stloc 112

	IL_22df:  nop 
	IL_22e0:  nop 
	IL_22e1:  ldloc 112

	IL_22e5:  nop 
	IL_22e6:  nop 
	IL_22e7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt::LabelName
	IL_22ec:  stloc 109

	IL_22f0:  nop 
	IL_22f1:  nop 
	IL_22f2:  ldloc 109

	IL_22f6:  nop 
	IL_22f7:  nop 
	IL_22f8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_22fd:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.Helpers::GetLbl(string)
	IL_2302:  stloc 104

	IL_2306:  nop 
	IL_2307:  nop 
	IL_2308:  ldloc 104

	IL_230c:  nop 
	IL_230d:  nop 
	IL_230e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_2313:  br IL_2322

	IL_2318:  br IL_2322

	IL_231d:  br IL_2322

	IL_2322:  ret 
    } // end of method StmtReader::Read

    // method line 91
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xdeac
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method StmtReader::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.StmtReader
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi CodeGenerator
  	extends [mscorlib]System.Object
  {

    // method line 92
    .method public 
           instance default void EmitMSIL (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet stmts, string fpath)  cil managed 
    {
        // Method begins at RVA 0xdec0
	// Code size 1126 (0x466)
	.maxstack 40
	.locals init (
		int32	V_0,
		int32	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt	V_2,
		class [mscorlib]System.Type	V_3,
		bool	V_4,
		string	V_5,
		class [mscorlib]System.Reflection.Emit.ModuleBuilder	V_6,
		class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IncludeStmt	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_9,
		bool	V_10,
		char[]	V_11,
		class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet	V_13,
		class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet	V_15,
		class dylan.NET.Tokenizer.CodeGen.StmtReader	V_16,
		class [mscorlib]System.Reflection.Emit.AssemblyBuilder	V_17)
	IL_0000:  ldc.i4 -1
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldarg 1

	IL_000f:  nop 
	IL_0010:  nop 
	IL_0011:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_0016:  ldlen 
	IL_0017:  conv.i4 
	IL_0018:  ldc.i4 1
	IL_001d:  sub 
	IL_001e:  stloc 1

	IL_0022:  nop 
	IL_0023:  nop 
	IL_0024:  ldnull 
	IL_0025:  stloc 2

	IL_0029:  nop 
	IL_002a:  nop 
	IL_002b:  ldstr ""
	IL_0030:  stloc 5

	IL_0034:  nop 
	IL_0035:  nop 
	IL_0036:  ldarg 2

	IL_003a:  nop 
	IL_003b:  nop 
	IL_003c:  stsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_0041:  ldarg 2

	IL_0045:  nop 
	IL_0046:  nop 
	IL_0047:  call void class [dnr]dylan.NET.Reflection.ILEmitter::AddSrcFile(string)
	IL_004c:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] [dnr]dylan.NET.Reflection.ILEmitter::DocWriters
	IL_0051:  ldlen 
	IL_0052:  conv.i4 
	IL_0053:  ldc.i4 0
	IL_0058:  bgt IL_0062

	IL_005d:  br IL_00bf

	IL_0062:  ldsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_0067:  stloc 6

	IL_006b:  nop 
	IL_006c:  nop 
	IL_006d:  ldarg 2

	IL_0071:  nop 
	IL_0072:  nop 
	IL_0073:  call string class [mscorlib]System.IO.Path::GetFullPath(string)
	IL_0078:  starg 2

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldloc 6

	IL_0082:  nop 
	IL_0083:  nop 
	IL_0084:  ldarg 2

	IL_0088:  nop 
	IL_0089:  nop 
	IL_008a:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_008f:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_0094:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_0099:  callvirt instance class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter class [mscorlib]System.Reflection.Emit.ModuleBuilder::DefineDocument(string, valuetype [mscorlib]System.Guid, valuetype [mscorlib]System.Guid, valuetype [mscorlib]System.Guid)
	IL_009e:  stloc 7

	IL_00a2:  nop 
	IL_00a3:  nop 
	IL_00a4:  ldloc 7

	IL_00a8:  nop 
	IL_00a9:  nop 
	IL_00aa:  stsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter [dnr]dylan.NET.Reflection.ILEmitter::DocWriter
	IL_00af:  ldloc 7

	IL_00b3:  nop 
	IL_00b4:  nop 
	IL_00b5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::AddDocWriter(class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter)
	IL_00ba:  br IL_00c4

	IL_00bf:  br IL_00c4

	IL_00c4:  ldloc 0

	IL_00c8:  nop 
	IL_00c9:  nop 
	IL_00ca:  ldc.i4 1
	IL_00cf:  add 
	IL_00d0:  stloc 0

	IL_00d4:  nop 
	IL_00d5:  nop 
	IL_00d6:  ldarg 1

	IL_00da:  nop 
	IL_00db:  nop 
	IL_00dc:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_00e1:  ldloc 0

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  conv.u 
	IL_00e8:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_00ed:  stloc 2

	IL_00f1:  nop 
	IL_00f2:  nop 
	IL_00f3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IncludeStmt
	IL_00f8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00fd:  stloc 3

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  ldloc 3

	IL_0107:  nop 
	IL_0108:  nop 
	IL_0109:  ldloc 2

	IL_010d:  nop 
	IL_010e:  nop 
	IL_010f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0114:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0119:  stloc 4

	IL_011d:  nop 
	IL_011e:  nop 
	IL_011f:  ldloc 4

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  ldc.i4 1
	IL_012a:  beq IL_0134

	IL_012f:  br IL_02ee

	IL_0134:  ldloc 2

	IL_0138:  nop 
	IL_0139:  nop 
	IL_013a:  stloc 8

	IL_013e:  nop 
	IL_013f:  nop 
	IL_0140:  ldloc 8

	IL_0144:  nop 
	IL_0145:  nop 
	IL_0146:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IncludeStmt::Path
	IL_014b:  stloc 9

	IL_014f:  nop 
	IL_0150:  nop 
	IL_0151:  ldstr "^"
	IL_0156:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_015b:  ldstr "(.)*"
	IL_0160:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0165:  call string string::Concat(string, string, string, string)
	IL_016a:  stloc 5

	IL_016e:  nop 
	IL_016f:  nop 
	IL_0170:  ldloc 5

	IL_0174:  nop 
	IL_0175:  nop 
	IL_0176:  ldstr "$"
	IL_017b:  call string string::Concat(string, string)
	IL_0180:  stloc 5

	IL_0184:  nop 
	IL_0185:  nop 
	IL_0186:  ldloc 9

	IL_018a:  nop 
	IL_018b:  nop 
	IL_018c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0191:  ldloc 5

	IL_0195:  nop 
	IL_0196:  nop 
	IL_0197:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_019c:  stloc 10

	IL_01a0:  nop 
	IL_01a1:  nop 
	IL_01a2:  ldloc 10

	IL_01a6:  nop 
	IL_01a7:  nop 
	IL_01a8:  ldc.i4 1
	IL_01ad:  beq IL_01b7

	IL_01b2:  br IL_0221

	IL_01b7:  ldloc 9

	IL_01bb:  nop 
	IL_01bc:  nop 
	IL_01bd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01c2:  stloc 5

	IL_01c6:  nop 
	IL_01c7:  nop 
	IL_01c8:  ldc.i4 1
	IL_01cd:  conv.u 
	IL_01ce:  newarr [mscorlib]System.Char
	IL_01d3:  stloc 11

	IL_01d7:  nop 
	IL_01d8:  nop 
	IL_01d9:  ldloc 11

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  ldc.i4 0
	IL_01e4:  conv.u 
	IL_01e5:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_01ea:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_01ef:  stelem [mscorlib]System.Char
	IL_01f4:  ldloc 5

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  ldloc 11

	IL_01fe:  nop 
	IL_01ff:  nop 
	IL_0200:  callvirt instance string string::Trim(char[])
	IL_0205:  stloc 5

	IL_0209:  nop 
	IL_020a:  nop 
	IL_020b:  ldloc 9

	IL_020f:  nop 
	IL_0210:  nop 
	IL_0211:  ldloc 5

	IL_0215:  nop 
	IL_0216:  nop 
	IL_0217:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_021c:  br IL_0226

	IL_0221:  br IL_0226

	IL_0226:  ldloc 9

	IL_022a:  nop 
	IL_022b:  nop 
	IL_022c:  ldloc 9

	IL_0230:  nop 
	IL_0231:  nop 
	IL_0232:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0237:  call string class [dnu]dylan.NET.Utils.ParseUtils::ProcessMSYSPath(string)
	IL_023c:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0241:  newobj instance void class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::'.ctor'()
	IL_0246:  stloc 12

	IL_024a:  nop 
	IL_024b:  nop 
	IL_024c:  ldstr "Now Lexing: "
	IL_0251:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0256:  ldloc 9

	IL_025a:  nop 
	IL_025b:  nop 
	IL_025c:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0261:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0266:  ldloc 12

	IL_026a:  nop 
	IL_026b:  nop 
	IL_026c:  ldloc 9

	IL_0270:  nop 
	IL_0271:  nop 
	IL_0272:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0277:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Lexer]dylan.NET.Tokenizer.Lexer.Lexer::Analyze(string)
	IL_027c:  stloc 13

	IL_0280:  nop 
	IL_0281:  nop 
	IL_0282:  ldstr "...Done."
	IL_0287:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_028c:  newobj instance void class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::'.ctor'()
	IL_0291:  stloc 14

	IL_0295:  nop 
	IL_0296:  nop 
	IL_0297:  ldstr "Now Parsing: "
	IL_029c:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_02a1:  ldloc 9

	IL_02a5:  nop 
	IL_02a6:  nop 
	IL_02a7:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02ac:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_02b1:  ldloc 14

	IL_02b5:  nop 
	IL_02b6:  nop 
	IL_02b7:  ldloc 13

	IL_02bb:  nop 
	IL_02bc:  nop 
	IL_02bd:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet class [tokenizer.Parser]dylan.NET.Tokenizer.Parser.Parser::Parse(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet)
	IL_02c2:  stloc 15

	IL_02c6:  nop 
	IL_02c7:  nop 
	IL_02c8:  ldstr "...Done."
	IL_02cd:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_02d2:  ldarg.0 
	IL_02d3:  ldloc 15

	IL_02d7:  nop 
	IL_02d8:  nop 
	IL_02d9:  ldloc 9

	IL_02dd:  nop 
	IL_02de:  nop 
	IL_02df:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02e4:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.CodeGenerator::EmitMSIL(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet, string)
	IL_02e9:  br IL_0315

	IL_02ee:  newobj instance void class dylan.NET.Tokenizer.CodeGen.StmtReader::'.ctor'()
	IL_02f3:  stloc 16

	IL_02f7:  nop 
	IL_02f8:  nop 
	IL_02f9:  ldloc 16

	IL_02fd:  nop 
	IL_02fe:  nop 
	IL_02ff:  ldloc 2

	IL_0303:  nop 
	IL_0304:  nop 
	IL_0305:  ldarg 2

	IL_0309:  nop 
	IL_030a:  nop 
	IL_030b:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.StmtReader::Read(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, string)
	IL_0310:  br IL_0315

	IL_0315:  ldloc 0

	IL_0319:  nop 
	IL_031a:  nop 
	IL_031b:  ldloc 1

	IL_031f:  nop 
	IL_0320:  nop 
	IL_0321:  beq IL_032b

	IL_0326:  br IL_0335

	IL_032b:  br IL_033f

	IL_0330:  br IL_033f

	IL_0335:  br IL_00c4

	IL_033a:  br IL_033f

	IL_033f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::PopSrcFile()
	IL_0344:  ldsfld string[] [dnr]dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0349:  ldlen 
	IL_034a:  conv.i4 
	IL_034b:  ldc.i4 1
	IL_0350:  sub 
	IL_0351:  stloc 0

	IL_0355:  nop 
	IL_0356:  nop 
	IL_0357:  ldloc 0

	IL_035b:  nop 
	IL_035c:  nop 
	IL_035d:  ldc.i4 0
	IL_0362:  bge IL_036c

	IL_0367:  br IL_0387

	IL_036c:  ldsfld string[] [dnr]dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0371:  ldloc 0

	IL_0375:  nop 
	IL_0376:  nop 
	IL_0377:  conv.u 
	IL_0378:  ldelem [mscorlib]System.String
	IL_037d:  stsfld string [dnr]dylan.NET.Reflection.ILEmitter::CurSrcFile
	IL_0382:  br IL_038c

	IL_0387:  br IL_038c

	IL_038c:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] [dnr]dylan.NET.Reflection.ILEmitter::DocWriters
	IL_0391:  ldlen 
	IL_0392:  conv.i4 
	IL_0393:  ldc.i4 1
	IL_0398:  sub 
	IL_0399:  stloc 0

	IL_039d:  nop 
	IL_039e:  nop 
	IL_039f:  ldloc 0

	IL_03a3:  nop 
	IL_03a4:  nop 
	IL_03a5:  ldc.i4 0
	IL_03aa:  bge IL_03b4

	IL_03af:  br IL_0406

	IL_03b4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::PopDocWriter()
	IL_03b9:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] [dnr]dylan.NET.Reflection.ILEmitter::DocWriters
	IL_03be:  ldlen 
	IL_03bf:  conv.i4 
	IL_03c0:  ldc.i4 1
	IL_03c5:  sub 
	IL_03c6:  stloc 0

	IL_03ca:  nop 
	IL_03cb:  nop 
	IL_03cc:  ldloc 0

	IL_03d0:  nop 
	IL_03d1:  nop 
	IL_03d2:  ldc.i4 0
	IL_03d7:  bge IL_03e1

	IL_03dc:  br IL_03fc

	IL_03e1:  ldsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter[] [dnr]dylan.NET.Reflection.ILEmitter::DocWriters
	IL_03e6:  ldloc 0

	IL_03ea:  nop 
	IL_03eb:  nop 
	IL_03ec:  conv.u 
	IL_03ed:  ldelem [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter
	IL_03f2:  stsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter [dnr]dylan.NET.Reflection.ILEmitter::DocWriter
	IL_03f7:  br IL_0401

	IL_03fc:  br IL_0401

	IL_0401:  br IL_040b

	IL_0406:  br IL_040b

	IL_040b:  ldsfld string[] [dnr]dylan.NET.Reflection.ILEmitter::SrcFiles
	IL_0410:  ldlen 
	IL_0411:  conv.i4 
	IL_0412:  ldc.i4 0
	IL_0417:  beq IL_0421

	IL_041c:  br IL_0460

	IL_0421:  ldstr "Writing Assembly to Disk"
	IL_0426:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_042b:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_0430:  stloc 17

	IL_0434:  nop 
	IL_0435:  nop 
	IL_0436:  ldloc 17

	IL_043a:  nop 
	IL_043b:  nop 
	IL_043c:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::DefineVersionInfoResource()
	IL_0441:  ldloc 17

	IL_0445:  nop 
	IL_0446:  nop 
	IL_0447:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmFile
	IL_044c:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::Save(string)
	IL_0451:  ldstr "...Done."
	IL_0456:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_045b:  br IL_0465

	IL_0460:  br IL_0465

	IL_0465:  ret 
    } // end of method CodeGenerator::EmitMSIL

    // method line 93
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xe334
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method CodeGenerator::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.CodeGenerator
}

