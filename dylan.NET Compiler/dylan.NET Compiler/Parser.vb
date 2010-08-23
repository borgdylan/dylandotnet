Imports System.Reflection

''' <summary>
''' The parser module
''' </summary>
''' <remarks></remarks>
Module Parser

    ''' <summary>
    '''  Holds the last declared variable
    ''' </summary>
    ''' <remarks></remarks>
    Public VarName As String = ""

    ''' <summary>
    ''' Holds the type name for the last loaded parameter
    ''' </summary>
    ''' <remarks></remarks>
    Public CurTyp As String = ""

    ''' <summary>
    ''' Holds the index of the last parameter array made
    ''' </summary>
    ''' <remarks></remarks>
    Public typind As Integer = -1

    ''' <summary>
    ''' holds true if the else block in an if construct has been seen
    ''' </summary>
    ''' <remarks></remarks>
    Public elsepass As Boolean = False

    Public indoc As Boolean = False
    Public ifinddepth(-1) As Integer
    Public elsepassdepth(-1) As Boolean
    Public metend As Boolean = True
    Public debug As Boolean = True
    Public sing As Boolean = False
    Public abst As Boolean = False
    Public refmode As Boolean = False
    Public pinvokemode As Boolean = False
    Public CurVari As String = ""

    ''' <summary>
    ''' Declares a variable
    ''' </summary>
    ''' <param name="code">the code containing a variable declaration</param>
    ''' <param name="locarg">enter "loc" for a local variable or "arg" if the variable declared is an argument</param>
    ''' <remarks></remarks>
    Sub DeclVar(ByVal code As String, ByVal locarg As String)
        Dim decsplit() As String = StringParser(code, " ")

        If decsplit.Length < 4 Then
            Console.WriteLine(WriteErrInfo("Wrong variable declaration at: " & code))
            errorhappened = True
        Else
            Dim name As String = decsplit(1).Trim()
            Dim isarr As String = "no"
            Dim len As String = ""

            Dim makearr As Boolean = False

            If name Like "*[[]*]*" Then
                isarr = "yes"
                makearr = True
                Dim split() As String = StringParser2ds(name, "[", "]")
                name = split(0)
                If split.Length = 2 Then
                    len = split(1)
                ElseIf split.Length = 1 Then
                    len = "0"
                End If

            End If


            VarName = name
            Dim type As String = tables.GetTyp(decsplit(3))

            If type Like "*[[]*]*" Then
                isarr = "yes"
            End If

            Gen.DeclareVar(name, type, locarg, isarr)

            If isarr = "yes" And makearr = True Then
                LoadArr(len, type)

                Dim varsearch As XElement = <Root>
                                                <%= From el In tables.vars.<Var>.<Name> _
                                                    Where el.Value = name _
                                                    Select el.Attribute("id").Value %>
                                            </Root>
                Dim id = varsearch.Value

                Dim index As XElement = <Root>
                                            <%= From el In tables.vars.<Var>.<Index> _
                                                Where el.Attribute("id") = id _
                                                Select el.Value %>
                                        </Root>

                Dim vartyp As XElement = <Root>
                                             <%= From el In tables.vars.<Var>.<Type> _
                                                 Where el.Attribute("id") = id _
                                                 Select el.Value %>
                                         </Root>

                Dim place As XElement = <Root>
                                            <%= From el In tables.vars.<Var>.<Place> _
                                                Where el.Attribute("id") = id _
                                                Select el.Value %>
                                        </Root>


                If place.Value = "loc" Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stloc, " & index.Value & ")" & vbCrLf
                ElseIf place.Value = "arg" Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Starg, " & index.Value & ")" & vbCrLf
                End If

            End If
        End If
    End Sub

    ''' <summary>
    ''' Store the current value on the stack to a field
    ''' </summary>
    ''' <param name="fldname">the field's full name</param>
    ''' <param name="val">The value to store</param>
    ''' <remarks></remarks>
    Sub StFld(ByVal fldname As String, ByVal val As String)

        Dim attach As Boolean = False
        Dim buffer As String = ""

        If fldname Like "*[[]*]*" Then
            Dim split() As String = StringParser2ds(fldname, "[", "]")
            attach = True
            fldname = split(0)
            buffer = split(1)
        End If

        Dim fldsearch As XElement = <Root>
                                        <%= From el In tables.fields.<Field>.<Name> _
                                            Where el.Value = fldname _
                                            Select el.Value %>
                                    </Root>

        If attach = True Then
            fldname = fldname & "[" & buffer & "]"
        End If


        If fldsearch.Value <> "" Then
            StLocFld(fldname, val)
        Else
            StExtFld(fldname, val)
        End If

    End Sub

    ''' <summary>
    ''' Loads a field onto the stack
    ''' </summary>
    ''' <param name="fldname">the field's full name</param>
    ''' <remarks></remarks>
    Sub LdFld(ByVal fldname As String)

        Dim attach As Boolean = False
        Dim buffer As String = ""

        If fldname Like "*[[]*]*" Then
            Dim split() As String = StringParser2ds(fldname, "[", "]")
            attach = True
            fldname = split(0)
            buffer = split(1)
        End If

        
        Dim fldsearch As XElement = <Root>
                                        <%= From el In tables.fields.<Field>.<Name> _
                                            Where el.Value = fldname _
                                            Select el.Value %>
                                    </Root>


        If attach = True Then
            fldname = fldname & "[" & buffer & "]"
        End If


        If fldsearch.Value <> "" Then
            LdLocFld(fldname)
        Else
            LdExtFld(fldname)
        End If

    End Sub

    ''' <summary>
    ''' Store the value on the stack to a local field
    ''' </summary>
    ''' <param name="name">the field name</param>
    ''' <param name="val">The value to store</param>
    ''' <remarks></remarks>
    Sub StLocFld(ByVal name As String, ByVal val As String)

        Dim isarr As String = "no"
        Dim ind As String = ""

        If name Like "*[[]*]*" Then

            Dim split() As String = StringParser2ds(name, "[", "]")
            name = split(0)
            ind = split(1)
            isarr = "yes"

        End If

        If isarr = "yes" Then
            ' LoadVal(name)
            'LoadVal(ind)
            'Gen.EmitConvU()
        End If


        Dim id As XElement = <Root>
                                 <%= From el In tables.fields.<Field>.<Name> _
                                     Where el.Value = name _
                                     Select el.Attribute("id").Value %>
                             </Root>

        Dim type As XElement = <Root>
                                   <%= From el In tables.fields.<Field>.<Type> _
                                       Where el.Attribute("id").Value = id.Value _
                                       Select el.Value %>
                               </Root>

        Dim isstatic As XElement = <Root>
                                       <%= From el In tables.fields.<Field>.<Static> _
                                           Where el.Attribute("id").Value = id.Value _
                                           Select el.Value %>
                                   </Root>

        Dim virt As Boolean = False


        If isstatic.Value = "no" Then
            virt = True
        End If

        If virt = True Then

            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf

        End If

        If isarr = "yes" Then
            Gen.rtb.Text = Gen.rtb.Text & "Typ02 = Typ" & vbCrLf
            LoadVal(val)
            Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ02" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stelem, " & "Typ.GetElementType())" & vbCrLf
            GoTo finito
        End If

        If virt = True Then
            LoadVal(val)
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stfld, " & name & ")" & vbCrLf
        ElseIf virt = False Then
            LoadVal(val)
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stsfld, " & name & ")" & vbCrLf
        End If

finito:

    End Sub

    ''' <summary>
    ''' Load a local field onto the stack
    ''' </summary>
    ''' <param name="name">the field name</param>
    ''' <remarks></remarks>
    Sub LdLocFld(ByVal name As String)

        Dim isarr As String = "no"
        Dim arrindex As String = ""

        If name Like "*[[]*]*" Then
            isarr = "yes"
            Dim split() As String = StringParser2ds(name, "[", "]")
            name = split(0)
            arrindex = split(1)
        End If

        Dim id As XElement = <Root>
                                 <%= From el In tables.fields.<Field>.<Name> _
                                     Where el.Value = name _
                                     Select el.Attribute("id").Value %>
                             </Root>

        Dim type As XElement = <Root>
                                   <%= From el In tables.fields.<Field>.<Type> _
                                       Where el.Attribute("id").Value = id.Value _
                                       Select el.Value %>
                               </Root>

        Dim isstatic As XElement = <Root>
                                       <%= From el In tables.fields.<Field>.<Static> _
                                           Where el.Attribute("id").Value = id.Value _
                                           Select el.Value %>
                                   </Root>

        Dim virt As Boolean = False


        If isstatic.Value = "no" Then
            virt = True
        End If

        If virt = True Then

            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf

        End If

        If isarr = "yes" Then
            If virt = True Then
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & name & ")" & vbCrLf
            ElseIf virt = False Then
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldsfld, " & name & ")" & vbCrLf
            End If
        Else
            If refmode = False Then
                If virt = True Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & name & ")" & vbCrLf
                ElseIf virt = False Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldsfld, " & name & ")" & vbCrLf
                End If
            Else
                If virt = True Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldflda, " & name & ")" & vbCrLf
                ElseIf virt = False Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldsflda, " & name & ")" & vbCrLf
                End If
            End If
            End If

        If isarr = "yes" Then
            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & name & ".FieldType" & vbCrLf

        Else
            If refmode = False Then
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & name & ".FieldType" & vbCrLf
            Else
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & name & ".FieldType.MakeByRefType()" & vbCrLf
            End If
        End If

        If isarr = "yes" Then
            If arrindex <> "l" Then
                Gen.rtb.Text = Gen.rtb.Text & "Typ02 = Typ" & vbCrLf
                LoadVal(arrindex)
                Gen.EmitConvU()
                Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ02" & vbCrLf
                If refmode = False Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldelem, Typ.GetElementType())" & vbCrLf
                Else
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldelema, Typ.GetElementType())" & vbCrLf
                End If
                If refmode = False Then
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ.GetElementType()" & vbCrLf
                Else
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ.GetElementType().MakeByRefType()" & vbCrLf
                End If
            ElseIf arrindex = "l" Then
                Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ldlen)" & vbCrLf
                Gen.EmitConvI4()
                Gen.rtb.Text = Gen.rtb.Text & "Typ = GetType(System.Int32)" & vbCrLf
            End If
        End If


    End Sub

    ''' <summary>
    ''' Loads the value of a field that is external to the current class onto the stack
    ''' </summary>
    ''' <param name="name">the field name</param>
    ''' <remarks></remarks>
    Sub LdExtFld(ByVal name As String)

        Dim isarr As String = "no"
        Dim arrindex As String = ""

        If name Like "*[[]*]*" Then
            isarr = "yes"
            Dim split() As String = StringParser2ds(name, "[", "]")
            name = split(0)
            arrindex = split(1)
        End If

        Dim virt As Boolean = False
        Dim vfld As Boolean = False
        Dim vinh As Boolean = False


        Dim namesplit() As String = StringParser(name, ":")

        If namesplit.Length < 2 Then
            Console.WriteLine("Wrong field naming (didn't use ::) at: " & name)
            errorhappened = True
        Else
            Dim typ As String = namesplit(0)
            Dim fld As String = namesplit(1)

            Dim counta As Integer = tables.fields.<Counter>.<Count>.Value
            Dim ia As Integer = 0

            If typ = "me" Then
                virt = True
                vinh = True
                GoTo jnz
            End If

            Do Until ia = counta

                ia = ia + 1
                Dim typfind As XElement = <root>
                                              <%= From el In tables.fields.<Field>.<Name> _
                                                  Where el.Attribute("id") = CStr(ia) _
                                                  Select el.Value %>
                                          </root>
                If typfind.Value = typ Then

                    virt = True
                    vfld = True

                End If

            Loop

            If virt = True Then
                GoTo jnz
            End If

            Dim count As Integer = tables.vars.<Counter>.<Count>.Value
            Dim i As Integer = 0

            Do Until i = count

                i = i + 1
                Dim typfind As XElement = <root>
                                              <%= From el In tables.vars.<Var>.<Name> _
                                                  Where el.Attribute("id") = CStr(i) _
                                                  Select el.Value %>
                                          </root>
                If typfind.Value = typ Then

                    virt = True

                End If

            Loop

jnz:

            If virt = True Then

                If vinh = True Then
                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf
                Else
                    Dim rm As Boolean = refmode
                    refmode = False
                    LoadVal(typ.Trim())
                    refmode = rm
                End If

            End If

            If isarr = "yes" Then
                If virt = False Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldsfld, " & MakeGetType(typ) & ".GetField(""" & fld & """))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(typ) & ".GetField(""" & fld & """).FieldType" & vbCrLf


                Else

                    If vinh = True Then

                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & MakeGetType(GetTyp("me")) & ".GetField(""" & fld & """))" & vbCrLf
                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp("me")) & ".GetField(""" & fld & """).FieldType" & vbCrLf

                    ElseIf vfld = True Then

                        Dim fldsearch As XElement = <Root>
                                                        <%= From el In tables.fields.<Field>.<Name> _
                                                            Where el.Value = typ _
                                                            Select el.Attribute("id").Value %>
                                                    </Root>
                        Dim id = fldsearch.Value


                        Dim fldtyp As XElement = <Root>
                                                     <%= From el In tables.fields.<Field>.<Type> _
                                                         Where el.Attribute("id") = id _
                                                         Select el.Value %>
                                                 </Root>


                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & MakeGetType(fldtyp.Value) & ".GetField(""" & fld & """))" & vbCrLf
                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(fldtyp.Value) & ".GetField(""" & fld & """).FieldType" & vbCrLf




                    Else

                        Dim varsearch As XElement = <Root>
                                                        <%= From el In tables.vars.<Var>.<Name> _
                                                            Where el.Value = typ _
                                                            Select el.Attribute("id").Value %>
                                                    </Root>
                        Dim id = varsearch.Value

                        Dim index As XElement = <Root>
                                                    <%= From el In tables.vars.<Var>.<Index> _
                                                        Where el.Attribute("id") = id _
                                                        Select el.Value %>
                                                </Root>

                        Dim vartyp As XElement = <Root>
                                                     <%= From el In tables.vars.<Var>.<Type> _
                                                         Where el.Attribute("id") = id _
                                                         Select el.Value %>
                                                 </Root>


                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & MakeGetType(vartyp.Value) & ".GetField(""" & fld & """))" & vbCrLf
                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(vartyp.Value) & ".GetField(""" & fld & """).FieldType" & vbCrLf



                    End If

                End If

            Else

                If virt = False Then

                    If refmode = False Then
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldsfld, " & MakeGetType(typ) & ".GetField(""" & fld & """))" & vbCrLf
                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(typ) & ".GetField(""" & fld & """).FieldType" & vbCrLf
                    Else
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldsflda, " & MakeGetType(typ) & ".GetField(""" & fld & """))" & vbCrLf
                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(typ) & ".GetField(""" & fld & """).FieldType.MakeByRefType()" & vbCrLf

                    End If

                Else

                    If vinh = True Then

                        If refmode = False Then
                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & MakeGetType(GetTyp("me")) & ".GetField(""" & fld & """))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp("me")) & ".GetField(""" & fld & """).FieldType" & vbCrLf
                        Else
                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldflda, " & MakeGetType(GetTyp("me")) & ".GetField(""" & fld & """))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp("me")) & ".GetField(""" & fld & """).FieldType.MakeByRefType()" & vbCrLf

                        End If
                    ElseIf vfld = True Then

                        Dim fldsearch As XElement = <Root>
                                                        <%= From el In tables.fields.<Field>.<Name> _
                                                            Where el.Value = typ _
                                                            Select el.Attribute("id").Value %>
                                                    </Root>
                        Dim id = fldsearch.Value


                        Dim fldtyp As XElement = <Root>
                                                     <%= From el In tables.fields.<Field>.<Type> _
                                                         Where el.Attribute("id") = id _
                                                         Select el.Value %>
                                                 </Root>


                        If refmode = False Then
                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & MakeGetType(fldtyp.Value) & ".GetField(""" & fld & """))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(fldtyp.Value) & ".GetField(""" & fld & """).FieldType" & vbCrLf
                        Else
                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldflda, " & MakeGetType(fldtyp.Value) & ".GetField(""" & fld & """))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(fldtyp.Value) & ".GetField(""" & fld & """).FieldType.MakeByRefType()" & vbCrLf
                        End If


                        Else

                            Dim varsearch As XElement = <Root>
                                                            <%= From el In tables.vars.<Var>.<Name> _
                                                                Where el.Value = typ _
                                                                Select el.Attribute("id").Value %>
                                                        </Root>
                            Dim id = varsearch.Value

                            Dim index As XElement = <Root>
                                                        <%= From el In tables.vars.<Var>.<Index> _
                                                            Where el.Attribute("id") = id _
                                                            Select el.Value %>
                                                    </Root>

                            Dim vartyp As XElement = <Root>
                                                         <%= From el In tables.vars.<Var>.<Type> _
                                                             Where el.Attribute("id") = id _
                                                             Select el.Value %>
                                                     </Root>

                        If refmode = False Then
                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldfld, " & MakeGetType(vartyp.Value) & ".GetField(""" & fld & """))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(vartyp.Value) & ".GetField(""" & fld & """).FieldType" & vbCrLf
                        Else
                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldflda, " & MakeGetType(vartyp.Value) & ".GetField(""" & fld & """))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(vartyp.Value) & ".GetField(""" & fld & """).FieldType.MakeByRefType()" & vbCrLf

                        End If

                        End If

                    End If

                End If

        End if
fin:

        If isarr = "yes" Then
            If arrindex <> "l" Then
                Gen.rtb.Text = Gen.rtb.Text & "Typ02 = Typ" & vbCrLf
                LoadVal(arrindex)
                Gen.EmitConvU()
                Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ02" & vbCrLf
                If refmode = False Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldelem, Typ.GetElementType())" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ.GetElementType()" & vbCrLf
                Else
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldelema, Typ.GetElementType())" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ.GetElementType().MakeByRefType()" & vbCrLf
                End If
            ElseIf arrindex = "l" Then
                Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ldlen)" & vbCrLf
                Gen.EmitConvI4()
                Gen.rtb.Text = Gen.rtb.Text & "Typ = GetType(System.Int32)" & vbCrLf
            End If
        End If


    End Sub

    ''' <summary>
    ''' Stores the value on the stack to a field that is external to the current class
    ''' </summary>
    ''' <param name="name">the field name</param>
    ''' <param name="val">The value to store</param>
    ''' <remarks></remarks>
    Sub StExtFld(ByVal name As String, ByVal val As String)

        Dim virt As Boolean = False
        Dim vfld As Boolean = False
        Dim vinh As Boolean = False

        Dim isarr As String = "no"
        Dim ind As String = ""

        If name Like "*[[]*]*" Then

            Dim split() As String = StringParser2ds(name, "[", "]")
            name = split(0)
            ind = split(1)
            isarr = "yes"

        End If

        If isarr = "yes" Then
            ' LoadVal(name)
            'LoadVal(ind)
            'Gen.EmitConvU()
        End If

        If isarr = "yes" Then
            Gen.rtb.Text = Gen.rtb.Text & "Typ02 = Typ" & vbCrLf
            LoadVal(val)
            Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ02" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stelem, " & "Typ.GetElementType())" & vbCrLf
            GoTo fin
        End If


        Dim namesplit() As String = StringParser(name, ":")
        If namesplit.Length < 2 Then
            Console.WriteLine("Wrong field access (didn't use ::) at: " & name)
            errorhappened = True
        Else

            Dim typ As String = namesplit(0)
            Dim fld As String = namesplit(1)

            Dim counta As Integer = tables.fields.<Counter>.<Count>.Value
            Dim ia As Integer = 0

            If typ = "me" Then
                virt = True
                vinh = True
                GoTo jnz
            End If

            Do Until ia = counta

                ia = ia + 1
                Dim typfind As XElement = <root>
                                              <%= From el In tables.fields.<Field>.<Name> _
                                                  Where el.Attribute("id") = CStr(ia) _
                                                  Select el.Value %>
                                          </root>
                If typfind.Value = typ Then

                    virt = True
                    vfld = True

                End If

            Loop

            If virt = True Then
                GoTo jnz
            End If

            Dim count As Integer = tables.vars.<Counter>.<Count>.Value
            Dim i As Integer = 0

            Do Until i = count

                i = i + 1
                Dim typfind As XElement = <root>
                                              <%= From el In tables.vars.<Var>.<Name> _
                                                  Where el.Attribute("id") = CStr(i) _
                                                  Select el.Value %>
                                          </root>
                If typfind.Value = typ Then

                    virt = True

                End If

            Loop

jnz:

            If virt = True Then

                If vinh = True Then
                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf
                Else
                    LoadVal(typ.Trim())
                End If

            End If


            If virt = False Then
                LoadVal(val)
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stsfld, " & "" & MakeGetType(typ) & ".GetField(""" & fld & """))" & vbCrLf
            Else

                If vinh = True Then

                    LoadVal(val)

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stfld, " & "" & MakeGetType(GetTyp("me")) & ".GetField(""" & fld & """))" & vbCrLf

                ElseIf vfld = True Then

                    LoadVal(val)

                    Dim fldsearch As XElement = <Root>
                                                    <%= From el In tables.fields.<Field>.<Name> _
                                                        Where el.Value = typ _
                                                        Select el.Attribute("id").Value %>
                                                </Root>
                    Dim id = fldsearch.Value


                    Dim fldtyp As XElement = <Root>
                                                 <%= From el In tables.fields.<Field>.<Type> _
                                                     Where el.Attribute("id") = id _
                                                     Select el.Value %>
                                             </Root>

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stfld, " & "" & MakeGetType(fldtyp.Value) & ".GetField(""" & fld & """))" & vbCrLf


                Else

                    LoadVal(val)

                    Dim varsearch As XElement = <Root>
                                                    <%= From el In tables.vars.<Var>.<Name> _
                                                        Where el.Value = typ _
                                                        Select el.Attribute("id").Value %>
                                                </Root>
                    Dim id = varsearch.Value

                    Dim index As XElement = <Root>
                                                <%= From el In tables.vars.<Var>.<Index> _
                                                    Where el.Attribute("id") = id _
                                                    Select el.Value %>
                                            </Root>

                    Dim vartyp As XElement = <Root>
                                                 <%= From el In tables.vars.<Var>.<Type> _
                                                     Where el.Attribute("id") = id _
                                                     Select el.Value %>
                                             </Root>


                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stfld, " & "" & MakeGetType(vartyp.Value) & ".GetField(""" & fld & """))" & vbCrLf
                End If

            End If
        End If

fin:

    End Sub

    ''' <summary>
    ''' Assign a value to a variable
    ''' </summary>
    ''' <param name="code">a variable assignment</param>
    ''' <remarks>"loc" variables only</remarks>
    Sub AssignVal(ByVal code As String)
        Dim assign() As String = StringParser(code, "=")
        Dim isarr As String = "no"
        Dim ind As String = ""
        Dim var As String = assign(0).Trim()
        Dim val As String = assign(1).Trim()
        Dim attach As Boolean = False
        Dim refassign As Boolean = False

        If var Like "valinref|*" Then
            refassign = True
            Dim split() As String = StringParser(var, "|")
            var = split(1)
        End If

        If refassign = True Then
            GoTo finito
        End If

        If var Like "*[[]*]*" Then

            Dim split() As String = StringParser2ds(var, "[", "]")
            var = split(0)
            ind = split(1)
            isarr = "yes"
            attach = True

        End If

        If isarr = "yes" Then
            LoadVal(var)
            Gen.rtb.Text = Gen.rtb.Text & "Typ02 = Typ" & vbCrLf
            LoadVal(ind)
            Gen.EmitConvU()
            Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ02" & vbCrLf
        End If

        CurVari = var


        Dim fldsearch As XElement = <Root>
                                        <%= From el In tables.fields.<Field>.<Name> _
                                            Where el.Value = var _
                                            Select el.Value %>
                                    </Root>

        If fldsearch.Value <> "" Or var Like "*::*" Then
            If attach = True Then
                var = var & "[" & ind & "]"
            End If
            StFld(var, val)

            GoTo finito
        End If

        LoadVal(val)


        Dim varsearch As XElement = <Root>
                                        <%= From el In tables.vars.<Var>.<Name> _
                                            Where el.Value = var _
                                            Select el.Attribute("id").Value %>
                                    </Root>
        Dim id = varsearch.Value

        Dim index As XElement = <Root>
                                    <%= From el In tables.vars.<Var>.<Index> _
                                        Where el.Attribute("id") = id _
                                        Select el.Value %>
                                </Root>

        Dim vartyp As XElement = <Root>
                                     <%= From el In tables.vars.<Var>.<Type> _
                                         Where el.Attribute("id") = id _
                                         Select el.Value %>
                                 </Root>

        Dim place As XElement = <Root>
                                    <%= From el In tables.vars.<Var>.<Place> _
                                        Where el.Attribute("id") = id _
                                        Select el.Value %>
                                </Root>

        If isarr = "yes" Then
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stelem, " & MakeGetType(vartyp.Value) & ".GetElementType())" & vbCrLf
            GoTo finito
        End If

        If place.Value = "loc" Then
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stloc, " & index.Value & ")" & vbCrLf
        ElseIf place.Value = "arg" Then
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Starg, " & index.Value & ")" & vbCrLf
        End If

