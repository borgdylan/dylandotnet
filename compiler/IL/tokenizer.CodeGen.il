.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:8:1
}
.assembly extern dnr
{
  .ver 11:2:8:1
}
.assembly extern dnu
{
  .ver 11:2:8:1
}
.assembly 'tokenizer.CodeGen'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 38 2E 31 00 00 ) // ...11.2.8.1..

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
  .ver  11:2:8:1
}

.module tokenizer.CodeGen.dll // GUID = {A8A80774-EE83-4565-AC00-A54C97601117}


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
           default void AddTypArr (class [mscorlib]System.Type[] arr)  cil managed 
    {
        // Method begins at RVA 0x25fc
	// Code size 304 (0x130)
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
	IL_012f:  ret 
    } // end of method SymTable::AddTypArr

    // method line 26
    .method public static 
           default class [mscorlib]System.Type[] PopTypArr ()  cil managed 
    {
        // Method begins at RVA 0x2738
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
        // Method begins at RVA 0x28ac
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
        // Method begins at RVA 0x29ec
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
        // Method begins at RVA 0x2b2c
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
        // Method begins at RVA 0x2c70
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
        // Method begins at RVA 0x2db4
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
        // Method begins at RVA 0x2eec
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
        // Method begins at RVA 0x3024
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
        // Method begins at RVA 0x3174
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
        // Method begins at RVA 0x327c
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
        // Method begins at RVA 0x32c0
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
        // Method begins at RVA 0x3304
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
        // Method begins at RVA 0x3348
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
        // Method begins at RVA 0x3390
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
        // Method begins at RVA 0x33d8
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
        // Method begins at RVA 0x351c
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
        // Method begins at RVA 0x362c
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
        // Method begins at RVA 0x373c
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
        // Method begins at RVA 0x384c
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
        // Method begins at RVA 0x3988
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
        // Method begins at RVA 0x3ad4
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
        // Method begins at RVA 0x3be4
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
        // Method begins at RVA 0x3cf4
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
        // Method begins at RVA 0x3d2c
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
        // Method begins at RVA 0x4000
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
        // Method begins at RVA 0x4410
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
        // Method begins at RVA 0x4768
	// Code size 709 (0x2c5)
	.maxstack 15
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
	IL_01d9:  br IL_02b9

	IL_01de:  ldarg 0

	IL_01e2:  nop 
	IL_01e3:  nop 
	IL_01e4:  ldfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_01e9:  ldnull 
	IL_01ea:  beq IL_01f4

	IL_01ef:  br IL_0279

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

	IL_023f:  br IL_0254

	IL_0244:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0249:  stloc 1

	IL_024d:  nop 
	IL_024e:  nop 
	IL_024f:  br IL_026f

	IL_0254:  ldarg 0

	IL_0258:  nop 
	IL_0259:  nop 
	IL_025a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_025f:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_0264:  stloc 1

	IL_0268:  nop 
	IL_0269:  nop 
	IL_026a:  br IL_026f

	IL_026f:  br IL_02b4

	IL_0274:  br IL_027e

	IL_0279:  br IL_027e

	IL_027e:  ldarg 0

	IL_0282:  nop 
	IL_0283:  nop 
	IL_0284:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsArray
	IL_0289:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeArr
	IL_028e:  ldarg 0

	IL_0292:  nop 
	IL_0293:  nop 
	IL_0294:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::IsByRef
	IL_0299:  stsfld bool [dnr]dylan.NET.Reflection.Loader::MakeRef
	IL_029e:  ldarg 0

	IL_02a2:  nop 
	IL_02a3:  nop 
	IL_02a4:  ldfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_02a9:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::ProcessType(class [mscorlib]System.Type)
	IL_02ae:  stloc 1

	IL_02b2:  nop 
	IL_02b3:  nop 
	IL_02b4:  br IL_02b9

	IL_02b9:  ldloc 1

	IL_02bd:  nop 
	IL_02be:  nop 
	IL_02bf:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type01
	IL_02c4:  ret 
    } // end of method Helpers::EvalTTok

    // method line 53
    .method public static 
           default class [mscorlib]System.Type CommitEvalTTok (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok tt)  cil managed 
    {
        // Method begins at RVA 0x4a3c
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
        // Method begins at RVA 0x4a5c
	// Code size 202 (0xca)
	.maxstack 5
	.locals init (
		int32	V_0,
		int32	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_4,
		class [mscorlib]System.Type	V_5)
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
	IL_0057:  ldloc 2

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.VarExpr::VarTyp
	IL_0062:  stloc 3

	IL_0066:  nop 
	IL_0067:  nop 
	IL_0068:  ldloc 3

	IL_006c:  nop 
	IL_006d:  nop 
	IL_006e:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0073:  stloc 5

	IL_0077:  nop 
	IL_0078:  nop 
	IL_0079:  ldloc 5

	IL_007d:  nop 
	IL_007e:  nop 
	IL_007f:  ldnull 
	IL_0080:  beq IL_009a

	IL_0085:  br IL_008a

	IL_008a:  ldloc 5

	IL_008e:  nop 
	IL_008f:  nop 
	IL_0090:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_0095:  br IL_009f

	IL_009a:  br IL_009f

	IL_009f:  ldloc 1

	IL_00a3:  nop 
	IL_00a4:  nop 
	IL_00a5:  ldloc 0

	IL_00a9:  nop 
	IL_00aa:  nop 
	IL_00ab:  beq IL_00b5

	IL_00b0:  br IL_00bf

	IL_00b5:  br IL_00c9

	IL_00ba:  br IL_00c9

	IL_00bf:  br IL_002d

	IL_00c4:  br IL_00c9

	IL_00c9:  ret 
    } // end of method Helpers::ProcessParams

    // method line 55
    .method public static 
           default void PostProcessParams (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] ps)  cil managed 
    {
        // Method begins at RVA 0x4b34
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
        // Method begins at RVA 0x4c70
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
           default int32 getCodeFromType (class [mscorlib]System.Type typ)  cil managed 
    {
        // Method begins at RVA 0x4dac
	// Code size 1319 (0x527)
	.maxstack 46
	.locals init (
		int32	V_0,
		bool	V_1,
		class [mscorlib]System.Type	V_2)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 0

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stloc 1

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldtoken [mscorlib]System.Boolean
	IL_001b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0020:  stloc 2

	IL_0024:  nop 
	IL_0025:  nop 
	IL_0026:  ldarg 0

	IL_002a:  nop 
	IL_002b:  nop 
	IL_002c:  ldloc 2

	IL_0030:  nop 
	IL_0031:  nop 
	IL_0032:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0037:  stloc 1

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldloc 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ldc.i4 1
	IL_0048:  beq IL_0052

	IL_004d:  br IL_0067

	IL_0052:  ldc.i4 101
	IL_0057:  stloc 0

	IL_005b:  nop 
	IL_005c:  nop 
	IL_005d:  br IL_0520

	IL_0062:  br IL_006c

	IL_0067:  br IL_006c

	IL_006c:  ldtoken [mscorlib]System.Byte
	IL_0071:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0076:  stloc 2

	IL_007a:  nop 
	IL_007b:  nop 
	IL_007c:  ldarg 0

	IL_0080:  nop 
	IL_0081:  nop 
	IL_0082:  ldloc 2

	IL_0086:  nop 
	IL_0087:  nop 
	IL_0088:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_008d:  stloc 1

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldloc 1

	IL_0097:  nop 
	IL_0098:  nop 
	IL_0099:  ldc.i4 1
	IL_009e:  beq IL_00a8

	IL_00a3:  br IL_00bd

	IL_00a8:  ldc.i4 8
	IL_00ad:  stloc 0

	IL_00b1:  nop 
	IL_00b2:  nop 
	IL_00b3:  br IL_0520

	IL_00b8:  br IL_00c2

	IL_00bd:  br IL_00c2

	IL_00c2:  ldtoken [mscorlib]System.UInt16
	IL_00c7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00cc:  stloc 2

	IL_00d0:  nop 
	IL_00d1:  nop 
	IL_00d2:  ldarg 0

	IL_00d6:  nop 
	IL_00d7:  nop 
	IL_00d8:  ldloc 2

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_00e3:  stloc 1

	IL_00e7:  nop 
	IL_00e8:  nop 
	IL_00e9:  ldloc 1

	IL_00ed:  nop 
	IL_00ee:  nop 
	IL_00ef:  ldc.i4 1
	IL_00f4:  beq IL_00fe

	IL_00f9:  br IL_0113

	IL_00fe:  ldc.i4 16
	IL_0103:  stloc 0

	IL_0107:  nop 
	IL_0108:  nop 
	IL_0109:  br IL_0520

	IL_010e:  br IL_0118

	IL_0113:  br IL_0118

	IL_0118:  ldtoken [mscorlib]System.UInt32
	IL_011d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0122:  stloc 2

	IL_0126:  nop 
	IL_0127:  nop 
	IL_0128:  ldarg 0

	IL_012c:  nop 
	IL_012d:  nop 
	IL_012e:  ldloc 2

	IL_0132:  nop 
	IL_0133:  nop 
	IL_0134:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0139:  stloc 1

	IL_013d:  nop 
	IL_013e:  nop 
	IL_013f:  ldloc 1

	IL_0143:  nop 
	IL_0144:  nop 
	IL_0145:  ldc.i4 1
	IL_014a:  beq IL_0154

	IL_014f:  br IL_0169

	IL_0154:  ldc.i4 32
	IL_0159:  stloc 0

	IL_015d:  nop 
	IL_015e:  nop 
	IL_015f:  br IL_0520

	IL_0164:  br IL_016e

	IL_0169:  br IL_016e

	IL_016e:  ldtoken [mscorlib]System.UIntPtr
	IL_0173:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0178:  stloc 2

	IL_017c:  nop 
	IL_017d:  nop 
	IL_017e:  ldarg 0

	IL_0182:  nop 
	IL_0183:  nop 
	IL_0184:  ldloc 2

	IL_0188:  nop 
	IL_0189:  nop 
	IL_018a:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_018f:  stloc 1

	IL_0193:  nop 
	IL_0194:  nop 
	IL_0195:  ldloc 1

	IL_0199:  nop 
	IL_019a:  nop 
	IL_019b:  ldc.i4 1
	IL_01a0:  beq IL_01aa

	IL_01a5:  br IL_01bf

	IL_01aa:  ldc.i4 40
	IL_01af:  stloc 0

	IL_01b3:  nop 
	IL_01b4:  nop 
	IL_01b5:  br IL_0520

	IL_01ba:  br IL_01c4

	IL_01bf:  br IL_01c4

	IL_01c4:  ldtoken [mscorlib]System.UInt64
	IL_01c9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01ce:  stloc 2

	IL_01d2:  nop 
	IL_01d3:  nop 
	IL_01d4:  ldarg 0

	IL_01d8:  nop 
	IL_01d9:  nop 
	IL_01da:  ldloc 2

	IL_01de:  nop 
	IL_01df:  nop 
	IL_01e0:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_01e5:  stloc 1

	IL_01e9:  nop 
	IL_01ea:  nop 
	IL_01eb:  ldloc 1

	IL_01ef:  nop 
	IL_01f0:  nop 
	IL_01f1:  ldc.i4 1
	IL_01f6:  beq IL_0200

	IL_01fb:  br IL_0215

	IL_0200:  ldc.i4 64
	IL_0205:  stloc 0

	IL_0209:  nop 
	IL_020a:  nop 
	IL_020b:  br IL_0520

	IL_0210:  br IL_021a

	IL_0215:  br IL_021a

	IL_021a:  ldtoken [mscorlib]System.SByte
	IL_021f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0224:  stloc 2

	IL_0228:  nop 
	IL_0229:  nop 
	IL_022a:  ldarg 0

	IL_022e:  nop 
	IL_022f:  nop 
	IL_0230:  ldloc 2

	IL_0234:  nop 
	IL_0235:  nop 
	IL_0236:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_023b:  stloc 1

	IL_023f:  nop 
	IL_0240:  nop 
	IL_0241:  ldloc 1

	IL_0245:  nop 
	IL_0246:  nop 
	IL_0247:  ldc.i4 1
	IL_024c:  beq IL_0256

	IL_0251:  br IL_026b

	IL_0256:  ldc.i4 108
	IL_025b:  stloc 0

	IL_025f:  nop 
	IL_0260:  nop 
	IL_0261:  br IL_0520

	IL_0266:  br IL_0270

	IL_026b:  br IL_0270

	IL_0270:  ldtoken [mscorlib]System.Int16
	IL_0275:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_027a:  stloc 2

	IL_027e:  nop 
	IL_027f:  nop 
	IL_0280:  ldarg 0

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  ldloc 2

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0291:  stloc 1

	IL_0295:  nop 
	IL_0296:  nop 
	IL_0297:  ldloc 1

	IL_029b:  nop 
	IL_029c:  nop 
	IL_029d:  ldc.i4 1
	IL_02a2:  beq IL_02ac

	IL_02a7:  br IL_02c1

	IL_02ac:  ldc.i4 116
	IL_02b1:  stloc 0

	IL_02b5:  nop 
	IL_02b6:  nop 
	IL_02b7:  br IL_0520

	IL_02bc:  br IL_02c6

	IL_02c1:  br IL_02c6

	IL_02c6:  ldtoken [mscorlib]System.Int32
	IL_02cb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02d0:  stloc 2

	IL_02d4:  nop 
	IL_02d5:  nop 
	IL_02d6:  ldarg 0

	IL_02da:  nop 
	IL_02db:  nop 
	IL_02dc:  ldloc 2

	IL_02e0:  nop 
	IL_02e1:  nop 
	IL_02e2:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_02e7:  stloc 1

	IL_02eb:  nop 
	IL_02ec:  nop 
	IL_02ed:  ldloc 1

	IL_02f1:  nop 
	IL_02f2:  nop 
	IL_02f3:  ldc.i4 1
	IL_02f8:  beq IL_0302

	IL_02fd:  br IL_0317

	IL_0302:  ldc.i4 132
	IL_0307:  stloc 0

	IL_030b:  nop 
	IL_030c:  nop 
	IL_030d:  br IL_0520

	IL_0312:  br IL_031c

	IL_0317:  br IL_031c

	IL_031c:  ldtoken [mscorlib]System.IntPtr
	IL_0321:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0326:  stloc 2

	IL_032a:  nop 
	IL_032b:  nop 
	IL_032c:  ldarg 0

	IL_0330:  nop 
	IL_0331:  nop 
	IL_0332:  ldloc 2

	IL_0336:  nop 
	IL_0337:  nop 
	IL_0338:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_033d:  stloc 1

	IL_0341:  nop 
	IL_0342:  nop 
	IL_0343:  ldloc 1

	IL_0347:  nop 
	IL_0348:  nop 
	IL_0349:  ldc.i4 1
	IL_034e:  beq IL_0358

	IL_0353:  br IL_036d

	IL_0358:  ldc.i4 140
	IL_035d:  stloc 0

	IL_0361:  nop 
	IL_0362:  nop 
	IL_0363:  br IL_0520

	IL_0368:  br IL_0372

	IL_036d:  br IL_0372

	IL_0372:  ldtoken [mscorlib]System.Char
	IL_0377:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_037c:  stloc 2

	IL_0380:  nop 
	IL_0381:  nop 
	IL_0382:  ldarg 0

	IL_0386:  nop 
	IL_0387:  nop 
	IL_0388:  ldloc 2

	IL_038c:  nop 
	IL_038d:  nop 
	IL_038e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0393:  stloc 1

	IL_0397:  nop 
	IL_0398:  nop 
	IL_0399:  ldloc 1

	IL_039d:  nop 
	IL_039e:  nop 
	IL_039f:  ldc.i4 1
	IL_03a4:  beq IL_03ae

	IL_03a9:  br IL_03c3

	IL_03ae:  ldc.i4 150
	IL_03b3:  stloc 0

	IL_03b7:  nop 
	IL_03b8:  nop 
	IL_03b9:  br IL_0520

	IL_03be:  br IL_03c8

	IL_03c3:  br IL_03c8

	IL_03c8:  ldtoken [mscorlib]System.Int64
	IL_03cd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03d2:  stloc 2

	IL_03d6:  nop 
	IL_03d7:  nop 
	IL_03d8:  ldarg 0

	IL_03dc:  nop 
	IL_03dd:  nop 
	IL_03de:  ldloc 2

	IL_03e2:  nop 
	IL_03e3:  nop 
	IL_03e4:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_03e9:  stloc 1

	IL_03ed:  nop 
	IL_03ee:  nop 
	IL_03ef:  ldloc 1

	IL_03f3:  nop 
	IL_03f4:  nop 
	IL_03f5:  ldc.i4 1
	IL_03fa:  beq IL_0404

	IL_03ff:  br IL_0419

	IL_0404:  ldc.i4 164
	IL_0409:  stloc 0

	IL_040d:  nop 
	IL_040e:  nop 
	IL_040f:  br IL_0520

	IL_0414:  br IL_041e

	IL_0419:  br IL_041e

	IL_041e:  ldtoken [mscorlib]System.Single
	IL_0423:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0428:  stloc 2

	IL_042c:  nop 
	IL_042d:  nop 
	IL_042e:  ldarg 0

	IL_0432:  nop 
	IL_0433:  nop 
	IL_0434:  ldloc 2

	IL_0438:  nop 
	IL_0439:  nop 
	IL_043a:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_043f:  stloc 1

	IL_0443:  nop 
	IL_0444:  nop 
	IL_0445:  ldloc 1

	IL_0449:  nop 
	IL_044a:  nop 
	IL_044b:  ldc.i4 1
	IL_0450:  beq IL_045a

	IL_0455:  br IL_046f

	IL_045a:  ldc.i4 232
	IL_045f:  stloc 0

	IL_0463:  nop 
	IL_0464:  nop 
	IL_0465:  br IL_0520

	IL_046a:  br IL_0474

	IL_046f:  br IL_0474

	IL_0474:  ldtoken [mscorlib]System.Double
	IL_0479:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_047e:  stloc 2

	IL_0482:  nop 
	IL_0483:  nop 
	IL_0484:  ldarg 0

	IL_0488:  nop 
	IL_0489:  nop 
	IL_048a:  ldloc 2

	IL_048e:  nop 
	IL_048f:  nop 
	IL_0490:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0495:  stloc 1

	IL_0499:  nop 
	IL_049a:  nop 
	IL_049b:  ldloc 1

	IL_049f:  nop 
	IL_04a0:  nop 
	IL_04a1:  ldc.i4 1
	IL_04a6:  beq IL_04b0

	IL_04ab:  br IL_04c5

	IL_04b0:  ldc.i4 264
	IL_04b5:  stloc 0

	IL_04b9:  nop 
	IL_04ba:  nop 
	IL_04bb:  br IL_0520

	IL_04c0:  br IL_04ca

	IL_04c5:  br IL_04ca

	IL_04ca:  ldtoken [mscorlib]System.String
	IL_04cf:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04d4:  stloc 2

	IL_04d8:  nop 
	IL_04d9:  nop 
	IL_04da:  ldarg 0

	IL_04de:  nop 
	IL_04df:  nop 
	IL_04e0:  ldloc 2

	IL_04e4:  nop 
	IL_04e5:  nop 
	IL_04e6:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_04eb:  stloc 1

	IL_04ef:  nop 
	IL_04f0:  nop 
	IL_04f1:  ldloc 1

	IL_04f5:  nop 
	IL_04f6:  nop 
	IL_04f7:  ldc.i4 1
	IL_04fc:  beq IL_0506

	IL_0501:  br IL_051b

	IL_0506:  ldc.i4 270
	IL_050b:  stloc 0

	IL_050f:  nop 
	IL_0510:  nop 
	IL_0511:  br IL_0520

	IL_0516:  br IL_0520

	IL_051b:  br IL_0520

	IL_0520:  ldloc 0

	IL_0524:  nop 
	IL_0525:  nop 
	IL_0526:  ret 
    } // end of method Helpers::getCodeFromType

    // method line 58
    .method public static 
           default class [mscorlib]System.Type getTypeFromCode (int32 cod)  cil managed 
    {
        // Method begins at RVA 0x52e0
	// Code size 803 (0x323)
	.maxstack 46
	.locals init (
		class [mscorlib]System.Type	V_0)
	IL_0000:  ldtoken [mscorlib]System.Object
	IL_0005:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_000a:  stloc 0

	IL_000e:  nop 
	IL_000f:  nop 
	IL_0010:  ldarg 0

	IL_0014:  nop 
	IL_0015:  nop 
	IL_0016:  ldc.i4 101
	IL_001b:  beq IL_0025

	IL_0020:  br IL_003f

	IL_0025:  ldtoken [mscorlib]System.Boolean
	IL_002a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_002f:  stloc 0

	IL_0033:  nop 
	IL_0034:  nop 
	IL_0035:  br IL_031c

	IL_003a:  br IL_0044

	IL_003f:  br IL_0044

	IL_0044:  ldarg 0

	IL_0048:  nop 
	IL_0049:  nop 
	IL_004a:  ldc.i4 8
	IL_004f:  beq IL_0059

	IL_0054:  br IL_0073

	IL_0059:  ldtoken [mscorlib]System.Byte
	IL_005e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0063:  stloc 0

	IL_0067:  nop 
	IL_0068:  nop 
	IL_0069:  br IL_031c

	IL_006e:  br IL_0078

	IL_0073:  br IL_0078

	IL_0078:  ldarg 0

	IL_007c:  nop 
	IL_007d:  nop 
	IL_007e:  ldc.i4 16
	IL_0083:  beq IL_008d

	IL_0088:  br IL_00a7

	IL_008d:  ldtoken [mscorlib]System.UInt16
	IL_0092:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0097:  stloc 0

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  br IL_031c

	IL_00a2:  br IL_00ac

	IL_00a7:  br IL_00ac

	IL_00ac:  ldarg 0

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldc.i4 32
	IL_00b7:  beq IL_00c1

	IL_00bc:  br IL_00db

	IL_00c1:  ldtoken [mscorlib]System.UInt32
	IL_00c6:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00cb:  stloc 0

	IL_00cf:  nop 
	IL_00d0:  nop 
	IL_00d1:  br IL_031c

	IL_00d6:  br IL_00e0

	IL_00db:  br IL_00e0

	IL_00e0:  ldarg 0

	IL_00e4:  nop 
	IL_00e5:  nop 
	IL_00e6:  ldc.i4 40
	IL_00eb:  beq IL_00f5

	IL_00f0:  br IL_010f

	IL_00f5:  ldtoken [mscorlib]System.UIntPtr
	IL_00fa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00ff:  stloc 0

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  br IL_031c

	IL_010a:  br IL_0114

	IL_010f:  br IL_0114

	IL_0114:  ldarg 0

	IL_0118:  nop 
	IL_0119:  nop 
	IL_011a:  ldc.i4 64
	IL_011f:  beq IL_0129

	IL_0124:  br IL_0143

	IL_0129:  ldtoken [mscorlib]System.UInt64
	IL_012e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0133:  stloc 0

	IL_0137:  nop 
	IL_0138:  nop 
	IL_0139:  br IL_031c

	IL_013e:  br IL_0148

	IL_0143:  br IL_0148

	IL_0148:  ldarg 0

	IL_014c:  nop 
	IL_014d:  nop 
	IL_014e:  ldc.i4 108
	IL_0153:  beq IL_015d

	IL_0158:  br IL_0177

	IL_015d:  ldtoken [mscorlib]System.SByte
	IL_0162:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0167:  stloc 0

	IL_016b:  nop 
	IL_016c:  nop 
	IL_016d:  br IL_031c

	IL_0172:  br IL_017c

	IL_0177:  br IL_017c

	IL_017c:  ldarg 0

	IL_0180:  nop 
	IL_0181:  nop 
	IL_0182:  ldc.i4 116
	IL_0187:  beq IL_0191

	IL_018c:  br IL_01ab

	IL_0191:  ldtoken [mscorlib]System.Int16
	IL_0196:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_019b:  stloc 0

	IL_019f:  nop 
	IL_01a0:  nop 
	IL_01a1:  br IL_031c

	IL_01a6:  br IL_01b0

	IL_01ab:  br IL_01b0

	IL_01b0:  ldarg 0

	IL_01b4:  nop 
	IL_01b5:  nop 
	IL_01b6:  ldc.i4 132
	IL_01bb:  beq IL_01c5

	IL_01c0:  br IL_01df

	IL_01c5:  ldtoken [mscorlib]System.Int32
	IL_01ca:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01cf:  stloc 0

	IL_01d3:  nop 
	IL_01d4:  nop 
	IL_01d5:  br IL_031c

	IL_01da:  br IL_01e4

	IL_01df:  br IL_01e4

	IL_01e4:  ldarg 0

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  ldc.i4 140
	IL_01ef:  beq IL_01f9

	IL_01f4:  br IL_0213

	IL_01f9:  ldtoken [mscorlib]System.IntPtr
	IL_01fe:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0203:  stloc 0

	IL_0207:  nop 
	IL_0208:  nop 
	IL_0209:  br IL_031c

	IL_020e:  br IL_0218

	IL_0213:  br IL_0218

	IL_0218:  ldarg 0

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  ldc.i4 150
	IL_0223:  beq IL_022d

	IL_0228:  br IL_0247

	IL_022d:  ldtoken [mscorlib]System.Char
	IL_0232:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0237:  stloc 0

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  br IL_031c

	IL_0242:  br IL_024c

	IL_0247:  br IL_024c

	IL_024c:  ldarg 0

	IL_0250:  nop 
	IL_0251:  nop 
	IL_0252:  ldc.i4 164
	IL_0257:  beq IL_0261

	IL_025c:  br IL_027b

	IL_0261:  ldtoken [mscorlib]System.Int64
	IL_0266:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_026b:  stloc 0

	IL_026f:  nop 
	IL_0270:  nop 
	IL_0271:  br IL_031c

	IL_0276:  br IL_0280

	IL_027b:  br IL_0280

	IL_0280:  ldarg 0

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  ldc.i4 232
	IL_028b:  beq IL_0295

	IL_0290:  br IL_02af

	IL_0295:  ldtoken [mscorlib]System.Single
	IL_029a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_029f:  stloc 0

	IL_02a3:  nop 
	IL_02a4:  nop 
	IL_02a5:  br IL_031c

	IL_02aa:  br IL_02b4

	IL_02af:  br IL_02b4

	IL_02b4:  ldarg 0

	IL_02b8:  nop 
	IL_02b9:  nop 
	IL_02ba:  ldc.i4 264
	IL_02bf:  beq IL_02c9

	IL_02c4:  br IL_02e3

	IL_02c9:  ldtoken [mscorlib]System.Double
	IL_02ce:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02d3:  stloc 0

	IL_02d7:  nop 
	IL_02d8:  nop 
	IL_02d9:  br IL_031c

	IL_02de:  br IL_02e8

	IL_02e3:  br IL_02e8

	IL_02e8:  ldarg 0

	IL_02ec:  nop 
	IL_02ed:  nop 
	IL_02ee:  ldc.i4 270
	IL_02f3:  beq IL_02fd

	IL_02f8:  br IL_0317

	IL_02fd:  ldtoken [mscorlib]System.String
	IL_0302:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0307:  stloc 0

	IL_030b:  nop 
	IL_030c:  nop 
	IL_030d:  br IL_031c

	IL_0312:  br IL_031c

	IL_0317:  br IL_031c

	IL_031c:  ldloc 0

	IL_0320:  nop 
	IL_0321:  nop 
	IL_0322:  ret 
    } // end of method Helpers::getTypeFromCode

    // method line 59
    .method public static 
           default void EmitLiteral (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal lit)  cil managed 
    {
        // Method begins at RVA 0x5610
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

    // method line 60
    .method public static 
           default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal ProcessConst (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral lit)  cil managed 
    {
        // Method begins at RVA 0x5a40
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

    // method line 61
    .method public static 
           default void EmitOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op op, bool s)  cil managed 
    {
        // Method begins at RVA 0x5ed0
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

    // method line 62
    .method public static 
           default void EmitLocLd (int32 ind, bool locarg)  cil managed 
    {
        // Method begins at RVA 0x6b60
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

    // method line 63
    .method public static 
           default void EmitLocSt (int32 ind, bool locarg)  cil managed 
    {
        // Method begins at RVA 0x6c70
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

    // method line 64
    .method public static 
           default void EmitConv (class [mscorlib]System.Type source, class [mscorlib]System.Type sink)  cil managed 
    {
        // Method begins at RVA 0x6cb4
	// Code size 2290 (0x8f2)
	.maxstack 119
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
	IL_003d:  callvirt instance bool class [mscorlib]System.Type::get_IsPrimitive()
	IL_0042:  stloc 2

	IL_0046:  nop 
	IL_0047:  nop 
	IL_0048:  ldarg 1

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  callvirt instance bool class [mscorlib]System.Type::get_IsPrimitive()
	IL_0053:  stloc 3

	IL_0057:  nop 
	IL_0058:  nop 
	IL_0059:  ldloc 2

	IL_005d:  nop 
	IL_005e:  nop 
	IL_005f:  ldloc 3

	IL_0063:  nop 
	IL_0064:  nop 
	IL_0065:  and 
	IL_0066:  stloc 2

	IL_006a:  nop 
	IL_006b:  nop 
	IL_006c:  ldloc 2

	IL_0070:  nop 
	IL_0071:  nop 
	IL_0072:  ldc.i4 0
	IL_0077:  beq IL_0081

	IL_007c:  br IL_0224

	IL_0081:  ldarg 1

	IL_0085:  nop 
	IL_0086:  nop 
	IL_0087:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_008c:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0091:  stloc 2

	IL_0095:  nop 
	IL_0096:  nop 
	IL_0097:  ldloc 2

	IL_009b:  nop 
	IL_009c:  nop 
	IL_009d:  ldc.i4 0
	IL_00a2:  beq IL_00ac

	IL_00a7:  br IL_014b

	IL_00ac:  ldarg 1

	IL_00b0:  nop 
	IL_00b1:  nop 
	IL_00b2:  ldstr "op_Implicit"
	IL_00b7:  ldarg 0

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  ldarg 1

	IL_00c1:  nop 
	IL_00c2:  nop 
	IL_00c3:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_00c8:  stloc 4

	IL_00cc:  nop 
	IL_00cd:  nop 
	IL_00ce:  ldloc 4

	IL_00d2:  nop 
	IL_00d3:  nop 
	IL_00d4:  ldnull 
	IL_00d5:  beq IL_00f4

	IL_00da:  br IL_00df

	IL_00df:  ldloc 4

	IL_00e3:  nop 
	IL_00e4:  nop 
	IL_00e5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_00ea:  br IL_08f1

	IL_00ef:  br IL_00f9

	IL_00f4:  br IL_00f9

	IL_00f9:  ldarg 1

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  ldstr "op_Explicit"
	IL_0104:  ldarg 0

	IL_0108:  nop 
	IL_0109:  nop 
	IL_010a:  ldarg 1

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0115:  stloc 4

	IL_0119:  nop 
	IL_011a:  nop 
	IL_011b:  ldloc 4

	IL_011f:  nop 
	IL_0120:  nop 
	IL_0121:  ldnull 
	IL_0122:  beq IL_0141

	IL_0127:  br IL_012c

	IL_012c:  ldloc 4

	IL_0130:  nop 
	IL_0131:  nop 
	IL_0132:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0137:  br IL_08f1

	IL_013c:  br IL_0146

	IL_0141:  br IL_0146

	IL_0146:  br IL_0150

	IL_014b:  br IL_0150

	IL_0150:  ldarg 0

	IL_0154:  nop 
	IL_0155:  nop 
	IL_0156:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_015b:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0160:  stloc 2

	IL_0164:  nop 
	IL_0165:  nop 
	IL_0166:  ldloc 2

	IL_016a:  nop 
	IL_016b:  nop 
	IL_016c:  ldc.i4 0
	IL_0171:  beq IL_017b

	IL_0176:  br IL_021a

	IL_017b:  ldarg 0

	IL_017f:  nop 
	IL_0180:  nop 
	IL_0181:  ldstr "op_Implicit"
	IL_0186:  ldarg 0

	IL_018a:  nop 
	IL_018b:  nop 
	IL_018c:  ldarg 1

	IL_0190:  nop 
	IL_0191:  nop 
	IL_0192:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0197:  stloc 4

	IL_019b:  nop 
	IL_019c:  nop 
	IL_019d:  ldloc 4

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  ldnull 
	IL_01a4:  beq IL_01c3

	IL_01a9:  br IL_01ae

	IL_01ae:  ldloc 4

	IL_01b2:  nop 
	IL_01b3:  nop 
	IL_01b4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_01b9:  br IL_08f1

	IL_01be:  br IL_01c8

	IL_01c3:  br IL_01c8

	IL_01c8:  ldarg 0

	IL_01cc:  nop 
	IL_01cd:  nop 
	IL_01ce:  ldstr "op_Explicit"
	IL_01d3:  ldarg 0

	IL_01d7:  nop 
	IL_01d8:  nop 
	IL_01d9:  ldarg 1

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadConvOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_01e4:  stloc 4

	IL_01e8:  nop 
	IL_01e9:  nop 
	IL_01ea:  ldloc 4

	IL_01ee:  nop 
	IL_01ef:  nop 
	IL_01f0:  ldnull 
	IL_01f1:  beq IL_0210

	IL_01f6:  br IL_01fb

	IL_01fb:  ldloc 4

	IL_01ff:  nop 
	IL_0200:  nop 
	IL_0201:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0206:  br IL_08f1

	IL_020b:  br IL_0215

	IL_0210:  br IL_0215

	IL_0215:  br IL_021f

	IL_021a:  br IL_021f

	IL_021f:  br IL_0229

	IL_0224:  br IL_0229

	IL_0229:  ldtoken [mscorlib]System.Object
	IL_022e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0233:  stloc 0

	IL_0237:  nop 
	IL_0238:  nop 
	IL_0239:  ldarg 1

	IL_023d:  nop 
	IL_023e:  nop 
	IL_023f:  ldloc 0

	IL_0243:  nop 
	IL_0244:  nop 
	IL_0245:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_024a:  stloc 2

	IL_024e:  nop 
	IL_024f:  nop 
	IL_0250:  ldloc 2

	IL_0254:  nop 
	IL_0255:  nop 
	IL_0256:  ldc.i4 1
	IL_025b:  beq IL_0265

	IL_0260:  br IL_02c0

	IL_0265:  ldtoken [mscorlib]System.ValueType
	IL_026a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_026f:  stloc 0

	IL_0273:  nop 
	IL_0274:  nop 
	IL_0275:  ldloc 0

	IL_0279:  nop 
	IL_027a:  nop 
	IL_027b:  ldarg 0

	IL_027f:  nop 
	IL_0280:  nop 
	IL_0281:  callvirt instance bool class [mscorlib]System.Type::IsAssignableFrom(class [mscorlib]System.Type)
	IL_0286:  stloc 2

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  ldloc 2

	IL_0290:  nop 
	IL_0291:  nop 
	IL_0292:  ldc.i4 1
	IL_0297:  beq IL_02a1

	IL_029c:  br IL_02b1

	IL_02a1:  ldarg 0

	IL_02a5:  nop 
	IL_02a6:  nop 
	IL_02a7:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBox(class [mscorlib]System.Type)
	IL_02ac:  br IL_02b6

	IL_02b1:  br IL_02b6

	IL_02b6:  br IL_08f1

	IL_02bb:  br IL_02c5

	IL_02c0:  br IL_02c5

	IL_02c5:  ldtoken [mscorlib]System.Object
	IL_02ca:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_02cf:  stloc 0

	IL_02d3:  nop 
	IL_02d4:  nop 
	IL_02d5:  ldarg 0

	IL_02d9:  nop 
	IL_02da:  nop 
	IL_02db:  ldloc 0

	IL_02df:  nop 
	IL_02e0:  nop 
	IL_02e1:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_02e6:  stloc 2

	IL_02ea:  nop 
	IL_02eb:  nop 
	IL_02ec:  ldloc 2

	IL_02f0:  nop 
	IL_02f1:  nop 
	IL_02f2:  ldc.i4 1
	IL_02f7:  beq IL_0301

	IL_02fc:  br IL_0316

	IL_0301:  ldarg 1

	IL_0305:  nop 
	IL_0306:  nop 
	IL_0307:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitUnboxAny(class [mscorlib]System.Type)
	IL_030c:  br IL_08f1

	IL_0311:  br IL_031b

	IL_0316:  br IL_031b

	IL_031b:  ldtoken [mscorlib]System.IntPtr
	IL_0320:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0325:  stloc 0

	IL_0329:  nop 
	IL_032a:  nop 
	IL_032b:  ldarg 0

	IL_032f:  nop 
	IL_0330:  nop 
	IL_0331:  ldloc 0

	IL_0335:  nop 
	IL_0336:  nop 
	IL_0337:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_033c:  stloc 2

	IL_0340:  nop 
	IL_0341:  nop 
	IL_0342:  ldloc 2

	IL_0346:  nop 
	IL_0347:  nop 
	IL_0348:  ldc.i4 1
	IL_034d:  beq IL_0357

	IL_0352:  br IL_0392

	IL_0357:  ldloc 0

	IL_035b:  nop 
	IL_035c:  nop 
	IL_035d:  ldstr "ToInt64"
	IL_0362:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_0367:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_036c:  stloc 4

	IL_0370:  nop 
	IL_0371:  nop 
	IL_0372:  ldloc 4

	IL_0376:  nop 
	IL_0377:  nop 
	IL_0378:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCallvirt(class [mscorlib]System.Reflection.MethodInfo)
	IL_037d:  ldtoken [mscorlib]System.Int64
	IL_0382:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0387:  starg 0

	IL_038b:  nop 
	IL_038c:  nop 
	IL_038d:  br IL_0397

	IL_0392:  br IL_0397

	IL_0397:  ldtoken [mscorlib]System.String
	IL_039c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_03a1:  stloc 0

	IL_03a5:  nop 
	IL_03a6:  nop 
	IL_03a7:  ldarg 1

	IL_03ab:  nop 
	IL_03ac:  nop 
	IL_03ad:  ldloc 0

	IL_03b1:  nop 
	IL_03b2:  nop 
	IL_03b3:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_03b8:  stloc 2

	IL_03bc:  nop 
	IL_03bd:  nop 
	IL_03be:  ldloc 2

	IL_03c2:  nop 
	IL_03c3:  nop 
	IL_03c4:  ldc.i4 1
	IL_03c9:  beq IL_03d3

	IL_03ce:  br IL_041b

	IL_03d3:  ldloc 5

	IL_03d7:  nop 
	IL_03d8:  nop 
	IL_03d9:  ldc.i4 0
	IL_03de:  conv.u 
	IL_03df:  ldarg 0

	IL_03e3:  nop 
	IL_03e4:  nop 
	IL_03e5:  stelem [mscorlib]System.Type
	IL_03ea:  ldloc 1

	IL_03ee:  nop 
	IL_03ef:  nop 
	IL_03f0:  ldstr "ToString"
	IL_03f5:  ldloc 5

	IL_03f9:  nop 
	IL_03fa:  nop 
	IL_03fb:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0400:  stloc 4

	IL_0404:  nop 
	IL_0405:  nop 
	IL_0406:  ldloc 4

	IL_040a:  nop 
	IL_040b:  nop 
	IL_040c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0411:  br IL_08f1

	IL_0416:  br IL_0420

	IL_041b:  br IL_0420

	IL_0420:  ldtoken [mscorlib]System.Char
	IL_0425:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_042a:  stloc 0

	IL_042e:  nop 
	IL_042f:  nop 
	IL_0430:  ldarg 1

	IL_0434:  nop 
	IL_0435:  nop 
	IL_0436:  ldloc 0

	IL_043a:  nop 
	IL_043b:  nop 
	IL_043c:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0441:  stloc 2

	IL_0445:  nop 
	IL_0446:  nop 
	IL_0447:  ldloc 2

	IL_044b:  nop 
	IL_044c:  nop 
	IL_044d:  ldc.i4 1
	IL_0452:  beq IL_045c

	IL_0457:  br IL_04a4

	IL_045c:  ldloc 5

	IL_0460:  nop 
	IL_0461:  nop 
	IL_0462:  ldc.i4 0
	IL_0467:  conv.u 
	IL_0468:  ldarg 0

	IL_046c:  nop 
	IL_046d:  nop 
	IL_046e:  stelem [mscorlib]System.Type
	IL_0473:  ldloc 1

	IL_0477:  nop 
	IL_0478:  nop 
	IL_0479:  ldstr "ToChar"
	IL_047e:  ldloc 5

	IL_0482:  nop 
	IL_0483:  nop 
	IL_0484:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0489:  stloc 4

	IL_048d:  nop 
	IL_048e:  nop 
	IL_048f:  ldloc 4

	IL_0493:  nop 
	IL_0494:  nop 
	IL_0495:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_049a:  br IL_08f1

	IL_049f:  br IL_04a9

	IL_04a4:  br IL_04a9

	IL_04a9:  ldtoken [mscorlib]System.Decimal
	IL_04ae:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04b3:  stloc 0

	IL_04b7:  nop 
	IL_04b8:  nop 
	IL_04b9:  ldarg 1

	IL_04bd:  nop 
	IL_04be:  nop 
	IL_04bf:  ldloc 0

	IL_04c3:  nop 
	IL_04c4:  nop 
	IL_04c5:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_04ca:  stloc 2

	IL_04ce:  nop 
	IL_04cf:  nop 
	IL_04d0:  ldloc 2

	IL_04d4:  nop 
	IL_04d5:  nop 
	IL_04d6:  ldc.i4 1
	IL_04db:  beq IL_04e5

	IL_04e0:  br IL_052d

	IL_04e5:  ldloc 5

	IL_04e9:  nop 
	IL_04ea:  nop 
	IL_04eb:  ldc.i4 0
	IL_04f0:  conv.u 
	IL_04f1:  ldarg 0

	IL_04f5:  nop 
	IL_04f6:  nop 
	IL_04f7:  stelem [mscorlib]System.Type
	IL_04fc:  ldloc 1

	IL_0500:  nop 
	IL_0501:  nop 
	IL_0502:  ldstr "ToDecimal"
	IL_0507:  ldloc 5

	IL_050b:  nop 
	IL_050c:  nop 
	IL_050d:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0512:  stloc 4

	IL_0516:  nop 
	IL_0517:  nop 
	IL_0518:  ldloc 4

	IL_051c:  nop 
	IL_051d:  nop 
	IL_051e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0523:  br IL_08f1

	IL_0528:  br IL_0532

	IL_052d:  br IL_0532

	IL_0532:  ldtoken [mscorlib]System.Double
	IL_0537:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_053c:  stloc 0

	IL_0540:  nop 
	IL_0541:  nop 
	IL_0542:  ldarg 1

	IL_0546:  nop 
	IL_0547:  nop 
	IL_0548:  ldloc 0

	IL_054c:  nop 
	IL_054d:  nop 
	IL_054e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0553:  stloc 2

	IL_0557:  nop 
	IL_0558:  nop 
	IL_0559:  ldloc 2

	IL_055d:  nop 
	IL_055e:  nop 
	IL_055f:  ldc.i4 1
	IL_0564:  beq IL_056e

	IL_0569:  br IL_05b6

	IL_056e:  ldloc 5

	IL_0572:  nop 
	IL_0573:  nop 
	IL_0574:  ldc.i4 0
	IL_0579:  conv.u 
	IL_057a:  ldarg 0

	IL_057e:  nop 
	IL_057f:  nop 
	IL_0580:  stelem [mscorlib]System.Type
	IL_0585:  ldloc 1

	IL_0589:  nop 
	IL_058a:  nop 
	IL_058b:  ldstr "ToDouble"
	IL_0590:  ldloc 5

	IL_0594:  nop 
	IL_0595:  nop 
	IL_0596:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_059b:  stloc 4

	IL_059f:  nop 
	IL_05a0:  nop 
	IL_05a1:  ldloc 4

	IL_05a5:  nop 
	IL_05a6:  nop 
	IL_05a7:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_05ac:  br IL_08f1

	IL_05b1:  br IL_05bb

	IL_05b6:  br IL_05bb

	IL_05bb:  ldtoken [mscorlib]System.Single
	IL_05c0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05c5:  stloc 0

	IL_05c9:  nop 
	IL_05ca:  nop 
	IL_05cb:  ldarg 1

	IL_05cf:  nop 
	IL_05d0:  nop 
	IL_05d1:  ldloc 0

	IL_05d5:  nop 
	IL_05d6:  nop 
	IL_05d7:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_05dc:  stloc 2

	IL_05e0:  nop 
	IL_05e1:  nop 
	IL_05e2:  ldloc 2

	IL_05e6:  nop 
	IL_05e7:  nop 
	IL_05e8:  ldc.i4 1
	IL_05ed:  beq IL_05f7

	IL_05f2:  br IL_063f

	IL_05f7:  ldloc 5

	IL_05fb:  nop 
	IL_05fc:  nop 
	IL_05fd:  ldc.i4 0
	IL_0602:  conv.u 
	IL_0603:  ldarg 0

	IL_0607:  nop 
	IL_0608:  nop 
	IL_0609:  stelem [mscorlib]System.Type
	IL_060e:  ldloc 1

	IL_0612:  nop 
	IL_0613:  nop 
	IL_0614:  ldstr "ToSingle"
	IL_0619:  ldloc 5

	IL_061d:  nop 
	IL_061e:  nop 
	IL_061f:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0624:  stloc 4

	IL_0628:  nop 
	IL_0629:  nop 
	IL_062a:  ldloc 4

	IL_062e:  nop 
	IL_062f:  nop 
	IL_0630:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0635:  br IL_08f1

	IL_063a:  br IL_0644

	IL_063f:  br IL_0644

	IL_0644:  ldtoken [mscorlib]System.Int64
	IL_0649:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_064e:  stloc 0

	IL_0652:  nop 
	IL_0653:  nop 
	IL_0654:  ldarg 1

	IL_0658:  nop 
	IL_0659:  nop 
	IL_065a:  ldloc 0

	IL_065e:  nop 
	IL_065f:  nop 
	IL_0660:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0665:  stloc 2

	IL_0669:  nop 
	IL_066a:  nop 
	IL_066b:  ldloc 2

	IL_066f:  nop 
	IL_0670:  nop 
	IL_0671:  ldc.i4 1
	IL_0676:  beq IL_0680

	IL_067b:  br IL_06c8

	IL_0680:  ldloc 5

	IL_0684:  nop 
	IL_0685:  nop 
	IL_0686:  ldc.i4 0
	IL_068b:  conv.u 
	IL_068c:  ldarg 0

	IL_0690:  nop 
	IL_0691:  nop 
	IL_0692:  stelem [mscorlib]System.Type
	IL_0697:  ldloc 1

	IL_069b:  nop 
	IL_069c:  nop 
	IL_069d:  ldstr "ToInt64"
	IL_06a2:  ldloc 5

	IL_06a6:  nop 
	IL_06a7:  nop 
	IL_06a8:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_06ad:  stloc 4

	IL_06b1:  nop 
	IL_06b2:  nop 
	IL_06b3:  ldloc 4

	IL_06b7:  nop 
	IL_06b8:  nop 
	IL_06b9:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_06be:  br IL_08f1

	IL_06c3:  br IL_06cd

	IL_06c8:  br IL_06cd

	IL_06cd:  ldtoken [mscorlib]System.Int32
	IL_06d2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_06d7:  stloc 0

	IL_06db:  nop 
	IL_06dc:  nop 
	IL_06dd:  ldarg 1

	IL_06e1:  nop 
	IL_06e2:  nop 
	IL_06e3:  ldloc 0

	IL_06e7:  nop 
	IL_06e8:  nop 
	IL_06e9:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_06ee:  stloc 2

	IL_06f2:  nop 
	IL_06f3:  nop 
	IL_06f4:  ldloc 2

	IL_06f8:  nop 
	IL_06f9:  nop 
	IL_06fa:  ldc.i4 1
	IL_06ff:  beq IL_0709

	IL_0704:  br IL_0751

	IL_0709:  ldloc 5

	IL_070d:  nop 
	IL_070e:  nop 
	IL_070f:  ldc.i4 0
	IL_0714:  conv.u 
	IL_0715:  ldarg 0

	IL_0719:  nop 
	IL_071a:  nop 
	IL_071b:  stelem [mscorlib]System.Type
	IL_0720:  ldloc 1

	IL_0724:  nop 
	IL_0725:  nop 
	IL_0726:  ldstr "ToInt32"
	IL_072b:  ldloc 5

	IL_072f:  nop 
	IL_0730:  nop 
	IL_0731:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0736:  stloc 4

	IL_073a:  nop 
	IL_073b:  nop 
	IL_073c:  ldloc 4

	IL_0740:  nop 
	IL_0741:  nop 
	IL_0742:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0747:  br IL_08f1

	IL_074c:  br IL_0756

	IL_0751:  br IL_0756

	IL_0756:  ldtoken [mscorlib]System.Int16
	IL_075b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0760:  stloc 0

	IL_0764:  nop 
	IL_0765:  nop 
	IL_0766:  ldarg 1

	IL_076a:  nop 
	IL_076b:  nop 
	IL_076c:  ldloc 0

	IL_0770:  nop 
	IL_0771:  nop 
	IL_0772:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0777:  stloc 2

	IL_077b:  nop 
	IL_077c:  nop 
	IL_077d:  ldloc 2

	IL_0781:  nop 
	IL_0782:  nop 
	IL_0783:  ldc.i4 1
	IL_0788:  beq IL_0792

	IL_078d:  br IL_07da

	IL_0792:  ldloc 5

	IL_0796:  nop 
	IL_0797:  nop 
	IL_0798:  ldc.i4 0
	IL_079d:  conv.u 
	IL_079e:  ldarg 0

	IL_07a2:  nop 
	IL_07a3:  nop 
	IL_07a4:  stelem [mscorlib]System.Type
	IL_07a9:  ldloc 1

	IL_07ad:  nop 
	IL_07ae:  nop 
	IL_07af:  ldstr "ToInt16"
	IL_07b4:  ldloc 5

	IL_07b8:  nop 
	IL_07b9:  nop 
	IL_07ba:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_07bf:  stloc 4

	IL_07c3:  nop 
	IL_07c4:  nop 
	IL_07c5:  ldloc 4

	IL_07c9:  nop 
	IL_07ca:  nop 
	IL_07cb:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_07d0:  br IL_08f1

	IL_07d5:  br IL_07df

	IL_07da:  br IL_07df

	IL_07df:  ldtoken [mscorlib]System.SByte
	IL_07e4:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_07e9:  stloc 0

	IL_07ed:  nop 
	IL_07ee:  nop 
	IL_07ef:  ldarg 1

	IL_07f3:  nop 
	IL_07f4:  nop 
	IL_07f5:  ldloc 0

	IL_07f9:  nop 
	IL_07fa:  nop 
	IL_07fb:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0800:  stloc 2

	IL_0804:  nop 
	IL_0805:  nop 
	IL_0806:  ldloc 2

	IL_080a:  nop 
	IL_080b:  nop 
	IL_080c:  ldc.i4 1
	IL_0811:  beq IL_081b

	IL_0816:  br IL_0863

	IL_081b:  ldloc 5

	IL_081f:  nop 
	IL_0820:  nop 
	IL_0821:  ldc.i4 0
	IL_0826:  conv.u 
	IL_0827:  ldarg 0

	IL_082b:  nop 
	IL_082c:  nop 
	IL_082d:  stelem [mscorlib]System.Type
	IL_0832:  ldloc 1

	IL_0836:  nop 
	IL_0837:  nop 
	IL_0838:  ldstr "ToSByte"
	IL_083d:  ldloc 5

	IL_0841:  nop 
	IL_0842:  nop 
	IL_0843:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_0848:  stloc 4

	IL_084c:  nop 
	IL_084d:  nop 
	IL_084e:  ldloc 4

	IL_0852:  nop 
	IL_0853:  nop 
	IL_0854:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0859:  br IL_08f1

	IL_085e:  br IL_0868

	IL_0863:  br IL_0868

	IL_0868:  ldtoken [mscorlib]System.Boolean
	IL_086d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0872:  stloc 0

	IL_0876:  nop 
	IL_0877:  nop 
	IL_0878:  ldarg 1

	IL_087c:  nop 
	IL_087d:  nop 
	IL_087e:  ldloc 0

	IL_0882:  nop 
	IL_0883:  nop 
	IL_0884:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0889:  stloc 2

	IL_088d:  nop 
	IL_088e:  nop 
	IL_088f:  ldloc 2

	IL_0893:  nop 
	IL_0894:  nop 
	IL_0895:  ldc.i4 1
	IL_089a:  beq IL_08a4

	IL_089f:  br IL_08ec

	IL_08a4:  ldloc 5

	IL_08a8:  nop 
	IL_08a9:  nop 
	IL_08aa:  ldc.i4 0
	IL_08af:  conv.u 
	IL_08b0:  ldarg 0

	IL_08b4:  nop 
	IL_08b5:  nop 
	IL_08b6:  stelem [mscorlib]System.Type
	IL_08bb:  ldloc 1

	IL_08bf:  nop 
	IL_08c0:  nop 
	IL_08c1:  ldstr "ToBoolean"
	IL_08c6:  ldloc 5

	IL_08ca:  nop 
	IL_08cb:  nop 
	IL_08cc:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_08d1:  stloc 4

	IL_08d5:  nop 
	IL_08d6:  nop 
	IL_08d7:  ldloc 4

	IL_08db:  nop 
	IL_08dc:  nop 
	IL_08dd:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_08e2:  br IL_08f1

	IL_08e7:  br IL_08f1

	IL_08ec:  br IL_08f1

	IL_08f1:  ret 
    } // end of method Helpers::EmitConv

    // method line 65
    .method public static 
           default void EmitMetCall (class [mscorlib]System.Reflection.MethodInfo met, bool stat)  cil managed 
    {
        // Method begins at RVA 0x75b4
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

    // method line 66
    .method public static 
           default void EmitPtrLd (class [mscorlib]System.Reflection.MethodInfo met, bool stat)  cil managed 
    {
        // Method begins at RVA 0x7710
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

    // method line 67
    .method public static 
           default void EmitFldLd (class [mscorlib]System.Reflection.FieldInfo fld, bool stat)  cil managed 
    {
        // Method begins at RVA 0x7754
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

    // method line 68
    .method public static 
           default void EmitFldSt (class [mscorlib]System.Reflection.FieldInfo fld, bool stat)  cil managed 
    {
        // Method begins at RVA 0x7864
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

    // method line 69
    .method public static 
           default class [mscorlib]System.Reflection.ConstructorInfo GetLocCtor (class [mscorlib]System.Type t, class [mscorlib]System.Type[] typs)  cil managed 
    {
        // Method begins at RVA 0x78a8
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

    // method line 70
    .method public static 
           default class [mscorlib]System.Reflection.FieldInfo GetLocFld (string nam)  cil managed 
    {
        // Method begins at RVA 0x792c
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

    // method line 71
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo GetLocMet (string nam, class [mscorlib]System.Type[] typs)  cil managed 
    {
        // Method begins at RVA 0x799c
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

    // method line 72
    .method public static 
           default class [mscorlib]System.Reflection.MethodInfo GetLocMetNoParams (string nam)  cil managed 
    {
        // Method begins at RVA 0x7a18
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

    // method line 73
    .method public static 
           default valuetype [mscorlib]System.Reflection.Emit.Label GetLbl (string nam)  cil managed 
    {
        // Method begins at RVA 0x7a70
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

    // method line 74
    .method public static 
           default string StripDelMtdName (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token t)  cil managed 
    {
        // Method begins at RVA 0x7ac0
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

  } // end of class dylan.NET.Tokenizer.CodeGen.Helpers
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi OpStack
  	extends [mscorlib]System.Object
  {
    .field  public  class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr Stack

    // method line 75
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7bc0
	// Code size 18 (0x12)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_000c:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0011:  ret 
    } // end of method OpStack::.ctor

    // method line 76
    .method public 
           instance default void PushOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token optok)  cil managed 
    {
        // Method begins at RVA 0x7be0
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

    // method line 77
    .method public 
           instance default void PopOp ()  cil managed 
    {
        // Method begins at RVA 0x7c00
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

    // method line 78
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token TopOp ()  cil managed 
    {
        // Method begins at RVA 0x7c60
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

    // method line 79
    .method public 
           instance default int32 getLength ()  cil managed 
    {
        // Method begins at RVA 0x7cd0
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

    // method line 80
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7cec
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

    // method line 81
    .method public 
           instance default int32 RetPrec (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7d14
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

    // method line 82
    .method public 
           instance default bool isLParen (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7e68
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

    // method line 83
    .method public 
           instance default bool isOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7e9c
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

    // method line 84
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ConvToRPN (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x7ed0
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

    // method line 85
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ConvToAST (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x841c
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

    // method line 86
    .method public 
           instance default void ASTEmit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok, bool emt)  cil managed 
    {
        // Method begins at RVA 0x8690
	// Code size 10495 (0x28ff)
	.maxstack 428
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
		class [mscorlib]System.Type	V_17,
		class [mscorlib]System.Type	V_18,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_19,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal	V_20,
		string	V_21,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_22,
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_23,
		class [mscorlib]System.Reflection.FieldInfo	V_24,
		bool	V_25,
		bool	V_26,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_27,
		int32	V_28,
		class [mscorlib]System.Type	V_29,
		bool	V_30,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_31,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_32,
		string[]	V_33,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral	V_34,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal	V_35,
		class [mscorlib]System.Type	V_36,
		string[]	V_37,
		class [mscorlib]System.Reflection.MethodInfo	V_38,
		class [mscorlib]System.Type	V_39,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_40,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_41,
		string	V_42,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_43,
		class [mscorlib]System.Type[]	V_44,
		class [mscorlib]System.Type[]	V_45,
		int32	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_48,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_49,
		class [mscorlib]System.Reflection.ConstructorInfo	V_50,
		class [mscorlib]System.Reflection.FieldInfo	V_51,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_52,
		bool	V_53,
		bool	V_54,
		int32	V_55,
		string	V_56,
		class dylan.NET.Tokenizer.CodeGen.TypeArr	V_57,
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

	IL_02f8:  br IL_28fe

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
	IL_0344:  stloc 19

	IL_0348:  nop 
	IL_0349:  nop 
	IL_034a:  ldloc 19

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

	IL_0380:  ldloc 19

	IL_0384:  nop 
	IL_0385:  nop 
	IL_0386:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_038b:  br IL_0395

	IL_0390:  br IL_0395

	IL_0395:  ldloc 19

	IL_0399:  nop 
	IL_039a:  nop 
	IL_039b:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_03a0:  ldc.i4 1
	IL_03a5:  beq IL_03af

	IL_03aa:  br IL_03d5

	IL_03af:  ldc.i4 1
	IL_03b4:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_03b9:  ldarg.0 
	IL_03ba:  ldloc 19

	IL_03be:  nop 
	IL_03bf:  nop 
	IL_03c0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_03c5:  ldarg 2

	IL_03c9:  nop 
	IL_03ca:  nop 
	IL_03cb:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_03d0:  br IL_03da

	IL_03d5:  br IL_03da

	IL_03da:  ldloc 19

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
	IL_040e:  stloc 17

	IL_0412:  nop 
	IL_0413:  nop 
	IL_0414:  br IL_041e

	IL_0419:  br IL_041e

	IL_041e:  ldloc 19

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
	IL_0459:  stloc 18

	IL_045d:  nop 
	IL_045e:  nop 
	IL_045f:  ldloc 17

	IL_0463:  nop 
	IL_0464:  nop 
	IL_0465:  ldloc 18

	IL_0469:  nop 
	IL_046a:  nop 
	IL_046b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0470:  br IL_047a

	IL_0475:  br IL_047a

	IL_047a:  br IL_0484

	IL_047f:  br IL_0484

	IL_0484:  br IL_28f9

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
	IL_04da:  stloc 20

	IL_04de:  nop 
	IL_04df:  nop 
	IL_04e0:  ldarg 2

	IL_04e4:  nop 
	IL_04e5:  nop 
	IL_04e6:  ldc.i4 1
	IL_04eb:  beq IL_04f5

	IL_04f0:  br IL_0505

	IL_04f5:  ldloc 20

	IL_04f9:  nop 
	IL_04fa:  nop 
	IL_04fb:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_0500:  br IL_050a

	IL_0505:  br IL_050a

	IL_050a:  ldloc 20

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
	IL_052b:  ldloc 20

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
	IL_055f:  stloc 17

	IL_0563:  nop 
	IL_0564:  nop 
	IL_0565:  br IL_056f

	IL_056a:  br IL_056f

	IL_056f:  ldloc 20

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
	IL_05aa:  stloc 18

	IL_05ae:  nop 
	IL_05af:  nop 
	IL_05b0:  ldloc 17

	IL_05b4:  nop 
	IL_05b5:  nop 
	IL_05b6:  ldloc 18

	IL_05ba:  nop 
	IL_05bb:  nop 
	IL_05bc:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_05c1:  br IL_05cb

	IL_05c6:  br IL_05cb

	IL_05cb:  br IL_05d5

	IL_05d0:  br IL_05d5

	IL_05d5:  br IL_28f9

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
	IL_0615:  stloc 25

	IL_0619:  nop 
	IL_061a:  nop 
	IL_061b:  ldc.i4 0
	IL_0620:  stloc 26

	IL_0624:  nop 
	IL_0625:  nop 
	IL_0626:  ldc.i4 0
	IL_062b:  stloc 28

	IL_062f:  nop 
	IL_0630:  nop 
	IL_0631:  ldc.i4 0
	IL_0636:  stloc 30

	IL_063a:  nop 
	IL_063b:  nop 
	IL_063c:  ldloc 9

	IL_0640:  nop 
	IL_0641:  nop 
	IL_0642:  ldc.i4 1
	IL_0647:  beq IL_0651

	IL_064c:  br IL_0dc0

	IL_0651:  ldarg 1

	IL_0655:  nop 
	IL_0656:  nop 
	IL_0657:  stloc 27

	IL_065b:  nop 
	IL_065c:  nop 
	IL_065d:  ldloc 27

	IL_0661:  nop 
	IL_0662:  nop 
	IL_0663:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0668:  stloc 21

	IL_066c:  nop 
	IL_066d:  nop 
	IL_066e:  ldloc 21

	IL_0672:  nop 
	IL_0673:  nop 
	IL_0674:  ldstr ":"
	IL_0679:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_067e:  stloc 33

	IL_0682:  nop 
	IL_0683:  nop 
	IL_0684:  ldc.i4 -1
	IL_0689:  stloc 11

	IL_068d:  nop 
	IL_068e:  nop 
	IL_068f:  ldloc 33

	IL_0693:  nop 
	IL_0694:  nop 
	IL_0695:  ldlen 
	IL_0696:  conv.i4 
	IL_0697:  ldc.i4 1
	IL_069c:  sub 
	IL_069d:  stloc 13

	IL_06a1:  nop 
	IL_06a2:  nop 
	IL_06a3:  ldloc 33

	IL_06a7:  nop 
	IL_06a8:  nop 
	IL_06a9:  ldc.i4 0
	IL_06ae:  conv.u 
	IL_06af:  ldelem [mscorlib]System.String
	IL_06b4:  ldstr "me"
	IL_06b9:  call int32 string::Compare(string, string)
	IL_06be:  stloc 28

	IL_06c2:  nop 
	IL_06c3:  nop 
	IL_06c4:  ldloc 28

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
	IL_06f0:  stloc 25

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
	IL_0733:  stloc 26

	IL_0737:  nop 
	IL_0738:  nop 
	IL_0739:  ldc.i4 0
	IL_073e:  stloc 30

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

	IL_078f:  ldloc 26

	IL_0793:  nop 
	IL_0794:  nop 
	IL_0795:  ldc.i4 0
	IL_079a:  beq IL_07a4

	IL_079f:  br IL_0a86

	IL_07a4:  ldloc 25

	IL_07a8:  nop 
	IL_07a9:  nop 
	IL_07aa:  ldc.i4 0
	IL_07af:  beq IL_07b9

	IL_07b4:  br IL_095d

	IL_07b9:  ldloc 33

	IL_07bd:  nop 
	IL_07be:  nop 
	IL_07bf:  ldloc 11

	IL_07c3:  nop 
	IL_07c4:  nop 
	IL_07c5:  conv.u 
	IL_07c6:  ldelem [mscorlib]System.String
	IL_07cb:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_07d0:  stloc 22

	IL_07d4:  nop 
	IL_07d5:  nop 
	IL_07d6:  ldloc 22

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

	IL_07fc:  ldloc 22

	IL_0800:  nop 
	IL_0801:  nop 
	IL_0802:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_0807:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_080c:  ldloc 22

	IL_0810:  nop 
	IL_0811:  nop 
	IL_0812:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_0817:  ldloc 22

	IL_081b:  nop 
	IL_081c:  nop 
	IL_081d:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_0822:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_0827:  br IL_0831

	IL_082c:  br IL_0831

	IL_0831:  ldloc 22

	IL_0835:  nop 
	IL_0836:  nop 
	IL_0837:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_083c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0841:  ldloc 22

	IL_0845:  nop 
	IL_0846:  nop 
	IL_0847:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_084c:  stloc 8

	IL_0850:  nop 
	IL_0851:  nop 
	IL_0852:  br IL_0c92

	IL_0857:  br IL_0958

	IL_085c:  ldloc 33

	IL_0860:  nop 
	IL_0861:  nop 
	IL_0862:  ldloc 11

	IL_0866:  nop 
	IL_0867:  nop 
	IL_0868:  conv.u 
	IL_0869:  ldelem [mscorlib]System.String
	IL_086e:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0873:  stloc 24

	IL_0877:  nop 
	IL_0878:  nop 
	IL_0879:  ldloc 24

	IL_087d:  nop 
	IL_087e:  nop 
	IL_087f:  ldnull 
	IL_0880:  beq IL_094e

	IL_0885:  br IL_088a

	IL_088a:  ldloc 24

	IL_088e:  nop 
	IL_088f:  nop 
	IL_0890:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0895:  stloc 30

	IL_0899:  nop 
	IL_089a:  nop 
	IL_089b:  ldloc 30

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

	IL_08f8:  ldloc 24

	IL_08fc:  nop 
	IL_08fd:  nop 
	IL_08fe:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0903:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0908:  ldloc 24

	IL_090c:  nop 
	IL_090d:  nop 
	IL_090e:  ldloc 30

	IL_0912:  nop 
	IL_0913:  nop 
	IL_0914:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0919:  br IL_0923

	IL_091e:  br IL_0923

	IL_0923:  ldloc 24

	IL_0927:  nop 
	IL_0928:  nop 
	IL_0929:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_092e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0933:  ldloc 24

	IL_0937:  nop 
	IL_0938:  nop 
	IL_0939:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_093e:  stloc 8

	IL_0942:  nop 
	IL_0943:  nop 
	IL_0944:  br IL_0c92

	IL_0949:  br IL_0953

	IL_094e:  br IL_0953

	IL_0953:  br IL_0958

	IL_0958:  br IL_0a59

	IL_095d:  ldloc 33

	IL_0961:  nop 
	IL_0962:  nop 
	IL_0963:  ldloc 11

	IL_0967:  nop 
	IL_0968:  nop 
	IL_0969:  conv.u 
	IL_096a:  ldelem [mscorlib]System.String
	IL_096f:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0974:  stloc 24

	IL_0978:  nop 
	IL_0979:  nop 
	IL_097a:  ldloc 24

	IL_097e:  nop 
	IL_097f:  nop 
	IL_0980:  ldnull 
	IL_0981:  beq IL_0a4f

	IL_0986:  br IL_098b

	IL_098b:  ldloc 24

	IL_098f:  nop 
	IL_0990:  nop 
	IL_0991:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0996:  stloc 30

	IL_099a:  nop 
	IL_099b:  nop 
	IL_099c:  ldloc 30

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

	IL_09f9:  ldloc 24

	IL_09fd:  nop 
	IL_09fe:  nop 
	IL_09ff:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0a04:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0a09:  ldloc 24

	IL_0a0d:  nop 
	IL_0a0e:  nop 
	IL_0a0f:  ldloc 30

	IL_0a13:  nop 
	IL_0a14:  nop 
	IL_0a15:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0a1a:  br IL_0a24

	IL_0a1f:  br IL_0a24

	IL_0a24:  ldloc 24

	IL_0a28:  nop 
	IL_0a29:  nop 
	IL_0a2a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0a2f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0a34:  ldloc 24

	IL_0a38:  nop 
	IL_0a39:  nop 
	IL_0a3a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0a3f:  stloc 8

	IL_0a43:  nop 
	IL_0a44:  nop 
	IL_0a45:  br IL_0c92

	IL_0a4a:  br IL_0a54

	IL_0a4f:  br IL_0a54

	IL_0a54:  br IL_0a59

	IL_0a59:  ldloc 33

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
	IL_0a7b:  stloc 30

	IL_0a7f:  nop 
	IL_0a80:  nop 
	IL_0a81:  br IL_0c92

	IL_0a86:  ldloc 8

	IL_0a8a:  nop 
	IL_0a8b:  nop 
	IL_0a8c:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0a91:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0a96:  stloc 9

	IL_0a9a:  nop 
	IL_0a9b:  nop 
	IL_0a9c:  ldloc 9

	IL_0aa0:  nop 
	IL_0aa1:  nop 
	IL_0aa2:  ldc.i4 0
	IL_0aa7:  beq IL_0ab1

	IL_0aac:  br IL_0be0

	IL_0ab1:  ldloc 8

	IL_0ab5:  nop 
	IL_0ab6:  nop 
	IL_0ab7:  ldloc 33

	IL_0abb:  nop 
	IL_0abc:  nop 
	IL_0abd:  ldloc 11

	IL_0ac1:  nop 
	IL_0ac2:  nop 
	IL_0ac3:  conv.u 
	IL_0ac4:  ldelem [mscorlib]System.String
	IL_0ac9:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_0ace:  stloc 24

	IL_0ad2:  nop 
	IL_0ad3:  nop 
	IL_0ad4:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0ad9:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0ade:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0ae3:  stloc 8

	IL_0ae7:  nop 
	IL_0ae8:  nop 
	IL_0ae9:  ldarg 2

	IL_0aed:  nop 
	IL_0aee:  nop 
	IL_0aef:  ldc.i4 1
	IL_0af4:  beq IL_0afe

	IL_0af9:  br IL_0bd6

	IL_0afe:  ldsfld bool [dnr]dylan.NET.Reflection.Loader::FldLitFlag
	IL_0b03:  ldc.i4 0
	IL_0b08:  beq IL_0b12

	IL_0b0d:  br IL_0b32

	IL_0b12:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0b17:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0b1c:  ldloc 24

	IL_0b20:  nop 
	IL_0b21:  nop 
	IL_0b22:  ldloc 30

	IL_0b26:  nop 
	IL_0b27:  nop 
	IL_0b28:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0b2d:  br IL_0bd1

	IL_0b32:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::'.ctor'()
	IL_0b37:  stloc 34

	IL_0b3b:  nop 
	IL_0b3c:  nop 
	IL_0b3d:  ldloc 34

	IL_0b41:  nop 
	IL_0b42:  nop 
	IL_0b43:  ldsfld object [dnr]dylan.NET.Reflection.Loader::FldLitVal
	IL_0b48:  stfld object [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ConstVal
	IL_0b4d:  ldloc 34

	IL_0b51:  nop 
	IL_0b52:  nop 
	IL_0b53:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0b58:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ExtTyp
	IL_0b5d:  ldsfld bool [dnr]dylan.NET.Reflection.Loader::EnumLitFlag
	IL_0b62:  ldc.i4 1
	IL_0b67:  beq IL_0b71

	IL_0b6c:  br IL_0b86

	IL_0b71:  ldloc 34

	IL_0b75:  nop 
	IL_0b76:  nop 
	IL_0b77:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::EnumLitTyp
	IL_0b7c:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_0b81:  br IL_0b9b

	IL_0b86:  ldloc 34

	IL_0b8a:  nop 
	IL_0b8b:  nop 
	IL_0b8c:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0b91:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_0b96:  br IL_0b9b

	IL_0b9b:  ldloc 34

	IL_0b9f:  nop 
	IL_0ba0:  nop 
	IL_0ba1:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessConst(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral)
	IL_0ba6:  stloc 35

	IL_0baa:  nop 
	IL_0bab:  nop 
	IL_0bac:  ldloc 35

	IL_0bb0:  nop 
	IL_0bb1:  nop 
	IL_0bb2:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_0bb7:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0bbc:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0bc1:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0bc6:  stloc 8

	IL_0bca:  nop 
	IL_0bcb:  nop 
	IL_0bcc:  br IL_0bd1

	IL_0bd1:  br IL_0bdb

	IL_0bd6:  br IL_0bdb

	IL_0bdb:  br IL_0c63

	IL_0be0:  ldloc 33

	IL_0be4:  nop 
	IL_0be5:  nop 
	IL_0be6:  ldloc 11

	IL_0bea:  nop 
	IL_0beb:  nop 
	IL_0bec:  conv.u 
	IL_0bed:  ldelem [mscorlib]System.String
	IL_0bf2:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0bf7:  stloc 24

	IL_0bfb:  nop 
	IL_0bfc:  nop 
	IL_0bfd:  ldarg 2

	IL_0c01:  nop 
	IL_0c02:  nop 
	IL_0c03:  ldc.i4 1
	IL_0c08:  beq IL_0c12

	IL_0c0d:  br IL_0c38

	IL_0c12:  ldloc 24

	IL_0c16:  nop 
	IL_0c17:  nop 
	IL_0c18:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0c1d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0c22:  ldloc 24

	IL_0c26:  nop 
	IL_0c27:  nop 
	IL_0c28:  ldloc 30

	IL_0c2c:  nop 
	IL_0c2d:  nop 
	IL_0c2e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0c33:  br IL_0c3d

	IL_0c38:  br IL_0c3d

	IL_0c3d:  ldloc 24

	IL_0c41:  nop 
	IL_0c42:  nop 
	IL_0c43:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0c48:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0c4d:  ldloc 24

	IL_0c51:  nop 
	IL_0c52:  nop 
	IL_0c53:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0c58:  stloc 8

	IL_0c5c:  nop 
	IL_0c5d:  nop 
	IL_0c5e:  br IL_0c63

	IL_0c63:  ldloc 30

	IL_0c67:  nop 
	IL_0c68:  nop 
	IL_0c69:  ldc.i4 1
	IL_0c6e:  beq IL_0c78

	IL_0c73:  br IL_0c88

	IL_0c78:  ldc.i4 0
	IL_0c7d:  stloc 30

	IL_0c81:  nop 
	IL_0c82:  nop 
	IL_0c83:  br IL_0c8d

	IL_0c88:  br IL_0c8d

	IL_0c8d:  br IL_0c92

	IL_0c92:  ldc.i4 1
	IL_0c97:  stloc 26

	IL_0c9b:  nop 
	IL_0c9c:  nop 
	IL_0c9d:  ldloc 11

	IL_0ca1:  nop 
	IL_0ca2:  nop 
	IL_0ca3:  ldloc 13

	IL_0ca7:  nop 
	IL_0ca8:  nop 
	IL_0ca9:  beq IL_0cb3

	IL_0cae:  br IL_0cbd

	IL_0cb3:  br IL_0cc7

	IL_0cb8:  br IL_0cc7

	IL_0cbd:  br IL_0749

	IL_0cc2:  br IL_0cc7

	IL_0cc7:  ldloc 27

	IL_0ccb:  nop 
	IL_0ccc:  nop 
	IL_0ccd:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_0cd2:  ldc.i4 1
	IL_0cd7:  beq IL_0ce1

	IL_0cdc:  br IL_0d07

	IL_0ce1:  ldc.i4 1
	IL_0ce6:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0ceb:  ldarg.0 
	IL_0cec:  ldloc 27

	IL_0cf0:  nop 
	IL_0cf1:  nop 
	IL_0cf2:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_0cf7:  ldarg 2

	IL_0cfb:  nop 
	IL_0cfc:  nop 
	IL_0cfd:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_0d02:  br IL_0d0c

	IL_0d07:  br IL_0d0c

	IL_0d0c:  ldloc 27

	IL_0d10:  nop 
	IL_0d11:  nop 
	IL_0d12:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_0d17:  ldc.i4 1
	IL_0d1c:  beq IL_0d26

	IL_0d21:  br IL_0db1

	IL_0d26:  ldarg 2

	IL_0d2a:  nop 
	IL_0d2b:  nop 
	IL_0d2c:  ldc.i4 1
	IL_0d31:  beq IL_0d3b

	IL_0d36:  br IL_0d4b

	IL_0d3b:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0d40:  stloc 17

	IL_0d44:  nop 
	IL_0d45:  nop 
	IL_0d46:  br IL_0d50

	IL_0d4b:  br IL_0d50

	IL_0d50:  ldloc 27

	IL_0d54:  nop 
	IL_0d55:  nop 
	IL_0d56:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_0d5b:  stloc 10

	IL_0d5f:  nop 
	IL_0d60:  nop 
	IL_0d61:  ldloc 10

	IL_0d65:  nop 
	IL_0d66:  nop 
	IL_0d67:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0d6c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0d71:  ldarg 2

	IL_0d75:  nop 
	IL_0d76:  nop 
	IL_0d77:  ldc.i4 1
	IL_0d7c:  beq IL_0d86

	IL_0d81:  br IL_0da7

	IL_0d86:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0d8b:  stloc 18

	IL_0d8f:  nop 
	IL_0d90:  nop 
	IL_0d91:  ldloc 17

	IL_0d95:  nop 
	IL_0d96:  nop 
	IL_0d97:  ldloc 18

	IL_0d9b:  nop 
	IL_0d9c:  nop 
	IL_0d9d:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0da2:  br IL_0dac

	IL_0da7:  br IL_0dac

	IL_0dac:  br IL_0db6

	IL_0db1:  br IL_0db6

	IL_0db6:  br IL_28f9

	IL_0dbb:  br IL_0dc5

	IL_0dc0:  br IL_0dc5

	IL_0dc5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_0dca:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0dcf:  stloc 8

	IL_0dd3:  nop 
	IL_0dd4:  nop 
	IL_0dd5:  ldloc 8

	IL_0dd9:  nop 
	IL_0dda:  nop 
	IL_0ddb:  ldarg 1

	IL_0ddf:  nop 
	IL_0de0:  nop 
	IL_0de1:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0de6:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0deb:  stloc 9

	IL_0def:  nop 
	IL_0df0:  nop 
	IL_0df1:  ldloc 9

	IL_0df5:  nop 
	IL_0df6:  nop 
	IL_0df7:  ldc.i4 1
	IL_0dfc:  beq IL_0e06

	IL_0e01:  br IL_1a65

	IL_0e06:  ldarg 1

	IL_0e0a:  nop 
	IL_0e0b:  nop 
	IL_0e0c:  stloc 40

	IL_0e10:  nop 
	IL_0e11:  nop 
	IL_0e12:  ldloc 40

	IL_0e16:  nop 
	IL_0e17:  nop 
	IL_0e18:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0e1d:  stloc 41

	IL_0e21:  nop 
	IL_0e22:  nop 
	IL_0e23:  ldstr ""
	IL_0e28:  stloc 42

	IL_0e2c:  nop 
	IL_0e2d:  nop 
	IL_0e2e:  ldc.i4 0
	IL_0e33:  conv.u 
	IL_0e34:  newarr [mscorlib]System.Type
	IL_0e39:  stloc 44

	IL_0e3d:  nop 
	IL_0e3e:  nop 
	IL_0e3f:  ldc.i4 0
	IL_0e44:  stloc 53

	IL_0e48:  nop 
	IL_0e49:  nop 
	IL_0e4a:  ldc.i4 0
	IL_0e4f:  stloc 54

	IL_0e53:  nop 
	IL_0e54:  nop 
	IL_0e55:  ldc.i4 2
	IL_0e5a:  stloc 55

	IL_0e5e:  nop 
	IL_0e5f:  nop 
	IL_0e60:  ldloc 41

	IL_0e64:  nop 
	IL_0e65:  nop 
	IL_0e66:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0e6b:  stloc 42

	IL_0e6f:  nop 
	IL_0e70:  nop 
	IL_0e71:  ldloc 42

	IL_0e75:  nop 
	IL_0e76:  nop 
	IL_0e77:  ldstr ":"
	IL_0e7c:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_0e81:  stloc 37

	IL_0e85:  nop 
	IL_0e86:  nop 
	IL_0e87:  ldloc 40

	IL_0e8b:  nop 
	IL_0e8c:  nop 
	IL_0e8d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_0e92:  stloc 43

	IL_0e96:  nop 
	IL_0e97:  nop 
	IL_0e98:  ldloc 43

	IL_0e9c:  nop 
	IL_0e9d:  nop 
	IL_0e9e:  ldlen 
	IL_0e9f:  conv.i4 
	IL_0ea0:  ldc.i4 1
	IL_0ea5:  sub 
	IL_0ea6:  stloc 46

	IL_0eaa:  nop 
	IL_0eab:  nop 
	IL_0eac:  ldc.i4 0
	IL_0eb1:  stloc 25

	IL_0eb5:  nop 
	IL_0eb6:  nop 
	IL_0eb7:  ldc.i4 0
	IL_0ebc:  stloc 26

	IL_0ec0:  nop 
	IL_0ec1:  nop 
	IL_0ec2:  ldnull 
	IL_0ec3:  stloc 36

	IL_0ec7:  nop 
	IL_0ec8:  nop 
	IL_0ec9:  ldnull 
	IL_0eca:  stloc 38

	IL_0ece:  nop 
	IL_0ecf:  nop 
	IL_0ed0:  ldnull 
	IL_0ed1:  stloc 51

	IL_0ed5:  nop 
	IL_0ed6:  nop 
	IL_0ed7:  ldloc 42

	IL_0edb:  nop 
	IL_0edc:  nop 
	IL_0edd:  ldstr "me::ctor"
	IL_0ee2:  call int32 string::Compare(string, string)
	IL_0ee7:  stloc 28

	IL_0eeb:  nop 
	IL_0eec:  nop 
	IL_0eed:  ldloc 28

	IL_0ef1:  nop 
	IL_0ef2:  nop 
	IL_0ef3:  ldc.i4 0
	IL_0ef8:  beq IL_0f02

	IL_0efd:  br IL_0f12

	IL_0f02:  ldc.i4 1
	IL_0f07:  stloc 54

	IL_0f0b:  nop 
	IL_0f0c:  nop 
	IL_0f0d:  br IL_0f17

	IL_0f12:  br IL_0f17

	IL_0f17:  ldc.i4 -1
	IL_0f1c:  stloc 11

	IL_0f20:  nop 
	IL_0f21:  nop 
	IL_0f22:  ldloc 42

	IL_0f26:  nop 
	IL_0f27:  nop 
	IL_0f28:  ldstr ":"
	IL_0f2d:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_0f32:  stloc 37

	IL_0f36:  nop 
	IL_0f37:  nop 
	IL_0f38:  ldloc 37

	IL_0f3c:  nop 
	IL_0f3d:  nop 
	IL_0f3e:  ldlen 
	IL_0f3f:  conv.i4 
	IL_0f40:  ldc.i4 2
	IL_0f45:  sub 
	IL_0f46:  stloc 13

	IL_0f4a:  nop 
	IL_0f4b:  nop 
	IL_0f4c:  ldloc 37

	IL_0f50:  nop 
	IL_0f51:  nop 
	IL_0f52:  ldc.i4 0
	IL_0f57:  conv.u 
	IL_0f58:  ldelem [mscorlib]System.String
	IL_0f5d:  ldstr "me"
	IL_0f62:  call int32 string::Compare(string, string)
	IL_0f67:  stloc 28

	IL_0f6b:  nop 
	IL_0f6c:  nop 
	IL_0f6d:  ldloc 28

	IL_0f71:  nop 
	IL_0f72:  nop 
	IL_0f73:  ldc.i4 0
	IL_0f78:  beq IL_0f82

	IL_0f7d:  br IL_0faf

	IL_0f82:  ldloc 11

	IL_0f86:  nop 
	IL_0f87:  nop 
	IL_0f88:  ldc.i4 1
	IL_0f8d:  add 
	IL_0f8e:  stloc 11

	IL_0f92:  nop 
	IL_0f93:  nop 
	IL_0f94:  ldc.i4 1
	IL_0f99:  stloc 25

	IL_0f9d:  nop 
	IL_0f9e:  nop 
	IL_0f9f:  ldc.i4 3
	IL_0fa4:  stloc 55

	IL_0fa8:  nop 
	IL_0fa9:  nop 
	IL_0faa:  br IL_0fb4

	IL_0faf:  br IL_0fb4

	IL_0fb4:  ldloc 54

	IL_0fb8:  nop 
	IL_0fb9:  nop 
	IL_0fba:  ldc.i4 0
	IL_0fbf:  beq IL_0fc9

	IL_0fc4:  br IL_14bb

	IL_0fc9:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0fce:  ldc.i4 1
	IL_0fd3:  beq IL_0fdd

	IL_0fd8:  br IL_100d

	IL_0fdd:  ldc.i4 0
	IL_0fe2:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0fe7:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0fec:  stloc 36

	IL_0ff0:  nop 
	IL_0ff1:  nop 
	IL_0ff2:  ldc.i4 1
	IL_0ff7:  stloc 26

	IL_0ffb:  nop 
	IL_0ffc:  nop 
	IL_0ffd:  ldc.i4 0
	IL_1002:  stloc 53

	IL_1006:  nop 
	IL_1007:  nop 
	IL_1008:  br IL_1012

	IL_100d:  br IL_1012

	IL_1012:  ldloc 37

	IL_1016:  nop 
	IL_1017:  nop 
	IL_1018:  ldlen 
	IL_1019:  conv.i4 
	IL_101a:  stloc 28

	IL_101e:  nop 
	IL_101f:  nop 
	IL_1020:  ldloc 28

	IL_1024:  nop 
	IL_1025:  nop 
	IL_1026:  ldloc 55

	IL_102a:  nop 
	IL_102b:  nop 
	IL_102c:  bge IL_1036

	IL_1031:  br IL_14b1

	IL_1036:  ldc.i4 1
	IL_103b:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_1040:  ldloc 11

	IL_1044:  nop 
	IL_1045:  nop 
	IL_1046:  ldc.i4 1
	IL_104b:  add 
	IL_104c:  stloc 11

	IL_1050:  nop 
	IL_1051:  nop 
	IL_1052:  ldloc 26

	IL_1056:  nop 
	IL_1057:  nop 
	IL_1058:  ldc.i4 0
	IL_105d:  beq IL_1067

	IL_1062:  br IL_1349

	IL_1067:  ldloc 25

	IL_106b:  nop 
	IL_106c:  nop 
	IL_106d:  ldc.i4 0
	IL_1072:  beq IL_107c

	IL_1077:  br IL_1220

	IL_107c:  ldloc 37

	IL_1080:  nop 
	IL_1081:  nop 
	IL_1082:  ldloc 11

	IL_1086:  nop 
	IL_1087:  nop 
	IL_1088:  conv.u 
	IL_1089:  ldelem [mscorlib]System.String
	IL_108e:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_1093:  stloc 52

	IL_1097:  nop 
	IL_1098:  nop 
	IL_1099:  ldloc 52

	IL_109d:  nop 
	IL_109e:  nop 
	IL_109f:  ldnull 
	IL_10a0:  beq IL_111f

	IL_10a5:  br IL_10aa

	IL_10aa:  ldarg 2

	IL_10ae:  nop 
	IL_10af:  nop 
	IL_10b0:  ldc.i4 1
	IL_10b5:  beq IL_10bf

	IL_10ba:  br IL_10ef

	IL_10bf:  ldloc 52

	IL_10c3:  nop 
	IL_10c4:  nop 
	IL_10c5:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_10ca:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_10cf:  ldloc 52

	IL_10d3:  nop 
	IL_10d4:  nop 
	IL_10d5:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_10da:  ldloc 52

	IL_10de:  nop 
	IL_10df:  nop 
	IL_10e0:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_10e5:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_10ea:  br IL_10f4

	IL_10ef:  br IL_10f4

	IL_10f4:  ldloc 52

	IL_10f8:  nop 
	IL_10f9:  nop 
	IL_10fa:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_10ff:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1104:  ldloc 52

	IL_1108:  nop 
	IL_1109:  nop 
	IL_110a:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_110f:  stloc 36

	IL_1113:  nop 
	IL_1114:  nop 
	IL_1115:  br IL_146d

	IL_111a:  br IL_121b

	IL_111f:  ldloc 37

	IL_1123:  nop 
	IL_1124:  nop 
	IL_1125:  ldloc 11

	IL_1129:  nop 
	IL_112a:  nop 
	IL_112b:  conv.u 
	IL_112c:  ldelem [mscorlib]System.String
	IL_1131:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_1136:  stloc 51

	IL_113a:  nop 
	IL_113b:  nop 
	IL_113c:  ldloc 51

	IL_1140:  nop 
	IL_1141:  nop 
	IL_1142:  ldnull 
	IL_1143:  beq IL_1211

	IL_1148:  br IL_114d

	IL_114d:  ldloc 51

	IL_1151:  nop 
	IL_1152:  nop 
	IL_1153:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_1158:  stloc 30

	IL_115c:  nop 
	IL_115d:  nop 
	IL_115e:  ldloc 30

	IL_1162:  nop 
	IL_1163:  nop 
	IL_1164:  ldc.i4 0
	IL_1169:  beq IL_1173

	IL_116e:  br IL_11a1

	IL_1173:  ldarg 2

	IL_1177:  nop 
	IL_1178:  nop 
	IL_1179:  ldc.i4 1
	IL_117e:  beq IL_1188

	IL_1183:  br IL_1197

	IL_1188:  ldc.i4 0
	IL_118d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1192:  br IL_119c

	IL_1197:  br IL_119c

	IL_119c:  br IL_11a6

	IL_11a1:  br IL_11a6

	IL_11a6:  ldarg 2

	IL_11aa:  nop 
	IL_11ab:  nop 
	IL_11ac:  ldc.i4 1
	IL_11b1:  beq IL_11bb

	IL_11b6:  br IL_11e1

	IL_11bb:  ldloc 51

	IL_11bf:  nop 
	IL_11c0:  nop 
	IL_11c1:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_11c6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_11cb:  ldloc 51

	IL_11cf:  nop 
	IL_11d0:  nop 
	IL_11d1:  ldloc 30

	IL_11d5:  nop 
	IL_11d6:  nop 
	IL_11d7:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_11dc:  br IL_11e6

	IL_11e1:  br IL_11e6

	IL_11e6:  ldloc 51

	IL_11ea:  nop 
	IL_11eb:  nop 
	IL_11ec:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_11f1:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_11f6:  ldloc 51

	IL_11fa:  nop 
	IL_11fb:  nop 
	IL_11fc:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1201:  stloc 36

	IL_1205:  nop 
	IL_1206:  nop 
	IL_1207:  br IL_146d

	IL_120c:  br IL_1216

	IL_1211:  br IL_1216

	IL_1216:  br IL_121b

	IL_121b:  br IL_131c

	IL_1220:  ldloc 37

	IL_1224:  nop 
	IL_1225:  nop 
	IL_1226:  ldloc 11

	IL_122a:  nop 
	IL_122b:  nop 
	IL_122c:  conv.u 
	IL_122d:  ldelem [mscorlib]System.String
	IL_1232:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_1237:  stloc 51

	IL_123b:  nop 
	IL_123c:  nop 
	IL_123d:  ldloc 51

	IL_1241:  nop 
	IL_1242:  nop 
	IL_1243:  ldnull 
	IL_1244:  beq IL_1312

	IL_1249:  br IL_124e

	IL_124e:  ldloc 51

	IL_1252:  nop 
	IL_1253:  nop 
	IL_1254:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_1259:  stloc 30

	IL_125d:  nop 
	IL_125e:  nop 
	IL_125f:  ldloc 30

	IL_1263:  nop 
	IL_1264:  nop 
	IL_1265:  ldc.i4 0
	IL_126a:  beq IL_1274

	IL_126f:  br IL_12a2

	IL_1274:  ldarg 2

	IL_1278:  nop 
	IL_1279:  nop 
	IL_127a:  ldc.i4 1
	IL_127f:  beq IL_1289

	IL_1284:  br IL_1298

	IL_1289:  ldc.i4 0
	IL_128e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1293:  br IL_129d

	IL_1298:  br IL_129d

	IL_129d:  br IL_12a7

	IL_12a2:  br IL_12a7

	IL_12a7:  ldarg 2

	IL_12ab:  nop 
	IL_12ac:  nop 
	IL_12ad:  ldc.i4 1
	IL_12b2:  beq IL_12bc

	IL_12b7:  br IL_12e2

	IL_12bc:  ldloc 51

	IL_12c0:  nop 
	IL_12c1:  nop 
	IL_12c2:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_12c7:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_12cc:  ldloc 51

	IL_12d0:  nop 
	IL_12d1:  nop 
	IL_12d2:  ldloc 30

	IL_12d6:  nop 
	IL_12d7:  nop 
	IL_12d8:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_12dd:  br IL_12e7

	IL_12e2:  br IL_12e7

	IL_12e7:  ldloc 51

	IL_12eb:  nop 
	IL_12ec:  nop 
	IL_12ed:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_12f2:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_12f7:  ldloc 51

	IL_12fb:  nop 
	IL_12fc:  nop 
	IL_12fd:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1302:  stloc 36

	IL_1306:  nop 
	IL_1307:  nop 
	IL_1308:  br IL_146d

	IL_130d:  br IL_1317

	IL_1312:  br IL_1317

	IL_1317:  br IL_131c

	IL_131c:  ldloc 37

	IL_1320:  nop 
	IL_1321:  nop 
	IL_1322:  ldloc 11

	IL_1326:  nop 
	IL_1327:  nop 
	IL_1328:  conv.u 
	IL_1329:  ldelem [mscorlib]System.String
	IL_132e:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_1333:  stloc 36

	IL_1337:  nop 
	IL_1338:  nop 
	IL_1339:  ldc.i4 1
	IL_133e:  stloc 53

	IL_1342:  nop 
	IL_1343:  nop 
	IL_1344:  br IL_146d

	IL_1349:  ldloc 36

	IL_134d:  nop 
	IL_134e:  nop 
	IL_134f:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1354:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_1359:  stloc 9

	IL_135d:  nop 
	IL_135e:  nop 
	IL_135f:  ldloc 9

	IL_1363:  nop 
	IL_1364:  nop 
	IL_1365:  ldc.i4 0
	IL_136a:  beq IL_1374

	IL_136f:  br IL_13bb

	IL_1374:  ldloc 36

	IL_1378:  nop 
	IL_1379:  nop 
	IL_137a:  ldloc 37

	IL_137e:  nop 
	IL_137f:  nop 
	IL_1380:  ldloc 11

	IL_1384:  nop 
	IL_1385:  nop 
	IL_1386:  conv.u 
	IL_1387:  ldelem [mscorlib]System.String
	IL_138c:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_1391:  stloc 51

	IL_1395:  nop 
	IL_1396:  nop 
	IL_1397:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_139c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_13a1:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_13a6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_13ab:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_13b0:  stloc 36

	IL_13b4:  nop 
	IL_13b5:  nop 
	IL_13b6:  br IL_140e

	IL_13bb:  ldloc 37

	IL_13bf:  nop 
	IL_13c0:  nop 
	IL_13c1:  ldloc 11

	IL_13c5:  nop 
	IL_13c6:  nop 
	IL_13c7:  conv.u 
	IL_13c8:  ldelem [mscorlib]System.String
	IL_13cd:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_13d2:  stloc 51

	IL_13d6:  nop 
	IL_13d7:  nop 
	IL_13d8:  ldloc 51

	IL_13dc:  nop 
	IL_13dd:  nop 
	IL_13de:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_13e3:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_13e8:  ldloc 51

	IL_13ec:  nop 
	IL_13ed:  nop 
	IL_13ee:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_13f3:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_13f8:  ldloc 51

	IL_13fc:  nop 
	IL_13fd:  nop 
	IL_13fe:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1403:  stloc 36

	IL_1407:  nop 
	IL_1408:  nop 
	IL_1409:  br IL_140e

	IL_140e:  ldarg 2

	IL_1412:  nop 
	IL_1413:  nop 
	IL_1414:  ldc.i4 1
	IL_1419:  beq IL_1423

	IL_141e:  br IL_1439

	IL_1423:  ldloc 51

	IL_1427:  nop 
	IL_1428:  nop 
	IL_1429:  ldloc 53

	IL_142d:  nop 
	IL_142e:  nop 
	IL_142f:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_1434:  br IL_143e

	IL_1439:  br IL_143e

	IL_143e:  ldloc 53

	IL_1442:  nop 
	IL_1443:  nop 
	IL_1444:  ldc.i4 1
	IL_1449:  beq IL_1453

	IL_144e:  br IL_1463

	IL_1453:  ldc.i4 0
	IL_1458:  stloc 53

	IL_145c:  nop 
	IL_145d:  nop 
	IL_145e:  br IL_1468

	IL_1463:  br IL_1468

	IL_1468:  br IL_146d

	IL_146d:  ldc.i4 1
	IL_1472:  stloc 26

	IL_1476:  nop 
	IL_1477:  nop 
	IL_1478:  ldloc 11

	IL_147c:  nop 
	IL_147d:  nop 
	IL_147e:  ldloc 13

	IL_1482:  nop 
	IL_1483:  nop 
	IL_1484:  beq IL_148e

	IL_1489:  br IL_1498

	IL_148e:  br IL_14a2

	IL_1493:  br IL_14a2

	IL_1498:  br IL_1040

	IL_149d:  br IL_14a2

	IL_14a2:  ldc.i4 0
	IL_14a7:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_14ac:  br IL_14b6

	IL_14b1:  br IL_14b6

	IL_14b6:  br IL_14e9

	IL_14bb:  ldarg 2

	IL_14bf:  nop 
	IL_14c0:  nop 
	IL_14c1:  ldc.i4 1
	IL_14c6:  beq IL_14d0

	IL_14cb:  br IL_14df

	IL_14d0:  ldc.i4 0
	IL_14d5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_14da:  br IL_14e4

	IL_14df:  br IL_14e4

	IL_14e4:  br IL_14e9

	IL_14e9:  ldloc 11

	IL_14ed:  nop 
	IL_14ee:  nop 
	IL_14ef:  ldc.i4 1
	IL_14f4:  add 
	IL_14f5:  stloc 11

	IL_14f9:  nop 
	IL_14fa:  nop 
	IL_14fb:  ldloc 54

	IL_14ff:  nop 
	IL_1500:  nop 
	IL_1501:  ldc.i4 0
	IL_1506:  beq IL_1510

	IL_150b:  br IL_15d7

	IL_1510:  ldloc 26

	IL_1514:  nop 
	IL_1515:  nop 
	IL_1516:  ldc.i4 0
	IL_151b:  beq IL_1525

	IL_1520:  br IL_15cd

	IL_1525:  ldarg 2

	IL_1529:  nop 
	IL_152a:  nop 
	IL_152b:  ldc.i4 1
	IL_1530:  beq IL_153a

	IL_1535:  br IL_15c3

	IL_153a:  ldsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_153f:  ldc.i4 0
	IL_1544:  conv.u 
	IL_1545:  ldelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_154a:  stloc 57

	IL_154e:  nop 
	IL_154f:  nop 
	IL_1550:  ldloc 57

	IL_1554:  nop 
	IL_1555:  nop 
	IL_1556:  ldfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.TypeArr::Arr
	IL_155b:  stloc 44

	IL_155f:  nop 
	IL_1560:  nop 
	IL_1561:  ldloc 37

	IL_1565:  nop 
	IL_1566:  nop 
	IL_1567:  ldloc 11

	IL_156b:  nop 
	IL_156c:  nop 
	IL_156d:  conv.u 
	IL_156e:  ldelem [mscorlib]System.String
	IL_1573:  ldloc 44

	IL_1577:  nop 
	IL_1578:  nop 
	IL_1579:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_157e:  stloc 38

	IL_1582:  nop 
	IL_1583:  nop 
	IL_1584:  ldloc 38

	IL_1588:  nop 
	IL_1589:  nop 
	IL_158a:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_158f:  stloc 53

	IL_1593:  nop 
	IL_1594:  nop 
	IL_1595:  ldloc 53

	IL_1599:  nop 
	IL_159a:  nop 
	IL_159b:  ldc.i4 0
	IL_15a0:  beq IL_15aa

	IL_15a5:  br IL_15b9

	IL_15aa:  ldc.i4 0
	IL_15af:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_15b4:  br IL_15be

	IL_15b9:  br IL_15be

	IL_15be:  br IL_15c8

	IL_15c3:  br IL_15c8

	IL_15c8:  br IL_15d2

	IL_15cd:  br IL_15d2

	IL_15d2:  br IL_15dc

	IL_15d7:  br IL_15dc

	IL_15dc:  ldloc 11

	IL_15e0:  nop 
	IL_15e1:  nop 
	IL_15e2:  stloc 12

	IL_15e6:  nop 
	IL_15e7:  nop 
	IL_15e8:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_15ed:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type03
	IL_15f2:  ldc.i4 -1
	IL_15f7:  stloc 11

	IL_15fb:  nop 
	IL_15fc:  nop 
	IL_15fd:  ldc.i4 0
	IL_1602:  conv.u 
	IL_1603:  newarr [mscorlib]System.Type
	IL_1608:  stloc 44

	IL_160c:  nop 
	IL_160d:  nop 
	IL_160e:  ldloc 43

	IL_1612:  nop 
	IL_1613:  nop 
	IL_1614:  ldlen 
	IL_1615:  conv.i4 
	IL_1616:  ldc.i4 0
	IL_161b:  beq IL_1625

	IL_1620:  br IL_163a

	IL_1625:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_162a:  stloc 44

	IL_162e:  nop 
	IL_162f:  nop 
	IL_1630:  br IL_1757

	IL_1635:  br IL_163f

	IL_163a:  br IL_163f

	IL_163f:  ldloc 11

	IL_1643:  nop 
	IL_1644:  nop 
	IL_1645:  ldc.i4 1
	IL_164a:  add 
	IL_164b:  stloc 11

	IL_164f:  nop 
	IL_1650:  nop 
	IL_1651:  ldloc 43

	IL_1655:  nop 
	IL_1656:  nop 
	IL_1657:  ldloc 11

	IL_165b:  nop 
	IL_165c:  nop 
	IL_165d:  conv.u 
	IL_165e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1663:  stloc 47

	IL_1667:  nop 
	IL_1668:  nop 
	IL_1669:  ldloc 47

	IL_166d:  nop 
	IL_166e:  nop 
	IL_166f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1674:  ldlen 
	IL_1675:  conv.i4 
	IL_1676:  ldc.i4 1
	IL_167b:  beq IL_1685

	IL_1680:  br IL_1696

	IL_1685:  ldloc 47

	IL_1689:  nop 
	IL_168a:  nop 
	IL_168b:  stloc 48

	IL_168f:  nop 
	IL_1690:  nop 
	IL_1691:  br IL_16d3

	IL_1696:  ldloc 47

	IL_169a:  nop 
	IL_169b:  nop 
	IL_169c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_16a1:  ldlen 
	IL_16a2:  conv.i4 
	IL_16a3:  ldc.i4 3
	IL_16a8:  bge IL_16b2

	IL_16ad:  br IL_16c9

	IL_16b2:  ldarg.0 
	IL_16b3:  ldloc 47

	IL_16b7:  nop 
	IL_16b8:  nop 
	IL_16b9:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_16be:  stloc 48

	IL_16c2:  nop 
	IL_16c3:  nop 
	IL_16c4:  br IL_16ce

	IL_16c9:  br IL_16ce

	IL_16ce:  br IL_16d3

	IL_16d3:  ldarg.0 
	IL_16d4:  ldloc 48

	IL_16d8:  nop 
	IL_16d9:  nop 
	IL_16da:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_16df:  stloc 49

	IL_16e3:  nop 
	IL_16e4:  nop 
	IL_16e5:  ldarg.0 
	IL_16e6:  ldloc 49

	IL_16ea:  nop 
	IL_16eb:  nop 
	IL_16ec:  ldarg 2

	IL_16f0:  nop 
	IL_16f1:  nop 
	IL_16f2:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_16f7:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_16fc:  stloc 45

	IL_1700:  nop 
	IL_1701:  nop 
	IL_1702:  ldloc 44

	IL_1706:  nop 
	IL_1707:  nop 
	IL_1708:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_170d:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1712:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_1717:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_171c:  stloc 44

	IL_1720:  nop 
	IL_1721:  nop 
	IL_1722:  ldloc 45

	IL_1726:  nop 
	IL_1727:  nop 
	IL_1728:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_172d:  ldloc 11

	IL_1731:  nop 
	IL_1732:  nop 
	IL_1733:  ldloc 46

	IL_1737:  nop 
	IL_1738:  nop 
	IL_1739:  beq IL_1743

	IL_173e:  br IL_174d

	IL_1743:  br IL_1757

	IL_1748:  br IL_1757

	IL_174d:  br IL_163f

	IL_1752:  br IL_1757

	IL_1757:  ldarg 2

	IL_175b:  nop 
	IL_175c:  nop 
	IL_175d:  ldc.i4 0
	IL_1762:  beq IL_176c

	IL_1767:  br IL_177c

	IL_176c:  ldloc 44

	IL_1770:  nop 
	IL_1771:  nop 
	IL_1772:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddTypArr(class [mscorlib]System.Type[])
	IL_1777:  br IL_1787

	IL_177c:  call class [mscorlib]System.Type[] class dylan.NET.Tokenizer.CodeGen.SymTable::PopTypArr()
	IL_1781:  pop 
	IL_1782:  br IL_1787

	IL_1787:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type03
	IL_178c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1791:  ldloc 12

	IL_1795:  nop 
	IL_1796:  nop 
	IL_1797:  stloc 11

	IL_179b:  nop 
	IL_179c:  nop 
	IL_179d:  ldloc 36

	IL_17a1:  nop 
	IL_17a2:  nop 
	IL_17a3:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type05
	IL_17a8:  ldloc 54

	IL_17ac:  nop 
	IL_17ad:  nop 
	IL_17ae:  ldc.i4 0
	IL_17b3:  beq IL_17bd

	IL_17b8:  br IL_1960

	IL_17bd:  ldloc 26

	IL_17c1:  nop 
	IL_17c2:  nop 
	IL_17c3:  ldc.i4 1
	IL_17c8:  beq IL_17d2

	IL_17cd:  br IL_1883

	IL_17d2:  ldloc 36

	IL_17d6:  nop 
	IL_17d7:  nop 
	IL_17d8:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_17dd:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_17e2:  stloc 9

	IL_17e6:  nop 
	IL_17e7:  nop 
	IL_17e8:  ldloc 9

	IL_17ec:  nop 
	IL_17ed:  nop 
	IL_17ee:  ldc.i4 0
	IL_17f3:  beq IL_17fd

	IL_17f8:  br IL_1835

	IL_17fd:  ldloc 36

	IL_1801:  nop 
	IL_1802:  nop 
	IL_1803:  ldloc 37

	IL_1807:  nop 
	IL_1808:  nop 
	IL_1809:  ldloc 11

	IL_180d:  nop 
	IL_180e:  nop 
	IL_180f:  conv.u 
	IL_1810:  ldelem [mscorlib]System.String
	IL_1815:  ldloc 44

	IL_1819:  nop 
	IL_181a:  nop 
	IL_181b:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadMethod(class [mscorlib]System.Type, string, class [mscorlib]System.Type[])
	IL_1820:  stloc 38

	IL_1824:  nop 
	IL_1825:  nop 
	IL_1826:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_182b:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1830:  br IL_187e

	IL_1835:  ldloc 37

	IL_1839:  nop 
	IL_183a:  nop 
	IL_183b:  ldloc 11

	IL_183f:  nop 
	IL_1840:  nop 
	IL_1841:  conv.u 
	IL_1842:  ldelem [mscorlib]System.String
	IL_1847:  ldloc 44

	IL_184b:  nop 
	IL_184c:  nop 
	IL_184d:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_1852:  stloc 38

	IL_1856:  nop 
	IL_1857:  nop 
	IL_1858:  ldloc 38

	IL_185c:  nop 
	IL_185d:  nop 
	IL_185e:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_1863:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1868:  ldloc 38

	IL_186c:  nop 
	IL_186d:  nop 
	IL_186e:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_1873:  stloc 53

	IL_1877:  nop 
	IL_1878:  nop 
	IL_1879:  br IL_187e

	IL_187e:  br IL_18cc

	IL_1883:  ldloc 37

	IL_1887:  nop 
	IL_1888:  nop 
	IL_1889:  ldloc 11

	IL_188d:  nop 
	IL_188e:  nop 
	IL_188f:  conv.u 
	IL_1890:  ldelem [mscorlib]System.String
	IL_1895:  ldloc 44

	IL_1899:  nop 
	IL_189a:  nop 
	IL_189b:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_18a0:  stloc 38

	IL_18a4:  nop 
	IL_18a5:  nop 
	IL_18a6:  ldloc 38

	IL_18aa:  nop 
	IL_18ab:  nop 
	IL_18ac:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_18b1:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_18b6:  ldloc 38

	IL_18ba:  nop 
	IL_18bb:  nop 
	IL_18bc:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_18c1:  stloc 53

	IL_18c5:  nop 
	IL_18c6:  nop 
	IL_18c7:  br IL_18cc

	IL_18cc:  ldarg 2

	IL_18d0:  nop 
	IL_18d1:  nop 
	IL_18d2:  ldc.i4 1
	IL_18d7:  beq IL_18e1

	IL_18dc:  br IL_1911

	IL_18e1:  ldloc 40

	IL_18e5:  nop 
	IL_18e6:  nop 
	IL_18e7:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_18ec:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::PopFlg
	IL_18f1:  ldloc 38

	IL_18f5:  nop 
	IL_18f6:  nop 
	IL_18f7:  ldloc 53

	IL_18fb:  nop 
	IL_18fc:  nop 
	IL_18fd:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitMetCall(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_1902:  ldc.i4 0
	IL_1907:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::PopFlg
	IL_190c:  br IL_1916

	IL_1911:  br IL_1916

	IL_1916:  ldloc 41

	IL_191a:  nop 
	IL_191b:  nop 
	IL_191c:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_1921:  ldc.i4 1
	IL_1926:  beq IL_1930

	IL_192b:  br IL_1956

	IL_1930:  ldc.i4 1
	IL_1935:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_193a:  ldarg.0 
	IL_193b:  ldloc 41

	IL_193f:  nop 
	IL_1940:  nop 
	IL_1941:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_1946:  ldarg 2

	IL_194a:  nop 
	IL_194b:  nop 
	IL_194c:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_1951:  br IL_195b

	IL_1956:  br IL_195b

	IL_195b:  br IL_19b1

	IL_1960:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_1965:  stloc 36

	IL_1969:  nop 
	IL_196a:  nop 
	IL_196b:  ldloc 36

	IL_196f:  nop 
	IL_1970:  nop 
	IL_1971:  ldloc 44

	IL_1975:  nop 
	IL_1976:  nop 
	IL_1977:  call class [mscorlib]System.Reflection.ConstructorInfo class [dnr]dylan.NET.Reflection.Loader::LoadCtor(class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_197c:  stloc 50

	IL_1980:  nop 
	IL_1981:  nop 
	IL_1982:  ldarg 2

	IL_1986:  nop 
	IL_1987:  nop 
	IL_1988:  ldc.i4 1
	IL_198d:  beq IL_1997

	IL_1992:  br IL_19a7

	IL_1997:  ldloc 50

	IL_199b:  nop 
	IL_199c:  nop 
	IL_199d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCallCtor(class [mscorlib]System.Reflection.ConstructorInfo)
	IL_19a2:  br IL_19ac

	IL_19a7:  br IL_19ac

	IL_19ac:  br IL_19b1

	IL_19b1:  ldloc 41

	IL_19b5:  nop 
	IL_19b6:  nop 
	IL_19b7:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_19bc:  ldc.i4 1
	IL_19c1:  beq IL_19cb

	IL_19c6:  br IL_1a56

	IL_19cb:  ldarg 2

	IL_19cf:  nop 
	IL_19d0:  nop 
	IL_19d1:  ldc.i4 1
	IL_19d6:  beq IL_19e0

	IL_19db:  br IL_19f0

	IL_19e0:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_19e5:  stloc 17

	IL_19e9:  nop 
	IL_19ea:  nop 
	IL_19eb:  br IL_19f5

	IL_19f0:  br IL_19f5

	IL_19f5:  ldloc 41

	IL_19f9:  nop 
	IL_19fa:  nop 
	IL_19fb:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_1a00:  stloc 10

	IL_1a04:  nop 
	IL_1a05:  nop 
	IL_1a06:  ldloc 10

	IL_1a0a:  nop 
	IL_1a0b:  nop 
	IL_1a0c:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1a11:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1a16:  ldarg 2

	IL_1a1a:  nop 
	IL_1a1b:  nop 
	IL_1a1c:  ldc.i4 1
	IL_1a21:  beq IL_1a2b

	IL_1a26:  br IL_1a4c

	IL_1a2b:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1a30:  stloc 18

	IL_1a34:  nop 
	IL_1a35:  nop 
	IL_1a36:  ldloc 17

	IL_1a3a:  nop 
	IL_1a3b:  nop 
	IL_1a3c:  ldloc 18

	IL_1a40:  nop 
	IL_1a41:  nop 
	IL_1a42:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_1a47:  br IL_1a51

	IL_1a4c:  br IL_1a51

	IL_1a51:  br IL_1a5b

	IL_1a56:  br IL_1a5b

	IL_1a5b:  br IL_28f9

	IL_1a60:  br IL_1a6a

	IL_1a65:  br IL_1a6a

	IL_1a6a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok
	IL_1a6f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1a74:  stloc 8

	IL_1a78:  nop 
	IL_1a79:  nop 
	IL_1a7a:  ldloc 8

	IL_1a7e:  nop 
	IL_1a7f:  nop 
	IL_1a80:  ldarg 1

	IL_1a84:  nop 
	IL_1a85:  nop 
	IL_1a86:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1a8b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1a90:  stloc 9

	IL_1a94:  nop 
	IL_1a95:  nop 
	IL_1a96:  ldloc 9

	IL_1a9a:  nop 
	IL_1a9b:  nop 
	IL_1a9c:  ldc.i4 1
	IL_1aa1:  beq IL_1aab

	IL_1aa6:  br IL_252b

	IL_1aab:  ldarg 1

	IL_1aaf:  nop 
	IL_1ab0:  nop 
	IL_1ab1:  stloc 58

	IL_1ab5:  nop 
	IL_1ab6:  nop 
	IL_1ab7:  ldloc 58

	IL_1abb:  nop 
	IL_1abc:  nop 
	IL_1abd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Name
	IL_1ac2:  stloc 10

	IL_1ac6:  nop 
	IL_1ac7:  nop 
	IL_1ac8:  ldloc 10

	IL_1acc:  nop 
	IL_1acd:  nop 
	IL_1ace:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1ad3:  stloc 39

	IL_1ad7:  nop 
	IL_1ad8:  nop 
	IL_1ad9:  ldloc 58

	IL_1add:  nop 
	IL_1ade:  nop 
	IL_1adf:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_1ae4:  stloc 43

	IL_1ae8:  nop 
	IL_1ae9:  nop 
	IL_1aea:  ldloc 43

	IL_1aee:  nop 
	IL_1aef:  nop 
	IL_1af0:  ldlen 
	IL_1af1:  conv.i4 
	IL_1af2:  ldc.i4 1
	IL_1af7:  sub 
	IL_1af8:  stloc 46

	IL_1afc:  nop 
	IL_1afd:  nop 
	IL_1afe:  ldc.i4 0
	IL_1b03:  stloc 61

	IL_1b07:  nop 
	IL_1b08:  nop 
	IL_1b09:  ldtoken [mscorlib]System.MulticastDelegate
	IL_1b0e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1b13:  stloc 8

	IL_1b17:  nop 
	IL_1b18:  nop 
	IL_1b19:  ldloc 39

	IL_1b1d:  nop 
	IL_1b1e:  nop 
	IL_1b1f:  ldloc 8

	IL_1b23:  nop 
	IL_1b24:  nop 
	IL_1b25:  callvirt instance bool class [mscorlib]System.Type::IsSubclassOf(class [mscorlib]System.Type)
	IL_1b2a:  stloc 9

	IL_1b2e:  nop 
	IL_1b2f:  nop 
	IL_1b30:  ldloc 9

	IL_1b34:  nop 
	IL_1b35:  nop 
	IL_1b36:  ldc.i4 1
	IL_1b3b:  beq IL_1b45

	IL_1b40:  br IL_1ba3

	IL_1b45:  ldc.i4 1
	IL_1b4a:  stloc 61

	IL_1b4e:  nop 
	IL_1b4f:  nop 
	IL_1b50:  ldloc 39

	IL_1b54:  nop 
	IL_1b55:  nop 
	IL_1b56:  call class [mscorlib]System.Type[] class [dnr]dylan.NET.Reflection.Loader::GetDelegateInvokeParams(class [mscorlib]System.Type)
	IL_1b5b:  stloc 59

	IL_1b5f:  nop 
	IL_1b60:  nop 
	IL_1b61:  ldloc 43

	IL_1b65:  nop 
	IL_1b66:  nop 
	IL_1b67:  ldc.i4 0
	IL_1b6c:  conv.u 
	IL_1b6d:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1b72:  stloc 47

	IL_1b76:  nop 
	IL_1b77:  nop 
	IL_1b78:  ldloc 47

	IL_1b7c:  nop 
	IL_1b7d:  nop 
	IL_1b7e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1b83:  ldc.i4 0
	IL_1b88:  conv.u 
	IL_1b89:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1b8e:  call string class dylan.NET.Tokenizer.CodeGen.Helpers::StripDelMtdName(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_1b93:  stloc 60

	IL_1b97:  nop 
	IL_1b98:  nop 
	IL_1b99:  br IL_1d0d

	IL_1b9e:  br IL_1ba8

	IL_1ba3:  br IL_1ba8

	IL_1ba8:  ldloc 43

	IL_1bac:  nop 
	IL_1bad:  nop 
	IL_1bae:  ldlen 
	IL_1baf:  conv.i4 
	IL_1bb0:  ldc.i4 0
	IL_1bb5:  beq IL_1bbf

	IL_1bba:  br IL_1bd4

	IL_1bbf:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_1bc4:  stloc 44

	IL_1bc8:  nop 
	IL_1bc9:  nop 
	IL_1bca:  br IL_1d0d

	IL_1bcf:  br IL_1bea

	IL_1bd4:  ldc.i4 0
	IL_1bd9:  conv.u 
	IL_1bda:  newarr [mscorlib]System.Type
	IL_1bdf:  stloc 44

	IL_1be3:  nop 
	IL_1be4:  nop 
	IL_1be5:  br IL_1bea

	IL_1bea:  ldc.i4 -1
	IL_1bef:  stloc 11

	IL_1bf3:  nop 
	IL_1bf4:  nop 
	IL_1bf5:  ldloc 11

	IL_1bf9:  nop 
	IL_1bfa:  nop 
	IL_1bfb:  ldc.i4 1
	IL_1c00:  add 
	IL_1c01:  stloc 11

	IL_1c05:  nop 
	IL_1c06:  nop 
	IL_1c07:  ldloc 43

	IL_1c0b:  nop 
	IL_1c0c:  nop 
	IL_1c0d:  ldloc 11

	IL_1c11:  nop 
	IL_1c12:  nop 
	IL_1c13:  conv.u 
	IL_1c14:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1c19:  stloc 47

	IL_1c1d:  nop 
	IL_1c1e:  nop 
	IL_1c1f:  ldloc 47

	IL_1c23:  nop 
	IL_1c24:  nop 
	IL_1c25:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1c2a:  ldlen 
	IL_1c2b:  conv.i4 
	IL_1c2c:  ldc.i4 1
	IL_1c31:  beq IL_1c3b

	IL_1c36:  br IL_1c4c

	IL_1c3b:  ldloc 47

	IL_1c3f:  nop 
	IL_1c40:  nop 
	IL_1c41:  stloc 48

	IL_1c45:  nop 
	IL_1c46:  nop 
	IL_1c47:  br IL_1c89

	IL_1c4c:  ldloc 47

	IL_1c50:  nop 
	IL_1c51:  nop 
	IL_1c52:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1c57:  ldlen 
	IL_1c58:  conv.i4 
	IL_1c59:  ldc.i4 3
	IL_1c5e:  bge IL_1c68

	IL_1c63:  br IL_1c7f

	IL_1c68:  ldarg.0 
	IL_1c69:  ldloc 47

	IL_1c6d:  nop 
	IL_1c6e:  nop 
	IL_1c6f:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1c74:  stloc 48

	IL_1c78:  nop 
	IL_1c79:  nop 
	IL_1c7a:  br IL_1c84

	IL_1c7f:  br IL_1c84

	IL_1c84:  br IL_1c89

	IL_1c89:  ldarg.0 
	IL_1c8a:  ldloc 48

	IL_1c8e:  nop 
	IL_1c8f:  nop 
	IL_1c90:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1c95:  stloc 49

	IL_1c99:  nop 
	IL_1c9a:  nop 
	IL_1c9b:  ldarg.0 
	IL_1c9c:  ldloc 49

	IL_1ca0:  nop 
	IL_1ca1:  nop 
	IL_1ca2:  ldarg 2

	IL_1ca6:  nop 
	IL_1ca7:  nop 
	IL_1ca8:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_1cad:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1cb2:  stloc 45

	IL_1cb6:  nop 
	IL_1cb7:  nop 
	IL_1cb8:  ldloc 44

	IL_1cbc:  nop 
	IL_1cbd:  nop 
	IL_1cbe:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1cc3:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1cc8:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_1ccd:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1cd2:  stloc 44

	IL_1cd6:  nop 
	IL_1cd7:  nop 
	IL_1cd8:  ldloc 45

	IL_1cdc:  nop 
	IL_1cdd:  nop 
	IL_1cde:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1ce3:  ldloc 11

	IL_1ce7:  nop 
	IL_1ce8:  nop 
	IL_1ce9:  ldloc 46

	IL_1ced:  nop 
	IL_1cee:  nop 
	IL_1cef:  beq IL_1cf9

	IL_1cf4:  br IL_1d03

	IL_1cf9:  br IL_1d0d

	IL_1cfe:  br IL_1d0d

	IL_1d03:  br IL_1bf5

	IL_1d08:  br IL_1d0d

	IL_1d0d:  ldloc 61

	IL_1d11:  nop 
	IL_1d12:  nop 
	IL_1d13:  ldc.i4 1
	IL_1d18:  beq IL_1d22

	IL_1d1d:  br IL_24d0

	IL_1d22:  ldc.i4 2
	IL_1d27:  conv.u 
	IL_1d28:  newarr [mscorlib]System.Type
	IL_1d2d:  stloc 44

	IL_1d31:  nop 
	IL_1d32:  nop 
	IL_1d33:  ldloc 44

	IL_1d37:  nop 
	IL_1d38:  nop 
	IL_1d39:  ldc.i4 0
	IL_1d3e:  conv.u 
	IL_1d3f:  ldtoken [mscorlib]System.Object
	IL_1d44:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d49:  stelem [mscorlib]System.Type
	IL_1d4e:  ldloc 44

	IL_1d52:  nop 
	IL_1d53:  nop 
	IL_1d54:  ldc.i4 1
	IL_1d59:  conv.u 
	IL_1d5a:  ldtoken [mscorlib]System.IntPtr
	IL_1d5f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d64:  stelem [mscorlib]System.Type
	IL_1d69:  ldloc 60

	IL_1d6d:  nop 
	IL_1d6e:  nop 
	IL_1d6f:  ldstr ":"
	IL_1d74:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_1d79:  stloc 37

	IL_1d7d:  nop 
	IL_1d7e:  nop 
	IL_1d7f:  ldc.i4 0
	IL_1d84:  stloc 25

	IL_1d88:  nop 
	IL_1d89:  nop 
	IL_1d8a:  ldc.i4 0
	IL_1d8f:  stloc 26

	IL_1d93:  nop 
	IL_1d94:  nop 
	IL_1d95:  ldc.i4 2
	IL_1d9a:  stloc 55

	IL_1d9e:  nop 
	IL_1d9f:  nop 
	IL_1da0:  ldnull 
	IL_1da1:  stloc 36

	IL_1da5:  nop 
	IL_1da6:  nop 
	IL_1da7:  ldnull 
	IL_1da8:  stloc 38

	IL_1dac:  nop 
	IL_1dad:  nop 
	IL_1dae:  ldnull 
	IL_1daf:  stloc 51

	IL_1db3:  nop 
	IL_1db4:  nop 
	IL_1db5:  ldc.i4 -1
	IL_1dba:  stloc 11

	IL_1dbe:  nop 
	IL_1dbf:  nop 
	IL_1dc0:  ldloc 37

	IL_1dc4:  nop 
	IL_1dc5:  nop 
	IL_1dc6:  ldlen 
	IL_1dc7:  conv.i4 
	IL_1dc8:  ldc.i4 2
	IL_1dcd:  sub 
	IL_1dce:  stloc 13

	IL_1dd2:  nop 
	IL_1dd3:  nop 
	IL_1dd4:  ldloc 37

	IL_1dd8:  nop 
	IL_1dd9:  nop 
	IL_1dda:  ldc.i4 0
	IL_1ddf:  conv.u 
	IL_1de0:  ldelem [mscorlib]System.String
	IL_1de5:  ldstr "me"
	IL_1dea:  call int32 string::Compare(string, string)
	IL_1def:  stloc 28

	IL_1df3:  nop 
	IL_1df4:  nop 
	IL_1df5:  ldloc 28

	IL_1df9:  nop 
	IL_1dfa:  nop 
	IL_1dfb:  ldc.i4 0
	IL_1e00:  beq IL_1e0a

	IL_1e05:  br IL_1e37

	IL_1e0a:  ldloc 11

	IL_1e0e:  nop 
	IL_1e0f:  nop 
	IL_1e10:  ldc.i4 1
	IL_1e15:  add 
	IL_1e16:  stloc 11

	IL_1e1a:  nop 
	IL_1e1b:  nop 
	IL_1e1c:  ldc.i4 1
	IL_1e21:  stloc 25

	IL_1e25:  nop 
	IL_1e26:  nop 
	IL_1e27:  ldc.i4 3
	IL_1e2c:  stloc 55

	IL_1e30:  nop 
	IL_1e31:  nop 
	IL_1e32:  br IL_1e3c

	IL_1e37:  br IL_1e3c

	IL_1e3c:  ldloc 37

	IL_1e40:  nop 
	IL_1e41:  nop 
	IL_1e42:  ldlen 
	IL_1e43:  conv.i4 
	IL_1e44:  stloc 28

	IL_1e48:  nop 
	IL_1e49:  nop 
	IL_1e4a:  ldloc 28

	IL_1e4e:  nop 
	IL_1e4f:  nop 
	IL_1e50:  ldloc 55

	IL_1e54:  nop 
	IL_1e55:  nop 
	IL_1e56:  bge IL_1e60

	IL_1e5b:  br IL_22db

	IL_1e60:  ldc.i4 1
	IL_1e65:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_1e6a:  ldloc 11

	IL_1e6e:  nop 
	IL_1e6f:  nop 
	IL_1e70:  ldc.i4 1
	IL_1e75:  add 
	IL_1e76:  stloc 11

	IL_1e7a:  nop 
	IL_1e7b:  nop 
	IL_1e7c:  ldloc 26

	IL_1e80:  nop 
	IL_1e81:  nop 
	IL_1e82:  ldc.i4 0
	IL_1e87:  beq IL_1e91

	IL_1e8c:  br IL_2173

	IL_1e91:  ldloc 25

	IL_1e95:  nop 
	IL_1e96:  nop 
	IL_1e97:  ldc.i4 0
	IL_1e9c:  beq IL_1ea6

	IL_1ea1:  br IL_204a

	IL_1ea6:  ldloc 37

	IL_1eaa:  nop 
	IL_1eab:  nop 
	IL_1eac:  ldloc 11

	IL_1eb0:  nop 
	IL_1eb1:  nop 
	IL_1eb2:  conv.u 
	IL_1eb3:  ldelem [mscorlib]System.String
	IL_1eb8:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_1ebd:  stloc 52

	IL_1ec1:  nop 
	IL_1ec2:  nop 
	IL_1ec3:  ldloc 52

	IL_1ec7:  nop 
	IL_1ec8:  nop 
	IL_1ec9:  ldnull 
	IL_1eca:  beq IL_1f49

	IL_1ecf:  br IL_1ed4

	IL_1ed4:  ldarg 2

	IL_1ed8:  nop 
	IL_1ed9:  nop 
	IL_1eda:  ldc.i4 1
	IL_1edf:  beq IL_1ee9

	IL_1ee4:  br IL_1f19

	IL_1ee9:  ldloc 52

	IL_1eed:  nop 
	IL_1eee:  nop 
	IL_1eef:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_1ef4:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1ef9:  ldloc 52

	IL_1efd:  nop 
	IL_1efe:  nop 
	IL_1eff:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_1f04:  ldloc 52

	IL_1f08:  nop 
	IL_1f09:  nop 
	IL_1f0a:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_1f0f:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_1f14:  br IL_1f1e

	IL_1f19:  br IL_1f1e

	IL_1f1e:  ldloc 52

	IL_1f22:  nop 
	IL_1f23:  nop 
	IL_1f24:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_1f29:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1f2e:  ldloc 52

	IL_1f32:  nop 
	IL_1f33:  nop 
	IL_1f34:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_1f39:  stloc 36

	IL_1f3d:  nop 
	IL_1f3e:  nop 
	IL_1f3f:  br IL_2297

	IL_1f44:  br IL_2045

	IL_1f49:  ldloc 37

	IL_1f4d:  nop 
	IL_1f4e:  nop 
	IL_1f4f:  ldloc 11

	IL_1f53:  nop 
	IL_1f54:  nop 
	IL_1f55:  conv.u 
	IL_1f56:  ldelem [mscorlib]System.String
	IL_1f5b:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_1f60:  stloc 51

	IL_1f64:  nop 
	IL_1f65:  nop 
	IL_1f66:  ldloc 51

	IL_1f6a:  nop 
	IL_1f6b:  nop 
	IL_1f6c:  ldnull 
	IL_1f6d:  beq IL_203b

	IL_1f72:  br IL_1f77

	IL_1f77:  ldloc 51

	IL_1f7b:  nop 
	IL_1f7c:  nop 
	IL_1f7d:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_1f82:  stloc 30

	IL_1f86:  nop 
	IL_1f87:  nop 
	IL_1f88:  ldloc 30

	IL_1f8c:  nop 
	IL_1f8d:  nop 
	IL_1f8e:  ldc.i4 0
	IL_1f93:  beq IL_1f9d

	IL_1f98:  br IL_1fcb

	IL_1f9d:  ldarg 2

	IL_1fa1:  nop 
	IL_1fa2:  nop 
	IL_1fa3:  ldc.i4 1
	IL_1fa8:  beq IL_1fb2

	IL_1fad:  br IL_1fc1

	IL_1fb2:  ldc.i4 0
	IL_1fb7:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1fbc:  br IL_1fc6

	IL_1fc1:  br IL_1fc6

	IL_1fc6:  br IL_1fd0

	IL_1fcb:  br IL_1fd0

	IL_1fd0:  ldarg 2

	IL_1fd4:  nop 
	IL_1fd5:  nop 
	IL_1fd6:  ldc.i4 1
	IL_1fdb:  beq IL_1fe5

	IL_1fe0:  br IL_200b

	IL_1fe5:  ldloc 51

	IL_1fe9:  nop 
	IL_1fea:  nop 
	IL_1feb:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1ff0:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1ff5:  ldloc 51

	IL_1ff9:  nop 
	IL_1ffa:  nop 
	IL_1ffb:  ldloc 30

	IL_1fff:  nop 
	IL_2000:  nop 
	IL_2001:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_2006:  br IL_2010

	IL_200b:  br IL_2010

	IL_2010:  ldloc 51

	IL_2014:  nop 
	IL_2015:  nop 
	IL_2016:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_201b:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2020:  ldloc 51

	IL_2024:  nop 
	IL_2025:  nop 
	IL_2026:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_202b:  stloc 36

	IL_202f:  nop 
	IL_2030:  nop 
	IL_2031:  br IL_2297

	IL_2036:  br IL_2040

	IL_203b:  br IL_2040

	IL_2040:  br IL_2045

	IL_2045:  br IL_2146

	IL_204a:  ldloc 37

	IL_204e:  nop 
	IL_204f:  nop 
	IL_2050:  ldloc 11

	IL_2054:  nop 
	IL_2055:  nop 
	IL_2056:  conv.u 
	IL_2057:  ldelem [mscorlib]System.String
	IL_205c:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_2061:  stloc 51

	IL_2065:  nop 
	IL_2066:  nop 
	IL_2067:  ldloc 51

	IL_206b:  nop 
	IL_206c:  nop 
	IL_206d:  ldnull 
	IL_206e:  beq IL_213c

	IL_2073:  br IL_2078

	IL_2078:  ldloc 51

	IL_207c:  nop 
	IL_207d:  nop 
	IL_207e:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_2083:  stloc 30

	IL_2087:  nop 
	IL_2088:  nop 
	IL_2089:  ldloc 30

	IL_208d:  nop 
	IL_208e:  nop 
	IL_208f:  ldc.i4 0
	IL_2094:  beq IL_209e

	IL_2099:  br IL_20cc

	IL_209e:  ldarg 2

	IL_20a2:  nop 
	IL_20a3:  nop 
	IL_20a4:  ldc.i4 1
	IL_20a9:  beq IL_20b3

	IL_20ae:  br IL_20c2

	IL_20b3:  ldc.i4 0
	IL_20b8:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_20bd:  br IL_20c7

	IL_20c2:  br IL_20c7

	IL_20c7:  br IL_20d1

	IL_20cc:  br IL_20d1

	IL_20d1:  ldarg 2

	IL_20d5:  nop 
	IL_20d6:  nop 
	IL_20d7:  ldc.i4 1
	IL_20dc:  beq IL_20e6

	IL_20e1:  br IL_210c

	IL_20e6:  ldloc 51

	IL_20ea:  nop 
	IL_20eb:  nop 
	IL_20ec:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_20f1:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_20f6:  ldloc 51

	IL_20fa:  nop 
	IL_20fb:  nop 
	IL_20fc:  ldloc 30

	IL_2100:  nop 
	IL_2101:  nop 
	IL_2102:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_2107:  br IL_2111

	IL_210c:  br IL_2111

	IL_2111:  ldloc 51

	IL_2115:  nop 
	IL_2116:  nop 
	IL_2117:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_211c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2121:  ldloc 51

	IL_2125:  nop 
	IL_2126:  nop 
	IL_2127:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_212c:  stloc 36

	IL_2130:  nop 
	IL_2131:  nop 
	IL_2132:  br IL_2297

	IL_2137:  br IL_2141

	IL_213c:  br IL_2141

	IL_2141:  br IL_2146

	IL_2146:  ldloc 37

	IL_214a:  nop 
	IL_214b:  nop 
	IL_214c:  ldloc 11

	IL_2150:  nop 
	IL_2151:  nop 
	IL_2152:  conv.u 
	IL_2153:  ldelem [mscorlib]System.String
	IL_2158:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_215d:  stloc 36

	IL_2161:  nop 
	IL_2162:  nop 
	IL_2163:  ldc.i4 1
	IL_2168:  stloc 53

	IL_216c:  nop 
	IL_216d:  nop 
	IL_216e:  br IL_2297

	IL_2173:  ldloc 36

	IL_2177:  nop 
	IL_2178:  nop 
	IL_2179:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_217e:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_2183:  stloc 9

	IL_2187:  nop 
	IL_2188:  nop 
	IL_2189:  ldloc 9

	IL_218d:  nop 
	IL_218e:  nop 
	IL_218f:  ldc.i4 0
	IL_2194:  beq IL_219e

	IL_2199:  br IL_21e5

	IL_219e:  ldloc 36

	IL_21a2:  nop 
	IL_21a3:  nop 
	IL_21a4:  ldloc 37

	IL_21a8:  nop 
	IL_21a9:  nop 
	IL_21aa:  ldloc 11

	IL_21ae:  nop 
	IL_21af:  nop 
	IL_21b0:  conv.u 
	IL_21b1:  ldelem [mscorlib]System.String
	IL_21b6:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_21bb:  stloc 51

	IL_21bf:  nop 
	IL_21c0:  nop 
	IL_21c1:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_21c6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_21cb:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_21d0:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_21d5:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_21da:  stloc 36

	IL_21de:  nop 
	IL_21df:  nop 
	IL_21e0:  br IL_2238

	IL_21e5:  ldloc 37

	IL_21e9:  nop 
	IL_21ea:  nop 
	IL_21eb:  ldloc 11

	IL_21ef:  nop 
	IL_21f0:  nop 
	IL_21f1:  conv.u 
	IL_21f2:  ldelem [mscorlib]System.String
	IL_21f7:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_21fc:  stloc 51

	IL_2200:  nop 
	IL_2201:  nop 
	IL_2202:  ldloc 51

	IL_2206:  nop 
	IL_2207:  nop 
	IL_2208:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_220d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2212:  ldloc 51

	IL_2216:  nop 
	IL_2217:  nop 
	IL_2218:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_221d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_2222:  ldloc 51

	IL_2226:  nop 
	IL_2227:  nop 
	IL_2228:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_222d:  stloc 36

	IL_2231:  nop 
	IL_2232:  nop 
	IL_2233:  br IL_2238

	IL_2238:  ldarg 2

	IL_223c:  nop 
	IL_223d:  nop 
	IL_223e:  ldc.i4 1
	IL_2243:  beq IL_224d

	IL_2248:  br IL_2263

	IL_224d:  ldloc 51

	IL_2251:  nop 
	IL_2252:  nop 
	IL_2253:  ldloc 53

	IL_2257:  nop 
	IL_2258:  nop 
	IL_2259:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_225e:  br IL_2268

	IL_2263:  br IL_2268

	IL_2268:  ldloc 53

	IL_226c:  nop 
	IL_226d:  nop 
	IL_226e:  ldc.i4 1
	IL_2273:  beq IL_227d

	IL_2278:  br IL_228d

	IL_227d:  ldc.i4 0
	IL_2282:  stloc 53

	IL_2286:  nop 
	IL_2287:  nop 
	IL_2288:  br IL_2292

	IL_228d:  br IL_2292

	IL_2292:  br IL_2297

	IL_2297:  ldc.i4 1
	IL_229c:  stloc 26

	IL_22a0:  nop 
	IL_22a1:  nop 
	IL_22a2:  ldloc 11

	IL_22a6:  nop 
	IL_22a7:  nop 
	IL_22a8:  ldloc 13

	IL_22ac:  nop 
	IL_22ad:  nop 
	IL_22ae:  beq IL_22b8

	IL_22b3:  br IL_22c2

	IL_22b8:  br IL_22cc

	IL_22bd:  br IL_22cc

	IL_22c2:  br IL_1e6a

	IL_22c7:  br IL_22cc

	IL_22cc:  ldc.i4 0
	IL_22d1:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_22d6:  br IL_22e0

	IL_22db:  br IL_22e0

	IL_22e0:  ldloc 11

	IL_22e4:  nop 
	IL_22e5:  nop 
	IL_22e6:  ldc.i4 1
	IL_22eb:  add 
	IL_22ec:  stloc 11

	IL_22f0:  nop 
	IL_22f1:  nop 
	IL_22f2:  ldloc 26

	IL_22f6:  nop 
	IL_22f7:  nop 
	IL_22f8:  ldc.i4 0
	IL_22fd:  beq IL_2307

	IL_2302:  br IL_2388

	IL_2307:  ldarg 2

	IL_230b:  nop 
	IL_230c:  nop 
	IL_230d:  ldc.i4 1
	IL_2312:  beq IL_231c

	IL_2317:  br IL_237e

	IL_231c:  ldloc 37

	IL_2320:  nop 
	IL_2321:  nop 
	IL_2322:  ldloc 11

	IL_2326:  nop 
	IL_2327:  nop 
	IL_2328:  conv.u 
	IL_2329:  ldelem [mscorlib]System.String
	IL_232e:  ldloc 59

	IL_2332:  nop 
	IL_2333:  nop 
	IL_2334:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_2339:  stloc 38

	IL_233d:  nop 
	IL_233e:  nop 
	IL_233f:  ldloc 38

	IL_2343:  nop 
	IL_2344:  nop 
	IL_2345:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_234a:  stloc 53

	IL_234e:  nop 
	IL_234f:  nop 
	IL_2350:  ldloc 53

	IL_2354:  nop 
	IL_2355:  nop 
	IL_2356:  ldc.i4 0
	IL_235b:  beq IL_2365

	IL_2360:  br IL_2374

	IL_2365:  ldc.i4 0
	IL_236a:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_236f:  br IL_2379

	IL_2374:  br IL_2379

	IL_2379:  br IL_2383

	IL_237e:  br IL_2383

	IL_2383:  br IL_238d

	IL_2388:  br IL_238d

	IL_238d:  ldloc 26

	IL_2391:  nop 
	IL_2392:  nop 
	IL_2393:  ldc.i4 1
	IL_2398:  beq IL_23a2

	IL_239d:  br IL_2439

	IL_23a2:  ldloc 36

	IL_23a6:  nop 
	IL_23a7:  nop 
	IL_23a8:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_23ad:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_23b2:  stloc 9

	IL_23b6:  nop 
	IL_23b7:  nop 
	IL_23b8:  ldloc 9

	IL_23bc:  nop 
	IL_23bd:  nop 
	IL_23be:  ldc.i4 0
	IL_23c3:  beq IL_23cd

	IL_23c8:  br IL_23fb

	IL_23cd:  ldloc 36

	IL_23d1:  nop 
	IL_23d2:  nop 
	IL_23d3:  ldloc 37

	IL_23d7:  nop 
	IL_23d8:  nop 
	IL_23d9:  ldloc 11

	IL_23dd:  nop 
	IL_23de:  nop 
	IL_23df:  conv.u 
	IL_23e0:  ldelem [mscorlib]System.String
	IL_23e5:  ldloc 59

	IL_23e9:  nop 
	IL_23ea:  nop 
	IL_23eb:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadMethod(class [mscorlib]System.Type, string, class [mscorlib]System.Type[])
	IL_23f0:  stloc 38

	IL_23f4:  nop 
	IL_23f5:  nop 
	IL_23f6:  br IL_2434

	IL_23fb:  ldloc 37

	IL_23ff:  nop 
	IL_2400:  nop 
	IL_2401:  ldloc 11

	IL_2405:  nop 
	IL_2406:  nop 
	IL_2407:  conv.u 
	IL_2408:  ldelem [mscorlib]System.String
	IL_240d:  ldloc 59

	IL_2411:  nop 
	IL_2412:  nop 
	IL_2413:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_2418:  stloc 38

	IL_241c:  nop 
	IL_241d:  nop 
	IL_241e:  ldloc 38

	IL_2422:  nop 
	IL_2423:  nop 
	IL_2424:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_2429:  stloc 53

	IL_242d:  nop 
	IL_242e:  nop 
	IL_242f:  br IL_2434

	IL_2434:  br IL_2472

	IL_2439:  ldloc 37

	IL_243d:  nop 
	IL_243e:  nop 
	IL_243f:  ldloc 11

	IL_2443:  nop 
	IL_2444:  nop 
	IL_2445:  conv.u 
	IL_2446:  ldelem [mscorlib]System.String
	IL_244b:  ldloc 59

	IL_244f:  nop 
	IL_2450:  nop 
	IL_2451:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_2456:  stloc 38

	IL_245a:  nop 
	IL_245b:  nop 
	IL_245c:  ldloc 38

	IL_2460:  nop 
	IL_2461:  nop 
	IL_2462:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_2467:  stloc 53

	IL_246b:  nop 
	IL_246c:  nop 
	IL_246d:  br IL_2472

	IL_2472:  ldarg 2

	IL_2476:  nop 
	IL_2477:  nop 
	IL_2478:  ldc.i4 1
	IL_247d:  beq IL_2487

	IL_2482:  br IL_24c6

	IL_2487:  ldloc 53

	IL_248b:  nop 
	IL_248c:  nop 
	IL_248d:  ldc.i4 1
	IL_2492:  beq IL_249c

	IL_2497:  br IL_24a6

	IL_249c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdnull()
	IL_24a1:  br IL_24b0

	IL_24a6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitDup()
	IL_24ab:  br IL_24b0

	IL_24b0:  ldloc 38

	IL_24b4:  nop 
	IL_24b5:  nop 
	IL_24b6:  ldloc 53

	IL_24ba:  nop 
	IL_24bb:  nop 
	IL_24bc:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitPtrLd(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_24c1:  br IL_24cb

	IL_24c6:  br IL_24cb

	IL_24cb:  br IL_24d5

	IL_24d0:  br IL_24d5

	IL_24d5:  ldloc 39

	IL_24d9:  nop 
	IL_24da:  nop 
	IL_24db:  ldloc 44

	IL_24df:  nop 
	IL_24e0:  nop 
	IL_24e1:  call class [mscorlib]System.Reflection.ConstructorInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocCtor(class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_24e6:  stloc 50

	IL_24ea:  nop 
	IL_24eb:  nop 
	IL_24ec:  ldarg 2

	IL_24f0:  nop 
	IL_24f1:  nop 
	IL_24f2:  ldc.i4 1
	IL_24f7:  beq IL_2501

	IL_24fc:  br IL_2511

	IL_2501:  ldloc 50

	IL_2505:  nop 
	IL_2506:  nop 
	IL_2507:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNewobj(class [mscorlib]System.Reflection.ConstructorInfo)
	IL_250c:  br IL_2516

	IL_2511:  br IL_2516

	IL_2516:  ldloc 39

	IL_251a:  nop 
	IL_251b:  nop 
	IL_251c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2521:  br IL_28f9

	IL_2526:  br IL_2530

	IL_252b:  br IL_2530

	IL_2530:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok
	IL_2535:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_253a:  stloc 8

	IL_253e:  nop 
	IL_253f:  nop 
	IL_2540:  ldloc 8

	IL_2544:  nop 
	IL_2545:  nop 
	IL_2546:  ldarg 1

	IL_254a:  nop 
	IL_254b:  nop 
	IL_254c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_2551:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2556:  stloc 9

	IL_255a:  nop 
	IL_255b:  nop 
	IL_255c:  ldloc 9

	IL_2560:  nop 
	IL_2561:  nop 
	IL_2562:  ldc.i4 1
	IL_2567:  beq IL_2571

	IL_256c:  br IL_2671

	IL_2571:  ldarg 2

	IL_2575:  nop 
	IL_2576:  nop 
	IL_2577:  ldc.i4 1
	IL_257c:  beq IL_2586

	IL_2581:  br IL_2653

	IL_2586:  ldarg 1

	IL_258a:  nop 
	IL_258b:  nop 
	IL_258c:  stloc 62

	IL_2590:  nop 
	IL_2591:  nop 
	IL_2592:  ldloc 62

	IL_2596:  nop 
	IL_2597:  nop 
	IL_2598:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_259d:  stloc 10

	IL_25a1:  nop 
	IL_25a2:  nop 
	IL_25a3:  ldloc 10

	IL_25a7:  nop 
	IL_25a8:  nop 
	IL_25a9:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_25ae:  stloc 8

	IL_25b2:  nop 
	IL_25b3:  nop 
	IL_25b4:  ldloc 8

	IL_25b8:  nop 
	IL_25b9:  nop 
	IL_25ba:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdtoken(class [mscorlib]System.Type)
	IL_25bf:  ldc.i4 0
	IL_25c4:  conv.u 
	IL_25c5:  newarr [mscorlib]System.Type
	IL_25ca:  stloc 44

	IL_25ce:  nop 
	IL_25cf:  nop 
	IL_25d0:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_25d5:  stloc 45

	IL_25d9:  nop 
	IL_25da:  nop 
	IL_25db:  ldloc 44

	IL_25df:  nop 
	IL_25e0:  nop 
	IL_25e1:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_25e6:  ldtoken [mscorlib]System.RuntimeTypeHandle
	IL_25eb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_25f0:  stloc 8

	IL_25f4:  nop 
	IL_25f5:  nop 
	IL_25f6:  ldloc 8

	IL_25fa:  nop 
	IL_25fb:  nop 
	IL_25fc:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_2601:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_2606:  stloc 44

	IL_260a:  nop 
	IL_260b:  nop 
	IL_260c:  ldloc 45

	IL_2610:  nop 
	IL_2611:  nop 
	IL_2612:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_2617:  ldtoken [mscorlib]System.Type
	IL_261c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2621:  stloc 8

	IL_2625:  nop 
	IL_2626:  nop 
	IL_2627:  ldloc 8

	IL_262b:  nop 
	IL_262c:  nop 
	IL_262d:  ldstr "GetTypeFromHandle"
	IL_2632:  ldloc 44

	IL_2636:  nop 
	IL_2637:  nop 
	IL_2638:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_263d:  stloc 38

	IL_2641:  nop 
	IL_2642:  nop 
	IL_2643:  ldloc 38

	IL_2647:  nop 
	IL_2648:  nop 
	IL_2649:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_264e:  br IL_2658

	IL_2653:  br IL_2658

	IL_2658:  ldtoken [mscorlib]System.Type
	IL_265d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2662:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_2667:  br IL_28f9

	IL_266c:  br IL_2676

	IL_2671:  br IL_2676

	IL_2676:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok
	IL_267b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2680:  stloc 8

	IL_2684:  nop 
	IL_2685:  nop 
	IL_2686:  ldloc 8

	IL_268a:  nop 
	IL_268b:  nop 
	IL_268c:  ldarg 1

	IL_2690:  nop 
	IL_2691:  nop 
	IL_2692:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_2697:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_269c:  stloc 9

	IL_26a0:  nop 
	IL_26a1:  nop 
	IL_26a2:  ldloc 9

	IL_26a6:  nop 
	IL_26a7:  nop 
	IL_26a8:  ldc.i4 1
	IL_26ad:  beq IL_26b7

	IL_26b2:  br IL_26f4

	IL_26b7:  ldarg 2

	IL_26bb:  nop 
	IL_26bc:  nop 
	IL_26bd:  ldc.i4 1
	IL_26c2:  beq IL_26cc

	IL_26c7:  br IL_26db

	IL_26cc:  ldc.i4 0
	IL_26d1:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_26d6:  br IL_26e0

	IL_26db:  br IL_26e0

	IL_26e0:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_26e5:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_26ea:  br IL_28f9

	IL_26ef:  br IL_26f9

	IL_26f4:  br IL_26f9

	IL_26f9:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok
	IL_26fe:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2703:  stloc 8

	IL_2707:  nop 
	IL_2708:  nop 
	IL_2709:  ldloc 8

	IL_270d:  nop 
	IL_270e:  nop 
	IL_270f:  ldarg 1

	IL_2713:  nop 
	IL_2714:  nop 
	IL_2715:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_271a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_271f:  stloc 9

	IL_2723:  nop 
	IL_2724:  nop 
	IL_2725:  ldloc 9

	IL_2729:  nop 
	IL_272a:  nop 
	IL_272b:  ldc.i4 1
	IL_2730:  beq IL_273a

	IL_2735:  br IL_27f8

	IL_273a:  ldarg 1

	IL_273e:  nop 
	IL_273f:  nop 
	IL_2740:  stloc 63

	IL_2744:  nop 
	IL_2745:  nop 
	IL_2746:  ldloc 63

	IL_274a:  nop 
	IL_274b:  nop 
	IL_274c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_2751:  stloc 47

	IL_2755:  nop 
	IL_2756:  nop 
	IL_2757:  ldloc 63

	IL_275b:  nop 
	IL_275c:  nop 
	IL_275d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_2762:  stloc 10

	IL_2766:  nop 
	IL_2767:  nop 
	IL_2768:  ldloc 10

	IL_276c:  nop 
	IL_276d:  nop 
	IL_276e:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_2773:  stloc 8

	IL_2777:  nop 
	IL_2778:  nop 
	IL_2779:  ldarg.0 
	IL_277a:  ldloc 47

	IL_277e:  nop 
	IL_277f:  nop 
	IL_2780:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_2785:  stloc 47

	IL_2789:  nop 
	IL_278a:  nop 
	IL_278b:  ldarg.0 
	IL_278c:  ldloc 47

	IL_2790:  nop 
	IL_2791:  nop 
	IL_2792:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_2797:  starg 1

	IL_279b:  nop 
	IL_279c:  nop 
	IL_279d:  ldarg.0 
	IL_279e:  ldarg 1

	IL_27a2:  nop 
	IL_27a3:  nop 
	IL_27a4:  ldarg 2

	IL_27a8:  nop 
	IL_27a9:  nop 
	IL_27aa:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_27af:  ldarg 2

	IL_27b3:  nop 
	IL_27b4:  nop 
	IL_27b5:  ldc.i4 1
	IL_27ba:  beq IL_27c4

	IL_27bf:  br IL_27d9

	IL_27c4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI()
	IL_27c9:  ldloc 8

	IL_27cd:  nop 
	IL_27ce:  nop 
	IL_27cf:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNewarr(class [mscorlib]System.Type)
	IL_27d4:  br IL_27de

	IL_27d9:  br IL_27de

	IL_27de:  ldloc 8

	IL_27e2:  nop 
	IL_27e3:  nop 
	IL_27e4:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeArrayType()
	IL_27e9:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_27ee:  br IL_28f9

	IL_27f3:  br IL_27fd

	IL_27f8:  br IL_27fd

	IL_27fd:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok
	IL_2802:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_2807:  stloc 8

	IL_280b:  nop 
	IL_280c:  nop 
	IL_280d:  ldloc 8

	IL_2811:  nop 
	IL_2812:  nop 
	IL_2813:  ldarg 1

	IL_2817:  nop 
	IL_2818:  nop 
	IL_2819:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_281e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_2823:  stloc 9

	IL_2827:  nop 
	IL_2828:  nop 
	IL_2829:  ldloc 9

	IL_282d:  nop 
	IL_282e:  nop 
	IL_282f:  ldc.i4 1
	IL_2834:  beq IL_283e

	IL_2839:  br IL_28f4

	IL_283e:  ldarg 2

	IL_2842:  nop 
	IL_2843:  nop 
	IL_2844:  ldc.i4 1
	IL_2849:  beq IL_2853

	IL_284e:  br IL_28d6

	IL_2853:  ldarg 1

	IL_2857:  nop 
	IL_2858:  nop 
	IL_2859:  stloc 64

	IL_285d:  nop 
	IL_285e:  nop 
	IL_285f:  ldloc 64

	IL_2863:  nop 
	IL_2864:  nop 
	IL_2865:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_286a:  stloc 41

	IL_286e:  nop 
	IL_286f:  nop 
	IL_2870:  ldloc 41

	IL_2874:  nop 
	IL_2875:  nop 
	IL_2876:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_287b:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMetNoParams(string)
	IL_2880:  stloc 38

	IL_2884:  nop 
	IL_2885:  nop 
	IL_2886:  ldloc 38

	IL_288a:  nop 
	IL_288b:  nop 
	IL_288c:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_2891:  stloc 53

	IL_2895:  nop 
	IL_2896:  nop 
	IL_2897:  ldloc 53

	IL_289b:  nop 
	IL_289c:  nop 
	IL_289d:  ldc.i4 0
	IL_28a2:  beq IL_28ac

	IL_28a7:  br IL_28bb

	IL_28ac:  ldc.i4 0
	IL_28b1:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_28b6:  br IL_28c0

	IL_28bb:  br IL_28c0

	IL_28c0:  ldloc 38

	IL_28c4:  nop 
	IL_28c5:  nop 
	IL_28c6:  ldloc 53

	IL_28ca:  nop 
	IL_28cb:  nop 
	IL_28cc:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitPtrLd(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_28d1:  br IL_28db

	IL_28d6:  br IL_28db

	IL_28db:  ldtoken [mscorlib]System.IntPtr
	IL_28e0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_28e5:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_28ea:  br IL_28f9

	IL_28ef:  br IL_28f9

	IL_28f4:  br IL_28f9

	IL_28f9:  br IL_28fe

	IL_28fe:  ret 
    } // end of method Evaluator::ASTEmit

    // method line 87
    .method public 
           instance default void Evaluate (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0xaf9c
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

    // method line 88
    .method public 
           instance default void StoreEmit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0xb04c
	// Code size 2033 (0x7f1)
	.maxstack 82
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_14,
		class [mscorlib]System.Type	V_15,
		bool	V_16,
		int32	V_17)
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
	IL_004e:  stloc 17

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
	IL_00e1:  stloc 17

	IL_00e5:  nop 
	IL_00e6:  nop 
	IL_00e7:  br IL_00f1

	IL_00ec:  br IL_00f1

	IL_00f1:  ldloc 4

	IL_00f5:  nop 
	IL_00f6:  nop 
	IL_00f7:  ldlen 
	IL_00f8:  conv.i4 
	IL_00f9:  stloc 9

	IL_00fd:  nop 
	IL_00fe:  nop 
	IL_00ff:  ldloc 9

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  ldloc 17

	IL_0109:  nop 
	IL_010a:  nop 
	IL_010b:  bge IL_0115

	IL_0110:  br IL_048c

	IL_0115:  ldc.i4 1
	IL_011a:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_011f:  ldloc 0

	IL_0123:  nop 
	IL_0124:  nop 
	IL_0125:  ldc.i4 1
	IL_012a:  add 
	IL_012b:  stloc 0

	IL_012f:  nop 
	IL_0130:  nop 
	IL_0131:  ldloc 7

	IL_0135:  nop 
	IL_0136:  nop 
	IL_0137:  ldc.i4 0
	IL_013c:  beq IL_0146

	IL_0141:  br IL_035d

	IL_0146:  ldloc 6

	IL_014a:  nop 
	IL_014b:  nop 
	IL_014c:  ldc.i4 0
	IL_0151:  beq IL_015b

	IL_0156:  br IL_0282

	IL_015b:  ldloc 4

	IL_015f:  nop 
	IL_0160:  nop 
	IL_0161:  ldloc 0

	IL_0165:  nop 
	IL_0166:  nop 
	IL_0167:  conv.u 
	IL_0168:  ldelem [mscorlib]System.String
	IL_016d:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_0172:  stloc 5

	IL_0176:  nop 
	IL_0177:  nop 
	IL_0178:  ldloc 5

	IL_017c:  nop 
	IL_017d:  nop 
	IL_017e:  ldnull 
	IL_017f:  beq IL_01cf

	IL_0184:  br IL_0189

	IL_0189:  ldloc 5

	IL_018d:  nop 
	IL_018e:  nop 
	IL_018f:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_0194:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0199:  ldloc 5

	IL_019d:  nop 
	IL_019e:  nop 
	IL_019f:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_01a4:  ldloc 5

	IL_01a8:  nop 
	IL_01a9:  nop 
	IL_01aa:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_01af:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_01b4:  ldloc 5

	IL_01b8:  nop 
	IL_01b9:  nop 
	IL_01ba:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_01bf:  stloc 10

	IL_01c3:  nop 
	IL_01c4:  nop 
	IL_01c5:  br IL_0448

	IL_01ca:  br IL_027d

	IL_01cf:  ldloc 4

	IL_01d3:  nop 
	IL_01d4:  nop 
	IL_01d5:  ldloc 0

	IL_01d9:  nop 
	IL_01da:  nop 
	IL_01db:  conv.u 
	IL_01dc:  ldelem [mscorlib]System.String
	IL_01e1:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_01e6:  stloc 11

	IL_01ea:  nop 
	IL_01eb:  nop 
	IL_01ec:  ldloc 11

	IL_01f0:  nop 
	IL_01f1:  nop 
	IL_01f2:  ldnull 
	IL_01f3:  beq IL_0273

	IL_01f8:  br IL_01fd

	IL_01fd:  ldloc 11

	IL_0201:  nop 
	IL_0202:  nop 
	IL_0203:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0208:  stloc 8

	IL_020c:  nop 
	IL_020d:  nop 
	IL_020e:  ldloc 8

	IL_0212:  nop 
	IL_0213:  nop 
	IL_0214:  ldc.i4 0
	IL_0219:  beq IL_0223

	IL_021e:  br IL_0232

	IL_0223:  ldc.i4 0
	IL_0228:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_022d:  br IL_0237

	IL_0232:  br IL_0237

	IL_0237:  ldloc 11

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0242:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0247:  ldloc 11

	IL_024b:  nop 
	IL_024c:  nop 
	IL_024d:  ldloc 8

	IL_0251:  nop 
	IL_0252:  nop 
	IL_0253:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0258:  ldloc 11

	IL_025c:  nop 
	IL_025d:  nop 
	IL_025e:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0263:  stloc 10

	IL_0267:  nop 
	IL_0268:  nop 
	IL_0269:  br IL_0448

	IL_026e:  br IL_0278

	IL_0273:  br IL_0278

	IL_0278:  br IL_027d

	IL_027d:  br IL_0330

	IL_0282:  ldloc 4

	IL_0286:  nop 
	IL_0287:  nop 
	IL_0288:  ldloc 0

	IL_028c:  nop 
	IL_028d:  nop 
	IL_028e:  conv.u 
	IL_028f:  ldelem [mscorlib]System.String
	IL_0294:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0299:  stloc 11

	IL_029d:  nop 
	IL_029e:  nop 
	IL_029f:  ldloc 11

	IL_02a3:  nop 
	IL_02a4:  nop 
	IL_02a5:  ldnull 
	IL_02a6:  beq IL_0326

	IL_02ab:  br IL_02b0

	IL_02b0:  ldloc 11

	IL_02b4:  nop 
	IL_02b5:  nop 
	IL_02b6:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_02bb:  stloc 8

	IL_02bf:  nop 
	IL_02c0:  nop 
	IL_02c1:  ldloc 8

	IL_02c5:  nop 
	IL_02c6:  nop 
	IL_02c7:  ldc.i4 0
	IL_02cc:  beq IL_02d6

	IL_02d1:  br IL_02e5

	IL_02d6:  ldc.i4 0
	IL_02db:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_02e0:  br IL_02ea

	IL_02e5:  br IL_02ea

	IL_02ea:  ldloc 11

	IL_02ee:  nop 
	IL_02ef:  nop 
	IL_02f0:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_02f5:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_02fa:  ldloc 11

	IL_02fe:  nop 
	IL_02ff:  nop 
	IL_0300:  ldloc 8

	IL_0304:  nop 
	IL_0305:  nop 
	IL_0306:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_030b:  ldloc 11

	IL_030f:  nop 
	IL_0310:  nop 
	IL_0311:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0316:  stloc 10

	IL_031a:  nop 
	IL_031b:  nop 
	IL_031c:  br IL_0448

	IL_0321:  br IL_032b

	IL_0326:  br IL_032b

	IL_032b:  br IL_0330

	IL_0330:  ldloc 4

	IL_0334:  nop 
	IL_0335:  nop 
	IL_0336:  ldloc 0

	IL_033a:  nop 
	IL_033b:  nop 
	IL_033c:  conv.u 
	IL_033d:  ldelem [mscorlib]System.String
	IL_0342:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_0347:  stloc 10

	IL_034b:  nop 
	IL_034c:  nop 
	IL_034d:  ldc.i4 1
	IL_0352:  stloc 8

	IL_0356:  nop 
	IL_0357:  nop 
	IL_0358:  br IL_0448

	IL_035d:  ldloc 10

	IL_0361:  nop 
	IL_0362:  nop 
	IL_0363:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0368:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_036d:  stloc 16

	IL_0371:  nop 
	IL_0372:  nop 
	IL_0373:  ldloc 16

	IL_0377:  nop 
	IL_0378:  nop 
	IL_0379:  ldc.i4 0
	IL_037e:  beq IL_0388

	IL_0383:  br IL_03c5

	IL_0388:  ldloc 10

	IL_038c:  nop 
	IL_038d:  nop 
	IL_038e:  ldloc 4

	IL_0392:  nop 
	IL_0393:  nop 
	IL_0394:  ldloc 0

	IL_0398:  nop 
	IL_0399:  nop 
	IL_039a:  conv.u 
	IL_039b:  ldelem [mscorlib]System.String
	IL_03a0:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_03a5:  stloc 11

	IL_03a9:  nop 
	IL_03aa:  nop 
	IL_03ab:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_03b0:  stloc 10

	IL_03b4:  nop 
	IL_03b5:  nop 
	IL_03b6:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_03bb:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_03c0:  br IL_0408

	IL_03c5:  ldloc 4

	IL_03c9:  nop 
	IL_03ca:  nop 
	IL_03cb:  ldloc 0

	IL_03cf:  nop 
	IL_03d0:  nop 
	IL_03d1:  conv.u 
	IL_03d2:  ldelem [mscorlib]System.String
	IL_03d7:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_03dc:  stloc 11

	IL_03e0:  nop 
	IL_03e1:  nop 
	IL_03e2:  ldloc 11

	IL_03e6:  nop 
	IL_03e7:  nop 
	IL_03e8:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_03ed:  stloc 10

	IL_03f1:  nop 
	IL_03f2:  nop 
	IL_03f3:  ldloc 11

	IL_03f7:  nop 
	IL_03f8:  nop 
	IL_03f9:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_03fe:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0403:  br IL_0408

	IL_0408:  ldloc 11

	IL_040c:  nop 
	IL_040d:  nop 
	IL_040e:  ldloc 8

	IL_0412:  nop 
	IL_0413:  nop 
	IL_0414:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0419:  ldloc 8

	IL_041d:  nop 
	IL_041e:  nop 
	IL_041f:  ldc.i4 1
	IL_0424:  beq IL_042e

	IL_0429:  br IL_043e

	IL_042e:  ldc.i4 0
	IL_0433:  stloc 8

	IL_0437:  nop 
	IL_0438:  nop 
	IL_0439:  br IL_0443

	IL_043e:  br IL_0443

	IL_0443:  br IL_0448

	IL_0448:  ldc.i4 1
	IL_044d:  stloc 7

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  ldloc 0

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  ldloc 1

	IL_045d:  nop 
	IL_045e:  nop 
	IL_045f:  beq IL_0469

	IL_0464:  br IL_0473

	IL_0469:  br IL_047d

	IL_046e:  br IL_047d

	IL_0473:  br IL_011f

	IL_0478:  br IL_047d

	IL_047d:  ldc.i4 0
	IL_0482:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0487:  br IL_0491

	IL_048c:  br IL_0491

	IL_0491:  ldloc 0

	IL_0495:  nop 
	IL_0496:  nop 
	IL_0497:  ldc.i4 1
	IL_049c:  add 
	IL_049d:  stloc 0

	IL_04a1:  nop 
	IL_04a2:  nop 
	IL_04a3:  ldloc 7

	IL_04a7:  nop 
	IL_04a8:  nop 
	IL_04a9:  ldc.i4 0
	IL_04ae:  beq IL_04b8

	IL_04b3:  br IL_05f8

	IL_04b8:  ldloc 6

	IL_04bc:  nop 
	IL_04bd:  nop 
	IL_04be:  ldc.i4 0
	IL_04c3:  beq IL_04cd

	IL_04c8:  br IL_057c

	IL_04cd:  ldloc 4

	IL_04d1:  nop 
	IL_04d2:  nop 
	IL_04d3:  ldloc 0

	IL_04d7:  nop 
	IL_04d8:  nop 
	IL_04d9:  conv.u 
	IL_04da:  ldelem [mscorlib]System.String
	IL_04df:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_04e4:  stloc 5

	IL_04e8:  nop 
	IL_04e9:  nop 
	IL_04ea:  ldloc 5

	IL_04ee:  nop 
	IL_04ef:  nop 
	IL_04f0:  ldnull 
	IL_04f1:  beq IL_0500

	IL_04f6:  br IL_04fb

	IL_04fb:  br IL_0577

	IL_0500:  ldloc 4

	IL_0504:  nop 
	IL_0505:  nop 
	IL_0506:  ldloc 0

	IL_050a:  nop 
	IL_050b:  nop 
	IL_050c:  conv.u 
	IL_050d:  ldelem [mscorlib]System.String
	IL_0512:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0517:  stloc 11

	IL_051b:  nop 
	IL_051c:  nop 
	IL_051d:  ldloc 11

	IL_0521:  nop 
	IL_0522:  nop 
	IL_0523:  ldnull 
	IL_0524:  beq IL_056d

	IL_0529:  br IL_052e

	IL_052e:  ldloc 11

	IL_0532:  nop 
	IL_0533:  nop 
	IL_0534:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0539:  stloc 8

	IL_053d:  nop 
	IL_053e:  nop 
	IL_053f:  ldloc 8

	IL_0543:  nop 
	IL_0544:  nop 
	IL_0545:  ldc.i4 0
	IL_054a:  beq IL_0554

	IL_054f:  br IL_0563

	IL_0554:  ldc.i4 0
	IL_0559:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_055e:  br IL_0568

	IL_0563:  br IL_0568

	IL_0568:  br IL_0572

	IL_056d:  br IL_0572

	IL_0572:  br IL_0577

	IL_0577:  br IL_05f3

	IL_057c:  ldloc 4

	IL_0580:  nop 
	IL_0581:  nop 
	IL_0582:  ldloc 0

	IL_0586:  nop 
	IL_0587:  nop 
	IL_0588:  conv.u 
	IL_0589:  ldelem [mscorlib]System.String
	IL_058e:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0593:  stloc 11

	IL_0597:  nop 
	IL_0598:  nop 
	IL_0599:  ldloc 11

	IL_059d:  nop 
	IL_059e:  nop 
	IL_059f:  ldnull 
	IL_05a0:  beq IL_05e9

	IL_05a5:  br IL_05aa

	IL_05aa:  ldloc 11

	IL_05ae:  nop 
	IL_05af:  nop 
	IL_05b0:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_05b5:  stloc 8

	IL_05b9:  nop 
	IL_05ba:  nop 
	IL_05bb:  ldloc 8

	IL_05bf:  nop 
	IL_05c0:  nop 
	IL_05c1:  ldc.i4 0
	IL_05c6:  beq IL_05d0

	IL_05cb:  br IL_05df

	IL_05d0:  ldc.i4 0
	IL_05d5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_05da:  br IL_05e4

	IL_05df:  br IL_05e4

	IL_05e4:  br IL_05ee

	IL_05e9:  br IL_05ee

	IL_05ee:  br IL_05f3

	IL_05f3:  br IL_05fd

	IL_05f8:  br IL_05fd

	IL_05fd:  ldarg.0 
	IL_05fe:  ldarg 2

	IL_0602:  nop 
	IL_0603:  nop 
	IL_0604:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_0609:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_060e:  stloc 15

	IL_0612:  nop 
	IL_0613:  nop 
	IL_0614:  ldloc 7

	IL_0618:  nop 
	IL_0619:  nop 
	IL_061a:  ldc.i4 0
	IL_061f:  beq IL_0629

	IL_0624:  br IL_0754

	IL_0629:  ldloc 6

	IL_062d:  nop 
	IL_062e:  nop 
	IL_062f:  ldc.i4 0
	IL_0634:  beq IL_063e

	IL_0639:  br IL_06f0

	IL_063e:  ldloc 4

	IL_0642:  nop 
	IL_0643:  nop 
	IL_0644:  ldloc 0

	IL_0648:  nop 
	IL_0649:  nop 
	IL_064a:  conv.u 
	IL_064b:  ldelem [mscorlib]System.String
	IL_0650:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_0655:  stloc 5

	IL_0659:  nop 
	IL_065a:  nop 
	IL_065b:  ldloc 5

	IL_065f:  nop 
	IL_0660:  nop 
	IL_0661:  ldnull 
	IL_0662:  beq IL_068c

	IL_0667:  br IL_066c

	IL_066c:  ldloc 5

	IL_0670:  nop 
	IL_0671:  nop 
	IL_0672:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_0677:  ldloc 5

	IL_067b:  nop 
	IL_067c:  nop 
	IL_067d:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_0682:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocSt(int32, bool)
	IL_0687:  br IL_06eb

	IL_068c:  ldloc 4

	IL_0690:  nop 
	IL_0691:  nop 
	IL_0692:  ldloc 0

	IL_0696:  nop 
	IL_0697:  nop 
	IL_0698:  conv.u 
	IL_0699:  ldelem [mscorlib]System.String
	IL_069e:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_06a3:  stloc 11

	IL_06a7:  nop 
	IL_06a8:  nop 
	IL_06a9:  ldloc 11

	IL_06ad:  nop 
	IL_06ae:  nop 
	IL_06af:  ldnull 
	IL_06b0:  beq IL_06e1

	IL_06b5:  br IL_06ba

	IL_06ba:  ldloc 11

	IL_06be:  nop 
	IL_06bf:  nop 
	IL_06c0:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_06c5:  stloc 8

	IL_06c9:  nop 
	IL_06ca:  nop 
	IL_06cb:  ldloc 11

	IL_06cf:  nop 
	IL_06d0:  nop 
	IL_06d1:  ldloc 8

	IL_06d5:  nop 
	IL_06d6:  nop 
	IL_06d7:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_06dc:  br IL_06e6

	IL_06e1:  br IL_06e6

	IL_06e6:  br IL_06eb

	IL_06eb:  br IL_074f

	IL_06f0:  ldloc 4

	IL_06f4:  nop 
	IL_06f5:  nop 
	IL_06f6:  ldloc 0

	IL_06fa:  nop 
	IL_06fb:  nop 
	IL_06fc:  conv.u 
	IL_06fd:  ldelem [mscorlib]System.String
	IL_0702:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0707:  stloc 11

	IL_070b:  nop 
	IL_070c:  nop 
	IL_070d:  ldloc 11

	IL_0711:  nop 
	IL_0712:  nop 
	IL_0713:  ldnull 
	IL_0714:  beq IL_0745

	IL_0719:  br IL_071e

	IL_071e:  ldloc 11

	IL_0722:  nop 
	IL_0723:  nop 
	IL_0724:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_0729:  stloc 8

	IL_072d:  nop 
	IL_072e:  nop 
	IL_072f:  ldloc 11

	IL_0733:  nop 
	IL_0734:  nop 
	IL_0735:  ldloc 8

	IL_0739:  nop 
	IL_073a:  nop 
	IL_073b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0740:  br IL_074a

	IL_0745:  br IL_074a

	IL_074a:  br IL_074f

	IL_074f:  br IL_07f0

	IL_0754:  ldloc 10

	IL_0758:  nop 
	IL_0759:  nop 
	IL_075a:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_075f:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0764:  stloc 16

	IL_0768:  nop 
	IL_0769:  nop 
	IL_076a:  ldloc 16

	IL_076e:  nop 
	IL_076f:  nop 
	IL_0770:  ldc.i4 0
	IL_0775:  beq IL_077f

	IL_077a:  br IL_07b8

	IL_077f:  ldloc 10

	IL_0783:  nop 
	IL_0784:  nop 
	IL_0785:  ldloc 4

	IL_0789:  nop 
	IL_078a:  nop 
	IL_078b:  ldloc 0

	IL_078f:  nop 
	IL_0790:  nop 
	IL_0791:  conv.u 
	IL_0792:  ldelem [mscorlib]System.String
	IL_0797:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_079c:  stloc 11

	IL_07a0:  nop 
	IL_07a1:  nop 
	IL_07a2:  ldloc 11

	IL_07a6:  nop 
	IL_07a7:  nop 
	IL_07a8:  ldloc 8

	IL_07ac:  nop 
	IL_07ad:  nop 
	IL_07ae:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_07b3:  br IL_07eb

	IL_07b8:  ldloc 4

	IL_07bc:  nop 
	IL_07bd:  nop 
	IL_07be:  ldloc 0

	IL_07c2:  nop 
	IL_07c3:  nop 
	IL_07c4:  conv.u 
	IL_07c5:  ldelem [mscorlib]System.String
	IL_07ca:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_07cf:  stloc 11

	IL_07d3:  nop 
	IL_07d4:  nop 
	IL_07d5:  ldloc 11

	IL_07d9:  nop 
	IL_07da:  nop 
	IL_07db:  ldloc 8

	IL_07df:  nop 
	IL_07e0:  nop 
	IL_07e1:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldSt(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_07e6:  br IL_07eb

	IL_07eb:  br IL_07f0

	IL_07f0:  ret 
    } // end of method Evaluator::StoreEmit

  } // end of class dylan.NET.Tokenizer.CodeGen.Evaluator
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi StmtReader
  	extends [mscorlib]System.Object
  {

    // method line 89
    .method public 
           instance default void Read (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, string fpath)  cil managed 
    {
        // Method begins at RVA 0xb84c
	// Code size 7903 (0x1edf)
	.maxstack 268
	.locals init (
		class [mscorlib]System.Type	V_0,
		bool	V_1,
		string	V_2,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt	V_3,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_4,
		bool	V_5,
		char[]	V_6,
		class [mscorlib]System.Reflection.Assembly	V_7,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt	V_8,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_9,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt	V_10,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_11,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt	V_12,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_13,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_14,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt	V_15,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[]	V_16,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral	V_17,
		int32[]	V_18,
		class [mscorlib]System.Version	V_19,
		class [mscorlib]System.Reflection.AssemblyName	V_20,
		class [mscorlib]System.AppDomain	V_21,
		valuetype [mscorlib]System.Reflection.Emit.AssemblyBuilderAccess	V_22,
		string	V_23,
		string	V_24,
		class [mscorlib]System.Reflection.Emit.AssemblyBuilder	V_25,
		class [mscorlib]System.Reflection.Emit.ModuleBuilder	V_26,
		class [mscorlib]System.Type	V_27,
		valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes	V_28,
		object	V_29,
		class [mscorlib]System.Type	V_30,
		class [mscorlib]System.Type[]	V_31,
		class [mscorlib]System.Reflection.ConstructorInfo	V_32,
		object[]	V_33,
		class [mscorlib]System.Reflection.Emit.CustomAttributeBuilder	V_34,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt	V_35,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt	V_36,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_37,
		valuetype [mscorlib]System.Reflection.TypeAttributes	V_38,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_39,
		string	V_40,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_41,
		class [mscorlib]System.Type	V_42,
		class [mscorlib]System.Type	V_43,
		int32	V_44,
		class [mscorlib]System.Reflection.Emit.ModuleBuilder	V_45,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_48,
		valuetype [mscorlib]System.Reflection.TypeAttributes	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_50,
		string	V_51,
		class [mscorlib]System.Type	V_52,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_53,
		valuetype [mscorlib]System.Reflection.MethodAttributes	V_54,
		string	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_56,
		class [mscorlib]System.Type	V_57,
		class [mscorlib]System.Type[]	V_58,
		valuetype [mscorlib]System.Reflection.CallingConventions	V_59,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_60,
		int32	V_61,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt	V_62,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_63,
		valuetype [mscorlib]System.Reflection.FieldAttributes	V_64,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_65,
		string	V_66,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_67,
		class [mscorlib]System.Type	V_68,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_69,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt	V_70,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_71,
		valuetype [mscorlib]System.Reflection.MethodAttributes	V_72,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_73,
		string	V_74,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_75,
		int32	V_76,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_77,
		class [mscorlib]System.Type	V_78,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_79,
		bool	V_80,
		valuetype [mscorlib]System.Reflection.CallingConventions	V_81,
		int32	V_82,
		int32	V_83,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_84,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_85,
		class [mscorlib]System.Type	V_86,
		class dylan.NET.Tokenizer.CodeGen.Evaluator	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt	V_88,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt	V_89,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_92,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_93,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt	V_94,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_95,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_96,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_97,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_98,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_99,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt	V_100,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_101,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt	V_102,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_103,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_104,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt	V_105,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt	V_106,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt	V_107)
	IL_0000:  ldc.i4 0
	IL_0005:  stloc 1

	IL_0009:  nop 
	IL_000a:  nop 
	IL_000b:  ldc.i4 0
	IL_0010:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0015:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_001a:  ldc.i4 1
	IL_001f:  beq IL_0029

	IL_0024:  br IL_005c

	IL_0029:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_002e:  ldc.i4 1
	IL_0033:  beq IL_003d

	IL_0038:  br IL_0052

	IL_003d:  ldarg 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt::Line
	IL_0048:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkDbgPt(int32)
	IL_004d:  br IL_0057

	IL_0052:  br IL_0057

	IL_0057:  br IL_0061

	IL_005c:  br IL_0061

	IL_0061:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt
	IL_0066:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_006b:  stloc 0

	IL_006f:  nop 
	IL_0070:  nop 
	IL_0071:  ldloc 0

	IL_0075:  nop 
	IL_0076:  nop 
	IL_0077:  ldarg 1

	IL_007b:  nop 
	IL_007c:  nop 
	IL_007d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0082:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0087:  stloc 1

	IL_008b:  nop 
	IL_008c:  nop 
	IL_008d:  ldloc 1

	IL_0091:  nop 
	IL_0092:  nop 
	IL_0093:  ldc.i4 1
	IL_0098:  beq IL_00a2

	IL_009d:  br IL_01d9

	IL_00a2:  ldarg 1

	IL_00a6:  nop 
	IL_00a7:  nop 
	IL_00a8:  stloc 3

	IL_00ac:  nop 
	IL_00ad:  nop 
	IL_00ae:  ldloc 3

	IL_00b2:  nop 
	IL_00b3:  nop 
	IL_00b4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.RefasmStmt::AsmPath
	IL_00b9:  stloc 4

	IL_00bd:  nop 
	IL_00be:  nop 
	IL_00bf:  ldstr "^"
	IL_00c4:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_00c9:  ldstr "(.)*"
	IL_00ce:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_00d3:  call string string::Concat(string, string, string, string)
	IL_00d8:  stloc 2

	IL_00dc:  nop 
	IL_00dd:  nop 
	IL_00de:  ldloc 2

	IL_00e2:  nop 
	IL_00e3:  nop 
	IL_00e4:  ldstr "$"
	IL_00e9:  call string string::Concat(string, string)
	IL_00ee:  stloc 2

	IL_00f2:  nop 
	IL_00f3:  nop 
	IL_00f4:  ldloc 4

	IL_00f8:  nop 
	IL_00f9:  nop 
	IL_00fa:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_00ff:  ldloc 2

	IL_0103:  nop 
	IL_0104:  nop 
	IL_0105:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_010a:  stloc 5

	IL_010e:  nop 
	IL_010f:  nop 
	IL_0110:  ldloc 5

	IL_0114:  nop 
	IL_0115:  nop 
	IL_0116:  ldc.i4 1
	IL_011b:  beq IL_0125

	IL_0120:  br IL_018f

	IL_0125:  ldloc 4

	IL_0129:  nop 
	IL_012a:  nop 
	IL_012b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0130:  stloc 2

	IL_0134:  nop 
	IL_0135:  nop 
	IL_0136:  ldc.i4 1
	IL_013b:  conv.u 
	IL_013c:  newarr [mscorlib]System.Char
	IL_0141:  stloc 6

	IL_0145:  nop 
	IL_0146:  nop 
	IL_0147:  ldloc 6

	IL_014b:  nop 
	IL_014c:  nop 
	IL_014d:  ldc.i4 0
	IL_0152:  conv.u 
	IL_0153:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0158:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_015d:  stelem [mscorlib]System.Char
	IL_0162:  ldloc 2

	IL_0166:  nop 
	IL_0167:  nop 
	IL_0168:  ldloc 6

	IL_016c:  nop 
	IL_016d:  nop 
	IL_016e:  callvirt instance string string::Trim(char[])
	IL_0173:  stloc 2

	IL_0177:  nop 
	IL_0178:  nop 
	IL_0179:  ldloc 4

	IL_017d:  nop 
	IL_017e:  nop 
	IL_017f:  ldloc 2

	IL_0183:  nop 
	IL_0184:  nop 
	IL_0185:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_018a:  br IL_0194

	IL_018f:  br IL_0194

	IL_0194:  ldloc 4

	IL_0198:  nop 
	IL_0199:  nop 
	IL_019a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_019f:  call class [mscorlib]System.Reflection.Assembly class [mscorlib]System.Reflection.Assembly::LoadFrom(string)
	IL_01a4:  stloc 7

	IL_01a8:  nop 
	IL_01a9:  nop 
	IL_01aa:  ldstr "Referencing Assembly: "
	IL_01af:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_01b4:  ldloc 4

	IL_01b8:  nop 
	IL_01b9:  nop 
	IL_01ba:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_01bf:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_01c4:  ldloc 7

	IL_01c8:  nop 
	IL_01c9:  nop 
	IL_01ca:  call void class [dnr]dylan.NET.Reflection.Importer::AddAsm(class [mscorlib]System.Reflection.Assembly)
	IL_01cf:  br IL_1ede

	IL_01d4:  br IL_01de

	IL_01d9:  br IL_01de

	IL_01de:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt
	IL_01e3:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01e8:  stloc 0

	IL_01ec:  nop 
	IL_01ed:  nop 
	IL_01ee:  ldloc 0

	IL_01f2:  nop 
	IL_01f3:  nop 
	IL_01f4:  ldarg 1

	IL_01f8:  nop 
	IL_01f9:  nop 
	IL_01fa:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_01ff:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0204:  stloc 1

	IL_0208:  nop 
	IL_0209:  nop 
	IL_020a:  ldloc 1

	IL_020e:  nop 
	IL_020f:  nop 
	IL_0210:  ldc.i4 1
	IL_0215:  beq IL_021f

	IL_021a:  br IL_0345

	IL_021f:  ldarg 1

	IL_0223:  nop 
	IL_0224:  nop 
	IL_0225:  stloc 8

	IL_0229:  nop 
	IL_022a:  nop 
	IL_022b:  ldloc 8

	IL_022f:  nop 
	IL_0230:  nop 
	IL_0231:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ImportStmt::NS
	IL_0236:  stloc 9

	IL_023a:  nop 
	IL_023b:  nop 
	IL_023c:  ldstr "^"
	IL_0241:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0246:  ldstr "(.)*"
	IL_024b:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0250:  call string string::Concat(string, string, string, string)
	IL_0255:  stloc 2

	IL_0259:  nop 
	IL_025a:  nop 
	IL_025b:  ldloc 2

	IL_025f:  nop 
	IL_0260:  nop 
	IL_0261:  ldstr "$"
	IL_0266:  call string string::Concat(string, string)
	IL_026b:  stloc 2

	IL_026f:  nop 
	IL_0270:  nop 
	IL_0271:  ldloc 9

	IL_0275:  nop 
	IL_0276:  nop 
	IL_0277:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_027c:  ldloc 2

	IL_0280:  nop 
	IL_0281:  nop 
	IL_0282:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_0287:  stloc 5

	IL_028b:  nop 
	IL_028c:  nop 
	IL_028d:  ldloc 5

	IL_0291:  nop 
	IL_0292:  nop 
	IL_0293:  ldc.i4 1
	IL_0298:  beq IL_02a2

	IL_029d:  br IL_030c

	IL_02a2:  ldloc 9

	IL_02a6:  nop 
	IL_02a7:  nop 
	IL_02a8:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_02ad:  stloc 2

	IL_02b1:  nop 
	IL_02b2:  nop 
	IL_02b3:  ldc.i4 1
	IL_02b8:  conv.u 
	IL_02b9:  newarr [mscorlib]System.Char
	IL_02be:  stloc 6

	IL_02c2:  nop 
	IL_02c3:  nop 
	IL_02c4:  ldloc 6

	IL_02c8:  nop 
	IL_02c9:  nop 
	IL_02ca:  ldc.i4 0
	IL_02cf:  conv.u 
	IL_02d0:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_02d5:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_02da:  stelem [mscorlib]System.Char
	IL_02df:  ldloc 2

	IL_02e3:  nop 
	IL_02e4:  nop 
	IL_02e5:  ldloc 6

	IL_02e9:  nop 
	IL_02ea:  nop 
	IL_02eb:  callvirt instance string string::Trim(char[])
	IL_02f0:  stloc 2

	IL_02f4:  nop 
	IL_02f5:  nop 
	IL_02f6:  ldloc 9

	IL_02fa:  nop 
	IL_02fb:  nop 
	IL_02fc:  ldloc 2

	IL_0300:  nop 
	IL_0301:  nop 
	IL_0302:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0307:  br IL_0311

	IL_030c:  br IL_0311

	IL_0311:  ldstr "Importing Namespace: "
	IL_0316:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_031b:  ldloc 9

	IL_031f:  nop 
	IL_0320:  nop 
	IL_0321:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0326:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_032b:  ldloc 9

	IL_032f:  nop 
	IL_0330:  nop 
	IL_0331:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0336:  call void class [dnr]dylan.NET.Reflection.Importer::AddImp(string)
	IL_033b:  br IL_1ede

	IL_0340:  br IL_034a

	IL_0345:  br IL_034a

	IL_034a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt
	IL_034f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0354:  stloc 0

	IL_0358:  nop 
	IL_0359:  nop 
	IL_035a:  ldloc 0

	IL_035e:  nop 
	IL_035f:  nop 
	IL_0360:  ldarg 1

	IL_0364:  nop 
	IL_0365:  nop 
	IL_0366:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_036b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0370:  stloc 1

	IL_0374:  nop 
	IL_0375:  nop 
	IL_0376:  ldloc 1

	IL_037a:  nop 
	IL_037b:  nop 
	IL_037c:  ldc.i4 1
	IL_0381:  beq IL_038b

	IL_0386:  br IL_04b1

	IL_038b:  ldarg 1

	IL_038f:  nop 
	IL_0390:  nop 
	IL_0391:  stloc 10

	IL_0395:  nop 
	IL_0396:  nop 
	IL_0397:  ldloc 10

	IL_039b:  nop 
	IL_039c:  nop 
	IL_039d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LocimportStmt::NS
	IL_03a2:  stloc 11

	IL_03a6:  nop 
	IL_03a7:  nop 
	IL_03a8:  ldstr "^"
	IL_03ad:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_03b2:  ldstr "(.)*"
	IL_03b7:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_03bc:  call string string::Concat(string, string, string, string)
	IL_03c1:  stloc 2

	IL_03c5:  nop 
	IL_03c6:  nop 
	IL_03c7:  ldloc 2

	IL_03cb:  nop 
	IL_03cc:  nop 
	IL_03cd:  ldstr "$"
	IL_03d2:  call string string::Concat(string, string)
	IL_03d7:  stloc 2

	IL_03db:  nop 
	IL_03dc:  nop 
	IL_03dd:  ldloc 11

	IL_03e1:  nop 
	IL_03e2:  nop 
	IL_03e3:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_03e8:  ldloc 2

	IL_03ec:  nop 
	IL_03ed:  nop 
	IL_03ee:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_03f3:  stloc 5

	IL_03f7:  nop 
	IL_03f8:  nop 
	IL_03f9:  ldloc 5

	IL_03fd:  nop 
	IL_03fe:  nop 
	IL_03ff:  ldc.i4 1
	IL_0404:  beq IL_040e

	IL_0409:  br IL_0478

	IL_040e:  ldloc 11

	IL_0412:  nop 
	IL_0413:  nop 
	IL_0414:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0419:  stloc 2

	IL_041d:  nop 
	IL_041e:  nop 
	IL_041f:  ldc.i4 1
	IL_0424:  conv.u 
	IL_0425:  newarr [mscorlib]System.Char
	IL_042a:  stloc 6

	IL_042e:  nop 
	IL_042f:  nop 
	IL_0430:  ldloc 6

	IL_0434:  nop 
	IL_0435:  nop 
	IL_0436:  ldc.i4 0
	IL_043b:  conv.u 
	IL_043c:  ldsfld string [dnu]dylan.NET.Utils.Constants::quot
	IL_0441:  call char class [mscorlib]System.Convert::ToChar(string)
	IL_0446:  stelem [mscorlib]System.Char
	IL_044b:  ldloc 2

	IL_044f:  nop 
	IL_0450:  nop 
	IL_0451:  ldloc 6

	IL_0455:  nop 
	IL_0456:  nop 
	IL_0457:  callvirt instance string string::Trim(char[])
	IL_045c:  stloc 2

	IL_0460:  nop 
	IL_0461:  nop 
	IL_0462:  ldloc 11

	IL_0466:  nop 
	IL_0467:  nop 
	IL_0468:  ldloc 2

	IL_046c:  nop 
	IL_046d:  nop 
	IL_046e:  stfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0473:  br IL_047d

	IL_0478:  br IL_047d

	IL_047d:  ldstr "Importing Namespace: "
	IL_0482:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0487:  ldloc 11

	IL_048b:  nop 
	IL_048c:  nop 
	IL_048d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0492:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0497:  ldloc 11

	IL_049b:  nop 
	IL_049c:  nop 
	IL_049d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_04a2:  call void class [dnr]dylan.NET.Reflection.Importer::AddLocImp(string)
	IL_04a7:  br IL_1ede

	IL_04ac:  br IL_04b6

	IL_04b1:  br IL_04b6

	IL_04b6:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt
	IL_04bb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04c0:  stloc 0

	IL_04c4:  nop 
	IL_04c5:  nop 
	IL_04c6:  ldloc 0

	IL_04ca:  nop 
	IL_04cb:  nop 
	IL_04cc:  ldarg 1

	IL_04d0:  nop 
	IL_04d1:  nop 
	IL_04d2:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_04d7:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_04dc:  stloc 1

	IL_04e0:  nop 
	IL_04e1:  nop 
	IL_04e2:  ldloc 1

	IL_04e6:  nop 
	IL_04e7:  nop 
	IL_04e8:  ldc.i4 1
	IL_04ed:  beq IL_04f7

	IL_04f2:  br IL_058e

	IL_04f7:  ldarg 1

	IL_04fb:  nop 
	IL_04fc:  nop 
	IL_04fd:  stloc 12

	IL_0501:  nop 
	IL_0502:  nop 
	IL_0503:  ldloc 12

	IL_0507:  nop 
	IL_0508:  nop 
	IL_0509:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::AsmName
	IL_050e:  stloc 13

	IL_0512:  nop 
	IL_0513:  nop 
	IL_0514:  ldloc 13

	IL_0518:  nop 
	IL_0519:  nop 
	IL_051a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_051f:  newobj instance void class [mscorlib]System.Reflection.AssemblyName::'.ctor'(string)
	IL_0524:  stsfld class [mscorlib]System.Reflection.AssemblyName [dnr]dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_0529:  ldloc 12

	IL_052d:  nop 
	IL_052e:  nop 
	IL_052f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssemblyStmt::Mode
	IL_0534:  stloc 14

	IL_0538:  nop 
	IL_0539:  nop 
	IL_053a:  ldloc 14

	IL_053e:  nop 
	IL_053f:  nop 
	IL_0540:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0545:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmMode
	IL_054a:  ldloc 13

	IL_054e:  nop 
	IL_054f:  nop 
	IL_0550:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0555:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::DfltNS
	IL_055a:  ldloc 13

	IL_055e:  nop 
	IL_055f:  nop 
	IL_0560:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0565:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_056a:  ldstr "Beginning Assembly: "
	IL_056f:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0574:  ldloc 13

	IL_0578:  nop 
	IL_0579:  nop 
	IL_057a:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_057f:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0584:  br IL_1ede

	IL_0589:  br IL_0593

	IL_058e:  br IL_0593

	IL_0593:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt
	IL_0598:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_059d:  stloc 0

	IL_05a1:  nop 
	IL_05a2:  nop 
	IL_05a3:  ldloc 0

	IL_05a7:  nop 
	IL_05a8:  nop 
	IL_05a9:  ldarg 1

	IL_05ad:  nop 
	IL_05ae:  nop 
	IL_05af:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_05b4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05b9:  stloc 1

	IL_05bd:  nop 
	IL_05be:  nop 
	IL_05bf:  ldloc 1

	IL_05c3:  nop 
	IL_05c4:  nop 
	IL_05c5:  ldc.i4 1
	IL_05ca:  beq IL_05d4

	IL_05cf:  br IL_094c

	IL_05d4:  ldarg 1

	IL_05d8:  nop 
	IL_05d9:  nop 
	IL_05da:  stloc 15

	IL_05de:  nop 
	IL_05df:  nop 
	IL_05e0:  ldloc 15

	IL_05e4:  nop 
	IL_05e5:  nop 
	IL_05e6:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VerStmt::VersionNos
	IL_05eb:  stloc 16

	IL_05ef:  nop 
	IL_05f0:  nop 
	IL_05f1:  ldc.i4 4
	IL_05f6:  conv.u 
	IL_05f7:  newarr [mscorlib]System.Int32
	IL_05fc:  stloc 18

	IL_0600:  nop 
	IL_0601:  nop 
	IL_0602:  ldloc 16

	IL_0606:  nop 
	IL_0607:  nop 
	IL_0608:  ldc.i4 0
	IL_060d:  conv.u 
	IL_060e:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_0613:  stloc 17

	IL_0617:  nop 
	IL_0618:  nop 
	IL_0619:  ldloc 18

	IL_061d:  nop 
	IL_061e:  nop 
	IL_061f:  ldc.i4 0
	IL_0624:  conv.u 
	IL_0625:  ldloc 17

	IL_0629:  nop 
	IL_062a:  nop 
	IL_062b:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_0630:  stelem [mscorlib]System.Int32
	IL_0635:  ldloc 16

	IL_0639:  nop 
	IL_063a:  nop 
	IL_063b:  ldc.i4 1
	IL_0640:  conv.u 
	IL_0641:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_0646:  stloc 17

	IL_064a:  nop 
	IL_064b:  nop 
	IL_064c:  ldloc 18

	IL_0650:  nop 
	IL_0651:  nop 
	IL_0652:  ldc.i4 1
	IL_0657:  conv.u 
	IL_0658:  ldloc 17

	IL_065c:  nop 
	IL_065d:  nop 
	IL_065e:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_0663:  stelem [mscorlib]System.Int32
	IL_0668:  ldloc 16

	IL_066c:  nop 
	IL_066d:  nop 
	IL_066e:  ldc.i4 2
	IL_0673:  conv.u 
	IL_0674:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_0679:  stloc 17

	IL_067d:  nop 
	IL_067e:  nop 
	IL_067f:  ldloc 18

	IL_0683:  nop 
	IL_0684:  nop 
	IL_0685:  ldc.i4 2
	IL_068a:  conv.u 
	IL_068b:  ldloc 17

	IL_068f:  nop 
	IL_0690:  nop 
	IL_0691:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_0696:  stelem [mscorlib]System.Int32
	IL_069b:  ldloc 16

	IL_069f:  nop 
	IL_06a0:  nop 
	IL_06a1:  ldc.i4 3
	IL_06a6:  conv.u 
	IL_06a7:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral
	IL_06ac:  stloc 17

	IL_06b0:  nop 
	IL_06b1:  nop 
	IL_06b2:  ldloc 18

	IL_06b6:  nop 
	IL_06b7:  nop 
	IL_06b8:  ldc.i4 3
	IL_06bd:  conv.u 
	IL_06be:  ldloc 17

	IL_06c2:  nop 
	IL_06c3:  nop 
	IL_06c4:  ldfld int32 [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.IntLiteral::NumVal
	IL_06c9:  stelem [mscorlib]System.Int32
	IL_06ce:  ldloc 18

	IL_06d2:  nop 
	IL_06d3:  nop 
	IL_06d4:  ldc.i4 0
	IL_06d9:  conv.u 
	IL_06da:  ldelem [mscorlib]System.Int32
	IL_06df:  ldloc 18

	IL_06e3:  nop 
	IL_06e4:  nop 
	IL_06e5:  ldc.i4 1
	IL_06ea:  conv.u 
	IL_06eb:  ldelem [mscorlib]System.Int32
	IL_06f0:  ldloc 18

	IL_06f4:  nop 
	IL_06f5:  nop 
	IL_06f6:  ldc.i4 2
	IL_06fb:  conv.u 
	IL_06fc:  ldelem [mscorlib]System.Int32
	IL_0701:  ldloc 18

	IL_0705:  nop 
	IL_0706:  nop 
	IL_0707:  ldc.i4 3
	IL_070c:  conv.u 
	IL_070d:  ldelem [mscorlib]System.Int32
	IL_0712:  newobj instance void class [mscorlib]System.Version::'.ctor'(int32, int32, int32, int32)
	IL_0717:  stloc 19

	IL_071b:  nop 
	IL_071c:  nop 
	IL_071d:  ldsfld class [mscorlib]System.Reflection.AssemblyName [dnr]dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_0722:  stloc 20

	IL_0726:  nop 
	IL_0727:  nop 
	IL_0728:  ldloc 20

	IL_072c:  nop 
	IL_072d:  nop 
	IL_072e:  ldloc 19

	IL_0732:  nop 
	IL_0733:  nop 
	IL_0734:  callvirt instance void class [mscorlib]System.Reflection.AssemblyName::set_Version(class [mscorlib]System.Version)
	IL_0739:  ldloc 20

	IL_073d:  nop 
	IL_073e:  nop 
	IL_073f:  stsfld class [mscorlib]System.Reflection.AssemblyName [dnr]dylan.NET.Reflection.AsmFactory::AsmNameStr
	IL_0744:  call class [mscorlib]System.AppDomain class [mscorlib]System.AppDomain::get_CurrentDomain()
	IL_0749:  stloc 21

	IL_074d:  nop 
	IL_074e:  nop 
	IL_074f:  ldc.i4 2
	IL_0754:  stloc 22

	IL_0758:  nop 
	IL_0759:  nop 
	IL_075a:  call string class [mscorlib]System.IO.Directory::GetCurrentDirectory()
	IL_075f:  stloc 23

	IL_0763:  nop 
	IL_0764:  nop 
	IL_0765:  ldloc 21

	IL_0769:  nop 
	IL_076a:  nop 
	IL_076b:  ldloc 20

	IL_076f:  nop 
	IL_0770:  nop 
	IL_0771:  ldloc 22

	IL_0775:  nop 
	IL_0776:  nop 
	IL_0777:  ldloc 23

	IL_077b:  nop 
	IL_077c:  nop 
	IL_077d:  callvirt instance class [mscorlib]System.Reflection.Emit.AssemblyBuilder class [mscorlib]System.AppDomain::DefineDynamicAssembly(class [mscorlib]System.Reflection.AssemblyName, valuetype [mscorlib]System.Reflection.Emit.AssemblyBuilderAccess, string)
	IL_0782:  stsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_0787:  ldloc 20

	IL_078b:  nop 
	IL_078c:  nop 
	IL_078d:  callvirt instance string class [mscorlib]System.Reflection.AssemblyName::get_Name()
	IL_0792:  stloc 24

	IL_0796:  nop 
	IL_0797:  nop 
	IL_0798:  ldloc 24

	IL_079c:  nop 
	IL_079d:  nop 
	IL_079e:  ldstr "."
	IL_07a3:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmMode
	IL_07a8:  call string string::Concat(string, string, string)
	IL_07ad:  stloc 24

	IL_07b1:  nop 
	IL_07b2:  nop 
	IL_07b3:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_07b8:  stloc 25

	IL_07bc:  nop 
	IL_07bd:  nop 
	IL_07be:  ldloc 25

	IL_07c2:  nop 
	IL_07c3:  nop 
	IL_07c4:  ldloc 24

	IL_07c8:  nop 
	IL_07c9:  nop 
	IL_07ca:  ldloc 24

	IL_07ce:  nop 
	IL_07cf:  nop 
	IL_07d0:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_07d5:  callvirt instance class [mscorlib]System.Reflection.Emit.ModuleBuilder class [mscorlib]System.Reflection.Emit.AssemblyBuilder::DefineDynamicModule(string, string, bool)
	IL_07da:  stsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_07df:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_07e4:  ldc.i4 1
	IL_07e9:  beq IL_07f3

	IL_07ee:  br IL_0839

	IL_07f3:  ldsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_07f8:  stloc 26

	IL_07fc:  nop 
	IL_07fd:  nop 
	IL_07fe:  ldarg 2

	IL_0802:  nop 
	IL_0803:  nop 
	IL_0804:  call string class [mscorlib]System.IO.Path::GetFullPath(string)
	IL_0809:  starg 2

	IL_080d:  nop 
	IL_080e:  nop 
	IL_080f:  ldloc 26

	IL_0813:  nop 
	IL_0814:  nop 
	IL_0815:  ldarg 2

	IL_0819:  nop 
	IL_081a:  nop 
	IL_081b:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_0820:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_0825:  ldsfld valuetype [mscorlib]System.Guid [mscorlib]System.Guid::Empty
	IL_082a:  callvirt instance class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter class [mscorlib]System.Reflection.Emit.ModuleBuilder::DefineDocument(string, valuetype [mscorlib]System.Guid, valuetype [mscorlib]System.Guid, valuetype [mscorlib]System.Guid)
	IL_082f:  stsfld class [mscorlib]System.Diagnostics.SymbolStore.ISymbolDocumentWriter [dnr]dylan.NET.Reflection.AsmFactory::DocWriter
	IL_0834:  br IL_083e

	IL_0839:  br IL_083e

	IL_083e:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_0843:  ldc.i4 1
	IL_0848:  beq IL_0852

	IL_084d:  br IL_0928

	IL_0852:  ldtoken [mscorlib]System.Diagnostics.DebuggableAttribute
	IL_0857:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_085c:  stloc 27

	IL_0860:  nop 
	IL_0861:  nop 
	IL_0862:  ldc.i4 1
	IL_0867:  ldc.i4 256
	IL_086c:  or 
	IL_086d:  stloc 28

	IL_0871:  nop 
	IL_0872:  nop 
	IL_0873:  ldloc 28

	IL_0877:  nop 
	IL_0878:  nop 
	IL_0879:  box [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes
	IL_087e:  stloc 29

	IL_0882:  nop 
	IL_0883:  nop 
	IL_0884:  ldtoken [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes
	IL_0889:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_088e:  stloc 30

	IL_0892:  nop 
	IL_0893:  nop 
	IL_0894:  ldc.i4 1
	IL_0899:  conv.u 
	IL_089a:  newarr [mscorlib]System.Type
	IL_089f:  stloc 31

	IL_08a3:  nop 
	IL_08a4:  nop 
	IL_08a5:  ldloc 31

	IL_08a9:  nop 
	IL_08aa:  nop 
	IL_08ab:  ldc.i4 0
	IL_08b0:  conv.u 
	IL_08b1:  ldloc 30

	IL_08b5:  nop 
	IL_08b6:  nop 
	IL_08b7:  stelem [mscorlib]System.Type
	IL_08bc:  ldloc 27

	IL_08c0:  nop 
	IL_08c1:  nop 
	IL_08c2:  ldloc 31

	IL_08c6:  nop 
	IL_08c7:  nop 
	IL_08c8:  callvirt instance class [mscorlib]System.Reflection.ConstructorInfo class [mscorlib]System.Type::GetConstructor(class [mscorlib]System.Type[])
	IL_08cd:  stloc 32

	IL_08d1:  nop 
	IL_08d2:  nop 
	IL_08d3:  ldc.i4 1
	IL_08d8:  conv.u 
	IL_08d9:  newarr [mscorlib]System.Object
	IL_08de:  stloc 33

	IL_08e2:  nop 
	IL_08e3:  nop 
	IL_08e4:  ldloc 33

	IL_08e8:  nop 
	IL_08e9:  nop 
	IL_08ea:  ldc.i4 0
	IL_08ef:  conv.u 
	IL_08f0:  ldloc 29

	IL_08f4:  nop 
	IL_08f5:  nop 
	IL_08f6:  stelem [mscorlib]System.Object
	IL_08fb:  ldloc 32

	IL_08ff:  nop 
	IL_0900:  nop 
	IL_0901:  ldloc 33

	IL_0905:  nop 
	IL_0906:  nop 
	IL_0907:  newobj instance void class [mscorlib]System.Reflection.Emit.CustomAttributeBuilder::'.ctor'(class [mscorlib]System.Reflection.ConstructorInfo, object[])
	IL_090c:  stloc 34

	IL_0910:  nop 
	IL_0911:  nop 
	IL_0912:  ldloc 25

	IL_0916:  nop 
	IL_0917:  nop 
	IL_0918:  ldloc 34

	IL_091c:  nop 
	IL_091d:  nop 
	IL_091e:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::SetCustomAttribute(class [mscorlib]System.Reflection.Emit.CustomAttributeBuilder)
	IL_0923:  br IL_092d

	IL_0928:  br IL_092d

	IL_092d:  ldloc 24

	IL_0931:  nop 
	IL_0932:  nop 
	IL_0933:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmFile
	IL_0938:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_093d:  call void class [dnr]dylan.NET.Reflection.Importer::AddAsm(class [mscorlib]System.Reflection.Assembly)
	IL_0942:  br IL_1ede

	IL_0947:  br IL_0951

	IL_094c:  br IL_0951

	IL_0951:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt
	IL_0956:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_095b:  stloc 0

	IL_095f:  nop 
	IL_0960:  nop 
	IL_0961:  ldloc 0

	IL_0965:  nop 
	IL_0966:  nop 
	IL_0967:  ldarg 1

	IL_096b:  nop 
	IL_096c:  nop 
	IL_096d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0972:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0977:  stloc 1

	IL_097b:  nop 
	IL_097c:  nop 
	IL_097d:  ldloc 1

	IL_0981:  nop 
	IL_0982:  nop 
	IL_0983:  ldc.i4 1
	IL_0988:  beq IL_0992

	IL_098d:  br IL_09b8

	IL_0992:  ldarg 1

	IL_0996:  nop 
	IL_0997:  nop 
	IL_0998:  stloc 35

	IL_099c:  nop 
	IL_099d:  nop 
	IL_099e:  ldloc 35

	IL_09a2:  nop 
	IL_09a3:  nop 
	IL_09a4:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DebugStmt::Flg
	IL_09a9:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::DebugFlg
	IL_09ae:  br IL_1ede

	IL_09b3:  br IL_09bd

	IL_09b8:  br IL_09bd

	IL_09bd:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt
	IL_09c2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_09c7:  stloc 0

	IL_09cb:  nop 
	IL_09cc:  nop 
	IL_09cd:  ldloc 0

	IL_09d1:  nop 
	IL_09d2:  nop 
	IL_09d3:  ldarg 1

	IL_09d7:  nop 
	IL_09d8:  nop 
	IL_09d9:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_09de:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_09e3:  stloc 1

	IL_09e7:  nop 
	IL_09e8:  nop 
	IL_09e9:  ldloc 1

	IL_09ed:  nop 
	IL_09ee:  nop 
	IL_09ef:  ldc.i4 1
	IL_09f4:  beq IL_09fe

	IL_09f9:  br IL_0c3b

	IL_09fe:  ldarg 1

	IL_0a02:  nop 
	IL_0a03:  nop 
	IL_0a04:  stloc 36

	IL_0a08:  nop 
	IL_0a09:  nop 
	IL_0a0a:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0a0f:  ldc.i4 1
	IL_0a14:  beq IL_0a1e

	IL_0a19:  br IL_0a2d

	IL_0a1e:  ldc.i4 1
	IL_0a23:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0a28:  br IL_0a32

	IL_0a2d:  br IL_0a32

	IL_0a32:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0a37:  ldc.i4 0
	IL_0a3c:  beq IL_0a46

	IL_0a41:  br IL_0a55

	IL_0a46:  ldc.i4 1
	IL_0a4b:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0a50:  br IL_0a5a

	IL_0a55:  br IL_0a5a

	IL_0a5a:  ldloc 36

	IL_0a5e:  nop 
	IL_0a5f:  nop 
	IL_0a60:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::Attrs
	IL_0a65:  stloc 37

	IL_0a69:  nop 
	IL_0a6a:  nop 
	IL_0a6b:  ldloc 37

	IL_0a6f:  nop 
	IL_0a70:  nop 
	IL_0a71:  call valuetype [mscorlib]System.Reflection.TypeAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessClassAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_0a76:  stloc 38

	IL_0a7a:  nop 
	IL_0a7b:  nop 
	IL_0a7c:  ldloc 36

	IL_0a80:  nop 
	IL_0a81:  nop 
	IL_0a82:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::ClassName
	IL_0a87:  stloc 39

	IL_0a8b:  nop 
	IL_0a8c:  nop 
	IL_0a8d:  ldloc 39

	IL_0a91:  nop 
	IL_0a92:  nop 
	IL_0a93:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0a98:  stloc 40

	IL_0a9c:  nop 
	IL_0a9d:  nop 
	IL_0a9e:  ldloc 36

	IL_0aa2:  nop 
	IL_0aa3:  nop 
	IL_0aa4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ClassStmt::InhClass
	IL_0aa9:  stloc 41

	IL_0aad:  nop 
	IL_0aae:  nop 
	IL_0aaf:  ldnull 
	IL_0ab0:  stloc 42

	IL_0ab4:  nop 
	IL_0ab5:  nop 
	IL_0ab6:  ldloc 41

	IL_0aba:  nop 
	IL_0abb:  nop 
	IL_0abc:  ldfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok::RefTyp
	IL_0ac1:  stloc 43

	IL_0ac5:  nop 
	IL_0ac6:  nop 
	IL_0ac7:  ldloc 41

	IL_0acb:  nop 
	IL_0acc:  nop 
	IL_0acd:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ad2:  ldstr ""
	IL_0ad7:  call int32 string::Compare(string, string)
	IL_0adc:  stloc 44

	IL_0ae0:  nop 
	IL_0ae1:  nop 
	IL_0ae2:  ldloc 43

	IL_0ae6:  nop 
	IL_0ae7:  nop 
	IL_0ae8:  ldnull 
	IL_0ae9:  beq IL_0af3

	IL_0aee:  br IL_0b38

	IL_0af3:  ldloc 44

	IL_0af7:  nop 
	IL_0af8:  nop 
	IL_0af9:  ldc.i4 0
	IL_0afe:  beq IL_0b08

	IL_0b03:  br IL_0b1d

	IL_0b08:  ldtoken [mscorlib]System.Object
	IL_0b0d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0b12:  stloc 42

	IL_0b16:  nop 
	IL_0b17:  nop 
	IL_0b18:  br IL_0b33

	IL_0b1d:  ldloc 41

	IL_0b21:  nop 
	IL_0b22:  nop 
	IL_0b23:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0b28:  stloc 42

	IL_0b2c:  nop 
	IL_0b2d:  nop 
	IL_0b2e:  br IL_0b33

	IL_0b33:  br IL_0b49

	IL_0b38:  ldloc 43

	IL_0b3c:  nop 
	IL_0b3d:  nop 
	IL_0b3e:  stloc 42

	IL_0b42:  nop 
	IL_0b43:  nop 
	IL_0b44:  br IL_0b49

	IL_0b49:  ldloc 42

	IL_0b4d:  nop 
	IL_0b4e:  nop 
	IL_0b4f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_0b54:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0b59:  ldc.i4 0
	IL_0b5e:  beq IL_0b68

	IL_0b63:  br IL_0bd5

	IL_0b68:  ldsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_0b6d:  stloc 45

	IL_0b71:  nop 
	IL_0b72:  nop 
	IL_0b73:  ldloc 40

	IL_0b77:  nop 
	IL_0b78:  nop 
	IL_0b79:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0b7e:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_0b83:  ldstr "."
	IL_0b88:  ldloc 40

	IL_0b8c:  nop 
	IL_0b8d:  nop 
	IL_0b8e:  call string string::Concat(string, string, string)
	IL_0b93:  stloc 40

	IL_0b97:  nop 
	IL_0b98:  nop 
	IL_0b99:  ldloc 45

	IL_0b9d:  nop 
	IL_0b9e:  nop 
	IL_0b9f:  ldloc 40

	IL_0ba3:  nop 
	IL_0ba4:  nop 
	IL_0ba5:  ldloc 38

	IL_0ba9:  nop 
	IL_0baa:  nop 
	IL_0bab:  ldloc 42

	IL_0baf:  nop 
	IL_0bb0:  nop 
	IL_0bb1:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.ModuleBuilder::DefineType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_0bb6:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0bbb:  ldstr "Adding Class: "
	IL_0bc0:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0bc5:  ldloc 40

	IL_0bc9:  nop 
	IL_0bca:  nop 
	IL_0bcb:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0bd0:  br IL_0c31

	IL_0bd5:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0bda:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_0bdf:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_0be4:  stloc 46

	IL_0be8:  nop 
	IL_0be9:  nop 
	IL_0bea:  ldstr "Adding Nested Class: "
	IL_0bef:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0bf4:  ldloc 40

	IL_0bf8:  nop 
	IL_0bf9:  nop 
	IL_0bfa:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0bff:  ldloc 40

	IL_0c03:  nop 
	IL_0c04:  nop 
	IL_0c05:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0c0a:  ldloc 46

	IL_0c0e:  nop 
	IL_0c0f:  nop 
	IL_0c10:  ldloc 40

	IL_0c14:  nop 
	IL_0c15:  nop 
	IL_0c16:  ldloc 38

	IL_0c1a:  nop 
	IL_0c1b:  nop 
	IL_0c1c:  ldloc 42

	IL_0c20:  nop 
	IL_0c21:  nop 
	IL_0c22:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineNestedType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_0c27:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0c2c:  br IL_0c31

	IL_0c31:  br IL_1ede

	IL_0c36:  br IL_0c40

	IL_0c3b:  br IL_0c40

	IL_0c40:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt
	IL_0c45:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0c4a:  stloc 0

	IL_0c4e:  nop 
	IL_0c4f:  nop 
	IL_0c50:  ldloc 0

	IL_0c54:  nop 
	IL_0c55:  nop 
	IL_0c56:  ldarg 1

	IL_0c5a:  nop 
	IL_0c5b:  nop 
	IL_0c5c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0c61:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0c66:  stloc 1

	IL_0c6a:  nop 
	IL_0c6b:  nop 
	IL_0c6c:  ldloc 1

	IL_0c70:  nop 
	IL_0c71:  nop 
	IL_0c72:  ldc.i4 1
	IL_0c77:  beq IL_0c81

	IL_0c7c:  br IL_1061

	IL_0c81:  ldarg 1

	IL_0c85:  nop 
	IL_0c86:  nop 
	IL_0c87:  stloc 47

	IL_0c8b:  nop 
	IL_0c8c:  nop 
	IL_0c8d:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0c92:  ldc.i4 1
	IL_0c97:  beq IL_0ca1

	IL_0c9c:  br IL_0cb0

	IL_0ca1:  ldc.i4 1
	IL_0ca6:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0cab:  br IL_0cb5

	IL_0cb0:  br IL_0cb5

	IL_0cb5:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0cba:  ldc.i4 0
	IL_0cbf:  beq IL_0cc9

	IL_0cc4:  br IL_0cd8

	IL_0cc9:  ldc.i4 1
	IL_0cce:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0cd3:  br IL_0cdd

	IL_0cd8:  br IL_0cdd

	IL_0cdd:  ldloc 47

	IL_0ce1:  nop 
	IL_0ce2:  nop 
	IL_0ce3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Attrs
	IL_0ce8:  stloc 48

	IL_0cec:  nop 
	IL_0ced:  nop 
	IL_0cee:  ldloc 48

	IL_0cf2:  nop 
	IL_0cf3:  nop 
	IL_0cf4:  call valuetype [mscorlib]System.Reflection.TypeAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessClassAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_0cf9:  stloc 49

	IL_0cfd:  nop 
	IL_0cfe:  nop 
	IL_0cff:  ldloc 49

	IL_0d03:  nop 
	IL_0d04:  nop 
	IL_0d05:  ldc.i4 0
	IL_0d0a:  or 
	IL_0d0b:  ldc.i4 256
	IL_0d10:  or 
	IL_0d11:  ldc.i4 131072
	IL_0d16:  or 
	IL_0d17:  stloc 49

	IL_0d1b:  nop 
	IL_0d1c:  nop 
	IL_0d1d:  ldloc 47

	IL_0d21:  nop 
	IL_0d22:  nop 
	IL_0d23:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::DelegateName
	IL_0d28:  stloc 50

	IL_0d2c:  nop 
	IL_0d2d:  nop 
	IL_0d2e:  ldloc 50

	IL_0d32:  nop 
	IL_0d33:  nop 
	IL_0d34:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0d39:  stloc 51

	IL_0d3d:  nop 
	IL_0d3e:  nop 
	IL_0d3f:  ldtoken [mscorlib]System.MulticastDelegate
	IL_0d44:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d49:  stloc 52

	IL_0d4d:  nop 
	IL_0d4e:  nop 
	IL_0d4f:  ldloc 52

	IL_0d53:  nop 
	IL_0d54:  nop 
	IL_0d55:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_0d5a:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0d5f:  ldc.i4 0
	IL_0d64:  beq IL_0d6e

	IL_0d69:  br IL_0ddb

	IL_0d6e:  ldsfld class [mscorlib]System.Reflection.Emit.ModuleBuilder [dnr]dylan.NET.Reflection.AsmFactory::MdlB
	IL_0d73:  stloc 45

	IL_0d77:  nop 
	IL_0d78:  nop 
	IL_0d79:  ldloc 51

	IL_0d7d:  nop 
	IL_0d7e:  nop 
	IL_0d7f:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0d84:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnNS
	IL_0d89:  ldstr "."
	IL_0d8e:  ldloc 51

	IL_0d92:  nop 
	IL_0d93:  nop 
	IL_0d94:  call string string::Concat(string, string, string)
	IL_0d99:  stloc 51

	IL_0d9d:  nop 
	IL_0d9e:  nop 
	IL_0d9f:  ldloc 45

	IL_0da3:  nop 
	IL_0da4:  nop 
	IL_0da5:  ldloc 51

	IL_0da9:  nop 
	IL_0daa:  nop 
	IL_0dab:  ldloc 49

	IL_0daf:  nop 
	IL_0db0:  nop 
	IL_0db1:  ldloc 52

	IL_0db5:  nop 
	IL_0db6:  nop 
	IL_0db7:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.ModuleBuilder::DefineType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_0dbc:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0dc1:  ldstr "Adding Delegate: "
	IL_0dc6:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0dcb:  ldloc 51

	IL_0dcf:  nop 
	IL_0dd0:  nop 
	IL_0dd1:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0dd6:  br IL_0e37

	IL_0ddb:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0de0:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_0de5:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_0dea:  stloc 46

	IL_0dee:  nop 
	IL_0def:  nop 
	IL_0df0:  ldstr "Adding Nested Delegate: "
	IL_0df5:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0dfa:  ldloc 51

	IL_0dfe:  nop 
	IL_0dff:  nop 
	IL_0e00:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0e05:  ldloc 51

	IL_0e09:  nop 
	IL_0e0a:  nop 
	IL_0e0b:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0e10:  ldloc 46

	IL_0e14:  nop 
	IL_0e15:  nop 
	IL_0e16:  ldloc 51

	IL_0e1a:  nop 
	IL_0e1b:  nop 
	IL_0e1c:  ldloc 49

	IL_0e20:  nop 
	IL_0e21:  nop 
	IL_0e22:  ldloc 52

	IL_0e26:  nop 
	IL_0e27:  nop 
	IL_0e28:  callvirt instance class [mscorlib]System.Reflection.Emit.TypeBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineNestedType(string, valuetype [mscorlib]System.Reflection.TypeAttributes, class [mscorlib]System.Type)
	IL_0e2d:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0e32:  br IL_0e37

	IL_0e37:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetVar()
	IL_0e3c:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetIf()
	IL_0e41:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetLbl()
	IL_0e46:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0e4b:  stloc 53

	IL_0e4f:  nop 
	IL_0e50:  nop 
	IL_0e51:  ldc.i4 128
	IL_0e56:  ldc.i4 6
	IL_0e5b:  or 
	IL_0e5c:  stloc 54

	IL_0e60:  nop 
	IL_0e61:  nop 
	IL_0e62:  ldstr ""
	IL_0e67:  stloc 55

	IL_0e6b:  nop 
	IL_0e6c:  nop 
	IL_0e6d:  ldloc 47

	IL_0e71:  nop 
	IL_0e72:  nop 
	IL_0e73:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::RetTyp
	IL_0e78:  stloc 56

	IL_0e7c:  nop 
	IL_0e7d:  nop 
	IL_0e7e:  ldtoken [mscorlib]System.Void
	IL_0e83:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0e88:  stloc 57

	IL_0e8c:  nop 
	IL_0e8d:  nop 
	IL_0e8e:  ldc.i4 2
	IL_0e93:  conv.u 
	IL_0e94:  newarr [mscorlib]System.Type
	IL_0e99:  stloc 58

	IL_0e9d:  nop 
	IL_0e9e:  nop 
	IL_0e9f:  ldloc 58

	IL_0ea3:  nop 
	IL_0ea4:  nop 
	IL_0ea5:  ldc.i4 0
	IL_0eaa:  conv.u 
	IL_0eab:  ldtoken [mscorlib]System.Object
	IL_0eb0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0eb5:  stelem [mscorlib]System.Type
	IL_0eba:  ldloc 58

	IL_0ebe:  nop 
	IL_0ebf:  nop 
	IL_0ec0:  ldc.i4 1
	IL_0ec5:  conv.u 
	IL_0ec6:  ldtoken [mscorlib]System.IntPtr
	IL_0ecb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0ed0:  stelem [mscorlib]System.Type
	IL_0ed5:  ldc.i4 1
	IL_0eda:  stloc 59

	IL_0ede:  nop 
	IL_0edf:  nop 
	IL_0ee0:  ldloc 53

	IL_0ee4:  nop 
	IL_0ee5:  nop 
	IL_0ee6:  ldloc 54

	IL_0eea:  nop 
	IL_0eeb:  nop 
	IL_0eec:  ldloc 59

	IL_0ef0:  nop 
	IL_0ef1:  nop 
	IL_0ef2:  ldloc 58

	IL_0ef6:  nop 
	IL_0ef7:  nop 
	IL_0ef8:  callvirt instance class [mscorlib]System.Reflection.Emit.ConstructorBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineConstructor(valuetype [mscorlib]System.Reflection.MethodAttributes, valuetype [mscorlib]System.Reflection.CallingConventions, class [mscorlib]System.Type[])
	IL_0efd:  stsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_0f02:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitDelConstr()
	IL_0f07:  ldloc 56

	IL_0f0b:  nop 
	IL_0f0c:  nop 
	IL_0f0d:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0f12:  stloc 57

	IL_0f16:  nop 
	IL_0f17:  nop 
	IL_0f18:  ldc.i4 0
	IL_0f1d:  conv.u 
	IL_0f1e:  newarr [mscorlib]System.Type
	IL_0f23:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_0f28:  ldloc 47

	IL_0f2c:  nop 
	IL_0f2d:  nop 
	IL_0f2e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.DelegateStmt::Params
	IL_0f33:  stloc 60

	IL_0f37:  nop 
	IL_0f38:  nop 
	IL_0f39:  ldloc 60

	IL_0f3d:  nop 
	IL_0f3e:  nop 
	IL_0f3f:  ldlen 
	IL_0f40:  conv.i4 
	IL_0f41:  stloc 61

	IL_0f45:  nop 
	IL_0f46:  nop 
	IL_0f47:  ldc.i4 128
	IL_0f4c:  ldc.i4 6
	IL_0f51:  or 
	IL_0f52:  ldc.i4 256
	IL_0f57:  or 
	IL_0f58:  ldc.i4 64
	IL_0f5d:  or 
	IL_0f5e:  stloc 54

	IL_0f62:  nop 
	IL_0f63:  nop 
	IL_0f64:  ldloc 61

	IL_0f68:  nop 
	IL_0f69:  nop 
	IL_0f6a:  ldc.i4 0
	IL_0f6f:  beq IL_0f79

	IL_0f74:  br IL_0f89

	IL_0f79:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_0f7e:  stloc 58

	IL_0f82:  nop 
	IL_0f83:  nop 
	IL_0f84:  br IL_0fa4

	IL_0f89:  ldloc 60

	IL_0f8d:  nop 
	IL_0f8e:  nop 
	IL_0f8f:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_0f94:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_0f99:  stloc 58

	IL_0f9d:  nop 
	IL_0f9e:  nop 
	IL_0f9f:  br IL_0fa4

	IL_0fa4:  ldloc 53

	IL_0fa8:  nop 
	IL_0fa9:  nop 
	IL_0faa:  ldstr "Invoke"
	IL_0faf:  ldloc 54

	IL_0fb3:  nop 
	IL_0fb4:  nop 
	IL_0fb5:  ldloc 57

	IL_0fb9:  nop 
	IL_0fba:  nop 
	IL_0fbb:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_0fc0:  callvirt instance class [mscorlib]System.Reflection.Emit.MethodBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineMethod(string, valuetype [mscorlib]System.Reflection.MethodAttributes, class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_0fc5:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_0fca:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitDelMet()
	IL_0fcf:  ldloc 60

	IL_0fd3:  nop 
	IL_0fd4:  nop 
	IL_0fd5:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_0fda:  call void class [dnr]dylan.NET.Reflection.AsmFactory::CreateTyp()
	IL_0fdf:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0fe4:  ldc.i4 0
	IL_0fe9:  beq IL_0ff3

	IL_0fee:  br IL_1011

	IL_0ff3:  ldc.i4 0
	IL_0ff8:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0ffd:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetMet()
	IL_1002:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetCtor()
	IL_1007:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetFld()
	IL_100c:  br IL_1016

	IL_1011:  br IL_1016

	IL_1016:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_101b:  ldc.i4 1
	IL_1020:  beq IL_102a

	IL_1025:  br IL_1052

	IL_102a:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_102f:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1034:  ldc.i4 0
	IL_1039:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_103e:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedMet()
	IL_1043:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedCtor()
	IL_1048:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedFld()
	IL_104d:  br IL_1057

	IL_1052:  br IL_1057

	IL_1057:  br IL_1ede

	IL_105c:  br IL_1066

	IL_1061:  br IL_1066

	IL_1066:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt
	IL_106b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1070:  stloc 0

	IL_1074:  nop 
	IL_1075:  nop 
	IL_1076:  ldloc 0

	IL_107a:  nop 
	IL_107b:  nop 
	IL_107c:  ldarg 1

	IL_1080:  nop 
	IL_1081:  nop 
	IL_1082:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1087:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_108c:  stloc 1

	IL_1090:  nop 
	IL_1091:  nop 
	IL_1092:  ldloc 1

	IL_1096:  nop 
	IL_1097:  nop 
	IL_1098:  ldc.i4 1
	IL_109d:  beq IL_10a7

	IL_10a2:  br IL_11b6

	IL_10a7:  ldarg 1

	IL_10ab:  nop 
	IL_10ac:  nop 
	IL_10ad:  stloc 62

	IL_10b1:  nop 
	IL_10b2:  nop 
	IL_10b3:  ldloc 62

	IL_10b7:  nop 
	IL_10b8:  nop 
	IL_10b9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::Attrs
	IL_10be:  stloc 63

	IL_10c2:  nop 
	IL_10c3:  nop 
	IL_10c4:  ldloc 63

	IL_10c8:  nop 
	IL_10c9:  nop 
	IL_10ca:  call valuetype [mscorlib]System.Reflection.FieldAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessFieldAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_10cf:  stloc 64

	IL_10d3:  nop 
	IL_10d4:  nop 
	IL_10d5:  ldloc 62

	IL_10d9:  nop 
	IL_10da:  nop 
	IL_10db:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldName
	IL_10e0:  stloc 65

	IL_10e4:  nop 
	IL_10e5:  nop 
	IL_10e6:  ldloc 65

	IL_10ea:  nop 
	IL_10eb:  nop 
	IL_10ec:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_10f1:  stloc 66

	IL_10f5:  nop 
	IL_10f6:  nop 
	IL_10f7:  ldloc 62

	IL_10fb:  nop 
	IL_10fc:  nop 
	IL_10fd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldTyp
	IL_1102:  stloc 67

	IL_1106:  nop 
	IL_1107:  nop 
	IL_1108:  ldnull 
	IL_1109:  stloc 68

	IL_110d:  nop 
	IL_110e:  nop 
	IL_110f:  ldloc 67

	IL_1113:  nop 
	IL_1114:  nop 
	IL_1115:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_111a:  stloc 68

	IL_111e:  nop 
	IL_111f:  nop 
	IL_1120:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1125:  stloc 69

	IL_1129:  nop 
	IL_112a:  nop 
	IL_112b:  ldloc 69

	IL_112f:  nop 
	IL_1130:  nop 
	IL_1131:  ldloc 66

	IL_1135:  nop 
	IL_1136:  nop 
	IL_1137:  ldloc 68

	IL_113b:  nop 
	IL_113c:  nop 
	IL_113d:  ldloc 64

	IL_1141:  nop 
	IL_1142:  nop 
	IL_1143:  callvirt instance class [mscorlib]System.Reflection.Emit.FieldBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineField(string, class [mscorlib]System.Type, valuetype [mscorlib]System.Reflection.FieldAttributes)
	IL_1148:  stsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_114d:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1152:  ldc.i4 0
	IL_1157:  beq IL_1161

	IL_115c:  br IL_117c

	IL_1161:  ldloc 66

	IL_1165:  nop 
	IL_1166:  nop 
	IL_1167:  ldloc 68

	IL_116b:  nop 
	IL_116c:  nop 
	IL_116d:  ldsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_1172:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddFld(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_1177:  br IL_1197

	IL_117c:  ldloc 66

	IL_1180:  nop 
	IL_1181:  nop 
	IL_1182:  ldloc 68

	IL_1186:  nop 
	IL_1187:  nop 
	IL_1188:  ldsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_118d:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedFld(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_1192:  br IL_1197

	IL_1197:  ldstr "\tAdding Field: "
	IL_119c:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_11a1:  ldloc 66

	IL_11a5:  nop 
	IL_11a6:  nop 
	IL_11a7:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_11ac:  br IL_1ede

	IL_11b1:  br IL_11bb

	IL_11b6:  br IL_11bb

	IL_11bb:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndClassStmt
	IL_11c0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_11c5:  stloc 0

	IL_11c9:  nop 
	IL_11ca:  nop 
	IL_11cb:  ldloc 0

	IL_11cf:  nop 
	IL_11d0:  nop 
	IL_11d1:  ldarg 1

	IL_11d5:  nop 
	IL_11d6:  nop 
	IL_11d7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_11dc:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_11e1:  stloc 1

	IL_11e5:  nop 
	IL_11e6:  nop 
	IL_11e7:  ldloc 1

	IL_11eb:  nop 
	IL_11ec:  nop 
	IL_11ed:  ldc.i4 1
	IL_11f2:  beq IL_11fc

	IL_11f7:  br IL_1283

	IL_11fc:  call void class [dnr]dylan.NET.Reflection.AsmFactory::CreateTyp()
	IL_1201:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1206:  ldc.i4 0
	IL_120b:  beq IL_1215

	IL_1210:  br IL_1233

	IL_1215:  ldc.i4 0
	IL_121a:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_121f:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetMet()
	IL_1224:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetCtor()
	IL_1229:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetFld()
	IL_122e:  br IL_1238

	IL_1233:  br IL_1238

	IL_1238:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_123d:  ldc.i4 1
	IL_1242:  beq IL_124c

	IL_1247:  br IL_1274

	IL_124c:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_1251:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1256:  ldc.i4 0
	IL_125b:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1260:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedMet()
	IL_1265:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedCtor()
	IL_126a:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedFld()
	IL_126f:  br IL_1279

	IL_1274:  br IL_1279

	IL_1279:  br IL_1ede

	IL_127e:  br IL_1288

	IL_1283:  br IL_1288

	IL_1288:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt
	IL_128d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1292:  stloc 0

	IL_1296:  nop 
	IL_1297:  nop 
	IL_1298:  ldloc 0

	IL_129c:  nop 
	IL_129d:  nop 
	IL_129e:  ldarg 1

	IL_12a2:  nop 
	IL_12a3:  nop 
	IL_12a4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_12a9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_12ae:  stloc 1

	IL_12b2:  nop 
	IL_12b3:  nop 
	IL_12b4:  ldloc 1

	IL_12b8:  nop 
	IL_12b9:  nop 
	IL_12ba:  ldc.i4 1
	IL_12bf:  beq IL_12c9

	IL_12c4:  br IL_15dd

	IL_12c9:  ldarg 1

	IL_12cd:  nop 
	IL_12ce:  nop 
	IL_12cf:  stloc 70

	IL_12d3:  nop 
	IL_12d4:  nop 
	IL_12d5:  ldc.i4 0
	IL_12da:  stsfld bool [dnr]dylan.NET.Reflection.ILEmitter::StaticFlg
	IL_12df:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetVar()
	IL_12e4:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetIf()
	IL_12e9:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetLbl()
	IL_12ee:  ldloc 70

	IL_12f2:  nop 
	IL_12f3:  nop 
	IL_12f4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Attrs
	IL_12f9:  stloc 71

	IL_12fd:  nop 
	IL_12fe:  nop 
	IL_12ff:  ldloc 71

	IL_1303:  nop 
	IL_1304:  nop 
	IL_1305:  call valuetype [mscorlib]System.Reflection.MethodAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessMethodAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_130a:  stloc 72

	IL_130e:  nop 
	IL_130f:  nop 
	IL_1310:  ldloc 70

	IL_1314:  nop 
	IL_1315:  nop 
	IL_1316:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::MethodName
	IL_131b:  stloc 73

	IL_131f:  nop 
	IL_1320:  nop 
	IL_1321:  ldloc 73

	IL_1325:  nop 
	IL_1326:  nop 
	IL_1327:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_132c:  stloc 74

	IL_1330:  nop 
	IL_1331:  nop 
	IL_1332:  ldloc 70

	IL_1336:  nop 
	IL_1337:  nop 
	IL_1338:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Params
	IL_133d:  stloc 75

	IL_1341:  nop 
	IL_1342:  nop 
	IL_1343:  ldloc 75

	IL_1347:  nop 
	IL_1348:  nop 
	IL_1349:  ldlen 
	IL_134a:  conv.i4 
	IL_134b:  stloc 76

	IL_134f:  nop 
	IL_1350:  nop 
	IL_1351:  ldloc 70

	IL_1355:  nop 
	IL_1356:  nop 
	IL_1357:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::RetTyp
	IL_135c:  stloc 77

	IL_1360:  nop 
	IL_1361:  nop 
	IL_1362:  ldnull 
	IL_1363:  stloc 78

	IL_1367:  nop 
	IL_1368:  nop 
	IL_1369:  ldloc 77

	IL_136d:  nop 
	IL_136e:  nop 
	IL_136f:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1374:  stloc 78

	IL_1378:  nop 
	IL_1379:  nop 
	IL_137a:  ldc.i4 0
	IL_137f:  conv.u 
	IL_1380:  newarr [mscorlib]System.Type
	IL_1385:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_138a:  ldloc 76

	IL_138e:  nop 
	IL_138f:  nop 
	IL_1390:  ldc.i4 0
	IL_1395:  beq IL_139f

	IL_139a:  br IL_13a4

	IL_139f:  br IL_13b4

	IL_13a4:  ldloc 75

	IL_13a8:  nop 
	IL_13a9:  nop 
	IL_13aa:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_13af:  br IL_13b4

	IL_13b4:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_13b9:  stloc 79

	IL_13bd:  nop 
	IL_13be:  nop 
	IL_13bf:  ldloc 74

	IL_13c3:  nop 
	IL_13c4:  nop 
	IL_13c5:  ldstr "^ctor\\d*$"
	IL_13ca:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_13cf:  stloc 80

	IL_13d3:  nop 
	IL_13d4:  nop 
	IL_13d5:  ldloc 80

	IL_13d9:  nop 
	IL_13da:  nop 
	IL_13db:  stloc 1

	IL_13df:  nop 
	IL_13e0:  nop 
	IL_13e1:  ldloc 74

	IL_13e5:  nop 
	IL_13e6:  nop 
	IL_13e7:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_13ec:  call int32 string::Compare(string, string)
	IL_13f1:  stloc 44

	IL_13f5:  nop 
	IL_13f6:  nop 
	IL_13f7:  ldloc 44

	IL_13fb:  nop 
	IL_13fc:  nop 
	IL_13fd:  ldc.i4 0
	IL_1402:  beq IL_140c

	IL_1407:  br IL_141c

	IL_140c:  ldc.i4 1
	IL_1411:  stloc 80

	IL_1415:  nop 
	IL_1416:  nop 
	IL_1417:  br IL_1421

	IL_141c:  br IL_1421

	IL_1421:  ldloc 1

	IL_1425:  nop 
	IL_1426:  nop 
	IL_1427:  ldloc 80

	IL_142b:  nop 
	IL_142c:  nop 
	IL_142d:  or 
	IL_142e:  stloc 80

	IL_1432:  nop 
	IL_1433:  nop 
	IL_1434:  ldloc 80

	IL_1438:  nop 
	IL_1439:  nop 
	IL_143a:  ldc.i4 0
	IL_143f:  beq IL_1449

	IL_1444:  br IL_14e3

	IL_1449:  ldloc 79

	IL_144d:  nop 
	IL_144e:  nop 
	IL_144f:  ldloc 74

	IL_1453:  nop 
	IL_1454:  nop 
	IL_1455:  ldloc 72

	IL_1459:  nop 
	IL_145a:  nop 
	IL_145b:  ldloc 78

	IL_145f:  nop 
	IL_1460:  nop 
	IL_1461:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1466:  callvirt instance class [mscorlib]System.Reflection.Emit.MethodBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineMethod(string, valuetype [mscorlib]System.Reflection.MethodAttributes, class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_146b:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_1470:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitMtd()
	IL_1475:  ldstr "\tAdding Method: "
	IL_147a:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_147f:  ldloc 74

	IL_1483:  nop 
	IL_1484:  nop 
	IL_1485:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_148a:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_148f:  ldc.i4 0
	IL_1494:  beq IL_149e

	IL_1499:  br IL_14be

	IL_149e:  ldloc 74

	IL_14a2:  nop 
	IL_14a3:  nop 
	IL_14a4:  ldloc 78

	IL_14a8:  nop 
	IL_14a9:  nop 
	IL_14aa:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_14af:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_14b4:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddMet(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_14b9:  br IL_14de

	IL_14be:  ldloc 74

	IL_14c2:  nop 
	IL_14c3:  nop 
	IL_14c4:  ldloc 78

	IL_14c8:  nop 
	IL_14c9:  nop 
	IL_14ca:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_14cf:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_14d4:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedMet(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_14d9:  br IL_14de

	IL_14de:  br IL_156a

	IL_14e3:  ldc.i4 1
	IL_14e8:  stloc 81

	IL_14ec:  nop 
	IL_14ed:  nop 
	IL_14ee:  ldloc 79

	IL_14f2:  nop 
	IL_14f3:  nop 
	IL_14f4:  ldloc 72

	IL_14f8:  nop 
	IL_14f9:  nop 
	IL_14fa:  ldloc 81

	IL_14fe:  nop 
	IL_14ff:  nop 
	IL_1500:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1505:  callvirt instance class [mscorlib]System.Reflection.Emit.ConstructorBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineConstructor(valuetype [mscorlib]System.Reflection.MethodAttributes, valuetype [mscorlib]System.Reflection.CallingConventions, class [mscorlib]System.Type[])
	IL_150a:  stsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_150f:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitConstr()
	IL_1514:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1519:  ldc.i4 0
	IL_151e:  beq IL_1528

	IL_1523:  br IL_153c

	IL_1528:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_152d:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_1532:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddCtor(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_1537:  br IL_1550

	IL_153c:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1541:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_1546:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedCtor(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_154b:  br IL_1550

	IL_1550:  ldstr "\tAdding Constructor: "
	IL_1555:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_155a:  ldloc 74

	IL_155e:  nop 
	IL_155f:  nop 
	IL_1560:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_1565:  br IL_156a

	IL_156a:  ldc.i4 1
	IL_156f:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_1574:  ldloc 74

	IL_1578:  nop 
	IL_1579:  nop 
	IL_157a:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnMetName
	IL_157f:  ldloc 76

	IL_1583:  nop 
	IL_1584:  nop 
	IL_1585:  ldc.i4 0
	IL_158a:  beq IL_1594

	IL_158f:  br IL_1599

	IL_1594:  br IL_15d3

	IL_1599:  ldloc 80

	IL_159d:  nop 
	IL_159e:  nop 
	IL_159f:  ldc.i4 0
	IL_15a4:  beq IL_15ae

	IL_15a9:  br IL_15be

	IL_15ae:  ldloc 75

	IL_15b2:  nop 
	IL_15b3:  nop 
	IL_15b4:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_15b9:  br IL_15ce

	IL_15be:  ldloc 75

	IL_15c2:  nop 
	IL_15c3:  nop 
	IL_15c4:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParamsConstr(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_15c9:  br IL_15ce

	IL_15ce:  br IL_15d3

	IL_15d3:  br IL_1ede

	IL_15d8:  br IL_15e2

	IL_15dd:  br IL_15e2

	IL_15e2:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt
	IL_15e7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_15ec:  stloc 0

	IL_15f0:  nop 
	IL_15f1:  nop 
	IL_15f2:  ldloc 0

	IL_15f6:  nop 
	IL_15f7:  nop 
	IL_15f8:  ldarg 1

	IL_15fc:  nop 
	IL_15fd:  nop 
	IL_15fe:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1603:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1608:  stloc 1

	IL_160c:  nop 
	IL_160d:  nop 
	IL_160e:  ldloc 1

	IL_1612:  nop 
	IL_1613:  nop 
	IL_1614:  ldc.i4 1
	IL_1619:  beq IL_1623

	IL_161e:  br IL_16bf

	IL_1623:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRet()
	IL_1628:  ldc.i4 0
	IL_162d:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_1632:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_1637:  stloc 25

	IL_163b:  nop 
	IL_163c:  nop 
	IL_163d:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnMetName
	IL_1642:  ldstr "main"
	IL_1647:  call int32 string::Compare(string, string)
	IL_164c:  stloc 82

	IL_1650:  nop 
	IL_1651:  nop 
	IL_1652:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmMode
	IL_1657:  ldstr "exe"
	IL_165c:  call int32 string::Compare(string, string)
	IL_1661:  stloc 83

	IL_1665:  nop 
	IL_1666:  nop 
	IL_1667:  ldloc 82

	IL_166b:  nop 
	IL_166c:  nop 
	IL_166d:  ldc.i4 0
	IL_1672:  beq IL_167c

	IL_1677:  br IL_16b0

	IL_167c:  ldloc 83

	IL_1680:  nop 
	IL_1681:  nop 
	IL_1682:  ldc.i4 0
	IL_1687:  beq IL_1691

	IL_168c:  br IL_16a6

	IL_1691:  ldloc 25

	IL_1695:  nop 
	IL_1696:  nop 
	IL_1697:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.ILEmitter::Met
	IL_169c:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::SetEntryPoint(class [mscorlib]System.Reflection.MethodInfo)
	IL_16a1:  br IL_16ab

	IL_16a6:  br IL_16ab

	IL_16ab:  br IL_16b5

	IL_16b0:  br IL_16b5

	IL_16b5:  br IL_1ede

	IL_16ba:  br IL_16c4

	IL_16bf:  br IL_16c4

	IL_16c4:  ldnull 
	IL_16c5:  stloc 86

	IL_16c9:  nop 
	IL_16ca:  nop 
	IL_16cb:  ldnull 
	IL_16cc:  stloc 87

	IL_16d0:  nop 
	IL_16d1:  nop 
	IL_16d2:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt
	IL_16d7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_16dc:  stloc 0

	IL_16e0:  nop 
	IL_16e1:  nop 
	IL_16e2:  ldloc 0

	IL_16e6:  nop 
	IL_16e7:  nop 
	IL_16e8:  ldarg 1

	IL_16ec:  nop 
	IL_16ed:  nop 
	IL_16ee:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_16f3:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_16f8:  stloc 1

	IL_16fc:  nop 
	IL_16fd:  nop 
	IL_16fe:  ldloc 1

	IL_1702:  nop 
	IL_1703:  nop 
	IL_1704:  ldc.i4 1
	IL_1709:  beq IL_1713

	IL_170e:  br IL_176a

	IL_1713:  ldarg 1

	IL_1717:  nop 
	IL_1718:  nop 
	IL_1719:  stloc 88

	IL_171d:  nop 
	IL_171e:  nop 
	IL_171f:  ldloc 88

	IL_1723:  nop 
	IL_1724:  nop 
	IL_1725:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_172a:  ldnull 
	IL_172b:  beq IL_175b

	IL_1730:  br IL_1735

	IL_1735:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_173a:  stloc 87

	IL_173e:  nop 
	IL_173f:  nop 
	IL_1740:  ldloc 87

	IL_1744:  nop 
	IL_1745:  nop 
	IL_1746:  ldloc 88

	IL_174a:  nop 
	IL_174b:  nop 
	IL_174c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_1751:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1756:  br IL_1760

	IL_175b:  br IL_1760

	IL_1760:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRet()
	IL_1765:  br IL_176f

	IL_176a:  br IL_176f

	IL_176f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt
	IL_1774:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1779:  stloc 0

	IL_177d:  nop 
	IL_177e:  nop 
	IL_177f:  ldloc 0

	IL_1783:  nop 
	IL_1784:  nop 
	IL_1785:  ldarg 1

	IL_1789:  nop 
	IL_178a:  nop 
	IL_178b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1790:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1795:  stloc 1

	IL_1799:  nop 
	IL_179a:  nop 
	IL_179b:  ldloc 1

	IL_179f:  nop 
	IL_17a0:  nop 
	IL_17a1:  ldc.i4 1
	IL_17a6:  beq IL_17b0

	IL_17ab:  br IL_183f

	IL_17b0:  ldarg 1

	IL_17b4:  nop 
	IL_17b5:  nop 
	IL_17b6:  stloc 89

	IL_17ba:  nop 
	IL_17bb:  nop 
	IL_17bc:  ldloc 89

	IL_17c0:  nop 
	IL_17c1:  nop 
	IL_17c2:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarName
	IL_17c7:  stloc 84

	IL_17cb:  nop 
	IL_17cc:  nop 
	IL_17cd:  ldloc 89

	IL_17d1:  nop 
	IL_17d2:  nop 
	IL_17d3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarTyp
	IL_17d8:  stloc 85

	IL_17dc:  nop 
	IL_17dd:  nop 
	IL_17de:  ldloc 85

	IL_17e2:  nop 
	IL_17e3:  nop 
	IL_17e4:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_17e9:  stloc 86

	IL_17ed:  nop 
	IL_17ee:  nop 
	IL_17ef:  ldloc 84

	IL_17f3:  nop 
	IL_17f4:  nop 
	IL_17f5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_17fa:  ldloc 86

	IL_17fe:  nop 
	IL_17ff:  nop 
	IL_1800:  call void class [dnr]dylan.NET.Reflection.ILEmitter::DeclVar(string, class [mscorlib]System.Type)
	IL_1805:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_180a:  ldc.i4 1
	IL_180f:  add 
	IL_1810:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1815:  ldloc 84

	IL_1819:  nop 
	IL_181a:  nop 
	IL_181b:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1820:  ldc.i4 1
	IL_1825:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_182a:  ldloc 86

	IL_182e:  nop 
	IL_182f:  nop 
	IL_1830:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_1835:  br IL_1ede

	IL_183a:  br IL_1844

	IL_183f:  br IL_1844

	IL_1844:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt
	IL_1849:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_184e:  stloc 0

	IL_1852:  nop 
	IL_1853:  nop 
	IL_1854:  ldloc 0

	IL_1858:  nop 
	IL_1859:  nop 
	IL_185a:  ldarg 1

	IL_185e:  nop 
	IL_185f:  nop 
	IL_1860:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1865:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_186a:  stloc 1

	IL_186e:  nop 
	IL_186f:  nop 
	IL_1870:  ldloc 1

	IL_1874:  nop 
	IL_1875:  nop 
	IL_1876:  ldc.i4 1
	IL_187b:  beq IL_1885

	IL_1880:  br IL_193b

	IL_1885:  ldarg 1

	IL_1889:  nop 
	IL_188a:  nop 
	IL_188b:  stloc 90

	IL_188f:  nop 
	IL_1890:  nop 
	IL_1891:  ldloc 90

	IL_1895:  nop 
	IL_1896:  nop 
	IL_1897:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarName
	IL_189c:  stloc 84

	IL_18a0:  nop 
	IL_18a1:  nop 
	IL_18a2:  ldloc 90

	IL_18a6:  nop 
	IL_18a7:  nop 
	IL_18a8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarTyp
	IL_18ad:  stloc 85

	IL_18b1:  nop 
	IL_18b2:  nop 
	IL_18b3:  ldloc 85

	IL_18b7:  nop 
	IL_18b8:  nop 
	IL_18b9:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_18be:  stloc 86

	IL_18c2:  nop 
	IL_18c3:  nop 
	IL_18c4:  ldloc 84

	IL_18c8:  nop 
	IL_18c9:  nop 
	IL_18ca:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_18cf:  ldloc 86

	IL_18d3:  nop 
	IL_18d4:  nop 
	IL_18d5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::DeclVar(string, class [mscorlib]System.Type)
	IL_18da:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_18df:  ldc.i4 1
	IL_18e4:  add 
	IL_18e5:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_18ea:  ldloc 84

	IL_18ee:  nop 
	IL_18ef:  nop 
	IL_18f0:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_18f5:  ldc.i4 1
	IL_18fa:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_18ff:  ldloc 86

	IL_1903:  nop 
	IL_1904:  nop 
	IL_1905:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_190a:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_190f:  stloc 87

	IL_1913:  nop 
	IL_1914:  nop 
	IL_1915:  ldloc 87

	IL_1919:  nop 
	IL_191a:  nop 
	IL_191b:  ldloc 84

	IL_191f:  nop 
	IL_1920:  nop 
	IL_1921:  ldloc 90

	IL_1925:  nop 
	IL_1926:  nop 
	IL_1927:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::RExpr
	IL_192c:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::StoreEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1931:  br IL_1ede

	IL_1936:  br IL_1940

	IL_193b:  br IL_1940

	IL_1940:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt
	IL_1945:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_194a:  stloc 0

	IL_194e:  nop 
	IL_194f:  nop 
	IL_1950:  ldloc 0

	IL_1954:  nop 
	IL_1955:  nop 
	IL_1956:  ldarg 1

	IL_195a:  nop 
	IL_195b:  nop 
	IL_195c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1961:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1966:  stloc 1

	IL_196a:  nop 
	IL_196b:  nop 
	IL_196c:  ldloc 1

	IL_1970:  nop 
	IL_1971:  nop 
	IL_1972:  ldc.i4 1
	IL_1977:  beq IL_1981

	IL_197c:  br IL_19eb

	IL_1981:  ldarg 1

	IL_1985:  nop 
	IL_1986:  nop 
	IL_1987:  stloc 91

	IL_198b:  nop 
	IL_198c:  nop 
	IL_198d:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1992:  stloc 87

	IL_1996:  nop 
	IL_1997:  nop 
	IL_1998:  ldloc 91

	IL_199c:  nop 
	IL_199d:  nop 
	IL_199e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::LExp
	IL_19a3:  stloc 92

	IL_19a7:  nop 
	IL_19a8:  nop 
	IL_19a9:  ldloc 92

	IL_19ad:  nop 
	IL_19ae:  nop 
	IL_19af:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_19b4:  ldc.i4 0
	IL_19b9:  conv.u 
	IL_19ba:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_19bf:  stloc 93

	IL_19c3:  nop 
	IL_19c4:  nop 
	IL_19c5:  ldloc 87

	IL_19c9:  nop 
	IL_19ca:  nop 
	IL_19cb:  ldloc 93

	IL_19cf:  nop 
	IL_19d0:  nop 
	IL_19d1:  ldloc 91

	IL_19d5:  nop 
	IL_19d6:  nop 
	IL_19d7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::RExp
	IL_19dc:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::StoreEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_19e1:  br IL_1ede

	IL_19e6:  br IL_19f0

	IL_19eb:  br IL_19f0

	IL_19f0:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt
	IL_19f5:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_19fa:  stloc 0

	IL_19fe:  nop 
	IL_19ff:  nop 
	IL_1a00:  ldloc 0

	IL_1a04:  nop 
	IL_1a05:  nop 
	IL_1a06:  ldarg 1

	IL_1a0a:  nop 
	IL_1a0b:  nop 
	IL_1a0c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1a11:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1a16:  stloc 1

	IL_1a1a:  nop 
	IL_1a1b:  nop 
	IL_1a1c:  ldloc 1

	IL_1a20:  nop 
	IL_1a21:  nop 
	IL_1a22:  ldc.i4 1
	IL_1a27:  beq IL_1a31

	IL_1a2c:  br IL_1aa0

	IL_1a31:  ldarg 1

	IL_1a35:  nop 
	IL_1a36:  nop 
	IL_1a37:  stloc 94

	IL_1a3b:  nop 
	IL_1a3c:  nop 
	IL_1a3d:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_1a42:  stloc 95

	IL_1a46:  nop 
	IL_1a47:  nop 
	IL_1a48:  ldloc 94

	IL_1a4c:  nop 
	IL_1a4d:  nop 
	IL_1a4e:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::MethodToken
	IL_1a53:  stloc 96

	IL_1a57:  nop 
	IL_1a58:  nop 
	IL_1a59:  ldloc 96

	IL_1a5d:  nop 
	IL_1a5e:  nop 
	IL_1a5f:  ldc.i4 1
	IL_1a64:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_1a69:  ldloc 95

	IL_1a6d:  nop 
	IL_1a6e:  nop 
	IL_1a6f:  ldloc 96

	IL_1a73:  nop 
	IL_1a74:  nop 
	IL_1a75:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_1a7a:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1a7f:  stloc 87

	IL_1a83:  nop 
	IL_1a84:  nop 
	IL_1a85:  ldloc 87

	IL_1a89:  nop 
	IL_1a8a:  nop 
	IL_1a8b:  ldloc 95

	IL_1a8f:  nop 
	IL_1a90:  nop 
	IL_1a91:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1a96:  br IL_1ede

	IL_1a9b:  br IL_1aa5

	IL_1aa0:  br IL_1aa5

	IL_1aa5:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt
	IL_1aaa:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1aaf:  stloc 0

	IL_1ab3:  nop 
	IL_1ab4:  nop 
	IL_1ab5:  ldloc 0

	IL_1ab9:  nop 
	IL_1aba:  nop 
	IL_1abb:  ldarg 1

	IL_1abf:  nop 
	IL_1ac0:  nop 
	IL_1ac1:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1ac6:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1acb:  stloc 1

	IL_1acf:  nop 
	IL_1ad0:  nop 
	IL_1ad1:  ldloc 1

	IL_1ad5:  nop 
	IL_1ad6:  nop 
	IL_1ad7:  ldc.i4 1
	IL_1adc:  beq IL_1ae6

	IL_1ae1:  br IL_1b44

	IL_1ae6:  ldarg 1

	IL_1aea:  nop 
	IL_1aeb:  nop 
	IL_1aec:  stloc 100

	IL_1af0:  nop 
	IL_1af1:  nop 
	IL_1af2:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddIf()
	IL_1af7:  ldloc 100

	IL_1afb:  nop 
	IL_1afc:  nop 
	IL_1afd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt::Exp
	IL_1b02:  stloc 101

	IL_1b06:  nop 
	IL_1b07:  nop 
	IL_1b08:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1b0d:  stloc 87

	IL_1b11:  nop 
	IL_1b12:  nop 
	IL_1b13:  ldloc 87

	IL_1b17:  nop 
	IL_1b18:  nop 
	IL_1b19:  ldloc 101

	IL_1b1d:  nop 
	IL_1b1e:  nop 
	IL_1b1f:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1b24:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1b29:  stloc 98

	IL_1b2d:  nop 
	IL_1b2e:  nop 
	IL_1b2f:  ldloc 98

	IL_1b33:  nop 
	IL_1b34:  nop 
	IL_1b35:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBrfalse(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1b3a:  br IL_1ede

	IL_1b3f:  br IL_1b49

	IL_1b44:  br IL_1b49

	IL_1b49:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt
	IL_1b4e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1b53:  stloc 0

	IL_1b57:  nop 
	IL_1b58:  nop 
	IL_1b59:  ldloc 0

	IL_1b5d:  nop 
	IL_1b5e:  nop 
	IL_1b5f:  ldarg 1

	IL_1b63:  nop 
	IL_1b64:  nop 
	IL_1b65:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1b6a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1b6f:  stloc 1

	IL_1b73:  nop 
	IL_1b74:  nop 
	IL_1b75:  ldloc 1

	IL_1b79:  nop 
	IL_1b7a:  nop 
	IL_1b7b:  ldc.i4 1
	IL_1b80:  beq IL_1b8a

	IL_1b85:  br IL_1c14

	IL_1b8a:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_1b8f:  stloc 97

	IL_1b93:  nop 
	IL_1b94:  nop 
	IL_1b95:  ldloc 97

	IL_1b99:  nop 
	IL_1b9a:  nop 
	IL_1b9b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1ba0:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1ba5:  stloc 98

	IL_1ba9:  nop 
	IL_1baa:  nop 
	IL_1bab:  ldloc 98

	IL_1baf:  nop 
	IL_1bb0:  nop 
	IL_1bb1:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1bb6:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::SetIfNxtBlkLbl()
	IL_1bbb:  ldarg 1

	IL_1bbf:  nop 
	IL_1bc0:  nop 
	IL_1bc1:  stloc 102

	IL_1bc5:  nop 
	IL_1bc6:  nop 
	IL_1bc7:  ldloc 102

	IL_1bcb:  nop 
	IL_1bcc:  nop 
	IL_1bcd:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt::Exp
	IL_1bd2:  stloc 103

	IL_1bd6:  nop 
	IL_1bd7:  nop 
	IL_1bd8:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1bdd:  stloc 87

	IL_1be1:  nop 
	IL_1be2:  nop 
	IL_1be3:  ldloc 87

	IL_1be7:  nop 
	IL_1be8:  nop 
	IL_1be9:  ldloc 103

	IL_1bed:  nop 
	IL_1bee:  nop 
	IL_1bef:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1bf4:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1bf9:  stloc 98

	IL_1bfd:  nop 
	IL_1bfe:  nop 
	IL_1bff:  ldloc 98

	IL_1c03:  nop 
	IL_1c04:  nop 
	IL_1c05:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBrfalse(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1c0a:  br IL_1ede

	IL_1c0f:  br IL_1c19

	IL_1c14:  br IL_1c19

	IL_1c19:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseStmt
	IL_1c1e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1c23:  stloc 0

	IL_1c27:  nop 
	IL_1c28:  nop 
	IL_1c29:  ldloc 0

	IL_1c2d:  nop 
	IL_1c2e:  nop 
	IL_1c2f:  ldarg 1

	IL_1c33:  nop 
	IL_1c34:  nop 
	IL_1c35:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1c3a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1c3f:  stloc 1

	IL_1c43:  nop 
	IL_1c44:  nop 
	IL_1c45:  ldloc 1

	IL_1c49:  nop 
	IL_1c4a:  nop 
	IL_1c4b:  ldc.i4 1
	IL_1c50:  beq IL_1c5a

	IL_1c55:  br IL_1c95

	IL_1c5a:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_1c5f:  stloc 97

	IL_1c63:  nop 
	IL_1c64:  nop 
	IL_1c65:  ldloc 97

	IL_1c69:  nop 
	IL_1c6a:  nop 
	IL_1c6b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1c70:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1c75:  stloc 98

	IL_1c79:  nop 
	IL_1c7a:  nop 
	IL_1c7b:  ldloc 98

	IL_1c7f:  nop 
	IL_1c80:  nop 
	IL_1c81:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1c86:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::SetIfElsePass()
	IL_1c8b:  br IL_1ede

	IL_1c90:  br IL_1c9a

	IL_1c95:  br IL_1c9a

	IL_1c9a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndIfStmt
	IL_1c9f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1ca4:  stloc 0

	IL_1ca8:  nop 
	IL_1ca9:  nop 
	IL_1caa:  ldloc 0

	IL_1cae:  nop 
	IL_1caf:  nop 
	IL_1cb0:  ldarg 1

	IL_1cb4:  nop 
	IL_1cb5:  nop 
	IL_1cb6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1cbb:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1cc0:  stloc 1

	IL_1cc4:  nop 
	IL_1cc5:  nop 
	IL_1cc6:  ldloc 1

	IL_1cca:  nop 
	IL_1ccb:  nop 
	IL_1ccc:  ldc.i4 1
	IL_1cd1:  beq IL_1cdb

	IL_1cd6:  br IL_1d40

	IL_1cdb:  call bool class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfElsePass()
	IL_1ce0:  stloc 1

	IL_1ce4:  nop 
	IL_1ce5:  nop 
	IL_1ce6:  ldloc 1

	IL_1cea:  nop 
	IL_1ceb:  nop 
	IL_1cec:  ldc.i4 0
	IL_1cf1:  beq IL_1cfb

	IL_1cf6:  br IL_1d16

	IL_1cfb:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1d00:  stloc 98

	IL_1d04:  nop 
	IL_1d05:  nop 
	IL_1d06:  ldloc 98

	IL_1d0a:  nop 
	IL_1d0b:  nop 
	IL_1d0c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1d11:  br IL_1d1b

	IL_1d16:  br IL_1d1b

	IL_1d1b:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_1d20:  stloc 97

	IL_1d24:  nop 
	IL_1d25:  nop 
	IL_1d26:  ldloc 97

	IL_1d2a:  nop 
	IL_1d2b:  nop 
	IL_1d2c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1d31:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::PopIf()
	IL_1d36:  br IL_1ede

	IL_1d3b:  br IL_1d45

	IL_1d40:  br IL_1d45

	IL_1d45:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt
	IL_1d4a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d4f:  stloc 0

	IL_1d53:  nop 
	IL_1d54:  nop 
	IL_1d55:  ldloc 0

	IL_1d59:  nop 
	IL_1d5a:  nop 
	IL_1d5b:  ldarg 1

	IL_1d5f:  nop 
	IL_1d60:  nop 
	IL_1d61:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1d66:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1d6b:  stloc 1

	IL_1d6f:  nop 
	IL_1d70:  nop 
	IL_1d71:  ldloc 1

	IL_1d75:  nop 
	IL_1d76:  nop 
	IL_1d77:  ldc.i4 1
	IL_1d7c:  beq IL_1d86

	IL_1d81:  br IL_1dbd

	IL_1d86:  ldarg 1

	IL_1d8a:  nop 
	IL_1d8b:  nop 
	IL_1d8c:  stloc 105

	IL_1d90:  nop 
	IL_1d91:  nop 
	IL_1d92:  ldloc 105

	IL_1d96:  nop 
	IL_1d97:  nop 
	IL_1d98:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt::LabelName
	IL_1d9d:  stloc 104

	IL_1da1:  nop 
	IL_1da2:  nop 
	IL_1da3:  ldloc 104

	IL_1da7:  nop 
	IL_1da8:  nop 
	IL_1da9:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1dae:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddLbl(string)
	IL_1db3:  br IL_1ede

	IL_1db8:  br IL_1dc2

	IL_1dbd:  br IL_1dc2

	IL_1dc2:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt
	IL_1dc7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1dcc:  stloc 0

	IL_1dd0:  nop 
	IL_1dd1:  nop 
	IL_1dd2:  ldloc 0

	IL_1dd6:  nop 
	IL_1dd7:  nop 
	IL_1dd8:  ldarg 1

	IL_1ddc:  nop 
	IL_1ddd:  nop 
	IL_1dde:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1de3:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1de8:  stloc 1

	IL_1dec:  nop 
	IL_1ded:  nop 
	IL_1dee:  ldloc 1

	IL_1df2:  nop 
	IL_1df3:  nop 
	IL_1df4:  ldc.i4 1
	IL_1df9:  beq IL_1e03

	IL_1dfe:  br IL_1e4b

	IL_1e03:  ldarg 1

	IL_1e07:  nop 
	IL_1e08:  nop 
	IL_1e09:  stloc 106

	IL_1e0d:  nop 
	IL_1e0e:  nop 
	IL_1e0f:  ldloc 106

	IL_1e13:  nop 
	IL_1e14:  nop 
	IL_1e15:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt::LabelName
	IL_1e1a:  stloc 104

	IL_1e1e:  nop 
	IL_1e1f:  nop 
	IL_1e20:  ldloc 104

	IL_1e24:  nop 
	IL_1e25:  nop 
	IL_1e26:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1e2b:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.Helpers::GetLbl(string)
	IL_1e30:  stloc 99

	IL_1e34:  nop 
	IL_1e35:  nop 
	IL_1e36:  ldloc 99

	IL_1e3a:  nop 
	IL_1e3b:  nop 
	IL_1e3c:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1e41:  br IL_1ede

	IL_1e46:  br IL_1e50

	IL_1e4b:  br IL_1e50

	IL_1e50:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt
	IL_1e55:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1e5a:  stloc 0

	IL_1e5e:  nop 
	IL_1e5f:  nop 
	IL_1e60:  ldloc 0

	IL_1e64:  nop 
	IL_1e65:  nop 
	IL_1e66:  ldarg 1

	IL_1e6a:  nop 
	IL_1e6b:  nop 
	IL_1e6c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1e71:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1e76:  stloc 1

	IL_1e7a:  nop 
	IL_1e7b:  nop 
	IL_1e7c:  ldloc 1

	IL_1e80:  nop 
	IL_1e81:  nop 
	IL_1e82:  ldc.i4 1
	IL_1e87:  beq IL_1e91

	IL_1e8c:  br IL_1ed9

	IL_1e91:  ldarg 1

	IL_1e95:  nop 
	IL_1e96:  nop 
	IL_1e97:  stloc 107

	IL_1e9b:  nop 
	IL_1e9c:  nop 
	IL_1e9d:  ldloc 107

	IL_1ea1:  nop 
	IL_1ea2:  nop 
	IL_1ea3:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt::LabelName
	IL_1ea8:  stloc 104

	IL_1eac:  nop 
	IL_1ead:  nop 
	IL_1eae:  ldloc 104

	IL_1eb2:  nop 
	IL_1eb3:  nop 
	IL_1eb4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1eb9:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.Helpers::GetLbl(string)
	IL_1ebe:  stloc 99

	IL_1ec2:  nop 
	IL_1ec3:  nop 
	IL_1ec4:  ldloc 99

	IL_1ec8:  nop 
	IL_1ec9:  nop 
	IL_1eca:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1ecf:  br IL_1ede

	IL_1ed4:  br IL_1ede

	IL_1ed9:  br IL_1ede

	IL_1ede:  ret 
    } // end of method StmtReader::Read

    // method line 90
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xd738
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

    // method line 91
    .method public 
           instance default void EmitMSIL (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet stmts, string fpath)  cil managed 
    {
        // Method begins at RVA 0xd74c
	// Code size 300 (0x12c)
	.maxstack 9
	.locals init (
		int32	V_0,
		int32	V_1,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt	V_2,
		class [mscorlib]System.Type	V_3,
		bool	V_4,
		class dylan.NET.Tokenizer.CodeGen.StmtReader	V_5,
		class [mscorlib]System.Reflection.Emit.AssemblyBuilder	V_6)
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
	IL_002b:  ldloc 0

	IL_002f:  nop 
	IL_0030:  nop 
	IL_0031:  ldc.i4 1
	IL_0036:  add 
	IL_0037:  stloc 0

	IL_003b:  nop 
	IL_003c:  nop 
	IL_003d:  ldarg 1

	IL_0041:  nop 
	IL_0042:  nop 
	IL_0043:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet::Stmts
	IL_0048:  ldloc 0

	IL_004c:  nop 
	IL_004d:  nop 
	IL_004e:  conv.u 
	IL_004f:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0054:  stloc 2

	IL_0058:  nop 
	IL_0059:  nop 
	IL_005a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IncludeStmt
	IL_005f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0064:  stloc 3

	IL_0068:  nop 
	IL_0069:  nop 
	IL_006a:  ldloc 3

	IL_006e:  nop 
	IL_006f:  nop 
	IL_0070:  ldloc 2

	IL_0074:  nop 
	IL_0075:  nop 
	IL_0076:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_007b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0080:  stloc 4

	IL_0084:  nop 
	IL_0085:  nop 
	IL_0086:  ldloc 4

	IL_008a:  nop 
	IL_008b:  nop 
	IL_008c:  ldc.i4 1
	IL_0091:  beq IL_009b

	IL_0096:  br IL_00a0

	IL_009b:  br IL_00c7

	IL_00a0:  newobj instance void class dylan.NET.Tokenizer.CodeGen.StmtReader::'.ctor'()
	IL_00a5:  stloc 5

	IL_00a9:  nop 
	IL_00aa:  nop 
	IL_00ab:  ldloc 5

	IL_00af:  nop 
	IL_00b0:  nop 
	IL_00b1:  ldloc 2

	IL_00b5:  nop 
	IL_00b6:  nop 
	IL_00b7:  ldarg 2

	IL_00bb:  nop 
	IL_00bc:  nop 
	IL_00bd:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.StmtReader::Read(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt, string)
	IL_00c2:  br IL_00c7

	IL_00c7:  ldloc 0

	IL_00cb:  nop 
	IL_00cc:  nop 
	IL_00cd:  ldloc 1

	IL_00d1:  nop 
	IL_00d2:  nop 
	IL_00d3:  beq IL_00dd

	IL_00d8:  br IL_0121

	IL_00dd:  ldstr "Writing Assembly to Disk"
	IL_00e2:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_00e7:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_00ec:  stloc 6

	IL_00f0:  nop 
	IL_00f1:  nop 
	IL_00f2:  ldloc 6

	IL_00f6:  nop 
	IL_00f7:  nop 
	IL_00f8:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::DefineVersionInfoResource()
	IL_00fd:  ldloc 6

	IL_0101:  nop 
	IL_0102:  nop 
	IL_0103:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmFile
	IL_0108:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::Save(string)
	IL_010d:  ldstr "...Done."
	IL_0112:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0117:  br IL_012b

	IL_011c:  br IL_012b

	IL_0121:  br IL_002b

	IL_0126:  br IL_012b

	IL_012b:  ret 
    } // end of method CodeGenerator::EmitMSIL

    // method line 92
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xd884
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method CodeGenerator::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.CodeGenerator
}

