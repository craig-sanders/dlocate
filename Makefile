#! /usr/bin/make -f

all:

clean: 

install:
	install -m 755 dlocate $(DESTDIR)/usr/bin/
	install -m 755 update-dlocatedb $(DESTDIR)/usr/sbin/
	#install -m 755 update-dpkg-list $(DESTDIR)/usr/sbin/
