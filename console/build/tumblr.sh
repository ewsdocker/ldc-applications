#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-console:tumblr${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/console

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-tumblr container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-console-tumblr${ldcvers}${ldcextv}
docker rm ldc-console-tumblr${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-console:tumblr images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-console:tumblr${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-console:tumblr${ldcvers}${ldcextv}"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg CLI_APP="TMBL" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  --build-arg RUN_APP="tumblr" \
  \
  --build-arg BUILD_NAME="ldc-console" \
  --build-arg BUILD_VERSION="tumblr" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-base" \
  --build-arg FROM_VERS="dbase" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_INSTALL=0 \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
  \
  -t ewsdocker/ldc-console:tumblr${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:tumblr${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-console-tumblr${ldcvers}${ldcextv} container"
echo "   ****"
echo "   ***********************************************"
echo

. run/tumblr.sh
