#! /bin/sh

ilasm /dll ./IL/dnu.il
mv ./IL/dnu.dll ./4.0/dnu.dll 
ilasm /dll ./IL/tokenizer.AST.il
mv ./IL/tokenizer.AST.dll ./4.0/tokenizer.AST.dll
ilasm /dll ./IL/tokenizer.Lexer.il
mv ./IL/tokenizer.Lexer.dll ./4.0/tokenizer.Lexer.dll
ilasm /dll ./IL/tokenizer.Parser.il
mv ./IL/tokenizer.Parser.dll ./4.0/tokenizer.Parser.dll 
ilasm /dll ./IL/dnr.il
mv ./IL/dnr.dll ./4.0/dnr.dll 
ilasm /dll ./IL/tokenizer.CodeGen.il
mv ./IL/tokenizer.CodeGen.dll ./4.0/tokenizer.CodeGen.dll 
ilasm /exe ./IL/dnc.il
mv ./IL/dnc.exe ./4.0/dnc.exe 
