#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:qt-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/eclipse

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-eclipse-qt container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-qt-0.1.0-b4
docker rm ldc-eclipse-qt-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-eclipse-qt image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-eclipse:qt-0.1.0-b4

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:qt-0.1.0-b4"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="eclipse" \
  \
  --build-arg DNAME="" \
  \
  --build-arg ECLIPSE_IDE="cpp" \
  --build-arg ECLIPSE_RELEASE="2020-09" \
  --build-arg ECLIPSE_VERS="M1" \
  \
  --build-arg BUILD_DESKTOP="Eclipse IDE Qt" \
  --build-arg BUILD_ICON="default.png" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-eclipse" \
  --build-arg BUILD_VERSION="qt" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-eclipse" \
  --build-arg FROM_VERS="cpp" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --build-arg ECLIPSE_HOST=http://alpine-nginx-pkgcache \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  \
  --network=pkgnet \
  \
  --file Dockerfile \
-t ewsdocker/ldc-eclipse:qt-0.1.0-b4  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:qt-0.1.0-b4 failed."
 	exit 1
 }

. run/qt.sh
