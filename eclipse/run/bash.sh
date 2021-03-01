#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-eclipse:bash${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping bash container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-bash${ldcvers}${ldcextv}
docker rm ldc-eclipse-bash${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-eclipse-bash${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
   -it \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
   -e LMSOPT_QUIET="0" \
   -e LRUN_APP="eclipse" \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-eclipse-bash${ldcvers}:/root \
   -v ${HOME}/.config/docker/ldc-eclipse-bash${ldcvers}/workspace:/workspace \
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
   --name=ldc-eclipse-bash${ldcvers}${ldcextv} \
 ewsdocker/ldc-eclipse:bash${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-eclipse-bash${ldcvers}${ldcextv} failed."
 	exit 2
 }


exit 0
