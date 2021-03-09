#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-ffquantum
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-ffquantum container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-ffquantum
docker rm ldc-ffquantum

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-ffquantum"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LRUN_APP="firefox" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_HOME="${HOME}" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-ffquantum${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-browser-ffquantum${ldcvers}/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  \
  --network="${webnet}" \
  \
  --name=ldc-ffquantum \
ewsdocker/ldc-browser:ffquantum${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-ffquantum failed."
 	exit 2
 }


exit 0
