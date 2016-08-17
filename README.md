openbsd-scripts
===============

This is my personal collection of simple OpenBSD shell scripts for various
purposes. Right now all of the scripts are designed to be run as root but 
this will probably change in the future. The scripts are rather simple and 
will be improved as needed in the future.

### cvs_cur.sh

This script simply checks out the -current version of the OpenBSD source tree.

### cvs_rel.sh

This script simply checks out whatever version of the OpenBSD source tree is
specified in the variables of the script.

### build-current

This scripts builds part or all of the system based on what is in /usr/src 
and /usr/xenocara. This script could also be used to build OpenBSD-stable as 
well. I use it to rebuild my OpenBSD-current system from source.

### build-release

This script builds a release based on what has already been built by some 
other means such as build-current. The release ends up in /usr/rel.

### build_stable.sh

This script is designed to help you build OpenBSD-stable based on whatever you
have in /usr/src and /usr/xenocara. By default it is set to build GENERIC and
not GENERIC.MP although this can be changed.

### build_release.sh

This script takes what has already been done by build_stable.sh and builds a
full release in /usr/rel.

### snap

This script is intended to be run from /bin/root with ~/bin appearing in PATH.
It provides a quick means to download the latest OpenBSD-current snapshot and
then install that snapshot to your system. This is not designed to be used with
a standard OpenBSD release but with OpenBSD-current.

### update-cvs

This script is intended to both fetch the OpenBSD src, ports, and/or xenocara 
trees from CVS. It is currently configured for OpenBSD-current but could be 
modified to also support a release.
