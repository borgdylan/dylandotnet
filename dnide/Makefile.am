all:
	echo -n $(DYLANDOTNET4PKG_LIBS) > libs/dylandotnet4.libs
	echo -n $(GTKSHARP_LIBS) > libs/gtk-sharp.libs
	echo -n $(DNCOLLECTIONS_LIBS) > libs/dylandotnet-collections4.libs
	$(PC2DYLANDOTNET) libs/dylandotnet4.libs
	$(PC2CURDIR) libs/dylandotnet4.libs
	$(PC2DYLANDOTNET) libs/dylandotnet-collections4.libs
	$(PC2CURDIR) libs/dylandotnet-collections4.libs
	$(PC2DYLANDOTNET) libs/gtk-sharp.libs
	$(DYLANDOTNET4) dnide.dyl

install:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" dylandotnet-ide.in > dylandotnet-ide
	
	$(install_sh_PROGRAM) dylandotnet-ide $(DESTDIR)$(bindir)/dylandotnet-ide
	chmod a+x $(DESTDIR)$(bindir)/dylandotnet-ide
	$(install_sh_PROGRAM) dnu.dll $(DESTDIR)$(libdir)/dylandotnet-ide/dnu.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/dnu.dll
	$(install_sh_PROGRAM) dnr.dll $(DESTDIR)$(libdir)/dylandotnet-ide/dnr.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/dnr.dll
	$(install_sh_PROGRAM) dncollections.dll $(DESTDIR)$(libdir)/dylandotnet-ide/dncollections.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/dncollections.dll
	$(install_sh_PROGRAM) tokenizer.AST.dll $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.AST.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.AST.dll
	$(install_sh_PROGRAM) tokenizer.Lexer.dll $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.Lexer.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.Lexer.dll
	$(install_sh_PROGRAM) tokenizer.Parser.dll $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.Parser.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.Parser.dll
	$(install_sh_PROGRAM) tokenizer.CodeGen.dll $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.CodeGen.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/tokenizer.CodeGen.dll
	$(install_sh_PROGRAM) dnc.exe $(DESTDIR)$(libdir)/dylandotnet-ide/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/dnc.exe
	$(install_sh_PROGRAM) dnide.exe $(DESTDIR)$(libdir)/dylandotnet-ide/dnide.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-ide/dnide.exe
	
	$(install_sh_PROGRAM) dylandotnet-ide.1 $(DESTDIR)$(mandir)/man1/dylandotnet-ide.1

uninstall:
	rm -f $(DESTDIR)$(bindir)/dylandotnet-ide
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet-ide
	rm $(DESTDIR)$(mandir)/man1/dylandotnet-ide.1

run:
	$(MONO) dnide.exe
	
clean:
	rm -f *.exe
	rm -f *.dll
	rm -f *.mdb
	
distclean: clean
	rm -f config.log
	rm -f config.status
	rm -f Makefile
	
tarball: distclean
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)

