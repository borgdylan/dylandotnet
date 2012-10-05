.PHONY: all

all:
	'$(MDOC)' update --delete -o ast ../tokenizer.AST.dll
	'$(MDOC)' update --delete -o lexer ../tokenizer.Lexer.dll
	'$(MDOC)' update --delete -o parser ../tokenizer.Parser.dll
	'$(MDOC)' update --delete -o codegen ../tokenizer.CodeGen.dll
	'$(MDOC)' update --delete -o dnu ../dnu.dll
	'$(MDOC)' update --delete -o dnr ../dnr.dll
	'$(MDOC)' update --delete -o dnc ../dnc.exe
	
	'$(MDOC)' export-html -o ast-html ast
	'$(MDOC)' export-html -o lexer-html lexer
	'$(MDOC)' export-html -o parser-html parser
	'$(MDOC)' export-html -o codegen-html codegen
	'$(MDOC)' export-html -o dnu-html dnu
	'$(MDOC)' export-html -o dnr-html dnr
	'$(MDOC)' export-html -o dnc-html dnc
	
	'$(MDOC)' export-msxdoc -o tokenizer.AST.xml ast
	'$(MDOC)' export-msxdoc -o tokenizer.Lexer.xml lexer
	'$(MDOC)' export-msxdoc -o tokenizer.Parser.xml parser
	'$(MDOC)' export-msxdoc -o tokenizer.CodeGen.xml codegen
	'$(MDOC)' export-msxdoc -o dnu.xml dnu
	'$(MDOC)' export-msxdoc -o dnr.xml dnr
	'$(MDOC)' export-msxdoc -o dnc.xml dnc

install:	
	tar -czf ast.tar.gz ast-html
	$(install_sh_PROGRAM) ast.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/ast.tar.gz
	rm -f ast.tar.gz
	
	tar -czf lexer.tar.gz lexer-html
	$(install_sh_PROGRAM) lexer.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/lexer.tar.gz
	rm -f lexer.tar.gz
	
	tar -czf parser.tar.gz parser-html
	$(install_sh_PROGRAM) parser.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/parser.tar.gz
	rm -f parser.tar.gz
	
	tar -czf codegen.tar.gz codegen-html
	$(install_sh_PROGRAM) codegen.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/codegen.tar.gz
	rm -f codegen.tar.gz
	
	tar -czf dnc.tar.gz dnc-html
	$(install_sh_PROGRAM) dnc.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/dnc.tar.gz
	rm -f dnc.tar.gz
	
	tar -czf dnu.tar.gz dnu-html
	$(install_sh_PROGRAM) dnu.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/dnu.tar.gz
	rm -f dnu.tar.gz
	
	tar -czf dnr.tar.gz dnr-html
	$(install_sh_PROGRAM) dnr.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/dnr.tar.gz
	rm -f dnr.tar.gz
	
	gzip --best -c ChangeLog > changelog.gz
	$(install_sh_PROGRAM) changelog.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/changelog.gz
	rm -f changelog.gz

uninstall:
	rm -f -r $(prefix)/share/doc/dylandotnet-doc

distclean:
	rm -f Makefile	

testc:
	echo 'hello'

