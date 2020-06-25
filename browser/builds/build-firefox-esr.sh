#!/bin/bash
# ===========================================================================
#
#    ldc-browser:firefox-esr-0.1.0-b3
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping firefox-esr container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-firefox-esr-0.1.0-b3
docker rm ldc-browser-firefox-esr-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** removing firefox-esr image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:firefox-esr-0.1.0-b3

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:firefox-esr-0.1.0-b3"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="EFOX" \
  \
  --build-arg RUN_APP="firefox-esr" \
  \
  --build-arg BROWSER_LABEL="Firefox ESR" \
  --build-arg BROWSER_RELEASE="68" \
  --build-arg BROWSER_VERS="9.0esr" \
  \
  --build-arg FIREFOX_NAME="Firefox ESR" \
  --build-arg FIREFOX_GENERIC="firefox-esr" \
  --build-arg FIREFOX_DIR="/opt" \
  --build-arg FIREFOX_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="firefox-esr" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b3" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b3" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b3" \
  \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  \
  --network=pkgnet \
  --file Dockerfile \
-t ewsdocker/ldc-browser:firefox-esr-0.1.0-b3 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:firefox-esr-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-firefox-esr-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LRUN_APP="firefox-esr" \
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
  -v ${HOME}/.config/docker/ldc-browser-firefox-esr-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-browser-firefox-esr-0.1.0/workspace:/workspace \
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
  --name=ldc-browser-firefox-esr-0.1.0-b3 \
ewsdocker/ldc-browser:firefox-esr-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-firefox-esr-0.1.0-b3 failed."
 	exit 2
 }


exit 0