finito:

        If refassign = True Then
            LoadVal(var)
            Gen.rtb.Text = Gen.rtb.Text & "Typ04 = Typ.GetElementType()" & vbCrLf
            LoadVal(val)
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Stobj, Typ04)" & vbCrLf
        End If

    End Sub

    ''' <summary>
    ''' Calls a method declared in the current class
    ''' </summary>
    ''' <param name="code">a method call</param>
    ''' <remarks></remarks>
    Sub CallLocMet(ByVal code As String, ByVal poppable As Boolean)

        Dim typbuf As Integer = 0

        Dim callsplit() As String = StringParser2ds(code, "(", ")")

        Dim metname As String = callsplit(0).Trim()

        Dim virt As Boolean = False

        Dim sea As XElement = <Root>
                                  <%= From el In tables.methods.<Method>.<Name> _
                                      Where el.Value = metname _
                                      Select el.Attribute("id").Value %>
                              </Root>

        Dim search As XElement = <Root>
                                     <%= From el In tables.methods.<Method>.<Static> _
                                         Where el.Attribute("id").Value = sea.Value _
                                         Select el.Value %>
                                 </Root>

        If search.Value = "no" Then
            virt = True
        End If

        If virt = True Then

            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf

        End If

        Dim paramstr As String = ""
        Dim paramarrname As String = ""
        If callsplit.Length > 1 Then
            Dim params As String = ""

            If callsplit.Length > 1 Then
                params = callsplit(1).Trim()
            End If

            Dim paramsplit() As String = StringParser(params, ",")

            Dim s As String
            typind = typind + 1
            typbuf = typind

            If paramsplit.Length > 0 Then
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typbuf & "(-1) As Type" & vbCrLf
            End If


            If paramsplit.Length > 0 Then
                For Each s In paramsplit

                    If s.Trim() Like "loadas:*" Then
                        Dim splt() As String = StringParser(s.Trim(), " ")
                        Dim lassplit() As String = StringParser(splt(0), ":")

                        LoadVal(splt(1).Trim())

                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp(lassplit(1))) & vbCrLf
                    Else

                        LoadVal(s.Trim())
                    End If

                    Gen.rtb.Text = Gen.rtb.Text & "ReDim Preserve typ" & typbuf & "(UBound(typ" & typbuf & ") + 1)" & vbCrLf & _
        "typ" & typbuf & "(UBound(typ" & typbuf & ")) = Typ" & vbCrLf

                Next

            End If

            If paramsplit.Length > 0 Then
                ' paramstr = paramstr.Trim(",")
                'paramstr = paramstr & "}"
            End If

            paramarrname = "typ" & typbuf

            If paramsplit.Length > 0 = False Then
                paramarrname = "Type.EmptyTypes"
            End If

        Else
            '     If virt = False Then
            paramarrname = "Type.EmptyTypes"
            'End If
        End If

        If virt = True Then
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & metname & ")" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & metname & ".ReturnType" & vbCrLf

            If poppable = True Then
                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
            End If

        ElseIf virt = False Then
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & metname & ")" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & metname & ".ReturnType" & vbCrLf

            If poppable = True Then
                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
            End If

        End If



    End Sub

    ''' <summary>
    ''' Calls a method found inside the .NET Framework
    ''' </summary>
    ''' <param name="code">a method call</param>
    ''' <remarks>not for use with a method declared locally. use CallLocMet instead.</remarks>
    Sub CallMet(ByVal code As String, ByVal poppable As Boolean)

        Dim virt As Boolean = False
        Dim vfld As Boolean = False
        Dim vinh As Boolean = False
        Dim typbuf As Integer = 0

        Dim callsplit() As String = StringParser2ds(code, "(", ")")

        If callsplit.Length = 0 Then
        Else
            Dim metname As String = callsplit(0).Trim()

            Dim sea As XElement = <Root>
                                      <%= From el In tables.methods.<Method>.<Name> _
                                          Where el.Value = metname _
                                          Select el.Value %>
                                  </Root>

            If sea.Value <> "" Then

                CallLocMet(code, poppable)

                GoTo fin
            End If

            If metname = "me::ctor" Then



                Dim sear As XElement = <Root>
                                           <%= From el In tables.methods.<Method>.<Name> _
                                               Where el.Value = CurMet _
                                               Select el.Attribute("id").Value %>
                                       </Root>

                Dim isstatic As XElement = <Root>
                                               <%= From el In tables.methods.<Method>.<Static> _
                                                   Where el.Attribute("id").Value = sear.Value _
                                                   Select el %>
                                           </Root>
                If isstatic.Value = "no" Then
                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & _
                    CurMet & "IL.Emit(OpCodes.Call, " & MakeGetType(GetTyp("me")) & ".GetConstructor(Type.EmptyTypes))" & vbCrLf
                End If

                GoTo fin
            End If

            Dim namesplit() As String = StringParser(metname, ":")

            If namesplit.Length < 2 Then
                Console.WriteLine("Wrong method call (didn't use ::) at: " & code)
                errorhappened = True
            Else
                Dim typ As String = namesplit(0)
                Dim met As String = namesplit(1)

                Dim counta As Integer = tables.fields.<Counter>.<Count>.Value
                Dim ia As Integer = 0

                If typ = "me" Then
                    virt = True
                    vinh = True
                    GoTo cont
                End If

                Dim attach As Boolean = False
                Dim buffer As String = ""

                If typ Like "*[[]*]*" Then
                    Dim split() As String = StringParser2ds(typ, "[", "]")
                    attach = True
                    typ = split(0)
                    buffer = split(1)
                End If

                Do Until ia = counta

                    ia = ia + 1
                    Dim typfind As XElement = <root>
                                                  <%= From el In tables.fields.<Field>.<Name> _
                                                      Where el.Attribute("id") = CStr(ia) _
                                                      Select el.Value %>
                                              </root>
                    If typfind.Value = typ Then

                        virt = True
                        vfld = True

                        If attach = True Then
                            typ = typ & "[" & buffer & "]"
                        End If

                        GoTo cont

                    End If

                Loop

                Dim count As Integer = tables.vars.<Counter>.<Count>.Value
                Dim i As Integer = 0

                Do Until i = count

                    i = i + 1
                    Dim typfind As XElement = <root>
                                                  <%= From el In tables.vars.<Var>.<Name> _
                                                      Where el.Attribute("id") = CStr(i) _
                                                      Select el.Value %>
                                              </root>
                    If typfind.Value = typ Then

                        virt = True

                        If attach = True Then
                            typ = typ & "[" & buffer & "]"
                        End If

                        GoTo cont

                    End If

                Loop

