#!/bin/bash
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-waterfox-current container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-waterfox-current-0.1.0-b3
docker rm ldc-browser-waterfox-current-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser:waterfox-current image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:waterfox-current-0.1.0-b3

# ===========================================================================
#
#    ldc-browser:waterfox-current-0.1.0-b3
#
# ===========================================================================

echo
echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:waterfox-current-0.1.0-b3"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="WCFOX" \
  \
  --build-arg RUN_APP="waterfox" \
  \
  --build-arg BROWSER_LABEL="Waterfox Current" \
  --build-arg BROWSER_RELEASE="2020" \
  --build-arg BROWSER_VERS="06" \
  \
  --build-arg WATERFOX_NAME="Waterfox Current" \
  --build-arg WATERFOX_GENERIC="waterfox-current" \
  --build-arg WATERFOX_DIR="/opt" \
  --build-arg WATERFOX_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="waterfox-current" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b3" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b3" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b3" \
  \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --network=pkgnet \
  \
  --file Dockerfile \
-t ewsdocker/ldc-browser:waterfox-current-0.1.0-b3 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:waterfox-current-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-browser-waterfox-current-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

. run/waterfox-current.sh
