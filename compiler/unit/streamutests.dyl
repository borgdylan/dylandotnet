//unit tests for StreamUtils
[class: TestFixture()]
class public auto ansi TestStreamUtils

	field private MemoryStream ms
	field private StreamWriter sw
	field private StreamReader sr

	[method: SetUp()]
	method public void SetupTests()
		StreamUtils::UseConsole = false
		ms = new MemoryStream()
		StreamUtils::InitInS(ms)
		StreamUtils::InitOutS(ms)
	end method

	[method: Test()]
	method public void TestWriteLine()
		StreamUtils::WriteLine("Test")
		ms::Seek(0l, SeekOrigin::Begin)
		sr = new StreamReader(ms)
		Assert::AreEqual("Test",sr::ReadLine())
	end method
	
	[method: Test()]
	method public void TestWrite()
		StreamUtils::Write("Test")
		ms::Seek(0l, SeekOrigin::Begin)
		sr = new StreamReader(ms)
		Assert::AreEqual("Test",sr::ReadLine())
	end method
	
	[method: Test()]
	method public void TestReadLine()
		sw = new StreamWriter(ms)
		sw::WriteLine("Test")
		sw::Flush()
		ms::Seek(0l, SeekOrigin::Begin)
		Assert::AreEqual("Test",StreamUtils::ReadLine())
	end method
	
	[method: Test()]
	method public void TestInitInS()
		StreamUtils::InitInS(new MemoryStream())
		Assert::IsFalse(ms::get_CanRead())
	end method
	
	[method: Test()]
	method public void TestInitOutS()
		StreamUtils::InitOutS(new MemoryStream())
		Assert::IsFalse(ms::get_CanWrite())
	end method
	
	[method: Test()]
	method public void TestCloseInS()
		StreamUtils::CloseInS()
		Assert::IsFalse(ms::get_CanRead())
	end method
	
	[method: Test()]
	method public void TestCloseOutS()
		StreamUtils::CloseOutS()
		Assert::IsFalse(ms::get_CanWrite())
	end method

	[method: TearDown()]
	method public void TeardownTests()
		StreamUtils::CloseInS()
		StreamUtils::CloseOutS()
		if sr != null then
			sr::Close()
		end if
		if sw != null then
			sw::Close()
		end if
		ms::Close()
		StreamUtils::UseConsole = true
	end method

end class
