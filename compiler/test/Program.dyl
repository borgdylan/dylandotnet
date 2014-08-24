namespace test

	class public auto ansi Program
		
		method private static void print(var c as IStmtContainer, var lvl as integer)
			Console::WriteLine(new string(c'\t', lvl) + #expr($object$c)::GetType()::get_Name() + #ternary{c is BranchStmt ? "*", string::Empty})
			foreach s in c::get_Children()
				if s is IStmtContainer then
					print($IStmtContainer$s, ++lvl)
				else
					Console::WriteLine(new string(c'\t', ++lvl) + s::GetType()::get_Name())	
				end if
			end for
			if c is IBranchContainer then
				foreach b in #expr($IBranchContainer$c)::get_BranchChildren()
					print(b, ++lvl)
				end for
			end if
		end method

		method public static void main(var args as string[])
			StreamUtils::TerminateOnError = false
			var lx = new Lexer()
			var ps = new Parser()
			var ss = ps::Parse(lx::AnalyzeStream(Resources::get_Code()))
			print(ss, 0)
		end method
		
	end class
	
end namespace
