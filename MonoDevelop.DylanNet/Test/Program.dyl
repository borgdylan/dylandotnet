namespace Test

	class public auto ansi Program
		
		method public static integer F(var s as string)
			return s::GetHashCode()
		end method

		method public static void main(var args as string[])
			Console::WriteLine("Hello World!")
			args = new string[] {"a","b", "c", "Hello World!"}
			foreach i in Enumerable::Select<of string, integer>(args, new Func<of string, integer>(F()))
				Console::WriteLine(i)
			end for
		end method

	end class
	
end namespace
