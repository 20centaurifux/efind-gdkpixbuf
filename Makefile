PREFIX?=/usr
CC=gcc
CFLAGS=-Wall -std=c99 -fPIC -O2 -nostartfiles -shared `pkg-config --cflags gdk-pixbuf-2.0`
LIBS=`pkg-config --libs gdk-pixbuf-2.0`

MACHINE:=$(shell uname -m)

ifeq ($(MACHINE), x86_64)
	LIBDIR?=$(PREFIX)/lib64
else
	LIBDIR?=$(PREFIX)/lib
endif

VERSION=0.2.1

all:
	$(CC) $(CFLAGS) $(INC) ./gdkpixbuf.c -o ./gdkpixbuf.so $(LDFLAGS) $(LIBS)

clean:
	rm -f ./gdkpixbuf.so

install:
	test -d "$(DESTDIR)$(LIBDIR)/efind/extensions" || mkdir -p "$(DESTDIR)$(LIBDIR)/efind/extensions"
	cp ./gdkpixbuf.so "$(DESTDIR)$(LIBDIR)/efind/extensions"
	chmod 755 "$(DESTDIR)$(LIBDIR)/efind/extensions/gdkpixbuf.so"

uninstall:
	rm -f "$(DESTDIR)$(LIBDIR)/efind/extensions/gdkpixbuf.so"

tarball:
	cd .. && \
	rm -rf ./efind-gdkpixbuf-$(VERSION) && \
	cp -r ./efind-gdkpixbuf ./efind-gdkpixbuf-$(VERSION) && \
	find ./efind-gdkpixbuf-$(VERSION) -name ".git*" | xargs rm -r && \
	tar cfJ ./efind-gdkpixbuf-$(VERSION).tar.xz ./efind-gdkpixbuf-$(VERSION) --remove-files 
