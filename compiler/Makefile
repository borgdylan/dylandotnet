all: compile
	echo "Hello from the dylan.NET Makefile"

ast:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.AST.txt
lexer:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.Lexer.txt
parser:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.Parser.txt
codegen:
	dylan.NET_Compiler E:\Code\dylannet\compiler\tokenizer.CodeGen.txt
comp:
	dylan.NET_Compiler E:\Code\dylannet\compiler\dnc.txt
	
compile: ast lexer parser codegen comp