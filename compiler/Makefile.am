EXTRA_DIST = 
CLEANFILES = 
SUBDIRS = . tests

#tokenizer.AST.txt tokenizer.Lexer.txt tokenizer.Parser.txt tokenizer.CodeGen.txt dnc.txt

dylandotnet:
	mono ./dnc.exe tokenizer.AST.dyl
	mono ./dnc.exe tokenizer.Lexer.dyl
	mono ./dnc.exe tokenizer.Parser.dyl
	mono ./dnc.exe tokenizer.CodeGen.dyl
	mono ./dnc.exe dnc.dyl
	
prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" dylandotnet.in > dylandotnet
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" dylandotnet4.in > dylandotnet4

installman:
	$(install_sh_PROGRAM) dylandotnet.1 $(DESTDIR)$(mandir)/man1/dylandotnet.1
	$(install_sh_PROGRAM) dylandotnet4.1 $(DESTDIR)$(mandir)/man1/dylandotnet4.1
		
install: installman
	
	cp ChangeLog doc/ChangeLog	
		
	$(install_sh_PROGRAM) dylandotnet $(DESTDIR)$(bindir)/dylandotnet
	chmod a+x $(DESTDIR)$(bindir)/dylandotnet
	$(install_sh_PROGRAM) 2.0/dnu.dll $(DESTDIR)$(libdir)/dylandotnet/dnu.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/dnu.dll
	$(install_sh_PROGRAM) 2.0/dnr.dll $(DESTDIR)$(libdir)/dylandotnet/dnr.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/dnr.dll
	$(install_sh_PROGRAM) 2.0/tokenizer.AST.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.AST.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.AST.dll
	$(install_sh_PROGRAM) 2.0/tokenizer.Lexer.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Lexer.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Lexer.dll
	$(install_sh_PROGRAM) 2.0/tokenizer.Parser.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Parser.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Parser.dll
	$(install_sh_PROGRAM) 2.0/tokenizer.CodeGen.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.CodeGen.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.CodeGen.dll
	$(install_sh_PROGRAM) 2.0/dnc.exe $(DESTDIR)$(libdir)/dylandotnet/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/dnc.exe
	
	$(install_sh_PROGRAM) dylandotnet4 $(DESTDIR)$(bindir)/dylandotnet4
	chmod a+x $(DESTDIR)$(bindir)/dylandotnet4
	$(install_sh_PROGRAM) 4.0/dnu.dll $(DESTDIR)$(libdir)/dylandotnet4/dnu.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/dnu.dll
	$(install_sh_PROGRAM) 4.0/dnr.dll $(DESTDIR)$(libdir)/dylandotnet4/dnr.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/dnr.dll
	$(install_sh_PROGRAM) 4.0/tokenizer.AST.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.AST.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.AST.dll
	$(install_sh_PROGRAM) 4.0/tokenizer.Lexer.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Lexer.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Lexer.dll
	$(install_sh_PROGRAM) 4.0/tokenizer.Parser.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Parser.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Parser.dll
	$(install_sh_PROGRAM) 4.0/tokenizer.CodeGen.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.CodeGen.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.CodeGen.dll
	$(install_sh_PROGRAM) 4.0/dnc.exe $(DESTDIR)$(libdir)/dylandotnet4/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/dnc.exe
	
	$(MAKE) -C tests install
	$(MAKE) -C doc install
	
uninstallman:
	rm $(DESTDIR)$(mandir)/man1/dylandotnet.1
	rm $(DESTDIR)$(mandir)/man1/dylandotnet4.1

uninstall: uninstallman
	rm -f $(DESTDIR)$(bindir)/dylandotnet
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet
	rm -f $(DESTDIR)$(bindir)/dylandotnet4
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet4
	
	$(MAKE) -C doc uninstall
	
distclean:
	$(MAKE) -C tests distclean
	$(MAKE) -C doc distclean
	rm -f Makefile
	rm -f config.status
	rm -f config.log
	
tarball: distclean
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)

all: prodscript
	echo "Hello World"
	$(MAKE) -C tests all
	$(MAKE) -C doc all
	
testc:
	$(MAKE) -C tests testc
	$(MAKE) -C doc testc
