#!/bin/bash
cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping obs-studio container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-obs-studio-0.1.0-b4
docker rm ldc-desktop-obs-studio-0.1.0-b4

echo "   ********************************************"
echo "   ****"
echo "   **** removing obs-studio image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:obs-studio-0.1.0-b4

# ===========================================================================
#
#    ldc-desktop:obs-studio-0.1.0-b4
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:obs-studio-0.1.0-b4"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="bash" \
  --build-arg DNAME="OBS" \
  \
  --build-arg OBSSTUDIO_VER="22.0.3" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="obs-studio" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dcc-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b4" \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  \
  --network=pkgnet \
  --file Dockerfile \
  \
-t ewsdocker/ldc-desktop:obs-studio-0.1.0-b4  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:obs-studio-0.1.0-b4 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-desktop-obs-studio-0.1.0-b4"
echo "   ****"
echo "   ***********************************************"
echo

. run/obs-studio.sh
