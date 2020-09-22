#!/bin/bash
# ===========================================================================
#
#    ldc-browser:palemoon-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-palemoon container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-palemoon-0.1.0-b4
docker rm ldc-browser-palemoon-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser:palemoon image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:palemoon-0.1.0-b4

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:palemoon-0.1.0-b4"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="PMOON" \
  \
  --build-arg RUN_APP="palemoon" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BROWSER_LABEL="Pale Moon" \
  --build-arg BROWSER_RELEASE="28" \
  --build-arg BROWSER_VERS="10.0" \
  \
  --build-arg PALEMOON_NAME="Pale Moon" \
  --build-arg PALEMOON_GENERIC="palemoon" \
  --build-arg PALEMOON_DIR="/opt" \
  --build-arg PALEMOON_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="palemoon" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk2-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b4" \
  \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  \
  --network=pkgnet \
  \
  --file Dockerfile \
-t ewsdocker/ldc-browser:palemoon-0.1.0-b4 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:palemoon-0.1.0-b4 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-browser-palemoon-0.1.0-b4"
echo "   ****"
echo "   ***********************************************"
echo

. run/palemoon.sh
