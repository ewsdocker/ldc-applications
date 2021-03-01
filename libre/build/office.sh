#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-libre:office${ldcvers}${ldcextv}
#
# ===========================================================================

cd ~/Development/ewsldc/ldc-applications/libre

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-libre-office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-libre-office${ldcvers}${ldcextv}
docker rm ldc-libre-office${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-libre:office image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-libre:office${ldcvers}${ldcextv}

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-libre:office${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="libreoffice" \
  --build-arg OFFICE_VER="7.0.4" \
  \
  --build-arg DNAME="NONJS" \
  \
  --build-arg BUILD_BASE="/usr/local/" \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-libre" \
  --build-arg BUILD_VERSION="office" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dgtk3-x11" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg OFFICE_HOST="${pkgserver}" \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
  -t ewsdocker/ldc-libre:office${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-libre:office${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-libre-office${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/office.sh
