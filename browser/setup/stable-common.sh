#!/bin/bash
# =========================================================================
# =========================================================================
#
#	stable-common
#	  install and setup 1 of 4 browsers using "stable" repo.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.0.1
# @copyright © 2019. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/ldc-browser
# @subpackage lms-setup
#
# =========================================================================
#
#	Copyright © 2019. EarthWalk Software
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

declare instList=" "

# =========================================================================
#
#	addPkg
#		add specified package to install list
#
#   Enter:
#		instPkg = "package" name to add to the installation list
#		instComment = comment... not used, but tolerated for documentation
#
# =========================================================================
function addPkg()
{
	local instPkg="${1}"
	local instComment="${2}"

    printf -v instList "%s %s" "${instList}" "${instPkg}"
    return 0
}

# =========================================================================
#
#	installList
#		the instList has been build, now execute it
#
#   Enter:
#		none
#
# =========================================================================
function installList()
{
	echo ""
	echo "$instList"
	echo ""

	$instList
	[[ $? -eq 0 ]] || exit $?

    return 0
}

# =========================================================================
#
#	installPackage
#		download & install requested package
#
#   Enter:
#		instPkg = "package" name downloaded - what you are going to extract from
#		instUrl = server to download the pkg from
#		instDir = directory to extract to
#
# =========================================================================
function installPackage()
{
	local instPkg="${1}"
	local instUrl="${2}"
	local instDir="${3}"

    wget "${instUrl}" 
    [[ $? -eq 0 ]] || return $?

    tar -xvf "${instPkg}" -C "${instDir}" 
    [[ $? -eq 0 ]] || return $?

    rm "${instPkg}"

    return 0
}

# =======================================================================

apt-get -y update

# =======================================================================

echo
echo "*********** stable-common ***********"
echo

addPkg "apt-get -y install"

addPkg "desktop-file-utils"

addPkg "gvfs"
addPkg "gvfs-bin"

addPkg "gvfs-common"
addPkg "gvfs-daemons"
addPkg "gvfs-libs libatasmart4"

addPkg "libaacs0"

addPkg "libbluray1"

addPkg "libcanberra-gtk0" "libcanberra GTK+ helper for playing event sounds"
addPkg "libcanberra-gtk-module" "translates GTK+ widgets signals to event sounds"
addPkg "libcanberra-pulse" "PulseAudio backend for libcanberra"
addPkg "libcanberra0" "simple abstract interface for playing event sounds"

addPkg "libevent-2.0-5"
addPkg "libevent-core-2.0-5"
addPkg "libevent-pthreads-2.0-5"

addPkg "libgck-1-0"

addPkg "libgcr-3-common"
addPkg "libgcr-base-3-1"

addPkg "libgudev-1.0-0"

addPkg "libnspr4"
addPkg "libnss3"

addPkg "libparted2"

addPkg "libsecret-1-0"
addPkg "libsecret-common"

addPkg "libudisks2-0"

addPkg "libv4l-0"
addPkg "libv4lconvert0"

addPkg "libvorbisfile3"

addPkg "parted"

addPkg "udev"
addPkg "udisks2"

# =======================================================================

installList

apt-get clean all 

echo
echo "****************************************"
echo


exit 0

