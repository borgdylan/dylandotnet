#EXTRA_DIST = *.dyl /ast/*.dyl /lexer/*.dyl /parser/*.dyl /codegen/*.dyl
CLEANFILES = 

#tokenizer.AST.txt tokenizer.Lexer.txt tokenizer.Parser.txt tokenizer.CodeGen.txt dnc.txt

dylandotnet:
	mono ./dnc.exe tokenizer.AST.dyl
	mono ./dnc.exe tokenizer.Lexer.dyl
	mono ./dnc.exe tokenizer.Parser.dyl
	mono ./dnc.exe tokenizer.CodeGen.dyl
	mono ./dnc.exe dnc.dyl
	
prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g"               \
	-e "s|\@PACKAGE\@|$(PACKAGE)|g" dylandotnet.in > dylandotnet

installman:
	$(install_sh_PROGRAM) dylandotnet.1 $(DESTDIR)$(mandir)/man1/dylandotnet.1

installdoc:
	cp -r ./doc/ast-html ast-html
	tar -czf ast.tar.gz ast-html
	$(install_sh_PROGRAM) ast.tar.gz $(DESTDIR)$(docdir)/ast.tar.gz
	rm -f ast.tar.gz
	rm -f -r ast-html
	
installlog:
	$(install_sh_PROGRAM) log.txt.gz $(DESTDIR)$(docdir)/changelog.gz
	
install: prodscript installman installdoc installlog
	$(install_sh_PROGRAM) dylandotnet $(DESTDIR)$(bindir)/dylandotnet
	chmod a+x $(DESTDIR)$(bindir)/dylandotnet
	$(install_sh_PROGRAM) dnu.dll $(DESTDIR)$(libdir)/$(PACKAGE)/dnu.dll
	chmod -x $(DESTDIR)$(libdir)/$(PACKAGE)/dnu.dll
	$(install_sh_PROGRAM) dnr.dll $(DESTDIR)$(libdir)/$(PACKAGE)/dnr.dll
	chmod -x $(DESTDIR)$(libdir)/$(PACKAGE)/dnr.dll
	$(install_sh_PROGRAM) tokenizer.AST.dll $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.AST.dll
	chmod -x $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.AST.dll
	$(install_sh_PROGRAM) tokenizer.Lexer.dll $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.Lexer.dll
	chmod -x $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.Lexer.dll
	$(install_sh_PROGRAM) tokenizer.Parser.dll $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.Parser.dll
	chmod -x $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.Parser.dll
	$(install_sh_PROGRAM) tokenizer.CodeGen.dll $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.CodeGen.dll
	chmod -x $(DESTDIR)$(libdir)/$(PACKAGE)/tokenizer.CodeGen.dll
	$(install_sh_PROGRAM) dnc.exe $(DESTDIR)$(libdir)/$(PACKAGE)/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/$(PACKAGE)/dnc.exe
	
uninstallman:
	rm $(DESTDIR)$(mandir)/man1/dylandotnet.1

uninstalldoc:
	rm -f -r $(docdir)

uninstall: uninstallman uninstalldoc
	rm -f $(DESTDIR)$(bindir)/dylandotnet
	rm -r -f $(DESTDIR)$(libdir)/$(PACKAGE)
	
distclean:
	
tarball:
	rm -f config.status
	rm -f config.log
	rm -f Makefile
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)

all:
	echo "Hello World"

