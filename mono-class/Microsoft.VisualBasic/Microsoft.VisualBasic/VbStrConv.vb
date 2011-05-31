'
' VbStrConv.vb
'
' Authors:
'   Martin Adoue (martin@cwanet.com)
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

Imports System

Namespace Microsoft.VisualBasic
    '/ <summary>
    '/ When you call the StrConv function, you can use the following enumeration 
    '/ members in your code in place of the actual values.
    '/ </summary>
    <System.Flags()> _
    Public Enum VbStrConv As Integer
        '
        '/ <summary>
        '/ Performs no conversion 
        '/ </summary>
        None = 0
        '
        '/ <summary>
        '/ Uses linguistic rules for casing, rather than File System (default). 
        '/ Valid with UpperCase and LowerCase only. 
        '/ </summary>
        LinguisticCasing = 1024
        '
        '/ <summary>
        '/ Converts the string to uppercase characters. 
        '/ </summary>
        Uppercase = 1
        '
        '/ <summary>
        '/ Converts the string to lowercase characters. 
        '/ </summary>
        Lowercase = 2
        '
        '/ <summary>
        '/ Converts the first letter of every word in string to uppercase.
        '/ </summary>
        ProperCase = 3
        '
        '/ <summary>
        '/ Converts narrow (half-width) characters in the string to wide (full-width) characters. (Applies to Asian locales.)
        '/ </summary>
        Wide = 4
        '  
        '/ <summary>
        '/ Converts wide (full-width) characters in the string to narrow (half-width) characters. (Applies to Asian locales.)
        '/ </summary>
        Narrow = 8
        '  
        '/ <summary>
        '/ Converts Hiragana characters in the string to Katakana characters. (Applies to Japan only.)
        '/ </summary>
        Katakana = 16
        '
        '/ <summary>
        '/ Converts Katakana characters in the string to Hiragana characters. (Applies to Japan only.)
        '/ </summary>
        Hiragana = 32
        '
        '/ <summary>
        '/ Converts Traditional Chinese characters to Simplified Chinese. (Applies to Asian locales.)
        '/ </summary>
        SimplifiedChinese = 256
        '
        '/ <summary>
        '/ Converts Simplified Chinese characters to Traditional Chinese. (Applies to Asian locales.)
        '/ </summary>
        TraditionalChinese = 512
        '  
        ' Applies to Asian locales.
        ' Applies to Japan only.
        '  
    End Enum

End Namespace
