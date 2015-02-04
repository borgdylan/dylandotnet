#SUBDIRS = . tests doc 2.0 4.0 dev unit m4

EXTRA_DIST = 
CLEANFILES = 

if DEBUG
CONFIG = /p:Configuration=Debug
else
CONFIG = /p:Configuration=Release
endif


.PHONY: all test testc install installman uninstall uninstallman clean distclean tarball

installman:
	$(install_sh_PROGRAM) dylandotnet.1 $(DESTDIR)$(mandir)/man1/dylandotnet.1
	$(install_sh_PROGRAM) dylandotnet.7 $(DESTDIR)$(mandir)/man7/dylandotnet.7
	$(install_sh_PROGRAM) pc2dylandotnet.1 $(DESTDIR)$(mandir)/man1/pc2dylandotnet.1
	$(install_sh_PROGRAM) nuget2dylandotnet.1 $(DESTDIR)$(mandir)/man1/nuget2dylandotnet.1
	$(install_sh_PROGRAM) pc2curdir.1 $(DESTDIR)$(mandir)/man1/pc2curdir.1
		
install: installman	
	$(MAKE) -C tests install
	$(MAKE) -C doc install
	$(MAKE) -C 4.0 install
	$(MAKE) -C dev install
	
uninstallman:
	rm $(DESTDIR)$(mandir)/man1/dylandotnet.1
	rm $(DESTDIR)$(mandir)/man7/dylandotnet.7
	rm $(DESTDIR)$(mandir)/man1/pc2dylandotnet.1
	rm $(DESTDIR)$(mandir)/man1/nuget2dylandotnet.1
	rm $(DESTDIR)$(mandir)/man1/pc2curdir.1

uninstall: uninstallman
	
	$(MAKE) -C doc uninstall
	$(MAKE) -C 4.0 uninstall
	$(MAKE) -C dev uninstall

clean:
	$(MAKE) -C tests clean
	$(MAKE) -C dev clean
	MONO_OPTIONS=--gc=boehm xbuild /t:Clean $(CONFIG)
	
distclean: clean
	$(MAKE) -C tests distclean
	$(MAKE) -C doc distclean
	$(MAKE) -C 4.0 distclean
	$(MAKE) -C dev distclean
	$(MAKE) -C m4 distclean
	rm -f Makefile
	rm -f config.status
	rm -f config.log
	
tarball: distclean
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)
	

all:
	MONO_OPTIONS=--gc=boehm xbuild /t:Build $(CONFIG)
	cp -u ChangeLog doc/ChangeLog
	$(MAKE) -C tests all
	$(MAKE) -C doc all
	$(MAKE) -C dev all
	rm -f lock-file
	
testc:
	$(MAKE) -C tests testc
	$(MAKE) -C doc testc
	$(MAKE) -C 4.0 testc
	$(MAKE) -C dev testc

