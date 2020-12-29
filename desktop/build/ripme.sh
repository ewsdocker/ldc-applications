#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ripme container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-ripme${ldcvers}${ldcextv}
docker rm ldc-desktop-ripme${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ripme image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:ripme${ldcvers}${ldcextv}

# ===========================================================================
#
#    ldc-desktop:ripme${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:ripme${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="RIPME" \
  --build-arg RUN_APP="ripme" \
  \
  --build-arg RIPME_VER="1.7" \
  --build-arg RIPME_EXT=".92" \
  --build-arg RIPME_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="ripme" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="djre8-gtk2" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_INSTALL="0" \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
  -t ewsdocker/ldc-desktop:ripme${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:ripme${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-desktop-ripme${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/ripme.sh
