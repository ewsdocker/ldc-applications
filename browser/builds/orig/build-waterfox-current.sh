#!/bin/bash
cd ~/Development/ewsldc/ldc-browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-waterfox container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-waterfox-current-0.1.0-b1
docker rm ldc-browser-waterfox-current-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser:waterfox image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:waterfox-current-0.1.0-b1

# ===========================================================================
#
#    ldc-browser:waterfox-current-0.1.0-b1
#
# ===========================================================================

echo
echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:waterfox-current-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="waterfox" \
  \
  --build-arg WATERFOX_NAME="waterfox-current" \
  --build-arg WATERFOX_RELEASE="2019" \
  --build-arg WATERFOX_VER="12" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="waterfox-current" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b1" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b1" \
  \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --build-arg WATERFOX_HOST="http://alpine-nginx-pkgcache" \
  --network=pkgnet \
  \
  --file Dockerfile.waterfox \
-t ewsdocker/ldc-browser:waterfox-current-0.1.0-b1 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:waterfox-current-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-waterfox-current-0.1.0-b1"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-waterfox-current-0.1.0:${HOME} \
  -v ${HOME}/.config/docker/ldc-browser-waterfox-current-0.1.0/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Source:/source \
  \
  --name=ldc-browser-waterfox-current-0.1.0-b1 \
ewsdocker/ldc-browser:waterfox-current-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-waterfox-current-0.1.0-b1 failed."
 	exit 2
 }

exit 0
