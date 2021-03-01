#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-dwaterfox container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-waterfox${ldcvers}${ldcextv}
docker rm ldc-browser-waterfox${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser:dwaterfox image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:waterfox${ldcvers}${ldcextv}

# ===========================================================================
#
#    ldc-browser:waterfox${ldcvers}${ldcextv}
#
# ===========================================================================

echo
echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:waterfox${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="WFOX" \
  \
  --build-arg RUN_APP="waterfox" \
  \
  --build-arg BROWSER_LABEL="Waterfox Classic" \
  --build-arg BROWSER_RELEASE="2020" \
  --build-arg BROWSER_VERS="12" \
  \
  --build-arg WATERFOX_NAME="Waterfox Classic" \
  --build-arg WATERFOX_GENERIC="waterfox-classic" \
  --build-arg WATERFOX_DIR="/opt" \
  --build-arg WATERFOX_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="waterfox" \
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
  \
  --file Dockerfile \
-t ewsdocker/ldc-browser:waterfox${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:waterfox${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-browser-waterfox${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/waterfox-classic.sh
