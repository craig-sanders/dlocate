# dlocate for Debian

Fast alternative to 'dpkg -L', 'dpkg -S' etc.

NOTE: `dlocate -l` is NOT the same as `dpkg -l`.  It uses regular
expressions for searches rather than glob-like wildcards.

`dlocate -l` is a regexp-enhanced emulation of `dpkg -l`, not an exact clone.

---

NOTE: Version 2 has been rewritten in perl. The code is a lot cleaner, better
structured with functions, and fixes a lot of old bugs, as well as adding some
new features (like using -I with -l to list only installed packages).  All
regexes are perl regexes.

Version 2 has one major incompatibily with previous versions.  The old,
long-deprecated single-dash long options are no longer supported and only the
double-dash long options work. e.g. `dlocate -lsman` has been replaced by
`dlocate --lsman`.  If you have any scripts that use these deprecated options,
you will have to update them.

Also, as of dlocate 2.10, the old dpkg-hold, dpkg-unhold, dpkg-purge, and
dpkg-remove scripts have been removed from dlocate.  They were deprecated years
ago because apt-mark does the same things but better.  Again, if you use these
in your own scripts, you will need to update them.

