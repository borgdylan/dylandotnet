#if test -e "*.exe"; then rm -f *.exe ; fi
#if test -e "*.mdb"; then rm -f *.mdb ; fi
#if test -e "*.dll"; then rm -f *.dll ; fi

#preprep:
#	
#	if [[ $(host) =~ .*-apple-darwin.* ]] ; then \
#		readlink $(MONO) > monol; \
#		printf "/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/2.0/mscorlib.dll" > mscorlibl; \
#		printf "/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/2.0/System.Xml.Linq.dll" > sysxmllinql; \
#	else \
#		readlink -e -n $(MONO) > monol; \
#		dirname `cat monol` > monol; \
#		echo -n `cat monol`/../lib/mono/2.0/mscorlib.dll > mscorlibl; \
#		readlink -e -n `cat mscorlibl` > mscorlibl;\
#		echo -n `cat monol`/../lib/mono/2.0/System.Xml.Linq.dll > sysxmllinql; \
#		readlink -e -n `cat sysxmllinql` > sysxmllinql; \
#	fi
#	
#	rm -f monol
#	
#	sed -e "s|\@MSCORLIB\@|$(MSCORLIB)|g" \
#	    -e "s|\@SYSXMLLINQ\@|$(SYSXMLLINQ)|g" libs.in > libs


.PHONY: all

	    
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
	$(MONO) ../2.0/dnc.exe boxobj.dyl
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
