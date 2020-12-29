#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:rust-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/eclipse

echo "   ********************************************"
echo "   ****"
echo "   **** stopping rust container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-rust-0.1.0-b4
docker rm ldc-eclipse-rust-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing rust image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-eclipse:rust-0.1.0-b4

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:rust-0.1.0-b4"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="eclipse" \
  \
  --build-arg DNAME="RUST" \
  \
  --build-arg PLUGINS="npm" \
  --build-arg PLUGINS_ONLY="0"\
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
  --build-arg rust_HOST="http://alpine-nginx-pkgcache" \
  --build-arg rust_VER="14" \
  \
  --build-arg NPM_INSTALL="bash-language-server" \
  \
  --build-arg ECLIPSE_HOST="http://alpine-nginx-pkgcache" \
  --build-arg ECLIPSE_IDE="rust" \
  --build-arg ECLIPSE_RELEASE="2020-12" \
  --build-arg ECLIPSE_VERS="RC1" \
  \
  --build-arg BUILD_DESKTOP="Eclipse IDE rust" \
  --build-arg BUILD_ICON="default.png" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-eclipse" \
  --build-arg BUILD_VERSION="rust" \
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
-t ewsdocker/ldc-eclipse:rust-0.1.0-b4  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:rust-0.1.0-b4 failed."
 	exit 1
 }

. run/rust.sh
