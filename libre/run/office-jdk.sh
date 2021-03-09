#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# ===========================================================================
#
#    ldc-libre:office-jdk${ldcvers}${ldcextv}
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-libre-office-jdk container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-libre-office-jdk${ldcvers}${ldcextv}
docker rm ldc-libre-office-jdk${ldcvers}${ldcextv}

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-libre-office-jdk${ldcvers}${ldcextv}"
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
  \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-libre-office-jdk${ldcvers}:/root \
  -v ${HOME}/.config/docker/ldc-libre-office-jdk${ldcvers}/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Documents:/documents \
  -v ${HOME}/Source:/source \
  \
  --name=ldc-libre-office-jdk${ldcvers}${ldcextv} \
ewsdocker/ldc-libre:office-jdk${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-libre-office-jdk${ldcvers}${ldcextv} failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-libre-office-jdk${ldcvers}${ldcextv} successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-libre-office-jdk${ldcvers}${ldcextv}"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

