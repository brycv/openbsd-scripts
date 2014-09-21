#!/bin/sh
#
################################################################################
#
# Copyright (c) 2014, Bryan Vyhmeister <bryan@bsdjournal.net>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
################################################################################
#
# Title: cvsn.sh
# Version: 0.5.2
#
# This script simply checks out the src, xenocara, and ports trees for the
# version of OpenBSD set by REL_VERSION.
#
################################################################################
#
# You should choose an anoncvs mirror outside the US unless you are in the US.
# See http://www.openbsd.org/anoncvs.html for a list of mirrors. Change the
# CVSROOT variable as needed. Also, change the REL_VERSION to the version of
# the OpenBSD tree you would like to checkout. This script is designed to be
# run as root which may not be the best way of doing things.

CVSROOT="anoncvs@anoncvs3.usa.openbsd.org:/cvs"
REL_VERSION="OPENBSD_5_5"

################################################################################

export CVSROOT
export REL_VERSION

cd /usr
cvs -q get -P -r${REL_VERSION} src
cvs -q get -P -r${REL_VERSION} xenocara
cvs -q get -P -r${REL_VERSION} ports
