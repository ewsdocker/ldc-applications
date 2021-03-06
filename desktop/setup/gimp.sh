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

addPkg "gimp"
addPkg "gimp-data"
addPkg "gimp-data-extras"
addPkg "gtk2-engines-pixbuf"

addPkg "libaa1"
addPkg "libamd2"
addPkg "libavformat58"

addPkg "libbabl-0.1-0"
addPkg "libblas3"
addPkg "libbluray2"

addPkg "libcaca0"
addPkg "libcamd2"
addPkg "libccolamd2"
addPkg "libcholmod3"
addPkg "libchromaprint1"
addPkg "libcolamd2"
addPkg "libcupsimage2"

addPkg "libde265-0"
 
addPkg "libexiv2-14"

addPkg "libgegl-0.4-0"
addPkg "libgegl-common"
addPkg "libgexiv2-2"
addPkg "libgimp2.0"
addPkg "libgme0"
addPkg "libgpm2"
addPkg "libgs9"
addPkg "libgs9-common"

addPkg "libheif1"

addPkg "libijs-0.35"
addPkg "libilmbase23"

addPkg "libjbig2dec0"

addPkg "liblapack3"

addPkg "libmetis5"
addPkg "libmng1"
addPkg "libmpg123-0"
addPkg "libmypaint-1.3-0"
addPkg "libmypaint-common"

addPkg "libnspr4"
addPkg "libnss3"

addPkg "libopenexr23"
addPkg "libopenmpt0"

addPkg "libpaper1"
addPkg "libpoppler-glib8"
addPkg "libpoppler82"

addPkg "libraw19"

addPkg "libsdl1.2debian"
addPkg "libssh-gcrypt-4"
addPkg "libsuitesparseconfig5"
addPkg "libswscale5"

addPkg "libumfpack5"

addPkg "libvorbisfile3"

addPkg "libwebpdemux2"
addPkg "libwmf0.2-7"

addPkg "pixmap"
addPkg "poppler-data"

# =======================================================================

installList

apt-get clean all
