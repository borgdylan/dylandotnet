Imports System
Imports System.Windows.Forms
Imports System.Xml
Imports System.Xml.Linq

''' <summary>
''' Holds the symbol tables and conversions
''' </summary>
''' <remarks></remarks>
Module tables

    Public xmldoc As XElement = _
<a></a>

    Public xmlmembers As XElement = _
    <members></members>

    Public xmlmem As XElement = _
    <member></member>

    Public methods As XElement = _
    <Methods>
        <Counter>
            <Count>0</Count>
        </Counter>
    </Methods>

    Public fields As XElement = _
    <Fields>
        <Counter>
            <Count>0</Count>
        </Counter>
    </Fields>

    Public props As XElement = _
    <Properties>
        <Counter>
            <Count>0</Count>
        </Counter>
    </Properties>

    Public imp As XElement = _
    <imps>
        <Counter>
            <Count>0</Count>
        </Counter>
    </imps>

    ''' <summary>
    ''' The variable symbol table
    ''' </summary>
    ''' <remarks></remarks>
    Public vars As XElement = _
    <Vars>
        <Counter>
            <Count>0</Count>
        </Counter>
    </Vars>

    ''' <summary>
    ''' The label symbol table
    ''' </summary>
    ''' <remarks></remarks>
    Public labels As XElement = _
    <Labels>
        <Counter>
            <Count>0</Count>
        </Counter>
    </Labels>

    Public classes(-1) As String
    Public locimports(-1) As String

    ''' <summary>
    ''' Get the full type name from the short name
    ''' </summary>
    ''' <param name="type">the type name</param>
    ''' <returns>the full name</returns>
    ''' <remarks></remarks>
    Function GetTyp(ByVal type As String) As String
        GetTyp = ""
        Dim attach As Boolean = False
        Dim buf As String = ""
        Dim tmp As String = ""
        Dim sw As Boolean = False

        tmp = type
        type = ""

        Dim i As Integer = -1
        Do Until i = (tmp.Length - 1)
            i = i + 1
            Dim chr As Char = tmp.Chars(i)
            If chr = "&"c Or chr = "["c Or chr = "]"c Then
                sw = True
            End If
            If sw = True Then
                buf = buf & chr.ToString()
            Else
                type = type & chr.ToString()
            End If
        Loop

        If sw = True Then
            attach = True
        End If

        If type = "string" Then
            GetTyp = "System.String"
        ElseIf type = "integer" Then
            GetTyp = "System.Int32"
        ElseIf type = "double" Then
            GetTyp = "System.Double"
        ElseIf type = "boolean" Then
            GetTyp = "System.Boolean"
        ElseIf type = "char" Then
            GetTyp = "System.Char"
        ElseIf type = "decimal" Then
            GetTyp = "System.Decimal"
        ElseIf type = "long" Then
            GetTyp = "System.Int64"
        ElseIf type = "sbyte" Then
            GetTyp = "System.SByte"
        ElseIf type = "short" Then
            GetTyp = "System.Int16"
        ElseIf type = "single" Then
            GetTyp = "System.Single"
        ElseIf type = "object" Then
            GetTyp = "System.Object"
        ElseIf type = "void" Then
            GetTyp = "System.Void"
        ElseIf type = "me" Then
            GetTyp = extendclass
        Else
            GetTyp = type
        End If

        If attach = True Then
            GetTyp = GetTyp & buf
        End If

        Return GetTyp
    End Function

    Function GetCallConv(ByVal conv As String) As String
        GetCallConv = ""

        If conv = "winapi" Then
            GetCallConv = "System.Runtime.InteropServices.CallingConvention.Winapi"
        ElseIf conv = "cdecl" Then
            GetCallConv = "System.Runtime.InteropServices.CallingConvention.Cdecl"
        ElseIf conv = "stdcall" Then
            GetCallConv = "System.Runtime.InteropServices.CallingConvention.StdCall"
        ElseIf conv = "fastcall" Then
            GetCallConv = "System.Runtime.InteropServices.CallingConvention.FastCall"
        ElseIf conv = "thiscall" Then
            GetCallConv = "System.Runtime.InteropServices.CallingConvention.ThisCall"
        Else
            errorhappened = True
            Console.WriteLine(WriteErrInfo("Wrong Calling Convention: " & conv))
        End If

    End Function

    Function GetCharSet(ByVal charset As String) As String
        GetCharSet = ""

        If charset = "auto" Then
            GetCharSet = "System.Runtime.InteropServices.CharSet.Auto"
        ElseIf charset = "unicode" Then
            GetCharSet = "System.Runtime.InteropServices.CharSet.Unicode"
        ElseIf charset = "ansi" Then
            GetCharSet = "System.Runtime.InteropServices.CharSet.Ansi"
        Else
            errorhappened = True
            Console.WriteLine(WriteErrInfo("Wrong CharSet: " & charset))
        End If

    End Function

    ''' <summary>
    ''' Gets the full method attribute from the short version
    ''' </summary>
    ''' <param name="attr">the short name of the attribute</param>
    ''' <returns>the full name of the attribute</returns>
    ''' <remarks></remarks>
    Function GetMetAttrs(ByVal attr As String) As String
        GetMetAttrs = ""

        If attr = "hidebysig" Then
            GetMetAttrs = "MethodAttributes.HideBySig"
        ElseIf attr = "specialname" Then
            GetMetAttrs = "MethodAttributes.SpecialName"
        ElseIf attr = "private" Then
            GetMetAttrs = "MethodAttributes.Private"
        ElseIf attr = "public" Then
            GetMetAttrs = "MethodAttributes.Public"
        ElseIf attr = "static" Then
            GetMetAttrs = "MethodAttributes.Static"
        ElseIf attr = "virtual" Then
            GetMetAttrs = "MethodAttributes.Virtual"
        ElseIf attr = "abstract" Then
            GetMetAttrs = "MethodAttributes.Abstract"
        ElseIf attr = "newslot" Then
            GetMetAttrs = "MethodAttributes.NewSlot"
        ElseIf attr = "pinvokeimpl" Then
            GetMetAttrs = "MethodAttributes.PinvokeImpl"
        Else
            errorhappened = True
            Console.WriteLine(WriteErrInfo("Wrong Method Attribute: " & attr))
        End If

        Return GetMetAttrs
    End Function

    ''' <summary>
    ''' Gets the full method implementation flag from the short version
    ''' </summary>
    ''' <param name="flag">the short name of the attribute</param>
    ''' <returns>the full name of the attribute</returns>
    ''' <remarks></remarks>
    Function GetMetImplFlags(ByVal flag As String) As String
        GetMetImplFlags = ""

        If flag = "cil" Then
            GetMetImplFlags = "MethodImplAttributes.IL"
        ElseIf flag = "runtime" Then
            GetMetImplFlags = "MethodImplAttributes.Runtime"
        ElseIf flag = "managed" Then
            GetMetImplFlags = "MethodImplAttributes.Managed"
        ElseIf flag = "preservesig" Then
            GetMetImplFlags = "MethodImplAttributes.PreserveSig"
        ElseIf flag = "internalcall" Then
            GetMetImplFlags = "MethodImplAttributes.InternalCall"
        Else
            errorhappened = True
            Console.WriteLine(WriteErrInfo("Wrong Method Implementation Flag: " & flag))
        End If

        Return GetMetImplFlags
    End Function


    ''' <summary>
    ''' Gets the full property attribute from the short version
    ''' </summary>
    ''' <param name="attr">the short name of the attribute</param>
    ''' <returns>the full name of the attribute</returns>
    ''' <remarks></remarks>
    Function GetPropAttrs(ByVal attr As String) As String
        GetPropAttrs = ""

        If attr = "hasdefault" Then
            GetPropAttrs = "System.Reflection.PropertyAttributes.HasDefault"
        ElseIf attr = "none" Then
            GetPropAttrs = "System.Reflection.PropertyAttributes.None"
        ElseIf attr = "specialname" Then
            GetPropAttrs = "System.Reflection.PropertyAttributes.SpecialName"
        Else
            errorhappened = True
            Console.WriteLine(WriteErrInfo("Wrong Property Attribute: " & attr))
        End If

        Return GetPropAttrs
    End Function

    ''' <summary>
    ''' Gets the full type attribute from the short version
    ''' </summary>
    ''' <param name="attr">the short name of the attribute</param>
    ''' <returns>the full name of the attribute</returns>
    ''' <remarks></remarks>
    Function GetTypAttrs(ByVal attr As String) As String
        GetTypAttrs = ""

        If attr = "abstract" Then
            GetTypAttrs = "TypeAttributes.Abstract"
        ElseIf attr = "auto" Then
            GetTypAttrs = "TypeAttributes.AutoLayout"
        ElseIf attr = "sequential" Then
            GetTypAttrs = "TypeAttributes.SequentialLayout"
        ElseIf attr = "autochar" Then
            GetTypAttrs = "TypeAttributes.AutoClass"
        ElseIf attr = "ansi" Then
            GetTypAttrs = "TypeAttributes.AnsiClass"
        ElseIf attr = "beforefieldinit" Then
            GetTypAttrs = "TypeAttributes.BeforeFieldInit"
        ElseIf attr = "public" Then
            GetTypAttrs = "TypeAttributes.Public"
        ElseIf attr = "sealed" Then
            GetTypAttrs = "TypeAttributes.Sealed"
        ElseIf attr = "interface" Then
            GetTypAttrs = "TypeAttributes.Interface"
        Else
            errorhappened = True
            Console.WriteLine(WriteErrInfo("Wrong Type Attribute: " & attr))
        End If

        Return GetTypAttrs
    End Function

    ''' <summary>
    ''' Gets the full type attribute from the short version
    ''' </summary>
    ''' <param name="attr">the short name of the attribute</param>
    ''' <returns>the full name of the attribute</returns>
    ''' <remarks></remarks>
    Function GetFieldAttrs(ByVal attr As String) As String
        GetFieldAttrs = ""

        If attr = "initonly" Then
            GetFieldAttrs = "FieldAttributes.InitOnly"
        ElseIf attr = "literal" Then
            GetFieldAttrs = "FieldAttributes.Literal"
        ElseIf attr = "private" Then
            GetFieldAttrs = "FieldAttributes.Private"
        ElseIf attr = "static" Then
            GetFieldAttrs = "FieldAttributes.Static"
        ElseIf attr = "public" Then
            GetFieldAttrs = "FieldAttributes.Public"
        ElseIf attr = "assembly" Then
            GetFieldAttrs = "FieldAttributes.Assembly"
        Else
            errorhappened = True
            Console.WriteLine(WriteErrInfo("Wrong Field Attribute: " & attr))
        End If

        Return GetFieldAttrs
    End Function


    ''' <summary>
    ''' gets the operator name for use in if functions
    ''' </summary>
    ''' <param name="op">the operator</param>
    ''' <returns>Ceq, Clt or Cgt which are MSIL instructions</returns>
    ''' <remarks></remarks>
    Function GetOP(ByVal op As String) As String
        GetOP = ""

        If op = "=" Or op = "==" Then
            GetOP = "Beq"
        ElseIf op = "<>" Or op = "!=" Then
            GetOP = "Beq"
        ElseIf op = ">" Then
            GetOP = "Bgt"
        ElseIf op = "<" Then
            GetOP = "Blt"
        ElseIf op = ">=" Then
            GetOP = "Bge"
        ElseIf op = "<=" Then
            GetOP = "Ble"
        End If

        Return GetOP

    End Function

    ''' <summary>
    ''' Produces a GetType statement 
    ''' </summary>
    ''' <param name="TypeName">The full type name</param>
    ''' <returns>a gettype statment</returns>
    ''' <remarks></remarks>
    Function MakeGetType(ByVal TypeName As String) As String
        MakeGetType = ""

        'Dim attachbrackets As Boolean = False
        Dim suffix As String = ""

        Dim buf As String = ""
        Dim tmp As String = ""
        Dim sw As Boolean = False

        tmp = TypeName
        TypeName = ""

        Dim i As Integer = -1
        Do Until i = (tmp.Length - 1)
            i = i + 1
            Dim chr As Char = tmp.Chars(i)
            If chr = "&"c Or chr = "["c Or chr = "]"c Then
                sw = True
            End If
            If sw = True Then
                buf = buf & chr.ToString()
            Else
                TypeName = TypeName & chr.ToString()
            End If
        Loop

        If buf <> "" Then
            If buf = "[]" Then
                suffix = ".MakeArrayType()"
            ElseIf buf = "&" Then
                suffix = ".MakeByRefType()"
            ElseIf buf = "[]&" Then
                suffix = ".MakeArrayType().MakeByRefType()"
            ElseIf buf = "&[]" Then
                suffix = ".MakeByRefType().MakeArrayType()"
            End If
        End If


        Dim left As String = "("
        Dim right As String = ")"

        If TypeName Like "*<*>" Then

            'If TypeName Like "{*}*" Then
            '    left = "["
            '    right = "]"
            'End If

            'Dim len As Integer = TypeName.Length - 1
            'Dim i As Integer = -1

            'Dim out As String = ""
            'Dim buffer As String = ""
            'Dim buf As Boolean = False
            'Dim bufdepth As Integer = 0

            'Do Until i = len

            '    i = i + 1
            '    Dim ch As String = TypeName.Chars(i)

            '    If ch = "<" Then
            '        bufdepth = bufdepth + 1

            '        If buffer <> "" Then
            '            buffer = (buffer)
            '            out = out & buffer
            '            buffer = ""
            '        End If

            '        out = out & left
            '        If left = "(" Then
            '            out = out & "Of "
            '        End If
            '        buf = True
            '    ElseIf ch = ">" Then

            '        bufdepth = bufdepth - 1

            '        If buffer <> "" Then
            '            buffer = GetTyp(buffer)
            '            out = out & buffer
            '            buffer = ""
            '        End If

            '        out = out & right

            '        If bufdepth = 0 Then
            '            buf = False
            '        End If

            '    Else
            '        If buf = True Then
            '            buffer = buffer & ch
            '        Else
            '            out = out & ch
            '        End If
            '    End If

            'Loop

            'TypeName = out


            Dim split() As String = StringParser2ds(TypeName, "<", ">")
            TypeName = split(0) & "(Of "
            Dim typlist() As String = StringParser(split(1), ",")
            For Each s As String In typlist
                s = s.Trim()
                s = GetTyp(s)
                TypeName = TypeName & s & ", "
            Next

            TypeName = TypeName.Trim()
            TypeName = TypeName.Trim(",")
            TypeName = TypeName & ")"

        End If

        'Dim brackets As String = "()"

        'If TypeName Like "{*}*" Then

        '    brackets = "[]"

        '    Dim nssplit() As String = StringParser2ds(TypeName, "{", "}")

        '    Dim assem As String = nssplit(0)
        '    Dim typen As String = nssplit(1)

        '    Dim nssearch As XElement = _
        '    <Root>
        '        <%= From el In imp.<ns>.<Name> _
        '            Where assem = el.Value _
        '            Select el.Attribute("id").Value %>
        '    </Root>

        '    If nssearch.Value <> "" Then

        '        Dim nsvar As XElement = _
        '        <Root>
        '            <%= From el In imp.<ns>.<Var> _
        '                Where el.Attribute("id").Value = nssearch.Value _
        '                Select el.Value %>
        '        </Root>

        '        If attachbrackets = True Then
        '            typen = typen & brackets
        '        End If

        '        MakeGetType = nsvar.Value & ".GetType(""" & typen & """)"

        '    Else
        '        If attachbrackets = True Then
        '            typen = typen & brackets
        '        End If


        'MakeGetType = "GetType(" & typen & ")"
        '    End If
        'Else

        'Dim nssearch As XElement = _
        '<Root>
        '    <%= From el In imp.<ns>.<Name> _
        '        Where TypeName Like el.Value & "*" _
        '        Select el.Attribute("id").Value %>
        '</Root>

        'If nssearch.Value <> "" Then

        '    Dim nsvar As XElement = _
        '    <Root>
        '        <%= From el In imp.<ns>.<Var> _
        '            Where el.Attribute("id").Value = nssearch.Value _
        '            Select el.Value %>
        '    </Root>

        'If attachbrackets = True Then
        '    TypeName = TypeName & brackets
        'End If

        'MakeGetType = nsvar.Value & ".GetType(""" & TypeName & """)"

        'Else

        Dim local As Boolean = False

        For Each s As String In classes
            If s = TypeName Then
                local = True
            Else
                For Each li As String In locimports
                    If (li & "." & TypeName) = s Then
                        local = True
                        TypeName = li & "." & TypeName
                    End If
                Next
            End If

        Next

        If local = True Then
            TypeName = TypeName
            MakeGetType = "asm.GetType(""" & TypeName & """)" & suffix
        Else
            TypeName = TypeName
            'MakeGetType = "asm.GetType((" & TypeName & ")"
            MakeGetType = "GetType(" & TypeName & ")" & suffix
        End If
        'End If
        'End If


        Return MakeGetType
    End Function

    Function xmldoctype(ByVal constructtype As String) As String

        If constructtype = "class" Then
            Return "T"
        ElseIf constructtype = "method" Then
            Return "M"
        ElseIf constructtype = "field" Then
            Return "F"
        Else
            Return ""
        End If

    End Function

End Module
