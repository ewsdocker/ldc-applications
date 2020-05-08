#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:dfortran-0.1.0-b1
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-eclipse

echo "   ********************************************"
echo "   ****"
echo "   **** stopping dfortran container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-eclipse-dfortran-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing dfortran image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-eclipse:dfortran-0.1.0-b1

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:dfortran-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="eclipse" \
  \
  --build-arg ECLIPSE_IDE="cpp" \
  \
  --build-arg BUILD_DESKTOP="Eclipse IDE Fortran" \
  --build-arg BUILD_ICON="default.png" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-eclipse" \
  --build-arg BUILD_VERSION="dfortran" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-devstack" \
  --build-arg FROM_VERS="dfortran-jdk11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b1" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b1" \
  \
  --build-arg ECLIPSE_HOST=http://alpine-nginx-pkgcache \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  \
  --network=pkgnet \
  \
  --file Dockerfile.declipse \
-t ewsdocker/ldc-eclipse:dfortran-0.1.0-b1  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:dfortran-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-eclipse-dfortran-0.1.0-b1"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
   -it \
   -e LMSOPT_QUIET="0" \
   -e LRUN_APP="eclipse" \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v ${HOME}/bin:/userbin \
   -v ${HOME}/.local:/usrlocal \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-eclipse-dfortran-0.1.0:/root \
   -v ${HOME}/.config/docker/ldc-eclipse-dfortran-0.1.0/workspace:/workspace \
   \
   -e DISPLAY=unix${DISPLAY} \
   -v ${HOME}/.Xauthority:/root/.Xauthority \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /dev/shm:/dev/shm \
   --device /dev/snd \
   \
   -v ${HOME}/Development:/Development \
   -v ${HOME}/Source:/Source \
   \
   --name=ldc-eclipse-dfortran-0.1.0-b1 \
 ewsdocker/ldc-eclipse:dfortran-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-eclipse-dfortran-0.1.0-b1 failed."
 	exit 2
 }


exit 0

