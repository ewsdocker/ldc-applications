#!/bin/bash

echo
echo "*********** ffquantum stable ***********"
echo

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
	[[ $? -eq 0 ]] || return $?

    return 0
}

# =========================================================================
#
#	installArchive
#		download & install requested Archive
#
#   Enter:
#		instPkg = "package" name downloaded - what you are going to extract from
#		instUrl = server to download the pkg from
#
# =========================================================================
function installArchive()
{
	local instPkg="${1}"
	local instUrl="${2}"
	local instDir="${3}"

    wget "${instUrl}"
    [[ $? -eq 0 ]] || return $?

    tar -xvf ${instPkg} -C "${instDir}"
    [[ $? -eq 0 ]] || return $?

    rm "${instPkg}"

    return 0
}

# =========================================================================

apt-get -y update

addPkg "apt-get -y install"

# =========================================================================

addPkg "desktop-file-utils"
addPkg "dmidecode"

addPkg "gdisk"

addPkg "gvfs"
addPkg "gvfs-bin"
addPkg "gvfs-common"
addPkg "gvfs-daemons"
addPkg "gvfs-libs"

addPkg "libaacs0"

addPkg "libatasmart4"

addPkg "libblockdev-fs2"
addPkg "libblockdev-loop2"
addPkg "libblockdev-part-err2"
addPkg "libblockdev-part2"
addPkg "libblockdev-swap2"
addPkg "libblockdev-utils2"
addPkg "libblockdev2"

addPkg "libbluray2"

addPkg "libcanberra0"
addPkg "libcanberra-gtk0"
addPkg "libcanberra-gtk-module"
addPkg "libcanberra-pulse"

addPkg "libevent-2.1-6"
addPkg "libevent-core-2.1-6"
addPkg "libevent-pthreads-2.1-6"

addPkg "libgck-1-0"
addPkg "libgcr-base-3-1"
addPkg "libglib2.0-bin"
addPkg "libglib2.0-data"

addPkg "libnspr4"
addPkg "libnss3"

addPkg "libparted-fs-resize0"
addPkg "libparted2"
addPkg "libudisks2-0"

addPkg "libv4l-0"
addPkg "libv4lconvert0"
addPkg "libvorbisfile3"

addPkg "lsof"

addPkg "parted"

addPkg "sound-theme-freedesktop"

addPkg "udev"
addPkg "udisks2"

# =======================================================================

installList

apt-get clean all 

# =========================================================================

installArchive "${FFOX_PKG}" "${FFOX_URL}" "${FFOX_DIR}"
[[ $? -eq 0 ]] || exit $?

mkdir -p ~/.cache/dconf
chmod 775 ~/.cache/dconf

# =======================================================================

echo
echo "****************************************"
echo

chmod 775 /${FFOX_DIR}/${FFOX_GENERIC}/${LRUN_APP} 
ln -s /${FFOX_DIR}/${FFOX_GENERIC}/${LRUN_APP} /usr/bin/${LRUN_APP} 

exit 0
