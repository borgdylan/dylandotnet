#refstdasm "mscorlib.dll"
#refstdasm "System.Xml.dll"
#refasm "4.0/dnc.exe"
//#refasm "dnr.dll"
//#refasm "tests/protectedtests.exe"
//#refasm "tokenizer.Lexer.dll"
//#refasm "tokenizer.CodeGen.dll"
//#refasm "tokenizer.Parser.dll"
//#refasm "tokenizer.AST.dll"

import System
import System.IO
import System.Xml
import System.Reflection.Emit
import System.Xml.Serialization
import System.Reflection
import System.Threading.Tasks
import dylan.NET
import dylan.NET.Reflection
import dylan.NET.Compiler
import dylan.NET.Tokenizer.Lexer
import dylan.NET.Tokenizer.Parser
import dylan.NET.Tokenizer.CodeGen
import dylan.NET.Tokenizer.AST.Tokens
import dylan.NET.Tokenizer.AST.Tokens.TypeToks
import dylan.NET.Tokenizer.AST.Stmts
import dylan.NET.Tokenizer.AST.Exprs
import protectedtests

#debug on

assembly test exe
ver 1.3.0.0

class public auto ansi Program

	method public static void main()
		Environment::set_CurrentDirectory("/var/www/Code/dylannet/dylandotnet/compiler/templateproj")
		var arr as string[] = new string[] {"template.dyl"}
		Compiler.Program::Invoke(arr)
		//var t as Task = Program::InvokeAsync(arr)
		//Console::ReadLine()
		//Console::WriteLine($object$t::get_Status())
		//t::Wait()
		//var ln as Line = new Line()
		//var st as Stmt = ln::Analyze(new Stmt(),"x = Array::BinarySearch(new integer[2],12)")
		//var exp as Expr = new Expr()
		//exp::Tokens = st::Tokens
		//var eopt as ExprOptimizer = new ExprOptimizer()
		//var sto as StmtOptimizer = new StmtOptimizer()
		//st = sto::Optimize(st)
		//var to as TokenOptimizer = new TokenOptimizer()
		//exp::Tokens[0] = to::Optimize(exp::Tokens[0],exp::Tokens[1])
		//exp::Tokens[1] = to::Optimize(exp::Tokens[1],exp::Tokens[2])
		//exp::Tokens[2] = to::Optimize(exp::Tokens[2],exp::Tokens[3])
		//exp::Tokens[3] = to::Optimize(exp::Tokens[3],exp::Tokens[4])
		//exp::Tokens[4] = to::Optimize(exp::Tokens[4],exp::Tokens[5])
		//exp::Tokens[5] = to::Optimize(exp::Tokens[5],exp::Tokens[6])
		//exp::Tokens[6] = to::Optimize(exp::Tokens[6],exp::Tokens[7])
		//exp::Tokens[7] = to::Optimize(exp::Tokens[7],exp::Tokens[8])
		//exp::Tokens[8] = to::Optimize(exp::Tokens[8],$Token$null)
		//exp = eopt::procType(exp,0)
		//Importer::AddAsm(Assembly::LoadFile("/usr/lib/mono/2.0/mscorlib.dll"))
		//Importer::AddAsm(Assembly::LoadFile("/usr/lib/mono/2.0/System.Xml.Linq.dll"))
		//Importer::AddImp("System")
		//Importer::AddImp("System.Xml.Linq")
		//Importer::AddImp("System.Collections.Generic")
		//var t as Type = Helpers::CommitEvalTTok($TypeTok$exp::Tokens[0])
		//var tl as TypeList = SymTable::TypeLst
		//var fil as Type = tl::GetType("FILambdas")
		//var ta as Type[] = new Type[1]
		//ta[0] = tl::GetType("FieldItem")
		//var mi as MethodInfo = tl::GetMethod(fil,"DetermineIfCandidate", ta)
	end method

end class
