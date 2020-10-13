#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:bash-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/eclipse

echo "   ********************************************"
echo "   ****"
echo "   **** stopping bash container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-bash-0.1.0-b4
docker rm ldc-eclipse-bash-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing bash image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-eclipse:bash-0.1.0-b4

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:bash-0.1.0-b4"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="eclipse" \
  \
  --build-arg DNAME="" \
  \
  --build-arg PLUGINS="" \
  --build-arg PLUGINS_ONLY="1" \
  \
  --build-arg CC_VER="8" \
  --build-arg CC_TYPE="WAYLAND" \
  \
  --build-arg FORTRAN_VER="FORTRAN8" \
  \
  --build-arg GTK_VER="GTK3" \
  \
  --build-arg JDK_TYPE="jdk13" \
  --build-arg JDK_VERS="13.0.1" \
  --build-arg JDK_RELEASE="jdk13" \
  --build-arg JDK_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg PHP_PLUGIN="5.6" \
  --build-arg PHP_PLUGIN_COMP="1" \
  \
  --build-arg NODEJS_HOST="http://alpine-nginx-pkgcache" \
  --build-arg NODEJS_VER="14" \
  \
  --build-arg NPM_INSTALL="bash-language-server" \
  \
  --build-arg ECLIPSE_IDE="javascript" \
  --build-arg ECLIPSE_RELEASE="2020-09" \
  --build-arg ECLIPSE_VERS="M1" \
  --build-arg ECLIPSE_HOST=http://alpine-nginx-pkgcache \
  \
  --build-arg BUILD_DESKTOP="Eclipse IDE Bash" \
  --build-arg BUILD_ICON="default.png" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-eclipse" \
  --build-arg BUILD_VERSION="bash" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-eclipse" \
  --build-arg FROM_VERS="javascript" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --network=pkgnet \
  --file Dockerfile \
-t ewsdocker/ldc-eclipse:bash-0.1.0-b4  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:bash-0.1.0-b4 failed."
 	exit 1
 }

. run/bash.sh

