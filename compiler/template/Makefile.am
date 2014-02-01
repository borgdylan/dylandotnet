all:
	'$(MONO)' ../4.0/dnc.exe template.dyl
	cp template.exe build/template.exe
	cp template.exe.mdb build/template.exe.mdb

clean:
	rm -f *.exe
	rm -f *.mdb
	rm -f build/*.exe
	rm -f build/*.mdb

run:
	'$(MONO)' template.exe
