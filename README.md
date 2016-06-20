# dlocate for Debian

Fast alternative to 'dpkg -L', 'dpkg -S' etc.

NOTE: `dlocate -l` is NOT the same as `dpkg -l`.  It uses regular
expressions for searches rather than glob-like wildcards.

`dlocate -l` is a regexp-enhanced emulation of `dpkg -l`, not an exact clone.

