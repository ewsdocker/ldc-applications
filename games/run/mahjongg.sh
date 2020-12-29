#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-games:mahjongg${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-games-mahjongg${ldcvers}${ldcextv}
docker rm ldc-games-mahjongg${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-games-mahjongg${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
   -it \
   \
   -v /etc/localtime:/etc/localtime:ro \
   -e DISPLAY=unix${DISPLAY} \
   \
   -v ${HOME}/.Xauthority:/root/.Xauthority \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /dev/shm:/dev/shm \
   --device /dev/snd \
   \
   -v ${HOME}/Downloads:/Downloads \
   \
   -e LMS_BASE="/root/.local" \
   -e LMS_HOME="/root" \
   -e LMS_CONF="/root/.config" \
   \
   -v ${HOME}/bin:/userbin \
   -v ${HOME}/.local:/usrlocal \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-games-mahjongg${ldcvers}:/root \
   -v ${HOME}/.config/docker/ldc-games-mahjongg${ldcvers}/workspace:/workspace \
   \
   --name=ldc-games-mahjongg${ldcvers}${ldcextv} \
 ewsdocker/ldc-games:mahjongg${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-games-mahjongg${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker stop ldc-games-mahjongg${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "stop ldc-games-mahjongg${ldcvers}${ldcextv} failed."
 }

echo "   ******************************************************"
echo "   ****"
echo "   **** ldc-games:mahjongg${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   ******************************************************"
echo

exit 0

