#! /bin/bash

# quick check to make sure i've updated VERSION_BANNER in the script
# to match the latest changelog entry.
CV=$(awk -F'[()]' '/^dlocate/ {print $2; nextfile}' ./debian/changelog)
SV=$(awk -F'"' '/^[[:space:]]*VERSION_BANNER=/ {print $2; nextfile}' ./dlocate)

if [ "$CV" != "$SV" ] ; then
  echo
  echo "Version banner mismatch:"
  echo "  CHANGELOG='$CV'"
  echo "     SCRIPT='$SV'"
  echo
  exit 1
fi
 
