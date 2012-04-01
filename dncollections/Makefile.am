all:
	$(DYLANDOTNET) dncollections.dyl
	cp dncollections.dll 2.0/dncollections.dll
	$(DYLANDOTNET4) dncollections.dyl
	cp dncollections.dll 4.0/dncollections.dll
	
	$(MDOC) update -o doc/dncollections dncollections.dll
	$(MDOC) export-html -o doc/dncollections-html doc/dncollections
	$(MDOC) export-msxdoc -o doc/dncollections.xml doc/dncollections

install:
	
	sed -e "s|\@prefix\@|$(prefix)|g" \
	    -e "s|\@version\@|$(PACKAGE_VERSION)|g" 2.0/dylandotnet-collections.pc.in > 2.0/dylandotnet-collections.pc
	    
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		$(install_sh_PROGRAM) 2.0/dylandotnet-collections.pc /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-collections.pc; \
		chmod -x /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-collections.pc; \
	else \
		$(install_sh_PROGRAM) 2.0/dylandotnet-collections.pc $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-collections.pc; \
		chmod -x $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-collections.pc; \
	fi	
	
	sed -e "s|\@prefix\@|$(prefix)|g" \
	    -e "s|\@version\@|$(PACKAGE_VERSION)|g" 4.0/dylandotnet-collections4.pc.in > 4.0/dylandotnet-collections4.pc
	    
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		$(install_sh_PROGRAM) 4.0/dylandotnet-collections4.pc /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-collections4.pc; \
		chmod -x /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-collections4.pc; \
	else \
		$(install_sh_PROGRAM) 4.0/dylandotnet-collections4.pc $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-collections4.pc; \
		chmod -x $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-collections4.pc; \
	fi	
	
	$(install_sh_PROGRAM) 2.0/dncollections.dll $(DESTDIR)$(libdir)/cli/dylandotnet-collections/dncollections.dll
	chmod -x $(DESTDIR)$(libdir)/cli/dylandotnet-collections/dncollections.dll
	$(install_sh_PROGRAM) 4.0/dncollections.dll $(DESTDIR)$(libdir)/cli/dylandotnet-collections4/dncollections.dll
	chmod -x $(DESTDIR)$(libdir)/cli/dylandotnet-collections4/dncollections.dll
	
	tar -C doc -czf doc/dncollections.tar.gz dncollections-html
	$(install_sh_PROGRAM) doc/dncollections.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-collections/dncollections.tar.gz
	rm -f doc/dncollections.tar.gz
	

uninstall:
	rm -f -r $(DESTDIR)$(libdir)/cli/dylandotnet-collections
	rm -f -r $(DESTDIR)$(libdir)/cli/dylandotnet-collections4
	rm -f -r $(DESTDIR)$(prefix)/share/doc/dylandotnet-collections
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		rm -f /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-collections.pc; \
	else \
		rm -f $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-collections.pc; \
	fi
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		rm -f /Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/dylandotnet-collections4.pc; \
	else \
		rm -f $(DESTDIR)$(libdir)/pkgconfig/dylandotnet-collections4.pc; \
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

