#!/bin/sh
#
################################################################################
#
# Copyright (c) 2013-2016, Bryan Vyhmeister <bryan@bsdjournal.net>
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
# Title: build_stable.sh
# Version: 0.5.5
#
################################################################################
#
# If you need to adjust the LOGPATH, this is where to do it. This script is
# designed to be used before you run the build_release.sh script. It also makes
# things easier to checkout the source tree with the cvsn.sh script as well. By
# default, build the GENERIC kernel. Change the KERNEL variable to GENERIC.MP
# (typically the default on anything recent except for virtual machines) if
# needed. Currently, this script assumes it is being run from root which may
# not be the best approach. Additional changes would be required to modify this
# behavior.

LOGPATH=/logs
KERNEL=GENERIC

################################################################################

TIMESTAMP=`date +%Y%m%d%H%M%S`

KLOG=${LOGPATH}/log_build_kernel_${TIMESTAMP}
WLOG=${LOGPATH}/log_build_world_${TIMESTAMP}
XLOG=${LOGPATH}/log_build_xenocara_${TIMESTAMP}

mkdir -p ${LOGPATH}

buildkernel() {
	cd /usr/src/sys/arch/amd64/conf
	/usr/sbin/config ${KERNEL} >> ${KLOG} 2>&1
	cd /usr/src/sys/arch/amd64/compile/${KERNEL}
	make clean >> ${KLOG} 2>&1
	make >> ${KLOG} 2>&1
	make install >> ${KLOG} 2>&1
	return 0
}

buildworld() {
	rm -rf /usr/obj/*
	cd /usr/src
	make obj >> ${WLOG} 2>&1
	cd /usr/src/etc && env DESTDIR=/ make distrib-dirs >> ${WLOG} 2>&1
	cd /usr/src && make build >> ${WLOG} 2>&1
	return 0
}

buildxenocara() {
	cd /usr/xenocara
	rm -rf /usr/xobj/*
	make bootstrap >> ${XLOG} 2>&1
	make obj >> ${XLOG} 2>&1
	make build >> ${XLOG} 2>&1
	return 0
}

main() {
	buildkernel
	buildworld
	buildxenocara
}

main &
