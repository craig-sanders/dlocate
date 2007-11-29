#! /usr/bin/make -f

all:

clean: 
	rm -rf debian/dlocate debian/dlocate.substvars debian/files build-stamp install-stamp new.output

install:
	install -m 755 dlocate $(DESTDIR)/usr/bin/
	install -m 755 update-dlocatedb $(DESTDIR)/usr/sbin/
	install -m 755 dpkg-hold $(DESTDIR)/usr/sbin/
	install -m 755 dpkg-unhold $(DESTDIR)/usr/sbin/
	install -m 755 dpkg-remove $(DESTDIR)/usr/sbin/
	install -m 755 dpkg-purge $(DESTDIR)/usr/sbin/
	#install -m 755 update-dpkg-list $(DESTDIR)/usr/sbin/

update-test:
	./test-dlocate.sh > test.output 2>&1

test:
	./check-version-banner.sh
	./test-dlocate.sh > new.output 2>&1
	diff -u test.output new.output


