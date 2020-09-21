#!/bin/bash
# ===========================================================================
#
#    ldc-eclipse:fortran-0.1.0-b3
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping fortran container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-eclipse-fortran-0.1.0-b3
docker rm ldc-eclipse-fortran-0.1.0-b3

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-eclipse-fortran-0.1.0-b3"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
   -it \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
   -e LMSOPT_QUIET="0" \
   -e LRUN_APP="eclipse" \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v ${HOME}/bin:/userbin \
   -v ${HOME}/.local:/usrlocal \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-eclipse-fortran-0.1.0:/root \
   -v ${HOME}/.config/docker/ldc-eclipse-fortran-0.1.0/workspace:/workspace \
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
   --name=ldc-eclipse-fortran-0.1.0-b3 \
 ewsdocker/ldc-eclipse:fortran-0.1.0-b3
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-eclipse-fortran-0.1.0-b3 failed."
 	exit 2
 }


exit 0
