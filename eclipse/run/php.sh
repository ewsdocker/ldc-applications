#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-eclipse:php${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping php container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-php${ldcvers}${ldcextv}
docker rm ldc-eclipse-php${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-eclipse-php${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
   -it \
   -e LMSOPT_QUIET="0" \
   -e LRUN_APP="eclipse" \
   \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v ${HOME}/bin:/userbin \
   -v ${HOME}/.local:/usrlocal \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-eclipse-php${ldcvers}:/root \
   -v ${HOME}/.config/docker/ldc-eclipse-php${ldcvers}/workspace:/workspace \
   \
   -e DISPLAY=unix${DISPLAY} \
   -v ${HOME}/.Xauthority:/root/.Xauthority \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /dev/shm:/dev/shm \
   --device /dev/snd \
   \
   -v ${HOME}/Development:/Development \
   -v ${HOME}/Source:/Source \
   \
   --name=ldc-eclipse-php${ldcvers}${ldcextv} \
 ewsdocker/ldc-eclipse:php${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-eclipse-php${ldcvers}${ldcextv} failed."
 	exit 2
 }


exit 0
