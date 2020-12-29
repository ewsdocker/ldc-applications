#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ddia container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-dia${ldcvers}${ldcextv}
docker rm ldc-desktop-dia${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ddia image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:dia${ldcvers}${ldcextv}

# ===========================================================================
#
#    ldc-desktop:dia${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:dia${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="dia" \
  --build-arg DNAME="DIA" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="dia" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="dfortran-gtk2" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_INSTALL="0" \
  \
  --network=pkgnet \
  --file Dockerfile \
  \
-t ewsdocker/ldc-desktop:dia${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:dia${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-desktop-dia${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/dia.sh
