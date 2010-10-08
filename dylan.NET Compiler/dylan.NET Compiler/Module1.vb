Imports System
Imports System.Windows.Forms
Imports System.Xml
Imports System.Xml.Linq

''' <summary>
''' The main module for the compiler.
''' </summary>
''' <remarks></remarks>
Module Module1

    ''' <summary>
    ''' Holds the source code
    ''' </summary>
    ''' <remarks></remarks>
    Public rtb As RichTextBox = New RichTextBox()

    ''' <summary>
    ''' Holds the source code's address
    ''' </summary>
    ''' <remarks></remarks>
    Public address As String = ""
    Public address2 As String = ""

    ''' <summary>
    '''Holds the current line number
    ''' </summary>
    ''' <remarks></remarks>
    Public lineno As Integer = 0
    Public linenos As Integer = 0
    Public Sec As Boolean = False

    Public docind As Integer = 1

    Public emitlineinfo As Boolean = False

    Public errorhappened As Boolean = False


    ''' <summary>
    ''' Begins the compilation process
    ''' </summary>
    ''' <remarks></remarks>
    Sub Main(ByVal args() As String)
        Console.WriteLine("dylan.NET Compiler for .NET 3.5 version: " & My.Application.Info.Version.ToString())

        If args.Length = 0 Then
            Console.WriteLine("Please write down the address to the source file.")
            address = Console.ReadLine()
        Else
            address = args(0)
        End If

        If My.Computer.FileSystem.FileExists(address) = True Then

            rtb.LoadFile(address, RichTextBoxStreamType.PlainText)

            Try
                ProcessProg()
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try

        Else
            Console.WriteLine("The address given leads to a non-existent file! At: " & address)
            errorhappened = True

        End If

        If args.Length = 0 Or errorhappened = True Then
            If errorhappened = True Then
                Console.WriteLine("Errors were found in your source code. Use the dylan.NET documentation in conjunction with the error output to solve your errors")
            End If
            Console.ReadKey()
        End If

    End Sub

    Function WriteErrInfo(ByVal msg As String) As String
        If Sec = True Then
            Return msg & " at Source File:" & address2 & " in Line:" & CStr(linenos)
        Else
            Return msg & " at Source File:" & address & " in Line:" & CStr(lineno)
        End If
    End Function

    ''' <summary>
    ''' Process the code by handing line by line to the parser, then compiles the code
    ''' </summary>
    ''' <remarks></remarks>
    Sub ProcessProg()
        Dim proglines As String() = rtb.Text.Split(New [Char]() {vbLf})

        Gen.Begin()

        Dim s As String
        For Each s In proglines
            s = s.Trim()
            Dim line As String = s
            'If line <> "" Then
            '    Dim arr() As String = Parser.StringParser(line, " ")
            'End If
            lineno = lineno + 1

            If debug = True Then
                If emitlineinfo = True Then
                    If line <> "" And line Like "//*" = False Then
                        Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.MarkSequencePoint(doc, " & lineno & ", 1, " & lineno & ", 100)" & vbCrLf
                    End If
                End If
            End If

            Parser.ProcessLine(line)

        Next

        Gen.EndAsm()

        Console.WriteLine("Source Files has been Parsed")

        xmldoc.Add(xmlmembers)

        Gen.Save()
        Gen.SaveDoc()

        If mkasm = True Then
            If errorhappened = False Then
                Console.WriteLine("Target Assembly has been Made Successfully")
            End If
        Else
            Console.WriteLine("Target Assembly has NOT been Made  As Requested")
        End If
    End Sub

    Sub ProcessSecFile(ByVal srcaddress As String)
        Sec = True
        Try
            linenos = 0
            Dim rtbs As RichTextBox = New RichTextBox()

            If My.Computer.FileSystem.FileExists(srcaddress) = True Then
                rtbs.LoadFile(srcaddress, RichTextBoxStreamType.PlainText)

                address2 = srcaddress

                Dim proglines As String() = rtbs.Text.Split(New [Char]() {vbLf})

                docind = docind + 1

                If debug = True Then
                    Gen.rtb.Text = Gen.rtb.Text & vbCrLf & "Dim doc" & docind & " As ISymbolDocumentWriter" & vbCrLf & vbCrLf
                    Gen.rtbutil.Text = Gen.rtbutil.Text & "doc" & docind & " = mdl.DefineDocument(""" & srcaddress & """, Guid.Empty, Guid.Empty, Guid.Empty)" & vbCrLf
                End If

                Dim s As String
                For Each s In proglines
                    s = s.Trim()
                    Dim line As String = s
                    'If line <> "" Then
                    '    Dim arr() As String = Parser.StringParser(line, " ")
                    'End If
                    linenos = linenos + 1

                    If debug = True Then
                        If emitlineinfo = True Then
                            If line <> "" And line Like "//*" = False Then
                                Gen.rtb.Text = Gen.rtb.Text & CurMet & "IL.MarkSequencePoint(doc" & docind & ", " & linenos & ", 1, " & linenos & ", 100)" & vbCrLf
                            End If
                        End If
                    End If

                    Parser.ProcessLine(line)

                Next

            Else
                Console.WriteLine("The given address leads to a non-existent file! At: " & srcaddress)
                errorhappened = True

            End If

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Sec = False

    End Sub

End Module
