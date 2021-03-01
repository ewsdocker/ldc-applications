#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:rust-0.1.0-b4
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping rust container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-rust-0.1.0-b4
docker rm ldc-eclipse-rust-0.1.0-b4

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-eclipse-rust-0.1.0-b4"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
   -it \
   -e LMSOPT_QUIET="0" \
   -e LRUN_APP="eclipse" \
   \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-eclipse-rust-0.1.0:/root \
   -v ${HOME}/.config/docker/ldc-eclipse-rust-0.1.0/workspace:/workspace \
   \
   -e DISPLAY=unix${DISPLAY} \
   -v ${HOME}/.Xauthority:/root/.Xauthority \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /dev/shm:/dev/shm \
   --device /dev/snd \
   \
   -v ${HOME}/Development:/Development \
   -v ${HOME}/Source:/Source \
   \
   --name=ldc-eclipse-rust-0.1.0-b4 \
 ewsdocker/ldc-eclipse:rust-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-eclipse-rust-0.1.0-b4 failed."
 	exit 2
 }


exit 0
