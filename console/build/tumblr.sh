#!/bin/bash
# ===========================================================================
#
#    ldc-console:tumblr-0.1.0-b3
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/console

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-tumblr container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-console-tumblr-0.1.0-b3
docker rm ldc-console-tumblr-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-console:tumblr images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-console:tumblr-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-console:tumblr-0.1.0-b3"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg CLI_APP="TMBL" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  --build-arg RUN_APP="tumblr" \
  \
  --build-arg BUILD_NAME="ldc-console" \
  --build-arg BUILD_VERSION="tumblr" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b3" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-base" \
  --build-arg FROM_VERS="dbase" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b3" \
  \
  --build-arg LIB_INSTALL=0 \
  --build-arg LIB_VERSION=0.1.6 \
  --build-arg LIB_VERS_MOD="-b3" \
  \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile \
  \
  -t ewsdocker/ldc-console:tumblr-0.1.0-b3  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:tumblr-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-console-tumblr-0.1.0-b3 container"
echo "   ****"
echo "   ***********************************************"
echo

. run/tumblr.sh
