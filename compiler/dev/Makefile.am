all:
	'$(MONO)' ../2.0/dnc.exe -V > buildlog
	'$(MONO)' ../2.0/dnc.exe pc2dn.dyl | tee -a buildlog
	'$(MONO)' ../2.0/dnc.exe pc2cd.dyl | tee -a buildlog

prodscript:
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" pc2curdir.in > pc2curdir
	sed -e "s|\@libdir\@|$(libdir)|g" \
	    -e "s|\@MONO\@|$(MONO)|g" pc2dylandotnet.in > pc2dylandotnet
	
install: prodscript 
	$(install_sh_PROGRAM) pc2dylandotnet $(DESTDIR)$(bindir)/pc2dylandotnet
	chmod a+x $(DESTDIR)$(bindir)/pc2dylandotnet
	$(install_sh_PROGRAM) pc2curdir $(DESTDIR)$(bindir)/pc2curdir
	chmod a+x $(DESTDIR)$(bindir)/pc2curdir
	$(install_sh_PROGRAM) pc2dn.exe $(DESTDIR)$(libdir)/dylandotnet-dev/pc2dn.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-dev/pc2dn.exe
	$(install_sh_PROGRAM) pc2cd.exe $(DESTDIR)$(libdir)/dylandotnet-dev/pc2cd.exe
	chmod -x $(DESTDIR)$(libdir)/dylandotnet-dev/pc2cd.exe
	
	if [[ $(host) =~ i686-pc-linux-gnu ]] ; then \
		$(MONO) --aot $(DESTDIR)$(libdir)/dylandotnet-dev/*.exe; \
	fi
	
uninstall:
	rm -f $(DESTDIR)$(bindir)/pc2dylandotnet
	rm -f $(DESTDIR)$(bindir)/pc2curdir
	rm -r -f $(DESTDIR)$(libdir)/dylandotnet-dev
clean:
	rm -f *.exe

distclean: clean
	rm -f Makefile	

testc:
	echo 'hello'
