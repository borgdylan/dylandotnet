all: compile
	echo "Hello from the dylan.NET Makefile"
	
ast:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.AST.dyl
lexer:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.Lexer.dyl
parser:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.Parser.dyl
codegen:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.CodeGen.dyl
comp:
	dylan.NET_Compiler E:\Code\dylannet\compiler\dnc.dyl
	
compile: ast lexer parser codegen comp