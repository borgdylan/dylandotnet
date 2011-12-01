.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern tokenizer.AST
{
  .ver 11:2:7:9
}
.assembly extern dnr
{
  .ver 11:2:7:9
}
.assembly extern dnu
{
  .ver 11:2:7:9
}
.assembly 'tokenizer.CodeGen'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 01 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 08 31 31 2E 32 2E 37 2E 39 00 00 ) // ...11.2.7.9..

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
  .ver  11:2:7:9
}

.module tokenizer.CodeGen.dll // GUID = {D595D524-84BE-49D1-8675-E59F189098C0}


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
    .field  public static  bool OpCodeSuppFlg
    .field  public static  class [mscorlib]System.Type LeftOp
    .field  public static  class [mscorlib]System.Type RightOp

    // method line 48
    .method public static specialname rtspecialname 
           default void '.cctor' ()  cil managed 
    {
        // Method begins at RVA 0x3cf4
	// Code size 33 (0x21)
	.maxstack 1
	IL_0000:  ldc.i4 0
	IL_0005:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_000a:  ldc.i4 0
	IL_000f:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_0014:  ldnull 
	IL_0015:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_001a:  ldnull 
	IL_001b:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0020:  ret 
    } // end of method Helpers::.cctor

    // method line 49
    .method public static 
           default valuetype [mscorlib]System.Reflection.TypeAttributes ProcessClassAttrs (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] attrs)  cil managed 
    {
        // Method begins at RVA 0x3d24
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
        // Method begins at RVA 0x3ff8
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
        // Method begins at RVA 0x4408
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
        // Method begins at RVA 0x4760
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
        // Method begins at RVA 0x4a34
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
        // Method begins at RVA 0x4a54
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
        // Method begins at RVA 0x4b2c
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
        // Method begins at RVA 0x4c68
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
        // Method begins at RVA 0x4da4
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
        // Method begins at RVA 0x52d8
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
        // Method begins at RVA 0x5608
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
        // Method begins at RVA 0x5a38
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
        // Method begins at RVA 0x5ec8
	// Code size 3132 (0xc3c)
	.maxstack 132
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

	IL_0043:  br IL_00f3

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
	IL_0093:  br IL_00e9

	IL_0098:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_009d:  ldc.i4 1
	IL_00a2:  beq IL_00ac

	IL_00a7:  br IL_00b6

	IL_00ac:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStrAdd()
	IL_00b1:  br IL_00e4

	IL_00b6:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_00bb:  ldc.i4 1
	IL_00c0:  beq IL_00ca

	IL_00c5:  br IL_00da

	IL_00ca:  ldarg 1

	IL_00ce:  nop 
	IL_00cf:  nop 
	IL_00d0:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitAdd(bool)
	IL_00d5:  br IL_00df

	IL_00da:  br IL_00df

	IL_00df:  br IL_00e4

	IL_00e4:  br IL_00e9

	IL_00e9:  br IL_0c3b

	IL_00ee:  br IL_00f8

	IL_00f3:  br IL_00f8

	IL_00f8:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.MulOp
	IL_00fd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0102:  stloc 0

	IL_0106:  nop 
	IL_0107:  nop 
	IL_0108:  ldloc 0

	IL_010c:  nop 
	IL_010d:  nop 
	IL_010e:  ldarg 0

	IL_0112:  nop 
	IL_0113:  nop 
	IL_0114:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0119:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_011e:  stloc 1

	IL_0122:  nop 
	IL_0123:  nop 
	IL_0124:  ldloc 1

	IL_0128:  nop 
	IL_0129:  nop 
	IL_012a:  ldc.i4 1
	IL_012f:  beq IL_0139

	IL_0134:  br IL_01c1

	IL_0139:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_013e:  ldstr "op_Multiply"
	IL_0143:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0148:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_014d:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0152:  stloc 2

	IL_0156:  nop 
	IL_0157:  nop 
	IL_0158:  ldloc 2

	IL_015c:  nop 
	IL_015d:  nop 
	IL_015e:  ldnull 
	IL_015f:  beq IL_0189

	IL_0164:  br IL_0169

	IL_0169:  ldloc 2

	IL_016d:  nop 
	IL_016e:  nop 
	IL_016f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0174:  ldloc 2

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_017f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0184:  br IL_01b7

	IL_0189:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_018e:  ldc.i4 1
	IL_0193:  beq IL_019d

	IL_0198:  br IL_01ad

	IL_019d:  ldarg 1

	IL_01a1:  nop 
	IL_01a2:  nop 
	IL_01a3:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitMul(bool)
	IL_01a8:  br IL_01b2

	IL_01ad:  br IL_01b2

	IL_01b2:  br IL_01b7

	IL_01b7:  br IL_0c3b

	IL_01bc:  br IL_01c6

	IL_01c1:  br IL_01c6

	IL_01c6:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.SubOp
	IL_01cb:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01d0:  stloc 0

	IL_01d4:  nop 
	IL_01d5:  nop 
	IL_01d6:  ldloc 0

	IL_01da:  nop 
	IL_01db:  nop 
	IL_01dc:  ldarg 0

	IL_01e0:  nop 
	IL_01e1:  nop 
	IL_01e2:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_01e7:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01ec:  stloc 1

	IL_01f0:  nop 
	IL_01f1:  nop 
	IL_01f2:  ldloc 1

	IL_01f6:  nop 
	IL_01f7:  nop 
	IL_01f8:  ldc.i4 1
	IL_01fd:  beq IL_0207

	IL_0202:  br IL_028f

	IL_0207:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_020c:  ldstr "op_Subtraction"
	IL_0211:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0216:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_021b:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0220:  stloc 2

	IL_0224:  nop 
	IL_0225:  nop 
	IL_0226:  ldloc 2

	IL_022a:  nop 
	IL_022b:  nop 
	IL_022c:  ldnull 
	IL_022d:  beq IL_0257

	IL_0232:  br IL_0237

	IL_0237:  ldloc 2

	IL_023b:  nop 
	IL_023c:  nop 
	IL_023d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0242:  ldloc 2

	IL_0246:  nop 
	IL_0247:  nop 
	IL_0248:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_024d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0252:  br IL_0285

	IL_0257:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_025c:  ldc.i4 1
	IL_0261:  beq IL_026b

	IL_0266:  br IL_027b

	IL_026b:  ldarg 1

	IL_026f:  nop 
	IL_0270:  nop 
	IL_0271:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitSub(bool)
	IL_0276:  br IL_0280

	IL_027b:  br IL_0280

	IL_0280:  br IL_0285

	IL_0285:  br IL_0c3b

	IL_028a:  br IL_0294

	IL_028f:  br IL_0294

	IL_0294:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.DivOp
	IL_0299:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_029e:  stloc 0

	IL_02a2:  nop 
	IL_02a3:  nop 
	IL_02a4:  ldloc 0

	IL_02a8:  nop 
	IL_02a9:  nop 
	IL_02aa:  ldarg 0

	IL_02ae:  nop 
	IL_02af:  nop 
	IL_02b0:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_02b5:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_02ba:  stloc 1

	IL_02be:  nop 
	IL_02bf:  nop 
	IL_02c0:  ldloc 1

	IL_02c4:  nop 
	IL_02c5:  nop 
	IL_02c6:  ldc.i4 1
	IL_02cb:  beq IL_02d5

	IL_02d0:  br IL_035d

	IL_02d5:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_02da:  ldstr "op_Division"
	IL_02df:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_02e4:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_02e9:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_02ee:  stloc 2

	IL_02f2:  nop 
	IL_02f3:  nop 
	IL_02f4:  ldloc 2

	IL_02f8:  nop 
	IL_02f9:  nop 
	IL_02fa:  ldnull 
	IL_02fb:  beq IL_0325

	IL_0300:  br IL_0305

	IL_0305:  ldloc 2

	IL_0309:  nop 
	IL_030a:  nop 
	IL_030b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0310:  ldloc 2

	IL_0314:  nop 
	IL_0315:  nop 
	IL_0316:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_031b:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0320:  br IL_0353

	IL_0325:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_032a:  ldc.i4 1
	IL_032f:  beq IL_0339

	IL_0334:  br IL_0349

	IL_0339:  ldarg 1

	IL_033d:  nop 
	IL_033e:  nop 
	IL_033f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitDiv(bool)
	IL_0344:  br IL_034e

	IL_0349:  br IL_034e

	IL_034e:  br IL_0353

	IL_0353:  br IL_0c3b

	IL_0358:  br IL_0362

	IL_035d:  br IL_0362

	IL_0362:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ModOp
	IL_0367:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_036c:  stloc 0

	IL_0370:  nop 
	IL_0371:  nop 
	IL_0372:  ldloc 0

	IL_0376:  nop 
	IL_0377:  nop 
	IL_0378:  ldarg 0

	IL_037c:  nop 
	IL_037d:  nop 
	IL_037e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0383:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0388:  stloc 1

	IL_038c:  nop 
	IL_038d:  nop 
	IL_038e:  ldloc 1

	IL_0392:  nop 
	IL_0393:  nop 
	IL_0394:  ldc.i4 1
	IL_0399:  beq IL_03a3

	IL_039e:  br IL_042b

	IL_03a3:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_03a8:  ldstr "op_Modulus"
	IL_03ad:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_03b2:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_03b7:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_03bc:  stloc 2

	IL_03c0:  nop 
	IL_03c1:  nop 
	IL_03c2:  ldloc 2

	IL_03c6:  nop 
	IL_03c7:  nop 
	IL_03c8:  ldnull 
	IL_03c9:  beq IL_03f3

	IL_03ce:  br IL_03d3

	IL_03d3:  ldloc 2

	IL_03d7:  nop 
	IL_03d8:  nop 
	IL_03d9:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_03de:  ldloc 2

	IL_03e2:  nop 
	IL_03e3:  nop 
	IL_03e4:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_03e9:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_03ee:  br IL_0421

	IL_03f3:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_03f8:  ldc.i4 1
	IL_03fd:  beq IL_0407

	IL_0402:  br IL_0417

	IL_0407:  ldarg 1

	IL_040b:  nop 
	IL_040c:  nop 
	IL_040d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRem(bool)
	IL_0412:  br IL_041c

	IL_0417:  br IL_041c

	IL_041c:  br IL_0421

	IL_0421:  br IL_0c3b

	IL_0426:  br IL_0430

	IL_042b:  br IL_0430

	IL_0430:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.OrOp
	IL_0435:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_043a:  stloc 0

	IL_043e:  nop 
	IL_043f:  nop 
	IL_0440:  ldloc 0

	IL_0444:  nop 
	IL_0445:  nop 
	IL_0446:  ldarg 0

	IL_044a:  nop 
	IL_044b:  nop 
	IL_044c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0451:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0456:  stloc 1

	IL_045a:  nop 
	IL_045b:  nop 
	IL_045c:  ldloc 1

	IL_0460:  nop 
	IL_0461:  nop 
	IL_0462:  ldc.i4 1
	IL_0467:  beq IL_0471

	IL_046c:  br IL_0480

	IL_0471:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitOr()
	IL_0476:  br IL_0c3b

	IL_047b:  br IL_0485

	IL_0480:  br IL_0485

	IL_0485:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.AndOp
	IL_048a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_048f:  stloc 0

	IL_0493:  nop 
	IL_0494:  nop 
	IL_0495:  ldloc 0

	IL_0499:  nop 
	IL_049a:  nop 
	IL_049b:  ldarg 0

	IL_049f:  nop 
	IL_04a0:  nop 
	IL_04a1:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_04a6:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_04ab:  stloc 1

	IL_04af:  nop 
	IL_04b0:  nop 
	IL_04b1:  ldloc 1

	IL_04b5:  nop 
	IL_04b6:  nop 
	IL_04b7:  ldc.i4 1
	IL_04bc:  beq IL_04c6

	IL_04c1:  br IL_04d5

	IL_04c6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitAnd()
	IL_04cb:  br IL_0c3b

	IL_04d0:  br IL_04da

	IL_04d5:  br IL_04da

	IL_04da:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.OrOp
	IL_04df:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_04e4:  stloc 0

	IL_04e8:  nop 
	IL_04e9:  nop 
	IL_04ea:  ldloc 0

	IL_04ee:  nop 
	IL_04ef:  nop 
	IL_04f0:  ldarg 0

	IL_04f4:  nop 
	IL_04f5:  nop 
	IL_04f6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_04fb:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0500:  stloc 1

	IL_0504:  nop 
	IL_0505:  nop 
	IL_0506:  ldloc 1

	IL_050a:  nop 
	IL_050b:  nop 
	IL_050c:  ldc.i4 1
	IL_0511:  beq IL_051b

	IL_0516:  br IL_052a

	IL_051b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitOr()
	IL_0520:  br IL_0c3b

	IL_0525:  br IL_052f

	IL_052a:  br IL_052f

	IL_052f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XorOp
	IL_0534:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0539:  stloc 0

	IL_053d:  nop 
	IL_053e:  nop 
	IL_053f:  ldloc 0

	IL_0543:  nop 
	IL_0544:  nop 
	IL_0545:  ldarg 0

	IL_0549:  nop 
	IL_054a:  nop 
	IL_054b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0550:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0555:  stloc 1

	IL_0559:  nop 
	IL_055a:  nop 
	IL_055b:  ldloc 1

	IL_055f:  nop 
	IL_0560:  nop 
	IL_0561:  ldc.i4 1
	IL_0566:  beq IL_0570

	IL_056b:  br IL_057f

	IL_0570:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitXor()
	IL_0575:  br IL_0c3b

	IL_057a:  br IL_0584

	IL_057f:  br IL_0584

	IL_0584:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NandOp
	IL_0589:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_058e:  stloc 0

	IL_0592:  nop 
	IL_0593:  nop 
	IL_0594:  ldloc 0

	IL_0598:  nop 
	IL_0599:  nop 
	IL_059a:  ldarg 0

	IL_059e:  nop 
	IL_059f:  nop 
	IL_05a0:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_05a5:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05aa:  stloc 1

	IL_05ae:  nop 
	IL_05af:  nop 
	IL_05b0:  ldloc 1

	IL_05b4:  nop 
	IL_05b5:  nop 
	IL_05b6:  ldc.i4 1
	IL_05bb:  beq IL_05c5

	IL_05c0:  br IL_05d4

	IL_05c5:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNand()
	IL_05ca:  br IL_0c3b

	IL_05cf:  br IL_05d9

	IL_05d4:  br IL_05d9

	IL_05d9:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NorOp
	IL_05de:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_05e3:  stloc 0

	IL_05e7:  nop 
	IL_05e8:  nop 
	IL_05e9:  ldloc 0

	IL_05ed:  nop 
	IL_05ee:  nop 
	IL_05ef:  ldarg 0

	IL_05f3:  nop 
	IL_05f4:  nop 
	IL_05f5:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_05fa:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_05ff:  stloc 1

	IL_0603:  nop 
	IL_0604:  nop 
	IL_0605:  ldloc 1

	IL_0609:  nop 
	IL_060a:  nop 
	IL_060b:  ldc.i4 1
	IL_0610:  beq IL_061a

	IL_0615:  br IL_0629

	IL_061a:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNor()
	IL_061f:  br IL_0c3b

	IL_0624:  br IL_062e

	IL_0629:  br IL_062e

	IL_062e:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.XnorOp
	IL_0633:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0638:  stloc 0

	IL_063c:  nop 
	IL_063d:  nop 
	IL_063e:  ldloc 0

	IL_0642:  nop 
	IL_0643:  nop 
	IL_0644:  ldarg 0

	IL_0648:  nop 
	IL_0649:  nop 
	IL_064a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_064f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0654:  stloc 1

	IL_0658:  nop 
	IL_0659:  nop 
	IL_065a:  ldloc 1

	IL_065e:  nop 
	IL_065f:  nop 
	IL_0660:  ldc.i4 1
	IL_0665:  beq IL_066f

	IL_066a:  br IL_067e

	IL_066f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitXnor()
	IL_0674:  br IL_0c3b

	IL_0679:  br IL_0683

	IL_067e:  br IL_0683

	IL_0683:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GtOp
	IL_0688:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_068d:  stloc 0

	IL_0691:  nop 
	IL_0692:  nop 
	IL_0693:  ldloc 0

	IL_0697:  nop 
	IL_0698:  nop 
	IL_0699:  ldarg 0

	IL_069d:  nop 
	IL_069e:  nop 
	IL_069f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_06a4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_06a9:  stloc 1

	IL_06ad:  nop 
	IL_06ae:  nop 
	IL_06af:  ldloc 1

	IL_06b3:  nop 
	IL_06b4:  nop 
	IL_06b5:  ldc.i4 1
	IL_06ba:  beq IL_06c4

	IL_06bf:  br IL_074c

	IL_06c4:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_06c9:  ldstr "op_GreaterThan"
	IL_06ce:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_06d3:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_06d8:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_06dd:  stloc 2

	IL_06e1:  nop 
	IL_06e2:  nop 
	IL_06e3:  ldloc 2

	IL_06e7:  nop 
	IL_06e8:  nop 
	IL_06e9:  ldnull 
	IL_06ea:  beq IL_0714

	IL_06ef:  br IL_06f4

	IL_06f4:  ldloc 2

	IL_06f8:  nop 
	IL_06f9:  nop 
	IL_06fa:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_06ff:  ldloc 2

	IL_0703:  nop 
	IL_0704:  nop 
	IL_0705:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_070a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_070f:  br IL_0742

	IL_0714:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_0719:  ldc.i4 1
	IL_071e:  beq IL_0728

	IL_0723:  br IL_0738

	IL_0728:  ldarg 1

	IL_072c:  nop 
	IL_072d:  nop 
	IL_072e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCgt(bool)
	IL_0733:  br IL_073d

	IL_0738:  br IL_073d

	IL_073d:  br IL_0742

	IL_0742:  br IL_0c3b

	IL_0747:  br IL_0751

	IL_074c:  br IL_0751

	IL_0751:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LtOp
	IL_0756:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_075b:  stloc 0

	IL_075f:  nop 
	IL_0760:  nop 
	IL_0761:  ldloc 0

	IL_0765:  nop 
	IL_0766:  nop 
	IL_0767:  ldarg 0

	IL_076b:  nop 
	IL_076c:  nop 
	IL_076d:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0772:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0777:  stloc 1

	IL_077b:  nop 
	IL_077c:  nop 
	IL_077d:  ldloc 1

	IL_0781:  nop 
	IL_0782:  nop 
	IL_0783:  ldc.i4 1
	IL_0788:  beq IL_0792

	IL_078d:  br IL_081a

	IL_0792:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0797:  ldstr "op_LessThan"
	IL_079c:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_07a1:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_07a6:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_07ab:  stloc 2

	IL_07af:  nop 
	IL_07b0:  nop 
	IL_07b1:  ldloc 2

	IL_07b5:  nop 
	IL_07b6:  nop 
	IL_07b7:  ldnull 
	IL_07b8:  beq IL_07e2

	IL_07bd:  br IL_07c2

	IL_07c2:  ldloc 2

	IL_07c6:  nop 
	IL_07c7:  nop 
	IL_07c8:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_07cd:  ldloc 2

	IL_07d1:  nop 
	IL_07d2:  nop 
	IL_07d3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_07d8:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_07dd:  br IL_0810

	IL_07e2:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_07e7:  ldc.i4 1
	IL_07ec:  beq IL_07f6

	IL_07f1:  br IL_0806

	IL_07f6:  ldarg 1

	IL_07fa:  nop 
	IL_07fb:  nop 
	IL_07fc:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitClt(bool)
	IL_0801:  br IL_080b

	IL_0806:  br IL_080b

	IL_080b:  br IL_0810

	IL_0810:  br IL_0c3b

	IL_0815:  br IL_081f

	IL_081a:  br IL_081f

	IL_081f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.GeOp
	IL_0824:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0829:  stloc 0

	IL_082d:  nop 
	IL_082e:  nop 
	IL_082f:  ldloc 0

	IL_0833:  nop 
	IL_0834:  nop 
	IL_0835:  ldarg 0

	IL_0839:  nop 
	IL_083a:  nop 
	IL_083b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0840:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0845:  stloc 1

	IL_0849:  nop 
	IL_084a:  nop 
	IL_084b:  ldloc 1

	IL_084f:  nop 
	IL_0850:  nop 
	IL_0851:  ldc.i4 1
	IL_0856:  beq IL_0860

	IL_085b:  br IL_08e8

	IL_0860:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0865:  ldstr "op_GreaterThanOrEqual"
	IL_086a:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_086f:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0874:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0879:  stloc 2

	IL_087d:  nop 
	IL_087e:  nop 
	IL_087f:  ldloc 2

	IL_0883:  nop 
	IL_0884:  nop 
	IL_0885:  ldnull 
	IL_0886:  beq IL_08b0

	IL_088b:  br IL_0890

	IL_0890:  ldloc 2

	IL_0894:  nop 
	IL_0895:  nop 
	IL_0896:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_089b:  ldloc 2

	IL_089f:  nop 
	IL_08a0:  nop 
	IL_08a1:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_08a6:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_08ab:  br IL_08de

	IL_08b0:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_08b5:  ldc.i4 1
	IL_08ba:  beq IL_08c4

	IL_08bf:  br IL_08d4

	IL_08c4:  ldarg 1

	IL_08c8:  nop 
	IL_08c9:  nop 
	IL_08ca:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCge(bool)
	IL_08cf:  br IL_08d9

	IL_08d4:  br IL_08d9

	IL_08d9:  br IL_08de

	IL_08de:  br IL_0c3b

	IL_08e3:  br IL_08ed

	IL_08e8:  br IL_08ed

	IL_08ed:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LeOp
	IL_08f2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_08f7:  stloc 0

	IL_08fb:  nop 
	IL_08fc:  nop 
	IL_08fd:  ldloc 0

	IL_0901:  nop 
	IL_0902:  nop 
	IL_0903:  ldarg 0

	IL_0907:  nop 
	IL_0908:  nop 
	IL_0909:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_090e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0913:  stloc 1

	IL_0917:  nop 
	IL_0918:  nop 
	IL_0919:  ldloc 1

	IL_091d:  nop 
	IL_091e:  nop 
	IL_091f:  ldc.i4 1
	IL_0924:  beq IL_092e

	IL_0929:  br IL_09b6

	IL_092e:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0933:  ldstr "op_LessThanOrEqual"
	IL_0938:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_093d:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0942:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0947:  stloc 2

	IL_094b:  nop 
	IL_094c:  nop 
	IL_094d:  ldloc 2

	IL_0951:  nop 
	IL_0952:  nop 
	IL_0953:  ldnull 
	IL_0954:  beq IL_097e

	IL_0959:  br IL_095e

	IL_095e:  ldloc 2

	IL_0962:  nop 
	IL_0963:  nop 
	IL_0964:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0969:  ldloc 2

	IL_096d:  nop 
	IL_096e:  nop 
	IL_096f:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0974:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0979:  br IL_09ac

	IL_097e:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_0983:  ldc.i4 1
	IL_0988:  beq IL_0992

	IL_098d:  br IL_09a2

	IL_0992:  ldarg 1

	IL_0996:  nop 
	IL_0997:  nop 
	IL_0998:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCle(bool)
	IL_099d:  br IL_09a7

	IL_09a2:  br IL_09a7

	IL_09a7:  br IL_09ac

	IL_09ac:  br IL_0c3b

	IL_09b1:  br IL_09bb

	IL_09b6:  br IL_09bb

	IL_09bb:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.EqOp
	IL_09c0:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_09c5:  stloc 0

	IL_09c9:  nop 
	IL_09ca:  nop 
	IL_09cb:  ldloc 0

	IL_09cf:  nop 
	IL_09d0:  nop 
	IL_09d1:  ldarg 0

	IL_09d5:  nop 
	IL_09d6:  nop 
	IL_09d7:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_09dc:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_09e1:  stloc 1

	IL_09e5:  nop 
	IL_09e6:  nop 
	IL_09e7:  ldloc 1

	IL_09eb:  nop 
	IL_09ec:  nop 
	IL_09ed:  ldc.i4 1
	IL_09f2:  beq IL_09fc

	IL_09f7:  br IL_0a83

	IL_09fc:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0a01:  ldstr "op_Equality"
	IL_0a06:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0a0b:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0a10:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0a15:  stloc 2

	IL_0a19:  nop 
	IL_0a1a:  nop 
	IL_0a1b:  ldloc 2

	IL_0a1f:  nop 
	IL_0a20:  nop 
	IL_0a21:  ldnull 
	IL_0a22:  beq IL_0a4c

	IL_0a27:  br IL_0a2c

	IL_0a2c:  ldloc 2

	IL_0a30:  nop 
	IL_0a31:  nop 
	IL_0a32:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0a37:  ldloc 2

	IL_0a3b:  nop 
	IL_0a3c:  nop 
	IL_0a3d:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0a42:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0a47:  br IL_0a79

	IL_0a4c:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0a51:  ldc.i4 1
	IL_0a56:  beq IL_0a60

	IL_0a5b:  br IL_0a6a

	IL_0a60:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStrCeq()
	IL_0a65:  br IL_0a74

	IL_0a6a:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCeq()
	IL_0a6f:  br IL_0a74

	IL_0a74:  br IL_0a79

	IL_0a79:  br IL_0c3b

	IL_0a7e:  br IL_0a88

	IL_0a83:  br IL_0a88

	IL_0a88:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NeqOp
	IL_0a8d:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0a92:  stloc 0

	IL_0a96:  nop 
	IL_0a97:  nop 
	IL_0a98:  ldloc 0

	IL_0a9c:  nop 
	IL_0a9d:  nop 
	IL_0a9e:  ldarg 0

	IL_0aa2:  nop 
	IL_0aa3:  nop 
	IL_0aa4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0aa9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0aae:  stloc 1

	IL_0ab2:  nop 
	IL_0ab3:  nop 
	IL_0ab4:  ldloc 1

	IL_0ab8:  nop 
	IL_0ab9:  nop 
	IL_0aba:  ldc.i4 1
	IL_0abf:  beq IL_0ac9

	IL_0ac4:  br IL_0b50

	IL_0ac9:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0ace:  ldstr "op_Inequality"
	IL_0ad3:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0ad8:  ldsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0add:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadBinOp(class [mscorlib]System.Type, string, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0ae2:  stloc 2

	IL_0ae6:  nop 
	IL_0ae7:  nop 
	IL_0ae8:  ldloc 2

	IL_0aec:  nop 
	IL_0aed:  nop 
	IL_0aee:  ldnull 
	IL_0aef:  beq IL_0b19

	IL_0af4:  br IL_0af9

	IL_0af9:  ldloc 2

	IL_0afd:  nop 
	IL_0afe:  nop 
	IL_0aff:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_0b04:  ldloc 2

	IL_0b08:  nop 
	IL_0b09:  nop 
	IL_0b0a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_0b0f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0b14:  br IL_0b46

	IL_0b19:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0b1e:  ldc.i4 1
	IL_0b23:  beq IL_0b2d

	IL_0b28:  br IL_0b37

	IL_0b2d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitStrCneq()
	IL_0b32:  br IL_0b41

	IL_0b37:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCneq()
	IL_0b3c:  br IL_0b41

	IL_0b41:  br IL_0b46

	IL_0b46:  br IL_0c3b

	IL_0b4b:  br IL_0b55

	IL_0b50:  br IL_0b55

	IL_0b55:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.LikeOp
	IL_0b5a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0b5f:  stloc 0

	IL_0b63:  nop 
	IL_0b64:  nop 
	IL_0b65:  ldloc 0

	IL_0b69:  nop 
	IL_0b6a:  nop 
	IL_0b6b:  ldarg 0

	IL_0b6f:  nop 
	IL_0b70:  nop 
	IL_0b71:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0b76:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0b7b:  stloc 1

	IL_0b7f:  nop 
	IL_0b80:  nop 
	IL_0b81:  ldloc 1

	IL_0b85:  nop 
	IL_0b86:  nop 
	IL_0b87:  ldc.i4 1
	IL_0b8c:  beq IL_0b96

	IL_0b91:  br IL_0bc3

	IL_0b96:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0b9b:  ldc.i4 1
	IL_0ba0:  beq IL_0baa

	IL_0ba5:  br IL_0bb4

	IL_0baa:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLike()
	IL_0baf:  br IL_0bb9

	IL_0bb4:  br IL_0bb9

	IL_0bb9:  br IL_0c3b

	IL_0bbe:  br IL_0bc8

	IL_0bc3:  br IL_0bc8

	IL_0bc8:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.NLikeOp
	IL_0bcd:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0bd2:  stloc 0

	IL_0bd6:  nop 
	IL_0bd7:  nop 
	IL_0bd8:  ldloc 0

	IL_0bdc:  nop 
	IL_0bdd:  nop 
	IL_0bde:  ldarg 0

	IL_0be2:  nop 
	IL_0be3:  nop 
	IL_0be4:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_0be9:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0bee:  stloc 1

	IL_0bf2:  nop 
	IL_0bf3:  nop 
	IL_0bf4:  ldloc 1

	IL_0bf8:  nop 
	IL_0bf9:  nop 
	IL_0bfa:  ldc.i4 1
	IL_0bff:  beq IL_0c09

	IL_0c04:  br IL_0c36

	IL_0c09:  ldsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_0c0e:  ldc.i4 1
	IL_0c13:  beq IL_0c1d

	IL_0c18:  br IL_0c27

	IL_0c1d:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNLike()
	IL_0c22:  br IL_0c2c

	IL_0c27:  br IL_0c2c

	IL_0c2c:  br IL_0c3b

	IL_0c31:  br IL_0c3b

	IL_0c36:  br IL_0c3b

	IL_0c3b:  ret 
    } // end of method Helpers::EmitOp

    // method line 62
    .method public static 
           default void EmitLocLd (int32 ind, bool locarg)  cil managed 
    {
        // Method begins at RVA 0x6b10
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
        // Method begins at RVA 0x6c20
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
        // Method begins at RVA 0x6c64
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
        // Method begins at RVA 0x7564
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
        // Method begins at RVA 0x76c0
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
        // Method begins at RVA 0x7704
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
        // Method begins at RVA 0x7814
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
        // Method begins at RVA 0x7858
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
        // Method begins at RVA 0x78dc
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
        // Method begins at RVA 0x794c
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
        // Method begins at RVA 0x79c8
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
        // Method begins at RVA 0x7a20
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

  } // end of class dylan.NET.Tokenizer.CodeGen.Helpers
}

