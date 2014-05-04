namespace tests

	[class: TestFixture()]
	class public auto ansi TestClass
		
		[method: Test()]
		method public void Test()
			Assert::IsTrue(false)
			var al as ALList<of integer>
		end method

	end class
	
end namespace
