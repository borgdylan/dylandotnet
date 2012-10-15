all:
	cp ./lib/2.0/C5.Mono.dll ./C5.Mono.dll
	$(DYLANDOTNET) lzw.dyl
	cp ./lib/2.0/C5.Mono.dll ./2.0/C5.Mono.dll
	cp lzw.dll 2.0/lzw.dll
	cp ./lib/4.0/C5.Mono.dll ./C5.Mono.dll
	$(DYLANDOTNET4) lzw.dyl
	cp ./lib/4.0/C5.Mono.dll ./4.0/C5.Mono.dll
	cp lzw.dll 4.0/lzw.dll
	
	$(MDOC) update -o doc/lzw lzw.dll
	$(MDOC) export-html -o doc/lzw-html doc/lzw
	$(MDOC) export-msxdoc -o doc/lzw.xml doc/lzw

install:
	
	sed -e "s|\@prefix\@|$(prefix)|g" \
	    -e "s|\@version\@|$(PACKAGE_VERSION)|g" 2.0/dylandotnet-lzw.pc.in > 2.0/dylandotnet-lzw.pc
	
	sed -e "s|\@prefix\@|$(prefix)|g" \
	    -e "s|\@version\@|$(PACKAGE_VERSION)|g" 4.0/dylandotnet-lzw4.pc.in > 4.0/dylandotnet-lzw4.pc
	    
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		$(install_sh_PROGRAM) 2.0/dylandotnet-lzw.pc /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-lzw.pc; \
		chmod -x /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-lzw.pc; \
	else \
		$(install_sh_PROGRAM) 2.0/dylandotnet-lzw.pc $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-lzw.pc; \
		chmod -x $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-lzw.pc; \
	fi	
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		$(install_sh_PROGRAM) 4.0/dylandotnet-lzw4.pc /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-lzw4.pc; \
		chmod -x /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-lzw4.pc; \
	else \
		$(install_sh_PROGRAM) 4.0/dylandotnet-lzw4.pc $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-lzw4.pc; \
		chmod -x $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-lzw4.pc; \
	fi	
	
	$(install_sh_PROGRAM) 2.0/lzw.dll $(DESTDIR)$(libdir)/cli/dylandotnet-lzw/lzw.dll
	chmod -x $(DESTDIR)$(libdir)/cli/dylandotnet-lzw/lzw.dll
	$(install_sh_PROGRAM) 2.0/C5.Mono.dll $(DESTDIR)$(libdir)/cli/dylandotnet-lzw/C5.Mono.dll
	chmod -x $(DESTDIR)$(libdir)/cli/dylandotnet-lzw/C5.Mono.dll
	
	$(install_sh_PROGRAM) 4.0/lzw.dll $(DESTDIR)$(libdir)/cli/dylandotnet-lzw4/lzw.dll
	chmod -x $(DESTDIR)$(libdir)/cli/dylandotnet-lzw4/lzw.dll
	$(install_sh_PROGRAM) 4.0/C5.Mono.dll $(DESTDIR)$(libdir)/cli/dylandotnet-lzw4/C5.Mono.dll
	chmod -x $(DESTDIR)$(libdir)/cli/dylandotnet-lzw4/C5.Mono.dll
	
	tar -C doc -czf doc/lzw.tar.gz lzw-html
	$(install_sh_PROGRAM) doc/lzw.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-lzw/lzw.tar.gz
	rm -f doc/lzw.tar.gz
	

uninstall:
	rm -f -r $(DESTDIR)$(libdir)/cli/dylandotnet-lzw
	rm -f -r $(DESTDIR)$(libdir)/cli/dylandotnet-lzw4
	rm -f -r $(DESTDIR)$(prefix)/share/doc/dylandotnet-lzw
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		rm -f /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-lzw.pc; \
	else \
		rm -f $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-lzw.pc; \
	fi
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		rm -f /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-lzw4.pc; \
	else \
		rm -f $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-lzw4.pc; \
	fi

clean:
	rm -f *.dll
	rm -f 2.0/*.dll
	rm -f 4.0/*.dll
	
distclean: clean
	rm -f config.log
	rm -f config.status
	rm -f Makefile

tarball: distclean
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)

