#!/bin/bash
# ===========================================================================
#
#    ldc-desktop:mousepad-0.1.0
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping mousepad container"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-desktop-mousepad-0.1.0-b2

echo "   ********************************************"
echo "   ****"
echo "   **** removing mousepad images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-desktop:mousepad-0.1.0-b2

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:mousepad-0.1.0-b2"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg DNAME="MPAD" \
  --build-arg RUN_APP="mousepad" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="mousepad" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b2" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk2-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b2" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b2" \
  \
  --network=pkgnet \
  --file Dockerfile \
  \
  -t ewsdocker/ldc-desktop:mousepad-0.1.0-b2  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:mousepad-0.1.0-b2 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-mousepad-0.1.0-b2 container"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -e LMS_HOME="${HOME}" \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -e LMSOPT_QUIET="0" \
  \
  -e LMSLIB_INST="0" \
  -e LMSLIB_HOST=http://alpine-nginx-pkgcache \
  -e LMSLIB_VERS="0.1.6" \
  -e LMSLIB_VERS_MOD="-b2" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-desktop-mousepad-0.1.0-b2:/root \
  -v ${HOME}/.config/docker/ldc-desktop-mousepad-0.1.0-b2/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  -v ${HOME}/Pictures:/pictures \
  -v ${HOME}/Pictures/mousepad:/artwork \
  -v ${HOME}/www:/www \
  \
  -it \
  --name=ldc-desktop-mousepad-0.1.0-b2 \
ewsdocker/ldc-desktop:mousepad-0.1.0-b2 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:mousepad-0.1.0-b2 failed."
 	exit 1
 }

# ===========================================================================
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-desktop:mousepad-0.1.0-b2 successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

