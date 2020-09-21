#!/bin/bash
# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  libre.sh - setup file for Libre Office.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2017-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package libre
# @subpackage libre.sh
#
# =========================================================================
#
#	Copyright © 2017-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/libre.
#
#   ewsdocker/libre is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/libre is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/libre.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

# =========================================================================

mkdir -p ${LIBRE_DIR}
mkdir -p ${HLP_DIR}

# =========================================================================

wget ${LIBRE_URL}
[[ $? -eq 0 ]] || exit $?

tar fxvz ${LIBRE_PKG}
[[ $? -eq 0 ]] || exit $?

rm -Rf ${LIBRE_PKG}

dpkg -i ${LIBRE_DIR}/DEBS/*.deb  
[[ $? -eq 0 ]] || exit $?

# =========================================================================

wget ${HLP_URL}
[[ $? -eq 0 ]] || exit $?

tar fxvz ${HLP_TAR} 
[[ $? -eq 0 ]] || exit $?

rm -Rf ${HLP_TAR}

dpkg -i ${HLP_DIR}/DEBS/*.deb 
[[ $? -eq 0 ]] || exit $?

# =========================================================================

rm -Rf "${LIBRE_DIR}"
rm -Rf "${HLP_DIR}"

# =========================================================================

PATH=$PATH:/opt/libreoffice${LIBRE_REL}/program

ln -s /usr/bin/lms/addLanguage /usr/bin/addLanguage
ln -s /opt/libreoffice${LIBRE_REL}/program/soffice /usr/bin/libreoffice 

# =========================================================================

exit 0

