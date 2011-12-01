#if test -e "*.exe"; then rm -f *.exe ; fi
#if test -e "*.mdb"; then rm -f *.mdb ; fi
#if test -e "*.dll"; then rm -f *.dll ; fi


all:
	$(MONO) ../2.0/dnc.exe arit.dyl
	$(MONO) ../2.0/dnc.exe conv.dyl
	$(MONO) ../2.0/dnc.exe ctorfield.dyl
	$(MONO) ../2.0/dnc.exe helloworld.dyl
	$(MONO) ../2.0/dnc.exe logicop.dyl
	$(MONO) ../2.0/dnc.exe mathematics.dyl
	$(MONO) ../2.0/dnc.exe mathstest.dyl
	$(MONO) ../2.0/dnc.exe numloops.dyl
	$(MONO) ../2.0/dnc.exe openfile.dyl
	$(MONO) ../2.0/dnc.exe Person.dyl
	$(MONO) ../2.0/dnc.exe PersonProg.dyl

install:
	tar -czf tests.tar.gz *
	$(install_sh_PROGRAM) tests.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/tests.tar.gz
	rm -f tests.tar.gz

	
distclean:
	rm -f *.exe
	rm -f *.mdb
	rm -f *.dll
	rm -f Makefile	

testc:
	echo 'hello'
