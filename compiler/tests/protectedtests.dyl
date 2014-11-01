//accessors tests
//compile with dylan.NET v. 11.2.8.5 or later

#refstdasm "mscorlib.dll"

#debug on

assembly protectedtests exe
ver 1.2.0.0

class public sealed SealedClass
end class

class private InternalClass
end class

class public ProtectedTest

	field family integer ProtFld
	field assembly integer AssemFld
	field famorassem integer FamORAssemFld
	field famandassem integer FamANDAssemFld
	field private integer PrivFld
	
	method public void ProtectedTest()
		mybase::ctor()
		ProtFld = 0
		PrivFld = 0
	end method
	
	method family void ProtectedTest(var i as integer)
		mybase::ctor()
		ProtFld = i
		PrivFld = i
	end method
	
	method assembly void ProtectedTest(var i as long)
		mybase::ctor()
		ProtFld = $integer$i
		PrivFld = $integer$i
	end method
	
	method family void ProtMtd()
		//var ic as InternalClass
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

class public NonInheritingClass

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

class public InheritingClass extends ProtectedTest
	
	method public void InheritingClass()
		mybase::ctor(10)
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

class public Program

	method public static void main()

	end method

end class
