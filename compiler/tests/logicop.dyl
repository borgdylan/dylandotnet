#refasm "/usr/lib/mono/2.0/mscorlib.dll"

import System

#debug on

assembly logicop exe
ver 1.2.0.0

class public auto ansi Module1

method public static void main()

var b1 as boolean = true
var b2 as boolean = false

var b3 as boolean = b1 and b2 xor b2

var num as integer = 2 * 5 + 3

Console::WriteLine($string$b3)
Console::WriteLine($string$num)

var t as boolean = ( ( true and false or true ) and ( true and false ) xor ( true or false ) ) or ( true and false )
Console::WriteLine($string$t)

t = ( ( true and false ) nor ( false or true ) ) nor ( ( true and false ) nor ( false or true ) )
Console::WriteLine($string$t)
t = ( ( true nand false ) nor ( false or true ) ) nand ( ( true nand false ) nor ( false or true ) )
Console::WriteLine($string$t)

var x as integer =  ( ( ( 1 + 4 / 2 ) - ( 6 / 3 - 1 ) * ( 2 + 3 ) ) + 1 ) * ( 4 - 1 )
Console::WriteLine(x)

Console::ReadKey()


end method

end class
