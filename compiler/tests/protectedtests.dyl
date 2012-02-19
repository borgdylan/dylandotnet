//accessors tests
//compile with dylan.NET v. 11.2.8.5 or later

#refstdasm "mscorlib.dll"

import System
import protectedtests

#debug on

assembly protectedtests exe
ver 1.2.0.0

class public auto ansi sealed SealedClass
end class

class private auto ansi InternalClass
end class

class public auto ansi ProtectedTest

	field family integer ProtFld
	field assembly integer AssemFld
	field famorassem integer FamORAssemFld
	field famandassem integer FamANDAssemFld
	field private integer PrivFld
	
	method public void ProtectedTest()
		ProtFld = 0
		PrivFld = 0
	end method
	
	method family void ProtectedTest(var i as integer)
		ProtFld = i
		PrivFld = i
	end method
	
	method assembly void ProtectedTest(var i as long)
		ProtFld = $integer$i
		PrivFld = $integer$i
	end method
	
	method family void ProtMtd()
		var ic as InternalClass
		//var ah as AppDomainHandle
	end method
	
	method private void PrivMtd()
	end method

	method final void FinalMtd()
	end method
	
	method assembly void AssemMtd()
	end method
	
	method famorassem void FamORAssemMtd()
	end method
	
	method famandassem void FamANDAssemMtd()
	end method
	
	method public void RunProtMtd()
		ProtMtd()
	end method
	
	method public integer GetProtFld()
		return ProtFld
	end method

end class

class public auto ansi NonInheritingClass

	method public void Test()
		var pt as ProtectedTest = new ProtectedTest()
		var pt2 as ProtectedTest = new ProtectedTest(10l)
		var i as integer = pt::GetProtFld()
		pt::RunProtMtd()
		pt::AssemMtd()
		pt::FamORAssemMtd()
		pt::AssemFld = 1
		pt::FamORAssemFld = 1
	end method

end class

class public auto ansi InheritingClass extends ProtectedTest
	
	method public void InheritingClass()
		me::ctor(10)
	end method
	
	method public void Test()
		var pt as InheritingClass = new InheritingClass()
		var i as integer = ProtFld
		i = pt::ProtFld
		ProtMtd()
		pt::ProtMtd()
		AssemMtd()
		FamORAssemMtd()
		FamANDAssemMtd()
		pt::AssemFld = 1
		pt::FamORAssemFld = 1
		pt::FamANDAssemFld = 1
	end method

end class
