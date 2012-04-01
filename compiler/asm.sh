#! /bin/sh

ilasm /dll '/IL/tokenizer.Lexer.il'
mv '/IL/tokenizer.Lexer.dll' '/4.0/tokenizer.Lexer.dll'
ilasm /dll '/IL/tokenizer.Parser.il'
