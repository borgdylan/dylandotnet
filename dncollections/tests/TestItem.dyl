namespace tests

	[class: TestFixture()]
	class public auto ansi TestClass
		
		[method: Test()]
		method public void TestNew1()
			var i = new Item<of string>()
			Assert::AreEqual(i::Value, null)
		end method

		[method: Test()]
		method public void TestNew2()
			var i = new Item<of integer>()
			Assert::AreEqual(i::Value, 0)
		end method

		[method: Test()]
		method public void TestNew3()
			var i = new Item<of string>("hello")
			Assert::AreEqual(i::Value, "hello")
		end method

		[method: Test()]
		method public void TestNew4()
			var i = new Item<of integer>(11)
			Assert::AreEqual(i::Value, 11)
		end method
			
		[method: Test()]
		method public void TestTS1()
			var i = new Item<of string>("hello")
			Assert::AreEqual(i::ToString(), "-1:hello")
		end method

		[method: Test()]
		method public void TestTS2()
			var i = new Item<of integer>(11)
			Assert::AreEqual(i::ToString(), "-1:11")
		end method

		[method: Test()]
		method public void TestTS3()
			var i = new Item<of string>()
			Assert::AreEqual(i::ToString(), "-1:null")
		end method

		[method: Test()]
		method public void TestTS4()
			var i = new Item<of integer>()
			Assert::AreEqual(i::ToString(), "-1:0")
		end method

	end class
	
end namespace
