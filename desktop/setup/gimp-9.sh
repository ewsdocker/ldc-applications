#!/bin/bash

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

addPkg "apt-get -y install"

addPkg "desktop-file-utils"

addPkg "fonts-droid-fallback"

#addPkg "ghostscript"

addPkg "gimp"
addPkg "gimp-data"
addPkg "gimp-data-extras"

#addPkg "gimp-help-common"
#addPkg "gimp-help-en"

#addPkg "gpm" "General Purpose Mouse interface"

#addPkg "gsfonts"

addPkg "gvfs" "userspace virtual filesystem"
addPkg "gvfs-backends"
addPkg "gvfs-common"
addPkg "gvfs-daemons"
addPkg "gvfs-libs"

addPkg "libaa1"
addPkg "libaacs0"

addPkg "libamd2"

addPkg "libarchive13"
addPkg "libasm4-java"

addPkg "libatasmart4"

addPkg "libavahi-glib1"
addPkg "libavformat57"

addPkg "libbabl-0.1-0"
addPkg "libblas-common"
addPkg "libblas3"

addPkg "libbluray-bdj"
addPkg "libbluray1"

addPkg "libcaca0"
addPkg "libcamd2"

addPkg "libccolamd2"

addPkg "libcdio-cdda1"
addPkg "libcdio-paranoia1"
addPkg "libcdio13"

addPkg "libcholmod3"

addPkg "libchromaprint1"

addPkg "libcolamd2"

addPkg "libcupsfilters1"
addPkg "libcupsimage2"

addPkg "libexif12"

addPkg "libgck-1-0"

addPkg "libgcr-3-common"
addPkg "libgcr-base-3-1"

addPkg "libgd3"

addPkg "libgdata-common"
addPkg "libgdata22"

addPkg "libgegl-0.3-0"

addPkg "libgimp2.0"

addPkg "libgme0"

addPkg "libgoa-1.0-0b"
addPkg "libgoa-1.0-common"

addPkg "libgphoto2-6"
addPkg "libgphoto2-port12"

addPkg "libgpm2"

addPkg "libgs9"
addPkg "libgs9-common"

addPkg "libijs-0.35"

addPkg "libilmbase12"

addPkg "libimobiledevice6"

addPkg "libjbig2dec0"

addPkg "liblapack3"
addPkg "libldb1"

addPkg "liblzo2-2"

addPkg "libmetis5"

addPkg "libmng1"

addPkg "libmpg123-0"

addPkg "libmtp-common"
addPkg "libmtp9"

addPkg "libnfs8"

addPkg "liboauth0"

addPkg "libopenexr22"
addPkg "libopenmpt0"

addPkg "libpaper-utils"
addPkg "libpaper1"

addPkg "libparted2"

addPkg "libplist3"

addPkg "libpoppler-glib8"
addPkg "libpoppler64"

addPkg "libpython2.7"

addPkg "libraw15"
addPkg "librsvg2-bin"

addPkg "libsdl1.2debian"

addPkg "libsmbclient"

addPkg "libssh-gcrypt-4"

addPkg "libsuitesparseconfig4"

addPkg "libswscale4"

addPkg "libtalloc2"
addPkg "libtevent0"

addPkg "libudisks2-0"
addPkg "libumfpack5"
addPkg "libusbmuxd4"

addPkg "libvorbisfile3"

addPkg "libwbclient0"
addPkg "libwmf0.2-7"

addPkg "parted"
addPkg "poppler-data"

addPkg "python-cairo"
addPkg "python-gobject-2"
addPkg "python-gtk2"

addPkg "python-numpy"
addPkg "python-talloc"

addPkg "samba-libs"

addPkg "udev"
addPkg "udisks2"

# =======================================================================

installList

apt-get clean all
