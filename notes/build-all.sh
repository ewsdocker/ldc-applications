#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# =====================================================================
#
#    buildScript
#        Build the docker image and then the docker container
#
#    Enter:
#        scriptName = the name of the script
#    Exit:
#        0 = no error
#        non-zero = error code
#
# =====================================================================
function buildScript()
{
    local scriptName=${1:-""}

    [[ -z "${scriptName}" ]] && return 1
    build/${scriptName}.sh

    return $?
}

# ===============================================
#
# ldc-applications
#
# ===============================================

cd ~/Development/ewsldc/ldc-applications/browser

cd ../browser

buildScript "ffquantum" ; [[ $? -eq 0 ]] || exit $?
buildScript "firefox"  ; [[ $? -eq 0 ]] || exit $?
buildScript "firefox-esr" ; [[ $? -eq 0 ]] || exit $?
buildScript "netsurf" ; [[ $? -eq 0 ]] || exit $?
buildScript "palemoon" ; [[ $? -eq 0 ]] || exit $?
buildScript "waterfox-classic" ; [[ $? -eq 0 ]] || exit $?
buildScript "waterfox-current" ; [[ $? -eq 0 ]] || exit $?

#

cd ../console

buildScript "nano" ; [[ $? -eq 0 ]] || exit $?
buildScript "tumblr"

#

cd ../desktop

buildScript "dia" ; [[ $? -eq 0 ]] || exit $?
buildScript "gimp" ; [[ $? -eq 0 ]] || exit $?
buildScript "mousepad" ; [[ $? -eq 0 ]] || exit $?
buildScript "obs-studio"  ; [[ $? -eq 0 ]] || exit $?
buildScript "ripme" ; [[ $? -eq 0 ]] || exit $?
buildScript "shotcut" ; [[ $? -eq 0 ]] || exit $?

#

cd ../eclipse

buildScript "cpp" ; [[ $? -eq 0 ]] || exit $?
buildScript "fortran" ; [[ $? -eq 0 ]] || exit $?
buildScript "java" ; [[ $? -eq 0 ]] || exit $?
buildScript "javascript" ; [[ $? -eq 0 ]] || exit $?
buildScript "php" ; [[ $? -eq 0 ]] || exit $?
buildScript "qt" ; [[ $? -eq 0 ]] || exit $?
buildScript "bash" ; [[ $? -eq 0 ]] || exit $?

#

cd ../games

buildScript "mahjongg" ; [[ $? -eq 0 ]] || exit $?
buildScript "sol" ; [[ $? -eq 0 ]] || exit $?

#

cd ../libre

buildScript "office" ; [[ $? -eq 0 ]] || exit $?
buildScript "office-jdk" ; [[ $? -eq 0 ]] || exit $?

