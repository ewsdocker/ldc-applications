# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for desktop (gui) applications.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2017-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package desktop
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2017-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/desktop.
#
#   ewsdocker/desktop is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/desktop is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/desktop.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-stack"
ARG FROM_VERS="dgtk2-x11"
ARG FROM_EXT="-0.1.0"
ARG FROM_EXT_MOD="-b3"

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

ARG LIB_HOST
ARG LIB_NAME
ARG LIB_VERSION
ARG LIB_VERS_MOD
ARG LIB_INSTALL

# =========================================================================

ARG DIA_VER
ARG DIA_REL
ARG DIA_HOST

# =========================================================================

ARG GIMP_VER
ARG GIMP_REL
ARG GIMP_HOST

# =========================================================================

ARG MPAD_VER
ARG MPAD_REL
ARG MPAD_HOST

# =========================================================================

ARG RIPME_VER
ARG RIPME_EXT
ARG RIPME_HOST

# =========================================================================

ARG SHOTCUT_VER
ARG SHOTCUT_EXT
ARG SHOTCUT_HOST

# =========================================================================

ARG OBSSTUDIO_VER

# =========================================================================

ARG DNAME

# ========================================================================================

ARG OPT_DEBUG
ARG OPT_TIMEOUT
ARG OPT_QUIET

# ========================================================================================

ENV DSTACK=${DNAME:-"NONE"}

# =========================================================================
# =========================================================================
#
#    Shotcut v 20.04.12
#       https://github.com/mltframework/shotcut/releases/download/v20.04.12/shotcut-linux-x86_64-200412.txz
#
# =========================================================================
# =========================================================================

ENV SCUT_REL=${SHOTCUT_REL:-"20.04.12"} \
    SCUT_VER=${SHOTCUT_VER:-"200412"} 

ENV SCUT_HOST=${SHOTCUT_HOST:-"https://github.com/mltframework/shotcut/releases/download/v${SCUT_VER}"} \
    SCUT_PKG="shotcut-linux-x86_64-${SCUT_VER}.txz"  

ENV SCUT_URL=${SCUT_HOST}/${SCUT_PKG} 

## =========================================================================
# =========================================================================
#
#    Gimp v 2.10.10
#       http://pirbot.com/mirrors/gimp/gimp/v2.10/gimp-2.10.10.tar.bz2
#
# =========================================================================
# =========================================================================

ENV GMP_REL=${GIMP_REL:-"2.10"} \
    GMP_VER=${GIMP_VER:-"2.10.10"} 

ENV GMP_HOST=${GIMP_HOST:-"http://pirbot.com/mirrors/gimp/gimp/v${GMP_VER}"} \
    GMP_PKG="gimp-${GMP_VER}.tar.bz2"  

ENV GMP_URL=${GMP_HOST}/${GMP_PKG} 

# ========================================================================================
#
#    RipMe
#     https://github.com/RipMeApp/ripme/releases/download/1.7.94/ripme.jar
#     https://github.com/RipMeApp/ripme/releases/download/1.7.92/ripme.jar
#     https://github.com/RipMeApp/ripme/releases/download/1.7.88/ripme.jar
#     https://github.com/RipMeApp/ripme/releases/download/1.7.89/ripme.jar
#
# ========================================================================================

ENV LMSRIP_HOST=${RIPME_HOST:-"https://github.com/RipMeApp/ripme/releases/download"} \
    LMSRIP_VER=${RIPME_VER:-"1.7"}${RIPME_EXT:-".94"}

ENV LMSRIP_NAME=${LMSRIP_VER}/ripme.jar

ENV LMSRIP_URL=${LMSRIP_HOST}/${LMSRIP_NAME}

# =========================================================================
# =========================================================================
#
#    Dia v 0.97.3
#
# =========================================================================
# =========================================================================

ENV \
    LRUN_APP=${RUN_APP:-"dia"} \
    \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"gui"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"1"} \
    LMSOPT_DEBUG=${OPT_DEBUG:-"0"} \
    \
    LMS_BASE="/usr/local" \
    LMS_HOME= \
    LMS_CONF= \
    \
    LMS_REGISTRY=${BUILD_REGISTRY:-""} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    \
    LMS_NAME=${BUILD_NAME:-"desktop"} \
    LMS_VERSION=${BUILD_VERSION:-"ddia"} \
    LMS_VERS_EXT=${BUILD_VERS_EXT:-"-0.1.0"}${BUILD_EXT_MOD} \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Graphics"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"Dia"} \
    LMS_ICON=${BUILD_ICON:-"default.png"} \
    \
    LMS_FROM="${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}"

ENV LMS_PACKAGE="${LMS_PARENT}, Dia v. ${DIA_VER:-"0.97.3"}"

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}"

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}"

ENV DSTACK=${DNAME:-"NONE"}

# =========================================================================
# =========================================================================
#
# https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-0.1.6/ldc-library-0.1.6-b3.tar.gz
#
# =========================================================================
# =========================================================================

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
# =========================================================================

VOLUME /artwork
VOLUME /pictures
VOLUME /workspace
VOLUME /www

# =========================================================================
# =========================================================================

COPY scripts/. /
COPY setup/. /lmstmp/

# =========================================================================
# =========================================================================

RUN chmod +x /lmstmp/*.sh \
 \
 && apt-get -y update \
 \
 # =======================================================================================
 #
 #    
 #
 # =======================================================================================
 \
 && case ${DSTACK} in \
     "DIA")        /lmstmp/dia.sh       ;; \
     "GIMP")       /lmstmp/gimp.sh      ;; \
     "MPAD")       /lmstmp/mpad.sh      ;; \
     "OBS")        /lmstmp/obsstudio.sh ;; \
     "RIPME")      /lmstmp/ripme.sh     ;; \
     "SHOTCUT")	   /lmstmp/shotcut.sh   ;; \
     *)            echo "unknown selection \"${DSTACK}\""; exit 1 ;; \
    esac \
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
 #   download and install ldc-library
 #
 # =========================================================================
 \
 && if test "${LMSLIB_INST}" = "1"; then cd / ; wget "${LMSLIB_URL}"; tar -xvf "${LMSLIB_PKG}"; rm "${LMSLIB_PKG}"; cd /root; fi \
 \
 # =========================================================================
 #
 #   clean-up apt
 #
 # =========================================================================
 \
 && apt-get clean all \
 && rm -Rf /lmstmp \
 \
 # =========================================================================
 #
 #   register the build with /etc/ewsdocker-builds.txt
 #
 # =========================================================================
 \
 && printf "${LMS_DOCKER} (${LMS_PARENT}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

ENTRYPOINT [ "/etc/lms/entrypoint.sh" ]
