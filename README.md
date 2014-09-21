openbsd-scripts
===============

Simple OpenBSD shell scripts for various purposes

### cvsn.sh

This script simple checks out whatever version of the OpenBSD source tree is
specified in the variables of the script.

### build_stable.sh

This script is designed to help you build OpenBSD-stable based on whatever you
have in /usr/src and /usr/xenocara. By default it is set to build GENERIC and
not GENERIC.MP although this can be changed.

### build_release.sh

This script takes what has already been done by build_stable.sh and builds a
full release in /usr/rel.
