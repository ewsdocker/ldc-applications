#!/bin/bash
# ===========================================================================
#
#    ldc-libre:office-0.1.0-b1
#
# ===========================================================================

cd ~/Development/ewsldc/ldc-applications/libre

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-libre-office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-libre-office-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-libre:office image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-libre:office-0.1.0-b1

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-libre:office-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="libreoffice" \
  --build-arg OFFICE_VER="6.3.4" \
  \
  --build-arg BUILD_BASE="/usr/local/" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-libre" \
  --build-arg BUILD_VERSION="office" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b1" \
  \
  --build-arg OFFICE_HOST=http://alpine-nginx-pkgcache \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile \
  -t ewsdocker/ldc-libre:office-0.1.0-b1  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-libre:office-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-libre-office-0.1.0-b1"
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
  -v ${HOME}/.config/docker/ldc-libre-office-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-libre-office-0.1.0/workspace:/workspace \
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
  --name=ldc-libre-office-0.1.0-b1 \
ewsdocker/ldc-libre:office-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-libre-office-0.1.0-b1 failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-libre:office-0.1.0-b1 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-libre-office-0.1.0-b1"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

