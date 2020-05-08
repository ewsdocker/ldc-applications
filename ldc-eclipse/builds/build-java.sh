#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:java-0.1.0-b1
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/ldc-eclipse

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-eclipse-java container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-java-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-eclipse-java container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-eclipse-java-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-eclipse:java image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-eclipse:java-0.1.0-b1

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:java-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="eclipse" \
  \
  --build-arg ECLIPSE_IDE="java" \
  \
  --build-arg BUILD_DESKTOP="Eclipse IDE Java" \
  --build-arg BUILD_ICON="default.png" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-eclipse" \
  --build-arg BUILD_VERSION="java" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="djdk13-gtk3" \
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
  --file Dockerfile \
-t ewsdocker/ldc-eclipse:java-0.1.0-b1  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:java-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-eclipse-java-0.1.0-b1"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  --rm \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
  \
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
  -v ${HOME}/.config/docker/ldc-eclipse-java-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-eclipse-java-0.1.0/workspace:/workspace \
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
  --name=ldc-eclipse-java-0.1.0-b1 \
ewsdocker/ldc-eclipse:java-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-eclipse-java-0.1.0-b1 failed."
 	exit 2
 }


exit 0

