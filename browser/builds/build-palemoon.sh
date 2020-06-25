#!/bin/bash
# ===========================================================================
#
#    ldc-browser:palemoon-0.1.0-b3
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-palemoon container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-palemoon-0.1.0-b3
docker rm ldc-browser-palemoon-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser:palemoon image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:palemoon-0.1.0-b3

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:palemoon-0.1.0-b3"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="PMOON" \
  \
  --build-arg RUN_APP="palemoon" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BROWSER_LABEL="Pale Moon" \
  --build-arg BROWSER_RELEASE="28" \
  --build-arg BROWSER_VERS="10.0" \
  \
  --build-arg PALEMOON_NAME="Pale Moon" \
  --build-arg PALEMOON_GENERIC="palemoon" \
  --build-arg PALEMOON_DIR="/opt" \
  --build-arg PALEMOON_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="palemoon" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b3" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk2-x11" \
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
  \
  --file Dockerfile \
-t ewsdocker/ldc-browser:palemoon-0.1.0-b3 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:palemoon-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-palemoon-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LMSOPT_QUIET=0 \
  -e LRUN_APP="palemoon" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-palemoon-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-browser-palemoon-0.1.0/workspace:/workspace \
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
  --name=ldc-browser-palemoon-0.1.0-b3 \
ewsdocker/ldc-browser:palemoon-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-palemoon-0.1.0-b3 failed."
 	exit 2
 }

exit 0

