#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-console:tumblr${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-tumblr container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-console-tumblr${ldcvers}${ldcextv}
docker rm ldc-console-tumblr${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-console-tumblr${ldcvers}${ldcextv} container"
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
  -e LMSLIB_INSTALL="0" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-console-tumblr${ldcvers}${ldcextv}:/root \
  -v ${HOME}/.config/docker/ldc-console-tumblr${ldcvers}${ldcextv}/workspace:/workspace \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Pictures/Tumblr:/data \
  \
  --name=ldc-console-tumblr${ldcvers}${ldcextv} \
ewsdocker/ldc-console:tumblr${ldcvers}${ldcextv} 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:tumblr${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-console:tumblr${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

