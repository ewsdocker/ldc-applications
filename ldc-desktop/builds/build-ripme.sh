#!/bin/bash
cd ~/Development/ewsldc/ldc-desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ripme container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-ripme-0.1.0-b1
docker rm ldc-desktop-ripme-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing ripme image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:ripme-0.1.0-b1

# ===========================================================================
#
#    ldc-desktop:ripme-0.1.0-b1
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:ripme-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="RIPME" \
  --build-arg RUN_APP="ripme" \
  \
  --build-arg RIPME_VER="1.7" \
  --build-arg RIPME_EXT="89" \
  --build-arg RIPME_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="ripme" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="djre8-gtk2" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b1" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b1" \
  \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --network=pkgnet \
  \
  --file Dockerfile.ddesktop \
  -t ewsdocker/ldc-desktop:ripme-0.1.0-b1  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:ripme-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-ripme-0.1.0-b1"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
      -it \
      \
  -v /etc/localtime:/etc/localtime:ro \
  \
      -e LMS_BASE="${HOME}/.local" \
      -e LMS_HOME="${HOME}" \
      -e LMS_CONF="${HOME}/.config" \
      \
      -e DISPLAY=unix${DISPLAY} \
      -v ${HOME}/.Xauthority:/root/.Xauthority \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /dev/shm:/dev/shm \
      --device /dev/snd \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-ripme-0.1.0:/root \
      -v ${HOME}/.config/docker/ldc-desktop-ripme-0.1.0/workspace:/workspace \
      \
      -v ${HOME}/Pictures/RipMe:/artwork \
      -v ${HOME}/Pictures:/pictures \
      -v ${HOME}/Documents:/www \
      \
      --name=ldc-desktop-ripme-0.1.0-b1 \
    ewsdocker/ldc-desktop:ripme-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-ripme-0.1.0-b1 failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:ripme-0.1.0-b1 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-ripme-0.1.0-b1"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

