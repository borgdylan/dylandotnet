Module Math

    Public stack(-1) As String

    Function RPNPreProc(ByVal symbols() As String) As String

        Dim len As Integer = symbols.Length - 1
        Dim outstr As String = ""

        Dim i As Integer = -1
        Dim infunc As Boolean = False

        Do Until i = len

            i = i + 1

            Dim s As String = symbols(i)

            If s Like "*(*" And s <> "(" Then
                If s Like "*(*)" Or s Like "*(*)*" Then

                Else

                    infunc = True

                End If
            End If

            If infunc = True Then
                If s Like "*)" And s <> ")" Then
                    infunc = False
                End If
            End If

            If infunc = False Then
                outstr = outstr & s & " "
            Else
                outstr = outstr & s
            End If
        Loop

        outstr = outstr.Trim()

        Return outstr

    End Function

    Function ConvToRPN(ByVal symbols() As String) As String

        Dim rpnstr As String = ""

        ReDim Preserve stack(-1)

        For Each s As String In symbols

            If s <> "+" And s <> "-" And s <> "*" And s <> "/" And s <> "%" And s <> "(" And s <> ")" Then

                rpnstr = rpnstr & s & " "

            ElseIf s = "+" Or s = "-" Or s = "*" Or s = "/" Or s = "%" Then

                If stack.Length <> 0 Then

                    If RetPrec(s) <= RetPrec(stack(UBound(stack))) Then

                        rpnstr = rpnstr & stack(UBound(stack)) & " "
                        SubStack()

                    End If

                End If

                AddStack(s)

            ElseIf s = "(" Then

                AddStack(s)

            ElseIf s = ")" Then

                If stack.Length <> 0 Then

                    If stack(UBound(stack)) <> "(" Then

                        rpnstr = rpnstr & stack(UBound(stack)) & " "
                        SubStack()

                        If stack.Length <> 0 Then
                            If stack(UBound(stack)) = "(" Then

                                SubStack()
                            End If
                        End If

                    ElseIf stack(UBound(stack)) = "(" Then

                        SubStack()

                    End If

                End If

                End If

        Next

        Do Until stack.Length = 0

            If stack(UBound(stack)) <> "(" Then
                rpnstr = rpnstr & stack(UBound(stack)) & " "
            End If

            SubStack()

        Loop

        ReDim Preserve stack(-1)

        Return rpnstr

    End Function

    Function ConvToRPNLogic(ByVal symbols() As String) As String

        Dim rpnstr As String = ""

        ReDim Preserve stack(-1)

        For Each s As String In symbols

            If s <> "and" And s <> "or" And s <> "nand" And s <> "nor" And s <> "xor" And s <> "(" And s <> ")" Then

                rpnstr = rpnstr & s & " "

            ElseIf s = "and" Or s = "or" Or s = "nand" Or s = "nor" Or s = "xor" Then

                If stack.Length <> 0 Then

                    If RetPrec(s) <= RetPrec(stack(UBound(stack))) Then

                        rpnstr = rpnstr & stack(UBound(stack)) & " "
                        SubStack()

                    End If

                End If

                AddStack(s)

            ElseIf s = "(" Then

                AddStack(s)

            ElseIf s = ")" Then

                If stack.Length <> 0 Then

                    If stack(UBound(stack)) <> "(" Then

                        rpnstr = rpnstr & stack(UBound(stack)) & " "
                        SubStack()

                        If stack.Length <> 0 Then
                            If stack(UBound(stack)) = "(" Then

                                SubStack()
                            End If
                        End If


                    ElseIf stack(UBound(stack)) = "(" Then

                        SubStack()

                    End If

                End If

            End If

        Next

        Do Until stack.Length = 0

            If stack(UBound(stack)) <> "(" Then
                rpnstr = rpnstr & stack(UBound(stack)) & " "
            End If

            SubStack()

        Loop

        ReDim Preserve stack(-1)

        Return rpnstr

    End Function

    Function RetPrec(ByVal chr As String) As Integer

        If chr = "(" Then
            Return -1
        ElseIf chr = "*" Or chr = "/" Or chr = "%" Or chr = "and" Or chr = "nand" Then
            Return 8
        ElseIf chr = "xor" Then
            Return 7
        ElseIf chr = "+" Or chr = "-" Or chr = "or" Or chr = "nor" Then
            Return 6
        ElseIf chr = ")" Then
            Return 0
        Else
            Return 0
        End If

    End Function

    Sub AddStack(ByVal str As String)

        ReDim Preserve stack(UBound(stack) + 1)
        stack(UBound(stack)) = str

    End Sub

    Sub SubStack()

        ReDim Preserve stack(UBound(stack) - 1)

    End Sub

    Function RemExt(ByVal expr As String) As String
        If expr Like "*b" Then
            expr = expr.TrimEnd(New Char() {"b"c})
        ElseIf expr Like "*s" Then
            expr = expr.TrimEnd(New Char() {"s"c})
        ElseIf expr Like "*i" Then
            expr = expr.TrimEnd(New Char() {"i"c})
        ElseIf expr Like "*l" Then
            expr = expr.TrimEnd(New Char() {"l"c})
        ElseIf expr Like "*f" Then
            expr = expr.TrimEnd(New Char() {"f"c})
        ElseIf expr Like "*d" Then
            expr = expr.TrimEnd(New Char() {"d"c})
        Else

        End If

        Return expr
    End Function

End Module
