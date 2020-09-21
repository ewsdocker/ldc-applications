#!/bin/bash

echo "   ********************************************"
echo "   ****"
echo "   **** stopping gimp container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-gimp-0.1.0-b3
docker rm ldc-desktop-gimp-0.1.0-b3

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-gimp-0.1.0-b3"
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
      -v ${HOME}/.config/docker/ldc-desktop-gimp-0.1.0:/root \
      -v ${HOME}/.config/docker/ldc-desktop-gimp-0.1.0/workspace:/workspace \
      \
      -v ${HOME}/Pictures/Gimp:/artwork \
      -v ${HOME}/Pictures:/pictures \
      -v ${HOME}/Documents:/www \
      \
      -e LRUN_APP="gimp" \
      --name=ldc-desktop-gimp-0.1.0-b3 \
    ewsdocker/ldc-desktop:gimp-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-gimp-0.1.0-b3 failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:gimp-0.1.0-b3 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-gimp-0.1.0-b3"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

