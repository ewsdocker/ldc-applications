#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-games:mahjongg${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/games

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-games-mahjongg container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-games-mahjongg${ldcvers}${ldcextv}
docker rm ldc-games-mahjongg${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-games:mahjongg image(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-games:mahjongg${ldcvers}${ldcextv}

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-games:mahjongg${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg DNAME="MAJ" \
  \
  --build-arg RUN_APP="gnome-mahjongg" \
  \
  --build-arg MAHJONGG_VERS="3.22.0-4" \
  --build-arg MAHJONGG_HOST="${pkgserver}" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  \
  --build-arg BUILD_NAME="ldc-games" \
  --build-arg BUILD_VERSION="mahjongg" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_INSTALL="0" \
  \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
 -t ewsdocker/ldc-games:mahjongg${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-games:mahjongg${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-games-mahjongg${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/mahjongg.sh
