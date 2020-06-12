#!/bin/bash
cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ddia container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-dia-0.1.0-b2
docker rm ldc-desktop-dia-0.1.0-b2

echo "   ********************************************"
echo "   ****"
echo "   **** removing ddia image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:dia-0.1.0-b2

# ===========================================================================
#
#    ldc-desktop:dia-0.1.0-b2
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:dia-0.1.0-b2"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="dia" \
  --build-arg DNAME="DIA" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="dia" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b2" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="dfortran-gtk2" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b2" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b2" \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  \
  --network=pkgnet \
  --file Dockerfile \
  \
-t ewsdocker/ldc-desktop:dia-0.1.0-b2  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:dia-0.1.0-b2 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-dia-0.1.0-b2"
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
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-desktop-dia-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-desktop-dia-0.1.0/workspace:/workspace \
  \
  -v ${HOME}/Pictures/Dia:/artwork \
  -v ${HOME}/Pictures:/pictures \
  -v ${HOME}/Documents:/www \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -e LMSLIB_INST="0" \
  -e LMSLIB_HOST=http://alpine-nginx-pkgcache \
  -e LMSLIB_VERS="0.1.6" \
  -e LMSLIB_VERS_MOD="-b2" \
  \
  --name=ldc-desktop-dia-0.1.0-b2 \
ewsdocker/ldc-desktop:dia-0.1.0-b2
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-dia-0.1.0-b2 failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:dia-0.1.0-b2 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-dia-0.1.0-b2"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0
