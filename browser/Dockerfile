# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for all browsers.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2017-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-browser
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2017-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/ldc-browser.
#
#   ewsdocker/ldc-browser is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/ldc-browser is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/ldc-browser.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-stack"
ARG FROM_VERS="dgtk3-x11"
ARG FROM_EXT="-0.1.0"
ARG FROM_EXT_MOD="-b3"

FROM ${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

MAINTAINER Jay Wheeler <ewsdocker@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
 
# =========================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

# =========================================================================

ARG LIB_HOST
ARG LIB_NAME
ARG LIB_VERSION
ARG LIB_VERS_MOD
ARG LIB_INSTALL

# =========================================================================

ARG RUN_APP

# =========================================================================

ARG BUILD_TEMPLATE
ARG BUILD_DAEMON

ARG BUILD_CATEGORIES
ARG BUILD_DESKTOP
ARG BUILD_ICON

ARG BUILD_REGISTRY
ARG BUILD_REPO

ARG BUILD_NAME 
ARG BUILD_VERSION
ARG BUILD_VERS_EXT
ARG BUILD_EXT_MOD

# =========================================================================

ARG OPT_QUIET
ARG OPT_TIMEOUT

# =========================================================================

ARG NETSURF_NAME
ARG NETSURF_GENERIC
ARG NETSURF_DIR
ARG NETSURF_HOST

# =========================================================================

ARG WATERFOX_NAME
ARG WATERFOX_GENERIC
ARG WATERFOX_DIR
ARG WATERFOX_HOST

# =========================================================================

ARG PALEMOON_NAME
ARG PALEMOON_GENERIC
ARG PALEMOON_DIR
ARG PALEMOON_HOST

# =========================================================================

ARG FIREFOX_NAME
ARG FIREFOX_GENERIC
ARG FIREFOX_DIR
ARG FIREFOX_HOST

# =========================================================================

ARG FLASH_VERS
ARG FLASH_NAME
ARG FLASH_HOST
ARG FLASH_INST

# =========================================================================

ARG DNAME

# =========================================================================

ARG BROWSER_LABEL
ARG BROWSER_RELEASE
ARG BROWSER_VERS

# =========================================================================
# =========================================================================

ENV DSTACK=${DNAME:-"UNKNOWN"}

# =========================================================================

ENV BRWSR_LABEL=${BROWSER_LABEL:-"NetSurf"} \
    BRWSR_RELEASE=${BROWSER_RELEASE:-"3.10-1"} \
    BRWSR_VERS=${BROWSER_VERS:-""}

# =========================================================================
# =========================================================================
#
#		NetSurf
#
# =========================================================================
#
# https://github.com/ewsdocker/debian-netsurf-packager/releases/download/9.5.3/netsurf-3.8-1-deb-gtk-x86_64.tar.gz
#
# =========================================================================
# =========================================================================

ENV NSURF_NAME="NetSurf" \
    NSURF_GENERIC="netsurf" \
    NSURF_DIR=${NETSURF_DIR:-"./netsurf"}

ENV NSURF_BUILDER="0.1.0-b3" \
    NSURF_BUILD=2

ENV NSURF_HOST=${NETSURF_HOST:-"https://github.com/ewsdocker/debian-netsurf-packager/releases/download/${NSURF_BUILDER}"} \
    NSURF_PKG="${NSURF_GENERIC}-${BRWSR_RELEASE}-${NSURF_BUILD}-deb-gtk-x86_64.tar.gz" 
    
ENV NSURF_URL="${NSURF_HOST}/${NSURF_PKG}"

# =========================================================================
# =========================================================================
#
#	Waterfox
#
# =========================================================================
#
# Classic:
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-classic-2020.06.en-US.linux-x86_64.tar.bz2
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-classic-2020.05.en-US.linux-x86_64.tar.bz2
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-classic-2019.12.en-US.linux-x86_64.tar.bz2
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-classic-2019.10.en-US.linux-x86_64.tar.bz2
# Current (Modern):
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-current-2020.06.en-US.linux-x86_64.tar.bz2
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-current-2020.05.en-US.linux-x86_64.tar.bz2
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-current-2019.12.en-US.linux-x86_64.tar.bz2
#   wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-current-2019.10.en-US.linux-x86_64.tar.bz2
#
# =========================================================================
# =========================================================================

ENV WFOX_NAME=${WATERFOX_NAME:-"Waterfox Current"} \
    WFOX_GENERIC=${WATERFOX_GENERIC:-"waterfox-current"} \
    WFOX_DIR=${WATERFOX_DIR:-"/opt"}

ENV WFOX_PKG="${WFOX_GENERIC}-${BRWSR_RELEASE}.${BRWSR_VERS}.en-US.linux-x86_64.tar.bz2" 
ENV WFOX_HOST=${WATERFOX_HOST:-"https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/${WFOX_PKG}"}

ENV WFOX_URL="${WFOX_HOST}/${WFOX_PKG}"

# =========================================================================
# =========================================================================
#
#		Pale Moon
#
# =========================================================================
# =========================================================================
#
# The latest release is available from
#	http://linux.palemoon.org/download/mainline/
#
#   http://linux.palemoon.org/datastore/release/palemoon-28.10.0.linux-x86_64.tar.xz
#   http://linux.palemoon.org/datastore/release/palemoon-28.9.3.linux-x86_64.tar.xz
#   http://linux.palemoon.org/datastore/release/palemoon-28.8.0.linux-x86_64.tar.xz
#	http://linux.palemoon.org/datastore/release/palemoon-28.7.2.linux-x86_64.tar.bz2
#
# =========================================================================
# =========================================================================

ENV PMOON_NAME=${PALEMOON_NAME:-"Pale Moon"} \
    PMOON_GENERIC=${PALEMOON_GENERIC:-"palemoon"} \
    PMOON_DIR=${PALEMOON_DIR:-"/opt"} 

ENV PMOON_PKG="${PMOON_GENERIC}-${BROWSER_RELEASE}.${BROWSER_VERS}.linux-x86_64.tar.xz" \
    PMOON_HOST=${PALEMOON_HOST:-"http://linux.palemoon.org/datastore/release"}

ENV PMOON_URL="${PMOON_HOST}/${PMOON_PKG}"

# =========================================================================
# =========================================================================
#
#		FireFox Quantum
#
# =========================================================================
#
# wget http://ftp.mozilla.org/pub/firefox/releases/77.0.1/linux-x86_64/en-US/firefox-77.0.1.tar.bz2
# wget http://ftp.mozilla.org/pub/firefox/releases/76.0.1/linux-x86_64/en-US/firefox-76.0.1.tar.bz2
# wget http://ftp.mozilla.org/pub/firefox/releases/72.0.2/linux-x86_64/en-US/firefox-72.0.2.tar.bz2
# wget http://ftp.mozilla.org/pub/firefox/releases/70.0.1/linux-x86_64/en-US/firefox-70.0.1.tar.bz2
#
# =========================================================================
# =========================================================================

ENV FFOX_NAME="Firefox" \
    FFOX_GENERIC="firefox" \
    FFOX_DIR=${FIREFOX_DIR:-"/opt"}

ENV FFOX_PKG="firefox-${BROWSER_RELEASE}.${BROWSER_VERS}.tar.bz2" \
    FFOX_HOST=${FIREFOX_HOST:-"http://ftp.mozilla.org/pub/firefox/releases/${BROWSER_RELEASE}.${BROWSER_VERS}/linux-x86_64/en-US"}

ENV FFOX_URL="${FFOX_HOST}/${FFOX_PKG}"

# =========================================================================
# =========================================================================

ENV \
    LRUN_APP=${RUN_APP:-"firefox"} \
    \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"gui"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"1"} \
    \
    LMS_BASE="/usr/local" \
    LMS_HOME= \
    LMS_CONF= \
    \
    LMSINSTALL_LIB=${LIB_INSTALL:-"0"}  \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Network"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"Firefox Quantum"} \
    LMS_ICON=${BUILD_ICON:-"Firefox-esrSmall.png"} \
    \
    LMS_FROM="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    \
    LMS_NAME=${BUILD_NAME:-"ldc-browser"} \
    LMS_VERSION=${BUILD_VERSION:-"browsers"} \
    \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-0.1.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-""} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" \
    LMS_PACKAGE="${LMS_PARENT}, ${BRWSR_LABEL} ${BRWSR_RELEASE}.${BRWSR_VERS}"

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}" 

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}" 

