#!/bin/bash
# ===========================================================================
#
#    ldc-browser:netsurf-0.1.0-b4
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/browser

echo "   ********************************************"
echo "   ****"
echo "   **** stopping netsurf container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-netsurf-0.1.0-b4
docker rm ldc-browser-netsurf-0.1.0-b4

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-netsurf-0.1.0-b4"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e L_RUN="/bin/bash" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-browser-netsurf-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-browser-netsurf-0.1.0/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  -v ${HOME}/Source:/source \
  \
  --name=ldc-browser-netsurf-0.1.0-b4 \
ewsdocker/ldc-browser:netsurf-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-netsurf-0.1.0-b4 failed."
 	exit 2
 }

exit 0

