#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-console:nano${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-nano container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-console-nano${ldcvers}${ldcextv}
docker rm ldc-console-nano${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-console-nano${ldcvers}${ldcextv} container"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -e LMS_HOME="${HOME}" \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -e LMSOPT_QUIET="0" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-console-nano${ldcvers}${ldcextv}:/root \
  -v ${HOME}/.config/docker/ldc-console-nano${ldcvers}${ldcextv}/workspace:/workspace \
  \
  -v ${HOME}/Downloads:/Downloads \
  \
  --name=ldc-console-nano${ldcvers}${ldcextv} \
ewsdocker/ldc-console:nano${ldcvers}${ldcextv} 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:nano${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-console:nano${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

