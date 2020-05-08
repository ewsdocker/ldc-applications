# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for Eclipse in a Debian container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2016-2019. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-eclipse
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2016-2019. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/ldc-eclipse.
#
#   ewsdocker/ldc-eclipse is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/ldc-eclipse is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/ldc-eclipse.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-lang"
ARG FROM_VERS="djdk13-gtk3"
ARG FROM_EXT="-0.1.0"
ARG FROM_EXT_MOD=""

FROM ${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# =========================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

# =========================================================================

ARG ECLIPSE_HOST
ARG ECLIPSE_IDE
ARG ECLIPSE_RELEASE
ARG ECLIPSE_VERS

ARG ECLIPSE_DIR

# =========================================================================

ARG RUN_APP

# ========================================================================================

ARG LIB_HOST
ARG LIB_NAME
ARG LIB_VERSION
ARG LIB_VERS_MOD
ARG LIB_INSTALL

# ========================================================================================

ARG BUILD_REGISTRY
ARG BUILD_REPO

ARG BUILD_NAME 
ARG BUILD_VERSION
ARG BUILD_VERS_EXT
ARG BUILD_EXT_MOD

# ========================================================================================

ARG BUILD_CATEGORIES
ARG BUILD_TEMPLATE
ARG BUILD_DAEMON

# ========================================================================================

ARG BUILD_CATEGORIES
ARG BUILD_DESKTOP
ARG BUILD_ICON

# ========================================================================================

ARG OPT_DEBUG
ARG OPT_TIMEOUT
ARG OPT_QUIET

# =========================================================================
# =========================================================================
#
# URL:		HOST/RELEASE/VERSION/PACKAGE
# HOST:		http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release
# PACKAGE:	eclipse-IDE-RELEASE-VERSION-linux-gtk-x86_64.tar.gz
#
# RELEASE:	2019-12
# VERSION:	M2
# IDE:
#	cpp:		eclipse-cpp-2019-12-M2-linux-gtk-x86_64.tar.gz
#	java:		eclipse-java-2019-12-M2-linux-gtk-x86_64.tar.gz
#	javascript:	eclipse-javascript-2019-12-M2-linux-gtk-x86_64.tar.gz
#	php:		eclipse-php-2019-12-M2-linux-gtk-x86_64.tar.gz
#
# RELEASE:	2019-12
# VERSION:	M1
# IDE:
#	cpp:		eclipse-cpp-2019-12-M1-linux-gtk-x86_64.tar.gz
#	java:		eclipse-java-2019-12-M1-linux-gtk-x86_64.tar.gz
#	javascript:	eclipse-javascript-2019-12-M1-linux-gtk-x86_64.tar.gz
#	php:		eclipse-php-2019-12-M1-linux-gtk-x86_64.tar.gz
#
# =========================================================================
#
# RELEASE:	2019-09
# VERSION:	M3
# IDE:
#	cpp:		eclipse-cpp-2019-09-M3-linux-gtk-x86_64.tar.gz
#	java:		eclipse-java-2019-09-M3-linux-gtk-x86_64.tar.gz
#	javascript:	eclipse-javascript-2019-09-M3-linux-gtk-x86_64.tar.gz
#	php:		eclipse-php-2019-09-M3-linux-gtk-x86_64.tar.gz
#
# =========================================================================
# =========================================================================

ENV EC_IDE=${ECLIPSE_IDE:-"cpp"} \
    \
    EC_RELEASE=${ECLIPSE_RELEASE:-"2019-12"} \
    EC_VERS=${ECLIPSE_VERS:-"M2"} \
    \
    EC_DIR=${ECLIPSE_DIR:-"eclipse"} 

ENV EC_PKG="eclipse-${EC_IDE}-${EC_RELEASE}-${EC_VERS}-linux-gtk-x86_64.tar.gz" \
    EC_HOST=${ECLIPSE_HOST:-"http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/${EC_RELEASE}/${EC_VERS}"}

ENV EC_URL="${EC_HOST}/${EC_PKG}"

# =========================================================================

ENV \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"gui"} \
    LRUN_APP=${RUN_APP:-"eclipse"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"1"} \
    LMSOPT_DEBUG=${OPT_DEBUG:-"0"} \
    \
    LMS_BASE="/usr/local" \
    LMS_HOME= \
    LMS_CONF= \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Development"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"Eclipse IDE CDT"} \
    LMS_ICON=${BUILD_ICON:-"Cpp.png"} \
    \
    LMS_FROM="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY:-""} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    \
    LMS_NAME=${BUILD_NAME:-"ldc-eclipse"} \
    LMS_VERSION=${BUILD_VERSION:-"dcdt"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-0.1.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-""} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" \
    LMS_PACKAGE="${LMS_PARENT}, ${LMS_DESKTOP} ${EC_RELEASE}-${EC_VERS}"

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}"

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}"

