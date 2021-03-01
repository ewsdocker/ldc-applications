#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-browser:palemoon${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-palemoon container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-palemoon${ldcvers}${ldcextv}
docker rm ldc-browser-palemoon${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser:palemoon image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:palemoon${ldcvers}${ldcextv}

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:palemoon${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="PMOON" \
  \
  --build-arg RUN_APP="palemoon" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BROWSER_LABEL="Pale Moon" \
  --build-arg BROWSER_RELEASE="28" \
  --build-arg BROWSER_VERS="17.0" \
  \
  --build-arg PALEMOON_NAME="Pale Moon" \
  --build-arg PALEMOON_GENERIC="palemoon" \
  --build-arg PALEMOON_DIR="/opt" \
  --build-arg PALEMOON_HOST="${pkgserver}" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="palemoon" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk2-x11" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
-t ewsdocker/ldc-browser:palemoon${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:palemoon${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-browser-palemoon${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/palemoon.sh
