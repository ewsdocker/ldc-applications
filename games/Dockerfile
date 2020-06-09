# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for games.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2019-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/games
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2019-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/games.
#
#   ewsdocker/games is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/games is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/games.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-stack-base"
ARG FROM_VERS="dgtk-gtk3"
ARG FROM_EXT="-0.1.0"
ARG FROM_EXT_MOD=""

FROM ${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

MAINTAINER Jay Wheeler <earthwalksoftware@gmail.com>

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

ARG AISLERIOT_HOST
ARG AISLERIOT_VERS

# ========================================================================================

ARG MAHJONGG_HOST
ARG MAHJONGG_VERS

# ========================================================================================

ARG LIB_HOST
ARG LIB_NAME
ARG LIB_VERSION
ARG LIB_VERS_MOD
ARG LIB_INSTALL

# ========================================================================================

ARG BUILD_GAME

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

ARG BUILD_DESKTOP
ARG BUILD_ICON

# ========================================================================================

ARG OPT_DEBUG
ARG OPT_TIMEOUT
ARG OPT_QUIET

# ========================================================================================
# ========================================================================================

ENV DEBIAN_FRONTEND noninteractive 

# ========================================================================================
# ========================================================================================
#
#  Buster:
#   AisleRiot deb package name:
#		aisleriot_3.22.7-2_amd64.deb
#	AisleRiot web page
#		https://packages.debian.org/buster/aisleriot
#	AisleRiot package download:
#       http://ftp.us.debian.org/debian/pool/main/a/aisleriot/aisleriot_3.22.7-2_amd64.deb
#
#  Stretch:
#   AisleRiot deb package name:
#		aisleriot_3.22.1-1_amd64.deb
#	AisleRiot web page
#		https://packages.debian.org/stretch/aisleriot
#	AisleRiot package download:
#       http://ftp.us.debian.org/debian/pool/main/a/aisleriot/aisleriot_3.22.1-1_amd64.deb
#
# ========================================================================================
# ========================================================================================

ENV LMSSOL_VERS=${AISLERIOT_VERS:-"3.22.7-2"} \
    LMSSOL_NAME="aisleriot"

ENV LMSSOL_HOST=${AISLERIOT_HOST:-"http://ftp.us.debian.org/debian/pool/main/a/${LMSSOL_NAME}"} \
    LMSSOL_PKG="${LMSSOL_NAME}_${LMSSOL_VERS}_amd64.deb"

ENV LMSSOL_URL=${LMSSOL_HOST}/${LMSSOL_PKG}

# ========================================================================================
# ========================================================================================
#
#  buster:
#     Mahjongg deb package name:
#		gnome-mahjongg_3.22.0-4_amd64.deb
#	  Mahjongg web page
#		https://packages.debian.org/buster/gnome-mahjongg
#	  Mahjongg package download:
#       http://ftp.us.debian.org/debian/pool/main/g/gnome-mahjongg/gnome-mahjongg_3.22.0-4_amd64.deb
#
#  stretch:
#     Mahjongg deb package name:
#		gnome-mahjongg_3.22.0-1_amd64.deb
#	  Mahjongg web page
#		https://packages.debian.org/stretch/gnome-mahjongg
#	  Mahjongg package download:
#       http://ftp.us.debian.org/debian/pool/main/g/gnome-mahjongg/gnome-mahjongg_3.22.0-1_amd64.deb
#
# ========================================================================================
# ========================================================================================

ENV LMSJ_VERS=${MAHJONGG_VERS:-"3.22.0-4"} \
    LMSJ_NAME="gnome-mahjongg"

ENV LMSJ_HOST=${MAHJONGG_HOST:-"https://packages.debian.org/stretch/amd64/${LMSJ_NAME}/download"} \
    LMSJ_PKG="${LMSJ_NAME}_${LMSJ_VERS}_amd64.deb"

ENV LMSJ_URL=${LMSJ_HOST}/${LMSJ_PKG}

# ========================================================================================
# ========================================================================================

ENV LRUN_APP=${RUN_APP:-"sol"} \
    LMS_GAME=${BUILD_GAME:-"SOL"}  

# ========================================================================================

ENV \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"gui"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"0"} \
    LMSOPT_DEBUG=${OPT_DEBUG:-"0"} \
    \
    LMS_BASE="/usr/local" \
    LMS_HOME= \
    LMS_CONF= \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Games"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"AisleRiot"} \
    LMS_ICON=${BUILD_ICON:-"${LMSSOL_NAME}"} \
    \
    LMS_FROM="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
 	\
    LMS_NAME=${BUILD_NAME:-"games"} \
    LMS_VERSION=${BUILD_VERSION:-"dgames"} \
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

