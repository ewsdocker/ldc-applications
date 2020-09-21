#!/bin/bash

# ===========================================================================
#
#    ldc-browser:waterfox-current-0.1.0-b3
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-waterfox-current container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-waterfox-current-0.1.0-b3
docker rm ldc-browser-waterfox-current-0.1.0-b3

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-waterfox-current-0.1.0-b3"
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
  -v ${HOME}/.config/docker/ldc-browser-waterfox-current-0.1.0:${HOME} \
  -v ${HOME}/.config/docker/ldc-browser-waterfox-current-0.1.0/workspace:/workspace \
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
  --name=ldc-browser-waterfox-current-0.1.0-b3 \
ewsdocker/ldc-browser:waterfox-current-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-waterfox-current-0.1.0-b3 failed."
 	exit 2
 }

exit 0
