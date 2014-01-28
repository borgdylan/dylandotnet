#SUBDIRS = . tests doc 2.0 4.0 dev unit m4

EXTRA_DIST = 
CLEANFILES = 

.PHONY: compilestart all test testc install installman uninstall uninstallman clean distclean tarball

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
	$(MAKE) -C unit clean
	$(MAKE) -C build/4.0 clean
	rm -f *.exe
	rm -f *.dll
	rm -f *.mdb

distclean: clean
	$(MAKE) -C tests distclean
	$(MAKE) -C doc distclean
	$(MAKE) -C build/4.0 distclean
	$(MAKE) -C 4.0 distclean
	$(MAKE) -C dev distclean
	$(MAKE) -C unit distclean
	$(MAKE) -C m4 distclean
	rm -f Makefile
	rm -f config.status
	rm -f config.log
	
tarball: distclean
	mkdir -p ./../$(distdir)
	cp -r * ./../$(distdir)
	tar -czf ./../$(distdir).tar.gz ./../$(distdir)
	rm -f -r ./../$(distdir)

cflags.dyl: cflags.dyl.in config.log config.status
	cat cflags.dyl.in > cflags.dyl
if DEBUG
	echo '#define DEBUG' | tee -a cflags.dyl
endif
if NET45
else
	echo '#undef NET_4_5' | tee -a cflags.dyl
endif
if RX
	echo '#define RX' | tee -a cflags.dyl
endif

compilestart: cflags.dyl
	touch lock-file
	cp -u ./lib/IKVM.Reflection.dll ./build/4.0/IKVM.Reflection.dll
	cp -u ./lib/IKVM.Reflection.dll ./4.0/IKVM.Reflection.dll
	cp -u ./lib/4.0/C5.Mono.dll ./build/4.0/C5.Mono.dll
	cp -u ./lib/4.0/C5.Mono.dll ./4.0/C5.Mono.dll
	cp -u ./lib/4.0/System.Interactive.dll ./build/4.0/System.Interactive.dll
	cp -u ./lib/4.0/System.Interactive.dll ./4.0/System.Interactive.dll
	'$(MONO)' 4.0/dnc.exe -V > buildlog4
	
build/4.0/dnu.dll: $(wildcard dnu/*.dyl) dnu.dyl cflags.dyl
	'$(MONO)' 4.0/dnc.exe dnu.dyl | tee -a buildlog4
	mv dnu.dll build/4.0/dnu.dll
if DEBUG
	mv dnu.dll.mdb build/4.0/dnu.dll.mdb
endif

build/4.0/dnr.dll: $(wildcard dnr/*.dyl) dnr.dyl cflags.dyl
	'$(MONO)' 4.0/dnc.exe dnr.dyl | tee -a buildlog4
	mv dnr.dll build/4.0/dnr.dll
if DEBUG
	mv dnr.dll.mdb build/4.0/dnr.dll.mdb
endif

build/4.0/tokenizer.AST.dll: $(wildcard ast/*.dyl) tokenizer.AST.dyl cflags.dyl
	'$(MONO)' 4.0/dnc.exe tokenizer.AST.dyl | tee -a buildlog4
	mv tokenizer.AST.dll build/4.0/tokenizer.AST.dll
if DEBUG
	mv tokenizer.AST.dll.mdb build/4.0/tokenizer.AST.dll.mdb
endif

build/4.0/tokenizer.Lexer.dll: $(wildcard lexer/*.dyl) tokenizer.Lexer.dyl cflags.dyl
	'$(MONO)' 4.0/dnc.exe tokenizer.Lexer.dyl | tee -a buildlog4
	mv tokenizer.Lexer.dll build/4.0/tokenizer.Lexer.dll
if DEBUG
	mv tokenizer.Lexer.dll.mdb build/4.0/tokenizer.Lexer.dll.mdb
endif

build/4.0/tokenizer.Parser.dll: $(wildcard parser/*.dyl) tokenizer.Parser.dyl cflags.dyl
	'$(MONO)' 4.0/dnc.exe tokenizer.Parser.dyl | tee -a buildlog4
	mv tokenizer.Parser.dll build/4.0/tokenizer.Parser.dll
if DEBUG
	mv tokenizer.Parser.dll.mdb build/4.0/tokenizer.Parser.dll.mdb
endif

build/4.0/tokenizer.CodeGen.dll: $(wildcard codegen/*.dyl) tokenizer.CodeGen.dyl cflags.dyl
	'$(MONO)' 4.0/dnc.exe tokenizer.CodeGen.dyl | tee -a buildlog4
	mv tokenizer.CodeGen.dll build/4.0/tokenizer.CodeGen.dll
if DEBUG
	mv tokenizer.CodeGen.dll.mdb build/4.0/tokenizer.CodeGen.dll.mdb
endif

build/4.0/dnc.exe: $(wildcard dnc/*.dyl) dnc.dyl cflags.dyl
	'$(MONO)' 4.0/dnc.exe dnc.dyl | tee -a buildlog4
	mv dnc.exe build/4.0/dnc.exe
if DEBUG
	mv dnc.exe.mdb build/4.0/dnc.exe.mdb
endif

all: compilestart build/4.0/dnu.dll build/4.0/dnr.dll build/4.0/tokenizer.AST.dll build/4.0/tokenizer.Lexer.dll build/4.0/tokenizer.Parser.dll build/4.0/tokenizer.CodeGen.dll build/4.0/dnc.exe	
	cp -u ./lib/4.0/C5.Mono.dll ./4.0/C5.Mono.dll
	cp -u build/4.0/dnu.dll 4.0/dnu.dll
	cp -u build/4.0/dnr.dll 4.0/dnr.dll
	cp -u build/4.0/tokenizer.AST.dll 4.0/tokenizer.AST.dll
	cp -u build/4.0/tokenizer.Lexer.dll 4.0/tokenizer.Lexer.dll
	cp -u build/4.0/tokenizer.Parser.dll 4.0/tokenizer.Parser.dll
	cp -u build/4.0/tokenizer.CodeGen.dll 4.0/tokenizer.CodeGen.dll
	cp -u build/4.0/dnc.exe 4.0/dnc.exe
	
	cp -u ChangeLog doc/ChangeLog
	$(MAKE) -C tests all
	$(MAKE) -C doc all
	$(MAKE) -C dev all
	rm -f lock-file

test:
	$(MAKE) -C unit all
	
testc:
	$(MAKE) -C tests testc
	$(MAKE) -C doc testc
	$(MAKE) -C 4.0 testc
	$(MAKE) -C dev testc

