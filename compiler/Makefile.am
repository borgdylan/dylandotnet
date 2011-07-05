EXTRA_DIST = *.dyl /ast/*.dyl /lexer/*.dyl /parser/*.dyl /codegen/*.dyl
CLEANFILES = 

#tokenizer.AST.txt tokenizer.Lexer.txt tokenizer.Parser.txt tokenizer.CodeGen.txt dnc.txt

dylandotnet:
	mono ./dnc.exe tokenizer.AST.dyl
	mono ./dnc.exe tokenizer.Lexer.dyl
	mono ./dnc.exe tokenizer.Parser.dyl
	mono ./dnc.exe tokenizer.CodeGen.dyl
	mono ./dnc.exe dnc.dyl

all: dylandotnet
