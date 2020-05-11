# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for Libre Office.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2017-2019. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package libre
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2017-2019. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/libre.
#
#   ewsdocker/libre is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/libre is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/libre.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-stack-base"
ARG FROM_VERS="dgtk3-x11"
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

ARG OFFICE_VER 
ARG OFFICE_REL
ARG OFFICE_LANG_VER
ARG OFFICE_LANG
ARG OFFICE_HOST

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

ARG BUILD_TEMPLATE
ARG BUILD_DAEMON
ARG BUILD_BASE

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

# =========================================================================
#
# LibreOffice download site:
#   https://download.documentfoundation.org/libreoffice/stable/6.3.4/deb/x86_64/LibreOffice_6.3.4_Linux_x86-64_deb.tar.gz
# Help pack
#   https://download.documentfoundation.org/libreoffice/stable/6.3.4/deb/x86_64/LibreOffice_6.3.4_Linux_x86-64_deb_helppack_en-US.tar.gz
#
# =========================================================================
#
# LibreOffice ${OFFICE_VER} for Debian 9 is available from the 
#    LibreOffice download site:
#
# https://download.documentfoundation.org/libreoffice/stable/${OFFICE_VER}/deb/x86_64/LibreOffice_${OFFICE_VER}_Linux_x86-64_deb.tar.gz
#
#    HOST: https://download.documentfoundation.org/libreoffice/stable/${OFFICE_VER}/deb/x86_64/
#
#    PKG:  LibreOffice_${OFFICE_VER}_Linux_x86-64_deb.tar.gz
#    DIR:  LibreOffice_${OFFICE_VER}.${OFFICE_LANG_VER}_Linux_x86-64_deb
#
# DIR can be determined at the LibreOffice download site or 
#     from inspecting the tarfile (tar -t): it occurs between
#     'libreoffice' and 'DEBS' in the installation directory path
#
# =========================================================================
#
#     help pack for US-en:
# https://download.documentfoundation.org/libreoffice/stable/${OFFICE_VER}/deb/x86_64/LibreOffice_${OFFICE_VER}_Linux_x86-64_deb_helppack_en-US.tar.gz
#
#    HLP_TAR:  LibreOffice_${OFFICE_VER}_Linux_x86-64_deb_helppack_en-US.tar.gz
#    HLP_DIR:  LibreOffice_${OFFICE_VER}.${OFFICE_LANG_VER}_Linux_x86-64_deb_helppack_en-US
#
# =========================================================================

ENV LIBRE_VER=${OFFICE_VER:-"6.3.4"} \
    LIBRE_REL=${OFFICE_REL:-"6.3"} \
    LIBRE_LANG_VER=${OFFICE_LANG_VER:-"2"} \
    LIBRE_LANG=${OFFICE_LANG:-"en-US"}

ENV LIBRE_HOST=${OFFICE_HOST:-"https://download.documentfoundation.org/libreoffice/stable/${LIBRE_VER}/deb/x86_64"} \
    LIBRE_PKG=LibreOffice_${LIBRE_VER}_Linux_x86-64_deb.tar.gz \
    LIBRE_DIR=LibreOffice_${LIBRE_VER}.${LIBRE_LANG_VER}_Linux_x86-64_deb 

ENV LIBRE_URL=${LIBRE_HOST}/${LIBRE_PKG} 

# =========================================================================

ENV HLP_TAR="LibreOffice_${LIBRE_VER}_Linux_x86-64_deb_helppack_${LIBRE_LANG}.tar.gz" \
    HLP_DIR="LibreOffice_${LIBRE_VER}.${LIBRE_LANG_VER}_Linux_x86-64_deb_helppack_${LIBRE_LANG}"

ENV HLP_URL="${LIBRE_HOST}/${HLP_TAR}" 

# =========================================================================

ENV LANG_TAR="LibreOffice_${LIBRE_VER}_Linux_x86-64_deb_langpack_${LIBRE_LANG}.tar.gz" \
    LANG_DIR="LibreOffice_${LIBRE_VER}.${LIBRE_LANG_VER}_Linux_x86-64_deb_langpack_${LIBRE_LANG}"

ENV LANG_URL="${LIBRE_HOST}/${LANG_TAR}" 

ENV LRUN_APP=${RUN_APP}

# =========================================================================

ENV \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"gui"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"1"} \
    LMSOPT_DEBUG=${OPT_DEBUG:-"0"} \
    \
    LMS_BASE=${BUILD_BASE:-"/usr/local"} \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Office"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"Office"} \
    LMS_ICON=${BUILD_ICON:-"libreoffice-logo-1.png"} \
    \
    LMS_FROM="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY:-""} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    \
    LMS_NAME=${BUILD_NAME:-"libre"} \
    LMS_VERSION=${BUILD_VERSION:-"doffice"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"0.1.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-""} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" \
    LMS_PACKAGE="${LMS_PARENT}, LibreOffice v ${LIBRE_VER}"

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

VOLUME /documents
VOLUME /Downloads
VOLUME /source

VOLUME /workspace

# =========================================================================

COPY scripts/. /
COPY setup/. /lmstmp/

# =========================================================================

RUN chmod +x /lmstmp/*.sh \
 \
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
 #   apt-get setup
 #
 # =========================================================================
 && apt-get -y update \
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
 # =========================================================================
 #
 #    LibreOffice
 #
 # =========================================================================
 # =========================================================================
 \
 && /lmstmp/libre.sh \
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
 \
 # =========================================================================
 #
 #   register the build with /etc/ewsdocker-builds.txt
 #
 # =========================================================================
 \
 && printf "${LMS_DOCKER} (${LMS_PARENT}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================
# =========================================================================

ENTRYPOINT [ "/etc/lms/entrypoint.sh" ]
