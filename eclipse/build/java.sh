#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:java-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/eclipse

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-eclipse-java container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-java-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-eclipse-java container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-eclipse-java-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-eclipse:java image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-eclipse:java-0.1.0-b4

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:java-0.1.0-b4"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="eclipse" \
  \
  --build-arg DNAME="" \
  \
  --build-arg PLUGINS="njs14" \
  \
  --build-arg NODEJS="1" \
  --build-arg NODEJS_BASH="1" \
  --build-arg NODEJS_HOST="http://alpine-nginx-pkgcache" \
  --build-arg NODEJS_VER="14" \
  \
  --build-arg ECLIPSE_IDE="java" \
  --build-arg ECLIPSE_RELEASE="2020-09" \
  --build-arg ECLIPSE_VERS="M1" \
  --build-arg ECLIPSE_HOST=http://alpine-nginx-pkgcache \
  \
  --build-arg BUILD_DESKTOP="Eclipse IDE Java" \
  --build-arg BUILD_ICON="default.png" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-eclipse" \
  --build-arg BUILD_VERSION="java" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="djs14-jdk13" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --network=pkgnet \
  --file Dockerfile \
-t ewsdocker/ldc-eclipse:java-0.1.0-b4  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:java-0.1.0-b4 failed."
 	exit 1
 }

. run/java.sh

