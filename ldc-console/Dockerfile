# ========================================================================================
# ========================================================================================
#
#    Dockerfile
#      Dockerfile for all console applications.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2019-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-console
# @subpackage Dockerfile
#
# ========================================================================================
#
#	Copyright © 2019-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/ldc-console.
#
#   ewsdocker/ldc-console is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/ldc-console is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/ldc-console.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# ========================================================================================
# ========================================================================================

ARG FROM_REPO="ewsdocker" 
ARG FROM_PARENT="ldc-console" 
ARG FROM_VERS="dbase" 
ARG FROM_EXT="-0.1.0" 
ARG FROM_EXT_MOD=""

FROM ${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# ========================================================================================
# ========================================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

# ========================================================================================

ARG RUN_APP

# ========================================================================================

ARG LIB_NAME
ARG LIB_VERSION
ARG LIB_VERS_MOD
ARG LIB_HOST
ARG LIB_INSTALL

# ========================================================================================

ARG CLI_APP

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

ARG OPT_DEBUG
ARG OPT_QUIET
ARG OPT_TIMEOUT

# ========================================================================================

ARG TMBLR_CAT
ARG TMBLR_LIMIT
ARG TMBLR_LISTS
ARG TMBLR_CATALOGS
ARG TMBLR_SITES

# ========================================================================================

ENV \
    TUMBLR_CAT=${TMBLR_CAT:-""} \
    TUMBLR_LIMIT=${TMBLR_LIMIT:-"200k"} \
    TUMBLR_LISTS=${TMBLR_LISTS:-"tumblr-lists"} \
    TUMBLR_CATALOGS=${TMBLR_CATALOGS:-"tumblr-catalogs"} \
    TUMBLR_SITES=${TMBLR_SITES:-"tumblr-sites"}

# ========================================================================================
# ========================================================================================

ENV \
    LRUN_APP=${RUN_APP:-"tumblr"} \
    \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"run"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"0"} \
    LMSOPT_DEBUG=${OPT_DEBUG:-"0"} \
    \
    LMS_BASE="/usr/local" \
    LMS_HOME= \
    LMS_CONF= \
    \
    LMS_CLI=${CLI_APP:-"TMBL"} \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Office"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"Tumblr"} \
    LMS_ICON=${BUILD_ICON:-"default.png"} \
    \
    LMS_FROM="${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
 	\
    LMS_NAME=${BUILD_NAME:-"ldc-console"} \
    LMS_VERSION=${BUILD_VERSION:-"console"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-0.1.0"} \
    \
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

ENV LMSLIB_NAME=${LIB_NAME:-"ldc-library"} \
    LMSLIB_VERS=${LIB_VERSION:-"0.1.6"} \
    LMSLIB_VERS_MOD=${LIB_VERS_MOD:-"-b1"}

ENV LMSLIB_HOST=${LIB_HOST:-"https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-${LMSLIB_VERS}"}

ENV LMSLIB_VERSION="${LMSLIB_VERS}${LMSLIB_VERS_MOD}"
ENV LMSLIB_FULLNAME="${LMSLIB_NAME}-${LMSLIB_VERSION}"

ENV LMSLIB_PKG=${LMSLIB_FULLNAME}.tar.gz 

ENV LMSLIB_URL=${LMSLIB_HOST}/${LMSLIB_PKG}

# ========================================================================================
# ========================================================================================

VOLUME /conf
VOLUME /usrlocal
VOLUME /data

# ========================================================================================
# ========================================================================================
#
#   install required scripts
#
# ========================================================================================
# ========================================================================================

COPY scripts/. /

# =========================================================================

RUN \
 # =========================================================================
 #
 #   download and install ldc-library
 #
 # =========================================================================
    if test "${LMSLIB_INST}" = "1"; then cd / ; wget "${LMSLIB_URL}"; tar -xvf "${LMSLIB_PKG}"; rm "${LMSLIB_PKG}"; fi \
 \
 # ========================================================================
 #
 #   setup libraries and applications to run
 #
 # ========================================================================
 \
 && mkdir -p /usr/local/bin \
 && mkdir -p /usr/bin/lms \
 \
 && chmod +x /usr/local/bin/*.* \
 && chmod +x /usr/local/bin/* \
 && chmod +x /usr/bin/lms/*.* \
 && chmod +x /usr/bin/lms/* \
 && chmod +x /etc/lms/*.sh \
 && chmod +x /my_init \
 && chmod +x /my_service \
 \
 && if test "${LMS_CLI}" = "TMBL"; then ln -s /usr/bin/lms/tumblr.sh /usr/bin/tumblr ; fi \
 \
 # ========================================================================
 #
 #   register the installed software
 #
 # ========================================================================
 \
 && printf "%s (%s), %s @ %s\n" ${LMS_DOCKER} ${LMS_PARENT} `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt  

# =========================================================================

ENTRYPOINT [ "/etc/lms/entrypoint.sh" ]
