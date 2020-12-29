#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-eclipse:qt${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/eclipse

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-eclipse-qt container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-qt${ldcvers}${ldcextv}
docker rm ldc-eclipse-qt${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-eclipse-qt image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-eclipse:qt${ldcvers}${ldcextv}

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:qt${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="eclipse" \
  \
  --build-arg DNAME="" \
  \
  --build-arg ECLIPSE_IDE="cpp" \
  --build-arg ECLIPSE_RELEASE="2020-12" \
  --build-arg ECLIPSE_VERS="RC1" \
  --build-arg ECLIPSE_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DESKTOP="Eclipse IDE Qt" \
  --build-arg BUILD_ICON="default.png" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-eclipse" \
  --build-arg BUILD_VERSION="qt" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-eclipse" \
  --build-arg FROM_VERS="cpp" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg ECLIPSE_HOST="${pkgserver}" \
  \
  --network=pkgnet \
  \
  --file Dockerfile \
-t ewsdocker/ldc-eclipse:qt${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:qt${ldcvers}${ldcextv} failed."
 	exit 1
 }

. run/qt.sh
