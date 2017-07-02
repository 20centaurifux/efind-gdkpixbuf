CC=gcc
CFLAGS=-Wall -std=c99 -fPIC -O2 -nostartfiles -shared `pkg-config --cflags gdk-pixbuf-2.0`
LIBS=`pkg-config --libs gdk-pixbuf-2.0`

VERSION=0.1.1

all:
	$(CC) $(CFLAGS) $(INC) ./gdkpixbuf.c -o ./gdkpixbuf.so $(LDFLAGS) $(LIBS)

clean:
	rm -f ./gdkpixbuf.so

install:
	test -d "$(DESTDIR)/etc/efind/extensions" || mkdir -p "$(DESTDIR)/etc/efind/extensions"
	cp ./gdkpixbuf.so "$(DESTDIR)/etc/efind/extensions"
	chmod 755 "$(DESTDIR)/etc/efind/extensions/gdkpixbuf.so"

uninstall:
	rm -f "$(DESTDIR)/etc/efind/extensions/gdkpixbuf.so"

tarball:
	cd .. && \
	rm -rf ./efind-gdkpixbuf-$(VERSION) && \
	cp -r ./efind-gdkpixbuf ./efind-gdkpixbuf-$(VERSION) && \
	find ./efind-gdkpixbuf-$(VERSION) -name ".git*" | xargs rm -r && \
	tar cfJ ./efind-gdkpixbuf-$(VERSION).tar.xz ./efind-gdkpixbuf-$(VERSION) --remove-files 
