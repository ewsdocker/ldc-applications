#!/bin/bash
# ===========================================================================
#
#    ldc-console:nano-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/console

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-nano container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-console-nano-0.1.0-b4
docker rm ldc-console-nano-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-console:nano images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-console:nano-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-console:nano-0.1.0-b4"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg CLI_APP="NANO" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  --build-arg RUN_APP="nano" \
  \
  --build-arg BUILD_NAME="ldc-console" \
  --build-arg BUILD_VERSION="nano" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-base" \
  --build-arg FROM_VERS="dbase" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --build-arg LIB_INSTALL=0 \
  --build-arg LIB_VERSION=0.1.6 \
  --build-arg LIB_VERS_MOD="-b4" \
  \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile \
  \
  -t ewsdocker/ldc-console:nano-0.1.0-b4  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:nano-0.1.0-b4 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-console-nano-0.1.0-b4 container"
echo "   ****"
echo "   ***********************************************"
echo

. run/nano.sh
