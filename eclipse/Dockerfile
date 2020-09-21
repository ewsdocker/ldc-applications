# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for Eclipse IDE in a Debian container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2016-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-applications/eclipse
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2016-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/ldc-applications.
#
#   ewsdocker/ldc-applications is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/ldc-applications is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/ldc-applications.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-base"
ARG FROM_VERS="dx11-surface"
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

ARG DNAME

# =========================================================================

ARG ECLIPSE_HOST
ARG ECLIPSE_IDE
ARG ECLIPSE_RELEASE
ARG ECLIPSE_VERS

ARG ECLIPSE_DIR

# =========================================================================

ARG RUN_APP

# =========================================================================

ARG BUILD_REGISTRY
ARG BUILD_REPO

ARG BUILD_NAME 
ARG BUILD_VERSION
ARG BUILD_VERS_EXT
ARG BUILD_EXT_MOD

# =========================================================================

ARG BUILD_CATEGORIES
ARG BUILD_TEMPLATE
ARG BUILD_DAEMON

# =========================================================================

ARG BUILD_CATEGORIES
ARG BUILD_DESKTOP
ARG BUILD_ICON

# =========================================================================

ARG OPT_DEBUG
ARG OPT_TIMEOUT
ARG OPT_QUIET

# =========================================================================
#
#	Plugin arguments
#
# =========================================================================

ARG PLUGINS
ARG PLUGINS_ONLY

# ========================================================================================

ARG CC_VER
ARG CC_TYPE

# ========================================================================================

ARG FORTRAN_VER

# =========================================================================

ARG GTK_VER
ARG GTK_COMMON

# =========================================================================

ARG JDK_RELEASE 
ARG JDK_VERS 
ARG JDK_HOST
ARG JDK_TYPE

ARG JDK_BUILD

# =========================================================================

ARG NODEJS_BASH
ARG NODEJS_HOST
ARG NODEJS_VER

# =========================================================================

ARG NPM_INSTALL

# =========================================================================

ARG PHP_PLUGIN
ARG PHP_PLUGIN_COMP

# =========================================================================
#
#	Plugin Environment declarations
#
# =========================================================================

ENV PLUGIN_LIST=${PLUGINS:-""} \
    PLUGIN_ONLY=${PLUGINS_ONLY:-"0"}

# =========================================================================

ENV OJDK_RELEASE=${JDK_RELEASE:-"jdk11"} \
    OJDK_VERS=${JDK_VERS:-"13.0.1"} \
    OJDK_TYPE=${JDK_TYPE:-""}

ENV OJDK_PKG="openjdk-${OJDK_VERS}_linux-x64_bin.tar.gz" 

ENV OJDK_HOST=${JDK_HOST:-"https://download.java.net/java/GA/jdk11/9/GPL/"}
ENV OJDK_URL="${OJDK_HOST}/${OJDK_PKG}" \
    \
    LMS_JDK=${JDK_BUILD:-"jdk11"} 
 
# =========================================================================

ENV FOR_VER=${FORTRAN_VER:-"FORTRAN8"} 

# ========================================================================================

ENV GTKVER=${GTK_VER:-"GTK3"}

# =========================================================================

ENV CCVER=${CC_VER:-"8"} \ 
    CCTYPE=${CC_TYPE:-"CC"}

# =========================================================================

ENV NJS_BASH=${NODEJS_BASH:-""}

ENV NJS_VER=${NODEJS_VER:-"14"} \
    NJS_HOST=${NODEJS_HOST:-"https://deb.nodesource.com"} \
    NJS_DIR="NodeJS" 

ENV NJS_NAME="setup_${NJS_VER}.x" 
ENV NJS_URL=${NJS_HOST}/${NJS_NAME}  

# =========================================================================

ENV NPM_LIST=${NPM_INSTALL:-""}

# =========================================================================
# =========================================================================
#
#	To add ShellWax after install bash-lanauage-server,
#		- start eclipse
#		- select Help/Install New Software from menu,
# 		- select Add button and fill in the form:
#			Name:     ShellWax
#           Location: https://download.eclipse.org/shellwax/snapshots/
#		- pull-down the Uncatagorized selection and enable ShellWax
#		- Follow install instructions.
#
# =========================================================================
# =========================================================================

ENV PHP_VER=${PHP_PLUGIN:-""}
ENV PHP_COMPOSER=${PHP_PLUGIN_COMP:-""}

# =========================================================================
# =========================================================================
#
# URL:		HOST/RELEASE/VERSION/PACKAGE
# HOST:		http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release
# PACKAGE:	eclipse-IDE-RELEASE-VERSION-linux-gtk-x86_64.tar.gz
#
# =========================================================================
#
# RELEASE:	2020-09
# VERSION:	M1
# IDE:
#	cpp:		eclipse-cpp-2020-09-M1-linux-gtk-x86_64.tar.gz
#	java:		eclipse-java-2020-09-M1-linux-gtk-x86_64.tar.gz
#	javascript:	eclipse-javascript-2020-09-M1-linux-gtk-x86_64.tar.gz
#	php:		eclipse-php-2020-09-M1-linux-gtk-x86_64.tar.gz
#	rust:		eclipse-rust-2020-09-M1-linux-gtk-x86_64.tar.gz
#
# =========================================================================
#
# RELEASE:	2020-06
# VERSION:	M3
# IDE:
#	cpp:		eclipse-cpp-2020-06-M3-linux-gtk-x86_64.tar.gz
#	java:		eclipse-java-2020-06-M3-linux-gtk-x86_64.tar.gz
#	javascript:	eclipse-javascript-2020-06-M3-linux-gtk-x86_64.tar.gz
#	php:		eclipse-php-2020-06-M3-linux-gtk-x86_64.tar.gz
#
# =========================================================================
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
    EC_RELEASE=${ECLIPSE_RELEASE:-"2020-09"} \
    EC_VERS=${ECLIPSE_VERS:-"M1"} \
    \
    EC_DIR=${ECLIPSE_DIR:-"eclipse"} 

ENV EC_PKG="eclipse-${EC_IDE}-${EC_RELEASE}-${EC_VERS}-linux-gtk-x86_64.tar.gz" \
    EC_HOST=${ECLIPSE_HOST:-"http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/${EC_RELEASE}/${EC_VERS}"}

ENV EC_URL="${EC_HOST}/${EC_PKG}"

# =========================================================================

ENV DSTACK=${DNAME:-""}

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
    LMS_NAME=${BUILD_NAME:-"eclipse"} \
    LMS_VERSION=${BUILD_VERSION:-"dcdt"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-0.1.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-""} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" \
    LMS_PACKAGE="${LMS_PARENT}, ${LMS_DESKTOP} ${EC_RELEASE}-${EC_VERS}"

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}"

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}"

# =========================================================================

VOLUME /library
VOLUME /source
VOLUME /userbin
VOLUME /workspace

# =========================================================================

COPY scripts/. /
COPY setup/. /dockerSetup/

# =========================================================================

RUN chmod +x /dockerSetup/*.sh \
 \
 && echo "" \
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
 #    Pre-installing plugins to satisfy dependencies
 #
 # =========================================================================
 \
 && /dockerSetup/plugins.sh \
  \
 # =========================================================================
 #
 #    ECLIPSE IDE
 #
 # =========================================================================
 \
 && if test "${PLUGIN_ONLY}" = "0"; then /dockerSetup/IDE.sh ; fi \
 \
 && rm -Rf /dockerSetup \
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
