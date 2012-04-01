#! /bin/sh

monodis ./2.0/tokenizer.Lexer.dll > ./IL/tokenizer.Lexer.il
monodis ./2.0/tokenizer.Parser.dll > ./IL/tokenizer.Parser.il