.namespace dylan.NET.Tokenizer.CodeGen
{
  .class public auto ansi OpStack
  	extends [mscorlib]System.Object
  {
    .field  public  class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr Stack

    // method line 74
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7a70
	// Code size 18 (0x12)
	.maxstack 4
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_000c:  stfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr dylan.NET.Tokenizer.CodeGen.OpStack::Stack
	IL_0011:  ret 
    } // end of method OpStack::.ctor

    // method line 75
    .method public 
           instance default void PushOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token optok)  cil managed 
    {
        // Method begins at RVA 0x7a90
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

    // method line 76
    .method public 
           instance default void PopOp ()  cil managed 
    {
        // Method begins at RVA 0x7ab0
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

    // method line 77
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token TopOp ()  cil managed 
    {
        // Method begins at RVA 0x7b10
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

    // method line 78
    .method public 
           instance default int32 getLength ()  cil managed 
    {
        // Method begins at RVA 0x7b80
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

    // method line 79
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x7b9c
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

    // method line 80
    .method public 
           instance default int32 RetPrec (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7bc4
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

    // method line 81
    .method public 
           instance default bool isLParen (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7d18
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

    // method line 82
    .method public 
           instance default bool isOp (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok)  cil managed 
    {
        // Method begins at RVA 0x7d4c
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

    // method line 83
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ConvToRPN (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x7d80
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

    // method line 84
    .method public 
           instance default class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr ConvToAST (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0x82cc
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

    // method line 85
    .method public 
           instance default void ASTEmit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok, bool emt)  cil managed 
    {
        // Method begins at RVA 0x8540
	// Code size 8198 (0x2006)
	.maxstack 327
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
		class [mscorlib]System.Type	V_15,
		class [mscorlib]System.Type	V_16,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral	V_17,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal	V_18,
		string	V_19,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_20,
		class dylan.NET.Tokenizer.CodeGen.FieldItem	V_21,
		class [mscorlib]System.Reflection.FieldInfo	V_22,
		bool	V_23,
		bool	V_24,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_25,
		int32	V_26,
		class [mscorlib]System.Type	V_27,
		bool	V_28,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_29,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_30,
		string[]	V_31,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral	V_32,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal	V_33,
		class [mscorlib]System.Type	V_34,
		string[]	V_35,
		class [mscorlib]System.Reflection.MethodInfo	V_36,
		class [mscorlib]System.Type	V_37,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_38,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok	V_39,
		string	V_40,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_41,
		class [mscorlib]System.Type[]	V_42,
		class [mscorlib]System.Type[]	V_43,
		int32	V_44,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_45,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_46,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_47,
		class [mscorlib]System.Reflection.ConstructorInfo	V_48,
		class [mscorlib]System.Reflection.FieldInfo	V_49,
		class dylan.NET.Tokenizer.CodeGen.VarItem	V_50,
		bool	V_51,
		bool	V_52,
		int32	V_53,
		string	V_54,
		class dylan.NET.Tokenizer.CodeGen.TypeArr	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok	V_56,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok	V_57,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok	V_58,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok	V_59)
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

	IL_00a5:  br IL_0276

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

	IL_0163:  ldloc 6

	IL_0167:  nop 
	IL_0168:  nop 
	IL_0169:  ldloc 7

	IL_016d:  nop 
	IL_016e:  nop 
	IL_016f:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0174:  stloc 9

	IL_0178:  nop 
	IL_0179:  nop 
	IL_017a:  ldloc 9

	IL_017e:  nop 
	IL_017f:  nop 
	IL_0180:  ldc.i4 1
	IL_0185:  beq IL_018f

	IL_018a:  br IL_01a4

	IL_018f:  ldloc 6

	IL_0193:  nop 
	IL_0194:  nop 
	IL_0195:  callvirt instance bool class [mscorlib]System.Type::get_IsPrimitive()
	IL_019a:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_019f:  br IL_01b3

	IL_01a4:  ldc.i4 0
	IL_01a9:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_01ae:  br IL_01b3

	IL_01b3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.ConditionalOp
	IL_01b8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01bd:  stloc 8

	IL_01c1:  nop 
	IL_01c2:  nop 
	IL_01c3:  ldloc 8

	IL_01c7:  nop 
	IL_01c8:  nop 
	IL_01c9:  ldloc 1

	IL_01cd:  nop 
	IL_01ce:  nop 
	IL_01cf:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op
	IL_01d4:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_01d9:  stloc 9

	IL_01dd:  nop 
	IL_01de:  nop 
	IL_01df:  ldloc 9

	IL_01e3:  nop 
	IL_01e4:  nop 
	IL_01e5:  ldc.i4 1
	IL_01ea:  beq IL_01f4

	IL_01ef:  br IL_0208

	IL_01f4:  ldtoken [mscorlib]System.Boolean
	IL_01f9:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_01fe:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0203:  br IL_0218

	IL_0208:  ldloc 6

	IL_020c:  nop 
	IL_020d:  nop 
	IL_020e:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0213:  br IL_0218

	IL_0218:  ldarg 2

	IL_021c:  nop 
	IL_021d:  nop 
	IL_021e:  ldc.i4 1
	IL_0223:  beq IL_022d

	IL_0228:  br IL_026c

	IL_022d:  ldloc 6

	IL_0231:  nop 
	IL_0232:  nop 
	IL_0233:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::LeftOp
	IL_0238:  ldloc 7

	IL_023c:  nop 
	IL_023d:  nop 
	IL_023e:  stsfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.Helpers::RightOp
	IL_0243:  ldloc 1

	IL_0247:  nop 
	IL_0248:  nop 
	IL_0249:  ldc.i4 1
	IL_024e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitOp(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ops.Op, bool)
	IL_0253:  ldc.i4 0
	IL_0258:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::StringFlg
	IL_025d:  ldc.i4 0
	IL_0262:  stsfld bool dylan.NET.Tokenizer.CodeGen.Helpers::OpCodeSuppFlg
	IL_0267:  br IL_0271

	IL_026c:  br IL_0271

	IL_0271:  br IL_2005

	IL_0276:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral
	IL_027b:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0280:  stloc 8

	IL_0284:  nop 
	IL_0285:  nop 
	IL_0286:  ldloc 8

	IL_028a:  nop 
	IL_028b:  nop 
	IL_028c:  ldarg 1

	IL_0290:  nop 
	IL_0291:  nop 
	IL_0292:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0297:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_029c:  stloc 9

	IL_02a0:  nop 
	IL_02a1:  nop 
	IL_02a2:  ldloc 9

	IL_02a6:  nop 
	IL_02a7:  nop 
	IL_02a8:  ldc.i4 1
	IL_02ad:  beq IL_02b7

	IL_02b2:  br IL_0407

	IL_02b7:  ldarg 1

	IL_02bb:  nop 
	IL_02bc:  nop 
	IL_02bd:  stloc 17

	IL_02c1:  nop 
	IL_02c2:  nop 
	IL_02c3:  ldloc 17

	IL_02c7:  nop 
	IL_02c8:  nop 
	IL_02c9:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_02ce:  stloc 10

	IL_02d2:  nop 
	IL_02d3:  nop 
	IL_02d4:  ldloc 10

	IL_02d8:  nop 
	IL_02d9:  nop 
	IL_02da:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_02df:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_02e4:  ldarg 2

	IL_02e8:  nop 
	IL_02e9:  nop 
	IL_02ea:  ldc.i4 1
	IL_02ef:  beq IL_02f9

	IL_02f4:  br IL_0309

	IL_02f9:  ldloc 17

	IL_02fd:  nop 
	IL_02fe:  nop 
	IL_02ff:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_0304:  br IL_030e

	IL_0309:  br IL_030e

	IL_030e:  ldloc 17

	IL_0312:  nop 
	IL_0313:  nop 
	IL_0314:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberAccessFlg
	IL_0319:  ldc.i4 1
	IL_031e:  beq IL_0328

	IL_0323:  br IL_034e

	IL_0328:  ldc.i4 1
	IL_032d:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0332:  ldarg.0 
	IL_0333:  ldloc 17

	IL_0337:  nop 
	IL_0338:  nop 
	IL_0339:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.StringLiteral::MemberToAccess
	IL_033e:  ldarg 2

	IL_0342:  nop 
	IL_0343:  nop 
	IL_0344:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_0349:  br IL_0353

	IL_034e:  br IL_0353

	IL_0353:  ldloc 17

	IL_0357:  nop 
	IL_0358:  nop 
	IL_0359:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_035e:  ldc.i4 1
	IL_0363:  beq IL_036d

	IL_0368:  br IL_03f8

	IL_036d:  ldarg 2

	IL_0371:  nop 
	IL_0372:  nop 
	IL_0373:  ldc.i4 1
	IL_0378:  beq IL_0382

	IL_037d:  br IL_0392

	IL_0382:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0387:  stloc 15

	IL_038b:  nop 
	IL_038c:  nop 
	IL_038d:  br IL_0397

	IL_0392:  br IL_0397

	IL_0397:  ldloc 17

	IL_039b:  nop 
	IL_039c:  nop 
	IL_039d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_03a2:  stloc 10

	IL_03a6:  nop 
	IL_03a7:  nop 
	IL_03a8:  ldloc 10

	IL_03ac:  nop 
	IL_03ad:  nop 
	IL_03ae:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_03b3:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_03b8:  ldarg 2

	IL_03bc:  nop 
	IL_03bd:  nop 
	IL_03be:  ldc.i4 1
	IL_03c3:  beq IL_03cd

	IL_03c8:  br IL_03ee

	IL_03cd:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_03d2:  stloc 16

	IL_03d6:  nop 
	IL_03d7:  nop 
	IL_03d8:  ldloc 15

	IL_03dc:  nop 
	IL_03dd:  nop 
	IL_03de:  ldloc 16

	IL_03e2:  nop 
	IL_03e3:  nop 
	IL_03e4:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_03e9:  br IL_03f3

	IL_03ee:  br IL_03f3

	IL_03f3:  br IL_03fd

	IL_03f8:  br IL_03fd

	IL_03fd:  br IL_2000

	IL_0402:  br IL_040c

	IL_0407:  br IL_040c

	IL_040c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal
	IL_0411:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0416:  stloc 8

	IL_041a:  nop 
	IL_041b:  nop 
	IL_041c:  ldloc 8

	IL_0420:  nop 
	IL_0421:  nop 
	IL_0422:  ldarg 1

	IL_0426:  nop 
	IL_0427:  nop 
	IL_0428:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_042d:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0432:  stloc 9

	IL_0436:  nop 
	IL_0437:  nop 
	IL_0438:  ldloc 9

	IL_043c:  nop 
	IL_043d:  nop 
	IL_043e:  ldc.i4 1
	IL_0443:  beq IL_044d

	IL_0448:  br IL_0558

	IL_044d:  ldarg 1

	IL_0451:  nop 
	IL_0452:  nop 
	IL_0453:  stloc 18

	IL_0457:  nop 
	IL_0458:  nop 
	IL_0459:  ldarg 2

	IL_045d:  nop 
	IL_045e:  nop 
	IL_045f:  ldc.i4 1
	IL_0464:  beq IL_046e

	IL_0469:  br IL_047e

	IL_046e:  ldloc 18

	IL_0472:  nop 
	IL_0473:  nop 
	IL_0474:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_0479:  br IL_0483

	IL_047e:  br IL_0483

	IL_0483:  ldloc 18

	IL_0487:  nop 
	IL_0488:  nop 
	IL_0489:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::LitTyp
	IL_048e:  stloc 10

	IL_0492:  nop 
	IL_0493:  nop 
	IL_0494:  ldloc 10

	IL_0498:  nop 
	IL_0499:  nop 
	IL_049a:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_049f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_04a4:  ldloc 18

	IL_04a8:  nop 
	IL_04a9:  nop 
	IL_04aa:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::Conv
	IL_04af:  ldc.i4 1
	IL_04b4:  beq IL_04be

	IL_04b9:  br IL_0549

	IL_04be:  ldarg 2

	IL_04c2:  nop 
	IL_04c3:  nop 
	IL_04c4:  ldc.i4 1
	IL_04c9:  beq IL_04d3

	IL_04ce:  br IL_04e3

	IL_04d3:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_04d8:  stloc 15

	IL_04dc:  nop 
	IL_04dd:  nop 
	IL_04de:  br IL_04e8

	IL_04e3:  br IL_04e8

	IL_04e8:  ldloc 18

	IL_04ec:  nop 
	IL_04ed:  nop 
	IL_04ee:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal::TTok
	IL_04f3:  stloc 10

	IL_04f7:  nop 
	IL_04f8:  nop 
	IL_04f9:  ldloc 10

	IL_04fd:  nop 
	IL_04fe:  nop 
	IL_04ff:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0504:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0509:  ldarg 2

	IL_050d:  nop 
	IL_050e:  nop 
	IL_050f:  ldc.i4 1
	IL_0514:  beq IL_051e

	IL_0519:  br IL_053f

	IL_051e:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0523:  stloc 16

	IL_0527:  nop 
	IL_0528:  nop 
	IL_0529:  ldloc 15

	IL_052d:  nop 
	IL_052e:  nop 
	IL_052f:  ldloc 16

	IL_0533:  nop 
	IL_0534:  nop 
	IL_0535:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_053a:  br IL_0544

	IL_053f:  br IL_0544

	IL_0544:  br IL_054e

	IL_0549:  br IL_054e

	IL_054e:  br IL_2000

	IL_0553:  br IL_055d

	IL_0558:  br IL_055d

	IL_055d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident
	IL_0562:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0567:  stloc 8

	IL_056b:  nop 
	IL_056c:  nop 
	IL_056d:  ldloc 8

	IL_0571:  nop 
	IL_0572:  nop 
	IL_0573:  ldarg 1

	IL_0577:  nop 
	IL_0578:  nop 
	IL_0579:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_057e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0583:  stloc 9

	IL_0587:  nop 
	IL_0588:  nop 
	IL_0589:  ldc.i4 0
	IL_058e:  stloc 23

	IL_0592:  nop 
	IL_0593:  nop 
	IL_0594:  ldc.i4 0
	IL_0599:  stloc 24

	IL_059d:  nop 
	IL_059e:  nop 
	IL_059f:  ldc.i4 0
	IL_05a4:  stloc 26

	IL_05a8:  nop 
	IL_05a9:  nop 
	IL_05aa:  ldc.i4 0
	IL_05af:  stloc 28

	IL_05b3:  nop 
	IL_05b4:  nop 
	IL_05b5:  ldloc 9

	IL_05b9:  nop 
	IL_05ba:  nop 
	IL_05bb:  ldc.i4 1
	IL_05c0:  beq IL_05ca

	IL_05c5:  br IL_0d39

	IL_05ca:  ldarg 1

	IL_05ce:  nop 
	IL_05cf:  nop 
	IL_05d0:  stloc 25

	IL_05d4:  nop 
	IL_05d5:  nop 
	IL_05d6:  ldloc 25

	IL_05da:  nop 
	IL_05db:  nop 
	IL_05dc:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_05e1:  stloc 19

	IL_05e5:  nop 
	IL_05e6:  nop 
	IL_05e7:  ldloc 19

	IL_05eb:  nop 
	IL_05ec:  nop 
	IL_05ed:  ldstr ":"
	IL_05f2:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_05f7:  stloc 31

	IL_05fb:  nop 
	IL_05fc:  nop 
	IL_05fd:  ldc.i4 -1
	IL_0602:  stloc 11

	IL_0606:  nop 
	IL_0607:  nop 
	IL_0608:  ldloc 31

	IL_060c:  nop 
	IL_060d:  nop 
	IL_060e:  ldlen 
	IL_060f:  conv.i4 
	IL_0610:  ldc.i4 1
	IL_0615:  sub 
	IL_0616:  stloc 13

	IL_061a:  nop 
	IL_061b:  nop 
	IL_061c:  ldloc 31

	IL_0620:  nop 
	IL_0621:  nop 
	IL_0622:  ldc.i4 0
	IL_0627:  conv.u 
	IL_0628:  ldelem [mscorlib]System.String
	IL_062d:  ldstr "me"
	IL_0632:  call int32 string::Compare(string, string)
	IL_0637:  stloc 26

	IL_063b:  nop 
	IL_063c:  nop 
	IL_063d:  ldloc 26

	IL_0641:  nop 
	IL_0642:  nop 
	IL_0643:  ldc.i4 0
	IL_0648:  beq IL_0652

	IL_064d:  br IL_0674

	IL_0652:  ldloc 11

	IL_0656:  nop 
	IL_0657:  nop 
	IL_0658:  ldc.i4 1
	IL_065d:  add 
	IL_065e:  stloc 11

	IL_0662:  nop 
	IL_0663:  nop 
	IL_0664:  ldc.i4 1
	IL_0669:  stloc 23

	IL_066d:  nop 
	IL_066e:  nop 
	IL_066f:  br IL_0679

	IL_0674:  br IL_0679

	IL_0679:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_067e:  ldc.i4 0
	IL_0683:  beq IL_068d

	IL_0688:  br IL_0692

	IL_068d:  br IL_06c2

	IL_0692:  ldc.i4 0
	IL_0697:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_069c:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_06a1:  stloc 8

	IL_06a5:  nop 
	IL_06a6:  nop 
	IL_06a7:  ldc.i4 1
	IL_06ac:  stloc 24

	IL_06b0:  nop 
	IL_06b1:  nop 
	IL_06b2:  ldc.i4 0
	IL_06b7:  stloc 28

	IL_06bb:  nop 
	IL_06bc:  nop 
	IL_06bd:  br IL_06c2

	IL_06c2:  ldloc 11

	IL_06c6:  nop 
	IL_06c7:  nop 
	IL_06c8:  ldc.i4 1
	IL_06cd:  add 
	IL_06ce:  stloc 11

	IL_06d2:  nop 
	IL_06d3:  nop 
	IL_06d4:  ldloc 11

	IL_06d8:  nop 
	IL_06d9:  nop 
	IL_06da:  ldloc 13

	IL_06de:  nop 
	IL_06df:  nop 
	IL_06e0:  beq IL_06f9

	IL_06e5:  br IL_06ea

	IL_06ea:  ldc.i4 1
	IL_06ef:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_06f4:  br IL_0708

	IL_06f9:  ldc.i4 0
	IL_06fe:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0703:  br IL_0708

	IL_0708:  ldloc 24

	IL_070c:  nop 
	IL_070d:  nop 
	IL_070e:  ldc.i4 0
	IL_0713:  beq IL_071d

	IL_0718:  br IL_09ff

	IL_071d:  ldloc 23

	IL_0721:  nop 
	IL_0722:  nop 
	IL_0723:  ldc.i4 0
	IL_0728:  beq IL_0732

	IL_072d:  br IL_08d6

	IL_0732:  ldloc 31

	IL_0736:  nop 
	IL_0737:  nop 
	IL_0738:  ldloc 11

	IL_073c:  nop 
	IL_073d:  nop 
	IL_073e:  conv.u 
	IL_073f:  ldelem [mscorlib]System.String
	IL_0744:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_0749:  stloc 20

	IL_074d:  nop 
	IL_074e:  nop 
	IL_074f:  ldloc 20

	IL_0753:  nop 
	IL_0754:  nop 
	IL_0755:  ldnull 
	IL_0756:  beq IL_07d5

	IL_075b:  br IL_0760

	IL_0760:  ldarg 2

	IL_0764:  nop 
	IL_0765:  nop 
	IL_0766:  ldc.i4 1
	IL_076b:  beq IL_0775

	IL_0770:  br IL_07a5

	IL_0775:  ldloc 20

	IL_0779:  nop 
	IL_077a:  nop 
	IL_077b:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_0780:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0785:  ldloc 20

	IL_0789:  nop 
	IL_078a:  nop 
	IL_078b:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_0790:  ldloc 20

	IL_0794:  nop 
	IL_0795:  nop 
	IL_0796:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_079b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_07a0:  br IL_07aa

	IL_07a5:  br IL_07aa

	IL_07aa:  ldloc 20

	IL_07ae:  nop 
	IL_07af:  nop 
	IL_07b0:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_07b5:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_07ba:  ldloc 20

	IL_07be:  nop 
	IL_07bf:  nop 
	IL_07c0:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_07c5:  stloc 8

	IL_07c9:  nop 
	IL_07ca:  nop 
	IL_07cb:  br IL_0c0b

	IL_07d0:  br IL_08d1

	IL_07d5:  ldloc 31

	IL_07d9:  nop 
	IL_07da:  nop 
	IL_07db:  ldloc 11

	IL_07df:  nop 
	IL_07e0:  nop 
	IL_07e1:  conv.u 
	IL_07e2:  ldelem [mscorlib]System.String
	IL_07e7:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_07ec:  stloc 22

	IL_07f0:  nop 
	IL_07f1:  nop 
	IL_07f2:  ldloc 22

	IL_07f6:  nop 
	IL_07f7:  nop 
	IL_07f8:  ldnull 
	IL_07f9:  beq IL_08c7

	IL_07fe:  br IL_0803

	IL_0803:  ldloc 22

	IL_0807:  nop 
	IL_0808:  nop 
	IL_0809:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_080e:  stloc 28

	IL_0812:  nop 
	IL_0813:  nop 
	IL_0814:  ldloc 28

	IL_0818:  nop 
	IL_0819:  nop 
	IL_081a:  ldc.i4 0
	IL_081f:  beq IL_0829

	IL_0824:  br IL_0857

	IL_0829:  ldarg 2

	IL_082d:  nop 
	IL_082e:  nop 
	IL_082f:  ldc.i4 1
	IL_0834:  beq IL_083e

	IL_0839:  br IL_084d

	IL_083e:  ldc.i4 0
	IL_0843:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_0848:  br IL_0852

	IL_084d:  br IL_0852

	IL_0852:  br IL_085c

	IL_0857:  br IL_085c

	IL_085c:  ldarg 2

	IL_0860:  nop 
	IL_0861:  nop 
	IL_0862:  ldc.i4 1
	IL_0867:  beq IL_0871

	IL_086c:  br IL_0897

	IL_0871:  ldloc 22

	IL_0875:  nop 
	IL_0876:  nop 
	IL_0877:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_087c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0881:  ldloc 22

	IL_0885:  nop 
	IL_0886:  nop 
	IL_0887:  ldloc 28

	IL_088b:  nop 
	IL_088c:  nop 
	IL_088d:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0892:  br IL_089c

	IL_0897:  br IL_089c

	IL_089c:  ldloc 22

	IL_08a0:  nop 
	IL_08a1:  nop 
	IL_08a2:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_08a7:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_08ac:  ldloc 22

	IL_08b0:  nop 
	IL_08b1:  nop 
	IL_08b2:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_08b7:  stloc 8

	IL_08bb:  nop 
	IL_08bc:  nop 
	IL_08bd:  br IL_0c0b

	IL_08c2:  br IL_08cc

	IL_08c7:  br IL_08cc

	IL_08cc:  br IL_08d1

	IL_08d1:  br IL_09d2

	IL_08d6:  ldloc 31

	IL_08da:  nop 
	IL_08db:  nop 
	IL_08dc:  ldloc 11

	IL_08e0:  nop 
	IL_08e1:  nop 
	IL_08e2:  conv.u 
	IL_08e3:  ldelem [mscorlib]System.String
	IL_08e8:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_08ed:  stloc 22

	IL_08f1:  nop 
	IL_08f2:  nop 
	IL_08f3:  ldloc 22

	IL_08f7:  nop 
	IL_08f8:  nop 
	IL_08f9:  ldnull 
	IL_08fa:  beq IL_09c8

	IL_08ff:  br IL_0904

	IL_0904:  ldloc 22

	IL_0908:  nop 
	IL_0909:  nop 
	IL_090a:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_090f:  stloc 28

	IL_0913:  nop 
	IL_0914:  nop 
	IL_0915:  ldloc 28

	IL_0919:  nop 
	IL_091a:  nop 
	IL_091b:  ldc.i4 0
	IL_0920:  beq IL_092a

	IL_0925:  br IL_0958

	IL_092a:  ldarg 2

	IL_092e:  nop 
	IL_092f:  nop 
	IL_0930:  ldc.i4 1
	IL_0935:  beq IL_093f

	IL_093a:  br IL_094e

	IL_093f:  ldc.i4 0
	IL_0944:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_0949:  br IL_0953

	IL_094e:  br IL_0953

	IL_0953:  br IL_095d

	IL_0958:  br IL_095d

	IL_095d:  ldarg 2

	IL_0961:  nop 
	IL_0962:  nop 
	IL_0963:  ldc.i4 1
	IL_0968:  beq IL_0972

	IL_096d:  br IL_0998

	IL_0972:  ldloc 22

	IL_0976:  nop 
	IL_0977:  nop 
	IL_0978:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_097d:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0982:  ldloc 22

	IL_0986:  nop 
	IL_0987:  nop 
	IL_0988:  ldloc 28

	IL_098c:  nop 
	IL_098d:  nop 
	IL_098e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0993:  br IL_099d

	IL_0998:  br IL_099d

	IL_099d:  ldloc 22

	IL_09a1:  nop 
	IL_09a2:  nop 
	IL_09a3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_09a8:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_09ad:  ldloc 22

	IL_09b1:  nop 
	IL_09b2:  nop 
	IL_09b3:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_09b8:  stloc 8

	IL_09bc:  nop 
	IL_09bd:  nop 
	IL_09be:  br IL_0c0b

	IL_09c3:  br IL_09cd

	IL_09c8:  br IL_09cd

	IL_09cd:  br IL_09d2

	IL_09d2:  ldloc 31

	IL_09d6:  nop 
	IL_09d7:  nop 
	IL_09d8:  ldloc 11

	IL_09dc:  nop 
	IL_09dd:  nop 
	IL_09de:  conv.u 
	IL_09df:  ldelem [mscorlib]System.String
	IL_09e4:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_09e9:  stloc 8

	IL_09ed:  nop 
	IL_09ee:  nop 
	IL_09ef:  ldc.i4 1
	IL_09f4:  stloc 28

	IL_09f8:  nop 
	IL_09f9:  nop 
	IL_09fa:  br IL_0c0b

	IL_09ff:  ldloc 8

	IL_0a03:  nop 
	IL_0a04:  nop 
	IL_0a05:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0a0a:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_0a0f:  stloc 9

	IL_0a13:  nop 
	IL_0a14:  nop 
	IL_0a15:  ldloc 9

	IL_0a19:  nop 
	IL_0a1a:  nop 
	IL_0a1b:  ldc.i4 0
	IL_0a20:  beq IL_0a2a

	IL_0a25:  br IL_0b59

	IL_0a2a:  ldloc 8

	IL_0a2e:  nop 
	IL_0a2f:  nop 
	IL_0a30:  ldloc 31

	IL_0a34:  nop 
	IL_0a35:  nop 
	IL_0a36:  ldloc 11

	IL_0a3a:  nop 
	IL_0a3b:  nop 
	IL_0a3c:  conv.u 
	IL_0a3d:  ldelem [mscorlib]System.String
	IL_0a42:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_0a47:  stloc 22

	IL_0a4b:  nop 
	IL_0a4c:  nop 
	IL_0a4d:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0a52:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0a57:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0a5c:  stloc 8

	IL_0a60:  nop 
	IL_0a61:  nop 
	IL_0a62:  ldarg 2

	IL_0a66:  nop 
	IL_0a67:  nop 
	IL_0a68:  ldc.i4 1
	IL_0a6d:  beq IL_0a77

	IL_0a72:  br IL_0b4f

	IL_0a77:  ldsfld bool [dnr]dylan.NET.Reflection.Loader::FldLitFlag
	IL_0a7c:  ldc.i4 0
	IL_0a81:  beq IL_0a8b

	IL_0a86:  br IL_0aab

	IL_0a8b:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_0a90:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0a95:  ldloc 22

	IL_0a99:  nop 
	IL_0a9a:  nop 
	IL_0a9b:  ldloc 28

	IL_0a9f:  nop 
	IL_0aa0:  nop 
	IL_0aa1:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0aa6:  br IL_0b4a

	IL_0aab:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::'.ctor'()
	IL_0ab0:  stloc 32

	IL_0ab4:  nop 
	IL_0ab5:  nop 
	IL_0ab6:  ldloc 32

	IL_0aba:  nop 
	IL_0abb:  nop 
	IL_0abc:  ldsfld object [dnr]dylan.NET.Reflection.Loader::FldLitVal
	IL_0ac1:  stfld object [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ConstVal
	IL_0ac6:  ldloc 32

	IL_0aca:  nop 
	IL_0acb:  nop 
	IL_0acc:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0ad1:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::ExtTyp
	IL_0ad6:  ldsfld bool [dnr]dylan.NET.Reflection.Loader::EnumLitFlag
	IL_0adb:  ldc.i4 1
	IL_0ae0:  beq IL_0aea

	IL_0ae5:  br IL_0aff

	IL_0aea:  ldloc 32

	IL_0aee:  nop 
	IL_0aef:  nop 
	IL_0af0:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::EnumLitTyp
	IL_0af5:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_0afa:  br IL_0b14

	IL_0aff:  ldloc 32

	IL_0b03:  nop 
	IL_0b04:  nop 
	IL_0b05:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0b0a:  stfld class [mscorlib]System.Type [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral::IntTyp
	IL_0b0f:  br IL_0b14

	IL_0b14:  ldloc 32

	IL_0b18:  nop 
	IL_0b19:  nop 
	IL_0b1a:  call class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessConst(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.ConstLiteral)
	IL_0b1f:  stloc 33

	IL_0b23:  nop 
	IL_0b24:  nop 
	IL_0b25:  ldloc 33

	IL_0b29:  nop 
	IL_0b2a:  nop 
	IL_0b2b:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLiteral(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Literals.Literal)
	IL_0b30:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0b35:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0b3a:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::FldLitTyp
	IL_0b3f:  stloc 8

	IL_0b43:  nop 
	IL_0b44:  nop 
	IL_0b45:  br IL_0b4a

	IL_0b4a:  br IL_0b54

	IL_0b4f:  br IL_0b54

	IL_0b54:  br IL_0bdc

	IL_0b59:  ldloc 31

	IL_0b5d:  nop 
	IL_0b5e:  nop 
	IL_0b5f:  ldloc 11

	IL_0b63:  nop 
	IL_0b64:  nop 
	IL_0b65:  conv.u 
	IL_0b66:  ldelem [mscorlib]System.String
	IL_0b6b:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_0b70:  stloc 22

	IL_0b74:  nop 
	IL_0b75:  nop 
	IL_0b76:  ldarg 2

	IL_0b7a:  nop 
	IL_0b7b:  nop 
	IL_0b7c:  ldc.i4 1
	IL_0b81:  beq IL_0b8b

	IL_0b86:  br IL_0bb1

	IL_0b8b:  ldloc 22

	IL_0b8f:  nop 
	IL_0b90:  nop 
	IL_0b91:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0b96:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_0b9b:  ldloc 22

	IL_0b9f:  nop 
	IL_0ba0:  nop 
	IL_0ba1:  ldloc 28

	IL_0ba5:  nop 
	IL_0ba6:  nop 
	IL_0ba7:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_0bac:  br IL_0bb6

	IL_0bb1:  br IL_0bb6

	IL_0bb6:  ldloc 22

	IL_0bba:  nop 
	IL_0bbb:  nop 
	IL_0bbc:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0bc1:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0bc6:  ldloc 22

	IL_0bca:  nop 
	IL_0bcb:  nop 
	IL_0bcc:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_0bd1:  stloc 8

	IL_0bd5:  nop 
	IL_0bd6:  nop 
	IL_0bd7:  br IL_0bdc

	IL_0bdc:  ldloc 28

	IL_0be0:  nop 
	IL_0be1:  nop 
	IL_0be2:  ldc.i4 1
	IL_0be7:  beq IL_0bf1

	IL_0bec:  br IL_0c01

	IL_0bf1:  ldc.i4 0
	IL_0bf6:  stloc 28

	IL_0bfa:  nop 
	IL_0bfb:  nop 
	IL_0bfc:  br IL_0c06

	IL_0c01:  br IL_0c06

	IL_0c06:  br IL_0c0b

	IL_0c0b:  ldc.i4 1
	IL_0c10:  stloc 24

	IL_0c14:  nop 
	IL_0c15:  nop 
	IL_0c16:  ldloc 11

	IL_0c1a:  nop 
	IL_0c1b:  nop 
	IL_0c1c:  ldloc 13

	IL_0c20:  nop 
	IL_0c21:  nop 
	IL_0c22:  beq IL_0c2c

	IL_0c27:  br IL_0c36

	IL_0c2c:  br IL_0c40

	IL_0c31:  br IL_0c40

	IL_0c36:  br IL_06c2

	IL_0c3b:  br IL_0c40

	IL_0c40:  ldloc 25

	IL_0c44:  nop 
	IL_0c45:  nop 
	IL_0c46:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_0c4b:  ldc.i4 1
	IL_0c50:  beq IL_0c5a

	IL_0c55:  br IL_0c80

	IL_0c5a:  ldc.i4 1
	IL_0c5f:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0c64:  ldarg.0 
	IL_0c65:  ldloc 25

	IL_0c69:  nop 
	IL_0c6a:  nop 
	IL_0c6b:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_0c70:  ldarg 2

	IL_0c74:  nop 
	IL_0c75:  nop 
	IL_0c76:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_0c7b:  br IL_0c85

	IL_0c80:  br IL_0c85

	IL_0c85:  ldloc 25

	IL_0c89:  nop 
	IL_0c8a:  nop 
	IL_0c8b:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_0c90:  ldc.i4 1
	IL_0c95:  beq IL_0c9f

	IL_0c9a:  br IL_0d2a

	IL_0c9f:  ldarg 2

	IL_0ca3:  nop 
	IL_0ca4:  nop 
	IL_0ca5:  ldc.i4 1
	IL_0caa:  beq IL_0cb4

	IL_0caf:  br IL_0cc4

	IL_0cb4:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0cb9:  stloc 15

	IL_0cbd:  nop 
	IL_0cbe:  nop 
	IL_0cbf:  br IL_0cc9

	IL_0cc4:  br IL_0cc9

	IL_0cc9:  ldloc 25

	IL_0ccd:  nop 
	IL_0cce:  nop 
	IL_0ccf:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_0cd4:  stloc 10

	IL_0cd8:  nop 
	IL_0cd9:  nop 
	IL_0cda:  ldloc 10

	IL_0cde:  nop 
	IL_0cdf:  nop 
	IL_0ce0:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0ce5:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0cea:  ldarg 2

	IL_0cee:  nop 
	IL_0cef:  nop 
	IL_0cf0:  ldc.i4 1
	IL_0cf5:  beq IL_0cff

	IL_0cfa:  br IL_0d20

	IL_0cff:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0d04:  stloc 16

	IL_0d08:  nop 
	IL_0d09:  nop 
	IL_0d0a:  ldloc 15

	IL_0d0e:  nop 
	IL_0d0f:  nop 
	IL_0d10:  ldloc 16

	IL_0d14:  nop 
	IL_0d15:  nop 
	IL_0d16:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_0d1b:  br IL_0d25

	IL_0d20:  br IL_0d25

	IL_0d25:  br IL_0d2f

	IL_0d2a:  br IL_0d2f

	IL_0d2f:  br IL_2000

	IL_0d34:  br IL_0d3e

	IL_0d39:  br IL_0d3e

	IL_0d3e:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok
	IL_0d43:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d48:  stloc 8

	IL_0d4c:  nop 
	IL_0d4d:  nop 
	IL_0d4e:  ldloc 8

	IL_0d52:  nop 
	IL_0d53:  nop 
	IL_0d54:  ldarg 1

	IL_0d58:  nop 
	IL_0d59:  nop 
	IL_0d5a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_0d5f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0d64:  stloc 9

	IL_0d68:  nop 
	IL_0d69:  nop 
	IL_0d6a:  ldloc 9

	IL_0d6e:  nop 
	IL_0d6f:  nop 
	IL_0d70:  ldc.i4 1
	IL_0d75:  beq IL_0d7f

	IL_0d7a:  br IL_19de

	IL_0d7f:  ldarg 1

	IL_0d83:  nop 
	IL_0d84:  nop 
	IL_0d85:  stloc 38

	IL_0d89:  nop 
	IL_0d8a:  nop 
	IL_0d8b:  ldloc 38

	IL_0d8f:  nop 
	IL_0d90:  nop 
	IL_0d91:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Name
	IL_0d96:  stloc 39

	IL_0d9a:  nop 
	IL_0d9b:  nop 
	IL_0d9c:  ldstr ""
	IL_0da1:  stloc 40

	IL_0da5:  nop 
	IL_0da6:  nop 
	IL_0da7:  ldc.i4 0
	IL_0dac:  conv.u 
	IL_0dad:  newarr [mscorlib]System.Type
	IL_0db2:  stloc 42

	IL_0db6:  nop 
	IL_0db7:  nop 
	IL_0db8:  ldc.i4 0
	IL_0dbd:  stloc 51

	IL_0dc1:  nop 
	IL_0dc2:  nop 
	IL_0dc3:  ldc.i4 0
	IL_0dc8:  stloc 52

	IL_0dcc:  nop 
	IL_0dcd:  nop 
	IL_0dce:  ldc.i4 2
	IL_0dd3:  stloc 53

	IL_0dd7:  nop 
	IL_0dd8:  nop 
	IL_0dd9:  ldloc 39

	IL_0ddd:  nop 
	IL_0dde:  nop 
	IL_0ddf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0de4:  stloc 40

	IL_0de8:  nop 
	IL_0de9:  nop 
	IL_0dea:  ldloc 40

	IL_0dee:  nop 
	IL_0def:  nop 
	IL_0df0:  ldstr ":"
	IL_0df5:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_0dfa:  stloc 35

	IL_0dfe:  nop 
	IL_0dff:  nop 
	IL_0e00:  ldloc 38

	IL_0e04:  nop 
	IL_0e05:  nop 
	IL_0e06:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::Params
	IL_0e0b:  stloc 41

	IL_0e0f:  nop 
	IL_0e10:  nop 
	IL_0e11:  ldloc 41

	IL_0e15:  nop 
	IL_0e16:  nop 
	IL_0e17:  ldlen 
	IL_0e18:  conv.i4 
	IL_0e19:  ldc.i4 1
	IL_0e1e:  sub 
	IL_0e1f:  stloc 44

	IL_0e23:  nop 
	IL_0e24:  nop 
	IL_0e25:  ldc.i4 0
	IL_0e2a:  stloc 23

	IL_0e2e:  nop 
	IL_0e2f:  nop 
	IL_0e30:  ldc.i4 0
	IL_0e35:  stloc 24

	IL_0e39:  nop 
	IL_0e3a:  nop 
	IL_0e3b:  ldnull 
	IL_0e3c:  stloc 34

	IL_0e40:  nop 
	IL_0e41:  nop 
	IL_0e42:  ldnull 
	IL_0e43:  stloc 36

	IL_0e47:  nop 
	IL_0e48:  nop 
	IL_0e49:  ldnull 
	IL_0e4a:  stloc 49

	IL_0e4e:  nop 
	IL_0e4f:  nop 
	IL_0e50:  ldloc 40

	IL_0e54:  nop 
	IL_0e55:  nop 
	IL_0e56:  ldstr "me::ctor"
	IL_0e5b:  call int32 string::Compare(string, string)
	IL_0e60:  stloc 26

	IL_0e64:  nop 
	IL_0e65:  nop 
	IL_0e66:  ldloc 26

	IL_0e6a:  nop 
	IL_0e6b:  nop 
	IL_0e6c:  ldc.i4 0
	IL_0e71:  beq IL_0e7b

	IL_0e76:  br IL_0e8b

	IL_0e7b:  ldc.i4 1
	IL_0e80:  stloc 52

	IL_0e84:  nop 
	IL_0e85:  nop 
	IL_0e86:  br IL_0e90

	IL_0e8b:  br IL_0e90

	IL_0e90:  ldc.i4 -1
	IL_0e95:  stloc 11

	IL_0e99:  nop 
	IL_0e9a:  nop 
	IL_0e9b:  ldloc 40

	IL_0e9f:  nop 
	IL_0ea0:  nop 
	IL_0ea1:  ldstr ":"
	IL_0ea6:  call string[] class [dnu]dylan.NET.Utils.ParseUtils::StringParser(string, string)
	IL_0eab:  stloc 35

	IL_0eaf:  nop 
	IL_0eb0:  nop 
	IL_0eb1:  ldloc 35

	IL_0eb5:  nop 
	IL_0eb6:  nop 
	IL_0eb7:  ldlen 
	IL_0eb8:  conv.i4 
	IL_0eb9:  ldc.i4 2
	IL_0ebe:  sub 
	IL_0ebf:  stloc 13

	IL_0ec3:  nop 
	IL_0ec4:  nop 
	IL_0ec5:  ldloc 35

	IL_0ec9:  nop 
	IL_0eca:  nop 
	IL_0ecb:  ldc.i4 0
	IL_0ed0:  conv.u 
	IL_0ed1:  ldelem [mscorlib]System.String
	IL_0ed6:  ldstr "me"
	IL_0edb:  call int32 string::Compare(string, string)
	IL_0ee0:  stloc 26

	IL_0ee4:  nop 
	IL_0ee5:  nop 
	IL_0ee6:  ldloc 26

	IL_0eea:  nop 
	IL_0eeb:  nop 
	IL_0eec:  ldc.i4 0
	IL_0ef1:  beq IL_0efb

	IL_0ef6:  br IL_0f28

	IL_0efb:  ldloc 11

	IL_0eff:  nop 
	IL_0f00:  nop 
	IL_0f01:  ldc.i4 1
	IL_0f06:  add 
	IL_0f07:  stloc 11

	IL_0f0b:  nop 
	IL_0f0c:  nop 
	IL_0f0d:  ldc.i4 1
	IL_0f12:  stloc 23

	IL_0f16:  nop 
	IL_0f17:  nop 
	IL_0f18:  ldc.i4 3
	IL_0f1d:  stloc 53

	IL_0f21:  nop 
	IL_0f22:  nop 
	IL_0f23:  br IL_0f2d

	IL_0f28:  br IL_0f2d

	IL_0f2d:  ldloc 52

	IL_0f31:  nop 
	IL_0f32:  nop 
	IL_0f33:  ldc.i4 0
	IL_0f38:  beq IL_0f42

	IL_0f3d:  br IL_1434

	IL_0f42:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0f47:  ldc.i4 1
	IL_0f4c:  beq IL_0f56

	IL_0f51:  br IL_0f86

	IL_0f56:  ldc.i4 0
	IL_0f5b:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_0f60:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_0f65:  stloc 34

	IL_0f69:  nop 
	IL_0f6a:  nop 
	IL_0f6b:  ldc.i4 1
	IL_0f70:  stloc 24

	IL_0f74:  nop 
	IL_0f75:  nop 
	IL_0f76:  ldc.i4 0
	IL_0f7b:  stloc 51

	IL_0f7f:  nop 
	IL_0f80:  nop 
	IL_0f81:  br IL_0f8b

	IL_0f86:  br IL_0f8b

	IL_0f8b:  ldloc 35

	IL_0f8f:  nop 
	IL_0f90:  nop 
	IL_0f91:  ldlen 
	IL_0f92:  conv.i4 
	IL_0f93:  stloc 26

	IL_0f97:  nop 
	IL_0f98:  nop 
	IL_0f99:  ldloc 26

	IL_0f9d:  nop 
	IL_0f9e:  nop 
	IL_0f9f:  ldloc 53

	IL_0fa3:  nop 
	IL_0fa4:  nop 
	IL_0fa5:  bge IL_0faf

	IL_0faa:  br IL_142a

	IL_0faf:  ldc.i4 1
	IL_0fb4:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_0fb9:  ldloc 11

	IL_0fbd:  nop 
	IL_0fbe:  nop 
	IL_0fbf:  ldc.i4 1
	IL_0fc4:  add 
	IL_0fc5:  stloc 11

	IL_0fc9:  nop 
	IL_0fca:  nop 
	IL_0fcb:  ldloc 24

	IL_0fcf:  nop 
	IL_0fd0:  nop 
	IL_0fd1:  ldc.i4 0
	IL_0fd6:  beq IL_0fe0

	IL_0fdb:  br IL_12c2

	IL_0fe0:  ldloc 23

	IL_0fe4:  nop 
	IL_0fe5:  nop 
	IL_0fe6:  ldc.i4 0
	IL_0feb:  beq IL_0ff5

	IL_0ff0:  br IL_1199

	IL_0ff5:  ldloc 35

	IL_0ff9:  nop 
	IL_0ffa:  nop 
	IL_0ffb:  ldloc 11

	IL_0fff:  nop 
	IL_1000:  nop 
	IL_1001:  conv.u 
	IL_1002:  ldelem [mscorlib]System.String
	IL_1007:  call class dylan.NET.Tokenizer.CodeGen.VarItem class dylan.NET.Tokenizer.CodeGen.SymTable::FindVar(string)
	IL_100c:  stloc 50

	IL_1010:  nop 
	IL_1011:  nop 
	IL_1012:  ldloc 50

	IL_1016:  nop 
	IL_1017:  nop 
	IL_1018:  ldnull 
	IL_1019:  beq IL_1098

	IL_101e:  br IL_1023

	IL_1023:  ldarg 2

	IL_1027:  nop 
	IL_1028:  nop 
	IL_1029:  ldc.i4 1
	IL_102e:  beq IL_1038

	IL_1033:  br IL_1068

	IL_1038:  ldloc 50

	IL_103c:  nop 
	IL_103d:  nop 
	IL_103e:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_1043:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1048:  ldloc 50

	IL_104c:  nop 
	IL_104d:  nop 
	IL_104e:  ldfld int32 dylan.NET.Tokenizer.CodeGen.VarItem::Index
	IL_1053:  ldloc 50

	IL_1057:  nop 
	IL_1058:  nop 
	IL_1059:  ldfld bool dylan.NET.Tokenizer.CodeGen.VarItem::LocArg
	IL_105e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitLocLd(int32, bool)
	IL_1063:  br IL_106d

	IL_1068:  br IL_106d

	IL_106d:  ldloc 50

	IL_1071:  nop 
	IL_1072:  nop 
	IL_1073:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_1078:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_107d:  ldloc 50

	IL_1081:  nop 
	IL_1082:  nop 
	IL_1083:  ldfld class [mscorlib]System.Type dylan.NET.Tokenizer.CodeGen.VarItem::VarTyp
	IL_1088:  stloc 34

	IL_108c:  nop 
	IL_108d:  nop 
	IL_108e:  br IL_13e6

	IL_1093:  br IL_1194

	IL_1098:  ldloc 35

	IL_109c:  nop 
	IL_109d:  nop 
	IL_109e:  ldloc 11

	IL_10a2:  nop 
	IL_10a3:  nop 
	IL_10a4:  conv.u 
	IL_10a5:  ldelem [mscorlib]System.String
	IL_10aa:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_10af:  stloc 49

	IL_10b3:  nop 
	IL_10b4:  nop 
	IL_10b5:  ldloc 49

	IL_10b9:  nop 
	IL_10ba:  nop 
	IL_10bb:  ldnull 
	IL_10bc:  beq IL_118a

	IL_10c1:  br IL_10c6

	IL_10c6:  ldloc 49

	IL_10ca:  nop 
	IL_10cb:  nop 
	IL_10cc:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_10d1:  stloc 28

	IL_10d5:  nop 
	IL_10d6:  nop 
	IL_10d7:  ldloc 28

	IL_10db:  nop 
	IL_10dc:  nop 
	IL_10dd:  ldc.i4 0
	IL_10e2:  beq IL_10ec

	IL_10e7:  br IL_111a

	IL_10ec:  ldarg 2

	IL_10f0:  nop 
	IL_10f1:  nop 
	IL_10f2:  ldc.i4 1
	IL_10f7:  beq IL_1101

	IL_10fc:  br IL_1110

	IL_1101:  ldc.i4 0
	IL_1106:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_110b:  br IL_1115

	IL_1110:  br IL_1115

	IL_1115:  br IL_111f

	IL_111a:  br IL_111f

	IL_111f:  ldarg 2

	IL_1123:  nop 
	IL_1124:  nop 
	IL_1125:  ldc.i4 1
	IL_112a:  beq IL_1134

	IL_112f:  br IL_115a

	IL_1134:  ldloc 49

	IL_1138:  nop 
	IL_1139:  nop 
	IL_113a:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_113f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1144:  ldloc 49

	IL_1148:  nop 
	IL_1149:  nop 
	IL_114a:  ldloc 28

	IL_114e:  nop 
	IL_114f:  nop 
	IL_1150:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_1155:  br IL_115f

	IL_115a:  br IL_115f

	IL_115f:  ldloc 49

	IL_1163:  nop 
	IL_1164:  nop 
	IL_1165:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_116a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_116f:  ldloc 49

	IL_1173:  nop 
	IL_1174:  nop 
	IL_1175:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_117a:  stloc 34

	IL_117e:  nop 
	IL_117f:  nop 
	IL_1180:  br IL_13e6

	IL_1185:  br IL_118f

	IL_118a:  br IL_118f

	IL_118f:  br IL_1194

	IL_1194:  br IL_1295

	IL_1199:  ldloc 35

	IL_119d:  nop 
	IL_119e:  nop 
	IL_119f:  ldloc 11

	IL_11a3:  nop 
	IL_11a4:  nop 
	IL_11a5:  conv.u 
	IL_11a6:  ldelem [mscorlib]System.String
	IL_11ab:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_11b0:  stloc 49

	IL_11b4:  nop 
	IL_11b5:  nop 
	IL_11b6:  ldloc 49

	IL_11ba:  nop 
	IL_11bb:  nop 
	IL_11bc:  ldnull 
	IL_11bd:  beq IL_128b

	IL_11c2:  br IL_11c7

	IL_11c7:  ldloc 49

	IL_11cb:  nop 
	IL_11cc:  nop 
	IL_11cd:  callvirt instance bool class [mscorlib]System.Reflection.FieldInfo::get_IsStatic()
	IL_11d2:  stloc 28

	IL_11d6:  nop 
	IL_11d7:  nop 
	IL_11d8:  ldloc 28

	IL_11dc:  nop 
	IL_11dd:  nop 
	IL_11de:  ldc.i4 0
	IL_11e3:  beq IL_11ed

	IL_11e8:  br IL_121b

	IL_11ed:  ldarg 2

	IL_11f1:  nop 
	IL_11f2:  nop 
	IL_11f3:  ldc.i4 1
	IL_11f8:  beq IL_1202

	IL_11fd:  br IL_1211

	IL_1202:  ldc.i4 0
	IL_1207:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_120c:  br IL_1216

	IL_1211:  br IL_1216

	IL_1216:  br IL_1220

	IL_121b:  br IL_1220

	IL_1220:  ldarg 2

	IL_1224:  nop 
	IL_1225:  nop 
	IL_1226:  ldc.i4 1
	IL_122b:  beq IL_1235

	IL_1230:  br IL_125b

	IL_1235:  ldloc 49

	IL_1239:  nop 
	IL_123a:  nop 
	IL_123b:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_1240:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1245:  ldloc 49

	IL_1249:  nop 
	IL_124a:  nop 
	IL_124b:  ldloc 28

	IL_124f:  nop 
	IL_1250:  nop 
	IL_1251:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_1256:  br IL_1260

	IL_125b:  br IL_1260

	IL_1260:  ldloc 49

	IL_1264:  nop 
	IL_1265:  nop 
	IL_1266:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_126b:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1270:  ldloc 49

	IL_1274:  nop 
	IL_1275:  nop 
	IL_1276:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_127b:  stloc 34

	IL_127f:  nop 
	IL_1280:  nop 
	IL_1281:  br IL_13e6

	IL_1286:  br IL_1290

	IL_128b:  br IL_1290

	IL_1290:  br IL_1295

	IL_1295:  ldloc 35

	IL_1299:  nop 
	IL_129a:  nop 
	IL_129b:  ldloc 11

	IL_129f:  nop 
	IL_12a0:  nop 
	IL_12a1:  conv.u 
	IL_12a2:  ldelem [mscorlib]System.String
	IL_12a7:  call class [mscorlib]System.Type class [dnr]dylan.NET.Reflection.Loader::LoadClass(string)
	IL_12ac:  stloc 34

	IL_12b0:  nop 
	IL_12b1:  nop 
	IL_12b2:  ldc.i4 1
	IL_12b7:  stloc 51

	IL_12bb:  nop 
	IL_12bc:  nop 
	IL_12bd:  br IL_13e6

	IL_12c2:  ldloc 34

	IL_12c6:  nop 
	IL_12c7:  nop 
	IL_12c8:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_12cd:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_12d2:  stloc 9

	IL_12d6:  nop 
	IL_12d7:  nop 
	IL_12d8:  ldloc 9

	IL_12dc:  nop 
	IL_12dd:  nop 
	IL_12de:  ldc.i4 0
	IL_12e3:  beq IL_12ed

	IL_12e8:  br IL_1334

	IL_12ed:  ldloc 34

	IL_12f1:  nop 
	IL_12f2:  nop 
	IL_12f3:  ldloc 35

	IL_12f7:  nop 
	IL_12f8:  nop 
	IL_12f9:  ldloc 11

	IL_12fd:  nop 
	IL_12fe:  nop 
	IL_12ff:  conv.u 
	IL_1300:  ldelem [mscorlib]System.String
	IL_1305:  call class [mscorlib]System.Reflection.FieldInfo class [dnr]dylan.NET.Reflection.Loader::LoadField(class [mscorlib]System.Type, string)
	IL_130a:  stloc 49

	IL_130e:  nop 
	IL_130f:  nop 
	IL_1310:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_1315:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_131a:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_131f:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1324:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_1329:  stloc 34

	IL_132d:  nop 
	IL_132e:  nop 
	IL_132f:  br IL_1387

	IL_1334:  ldloc 35

	IL_1338:  nop 
	IL_1339:  nop 
	IL_133a:  ldloc 11

	IL_133e:  nop 
	IL_133f:  nop 
	IL_1340:  conv.u 
	IL_1341:  ldelem [mscorlib]System.String
	IL_1346:  call class [mscorlib]System.Reflection.FieldInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocFld(string)
	IL_134b:  stloc 49

	IL_134f:  nop 
	IL_1350:  nop 
	IL_1351:  ldloc 49

	IL_1355:  nop 
	IL_1356:  nop 
	IL_1357:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_135c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1361:  ldloc 49

	IL_1365:  nop 
	IL_1366:  nop 
	IL_1367:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_136c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type04
	IL_1371:  ldloc 49

	IL_1375:  nop 
	IL_1376:  nop 
	IL_1377:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.FieldInfo::get_FieldType()
	IL_137c:  stloc 34

	IL_1380:  nop 
	IL_1381:  nop 
	IL_1382:  br IL_1387

	IL_1387:  ldarg 2

	IL_138b:  nop 
	IL_138c:  nop 
	IL_138d:  ldc.i4 1
	IL_1392:  beq IL_139c

	IL_1397:  br IL_13b2

	IL_139c:  ldloc 49

	IL_13a0:  nop 
	IL_13a1:  nop 
	IL_13a2:  ldloc 51

	IL_13a6:  nop 
	IL_13a7:  nop 
	IL_13a8:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitFldLd(class [mscorlib]System.Reflection.FieldInfo, bool)
	IL_13ad:  br IL_13b7

	IL_13b2:  br IL_13b7

	IL_13b7:  ldloc 51

	IL_13bb:  nop 
	IL_13bc:  nop 
	IL_13bd:  ldc.i4 1
	IL_13c2:  beq IL_13cc

	IL_13c7:  br IL_13dc

	IL_13cc:  ldc.i4 0
	IL_13d1:  stloc 51

	IL_13d5:  nop 
	IL_13d6:  nop 
	IL_13d7:  br IL_13e1

	IL_13dc:  br IL_13e1

	IL_13e1:  br IL_13e6

	IL_13e6:  ldc.i4 1
	IL_13eb:  stloc 24

	IL_13ef:  nop 
	IL_13f0:  nop 
	IL_13f1:  ldloc 11

	IL_13f5:  nop 
	IL_13f6:  nop 
	IL_13f7:  ldloc 13

	IL_13fb:  nop 
	IL_13fc:  nop 
	IL_13fd:  beq IL_1407

	IL_1402:  br IL_1411

	IL_1407:  br IL_141b

	IL_140c:  br IL_141b

	IL_1411:  br IL_0fb9

	IL_1416:  br IL_141b

	IL_141b:  ldc.i4 0
	IL_1420:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::AddrFlg
	IL_1425:  br IL_142f

	IL_142a:  br IL_142f

	IL_142f:  br IL_1462

	IL_1434:  ldarg 2

	IL_1438:  nop 
	IL_1439:  nop 
	IL_143a:  ldc.i4 1
	IL_143f:  beq IL_1449

	IL_1444:  br IL_1458

	IL_1449:  ldc.i4 0
	IL_144e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1453:  br IL_145d

	IL_1458:  br IL_145d

	IL_145d:  br IL_1462

	IL_1462:  ldloc 11

	IL_1466:  nop 
	IL_1467:  nop 
	IL_1468:  ldc.i4 1
	IL_146d:  add 
	IL_146e:  stloc 11

	IL_1472:  nop 
	IL_1473:  nop 
	IL_1474:  ldloc 52

	IL_1478:  nop 
	IL_1479:  nop 
	IL_147a:  ldc.i4 0
	IL_147f:  beq IL_1489

	IL_1484:  br IL_1550

	IL_1489:  ldloc 24

	IL_148d:  nop 
	IL_148e:  nop 
	IL_148f:  ldc.i4 0
	IL_1494:  beq IL_149e

	IL_1499:  br IL_1546

	IL_149e:  ldarg 2

	IL_14a2:  nop 
	IL_14a3:  nop 
	IL_14a4:  ldc.i4 1
	IL_14a9:  beq IL_14b3

	IL_14ae:  br IL_153c

	IL_14b3:  ldsfld class dylan.NET.Tokenizer.CodeGen.TypeArr[] dylan.NET.Tokenizer.CodeGen.SymTable::TypLst
	IL_14b8:  ldc.i4 0
	IL_14bd:  conv.u 
	IL_14be:  ldelem dylan.NET.Tokenizer.CodeGen.TypeArr
	IL_14c3:  stloc 55

	IL_14c7:  nop 
	IL_14c8:  nop 
	IL_14c9:  ldloc 55

	IL_14cd:  nop 
	IL_14ce:  nop 
	IL_14cf:  ldfld class [mscorlib]System.Type[] dylan.NET.Tokenizer.CodeGen.TypeArr::Arr
	IL_14d4:  stloc 42

	IL_14d8:  nop 
	IL_14d9:  nop 
	IL_14da:  ldloc 35

	IL_14de:  nop 
	IL_14df:  nop 
	IL_14e0:  ldloc 11

	IL_14e4:  nop 
	IL_14e5:  nop 
	IL_14e6:  conv.u 
	IL_14e7:  ldelem [mscorlib]System.String
	IL_14ec:  ldloc 42

	IL_14f0:  nop 
	IL_14f1:  nop 
	IL_14f2:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_14f7:  stloc 36

	IL_14fb:  nop 
	IL_14fc:  nop 
	IL_14fd:  ldloc 36

	IL_1501:  nop 
	IL_1502:  nop 
	IL_1503:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_1508:  stloc 51

	IL_150c:  nop 
	IL_150d:  nop 
	IL_150e:  ldloc 51

	IL_1512:  nop 
	IL_1513:  nop 
	IL_1514:  ldc.i4 0
	IL_1519:  beq IL_1523

	IL_151e:  br IL_1532

	IL_1523:  ldc.i4 0
	IL_1528:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_152d:  br IL_1537

	IL_1532:  br IL_1537

	IL_1537:  br IL_1541

	IL_153c:  br IL_1541

	IL_1541:  br IL_154b

	IL_1546:  br IL_154b

	IL_154b:  br IL_1555

	IL_1550:  br IL_1555

	IL_1555:  ldloc 11

	IL_1559:  nop 
	IL_155a:  nop 
	IL_155b:  stloc 12

	IL_155f:  nop 
	IL_1560:  nop 
	IL_1561:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1566:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type03
	IL_156b:  ldc.i4 -1
	IL_1570:  stloc 11

	IL_1574:  nop 
	IL_1575:  nop 
	IL_1576:  ldc.i4 0
	IL_157b:  conv.u 
	IL_157c:  newarr [mscorlib]System.Type
	IL_1581:  stloc 42

	IL_1585:  nop 
	IL_1586:  nop 
	IL_1587:  ldloc 41

	IL_158b:  nop 
	IL_158c:  nop 
	IL_158d:  ldlen 
	IL_158e:  conv.i4 
	IL_158f:  ldc.i4 0
	IL_1594:  beq IL_159e

	IL_1599:  br IL_15b3

	IL_159e:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_15a3:  stloc 42

	IL_15a7:  nop 
	IL_15a8:  nop 
	IL_15a9:  br IL_16d0

	IL_15ae:  br IL_15b8

	IL_15b3:  br IL_15b8

	IL_15b8:  ldloc 11

	IL_15bc:  nop 
	IL_15bd:  nop 
	IL_15be:  ldc.i4 1
	IL_15c3:  add 
	IL_15c4:  stloc 11

	IL_15c8:  nop 
	IL_15c9:  nop 
	IL_15ca:  ldloc 41

	IL_15ce:  nop 
	IL_15cf:  nop 
	IL_15d0:  ldloc 11

	IL_15d4:  nop 
	IL_15d5:  nop 
	IL_15d6:  conv.u 
	IL_15d7:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_15dc:  stloc 45

	IL_15e0:  nop 
	IL_15e1:  nop 
	IL_15e2:  ldloc 45

	IL_15e6:  nop 
	IL_15e7:  nop 
	IL_15e8:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_15ed:  ldlen 
	IL_15ee:  conv.i4 
	IL_15ef:  ldc.i4 1
	IL_15f4:  beq IL_15fe

	IL_15f9:  br IL_160f

	IL_15fe:  ldloc 45

	IL_1602:  nop 
	IL_1603:  nop 
	IL_1604:  stloc 46

	IL_1608:  nop 
	IL_1609:  nop 
	IL_160a:  br IL_164c

	IL_160f:  ldloc 45

	IL_1613:  nop 
	IL_1614:  nop 
	IL_1615:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_161a:  ldlen 
	IL_161b:  conv.i4 
	IL_161c:  ldc.i4 3
	IL_1621:  bge IL_162b

	IL_1626:  br IL_1642

	IL_162b:  ldarg.0 
	IL_162c:  ldloc 45

	IL_1630:  nop 
	IL_1631:  nop 
	IL_1632:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1637:  stloc 46

	IL_163b:  nop 
	IL_163c:  nop 
	IL_163d:  br IL_1647

	IL_1642:  br IL_1647

	IL_1647:  br IL_164c

	IL_164c:  ldarg.0 
	IL_164d:  ldloc 46

	IL_1651:  nop 
	IL_1652:  nop 
	IL_1653:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1658:  stloc 47

	IL_165c:  nop 
	IL_165d:  nop 
	IL_165e:  ldarg.0 
	IL_165f:  ldloc 47

	IL_1663:  nop 
	IL_1664:  nop 
	IL_1665:  ldarg 2

	IL_1669:  nop 
	IL_166a:  nop 
	IL_166b:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_1670:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1675:  stloc 43

	IL_1679:  nop 
	IL_167a:  nop 
	IL_167b:  ldloc 42

	IL_167f:  nop 
	IL_1680:  nop 
	IL_1681:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1686:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_168b:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_1690:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1695:  stloc 42

	IL_1699:  nop 
	IL_169a:  nop 
	IL_169b:  ldloc 43

	IL_169f:  nop 
	IL_16a0:  nop 
	IL_16a1:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_16a6:  ldloc 11

	IL_16aa:  nop 
	IL_16ab:  nop 
	IL_16ac:  ldloc 44

	IL_16b0:  nop 
	IL_16b1:  nop 
	IL_16b2:  beq IL_16bc

	IL_16b7:  br IL_16c6

	IL_16bc:  br IL_16d0

	IL_16c1:  br IL_16d0

	IL_16c6:  br IL_15b8

	IL_16cb:  br IL_16d0

	IL_16d0:  ldarg 2

	IL_16d4:  nop 
	IL_16d5:  nop 
	IL_16d6:  ldc.i4 0
	IL_16db:  beq IL_16e5

	IL_16e0:  br IL_16f5

	IL_16e5:  ldloc 42

	IL_16e9:  nop 
	IL_16ea:  nop 
	IL_16eb:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddTypArr(class [mscorlib]System.Type[])
	IL_16f0:  br IL_1700

	IL_16f5:  call class [mscorlib]System.Type[] class dylan.NET.Tokenizer.CodeGen.SymTable::PopTypArr()
	IL_16fa:  pop 
	IL_16fb:  br IL_1700

	IL_1700:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type03
	IL_1705:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_170a:  ldloc 12

	IL_170e:  nop 
	IL_170f:  nop 
	IL_1710:  stloc 11

	IL_1714:  nop 
	IL_1715:  nop 
	IL_1716:  ldloc 34

	IL_171a:  nop 
	IL_171b:  nop 
	IL_171c:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type05
	IL_1721:  ldloc 52

	IL_1725:  nop 
	IL_1726:  nop 
	IL_1727:  ldc.i4 0
	IL_172c:  beq IL_1736

	IL_1731:  br IL_18d9

	IL_1736:  ldloc 24

	IL_173a:  nop 
	IL_173b:  nop 
	IL_173c:  ldc.i4 1
	IL_1741:  beq IL_174b

	IL_1746:  br IL_17fc

	IL_174b:  ldloc 34

	IL_174f:  nop 
	IL_1750:  nop 
	IL_1751:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1756:  callvirt instance bool class [mscorlib]System.Type::Equals(class [mscorlib]System.Type)
	IL_175b:  stloc 9

	IL_175f:  nop 
	IL_1760:  nop 
	IL_1761:  ldloc 9

	IL_1765:  nop 
	IL_1766:  nop 
	IL_1767:  ldc.i4 0
	IL_176c:  beq IL_1776

	IL_1771:  br IL_17ae

	IL_1776:  ldloc 34

	IL_177a:  nop 
	IL_177b:  nop 
	IL_177c:  ldloc 35

	IL_1780:  nop 
	IL_1781:  nop 
	IL_1782:  ldloc 11

	IL_1786:  nop 
	IL_1787:  nop 
	IL_1788:  conv.u 
	IL_1789:  ldelem [mscorlib]System.String
	IL_178e:  ldloc 42

	IL_1792:  nop 
	IL_1793:  nop 
	IL_1794:  call class [mscorlib]System.Reflection.MethodInfo class [dnr]dylan.NET.Reflection.Loader::LoadMethod(class [mscorlib]System.Type, string, class [mscorlib]System.Type[])
	IL_1799:  stloc 36

	IL_179d:  nop 
	IL_179e:  nop 
	IL_179f:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.Loader::MemberTyp
	IL_17a4:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_17a9:  br IL_17f7

	IL_17ae:  ldloc 35

	IL_17b2:  nop 
	IL_17b3:  nop 
	IL_17b4:  ldloc 11

	IL_17b8:  nop 
	IL_17b9:  nop 
	IL_17ba:  conv.u 
	IL_17bb:  ldelem [mscorlib]System.String
	IL_17c0:  ldloc 42

	IL_17c4:  nop 
	IL_17c5:  nop 
	IL_17c6:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_17cb:  stloc 36

	IL_17cf:  nop 
	IL_17d0:  nop 
	IL_17d1:  ldloc 36

	IL_17d5:  nop 
	IL_17d6:  nop 
	IL_17d7:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_17dc:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_17e1:  ldloc 36

	IL_17e5:  nop 
	IL_17e6:  nop 
	IL_17e7:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_17ec:  stloc 51

	IL_17f0:  nop 
	IL_17f1:  nop 
	IL_17f2:  br IL_17f7

	IL_17f7:  br IL_1845

	IL_17fc:  ldloc 35

	IL_1800:  nop 
	IL_1801:  nop 
	IL_1802:  ldloc 11

	IL_1806:  nop 
	IL_1807:  nop 
	IL_1808:  conv.u 
	IL_1809:  ldelem [mscorlib]System.String
	IL_180e:  ldloc 42

	IL_1812:  nop 
	IL_1813:  nop 
	IL_1814:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMet(string, class [mscorlib]System.Type[])
	IL_1819:  stloc 36

	IL_181d:  nop 
	IL_181e:  nop 
	IL_181f:  ldloc 36

	IL_1823:  nop 
	IL_1824:  nop 
	IL_1825:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Reflection.MethodInfo::get_ReturnType()
	IL_182a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_182f:  ldloc 36

	IL_1833:  nop 
	IL_1834:  nop 
	IL_1835:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_183a:  stloc 51

	IL_183e:  nop 
	IL_183f:  nop 
	IL_1840:  br IL_1845

	IL_1845:  ldarg 2

	IL_1849:  nop 
	IL_184a:  nop 
	IL_184b:  ldc.i4 1
	IL_1850:  beq IL_185a

	IL_1855:  br IL_188a

	IL_185a:  ldloc 38

	IL_185e:  nop 
	IL_185f:  nop 
	IL_1860:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_1865:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::PopFlg
	IL_186a:  ldloc 36

	IL_186e:  nop 
	IL_186f:  nop 
	IL_1870:  ldloc 51

	IL_1874:  nop 
	IL_1875:  nop 
	IL_1876:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitMetCall(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_187b:  ldc.i4 0
	IL_1880:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::PopFlg
	IL_1885:  br IL_188f

	IL_188a:  br IL_188f

	IL_188f:  ldloc 39

	IL_1893:  nop 
	IL_1894:  nop 
	IL_1895:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberAccessFlg
	IL_189a:  ldc.i4 1
	IL_189f:  beq IL_18a9

	IL_18a4:  br IL_18cf

	IL_18a9:  ldc.i4 1
	IL_18ae:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::ChainFlg
	IL_18b3:  ldarg.0 
	IL_18b4:  ldloc 39

	IL_18b8:  nop 
	IL_18b9:  nop 
	IL_18ba:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::MemberToAccess
	IL_18bf:  ldarg 2

	IL_18c3:  nop 
	IL_18c4:  nop 
	IL_18c5:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_18ca:  br IL_18d4

	IL_18cf:  br IL_18d4

	IL_18d4:  br IL_192a

	IL_18d9:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::CurnInhTyp
	IL_18de:  stloc 34

	IL_18e2:  nop 
	IL_18e3:  nop 
	IL_18e4:  ldloc 34

	IL_18e8:  nop 
	IL_18e9:  nop 
	IL_18ea:  ldloc 42

	IL_18ee:  nop 
	IL_18ef:  nop 
	IL_18f0:  call class [mscorlib]System.Reflection.ConstructorInfo class [dnr]dylan.NET.Reflection.Loader::LoadCtor(class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_18f5:  stloc 48

	IL_18f9:  nop 
	IL_18fa:  nop 
	IL_18fb:  ldarg 2

	IL_18ff:  nop 
	IL_1900:  nop 
	IL_1901:  ldc.i4 1
	IL_1906:  beq IL_1910

	IL_190b:  br IL_1920

	IL_1910:  ldloc 48

	IL_1914:  nop 
	IL_1915:  nop 
	IL_1916:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCallCtor(class [mscorlib]System.Reflection.ConstructorInfo)
	IL_191b:  br IL_1925

	IL_1920:  br IL_1925

	IL_1925:  br IL_192a

	IL_192a:  ldloc 39

	IL_192e:  nop 
	IL_192f:  nop 
	IL_1930:  ldfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::Conv
	IL_1935:  ldc.i4 1
	IL_193a:  beq IL_1944

	IL_193f:  br IL_19cf

	IL_1944:  ldarg 2

	IL_1948:  nop 
	IL_1949:  nop 
	IL_194a:  ldc.i4 1
	IL_194f:  beq IL_1959

	IL_1954:  br IL_1969

	IL_1959:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_195e:  stloc 15

	IL_1962:  nop 
	IL_1963:  nop 
	IL_1964:  br IL_196e

	IL_1969:  br IL_196e

	IL_196e:  ldloc 39

	IL_1972:  nop 
	IL_1973:  nop 
	IL_1974:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident::TTok
	IL_1979:  stloc 10

	IL_197d:  nop 
	IL_197e:  nop 
	IL_197f:  ldloc 10

	IL_1983:  nop 
	IL_1984:  nop 
	IL_1985:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_198a:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_198f:  ldarg 2

	IL_1993:  nop 
	IL_1994:  nop 
	IL_1995:  ldc.i4 1
	IL_199a:  beq IL_19a4

	IL_199f:  br IL_19c5

	IL_19a4:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_19a9:  stloc 16

	IL_19ad:  nop 
	IL_19ae:  nop 
	IL_19af:  ldloc 15

	IL_19b3:  nop 
	IL_19b4:  nop 
	IL_19b5:  ldloc 16

	IL_19b9:  nop 
	IL_19ba:  nop 
	IL_19bb:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitConv(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_19c0:  br IL_19ca

	IL_19c5:  br IL_19ca

	IL_19ca:  br IL_19d4

	IL_19cf:  br IL_19d4

	IL_19d4:  br IL_2000

	IL_19d9:  br IL_19e3

	IL_19de:  br IL_19e3

	IL_19e3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok
	IL_19e8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_19ed:  stloc 8

	IL_19f1:  nop 
	IL_19f2:  nop 
	IL_19f3:  ldloc 8

	IL_19f7:  nop 
	IL_19f8:  nop 
	IL_19f9:  ldarg 1

	IL_19fd:  nop 
	IL_19fe:  nop 
	IL_19ff:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1a04:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1a09:  stloc 9

	IL_1a0d:  nop 
	IL_1a0e:  nop 
	IL_1a0f:  ldloc 9

	IL_1a13:  nop 
	IL_1a14:  nop 
	IL_1a15:  ldc.i4 1
	IL_1a1a:  beq IL_1a24

	IL_1a1f:  br IL_1c32

	IL_1a24:  ldarg 1

	IL_1a28:  nop 
	IL_1a29:  nop 
	IL_1a2a:  stloc 56

	IL_1a2e:  nop 
	IL_1a2f:  nop 
	IL_1a30:  ldloc 56

	IL_1a34:  nop 
	IL_1a35:  nop 
	IL_1a36:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Name
	IL_1a3b:  stloc 10

	IL_1a3f:  nop 
	IL_1a40:  nop 
	IL_1a41:  ldloc 10

	IL_1a45:  nop 
	IL_1a46:  nop 
	IL_1a47:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1a4c:  stloc 37

	IL_1a50:  nop 
	IL_1a51:  nop 
	IL_1a52:  ldloc 56

	IL_1a56:  nop 
	IL_1a57:  nop 
	IL_1a58:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewCallTok::Params
	IL_1a5d:  stloc 41

	IL_1a61:  nop 
	IL_1a62:  nop 
	IL_1a63:  ldloc 41

	IL_1a67:  nop 
	IL_1a68:  nop 
	IL_1a69:  ldlen 
	IL_1a6a:  conv.i4 
	IL_1a6b:  ldc.i4 1
	IL_1a70:  sub 
	IL_1a71:  stloc 44

	IL_1a75:  nop 
	IL_1a76:  nop 
	IL_1a77:  ldloc 41

	IL_1a7b:  nop 
	IL_1a7c:  nop 
	IL_1a7d:  ldlen 
	IL_1a7e:  conv.i4 
	IL_1a7f:  ldc.i4 0
	IL_1a84:  beq IL_1a8e

	IL_1a89:  br IL_1aa3

	IL_1a8e:  ldsfld class [mscorlib]System.Type[] [mscorlib]System.Type::EmptyTypes
	IL_1a93:  stloc 42

	IL_1a97:  nop 
	IL_1a98:  nop 
	IL_1a99:  br IL_1bdc

	IL_1a9e:  br IL_1ab9

	IL_1aa3:  ldc.i4 0
	IL_1aa8:  conv.u 
	IL_1aa9:  newarr [mscorlib]System.Type
	IL_1aae:  stloc 42

	IL_1ab2:  nop 
	IL_1ab3:  nop 
	IL_1ab4:  br IL_1ab9

	IL_1ab9:  ldc.i4 -1
	IL_1abe:  stloc 11

	IL_1ac2:  nop 
	IL_1ac3:  nop 
	IL_1ac4:  ldloc 11

	IL_1ac8:  nop 
	IL_1ac9:  nop 
	IL_1aca:  ldc.i4 1
	IL_1acf:  add 
	IL_1ad0:  stloc 11

	IL_1ad4:  nop 
	IL_1ad5:  nop 
	IL_1ad6:  ldloc 41

	IL_1ada:  nop 
	IL_1adb:  nop 
	IL_1adc:  ldloc 11

	IL_1ae0:  nop 
	IL_1ae1:  nop 
	IL_1ae2:  conv.u 
	IL_1ae3:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr
	IL_1ae8:  stloc 45

	IL_1aec:  nop 
	IL_1aed:  nop 
	IL_1aee:  ldloc 45

	IL_1af2:  nop 
	IL_1af3:  nop 
	IL_1af4:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1af9:  ldlen 
	IL_1afa:  conv.i4 
	IL_1afb:  ldc.i4 1
	IL_1b00:  beq IL_1b0a

	IL_1b05:  br IL_1b1b

	IL_1b0a:  ldloc 45

	IL_1b0e:  nop 
	IL_1b0f:  nop 
	IL_1b10:  stloc 46

	IL_1b14:  nop 
	IL_1b15:  nop 
	IL_1b16:  br IL_1b58

	IL_1b1b:  ldloc 45

	IL_1b1f:  nop 
	IL_1b20:  nop 
	IL_1b21:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_1b26:  ldlen 
	IL_1b27:  conv.i4 
	IL_1b28:  ldc.i4 3
	IL_1b2d:  bge IL_1b37

	IL_1b32:  br IL_1b4e

	IL_1b37:  ldarg.0 
	IL_1b38:  ldloc 45

	IL_1b3c:  nop 
	IL_1b3d:  nop 
	IL_1b3e:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1b43:  stloc 46

	IL_1b47:  nop 
	IL_1b48:  nop 
	IL_1b49:  br IL_1b53

	IL_1b4e:  br IL_1b53

	IL_1b53:  br IL_1b58

	IL_1b58:  ldarg.0 
	IL_1b59:  ldloc 46

	IL_1b5d:  nop 
	IL_1b5e:  nop 
	IL_1b5f:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1b64:  stloc 47

	IL_1b68:  nop 
	IL_1b69:  nop 
	IL_1b6a:  ldarg.0 
	IL_1b6b:  ldloc 47

	IL_1b6f:  nop 
	IL_1b70:  nop 
	IL_1b71:  ldarg 2

	IL_1b75:  nop 
	IL_1b76:  nop 
	IL_1b77:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_1b7c:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1b81:  stloc 43

	IL_1b85:  nop 
	IL_1b86:  nop 
	IL_1b87:  ldloc 42

	IL_1b8b:  nop 
	IL_1b8c:  nop 
	IL_1b8d:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1b92:  ldsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1b97:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_1b9c:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1ba1:  stloc 42

	IL_1ba5:  nop 
	IL_1ba6:  nop 
	IL_1ba7:  ldloc 43

	IL_1bab:  nop 
	IL_1bac:  nop 
	IL_1bad:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1bb2:  ldloc 11

	IL_1bb6:  nop 
	IL_1bb7:  nop 
	IL_1bb8:  ldloc 44

	IL_1bbc:  nop 
	IL_1bbd:  nop 
	IL_1bbe:  beq IL_1bc8

	IL_1bc3:  br IL_1bd2

	IL_1bc8:  br IL_1bdc

	IL_1bcd:  br IL_1bdc

	IL_1bd2:  br IL_1ac4

	IL_1bd7:  br IL_1bdc

	IL_1bdc:  ldloc 37

	IL_1be0:  nop 
	IL_1be1:  nop 
	IL_1be2:  ldloc 42

	IL_1be6:  nop 
	IL_1be7:  nop 
	IL_1be8:  call class [mscorlib]System.Reflection.ConstructorInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocCtor(class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_1bed:  stloc 48

	IL_1bf1:  nop 
	IL_1bf2:  nop 
	IL_1bf3:  ldarg 2

	IL_1bf7:  nop 
	IL_1bf8:  nop 
	IL_1bf9:  ldc.i4 1
	IL_1bfe:  beq IL_1c08

	IL_1c03:  br IL_1c18

	IL_1c08:  ldloc 48

	IL_1c0c:  nop 
	IL_1c0d:  nop 
	IL_1c0e:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNewobj(class [mscorlib]System.Reflection.ConstructorInfo)
	IL_1c13:  br IL_1c1d

	IL_1c18:  br IL_1c1d

	IL_1c1d:  ldloc 37

	IL_1c21:  nop 
	IL_1c22:  nop 
	IL_1c23:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1c28:  br IL_2000

	IL_1c2d:  br IL_1c37

	IL_1c32:  br IL_1c37

	IL_1c37:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok
	IL_1c3c:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1c41:  stloc 8

	IL_1c45:  nop 
	IL_1c46:  nop 
	IL_1c47:  ldloc 8

	IL_1c4b:  nop 
	IL_1c4c:  nop 
	IL_1c4d:  ldarg 1

	IL_1c51:  nop 
	IL_1c52:  nop 
	IL_1c53:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1c58:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1c5d:  stloc 9

	IL_1c61:  nop 
	IL_1c62:  nop 
	IL_1c63:  ldloc 9

	IL_1c67:  nop 
	IL_1c68:  nop 
	IL_1c69:  ldc.i4 1
	IL_1c6e:  beq IL_1c78

	IL_1c73:  br IL_1d78

	IL_1c78:  ldarg 2

	IL_1c7c:  nop 
	IL_1c7d:  nop 
	IL_1c7e:  ldc.i4 1
	IL_1c83:  beq IL_1c8d

	IL_1c88:  br IL_1d5a

	IL_1c8d:  ldarg 1

	IL_1c91:  nop 
	IL_1c92:  nop 
	IL_1c93:  stloc 57

	IL_1c97:  nop 
	IL_1c98:  nop 
	IL_1c99:  ldloc 57

	IL_1c9d:  nop 
	IL_1c9e:  nop 
	IL_1c9f:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.GettypeCallTok::Name
	IL_1ca4:  stloc 10

	IL_1ca8:  nop 
	IL_1ca9:  nop 
	IL_1caa:  ldloc 10

	IL_1cae:  nop 
	IL_1caf:  nop 
	IL_1cb0:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1cb5:  stloc 8

	IL_1cb9:  nop 
	IL_1cba:  nop 
	IL_1cbb:  ldloc 8

	IL_1cbf:  nop 
	IL_1cc0:  nop 
	IL_1cc1:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdtoken(class [mscorlib]System.Type)
	IL_1cc6:  ldc.i4 0
	IL_1ccb:  conv.u 
	IL_1ccc:  newarr [mscorlib]System.Type
	IL_1cd1:  stloc 42

	IL_1cd5:  nop 
	IL_1cd6:  nop 
	IL_1cd7:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1cdc:  stloc 43

	IL_1ce0:  nop 
	IL_1ce1:  nop 
	IL_1ce2:  ldloc 42

	IL_1ce6:  nop 
	IL_1ce7:  nop 
	IL_1ce8:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1ced:  ldtoken [mscorlib]System.RuntimeTypeHandle
	IL_1cf2:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1cf7:  stloc 8

	IL_1cfb:  nop 
	IL_1cfc:  nop 
	IL_1cfd:  ldloc 8

	IL_1d01:  nop 
	IL_1d02:  nop 
	IL_1d03:  call void class [dnr]dylan.NET.Reflection.AsmFactory::AddTyp(class [mscorlib]System.Type)
	IL_1d08:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1d0d:  stloc 42

	IL_1d11:  nop 
	IL_1d12:  nop 
	IL_1d13:  ldloc 43

	IL_1d17:  nop 
	IL_1d18:  nop 
	IL_1d19:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1d1e:  ldtoken [mscorlib]System.Type
	IL_1d23:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d28:  stloc 8

	IL_1d2c:  nop 
	IL_1d2d:  nop 
	IL_1d2e:  ldloc 8

	IL_1d32:  nop 
	IL_1d33:  nop 
	IL_1d34:  ldstr "GetTypeFromHandle"
	IL_1d39:  ldloc 42

	IL_1d3d:  nop 
	IL_1d3e:  nop 
	IL_1d3f:  callvirt instance class [mscorlib]System.Reflection.MethodInfo class [mscorlib]System.Type::GetMethod(string, class [mscorlib]System.Type[])
	IL_1d44:  stloc 36

	IL_1d48:  nop 
	IL_1d49:  nop 
	IL_1d4a:  ldloc 36

	IL_1d4e:  nop 
	IL_1d4f:  nop 
	IL_1d50:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitCall(class [mscorlib]System.Reflection.MethodInfo)
	IL_1d55:  br IL_1d5f

	IL_1d5a:  br IL_1d5f

	IL_1d5f:  ldtoken [mscorlib]System.Type
	IL_1d64:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d69:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1d6e:  br IL_2000

	IL_1d73:  br IL_1d7d

	IL_1d78:  br IL_1d7d

	IL_1d7d:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MeTok
	IL_1d82:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1d87:  stloc 8

	IL_1d8b:  nop 
	IL_1d8c:  nop 
	IL_1d8d:  ldloc 8

	IL_1d91:  nop 
	IL_1d92:  nop 
	IL_1d93:  ldarg 1

	IL_1d97:  nop 
	IL_1d98:  nop 
	IL_1d99:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1d9e:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1da3:  stloc 9

	IL_1da7:  nop 
	IL_1da8:  nop 
	IL_1da9:  ldloc 9

	IL_1dad:  nop 
	IL_1dae:  nop 
	IL_1daf:  ldc.i4 1
	IL_1db4:  beq IL_1dbe

	IL_1db9:  br IL_1dfb

	IL_1dbe:  ldarg 2

	IL_1dc2:  nop 
	IL_1dc3:  nop 
	IL_1dc4:  ldc.i4 1
	IL_1dc9:  beq IL_1dd3

	IL_1dce:  br IL_1de2

	IL_1dd3:  ldc.i4 0
	IL_1dd8:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1ddd:  br IL_1de7

	IL_1de2:  br IL_1de7

	IL_1de7:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_1dec:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1df1:  br IL_2000

	IL_1df6:  br IL_1e00

	IL_1dfb:  br IL_1e00

	IL_1e00:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok
	IL_1e05:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1e0a:  stloc 8

	IL_1e0e:  nop 
	IL_1e0f:  nop 
	IL_1e10:  ldloc 8

	IL_1e14:  nop 
	IL_1e15:  nop 
	IL_1e16:  ldarg 1

	IL_1e1a:  nop 
	IL_1e1b:  nop 
	IL_1e1c:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1e21:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1e26:  stloc 9

	IL_1e2a:  nop 
	IL_1e2b:  nop 
	IL_1e2c:  ldloc 9

	IL_1e30:  nop 
	IL_1e31:  nop 
	IL_1e32:  ldc.i4 1
	IL_1e37:  beq IL_1e41

	IL_1e3c:  br IL_1eff

	IL_1e41:  ldarg 1

	IL_1e45:  nop 
	IL_1e46:  nop 
	IL_1e47:  stloc 58

	IL_1e4b:  nop 
	IL_1e4c:  nop 
	IL_1e4d:  ldloc 58

	IL_1e51:  nop 
	IL_1e52:  nop 
	IL_1e53:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayLen
	IL_1e58:  stloc 45

	IL_1e5c:  nop 
	IL_1e5d:  nop 
	IL_1e5e:  ldloc 58

	IL_1e62:  nop 
	IL_1e63:  nop 
	IL_1e64:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.NewarrCallTok::ArrayType
	IL_1e69:  stloc 10

	IL_1e6d:  nop 
	IL_1e6e:  nop 
	IL_1e6f:  ldloc 10

	IL_1e73:  nop 
	IL_1e74:  nop 
	IL_1e75:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1e7a:  stloc 8

	IL_1e7e:  nop 
	IL_1e7f:  nop 
	IL_1e80:  ldarg 2

	IL_1e84:  nop 
	IL_1e85:  nop 
	IL_1e86:  ldc.i4 1
	IL_1e8b:  beq IL_1e95

	IL_1e90:  br IL_1ee0

	IL_1e95:  ldarg.0 
	IL_1e96:  ldloc 45

	IL_1e9a:  nop 
	IL_1e9b:  nop 
	IL_1e9c:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToRPN(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1ea1:  stloc 45

	IL_1ea5:  nop 
	IL_1ea6:  nop 
	IL_1ea7:  ldarg.0 
	IL_1ea8:  ldloc 45

	IL_1eac:  nop 
	IL_1ead:  nop 
	IL_1eae:  callvirt instance class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr class dylan.NET.Tokenizer.CodeGen.Evaluator::ConvToAST(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1eb3:  starg 1

	IL_1eb7:  nop 
	IL_1eb8:  nop 
	IL_1eb9:  ldarg.0 
	IL_1eba:  ldarg 1

	IL_1ebe:  nop 
	IL_1ebf:  nop 
	IL_1ec0:  ldarg 2

	IL_1ec4:  nop 
	IL_1ec5:  nop 
	IL_1ec6:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::ASTEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, bool)
	IL_1ecb:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitConvI()
	IL_1ed0:  ldloc 8

	IL_1ed4:  nop 
	IL_1ed5:  nop 
	IL_1ed6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitNewarr(class [mscorlib]System.Type)
	IL_1edb:  br IL_1ee5

	IL_1ee0:  br IL_1ee5

	IL_1ee5:  ldloc 8

	IL_1ee9:  nop 
	IL_1eea:  nop 
	IL_1eeb:  callvirt instance class [mscorlib]System.Type class [mscorlib]System.Type::MakeArrayType()
	IL_1ef0:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1ef5:  br IL_2000

	IL_1efa:  br IL_1f04

	IL_1eff:  br IL_1f04

	IL_1f04:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok
	IL_1f09:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1f0e:  stloc 8

	IL_1f12:  nop 
	IL_1f13:  nop 
	IL_1f14:  ldloc 8

	IL_1f18:  nop 
	IL_1f19:  nop 
	IL_1f1a:  ldarg 1

	IL_1f1e:  nop 
	IL_1f1f:  nop 
	IL_1f20:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1f25:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1f2a:  stloc 9

	IL_1f2e:  nop 
	IL_1f2f:  nop 
	IL_1f30:  ldloc 9

	IL_1f34:  nop 
	IL_1f35:  nop 
	IL_1f36:  ldc.i4 1
	IL_1f3b:  beq IL_1f45

	IL_1f40:  br IL_1ffb

	IL_1f45:  ldarg 2

	IL_1f49:  nop 
	IL_1f4a:  nop 
	IL_1f4b:  ldc.i4 1
	IL_1f50:  beq IL_1f5a

	IL_1f55:  br IL_1fdd

	IL_1f5a:  ldarg 1

	IL_1f5e:  nop 
	IL_1f5f:  nop 
	IL_1f60:  stloc 59

	IL_1f64:  nop 
	IL_1f65:  nop 
	IL_1f66:  ldloc 59

	IL_1f6a:  nop 
	IL_1f6b:  nop 
	IL_1f6c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodNameTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.PtrCallTok::MetToCall
	IL_1f71:  stloc 39

	IL_1f75:  nop 
	IL_1f76:  nop 
	IL_1f77:  ldloc 39

	IL_1f7b:  nop 
	IL_1f7c:  nop 
	IL_1f7d:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1f82:  call class [mscorlib]System.Reflection.MethodInfo class dylan.NET.Tokenizer.CodeGen.Helpers::GetLocMetNoParams(string)
	IL_1f87:  stloc 36

	IL_1f8b:  nop 
	IL_1f8c:  nop 
	IL_1f8d:  ldloc 36

	IL_1f91:  nop 
	IL_1f92:  nop 
	IL_1f93:  callvirt instance bool class [mscorlib]System.Reflection.MethodBase::get_IsStatic()
	IL_1f98:  stloc 51

	IL_1f9c:  nop 
	IL_1f9d:  nop 
	IL_1f9e:  ldloc 51

	IL_1fa2:  nop 
	IL_1fa3:  nop 
	IL_1fa4:  ldc.i4 0
	IL_1fa9:  beq IL_1fb3

	IL_1fae:  br IL_1fc2

	IL_1fb3:  ldc.i4 0
	IL_1fb8:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitLdarg(int32)
	IL_1fbd:  br IL_1fc7

	IL_1fc2:  br IL_1fc7

	IL_1fc7:  ldloc 36

	IL_1fcb:  nop 
	IL_1fcc:  nop 
	IL_1fcd:  ldloc 51

	IL_1fd1:  nop 
	IL_1fd2:  nop 
	IL_1fd3:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::EmitPtrLd(class [mscorlib]System.Reflection.MethodInfo, bool)
	IL_1fd8:  br IL_1fe2

	IL_1fdd:  br IL_1fe2

	IL_1fe2:  ldtoken [mscorlib]System.IntPtr
	IL_1fe7:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1fec:  stsfld class [mscorlib]System.Type [dnr]dylan.NET.Reflection.AsmFactory::Type02
	IL_1ff1:  br IL_2000

	IL_1ff6:  br IL_2000

	IL_1ffb:  br IL_2000

	IL_2000:  br IL_2005

	IL_2005:  ret 
    } // end of method Evaluator::ASTEmit

    // method line 86
    .method public 
           instance default void Evaluate (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0xa554
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

    // method line 87
    .method public 
           instance default void StoreEmit (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token tok, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr exp)  cil managed 
    {
        // Method begins at RVA 0xa604
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

    // method line 88
    .method public 
           instance default void Read (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt stm, string fpath)  cil managed 
    {
        // Method begins at RVA 0xae04
	// Code size 6841 (0x1ab9)
	.maxstack 229
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
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt	V_47,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_48,
		valuetype [mscorlib]System.Reflection.FieldAttributes	V_49,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_50,
		string	V_51,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_52,
		class [mscorlib]System.Type	V_53,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_54,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt	V_55,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[]	V_56,
		valuetype [mscorlib]System.Reflection.MethodAttributes	V_57,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_58,
		string	V_59,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[]	V_60,
		int32	V_61,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_62,
		class [mscorlib]System.Type	V_63,
		class [mscorlib]System.Reflection.Emit.TypeBuilder	V_64,
		bool	V_65,
		valuetype [mscorlib]System.Reflection.CallingConventions	V_66,
		int32	V_67,
		int32	V_68,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_69,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok	V_70,
		class [mscorlib]System.Type	V_71,
		class dylan.NET.Tokenizer.CodeGen.Evaluator	V_72,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt	V_73,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt	V_74,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt	V_75,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt	V_76,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_77,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token	V_78,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt	V_79,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_80,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok	V_81,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_82,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_83,
		valuetype [mscorlib]System.Reflection.Emit.Label	V_84,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt	V_85,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_86,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt	V_87,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr	V_88,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident	V_89,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt	V_90,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt	V_91,
		class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt	V_92)
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
	IL_01cf:  br IL_1ab8

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
	IL_033b:  br IL_1ab8

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
	IL_04a7:  br IL_1ab8

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
	IL_0584:  br IL_1ab8

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
	IL_0942:  br IL_1ab8

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
	IL_09ae:  br IL_1ab8

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

	IL_0c31:  br IL_1ab8

	IL_0c36:  br IL_0c40

	IL_0c3b:  br IL_0c40

	IL_0c40:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt
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

	IL_0c7c:  br IL_0d90

	IL_0c81:  ldarg 1

	IL_0c85:  nop 
	IL_0c86:  nop 
	IL_0c87:  stloc 47

	IL_0c8b:  nop 
	IL_0c8c:  nop 
	IL_0c8d:  ldloc 47

	IL_0c91:  nop 
	IL_0c92:  nop 
	IL_0c93:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::Attrs
	IL_0c98:  stloc 48

	IL_0c9c:  nop 
	IL_0c9d:  nop 
	IL_0c9e:  ldloc 48

	IL_0ca2:  nop 
	IL_0ca3:  nop 
	IL_0ca4:  call valuetype [mscorlib]System.Reflection.FieldAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessFieldAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_0ca9:  stloc 49

	IL_0cad:  nop 
	IL_0cae:  nop 
	IL_0caf:  ldloc 47

	IL_0cb3:  nop 
	IL_0cb4:  nop 
	IL_0cb5:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldName
	IL_0cba:  stloc 50

	IL_0cbe:  nop 
	IL_0cbf:  nop 
	IL_0cc0:  ldloc 50

	IL_0cc4:  nop 
	IL_0cc5:  nop 
	IL_0cc6:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0ccb:  stloc 51

	IL_0ccf:  nop 
	IL_0cd0:  nop 
	IL_0cd1:  ldloc 47

	IL_0cd5:  nop 
	IL_0cd6:  nop 
	IL_0cd7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.FieldStmt::FieldTyp
	IL_0cdc:  stloc 52

	IL_0ce0:  nop 
	IL_0ce1:  nop 
	IL_0ce2:  ldnull 
	IL_0ce3:  stloc 53

	IL_0ce7:  nop 
	IL_0ce8:  nop 
	IL_0ce9:  ldloc 52

	IL_0ced:  nop 
	IL_0cee:  nop 
	IL_0cef:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0cf4:  stloc 53

	IL_0cf8:  nop 
	IL_0cf9:  nop 
	IL_0cfa:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0cff:  stloc 54

	IL_0d03:  nop 
	IL_0d04:  nop 
	IL_0d05:  ldloc 54

	IL_0d09:  nop 
	IL_0d0a:  nop 
	IL_0d0b:  ldloc 51

	IL_0d0f:  nop 
	IL_0d10:  nop 
	IL_0d11:  ldloc 53

	IL_0d15:  nop 
	IL_0d16:  nop 
	IL_0d17:  ldloc 49

	IL_0d1b:  nop 
	IL_0d1c:  nop 
	IL_0d1d:  callvirt instance class [mscorlib]System.Reflection.Emit.FieldBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineField(string, class [mscorlib]System.Type, valuetype [mscorlib]System.Reflection.FieldAttributes)
	IL_0d22:  stsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_0d27:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0d2c:  ldc.i4 0
	IL_0d31:  beq IL_0d3b

	IL_0d36:  br IL_0d56

	IL_0d3b:  ldloc 51

	IL_0d3f:  nop 
	IL_0d40:  nop 
	IL_0d41:  ldloc 53

	IL_0d45:  nop 
	IL_0d46:  nop 
	IL_0d47:  ldsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_0d4c:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddFld(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_0d51:  br IL_0d71

	IL_0d56:  ldloc 51

	IL_0d5a:  nop 
	IL_0d5b:  nop 
	IL_0d5c:  ldloc 53

	IL_0d60:  nop 
	IL_0d61:  nop 
	IL_0d62:  ldsfld class [mscorlib]System.Reflection.Emit.FieldBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnFldB
	IL_0d67:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedFld(string, class [mscorlib]System.Type, class [mscorlib]System.Reflection.Emit.FieldBuilder)
	IL_0d6c:  br IL_0d71

	IL_0d71:  ldstr "Adding Field: "
	IL_0d76:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_0d7b:  ldloc 51

	IL_0d7f:  nop 
	IL_0d80:  nop 
	IL_0d81:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_0d86:  br IL_1ab8

	IL_0d8b:  br IL_0d95

	IL_0d90:  br IL_0d95

	IL_0d95:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndClassStmt
	IL_0d9a:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0d9f:  stloc 0

	IL_0da3:  nop 
	IL_0da4:  nop 
	IL_0da5:  ldloc 0

	IL_0da9:  nop 
	IL_0daa:  nop 
	IL_0dab:  ldarg 1

	IL_0daf:  nop 
	IL_0db0:  nop 
	IL_0db1:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0db6:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0dbb:  stloc 1

	IL_0dbf:  nop 
	IL_0dc0:  nop 
	IL_0dc1:  ldloc 1

	IL_0dc5:  nop 
	IL_0dc6:  nop 
	IL_0dc7:  ldc.i4 1
	IL_0dcc:  beq IL_0dd6

	IL_0dd1:  br IL_0e5d

	IL_0dd6:  call void class [dnr]dylan.NET.Reflection.AsmFactory::CreateTyp()
	IL_0ddb:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0de0:  ldc.i4 0
	IL_0de5:  beq IL_0def

	IL_0dea:  br IL_0e0d

	IL_0def:  ldc.i4 0
	IL_0df4:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::inClass
	IL_0df9:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetMet()
	IL_0dfe:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetCtor()
	IL_0e03:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetFld()
	IL_0e08:  br IL_0e12

	IL_0e0d:  br IL_0e12

	IL_0e12:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0e17:  ldc.i4 1
	IL_0e1c:  beq IL_0e26

	IL_0e21:  br IL_0e4e

	IL_0e26:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB2
	IL_0e2b:  stsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0e30:  ldc.i4 0
	IL_0e35:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_0e3a:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedMet()
	IL_0e3f:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedCtor()
	IL_0e44:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetNestedFld()
	IL_0e49:  br IL_0e53

	IL_0e4e:  br IL_0e53

	IL_0e53:  br IL_1ab8

	IL_0e58:  br IL_0e62

	IL_0e5d:  br IL_0e62

	IL_0e62:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt
	IL_0e67:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_0e6c:  stloc 0

	IL_0e70:  nop 
	IL_0e71:  nop 
	IL_0e72:  ldloc 0

	IL_0e76:  nop 
	IL_0e77:  nop 
	IL_0e78:  ldarg 1

	IL_0e7c:  nop 
	IL_0e7d:  nop 
	IL_0e7e:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_0e83:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_0e88:  stloc 1

	IL_0e8c:  nop 
	IL_0e8d:  nop 
	IL_0e8e:  ldloc 1

	IL_0e92:  nop 
	IL_0e93:  nop 
	IL_0e94:  ldc.i4 1
	IL_0e99:  beq IL_0ea3

	IL_0e9e:  br IL_11b7

	IL_0ea3:  ldarg 1

	IL_0ea7:  nop 
	IL_0ea8:  nop 
	IL_0ea9:  stloc 55

	IL_0ead:  nop 
	IL_0eae:  nop 
	IL_0eaf:  ldc.i4 0
	IL_0eb4:  stsfld bool [dnr]dylan.NET.Reflection.ILEmitter::StaticFlg
	IL_0eb9:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetVar()
	IL_0ebe:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetIf()
	IL_0ec3:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::ResetLbl()
	IL_0ec8:  ldloc 55

	IL_0ecc:  nop 
	IL_0ecd:  nop 
	IL_0ece:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Attrs
	IL_0ed3:  stloc 56

	IL_0ed7:  nop 
	IL_0ed8:  nop 
	IL_0ed9:  ldloc 56

	IL_0edd:  nop 
	IL_0ede:  nop 
	IL_0edf:  call valuetype [mscorlib]System.Reflection.MethodAttributes class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessMethodAttrs(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Attributes.Attribute[])
	IL_0ee4:  stloc 57

	IL_0ee8:  nop 
	IL_0ee9:  nop 
	IL_0eea:  ldloc 55

	IL_0eee:  nop 
	IL_0eef:  nop 
	IL_0ef0:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::MethodName
	IL_0ef5:  stloc 58

	IL_0ef9:  nop 
	IL_0efa:  nop 
	IL_0efb:  ldloc 58

	IL_0eff:  nop 
	IL_0f00:  nop 
	IL_0f01:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_0f06:  stloc 59

	IL_0f0a:  nop 
	IL_0f0b:  nop 
	IL_0f0c:  ldloc 55

	IL_0f10:  nop 
	IL_0f11:  nop 
	IL_0f12:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::Params
	IL_0f17:  stloc 60

	IL_0f1b:  nop 
	IL_0f1c:  nop 
	IL_0f1d:  ldloc 60

	IL_0f21:  nop 
	IL_0f22:  nop 
	IL_0f23:  ldlen 
	IL_0f24:  conv.i4 
	IL_0f25:  stloc 61

	IL_0f29:  nop 
	IL_0f2a:  nop 
	IL_0f2b:  ldloc 55

	IL_0f2f:  nop 
	IL_0f30:  nop 
	IL_0f31:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodStmt::RetTyp
	IL_0f36:  stloc 62

	IL_0f3a:  nop 
	IL_0f3b:  nop 
	IL_0f3c:  ldnull 
	IL_0f3d:  stloc 63

	IL_0f41:  nop 
	IL_0f42:  nop 
	IL_0f43:  ldloc 62

	IL_0f47:  nop 
	IL_0f48:  nop 
	IL_0f49:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_0f4e:  stloc 63

	IL_0f52:  nop 
	IL_0f53:  nop 
	IL_0f54:  ldc.i4 0
	IL_0f59:  conv.u 
	IL_0f5a:  newarr [mscorlib]System.Type
	IL_0f5f:  stsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_0f64:  ldloc 61

	IL_0f68:  nop 
	IL_0f69:  nop 
	IL_0f6a:  ldc.i4 0
	IL_0f6f:  beq IL_0f79

	IL_0f74:  br IL_0f7e

	IL_0f79:  br IL_0f8e

	IL_0f7e:  ldloc 60

	IL_0f82:  nop 
	IL_0f83:  nop 
	IL_0f84:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::ProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_0f89:  br IL_0f8e

	IL_0f8e:  ldsfld class [mscorlib]System.Reflection.Emit.TypeBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnTypB
	IL_0f93:  stloc 64

	IL_0f97:  nop 
	IL_0f98:  nop 
	IL_0f99:  ldloc 59

	IL_0f9d:  nop 
	IL_0f9e:  nop 
	IL_0f9f:  ldstr "^ctor\\d*$"
	IL_0fa4:  call bool class [dnu]dylan.NET.Utils.ParseUtils::LikeOP(string, string)
	IL_0fa9:  stloc 65

	IL_0fad:  nop 
	IL_0fae:  nop 
	IL_0faf:  ldloc 65

	IL_0fb3:  nop 
	IL_0fb4:  nop 
	IL_0fb5:  stloc 1

	IL_0fb9:  nop 
	IL_0fba:  nop 
	IL_0fbb:  ldloc 59

	IL_0fbf:  nop 
	IL_0fc0:  nop 
	IL_0fc1:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnTypName
	IL_0fc6:  call int32 string::Compare(string, string)
	IL_0fcb:  stloc 44

	IL_0fcf:  nop 
	IL_0fd0:  nop 
	IL_0fd1:  ldloc 44

	IL_0fd5:  nop 
	IL_0fd6:  nop 
	IL_0fd7:  ldc.i4 0
	IL_0fdc:  beq IL_0fe6

	IL_0fe1:  br IL_0ff6

	IL_0fe6:  ldc.i4 1
	IL_0feb:  stloc 65

	IL_0fef:  nop 
	IL_0ff0:  nop 
	IL_0ff1:  br IL_0ffb

	IL_0ff6:  br IL_0ffb

	IL_0ffb:  ldloc 1

	IL_0fff:  nop 
	IL_1000:  nop 
	IL_1001:  ldloc 65

	IL_1005:  nop 
	IL_1006:  nop 
	IL_1007:  or 
	IL_1008:  stloc 65

	IL_100c:  nop 
	IL_100d:  nop 
	IL_100e:  ldloc 65

	IL_1012:  nop 
	IL_1013:  nop 
	IL_1014:  ldc.i4 0
	IL_1019:  beq IL_1023

	IL_101e:  br IL_10bd

	IL_1023:  ldloc 64

	IL_1027:  nop 
	IL_1028:  nop 
	IL_1029:  ldloc 59

	IL_102d:  nop 
	IL_102e:  nop 
	IL_102f:  ldloc 57

	IL_1033:  nop 
	IL_1034:  nop 
	IL_1035:  ldloc 63

	IL_1039:  nop 
	IL_103a:  nop 
	IL_103b:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1040:  callvirt instance class [mscorlib]System.Reflection.Emit.MethodBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineMethod(string, valuetype [mscorlib]System.Reflection.MethodAttributes, class [mscorlib]System.Type, class [mscorlib]System.Type[])
	IL_1045:  stsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_104a:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitMtd()
	IL_104f:  ldstr "Adding Method: "
	IL_1054:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_1059:  ldloc 59

	IL_105d:  nop 
	IL_105e:  nop 
	IL_105f:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_1064:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_1069:  ldc.i4 0
	IL_106e:  beq IL_1078

	IL_1073:  br IL_1098

	IL_1078:  ldloc 59

	IL_107c:  nop 
	IL_107d:  nop 
	IL_107e:  ldloc 63

	IL_1082:  nop 
	IL_1083:  nop 
	IL_1084:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1089:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_108e:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddMet(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_1093:  br IL_10b8

	IL_1098:  ldloc 59

	IL_109c:  nop 
	IL_109d:  nop 
	IL_109e:  ldloc 63

	IL_10a2:  nop 
	IL_10a3:  nop 
	IL_10a4:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_10a9:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnMetB
	IL_10ae:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedMet(string, class [mscorlib]System.Type, class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.MethodBuilder)
	IL_10b3:  br IL_10b8

	IL_10b8:  br IL_1144

	IL_10bd:  ldc.i4 1
	IL_10c2:  stloc 66

	IL_10c6:  nop 
	IL_10c7:  nop 
	IL_10c8:  ldloc 64

	IL_10cc:  nop 
	IL_10cd:  nop 
	IL_10ce:  ldloc 57

	IL_10d2:  nop 
	IL_10d3:  nop 
	IL_10d4:  ldloc 66

	IL_10d8:  nop 
	IL_10d9:  nop 
	IL_10da:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_10df:  callvirt instance class [mscorlib]System.Reflection.Emit.ConstructorBuilder class [mscorlib]System.Reflection.Emit.TypeBuilder::DefineConstructor(valuetype [mscorlib]System.Reflection.MethodAttributes, valuetype [mscorlib]System.Reflection.CallingConventions, class [mscorlib]System.Type[])
	IL_10e4:  stsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_10e9:  call void class [dnr]dylan.NET.Reflection.AsmFactory::InitConstr()
	IL_10ee:  ldsfld bool [dnr]dylan.NET.Reflection.AsmFactory::isNested
	IL_10f3:  ldc.i4 0
	IL_10f8:  beq IL_1102

	IL_10fd:  br IL_1116

	IL_1102:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_1107:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_110c:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddCtor(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_1111:  br IL_112a

	IL_1116:  ldsfld class [mscorlib]System.Type[] [dnr]dylan.NET.Reflection.AsmFactory::TypArr
	IL_111b:  ldsfld class [mscorlib]System.Reflection.Emit.ConstructorBuilder [dnr]dylan.NET.Reflection.AsmFactory::CurnConB
	IL_1120:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddNestedCtor(class [mscorlib]System.Type[], class [mscorlib]System.Reflection.Emit.ConstructorBuilder)
	IL_1125:  br IL_112a

	IL_112a:  ldstr "Adding Constructor: "
	IL_112f:  call void class [dnu]dylan.NET.Utils.StreamUtils::Write(string)
	IL_1134:  ldloc 59

	IL_1138:  nop 
	IL_1139:  nop 
	IL_113a:  call void class [dnu]dylan.NET.Utils.StreamUtils::WriteLine(string)
	IL_113f:  br IL_1144

	IL_1144:  ldc.i4 1
	IL_1149:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_114e:  ldloc 59

	IL_1152:  nop 
	IL_1153:  nop 
	IL_1154:  stsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnMetName
	IL_1159:  ldloc 61

	IL_115d:  nop 
	IL_115e:  nop 
	IL_115f:  ldc.i4 0
	IL_1164:  beq IL_116e

	IL_1169:  br IL_1173

	IL_116e:  br IL_11ad

	IL_1173:  ldloc 65

	IL_1177:  nop 
	IL_1178:  nop 
	IL_1179:  ldc.i4 0
	IL_117e:  beq IL_1188

	IL_1183:  br IL_1198

	IL_1188:  ldloc 60

	IL_118c:  nop 
	IL_118d:  nop 
	IL_118e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParams(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_1193:  br IL_11a8

	IL_1198:  ldloc 60

	IL_119c:  nop 
	IL_119d:  nop 
	IL_119e:  call void class dylan.NET.Tokenizer.CodeGen.Helpers::PostProcessParamsConstr(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr[])
	IL_11a3:  br IL_11a8

	IL_11a8:  br IL_11ad

	IL_11ad:  br IL_1ab8

	IL_11b2:  br IL_11bc

	IL_11b7:  br IL_11bc

	IL_11bc:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndMethodStmt
	IL_11c1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_11c6:  stloc 0

	IL_11ca:  nop 
	IL_11cb:  nop 
	IL_11cc:  ldloc 0

	IL_11d0:  nop 
	IL_11d1:  nop 
	IL_11d2:  ldarg 1

	IL_11d6:  nop 
	IL_11d7:  nop 
	IL_11d8:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_11dd:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_11e2:  stloc 1

	IL_11e6:  nop 
	IL_11e7:  nop 
	IL_11e8:  ldloc 1

	IL_11ec:  nop 
	IL_11ed:  nop 
	IL_11ee:  ldc.i4 1
	IL_11f3:  beq IL_11fd

	IL_11f8:  br IL_1299

	IL_11fd:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRet()
	IL_1202:  ldc.i4 0
	IL_1207:  stsfld bool [dnr]dylan.NET.Reflection.AsmFactory::InMethodFlg
	IL_120c:  ldsfld class [mscorlib]System.Reflection.Emit.AssemblyBuilder [dnr]dylan.NET.Reflection.AsmFactory::AsmB
	IL_1211:  stloc 25

	IL_1215:  nop 
	IL_1216:  nop 
	IL_1217:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::CurnMetName
	IL_121c:  ldstr "main"
	IL_1221:  call int32 string::Compare(string, string)
	IL_1226:  stloc 67

	IL_122a:  nop 
	IL_122b:  nop 
	IL_122c:  ldsfld string [dnr]dylan.NET.Reflection.AsmFactory::AsmMode
	IL_1231:  ldstr "exe"
	IL_1236:  call int32 string::Compare(string, string)
	IL_123b:  stloc 68

	IL_123f:  nop 
	IL_1240:  nop 
	IL_1241:  ldloc 67

	IL_1245:  nop 
	IL_1246:  nop 
	IL_1247:  ldc.i4 0
	IL_124c:  beq IL_1256

	IL_1251:  br IL_128a

	IL_1256:  ldloc 68

	IL_125a:  nop 
	IL_125b:  nop 
	IL_125c:  ldc.i4 0
	IL_1261:  beq IL_126b

	IL_1266:  br IL_1280

	IL_126b:  ldloc 25

	IL_126f:  nop 
	IL_1270:  nop 
	IL_1271:  ldsfld class [mscorlib]System.Reflection.Emit.MethodBuilder [dnr]dylan.NET.Reflection.ILEmitter::Met
	IL_1276:  callvirt instance void class [mscorlib]System.Reflection.Emit.AssemblyBuilder::SetEntryPoint(class [mscorlib]System.Reflection.MethodInfo)
	IL_127b:  br IL_1285

	IL_1280:  br IL_1285

	IL_1285:  br IL_128f

	IL_128a:  br IL_128f

	IL_128f:  br IL_1ab8

	IL_1294:  br IL_129e

	IL_1299:  br IL_129e

	IL_129e:  ldnull 
	IL_129f:  stloc 71

	IL_12a3:  nop 
	IL_12a4:  nop 
	IL_12a5:  ldnull 
	IL_12a6:  stloc 72

	IL_12aa:  nop 
	IL_12ab:  nop 
	IL_12ac:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt
	IL_12b1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_12b6:  stloc 0

	IL_12ba:  nop 
	IL_12bb:  nop 
	IL_12bc:  ldloc 0

	IL_12c0:  nop 
	IL_12c1:  nop 
	IL_12c2:  ldarg 1

	IL_12c6:  nop 
	IL_12c7:  nop 
	IL_12c8:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_12cd:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_12d2:  stloc 1

	IL_12d6:  nop 
	IL_12d7:  nop 
	IL_12d8:  ldloc 1

	IL_12dc:  nop 
	IL_12dd:  nop 
	IL_12de:  ldc.i4 1
	IL_12e3:  beq IL_12ed

	IL_12e8:  br IL_1344

	IL_12ed:  ldarg 1

	IL_12f1:  nop 
	IL_12f2:  nop 
	IL_12f3:  stloc 73

	IL_12f7:  nop 
	IL_12f8:  nop 
	IL_12f9:  ldloc 73

	IL_12fd:  nop 
	IL_12fe:  nop 
	IL_12ff:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_1304:  ldnull 
	IL_1305:  beq IL_1335

	IL_130a:  br IL_130f

	IL_130f:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1314:  stloc 72

	IL_1318:  nop 
	IL_1319:  nop 
	IL_131a:  ldloc 72

	IL_131e:  nop 
	IL_131f:  nop 
	IL_1320:  ldloc 73

	IL_1324:  nop 
	IL_1325:  nop 
	IL_1326:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ReturnStmt::RExp
	IL_132b:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1330:  br IL_133a

	IL_1335:  br IL_133a

	IL_133a:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitRet()
	IL_133f:  br IL_1349

	IL_1344:  br IL_1349

	IL_1349:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt
	IL_134e:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1353:  stloc 0

	IL_1357:  nop 
	IL_1358:  nop 
	IL_1359:  ldloc 0

	IL_135d:  nop 
	IL_135e:  nop 
	IL_135f:  ldarg 1

	IL_1363:  nop 
	IL_1364:  nop 
	IL_1365:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_136a:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_136f:  stloc 1

	IL_1373:  nop 
	IL_1374:  nop 
	IL_1375:  ldloc 1

	IL_1379:  nop 
	IL_137a:  nop 
	IL_137b:  ldc.i4 1
	IL_1380:  beq IL_138a

	IL_1385:  br IL_1419

	IL_138a:  ldarg 1

	IL_138e:  nop 
	IL_138f:  nop 
	IL_1390:  stloc 74

	IL_1394:  nop 
	IL_1395:  nop 
	IL_1396:  ldloc 74

	IL_139a:  nop 
	IL_139b:  nop 
	IL_139c:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarName
	IL_13a1:  stloc 69

	IL_13a5:  nop 
	IL_13a6:  nop 
	IL_13a7:  ldloc 74

	IL_13ab:  nop 
	IL_13ac:  nop 
	IL_13ad:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarStmt::VarTyp
	IL_13b2:  stloc 70

	IL_13b6:  nop 
	IL_13b7:  nop 
	IL_13b8:  ldloc 70

	IL_13bc:  nop 
	IL_13bd:  nop 
	IL_13be:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_13c3:  stloc 71

	IL_13c7:  nop 
	IL_13c8:  nop 
	IL_13c9:  ldloc 69

	IL_13cd:  nop 
	IL_13ce:  nop 
	IL_13cf:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13d4:  ldloc 71

	IL_13d8:  nop 
	IL_13d9:  nop 
	IL_13da:  call void class [dnr]dylan.NET.Reflection.ILEmitter::DeclVar(string, class [mscorlib]System.Type)
	IL_13df:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_13e4:  ldc.i4 1
	IL_13e9:  add 
	IL_13ea:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_13ef:  ldloc 69

	IL_13f3:  nop 
	IL_13f4:  nop 
	IL_13f5:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_13fa:  ldc.i4 1
	IL_13ff:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_1404:  ldloc 71

	IL_1408:  nop 
	IL_1409:  nop 
	IL_140a:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_140f:  br IL_1ab8

	IL_1414:  br IL_141e

	IL_1419:  br IL_141e

	IL_141e:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt
	IL_1423:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1428:  stloc 0

	IL_142c:  nop 
	IL_142d:  nop 
	IL_142e:  ldloc 0

	IL_1432:  nop 
	IL_1433:  nop 
	IL_1434:  ldarg 1

	IL_1438:  nop 
	IL_1439:  nop 
	IL_143a:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_143f:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1444:  stloc 1

	IL_1448:  nop 
	IL_1449:  nop 
	IL_144a:  ldloc 1

	IL_144e:  nop 
	IL_144f:  nop 
	IL_1450:  ldc.i4 1
	IL_1455:  beq IL_145f

	IL_145a:  br IL_1515

	IL_145f:  ldarg 1

	IL_1463:  nop 
	IL_1464:  nop 
	IL_1465:  stloc 75

	IL_1469:  nop 
	IL_146a:  nop 
	IL_146b:  ldloc 75

	IL_146f:  nop 
	IL_1470:  nop 
	IL_1471:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarName
	IL_1476:  stloc 69

	IL_147a:  nop 
	IL_147b:  nop 
	IL_147c:  ldloc 75

	IL_1480:  nop 
	IL_1481:  nop 
	IL_1482:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::VarTyp
	IL_1487:  stloc 70

	IL_148b:  nop 
	IL_148c:  nop 
	IL_148d:  ldloc 70

	IL_1491:  nop 
	IL_1492:  nop 
	IL_1493:  call class [mscorlib]System.Type class dylan.NET.Tokenizer.CodeGen.Helpers::CommitEvalTTok(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.TypeToks.TypeTok)
	IL_1498:  stloc 71

	IL_149c:  nop 
	IL_149d:  nop 
	IL_149e:  ldloc 69

	IL_14a2:  nop 
	IL_14a3:  nop 
	IL_14a4:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_14a9:  ldloc 71

	IL_14ad:  nop 
	IL_14ae:  nop 
	IL_14af:  call void class [dnr]dylan.NET.Reflection.ILEmitter::DeclVar(string, class [mscorlib]System.Type)
	IL_14b4:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_14b9:  ldc.i4 1
	IL_14be:  add 
	IL_14bf:  stsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_14c4:  ldloc 69

	IL_14c8:  nop 
	IL_14c9:  nop 
	IL_14ca:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_14cf:  ldc.i4 1
	IL_14d4:  ldsfld int32 [dnr]dylan.NET.Reflection.ILEmitter::LocInd
	IL_14d9:  ldloc 71

	IL_14dd:  nop 
	IL_14de:  nop 
	IL_14df:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddVar(string, bool, int32, class [mscorlib]System.Type)
	IL_14e4:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_14e9:  stloc 72

	IL_14ed:  nop 
	IL_14ee:  nop 
	IL_14ef:  ldloc 72

	IL_14f3:  nop 
	IL_14f4:  nop 
	IL_14f5:  ldloc 69

	IL_14f9:  nop 
	IL_14fa:  nop 
	IL_14fb:  ldloc 75

	IL_14ff:  nop 
	IL_1500:  nop 
	IL_1501:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.VarAsgnStmt::RExpr
	IL_1506:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::StoreEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_150b:  br IL_1ab8

	IL_1510:  br IL_151a

	IL_1515:  br IL_151a

	IL_151a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt
	IL_151f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1524:  stloc 0

	IL_1528:  nop 
	IL_1529:  nop 
	IL_152a:  ldloc 0

	IL_152e:  nop 
	IL_152f:  nop 
	IL_1530:  ldarg 1

	IL_1534:  nop 
	IL_1535:  nop 
	IL_1536:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_153b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1540:  stloc 1

	IL_1544:  nop 
	IL_1545:  nop 
	IL_1546:  ldloc 1

	IL_154a:  nop 
	IL_154b:  nop 
	IL_154c:  ldc.i4 1
	IL_1551:  beq IL_155b

	IL_1556:  br IL_15c5

	IL_155b:  ldarg 1

	IL_155f:  nop 
	IL_1560:  nop 
	IL_1561:  stloc 76

	IL_1565:  nop 
	IL_1566:  nop 
	IL_1567:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_156c:  stloc 72

	IL_1570:  nop 
	IL_1571:  nop 
	IL_1572:  ldloc 76

	IL_1576:  nop 
	IL_1577:  nop 
	IL_1578:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::LExp
	IL_157d:  stloc 77

	IL_1581:  nop 
	IL_1582:  nop 
	IL_1583:  ldloc 77

	IL_1587:  nop 
	IL_1588:  nop 
	IL_1589:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token[] [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::Tokens
	IL_158e:  ldc.i4 0
	IL_1593:  conv.u 
	IL_1594:  ldelem [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token
	IL_1599:  stloc 78

	IL_159d:  nop 
	IL_159e:  nop 
	IL_159f:  ldloc 72

	IL_15a3:  nop 
	IL_15a4:  nop 
	IL_15a5:  ldloc 78

	IL_15a9:  nop 
	IL_15aa:  nop 
	IL_15ab:  ldloc 76

	IL_15af:  nop 
	IL_15b0:  nop 
	IL_15b1:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.AssignStmt::RExp
	IL_15b6:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::StoreEmit(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token, class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_15bb:  br IL_1ab8

	IL_15c0:  br IL_15ca

	IL_15c5:  br IL_15ca

	IL_15ca:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt
	IL_15cf:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_15d4:  stloc 0

	IL_15d8:  nop 
	IL_15d9:  nop 
	IL_15da:  ldloc 0

	IL_15de:  nop 
	IL_15df:  nop 
	IL_15e0:  ldarg 1

	IL_15e4:  nop 
	IL_15e5:  nop 
	IL_15e6:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_15eb:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_15f0:  stloc 1

	IL_15f4:  nop 
	IL_15f5:  nop 
	IL_15f6:  ldloc 1

	IL_15fa:  nop 
	IL_15fb:  nop 
	IL_15fc:  ldc.i4 1
	IL_1601:  beq IL_160b

	IL_1606:  br IL_167a

	IL_160b:  ldarg 1

	IL_160f:  nop 
	IL_1610:  nop 
	IL_1611:  stloc 79

	IL_1615:  nop 
	IL_1616:  nop 
	IL_1617:  newobj instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::'.ctor'()
	IL_161c:  stloc 80

	IL_1620:  nop 
	IL_1621:  nop 
	IL_1622:  ldloc 79

	IL_1626:  nop 
	IL_1627:  nop 
	IL_1628:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.MethodCallStmt::MethodToken
	IL_162d:  stloc 81

	IL_1631:  nop 
	IL_1632:  nop 
	IL_1633:  ldloc 81

	IL_1637:  nop 
	IL_1638:  nop 
	IL_1639:  ldc.i4 1
	IL_163e:  stfld bool [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.MethodCallTok::PopFlg
	IL_1643:  ldloc 80

	IL_1647:  nop 
	IL_1648:  nop 
	IL_1649:  ldloc 81

	IL_164d:  nop 
	IL_164e:  nop 
	IL_164f:  callvirt instance void class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr::AddToken(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token)
	IL_1654:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_1659:  stloc 72

	IL_165d:  nop 
	IL_165e:  nop 
	IL_165f:  ldloc 72

	IL_1663:  nop 
	IL_1664:  nop 
	IL_1665:  ldloc 80

	IL_1669:  nop 
	IL_166a:  nop 
	IL_166b:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_1670:  br IL_1ab8

	IL_1675:  br IL_167f

	IL_167a:  br IL_167f

	IL_167f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt
	IL_1684:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1689:  stloc 0

	IL_168d:  nop 
	IL_168e:  nop 
	IL_168f:  ldloc 0

	IL_1693:  nop 
	IL_1694:  nop 
	IL_1695:  ldarg 1

	IL_1699:  nop 
	IL_169a:  nop 
	IL_169b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_16a0:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_16a5:  stloc 1

	IL_16a9:  nop 
	IL_16aa:  nop 
	IL_16ab:  ldloc 1

	IL_16af:  nop 
	IL_16b0:  nop 
	IL_16b1:  ldc.i4 1
	IL_16b6:  beq IL_16c0

	IL_16bb:  br IL_171e

	IL_16c0:  ldarg 1

	IL_16c4:  nop 
	IL_16c5:  nop 
	IL_16c6:  stloc 85

	IL_16ca:  nop 
	IL_16cb:  nop 
	IL_16cc:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddIf()
	IL_16d1:  ldloc 85

	IL_16d5:  nop 
	IL_16d6:  nop 
	IL_16d7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.IfStmt::Exp
	IL_16dc:  stloc 86

	IL_16e0:  nop 
	IL_16e1:  nop 
	IL_16e2:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_16e7:  stloc 72

	IL_16eb:  nop 
	IL_16ec:  nop 
	IL_16ed:  ldloc 72

	IL_16f1:  nop 
	IL_16f2:  nop 
	IL_16f3:  ldloc 86

	IL_16f7:  nop 
	IL_16f8:  nop 
	IL_16f9:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_16fe:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_1703:  stloc 83

	IL_1707:  nop 
	IL_1708:  nop 
	IL_1709:  ldloc 83

	IL_170d:  nop 
	IL_170e:  nop 
	IL_170f:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBrfalse(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1714:  br IL_1ab8

	IL_1719:  br IL_1723

	IL_171e:  br IL_1723

	IL_1723:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt
	IL_1728:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_172d:  stloc 0

	IL_1731:  nop 
	IL_1732:  nop 
	IL_1733:  ldloc 0

	IL_1737:  nop 
	IL_1738:  nop 
	IL_1739:  ldarg 1

	IL_173d:  nop 
	IL_173e:  nop 
	IL_173f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1744:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1749:  stloc 1

	IL_174d:  nop 
	IL_174e:  nop 
	IL_174f:  ldloc 1

	IL_1753:  nop 
	IL_1754:  nop 
	IL_1755:  ldc.i4 1
	IL_175a:  beq IL_1764

	IL_175f:  br IL_17ee

	IL_1764:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_1769:  stloc 82

	IL_176d:  nop 
	IL_176e:  nop 
	IL_176f:  ldloc 82

	IL_1773:  nop 
	IL_1774:  nop 
	IL_1775:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_177a:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_177f:  stloc 83

	IL_1783:  nop 
	IL_1784:  nop 
	IL_1785:  ldloc 83

	IL_1789:  nop 
	IL_178a:  nop 
	IL_178b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1790:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::SetIfNxtBlkLbl()
	IL_1795:  ldarg 1

	IL_1799:  nop 
	IL_179a:  nop 
	IL_179b:  stloc 87

	IL_179f:  nop 
	IL_17a0:  nop 
	IL_17a1:  ldloc 87

	IL_17a5:  nop 
	IL_17a6:  nop 
	IL_17a7:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseIfStmt::Exp
	IL_17ac:  stloc 88

	IL_17b0:  nop 
	IL_17b1:  nop 
	IL_17b2:  newobj instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::'.ctor'()
	IL_17b7:  stloc 72

	IL_17bb:  nop 
	IL_17bc:  nop 
	IL_17bd:  ldloc 72

	IL_17c1:  nop 
	IL_17c2:  nop 
	IL_17c3:  ldloc 88

	IL_17c7:  nop 
	IL_17c8:  nop 
	IL_17c9:  callvirt instance void class dylan.NET.Tokenizer.CodeGen.Evaluator::Evaluate(class [tokenizer.AST]dylan.NET.Tokenizer.AST.Exprs.Expr)
	IL_17ce:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_17d3:  stloc 83

	IL_17d7:  nop 
	IL_17d8:  nop 
	IL_17d9:  ldloc 83

	IL_17dd:  nop 
	IL_17de:  nop 
	IL_17df:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBrfalse(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_17e4:  br IL_1ab8

	IL_17e9:  br IL_17f3

	IL_17ee:  br IL_17f3

	IL_17f3:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.ElseStmt
	IL_17f8:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_17fd:  stloc 0

	IL_1801:  nop 
	IL_1802:  nop 
	IL_1803:  ldloc 0

	IL_1807:  nop 
	IL_1808:  nop 
	IL_1809:  ldarg 1

	IL_180d:  nop 
	IL_180e:  nop 
	IL_180f:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1814:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1819:  stloc 1

	IL_181d:  nop 
	IL_181e:  nop 
	IL_181f:  ldloc 1

	IL_1823:  nop 
	IL_1824:  nop 
	IL_1825:  ldc.i4 1
	IL_182a:  beq IL_1834

	IL_182f:  br IL_186f

	IL_1834:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_1839:  stloc 82

	IL_183d:  nop 
	IL_183e:  nop 
	IL_183f:  ldloc 82

	IL_1843:  nop 
	IL_1844:  nop 
	IL_1845:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_184a:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_184f:  stloc 83

	IL_1853:  nop 
	IL_1854:  nop 
	IL_1855:  ldloc 83

	IL_1859:  nop 
	IL_185a:  nop 
	IL_185b:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1860:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::SetIfElsePass()
	IL_1865:  br IL_1ab8

	IL_186a:  br IL_1874

	IL_186f:  br IL_1874

	IL_1874:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.EndIfStmt
	IL_1879:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_187e:  stloc 0

	IL_1882:  nop 
	IL_1883:  nop 
	IL_1884:  ldloc 0

	IL_1888:  nop 
	IL_1889:  nop 
	IL_188a:  ldarg 1

	IL_188e:  nop 
	IL_188f:  nop 
	IL_1890:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1895:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_189a:  stloc 1

	IL_189e:  nop 
	IL_189f:  nop 
	IL_18a0:  ldloc 1

	IL_18a4:  nop 
	IL_18a5:  nop 
	IL_18a6:  ldc.i4 1
	IL_18ab:  beq IL_18b5

	IL_18b0:  br IL_191a

	IL_18b5:  call bool class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfElsePass()
	IL_18ba:  stloc 1

	IL_18be:  nop 
	IL_18bf:  nop 
	IL_18c0:  ldloc 1

	IL_18c4:  nop 
	IL_18c5:  nop 
	IL_18c6:  ldc.i4 0
	IL_18cb:  beq IL_18d5

	IL_18d0:  br IL_18f0

	IL_18d5:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfNxtBlkLbl()
	IL_18da:  stloc 83

	IL_18de:  nop 
	IL_18df:  nop 
	IL_18e0:  ldloc 83

	IL_18e4:  nop 
	IL_18e5:  nop 
	IL_18e6:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_18eb:  br IL_18f5

	IL_18f0:  br IL_18f5

	IL_18f5:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.SymTable::ReadIfEndLbl()
	IL_18fa:  stloc 82

	IL_18fe:  nop 
	IL_18ff:  nop 
	IL_1900:  ldloc 82

	IL_1904:  nop 
	IL_1905:  nop 
	IL_1906:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_190b:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::PopIf()
	IL_1910:  br IL_1ab8

	IL_1915:  br IL_191f

	IL_191a:  br IL_191f

	IL_191f:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt
	IL_1924:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1929:  stloc 0

	IL_192d:  nop 
	IL_192e:  nop 
	IL_192f:  ldloc 0

	IL_1933:  nop 
	IL_1934:  nop 
	IL_1935:  ldarg 1

	IL_1939:  nop 
	IL_193a:  nop 
	IL_193b:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1940:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1945:  stloc 1

	IL_1949:  nop 
	IL_194a:  nop 
	IL_194b:  ldloc 1

	IL_194f:  nop 
	IL_1950:  nop 
	IL_1951:  ldc.i4 1
	IL_1956:  beq IL_1960

	IL_195b:  br IL_1997

	IL_1960:  ldarg 1

	IL_1964:  nop 
	IL_1965:  nop 
	IL_1966:  stloc 90

	IL_196a:  nop 
	IL_196b:  nop 
	IL_196c:  ldloc 90

	IL_1970:  nop 
	IL_1971:  nop 
	IL_1972:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.LabelStmt::LabelName
	IL_1977:  stloc 89

	IL_197b:  nop 
	IL_197c:  nop 
	IL_197d:  ldloc 89

	IL_1981:  nop 
	IL_1982:  nop 
	IL_1983:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1988:  call void class dylan.NET.Tokenizer.CodeGen.SymTable::AddLbl(string)
	IL_198d:  br IL_1ab8

	IL_1992:  br IL_199c

	IL_1997:  br IL_199c

	IL_199c:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt
	IL_19a1:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_19a6:  stloc 0

	IL_19aa:  nop 
	IL_19ab:  nop 
	IL_19ac:  ldloc 0

	IL_19b0:  nop 
	IL_19b1:  nop 
	IL_19b2:  ldarg 1

	IL_19b6:  nop 
	IL_19b7:  nop 
	IL_19b8:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_19bd:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_19c2:  stloc 1

	IL_19c6:  nop 
	IL_19c7:  nop 
	IL_19c8:  ldloc 1

	IL_19cc:  nop 
	IL_19cd:  nop 
	IL_19ce:  ldc.i4 1
	IL_19d3:  beq IL_19dd

	IL_19d8:  br IL_1a25

	IL_19dd:  ldarg 1

	IL_19e1:  nop 
	IL_19e2:  nop 
	IL_19e3:  stloc 91

	IL_19e7:  nop 
	IL_19e8:  nop 
	IL_19e9:  ldloc 91

	IL_19ed:  nop 
	IL_19ee:  nop 
	IL_19ef:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.PlaceStmt::LabelName
	IL_19f4:  stloc 89

	IL_19f8:  nop 
	IL_19f9:  nop 
	IL_19fa:  ldloc 89

	IL_19fe:  nop 
	IL_19ff:  nop 
	IL_1a00:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a05:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.Helpers::GetLbl(string)
	IL_1a0a:  stloc 84

	IL_1a0e:  nop 
	IL_1a0f:  nop 
	IL_1a10:  ldloc 84

	IL_1a14:  nop 
	IL_1a15:  nop 
	IL_1a16:  call void class [dnr]dylan.NET.Reflection.ILEmitter::MarkLbl(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1a1b:  br IL_1ab8

	IL_1a20:  br IL_1a2a

	IL_1a25:  br IL_1a2a

	IL_1a2a:  ldtoken [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt
	IL_1a2f:  call class [mscorlib]System.Type class [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_1a34:  stloc 0

	IL_1a38:  nop 
	IL_1a39:  nop 
	IL_1a3a:  ldloc 0

	IL_1a3e:  nop 
	IL_1a3f:  nop 
	IL_1a40:  ldarg 1

	IL_1a44:  nop 
	IL_1a45:  nop 
	IL_1a46:  box [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.Stmt
	IL_1a4b:  callvirt instance bool class [mscorlib]System.Type::IsInstanceOfType(object)
	IL_1a50:  stloc 1

	IL_1a54:  nop 
	IL_1a55:  nop 
	IL_1a56:  ldloc 1

	IL_1a5a:  nop 
	IL_1a5b:  nop 
	IL_1a5c:  ldc.i4 1
	IL_1a61:  beq IL_1a6b

	IL_1a66:  br IL_1ab3

	IL_1a6b:  ldarg 1

	IL_1a6f:  nop 
	IL_1a70:  nop 
	IL_1a71:  stloc 92

	IL_1a75:  nop 
	IL_1a76:  nop 
	IL_1a77:  ldloc 92

	IL_1a7b:  nop 
	IL_1a7c:  nop 
	IL_1a7d:  ldfld class [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Ident [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.GotoStmt::LabelName
	IL_1a82:  stloc 89

	IL_1a86:  nop 
	IL_1a87:  nop 
	IL_1a88:  ldloc 89

	IL_1a8c:  nop 
	IL_1a8d:  nop 
	IL_1a8e:  ldfld string [tokenizer.AST]dylan.NET.Tokenizer.AST.Tokens.Token::Value
	IL_1a93:  call valuetype [mscorlib]System.Reflection.Emit.Label class dylan.NET.Tokenizer.CodeGen.Helpers::GetLbl(string)
	IL_1a98:  stloc 84

	IL_1a9c:  nop 
	IL_1a9d:  nop 
	IL_1a9e:  ldloc 84

	IL_1aa2:  nop 
	IL_1aa3:  nop 
	IL_1aa4:  call void class [dnr]dylan.NET.Reflection.ILEmitter::EmitBr(valuetype [mscorlib]System.Reflection.Emit.Label)
	IL_1aa9:  br IL_1ab8

	IL_1aae:  br IL_1ab8

	IL_1ab3:  br IL_1ab8

	IL_1ab8:  ret 
    } // end of method StmtReader::Read

    // method line 89
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xc8cc
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

    // method line 90
    .method public 
           instance default void EmitMSIL (class [tokenizer.AST]dylan.NET.Tokenizer.AST.Stmts.StmtSet stmts, string fpath)  cil managed 
    {
        // Method begins at RVA 0xc8e0
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

    // method line 91
    .method public specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0xca18
	// Code size 7 (0x7)
	.maxstack 2
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method CodeGenerator::.ctor

  } // end of class dylan.NET.Tokenizer.CodeGen.CodeGenerator
}

