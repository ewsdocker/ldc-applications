#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ripme container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-ripme${ldcvers}${ldcextv}
docker rm ldc-desktop-ripme${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-ripme${ldcvers}${ldcextv}"
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
  -v ${HOME}/.local/ewsldc:/opt \
  \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-ripme${ldcvers}:/root \
      -v ${HOME}/.config/docker/ldc-desktop-ripme${ldcvers}/workspace:/workspace \
      \
      -v ${HOME}/Pictures/RipMe:/artwork \
      -v ${HOME}/Pictures:/pictures \
      -v ${HOME}/Documents:/www \
      \
      --name=ldc-desktop-ripme${ldcvers}${ldcextv} \
    ewsdocker/ldc-desktop:ripme${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-ripme${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:ripme${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-ripme${ldcvers}${ldcextv}"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

