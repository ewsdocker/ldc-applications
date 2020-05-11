#!/bin/bash
# ===========================================================================
#
#    ldc-browser:firefox-0.1.0-b1
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping firefox container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-firefox-0.1.0-b1
docker rm ldc-browser-firefox-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing firefox image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:firefox-0.1.0-b1

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:firefox-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  \
  --build-arg BROWSER_COMMON="0" \
  --build-arg BROWSER_BUILD="FFOX" \
  --build-arg BROWSER_NAME="firefox" \
  --build-arg BROWSER_STABLE="0" \
  --build-arg BROWSER_LABEL="Firefox Quantum" \
  --build-arg BROWSER_RELEASE="72" \
  --build-arg BROWSER_VERS="0.1-1" \
  \
  --build-arg RUN_APP="firefox" \
  \
  --build-arg FIREFOX_RELEASE="71" \
  --build-arg FIREFOX_VER="0" \
  --build-arg FIREFOX_NAME="Firefox Quantum" \
  --build-arg FIREFOX_GENERIC="firefox" \
  --build-arg FIREFOX_DIR="/opt" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="firefox" \
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
  --build-arg FIREFOX_HOST="http://alpine-nginx-pkgcache" \
  \
  --network=pkgnet \
  --file Dockerfile \
-t ewsdocker/ldc-browser:firefox-0.1.0-b1 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:firefox-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-firefox-0.1.0-b1"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LRUN_APP="firefox" \
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
  -v ${HOME}/.config/docker/ldc-browser-firefox-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-browser-firefox-0.1.0/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  \
  --name=ldc-browser-firefox-0.1.0-b1 \
ewsdocker/ldc-browser:firefox-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-firefox-0.1.0-b1 failed."
 	exit 2
 }


exit 0

