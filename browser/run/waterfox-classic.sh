#!/bin/bash

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-dwaterfox container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-waterfox-0.1.0-b4
docker rm ldc-browser-waterfox-0.1.0-b4

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-waterfox-0.1.0-b4"
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
  -v ${HOME}/.config/docker/ldc-browser-waterfox-0.1.0:${HOME} \
  -v ${HOME}/.config/docker/ldc-browser-waterfox-0.1.0/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Source:/source \
  \
  --network=webnet \
  \
  --name=ldc-browser-waterfox-0.1.0-b4 \
ewsdocker/ldc-browser:waterfox-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-waterfox-0.1.0-b4 failed."
 	exit 2
 }

exit 0

