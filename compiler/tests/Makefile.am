.PHONY: all install clean distclean testc compilestart

%.exe: %.dyl
	'$(MONO)' ../4.0/dnc.exe $< | tee -a buildlog

%.dll: %.dyl
	'$(MONO)' ../4.0/dnc.exe $< | tee -a buildlog

compilestart:
	'$(MONO)' ../4.0/dnc.exe -V > buildlog

arit.exe: arit.dyl ./../config.status ./../config.log

conv.exe: conv.dyl ./../config.status ./../config.log

ctorfield.exe: ctorfield.dyl ./../config.status ./../config.log

helloworld.exe: helloworld.dyl ./../config.status ./../config.log

logicop.exe: logicop.dyl ./../config.status ./../config.log

mathematics.dll: mathematics.dyl ./../config.status ./../config.log

mathstest.exe: mathstest.dyl ./../config.status ./../config.log

numloops.exe: numloops.dyl ./../config.status ./../config.log

openfile.exe: openfile.dyl ./../config.status ./../config.log

Person.dll: Person.dyl ./../config.status ./../config.log

PersonProg.exe: PersonProg.dyl ./../config.status ./../config.log

boxobj.exe: boxobj.dyl ./../config.status ./../config.log

xmllib.exe: xmllib.dyl ./../config.status ./../config.log

arraytest.exe: arraytest.dyl ./../config.status ./../config.log

vector.dll: vector.dyl ./../config.status ./../config.log

threads.exe: threads.dyl ./../config.status ./../config.log

dylrecurse.exe: dylrecurse.dyl ./../config.status ./../config.log

strrecurse.exe: strrecurse.dyl ./../config.status ./../config.log

protectedtests.exe: protectedtests.dyl ./../config.status ./../config.log

transnames.exe: transnames.dyl ./../config.status ./../config.log

all: compilestart arit.exe conv.exe ctorfield.exe helloworld.exe logicop.exe mathematics.dll mathstest.exe numloops.exe Person.dll PersonProg.exe boxobj.exe xmllib.exe arraytest.exe vector.dll threads.exe dylrecurse.exe strrecurse.exe protectedtests.exe transnames.exe

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
