#!/bin/bash
# ===========================================================================
#
#    ldc-games:mahjongg-0.1.0-b4
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-games-mahjongg-0.1.0-b4
docker rm ldc-games-mahjongg-0.1.0-b4

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-games-mahjongg-0.1.0-b4"
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
   --name=ldc-games-mahjongg-0.1.0-b4 \
 ewsdocker/ldc-games:mahjongg-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-games-mahjongg-0.1.0-b4 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg-0.1.0-b4"
echo "   ****"
echo "   ***********************************************"
echo

docker stop ldc-games-mahjongg-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "stop ldc-games-mahjongg-0.1.0-b4 failed."
 }

echo "   ******************************************************"
echo "   ****"
echo "   **** ldc-games:mahjongg-0.1.0-b4 successfully installed."
echo "   ****"
echo "   ******************************************************"
echo

exit 0

