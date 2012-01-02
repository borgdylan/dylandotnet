prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" dylandotnet4.in > dylandotnet4

install: prodscript 
	$(install_sh_PROGRAM) dylandotnet4 $(DESTDIR)$(bindir)/dylandotnet4
	chmod a+x $(DESTDIR)$(bindir)/dylandotnet4
	$(install_sh_PROGRAM) dnu.dll $(DESTDIR)$(libdir)/dylandotnet4/dnu.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/dnu.dll
	$(install_sh_PROGRAM) dnr.dll $(DESTDIR)$(libdir)/dylandotnet4/dnr.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/dnr.dll
	$(install_sh_PROGRAM) tokenizer.AST.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.AST.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.AST.dll
	$(install_sh_PROGRAM) tokenizer.Lexer.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Lexer.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Lexer.dll
	$(install_sh_PROGRAM) tokenizer.Parser.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Parser.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.Parser.dll
	$(install_sh_PROGRAM) tokenizer.CodeGen.dll $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.CodeGen.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/tokenizer.CodeGen.dll
	$(install_sh_PROGRAM) dnc.exe $(DESTDIR)$(libdir)/dylandotnet4/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/dnc.exe
	
uninstall:
	rm -f $(DESTDIR)$(bindir)/dylandotnet4
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet4
	
distclean:
	rm -f Makefile	

testc:
	echo 'hello'
