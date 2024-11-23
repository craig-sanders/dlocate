#!/usr/bin/make -f

MANS = \
	dlocate.1 \
	dpkg-hold.8 \
	dpkg-purge.8 \
	dpkg-remove.8 \
	dpkg-unhold.8 \
	update-dlocatedb.8 \
	# EOL

PACKAGE_VERSION = $(shell dpkg-parsechangelog -SVersion)
SOURCE_DATE_EPOCH = $(shell dpkg-parsechangelog -STimestamp)
PACKAGE_RELEASE_DATE = $(shell date --date="@$(SOURCE_DATE_EPOCH)" -I)

POD2MAN = pod2man
POD2MAN_OPTS = \
	--utf \
	--center='dpkg suite' \
	--release='$(PACKAGE_VERSION)' \
	--date='$(PACKAGE_RELEASE_DATE)' \
	# EOL

all: man

clean:
	$(RM) $(MANS)

install:
	install -m 755 dlocate $(DESTDIR)/usr/bin/
	install -m 755 update-dlocatedb $(DESTDIR)/usr/sbin/
	install -m 755 updatedb $(DESTDIR)/usr/share/dlocate/
	install -m 755 update-dpkg-list $(DESTDIR)/usr/share/dlocate/
	install -m 644 spcrc-* $(DESTDIR)/usr/share/dlocate/
	install -m 755 dpkg-hold $(DESTDIR)/usr/sbin/
	install -m 755 dpkg-unhold $(DESTDIR)/usr/sbin/
	install -m 755 dpkg-remove $(DESTDIR)/usr/sbin/
	install -m 755 dpkg-purge $(DESTDIR)/usr/sbin/
	install -m 644 completion/bash/* $(DESTDIR)/usr/share/bash-completion/completions/

%.1 %.8: %.pod
	filename='$@'; \
	$(POD2MAN) $(POD2MAN_OPTS) \
		--name="$$(basename $${filename%.*})" \
		--section="$${filename##*.}" \
		$< >$@

man: $(MANS)

update-test:
	./test-dlocate.sh > test.output 2>&1

test:
	./test-dlocate.sh > new.output 2>&1
	diff -u test.output new.output

