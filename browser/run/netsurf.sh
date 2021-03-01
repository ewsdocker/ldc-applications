#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-browser:netsurf${ldcvers}${ldcextv}
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping netsurf container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-netsurf${ldcvers}${ldcextv}
docker rm ldc-browser-netsurf${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-netsurf${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e L_RUN="/bin/bash" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-netsurf${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-browser-netsurf${ldcvers}/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  -v ${HOME}/Source:/source \
  \
  --network="${webnet}" \
  \
  --name=ldc-browser-netsurf${ldcvers}${ldcextv} \
ewsdocker/ldc-browser:netsurf${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-netsurf${ldcvers}${ldcextv} failed."
 	exit 2
 }

exit 0

