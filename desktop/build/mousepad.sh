#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-desktop:mousepad
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping mousepad container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-mousepad${ldcvers}${ldcextv}
docker rm ldc-desktop-mousepad${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing mousepad images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-desktop:mousepad${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:mousepad${ldcvers}${ldcextv}"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg DNAME="MPAD" \
  --build-arg RUN_APP="mousepad" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="mousepad" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk2-x11" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_INSTALL="0" \
  \
  --network="${pkgnet}" \
  --file Dockerfile \
  \
  -t ewsdocker/ldc-desktop:mousepad${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:mousepad${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-desktop-mousepad${ldcvers}${ldcextv} container"
echo "   ****"
echo "   ***********************************************"
echo

. run/mousepad.sh
