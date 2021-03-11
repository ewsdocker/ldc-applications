#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

echo "   ********************************************"
echo "   ****"
echo "   **** stopping shotcut container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-shotcut${ldcvers}${ldcextv}
docker rm ldc-desktop-shotcut${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-shotcut${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
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
  -v ${HOME}/.config/docker/ldc-desktop-shotcut${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-desktop-shotcut${ldcvers}/workspace:/workspace \
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
  --name=ldc-desktop-shotcut${ldcvers}${ldcextv} \
ewsdocker/ldc-desktop:shotcut${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-shotcut${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:shotcut${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-shotcut${ldcvers}${ldcextv}"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

