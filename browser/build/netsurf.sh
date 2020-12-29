#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-browser:netsurf${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping netsurf container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-netsurf${ldcvers}${ldcextv}
docker rm ldc-browser-netsurf${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing netsurf image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-browser:netsurf${ldcvers}${ldcextv}

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:netsurf${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="NETSURF" \
  \
  --build-arg RUN_APP="netsurf" \
  \
  --build-arg BROWSER_LABEL="NetSurf" \
  --build-arg BROWSER_RELEASE="3.10-1" \
  --build-arg BROWSER_VERS="" \
  \
  --build-arg NETSURF_NAME="NetSurf" \
  --build-arg NETSURF_GENERIC="netsurf" \
  --build-arg NETSURF_DIR="/opt" \
  --build-arg NETSURF_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  --build-arg BUILD_DESKTOP="NetSurf" \
  --build-arg BUILD_ICON="Firefox-esrSmall.png" \
  \
  --build-arg BUILD_NAME="ldc-browser" \
  --build-arg BUILD_VERSION="netsurf" \
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
-t ewsdocker/ldc-browser:netsurf${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:netsurf${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-browser-netsurf${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/netsurf.sh
