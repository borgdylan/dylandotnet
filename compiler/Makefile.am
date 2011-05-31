EXTRA_DIST = *.txt
CLEANFILES = 

#tokenizer.AST.txt tokenizer.Lexer.txt tokenizer.Parser.txt tokenizer.CodeGen.txt dnc.txt

dylandotnet:
	mono ./dnc.exe tokenizer.AST.txt
	mono ./dnc.exe tokenizer.Lexer.txt
	mono ./dnc.exe tokenizer.Parser.txt
	mono ./dnc.exe tokenizer.CodeGen.txt
	mono ./dnc.exe dnc.txt

all: dylandotnet
