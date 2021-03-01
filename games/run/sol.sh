#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-games:sol${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping sol container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-games-sol${ldcvers}${ldcextv}
docker rm ldc-games-sol${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-games-sol${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

#XSOCK=/tmp/.X11-unix
#XAUTH=/tmp/.docker.xauth
#touch $XAUTH
#xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

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
   -v ${HOME}/.config/docker/ldc-games-sol-${ldcvers}/workspace/.gnome2:/root/.gnome2 \
   \
   -e LMS_BASE="/root/.local" \
   -e LMS_HOME="/root" \
   -e LMS_CONF="/root/.config" \
   \
   -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-games-sol-${ldcvers}:/root \
   -v ${HOME}/.config/docker/ldc-games-sol-${ldcvers}/workspace:/workspace \
   \
   -v ${HOME}/Downloads:/Downloads \
   \
   --name=ldc-games-sol${ldcvers}${ldcextv} \
 ewsdocker/ldc-games:sol${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-games-sol${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** stopping ldc-games-sol${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker stop ldc-games-sol${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "stop ldc-games-sol${ldcvers}${ldcextv} failed."
 }

echo "   ******************************************************"
echo "   ****"
echo "   **** ldc-games:sol${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   ******************************************************"
echo

exit 0

