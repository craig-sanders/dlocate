#! /bin/bash

PWD=$(pwd)
BASEDIR=$(basename $PWD)
VERSION=$(echo $BASEDIR | sed -e 's/.*-//' | sed -e 's/ //g')

SCRIPT_VERSION=$(grep 'VERSION_BANNER=' ./dlocate | \
                 grep -v '#' | \
                 sed -e 's/"//g' -e 's/VERSION_BANNER=//' \
                     -e 's/ //g')

if [ "$VERSION" != "$SCRIPT_VERSION" ] ; then
  echo
  echo "Version banner mismatch:"
  echo "    DIRECTORY = '$VERSION'"
  echo "    SCRIPT    = '$SCRIPT_VERSION'"
  echo
  exit 1
fi
 
