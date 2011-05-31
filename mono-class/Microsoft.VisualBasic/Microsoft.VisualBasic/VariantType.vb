'
' VariantType.vb
'
' Author:
'   Chris J Breisch (cjbreisch@altavista.net)
'   Mizrahi Rafael (rafim@mainsoft.com)
'

'
' Copyright (C) 2002-2006 Mainsoft Corporation.
' Copyright (C) 2004-2006 Novell, Inc (http://www.novell.com)
'
' Permission is hereby granted, free of charge, to any person obtaining
' a copy of this software and associated documentation files (the
' "Software"), to deal in the Software without restriction, including
' without limitation the rights to use, copy, modify, merge, publish,
' distribute, sublicense, and/or sell copies of the Software, and to
' permit persons to whom the Software is furnished to do so, subject to
' the following conditions:
' 
' The above copyright notice and this permission notice shall be
' included in all copies or substantial portions of the Software.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
' EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
' MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
' NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
' LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
' OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
' WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'
Namespace Microsoft.VisualBasic
    Public Enum VariantType As Integer
        Array = 8192
        Empty = 0
        Null = 1
        [Short] = 2
        [Integer] = 3
        [Single] = 4
        [Double] = 5
        [Currency] = 6
        [Date] = 7
        [String] = 8
        [Object] = 9
        [Error] = 10
        [Boolean] = 11
        [Variant] = 12
        DataObject = 13
        [Decimal] = 14
        [Byte] = 17
        [Char] = 18
        [Long] = 20
        UserDefinedType = 36
        ' 		ObjectArray = 8201 - No documentation neither class status page says it is needed */
    End Enum

End Namespace

