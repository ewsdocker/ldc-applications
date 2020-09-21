#!/bin/bash

echo
echo "*********** install-bash-server ***********"
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

# =======================================================================
#
#	install-node-js
#
#	NJS_URL = njsUrl
#   NJS_NAME = njsName
#
# =======================================================================
function install-node-js()
{
	local njsUrl="${1}"
	local njsName="${2}"

    wget ${njsUrl}
    [[ $? -eq 0 ]] || return $?

    chmod +x ${njsName}
    [[ $? -eq 0 ]] || return $?

    ./${njsName}
    [[ $? -eq 0 ]] || return $?

    rm ${njsName}
    
    apt-get -y update
    [[ $? -eq 0 ]] || return $?

	return 0
}

# =======================================================================
# =======================================================================

echo "Installing ${NJS_NAME} to APT Archive ($?)"

install-node-js "${NJS_URL}" "${NJS_NAME}"
[[ $? -eq 0 ]] ||
 {
	echo "Unable to install ${NJS_NAME} to APT Archive ($?)"
	exit $?
 }

# =======================================================================

addPkg "apt-get -y install"

addPkg "build-essential"

addPkg "dpkg-dev"

addPkg "libdpkg-perl"

addPkg "nodejs"

echo ""
echo "$instList"
echo ""

$instList
[[ $? -eq 0 ]] ||
 {
	"Unable to install ${NJS_NAME} to APT Archive"
	exit $?
 }

apt-get clean all

# =========================================================================

echo ""
echo "Installing bash-language-server"
echo ""

npm i -g bash-language-server
[[ $? -eq 0 ]] || 
 {
	"Unable to install bash-language-server ($?)"
	exit $?
 }

# =======================================================================
# =======================================================================
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
# =======================================================================
# =======================================================================

exit 0
