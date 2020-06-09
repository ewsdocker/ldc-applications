#!/bin/bash
# =========================================================================
# =========================================================================
#
#	Waterfox Current
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.0.1
# @copyright © 2019-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/ldc-browser
# @subpackage waterfox-current
#
# =========================================================================
#
#	Copyright © 2019-2020. EarthWalk Software
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

echo "****************************************"
echo
echo "     installing Waterfox Current "
echo
echo "****************************************"

#instList="apt-get -y install "

#installList
#[[ $? -eq 0 ]] || exit $?

# =========================================================================

installPackage "${WFOX_PKG}" "${WFOX_URL}" "${WFOX_DIR}"
[[ $? -eq 0 ]] || exit $?

# =========================================================================

chmod 775 /opt/${LRUN_APP}/${LRUN_APP} 
ln -s /opt/${LRUN_APP}/${LRUN_APP} /usr/bin/${LRUN_APP} 

exit 0

