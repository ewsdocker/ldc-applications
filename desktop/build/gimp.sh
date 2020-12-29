#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping gimp container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-gimp${ldcvers}${ldcextv}
docker rm ldc-desktop-gimp${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing gimp image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:gimp${ldcvers}${ldcextv}

# ===========================================================================
#
#    ldc-desktop:gimp${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:dgimp-fortran-jdk11-fortran-jdk11-gtk3${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="gimp" \
  --build-arg DNAME="GIMP" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="gimp" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="dfortran-jdk13" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg GIMP_HOST="${pkgserver}" \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
  -t ewsdocker/ldc-desktop:gimp${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:gimp${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-desktop-gimp${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

. run/gimp.sh
