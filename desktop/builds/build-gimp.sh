#!/bin/bash
cd ~/Development/ewsldc/ldc-applications/desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping gimp container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-desktop-gimp-0.1.0-b2
docker rm ldc-desktop-gimp-0.1.0-b2

echo "   ********************************************"
echo "   ****"
echo "   **** removing gimp image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:gimp-0.1.0-b2

# ===========================================================================
#
#    ldc-desktop:gimp-0.1.0-b2
#
# ===========================================================================

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:dgimp-fortran-jdk11-fortran-jdk11-gtk3-0.1.0-b2"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
  --build-arg RUN_APP="gimp" \
  --build-arg DNAME="GIMP" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="gui" \
  \
  --build-arg BUILD_NAME="ldc-desktop" \
  --build-arg BUILD_VERSION="gimp" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b2" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-apps" \
  --build-arg FROM_VERS="dfortran-jdk13" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b2" \
  \
  --build-arg LIB_INSTALL="0" \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b2" \
  \
  --build-arg LIB_HOST="http://alpine-nginx-pkgcache" \
  --build-arg GIMP_HOST="http://alpine-nginx-pkgcache" \
  --network=pkgnet \
  \
  --file Dockerfile \
  -t ewsdocker/ldc-desktop:gimp-0.1.0-b2  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:gimp-0.1.0-b2 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-gimp-0.1.0-b2"
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
      --name=ldc-desktop-gimp-0.1.0-b2 \
    ewsdocker/ldc-desktop:gimp-0.1.0-b2
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-gimp-0.1.0-b2 failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:gimp-0.1.0-b2 successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-gimp-0.1.0-b2"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

