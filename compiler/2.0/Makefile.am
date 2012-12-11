prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" dylandotnet.in > dylandotnet
	sed -e "s|\@prefix\@|$(prefix)|g" \
	    -e "s|\@version\@|$(PACKAGE_VERSION)|g" dylandotnet.pc.in > dylandotnet.pc

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
	$(install_sh_PROGRAM) IKVM.Reflection.dll $(DESTDIR)$(libdir)/dylandotnet/IKVM.Reflection.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/IKVM.Reflection.dll
	$(install_sh_PROGRAM) C5.Mono.dll $(DESTDIR)$(libdir)/dylandotnet/C5.Mono.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/C5.Mono.dll
	$(install_sh_PROGRAM) dnc.exe $(DESTDIR)$(libdir)/dylandotnet/dnc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet/dnc.exe
	
	if [[ $(host) =~ i686-pc-linux-gnu ]] ; then \
		$(MONO) --aot $(DESTDIR)$(libdir)/dylandotnet/*.exe $(DESTDIR)$(libdir)/dylandotnet/*.dll; \
	fi
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		$(install_sh_PROGRAM) dylandotnet.pc /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet.pc; \
		chmod -x /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet.pc; \
	else \
		$(install_sh_PROGRAM) dylandotnet.pc $(DESTDIR)$(libdir)/pkgconfig/dylandotnet.pc; \
		chmod -x $(DESTDIR)$(libdir)/pkgconfig/dylandotnet.pc; \
	fi
	
uninstall:
	rm -f $(DESTDIR)$(bindir)/dylandotnet
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet
	rm -f $(DESTDIR)$(libdir)/pkgconfig/dylandotnet.pc
	
distclean:
	rm -f Makefile	

testc:
	echo 'hello'
