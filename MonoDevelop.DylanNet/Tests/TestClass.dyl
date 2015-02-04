namespace Tests

	[class: TestFixture()]
	class public auto ansi TestClass
		
		[method: Test()]
		method public void Test()
			Assert::IsTrue(true)
		end method

		[method: Test()]
		//[method: Ignore()]
		method public void Test2()
			Assert::AreEqual(5, 1 + 4)
		end method

	end class
	
end namespace
