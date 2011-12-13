prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" dylandotnet.in > dylandotnet

install: prodscript 
	$(install_sh_PROGRAM) dylandotnet $(DESTDIR)$(bindir)/dylandotnet
	chmod a+x $(DESTDIR)$(bindir)/dylandotnet
	$(install_sh_PROGRAM) dnu.dll $(DESTDIR)$(libdir)/dylandotnet/dnu.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/dnu.dll
	$(install_sh_PROGRAM) dnr.dll $(DESTDIR)$(libdir)/dylandotnet/dnr.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/dnr.dll
	$(install_sh_PROGRAM) tokenizer.AST.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.AST.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.AST.dll
	$(install_sh_PROGRAM) tokenizer.Lexer.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Lexer.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Lexer.dll
	$(install_sh_PROGRAM) tokenizer.Parser.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Parser.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.Parser.dll
	$(install_sh_PROGRAM) tokenizer.CodeGen.dll $(DESTDIR)$(libdir)/dylandotnet/tokenizer.CodeGen.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/tokenizer.CodeGen.dll
	$(install_sh_PROGRAM) dnc.exe $(DESTDIR)$(libdir)/dylandotnet/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/dnc.exe
	
uninstall:
	rm -f $(DESTDIR)$(bindir)/dylandotnet
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet
	
distclean:
	rm -f Makefile	

testc:
	echo 'hello'
