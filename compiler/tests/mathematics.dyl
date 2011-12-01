#refasm "/usr/lib/mono/2.0/mscorlib.dll"

import System
#debug on

assembly mathematics dll
ver 1.2.0.0

//class Algebra
class public auto ansi Algebra

// To achieve (-b +or- sqrt((b * b) - (4 * a * c))) / (2 * a)
method public double SolveTrinomialPos(var a as double, var b as double, var c as double)
return ( ( -1d * b ) + Math::Sqrt(( b * b ) - ( 4d * a * c )) ) / ( 2d * a )
end method

method public double SolveTrinomialNeg(var a as double, var b as double, var c as double)
return ( ( -1d * b ) - Math::Sqrt(( b * b ) - ( 4d * a * c )) ) / ( 2d * a )
end method

method public string ExpandTrinomial(var x1 as integer, var x2 as integer, var Num1 as integer, var Num2 as integer, var Sign1 as string, var Sign2 as string)

if Sign1 = "+" then
Num1 = Num1 * 1
end if

if Sign1 = "-" then
Num1 = Num1 * -1
end if

if Sign2 = "+" then
Num2 = Num2 * 1
end if

if Sign2 = "-" then
Num2 = Num2 * -1
end if

var xsqr as integer = x1 * x2
var cons as integer = Num1 * Num2
var midp1 as integer = x1 * Num2
var midp2 as integer = x2 * Num1
var mid as integer = midp1 + midp2
var op1 as string
var op2 as string

if mid > 0 then
op1 = "+"
else
op1 = ""
end if

if cons > 0 then
op2 = "+"
else
op2 = ""
end if

var str as string = ""

return $string$xsqr + "x2" + $string$op1 + $string$mid "x" + $string$op2 + $string$cons

end method

end class

//class Arithmetic
class public auto ansi Arithmetic

method public double Add(var Num1 as double, var Num2 as double)
return Num1 + Num2
end method

method public double Subtract(var Num1 as double, var Num2 as double)
return Num1 - Num2
end method

method public double Multiply(var Num1 as double, var Num2 as double)
return Num1 * Num2
end method

method public double Divide(var Num1 as double, var Num2 as double)
return Num1 / Num2
end method

end class