# ========================================================================================
# ========================================================================================
#
# https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-0.1.6/ldc-library-0.1.6-b3.tar.gz
#
# ========================================================================================
# ========================================================================================

ENV LMSLIB_INST=${LIB_INSTALL:-"0"} \
    LMSLIB_NAME=${LIB_NAME:-"ldc-library"} \
    LMSLIB_VERS=${LIB_VERSION:-"0.1.6"} \
    LMSLIB_VERS_MOD=${LIB_VERS_MOD:-"-b3"}

ENV LMSLIB_HOST=${LIB_HOST:-"https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-${LMSLIB_VERS}"}

ENV LMSLIB_VERSION="${LMSLIB_VERS}${LMSLIB_VERS_MOD}"
ENV LMSLIB_FULLNAME="${LMSLIB_NAME}-${LMSLIB_VERSION}"

ENV LMSLIB_PKG=${LMSLIB_FULLNAME}.tar.gz 

ENV LMSLIB_URL=${LMSLIB_HOST}/${LMSLIB_PKG}

# ========================================================================================

ENV LMSOPT_QUIET=${OPT_QUIET:-"0"}

# =========================================================================

VOLUME /Downloads
VOLUME /source

# =========================================================================

COPY scripts/. /
COPY setup/. /tmp/

# =========================================================================

