#!/bin/bash

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ddia container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-dia-0.1.0-b4
docker rm ldc-desktop-dia-0.1.0-b4

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-dia-0.1.0-b4"
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
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-desktop-dia-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-desktop-dia-0.1.0/workspace:/workspace \
  \
  -v ${HOME}/Pictures/Dia:/artwork \
  -v ${HOME}/Pictures:/pictures \
  -v ${HOME}/Documents:/www \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -e LMSLIB_INST="0" \
  -e LMSLIB_HOST=http://alpine-nginx-pkgcache \
  -e LMSLIB_VERS="0.1.6" \
  -e LMSLIB_VERS_MOD="-b4" \
  \
  --name=ldc-desktop-dia-0.1.0-b4 \
ewsdocker/ldc-desktop:dia-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-dia-0.1.0-b4 failed."
 	exit 2
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:dia-0.1.0-b4 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-dia-0.1.0-b4"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

