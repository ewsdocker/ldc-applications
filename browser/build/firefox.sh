#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-browser:firefox${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping firefox container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-firefox${ldcvers}${ldcextv}
docker rm ldc-browser-firefox${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing firefox image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:firefox${ldcvers}${ldcextv}

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:firefox${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="FFOX" \
  \
  --build-arg RUN_APP="firefox" \
  \
  --build-arg BROWSER_LABEL="Firefox" \
  --build-arg BROWSER_RELEASE="84" \
  --build-arg BROWSER_VERS="0-3" \
  \
  --build-arg FIREFOX_NAME="Firefox Unstable" \
  --build-arg FIREFOX_GENERIC="firefox" \
  --build-arg FIREFOX_DIR="/opt" \
  --build-arg FIREFOX_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="firefox" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --network="${pkgnet}" \
  --file Dockerfile \
-t ewsdocker/ldc-browser:firefox${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:firefox${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-browser-firefox${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/firefox.sh
