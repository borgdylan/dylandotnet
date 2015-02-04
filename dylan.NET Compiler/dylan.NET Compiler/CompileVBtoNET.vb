Imports Microsoft.VisualBasic
Imports System.CodeDom
Imports System.CodeDom.Compiler
Imports System.Windows.Forms
Imports System.Collections
Imports System.Collections.Generic


Module CompileVBtoNET

    Dim tb As New System.Windows.Forms.TextBox
    Dim rtb As New System.Windows.Forms.RichTextBox
    Public stdasm As Boolean = True
    Public refasm(-1) As String

    Sub Menu(ByVal path As String)
        Compile(path)
    End Sub

    Sub Compile(ByVal path As String)
        path = path.Trim()
        Dim names As String() = path.Split(New [Char]() {"."c})
        Dim output As String = ""
        Dim len As Integer = names.Length - 2
        Dim i As Integer = -1
        Do Until i = len
            i = i + 1
            output = output & names(i) & "."
        Loop

        output = output.Trim("."c)
        'Console.WriteLine("Please choose beween these output type and write their corresponding number")
        'Console.WriteLine("1. Executable")
        'Console.WriteLine("2. Class Library")
        'Dim c As String = Console.ReadLine()
        'If c = "1" Then
        'c = "exe"
        'ElseIf c = "2" Then
        'c = "dll"
        'End If
        Dim c As String = "exe"
        Build_VB(output, c, path)
        'Console.ReadKey()
    End Sub

    'VB compiler
    Sub Build_VB(ByVal Output As String, ByVal ExecLib As String, ByVal path As String)

        rtb.Text = My.Computer.FileSystem.ReadAllText(path)

        Console.WriteLine("Beginning Compilation to the .NET assembly...")
        Dim ProvOptions As IDictionary = New Dictionary(Of String, String)
        ProvOptions.Add("CompilerVersion", "v3.5")
        Dim codeProvider As New VBCodeProvider(ProvOptions)
        ' Dim icc As ICodeCompiler = codeProvider.CreateCompiler

        tb.Text = ""
        Dim parameters As New CompilerParameters()
        Dim results As CompilerResults

        If ExecLib = "exe" Then
            parameters.GenerateExecutable = True
            Output = Output & ".exe"
        ElseIf ExecLib = "dll" Then
            parameters.GenerateExecutable = False
            Output = Output & ".dll"
        End If

        parameters.OutputAssembly = Output

        parameters.ReferencedAssemblies.Add("mscorlib.dll")
        parameters.ReferencedAssemblies.Add("System.Drawing.dll")

        If stdasm = True Then
            parameters.ReferencedAssemblies.Add("System.dll")
            Dim target As String = "v3.5"
            If target = "v3.5" Then
                parameters.ReferencedAssemblies.Add("System.Core.dll")
                parameters.ReferencedAssemblies.Add("System.Xml.Linq.dll")
               End If
            parameters.ReferencedAssemblies.Add("System.Data.dll")
            parameters.ReferencedAssemblies.Add("System.Xml.dll")
            parameters.ReferencedAssemblies.Add("Microsoft.VisualBasic.dll")
        End If

        For Each s As String In refasm
            If s = "mscorlib.dll" Then
            ElseIf s = "System.Drawing.dll" Then
            ElseIf s = "System.dll" Then
                If stdasm = False Then
                    parameters.ReferencedAssemblies.Add(s)
                End If
            ElseIf s = "System.Core.dll" Then
                If stdasm = False Then
                    parameters.ReferencedAssemblies.Add(s)
                End If
            ElseIf s = "System.Xml.Linq.dll" Then
                If stdasm = False Then
                    parameters.ReferencedAssemblies.Add(s)
                End If
            ElseIf s = "System.Data.dll" Then
                If stdasm = False Then
                    parameters.ReferencedAssemblies.Add(s)
                End If
            ElseIf s = "System.Xml.dll" Then
                If stdasm = False Then
                    parameters.ReferencedAssemblies.Add(s)
                End If
            ElseIf s = "Microsoft.VisualBasic.dll" Then
                If stdasm = False Then
                    parameters.ReferencedAssemblies.Add(s)
                End If
            Else
                parameters.ReferencedAssemblies.Add(s)
            End If
        Next

        results = codeProvider.CompileAssemblyFromSource(parameters, rtb.Text)

        If results.Errors.Count > 0 Then
            'There were compiler errors
            Dim CompErr As CompilerError
            For Each CompErr In results.Errors
                tb.Text = tb.Text & _
                "Line number " & CompErr.Line & _
                ", Error Number: " & CompErr.ErrorNumber & _
                ", '" & CompErr.ErrorText & ";" & _
                Environment.NewLine & Environment.NewLine
            Next
        Else
            'Successful Compile
            tb.Text = "Success"
        End If
        Console.WriteLine(tb.Text)
    End Sub

End Module
