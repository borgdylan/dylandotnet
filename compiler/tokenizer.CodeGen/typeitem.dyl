//    tokenizer.CodeGen.dll dylan.NET.Tokenizer.CodeGen Copyright (C) 2013 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class public partial TypeItem

    field public string Name
    field public boolean IsStatic
    //field public boolean IsANI
    field public Managed.Reflection.Type InhTyp
    field public Managed.Reflection.Type BakedTyp
    field public C5.IList<of Managed.Reflection.Type> Interfaces
    field public TypeBuilder TypeBldr
    field public EnumBuilder EnumBldr
    field public C5.HashDictionary<of string, C5.IList<of MethodItem> > Methods
    field public C5.IList<of CtorItem> Ctors
    field public C5.IList<of TypeItem> Types
    field public C5.HashDictionary<of string, FieldItem> Fields
    field public boolean IsEnum
    field public integer NrGenParams
    field public C5.HashDictionary<of string, TypeParamItem> TypGenParams
    field public C5.LinkedList<of GenericTypeParameterBuilder> GenParams
    field public AssemblyBuilder AsmB

    method private void TypeItem(var nme as string, var bld as TypeBuilder, var bld3 as EnumBuilder)
        mybase::ctor()
        Name = nme
        TypeBldr = bld
        EnumBldr = bld3
        Interfaces = new C5.LinkedList<of Managed.Reflection.Type>()
        Methods = new C5.HashDictionary<of string, C5.IList<of MethodItem> >(C5.MemoryType::Normal)
        Types = new C5.LinkedList<of TypeItem>()
        Ctors = new C5.LinkedList<of CtorItem>()
        Fields = new C5.HashDictionary<of string, FieldItem>(C5.MemoryType::Normal)
        TypGenParams = new C5.HashDictionary<of string, TypeParamItem>(C5.MemoryType::Normal)
        GenParams = new C5.LinkedList<of GenericTypeParameterBuilder>()
    end method

    method public void TypeItem(var nme as string, var bld as TypeBuilder)
        ctor(nme, bld, $EnumBuilder$null)
    end method

    method public void TypeItem(var nme as string, var bld3 as EnumBuilder)
        ctor(nme, $TypeBuilder$null, bld3)
        IsEnum = true
    end method

    method public void TypeItem()
        ctor(string::Empty, $TypeBuilder$null)
    end method

    method public void AddField(var f as FieldItem, var idt as Ident)
        if Fields::Contains(f::Name) then
            StreamUtils::WriteError(idt::Line, idt::Column, ILEmitter::CurSrcFile, i"Field '{f::Name}' is already declared in the current class!")
        end if

        Fields::Add(f::Name, f)
    end method

    method public void AddMethod(var m as MethodItem)
        if !Methods::Contains(m::Name) then
            Methods::Add(m::Name, new C5.LinkedList<of MethodItem>())
        end if

        Methods::get_Item(m::Name)::Add(m)
    end method

    method public void AddCtor(var c as CtorItem)
        Ctors::Add(c)
    end method

    method public void AddType(var t as TypeItem)
        Types::Add(t)
    end method

    method public void AddInterface(var i as Managed.Reflection.Type)
        Interfaces::Add(i)
    end method

    method public void NormalizeInterfaces()
        Interfaces = new C5.LinkedList<of Managed.Reflection.Type>() {AddAll(Enumerable::Distinct<of Managed.Reflection.Type>(Interfaces))}
    end method

    method public MethodInfo GetMethod(var nam as string, var paramst as Managed.Reflection.Type[], var auxt as Managed.Reflection.Type)
        if !Methods::Contains(nam) then
            return null
        end if

        var mil as MILambdas2 = new MILambdas2(nam, paramst, auxt)
        var bd as IEnumerable<of MethodInfo> = Enumerable::Select<of MethodItem, MethodInfo>(Methods::get_Item(nam),new Func<of MethodItem, MethodInfo>(mil::Bind))
        var lom2 as IEnumerable<of MethodInfo> = Enumerable::Where<of MethodInfo>(bd,new Func<of MethodInfo,boolean>(mil::DetermineIfCandidate))
        var matches as MethodInfo[] = Enumerable::ToArray<of MethodInfo>(lom2)

        if matches[l] == 0 then
            return null
        elseif matches[l] == 1 then
            Loader::MemberTyp = matches[0]::get_ReturnType()
            return matches[0]
        else
            var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of MethodInfo,integer[]>(lom2,new Func<of MethodInfo,integer[]>(MILambdas2::ExtractDeriveness)),new Func<of integer[],integer,integer[]>(MILambdas2::ZipDeriveness)),new Func<of integer[],integer[],integer[]>(MILambdas2::DerivenessMax))
            Loader::MemberTyp = matches[chosen[--chosen[l]]]::get_ReturnType()
            return matches[chosen[--chosen[l]]]
        end if
    end method

    method public MethodInfo GetGenericMethod(var nam as string, var genparams as Managed.Reflection.Type[], var paramst as Managed.Reflection.Type[], var auxt as Managed.Reflection.Type)
        if !Methods::Contains(nam) then
            return null
        end if

        var mil as MILambdas2 = new MILambdas2(nam, genparams[l])
        var mil2 as MILambdas2 = new MILambdas2(genparams, auxt)
        var mil3 as MILambdas2 = new MILambdas2(nam, paramst, auxt)
        var glom as IEnumerable<of MethodInfo> = Enumerable::Where<of MethodInfo>(Enumerable::Select<of MethodItem, MethodInfo>(Enumerable::Where<of MethodItem>(Methods::get_Item(nam) , new Func<of MethodItem,boolean>(mil::GenericMtdFilter)), new Func<of MethodItem,MethodInfo>(mil2::InstGenMtd)), new Func<of MethodInfo, boolean>(mil3::DetermineIfCandidate2))
        var matches as MethodInfo[] = Enumerable::ToArray<of MethodInfo>(glom)

        if matches[l] == 0 then
            return null
        elseif matches[l] == 1 then
            Loader::MemberTyp = matches[0]::get_ReturnType()
            return matches[0]
        else
            var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of MethodInfo,integer[]>(glom,new Func<of MethodInfo,integer[]>(MILambdas2::ExtractDeriveness2)),new Func<of integer[],integer,integer[]>(MILambdas2::ZipDeriveness)),new Func<of integer[],integer[],integer[]>(MILambdas2::DerivenessMax))
            Loader::MemberTyp = matches[chosen[--chosen[l]]]::get_ReturnType()
            return matches[chosen[--chosen[l]]]
        end if
    end method

    method public MethodItem GetProtoMethod(var nam as string, var paramst as Managed.Reflection.Type[])
        if !Methods::Contains(nam) then
            return null
        end if

        var mil as MILambdas2 = new MILambdas2(nam, paramst, TypeBldr)
        var lom2 as MethodItem[] = Enumerable::ToArray<of MethodItem>(Enumerable::Where<of MethodItem>(Methods::get_Item(nam),new Func<of MethodItem,boolean>(mil::DetermineIfProtoCandidate)))
        if lom2[l] > 0 then
            return lom2[0]
        else
            return null
        end if
    end method

    method public ConstructorInfo GetCtor(var paramst as Managed.Reflection.Type[], var auxt as Managed.Reflection.Type)
        var cil as CILambdas = new CILambdas(paramst, auxt)
        var bd as IEnumerable<of ConstructorInfo> = Enumerable::Select<of CtorItem, ConstructorInfo>(Ctors,new Func<of CtorItem, ConstructorInfo>(cil::Bind))
        var loc2 as IEnumerable<of ConstructorInfo> = Enumerable::Where<of ConstructorInfo>(bd,new Func<of ConstructorInfo,boolean>(cil::DetermineIfCandidate))
        var matches as ConstructorInfo[] = Enumerable::ToArray<of ConstructorInfo>(loc2)

        if matches[l] == 0 then
            if (paramst[l] == 0) and (Ctors::get_Count() == 0) then
                var cb as ConstructorBuilder = TypeBldr::DefineDefaultConstructor(MethodAttributes::Public)
                Ctors::Add(new CtorItem(Managed.Reflection.Type::EmptyTypes, cb))
                Loader::MemberTyp = TypeBldr
                return cb
            else
                return null
            end if
        elseif matches[l] == 1 then
            Loader::MemberTyp = TypeBldr
            return matches[0]
        else
            var chosen as integer[] = Enumerable::Aggregate<of integer[]>(Enumerable::Select<of integer[],integer[]>(Enumerable::Select<of ConstructorInfo,integer[]>(loc2,new Func<of ConstructorInfo,integer[]>(CILambdas::ExtractDeriveness())),new Func<of integer[],integer,integer[]>(CILambdas::ZipDeriveness())),new Func<of integer[],integer[],integer[]>(CILambdas::DerivenessMax()))
            Loader::MemberTyp = TypeBldr
            return matches[chosen[--chosen[l]]]
        end if
    end method

    method public FieldInfo GetField(var nam as string, var auxt as Managed.Reflection.Type)
        Loader::FldLitFlag = false
        Loader::EnumLitFlag = false

        //var fil as FILambdas = new FILambdas(nam)
        //var matches as FieldItem[] = Enumerable::ToArray<of FieldItem>(Enumerable::Where<of FieldItem>(Fields,new Func<of FieldItem,boolean>(fil::DetermineIfCandidate())))

        var fld as FieldItem = #ternary { Fields::Contains(nam) ? Fields::get_Item(nam), $FieldItem$null }
        var fldinfo as FieldInfo = #ternary { fld is null ? $FieldBuilder$null, fld::FieldBldr }

        //if matches[l] == 0 then
        //    fldinfo = null
        //else
        //    fld = matches[0]
        //    fldinfo = fld::FieldBldr
        //end if

        if fldinfo isnot null then
            fldinfo = fldinfo::BindTypeParameters(auxt)
            Loader::MemberTyp = fldinfo::get_FieldType()
            Loader::FldLitFlag = fldinfo::get_IsLiteral()
            Loader::EnumLitFlag = IsEnum
            if Loader::FldLitFlag then
                Loader::FldLitVal = fld::LitVal
                Loader::FldLitTyp = fldinfo::get_FieldType()
            end if
            if IsEnum then
                Loader::EnumLitTyp = InhTyp
            end if
        end if

        return fldinfo
    end method

    method public override string ToString()
        return Name
    end method

end class

#include "tilambdas.dyl"

class public TypeItem

    method public TypeItem GetTypeItem(var t as Managed.Reflection.Type)
        var til as TILambdas = new TILambdas(t)
        return Enumerable::FirstOrDefault<of TypeItem>(Enumerable::Where<of TypeItem>(Types,new Func<of TypeItem,boolean>(til::DetermineIfCandidateType)))
    end method

    method public TypeItem GetTypeItem(var nam as string)
        var til as TILambdas = new TILambdas(nam, 0)
        var lot2 as IEnumerable<of TypeItem> = Enumerable::Where<of TypeItem>(Types,new Func<of TypeItem,boolean>(til::DetermineIfCandidate))
        return Enumerable::FirstOrDefault<of TypeItem>(lot2)
    end method

    method public Managed.Reflection.Type GetType(var nam as string)
        var ti as TypeItem = GetTypeItem(nam)
        if ti == null then
            return null
        else
            return ti::BakedTyp ?? #ternary{ti::IsEnum ? ti::EnumBldr, ti::TypeBldr}
        end if
    end method

end class
