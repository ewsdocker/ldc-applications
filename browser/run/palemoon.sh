#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-browser:palemoon${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-palemoon container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-palemoon${ldcvers}${ldcextv}
docker rm ldc-browser-palemoon${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-palemoon${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LMSOPT_QUIET=0 \
  -e LRUN_APP="palemoon" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-palemoon${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-browser-palemoon${ldcvers}/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Source:/source \
  \
  --network="${webnet}" \
  \
  --name=ldc-browser-palemoon${ldcvers}${ldcextv} \
ewsdocker/ldc-browser:palemoon${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-palemoon${ldcvers}${ldcextv} failed."
 	exit 2
 }

exit 0

