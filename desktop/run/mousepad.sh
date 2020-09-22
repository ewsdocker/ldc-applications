#!/bin/bash
# ===========================================================================
#
#    ldc-desktop:mousepad-0.1.0
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping mousepad container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-mousepad-0.1.0-b4
docker rm ldc-desktop-mousepad-0.1.0-b4

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-mousepad-0.1.0-b4 container"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -e LMS_HOME="${HOME}" \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -e LMSOPT_QUIET="0" \
  \
  -e LMSLIB_INST="0" \
  -e LMSLIB_HOST=http://alpine-nginx-pkgcache \
  -e LMSLIB_VERS="0.1.6" \
  -e LMSLIB_VERS_MOD="-b4" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-desktop-mousepad-0.1.0-b4:/root \
  -v ${HOME}/.config/docker/ldc-desktop-mousepad-0.1.0-b4/workspace:/workspace \
  \
  -e DISPLAY=unix${DISPLAY} \
  -v ${HOME}/.Xauthority:/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/shm:/dev/shm \
  --device /dev/snd \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Documents:/Documents \
  -v ${HOME}/Pictures:/pictures \
  -v ${HOME}/Pictures/mousepad:/artwork \
  -v ${HOME}/www:/www \
  \
  -it \
  --name=ldc-desktop-mousepad-0.1.0-b4 \
ewsdocker/ldc-desktop:mousepad-0.1.0-b4 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:mousepad-0.1.0-b4 failed."
 	exit 2
 }

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-desktop:mousepad-0.1.0-b4 successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

