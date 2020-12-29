#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-games:sol${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/games

echo "   ********************************************"
echo "   ****"
echo "   **** stopping sol container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-games-sol${ldcvers}${ldcextv}
docker rm ldc-games-sol${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing sol image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-games:sol${ldcvers}${ldcextv}

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-games:sol${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg DNAME="SOL" \
  \
  --build-arg RUN_APP="sol" \
  \
  --build-arg AISLERIOT_VERS="3.22.1-1" \
  --build-arg AISLERIOT_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  \
  --build-arg BUILD_NAME="ldc-games" \
  --build-arg BUILD_VERSION="sol" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
 -t ewsdocker/ldc-games:sol${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-games:sol${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-games-sol${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/sol.sh
