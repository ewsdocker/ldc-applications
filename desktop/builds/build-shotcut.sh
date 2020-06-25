#!/bin/bash
cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping shotcut container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-shotcut-0.1.0-b3
docker rm ldc-desktop-shotcut-0.1.0-b3

echo "   ********************************************"
echo "   ****"
echo "   **** removing shotcut image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:shotcut-0.1.0-b3

# ===========================================================================
#
#    ldc-desktop:shotcut-0.1.0-b3
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:shotcut-0.1.0-b3"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="shotcut" \
  --build-arg DNAME="SHOTCUT" \
  \
  --build-arg SHOTCUT_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="shotcut" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b3" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack" \
  --build-arg FROM_VERS="dcc-x11" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b3" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b3" \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  \
  --network=pkgnet \
  --file Dockerfile \
  \
-t ewsdocker/ldc-desktop:shotcut-0.1.0-b3  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:shotcut-0.1.0-b3 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-shotcut-0.1.0-b3"
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
  -v ${HOME}/.config/docker/ldc-desktop-shotcut-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-desktop-shotcut-0.1.0/workspace:/workspace \
  \
  -v ${HOME}/Videos:/videos \
  -v ${HOME}/Audios:/audios \
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
  -e LMSLIB_VERS_MOD="-b3" \
  \
  --name=ldc-desktop-shotcut-0.1.0-b3 \
ewsdocker/ldc-desktop:shotcut-0.1.0-b3
#[[ $? -eq 0 ]] ||
# {
# 	echo "create container ldc-desktop-shotcut-0.1.0-b3 failed."
# 	exit 1
# }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:shotcut-0.1.0-b3 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-shotcut-0.1.0-b3"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

