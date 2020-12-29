#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-desktop:mousepad
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping mousepad container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-mousepad${ldcvers}${ldcextv}
docker rm ldc-desktop-mousepad${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-mousepad${ldcvers}${ldcextv} container"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -e LMS_HOME="${HOME}" \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -e LMSOPT_QUIET="0" \
  \
  -e LMSLIB_INST="0" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-desktop-mousepad${ldcvers}${ldcextv}:/root \
  -v ${HOME}/.config/docker/ldc-desktop-mousepad${ldcvers}${ldcextv}/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  -v ${HOME}/Pictures:/pictures \
  -v ${HOME}/Pictures/mousepad:/artwork \
  -v ${HOME}/www:/www \
  \
  -it \
  --name=ldc-desktop-mousepad${ldcvers}${ldcextv} \
ewsdocker/ldc-desktop:mousepad${ldcvers}${ldcextv} 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:mousepad${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-desktop:mousepad${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

