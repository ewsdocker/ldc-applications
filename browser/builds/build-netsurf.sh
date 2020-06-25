#!/bin/bash
# ===========================================================================
#
#    ldc-browser:netsurf-0.1.0-b3
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping netsurf container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-netsurf-0.1.0-b3
docker rm ldc-browser-netsurf-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** removing netsurf image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:netsurf-0.1.0-b3

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:netsurf-0.1.0-b3"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="NETSURF" \
  \
  --build-arg RUN_APP="netsurf" \
  \
  --build-arg BROWSER_LABEL="NetSurf" \
  --build-arg BROWSER_RELEASE="3.10-1" \
  --build-arg BROWSER_VERS="" \
  \
  --build-arg NETSURF_NAME="NetSurf" \
  --build-arg NETSURF_GENERIC="netsurf" \
  --build-arg NETSURF_DIR="/opt" \
  --build-arg NETSURF_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  --build-arg BUILD_DESKTOP="NetSurf" \
  --build-arg BUILD_ICON="Firefox-esrSmall.png" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="netsurf" \
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
  --network=pkgnet \
  \
  --file Dockerfile \
-t ewsdocker/ldc-browser:netsurf-0.1.0-b3 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:netsurf-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-netsurf-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e L_RUN="/bin/bash" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-netsurf-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-browser-netsurf-0.1.0/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  -v ${HOME}/Source:/source \
  \
  --name=ldc-browser-netsurf-0.1.0-b3 \
ewsdocker/ldc-browser:netsurf-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-netsurf-0.1.0-b3 failed."
 	exit 2
 }

exit 0

