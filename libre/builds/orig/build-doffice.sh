#!/bin/bash
cd ~/Development/ewsldc/ldc-libre

echo "   ********************************************"
echo "   ****"
echo "   **** stopping office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-libre-doffice-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing office image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-libre:doffice-0.1.0-b1

# ===========================================================================
#
#    ldc-libre:doffice-0.1.0-b1
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-libre:doffice-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg BUILD_BASE="/usr/local/" \
  --build-arg RUN_APP="libreoffice" \
  --build-arg OFFICE_VER="6.3.2" \
  \
  --build-arg LINK2="0" \
  --build-arg ELINK="1" \
  --build-arg NETSURF="0" \
  --build-arg PALEMOON="0" \
  --build-arg FIREFOX="0" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-libre" \
  --build-arg BUILD_VERSION="doffice" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-lang" \
  --build-arg FROM_VERS="djdk-jre11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b1" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b1" \
  \
  --build-arg NETSURF_HOST=http://alpine-nginx-pkgcache \
  --build-arg PALEMOON_HOST=http://alpine-nginx-pkgcache \
  --build-arg FIREFOX_HOST=http://alpine-nginx-pkgcache \
  --build-arg OFFICE_HOST=http://alpine-nginx-pkgcache \
  \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile.doffice \
-t ewsdocker/ldc-libre:doffice-0.1.0-b1  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-libre:doffice-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-libre-doffice-0.1.0-b1"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LRUN_APP="libreoffice" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-libre-doffice-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-libre-doffice-0.1.0/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Documents:/documents \
  -v ${HOME}/Source:/source \
  \
  --name=ldc-libre-doffice-0.1.0-b1 \
ewsdocker/ldc-libre:doffice-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-libre-doffice-0.1.0-b1 failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-libre:doffice-0.1.0-b1 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-libre-doffice-0.1.0-b1"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

