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
	[[ $? -eq 0 ]] || return $?

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

mv /tmp/99defaultrelease /etc/apt/apt.conf.d/99defaultrelease
mv /tmp/unstable.list /etc/apt/sources.list.d/unstable.list

chmod 644 /etc/apt/apt.conf.d/99defaultrelease
chmod 644 /etc/apt/sources.list.d/unstable.list

echo "****************************************"
echo
echo "     installing firefox \"unstable\" "
echo
echo "****************************************"

apt-get -y update

apt-get -t unstable install -y firefox
[[ $? -eq 0 ]] || return $?

apt-get clean all

echo
echo "****************************************"
echo
