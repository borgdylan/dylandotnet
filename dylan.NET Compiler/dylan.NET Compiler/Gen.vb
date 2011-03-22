Imports System.Windows.Forms

''' <summary>
''' The codegen module
''' </summary>
''' <remarks></remarks>
Module Gen

    ''' <summary>
    ''' The richtextbox containg the VB reflection code.
    ''' </summary>
    ''' <remarks></remarks>
    Public rtb As RichTextBox = New RichTextBox()

    ''' <summary>
    ''' The richtextbox containg the main method reflection code.
    ''' </summary>
    ''' <remarks></remarks>
    Public rtbmain As RichTextBox = New RichTextBox()

    Public resrtb As RichTextBox = New RichTextBox()

    Public impns(-1) As String

    Public rtbutil As RichTextBox = New RichTextBox()

    Public ver() As String = {"0", "0", "0", "0"}

    Public extendclass As String = ""

    Public EnumType As String = ""

    Public mkasm As Boolean = True

    Public resarr(-1) As String

    ''' <summary>
    ''' The current class
    ''' </summary>
    ''' <remarks></remarks>
    Public CurObj As String = ""

    ''' <summary>
    ''' The current method
    ''' </summary>
    ''' <remarks></remarks>
    Public CurMet As String = ""

    ''' <summary>
    ''' The current property
    ''' </summary>
    ''' <remarks></remarks>
    Public CurProp As String = ""

    ''' <summary>
    ''' The current namespace
    ''' </summary>
    ''' <remarks></remarks>
    Public CurNS As String = ""

    Public CurItem As String = ""

    ''' <summary>
    ''' the default namespace for the assembly
    ''' </summary>
    ''' <remarks></remarks>
    Public DefNS As String = ""

    ''' <summary>
    ''' The assembly name
    ''' </summary>
    ''' <remarks></remarks>
    Public asmName As String = "asm"

    ''' <summary>
    ''' The local var index
    ''' </summary>
    ''' <remarks></remarks>
    Public locind As Integer = -1

    ''' <summary>
    ''' the argument index
    ''' </summary>
    ''' <remarks></remarks>
    Public argind As Integer = -1

    ''' <summary>
    ''' The destination address fro the VB reflection code
    ''' </summary>
    ''' <remarks></remarks>
    Public da As String = ""

    ''' <summary>
    ''' The index of if functions
    ''' </summary>
    ''' <remarks></remarks>
    Public ifind As Integer = -1

    ''' <summary>
    ''' The index of try catch stmts
    ''' </summary>
    ''' <remarks></remarks>
    Public tind As Integer = -1

    ''' <summary>
    ''' The label index
    ''' </summary>
    ''' <remarks></remarks>
    Public lind As Integer = -1

    ''' <summary>
    ''' the type of assembly
    ''' </summary>
    ''' <remarks></remarks>
    Public asmtyp As String = "exe"

    ''' <summary>
    ''' Variable declaration index
    ''' </summary>
    ''' <remarks></remarks>
    Public varind As Integer = -1

    Public callconv As String = GetCallConv("winapi")
    Public charset As String = GetCharSet("auto")
    Public dllimport As String = ""

    ''' <summary>
    ''' begins the codegen
    ''' </summary>
    ''' <remarks></remarks>
    Sub Begin()
        rtb.Text = ""


        rtb.Text = rtb.Text & _
