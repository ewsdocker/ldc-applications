#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-console:nano${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/console

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-nano container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-console-nano${ldcvers}${ldcextv}
docker rm ldc-console-nano${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-console:nano images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-console:nano${ldcvers}${ldcextv}

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-console:nano${ldcvers}${ldcextv}"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg CLI_APP="NANO" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  --build-arg RUN_APP="nano" \
  \
  --build-arg BUILD_NAME="ldc-console" \
  --build-arg BUILD_VERSION="nano" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-base" \
  --build-arg FROM_VERS="dbase" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --network="${pkgnet}" \
  \
  --file Dockerfile \
  \
  -t ewsdocker/ldc-console:nano${ldcvers}${ldcextv}  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:nano${ldcvers}${ldcextv} failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** created ldc-console-nano${ldcvers}${ldcextv} container"
echo "   ****"
echo "   ***********************************************"
echo

. run/nano.sh
