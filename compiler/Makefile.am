#SUBDIRS = . tests doc 2.0 4.0 dev

EXTRA_DIST = 
CLEANFILES = 

#tokenizer.AST.txt tokenizer.Lexer.txt tokenizer.Parser.txt tokenizer.CodeGen.txt dnc.txt

.PHONY: all

installman:
	$(install_sh_PROGRAM) dylandotnet.1 $(DESTDIR)$(mandir)/man1/dylandotnet.1
	$(install_sh_PROGRAM) dylandotnet.7 $(DESTDIR)$(mandir)/man7/dylandotnet.7
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
	rm $(DESTDIR)$(mandir)/man7/dylandotnet.7
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
	$(MAKE) -C unit clean
	rm -f *.exe
	rm -f *.dll
	rm -f *.mdb

distclean: clean
	$(MAKE) -C tests distclean
	$(MAKE) -C doc distclean
	$(MAKE) -C 2.0 distclean
	$(MAKE) -C 4.0 distclean
	$(MAKE) -C dev distclean
	$(MAKE) -C unit distclean
	rm -f Makefile
	rm -f config.status
	rm -f config.log
	
tarball: distclean
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)

all:
	echo '' > lock-file
	cp ./lib/IKVM.Reflection.dll ./IKVM.Reflection.dll
	cp ./lib/IKVM.Reflection.dll ./2.0/IKVM.Reflection.dll
	cp ./lib/IKVM.Reflection.dll ./4.0/IKVM.Reflection.dll
	cat cflags.dyl.in > cflags.dyl
if DEBUG
	echo '#define DEBUG' | tee -a cflags.dyl
endif
if NET45
else
	echo '#undef NET_4_5' | tee -a cflags.dyl
endif
	
	cp ./lib/4.0/C5.Mono.dll ./C5.Mono.dll
	'$(MONO)' 4.0/dnc.exe -V > buildlog4
	'$(MONO)' 4.0/dnc.exe dnu.dyl | tee -a buildlog4
	'$(MONO)' 4.0/dnc.exe dnr.dyl | tee -a buildlog4
	'$(MONO)' 4.0/dnc.exe tokenizer.AST.dyl | tee -a buildlog4
	'$(MONO)' 4.0/dnc.exe tokenizer.Lexer.dyl | tee -a buildlog4
	'$(MONO)' 4.0/dnc.exe tokenizer.Parser.dyl | tee -a buildlog4
	'$(MONO)' 4.0/dnc.exe tokenizer.CodeGen.dyl | tee -a buildlog4
	'$(MONO)' 4.0/dnc.exe dnc.dyl | tee -a buildlog4
	'$(MONO)' 4.0/dnc.exe web.dyl | tee -a buildlog4
	cp ./lib/4.0/C5.Mono.dll ./4.0/C5.Mono.dll
	cp dnu.dll 4.0/dnu.dll
	cp dnr.dll 4.0/dnr.dll
	cp tokenizer.AST.dll 4.0/tokenizer.AST.dll
	cp tokenizer.Lexer.dll 4.0/tokenizer.Lexer.dll
	cp tokenizer.Parser.dll 4.0/tokenizer.Parser.dll
	cp tokenizer.CodeGen.dll 4.0/tokenizer.CodeGen.dll
	cp dnc.exe 4.0/dnc.exe
	cp web.dll 4.0/web.dll
	
	cp ./lib/2.0/C5.Mono.dll ./C5.Mono.dll
	'$(MONO)' 2.0/dnc.exe -V > buildlog
	'$(MONO)' 2.0/dnc.exe dnu.dyl | tee -a buildlog
	'$(MONO)' 2.0/dnc.exe dnr.dyl | tee -a buildlog
	'$(MONO)' 2.0/dnc.exe tokenizer.AST.dyl | tee -a buildlog
	'$(MONO)' 2.0/dnc.exe tokenizer.Lexer.dyl | tee -a buildlog
	'$(MONO)' 2.0/dnc.exe tokenizer.Parser.dyl | tee -a buildlog
	'$(MONO)' 2.0/dnc.exe tokenizer.CodeGen.dyl | tee -a buildlog
	'$(MONO)' 2.0/dnc.exe dnc.dyl | tee -a buildlog
	cp ./lib/2.0/C5.Mono.dll ./2.0/C5.Mono.dll
	cp dnu.dll 2.0/dnu.dll
	cp dnr.dll 2.0/dnr.dll
	cp tokenizer.AST.dll 2.0/tokenizer.AST.dll
	cp tokenizer.Lexer.dll 2.0/tokenizer.Lexer.dll
	cp tokenizer.Parser.dll 2.0/tokenizer.Parser.dll
	cp tokenizer.CodeGen.dll 2.0/tokenizer.CodeGen.dll
	cp dnc.exe 2.0/dnc.exe
	
	cp ChangeLog doc/ChangeLog
	echo "Hello World"
	$(MAKE) -C tests all
	$(MAKE) -C doc all
	$(MAKE) -C dev all
	rm -f lock-file

test:
	$(MAKE) -C unit all
	
testc:
	$(MAKE) -C tests testc
	$(MAKE) -C doc testc
	$(MAKE) -C 2.0 testc
	$(MAKE) -C 4.0 testc
	$(MAKE) -C dev testc

