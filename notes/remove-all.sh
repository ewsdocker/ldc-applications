#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# =====================================================================
#
#    removeContainer
#        Stop and Remove the container
#
#    Enter:
#        limageName = the name of the image base (core, base, etc.)
#        lcontainerName = name of the container
#        lcontainerType = 0 - standard, non-zero = shortened name
#    Exit:
#        none
#
# =====================================================================
function removeContainer()
{
    local limageName="${1}"
    local lcontainerName="${2}"
    local lcontainerType=${3:-"0"}

    echo "*****************************************************************************"
    echo

    if [[ "${lcontainerType}" -eq "0" ]]
    then
        echo "Removing container: ldc-${limageName}-${lcontainerName}${ldcvers}${ldcextv}"

        docker stop "ldc-${limageName}-${lcontainerName}${ldcvers}${ldcextv}" >/dev/null 2>/dev/null
        docker rm "ldc-${limageName}-${lcontainerName}${ldcvers}${ldcextv}"  >/dev/null 2>/dev/null
    else
        echo "Removing container: ldc-${lcontainerName}"

        docker stop "ldc-${lcontainerName}"  >/dev/null 2>/dev/null
        docker rm   "ldc-${lcontainerName}"  >/dev/null 2>/dev/null
    fi

    echo
    echo "*****************************************************************************"

}

# =====================================================================
#
#    removeImage
#        Remove the ewsdocker image
#
#    Enter:
#        limageName = the name of the image base (core, base, etc.)
#        lcontainerName = name of the container
#    Exit:
#        none
#
# =====================================================================
function removeImage()
{
    local limageName="${1}"
    local lcontainerName="${2}"

    removeContainer "${limageName}" "${lcontainerName}" "0"

    echo "*****************************************************************************"
    echo
    echo "Removing image: ewsdocker/ldc-${limageName}:${lcontainerName}${ldcvers}${ldcextv}"
    echo
    echo "*****************************************************************************"

    docker rmi "ewsdocker/ldc-${limageName}:${lcontainerName}${ldcvers}${ldcextv}" >/dev/null 2>/dev/null
}

# =====================================================================
#
#    Start of program script
#
# =====================================================================

echo "*****************************************************************************"
echo
echo "Removing all docker ldc images and containers"
echo
echo "*****************************************************************************"

removeContainer "browser" "ffquantum" "1"
removeContainer "browser" "firefox-esr" "1"
removeContainer "browser" "firefox" "1"

removeImage "browser" "waterfox-current"
removeImage "browser" "waterfox"
removeImage "browser" "palemoon"
removeImage "browser" "netsurf"
removeImage "browser" "firefox"
removeImage "browser" "firefox-esr"
removeImage "browser" "ffquantum"

echo
echo "*****************************************************************************"
echo

removeImage "console" "tumblr"
removeImage "console" "nano"

echo
echo "*****************************************************************************"
echo

removeImage "desktop" "shotcut"
removeImage "desktop" "ripme"
removeImage "desktop" "obs-studio"
removeImage "desktop" "mousepad"
removeImage "desktop" "gimp"
removeImage "desktop" "dia"

echo
echo "*****************************************************************************"
echo

removeImage "eclipse" "rust"
removeImage "eclipse" "qt"
removeImage "eclipse" "php"
removeImage "eclipse" "javascript"
removeImage "eclipse" "java"
removeImage "eclipse" "fortran"
removeImage "eclipse" "cpp"
removeImage "eclipse" "bash"

echo
echo "*****************************************************************************"
echo

removeContainer "games" "sol"
removeContainer "games" "mahjongg"

removeImage "games" "sol"
removeImage "games" "mahjongg"

echo
echo "*****************************************************************************"
echo

removeContainer "libre" "office"
removeContainer "libre" "office-jdk"

removeContainer "libre" "libre-office-lib" "1"

removeImage "libre" "office-jdk"
removeImage "libre" "office"

echo "*****************************************************************************"
echo
echo "Removal complete"
echo
echo "*****************************************************************************"

