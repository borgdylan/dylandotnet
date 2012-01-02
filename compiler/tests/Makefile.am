#if test -e "*.exe"; then rm -f *.exe ; fi
#if test -e "*.mdb"; then rm -f *.mdb ; fi
#if test -e "*.dll"; then rm -f *.dll ; fi

MSCORLIB = `cat mscorlibl`
SYSXMLLINQ = `cat sysxmllinql`

.PHONY: all

preprep:
	
	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
		readlink $(MONO) > monol; \
		echo -n "/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/2.0/mscorlib.dll" > mscorlibl; \
		echo -n "/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/2.0/System.Xml.Linq.dll" > sysxmllinql; \
	else \
		readlink -e -n $(MONO) > monol; \
		dirname `cat monol` > monol; \
		echo -n `cat monol`/../lib/mono/2.0/mscorlib.dll > mscorlibl; \
		readlink -e -n `cat mscorlibl` > mscorlibl;\
		echo -n `cat monol`/../lib/mono/2.0/System.Xml.Linq.dll > sysxmllinql; \
		readlink -e -n `cat sysxmllinql` > sysxmllinql; \
	fi
	
	rm -f monol
	
	sed -e "s|\@MSCORLIB\@|$(MSCORLIB)|g" \
	    -e "s|\@SYSXMLLINQ\@|$(SYSXMLLINQ)|g" libs.in > libs
	    
all: preprep
	cp libs arit.dyl
	cat arit.dyl.in | tee -a arit.dyl
	$(MONO) ../2.0/dnc.exe arit.dyl
	cp libs conv.dyl
	cat conv.dyl.in | tee -a conv.dyl
	$(MONO) ../2.0/dnc.exe conv.dyl
	cp libs ctorfield.dyl
	cat ctorfield.dyl.in | tee -a ctorfield.dyl
	$(MONO) ../2.0/dnc.exe ctorfield.dyl
	cp libs helloworld.dyl
	cat helloworld.dyl.in | tee -a helloworld.dyl
	$(MONO) ../2.0/dnc.exe helloworld.dyl
	cp libs logicop.dyl
	cat logicop.dyl.in | tee -a logicop.dyl
	$(MONO) ../2.0/dnc.exe logicop.dyl
	cp libs mathematics.dyl
	cat mathematics.dyl.in | tee -a mathematics.dyl
	$(MONO) ../2.0/dnc.exe mathematics.dyl
	cp libs mathstest.dyl
	cat mathstest.dyl.in | tee -a mathstest.dyl
	$(MONO) ../2.0/dnc.exe mathstest.dyl
	cp libs numloops.dyl
	cat numloops.dyl.in | tee -a numloops.dyl
	$(MONO) ../2.0/dnc.exe numloops.dyl
	cp libs openfile.dyl
	cat openfile.dyl.in | tee -a openfile.dyl
	$(MONO) ../2.0/dnc.exe openfile.dyl
	cp libs Person.dyl
	cat Person.dyl.in | tee -a Person.dyl
	$(MONO) ../2.0/dnc.exe Person.dyl
	cp libs PersonProg.dyl
	cat PersonProg.dyl.in | tee -a PersonProg.dyl
	$(MONO) ../2.0/dnc.exe PersonProg.dyl
	cp libs boxobj.dyl
	cat boxobj.dyl.in | tee -a boxobj.dyl
	$(MONO) ../2.0/dnc.exe boxobj.dyl
	cp libs xmllib.dyl
	cat xmllib.dyl.in | tee -a xmllib.dyl
	$(MONO) ../2.0/dnc.exe xmllib.dyl
	
install:
	tar -czf tests.tar.gz *
	$(install_sh_PROGRAM) tests.tar.gz $(DESTDIR)$(prefix)/share/doc/dylandotnet-doc/tests.tar.gz
	rm -f tests.tar.gz

clean:
	rm -f *.exe
	rm -f *.mdb
	rm -f *.dll
	
distclean:
	rm -f Makefile

testc:
	echo 'hello'