"Module Module1" & vbCrLf & vbCrLf


    End Sub

    ''' <summary>
    ''' Saves the xml documentation
    ''' </summary>
    ''' <remarks></remarks>
    Sub SaveDoc()

        Try

            Dim slashcount As Integer = 0
            Dim len As Integer = Module1.address.Length - 1
            Dim i As Integer = -1

            Do Until i = len

                i = i + 1
                Dim ch As String = Module1.address.Chars(i)
                If ch = "\" Then
                    slashcount = i
                End If

            Loop

            Dim d As String = ""
            i = -1

            Do Until i = slashcount
                i = i + 1
                d = d & Module1.address.Chars(i)
            Loop

            If My.Computer.FileSystem.DirectoryExists(d) = True Then

            Else

                My.Computer.FileSystem.CreateDirectory(d)

            End If

            da = d

        Catch ex As Exception
        End Try

        My.Computer.FileSystem.WriteAllText(da & "\" & asmName & ".xml", xmldoc.ToString(), False)

        Console.WriteLine("XML Documentation Saved")

    End Sub

    ''' <summary>
    ''' Saves the reflection code
    ''' </summary>
    ''' <remarks></remarks>
    Sub Save()

        Try

            Dim slashcount As Integer = 0
            Dim len As Integer = Module1.address.Length - 1
            Dim i As Integer = -1

            Do Until i = len

                i = i + 1
                Dim ch As String = Module1.address.Chars(i)
                If ch = "\" Then
                    slashcount = i
                End If

            Loop

            Dim d As String = ""
            i = -1

            Do Until i = slashcount
                i = i + 1
                d = d & Module1.address.Chars(i)
            Loop

            If My.Computer.FileSystem.DirectoryExists(d) = True Then

            Else

                My.Computer.FileSystem.CreateDirectory(d)

            End If

            da = d

        Catch ex As Exception
        End Try

        My.Computer.FileSystem.WriteAllText(da & "\" & "make_" & asmName & ".vb", rtb.Text, False)

        If mkasm = True Then
            If errorhappened = False Then
                CompileVBtoNET.Menu(da & "\" & "make_" & asmName & ".vb")
                If FileIO.FileSystem.FileExists(da & "\" & "make_" & asmName & ".exe") Then
                    System.Diagnostics.Process.Start(da & "\" & "make_" & asmName & ".exe")
                Else
                    Console.WriteLine("The program to make your assembly cannot be found as it could be compiled!")
                End If
            End If
        End If

    End Sub

    ''' <summary>
    ''' Makes the assembly
    ''' </summary>
    ''' <param name="name">the assembly name</param>
    ''' <param name="type">the assembly typr(exe or dll)</param>
    ''' <remarks></remarks>
    Sub MakeAsm(ByVal name As String, ByVal type As String)

        Console.WriteLine("Beginning Assembly: " & name)

        asmName = name
        CurNS = name
        DefNS = CurNS
        asmtyp = "." & type

        tables.imp.<Counter>.<Count>.Value = CStr(CInt(tables.imp.<Counter>.<Count>.Value) + 1)

        Dim id As String = tables.imp.<Counter>.<Count>.Value

        Dim ns As XElement = <ns>
                                 <Name id=<%= id %>><%= asmName %></Name>
                                 <Var id=<%= id %>>asm</Var>
                             </ns>

        tables.imp.Add(ns)

        xmldoc = <doc>
                     <assembly>
                         <name><%= name %></name>
                     </assembly>
                 </doc>


        Gen.rtbmain.Text = Gen.rtbmain.Text & "addstr(""" & asmName & """)" & vbCrLf & _
            "addasm(" & "asm" & ")" & vbCrLf

        If debug = True Then

            Gen.rtbmain.Text = Gen.rtbmain.Text & "Dim daType As Type = GetType(DebuggableAttribute)" & vbCrLf & _
            "Dim daCtor As ConstructorInfo = daType.GetConstructor(New Type() { GetType(DebuggableAttribute.DebuggingModes) })" & vbCrLf & _
            "Dim daBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(daCtor, New Object() {DebuggableAttribute.DebuggingModes.DisableOptimizations Or _" & vbCrLf & _
            "DebuggableAttribute.DebuggingModes.Default })" & vbCrLf & _
            "asm.SetCustomAttribute(daBuilder)" & vbCrLf & vbCrLf
        End If

        Try

            Dim slashcount As Integer = 0
            Dim len As Integer = Module1.address.Length - 1
            Dim i As Integer = -1

            Do Until i = len

                i = i + 1
                Dim ch As String = Module1.address.Chars(i)
                If ch = "\" Then
                    slashcount = i
                End If

            Loop

            Dim d As String = ""
            i = -1

            Do Until i = slashcount
                i = i + 1
                d = d & Module1.address.Chars(i)
            Loop

            If My.Computer.FileSystem.DirectoryExists(d) = True Then

            Else

                My.Computer.FileSystem.CreateDirectory(d)

            End If

            da = d

        Catch ex As Exception
        End Try

        rtb.Text = rtb.Text & "Public asmName As AssemblyName" & vbCrLf & _
        "Public asm As AssemblyBuilder" & vbCrLf & _
        "Public Typ As Type" & vbCrLf & _
        "Public Typ02 As Type" & vbCrLf & _
        "Public Typ03 As Type" & vbCrLf & _
        "Public Typ04 As Type" & vbCrLf & _
        "Public impstr(-1) As String" & vbCrLf & _
        "Public impasm(-1) As Assembly" & vbCrLf & _
        "Public interfacebool As Boolean" & vbCrLf & _
        "Public mdl As ModuleBuilder" & vbCrLf & _
        "Public resw As IResourceWriter" & vbCrLf & _
        "Public resobj As Object" & vbCrLf & vbCrLf

        If debug = True Then
            rtb.Text = rtb.Text & "Dim doc As ISymbolDocumentWriter" & vbCrLf & vbCrLf
        End If

        rtb.Text = rtb.Text & "Sub addstr(ByVal str As String)" & vbCrLf & _
        "ReDim Preserve impstr(UBound(impstr) + 1)" & vbCrLf & _
        "impstr(UBound(impstr)) = str" & vbCrLf & _
        "End Sub" & vbCrLf & vbCrLf & _
        "Sub addasm(ByVal asm As Assembly)" & vbCrLf & _
        "ReDim Preserve impasm(UBound(impasm) + 1)" & vbCrLf & _
        "impasm(UBound(impasm)) = asm" & vbCrLf & _
        "End Sub" & vbCrLf & vbCrLf & _
       "Function MakeGetType(ByVal TypeName As String) As Type" & vbCrLf & _
        "Dim attachbrackets As Boolean = False" & vbCrLf & _
        "If TypeName Like ""*[[]*]"" Then" & vbCrLf & _
        "Dim split As String() = TypeName.Split(New [Char] () {""["",""]""})" & vbCrLf & _
        "TypeName = split(0)" & vbCrLf & _
        "attachbrackets = True" & vbCrLf & _
        "End If" & vbCrLf & _
        "Dim ind As Integer = -1" & vbCrLf & _
        "Dim i As Integer = -1" & vbCrLf & _
        "Dim len As Integer = impstr.Length - 1" & vbCrLf & _
        "Do Until i = len" & vbCrLf & _
        "i = i + 1" & vbCrLf & _
        "If TypeName Like impstr(i) & ""*"" Then" & vbCrLf & _
        "ind = i" & vbCrLf & _
        "End If" & vbCrLf & _
        "Loop" & vbCrLf & _
        "If ind <> -1 Then" & vbCrLf & _
        "Dim assem As Assembly = impasm(ind)" & vbCrLf & _
        "If attachbrackets = True Then" & vbCrLf & _
        "TypeName = TypeName & ""[]""" & vbCrLf & _
        "End If" & vbCrLf & _
        "MakeGetType = assem.GetType(TypeName)" & vbCrLf & _
        "Else" & vbCrLf & _
        "If attachbrackets = True Then" & vbCrLf & _
        "TypeName = TypeName & ""[]""" & vbCrLf & _
        "End If" & vbCrLf & _
        "MakeGetType = Type.GetType(TypeName)" & vbCrLf & _
        "End If" & vbCrLf & _
        "Return MakeGetType" & vbCrLf & _
        "End Function" & vbCrLf

    End Sub

    Sub DeclareEnum(ByVal name As String, ByVal attributes As String, ByVal type As String)
        Console.WriteLine("   Adding Enum: " & name)

        EnumType = GetTyp(type)

        tables.methods = <Methods>
                             <Counter>
                                 <Count>0</Count>
                             </Counter>
                         </Methods>

        tables.fields = _
   <Fields>
       <Counter>
           <Count>0</Count>
       </Counter>
   </Fields>

        typind = -1
        lind = -1

        rtb.Text = rtb.Text & "Sub " & name & "()" & vbCrLf & _
        "Dim " & name & " As EnumBuilder = mdl.DefineEnum(""" & CurNS & """ & ""."" & " & """" & name & """" & ", " & attributes & ", " & MakeGetType(type) & ")" & vbCrLf


        CurObj = name
        CurItem = name

        rtbmain.Text = rtbmain.Text & CurObj & "()" & vbCrLf

    End Sub

    Sub DeclareClass(ByVal name As String, ByVal attributes As String, ByVal extend As String, ByVal interf As String)
        Console.WriteLine("   Adding Class: " & name)

        extend = GetTyp(extend)

        tables.methods = <Methods>
                             <Counter>
                                 <Count>0</Count>
                             </Counter>
                         </Methods>

        tables.fields = _
   <Fields>
       <Counter>
           <Count>0</Count>
       </Counter>
   </Fields>

        typind = -1
        lind = -1

        If interf = "no" Then
            rtb.Text = rtb.Text & "Sub " & name & "()" & vbCrLf & _
            "Dim " & name & " As TypeBuilder = mdl.DefineType(""" & CurNS & """ & ""."" & " & """" & name & """" & ", " & attributes & ", " & MakeGetType(extend) & ")" & vbCrLf
        Else
            rtb.Text = rtb.Text & "Sub " & name & "()" & vbCrLf & _
        "Dim " & name & " As TypeBuilder = mdl.DefineType(""" & CurNS & """ & ""."" & " & """" & name & """" & ", " & attributes & ")" & vbCrLf

        End If
        extendclass = extend

        CurObj = name
        CurItem = name

        rtbmain.Text = rtbmain.Text & CurObj & "()" & vbCrLf

        Dim arr() As String = classes
        ReDim Preserve arr(UBound(arr) + 1)
        arr(UBound(arr)) = CurNS & "." & name
        classes = arr

    End Sub

    Sub EndEnum()

        Gen.rtb.Text = Gen.rtb.Text & CurObj & ".CreateType()" & vbCrLf

        rtb.Text = rtb.Text & "End Sub" & vbCrLf & vbCrLf

    End Sub

    Sub EndClass()


        Dim MainName As String

        Dim sea As XElement = <Root>
                                  <%= From el In tables.methods.<Method>.<Name> _
                                      Where el.Value = "main" Or el.Value = "Main" _
                                      Select el.Value %>
                              </Root>

        MainName = sea.Value

        Gen.rtb.Text = Gen.rtb.Text & CurObj & ".CreateType()" & vbCrLf

        If MainName <> "" Then
            Gen.rtb.Text = Gen.rtb.Text & "asm.SetEntryPoint(" & MainName & ")" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & "Dim staType As Type = GetType(STAThreadAttribute)" & vbCrLf & _
       "Dim staCtor As ConstructorInfo = staType.GetConstructor(Type.EmptyTypes)" & vbCrLf & _
       "Dim staBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(staCtor, New Object() {})" & vbCrLf & _
       MainName & ".SetCustomAttribute(staBuilder)" & vbCrLf & vbCrLf



        End If

        rtb.Text = rtb.Text & "End Sub" & vbCrLf & vbCrLf

    End Sub

    ''' <summary>
    ''' declares a method
    ''' </summary>
    ''' <param name="name">the method name</param>
    ''' <param name="attributes">the method attributes</param>
    ''' <param name="returntype">the return type</param>
    ''' <param name="parameters">the parametres</param>
    ''' <param name="paraminfo">the parameter definitions block</param>
    ''' <param name="IsStatic">if the method is static or not (answer yes or no)</param>
    '''<remarks></remarks>
    Sub DeclMethod(ByVal name As String, ByVal attributes As String, ByVal returntype As String, ByVal parameters As String, ByVal IsStatic As String, ByVal paraminfo() As String, ByVal paramattrs() As String)

        Console.WriteLine("      Adding Method: " & name)

        CurMet = name
        CurItem = name

        If name Like "ctor*" Then
            rtb.Text = rtb.Text & "Dim " & name & " As ConstructorBuilder = " & CurObj & ".DefineConstructor(" & attributes & ",CallingConventions.Standard , " & parameters & ")" & vbCrLf & _
        "Dim " & name & "IL As ILGenerator = " & name & ".GetILGenerator()" & vbCrLf
        ElseIf pinvokemode = True Then

            rtb.Text = rtb.Text & "Dim " & name & " As MethodBuilder = " & CurObj & ".DefinePInvokeMethod(""" & name & """, """ & dllimport & """, " & attributes & ", CallingConventions.Standard , " & MakeGetType(returntype) & ", " & parameters & ", " & callconv & ", " & charset & ")" & vbCrLf & _
            name & ".SetImplementationFlags(" & name & ".GetMethodImplementationFlags() Or MethodImplAttributes.PreserveSig)" & vbCrLf
        Else
            rtb.Text = rtb.Text & "Dim " & name & " As MethodBuilder = " & CurObj & ".DefineMethod(""" & name & """, " & attributes & ", " & MakeGetType(returntype) & ", " & parameters & ")" & vbCrLf & _
            "Dim " & name & "IL As ILGenerator = " & name & ".GetILGenerator()" & vbCrLf
        End If

        Dim paramind As Integer = 0

        Dim s As String

        rtb.Text = rtb.Text & "Dim " & CurMet & "param00 As ParameterBuilder = " & CurMet & ".DefineParameter(0, ParameterAttributes.RetVal, """")" & vbCrLf


        For Each s In paraminfo

            paramind = paramind + 1
            Dim pattr As String = ""
            If paramattrs(paramind) = "" Then
                pattr = "ParameterAttributes.None"
            Else
                Dim a() As String = StringParser(paramattrs(paramind), " ")
                Dim lp As Integer = a.Length - 1
                Dim i As Integer = -1

                Do Until i = lp
                    i = i + 1
                    If a(i) = "in" Then
                        pattr = pattr & "ParameterAttributes.In"
                    ElseIf a(i) = "out" Then
                        pattr = pattr & "ParameterAttributes.Out"
                    End If
                    If i <> lp Then
                        pattr = pattr & " Or "
                    End If
                Loop
            End If
            rtb.Text = rtb.Text & "Dim " & CurMet & "param0" & paramind & " As ParameterBuilder = " & CurMet & ".DefineParameter(" & paramind & ", " & pattr.Trim() & ", """ & s.Trim() & """)" & vbCrLf

        Next


        tables.methods.<Counter>.<Count>.Value = CStr(CInt(tables.methods.<Counter>.<Count>.Value) + 1)

        Dim id As String = tables.methods.<Counter>.<Count>.Value

        Dim met As XElement = <Method>
                                  <Name id=<%= id %>><%= name %></Name>
                                  <Static id=<%= id %>><%= IsStatic %></Static>
                              </Method>

        tables.methods.Add(met)



    End Sub



    ''' <summary>
    ''' declares a field
    ''' </summary>
    ''' <param name="name">the field name</param>
    ''' <param name="attributes">the dield attributes</param>
    ''' <param name="type">the type</param>
    ''' <param name="IsStatic">if the field is static or not (answer yes or no)</param>
    '''<remarks></remarks>
    Sub DeclFld(ByVal name As String, ByVal attributes As String, ByVal type As String, ByVal IsStatic As String, ByVal IsArr As String)

        Console.WriteLine("      Adding Field: " & name)

        rtb.Text = rtb.Text & "Dim " & name & " As FieldBuilder = " & CurObj & ".DefineField(""" & name & """, " & MakeGetType(type) & ", " & attributes & ")" & vbCrLf

        tables.fields.<Counter>.<Count>.Value = CStr(CInt(tables.fields.<Counter>.<Count>.Value) + 1)

        Dim id As String = tables.fields.<Counter>.<Count>.Value

        Dim fld As XElement = <Field>
                                  <Name id=<%= id %>><%= name %></Name>
                                  <Static id=<%= id %>><%= IsStatic %></Static>
                                  <Array id=<%= id %>><%= IsArr %></Array>
                                  <Type id=<%= id %>><%= type %></Type>
                              </Field>
        tables.fields.Add(fld)

        CurItem = name

    End Sub

    ''' <summary>
    ''' declares a property
    ''' </summary>
    ''' <param name="name">the property name</param>
    ''' <param name="attributes">the property attributes</param>
    ''' <param name="type">the type</param>
    '''<remarks></remarks>
    Sub DeclProp(ByVal name As String, ByVal attributes As String, ByVal type As String, ByVal IsArr As String)

        Console.WriteLine("      Adding Property: " & name)

        CurProp = name
        CurItem = name

        rtb.Text = rtb.Text & "Dim " & name & " As PropertyBuilder = " & CurObj & ".DefineProperty(""" & name & """, " & attributes & ", " & MakeGetType(type) & ", Nothing)" & vbCrLf

        tables.props.<Counter>.<Count>.Value = CStr(CInt(tables.props.<Counter>.<Count>.Value) + 1)

        Dim id As String = tables.props.<Counter>.<Count>.Value

        Dim prop As XElement = <Property>
                                   <Name id=<%= id %>><%= name %></Name>
                                   <Array id=<%= id %>><%= IsArr %></Array>
                                   <Type id=<%= id %>><%= type %></Type>
                               </Property>
        tables.props.Add(prop)

    End Sub


    ''' <summary>
    ''' declares a variable
    ''' </summary>
    ''' <param name="name">the name</param>
    ''' <param name="type">the type</param>
    ''' <param name="locarg">"loc" or "arg"</param>
    ''' <param name="isarray">if the vraiable is an array (answer yes or no)</param>
    ''' <remarks></remarks>
    Sub DeclareVar(ByVal name As String, ByVal type As String, ByVal locarg As String, ByVal isarray As String)

        Dim t As String = type

        If locarg <> "arg" Then
            If isarray = "yes" Then
                If t Like "*[[]*]*" Then
                Else
                    t = t & "[]"
                End If
            End If
            varind = varind + 1

            rtb.Text = rtb.Text & "Dim locbldr" & varind & " As LocalBuilder = " & CurMet & "IL.DeclareLocal(" & MakeGetType(t) & ")" & vbCrLf
            If debug = True Then
                rtb.Text = rtb.Text & "locbldr" & varind & ".SetLocalSymInfo(""" & name & """)" & vbCrLf
            End If
        End If

        tables.vars.<Counter>.<Count>.Value = CStr(CInt(tables.vars.<Counter>.<Count>.Value) + 1)
        Dim id As String = tables.vars.<Counter>.<Count>.Value

        If locarg = "loc" Then
            locind = locind + 1
        ElseIf locarg = "arg" Then
            argind = argind + 1
        End If

        Dim ind As Integer = 0

        If locarg = "loc" Then
            ind = locind
        ElseIf locarg = "arg" Then
            ind = argind
        End If

        'If type Like "*[[]*]*" Then
        '    Dim sp() As String = StringParser2ds(type, "[", "]")
        '    type = sp(0)
        'End If


        Dim var As XElement = <Var>
                                  <Name id=<%= id %>><%= name %></Name>
                                  <Index id=<%= id %>><%= ind %></Index>
                                  <Place id=<%= id %>><%= locarg %></Place>
                                  <Type id=<%= id %>><%= type %></Type>
                                  <Array id=<%= id %>><%= isarray %></Array>
                              </Var>
        tables.vars.Add(var)

    End Sub

    ''' <summary>
    ''' declares a label
    ''' </summary>
    ''' <param name="name">the label's name</param>
    ''' <remarks></remarks>
    Sub DeclLabel(ByVal name As String)

        lind = lind + 1

        tables.labels.<Counter>.<Count>.Value = CStr(CInt(tables.labels.<Counter>.<Count>.Value) + 1)
        Dim id = tables.labels.<Counter>.<Count>.Value

        Dim lab As XElement = <Label>
                                  <Name id=<%= id %>><%= name %></Name>
                                  <Internal id=<%= id %>><%= "label" & lind %></Internal>
                              </Label>

        Dim n As String = "label" & lind

        Gen.rtb.Text = Gen.rtb.Text & "Dim " & n & " As System.Reflection.Emit.Label = " & CurMet & "IL.DefineLabel()" & vbCrLf


        tables.labels.Add(lab)
    End Sub

    ''' <summary>
    ''' places the label
    ''' </summary>
    ''' <param name="name">the name</param>
    ''' <remarks></remarks>
    Sub PlaceLabel(ByVal name As String)

        Dim search As XElement = <Root>
                                     <%= From el In tables.labels.<Label>.<Name> _
                                         Where el.Value = name _
                                         Select el.Attribute("id").Value %>
                                 </Root>
        Dim id = search.Value

        Dim intname As XElement = <Root>
                                      <%= From el In tables.labels.<Label>.<Internal> _
                                          Where el.Attribute("id") = id _
                                          Select el.Value %>
                                  </Root>

        Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.MarkLabel(" & intname.Value & ")" & vbCrLf

    End Sub

    ''' <summary>
    ''' brances to a label
    ''' </summary>
    ''' <param name="name">the name</param>
    ''' <remarks></remarks>
    Sub BranchToLabel(ByVal name As String)

        Dim search As XElement = <Root>
                                     <%= From el In tables.labels.<Label>.<Name> _
                                         Where el.Value = name _
                                         Select el.Attribute("id").Value %>
                                 </Root>
        Dim id = search.Value

        Dim intname As XElement = <Root>
                                      <%= From el In tables.labels.<Label>.<Internal> _
                                          Where el.Attribute("id") = id _
                                          Select el.Value %>
                                  </Root>

        Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Br, " & intname.Value & ")" & vbCrLf

    End Sub

    ''' <summary>
    ''' end a method
    ''' </summary>
    ''' <remarks></remarks>
    Sub EndMethod()

        Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ret)" & vbCrLf

    End Sub

    ''' <summary>
    ''' Emits the OpCodes.Conv_U opcode
    ''' </summary>
    ''' <remarks></remarks>
    Sub EmitConvU()

        Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Conv_U)" & vbCrLf

    End Sub


    ''' <summary>
    ''' Emits the OpCodes.Conv_I4 opcode
    ''' </summary>
    ''' <remarks></remarks>
    Sub EmitConvI4()

        Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Conv_I4)" & vbCrLf

    End Sub

    ''' <summary>
    ''' ends the assembly
    ''' </summary>
    ''' <remarks></remarks>
    Sub EndAsm()

        If sing = False Then

            Gen.rtbmain.Text = Gen.rtbmain.Text & "Dim vaType As Type = GetType(AssemblyFileVersionAttribute)" & vbCrLf & _
          "Dim vaCtor As ConstructorInfo = vaType.GetConstructor(New Type() { GetType(String) })" & vbCrLf & _
          "Dim vaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(vaCtor, New Object() {""" & ver(0) & "." & ver(1) & "." & ver(2) & "." & ver(3) & """})" & vbCrLf & _
          "asm.SetCustomAttribute(vaBuilder)" & vbCrLf & vbCrLf

            Gen.rtbmain.Text = Gen.rtbmain.Text & "Dim paType As Type = GetType(AssemblyProductAttribute)" & vbCrLf & _
          "Dim paCtor As ConstructorInfo = paType.GetConstructor(New Type() { GetType(String) })" & vbCrLf & _
          "Dim paBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(paCtor, New Object() {""" & asmName & """})" & vbCrLf & _
          "asm.SetCustomAttribute(paBuilder)" & vbCrLf & vbCrLf

            Gen.rtbmain.Text = Gen.rtbmain.Text & "Dim ataType As Type = GetType(AssemblyTitleAttribute)" & vbCrLf & _
          "Dim ataCtor As ConstructorInfo = ataType.GetConstructor(New Type() { GetType(String) })" & vbCrLf & _
          "Dim ataBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(ataCtor, New Object() {""" & asmName & """})" & vbCrLf & _
          "asm.SetCustomAttribute(ataBuilder)" & vbCrLf & vbCrLf

            Gen.rtbmain.Text = Gen.rtbmain.Text & "Dim deaType As Type = GetType(AssemblyDescriptionAttribute)" & vbCrLf & _
          "Dim deaCtor As ConstructorInfo = deaType.GetConstructor(New Type() { GetType(String) })" & vbCrLf & _
          "Dim deaBuilder As CustomAttributeBuilder = New CustomAttributeBuilder(deaCtor, New Object() {""" & asmName & """})" & vbCrLf & _
          "asm.SetCustomAttribute(deaBuilder)" & vbCrLf & vbCrLf

        End If

        resrtb.Text = ""

        For Each s As String In resarr

            Dim resplit() As String = StringParser(s, " ")

            If resplit(0) = "image" Then

                Dim img As String = resplit(1)
                Dim psplit() As String = StringParser(img, "\")
                Dim fname As String = psplit(UBound(psplit))

                resrtb.Text = resrtb.Text & "resobj = System.Drawing.Image.FromFile(" & """" & img & """" & ")" & vbCrLf & _
                "resw.AddResource(" & """" & fname & """" & ", resobj)" & vbCrLf

            End If

        Next

        Dim tmpstr As String = rtbutil.Text & rtbmain.Text

        Gen.rtbmain.Text = "Sub Main()" & vbCrLf & vbCrLf _
        & "asmName = New AssemblyName(""" & asmName & """)" & vbCrLf & _
        "asmName.Version = New System.Version(" & ver(0) & ", " & ver(1) & ", " & ver(2) & ", " & ver(3) & ")" & vbCrLf & _
        "asm  = AppDomain.CurrentDomain.DefineDynamicAssembly(asmName, AssemblyBuilderAccess.Save, CStr(""" & da & """))" & vbCrLf
        If debug = True Then
            rtbmain.Text = rtbmain.Text & "mdl = asm.DefineDynamicModule(asmName.Name & """ & "" & asmtyp & """ , asmName.Name & """ & asmtyp & """, True)" & vbCrLf
        Else
            rtbmain.Text = rtbmain.Text & "mdl = asm.DefineDynamicModule(asmName.Name & """ & "" & asmtyp & """ , asmName.Name & """ & asmtyp & """, False)" & vbCrLf
        End If
        rtbmain.Text = rtbmain.Text & "resw = mdl.DefineResource(""" & asmName & ".resources" & """ ,  """ & "Description" & """)" & vbCrLf & resrtb.Text
        If debug = True Then
            rtbmain.Text = rtbmain.Text & "doc = mdl.DefineDocument(""" & address & """, Guid.Empty, Guid.Empty, Guid.Empty)" & vbCrLf
        End If
        tmpstr = rtbmain.Text & tmpstr
        rtbmain.Text = ""
        rtbmain.Text = rtbmain.Text & tmpstr & vbCrLf & _
        Gen.rtbmain.Text & "asm.DefineVersionInfoResource()" & vbCrLf & "asm.Save(asmName.Name & """ & asmtyp & """)" & vbCrLf & _
       "End Sub" & vbCrLf & vbCrLf

        '"resobj = System.Drawing.Image.FromFile(" & """C:\Users\Dylan\Desktop\save.png""" & ")" & vbCrLf & _
        '"resw.AddResource(" & """save.png""" & ", resobj)" & vbCrLf & _


        rtb.Text = rtb.Text & rtbmain.Text & vbCrLf & _
       "End Module"

        rtb.Text = "Imports System" & vbCrLf & _
        "Imports System.Diagnostics" & vbCrLf & _
    "Imports System.Diagnostics.SymbolStore" & vbCrLf & _
    "Imports System.Reflection" & vbCrLf & _
    "Imports System.Resources" & vbCrLf & _
    "Imports System.Reflection.Emit" & vbCrLf & rtb.Text

        If stdasm = True Then

            rtb.Text = "Imports Microsoft.VisualBasic" & vbCrLf & _
    "Imports System.Xml" & vbCrLf & _
    "Imports System.Xml.Linq" & vbCrLf & _
    "Imports System.Data" & vbCrLf & _
     vbCrLf & rtb.Text

        End If


        For Each s As String In impns
            If s = "System" Then
            ElseIf s = "System.Resources" Then
            ElseIf s = "System.Diagnostics" Then
            ElseIf s = "System.Diagnostics.SymbolStore" Then
            ElseIf s = "System.Reflection" Then
            ElseIf s = "System.Reflection.Emit" Then
            ElseIf s = "Microsoft.VisualBasic" Then
                If stdasm = False Then
                    rtb.Text = "Imports " & s & vbCrLf & rtb.Text
                End If
            ElseIf s = "System.Xml" Then
                If stdasm = False Then
                    rtb.Text = "Imports " & s & vbCrLf & rtb.Text
                End If
            ElseIf s = "System.Xml.Linq" Then
                If stdasm = False Then
                    rtb.Text = "Imports " & s & vbCrLf & rtb.Text
                End If
            ElseIf s = "System.Data" Then
                If stdasm = False Then
                    rtb.Text = "Imports " & s & vbCrLf & rtb.Text
                End If
            Else
                rtb.Text = "Imports " & s & vbCrLf & rtb.Text
            End If
        Next

    End Sub

    Sub SetMarshalAsParam(ByVal param As String, ByVal var As String)
        Dim p As String = CurMet & "param0" & param

        Gen.rtb.Text = Gen.rtb.Text & "Dim " & p & "MAType As Type = GetType(System.Runtime.InteropServices.MarshalAsAttribute)" & vbCrLf & _
      "Dim " & p & "MACtor As ConstructorInfo = " & p & "MAType.GetConstructor(New Type() { GetType(System.Runtime.InteropServices.UnmanagedType) })" & vbCrLf & _
      "Dim " & p & "MABuilder As CustomAttributeBuilder = New CustomAttributeBuilder(" & p & "MACtor, New Object() {System.Runtime.InteropServices.UnmanagedType." & var.Trim() & "})" & vbCrLf & _
       p & ".SetCustomAttribute(" & p & "MABuilder)" & vbCrLf & vbCrLf

    End Sub

    Sub SetMarshalAs(ByVal var As String)
        Dim p As String = CurItem

        Gen.rtb.Text = Gen.rtb.Text & "Dim " & p & "MAType As Type = GetType(System.Runtime.InteropServices.MarshalAsAttribute)" & vbCrLf & _
      "Dim " & p & "MACtor As ConstructorInfo = " & p & "MAType.GetConstructor(BindingFlags.Public Or BindingFlags.NonPublic Or BindingFlags.Instance Or BindingFlags.Static, " & _
      "Nothing,New Type() { GetType(System.Runtime.InteropServices.UnmanagedType)},Nothing)" & vbCrLf & _
      "Dim " & p & "MABuilder As CustomAttributeBuilder = New CustomAttributeBuilder(" & p & "MACtor, New Object() {System.Runtime.InteropServices.UnmanagedType." & var.Trim() & "})" & vbCrLf & _
       p & ".SetCustomAttribute(" & p & "MABuilder)" & vbCrLf & vbCrLf

    End Sub


End Module
