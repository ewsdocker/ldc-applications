#!/bin/bash

# ===================================================================================
# ===================================================================================
#
#	IDE.sh
#       Add plugins Version repository to APT repository, 
#       Install requested plugins from the APT repository.
#
# ===================================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/ldc-applications
# @subpackage eclipse/IDE
#
# ==========================================================================
#
#	Copyright © 2020. EarthWalk Software
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
#   along with ewsdocker/ldc-applications.  
#
#   If not, see <http://www.gnu.org/licenses/>.
#
# ==========================================================================
# ==========================================================================

# ==========================================================================
#
#    installIDE
#       Install the requested IDE.
#
#    Enter:
#       none
#    Exit:
#       0 = no error
#       non-zero = error code
#
#	 Note:
#      EC_URL, EC_PKG and EC_DIR must be set appropriately in Dockerfile
#
# ==========================================================================
function installIDE()
{
	while (true)
	do
		wget ${EC_URL}
		[[ $? -eq 0 ]] || break

		tar -xvf ${EC_PKG}
		[[ $? -eq 0 ]] || break

		rm ${EC_PKG} 
		[[ $? -eq 0 ]] || break

		rm -f /usr/bin/eclipse 
		[[ $? -eq 0 ]] || break

		# testing hack
		ln -s /usr/local/share/${EC_DIR}/eclipse /usr/bin/eclipse 

		break
	done
	
	return $?
}

# ==========================================================================

echo ""
echo "   **** Installing ${LMS_DESKTOP} ****"
echo ""

opwd=${PWD}
cd /usr/local/share 
 
installIDE
oresult=$?

cd ${opwd}	

exit $oresult