cont:


                Dim paramstr As String = ""
                Dim paramarrname As String = ""
                If callsplit.Length > 1 Or virt = True Then
                    Dim params As String = ""

                    If callsplit.Length > 1 Then
                        params = callsplit(1).Trim()
                    End If

                    Dim paramsplit() As String = StringParser(params, ",")

                    Dim s As String
                    typind = typind + 1
                    typbuf = typind

                    If paramsplit.Length > 0 Then
                        Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typbuf & "(-1) As Type" & vbCrLf
                    End If

                    If virt = True Then

                        '                Dim VirtTyp As String = ""

                        If vinh = True Then
                            Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf
                        Else
                            LoadVal(typ.Trim())
                            Gen.rtb.Text = Gen.rtb.Text & "Typ03 = Typ" & vbCrLf
                        End If
                        ' paramstr = paramstr & "Type.GetType(""" & CurTyp & """) ,"


                    End If

                    If paramsplit.Length > 0 Then
                        For Each s In paramsplit

                            s = s.Trim("(")
                            s = s.Trim(")")

                            If s.Trim() Like "loadas:*" Then
                                Dim splt() As String = StringParser(s.Trim(), " ")
                                Dim lassplit() As String = StringParser(splt(0), ":")

                                LoadVal(splt(1).Trim())

                                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp(lassplit(1))) & vbCrLf
                            Else

                                LoadVal(s.Trim())
                            End If

                            Gen.rtb.Text = Gen.rtb.Text & "ReDim Preserve typ" & typbuf & "(UBound(typ" & typbuf & ") + 1)" & vbCrLf & _
                "typ" & typbuf & "(UBound(typ" & typbuf & ")) = Typ" & vbCrLf

                        Next

                    End If

                    If paramsplit.Length > 0 Then

                    End If

                    paramarrname = "typ" & typbuf

                    If paramsplit.Length > 0 = False Then
                        paramarrname = "Type.EmptyTypes"
                    End If

                Else
                    '     If virt = False Then
                    paramarrname = "Type.EmptyTypes"
                    'End If
                End If

                If virt = False Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType(typ) & ".GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(typ) & ".GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                    If poppable = True Then
                        Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                        & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                    End If

                Else

                    If vinh = True Then

                        If met = "Dispose" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & MakeGetType(GetTyp("me")) & ".GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.IDisposable).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.IDisposable") & ".GetMethod(""" & "Dispose" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.IDisposable") & ".GetMethod(""" & "Dispose" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        ElseIf met = "MoveNext" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & MakeGetType(GetTyp("me")) & ".GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.Collections.IEnumerator).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "MoveNext" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "MoveNext" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        ElseIf met = "Reset" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & MakeGetType(GetTyp("me")) & ".GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.Collections.IEnumerator).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "Reset" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "Reset" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        Else

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp("me")) & ".GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        End If

                    ElseIf vfld = True Then

                        Dim fldsearch As XElement = <Root>
                                                        <%= From el In tables.fields.<Field>.<Name> _
                                                            Where el.Value = typ _
                                                            Select el.Attribute("id").Value %>
                                                    </Root>
                        Dim id = fldsearch.Value


                        Dim fldtyp As XElement = <Root>
                                                     <%= From el In tables.fields.<Field>.<Type> _
                                                         Where el.Attribute("id") = id _
                                                         Select el.Value %>
                                                 </Root>

                        If met = "Dispose" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & "Typ03.GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.IDisposable).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.IDisposable") & ".GetMethod(""" & "Dispose" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.IDisposable") & ".GetMethod(""" & "Dispose" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        ElseIf met = "MoveNext" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & "Typ03.GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.Collections.IEnumerator).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "MoveNext" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "MoveNext" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If

                        ElseIf met = "Reset" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & "Typ03.GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.Collections.IEnumerator).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "Reset" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "Reset" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        Else

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If

                        End If

                    Else
                        Dim varsearch As XElement = <Root>
                                                        <%= From el In tables.vars.<Var>.<Name> _
                                                            Where el.Value = typ _
                                                            Select el.Attribute("id").Value %>
                                                    </Root>
                        Dim id = varsearch.Value

                        Dim index As XElement = <Root>
                                                    <%= From el In tables.vars.<Var>.<Index> _
                                                        Where el.Attribute("id") = id _
                                                        Select el.Value %>
                                                </Root>

                        Dim vartyp As XElement = <Root>
                                                     <%= From el In tables.vars.<Var>.<Type> _
                                                         Where el.Attribute("id") = id _
                                                         Select el.Value %>
                                                 </Root>


                        If met = "Dispose" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & "Typ03.GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.IDisposable).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.IDisposable") & ".GetMethod(""" & "Dispose" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.IDisposable") & ".GetMethod(""" & "Dispose" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        ElseIf met = "MoveNext" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & "Typ03.GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.Collections.IEnumerator).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "MoveNext" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "MoveNext" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        ElseIf met = "Reset" Then
                            Gen.rtb.Text = Gen.rtb.Text & "interfacebool = False" & vbCrLf & "For Each t As Type In " & "Typ03.GetInterfaces()" & vbCrLf & _
                                "If t.ToString() = GetType(System.Collections.IEnumerator).ToString() Then" & vbCrLf & "interfacebool = True" & vbCrLf & "End If" & vbCrLf & "Next" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "If interfacebool = True Then" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "Reset" & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Collections.IEnumerator") & ".GetMethod(""" & "Reset" & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "Else" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            Gen.rtb.Text = Gen.rtb.Text & "End If" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If


                        Else

                            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Callvirt, " & "" & "Typ03.GetMethod(""" & met & """, " & paramarrname & "))" & vbCrLf
                            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & "Typ03.GetMethod(""" & met & """, " & paramarrname & ").ReturnType" & vbCrLf

                            If poppable = True Then
                                Gen.rtb.Text = Gen.rtb.Text & "If Typ.ToString() = GetType(System.Void).ToString() Then" & vbCrLf _
                                & "" & vbCrLf & "Else" & vbCrLf & Gen.CurMet & "IL.Emit(OpCodes.Pop)" & vbCrLf & "End If" & vbCrLf
                            End If

                        End If
                    End If
                End If

            End If
        End If

fin:

    End Sub

    Sub MakeLocMetPtr(ByVal code As String)

        Dim typbuf As Integer = 0

        Dim callsplit() As String = StringParser2ds(code, "(", ")")

        Dim metname As String = callsplit(0).Trim()

        'Dim virt As Boolean = False

        'Dim sea As XElement = <Root>
        '                          <%= From el In tables.methods.<Method>.<Name> _
        '                              Where el.Value = metname _
        '                              Select el.Attribute("id").Value %>
        '                      </Root>

        'Dim search As XElement = <Root>
        '                             <%= From el In tables.methods.<Method>.<Static> _
        '                                 Where el.Attribute("id").Value = sea.Value _
        '                                 Select el.Value %>
        '                         </Root>

        'If search.Value = "no" Then
        '    virt = True
        'End If

        'If virt = True Then

        '    ' Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf

        'End If

        'Dim paramstr As String = ""
        'Dim paramarrname As String = ""
        'If callsplit.Length > 1 Then
        '    Dim params As String = ""

        '    If callsplit.Length > 1 Then
        '        params = callsplit(1).Trim()
        '    End If

        '    Dim paramsplit() As String = StringParser(params, ",")

        '    Dim s As String
        '    typind = typind + 1
        '    typbuf = typind

        '    If paramsplit.Length > 0 Then
        '        Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typbuf & "(-1) As Type" & vbCrLf
        '    End If


        '    If paramsplit.Length > 0 Then
        '        For Each s In paramsplit

        '            LoadVal(s.Trim())
        '            Gen.rtb.Text = Gen.rtb.Text & "ReDim Preserve typ" & typbuf & "(UBound(typ" & typbuf & ") + 1)" & vbCrLf & _
        '"typ" & typbuf & "(UBound(typ" & typbuf & ")) = Typ" & vbCrLf

        '        Next

        '    End If

        '    If paramsplit.Length > 0 Then
        '        ' paramstr = paramstr.Trim(",")
        '        'paramstr = paramstr & "}"
        '    End If

        '    paramarrname = "typ" & typbuf

        '    If paramsplit.Length > 0 = False Then
        '        paramarrname = "Type.EmptyTypes"
        '    End If

        'Else
        '    '     If virt = False Then
        '    paramarrname = "Type.EmptyTypes"
        '    'End If
        'End If

        'If virt = True Then
        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldftn, " & metname & ")" & vbCrLf
        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.IntPtr") & vbCrLf


        'ElseIf virt = False Then
        'Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldftn, " & metname & ")" & vbCrLf
        'Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.IntPtr") & vbCrLf

        'End If



    End Sub


    ''' <summary>
    ''' The main parser method
    ''' </summary>
    ''' <param name="code">the line of dylan.NEt code</param>
    ''' <remarks></remarks>
    Sub ProcessLine(ByVal code As String)

        If code = "" Then

        ElseIf code Like "///*" Then

            If indoc = True Then
                code = code.Substring(3, code.Length - 3)

                If code Like "*<*" Then

                    Dim el As XElement = XElement.Parse(code)
                    xmlmem.Add(el)

                End If

            End If

        ElseIf code Like "//*" Then

        ElseIf code Like "[#]depend *" Then


        ElseIf code Like "[#]stdasm *" Then

            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine("Wrong Standard Assembly Switch modification at: " & code)
                errorhappened = True

            Else

                Dim opt As String = split(1)

                If opt = "on" Then
                    stdasm = True
                ElseIf opt = "off" Then
                    stdasm = False
                End If

            End If

        ElseIf code Like "[#]singularity" Then
            sing = True
            debug = False

        ElseIf code Like "[#]debug *" Then

            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong Debug Switch modification at: " & code))
                errorhappened = True

            Else

                Dim opt As String = split(1)

                If opt = "on" Then
                    debug = True
                ElseIf opt = "off" Then
                    debug = False
                End If

            End If


        ElseIf code Like "[#]makeasm *" Then

            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong Make Assembly Switch modification at: " & code))
                errorhappened = True

            Else

                Dim opt As String = split(1)

                If opt = "on" Then
                    mkasm = True
                ElseIf opt = "off" Then
                    mkasm = False
                End If

            End If


        ElseIf code Like "[#]refasm *" Then

            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong assembly reference at: " & code))
                errorhappened = True

            Else

                Console.WriteLine("Referencing DLL: " & split(1))

                Dim arr As String() = refasm
                ReDim Preserve arr(UBound(arr) + 1)
                arr(UBound(arr)) = split(1)
                refasm = arr

            End If

        ElseIf code Like "[#]newres *" Then

            Dim split() As String = StringParser(code, " ")

            If split.Length < 3 Then
                Console.WriteLine(WriteErrInfo("Wrong resource creation at: " & code))
                errorhappened = True

            Else

                Console.WriteLine("Adding Resource: " & split(2))

                Dim arr As String() = resarr
                ReDim Preserve arr(UBound(arr) + 1)
                arr(UBound(arr)) = split(1) & " " & split(2)
                resarr = arr

            End If

        ElseIf code Like "callconv *" Then
            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong calling convention set at: " & code))
                errorhappened = True
            Else
                callconv = GetCallConv(split(1))
            End If

        ElseIf code Like "charset *" Then
            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong charset set at: " & code))
                errorhappened = True
            Else
                charset = GetCharSet(split(1))
            End If

        ElseIf code Like "dllimport *" Then
            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong dllimport set at: " & code))
                errorhappened = True
            Else
                dllimport = split(1)
            End If

        ElseIf code Like "metimpl *" Then
            Dim split() As String = StringParser(code, " ")


            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong method implmenetation flags set at: " & code))
                errorhappened = True
            Else

                Dim mistr As String = ""
                Dim len As Integer = split.Length - 1

                Dim i As Integer = 0

                Do Until i = len
                    i = i + 1
                    mistr = mistr & GetMetImplFlags(split(i))
                    If i <> len Then
                        mistr = mistr & " Or "
                    End If
                Loop

                Gen.rtb.Text = Gen.rtb.Text & CurMet & ".SetImplementationFlags(" & mistr & ")" & vbCr

            End If


        ElseIf code Like "setattr param|*" Then
            Dim split() As String = StringParser(code, " ")

            If split.Length < 3 Then
                Console.WriteLine(WriteErrInfo("Wrong attribute set at: " & code))
                errorhappened = True
            Else
                Dim param As String = StringParser(split(1), "|")(1)
                Dim attr As String = split(2)
                Dim vars As String = ""

                Dim i As Integer = 2
                Dim e As Integer = split.Length - 1

                Do Until i = e
                    i = i + 1
                    vars = vars & split(i) & " "
                Loop

                If attr.Trim() = "marshalas" Then
                    SetMarshalAsParam(param, vars.Trim())
                End If

            End If

        ElseIf code Like "setattr *" Then
            Dim split() As String = StringParser(code, " ")

            If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong attribute set at: " & code))
                errorhappened = True
            Else
                Dim attr As String = split(1)
                Dim vars As String = ""

                Dim i As Integer = 1
                Dim e As Integer = split.Length - 1

                Do Until i = e
                    i = i + 1
                    vars = vars & split(i) & " "
                Loop

                If attr.Trim() = "marshalas" Then
                    SetMarshalAs(vars.Trim())
                End If

            End If

            ElseIf code Like "import *" Then
                'TODO: import assemblies
                Dim impsplit() As String = StringParser(code, " ")

                If impsplit.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong namespace import at: " & code))
                    errorhappened = True

                Else
                    'Dim name As String = impsplit(1)
                    'Dim dlladd As String = impsplit(2)

                    Dim ns As String = impsplit(1)
                    Console.WriteLine("Importing namespace: " & ns)

                    'Gen.rtb.Text = Gen.rtb.Text & "Public " & name & " As Assembly = Assembly.LoadFile(""" & dlladd & """)" & vbCrLf

                    'Gen.rtbmain.Text = Gen.rtbmain.Text & "addstr(""" & name & """)" & vbCrLf & _
                    '"addasm(" & name & ")" & vbCrLf

                    'tables.imp.<Counter>.<Count>.Value = CStr(CInt(tables.imp.<Counter>.<Count>.Value) + 1)

                    'Dim id As String = tables.imp.<Counter>.<Count>.Value

                    'Dim ns As XElement = <ns>
                    '                         <Name id=<%= id %>><%= name %></Name>
                    '                         <Var id=<%= id %>><%= name %></Var>
                    '                     </ns>

                    'tables.imp.Add(ns)

                    Dim arr As String() = impns
                    ReDim Preserve arr(UBound(arr) + 1)
                    arr(UBound(arr)) = impsplit(1)
                    impns = arr


            End If

        ElseIf code Like "locimport *" Then
            Dim impsplit() As String = StringParser(code, " ")

            If impsplit.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong namespace import at: " & code))
                errorhappened = True

            Else
                Dim ns As String = impsplit(1)
                Console.WriteLine("Importing namespace: " & ns)

                Dim arr As String() = locimports
                ReDim Preserve arr(UBound(arr) + 1)
                arr(UBound(arr)) = impsplit(1)
                locimports = arr


            End If

            ElseIf code Like "assembly *" Then
                'TODO: assembly naming

                Dim asmsplit() As String = StringParser(code, " ")

                If asmsplit.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong assembly declaration at: " & code))
                    errorhappened = True

                Else

                    If asmsplit.Length = 2 Then
                        Gen.MakeAsm(asmsplit(1), "exe")
                    ElseIf asmsplit.Length = 3 Then
                        Gen.MakeAsm(asmsplit(1), asmsplit(2))
                    End If

                End If

                '   ElseIf code Like "version *" Then
                '    'TODO: version stmt

            ElseIf code Like "ver *" Then

                Dim split() As String = StringParser(code, " ")

                Dim versplit() As String = StringParser(split(1), ".")

                If versplit.Length < 4 Then
                Console.WriteLine(WriteErrInfo("Wrong version assignment at : " & code))
                    errorhappened = True

                Else
                    ver = versplit
                End If

            ElseIf code Like "[#]include *" Then

                Dim split() As String = StringParser(code, " ")

                If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong file inclusion at: " & code))
                    errorhappened = True
                Else

                    ProcessSecFile(split(1))
                End If

            ElseIf code Like "[#]xmldoc *" Then

                Dim split() As String = StringParser(code, " ")

                If split.Length < 3 Then
                Console.WriteLine(WriteErrInfo("Wrong XML Documentation at: " & code))
                    errorhappened = True

                Else
                    Dim ty As String = split(1)
                    Dim name As String = split(2)
                    ty = xmldoctype(ty)

                    If name Like "*(*)" Then

                        Dim metsplit() As String = StringParser2ds(name, "(", ")")
                        Dim metname As String = metsplit(0)

                        Dim paramstr As String = ""

                        If metsplit.Length <> 1 Then

                            Dim params() As String = StringParser(metsplit(1), ",")

                            For Each param As String In params

                                param = param.Trim()
                                param = GetTyp(param)
                                paramstr = paramstr & param & "," & ""

                            Next

                            paramstr = paramstr.Trim()
                            paramstr = paramstr.Trim(",")

                        End If

                        name = metname & "(" & paramstr & ")"

                    End If

                    Dim memname As String = ty & ":" & name

                    xmlmem = <member name=<%= memname %>>
                             </member>

                    indoc = True
                End If

            ElseIf code Like "namespace *" Then

                Dim split() As String = StringParser(code, " ")

                If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong namespace declration at: " & code))
                    errorhappened = True
                Else
                    CurNS = split(1)
                End If

            ElseIf code Like "class *" Then

                Dim extend As String = "System.Object"

                If code Like "class * extends *" Then
                    Dim split() As String = StringParser(code, " ")

                    If split.Length < 5 Then
                    Console.WriteLine(WriteErrInfo("Wrong class with inheritance declrartion at: " & code))
                        errorhappened = True
                    Else
                        Dim lenn As Integer = split.Length - 1
                        Dim finpl As Integer = lenn - 2
                        extend = GetTyp(split(lenn))

                        Dim buf As String = ""

                        Dim isplit As Integer = -1

                        Do Until isplit = finpl

                            isplit = isplit + 1

                            buf = buf & split(isplit) & " "

                        Loop

                        buf = buf.Trim()
                        code = buf
                    End If
                End If

                Dim classsplit() As String = StringParser(code, " ")

                If classsplit.Length < 3 Then
                Console.WriteLine(WriteErrInfo("Wrong class declaration at: " & code))
                    errorhappened = True
                Else
                    Dim len As Integer = classsplit.Length - 1

                    Dim name As String = classsplit(len)
                    Dim isinterf As String = "no"

                    Dim i As Integer = 0

                    Dim attrs As String = ""
                    Dim lp As Integer = len - 1

                    Do Until i = lp

                        i = i + 1

                        Dim attr As String = classsplit(i)
                        If attr = "interface" Then
                            isinterf = "yes"
                        End If

                        attr = tables.GetTypAttrs(attr)

                        attrs = attrs & attr

                        If i <> lp Then

                            attrs = attrs & " " & "Or" & " "

                        End If

                    Loop

                    Gen.DeclareClass(name, attrs, extend, isinterf)
                End If

            ElseIf code Like "enum *" Then

                Dim enumsplit() As String = StringParser(code, " ")

                If enumsplit.Length < 4 Then
                Console.WriteLine(WriteErrInfo("Wrong enum declaration at: " & code))
                    errorhappened = True
                Else
                    Dim len As Integer = enumsplit.Length - 1

                    Dim name As String = enumsplit(len)
                    Dim type As String = enumsplit(len - 1)

                    Dim i As Integer = 0

                    Dim attrs As String = ""
                    Dim lp As Integer = len - 2

                    Do Until i = lp

                        i = i + 1

                        Dim attr As String = enumsplit(i)
                        attr = tables.GetTypAttrs(attr)

                        attrs = attrs & attr

                        If i <> lp Then

                            attrs = attrs & " " & "Or" & " "

                        End If

                    Loop

                    Gen.DeclareEnum(name, attrs, GetTyp(type))
                End If

            ElseIf code Like "field *" Then


                Dim isstatic As String = "no"


                Dim fldsplit() As String = StringParser(code, " ")


                If fldsplit.Length < 4 Then
                Console.WriteLine(WriteErrInfo("Wrong field declaration at: " & code))
                    errorhappened = True
                Else
                    Dim len As Integer = fldsplit.Length - 1
                    Dim name As String = ""
                    Dim attrs As String = ""
                    Dim typ As String = ""
                    Dim params As String = ""

                    name = fldsplit(len)
                    typ = fldsplit(len - 1)

                    Dim i As Integer = 0
                    Dim lastattr As Integer = len - 2

                    typ = tables.GetTyp(typ)

                    Dim isarr As String = "no"

                    If typ Like "*[[]*]*" Then
                        isarr = "yes"
                    End If

                    Dim attrstr As String = ""

                    i = 0

                    Do Until i = lastattr

                        i = i + 1

                        attrstr = attrstr & fldsplit(i) & " "

                    Loop

                    attrstr = attrstr.Trim()

                    Dim attrsplit() As String = StringParser(attrstr, " ")

                    Dim lp As Integer = attrsplit.Length - 1
                    i = -1



                    Do Until i = lp
                        i = i + 1

                        Dim att As String = attrsplit(i)

                        If att = "static" Then
                            isstatic = "yes"
                        End If

                        att = GetFieldAttrs(att)

                        attrs = attrs & att

                        If i <> lp Then
                            attrs = attrs & " " & "Or" & " "
                        End If
                    Loop


                    Gen.DeclFld(name, attrs, typ, isstatic, isarr)
                End If

            ElseIf code Like "property *" Then


                Dim propsplit() As String = StringParser(code, " ")


                If propsplit.Length < 4 Then
                Console.WriteLine(WriteErrInfo("Wrong property declaration at: " & code))
                    errorhappened = True
                Else
                    Dim len As Integer = propsplit.Length - 1
                    Dim name As String = ""
                    Dim attrs As String = ""
                    Dim typ As String = ""
                    Dim params As String = ""

                    name = propsplit(len)
                    typ = propsplit(len - 1)

                    Dim i As Integer = 0
                    Dim lastattr As Integer = len - 2

                    typ = tables.GetTyp(typ)

                    Dim isarr As String = "no"

                    If typ Like "*[[]*]*" Then
                        isarr = "yes"
                    End If

                    Dim attrstr As String = ""

                    i = 0

                    Do Until i = lastattr

                        i = i + 1

                        attrstr = attrstr & propsplit(i) & " "

                    Loop

                    attrstr = attrstr.Trim()

                    Dim attrsplit() As String = StringParser(attrstr, " ")

                    Dim lp As Integer = attrsplit.Length - 1
                    i = -1

                    Do Until i = lp
                        i = i + 1

                        Dim att As String = attrsplit(i)

                        'If att = "static" Then
                        '    isstatic = "yes"
                        'End If

                        att = GetPropAttrs(att)

                        attrs = attrs & att

                        If i <> lp Then
                            attrs = attrs & " " & "Or" & " "
                        End If
                    Loop


                    Gen.DeclProp(name, attrs, typ, isarr)
                End If

            ElseIf code Like "get *" Then

                Dim split() As String = StringParser(code, " ")
                If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong getter assignment at: " & code))
                    errorhappened = True
                Else
                    Dim met() As String = StringParser2ds(split(1), "(", ")")

                    Gen.rtb.Text = Gen.rtb.Text & CurProp & ".SetGetMethod(" & met(0) & ")" & vbCrLf
                End If
            ElseIf code Like "set *" Then

                Dim split() As String = StringParser(code, " ")

                If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong setter assignment at: " & code))
                    errorhappened = True
                Else
                    Dim met() As String = StringParser2ds(split(1), "(", ")")

                    Gen.rtb.Text = Gen.rtb.Text & CurProp & ".SetSetMethod(" & met(0) & ")" & vbCrLf
                End If
            ElseIf code Like "method *" Then
                If code Like "method *(*)" Then
                    'TODO: method declaration

                    tables.vars = <Vars>
                                      <Counter>
                                          <Count>0</Count>
                                      </Counter>
                                  </Vars>

                    tables.labels = <Labels>
                                        <Counter>
                                            <Count>0</Count>
                                        </Counter>
                                    </Labels>

                    locind = -1
                    argind = -1

                    Dim isstatic As String = "no"
                Dim paraminfostr As String = ""
                Dim paramattrs(0) As String
                paramattrs(0) = "retval"

                    Dim metsplit() As String = StringParser(code, " ")


                    If abst = False Then
                        If metend = False Then
                            Console.WriteLine("Last Method: " & CurMet & " was not ended")
                            errorhappened = True
                        End If
                    End If

                    If metsplit.Length < 4 Then
                    Console.WriteLine(WriteErrInfo("Wrong method declaration at: " & code))
                        errorhappened = True
                    Else
                        metend = False
                        Dim len = metsplit.Length - 1
                        Dim bp As Integer = 0
                        Dim i As Integer = -1

                        Dim name As String = ""
                        Dim attrs As String = ""
                        Dim rettyp As String = ""
                        Dim params As String = ""

                        Do Until i = len
                            i = i + 1

                            If metsplit(i).Contains("(") Then
                                bp = i
                            End If

                        Loop

                        rettyp = metsplit(bp - 1)
                        rettyp = tables.GetTyp(rettyp)

                        Dim namesplit() As String = StringParser2ds(code, "(", ")")

                        Dim namepartsplit() As String = StringParser(namesplit(0), " ")
                        Dim lenname As Integer = namepartsplit.Length - 3

                        Dim iname As Integer = 0
                        abst = False

                        Do Until iname = lenname
                            iname = iname + 1

                            Dim abute As String = namepartsplit(iname)
                            If abute = "static" Then
                                isstatic = "yes"
                            End If
                        If abute = "abstract" Or abute = "pinvokeimpl" Then
                            abst = True
                        End If

                        If abute = "pinvokeimpl" Then
                            pinvokemode = True
                        End If

                        Loop

                        If isstatic = "no" Then
                            argind = argind + 1
                        End If

                        If namesplit.Length = 1 Then
                            params = "Type.EmptyTypes"
                        Else

                            typind = typind + 1

                            Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & "(-1) As Type" & vbCrLf

                            Dim paramsplit() As String = StringParser(namesplit(1), ",")

                        Dim j As Integer = 0

                            Dim s As String
                        For Each s In paramsplit

                            s = s.Trim()

                            Dim presplit() As String = StringParser(s, " ")
                            j = j + 1
                            ReDim Preserve paramattrs(j)
                            s = ""
                            paramattrs(j) = ""
                            Dim b As Boolean = False
                            For Each t As String In presplit

                                If t = "var" Then
                                    b = True
                                End If
                                If b = True Then
                                    s = s & t & " "
                                Else
                                    paramattrs(j) = paramattrs(j) & t & " "
                                End If
                            Next

                            paramattrs(j) = paramattrs(j).Trim()
                            s = s.Trim()

                            Dim decsplit() As String = StringParser(s, " ")

                            Dim nam As String = decsplit(1)
                            VarName = nam
                            Dim type As String = tables.GetTyp(decsplit(3))

                            Dim isarr As String = "no"

                            If nam Like "*[[]*]*" Then
                                Dim split() As String = StringParser2ds(nam, "[", "]")
                                nam = split(0)
                                isarr = "yes"
                            End If


                            Gen.DeclareVar(nam, type, "arg", isarr)

                            If isarr = "yes" Then
                                type = type & "[]"
                            End If

                            Gen.rtb.Text = Gen.rtb.Text & "ReDim Preserve typ" & typind & "(UBound(typ" & typind & ") + 1)" & vbCrLf & _
            "typ" & typind & "(UBound(typ" & typind & ")) = " & MakeGetType(type) & vbCrLf


                            paraminfostr = paraminfostr & nam & " ,"

                        Next


                            params = "typ" & typind

                        End If

                        Dim split2() As String = StringParser(namesplit(0), " ")
                        Dim lastpos As Integer = split2.Length - 1

                        name = split2(lastpos)

                        Dim attrstr As String = ""

                        i = 0

                        Do Until i = (bp - 2)

                            i = i + 1

                            attrstr = attrstr & metsplit(i) & " "

                        Loop

                        attrstr = attrstr.Trim()

                        Dim attrsplit() As String = StringParser(attrstr, " ")

                        Dim lp As Integer = attrsplit.Length - 1
                        i = -1



                        Do Until i = lp
                            i = i + 1

                            Dim att As String = attrsplit(i)

                            If att = "static" Then
                                isstatic = "yes"
                            End If

                            att = GetMetAttrs(att)

                            attrs = attrs & att

                        If i <> lp Then
                            attrs = attrs & " " & "Or" & " "
                        End If
                        Loop

                        paraminfostr = paraminfostr.Trim(",")
                        Dim paraminfoarr() As String = StringParser(paraminfostr, ",")

                    Gen.DeclMethod(name, attrs, rettyp, params, isstatic, paraminfoarr, paramattrs)
                    If pinvokemode <> True Then

                        emitlineinfo = True

                    End If
                    pinvokemode = False
                End If
                Else
                Console.WriteLine(WriteErrInfo("Wrong method declaration at: " & code))
                End If

            ElseIf code Like "try" Then

                tind = tind + 1
                Dim n As String = "try" & tind

                Gen.rtb.Text = Gen.rtb.Text & "Dim " & n & " As System.Reflection.Emit.Label = " & CurMet & "IL.BeginExceptionBlock()" & vbCrLf

            ElseIf code Like "catch * as *" Then

                Dim varname As String = ""
                Dim typname As String = ""

                Dim split() As String = StringParser(code, " ")

                If split.Length < 4 Then
                Console.WriteLine(WriteErrInfo("Wrong catch statment at: " & code))
                    errorhappened = True
                Else
                    varname = split(1)
                    typname = split(3)

                    Parser.ProcessLine("var " & varname & " as " & typname)

                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.BeginCatchBlock(" & MakeGetType(GetTyp(typname)) & ")" & vbCrLf

                    Dim varsearch As XElement = <Root>
                                                    <%= From el In tables.vars.<Var>.<Name> _
                                                        Where el.Value = varname _
                                                        Select el.Attribute("id").Value %>
                                                </Root>
                    Dim id = varsearch.Value

                    Dim index As XElement = <Root>
                                                <%= From el In tables.vars.<Var>.<Index> _
                                                    Where el.Attribute("id") = id _
                                                    Select el.Value %>
                                            </Root>

                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Stloc," & index.Value & ")" & vbCrLf
                End If
            ElseIf code Like "finally" Then

                Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.BeginFinallyBlock()" & vbCrLf

            ElseIf code Like "label *" Then


                Dim split() As String = StringParser(code, " ")
                If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong label declaration at: " & code))
                    errorhappened = True
                Else
                    Gen.DeclLabel(split(1))
                End If
            ElseIf code Like "place *" Then

                Dim split() As String = StringParser(code, " ")
                If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong label placing at: " & code))
                    errorhappened = True
                Else

                    Gen.PlaceLabel(split(1))
                End If
            ElseIf code Like "goto *" Then

                Dim split() As String = StringParser(code, " ")
                If split.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong goto statement at: " & code))
                    errorhappened = True
                Else

                    Gen.BranchToLabel(split(1))
                End If

            ElseIf code Like "if * then" Then

                elsepass = False
                ReDim Preserve elsepassdepth(UBound(elsepassdepth) + 1)
                elsepassdepth(UBound(elsepassdepth)) = elsepass

                'if x = 2 then
                Dim ifsplit() As String = StringParser(code, " ")

                If ifsplit.Length < 5 Then
                Console.WriteLine(WriteErrInfo("Wrong if statement at: " & code))
                    errorhappened = True
                Else
                    Dim lt As String = ifsplit(1)
                    Dim op As String = ifsplit(2)
                    Dim rt As String = ifsplit(3)

                    Dim ops As String = op
                    op = tables.GetOP(op)

                    LoadVal(lt)
                    LoadVal(rt)

                    ifind = ifind + 1

                    ReDim Preserve ifinddepth(UBound(ifinddepth) + 1)
                    ifinddepth(UBound(ifinddepth)) = ifind


                    If ops <> "<>" And ops <> "!=" Then
                        Gen.rtb.Text = Gen.rtb.Text & "Dim fa" & ifind & " As System.Reflection.Emit.Label = " & CurMet & "IL.DefineLabel()" & vbCrLf & _
                        "Dim tru" & ifind & " As System.Reflection.Emit.Label = " & CurMet & "IL.DefineLabel()" & vbCrLf & _
                        "Dim cont" & ifind & " As System.Reflection.Emit.Label = " & CurMet & "IL.DefineLabel()" & vbCrLf & _
                        CurMet & "IL.Emit(OpCodes." & op & ", tru" & ifind & ")" & vbCrLf & _
                        CurMet & "IL.Emit(OpCodes.Br, fa" & ifind & ")" & vbCrLf & _
                        CurMet & "IL.MarkLabel(tru" & ifind & ")" & vbCrLf
                    Else
                        Gen.rtb.Text = Gen.rtb.Text & "Dim fa" & ifind & " As System.Reflection.Emit.Label = " & CurMet & "IL.DefineLabel()" & vbCrLf & _
                                        "Dim tru" & ifind & " As System.Reflection.Emit.Label = " & CurMet & "IL.DefineLabel()" & vbCrLf & _
                                        "Dim cont" & ifind & " As System.Reflection.Emit.Label = " & CurMet & "IL.DefineLabel()" & vbCrLf & _
                                        CurMet & "IL.Emit(OpCodes." & op & ", fa" & ifind & ")" & vbCrLf & _
                                        CurMet & "IL.Emit(OpCodes.Br, tru" & ifind & ")" & vbCrLf & _
                                        CurMet & "IL.MarkLabel(tru" & ifind & ")" & vbCrLf

                    End If
                End If


            ElseIf code Like "literal * = *" Then

                Dim split() As String = StringParser(code, "=")
                Dim ds() As String = StringParser(split(0).Trim(), " ")
                If ds.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong literal declaration at: " & code))
                    errorhappened = True
                Else
                    Dim name As String = ds(1)
                    Dim value As String = split(1).Trim()

                    Console.WriteLine("      Adding Literal: " & name)

                    value = value.Trim("""")
                    value = value.Trim("'")
                    value = """" & value & """"

                    Gen.rtb.Text = Gen.rtb.Text & CurObj & ".DefineLiteral(" & """" & name & """" & ", " & "CType(" & value & ", " & EnumType & "))" & vbCrLf
                End If

            ElseIf code Like "var *" Then
                If code Like "var * as * = *" Then
                    'TODO: var declaration and assignment

                    Dim split() As String = StringParser(code, "=")

                    DeclVar(split(0).Trim(), "loc")
                    AssignVal(VarName & " = " & split(1).Trim())

                ElseIf code Like "var * as *" Then
                    'TODO: var declaration

                    DeclVar(code, "loc")

                Else
                Console.WriteLine(WriteErrInfo("Wrong variable declaration at:" & code))
                End If
        ElseIf code Like "* = *" = True And code Like "*""* = *""*" = False Then 'And code Like "if*" = False Then
            'TODO: var assignment

            AssignVal(code)

            ElseIf code Like "*++" Then
                'increment identifier

                Dim split() As String = StringParser(code, "+")
                Dim ident As String = split(0).Trim()

                Dim stmt As String = ident & " = " & ident & " + 1"
                ProcessLine(stmt)

            ElseIf code Like "*--" Then
                'decrement identifier

                Dim split() As String = StringParser(code, "-")
                Dim ident As String = split(0).Trim()

                Dim stmt As String = ident & " = " & ident & " - 1"
                ProcessLine(stmt)

            ElseIf code = "else" Then
                elsepassdepth(UBound(elsepassdepth)) = True
                Dim ifindlocal As Integer = ifinddepth(UBound(ifinddepth))

                Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Br, cont" & ifindlocal & ")" & vbCrLf & _
               CurMet & "IL.MarkLabel(fa" & ifindlocal & ")" & vbCrLf

            ElseIf code Like "return *" Then

                Dim retsplit() As String = StringParser(code, " ")

                If retsplit.Length < 2 Then

                    Console.WriteLine("Wrong return statement at: " & code)
                    errorhappened = True
                Else
                    Dim len As Integer = retsplit.Length - 1

                    Dim i As Integer = 0

                    Dim str As String = ""

                    Do Until i = len
                        i = i + 1

                        str = str & retsplit(i) & " "
                    Loop

                    str = str.Trim()

                    LoadVal(str)
                End If

                'ElseIf code Like "load *" Then

                '    Dim retsplit() As String = StringParser(code, " ")

                '    If retsplit.Length < 2 Then

                '        Console.WriteLine("Wrong load statement at: " & code)
                '        errorhappened = True
                '    Else
                '        Dim len As Integer = retsplit.Length - 1

                '        Dim i As Integer = 0

                '        Dim str As String = ""

                '        Do Until i = len
                '            i = i + 1

                '            str = str & retsplit(i) & " "
                '        Loop

                '        str = str.Trim()

                '        LoadVal(str)
                '    End If

            ElseIf code Like "throw *" Then

                Dim tsplit() As String = StringParser(code, " ")

                If tsplit.Length < 2 Then
                Console.WriteLine(WriteErrInfo("Wrong exception throw at: " & code))
                    errorhappened = True
                Else
                    Dim len As Integer = tsplit.Length - 1

                    Dim i As Integer = 0

                    Dim str As String = ""

                    Do Until i = len
                        i = i + 1

                        str = str & tsplit(i) & " "
                    Loop

                    str = str.Trim()

                    LoadVal(str)

                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Throw)" & vbCrLf
                End If

            ElseIf code Like "*(*)" Then
                'TODO: method calls

                CallMet(code, True)

            ElseIf code Like "end *" Then
                If code = "end method" Then
                    'TODO: method ending

                    metend = True

                    If abst = False Then
                        Gen.EndMethod()
                    End If
                    emitlineinfo = False

                ElseIf code = "end if" Then

                    Dim ifindlocal As Integer = ifinddepth(UBound(ifinddepth))


                    If elsepassdepth(UBound(elsepassdepth)) = False Then

                        Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Br, cont" & ifindlocal & ")" & vbCrLf & _
                       CurMet & "IL.MarkLabel(fa" & ifindlocal & ")" & vbCrLf

                    End If

                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Br, cont" & ifindlocal & ")" & vbCrLf & _
                   CurMet & "IL.MarkLabel(cont" & ifindlocal & ")" & vbCrLf

                    ReDim Preserve ifinddepth(UBound(ifinddepth) - 1)
                    ReDim Preserve elsepassdepth(UBound(elsepassdepth) - 1)

                ElseIf code = "end enum" Then

                    Gen.EndEnum()

                ElseIf code = "end class" Then

                    Gen.EndClass()

                ElseIf code = "end namespace" Then

                    CurNS = DefNS

                ElseIf code = "end #xmldoc" Then

                    indoc = False
                    xmlmembers.Add(xmlmem)
                    xmlmem = <member></member>

                ElseIf code = "end try" Then

                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.EndExceptionBlock()" & vbCrLf

                ElseIf code = "end property" Then

                Else
                    Console.WriteLine("Wrong ending at:" & code)
                End If
            Else
                Console.WriteLine("Wrong code at: " & code)
            End If

    End Sub

    ''' <summary>
    ''' The parsing function for 1 delimeter
    ''' </summary>
    ''' <param name="StringToParse">the string to parse</param>
    ''' <param name="DelimeterChar">the delimeter</param>
    ''' <returns>an array of string</returns>
    ''' <remarks>this function is string aware</remarks>
    Function StringParser(ByVal StringToParse As String, ByVal DelimeterChar As String) As String()

        Dim arr(-1) As String

        Dim ins As Boolean = False
        Dim ch As String = ""
        Dim acc As String = ""
        Dim i As Integer = -1
        Dim len As Integer = StringToParse.Length - 1

        Do Until i = len
            i = i + 1

            ch = StringToParse.Chars(i)

            Dim ic As String = CStr(CChar(""""))

            If ch = ic Then
                If ins = False Then
                    ins = True
                ElseIf ins = True Then
                    ins = False
                End If
            End If

            If ch = DelimeterChar Then
                If ins = False Then
                    If acc <> "" Then
                        ReDim Preserve arr(UBound(arr) + 1)
                        arr(UBound(arr)) = acc
                    End If
                    acc = ""
                ElseIf ins = True Then
                    acc = acc & ch
                End If
            Else
                acc = acc & ch
            End If

            If i = len Then
                If acc <> "" Then
                    ReDim Preserve arr(UBound(arr) + 1)
                    arr(UBound(arr)) = acc
                End If
                acc = ""
            End If

        Loop

        Return arr
    End Function

    ''' <summary>
    ''' The parsing function for 2 delimeters
    ''' </summary>
    ''' <param name="StringToParse">the string to parse</param>
    ''' <param name="DelimeterChar">the first delimeter</param>
    ''' <param name="DelimeterChar2">the second delimeter</param>
    ''' <returns>an array of string</returns>
    ''' <remarks>this function is string aware</remarks>
    Function StringParser2ds(ByVal StringToParse As String, ByVal DelimeterChar As String, ByVal DelimeterChar2 As String) As String()

        Dim arr(-1) As String

        Dim ins As Boolean = False
        Dim ch As String = ""
        Dim acc As String = ""
        Dim i As Integer = -1
        Dim len As Integer = StringToParse.Length - 1

        Do Until i = len
            i = i + 1

            ch = StringToParse.Chars(i)

            Dim ic As String = CStr(CChar(""""))

            If ch = ic Then
                If ins = False Then
                    ins = True
                ElseIf ins = True Then
                    ins = False
                End If
            End If

            If ch = DelimeterChar Or ch = DelimeterChar2 Then
                If ins = False Then
                    If acc <> "" Then
                        ReDim Preserve arr(UBound(arr) + 1)
                        arr(UBound(arr)) = acc
                    End If
                    acc = ""
                ElseIf ins = True Then
                    acc = acc & ch
                End If
            Else
                acc = acc & ch
            End If

            If i = len Then
                If acc <> "" Then
                    ReDim Preserve arr(UBound(arr) + 1)
                    arr(UBound(arr)) = acc
                End If
                acc = ""
            End If

        Loop

        Return arr
    End Function

    ''' <summary>
    ''' Calls the constructor for a class inside .NET
    ''' </summary>
    ''' <param name="code">the method call</param>
    ''' <remarks>used only when instantiation is needed. this method used newobj and not call as .ctor is called.</remarks>
    Sub CallCtor(ByVal code As String)

        Dim callsplit() As String = StringParser2ds(code, "(", ")")
        Dim typbuf As Integer = 0
        Dim metname As String = callsplit(0).Trim()
        Dim split() As String = StringParser(metname, " ")

        Dim typ As String = split(1)


        Dim paramstr As String = ""
        Dim paramarrname As String = ""
        If callsplit.Length > 1 Then
            Dim params As String = ""

            If callsplit.Length > 1 Then
                params = callsplit(1).Trim()
            End If

            Dim paramsplit() As String = StringParser(params, ",")

            Dim s As String
            typind = typind + 1
            typbuf = typind

            If paramsplit.Length > 0 Then
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typbuf & "(-1) As Type" & vbCrLf
            End If


            If paramsplit.Length > 0 Then
                For Each s In paramsplit

                    If s.Trim() Like "loadas:*" Then
                        Dim splt() As String = StringParser(s.Trim(), " ")
                        Dim lassplit() As String = StringParser(splt(0), ":")

                        LoadVal(splt(1).Trim())

                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(GetTyp(lassplit(1))) & vbCrLf
                    Else

                        LoadVal(s.Trim())

                    End If

                    Gen.rtb.Text = Gen.rtb.Text & "ReDim Preserve typ" & typbuf & "(UBound(typ" & typbuf & ") + 1)" & vbCrLf & _
       "typ" & typbuf & "(UBound(typ" & typbuf & ")) = Typ" & vbCrLf

                Next

            End If

            If paramsplit.Length > 0 Then

            End If

            paramarrname = "typ" & typbuf

            If paramsplit.Length > 0 = False Then
                paramarrname = "Type.EmptyTypes"
            End If



        Else
            paramarrname = "Type.EmptyTypes"
        End If


        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Newobj, " & "" & MakeGetType(typ) & ".GetConstructor(" & paramarrname & "))" & vbCrLf

    End Sub

    ''' <summary>
    ''' Loads a value on the stack
    ''' </summary>
    ''' <param name="expr">the expression holding a fumction call, a variable name, a string literal, or a number.</param>
    ''' <remarks></remarks>
    Sub LoadVal(ByVal expr As String)

        If expr Like "newarr *" Then

            Dim split() As String = StringParser(expr, " ")

            If split.Length < 3 Then
                Console.WriteLine("Wrong array initialisation at: " & expr)
                errorhappened = True
            Else

                Dim type As String = GetTyp(split(1))
                Dim len As String = split(2)

                LoadArr(len, type)
            End If

        ElseIf expr Like "new *" Then

            CallCtor(expr)

        ElseIf expr Like "castclass *" Then

            Dim split() As String = StringParser(expr, " ")

            If split.Length < 3 Then
                Console.WriteLine("Wrong class casting at: " & expr)
                errorhappened = True
            Else
                Dim val As String = split(1)
                Dim typ As String = GetTyp(split(2))

                DoCast(val, typ)
            End If

        ElseIf expr Like "gettype *" Then

            Dim split() As String = StringParser(expr, " ")

            If split.Length < 2 Then
                Console.WriteLine("Wrong gettype at: " & expr)
                errorhappened = True
            Else
                Dim typ As String = GetTyp(split(1))
                DoGetType(typ)
            End If

        ElseIf expr Like "ptr *" Then
            Dim split() As String = StringParser(expr, " ")

            If split.Length < 2 Then
                Console.WriteLine("Wrong method pointer making at: " & expr)
                errorhappened = True
            Else

                Dim str As String = ""

                For i = 1 To UBound(split)
                    str = str & split(i)
                Next

                MakeLocMetPtr(str)
            End If

        ElseIf expr Like "valinref|*" Then

            Dim split() As String = StringParser(expr, "|")
            LoadVal(split(1).Trim())
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldobj, Typ.GetElementType())" & vbCrLf & _
            "Typ = Typ.GetElementType()" & vbCrLf

        ElseIf expr Like "null" Then
            If expr = "null" Then
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldnull)" & vbCrLf
            End If

        ElseIf expr Like "noload" Then
            If expr = "noload" Then

            End If

        ElseIf expr Like "true" Or expr Like "false" Or expr Like "$*$true" Or expr Like "$*$false" Then

            Dim conv As String = ""
            Dim co As Boolean = False

            If expr Like "$*$*" Then

                co = True

                Dim split() As String = StringParser(expr, "$")
                conv = split(0)
                expr = split(1)

                conv = GetTyp(conv)

            End If

            If expr = "true" Then
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_I4, 1)" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("boolean")) & vbCrLf
            ElseIf expr = "false" Then
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_I4, 0)" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("boolean")) & vbCrLf
            End If

            If co = True Then
                If conv = GetTyp("string") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("integer") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("double") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("boolean") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("char") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("decimal") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("long") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("sbyte") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("short") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("single") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("object") Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Box," & "Typ" & ")" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("object")) & vbCrLf


                End If
            End If


        ElseIf expr = "me" Then
            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarg_0)" & vbCrLf

        ElseIf expr Like """*""" Or expr Like "$*$""*""" Then

            Dim conv As String = ""
            Dim co As Boolean = False

            If expr Like "$*$*" Then

                co = True

                Dim split() As String = StringParser(expr, "$")
                conv = split(0)
                expr = split(1)

                conv = GetTyp(conv)

            End If

            'expr = expr.Trim("""")

            'expr = """" & expr & """"

            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldstr, " & expr & ")" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("string")) & vbCrLf

            If co = True Then
                If conv = GetTyp("string") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("integer") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("double") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("boolean") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("char") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("decimal") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("long") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("sbyte") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("short") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("single") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("object") Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Box," & "Typ" & ")" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("object")) & vbCrLf

                End If
            End If

        ElseIf expr Like "'*'" Or expr Like "$*$'*'" Then

            Dim conv As String = ""
            Dim co As Boolean = False

            If expr Like "$*$*" Then

                co = True

                Dim split() As String = StringParser(expr, "$")
                conv = split(0)
                expr = split(1)

                conv = GetTyp(conv)

            End If

            expr = expr.Trim("'")

            expr = """" & expr & """"

            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldstr, " & expr & ")" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("string")) & vbCrLf
            typind = typind + 1

            Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

            Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & "))" & vbCrLf
            Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & ").ReturnType" & vbCrLf


            If co = True Then
                If conv = GetTyp("string") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("integer") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("double") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("boolean") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("char") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("decimal") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("long") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("sbyte") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("short") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("single") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("object") Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Box," & "Typ" & ")" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("object")) & vbCrLf

                End If
            End If

        ElseIf expr Like "* + *" Or expr Like "* - *" Or expr Like "* [*] *" Or expr Like "* / *" Or expr Like "* % *" And expr Like """*""" = False Then

            Dim symarr() As String = StringParser(expr, " ")
            symarr = StringParser(RPNPreProc(symarr), " ")
            Dim rpn As String = ConvToRPN(symarr)

            Dim rpnarr() As String = StringParser(rpn, " ")

            For Each s As String In rpnarr

                If s = "+" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Add)" & vbCrLf

                ElseIf s = "*" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Mul)" & vbCrLf

                ElseIf s = "-" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Sub)" & vbCrLf

                ElseIf s = "/" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Div)" & vbCrLf

                ElseIf s = "%" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.[Rem])" & vbCrLf

                Else

                    LoadVal(s)

                End If

            Next

        ElseIf expr Like "* and *" Or expr Like "* nand *" Or expr Like "* xor *" Or expr Like "* or *" Or expr Like "* nor *" And expr Like """*""" = False Then

            Dim symarr() As String = StringParser(expr, " ")
            Dim rpn As String = ConvToRPNLogic(symarr)

            Dim rpnarr() As String = StringParser(rpn, " ")

            For Each s As String In rpnarr

                If s = "and" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.And)" & vbCrLf

                ElseIf s = "nand" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.And)" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Not)" & vbCrLf

                ElseIf s = "xor" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Xor)" & vbCrLf

                ElseIf s = "or" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Or)" & vbCrLf

                ElseIf s = "nor" Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Or)" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Not)" & vbCrLf

                Else

                    LoadVal(s)

                End If

            Next

        ElseIf expr Like "*(*)" Or expr Like "$*$*(*)" Then

            Dim conv As String = ""
            Dim co As Boolean = False

            If expr Like "$*$*" Then

                co = True

                Dim buff As String = ""
                Dim len As Integer = expr.Length - 1
                Dim i As Integer = -1
                Dim cnt As Integer = 0

                Do Until i = len
                    i = i + 1

                    Dim ch As String = expr.Chars(i)

                    If ch = "$" Then
                        cnt = cnt + 1
                    End If

                    If ch = "$" Then
                        If cnt > 2 Then
                            buff = buff & ch
                        End If
                    Else
                        If cnt < 2 Then
                            conv = conv & ch
                        Else
                            buff = buff & ch
                        End If
                    End If

                Loop

                expr = buff
                conv = GetTyp(conv)
            End If

            CallMet(expr, False)

            If co = True Then
                If conv = GetTyp("string") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("integer") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("double") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("boolean") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("char") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("decimal") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("long") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("sbyte") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("short") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("single") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("object") Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Box," & "Typ" & ")" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("object")) & vbCrLf


                End If
            End If


        ElseIf expr Like "$*$#*" Or expr Like "$*$-#*" Or expr Like "$*$+#*" Then

            Dim split() As String = StringParser(expr, "$")
            Dim conv As String = split(0)
            Dim num As String = split(1)

            conv = GetTyp(conv)

            If conv = GetTyp("string") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & ").ReturnType" & vbCrLf


            ElseIf conv = GetTyp("integer") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

            ElseIf conv = GetTyp("double") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

            ElseIf conv = GetTyp("boolean") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

            ElseIf conv = GetTyp("char") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

            ElseIf conv = GetTyp("decimal") Then

                LoadVal("""" & RemExt(num) & """")

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & ").ReturnType" & vbCrLf


            ElseIf conv = GetTyp("long") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

            ElseIf conv = GetTyp("sbyte") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & ").ReturnType" & vbCrLf


            ElseIf conv = GetTyp("short") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

            ElseIf conv = GetTyp("single") Then

                LoadVal(num)

                typind = typind + 1
                Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

            ElseIf conv = GetTyp("object") Then

                LoadVal(num)

                'typind = typind + 1
                'Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                'Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & "))" & vbCrLf
                'Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & ").ReturnType" & vbCrLf


                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Box," & "Typ" & ")" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("object")) & vbCrLf


            End If

        ElseIf expr Like "#*.#*" Or expr Like "-#*.#*" Or expr Like "+#*.#*" Then

            If expr Like "*f" Then
                expr = expr.TrimEnd(New Char() {"f"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_R4, CSng(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("single")) & vbCrLf
            ElseIf expr Like "*d" Then
                expr = expr.TrimEnd(New Char() {"d"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_R8, CDbl(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("double")) & vbCrLf
            Else
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_R8, CDbl(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("double")) & vbCrLf
            End If

        ElseIf expr Like "#*" Or expr Like "-#*" Or expr Like "+#*" Then

            If expr Like "*b" Then
                expr = expr.TrimEnd(New Char() {"b"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_I4_S, CSByte(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("sbyte")) & vbCrLf
            ElseIf expr Like "*s" Then
                expr = expr.TrimEnd(New Char() {"s"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_I4, CInt(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("short")) & vbCrLf
            ElseIf expr Like "*i" Then
                expr = expr.TrimEnd(New Char() {"i"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_I4, CInt(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("integer")) & vbCrLf
            ElseIf expr Like "*l" Then
                expr = expr.TrimEnd(New Char() {"l"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_I8, CLng(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("long")) & vbCrLf
            ElseIf expr Like "*f" Then
                expr = expr.TrimEnd(New Char() {"f"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_R4, CSng(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("single")) & vbCrLf
            ElseIf expr Like "*d" Then
                expr = expr.TrimEnd(New Char() {"d"c})
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_R8, CDbl(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("double")) & vbCrLf
            Else
                Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldc_I4, CInt(" & expr & "))" & vbCrLf
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("integer")) & vbCrLf
            End If

        ElseIf expr Like "[a-z]*" Or expr Like "[A-Z]*" Or expr Like "ref|[a-z]*" Or expr Like "ref|[A-Z]*" Or expr Like "$*$[a-z]*" Or expr Like "$*$[A-Z]*" Or expr Like "{*}[a-z]*" Or expr Like "{*}[A-Z]*" Or expr Like "$*${*}[a-z]*" Or expr Like "$*${*}[A-Z]*" Then

            Dim conv As String = ""
            Dim co As Boolean = False

            If expr Like "$*$*" Then

                co = True

                Dim split() As String = StringParser(expr, "$")
                conv = split(0)
                expr = split(1)

                conv = GetTyp(conv)

            End If

            If expr Like "ref|*" Then
                Dim a() As String = StringParser(expr, "|")
                expr = a(1)
                refmode = True
            End If


            Dim vn As String = expr
            Dim arrindex As String = ""
            Dim isarr As String = "no"

            Dim attach As Boolean = False
            Dim buffer As String = ""

            If vn Like "*[[]*]*" Then
                Dim split() As String = StringParser2ds(vn, "[", "]")
                attach = True
                vn = split(0)
                buffer = split(1)
            End If

            Dim fldsearch As XElement = <Root>
                                            <%= From el In tables.fields.<Field>.<Name> _
                                                Where el.Value = vn _
                                                Select el.Value %>
                                        </Root>

            If attach = True Then
                vn = vn & "[" & buffer & "]"
            End If

            If fldsearch.Value <> "" Or vn Like "*::*" Then
                LdFld(vn)
                GoTo finito
            End If

            If vn Like "*[[]*]*" Then
                isarr = "yes"
                Dim split() As String = StringParser2ds(vn, "[", "]")
                vn = split(0)
                arrindex = split(1)
            End If

            Dim varsearch As XElement = <Root>
                                            <%= From el In tables.vars.<Var>.<Name> _
                                                Where el.Value = vn _
                                                Select el.Attribute("id").Value %>
                                        </Root>
            Dim id = varsearch.Value

            Dim index As XElement = <Root>
                                        <%= From el In tables.vars.<Var>.<Index> _
                                            Where el.Attribute("id") = id _
                                            Select el.Value %>
                                    </Root>

            Dim vartyp As XElement = <Root>
                                         <%= From el In tables.vars.<Var>.<Type> _
                                             Where el.Attribute("id") = id _
                                             Select el.Value %>
                                     </Root>

            Dim locarg As XElement = <Root>
                                         <%= From el In tables.vars.<Var>.<Place> _
                                             Where el.Attribute("id") = id _
                                             Select el.Value %>
                                     </Root>

            Dim array As XElement = <Root>
                                        <%= From el In tables.vars.<Var>.<Array> _
                                            Where el.Attribute("id") = id _
                                            Select el.Value %>
                                    </Root>

            If isarr = "yes" Then
                If locarg.Value = "loc" Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldloc, " & index.Value & ")" & vbCrLf
                ElseIf locarg.Value = "arg" Then
                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarg, " & index.Value & ")" & vbCrLf
                End If
            Else
                If refmode = False Then
                    If locarg.Value = "loc" Then
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldloc, " & index.Value & ")" & vbCrLf
                    ElseIf locarg.Value = "arg" Then
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarg, " & index.Value & ")" & vbCrLf
                    End If
                Else
                    If locarg.Value = "loc" Then
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldloca, " & index.Value & ")" & vbCrLf
                    ElseIf locarg.Value = "arg" Then
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldarga, " & index.Value & ")" & vbCrLf
                    End If
                End If
            End If

            'If isarr = "no" And array.Value = "yes" Then
            '    vartyp.Value = vartyp.Value & "[]"
            'End If

            If refmode = False Then
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(vartyp.Value) & vbCrLf
            Else
                Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(vartyp.Value) & ".MakeByRefType()" & vbCrLf
            End If

            If isarr = "yes" Then
                If arrindex <> "l" Then
                    Gen.rtb.Text = Gen.rtb.Text & "Typ02 = Typ" & vbCrLf
                    LoadVal(arrindex)
                    Gen.EmitConvU()
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = Typ02" & vbCrLf
                    If refmode = False Then
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldelem, " & MakeGetType(vartyp.Value) & ".GetElementType())" & vbCrLf
                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(vartyp.Value) & ".GetElementType()" & vbCrLf
                    Else
                        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldelema, " & MakeGetType(vartyp.Value) & ".GetElementType())" & vbCrLf
                        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(vartyp.Value) & ".GetElementType().MakeByRefType()" & vbCrLf
                    End If
                ElseIf arrindex = "l" Then
                    Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.Emit(OpCodes.Ldlen)" & vbCrLf
                    Gen.EmitConvI4()
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = GetType(System.Int32)" & vbCrLf
                End If
            End If

finito:

            If co = True Then
                If conv = GetTyp("string") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToString" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("integer") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt32" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("double") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDouble" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("boolean") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToBoolean" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("char") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToChar" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("decimal") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToDecimal" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("long") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt64" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("sbyte") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSByte" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("short") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToInt16" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("single") Then

                    typind = typind + 1
                    Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {Typ}" & vbCrLf

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & "))" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Convert") & ".GetMethod(""" & "ToSingle" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

                ElseIf conv = GetTyp("object") Then

                    Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Box," & "Typ" & ")" & vbCrLf
                    Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType(tables.GetTyp("object")) & vbCrLf


                End If

            End If
            refmode = False

        End If

    End Sub

    ''' <summary>
    ''' Loads an array on the stack
    ''' </summary>
    ''' <param name="length">the length of the array</param>
    ''' <param name="type">the type of the elements</param>
    ''' <remarks></remarks>
    Sub LoadArr(ByVal length As String, ByVal type As String)

        LoadVal(length)
        Gen.EmitConvU()
        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Newarr, " & MakeGetType(type) & ")" & vbCrLf

    End Sub

    ''' <summary>
    ''' Emits a casting of the supplied value to the supplied class
    ''' </summary>
    ''' <param name="value">the value to cast</param>
    ''' <param name="type">the type to cast to</param>
    ''' <remarks></remarks>
    Sub DoCast(ByVal value As String, ByVal type As String)

        LoadVal(value)
        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Castclass, " & MakeGetType(type) & ")" & vbCrLf & _
        "Typ = " & MakeGetType(type) & vbCrLf

    End Sub

    ''' <summary>
    ''' Emits the sequence of opcodes to do a GetType
    ''' </summary>
    ''' <param name="type">the type</param>
    ''' <remarks></remarks>
    Sub DoGetType(ByVal type As String)
        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Ldtoken, " & MakeGetType(type) & ")" & vbCrLf

        typind = typind + 1
        Gen.rtb.Text = Gen.rtb.Text & "Dim typ" & typind & " As Type() = {GetType(System.RuntimeTypeHandle)}" & vbCrLf

        Gen.rtb.Text = Gen.rtb.Text & Gen.CurMet & "IL.Emit(OpCodes.Call, " & "" & MakeGetType("System.Type") & ".GetMethod(""" & "GetTypeFromHandle" & """, " & "typ" & typind & "))" & vbCrLf
        Gen.rtb.Text = Gen.rtb.Text & "Typ = " & MakeGetType("System.Type") & ".GetMethod(""" & "GetTypeFromHandle" & """, " & "typ" & typind & ").ReturnType" & vbCrLf

    End Sub

End Module
