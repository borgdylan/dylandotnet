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
	'$(MONO)' ../2.0/dnc.exe -V > buildlog
	'$(MONO)' ../2.0/dnc.exe arit.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe conv.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe ctorfield.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe helloworld.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe logicop.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe mathematics.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe mathstest.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe numloops.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe openfile.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe Person.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe PersonProg.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe boxobj.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe xmllib.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe arraytest.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe vector.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe threads.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe dylrecurse.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe strrecurse.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe protectedtests.dyl | tee -a buildlog
	
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
