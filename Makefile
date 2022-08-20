VER = 0.1.4.2022c

PREFIX ?= /usr
SHAREDIR ?= $(PREFIX)/share
MANDIR ?= $(SHAREDIR)/man
DOCDIR ?= $(SHAREDIR)/doc
BINDIR ?= $(PREFIX)/bin
ZONEINFO ?=
TIMESETTER ?=

all:
	@echo
	@echo \'make install\' will install wclock under the specified DESTDIR.
	@echo
	@echo \'make uninstall\' will remove wclock from the specified DESTDIR.
	@echo
	@echo \'make clean\' will remove the zipped man page and doc from the source directory. 
	@echo

install:
	@chmod +x ./validate-zoneinfo
	@./validate-zoneinfo $(ZONEINFO) MAKEFILE
	@chmod +x ./validate-timesetter
	@./validate-timesetter
	@chmod a-x ./validate-zoneinfo
	@chmod a-x ./validate-timesetter
	@mkdir -p $(DESTDIR)$(BINDIR)
	@sed 's|SHAREDIR=|SHAREDIR=$(SHAREDIR)|' wclock > wclock2
	@sed -i 's|VER=|VER=$(VER)|' wclock2
	@sed -i 's|ZONEPRELIM=|ZONEPRELIM=$(ZONEINFO)|' wclock2
	@sed -i 's|TIMESETTER=|TIMESETTER=$(TIMESETTER)|' wclock2
	@echo
	@rm -rf man-gz
	@cp -v -L wclock2 $(DESTDIR)$(BINDIR)/wclock
	@rm -f wclock2
	@chmod 755 $(DESTDIR)$(BINDIR)/wclock
	@mkdir man-gz
	@sed 's|SHAREDIR|$(SHAREDIR)|g' man/wclock.1 > man/wclock.1.2
	@sed -i 's|DOCDIR|$(DOCDIR)|g' man/wclock.1.2
	@cp -v -L man/wclock.1.2 man-gz/wclock.1
	@rm -f man/wclock.1.2
	@gzip man-gz/*
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -v -L man-gz/* $(DESTDIR)$(MANDIR)/man1
	@mkdir -p doc
	@cp -v -L ./LICENSE doc/
	@cp -v -L ./SIMPLEMAPS doc/
	@cp -v -L ./README doc/
	@cp -v -L ./ATTRIBUTION doc/
	@cp -v -L ./INSTALL doc/
	@chmod 644 doc/* 
	@mkdir -p $(DESTDIR)$(DOCDIR)/wclock-$(VER)
	@cp -v -L doc/* $(DESTDIR)$(DOCDIR)/wclock-$(VER)
	@mkdir -p $(DESTDIR)$(SHAREDIR)/wclock
	@cp -v -L share/* $(DESTDIR)$(SHAREDIR)/wclock
	@chmod 644 $(DESTDIR)$(SHAREDIR)/wclock/compat
	@chmod 644 $(DESTDIR)$(SHAREDIR)/wclock/extras
	@chmod 644 $(DESTDIR)$(SHAREDIR)/wclock/deprecated
	@echo PREFIX=$(PREFIX) > LOG
	@echo SHAREDIR=$(SHAREDIR) >> LOG
	@echo MANDIR=$(MANDIR) >> LOG
	@echo DOCDIR=$(DOCDIR) >> LOG
	@echo BINDIR=$(BINDIR) >> LOG
	@echo ZONEINFO=$(ZONEINFO) >> LOG
	@echo TIMESETTER=$(TIMESETTER) >> LOG
	@echo
	@echo Done. The variables have been saved to ./LOG.
	@echo

clean:
	@echo
	@rm -rvf man-gz
	@rm -rvf doc
	@chmod a-x ./validate-zoneinfo
	@chmod a-x ./validate-timesetter
	@echo
	
uninstall:
	@echo
	@rm -vf $(DESTDIR)$(BINDIR)/wclock
	@rm -vf $(DESTDIR)$(MANDIR)/man1/wclock.1*
	@rm -rvf $(DESTDIR)$(SHAREDIR)/wclock
	@rm -rvf $(DESTDIR)$(DOCDIR)/wclock-$(VER)
	@echo
	@echo Done
	@echo
