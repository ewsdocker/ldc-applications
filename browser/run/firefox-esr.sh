#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-firefox-esr
#
# ===========================================================================

echo "   *********************************************************"
echo "   ****"
echo "   **** stopping and removing ldc-firefox-esr container(s)"
echo "   ****"
echo "   *********************************************************"
echo
docker stop ldc-firefox-esr
docker rm ldc-firefox-esr

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-firefox-esr"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LRUN_APP="firefox-esr" \
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
  -v ${HOME}/.config/docker/ldc-browser-firefox-esr${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-browser-firefox-esr${ldcvers}/workspace:/workspace \
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
  --name=ldc-firefox-esr \
ewsdocker/ldc-browser:firefox-esr${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-firefox-esr failed."
 	exit 2
 }


exit 0