# ========================================================================================
# ========================================================================================
#
# https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-0.1.6/ldc-library-0.1.6-b1.tar.gz
#
# ========================================================================================
# ========================================================================================

ENV LMSLIB_INST=${LIB_INSTALL:-"0"} \
    LMSLIB_NAME=${LIB_NAME:-"ldc-library"} \
    LMSLIB_VERS=${LIB_VERSION:-"0.1.6"} \
    LMSLIB_VERS_MOD=${LIB_VERS_MOD:-""}

ENV LMSLIB_HOST=${LIB_HOST:-"https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-${LMSLIB_VERS}"}

ENV LMSLIB_VERSION="${LMSLIB_VERS}${LMSLIB_VERS_MOD}"
ENV LMSLIB_FULLNAME="${LMSLIB_NAME}-${LMSLIB_VERSION}"

ENV LMSLIB_PKG=${LMSLIB_FULLNAME}.tar.gz 

ENV LMSLIB_URL=${LMSLIB_HOST}/${LMSLIB_PKG}

# =========================================================================

VOLUME /library
VOLUME /source
VOLUME /userbin
VOLUME /workspace

# =========================================================================

COPY scripts/. /

# =========================================================================

RUN echo "" \
 && echo "**************************************************" \
 && echo "" \
 && echo "Building: ${LMS_DESKTOP} - ${LMS_DOCKER}" \
 && echo "From:     ${LMS_PARENT}" \
 && echo "" \
 && echo "**************************************************" \
 && echo "" \
 \
 # =========================================================================
 #
 #    ECLIPSE IDE
 #
 # =========================================================================
 \
 && echo ""; echo "   **** Installing ${LMS_DESKTOP} ****"; echo "" \
 && cd /usr/local/share \
 &&   wget ${EC_URL}; tar -xvf ${EC_PKG}; rm ${EC_PKG} \
 && ln -s /usr/local/share/${EC_DIR}/eclipse /usr/bin/eclipse \
 \
 # =========================================================================
 #
 #   download and install ldc-library
 #
 # =========================================================================
 \
 && if test "${LMSLIB_INST}" = "1"; then echo ""; echo "   **** Installing ldc-library ****"; echo ""; fi \
 && if test "${LMSLIB_INST}" = "1"; then cd / ; wget "${LMSLIB_URL}"; tar -xvf "${LMSLIB_PKG}"; rm "${LMSLIB_PKG}"; cd /root; fi \
 \
 # ========================================================================
 #
 #   setup folders and permissions
 #
 # ========================================================================
 && mkdir -p /usr/local/bin \
 \
 && chmod +x /etc/lms/*.sh \
 && chmod +x /my_init \
 && chmod +x /my_service \
 && chmod +x /usr/bin/lms/*.* \
 && chmod +x /usr/bin/lms/* \
 && chmod +x /usr/local/bin/*.* \
 && chmod +x /usr/local/bin/* \
 \
 # =========================================================================
 #
 #   register the build with /etc/ewsdocker-builds.txt
 #
 # =========================================================================
 \
 && printf "${LMS_DOCKER} (${LMS_PARENT}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt \
 \
 # =========================================================================
 #
 #   Exit message on the display
 #
 # =========================================================================
 && echo "" \
 && echo "**************************************************" \
 && echo "" \
 && echo "Exiting: ${LMS_DESKTOP} - ${LMS_DOCKER}" \
 && echo "From:     ${LMS_PARENT}" \
 && echo "" \
 && echo "**************************************************" \
 && echo "" 

# =========================================================================

ENTRYPOINT [ "/etc/lms/entrypoint.sh" ]
