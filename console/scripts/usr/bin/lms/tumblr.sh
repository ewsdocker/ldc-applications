#!/bin/bash
# =========================================================================
# =========================================================================
#
#	tumblr.sh
#     Download image archive(s) from the famous tumblr.com website
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.2
# @copyright © 2017-2019. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-cli-apps:dtumblr
# @subpackage tumblr.sh
#
# =========================================================================
#
#	Copyright © 2017-2019. EarthWalk Software
#   This file is part of ldc-cli-apps:dtumblr.
#
#   ldc-cli-apps:dtumblr is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ldc-cli-apps:dtumblr is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ldc-cli-apps:dtumblr.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

declare -a tumblr_sites=()
declare    tumblr_filename

# =========================================================================

. /usr/local/lib/lms/lmsDisplay.lib

# =========================================================================
#
#	wgetSite
#     Entry:
#       wsite = name of the tumblr site
#       sec = "s" for secure, otherwise empty
#     Exit:
#       0 = no error
#       non-zero = result code
#
# =========================================================================
function wgetSite()
{
    local wsite=${1}
    local sec=${2:-""}

	#
	# Download the images using wget
	#
	#	-H == Enable spanning across hosts in recursion
	#	-D == Domain list to be followed
	#
	#	-A == Accept list of file patterns to accept
	#	-R == Reject list of file name patterns to regject
	#
	#	-r == Recursive retrieval
	#	-l == (--level) Recursion maximum depth level (default = 5)
	#
	#	-nd == no hierarchy of directories
	#	-nc == no clobber 
	#
	#	--random-wait == wait random seconds between requests
	#	--limit-rate = limit download speed (e.g. --limit-rate=720k)
	#
	#	-e == execute command (see .wgetrc commands)
	#
    wget --quiet -H -Dmedia.tumblr.com,${wsite}.tumblr.com \
         -r -R "*avatar*" \
         -A "[0-9]" -A "*index*" -A jpeg,jpg,bmp,gif,png,avi,flv,mkv \
	     -A "*.mp3" -A "*.mp4" -A "*.wm?" \
         --level=10 -nd -nc -erobots=off \
	     --random-wait --limit-rate="${TUMBLR_LIMIT}" \
         http${sec}://${wsite}.tumblr.com/

    return $?
}

# =========================================================================
#
#	downloadSite
#     Entry:
#       site = name of the tumblr site
#     Exit:
#       0 = no error
#       non-zero = result code
#
# =========================================================================
function downloadSite()
{
    local dsite=${1}

    if [ ! -d "${dsite}" ] 
    then
        mkdir -p ${dsite} >/dev/null 2>&1
    fi

    chmod 777 ${dsite} >/dev/null 2>&1

    cd ${dsite}

    lmsDisplay "    ${dsite} " 0 "n"

    wgetSite ${dsite} "s"
    [[ $? -eq 0 ]] ||
     {
        wgetSite ${dsite}
        [[ $? -eq 0 ]] || lmsDisplay "... unable to read site ${dsite}" 0 "n"

     }

    lmsDisplay "" 0

	chmod 777 * >/dev/null 2>&1
	chmod 777 *.html >/dev/null 2>&1

	rm -f 1 2 3 4 5 6 7 8 9 index.html >/dev/null 2>&1
	
    cd ../
    return 0
}

# =========================================================================
#
#	processRequest
#     Entry:
#       none
#     Exit:
#       0 = no error
#       non-zero = result code
#
# =========================================================================
function processRequest()
{
    local tumblr_build
    local tumblr_catalog
    local tumblr_site

    [[ ${#tumblr_sites[@]} -eq 0 ]] && 
     {
        [[ -n "${TUMBLR_CAT}" ]] ||
         {
            lmsDisplay "Nothing to do!" 1
            return 1
         }

        tumblr_sites=( ${TUMBLR_CAT} )
     }

    clear

    tumblr_catalog=${tumblr_sites[0]}

	#
	#	check for existance of the tumblr_catalog
	#
	
    if [ -f "/data/${TUMBLR_LISTS}/${tumblr_catalog}" ]
    then
        lmsDisplay "Catalog: ${tumblr_catalog}" 0

        if [ ! -d "/data/${TUMBLR_CATALOGS}/${tumblr_catalog}" ]
        then
            mkdir -p "/data/${TUMBLR_CATALOGS}/${tumblr_catalog}" >/dev/null 2>&1
        fi

        chmod 777 "/data/${TUMBLR_CATALOGS}/${tumblr_catalog}" >/dev/null 2>&1
	    cd "/data/${TUMBLR_CATALOGS}/${tumblr_catalog}"

        cat "/data/${TUMBLR_LISTS}/${tumblr_catalog}" | while read tumblr_site
        do
            [[ -z "${tumblr_site}"  ||  ${tumblr_site} == \#* ]] && continue
            downloadSite $tumblr_site
        done
    else
        tumblr_site="${tumblr_catalog}"
        [[ -z "${tumblr_site}"  ||  ${tumblr_site} == \#* ]] && 
         {
            lmsDisplay "Nothing to do!" 1
            return 2
         }

	    cd "/data/${TUMBLR_SITES}"

        lmsDisplay "Single Tumblr site: ${tumblr_site}"
        downloadSite $tumblr_site
    fi

    cd /data
    return 0
}

# =========================================================================
# =========================================================================
#
#     Application Starts Here
#
# =========================================================================
# =========================================================================

tumblr_sites=()

for tumblr_filename in "$@"
do
    tumblr_sites=( "${tumblr_sites[@]}" "$tumblr_filename" )
done

processRequest

# =========================================================================

exit $?
