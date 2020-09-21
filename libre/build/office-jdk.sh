#!/bin/bash
# ===========================================================================
#
#    ldc-libre:office-jdk-0.1.0-b3
#
# ===========================================================================

cd ~/Development/ewsldc/ldc-applications/libre

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-libre-office-jdk container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-libre-office-jdk-0.1.0-b3
docker rm ldc-libre-office-jdk-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-libre:office-jdk image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-libre:office-jdk-0.1.0-b3

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-libre:office-jdk-0.1.0-b3"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="libreoffice" \
  --build-arg OFFICE_VER="6.4.4" \
  \
  --build-arg DNAME="NONJS" \
  \
  --build-arg NODEJS_HOST="http://alpine-nginx-pkgcache" \
  --build-arg NODEJS_VER="14" \
  \
  --build-arg BUILD_BASE="/usr/local/" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-libre" \
  --build-arg BUILD_VERSION="office-jdk" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b3" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="djdk13-gtk3" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b3" \
  \
  --build-arg OFFICE_HOST=http://alpine-nginx-pkgcache \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile \
  -t ewsdocker/ldc-libre:office-jdk-0.1.0-b3  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-libre:office-jdk-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** creating ldc-libre-office-jdk-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

, run/office-jdk.sh
