#!/bin/bash
# =========================================================================
# =========================================================================
#
#	build-office
#	  Local build office.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.0.1
# @copyright © 2019. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/ldc-libre
# @subpackage build-office
#
# =========================================================================
#
#	Copyright © 2019. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/ldc-libre.
#
#   ewsdocker/ldc-libre is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/ldc-libre is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/ldc-libre.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

cd ~/Development/ewslms/ldc-libre

. ../ldc-utilities/scripts/usr/local/lib/lms/lmsconCli.lib
. ../ldc-utilities/scripts/usr/local/lib/lms/lmsDeclare.lib
. ../ldc-utilities/scripts/usr/local/lib/lms/lmsStr.lib

. ../ldc-utilities/scripts/usr/local/lib/lms/lmsUtilities.lib
. ../ldc-utilities/scripts/usr/local/lib/lms/lmsDisplay.lib

. ../ldc-utilities/scripts/usr/local/lib/lms/local-build.lib

# =========================================================================

declare    cLink2=0
declare    cElink=0

declare    cNetsurf=0
declare    cPalemoon=0
declare    cFirefox=0
declare    cWaterfox=0

declare    cSingle=""
declare    cListing="0"
declare    cListFile=""

# =========================================================================
#
#   imageBody
#      Create the docker command body to build the image
#
#   Enter:
#      none
#   Exit:
#      0 = success
#      non-zero = error number
#
# =========================================================================
function imageBody()
{
	[[ ${cLink2} -ne 0 ]] && addToBuffer "--build-arg LINK2=1 "
	[[ ${cElink} -ne 0 ]] && addToBuffer "--build-arg ELINK=1 "

    [[ ${cNetsurf} -ne 0 ]] && 
     {
     	addToBuffer "--build-arg NETSURF=1 "
        [[ -z ${cNetwork} ]] || addToBuffer "--build-arg NETSURF_HOST=${cLocalHost} "
     }

    [[ ${cPalemoon} -ne 0 ]] && 
     {
     	addToBuffer "--build-arg PALEMOON=1 "
        [[ -z ${cNetwork} ]] || addToBuffer "--build-arg PALEMOON_HOST=${cLocalHost} "
     }

    [[ ${cFirefox} -ne 0 ]] && 
     {
     	addToBuffer "--build-arg FIREFOX=1 "
        [[ -z ${cNetwork} ]] || addToBuffer "--build-arg FIREFOX_HOST=${cLocalHost} "
     }

    [[ ${cWaterfox} -ne 0 ]] && 
     {
     	addToBuffer "--build-arg WATERFOX=1 "
        [[ -z ${cNetwork} ]] || addToBuffer "--build-arg WATERFOX_HOST=${cLocalHost} "
     }

    addToBuffer "--build-arg OFFICE_VER=${cVersExt} "
    [[ -z ${cNetwork} ]] || addToBuffer "--build-arg OFFICE_HOST=${cLocalHost} "
}

# =========================================================================
#
#   buildImage
#      build the image
#
#   Enter:
#      none
#   Exit:
#      0 = success
#      non-zero = error number
#
# =========================================================================
function buildImage()
{
	[[ "${cExtMod}" == " " ]] && cExtMod="" || cExtMod="-${cExtMod}"

	imageName
	containerName

	lmsDisplayTs "Building \"${cImage}\"."

	imageHeader
	imageBody
	imageFooter

	cOutput=$( ${cCommand} ) 
	cStatus=$?

    [[ ${cStatus} -eq 0 ]] ||
     {
     	[[ ${cListing} -eq 1 ]] &&
     	 {
			[[ -z ${cListFile} ]] && lmsDisplay "${cOutput}" || echo "${cOutput}" >> ${cListFile}
		 }

    	lmsDisplayTs "Build of \"${cImage}\" failed."
 	    return 1
 	 }

	[[ ${cListing} -eq 1 ]] &&
	 {
	 	[[ -z ${cListFile} ]] && lmsDisplay "${cOutput}" || echo "${cOutput}" >> ${cListFile}
	 }

	lmsDisplayTs "\"${cImage}\" was successfully built."
	
	return 0
}

# =========================================================================
#
#   processExt
#
#   Enter:
#      none
#   Exit:
#      0 = success
#      non-zero = error number
#
# =========================================================================
function processExt()
{
   	lmsDisplay

    case ${cExtMod} in

       	"ff") 
       		cFirefox=1
        		
       		buildImage
       		[[ $? -eq 0 ]] || return 1
        		
       		cFirefox=0

            ;;

        "wf") 
            cWaterfox=1 
            	
            buildImage 
        	[[ $? -eq 0 ]] || return 1
        	
            cWaterfox=0

            ;;

        "ns") 
           	cNetsurf=1
            	
           	buildImage
       		[[ $? -eq 0 ]] || return 1
        		
           	cNetsurf=0
 
            ;;

       "el")
           	cElink=1
            	
           	buildImage
       		[[ $? -eq 0 ]] || return 1
        		
           	cElink=0

            ;;

        "ln") 
           	cLink2=1
            	
           	buildImage
       		[[ $? -eq 0 ]] || return 1
        		
           	cLink2=0

            ;;

        "pm") 
           	cPalemoon=1
            	
            buildImage
        	[[ $? -eq 0 ]] || return 1
        		
            cPalemoon=0

            ;;

        " ") 
           	buildImage
       		[[ $? -eq 0 ]] || return 1

            ;;

   	esac
       	
    return 0
}

# =========================================================================
#
#   buildImages
#      build all the permutations of an image
#
#   Enter:
#      none
#   Exit:
#      0 = success
#      non-zero = error number
#
# =========================================================================
function buildImages()
{
    for cExtMod in " " "ff" "wf" "ns" "el" "ln" "pm"
    do
    	processExt
    	[[ $? -eq 0 ]] || return 1
    done
}

# =========================================================================
# =========================================================================

clear

cDockerName="doffice"

cSoftName="libreoffice"
cSoftVers="6.2.5"

cNetwork="pkgnet"
cLocalHost="http://alpine-nginx-pkgcache"

cCommand=""

cRepo="ewsdocker"
cName="ldc-libre"
cVersion="office"
cVersExt="0.1.0"
cExtMod=" "

cSingle=""
cListing="0"
cListFile=""
cTimestamp=""

lmsCliParse

for key in ${cliKey[@]}
do
	case $key in 

	    "single")
	    	cSingle="single"
			;;
				
		"listing")
			cListing="1"
			;;
			
		"file")
			cListing="1"
			cListFile="${cliParam[$key]}"
		 	lmsTimestamp 1 "cTimestamp"

		 	echo "${cTimestamp}" > ${cListFile}
			;;
			
		*)
			lmsDeclareStr "$key" "${cliParam[$key]}"
			;;

	esac
done

if [[ ${cSingle} == "single" ]]
then
	processExt
	[[ $? -eq 0 ]] || exit $?
else
    buildImages
    [[ $? -eq 0 ]] || exit $?
fi

[[ -n ${cListFile} ]] &&
 {
 	lmsTimestamp 1 "cTimestamp"
 	echo "${cTimestamp}" >> ${cListFile}
 }

lmsDisplay

exit 0

