.PHONY: all

all:
	mdoc update -o ast ../tokenizer.AST.dll
	mdoc update -o lexer ../tokenizer.Lexer.dll
	mdoc update -o parser ../tokenizer.Parser.dll
	mdoc update -o codegen ../tokenizer.CodeGen.dll
	mdoc update -o dnu ../dnu.dll
	mdoc update -o dnr ../dnr.dll
	mdoc update -o dnc ../dnc.exe
	
	mdoc export-html -o ast-html ast
	mdoc export-html -o lexer-html lexer
	mdoc export-html -o parser-html parser
	mdoc export-html -o codegen-html codegen
	mdoc export-html -o dnu-html dnu
	mdoc export-html -o dnr-html dnr
	mdoc export-html -o dnc-html dnc

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

