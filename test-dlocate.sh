#!/bin/bash

# simple script to test
# run like so:
#
# ./test-dlocate.sh > new.output 2>&1 ; diff -u test.output new.output
#
# or just 'make test'

FILE="/usr/bin/dlocate /usr/sbin/cron /usr/bin/dpkg /usr/bin/apt"
NONFILE=/tmp/foo/bar/filedoesnotexist

EXIST="dlocate bash dpkg apt"
NOTEXIST=packagedoesnotexist
EMPTY="xmp"

for opt in " " "-S" ; do
  for file in $FILE $NONFILE; do
    echo '-------------------------------'
    echo "running: ./dlocate $opt $file"
    ./dlocate -v $opt $file
    echo '-------------------------------'
    echo
  done
done

for opt in -l -du -conf -lsconf -md5sum -md5check -man -lsman -lsbin ; do
  for pkg in $EXIST $NOTEXIST $EMPTY ; do
    echo '-------------------------------'
    echo "running: ./dlocate $opt $pkg"
    ./dlocate -v $opt $pkg
    echo '-------------------------------'
    echo
  done
done

