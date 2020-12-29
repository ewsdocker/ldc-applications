#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping shotcut container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-shotcut${ldcvers}${ldcextv}
docker rm ldc-desktop-shotcut${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing shotcut image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:shotcut${ldcvers}${ldcextv}

# ===========================================================================
#
#    ldc-desktop:shotcut${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:shotcut${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="shotcut" \
  --build-arg DNAME="SHOTCUT" \
  \
  --build-arg SHOTCUT_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="shotcut" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dcc-x11" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_INSTALL="0" \
  \
  --network="${pkgnet}" \
  --file Dockerfile \
  \
-t ewsdocker/ldc-desktop:shotcut${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:shotcut${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-desktop-shotcut${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/shotcut.sh
