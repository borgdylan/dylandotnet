//Vector Structure
//use dylan.NET v. 11.2.9.2 or higher to compile this

#refstdasm "mscorlib.dll"

import System
import System.Collections.Generic

#debug on

assembly vector dll
ver 1.3.0.0

class public auto ansi Vector extends ValueType implements IEquatable<of Vector>, IComparable, IComparable<of Vector>, IComparer<of Vector>

	field public integer I
	field public integer J
	field public integer K
	field public static Vector Origin
	field public static Vector AllOnes
	field public static boolean Test
	
	method public void Vector(var i as integer, var j as integer, var k as integer)
		I = i
		J = j
		K = k
	end method

	method public static void Vector()
		Origin = new Vector(0,0,0)
		AllOnes = new Vector(1,1,1)
		Test = false
	end method
	
	method public void Vector(var o as object)
		var vectyp as Type = gettype Vector
		if (o != null) and vectyp::Equals(o::GetType()) then
			var v as Vector = $Vector$o
			I = v::I
			J = v::J
			K = v::K
		else
			I = 0
			J = 0
			K = 0
		end if
	end method

	//method public static void WriteStrS(var str as string)
		//Console::WriteLine(str)
	//end method

	//method public void WriteStrI(var str as string)
		//Console::WriteLine(str)
	//end method

	method public double Magnitude()
		return Math::Sqrt(Math::Pow($double$I,2d) + Math::Pow($double$J,2d) + Math::Pow($double$K,2d))
	end method
	
	method public virtual hidebysig string ToString()
		return $string$I + "i + " + $string$J + "j + " + $string$K + "k" 
	end method
	
	method public hidebysig virtual final newslot boolean Equals(var v as Vector)
		return (I == v::I) and (J == v::J) and (K == v::K) 
	end method

	method public hidebysig virtual final newslot integer CompareTo(var o as object)
		var vectyp as Type = gettype Vector
		if o = null then
			return 1
		elseif vectyp::Equals(o::GetType()) then
			var v as Vector = $Vector$o
			return Math::Sign(Magnitude() - v::Magnitude())
		else
			throw new ArgumentException("Passed Object is not a Vector!!")
		end if
	end method

	method public hidebysig virtual final newslot integer CompareTo(var v as Vector)
		return Math::Sign(Magnitude() - v::Magnitude())
	end method

	method public hidebysig virtual final newslot integer Compare(var v1 as Vector,var v2 as Vector)
		return Math::Sign(v1::Magnitude() - v2::Magnitude())
	end method
	
	method public hidebysig virtual boolean Equals(var o as object)
		var vectyp as Type = gettype Vector
		if (o != null) and vectyp::Equals(o::GetType()) then
			var v as Vector = $Vector$o
			return (I == v::I) and (J == v::J) and (K == v::K)
		else
			return false
		end if
	end method
	
	method public static Vector Add(var v1 as Vector, var v2 as Vector)
		return new Vector(v1::I + v2::I, v1::J + v2::J, v1::K + v2::K)
	end method
	
	method public static specialname boolean op_Equality(var v1 as Vector, var v2 as Vector)
		return v1::Equals(v2)
	end method
	
	method public static specialname boolean op_Equality(var v1 as Vector, var v2 as object)
		return v1::Equals(v2)
	end method
	
	method public static specialname boolean op_Inequality(var v1 as Vector, var v2 as Vector)
		var b as boolean = v1::Equals(v2)
		return b nand b
	end method
	
	method public static specialname boolean op_Inequality(var v1 as Vector, var v2 as object)
		var b as boolean = v1::Equals(v2)
		return b nand b
	end method
	
	method public static specialname Vector op_Addition(var v1 as Vector, var v2 as Vector)
		return Add(v1,v2)
	end method

	method public static Vector Subtract(var v1 as Vector, var v2 as Vector)
		return new Vector(v1::I - v2::I, v1::J - v2::J, v1::K - v2::K)
	end method
	
	method public static specialname Vector op_Subtraction(var v1 as Vector, var v2 as Vector)
		return Subtract(v1,v2)
	end method

	method public static integer Multiply(var v1 as Vector, var v2 as Vector)
		return (v1::I * v2::I) + (v1::J * v2::J) + (v1::K * v2::K)
	end method
	
	method public static specialname integer op_Multiply(var v1 as Vector, var v2 as Vector)
		return Multiply(v1, v2)
	end method
	
	method public static object ToObject(var v as Vector)
		return $object$v
	end method
	
	method public static specialname object op_Explicit(var v as Vector)
		return ToObject(v)
	end method
	
	method public static specialname Vector op_UnaryNegation(var v as Vector)
		return new Vector(v::I * -1, v::J * -1, v::K * -1)
	end method
	
	method public static specialname Vector op_Implicit(var o as object)
		return new Vector(o)
	end method

end class
