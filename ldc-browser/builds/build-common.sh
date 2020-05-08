#!/bin/bash
# ===========================================================================
#
#    ldc-browser:dstable-common-0.1.0-b1
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping dstable-common container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-dstable-common-0.1.0-b1
docker rm ldc-browser-dstable-common-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing dstable-common image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:dstable-common-0.1.0-b1

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:dstable-common-0.1.0-b1"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg BROWSER_COMMON="1" \
  --build-arg BROWSER_BUILD="COMM" \
  --build-arg BROWSER_NAME="stable-common" \
  --build-arg BROWSER_STABLE="1" \
  --build-arg BROWSER_LABEL="Stable-Common" \
  --build-arg BROWSER_RELEASE="0.1.0" \
  --build-arg BROWSER_VERS="" \
  \
  --build-arg RUN_APP="bash" \
  \
  --build-arg BUILD_DAEMON="1" \
  --build-arg BUILD_TEMPLATE="gui" \
  --build-arg BUILD_DESKTOP="stable-common" \
  --build-arg BUILD_ICON="default.png" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="dstable-common" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-lang" \
  --build-arg FROM_VERS="dgtk3" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b1" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b1" \
  \
  --build-arg NETSURF_HOST="http://alpine-nginx-pkgcache" \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --network=pkgnet \
  \
  --file Dockerfile.browsers \
-t ewsdocker/ldc-browser:dstable-common-0.1.0-b1 .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:dstable-common-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-dstable-common-0.1.0-b1"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -d \
  --rm \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-dstable-common-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-browser-dstable-common-0.1.0/workspace:/workspace \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Source:/source \
  \
  --name=ldc-browser-dstable-common-0.1.0-b1 \
ewsdocker/ldc-browser:dstable-common-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-dstable-common-0.1.0-b1 failed."
 	exit 2
 }

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-dstable-common daemon"
echo "   ****"
echo "   ********************************************"
echo

docker stop ldc-browser-dstable-common-0.1.0-b1
[[ $? -eq 0 ]] ||
 {
 	echo "stop ldc-browser-dstable-common-0.1.0-b1 failed."
 }

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-browser:dstable-common successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

