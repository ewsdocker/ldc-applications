#!/bin/bash
# ===========================================================================
#
#    ldc-libre:office-jdk-0.1.0-b3
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-libre-office-jdk container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-libre-office-jdk-0.1.0-b3
docker rm ldc-libre-office-jdk-0.1.0-b3

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-libre-office-jdk-0.1.0-b3"
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
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-libre-office-jdk-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-libre-office-jdk-0.1.0/workspace:/workspace \
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
  --name=ldc-libre-office-jdk-0.1.0-b3 \
ewsdocker/ldc-libre:office-jdk-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-libre-office-jdk-0.1.0-b3 failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-libre:office-jdk-0.1.0-b3 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-libre-office-jdk-0.1.0-b3"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

