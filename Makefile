VER = 0.1.0

PREFIX ?= /usr
SHAREDIR ?= $(PREFIX)/share
MANDIR ?= $(PREFIX)/man
DOCDIR ?= $(PREFIX)/doc
BINDIR ?= $(PREFIX)/bin

all:
	@echo
	@echo \'make install\' will install wclock under the specified DESTDIR.
	@echo
	@echo \'make uninstall\' will remove wclock from the specified DESTDIR.
	@echo
	@echo \'make clean\' will remove the zipped man page and doc from the source directory. 
	@echo

install:
	@echo
	@rm -rf man-gz
	@cp -v --preserve=mode,timestamps --dereference wclock $(DESTDIR)$(BINDIR)
	@chmod 755 $(DESTDIR)$(BINDIR)/wclock
	@mkdir man-gz
	@cp -v --preserve=mode,timestamps man/* man-gz
	@cp -v --preserve=mode,timestamps man-gz/* $(DESTDIR)$(MANDIR)/man1
	@gzip man-gz/*
	@mkdir -p doc
	@cp -v --preserve=mode,timestamps ./LICENSE doc/
	@cp -v --preserve=mode,timestamps ./SIMPLEMAPS-LICENSE doc/
	@cp -v --preserve=mode,timestamps ./README doc/
	@mkdir -pv $(DESTDIR)$(DOCDIR)/wclock-$(VER)
	@cp -v --preserve=mode,timestamps doc/* $(DESTDIR)$(DOCDIR)/wclock/$(VER)
	@mkdir -pv $(DESTDIR)$(SHAREDIR)/wclock
	@cp -v --preserve=mode,timestamps share/* $(DESTDIR)$(SHAREDIR)/wclock
	@chmod 644 $(DESTDIR)$(SHAREDIR)/wclock/*
	@echo
	@echo Done.
	@echo

clean:
	@echo
	@rm -rvf man-gz
	@rm -rvf doc
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
