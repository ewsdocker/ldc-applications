#!/bin/bash
cd ~/Development/ewslms/ldc-libre

echo "   ********************************************"
echo "   ****"
echo "   **** stopping office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-libre-office-0.1.0

# ===========================================================================
#
#    ldc-libre:office-0.1.0
#
# ===========================================================================

echo
echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-libre-office-0.1.0"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
      -it \
      -e LRUN_APP="libreoffice" \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-libre-office-0.1.0:/root \
      -v ${HOME}/.config/docker/ldc-libre-office-0.1.0/workspace:/workspace \
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
      --name=ldc-libre-office-0.1.0 \
    ewsdocker/ldc-libre:office-0.1.0
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-libre-office-0.1.0 failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-libre:office-0.1.0 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-libre-office-0.1.0"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

