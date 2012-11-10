prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" dylandotnet4.in > dylandotnet4
	sed -e "s|\@prefix\@|$(prefix)|g" \
	    -e "s|\@version\@|$(PACKAGE_VERSION)|g" dylandotnet4.pc.in > dylandotnet4.pc

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
	$(install_sh_PROGRAM) IKVM.Reflection.dll $(DESTDIR)$(libdir)/dylandotnet4/IKVM.Reflection.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/IKVM.Reflection.dll
	$(install_sh_PROGRAM) C5.Mono.dll $(DESTDIR)$(libdir)/dylandotnet4/C5.Mono.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/C5.Mono.dll
	$(install_sh_PROGRAM) dnc.exe $(DESTDIR)$(libdir)/dylandotnet4/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet4/dnc.exe
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		$(install_sh_PROGRAM) dylandotnet4.pc /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet4.pc; \
		chmod -x /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet4.pc; \
	else \
		$(install_sh_PROGRAM) dylandotnet4.pc $(DESTDIR)$(libdir)/pkgconfig/dylandotnet4.pc; \
		chmod -x $(DESTDIR)$(libdir)/pkgconfig/dylandotnet4.pc; \
	fi
	
uninstall:
	rm -f $(DESTDIR)$(bindir)/dylandotnet4
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet4
	rm -f $(DESTDIR)$(libdir)/pkgconfig/dylandotnet4.pc
	
distclean:
	rm -f Makefile	

testc:
	echo 'hello'
