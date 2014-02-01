buildlog:
	cp -u ../4.0/dnu.dll dnu.dll
	'$(MONO)' ../4.0/dnc.exe -V > buildlog

%.exe : %.dyl
	'$(MONO)' ../4.0/dnc.exe $< | tee -a buildlog

pc2dn.exe: pc2dn.dyl ./../config.status ./../config.log

pc2cd.exe: pc2cd.dyl ./../config.status ./../config.log

nuget2dn.exe: nuget2dn.dyl ./../config.status ./../config.log

all: buildlog pc2dn.exe pc2cd.exe nuget2dn.exe

prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" pc2curdir.in > pc2curdir
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" pc2dylandotnet.in > pc2dylandotnet
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" nuget2dylandotnet.in > nuget2dylandotnet
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" resproc.in > resproc
	
install: prodscript 
	$(install_sh_PROGRAM) pc2dylandotnet $(DESTDIR)$(bindir)/pc2dylandotnet
	chmod a+x $(DESTDIR)$(bindir)/pc2dylandotnet
	$(install_sh_PROGRAM) pc2curdir $(DESTDIR)$(bindir)/pc2curdir
	chmod a+x $(DESTDIR)$(bindir)/pc2curdir
	$(install_sh_PROGRAM) nuget2dylandotnet $(DESTDIR)$(bindir)/nuget2dylandotnet
	chmod a+x $(DESTDIR)$(bindir)/nuget2dylandotnet
	$(install_sh_PROGRAM) resproc $(DESTDIR)$(bindir)/resproc
	chmod a+x $(DESTDIR)$(bindir)/resproc
	$(install_sh_PROGRAM) pc2dn.exe $(DESTDIR)$(libdir)/dylandotnet-dev/pc2dn.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-dev/pc2dn.exe
	$(install_sh_PROGRAM) pc2cd.exe $(DESTDIR)$(libdir)/dylandotnet-dev/pc2cd.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-dev/pc2cd.exe
	$(install_sh_PROGRAM) nuget2dn.exe $(DESTDIR)$(libdir)/dylandotnet-dev/nuget2dn.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-dev/nuget2dn.exe
	$(install_sh_PROGRAM) resproc.exe $(DESTDIR)$(libdir)/dylandotnet-dev/resproc.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-dev/resproc.exe
	$(install_sh_PROGRAM) dnu.dll $(DESTDIR)$(libdir)/dylandotnet-dev/dnu.dll
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-dev/dnu.dll
if AOT	
	if [[ $(host) =~ i686-pc-linux-gnu ]] ; then \
		$(MONO) --aot $(DESTDIR)$(libdir)/dylandotnet-dev/*.exe; \
		$(MONO) --aot $(DESTDIR)$(libdir)/dylandotnet-dev/*.dll; \
	fi
endif
	
uninstall:
	rm -f $(DESTDIR)$(bindir)/pc2dylandotnet
	rm -f $(DESTDIR)$(bindir)/pc2curdir
	rm -f $(DESTDIR)$(bindir)/nuget2dylandotnet
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet-dev
clean:
	rm -f *.exe

distclean: clean
	rm -f Makefile	

testc:
	echo 'hello'

.PHONY: buildlog all install uninstall clean distclean testc
