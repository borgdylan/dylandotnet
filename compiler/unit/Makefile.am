all:
	'$(PKG_CONFIG)' --libs nunit > nunit.libs
	'$(MONO)' ../dev/pc2dn.exe nunit.libs
	cp ../4.0/dnu.dll dnu.dll
	cp ../4.0/C5.Mono.dll C5.Mono.dll
	echo '' > buildlog
	'$(MONO)' ../4.0/dnc.exe unit.dyl | tee -a  buildlog
	'$(NUNIT)' unit.dll

clean:
	rm -f *.exe
	rm -f *.mdb
	rm -f *.dll
	
distclean:
	rm -f Makefile

testc:
	echo 'hello'
