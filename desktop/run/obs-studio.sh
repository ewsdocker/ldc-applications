#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

echo "   ********************************************"
echo "   ****"
echo "   **** stopping obs-studio container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-obs-studio${ldcvers}${ldcextv}
docker rm ldc-desktop-obs-studio${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-obs-studio${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LRUN_APP="bash" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_HOME="${HOME}" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-desktop-obs-studio${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-desktop-obs-studio${ldcvers}/workspace:/workspace \
  \
  -v ${HOME}/Videos:/videos \
  -v ${HOME}/Audios:/audios \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -e LMSLIB_INST="0" \
  \
  --name=ldc-desktop-obs-studio${ldcvers}${ldcextv} \
ewsdocker/ldc-desktop:obs-studio${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-obs-studio${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:obs-studio${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-obs-studio${ldcvers}${ldcextv}"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

