#!/bin/bash
# ===========================================================================
#
#    ldc-games:mahjongg-0.1.0-b3
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-games-mahjongg-0.1.0-b3
docker rm ldc-games-mahjongg-0.1.0-b3

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-games-mahjongg-0.1.0-b3"
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
   -v ${HOME}/.config/docker/ldc-games-mahjongg-0.1.0:/root \
   -v ${HOME}/.config/docker/ldc-games-mahjongg-0.1.0/workspace:/workspace \
   \
   --name=ldc-games-mahjongg-0.1.0-b3 \
 ewsdocker/ldc-games:mahjongg-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-games-mahjongg-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

docker stop ldc-games-mahjongg-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "stop ldc-games-mahjongg-0.1.0-b3 failed."
 }

echo "   ******************************************************"
echo "   ****"
echo "   **** ldc-games:mahjongg-0.1.0-b3 successfully installed."
echo "   ****"
echo "   ******************************************************"
echo

exit 0

