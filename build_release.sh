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
# Title: build_release.sh
# Version: 0.5
#
################################################################################
#
# Variables for release building. If you need to adjust the LOGPATH, this is
# where to do it. This script assumes you have already run the build_stable.sh
# script as well.

export DESTDIR=/usr/dest
export RELEASEDIR=/usr/rel
LOGPATH=/logs

################################################################################

mkdir -p ${DESTDIR} ${RELEASEDIR} ${LOGPATH}

TIMESTAMP=`date +%Y%m%d%H%M%S`

rlog=${LOGPATH}/log_build_release_${TIMESTAMP}
xrlog=${LOGPATH}/log_build_xrelease_${TIMESTAMP}

buildrel() {
	cd /usr/src/etc
	make release >> ${rlog} 2>&1
	return 0
}

buildxrel() {
	cd /usr/xenocara
	make release >> ${xrlog} 2>&1
	return 0
}

main() {
	buildrel
	buildxrel
	sh /usr/src/distrib/sets && sh checkflist
	cd /usr/rel
	ls -nT > index.txt
}

main &
