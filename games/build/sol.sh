#!/bin/bash
# ===========================================================================
#
#    ldc-games:sol-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/games

echo "   ********************************************"
echo "   ****"
echo "   **** stopping sol container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-games-sol-0.1.0-b4
docker rm ldc-games-sol-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing sol image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-games:sol-0.1.0-b4

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-games:sol-0.1.0-b4"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg DNAME="SOL" \
  \
  --build-arg RUN_APP="sol" \
  \
  --build-arg AISLERIOT_VERS="3.22.1-1" \
  --build-arg AISLERIOT_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  \
  --build-arg BUILD_NAME="ldc-games" \
  --build-arg BUILD_VERSION="sol" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --network=pkgnet\
  \
  --file Dockerfile \
 -t ewsdocker/ldc-games:sol-0.1.0-b4 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-games:sol-0.1.0-b4 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-games-sol-0.1.0-b4"
echo "   ****"
echo "   ***********************************************"
echo

. run/sol.sh
