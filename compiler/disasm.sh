#! /bin/sh

monodis ./2.0/dnu.dll > ./IL/dnu.il
monodis ./2.0/tokenizer.AST.dll > ./IL/tokenizer.AST.il
monodis ./2.0/tokenizer.Lexer.dll > ./IL/tokenizer.Lexer.il
monodis ./2.0/tokenizer.Parser.dll > ./IL/tokenizer.Parser.il
monodis ./2.0/dnr.dll > ./IL/dnr.il
monodis ./2.0/tokenizer.CodeGen.dll > ./IL/tokenizer.CodeGen.il
monodis ./2.0/dnc.exe > ./IL/dnc.il
