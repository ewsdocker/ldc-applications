#!/bin/bash

# ===========================================================================
#
#    ldc-browser:ffquantum-0.1.0-b3
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser-ffquantum container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-browser-ffquantum-0.1.0-b3
docker rm ldc-browser-ffquantum-0.1.0-b3

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-browser-ffquantum-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  -e LRUN_APP="firefox" \
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
  -v ${HOME}/.config/docker/ldc-browser-ffquantum-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-browser-ffquantum-0.1.0/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  \
  --name=ldc-browser-ffquantum-0.1.0-b3 \
ewsdocker/ldc-browser:ffquantum-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-browser-ffquantum-0.1.0-b3 failed."
 	exit 2
 }


exit 0

