#!/bin/bash
# ===========================================================================
#
#    ldc-games:mahjongg-0.1.0-b2
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/games

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-games-mahjongg-0.1.0-b2

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-games:mahjongg image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-games:mahjongg-0.1.0-b2

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-games:mahjongg-0.1.0-b2"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="gnome-mahjongg" \
  --build-arg BUILD_GAME="MAJ" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  \
  --build-arg BUILD_NAME="ldc-games" \
  --build-arg BUILD_VERSION="mahjongg" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b2" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b2" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b2" \
  \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --build-arg MAHJONGG_HOST="http://alpine-nginx-pkgcache" \
  --network=pkgnet\
  \
  --file Dockerfile \
 -t ewsdocker/ldc-games:mahjongg-0.1.0-b2 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-games:mahjongg-0.1.0-b2 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-games-mahjongg-0.1.0-b2"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
   -it \
   \
  -v /etc/localtime:/etc/localtime:ro \
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
   -e DISPLAY=unix${DISPLAY} \
   -v ${HOME}/.Xauthority:/root/.Xauthority \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /dev/shm:/dev/shm \
   --device /dev/snd \
   \
   -v ${HOME}/Downloads:/Downloads \
   \
   --name=ldc-games-mahjongg-0.1.0-b2 \
 ewsdocker/ldc-games:mahjongg-0.1.0-b2
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-games-mahjongg-0.1.0-b2 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg-0.1.0-b2"
echo "   ****"
echo "   ***********************************************"
echo

docker stop ldc-games-mahjongg-0.1.0-b2
[[ $? -eq 0 ]] ||
 {
 	echo "stop ldc-games-mahjongg-0.1.0-b2 failed."
 }

echo "   ******************************************************"
echo "   ****"
echo "   **** ldc-games:mahjongg-0.1.0-b2 successfully installed."
echo "   ****"
echo "   ******************************************************"
echo

exit 0
