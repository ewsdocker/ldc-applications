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

cd ~/Development/ewsldc/ldc-applications/libre

#buildScript "office" ; [[ $? -eq 0 ]] || exit $?
buildScript "office-jdk" ; [[ $? -eq 0 ]] || exit $?

