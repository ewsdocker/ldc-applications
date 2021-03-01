#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-libre:office${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-libre-office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-libre-office${ldcvers}${ldcextv}
docker rm ldc-libre-office${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-libre-office${ldcvers}${ldcextv}"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-libre-office${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-libre-office${ldcvers}/workspace:/workspace \
  -v ${HOME}/.config/mimeapps.list:/root/.config/mimeapps.list \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Documents:/documents \
  -v ${HOME}/Source:/source \
  -v /media/AdultLib-1:/adultlib \
  \
  --name=ldc-libre-office-lib \
ewsdocker/ldc-libre:office${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-libre-office${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-libre:office${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-libre-office${ldcvers}${ldcextv}"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

