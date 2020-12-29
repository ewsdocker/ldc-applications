#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

echo "   ********************************************"
echo "   ****"
echo "   **** stopping gimp container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-gimp${ldcvers}${ldcextv}
docker rm ldc-desktop-gimp${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-gimp${ldcvers}${ldcextv}"
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
      -e DISPLAY=unix${DISPLAY} \
      -v ${HOME}/.Xauthority:/root/.Xauthority \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /dev/shm:/dev/shm \
      --device /dev/snd \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-gimp${ldcvers}:/root \
      -v ${HOME}/.config/docker/ldc-desktop-gimp${ldcvers}/workspace:/workspace \
      \
      -v ${HOME}/Pictures/Gimp:/artwork \
      -v ${HOME}/Pictures:/pictures \
      -v ${HOME}/Documents:/www \
      \
      -e LRUN_APP="gimp" \
      --name=ldc-desktop-gimp${ldcvers}${ldcextv} \
    ewsdocker/ldc-desktop:gimp${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-gimp${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:gimp${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-gimp${ldcvers}${ldcextv}"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

