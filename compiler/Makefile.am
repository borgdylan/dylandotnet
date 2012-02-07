EXTRA_DIST = 
CLEANFILES = 
SUBDIRS = . tests doc 2.0 4.0 dev

#tokenizer.AST.txt tokenizer.Lexer.txt tokenizer.Parser.txt tokenizer.CodeGen.txt dnc.txt

.PHONY: all

dylandotnet:
	mono ./dnc.exe tokenizer.AST.dyl
	mono ./dnc.exe tokenizer.Lexer.dyl
	mono ./dnc.exe tokenizer.Parser.dyl
	mono ./dnc.exe tokenizer.CodeGen.dyl
	mono ./dnc.exe dnc.dyl
	

installman:
	$(install_sh_PROGRAM) dylandotnet.1 $(DESTDIR)$(mandir)/man1/dylandotnet.1
	$(install_sh_PROGRAM) dylandotnet4.1 $(DESTDIR)$(mandir)/man1/dylandotnet4.1
	$(install_sh_PROGRAM) pc2dylandotnet.1 $(DESTDIR)$(mandir)/man1/pc2dylandotnet.1
	$(install_sh_PROGRAM) pc2curdir.1 $(DESTDIR)$(mandir)/man1/pc2curdir.1
		
install: installman	
	$(MAKE) -C tests install
	$(MAKE) -C doc install
	$(MAKE) -C 2.0 install
	$(MAKE) -C 4.0 install
	$(MAKE) -C dev install
	
uninstallman:
	rm $(DESTDIR)$(mandir)/man1/dylandotnet.1
	rm $(DESTDIR)$(mandir)/man1/dylandotnet4.1
	rm $(DESTDIR)$(mandir)/man1/pc2dylandotnet.1
	rm $(DESTDIR)$(mandir)/man1/pc2curdir.1

uninstall: uninstallman
	
	$(MAKE) -C doc uninstall
	$(MAKE) -C 2.0 uninstall
	$(MAKE) -C 4.0 uninstall
	$(MAKE) -C dev uninstall

clean:
	$(MAKE) -C tests clean
	$(MAKE) -C dev clean

distclean: clean
	$(MAKE) -C tests distclean
	$(MAKE) -C doc distclean
	$(MAKE) -C 2.0 distclean
	$(MAKE) -C 4.0 distclean
	$(MAKE) -C dev distclean
	rm -f Makefile
	rm -f config.status
	rm -f config.log
	
tarball: distclean
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)

all:
	cp ChangeLog doc/ChangeLog
	echo "Hello World"
	$(MAKE) -C tests all
	$(MAKE) -C doc all
	$(MAKE) -C dev all
	
testc:
	$(MAKE) -C tests testc
	$(MAKE) -C doc testc
	$(MAKE) -C 2.0 testc
	$(MAKE) -C 4.0 testc
	$(MAKE) -C dev testc