ENV LMSLIB_INST=${LIB_INSTALL:-"0"} \
    LMSLIB_NAME=${LIB_NAME:-"ldc-library"} \
    LMSLIB_VERS=${LIB_VERSION:-"0.1.6"} \
    LMSLIB_VERS_MOD=${LIB_VERS_MOD:-""}

ENV LMSLIB_HOST=${LIB_HOST:-"https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-${LMSLIB_VERS}"}

ENV LMSLIB_VERSION="${LMSLIB_VERS}${LMSLIB_VERS_MOD}"
ENV LMSLIB_FULLNAME="${LMSLIB_NAME}-${LMSLIB_VERSION}"

ENV LMSLIB_PKG=${LMSLIB_FULLNAME}.tar.gz 

ENV LMSLIB_URL=${LMSLIB_HOST}/${LMSLIB_PKG}

# ========================================================================================

ENV PATH=$PATH:/usr/games

# ========================================================================================
#
#   	Install required scripts
#
# ========================================================================================

COPY scripts/. /
COPY setup/. /tmp/

# ========================================================================================
# ========================================================================================

# ========================================================================================
#
#		Set language to en_US.UTF-8
#
# ========================================================================================

RUN DEBIAN_FRONTEND=noninteractive \
 && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && dpkg-reconfigure --frontend=noninteractive locales

ENV LANG=en_US.utf8 \
    LANGUAGE=en_EN \
    LC_ALL=en_US.utf8 

# ========================================================================================
#
#		Build image
#
# ========================================================================================

RUN \
    chmod +x /tmp/*.sh \
 # =========================================================================
 #
 #   Emit Building message on the display
 #
 # =========================================================================
 && echo "" \
 && echo "**************************************************" \
 && echo "**************************************************" \
 && echo "" \
 && echo "Building: ${LMS_DESKTOP} - ${LMS_DOCKER}" \
 && echo "From:     ${LMS_PACKAGE}" \
 && echo "" \
 && echo "**************************************************" \
 && echo "**************************************************" \
 && echo "" \
 \
 # ========================================================================
 #
 #   update repos
 #
 # ========================================================================
 && apt-get -y update \
 \
 # =========================================================================
 #
 #   download and install AisleRiot
 #
 # =========================================================================
 \
 && case ${LMS_GAME} in \
     "SOL") /tmp/aisleriot.sh ;; \
     "MAJ") /tmp/mahjongg.sh  ;;  \
     *)     echo "unknown stack"; exit 1 ;; \
    esac \
 \
 # =========================================================================
 #
 #   download and install ldc-library
 #
 # =========================================================================
 && if test "${LMSLIB_INST}" = "1"; then cd / ; wget "${LMSLIB_URL}"; tar -xvf "${LMSLIB_PKG}"; rm "${LMSLIB_PKG}"; fi \
 \
 # ========================================================================
 #
 #   setup libraries and applications to run
 #
 # ========================================================================
 && chmod +x /usr/local/bin/*.* \
 && chmod +x /usr/local/bin/* \
 \
 && chmod -R 775 /usr/local/share/lms/.* \
 \
 && chmod +x /usr/bin/lms/*.* \
 && chmod +x /usr/bin/lms/* \
 \
 && chmod +x /etc/lms/*.sh \
 \
 && chmod +x /my_init \
 && chmod +x /my_service \
 \
 # ========================================================================
 #
 #   register the installed software
 #
 # ========================================================================
 \
 && printf "%s (%s), %s @ %s\n" ${LMS_DOCKER} ${LMS_PARENT} `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt \ 
 \
 # =========================================================================
 #
 #   clean up
 #
 # =========================================================================
 && apt-get clean all \
 \
 # =========================================================================
 #
 #   Exit message on the display
 #
 # =========================================================================
 && echo "" \
 && echo "**************************************************" \
 && echo "**************************************************" \
 && echo "" \
 && echo "Successfully built: ${LMS_DESKTOP} - ${LMS_DOCKER}" \
 && echo "From:               ${LMS_PACKAGE}" \
 && echo "" \
 && echo "**************************************************" \
 && echo "**************************************************" \
 && echo "" 

# =========================================================================
# =========================================================================

ENTRYPOINT [ "/etc/lms/entrypoint.sh" ]
