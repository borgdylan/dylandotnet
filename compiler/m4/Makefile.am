all:

installman:
	$(install_sh_PROGRAM) dylandotnet-macros.7 $(DESTDIR)$(mandir)/man7/dylandotnet-macros.7

install: installman
	$(install_sh_PROGRAM) dylandotnet.m4 $(DESTDIR)$(prefix)/share/dylandotnet/dylandotnet.m4

uninstallman:
	rm $(DESTDIR)$(mandir)/man7/dylandotnet-macros.7

uninstall: uninstallman
	rm $(DESTDIR)$(prefix)/share/dylandotnet/dylandotnet.m4

distclean: clean
	rm -f Makefile	

testc:
	echo 'hello'