RUN chmod +x /tmp/*.sh \
 \
 # =========================================================================
 #
 #   Install support libraries and applications
 #
 # =========================================================================
 \
 && mkdir -p /opt \
 \
 && apt-get -y update \
 && apt-get -y upgrade \
 \
 && case ${DSTACK} in \
 	  "FQUANT")  /tmp/ffquantum.sh           ;; \
      "FFOX")    /tmp/firefox-un.sh          ;; \
      "EFOX")    /tmp/firefox-esr.sh         ;; \
 	  "NETSURF") /tmp/netsurf-testing.sh     ;; \
 	  "PMOON")   /tmp/palemoon.sh            ;; \
 	  "WFOX")    /tmp/waterfox.sh            ;; \
 	  "WCFOX")   /tmp/waterfox-current.sh    ;; \
      *)         echo "UNKNOWN STACK NAME: ${DSTACK}"; exit 1 ;; \
 esac \
 \
 && apt-get clean all \
 \
 # =========================================================================
 #
 #   installFlash
 #
 # =========================================================================
 \
 &&  if test "${FLINST}" = "1"; then wget ${FLURL}; mkdir -p ${FLDIR}; tar -xvf ${FLNAME} -C ${FLDIR}; rm ${FLNAME}; fi \
 \
 # =========================================================================
 #
 #   download and install ldc-library
 #
 # =========================================================================
 \
 && if test "${LMSLIB_INST}" = "1"; then cd / ; wget "${LMSLIB_URL}"; tar -xvf "${LMSLIB_PKG}"; rm "${LMSLIB_PKG}"; cd \root; fi \
 \
 # ========================================================================
 #
 #   setup libraries and applications to run
 #
 # ========================================================================
 \
 && mkdir -p /usr/bin/lms \
 && mkdir -p /usr/local/bin \
 && mkdir -p /usr/local/share/applications \
 \
 && chmod +x /usr/local/bin/*.* \
 && chmod +x /usr/local/bin/* \
 \
 && chmod +x /usr/bin/lms/*.* \
 && chmod +x /usr/bin/lms/* \
 && chmod +x /etc/lms/*.sh \
 \
 && chmod +x /my_init \
 && chmod +x /my_service \
 \
 # =========================================================================
 #
 #   Register Browser in build chain
 #
 # =========================================================================
 \
 && printf "${LMS_DOCKER} (${LMS_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

ENTRYPOINT ["/etc/lms/entrypoint.sh"]

